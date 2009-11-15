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
.sub "_block11"  :anon :subid("10_1258264446.59978")
.annotate "line", 0
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    capture_lex $P14
.annotate "line", 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    capture_lex $P14
    $P1064 = $P14()
.annotate "line", 1
    .return ($P1064)
.end


.namespace []
.sub "" :load :init :subid("post311") :outer("10_1258264446.59978")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1258264446.59978" 
    .local pmc block
    set block, $P12
    $P1065 = get_root_global ["parrot"], "P6metaclass"
    $P1065."new_class"("NQP::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "_block13"  :subid("11_1258264446.59978") :outer("10_1258264446.59978")
.annotate "line", 4
    get_hll_global $P1013, ["NQP";"Regex"], "_block1012" 
    capture_lex $P1013
    .const 'Sub' $P1007 = "296_1258264446.59978" 
    capture_lex $P1007
    .const 'Sub' $P1002 = "294_1258264446.59978" 
    capture_lex $P1002
    .const 'Sub' $P996 = "292_1258264446.59978" 
    capture_lex $P996
    .const 'Sub' $P990 = "290_1258264446.59978" 
    capture_lex $P990
    .const 'Sub' $P984 = "288_1258264446.59978" 
    capture_lex $P984
    .const 'Sub' $P978 = "286_1258264446.59978" 
    capture_lex $P978
    .const 'Sub' $P973 = "284_1258264446.59978" 
    capture_lex $P973
    .const 'Sub' $P967 = "282_1258264446.59978" 
    capture_lex $P967
    .const 'Sub' $P961 = "280_1258264446.59978" 
    capture_lex $P961
    .const 'Sub' $P955 = "278_1258264446.59978" 
    capture_lex $P955
    .const 'Sub' $P949 = "276_1258264446.59978" 
    capture_lex $P949
    .const 'Sub' $P943 = "274_1258264446.59978" 
    capture_lex $P943
    .const 'Sub' $P937 = "272_1258264446.59978" 
    capture_lex $P937
    .const 'Sub' $P931 = "270_1258264446.59978" 
    capture_lex $P931
    .const 'Sub' $P925 = "268_1258264446.59978" 
    capture_lex $P925
    .const 'Sub' $P919 = "266_1258264446.59978" 
    capture_lex $P919
    .const 'Sub' $P913 = "264_1258264446.59978" 
    capture_lex $P913
    .const 'Sub' $P907 = "262_1258264446.59978" 
    capture_lex $P907
    .const 'Sub' $P901 = "260_1258264446.59978" 
    capture_lex $P901
    .const 'Sub' $P895 = "258_1258264446.59978" 
    capture_lex $P895
    .const 'Sub' $P889 = "256_1258264446.59978" 
    capture_lex $P889
    .const 'Sub' $P883 = "254_1258264446.59978" 
    capture_lex $P883
    .const 'Sub' $P877 = "252_1258264446.59978" 
    capture_lex $P877
    .const 'Sub' $P871 = "250_1258264446.59978" 
    capture_lex $P871
    .const 'Sub' $P865 = "248_1258264446.59978" 
    capture_lex $P865
    .const 'Sub' $P859 = "246_1258264446.59978" 
    capture_lex $P859
    .const 'Sub' $P853 = "244_1258264446.59978" 
    capture_lex $P853
    .const 'Sub' $P847 = "242_1258264446.59978" 
    capture_lex $P847
    .const 'Sub' $P841 = "240_1258264446.59978" 
    capture_lex $P841
    .const 'Sub' $P835 = "238_1258264446.59978" 
    capture_lex $P835
    .const 'Sub' $P829 = "236_1258264446.59978" 
    capture_lex $P829
    .const 'Sub' $P823 = "234_1258264446.59978" 
    capture_lex $P823
    .const 'Sub' $P817 = "232_1258264446.59978" 
    capture_lex $P817
    .const 'Sub' $P811 = "230_1258264446.59978" 
    capture_lex $P811
    .const 'Sub' $P805 = "228_1258264446.59978" 
    capture_lex $P805
    .const 'Sub' $P799 = "226_1258264446.59978" 
    capture_lex $P799
    .const 'Sub' $P793 = "224_1258264446.59978" 
    capture_lex $P793
    .const 'Sub' $P787 = "222_1258264446.59978" 
    capture_lex $P787
    .const 'Sub' $P781 = "220_1258264446.59978" 
    capture_lex $P781
    .const 'Sub' $P775 = "218_1258264446.59978" 
    capture_lex $P775
    .const 'Sub' $P770 = "216_1258264446.59978" 
    capture_lex $P770
    .const 'Sub' $P765 = "214_1258264446.59978" 
    capture_lex $P765
    .const 'Sub' $P761 = "212_1258264446.59978" 
    capture_lex $P761
    .const 'Sub' $P756 = "210_1258264446.59978" 
    capture_lex $P756
    .const 'Sub' $P751 = "208_1258264446.59978" 
    capture_lex $P751
    .const 'Sub' $P747 = "206_1258264446.59978" 
    capture_lex $P747
    .const 'Sub' $P743 = "204_1258264446.59978" 
    capture_lex $P743
    .const 'Sub' $P737 = "202_1258264446.59978" 
    capture_lex $P737
    .const 'Sub' $P731 = "200_1258264446.59978" 
    capture_lex $P731
    .const 'Sub' $P724 = "198_1258264446.59978" 
    capture_lex $P724
    .const 'Sub' $P720 = "196_1258264446.59978" 
    capture_lex $P720
    .const 'Sub' $P716 = "194_1258264446.59978" 
    capture_lex $P716
    .const 'Sub' $P709 = "192_1258264446.59978" 
    capture_lex $P709
    .const 'Sub' $P702 = "190_1258264446.59978" 
    capture_lex $P702
    .const 'Sub' $P698 = "188_1258264446.59978" 
    capture_lex $P698
    .const 'Sub' $P694 = "186_1258264446.59978" 
    capture_lex $P694
    .const 'Sub' $P689 = "184_1258264446.59978" 
    capture_lex $P689
    .const 'Sub' $P684 = "182_1258264446.59978" 
    capture_lex $P684
    .const 'Sub' $P679 = "180_1258264446.59978" 
    capture_lex $P679
    .const 'Sub' $P674 = "178_1258264446.59978" 
    capture_lex $P674
    .const 'Sub' $P670 = "176_1258264446.59978" 
    capture_lex $P670
    .const 'Sub' $P666 = "174_1258264446.59978" 
    capture_lex $P666
    .const 'Sub' $P654 = "170_1258264446.59978" 
    capture_lex $P654
    .const 'Sub' $P649 = "168_1258264446.59978" 
    capture_lex $P649
    .const 'Sub' $P643 = "166_1258264446.59978" 
    capture_lex $P643
    .const 'Sub' $P638 = "164_1258264446.59978" 
    capture_lex $P638
    .const 'Sub' $P631 = "162_1258264446.59978" 
    capture_lex $P631
    .const 'Sub' $P624 = "160_1258264446.59978" 
    capture_lex $P624
    .const 'Sub' $P619 = "158_1258264446.59978" 
    capture_lex $P619
    .const 'Sub' $P614 = "156_1258264446.59978" 
    capture_lex $P614
    .const 'Sub' $P602 = "152_1258264446.59978" 
    capture_lex $P602
    .const 'Sub' $P571 = "150_1258264446.59978" 
    capture_lex $P571
    .const 'Sub' $P564 = "148_1258264446.59978" 
    capture_lex $P564
    .const 'Sub' $P559 = "146_1258264446.59978" 
    capture_lex $P559
    .const 'Sub' $P550 = "144_1258264446.59978" 
    capture_lex $P550
    .const 'Sub' $P536 = "142_1258264446.59978" 
    capture_lex $P536
    .const 'Sub' $P528 = "140_1258264446.59978" 
    capture_lex $P528
    .const 'Sub' $P510 = "138_1258264446.59978" 
    capture_lex $P510
    .const 'Sub' $P492 = "136_1258264446.59978" 
    capture_lex $P492
    .const 'Sub' $P486 = "134_1258264446.59978" 
    capture_lex $P486
    .const 'Sub' $P480 = "132_1258264446.59978" 
    capture_lex $P480
    .const 'Sub' $P471 = "128_1258264446.59978" 
    capture_lex $P471
    .const 'Sub' $P461 = "126_1258264446.59978" 
    capture_lex $P461
    .const 'Sub' $P455 = "124_1258264446.59978" 
    capture_lex $P455
    .const 'Sub' $P449 = "122_1258264446.59978" 
    capture_lex $P449
    .const 'Sub' $P443 = "120_1258264446.59978" 
    capture_lex $P443
    .const 'Sub' $P417 = "116_1258264446.59978" 
    capture_lex $P417
    .const 'Sub' $P409 = "114_1258264446.59978" 
    capture_lex $P409
    .const 'Sub' $P403 = "112_1258264446.59978" 
    capture_lex $P403
    .const 'Sub' $P395 = "108_1258264446.59978" 
    capture_lex $P395
    .const 'Sub' $P391 = "106_1258264446.59978" 
    capture_lex $P391
    .const 'Sub' $P380 = "104_1258264446.59978" 
    capture_lex $P380
    .const 'Sub' $P370 = "102_1258264446.59978" 
    capture_lex $P370
    .const 'Sub' $P366 = "100_1258264446.59978" 
    capture_lex $P366
    .const 'Sub' $P361 = "98_1258264446.59978" 
    capture_lex $P361
    .const 'Sub' $P356 = "96_1258264446.59978" 
    capture_lex $P356
    .const 'Sub' $P351 = "94_1258264446.59978" 
    capture_lex $P351
    .const 'Sub' $P346 = "92_1258264446.59978" 
    capture_lex $P346
    .const 'Sub' $P341 = "90_1258264446.59978" 
    capture_lex $P341
    .const 'Sub' $P336 = "88_1258264446.59978" 
    capture_lex $P336
    .const 'Sub' $P331 = "86_1258264446.59978" 
    capture_lex $P331
    .const 'Sub' $P324 = "84_1258264446.59978" 
    capture_lex $P324
    .const 'Sub' $P317 = "82_1258264446.59978" 
    capture_lex $P317
    .const 'Sub' $P306 = "78_1258264446.59978" 
    capture_lex $P306
    .const 'Sub' $P299 = "76_1258264446.59978" 
    capture_lex $P299
    .const 'Sub' $P290 = "72_1258264446.59978" 
    capture_lex $P290
    .const 'Sub' $P284 = "70_1258264446.59978" 
    capture_lex $P284
    .const 'Sub' $P273 = "66_1258264446.59978" 
    capture_lex $P273
    .const 'Sub' $P254 = "64_1258264446.59978" 
    capture_lex $P254
    .const 'Sub' $P246 = "62_1258264446.59978" 
    capture_lex $P246
    .const 'Sub' $P229 = "59_1258264446.59978" 
    capture_lex $P229
    .const 'Sub' $P210 = "57_1258264446.59978" 
    capture_lex $P210
    .const 'Sub' $P202 = "53_1258264446.59978" 
    capture_lex $P202
    .const 'Sub' $P198 = "51_1258264446.59978" 
    capture_lex $P198
    .const 'Sub' $P190 = "47_1258264446.59978" 
    capture_lex $P190
    .const 'Sub' $P186 = "45_1258264446.59978" 
    capture_lex $P186
    .const 'Sub' $P179 = "43_1258264446.59978" 
    capture_lex $P179
    .const 'Sub' $P173 = "41_1258264446.59978" 
    capture_lex $P173
    .const 'Sub' $P168 = "39_1258264446.59978" 
    capture_lex $P168
    .const 'Sub' $P161 = "37_1258264446.59978" 
    capture_lex $P161
    .const 'Sub' $P156 = "35_1258264446.59978" 
    capture_lex $P156
    .const 'Sub' $P151 = "33_1258264446.59978" 
    capture_lex $P151
    .const 'Sub' $P136 = "30_1258264446.59978" 
    capture_lex $P136
    .const 'Sub' $P124 = "28_1258264446.59978" 
    capture_lex $P124
    .const 'Sub' $P118 = "26_1258264446.59978" 
    capture_lex $P118
    .const 'Sub' $P76 = "23_1258264446.59978" 
    capture_lex $P76
    .const 'Sub' $P67 = "21_1258264446.59978" 
    capture_lex $P67
    .const 'Sub' $P58 = "19_1258264446.59978" 
    capture_lex $P58
    .const 'Sub' $P44 = "17_1258264446.59978" 
    capture_lex $P44
    .const 'Sub' $P38 = "15_1258264446.59978" 
    capture_lex $P38
    .const 'Sub' $P33 = "13_1258264446.59978" 
    capture_lex $P33
    .const 'Sub' $P15 = "12_1258264446.59978" 
    capture_lex $P15
.annotate "line", 477
    get_hll_global $P1013, ["NQP";"Regex"], "_block1012" 
    capture_lex $P1013
    $P1047 = $P1013()
.annotate "line", 4
    .return ($P1047)
.end


.namespace ["NQP";"Grammar"]
.sub "" :load :init :subid("post312") :outer("11_1258264446.59978")
.annotate "line", 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    .local pmc block
    set block, $P14
.annotate "line", 365
    get_hll_global $P1048, ["NQP"], "Grammar"
    $P1048."O"(":prec<y=>, :assoc<unary>", "%methodop")
.annotate "line", 366
    get_hll_global $P1049, ["NQP"], "Grammar"
    $P1049."O"(":prec<x=>, :assoc<unary>", "%autoincrement")
.annotate "line", 367
    get_hll_global $P1050, ["NQP"], "Grammar"
    $P1050."O"(":prec<w=>, :assoc<left>", "%exponentiation")
.annotate "line", 368
    get_hll_global $P1051, ["NQP"], "Grammar"
    $P1051."O"(":prec<v=>, :assoc<unary>", "%symbolic_unary")
.annotate "line", 369
    get_hll_global $P1052, ["NQP"], "Grammar"
    $P1052."O"(":prec<u=>, :assoc<left>", "%multiplicative")
.annotate "line", 370
    get_hll_global $P1053, ["NQP"], "Grammar"
    $P1053."O"(":prec<t=>, :assoc<left>", "%additive")
.annotate "line", 371
    get_hll_global $P1054, ["NQP"], "Grammar"
    $P1054."O"(":prec<r=>, :assoc<left>", "%concatenation")
.annotate "line", 372
    get_hll_global $P1055, ["NQP"], "Grammar"
    $P1055."O"(":prec<m=>, :assoc<left>", "%relational")
.annotate "line", 373
    get_hll_global $P1056, ["NQP"], "Grammar"
    $P1056."O"(":prec<l=>, :assoc<left>", "%tight_and")
.annotate "line", 374
    get_hll_global $P1057, ["NQP"], "Grammar"
    $P1057."O"(":prec<k=>, :assoc<left>", "%tight_or")
.annotate "line", 375
    get_hll_global $P1058, ["NQP"], "Grammar"
    $P1058."O"(":prec<j=>, :assoc<right>", "%conditional")
.annotate "line", 376
    get_hll_global $P1059, ["NQP"], "Grammar"
    $P1059."O"(":prec<i=>, :assoc<right>", "%assignment")
.annotate "line", 377
    get_hll_global $P1060, ["NQP"], "Grammar"
    $P1060."O"(":prec<g=>, :assoc<list>, :nextterm<nulltermish>", "%comma")
.annotate "line", 378
    get_hll_global $P1061, ["NQP"], "Grammar"
    $P1061."O"(":prec<f=>, :assoc<list>", "%list_infix")
.annotate "line", 379
    get_hll_global $P1062, ["NQP"], "Grammar"
    $P1062."O"(":prec<e=>, :assoc<unary>", "%list_prefix")
.annotate "line", 364
    $P1063 = get_root_global ["parrot"], "P6metaclass"
    $P1063."new_class"("NQP::Regex", "Regex::P6Regex::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "TOP"  :subid("12_1258264446.59978") :method :outer("11_1258264446.59978")
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
    unless_null $P20, vivify_313
    die "Contextual %*LANG not found"
  vivify_313:
.annotate "line", 6
    get_hll_global $P21, ["NQP"], "Regex"
    find_lex $P22, "%*LANG"
    unless_null $P22, vivify_314
    die "Contextual %*LANG not found"
    store_lex "%*LANG", $P22
  vivify_314:
    set $P22["Regex"], $P21
.annotate "line", 7
    get_hll_global $P23, ["NQP"], "RegexActions"
    find_lex $P24, "%*LANG"
    unless_null $P24, vivify_315
    die "Contextual %*LANG not found"
    store_lex "%*LANG", $P24
  vivify_315:
    set $P24["Regex-actions"], $P23
.annotate "line", 8
    get_hll_global $P25, ["NQP"], "Grammar"
    find_lex $P26, "%*LANG"
    unless_null $P26, vivify_316
    die "Contextual %*LANG not found"
    store_lex "%*LANG", $P26
  vivify_316:
    set $P26["MAIN"], $P25
.annotate "line", 9
    get_hll_global $P27, ["NQP"], "Actions"
    find_lex $P28, "%*LANG"
    unless_null $P28, vivify_317
    die "Contextual %*LANG not found"
    store_lex "%*LANG", $P28
  vivify_317:
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
.sub "identifier"  :subid("13_1258264446.59978") :method :outer("11_1258264446.59978")
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
.sub "!PREFIX__identifier"  :subid("14_1258264446.59978") :method
.annotate "line", 4
    $P36 = self."!PREFIX__!subrule"("ident", "")
    new $P37, "ResizablePMCArray"
    push $P37, $P36
    .return ($P37)
.end


.namespace ["NQP";"Grammar"]
.sub "name"  :subid("15_1258264446.59978") :method :outer("11_1258264446.59978")
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
.sub "!PREFIX__name"  :subid("16_1258264446.59978") :method
.annotate "line", 4
    new $P41, "ResizablePMCArray"
    push $P41, ""
    .return ($P41)
.end


.namespace ["NQP";"Grammar"]
.sub "deflongname"  :subid("17_1258264446.59978") :method :outer("11_1258264446.59978")
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
.sub "!PREFIX__deflongname"  :subid("18_1258264446.59978") :method
.annotate "line", 4
    $P47 = self."!PREFIX__!subrule"("identifier", "")
    new $P48, "ResizablePMCArray"
    push $P48, $P47
    .return ($P48)
.end


.namespace ["NQP";"Grammar"]
.sub "ENDSTMT"  :subid("19_1258264446.59978") :method :outer("11_1258264446.59978")
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
.sub "!PREFIX__ENDSTMT"  :subid("20_1258264446.59978") :method
.annotate "line", 4
    new $P61, "ResizablePMCArray"
    push $P61, ""
    .return ($P61)
.end


.namespace ["NQP";"Grammar"]
.sub "ws"  :subid("21_1258264446.59978") :method :outer("11_1258264446.59978")
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
.sub "!PREFIX__ws"  :subid("22_1258264446.59978") :method
.annotate "line", 4
    new $P70, "ResizablePMCArray"
    push $P70, ""
    push $P70, ""
    .return ($P70)
.end


.namespace ["NQP";"Grammar"]
.sub "pod_comment"  :subid("23_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .const 'Sub' $P110 = "25_1258264446.59978" 
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
    .const 'Sub' $P110 = "25_1258264446.59978" 
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
.sub "!PREFIX__pod_comment"  :subid("24_1258264446.59978") :method
.annotate "line", 4
    new $P79, "ResizablePMCArray"
    push $P79, ""
    .return ($P79)
.end


.namespace ["NQP";"Grammar"]
.sub "_block109"  :anon :subid("25_1258264446.59978") :method :outer("23_1258264446.59978")
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
.sub "comp_unit"  :subid("26_1258264446.59978") :method :outer("11_1258264446.59978")
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
.sub "!PREFIX__comp_unit"  :subid("27_1258264446.59978") :method
.annotate "line", 4
    $P121 = self."!PREFIX__!subrule"("", "")
    new $P122, "ResizablePMCArray"
    push $P122, $P121
    .return ($P122)
.end


.namespace ["NQP";"Grammar"]
.sub "statementlist"  :subid("28_1258264446.59978") :method :outer("11_1258264446.59978")
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
.sub "!PREFIX__statementlist"  :subid("29_1258264446.59978") :method
.annotate "line", 4
    new $P127, "ResizablePMCArray"
    push $P127, ""
    push $P127, ""
    .return ($P127)
.end


.namespace ["NQP";"Grammar"]
.sub "statement"  :subid("30_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .const 'Sub' $P141 = "32_1258264446.59978" 
    capture_lex $P141
    .local string rx137_tgt
    .local int rx137_pos
    .local int rx137_off
    .local int rx137_eos
    .local int rx137_rep
    .local pmc rx137_cur
    (rx137_cur, rx137_pos, rx137_tgt, $I10) = self."!cursor_start"()
    rx137_cur."!cursor_debug"("START ", "statement")
    rx137_cur."!cursor_caparray"("statement_mod_loop", "statement_mod_cond")
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
    .const 'Sub' $P141 = "32_1258264446.59978" 
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
.annotate "line", 85
  # rx rxquantr146 ** 0..1
    set_addr $I150, rxquantr146_done
    rx137_cur."!mark_push"(0, rx137_pos, $I150)
  rxquantr146_loop:
  alt147_0:
.annotate "line", 82
    set_addr $I10, alt147_1
    rx137_cur."!mark_push"(0, rx137_pos, $I10)
.annotate "line", 83
  # rx subrule "statement_mod_cond" subtype=capture negate=
    rx137_cur."!cursor_pos"(rx137_pos)
    $P10 = rx137_cur."statement_mod_cond"()
    unless $P10, rx137_fail
    rx137_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_cond")
    rx137_pos = $P10."pos"()
  # rx rxquantr148 ** 0..1
    set_addr $I149, rxquantr148_done
    rx137_cur."!mark_push"(0, rx137_pos, $I149)
  rxquantr148_loop:
  # rx subrule "statement_mod_loop" subtype=capture negate=
    rx137_cur."!cursor_pos"(rx137_pos)
    $P10 = rx137_cur."statement_mod_loop"()
    unless $P10, rx137_fail
    rx137_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_loop")
    rx137_pos = $P10."pos"()
    (rx137_rep) = rx137_cur."!mark_commit"($I149)
  rxquantr148_done:
    goto alt147_end
  alt147_1:
.annotate "line", 84
  # rx subrule "statement_mod_loop" subtype=capture negate=
    rx137_cur."!cursor_pos"(rx137_pos)
    $P10 = rx137_cur."statement_mod_loop"()
    unless $P10, rx137_fail
    rx137_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_loop")
    rx137_pos = $P10."pos"()
  alt147_end:
.annotate "line", 85
    (rx137_rep) = rx137_cur."!mark_commit"($I150)
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
.sub "!PREFIX__statement"  :subid("31_1258264446.59978") :method
.annotate "line", 4
    new $P139, "ResizablePMCArray"
    push $P139, ""
    .return ($P139)
.end


.namespace ["NQP";"Grammar"]
.sub "_block140"  :anon :subid("32_1258264446.59978") :method :outer("30_1258264446.59978")
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
.sub "eat_terminator"  :subid("33_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx152_tgt
    .local int rx152_pos
    .local int rx152_off
    .local int rx152_eos
    .local int rx152_rep
    .local pmc rx152_cur
    (rx152_cur, rx152_pos, rx152_tgt, $I10) = self."!cursor_start"()
    rx152_cur."!cursor_debug"("START ", "eat_terminator")
    .lex unicode:"$\x{a2}", rx152_cur
    .local pmc match
    .lex "$/", match
    length rx152_eos, rx152_tgt
    set rx152_off, 0
    lt $I10, 2, rx152_start
    sub rx152_off, $I10, 1
    substr rx152_tgt, rx152_tgt, rx152_off
  rx152_start:
  alt155_0:
.annotate "line", 89
    set_addr $I10, alt155_1
    rx152_cur."!mark_push"(0, rx152_pos, $I10)
.annotate "line", 90
  # rx literal  ";"
    add $I11, rx152_pos, 1
    gt $I11, rx152_eos, rx152_fail
    sub $I11, rx152_pos, rx152_off
    substr $S10, rx152_tgt, $I11, 1
    ne $S10, ";", rx152_fail
    add rx152_pos, 1
    goto alt155_end
  alt155_1:
    set_addr $I10, alt155_2
    rx152_cur."!mark_push"(0, rx152_pos, $I10)
.annotate "line", 91
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx152_cur."!cursor_pos"(rx152_pos)
    $P10 = rx152_cur."MARKED"("endstmt")
    unless $P10, rx152_fail
    goto alt155_end
  alt155_2:
    set_addr $I10, alt155_3
    rx152_cur."!mark_push"(0, rx152_pos, $I10)
.annotate "line", 92
  # rx subrule "terminator" subtype=zerowidth negate=
    rx152_cur."!cursor_pos"(rx152_pos)
    $P10 = rx152_cur."terminator"()
    unless $P10, rx152_fail
    goto alt155_end
  alt155_3:
.annotate "line", 93
  # rxanchor eos
    ne rx152_pos, rx152_eos, rx152_fail
  alt155_end:
.annotate "line", 89
  # rx pass
    rx152_cur."!cursor_pass"(rx152_pos, "eat_terminator")
    rx152_cur."!cursor_debug"("PASS  ", "eat_terminator", " at pos=", rx152_pos)
    .return (rx152_cur)
  rx152_fail:
.annotate "line", 4
    (rx152_rep, rx152_pos, $I10, $P10) = rx152_cur."!mark_fail"(0)
    lt rx152_pos, -1, rx152_done
    eq rx152_pos, -1, rx152_fail
    jump $I10
  rx152_done:
    rx152_cur."!cursor_fail"()
    rx152_cur."!cursor_debug"("FAIL  ", "eat_terminator")
    .return (rx152_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__eat_terminator"  :subid("34_1258264446.59978") :method
.annotate "line", 4
    new $P154, "ResizablePMCArray"
    push $P154, ""
    push $P154, ""
    push $P154, ""
    push $P154, ";"
    .return ($P154)
.end


.namespace ["NQP";"Grammar"]
.sub "xblock"  :subid("35_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx157_tgt
    .local int rx157_pos
    .local int rx157_off
    .local int rx157_eos
    .local int rx157_rep
    .local pmc rx157_cur
    (rx157_cur, rx157_pos, rx157_tgt, $I10) = self."!cursor_start"()
    rx157_cur."!cursor_debug"("START ", "xblock")
    .lex unicode:"$\x{a2}", rx157_cur
    .local pmc match
    .lex "$/", match
    length rx157_eos, rx157_tgt
    set rx157_off, 0
    lt $I10, 2, rx157_start
    sub rx157_off, $I10, 1
    substr rx157_tgt, rx157_tgt, rx157_off
  rx157_start:
.annotate "line", 97
  # rx subrule "EXPR" subtype=capture negate=
    rx157_cur."!cursor_pos"(rx157_pos)
    $P10 = rx157_cur."EXPR"()
    unless $P10, rx157_fail
    rx157_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx157_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx157_cur."!cursor_pos"(rx157_pos)
    $P10 = rx157_cur."ws"()
    unless $P10, rx157_fail
    rx157_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx157_cur."!cursor_pos"(rx157_pos)
    $P10 = rx157_cur."pblock"()
    unless $P10, rx157_fail
    rx157_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx157_pos = $P10."pos"()
.annotate "line", 96
  # rx pass
    rx157_cur."!cursor_pass"(rx157_pos, "xblock")
    rx157_cur."!cursor_debug"("PASS  ", "xblock", " at pos=", rx157_pos)
    .return (rx157_cur)
  rx157_fail:
.annotate "line", 4
    (rx157_rep, rx157_pos, $I10, $P10) = rx157_cur."!mark_fail"(0)
    lt rx157_pos, -1, rx157_done
    eq rx157_pos, -1, rx157_fail
    jump $I10
  rx157_done:
    rx157_cur."!cursor_fail"()
    rx157_cur."!cursor_debug"("FAIL  ", "xblock")
    .return (rx157_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__xblock"  :subid("36_1258264446.59978") :method
.annotate "line", 4
    $P159 = self."!PREFIX__!subrule"("EXPR", "")
    new $P160, "ResizablePMCArray"
    push $P160, $P159
    .return ($P160)
.end


.namespace ["NQP";"Grammar"]
.sub "pblock"  :subid("37_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx162_tgt
    .local int rx162_pos
    .local int rx162_off
    .local int rx162_eos
    .local int rx162_rep
    .local pmc rx162_cur
    (rx162_cur, rx162_pos, rx162_tgt, $I10) = self."!cursor_start"()
    rx162_cur."!cursor_debug"("START ", "pblock")
    .lex unicode:"$\x{a2}", rx162_cur
    .local pmc match
    .lex "$/", match
    length rx162_eos, rx162_tgt
    set rx162_off, 0
    lt $I10, 2, rx162_start
    sub rx162_off, $I10, 1
    substr rx162_tgt, rx162_tgt, rx162_off
  rx162_start:
  alt167_0:
.annotate "line", 100
    set_addr $I10, alt167_1
    rx162_cur."!mark_push"(0, rx162_pos, $I10)
.annotate "line", 101
  # rx subrule "lambda" subtype=method negate=
    rx162_cur."!cursor_pos"(rx162_pos)
    $P10 = rx162_cur."lambda"()
    unless $P10, rx162_fail
    rx162_pos = $P10."pos"()
.annotate "line", 102
  # rx subrule "newpad" subtype=method negate=
    rx162_cur."!cursor_pos"(rx162_pos)
    $P10 = rx162_cur."newpad"()
    unless $P10, rx162_fail
    rx162_pos = $P10."pos"()
.annotate "line", 103
  # rx subrule "signature" subtype=capture negate=
    rx162_cur."!cursor_pos"(rx162_pos)
    $P10 = rx162_cur."signature"()
    unless $P10, rx162_fail
    rx162_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx162_pos = $P10."pos"()
.annotate "line", 104
  # rx subrule "blockoid" subtype=capture negate=
    rx162_cur."!cursor_pos"(rx162_pos)
    $P10 = rx162_cur."blockoid"()
    unless $P10, rx162_fail
    rx162_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx162_pos = $P10."pos"()
.annotate "line", 101
    goto alt167_end
  alt167_1:
    set_addr $I10, alt167_2
    rx162_cur."!mark_push"(0, rx162_pos, $I10)
.annotate "line", 105
  # rx enumcharlist negate=0 zerowidth
    ge rx162_pos, rx162_eos, rx162_fail
    sub $I10, rx162_pos, rx162_off
    substr $S10, rx162_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx162_fail
.annotate "line", 106
  # rx subrule "newpad" subtype=method negate=
    rx162_cur."!cursor_pos"(rx162_pos)
    $P10 = rx162_cur."newpad"()
    unless $P10, rx162_fail
    rx162_pos = $P10."pos"()
.annotate "line", 107
  # rx subrule "blockoid" subtype=capture negate=
    rx162_cur."!cursor_pos"(rx162_pos)
    $P10 = rx162_cur."blockoid"()
    unless $P10, rx162_fail
    rx162_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx162_pos = $P10."pos"()
.annotate "line", 105
    goto alt167_end
  alt167_2:
.annotate "line", 108
  # rx subrule "panic" subtype=method negate=
    rx162_cur."!cursor_pos"(rx162_pos)
    $P10 = rx162_cur."panic"("Missing block")
    unless $P10, rx162_fail
    rx162_pos = $P10."pos"()
  alt167_end:
.annotate "line", 100
  # rx pass
    rx162_cur."!cursor_pass"(rx162_pos, "pblock")
    rx162_cur."!cursor_debug"("PASS  ", "pblock", " at pos=", rx162_pos)
    .return (rx162_cur)
  rx162_fail:
.annotate "line", 4
    (rx162_rep, rx162_pos, $I10, $P10) = rx162_cur."!mark_fail"(0)
    lt rx162_pos, -1, rx162_done
    eq rx162_pos, -1, rx162_fail
    jump $I10
  rx162_done:
    rx162_cur."!cursor_fail"()
    rx162_cur."!cursor_debug"("FAIL  ", "pblock")
    .return (rx162_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__pblock"  :subid("38_1258264446.59978") :method
.annotate "line", 4
    $P164 = self."!PREFIX__!subrule"("", "")
    $P165 = self."!PREFIX__!subrule"("", "")
    new $P166, "ResizablePMCArray"
    push $P166, $P164
    push $P166, "{"
    push $P166, $P165
    .return ($P166)
.end


.namespace ["NQP";"Grammar"]
.sub "lambda"  :subid("39_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx169_tgt
    .local int rx169_pos
    .local int rx169_off
    .local int rx169_eos
    .local int rx169_rep
    .local pmc rx169_cur
    (rx169_cur, rx169_pos, rx169_tgt, $I10) = self."!cursor_start"()
    rx169_cur."!cursor_debug"("START ", "lambda")
    .lex unicode:"$\x{a2}", rx169_cur
    .local pmc match
    .lex "$/", match
    length rx169_eos, rx169_tgt
    set rx169_off, 0
    lt $I10, 2, rx169_start
    sub rx169_off, $I10, 1
    substr rx169_tgt, rx169_tgt, rx169_off
  rx169_start:
  alt172_0:
.annotate "line", 111
    set_addr $I10, alt172_1
    rx169_cur."!mark_push"(0, rx169_pos, $I10)
  # rx literal  "->"
    add $I11, rx169_pos, 2
    gt $I11, rx169_eos, rx169_fail
    sub $I11, rx169_pos, rx169_off
    substr $S10, rx169_tgt, $I11, 2
    ne $S10, "->", rx169_fail
    add rx169_pos, 2
    goto alt172_end
  alt172_1:
  # rx literal  "<->"
    add $I11, rx169_pos, 3
    gt $I11, rx169_eos, rx169_fail
    sub $I11, rx169_pos, rx169_off
    substr $S10, rx169_tgt, $I11, 3
    ne $S10, "<->", rx169_fail
    add rx169_pos, 3
  alt172_end:
  # rx pass
    rx169_cur."!cursor_pass"(rx169_pos, "lambda")
    rx169_cur."!cursor_debug"("PASS  ", "lambda", " at pos=", rx169_pos)
    .return (rx169_cur)
  rx169_fail:
.annotate "line", 4
    (rx169_rep, rx169_pos, $I10, $P10) = rx169_cur."!mark_fail"(0)
    lt rx169_pos, -1, rx169_done
    eq rx169_pos, -1, rx169_fail
    jump $I10
  rx169_done:
    rx169_cur."!cursor_fail"()
    rx169_cur."!cursor_debug"("FAIL  ", "lambda")
    .return (rx169_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__lambda"  :subid("40_1258264446.59978") :method
.annotate "line", 4
    new $P171, "ResizablePMCArray"
    push $P171, "<->"
    push $P171, "->"
    .return ($P171)
.end


.namespace ["NQP";"Grammar"]
.sub "block"  :subid("41_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx174_tgt
    .local int rx174_pos
    .local int rx174_off
    .local int rx174_eos
    .local int rx174_rep
    .local pmc rx174_cur
    (rx174_cur, rx174_pos, rx174_tgt, $I10) = self."!cursor_start"()
    rx174_cur."!cursor_debug"("START ", "block")
    .lex unicode:"$\x{a2}", rx174_cur
    .local pmc match
    .lex "$/", match
    length rx174_eos, rx174_tgt
    set rx174_off, 0
    lt $I10, 2, rx174_start
    sub rx174_off, $I10, 1
    substr rx174_tgt, rx174_tgt, rx174_off
  rx174_start:
  alt178_0:
.annotate "line", 114
    set_addr $I10, alt178_1
    rx174_cur."!mark_push"(0, rx174_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx174_pos, rx174_eos, rx174_fail
    sub $I10, rx174_pos, rx174_off
    substr $S10, rx174_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx174_fail
    goto alt178_end
  alt178_1:
  # rx subrule "panic" subtype=method negate=
    rx174_cur."!cursor_pos"(rx174_pos)
    $P10 = rx174_cur."panic"("Missing block")
    unless $P10, rx174_fail
    rx174_pos = $P10."pos"()
  alt178_end:
.annotate "line", 115
  # rx subrule "newpad" subtype=method negate=
    rx174_cur."!cursor_pos"(rx174_pos)
    $P10 = rx174_cur."newpad"()
    unless $P10, rx174_fail
    rx174_pos = $P10."pos"()
.annotate "line", 116
  # rx subrule "blockoid" subtype=capture negate=
    rx174_cur."!cursor_pos"(rx174_pos)
    $P10 = rx174_cur."blockoid"()
    unless $P10, rx174_fail
    rx174_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx174_pos = $P10."pos"()
.annotate "line", 113
  # rx pass
    rx174_cur."!cursor_pass"(rx174_pos, "block")
    rx174_cur."!cursor_debug"("PASS  ", "block", " at pos=", rx174_pos)
    .return (rx174_cur)
  rx174_fail:
.annotate "line", 4
    (rx174_rep, rx174_pos, $I10, $P10) = rx174_cur."!mark_fail"(0)
    lt rx174_pos, -1, rx174_done
    eq rx174_pos, -1, rx174_fail
    jump $I10
  rx174_done:
    rx174_cur."!cursor_fail"()
    rx174_cur."!cursor_debug"("FAIL  ", "block")
    .return (rx174_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__block"  :subid("42_1258264446.59978") :method
.annotate "line", 4
    $P176 = self."!PREFIX__!subrule"("", "")
    new $P177, "ResizablePMCArray"
    push $P177, $P176
    push $P177, "{"
    .return ($P177)
.end


.namespace ["NQP";"Grammar"]
.sub "blockoid"  :subid("43_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx180_tgt
    .local int rx180_pos
    .local int rx180_off
    .local int rx180_eos
    .local int rx180_rep
    .local pmc rx180_cur
    (rx180_cur, rx180_pos, rx180_tgt, $I10) = self."!cursor_start"()
    rx180_cur."!cursor_debug"("START ", "blockoid")
    .lex unicode:"$\x{a2}", rx180_cur
    .local pmc match
    .lex "$/", match
    length rx180_eos, rx180_tgt
    set rx180_off, 0
    lt $I10, 2, rx180_start
    sub rx180_off, $I10, 1
    substr rx180_tgt, rx180_tgt, rx180_off
  rx180_start:
.annotate "line", 120
  # rx subrule "finishpad" subtype=method negate=
    rx180_cur."!cursor_pos"(rx180_pos)
    $P10 = rx180_cur."finishpad"()
    unless $P10, rx180_fail
    rx180_pos = $P10."pos"()
.annotate "line", 121
  # rx literal  "{"
    add $I11, rx180_pos, 1
    gt $I11, rx180_eos, rx180_fail
    sub $I11, rx180_pos, rx180_off
    substr $S10, rx180_tgt, $I11, 1
    ne $S10, "{", rx180_fail
    add rx180_pos, 1
  # rx subrule "statementlist" subtype=capture negate=
    rx180_cur."!cursor_pos"(rx180_pos)
    $P10 = rx180_cur."statementlist"()
    unless $P10, rx180_fail
    rx180_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statementlist")
    rx180_pos = $P10."pos"()
  alt184_0:
    set_addr $I10, alt184_1
    rx180_cur."!mark_push"(0, rx180_pos, $I10)
  # rx literal  "}"
    add $I11, rx180_pos, 1
    gt $I11, rx180_eos, rx180_fail
    sub $I11, rx180_pos, rx180_off
    substr $S10, rx180_tgt, $I11, 1
    ne $S10, "}", rx180_fail
    add rx180_pos, 1
    goto alt184_end
  alt184_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx180_cur."!cursor_pos"(rx180_pos)
    $P10 = rx180_cur."FAILGOAL"("'}'")
    unless $P10, rx180_fail
    rx180_pos = $P10."pos"()
  alt184_end:
.annotate "line", 122
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx180_cur."!cursor_pos"(rx180_pos)
    $P10 = rx180_cur."ENDSTMT"()
    unless $P10, rx180_fail
.annotate "line", 119
  # rx pass
    rx180_cur."!cursor_pass"(rx180_pos, "blockoid")
    rx180_cur."!cursor_debug"("PASS  ", "blockoid", " at pos=", rx180_pos)
    .return (rx180_cur)
  rx180_fail:
.annotate "line", 4
    (rx180_rep, rx180_pos, $I10, $P10) = rx180_cur."!mark_fail"(0)
    lt rx180_pos, -1, rx180_done
    eq rx180_pos, -1, rx180_fail
    jump $I10
  rx180_done:
    rx180_cur."!cursor_fail"()
    rx180_cur."!cursor_debug"("FAIL  ", "blockoid")
    .return (rx180_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blockoid"  :subid("44_1258264446.59978") :method
.annotate "line", 4
    $P182 = self."!PREFIX__!subrule"("", "")
    new $P183, "ResizablePMCArray"
    push $P183, $P182
    .return ($P183)
.end


.namespace ["NQP";"Grammar"]
.sub "newpad"  :subid("45_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx187_tgt
    .local int rx187_pos
    .local int rx187_off
    .local int rx187_eos
    .local int rx187_rep
    .local pmc rx187_cur
    (rx187_cur, rx187_pos, rx187_tgt, $I10) = self."!cursor_start"()
    rx187_cur."!cursor_debug"("START ", "newpad")
    .lex unicode:"$\x{a2}", rx187_cur
    .local pmc match
    .lex "$/", match
    length rx187_eos, rx187_tgt
    set rx187_off, 0
    lt $I10, 2, rx187_start
    sub rx187_off, $I10, 1
    substr rx187_tgt, rx187_tgt, rx187_off
  rx187_start:
.annotate "line", 125
  # rx pass
    rx187_cur."!cursor_pass"(rx187_pos, "newpad")
    rx187_cur."!cursor_debug"("PASS  ", "newpad", " at pos=", rx187_pos)
    .return (rx187_cur)
  rx187_fail:
.annotate "line", 4
    (rx187_rep, rx187_pos, $I10, $P10) = rx187_cur."!mark_fail"(0)
    lt rx187_pos, -1, rx187_done
    eq rx187_pos, -1, rx187_fail
    jump $I10
  rx187_done:
    rx187_cur."!cursor_fail"()
    rx187_cur."!cursor_debug"("FAIL  ", "newpad")
    .return (rx187_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__newpad"  :subid("46_1258264446.59978") :method
.annotate "line", 4
    new $P189, "ResizablePMCArray"
    push $P189, ""
    .return ($P189)
.end


.namespace ["NQP";"Grammar"]
.sub "finishpad"  :subid("47_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx191_tgt
    .local int rx191_pos
    .local int rx191_off
    .local int rx191_eos
    .local int rx191_rep
    .local pmc rx191_cur
    (rx191_cur, rx191_pos, rx191_tgt, $I10) = self."!cursor_start"()
    rx191_cur."!cursor_debug"("START ", "finishpad")
    .lex unicode:"$\x{a2}", rx191_cur
    .local pmc match
    .lex "$/", match
    length rx191_eos, rx191_tgt
    set rx191_off, 0
    lt $I10, 2, rx191_start
    sub rx191_off, $I10, 1
    substr rx191_tgt, rx191_tgt, rx191_off
  rx191_start:
.annotate "line", 126
  # rx pass
    rx191_cur."!cursor_pass"(rx191_pos, "finishpad")
    rx191_cur."!cursor_debug"("PASS  ", "finishpad", " at pos=", rx191_pos)
    .return (rx191_cur)
  rx191_fail:
.annotate "line", 4
    (rx191_rep, rx191_pos, $I10, $P10) = rx191_cur."!mark_fail"(0)
    lt rx191_pos, -1, rx191_done
    eq rx191_pos, -1, rx191_fail
    jump $I10
  rx191_done:
    rx191_cur."!cursor_fail"()
    rx191_cur."!cursor_debug"("FAIL  ", "finishpad")
    .return (rx191_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__finishpad"  :subid("48_1258264446.59978") :method
.annotate "line", 4
    new $P193, "ResizablePMCArray"
    push $P193, ""
    .return ($P193)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator"  :subid("49_1258264446.59978") :method
.annotate "line", 128
    $P195 = self."!protoregex"("terminator")
    .return ($P195)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator"  :subid("50_1258264446.59978") :method
.annotate "line", 128
    $P197 = self."!PREFIX__!protoregex"("terminator")
    .return ($P197)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<;>"  :subid("51_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx199_tgt
    .local int rx199_pos
    .local int rx199_off
    .local int rx199_eos
    .local int rx199_rep
    .local pmc rx199_cur
    (rx199_cur, rx199_pos, rx199_tgt, $I10) = self."!cursor_start"()
    rx199_cur."!cursor_debug"("START ", "terminator:sym<;>")
    .lex unicode:"$\x{a2}", rx199_cur
    .local pmc match
    .lex "$/", match
    length rx199_eos, rx199_tgt
    set rx199_off, 0
    lt $I10, 2, rx199_start
    sub rx199_off, $I10, 1
    substr rx199_tgt, rx199_tgt, rx199_off
  rx199_start:
.annotate "line", 130
  # rx enumcharlist negate=0 zerowidth
    ge rx199_pos, rx199_eos, rx199_fail
    sub $I10, rx199_pos, rx199_off
    substr $S10, rx199_tgt, $I10, 1
    index $I11, ";", $S10
    lt $I11, 0, rx199_fail
  # rx pass
    rx199_cur."!cursor_pass"(rx199_pos, "terminator:sym<;>")
    rx199_cur."!cursor_debug"("PASS  ", "terminator:sym<;>", " at pos=", rx199_pos)
    .return (rx199_cur)
  rx199_fail:
.annotate "line", 4
    (rx199_rep, rx199_pos, $I10, $P10) = rx199_cur."!mark_fail"(0)
    lt rx199_pos, -1, rx199_done
    eq rx199_pos, -1, rx199_fail
    jump $I10
  rx199_done:
    rx199_cur."!cursor_fail"()
    rx199_cur."!cursor_debug"("FAIL  ", "terminator:sym<;>")
    .return (rx199_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<;>"  :subid("52_1258264446.59978") :method
.annotate "line", 4
    new $P201, "ResizablePMCArray"
    push $P201, ";"
    .return ($P201)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<}>"  :subid("53_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx203_tgt
    .local int rx203_pos
    .local int rx203_off
    .local int rx203_eos
    .local int rx203_rep
    .local pmc rx203_cur
    (rx203_cur, rx203_pos, rx203_tgt, $I10) = self."!cursor_start"()
    rx203_cur."!cursor_debug"("START ", "terminator:sym<}>")
    .lex unicode:"$\x{a2}", rx203_cur
    .local pmc match
    .lex "$/", match
    length rx203_eos, rx203_tgt
    set rx203_off, 0
    lt $I10, 2, rx203_start
    sub rx203_off, $I10, 1
    substr rx203_tgt, rx203_tgt, rx203_off
  rx203_start:
.annotate "line", 131
  # rx enumcharlist negate=0 zerowidth
    ge rx203_pos, rx203_eos, rx203_fail
    sub $I10, rx203_pos, rx203_off
    substr $S10, rx203_tgt, $I10, 1
    index $I11, "}", $S10
    lt $I11, 0, rx203_fail
  # rx pass
    rx203_cur."!cursor_pass"(rx203_pos, "terminator:sym<}>")
    rx203_cur."!cursor_debug"("PASS  ", "terminator:sym<}>", " at pos=", rx203_pos)
    .return (rx203_cur)
  rx203_fail:
.annotate "line", 4
    (rx203_rep, rx203_pos, $I10, $P10) = rx203_cur."!mark_fail"(0)
    lt rx203_pos, -1, rx203_done
    eq rx203_pos, -1, rx203_fail
    jump $I10
  rx203_done:
    rx203_cur."!cursor_fail"()
    rx203_cur."!cursor_debug"("FAIL  ", "terminator:sym<}>")
    .return (rx203_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<}>"  :subid("54_1258264446.59978") :method
.annotate "line", 4
    new $P205, "ResizablePMCArray"
    push $P205, "}"
    .return ($P205)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control"  :subid("55_1258264446.59978") :method
.annotate "line", 135
    $P207 = self."!protoregex"("statement_control")
    .return ($P207)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control"  :subid("56_1258264446.59978") :method
.annotate "line", 135
    $P209 = self."!PREFIX__!protoregex"("statement_control")
    .return ($P209)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<if>"  :subid("57_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx211_tgt
    .local int rx211_pos
    .local int rx211_off
    .local int rx211_eos
    .local int rx211_rep
    .local pmc rx211_cur
    (rx211_cur, rx211_pos, rx211_tgt, $I10) = self."!cursor_start"()
    rx211_cur."!cursor_debug"("START ", "statement_control:sym<if>")
    rx211_cur."!cursor_caparray"("xblock", "else")
    .lex unicode:"$\x{a2}", rx211_cur
    .local pmc match
    .lex "$/", match
    length rx211_eos, rx211_tgt
    set rx211_off, 0
    lt $I10, 2, rx211_start
    sub rx211_off, $I10, 1
    substr rx211_tgt, rx211_tgt, rx211_off
  rx211_start:
.annotate "line", 138
  # rx subcapture "sym"
    set_addr $I10, rxcap_214_fail
    rx211_cur."!mark_push"(0, rx211_pos, $I10)
  # rx literal  "if"
    add $I11, rx211_pos, 2
    gt $I11, rx211_eos, rx211_fail
    sub $I11, rx211_pos, rx211_off
    substr $S10, rx211_tgt, $I11, 2
    ne $S10, "if", rx211_fail
    add rx211_pos, 2
    set_addr $I10, rxcap_214_fail
    ($I12, $I11) = rx211_cur."!mark_peek"($I10)
    rx211_cur."!cursor_pos"($I11)
    ($P10) = rx211_cur."!cursor_start"()
    $P10."!cursor_pass"(rx211_pos, "")
    rx211_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_214_done
  rxcap_214_fail:
    goto rx211_fail
  rxcap_214_done:
  # rx subrule "ws" subtype=method negate=
    rx211_cur."!cursor_pos"(rx211_pos)
    $P10 = rx211_cur."ws"()
    unless $P10, rx211_fail
    rx211_pos = $P10."pos"()
.annotate "line", 139
  # rx subrule "xblock" subtype=capture negate=
    rx211_cur."!cursor_pos"(rx211_pos)
    $P10 = rx211_cur."xblock"()
    unless $P10, rx211_fail
    rx211_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx211_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx211_cur."!cursor_pos"(rx211_pos)
    $P10 = rx211_cur."ws"()
    unless $P10, rx211_fail
    rx211_pos = $P10."pos"()
.annotate "line", 140
  # rx rxquantr217 ** 0..*
    set_addr $I221, rxquantr217_done
    rx211_cur."!mark_push"(0, rx211_pos, $I221)
  rxquantr217_loop:
  # rx subrule "ws" subtype=method negate=
    rx211_cur."!cursor_pos"(rx211_pos)
    $P10 = rx211_cur."ws"()
    unless $P10, rx211_fail
    rx211_pos = $P10."pos"()
  # rx literal  "elsif"
    add $I11, rx211_pos, 5
    gt $I11, rx211_eos, rx211_fail
    sub $I11, rx211_pos, rx211_off
    substr $S10, rx211_tgt, $I11, 5
    ne $S10, "elsif", rx211_fail
    add rx211_pos, 5
  # rx charclass s
    ge rx211_pos, rx211_eos, rx211_fail
    sub $I10, rx211_pos, rx211_off
    is_cclass $I11, 32, rx211_tgt, $I10
    unless $I11, rx211_fail
    inc rx211_pos
  # rx subrule "ws" subtype=method negate=
    rx211_cur."!cursor_pos"(rx211_pos)
    $P10 = rx211_cur."ws"()
    unless $P10, rx211_fail
    rx211_pos = $P10."pos"()
  # rx subrule "xblock" subtype=capture negate=
    rx211_cur."!cursor_pos"(rx211_pos)
    $P10 = rx211_cur."xblock"()
    unless $P10, rx211_fail
    rx211_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx211_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx211_cur."!cursor_pos"(rx211_pos)
    $P10 = rx211_cur."ws"()
    unless $P10, rx211_fail
    rx211_pos = $P10."pos"()
    (rx211_rep) = rx211_cur."!mark_commit"($I221)
    rx211_cur."!mark_push"(rx211_rep, rx211_pos, $I221)
    goto rxquantr217_loop
  rxquantr217_done:
  # rx subrule "ws" subtype=method negate=
    rx211_cur."!cursor_pos"(rx211_pos)
    $P10 = rx211_cur."ws"()
    unless $P10, rx211_fail
    rx211_pos = $P10."pos"()
.annotate "line", 141
  # rx rxquantr223 ** 0..1
    set_addr $I227, rxquantr223_done
    rx211_cur."!mark_push"(0, rx211_pos, $I227)
  rxquantr223_loop:
  # rx subrule "ws" subtype=method negate=
    rx211_cur."!cursor_pos"(rx211_pos)
    $P10 = rx211_cur."ws"()
    unless $P10, rx211_fail
    rx211_pos = $P10."pos"()
  # rx literal  "else"
    add $I11, rx211_pos, 4
    gt $I11, rx211_eos, rx211_fail
    sub $I11, rx211_pos, rx211_off
    substr $S10, rx211_tgt, $I11, 4
    ne $S10, "else", rx211_fail
    add rx211_pos, 4
  # rx charclass s
    ge rx211_pos, rx211_eos, rx211_fail
    sub $I10, rx211_pos, rx211_off
    is_cclass $I11, 32, rx211_tgt, $I10
    unless $I11, rx211_fail
    inc rx211_pos
  # rx subrule "ws" subtype=method negate=
    rx211_cur."!cursor_pos"(rx211_pos)
    $P10 = rx211_cur."ws"()
    unless $P10, rx211_fail
    rx211_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx211_cur."!cursor_pos"(rx211_pos)
    $P10 = rx211_cur."pblock"()
    unless $P10, rx211_fail
    rx211_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("else")
    rx211_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx211_cur."!cursor_pos"(rx211_pos)
    $P10 = rx211_cur."ws"()
    unless $P10, rx211_fail
    rx211_pos = $P10."pos"()
    (rx211_rep) = rx211_cur."!mark_commit"($I227)
  rxquantr223_done:
  # rx subrule "ws" subtype=method negate=
    rx211_cur."!cursor_pos"(rx211_pos)
    $P10 = rx211_cur."ws"()
    unless $P10, rx211_fail
    rx211_pos = $P10."pos"()
.annotate "line", 137
  # rx pass
    rx211_cur."!cursor_pass"(rx211_pos, "statement_control:sym<if>")
    rx211_cur."!cursor_debug"("PASS  ", "statement_control:sym<if>", " at pos=", rx211_pos)
    .return (rx211_cur)
  rx211_fail:
.annotate "line", 4
    (rx211_rep, rx211_pos, $I10, $P10) = rx211_cur."!mark_fail"(0)
    lt rx211_pos, -1, rx211_done
    eq rx211_pos, -1, rx211_fail
    jump $I10
  rx211_done:
    rx211_cur."!cursor_fail"()
    rx211_cur."!cursor_debug"("FAIL  ", "statement_control:sym<if>")
    .return (rx211_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<if>"  :subid("58_1258264446.59978") :method
.annotate "line", 4
    new $P213, "ResizablePMCArray"
    push $P213, "if"
    .return ($P213)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<unless>"  :subid("59_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .const 'Sub' $P239 = "61_1258264446.59978" 
    capture_lex $P239
    .local string rx230_tgt
    .local int rx230_pos
    .local int rx230_off
    .local int rx230_eos
    .local int rx230_rep
    .local pmc rx230_cur
    (rx230_cur, rx230_pos, rx230_tgt, $I10) = self."!cursor_start"()
    rx230_cur."!cursor_debug"("START ", "statement_control:sym<unless>")
    .lex unicode:"$\x{a2}", rx230_cur
    .local pmc match
    .lex "$/", match
    length rx230_eos, rx230_tgt
    set rx230_off, 0
    lt $I10, 2, rx230_start
    sub rx230_off, $I10, 1
    substr rx230_tgt, rx230_tgt, rx230_off
  rx230_start:
.annotate "line", 145
  # rx subcapture "sym"
    set_addr $I10, rxcap_233_fail
    rx230_cur."!mark_push"(0, rx230_pos, $I10)
  # rx literal  "unless"
    add $I11, rx230_pos, 6
    gt $I11, rx230_eos, rx230_fail
    sub $I11, rx230_pos, rx230_off
    substr $S10, rx230_tgt, $I11, 6
    ne $S10, "unless", rx230_fail
    add rx230_pos, 6
    set_addr $I10, rxcap_233_fail
    ($I12, $I11) = rx230_cur."!mark_peek"($I10)
    rx230_cur."!cursor_pos"($I11)
    ($P10) = rx230_cur."!cursor_start"()
    $P10."!cursor_pass"(rx230_pos, "")
    rx230_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_233_done
  rxcap_233_fail:
    goto rx230_fail
  rxcap_233_done:
  # rx subrule "ws" subtype=method negate=
    rx230_cur."!cursor_pos"(rx230_pos)
    $P10 = rx230_cur."ws"()
    unless $P10, rx230_fail
    rx230_pos = $P10."pos"()
.annotate "line", 146
  # rx subrule "xblock" subtype=capture negate=
    rx230_cur."!cursor_pos"(rx230_pos)
    $P10 = rx230_cur."xblock"()
    unless $P10, rx230_fail
    rx230_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx230_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx230_cur."!cursor_pos"(rx230_pos)
    $P10 = rx230_cur."ws"()
    unless $P10, rx230_fail
    rx230_pos = $P10."pos"()
  alt236_0:
.annotate "line", 147
    set_addr $I10, alt236_1
    rx230_cur."!mark_push"(0, rx230_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx230_cur."!cursor_pos"(rx230_pos)
    $P10 = rx230_cur."ws"()
    unless $P10, rx230_fail
    rx230_pos = $P10."pos"()
  # rx subrule "before" subtype=zerowidth negate=1
    rx230_cur."!cursor_pos"(rx230_pos)
    .const 'Sub' $P239 = "61_1258264446.59978" 
    capture_lex $P239
    $P10 = rx230_cur."before"($P239)
    if $P10, rx230_fail
  # rx subrule "ws" subtype=method negate=
    rx230_cur."!cursor_pos"(rx230_pos)
    $P10 = rx230_cur."ws"()
    unless $P10, rx230_fail
    rx230_pos = $P10."pos"()
    goto alt236_end
  alt236_1:
  # rx subrule "ws" subtype=method negate=
    rx230_cur."!cursor_pos"(rx230_pos)
    $P10 = rx230_cur."ws"()
    unless $P10, rx230_fail
    rx230_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx230_cur."!cursor_pos"(rx230_pos)
    $P10 = rx230_cur."panic"("unless does not take \"else\", please rewrite using \"if\"")
    unless $P10, rx230_fail
    rx230_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx230_cur."!cursor_pos"(rx230_pos)
    $P10 = rx230_cur."ws"()
    unless $P10, rx230_fail
    rx230_pos = $P10."pos"()
  alt236_end:
  # rx subrule "ws" subtype=method negate=
    rx230_cur."!cursor_pos"(rx230_pos)
    $P10 = rx230_cur."ws"()
    unless $P10, rx230_fail
    rx230_pos = $P10."pos"()
.annotate "line", 144
  # rx pass
    rx230_cur."!cursor_pass"(rx230_pos, "statement_control:sym<unless>")
    rx230_cur."!cursor_debug"("PASS  ", "statement_control:sym<unless>", " at pos=", rx230_pos)
    .return (rx230_cur)
  rx230_fail:
.annotate "line", 4
    (rx230_rep, rx230_pos, $I10, $P10) = rx230_cur."!mark_fail"(0)
    lt rx230_pos, -1, rx230_done
    eq rx230_pos, -1, rx230_fail
    jump $I10
  rx230_done:
    rx230_cur."!cursor_fail"()
    rx230_cur."!cursor_debug"("FAIL  ", "statement_control:sym<unless>")
    .return (rx230_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<unless>"  :subid("60_1258264446.59978") :method
.annotate "line", 4
    new $P232, "ResizablePMCArray"
    push $P232, "unless"
    .return ($P232)
.end


.namespace ["NQP";"Grammar"]
.sub "_block238"  :anon :subid("61_1258264446.59978") :method :outer("59_1258264446.59978")
.annotate "line", 147
    .local string rx240_tgt
    .local int rx240_pos
    .local int rx240_off
    .local int rx240_eos
    .local int rx240_rep
    .local pmc rx240_cur
    (rx240_cur, rx240_pos, rx240_tgt, $I10) = self."!cursor_start"()
    rx240_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx240_cur
    .local pmc match
    .lex "$/", match
    length rx240_eos, rx240_tgt
    set rx240_off, 0
    lt $I10, 2, rx240_start
    sub rx240_off, $I10, 1
    substr rx240_tgt, rx240_tgt, rx240_off
  rx240_start:
    ge rx240_pos, 0, rxscan241_done
  rxscan241_loop:
    ($P10) = rx240_cur."from"()
    inc $P10
    set rx240_pos, $P10
    ge rx240_pos, rx240_eos, rxscan241_done
    set_addr $I10, rxscan241_loop
    rx240_cur."!mark_push"(0, rx240_pos, $I10)
  rxscan241_done:
  # rx literal  "else"
    add $I11, rx240_pos, 4
    gt $I11, rx240_eos, rx240_fail
    sub $I11, rx240_pos, rx240_off
    substr $S10, rx240_tgt, $I11, 4
    ne $S10, "else", rx240_fail
    add rx240_pos, 4
  # rx pass
    rx240_cur."!cursor_pass"(rx240_pos, "")
    rx240_cur."!cursor_debug"("PASS  ", "", " at pos=", rx240_pos)
    .return (rx240_cur)
  rx240_fail:
    (rx240_rep, rx240_pos, $I10, $P10) = rx240_cur."!mark_fail"(0)
    lt rx240_pos, -1, rx240_done
    eq rx240_pos, -1, rx240_fail
    jump $I10
  rx240_done:
    rx240_cur."!cursor_fail"()
    rx240_cur."!cursor_debug"("FAIL  ", "")
    .return (rx240_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<while>"  :subid("62_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx247_tgt
    .local int rx247_pos
    .local int rx247_off
    .local int rx247_eos
    .local int rx247_rep
    .local pmc rx247_cur
    (rx247_cur, rx247_pos, rx247_tgt, $I10) = self."!cursor_start"()
    rx247_cur."!cursor_debug"("START ", "statement_control:sym<while>")
    .lex unicode:"$\x{a2}", rx247_cur
    .local pmc match
    .lex "$/", match
    length rx247_eos, rx247_tgt
    set rx247_off, 0
    lt $I10, 2, rx247_start
    sub rx247_off, $I10, 1
    substr rx247_tgt, rx247_tgt, rx247_off
  rx247_start:
.annotate "line", 151
  # rx subcapture "sym"
    set_addr $I10, rxcap_251_fail
    rx247_cur."!mark_push"(0, rx247_pos, $I10)
  alt250_0:
    set_addr $I10, alt250_1
    rx247_cur."!mark_push"(0, rx247_pos, $I10)
  # rx literal  "while"
    add $I11, rx247_pos, 5
    gt $I11, rx247_eos, rx247_fail
    sub $I11, rx247_pos, rx247_off
    substr $S10, rx247_tgt, $I11, 5
    ne $S10, "while", rx247_fail
    add rx247_pos, 5
    goto alt250_end
  alt250_1:
  # rx literal  "until"
    add $I11, rx247_pos, 5
    gt $I11, rx247_eos, rx247_fail
    sub $I11, rx247_pos, rx247_off
    substr $S10, rx247_tgt, $I11, 5
    ne $S10, "until", rx247_fail
    add rx247_pos, 5
  alt250_end:
    set_addr $I10, rxcap_251_fail
    ($I12, $I11) = rx247_cur."!mark_peek"($I10)
    rx247_cur."!cursor_pos"($I11)
    ($P10) = rx247_cur."!cursor_start"()
    $P10."!cursor_pass"(rx247_pos, "")
    rx247_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_251_done
  rxcap_251_fail:
    goto rx247_fail
  rxcap_251_done:
  # rx subrule "ws" subtype=method negate=
    rx247_cur."!cursor_pos"(rx247_pos)
    $P10 = rx247_cur."ws"()
    unless $P10, rx247_fail
    rx247_pos = $P10."pos"()
.annotate "line", 152
  # rx subrule "xblock" subtype=capture negate=
    rx247_cur."!cursor_pos"(rx247_pos)
    $P10 = rx247_cur."xblock"()
    unless $P10, rx247_fail
    rx247_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx247_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx247_cur."!cursor_pos"(rx247_pos)
    $P10 = rx247_cur."ws"()
    unless $P10, rx247_fail
    rx247_pos = $P10."pos"()
.annotate "line", 150
  # rx pass
    rx247_cur."!cursor_pass"(rx247_pos, "statement_control:sym<while>")
    rx247_cur."!cursor_debug"("PASS  ", "statement_control:sym<while>", " at pos=", rx247_pos)
    .return (rx247_cur)
  rx247_fail:
.annotate "line", 4
    (rx247_rep, rx247_pos, $I10, $P10) = rx247_cur."!mark_fail"(0)
    lt rx247_pos, -1, rx247_done
    eq rx247_pos, -1, rx247_fail
    jump $I10
  rx247_done:
    rx247_cur."!cursor_fail"()
    rx247_cur."!cursor_debug"("FAIL  ", "statement_control:sym<while>")
    .return (rx247_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<while>"  :subid("63_1258264446.59978") :method
.annotate "line", 4
    new $P249, "ResizablePMCArray"
    push $P249, "until"
    push $P249, "while"
    .return ($P249)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<repeat>"  :subid("64_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx255_tgt
    .local int rx255_pos
    .local int rx255_off
    .local int rx255_eos
    .local int rx255_rep
    .local pmc rx255_cur
    (rx255_cur, rx255_pos, rx255_tgt, $I10) = self."!cursor_start"()
    rx255_cur."!cursor_debug"("START ", "statement_control:sym<repeat>")
    .lex unicode:"$\x{a2}", rx255_cur
    .local pmc match
    .lex "$/", match
    length rx255_eos, rx255_tgt
    set rx255_off, 0
    lt $I10, 2, rx255_start
    sub rx255_off, $I10, 1
    substr rx255_tgt, rx255_tgt, rx255_off
  rx255_start:
.annotate "line", 156
  # rx subcapture "sym"
    set_addr $I10, rxcap_258_fail
    rx255_cur."!mark_push"(0, rx255_pos, $I10)
  # rx literal  "repeat"
    add $I11, rx255_pos, 6
    gt $I11, rx255_eos, rx255_fail
    sub $I11, rx255_pos, rx255_off
    substr $S10, rx255_tgt, $I11, 6
    ne $S10, "repeat", rx255_fail
    add rx255_pos, 6
    set_addr $I10, rxcap_258_fail
    ($I12, $I11) = rx255_cur."!mark_peek"($I10)
    rx255_cur."!cursor_pos"($I11)
    ($P10) = rx255_cur."!cursor_start"()
    $P10."!cursor_pass"(rx255_pos, "")
    rx255_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_258_done
  rxcap_258_fail:
    goto rx255_fail
  rxcap_258_done:
  # rx subrule "ws" subtype=method negate=
    rx255_cur."!cursor_pos"(rx255_pos)
    $P10 = rx255_cur."ws"()
    unless $P10, rx255_fail
    rx255_pos = $P10."pos"()
  alt260_0:
.annotate "line", 157
    set_addr $I10, alt260_1
    rx255_cur."!mark_push"(0, rx255_pos, $I10)
.annotate "line", 158
  # rx subrule "ws" subtype=method negate=
    rx255_cur."!cursor_pos"(rx255_pos)
    $P10 = rx255_cur."ws"()
    unless $P10, rx255_fail
    rx255_pos = $P10."pos"()
  # rx subcapture "wu"
    set_addr $I10, rxcap_263_fail
    rx255_cur."!mark_push"(0, rx255_pos, $I10)
  alt262_0:
    set_addr $I10, alt262_1
    rx255_cur."!mark_push"(0, rx255_pos, $I10)
  # rx literal  "while"
    add $I11, rx255_pos, 5
    gt $I11, rx255_eos, rx255_fail
    sub $I11, rx255_pos, rx255_off
    substr $S10, rx255_tgt, $I11, 5
    ne $S10, "while", rx255_fail
    add rx255_pos, 5
    goto alt262_end
  alt262_1:
  # rx literal  "until"
    add $I11, rx255_pos, 5
    gt $I11, rx255_eos, rx255_fail
    sub $I11, rx255_pos, rx255_off
    substr $S10, rx255_tgt, $I11, 5
    ne $S10, "until", rx255_fail
    add rx255_pos, 5
  alt262_end:
    set_addr $I10, rxcap_263_fail
    ($I12, $I11) = rx255_cur."!mark_peek"($I10)
    rx255_cur."!cursor_pos"($I11)
    ($P10) = rx255_cur."!cursor_start"()
    $P10."!cursor_pass"(rx255_pos, "")
    rx255_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("wu")
    goto rxcap_263_done
  rxcap_263_fail:
    goto rx255_fail
  rxcap_263_done:
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
    goto alt260_end
  alt260_1:
.annotate "line", 159
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
    $P10."!cursor_names"("pblock")
    rx255_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx255_cur."!cursor_pos"(rx255_pos)
    $P10 = rx255_cur."ws"()
    unless $P10, rx255_fail
    rx255_pos = $P10."pos"()
  # rx subcapture "wu"
    set_addr $I10, rxcap_269_fail
    rx255_cur."!mark_push"(0, rx255_pos, $I10)
  alt268_0:
    set_addr $I10, alt268_1
    rx255_cur."!mark_push"(0, rx255_pos, $I10)
  # rx literal  "while"
    add $I11, rx255_pos, 5
    gt $I11, rx255_eos, rx255_fail
    sub $I11, rx255_pos, rx255_off
    substr $S10, rx255_tgt, $I11, 5
    ne $S10, "while", rx255_fail
    add rx255_pos, 5
    goto alt268_end
  alt268_1:
  # rx literal  "until"
    add $I11, rx255_pos, 5
    gt $I11, rx255_eos, rx255_fail
    sub $I11, rx255_pos, rx255_off
    substr $S10, rx255_tgt, $I11, 5
    ne $S10, "until", rx255_fail
    add rx255_pos, 5
  alt268_end:
    set_addr $I10, rxcap_269_fail
    ($I12, $I11) = rx255_cur."!mark_peek"($I10)
    rx255_cur."!cursor_pos"($I11)
    ($P10) = rx255_cur."!cursor_start"()
    $P10."!cursor_pass"(rx255_pos, "")
    rx255_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("wu")
    goto rxcap_269_done
  rxcap_269_fail:
    goto rx255_fail
  rxcap_269_done:
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
  # rx subrule "EXPR" subtype=capture negate=
    rx255_cur."!cursor_pos"(rx255_pos)
    $P10 = rx255_cur."EXPR"()
    unless $P10, rx255_fail
    rx255_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx255_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx255_cur."!cursor_pos"(rx255_pos)
    $P10 = rx255_cur."ws"()
    unless $P10, rx255_fail
    rx255_pos = $P10."pos"()
  alt260_end:
.annotate "line", 160
  # rx subrule "ws" subtype=method negate=
    rx255_cur."!cursor_pos"(rx255_pos)
    $P10 = rx255_cur."ws"()
    unless $P10, rx255_fail
    rx255_pos = $P10."pos"()
.annotate "line", 155
  # rx pass
    rx255_cur."!cursor_pass"(rx255_pos, "statement_control:sym<repeat>")
    rx255_cur."!cursor_debug"("PASS  ", "statement_control:sym<repeat>", " at pos=", rx255_pos)
    .return (rx255_cur)
  rx255_fail:
.annotate "line", 4
    (rx255_rep, rx255_pos, $I10, $P10) = rx255_cur."!mark_fail"(0)
    lt rx255_pos, -1, rx255_done
    eq rx255_pos, -1, rx255_fail
    jump $I10
  rx255_done:
    rx255_cur."!cursor_fail"()
    rx255_cur."!cursor_debug"("FAIL  ", "statement_control:sym<repeat>")
    .return (rx255_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<repeat>"  :subid("65_1258264446.59978") :method
.annotate "line", 4
    new $P257, "ResizablePMCArray"
    push $P257, "repeat"
    .return ($P257)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<for>"  :subid("66_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx274_tgt
    .local int rx274_pos
    .local int rx274_off
    .local int rx274_eos
    .local int rx274_rep
    .local pmc rx274_cur
    (rx274_cur, rx274_pos, rx274_tgt, $I10) = self."!cursor_start"()
    rx274_cur."!cursor_debug"("START ", "statement_control:sym<for>")
    .lex unicode:"$\x{a2}", rx274_cur
    .local pmc match
    .lex "$/", match
    length rx274_eos, rx274_tgt
    set rx274_off, 0
    lt $I10, 2, rx274_start
    sub rx274_off, $I10, 1
    substr rx274_tgt, rx274_tgt, rx274_off
  rx274_start:
.annotate "line", 164
  # rx subcapture "sym"
    set_addr $I10, rxcap_277_fail
    rx274_cur."!mark_push"(0, rx274_pos, $I10)
  # rx literal  "for"
    add $I11, rx274_pos, 3
    gt $I11, rx274_eos, rx274_fail
    sub $I11, rx274_pos, rx274_off
    substr $S10, rx274_tgt, $I11, 3
    ne $S10, "for", rx274_fail
    add rx274_pos, 3
    set_addr $I10, rxcap_277_fail
    ($I12, $I11) = rx274_cur."!mark_peek"($I10)
    rx274_cur."!cursor_pos"($I11)
    ($P10) = rx274_cur."!cursor_start"()
    $P10."!cursor_pass"(rx274_pos, "")
    rx274_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_277_done
  rxcap_277_fail:
    goto rx274_fail
  rxcap_277_done:
  # rx subrule "ws" subtype=method negate=
    rx274_cur."!cursor_pos"(rx274_pos)
    $P10 = rx274_cur."ws"()
    unless $P10, rx274_fail
    rx274_pos = $P10."pos"()
.annotate "line", 165
  # rx subrule "xblock" subtype=capture negate=
    rx274_cur."!cursor_pos"(rx274_pos)
    $P10 = rx274_cur."xblock"()
    unless $P10, rx274_fail
    rx274_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx274_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx274_cur."!cursor_pos"(rx274_pos)
    $P10 = rx274_cur."ws"()
    unless $P10, rx274_fail
    rx274_pos = $P10."pos"()
.annotate "line", 163
  # rx pass
    rx274_cur."!cursor_pass"(rx274_pos, "statement_control:sym<for>")
    rx274_cur."!cursor_debug"("PASS  ", "statement_control:sym<for>", " at pos=", rx274_pos)
    .return (rx274_cur)
  rx274_fail:
.annotate "line", 4
    (rx274_rep, rx274_pos, $I10, $P10) = rx274_cur."!mark_fail"(0)
    lt rx274_pos, -1, rx274_done
    eq rx274_pos, -1, rx274_fail
    jump $I10
  rx274_done:
    rx274_cur."!cursor_fail"()
    rx274_cur."!cursor_debug"("FAIL  ", "statement_control:sym<for>")
    .return (rx274_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<for>"  :subid("67_1258264446.59978") :method
.annotate "line", 4
    new $P276, "ResizablePMCArray"
    push $P276, "for"
    .return ($P276)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix"  :subid("68_1258264446.59978") :method
.annotate "line", 168
    $P281 = self."!protoregex"("statement_prefix")
    .return ($P281)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix"  :subid("69_1258264446.59978") :method
.annotate "line", 168
    $P283 = self."!PREFIX__!protoregex"("statement_prefix")
    .return ($P283)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<INIT>"  :subid("70_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx285_tgt
    .local int rx285_pos
    .local int rx285_off
    .local int rx285_eos
    .local int rx285_rep
    .local pmc rx285_cur
    (rx285_cur, rx285_pos, rx285_tgt, $I10) = self."!cursor_start"()
    rx285_cur."!cursor_debug"("START ", "statement_prefix:sym<INIT>")
    .lex unicode:"$\x{a2}", rx285_cur
    .local pmc match
    .lex "$/", match
    length rx285_eos, rx285_tgt
    set rx285_off, 0
    lt $I10, 2, rx285_start
    sub rx285_off, $I10, 1
    substr rx285_tgt, rx285_tgt, rx285_off
  rx285_start:
.annotate "line", 169
  # rx subcapture "sym"
    set_addr $I10, rxcap_289_fail
    rx285_cur."!mark_push"(0, rx285_pos, $I10)
  # rx literal  "INIT"
    add $I11, rx285_pos, 4
    gt $I11, rx285_eos, rx285_fail
    sub $I11, rx285_pos, rx285_off
    substr $S10, rx285_tgt, $I11, 4
    ne $S10, "INIT", rx285_fail
    add rx285_pos, 4
    set_addr $I10, rxcap_289_fail
    ($I12, $I11) = rx285_cur."!mark_peek"($I10)
    rx285_cur."!cursor_pos"($I11)
    ($P10) = rx285_cur."!cursor_start"()
    $P10."!cursor_pass"(rx285_pos, "")
    rx285_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_289_done
  rxcap_289_fail:
    goto rx285_fail
  rxcap_289_done:
  # rx subrule "blorst" subtype=capture negate=
    rx285_cur."!cursor_pos"(rx285_pos)
    $P10 = rx285_cur."blorst"()
    unless $P10, rx285_fail
    rx285_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blorst")
    rx285_pos = $P10."pos"()
  # rx pass
    rx285_cur."!cursor_pass"(rx285_pos, "statement_prefix:sym<INIT>")
    rx285_cur."!cursor_debug"("PASS  ", "statement_prefix:sym<INIT>", " at pos=", rx285_pos)
    .return (rx285_cur)
  rx285_fail:
.annotate "line", 4
    (rx285_rep, rx285_pos, $I10, $P10) = rx285_cur."!mark_fail"(0)
    lt rx285_pos, -1, rx285_done
    eq rx285_pos, -1, rx285_fail
    jump $I10
  rx285_done:
    rx285_cur."!cursor_fail"()
    rx285_cur."!cursor_debug"("FAIL  ", "statement_prefix:sym<INIT>")
    .return (rx285_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix:sym<INIT>"  :subid("71_1258264446.59978") :method
.annotate "line", 4
    $P287 = self."!PREFIX__!subrule"("blorst", "INIT")
    new $P288, "ResizablePMCArray"
    push $P288, $P287
    .return ($P288)
.end


.namespace ["NQP";"Grammar"]
.sub "blorst"  :subid("72_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx291_tgt
    .local int rx291_pos
    .local int rx291_off
    .local int rx291_eos
    .local int rx291_rep
    .local pmc rx291_cur
    (rx291_cur, rx291_pos, rx291_tgt, $I10) = self."!cursor_start"()
    rx291_cur."!cursor_debug"("START ", "blorst")
    .lex unicode:"$\x{a2}", rx291_cur
    .local pmc match
    .lex "$/", match
    length rx291_eos, rx291_tgt
    set rx291_off, 0
    lt $I10, 2, rx291_start
    sub rx291_off, $I10, 1
    substr rx291_tgt, rx291_tgt, rx291_off
  rx291_start:
.annotate "line", 172
  # rx charclass s
    ge rx291_pos, rx291_eos, rx291_fail
    sub $I10, rx291_pos, rx291_off
    is_cclass $I11, 32, rx291_tgt, $I10
    unless $I11, rx291_fail
    inc rx291_pos
  # rx subrule "ws" subtype=method negate=
    rx291_cur."!cursor_pos"(rx291_pos)
    $P10 = rx291_cur."ws"()
    unless $P10, rx291_fail
    rx291_pos = $P10."pos"()
  alt294_0:
    set_addr $I10, alt294_1
    rx291_cur."!mark_push"(0, rx291_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx291_pos, rx291_eos, rx291_fail
    sub $I10, rx291_pos, rx291_off
    substr $S10, rx291_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx291_fail
  # rx subrule "block" subtype=capture negate=
    rx291_cur."!cursor_pos"(rx291_pos)
    $P10 = rx291_cur."block"()
    unless $P10, rx291_fail
    rx291_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx291_pos = $P10."pos"()
    goto alt294_end
  alt294_1:
  # rx subrule "statement" subtype=capture negate=
    rx291_cur."!cursor_pos"(rx291_pos)
    $P10 = rx291_cur."statement"()
    unless $P10, rx291_fail
    rx291_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx291_pos = $P10."pos"()
  alt294_end:
.annotate "line", 171
  # rx pass
    rx291_cur."!cursor_pass"(rx291_pos, "blorst")
    rx291_cur."!cursor_debug"("PASS  ", "blorst", " at pos=", rx291_pos)
    .return (rx291_cur)
  rx291_fail:
.annotate "line", 4
    (rx291_rep, rx291_pos, $I10, $P10) = rx291_cur."!mark_fail"(0)
    lt rx291_pos, -1, rx291_done
    eq rx291_pos, -1, rx291_fail
    jump $I10
  rx291_done:
    rx291_cur."!cursor_fail"()
    rx291_cur."!cursor_debug"("FAIL  ", "blorst")
    .return (rx291_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blorst"  :subid("73_1258264446.59978") :method
.annotate "line", 4
    new $P293, "ResizablePMCArray"
    push $P293, ""
    .return ($P293)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond"  :subid("74_1258264446.59978") :method
.annotate "line", 177
    $P296 = self."!protoregex"("statement_mod_cond")
    .return ($P296)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond"  :subid("75_1258264446.59978") :method
.annotate "line", 177
    $P298 = self."!PREFIX__!protoregex"("statement_mod_cond")
    .return ($P298)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<if>"  :subid("76_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx300_tgt
    .local int rx300_pos
    .local int rx300_off
    .local int rx300_eos
    .local int rx300_rep
    .local pmc rx300_cur
    (rx300_cur, rx300_pos, rx300_tgt, $I10) = self."!cursor_start"()
    rx300_cur."!cursor_debug"("START ", "statement_mod_cond:sym<if>")
    .lex unicode:"$\x{a2}", rx300_cur
    .local pmc match
    .lex "$/", match
    length rx300_eos, rx300_tgt
    set rx300_off, 0
    lt $I10, 2, rx300_start
    sub rx300_off, $I10, 1
    substr rx300_tgt, rx300_tgt, rx300_off
  rx300_start:
.annotate "line", 179
  # rx subcapture "sym"
    set_addr $I10, rxcap_303_fail
    rx300_cur."!mark_push"(0, rx300_pos, $I10)
  # rx literal  "if"
    add $I11, rx300_pos, 2
    gt $I11, rx300_eos, rx300_fail
    sub $I11, rx300_pos, rx300_off
    substr $S10, rx300_tgt, $I11, 2
    ne $S10, "if", rx300_fail
    add rx300_pos, 2
    set_addr $I10, rxcap_303_fail
    ($I12, $I11) = rx300_cur."!mark_peek"($I10)
    rx300_cur."!cursor_pos"($I11)
    ($P10) = rx300_cur."!cursor_start"()
    $P10."!cursor_pass"(rx300_pos, "")
    rx300_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_303_done
  rxcap_303_fail:
    goto rx300_fail
  rxcap_303_done:
  # rx subrule "ws" subtype=method negate=
    rx300_cur."!cursor_pos"(rx300_pos)
    $P10 = rx300_cur."ws"()
    unless $P10, rx300_fail
    rx300_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx300_cur."!cursor_pos"(rx300_pos)
    $P10 = rx300_cur."EXPR"()
    unless $P10, rx300_fail
    rx300_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx300_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx300_cur."!cursor_pos"(rx300_pos)
    $P10 = rx300_cur."ws"()
    unless $P10, rx300_fail
    rx300_pos = $P10."pos"()
  # rx pass
    rx300_cur."!cursor_pass"(rx300_pos, "statement_mod_cond:sym<if>")
    rx300_cur."!cursor_debug"("PASS  ", "statement_mod_cond:sym<if>", " at pos=", rx300_pos)
    .return (rx300_cur)
  rx300_fail:
.annotate "line", 4
    (rx300_rep, rx300_pos, $I10, $P10) = rx300_cur."!mark_fail"(0)
    lt rx300_pos, -1, rx300_done
    eq rx300_pos, -1, rx300_fail
    jump $I10
  rx300_done:
    rx300_cur."!cursor_fail"()
    rx300_cur."!cursor_debug"("FAIL  ", "statement_mod_cond:sym<if>")
    .return (rx300_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond:sym<if>"  :subid("77_1258264446.59978") :method
.annotate "line", 4
    new $P302, "ResizablePMCArray"
    push $P302, "if"
    .return ($P302)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<unless>"  :subid("78_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx307_tgt
    .local int rx307_pos
    .local int rx307_off
    .local int rx307_eos
    .local int rx307_rep
    .local pmc rx307_cur
    (rx307_cur, rx307_pos, rx307_tgt, $I10) = self."!cursor_start"()
    rx307_cur."!cursor_debug"("START ", "statement_mod_cond:sym<unless>")
    .lex unicode:"$\x{a2}", rx307_cur
    .local pmc match
    .lex "$/", match
    length rx307_eos, rx307_tgt
    set rx307_off, 0
    lt $I10, 2, rx307_start
    sub rx307_off, $I10, 1
    substr rx307_tgt, rx307_tgt, rx307_off
  rx307_start:
.annotate "line", 180
  # rx subcapture "sym"
    set_addr $I10, rxcap_310_fail
    rx307_cur."!mark_push"(0, rx307_pos, $I10)
  # rx literal  "unless"
    add $I11, rx307_pos, 6
    gt $I11, rx307_eos, rx307_fail
    sub $I11, rx307_pos, rx307_off
    substr $S10, rx307_tgt, $I11, 6
    ne $S10, "unless", rx307_fail
    add rx307_pos, 6
    set_addr $I10, rxcap_310_fail
    ($I12, $I11) = rx307_cur."!mark_peek"($I10)
    rx307_cur."!cursor_pos"($I11)
    ($P10) = rx307_cur."!cursor_start"()
    $P10."!cursor_pass"(rx307_pos, "")
    rx307_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_310_done
  rxcap_310_fail:
    goto rx307_fail
  rxcap_310_done:
  # rx subrule "ws" subtype=method negate=
    rx307_cur."!cursor_pos"(rx307_pos)
    $P10 = rx307_cur."ws"()
    unless $P10, rx307_fail
    rx307_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx307_cur."!cursor_pos"(rx307_pos)
    $P10 = rx307_cur."EXPR"()
    unless $P10, rx307_fail
    rx307_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx307_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx307_cur."!cursor_pos"(rx307_pos)
    $P10 = rx307_cur."ws"()
    unless $P10, rx307_fail
    rx307_pos = $P10."pos"()
  # rx pass
    rx307_cur."!cursor_pass"(rx307_pos, "statement_mod_cond:sym<unless>")
    rx307_cur."!cursor_debug"("PASS  ", "statement_mod_cond:sym<unless>", " at pos=", rx307_pos)
    .return (rx307_cur)
  rx307_fail:
.annotate "line", 4
    (rx307_rep, rx307_pos, $I10, $P10) = rx307_cur."!mark_fail"(0)
    lt rx307_pos, -1, rx307_done
    eq rx307_pos, -1, rx307_fail
    jump $I10
  rx307_done:
    rx307_cur."!cursor_fail"()
    rx307_cur."!cursor_debug"("FAIL  ", "statement_mod_cond:sym<unless>")
    .return (rx307_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond:sym<unless>"  :subid("79_1258264446.59978") :method
.annotate "line", 4
    new $P309, "ResizablePMCArray"
    push $P309, "unless"
    .return ($P309)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop"  :subid("80_1258264446.59978") :method
.annotate "line", 182
    $P314 = self."!protoregex"("statement_mod_loop")
    .return ($P314)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop"  :subid("81_1258264446.59978") :method
.annotate "line", 182
    $P316 = self."!PREFIX__!protoregex"("statement_mod_loop")
    .return ($P316)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<while>"  :subid("82_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx318_tgt
    .local int rx318_pos
    .local int rx318_off
    .local int rx318_eos
    .local int rx318_rep
    .local pmc rx318_cur
    (rx318_cur, rx318_pos, rx318_tgt, $I10) = self."!cursor_start"()
    rx318_cur."!cursor_debug"("START ", "statement_mod_loop:sym<while>")
    .lex unicode:"$\x{a2}", rx318_cur
    .local pmc match
    .lex "$/", match
    length rx318_eos, rx318_tgt
    set rx318_off, 0
    lt $I10, 2, rx318_start
    sub rx318_off, $I10, 1
    substr rx318_tgt, rx318_tgt, rx318_off
  rx318_start:
.annotate "line", 184
  # rx subcapture "sym"
    set_addr $I10, rxcap_321_fail
    rx318_cur."!mark_push"(0, rx318_pos, $I10)
  # rx literal  "while"
    add $I11, rx318_pos, 5
    gt $I11, rx318_eos, rx318_fail
    sub $I11, rx318_pos, rx318_off
    substr $S10, rx318_tgt, $I11, 5
    ne $S10, "while", rx318_fail
    add rx318_pos, 5
    set_addr $I10, rxcap_321_fail
    ($I12, $I11) = rx318_cur."!mark_peek"($I10)
    rx318_cur."!cursor_pos"($I11)
    ($P10) = rx318_cur."!cursor_start"()
    $P10."!cursor_pass"(rx318_pos, "")
    rx318_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_321_done
  rxcap_321_fail:
    goto rx318_fail
  rxcap_321_done:
  # rx subrule "ws" subtype=method negate=
    rx318_cur."!cursor_pos"(rx318_pos)
    $P10 = rx318_cur."ws"()
    unless $P10, rx318_fail
    rx318_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx318_cur."!cursor_pos"(rx318_pos)
    $P10 = rx318_cur."EXPR"()
    unless $P10, rx318_fail
    rx318_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx318_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx318_cur."!cursor_pos"(rx318_pos)
    $P10 = rx318_cur."ws"()
    unless $P10, rx318_fail
    rx318_pos = $P10."pos"()
  # rx pass
    rx318_cur."!cursor_pass"(rx318_pos, "statement_mod_loop:sym<while>")
    rx318_cur."!cursor_debug"("PASS  ", "statement_mod_loop:sym<while>", " at pos=", rx318_pos)
    .return (rx318_cur)
  rx318_fail:
.annotate "line", 4
    (rx318_rep, rx318_pos, $I10, $P10) = rx318_cur."!mark_fail"(0)
    lt rx318_pos, -1, rx318_done
    eq rx318_pos, -1, rx318_fail
    jump $I10
  rx318_done:
    rx318_cur."!cursor_fail"()
    rx318_cur."!cursor_debug"("FAIL  ", "statement_mod_loop:sym<while>")
    .return (rx318_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<while>"  :subid("83_1258264446.59978") :method
.annotate "line", 4
    new $P320, "ResizablePMCArray"
    push $P320, "while"
    .return ($P320)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<until>"  :subid("84_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx325_tgt
    .local int rx325_pos
    .local int rx325_off
    .local int rx325_eos
    .local int rx325_rep
    .local pmc rx325_cur
    (rx325_cur, rx325_pos, rx325_tgt, $I10) = self."!cursor_start"()
    rx325_cur."!cursor_debug"("START ", "statement_mod_loop:sym<until>")
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
  # rx subcapture "sym"
    set_addr $I10, rxcap_328_fail
    rx325_cur."!mark_push"(0, rx325_pos, $I10)
  # rx literal  "until"
    add $I11, rx325_pos, 5
    gt $I11, rx325_eos, rx325_fail
    sub $I11, rx325_pos, rx325_off
    substr $S10, rx325_tgt, $I11, 5
    ne $S10, "until", rx325_fail
    add rx325_pos, 5
    set_addr $I10, rxcap_328_fail
    ($I12, $I11) = rx325_cur."!mark_peek"($I10)
    rx325_cur."!cursor_pos"($I11)
    ($P10) = rx325_cur."!cursor_start"()
    $P10."!cursor_pass"(rx325_pos, "")
    rx325_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_328_done
  rxcap_328_fail:
    goto rx325_fail
  rxcap_328_done:
  # rx subrule "ws" subtype=method negate=
    rx325_cur."!cursor_pos"(rx325_pos)
    $P10 = rx325_cur."ws"()
    unless $P10, rx325_fail
    rx325_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx325_cur."!cursor_pos"(rx325_pos)
    $P10 = rx325_cur."EXPR"()
    unless $P10, rx325_fail
    rx325_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx325_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx325_cur."!cursor_pos"(rx325_pos)
    $P10 = rx325_cur."ws"()
    unless $P10, rx325_fail
    rx325_pos = $P10."pos"()
  # rx pass
    rx325_cur."!cursor_pass"(rx325_pos, "statement_mod_loop:sym<until>")
    rx325_cur."!cursor_debug"("PASS  ", "statement_mod_loop:sym<until>", " at pos=", rx325_pos)
    .return (rx325_cur)
  rx325_fail:
.annotate "line", 4
    (rx325_rep, rx325_pos, $I10, $P10) = rx325_cur."!mark_fail"(0)
    lt rx325_pos, -1, rx325_done
    eq rx325_pos, -1, rx325_fail
    jump $I10
  rx325_done:
    rx325_cur."!cursor_fail"()
    rx325_cur."!cursor_debug"("FAIL  ", "statement_mod_loop:sym<until>")
    .return (rx325_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<until>"  :subid("85_1258264446.59978") :method
.annotate "line", 4
    new $P327, "ResizablePMCArray"
    push $P327, "until"
    .return ($P327)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<colonpair>"  :subid("86_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx332_tgt
    .local int rx332_pos
    .local int rx332_off
    .local int rx332_eos
    .local int rx332_rep
    .local pmc rx332_cur
    (rx332_cur, rx332_pos, rx332_tgt, $I10) = self."!cursor_start"()
    rx332_cur."!cursor_debug"("START ", "term:sym<colonpair>")
    .lex unicode:"$\x{a2}", rx332_cur
    .local pmc match
    .lex "$/", match
    length rx332_eos, rx332_tgt
    set rx332_off, 0
    lt $I10, 2, rx332_start
    sub rx332_off, $I10, 1
    substr rx332_tgt, rx332_tgt, rx332_off
  rx332_start:
.annotate "line", 189
  # rx subrule "colonpair" subtype=capture negate=
    rx332_cur."!cursor_pos"(rx332_pos)
    $P10 = rx332_cur."colonpair"()
    unless $P10, rx332_fail
    rx332_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("colonpair")
    rx332_pos = $P10."pos"()
  # rx pass
    rx332_cur."!cursor_pass"(rx332_pos, "term:sym<colonpair>")
    rx332_cur."!cursor_debug"("PASS  ", "term:sym<colonpair>", " at pos=", rx332_pos)
    .return (rx332_cur)
  rx332_fail:
.annotate "line", 4
    (rx332_rep, rx332_pos, $I10, $P10) = rx332_cur."!mark_fail"(0)
    lt rx332_pos, -1, rx332_done
    eq rx332_pos, -1, rx332_fail
    jump $I10
  rx332_done:
    rx332_cur."!cursor_fail"()
    rx332_cur."!cursor_debug"("FAIL  ", "term:sym<colonpair>")
    .return (rx332_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<colonpair>"  :subid("87_1258264446.59978") :method
.annotate "line", 4
    $P334 = self."!PREFIX__!subrule"("colonpair", "")
    new $P335, "ResizablePMCArray"
    push $P335, $P334
    .return ($P335)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<variable>"  :subid("88_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx337_tgt
    .local int rx337_pos
    .local int rx337_off
    .local int rx337_eos
    .local int rx337_rep
    .local pmc rx337_cur
    (rx337_cur, rx337_pos, rx337_tgt, $I10) = self."!cursor_start"()
    rx337_cur."!cursor_debug"("START ", "term:sym<variable>")
    .lex unicode:"$\x{a2}", rx337_cur
    .local pmc match
    .lex "$/", match
    length rx337_eos, rx337_tgt
    set rx337_off, 0
    lt $I10, 2, rx337_start
    sub rx337_off, $I10, 1
    substr rx337_tgt, rx337_tgt, rx337_off
  rx337_start:
.annotate "line", 190
  # rx subrule "variable" subtype=capture negate=
    rx337_cur."!cursor_pos"(rx337_pos)
    $P10 = rx337_cur."variable"()
    unless $P10, rx337_fail
    rx337_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx337_pos = $P10."pos"()
  # rx pass
    rx337_cur."!cursor_pass"(rx337_pos, "term:sym<variable>")
    rx337_cur."!cursor_debug"("PASS  ", "term:sym<variable>", " at pos=", rx337_pos)
    .return (rx337_cur)
  rx337_fail:
.annotate "line", 4
    (rx337_rep, rx337_pos, $I10, $P10) = rx337_cur."!mark_fail"(0)
    lt rx337_pos, -1, rx337_done
    eq rx337_pos, -1, rx337_fail
    jump $I10
  rx337_done:
    rx337_cur."!cursor_fail"()
    rx337_cur."!cursor_debug"("FAIL  ", "term:sym<variable>")
    .return (rx337_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<variable>"  :subid("89_1258264446.59978") :method
.annotate "line", 4
    $P339 = self."!PREFIX__!subrule"("variable", "")
    new $P340, "ResizablePMCArray"
    push $P340, $P339
    .return ($P340)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<package_declarator>"  :subid("90_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx342_tgt
    .local int rx342_pos
    .local int rx342_off
    .local int rx342_eos
    .local int rx342_rep
    .local pmc rx342_cur
    (rx342_cur, rx342_pos, rx342_tgt, $I10) = self."!cursor_start"()
    rx342_cur."!cursor_debug"("START ", "term:sym<package_declarator>")
    .lex unicode:"$\x{a2}", rx342_cur
    .local pmc match
    .lex "$/", match
    length rx342_eos, rx342_tgt
    set rx342_off, 0
    lt $I10, 2, rx342_start
    sub rx342_off, $I10, 1
    substr rx342_tgt, rx342_tgt, rx342_off
  rx342_start:
.annotate "line", 191
  # rx subrule "package_declarator" subtype=capture negate=
    rx342_cur."!cursor_pos"(rx342_pos)
    $P10 = rx342_cur."package_declarator"()
    unless $P10, rx342_fail
    rx342_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_declarator")
    rx342_pos = $P10."pos"()
  # rx pass
    rx342_cur."!cursor_pass"(rx342_pos, "term:sym<package_declarator>")
    rx342_cur."!cursor_debug"("PASS  ", "term:sym<package_declarator>", " at pos=", rx342_pos)
    .return (rx342_cur)
  rx342_fail:
.annotate "line", 4
    (rx342_rep, rx342_pos, $I10, $P10) = rx342_cur."!mark_fail"(0)
    lt rx342_pos, -1, rx342_done
    eq rx342_pos, -1, rx342_fail
    jump $I10
  rx342_done:
    rx342_cur."!cursor_fail"()
    rx342_cur."!cursor_debug"("FAIL  ", "term:sym<package_declarator>")
    .return (rx342_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<package_declarator>"  :subid("91_1258264446.59978") :method
.annotate "line", 4
    $P344 = self."!PREFIX__!subrule"("package_declarator", "")
    new $P345, "ResizablePMCArray"
    push $P345, $P344
    .return ($P345)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<scope_declarator>"  :subid("92_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx347_tgt
    .local int rx347_pos
    .local int rx347_off
    .local int rx347_eos
    .local int rx347_rep
    .local pmc rx347_cur
    (rx347_cur, rx347_pos, rx347_tgt, $I10) = self."!cursor_start"()
    rx347_cur."!cursor_debug"("START ", "term:sym<scope_declarator>")
    .lex unicode:"$\x{a2}", rx347_cur
    .local pmc match
    .lex "$/", match
    length rx347_eos, rx347_tgt
    set rx347_off, 0
    lt $I10, 2, rx347_start
    sub rx347_off, $I10, 1
    substr rx347_tgt, rx347_tgt, rx347_off
  rx347_start:
.annotate "line", 192
  # rx subrule "scope_declarator" subtype=capture negate=
    rx347_cur."!cursor_pos"(rx347_pos)
    $P10 = rx347_cur."scope_declarator"()
    unless $P10, rx347_fail
    rx347_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scope_declarator")
    rx347_pos = $P10."pos"()
  # rx pass
    rx347_cur."!cursor_pass"(rx347_pos, "term:sym<scope_declarator>")
    rx347_cur."!cursor_debug"("PASS  ", "term:sym<scope_declarator>", " at pos=", rx347_pos)
    .return (rx347_cur)
  rx347_fail:
.annotate "line", 4
    (rx347_rep, rx347_pos, $I10, $P10) = rx347_cur."!mark_fail"(0)
    lt rx347_pos, -1, rx347_done
    eq rx347_pos, -1, rx347_fail
    jump $I10
  rx347_done:
    rx347_cur."!cursor_fail"()
    rx347_cur."!cursor_debug"("FAIL  ", "term:sym<scope_declarator>")
    .return (rx347_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<scope_declarator>"  :subid("93_1258264446.59978") :method
.annotate "line", 4
    $P349 = self."!PREFIX__!subrule"("scope_declarator", "")
    new $P350, "ResizablePMCArray"
    push $P350, $P349
    .return ($P350)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<routine_declarator>"  :subid("94_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx352_tgt
    .local int rx352_pos
    .local int rx352_off
    .local int rx352_eos
    .local int rx352_rep
    .local pmc rx352_cur
    (rx352_cur, rx352_pos, rx352_tgt, $I10) = self."!cursor_start"()
    rx352_cur."!cursor_debug"("START ", "term:sym<routine_declarator>")
    .lex unicode:"$\x{a2}", rx352_cur
    .local pmc match
    .lex "$/", match
    length rx352_eos, rx352_tgt
    set rx352_off, 0
    lt $I10, 2, rx352_start
    sub rx352_off, $I10, 1
    substr rx352_tgt, rx352_tgt, rx352_off
  rx352_start:
.annotate "line", 193
  # rx subrule "routine_declarator" subtype=capture negate=
    rx352_cur."!cursor_pos"(rx352_pos)
    $P10 = rx352_cur."routine_declarator"()
    unless $P10, rx352_fail
    rx352_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx352_pos = $P10."pos"()
  # rx pass
    rx352_cur."!cursor_pass"(rx352_pos, "term:sym<routine_declarator>")
    rx352_cur."!cursor_debug"("PASS  ", "term:sym<routine_declarator>", " at pos=", rx352_pos)
    .return (rx352_cur)
  rx352_fail:
.annotate "line", 4
    (rx352_rep, rx352_pos, $I10, $P10) = rx352_cur."!mark_fail"(0)
    lt rx352_pos, -1, rx352_done
    eq rx352_pos, -1, rx352_fail
    jump $I10
  rx352_done:
    rx352_cur."!cursor_fail"()
    rx352_cur."!cursor_debug"("FAIL  ", "term:sym<routine_declarator>")
    .return (rx352_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<routine_declarator>"  :subid("95_1258264446.59978") :method
.annotate "line", 4
    $P354 = self."!PREFIX__!subrule"("routine_declarator", "")
    new $P355, "ResizablePMCArray"
    push $P355, $P354
    .return ($P355)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<regex_declarator>"  :subid("96_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx357_tgt
    .local int rx357_pos
    .local int rx357_off
    .local int rx357_eos
    .local int rx357_rep
    .local pmc rx357_cur
    (rx357_cur, rx357_pos, rx357_tgt, $I10) = self."!cursor_start"()
    rx357_cur."!cursor_debug"("START ", "term:sym<regex_declarator>")
    .lex unicode:"$\x{a2}", rx357_cur
    .local pmc match
    .lex "$/", match
    length rx357_eos, rx357_tgt
    set rx357_off, 0
    lt $I10, 2, rx357_start
    sub rx357_off, $I10, 1
    substr rx357_tgt, rx357_tgt, rx357_off
  rx357_start:
.annotate "line", 194
  # rx subrule "regex_declarator" subtype=capture negate=
    rx357_cur."!cursor_pos"(rx357_pos)
    $P10 = rx357_cur."regex_declarator"()
    unless $P10, rx357_fail
    rx357_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("regex_declarator")
    rx357_pos = $P10."pos"()
  # rx pass
    rx357_cur."!cursor_pass"(rx357_pos, "term:sym<regex_declarator>")
    rx357_cur."!cursor_debug"("PASS  ", "term:sym<regex_declarator>", " at pos=", rx357_pos)
    .return (rx357_cur)
  rx357_fail:
.annotate "line", 4
    (rx357_rep, rx357_pos, $I10, $P10) = rx357_cur."!mark_fail"(0)
    lt rx357_pos, -1, rx357_done
    eq rx357_pos, -1, rx357_fail
    jump $I10
  rx357_done:
    rx357_cur."!cursor_fail"()
    rx357_cur."!cursor_debug"("FAIL  ", "term:sym<regex_declarator>")
    .return (rx357_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<regex_declarator>"  :subid("97_1258264446.59978") :method
.annotate "line", 4
    $P359 = self."!PREFIX__!subrule"("regex_declarator", "")
    new $P360, "ResizablePMCArray"
    push $P360, $P359
    .return ($P360)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<statement_prefix>"  :subid("98_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx362_tgt
    .local int rx362_pos
    .local int rx362_off
    .local int rx362_eos
    .local int rx362_rep
    .local pmc rx362_cur
    (rx362_cur, rx362_pos, rx362_tgt, $I10) = self."!cursor_start"()
    rx362_cur."!cursor_debug"("START ", "term:sym<statement_prefix>")
    .lex unicode:"$\x{a2}", rx362_cur
    .local pmc match
    .lex "$/", match
    length rx362_eos, rx362_tgt
    set rx362_off, 0
    lt $I10, 2, rx362_start
    sub rx362_off, $I10, 1
    substr rx362_tgt, rx362_tgt, rx362_off
  rx362_start:
.annotate "line", 195
  # rx subrule "statement_prefix" subtype=capture negate=
    rx362_cur."!cursor_pos"(rx362_pos)
    $P10 = rx362_cur."statement_prefix"()
    unless $P10, rx362_fail
    rx362_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_prefix")
    rx362_pos = $P10."pos"()
  # rx pass
    rx362_cur."!cursor_pass"(rx362_pos, "term:sym<statement_prefix>")
    rx362_cur."!cursor_debug"("PASS  ", "term:sym<statement_prefix>", " at pos=", rx362_pos)
    .return (rx362_cur)
  rx362_fail:
.annotate "line", 4
    (rx362_rep, rx362_pos, $I10, $P10) = rx362_cur."!mark_fail"(0)
    lt rx362_pos, -1, rx362_done
    eq rx362_pos, -1, rx362_fail
    jump $I10
  rx362_done:
    rx362_cur."!cursor_fail"()
    rx362_cur."!cursor_debug"("FAIL  ", "term:sym<statement_prefix>")
    .return (rx362_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<statement_prefix>"  :subid("99_1258264446.59978") :method
.annotate "line", 4
    $P364 = self."!PREFIX__!subrule"("statement_prefix", "")
    new $P365, "ResizablePMCArray"
    push $P365, $P364
    .return ($P365)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<lambda>"  :subid("100_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx367_tgt
    .local int rx367_pos
    .local int rx367_off
    .local int rx367_eos
    .local int rx367_rep
    .local pmc rx367_cur
    (rx367_cur, rx367_pos, rx367_tgt, $I10) = self."!cursor_start"()
    rx367_cur."!cursor_debug"("START ", "term:sym<lambda>")
    .lex unicode:"$\x{a2}", rx367_cur
    .local pmc match
    .lex "$/", match
    length rx367_eos, rx367_tgt
    set rx367_off, 0
    lt $I10, 2, rx367_start
    sub rx367_off, $I10, 1
    substr rx367_tgt, rx367_tgt, rx367_off
  rx367_start:
.annotate "line", 196
  # rx subrule "lambda" subtype=zerowidth negate=
    rx367_cur."!cursor_pos"(rx367_pos)
    $P10 = rx367_cur."lambda"()
    unless $P10, rx367_fail
  # rx subrule "pblock" subtype=capture negate=
    rx367_cur."!cursor_pos"(rx367_pos)
    $P10 = rx367_cur."pblock"()
    unless $P10, rx367_fail
    rx367_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx367_pos = $P10."pos"()
  # rx pass
    rx367_cur."!cursor_pass"(rx367_pos, "term:sym<lambda>")
    rx367_cur."!cursor_debug"("PASS  ", "term:sym<lambda>", " at pos=", rx367_pos)
    .return (rx367_cur)
  rx367_fail:
.annotate "line", 4
    (rx367_rep, rx367_pos, $I10, $P10) = rx367_cur."!mark_fail"(0)
    lt rx367_pos, -1, rx367_done
    eq rx367_pos, -1, rx367_fail
    jump $I10
  rx367_done:
    rx367_cur."!cursor_fail"()
    rx367_cur."!cursor_debug"("FAIL  ", "term:sym<lambda>")
    .return (rx367_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<lambda>"  :subid("101_1258264446.59978") :method
.annotate "line", 4
    new $P369, "ResizablePMCArray"
    push $P369, ""
    .return ($P369)
.end


.namespace ["NQP";"Grammar"]
.sub "colonpair"  :subid("102_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx371_tgt
    .local int rx371_pos
    .local int rx371_off
    .local int rx371_eos
    .local int rx371_rep
    .local pmc rx371_cur
    (rx371_cur, rx371_pos, rx371_tgt, $I10) = self."!cursor_start"()
    rx371_cur."!cursor_debug"("START ", "colonpair")
    rx371_cur."!cursor_caparray"("circumfix")
    .lex unicode:"$\x{a2}", rx371_cur
    .local pmc match
    .lex "$/", match
    length rx371_eos, rx371_tgt
    set rx371_off, 0
    lt $I10, 2, rx371_start
    sub rx371_off, $I10, 1
    substr rx371_tgt, rx371_tgt, rx371_off
  rx371_start:
.annotate "line", 199
  # rx literal  ":"
    add $I11, rx371_pos, 1
    gt $I11, rx371_eos, rx371_fail
    sub $I11, rx371_pos, rx371_off
    substr $S10, rx371_tgt, $I11, 1
    ne $S10, ":", rx371_fail
    add rx371_pos, 1
  alt376_0:
.annotate "line", 200
    set_addr $I10, alt376_1
    rx371_cur."!mark_push"(0, rx371_pos, $I10)
.annotate "line", 201
  # rx subcapture "not"
    set_addr $I10, rxcap_377_fail
    rx371_cur."!mark_push"(0, rx371_pos, $I10)
  # rx literal  "!"
    add $I11, rx371_pos, 1
    gt $I11, rx371_eos, rx371_fail
    sub $I11, rx371_pos, rx371_off
    substr $S10, rx371_tgt, $I11, 1
    ne $S10, "!", rx371_fail
    add rx371_pos, 1
    set_addr $I10, rxcap_377_fail
    ($I12, $I11) = rx371_cur."!mark_peek"($I10)
    rx371_cur."!cursor_pos"($I11)
    ($P10) = rx371_cur."!cursor_start"()
    $P10."!cursor_pass"(rx371_pos, "")
    rx371_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("not")
    goto rxcap_377_done
  rxcap_377_fail:
    goto rx371_fail
  rxcap_377_done:
  # rx subrule "identifier" subtype=capture negate=
    rx371_cur."!cursor_pos"(rx371_pos)
    $P10 = rx371_cur."identifier"()
    unless $P10, rx371_fail
    rx371_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx371_pos = $P10."pos"()
    goto alt376_end
  alt376_1:
.annotate "line", 202
  # rx subrule "identifier" subtype=capture negate=
    rx371_cur."!cursor_pos"(rx371_pos)
    $P10 = rx371_cur."identifier"()
    unless $P10, rx371_fail
    rx371_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx371_pos = $P10."pos"()
  # rx rxquantr378 ** 0..1
    set_addr $I379, rxquantr378_done
    rx371_cur."!mark_push"(0, rx371_pos, $I379)
  rxquantr378_loop:
  # rx subrule "circumfix" subtype=capture negate=
    rx371_cur."!cursor_pos"(rx371_pos)
    $P10 = rx371_cur."circumfix"()
    unless $P10, rx371_fail
    rx371_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx371_pos = $P10."pos"()
    (rx371_rep) = rx371_cur."!mark_commit"($I379)
  rxquantr378_done:
  alt376_end:
.annotate "line", 198
  # rx pass
    rx371_cur."!cursor_pass"(rx371_pos, "colonpair")
    rx371_cur."!cursor_debug"("PASS  ", "colonpair", " at pos=", rx371_pos)
    .return (rx371_cur)
  rx371_fail:
.annotate "line", 4
    (rx371_rep, rx371_pos, $I10, $P10) = rx371_cur."!mark_fail"(0)
    lt rx371_pos, -1, rx371_done
    eq rx371_pos, -1, rx371_fail
    jump $I10
  rx371_done:
    rx371_cur."!cursor_fail"()
    rx371_cur."!cursor_debug"("FAIL  ", "colonpair")
    .return (rx371_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__colonpair"  :subid("103_1258264446.59978") :method
.annotate "line", 4
    $P373 = self."!PREFIX__!subrule"("identifier", ":")
    $P374 = self."!PREFIX__!subrule"("identifier", ":!")
    new $P375, "ResizablePMCArray"
    push $P375, $P373
    push $P375, $P374
    .return ($P375)
.end


.namespace ["NQP";"Grammar"]
.sub "variable"  :subid("104_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx381_tgt
    .local int rx381_pos
    .local int rx381_off
    .local int rx381_eos
    .local int rx381_rep
    .local pmc rx381_cur
    (rx381_cur, rx381_pos, rx381_tgt, $I10) = self."!cursor_start"()
    rx381_cur."!cursor_debug"("START ", "variable")
    rx381_cur."!cursor_caparray"("twigil")
    .lex unicode:"$\x{a2}", rx381_cur
    .local pmc match
    .lex "$/", match
    length rx381_eos, rx381_tgt
    set rx381_off, 0
    lt $I10, 2, rx381_start
    sub rx381_off, $I10, 1
    substr rx381_tgt, rx381_tgt, rx381_off
  rx381_start:
  alt386_0:
.annotate "line", 206
    set_addr $I10, alt386_1
    rx381_cur."!mark_push"(0, rx381_pos, $I10)
.annotate "line", 207
  # rx subrule "sigil" subtype=capture negate=
    rx381_cur."!cursor_pos"(rx381_pos)
    $P10 = rx381_cur."sigil"()
    unless $P10, rx381_fail
    rx381_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx381_pos = $P10."pos"()
  # rx rxquantr387 ** 0..1
    set_addr $I388, rxquantr387_done
    rx381_cur."!mark_push"(0, rx381_pos, $I388)
  rxquantr387_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx381_cur."!cursor_pos"(rx381_pos)
    $P10 = rx381_cur."twigil"()
    unless $P10, rx381_fail
    rx381_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx381_pos = $P10."pos"()
    (rx381_rep) = rx381_cur."!mark_commit"($I388)
  rxquantr387_done:
  # rx subrule "ident" subtype=capture negate=
    rx381_cur."!cursor_pos"(rx381_pos)
    $P10 = rx381_cur."ident"()
    unless $P10, rx381_fail
    rx381_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    rx381_pos = $P10."pos"()
    goto alt386_end
  alt386_1:
    set_addr $I10, alt386_2
    rx381_cur."!mark_push"(0, rx381_pos, $I10)
.annotate "line", 208
  # rx subrule "sigil" subtype=capture negate=
    rx381_cur."!cursor_pos"(rx381_pos)
    $P10 = rx381_cur."sigil"()
    unless $P10, rx381_fail
    rx381_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx381_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx381_pos, rx381_eos, rx381_fail
    sub $I10, rx381_pos, rx381_off
    substr $S10, rx381_tgt, $I10, 1
    index $I11, "<[", $S10
    lt $I11, 0, rx381_fail
  # rx subrule "postcircumfix" subtype=capture negate=
    rx381_cur."!cursor_pos"(rx381_pos)
    $P10 = rx381_cur."postcircumfix"()
    unless $P10, rx381_fail
    rx381_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("postcircumfix")
    rx381_pos = $P10."pos"()
    goto alt386_end
  alt386_2:
.annotate "line", 209
  # rx subcapture "sigil"
    set_addr $I10, rxcap_389_fail
    rx381_cur."!mark_push"(0, rx381_pos, $I10)
  # rx literal  "$"
    add $I11, rx381_pos, 1
    gt $I11, rx381_eos, rx381_fail
    sub $I11, rx381_pos, rx381_off
    substr $S10, rx381_tgt, $I11, 1
    ne $S10, "$", rx381_fail
    add rx381_pos, 1
    set_addr $I10, rxcap_389_fail
    ($I12, $I11) = rx381_cur."!mark_peek"($I10)
    rx381_cur."!cursor_pos"($I11)
    ($P10) = rx381_cur."!cursor_start"()
    $P10."!cursor_pass"(rx381_pos, "")
    rx381_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    goto rxcap_389_done
  rxcap_389_fail:
    goto rx381_fail
  rxcap_389_done:
  # rx subcapture "desigilname"
    set_addr $I10, rxcap_390_fail
    rx381_cur."!mark_push"(0, rx381_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx381_pos, rx381_eos, rx381_fail
    sub $I10, rx381_pos, rx381_off
    substr $S10, rx381_tgt, $I10, 1
    index $I11, "/_!", $S10
    lt $I11, 0, rx381_fail
    inc rx381_pos
    set_addr $I10, rxcap_390_fail
    ($I12, $I11) = rx381_cur."!mark_peek"($I10)
    rx381_cur."!cursor_pos"($I11)
    ($P10) = rx381_cur."!cursor_start"()
    $P10."!cursor_pass"(rx381_pos, "")
    rx381_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    goto rxcap_390_done
  rxcap_390_fail:
    goto rx381_fail
  rxcap_390_done:
  alt386_end:
.annotate "line", 206
  # rx pass
    rx381_cur."!cursor_pass"(rx381_pos, "variable")
    rx381_cur."!cursor_debug"("PASS  ", "variable", " at pos=", rx381_pos)
    .return (rx381_cur)
  rx381_fail:
.annotate "line", 4
    (rx381_rep, rx381_pos, $I10, $P10) = rx381_cur."!mark_fail"(0)
    lt rx381_pos, -1, rx381_done
    eq rx381_pos, -1, rx381_fail
    jump $I10
  rx381_done:
    rx381_cur."!cursor_fail"()
    rx381_cur."!cursor_debug"("FAIL  ", "variable")
    .return (rx381_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable"  :subid("105_1258264446.59978") :method
.annotate "line", 4
    $P383 = self."!PREFIX__!subrule"("sigil", "")
    $P384 = self."!PREFIX__!subrule"("sigil", "")
    new $P385, "ResizablePMCArray"
    push $P385, "$!"
    push $P385, "$_"
    push $P385, "$/"
    push $P385, $P383
    push $P385, $P384
    .return ($P385)
.end


.namespace ["NQP";"Grammar"]
.sub "sigil"  :subid("106_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx392_tgt
    .local int rx392_pos
    .local int rx392_off
    .local int rx392_eos
    .local int rx392_rep
    .local pmc rx392_cur
    (rx392_cur, rx392_pos, rx392_tgt, $I10) = self."!cursor_start"()
    rx392_cur."!cursor_debug"("START ", "sigil")
    .lex unicode:"$\x{a2}", rx392_cur
    .local pmc match
    .lex "$/", match
    length rx392_eos, rx392_tgt
    set rx392_off, 0
    lt $I10, 2, rx392_start
    sub rx392_off, $I10, 1
    substr rx392_tgt, rx392_tgt, rx392_off
  rx392_start:
.annotate "line", 212
  # rx enumcharlist negate=0 
    ge rx392_pos, rx392_eos, rx392_fail
    sub $I10, rx392_pos, rx392_off
    substr $S10, rx392_tgt, $I10, 1
    index $I11, "$@%&", $S10
    lt $I11, 0, rx392_fail
    inc rx392_pos
  # rx pass
    rx392_cur."!cursor_pass"(rx392_pos, "sigil")
    rx392_cur."!cursor_debug"("PASS  ", "sigil", " at pos=", rx392_pos)
    .return (rx392_cur)
  rx392_fail:
.annotate "line", 4
    (rx392_rep, rx392_pos, $I10, $P10) = rx392_cur."!mark_fail"(0)
    lt rx392_pos, -1, rx392_done
    eq rx392_pos, -1, rx392_fail
    jump $I10
  rx392_done:
    rx392_cur."!cursor_fail"()
    rx392_cur."!cursor_debug"("FAIL  ", "sigil")
    .return (rx392_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__sigil"  :subid("107_1258264446.59978") :method
.annotate "line", 4
    new $P394, "ResizablePMCArray"
    push $P394, "&"
    push $P394, "%"
    push $P394, "@"
    push $P394, "$"
    .return ($P394)
.end


.namespace ["NQP";"Grammar"]
.sub "twigil"  :subid("108_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx396_tgt
    .local int rx396_pos
    .local int rx396_off
    .local int rx396_eos
    .local int rx396_rep
    .local pmc rx396_cur
    (rx396_cur, rx396_pos, rx396_tgt, $I10) = self."!cursor_start"()
    rx396_cur."!cursor_debug"("START ", "twigil")
    .lex unicode:"$\x{a2}", rx396_cur
    .local pmc match
    .lex "$/", match
    length rx396_eos, rx396_tgt
    set rx396_off, 0
    lt $I10, 2, rx396_start
    sub rx396_off, $I10, 1
    substr rx396_tgt, rx396_tgt, rx396_off
  rx396_start:
.annotate "line", 214
  # rx enumcharlist negate=0 
    ge rx396_pos, rx396_eos, rx396_fail
    sub $I10, rx396_pos, rx396_off
    substr $S10, rx396_tgt, $I10, 1
    index $I11, "*!?", $S10
    lt $I11, 0, rx396_fail
    inc rx396_pos
  # rx pass
    rx396_cur."!cursor_pass"(rx396_pos, "twigil")
    rx396_cur."!cursor_debug"("PASS  ", "twigil", " at pos=", rx396_pos)
    .return (rx396_cur)
  rx396_fail:
.annotate "line", 4
    (rx396_rep, rx396_pos, $I10, $P10) = rx396_cur."!mark_fail"(0)
    lt rx396_pos, -1, rx396_done
    eq rx396_pos, -1, rx396_fail
    jump $I10
  rx396_done:
    rx396_cur."!cursor_fail"()
    rx396_cur."!cursor_debug"("FAIL  ", "twigil")
    .return (rx396_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__twigil"  :subid("109_1258264446.59978") :method
.annotate "line", 4
    new $P398, "ResizablePMCArray"
    push $P398, "?"
    push $P398, "!"
    push $P398, "*"
    .return ($P398)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator"  :subid("110_1258264446.59978") :method
.annotate "line", 216
    $P400 = self."!protoregex"("package_declarator")
    .return ($P400)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator"  :subid("111_1258264446.59978") :method
.annotate "line", 216
    $P402 = self."!PREFIX__!protoregex"("package_declarator")
    .return ($P402)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<module>"  :subid("112_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx404_tgt
    .local int rx404_pos
    .local int rx404_off
    .local int rx404_eos
    .local int rx404_rep
    .local pmc rx404_cur
    (rx404_cur, rx404_pos, rx404_tgt, $I10) = self."!cursor_start"()
    rx404_cur."!cursor_debug"("START ", "package_declarator:sym<module>")
    .lex unicode:"$\x{a2}", rx404_cur
    .local pmc match
    .lex "$/", match
    length rx404_eos, rx404_tgt
    set rx404_off, 0
    lt $I10, 2, rx404_start
    sub rx404_off, $I10, 1
    substr rx404_tgt, rx404_tgt, rx404_off
  rx404_start:
.annotate "line", 217
  # rx subcapture "sym"
    set_addr $I10, rxcap_408_fail
    rx404_cur."!mark_push"(0, rx404_pos, $I10)
  # rx literal  "module"
    add $I11, rx404_pos, 6
    gt $I11, rx404_eos, rx404_fail
    sub $I11, rx404_pos, rx404_off
    substr $S10, rx404_tgt, $I11, 6
    ne $S10, "module", rx404_fail
    add rx404_pos, 6
    set_addr $I10, rxcap_408_fail
    ($I12, $I11) = rx404_cur."!mark_peek"($I10)
    rx404_cur."!cursor_pos"($I11)
    ($P10) = rx404_cur."!cursor_start"()
    $P10."!cursor_pass"(rx404_pos, "")
    rx404_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_408_done
  rxcap_408_fail:
    goto rx404_fail
  rxcap_408_done:
  # rx subrule "package_def" subtype=capture negate=
    rx404_cur."!cursor_pos"(rx404_pos)
    $P10 = rx404_cur."package_def"()
    unless $P10, rx404_fail
    rx404_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx404_pos = $P10."pos"()
  # rx pass
    rx404_cur."!cursor_pass"(rx404_pos, "package_declarator:sym<module>")
    rx404_cur."!cursor_debug"("PASS  ", "package_declarator:sym<module>", " at pos=", rx404_pos)
    .return (rx404_cur)
  rx404_fail:
.annotate "line", 4
    (rx404_rep, rx404_pos, $I10, $P10) = rx404_cur."!mark_fail"(0)
    lt rx404_pos, -1, rx404_done
    eq rx404_pos, -1, rx404_fail
    jump $I10
  rx404_done:
    rx404_cur."!cursor_fail"()
    rx404_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<module>")
    .return (rx404_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<module>"  :subid("113_1258264446.59978") :method
.annotate "line", 4
    $P406 = self."!PREFIX__!subrule"("package_def", "module")
    new $P407, "ResizablePMCArray"
    push $P407, $P406
    .return ($P407)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<class>"  :subid("114_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx410_tgt
    .local int rx410_pos
    .local int rx410_off
    .local int rx410_eos
    .local int rx410_rep
    .local pmc rx410_cur
    (rx410_cur, rx410_pos, rx410_tgt, $I10) = self."!cursor_start"()
    rx410_cur."!cursor_debug"("START ", "package_declarator:sym<class>")
    .lex unicode:"$\x{a2}", rx410_cur
    .local pmc match
    .lex "$/", match
    length rx410_eos, rx410_tgt
    set rx410_off, 0
    lt $I10, 2, rx410_start
    sub rx410_off, $I10, 1
    substr rx410_tgt, rx410_tgt, rx410_off
  rx410_start:
.annotate "line", 218
  # rx subcapture "sym"
    set_addr $I10, rxcap_416_fail
    rx410_cur."!mark_push"(0, rx410_pos, $I10)
  alt415_0:
    set_addr $I10, alt415_1
    rx410_cur."!mark_push"(0, rx410_pos, $I10)
  # rx literal  "class"
    add $I11, rx410_pos, 5
    gt $I11, rx410_eos, rx410_fail
    sub $I11, rx410_pos, rx410_off
    substr $S10, rx410_tgt, $I11, 5
    ne $S10, "class", rx410_fail
    add rx410_pos, 5
    goto alt415_end
  alt415_1:
  # rx literal  "grammar"
    add $I11, rx410_pos, 7
    gt $I11, rx410_eos, rx410_fail
    sub $I11, rx410_pos, rx410_off
    substr $S10, rx410_tgt, $I11, 7
    ne $S10, "grammar", rx410_fail
    add rx410_pos, 7
  alt415_end:
    set_addr $I10, rxcap_416_fail
    ($I12, $I11) = rx410_cur."!mark_peek"($I10)
    rx410_cur."!cursor_pos"($I11)
    ($P10) = rx410_cur."!cursor_start"()
    $P10."!cursor_pass"(rx410_pos, "")
    rx410_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_416_done
  rxcap_416_fail:
    goto rx410_fail
  rxcap_416_done:
  # rx subrule "package_def" subtype=capture negate=
    rx410_cur."!cursor_pos"(rx410_pos)
    $P10 = rx410_cur."package_def"()
    unless $P10, rx410_fail
    rx410_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx410_pos = $P10."pos"()
  # rx pass
    rx410_cur."!cursor_pass"(rx410_pos, "package_declarator:sym<class>")
    rx410_cur."!cursor_debug"("PASS  ", "package_declarator:sym<class>", " at pos=", rx410_pos)
    .return (rx410_cur)
  rx410_fail:
.annotate "line", 4
    (rx410_rep, rx410_pos, $I10, $P10) = rx410_cur."!mark_fail"(0)
    lt rx410_pos, -1, rx410_done
    eq rx410_pos, -1, rx410_fail
    jump $I10
  rx410_done:
    rx410_cur."!cursor_fail"()
    rx410_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<class>")
    .return (rx410_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<class>"  :subid("115_1258264446.59978") :method
.annotate "line", 4
    $P412 = self."!PREFIX__!subrule"("package_def", "grammar")
    $P413 = self."!PREFIX__!subrule"("package_def", "class")
    new $P414, "ResizablePMCArray"
    push $P414, $P412
    push $P414, $P413
    .return ($P414)
.end


.namespace ["NQP";"Grammar"]
.sub "package_def"  :subid("116_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx418_tgt
    .local int rx418_pos
    .local int rx418_off
    .local int rx418_eos
    .local int rx418_rep
    .local pmc rx418_cur
    (rx418_cur, rx418_pos, rx418_tgt, $I10) = self."!cursor_start"()
    rx418_cur."!cursor_debug"("START ", "package_def")
    rx418_cur."!cursor_caparray"("parent")
    .lex unicode:"$\x{a2}", rx418_cur
    .local pmc match
    .lex "$/", match
    length rx418_eos, rx418_tgt
    set rx418_off, 0
    lt $I10, 2, rx418_start
    sub rx418_off, $I10, 1
    substr rx418_tgt, rx418_tgt, rx418_off
  rx418_start:
.annotate "line", 220
  # rx subrule "ws" subtype=method negate=
    rx418_cur."!cursor_pos"(rx418_pos)
    $P10 = rx418_cur."ws"()
    unless $P10, rx418_fail
    rx418_pos = $P10."pos"()
.annotate "line", 221
  # rx subrule "name" subtype=capture negate=
    rx418_cur."!cursor_pos"(rx418_pos)
    $P10 = rx418_cur."name"()
    unless $P10, rx418_fail
    rx418_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx418_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx418_cur."!cursor_pos"(rx418_pos)
    $P10 = rx418_cur."ws"()
    unless $P10, rx418_fail
    rx418_pos = $P10."pos"()
.annotate "line", 222
  # rx rxquantr423 ** 0..1
    set_addr $I427, rxquantr423_done
    rx418_cur."!mark_push"(0, rx418_pos, $I427)
  rxquantr423_loop:
  # rx subrule "ws" subtype=method negate=
    rx418_cur."!cursor_pos"(rx418_pos)
    $P10 = rx418_cur."ws"()
    unless $P10, rx418_fail
    rx418_pos = $P10."pos"()
  # rx literal  "is"
    add $I11, rx418_pos, 2
    gt $I11, rx418_eos, rx418_fail
    sub $I11, rx418_pos, rx418_off
    substr $S10, rx418_tgt, $I11, 2
    ne $S10, "is", rx418_fail
    add rx418_pos, 2
  # rx subrule "ws" subtype=method negate=
    rx418_cur."!cursor_pos"(rx418_pos)
    $P10 = rx418_cur."ws"()
    unless $P10, rx418_fail
    rx418_pos = $P10."pos"()
  # rx subrule "name" subtype=capture negate=
    rx418_cur."!cursor_pos"(rx418_pos)
    $P10 = rx418_cur."name"()
    unless $P10, rx418_fail
    rx418_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parent")
    rx418_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx418_cur."!cursor_pos"(rx418_pos)
    $P10 = rx418_cur."ws"()
    unless $P10, rx418_fail
    rx418_pos = $P10."pos"()
    (rx418_rep) = rx418_cur."!mark_commit"($I427)
  rxquantr423_done:
  # rx subrule "ws" subtype=method negate=
    rx418_cur."!cursor_pos"(rx418_pos)
    $P10 = rx418_cur."ws"()
    unless $P10, rx418_fail
    rx418_pos = $P10."pos"()
  alt429_0:
.annotate "line", 223
    set_addr $I10, alt429_1
    rx418_cur."!mark_push"(0, rx418_pos, $I10)
.annotate "line", 224
  # rx subrule "ws" subtype=method negate=
    rx418_cur."!cursor_pos"(rx418_pos)
    $P10 = rx418_cur."ws"()
    unless $P10, rx418_fail
    rx418_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx418_pos, 1
    gt $I11, rx418_eos, rx418_fail
    sub $I11, rx418_pos, rx418_off
    substr $S10, rx418_tgt, $I11, 1
    ne $S10, ";", rx418_fail
    add rx418_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx418_cur."!cursor_pos"(rx418_pos)
    $P10 = rx418_cur."ws"()
    unless $P10, rx418_fail
    rx418_pos = $P10."pos"()
  # rx subrule "comp_unit" subtype=capture negate=
    rx418_cur."!cursor_pos"(rx418_pos)
    $P10 = rx418_cur."comp_unit"()
    unless $P10, rx418_fail
    rx418_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("comp_unit")
    rx418_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx418_cur."!cursor_pos"(rx418_pos)
    $P10 = rx418_cur."ws"()
    unless $P10, rx418_fail
    rx418_pos = $P10."pos"()
    goto alt429_end
  alt429_1:
    set_addr $I10, alt429_2
    rx418_cur."!mark_push"(0, rx418_pos, $I10)
.annotate "line", 225
  # rx subrule "ws" subtype=method negate=
    rx418_cur."!cursor_pos"(rx418_pos)
    $P10 = rx418_cur."ws"()
    unless $P10, rx418_fail
    rx418_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx418_pos, rx418_eos, rx418_fail
    sub $I10, rx418_pos, rx418_off
    substr $S10, rx418_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx418_fail
  # rx subrule "ws" subtype=method negate=
    rx418_cur."!cursor_pos"(rx418_pos)
    $P10 = rx418_cur."ws"()
    unless $P10, rx418_fail
    rx418_pos = $P10."pos"()
  # rx subrule "block" subtype=capture negate=
    rx418_cur."!cursor_pos"(rx418_pos)
    $P10 = rx418_cur."block"()
    unless $P10, rx418_fail
    rx418_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx418_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx418_cur."!cursor_pos"(rx418_pos)
    $P10 = rx418_cur."ws"()
    unless $P10, rx418_fail
    rx418_pos = $P10."pos"()
    goto alt429_end
  alt429_2:
.annotate "line", 226
  # rx subrule "ws" subtype=method negate=
    rx418_cur."!cursor_pos"(rx418_pos)
    $P10 = rx418_cur."ws"()
    unless $P10, rx418_fail
    rx418_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx418_cur."!cursor_pos"(rx418_pos)
    $P10 = rx418_cur."panic"("Malformed package declaration")
    unless $P10, rx418_fail
    rx418_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx418_cur."!cursor_pos"(rx418_pos)
    $P10 = rx418_cur."ws"()
    unless $P10, rx418_fail
    rx418_pos = $P10."pos"()
  alt429_end:
.annotate "line", 227
  # rx subrule "ws" subtype=method negate=
    rx418_cur."!cursor_pos"(rx418_pos)
    $P10 = rx418_cur."ws"()
    unless $P10, rx418_fail
    rx418_pos = $P10."pos"()
.annotate "line", 220
  # rx pass
    rx418_cur."!cursor_pass"(rx418_pos, "package_def")
    rx418_cur."!cursor_debug"("PASS  ", "package_def", " at pos=", rx418_pos)
    .return (rx418_cur)
  rx418_fail:
.annotate "line", 4
    (rx418_rep, rx418_pos, $I10, $P10) = rx418_cur."!mark_fail"(0)
    lt rx418_pos, -1, rx418_done
    eq rx418_pos, -1, rx418_fail
    jump $I10
  rx418_done:
    rx418_cur."!cursor_fail"()
    rx418_cur."!cursor_debug"("FAIL  ", "package_def")
    .return (rx418_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_def"  :subid("117_1258264446.59978") :method
.annotate "line", 4
    new $P420, "ResizablePMCArray"
    push $P420, ""
    .return ($P420)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator"  :subid("118_1258264446.59978") :method
.annotate "line", 230
    $P440 = self."!protoregex"("scope_declarator")
    .return ($P440)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator"  :subid("119_1258264446.59978") :method
.annotate "line", 230
    $P442 = self."!PREFIX__!protoregex"("scope_declarator")
    .return ($P442)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<my>"  :subid("120_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx444_tgt
    .local int rx444_pos
    .local int rx444_off
    .local int rx444_eos
    .local int rx444_rep
    .local pmc rx444_cur
    (rx444_cur, rx444_pos, rx444_tgt, $I10) = self."!cursor_start"()
    rx444_cur."!cursor_debug"("START ", "scope_declarator:sym<my>")
    .lex unicode:"$\x{a2}", rx444_cur
    .local pmc match
    .lex "$/", match
    length rx444_eos, rx444_tgt
    set rx444_off, 0
    lt $I10, 2, rx444_start
    sub rx444_off, $I10, 1
    substr rx444_tgt, rx444_tgt, rx444_off
  rx444_start:
.annotate "line", 231
  # rx subcapture "sym"
    set_addr $I10, rxcap_448_fail
    rx444_cur."!mark_push"(0, rx444_pos, $I10)
  # rx literal  "my"
    add $I11, rx444_pos, 2
    gt $I11, rx444_eos, rx444_fail
    sub $I11, rx444_pos, rx444_off
    substr $S10, rx444_tgt, $I11, 2
    ne $S10, "my", rx444_fail
    add rx444_pos, 2
    set_addr $I10, rxcap_448_fail
    ($I12, $I11) = rx444_cur."!mark_peek"($I10)
    rx444_cur."!cursor_pos"($I11)
    ($P10) = rx444_cur."!cursor_start"()
    $P10."!cursor_pass"(rx444_pos, "")
    rx444_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_448_done
  rxcap_448_fail:
    goto rx444_fail
  rxcap_448_done:
  # rx subrule "scoped" subtype=capture negate=
    rx444_cur."!cursor_pos"(rx444_pos)
    $P10 = rx444_cur."scoped"("my")
    unless $P10, rx444_fail
    rx444_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx444_pos = $P10."pos"()
  # rx pass
    rx444_cur."!cursor_pass"(rx444_pos, "scope_declarator:sym<my>")
    rx444_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<my>", " at pos=", rx444_pos)
    .return (rx444_cur)
  rx444_fail:
.annotate "line", 4
    (rx444_rep, rx444_pos, $I10, $P10) = rx444_cur."!mark_fail"(0)
    lt rx444_pos, -1, rx444_done
    eq rx444_pos, -1, rx444_fail
    jump $I10
  rx444_done:
    rx444_cur."!cursor_fail"()
    rx444_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<my>")
    .return (rx444_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<my>"  :subid("121_1258264446.59978") :method
.annotate "line", 4
    $P446 = self."!PREFIX__!subrule"("scoped", "my")
    new $P447, "ResizablePMCArray"
    push $P447, $P446
    .return ($P447)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<our>"  :subid("122_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx450_tgt
    .local int rx450_pos
    .local int rx450_off
    .local int rx450_eos
    .local int rx450_rep
    .local pmc rx450_cur
    (rx450_cur, rx450_pos, rx450_tgt, $I10) = self."!cursor_start"()
    rx450_cur."!cursor_debug"("START ", "scope_declarator:sym<our>")
    .lex unicode:"$\x{a2}", rx450_cur
    .local pmc match
    .lex "$/", match
    length rx450_eos, rx450_tgt
    set rx450_off, 0
    lt $I10, 2, rx450_start
    sub rx450_off, $I10, 1
    substr rx450_tgt, rx450_tgt, rx450_off
  rx450_start:
.annotate "line", 232
  # rx subcapture "sym"
    set_addr $I10, rxcap_454_fail
    rx450_cur."!mark_push"(0, rx450_pos, $I10)
  # rx literal  "our"
    add $I11, rx450_pos, 3
    gt $I11, rx450_eos, rx450_fail
    sub $I11, rx450_pos, rx450_off
    substr $S10, rx450_tgt, $I11, 3
    ne $S10, "our", rx450_fail
    add rx450_pos, 3
    set_addr $I10, rxcap_454_fail
    ($I12, $I11) = rx450_cur."!mark_peek"($I10)
    rx450_cur."!cursor_pos"($I11)
    ($P10) = rx450_cur."!cursor_start"()
    $P10."!cursor_pass"(rx450_pos, "")
    rx450_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_454_done
  rxcap_454_fail:
    goto rx450_fail
  rxcap_454_done:
  # rx subrule "scoped" subtype=capture negate=
    rx450_cur."!cursor_pos"(rx450_pos)
    $P10 = rx450_cur."scoped"("our")
    unless $P10, rx450_fail
    rx450_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx450_pos = $P10."pos"()
  # rx pass
    rx450_cur."!cursor_pass"(rx450_pos, "scope_declarator:sym<our>")
    rx450_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<our>", " at pos=", rx450_pos)
    .return (rx450_cur)
  rx450_fail:
.annotate "line", 4
    (rx450_rep, rx450_pos, $I10, $P10) = rx450_cur."!mark_fail"(0)
    lt rx450_pos, -1, rx450_done
    eq rx450_pos, -1, rx450_fail
    jump $I10
  rx450_done:
    rx450_cur."!cursor_fail"()
    rx450_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<our>")
    .return (rx450_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<our>"  :subid("123_1258264446.59978") :method
.annotate "line", 4
    $P452 = self."!PREFIX__!subrule"("scoped", "our")
    new $P453, "ResizablePMCArray"
    push $P453, $P452
    .return ($P453)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<has>"  :subid("124_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx456_tgt
    .local int rx456_pos
    .local int rx456_off
    .local int rx456_eos
    .local int rx456_rep
    .local pmc rx456_cur
    (rx456_cur, rx456_pos, rx456_tgt, $I10) = self."!cursor_start"()
    rx456_cur."!cursor_debug"("START ", "scope_declarator:sym<has>")
    .lex unicode:"$\x{a2}", rx456_cur
    .local pmc match
    .lex "$/", match
    length rx456_eos, rx456_tgt
    set rx456_off, 0
    lt $I10, 2, rx456_start
    sub rx456_off, $I10, 1
    substr rx456_tgt, rx456_tgt, rx456_off
  rx456_start:
.annotate "line", 233
  # rx subcapture "sym"
    set_addr $I10, rxcap_460_fail
    rx456_cur."!mark_push"(0, rx456_pos, $I10)
  # rx literal  "has"
    add $I11, rx456_pos, 3
    gt $I11, rx456_eos, rx456_fail
    sub $I11, rx456_pos, rx456_off
    substr $S10, rx456_tgt, $I11, 3
    ne $S10, "has", rx456_fail
    add rx456_pos, 3
    set_addr $I10, rxcap_460_fail
    ($I12, $I11) = rx456_cur."!mark_peek"($I10)
    rx456_cur."!cursor_pos"($I11)
    ($P10) = rx456_cur."!cursor_start"()
    $P10."!cursor_pass"(rx456_pos, "")
    rx456_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_460_done
  rxcap_460_fail:
    goto rx456_fail
  rxcap_460_done:
  # rx subrule "scoped" subtype=capture negate=
    rx456_cur."!cursor_pos"(rx456_pos)
    $P10 = rx456_cur."scoped"("has")
    unless $P10, rx456_fail
    rx456_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx456_pos = $P10."pos"()
  # rx pass
    rx456_cur."!cursor_pass"(rx456_pos, "scope_declarator:sym<has>")
    rx456_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<has>", " at pos=", rx456_pos)
    .return (rx456_cur)
  rx456_fail:
.annotate "line", 4
    (rx456_rep, rx456_pos, $I10, $P10) = rx456_cur."!mark_fail"(0)
    lt rx456_pos, -1, rx456_done
    eq rx456_pos, -1, rx456_fail
    jump $I10
  rx456_done:
    rx456_cur."!cursor_fail"()
    rx456_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<has>")
    .return (rx456_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<has>"  :subid("125_1258264446.59978") :method
.annotate "line", 4
    $P458 = self."!PREFIX__!subrule"("scoped", "has")
    new $P459, "ResizablePMCArray"
    push $P459, $P458
    .return ($P459)
.end


.namespace ["NQP";"Grammar"]
.sub "scoped"  :subid("126_1258264446.59978") :method :outer("11_1258264446.59978")
    .param pmc param_462
.annotate "line", 235
    .lex "$*SCOPE", param_462
.annotate "line", 4
    .local string rx463_tgt
    .local int rx463_pos
    .local int rx463_off
    .local int rx463_eos
    .local int rx463_rep
    .local pmc rx463_cur
    (rx463_cur, rx463_pos, rx463_tgt, $I10) = self."!cursor_start"()
    rx463_cur."!cursor_debug"("START ", "scoped")
    .lex unicode:"$\x{a2}", rx463_cur
    .local pmc match
    .lex "$/", match
    length rx463_eos, rx463_tgt
    set rx463_off, 0
    lt $I10, 2, rx463_start
    sub rx463_off, $I10, 1
    substr rx463_tgt, rx463_tgt, rx463_off
  rx463_start:
  alt466_0:
.annotate "line", 235
    set_addr $I10, alt466_1
    rx463_cur."!mark_push"(0, rx463_pos, $I10)
.annotate "line", 236
  # rx subrule "ws" subtype=method negate=
    rx463_cur."!cursor_pos"(rx463_pos)
    $P10 = rx463_cur."ws"()
    unless $P10, rx463_fail
    rx463_pos = $P10."pos"()
  # rx subrule "variable_declarator" subtype=capture negate=
    rx463_cur."!cursor_pos"(rx463_pos)
    $P10 = rx463_cur."variable_declarator"()
    unless $P10, rx463_fail
    rx463_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable_declarator")
    rx463_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx463_cur."!cursor_pos"(rx463_pos)
    $P10 = rx463_cur."ws"()
    unless $P10, rx463_fail
    rx463_pos = $P10."pos"()
    goto alt466_end
  alt466_1:
.annotate "line", 237
  # rx subrule "ws" subtype=method negate=
    rx463_cur."!cursor_pos"(rx463_pos)
    $P10 = rx463_cur."ws"()
    unless $P10, rx463_fail
    rx463_pos = $P10."pos"()
  # rx subrule "routine_declarator" subtype=capture negate=
    rx463_cur."!cursor_pos"(rx463_pos)
    $P10 = rx463_cur."routine_declarator"()
    unless $P10, rx463_fail
    rx463_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx463_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx463_cur."!cursor_pos"(rx463_pos)
    $P10 = rx463_cur."ws"()
    unless $P10, rx463_fail
    rx463_pos = $P10."pos"()
  alt466_end:
.annotate "line", 235
  # rx pass
    rx463_cur."!cursor_pass"(rx463_pos, "scoped")
    rx463_cur."!cursor_debug"("PASS  ", "scoped", " at pos=", rx463_pos)
    .return (rx463_cur)
  rx463_fail:
.annotate "line", 4
    (rx463_rep, rx463_pos, $I10, $P10) = rx463_cur."!mark_fail"(0)
    lt rx463_pos, -1, rx463_done
    eq rx463_pos, -1, rx463_fail
    jump $I10
  rx463_done:
    rx463_cur."!cursor_fail"()
    rx463_cur."!cursor_debug"("FAIL  ", "scoped")
    .return (rx463_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scoped"  :subid("127_1258264446.59978") :method
.annotate "line", 4
    new $P465, "ResizablePMCArray"
    push $P465, ""
    push $P465, ""
    .return ($P465)
.end


.namespace ["NQP";"Grammar"]
.sub "variable_declarator"  :subid("128_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx472_tgt
    .local int rx472_pos
    .local int rx472_off
    .local int rx472_eos
    .local int rx472_rep
    .local pmc rx472_cur
    (rx472_cur, rx472_pos, rx472_tgt, $I10) = self."!cursor_start"()
    rx472_cur."!cursor_debug"("START ", "variable_declarator")
    .lex unicode:"$\x{a2}", rx472_cur
    .local pmc match
    .lex "$/", match
    length rx472_eos, rx472_tgt
    set rx472_off, 0
    lt $I10, 2, rx472_start
    sub rx472_off, $I10, 1
    substr rx472_tgt, rx472_tgt, rx472_off
  rx472_start:
.annotate "line", 240
  # rx subrule "variable" subtype=capture negate=
    rx472_cur."!cursor_pos"(rx472_pos)
    $P10 = rx472_cur."variable"()
    unless $P10, rx472_fail
    rx472_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx472_pos = $P10."pos"()
  # rx pass
    rx472_cur."!cursor_pass"(rx472_pos, "variable_declarator")
    rx472_cur."!cursor_debug"("PASS  ", "variable_declarator", " at pos=", rx472_pos)
    .return (rx472_cur)
  rx472_fail:
.annotate "line", 4
    (rx472_rep, rx472_pos, $I10, $P10) = rx472_cur."!mark_fail"(0)
    lt rx472_pos, -1, rx472_done
    eq rx472_pos, -1, rx472_fail
    jump $I10
  rx472_done:
    rx472_cur."!cursor_fail"()
    rx472_cur."!cursor_debug"("FAIL  ", "variable_declarator")
    .return (rx472_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable_declarator"  :subid("129_1258264446.59978") :method
.annotate "line", 4
    $P474 = self."!PREFIX__!subrule"("variable", "")
    new $P475, "ResizablePMCArray"
    push $P475, $P474
    .return ($P475)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator"  :subid("130_1258264446.59978") :method
.annotate "line", 242
    $P477 = self."!protoregex"("routine_declarator")
    .return ($P477)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator"  :subid("131_1258264446.59978") :method
.annotate "line", 242
    $P479 = self."!PREFIX__!protoregex"("routine_declarator")
    .return ($P479)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<sub>"  :subid("132_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx481_tgt
    .local int rx481_pos
    .local int rx481_off
    .local int rx481_eos
    .local int rx481_rep
    .local pmc rx481_cur
    (rx481_cur, rx481_pos, rx481_tgt, $I10) = self."!cursor_start"()
    rx481_cur."!cursor_debug"("START ", "routine_declarator:sym<sub>")
    .lex unicode:"$\x{a2}", rx481_cur
    .local pmc match
    .lex "$/", match
    length rx481_eos, rx481_tgt
    set rx481_off, 0
    lt $I10, 2, rx481_start
    sub rx481_off, $I10, 1
    substr rx481_tgt, rx481_tgt, rx481_off
  rx481_start:
.annotate "line", 243
  # rx subcapture "sym"
    set_addr $I10, rxcap_485_fail
    rx481_cur."!mark_push"(0, rx481_pos, $I10)
  # rx literal  "sub"
    add $I11, rx481_pos, 3
    gt $I11, rx481_eos, rx481_fail
    sub $I11, rx481_pos, rx481_off
    substr $S10, rx481_tgt, $I11, 3
    ne $S10, "sub", rx481_fail
    add rx481_pos, 3
    set_addr $I10, rxcap_485_fail
    ($I12, $I11) = rx481_cur."!mark_peek"($I10)
    rx481_cur."!cursor_pos"($I11)
    ($P10) = rx481_cur."!cursor_start"()
    $P10."!cursor_pass"(rx481_pos, "")
    rx481_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_485_done
  rxcap_485_fail:
    goto rx481_fail
  rxcap_485_done:
  # rx subrule "routine_def" subtype=capture negate=
    rx481_cur."!cursor_pos"(rx481_pos)
    $P10 = rx481_cur."routine_def"()
    unless $P10, rx481_fail
    rx481_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_def")
    rx481_pos = $P10."pos"()
  # rx pass
    rx481_cur."!cursor_pass"(rx481_pos, "routine_declarator:sym<sub>")
    rx481_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<sub>", " at pos=", rx481_pos)
    .return (rx481_cur)
  rx481_fail:
.annotate "line", 4
    (rx481_rep, rx481_pos, $I10, $P10) = rx481_cur."!mark_fail"(0)
    lt rx481_pos, -1, rx481_done
    eq rx481_pos, -1, rx481_fail
    jump $I10
  rx481_done:
    rx481_cur."!cursor_fail"()
    rx481_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<sub>")
    .return (rx481_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<sub>"  :subid("133_1258264446.59978") :method
.annotate "line", 4
    $P483 = self."!PREFIX__!subrule"("routine_def", "sub")
    new $P484, "ResizablePMCArray"
    push $P484, $P483
    .return ($P484)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<method>"  :subid("134_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx487_tgt
    .local int rx487_pos
    .local int rx487_off
    .local int rx487_eos
    .local int rx487_rep
    .local pmc rx487_cur
    (rx487_cur, rx487_pos, rx487_tgt, $I10) = self."!cursor_start"()
    rx487_cur."!cursor_debug"("START ", "routine_declarator:sym<method>")
    .lex unicode:"$\x{a2}", rx487_cur
    .local pmc match
    .lex "$/", match
    length rx487_eos, rx487_tgt
    set rx487_off, 0
    lt $I10, 2, rx487_start
    sub rx487_off, $I10, 1
    substr rx487_tgt, rx487_tgt, rx487_off
  rx487_start:
.annotate "line", 244
  # rx subcapture "sym"
    set_addr $I10, rxcap_491_fail
    rx487_cur."!mark_push"(0, rx487_pos, $I10)
  # rx literal  "method"
    add $I11, rx487_pos, 6
    gt $I11, rx487_eos, rx487_fail
    sub $I11, rx487_pos, rx487_off
    substr $S10, rx487_tgt, $I11, 6
    ne $S10, "method", rx487_fail
    add rx487_pos, 6
    set_addr $I10, rxcap_491_fail
    ($I12, $I11) = rx487_cur."!mark_peek"($I10)
    rx487_cur."!cursor_pos"($I11)
    ($P10) = rx487_cur."!cursor_start"()
    $P10."!cursor_pass"(rx487_pos, "")
    rx487_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_491_done
  rxcap_491_fail:
    goto rx487_fail
  rxcap_491_done:
  # rx subrule "method_def" subtype=capture negate=
    rx487_cur."!cursor_pos"(rx487_pos)
    $P10 = rx487_cur."method_def"()
    unless $P10, rx487_fail
    rx487_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("method_def")
    rx487_pos = $P10."pos"()
  # rx pass
    rx487_cur."!cursor_pass"(rx487_pos, "routine_declarator:sym<method>")
    rx487_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<method>", " at pos=", rx487_pos)
    .return (rx487_cur)
  rx487_fail:
.annotate "line", 4
    (rx487_rep, rx487_pos, $I10, $P10) = rx487_cur."!mark_fail"(0)
    lt rx487_pos, -1, rx487_done
    eq rx487_pos, -1, rx487_fail
    jump $I10
  rx487_done:
    rx487_cur."!cursor_fail"()
    rx487_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<method>")
    .return (rx487_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<method>"  :subid("135_1258264446.59978") :method
.annotate "line", 4
    $P489 = self."!PREFIX__!subrule"("method_def", "method")
    new $P490, "ResizablePMCArray"
    push $P490, $P489
    .return ($P490)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_def"  :subid("136_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx493_tgt
    .local int rx493_pos
    .local int rx493_off
    .local int rx493_eos
    .local int rx493_rep
    .local pmc rx493_cur
    (rx493_cur, rx493_pos, rx493_tgt, $I10) = self."!cursor_start"()
    rx493_cur."!cursor_debug"("START ", "routine_def")
    rx493_cur."!cursor_caparray"("deflongname")
    .lex unicode:"$\x{a2}", rx493_cur
    .local pmc match
    .lex "$/", match
    length rx493_eos, rx493_tgt
    set rx493_off, 0
    lt $I10, 2, rx493_start
    sub rx493_off, $I10, 1
    substr rx493_tgt, rx493_tgt, rx493_off
  rx493_start:
.annotate "line", 246
  # rx subrule "ws" subtype=method negate=
    rx493_cur."!cursor_pos"(rx493_pos)
    $P10 = rx493_cur."ws"()
    unless $P10, rx493_fail
    rx493_pos = $P10."pos"()
.annotate "line", 247
  # rx rxquantr497 ** 0..1
    set_addr $I498, rxquantr497_done
    rx493_cur."!mark_push"(0, rx493_pos, $I498)
  rxquantr497_loop:
  # rx subrule "deflongname" subtype=capture negate=
    rx493_cur."!cursor_pos"(rx493_pos)
    $P10 = rx493_cur."deflongname"()
    unless $P10, rx493_fail
    rx493_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx493_pos = $P10."pos"()
    (rx493_rep) = rx493_cur."!mark_commit"($I498)
  rxquantr497_done:
  # rx subrule "ws" subtype=method negate=
    rx493_cur."!cursor_pos"(rx493_pos)
    $P10 = rx493_cur."ws"()
    unless $P10, rx493_fail
    rx493_pos = $P10."pos"()
.annotate "line", 248
  # rx subrule "newpad" subtype=method negate=
    rx493_cur."!cursor_pos"(rx493_pos)
    $P10 = rx493_cur."newpad"()
    unless $P10, rx493_fail
    rx493_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx493_cur."!cursor_pos"(rx493_pos)
    $P10 = rx493_cur."ws"()
    unless $P10, rx493_fail
    rx493_pos = $P10."pos"()
  alt501_0:
.annotate "line", 249
    set_addr $I10, alt501_1
    rx493_cur."!mark_push"(0, rx493_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx493_cur."!cursor_pos"(rx493_pos)
    $P10 = rx493_cur."ws"()
    unless $P10, rx493_fail
    rx493_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx493_pos, 1
    gt $I11, rx493_eos, rx493_fail
    sub $I11, rx493_pos, rx493_off
    substr $S10, rx493_tgt, $I11, 1
    ne $S10, "(", rx493_fail
    add rx493_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx493_cur."!cursor_pos"(rx493_pos)
    $P10 = rx493_cur."ws"()
    unless $P10, rx493_fail
    rx493_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx493_cur."!cursor_pos"(rx493_pos)
    $P10 = rx493_cur."signature"()
    unless $P10, rx493_fail
    rx493_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx493_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx493_cur."!cursor_pos"(rx493_pos)
    $P10 = rx493_cur."ws"()
    unless $P10, rx493_fail
    rx493_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx493_pos, 1
    gt $I11, rx493_eos, rx493_fail
    sub $I11, rx493_pos, rx493_off
    substr $S10, rx493_tgt, $I11, 1
    ne $S10, ")", rx493_fail
    add rx493_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx493_cur."!cursor_pos"(rx493_pos)
    $P10 = rx493_cur."ws"()
    unless $P10, rx493_fail
    rx493_pos = $P10."pos"()
    goto alt501_end
  alt501_1:
.annotate "line", 250
  # rx subrule "ws" subtype=method negate=
    rx493_cur."!cursor_pos"(rx493_pos)
    $P10 = rx493_cur."ws"()
    unless $P10, rx493_fail
    rx493_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx493_cur."!cursor_pos"(rx493_pos)
    $P10 = rx493_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx493_fail
    rx493_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx493_cur."!cursor_pos"(rx493_pos)
    $P10 = rx493_cur."ws"()
    unless $P10, rx493_fail
    rx493_pos = $P10."pos"()
  alt501_end:
  # rx subrule "ws" subtype=method negate=
    rx493_cur."!cursor_pos"(rx493_pos)
    $P10 = rx493_cur."ws"()
    unless $P10, rx493_fail
    rx493_pos = $P10."pos"()
.annotate "line", 251
  # rx subrule "blockoid" subtype=capture negate=
    rx493_cur."!cursor_pos"(rx493_pos)
    $P10 = rx493_cur."blockoid"()
    unless $P10, rx493_fail
    rx493_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx493_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx493_cur."!cursor_pos"(rx493_pos)
    $P10 = rx493_cur."ws"()
    unless $P10, rx493_fail
    rx493_pos = $P10."pos"()
.annotate "line", 246
  # rx pass
    rx493_cur."!cursor_pass"(rx493_pos, "routine_def")
    rx493_cur."!cursor_debug"("PASS  ", "routine_def", " at pos=", rx493_pos)
    .return (rx493_cur)
  rx493_fail:
.annotate "line", 4
    (rx493_rep, rx493_pos, $I10, $P10) = rx493_cur."!mark_fail"(0)
    lt rx493_pos, -1, rx493_done
    eq rx493_pos, -1, rx493_fail
    jump $I10
  rx493_done:
    rx493_cur."!cursor_fail"()
    rx493_cur."!cursor_debug"("FAIL  ", "routine_def")
    .return (rx493_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_def"  :subid("137_1258264446.59978") :method
.annotate "line", 4
    new $P495, "ResizablePMCArray"
    push $P495, ""
    .return ($P495)
.end


.namespace ["NQP";"Grammar"]
.sub "method_def"  :subid("138_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx511_tgt
    .local int rx511_pos
    .local int rx511_off
    .local int rx511_eos
    .local int rx511_rep
    .local pmc rx511_cur
    (rx511_cur, rx511_pos, rx511_tgt, $I10) = self."!cursor_start"()
    rx511_cur."!cursor_debug"("START ", "method_def")
    rx511_cur."!cursor_caparray"("deflongname")
    .lex unicode:"$\x{a2}", rx511_cur
    .local pmc match
    .lex "$/", match
    length rx511_eos, rx511_tgt
    set rx511_off, 0
    lt $I10, 2, rx511_start
    sub rx511_off, $I10, 1
    substr rx511_tgt, rx511_tgt, rx511_off
  rx511_start:
.annotate "line", 254
  # rx subrule "ws" subtype=method negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."ws"()
    unless $P10, rx511_fail
    rx511_pos = $P10."pos"()
.annotate "line", 255
  # rx rxquantr515 ** 0..1
    set_addr $I516, rxquantr515_done
    rx511_cur."!mark_push"(0, rx511_pos, $I516)
  rxquantr515_loop:
  # rx subrule "deflongname" subtype=capture negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."deflongname"()
    unless $P10, rx511_fail
    rx511_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx511_pos = $P10."pos"()
    (rx511_rep) = rx511_cur."!mark_commit"($I516)
  rxquantr515_done:
  # rx subrule "ws" subtype=method negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."ws"()
    unless $P10, rx511_fail
    rx511_pos = $P10."pos"()
.annotate "line", 256
  # rx subrule "newpad" subtype=method negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."newpad"()
    unless $P10, rx511_fail
    rx511_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."ws"()
    unless $P10, rx511_fail
    rx511_pos = $P10."pos"()
  alt519_0:
.annotate "line", 257
    set_addr $I10, alt519_1
    rx511_cur."!mark_push"(0, rx511_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."ws"()
    unless $P10, rx511_fail
    rx511_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx511_pos, 1
    gt $I11, rx511_eos, rx511_fail
    sub $I11, rx511_pos, rx511_off
    substr $S10, rx511_tgt, $I11, 1
    ne $S10, "(", rx511_fail
    add rx511_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."ws"()
    unless $P10, rx511_fail
    rx511_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."signature"()
    unless $P10, rx511_fail
    rx511_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx511_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."ws"()
    unless $P10, rx511_fail
    rx511_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx511_pos, 1
    gt $I11, rx511_eos, rx511_fail
    sub $I11, rx511_pos, rx511_off
    substr $S10, rx511_tgt, $I11, 1
    ne $S10, ")", rx511_fail
    add rx511_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."ws"()
    unless $P10, rx511_fail
    rx511_pos = $P10."pos"()
    goto alt519_end
  alt519_1:
.annotate "line", 258
  # rx subrule "ws" subtype=method negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."ws"()
    unless $P10, rx511_fail
    rx511_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx511_fail
    rx511_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."ws"()
    unless $P10, rx511_fail
    rx511_pos = $P10."pos"()
  alt519_end:
  # rx subrule "ws" subtype=method negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."ws"()
    unless $P10, rx511_fail
    rx511_pos = $P10."pos"()
.annotate "line", 259
  # rx subrule "blockoid" subtype=capture negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."blockoid"()
    unless $P10, rx511_fail
    rx511_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx511_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx511_cur."!cursor_pos"(rx511_pos)
    $P10 = rx511_cur."ws"()
    unless $P10, rx511_fail
    rx511_pos = $P10."pos"()
.annotate "line", 254
  # rx pass
    rx511_cur."!cursor_pass"(rx511_pos, "method_def")
    rx511_cur."!cursor_debug"("PASS  ", "method_def", " at pos=", rx511_pos)
    .return (rx511_cur)
  rx511_fail:
.annotate "line", 4
    (rx511_rep, rx511_pos, $I10, $P10) = rx511_cur."!mark_fail"(0)
    lt rx511_pos, -1, rx511_done
    eq rx511_pos, -1, rx511_fail
    jump $I10
  rx511_done:
    rx511_cur."!cursor_fail"()
    rx511_cur."!cursor_debug"("FAIL  ", "method_def")
    .return (rx511_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__method_def"  :subid("139_1258264446.59978") :method
.annotate "line", 4
    new $P513, "ResizablePMCArray"
    push $P513, ""
    .return ($P513)
.end


.namespace ["NQP";"Grammar"]
.sub "signature"  :subid("140_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx529_tgt
    .local int rx529_pos
    .local int rx529_off
    .local int rx529_eos
    .local int rx529_rep
    .local pmc rx529_cur
    (rx529_cur, rx529_pos, rx529_tgt, $I10) = self."!cursor_start"()
    rx529_cur."!cursor_debug"("START ", "signature")
    rx529_cur."!cursor_caparray"("parameter")
    .lex unicode:"$\x{a2}", rx529_cur
    .local pmc match
    .lex "$/", match
    length rx529_eos, rx529_tgt
    set rx529_off, 0
    lt $I10, 2, rx529_start
    sub rx529_off, $I10, 1
    substr rx529_tgt, rx529_tgt, rx529_off
  rx529_start:
.annotate "line", 262
  # rx rxquantr532 ** 0..1
    set_addr $I535, rxquantr532_done
    rx529_cur."!mark_push"(0, rx529_pos, $I535)
  rxquantr532_loop:
  # rx rxquantr533 ** 1..*
    set_addr $I534, rxquantr533_done
    rx529_cur."!mark_push"(0, -1, $I534)
  rxquantr533_loop:
  # rx subrule "ws" subtype=method negate=
    rx529_cur."!cursor_pos"(rx529_pos)
    $P10 = rx529_cur."ws"()
    unless $P10, rx529_fail
    rx529_pos = $P10."pos"()
  # rx subrule "parameter" subtype=capture negate=
    rx529_cur."!cursor_pos"(rx529_pos)
    $P10 = rx529_cur."parameter"()
    unless $P10, rx529_fail
    rx529_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parameter")
    rx529_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx529_cur."!cursor_pos"(rx529_pos)
    $P10 = rx529_cur."ws"()
    unless $P10, rx529_fail
    rx529_pos = $P10."pos"()
    (rx529_rep) = rx529_cur."!mark_commit"($I534)
    rx529_cur."!mark_push"(rx529_rep, rx529_pos, $I534)
  # rx literal  ","
    add $I11, rx529_pos, 1
    gt $I11, rx529_eos, rx529_fail
    sub $I11, rx529_pos, rx529_off
    substr $S10, rx529_tgt, $I11, 1
    ne $S10, ",", rx529_fail
    add rx529_pos, 1
    goto rxquantr533_loop
  rxquantr533_done:
    (rx529_rep) = rx529_cur."!mark_commit"($I535)
  rxquantr532_done:
  # rx pass
    rx529_cur."!cursor_pass"(rx529_pos, "signature")
    rx529_cur."!cursor_debug"("PASS  ", "signature", " at pos=", rx529_pos)
    .return (rx529_cur)
  rx529_fail:
.annotate "line", 4
    (rx529_rep, rx529_pos, $I10, $P10) = rx529_cur."!mark_fail"(0)
    lt rx529_pos, -1, rx529_done
    eq rx529_pos, -1, rx529_fail
    jump $I10
  rx529_done:
    rx529_cur."!cursor_fail"()
    rx529_cur."!cursor_debug"("FAIL  ", "signature")
    .return (rx529_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__signature"  :subid("141_1258264446.59978") :method
.annotate "line", 4
    new $P531, "ResizablePMCArray"
    push $P531, ""
    .return ($P531)
.end


.namespace ["NQP";"Grammar"]
.sub "parameter"  :subid("142_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx537_tgt
    .local int rx537_pos
    .local int rx537_off
    .local int rx537_eos
    .local int rx537_rep
    .local pmc rx537_cur
    (rx537_cur, rx537_pos, rx537_tgt, $I10) = self."!cursor_start"()
    rx537_cur."!cursor_debug"("START ", "parameter")
    rx537_cur."!cursor_caparray"("default_value")
    .lex unicode:"$\x{a2}", rx537_cur
    .local pmc match
    .lex "$/", match
    length rx537_eos, rx537_tgt
    set rx537_off, 0
    lt $I10, 2, rx537_start
    sub rx537_off, $I10, 1
    substr rx537_tgt, rx537_tgt, rx537_off
  rx537_start:
  alt543_0:
.annotate "line", 265
    set_addr $I10, alt543_1
    rx537_cur."!mark_push"(0, rx537_pos, $I10)
.annotate "line", 266
  # rx subcapture "quant"
    set_addr $I10, rxcap_544_fail
    rx537_cur."!mark_push"(0, rx537_pos, $I10)
  # rx literal  "*"
    add $I11, rx537_pos, 1
    gt $I11, rx537_eos, rx537_fail
    sub $I11, rx537_pos, rx537_off
    substr $S10, rx537_tgt, $I11, 1
    ne $S10, "*", rx537_fail
    add rx537_pos, 1
    set_addr $I10, rxcap_544_fail
    ($I12, $I11) = rx537_cur."!mark_peek"($I10)
    rx537_cur."!cursor_pos"($I11)
    ($P10) = rx537_cur."!cursor_start"()
    $P10."!cursor_pass"(rx537_pos, "")
    rx537_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_544_done
  rxcap_544_fail:
    goto rx537_fail
  rxcap_544_done:
  # rx subrule "param_var" subtype=capture negate=
    rx537_cur."!cursor_pos"(rx537_pos)
    $P10 = rx537_cur."param_var"()
    unless $P10, rx537_fail
    rx537_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx537_pos = $P10."pos"()
    goto alt543_end
  alt543_1:
  alt545_0:
.annotate "line", 267
    set_addr $I10, alt545_1
    rx537_cur."!mark_push"(0, rx537_pos, $I10)
  # rx subrule "param_var" subtype=capture negate=
    rx537_cur."!cursor_pos"(rx537_pos)
    $P10 = rx537_cur."param_var"()
    unless $P10, rx537_fail
    rx537_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx537_pos = $P10."pos"()
    goto alt545_end
  alt545_1:
  # rx subrule "named_param" subtype=capture negate=
    rx537_cur."!cursor_pos"(rx537_pos)
    $P10 = rx537_cur."named_param"()
    unless $P10, rx537_fail
    rx537_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("named_param")
    rx537_pos = $P10."pos"()
  alt545_end:
  # rx subcapture "quant"
    set_addr $I10, rxcap_547_fail
    rx537_cur."!mark_push"(0, rx537_pos, $I10)
  alt546_0:
    set_addr $I10, alt546_1
    rx537_cur."!mark_push"(0, rx537_pos, $I10)
  # rx literal  "?"
    add $I11, rx537_pos, 1
    gt $I11, rx537_eos, rx537_fail
    sub $I11, rx537_pos, rx537_off
    substr $S10, rx537_tgt, $I11, 1
    ne $S10, "?", rx537_fail
    add rx537_pos, 1
    goto alt546_end
  alt546_1:
    set_addr $I10, alt546_2
    rx537_cur."!mark_push"(0, rx537_pos, $I10)
  # rx literal  "!"
    add $I11, rx537_pos, 1
    gt $I11, rx537_eos, rx537_fail
    sub $I11, rx537_pos, rx537_off
    substr $S10, rx537_tgt, $I11, 1
    ne $S10, "!", rx537_fail
    add rx537_pos, 1
    goto alt546_end
  alt546_2:
  alt546_end:
    set_addr $I10, rxcap_547_fail
    ($I12, $I11) = rx537_cur."!mark_peek"($I10)
    rx537_cur."!cursor_pos"($I11)
    ($P10) = rx537_cur."!cursor_start"()
    $P10."!cursor_pass"(rx537_pos, "")
    rx537_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_547_done
  rxcap_547_fail:
    goto rx537_fail
  rxcap_547_done:
  alt543_end:
.annotate "line", 269
  # rx rxquantr548 ** 0..1
    set_addr $I549, rxquantr548_done
    rx537_cur."!mark_push"(0, rx537_pos, $I549)
  rxquantr548_loop:
  # rx subrule "default_value" subtype=capture negate=
    rx537_cur."!cursor_pos"(rx537_pos)
    $P10 = rx537_cur."default_value"()
    unless $P10, rx537_fail
    rx537_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("default_value")
    rx537_pos = $P10."pos"()
    (rx537_rep) = rx537_cur."!mark_commit"($I549)
  rxquantr548_done:
.annotate "line", 264
  # rx pass
    rx537_cur."!cursor_pass"(rx537_pos, "parameter")
    rx537_cur."!cursor_debug"("PASS  ", "parameter", " at pos=", rx537_pos)
    .return (rx537_cur)
  rx537_fail:
.annotate "line", 4
    (rx537_rep, rx537_pos, $I10, $P10) = rx537_cur."!mark_fail"(0)
    lt rx537_pos, -1, rx537_done
    eq rx537_pos, -1, rx537_fail
    jump $I10
  rx537_done:
    rx537_cur."!cursor_fail"()
    rx537_cur."!cursor_debug"("FAIL  ", "parameter")
    .return (rx537_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__parameter"  :subid("143_1258264446.59978") :method
.annotate "line", 4
    $P539 = self."!PREFIX__!subrule"("named_param", "")
    $P540 = self."!PREFIX__!subrule"("param_var", "")
    $P541 = self."!PREFIX__!subrule"("param_var", "*")
    new $P542, "ResizablePMCArray"
    push $P542, $P539
    push $P542, $P540
    push $P542, $P541
    .return ($P542)
.end


.namespace ["NQP";"Grammar"]
.sub "param_var"  :subid("144_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx551_tgt
    .local int rx551_pos
    .local int rx551_off
    .local int rx551_eos
    .local int rx551_rep
    .local pmc rx551_cur
    (rx551_cur, rx551_pos, rx551_tgt, $I10) = self."!cursor_start"()
    rx551_cur."!cursor_debug"("START ", "param_var")
    rx551_cur."!cursor_caparray"("twigil")
    .lex unicode:"$\x{a2}", rx551_cur
    .local pmc match
    .lex "$/", match
    length rx551_eos, rx551_tgt
    set rx551_off, 0
    lt $I10, 2, rx551_start
    sub rx551_off, $I10, 1
    substr rx551_tgt, rx551_tgt, rx551_off
  rx551_start:
.annotate "line", 273
  # rx subrule "sigil" subtype=capture negate=
    rx551_cur."!cursor_pos"(rx551_pos)
    $P10 = rx551_cur."sigil"()
    unless $P10, rx551_fail
    rx551_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx551_pos = $P10."pos"()
  # rx rxquantr555 ** 0..1
    set_addr $I556, rxquantr555_done
    rx551_cur."!mark_push"(0, rx551_pos, $I556)
  rxquantr555_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx551_cur."!cursor_pos"(rx551_pos)
    $P10 = rx551_cur."twigil"()
    unless $P10, rx551_fail
    rx551_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx551_pos = $P10."pos"()
    (rx551_rep) = rx551_cur."!mark_commit"($I556)
  rxquantr555_done:
  alt557_0:
.annotate "line", 274
    set_addr $I10, alt557_1
    rx551_cur."!mark_push"(0, rx551_pos, $I10)
  # rx subrule "ident" subtype=capture negate=
    rx551_cur."!cursor_pos"(rx551_pos)
    $P10 = rx551_cur."ident"()
    unless $P10, rx551_fail
    rx551_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx551_pos = $P10."pos"()
    goto alt557_end
  alt557_1:
  # rx subcapture "name"
    set_addr $I10, rxcap_558_fail
    rx551_cur."!mark_push"(0, rx551_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx551_pos, rx551_eos, rx551_fail
    sub $I10, rx551_pos, rx551_off
    substr $S10, rx551_tgt, $I10, 1
    index $I11, "/!", $S10
    lt $I11, 0, rx551_fail
    inc rx551_pos
    set_addr $I10, rxcap_558_fail
    ($I12, $I11) = rx551_cur."!mark_peek"($I10)
    rx551_cur."!cursor_pos"($I11)
    ($P10) = rx551_cur."!cursor_start"()
    $P10."!cursor_pass"(rx551_pos, "")
    rx551_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_558_done
  rxcap_558_fail:
    goto rx551_fail
  rxcap_558_done:
  alt557_end:
.annotate "line", 272
  # rx pass
    rx551_cur."!cursor_pass"(rx551_pos, "param_var")
    rx551_cur."!cursor_debug"("PASS  ", "param_var", " at pos=", rx551_pos)
    .return (rx551_cur)
  rx551_fail:
.annotate "line", 4
    (rx551_rep, rx551_pos, $I10, $P10) = rx551_cur."!mark_fail"(0)
    lt rx551_pos, -1, rx551_done
    eq rx551_pos, -1, rx551_fail
    jump $I10
  rx551_done:
    rx551_cur."!cursor_fail"()
    rx551_cur."!cursor_debug"("FAIL  ", "param_var")
    .return (rx551_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__param_var"  :subid("145_1258264446.59978") :method
.annotate "line", 4
    $P553 = self."!PREFIX__!subrule"("sigil", "")
    new $P554, "ResizablePMCArray"
    push $P554, $P553
    .return ($P554)
.end


.namespace ["NQP";"Grammar"]
.sub "named_param"  :subid("146_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx560_tgt
    .local int rx560_pos
    .local int rx560_off
    .local int rx560_eos
    .local int rx560_rep
    .local pmc rx560_cur
    (rx560_cur, rx560_pos, rx560_tgt, $I10) = self."!cursor_start"()
    rx560_cur."!cursor_debug"("START ", "named_param")
    .lex unicode:"$\x{a2}", rx560_cur
    .local pmc match
    .lex "$/", match
    length rx560_eos, rx560_tgt
    set rx560_off, 0
    lt $I10, 2, rx560_start
    sub rx560_off, $I10, 1
    substr rx560_tgt, rx560_tgt, rx560_off
  rx560_start:
.annotate "line", 278
  # rx literal  ":"
    add $I11, rx560_pos, 1
    gt $I11, rx560_eos, rx560_fail
    sub $I11, rx560_pos, rx560_off
    substr $S10, rx560_tgt, $I11, 1
    ne $S10, ":", rx560_fail
    add rx560_pos, 1
  # rx subrule "param_var" subtype=capture negate=
    rx560_cur."!cursor_pos"(rx560_pos)
    $P10 = rx560_cur."param_var"()
    unless $P10, rx560_fail
    rx560_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx560_pos = $P10."pos"()
.annotate "line", 277
  # rx pass
    rx560_cur."!cursor_pass"(rx560_pos, "named_param")
    rx560_cur."!cursor_debug"("PASS  ", "named_param", " at pos=", rx560_pos)
    .return (rx560_cur)
  rx560_fail:
.annotate "line", 4
    (rx560_rep, rx560_pos, $I10, $P10) = rx560_cur."!mark_fail"(0)
    lt rx560_pos, -1, rx560_done
    eq rx560_pos, -1, rx560_fail
    jump $I10
  rx560_done:
    rx560_cur."!cursor_fail"()
    rx560_cur."!cursor_debug"("FAIL  ", "named_param")
    .return (rx560_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__named_param"  :subid("147_1258264446.59978") :method
.annotate "line", 4
    $P562 = self."!PREFIX__!subrule"("param_var", ":")
    new $P563, "ResizablePMCArray"
    push $P563, $P562
    .return ($P563)
.end


.namespace ["NQP";"Grammar"]
.sub "default_value"  :subid("148_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx565_tgt
    .local int rx565_pos
    .local int rx565_off
    .local int rx565_eos
    .local int rx565_rep
    .local pmc rx565_cur
    (rx565_cur, rx565_pos, rx565_tgt, $I10) = self."!cursor_start"()
    rx565_cur."!cursor_debug"("START ", "default_value")
    .lex unicode:"$\x{a2}", rx565_cur
    .local pmc match
    .lex "$/", match
    length rx565_eos, rx565_tgt
    set rx565_off, 0
    lt $I10, 2, rx565_start
    sub rx565_off, $I10, 1
    substr rx565_tgt, rx565_tgt, rx565_off
  rx565_start:
.annotate "line", 281
  # rx subrule "ws" subtype=method negate=
    rx565_cur."!cursor_pos"(rx565_pos)
    $P10 = rx565_cur."ws"()
    unless $P10, rx565_fail
    rx565_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx565_pos, 1
    gt $I11, rx565_eos, rx565_fail
    sub $I11, rx565_pos, rx565_off
    substr $S10, rx565_tgt, $I11, 1
    ne $S10, "=", rx565_fail
    add rx565_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx565_cur."!cursor_pos"(rx565_pos)
    $P10 = rx565_cur."ws"()
    unless $P10, rx565_fail
    rx565_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx565_cur."!cursor_pos"(rx565_pos)
    $P10 = rx565_cur."EXPR"("i=")
    unless $P10, rx565_fail
    rx565_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx565_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx565_cur."!cursor_pos"(rx565_pos)
    $P10 = rx565_cur."ws"()
    unless $P10, rx565_fail
    rx565_pos = $P10."pos"()
  # rx pass
    rx565_cur."!cursor_pass"(rx565_pos, "default_value")
    rx565_cur."!cursor_debug"("PASS  ", "default_value", " at pos=", rx565_pos)
    .return (rx565_cur)
  rx565_fail:
.annotate "line", 4
    (rx565_rep, rx565_pos, $I10, $P10) = rx565_cur."!mark_fail"(0)
    lt rx565_pos, -1, rx565_done
    eq rx565_pos, -1, rx565_fail
    jump $I10
  rx565_done:
    rx565_cur."!cursor_fail"()
    rx565_cur."!cursor_debug"("FAIL  ", "default_value")
    .return (rx565_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__default_value"  :subid("149_1258264446.59978") :method
.annotate "line", 4
    new $P567, "ResizablePMCArray"
    push $P567, ""
    .return ($P567)
.end


.namespace ["NQP";"Grammar"]
.sub "regex_declarator"  :subid("150_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx572_tgt
    .local int rx572_pos
    .local int rx572_off
    .local int rx572_eos
    .local int rx572_rep
    .local pmc rx572_cur
    (rx572_cur, rx572_pos, rx572_tgt, $I10) = self."!cursor_start"()
    rx572_cur."!cursor_debug"("START ", "regex_declarator")
    rx572_cur."!cursor_caparray"("signature")
    .lex unicode:"$\x{a2}", rx572_cur
    .local pmc match
    .lex "$/", match
    length rx572_eos, rx572_tgt
    set rx572_off, 0
    lt $I10, 2, rx572_start
    sub rx572_off, $I10, 1
    substr rx572_tgt, rx572_tgt, rx572_off
  rx572_start:
.annotate "line", 283
  # rx subrule "ws" subtype=method negate=
    rx572_cur."!cursor_pos"(rx572_pos)
    $P10 = rx572_cur."ws"()
    unless $P10, rx572_fail
    rx572_pos = $P10."pos"()
  alt576_0:
.annotate "line", 284
    set_addr $I10, alt576_1
    rx572_cur."!mark_push"(0, rx572_pos, $I10)
.annotate "line", 285
  # rx subrule "ws" subtype=method negate=
    rx572_cur."!cursor_pos"(rx572_pos)
    $P10 = rx572_cur."ws"()
    unless $P10, rx572_fail
    rx572_pos = $P10."pos"()
  # rx subcapture "proto"
    set_addr $I10, rxcap_578_fail
    rx572_cur."!mark_push"(0, rx572_pos, $I10)
  # rx literal  "proto"
    add $I11, rx572_pos, 5
    gt $I11, rx572_eos, rx572_fail
    sub $I11, rx572_pos, rx572_off
    substr $S10, rx572_tgt, $I11, 5
    ne $S10, "proto", rx572_fail
    add rx572_pos, 5
    set_addr $I10, rxcap_578_fail
    ($I12, $I11) = rx572_cur."!mark_peek"($I10)
    rx572_cur."!cursor_pos"($I11)
    ($P10) = rx572_cur."!cursor_start"()
    $P10."!cursor_pass"(rx572_pos, "")
    rx572_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("proto")
    goto rxcap_578_done
  rxcap_578_fail:
    goto rx572_fail
  rxcap_578_done:
  # rx subrule "ws" subtype=method negate=
    rx572_cur."!cursor_pos"(rx572_pos)
    $P10 = rx572_cur."ws"()
    unless $P10, rx572_fail
    rx572_pos = $P10."pos"()
  alt580_0:
    set_addr $I10, alt580_1
    rx572_cur."!mark_push"(0, rx572_pos, $I10)
  # rx literal  "regex"
    add $I11, rx572_pos, 5
    gt $I11, rx572_eos, rx572_fail
    sub $I11, rx572_pos, rx572_off
    substr $S10, rx572_tgt, $I11, 5
    ne $S10, "regex", rx572_fail
    add rx572_pos, 5
    goto alt580_end
  alt580_1:
    set_addr $I10, alt580_2
    rx572_cur."!mark_push"(0, rx572_pos, $I10)
  # rx literal  "token"
    add $I11, rx572_pos, 5
    gt $I11, rx572_eos, rx572_fail
    sub $I11, rx572_pos, rx572_off
    substr $S10, rx572_tgt, $I11, 5
    ne $S10, "token", rx572_fail
    add rx572_pos, 5
    goto alt580_end
  alt580_2:
  # rx literal  "rule"
    add $I11, rx572_pos, 4
    gt $I11, rx572_eos, rx572_fail
    sub $I11, rx572_pos, rx572_off
    substr $S10, rx572_tgt, $I11, 4
    ne $S10, "rule", rx572_fail
    add rx572_pos, 4
  alt580_end:
  # rx subrule "ws" subtype=method negate=
    rx572_cur."!cursor_pos"(rx572_pos)
    $P10 = rx572_cur."ws"()
    unless $P10, rx572_fail
    rx572_pos = $P10."pos"()
.annotate "line", 286
  # rx subrule "deflongname" subtype=capture negate=
    rx572_cur."!cursor_pos"(rx572_pos)
    $P10 = rx572_cur."deflongname"()
    unless $P10, rx572_fail
    rx572_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx572_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx572_cur."!cursor_pos"(rx572_pos)
    $P10 = rx572_cur."ws"()
    unless $P10, rx572_fail
    rx572_pos = $P10."pos"()
.annotate "line", 287
  # rx literal  "{"
    add $I11, rx572_pos, 1
    gt $I11, rx572_eos, rx572_fail
    sub $I11, rx572_pos, rx572_off
    substr $S10, rx572_tgt, $I11, 1
    ne $S10, "{", rx572_fail
    add rx572_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx572_cur."!cursor_pos"(rx572_pos)
    $P10 = rx572_cur."ws"()
    unless $P10, rx572_fail
    rx572_pos = $P10."pos"()
  # rx literal  "<...>"
    add $I11, rx572_pos, 5
    gt $I11, rx572_eos, rx572_fail
    sub $I11, rx572_pos, rx572_off
    substr $S10, rx572_tgt, $I11, 5
    ne $S10, "<...>", rx572_fail
    add rx572_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx572_cur."!cursor_pos"(rx572_pos)
    $P10 = rx572_cur."ws"()
    unless $P10, rx572_fail
    rx572_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx572_pos, 1
    gt $I11, rx572_eos, rx572_fail
    sub $I11, rx572_pos, rx572_off
    substr $S10, rx572_tgt, $I11, 1
    ne $S10, "}", rx572_fail
    add rx572_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx572_cur."!cursor_pos"(rx572_pos)
    $P10 = rx572_cur."ENDSTMT"()
    unless $P10, rx572_fail
  # rx subrule "ws" subtype=method negate=
    rx572_cur."!cursor_pos"(rx572_pos)
    $P10 = rx572_cur."ws"()
    unless $P10, rx572_fail
    rx572_pos = $P10."pos"()
.annotate "line", 285
    goto alt576_end
  alt576_1:
.annotate "line", 288
  # rx subrule "ws" subtype=method negate=
    rx572_cur."!cursor_pos"(rx572_pos)
    $P10 = rx572_cur."ws"()
    unless $P10, rx572_fail
    rx572_pos = $P10."pos"()
  # rx subcapture "sym"
    set_addr $I10, rxcap_588_fail
    rx572_cur."!mark_push"(0, rx572_pos, $I10)
  alt587_0:
    set_addr $I10, alt587_1
    rx572_cur."!mark_push"(0, rx572_pos, $I10)
  # rx literal  "regex"
    add $I11, rx572_pos, 5
    gt $I11, rx572_eos, rx572_fail
    sub $I11, rx572_pos, rx572_off
    substr $S10, rx572_tgt, $I11, 5
    ne $S10, "regex", rx572_fail
    add rx572_pos, 5
    goto alt587_end
  alt587_1:
    set_addr $I10, alt587_2
    rx572_cur."!mark_push"(0, rx572_pos, $I10)
  # rx literal  "token"
    add $I11, rx572_pos, 5
    gt $I11, rx572_eos, rx572_fail
    sub $I11, rx572_pos, rx572_off
    substr $S10, rx572_tgt, $I11, 5
    ne $S10, "token", rx572_fail
    add rx572_pos, 5
    goto alt587_end
  alt587_2:
  # rx literal  "rule"
    add $I11, rx572_pos, 4
    gt $I11, rx572_eos, rx572_fail
    sub $I11, rx572_pos, rx572_off
    substr $S10, rx572_tgt, $I11, 4
    ne $S10, "rule", rx572_fail
    add rx572_pos, 4
  alt587_end:
    set_addr $I10, rxcap_588_fail
    ($I12, $I11) = rx572_cur."!mark_peek"($I10)
    rx572_cur."!cursor_pos"($I11)
    ($P10) = rx572_cur."!cursor_start"()
    $P10."!cursor_pass"(rx572_pos, "")
    rx572_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_588_done
  rxcap_588_fail:
    goto rx572_fail
  rxcap_588_done:
  # rx subrule "ws" subtype=method negate=
    rx572_cur."!cursor_pos"(rx572_pos)
    $P10 = rx572_cur."ws"()
    unless $P10, rx572_fail
    rx572_pos = $P10."pos"()
.annotate "line", 289
  # rx subrule "deflongname" subtype=capture negate=
    rx572_cur."!cursor_pos"(rx572_pos)
    $P10 = rx572_cur."deflongname"()
    unless $P10, rx572_fail
    rx572_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx572_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx572_cur."!cursor_pos"(rx572_pos)
    $P10 = rx572_cur."ws"()
    unless $P10, rx572_fail
    rx572_pos = $P10."pos"()
.annotate "line", 290
  # rx subrule "newpad" subtype=method negate=
    rx572_cur."!cursor_pos"(rx572_pos)
    $P10 = rx572_cur."newpad"()
    unless $P10, rx572_fail
    rx572_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx572_cur."!cursor_pos"(rx572_pos)
    $P10 = rx572_cur."ws"()
    unless $P10, rx572_fail
    rx572_pos = $P10."pos"()
.annotate "line", 291
  # rx rxquantr592 ** 0..1
    set_addr $I597, rxquantr592_done
    rx572_cur."!mark_push"(0, rx572_pos, $I597)
  rxquantr592_loop:
  # rx subrule "ws" subtype=method negate=
    rx572_cur."!cursor_pos"(rx572_pos)
    $P10 = rx572_cur."ws"()
    unless $P10, rx572_fail
    rx572_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx572_pos, 1
    gt $I11, rx572_eos, rx572_fail
    sub $I11, rx572_pos, rx572_off
    substr $S10, rx572_tgt, $I11, 1
    ne $S10, "(", rx572_fail
    add rx572_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx572_cur."!cursor_pos"(rx572_pos)
    $P10 = rx572_cur."ws"()
    unless $P10, rx572_fail
    rx572_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx572_cur."!cursor_pos"(rx572_pos)
    $P10 = rx572_cur."signature"()
    unless $P10, rx572_fail
    rx572_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx572_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx572_cur."!cursor_pos"(rx572_pos)
    $P10 = rx572_cur."ws"()
    unless $P10, rx572_fail
    rx572_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx572_pos, 1
    gt $I11, rx572_eos, rx572_fail
    sub $I11, rx572_pos, rx572_off
    substr $S10, rx572_tgt, $I11, 1
    ne $S10, ")", rx572_fail
    add rx572_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx572_cur."!cursor_pos"(rx572_pos)
    $P10 = rx572_cur."ws"()
    unless $P10, rx572_fail
    rx572_pos = $P10."pos"()
    (rx572_rep) = rx572_cur."!mark_commit"($I597)
  rxquantr592_done:
  # rx subrule "ws" subtype=method negate=
    rx572_cur."!cursor_pos"(rx572_pos)
    $P10 = rx572_cur."ws"()
    unless $P10, rx572_fail
    rx572_pos = $P10."pos"()
.annotate "line", 292
  # rx reduce name="regex_declarator" key="open"
    rx572_cur."!cursor_pos"(rx572_pos)
    rx572_cur."!reduce"("regex_declarator", "open")
  # rx subrule "ws" subtype=method negate=
    rx572_cur."!cursor_pos"(rx572_pos)
    $P10 = rx572_cur."ws"()
    unless $P10, rx572_fail
    rx572_pos = $P10."pos"()
.annotate "line", 293
  # rx literal  "{"
    add $I11, rx572_pos, 1
    gt $I11, rx572_eos, rx572_fail
    sub $I11, rx572_pos, rx572_off
    substr $S10, rx572_tgt, $I11, 1
    ne $S10, "{", rx572_fail
    add rx572_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx572_cur."!cursor_pos"(rx572_pos)
    $P10 = rx572_cur."LANG"("Regex", "nibbler")
    unless $P10, rx572_fail
    rx572_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx572_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx572_pos, 1
    gt $I11, rx572_eos, rx572_fail
    sub $I11, rx572_pos, rx572_off
    substr $S10, rx572_tgt, $I11, 1
    ne $S10, "}", rx572_fail
    add rx572_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx572_cur."!cursor_pos"(rx572_pos)
    $P10 = rx572_cur."ENDSTMT"()
    unless $P10, rx572_fail
  # rx subrule "ws" subtype=method negate=
    rx572_cur."!cursor_pos"(rx572_pos)
    $P10 = rx572_cur."ws"()
    unless $P10, rx572_fail
    rx572_pos = $P10."pos"()
  alt576_end:
.annotate "line", 294
  # rx subrule "ws" subtype=method negate=
    rx572_cur."!cursor_pos"(rx572_pos)
    $P10 = rx572_cur."ws"()
    unless $P10, rx572_fail
    rx572_pos = $P10."pos"()
.annotate "line", 283
  # rx pass
    rx572_cur."!cursor_pass"(rx572_pos, "regex_declarator")
    rx572_cur."!cursor_debug"("PASS  ", "regex_declarator", " at pos=", rx572_pos)
    .return (rx572_cur)
  rx572_fail:
.annotate "line", 4
    (rx572_rep, rx572_pos, $I10, $P10) = rx572_cur."!mark_fail"(0)
    lt rx572_pos, -1, rx572_done
    eq rx572_pos, -1, rx572_fail
    jump $I10
  rx572_done:
    rx572_cur."!cursor_fail"()
    rx572_cur."!cursor_debug"("FAIL  ", "regex_declarator")
    .return (rx572_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__regex_declarator"  :subid("151_1258264446.59978") :method
.annotate "line", 4
    new $P574, "ResizablePMCArray"
    push $P574, ""
    .return ($P574)
.end


.namespace ["NQP";"Grammar"]
.sub "dotty"  :subid("152_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx603_tgt
    .local int rx603_pos
    .local int rx603_off
    .local int rx603_eos
    .local int rx603_rep
    .local pmc rx603_cur
    (rx603_cur, rx603_pos, rx603_tgt, $I10) = self."!cursor_start"()
    rx603_cur."!cursor_debug"("START ", "dotty")
    rx603_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx603_cur
    .local pmc match
    .lex "$/", match
    length rx603_eos, rx603_tgt
    set rx603_off, 0
    lt $I10, 2, rx603_start
    sub rx603_off, $I10, 1
    substr rx603_tgt, rx603_tgt, rx603_off
  rx603_start:
.annotate "line", 298
  # rx literal  "."
    add $I11, rx603_pos, 1
    gt $I11, rx603_eos, rx603_fail
    sub $I11, rx603_pos, rx603_off
    substr $S10, rx603_tgt, $I11, 1
    ne $S10, ".", rx603_fail
    add rx603_pos, 1
  # rx subrule "identifier" subtype=capture negate=
    rx603_cur."!cursor_pos"(rx603_pos)
    $P10 = rx603_cur."identifier"()
    unless $P10, rx603_fail
    rx603_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx603_pos = $P10."pos"()
.annotate "line", 302
  # rx rxquantr607 ** 0..1
    set_addr $I609, rxquantr607_done
    rx603_cur."!mark_push"(0, rx603_pos, $I609)
  rxquantr607_loop:
  alt608_0:
.annotate "line", 299
    set_addr $I10, alt608_1
    rx603_cur."!mark_push"(0, rx603_pos, $I10)
.annotate "line", 300
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
    goto alt608_end
  alt608_1:
.annotate "line", 301
  # rx literal  ":"
    add $I11, rx603_pos, 1
    gt $I11, rx603_eos, rx603_fail
    sub $I11, rx603_pos, rx603_off
    substr $S10, rx603_tgt, $I11, 1
    ne $S10, ":", rx603_fail
    add rx603_pos, 1
  # rx charclass s
    ge rx603_pos, rx603_eos, rx603_fail
    sub $I10, rx603_pos, rx603_off
    is_cclass $I11, 32, rx603_tgt, $I10
    unless $I11, rx603_fail
    inc rx603_pos
  # rx subrule "arglist" subtype=capture negate=
    rx603_cur."!cursor_pos"(rx603_pos)
    $P10 = rx603_cur."arglist"()
    unless $P10, rx603_fail
    rx603_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx603_pos = $P10."pos"()
  alt608_end:
.annotate "line", 302
    (rx603_rep) = rx603_cur."!mark_commit"($I609)
  rxquantr607_done:
.annotate "line", 297
  # rx pass
    rx603_cur."!cursor_pass"(rx603_pos, "dotty")
    rx603_cur."!cursor_debug"("PASS  ", "dotty", " at pos=", rx603_pos)
    .return (rx603_cur)
  rx603_fail:
.annotate "line", 4
    (rx603_rep, rx603_pos, $I10, $P10) = rx603_cur."!mark_fail"(0)
    lt rx603_pos, -1, rx603_done
    eq rx603_pos, -1, rx603_fail
    jump $I10
  rx603_done:
    rx603_cur."!cursor_fail"()
    rx603_cur."!cursor_debug"("FAIL  ", "dotty")
    .return (rx603_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__dotty"  :subid("153_1258264446.59978") :method
.annotate "line", 4
    $P605 = self."!PREFIX__!subrule"("identifier", ".")
    new $P606, "ResizablePMCArray"
    push $P606, $P605
    .return ($P606)
.end


.namespace ["NQP";"Grammar"]
.sub "term"  :subid("154_1258264446.59978") :method
.annotate "line", 306
    $P611 = self."!protoregex"("term")
    .return ($P611)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term"  :subid("155_1258264446.59978") :method
.annotate "line", 306
    $P613 = self."!PREFIX__!protoregex"("term")
    .return ($P613)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<self>"  :subid("156_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx615_tgt
    .local int rx615_pos
    .local int rx615_off
    .local int rx615_eos
    .local int rx615_rep
    .local pmc rx615_cur
    (rx615_cur, rx615_pos, rx615_tgt, $I10) = self."!cursor_start"()
    rx615_cur."!cursor_debug"("START ", "term:sym<self>")
    .lex unicode:"$\x{a2}", rx615_cur
    .local pmc match
    .lex "$/", match
    length rx615_eos, rx615_tgt
    set rx615_off, 0
    lt $I10, 2, rx615_start
    sub rx615_off, $I10, 1
    substr rx615_tgt, rx615_tgt, rx615_off
  rx615_start:
.annotate "line", 308
  # rx subcapture "sym"
    set_addr $I10, rxcap_618_fail
    rx615_cur."!mark_push"(0, rx615_pos, $I10)
  # rx literal  "self"
    add $I11, rx615_pos, 4
    gt $I11, rx615_eos, rx615_fail
    sub $I11, rx615_pos, rx615_off
    substr $S10, rx615_tgt, $I11, 4
    ne $S10, "self", rx615_fail
    add rx615_pos, 4
    set_addr $I10, rxcap_618_fail
    ($I12, $I11) = rx615_cur."!mark_peek"($I10)
    rx615_cur."!cursor_pos"($I11)
    ($P10) = rx615_cur."!cursor_start"()
    $P10."!cursor_pass"(rx615_pos, "")
    rx615_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_618_done
  rxcap_618_fail:
    goto rx615_fail
  rxcap_618_done:
  # rxanchor rwb
    le rx615_pos, 0, rx615_fail
    sub $I10, rx615_pos, rx615_off
    is_cclass $I11, 8192, rx615_tgt, $I10
    if $I11, rx615_fail
    dec $I10
    is_cclass $I11, 8192, rx615_tgt, $I10
    unless $I11, rx615_fail
  # rx pass
    rx615_cur."!cursor_pass"(rx615_pos, "term:sym<self>")
    rx615_cur."!cursor_debug"("PASS  ", "term:sym<self>", " at pos=", rx615_pos)
    .return (rx615_cur)
  rx615_fail:
.annotate "line", 4
    (rx615_rep, rx615_pos, $I10, $P10) = rx615_cur."!mark_fail"(0)
    lt rx615_pos, -1, rx615_done
    eq rx615_pos, -1, rx615_fail
    jump $I10
  rx615_done:
    rx615_cur."!cursor_fail"()
    rx615_cur."!cursor_debug"("FAIL  ", "term:sym<self>")
    .return (rx615_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<self>"  :subid("157_1258264446.59978") :method
.annotate "line", 4
    new $P617, "ResizablePMCArray"
    push $P617, "self"
    .return ($P617)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<identifier>"  :subid("158_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx620_tgt
    .local int rx620_pos
    .local int rx620_off
    .local int rx620_eos
    .local int rx620_rep
    .local pmc rx620_cur
    (rx620_cur, rx620_pos, rx620_tgt, $I10) = self."!cursor_start"()
    rx620_cur."!cursor_debug"("START ", "term:sym<identifier>")
    .lex unicode:"$\x{a2}", rx620_cur
    .local pmc match
    .lex "$/", match
    length rx620_eos, rx620_tgt
    set rx620_off, 0
    lt $I10, 2, rx620_start
    sub rx620_off, $I10, 1
    substr rx620_tgt, rx620_tgt, rx620_off
  rx620_start:
.annotate "line", 311
  # rx subrule "identifier" subtype=capture negate=
    rx620_cur."!cursor_pos"(rx620_pos)
    $P10 = rx620_cur."identifier"()
    unless $P10, rx620_fail
    rx620_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx620_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx620_pos, rx620_eos, rx620_fail
    sub $I10, rx620_pos, rx620_off
    substr $S10, rx620_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx620_fail
  # rx subrule "args" subtype=capture negate=
    rx620_cur."!cursor_pos"(rx620_pos)
    $P10 = rx620_cur."args"()
    unless $P10, rx620_fail
    rx620_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx620_pos = $P10."pos"()
.annotate "line", 310
  # rx pass
    rx620_cur."!cursor_pass"(rx620_pos, "term:sym<identifier>")
    rx620_cur."!cursor_debug"("PASS  ", "term:sym<identifier>", " at pos=", rx620_pos)
    .return (rx620_cur)
  rx620_fail:
.annotate "line", 4
    (rx620_rep, rx620_pos, $I10, $P10) = rx620_cur."!mark_fail"(0)
    lt rx620_pos, -1, rx620_done
    eq rx620_pos, -1, rx620_fail
    jump $I10
  rx620_done:
    rx620_cur."!cursor_fail"()
    rx620_cur."!cursor_debug"("FAIL  ", "term:sym<identifier>")
    .return (rx620_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<identifier>"  :subid("159_1258264446.59978") :method
.annotate "line", 4
    $P622 = self."!PREFIX__!subrule"("identifier", "")
    new $P623, "ResizablePMCArray"
    push $P623, $P622
    .return ($P623)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<name>"  :subid("160_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx625_tgt
    .local int rx625_pos
    .local int rx625_off
    .local int rx625_eos
    .local int rx625_rep
    .local pmc rx625_cur
    (rx625_cur, rx625_pos, rx625_tgt, $I10) = self."!cursor_start"()
    rx625_cur."!cursor_debug"("START ", "term:sym<name>")
    rx625_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx625_cur
    .local pmc match
    .lex "$/", match
    length rx625_eos, rx625_tgt
    set rx625_off, 0
    lt $I10, 2, rx625_start
    sub rx625_off, $I10, 1
    substr rx625_tgt, rx625_tgt, rx625_off
  rx625_start:
.annotate "line", 315
  # rx subrule "name" subtype=capture negate=
    rx625_cur."!cursor_pos"(rx625_pos)
    $P10 = rx625_cur."name"()
    unless $P10, rx625_fail
    rx625_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx625_pos = $P10."pos"()
  # rx rxquantr629 ** 0..1
    set_addr $I630, rxquantr629_done
    rx625_cur."!mark_push"(0, rx625_pos, $I630)
  rxquantr629_loop:
  # rx subrule "args" subtype=capture negate=
    rx625_cur."!cursor_pos"(rx625_pos)
    $P10 = rx625_cur."args"()
    unless $P10, rx625_fail
    rx625_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx625_pos = $P10."pos"()
    (rx625_rep) = rx625_cur."!mark_commit"($I630)
  rxquantr629_done:
.annotate "line", 314
  # rx pass
    rx625_cur."!cursor_pass"(rx625_pos, "term:sym<name>")
    rx625_cur."!cursor_debug"("PASS  ", "term:sym<name>", " at pos=", rx625_pos)
    .return (rx625_cur)
  rx625_fail:
.annotate "line", 4
    (rx625_rep, rx625_pos, $I10, $P10) = rx625_cur."!mark_fail"(0)
    lt rx625_pos, -1, rx625_done
    eq rx625_pos, -1, rx625_fail
    jump $I10
  rx625_done:
    rx625_cur."!cursor_fail"()
    rx625_cur."!cursor_debug"("FAIL  ", "term:sym<name>")
    .return (rx625_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<name>"  :subid("161_1258264446.59978") :method
.annotate "line", 4
    $P627 = self."!PREFIX__!subrule"("name", "")
    new $P628, "ResizablePMCArray"
    push $P628, $P627
    .return ($P628)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<pir::op>"  :subid("162_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx632_tgt
    .local int rx632_pos
    .local int rx632_off
    .local int rx632_eos
    .local int rx632_rep
    .local pmc rx632_cur
    (rx632_cur, rx632_pos, rx632_tgt, $I10) = self."!cursor_start"()
    rx632_cur."!cursor_debug"("START ", "term:sym<pir::op>")
    rx632_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx632_cur
    .local pmc match
    .lex "$/", match
    length rx632_eos, rx632_tgt
    set rx632_off, 0
    lt $I10, 2, rx632_start
    sub rx632_off, $I10, 1
    substr rx632_tgt, rx632_tgt, rx632_off
  rx632_start:
.annotate "line", 319
  # rx literal  "pir::"
    add $I11, rx632_pos, 5
    gt $I11, rx632_eos, rx632_fail
    sub $I11, rx632_pos, rx632_off
    substr $S10, rx632_tgt, $I11, 5
    ne $S10, "pir::", rx632_fail
    add rx632_pos, 5
  # rx subcapture "op"
    set_addr $I10, rxcap_635_fail
    rx632_cur."!mark_push"(0, rx632_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx632_pos, rx632_off
    find_not_cclass $I11, 8192, rx632_tgt, $I10, rx632_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx632_fail
    add rx632_pos, rx632_off, $I11
    set_addr $I10, rxcap_635_fail
    ($I12, $I11) = rx632_cur."!mark_peek"($I10)
    rx632_cur."!cursor_pos"($I11)
    ($P10) = rx632_cur."!cursor_start"()
    $P10."!cursor_pass"(rx632_pos, "")
    rx632_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("op")
    goto rxcap_635_done
  rxcap_635_fail:
    goto rx632_fail
  rxcap_635_done:
  # rx rxquantr636 ** 0..1
    set_addr $I637, rxquantr636_done
    rx632_cur."!mark_push"(0, rx632_pos, $I637)
  rxquantr636_loop:
  # rx subrule "args" subtype=capture negate=
    rx632_cur."!cursor_pos"(rx632_pos)
    $P10 = rx632_cur."args"()
    unless $P10, rx632_fail
    rx632_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx632_pos = $P10."pos"()
    (rx632_rep) = rx632_cur."!mark_commit"($I637)
  rxquantr636_done:
.annotate "line", 318
  # rx pass
    rx632_cur."!cursor_pass"(rx632_pos, "term:sym<pir::op>")
    rx632_cur."!cursor_debug"("PASS  ", "term:sym<pir::op>", " at pos=", rx632_pos)
    .return (rx632_cur)
  rx632_fail:
.annotate "line", 4
    (rx632_rep, rx632_pos, $I10, $P10) = rx632_cur."!mark_fail"(0)
    lt rx632_pos, -1, rx632_done
    eq rx632_pos, -1, rx632_fail
    jump $I10
  rx632_done:
    rx632_cur."!cursor_fail"()
    rx632_cur."!cursor_debug"("FAIL  ", "term:sym<pir::op>")
    .return (rx632_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<pir::op>"  :subid("163_1258264446.59978") :method
.annotate "line", 4
    new $P634, "ResizablePMCArray"
    push $P634, "pir::"
    .return ($P634)
.end


.namespace ["NQP";"Grammar"]
.sub "args"  :subid("164_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx639_tgt
    .local int rx639_pos
    .local int rx639_off
    .local int rx639_eos
    .local int rx639_rep
    .local pmc rx639_cur
    (rx639_cur, rx639_pos, rx639_tgt, $I10) = self."!cursor_start"()
    rx639_cur."!cursor_debug"("START ", "args")
    .lex unicode:"$\x{a2}", rx639_cur
    .local pmc match
    .lex "$/", match
    length rx639_eos, rx639_tgt
    set rx639_off, 0
    lt $I10, 2, rx639_start
    sub rx639_off, $I10, 1
    substr rx639_tgt, rx639_tgt, rx639_off
  rx639_start:
.annotate "line", 323
  # rx literal  "("
    add $I11, rx639_pos, 1
    gt $I11, rx639_eos, rx639_fail
    sub $I11, rx639_pos, rx639_off
    substr $S10, rx639_tgt, $I11, 1
    ne $S10, "(", rx639_fail
    add rx639_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx639_cur."!cursor_pos"(rx639_pos)
    $P10 = rx639_cur."arglist"()
    unless $P10, rx639_fail
    rx639_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx639_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx639_pos, 1
    gt $I11, rx639_eos, rx639_fail
    sub $I11, rx639_pos, rx639_off
    substr $S10, rx639_tgt, $I11, 1
    ne $S10, ")", rx639_fail
    add rx639_pos, 1
  # rx pass
    rx639_cur."!cursor_pass"(rx639_pos, "args")
    rx639_cur."!cursor_debug"("PASS  ", "args", " at pos=", rx639_pos)
    .return (rx639_cur)
  rx639_fail:
.annotate "line", 4
    (rx639_rep, rx639_pos, $I10, $P10) = rx639_cur."!mark_fail"(0)
    lt rx639_pos, -1, rx639_done
    eq rx639_pos, -1, rx639_fail
    jump $I10
  rx639_done:
    rx639_cur."!cursor_fail"()
    rx639_cur."!cursor_debug"("FAIL  ", "args")
    .return (rx639_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__args"  :subid("165_1258264446.59978") :method
.annotate "line", 4
    $P641 = self."!PREFIX__!subrule"("arglist", "(")
    new $P642, "ResizablePMCArray"
    push $P642, $P641
    .return ($P642)
.end


.namespace ["NQP";"Grammar"]
.sub "arglist"  :subid("166_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx644_tgt
    .local int rx644_pos
    .local int rx644_off
    .local int rx644_eos
    .local int rx644_rep
    .local pmc rx644_cur
    (rx644_cur, rx644_pos, rx644_tgt, $I10) = self."!cursor_start"()
    rx644_cur."!cursor_debug"("START ", "arglist")
    .lex unicode:"$\x{a2}", rx644_cur
    .local pmc match
    .lex "$/", match
    length rx644_eos, rx644_tgt
    set rx644_off, 0
    lt $I10, 2, rx644_start
    sub rx644_off, $I10, 1
    substr rx644_tgt, rx644_tgt, rx644_off
  rx644_start:
.annotate "line", 327
  # rx subrule "ws" subtype=method negate=
    rx644_cur."!cursor_pos"(rx644_pos)
    $P10 = rx644_cur."ws"()
    unless $P10, rx644_fail
    rx644_pos = $P10."pos"()
  alt648_0:
.annotate "line", 328
    set_addr $I10, alt648_1
    rx644_cur."!mark_push"(0, rx644_pos, $I10)
.annotate "line", 329
  # rx subrule "EXPR" subtype=capture negate=
    rx644_cur."!cursor_pos"(rx644_pos)
    $P10 = rx644_cur."EXPR"("f=")
    unless $P10, rx644_fail
    rx644_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx644_pos = $P10."pos"()
    goto alt648_end
  alt648_1:
  alt648_end:
.annotate "line", 326
  # rx pass
    rx644_cur."!cursor_pass"(rx644_pos, "arglist")
    rx644_cur."!cursor_debug"("PASS  ", "arglist", " at pos=", rx644_pos)
    .return (rx644_cur)
  rx644_fail:
.annotate "line", 4
    (rx644_rep, rx644_pos, $I10, $P10) = rx644_cur."!mark_fail"(0)
    lt rx644_pos, -1, rx644_done
    eq rx644_pos, -1, rx644_fail
    jump $I10
  rx644_done:
    rx644_cur."!cursor_fail"()
    rx644_cur."!cursor_debug"("FAIL  ", "arglist")
    .return (rx644_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__arglist"  :subid("167_1258264446.59978") :method
.annotate "line", 4
    $P646 = self."!PREFIX__!subrule"("", "")
    new $P647, "ResizablePMCArray"
    push $P647, $P646
    .return ($P647)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<value>"  :subid("168_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx650_tgt
    .local int rx650_pos
    .local int rx650_off
    .local int rx650_eos
    .local int rx650_rep
    .local pmc rx650_cur
    (rx650_cur, rx650_pos, rx650_tgt, $I10) = self."!cursor_start"()
    rx650_cur."!cursor_debug"("START ", "term:sym<value>")
    .lex unicode:"$\x{a2}", rx650_cur
    .local pmc match
    .lex "$/", match
    length rx650_eos, rx650_tgt
    set rx650_off, 0
    lt $I10, 2, rx650_start
    sub rx650_off, $I10, 1
    substr rx650_tgt, rx650_tgt, rx650_off
  rx650_start:
.annotate "line", 335
  # rx subrule "value" subtype=capture negate=
    rx650_cur."!cursor_pos"(rx650_pos)
    $P10 = rx650_cur."value"()
    unless $P10, rx650_fail
    rx650_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("value")
    rx650_pos = $P10."pos"()
  # rx pass
    rx650_cur."!cursor_pass"(rx650_pos, "term:sym<value>")
    rx650_cur."!cursor_debug"("PASS  ", "term:sym<value>", " at pos=", rx650_pos)
    .return (rx650_cur)
  rx650_fail:
.annotate "line", 4
    (rx650_rep, rx650_pos, $I10, $P10) = rx650_cur."!mark_fail"(0)
    lt rx650_pos, -1, rx650_done
    eq rx650_pos, -1, rx650_fail
    jump $I10
  rx650_done:
    rx650_cur."!cursor_fail"()
    rx650_cur."!cursor_debug"("FAIL  ", "term:sym<value>")
    .return (rx650_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<value>"  :subid("169_1258264446.59978") :method
.annotate "line", 4
    $P652 = self."!PREFIX__!subrule"("value", "")
    new $P653, "ResizablePMCArray"
    push $P653, $P652
    .return ($P653)
.end


.namespace ["NQP";"Grammar"]
.sub "value"  :subid("170_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx655_tgt
    .local int rx655_pos
    .local int rx655_off
    .local int rx655_eos
    .local int rx655_rep
    .local pmc rx655_cur
    (rx655_cur, rx655_pos, rx655_tgt, $I10) = self."!cursor_start"()
    rx655_cur."!cursor_debug"("START ", "value")
    .lex unicode:"$\x{a2}", rx655_cur
    .local pmc match
    .lex "$/", match
    length rx655_eos, rx655_tgt
    set rx655_off, 0
    lt $I10, 2, rx655_start
    sub rx655_off, $I10, 1
    substr rx655_tgt, rx655_tgt, rx655_off
  rx655_start:
  alt661_0:
.annotate "line", 337
    set_addr $I10, alt661_1
    rx655_cur."!mark_push"(0, rx655_pos, $I10)
.annotate "line", 338
  # rx subrule "dec_number" subtype=capture negate=
    rx655_cur."!cursor_pos"(rx655_pos)
    $P10 = rx655_cur."dec_number"()
    unless $P10, rx655_fail
    rx655_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dec_number")
    rx655_pos = $P10."pos"()
    goto alt661_end
  alt661_1:
    set_addr $I10, alt661_2
    rx655_cur."!mark_push"(0, rx655_pos, $I10)
.annotate "line", 339
  # rx subrule "quote" subtype=capture negate=
    rx655_cur."!cursor_pos"(rx655_pos)
    $P10 = rx655_cur."quote"()
    unless $P10, rx655_fail
    rx655_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx655_pos = $P10."pos"()
    goto alt661_end
  alt661_2:
.annotate "line", 340
  # rx subrule "integer" subtype=capture negate=
    rx655_cur."!cursor_pos"(rx655_pos)
    $P10 = rx655_cur."integer"()
    unless $P10, rx655_fail
    rx655_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("integer")
    rx655_pos = $P10."pos"()
  alt661_end:
.annotate "line", 337
  # rx pass
    rx655_cur."!cursor_pass"(rx655_pos, "value")
    rx655_cur."!cursor_debug"("PASS  ", "value", " at pos=", rx655_pos)
    .return (rx655_cur)
  rx655_fail:
.annotate "line", 4
    (rx655_rep, rx655_pos, $I10, $P10) = rx655_cur."!mark_fail"(0)
    lt rx655_pos, -1, rx655_done
    eq rx655_pos, -1, rx655_fail
    jump $I10
  rx655_done:
    rx655_cur."!cursor_fail"()
    rx655_cur."!cursor_debug"("FAIL  ", "value")
    .return (rx655_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__value"  :subid("171_1258264446.59978") :method
.annotate "line", 4
    $P657 = self."!PREFIX__!subrule"("integer", "")
    $P658 = self."!PREFIX__!subrule"("quote", "")
    $P659 = self."!PREFIX__!subrule"("dec_number", "")
    new $P660, "ResizablePMCArray"
    push $P660, $P657
    push $P660, $P658
    push $P660, $P659
    .return ($P660)
.end


.namespace ["NQP";"Grammar"]
.sub "quote"  :subid("172_1258264446.59978") :method
.annotate "line", 343
    $P663 = self."!protoregex"("quote")
    .return ($P663)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote"  :subid("173_1258264446.59978") :method
.annotate "line", 343
    $P665 = self."!PREFIX__!protoregex"("quote")
    .return ($P665)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<apos>"  :subid("174_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx667_tgt
    .local int rx667_pos
    .local int rx667_off
    .local int rx667_eos
    .local int rx667_rep
    .local pmc rx667_cur
    (rx667_cur, rx667_pos, rx667_tgt, $I10) = self."!cursor_start"()
    rx667_cur."!cursor_debug"("START ", "quote:sym<apos>")
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
  # rx enumcharlist negate=0 zerowidth
    ge rx667_pos, rx667_eos, rx667_fail
    sub $I10, rx667_pos, rx667_off
    substr $S10, rx667_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx667_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx667_cur."!cursor_pos"(rx667_pos)
    $P10 = rx667_cur."quote_EXPR"(":q")
    unless $P10, rx667_fail
    rx667_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx667_pos = $P10."pos"()
  # rx pass
    rx667_cur."!cursor_pass"(rx667_pos, "quote:sym<apos>")
    rx667_cur."!cursor_debug"("PASS  ", "quote:sym<apos>", " at pos=", rx667_pos)
    .return (rx667_cur)
  rx667_fail:
.annotate "line", 4
    (rx667_rep, rx667_pos, $I10, $P10) = rx667_cur."!mark_fail"(0)
    lt rx667_pos, -1, rx667_done
    eq rx667_pos, -1, rx667_fail
    jump $I10
  rx667_done:
    rx667_cur."!cursor_fail"()
    rx667_cur."!cursor_debug"("FAIL  ", "quote:sym<apos>")
    .return (rx667_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<apos>"  :subid("175_1258264446.59978") :method
.annotate "line", 4
    new $P669, "ResizablePMCArray"
    push $P669, "'"
    .return ($P669)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<dblq>"  :subid("176_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx671_tgt
    .local int rx671_pos
    .local int rx671_off
    .local int rx671_eos
    .local int rx671_rep
    .local pmc rx671_cur
    (rx671_cur, rx671_pos, rx671_tgt, $I10) = self."!cursor_start"()
    rx671_cur."!cursor_debug"("START ", "quote:sym<dblq>")
    .lex unicode:"$\x{a2}", rx671_cur
    .local pmc match
    .lex "$/", match
    length rx671_eos, rx671_tgt
    set rx671_off, 0
    lt $I10, 2, rx671_start
    sub rx671_off, $I10, 1
    substr rx671_tgt, rx671_tgt, rx671_off
  rx671_start:
.annotate "line", 345
  # rx enumcharlist negate=0 zerowidth
    ge rx671_pos, rx671_eos, rx671_fail
    sub $I10, rx671_pos, rx671_off
    substr $S10, rx671_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx671_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx671_cur."!cursor_pos"(rx671_pos)
    $P10 = rx671_cur."quote_EXPR"(":qq")
    unless $P10, rx671_fail
    rx671_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx671_pos = $P10."pos"()
  # rx pass
    rx671_cur."!cursor_pass"(rx671_pos, "quote:sym<dblq>")
    rx671_cur."!cursor_debug"("PASS  ", "quote:sym<dblq>", " at pos=", rx671_pos)
    .return (rx671_cur)
  rx671_fail:
.annotate "line", 4
    (rx671_rep, rx671_pos, $I10, $P10) = rx671_cur."!mark_fail"(0)
    lt rx671_pos, -1, rx671_done
    eq rx671_pos, -1, rx671_fail
    jump $I10
  rx671_done:
    rx671_cur."!cursor_fail"()
    rx671_cur."!cursor_debug"("FAIL  ", "quote:sym<dblq>")
    .return (rx671_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<dblq>"  :subid("177_1258264446.59978") :method
.annotate "line", 4
    new $P673, "ResizablePMCArray"
    push $P673, "\""
    .return ($P673)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<q>"  :subid("178_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx675_tgt
    .local int rx675_pos
    .local int rx675_off
    .local int rx675_eos
    .local int rx675_rep
    .local pmc rx675_cur
    (rx675_cur, rx675_pos, rx675_tgt, $I10) = self."!cursor_start"()
    rx675_cur."!cursor_debug"("START ", "quote:sym<q>")
    .lex unicode:"$\x{a2}", rx675_cur
    .local pmc match
    .lex "$/", match
    length rx675_eos, rx675_tgt
    set rx675_off, 0
    lt $I10, 2, rx675_start
    sub rx675_off, $I10, 1
    substr rx675_tgt, rx675_tgt, rx675_off
  rx675_start:
.annotate "line", 346
  # rx literal  "q"
    add $I11, rx675_pos, 1
    gt $I11, rx675_eos, rx675_fail
    sub $I11, rx675_pos, rx675_off
    substr $S10, rx675_tgt, $I11, 1
    ne $S10, "q", rx675_fail
    add rx675_pos, 1
  # rx enumcharlist negate=1 zerowidth
    ge rx675_pos, rx675_eos, rx675_fail
    sub $I10, rx675_pos, rx675_off
    substr $S10, rx675_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx675_fail
  # rx subrule "ws" subtype=method negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."ws"()
    unless $P10, rx675_fail
    rx675_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx675_cur."!cursor_pos"(rx675_pos)
    $P10 = rx675_cur."quote_EXPR"(":q")
    unless $P10, rx675_fail
    rx675_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx675_pos = $P10."pos"()
  # rx pass
    rx675_cur."!cursor_pass"(rx675_pos, "quote:sym<q>")
    rx675_cur."!cursor_debug"("PASS  ", "quote:sym<q>", " at pos=", rx675_pos)
    .return (rx675_cur)
  rx675_fail:
.annotate "line", 4
    (rx675_rep, rx675_pos, $I10, $P10) = rx675_cur."!mark_fail"(0)
    lt rx675_pos, -1, rx675_done
    eq rx675_pos, -1, rx675_fail
    jump $I10
  rx675_done:
    rx675_cur."!cursor_fail"()
    rx675_cur."!cursor_debug"("FAIL  ", "quote:sym<q>")
    .return (rx675_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<q>"  :subid("179_1258264446.59978") :method
.annotate "line", 4
    $P677 = self."!PREFIX__!subrule"("", "q")
    new $P678, "ResizablePMCArray"
    push $P678, $P677
    .return ($P678)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<qq>"  :subid("180_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx680_tgt
    .local int rx680_pos
    .local int rx680_off
    .local int rx680_eos
    .local int rx680_rep
    .local pmc rx680_cur
    (rx680_cur, rx680_pos, rx680_tgt, $I10) = self."!cursor_start"()
    rx680_cur."!cursor_debug"("START ", "quote:sym<qq>")
    .lex unicode:"$\x{a2}", rx680_cur
    .local pmc match
    .lex "$/", match
    length rx680_eos, rx680_tgt
    set rx680_off, 0
    lt $I10, 2, rx680_start
    sub rx680_off, $I10, 1
    substr rx680_tgt, rx680_tgt, rx680_off
  rx680_start:
.annotate "line", 347
  # rx literal  "qq"
    add $I11, rx680_pos, 2
    gt $I11, rx680_eos, rx680_fail
    sub $I11, rx680_pos, rx680_off
    substr $S10, rx680_tgt, $I11, 2
    ne $S10, "qq", rx680_fail
    add rx680_pos, 2
  # rx enumcharlist negate=1 zerowidth
    ge rx680_pos, rx680_eos, rx680_fail
    sub $I10, rx680_pos, rx680_off
    substr $S10, rx680_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx680_fail
  # rx subrule "ws" subtype=method negate=
    rx680_cur."!cursor_pos"(rx680_pos)
    $P10 = rx680_cur."ws"()
    unless $P10, rx680_fail
    rx680_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx680_cur."!cursor_pos"(rx680_pos)
    $P10 = rx680_cur."quote_EXPR"(":qq")
    unless $P10, rx680_fail
    rx680_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx680_pos = $P10."pos"()
  # rx pass
    rx680_cur."!cursor_pass"(rx680_pos, "quote:sym<qq>")
    rx680_cur."!cursor_debug"("PASS  ", "quote:sym<qq>", " at pos=", rx680_pos)
    .return (rx680_cur)
  rx680_fail:
.annotate "line", 4
    (rx680_rep, rx680_pos, $I10, $P10) = rx680_cur."!mark_fail"(0)
    lt rx680_pos, -1, rx680_done
    eq rx680_pos, -1, rx680_fail
    jump $I10
  rx680_done:
    rx680_cur."!cursor_fail"()
    rx680_cur."!cursor_debug"("FAIL  ", "quote:sym<qq>")
    .return (rx680_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<qq>"  :subid("181_1258264446.59978") :method
.annotate "line", 4
    $P682 = self."!PREFIX__!subrule"("", "qq")
    new $P683, "ResizablePMCArray"
    push $P683, $P682
    .return ($P683)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q>"  :subid("182_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx685_tgt
    .local int rx685_pos
    .local int rx685_off
    .local int rx685_eos
    .local int rx685_rep
    .local pmc rx685_cur
    (rx685_cur, rx685_pos, rx685_tgt, $I10) = self."!cursor_start"()
    rx685_cur."!cursor_debug"("START ", "quote:sym<Q>")
    .lex unicode:"$\x{a2}", rx685_cur
    .local pmc match
    .lex "$/", match
    length rx685_eos, rx685_tgt
    set rx685_off, 0
    lt $I10, 2, rx685_start
    sub rx685_off, $I10, 1
    substr rx685_tgt, rx685_tgt, rx685_off
  rx685_start:
.annotate "line", 348
  # rx literal  "Q"
    add $I11, rx685_pos, 1
    gt $I11, rx685_eos, rx685_fail
    sub $I11, rx685_pos, rx685_off
    substr $S10, rx685_tgt, $I11, 1
    ne $S10, "Q", rx685_fail
    add rx685_pos, 1
  # rx enumcharlist negate=1 zerowidth
    ge rx685_pos, rx685_eos, rx685_fail
    sub $I10, rx685_pos, rx685_off
    substr $S10, rx685_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx685_fail
  # rx subrule "ws" subtype=method negate=
    rx685_cur."!cursor_pos"(rx685_pos)
    $P10 = rx685_cur."ws"()
    unless $P10, rx685_fail
    rx685_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx685_cur."!cursor_pos"(rx685_pos)
    $P10 = rx685_cur."quote_EXPR"()
    unless $P10, rx685_fail
    rx685_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx685_pos = $P10."pos"()
  # rx pass
    rx685_cur."!cursor_pass"(rx685_pos, "quote:sym<Q>")
    rx685_cur."!cursor_debug"("PASS  ", "quote:sym<Q>", " at pos=", rx685_pos)
    .return (rx685_cur)
  rx685_fail:
.annotate "line", 4
    (rx685_rep, rx685_pos, $I10, $P10) = rx685_cur."!mark_fail"(0)
    lt rx685_pos, -1, rx685_done
    eq rx685_pos, -1, rx685_fail
    jump $I10
  rx685_done:
    rx685_cur."!cursor_fail"()
    rx685_cur."!cursor_debug"("FAIL  ", "quote:sym<Q>")
    .return (rx685_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q>"  :subid("183_1258264446.59978") :method
.annotate "line", 4
    $P687 = self."!PREFIX__!subrule"("", "Q")
    new $P688, "ResizablePMCArray"
    push $P688, $P687
    .return ($P688)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q:PIR>"  :subid("184_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx690_tgt
    .local int rx690_pos
    .local int rx690_off
    .local int rx690_eos
    .local int rx690_rep
    .local pmc rx690_cur
    (rx690_cur, rx690_pos, rx690_tgt, $I10) = self."!cursor_start"()
    rx690_cur."!cursor_debug"("START ", "quote:sym<Q:PIR>")
    .lex unicode:"$\x{a2}", rx690_cur
    .local pmc match
    .lex "$/", match
    length rx690_eos, rx690_tgt
    set rx690_off, 0
    lt $I10, 2, rx690_start
    sub rx690_off, $I10, 1
    substr rx690_tgt, rx690_tgt, rx690_off
  rx690_start:
.annotate "line", 349
  # rx literal  "Q:PIR"
    add $I11, rx690_pos, 5
    gt $I11, rx690_eos, rx690_fail
    sub $I11, rx690_pos, rx690_off
    substr $S10, rx690_tgt, $I11, 5
    ne $S10, "Q:PIR", rx690_fail
    add rx690_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx690_cur."!cursor_pos"(rx690_pos)
    $P10 = rx690_cur."ws"()
    unless $P10, rx690_fail
    rx690_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx690_cur."!cursor_pos"(rx690_pos)
    $P10 = rx690_cur."quote_EXPR"()
    unless $P10, rx690_fail
    rx690_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx690_pos = $P10."pos"()
  # rx pass
    rx690_cur."!cursor_pass"(rx690_pos, "quote:sym<Q:PIR>")
    rx690_cur."!cursor_debug"("PASS  ", "quote:sym<Q:PIR>", " at pos=", rx690_pos)
    .return (rx690_cur)
  rx690_fail:
.annotate "line", 4
    (rx690_rep, rx690_pos, $I10, $P10) = rx690_cur."!mark_fail"(0)
    lt rx690_pos, -1, rx690_done
    eq rx690_pos, -1, rx690_fail
    jump $I10
  rx690_done:
    rx690_cur."!cursor_fail"()
    rx690_cur."!cursor_debug"("FAIL  ", "quote:sym<Q:PIR>")
    .return (rx690_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q:PIR>"  :subid("185_1258264446.59978") :method
.annotate "line", 4
    $P692 = self."!PREFIX__!subrule"("", "Q:PIR")
    new $P693, "ResizablePMCArray"
    push $P693, $P692
    .return ($P693)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<$>"  :subid("186_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx695_tgt
    .local int rx695_pos
    .local int rx695_off
    .local int rx695_eos
    .local int rx695_rep
    .local pmc rx695_cur
    (rx695_cur, rx695_pos, rx695_tgt, $I10) = self."!cursor_start"()
    rx695_cur."!cursor_debug"("START ", "quote_escape:sym<$>")
    .lex unicode:"$\x{a2}", rx695_cur
    .local pmc match
    .lex "$/", match
    length rx695_eos, rx695_tgt
    set rx695_off, 0
    lt $I10, 2, rx695_start
    sub rx695_off, $I10, 1
    substr rx695_tgt, rx695_tgt, rx695_off
  rx695_start:
.annotate "line", 351
  # rx enumcharlist negate=0 zerowidth
    ge rx695_pos, rx695_eos, rx695_fail
    sub $I10, rx695_pos, rx695_off
    substr $S10, rx695_tgt, $I10, 1
    index $I11, "$", $S10
    lt $I11, 0, rx695_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx695_cur."!cursor_pos"(rx695_pos)
    $P10 = rx695_cur."quotemod_check"("s")
    unless $P10, rx695_fail
  # rx subrule "variable" subtype=capture negate=
    rx695_cur."!cursor_pos"(rx695_pos)
    $P10 = rx695_cur."variable"()
    unless $P10, rx695_fail
    rx695_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx695_pos = $P10."pos"()
  # rx pass
    rx695_cur."!cursor_pass"(rx695_pos, "quote_escape:sym<$>")
    rx695_cur."!cursor_debug"("PASS  ", "quote_escape:sym<$>", " at pos=", rx695_pos)
    .return (rx695_cur)
  rx695_fail:
.annotate "line", 4
    (rx695_rep, rx695_pos, $I10, $P10) = rx695_cur."!mark_fail"(0)
    lt rx695_pos, -1, rx695_done
    eq rx695_pos, -1, rx695_fail
    jump $I10
  rx695_done:
    rx695_cur."!cursor_fail"()
    rx695_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<$>")
    .return (rx695_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<$>"  :subid("187_1258264446.59978") :method
.annotate "line", 4
    new $P697, "ResizablePMCArray"
    push $P697, "$"
    .return ($P697)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<{ }>"  :subid("188_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx699_tgt
    .local int rx699_pos
    .local int rx699_off
    .local int rx699_eos
    .local int rx699_rep
    .local pmc rx699_cur
    (rx699_cur, rx699_pos, rx699_tgt, $I10) = self."!cursor_start"()
    rx699_cur."!cursor_debug"("START ", "quote_escape:sym<{ }>")
    .lex unicode:"$\x{a2}", rx699_cur
    .local pmc match
    .lex "$/", match
    length rx699_eos, rx699_tgt
    set rx699_off, 0
    lt $I10, 2, rx699_start
    sub rx699_off, $I10, 1
    substr rx699_tgt, rx699_tgt, rx699_off
  rx699_start:
.annotate "line", 352
  # rx enumcharlist negate=0 zerowidth
    ge rx699_pos, rx699_eos, rx699_fail
    sub $I10, rx699_pos, rx699_off
    substr $S10, rx699_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx699_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx699_cur."!cursor_pos"(rx699_pos)
    $P10 = rx699_cur."quotemod_check"("c")
    unless $P10, rx699_fail
  # rx subrule "block" subtype=capture negate=
    rx699_cur."!cursor_pos"(rx699_pos)
    $P10 = rx699_cur."block"()
    unless $P10, rx699_fail
    rx699_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx699_pos = $P10."pos"()
  # rx pass
    rx699_cur."!cursor_pass"(rx699_pos, "quote_escape:sym<{ }>")
    rx699_cur."!cursor_debug"("PASS  ", "quote_escape:sym<{ }>", " at pos=", rx699_pos)
    .return (rx699_cur)
  rx699_fail:
.annotate "line", 4
    (rx699_rep, rx699_pos, $I10, $P10) = rx699_cur."!mark_fail"(0)
    lt rx699_pos, -1, rx699_done
    eq rx699_pos, -1, rx699_fail
    jump $I10
  rx699_done:
    rx699_cur."!cursor_fail"()
    rx699_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<{ }>")
    .return (rx699_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<{ }>"  :subid("189_1258264446.59978") :method
.annotate "line", 4
    new $P701, "ResizablePMCArray"
    push $P701, "{"
    .return ($P701)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<( )>"  :subid("190_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx703_tgt
    .local int rx703_pos
    .local int rx703_off
    .local int rx703_eos
    .local int rx703_rep
    .local pmc rx703_cur
    (rx703_cur, rx703_pos, rx703_tgt, $I10) = self."!cursor_start"()
    rx703_cur."!cursor_debug"("START ", "circumfix:sym<( )>")
    rx703_cur."!cursor_caparray"("EXPR")
    .lex unicode:"$\x{a2}", rx703_cur
    .local pmc match
    .lex "$/", match
    length rx703_eos, rx703_tgt
    set rx703_off, 0
    lt $I10, 2, rx703_start
    sub rx703_off, $I10, 1
    substr rx703_tgt, rx703_tgt, rx703_off
  rx703_start:
.annotate "line", 354
  # rx literal  "("
    add $I11, rx703_pos, 1
    gt $I11, rx703_eos, rx703_fail
    sub $I11, rx703_pos, rx703_off
    substr $S10, rx703_tgt, $I11, 1
    ne $S10, "(", rx703_fail
    add rx703_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx703_cur."!cursor_pos"(rx703_pos)
    $P10 = rx703_cur."ws"()
    unless $P10, rx703_fail
    rx703_pos = $P10."pos"()
  # rx rxquantr707 ** 0..1
    set_addr $I708, rxquantr707_done
    rx703_cur."!mark_push"(0, rx703_pos, $I708)
  rxquantr707_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx703_cur."!cursor_pos"(rx703_pos)
    $P10 = rx703_cur."EXPR"()
    unless $P10, rx703_fail
    rx703_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx703_pos = $P10."pos"()
    (rx703_rep) = rx703_cur."!mark_commit"($I708)
  rxquantr707_done:
  # rx literal  ")"
    add $I11, rx703_pos, 1
    gt $I11, rx703_eos, rx703_fail
    sub $I11, rx703_pos, rx703_off
    substr $S10, rx703_tgt, $I11, 1
    ne $S10, ")", rx703_fail
    add rx703_pos, 1
  # rx pass
    rx703_cur."!cursor_pass"(rx703_pos, "circumfix:sym<( )>")
    rx703_cur."!cursor_debug"("PASS  ", "circumfix:sym<( )>", " at pos=", rx703_pos)
    .return (rx703_cur)
  rx703_fail:
.annotate "line", 4
    (rx703_rep, rx703_pos, $I10, $P10) = rx703_cur."!mark_fail"(0)
    lt rx703_pos, -1, rx703_done
    eq rx703_pos, -1, rx703_fail
    jump $I10
  rx703_done:
    rx703_cur."!cursor_fail"()
    rx703_cur."!cursor_debug"("FAIL  ", "circumfix:sym<( )>")
    .return (rx703_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<( )>"  :subid("191_1258264446.59978") :method
.annotate "line", 4
    $P705 = self."!PREFIX__!subrule"("", "(")
    new $P706, "ResizablePMCArray"
    push $P706, $P705
    .return ($P706)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<[ ]>"  :subid("192_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx710_tgt
    .local int rx710_pos
    .local int rx710_off
    .local int rx710_eos
    .local int rx710_rep
    .local pmc rx710_cur
    (rx710_cur, rx710_pos, rx710_tgt, $I10) = self."!cursor_start"()
    rx710_cur."!cursor_debug"("START ", "circumfix:sym<[ ]>")
    rx710_cur."!cursor_caparray"("EXPR")
    .lex unicode:"$\x{a2}", rx710_cur
    .local pmc match
    .lex "$/", match
    length rx710_eos, rx710_tgt
    set rx710_off, 0
    lt $I10, 2, rx710_start
    sub rx710_off, $I10, 1
    substr rx710_tgt, rx710_tgt, rx710_off
  rx710_start:
.annotate "line", 355
  # rx literal  "["
    add $I11, rx710_pos, 1
    gt $I11, rx710_eos, rx710_fail
    sub $I11, rx710_pos, rx710_off
    substr $S10, rx710_tgt, $I11, 1
    ne $S10, "[", rx710_fail
    add rx710_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx710_cur."!cursor_pos"(rx710_pos)
    $P10 = rx710_cur."ws"()
    unless $P10, rx710_fail
    rx710_pos = $P10."pos"()
  # rx rxquantr714 ** 0..1
    set_addr $I715, rxquantr714_done
    rx710_cur."!mark_push"(0, rx710_pos, $I715)
  rxquantr714_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx710_cur."!cursor_pos"(rx710_pos)
    $P10 = rx710_cur."EXPR"()
    unless $P10, rx710_fail
    rx710_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx710_pos = $P10."pos"()
    (rx710_rep) = rx710_cur."!mark_commit"($I715)
  rxquantr714_done:
  # rx literal  "]"
    add $I11, rx710_pos, 1
    gt $I11, rx710_eos, rx710_fail
    sub $I11, rx710_pos, rx710_off
    substr $S10, rx710_tgt, $I11, 1
    ne $S10, "]", rx710_fail
    add rx710_pos, 1
  # rx pass
    rx710_cur."!cursor_pass"(rx710_pos, "circumfix:sym<[ ]>")
    rx710_cur."!cursor_debug"("PASS  ", "circumfix:sym<[ ]>", " at pos=", rx710_pos)
    .return (rx710_cur)
  rx710_fail:
.annotate "line", 4
    (rx710_rep, rx710_pos, $I10, $P10) = rx710_cur."!mark_fail"(0)
    lt rx710_pos, -1, rx710_done
    eq rx710_pos, -1, rx710_fail
    jump $I10
  rx710_done:
    rx710_cur."!cursor_fail"()
    rx710_cur."!cursor_debug"("FAIL  ", "circumfix:sym<[ ]>")
    .return (rx710_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<[ ]>"  :subid("193_1258264446.59978") :method
.annotate "line", 4
    $P712 = self."!PREFIX__!subrule"("", "[")
    new $P713, "ResizablePMCArray"
    push $P713, $P712
    .return ($P713)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<ang>"  :subid("194_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx717_tgt
    .local int rx717_pos
    .local int rx717_off
    .local int rx717_eos
    .local int rx717_rep
    .local pmc rx717_cur
    (rx717_cur, rx717_pos, rx717_tgt, $I10) = self."!cursor_start"()
    rx717_cur."!cursor_debug"("START ", "circumfix:sym<ang>")
    .lex unicode:"$\x{a2}", rx717_cur
    .local pmc match
    .lex "$/", match
    length rx717_eos, rx717_tgt
    set rx717_off, 0
    lt $I10, 2, rx717_start
    sub rx717_off, $I10, 1
    substr rx717_tgt, rx717_tgt, rx717_off
  rx717_start:
.annotate "line", 356
  # rx enumcharlist negate=0 zerowidth
    ge rx717_pos, rx717_eos, rx717_fail
    sub $I10, rx717_pos, rx717_off
    substr $S10, rx717_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx717_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx717_cur."!cursor_pos"(rx717_pos)
    $P10 = rx717_cur."quote_EXPR"(":q", ":w")
    unless $P10, rx717_fail
    rx717_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx717_pos = $P10."pos"()
  # rx pass
    rx717_cur."!cursor_pass"(rx717_pos, "circumfix:sym<ang>")
    rx717_cur."!cursor_debug"("PASS  ", "circumfix:sym<ang>", " at pos=", rx717_pos)
    .return (rx717_cur)
  rx717_fail:
.annotate "line", 4
    (rx717_rep, rx717_pos, $I10, $P10) = rx717_cur."!mark_fail"(0)
    lt rx717_pos, -1, rx717_done
    eq rx717_pos, -1, rx717_fail
    jump $I10
  rx717_done:
    rx717_cur."!cursor_fail"()
    rx717_cur."!cursor_debug"("FAIL  ", "circumfix:sym<ang>")
    .return (rx717_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<ang>"  :subid("195_1258264446.59978") :method
.annotate "line", 4
    new $P719, "ResizablePMCArray"
    push $P719, "<"
    .return ($P719)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<{ }>"  :subid("196_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx721_tgt
    .local int rx721_pos
    .local int rx721_off
    .local int rx721_eos
    .local int rx721_rep
    .local pmc rx721_cur
    (rx721_cur, rx721_pos, rx721_tgt, $I10) = self."!cursor_start"()
    rx721_cur."!cursor_debug"("START ", "circumfix:sym<{ }>")
    .lex unicode:"$\x{a2}", rx721_cur
    .local pmc match
    .lex "$/", match
    length rx721_eos, rx721_tgt
    set rx721_off, 0
    lt $I10, 2, rx721_start
    sub rx721_off, $I10, 1
    substr rx721_tgt, rx721_tgt, rx721_off
  rx721_start:
.annotate "line", 357
  # rx enumcharlist negate=0 zerowidth
    ge rx721_pos, rx721_eos, rx721_fail
    sub $I10, rx721_pos, rx721_off
    substr $S10, rx721_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx721_fail
  # rx subrule "pblock" subtype=capture negate=
    rx721_cur."!cursor_pos"(rx721_pos)
    $P10 = rx721_cur."pblock"()
    unless $P10, rx721_fail
    rx721_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx721_pos = $P10."pos"()
  # rx pass
    rx721_cur."!cursor_pass"(rx721_pos, "circumfix:sym<{ }>")
    rx721_cur."!cursor_debug"("PASS  ", "circumfix:sym<{ }>", " at pos=", rx721_pos)
    .return (rx721_cur)
  rx721_fail:
.annotate "line", 4
    (rx721_rep, rx721_pos, $I10, $P10) = rx721_cur."!mark_fail"(0)
    lt rx721_pos, -1, rx721_done
    eq rx721_pos, -1, rx721_fail
    jump $I10
  rx721_done:
    rx721_cur."!cursor_fail"()
    rx721_cur."!cursor_debug"("FAIL  ", "circumfix:sym<{ }>")
    .return (rx721_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<{ }>"  :subid("197_1258264446.59978") :method
.annotate "line", 4
    new $P723, "ResizablePMCArray"
    push $P723, "{"
    .return ($P723)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<sigil>"  :subid("198_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx725_tgt
    .local int rx725_pos
    .local int rx725_off
    .local int rx725_eos
    .local int rx725_rep
    .local pmc rx725_cur
    (rx725_cur, rx725_pos, rx725_tgt, $I10) = self."!cursor_start"()
    rx725_cur."!cursor_debug"("START ", "circumfix:sym<sigil>")
    .lex unicode:"$\x{a2}", rx725_cur
    .local pmc match
    .lex "$/", match
    length rx725_eos, rx725_tgt
    set rx725_off, 0
    lt $I10, 2, rx725_start
    sub rx725_off, $I10, 1
    substr rx725_tgt, rx725_tgt, rx725_off
  rx725_start:
.annotate "line", 358
  # rx subrule "sigil" subtype=capture negate=
    rx725_cur."!cursor_pos"(rx725_pos)
    $P10 = rx725_cur."sigil"()
    unless $P10, rx725_fail
    rx725_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx725_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx725_pos, 1
    gt $I11, rx725_eos, rx725_fail
    sub $I11, rx725_pos, rx725_off
    substr $S10, rx725_tgt, $I11, 1
    ne $S10, "(", rx725_fail
    add rx725_pos, 1
  # rx subrule "semilist" subtype=capture negate=
    rx725_cur."!cursor_pos"(rx725_pos)
    $P10 = rx725_cur."semilist"()
    unless $P10, rx725_fail
    rx725_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("semilist")
    rx725_pos = $P10."pos"()
  alt729_0:
    set_addr $I10, alt729_1
    rx725_cur."!mark_push"(0, rx725_pos, $I10)
  # rx literal  ")"
    add $I11, rx725_pos, 1
    gt $I11, rx725_eos, rx725_fail
    sub $I11, rx725_pos, rx725_off
    substr $S10, rx725_tgt, $I11, 1
    ne $S10, ")", rx725_fail
    add rx725_pos, 1
    goto alt729_end
  alt729_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx725_cur."!cursor_pos"(rx725_pos)
    $P10 = rx725_cur."FAILGOAL"("')'")
    unless $P10, rx725_fail
    rx725_pos = $P10."pos"()
  alt729_end:
  # rx pass
    rx725_cur."!cursor_pass"(rx725_pos, "circumfix:sym<sigil>")
    rx725_cur."!cursor_debug"("PASS  ", "circumfix:sym<sigil>", " at pos=", rx725_pos)
    .return (rx725_cur)
  rx725_fail:
.annotate "line", 4
    (rx725_rep, rx725_pos, $I10, $P10) = rx725_cur."!mark_fail"(0)
    lt rx725_pos, -1, rx725_done
    eq rx725_pos, -1, rx725_fail
    jump $I10
  rx725_done:
    rx725_cur."!cursor_fail"()
    rx725_cur."!cursor_debug"("FAIL  ", "circumfix:sym<sigil>")
    .return (rx725_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<sigil>"  :subid("199_1258264446.59978") :method
.annotate "line", 4
    $P727 = self."!PREFIX__!subrule"("sigil", "")
    new $P728, "ResizablePMCArray"
    push $P728, $P727
    .return ($P728)
.end


.namespace ["NQP";"Grammar"]
.sub "semilist"  :subid("200_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 4
    .local string rx732_tgt
    .local int rx732_pos
    .local int rx732_off
    .local int rx732_eos
    .local int rx732_rep
    .local pmc rx732_cur
    (rx732_cur, rx732_pos, rx732_tgt, $I10) = self."!cursor_start"()
    rx732_cur."!cursor_debug"("START ", "semilist")
    .lex unicode:"$\x{a2}", rx732_cur
    .local pmc match
    .lex "$/", match
    length rx732_eos, rx732_tgt
    set rx732_off, 0
    lt $I10, 2, rx732_start
    sub rx732_off, $I10, 1
    substr rx732_tgt, rx732_tgt, rx732_off
  rx732_start:
.annotate "line", 360
  # rx subrule "ws" subtype=method negate=
    rx732_cur."!cursor_pos"(rx732_pos)
    $P10 = rx732_cur."ws"()
    unless $P10, rx732_fail
    rx732_pos = $P10."pos"()
  # rx subrule "statement" subtype=capture negate=
    rx732_cur."!cursor_pos"(rx732_pos)
    $P10 = rx732_cur."statement"()
    unless $P10, rx732_fail
    rx732_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx732_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx732_cur."!cursor_pos"(rx732_pos)
    $P10 = rx732_cur."ws"()
    unless $P10, rx732_fail
    rx732_pos = $P10."pos"()
  # rx pass
    rx732_cur."!cursor_pass"(rx732_pos, "semilist")
    rx732_cur."!cursor_debug"("PASS  ", "semilist", " at pos=", rx732_pos)
    .return (rx732_cur)
  rx732_fail:
.annotate "line", 4
    (rx732_rep, rx732_pos, $I10, $P10) = rx732_cur."!mark_fail"(0)
    lt rx732_pos, -1, rx732_done
    eq rx732_pos, -1, rx732_fail
    jump $I10
  rx732_done:
    rx732_cur."!cursor_fail"()
    rx732_cur."!cursor_debug"("FAIL  ", "semilist")
    .return (rx732_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__semilist"  :subid("201_1258264446.59978") :method
.annotate "line", 4
    new $P734, "ResizablePMCArray"
    push $P734, ""
    .return ($P734)
.end


.namespace ["NQP";"Grammar"]
.sub "nulltermish"  :subid("202_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx738_tgt
    .local int rx738_pos
    .local int rx738_off
    .local int rx738_eos
    .local int rx738_rep
    .local pmc rx738_cur
    (rx738_cur, rx738_pos, rx738_tgt, $I10) = self."!cursor_start"()
    rx738_cur."!cursor_debug"("START ", "nulltermish")
    .lex unicode:"$\x{a2}", rx738_cur
    .local pmc match
    .lex "$/", match
    length rx738_eos, rx738_tgt
    set rx738_off, 0
    lt $I10, 2, rx738_start
    sub rx738_off, $I10, 1
    substr rx738_tgt, rx738_tgt, rx738_off
  rx738_start:
  alt742_0:
.annotate "line", 383
    set_addr $I10, alt742_1
    rx738_cur."!mark_push"(0, rx738_pos, $I10)
.annotate "line", 384
  # rx subrule "termish" subtype=capture negate=
    rx738_cur."!cursor_pos"(rx738_pos)
    $P10 = rx738_cur."termish"()
    unless $P10, rx738_fail
    rx738_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=term")
    rx738_pos = $P10."pos"()
    goto alt742_end
  alt742_1:
  alt742_end:
.annotate "line", 383
  # rx pass
    rx738_cur."!cursor_pass"(rx738_pos, "nulltermish")
    rx738_cur."!cursor_debug"("PASS  ", "nulltermish", " at pos=", rx738_pos)
    .return (rx738_cur)
  rx738_fail:
.annotate "line", 364
    (rx738_rep, rx738_pos, $I10, $P10) = rx738_cur."!mark_fail"(0)
    lt rx738_pos, -1, rx738_done
    eq rx738_pos, -1, rx738_fail
    jump $I10
  rx738_done:
    rx738_cur."!cursor_fail"()
    rx738_cur."!cursor_debug"("FAIL  ", "nulltermish")
    .return (rx738_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__nulltermish"  :subid("203_1258264446.59978") :method
.annotate "line", 364
    $P740 = self."!PREFIX__!subrule"("OPER=term", "")
    new $P741, "ResizablePMCArray"
    push $P741, ""
    push $P741, $P740
    .return ($P741)
.end


.namespace ["NQP";"Grammar"]
.sub "infixish"  :subid("204_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx744_tgt
    .local int rx744_pos
    .local int rx744_off
    .local int rx744_eos
    .local int rx744_rep
    .local pmc rx744_cur
    (rx744_cur, rx744_pos, rx744_tgt, $I10) = self."!cursor_start"()
    rx744_cur."!cursor_debug"("START ", "infixish")
    .lex unicode:"$\x{a2}", rx744_cur
    .local pmc match
    .lex "$/", match
    length rx744_eos, rx744_tgt
    set rx744_off, 0
    lt $I10, 2, rx744_start
    sub rx744_off, $I10, 1
    substr rx744_tgt, rx744_tgt, rx744_off
  rx744_start:
.annotate "line", 388
  # rx subrule "infixstopper" subtype=zerowidth negate=1
    rx744_cur."!cursor_pos"(rx744_pos)
    $P10 = rx744_cur."infixstopper"()
    if $P10, rx744_fail
  # rx subrule "infix" subtype=capture negate=
    rx744_cur."!cursor_pos"(rx744_pos)
    $P10 = rx744_cur."infix"()
    unless $P10, rx744_fail
    rx744_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=infix")
    rx744_pos = $P10."pos"()
  # rx pass
    rx744_cur."!cursor_pass"(rx744_pos, "infixish")
    rx744_cur."!cursor_debug"("PASS  ", "infixish", " at pos=", rx744_pos)
    .return (rx744_cur)
  rx744_fail:
.annotate "line", 364
    (rx744_rep, rx744_pos, $I10, $P10) = rx744_cur."!mark_fail"(0)
    lt rx744_pos, -1, rx744_done
    eq rx744_pos, -1, rx744_fail
    jump $I10
  rx744_done:
    rx744_cur."!cursor_fail"()
    rx744_cur."!cursor_debug"("FAIL  ", "infixish")
    .return (rx744_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixish"  :subid("205_1258264446.59978") :method
.annotate "line", 364
    new $P746, "ResizablePMCArray"
    push $P746, ""
    .return ($P746)
.end


.namespace ["NQP";"Grammar"]
.sub "infixstopper"  :subid("206_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx748_tgt
    .local int rx748_pos
    .local int rx748_off
    .local int rx748_eos
    .local int rx748_rep
    .local pmc rx748_cur
    (rx748_cur, rx748_pos, rx748_tgt, $I10) = self."!cursor_start"()
    rx748_cur."!cursor_debug"("START ", "infixstopper")
    .lex unicode:"$\x{a2}", rx748_cur
    .local pmc match
    .lex "$/", match
    length rx748_eos, rx748_tgt
    set rx748_off, 0
    lt $I10, 2, rx748_start
    sub rx748_off, $I10, 1
    substr rx748_tgt, rx748_tgt, rx748_off
  rx748_start:
.annotate "line", 389
  # rx subrule "lambda" subtype=zerowidth negate=
    rx748_cur."!cursor_pos"(rx748_pos)
    $P10 = rx748_cur."lambda"()
    unless $P10, rx748_fail
  # rx pass
    rx748_cur."!cursor_pass"(rx748_pos, "infixstopper")
    rx748_cur."!cursor_debug"("PASS  ", "infixstopper", " at pos=", rx748_pos)
    .return (rx748_cur)
  rx748_fail:
.annotate "line", 364
    (rx748_rep, rx748_pos, $I10, $P10) = rx748_cur."!mark_fail"(0)
    lt rx748_pos, -1, rx748_done
    eq rx748_pos, -1, rx748_fail
    jump $I10
  rx748_done:
    rx748_cur."!cursor_fail"()
    rx748_cur."!cursor_debug"("FAIL  ", "infixstopper")
    .return (rx748_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixstopper"  :subid("207_1258264446.59978") :method
.annotate "line", 364
    new $P750, "ResizablePMCArray"
    push $P750, ""
    .return ($P750)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<[ ]>"  :subid("208_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx752_tgt
    .local int rx752_pos
    .local int rx752_off
    .local int rx752_eos
    .local int rx752_rep
    .local pmc rx752_cur
    (rx752_cur, rx752_pos, rx752_tgt, $I10) = self."!cursor_start"()
    rx752_cur."!cursor_debug"("START ", "postcircumfix:sym<[ ]>")
    .lex unicode:"$\x{a2}", rx752_cur
    .local pmc match
    .lex "$/", match
    length rx752_eos, rx752_tgt
    set rx752_off, 0
    lt $I10, 2, rx752_start
    sub rx752_off, $I10, 1
    substr rx752_tgt, rx752_tgt, rx752_off
  rx752_start:
.annotate "line", 392
  # rx literal  "["
    add $I11, rx752_pos, 1
    gt $I11, rx752_eos, rx752_fail
    sub $I11, rx752_pos, rx752_off
    substr $S10, rx752_tgt, $I11, 1
    ne $S10, "[", rx752_fail
    add rx752_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx752_cur."!cursor_pos"(rx752_pos)
    $P10 = rx752_cur."ws"()
    unless $P10, rx752_fail
    rx752_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx752_cur."!cursor_pos"(rx752_pos)
    $P10 = rx752_cur."EXPR"()
    unless $P10, rx752_fail
    rx752_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx752_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx752_pos, 1
    gt $I11, rx752_eos, rx752_fail
    sub $I11, rx752_pos, rx752_off
    substr $S10, rx752_tgt, $I11, 1
    ne $S10, "]", rx752_fail
    add rx752_pos, 1
.annotate "line", 393
  # rx subrule "O" subtype=capture negate=
    rx752_cur."!cursor_pos"(rx752_pos)
    $P10 = rx752_cur."O"("%methodop")
    unless $P10, rx752_fail
    rx752_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx752_pos = $P10."pos"()
.annotate "line", 391
  # rx pass
    rx752_cur."!cursor_pass"(rx752_pos, "postcircumfix:sym<[ ]>")
    rx752_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<[ ]>", " at pos=", rx752_pos)
    .return (rx752_cur)
  rx752_fail:
.annotate "line", 364
    (rx752_rep, rx752_pos, $I10, $P10) = rx752_cur."!mark_fail"(0)
    lt rx752_pos, -1, rx752_done
    eq rx752_pos, -1, rx752_fail
    jump $I10
  rx752_done:
    rx752_cur."!cursor_fail"()
    rx752_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<[ ]>")
    .return (rx752_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<[ ]>"  :subid("209_1258264446.59978") :method
.annotate "line", 364
    $P754 = self."!PREFIX__!subrule"("", "[")
    new $P755, "ResizablePMCArray"
    push $P755, $P754
    .return ($P755)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<{ }>"  :subid("210_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx757_tgt
    .local int rx757_pos
    .local int rx757_off
    .local int rx757_eos
    .local int rx757_rep
    .local pmc rx757_cur
    (rx757_cur, rx757_pos, rx757_tgt, $I10) = self."!cursor_start"()
    rx757_cur."!cursor_debug"("START ", "postcircumfix:sym<{ }>")
    .lex unicode:"$\x{a2}", rx757_cur
    .local pmc match
    .lex "$/", match
    length rx757_eos, rx757_tgt
    set rx757_off, 0
    lt $I10, 2, rx757_start
    sub rx757_off, $I10, 1
    substr rx757_tgt, rx757_tgt, rx757_off
  rx757_start:
.annotate "line", 397
  # rx literal  "{"
    add $I11, rx757_pos, 1
    gt $I11, rx757_eos, rx757_fail
    sub $I11, rx757_pos, rx757_off
    substr $S10, rx757_tgt, $I11, 1
    ne $S10, "{", rx757_fail
    add rx757_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx757_cur."!cursor_pos"(rx757_pos)
    $P10 = rx757_cur."ws"()
    unless $P10, rx757_fail
    rx757_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx757_cur."!cursor_pos"(rx757_pos)
    $P10 = rx757_cur."EXPR"()
    unless $P10, rx757_fail
    rx757_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx757_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx757_pos, 1
    gt $I11, rx757_eos, rx757_fail
    sub $I11, rx757_pos, rx757_off
    substr $S10, rx757_tgt, $I11, 1
    ne $S10, "}", rx757_fail
    add rx757_pos, 1
.annotate "line", 398
  # rx subrule "O" subtype=capture negate=
    rx757_cur."!cursor_pos"(rx757_pos)
    $P10 = rx757_cur."O"("%methodop")
    unless $P10, rx757_fail
    rx757_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx757_pos = $P10."pos"()
.annotate "line", 396
  # rx pass
    rx757_cur."!cursor_pass"(rx757_pos, "postcircumfix:sym<{ }>")
    rx757_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<{ }>", " at pos=", rx757_pos)
    .return (rx757_cur)
  rx757_fail:
.annotate "line", 364
    (rx757_rep, rx757_pos, $I10, $P10) = rx757_cur."!mark_fail"(0)
    lt rx757_pos, -1, rx757_done
    eq rx757_pos, -1, rx757_fail
    jump $I10
  rx757_done:
    rx757_cur."!cursor_fail"()
    rx757_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<{ }>")
    .return (rx757_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<{ }>"  :subid("211_1258264446.59978") :method
.annotate "line", 364
    $P759 = self."!PREFIX__!subrule"("", "{")
    new $P760, "ResizablePMCArray"
    push $P760, $P759
    .return ($P760)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<ang>"  :subid("212_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx762_tgt
    .local int rx762_pos
    .local int rx762_off
    .local int rx762_eos
    .local int rx762_rep
    .local pmc rx762_cur
    (rx762_cur, rx762_pos, rx762_tgt, $I10) = self."!cursor_start"()
    rx762_cur."!cursor_debug"("START ", "postcircumfix:sym<ang>")
    .lex unicode:"$\x{a2}", rx762_cur
    .local pmc match
    .lex "$/", match
    length rx762_eos, rx762_tgt
    set rx762_off, 0
    lt $I10, 2, rx762_start
    sub rx762_off, $I10, 1
    substr rx762_tgt, rx762_tgt, rx762_off
  rx762_start:
.annotate "line", 402
  # rx enumcharlist negate=0 zerowidth
    ge rx762_pos, rx762_eos, rx762_fail
    sub $I10, rx762_pos, rx762_off
    substr $S10, rx762_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx762_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx762_cur."!cursor_pos"(rx762_pos)
    $P10 = rx762_cur."quote_EXPR"(":q")
    unless $P10, rx762_fail
    rx762_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx762_pos = $P10."pos"()
.annotate "line", 403
  # rx subrule "O" subtype=capture negate=
    rx762_cur."!cursor_pos"(rx762_pos)
    $P10 = rx762_cur."O"("%methodop")
    unless $P10, rx762_fail
    rx762_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx762_pos = $P10."pos"()
.annotate "line", 401
  # rx pass
    rx762_cur."!cursor_pass"(rx762_pos, "postcircumfix:sym<ang>")
    rx762_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<ang>", " at pos=", rx762_pos)
    .return (rx762_cur)
  rx762_fail:
.annotate "line", 364
    (rx762_rep, rx762_pos, $I10, $P10) = rx762_cur."!mark_fail"(0)
    lt rx762_pos, -1, rx762_done
    eq rx762_pos, -1, rx762_fail
    jump $I10
  rx762_done:
    rx762_cur."!cursor_fail"()
    rx762_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<ang>")
    .return (rx762_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<ang>"  :subid("213_1258264446.59978") :method
.annotate "line", 364
    new $P764, "ResizablePMCArray"
    push $P764, "<"
    .return ($P764)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<( )>"  :subid("214_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx766_tgt
    .local int rx766_pos
    .local int rx766_off
    .local int rx766_eos
    .local int rx766_rep
    .local pmc rx766_cur
    (rx766_cur, rx766_pos, rx766_tgt, $I10) = self."!cursor_start"()
    rx766_cur."!cursor_debug"("START ", "postcircumfix:sym<( )>")
    .lex unicode:"$\x{a2}", rx766_cur
    .local pmc match
    .lex "$/", match
    length rx766_eos, rx766_tgt
    set rx766_off, 0
    lt $I10, 2, rx766_start
    sub rx766_off, $I10, 1
    substr rx766_tgt, rx766_tgt, rx766_off
  rx766_start:
.annotate "line", 407
  # rx literal  "("
    add $I11, rx766_pos, 1
    gt $I11, rx766_eos, rx766_fail
    sub $I11, rx766_pos, rx766_off
    substr $S10, rx766_tgt, $I11, 1
    ne $S10, "(", rx766_fail
    add rx766_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."ws"()
    unless $P10, rx766_fail
    rx766_pos = $P10."pos"()
  # rx subrule "arglist" subtype=capture negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."arglist"()
    unless $P10, rx766_fail
    rx766_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx766_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx766_pos, 1
    gt $I11, rx766_eos, rx766_fail
    sub $I11, rx766_pos, rx766_off
    substr $S10, rx766_tgt, $I11, 1
    ne $S10, ")", rx766_fail
    add rx766_pos, 1
.annotate "line", 408
  # rx subrule "O" subtype=capture negate=
    rx766_cur."!cursor_pos"(rx766_pos)
    $P10 = rx766_cur."O"("%methodop")
    unless $P10, rx766_fail
    rx766_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx766_pos = $P10."pos"()
.annotate "line", 406
  # rx pass
    rx766_cur."!cursor_pass"(rx766_pos, "postcircumfix:sym<( )>")
    rx766_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<( )>", " at pos=", rx766_pos)
    .return (rx766_cur)
  rx766_fail:
.annotate "line", 364
    (rx766_rep, rx766_pos, $I10, $P10) = rx766_cur."!mark_fail"(0)
    lt rx766_pos, -1, rx766_done
    eq rx766_pos, -1, rx766_fail
    jump $I10
  rx766_done:
    rx766_cur."!cursor_fail"()
    rx766_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<( )>")
    .return (rx766_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<( )>"  :subid("215_1258264446.59978") :method
.annotate "line", 364
    $P768 = self."!PREFIX__!subrule"("", "(")
    new $P769, "ResizablePMCArray"
    push $P769, $P768
    .return ($P769)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<.>"  :subid("216_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx771_tgt
    .local int rx771_pos
    .local int rx771_off
    .local int rx771_eos
    .local int rx771_rep
    .local pmc rx771_cur
    (rx771_cur, rx771_pos, rx771_tgt, $I10) = self."!cursor_start"()
    rx771_cur."!cursor_debug"("START ", "postfix:sym<.>")
    .lex unicode:"$\x{a2}", rx771_cur
    .local pmc match
    .lex "$/", match
    length rx771_eos, rx771_tgt
    set rx771_off, 0
    lt $I10, 2, rx771_start
    sub rx771_off, $I10, 1
    substr rx771_tgt, rx771_tgt, rx771_off
  rx771_start:
.annotate "line", 411
  # rx subrule "dotty" subtype=capture negate=
    rx771_cur."!cursor_pos"(rx771_pos)
    $P10 = rx771_cur."dotty"()
    unless $P10, rx771_fail
    rx771_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dotty")
    rx771_pos = $P10."pos"()
  # rx subrule "O" subtype=capture negate=
    rx771_cur."!cursor_pos"(rx771_pos)
    $P10 = rx771_cur."O"("%methodop")
    unless $P10, rx771_fail
    rx771_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx771_pos = $P10."pos"()
  # rx pass
    rx771_cur."!cursor_pass"(rx771_pos, "postfix:sym<.>")
    rx771_cur."!cursor_debug"("PASS  ", "postfix:sym<.>", " at pos=", rx771_pos)
    .return (rx771_cur)
  rx771_fail:
.annotate "line", 364
    (rx771_rep, rx771_pos, $I10, $P10) = rx771_cur."!mark_fail"(0)
    lt rx771_pos, -1, rx771_done
    eq rx771_pos, -1, rx771_fail
    jump $I10
  rx771_done:
    rx771_cur."!cursor_fail"()
    rx771_cur."!cursor_debug"("FAIL  ", "postfix:sym<.>")
    .return (rx771_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<.>"  :subid("217_1258264446.59978") :method
.annotate "line", 364
    $P773 = self."!PREFIX__!subrule"("dotty", "")
    new $P774, "ResizablePMCArray"
    push $P774, $P773
    .return ($P774)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<++>"  :subid("218_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx776_tgt
    .local int rx776_pos
    .local int rx776_off
    .local int rx776_eos
    .local int rx776_rep
    .local pmc rx776_cur
    (rx776_cur, rx776_pos, rx776_tgt, $I10) = self."!cursor_start"()
    rx776_cur."!cursor_debug"("START ", "prefix:sym<++>")
    .lex unicode:"$\x{a2}", rx776_cur
    .local pmc match
    .lex "$/", match
    length rx776_eos, rx776_tgt
    set rx776_off, 0
    lt $I10, 2, rx776_start
    sub rx776_off, $I10, 1
    substr rx776_tgt, rx776_tgt, rx776_off
  rx776_start:
.annotate "line", 413
  # rx subcapture "sym"
    set_addr $I10, rxcap_780_fail
    rx776_cur."!mark_push"(0, rx776_pos, $I10)
  # rx literal  "++"
    add $I11, rx776_pos, 2
    gt $I11, rx776_eos, rx776_fail
    sub $I11, rx776_pos, rx776_off
    substr $S10, rx776_tgt, $I11, 2
    ne $S10, "++", rx776_fail
    add rx776_pos, 2
    set_addr $I10, rxcap_780_fail
    ($I12, $I11) = rx776_cur."!mark_peek"($I10)
    rx776_cur."!cursor_pos"($I11)
    ($P10) = rx776_cur."!cursor_start"()
    $P10."!cursor_pass"(rx776_pos, "")
    rx776_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_780_done
  rxcap_780_fail:
    goto rx776_fail
  rxcap_780_done:
  # rx subrule "O" subtype=capture negate=
    rx776_cur."!cursor_pos"(rx776_pos)
    $P10 = rx776_cur."O"("%autoincrement, :pirop<inc>")
    unless $P10, rx776_fail
    rx776_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx776_pos = $P10."pos"()
  # rx pass
    rx776_cur."!cursor_pass"(rx776_pos, "prefix:sym<++>")
    rx776_cur."!cursor_debug"("PASS  ", "prefix:sym<++>", " at pos=", rx776_pos)
    .return (rx776_cur)
  rx776_fail:
.annotate "line", 364
    (rx776_rep, rx776_pos, $I10, $P10) = rx776_cur."!mark_fail"(0)
    lt rx776_pos, -1, rx776_done
    eq rx776_pos, -1, rx776_fail
    jump $I10
  rx776_done:
    rx776_cur."!cursor_fail"()
    rx776_cur."!cursor_debug"("FAIL  ", "prefix:sym<++>")
    .return (rx776_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<++>"  :subid("219_1258264446.59978") :method
.annotate "line", 364
    $P778 = self."!PREFIX__!subrule"("O", "++")
    new $P779, "ResizablePMCArray"
    push $P779, $P778
    .return ($P779)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<-->"  :subid("220_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx782_tgt
    .local int rx782_pos
    .local int rx782_off
    .local int rx782_eos
    .local int rx782_rep
    .local pmc rx782_cur
    (rx782_cur, rx782_pos, rx782_tgt, $I10) = self."!cursor_start"()
    rx782_cur."!cursor_debug"("START ", "prefix:sym<-->")
    .lex unicode:"$\x{a2}", rx782_cur
    .local pmc match
    .lex "$/", match
    length rx782_eos, rx782_tgt
    set rx782_off, 0
    lt $I10, 2, rx782_start
    sub rx782_off, $I10, 1
    substr rx782_tgt, rx782_tgt, rx782_off
  rx782_start:
.annotate "line", 414
  # rx subcapture "sym"
    set_addr $I10, rxcap_786_fail
    rx782_cur."!mark_push"(0, rx782_pos, $I10)
  # rx literal  "--"
    add $I11, rx782_pos, 2
    gt $I11, rx782_eos, rx782_fail
    sub $I11, rx782_pos, rx782_off
    substr $S10, rx782_tgt, $I11, 2
    ne $S10, "--", rx782_fail
    add rx782_pos, 2
    set_addr $I10, rxcap_786_fail
    ($I12, $I11) = rx782_cur."!mark_peek"($I10)
    rx782_cur."!cursor_pos"($I11)
    ($P10) = rx782_cur."!cursor_start"()
    $P10."!cursor_pass"(rx782_pos, "")
    rx782_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_786_done
  rxcap_786_fail:
    goto rx782_fail
  rxcap_786_done:
  # rx subrule "O" subtype=capture negate=
    rx782_cur."!cursor_pos"(rx782_pos)
    $P10 = rx782_cur."O"("%autoincrement, :pirop<dec>")
    unless $P10, rx782_fail
    rx782_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx782_pos = $P10."pos"()
  # rx pass
    rx782_cur."!cursor_pass"(rx782_pos, "prefix:sym<-->")
    rx782_cur."!cursor_debug"("PASS  ", "prefix:sym<-->", " at pos=", rx782_pos)
    .return (rx782_cur)
  rx782_fail:
.annotate "line", 364
    (rx782_rep, rx782_pos, $I10, $P10) = rx782_cur."!mark_fail"(0)
    lt rx782_pos, -1, rx782_done
    eq rx782_pos, -1, rx782_fail
    jump $I10
  rx782_done:
    rx782_cur."!cursor_fail"()
    rx782_cur."!cursor_debug"("FAIL  ", "prefix:sym<-->")
    .return (rx782_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<-->"  :subid("221_1258264446.59978") :method
.annotate "line", 364
    $P784 = self."!PREFIX__!subrule"("O", "--")
    new $P785, "ResizablePMCArray"
    push $P785, $P784
    .return ($P785)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<++>"  :subid("222_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx788_tgt
    .local int rx788_pos
    .local int rx788_off
    .local int rx788_eos
    .local int rx788_rep
    .local pmc rx788_cur
    (rx788_cur, rx788_pos, rx788_tgt, $I10) = self."!cursor_start"()
    rx788_cur."!cursor_debug"("START ", "postfix:sym<++>")
    .lex unicode:"$\x{a2}", rx788_cur
    .local pmc match
    .lex "$/", match
    length rx788_eos, rx788_tgt
    set rx788_off, 0
    lt $I10, 2, rx788_start
    sub rx788_off, $I10, 1
    substr rx788_tgt, rx788_tgt, rx788_off
  rx788_start:
.annotate "line", 417
  # rx subcapture "sym"
    set_addr $I10, rxcap_792_fail
    rx788_cur."!mark_push"(0, rx788_pos, $I10)
  # rx literal  "++"
    add $I11, rx788_pos, 2
    gt $I11, rx788_eos, rx788_fail
    sub $I11, rx788_pos, rx788_off
    substr $S10, rx788_tgt, $I11, 2
    ne $S10, "++", rx788_fail
    add rx788_pos, 2
    set_addr $I10, rxcap_792_fail
    ($I12, $I11) = rx788_cur."!mark_peek"($I10)
    rx788_cur."!cursor_pos"($I11)
    ($P10) = rx788_cur."!cursor_start"()
    $P10."!cursor_pass"(rx788_pos, "")
    rx788_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_792_done
  rxcap_792_fail:
    goto rx788_fail
  rxcap_792_done:
  # rx subrule "O" subtype=capture negate=
    rx788_cur."!cursor_pos"(rx788_pos)
    $P10 = rx788_cur."O"("%autoincrement")
    unless $P10, rx788_fail
    rx788_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx788_pos = $P10."pos"()
  # rx pass
    rx788_cur."!cursor_pass"(rx788_pos, "postfix:sym<++>")
    rx788_cur."!cursor_debug"("PASS  ", "postfix:sym<++>", " at pos=", rx788_pos)
    .return (rx788_cur)
  rx788_fail:
.annotate "line", 364
    (rx788_rep, rx788_pos, $I10, $P10) = rx788_cur."!mark_fail"(0)
    lt rx788_pos, -1, rx788_done
    eq rx788_pos, -1, rx788_fail
    jump $I10
  rx788_done:
    rx788_cur."!cursor_fail"()
    rx788_cur."!cursor_debug"("FAIL  ", "postfix:sym<++>")
    .return (rx788_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<++>"  :subid("223_1258264446.59978") :method
.annotate "line", 364
    $P790 = self."!PREFIX__!subrule"("O", "++")
    new $P791, "ResizablePMCArray"
    push $P791, $P790
    .return ($P791)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<-->"  :subid("224_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx794_tgt
    .local int rx794_pos
    .local int rx794_off
    .local int rx794_eos
    .local int rx794_rep
    .local pmc rx794_cur
    (rx794_cur, rx794_pos, rx794_tgt, $I10) = self."!cursor_start"()
    rx794_cur."!cursor_debug"("START ", "postfix:sym<-->")
    .lex unicode:"$\x{a2}", rx794_cur
    .local pmc match
    .lex "$/", match
    length rx794_eos, rx794_tgt
    set rx794_off, 0
    lt $I10, 2, rx794_start
    sub rx794_off, $I10, 1
    substr rx794_tgt, rx794_tgt, rx794_off
  rx794_start:
.annotate "line", 418
  # rx subcapture "sym"
    set_addr $I10, rxcap_798_fail
    rx794_cur."!mark_push"(0, rx794_pos, $I10)
  # rx literal  "--"
    add $I11, rx794_pos, 2
    gt $I11, rx794_eos, rx794_fail
    sub $I11, rx794_pos, rx794_off
    substr $S10, rx794_tgt, $I11, 2
    ne $S10, "--", rx794_fail
    add rx794_pos, 2
    set_addr $I10, rxcap_798_fail
    ($I12, $I11) = rx794_cur."!mark_peek"($I10)
    rx794_cur."!cursor_pos"($I11)
    ($P10) = rx794_cur."!cursor_start"()
    $P10."!cursor_pass"(rx794_pos, "")
    rx794_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_798_done
  rxcap_798_fail:
    goto rx794_fail
  rxcap_798_done:
  # rx subrule "O" subtype=capture negate=
    rx794_cur."!cursor_pos"(rx794_pos)
    $P10 = rx794_cur."O"("%autoincrement")
    unless $P10, rx794_fail
    rx794_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx794_pos = $P10."pos"()
  # rx pass
    rx794_cur."!cursor_pass"(rx794_pos, "postfix:sym<-->")
    rx794_cur."!cursor_debug"("PASS  ", "postfix:sym<-->", " at pos=", rx794_pos)
    .return (rx794_cur)
  rx794_fail:
.annotate "line", 364
    (rx794_rep, rx794_pos, $I10, $P10) = rx794_cur."!mark_fail"(0)
    lt rx794_pos, -1, rx794_done
    eq rx794_pos, -1, rx794_fail
    jump $I10
  rx794_done:
    rx794_cur."!cursor_fail"()
    rx794_cur."!cursor_debug"("FAIL  ", "postfix:sym<-->")
    .return (rx794_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<-->"  :subid("225_1258264446.59978") :method
.annotate "line", 364
    $P796 = self."!PREFIX__!subrule"("O", "--")
    new $P797, "ResizablePMCArray"
    push $P797, $P796
    .return ($P797)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<**>"  :subid("226_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx800_tgt
    .local int rx800_pos
    .local int rx800_off
    .local int rx800_eos
    .local int rx800_rep
    .local pmc rx800_cur
    (rx800_cur, rx800_pos, rx800_tgt, $I10) = self."!cursor_start"()
    rx800_cur."!cursor_debug"("START ", "infix:sym<**>")
    .lex unicode:"$\x{a2}", rx800_cur
    .local pmc match
    .lex "$/", match
    length rx800_eos, rx800_tgt
    set rx800_off, 0
    lt $I10, 2, rx800_start
    sub rx800_off, $I10, 1
    substr rx800_tgt, rx800_tgt, rx800_off
  rx800_start:
.annotate "line", 420
  # rx subcapture "sym"
    set_addr $I10, rxcap_804_fail
    rx800_cur."!mark_push"(0, rx800_pos, $I10)
  # rx literal  "**"
    add $I11, rx800_pos, 2
    gt $I11, rx800_eos, rx800_fail
    sub $I11, rx800_pos, rx800_off
    substr $S10, rx800_tgt, $I11, 2
    ne $S10, "**", rx800_fail
    add rx800_pos, 2
    set_addr $I10, rxcap_804_fail
    ($I12, $I11) = rx800_cur."!mark_peek"($I10)
    rx800_cur."!cursor_pos"($I11)
    ($P10) = rx800_cur."!cursor_start"()
    $P10."!cursor_pass"(rx800_pos, "")
    rx800_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_804_done
  rxcap_804_fail:
    goto rx800_fail
  rxcap_804_done:
  # rx subrule "O" subtype=capture negate=
    rx800_cur."!cursor_pos"(rx800_pos)
    $P10 = rx800_cur."O"("%exponentiation, :pirop<pow>")
    unless $P10, rx800_fail
    rx800_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx800_pos = $P10."pos"()
  # rx pass
    rx800_cur."!cursor_pass"(rx800_pos, "infix:sym<**>")
    rx800_cur."!cursor_debug"("PASS  ", "infix:sym<**>", " at pos=", rx800_pos)
    .return (rx800_cur)
  rx800_fail:
.annotate "line", 364
    (rx800_rep, rx800_pos, $I10, $P10) = rx800_cur."!mark_fail"(0)
    lt rx800_pos, -1, rx800_done
    eq rx800_pos, -1, rx800_fail
    jump $I10
  rx800_done:
    rx800_cur."!cursor_fail"()
    rx800_cur."!cursor_debug"("FAIL  ", "infix:sym<**>")
    .return (rx800_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<**>"  :subid("227_1258264446.59978") :method
.annotate "line", 364
    $P802 = self."!PREFIX__!subrule"("O", "**")
    new $P803, "ResizablePMCArray"
    push $P803, $P802
    .return ($P803)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<+>"  :subid("228_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx806_tgt
    .local int rx806_pos
    .local int rx806_off
    .local int rx806_eos
    .local int rx806_rep
    .local pmc rx806_cur
    (rx806_cur, rx806_pos, rx806_tgt, $I10) = self."!cursor_start"()
    rx806_cur."!cursor_debug"("START ", "prefix:sym<+>")
    .lex unicode:"$\x{a2}", rx806_cur
    .local pmc match
    .lex "$/", match
    length rx806_eos, rx806_tgt
    set rx806_off, 0
    lt $I10, 2, rx806_start
    sub rx806_off, $I10, 1
    substr rx806_tgt, rx806_tgt, rx806_off
  rx806_start:
.annotate "line", 422
  # rx subcapture "sym"
    set_addr $I10, rxcap_810_fail
    rx806_cur."!mark_push"(0, rx806_pos, $I10)
  # rx literal  "+"
    add $I11, rx806_pos, 1
    gt $I11, rx806_eos, rx806_fail
    sub $I11, rx806_pos, rx806_off
    substr $S10, rx806_tgt, $I11, 1
    ne $S10, "+", rx806_fail
    add rx806_pos, 1
    set_addr $I10, rxcap_810_fail
    ($I12, $I11) = rx806_cur."!mark_peek"($I10)
    rx806_cur."!cursor_pos"($I11)
    ($P10) = rx806_cur."!cursor_start"()
    $P10."!cursor_pass"(rx806_pos, "")
    rx806_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_810_done
  rxcap_810_fail:
    goto rx806_fail
  rxcap_810_done:
  # rx subrule "O" subtype=capture negate=
    rx806_cur."!cursor_pos"(rx806_pos)
    $P10 = rx806_cur."O"("%symbolic_unary, :pirop<set N*>")
    unless $P10, rx806_fail
    rx806_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx806_pos = $P10."pos"()
  # rx pass
    rx806_cur."!cursor_pass"(rx806_pos, "prefix:sym<+>")
    rx806_cur."!cursor_debug"("PASS  ", "prefix:sym<+>", " at pos=", rx806_pos)
    .return (rx806_cur)
  rx806_fail:
.annotate "line", 364
    (rx806_rep, rx806_pos, $I10, $P10) = rx806_cur."!mark_fail"(0)
    lt rx806_pos, -1, rx806_done
    eq rx806_pos, -1, rx806_fail
    jump $I10
  rx806_done:
    rx806_cur."!cursor_fail"()
    rx806_cur."!cursor_debug"("FAIL  ", "prefix:sym<+>")
    .return (rx806_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<+>"  :subid("229_1258264446.59978") :method
.annotate "line", 364
    $P808 = self."!PREFIX__!subrule"("O", "+")
    new $P809, "ResizablePMCArray"
    push $P809, $P808
    .return ($P809)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<~>"  :subid("230_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx812_tgt
    .local int rx812_pos
    .local int rx812_off
    .local int rx812_eos
    .local int rx812_rep
    .local pmc rx812_cur
    (rx812_cur, rx812_pos, rx812_tgt, $I10) = self."!cursor_start"()
    rx812_cur."!cursor_debug"("START ", "prefix:sym<~>")
    .lex unicode:"$\x{a2}", rx812_cur
    .local pmc match
    .lex "$/", match
    length rx812_eos, rx812_tgt
    set rx812_off, 0
    lt $I10, 2, rx812_start
    sub rx812_off, $I10, 1
    substr rx812_tgt, rx812_tgt, rx812_off
  rx812_start:
.annotate "line", 423
  # rx subcapture "sym"
    set_addr $I10, rxcap_816_fail
    rx812_cur."!mark_push"(0, rx812_pos, $I10)
  # rx literal  "~"
    add $I11, rx812_pos, 1
    gt $I11, rx812_eos, rx812_fail
    sub $I11, rx812_pos, rx812_off
    substr $S10, rx812_tgt, $I11, 1
    ne $S10, "~", rx812_fail
    add rx812_pos, 1
    set_addr $I10, rxcap_816_fail
    ($I12, $I11) = rx812_cur."!mark_peek"($I10)
    rx812_cur."!cursor_pos"($I11)
    ($P10) = rx812_cur."!cursor_start"()
    $P10."!cursor_pass"(rx812_pos, "")
    rx812_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_816_done
  rxcap_816_fail:
    goto rx812_fail
  rxcap_816_done:
  # rx subrule "O" subtype=capture negate=
    rx812_cur."!cursor_pos"(rx812_pos)
    $P10 = rx812_cur."O"("%symbolic_unary, :pirop<set S*>")
    unless $P10, rx812_fail
    rx812_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx812_pos = $P10."pos"()
  # rx pass
    rx812_cur."!cursor_pass"(rx812_pos, "prefix:sym<~>")
    rx812_cur."!cursor_debug"("PASS  ", "prefix:sym<~>", " at pos=", rx812_pos)
    .return (rx812_cur)
  rx812_fail:
.annotate "line", 364
    (rx812_rep, rx812_pos, $I10, $P10) = rx812_cur."!mark_fail"(0)
    lt rx812_pos, -1, rx812_done
    eq rx812_pos, -1, rx812_fail
    jump $I10
  rx812_done:
    rx812_cur."!cursor_fail"()
    rx812_cur."!cursor_debug"("FAIL  ", "prefix:sym<~>")
    .return (rx812_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<~>"  :subid("231_1258264446.59978") :method
.annotate "line", 364
    $P814 = self."!PREFIX__!subrule"("O", "~")
    new $P815, "ResizablePMCArray"
    push $P815, $P814
    .return ($P815)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<->"  :subid("232_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx818_tgt
    .local int rx818_pos
    .local int rx818_off
    .local int rx818_eos
    .local int rx818_rep
    .local pmc rx818_cur
    (rx818_cur, rx818_pos, rx818_tgt, $I10) = self."!cursor_start"()
    rx818_cur."!cursor_debug"("START ", "prefix:sym<->")
    .lex unicode:"$\x{a2}", rx818_cur
    .local pmc match
    .lex "$/", match
    length rx818_eos, rx818_tgt
    set rx818_off, 0
    lt $I10, 2, rx818_start
    sub rx818_off, $I10, 1
    substr rx818_tgt, rx818_tgt, rx818_off
  rx818_start:
.annotate "line", 424
  # rx subcapture "sym"
    set_addr $I10, rxcap_822_fail
    rx818_cur."!mark_push"(0, rx818_pos, $I10)
  # rx literal  "-"
    add $I11, rx818_pos, 1
    gt $I11, rx818_eos, rx818_fail
    sub $I11, rx818_pos, rx818_off
    substr $S10, rx818_tgt, $I11, 1
    ne $S10, "-", rx818_fail
    add rx818_pos, 1
    set_addr $I10, rxcap_822_fail
    ($I12, $I11) = rx818_cur."!mark_peek"($I10)
    rx818_cur."!cursor_pos"($I11)
    ($P10) = rx818_cur."!cursor_start"()
    $P10."!cursor_pass"(rx818_pos, "")
    rx818_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_822_done
  rxcap_822_fail:
    goto rx818_fail
  rxcap_822_done:
  # rx enumcharlist negate=1 zerowidth
    ge rx818_pos, rx818_eos, rx818_fail
    sub $I10, rx818_pos, rx818_off
    substr $S10, rx818_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx818_fail
  # rx subrule "O" subtype=capture negate=
    rx818_cur."!cursor_pos"(rx818_pos)
    $P10 = rx818_cur."O"("%symbolic_unary, :pirop<neg>")
    unless $P10, rx818_fail
    rx818_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx818_pos = $P10."pos"()
  # rx pass
    rx818_cur."!cursor_pass"(rx818_pos, "prefix:sym<->")
    rx818_cur."!cursor_debug"("PASS  ", "prefix:sym<->", " at pos=", rx818_pos)
    .return (rx818_cur)
  rx818_fail:
.annotate "line", 364
    (rx818_rep, rx818_pos, $I10, $P10) = rx818_cur."!mark_fail"(0)
    lt rx818_pos, -1, rx818_done
    eq rx818_pos, -1, rx818_fail
    jump $I10
  rx818_done:
    rx818_cur."!cursor_fail"()
    rx818_cur."!cursor_debug"("FAIL  ", "prefix:sym<->")
    .return (rx818_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<->"  :subid("233_1258264446.59978") :method
.annotate "line", 364
    $P820 = self."!PREFIX__!subrule"("O", "-")
    new $P821, "ResizablePMCArray"
    push $P821, $P820
    .return ($P821)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<?>"  :subid("234_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx824_tgt
    .local int rx824_pos
    .local int rx824_off
    .local int rx824_eos
    .local int rx824_rep
    .local pmc rx824_cur
    (rx824_cur, rx824_pos, rx824_tgt, $I10) = self."!cursor_start"()
    rx824_cur."!cursor_debug"("START ", "prefix:sym<?>")
    .lex unicode:"$\x{a2}", rx824_cur
    .local pmc match
    .lex "$/", match
    length rx824_eos, rx824_tgt
    set rx824_off, 0
    lt $I10, 2, rx824_start
    sub rx824_off, $I10, 1
    substr rx824_tgt, rx824_tgt, rx824_off
  rx824_start:
.annotate "line", 425
  # rx subcapture "sym"
    set_addr $I10, rxcap_828_fail
    rx824_cur."!mark_push"(0, rx824_pos, $I10)
  # rx literal  "?"
    add $I11, rx824_pos, 1
    gt $I11, rx824_eos, rx824_fail
    sub $I11, rx824_pos, rx824_off
    substr $S10, rx824_tgt, $I11, 1
    ne $S10, "?", rx824_fail
    add rx824_pos, 1
    set_addr $I10, rxcap_828_fail
    ($I12, $I11) = rx824_cur."!mark_peek"($I10)
    rx824_cur."!cursor_pos"($I11)
    ($P10) = rx824_cur."!cursor_start"()
    $P10."!cursor_pass"(rx824_pos, "")
    rx824_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_828_done
  rxcap_828_fail:
    goto rx824_fail
  rxcap_828_done:
  # rx subrule "O" subtype=capture negate=
    rx824_cur."!cursor_pos"(rx824_pos)
    $P10 = rx824_cur."O"("%symbolic_unary, :pirop<istrue>")
    unless $P10, rx824_fail
    rx824_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx824_pos = $P10."pos"()
  # rx pass
    rx824_cur."!cursor_pass"(rx824_pos, "prefix:sym<?>")
    rx824_cur."!cursor_debug"("PASS  ", "prefix:sym<?>", " at pos=", rx824_pos)
    .return (rx824_cur)
  rx824_fail:
.annotate "line", 364
    (rx824_rep, rx824_pos, $I10, $P10) = rx824_cur."!mark_fail"(0)
    lt rx824_pos, -1, rx824_done
    eq rx824_pos, -1, rx824_fail
    jump $I10
  rx824_done:
    rx824_cur."!cursor_fail"()
    rx824_cur."!cursor_debug"("FAIL  ", "prefix:sym<?>")
    .return (rx824_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<?>"  :subid("235_1258264446.59978") :method
.annotate "line", 364
    $P826 = self."!PREFIX__!subrule"("O", "?")
    new $P827, "ResizablePMCArray"
    push $P827, $P826
    .return ($P827)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<!>"  :subid("236_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx830_tgt
    .local int rx830_pos
    .local int rx830_off
    .local int rx830_eos
    .local int rx830_rep
    .local pmc rx830_cur
    (rx830_cur, rx830_pos, rx830_tgt, $I10) = self."!cursor_start"()
    rx830_cur."!cursor_debug"("START ", "prefix:sym<!>")
    .lex unicode:"$\x{a2}", rx830_cur
    .local pmc match
    .lex "$/", match
    length rx830_eos, rx830_tgt
    set rx830_off, 0
    lt $I10, 2, rx830_start
    sub rx830_off, $I10, 1
    substr rx830_tgt, rx830_tgt, rx830_off
  rx830_start:
.annotate "line", 426
  # rx subcapture "sym"
    set_addr $I10, rxcap_834_fail
    rx830_cur."!mark_push"(0, rx830_pos, $I10)
  # rx literal  "!"
    add $I11, rx830_pos, 1
    gt $I11, rx830_eos, rx830_fail
    sub $I11, rx830_pos, rx830_off
    substr $S10, rx830_tgt, $I11, 1
    ne $S10, "!", rx830_fail
    add rx830_pos, 1
    set_addr $I10, rxcap_834_fail
    ($I12, $I11) = rx830_cur."!mark_peek"($I10)
    rx830_cur."!cursor_pos"($I11)
    ($P10) = rx830_cur."!cursor_start"()
    $P10."!cursor_pass"(rx830_pos, "")
    rx830_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_834_done
  rxcap_834_fail:
    goto rx830_fail
  rxcap_834_done:
  # rx subrule "O" subtype=capture negate=
    rx830_cur."!cursor_pos"(rx830_pos)
    $P10 = rx830_cur."O"("%symbolic_unary, :pirop<isfalse>")
    unless $P10, rx830_fail
    rx830_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx830_pos = $P10."pos"()
  # rx pass
    rx830_cur."!cursor_pass"(rx830_pos, "prefix:sym<!>")
    rx830_cur."!cursor_debug"("PASS  ", "prefix:sym<!>", " at pos=", rx830_pos)
    .return (rx830_cur)
  rx830_fail:
.annotate "line", 364
    (rx830_rep, rx830_pos, $I10, $P10) = rx830_cur."!mark_fail"(0)
    lt rx830_pos, -1, rx830_done
    eq rx830_pos, -1, rx830_fail
    jump $I10
  rx830_done:
    rx830_cur."!cursor_fail"()
    rx830_cur."!cursor_debug"("FAIL  ", "prefix:sym<!>")
    .return (rx830_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<!>"  :subid("237_1258264446.59978") :method
.annotate "line", 364
    $P832 = self."!PREFIX__!subrule"("O", "!")
    new $P833, "ResizablePMCArray"
    push $P833, $P832
    .return ($P833)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<|>"  :subid("238_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx836_tgt
    .local int rx836_pos
    .local int rx836_off
    .local int rx836_eos
    .local int rx836_rep
    .local pmc rx836_cur
    (rx836_cur, rx836_pos, rx836_tgt, $I10) = self."!cursor_start"()
    rx836_cur."!cursor_debug"("START ", "prefix:sym<|>")
    .lex unicode:"$\x{a2}", rx836_cur
    .local pmc match
    .lex "$/", match
    length rx836_eos, rx836_tgt
    set rx836_off, 0
    lt $I10, 2, rx836_start
    sub rx836_off, $I10, 1
    substr rx836_tgt, rx836_tgt, rx836_off
  rx836_start:
.annotate "line", 427
  # rx subcapture "sym"
    set_addr $I10, rxcap_840_fail
    rx836_cur."!mark_push"(0, rx836_pos, $I10)
  # rx literal  "|"
    add $I11, rx836_pos, 1
    gt $I11, rx836_eos, rx836_fail
    sub $I11, rx836_pos, rx836_off
    substr $S10, rx836_tgt, $I11, 1
    ne $S10, "|", rx836_fail
    add rx836_pos, 1
    set_addr $I10, rxcap_840_fail
    ($I12, $I11) = rx836_cur."!mark_peek"($I10)
    rx836_cur."!cursor_pos"($I11)
    ($P10) = rx836_cur."!cursor_start"()
    $P10."!cursor_pass"(rx836_pos, "")
    rx836_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_840_done
  rxcap_840_fail:
    goto rx836_fail
  rxcap_840_done:
  # rx subrule "O" subtype=capture negate=
    rx836_cur."!cursor_pos"(rx836_pos)
    $P10 = rx836_cur."O"("%symbolic_unary")
    unless $P10, rx836_fail
    rx836_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx836_pos = $P10."pos"()
  # rx pass
    rx836_cur."!cursor_pass"(rx836_pos, "prefix:sym<|>")
    rx836_cur."!cursor_debug"("PASS  ", "prefix:sym<|>", " at pos=", rx836_pos)
    .return (rx836_cur)
  rx836_fail:
.annotate "line", 364
    (rx836_rep, rx836_pos, $I10, $P10) = rx836_cur."!mark_fail"(0)
    lt rx836_pos, -1, rx836_done
    eq rx836_pos, -1, rx836_fail
    jump $I10
  rx836_done:
    rx836_cur."!cursor_fail"()
    rx836_cur."!cursor_debug"("FAIL  ", "prefix:sym<|>")
    .return (rx836_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<|>"  :subid("239_1258264446.59978") :method
.annotate "line", 364
    $P838 = self."!PREFIX__!subrule"("O", "|")
    new $P839, "ResizablePMCArray"
    push $P839, $P838
    .return ($P839)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<*>"  :subid("240_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx842_tgt
    .local int rx842_pos
    .local int rx842_off
    .local int rx842_eos
    .local int rx842_rep
    .local pmc rx842_cur
    (rx842_cur, rx842_pos, rx842_tgt, $I10) = self."!cursor_start"()
    rx842_cur."!cursor_debug"("START ", "infix:sym<*>")
    .lex unicode:"$\x{a2}", rx842_cur
    .local pmc match
    .lex "$/", match
    length rx842_eos, rx842_tgt
    set rx842_off, 0
    lt $I10, 2, rx842_start
    sub rx842_off, $I10, 1
    substr rx842_tgt, rx842_tgt, rx842_off
  rx842_start:
.annotate "line", 429
  # rx subcapture "sym"
    set_addr $I10, rxcap_846_fail
    rx842_cur."!mark_push"(0, rx842_pos, $I10)
  # rx literal  "*"
    add $I11, rx842_pos, 1
    gt $I11, rx842_eos, rx842_fail
    sub $I11, rx842_pos, rx842_off
    substr $S10, rx842_tgt, $I11, 1
    ne $S10, "*", rx842_fail
    add rx842_pos, 1
    set_addr $I10, rxcap_846_fail
    ($I12, $I11) = rx842_cur."!mark_peek"($I10)
    rx842_cur."!cursor_pos"($I11)
    ($P10) = rx842_cur."!cursor_start"()
    $P10."!cursor_pass"(rx842_pos, "")
    rx842_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_846_done
  rxcap_846_fail:
    goto rx842_fail
  rxcap_846_done:
  # rx subrule "O" subtype=capture negate=
    rx842_cur."!cursor_pos"(rx842_pos)
    $P10 = rx842_cur."O"("%multiplicative, :pirop<mul>")
    unless $P10, rx842_fail
    rx842_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx842_pos = $P10."pos"()
  # rx pass
    rx842_cur."!cursor_pass"(rx842_pos, "infix:sym<*>")
    rx842_cur."!cursor_debug"("PASS  ", "infix:sym<*>", " at pos=", rx842_pos)
    .return (rx842_cur)
  rx842_fail:
.annotate "line", 364
    (rx842_rep, rx842_pos, $I10, $P10) = rx842_cur."!mark_fail"(0)
    lt rx842_pos, -1, rx842_done
    eq rx842_pos, -1, rx842_fail
    jump $I10
  rx842_done:
    rx842_cur."!cursor_fail"()
    rx842_cur."!cursor_debug"("FAIL  ", "infix:sym<*>")
    .return (rx842_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<*>"  :subid("241_1258264446.59978") :method
.annotate "line", 364
    $P844 = self."!PREFIX__!subrule"("O", "*")
    new $P845, "ResizablePMCArray"
    push $P845, $P844
    .return ($P845)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym</>"  :subid("242_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx848_tgt
    .local int rx848_pos
    .local int rx848_off
    .local int rx848_eos
    .local int rx848_rep
    .local pmc rx848_cur
    (rx848_cur, rx848_pos, rx848_tgt, $I10) = self."!cursor_start"()
    rx848_cur."!cursor_debug"("START ", "infix:sym</>")
    .lex unicode:"$\x{a2}", rx848_cur
    .local pmc match
    .lex "$/", match
    length rx848_eos, rx848_tgt
    set rx848_off, 0
    lt $I10, 2, rx848_start
    sub rx848_off, $I10, 1
    substr rx848_tgt, rx848_tgt, rx848_off
  rx848_start:
.annotate "line", 430
  # rx subcapture "sym"
    set_addr $I10, rxcap_852_fail
    rx848_cur."!mark_push"(0, rx848_pos, $I10)
  # rx literal  "/"
    add $I11, rx848_pos, 1
    gt $I11, rx848_eos, rx848_fail
    sub $I11, rx848_pos, rx848_off
    substr $S10, rx848_tgt, $I11, 1
    ne $S10, "/", rx848_fail
    add rx848_pos, 1
    set_addr $I10, rxcap_852_fail
    ($I12, $I11) = rx848_cur."!mark_peek"($I10)
    rx848_cur."!cursor_pos"($I11)
    ($P10) = rx848_cur."!cursor_start"()
    $P10."!cursor_pass"(rx848_pos, "")
    rx848_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_852_done
  rxcap_852_fail:
    goto rx848_fail
  rxcap_852_done:
  # rx subrule "O" subtype=capture negate=
    rx848_cur."!cursor_pos"(rx848_pos)
    $P10 = rx848_cur."O"("%multiplicative, :pirop<div>")
    unless $P10, rx848_fail
    rx848_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx848_pos = $P10."pos"()
  # rx pass
    rx848_cur."!cursor_pass"(rx848_pos, "infix:sym</>")
    rx848_cur."!cursor_debug"("PASS  ", "infix:sym</>", " at pos=", rx848_pos)
    .return (rx848_cur)
  rx848_fail:
.annotate "line", 364
    (rx848_rep, rx848_pos, $I10, $P10) = rx848_cur."!mark_fail"(0)
    lt rx848_pos, -1, rx848_done
    eq rx848_pos, -1, rx848_fail
    jump $I10
  rx848_done:
    rx848_cur."!cursor_fail"()
    rx848_cur."!cursor_debug"("FAIL  ", "infix:sym</>")
    .return (rx848_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym</>"  :subid("243_1258264446.59978") :method
.annotate "line", 364
    $P850 = self."!PREFIX__!subrule"("O", "/")
    new $P851, "ResizablePMCArray"
    push $P851, $P850
    .return ($P851)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<%>"  :subid("244_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx854_tgt
    .local int rx854_pos
    .local int rx854_off
    .local int rx854_eos
    .local int rx854_rep
    .local pmc rx854_cur
    (rx854_cur, rx854_pos, rx854_tgt, $I10) = self."!cursor_start"()
    rx854_cur."!cursor_debug"("START ", "infix:sym<%>")
    .lex unicode:"$\x{a2}", rx854_cur
    .local pmc match
    .lex "$/", match
    length rx854_eos, rx854_tgt
    set rx854_off, 0
    lt $I10, 2, rx854_start
    sub rx854_off, $I10, 1
    substr rx854_tgt, rx854_tgt, rx854_off
  rx854_start:
.annotate "line", 431
  # rx subcapture "sym"
    set_addr $I10, rxcap_858_fail
    rx854_cur."!mark_push"(0, rx854_pos, $I10)
  # rx literal  "%"
    add $I11, rx854_pos, 1
    gt $I11, rx854_eos, rx854_fail
    sub $I11, rx854_pos, rx854_off
    substr $S10, rx854_tgt, $I11, 1
    ne $S10, "%", rx854_fail
    add rx854_pos, 1
    set_addr $I10, rxcap_858_fail
    ($I12, $I11) = rx854_cur."!mark_peek"($I10)
    rx854_cur."!cursor_pos"($I11)
    ($P10) = rx854_cur."!cursor_start"()
    $P10."!cursor_pass"(rx854_pos, "")
    rx854_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_858_done
  rxcap_858_fail:
    goto rx854_fail
  rxcap_858_done:
  # rx subrule "O" subtype=capture negate=
    rx854_cur."!cursor_pos"(rx854_pos)
    $P10 = rx854_cur."O"("%multiplicative, :pirop<mod>")
    unless $P10, rx854_fail
    rx854_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx854_pos = $P10."pos"()
  # rx pass
    rx854_cur."!cursor_pass"(rx854_pos, "infix:sym<%>")
    rx854_cur."!cursor_debug"("PASS  ", "infix:sym<%>", " at pos=", rx854_pos)
    .return (rx854_cur)
  rx854_fail:
.annotate "line", 364
    (rx854_rep, rx854_pos, $I10, $P10) = rx854_cur."!mark_fail"(0)
    lt rx854_pos, -1, rx854_done
    eq rx854_pos, -1, rx854_fail
    jump $I10
  rx854_done:
    rx854_cur."!cursor_fail"()
    rx854_cur."!cursor_debug"("FAIL  ", "infix:sym<%>")
    .return (rx854_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<%>"  :subid("245_1258264446.59978") :method
.annotate "line", 364
    $P856 = self."!PREFIX__!subrule"("O", "%")
    new $P857, "ResizablePMCArray"
    push $P857, $P856
    .return ($P857)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+>"  :subid("246_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx860_tgt
    .local int rx860_pos
    .local int rx860_off
    .local int rx860_eos
    .local int rx860_rep
    .local pmc rx860_cur
    (rx860_cur, rx860_pos, rx860_tgt, $I10) = self."!cursor_start"()
    rx860_cur."!cursor_debug"("START ", "infix:sym<+>")
    .lex unicode:"$\x{a2}", rx860_cur
    .local pmc match
    .lex "$/", match
    length rx860_eos, rx860_tgt
    set rx860_off, 0
    lt $I10, 2, rx860_start
    sub rx860_off, $I10, 1
    substr rx860_tgt, rx860_tgt, rx860_off
  rx860_start:
.annotate "line", 433
  # rx subcapture "sym"
    set_addr $I10, rxcap_864_fail
    rx860_cur."!mark_push"(0, rx860_pos, $I10)
  # rx literal  "+"
    add $I11, rx860_pos, 1
    gt $I11, rx860_eos, rx860_fail
    sub $I11, rx860_pos, rx860_off
    substr $S10, rx860_tgt, $I11, 1
    ne $S10, "+", rx860_fail
    add rx860_pos, 1
    set_addr $I10, rxcap_864_fail
    ($I12, $I11) = rx860_cur."!mark_peek"($I10)
    rx860_cur."!cursor_pos"($I11)
    ($P10) = rx860_cur."!cursor_start"()
    $P10."!cursor_pass"(rx860_pos, "")
    rx860_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_864_done
  rxcap_864_fail:
    goto rx860_fail
  rxcap_864_done:
  # rx subrule "O" subtype=capture negate=
    rx860_cur."!cursor_pos"(rx860_pos)
    $P10 = rx860_cur."O"("%additive, :pirop<add>")
    unless $P10, rx860_fail
    rx860_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx860_pos = $P10."pos"()
  # rx pass
    rx860_cur."!cursor_pass"(rx860_pos, "infix:sym<+>")
    rx860_cur."!cursor_debug"("PASS  ", "infix:sym<+>", " at pos=", rx860_pos)
    .return (rx860_cur)
  rx860_fail:
.annotate "line", 364
    (rx860_rep, rx860_pos, $I10, $P10) = rx860_cur."!mark_fail"(0)
    lt rx860_pos, -1, rx860_done
    eq rx860_pos, -1, rx860_fail
    jump $I10
  rx860_done:
    rx860_cur."!cursor_fail"()
    rx860_cur."!cursor_debug"("FAIL  ", "infix:sym<+>")
    .return (rx860_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+>"  :subid("247_1258264446.59978") :method
.annotate "line", 364
    $P862 = self."!PREFIX__!subrule"("O", "+")
    new $P863, "ResizablePMCArray"
    push $P863, $P862
    .return ($P863)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<->"  :subid("248_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx866_tgt
    .local int rx866_pos
    .local int rx866_off
    .local int rx866_eos
    .local int rx866_rep
    .local pmc rx866_cur
    (rx866_cur, rx866_pos, rx866_tgt, $I10) = self."!cursor_start"()
    rx866_cur."!cursor_debug"("START ", "infix:sym<->")
    .lex unicode:"$\x{a2}", rx866_cur
    .local pmc match
    .lex "$/", match
    length rx866_eos, rx866_tgt
    set rx866_off, 0
    lt $I10, 2, rx866_start
    sub rx866_off, $I10, 1
    substr rx866_tgt, rx866_tgt, rx866_off
  rx866_start:
.annotate "line", 434
  # rx subcapture "sym"
    set_addr $I10, rxcap_870_fail
    rx866_cur."!mark_push"(0, rx866_pos, $I10)
  # rx literal  "-"
    add $I11, rx866_pos, 1
    gt $I11, rx866_eos, rx866_fail
    sub $I11, rx866_pos, rx866_off
    substr $S10, rx866_tgt, $I11, 1
    ne $S10, "-", rx866_fail
    add rx866_pos, 1
    set_addr $I10, rxcap_870_fail
    ($I12, $I11) = rx866_cur."!mark_peek"($I10)
    rx866_cur."!cursor_pos"($I11)
    ($P10) = rx866_cur."!cursor_start"()
    $P10."!cursor_pass"(rx866_pos, "")
    rx866_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_870_done
  rxcap_870_fail:
    goto rx866_fail
  rxcap_870_done:
  # rx subrule "O" subtype=capture negate=
    rx866_cur."!cursor_pos"(rx866_pos)
    $P10 = rx866_cur."O"("%additive, :pirop<sub>")
    unless $P10, rx866_fail
    rx866_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx866_pos = $P10."pos"()
  # rx pass
    rx866_cur."!cursor_pass"(rx866_pos, "infix:sym<->")
    rx866_cur."!cursor_debug"("PASS  ", "infix:sym<->", " at pos=", rx866_pos)
    .return (rx866_cur)
  rx866_fail:
.annotate "line", 364
    (rx866_rep, rx866_pos, $I10, $P10) = rx866_cur."!mark_fail"(0)
    lt rx866_pos, -1, rx866_done
    eq rx866_pos, -1, rx866_fail
    jump $I10
  rx866_done:
    rx866_cur."!cursor_fail"()
    rx866_cur."!cursor_debug"("FAIL  ", "infix:sym<->")
    .return (rx866_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<->"  :subid("249_1258264446.59978") :method
.annotate "line", 364
    $P868 = self."!PREFIX__!subrule"("O", "-")
    new $P869, "ResizablePMCArray"
    push $P869, $P868
    .return ($P869)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~>"  :subid("250_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx872_tgt
    .local int rx872_pos
    .local int rx872_off
    .local int rx872_eos
    .local int rx872_rep
    .local pmc rx872_cur
    (rx872_cur, rx872_pos, rx872_tgt, $I10) = self."!cursor_start"()
    rx872_cur."!cursor_debug"("START ", "infix:sym<~>")
    .lex unicode:"$\x{a2}", rx872_cur
    .local pmc match
    .lex "$/", match
    length rx872_eos, rx872_tgt
    set rx872_off, 0
    lt $I10, 2, rx872_start
    sub rx872_off, $I10, 1
    substr rx872_tgt, rx872_tgt, rx872_off
  rx872_start:
.annotate "line", 436
  # rx subcapture "sym"
    set_addr $I10, rxcap_876_fail
    rx872_cur."!mark_push"(0, rx872_pos, $I10)
  # rx literal  "~"
    add $I11, rx872_pos, 1
    gt $I11, rx872_eos, rx872_fail
    sub $I11, rx872_pos, rx872_off
    substr $S10, rx872_tgt, $I11, 1
    ne $S10, "~", rx872_fail
    add rx872_pos, 1
    set_addr $I10, rxcap_876_fail
    ($I12, $I11) = rx872_cur."!mark_peek"($I10)
    rx872_cur."!cursor_pos"($I11)
    ($P10) = rx872_cur."!cursor_start"()
    $P10."!cursor_pass"(rx872_pos, "")
    rx872_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_876_done
  rxcap_876_fail:
    goto rx872_fail
  rxcap_876_done:
  # rx subrule "O" subtype=capture negate=
    rx872_cur."!cursor_pos"(rx872_pos)
    $P10 = rx872_cur."O"("%concatenation , :pirop<concat>")
    unless $P10, rx872_fail
    rx872_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx872_pos = $P10."pos"()
  # rx pass
    rx872_cur."!cursor_pass"(rx872_pos, "infix:sym<~>")
    rx872_cur."!cursor_debug"("PASS  ", "infix:sym<~>", " at pos=", rx872_pos)
    .return (rx872_cur)
  rx872_fail:
.annotate "line", 364
    (rx872_rep, rx872_pos, $I10, $P10) = rx872_cur."!mark_fail"(0)
    lt rx872_pos, -1, rx872_done
    eq rx872_pos, -1, rx872_fail
    jump $I10
  rx872_done:
    rx872_cur."!cursor_fail"()
    rx872_cur."!cursor_debug"("FAIL  ", "infix:sym<~>")
    .return (rx872_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~>"  :subid("251_1258264446.59978") :method
.annotate "line", 364
    $P874 = self."!PREFIX__!subrule"("O", "~")
    new $P875, "ResizablePMCArray"
    push $P875, $P874
    .return ($P875)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<==>"  :subid("252_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx878_tgt
    .local int rx878_pos
    .local int rx878_off
    .local int rx878_eos
    .local int rx878_rep
    .local pmc rx878_cur
    (rx878_cur, rx878_pos, rx878_tgt, $I10) = self."!cursor_start"()
    rx878_cur."!cursor_debug"("START ", "infix:sym<==>")
    .lex unicode:"$\x{a2}", rx878_cur
    .local pmc match
    .lex "$/", match
    length rx878_eos, rx878_tgt
    set rx878_off, 0
    lt $I10, 2, rx878_start
    sub rx878_off, $I10, 1
    substr rx878_tgt, rx878_tgt, rx878_off
  rx878_start:
.annotate "line", 438
  # rx subcapture "sym"
    set_addr $I10, rxcap_882_fail
    rx878_cur."!mark_push"(0, rx878_pos, $I10)
  # rx literal  "=="
    add $I11, rx878_pos, 2
    gt $I11, rx878_eos, rx878_fail
    sub $I11, rx878_pos, rx878_off
    substr $S10, rx878_tgt, $I11, 2
    ne $S10, "==", rx878_fail
    add rx878_pos, 2
    set_addr $I10, rxcap_882_fail
    ($I12, $I11) = rx878_cur."!mark_peek"($I10)
    rx878_cur."!cursor_pos"($I11)
    ($P10) = rx878_cur."!cursor_start"()
    $P10."!cursor_pass"(rx878_pos, "")
    rx878_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_882_done
  rxcap_882_fail:
    goto rx878_fail
  rxcap_882_done:
  # rx subrule "O" subtype=capture negate=
    rx878_cur."!cursor_pos"(rx878_pos)
    $P10 = rx878_cur."O"("%relational, :pirop<iseq INn>")
    unless $P10, rx878_fail
    rx878_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx878_pos = $P10."pos"()
  # rx pass
    rx878_cur."!cursor_pass"(rx878_pos, "infix:sym<==>")
    rx878_cur."!cursor_debug"("PASS  ", "infix:sym<==>", " at pos=", rx878_pos)
    .return (rx878_cur)
  rx878_fail:
.annotate "line", 364
    (rx878_rep, rx878_pos, $I10, $P10) = rx878_cur."!mark_fail"(0)
    lt rx878_pos, -1, rx878_done
    eq rx878_pos, -1, rx878_fail
    jump $I10
  rx878_done:
    rx878_cur."!cursor_fail"()
    rx878_cur."!cursor_debug"("FAIL  ", "infix:sym<==>")
    .return (rx878_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<==>"  :subid("253_1258264446.59978") :method
.annotate "line", 364
    $P880 = self."!PREFIX__!subrule"("O", "==")
    new $P881, "ResizablePMCArray"
    push $P881, $P880
    .return ($P881)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<!=>"  :subid("254_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx884_tgt
    .local int rx884_pos
    .local int rx884_off
    .local int rx884_eos
    .local int rx884_rep
    .local pmc rx884_cur
    (rx884_cur, rx884_pos, rx884_tgt, $I10) = self."!cursor_start"()
    rx884_cur."!cursor_debug"("START ", "infix:sym<!=>")
    .lex unicode:"$\x{a2}", rx884_cur
    .local pmc match
    .lex "$/", match
    length rx884_eos, rx884_tgt
    set rx884_off, 0
    lt $I10, 2, rx884_start
    sub rx884_off, $I10, 1
    substr rx884_tgt, rx884_tgt, rx884_off
  rx884_start:
.annotate "line", 439
  # rx subcapture "sym"
    set_addr $I10, rxcap_888_fail
    rx884_cur."!mark_push"(0, rx884_pos, $I10)
  # rx literal  "!="
    add $I11, rx884_pos, 2
    gt $I11, rx884_eos, rx884_fail
    sub $I11, rx884_pos, rx884_off
    substr $S10, rx884_tgt, $I11, 2
    ne $S10, "!=", rx884_fail
    add rx884_pos, 2
    set_addr $I10, rxcap_888_fail
    ($I12, $I11) = rx884_cur."!mark_peek"($I10)
    rx884_cur."!cursor_pos"($I11)
    ($P10) = rx884_cur."!cursor_start"()
    $P10."!cursor_pass"(rx884_pos, "")
    rx884_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_888_done
  rxcap_888_fail:
    goto rx884_fail
  rxcap_888_done:
  # rx subrule "O" subtype=capture negate=
    rx884_cur."!cursor_pos"(rx884_pos)
    $P10 = rx884_cur."O"("%relational, :pirop<isne INn>")
    unless $P10, rx884_fail
    rx884_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx884_pos = $P10."pos"()
  # rx pass
    rx884_cur."!cursor_pass"(rx884_pos, "infix:sym<!=>")
    rx884_cur."!cursor_debug"("PASS  ", "infix:sym<!=>", " at pos=", rx884_pos)
    .return (rx884_cur)
  rx884_fail:
.annotate "line", 364
    (rx884_rep, rx884_pos, $I10, $P10) = rx884_cur."!mark_fail"(0)
    lt rx884_pos, -1, rx884_done
    eq rx884_pos, -1, rx884_fail
    jump $I10
  rx884_done:
    rx884_cur."!cursor_fail"()
    rx884_cur."!cursor_debug"("FAIL  ", "infix:sym<!=>")
    .return (rx884_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<!=>"  :subid("255_1258264446.59978") :method
.annotate "line", 364
    $P886 = self."!PREFIX__!subrule"("O", "!=")
    new $P887, "ResizablePMCArray"
    push $P887, $P886
    .return ($P887)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<=>"  :subid("256_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx890_tgt
    .local int rx890_pos
    .local int rx890_off
    .local int rx890_eos
    .local int rx890_rep
    .local pmc rx890_cur
    (rx890_cur, rx890_pos, rx890_tgt, $I10) = self."!cursor_start"()
    rx890_cur."!cursor_debug"("START ", "infix:sym<<=>")
    .lex unicode:"$\x{a2}", rx890_cur
    .local pmc match
    .lex "$/", match
    length rx890_eos, rx890_tgt
    set rx890_off, 0
    lt $I10, 2, rx890_start
    sub rx890_off, $I10, 1
    substr rx890_tgt, rx890_tgt, rx890_off
  rx890_start:
.annotate "line", 440
  # rx subcapture "sym"
    set_addr $I10, rxcap_894_fail
    rx890_cur."!mark_push"(0, rx890_pos, $I10)
  # rx literal  "<="
    add $I11, rx890_pos, 2
    gt $I11, rx890_eos, rx890_fail
    sub $I11, rx890_pos, rx890_off
    substr $S10, rx890_tgt, $I11, 2
    ne $S10, "<=", rx890_fail
    add rx890_pos, 2
    set_addr $I10, rxcap_894_fail
    ($I12, $I11) = rx890_cur."!mark_peek"($I10)
    rx890_cur."!cursor_pos"($I11)
    ($P10) = rx890_cur."!cursor_start"()
    $P10."!cursor_pass"(rx890_pos, "")
    rx890_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_894_done
  rxcap_894_fail:
    goto rx890_fail
  rxcap_894_done:
  # rx subrule "O" subtype=capture negate=
    rx890_cur."!cursor_pos"(rx890_pos)
    $P10 = rx890_cur."O"("%relational, :pirop<isle INn>")
    unless $P10, rx890_fail
    rx890_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx890_pos = $P10."pos"()
  # rx pass
    rx890_cur."!cursor_pass"(rx890_pos, "infix:sym<<=>")
    rx890_cur."!cursor_debug"("PASS  ", "infix:sym<<=>", " at pos=", rx890_pos)
    .return (rx890_cur)
  rx890_fail:
.annotate "line", 364
    (rx890_rep, rx890_pos, $I10, $P10) = rx890_cur."!mark_fail"(0)
    lt rx890_pos, -1, rx890_done
    eq rx890_pos, -1, rx890_fail
    jump $I10
  rx890_done:
    rx890_cur."!cursor_fail"()
    rx890_cur."!cursor_debug"("FAIL  ", "infix:sym<<=>")
    .return (rx890_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<=>"  :subid("257_1258264446.59978") :method
.annotate "line", 364
    $P892 = self."!PREFIX__!subrule"("O", "<=")
    new $P893, "ResizablePMCArray"
    push $P893, $P892
    .return ($P893)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>=>"  :subid("258_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx896_tgt
    .local int rx896_pos
    .local int rx896_off
    .local int rx896_eos
    .local int rx896_rep
    .local pmc rx896_cur
    (rx896_cur, rx896_pos, rx896_tgt, $I10) = self."!cursor_start"()
    rx896_cur."!cursor_debug"("START ", "infix:sym<>=>")
    .lex unicode:"$\x{a2}", rx896_cur
    .local pmc match
    .lex "$/", match
    length rx896_eos, rx896_tgt
    set rx896_off, 0
    lt $I10, 2, rx896_start
    sub rx896_off, $I10, 1
    substr rx896_tgt, rx896_tgt, rx896_off
  rx896_start:
.annotate "line", 441
  # rx subcapture "sym"
    set_addr $I10, rxcap_900_fail
    rx896_cur."!mark_push"(0, rx896_pos, $I10)
  # rx literal  ">="
    add $I11, rx896_pos, 2
    gt $I11, rx896_eos, rx896_fail
    sub $I11, rx896_pos, rx896_off
    substr $S10, rx896_tgt, $I11, 2
    ne $S10, ">=", rx896_fail
    add rx896_pos, 2
    set_addr $I10, rxcap_900_fail
    ($I12, $I11) = rx896_cur."!mark_peek"($I10)
    rx896_cur."!cursor_pos"($I11)
    ($P10) = rx896_cur."!cursor_start"()
    $P10."!cursor_pass"(rx896_pos, "")
    rx896_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_900_done
  rxcap_900_fail:
    goto rx896_fail
  rxcap_900_done:
  # rx subrule "O" subtype=capture negate=
    rx896_cur."!cursor_pos"(rx896_pos)
    $P10 = rx896_cur."O"("%relational, :pirop<isge INn>")
    unless $P10, rx896_fail
    rx896_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx896_pos = $P10."pos"()
  # rx pass
    rx896_cur."!cursor_pass"(rx896_pos, "infix:sym<>=>")
    rx896_cur."!cursor_debug"("PASS  ", "infix:sym<>=>", " at pos=", rx896_pos)
    .return (rx896_cur)
  rx896_fail:
.annotate "line", 364
    (rx896_rep, rx896_pos, $I10, $P10) = rx896_cur."!mark_fail"(0)
    lt rx896_pos, -1, rx896_done
    eq rx896_pos, -1, rx896_fail
    jump $I10
  rx896_done:
    rx896_cur."!cursor_fail"()
    rx896_cur."!cursor_debug"("FAIL  ", "infix:sym<>=>")
    .return (rx896_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>=>"  :subid("259_1258264446.59978") :method
.annotate "line", 364
    $P898 = self."!PREFIX__!subrule"("O", ">=")
    new $P899, "ResizablePMCArray"
    push $P899, $P898
    .return ($P899)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<>"  :subid("260_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx902_tgt
    .local int rx902_pos
    .local int rx902_off
    .local int rx902_eos
    .local int rx902_rep
    .local pmc rx902_cur
    (rx902_cur, rx902_pos, rx902_tgt, $I10) = self."!cursor_start"()
    rx902_cur."!cursor_debug"("START ", "infix:sym<<>")
    .lex unicode:"$\x{a2}", rx902_cur
    .local pmc match
    .lex "$/", match
    length rx902_eos, rx902_tgt
    set rx902_off, 0
    lt $I10, 2, rx902_start
    sub rx902_off, $I10, 1
    substr rx902_tgt, rx902_tgt, rx902_off
  rx902_start:
.annotate "line", 442
  # rx subcapture "sym"
    set_addr $I10, rxcap_906_fail
    rx902_cur."!mark_push"(0, rx902_pos, $I10)
  # rx literal  "<"
    add $I11, rx902_pos, 1
    gt $I11, rx902_eos, rx902_fail
    sub $I11, rx902_pos, rx902_off
    substr $S10, rx902_tgt, $I11, 1
    ne $S10, "<", rx902_fail
    add rx902_pos, 1
    set_addr $I10, rxcap_906_fail
    ($I12, $I11) = rx902_cur."!mark_peek"($I10)
    rx902_cur."!cursor_pos"($I11)
    ($P10) = rx902_cur."!cursor_start"()
    $P10."!cursor_pass"(rx902_pos, "")
    rx902_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_906_done
  rxcap_906_fail:
    goto rx902_fail
  rxcap_906_done:
  # rx subrule "O" subtype=capture negate=
    rx902_cur."!cursor_pos"(rx902_pos)
    $P10 = rx902_cur."O"("%relational, :pirop<islt INn>")
    unless $P10, rx902_fail
    rx902_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx902_pos = $P10."pos"()
  # rx pass
    rx902_cur."!cursor_pass"(rx902_pos, "infix:sym<<>")
    rx902_cur."!cursor_debug"("PASS  ", "infix:sym<<>", " at pos=", rx902_pos)
    .return (rx902_cur)
  rx902_fail:
.annotate "line", 364
    (rx902_rep, rx902_pos, $I10, $P10) = rx902_cur."!mark_fail"(0)
    lt rx902_pos, -1, rx902_done
    eq rx902_pos, -1, rx902_fail
    jump $I10
  rx902_done:
    rx902_cur."!cursor_fail"()
    rx902_cur."!cursor_debug"("FAIL  ", "infix:sym<<>")
    .return (rx902_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<>"  :subid("261_1258264446.59978") :method
.annotate "line", 364
    $P904 = self."!PREFIX__!subrule"("O", "<")
    new $P905, "ResizablePMCArray"
    push $P905, $P904
    .return ($P905)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>>"  :subid("262_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx908_tgt
    .local int rx908_pos
    .local int rx908_off
    .local int rx908_eos
    .local int rx908_rep
    .local pmc rx908_cur
    (rx908_cur, rx908_pos, rx908_tgt, $I10) = self."!cursor_start"()
    rx908_cur."!cursor_debug"("START ", "infix:sym<>>")
    .lex unicode:"$\x{a2}", rx908_cur
    .local pmc match
    .lex "$/", match
    length rx908_eos, rx908_tgt
    set rx908_off, 0
    lt $I10, 2, rx908_start
    sub rx908_off, $I10, 1
    substr rx908_tgt, rx908_tgt, rx908_off
  rx908_start:
.annotate "line", 443
  # rx subcapture "sym"
    set_addr $I10, rxcap_912_fail
    rx908_cur."!mark_push"(0, rx908_pos, $I10)
  # rx literal  ">"
    add $I11, rx908_pos, 1
    gt $I11, rx908_eos, rx908_fail
    sub $I11, rx908_pos, rx908_off
    substr $S10, rx908_tgt, $I11, 1
    ne $S10, ">", rx908_fail
    add rx908_pos, 1
    set_addr $I10, rxcap_912_fail
    ($I12, $I11) = rx908_cur."!mark_peek"($I10)
    rx908_cur."!cursor_pos"($I11)
    ($P10) = rx908_cur."!cursor_start"()
    $P10."!cursor_pass"(rx908_pos, "")
    rx908_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_912_done
  rxcap_912_fail:
    goto rx908_fail
  rxcap_912_done:
  # rx subrule "O" subtype=capture negate=
    rx908_cur."!cursor_pos"(rx908_pos)
    $P10 = rx908_cur."O"("%relational, :pirop<isgt INn>")
    unless $P10, rx908_fail
    rx908_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx908_pos = $P10."pos"()
  # rx pass
    rx908_cur."!cursor_pass"(rx908_pos, "infix:sym<>>")
    rx908_cur."!cursor_debug"("PASS  ", "infix:sym<>>", " at pos=", rx908_pos)
    .return (rx908_cur)
  rx908_fail:
.annotate "line", 364
    (rx908_rep, rx908_pos, $I10, $P10) = rx908_cur."!mark_fail"(0)
    lt rx908_pos, -1, rx908_done
    eq rx908_pos, -1, rx908_fail
    jump $I10
  rx908_done:
    rx908_cur."!cursor_fail"()
    rx908_cur."!cursor_debug"("FAIL  ", "infix:sym<>>")
    .return (rx908_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>>"  :subid("263_1258264446.59978") :method
.annotate "line", 364
    $P910 = self."!PREFIX__!subrule"("O", ">")
    new $P911, "ResizablePMCArray"
    push $P911, $P910
    .return ($P911)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<eq>"  :subid("264_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx914_tgt
    .local int rx914_pos
    .local int rx914_off
    .local int rx914_eos
    .local int rx914_rep
    .local pmc rx914_cur
    (rx914_cur, rx914_pos, rx914_tgt, $I10) = self."!cursor_start"()
    rx914_cur."!cursor_debug"("START ", "infix:sym<eq>")
    .lex unicode:"$\x{a2}", rx914_cur
    .local pmc match
    .lex "$/", match
    length rx914_eos, rx914_tgt
    set rx914_off, 0
    lt $I10, 2, rx914_start
    sub rx914_off, $I10, 1
    substr rx914_tgt, rx914_tgt, rx914_off
  rx914_start:
.annotate "line", 444
  # rx subcapture "sym"
    set_addr $I10, rxcap_918_fail
    rx914_cur."!mark_push"(0, rx914_pos, $I10)
  # rx literal  "eq"
    add $I11, rx914_pos, 2
    gt $I11, rx914_eos, rx914_fail
    sub $I11, rx914_pos, rx914_off
    substr $S10, rx914_tgt, $I11, 2
    ne $S10, "eq", rx914_fail
    add rx914_pos, 2
    set_addr $I10, rxcap_918_fail
    ($I12, $I11) = rx914_cur."!mark_peek"($I10)
    rx914_cur."!cursor_pos"($I11)
    ($P10) = rx914_cur."!cursor_start"()
    $P10."!cursor_pass"(rx914_pos, "")
    rx914_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_918_done
  rxcap_918_fail:
    goto rx914_fail
  rxcap_918_done:
  # rx subrule "O" subtype=capture negate=
    rx914_cur."!cursor_pos"(rx914_pos)
    $P10 = rx914_cur."O"("%relational, :pirop<iseq ISs>")
    unless $P10, rx914_fail
    rx914_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx914_pos = $P10."pos"()
  # rx pass
    rx914_cur."!cursor_pass"(rx914_pos, "infix:sym<eq>")
    rx914_cur."!cursor_debug"("PASS  ", "infix:sym<eq>", " at pos=", rx914_pos)
    .return (rx914_cur)
  rx914_fail:
.annotate "line", 364
    (rx914_rep, rx914_pos, $I10, $P10) = rx914_cur."!mark_fail"(0)
    lt rx914_pos, -1, rx914_done
    eq rx914_pos, -1, rx914_fail
    jump $I10
  rx914_done:
    rx914_cur."!cursor_fail"()
    rx914_cur."!cursor_debug"("FAIL  ", "infix:sym<eq>")
    .return (rx914_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<eq>"  :subid("265_1258264446.59978") :method
.annotate "line", 364
    $P916 = self."!PREFIX__!subrule"("O", "eq")
    new $P917, "ResizablePMCArray"
    push $P917, $P916
    .return ($P917)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ne>"  :subid("266_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx920_tgt
    .local int rx920_pos
    .local int rx920_off
    .local int rx920_eos
    .local int rx920_rep
    .local pmc rx920_cur
    (rx920_cur, rx920_pos, rx920_tgt, $I10) = self."!cursor_start"()
    rx920_cur."!cursor_debug"("START ", "infix:sym<ne>")
    .lex unicode:"$\x{a2}", rx920_cur
    .local pmc match
    .lex "$/", match
    length rx920_eos, rx920_tgt
    set rx920_off, 0
    lt $I10, 2, rx920_start
    sub rx920_off, $I10, 1
    substr rx920_tgt, rx920_tgt, rx920_off
  rx920_start:
.annotate "line", 445
  # rx subcapture "sym"
    set_addr $I10, rxcap_924_fail
    rx920_cur."!mark_push"(0, rx920_pos, $I10)
  # rx literal  "ne"
    add $I11, rx920_pos, 2
    gt $I11, rx920_eos, rx920_fail
    sub $I11, rx920_pos, rx920_off
    substr $S10, rx920_tgt, $I11, 2
    ne $S10, "ne", rx920_fail
    add rx920_pos, 2
    set_addr $I10, rxcap_924_fail
    ($I12, $I11) = rx920_cur."!mark_peek"($I10)
    rx920_cur."!cursor_pos"($I11)
    ($P10) = rx920_cur."!cursor_start"()
    $P10."!cursor_pass"(rx920_pos, "")
    rx920_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_924_done
  rxcap_924_fail:
    goto rx920_fail
  rxcap_924_done:
  # rx subrule "O" subtype=capture negate=
    rx920_cur."!cursor_pos"(rx920_pos)
    $P10 = rx920_cur."O"("%relational, :pirop<isne ISs>")
    unless $P10, rx920_fail
    rx920_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx920_pos = $P10."pos"()
  # rx pass
    rx920_cur."!cursor_pass"(rx920_pos, "infix:sym<ne>")
    rx920_cur."!cursor_debug"("PASS  ", "infix:sym<ne>", " at pos=", rx920_pos)
    .return (rx920_cur)
  rx920_fail:
.annotate "line", 364
    (rx920_rep, rx920_pos, $I10, $P10) = rx920_cur."!mark_fail"(0)
    lt rx920_pos, -1, rx920_done
    eq rx920_pos, -1, rx920_fail
    jump $I10
  rx920_done:
    rx920_cur."!cursor_fail"()
    rx920_cur."!cursor_debug"("FAIL  ", "infix:sym<ne>")
    .return (rx920_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ne>"  :subid("267_1258264446.59978") :method
.annotate "line", 364
    $P922 = self."!PREFIX__!subrule"("O", "ne")
    new $P923, "ResizablePMCArray"
    push $P923, $P922
    .return ($P923)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<le>"  :subid("268_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx926_tgt
    .local int rx926_pos
    .local int rx926_off
    .local int rx926_eos
    .local int rx926_rep
    .local pmc rx926_cur
    (rx926_cur, rx926_pos, rx926_tgt, $I10) = self."!cursor_start"()
    rx926_cur."!cursor_debug"("START ", "infix:sym<le>")
    .lex unicode:"$\x{a2}", rx926_cur
    .local pmc match
    .lex "$/", match
    length rx926_eos, rx926_tgt
    set rx926_off, 0
    lt $I10, 2, rx926_start
    sub rx926_off, $I10, 1
    substr rx926_tgt, rx926_tgt, rx926_off
  rx926_start:
.annotate "line", 446
  # rx subcapture "sym"
    set_addr $I10, rxcap_930_fail
    rx926_cur."!mark_push"(0, rx926_pos, $I10)
  # rx literal  "le"
    add $I11, rx926_pos, 2
    gt $I11, rx926_eos, rx926_fail
    sub $I11, rx926_pos, rx926_off
    substr $S10, rx926_tgt, $I11, 2
    ne $S10, "le", rx926_fail
    add rx926_pos, 2
    set_addr $I10, rxcap_930_fail
    ($I12, $I11) = rx926_cur."!mark_peek"($I10)
    rx926_cur."!cursor_pos"($I11)
    ($P10) = rx926_cur."!cursor_start"()
    $P10."!cursor_pass"(rx926_pos, "")
    rx926_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_930_done
  rxcap_930_fail:
    goto rx926_fail
  rxcap_930_done:
  # rx subrule "O" subtype=capture negate=
    rx926_cur."!cursor_pos"(rx926_pos)
    $P10 = rx926_cur."O"("%relational, :pirop<isle ISs>")
    unless $P10, rx926_fail
    rx926_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx926_pos = $P10."pos"()
  # rx pass
    rx926_cur."!cursor_pass"(rx926_pos, "infix:sym<le>")
    rx926_cur."!cursor_debug"("PASS  ", "infix:sym<le>", " at pos=", rx926_pos)
    .return (rx926_cur)
  rx926_fail:
.annotate "line", 364
    (rx926_rep, rx926_pos, $I10, $P10) = rx926_cur."!mark_fail"(0)
    lt rx926_pos, -1, rx926_done
    eq rx926_pos, -1, rx926_fail
    jump $I10
  rx926_done:
    rx926_cur."!cursor_fail"()
    rx926_cur."!cursor_debug"("FAIL  ", "infix:sym<le>")
    .return (rx926_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<le>"  :subid("269_1258264446.59978") :method
.annotate "line", 364
    $P928 = self."!PREFIX__!subrule"("O", "le")
    new $P929, "ResizablePMCArray"
    push $P929, $P928
    .return ($P929)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ge>"  :subid("270_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx932_tgt
    .local int rx932_pos
    .local int rx932_off
    .local int rx932_eos
    .local int rx932_rep
    .local pmc rx932_cur
    (rx932_cur, rx932_pos, rx932_tgt, $I10) = self."!cursor_start"()
    rx932_cur."!cursor_debug"("START ", "infix:sym<ge>")
    .lex unicode:"$\x{a2}", rx932_cur
    .local pmc match
    .lex "$/", match
    length rx932_eos, rx932_tgt
    set rx932_off, 0
    lt $I10, 2, rx932_start
    sub rx932_off, $I10, 1
    substr rx932_tgt, rx932_tgt, rx932_off
  rx932_start:
.annotate "line", 447
  # rx subcapture "sym"
    set_addr $I10, rxcap_936_fail
    rx932_cur."!mark_push"(0, rx932_pos, $I10)
  # rx literal  "ge"
    add $I11, rx932_pos, 2
    gt $I11, rx932_eos, rx932_fail
    sub $I11, rx932_pos, rx932_off
    substr $S10, rx932_tgt, $I11, 2
    ne $S10, "ge", rx932_fail
    add rx932_pos, 2
    set_addr $I10, rxcap_936_fail
    ($I12, $I11) = rx932_cur."!mark_peek"($I10)
    rx932_cur."!cursor_pos"($I11)
    ($P10) = rx932_cur."!cursor_start"()
    $P10."!cursor_pass"(rx932_pos, "")
    rx932_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_936_done
  rxcap_936_fail:
    goto rx932_fail
  rxcap_936_done:
  # rx subrule "O" subtype=capture negate=
    rx932_cur."!cursor_pos"(rx932_pos)
    $P10 = rx932_cur."O"("%relational, :pirop<isge ISs>")
    unless $P10, rx932_fail
    rx932_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx932_pos = $P10."pos"()
  # rx pass
    rx932_cur."!cursor_pass"(rx932_pos, "infix:sym<ge>")
    rx932_cur."!cursor_debug"("PASS  ", "infix:sym<ge>", " at pos=", rx932_pos)
    .return (rx932_cur)
  rx932_fail:
.annotate "line", 364
    (rx932_rep, rx932_pos, $I10, $P10) = rx932_cur."!mark_fail"(0)
    lt rx932_pos, -1, rx932_done
    eq rx932_pos, -1, rx932_fail
    jump $I10
  rx932_done:
    rx932_cur."!cursor_fail"()
    rx932_cur."!cursor_debug"("FAIL  ", "infix:sym<ge>")
    .return (rx932_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ge>"  :subid("271_1258264446.59978") :method
.annotate "line", 364
    $P934 = self."!PREFIX__!subrule"("O", "ge")
    new $P935, "ResizablePMCArray"
    push $P935, $P934
    .return ($P935)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<lt>"  :subid("272_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx938_tgt
    .local int rx938_pos
    .local int rx938_off
    .local int rx938_eos
    .local int rx938_rep
    .local pmc rx938_cur
    (rx938_cur, rx938_pos, rx938_tgt, $I10) = self."!cursor_start"()
    rx938_cur."!cursor_debug"("START ", "infix:sym<lt>")
    .lex unicode:"$\x{a2}", rx938_cur
    .local pmc match
    .lex "$/", match
    length rx938_eos, rx938_tgt
    set rx938_off, 0
    lt $I10, 2, rx938_start
    sub rx938_off, $I10, 1
    substr rx938_tgt, rx938_tgt, rx938_off
  rx938_start:
.annotate "line", 448
  # rx subcapture "sym"
    set_addr $I10, rxcap_942_fail
    rx938_cur."!mark_push"(0, rx938_pos, $I10)
  # rx literal  "lt"
    add $I11, rx938_pos, 2
    gt $I11, rx938_eos, rx938_fail
    sub $I11, rx938_pos, rx938_off
    substr $S10, rx938_tgt, $I11, 2
    ne $S10, "lt", rx938_fail
    add rx938_pos, 2
    set_addr $I10, rxcap_942_fail
    ($I12, $I11) = rx938_cur."!mark_peek"($I10)
    rx938_cur."!cursor_pos"($I11)
    ($P10) = rx938_cur."!cursor_start"()
    $P10."!cursor_pass"(rx938_pos, "")
    rx938_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_942_done
  rxcap_942_fail:
    goto rx938_fail
  rxcap_942_done:
  # rx subrule "O" subtype=capture negate=
    rx938_cur."!cursor_pos"(rx938_pos)
    $P10 = rx938_cur."O"("%relational, :pirop<islt ISs>")
    unless $P10, rx938_fail
    rx938_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx938_pos = $P10."pos"()
  # rx pass
    rx938_cur."!cursor_pass"(rx938_pos, "infix:sym<lt>")
    rx938_cur."!cursor_debug"("PASS  ", "infix:sym<lt>", " at pos=", rx938_pos)
    .return (rx938_cur)
  rx938_fail:
.annotate "line", 364
    (rx938_rep, rx938_pos, $I10, $P10) = rx938_cur."!mark_fail"(0)
    lt rx938_pos, -1, rx938_done
    eq rx938_pos, -1, rx938_fail
    jump $I10
  rx938_done:
    rx938_cur."!cursor_fail"()
    rx938_cur."!cursor_debug"("FAIL  ", "infix:sym<lt>")
    .return (rx938_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<lt>"  :subid("273_1258264446.59978") :method
.annotate "line", 364
    $P940 = self."!PREFIX__!subrule"("O", "lt")
    new $P941, "ResizablePMCArray"
    push $P941, $P940
    .return ($P941)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<gt>"  :subid("274_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx944_tgt
    .local int rx944_pos
    .local int rx944_off
    .local int rx944_eos
    .local int rx944_rep
    .local pmc rx944_cur
    (rx944_cur, rx944_pos, rx944_tgt, $I10) = self."!cursor_start"()
    rx944_cur."!cursor_debug"("START ", "infix:sym<gt>")
    .lex unicode:"$\x{a2}", rx944_cur
    .local pmc match
    .lex "$/", match
    length rx944_eos, rx944_tgt
    set rx944_off, 0
    lt $I10, 2, rx944_start
    sub rx944_off, $I10, 1
    substr rx944_tgt, rx944_tgt, rx944_off
  rx944_start:
.annotate "line", 449
  # rx subcapture "sym"
    set_addr $I10, rxcap_948_fail
    rx944_cur."!mark_push"(0, rx944_pos, $I10)
  # rx literal  "gt"
    add $I11, rx944_pos, 2
    gt $I11, rx944_eos, rx944_fail
    sub $I11, rx944_pos, rx944_off
    substr $S10, rx944_tgt, $I11, 2
    ne $S10, "gt", rx944_fail
    add rx944_pos, 2
    set_addr $I10, rxcap_948_fail
    ($I12, $I11) = rx944_cur."!mark_peek"($I10)
    rx944_cur."!cursor_pos"($I11)
    ($P10) = rx944_cur."!cursor_start"()
    $P10."!cursor_pass"(rx944_pos, "")
    rx944_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_948_done
  rxcap_948_fail:
    goto rx944_fail
  rxcap_948_done:
  # rx subrule "O" subtype=capture negate=
    rx944_cur."!cursor_pos"(rx944_pos)
    $P10 = rx944_cur."O"("%relational, :pirop<isgt ISs>")
    unless $P10, rx944_fail
    rx944_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx944_pos = $P10."pos"()
  # rx pass
    rx944_cur."!cursor_pass"(rx944_pos, "infix:sym<gt>")
    rx944_cur."!cursor_debug"("PASS  ", "infix:sym<gt>", " at pos=", rx944_pos)
    .return (rx944_cur)
  rx944_fail:
.annotate "line", 364
    (rx944_rep, rx944_pos, $I10, $P10) = rx944_cur."!mark_fail"(0)
    lt rx944_pos, -1, rx944_done
    eq rx944_pos, -1, rx944_fail
    jump $I10
  rx944_done:
    rx944_cur."!cursor_fail"()
    rx944_cur."!cursor_debug"("FAIL  ", "infix:sym<gt>")
    .return (rx944_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<gt>"  :subid("275_1258264446.59978") :method
.annotate "line", 364
    $P946 = self."!PREFIX__!subrule"("O", "gt")
    new $P947, "ResizablePMCArray"
    push $P947, $P946
    .return ($P947)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=:=>"  :subid("276_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx950_tgt
    .local int rx950_pos
    .local int rx950_off
    .local int rx950_eos
    .local int rx950_rep
    .local pmc rx950_cur
    (rx950_cur, rx950_pos, rx950_tgt, $I10) = self."!cursor_start"()
    rx950_cur."!cursor_debug"("START ", "infix:sym<=:=>")
    .lex unicode:"$\x{a2}", rx950_cur
    .local pmc match
    .lex "$/", match
    length rx950_eos, rx950_tgt
    set rx950_off, 0
    lt $I10, 2, rx950_start
    sub rx950_off, $I10, 1
    substr rx950_tgt, rx950_tgt, rx950_off
  rx950_start:
.annotate "line", 450
  # rx subcapture "sym"
    set_addr $I10, rxcap_954_fail
    rx950_cur."!mark_push"(0, rx950_pos, $I10)
  # rx literal  "=:="
    add $I11, rx950_pos, 3
    gt $I11, rx950_eos, rx950_fail
    sub $I11, rx950_pos, rx950_off
    substr $S10, rx950_tgt, $I11, 3
    ne $S10, "=:=", rx950_fail
    add rx950_pos, 3
    set_addr $I10, rxcap_954_fail
    ($I12, $I11) = rx950_cur."!mark_peek"($I10)
    rx950_cur."!cursor_pos"($I11)
    ($P10) = rx950_cur."!cursor_start"()
    $P10."!cursor_pass"(rx950_pos, "")
    rx950_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_954_done
  rxcap_954_fail:
    goto rx950_fail
  rxcap_954_done:
  # rx subrule "O" subtype=capture negate=
    rx950_cur."!cursor_pos"(rx950_pos)
    $P10 = rx950_cur."O"("%relational, :pirop<issame>")
    unless $P10, rx950_fail
    rx950_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx950_pos = $P10."pos"()
  # rx pass
    rx950_cur."!cursor_pass"(rx950_pos, "infix:sym<=:=>")
    rx950_cur."!cursor_debug"("PASS  ", "infix:sym<=:=>", " at pos=", rx950_pos)
    .return (rx950_cur)
  rx950_fail:
.annotate "line", 364
    (rx950_rep, rx950_pos, $I10, $P10) = rx950_cur."!mark_fail"(0)
    lt rx950_pos, -1, rx950_done
    eq rx950_pos, -1, rx950_fail
    jump $I10
  rx950_done:
    rx950_cur."!cursor_fail"()
    rx950_cur."!cursor_debug"("FAIL  ", "infix:sym<=:=>")
    .return (rx950_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=:=>"  :subid("277_1258264446.59978") :method
.annotate "line", 364
    $P952 = self."!PREFIX__!subrule"("O", "=:=")
    new $P953, "ResizablePMCArray"
    push $P953, $P952
    .return ($P953)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<&&>"  :subid("278_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx956_tgt
    .local int rx956_pos
    .local int rx956_off
    .local int rx956_eos
    .local int rx956_rep
    .local pmc rx956_cur
    (rx956_cur, rx956_pos, rx956_tgt, $I10) = self."!cursor_start"()
    rx956_cur."!cursor_debug"("START ", "infix:sym<&&>")
    .lex unicode:"$\x{a2}", rx956_cur
    .local pmc match
    .lex "$/", match
    length rx956_eos, rx956_tgt
    set rx956_off, 0
    lt $I10, 2, rx956_start
    sub rx956_off, $I10, 1
    substr rx956_tgt, rx956_tgt, rx956_off
  rx956_start:
.annotate "line", 452
  # rx subcapture "sym"
    set_addr $I10, rxcap_960_fail
    rx956_cur."!mark_push"(0, rx956_pos, $I10)
  # rx literal  "&&"
    add $I11, rx956_pos, 2
    gt $I11, rx956_eos, rx956_fail
    sub $I11, rx956_pos, rx956_off
    substr $S10, rx956_tgt, $I11, 2
    ne $S10, "&&", rx956_fail
    add rx956_pos, 2
    set_addr $I10, rxcap_960_fail
    ($I12, $I11) = rx956_cur."!mark_peek"($I10)
    rx956_cur."!cursor_pos"($I11)
    ($P10) = rx956_cur."!cursor_start"()
    $P10."!cursor_pass"(rx956_pos, "")
    rx956_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_960_done
  rxcap_960_fail:
    goto rx956_fail
  rxcap_960_done:
  # rx subrule "O" subtype=capture negate=
    rx956_cur."!cursor_pos"(rx956_pos)
    $P10 = rx956_cur."O"("%tight_and, :pasttype<if>")
    unless $P10, rx956_fail
    rx956_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx956_pos = $P10."pos"()
  # rx pass
    rx956_cur."!cursor_pass"(rx956_pos, "infix:sym<&&>")
    rx956_cur."!cursor_debug"("PASS  ", "infix:sym<&&>", " at pos=", rx956_pos)
    .return (rx956_cur)
  rx956_fail:
.annotate "line", 364
    (rx956_rep, rx956_pos, $I10, $P10) = rx956_cur."!mark_fail"(0)
    lt rx956_pos, -1, rx956_done
    eq rx956_pos, -1, rx956_fail
    jump $I10
  rx956_done:
    rx956_cur."!cursor_fail"()
    rx956_cur."!cursor_debug"("FAIL  ", "infix:sym<&&>")
    .return (rx956_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<&&>"  :subid("279_1258264446.59978") :method
.annotate "line", 364
    $P958 = self."!PREFIX__!subrule"("O", "&&")
    new $P959, "ResizablePMCArray"
    push $P959, $P958
    .return ($P959)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<||>"  :subid("280_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx962_tgt
    .local int rx962_pos
    .local int rx962_off
    .local int rx962_eos
    .local int rx962_rep
    .local pmc rx962_cur
    (rx962_cur, rx962_pos, rx962_tgt, $I10) = self."!cursor_start"()
    rx962_cur."!cursor_debug"("START ", "infix:sym<||>")
    .lex unicode:"$\x{a2}", rx962_cur
    .local pmc match
    .lex "$/", match
    length rx962_eos, rx962_tgt
    set rx962_off, 0
    lt $I10, 2, rx962_start
    sub rx962_off, $I10, 1
    substr rx962_tgt, rx962_tgt, rx962_off
  rx962_start:
.annotate "line", 454
  # rx subcapture "sym"
    set_addr $I10, rxcap_966_fail
    rx962_cur."!mark_push"(0, rx962_pos, $I10)
  # rx literal  "||"
    add $I11, rx962_pos, 2
    gt $I11, rx962_eos, rx962_fail
    sub $I11, rx962_pos, rx962_off
    substr $S10, rx962_tgt, $I11, 2
    ne $S10, "||", rx962_fail
    add rx962_pos, 2
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
  # rx subrule "O" subtype=capture negate=
    rx962_cur."!cursor_pos"(rx962_pos)
    $P10 = rx962_cur."O"("%tight_or, :pasttype<unless>")
    unless $P10, rx962_fail
    rx962_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx962_pos = $P10."pos"()
  # rx pass
    rx962_cur."!cursor_pass"(rx962_pos, "infix:sym<||>")
    rx962_cur."!cursor_debug"("PASS  ", "infix:sym<||>", " at pos=", rx962_pos)
    .return (rx962_cur)
  rx962_fail:
.annotate "line", 364
    (rx962_rep, rx962_pos, $I10, $P10) = rx962_cur."!mark_fail"(0)
    lt rx962_pos, -1, rx962_done
    eq rx962_pos, -1, rx962_fail
    jump $I10
  rx962_done:
    rx962_cur."!cursor_fail"()
    rx962_cur."!cursor_debug"("FAIL  ", "infix:sym<||>")
    .return (rx962_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<||>"  :subid("281_1258264446.59978") :method
.annotate "line", 364
    $P964 = self."!PREFIX__!subrule"("O", "||")
    new $P965, "ResizablePMCArray"
    push $P965, $P964
    .return ($P965)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<//>"  :subid("282_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx968_tgt
    .local int rx968_pos
    .local int rx968_off
    .local int rx968_eos
    .local int rx968_rep
    .local pmc rx968_cur
    (rx968_cur, rx968_pos, rx968_tgt, $I10) = self."!cursor_start"()
    rx968_cur."!cursor_debug"("START ", "infix:sym<//>")
    .lex unicode:"$\x{a2}", rx968_cur
    .local pmc match
    .lex "$/", match
    length rx968_eos, rx968_tgt
    set rx968_off, 0
    lt $I10, 2, rx968_start
    sub rx968_off, $I10, 1
    substr rx968_tgt, rx968_tgt, rx968_off
  rx968_start:
.annotate "line", 455
  # rx subcapture "sym"
    set_addr $I10, rxcap_972_fail
    rx968_cur."!mark_push"(0, rx968_pos, $I10)
  # rx literal  "//"
    add $I11, rx968_pos, 2
    gt $I11, rx968_eos, rx968_fail
    sub $I11, rx968_pos, rx968_off
    substr $S10, rx968_tgt, $I11, 2
    ne $S10, "//", rx968_fail
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
    $P10 = rx968_cur."O"("%tight_or, :pasttype<def_or>")
    unless $P10, rx968_fail
    rx968_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx968_pos = $P10."pos"()
  # rx pass
    rx968_cur."!cursor_pass"(rx968_pos, "infix:sym<//>")
    rx968_cur."!cursor_debug"("PASS  ", "infix:sym<//>", " at pos=", rx968_pos)
    .return (rx968_cur)
  rx968_fail:
.annotate "line", 364
    (rx968_rep, rx968_pos, $I10, $P10) = rx968_cur."!mark_fail"(0)
    lt rx968_pos, -1, rx968_done
    eq rx968_pos, -1, rx968_fail
    jump $I10
  rx968_done:
    rx968_cur."!cursor_fail"()
    rx968_cur."!cursor_debug"("FAIL  ", "infix:sym<//>")
    .return (rx968_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<//>"  :subid("283_1258264446.59978") :method
.annotate "line", 364
    $P970 = self."!PREFIX__!subrule"("O", "//")
    new $P971, "ResizablePMCArray"
    push $P971, $P970
    .return ($P971)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<?? !!>"  :subid("284_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx974_tgt
    .local int rx974_pos
    .local int rx974_off
    .local int rx974_eos
    .local int rx974_rep
    .local pmc rx974_cur
    (rx974_cur, rx974_pos, rx974_tgt, $I10) = self."!cursor_start"()
    rx974_cur."!cursor_debug"("START ", "infix:sym<?? !!>")
    .lex unicode:"$\x{a2}", rx974_cur
    .local pmc match
    .lex "$/", match
    length rx974_eos, rx974_tgt
    set rx974_off, 0
    lt $I10, 2, rx974_start
    sub rx974_off, $I10, 1
    substr rx974_tgt, rx974_tgt, rx974_off
  rx974_start:
.annotate "line", 458
  # rx literal  "??"
    add $I11, rx974_pos, 2
    gt $I11, rx974_eos, rx974_fail
    sub $I11, rx974_pos, rx974_off
    substr $S10, rx974_tgt, $I11, 2
    ne $S10, "??", rx974_fail
    add rx974_pos, 2
.annotate "line", 459
  # rx subrule "ws" subtype=method negate=
    rx974_cur."!cursor_pos"(rx974_pos)
    $P10 = rx974_cur."ws"()
    unless $P10, rx974_fail
    rx974_pos = $P10."pos"()
.annotate "line", 460
  # rx subrule "EXPR" subtype=capture negate=
    rx974_cur."!cursor_pos"(rx974_pos)
    $P10 = rx974_cur."EXPR"("i=")
    unless $P10, rx974_fail
    rx974_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx974_pos = $P10."pos"()
.annotate "line", 461
  # rx literal  "!!"
    add $I11, rx974_pos, 2
    gt $I11, rx974_eos, rx974_fail
    sub $I11, rx974_pos, rx974_off
    substr $S10, rx974_tgt, $I11, 2
    ne $S10, "!!", rx974_fail
    add rx974_pos, 2
.annotate "line", 462
  # rx subrule "O" subtype=capture negate=
    rx974_cur."!cursor_pos"(rx974_pos)
    $P10 = rx974_cur."O"("%conditional, :reducecheck<ternary>, :pasttype<if>")
    unless $P10, rx974_fail
    rx974_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx974_pos = $P10."pos"()
.annotate "line", 457
  # rx pass
    rx974_cur."!cursor_pass"(rx974_pos, "infix:sym<?? !!>")
    rx974_cur."!cursor_debug"("PASS  ", "infix:sym<?? !!>", " at pos=", rx974_pos)
    .return (rx974_cur)
  rx974_fail:
.annotate "line", 364
    (rx974_rep, rx974_pos, $I10, $P10) = rx974_cur."!mark_fail"(0)
    lt rx974_pos, -1, rx974_done
    eq rx974_pos, -1, rx974_fail
    jump $I10
  rx974_done:
    rx974_cur."!cursor_fail"()
    rx974_cur."!cursor_debug"("FAIL  ", "infix:sym<?? !!>")
    .return (rx974_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<?? !!>"  :subid("285_1258264446.59978") :method
.annotate "line", 364
    $P976 = self."!PREFIX__!subrule"("", "??")
    new $P977, "ResizablePMCArray"
    push $P977, $P976
    .return ($P977)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=>"  :subid("286_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx979_tgt
    .local int rx979_pos
    .local int rx979_off
    .local int rx979_eos
    .local int rx979_rep
    .local pmc rx979_cur
    (rx979_cur, rx979_pos, rx979_tgt, $I10) = self."!cursor_start"()
    rx979_cur."!cursor_debug"("START ", "infix:sym<=>")
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
  # rx literal  "="
    add $I11, rx979_pos, 1
    gt $I11, rx979_eos, rx979_fail
    sub $I11, rx979_pos, rx979_off
    substr $S10, rx979_tgt, $I11, 1
    ne $S10, "=", rx979_fail
    add rx979_pos, 1
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
  # rx subrule "panic" subtype=method negate=
    rx979_cur."!cursor_pos"(rx979_pos)
    $P10 = rx979_cur."panic"("Assignment (\"=\") not supported in NQP, use \":=\" instead")
    unless $P10, rx979_fail
    rx979_pos = $P10."pos"()
.annotate "line", 465
  # rx pass
    rx979_cur."!cursor_pass"(rx979_pos, "infix:sym<=>")
    rx979_cur."!cursor_debug"("PASS  ", "infix:sym<=>", " at pos=", rx979_pos)
    .return (rx979_cur)
  rx979_fail:
.annotate "line", 364
    (rx979_rep, rx979_pos, $I10, $P10) = rx979_cur."!mark_fail"(0)
    lt rx979_pos, -1, rx979_done
    eq rx979_pos, -1, rx979_fail
    jump $I10
  rx979_done:
    rx979_cur."!cursor_fail"()
    rx979_cur."!cursor_debug"("FAIL  ", "infix:sym<=>")
    .return (rx979_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=>"  :subid("287_1258264446.59978") :method
.annotate "line", 364
    $P981 = self."!PREFIX__!subrule"("", "=")
    new $P982, "ResizablePMCArray"
    push $P982, $P981
    .return ($P982)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<:=>"  :subid("288_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx985_tgt
    .local int rx985_pos
    .local int rx985_off
    .local int rx985_eos
    .local int rx985_rep
    .local pmc rx985_cur
    (rx985_cur, rx985_pos, rx985_tgt, $I10) = self."!cursor_start"()
    rx985_cur."!cursor_debug"("START ", "infix:sym<:=>")
    .lex unicode:"$\x{a2}", rx985_cur
    .local pmc match
    .lex "$/", match
    length rx985_eos, rx985_tgt
    set rx985_off, 0
    lt $I10, 2, rx985_start
    sub rx985_off, $I10, 1
    substr rx985_tgt, rx985_tgt, rx985_off
  rx985_start:
.annotate "line", 468
  # rx subcapture "sym"
    set_addr $I10, rxcap_989_fail
    rx985_cur."!mark_push"(0, rx985_pos, $I10)
  # rx literal  ":="
    add $I11, rx985_pos, 2
    gt $I11, rx985_eos, rx985_fail
    sub $I11, rx985_pos, rx985_off
    substr $S10, rx985_tgt, $I11, 2
    ne $S10, ":=", rx985_fail
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
    $P10 = rx985_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx985_fail
    rx985_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx985_pos = $P10."pos"()
  # rx pass
    rx985_cur."!cursor_pass"(rx985_pos, "infix:sym<:=>")
    rx985_cur."!cursor_debug"("PASS  ", "infix:sym<:=>", " at pos=", rx985_pos)
    .return (rx985_cur)
  rx985_fail:
.annotate "line", 364
    (rx985_rep, rx985_pos, $I10, $P10) = rx985_cur."!mark_fail"(0)
    lt rx985_pos, -1, rx985_done
    eq rx985_pos, -1, rx985_fail
    jump $I10
  rx985_done:
    rx985_cur."!cursor_fail"()
    rx985_cur."!cursor_debug"("FAIL  ", "infix:sym<:=>")
    .return (rx985_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<:=>"  :subid("289_1258264446.59978") :method
.annotate "line", 364
    $P987 = self."!PREFIX__!subrule"("O", ":=")
    new $P988, "ResizablePMCArray"
    push $P988, $P987
    .return ($P988)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<::=>"  :subid("290_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx991_tgt
    .local int rx991_pos
    .local int rx991_off
    .local int rx991_eos
    .local int rx991_rep
    .local pmc rx991_cur
    (rx991_cur, rx991_pos, rx991_tgt, $I10) = self."!cursor_start"()
    rx991_cur."!cursor_debug"("START ", "infix:sym<::=>")
    .lex unicode:"$\x{a2}", rx991_cur
    .local pmc match
    .lex "$/", match
    length rx991_eos, rx991_tgt
    set rx991_off, 0
    lt $I10, 2, rx991_start
    sub rx991_off, $I10, 1
    substr rx991_tgt, rx991_tgt, rx991_off
  rx991_start:
.annotate "line", 469
  # rx subcapture "sym"
    set_addr $I10, rxcap_995_fail
    rx991_cur."!mark_push"(0, rx991_pos, $I10)
  # rx literal  "::="
    add $I11, rx991_pos, 3
    gt $I11, rx991_eos, rx991_fail
    sub $I11, rx991_pos, rx991_off
    substr $S10, rx991_tgt, $I11, 3
    ne $S10, "::=", rx991_fail
    add rx991_pos, 3
    set_addr $I10, rxcap_995_fail
    ($I12, $I11) = rx991_cur."!mark_peek"($I10)
    rx991_cur."!cursor_pos"($I11)
    ($P10) = rx991_cur."!cursor_start"()
    $P10."!cursor_pass"(rx991_pos, "")
    rx991_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_995_done
  rxcap_995_fail:
    goto rx991_fail
  rxcap_995_done:
  # rx subrule "O" subtype=capture negate=
    rx991_cur."!cursor_pos"(rx991_pos)
    $P10 = rx991_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx991_fail
    rx991_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx991_pos = $P10."pos"()
  # rx pass
    rx991_cur."!cursor_pass"(rx991_pos, "infix:sym<::=>")
    rx991_cur."!cursor_debug"("PASS  ", "infix:sym<::=>", " at pos=", rx991_pos)
    .return (rx991_cur)
  rx991_fail:
.annotate "line", 364
    (rx991_rep, rx991_pos, $I10, $P10) = rx991_cur."!mark_fail"(0)
    lt rx991_pos, -1, rx991_done
    eq rx991_pos, -1, rx991_fail
    jump $I10
  rx991_done:
    rx991_cur."!cursor_fail"()
    rx991_cur."!cursor_debug"("FAIL  ", "infix:sym<::=>")
    .return (rx991_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<::=>"  :subid("291_1258264446.59978") :method
.annotate "line", 364
    $P993 = self."!PREFIX__!subrule"("O", "::=")
    new $P994, "ResizablePMCArray"
    push $P994, $P993
    .return ($P994)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<,>"  :subid("292_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx997_tgt
    .local int rx997_pos
    .local int rx997_off
    .local int rx997_eos
    .local int rx997_rep
    .local pmc rx997_cur
    (rx997_cur, rx997_pos, rx997_tgt, $I10) = self."!cursor_start"()
    rx997_cur."!cursor_debug"("START ", "infix:sym<,>")
    .lex unicode:"$\x{a2}", rx997_cur
    .local pmc match
    .lex "$/", match
    length rx997_eos, rx997_tgt
    set rx997_off, 0
    lt $I10, 2, rx997_start
    sub rx997_off, $I10, 1
    substr rx997_tgt, rx997_tgt, rx997_off
  rx997_start:
.annotate "line", 471
  # rx subcapture "sym"
    set_addr $I10, rxcap_1001_fail
    rx997_cur."!mark_push"(0, rx997_pos, $I10)
  # rx literal  ","
    add $I11, rx997_pos, 1
    gt $I11, rx997_eos, rx997_fail
    sub $I11, rx997_pos, rx997_off
    substr $S10, rx997_tgt, $I11, 1
    ne $S10, ",", rx997_fail
    add rx997_pos, 1
    set_addr $I10, rxcap_1001_fail
    ($I12, $I11) = rx997_cur."!mark_peek"($I10)
    rx997_cur."!cursor_pos"($I11)
    ($P10) = rx997_cur."!cursor_start"()
    $P10."!cursor_pass"(rx997_pos, "")
    rx997_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1001_done
  rxcap_1001_fail:
    goto rx997_fail
  rxcap_1001_done:
  # rx subrule "O" subtype=capture negate=
    rx997_cur."!cursor_pos"(rx997_pos)
    $P10 = rx997_cur."O"("%comma, :pasttype<list>")
    unless $P10, rx997_fail
    rx997_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx997_pos = $P10."pos"()
  # rx pass
    rx997_cur."!cursor_pass"(rx997_pos, "infix:sym<,>")
    rx997_cur."!cursor_debug"("PASS  ", "infix:sym<,>", " at pos=", rx997_pos)
    .return (rx997_cur)
  rx997_fail:
.annotate "line", 364
    (rx997_rep, rx997_pos, $I10, $P10) = rx997_cur."!mark_fail"(0)
    lt rx997_pos, -1, rx997_done
    eq rx997_pos, -1, rx997_fail
    jump $I10
  rx997_done:
    rx997_cur."!cursor_fail"()
    rx997_cur."!cursor_debug"("FAIL  ", "infix:sym<,>")
    .return (rx997_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<,>"  :subid("293_1258264446.59978") :method
.annotate "line", 364
    $P999 = self."!PREFIX__!subrule"("O", ",")
    new $P1000, "ResizablePMCArray"
    push $P1000, $P999
    .return ($P1000)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<return>"  :subid("294_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx1003_tgt
    .local int rx1003_pos
    .local int rx1003_off
    .local int rx1003_eos
    .local int rx1003_rep
    .local pmc rx1003_cur
    (rx1003_cur, rx1003_pos, rx1003_tgt, $I10) = self."!cursor_start"()
    rx1003_cur."!cursor_debug"("START ", "prefix:sym<return>")
    .lex unicode:"$\x{a2}", rx1003_cur
    .local pmc match
    .lex "$/", match
    length rx1003_eos, rx1003_tgt
    set rx1003_off, 0
    lt $I10, 2, rx1003_start
    sub rx1003_off, $I10, 1
    substr rx1003_tgt, rx1003_tgt, rx1003_off
  rx1003_start:
.annotate "line", 473
  # rx subcapture "sym"
    set_addr $I10, rxcap_1006_fail
    rx1003_cur."!mark_push"(0, rx1003_pos, $I10)
  # rx literal  "return"
    add $I11, rx1003_pos, 6
    gt $I11, rx1003_eos, rx1003_fail
    sub $I11, rx1003_pos, rx1003_off
    substr $S10, rx1003_tgt, $I11, 6
    ne $S10, "return", rx1003_fail
    add rx1003_pos, 6
    set_addr $I10, rxcap_1006_fail
    ($I12, $I11) = rx1003_cur."!mark_peek"($I10)
    rx1003_cur."!cursor_pos"($I11)
    ($P10) = rx1003_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1003_pos, "")
    rx1003_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1006_done
  rxcap_1006_fail:
    goto rx1003_fail
  rxcap_1006_done:
  # rx charclass s
    ge rx1003_pos, rx1003_eos, rx1003_fail
    sub $I10, rx1003_pos, rx1003_off
    is_cclass $I11, 32, rx1003_tgt, $I10
    unless $I11, rx1003_fail
    inc rx1003_pos
  # rx subrule "O" subtype=capture negate=
    rx1003_cur."!cursor_pos"(rx1003_pos)
    $P10 = rx1003_cur."O"("%list_prefix, :pasttype<return>")
    unless $P10, rx1003_fail
    rx1003_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1003_pos = $P10."pos"()
  # rx pass
    rx1003_cur."!cursor_pass"(rx1003_pos, "prefix:sym<return>")
    rx1003_cur."!cursor_debug"("PASS  ", "prefix:sym<return>", " at pos=", rx1003_pos)
    .return (rx1003_cur)
  rx1003_fail:
.annotate "line", 364
    (rx1003_rep, rx1003_pos, $I10, $P10) = rx1003_cur."!mark_fail"(0)
    lt rx1003_pos, -1, rx1003_done
    eq rx1003_pos, -1, rx1003_fail
    jump $I10
  rx1003_done:
    rx1003_cur."!cursor_fail"()
    rx1003_cur."!cursor_debug"("FAIL  ", "prefix:sym<return>")
    .return (rx1003_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<return>"  :subid("295_1258264446.59978") :method
.annotate "line", 364
    new $P1005, "ResizablePMCArray"
    push $P1005, "return"
    .return ($P1005)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<make>"  :subid("296_1258264446.59978") :method :outer("11_1258264446.59978")
.annotate "line", 364
    .local string rx1008_tgt
    .local int rx1008_pos
    .local int rx1008_off
    .local int rx1008_eos
    .local int rx1008_rep
    .local pmc rx1008_cur
    (rx1008_cur, rx1008_pos, rx1008_tgt, $I10) = self."!cursor_start"()
    rx1008_cur."!cursor_debug"("START ", "prefix:sym<make>")
    .lex unicode:"$\x{a2}", rx1008_cur
    .local pmc match
    .lex "$/", match
    length rx1008_eos, rx1008_tgt
    set rx1008_off, 0
    lt $I10, 2, rx1008_start
    sub rx1008_off, $I10, 1
    substr rx1008_tgt, rx1008_tgt, rx1008_off
  rx1008_start:
.annotate "line", 474
  # rx subcapture "sym"
    set_addr $I10, rxcap_1011_fail
    rx1008_cur."!mark_push"(0, rx1008_pos, $I10)
  # rx literal  "make"
    add $I11, rx1008_pos, 4
    gt $I11, rx1008_eos, rx1008_fail
    sub $I11, rx1008_pos, rx1008_off
    substr $S10, rx1008_tgt, $I11, 4
    ne $S10, "make", rx1008_fail
    add rx1008_pos, 4
    set_addr $I10, rxcap_1011_fail
    ($I12, $I11) = rx1008_cur."!mark_peek"($I10)
    rx1008_cur."!cursor_pos"($I11)
    ($P10) = rx1008_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1008_pos, "")
    rx1008_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1011_done
  rxcap_1011_fail:
    goto rx1008_fail
  rxcap_1011_done:
  # rx charclass s
    ge rx1008_pos, rx1008_eos, rx1008_fail
    sub $I10, rx1008_pos, rx1008_off
    is_cclass $I11, 32, rx1008_tgt, $I10
    unless $I11, rx1008_fail
    inc rx1008_pos
  # rx subrule "O" subtype=capture negate=
    rx1008_cur."!cursor_pos"(rx1008_pos)
    $P10 = rx1008_cur."O"("%list_prefix")
    unless $P10, rx1008_fail
    rx1008_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1008_pos = $P10."pos"()
  # rx pass
    rx1008_cur."!cursor_pass"(rx1008_pos, "prefix:sym<make>")
    rx1008_cur."!cursor_debug"("PASS  ", "prefix:sym<make>", " at pos=", rx1008_pos)
    .return (rx1008_cur)
  rx1008_fail:
.annotate "line", 364
    (rx1008_rep, rx1008_pos, $I10, $P10) = rx1008_cur."!mark_fail"(0)
    lt rx1008_pos, -1, rx1008_done
    eq rx1008_pos, -1, rx1008_fail
    jump $I10
  rx1008_done:
    rx1008_cur."!cursor_fail"()
    rx1008_cur."!cursor_debug"("FAIL  ", "prefix:sym<make>")
    .return (rx1008_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<make>"  :subid("297_1258264446.59978") :method
.annotate "line", 364
    new $P1010, "ResizablePMCArray"
    push $P1010, "make"
    .return ($P1010)
.end


.namespace ["NQP";"Regex"]
.sub "_block1012"  :subid("298_1258264446.59978") :outer("11_1258264446.59978")
.annotate "line", 477
    .const 'Sub' $P1042 = "309_1258264446.59978" 
    capture_lex $P1042
    .const 'Sub' $P1030 = "306_1258264446.59978" 
    capture_lex $P1030
    .const 'Sub' $P1026 = "304_1258264446.59978" 
    capture_lex $P1026
    .const 'Sub' $P1022 = "302_1258264446.59978" 
    capture_lex $P1022
    .const 'Sub' $P1014 = "299_1258264446.59978" 
    capture_lex $P1014
    .const 'Sub' $P1042 = "309_1258264446.59978" 
    capture_lex $P1042
    .return ($P1042)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<:my>"  :subid("299_1258264446.59978") :method :outer("298_1258264446.59978")
.annotate "line", 477
    .const 'Sub' $P1019 = "301_1258264446.59978" 
    capture_lex $P1019
    .local string rx1015_tgt
    .local int rx1015_pos
    .local int rx1015_off
    .local int rx1015_eos
    .local int rx1015_rep
    .local pmc rx1015_cur
    (rx1015_cur, rx1015_pos, rx1015_tgt, $I10) = self."!cursor_start"()
    rx1015_cur."!cursor_debug"("START ", "metachar:sym<:my>")
    .lex unicode:"$\x{a2}", rx1015_cur
    .local pmc match
    .lex "$/", match
    length rx1015_eos, rx1015_tgt
    set rx1015_off, 0
    lt $I10, 2, rx1015_start
    sub rx1015_off, $I10, 1
    substr rx1015_tgt, rx1015_tgt, rx1015_off
  rx1015_start:
.annotate "line", 479
  # rx literal  ":"
    add $I11, rx1015_pos, 1
    gt $I11, rx1015_eos, rx1015_fail
    sub $I11, rx1015_pos, rx1015_off
    substr $S10, rx1015_tgt, $I11, 1
    ne $S10, ":", rx1015_fail
    add rx1015_pos, 1
  # rx subrule "before" subtype=zerowidth negate=
    rx1015_cur."!cursor_pos"(rx1015_pos)
    .const 'Sub' $P1019 = "301_1258264446.59978" 
    capture_lex $P1019
    $P10 = rx1015_cur."before"($P1019)
    unless $P10, rx1015_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1015_cur."!cursor_pos"(rx1015_pos)
    $P10 = rx1015_cur."LANG"("MAIN", "statement")
    unless $P10, rx1015_fail
    rx1015_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx1015_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1015_cur."!cursor_pos"(rx1015_pos)
    $P10 = rx1015_cur."ws"()
    unless $P10, rx1015_fail
    rx1015_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx1015_pos, 1
    gt $I11, rx1015_eos, rx1015_fail
    sub $I11, rx1015_pos, rx1015_off
    substr $S10, rx1015_tgt, $I11, 1
    ne $S10, ";", rx1015_fail
    add rx1015_pos, 1
.annotate "line", 478
  # rx pass
    rx1015_cur."!cursor_pass"(rx1015_pos, "metachar:sym<:my>")
    rx1015_cur."!cursor_debug"("PASS  ", "metachar:sym<:my>", " at pos=", rx1015_pos)
    .return (rx1015_cur)
  rx1015_fail:
.annotate "line", 477
    (rx1015_rep, rx1015_pos, $I10, $P10) = rx1015_cur."!mark_fail"(0)
    lt rx1015_pos, -1, rx1015_done
    eq rx1015_pos, -1, rx1015_fail
    jump $I10
  rx1015_done:
    rx1015_cur."!cursor_fail"()
    rx1015_cur."!cursor_debug"("FAIL  ", "metachar:sym<:my>")
    .return (rx1015_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<:my>"  :subid("300_1258264446.59978") :method
.annotate "line", 477
    new $P1017, "ResizablePMCArray"
    push $P1017, ":"
    .return ($P1017)
.end


.namespace ["NQP";"Regex"]
.sub "_block1018"  :anon :subid("301_1258264446.59978") :method :outer("299_1258264446.59978")
.annotate "line", 479
    .local string rx1020_tgt
    .local int rx1020_pos
    .local int rx1020_off
    .local int rx1020_eos
    .local int rx1020_rep
    .local pmc rx1020_cur
    (rx1020_cur, rx1020_pos, rx1020_tgt, $I10) = self."!cursor_start"()
    rx1020_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1020_cur
    .local pmc match
    .lex "$/", match
    length rx1020_eos, rx1020_tgt
    set rx1020_off, 0
    lt $I10, 2, rx1020_start
    sub rx1020_off, $I10, 1
    substr rx1020_tgt, rx1020_tgt, rx1020_off
  rx1020_start:
    ge rx1020_pos, 0, rxscan1021_done
  rxscan1021_loop:
    ($P10) = rx1020_cur."from"()
    inc $P10
    set rx1020_pos, $P10
    ge rx1020_pos, rx1020_eos, rxscan1021_done
    set_addr $I10, rxscan1021_loop
    rx1020_cur."!mark_push"(0, rx1020_pos, $I10)
  rxscan1021_done:
  # rx literal  "my"
    add $I11, rx1020_pos, 2
    gt $I11, rx1020_eos, rx1020_fail
    sub $I11, rx1020_pos, rx1020_off
    substr $S10, rx1020_tgt, $I11, 2
    ne $S10, "my", rx1020_fail
    add rx1020_pos, 2
  # rx pass
    rx1020_cur."!cursor_pass"(rx1020_pos, "")
    rx1020_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1020_pos)
    .return (rx1020_cur)
  rx1020_fail:
    (rx1020_rep, rx1020_pos, $I10, $P10) = rx1020_cur."!mark_fail"(0)
    lt rx1020_pos, -1, rx1020_done
    eq rx1020_pos, -1, rx1020_fail
    jump $I10
  rx1020_done:
    rx1020_cur."!cursor_fail"()
    rx1020_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1020_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<{ }>"  :subid("302_1258264446.59978") :method :outer("298_1258264446.59978")
.annotate "line", 477
    .local string rx1023_tgt
    .local int rx1023_pos
    .local int rx1023_off
    .local int rx1023_eos
    .local int rx1023_rep
    .local pmc rx1023_cur
    (rx1023_cur, rx1023_pos, rx1023_tgt, $I10) = self."!cursor_start"()
    rx1023_cur."!cursor_debug"("START ", "metachar:sym<{ }>")
    .lex unicode:"$\x{a2}", rx1023_cur
    .local pmc match
    .lex "$/", match
    length rx1023_eos, rx1023_tgt
    set rx1023_off, 0
    lt $I10, 2, rx1023_start
    sub rx1023_off, $I10, 1
    substr rx1023_tgt, rx1023_tgt, rx1023_off
  rx1023_start:
.annotate "line", 483
  # rx enumcharlist negate=0 zerowidth
    ge rx1023_pos, rx1023_eos, rx1023_fail
    sub $I10, rx1023_pos, rx1023_off
    substr $S10, rx1023_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1023_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1023_cur."!cursor_pos"(rx1023_pos)
    $P10 = rx1023_cur."codeblock"()
    unless $P10, rx1023_fail
    rx1023_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1023_pos = $P10."pos"()
.annotate "line", 482
  # rx pass
    rx1023_cur."!cursor_pass"(rx1023_pos, "metachar:sym<{ }>")
    rx1023_cur."!cursor_debug"("PASS  ", "metachar:sym<{ }>", " at pos=", rx1023_pos)
    .return (rx1023_cur)
  rx1023_fail:
.annotate "line", 477
    (rx1023_rep, rx1023_pos, $I10, $P10) = rx1023_cur."!mark_fail"(0)
    lt rx1023_pos, -1, rx1023_done
    eq rx1023_pos, -1, rx1023_fail
    jump $I10
  rx1023_done:
    rx1023_cur."!cursor_fail"()
    rx1023_cur."!cursor_debug"("FAIL  ", "metachar:sym<{ }>")
    .return (rx1023_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<{ }>"  :subid("303_1258264446.59978") :method
.annotate "line", 477
    new $P1025, "ResizablePMCArray"
    push $P1025, "{"
    .return ($P1025)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<{ }>"  :subid("304_1258264446.59978") :method :outer("298_1258264446.59978")
.annotate "line", 477
    .local string rx1027_tgt
    .local int rx1027_pos
    .local int rx1027_off
    .local int rx1027_eos
    .local int rx1027_rep
    .local pmc rx1027_cur
    (rx1027_cur, rx1027_pos, rx1027_tgt, $I10) = self."!cursor_start"()
    rx1027_cur."!cursor_debug"("START ", "assertion:sym<{ }>")
    .lex unicode:"$\x{a2}", rx1027_cur
    .local pmc match
    .lex "$/", match
    length rx1027_eos, rx1027_tgt
    set rx1027_off, 0
    lt $I10, 2, rx1027_start
    sub rx1027_off, $I10, 1
    substr rx1027_tgt, rx1027_tgt, rx1027_off
  rx1027_start:
.annotate "line", 487
  # rx enumcharlist negate=0 zerowidth
    ge rx1027_pos, rx1027_eos, rx1027_fail
    sub $I10, rx1027_pos, rx1027_off
    substr $S10, rx1027_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1027_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1027_cur."!cursor_pos"(rx1027_pos)
    $P10 = rx1027_cur."codeblock"()
    unless $P10, rx1027_fail
    rx1027_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1027_pos = $P10."pos"()
.annotate "line", 486
  # rx pass
    rx1027_cur."!cursor_pass"(rx1027_pos, "assertion:sym<{ }>")
    rx1027_cur."!cursor_debug"("PASS  ", "assertion:sym<{ }>", " at pos=", rx1027_pos)
    .return (rx1027_cur)
  rx1027_fail:
.annotate "line", 477
    (rx1027_rep, rx1027_pos, $I10, $P10) = rx1027_cur."!mark_fail"(0)
    lt rx1027_pos, -1, rx1027_done
    eq rx1027_pos, -1, rx1027_fail
    jump $I10
  rx1027_done:
    rx1027_cur."!cursor_fail"()
    rx1027_cur."!cursor_debug"("FAIL  ", "assertion:sym<{ }>")
    .return (rx1027_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<{ }>"  :subid("305_1258264446.59978") :method
.annotate "line", 477
    new $P1029, "ResizablePMCArray"
    push $P1029, "{"
    .return ($P1029)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<name>"  :subid("306_1258264446.59978") :method :outer("298_1258264446.59978")
.annotate "line", 477
    .const 'Sub' $P1038 = "308_1258264446.59978" 
    capture_lex $P1038
    .local string rx1031_tgt
    .local int rx1031_pos
    .local int rx1031_off
    .local int rx1031_eos
    .local int rx1031_rep
    .local pmc rx1031_cur
    (rx1031_cur, rx1031_pos, rx1031_tgt, $I10) = self."!cursor_start"()
    rx1031_cur."!cursor_debug"("START ", "assertion:sym<name>")
    rx1031_cur."!cursor_caparray"("nibbler", "arglist", "assertion")
    .lex unicode:"$\x{a2}", rx1031_cur
    .local pmc match
    .lex "$/", match
    length rx1031_eos, rx1031_tgt
    set rx1031_off, 0
    lt $I10, 2, rx1031_start
    sub rx1031_off, $I10, 1
    substr rx1031_tgt, rx1031_tgt, rx1031_off
  rx1031_start:
.annotate "line", 491
  # rx subcapture "longname"
    set_addr $I10, rxcap_1034_fail
    rx1031_cur."!mark_push"(0, rx1031_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx1031_pos, rx1031_off
    find_not_cclass $I11, 8192, rx1031_tgt, $I10, rx1031_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1031_fail
    add rx1031_pos, rx1031_off, $I11
    set_addr $I10, rxcap_1034_fail
    ($I12, $I11) = rx1031_cur."!mark_peek"($I10)
    rx1031_cur."!cursor_pos"($I11)
    ($P10) = rx1031_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1031_pos, "")
    rx1031_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    goto rxcap_1034_done
  rxcap_1034_fail:
    goto rx1031_fail
  rxcap_1034_done:
.annotate "line", 498
  # rx rxquantr1035 ** 0..1
    set_addr $I1041, rxquantr1035_done
    rx1031_cur."!mark_push"(0, rx1031_pos, $I1041)
  rxquantr1035_loop:
  alt1036_0:
.annotate "line", 492
    set_addr $I10, alt1036_1
    rx1031_cur."!mark_push"(0, rx1031_pos, $I10)
.annotate "line", 493
  # rx subrule "before" subtype=zerowidth negate=
    rx1031_cur."!cursor_pos"(rx1031_pos)
    .const 'Sub' $P1038 = "308_1258264446.59978" 
    capture_lex $P1038
    $P10 = rx1031_cur."before"($P1038)
    unless $P10, rx1031_fail
    goto alt1036_end
  alt1036_1:
    set_addr $I10, alt1036_2
    rx1031_cur."!mark_push"(0, rx1031_pos, $I10)
.annotate "line", 494
  # rx literal  "="
    add $I11, rx1031_pos, 1
    gt $I11, rx1031_eos, rx1031_fail
    sub $I11, rx1031_pos, rx1031_off
    substr $S10, rx1031_tgt, $I11, 1
    ne $S10, "=", rx1031_fail
    add rx1031_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx1031_cur."!cursor_pos"(rx1031_pos)
    $P10 = rx1031_cur."assertion"()
    unless $P10, rx1031_fail
    rx1031_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx1031_pos = $P10."pos"()
    goto alt1036_end
  alt1036_2:
    set_addr $I10, alt1036_3
    rx1031_cur."!mark_push"(0, rx1031_pos, $I10)
.annotate "line", 495
  # rx literal  ":"
    add $I11, rx1031_pos, 1
    gt $I11, rx1031_eos, rx1031_fail
    sub $I11, rx1031_pos, rx1031_off
    substr $S10, rx1031_tgt, $I11, 1
    ne $S10, ":", rx1031_fail
    add rx1031_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx1031_cur."!cursor_pos"(rx1031_pos)
    $P10 = rx1031_cur."arglist"()
    unless $P10, rx1031_fail
    rx1031_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1031_pos = $P10."pos"()
    goto alt1036_end
  alt1036_3:
    set_addr $I10, alt1036_4
    rx1031_cur."!mark_push"(0, rx1031_pos, $I10)
.annotate "line", 496
  # rx literal  "("
    add $I11, rx1031_pos, 1
    gt $I11, rx1031_eos, rx1031_fail
    sub $I11, rx1031_pos, rx1031_off
    substr $S10, rx1031_tgt, $I11, 1
    ne $S10, "(", rx1031_fail
    add rx1031_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx1031_cur."!cursor_pos"(rx1031_pos)
    $P10 = rx1031_cur."LANG"("MAIN", "arglist")
    unless $P10, rx1031_fail
    rx1031_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1031_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1031_pos, 1
    gt $I11, rx1031_eos, rx1031_fail
    sub $I11, rx1031_pos, rx1031_off
    substr $S10, rx1031_tgt, $I11, 1
    ne $S10, ")", rx1031_fail
    add rx1031_pos, 1
    goto alt1036_end
  alt1036_4:
.annotate "line", 497
  # rx subrule "normspace" subtype=method negate=
    rx1031_cur."!cursor_pos"(rx1031_pos)
    $P10 = rx1031_cur."normspace"()
    unless $P10, rx1031_fail
    rx1031_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx1031_cur."!cursor_pos"(rx1031_pos)
    $P10 = rx1031_cur."nibbler"()
    unless $P10, rx1031_fail
    rx1031_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx1031_pos = $P10."pos"()
  alt1036_end:
.annotate "line", 498
    (rx1031_rep) = rx1031_cur."!mark_commit"($I1041)
  rxquantr1035_done:
.annotate "line", 490
  # rx pass
    rx1031_cur."!cursor_pass"(rx1031_pos, "assertion:sym<name>")
    rx1031_cur."!cursor_debug"("PASS  ", "assertion:sym<name>", " at pos=", rx1031_pos)
    .return (rx1031_cur)
  rx1031_fail:
.annotate "line", 477
    (rx1031_rep, rx1031_pos, $I10, $P10) = rx1031_cur."!mark_fail"(0)
    lt rx1031_pos, -1, rx1031_done
    eq rx1031_pos, -1, rx1031_fail
    jump $I10
  rx1031_done:
    rx1031_cur."!cursor_fail"()
    rx1031_cur."!cursor_debug"("FAIL  ", "assertion:sym<name>")
    .return (rx1031_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<name>"  :subid("307_1258264446.59978") :method
.annotate "line", 477
    new $P1033, "ResizablePMCArray"
    push $P1033, ""
    .return ($P1033)
.end


.namespace ["NQP";"Regex"]
.sub "_block1037"  :anon :subid("308_1258264446.59978") :method :outer("306_1258264446.59978")
.annotate "line", 493
    .local string rx1039_tgt
    .local int rx1039_pos
    .local int rx1039_off
    .local int rx1039_eos
    .local int rx1039_rep
    .local pmc rx1039_cur
    (rx1039_cur, rx1039_pos, rx1039_tgt, $I10) = self."!cursor_start"()
    rx1039_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1039_cur
    .local pmc match
    .lex "$/", match
    length rx1039_eos, rx1039_tgt
    set rx1039_off, 0
    lt $I10, 2, rx1039_start
    sub rx1039_off, $I10, 1
    substr rx1039_tgt, rx1039_tgt, rx1039_off
  rx1039_start:
    ge rx1039_pos, 0, rxscan1040_done
  rxscan1040_loop:
    ($P10) = rx1039_cur."from"()
    inc $P10
    set rx1039_pos, $P10
    ge rx1039_pos, rx1039_eos, rxscan1040_done
    set_addr $I10, rxscan1040_loop
    rx1039_cur."!mark_push"(0, rx1039_pos, $I10)
  rxscan1040_done:
  # rx literal  ">"
    add $I11, rx1039_pos, 1
    gt $I11, rx1039_eos, rx1039_fail
    sub $I11, rx1039_pos, rx1039_off
    substr $S10, rx1039_tgt, $I11, 1
    ne $S10, ">", rx1039_fail
    add rx1039_pos, 1
  # rx pass
    rx1039_cur."!cursor_pass"(rx1039_pos, "")
    rx1039_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1039_pos)
    .return (rx1039_cur)
  rx1039_fail:
    (rx1039_rep, rx1039_pos, $I10, $P10) = rx1039_cur."!mark_fail"(0)
    lt rx1039_pos, -1, rx1039_done
    eq rx1039_pos, -1, rx1039_fail
    jump $I10
  rx1039_done:
    rx1039_cur."!cursor_fail"()
    rx1039_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1039_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "codeblock"  :subid("309_1258264446.59978") :method :outer("298_1258264446.59978")
.annotate "line", 477
    .local string rx1043_tgt
    .local int rx1043_pos
    .local int rx1043_off
    .local int rx1043_eos
    .local int rx1043_rep
    .local pmc rx1043_cur
    (rx1043_cur, rx1043_pos, rx1043_tgt, $I10) = self."!cursor_start"()
    rx1043_cur."!cursor_debug"("START ", "codeblock")
    .lex unicode:"$\x{a2}", rx1043_cur
    .local pmc match
    .lex "$/", match
    length rx1043_eos, rx1043_tgt
    set rx1043_off, 0
    lt $I10, 2, rx1043_start
    sub rx1043_off, $I10, 1
    substr rx1043_tgt, rx1043_tgt, rx1043_off
  rx1043_start:
.annotate "line", 503
  # rx subrule "LANG" subtype=capture negate=
    rx1043_cur."!cursor_pos"(rx1043_pos)
    $P10 = rx1043_cur."LANG"("MAIN", "pblock")
    unless $P10, rx1043_fail
    rx1043_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx1043_pos = $P10."pos"()
.annotate "line", 502
  # rx pass
    rx1043_cur."!cursor_pass"(rx1043_pos, "codeblock")
    rx1043_cur."!cursor_debug"("PASS  ", "codeblock", " at pos=", rx1043_pos)
    .return (rx1043_cur)
  rx1043_fail:
.annotate "line", 477
    (rx1043_rep, rx1043_pos, $I10, $P10) = rx1043_cur."!mark_fail"(0)
    lt rx1043_pos, -1, rx1043_done
    eq rx1043_pos, -1, rx1043_fail
    jump $I10
  rx1043_done:
    rx1043_cur."!cursor_fail"()
    rx1043_cur."!cursor_debug"("FAIL  ", "codeblock")
    .return (rx1043_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__codeblock"  :subid("310_1258264446.59978") :method
.annotate "line", 477
    $P1045 = self."!PREFIX__!subrule"("block", "")
    new $P1046, "ResizablePMCArray"
    push $P1046, $P1045
    .return ($P1046)
.end

### .include 'gen/nqp-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1258264465.36631")
.annotate "line", 0
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    capture_lex $P14
.annotate "line", 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    capture_lex $P14
    $P1885 = $P14()
.annotate "line", 1
    .return ($P1885)
.end


.namespace []
.sub "" :load :init :subid("post115") :outer("10_1258264465.36631")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1258264465.36631" 
    .local pmc block
    set block, $P12
    $P1886 = get_root_global ["parrot"], "P6metaclass"
    $P1886."new_class"("NQP::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block13"  :subid("11_1258264465.36631") :outer("10_1258264465.36631")
.annotate "line", 3
    .const 'Sub' $P1881 = "114_1258264465.36631" 
    capture_lex $P1881
    get_hll_global $P1817, ["NQP";"RegexActions"], "_block1816" 
    capture_lex $P1817
    .const 'Sub' $P1804 = "108_1258264465.36631" 
    capture_lex $P1804
    .const 'Sub' $P1794 = "107_1258264465.36631" 
    capture_lex $P1794
    .const 'Sub' $P1784 = "106_1258264465.36631" 
    capture_lex $P1784
    .const 'Sub' $P1774 = "105_1258264465.36631" 
    capture_lex $P1774
    .const 'Sub' $P1759 = "104_1258264465.36631" 
    capture_lex $P1759
    .const 'Sub' $P1745 = "103_1258264465.36631" 
    capture_lex $P1745
    .const 'Sub' $P1735 = "102_1258264465.36631" 
    capture_lex $P1735
    .const 'Sub' $P1721 = "101_1258264465.36631" 
    capture_lex $P1721
    .const 'Sub' $P1711 = "100_1258264465.36631" 
    capture_lex $P1711
    .const 'Sub' $P1701 = "99_1258264465.36631" 
    capture_lex $P1701
    .const 'Sub' $P1691 = "98_1258264465.36631" 
    capture_lex $P1691
    .const 'Sub' $P1681 = "97_1258264465.36631" 
    capture_lex $P1681
    .const 'Sub' $P1671 = "96_1258264465.36631" 
    capture_lex $P1671
    .const 'Sub' $P1643 = "95_1258264465.36631" 
    capture_lex $P1643
    .const 'Sub' $P1633 = "94_1258264465.36631" 
    capture_lex $P1633
    .const 'Sub' $P1621 = "93_1258264465.36631" 
    capture_lex $P1621
    .const 'Sub' $P1609 = "92_1258264465.36631" 
    capture_lex $P1609
    .const 'Sub' $P1597 = "91_1258264465.36631" 
    capture_lex $P1597
    .const 'Sub' $P1587 = "90_1258264465.36631" 
    capture_lex $P1587
    .const 'Sub' $P1558 = "89_1258264465.36631" 
    capture_lex $P1558
    .const 'Sub' $P1534 = "88_1258264465.36631" 
    capture_lex $P1534
    .const 'Sub' $P1524 = "87_1258264465.36631" 
    capture_lex $P1524
    .const 'Sub' $P1497 = "86_1258264465.36631" 
    capture_lex $P1497
    .const 'Sub' $P1479 = "85_1258264465.36631" 
    capture_lex $P1479
    .const 'Sub' $P1469 = "84_1258264465.36631" 
    capture_lex $P1469
    .const 'Sub' $P1385 = "81_1258264465.36631" 
    capture_lex $P1385
    .const 'Sub' $P1375 = "80_1258264465.36631" 
    capture_lex $P1375
    .const 'Sub' $P1346 = "79_1258264465.36631" 
    capture_lex $P1346
    .const 'Sub' $P1313 = "78_1258264465.36631" 
    capture_lex $P1313
    .const 'Sub' $P1297 = "77_1258264465.36631" 
    capture_lex $P1297
    .const 'Sub' $P1288 = "76_1258264465.36631" 
    capture_lex $P1288
    .const 'Sub' $P1263 = "75_1258264465.36631" 
    capture_lex $P1263
    .const 'Sub' $P1159 = "72_1258264465.36631" 
    capture_lex $P1159
    .const 'Sub' $P1142 = "71_1258264465.36631" 
    capture_lex $P1142
    .const 'Sub' $P1122 = "70_1258264465.36631" 
    capture_lex $P1122
    .const 'Sub' $P1038 = "69_1258264465.36631" 
    capture_lex $P1038
    .const 'Sub' $P1014 = "67_1258264465.36631" 
    capture_lex $P1014
    .const 'Sub' $P980 = "65_1258264465.36631" 
    capture_lex $P980
    .const 'Sub' $P934 = "63_1258264465.36631" 
    capture_lex $P934
    .const 'Sub' $P924 = "62_1258264465.36631" 
    capture_lex $P924
    .const 'Sub' $P914 = "61_1258264465.36631" 
    capture_lex $P914
    .const 'Sub' $P843 = "59_1258264465.36631" 
    capture_lex $P843
    .const 'Sub' $P826 = "58_1258264465.36631" 
    capture_lex $P826
    .const 'Sub' $P816 = "57_1258264465.36631" 
    capture_lex $P816
    .const 'Sub' $P806 = "56_1258264465.36631" 
    capture_lex $P806
    .const 'Sub' $P796 = "55_1258264465.36631" 
    capture_lex $P796
    .const 'Sub' $P772 = "54_1258264465.36631" 
    capture_lex $P772
    .const 'Sub' $P719 = "53_1258264465.36631" 
    capture_lex $P719
    .const 'Sub' $P709 = "52_1258264465.36631" 
    capture_lex $P709
    .const 'Sub' $P660 = "51_1258264465.36631" 
    capture_lex $P660
    .const 'Sub' $P634 = "50_1258264465.36631" 
    capture_lex $P634
    .const 'Sub' $P624 = "49_1258264465.36631" 
    capture_lex $P624
    .const 'Sub' $P614 = "48_1258264465.36631" 
    capture_lex $P614
    .const 'Sub' $P604 = "47_1258264465.36631" 
    capture_lex $P604
    .const 'Sub' $P594 = "46_1258264465.36631" 
    capture_lex $P594
    .const 'Sub' $P584 = "45_1258264465.36631" 
    capture_lex $P584
    .const 'Sub' $P574 = "44_1258264465.36631" 
    capture_lex $P574
    .const 'Sub' $P564 = "43_1258264465.36631" 
    capture_lex $P564
    .const 'Sub' $P554 = "42_1258264465.36631" 
    capture_lex $P554
    .const 'Sub' $P544 = "41_1258264465.36631" 
    capture_lex $P544
    .const 'Sub' $P534 = "40_1258264465.36631" 
    capture_lex $P534
    .const 'Sub' $P524 = "39_1258264465.36631" 
    capture_lex $P524
    .const 'Sub' $P514 = "38_1258264465.36631" 
    capture_lex $P514
    .const 'Sub' $P496 = "37_1258264465.36631" 
    capture_lex $P496
    .const 'Sub' $P480 = "36_1258264465.36631" 
    capture_lex $P480
    .const 'Sub' $P467 = "35_1258264465.36631" 
    capture_lex $P467
    .const 'Sub' $P441 = "34_1258264465.36631" 
    capture_lex $P441
    .const 'Sub' $P405 = "33_1258264465.36631" 
    capture_lex $P405
    .const 'Sub' $P388 = "32_1258264465.36631" 
    capture_lex $P388
    .const 'Sub' $P374 = "31_1258264465.36631" 
    capture_lex $P374
    .const 'Sub' $P319 = "29_1258264465.36631" 
    capture_lex $P319
    .const 'Sub' $P306 = "28_1258264465.36631" 
    capture_lex $P306
    .const 'Sub' $P287 = "27_1258264465.36631" 
    capture_lex $P287
    .const 'Sub' $P277 = "26_1258264465.36631" 
    capture_lex $P277
    .const 'Sub' $P267 = "25_1258264465.36631" 
    capture_lex $P267
    .const 'Sub' $P251 = "24_1258264465.36631" 
    capture_lex $P251
    .const 'Sub' $P173 = "22_1258264465.36631" 
    capture_lex $P173
    .const 'Sub' $P130 = "20_1258264465.36631" 
    capture_lex $P130
    .const 'Sub' $P111 = "19_1258264465.36631" 
    capture_lex $P111
    .const 'Sub' $P89 = "18_1258264465.36631" 
    capture_lex $P89
    .const 'Sub' $P79 = "17_1258264465.36631" 
    capture_lex $P79
    .const 'Sub' $P57 = "16_1258264465.36631" 
    capture_lex $P57
    .const 'Sub' $P26 = "13_1258264465.36631" 
    capture_lex $P26
    .const 'Sub' $P16 = "12_1258264465.36631" 
    capture_lex $P16
    get_global $P15, "@BLOCK"
    unless_null $P15, vivify_118
    new $P15, "ResizablePMCArray"
    set_global "@BLOCK", $P15
  vivify_118:
.annotate "line", 9
    .const 'Sub' $P16 = "12_1258264465.36631" 
    capture_lex $P16
    .lex "xblock_immediate", $P16
.annotate "line", 14
    .const 'Sub' $P26 = "13_1258264465.36631" 
    capture_lex $P26
    .lex "block_immediate", $P26
.annotate "line", 24
    .const 'Sub' $P57 = "16_1258264465.36631" 
    capture_lex $P57
    .lex "sigiltype", $P57
.annotate "line", 3
    get_global $P75, "@BLOCK"
.annotate "line", 5
    find_lex $P76, "xblock_immediate"
    find_lex $P77, "block_immediate"
    find_lex $P78, "sigiltype"
.annotate "line", 642
    get_hll_global $P1817, ["NQP";"RegexActions"], "_block1816" 
    capture_lex $P1817
    $P1879 = $P1817()
.annotate "line", 3
    .return ($P1879)
.end


.namespace ["NQP";"Actions"]
.sub "" :load :init :subid("post116") :outer("11_1258264465.36631")
.annotate "line", 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    .local pmc block
    set block, $P14
.annotate "line", 5
    .const 'Sub' $P1881 = "114_1258264465.36631" 
    capture_lex $P1881
    $P1881()
    $P1884 = get_root_global ["parrot"], "P6metaclass"
    $P1884."new_class"("NQP::RegexActions", "Regex::P6Regex::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block1880"  :anon :subid("114_1258264465.36631") :outer("11_1258264465.36631")
.annotate "line", 6
    get_global $P1882, "@BLOCK"
    unless_null $P1882, vivify_117
    new $P1882, "ResizablePMCArray"
    set_global "@BLOCK", $P1882
  vivify_117:
 $P1883 = new ['ResizablePMCArray'] 
    set_global "@BLOCK", $P1883
.annotate "line", 5
    .return ($P1883)
.end


.namespace ["NQP";"Actions"]
.sub "xblock_immediate"  :subid("12_1258264465.36631") :outer("11_1258264465.36631")
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
.sub "block_immediate"  :subid("13_1258264465.36631") :outer("11_1258264465.36631")
    .param pmc param_29
.annotate "line", 14
    .const 'Sub' $P35 = "14_1258264465.36631" 
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
    .const 'Sub' $P35 = "14_1258264465.36631" 
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
.sub "_block34"  :anon :subid("14_1258264465.36631") :outer("13_1258264465.36631")
.annotate "line", 16
    .const 'Sub' $P46 = "15_1258264465.36631" 
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
    .const 'Sub' $P46 = "15_1258264465.36631" 
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
.sub "_block45"  :anon :subid("15_1258264465.36631") :outer("14_1258264465.36631")
    .param pmc param_47
.annotate "line", 18
    .lex "$_", param_47
    find_lex $P48, "$stmts"
    find_lex $P49, "$_"
    $P50 = $P48."push"($P49)
    .return ($P50)
.end


.namespace ["NQP";"Actions"]
.sub "sigiltype"  :subid("16_1258264465.36631") :outer("11_1258264465.36631")
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
.sub "TOP"  :subid("17_1258264465.36631") :method :outer("11_1258264465.36631")
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
.sub "deflongname"  :subid("18_1258264465.36631") :method :outer("11_1258264465.36631")
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
.sub "comp_unit"  :subid("19_1258264465.36631") :method :outer("11_1258264465.36631")
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
.sub "statementlist"  :subid("20_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_133
.annotate "line", 44
    .const 'Sub' $P147 = "21_1258264465.36631" 
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
    .const 'Sub' $P147 = "21_1258264465.36631" 
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
.sub "_block146"  :anon :subid("21_1258264465.36631") :outer("20_1258264465.36631")
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
.sub "statement"  :subid("22_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_176
    .param pmc param_177 :optional
    .param int has_param_177 :opt_flag
.annotate "line", 58
    .const 'Sub' $P185 = "23_1258264465.36631" 
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
    .const 'Sub' $P185 = "23_1258264465.36631" 
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
.sub "_block184"  :anon :subid("23_1258264465.36631") :outer("22_1258264465.36631")
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
.sub "xblock"  :subid("24_1258264465.36631") :method :outer("11_1258264465.36631")
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
.sub "pblock"  :subid("25_1258264465.36631") :method :outer("11_1258264465.36631")
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
.sub "block"  :subid("26_1258264465.36631") :method :outer("11_1258264465.36631")
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
.sub "blockoid"  :subid("27_1258264465.36631") :method :outer("11_1258264465.36631")
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
.sub "newpad"  :subid("28_1258264465.36631") :method :outer("11_1258264465.36631")
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
.sub "statement_control:sym<if>"  :subid("29_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_322
.annotate "line", 106
    .const 'Sub' $P352 = "30_1258264465.36631" 
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
    .const 'Sub' $P352 = "30_1258264465.36631" 
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
.sub "_block351"  :anon :subid("30_1258264465.36631") :outer("29_1258264465.36631")
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
.sub "statement_control:sym<unless>"  :subid("31_1258264465.36631") :method :outer("11_1258264465.36631")
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
.sub "statement_control:sym<while>"  :subid("32_1258264465.36631") :method :outer("11_1258264465.36631")
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
.sub "statement_control:sym<repeat>"  :subid("33_1258264465.36631") :method :outer("11_1258264465.36631")
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
.sub "statement_control:sym<for>"  :subid("34_1258264465.36631") :method :outer("11_1258264465.36631")
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
.sub "statement_control:sym<return>"  :subid("35_1258264465.36631") :method :outer("11_1258264465.36631")
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
.sub "statement_prefix:sym<INIT>"  :subid("36_1258264465.36631") :method :outer("11_1258264465.36631")
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
.sub "blorst"  :subid("37_1258264465.36631") :method :outer("11_1258264465.36631")
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
.sub "statement_mod_cond:sym<if>"  :subid("38_1258264465.36631") :method :outer("11_1258264465.36631")
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
.sub "statement_mod_cond:sym<unless>"  :subid("39_1258264465.36631") :method :outer("11_1258264465.36631")
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
.sub "statement_mod_loop:sym<while>"  :subid("40_1258264465.36631") :method :outer("11_1258264465.36631")
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
.sub "statement_mod_loop:sym<until>"  :subid("41_1258264465.36631") :method :outer("11_1258264465.36631")
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
.sub "term:sym<colonpair>"  :subid("42_1258264465.36631") :method :outer("11_1258264465.36631")
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
.sub "term:sym<variable>"  :subid("43_1258264465.36631") :method :outer("11_1258264465.36631")
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
.sub "term:sym<package_declarator>"  :subid("44_1258264465.36631") :method :outer("11_1258264465.36631")
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
.sub "term:sym<scope_declarator>"  :subid("45_1258264465.36631") :method :outer("11_1258264465.36631")
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
.sub "term:sym<routine_declarator>"  :subid("46_1258264465.36631") :method :outer("11_1258264465.36631")
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
.sub "term:sym<regex_declarator>"  :subid("47_1258264465.36631") :method :outer("11_1258264465.36631")
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
.sub "term:sym<statement_prefix>"  :subid("48_1258264465.36631") :method :outer("11_1258264465.36631")
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
.sub "term:sym<lambda>"  :subid("49_1258264465.36631") :method :outer("11_1258264465.36631")
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
.sub "colonpair"  :subid("50_1258264465.36631") :method :outer("11_1258264465.36631")
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
.sub "variable"  :subid("51_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_663
.annotate "line", 203
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
.annotate "line", 210
    get_hll_global $P675, ["PAST"], "Var"
    find_lex $P676, "$/"
    set $S677, $P676
    $P678 = $P675."new"($S677 :named("name"))
    store_lex "$past", $P678
.annotate "line", 211
    find_lex $P680, "$/"
    unless_null $P680, vivify_263
    new $P680, "Hash"
  vivify_263:
    set $P681, $P680["twigil"]
    unless_null $P681, vivify_264
    new $P681, "ResizablePMCArray"
  vivify_264:
    set $P682, $P681[0]
    unless_null $P682, vivify_265
    new $P682, "Undef"
  vivify_265:
    set $S683, $P682
    iseq $I684, $S683, "*"
    if $I684, if_679
.annotate "line", 217
    find_lex $P695, "$/"
    unless_null $P695, vivify_266
    new $P695, "Hash"
  vivify_266:
    set $P696, $P695["twigil"]
    unless_null $P696, vivify_267
    new $P696, "ResizablePMCArray"
  vivify_267:
    set $P697, $P696[0]
    unless_null $P697, vivify_268
    new $P697, "Undef"
  vivify_268:
    set $S698, $P697
    iseq $I699, $S698, "!"
    unless $I699, if_694_end
.annotate "line", 218
    find_lex $P700, "$past"
    $P700."scope"("attribute")
.annotate "line", 219
    find_lex $P701, "$past"
    find_lex $P702, "$/"
    unless_null $P702, vivify_269
    new $P702, "Hash"
  vivify_269:
    set $P703, $P702["sigil"]
    unless_null $P703, vivify_270
    new $P703, "Undef"
  vivify_270:
    $P704 = "sigiltype"($P703)
    $P701."viviself"($P704)
  if_694_end:
.annotate "line", 217
    goto if_679_end
  if_679:
.annotate "line", 212
    find_lex $P685, "$past"
    $P685."scope"("contextual")
.annotate "line", 213
    find_lex $P686, "$past"
    get_hll_global $P687, ["PAST"], "Op"
    new $P688, "String"
    assign $P688, "Contextual "
    find_lex $P689, "$/"
    set $S690, $P689
    concat $P691, $P688, $S690
    concat $P692, $P691, " not found"
    $P693 = $P687."new"($P692, "die" :named("pirop"))
    $P686."viviself"($P693)
  if_679_end:
.annotate "line", 209
    goto if_666_end
  if_666:
.annotate "line", 206
    find_lex $P669, "$/"
    unless_null $P669, vivify_271
    new $P669, "Hash"
  vivify_271:
    set $P670, $P669["postcircumfix"]
    unless_null $P670, vivify_272
    new $P670, "Undef"
  vivify_272:
    $P671 = $P670."ast"()
    store_lex "$past", $P671
.annotate "line", 207
    find_lex $P672, "$past"
    get_hll_global $P673, ["PAST"], "Var"
    $P674 = $P673."new"("$/" :named("name"))
    $P672."unshift"($P674)
  if_666_end:
.annotate "line", 222
    find_lex $P705, "$/"
    find_lex $P706, "$past"
    $P707 = $P705."!make"($P706)
.annotate "line", 203
    .return ($P707)
  control_661:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P708, exception, "payload"
    .return ($P708)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "package_declarator:sym<module>"  :subid("52_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_712
.annotate "line", 225
    new $P711, 'ExceptionHandler'
    set_addr $P711, control_710
    $P711."handle_types"(58)
    push_eh $P711
    .lex "self", self
    .lex "$/", param_712
    find_lex $P713, "$/"
    find_lex $P714, "$/"
    unless_null $P714, vivify_273
    new $P714, "Hash"
  vivify_273:
    set $P715, $P714["package_def"]
    unless_null $P715, vivify_274
    new $P715, "Undef"
  vivify_274:
    $P716 = $P715."ast"()
    $P717 = $P713."!make"($P716)
    .return ($P717)
  control_710:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P718, exception, "payload"
    .return ($P718)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "package_declarator:sym<class>"  :subid("53_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_722
.annotate "line", 226
    new $P721, 'ExceptionHandler'
    set_addr $P721, control_720
    $P721."handle_types"(58)
    push_eh $P721
    .lex "self", self
    .lex "$/", param_722
.annotate "line", 227
    new $P723, "Undef"
    .lex "$past", $P723
.annotate "line", 228
    new $P724, "Undef"
    .lex "$classinit", $P724
.annotate "line", 237
    new $P725, "Undef"
    .lex "$parent", $P725
.annotate "line", 227
    find_lex $P726, "$/"
    unless_null $P726, vivify_275
    new $P726, "Hash"
  vivify_275:
    set $P727, $P726["package_def"]
    unless_null $P727, vivify_276
    new $P727, "Undef"
  vivify_276:
    $P728 = $P727."ast"()
    store_lex "$past", $P728
.annotate "line", 229
    get_hll_global $P729, ["PAST"], "Op"
.annotate "line", 230
    get_hll_global $P730, ["PAST"], "Op"
    $P731 = $P730."new"("    %r = get_root_global [\"parrot\"], \"P6metaclass\"" :named("inline"))
.annotate "line", 233
    find_lex $P732, "$/"
    unless_null $P732, vivify_277
    new $P732, "Hash"
  vivify_277:
    set $P733, $P732["package_def"]
    unless_null $P733, vivify_278
    new $P733, "Hash"
  vivify_278:
    set $P734, $P733["name"]
    unless_null $P734, vivify_279
    new $P734, "Undef"
  vivify_279:
    set $S735, $P734
    $P736 = $P729."new"($P731, $S735, "new_class" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 229
    store_lex "$classinit", $P736
.annotate "line", 237
    find_lex $P739, "$/"
    unless_null $P739, vivify_280
    new $P739, "Hash"
  vivify_280:
    set $P740, $P739["package_def"]
    unless_null $P740, vivify_281
    new $P740, "Hash"
  vivify_281:
    set $P741, $P740["parent"]
    unless_null $P741, vivify_282
    new $P741, "ResizablePMCArray"
  vivify_282:
    set $P742, $P741[0]
    unless_null $P742, vivify_283
    new $P742, "Undef"
  vivify_283:
    set $S743, $P742
    unless $S743, unless_738
    new $P737, 'String'
    set $P737, $S743
    goto unless_738_end
  unless_738:
.annotate "line", 238
    find_lex $P746, "$/"
    unless_null $P746, vivify_284
    new $P746, "Hash"
  vivify_284:
    set $P747, $P746["sym"]
    unless_null $P747, vivify_285
    new $P747, "Undef"
  vivify_285:
    set $S748, $P747
    iseq $I749, $S748, "grammar"
    if $I749, if_745
    new $P751, "String"
    assign $P751, ""
    set $P744, $P751
    goto if_745_end
  if_745:
    new $P750, "String"
    assign $P750, "Regex::Cursor"
    set $P744, $P750
  if_745_end:
    set $P737, $P744
  unless_738_end:
    store_lex "$parent", $P737
.annotate "line", 239
    find_lex $P753, "$parent"
    unless $P753, if_752_end
.annotate "line", 240
    find_lex $P754, "$classinit"
    get_hll_global $P755, ["PAST"], "Val"
    find_lex $P756, "$parent"
    $P757 = $P755."new"($P756 :named("value"), "parent" :named("named"))
    $P754."push"($P757)
  if_752_end:
.annotate "line", 242
    find_lex $P759, "$past"
    unless_null $P759, vivify_286
    new $P759, "Hash"
  vivify_286:
    set $P760, $P759["attributes"]
    unless_null $P760, vivify_287
    new $P760, "Undef"
  vivify_287:
    unless $P760, if_758_end
.annotate "line", 243
    find_lex $P761, "$classinit"
    find_lex $P762, "$past"
    unless_null $P762, vivify_288
    new $P762, "Hash"
  vivify_288:
    set $P763, $P762["attributes"]
    unless_null $P763, vivify_289
    new $P763, "Undef"
  vivify_289:
    $P761."push"($P763)
  if_758_end:
.annotate "line", 245
    get_global $P764, "@BLOCK"
    unless_null $P764, vivify_290
    new $P764, "ResizablePMCArray"
  vivify_290:
    set $P765, $P764[0]
    unless_null $P765, vivify_291
    new $P765, "Undef"
  vivify_291:
    $P766 = $P765."loadinit"()
    find_lex $P767, "$classinit"
    $P766."push"($P767)
.annotate "line", 246
    find_lex $P768, "$/"
    find_lex $P769, "$past"
    $P770 = $P768."!make"($P769)
.annotate "line", 226
    .return ($P770)
  control_720:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P771, exception, "payload"
    .return ($P771)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "package_def"  :subid("54_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_775
.annotate "line", 249
    new $P774, 'ExceptionHandler'
    set_addr $P774, control_773
    $P774."handle_types"(58)
    push_eh $P774
    .lex "self", self
    .lex "$/", param_775
.annotate "line", 250
    new $P776, "Undef"
    .lex "$past", $P776
    find_lex $P779, "$/"
    unless_null $P779, vivify_292
    new $P779, "Hash"
  vivify_292:
    set $P780, $P779["block"]
    unless_null $P780, vivify_293
    new $P780, "Undef"
  vivify_293:
    if $P780, if_778
    find_lex $P784, "$/"
    unless_null $P784, vivify_294
    new $P784, "Hash"
  vivify_294:
    set $P785, $P784["comp_unit"]
    unless_null $P785, vivify_295
    new $P785, "Undef"
  vivify_295:
    $P786 = $P785."ast"()
    set $P777, $P786
    goto if_778_end
  if_778:
    find_lex $P781, "$/"
    unless_null $P781, vivify_296
    new $P781, "Hash"
  vivify_296:
    set $P782, $P781["block"]
    unless_null $P782, vivify_297
    new $P782, "Undef"
  vivify_297:
    $P783 = $P782."ast"()
    set $P777, $P783
  if_778_end:
    store_lex "$past", $P777
.annotate "line", 251
    find_lex $P787, "$past"
    find_lex $P788, "$/"
    unless_null $P788, vivify_298
    new $P788, "Hash"
  vivify_298:
    set $P789, $P788["name"]
    unless_null $P789, vivify_299
    new $P789, "Hash"
  vivify_299:
    set $P790, $P789["identifier"]
    unless_null $P790, vivify_300
    new $P790, "Undef"
  vivify_300:
    $P787."namespace"($P790)
.annotate "line", 252
    find_lex $P791, "$past"
    $P791."blocktype"("immediate")
.annotate "line", 253
    find_lex $P792, "$/"
    find_lex $P793, "$past"
    $P794 = $P792."!make"($P793)
.annotate "line", 249
    .return ($P794)
  control_773:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P795, exception, "payload"
    .return ($P795)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<my>"  :subid("55_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_799
.annotate "line", 256
    new $P798, 'ExceptionHandler'
    set_addr $P798, control_797
    $P798."handle_types"(58)
    push_eh $P798
    .lex "self", self
    .lex "$/", param_799
    find_lex $P800, "$/"
    find_lex $P801, "$/"
    unless_null $P801, vivify_301
    new $P801, "Hash"
  vivify_301:
    set $P802, $P801["scoped"]
    unless_null $P802, vivify_302
    new $P802, "Undef"
  vivify_302:
    $P803 = $P802."ast"()
    $P804 = $P800."!make"($P803)
    .return ($P804)
  control_797:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P805, exception, "payload"
    .return ($P805)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<our>"  :subid("56_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_809
.annotate "line", 257
    new $P808, 'ExceptionHandler'
    set_addr $P808, control_807
    $P808."handle_types"(58)
    push_eh $P808
    .lex "self", self
    .lex "$/", param_809
    find_lex $P810, "$/"
    find_lex $P811, "$/"
    unless_null $P811, vivify_303
    new $P811, "Hash"
  vivify_303:
    set $P812, $P811["scoped"]
    unless_null $P812, vivify_304
    new $P812, "Undef"
  vivify_304:
    $P813 = $P812."ast"()
    $P814 = $P810."!make"($P813)
    .return ($P814)
  control_807:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P815, exception, "payload"
    .return ($P815)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<has>"  :subid("57_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_819
.annotate "line", 258
    new $P818, 'ExceptionHandler'
    set_addr $P818, control_817
    $P818."handle_types"(58)
    push_eh $P818
    .lex "self", self
    .lex "$/", param_819
    find_lex $P820, "$/"
    find_lex $P821, "$/"
    unless_null $P821, vivify_305
    new $P821, "Hash"
  vivify_305:
    set $P822, $P821["scoped"]
    unless_null $P822, vivify_306
    new $P822, "Undef"
  vivify_306:
    $P823 = $P822."ast"()
    $P824 = $P820."!make"($P823)
    .return ($P824)
  control_817:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P825, exception, "payload"
    .return ($P825)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "scoped"  :subid("58_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_829
.annotate "line", 260
    new $P828, 'ExceptionHandler'
    set_addr $P828, control_827
    $P828."handle_types"(58)
    push_eh $P828
    .lex "self", self
    .lex "$/", param_829
.annotate "line", 261
    find_lex $P830, "$/"
.annotate "line", 262
    find_lex $P833, "$/"
    unless_null $P833, vivify_307
    new $P833, "Hash"
  vivify_307:
    set $P834, $P833["routine_declarator"]
    unless_null $P834, vivify_308
    new $P834, "Undef"
  vivify_308:
    if $P834, if_832
.annotate "line", 263
    find_lex $P838, "$/"
    unless_null $P838, vivify_309
    new $P838, "Hash"
  vivify_309:
    set $P839, $P838["variable_declarator"]
    unless_null $P839, vivify_310
    new $P839, "Undef"
  vivify_310:
    $P840 = $P839."ast"()
    set $P831, $P840
.annotate "line", 262
    goto if_832_end
  if_832:
    find_lex $P835, "$/"
    unless_null $P835, vivify_311
    new $P835, "Hash"
  vivify_311:
    set $P836, $P835["routine_declarator"]
    unless_null $P836, vivify_312
    new $P836, "Undef"
  vivify_312:
    $P837 = $P836."ast"()
    set $P831, $P837
  if_832_end:
    $P841 = $P830."!make"($P831)
.annotate "line", 260
    .return ($P841)
  control_827:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P842, exception, "payload"
    .return ($P842)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "variable_declarator"  :subid("59_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_846
.annotate "line", 266
    .const 'Sub' $P886 = "60_1258264465.36631" 
    capture_lex $P886
    new $P845, 'ExceptionHandler'
    set_addr $P845, control_844
    $P845."handle_types"(58)
    push_eh $P845
    .lex "self", self
    .lex "$/", param_846
.annotate "line", 267
    new $P847, "Undef"
    .lex "$past", $P847
.annotate "line", 268
    new $P848, "Undef"
    .lex "$sigil", $P848
.annotate "line", 269
    new $P849, "Undef"
    .lex "$name", $P849
.annotate "line", 270
    new $P850, "Undef"
    .lex "$BLOCK", $P850
.annotate "line", 267
    find_lex $P851, "$/"
    unless_null $P851, vivify_313
    new $P851, "Hash"
  vivify_313:
    set $P852, $P851["variable"]
    unless_null $P852, vivify_314
    new $P852, "Undef"
  vivify_314:
    $P853 = $P852."ast"()
    store_lex "$past", $P853
.annotate "line", 268
    find_lex $P854, "$/"
    unless_null $P854, vivify_315
    new $P854, "Hash"
  vivify_315:
    set $P855, $P854["variable"]
    unless_null $P855, vivify_316
    new $P855, "Hash"
  vivify_316:
    set $P856, $P855["sigil"]
    unless_null $P856, vivify_317
    new $P856, "Undef"
  vivify_317:
    store_lex "$sigil", $P856
.annotate "line", 269
    find_lex $P857, "$past"
    $P858 = $P857."name"()
    store_lex "$name", $P858
.annotate "line", 270
    get_global $P859, "@BLOCK"
    unless_null $P859, vivify_318
    new $P859, "ResizablePMCArray"
  vivify_318:
    set $P860, $P859[0]
    unless_null $P860, vivify_319
    new $P860, "Undef"
  vivify_319:
    store_lex "$BLOCK", $P860
.annotate "line", 271
    find_lex $P862, "$BLOCK"
    find_lex $P863, "$name"
    $P864 = $P862."symbol"($P863)
    unless $P864, if_861_end
.annotate "line", 272
    find_lex $P865, "$/"
    $P866 = $P865."CURSOR"()
    find_lex $P867, "$name"
    $P866."panic"("Redeclaration of symbol ", $P867)
  if_861_end:
.annotate "line", 274
    find_dynamic_lex $P869, "$*SCOPE"
    unless_null $P869, vivify_320
    die "Contextual $*SCOPE not found"
  vivify_320:
    set $S870, $P869
    iseq $I871, $S870, "has"
    if $I871, if_868
.annotate "line", 283
    .const 'Sub' $P886 = "60_1258264465.36631" 
    capture_lex $P886
    $P886()
    goto if_868_end
  if_868:
.annotate "line", 275
    find_lex $P872, "$BLOCK"
    find_lex $P873, "$name"
    $P872."symbol"($P873, "attribute" :named("scope"))
.annotate "line", 276
    find_lex $P875, "$BLOCK"
    unless_null $P875, vivify_324
    new $P875, "Hash"
  vivify_324:
    set $P876, $P875["attributes"]
    unless_null $P876, vivify_325
    new $P876, "Undef"
  vivify_325:
    if $P876, unless_874_end
.annotate "line", 278
    get_hll_global $P877, ["PAST"], "Op"
    $P878 = $P877."new"("list" :named("pasttype"), "attr" :named("named"))
    find_lex $P879, "$BLOCK"
    unless_null $P879, vivify_326
    new $P879, "Hash"
    store_lex "$BLOCK", $P879
  vivify_326:
    set $P879["attributes"], $P878
  unless_874_end:
.annotate "line", 280
    find_lex $P880, "$BLOCK"
    unless_null $P880, vivify_327
    new $P880, "Hash"
  vivify_327:
    set $P881, $P880["attributes"]
    unless_null $P881, vivify_328
    new $P881, "Undef"
  vivify_328:
    find_lex $P882, "$name"
    $P881."push"($P882)
.annotate "line", 281
    get_hll_global $P883, ["PAST"], "Stmts"
    $P884 = $P883."new"()
    store_lex "$past", $P884
  if_868_end:
.annotate "line", 291
    find_lex $P910, "$/"
    find_lex $P911, "$past"
    $P912 = $P910."!make"($P911)
.annotate "line", 266
    .return ($P912)
  control_844:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P913, exception, "payload"
    .return ($P913)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "_block885"  :anon :subid("60_1258264465.36631") :outer("59_1258264465.36631")
.annotate "line", 284
    new $P887, "Undef"
    .lex "$scope", $P887
.annotate "line", 285
    new $P888, "Undef"
    .lex "$decl", $P888
.annotate "line", 284
    find_dynamic_lex $P891, "$*SCOPE"
    unless_null $P891, vivify_321
    die "Contextual $*SCOPE not found"
  vivify_321:
    set $S892, $P891
    iseq $I893, $S892, "our"
    if $I893, if_890
    new $P895, "String"
    assign $P895, "lexical"
    set $P889, $P895
    goto if_890_end
  if_890:
    new $P894, "String"
    assign $P894, "package"
    set $P889, $P894
  if_890_end:
    store_lex "$scope", $P889
.annotate "line", 285
    get_hll_global $P896, ["PAST"], "Var"
    find_lex $P897, "$name"
    find_lex $P898, "$scope"
.annotate "line", 286
    find_lex $P899, "$sigil"
    $P900 = "sigiltype"($P899)
    find_lex $P901, "$/"
    $P902 = $P896."new"($P897 :named("name"), $P898 :named("scope"), 1 :named("isdecl"), 1 :named("lvalue"), $P900 :named("viviself"), $P901 :named("node"))
.annotate "line", 285
    store_lex "$decl", $P902
.annotate "line", 288
    find_lex $P903, "$BLOCK"
    find_lex $P904, "$name"
    find_lex $P905, "$scope"
    $P903."symbol"($P904, $P905 :named("scope"))
.annotate "line", 289
    find_lex $P906, "$BLOCK"
    unless_null $P906, vivify_322
    new $P906, "ResizablePMCArray"
  vivify_322:
    set $P907, $P906[0]
    unless_null $P907, vivify_323
    new $P907, "Undef"
  vivify_323:
    find_lex $P908, "$decl"
    $P909 = $P907."push"($P908)
.annotate "line", 283
    .return ($P909)
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<sub>"  :subid("61_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_917
.annotate "line", 294
    new $P916, 'ExceptionHandler'
    set_addr $P916, control_915
    $P916."handle_types"(58)
    push_eh $P916
    .lex "self", self
    .lex "$/", param_917
    find_lex $P918, "$/"
    find_lex $P919, "$/"
    unless_null $P919, vivify_329
    new $P919, "Hash"
  vivify_329:
    set $P920, $P919["routine_def"]
    unless_null $P920, vivify_330
    new $P920, "Undef"
  vivify_330:
    $P921 = $P920."ast"()
    $P922 = $P918."!make"($P921)
    .return ($P922)
  control_915:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P923, exception, "payload"
    .return ($P923)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<method>"  :subid("62_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_927
.annotate "line", 295
    new $P926, 'ExceptionHandler'
    set_addr $P926, control_925
    $P926."handle_types"(58)
    push_eh $P926
    .lex "self", self
    .lex "$/", param_927
    find_lex $P928, "$/"
    find_lex $P929, "$/"
    unless_null $P929, vivify_331
    new $P929, "Hash"
  vivify_331:
    set $P930, $P929["method_def"]
    unless_null $P930, vivify_332
    new $P930, "Undef"
  vivify_332:
    $P931 = $P930."ast"()
    $P932 = $P928."!make"($P931)
    .return ($P932)
  control_925:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P933, exception, "payload"
    .return ($P933)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "routine_def"  :subid("63_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_937
.annotate "line", 297
    .const 'Sub' $P948 = "64_1258264465.36631" 
    capture_lex $P948
    new $P936, 'ExceptionHandler'
    set_addr $P936, control_935
    $P936."handle_types"(58)
    push_eh $P936
    .lex "self", self
    .lex "$/", param_937
.annotate "line", 298
    new $P938, "Undef"
    .lex "$past", $P938
    find_lex $P939, "$/"
    unless_null $P939, vivify_333
    new $P939, "Hash"
  vivify_333:
    set $P940, $P939["blockoid"]
    unless_null $P940, vivify_334
    new $P940, "Undef"
  vivify_334:
    $P941 = $P940."ast"()
    store_lex "$past", $P941
.annotate "line", 299
    find_lex $P942, "$past"
    $P942."blocktype"("declaration")
.annotate "line", 300
    find_lex $P943, "$past"
    $P943."control"("return_pir")
.annotate "line", 301
    find_lex $P945, "$/"
    unless_null $P945, vivify_335
    new $P945, "Hash"
  vivify_335:
    set $P946, $P945["deflongname"]
    unless_null $P946, vivify_336
    new $P946, "Undef"
  vivify_336:
    unless $P946, if_944_end
    .const 'Sub' $P948 = "64_1258264465.36631" 
    capture_lex $P948
    $P948()
  if_944_end:
.annotate "line", 311
    find_lex $P976, "$/"
    find_lex $P977, "$past"
    $P978 = $P976."!make"($P977)
.annotate "line", 297
    .return ($P978)
  control_935:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P979, exception, "payload"
    .return ($P979)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "_block947"  :anon :subid("64_1258264465.36631") :outer("63_1258264465.36631")
.annotate "line", 302
    new $P949, "Undef"
    .lex "$name", $P949
    find_lex $P950, "$/"
    unless_null $P950, vivify_337
    new $P950, "Hash"
  vivify_337:
    set $P951, $P950["deflongname"]
    unless_null $P951, vivify_338
    new $P951, "ResizablePMCArray"
  vivify_338:
    set $P952, $P951[0]
    unless_null $P952, vivify_339
    new $P952, "Undef"
  vivify_339:
    $P953 = $P952."ast"()
    set $S954, $P953
    new $P955, 'String'
    set $P955, $S954
    store_lex "$name", $P955
.annotate "line", 303
    find_lex $P956, "$past"
    find_lex $P957, "$name"
    $P956."name"($P957)
.annotate "line", 304
    find_dynamic_lex $P960, "$*SCOPE"
    unless_null $P960, vivify_340
    die "Contextual $*SCOPE not found"
  vivify_340:
    set $S961, $P960
    isne $I962, $S961, "our"
    if $I962, if_959
    new $P958, 'Integer'
    set $P958, $I962
    goto if_959_end
  if_959:
.annotate "line", 305
    get_global $P963, "@BLOCK"
    unless_null $P963, vivify_341
    new $P963, "ResizablePMCArray"
  vivify_341:
    set $P964, $P963[0]
    unless_null $P964, vivify_342
    new $P964, "ResizablePMCArray"
  vivify_342:
    set $P965, $P964[0]
    unless_null $P965, vivify_343
    new $P965, "Undef"
  vivify_343:
    get_hll_global $P966, ["PAST"], "Var"
    find_lex $P967, "$name"
    find_lex $P968, "$past"
    $P969 = $P966."new"($P967 :named("name"), 1 :named("isdecl"), $P968 :named("viviself"), "lexical" :named("scope"))
    $P965."push"($P969)
.annotate "line", 307
    get_global $P970, "@BLOCK"
    unless_null $P970, vivify_344
    new $P970, "ResizablePMCArray"
  vivify_344:
    set $P971, $P970[0]
    unless_null $P971, vivify_345
    new $P971, "Undef"
  vivify_345:
    find_lex $P972, "$name"
    $P971."symbol"($P972, "lexical" :named("scope"))
.annotate "line", 308
    get_hll_global $P973, ["PAST"], "Var"
    find_lex $P974, "$name"
    $P975 = $P973."new"($P974 :named("name"))
    store_lex "$past", $P975
.annotate "line", 304
    set $P958, $P975
  if_959_end:
.annotate "line", 301
    .return ($P958)
.end


.namespace ["NQP";"Actions"]
.sub "method_def"  :subid("65_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_983
.annotate "line", 315
    .const 'Sub' $P999 = "66_1258264465.36631" 
    capture_lex $P999
    new $P982, 'ExceptionHandler'
    set_addr $P982, control_981
    $P982."handle_types"(58)
    push_eh $P982
    .lex "self", self
    .lex "$/", param_983
.annotate "line", 316
    new $P984, "Undef"
    .lex "$past", $P984
    find_lex $P985, "$/"
    unless_null $P985, vivify_346
    new $P985, "Hash"
  vivify_346:
    set $P986, $P985["blockoid"]
    unless_null $P986, vivify_347
    new $P986, "Undef"
  vivify_347:
    $P987 = $P986."ast"()
    store_lex "$past", $P987
.annotate "line", 317
    find_lex $P988, "$past"
    $P988."blocktype"("method")
.annotate "line", 318
    find_lex $P989, "$past"
    $P989."control"("return_pir")
.annotate "line", 319
    find_lex $P990, "$past"
    unless_null $P990, vivify_348
    new $P990, "ResizablePMCArray"
  vivify_348:
    set $P991, $P990[0]
    unless_null $P991, vivify_349
    new $P991, "Undef"
  vivify_349:
    get_hll_global $P992, ["PAST"], "Op"
    $P993 = $P992."new"("    .lex \"self\", self" :named("inline"))
    $P991."unshift"($P993)
.annotate "line", 320
    find_lex $P994, "$past"
    $P994."symbol"("self", "lexical" :named("scope"))
.annotate "line", 321
    find_lex $P996, "$/"
    unless_null $P996, vivify_350
    new $P996, "Hash"
  vivify_350:
    set $P997, $P996["deflongname"]
    unless_null $P997, vivify_351
    new $P997, "Undef"
  vivify_351:
    unless $P997, if_995_end
    .const 'Sub' $P999 = "66_1258264465.36631" 
    capture_lex $P999
    $P999()
  if_995_end:
.annotate "line", 325
    find_lex $P1010, "$/"
    find_lex $P1011, "$past"
    $P1012 = $P1010."!make"($P1011)
.annotate "line", 315
    .return ($P1012)
  control_981:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1013, exception, "payload"
    .return ($P1013)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "_block998"  :anon :subid("66_1258264465.36631") :outer("65_1258264465.36631")
.annotate "line", 322
    new $P1000, "Undef"
    .lex "$name", $P1000
    find_lex $P1001, "$/"
    unless_null $P1001, vivify_352
    new $P1001, "Hash"
  vivify_352:
    set $P1002, $P1001["deflongname"]
    unless_null $P1002, vivify_353
    new $P1002, "ResizablePMCArray"
  vivify_353:
    set $P1003, $P1002[0]
    unless_null $P1003, vivify_354
    new $P1003, "Undef"
  vivify_354:
    $P1004 = $P1003."ast"()
    set $S1005, $P1004
    new $P1006, 'String'
    set $P1006, $S1005
    store_lex "$name", $P1006
.annotate "line", 323
    find_lex $P1007, "$past"
    find_lex $P1008, "$name"
    $P1009 = $P1007."name"($P1008)
.annotate "line", 321
    .return ($P1009)
.end


.namespace ["NQP";"Actions"]
.sub "signature"  :subid("67_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1017
.annotate "line", 329
    .const 'Sub' $P1028 = "68_1258264465.36631" 
    capture_lex $P1028
    new $P1016, 'ExceptionHandler'
    set_addr $P1016, control_1015
    $P1016."handle_types"(58)
    push_eh $P1016
    .lex "self", self
    .lex "$/", param_1017
.annotate "line", 330
    new $P1018, "Undef"
    .lex "$BLOCKINIT", $P1018
    get_global $P1019, "@BLOCK"
    unless_null $P1019, vivify_355
    new $P1019, "ResizablePMCArray"
  vivify_355:
    set $P1020, $P1019[0]
    unless_null $P1020, vivify_356
    new $P1020, "ResizablePMCArray"
  vivify_356:
    set $P1021, $P1020[0]
    unless_null $P1021, vivify_357
    new $P1021, "Undef"
  vivify_357:
    store_lex "$BLOCKINIT", $P1021
.annotate "line", 331
    find_lex $P1023, "$/"
    unless_null $P1023, vivify_358
    new $P1023, "Hash"
  vivify_358:
    set $P1024, $P1023["parameter"]
    unless_null $P1024, vivify_359
    new $P1024, "Undef"
  vivify_359:
    defined $I1025, $P1024
    unless $I1025, for_undef_360
    iter $P1022, $P1024
    new $P1035, 'ExceptionHandler'
    set_addr $P1035, loop1034_handler
    $P1035."handle_types"(65, 67, 66)
    push_eh $P1035
  loop1034_test:
    unless $P1022, loop1034_done
    shift $P1026, $P1022
  loop1034_redo:
    .const 'Sub' $P1028 = "68_1258264465.36631" 
    capture_lex $P1028
    $P1028($P1026)
  loop1034_next:
    goto loop1034_test
  loop1034_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1036, exception, 'type'
    eq $P1036, 65, loop1034_next
    eq $P1036, 67, loop1034_redo
  loop1034_done:
    pop_eh 
  for_undef_360:
.annotate "line", 329
    .return ($P1022)
  control_1015:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1037, exception, "payload"
    .return ($P1037)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "_block1027"  :anon :subid("68_1258264465.36631") :outer("67_1258264465.36631")
    .param pmc param_1029
.annotate "line", 331
    .lex "$_", param_1029
    find_lex $P1030, "$BLOCKINIT"
    find_lex $P1031, "$_"
    $P1032 = $P1031."ast"()
    $P1033 = $P1030."push"($P1032)
    .return ($P1033)
.end


.namespace ["NQP";"Actions"]
.sub "parameter"  :subid("69_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1041
.annotate "line", 334
    new $P1040, 'ExceptionHandler'
    set_addr $P1040, control_1039
    $P1040."handle_types"(58)
    push_eh $P1040
    .lex "self", self
    .lex "$/", param_1041
.annotate "line", 335
    new $P1042, "Undef"
    .lex "$quant", $P1042
.annotate "line", 336
    new $P1043, "Undef"
    .lex "$past", $P1043
.annotate "line", 335
    find_lex $P1044, "$/"
    unless_null $P1044, vivify_361
    new $P1044, "Hash"
  vivify_361:
    set $P1045, $P1044["quant"]
    unless_null $P1045, vivify_362
    new $P1045, "Undef"
  vivify_362:
    store_lex "$quant", $P1045
    find_lex $P1046, "$past"
.annotate "line", 337
    find_lex $P1048, "$/"
    unless_null $P1048, vivify_363
    new $P1048, "Hash"
  vivify_363:
    set $P1049, $P1048["named_param"]
    unless_null $P1049, vivify_364
    new $P1049, "Undef"
  vivify_364:
    if $P1049, if_1047
.annotate "line", 344
    find_lex $P1063, "$/"
    unless_null $P1063, vivify_365
    new $P1063, "Hash"
  vivify_365:
    set $P1064, $P1063["param_var"]
    unless_null $P1064, vivify_366
    new $P1064, "Undef"
  vivify_366:
    $P1065 = $P1064."ast"()
    store_lex "$past", $P1065
.annotate "line", 345
    find_lex $P1067, "$quant"
    set $S1068, $P1067
    iseq $I1069, $S1068, "*"
    if $I1069, if_1066
.annotate "line", 349
    find_lex $P1078, "$quant"
    set $S1079, $P1078
    iseq $I1080, $S1079, "?"
    unless $I1080, if_1077_end
.annotate "line", 350
    find_lex $P1081, "$past"
    find_lex $P1082, "$/"
    unless_null $P1082, vivify_367
    new $P1082, "Hash"
  vivify_367:
    set $P1083, $P1082["param_var"]
    unless_null $P1083, vivify_368
    new $P1083, "Hash"
  vivify_368:
    set $P1084, $P1083["sigil"]
    unless_null $P1084, vivify_369
    new $P1084, "Undef"
  vivify_369:
    $P1085 = "sigiltype"($P1084)
    $P1081."viviself"($P1085)
  if_1077_end:
.annotate "line", 349
    goto if_1066_end
  if_1066:
.annotate "line", 346
    find_lex $P1070, "$past"
    $P1070."slurpy"(1)
.annotate "line", 347
    find_lex $P1071, "$past"
    find_lex $P1072, "$/"
    unless_null $P1072, vivify_370
    new $P1072, "Hash"
  vivify_370:
    set $P1073, $P1072["param_var"]
    unless_null $P1073, vivify_371
    new $P1073, "Hash"
  vivify_371:
    set $P1074, $P1073["sigil"]
    unless_null $P1074, vivify_372
    new $P1074, "Undef"
  vivify_372:
    set $S1075, $P1074
    iseq $I1076, $S1075, "%"
    $P1071."named"($I1076)
  if_1066_end:
.annotate "line", 343
    goto if_1047_end
  if_1047:
.annotate "line", 338
    find_lex $P1050, "$/"
    unless_null $P1050, vivify_373
    new $P1050, "Hash"
  vivify_373:
    set $P1051, $P1050["named_param"]
    unless_null $P1051, vivify_374
    new $P1051, "Undef"
  vivify_374:
    $P1052 = $P1051."ast"()
    store_lex "$past", $P1052
.annotate "line", 339
    find_lex $P1054, "$quant"
    set $S1055, $P1054
    isne $I1056, $S1055, "!"
    unless $I1056, if_1053_end
.annotate "line", 340
    find_lex $P1057, "$past"
    find_lex $P1058, "$/"
    unless_null $P1058, vivify_375
    new $P1058, "Hash"
  vivify_375:
    set $P1059, $P1058["named_param"]
    unless_null $P1059, vivify_376
    new $P1059, "Hash"
  vivify_376:
    set $P1060, $P1059["param_var"]
    unless_null $P1060, vivify_377
    new $P1060, "Hash"
  vivify_377:
    set $P1061, $P1060["sigil"]
    unless_null $P1061, vivify_378
    new $P1061, "Undef"
  vivify_378:
    $P1062 = "sigiltype"($P1061)
    $P1057."viviself"($P1062)
  if_1053_end:
  if_1047_end:
.annotate "line", 353
    find_lex $P1087, "$/"
    unless_null $P1087, vivify_379
    new $P1087, "Hash"
  vivify_379:
    set $P1088, $P1087["default_value"]
    unless_null $P1088, vivify_380
    new $P1088, "Undef"
  vivify_380:
    unless $P1088, if_1086_end
.annotate "line", 354
    find_lex $P1090, "$quant"
    set $S1091, $P1090
    iseq $I1092, $S1091, "*"
    unless $I1092, if_1089_end
.annotate "line", 355
    find_lex $P1093, "$/"
    $P1094 = $P1093."CURSOR"()
    $P1094."panic"("Can't put default on slurpy parameter")
  if_1089_end:
.annotate "line", 357
    find_lex $P1096, "$quant"
    set $S1097, $P1096
    iseq $I1098, $S1097, "!"
    unless $I1098, if_1095_end
.annotate "line", 358
    find_lex $P1099, "$/"
    $P1100 = $P1099."CURSOR"()
    $P1100."panic"("Can't put default on required parameter")
  if_1095_end:
.annotate "line", 360
    find_lex $P1101, "$past"
    find_lex $P1102, "$/"
    unless_null $P1102, vivify_381
    new $P1102, "Hash"
  vivify_381:
    set $P1103, $P1102["default_value"]
    unless_null $P1103, vivify_382
    new $P1103, "ResizablePMCArray"
  vivify_382:
    set $P1104, $P1103[0]
    unless_null $P1104, vivify_383
    new $P1104, "Hash"
  vivify_383:
    set $P1105, $P1104["EXPR"]
    unless_null $P1105, vivify_384
    new $P1105, "Undef"
  vivify_384:
    $P1106 = $P1105."ast"()
    $P1101."viviself"($P1106)
  if_1086_end:
.annotate "line", 362
    find_lex $P1108, "$past"
    $P1109 = $P1108."viviself"()
    if $P1109, unless_1107_end
    get_global $P1110, "@BLOCK"
    unless_null $P1110, vivify_385
    new $P1110, "ResizablePMCArray"
  vivify_385:
    set $P1111, $P1110[0]
    unless_null $P1111, vivify_386
    new $P1111, "Undef"
  vivify_386:
    get_global $P1112, "@BLOCK"
    unless_null $P1112, vivify_387
    new $P1112, "ResizablePMCArray"
  vivify_387:
    set $P1113, $P1112[0]
    unless_null $P1113, vivify_388
    new $P1113, "Undef"
  vivify_388:
    $P1114 = $P1113."arity"()
    set $N1115, $P1114
    new $P1116, 'Float'
    set $P1116, $N1115
    add $P1117, $P1116, 1
    $P1111."arity"($P1117)
  unless_1107_end:
.annotate "line", 363
    find_lex $P1118, "$/"
    find_lex $P1119, "$past"
    $P1120 = $P1118."!make"($P1119)
.annotate "line", 334
    .return ($P1120)
  control_1039:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1121, exception, "payload"
    .return ($P1121)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "param_var"  :subid("70_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1125
.annotate "line", 366
    new $P1124, 'ExceptionHandler'
    set_addr $P1124, control_1123
    $P1124."handle_types"(58)
    push_eh $P1124
    .lex "self", self
    .lex "$/", param_1125
.annotate "line", 367
    new $P1126, "Undef"
    .lex "$name", $P1126
.annotate "line", 368
    new $P1127, "Undef"
    .lex "$past", $P1127
.annotate "line", 367
    find_lex $P1128, "$/"
    set $S1129, $P1128
    new $P1130, 'String'
    set $P1130, $S1129
    store_lex "$name", $P1130
.annotate "line", 368
    get_hll_global $P1131, ["PAST"], "Var"
    find_lex $P1132, "$name"
    find_lex $P1133, "$/"
    $P1134 = $P1131."new"($P1132 :named("name"), "parameter" :named("scope"), 1 :named("isdecl"), $P1133 :named("node"))
    store_lex "$past", $P1134
.annotate "line", 370
    get_global $P1135, "@BLOCK"
    unless_null $P1135, vivify_389
    new $P1135, "ResizablePMCArray"
  vivify_389:
    set $P1136, $P1135[0]
    unless_null $P1136, vivify_390
    new $P1136, "Undef"
  vivify_390:
    find_lex $P1137, "$name"
    $P1136."symbol"($P1137, "lexical" :named("scope"))
.annotate "line", 371
    find_lex $P1138, "$/"
    find_lex $P1139, "$past"
    $P1140 = $P1138."!make"($P1139)
.annotate "line", 366
    .return ($P1140)
  control_1123:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1141, exception, "payload"
    .return ($P1141)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "named_param"  :subid("71_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1145
.annotate "line", 374
    new $P1144, 'ExceptionHandler'
    set_addr $P1144, control_1143
    $P1144."handle_types"(58)
    push_eh $P1144
    .lex "self", self
    .lex "$/", param_1145
.annotate "line", 375
    new $P1146, "Undef"
    .lex "$past", $P1146
    find_lex $P1147, "$/"
    unless_null $P1147, vivify_391
    new $P1147, "Hash"
  vivify_391:
    set $P1148, $P1147["param_var"]
    unless_null $P1148, vivify_392
    new $P1148, "Undef"
  vivify_392:
    $P1149 = $P1148."ast"()
    store_lex "$past", $P1149
.annotate "line", 376
    find_lex $P1150, "$past"
    find_lex $P1151, "$/"
    unless_null $P1151, vivify_393
    new $P1151, "Hash"
  vivify_393:
    set $P1152, $P1151["param_var"]
    unless_null $P1152, vivify_394
    new $P1152, "Hash"
  vivify_394:
    set $P1153, $P1152["name"]
    unless_null $P1153, vivify_395
    new $P1153, "Undef"
  vivify_395:
    set $S1154, $P1153
    $P1150."named"($S1154)
.annotate "line", 377
    find_lex $P1155, "$/"
    find_lex $P1156, "$past"
    $P1157 = $P1155."!make"($P1156)
.annotate "line", 374
    .return ($P1157)
  control_1143:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1158, exception, "payload"
    .return ($P1158)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "regex_declarator"  :subid("72_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1162
    .param pmc param_1163 :optional
    .param int has_param_1163 :opt_flag
.annotate "line", 380
    .const 'Sub' $P1233 = "74_1258264465.36631" 
    capture_lex $P1233
    .const 'Sub' $P1180 = "73_1258264465.36631" 
    capture_lex $P1180
    new $P1161, 'ExceptionHandler'
    set_addr $P1161, control_1160
    $P1161."handle_types"(58)
    push_eh $P1161
    .lex "self", self
    .lex "$/", param_1162
    if has_param_1163, optparam_396
    new $P1164, "Undef"
    set param_1163, $P1164
  optparam_396:
    .lex "$key", param_1163
.annotate "line", 381
    new $P1165, "ResizablePMCArray"
    .lex "@MODIFIERS", $P1165
.annotate "line", 384
    new $P1166, "Undef"
    .lex "$name", $P1166
.annotate "line", 385
    new $P1167, "Undef"
    .lex "$past", $P1167
.annotate "line", 381

        $P1168 = get_hll_global ['Regex';'P6Regex';'Actions'], '@MODIFIERS'
    
    store_lex "@MODIFIERS", $P1168
.annotate "line", 384
    find_lex $P1169, "$/"
    unless_null $P1169, vivify_397
    new $P1169, "Hash"
  vivify_397:
    set $P1170, $P1169["deflongname"]
    unless_null $P1170, vivify_398
    new $P1170, "Undef"
  vivify_398:
    $P1171 = $P1170."ast"()
    set $S1172, $P1171
    new $P1173, 'String'
    set $P1173, $S1172
    store_lex "$name", $P1173
    find_lex $P1174, "$past"
.annotate "line", 386
    find_lex $P1176, "$key"
    set $S1177, $P1176
    iseq $I1178, $S1177, "open"
    if $I1178, if_1175
.annotate "line", 399
    find_lex $P1208, "$/"
    unless_null $P1208, vivify_399
    new $P1208, "Hash"
  vivify_399:
    set $P1209, $P1208["proto"]
    unless_null $P1209, vivify_400
    new $P1209, "Undef"
  vivify_400:
    if $P1209, if_1207
.annotate "line", 426
    .const 'Sub' $P1233 = "74_1258264465.36631" 
    capture_lex $P1233
    $P1233()
    goto if_1207_end
  if_1207:
.annotate "line", 401
    get_hll_global $P1210, ["PAST"], "Stmts"
.annotate "line", 402
    get_hll_global $P1211, ["PAST"], "Block"
    find_lex $P1212, "$name"
.annotate "line", 403
    get_hll_global $P1213, ["PAST"], "Op"
.annotate "line", 404
    get_hll_global $P1214, ["PAST"], "Var"
    $P1215 = $P1214."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1216, "$name"
    $P1217 = $P1213."new"($P1215, $P1216, "!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 403
    find_lex $P1218, "$/"
    $P1219 = $P1211."new"($P1217, $P1212 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1218 :named("node"))
.annotate "line", 413
    get_hll_global $P1220, ["PAST"], "Block"
    new $P1221, "String"
    assign $P1221, "!PREFIX__"
    find_lex $P1222, "$name"
    concat $P1223, $P1221, $P1222
.annotate "line", 414
    get_hll_global $P1224, ["PAST"], "Op"
.annotate "line", 415
    get_hll_global $P1225, ["PAST"], "Var"
    $P1226 = $P1225."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1227, "$name"
    $P1228 = $P1224."new"($P1226, $P1227, "!PREFIX__!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 414
    find_lex $P1229, "$/"
    $P1230 = $P1220."new"($P1228, $P1223 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1229 :named("node"))
.annotate "line", 413
    $P1231 = $P1210."new"($P1219, $P1230)
.annotate "line", 401
    store_lex "$past", $P1231
  if_1207_end:
.annotate "line", 399
    goto if_1175_end
  if_1175:
.annotate "line", 386
    .const 'Sub' $P1180 = "73_1258264465.36631" 
    capture_lex $P1180
    $P1180()
  if_1175_end:
.annotate "line", 442
    find_lex $P1259, "$/"
    find_lex $P1260, "$past"
    $P1261 = $P1259."!make"($P1260)
.annotate "line", 380
    .return ($P1261)
  control_1160:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1262, exception, "payload"
    .return ($P1262)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "_block1232"  :anon :subid("74_1258264465.36631") :outer("72_1258264465.36631")
.annotate "line", 427
    new $P1234, "Undef"
    .lex "$rpast", $P1234
.annotate "line", 428
    new $P1235, "Hash"
    .lex "%capnames", $P1235
.annotate "line", 427
    find_lex $P1236, "$/"
    unless_null $P1236, vivify_401
    new $P1236, "Hash"
  vivify_401:
    set $P1237, $P1236["p6regex"]
    unless_null $P1237, vivify_402
    new $P1237, "Undef"
  vivify_402:
    $P1238 = $P1237."ast"()
    store_lex "$rpast", $P1238
.annotate "line", 428
    get_hll_global $P1239, ["Regex";"P6Regex";"Actions"], "capnames"
    find_lex $P1240, "$rpast"
    $P1241 = $P1239($P1240, 0)
    store_lex "%capnames", $P1241
.annotate "line", 429
    new $P1242, "Integer"
    assign $P1242, 0
    find_lex $P1243, "%capnames"
    unless_null $P1243, vivify_403
    new $P1243, "Hash"
    store_lex "%capnames", $P1243
  vivify_403:
    set $P1243[""], $P1242
.annotate "line", 430
    get_hll_global $P1244, ["PAST"], "Regex"
    find_lex $P1245, "$rpast"
.annotate "line", 432
    get_hll_global $P1246, ["PAST"], "Regex"
    $P1247 = $P1246."new"("pass" :named("pasttype"))
    find_lex $P1248, "%capnames"
    $P1249 = $P1244."new"($P1245, $P1247, "concat" :named("pasttype"), $P1248 :named("capnames"))
.annotate "line", 430
    store_lex "$rpast", $P1249
.annotate "line", 436
    get_global $P1250, "@BLOCK"
    $P1251 = $P1250."shift"()
    store_lex "$past", $P1251
.annotate "line", 437
    find_lex $P1252, "$past"
    $P1252."blocktype"("method")
.annotate "line", 438
    find_lex $P1253, "$past"
    find_lex $P1254, "$name"
    $P1253."name"($P1254)
.annotate "line", 439
    find_lex $P1255, "$past"
    find_lex $P1256, "$rpast"
    $P1255."push"($P1256)
.annotate "line", 440
    find_lex $P1257, "@MODIFIERS"
    $P1258 = $P1257."shift"()
.annotate "line", 426
    .return ($P1258)
.end


.namespace ["NQP";"Actions"]
.sub "_block1179"  :anon :subid("73_1258264465.36631") :outer("72_1258264465.36631")
.annotate "line", 387
    new $P1181, "Hash"
    .lex "%h", $P1181
.annotate "line", 386
    find_lex $P1182, "%h"
.annotate "line", 388
    find_lex $P1184, "$/"
    unless_null $P1184, vivify_404
    new $P1184, "Hash"
  vivify_404:
    set $P1185, $P1184["sym"]
    unless_null $P1185, vivify_405
    new $P1185, "Undef"
  vivify_405:
    set $S1186, $P1185
    iseq $I1187, $S1186, "token"
    unless $I1187, if_1183_end
    new $P1188, "Integer"
    assign $P1188, 1
    find_lex $P1189, "%h"
    unless_null $P1189, vivify_406
    new $P1189, "Hash"
    store_lex "%h", $P1189
  vivify_406:
    set $P1189["r"], $P1188
  if_1183_end:
.annotate "line", 389
    find_lex $P1191, "$/"
    unless_null $P1191, vivify_407
    new $P1191, "Hash"
  vivify_407:
    set $P1192, $P1191["sym"]
    unless_null $P1192, vivify_408
    new $P1192, "Undef"
  vivify_408:
    set $S1193, $P1192
    iseq $I1194, $S1193, "rule"
    unless $I1194, if_1190_end
    new $P1195, "Integer"
    assign $P1195, 1
    find_lex $P1196, "%h"
    unless_null $P1196, vivify_409
    new $P1196, "Hash"
    store_lex "%h", $P1196
  vivify_409:
    set $P1196["r"], $P1195
    new $P1197, "Integer"
    assign $P1197, 1
    find_lex $P1198, "%h"
    unless_null $P1198, vivify_410
    new $P1198, "Hash"
    store_lex "%h", $P1198
  vivify_410:
    set $P1198["s"], $P1197
  if_1190_end:
.annotate "line", 390
    find_lex $P1199, "@MODIFIERS"
    find_lex $P1200, "%h"
    $P1199."unshift"($P1200)
.annotate "line", 391

            $P0 = find_lex '$name'
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0
        
.annotate "line", 395
    get_global $P1201, "@BLOCK"
    unless_null $P1201, vivify_411
    new $P1201, "ResizablePMCArray"
  vivify_411:
    set $P1202, $P1201[0]
    unless_null $P1202, vivify_412
    new $P1202, "Undef"
  vivify_412:
    $P1202."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate "line", 396
    get_global $P1203, "@BLOCK"
    unless_null $P1203, vivify_413
    new $P1203, "ResizablePMCArray"
  vivify_413:
    set $P1204, $P1203[0]
    unless_null $P1204, vivify_414
    new $P1204, "Undef"
  vivify_414:
    $P1204."symbol"("$/", "lexical" :named("scope"))
.annotate "line", 397
    new $P1205, "Exception"
    set $P1205['type'], 58
    new $P1206, "Integer"
    assign $P1206, 0
    setattribute $P1205, 'payload', $P1206
    throw $P1205
.annotate "line", 386
    .return ()
.end


.namespace ["NQP";"Actions"]
.sub "dotty"  :subid("75_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1266
.annotate "line", 446
    new $P1265, 'ExceptionHandler'
    set_addr $P1265, control_1264
    $P1265."handle_types"(58)
    push_eh $P1265
    .lex "self", self
    .lex "$/", param_1266
.annotate "line", 447
    new $P1267, "Undef"
    .lex "$past", $P1267
    find_lex $P1270, "$/"
    unless_null $P1270, vivify_415
    new $P1270, "Hash"
  vivify_415:
    set $P1271, $P1270["args"]
    unless_null $P1271, vivify_416
    new $P1271, "Undef"
  vivify_416:
    if $P1271, if_1269
    get_hll_global $P1276, ["PAST"], "Op"
    find_lex $P1277, "$/"
    $P1278 = $P1276."new"($P1277 :named("node"))
    set $P1268, $P1278
    goto if_1269_end
  if_1269:
    find_lex $P1272, "$/"
    unless_null $P1272, vivify_417
    new $P1272, "Hash"
  vivify_417:
    set $P1273, $P1272["args"]
    unless_null $P1273, vivify_418
    new $P1273, "ResizablePMCArray"
  vivify_418:
    set $P1274, $P1273[0]
    unless_null $P1274, vivify_419
    new $P1274, "Undef"
  vivify_419:
    $P1275 = $P1274."ast"()
    set $P1268, $P1275
  if_1269_end:
    store_lex "$past", $P1268
.annotate "line", 448
    find_lex $P1279, "$past"
    find_lex $P1280, "$/"
    unless_null $P1280, vivify_420
    new $P1280, "Hash"
  vivify_420:
    set $P1281, $P1280["identifier"]
    unless_null $P1281, vivify_421
    new $P1281, "Undef"
  vivify_421:
    set $S1282, $P1281
    $P1279."name"($S1282)
.annotate "line", 449
    find_lex $P1283, "$past"
    $P1283."pasttype"("callmethod")
.annotate "line", 450
    find_lex $P1284, "$/"
    find_lex $P1285, "$past"
    $P1286 = $P1284."!make"($P1285)
.annotate "line", 446
    .return ($P1286)
  control_1264:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1287, exception, "payload"
    .return ($P1287)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<self>"  :subid("76_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1291
.annotate "line", 455
    new $P1290, 'ExceptionHandler'
    set_addr $P1290, control_1289
    $P1290."handle_types"(58)
    push_eh $P1290
    .lex "self", self
    .lex "$/", param_1291
.annotate "line", 456
    find_lex $P1292, "$/"
    get_hll_global $P1293, ["PAST"], "Var"
    $P1294 = $P1293."new"("self" :named("name"))
    $P1295 = $P1292."!make"($P1294)
.annotate "line", 455
    .return ($P1295)
  control_1289:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1296, exception, "payload"
    .return ($P1296)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<identifier>"  :subid("77_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1300
.annotate "line", 459
    new $P1299, 'ExceptionHandler'
    set_addr $P1299, control_1298
    $P1299."handle_types"(58)
    push_eh $P1299
    .lex "self", self
    .lex "$/", param_1300
.annotate "line", 460
    new $P1301, "Undef"
    .lex "$past", $P1301
    find_lex $P1302, "$/"
    unless_null $P1302, vivify_422
    new $P1302, "Hash"
  vivify_422:
    set $P1303, $P1302["args"]
    unless_null $P1303, vivify_423
    new $P1303, "Undef"
  vivify_423:
    $P1304 = $P1303."ast"()
    store_lex "$past", $P1304
.annotate "line", 461
    find_lex $P1305, "$past"
    find_lex $P1306, "$/"
    unless_null $P1306, vivify_424
    new $P1306, "Hash"
  vivify_424:
    set $P1307, $P1306["identifier"]
    unless_null $P1307, vivify_425
    new $P1307, "Undef"
  vivify_425:
    set $S1308, $P1307
    $P1305."name"($S1308)
.annotate "line", 462
    find_lex $P1309, "$/"
    find_lex $P1310, "$past"
    $P1311 = $P1309."!make"($P1310)
.annotate "line", 459
    .return ($P1311)
  control_1298:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1312, exception, "payload"
    .return ($P1312)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<name>"  :subid("78_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1316
.annotate "line", 465
    new $P1315, 'ExceptionHandler'
    set_addr $P1315, control_1314
    $P1315."handle_types"(58)
    push_eh $P1315
    .lex "self", self
    .lex "$/", param_1316
.annotate "line", 466
    new $P1317, "Undef"
    .lex "$ns", $P1317
.annotate "line", 471
    new $P1318, "Undef"
    .lex "$name", $P1318
.annotate "line", 472
    new $P1319, "Undef"
    .lex "$var", $P1319
.annotate "line", 474
    new $P1320, "Undef"
    .lex "$past", $P1320
.annotate "line", 466
    find_lex $P1321, "$/"
    unless_null $P1321, vivify_426
    new $P1321, "Hash"
  vivify_426:
    set $P1322, $P1321["name"]
    unless_null $P1322, vivify_427
    new $P1322, "Hash"
  vivify_427:
    set $P1323, $P1322["identifier"]
    unless_null $P1323, vivify_428
    new $P1323, "Undef"
  vivify_428:
    store_lex "$ns", $P1323
.annotate "line", 467

               $P0 = find_lex '$ns'
               $P1324 = clone $P0
           
    store_lex "$ns", $P1324
.annotate "line", 471
    find_lex $P1325, "$ns"
    $P1326 = $P1325."pop"()
    store_lex "$name", $P1326
.annotate "line", 473
    get_hll_global $P1327, ["PAST"], "Var"
    find_lex $P1328, "$name"
    set $S1329, $P1328
    find_lex $P1330, "$ns"
    $P1331 = $P1327."new"($S1329 :named("name"), $P1330 :named("namespace"), "package" :named("scope"))
    store_lex "$var", $P1331
.annotate "line", 474
    find_lex $P1332, "$var"
    store_lex "$past", $P1332
.annotate "line", 475
    find_lex $P1334, "$/"
    unless_null $P1334, vivify_429
    new $P1334, "Hash"
  vivify_429:
    set $P1335, $P1334["args"]
    unless_null $P1335, vivify_430
    new $P1335, "Undef"
  vivify_430:
    unless $P1335, if_1333_end
.annotate "line", 476
    find_lex $P1336, "$/"
    unless_null $P1336, vivify_431
    new $P1336, "Hash"
  vivify_431:
    set $P1337, $P1336["args"]
    unless_null $P1337, vivify_432
    new $P1337, "ResizablePMCArray"
  vivify_432:
    set $P1338, $P1337[0]
    unless_null $P1338, vivify_433
    new $P1338, "Undef"
  vivify_433:
    $P1339 = $P1338."ast"()
    store_lex "$past", $P1339
.annotate "line", 477
    find_lex $P1340, "$past"
    find_lex $P1341, "$var"
    $P1340."unshift"($P1341)
  if_1333_end:
.annotate "line", 479
    find_lex $P1342, "$/"
    find_lex $P1343, "$past"
    $P1344 = $P1342."!make"($P1343)
.annotate "line", 465
    .return ($P1344)
  control_1314:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1345, exception, "payload"
    .return ($P1345)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<pir::op>"  :subid("79_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1349
.annotate "line", 482
    new $P1348, 'ExceptionHandler'
    set_addr $P1348, control_1347
    $P1348."handle_types"(58)
    push_eh $P1348
    .lex "self", self
    .lex "$/", param_1349
.annotate "line", 483
    new $P1350, "Undef"
    .lex "$past", $P1350
.annotate "line", 484
    new $P1351, "Undef"
    .lex "$pirop", $P1351
.annotate "line", 483
    find_lex $P1354, "$/"
    unless_null $P1354, vivify_434
    new $P1354, "Hash"
  vivify_434:
    set $P1355, $P1354["args"]
    unless_null $P1355, vivify_435
    new $P1355, "Undef"
  vivify_435:
    if $P1355, if_1353
    get_hll_global $P1360, ["PAST"], "Op"
    find_lex $P1361, "$/"
    $P1362 = $P1360."new"($P1361 :named("node"))
    set $P1352, $P1362
    goto if_1353_end
  if_1353:
    find_lex $P1356, "$/"
    unless_null $P1356, vivify_436
    new $P1356, "Hash"
  vivify_436:
    set $P1357, $P1356["args"]
    unless_null $P1357, vivify_437
    new $P1357, "ResizablePMCArray"
  vivify_437:
    set $P1358, $P1357[0]
    unless_null $P1358, vivify_438
    new $P1358, "Undef"
  vivify_438:
    $P1359 = $P1358."ast"()
    set $P1352, $P1359
  if_1353_end:
    store_lex "$past", $P1352
.annotate "line", 484
    find_lex $P1363, "$/"
    unless_null $P1363, vivify_439
    new $P1363, "Hash"
  vivify_439:
    set $P1364, $P1363["op"]
    unless_null $P1364, vivify_440
    new $P1364, "Undef"
  vivify_440:
    set $S1365, $P1364
    new $P1366, 'String'
    set $P1366, $S1365
    store_lex "$pirop", $P1366
.annotate "line", 485

        $P0 = find_lex '$pirop'
        $S0 = $P0
        $P0 = split '__', $S0
        $S0 = join ' ', $P0
        $P1367 = box $S0
    
    store_lex "$pirop", $P1367
.annotate "line", 492
    find_lex $P1368, "$past"
    find_lex $P1369, "$pirop"
    $P1368."pirop"($P1369)
.annotate "line", 493
    find_lex $P1370, "$past"
    $P1370."pasttype"("pirop")
.annotate "line", 494
    find_lex $P1371, "$/"
    find_lex $P1372, "$past"
    $P1373 = $P1371."!make"($P1372)
.annotate "line", 482
    .return ($P1373)
  control_1347:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1374, exception, "payload"
    .return ($P1374)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "args"  :subid("80_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1378
.annotate "line", 497
    new $P1377, 'ExceptionHandler'
    set_addr $P1377, control_1376
    $P1377."handle_types"(58)
    push_eh $P1377
    .lex "self", self
    .lex "$/", param_1378
    find_lex $P1379, "$/"
    find_lex $P1380, "$/"
    unless_null $P1380, vivify_441
    new $P1380, "Hash"
  vivify_441:
    set $P1381, $P1380["arglist"]
    unless_null $P1381, vivify_442
    new $P1381, "Undef"
  vivify_442:
    $P1382 = $P1381."ast"()
    $P1383 = $P1379."!make"($P1382)
    .return ($P1383)
  control_1376:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1384, exception, "payload"
    .return ($P1384)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "arglist"  :subid("81_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1388
.annotate "line", 499
    .const 'Sub' $P1399 = "82_1258264465.36631" 
    capture_lex $P1399
    new $P1387, 'ExceptionHandler'
    set_addr $P1387, control_1386
    $P1387."handle_types"(58)
    push_eh $P1387
    .lex "self", self
    .lex "$/", param_1388
.annotate "line", 500
    new $P1389, "Undef"
    .lex "$past", $P1389
.annotate "line", 508
    new $P1390, "Undef"
    .lex "$i", $P1390
.annotate "line", 509
    new $P1391, "Undef"
    .lex "$n", $P1391
.annotate "line", 500
    get_hll_global $P1392, ["PAST"], "Op"
    find_lex $P1393, "$/"
    $P1394 = $P1392."new"("call" :named("pasttype"), $P1393 :named("node"))
    store_lex "$past", $P1394
.annotate "line", 501
    find_lex $P1396, "$/"
    unless_null $P1396, vivify_443
    new $P1396, "Hash"
  vivify_443:
    set $P1397, $P1396["EXPR"]
    unless_null $P1397, vivify_444
    new $P1397, "Undef"
  vivify_444:
    unless $P1397, if_1395_end
    .const 'Sub' $P1399 = "82_1258264465.36631" 
    capture_lex $P1399
    $P1399()
  if_1395_end:
.annotate "line", 508
    new $P1431, "Integer"
    assign $P1431, 0
    store_lex "$i", $P1431
.annotate "line", 509
    find_lex $P1432, "$past"
    $P1433 = $P1432."list"()
    set $N1434, $P1433
    new $P1435, 'Float'
    set $P1435, $N1434
    store_lex "$n", $P1435
.annotate "line", 510
    new $P1463, 'ExceptionHandler'
    set_addr $P1463, loop1462_handler
    $P1463."handle_types"(65, 67, 66)
    push_eh $P1463
  loop1462_test:
    find_lex $P1436, "$i"
    set $N1437, $P1436
    find_lex $P1438, "$n"
    set $N1439, $P1438
    islt $I1440, $N1437, $N1439
    unless $I1440, loop1462_done
  loop1462_redo:
.annotate "line", 511
    find_lex $P1442, "$i"
    set $I1443, $P1442
    find_lex $P1444, "$past"
    unless_null $P1444, vivify_448
    new $P1444, "ResizablePMCArray"
  vivify_448:
    set $P1445, $P1444[$I1443]
    unless_null $P1445, vivify_449
    new $P1445, "Undef"
  vivify_449:
    $S1446 = $P1445."name"()
    iseq $I1447, $S1446, "&prefix:<|>"
    unless $I1447, if_1441_end
.annotate "line", 512
    find_lex $P1448, "$i"
    set $I1449, $P1448
    find_lex $P1450, "$past"
    unless_null $P1450, vivify_450
    new $P1450, "ResizablePMCArray"
  vivify_450:
    set $P1451, $P1450[$I1449]
    unless_null $P1451, vivify_451
    new $P1451, "ResizablePMCArray"
  vivify_451:
    set $P1452, $P1451[0]
    unless_null $P1452, vivify_452
    new $P1452, "Undef"
  vivify_452:
    find_lex $P1453, "$i"
    set $I1454, $P1453
    find_lex $P1455, "$past"
    unless_null $P1455, vivify_453
    new $P1455, "ResizablePMCArray"
    store_lex "$past", $P1455
  vivify_453:
    set $P1455[$I1454], $P1452
.annotate "line", 513
    find_lex $P1456, "$i"
    set $I1457, $P1456
    find_lex $P1458, "$past"
    unless_null $P1458, vivify_454
    new $P1458, "ResizablePMCArray"
  vivify_454:
    set $P1459, $P1458[$I1457]
    unless_null $P1459, vivify_455
    new $P1459, "Undef"
  vivify_455:
    $P1459."flat"(1)
  if_1441_end:
.annotate "line", 511
    find_lex $P1460, "$i"
    clone $P1461, $P1460
    inc $P1460
  loop1462_next:
.annotate "line", 510
    goto loop1462_test
  loop1462_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1464, exception, 'type'
    eq $P1464, 65, loop1462_next
    eq $P1464, 67, loop1462_redo
  loop1462_done:
    pop_eh 
.annotate "line", 517
    find_lex $P1465, "$/"
    find_lex $P1466, "$past"
    $P1467 = $P1465."!make"($P1466)
.annotate "line", 499
    .return ($P1467)
  control_1386:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1468, exception, "payload"
    .return ($P1468)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "_block1398"  :anon :subid("82_1258264465.36631") :outer("81_1258264465.36631")
.annotate "line", 501
    .const 'Sub' $P1420 = "83_1258264465.36631" 
    capture_lex $P1420
.annotate "line", 502
    new $P1400, "Undef"
    .lex "$expr", $P1400
    find_lex $P1401, "$/"
    unless_null $P1401, vivify_445
    new $P1401, "Hash"
  vivify_445:
    set $P1402, $P1401["EXPR"]
    unless_null $P1402, vivify_446
    new $P1402, "Undef"
  vivify_446:
    $P1403 = $P1402."ast"()
    store_lex "$expr", $P1403
.annotate "line", 503
    find_lex $P1408, "$expr"
    $S1409 = $P1408."name"()
    iseq $I1410, $S1409, "&infix:<,>"
    if $I1410, if_1407
    new $P1406, 'Integer'
    set $P1406, $I1410
    goto if_1407_end
  if_1407:
    find_lex $P1411, "$expr"
    $P1412 = $P1411."named"()
    isfalse $I1413, $P1412
    new $P1406, 'Integer'
    set $P1406, $I1413
  if_1407_end:
    if $P1406, if_1405
.annotate "line", 506
    find_lex $P1428, "$past"
    find_lex $P1429, "$expr"
    $P1430 = $P1428."push"($P1429)
    set $P1404, $P1430
.annotate "line", 503
    goto if_1405_end
  if_1405:
.annotate "line", 504
    find_lex $P1415, "$expr"
    $P1416 = $P1415."list"()
    defined $I1417, $P1416
    unless $I1417, for_undef_447
    iter $P1414, $P1416
    new $P1426, 'ExceptionHandler'
    set_addr $P1426, loop1425_handler
    $P1426."handle_types"(65, 67, 66)
    push_eh $P1426
  loop1425_test:
    unless $P1414, loop1425_done
    shift $P1418, $P1414
  loop1425_redo:
    .const 'Sub' $P1420 = "83_1258264465.36631" 
    capture_lex $P1420
    $P1420($P1418)
  loop1425_next:
    goto loop1425_test
  loop1425_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1427, exception, 'type'
    eq $P1427, 65, loop1425_next
    eq $P1427, 67, loop1425_redo
  loop1425_done:
    pop_eh 
  for_undef_447:
.annotate "line", 503
    set $P1404, $P1414
  if_1405_end:
.annotate "line", 501
    .return ($P1404)
.end


.namespace ["NQP";"Actions"]
.sub "_block1419"  :anon :subid("83_1258264465.36631") :outer("82_1258264465.36631")
    .param pmc param_1421
.annotate "line", 504
    .lex "$_", param_1421
    find_lex $P1422, "$past"
    find_lex $P1423, "$_"
    $P1424 = $P1422."push"($P1423)
    .return ($P1424)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<value>"  :subid("84_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1472
.annotate "line", 521
    new $P1471, 'ExceptionHandler'
    set_addr $P1471, control_1470
    $P1471."handle_types"(58)
    push_eh $P1471
    .lex "self", self
    .lex "$/", param_1472
    find_lex $P1473, "$/"
    find_lex $P1474, "$/"
    unless_null $P1474, vivify_456
    new $P1474, "Hash"
  vivify_456:
    set $P1475, $P1474["value"]
    unless_null $P1475, vivify_457
    new $P1475, "Undef"
  vivify_457:
    $P1476 = $P1475."ast"()
    $P1477 = $P1473."!make"($P1476)
    .return ($P1477)
  control_1470:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1478, exception, "payload"
    .return ($P1478)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<( )>"  :subid("85_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1482
.annotate "line", 523
    new $P1481, 'ExceptionHandler'
    set_addr $P1481, control_1480
    $P1481."handle_types"(58)
    push_eh $P1481
    .lex "self", self
    .lex "$/", param_1482
.annotate "line", 524
    find_lex $P1483, "$/"
.annotate "line", 525
    find_lex $P1486, "$/"
    unless_null $P1486, vivify_458
    new $P1486, "Hash"
  vivify_458:
    set $P1487, $P1486["EXPR"]
    unless_null $P1487, vivify_459
    new $P1487, "Undef"
  vivify_459:
    if $P1487, if_1485
.annotate "line", 526
    get_hll_global $P1492, ["PAST"], "Op"
    find_lex $P1493, "$/"
    $P1494 = $P1492."new"("list" :named("pasttype"), $P1493 :named("node"))
    set $P1484, $P1494
.annotate "line", 525
    goto if_1485_end
  if_1485:
    find_lex $P1488, "$/"
    unless_null $P1488, vivify_460
    new $P1488, "Hash"
  vivify_460:
    set $P1489, $P1488["EXPR"]
    unless_null $P1489, vivify_461
    new $P1489, "ResizablePMCArray"
  vivify_461:
    set $P1490, $P1489[0]
    unless_null $P1490, vivify_462
    new $P1490, "Undef"
  vivify_462:
    $P1491 = $P1490."ast"()
    set $P1484, $P1491
  if_1485_end:
    $P1495 = $P1483."!make"($P1484)
.annotate "line", 523
    .return ($P1495)
  control_1480:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1496, exception, "payload"
    .return ($P1496)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<[ ]>"  :subid("86_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1500
.annotate "line", 529
    new $P1499, 'ExceptionHandler'
    set_addr $P1499, control_1498
    $P1499."handle_types"(58)
    push_eh $P1499
    .lex "self", self
    .lex "$/", param_1500
.annotate "line", 530
    new $P1501, "Undef"
    .lex "$past", $P1501
.annotate "line", 529
    find_lex $P1502, "$past"
.annotate "line", 531
    find_lex $P1504, "$/"
    unless_null $P1504, vivify_463
    new $P1504, "Hash"
  vivify_463:
    set $P1505, $P1504["EXPR"]
    unless_null $P1505, vivify_464
    new $P1505, "Undef"
  vivify_464:
    if $P1505, if_1503
.annotate "line", 538
    get_hll_global $P1517, ["PAST"], "Op"
    $P1518 = $P1517."new"("list" :named("pasttype"))
    store_lex "$past", $P1518
.annotate "line", 537
    goto if_1503_end
  if_1503:
.annotate "line", 532
    find_lex $P1506, "$/"
    unless_null $P1506, vivify_465
    new $P1506, "Hash"
  vivify_465:
    set $P1507, $P1506["EXPR"]
    unless_null $P1507, vivify_466
    new $P1507, "ResizablePMCArray"
  vivify_466:
    set $P1508, $P1507[0]
    unless_null $P1508, vivify_467
    new $P1508, "Undef"
  vivify_467:
    $P1509 = $P1508."ast"()
    store_lex "$past", $P1509
.annotate "line", 533
    find_lex $P1511, "$past"
    $S1512 = $P1511."name"()
    isne $I1513, $S1512, "&infix:<,>"
    unless $I1513, if_1510_end
.annotate "line", 534
    get_hll_global $P1514, ["PAST"], "Op"
    find_lex $P1515, "$past"
    $P1516 = $P1514."new"($P1515, "list" :named("pasttype"))
    store_lex "$past", $P1516
  if_1510_end:
  if_1503_end:
.annotate "line", 540
    find_lex $P1519, "$past"
    $P1519."name"("&circumfix:<[ ]>")
.annotate "line", 541
    find_lex $P1520, "$/"
    find_lex $P1521, "$past"
    $P1522 = $P1520."!make"($P1521)
.annotate "line", 529
    .return ($P1522)
  control_1498:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1523, exception, "payload"
    .return ($P1523)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<ang>"  :subid("87_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1527
.annotate "line", 544
    new $P1526, 'ExceptionHandler'
    set_addr $P1526, control_1525
    $P1526."handle_types"(58)
    push_eh $P1526
    .lex "self", self
    .lex "$/", param_1527
    find_lex $P1528, "$/"
    find_lex $P1529, "$/"
    unless_null $P1529, vivify_468
    new $P1529, "Hash"
  vivify_468:
    set $P1530, $P1529["quote_EXPR"]
    unless_null $P1530, vivify_469
    new $P1530, "Undef"
  vivify_469:
    $P1531 = $P1530."ast"()
    $P1532 = $P1528."!make"($P1531)
    .return ($P1532)
  control_1525:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1533, exception, "payload"
    .return ($P1533)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<{ }>"  :subid("88_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1537
.annotate "line", 546
    new $P1536, 'ExceptionHandler'
    set_addr $P1536, control_1535
    $P1536."handle_types"(58)
    push_eh $P1536
    .lex "self", self
    .lex "$/", param_1537
.annotate "line", 547
    find_lex $P1538, "$/"
    find_lex $P1541, "$/"
    unless_null $P1541, vivify_470
    new $P1541, "Hash"
  vivify_470:
    set $P1542, $P1541["pblock"]
    unless_null $P1542, vivify_471
    new $P1542, "Hash"
  vivify_471:
    set $P1543, $P1542["blockoid"]
    unless_null $P1543, vivify_472
    new $P1543, "Hash"
  vivify_472:
    set $P1544, $P1543["statementlist"]
    unless_null $P1544, vivify_473
    new $P1544, "Hash"
  vivify_473:
    set $P1545, $P1544["statement"]
    unless_null $P1545, vivify_474
    new $P1545, "Undef"
  vivify_474:
    set $N1546, $P1545
    new $P1547, "Integer"
    assign $P1547, 0
    set $N1548, $P1547
    isgt $I1549, $N1546, $N1548
    if $I1549, if_1540
.annotate "line", 549
    get_hll_global $P1553, ["PAST"], "Op"
    find_lex $P1554, "$/"
    $P1555 = $P1553."new"("    %r = new [\"Hash\"]" :named("inline"), $P1554 :named("node"))
    set $P1539, $P1555
.annotate "line", 547
    goto if_1540_end
  if_1540:
.annotate "line", 548
    find_lex $P1550, "$/"
    unless_null $P1550, vivify_475
    new $P1550, "Hash"
  vivify_475:
    set $P1551, $P1550["pblock"]
    unless_null $P1551, vivify_476
    new $P1551, "Undef"
  vivify_476:
    $P1552 = $P1551."ast"()
    set $P1539, $P1552
  if_1540_end:
    $P1556 = $P1538."!make"($P1539)
.annotate "line", 546
    .return ($P1556)
  control_1535:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1557, exception, "payload"
    .return ($P1557)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<sigil>"  :subid("89_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1561
.annotate "line", 552
    new $P1560, 'ExceptionHandler'
    set_addr $P1560, control_1559
    $P1560."handle_types"(58)
    push_eh $P1560
    .lex "self", self
    .lex "$/", param_1561
.annotate "line", 553
    new $P1562, "Undef"
    .lex "$name", $P1562
    find_lex $P1565, "$/"
    unless_null $P1565, vivify_477
    new $P1565, "Hash"
  vivify_477:
    set $P1566, $P1565["sigil"]
    unless_null $P1566, vivify_478
    new $P1566, "Undef"
  vivify_478:
    set $S1567, $P1566
    iseq $I1568, $S1567, "@"
    if $I1568, if_1564
.annotate "line", 554
    find_lex $P1572, "$/"
    unless_null $P1572, vivify_479
    new $P1572, "Hash"
  vivify_479:
    set $P1573, $P1572["sigil"]
    unless_null $P1573, vivify_480
    new $P1573, "Undef"
  vivify_480:
    set $S1574, $P1573
    iseq $I1575, $S1574, "%"
    if $I1575, if_1571
    new $P1577, "String"
    assign $P1577, "item"
    set $P1570, $P1577
    goto if_1571_end
  if_1571:
    new $P1576, "String"
    assign $P1576, "hash"
    set $P1570, $P1576
  if_1571_end:
    set $P1563, $P1570
.annotate "line", 553
    goto if_1564_end
  if_1564:
    new $P1569, "String"
    assign $P1569, "list"
    set $P1563, $P1569
  if_1564_end:
    store_lex "$name", $P1563
.annotate "line", 556
    find_lex $P1578, "$/"
    get_hll_global $P1579, ["PAST"], "Op"
    find_lex $P1580, "$name"
    find_lex $P1581, "$/"
    unless_null $P1581, vivify_481
    new $P1581, "Hash"
  vivify_481:
    set $P1582, $P1581["semilist"]
    unless_null $P1582, vivify_482
    new $P1582, "Undef"
  vivify_482:
    $P1583 = $P1582."ast"()
    $P1584 = $P1579."new"($P1583, "callmethod" :named("pasttype"), $P1580 :named("name"))
    $P1585 = $P1578."!make"($P1584)
.annotate "line", 552
    .return ($P1585)
  control_1559:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1586, exception, "payload"
    .return ($P1586)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "semilist"  :subid("90_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1590
.annotate "line", 559
    new $P1589, 'ExceptionHandler'
    set_addr $P1589, control_1588
    $P1589."handle_types"(58)
    push_eh $P1589
    .lex "self", self
    .lex "$/", param_1590
    find_lex $P1591, "$/"
    find_lex $P1592, "$/"
    unless_null $P1592, vivify_483
    new $P1592, "Hash"
  vivify_483:
    set $P1593, $P1592["statement"]
    unless_null $P1593, vivify_484
    new $P1593, "Undef"
  vivify_484:
    $P1594 = $P1593."ast"()
    $P1595 = $P1591."!make"($P1594)
    .return ($P1595)
  control_1588:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1596, exception, "payload"
    .return ($P1596)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<[ ]>"  :subid("91_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1600
.annotate "line", 561
    new $P1599, 'ExceptionHandler'
    set_addr $P1599, control_1598
    $P1599."handle_types"(58)
    push_eh $P1599
    .lex "self", self
    .lex "$/", param_1600
.annotate "line", 562
    find_lex $P1601, "$/"
    get_hll_global $P1602, ["PAST"], "Var"
    find_lex $P1603, "$/"
    unless_null $P1603, vivify_485
    new $P1603, "Hash"
  vivify_485:
    set $P1604, $P1603["EXPR"]
    unless_null $P1604, vivify_486
    new $P1604, "Undef"
  vivify_486:
    $P1605 = $P1604."ast"()
    $P1606 = $P1602."new"($P1605, "keyed_int" :named("scope"), "Undef" :named("viviself"), "ResizablePMCArray" :named("vivibase"))
    $P1607 = $P1601."!make"($P1606)
.annotate "line", 561
    .return ($P1607)
  control_1598:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1608, exception, "payload"
    .return ($P1608)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<{ }>"  :subid("92_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1612
.annotate "line", 567
    new $P1611, 'ExceptionHandler'
    set_addr $P1611, control_1610
    $P1611."handle_types"(58)
    push_eh $P1611
    .lex "self", self
    .lex "$/", param_1612
.annotate "line", 568
    find_lex $P1613, "$/"
    get_hll_global $P1614, ["PAST"], "Var"
    find_lex $P1615, "$/"
    unless_null $P1615, vivify_487
    new $P1615, "Hash"
  vivify_487:
    set $P1616, $P1615["EXPR"]
    unless_null $P1616, vivify_488
    new $P1616, "Undef"
  vivify_488:
    $P1617 = $P1616."ast"()
    $P1618 = $P1614."new"($P1617, "keyed" :named("scope"), "Undef" :named("viviself"), "Hash" :named("vivibase"))
    $P1619 = $P1613."!make"($P1618)
.annotate "line", 567
    .return ($P1619)
  control_1610:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1620, exception, "payload"
    .return ($P1620)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<ang>"  :subid("93_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1624
.annotate "line", 573
    new $P1623, 'ExceptionHandler'
    set_addr $P1623, control_1622
    $P1623."handle_types"(58)
    push_eh $P1623
    .lex "self", self
    .lex "$/", param_1624
.annotate "line", 574
    find_lex $P1625, "$/"
    get_hll_global $P1626, ["PAST"], "Var"
    find_lex $P1627, "$/"
    unless_null $P1627, vivify_489
    new $P1627, "Hash"
  vivify_489:
    set $P1628, $P1627["quote_EXPR"]
    unless_null $P1628, vivify_490
    new $P1628, "Undef"
  vivify_490:
    $P1629 = $P1628."ast"()
    $P1630 = $P1626."new"($P1629, "keyed" :named("scope"), "Undef" :named("viviself"), "Hash" :named("vivibase"))
    $P1631 = $P1625."!make"($P1630)
.annotate "line", 573
    .return ($P1631)
  control_1622:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1632, exception, "payload"
    .return ($P1632)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<( )>"  :subid("94_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1636
.annotate "line", 579
    new $P1635, 'ExceptionHandler'
    set_addr $P1635, control_1634
    $P1635."handle_types"(58)
    push_eh $P1635
    .lex "self", self
    .lex "$/", param_1636
.annotate "line", 580
    find_lex $P1637, "$/"
    find_lex $P1638, "$/"
    unless_null $P1638, vivify_491
    new $P1638, "Hash"
  vivify_491:
    set $P1639, $P1638["arglist"]
    unless_null $P1639, vivify_492
    new $P1639, "Undef"
  vivify_492:
    $P1640 = $P1639."ast"()
    $P1641 = $P1637."!make"($P1640)
.annotate "line", 579
    .return ($P1641)
  control_1634:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1642, exception, "payload"
    .return ($P1642)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "value"  :subid("95_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1646
.annotate "line", 583
    new $P1645, 'ExceptionHandler'
    set_addr $P1645, control_1644
    $P1645."handle_types"(58)
    push_eh $P1645
    .lex "self", self
    .lex "$/", param_1646
.annotate "line", 584
    new $P1647, "Undef"
    .lex "$past", $P1647
.annotate "line", 585
    find_lex $P1650, "$/"
    unless_null $P1650, vivify_493
    new $P1650, "Hash"
  vivify_493:
    set $P1651, $P1650["quote"]
    unless_null $P1651, vivify_494
    new $P1651, "Undef"
  vivify_494:
    if $P1651, if_1649
.annotate "line", 586
    get_hll_global $P1655, ["PAST"], "Val"
.annotate "line", 588
    find_lex $P1658, "$/"
    unless_null $P1658, vivify_495
    new $P1658, "Hash"
  vivify_495:
    set $P1659, $P1658["dec_number"]
    unless_null $P1659, vivify_496
    new $P1659, "Undef"
  vivify_496:
    if $P1659, if_1657
.annotate "line", 589
    find_lex $P1663, "$/"
    unless_null $P1663, vivify_497
    new $P1663, "Hash"
  vivify_497:
    set $P1664, $P1663["integer"]
    unless_null $P1664, vivify_498
    new $P1664, "Undef"
  vivify_498:
    $P1665 = $P1664."ast"()
    set $P1656, $P1665
.annotate "line", 588
    goto if_1657_end
  if_1657:
    find_lex $P1660, "$/"
    unless_null $P1660, vivify_499
    new $P1660, "Hash"
  vivify_499:
    set $P1661, $P1660["dec_number"]
    unless_null $P1661, vivify_500
    new $P1661, "Undef"
  vivify_500:
    $P1662 = $P1661."ast"()
    set $P1656, $P1662
  if_1657_end:
    $P1666 = $P1655."new"($P1656 :named("value"))
.annotate "line", 586
    set $P1648, $P1666
.annotate "line", 585
    goto if_1649_end
  if_1649:
    find_lex $P1652, "$/"
    unless_null $P1652, vivify_501
    new $P1652, "Hash"
  vivify_501:
    set $P1653, $P1652["quote"]
    unless_null $P1653, vivify_502
    new $P1653, "Undef"
  vivify_502:
    $P1654 = $P1653."ast"()
    set $P1648, $P1654
  if_1649_end:
    store_lex "$past", $P1648
.annotate "line", 591
    find_lex $P1667, "$/"
    find_lex $P1668, "$past"
    $P1669 = $P1667."!make"($P1668)
.annotate "line", 583
    .return ($P1669)
  control_1644:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1670, exception, "payload"
    .return ($P1670)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<apos>"  :subid("96_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1674
.annotate "line", 594
    new $P1673, 'ExceptionHandler'
    set_addr $P1673, control_1672
    $P1673."handle_types"(58)
    push_eh $P1673
    .lex "self", self
    .lex "$/", param_1674
    find_lex $P1675, "$/"
    find_lex $P1676, "$/"
    unless_null $P1676, vivify_503
    new $P1676, "Hash"
  vivify_503:
    set $P1677, $P1676["quote_EXPR"]
    unless_null $P1677, vivify_504
    new $P1677, "Undef"
  vivify_504:
    $P1678 = $P1677."ast"()
    $P1679 = $P1675."!make"($P1678)
    .return ($P1679)
  control_1672:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1680, exception, "payload"
    .return ($P1680)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<dblq>"  :subid("97_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1684
.annotate "line", 595
    new $P1683, 'ExceptionHandler'
    set_addr $P1683, control_1682
    $P1683."handle_types"(58)
    push_eh $P1683
    .lex "self", self
    .lex "$/", param_1684
    find_lex $P1685, "$/"
    find_lex $P1686, "$/"
    unless_null $P1686, vivify_505
    new $P1686, "Hash"
  vivify_505:
    set $P1687, $P1686["quote_EXPR"]
    unless_null $P1687, vivify_506
    new $P1687, "Undef"
  vivify_506:
    $P1688 = $P1687."ast"()
    $P1689 = $P1685."!make"($P1688)
    .return ($P1689)
  control_1682:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1690, exception, "payload"
    .return ($P1690)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<qq>"  :subid("98_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1694
.annotate "line", 596
    new $P1693, 'ExceptionHandler'
    set_addr $P1693, control_1692
    $P1693."handle_types"(58)
    push_eh $P1693
    .lex "self", self
    .lex "$/", param_1694
    find_lex $P1695, "$/"
    find_lex $P1696, "$/"
    unless_null $P1696, vivify_507
    new $P1696, "Hash"
  vivify_507:
    set $P1697, $P1696["quote_EXPR"]
    unless_null $P1697, vivify_508
    new $P1697, "Undef"
  vivify_508:
    $P1698 = $P1697."ast"()
    $P1699 = $P1695."!make"($P1698)
    .return ($P1699)
  control_1692:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1700, exception, "payload"
    .return ($P1700)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<q>"  :subid("99_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1704
.annotate "line", 597
    new $P1703, 'ExceptionHandler'
    set_addr $P1703, control_1702
    $P1703."handle_types"(58)
    push_eh $P1703
    .lex "self", self
    .lex "$/", param_1704
    find_lex $P1705, "$/"
    find_lex $P1706, "$/"
    unless_null $P1706, vivify_509
    new $P1706, "Hash"
  vivify_509:
    set $P1707, $P1706["quote_EXPR"]
    unless_null $P1707, vivify_510
    new $P1707, "Undef"
  vivify_510:
    $P1708 = $P1707."ast"()
    $P1709 = $P1705."!make"($P1708)
    .return ($P1709)
  control_1702:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1710, exception, "payload"
    .return ($P1710)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<Q>"  :subid("100_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1714
.annotate "line", 598
    new $P1713, 'ExceptionHandler'
    set_addr $P1713, control_1712
    $P1713."handle_types"(58)
    push_eh $P1713
    .lex "self", self
    .lex "$/", param_1714
    find_lex $P1715, "$/"
    find_lex $P1716, "$/"
    unless_null $P1716, vivify_511
    new $P1716, "Hash"
  vivify_511:
    set $P1717, $P1716["quote_EXPR"]
    unless_null $P1717, vivify_512
    new $P1717, "Undef"
  vivify_512:
    $P1718 = $P1717."ast"()
    $P1719 = $P1715."!make"($P1718)
    .return ($P1719)
  control_1712:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1720, exception, "payload"
    .return ($P1720)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<Q:PIR>"  :subid("101_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1724
.annotate "line", 599
    new $P1723, 'ExceptionHandler'
    set_addr $P1723, control_1722
    $P1723."handle_types"(58)
    push_eh $P1723
    .lex "self", self
    .lex "$/", param_1724
.annotate "line", 600
    find_lex $P1725, "$/"
    get_hll_global $P1726, ["PAST"], "Op"
    find_lex $P1727, "$/"
    unless_null $P1727, vivify_513
    new $P1727, "Hash"
  vivify_513:
    set $P1728, $P1727["quote_EXPR"]
    unless_null $P1728, vivify_514
    new $P1728, "Undef"
  vivify_514:
    $P1729 = $P1728."ast"()
    $P1730 = $P1729."value"()
    find_lex $P1731, "$/"
    $P1732 = $P1726."new"($P1730 :named("inline"), "inline" :named("pasttype"), $P1731 :named("node"))
    $P1733 = $P1725."!make"($P1732)
.annotate "line", 599
    .return ($P1733)
  control_1722:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1734, exception, "payload"
    .return ($P1734)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<$>"  :subid("102_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1738
.annotate "line", 605
    new $P1737, 'ExceptionHandler'
    set_addr $P1737, control_1736
    $P1737."handle_types"(58)
    push_eh $P1737
    .lex "self", self
    .lex "$/", param_1738
    find_lex $P1739, "$/"
    find_lex $P1740, "$/"
    unless_null $P1740, vivify_515
    new $P1740, "Hash"
  vivify_515:
    set $P1741, $P1740["variable"]
    unless_null $P1741, vivify_516
    new $P1741, "Undef"
  vivify_516:
    $P1742 = $P1741."ast"()
    $P1743 = $P1739."!make"($P1742)
    .return ($P1743)
  control_1736:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1744, exception, "payload"
    .return ($P1744)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<{ }>"  :subid("103_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1748
.annotate "line", 606
    new $P1747, 'ExceptionHandler'
    set_addr $P1747, control_1746
    $P1747."handle_types"(58)
    push_eh $P1747
    .lex "self", self
    .lex "$/", param_1748
.annotate "line", 607
    find_lex $P1749, "$/"
    get_hll_global $P1750, ["PAST"], "Op"
.annotate "line", 608
    find_lex $P1751, "$/"
    unless_null $P1751, vivify_517
    new $P1751, "Hash"
  vivify_517:
    set $P1752, $P1751["block"]
    unless_null $P1752, vivify_518
    new $P1752, "Undef"
  vivify_518:
    $P1753 = $P1752."ast"()
    $P1754 = "block_immediate"($P1753)
    find_lex $P1755, "$/"
    $P1756 = $P1750."new"($P1754, "set S*" :named("pirop"), $P1755 :named("node"))
.annotate "line", 607
    $P1757 = $P1749."!make"($P1756)
.annotate "line", 606
    .return ($P1757)
  control_1746:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1758, exception, "payload"
    .return ($P1758)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "nulltermish"  :subid("104_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1762
.annotate "line", 614
    new $P1761, 'ExceptionHandler'
    set_addr $P1761, control_1760
    $P1761."handle_types"(58)
    push_eh $P1761
    .lex "self", self
    .lex "$/", param_1762
.annotate "line", 615
    find_lex $P1763, "$/"
    find_lex $P1766, "$/"
    unless_null $P1766, vivify_519
    new $P1766, "Hash"
  vivify_519:
    set $P1767, $P1766["term"]
    unless_null $P1767, vivify_520
    new $P1767, "Undef"
  vivify_520:
    if $P1767, if_1765
    new $P1771, "Integer"
    assign $P1771, 0
    set $P1764, $P1771
    goto if_1765_end
  if_1765:
    find_lex $P1768, "$/"
    unless_null $P1768, vivify_521
    new $P1768, "Hash"
  vivify_521:
    set $P1769, $P1768["term"]
    unless_null $P1769, vivify_522
    new $P1769, "Undef"
  vivify_522:
    $P1770 = $P1769."ast"()
    set $P1764, $P1770
  if_1765_end:
    $P1772 = $P1763."!make"($P1764)
.annotate "line", 614
    .return ($P1772)
  control_1760:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1773, exception, "payload"
    .return ($P1773)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<.>"  :subid("105_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1777
.annotate "line", 618
    new $P1776, 'ExceptionHandler'
    set_addr $P1776, control_1775
    $P1776."handle_types"(58)
    push_eh $P1776
    .lex "self", self
    .lex "$/", param_1777
    find_lex $P1778, "$/"
    find_lex $P1779, "$/"
    unless_null $P1779, vivify_523
    new $P1779, "Hash"
  vivify_523:
    set $P1780, $P1779["dotty"]
    unless_null $P1780, vivify_524
    new $P1780, "Undef"
  vivify_524:
    $P1781 = $P1780."ast"()
    $P1782 = $P1778."!make"($P1781)
    .return ($P1782)
  control_1775:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1783, exception, "payload"
    .return ($P1783)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<++>"  :subid("106_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1787
.annotate "line", 620
    new $P1786, 'ExceptionHandler'
    set_addr $P1786, control_1785
    $P1786."handle_types"(58)
    push_eh $P1786
    .lex "self", self
    .lex "$/", param_1787
.annotate "line", 621
    find_lex $P1788, "$/"
    get_hll_global $P1789, ["PAST"], "Op"
.annotate "line", 622
    new $P1790, "ResizablePMCArray"
    push $P1790, "    clone %r, %0"
    push $P1790, "    inc %0"
    $P1791 = $P1789."new"("postfix:<++>" :named("name"), $P1790 :named("inline"), "inline" :named("pasttype"))
.annotate "line", 621
    $P1792 = $P1788."!make"($P1791)
.annotate "line", 620
    .return ($P1792)
  control_1785:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1793, exception, "payload"
    .return ($P1793)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<-->"  :subid("107_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1797
.annotate "line", 626
    new $P1796, 'ExceptionHandler'
    set_addr $P1796, control_1795
    $P1796."handle_types"(58)
    push_eh $P1796
    .lex "self", self
    .lex "$/", param_1797
.annotate "line", 627
    find_lex $P1798, "$/"
    get_hll_global $P1799, ["PAST"], "Op"
.annotate "line", 628
    new $P1800, "ResizablePMCArray"
    push $P1800, "    clone %r, %0"
    push $P1800, "    dec %0"
    $P1801 = $P1799."new"("postfix:<-->" :named("name"), $P1800 :named("inline"), "inline" :named("pasttype"))
.annotate "line", 627
    $P1802 = $P1798."!make"($P1801)
.annotate "line", 626
    .return ($P1802)
  control_1795:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1803, exception, "payload"
    .return ($P1803)
    rethrow exception
.end


.namespace ["NQP";"Actions"]
.sub "prefix:sym<make>"  :subid("108_1258264465.36631") :method :outer("11_1258264465.36631")
    .param pmc param_1807
.annotate "line", 632
    new $P1806, 'ExceptionHandler'
    set_addr $P1806, control_1805
    $P1806."handle_types"(58)
    push_eh $P1806
    .lex "self", self
    .lex "$/", param_1807
.annotate "line", 633
    find_lex $P1808, "$/"
    get_hll_global $P1809, ["PAST"], "Op"
.annotate "line", 634
    get_hll_global $P1810, ["PAST"], "Var"
    $P1811 = $P1810."new"("$/" :named("name"), "contextual" :named("scope"))
    find_lex $P1812, "$/"
    $P1813 = $P1809."new"($P1811, "callmethod" :named("pasttype"), "!make" :named("name"), $P1812 :named("node"))
.annotate "line", 633
    $P1814 = $P1808."!make"($P1813)
.annotate "line", 632
    .return ($P1814)
  control_1805:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1815, exception, "payload"
    .return ($P1815)
    rethrow exception
.end


.namespace ["NQP";"RegexActions"]
.sub "_block1816"  :subid("109_1258264465.36631") :outer("11_1258264465.36631")
.annotate "line", 642
    .const 'Sub' $P1852 = "113_1258264465.36631" 
    capture_lex $P1852
    .const 'Sub' $P1842 = "112_1258264465.36631" 
    capture_lex $P1842
    .const 'Sub' $P1832 = "111_1258264465.36631" 
    capture_lex $P1832
    .const 'Sub' $P1818 = "110_1258264465.36631" 
    capture_lex $P1818
.annotate "line", 653
    .const 'Sub' $P1852 = "113_1258264465.36631" 
    capture_lex $P1852
.annotate "line", 642
    .return ($P1852)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<:my>"  :subid("110_1258264465.36631") :method :outer("109_1258264465.36631")
    .param pmc param_1821
.annotate "line", 644
    new $P1820, 'ExceptionHandler'
    set_addr $P1820, control_1819
    $P1820."handle_types"(58)
    push_eh $P1820
    .lex "self", self
    .lex "$/", param_1821
.annotate "line", 645
    new $P1822, "Undef"
    .lex "$past", $P1822
    find_lex $P1823, "$/"
    unless_null $P1823, vivify_525
    new $P1823, "Hash"
  vivify_525:
    set $P1824, $P1823["statement"]
    unless_null $P1824, vivify_526
    new $P1824, "Undef"
  vivify_526:
    $P1825 = $P1824."ast"()
    store_lex "$past", $P1825
.annotate "line", 646
    find_lex $P1826, "$/"
    get_hll_global $P1827, ["PAST"], "Regex"
    find_lex $P1828, "$past"
    $P1829 = $P1827."new"($P1828, "pastnode" :named("pasttype"))
    $P1830 = $P1826."!make"($P1829)
.annotate "line", 644
    .return ($P1830)
  control_1819:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1831, exception, "payload"
    .return ($P1831)
    rethrow exception
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<{ }>"  :subid("111_1258264465.36631") :method :outer("109_1258264465.36631")
    .param pmc param_1835
.annotate "line", 649
    new $P1834, 'ExceptionHandler'
    set_addr $P1834, control_1833
    $P1834."handle_types"(58)
    push_eh $P1834
    .lex "self", self
    .lex "$/", param_1835
    find_lex $P1836, "$/"
    find_lex $P1837, "$/"
    unless_null $P1837, vivify_527
    new $P1837, "Hash"
  vivify_527:
    set $P1838, $P1837["codeblock"]
    unless_null $P1838, vivify_528
    new $P1838, "Undef"
  vivify_528:
    $P1839 = $P1838."ast"()
    $P1840 = $P1836."!make"($P1839)
    .return ($P1840)
  control_1833:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1841, exception, "payload"
    .return ($P1841)
    rethrow exception
.end


.namespace ["NQP";"RegexActions"]
.sub "assertion:sym<{ }>"  :subid("112_1258264465.36631") :method :outer("109_1258264465.36631")
    .param pmc param_1845
.annotate "line", 651
    new $P1844, 'ExceptionHandler'
    set_addr $P1844, control_1843
    $P1844."handle_types"(58)
    push_eh $P1844
    .lex "self", self
    .lex "$/", param_1845
    find_lex $P1846, "$/"
    find_lex $P1847, "$/"
    unless_null $P1847, vivify_529
    new $P1847, "Hash"
  vivify_529:
    set $P1848, $P1847["codeblock"]
    unless_null $P1848, vivify_530
    new $P1848, "Undef"
  vivify_530:
    $P1849 = $P1848."ast"()
    $P1850 = $P1846."!make"($P1849)
    .return ($P1850)
  control_1843:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1851, exception, "payload"
    .return ($P1851)
    rethrow exception
.end


.namespace ["NQP";"RegexActions"]
.sub "codeblock"  :subid("113_1258264465.36631") :method :outer("109_1258264465.36631")
    .param pmc param_1855
.annotate "line", 653
    new $P1854, 'ExceptionHandler'
    set_addr $P1854, control_1853
    $P1854."handle_types"(58)
    push_eh $P1854
    .lex "self", self
    .lex "$/", param_1855
.annotate "line", 654
    new $P1856, "Undef"
    .lex "$block", $P1856
.annotate "line", 656
    new $P1857, "Undef"
    .lex "$past", $P1857
.annotate "line", 654
    find_lex $P1858, "$/"
    unless_null $P1858, vivify_531
    new $P1858, "Hash"
  vivify_531:
    set $P1859, $P1858["block"]
    unless_null $P1859, vivify_532
    new $P1859, "Undef"
  vivify_532:
    $P1860 = $P1859."ast"()
    store_lex "$block", $P1860
.annotate "line", 655
    find_lex $P1861, "$block"
    $P1861."blocktype"("immediate")
.annotate "line", 657
    get_hll_global $P1862, ["PAST"], "Regex"
.annotate "line", 658
    get_hll_global $P1863, ["PAST"], "Stmts"
.annotate "line", 659
    get_hll_global $P1864, ["PAST"], "Op"
.annotate "line", 660
    get_hll_global $P1865, ["PAST"], "Var"
    $P1866 = $P1865."new"("$/" :named("name"))
.annotate "line", 661
    get_hll_global $P1867, ["PAST"], "Op"
.annotate "line", 662
    get_hll_global $P1868, ["PAST"], "Var"
    $P1869 = $P1868."new"(unicode:"$\x{a2}" :named("name"))
    $P1870 = $P1867."new"($P1869, "MATCH" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 661
    $P1871 = $P1864."new"($P1866, $P1870, "bind" :named("pasttype"))
.annotate "line", 659
    find_lex $P1872, "$block"
    $P1873 = $P1863."new"($P1871, $P1872)
.annotate "line", 658
    $P1874 = $P1862."new"($P1873, "pastnode" :named("pasttype"))
.annotate "line", 657
    store_lex "$past", $P1874
.annotate "line", 672
    find_lex $P1875, "$/"
    find_lex $P1876, "$past"
    $P1877 = $P1875."!make"($P1876)
.annotate "line", 653
    .return ($P1877)
  control_1853:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1878, exception, "payload"
    .return ($P1878)
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

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
