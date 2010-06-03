# Copyright (C) 2009, The Perl Foundation.
# $Id$

=head1 NAME

Regex::P6Regex - Parser/compiler for Perl 6 regexes

=head1 DESCRIPTION

=cut

.sub '' :anon :load :init
    load_bytecode 'HLL.pbc'
.end

### .include 'gen/p6regex-grammar.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1275599996.35368")
.annotate 'line', 0
    get_hll_global $P14, ["Regex";"P6Regex";"Grammar"], "_block13" 
    capture_lex $P14
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 3
    get_hll_global $P14, ["Regex";"P6Regex";"Grammar"], "_block13" 
    capture_lex $P14
    $P587 = $P14()
.annotate 'line', 1
    .return ($P587)
    .const 'Sub' $P589 = "159_1275599996.35368" 
    .return ($P589)
.end


.namespace []
.sub "" :load :init :subid("post160") :outer("10_1275599996.35368")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1275599996.35368" 
    .local pmc block
    set block, $P12
    $P592 = get_root_global ["parrot"], "P6metaclass"
    $P592."new_class"("Regex::P6Regex::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block13"  :subid("11_1275599996.35368") :outer("10_1275599996.35368")
.annotate 'line', 3
    .const 'Sub' $P575 = "156_1275599996.35368" 
    capture_lex $P575
    .const 'Sub' $P567 = "154_1275599996.35368" 
    capture_lex $P567
    .const 'Sub' $P559 = "152_1275599996.35368" 
    capture_lex $P559
    .const 'Sub' $P538 = "147_1275599996.35368" 
    capture_lex $P538
    .const 'Sub' $P503 = "141_1275599996.35368" 
    capture_lex $P503
    .const 'Sub' $P491 = "138_1275599996.35368" 
    capture_lex $P491
    .const 'Sub' $P478 = "135_1275599996.35368" 
    capture_lex $P478
    .const 'Sub' $P472 = "133_1275599996.35368" 
    capture_lex $P472
    .const 'Sub' $P461 = "130_1275599996.35368" 
    capture_lex $P461
    .const 'Sub' $P450 = "127_1275599996.35368" 
    capture_lex $P450
    .const 'Sub' $P441 = "123_1275599996.35368" 
    capture_lex $P441
    .const 'Sub' $P435 = "121_1275599996.35368" 
    capture_lex $P435
    .const 'Sub' $P429 = "119_1275599996.35368" 
    capture_lex $P429
    .const 'Sub' $P423 = "117_1275599996.35368" 
    capture_lex $P423
    .const 'Sub' $P417 = "115_1275599996.35368" 
    capture_lex $P417
    .const 'Sub' $P409 = "113_1275599996.35368" 
    capture_lex $P409
    .const 'Sub' $P398 = "111_1275599996.35368" 
    capture_lex $P398
    .const 'Sub' $P387 = "109_1275599996.35368" 
    capture_lex $P387
    .const 'Sub' $P381 = "107_1275599996.35368" 
    capture_lex $P381
    .const 'Sub' $P375 = "105_1275599996.35368" 
    capture_lex $P375
    .const 'Sub' $P369 = "103_1275599996.35368" 
    capture_lex $P369
    .const 'Sub' $P363 = "101_1275599996.35368" 
    capture_lex $P363
    .const 'Sub' $P357 = "99_1275599996.35368" 
    capture_lex $P357
    .const 'Sub' $P351 = "97_1275599996.35368" 
    capture_lex $P351
    .const 'Sub' $P345 = "95_1275599996.35368" 
    capture_lex $P345
    .const 'Sub' $P339 = "93_1275599996.35368" 
    capture_lex $P339
    .const 'Sub' $P327 = "89_1275599996.35368" 
    capture_lex $P327
    .const 'Sub' $P315 = "87_1275599996.35368" 
    capture_lex $P315
    .const 'Sub' $P308 = "85_1275599996.35368" 
    capture_lex $P308
    .const 'Sub' $P291 = "83_1275599996.35368" 
    capture_lex $P291
    .const 'Sub' $P284 = "81_1275599996.35368" 
    capture_lex $P284
    .const 'Sub' $P278 = "79_1275599996.35368" 
    capture_lex $P278
    .const 'Sub' $P272 = "77_1275599996.35368" 
    capture_lex $P272
    .const 'Sub' $P265 = "75_1275599996.35368" 
    capture_lex $P265
    .const 'Sub' $P258 = "73_1275599996.35368" 
    capture_lex $P258
    .const 'Sub' $P251 = "71_1275599996.35368" 
    capture_lex $P251
    .const 'Sub' $P244 = "69_1275599996.35368" 
    capture_lex $P244
    .const 'Sub' $P238 = "67_1275599996.35368" 
    capture_lex $P238
    .const 'Sub' $P232 = "65_1275599996.35368" 
    capture_lex $P232
    .const 'Sub' $P226 = "63_1275599996.35368" 
    capture_lex $P226
    .const 'Sub' $P220 = "61_1275599996.35368" 
    capture_lex $P220
    .const 'Sub' $P214 = "59_1275599996.35368" 
    capture_lex $P214
    .const 'Sub' $P209 = "57_1275599996.35368" 
    capture_lex $P209
    .const 'Sub' $P204 = "55_1275599996.35368" 
    capture_lex $P204
    .const 'Sub' $P198 = "53_1275599996.35368" 
    capture_lex $P198
    .const 'Sub' $P192 = "51_1275599996.35368" 
    capture_lex $P192
    .const 'Sub' $P186 = "49_1275599996.35368" 
    capture_lex $P186
    .const 'Sub' $P170 = "44_1275599996.35368" 
    capture_lex $P170
    .const 'Sub' $P154 = "42_1275599996.35368" 
    capture_lex $P154
    .const 'Sub' $P147 = "40_1275599996.35368" 
    capture_lex $P147
    .const 'Sub' $P140 = "38_1275599996.35368" 
    capture_lex $P140
    .const 'Sub' $P133 = "36_1275599996.35368" 
    capture_lex $P133
    .const 'Sub' $P114 = "31_1275599996.35368" 
    capture_lex $P114
    .const 'Sub' $P101 = "28_1275599996.35368" 
    capture_lex $P101
    .const 'Sub' $P94 = "26_1275599996.35368" 
    capture_lex $P94
    .const 'Sub' $P82 = "24_1275599996.35368" 
    capture_lex $P82
    .const 'Sub' $P75 = "22_1275599996.35368" 
    capture_lex $P75
    .const 'Sub' $P63 = "20_1275599996.35368" 
    capture_lex $P63
    .const 'Sub' $P56 = "18_1275599996.35368" 
    capture_lex $P56
    .const 'Sub' $P46 = "15_1275599996.35368" 
    capture_lex $P46
    .const 'Sub' $P38 = "13_1275599996.35368" 
    capture_lex $P38
    .const 'Sub' $P15 = "12_1275599996.35368" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    .const 'Sub' $P575 = "156_1275599996.35368" 
    capture_lex $P575
    .return ($P575)
    .const 'Sub' $P584 = "158_1275599996.35368" 
    .return ($P584)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "obs"  :subid("12_1275599996.35368") :method :outer("11_1275599996.35368")
    .param pmc param_18
    .param pmc param_19
    .param pmc param_20 :optional
    .param int has_param_20 :opt_flag
.annotate 'line', 3
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(57)
    push_eh $P17
    .lex "self", self
    .lex "$old", param_18
    .lex "$new", param_19
    if has_param_20, optparam_161
    new $P21, "String"
    assign $P21, "in Perl 6"
    set param_20, $P21
  optparam_161:
    .lex "$when", param_20
.annotate 'line', 4
    find_lex $P22, "self"
    new $P23, "String"
    assign $P23, "Obsolete use of "
    find_lex $P24, "$old"
    set $S25, $P24
    concat $P26, $P23, $S25
    concat $P27, $P26, ";"
.annotate 'line', 5
    find_lex $P28, "$when"
    set $S29, $P28
    concat $P30, $P27, $S29
    concat $P31, $P30, " please use "
    find_lex $P32, "$new"
    set $S33, $P32
    concat $P34, $P31, $S33
    concat $P35, $P34, " instead"
    $P36 = $P22."panic"($P35)
.annotate 'line', 3
    .return ($P36)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P37, exception, "payload"
    .return ($P37)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "ws"  :subid("13_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx39_tgt
    .local int rx39_pos
    .local int rx39_off
    .local int rx39_eos
    .local int rx39_rep
    .local pmc rx39_cur
    (rx39_cur, rx39_pos, rx39_tgt) = self."!cursor_start"()
    rx39_cur."!cursor_debug"("START ", "ws")
    .lex unicode:"$\x{a2}", rx39_cur
    .local pmc match
    .lex "$/", match
    length rx39_eos, rx39_tgt
    gt rx39_pos, rx39_eos, rx39_done
    set rx39_off, 0
    lt rx39_pos, 2, rx39_start
    sub rx39_off, rx39_pos, 1
    substr rx39_tgt, rx39_tgt, rx39_off
  rx39_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan42_done
    goto rxscan42_scan
  rxscan42_loop:
    ($P10) = rx39_cur."from"()
    inc $P10
    set rx39_pos, $P10
    ge rx39_pos, rx39_eos, rxscan42_done
  rxscan42_scan:
    set_addr $I10, rxscan42_loop
    rx39_cur."!mark_push"(0, rx39_pos, $I10)
  rxscan42_done:
.annotate 'line', 8
  # rx rxquantr43 ** 0..*
    set_addr $I45, rxquantr43_done
    rx39_cur."!mark_push"(0, rx39_pos, $I45)
  rxquantr43_loop:
  alt44_0:
    set_addr $I10, alt44_1
    rx39_cur."!mark_push"(0, rx39_pos, $I10)
  # rx charclass_q s r 1..-1
    sub $I10, rx39_pos, rx39_off
    find_not_cclass $I11, 32, rx39_tgt, $I10, rx39_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx39_fail
    add rx39_pos, rx39_off, $I11
    goto alt44_end
  alt44_1:
  # rx literal  "#"
    add $I11, rx39_pos, 1
    gt $I11, rx39_eos, rx39_fail
    sub $I11, rx39_pos, rx39_off
    substr $S10, rx39_tgt, $I11, 1
    ne $S10, "#", rx39_fail
    add rx39_pos, 1
  # rx charclass_q N r 0..-1
    sub $I10, rx39_pos, rx39_off
    find_cclass $I11, 4096, rx39_tgt, $I10, rx39_eos
    add rx39_pos, rx39_off, $I11
  alt44_end:
    (rx39_rep) = rx39_cur."!mark_commit"($I45)
    rx39_cur."!mark_push"(rx39_rep, rx39_pos, $I45)
    goto rxquantr43_loop
  rxquantr43_done:
  # rx pass
    rx39_cur."!cursor_pass"(rx39_pos, "ws")
    rx39_cur."!cursor_debug"("PASS  ", "ws", " at pos=", rx39_pos)
    .return (rx39_cur)
  rx39_fail:
.annotate 'line', 3
    (rx39_rep, rx39_pos, $I10, $P10) = rx39_cur."!mark_fail"(0)
    lt rx39_pos, -1, rx39_done
    eq rx39_pos, -1, rx39_fail
    jump $I10
  rx39_done:
    rx39_cur."!cursor_fail"()
    rx39_cur."!cursor_debug"("FAIL  ", "ws")
    .return (rx39_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__ws"  :subid("14_1275599996.35368") :method
.annotate 'line', 3
    new $P41, "ResizablePMCArray"
    push $P41, ""
    .return ($P41)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "normspace"  :subid("15_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .const 'Sub' $P52 = "17_1275599996.35368" 
    capture_lex $P52
    .local string rx47_tgt
    .local int rx47_pos
    .local int rx47_off
    .local int rx47_eos
    .local int rx47_rep
    .local pmc rx47_cur
    (rx47_cur, rx47_pos, rx47_tgt) = self."!cursor_start"()
    rx47_cur."!cursor_debug"("START ", "normspace")
    .lex unicode:"$\x{a2}", rx47_cur
    .local pmc match
    .lex "$/", match
    length rx47_eos, rx47_tgt
    gt rx47_pos, rx47_eos, rx47_done
    set rx47_off, 0
    lt rx47_pos, 2, rx47_start
    sub rx47_off, rx47_pos, 1
    substr rx47_tgt, rx47_tgt, rx47_off
  rx47_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan50_done
    goto rxscan50_scan
  rxscan50_loop:
    ($P10) = rx47_cur."from"()
    inc $P10
    set rx47_pos, $P10
    ge rx47_pos, rx47_eos, rxscan50_done
  rxscan50_scan:
    set_addr $I10, rxscan50_loop
    rx47_cur."!mark_push"(0, rx47_pos, $I10)
  rxscan50_done:
.annotate 'line', 10
  # rx subrule "before" subtype=zerowidth negate=
    rx47_cur."!cursor_pos"(rx47_pos)
    .const 'Sub' $P52 = "17_1275599996.35368" 
    capture_lex $P52
    $P10 = rx47_cur."before"($P52)
    unless $P10, rx47_fail
  # rx subrule "ws" subtype=method negate=
    rx47_cur."!cursor_pos"(rx47_pos)
    $P10 = rx47_cur."ws"()
    unless $P10, rx47_fail
    rx47_pos = $P10."pos"()
  # rx pass
    rx47_cur."!cursor_pass"(rx47_pos, "normspace")
    rx47_cur."!cursor_debug"("PASS  ", "normspace", " at pos=", rx47_pos)
    .return (rx47_cur)
  rx47_fail:
.annotate 'line', 3
    (rx47_rep, rx47_pos, $I10, $P10) = rx47_cur."!mark_fail"(0)
    lt rx47_pos, -1, rx47_done
    eq rx47_pos, -1, rx47_fail
    jump $I10
  rx47_done:
    rx47_cur."!cursor_fail"()
    rx47_cur."!cursor_debug"("FAIL  ", "normspace")
    .return (rx47_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__normspace"  :subid("16_1275599996.35368") :method
.annotate 'line', 3
    new $P49, "ResizablePMCArray"
    push $P49, ""
    .return ($P49)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block51"  :anon :subid("17_1275599996.35368") :method :outer("15_1275599996.35368")
.annotate 'line', 10
    .local string rx53_tgt
    .local int rx53_pos
    .local int rx53_off
    .local int rx53_eos
    .local int rx53_rep
    .local pmc rx53_cur
    (rx53_cur, rx53_pos, rx53_tgt) = self."!cursor_start"()
    rx53_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx53_cur
    .local pmc match
    .lex "$/", match
    length rx53_eos, rx53_tgt
    gt rx53_pos, rx53_eos, rx53_done
    set rx53_off, 0
    lt rx53_pos, 2, rx53_start
    sub rx53_off, rx53_pos, 1
    substr rx53_tgt, rx53_tgt, rx53_off
  rx53_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan54_done
    goto rxscan54_scan
  rxscan54_loop:
    ($P10) = rx53_cur."from"()
    inc $P10
    set rx53_pos, $P10
    ge rx53_pos, rx53_eos, rxscan54_done
  rxscan54_scan:
    set_addr $I10, rxscan54_loop
    rx53_cur."!mark_push"(0, rx53_pos, $I10)
  rxscan54_done:
  alt55_0:
    set_addr $I10, alt55_1
    rx53_cur."!mark_push"(0, rx53_pos, $I10)
  # rx charclass s
    ge rx53_pos, rx53_eos, rx53_fail
    sub $I10, rx53_pos, rx53_off
    is_cclass $I11, 32, rx53_tgt, $I10
    unless $I11, rx53_fail
    inc rx53_pos
    goto alt55_end
  alt55_1:
  # rx literal  "#"
    add $I11, rx53_pos, 1
    gt $I11, rx53_eos, rx53_fail
    sub $I11, rx53_pos, rx53_off
    substr $S10, rx53_tgt, $I11, 1
    ne $S10, "#", rx53_fail
    add rx53_pos, 1
  alt55_end:
  # rx pass
    rx53_cur."!cursor_pass"(rx53_pos, "")
    rx53_cur."!cursor_debug"("PASS  ", "", " at pos=", rx53_pos)
    .return (rx53_cur)
  rx53_fail:
    (rx53_rep, rx53_pos, $I10, $P10) = rx53_cur."!mark_fail"(0)
    lt rx53_pos, -1, rx53_done
    eq rx53_pos, -1, rx53_fail
    jump $I10
  rx53_done:
    rx53_cur."!cursor_fail"()
    rx53_cur."!cursor_debug"("FAIL  ", "")
    .return (rx53_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "arg"  :subid("18_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx57_tgt
    .local int rx57_pos
    .local int rx57_off
    .local int rx57_eos
    .local int rx57_rep
    .local pmc rx57_cur
    (rx57_cur, rx57_pos, rx57_tgt) = self."!cursor_start"()
    rx57_cur."!cursor_debug"("START ", "arg")
    .lex unicode:"$\x{a2}", rx57_cur
    .local pmc match
    .lex "$/", match
    length rx57_eos, rx57_tgt
    gt rx57_pos, rx57_eos, rx57_done
    set rx57_off, 0
    lt rx57_pos, 2, rx57_start
    sub rx57_off, rx57_pos, 1
    substr rx57_tgt, rx57_tgt, rx57_off
  rx57_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan60_done
    goto rxscan60_scan
  rxscan60_loop:
    ($P10) = rx57_cur."from"()
    inc $P10
    set rx57_pos, $P10
    ge rx57_pos, rx57_eos, rxscan60_done
  rxscan60_scan:
    set_addr $I10, rxscan60_loop
    rx57_cur."!mark_push"(0, rx57_pos, $I10)
  rxscan60_done:
  alt61_0:
.annotate 'line', 13
    set_addr $I10, alt61_1
    rx57_cur."!mark_push"(0, rx57_pos, $I10)
.annotate 'line', 14
  # rx enumcharlist negate=0 zerowidth
    ge rx57_pos, rx57_eos, rx57_fail
    sub $I10, rx57_pos, rx57_off
    substr $S10, rx57_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx57_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx57_cur."!cursor_pos"(rx57_pos)
    $P10 = rx57_cur."quote_EXPR"(":q")
    unless $P10, rx57_fail
    rx57_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx57_pos = $P10."pos"()
    goto alt61_end
  alt61_1:
    set_addr $I10, alt61_2
    rx57_cur."!mark_push"(0, rx57_pos, $I10)
.annotate 'line', 15
  # rx enumcharlist negate=0 zerowidth
    ge rx57_pos, rx57_eos, rx57_fail
    sub $I10, rx57_pos, rx57_off
    substr $S10, rx57_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx57_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx57_cur."!cursor_pos"(rx57_pos)
    $P10 = rx57_cur."quote_EXPR"(":qq")
    unless $P10, rx57_fail
    rx57_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx57_pos = $P10."pos"()
    goto alt61_end
  alt61_2:
.annotate 'line', 16
  # rx subcapture "val"
    set_addr $I10, rxcap_62_fail
    rx57_cur."!mark_push"(0, rx57_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx57_pos, rx57_off
    find_not_cclass $I11, 8, rx57_tgt, $I10, rx57_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx57_fail
    add rx57_pos, rx57_off, $I11
    set_addr $I10, rxcap_62_fail
    ($I12, $I11) = rx57_cur."!mark_peek"($I10)
    rx57_cur."!cursor_pos"($I11)
    ($P10) = rx57_cur."!cursor_start"()
    $P10."!cursor_pass"(rx57_pos, "")
    rx57_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("val")
    goto rxcap_62_done
  rxcap_62_fail:
    goto rx57_fail
  rxcap_62_done:
  alt61_end:
.annotate 'line', 12
  # rx pass
    rx57_cur."!cursor_pass"(rx57_pos, "arg")
    rx57_cur."!cursor_debug"("PASS  ", "arg", " at pos=", rx57_pos)
    .return (rx57_cur)
  rx57_fail:
.annotate 'line', 3
    (rx57_rep, rx57_pos, $I10, $P10) = rx57_cur."!mark_fail"(0)
    lt rx57_pos, -1, rx57_done
    eq rx57_pos, -1, rx57_fail
    jump $I10
  rx57_done:
    rx57_cur."!cursor_fail"()
    rx57_cur."!cursor_debug"("FAIL  ", "arg")
    .return (rx57_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__arg"  :subid("19_1275599996.35368") :method
.annotate 'line', 3
    new $P59, "ResizablePMCArray"
    push $P59, ""
    push $P59, "\""
    push $P59, "'"
    .return ($P59)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "arglist"  :subid("20_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx64_tgt
    .local int rx64_pos
    .local int rx64_off
    .local int rx64_eos
    .local int rx64_rep
    .local pmc rx64_cur
    (rx64_cur, rx64_pos, rx64_tgt) = self."!cursor_start"()
    rx64_cur."!cursor_debug"("START ", "arglist")
    rx64_cur."!cursor_caparray"("arg")
    .lex unicode:"$\x{a2}", rx64_cur
    .local pmc match
    .lex "$/", match
    length rx64_eos, rx64_tgt
    gt rx64_pos, rx64_eos, rx64_done
    set rx64_off, 0
    lt rx64_pos, 2, rx64_start
    sub rx64_off, rx64_pos, 1
    substr rx64_tgt, rx64_tgt, rx64_off
  rx64_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan67_done
    goto rxscan67_scan
  rxscan67_loop:
    ($P10) = rx64_cur."from"()
    inc $P10
    set rx64_pos, $P10
    ge rx64_pos, rx64_eos, rxscan67_done
  rxscan67_scan:
    set_addr $I10, rxscan67_loop
    rx64_cur."!mark_push"(0, rx64_pos, $I10)
  rxscan67_done:
.annotate 'line', 20
  # rx subrule "ws" subtype=method negate=
    rx64_cur."!cursor_pos"(rx64_pos)
    $P10 = rx64_cur."ws"()
    unless $P10, rx64_fail
    rx64_pos = $P10."pos"()
  # rx subrule "arg" subtype=capture negate=
    rx64_cur."!cursor_pos"(rx64_pos)
    $P10 = rx64_cur."arg"()
    unless $P10, rx64_fail
    rx64_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arg")
    rx64_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx64_cur."!cursor_pos"(rx64_pos)
    $P10 = rx64_cur."ws"()
    unless $P10, rx64_fail
    rx64_pos = $P10."pos"()
  # rx rxquantr70 ** 0..*
    set_addr $I73, rxquantr70_done
    rx64_cur."!mark_push"(0, rx64_pos, $I73)
  rxquantr70_loop:
  # rx subrule "ws" subtype=method negate=
    rx64_cur."!cursor_pos"(rx64_pos)
    $P10 = rx64_cur."ws"()
    unless $P10, rx64_fail
    rx64_pos = $P10."pos"()
  # rx literal  ","
    add $I11, rx64_pos, 1
    gt $I11, rx64_eos, rx64_fail
    sub $I11, rx64_pos, rx64_off
    substr $S10, rx64_tgt, $I11, 1
    ne $S10, ",", rx64_fail
    add rx64_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx64_cur."!cursor_pos"(rx64_pos)
    $P10 = rx64_cur."ws"()
    unless $P10, rx64_fail
    rx64_pos = $P10."pos"()
  # rx subrule "arg" subtype=capture negate=
    rx64_cur."!cursor_pos"(rx64_pos)
    $P10 = rx64_cur."arg"()
    unless $P10, rx64_fail
    rx64_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arg")
    rx64_pos = $P10."pos"()
    (rx64_rep) = rx64_cur."!mark_commit"($I73)
    rx64_cur."!mark_push"(rx64_rep, rx64_pos, $I73)
    goto rxquantr70_loop
  rxquantr70_done:
  # rx subrule "ws" subtype=method negate=
    rx64_cur."!cursor_pos"(rx64_pos)
    $P10 = rx64_cur."ws"()
    unless $P10, rx64_fail
    rx64_pos = $P10."pos"()
  # rx pass
    rx64_cur."!cursor_pass"(rx64_pos, "arglist")
    rx64_cur."!cursor_debug"("PASS  ", "arglist", " at pos=", rx64_pos)
    .return (rx64_cur)
  rx64_fail:
.annotate 'line', 3
    (rx64_rep, rx64_pos, $I10, $P10) = rx64_cur."!mark_fail"(0)
    lt rx64_pos, -1, rx64_done
    eq rx64_pos, -1, rx64_fail
    jump $I10
  rx64_done:
    rx64_cur."!cursor_fail"()
    rx64_cur."!cursor_debug"("FAIL  ", "arglist")
    .return (rx64_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__arglist"  :subid("21_1275599996.35368") :method
.annotate 'line', 3
    new $P66, "ResizablePMCArray"
    push $P66, ""
    .return ($P66)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "TOP"  :subid("22_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx76_tgt
    .local int rx76_pos
    .local int rx76_off
    .local int rx76_eos
    .local int rx76_rep
    .local pmc rx76_cur
    (rx76_cur, rx76_pos, rx76_tgt) = self."!cursor_start"()
    rx76_cur."!cursor_debug"("START ", "TOP")
    .lex unicode:"$\x{a2}", rx76_cur
    .local pmc match
    .lex "$/", match
    length rx76_eos, rx76_tgt
    gt rx76_pos, rx76_eos, rx76_done
    set rx76_off, 0
    lt rx76_pos, 2, rx76_start
    sub rx76_off, rx76_pos, 1
    substr rx76_tgt, rx76_tgt, rx76_off
  rx76_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan80_done
    goto rxscan80_scan
  rxscan80_loop:
    ($P10) = rx76_cur."from"()
    inc $P10
    set rx76_pos, $P10
    ge rx76_pos, rx76_eos, rxscan80_done
  rxscan80_scan:
    set_addr $I10, rxscan80_loop
    rx76_cur."!mark_push"(0, rx76_pos, $I10)
  rxscan80_done:
.annotate 'line', 23
  # rx subrule "nibbler" subtype=capture negate=
    rx76_cur."!cursor_pos"(rx76_pos)
    $P10 = rx76_cur."nibbler"()
    unless $P10, rx76_fail
    rx76_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx76_pos = $P10."pos"()
  alt81_0:
.annotate 'line', 24
    set_addr $I10, alt81_1
    rx76_cur."!mark_push"(0, rx76_pos, $I10)
  # rxanchor eos
    ne rx76_pos, rx76_eos, rx76_fail
    goto alt81_end
  alt81_1:
  # rx subrule "panic" subtype=method negate=
    rx76_cur."!cursor_pos"(rx76_pos)
    $P10 = rx76_cur."panic"("Confused")
    unless $P10, rx76_fail
    rx76_pos = $P10."pos"()
  alt81_end:
.annotate 'line', 22
  # rx pass
    rx76_cur."!cursor_pass"(rx76_pos, "TOP")
    rx76_cur."!cursor_debug"("PASS  ", "TOP", " at pos=", rx76_pos)
    .return (rx76_cur)
  rx76_fail:
.annotate 'line', 3
    (rx76_rep, rx76_pos, $I10, $P10) = rx76_cur."!mark_fail"(0)
    lt rx76_pos, -1, rx76_done
    eq rx76_pos, -1, rx76_fail
    jump $I10
  rx76_done:
    rx76_cur."!cursor_fail"()
    rx76_cur."!cursor_debug"("FAIL  ", "TOP")
    .return (rx76_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__TOP"  :subid("23_1275599996.35368") :method
.annotate 'line', 3
    $P78 = self."!PREFIX__!subrule"("nibbler", "")
    new $P79, "ResizablePMCArray"
    push $P79, $P78
    .return ($P79)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "nibbler"  :subid("24_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx83_tgt
    .local int rx83_pos
    .local int rx83_off
    .local int rx83_eos
    .local int rx83_rep
    .local pmc rx83_cur
    (rx83_cur, rx83_pos, rx83_tgt) = self."!cursor_start"()
    rx83_cur."!cursor_debug"("START ", "nibbler")
    rx83_cur."!cursor_caparray"("termish")
    .lex unicode:"$\x{a2}", rx83_cur
    .local pmc match
    .lex "$/", match
    length rx83_eos, rx83_tgt
    gt rx83_pos, rx83_eos, rx83_done
    set rx83_off, 0
    lt rx83_pos, 2, rx83_start
    sub rx83_off, rx83_pos, 1
    substr rx83_tgt, rx83_tgt, rx83_off
  rx83_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan86_done
    goto rxscan86_scan
  rxscan86_loop:
    ($P10) = rx83_cur."from"()
    inc $P10
    set rx83_pos, $P10
    ge rx83_pos, rx83_eos, rxscan86_done
  rxscan86_scan:
    set_addr $I10, rxscan86_loop
    rx83_cur."!mark_push"(0, rx83_pos, $I10)
  rxscan86_done:
.annotate 'line', 28
  # rx reduce name="nibbler" key="open"
    rx83_cur."!cursor_pos"(rx83_pos)
    rx83_cur."!reduce"("nibbler", "open")
.annotate 'line', 29
  # rx rxquantr87 ** 0..1
    set_addr $I89, rxquantr87_done
    rx83_cur."!mark_push"(0, rx83_pos, $I89)
  rxquantr87_loop:
  # rx subrule "ws" subtype=method negate=
    rx83_cur."!cursor_pos"(rx83_pos)
    $P10 = rx83_cur."ws"()
    unless $P10, rx83_fail
    rx83_pos = $P10."pos"()
  alt88_0:
    set_addr $I10, alt88_1
    rx83_cur."!mark_push"(0, rx83_pos, $I10)
  # rx literal  "||"
    add $I11, rx83_pos, 2
    gt $I11, rx83_eos, rx83_fail
    sub $I11, rx83_pos, rx83_off
    substr $S10, rx83_tgt, $I11, 2
    ne $S10, "||", rx83_fail
    add rx83_pos, 2
    goto alt88_end
  alt88_1:
    set_addr $I10, alt88_2
    rx83_cur."!mark_push"(0, rx83_pos, $I10)
  # rx literal  "|"
    add $I11, rx83_pos, 1
    gt $I11, rx83_eos, rx83_fail
    sub $I11, rx83_pos, rx83_off
    substr $S10, rx83_tgt, $I11, 1
    ne $S10, "|", rx83_fail
    add rx83_pos, 1
    goto alt88_end
  alt88_2:
    set_addr $I10, alt88_3
    rx83_cur."!mark_push"(0, rx83_pos, $I10)
  # rx literal  "&&"
    add $I11, rx83_pos, 2
    gt $I11, rx83_eos, rx83_fail
    sub $I11, rx83_pos, rx83_off
    substr $S10, rx83_tgt, $I11, 2
    ne $S10, "&&", rx83_fail
    add rx83_pos, 2
    goto alt88_end
  alt88_3:
  # rx literal  "&"
    add $I11, rx83_pos, 1
    gt $I11, rx83_eos, rx83_fail
    sub $I11, rx83_pos, rx83_off
    substr $S10, rx83_tgt, $I11, 1
    ne $S10, "&", rx83_fail
    add rx83_pos, 1
  alt88_end:
    (rx83_rep) = rx83_cur."!mark_commit"($I89)
  rxquantr87_done:
.annotate 'line', 30
  # rx subrule "termish" subtype=capture negate=
    rx83_cur."!cursor_pos"(rx83_pos)
    $P10 = rx83_cur."termish"()
    unless $P10, rx83_fail
    rx83_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("termish")
    rx83_pos = $P10."pos"()
.annotate 'line', 33
  # rx rxquantr90 ** 0..*
    set_addr $I93, rxquantr90_done
    rx83_cur."!mark_push"(0, rx83_pos, $I93)
  rxquantr90_loop:
  alt91_0:
.annotate 'line', 31
    set_addr $I10, alt91_1
    rx83_cur."!mark_push"(0, rx83_pos, $I10)
  # rx literal  "||"
    add $I11, rx83_pos, 2
    gt $I11, rx83_eos, rx83_fail
    sub $I11, rx83_pos, rx83_off
    substr $S10, rx83_tgt, $I11, 2
    ne $S10, "||", rx83_fail
    add rx83_pos, 2
    goto alt91_end
  alt91_1:
  # rx literal  "|"
    add $I11, rx83_pos, 1
    gt $I11, rx83_eos, rx83_fail
    sub $I11, rx83_pos, rx83_off
    substr $S10, rx83_tgt, $I11, 1
    ne $S10, "|", rx83_fail
    add rx83_pos, 1
  alt91_end:
  alt92_0:
.annotate 'line', 32
    set_addr $I10, alt92_1
    rx83_cur."!mark_push"(0, rx83_pos, $I10)
  # rx subrule "termish" subtype=capture negate=
    rx83_cur."!cursor_pos"(rx83_pos)
    $P10 = rx83_cur."termish"()
    unless $P10, rx83_fail
    rx83_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("termish")
    rx83_pos = $P10."pos"()
    goto alt92_end
  alt92_1:
  # rx subrule "panic" subtype=method negate=
    rx83_cur."!cursor_pos"(rx83_pos)
    $P10 = rx83_cur."panic"("Null pattern not allowed")
    unless $P10, rx83_fail
    rx83_pos = $P10."pos"()
  alt92_end:
.annotate 'line', 33
    (rx83_rep) = rx83_cur."!mark_commit"($I93)
    rx83_cur."!mark_push"(rx83_rep, rx83_pos, $I93)
    goto rxquantr90_loop
  rxquantr90_done:
.annotate 'line', 27
  # rx pass
    rx83_cur."!cursor_pass"(rx83_pos, "nibbler")
    rx83_cur."!cursor_debug"("PASS  ", "nibbler", " at pos=", rx83_pos)
    .return (rx83_cur)
  rx83_fail:
.annotate 'line', 3
    (rx83_rep, rx83_pos, $I10, $P10) = rx83_cur."!mark_fail"(0)
    lt rx83_pos, -1, rx83_done
    eq rx83_pos, -1, rx83_fail
    jump $I10
  rx83_done:
    rx83_cur."!cursor_fail"()
    rx83_cur."!cursor_debug"("FAIL  ", "nibbler")
    .return (rx83_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__nibbler"  :subid("25_1275599996.35368") :method
.annotate 'line', 3
    new $P85, "ResizablePMCArray"
    push $P85, ""
    .return ($P85)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "termish"  :subid("26_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx95_tgt
    .local int rx95_pos
    .local int rx95_off
    .local int rx95_eos
    .local int rx95_rep
    .local pmc rx95_cur
    (rx95_cur, rx95_pos, rx95_tgt) = self."!cursor_start"()
    rx95_cur."!cursor_debug"("START ", "termish")
    rx95_cur."!cursor_caparray"("noun")
    .lex unicode:"$\x{a2}", rx95_cur
    .local pmc match
    .lex "$/", match
    length rx95_eos, rx95_tgt
    gt rx95_pos, rx95_eos, rx95_done
    set rx95_off, 0
    lt rx95_pos, 2, rx95_start
    sub rx95_off, rx95_pos, 1
    substr rx95_tgt, rx95_tgt, rx95_off
  rx95_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan98_done
    goto rxscan98_scan
  rxscan98_loop:
    ($P10) = rx95_cur."from"()
    inc $P10
    set rx95_pos, $P10
    ge rx95_pos, rx95_eos, rxscan98_done
  rxscan98_scan:
    set_addr $I10, rxscan98_loop
    rx95_cur."!mark_push"(0, rx95_pos, $I10)
  rxscan98_done:
.annotate 'line', 37
  # rx rxquantr99 ** 1..*
    set_addr $I100, rxquantr99_done
    rx95_cur."!mark_push"(0, -1, $I100)
  rxquantr99_loop:
  # rx subrule "quantified_atom" subtype=capture negate=
    rx95_cur."!cursor_pos"(rx95_pos)
    $P10 = rx95_cur."quantified_atom"()
    unless $P10, rx95_fail
    rx95_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("noun")
    rx95_pos = $P10."pos"()
    (rx95_rep) = rx95_cur."!mark_commit"($I100)
    rx95_cur."!mark_push"(rx95_rep, rx95_pos, $I100)
    goto rxquantr99_loop
  rxquantr99_done:
.annotate 'line', 36
  # rx pass
    rx95_cur."!cursor_pass"(rx95_pos, "termish")
    rx95_cur."!cursor_debug"("PASS  ", "termish", " at pos=", rx95_pos)
    .return (rx95_cur)
  rx95_fail:
.annotate 'line', 3
    (rx95_rep, rx95_pos, $I10, $P10) = rx95_cur."!mark_fail"(0)
    lt rx95_pos, -1, rx95_done
    eq rx95_pos, -1, rx95_fail
    jump $I10
  rx95_done:
    rx95_cur."!cursor_fail"()
    rx95_cur."!cursor_debug"("FAIL  ", "termish")
    .return (rx95_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__termish"  :subid("27_1275599996.35368") :method
.annotate 'line', 3
    new $P97, "ResizablePMCArray"
    push $P97, ""
    .return ($P97)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantified_atom"  :subid("28_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .const 'Sub' $P110 = "30_1275599996.35368" 
    capture_lex $P110
    .local string rx102_tgt
    .local int rx102_pos
    .local int rx102_off
    .local int rx102_eos
    .local int rx102_rep
    .local pmc rx102_cur
    (rx102_cur, rx102_pos, rx102_tgt) = self."!cursor_start"()
    rx102_cur."!cursor_debug"("START ", "quantified_atom")
    rx102_cur."!cursor_caparray"("quantifier", "backmod")
    .lex unicode:"$\x{a2}", rx102_cur
    .local pmc match
    .lex "$/", match
    length rx102_eos, rx102_tgt
    gt rx102_pos, rx102_eos, rx102_done
    set rx102_off, 0
    lt rx102_pos, 2, rx102_start
    sub rx102_off, rx102_pos, 1
    substr rx102_tgt, rx102_tgt, rx102_off
  rx102_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan106_done
    goto rxscan106_scan
  rxscan106_loop:
    ($P10) = rx102_cur."from"()
    inc $P10
    set rx102_pos, $P10
    ge rx102_pos, rx102_eos, rxscan106_done
  rxscan106_scan:
    set_addr $I10, rxscan106_loop
    rx102_cur."!mark_push"(0, rx102_pos, $I10)
  rxscan106_done:
.annotate 'line', 41
  # rx subrule "atom" subtype=capture negate=
    rx102_cur."!cursor_pos"(rx102_pos)
    $P10 = rx102_cur."atom"()
    unless $P10, rx102_fail
    rx102_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("atom")
    rx102_pos = $P10."pos"()
  # rx rxquantr107 ** 0..1
    set_addr $I113, rxquantr107_done
    rx102_cur."!mark_push"(0, rx102_pos, $I113)
  rxquantr107_loop:
  # rx subrule "ws" subtype=method negate=
    rx102_cur."!cursor_pos"(rx102_pos)
    $P10 = rx102_cur."ws"()
    unless $P10, rx102_fail
    rx102_pos = $P10."pos"()
  alt108_0:
    set_addr $I10, alt108_1
    rx102_cur."!mark_push"(0, rx102_pos, $I10)
  # rx subrule "quantifier" subtype=capture negate=
    rx102_cur."!cursor_pos"(rx102_pos)
    $P10 = rx102_cur."quantifier"()
    unless $P10, rx102_fail
    rx102_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantifier")
    rx102_pos = $P10."pos"()
    goto alt108_end
  alt108_1:
  # rx subrule "before" subtype=zerowidth negate=
    rx102_cur."!cursor_pos"(rx102_pos)
    .const 'Sub' $P110 = "30_1275599996.35368" 
    capture_lex $P110
    $P10 = rx102_cur."before"($P110)
    unless $P10, rx102_fail
  # rx subrule "backmod" subtype=capture negate=
    rx102_cur."!cursor_pos"(rx102_pos)
    $P10 = rx102_cur."backmod"()
    unless $P10, rx102_fail
    rx102_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx102_pos = $P10."pos"()
  # rx subrule "alpha" subtype=zerowidth negate=1
    rx102_cur."!cursor_pos"(rx102_pos)
    $P10 = rx102_cur."alpha"()
    if $P10, rx102_fail
  alt108_end:
    (rx102_rep) = rx102_cur."!mark_commit"($I113)
  rxquantr107_done:
.annotate 'line', 40
  # rx pass
    rx102_cur."!cursor_pass"(rx102_pos, "quantified_atom")
    rx102_cur."!cursor_debug"("PASS  ", "quantified_atom", " at pos=", rx102_pos)
    .return (rx102_cur)
  rx102_fail:
.annotate 'line', 3
    (rx102_rep, rx102_pos, $I10, $P10) = rx102_cur."!mark_fail"(0)
    lt rx102_pos, -1, rx102_done
    eq rx102_pos, -1, rx102_fail
    jump $I10
  rx102_done:
    rx102_cur."!cursor_fail"()
    rx102_cur."!cursor_debug"("FAIL  ", "quantified_atom")
    .return (rx102_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantified_atom"  :subid("29_1275599996.35368") :method
.annotate 'line', 3
    $P104 = self."!PREFIX__!subrule"("atom", "")
    new $P105, "ResizablePMCArray"
    push $P105, $P104
    .return ($P105)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block109"  :anon :subid("30_1275599996.35368") :method :outer("28_1275599996.35368")
.annotate 'line', 41
    .local string rx111_tgt
    .local int rx111_pos
    .local int rx111_off
    .local int rx111_eos
    .local int rx111_rep
    .local pmc rx111_cur
    (rx111_cur, rx111_pos, rx111_tgt) = self."!cursor_start"()
    rx111_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx111_cur
    .local pmc match
    .lex "$/", match
    length rx111_eos, rx111_tgt
    gt rx111_pos, rx111_eos, rx111_done
    set rx111_off, 0
    lt rx111_pos, 2, rx111_start
    sub rx111_off, rx111_pos, 1
    substr rx111_tgt, rx111_tgt, rx111_off
  rx111_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan112_done
    goto rxscan112_scan
  rxscan112_loop:
    ($P10) = rx111_cur."from"()
    inc $P10
    set rx111_pos, $P10
    ge rx111_pos, rx111_eos, rxscan112_done
  rxscan112_scan:
    set_addr $I10, rxscan112_loop
    rx111_cur."!mark_push"(0, rx111_pos, $I10)
  rxscan112_done:
  # rx literal  ":"
    add $I11, rx111_pos, 1
    gt $I11, rx111_eos, rx111_fail
    sub $I11, rx111_pos, rx111_off
    substr $S10, rx111_tgt, $I11, 1
    ne $S10, ":", rx111_fail
    add rx111_pos, 1
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


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "atom"  :subid("31_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .const 'Sub' $P125 = "33_1275599996.35368" 
    capture_lex $P125
    .local string rx115_tgt
    .local int rx115_pos
    .local int rx115_off
    .local int rx115_eos
    .local int rx115_rep
    .local pmc rx115_cur
    (rx115_cur, rx115_pos, rx115_tgt) = self."!cursor_start"()
    rx115_cur."!cursor_debug"("START ", "atom")
    .lex unicode:"$\x{a2}", rx115_cur
    .local pmc match
    .lex "$/", match
    length rx115_eos, rx115_tgt
    gt rx115_pos, rx115_eos, rx115_done
    set rx115_off, 0
    lt rx115_pos, 2, rx115_start
    sub rx115_off, rx115_pos, 1
    substr rx115_tgt, rx115_tgt, rx115_off
  rx115_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan119_done
    goto rxscan119_scan
  rxscan119_loop:
    ($P10) = rx115_cur."from"()
    inc $P10
    set rx115_pos, $P10
    ge rx115_pos, rx115_eos, rxscan119_done
  rxscan119_scan:
    set_addr $I10, rxscan119_loop
    rx115_cur."!mark_push"(0, rx115_pos, $I10)
  rxscan119_done:
  alt120_0:
.annotate 'line', 46
    set_addr $I10, alt120_1
    rx115_cur."!mark_push"(0, rx115_pos, $I10)
.annotate 'line', 47
  # rx charclass w
    ge rx115_pos, rx115_eos, rx115_fail
    sub $I10, rx115_pos, rx115_off
    is_cclass $I11, 8192, rx115_tgt, $I10
    unless $I11, rx115_fail
    inc rx115_pos
  # rx rxquantr121 ** 0..1
    set_addr $I128, rxquantr121_done
    rx115_cur."!mark_push"(0, rx115_pos, $I128)
  rxquantr121_loop:
  # rx rxquantg122 ** 1..*
    set_addr $I123, rxquantg122_done
  rxquantg122_loop:
  # rx charclass w
    ge rx115_pos, rx115_eos, rx115_fail
    sub $I10, rx115_pos, rx115_off
    is_cclass $I11, 8192, rx115_tgt, $I10
    unless $I11, rx115_fail
    inc rx115_pos
    rx115_cur."!mark_push"(rx115_rep, rx115_pos, $I123)
    goto rxquantg122_loop
  rxquantg122_done:
  # rx subrule "before" subtype=zerowidth negate=
    rx115_cur."!cursor_pos"(rx115_pos)
    .const 'Sub' $P125 = "33_1275599996.35368" 
    capture_lex $P125
    $P10 = rx115_cur."before"($P125)
    unless $P10, rx115_fail
    (rx115_rep) = rx115_cur."!mark_commit"($I128)
  rxquantr121_done:
    goto alt120_end
  alt120_1:
.annotate 'line', 48
  # rx subrule "metachar" subtype=capture negate=
    rx115_cur."!cursor_pos"(rx115_pos)
    $P10 = rx115_cur."metachar"()
    unless $P10, rx115_fail
    rx115_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("metachar")
    rx115_pos = $P10."pos"()
  alt120_end:
.annotate 'line', 44
  # rx pass
    rx115_cur."!cursor_pass"(rx115_pos, "atom")
    rx115_cur."!cursor_debug"("PASS  ", "atom", " at pos=", rx115_pos)
    .return (rx115_cur)
  rx115_fail:
.annotate 'line', 3
    (rx115_rep, rx115_pos, $I10, $P10) = rx115_cur."!mark_fail"(0)
    lt rx115_pos, -1, rx115_done
    eq rx115_pos, -1, rx115_fail
    jump $I10
  rx115_done:
    rx115_cur."!cursor_fail"()
    rx115_cur."!cursor_debug"("FAIL  ", "atom")
    .return (rx115_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__atom"  :subid("32_1275599996.35368") :method
.annotate 'line', 3
    $P117 = self."!PREFIX__!subrule"("metachar", "")
    new $P118, "ResizablePMCArray"
    push $P118, $P117
    push $P118, ""
    .return ($P118)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block124"  :anon :subid("33_1275599996.35368") :method :outer("31_1275599996.35368")
.annotate 'line', 47
    .local string rx126_tgt
    .local int rx126_pos
    .local int rx126_off
    .local int rx126_eos
    .local int rx126_rep
    .local pmc rx126_cur
    (rx126_cur, rx126_pos, rx126_tgt) = self."!cursor_start"()
    rx126_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx126_cur
    .local pmc match
    .lex "$/", match
    length rx126_eos, rx126_tgt
    gt rx126_pos, rx126_eos, rx126_done
    set rx126_off, 0
    lt rx126_pos, 2, rx126_start
    sub rx126_off, rx126_pos, 1
    substr rx126_tgt, rx126_tgt, rx126_off
  rx126_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan127_done
    goto rxscan127_scan
  rxscan127_loop:
    ($P10) = rx126_cur."from"()
    inc $P10
    set rx126_pos, $P10
    ge rx126_pos, rx126_eos, rxscan127_done
  rxscan127_scan:
    set_addr $I10, rxscan127_loop
    rx126_cur."!mark_push"(0, rx126_pos, $I10)
  rxscan127_done:
  # rx charclass w
    ge rx126_pos, rx126_eos, rx126_fail
    sub $I10, rx126_pos, rx126_off
    is_cclass $I11, 8192, rx126_tgt, $I10
    unless $I11, rx126_fail
    inc rx126_pos
  # rx pass
    rx126_cur."!cursor_pass"(rx126_pos, "")
    rx126_cur."!cursor_debug"("PASS  ", "", " at pos=", rx126_pos)
    .return (rx126_cur)
  rx126_fail:
    (rx126_rep, rx126_pos, $I10, $P10) = rx126_cur."!mark_fail"(0)
    lt rx126_pos, -1, rx126_done
    eq rx126_pos, -1, rx126_fail
    jump $I10
  rx126_done:
    rx126_cur."!cursor_fail"()
    rx126_cur."!cursor_debug"("FAIL  ", "")
    .return (rx126_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier"  :subid("34_1275599996.35368") :method
.annotate 'line', 52
    $P130 = self."!protoregex"("quantifier")
    .return ($P130)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier"  :subid("35_1275599996.35368") :method
.annotate 'line', 52
    $P132 = self."!PREFIX__!protoregex"("quantifier")
    .return ($P132)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<*>"  :subid("36_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx134_tgt
    .local int rx134_pos
    .local int rx134_off
    .local int rx134_eos
    .local int rx134_rep
    .local pmc rx134_cur
    (rx134_cur, rx134_pos, rx134_tgt) = self."!cursor_start"()
    rx134_cur."!cursor_debug"("START ", "quantifier:sym<*>")
    .lex unicode:"$\x{a2}", rx134_cur
    .local pmc match
    .lex "$/", match
    length rx134_eos, rx134_tgt
    gt rx134_pos, rx134_eos, rx134_done
    set rx134_off, 0
    lt rx134_pos, 2, rx134_start
    sub rx134_off, rx134_pos, 1
    substr rx134_tgt, rx134_tgt, rx134_off
  rx134_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan138_done
    goto rxscan138_scan
  rxscan138_loop:
    ($P10) = rx134_cur."from"()
    inc $P10
    set rx134_pos, $P10
    ge rx134_pos, rx134_eos, rxscan138_done
  rxscan138_scan:
    set_addr $I10, rxscan138_loop
    rx134_cur."!mark_push"(0, rx134_pos, $I10)
  rxscan138_done:
.annotate 'line', 53
  # rx subcapture "sym"
    set_addr $I10, rxcap_139_fail
    rx134_cur."!mark_push"(0, rx134_pos, $I10)
  # rx literal  "*"
    add $I11, rx134_pos, 1
    gt $I11, rx134_eos, rx134_fail
    sub $I11, rx134_pos, rx134_off
    substr $S10, rx134_tgt, $I11, 1
    ne $S10, "*", rx134_fail
    add rx134_pos, 1
    set_addr $I10, rxcap_139_fail
    ($I12, $I11) = rx134_cur."!mark_peek"($I10)
    rx134_cur."!cursor_pos"($I11)
    ($P10) = rx134_cur."!cursor_start"()
    $P10."!cursor_pass"(rx134_pos, "")
    rx134_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_139_done
  rxcap_139_fail:
    goto rx134_fail
  rxcap_139_done:
  # rx subrule "backmod" subtype=capture negate=
    rx134_cur."!cursor_pos"(rx134_pos)
    $P10 = rx134_cur."backmod"()
    unless $P10, rx134_fail
    rx134_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx134_pos = $P10."pos"()
  # rx pass
    rx134_cur."!cursor_pass"(rx134_pos, "quantifier:sym<*>")
    rx134_cur."!cursor_debug"("PASS  ", "quantifier:sym<*>", " at pos=", rx134_pos)
    .return (rx134_cur)
  rx134_fail:
.annotate 'line', 3
    (rx134_rep, rx134_pos, $I10, $P10) = rx134_cur."!mark_fail"(0)
    lt rx134_pos, -1, rx134_done
    eq rx134_pos, -1, rx134_fail
    jump $I10
  rx134_done:
    rx134_cur."!cursor_fail"()
    rx134_cur."!cursor_debug"("FAIL  ", "quantifier:sym<*>")
    .return (rx134_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<*>"  :subid("37_1275599996.35368") :method
.annotate 'line', 3
    $P136 = self."!PREFIX__!subrule"("backmod", "*")
    new $P137, "ResizablePMCArray"
    push $P137, $P136
    .return ($P137)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<+>"  :subid("38_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx141_tgt
    .local int rx141_pos
    .local int rx141_off
    .local int rx141_eos
    .local int rx141_rep
    .local pmc rx141_cur
    (rx141_cur, rx141_pos, rx141_tgt) = self."!cursor_start"()
    rx141_cur."!cursor_debug"("START ", "quantifier:sym<+>")
    .lex unicode:"$\x{a2}", rx141_cur
    .local pmc match
    .lex "$/", match
    length rx141_eos, rx141_tgt
    gt rx141_pos, rx141_eos, rx141_done
    set rx141_off, 0
    lt rx141_pos, 2, rx141_start
    sub rx141_off, rx141_pos, 1
    substr rx141_tgt, rx141_tgt, rx141_off
  rx141_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan145_done
    goto rxscan145_scan
  rxscan145_loop:
    ($P10) = rx141_cur."from"()
    inc $P10
    set rx141_pos, $P10
    ge rx141_pos, rx141_eos, rxscan145_done
  rxscan145_scan:
    set_addr $I10, rxscan145_loop
    rx141_cur."!mark_push"(0, rx141_pos, $I10)
  rxscan145_done:
.annotate 'line', 54
  # rx subcapture "sym"
    set_addr $I10, rxcap_146_fail
    rx141_cur."!mark_push"(0, rx141_pos, $I10)
  # rx literal  "+"
    add $I11, rx141_pos, 1
    gt $I11, rx141_eos, rx141_fail
    sub $I11, rx141_pos, rx141_off
    substr $S10, rx141_tgt, $I11, 1
    ne $S10, "+", rx141_fail
    add rx141_pos, 1
    set_addr $I10, rxcap_146_fail
    ($I12, $I11) = rx141_cur."!mark_peek"($I10)
    rx141_cur."!cursor_pos"($I11)
    ($P10) = rx141_cur."!cursor_start"()
    $P10."!cursor_pass"(rx141_pos, "")
    rx141_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_146_done
  rxcap_146_fail:
    goto rx141_fail
  rxcap_146_done:
  # rx subrule "backmod" subtype=capture negate=
    rx141_cur."!cursor_pos"(rx141_pos)
    $P10 = rx141_cur."backmod"()
    unless $P10, rx141_fail
    rx141_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx141_pos = $P10."pos"()
  # rx pass
    rx141_cur."!cursor_pass"(rx141_pos, "quantifier:sym<+>")
    rx141_cur."!cursor_debug"("PASS  ", "quantifier:sym<+>", " at pos=", rx141_pos)
    .return (rx141_cur)
  rx141_fail:
.annotate 'line', 3
    (rx141_rep, rx141_pos, $I10, $P10) = rx141_cur."!mark_fail"(0)
    lt rx141_pos, -1, rx141_done
    eq rx141_pos, -1, rx141_fail
    jump $I10
  rx141_done:
    rx141_cur."!cursor_fail"()
    rx141_cur."!cursor_debug"("FAIL  ", "quantifier:sym<+>")
    .return (rx141_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<+>"  :subid("39_1275599996.35368") :method
.annotate 'line', 3
    $P143 = self."!PREFIX__!subrule"("backmod", "+")
    new $P144, "ResizablePMCArray"
    push $P144, $P143
    .return ($P144)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<?>"  :subid("40_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx148_tgt
    .local int rx148_pos
    .local int rx148_off
    .local int rx148_eos
    .local int rx148_rep
    .local pmc rx148_cur
    (rx148_cur, rx148_pos, rx148_tgt) = self."!cursor_start"()
    rx148_cur."!cursor_debug"("START ", "quantifier:sym<?>")
    .lex unicode:"$\x{a2}", rx148_cur
    .local pmc match
    .lex "$/", match
    length rx148_eos, rx148_tgt
    gt rx148_pos, rx148_eos, rx148_done
    set rx148_off, 0
    lt rx148_pos, 2, rx148_start
    sub rx148_off, rx148_pos, 1
    substr rx148_tgt, rx148_tgt, rx148_off
  rx148_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan152_done
    goto rxscan152_scan
  rxscan152_loop:
    ($P10) = rx148_cur."from"()
    inc $P10
    set rx148_pos, $P10
    ge rx148_pos, rx148_eos, rxscan152_done
  rxscan152_scan:
    set_addr $I10, rxscan152_loop
    rx148_cur."!mark_push"(0, rx148_pos, $I10)
  rxscan152_done:
.annotate 'line', 55
  # rx subcapture "sym"
    set_addr $I10, rxcap_153_fail
    rx148_cur."!mark_push"(0, rx148_pos, $I10)
  # rx literal  "?"
    add $I11, rx148_pos, 1
    gt $I11, rx148_eos, rx148_fail
    sub $I11, rx148_pos, rx148_off
    substr $S10, rx148_tgt, $I11, 1
    ne $S10, "?", rx148_fail
    add rx148_pos, 1
    set_addr $I10, rxcap_153_fail
    ($I12, $I11) = rx148_cur."!mark_peek"($I10)
    rx148_cur."!cursor_pos"($I11)
    ($P10) = rx148_cur."!cursor_start"()
    $P10."!cursor_pass"(rx148_pos, "")
    rx148_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_153_done
  rxcap_153_fail:
    goto rx148_fail
  rxcap_153_done:
  # rx subrule "backmod" subtype=capture negate=
    rx148_cur."!cursor_pos"(rx148_pos)
    $P10 = rx148_cur."backmod"()
    unless $P10, rx148_fail
    rx148_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx148_pos = $P10."pos"()
  # rx pass
    rx148_cur."!cursor_pass"(rx148_pos, "quantifier:sym<?>")
    rx148_cur."!cursor_debug"("PASS  ", "quantifier:sym<?>", " at pos=", rx148_pos)
    .return (rx148_cur)
  rx148_fail:
.annotate 'line', 3
    (rx148_rep, rx148_pos, $I10, $P10) = rx148_cur."!mark_fail"(0)
    lt rx148_pos, -1, rx148_done
    eq rx148_pos, -1, rx148_fail
    jump $I10
  rx148_done:
    rx148_cur."!cursor_fail"()
    rx148_cur."!cursor_debug"("FAIL  ", "quantifier:sym<?>")
    .return (rx148_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<?>"  :subid("41_1275599996.35368") :method
.annotate 'line', 3
    $P150 = self."!PREFIX__!subrule"("backmod", "?")
    new $P151, "ResizablePMCArray"
    push $P151, $P150
    .return ($P151)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<**>"  :subid("42_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx155_tgt
    .local int rx155_pos
    .local int rx155_off
    .local int rx155_eos
    .local int rx155_rep
    .local pmc rx155_cur
    (rx155_cur, rx155_pos, rx155_tgt) = self."!cursor_start"()
    rx155_cur."!cursor_debug"("START ", "quantifier:sym<**>")
    rx155_cur."!cursor_caparray"("max", "normspace")
    .lex unicode:"$\x{a2}", rx155_cur
    .local pmc match
    .lex "$/", match
    length rx155_eos, rx155_tgt
    gt rx155_pos, rx155_eos, rx155_done
    set rx155_off, 0
    lt rx155_pos, 2, rx155_start
    sub rx155_off, rx155_pos, 1
    substr rx155_tgt, rx155_tgt, rx155_off
  rx155_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan158_done
    goto rxscan158_scan
  rxscan158_loop:
    ($P10) = rx155_cur."from"()
    inc $P10
    set rx155_pos, $P10
    ge rx155_pos, rx155_eos, rxscan158_done
  rxscan158_scan:
    set_addr $I10, rxscan158_loop
    rx155_cur."!mark_push"(0, rx155_pos, $I10)
  rxscan158_done:
.annotate 'line', 57
  # rx subcapture "sym"
    set_addr $I10, rxcap_159_fail
    rx155_cur."!mark_push"(0, rx155_pos, $I10)
  # rx literal  "**"
    add $I11, rx155_pos, 2
    gt $I11, rx155_eos, rx155_fail
    sub $I11, rx155_pos, rx155_off
    substr $S10, rx155_tgt, $I11, 2
    ne $S10, "**", rx155_fail
    add rx155_pos, 2
    set_addr $I10, rxcap_159_fail
    ($I12, $I11) = rx155_cur."!mark_peek"($I10)
    rx155_cur."!cursor_pos"($I11)
    ($P10) = rx155_cur."!cursor_start"()
    $P10."!cursor_pass"(rx155_pos, "")
    rx155_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_159_done
  rxcap_159_fail:
    goto rx155_fail
  rxcap_159_done:
  # rx rxquantr160 ** 0..1
    set_addr $I161, rxquantr160_done
    rx155_cur."!mark_push"(0, rx155_pos, $I161)
  rxquantr160_loop:
  # rx subrule "normspace" subtype=capture negate=
    rx155_cur."!cursor_pos"(rx155_pos)
    $P10 = rx155_cur."normspace"()
    unless $P10, rx155_fail
    rx155_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("normspace")
    rx155_pos = $P10."pos"()
    (rx155_rep) = rx155_cur."!mark_commit"($I161)
  rxquantr160_done:
  # rx subrule "backmod" subtype=capture negate=
    rx155_cur."!cursor_pos"(rx155_pos)
    $P10 = rx155_cur."backmod"()
    unless $P10, rx155_fail
    rx155_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx155_pos = $P10."pos"()
  # rx rxquantr162 ** 0..1
    set_addr $I163, rxquantr162_done
    rx155_cur."!mark_push"(0, rx155_pos, $I163)
  rxquantr162_loop:
  # rx subrule "normspace" subtype=capture negate=
    rx155_cur."!cursor_pos"(rx155_pos)
    $P10 = rx155_cur."normspace"()
    unless $P10, rx155_fail
    rx155_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("normspace")
    rx155_pos = $P10."pos"()
    (rx155_rep) = rx155_cur."!mark_commit"($I163)
  rxquantr162_done:
  alt164_0:
.annotate 'line', 58
    set_addr $I10, alt164_1
    rx155_cur."!mark_push"(0, rx155_pos, $I10)
.annotate 'line', 59
  # rx subcapture "min"
    set_addr $I10, rxcap_165_fail
    rx155_cur."!mark_push"(0, rx155_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx155_pos, rx155_off
    find_not_cclass $I11, 8, rx155_tgt, $I10, rx155_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx155_fail
    add rx155_pos, rx155_off, $I11
    set_addr $I10, rxcap_165_fail
    ($I12, $I11) = rx155_cur."!mark_peek"($I10)
    rx155_cur."!cursor_pos"($I11)
    ($P10) = rx155_cur."!cursor_start"()
    $P10."!cursor_pass"(rx155_pos, "")
    rx155_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("min")
    goto rxcap_165_done
  rxcap_165_fail:
    goto rx155_fail
  rxcap_165_done:
.annotate 'line', 66
  # rx rxquantr166 ** 0..1
    set_addr $I169, rxquantr166_done
    rx155_cur."!mark_push"(0, rx155_pos, $I169)
  rxquantr166_loop:
.annotate 'line', 60
  # rx literal  ".."
    add $I11, rx155_pos, 2
    gt $I11, rx155_eos, rx155_fail
    sub $I11, rx155_pos, rx155_off
    substr $S10, rx155_tgt, $I11, 2
    ne $S10, "..", rx155_fail
    add rx155_pos, 2
.annotate 'line', 61
  # rx subcapture "max"
    set_addr $I10, rxcap_168_fail
    rx155_cur."!mark_push"(0, rx155_pos, $I10)
  alt167_0:
    set_addr $I10, alt167_1
    rx155_cur."!mark_push"(0, rx155_pos, $I10)
.annotate 'line', 62
  # rx charclass_q d r 1..-1
    sub $I10, rx155_pos, rx155_off
    find_not_cclass $I11, 8, rx155_tgt, $I10, rx155_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx155_fail
    add rx155_pos, rx155_off, $I11
    goto alt167_end
  alt167_1:
    set_addr $I10, alt167_2
    rx155_cur."!mark_push"(0, rx155_pos, $I10)
.annotate 'line', 63
  # rx literal  "*"
    add $I11, rx155_pos, 1
    gt $I11, rx155_eos, rx155_fail
    sub $I11, rx155_pos, rx155_off
    substr $S10, rx155_tgt, $I11, 1
    ne $S10, "*", rx155_fail
    add rx155_pos, 1
    goto alt167_end
  alt167_2:
.annotate 'line', 64
  # rx subrule "panic" subtype=method negate=
    rx155_cur."!cursor_pos"(rx155_pos)
    $P10 = rx155_cur."panic"("Only integers or '*' allowed as range quantifier endpoint")
    unless $P10, rx155_fail
    rx155_pos = $P10."pos"()
  alt167_end:
.annotate 'line', 61
    set_addr $I10, rxcap_168_fail
    ($I12, $I11) = rx155_cur."!mark_peek"($I10)
    rx155_cur."!cursor_pos"($I11)
    ($P10) = rx155_cur."!cursor_start"()
    $P10."!cursor_pass"(rx155_pos, "")
    rx155_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("max")
    goto rxcap_168_done
  rxcap_168_fail:
    goto rx155_fail
  rxcap_168_done:
.annotate 'line', 66
    (rx155_rep) = rx155_cur."!mark_commit"($I169)
  rxquantr166_done:
.annotate 'line', 59
    goto alt164_end
  alt164_1:
.annotate 'line', 67
  # rx subrule "quantified_atom" subtype=capture negate=
    rx155_cur."!cursor_pos"(rx155_pos)
    $P10 = rx155_cur."quantified_atom"()
    unless $P10, rx155_fail
    rx155_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantified_atom")
    rx155_pos = $P10."pos"()
  alt164_end:
.annotate 'line', 56
  # rx pass
    rx155_cur."!cursor_pass"(rx155_pos, "quantifier:sym<**>")
    rx155_cur."!cursor_debug"("PASS  ", "quantifier:sym<**>", " at pos=", rx155_pos)
    .return (rx155_cur)
  rx155_fail:
.annotate 'line', 3
    (rx155_rep, rx155_pos, $I10, $P10) = rx155_cur."!mark_fail"(0)
    lt rx155_pos, -1, rx155_done
    eq rx155_pos, -1, rx155_fail
    jump $I10
  rx155_done:
    rx155_cur."!cursor_fail"()
    rx155_cur."!cursor_debug"("FAIL  ", "quantifier:sym<**>")
    .return (rx155_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<**>"  :subid("43_1275599996.35368") :method
.annotate 'line', 3
    new $P157, "ResizablePMCArray"
    push $P157, "**"
    .return ($P157)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backmod"  :subid("44_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .const 'Sub' $P179 = "46_1275599996.35368" 
    capture_lex $P179
    .local string rx171_tgt
    .local int rx171_pos
    .local int rx171_off
    .local int rx171_eos
    .local int rx171_rep
    .local pmc rx171_cur
    (rx171_cur, rx171_pos, rx171_tgt) = self."!cursor_start"()
    rx171_cur."!cursor_debug"("START ", "backmod")
    .lex unicode:"$\x{a2}", rx171_cur
    .local pmc match
    .lex "$/", match
    length rx171_eos, rx171_tgt
    gt rx171_pos, rx171_eos, rx171_done
    set rx171_off, 0
    lt rx171_pos, 2, rx171_start
    sub rx171_off, rx171_pos, 1
    substr rx171_tgt, rx171_tgt, rx171_off
  rx171_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan174_done
    goto rxscan174_scan
  rxscan174_loop:
    ($P10) = rx171_cur."from"()
    inc $P10
    set rx171_pos, $P10
    ge rx171_pos, rx171_eos, rxscan174_done
  rxscan174_scan:
    set_addr $I10, rxscan174_loop
    rx171_cur."!mark_push"(0, rx171_pos, $I10)
  rxscan174_done:
.annotate 'line', 71
  # rx rxquantr175 ** 0..1
    set_addr $I176, rxquantr175_done
    rx171_cur."!mark_push"(0, rx171_pos, $I176)
  rxquantr175_loop:
  # rx literal  ":"
    add $I11, rx171_pos, 1
    gt $I11, rx171_eos, rx171_fail
    sub $I11, rx171_pos, rx171_off
    substr $S10, rx171_tgt, $I11, 1
    ne $S10, ":", rx171_fail
    add rx171_pos, 1
    (rx171_rep) = rx171_cur."!mark_commit"($I176)
  rxquantr175_done:
  alt177_0:
    set_addr $I10, alt177_1
    rx171_cur."!mark_push"(0, rx171_pos, $I10)
  # rx literal  "?"
    add $I11, rx171_pos, 1
    gt $I11, rx171_eos, rx171_fail
    sub $I11, rx171_pos, rx171_off
    substr $S10, rx171_tgt, $I11, 1
    ne $S10, "?", rx171_fail
    add rx171_pos, 1
    goto alt177_end
  alt177_1:
    set_addr $I10, alt177_2
    rx171_cur."!mark_push"(0, rx171_pos, $I10)
  # rx literal  "!"
    add $I11, rx171_pos, 1
    gt $I11, rx171_eos, rx171_fail
    sub $I11, rx171_pos, rx171_off
    substr $S10, rx171_tgt, $I11, 1
    ne $S10, "!", rx171_fail
    add rx171_pos, 1
    goto alt177_end
  alt177_2:
  # rx subrule "before" subtype=zerowidth negate=1
    rx171_cur."!cursor_pos"(rx171_pos)
    .const 'Sub' $P179 = "46_1275599996.35368" 
    capture_lex $P179
    $P10 = rx171_cur."before"($P179)
    if $P10, rx171_fail
  alt177_end:
  # rx pass
    rx171_cur."!cursor_pass"(rx171_pos, "backmod")
    rx171_cur."!cursor_debug"("PASS  ", "backmod", " at pos=", rx171_pos)
    .return (rx171_cur)
  rx171_fail:
.annotate 'line', 3
    (rx171_rep, rx171_pos, $I10, $P10) = rx171_cur."!mark_fail"(0)
    lt rx171_pos, -1, rx171_done
    eq rx171_pos, -1, rx171_fail
    jump $I10
  rx171_done:
    rx171_cur."!cursor_fail"()
    rx171_cur."!cursor_debug"("FAIL  ", "backmod")
    .return (rx171_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backmod"  :subid("45_1275599996.35368") :method
.annotate 'line', 3
    new $P173, "ResizablePMCArray"
    push $P173, ""
    .return ($P173)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block178"  :anon :subid("46_1275599996.35368") :method :outer("44_1275599996.35368")
.annotate 'line', 71
    .local string rx180_tgt
    .local int rx180_pos
    .local int rx180_off
    .local int rx180_eos
    .local int rx180_rep
    .local pmc rx180_cur
    (rx180_cur, rx180_pos, rx180_tgt) = self."!cursor_start"()
    rx180_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx180_cur
    .local pmc match
    .lex "$/", match
    length rx180_eos, rx180_tgt
    gt rx180_pos, rx180_eos, rx180_done
    set rx180_off, 0
    lt rx180_pos, 2, rx180_start
    sub rx180_off, rx180_pos, 1
    substr rx180_tgt, rx180_tgt, rx180_off
  rx180_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan181_done
    goto rxscan181_scan
  rxscan181_loop:
    ($P10) = rx180_cur."from"()
    inc $P10
    set rx180_pos, $P10
    ge rx180_pos, rx180_eos, rxscan181_done
  rxscan181_scan:
    set_addr $I10, rxscan181_loop
    rx180_cur."!mark_push"(0, rx180_pos, $I10)
  rxscan181_done:
  # rx literal  ":"
    add $I11, rx180_pos, 1
    gt $I11, rx180_eos, rx180_fail
    sub $I11, rx180_pos, rx180_off
    substr $S10, rx180_tgt, $I11, 1
    ne $S10, ":", rx180_fail
    add rx180_pos, 1
  # rx pass
    rx180_cur."!cursor_pass"(rx180_pos, "")
    rx180_cur."!cursor_debug"("PASS  ", "", " at pos=", rx180_pos)
    .return (rx180_cur)
  rx180_fail:
    (rx180_rep, rx180_pos, $I10, $P10) = rx180_cur."!mark_fail"(0)
    lt rx180_pos, -1, rx180_done
    eq rx180_pos, -1, rx180_fail
    jump $I10
  rx180_done:
    rx180_cur."!cursor_fail"()
    rx180_cur."!cursor_debug"("FAIL  ", "")
    .return (rx180_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar"  :subid("47_1275599996.35368") :method
.annotate 'line', 73
    $P183 = self."!protoregex"("metachar")
    .return ($P183)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar"  :subid("48_1275599996.35368") :method
.annotate 'line', 73
    $P185 = self."!PREFIX__!protoregex"("metachar")
    .return ($P185)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<ws>"  :subid("49_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx187_tgt
    .local int rx187_pos
    .local int rx187_off
    .local int rx187_eos
    .local int rx187_rep
    .local pmc rx187_cur
    (rx187_cur, rx187_pos, rx187_tgt) = self."!cursor_start"()
    rx187_cur."!cursor_debug"("START ", "metachar:sym<ws>")
    .lex unicode:"$\x{a2}", rx187_cur
    .local pmc match
    .lex "$/", match
    length rx187_eos, rx187_tgt
    gt rx187_pos, rx187_eos, rx187_done
    set rx187_off, 0
    lt rx187_pos, 2, rx187_start
    sub rx187_off, rx187_pos, 1
    substr rx187_tgt, rx187_tgt, rx187_off
  rx187_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan191_done
    goto rxscan191_scan
  rxscan191_loop:
    ($P10) = rx187_cur."from"()
    inc $P10
    set rx187_pos, $P10
    ge rx187_pos, rx187_eos, rxscan191_done
  rxscan191_scan:
    set_addr $I10, rxscan191_loop
    rx187_cur."!mark_push"(0, rx187_pos, $I10)
  rxscan191_done:
.annotate 'line', 74
  # rx subrule "normspace" subtype=method negate=
    rx187_cur."!cursor_pos"(rx187_pos)
    $P10 = rx187_cur."normspace"()
    unless $P10, rx187_fail
    rx187_pos = $P10."pos"()
  # rx pass
    rx187_cur."!cursor_pass"(rx187_pos, "metachar:sym<ws>")
    rx187_cur."!cursor_debug"("PASS  ", "metachar:sym<ws>", " at pos=", rx187_pos)
    .return (rx187_cur)
  rx187_fail:
.annotate 'line', 3
    (rx187_rep, rx187_pos, $I10, $P10) = rx187_cur."!mark_fail"(0)
    lt rx187_pos, -1, rx187_done
    eq rx187_pos, -1, rx187_fail
    jump $I10
  rx187_done:
    rx187_cur."!cursor_fail"()
    rx187_cur."!cursor_debug"("FAIL  ", "metachar:sym<ws>")
    .return (rx187_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<ws>"  :subid("50_1275599996.35368") :method
.annotate 'line', 3
    $P189 = self."!PREFIX__!subrule"("", "")
    new $P190, "ResizablePMCArray"
    push $P190, $P189
    .return ($P190)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<[ ]>"  :subid("51_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx193_tgt
    .local int rx193_pos
    .local int rx193_off
    .local int rx193_eos
    .local int rx193_rep
    .local pmc rx193_cur
    (rx193_cur, rx193_pos, rx193_tgt) = self."!cursor_start"()
    rx193_cur."!cursor_debug"("START ", "metachar:sym<[ ]>")
    .lex unicode:"$\x{a2}", rx193_cur
    .local pmc match
    .lex "$/", match
    length rx193_eos, rx193_tgt
    gt rx193_pos, rx193_eos, rx193_done
    set rx193_off, 0
    lt rx193_pos, 2, rx193_start
    sub rx193_off, rx193_pos, 1
    substr rx193_tgt, rx193_tgt, rx193_off
  rx193_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan197_done
    goto rxscan197_scan
  rxscan197_loop:
    ($P10) = rx193_cur."from"()
    inc $P10
    set rx193_pos, $P10
    ge rx193_pos, rx193_eos, rxscan197_done
  rxscan197_scan:
    set_addr $I10, rxscan197_loop
    rx193_cur."!mark_push"(0, rx193_pos, $I10)
  rxscan197_done:
.annotate 'line', 75
  # rx literal  "["
    add $I11, rx193_pos, 1
    gt $I11, rx193_eos, rx193_fail
    sub $I11, rx193_pos, rx193_off
    substr $S10, rx193_tgt, $I11, 1
    ne $S10, "[", rx193_fail
    add rx193_pos, 1
  # rx subrule "nibbler" subtype=capture negate=
    rx193_cur."!cursor_pos"(rx193_pos)
    $P10 = rx193_cur."nibbler"()
    unless $P10, rx193_fail
    rx193_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx193_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx193_pos, 1
    gt $I11, rx193_eos, rx193_fail
    sub $I11, rx193_pos, rx193_off
    substr $S10, rx193_tgt, $I11, 1
    ne $S10, "]", rx193_fail
    add rx193_pos, 1
  # rx pass
    rx193_cur."!cursor_pass"(rx193_pos, "metachar:sym<[ ]>")
    rx193_cur."!cursor_debug"("PASS  ", "metachar:sym<[ ]>", " at pos=", rx193_pos)
    .return (rx193_cur)
  rx193_fail:
.annotate 'line', 3
    (rx193_rep, rx193_pos, $I10, $P10) = rx193_cur."!mark_fail"(0)
    lt rx193_pos, -1, rx193_done
    eq rx193_pos, -1, rx193_fail
    jump $I10
  rx193_done:
    rx193_cur."!cursor_fail"()
    rx193_cur."!cursor_debug"("FAIL  ", "metachar:sym<[ ]>")
    .return (rx193_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<[ ]>"  :subid("52_1275599996.35368") :method
.annotate 'line', 3
    $P195 = self."!PREFIX__!subrule"("nibbler", "[")
    new $P196, "ResizablePMCArray"
    push $P196, $P195
    .return ($P196)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<( )>"  :subid("53_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx199_tgt
    .local int rx199_pos
    .local int rx199_off
    .local int rx199_eos
    .local int rx199_rep
    .local pmc rx199_cur
    (rx199_cur, rx199_pos, rx199_tgt) = self."!cursor_start"()
    rx199_cur."!cursor_debug"("START ", "metachar:sym<( )>")
    .lex unicode:"$\x{a2}", rx199_cur
    .local pmc match
    .lex "$/", match
    length rx199_eos, rx199_tgt
    gt rx199_pos, rx199_eos, rx199_done
    set rx199_off, 0
    lt rx199_pos, 2, rx199_start
    sub rx199_off, rx199_pos, 1
    substr rx199_tgt, rx199_tgt, rx199_off
  rx199_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan203_done
    goto rxscan203_scan
  rxscan203_loop:
    ($P10) = rx199_cur."from"()
    inc $P10
    set rx199_pos, $P10
    ge rx199_pos, rx199_eos, rxscan203_done
  rxscan203_scan:
    set_addr $I10, rxscan203_loop
    rx199_cur."!mark_push"(0, rx199_pos, $I10)
  rxscan203_done:
.annotate 'line', 76
  # rx literal  "("
    add $I11, rx199_pos, 1
    gt $I11, rx199_eos, rx199_fail
    sub $I11, rx199_pos, rx199_off
    substr $S10, rx199_tgt, $I11, 1
    ne $S10, "(", rx199_fail
    add rx199_pos, 1
  # rx subrule "nibbler" subtype=capture negate=
    rx199_cur."!cursor_pos"(rx199_pos)
    $P10 = rx199_cur."nibbler"()
    unless $P10, rx199_fail
    rx199_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx199_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx199_pos, 1
    gt $I11, rx199_eos, rx199_fail
    sub $I11, rx199_pos, rx199_off
    substr $S10, rx199_tgt, $I11, 1
    ne $S10, ")", rx199_fail
    add rx199_pos, 1
  # rx pass
    rx199_cur."!cursor_pass"(rx199_pos, "metachar:sym<( )>")
    rx199_cur."!cursor_debug"("PASS  ", "metachar:sym<( )>", " at pos=", rx199_pos)
    .return (rx199_cur)
  rx199_fail:
.annotate 'line', 3
    (rx199_rep, rx199_pos, $I10, $P10) = rx199_cur."!mark_fail"(0)
    lt rx199_pos, -1, rx199_done
    eq rx199_pos, -1, rx199_fail
    jump $I10
  rx199_done:
    rx199_cur."!cursor_fail"()
    rx199_cur."!cursor_debug"("FAIL  ", "metachar:sym<( )>")
    .return (rx199_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<( )>"  :subid("54_1275599996.35368") :method
.annotate 'line', 3
    $P201 = self."!PREFIX__!subrule"("nibbler", "(")
    new $P202, "ResizablePMCArray"
    push $P202, $P201
    .return ($P202)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<'>"  :subid("55_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx205_tgt
    .local int rx205_pos
    .local int rx205_off
    .local int rx205_eos
    .local int rx205_rep
    .local pmc rx205_cur
    (rx205_cur, rx205_pos, rx205_tgt) = self."!cursor_start"()
    rx205_cur."!cursor_debug"("START ", "metachar:sym<'>")
    .lex unicode:"$\x{a2}", rx205_cur
    .local pmc match
    .lex "$/", match
    length rx205_eos, rx205_tgt
    gt rx205_pos, rx205_eos, rx205_done
    set rx205_off, 0
    lt rx205_pos, 2, rx205_start
    sub rx205_off, rx205_pos, 1
    substr rx205_tgt, rx205_tgt, rx205_off
  rx205_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan208_done
    goto rxscan208_scan
  rxscan208_loop:
    ($P10) = rx205_cur."from"()
    inc $P10
    set rx205_pos, $P10
    ge rx205_pos, rx205_eos, rxscan208_done
  rxscan208_scan:
    set_addr $I10, rxscan208_loop
    rx205_cur."!mark_push"(0, rx205_pos, $I10)
  rxscan208_done:
.annotate 'line', 77
  # rx enumcharlist negate=0 zerowidth
    ge rx205_pos, rx205_eos, rx205_fail
    sub $I10, rx205_pos, rx205_off
    substr $S10, rx205_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx205_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx205_cur."!cursor_pos"(rx205_pos)
    $P10 = rx205_cur."quote_EXPR"(":q")
    unless $P10, rx205_fail
    rx205_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx205_pos = $P10."pos"()
  # rx pass
    rx205_cur."!cursor_pass"(rx205_pos, "metachar:sym<'>")
    rx205_cur."!cursor_debug"("PASS  ", "metachar:sym<'>", " at pos=", rx205_pos)
    .return (rx205_cur)
  rx205_fail:
.annotate 'line', 3
    (rx205_rep, rx205_pos, $I10, $P10) = rx205_cur."!mark_fail"(0)
    lt rx205_pos, -1, rx205_done
    eq rx205_pos, -1, rx205_fail
    jump $I10
  rx205_done:
    rx205_cur."!cursor_fail"()
    rx205_cur."!cursor_debug"("FAIL  ", "metachar:sym<'>")
    .return (rx205_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<'>"  :subid("56_1275599996.35368") :method
.annotate 'line', 3
    new $P207, "ResizablePMCArray"
    push $P207, "'"
    .return ($P207)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<\">"  :subid("57_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx210_tgt
    .local int rx210_pos
    .local int rx210_off
    .local int rx210_eos
    .local int rx210_rep
    .local pmc rx210_cur
    (rx210_cur, rx210_pos, rx210_tgt) = self."!cursor_start"()
    rx210_cur."!cursor_debug"("START ", "metachar:sym<\">")
    .lex unicode:"$\x{a2}", rx210_cur
    .local pmc match
    .lex "$/", match
    length rx210_eos, rx210_tgt
    gt rx210_pos, rx210_eos, rx210_done
    set rx210_off, 0
    lt rx210_pos, 2, rx210_start
    sub rx210_off, rx210_pos, 1
    substr rx210_tgt, rx210_tgt, rx210_off
  rx210_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan213_done
    goto rxscan213_scan
  rxscan213_loop:
    ($P10) = rx210_cur."from"()
    inc $P10
    set rx210_pos, $P10
    ge rx210_pos, rx210_eos, rxscan213_done
  rxscan213_scan:
    set_addr $I10, rxscan213_loop
    rx210_cur."!mark_push"(0, rx210_pos, $I10)
  rxscan213_done:
.annotate 'line', 78
  # rx enumcharlist negate=0 zerowidth
    ge rx210_pos, rx210_eos, rx210_fail
    sub $I10, rx210_pos, rx210_off
    substr $S10, rx210_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx210_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx210_cur."!cursor_pos"(rx210_pos)
    $P10 = rx210_cur."quote_EXPR"(":qq")
    unless $P10, rx210_fail
    rx210_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx210_pos = $P10."pos"()
  # rx pass
    rx210_cur."!cursor_pass"(rx210_pos, "metachar:sym<\">")
    rx210_cur."!cursor_debug"("PASS  ", "metachar:sym<\">", " at pos=", rx210_pos)
    .return (rx210_cur)
  rx210_fail:
.annotate 'line', 3
    (rx210_rep, rx210_pos, $I10, $P10) = rx210_cur."!mark_fail"(0)
    lt rx210_pos, -1, rx210_done
    eq rx210_pos, -1, rx210_fail
    jump $I10
  rx210_done:
    rx210_cur."!cursor_fail"()
    rx210_cur."!cursor_debug"("FAIL  ", "metachar:sym<\">")
    .return (rx210_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<\">"  :subid("58_1275599996.35368") :method
.annotate 'line', 3
    new $P212, "ResizablePMCArray"
    push $P212, "\""
    .return ($P212)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<.>"  :subid("59_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx215_tgt
    .local int rx215_pos
    .local int rx215_off
    .local int rx215_eos
    .local int rx215_rep
    .local pmc rx215_cur
    (rx215_cur, rx215_pos, rx215_tgt) = self."!cursor_start"()
    rx215_cur."!cursor_debug"("START ", "metachar:sym<.>")
    .lex unicode:"$\x{a2}", rx215_cur
    .local pmc match
    .lex "$/", match
    length rx215_eos, rx215_tgt
    gt rx215_pos, rx215_eos, rx215_done
    set rx215_off, 0
    lt rx215_pos, 2, rx215_start
    sub rx215_off, rx215_pos, 1
    substr rx215_tgt, rx215_tgt, rx215_off
  rx215_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan218_done
    goto rxscan218_scan
  rxscan218_loop:
    ($P10) = rx215_cur."from"()
    inc $P10
    set rx215_pos, $P10
    ge rx215_pos, rx215_eos, rxscan218_done
  rxscan218_scan:
    set_addr $I10, rxscan218_loop
    rx215_cur."!mark_push"(0, rx215_pos, $I10)
  rxscan218_done:
.annotate 'line', 79
  # rx subcapture "sym"
    set_addr $I10, rxcap_219_fail
    rx215_cur."!mark_push"(0, rx215_pos, $I10)
  # rx literal  "."
    add $I11, rx215_pos, 1
    gt $I11, rx215_eos, rx215_fail
    sub $I11, rx215_pos, rx215_off
    substr $S10, rx215_tgt, $I11, 1
    ne $S10, ".", rx215_fail
    add rx215_pos, 1
    set_addr $I10, rxcap_219_fail
    ($I12, $I11) = rx215_cur."!mark_peek"($I10)
    rx215_cur."!cursor_pos"($I11)
    ($P10) = rx215_cur."!cursor_start"()
    $P10."!cursor_pass"(rx215_pos, "")
    rx215_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_219_done
  rxcap_219_fail:
    goto rx215_fail
  rxcap_219_done:
  # rx pass
    rx215_cur."!cursor_pass"(rx215_pos, "metachar:sym<.>")
    rx215_cur."!cursor_debug"("PASS  ", "metachar:sym<.>", " at pos=", rx215_pos)
    .return (rx215_cur)
  rx215_fail:
.annotate 'line', 3
    (rx215_rep, rx215_pos, $I10, $P10) = rx215_cur."!mark_fail"(0)
    lt rx215_pos, -1, rx215_done
    eq rx215_pos, -1, rx215_fail
    jump $I10
  rx215_done:
    rx215_cur."!cursor_fail"()
    rx215_cur."!cursor_debug"("FAIL  ", "metachar:sym<.>")
    .return (rx215_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<.>"  :subid("60_1275599996.35368") :method
.annotate 'line', 3
    new $P217, "ResizablePMCArray"
    push $P217, "."
    .return ($P217)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^>"  :subid("61_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx221_tgt
    .local int rx221_pos
    .local int rx221_off
    .local int rx221_eos
    .local int rx221_rep
    .local pmc rx221_cur
    (rx221_cur, rx221_pos, rx221_tgt) = self."!cursor_start"()
    rx221_cur."!cursor_debug"("START ", "metachar:sym<^>")
    .lex unicode:"$\x{a2}", rx221_cur
    .local pmc match
    .lex "$/", match
    length rx221_eos, rx221_tgt
    gt rx221_pos, rx221_eos, rx221_done
    set rx221_off, 0
    lt rx221_pos, 2, rx221_start
    sub rx221_off, rx221_pos, 1
    substr rx221_tgt, rx221_tgt, rx221_off
  rx221_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan224_done
    goto rxscan224_scan
  rxscan224_loop:
    ($P10) = rx221_cur."from"()
    inc $P10
    set rx221_pos, $P10
    ge rx221_pos, rx221_eos, rxscan224_done
  rxscan224_scan:
    set_addr $I10, rxscan224_loop
    rx221_cur."!mark_push"(0, rx221_pos, $I10)
  rxscan224_done:
.annotate 'line', 80
  # rx subcapture "sym"
    set_addr $I10, rxcap_225_fail
    rx221_cur."!mark_push"(0, rx221_pos, $I10)
  # rx literal  "^"
    add $I11, rx221_pos, 1
    gt $I11, rx221_eos, rx221_fail
    sub $I11, rx221_pos, rx221_off
    substr $S10, rx221_tgt, $I11, 1
    ne $S10, "^", rx221_fail
    add rx221_pos, 1
    set_addr $I10, rxcap_225_fail
    ($I12, $I11) = rx221_cur."!mark_peek"($I10)
    rx221_cur."!cursor_pos"($I11)
    ($P10) = rx221_cur."!cursor_start"()
    $P10."!cursor_pass"(rx221_pos, "")
    rx221_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_225_done
  rxcap_225_fail:
    goto rx221_fail
  rxcap_225_done:
  # rx pass
    rx221_cur."!cursor_pass"(rx221_pos, "metachar:sym<^>")
    rx221_cur."!cursor_debug"("PASS  ", "metachar:sym<^>", " at pos=", rx221_pos)
    .return (rx221_cur)
  rx221_fail:
.annotate 'line', 3
    (rx221_rep, rx221_pos, $I10, $P10) = rx221_cur."!mark_fail"(0)
    lt rx221_pos, -1, rx221_done
    eq rx221_pos, -1, rx221_fail
    jump $I10
  rx221_done:
    rx221_cur."!cursor_fail"()
    rx221_cur."!cursor_debug"("FAIL  ", "metachar:sym<^>")
    .return (rx221_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<^>"  :subid("62_1275599996.35368") :method
.annotate 'line', 3
    new $P223, "ResizablePMCArray"
    push $P223, "^"
    .return ($P223)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^^>"  :subid("63_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx227_tgt
    .local int rx227_pos
    .local int rx227_off
    .local int rx227_eos
    .local int rx227_rep
    .local pmc rx227_cur
    (rx227_cur, rx227_pos, rx227_tgt) = self."!cursor_start"()
    rx227_cur."!cursor_debug"("START ", "metachar:sym<^^>")
    .lex unicode:"$\x{a2}", rx227_cur
    .local pmc match
    .lex "$/", match
    length rx227_eos, rx227_tgt
    gt rx227_pos, rx227_eos, rx227_done
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
.annotate 'line', 81
  # rx subcapture "sym"
    set_addr $I10, rxcap_231_fail
    rx227_cur."!mark_push"(0, rx227_pos, $I10)
  # rx literal  "^^"
    add $I11, rx227_pos, 2
    gt $I11, rx227_eos, rx227_fail
    sub $I11, rx227_pos, rx227_off
    substr $S10, rx227_tgt, $I11, 2
    ne $S10, "^^", rx227_fail
    add rx227_pos, 2
    set_addr $I10, rxcap_231_fail
    ($I12, $I11) = rx227_cur."!mark_peek"($I10)
    rx227_cur."!cursor_pos"($I11)
    ($P10) = rx227_cur."!cursor_start"()
    $P10."!cursor_pass"(rx227_pos, "")
    rx227_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_231_done
  rxcap_231_fail:
    goto rx227_fail
  rxcap_231_done:
  # rx pass
    rx227_cur."!cursor_pass"(rx227_pos, "metachar:sym<^^>")
    rx227_cur."!cursor_debug"("PASS  ", "metachar:sym<^^>", " at pos=", rx227_pos)
    .return (rx227_cur)
  rx227_fail:
.annotate 'line', 3
    (rx227_rep, rx227_pos, $I10, $P10) = rx227_cur."!mark_fail"(0)
    lt rx227_pos, -1, rx227_done
    eq rx227_pos, -1, rx227_fail
    jump $I10
  rx227_done:
    rx227_cur."!cursor_fail"()
    rx227_cur."!cursor_debug"("FAIL  ", "metachar:sym<^^>")
    .return (rx227_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<^^>"  :subid("64_1275599996.35368") :method
.annotate 'line', 3
    new $P229, "ResizablePMCArray"
    push $P229, "^^"
    .return ($P229)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$>"  :subid("65_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx233_tgt
    .local int rx233_pos
    .local int rx233_off
    .local int rx233_eos
    .local int rx233_rep
    .local pmc rx233_cur
    (rx233_cur, rx233_pos, rx233_tgt) = self."!cursor_start"()
    rx233_cur."!cursor_debug"("START ", "metachar:sym<$>")
    .lex unicode:"$\x{a2}", rx233_cur
    .local pmc match
    .lex "$/", match
    length rx233_eos, rx233_tgt
    gt rx233_pos, rx233_eos, rx233_done
    set rx233_off, 0
    lt rx233_pos, 2, rx233_start
    sub rx233_off, rx233_pos, 1
    substr rx233_tgt, rx233_tgt, rx233_off
  rx233_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan236_done
    goto rxscan236_scan
  rxscan236_loop:
    ($P10) = rx233_cur."from"()
    inc $P10
    set rx233_pos, $P10
    ge rx233_pos, rx233_eos, rxscan236_done
  rxscan236_scan:
    set_addr $I10, rxscan236_loop
    rx233_cur."!mark_push"(0, rx233_pos, $I10)
  rxscan236_done:
.annotate 'line', 82
  # rx subcapture "sym"
    set_addr $I10, rxcap_237_fail
    rx233_cur."!mark_push"(0, rx233_pos, $I10)
  # rx literal  "$"
    add $I11, rx233_pos, 1
    gt $I11, rx233_eos, rx233_fail
    sub $I11, rx233_pos, rx233_off
    substr $S10, rx233_tgt, $I11, 1
    ne $S10, "$", rx233_fail
    add rx233_pos, 1
    set_addr $I10, rxcap_237_fail
    ($I12, $I11) = rx233_cur."!mark_peek"($I10)
    rx233_cur."!cursor_pos"($I11)
    ($P10) = rx233_cur."!cursor_start"()
    $P10."!cursor_pass"(rx233_pos, "")
    rx233_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_237_done
  rxcap_237_fail:
    goto rx233_fail
  rxcap_237_done:
  # rx pass
    rx233_cur."!cursor_pass"(rx233_pos, "metachar:sym<$>")
    rx233_cur."!cursor_debug"("PASS  ", "metachar:sym<$>", " at pos=", rx233_pos)
    .return (rx233_cur)
  rx233_fail:
.annotate 'line', 3
    (rx233_rep, rx233_pos, $I10, $P10) = rx233_cur."!mark_fail"(0)
    lt rx233_pos, -1, rx233_done
    eq rx233_pos, -1, rx233_fail
    jump $I10
  rx233_done:
    rx233_cur."!cursor_fail"()
    rx233_cur."!cursor_debug"("FAIL  ", "metachar:sym<$>")
    .return (rx233_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<$>"  :subid("66_1275599996.35368") :method
.annotate 'line', 3
    new $P235, "ResizablePMCArray"
    push $P235, "$"
    .return ($P235)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$$>"  :subid("67_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx239_tgt
    .local int rx239_pos
    .local int rx239_off
    .local int rx239_eos
    .local int rx239_rep
    .local pmc rx239_cur
    (rx239_cur, rx239_pos, rx239_tgt) = self."!cursor_start"()
    rx239_cur."!cursor_debug"("START ", "metachar:sym<$$>")
    .lex unicode:"$\x{a2}", rx239_cur
    .local pmc match
    .lex "$/", match
    length rx239_eos, rx239_tgt
    gt rx239_pos, rx239_eos, rx239_done
    set rx239_off, 0
    lt rx239_pos, 2, rx239_start
    sub rx239_off, rx239_pos, 1
    substr rx239_tgt, rx239_tgt, rx239_off
  rx239_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan242_done
    goto rxscan242_scan
  rxscan242_loop:
    ($P10) = rx239_cur."from"()
    inc $P10
    set rx239_pos, $P10
    ge rx239_pos, rx239_eos, rxscan242_done
  rxscan242_scan:
    set_addr $I10, rxscan242_loop
    rx239_cur."!mark_push"(0, rx239_pos, $I10)
  rxscan242_done:
.annotate 'line', 83
  # rx subcapture "sym"
    set_addr $I10, rxcap_243_fail
    rx239_cur."!mark_push"(0, rx239_pos, $I10)
  # rx literal  "$$"
    add $I11, rx239_pos, 2
    gt $I11, rx239_eos, rx239_fail
    sub $I11, rx239_pos, rx239_off
    substr $S10, rx239_tgt, $I11, 2
    ne $S10, "$$", rx239_fail
    add rx239_pos, 2
    set_addr $I10, rxcap_243_fail
    ($I12, $I11) = rx239_cur."!mark_peek"($I10)
    rx239_cur."!cursor_pos"($I11)
    ($P10) = rx239_cur."!cursor_start"()
    $P10."!cursor_pass"(rx239_pos, "")
    rx239_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_243_done
  rxcap_243_fail:
    goto rx239_fail
  rxcap_243_done:
  # rx pass
    rx239_cur."!cursor_pass"(rx239_pos, "metachar:sym<$$>")
    rx239_cur."!cursor_debug"("PASS  ", "metachar:sym<$$>", " at pos=", rx239_pos)
    .return (rx239_cur)
  rx239_fail:
.annotate 'line', 3
    (rx239_rep, rx239_pos, $I10, $P10) = rx239_cur."!mark_fail"(0)
    lt rx239_pos, -1, rx239_done
    eq rx239_pos, -1, rx239_fail
    jump $I10
  rx239_done:
    rx239_cur."!cursor_fail"()
    rx239_cur."!cursor_debug"("FAIL  ", "metachar:sym<$$>")
    .return (rx239_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<$$>"  :subid("68_1275599996.35368") :method
.annotate 'line', 3
    new $P241, "ResizablePMCArray"
    push $P241, "$$"
    .return ($P241)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<:::>"  :subid("69_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx245_tgt
    .local int rx245_pos
    .local int rx245_off
    .local int rx245_eos
    .local int rx245_rep
    .local pmc rx245_cur
    (rx245_cur, rx245_pos, rx245_tgt) = self."!cursor_start"()
    rx245_cur."!cursor_debug"("START ", "metachar:sym<:::>")
    .lex unicode:"$\x{a2}", rx245_cur
    .local pmc match
    .lex "$/", match
    length rx245_eos, rx245_tgt
    gt rx245_pos, rx245_eos, rx245_done
    set rx245_off, 0
    lt rx245_pos, 2, rx245_start
    sub rx245_off, rx245_pos, 1
    substr rx245_tgt, rx245_tgt, rx245_off
  rx245_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan249_done
    goto rxscan249_scan
  rxscan249_loop:
    ($P10) = rx245_cur."from"()
    inc $P10
    set rx245_pos, $P10
    ge rx245_pos, rx245_eos, rxscan249_done
  rxscan249_scan:
    set_addr $I10, rxscan249_loop
    rx245_cur."!mark_push"(0, rx245_pos, $I10)
  rxscan249_done:
.annotate 'line', 84
  # rx subcapture "sym"
    set_addr $I10, rxcap_250_fail
    rx245_cur."!mark_push"(0, rx245_pos, $I10)
  # rx literal  ":::"
    add $I11, rx245_pos, 3
    gt $I11, rx245_eos, rx245_fail
    sub $I11, rx245_pos, rx245_off
    substr $S10, rx245_tgt, $I11, 3
    ne $S10, ":::", rx245_fail
    add rx245_pos, 3
    set_addr $I10, rxcap_250_fail
    ($I12, $I11) = rx245_cur."!mark_peek"($I10)
    rx245_cur."!cursor_pos"($I11)
    ($P10) = rx245_cur."!cursor_start"()
    $P10."!cursor_pass"(rx245_pos, "")
    rx245_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_250_done
  rxcap_250_fail:
    goto rx245_fail
  rxcap_250_done:
  # rx subrule "panic" subtype=method negate=
    rx245_cur."!cursor_pos"(rx245_pos)
    $P10 = rx245_cur."panic"("::: not yet implemented")
    unless $P10, rx245_fail
    rx245_pos = $P10."pos"()
  # rx pass
    rx245_cur."!cursor_pass"(rx245_pos, "metachar:sym<:::>")
    rx245_cur."!cursor_debug"("PASS  ", "metachar:sym<:::>", " at pos=", rx245_pos)
    .return (rx245_cur)
  rx245_fail:
.annotate 'line', 3
    (rx245_rep, rx245_pos, $I10, $P10) = rx245_cur."!mark_fail"(0)
    lt rx245_pos, -1, rx245_done
    eq rx245_pos, -1, rx245_fail
    jump $I10
  rx245_done:
    rx245_cur."!cursor_fail"()
    rx245_cur."!cursor_debug"("FAIL  ", "metachar:sym<:::>")
    .return (rx245_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<:::>"  :subid("70_1275599996.35368") :method
.annotate 'line', 3
    $P247 = self."!PREFIX__!subrule"("", ":::")
    new $P248, "ResizablePMCArray"
    push $P248, $P247
    .return ($P248)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<::>"  :subid("71_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx252_tgt
    .local int rx252_pos
    .local int rx252_off
    .local int rx252_eos
    .local int rx252_rep
    .local pmc rx252_cur
    (rx252_cur, rx252_pos, rx252_tgt) = self."!cursor_start"()
    rx252_cur."!cursor_debug"("START ", "metachar:sym<::>")
    .lex unicode:"$\x{a2}", rx252_cur
    .local pmc match
    .lex "$/", match
    length rx252_eos, rx252_tgt
    gt rx252_pos, rx252_eos, rx252_done
    set rx252_off, 0
    lt rx252_pos, 2, rx252_start
    sub rx252_off, rx252_pos, 1
    substr rx252_tgt, rx252_tgt, rx252_off
  rx252_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan256_done
    goto rxscan256_scan
  rxscan256_loop:
    ($P10) = rx252_cur."from"()
    inc $P10
    set rx252_pos, $P10
    ge rx252_pos, rx252_eos, rxscan256_done
  rxscan256_scan:
    set_addr $I10, rxscan256_loop
    rx252_cur."!mark_push"(0, rx252_pos, $I10)
  rxscan256_done:
.annotate 'line', 85
  # rx subcapture "sym"
    set_addr $I10, rxcap_257_fail
    rx252_cur."!mark_push"(0, rx252_pos, $I10)
  # rx literal  "::"
    add $I11, rx252_pos, 2
    gt $I11, rx252_eos, rx252_fail
    sub $I11, rx252_pos, rx252_off
    substr $S10, rx252_tgt, $I11, 2
    ne $S10, "::", rx252_fail
    add rx252_pos, 2
    set_addr $I10, rxcap_257_fail
    ($I12, $I11) = rx252_cur."!mark_peek"($I10)
    rx252_cur."!cursor_pos"($I11)
    ($P10) = rx252_cur."!cursor_start"()
    $P10."!cursor_pass"(rx252_pos, "")
    rx252_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_257_done
  rxcap_257_fail:
    goto rx252_fail
  rxcap_257_done:
  # rx subrule "panic" subtype=method negate=
    rx252_cur."!cursor_pos"(rx252_pos)
    $P10 = rx252_cur."panic"(":: not yet implemented")
    unless $P10, rx252_fail
    rx252_pos = $P10."pos"()
  # rx pass
    rx252_cur."!cursor_pass"(rx252_pos, "metachar:sym<::>")
    rx252_cur."!cursor_debug"("PASS  ", "metachar:sym<::>", " at pos=", rx252_pos)
    .return (rx252_cur)
  rx252_fail:
.annotate 'line', 3
    (rx252_rep, rx252_pos, $I10, $P10) = rx252_cur."!mark_fail"(0)
    lt rx252_pos, -1, rx252_done
    eq rx252_pos, -1, rx252_fail
    jump $I10
  rx252_done:
    rx252_cur."!cursor_fail"()
    rx252_cur."!cursor_debug"("FAIL  ", "metachar:sym<::>")
    .return (rx252_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<::>"  :subid("72_1275599996.35368") :method
.annotate 'line', 3
    $P254 = self."!PREFIX__!subrule"("", "::")
    new $P255, "ResizablePMCArray"
    push $P255, $P254
    .return ($P255)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<lwb>"  :subid("73_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx259_tgt
    .local int rx259_pos
    .local int rx259_off
    .local int rx259_eos
    .local int rx259_rep
    .local pmc rx259_cur
    (rx259_cur, rx259_pos, rx259_tgt) = self."!cursor_start"()
    rx259_cur."!cursor_debug"("START ", "metachar:sym<lwb>")
    .lex unicode:"$\x{a2}", rx259_cur
    .local pmc match
    .lex "$/", match
    length rx259_eos, rx259_tgt
    gt rx259_pos, rx259_eos, rx259_done
    set rx259_off, 0
    lt rx259_pos, 2, rx259_start
    sub rx259_off, rx259_pos, 1
    substr rx259_tgt, rx259_tgt, rx259_off
  rx259_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan262_done
    goto rxscan262_scan
  rxscan262_loop:
    ($P10) = rx259_cur."from"()
    inc $P10
    set rx259_pos, $P10
    ge rx259_pos, rx259_eos, rxscan262_done
  rxscan262_scan:
    set_addr $I10, rxscan262_loop
    rx259_cur."!mark_push"(0, rx259_pos, $I10)
  rxscan262_done:
.annotate 'line', 86
  # rx subcapture "sym"
    set_addr $I10, rxcap_264_fail
    rx259_cur."!mark_push"(0, rx259_pos, $I10)
  alt263_0:
    set_addr $I10, alt263_1
    rx259_cur."!mark_push"(0, rx259_pos, $I10)
  # rx literal  "<<"
    add $I11, rx259_pos, 2
    gt $I11, rx259_eos, rx259_fail
    sub $I11, rx259_pos, rx259_off
    substr $S10, rx259_tgt, $I11, 2
    ne $S10, "<<", rx259_fail
    add rx259_pos, 2
    goto alt263_end
  alt263_1:
  # rx literal  unicode:"\x{ab}"
    add $I11, rx259_pos, 1
    gt $I11, rx259_eos, rx259_fail
    sub $I11, rx259_pos, rx259_off
    substr $S10, rx259_tgt, $I11, 1
    ne $S10, unicode:"\x{ab}", rx259_fail
    add rx259_pos, 1
  alt263_end:
    set_addr $I10, rxcap_264_fail
    ($I12, $I11) = rx259_cur."!mark_peek"($I10)
    rx259_cur."!cursor_pos"($I11)
    ($P10) = rx259_cur."!cursor_start"()
    $P10."!cursor_pass"(rx259_pos, "")
    rx259_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_264_done
  rxcap_264_fail:
    goto rx259_fail
  rxcap_264_done:
  # rx pass
    rx259_cur."!cursor_pass"(rx259_pos, "metachar:sym<lwb>")
    rx259_cur."!cursor_debug"("PASS  ", "metachar:sym<lwb>", " at pos=", rx259_pos)
    .return (rx259_cur)
  rx259_fail:
.annotate 'line', 3
    (rx259_rep, rx259_pos, $I10, $P10) = rx259_cur."!mark_fail"(0)
    lt rx259_pos, -1, rx259_done
    eq rx259_pos, -1, rx259_fail
    jump $I10
  rx259_done:
    rx259_cur."!cursor_fail"()
    rx259_cur."!cursor_debug"("FAIL  ", "metachar:sym<lwb>")
    .return (rx259_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<lwb>"  :subid("74_1275599996.35368") :method
.annotate 'line', 3
    new $P261, "ResizablePMCArray"
    push $P261, unicode:"\x{ab}"
    push $P261, "<<"
    .return ($P261)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<rwb>"  :subid("75_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx266_tgt
    .local int rx266_pos
    .local int rx266_off
    .local int rx266_eos
    .local int rx266_rep
    .local pmc rx266_cur
    (rx266_cur, rx266_pos, rx266_tgt) = self."!cursor_start"()
    rx266_cur."!cursor_debug"("START ", "metachar:sym<rwb>")
    .lex unicode:"$\x{a2}", rx266_cur
    .local pmc match
    .lex "$/", match
    length rx266_eos, rx266_tgt
    gt rx266_pos, rx266_eos, rx266_done
    set rx266_off, 0
    lt rx266_pos, 2, rx266_start
    sub rx266_off, rx266_pos, 1
    substr rx266_tgt, rx266_tgt, rx266_off
  rx266_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan269_done
    goto rxscan269_scan
  rxscan269_loop:
    ($P10) = rx266_cur."from"()
    inc $P10
    set rx266_pos, $P10
    ge rx266_pos, rx266_eos, rxscan269_done
  rxscan269_scan:
    set_addr $I10, rxscan269_loop
    rx266_cur."!mark_push"(0, rx266_pos, $I10)
  rxscan269_done:
.annotate 'line', 87
  # rx subcapture "sym"
    set_addr $I10, rxcap_271_fail
    rx266_cur."!mark_push"(0, rx266_pos, $I10)
  alt270_0:
    set_addr $I10, alt270_1
    rx266_cur."!mark_push"(0, rx266_pos, $I10)
  # rx literal  ">>"
    add $I11, rx266_pos, 2
    gt $I11, rx266_eos, rx266_fail
    sub $I11, rx266_pos, rx266_off
    substr $S10, rx266_tgt, $I11, 2
    ne $S10, ">>", rx266_fail
    add rx266_pos, 2
    goto alt270_end
  alt270_1:
  # rx literal  unicode:"\x{bb}"
    add $I11, rx266_pos, 1
    gt $I11, rx266_eos, rx266_fail
    sub $I11, rx266_pos, rx266_off
    substr $S10, rx266_tgt, $I11, 1
    ne $S10, unicode:"\x{bb}", rx266_fail
    add rx266_pos, 1
  alt270_end:
    set_addr $I10, rxcap_271_fail
    ($I12, $I11) = rx266_cur."!mark_peek"($I10)
    rx266_cur."!cursor_pos"($I11)
    ($P10) = rx266_cur."!cursor_start"()
    $P10."!cursor_pass"(rx266_pos, "")
    rx266_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_271_done
  rxcap_271_fail:
    goto rx266_fail
  rxcap_271_done:
  # rx pass
    rx266_cur."!cursor_pass"(rx266_pos, "metachar:sym<rwb>")
    rx266_cur."!cursor_debug"("PASS  ", "metachar:sym<rwb>", " at pos=", rx266_pos)
    .return (rx266_cur)
  rx266_fail:
.annotate 'line', 3
    (rx266_rep, rx266_pos, $I10, $P10) = rx266_cur."!mark_fail"(0)
    lt rx266_pos, -1, rx266_done
    eq rx266_pos, -1, rx266_fail
    jump $I10
  rx266_done:
    rx266_cur."!cursor_fail"()
    rx266_cur."!cursor_debug"("FAIL  ", "metachar:sym<rwb>")
    .return (rx266_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<rwb>"  :subid("76_1275599996.35368") :method
.annotate 'line', 3
    new $P268, "ResizablePMCArray"
    push $P268, unicode:"\x{bb}"
    push $P268, ">>"
    .return ($P268)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<bs>"  :subid("77_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx273_tgt
    .local int rx273_pos
    .local int rx273_off
    .local int rx273_eos
    .local int rx273_rep
    .local pmc rx273_cur
    (rx273_cur, rx273_pos, rx273_tgt) = self."!cursor_start"()
    rx273_cur."!cursor_debug"("START ", "metachar:sym<bs>")
    .lex unicode:"$\x{a2}", rx273_cur
    .local pmc match
    .lex "$/", match
    length rx273_eos, rx273_tgt
    gt rx273_pos, rx273_eos, rx273_done
    set rx273_off, 0
    lt rx273_pos, 2, rx273_start
    sub rx273_off, rx273_pos, 1
    substr rx273_tgt, rx273_tgt, rx273_off
  rx273_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan277_done
    goto rxscan277_scan
  rxscan277_loop:
    ($P10) = rx273_cur."from"()
    inc $P10
    set rx273_pos, $P10
    ge rx273_pos, rx273_eos, rxscan277_done
  rxscan277_scan:
    set_addr $I10, rxscan277_loop
    rx273_cur."!mark_push"(0, rx273_pos, $I10)
  rxscan277_done:
.annotate 'line', 88
  # rx literal  "\\"
    add $I11, rx273_pos, 1
    gt $I11, rx273_eos, rx273_fail
    sub $I11, rx273_pos, rx273_off
    substr $S10, rx273_tgt, $I11, 1
    ne $S10, "\\", rx273_fail
    add rx273_pos, 1
  # rx subrule "backslash" subtype=capture negate=
    rx273_cur."!cursor_pos"(rx273_pos)
    $P10 = rx273_cur."backslash"()
    unless $P10, rx273_fail
    rx273_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backslash")
    rx273_pos = $P10."pos"()
  # rx pass
    rx273_cur."!cursor_pass"(rx273_pos, "metachar:sym<bs>")
    rx273_cur."!cursor_debug"("PASS  ", "metachar:sym<bs>", " at pos=", rx273_pos)
    .return (rx273_cur)
  rx273_fail:
.annotate 'line', 3
    (rx273_rep, rx273_pos, $I10, $P10) = rx273_cur."!mark_fail"(0)
    lt rx273_pos, -1, rx273_done
    eq rx273_pos, -1, rx273_fail
    jump $I10
  rx273_done:
    rx273_cur."!cursor_fail"()
    rx273_cur."!cursor_debug"("FAIL  ", "metachar:sym<bs>")
    .return (rx273_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<bs>"  :subid("78_1275599996.35368") :method
.annotate 'line', 3
    $P275 = self."!PREFIX__!subrule"("backslash", "\\")
    new $P276, "ResizablePMCArray"
    push $P276, $P275
    .return ($P276)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<mod>"  :subid("79_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx279_tgt
    .local int rx279_pos
    .local int rx279_off
    .local int rx279_eos
    .local int rx279_rep
    .local pmc rx279_cur
    (rx279_cur, rx279_pos, rx279_tgt) = self."!cursor_start"()
    rx279_cur."!cursor_debug"("START ", "metachar:sym<mod>")
    .lex unicode:"$\x{a2}", rx279_cur
    .local pmc match
    .lex "$/", match
    length rx279_eos, rx279_tgt
    gt rx279_pos, rx279_eos, rx279_done
    set rx279_off, 0
    lt rx279_pos, 2, rx279_start
    sub rx279_off, rx279_pos, 1
    substr rx279_tgt, rx279_tgt, rx279_off
  rx279_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan283_done
    goto rxscan283_scan
  rxscan283_loop:
    ($P10) = rx279_cur."from"()
    inc $P10
    set rx279_pos, $P10
    ge rx279_pos, rx279_eos, rxscan283_done
  rxscan283_scan:
    set_addr $I10, rxscan283_loop
    rx279_cur."!mark_push"(0, rx279_pos, $I10)
  rxscan283_done:
.annotate 'line', 89
  # rx subrule "mod_internal" subtype=capture negate=
    rx279_cur."!cursor_pos"(rx279_pos)
    $P10 = rx279_cur."mod_internal"()
    unless $P10, rx279_fail
    rx279_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_internal")
    rx279_pos = $P10."pos"()
  # rx pass
    rx279_cur."!cursor_pass"(rx279_pos, "metachar:sym<mod>")
    rx279_cur."!cursor_debug"("PASS  ", "metachar:sym<mod>", " at pos=", rx279_pos)
    .return (rx279_cur)
  rx279_fail:
.annotate 'line', 3
    (rx279_rep, rx279_pos, $I10, $P10) = rx279_cur."!mark_fail"(0)
    lt rx279_pos, -1, rx279_done
    eq rx279_pos, -1, rx279_fail
    jump $I10
  rx279_done:
    rx279_cur."!cursor_fail"()
    rx279_cur."!cursor_debug"("FAIL  ", "metachar:sym<mod>")
    .return (rx279_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<mod>"  :subid("80_1275599996.35368") :method
.annotate 'line', 3
    $P281 = self."!PREFIX__!subrule"("mod_internal", "")
    new $P282, "ResizablePMCArray"
    push $P282, $P281
    .return ($P282)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<~>"  :subid("81_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx285_tgt
    .local int rx285_pos
    .local int rx285_off
    .local int rx285_eos
    .local int rx285_rep
    .local pmc rx285_cur
    (rx285_cur, rx285_pos, rx285_tgt) = self."!cursor_start"()
    rx285_cur."!cursor_debug"("START ", "metachar:sym<~>")
    .lex unicode:"$\x{a2}", rx285_cur
    .local pmc match
    .lex "$/", match
    length rx285_eos, rx285_tgt
    gt rx285_pos, rx285_eos, rx285_done
    set rx285_off, 0
    lt rx285_pos, 2, rx285_start
    sub rx285_off, rx285_pos, 1
    substr rx285_tgt, rx285_tgt, rx285_off
  rx285_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan289_done
    goto rxscan289_scan
  rxscan289_loop:
    ($P10) = rx285_cur."from"()
    inc $P10
    set rx285_pos, $P10
    ge rx285_pos, rx285_eos, rxscan289_done
  rxscan289_scan:
    set_addr $I10, rxscan289_loop
    rx285_cur."!mark_push"(0, rx285_pos, $I10)
  rxscan289_done:
.annotate 'line', 93
  # rx subcapture "sym"
    set_addr $I10, rxcap_290_fail
    rx285_cur."!mark_push"(0, rx285_pos, $I10)
  # rx literal  "~"
    add $I11, rx285_pos, 1
    gt $I11, rx285_eos, rx285_fail
    sub $I11, rx285_pos, rx285_off
    substr $S10, rx285_tgt, $I11, 1
    ne $S10, "~", rx285_fail
    add rx285_pos, 1
    set_addr $I10, rxcap_290_fail
    ($I12, $I11) = rx285_cur."!mark_peek"($I10)
    rx285_cur."!cursor_pos"($I11)
    ($P10) = rx285_cur."!cursor_start"()
    $P10."!cursor_pass"(rx285_pos, "")
    rx285_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_290_done
  rxcap_290_fail:
    goto rx285_fail
  rxcap_290_done:
.annotate 'line', 94
  # rx subrule "ws" subtype=method negate=
    rx285_cur."!cursor_pos"(rx285_pos)
    $P10 = rx285_cur."ws"()
    unless $P10, rx285_fail
    rx285_pos = $P10."pos"()
  # rx subrule "quantified_atom" subtype=capture negate=
    rx285_cur."!cursor_pos"(rx285_pos)
    $P10 = rx285_cur."quantified_atom"()
    unless $P10, rx285_fail
    rx285_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("GOAL")
    rx285_pos = $P10."pos"()
.annotate 'line', 95
  # rx subrule "ws" subtype=method negate=
    rx285_cur."!cursor_pos"(rx285_pos)
    $P10 = rx285_cur."ws"()
    unless $P10, rx285_fail
    rx285_pos = $P10."pos"()
  # rx subrule "quantified_atom" subtype=capture negate=
    rx285_cur."!cursor_pos"(rx285_pos)
    $P10 = rx285_cur."quantified_atom"()
    unless $P10, rx285_fail
    rx285_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx285_pos = $P10."pos"()
.annotate 'line', 92
  # rx pass
    rx285_cur."!cursor_pass"(rx285_pos, "metachar:sym<~>")
    rx285_cur."!cursor_debug"("PASS  ", "metachar:sym<~>", " at pos=", rx285_pos)
    .return (rx285_cur)
  rx285_fail:
.annotate 'line', 3
    (rx285_rep, rx285_pos, $I10, $P10) = rx285_cur."!mark_fail"(0)
    lt rx285_pos, -1, rx285_done
    eq rx285_pos, -1, rx285_fail
    jump $I10
  rx285_done:
    rx285_cur."!cursor_fail"()
    rx285_cur."!cursor_debug"("FAIL  ", "metachar:sym<~>")
    .return (rx285_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<~>"  :subid("82_1275599996.35368") :method
.annotate 'line', 3
    $P287 = self."!PREFIX__!subrule"("", "~")
    new $P288, "ResizablePMCArray"
    push $P288, $P287
    .return ($P288)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<{*}>"  :subid("83_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx292_tgt
    .local int rx292_pos
    .local int rx292_off
    .local int rx292_eos
    .local int rx292_rep
    .local pmc rx292_cur
    (rx292_cur, rx292_pos, rx292_tgt) = self."!cursor_start"()
    rx292_cur."!cursor_debug"("START ", "metachar:sym<{*}>")
    rx292_cur."!cursor_caparray"("key")
    .lex unicode:"$\x{a2}", rx292_cur
    .local pmc match
    .lex "$/", match
    length rx292_eos, rx292_tgt
    gt rx292_pos, rx292_eos, rx292_done
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
.annotate 'line', 99
  # rx subcapture "sym"
    set_addr $I10, rxcap_296_fail
    rx292_cur."!mark_push"(0, rx292_pos, $I10)
  # rx literal  "{*}"
    add $I11, rx292_pos, 3
    gt $I11, rx292_eos, rx292_fail
    sub $I11, rx292_pos, rx292_off
    substr $S10, rx292_tgt, $I11, 3
    ne $S10, "{*}", rx292_fail
    add rx292_pos, 3
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
.annotate 'line', 100
  # rx rxquantr297 ** 0..1
    set_addr $I307, rxquantr297_done
    rx292_cur."!mark_push"(0, rx292_pos, $I307)
  rxquantr297_loop:
  # rx rxquantr298 ** 0..*
    set_addr $I299, rxquantr298_done
    rx292_cur."!mark_push"(0, rx292_pos, $I299)
  rxquantr298_loop:
  # rx enumcharlist negate=0 
    ge rx292_pos, rx292_eos, rx292_fail
    sub $I10, rx292_pos, rx292_off
    substr $S10, rx292_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx292_fail
    inc rx292_pos
    (rx292_rep) = rx292_cur."!mark_commit"($I299)
    rx292_cur."!mark_push"(rx292_rep, rx292_pos, $I299)
    goto rxquantr298_loop
  rxquantr298_done:
  # rx literal  "#= "
    add $I11, rx292_pos, 3
    gt $I11, rx292_eos, rx292_fail
    sub $I11, rx292_pos, rx292_off
    substr $S10, rx292_tgt, $I11, 3
    ne $S10, "#= ", rx292_fail
    add rx292_pos, 3
  # rx rxquantr300 ** 0..*
    set_addr $I301, rxquantr300_done
    rx292_cur."!mark_push"(0, rx292_pos, $I301)
  rxquantr300_loop:
  # rx enumcharlist negate=0 
    ge rx292_pos, rx292_eos, rx292_fail
    sub $I10, rx292_pos, rx292_off
    substr $S10, rx292_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx292_fail
    inc rx292_pos
    (rx292_rep) = rx292_cur."!mark_commit"($I301)
    rx292_cur."!mark_push"(rx292_rep, rx292_pos, $I301)
    goto rxquantr300_loop
  rxquantr300_done:
  # rx subcapture "key"
    set_addr $I10, rxcap_306_fail
    rx292_cur."!mark_push"(0, rx292_pos, $I10)
  # rx charclass_q S r 1..-1
    sub $I10, rx292_pos, rx292_off
    find_cclass $I11, 32, rx292_tgt, $I10, rx292_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx292_fail
    add rx292_pos, rx292_off, $I11
  # rx rxquantr302 ** 0..*
    set_addr $I305, rxquantr302_done
    rx292_cur."!mark_push"(0, rx292_pos, $I305)
  rxquantr302_loop:
  # rx rxquantr303 ** 1..*
    set_addr $I304, rxquantr303_done
    rx292_cur."!mark_push"(0, -1, $I304)
  rxquantr303_loop:
  # rx enumcharlist negate=0 
    ge rx292_pos, rx292_eos, rx292_fail
    sub $I10, rx292_pos, rx292_off
    substr $S10, rx292_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx292_fail
    inc rx292_pos
    (rx292_rep) = rx292_cur."!mark_commit"($I304)
    rx292_cur."!mark_push"(rx292_rep, rx292_pos, $I304)
    goto rxquantr303_loop
  rxquantr303_done:
  # rx charclass_q S r 1..-1
    sub $I10, rx292_pos, rx292_off
    find_cclass $I11, 32, rx292_tgt, $I10, rx292_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx292_fail
    add rx292_pos, rx292_off, $I11
    (rx292_rep) = rx292_cur."!mark_commit"($I305)
    rx292_cur."!mark_push"(rx292_rep, rx292_pos, $I305)
    goto rxquantr302_loop
  rxquantr302_done:
    set_addr $I10, rxcap_306_fail
    ($I12, $I11) = rx292_cur."!mark_peek"($I10)
    rx292_cur."!cursor_pos"($I11)
    ($P10) = rx292_cur."!cursor_start"()
    $P10."!cursor_pass"(rx292_pos, "")
    rx292_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("key")
    goto rxcap_306_done
  rxcap_306_fail:
    goto rx292_fail
  rxcap_306_done:
    (rx292_rep) = rx292_cur."!mark_commit"($I307)
  rxquantr297_done:
.annotate 'line', 98
  # rx pass
    rx292_cur."!cursor_pass"(rx292_pos, "metachar:sym<{*}>")
    rx292_cur."!cursor_debug"("PASS  ", "metachar:sym<{*}>", " at pos=", rx292_pos)
    .return (rx292_cur)
  rx292_fail:
.annotate 'line', 3
    (rx292_rep, rx292_pos, $I10, $P10) = rx292_cur."!mark_fail"(0)
    lt rx292_pos, -1, rx292_done
    eq rx292_pos, -1, rx292_fail
    jump $I10
  rx292_done:
    rx292_cur."!cursor_fail"()
    rx292_cur."!cursor_debug"("FAIL  ", "metachar:sym<{*}>")
    .return (rx292_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<{*}>"  :subid("84_1275599996.35368") :method
.annotate 'line', 3
    new $P294, "ResizablePMCArray"
    push $P294, "{*}"
    .return ($P294)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<assert>"  :subid("85_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx309_tgt
    .local int rx309_pos
    .local int rx309_off
    .local int rx309_eos
    .local int rx309_rep
    .local pmc rx309_cur
    (rx309_cur, rx309_pos, rx309_tgt) = self."!cursor_start"()
    rx309_cur."!cursor_debug"("START ", "metachar:sym<assert>")
    .lex unicode:"$\x{a2}", rx309_cur
    .local pmc match
    .lex "$/", match
    length rx309_eos, rx309_tgt
    gt rx309_pos, rx309_eos, rx309_done
    set rx309_off, 0
    lt rx309_pos, 2, rx309_start
    sub rx309_off, rx309_pos, 1
    substr rx309_tgt, rx309_tgt, rx309_off
  rx309_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan313_done
    goto rxscan313_scan
  rxscan313_loop:
    ($P10) = rx309_cur."from"()
    inc $P10
    set rx309_pos, $P10
    ge rx309_pos, rx309_eos, rxscan313_done
  rxscan313_scan:
    set_addr $I10, rxscan313_loop
    rx309_cur."!mark_push"(0, rx309_pos, $I10)
  rxscan313_done:
.annotate 'line', 103
  # rx literal  "<"
    add $I11, rx309_pos, 1
    gt $I11, rx309_eos, rx309_fail
    sub $I11, rx309_pos, rx309_off
    substr $S10, rx309_tgt, $I11, 1
    ne $S10, "<", rx309_fail
    add rx309_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx309_cur."!cursor_pos"(rx309_pos)
    $P10 = rx309_cur."assertion"()
    unless $P10, rx309_fail
    rx309_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx309_pos = $P10."pos"()
  alt314_0:
.annotate 'line', 104
    set_addr $I10, alt314_1
    rx309_cur."!mark_push"(0, rx309_pos, $I10)
  # rx literal  ">"
    add $I11, rx309_pos, 1
    gt $I11, rx309_eos, rx309_fail
    sub $I11, rx309_pos, rx309_off
    substr $S10, rx309_tgt, $I11, 1
    ne $S10, ">", rx309_fail
    add rx309_pos, 1
    goto alt314_end
  alt314_1:
  # rx subrule "panic" subtype=method negate=
    rx309_cur."!cursor_pos"(rx309_pos)
    $P10 = rx309_cur."panic"("regex assertion not terminated by angle bracket")
    unless $P10, rx309_fail
    rx309_pos = $P10."pos"()
  alt314_end:
.annotate 'line', 102
  # rx pass
    rx309_cur."!cursor_pass"(rx309_pos, "metachar:sym<assert>")
    rx309_cur."!cursor_debug"("PASS  ", "metachar:sym<assert>", " at pos=", rx309_pos)
    .return (rx309_cur)
  rx309_fail:
.annotate 'line', 3
    (rx309_rep, rx309_pos, $I10, $P10) = rx309_cur."!mark_fail"(0)
    lt rx309_pos, -1, rx309_done
    eq rx309_pos, -1, rx309_fail
    jump $I10
  rx309_done:
    rx309_cur."!cursor_fail"()
    rx309_cur."!cursor_debug"("FAIL  ", "metachar:sym<assert>")
    .return (rx309_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<assert>"  :subid("86_1275599996.35368") :method
.annotate 'line', 3
    $P311 = self."!PREFIX__!subrule"("assertion", "<")
    new $P312, "ResizablePMCArray"
    push $P312, $P311
    .return ($P312)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<var>"  :subid("87_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx316_tgt
    .local int rx316_pos
    .local int rx316_off
    .local int rx316_eos
    .local int rx316_rep
    .local pmc rx316_cur
    (rx316_cur, rx316_pos, rx316_tgt) = self."!cursor_start"()
    rx316_cur."!cursor_debug"("START ", "metachar:sym<var>")
    rx316_cur."!cursor_caparray"("quantified_atom")
    .lex unicode:"$\x{a2}", rx316_cur
    .local pmc match
    .lex "$/", match
    length rx316_eos, rx316_tgt
    gt rx316_pos, rx316_eos, rx316_done
    set rx316_off, 0
    lt rx316_pos, 2, rx316_start
    sub rx316_off, rx316_pos, 1
    substr rx316_tgt, rx316_tgt, rx316_off
  rx316_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan319_done
    goto rxscan319_scan
  rxscan319_loop:
    ($P10) = rx316_cur."from"()
    inc $P10
    set rx316_pos, $P10
    ge rx316_pos, rx316_eos, rxscan319_done
  rxscan319_scan:
    set_addr $I10, rxscan319_loop
    rx316_cur."!mark_push"(0, rx316_pos, $I10)
  rxscan319_done:
  alt320_0:
.annotate 'line', 108
    set_addr $I10, alt320_1
    rx316_cur."!mark_push"(0, rx316_pos, $I10)
.annotate 'line', 109
  # rx literal  "$<"
    add $I11, rx316_pos, 2
    gt $I11, rx316_eos, rx316_fail
    sub $I11, rx316_pos, rx316_off
    substr $S10, rx316_tgt, $I11, 2
    ne $S10, "$<", rx316_fail
    add rx316_pos, 2
  # rx subcapture "name"
    set_addr $I10, rxcap_323_fail
    rx316_cur."!mark_push"(0, rx316_pos, $I10)
  # rx rxquantr321 ** 1..*
    set_addr $I322, rxquantr321_done
    rx316_cur."!mark_push"(0, -1, $I322)
  rxquantr321_loop:
  # rx enumcharlist negate=1 
    ge rx316_pos, rx316_eos, rx316_fail
    sub $I10, rx316_pos, rx316_off
    substr $S10, rx316_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx316_fail
    inc rx316_pos
    (rx316_rep) = rx316_cur."!mark_commit"($I322)
    rx316_cur."!mark_push"(rx316_rep, rx316_pos, $I322)
    goto rxquantr321_loop
  rxquantr321_done:
    set_addr $I10, rxcap_323_fail
    ($I12, $I11) = rx316_cur."!mark_peek"($I10)
    rx316_cur."!cursor_pos"($I11)
    ($P10) = rx316_cur."!cursor_start"()
    $P10."!cursor_pass"(rx316_pos, "")
    rx316_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_323_done
  rxcap_323_fail:
    goto rx316_fail
  rxcap_323_done:
  # rx literal  ">"
    add $I11, rx316_pos, 1
    gt $I11, rx316_eos, rx316_fail
    sub $I11, rx316_pos, rx316_off
    substr $S10, rx316_tgt, $I11, 1
    ne $S10, ">", rx316_fail
    add rx316_pos, 1
    goto alt320_end
  alt320_1:
.annotate 'line', 110
  # rx literal  "$"
    add $I11, rx316_pos, 1
    gt $I11, rx316_eos, rx316_fail
    sub $I11, rx316_pos, rx316_off
    substr $S10, rx316_tgt, $I11, 1
    ne $S10, "$", rx316_fail
    add rx316_pos, 1
  # rx subcapture "pos"
    set_addr $I10, rxcap_324_fail
    rx316_cur."!mark_push"(0, rx316_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx316_pos, rx316_off
    find_not_cclass $I11, 8, rx316_tgt, $I10, rx316_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx316_fail
    add rx316_pos, rx316_off, $I11
    set_addr $I10, rxcap_324_fail
    ($I12, $I11) = rx316_cur."!mark_peek"($I10)
    rx316_cur."!cursor_pos"($I11)
    ($P10) = rx316_cur."!cursor_start"()
    $P10."!cursor_pass"(rx316_pos, "")
    rx316_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pos")
    goto rxcap_324_done
  rxcap_324_fail:
    goto rx316_fail
  rxcap_324_done:
  alt320_end:
.annotate 'line', 113
  # rx rxquantr325 ** 0..1
    set_addr $I326, rxquantr325_done
    rx316_cur."!mark_push"(0, rx316_pos, $I326)
  rxquantr325_loop:
  # rx subrule "ws" subtype=method negate=
    rx316_cur."!cursor_pos"(rx316_pos)
    $P10 = rx316_cur."ws"()
    unless $P10, rx316_fail
    rx316_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx316_pos, 1
    gt $I11, rx316_eos, rx316_fail
    sub $I11, rx316_pos, rx316_off
    substr $S10, rx316_tgt, $I11, 1
    ne $S10, "=", rx316_fail
    add rx316_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx316_cur."!cursor_pos"(rx316_pos)
    $P10 = rx316_cur."ws"()
    unless $P10, rx316_fail
    rx316_pos = $P10."pos"()
  # rx subrule "quantified_atom" subtype=capture negate=
    rx316_cur."!cursor_pos"(rx316_pos)
    $P10 = rx316_cur."quantified_atom"()
    unless $P10, rx316_fail
    rx316_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantified_atom")
    rx316_pos = $P10."pos"()
    (rx316_rep) = rx316_cur."!mark_commit"($I326)
  rxquantr325_done:
.annotate 'line', 107
  # rx pass
    rx316_cur."!cursor_pass"(rx316_pos, "metachar:sym<var>")
    rx316_cur."!cursor_debug"("PASS  ", "metachar:sym<var>", " at pos=", rx316_pos)
    .return (rx316_cur)
  rx316_fail:
.annotate 'line', 3
    (rx316_rep, rx316_pos, $I10, $P10) = rx316_cur."!mark_fail"(0)
    lt rx316_pos, -1, rx316_done
    eq rx316_pos, -1, rx316_fail
    jump $I10
  rx316_done:
    rx316_cur."!cursor_fail"()
    rx316_cur."!cursor_debug"("FAIL  ", "metachar:sym<var>")
    .return (rx316_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<var>"  :subid("88_1275599996.35368") :method
.annotate 'line', 3
    new $P318, "ResizablePMCArray"
    push $P318, "$"
    push $P318, "$<"
    .return ($P318)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<PIR>"  :subid("89_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx328_tgt
    .local int rx328_pos
    .local int rx328_off
    .local int rx328_eos
    .local int rx328_rep
    .local pmc rx328_cur
    (rx328_cur, rx328_pos, rx328_tgt) = self."!cursor_start"()
    rx328_cur."!cursor_debug"("START ", "metachar:sym<PIR>")
    .lex unicode:"$\x{a2}", rx328_cur
    .local pmc match
    .lex "$/", match
    length rx328_eos, rx328_tgt
    gt rx328_pos, rx328_eos, rx328_done
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
.annotate 'line', 117
  # rx literal  ":PIR{{"
    add $I11, rx328_pos, 6
    gt $I11, rx328_eos, rx328_fail
    sub $I11, rx328_pos, rx328_off
    substr $S10, rx328_tgt, $I11, 6
    ne $S10, ":PIR{{", rx328_fail
    add rx328_pos, 6
  # rx subcapture "pir"
    set_addr $I10, rxcap_334_fail
    rx328_cur."!mark_push"(0, rx328_pos, $I10)
  # rx rxquantf332 ** 0..*
    set_addr $I10, rxquantf332_loop
    rx328_cur."!mark_push"(0, rx328_pos, $I10)
    goto rxquantf332_done
  rxquantf332_loop:
  # rx charclass .
    ge rx328_pos, rx328_eos, rx328_fail
    inc rx328_pos
    set_addr $I10, rxquantf332_loop
    rx328_cur."!mark_push"($I333, rx328_pos, $I10)
  rxquantf332_done:
    set_addr $I10, rxcap_334_fail
    ($I12, $I11) = rx328_cur."!mark_peek"($I10)
    rx328_cur."!cursor_pos"($I11)
    ($P10) = rx328_cur."!cursor_start"()
    $P10."!cursor_pass"(rx328_pos, "")
    rx328_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pir")
    goto rxcap_334_done
  rxcap_334_fail:
    goto rx328_fail
  rxcap_334_done:
  # rx literal  "}}"
    add $I11, rx328_pos, 2
    gt $I11, rx328_eos, rx328_fail
    sub $I11, rx328_pos, rx328_off
    substr $S10, rx328_tgt, $I11, 2
    ne $S10, "}}", rx328_fail
    add rx328_pos, 2
.annotate 'line', 116
  # rx pass
    rx328_cur."!cursor_pass"(rx328_pos, "metachar:sym<PIR>")
    rx328_cur."!cursor_debug"("PASS  ", "metachar:sym<PIR>", " at pos=", rx328_pos)
    .return (rx328_cur)
  rx328_fail:
.annotate 'line', 3
    (rx328_rep, rx328_pos, $I10, $P10) = rx328_cur."!mark_fail"(0)
    lt rx328_pos, -1, rx328_done
    eq rx328_pos, -1, rx328_fail
    jump $I10
  rx328_done:
    rx328_cur."!cursor_fail"()
    rx328_cur."!cursor_debug"("FAIL  ", "metachar:sym<PIR>")
    .return (rx328_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<PIR>"  :subid("90_1275599996.35368") :method
.annotate 'line', 3
    new $P330, "ResizablePMCArray"
    push $P330, ":PIR{{"
    .return ($P330)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash"  :subid("91_1275599996.35368") :method
.annotate 'line', 120
    $P336 = self."!protoregex"("backslash")
    .return ($P336)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash"  :subid("92_1275599996.35368") :method
.annotate 'line', 120
    $P338 = self."!PREFIX__!protoregex"("backslash")
    .return ($P338)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<w>"  :subid("93_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx340_tgt
    .local int rx340_pos
    .local int rx340_off
    .local int rx340_eos
    .local int rx340_rep
    .local pmc rx340_cur
    (rx340_cur, rx340_pos, rx340_tgt) = self."!cursor_start"()
    rx340_cur."!cursor_debug"("START ", "backslash:sym<w>")
    .lex unicode:"$\x{a2}", rx340_cur
    .local pmc match
    .lex "$/", match
    length rx340_eos, rx340_tgt
    gt rx340_pos, rx340_eos, rx340_done
    set rx340_off, 0
    lt rx340_pos, 2, rx340_start
    sub rx340_off, rx340_pos, 1
    substr rx340_tgt, rx340_tgt, rx340_off
  rx340_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan343_done
    goto rxscan343_scan
  rxscan343_loop:
    ($P10) = rx340_cur."from"()
    inc $P10
    set rx340_pos, $P10
    ge rx340_pos, rx340_eos, rxscan343_done
  rxscan343_scan:
    set_addr $I10, rxscan343_loop
    rx340_cur."!mark_push"(0, rx340_pos, $I10)
  rxscan343_done:
.annotate 'line', 121
  # rx subcapture "sym"
    set_addr $I10, rxcap_344_fail
    rx340_cur."!mark_push"(0, rx340_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx340_pos, rx340_eos, rx340_fail
    sub $I10, rx340_pos, rx340_off
    substr $S10, rx340_tgt, $I10, 1
    index $I11, "dswnDSWN", $S10
    lt $I11, 0, rx340_fail
    inc rx340_pos
    set_addr $I10, rxcap_344_fail
    ($I12, $I11) = rx340_cur."!mark_peek"($I10)
    rx340_cur."!cursor_pos"($I11)
    ($P10) = rx340_cur."!cursor_start"()
    $P10."!cursor_pass"(rx340_pos, "")
    rx340_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_344_done
  rxcap_344_fail:
    goto rx340_fail
  rxcap_344_done:
  # rx pass
    rx340_cur."!cursor_pass"(rx340_pos, "backslash:sym<w>")
    rx340_cur."!cursor_debug"("PASS  ", "backslash:sym<w>", " at pos=", rx340_pos)
    .return (rx340_cur)
  rx340_fail:
.annotate 'line', 3
    (rx340_rep, rx340_pos, $I10, $P10) = rx340_cur."!mark_fail"(0)
    lt rx340_pos, -1, rx340_done
    eq rx340_pos, -1, rx340_fail
    jump $I10
  rx340_done:
    rx340_cur."!cursor_fail"()
    rx340_cur."!cursor_debug"("FAIL  ", "backslash:sym<w>")
    .return (rx340_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<w>"  :subid("94_1275599996.35368") :method
.annotate 'line', 3
    new $P342, "ResizablePMCArray"
    push $P342, "N"
    push $P342, "W"
    push $P342, "S"
    push $P342, "D"
    push $P342, "n"
    push $P342, "w"
    push $P342, "s"
    push $P342, "d"
    .return ($P342)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<b>"  :subid("95_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx346_tgt
    .local int rx346_pos
    .local int rx346_off
    .local int rx346_eos
    .local int rx346_rep
    .local pmc rx346_cur
    (rx346_cur, rx346_pos, rx346_tgt) = self."!cursor_start"()
    rx346_cur."!cursor_debug"("START ", "backslash:sym<b>")
    .lex unicode:"$\x{a2}", rx346_cur
    .local pmc match
    .lex "$/", match
    length rx346_eos, rx346_tgt
    gt rx346_pos, rx346_eos, rx346_done
    set rx346_off, 0
    lt rx346_pos, 2, rx346_start
    sub rx346_off, rx346_pos, 1
    substr rx346_tgt, rx346_tgt, rx346_off
  rx346_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan349_done
    goto rxscan349_scan
  rxscan349_loop:
    ($P10) = rx346_cur."from"()
    inc $P10
    set rx346_pos, $P10
    ge rx346_pos, rx346_eos, rxscan349_done
  rxscan349_scan:
    set_addr $I10, rxscan349_loop
    rx346_cur."!mark_push"(0, rx346_pos, $I10)
  rxscan349_done:
.annotate 'line', 122
  # rx subcapture "sym"
    set_addr $I10, rxcap_350_fail
    rx346_cur."!mark_push"(0, rx346_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx346_pos, rx346_eos, rx346_fail
    sub $I10, rx346_pos, rx346_off
    substr $S10, rx346_tgt, $I10, 1
    index $I11, "bB", $S10
    lt $I11, 0, rx346_fail
    inc rx346_pos
    set_addr $I10, rxcap_350_fail
    ($I12, $I11) = rx346_cur."!mark_peek"($I10)
    rx346_cur."!cursor_pos"($I11)
    ($P10) = rx346_cur."!cursor_start"()
    $P10."!cursor_pass"(rx346_pos, "")
    rx346_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_350_done
  rxcap_350_fail:
    goto rx346_fail
  rxcap_350_done:
  # rx pass
    rx346_cur."!cursor_pass"(rx346_pos, "backslash:sym<b>")
    rx346_cur."!cursor_debug"("PASS  ", "backslash:sym<b>", " at pos=", rx346_pos)
    .return (rx346_cur)
  rx346_fail:
.annotate 'line', 3
    (rx346_rep, rx346_pos, $I10, $P10) = rx346_cur."!mark_fail"(0)
    lt rx346_pos, -1, rx346_done
    eq rx346_pos, -1, rx346_fail
    jump $I10
  rx346_done:
    rx346_cur."!cursor_fail"()
    rx346_cur."!cursor_debug"("FAIL  ", "backslash:sym<b>")
    .return (rx346_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<b>"  :subid("96_1275599996.35368") :method
.annotate 'line', 3
    new $P348, "ResizablePMCArray"
    push $P348, "B"
    push $P348, "b"
    .return ($P348)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<e>"  :subid("97_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx352_tgt
    .local int rx352_pos
    .local int rx352_off
    .local int rx352_eos
    .local int rx352_rep
    .local pmc rx352_cur
    (rx352_cur, rx352_pos, rx352_tgt) = self."!cursor_start"()
    rx352_cur."!cursor_debug"("START ", "backslash:sym<e>")
    .lex unicode:"$\x{a2}", rx352_cur
    .local pmc match
    .lex "$/", match
    length rx352_eos, rx352_tgt
    gt rx352_pos, rx352_eos, rx352_done
    set rx352_off, 0
    lt rx352_pos, 2, rx352_start
    sub rx352_off, rx352_pos, 1
    substr rx352_tgt, rx352_tgt, rx352_off
  rx352_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan355_done
    goto rxscan355_scan
  rxscan355_loop:
    ($P10) = rx352_cur."from"()
    inc $P10
    set rx352_pos, $P10
    ge rx352_pos, rx352_eos, rxscan355_done
  rxscan355_scan:
    set_addr $I10, rxscan355_loop
    rx352_cur."!mark_push"(0, rx352_pos, $I10)
  rxscan355_done:
.annotate 'line', 123
  # rx subcapture "sym"
    set_addr $I10, rxcap_356_fail
    rx352_cur."!mark_push"(0, rx352_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx352_pos, rx352_eos, rx352_fail
    sub $I10, rx352_pos, rx352_off
    substr $S10, rx352_tgt, $I10, 1
    index $I11, "eE", $S10
    lt $I11, 0, rx352_fail
    inc rx352_pos
    set_addr $I10, rxcap_356_fail
    ($I12, $I11) = rx352_cur."!mark_peek"($I10)
    rx352_cur."!cursor_pos"($I11)
    ($P10) = rx352_cur."!cursor_start"()
    $P10."!cursor_pass"(rx352_pos, "")
    rx352_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_356_done
  rxcap_356_fail:
    goto rx352_fail
  rxcap_356_done:
  # rx pass
    rx352_cur."!cursor_pass"(rx352_pos, "backslash:sym<e>")
    rx352_cur."!cursor_debug"("PASS  ", "backslash:sym<e>", " at pos=", rx352_pos)
    .return (rx352_cur)
  rx352_fail:
.annotate 'line', 3
    (rx352_rep, rx352_pos, $I10, $P10) = rx352_cur."!mark_fail"(0)
    lt rx352_pos, -1, rx352_done
    eq rx352_pos, -1, rx352_fail
    jump $I10
  rx352_done:
    rx352_cur."!cursor_fail"()
    rx352_cur."!cursor_debug"("FAIL  ", "backslash:sym<e>")
    .return (rx352_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<e>"  :subid("98_1275599996.35368") :method
.annotate 'line', 3
    new $P354, "ResizablePMCArray"
    push $P354, "E"
    push $P354, "e"
    .return ($P354)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<f>"  :subid("99_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx358_tgt
    .local int rx358_pos
    .local int rx358_off
    .local int rx358_eos
    .local int rx358_rep
    .local pmc rx358_cur
    (rx358_cur, rx358_pos, rx358_tgt) = self."!cursor_start"()
    rx358_cur."!cursor_debug"("START ", "backslash:sym<f>")
    .lex unicode:"$\x{a2}", rx358_cur
    .local pmc match
    .lex "$/", match
    length rx358_eos, rx358_tgt
    gt rx358_pos, rx358_eos, rx358_done
    set rx358_off, 0
    lt rx358_pos, 2, rx358_start
    sub rx358_off, rx358_pos, 1
    substr rx358_tgt, rx358_tgt, rx358_off
  rx358_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan361_done
    goto rxscan361_scan
  rxscan361_loop:
    ($P10) = rx358_cur."from"()
    inc $P10
    set rx358_pos, $P10
    ge rx358_pos, rx358_eos, rxscan361_done
  rxscan361_scan:
    set_addr $I10, rxscan361_loop
    rx358_cur."!mark_push"(0, rx358_pos, $I10)
  rxscan361_done:
.annotate 'line', 124
  # rx subcapture "sym"
    set_addr $I10, rxcap_362_fail
    rx358_cur."!mark_push"(0, rx358_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx358_pos, rx358_eos, rx358_fail
    sub $I10, rx358_pos, rx358_off
    substr $S10, rx358_tgt, $I10, 1
    index $I11, "fF", $S10
    lt $I11, 0, rx358_fail
    inc rx358_pos
    set_addr $I10, rxcap_362_fail
    ($I12, $I11) = rx358_cur."!mark_peek"($I10)
    rx358_cur."!cursor_pos"($I11)
    ($P10) = rx358_cur."!cursor_start"()
    $P10."!cursor_pass"(rx358_pos, "")
    rx358_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_362_done
  rxcap_362_fail:
    goto rx358_fail
  rxcap_362_done:
  # rx pass
    rx358_cur."!cursor_pass"(rx358_pos, "backslash:sym<f>")
    rx358_cur."!cursor_debug"("PASS  ", "backslash:sym<f>", " at pos=", rx358_pos)
    .return (rx358_cur)
  rx358_fail:
.annotate 'line', 3
    (rx358_rep, rx358_pos, $I10, $P10) = rx358_cur."!mark_fail"(0)
    lt rx358_pos, -1, rx358_done
    eq rx358_pos, -1, rx358_fail
    jump $I10
  rx358_done:
    rx358_cur."!cursor_fail"()
    rx358_cur."!cursor_debug"("FAIL  ", "backslash:sym<f>")
    .return (rx358_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<f>"  :subid("100_1275599996.35368") :method
.annotate 'line', 3
    new $P360, "ResizablePMCArray"
    push $P360, "F"
    push $P360, "f"
    .return ($P360)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<h>"  :subid("101_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx364_tgt
    .local int rx364_pos
    .local int rx364_off
    .local int rx364_eos
    .local int rx364_rep
    .local pmc rx364_cur
    (rx364_cur, rx364_pos, rx364_tgt) = self."!cursor_start"()
    rx364_cur."!cursor_debug"("START ", "backslash:sym<h>")
    .lex unicode:"$\x{a2}", rx364_cur
    .local pmc match
    .lex "$/", match
    length rx364_eos, rx364_tgt
    gt rx364_pos, rx364_eos, rx364_done
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
.annotate 'line', 125
  # rx subcapture "sym"
    set_addr $I10, rxcap_368_fail
    rx364_cur."!mark_push"(0, rx364_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx364_pos, rx364_eos, rx364_fail
    sub $I10, rx364_pos, rx364_off
    substr $S10, rx364_tgt, $I10, 1
    index $I11, "hH", $S10
    lt $I11, 0, rx364_fail
    inc rx364_pos
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
  # rx pass
    rx364_cur."!cursor_pass"(rx364_pos, "backslash:sym<h>")
    rx364_cur."!cursor_debug"("PASS  ", "backslash:sym<h>", " at pos=", rx364_pos)
    .return (rx364_cur)
  rx364_fail:
.annotate 'line', 3
    (rx364_rep, rx364_pos, $I10, $P10) = rx364_cur."!mark_fail"(0)
    lt rx364_pos, -1, rx364_done
    eq rx364_pos, -1, rx364_fail
    jump $I10
  rx364_done:
    rx364_cur."!cursor_fail"()
    rx364_cur."!cursor_debug"("FAIL  ", "backslash:sym<h>")
    .return (rx364_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<h>"  :subid("102_1275599996.35368") :method
.annotate 'line', 3
    new $P366, "ResizablePMCArray"
    push $P366, "H"
    push $P366, "h"
    .return ($P366)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<r>"  :subid("103_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx370_tgt
    .local int rx370_pos
    .local int rx370_off
    .local int rx370_eos
    .local int rx370_rep
    .local pmc rx370_cur
    (rx370_cur, rx370_pos, rx370_tgt) = self."!cursor_start"()
    rx370_cur."!cursor_debug"("START ", "backslash:sym<r>")
    .lex unicode:"$\x{a2}", rx370_cur
    .local pmc match
    .lex "$/", match
    length rx370_eos, rx370_tgt
    gt rx370_pos, rx370_eos, rx370_done
    set rx370_off, 0
    lt rx370_pos, 2, rx370_start
    sub rx370_off, rx370_pos, 1
    substr rx370_tgt, rx370_tgt, rx370_off
  rx370_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan373_done
    goto rxscan373_scan
  rxscan373_loop:
    ($P10) = rx370_cur."from"()
    inc $P10
    set rx370_pos, $P10
    ge rx370_pos, rx370_eos, rxscan373_done
  rxscan373_scan:
    set_addr $I10, rxscan373_loop
    rx370_cur."!mark_push"(0, rx370_pos, $I10)
  rxscan373_done:
.annotate 'line', 126
  # rx subcapture "sym"
    set_addr $I10, rxcap_374_fail
    rx370_cur."!mark_push"(0, rx370_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx370_pos, rx370_eos, rx370_fail
    sub $I10, rx370_pos, rx370_off
    substr $S10, rx370_tgt, $I10, 1
    index $I11, "rR", $S10
    lt $I11, 0, rx370_fail
    inc rx370_pos
    set_addr $I10, rxcap_374_fail
    ($I12, $I11) = rx370_cur."!mark_peek"($I10)
    rx370_cur."!cursor_pos"($I11)
    ($P10) = rx370_cur."!cursor_start"()
    $P10."!cursor_pass"(rx370_pos, "")
    rx370_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_374_done
  rxcap_374_fail:
    goto rx370_fail
  rxcap_374_done:
  # rx pass
    rx370_cur."!cursor_pass"(rx370_pos, "backslash:sym<r>")
    rx370_cur."!cursor_debug"("PASS  ", "backslash:sym<r>", " at pos=", rx370_pos)
    .return (rx370_cur)
  rx370_fail:
.annotate 'line', 3
    (rx370_rep, rx370_pos, $I10, $P10) = rx370_cur."!mark_fail"(0)
    lt rx370_pos, -1, rx370_done
    eq rx370_pos, -1, rx370_fail
    jump $I10
  rx370_done:
    rx370_cur."!cursor_fail"()
    rx370_cur."!cursor_debug"("FAIL  ", "backslash:sym<r>")
    .return (rx370_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<r>"  :subid("104_1275599996.35368") :method
.annotate 'line', 3
    new $P372, "ResizablePMCArray"
    push $P372, "R"
    push $P372, "r"
    .return ($P372)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<t>"  :subid("105_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx376_tgt
    .local int rx376_pos
    .local int rx376_off
    .local int rx376_eos
    .local int rx376_rep
    .local pmc rx376_cur
    (rx376_cur, rx376_pos, rx376_tgt) = self."!cursor_start"()
    rx376_cur."!cursor_debug"("START ", "backslash:sym<t>")
    .lex unicode:"$\x{a2}", rx376_cur
    .local pmc match
    .lex "$/", match
    length rx376_eos, rx376_tgt
    gt rx376_pos, rx376_eos, rx376_done
    set rx376_off, 0
    lt rx376_pos, 2, rx376_start
    sub rx376_off, rx376_pos, 1
    substr rx376_tgt, rx376_tgt, rx376_off
  rx376_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan379_done
    goto rxscan379_scan
  rxscan379_loop:
    ($P10) = rx376_cur."from"()
    inc $P10
    set rx376_pos, $P10
    ge rx376_pos, rx376_eos, rxscan379_done
  rxscan379_scan:
    set_addr $I10, rxscan379_loop
    rx376_cur."!mark_push"(0, rx376_pos, $I10)
  rxscan379_done:
.annotate 'line', 127
  # rx subcapture "sym"
    set_addr $I10, rxcap_380_fail
    rx376_cur."!mark_push"(0, rx376_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx376_pos, rx376_eos, rx376_fail
    sub $I10, rx376_pos, rx376_off
    substr $S10, rx376_tgt, $I10, 1
    index $I11, "tT", $S10
    lt $I11, 0, rx376_fail
    inc rx376_pos
    set_addr $I10, rxcap_380_fail
    ($I12, $I11) = rx376_cur."!mark_peek"($I10)
    rx376_cur."!cursor_pos"($I11)
    ($P10) = rx376_cur."!cursor_start"()
    $P10."!cursor_pass"(rx376_pos, "")
    rx376_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_380_done
  rxcap_380_fail:
    goto rx376_fail
  rxcap_380_done:
  # rx pass
    rx376_cur."!cursor_pass"(rx376_pos, "backslash:sym<t>")
    rx376_cur."!cursor_debug"("PASS  ", "backslash:sym<t>", " at pos=", rx376_pos)
    .return (rx376_cur)
  rx376_fail:
.annotate 'line', 3
    (rx376_rep, rx376_pos, $I10, $P10) = rx376_cur."!mark_fail"(0)
    lt rx376_pos, -1, rx376_done
    eq rx376_pos, -1, rx376_fail
    jump $I10
  rx376_done:
    rx376_cur."!cursor_fail"()
    rx376_cur."!cursor_debug"("FAIL  ", "backslash:sym<t>")
    .return (rx376_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<t>"  :subid("106_1275599996.35368") :method
.annotate 'line', 3
    new $P378, "ResizablePMCArray"
    push $P378, "T"
    push $P378, "t"
    .return ($P378)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<v>"  :subid("107_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx382_tgt
    .local int rx382_pos
    .local int rx382_off
    .local int rx382_eos
    .local int rx382_rep
    .local pmc rx382_cur
    (rx382_cur, rx382_pos, rx382_tgt) = self."!cursor_start"()
    rx382_cur."!cursor_debug"("START ", "backslash:sym<v>")
    .lex unicode:"$\x{a2}", rx382_cur
    .local pmc match
    .lex "$/", match
    length rx382_eos, rx382_tgt
    gt rx382_pos, rx382_eos, rx382_done
    set rx382_off, 0
    lt rx382_pos, 2, rx382_start
    sub rx382_off, rx382_pos, 1
    substr rx382_tgt, rx382_tgt, rx382_off
  rx382_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan385_done
    goto rxscan385_scan
  rxscan385_loop:
    ($P10) = rx382_cur."from"()
    inc $P10
    set rx382_pos, $P10
    ge rx382_pos, rx382_eos, rxscan385_done
  rxscan385_scan:
    set_addr $I10, rxscan385_loop
    rx382_cur."!mark_push"(0, rx382_pos, $I10)
  rxscan385_done:
.annotate 'line', 128
  # rx subcapture "sym"
    set_addr $I10, rxcap_386_fail
    rx382_cur."!mark_push"(0, rx382_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx382_pos, rx382_eos, rx382_fail
    sub $I10, rx382_pos, rx382_off
    substr $S10, rx382_tgt, $I10, 1
    index $I11, "vV", $S10
    lt $I11, 0, rx382_fail
    inc rx382_pos
    set_addr $I10, rxcap_386_fail
    ($I12, $I11) = rx382_cur."!mark_peek"($I10)
    rx382_cur."!cursor_pos"($I11)
    ($P10) = rx382_cur."!cursor_start"()
    $P10."!cursor_pass"(rx382_pos, "")
    rx382_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_386_done
  rxcap_386_fail:
    goto rx382_fail
  rxcap_386_done:
  # rx pass
    rx382_cur."!cursor_pass"(rx382_pos, "backslash:sym<v>")
    rx382_cur."!cursor_debug"("PASS  ", "backslash:sym<v>", " at pos=", rx382_pos)
    .return (rx382_cur)
  rx382_fail:
.annotate 'line', 3
    (rx382_rep, rx382_pos, $I10, $P10) = rx382_cur."!mark_fail"(0)
    lt rx382_pos, -1, rx382_done
    eq rx382_pos, -1, rx382_fail
    jump $I10
  rx382_done:
    rx382_cur."!cursor_fail"()
    rx382_cur."!cursor_debug"("FAIL  ", "backslash:sym<v>")
    .return (rx382_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<v>"  :subid("108_1275599996.35368") :method
.annotate 'line', 3
    new $P384, "ResizablePMCArray"
    push $P384, "V"
    push $P384, "v"
    .return ($P384)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<o>"  :subid("109_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx388_tgt
    .local int rx388_pos
    .local int rx388_off
    .local int rx388_eos
    .local int rx388_rep
    .local pmc rx388_cur
    (rx388_cur, rx388_pos, rx388_tgt) = self."!cursor_start"()
    rx388_cur."!cursor_debug"("START ", "backslash:sym<o>")
    .lex unicode:"$\x{a2}", rx388_cur
    .local pmc match
    .lex "$/", match
    length rx388_eos, rx388_tgt
    gt rx388_pos, rx388_eos, rx388_done
    set rx388_off, 0
    lt rx388_pos, 2, rx388_start
    sub rx388_off, rx388_pos, 1
    substr rx388_tgt, rx388_tgt, rx388_off
  rx388_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan395_done
    goto rxscan395_scan
  rxscan395_loop:
    ($P10) = rx388_cur."from"()
    inc $P10
    set rx388_pos, $P10
    ge rx388_pos, rx388_eos, rxscan395_done
  rxscan395_scan:
    set_addr $I10, rxscan395_loop
    rx388_cur."!mark_push"(0, rx388_pos, $I10)
  rxscan395_done:
.annotate 'line', 129
  # rx subcapture "sym"
    set_addr $I10, rxcap_396_fail
    rx388_cur."!mark_push"(0, rx388_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx388_pos, rx388_eos, rx388_fail
    sub $I10, rx388_pos, rx388_off
    substr $S10, rx388_tgt, $I10, 1
    index $I11, "oO", $S10
    lt $I11, 0, rx388_fail
    inc rx388_pos
    set_addr $I10, rxcap_396_fail
    ($I12, $I11) = rx388_cur."!mark_peek"($I10)
    rx388_cur."!cursor_pos"($I11)
    ($P10) = rx388_cur."!cursor_start"()
    $P10."!cursor_pass"(rx388_pos, "")
    rx388_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_396_done
  rxcap_396_fail:
    goto rx388_fail
  rxcap_396_done:
  alt397_0:
    set_addr $I10, alt397_1
    rx388_cur."!mark_push"(0, rx388_pos, $I10)
  # rx subrule "octint" subtype=capture negate=
    rx388_cur."!cursor_pos"(rx388_pos)
    $P10 = rx388_cur."octint"()
    unless $P10, rx388_fail
    rx388_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octint")
    rx388_pos = $P10."pos"()
    goto alt397_end
  alt397_1:
  # rx literal  "["
    add $I11, rx388_pos, 1
    gt $I11, rx388_eos, rx388_fail
    sub $I11, rx388_pos, rx388_off
    substr $S10, rx388_tgt, $I11, 1
    ne $S10, "[", rx388_fail
    add rx388_pos, 1
  # rx subrule "octints" subtype=capture negate=
    rx388_cur."!cursor_pos"(rx388_pos)
    $P10 = rx388_cur."octints"()
    unless $P10, rx388_fail
    rx388_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octints")
    rx388_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx388_pos, 1
    gt $I11, rx388_eos, rx388_fail
    sub $I11, rx388_pos, rx388_off
    substr $S10, rx388_tgt, $I11, 1
    ne $S10, "]", rx388_fail
    add rx388_pos, 1
  alt397_end:
  # rx pass
    rx388_cur."!cursor_pass"(rx388_pos, "backslash:sym<o>")
    rx388_cur."!cursor_debug"("PASS  ", "backslash:sym<o>", " at pos=", rx388_pos)
    .return (rx388_cur)
  rx388_fail:
.annotate 'line', 3
    (rx388_rep, rx388_pos, $I10, $P10) = rx388_cur."!mark_fail"(0)
    lt rx388_pos, -1, rx388_done
    eq rx388_pos, -1, rx388_fail
    jump $I10
  rx388_done:
    rx388_cur."!cursor_fail"()
    rx388_cur."!cursor_debug"("FAIL  ", "backslash:sym<o>")
    .return (rx388_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<o>"  :subid("110_1275599996.35368") :method
.annotate 'line', 3
    $P390 = self."!PREFIX__!subrule"("octints", "O[")
    $P391 = self."!PREFIX__!subrule"("octint", "O")
    $P392 = self."!PREFIX__!subrule"("octints", "o[")
    $P393 = self."!PREFIX__!subrule"("octint", "o")
    new $P394, "ResizablePMCArray"
    push $P394, $P390
    push $P394, $P391
    push $P394, $P392
    push $P394, $P393
    .return ($P394)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<x>"  :subid("111_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx399_tgt
    .local int rx399_pos
    .local int rx399_off
    .local int rx399_eos
    .local int rx399_rep
    .local pmc rx399_cur
    (rx399_cur, rx399_pos, rx399_tgt) = self."!cursor_start"()
    rx399_cur."!cursor_debug"("START ", "backslash:sym<x>")
    .lex unicode:"$\x{a2}", rx399_cur
    .local pmc match
    .lex "$/", match
    length rx399_eos, rx399_tgt
    gt rx399_pos, rx399_eos, rx399_done
    set rx399_off, 0
    lt rx399_pos, 2, rx399_start
    sub rx399_off, rx399_pos, 1
    substr rx399_tgt, rx399_tgt, rx399_off
  rx399_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan406_done
    goto rxscan406_scan
  rxscan406_loop:
    ($P10) = rx399_cur."from"()
    inc $P10
    set rx399_pos, $P10
    ge rx399_pos, rx399_eos, rxscan406_done
  rxscan406_scan:
    set_addr $I10, rxscan406_loop
    rx399_cur."!mark_push"(0, rx399_pos, $I10)
  rxscan406_done:
.annotate 'line', 130
  # rx subcapture "sym"
    set_addr $I10, rxcap_407_fail
    rx399_cur."!mark_push"(0, rx399_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx399_pos, rx399_eos, rx399_fail
    sub $I10, rx399_pos, rx399_off
    substr $S10, rx399_tgt, $I10, 1
    index $I11, "xX", $S10
    lt $I11, 0, rx399_fail
    inc rx399_pos
    set_addr $I10, rxcap_407_fail
    ($I12, $I11) = rx399_cur."!mark_peek"($I10)
    rx399_cur."!cursor_pos"($I11)
    ($P10) = rx399_cur."!cursor_start"()
    $P10."!cursor_pass"(rx399_pos, "")
    rx399_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_407_done
  rxcap_407_fail:
    goto rx399_fail
  rxcap_407_done:
  alt408_0:
    set_addr $I10, alt408_1
    rx399_cur."!mark_push"(0, rx399_pos, $I10)
  # rx subrule "hexint" subtype=capture negate=
    rx399_cur."!cursor_pos"(rx399_pos)
    $P10 = rx399_cur."hexint"()
    unless $P10, rx399_fail
    rx399_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexint")
    rx399_pos = $P10."pos"()
    goto alt408_end
  alt408_1:
  # rx literal  "["
    add $I11, rx399_pos, 1
    gt $I11, rx399_eos, rx399_fail
    sub $I11, rx399_pos, rx399_off
    substr $S10, rx399_tgt, $I11, 1
    ne $S10, "[", rx399_fail
    add rx399_pos, 1
  # rx subrule "hexints" subtype=capture negate=
    rx399_cur."!cursor_pos"(rx399_pos)
    $P10 = rx399_cur."hexints"()
    unless $P10, rx399_fail
    rx399_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexints")
    rx399_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx399_pos, 1
    gt $I11, rx399_eos, rx399_fail
    sub $I11, rx399_pos, rx399_off
    substr $S10, rx399_tgt, $I11, 1
    ne $S10, "]", rx399_fail
    add rx399_pos, 1
  alt408_end:
  # rx pass
    rx399_cur."!cursor_pass"(rx399_pos, "backslash:sym<x>")
    rx399_cur."!cursor_debug"("PASS  ", "backslash:sym<x>", " at pos=", rx399_pos)
    .return (rx399_cur)
  rx399_fail:
.annotate 'line', 3
    (rx399_rep, rx399_pos, $I10, $P10) = rx399_cur."!mark_fail"(0)
    lt rx399_pos, -1, rx399_done
    eq rx399_pos, -1, rx399_fail
    jump $I10
  rx399_done:
    rx399_cur."!cursor_fail"()
    rx399_cur."!cursor_debug"("FAIL  ", "backslash:sym<x>")
    .return (rx399_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<x>"  :subid("112_1275599996.35368") :method
.annotate 'line', 3
    $P401 = self."!PREFIX__!subrule"("hexints", "X[")
    $P402 = self."!PREFIX__!subrule"("hexint", "X")
    $P403 = self."!PREFIX__!subrule"("hexints", "x[")
    $P404 = self."!PREFIX__!subrule"("hexint", "x")
    new $P405, "ResizablePMCArray"
    push $P405, $P401
    push $P405, $P402
    push $P405, $P403
    push $P405, $P404
    .return ($P405)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<c>"  :subid("113_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx410_tgt
    .local int rx410_pos
    .local int rx410_off
    .local int rx410_eos
    .local int rx410_rep
    .local pmc rx410_cur
    (rx410_cur, rx410_pos, rx410_tgt) = self."!cursor_start"()
    rx410_cur."!cursor_debug"("START ", "backslash:sym<c>")
    .lex unicode:"$\x{a2}", rx410_cur
    .local pmc match
    .lex "$/", match
    length rx410_eos, rx410_tgt
    gt rx410_pos, rx410_eos, rx410_done
    set rx410_off, 0
    lt rx410_pos, 2, rx410_start
    sub rx410_off, rx410_pos, 1
    substr rx410_tgt, rx410_tgt, rx410_off
  rx410_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan415_done
    goto rxscan415_scan
  rxscan415_loop:
    ($P10) = rx410_cur."from"()
    inc $P10
    set rx410_pos, $P10
    ge rx410_pos, rx410_eos, rxscan415_done
  rxscan415_scan:
    set_addr $I10, rxscan415_loop
    rx410_cur."!mark_push"(0, rx410_pos, $I10)
  rxscan415_done:
.annotate 'line', 131
  # rx subcapture "sym"
    set_addr $I10, rxcap_416_fail
    rx410_cur."!mark_push"(0, rx410_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx410_pos, rx410_eos, rx410_fail
    sub $I10, rx410_pos, rx410_off
    substr $S10, rx410_tgt, $I10, 1
    index $I11, "cC", $S10
    lt $I11, 0, rx410_fail
    inc rx410_pos
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
  # rx subrule "charspec" subtype=capture negate=
    rx410_cur."!cursor_pos"(rx410_pos)
    $P10 = rx410_cur."charspec"()
    unless $P10, rx410_fail
    rx410_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charspec")
    rx410_pos = $P10."pos"()
  # rx pass
    rx410_cur."!cursor_pass"(rx410_pos, "backslash:sym<c>")
    rx410_cur."!cursor_debug"("PASS  ", "backslash:sym<c>", " at pos=", rx410_pos)
    .return (rx410_cur)
  rx410_fail:
.annotate 'line', 3
    (rx410_rep, rx410_pos, $I10, $P10) = rx410_cur."!mark_fail"(0)
    lt rx410_pos, -1, rx410_done
    eq rx410_pos, -1, rx410_fail
    jump $I10
  rx410_done:
    rx410_cur."!cursor_fail"()
    rx410_cur."!cursor_debug"("FAIL  ", "backslash:sym<c>")
    .return (rx410_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<c>"  :subid("114_1275599996.35368") :method
.annotate 'line', 3
    $P412 = self."!PREFIX__!subrule"("charspec", "C")
    $P413 = self."!PREFIX__!subrule"("charspec", "c")
    new $P414, "ResizablePMCArray"
    push $P414, $P412
    push $P414, $P413
    .return ($P414)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<A>"  :subid("115_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx418_tgt
    .local int rx418_pos
    .local int rx418_off
    .local int rx418_eos
    .local int rx418_rep
    .local pmc rx418_cur
    (rx418_cur, rx418_pos, rx418_tgt) = self."!cursor_start"()
    rx418_cur."!cursor_debug"("START ", "backslash:sym<A>")
    .lex unicode:"$\x{a2}", rx418_cur
    .local pmc match
    .lex "$/", match
    length rx418_eos, rx418_tgt
    gt rx418_pos, rx418_eos, rx418_done
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
.annotate 'line', 132
  # rx literal  "A"
    add $I11, rx418_pos, 1
    gt $I11, rx418_eos, rx418_fail
    sub $I11, rx418_pos, rx418_off
    substr $S10, rx418_tgt, $I11, 1
    ne $S10, "A", rx418_fail
    add rx418_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx418_cur."!cursor_pos"(rx418_pos)
    $P10 = rx418_cur."obs"("\\A as beginning-of-string matcher", "^")
    unless $P10, rx418_fail
    rx418_pos = $P10."pos"()
  # rx pass
    rx418_cur."!cursor_pass"(rx418_pos, "backslash:sym<A>")
    rx418_cur."!cursor_debug"("PASS  ", "backslash:sym<A>", " at pos=", rx418_pos)
    .return (rx418_cur)
  rx418_fail:
.annotate 'line', 3
    (rx418_rep, rx418_pos, $I10, $P10) = rx418_cur."!mark_fail"(0)
    lt rx418_pos, -1, rx418_done
    eq rx418_pos, -1, rx418_fail
    jump $I10
  rx418_done:
    rx418_cur."!cursor_fail"()
    rx418_cur."!cursor_debug"("FAIL  ", "backslash:sym<A>")
    .return (rx418_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<A>"  :subid("116_1275599996.35368") :method
.annotate 'line', 3
    $P420 = self."!PREFIX__!subrule"("", "A")
    new $P421, "ResizablePMCArray"
    push $P421, $P420
    .return ($P421)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<z>"  :subid("117_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx424_tgt
    .local int rx424_pos
    .local int rx424_off
    .local int rx424_eos
    .local int rx424_rep
    .local pmc rx424_cur
    (rx424_cur, rx424_pos, rx424_tgt) = self."!cursor_start"()
    rx424_cur."!cursor_debug"("START ", "backslash:sym<z>")
    .lex unicode:"$\x{a2}", rx424_cur
    .local pmc match
    .lex "$/", match
    length rx424_eos, rx424_tgt
    gt rx424_pos, rx424_eos, rx424_done
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
.annotate 'line', 133
  # rx literal  "z"
    add $I11, rx424_pos, 1
    gt $I11, rx424_eos, rx424_fail
    sub $I11, rx424_pos, rx424_off
    substr $S10, rx424_tgt, $I11, 1
    ne $S10, "z", rx424_fail
    add rx424_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx424_cur."!cursor_pos"(rx424_pos)
    $P10 = rx424_cur."obs"("\\z as end-of-string matcher", "$")
    unless $P10, rx424_fail
    rx424_pos = $P10."pos"()
  # rx pass
    rx424_cur."!cursor_pass"(rx424_pos, "backslash:sym<z>")
    rx424_cur."!cursor_debug"("PASS  ", "backslash:sym<z>", " at pos=", rx424_pos)
    .return (rx424_cur)
  rx424_fail:
.annotate 'line', 3
    (rx424_rep, rx424_pos, $I10, $P10) = rx424_cur."!mark_fail"(0)
    lt rx424_pos, -1, rx424_done
    eq rx424_pos, -1, rx424_fail
    jump $I10
  rx424_done:
    rx424_cur."!cursor_fail"()
    rx424_cur."!cursor_debug"("FAIL  ", "backslash:sym<z>")
    .return (rx424_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<z>"  :subid("118_1275599996.35368") :method
.annotate 'line', 3
    $P426 = self."!PREFIX__!subrule"("", "z")
    new $P427, "ResizablePMCArray"
    push $P427, $P426
    .return ($P427)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Z>"  :subid("119_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx430_tgt
    .local int rx430_pos
    .local int rx430_off
    .local int rx430_eos
    .local int rx430_rep
    .local pmc rx430_cur
    (rx430_cur, rx430_pos, rx430_tgt) = self."!cursor_start"()
    rx430_cur."!cursor_debug"("START ", "backslash:sym<Z>")
    .lex unicode:"$\x{a2}", rx430_cur
    .local pmc match
    .lex "$/", match
    length rx430_eos, rx430_tgt
    gt rx430_pos, rx430_eos, rx430_done
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
.annotate 'line', 134
  # rx literal  "Z"
    add $I11, rx430_pos, 1
    gt $I11, rx430_eos, rx430_fail
    sub $I11, rx430_pos, rx430_off
    substr $S10, rx430_tgt, $I11, 1
    ne $S10, "Z", rx430_fail
    add rx430_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx430_cur."!cursor_pos"(rx430_pos)
    $P10 = rx430_cur."obs"("\\Z as end-of-string matcher", "\\n?$")
    unless $P10, rx430_fail
    rx430_pos = $P10."pos"()
  # rx pass
    rx430_cur."!cursor_pass"(rx430_pos, "backslash:sym<Z>")
    rx430_cur."!cursor_debug"("PASS  ", "backslash:sym<Z>", " at pos=", rx430_pos)
    .return (rx430_cur)
  rx430_fail:
.annotate 'line', 3
    (rx430_rep, rx430_pos, $I10, $P10) = rx430_cur."!mark_fail"(0)
    lt rx430_pos, -1, rx430_done
    eq rx430_pos, -1, rx430_fail
    jump $I10
  rx430_done:
    rx430_cur."!cursor_fail"()
    rx430_cur."!cursor_debug"("FAIL  ", "backslash:sym<Z>")
    .return (rx430_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<Z>"  :subid("120_1275599996.35368") :method
.annotate 'line', 3
    $P432 = self."!PREFIX__!subrule"("", "Z")
    new $P433, "ResizablePMCArray"
    push $P433, $P432
    .return ($P433)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Q>"  :subid("121_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx436_tgt
    .local int rx436_pos
    .local int rx436_off
    .local int rx436_eos
    .local int rx436_rep
    .local pmc rx436_cur
    (rx436_cur, rx436_pos, rx436_tgt) = self."!cursor_start"()
    rx436_cur."!cursor_debug"("START ", "backslash:sym<Q>")
    .lex unicode:"$\x{a2}", rx436_cur
    .local pmc match
    .lex "$/", match
    length rx436_eos, rx436_tgt
    gt rx436_pos, rx436_eos, rx436_done
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
.annotate 'line', 135
  # rx literal  "Q"
    add $I11, rx436_pos, 1
    gt $I11, rx436_eos, rx436_fail
    sub $I11, rx436_pos, rx436_off
    substr $S10, rx436_tgt, $I11, 1
    ne $S10, "Q", rx436_fail
    add rx436_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx436_cur."!cursor_pos"(rx436_pos)
    $P10 = rx436_cur."obs"("\\Q as quotemeta", "quotes or literal variable match")
    unless $P10, rx436_fail
    rx436_pos = $P10."pos"()
  # rx pass
    rx436_cur."!cursor_pass"(rx436_pos, "backslash:sym<Q>")
    rx436_cur."!cursor_debug"("PASS  ", "backslash:sym<Q>", " at pos=", rx436_pos)
    .return (rx436_cur)
  rx436_fail:
.annotate 'line', 3
    (rx436_rep, rx436_pos, $I10, $P10) = rx436_cur."!mark_fail"(0)
    lt rx436_pos, -1, rx436_done
    eq rx436_pos, -1, rx436_fail
    jump $I10
  rx436_done:
    rx436_cur."!cursor_fail"()
    rx436_cur."!cursor_debug"("FAIL  ", "backslash:sym<Q>")
    .return (rx436_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<Q>"  :subid("122_1275599996.35368") :method
.annotate 'line', 3
    $P438 = self."!PREFIX__!subrule"("", "Q")
    new $P439, "ResizablePMCArray"
    push $P439, $P438
    .return ($P439)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<misc>"  :subid("123_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx442_tgt
    .local int rx442_pos
    .local int rx442_off
    .local int rx442_eos
    .local int rx442_rep
    .local pmc rx442_cur
    (rx442_cur, rx442_pos, rx442_tgt) = self."!cursor_start"()
    rx442_cur."!cursor_debug"("START ", "backslash:sym<misc>")
    .lex unicode:"$\x{a2}", rx442_cur
    .local pmc match
    .lex "$/", match
    length rx442_eos, rx442_tgt
    gt rx442_pos, rx442_eos, rx442_done
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
.annotate 'line', 136
  # rx charclass W
    ge rx442_pos, rx442_eos, rx442_fail
    sub $I10, rx442_pos, rx442_off
    is_cclass $I11, 8192, rx442_tgt, $I10
    if $I11, rx442_fail
    inc rx442_pos
  # rx pass
    rx442_cur."!cursor_pass"(rx442_pos, "backslash:sym<misc>")
    rx442_cur."!cursor_debug"("PASS  ", "backslash:sym<misc>", " at pos=", rx442_pos)
    .return (rx442_cur)
  rx442_fail:
.annotate 'line', 3
    (rx442_rep, rx442_pos, $I10, $P10) = rx442_cur."!mark_fail"(0)
    lt rx442_pos, -1, rx442_done
    eq rx442_pos, -1, rx442_fail
    jump $I10
  rx442_done:
    rx442_cur."!cursor_fail"()
    rx442_cur."!cursor_debug"("FAIL  ", "backslash:sym<misc>")
    .return (rx442_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<misc>"  :subid("124_1275599996.35368") :method
.annotate 'line', 3
    new $P444, "ResizablePMCArray"
    push $P444, ""
    .return ($P444)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion"  :subid("125_1275599996.35368") :method
.annotate 'line', 138
    $P447 = self."!protoregex"("assertion")
    .return ($P447)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion"  :subid("126_1275599996.35368") :method
.annotate 'line', 138
    $P449 = self."!PREFIX__!protoregex"("assertion")
    .return ($P449)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<?>"  :subid("127_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .const 'Sub' $P458 = "129_1275599996.35368" 
    capture_lex $P458
    .local string rx451_tgt
    .local int rx451_pos
    .local int rx451_off
    .local int rx451_eos
    .local int rx451_rep
    .local pmc rx451_cur
    (rx451_cur, rx451_pos, rx451_tgt) = self."!cursor_start"()
    rx451_cur."!cursor_debug"("START ", "assertion:sym<?>")
    .lex unicode:"$\x{a2}", rx451_cur
    .local pmc match
    .lex "$/", match
    length rx451_eos, rx451_tgt
    gt rx451_pos, rx451_eos, rx451_done
    set rx451_off, 0
    lt rx451_pos, 2, rx451_start
    sub rx451_off, rx451_pos, 1
    substr rx451_tgt, rx451_tgt, rx451_off
  rx451_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan455_done
    goto rxscan455_scan
  rxscan455_loop:
    ($P10) = rx451_cur."from"()
    inc $P10
    set rx451_pos, $P10
    ge rx451_pos, rx451_eos, rxscan455_done
  rxscan455_scan:
    set_addr $I10, rxscan455_loop
    rx451_cur."!mark_push"(0, rx451_pos, $I10)
  rxscan455_done:
.annotate 'line', 140
  # rx literal  "?"
    add $I11, rx451_pos, 1
    gt $I11, rx451_eos, rx451_fail
    sub $I11, rx451_pos, rx451_off
    substr $S10, rx451_tgt, $I11, 1
    ne $S10, "?", rx451_fail
    add rx451_pos, 1
  alt456_0:
    set_addr $I10, alt456_1
    rx451_cur."!mark_push"(0, rx451_pos, $I10)
  # rx subrule "before" subtype=zerowidth negate=
    rx451_cur."!cursor_pos"(rx451_pos)
    .const 'Sub' $P458 = "129_1275599996.35368" 
    capture_lex $P458
    $P10 = rx451_cur."before"($P458)
    unless $P10, rx451_fail
    goto alt456_end
  alt456_1:
  # rx subrule "assertion" subtype=capture negate=
    rx451_cur."!cursor_pos"(rx451_pos)
    $P10 = rx451_cur."assertion"()
    unless $P10, rx451_fail
    rx451_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx451_pos = $P10."pos"()
  alt456_end:
  # rx pass
    rx451_cur."!cursor_pass"(rx451_pos, "assertion:sym<?>")
    rx451_cur."!cursor_debug"("PASS  ", "assertion:sym<?>", " at pos=", rx451_pos)
    .return (rx451_cur)
  rx451_fail:
.annotate 'line', 3
    (rx451_rep, rx451_pos, $I10, $P10) = rx451_cur."!mark_fail"(0)
    lt rx451_pos, -1, rx451_done
    eq rx451_pos, -1, rx451_fail
    jump $I10
  rx451_done:
    rx451_cur."!cursor_fail"()
    rx451_cur."!cursor_debug"("FAIL  ", "assertion:sym<?>")
    .return (rx451_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<?>"  :subid("128_1275599996.35368") :method
.annotate 'line', 3
    $P453 = self."!PREFIX__!subrule"("assertion", "?")
    new $P454, "ResizablePMCArray"
    push $P454, $P453
    push $P454, "?"
    .return ($P454)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block457"  :anon :subid("129_1275599996.35368") :method :outer("127_1275599996.35368")
.annotate 'line', 140
    .local string rx459_tgt
    .local int rx459_pos
    .local int rx459_off
    .local int rx459_eos
    .local int rx459_rep
    .local pmc rx459_cur
    (rx459_cur, rx459_pos, rx459_tgt) = self."!cursor_start"()
    rx459_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx459_cur
    .local pmc match
    .lex "$/", match
    length rx459_eos, rx459_tgt
    gt rx459_pos, rx459_eos, rx459_done
    set rx459_off, 0
    lt rx459_pos, 2, rx459_start
    sub rx459_off, rx459_pos, 1
    substr rx459_tgt, rx459_tgt, rx459_off
  rx459_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan460_done
    goto rxscan460_scan
  rxscan460_loop:
    ($P10) = rx459_cur."from"()
    inc $P10
    set rx459_pos, $P10
    ge rx459_pos, rx459_eos, rxscan460_done
  rxscan460_scan:
    set_addr $I10, rxscan460_loop
    rx459_cur."!mark_push"(0, rx459_pos, $I10)
  rxscan460_done:
  # rx literal  ">"
    add $I11, rx459_pos, 1
    gt $I11, rx459_eos, rx459_fail
    sub $I11, rx459_pos, rx459_off
    substr $S10, rx459_tgt, $I11, 1
    ne $S10, ">", rx459_fail
    add rx459_pos, 1
  # rx pass
    rx459_cur."!cursor_pass"(rx459_pos, "")
    rx459_cur."!cursor_debug"("PASS  ", "", " at pos=", rx459_pos)
    .return (rx459_cur)
  rx459_fail:
    (rx459_rep, rx459_pos, $I10, $P10) = rx459_cur."!mark_fail"(0)
    lt rx459_pos, -1, rx459_done
    eq rx459_pos, -1, rx459_fail
    jump $I10
  rx459_done:
    rx459_cur."!cursor_fail"()
    rx459_cur."!cursor_debug"("FAIL  ", "")
    .return (rx459_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<!>"  :subid("130_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .const 'Sub' $P469 = "132_1275599996.35368" 
    capture_lex $P469
    .local string rx462_tgt
    .local int rx462_pos
    .local int rx462_off
    .local int rx462_eos
    .local int rx462_rep
    .local pmc rx462_cur
    (rx462_cur, rx462_pos, rx462_tgt) = self."!cursor_start"()
    rx462_cur."!cursor_debug"("START ", "assertion:sym<!>")
    .lex unicode:"$\x{a2}", rx462_cur
    .local pmc match
    .lex "$/", match
    length rx462_eos, rx462_tgt
    gt rx462_pos, rx462_eos, rx462_done
    set rx462_off, 0
    lt rx462_pos, 2, rx462_start
    sub rx462_off, rx462_pos, 1
    substr rx462_tgt, rx462_tgt, rx462_off
  rx462_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan466_done
    goto rxscan466_scan
  rxscan466_loop:
    ($P10) = rx462_cur."from"()
    inc $P10
    set rx462_pos, $P10
    ge rx462_pos, rx462_eos, rxscan466_done
  rxscan466_scan:
    set_addr $I10, rxscan466_loop
    rx462_cur."!mark_push"(0, rx462_pos, $I10)
  rxscan466_done:
.annotate 'line', 141
  # rx literal  "!"
    add $I11, rx462_pos, 1
    gt $I11, rx462_eos, rx462_fail
    sub $I11, rx462_pos, rx462_off
    substr $S10, rx462_tgt, $I11, 1
    ne $S10, "!", rx462_fail
    add rx462_pos, 1
  alt467_0:
    set_addr $I10, alt467_1
    rx462_cur."!mark_push"(0, rx462_pos, $I10)
  # rx subrule "before" subtype=zerowidth negate=
    rx462_cur."!cursor_pos"(rx462_pos)
    .const 'Sub' $P469 = "132_1275599996.35368" 
    capture_lex $P469
    $P10 = rx462_cur."before"($P469)
    unless $P10, rx462_fail
    goto alt467_end
  alt467_1:
  # rx subrule "assertion" subtype=capture negate=
    rx462_cur."!cursor_pos"(rx462_pos)
    $P10 = rx462_cur."assertion"()
    unless $P10, rx462_fail
    rx462_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx462_pos = $P10."pos"()
  alt467_end:
  # rx pass
    rx462_cur."!cursor_pass"(rx462_pos, "assertion:sym<!>")
    rx462_cur."!cursor_debug"("PASS  ", "assertion:sym<!>", " at pos=", rx462_pos)
    .return (rx462_cur)
  rx462_fail:
.annotate 'line', 3
    (rx462_rep, rx462_pos, $I10, $P10) = rx462_cur."!mark_fail"(0)
    lt rx462_pos, -1, rx462_done
    eq rx462_pos, -1, rx462_fail
    jump $I10
  rx462_done:
    rx462_cur."!cursor_fail"()
    rx462_cur."!cursor_debug"("FAIL  ", "assertion:sym<!>")
    .return (rx462_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<!>"  :subid("131_1275599996.35368") :method
.annotate 'line', 3
    $P464 = self."!PREFIX__!subrule"("assertion", "!")
    new $P465, "ResizablePMCArray"
    push $P465, $P464
    push $P465, "!"
    .return ($P465)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block468"  :anon :subid("132_1275599996.35368") :method :outer("130_1275599996.35368")
.annotate 'line', 141
    .local string rx470_tgt
    .local int rx470_pos
    .local int rx470_off
    .local int rx470_eos
    .local int rx470_rep
    .local pmc rx470_cur
    (rx470_cur, rx470_pos, rx470_tgt) = self."!cursor_start"()
    rx470_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx470_cur
    .local pmc match
    .lex "$/", match
    length rx470_eos, rx470_tgt
    gt rx470_pos, rx470_eos, rx470_done
    set rx470_off, 0
    lt rx470_pos, 2, rx470_start
    sub rx470_off, rx470_pos, 1
    substr rx470_tgt, rx470_tgt, rx470_off
  rx470_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan471_done
    goto rxscan471_scan
  rxscan471_loop:
    ($P10) = rx470_cur."from"()
    inc $P10
    set rx470_pos, $P10
    ge rx470_pos, rx470_eos, rxscan471_done
  rxscan471_scan:
    set_addr $I10, rxscan471_loop
    rx470_cur."!mark_push"(0, rx470_pos, $I10)
  rxscan471_done:
  # rx literal  ">"
    add $I11, rx470_pos, 1
    gt $I11, rx470_eos, rx470_fail
    sub $I11, rx470_pos, rx470_off
    substr $S10, rx470_tgt, $I11, 1
    ne $S10, ">", rx470_fail
    add rx470_pos, 1
  # rx pass
    rx470_cur."!cursor_pass"(rx470_pos, "")
    rx470_cur."!cursor_debug"("PASS  ", "", " at pos=", rx470_pos)
    .return (rx470_cur)
  rx470_fail:
    (rx470_rep, rx470_pos, $I10, $P10) = rx470_cur."!mark_fail"(0)
    lt rx470_pos, -1, rx470_done
    eq rx470_pos, -1, rx470_fail
    jump $I10
  rx470_done:
    rx470_cur."!cursor_fail"()
    rx470_cur."!cursor_debug"("FAIL  ", "")
    .return (rx470_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<method>"  :subid("133_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx473_tgt
    .local int rx473_pos
    .local int rx473_off
    .local int rx473_eos
    .local int rx473_rep
    .local pmc rx473_cur
    (rx473_cur, rx473_pos, rx473_tgt) = self."!cursor_start"()
    rx473_cur."!cursor_debug"("START ", "assertion:sym<method>")
    .lex unicode:"$\x{a2}", rx473_cur
    .local pmc match
    .lex "$/", match
    length rx473_eos, rx473_tgt
    gt rx473_pos, rx473_eos, rx473_done
    set rx473_off, 0
    lt rx473_pos, 2, rx473_start
    sub rx473_off, rx473_pos, 1
    substr rx473_tgt, rx473_tgt, rx473_off
  rx473_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan477_done
    goto rxscan477_scan
  rxscan477_loop:
    ($P10) = rx473_cur."from"()
    inc $P10
    set rx473_pos, $P10
    ge rx473_pos, rx473_eos, rxscan477_done
  rxscan477_scan:
    set_addr $I10, rxscan477_loop
    rx473_cur."!mark_push"(0, rx473_pos, $I10)
  rxscan477_done:
.annotate 'line', 144
  # rx literal  "."
    add $I11, rx473_pos, 1
    gt $I11, rx473_eos, rx473_fail
    sub $I11, rx473_pos, rx473_off
    substr $S10, rx473_tgt, $I11, 1
    ne $S10, ".", rx473_fail
    add rx473_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx473_cur."!cursor_pos"(rx473_pos)
    $P10 = rx473_cur."assertion"()
    unless $P10, rx473_fail
    rx473_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx473_pos = $P10."pos"()
.annotate 'line', 143
  # rx pass
    rx473_cur."!cursor_pass"(rx473_pos, "assertion:sym<method>")
    rx473_cur."!cursor_debug"("PASS  ", "assertion:sym<method>", " at pos=", rx473_pos)
    .return (rx473_cur)
  rx473_fail:
.annotate 'line', 3
    (rx473_rep, rx473_pos, $I10, $P10) = rx473_cur."!mark_fail"(0)
    lt rx473_pos, -1, rx473_done
    eq rx473_pos, -1, rx473_fail
    jump $I10
  rx473_done:
    rx473_cur."!cursor_fail"()
    rx473_cur."!cursor_debug"("FAIL  ", "assertion:sym<method>")
    .return (rx473_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<method>"  :subid("134_1275599996.35368") :method
.annotate 'line', 3
    $P475 = self."!PREFIX__!subrule"("assertion", ".")
    new $P476, "ResizablePMCArray"
    push $P476, $P475
    .return ($P476)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<name>"  :subid("135_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .const 'Sub' $P487 = "137_1275599996.35368" 
    capture_lex $P487
    .local string rx479_tgt
    .local int rx479_pos
    .local int rx479_off
    .local int rx479_eos
    .local int rx479_rep
    .local pmc rx479_cur
    (rx479_cur, rx479_pos, rx479_tgt) = self."!cursor_start"()
    rx479_cur."!cursor_debug"("START ", "assertion:sym<name>")
    rx479_cur."!cursor_caparray"("arglist", "nibbler", "assertion")
    .lex unicode:"$\x{a2}", rx479_cur
    .local pmc match
    .lex "$/", match
    length rx479_eos, rx479_tgt
    gt rx479_pos, rx479_eos, rx479_done
    set rx479_off, 0
    lt rx479_pos, 2, rx479_start
    sub rx479_off, rx479_pos, 1
    substr rx479_tgt, rx479_tgt, rx479_off
  rx479_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan482_done
    goto rxscan482_scan
  rxscan482_loop:
    ($P10) = rx479_cur."from"()
    inc $P10
    set rx479_pos, $P10
    ge rx479_pos, rx479_eos, rxscan482_done
  rxscan482_scan:
    set_addr $I10, rxscan482_loop
    rx479_cur."!mark_push"(0, rx479_pos, $I10)
  rxscan482_done:
.annotate 'line', 148
  # rx subcapture "longname"
    set_addr $I10, rxcap_483_fail
    rx479_cur."!mark_push"(0, rx479_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx479_pos, rx479_off
    find_not_cclass $I11, 8192, rx479_tgt, $I10, rx479_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx479_fail
    add rx479_pos, rx479_off, $I11
    set_addr $I10, rxcap_483_fail
    ($I12, $I11) = rx479_cur."!mark_peek"($I10)
    rx479_cur."!cursor_pos"($I11)
    ($P10) = rx479_cur."!cursor_start"()
    $P10."!cursor_pass"(rx479_pos, "")
    rx479_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    goto rxcap_483_done
  rxcap_483_fail:
    goto rx479_fail
  rxcap_483_done:
.annotate 'line', 155
  # rx rxquantr484 ** 0..1
    set_addr $I490, rxquantr484_done
    rx479_cur."!mark_push"(0, rx479_pos, $I490)
  rxquantr484_loop:
  alt485_0:
.annotate 'line', 149
    set_addr $I10, alt485_1
    rx479_cur."!mark_push"(0, rx479_pos, $I10)
.annotate 'line', 150
  # rx subrule "before" subtype=zerowidth negate=
    rx479_cur."!cursor_pos"(rx479_pos)
    .const 'Sub' $P487 = "137_1275599996.35368" 
    capture_lex $P487
    $P10 = rx479_cur."before"($P487)
    unless $P10, rx479_fail
    goto alt485_end
  alt485_1:
    set_addr $I10, alt485_2
    rx479_cur."!mark_push"(0, rx479_pos, $I10)
.annotate 'line', 151
  # rx literal  "="
    add $I11, rx479_pos, 1
    gt $I11, rx479_eos, rx479_fail
    sub $I11, rx479_pos, rx479_off
    substr $S10, rx479_tgt, $I11, 1
    ne $S10, "=", rx479_fail
    add rx479_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx479_cur."!cursor_pos"(rx479_pos)
    $P10 = rx479_cur."assertion"()
    unless $P10, rx479_fail
    rx479_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx479_pos = $P10."pos"()
    goto alt485_end
  alt485_2:
    set_addr $I10, alt485_3
    rx479_cur."!mark_push"(0, rx479_pos, $I10)
.annotate 'line', 152
  # rx literal  ":"
    add $I11, rx479_pos, 1
    gt $I11, rx479_eos, rx479_fail
    sub $I11, rx479_pos, rx479_off
    substr $S10, rx479_tgt, $I11, 1
    ne $S10, ":", rx479_fail
    add rx479_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx479_cur."!cursor_pos"(rx479_pos)
    $P10 = rx479_cur."arglist"()
    unless $P10, rx479_fail
    rx479_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx479_pos = $P10."pos"()
    goto alt485_end
  alt485_3:
    set_addr $I10, alt485_4
    rx479_cur."!mark_push"(0, rx479_pos, $I10)
.annotate 'line', 153
  # rx literal  "("
    add $I11, rx479_pos, 1
    gt $I11, rx479_eos, rx479_fail
    sub $I11, rx479_pos, rx479_off
    substr $S10, rx479_tgt, $I11, 1
    ne $S10, "(", rx479_fail
    add rx479_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx479_cur."!cursor_pos"(rx479_pos)
    $P10 = rx479_cur."arglist"()
    unless $P10, rx479_fail
    rx479_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx479_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx479_pos, 1
    gt $I11, rx479_eos, rx479_fail
    sub $I11, rx479_pos, rx479_off
    substr $S10, rx479_tgt, $I11, 1
    ne $S10, ")", rx479_fail
    add rx479_pos, 1
    goto alt485_end
  alt485_4:
.annotate 'line', 154
  # rx subrule "normspace" subtype=method negate=
    rx479_cur."!cursor_pos"(rx479_pos)
    $P10 = rx479_cur."normspace"()
    unless $P10, rx479_fail
    rx479_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx479_cur."!cursor_pos"(rx479_pos)
    $P10 = rx479_cur."nibbler"()
    unless $P10, rx479_fail
    rx479_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx479_pos = $P10."pos"()
  alt485_end:
.annotate 'line', 155
    (rx479_rep) = rx479_cur."!mark_commit"($I490)
  rxquantr484_done:
.annotate 'line', 147
  # rx pass
    rx479_cur."!cursor_pass"(rx479_pos, "assertion:sym<name>")
    rx479_cur."!cursor_debug"("PASS  ", "assertion:sym<name>", " at pos=", rx479_pos)
    .return (rx479_cur)
  rx479_fail:
.annotate 'line', 3
    (rx479_rep, rx479_pos, $I10, $P10) = rx479_cur."!mark_fail"(0)
    lt rx479_pos, -1, rx479_done
    eq rx479_pos, -1, rx479_fail
    jump $I10
  rx479_done:
    rx479_cur."!cursor_fail"()
    rx479_cur."!cursor_debug"("FAIL  ", "assertion:sym<name>")
    .return (rx479_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<name>"  :subid("136_1275599996.35368") :method
.annotate 'line', 3
    new $P481, "ResizablePMCArray"
    push $P481, ""
    .return ($P481)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block486"  :anon :subid("137_1275599996.35368") :method :outer("135_1275599996.35368")
.annotate 'line', 150
    .local string rx488_tgt
    .local int rx488_pos
    .local int rx488_off
    .local int rx488_eos
    .local int rx488_rep
    .local pmc rx488_cur
    (rx488_cur, rx488_pos, rx488_tgt) = self."!cursor_start"()
    rx488_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx488_cur
    .local pmc match
    .lex "$/", match
    length rx488_eos, rx488_tgt
    gt rx488_pos, rx488_eos, rx488_done
    set rx488_off, 0
    lt rx488_pos, 2, rx488_start
    sub rx488_off, rx488_pos, 1
    substr rx488_tgt, rx488_tgt, rx488_off
  rx488_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan489_done
    goto rxscan489_scan
  rxscan489_loop:
    ($P10) = rx488_cur."from"()
    inc $P10
    set rx488_pos, $P10
    ge rx488_pos, rx488_eos, rxscan489_done
  rxscan489_scan:
    set_addr $I10, rxscan489_loop
    rx488_cur."!mark_push"(0, rx488_pos, $I10)
  rxscan489_done:
  # rx literal  ">"
    add $I11, rx488_pos, 1
    gt $I11, rx488_eos, rx488_fail
    sub $I11, rx488_pos, rx488_off
    substr $S10, rx488_tgt, $I11, 1
    ne $S10, ">", rx488_fail
    add rx488_pos, 1
  # rx pass
    rx488_cur."!cursor_pass"(rx488_pos, "")
    rx488_cur."!cursor_debug"("PASS  ", "", " at pos=", rx488_pos)
    .return (rx488_cur)
  rx488_fail:
    (rx488_rep, rx488_pos, $I10, $P10) = rx488_cur."!mark_fail"(0)
    lt rx488_pos, -1, rx488_done
    eq rx488_pos, -1, rx488_fail
    jump $I10
  rx488_done:
    rx488_cur."!cursor_fail"()
    rx488_cur."!cursor_debug"("FAIL  ", "")
    .return (rx488_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<[>"  :subid("138_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .const 'Sub' $P497 = "140_1275599996.35368" 
    capture_lex $P497
    .local string rx492_tgt
    .local int rx492_pos
    .local int rx492_off
    .local int rx492_eos
    .local int rx492_rep
    .local pmc rx492_cur
    (rx492_cur, rx492_pos, rx492_tgt) = self."!cursor_start"()
    rx492_cur."!cursor_debug"("START ", "assertion:sym<[>")
    rx492_cur."!cursor_caparray"("cclass_elem")
    .lex unicode:"$\x{a2}", rx492_cur
    .local pmc match
    .lex "$/", match
    length rx492_eos, rx492_tgt
    gt rx492_pos, rx492_eos, rx492_done
    set rx492_off, 0
    lt rx492_pos, 2, rx492_start
    sub rx492_off, rx492_pos, 1
    substr rx492_tgt, rx492_tgt, rx492_off
  rx492_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan495_done
    goto rxscan495_scan
  rxscan495_loop:
    ($P10) = rx492_cur."from"()
    inc $P10
    set rx492_pos, $P10
    ge rx492_pos, rx492_eos, rxscan495_done
  rxscan495_scan:
    set_addr $I10, rxscan495_loop
    rx492_cur."!mark_push"(0, rx492_pos, $I10)
  rxscan495_done:
.annotate 'line', 158
  # rx subrule "before" subtype=zerowidth negate=
    rx492_cur."!cursor_pos"(rx492_pos)
    .const 'Sub' $P497 = "140_1275599996.35368" 
    capture_lex $P497
    $P10 = rx492_cur."before"($P497)
    unless $P10, rx492_fail
  # rx rxquantr501 ** 1..*
    set_addr $I502, rxquantr501_done
    rx492_cur."!mark_push"(0, -1, $I502)
  rxquantr501_loop:
  # rx subrule "cclass_elem" subtype=capture negate=
    rx492_cur."!cursor_pos"(rx492_pos)
    $P10 = rx492_cur."cclass_elem"()
    unless $P10, rx492_fail
    rx492_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cclass_elem")
    rx492_pos = $P10."pos"()
    (rx492_rep) = rx492_cur."!mark_commit"($I502)
    rx492_cur."!mark_push"(rx492_rep, rx492_pos, $I502)
    goto rxquantr501_loop
  rxquantr501_done:
  # rx pass
    rx492_cur."!cursor_pass"(rx492_pos, "assertion:sym<[>")
    rx492_cur."!cursor_debug"("PASS  ", "assertion:sym<[>", " at pos=", rx492_pos)
    .return (rx492_cur)
  rx492_fail:
.annotate 'line', 3
    (rx492_rep, rx492_pos, $I10, $P10) = rx492_cur."!mark_fail"(0)
    lt rx492_pos, -1, rx492_done
    eq rx492_pos, -1, rx492_fail
    jump $I10
  rx492_done:
    rx492_cur."!cursor_fail"()
    rx492_cur."!cursor_debug"("FAIL  ", "assertion:sym<[>")
    .return (rx492_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<[>"  :subid("139_1275599996.35368") :method
.annotate 'line', 3
    new $P494, "ResizablePMCArray"
    push $P494, ""
    .return ($P494)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block496"  :anon :subid("140_1275599996.35368") :method :outer("138_1275599996.35368")
.annotate 'line', 158
    .local string rx498_tgt
    .local int rx498_pos
    .local int rx498_off
    .local int rx498_eos
    .local int rx498_rep
    .local pmc rx498_cur
    (rx498_cur, rx498_pos, rx498_tgt) = self."!cursor_start"()
    rx498_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx498_cur
    .local pmc match
    .lex "$/", match
    length rx498_eos, rx498_tgt
    gt rx498_pos, rx498_eos, rx498_done
    set rx498_off, 0
    lt rx498_pos, 2, rx498_start
    sub rx498_off, rx498_pos, 1
    substr rx498_tgt, rx498_tgt, rx498_off
  rx498_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan499_done
    goto rxscan499_scan
  rxscan499_loop:
    ($P10) = rx498_cur."from"()
    inc $P10
    set rx498_pos, $P10
    ge rx498_pos, rx498_eos, rxscan499_done
  rxscan499_scan:
    set_addr $I10, rxscan499_loop
    rx498_cur."!mark_push"(0, rx498_pos, $I10)
  rxscan499_done:
  alt500_0:
    set_addr $I10, alt500_1
    rx498_cur."!mark_push"(0, rx498_pos, $I10)
  # rx literal  "["
    add $I11, rx498_pos, 1
    gt $I11, rx498_eos, rx498_fail
    sub $I11, rx498_pos, rx498_off
    substr $S10, rx498_tgt, $I11, 1
    ne $S10, "[", rx498_fail
    add rx498_pos, 1
    goto alt500_end
  alt500_1:
    set_addr $I10, alt500_2
    rx498_cur."!mark_push"(0, rx498_pos, $I10)
  # rx literal  "+"
    add $I11, rx498_pos, 1
    gt $I11, rx498_eos, rx498_fail
    sub $I11, rx498_pos, rx498_off
    substr $S10, rx498_tgt, $I11, 1
    ne $S10, "+", rx498_fail
    add rx498_pos, 1
    goto alt500_end
  alt500_2:
  # rx literal  "-"
    add $I11, rx498_pos, 1
    gt $I11, rx498_eos, rx498_fail
    sub $I11, rx498_pos, rx498_off
    substr $S10, rx498_tgt, $I11, 1
    ne $S10, "-", rx498_fail
    add rx498_pos, 1
  alt500_end:
  # rx pass
    rx498_cur."!cursor_pass"(rx498_pos, "")
    rx498_cur."!cursor_debug"("PASS  ", "", " at pos=", rx498_pos)
    .return (rx498_cur)
  rx498_fail:
    (rx498_rep, rx498_pos, $I10, $P10) = rx498_cur."!mark_fail"(0)
    lt rx498_pos, -1, rx498_done
    eq rx498_pos, -1, rx498_fail
    jump $I10
  rx498_done:
    rx498_cur."!cursor_fail"()
    rx498_cur."!cursor_debug"("FAIL  ", "")
    .return (rx498_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "cclass_elem"  :subid("141_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .const 'Sub' $P515 = "143_1275599996.35368" 
    capture_lex $P515
    .local string rx504_tgt
    .local int rx504_pos
    .local int rx504_off
    .local int rx504_eos
    .local int rx504_rep
    .local pmc rx504_cur
    (rx504_cur, rx504_pos, rx504_tgt) = self."!cursor_start"()
    rx504_cur."!cursor_debug"("START ", "cclass_elem")
    rx504_cur."!cursor_caparray"("charspec")
    .lex unicode:"$\x{a2}", rx504_cur
    .local pmc match
    .lex "$/", match
    length rx504_eos, rx504_tgt
    gt rx504_pos, rx504_eos, rx504_done
    set rx504_off, 0
    lt rx504_pos, 2, rx504_start
    sub rx504_off, rx504_pos, 1
    substr rx504_tgt, rx504_tgt, rx504_off
  rx504_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan507_done
    goto rxscan507_scan
  rxscan507_loop:
    ($P10) = rx504_cur."from"()
    inc $P10
    set rx504_pos, $P10
    ge rx504_pos, rx504_eos, rxscan507_done
  rxscan507_scan:
    set_addr $I10, rxscan507_loop
    rx504_cur."!mark_push"(0, rx504_pos, $I10)
  rxscan507_done:
.annotate 'line', 161
  # rx subcapture "sign"
    set_addr $I10, rxcap_509_fail
    rx504_cur."!mark_push"(0, rx504_pos, $I10)
  alt508_0:
    set_addr $I10, alt508_1
    rx504_cur."!mark_push"(0, rx504_pos, $I10)
  # rx literal  "+"
    add $I11, rx504_pos, 1
    gt $I11, rx504_eos, rx504_fail
    sub $I11, rx504_pos, rx504_off
    substr $S10, rx504_tgt, $I11, 1
    ne $S10, "+", rx504_fail
    add rx504_pos, 1
    goto alt508_end
  alt508_1:
    set_addr $I10, alt508_2
    rx504_cur."!mark_push"(0, rx504_pos, $I10)
  # rx literal  "-"
    add $I11, rx504_pos, 1
    gt $I11, rx504_eos, rx504_fail
    sub $I11, rx504_pos, rx504_off
    substr $S10, rx504_tgt, $I11, 1
    ne $S10, "-", rx504_fail
    add rx504_pos, 1
    goto alt508_end
  alt508_2:
  alt508_end:
    set_addr $I10, rxcap_509_fail
    ($I12, $I11) = rx504_cur."!mark_peek"($I10)
    rx504_cur."!cursor_pos"($I11)
    ($P10) = rx504_cur."!cursor_start"()
    $P10."!cursor_pass"(rx504_pos, "")
    rx504_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sign")
    goto rxcap_509_done
  rxcap_509_fail:
    goto rx504_fail
  rxcap_509_done:
.annotate 'line', 162
  # rx rxquantr510 ** 0..1
    set_addr $I511, rxquantr510_done
    rx504_cur."!mark_push"(0, rx504_pos, $I511)
  rxquantr510_loop:
  # rx subrule "normspace" subtype=method negate=
    rx504_cur."!cursor_pos"(rx504_pos)
    $P10 = rx504_cur."normspace"()
    unless $P10, rx504_fail
    rx504_pos = $P10."pos"()
    (rx504_rep) = rx504_cur."!mark_commit"($I511)
  rxquantr510_done:
  alt512_0:
.annotate 'line', 163
    set_addr $I10, alt512_1
    rx504_cur."!mark_push"(0, rx504_pos, $I10)
.annotate 'line', 164
  # rx literal  "["
    add $I11, rx504_pos, 1
    gt $I11, rx504_eos, rx504_fail
    sub $I11, rx504_pos, rx504_off
    substr $S10, rx504_tgt, $I11, 1
    ne $S10, "[", rx504_fail
    add rx504_pos, 1
.annotate 'line', 167
  # rx rxquantr513 ** 0..*
    set_addr $I534, rxquantr513_done
    rx504_cur."!mark_push"(0, rx504_pos, $I534)
  rxquantr513_loop:
.annotate 'line', 164
  # rx subrule $P515 subtype=capture negate=
    rx504_cur."!cursor_pos"(rx504_pos)
    .const 'Sub' $P515 = "143_1275599996.35368" 
    capture_lex $P515
    $P10 = rx504_cur.$P515()
    unless $P10, rx504_fail
    rx504_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charspec")
    rx504_pos = $P10."pos"()
.annotate 'line', 167
    (rx504_rep) = rx504_cur."!mark_commit"($I534)
    rx504_cur."!mark_push"(rx504_rep, rx504_pos, $I534)
    goto rxquantr513_loop
  rxquantr513_done:
.annotate 'line', 168
  # rx charclass_q s r 0..-1
    sub $I10, rx504_pos, rx504_off
    find_not_cclass $I11, 32, rx504_tgt, $I10, rx504_eos
    add rx504_pos, rx504_off, $I11
  # rx literal  "]"
    add $I11, rx504_pos, 1
    gt $I11, rx504_eos, rx504_fail
    sub $I11, rx504_pos, rx504_off
    substr $S10, rx504_tgt, $I11, 1
    ne $S10, "]", rx504_fail
    add rx504_pos, 1
.annotate 'line', 164
    goto alt512_end
  alt512_1:
.annotate 'line', 169
  # rx subcapture "name"
    set_addr $I10, rxcap_535_fail
    rx504_cur."!mark_push"(0, rx504_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx504_pos, rx504_off
    find_not_cclass $I11, 8192, rx504_tgt, $I10, rx504_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx504_fail
    add rx504_pos, rx504_off, $I11
    set_addr $I10, rxcap_535_fail
    ($I12, $I11) = rx504_cur."!mark_peek"($I10)
    rx504_cur."!cursor_pos"($I11)
    ($P10) = rx504_cur."!cursor_start"()
    $P10."!cursor_pass"(rx504_pos, "")
    rx504_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_535_done
  rxcap_535_fail:
    goto rx504_fail
  rxcap_535_done:
  alt512_end:
.annotate 'line', 171
  # rx rxquantr536 ** 0..1
    set_addr $I537, rxquantr536_done
    rx504_cur."!mark_push"(0, rx504_pos, $I537)
  rxquantr536_loop:
  # rx subrule "normspace" subtype=method negate=
    rx504_cur."!cursor_pos"(rx504_pos)
    $P10 = rx504_cur."normspace"()
    unless $P10, rx504_fail
    rx504_pos = $P10."pos"()
    (rx504_rep) = rx504_cur."!mark_commit"($I537)
  rxquantr536_done:
.annotate 'line', 160
  # rx pass
    rx504_cur."!cursor_pass"(rx504_pos, "cclass_elem")
    rx504_cur."!cursor_debug"("PASS  ", "cclass_elem", " at pos=", rx504_pos)
    .return (rx504_cur)
  rx504_fail:
.annotate 'line', 3
    (rx504_rep, rx504_pos, $I10, $P10) = rx504_cur."!mark_fail"(0)
    lt rx504_pos, -1, rx504_done
    eq rx504_pos, -1, rx504_fail
    jump $I10
  rx504_done:
    rx504_cur."!cursor_fail"()
    rx504_cur."!cursor_debug"("FAIL  ", "cclass_elem")
    .return (rx504_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__cclass_elem"  :subid("142_1275599996.35368") :method
.annotate 'line', 3
    new $P506, "ResizablePMCArray"
    push $P506, ""
    push $P506, "-"
    push $P506, "+"
    .return ($P506)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block514"  :anon :subid("143_1275599996.35368") :method :outer("141_1275599996.35368")
.annotate 'line', 164
    .const 'Sub' $P530 = "146_1275599996.35368" 
    capture_lex $P530
    .const 'Sub' $P525 = "145_1275599996.35368" 
    capture_lex $P525
    .const 'Sub' $P521 = "144_1275599996.35368" 
    capture_lex $P521
    .local string rx516_tgt
    .local int rx516_pos
    .local int rx516_off
    .local int rx516_eos
    .local int rx516_rep
    .local pmc rx516_cur
    (rx516_cur, rx516_pos, rx516_tgt) = self."!cursor_start"()
    rx516_cur."!cursor_debug"("START ", "")
    rx516_cur."!cursor_caparray"("1")
    .lex unicode:"$\x{a2}", rx516_cur
    .local pmc match
    .lex "$/", match
    length rx516_eos, rx516_tgt
    gt rx516_pos, rx516_eos, rx516_done
    set rx516_off, 0
    lt rx516_pos, 2, rx516_start
    sub rx516_off, rx516_pos, 1
    substr rx516_tgt, rx516_tgt, rx516_off
  rx516_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan517_done
    goto rxscan517_scan
  rxscan517_loop:
    ($P10) = rx516_cur."from"()
    inc $P10
    set rx516_pos, $P10
    ge rx516_pos, rx516_eos, rxscan517_done
  rxscan517_scan:
    set_addr $I10, rxscan517_loop
    rx516_cur."!mark_push"(0, rx516_pos, $I10)
  rxscan517_done:
  alt518_0:
    set_addr $I10, alt518_1
    rx516_cur."!mark_push"(0, rx516_pos, $I10)
.annotate 'line', 165
  # rx charclass_q s r 0..-1
    sub $I10, rx516_pos, rx516_off
    find_not_cclass $I11, 32, rx516_tgt, $I10, rx516_eos
    add rx516_pos, rx516_off, $I11
  # rx literal  "-"
    add $I11, rx516_pos, 1
    gt $I11, rx516_eos, rx516_fail
    sub $I11, rx516_pos, rx516_off
    substr $S10, rx516_tgt, $I11, 1
    ne $S10, "-", rx516_fail
    add rx516_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx516_cur."!cursor_pos"(rx516_pos)
    $P10 = rx516_cur."obs"("hyphen in enumerated character class", "..")
    unless $P10, rx516_fail
    rx516_pos = $P10."pos"()
    goto alt518_end
  alt518_1:
.annotate 'line', 166
  # rx charclass_q s r 0..-1
    sub $I10, rx516_pos, rx516_off
    find_not_cclass $I11, 32, rx516_tgt, $I10, rx516_eos
    add rx516_pos, rx516_off, $I11
  alt519_0:
    set_addr $I10, alt519_1
    rx516_cur."!mark_push"(0, rx516_pos, $I10)
  # rx literal  "\\"
    add $I11, rx516_pos, 1
    gt $I11, rx516_eos, rx516_fail
    sub $I11, rx516_pos, rx516_off
    substr $S10, rx516_tgt, $I11, 1
    ne $S10, "\\", rx516_fail
    add rx516_pos, 1
  # rx subrule $P521 subtype=capture negate=
    rx516_cur."!cursor_pos"(rx516_pos)
    .const 'Sub' $P521 = "144_1275599996.35368" 
    capture_lex $P521
    $P10 = rx516_cur.$P521()
    unless $P10, rx516_fail
    rx516_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"(0)
    rx516_pos = $P10."pos"()
    goto alt519_end
  alt519_1:
  # rx subrule $P525 subtype=capture negate=
    rx516_cur."!cursor_pos"(rx516_pos)
    .const 'Sub' $P525 = "145_1275599996.35368" 
    capture_lex $P525
    $P10 = rx516_cur.$P525()
    unless $P10, rx516_fail
    rx516_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"(0)
    rx516_pos = $P10."pos"()
  alt519_end:
  # rx rxquantr528 ** 0..1
    set_addr $I533, rxquantr528_done
    rx516_cur."!mark_push"(0, rx516_pos, $I533)
  rxquantr528_loop:
  # rx charclass_q s r 0..-1
    sub $I10, rx516_pos, rx516_off
    find_not_cclass $I11, 32, rx516_tgt, $I10, rx516_eos
    add rx516_pos, rx516_off, $I11
  # rx literal  ".."
    add $I11, rx516_pos, 2
    gt $I11, rx516_eos, rx516_fail
    sub $I11, rx516_pos, rx516_off
    substr $S10, rx516_tgt, $I11, 2
    ne $S10, "..", rx516_fail
    add rx516_pos, 2
  # rx charclass_q s r 0..-1
    sub $I10, rx516_pos, rx516_off
    find_not_cclass $I11, 32, rx516_tgt, $I10, rx516_eos
    add rx516_pos, rx516_off, $I11
  # rx subrule $P530 subtype=capture negate=
    rx516_cur."!cursor_pos"(rx516_pos)
    .const 'Sub' $P530 = "146_1275599996.35368" 
    capture_lex $P530
    $P10 = rx516_cur.$P530()
    unless $P10, rx516_fail
    rx516_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("1")
    rx516_pos = $P10."pos"()
    (rx516_rep) = rx516_cur."!mark_commit"($I533)
  rxquantr528_done:
  alt518_end:
.annotate 'line', 164
  # rx pass
    rx516_cur."!cursor_pass"(rx516_pos, "")
    rx516_cur."!cursor_debug"("PASS  ", "", " at pos=", rx516_pos)
    .return (rx516_cur)
  rx516_fail:
    (rx516_rep, rx516_pos, $I10, $P10) = rx516_cur."!mark_fail"(0)
    lt rx516_pos, -1, rx516_done
    eq rx516_pos, -1, rx516_fail
    jump $I10
  rx516_done:
    rx516_cur."!cursor_fail"()
    rx516_cur."!cursor_debug"("FAIL  ", "")
    .return (rx516_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block520"  :anon :subid("144_1275599996.35368") :method :outer("143_1275599996.35368")
.annotate 'line', 166
    .local string rx522_tgt
    .local int rx522_pos
    .local int rx522_off
    .local int rx522_eos
    .local int rx522_rep
    .local pmc rx522_cur
    (rx522_cur, rx522_pos, rx522_tgt) = self."!cursor_start"()
    rx522_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx522_cur
    .local pmc match
    .lex "$/", match
    length rx522_eos, rx522_tgt
    gt rx522_pos, rx522_eos, rx522_done
    set rx522_off, 0
    lt rx522_pos, 2, rx522_start
    sub rx522_off, rx522_pos, 1
    substr rx522_tgt, rx522_tgt, rx522_off
  rx522_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan523_done
    goto rxscan523_scan
  rxscan523_loop:
    ($P10) = rx522_cur."from"()
    inc $P10
    set rx522_pos, $P10
    ge rx522_pos, rx522_eos, rxscan523_done
  rxscan523_scan:
    set_addr $I10, rxscan523_loop
    rx522_cur."!mark_push"(0, rx522_pos, $I10)
  rxscan523_done:
  # rx charclass .
    ge rx522_pos, rx522_eos, rx522_fail
    inc rx522_pos
  # rx pass
    rx522_cur."!cursor_pass"(rx522_pos, "")
    rx522_cur."!cursor_debug"("PASS  ", "", " at pos=", rx522_pos)
    .return (rx522_cur)
  rx522_fail:
    (rx522_rep, rx522_pos, $I10, $P10) = rx522_cur."!mark_fail"(0)
    lt rx522_pos, -1, rx522_done
    eq rx522_pos, -1, rx522_fail
    jump $I10
  rx522_done:
    rx522_cur."!cursor_fail"()
    rx522_cur."!cursor_debug"("FAIL  ", "")
    .return (rx522_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block524"  :anon :subid("145_1275599996.35368") :method :outer("143_1275599996.35368")
.annotate 'line', 166
    .local string rx526_tgt
    .local int rx526_pos
    .local int rx526_off
    .local int rx526_eos
    .local int rx526_rep
    .local pmc rx526_cur
    (rx526_cur, rx526_pos, rx526_tgt) = self."!cursor_start"()
    rx526_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx526_cur
    .local pmc match
    .lex "$/", match
    length rx526_eos, rx526_tgt
    gt rx526_pos, rx526_eos, rx526_done
    set rx526_off, 0
    lt rx526_pos, 2, rx526_start
    sub rx526_off, rx526_pos, 1
    substr rx526_tgt, rx526_tgt, rx526_off
  rx526_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan527_done
    goto rxscan527_scan
  rxscan527_loop:
    ($P10) = rx526_cur."from"()
    inc $P10
    set rx526_pos, $P10
    ge rx526_pos, rx526_eos, rxscan527_done
  rxscan527_scan:
    set_addr $I10, rxscan527_loop
    rx526_cur."!mark_push"(0, rx526_pos, $I10)
  rxscan527_done:
  # rx enumcharlist negate=1 
    ge rx526_pos, rx526_eos, rx526_fail
    sub $I10, rx526_pos, rx526_off
    substr $S10, rx526_tgt, $I10, 1
    index $I11, "]\\", $S10
    ge $I11, 0, rx526_fail
    inc rx526_pos
  # rx pass
    rx526_cur."!cursor_pass"(rx526_pos, "")
    rx526_cur."!cursor_debug"("PASS  ", "", " at pos=", rx526_pos)
    .return (rx526_cur)
  rx526_fail:
    (rx526_rep, rx526_pos, $I10, $P10) = rx526_cur."!mark_fail"(0)
    lt rx526_pos, -1, rx526_done
    eq rx526_pos, -1, rx526_fail
    jump $I10
  rx526_done:
    rx526_cur."!cursor_fail"()
    rx526_cur."!cursor_debug"("FAIL  ", "")
    .return (rx526_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block529"  :anon :subid("146_1275599996.35368") :method :outer("143_1275599996.35368")
.annotate 'line', 166
    .local string rx531_tgt
    .local int rx531_pos
    .local int rx531_off
    .local int rx531_eos
    .local int rx531_rep
    .local pmc rx531_cur
    (rx531_cur, rx531_pos, rx531_tgt) = self."!cursor_start"()
    rx531_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx531_cur
    .local pmc match
    .lex "$/", match
    length rx531_eos, rx531_tgt
    gt rx531_pos, rx531_eos, rx531_done
    set rx531_off, 0
    lt rx531_pos, 2, rx531_start
    sub rx531_off, rx531_pos, 1
    substr rx531_tgt, rx531_tgt, rx531_off
  rx531_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan532_done
    goto rxscan532_scan
  rxscan532_loop:
    ($P10) = rx531_cur."from"()
    inc $P10
    set rx531_pos, $P10
    ge rx531_pos, rx531_eos, rxscan532_done
  rxscan532_scan:
    set_addr $I10, rxscan532_loop
    rx531_cur."!mark_push"(0, rx531_pos, $I10)
  rxscan532_done:
  # rx charclass .
    ge rx531_pos, rx531_eos, rx531_fail
    inc rx531_pos
  # rx pass
    rx531_cur."!cursor_pass"(rx531_pos, "")
    rx531_cur."!cursor_debug"("PASS  ", "", " at pos=", rx531_pos)
    .return (rx531_cur)
  rx531_fail:
    (rx531_rep, rx531_pos, $I10, $P10) = rx531_cur."!mark_fail"(0)
    lt rx531_pos, -1, rx531_done
    eq rx531_pos, -1, rx531_fail
    jump $I10
  rx531_done:
    rx531_cur."!cursor_fail"()
    rx531_cur."!cursor_debug"("FAIL  ", "")
    .return (rx531_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_internal"  :subid("147_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .const 'Sub' $P547 = "149_1275599996.35368" 
    capture_lex $P547
    .local string rx539_tgt
    .local int rx539_pos
    .local int rx539_off
    .local int rx539_eos
    .local int rx539_rep
    .local pmc rx539_cur
    (rx539_cur, rx539_pos, rx539_tgt) = self."!cursor_start"()
    rx539_cur."!cursor_debug"("START ", "mod_internal")
    rx539_cur."!cursor_caparray"("n")
    .lex unicode:"$\x{a2}", rx539_cur
    .local pmc match
    .lex "$/", match
    length rx539_eos, rx539_tgt
    gt rx539_pos, rx539_eos, rx539_done
    set rx539_off, 0
    lt rx539_pos, 2, rx539_start
    sub rx539_off, rx539_pos, 1
    substr rx539_tgt, rx539_tgt, rx539_off
  rx539_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan543_done
    goto rxscan543_scan
  rxscan543_loop:
    ($P10) = rx539_cur."from"()
    inc $P10
    set rx539_pos, $P10
    ge rx539_pos, rx539_eos, rxscan543_done
  rxscan543_scan:
    set_addr $I10, rxscan543_loop
    rx539_cur."!mark_push"(0, rx539_pos, $I10)
  rxscan543_done:
  alt544_0:
.annotate 'line', 175
    set_addr $I10, alt544_1
    rx539_cur."!mark_push"(0, rx539_pos, $I10)
.annotate 'line', 176
  # rx literal  ":"
    add $I11, rx539_pos, 1
    gt $I11, rx539_eos, rx539_fail
    sub $I11, rx539_pos, rx539_off
    substr $S10, rx539_tgt, $I11, 1
    ne $S10, ":", rx539_fail
    add rx539_pos, 1
  # rx rxquantr545 ** 1..1
    set_addr $I551, rxquantr545_done
    rx539_cur."!mark_push"(0, -1, $I551)
  rxquantr545_loop:
  # rx subrule $P547 subtype=capture negate=
    rx539_cur."!cursor_pos"(rx539_pos)
    .const 'Sub' $P547 = "149_1275599996.35368" 
    capture_lex $P547
    $P10 = rx539_cur.$P547()
    unless $P10, rx539_fail
    rx539_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("n")
    rx539_pos = $P10."pos"()
    (rx539_rep) = rx539_cur."!mark_commit"($I551)
  rxquantr545_done:
  # rx subrule "mod_ident" subtype=capture negate=
    rx539_cur."!cursor_pos"(rx539_pos)
    $P10 = rx539_cur."mod_ident"()
    unless $P10, rx539_fail
    rx539_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_ident")
    rx539_pos = $P10."pos"()
  # rxanchor rwb
    le rx539_pos, 0, rx539_fail
    sub $I10, rx539_pos, rx539_off
    is_cclass $I11, 8192, rx539_tgt, $I10
    if $I11, rx539_fail
    dec $I10
    is_cclass $I11, 8192, rx539_tgt, $I10
    unless $I11, rx539_fail
    goto alt544_end
  alt544_1:
.annotate 'line', 177
  # rx literal  ":"
    add $I11, rx539_pos, 1
    gt $I11, rx539_eos, rx539_fail
    sub $I11, rx539_pos, rx539_off
    substr $S10, rx539_tgt, $I11, 1
    ne $S10, ":", rx539_fail
    add rx539_pos, 1
  # rx subrule "mod_ident" subtype=capture negate=
    rx539_cur."!cursor_pos"(rx539_pos)
    $P10 = rx539_cur."mod_ident"()
    unless $P10, rx539_fail
    rx539_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_ident")
    rx539_pos = $P10."pos"()
  # rx rxquantr552 ** 0..1
    set_addr $I554, rxquantr552_done
    rx539_cur."!mark_push"(0, rx539_pos, $I554)
  rxquantr552_loop:
  # rx literal  "("
    add $I11, rx539_pos, 1
    gt $I11, rx539_eos, rx539_fail
    sub $I11, rx539_pos, rx539_off
    substr $S10, rx539_tgt, $I11, 1
    ne $S10, "(", rx539_fail
    add rx539_pos, 1
  # rx subcapture "n"
    set_addr $I10, rxcap_553_fail
    rx539_cur."!mark_push"(0, rx539_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx539_pos, rx539_off
    find_not_cclass $I11, 8, rx539_tgt, $I10, rx539_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx539_fail
    add rx539_pos, rx539_off, $I11
    set_addr $I10, rxcap_553_fail
    ($I12, $I11) = rx539_cur."!mark_peek"($I10)
    rx539_cur."!cursor_pos"($I11)
    ($P10) = rx539_cur."!cursor_start"()
    $P10."!cursor_pass"(rx539_pos, "")
    rx539_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("n")
    goto rxcap_553_done
  rxcap_553_fail:
    goto rx539_fail
  rxcap_553_done:
  # rx literal  ")"
    add $I11, rx539_pos, 1
    gt $I11, rx539_eos, rx539_fail
    sub $I11, rx539_pos, rx539_off
    substr $S10, rx539_tgt, $I11, 1
    ne $S10, ")", rx539_fail
    add rx539_pos, 1
    (rx539_rep) = rx539_cur."!mark_commit"($I554)
  rxquantr552_done:
  alt544_end:
.annotate 'line', 174
  # rx pass
    rx539_cur."!cursor_pass"(rx539_pos, "mod_internal")
    rx539_cur."!cursor_debug"("PASS  ", "mod_internal", " at pos=", rx539_pos)
    .return (rx539_cur)
  rx539_fail:
.annotate 'line', 3
    (rx539_rep, rx539_pos, $I10, $P10) = rx539_cur."!mark_fail"(0)
    lt rx539_pos, -1, rx539_done
    eq rx539_pos, -1, rx539_fail
    jump $I10
  rx539_done:
    rx539_cur."!cursor_fail"()
    rx539_cur."!cursor_debug"("FAIL  ", "mod_internal")
    .return (rx539_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_internal"  :subid("148_1275599996.35368") :method
.annotate 'line', 3
    $P541 = self."!PREFIX__!subrule"("mod_ident", ":")
    new $P542, "ResizablePMCArray"
    push $P542, $P541
    push $P542, ":"
    .return ($P542)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block546"  :anon :subid("149_1275599996.35368") :method :outer("147_1275599996.35368")
.annotate 'line', 176
    .local string rx548_tgt
    .local int rx548_pos
    .local int rx548_off
    .local int rx548_eos
    .local int rx548_rep
    .local pmc rx548_cur
    (rx548_cur, rx548_pos, rx548_tgt) = self."!cursor_start"()
    rx548_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx548_cur
    .local pmc match
    .lex "$/", match
    length rx548_eos, rx548_tgt
    gt rx548_pos, rx548_eos, rx548_done
    set rx548_off, 0
    lt rx548_pos, 2, rx548_start
    sub rx548_off, rx548_pos, 1
    substr rx548_tgt, rx548_tgt, rx548_off
  rx548_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan549_done
    goto rxscan549_scan
  rxscan549_loop:
    ($P10) = rx548_cur."from"()
    inc $P10
    set rx548_pos, $P10
    ge rx548_pos, rx548_eos, rxscan549_done
  rxscan549_scan:
    set_addr $I10, rxscan549_loop
    rx548_cur."!mark_push"(0, rx548_pos, $I10)
  rxscan549_done:
  alt550_0:
    set_addr $I10, alt550_1
    rx548_cur."!mark_push"(0, rx548_pos, $I10)
  # rx literal  "!"
    add $I11, rx548_pos, 1
    gt $I11, rx548_eos, rx548_fail
    sub $I11, rx548_pos, rx548_off
    substr $S10, rx548_tgt, $I11, 1
    ne $S10, "!", rx548_fail
    add rx548_pos, 1
    goto alt550_end
  alt550_1:
  # rx charclass_q d r 1..-1
    sub $I10, rx548_pos, rx548_off
    find_not_cclass $I11, 8, rx548_tgt, $I10, rx548_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx548_fail
    add rx548_pos, rx548_off, $I11
  alt550_end:
  # rx pass
    rx548_cur."!cursor_pass"(rx548_pos, "")
    rx548_cur."!cursor_debug"("PASS  ", "", " at pos=", rx548_pos)
    .return (rx548_cur)
  rx548_fail:
    (rx548_rep, rx548_pos, $I10, $P10) = rx548_cur."!mark_fail"(0)
    lt rx548_pos, -1, rx548_done
    eq rx548_pos, -1, rx548_fail
    jump $I10
  rx548_done:
    rx548_cur."!cursor_fail"()
    rx548_cur."!cursor_debug"("FAIL  ", "")
    .return (rx548_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident"  :subid("150_1275599996.35368") :method
.annotate 'line', 181
    $P556 = self."!protoregex"("mod_ident")
    .return ($P556)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident"  :subid("151_1275599996.35368") :method
.annotate 'line', 181
    $P558 = self."!PREFIX__!protoregex"("mod_ident")
    .return ($P558)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ignorecase>"  :subid("152_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx560_tgt
    .local int rx560_pos
    .local int rx560_off
    .local int rx560_eos
    .local int rx560_rep
    .local pmc rx560_cur
    (rx560_cur, rx560_pos, rx560_tgt) = self."!cursor_start"()
    rx560_cur."!cursor_debug"("START ", "mod_ident:sym<ignorecase>")
    .lex unicode:"$\x{a2}", rx560_cur
    .local pmc match
    .lex "$/", match
    length rx560_eos, rx560_tgt
    gt rx560_pos, rx560_eos, rx560_done
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
.annotate 'line', 182
  # rx subcapture "sym"
    set_addr $I10, rxcap_564_fail
    rx560_cur."!mark_push"(0, rx560_pos, $I10)
  # rx literal  "i"
    add $I11, rx560_pos, 1
    gt $I11, rx560_eos, rx560_fail
    sub $I11, rx560_pos, rx560_off
    substr $S10, rx560_tgt, $I11, 1
    ne $S10, "i", rx560_fail
    add rx560_pos, 1
    set_addr $I10, rxcap_564_fail
    ($I12, $I11) = rx560_cur."!mark_peek"($I10)
    rx560_cur."!cursor_pos"($I11)
    ($P10) = rx560_cur."!cursor_start"()
    $P10."!cursor_pass"(rx560_pos, "")
    rx560_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_564_done
  rxcap_564_fail:
    goto rx560_fail
  rxcap_564_done:
  # rx rxquantr565 ** 0..1
    set_addr $I566, rxquantr565_done
    rx560_cur."!mark_push"(0, rx560_pos, $I566)
  rxquantr565_loop:
  # rx literal  "gnorecase"
    add $I11, rx560_pos, 9
    gt $I11, rx560_eos, rx560_fail
    sub $I11, rx560_pos, rx560_off
    substr $S10, rx560_tgt, $I11, 9
    ne $S10, "gnorecase", rx560_fail
    add rx560_pos, 9
    (rx560_rep) = rx560_cur."!mark_commit"($I566)
  rxquantr565_done:
  # rx pass
    rx560_cur."!cursor_pass"(rx560_pos, "mod_ident:sym<ignorecase>")
    rx560_cur."!cursor_debug"("PASS  ", "mod_ident:sym<ignorecase>", " at pos=", rx560_pos)
    .return (rx560_cur)
  rx560_fail:
.annotate 'line', 3
    (rx560_rep, rx560_pos, $I10, $P10) = rx560_cur."!mark_fail"(0)
    lt rx560_pos, -1, rx560_done
    eq rx560_pos, -1, rx560_fail
    jump $I10
  rx560_done:
    rx560_cur."!cursor_fail"()
    rx560_cur."!cursor_debug"("FAIL  ", "mod_ident:sym<ignorecase>")
    .return (rx560_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident:sym<ignorecase>"  :subid("153_1275599996.35368") :method
.annotate 'line', 3
    new $P562, "ResizablePMCArray"
    push $P562, "i"
    .return ($P562)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ratchet>"  :subid("154_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx568_tgt
    .local int rx568_pos
    .local int rx568_off
    .local int rx568_eos
    .local int rx568_rep
    .local pmc rx568_cur
    (rx568_cur, rx568_pos, rx568_tgt) = self."!cursor_start"()
    rx568_cur."!cursor_debug"("START ", "mod_ident:sym<ratchet>")
    .lex unicode:"$\x{a2}", rx568_cur
    .local pmc match
    .lex "$/", match
    length rx568_eos, rx568_tgt
    gt rx568_pos, rx568_eos, rx568_done
    set rx568_off, 0
    lt rx568_pos, 2, rx568_start
    sub rx568_off, rx568_pos, 1
    substr rx568_tgt, rx568_tgt, rx568_off
  rx568_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan571_done
    goto rxscan571_scan
  rxscan571_loop:
    ($P10) = rx568_cur."from"()
    inc $P10
    set rx568_pos, $P10
    ge rx568_pos, rx568_eos, rxscan571_done
  rxscan571_scan:
    set_addr $I10, rxscan571_loop
    rx568_cur."!mark_push"(0, rx568_pos, $I10)
  rxscan571_done:
.annotate 'line', 183
  # rx subcapture "sym"
    set_addr $I10, rxcap_572_fail
    rx568_cur."!mark_push"(0, rx568_pos, $I10)
  # rx literal  "r"
    add $I11, rx568_pos, 1
    gt $I11, rx568_eos, rx568_fail
    sub $I11, rx568_pos, rx568_off
    substr $S10, rx568_tgt, $I11, 1
    ne $S10, "r", rx568_fail
    add rx568_pos, 1
    set_addr $I10, rxcap_572_fail
    ($I12, $I11) = rx568_cur."!mark_peek"($I10)
    rx568_cur."!cursor_pos"($I11)
    ($P10) = rx568_cur."!cursor_start"()
    $P10."!cursor_pass"(rx568_pos, "")
    rx568_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_572_done
  rxcap_572_fail:
    goto rx568_fail
  rxcap_572_done:
  # rx rxquantr573 ** 0..1
    set_addr $I574, rxquantr573_done
    rx568_cur."!mark_push"(0, rx568_pos, $I574)
  rxquantr573_loop:
  # rx literal  "atchet"
    add $I11, rx568_pos, 6
    gt $I11, rx568_eos, rx568_fail
    sub $I11, rx568_pos, rx568_off
    substr $S10, rx568_tgt, $I11, 6
    ne $S10, "atchet", rx568_fail
    add rx568_pos, 6
    (rx568_rep) = rx568_cur."!mark_commit"($I574)
  rxquantr573_done:
  # rx pass
    rx568_cur."!cursor_pass"(rx568_pos, "mod_ident:sym<ratchet>")
    rx568_cur."!cursor_debug"("PASS  ", "mod_ident:sym<ratchet>", " at pos=", rx568_pos)
    .return (rx568_cur)
  rx568_fail:
.annotate 'line', 3
    (rx568_rep, rx568_pos, $I10, $P10) = rx568_cur."!mark_fail"(0)
    lt rx568_pos, -1, rx568_done
    eq rx568_pos, -1, rx568_fail
    jump $I10
  rx568_done:
    rx568_cur."!cursor_fail"()
    rx568_cur."!cursor_debug"("FAIL  ", "mod_ident:sym<ratchet>")
    .return (rx568_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident:sym<ratchet>"  :subid("155_1275599996.35368") :method
.annotate 'line', 3
    new $P570, "ResizablePMCArray"
    push $P570, "r"
    .return ($P570)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<sigspace>"  :subid("156_1275599996.35368") :method :outer("11_1275599996.35368")
.annotate 'line', 3
    .local string rx576_tgt
    .local int rx576_pos
    .local int rx576_off
    .local int rx576_eos
    .local int rx576_rep
    .local pmc rx576_cur
    (rx576_cur, rx576_pos, rx576_tgt) = self."!cursor_start"()
    rx576_cur."!cursor_debug"("START ", "mod_ident:sym<sigspace>")
    .lex unicode:"$\x{a2}", rx576_cur
    .local pmc match
    .lex "$/", match
    length rx576_eos, rx576_tgt
    gt rx576_pos, rx576_eos, rx576_done
    set rx576_off, 0
    lt rx576_pos, 2, rx576_start
    sub rx576_off, rx576_pos, 1
    substr rx576_tgt, rx576_tgt, rx576_off
  rx576_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan579_done
    goto rxscan579_scan
  rxscan579_loop:
    ($P10) = rx576_cur."from"()
    inc $P10
    set rx576_pos, $P10
    ge rx576_pos, rx576_eos, rxscan579_done
  rxscan579_scan:
    set_addr $I10, rxscan579_loop
    rx576_cur."!mark_push"(0, rx576_pos, $I10)
  rxscan579_done:
.annotate 'line', 184
  # rx subcapture "sym"
    set_addr $I10, rxcap_580_fail
    rx576_cur."!mark_push"(0, rx576_pos, $I10)
  # rx literal  "s"
    add $I11, rx576_pos, 1
    gt $I11, rx576_eos, rx576_fail
    sub $I11, rx576_pos, rx576_off
    substr $S10, rx576_tgt, $I11, 1
    ne $S10, "s", rx576_fail
    add rx576_pos, 1
    set_addr $I10, rxcap_580_fail
    ($I12, $I11) = rx576_cur."!mark_peek"($I10)
    rx576_cur."!cursor_pos"($I11)
    ($P10) = rx576_cur."!cursor_start"()
    $P10."!cursor_pass"(rx576_pos, "")
    rx576_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_580_done
  rxcap_580_fail:
    goto rx576_fail
  rxcap_580_done:
  # rx rxquantr581 ** 0..1
    set_addr $I582, rxquantr581_done
    rx576_cur."!mark_push"(0, rx576_pos, $I582)
  rxquantr581_loop:
  # rx literal  "igspace"
    add $I11, rx576_pos, 7
    gt $I11, rx576_eos, rx576_fail
    sub $I11, rx576_pos, rx576_off
    substr $S10, rx576_tgt, $I11, 7
    ne $S10, "igspace", rx576_fail
    add rx576_pos, 7
    (rx576_rep) = rx576_cur."!mark_commit"($I582)
  rxquantr581_done:
  # rx pass
    rx576_cur."!cursor_pass"(rx576_pos, "mod_ident:sym<sigspace>")
    rx576_cur."!cursor_debug"("PASS  ", "mod_ident:sym<sigspace>", " at pos=", rx576_pos)
    .return (rx576_cur)
  rx576_fail:
.annotate 'line', 3
    (rx576_rep, rx576_pos, $I10, $P10) = rx576_cur."!mark_fail"(0)
    lt rx576_pos, -1, rx576_done
    eq rx576_pos, -1, rx576_fail
    jump $I10
  rx576_done:
    rx576_cur."!cursor_fail"()
    rx576_cur."!cursor_debug"("FAIL  ", "mod_ident:sym<sigspace>")
    .return (rx576_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident:sym<sigspace>"  :subid("157_1275599996.35368") :method
.annotate 'line', 3
    new $P578, "ResizablePMCArray"
    push $P578, "s"
    .return ($P578)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block583" :load :anon :subid("158_1275599996.35368")
.annotate 'line', 3
    .const 'Sub' $P585 = "11_1275599996.35368" 
    $P586 = $P585()
    .return ($P586)
.end


.namespace []
.sub "_block588" :load :anon :subid("159_1275599996.35368")
.annotate 'line', 1
    .const 'Sub' $P590 = "10_1275599996.35368" 
    $P591 = $P590()
    .return ($P591)
.end

### .include 'gen/p6regex-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1275600002.0917")
.annotate 'line', 0
    get_hll_global $P14, ["Regex";"P6Regex";"Actions"], "_block13" 
    capture_lex $P14
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 4
    get_hll_global $P14, ["Regex";"P6Regex";"Actions"], "_block13" 
    capture_lex $P14
    $P1599 = $P14()
.annotate 'line', 1
    .return ($P1599)
    .const 'Sub' $P1601 = "91_1275600002.0917" 
    .return ($P1601)
.end


.namespace []
.sub "" :load :init :subid("post92") :outer("10_1275600002.0917")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1275600002.0917" 
    .local pmc block
    set block, $P12
    $P1604 = get_root_global ["parrot"], "P6metaclass"
    $P1604."new_class"("Regex::P6Regex::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block13"  :subid("11_1275600002.0917") :outer("10_1275600002.0917")
.annotate 'line', 4
    .const 'Sub' $P1561 = "89_1275600002.0917" 
    capture_lex $P1561
    .const 'Sub' $P1492 = "85_1275600002.0917" 
    capture_lex $P1492
    .const 'Sub' $P1424 = "83_1275600002.0917" 
    capture_lex $P1424
    .const 'Sub' $P1351 = "80_1275600002.0917" 
    capture_lex $P1351
    .const 'Sub' $P1337 = "79_1275600002.0917" 
    capture_lex $P1337
    .const 'Sub' $P1313 = "78_1275600002.0917" 
    capture_lex $P1313
    .const 'Sub' $P1295 = "77_1275600002.0917" 
    capture_lex $P1295
    .const 'Sub' $P1281 = "76_1275600002.0917" 
    capture_lex $P1281
    .const 'Sub' $P1268 = "75_1275600002.0917" 
    capture_lex $P1268
    .const 'Sub' $P1237 = "74_1275600002.0917" 
    capture_lex $P1237
    .const 'Sub' $P1206 = "73_1275600002.0917" 
    capture_lex $P1206
    .const 'Sub' $P1190 = "72_1275600002.0917" 
    capture_lex $P1190
    .const 'Sub' $P1174 = "71_1275600002.0917" 
    capture_lex $P1174
    .const 'Sub' $P1158 = "70_1275600002.0917" 
    capture_lex $P1158
    .const 'Sub' $P1142 = "69_1275600002.0917" 
    capture_lex $P1142
    .const 'Sub' $P1126 = "68_1275600002.0917" 
    capture_lex $P1126
    .const 'Sub' $P1110 = "67_1275600002.0917" 
    capture_lex $P1110
    .const 'Sub' $P1094 = "66_1275600002.0917" 
    capture_lex $P1094
    .const 'Sub' $P1070 = "65_1275600002.0917" 
    capture_lex $P1070
    .const 'Sub' $P1055 = "64_1275600002.0917" 
    capture_lex $P1055
    .const 'Sub' $P999 = "63_1275600002.0917" 
    capture_lex $P999
    .const 'Sub' $P978 = "62_1275600002.0917" 
    capture_lex $P978
    .const 'Sub' $P956 = "61_1275600002.0917" 
    capture_lex $P956
    .const 'Sub' $P946 = "60_1275600002.0917" 
    capture_lex $P946
    .const 'Sub' $P936 = "59_1275600002.0917" 
    capture_lex $P936
    .const 'Sub' $P926 = "58_1275600002.0917" 
    capture_lex $P926
    .const 'Sub' $P914 = "57_1275600002.0917" 
    capture_lex $P914
    .const 'Sub' $P902 = "56_1275600002.0917" 
    capture_lex $P902
    .const 'Sub' $P890 = "55_1275600002.0917" 
    capture_lex $P890
    .const 'Sub' $P878 = "54_1275600002.0917" 
    capture_lex $P878
    .const 'Sub' $P866 = "53_1275600002.0917" 
    capture_lex $P866
    .const 'Sub' $P854 = "52_1275600002.0917" 
    capture_lex $P854
    .const 'Sub' $P842 = "51_1275600002.0917" 
    capture_lex $P842
    .const 'Sub' $P830 = "50_1275600002.0917" 
    capture_lex $P830
    .const 'Sub' $P807 = "49_1275600002.0917" 
    capture_lex $P807
    .const 'Sub' $P784 = "48_1275600002.0917" 
    capture_lex $P784
    .const 'Sub' $P766 = "47_1275600002.0917" 
    capture_lex $P766
    .const 'Sub' $P756 = "46_1275600002.0917" 
    capture_lex $P756
    .const 'Sub' $P738 = "45_1275600002.0917" 
    capture_lex $P738
    .const 'Sub' $P665 = "43_1275600002.0917" 
    capture_lex $P665
    .const 'Sub' $P648 = "42_1275600002.0917" 
    capture_lex $P648
    .const 'Sub' $P633 = "41_1275600002.0917" 
    capture_lex $P633
    .const 'Sub' $P618 = "40_1275600002.0917" 
    capture_lex $P618
    .const 'Sub' $P592 = "39_1275600002.0917" 
    capture_lex $P592
    .const 'Sub' $P541 = "37_1275600002.0917" 
    capture_lex $P541
    .const 'Sub' $P473 = "35_1275600002.0917" 
    capture_lex $P473
    .const 'Sub' $P418 = "32_1275600002.0917" 
    capture_lex $P418
    .const 'Sub' $P403 = "31_1275600002.0917" 
    capture_lex $P403
    .const 'Sub' $P377 = "29_1275600002.0917" 
    capture_lex $P377
    .const 'Sub' $P360 = "28_1275600002.0917" 
    capture_lex $P360
    .const 'Sub' $P338 = "27_1275600002.0917" 
    capture_lex $P338
    .const 'Sub' $P305 = "26_1275600002.0917" 
    capture_lex $P305
    .const 'Sub' $P50 = "13_1275600002.0917" 
    capture_lex $P50
    .const 'Sub' $P16 = "12_1275600002.0917" 
    capture_lex $P16
    get_global $P15, "@MODIFIERS"
    unless_null $P15, vivify_94
    $P15 = root_new ['parrot';'ResizablePMCArray']
    set_global "@MODIFIERS", $P15
  vivify_94:
.annotate 'line', 494
    .const 'Sub' $P16 = "12_1275600002.0917" 
    newclosure $P49, $P16
    .lex "buildsub", $P49
.annotate 'line', 511
    .const 'Sub' $P50 = "13_1275600002.0917" 
    newclosure $P304, $P50
    .lex "capnames", $P304
.annotate 'line', 577
    .const 'Sub' $P305 = "26_1275600002.0917" 
    newclosure $P337, $P305
    .lex "backmod", $P337
.annotate 'line', 584
    .const 'Sub' $P338 = "27_1275600002.0917" 
    newclosure $P358, $P338
    .lex "subrule_alias", $P358
.annotate 'line', 4
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    get_global $P359, "@MODIFIERS"
.annotate 'line', 487
    find_lex $P1590, "buildsub"
    find_lex $P1591, "capnames"
    find_lex $P1592, "backmod"
    find_lex $P1593, "subrule_alias"
.annotate 'line', 4
    .return ($P1593)
    .const 'Sub' $P1595 = "90_1275600002.0917" 
    .return ($P1595)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "" :load :init :subid("post93") :outer("11_1275600002.0917")
.annotate 'line', 4
    get_hll_global $P14, ["Regex";"P6Regex";"Actions"], "_block13" 
    .local pmc block
    set block, $P14
.annotate 'line', 7

        $P1598 = new ['ResizablePMCArray']
        $P0 = new ['Hash']
        push $P1598, $P0
    
    set_global "@MODIFIERS", $P1598
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "buildsub"  :subid("12_1275600002.0917") :outer("11_1275600002.0917")
    .param pmc param_19
    .param pmc param_20 :optional
    .param int has_param_20 :opt_flag
.annotate 'line', 494
    new $P18, 'ExceptionHandler'
    set_addr $P18, control_17
    $P18."handle_types"(57)
    push_eh $P18
    .lex "$rpast", param_19
    if has_param_20, optparam_95
    get_hll_global $P21, ["PAST"], "Block"
    $P22 = $P21."new"()
    set param_20, $P22
  optparam_95:
    .lex "$block", param_20
.annotate 'line', 495
    $P23 = root_new ['parrot';'Hash']
    .lex "%capnames", $P23
    find_lex $P24, "$rpast"
    $P25 = "capnames"($P24, 0)
    store_lex "%capnames", $P25
.annotate 'line', 496
    new $P26, "Integer"
    assign $P26, 0
    find_lex $P27, "%capnames"
    unless_null $P27, vivify_96
    $P27 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P27
  vivify_96:
    set $P27[""], $P26
.annotate 'line', 497
    get_hll_global $P28, ["PAST"], "Regex"
.annotate 'line', 498
    get_hll_global $P29, ["PAST"], "Regex"
    $P30 = $P29."new"("scan" :named("pasttype"))
    find_lex $P31, "$rpast"
.annotate 'line', 500
    get_hll_global $P32, ["PAST"], "Regex"
    $P33 = $P32."new"("pass" :named("pasttype"))
    find_lex $P34, "%capnames"
    $P35 = $P28."new"($P30, $P31, $P33, "concat" :named("pasttype"), $P34 :named("capnames"))
.annotate 'line', 497
    store_lex "$rpast", $P35
.annotate 'line', 504
    find_lex $P37, "$block"
    $P38 = $P37."symbol"(unicode:"$\x{a2}")
    if $P38, unless_36_end
    find_lex $P39, "$block"
    $P39."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
  unless_36_end:
.annotate 'line', 505
    find_lex $P41, "$block"
    $P42 = $P41."symbol"("$/")
    if $P42, unless_40_end
    find_lex $P43, "$block"
    $P43."symbol"("$/", "lexical" :named("scope"))
  unless_40_end:
.annotate 'line', 506
    find_lex $P44, "$block"
    find_lex $P45, "$rpast"
    $P44."push"($P45)
.annotate 'line', 507
    find_lex $P46, "$block"
    $P46."blocktype"("method")
    find_lex $P47, "$block"
.annotate 'line', 494
    .return ($P47)
  control_17:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P48, exception, "payload"
    .return ($P48)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "capnames"  :subid("13_1275600002.0917") :outer("11_1275600002.0917")
    .param pmc param_53
    .param pmc param_54
.annotate 'line', 511
    .const 'Sub' $P279 = "24_1275600002.0917" 
    capture_lex $P279
    .const 'Sub' $P216 = "21_1275600002.0917" 
    capture_lex $P216
    .const 'Sub' $P174 = "19_1275600002.0917" 
    capture_lex $P174
    .const 'Sub' $P132 = "17_1275600002.0917" 
    capture_lex $P132
    .const 'Sub' $P65 = "14_1275600002.0917" 
    capture_lex $P65
    new $P52, 'ExceptionHandler'
    set_addr $P52, control_51
    $P52."handle_types"(57)
    push_eh $P52
    .lex "$ast", param_53
    .lex "$count", param_54
.annotate 'line', 512
    $P55 = root_new ['parrot';'Hash']
    .lex "%capnames", $P55
.annotate 'line', 513
    new $P56, "Undef"
    .lex "$pasttype", $P56
.annotate 'line', 511
    find_lex $P57, "%capnames"
.annotate 'line', 513
    find_lex $P58, "$ast"
    $P59 = $P58."pasttype"()
    store_lex "$pasttype", $P59
.annotate 'line', 514
    find_lex $P61, "$pasttype"
    set $S62, $P61
    iseq $I63, $S62, "alt"
    if $I63, if_60
.annotate 'line', 527
    find_lex $P123, "$pasttype"
    set $S124, $P123
    iseq $I125, $S124, "concat"
    if $I125, if_122
.annotate 'line', 536
    find_lex $P167, "$pasttype"
    set $S168, $P167
    iseq $I169, $S168, "subrule"
    if $I169, if_166
    new $P165, 'Integer'
    set $P165, $I169
    goto if_166_end
  if_166:
    find_lex $P170, "$ast"
    $S171 = $P170."subtype"()
    iseq $I172, $S171, "capture"
    new $P165, 'Integer'
    set $P165, $I172
  if_166_end:
    if $P165, if_164
.annotate 'line', 549
    find_lex $P212, "$pasttype"
    set $S213, $P212
    iseq $I214, $S213, "subcapture"
    if $I214, if_211
.annotate 'line', 566
    find_lex $P275, "$pasttype"
    set $S276, $P275
    iseq $I277, $S276, "quant"
    unless $I277, if_274_end
    .const 'Sub' $P279 = "24_1275600002.0917" 
    capture_lex $P279
    $P279()
  if_274_end:
    goto if_211_end
  if_211:
.annotate 'line', 549
    .const 'Sub' $P216 = "21_1275600002.0917" 
    capture_lex $P216
    $P216()
  if_211_end:
    goto if_164_end
  if_164:
.annotate 'line', 536
    .const 'Sub' $P174 = "19_1275600002.0917" 
    capture_lex $P174
    $P174()
  if_164_end:
    goto if_122_end
  if_122:
.annotate 'line', 528
    find_lex $P127, "$ast"
    $P128 = $P127."list"()
    defined $I129, $P128
    unless $I129, for_undef_117
    iter $P126, $P128
    new $P162, 'ExceptionHandler'
    set_addr $P162, loop161_handler
    $P162."handle_types"(64, 66, 65)
    push_eh $P162
  loop161_test:
    unless $P126, loop161_done
    shift $P130, $P126
  loop161_redo:
    .const 'Sub' $P132 = "17_1275600002.0917" 
    capture_lex $P132
    $P132($P130)
  loop161_next:
    goto loop161_test
  loop161_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P163, exception, 'type'
    eq $P163, 64, loop161_next
    eq $P163, 66, loop161_redo
  loop161_done:
    pop_eh 
  for_undef_117:
  if_122_end:
.annotate 'line', 527
    goto if_60_end
  if_60:
.annotate 'line', 514
    .const 'Sub' $P65 = "14_1275600002.0917" 
    capture_lex $P65
    $P65()
  if_60_end:
.annotate 'line', 573
    find_lex $P300, "$count"
    find_lex $P301, "%capnames"
    unless_null $P301, vivify_137
    $P301 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P301
  vivify_137:
    set $P301[""], $P300
    find_lex $P302, "%capnames"
.annotate 'line', 511
    .return ($P302)
  control_51:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P303, exception, "payload"
    .return ($P303)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block278"  :anon :subid("24_1275600002.0917") :outer("13_1275600002.0917")
.annotate 'line', 566
    .const 'Sub' $P290 = "25_1275600002.0917" 
    capture_lex $P290
.annotate 'line', 567
    $P280 = root_new ['parrot';'Hash']
    .lex "%astcap", $P280
    find_lex $P281, "$ast"
    unless_null $P281, vivify_97
    $P281 = root_new ['parrot';'ResizablePMCArray']
  vivify_97:
    set $P282, $P281[0]
    unless_null $P282, vivify_98
    new $P282, "Undef"
  vivify_98:
    find_lex $P283, "$count"
    $P284 = "capnames"($P282, $P283)
    store_lex "%astcap", $P284
.annotate 'line', 568
    find_lex $P286, "%astcap"
    defined $I287, $P286
    unless $I287, for_undef_99
    iter $P285, $P286
    new $P296, 'ExceptionHandler'
    set_addr $P296, loop295_handler
    $P296."handle_types"(64, 66, 65)
    push_eh $P296
  loop295_test:
    unless $P285, loop295_done
    shift $P288, $P285
  loop295_redo:
    .const 'Sub' $P290 = "25_1275600002.0917" 
    capture_lex $P290
    $P290($P288)
  loop295_next:
    goto loop295_test
  loop295_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P297, exception, 'type'
    eq $P297, 64, loop295_next
    eq $P297, 66, loop295_redo
  loop295_done:
    pop_eh 
  for_undef_99:
.annotate 'line', 571
    find_lex $P298, "%astcap"
    unless_null $P298, vivify_101
    $P298 = root_new ['parrot';'Hash']
  vivify_101:
    set $P299, $P298[""]
    unless_null $P299, vivify_102
    new $P299, "Undef"
  vivify_102:
    store_lex "$count", $P299
.annotate 'line', 566
    .return ($P299)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block289"  :anon :subid("25_1275600002.0917") :outer("24_1275600002.0917")
    .param pmc param_291
.annotate 'line', 568
    .lex "$_", param_291
.annotate 'line', 569
    new $P292, "Integer"
    assign $P292, 2
    find_lex $P293, "$_"
    find_lex $P294, "%capnames"
    unless_null $P294, vivify_100
    $P294 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P294
  vivify_100:
    set $P294[$P293], $P292
.annotate 'line', 568
    .return ($P292)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block215"  :anon :subid("21_1275600002.0917") :outer("13_1275600002.0917")
.annotate 'line', 549
    .const 'Sub' $P256 = "23_1275600002.0917" 
    capture_lex $P256
    .const 'Sub' $P228 = "22_1275600002.0917" 
    capture_lex $P228
.annotate 'line', 550
    new $P217, "Undef"
    .lex "$name", $P217
.annotate 'line', 551
    $P218 = root_new ['parrot';'ResizablePMCArray']
    .lex "@names", $P218
.annotate 'line', 560
    $P219 = root_new ['parrot';'Hash']
    .lex "%x", $P219
.annotate 'line', 550
    find_lex $P220, "$ast"
    $P221 = $P220."name"()
    store_lex "$name", $P221
.annotate 'line', 551

            $P0 = find_lex '$name'
            $S0 = $P0
            $P222 = split '=', $S0
        
    store_lex "@names", $P222
.annotate 'line', 556
    find_lex $P224, "@names"
    defined $I225, $P224
    unless $I225, for_undef_103
    iter $P223, $P224
    new $P245, 'ExceptionHandler'
    set_addr $P245, loop244_handler
    $P245."handle_types"(64, 66, 65)
    push_eh $P245
  loop244_test:
    unless $P223, loop244_done
    shift $P226, $P223
  loop244_redo:
    .const 'Sub' $P228 = "22_1275600002.0917" 
    capture_lex $P228
    $P228($P226)
  loop244_next:
    goto loop244_test
  loop244_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P246, exception, 'type'
    eq $P246, 64, loop244_next
    eq $P246, 66, loop244_redo
  loop244_done:
    pop_eh 
  for_undef_103:
.annotate 'line', 560
    find_lex $P247, "$ast"
    unless_null $P247, vivify_105
    $P247 = root_new ['parrot';'ResizablePMCArray']
  vivify_105:
    set $P248, $P247[0]
    unless_null $P248, vivify_106
    new $P248, "Undef"
  vivify_106:
    find_lex $P249, "$count"
    $P250 = "capnames"($P248, $P249)
    store_lex "%x", $P250
.annotate 'line', 561
    find_lex $P252, "%x"
    defined $I253, $P252
    unless $I253, for_undef_107
    iter $P251, $P252
    new $P270, 'ExceptionHandler'
    set_addr $P270, loop269_handler
    $P270."handle_types"(64, 66, 65)
    push_eh $P270
  loop269_test:
    unless $P251, loop269_done
    shift $P254, $P251
  loop269_redo:
    .const 'Sub' $P256 = "23_1275600002.0917" 
    capture_lex $P256
    $P256($P254)
  loop269_next:
    goto loop269_test
  loop269_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P271, exception, 'type'
    eq $P271, 64, loop269_next
    eq $P271, 66, loop269_redo
  loop269_done:
    pop_eh 
  for_undef_107:
.annotate 'line', 564
    find_lex $P272, "%x"
    unless_null $P272, vivify_113
    $P272 = root_new ['parrot';'Hash']
  vivify_113:
    set $P273, $P272[""]
    unless_null $P273, vivify_114
    new $P273, "Undef"
  vivify_114:
    store_lex "$count", $P273
.annotate 'line', 549
    .return ($P273)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block227"  :anon :subid("22_1275600002.0917") :outer("21_1275600002.0917")
    .param pmc param_229
.annotate 'line', 556
    .lex "$_", param_229
.annotate 'line', 557
    find_lex $P233, "$_"
    set $S234, $P233
    iseq $I235, $S234, "0"
    unless $I235, unless_232
    new $P231, 'Integer'
    set $P231, $I235
    goto unless_232_end
  unless_232:
    find_lex $P236, "$_"
    set $N237, $P236
    isgt $I238, $N237, 0.0
    new $P231, 'Integer'
    set $P231, $I238
  unless_232_end:
    unless $P231, if_230_end
    find_lex $P239, "$_"
    add $P240, $P239, 1
    store_lex "$count", $P240
  if_230_end:
.annotate 'line', 558
    new $P241, "Integer"
    assign $P241, 1
    find_lex $P242, "$_"
    find_lex $P243, "%capnames"
    unless_null $P243, vivify_104
    $P243 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P243
  vivify_104:
    set $P243[$P242], $P241
.annotate 'line', 556
    .return ($P241)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block255"  :anon :subid("23_1275600002.0917") :outer("21_1275600002.0917")
    .param pmc param_257
.annotate 'line', 561
    .lex "$_", param_257
.annotate 'line', 562
    find_lex $P258, "$_"
    find_lex $P259, "%capnames"
    unless_null $P259, vivify_108
    $P259 = root_new ['parrot';'Hash']
  vivify_108:
    set $P260, $P259[$P258]
    unless_null $P260, vivify_109
    new $P260, "Undef"
  vivify_109:
    set $N261, $P260
    new $P262, 'Float'
    set $P262, $N261
    find_lex $P263, "$_"
    find_lex $P264, "%x"
    unless_null $P264, vivify_110
    $P264 = root_new ['parrot';'Hash']
  vivify_110:
    set $P265, $P264[$P263]
    unless_null $P265, vivify_111
    new $P265, "Undef"
  vivify_111:
    add $P266, $P262, $P265
    find_lex $P267, "$_"
    find_lex $P268, "%capnames"
    unless_null $P268, vivify_112
    $P268 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P268
  vivify_112:
    set $P268[$P267], $P266
.annotate 'line', 561
    .return ($P266)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block173"  :anon :subid("19_1275600002.0917") :outer("13_1275600002.0917")
.annotate 'line', 536
    .const 'Sub' $P192 = "20_1275600002.0917" 
    capture_lex $P192
.annotate 'line', 537
    new $P175, "Undef"
    .lex "$name", $P175
.annotate 'line', 539
    $P176 = root_new ['parrot';'ResizablePMCArray']
    .lex "@names", $P176
.annotate 'line', 537
    find_lex $P177, "$ast"
    $P178 = $P177."name"()
    store_lex "$name", $P178
.annotate 'line', 538
    find_lex $P180, "$name"
    set $S181, $P180
    iseq $I182, $S181, ""
    unless $I182, if_179_end
    find_lex $P183, "$count"
    store_lex "$name", $P183
    find_lex $P184, "$ast"
    find_lex $P185, "$name"
    $P184."name"($P185)
  if_179_end:
.annotate 'line', 539

            $P0 = find_lex '$name'
            $S0 = $P0
            $P186 = split '=', $S0
        
    store_lex "@names", $P186
.annotate 'line', 544
    find_lex $P188, "@names"
    defined $I189, $P188
    unless $I189, for_undef_115
    iter $P187, $P188
    new $P209, 'ExceptionHandler'
    set_addr $P209, loop208_handler
    $P209."handle_types"(64, 66, 65)
    push_eh $P209
  loop208_test:
    unless $P187, loop208_done
    shift $P190, $P187
  loop208_redo:
    .const 'Sub' $P192 = "20_1275600002.0917" 
    capture_lex $P192
    $P192($P190)
  loop208_next:
    goto loop208_test
  loop208_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P210, exception, 'type'
    eq $P210, 64, loop208_next
    eq $P210, 66, loop208_redo
  loop208_done:
    pop_eh 
  for_undef_115:
.annotate 'line', 536
    .return ($P187)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block191"  :anon :subid("20_1275600002.0917") :outer("19_1275600002.0917")
    .param pmc param_193
.annotate 'line', 544
    .lex "$_", param_193
.annotate 'line', 545
    find_lex $P197, "$_"
    set $S198, $P197
    iseq $I199, $S198, "0"
    unless $I199, unless_196
    new $P195, 'Integer'
    set $P195, $I199
    goto unless_196_end
  unless_196:
    find_lex $P200, "$_"
    set $N201, $P200
    isgt $I202, $N201, 0.0
    new $P195, 'Integer'
    set $P195, $I202
  unless_196_end:
    unless $P195, if_194_end
    find_lex $P203, "$_"
    add $P204, $P203, 1
    store_lex "$count", $P204
  if_194_end:
.annotate 'line', 546
    new $P205, "Integer"
    assign $P205, 1
    find_lex $P206, "$_"
    find_lex $P207, "%capnames"
    unless_null $P207, vivify_116
    $P207 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P207
  vivify_116:
    set $P207[$P206], $P205
.annotate 'line', 544
    .return ($P205)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block131"  :anon :subid("17_1275600002.0917") :outer("13_1275600002.0917")
    .param pmc param_134
.annotate 'line', 528
    .const 'Sub' $P143 = "18_1275600002.0917" 
    capture_lex $P143
.annotate 'line', 529
    $P133 = root_new ['parrot';'Hash']
    .lex "%x", $P133
    .lex "$_", param_134
    find_lex $P135, "$_"
    find_lex $P136, "$count"
    $P137 = "capnames"($P135, $P136)
    store_lex "%x", $P137
.annotate 'line', 530
    find_lex $P139, "%x"
    defined $I140, $P139
    unless $I140, for_undef_118
    iter $P138, $P139
    new $P157, 'ExceptionHandler'
    set_addr $P157, loop156_handler
    $P157."handle_types"(64, 66, 65)
    push_eh $P157
  loop156_test:
    unless $P138, loop156_done
    shift $P141, $P138
  loop156_redo:
    .const 'Sub' $P143 = "18_1275600002.0917" 
    capture_lex $P143
    $P143($P141)
  loop156_next:
    goto loop156_test
  loop156_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P158, exception, 'type'
    eq $P158, 64, loop156_next
    eq $P158, 66, loop156_redo
  loop156_done:
    pop_eh 
  for_undef_118:
.annotate 'line', 533
    find_lex $P159, "%x"
    unless_null $P159, vivify_124
    $P159 = root_new ['parrot';'Hash']
  vivify_124:
    set $P160, $P159[""]
    unless_null $P160, vivify_125
    new $P160, "Undef"
  vivify_125:
    store_lex "$count", $P160
.annotate 'line', 528
    .return ($P160)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block142"  :anon :subid("18_1275600002.0917") :outer("17_1275600002.0917")
    .param pmc param_144
.annotate 'line', 530
    .lex "$_", param_144
.annotate 'line', 531
    find_lex $P145, "$_"
    find_lex $P146, "%capnames"
    unless_null $P146, vivify_119
    $P146 = root_new ['parrot';'Hash']
  vivify_119:
    set $P147, $P146[$P145]
    unless_null $P147, vivify_120
    new $P147, "Undef"
  vivify_120:
    set $N148, $P147
    new $P149, 'Float'
    set $P149, $N148
    find_lex $P150, "$_"
    find_lex $P151, "%x"
    unless_null $P151, vivify_121
    $P151 = root_new ['parrot';'Hash']
  vivify_121:
    set $P152, $P151[$P150]
    unless_null $P152, vivify_122
    new $P152, "Undef"
  vivify_122:
    add $P153, $P149, $P152
    find_lex $P154, "$_"
    find_lex $P155, "%capnames"
    unless_null $P155, vivify_123
    $P155 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P155
  vivify_123:
    set $P155[$P154], $P153
.annotate 'line', 530
    .return ($P153)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block64"  :anon :subid("14_1275600002.0917") :outer("13_1275600002.0917")
.annotate 'line', 514
    .const 'Sub' $P74 = "15_1275600002.0917" 
    capture_lex $P74
.annotate 'line', 515
    new $P66, "Undef"
    .lex "$max", $P66
    find_lex $P67, "$count"
    store_lex "$max", $P67
.annotate 'line', 516
    find_lex $P69, "$ast"
    $P70 = $P69."list"()
    defined $I71, $P70
    unless $I71, for_undef_126
    iter $P68, $P70
    new $P119, 'ExceptionHandler'
    set_addr $P119, loop118_handler
    $P119."handle_types"(64, 66, 65)
    push_eh $P119
  loop118_test:
    unless $P68, loop118_done
    shift $P72, $P68
  loop118_redo:
    .const 'Sub' $P74 = "15_1275600002.0917" 
    capture_lex $P74
    $P74($P72)
  loop118_next:
    goto loop118_test
  loop118_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P120, exception, 'type'
    eq $P120, 64, loop118_next
    eq $P120, 66, loop118_redo
  loop118_done:
    pop_eh 
  for_undef_126:
.annotate 'line', 525
    find_lex $P121, "$max"
    store_lex "$count", $P121
.annotate 'line', 514
    .return ($P121)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block73"  :anon :subid("15_1275600002.0917") :outer("14_1275600002.0917")
    .param pmc param_76
.annotate 'line', 516
    .const 'Sub' $P85 = "16_1275600002.0917" 
    capture_lex $P85
.annotate 'line', 517
    $P75 = root_new ['parrot';'Hash']
    .lex "%x", $P75
    .lex "$_", param_76
    find_lex $P77, "$_"
    find_lex $P78, "$count"
    $P79 = "capnames"($P77, $P78)
    store_lex "%x", $P79
.annotate 'line', 518
    find_lex $P81, "%x"
    defined $I82, $P81
    unless $I82, for_undef_127
    iter $P80, $P81
    new $P106, 'ExceptionHandler'
    set_addr $P106, loop105_handler
    $P106."handle_types"(64, 66, 65)
    push_eh $P106
  loop105_test:
    unless $P80, loop105_done
    shift $P83, $P80
  loop105_redo:
    .const 'Sub' $P85 = "16_1275600002.0917" 
    capture_lex $P85
    $P85($P83)
  loop105_next:
    goto loop105_test
  loop105_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, 'type'
    eq $P107, 64, loop105_next
    eq $P107, 66, loop105_redo
  loop105_done:
    pop_eh 
  for_undef_127:
.annotate 'line', 523
    find_lex $P110, "%x"
    unless_null $P110, vivify_133
    $P110 = root_new ['parrot';'Hash']
  vivify_133:
    set $P111, $P110[""]
    unless_null $P111, vivify_134
    new $P111, "Undef"
  vivify_134:
    set $N112, $P111
    find_lex $P113, "$max"
    set $N114, $P113
    isgt $I115, $N112, $N114
    if $I115, if_109
    new $P108, 'Integer'
    set $P108, $I115
    goto if_109_end
  if_109:
    find_lex $P116, "%x"
    unless_null $P116, vivify_135
    $P116 = root_new ['parrot';'Hash']
  vivify_135:
    set $P117, $P116[""]
    unless_null $P117, vivify_136
    new $P117, "Undef"
  vivify_136:
    store_lex "$max", $P117
    set $P108, $P117
  if_109_end:
.annotate 'line', 516
    .return ($P108)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block84"  :anon :subid("16_1275600002.0917") :outer("15_1275600002.0917")
    .param pmc param_86
.annotate 'line', 518
    .lex "$_", param_86
.annotate 'line', 519
    find_lex $P91, "$_"
    find_lex $P92, "%capnames"
    unless_null $P92, vivify_128
    $P92 = root_new ['parrot';'Hash']
  vivify_128:
    set $P93, $P92[$P91]
    unless_null $P93, vivify_129
    new $P93, "Undef"
  vivify_129:
    set $N94, $P93
    islt $I95, $N94, 2.0
    if $I95, if_90
    new $P89, 'Integer'
    set $P89, $I95
    goto if_90_end
  if_90:
    find_lex $P96, "$_"
    find_lex $P97, "%x"
    unless_null $P97, vivify_130
    $P97 = root_new ['parrot';'Hash']
  vivify_130:
    set $P98, $P97[$P96]
    unless_null $P98, vivify_131
    new $P98, "Undef"
  vivify_131:
    set $N99, $P98
    iseq $I100, $N99, 1.0
    new $P89, 'Integer'
    set $P89, $I100
  if_90_end:
    if $P89, if_88
    new $P102, "Integer"
    assign $P102, 2
    set $P87, $P102
    goto if_88_end
  if_88:
    new $P101, "Integer"
    assign $P101, 1
    set $P87, $P101
  if_88_end:
.annotate 'line', 520
    find_lex $P103, "$_"
    find_lex $P104, "%capnames"
    unless_null $P104, vivify_132
    $P104 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P104
  vivify_132:
    set $P104[$P103], $P87
.annotate 'line', 518
    .return ($P87)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backmod"  :subid("26_1275600002.0917") :outer("11_1275600002.0917")
    .param pmc param_308
    .param pmc param_309
.annotate 'line', 577
    new $P307, 'ExceptionHandler'
    set_addr $P307, control_306
    $P307."handle_types"(57)
    push_eh $P307
    .lex "$ast", param_308
    .lex "$backmod", param_309
.annotate 'line', 578
    find_lex $P311, "$backmod"
    set $S312, $P311
    iseq $I313, $S312, ":"
    if $I313, if_310
.annotate 'line', 579
    find_lex $P318, "$backmod"
    set $S319, $P318
    iseq $I320, $S319, ":?"
    unless $I320, unless_317
    new $P316, 'Integer'
    set $P316, $I320
    goto unless_317_end
  unless_317:
    find_lex $P321, "$backmod"
    set $S322, $P321
    iseq $I323, $S322, "?"
    new $P316, 'Integer'
    set $P316, $I323
  unless_317_end:
    if $P316, if_315
.annotate 'line', 580
    find_lex $P328, "$backmod"
    set $S329, $P328
    iseq $I330, $S329, ":!"
    unless $I330, unless_327
    new $P326, 'Integer'
    set $P326, $I330
    goto unless_327_end
  unless_327:
    find_lex $P331, "$backmod"
    set $S332, $P331
    iseq $I333, $S332, "!"
    new $P326, 'Integer'
    set $P326, $I333
  unless_327_end:
    unless $P326, if_325_end
    find_lex $P334, "$ast"
    $P334."backtrack"("g")
  if_325_end:
    goto if_315_end
  if_315:
.annotate 'line', 579
    find_lex $P324, "$ast"
    $P324."backtrack"("f")
  if_315_end:
    goto if_310_end
  if_310:
.annotate 'line', 578
    find_lex $P314, "$ast"
    $P314."backtrack"("r")
  if_310_end:
    find_lex $P335, "$ast"
.annotate 'line', 577
    .return ($P335)
  control_306:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P336, exception, "payload"
    .return ($P336)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "subrule_alias"  :subid("27_1275600002.0917") :outer("11_1275600002.0917")
    .param pmc param_341
    .param pmc param_342
.annotate 'line', 584
    new $P340, 'ExceptionHandler'
    set_addr $P340, control_339
    $P340."handle_types"(57)
    push_eh $P340
    .lex "$past", param_341
    .lex "$name", param_342
.annotate 'line', 585
    find_lex $P344, "$past"
    $S345 = $P344."name"()
    isgt $I346, $S345, ""
    if $I346, if_343
.annotate 'line', 586
    find_lex $P353, "$past"
    find_lex $P354, "$name"
    $P353."name"($P354)
    goto if_343_end
  if_343:
.annotate 'line', 585
    find_lex $P347, "$past"
    find_lex $P348, "$name"
    concat $P349, $P348, "="
    find_lex $P350, "$past"
    $S351 = $P350."name"()
    concat $P352, $P349, $S351
    $P347."name"($P352)
  if_343_end:
.annotate 'line', 587
    find_lex $P355, "$past"
    $P356 = $P355."subtype"("capture")
.annotate 'line', 584
    .return ($P356)
  control_339:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P357, exception, "payload"
    .return ($P357)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "arg"  :subid("28_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_363
.annotate 'line', 14
    new $P362, 'ExceptionHandler'
    set_addr $P362, control_361
    $P362."handle_types"(57)
    push_eh $P362
    .lex "self", self
    .lex "$/", param_363
.annotate 'line', 15
    find_lex $P364, "$/"
    find_lex $P367, "$/"
    unless_null $P367, vivify_138
    $P367 = root_new ['parrot';'Hash']
  vivify_138:
    set $P368, $P367["quote_EXPR"]
    unless_null $P368, vivify_139
    new $P368, "Undef"
  vivify_139:
    if $P368, if_366
    find_lex $P372, "$/"
    unless_null $P372, vivify_140
    $P372 = root_new ['parrot';'Hash']
  vivify_140:
    set $P373, $P372["val"]
    unless_null $P373, vivify_141
    new $P373, "Undef"
  vivify_141:
    set $N374, $P373
    new $P365, 'Float'
    set $P365, $N374
    goto if_366_end
  if_366:
    find_lex $P369, "$/"
    unless_null $P369, vivify_142
    $P369 = root_new ['parrot';'Hash']
  vivify_142:
    set $P370, $P369["quote_EXPR"]
    unless_null $P370, vivify_143
    new $P370, "Undef"
  vivify_143:
    $P371 = $P370."ast"()
    set $P365, $P371
  if_366_end:
    $P375 = $P364."!make"($P365)
.annotate 'line', 14
    .return ($P375)
  control_361:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P376, exception, "payload"
    .return ($P376)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "arglist"  :subid("29_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_380
.annotate 'line', 18
    .const 'Sub' $P390 = "30_1275600002.0917" 
    capture_lex $P390
    new $P379, 'ExceptionHandler'
    set_addr $P379, control_378
    $P379."handle_types"(57)
    push_eh $P379
    .lex "self", self
    .lex "$/", param_380
.annotate 'line', 19
    new $P381, "Undef"
    .lex "$past", $P381
    get_hll_global $P382, ["PAST"], "Op"
    $P383 = $P382."new"("list" :named("pasttype"))
    store_lex "$past", $P383
.annotate 'line', 20
    find_lex $P385, "$/"
    unless_null $P385, vivify_144
    $P385 = root_new ['parrot';'Hash']
  vivify_144:
    set $P386, $P385["arg"]
    unless_null $P386, vivify_145
    new $P386, "Undef"
  vivify_145:
    defined $I387, $P386
    unless $I387, for_undef_146
    iter $P384, $P386
    new $P397, 'ExceptionHandler'
    set_addr $P397, loop396_handler
    $P397."handle_types"(64, 66, 65)
    push_eh $P397
  loop396_test:
    unless $P384, loop396_done
    shift $P388, $P384
  loop396_redo:
    .const 'Sub' $P390 = "30_1275600002.0917" 
    capture_lex $P390
    $P390($P388)
  loop396_next:
    goto loop396_test
  loop396_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P398, exception, 'type'
    eq $P398, 64, loop396_next
    eq $P398, 66, loop396_redo
  loop396_done:
    pop_eh 
  for_undef_146:
.annotate 'line', 21
    find_lex $P399, "$/"
    find_lex $P400, "$past"
    $P401 = $P399."!make"($P400)
.annotate 'line', 18
    .return ($P401)
  control_378:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P402, exception, "payload"
    .return ($P402)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block389"  :anon :subid("30_1275600002.0917") :outer("29_1275600002.0917")
    .param pmc param_391
.annotate 'line', 20
    .lex "$_", param_391
    find_lex $P392, "$past"
    find_lex $P393, "$_"
    $P394 = $P393."ast"()
    $P395 = $P392."push"($P394)
    .return ($P395)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "TOP"  :subid("31_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_406
.annotate 'line', 24
    new $P405, 'ExceptionHandler'
    set_addr $P405, control_404
    $P405."handle_types"(57)
    push_eh $P405
    .lex "self", self
    .lex "$/", param_406
.annotate 'line', 25
    new $P407, "Undef"
    .lex "$past", $P407
    find_lex $P408, "$/"
    unless_null $P408, vivify_147
    $P408 = root_new ['parrot';'Hash']
  vivify_147:
    set $P409, $P408["nibbler"]
    unless_null $P409, vivify_148
    new $P409, "Undef"
  vivify_148:
    $P410 = $P409."ast"()
    $P411 = "buildsub"($P410)
    store_lex "$past", $P411
.annotate 'line', 26
    find_lex $P412, "$past"
    find_lex $P413, "$/"
    $P412."node"($P413)
.annotate 'line', 27
    find_lex $P414, "$/"
    find_lex $P415, "$past"
    $P416 = $P414."!make"($P415)
.annotate 'line', 24
    .return ($P416)
  control_404:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P417, exception, "payload"
    .return ($P417)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "nibbler"  :subid("32_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_421
    .param pmc param_422 :optional
    .param int has_param_422 :opt_flag
.annotate 'line', 30
    .const 'Sub' $P456 = "34_1275600002.0917" 
    capture_lex $P456
    .const 'Sub' $P430 = "33_1275600002.0917" 
    capture_lex $P430
    new $P420, 'ExceptionHandler'
    set_addr $P420, control_419
    $P420."handle_types"(57)
    push_eh $P420
    .lex "self", self
    .lex "$/", param_421
    if has_param_422, optparam_149
    new $P423, "Undef"
    set param_422, $P423
  optparam_149:
    .lex "$key", param_422
.annotate 'line', 42
    new $P424, "Undef"
    .lex "$past", $P424
.annotate 'line', 31
    find_lex $P426, "$key"
    set $S427, $P426
    iseq $I428, $S427, "open"
    unless $I428, if_425_end
    .const 'Sub' $P430 = "33_1275600002.0917" 
    capture_lex $P430
    $P430()
  if_425_end:
.annotate 'line', 41
    get_global $P440, "@MODIFIERS"
    $P440."shift"()
    find_lex $P441, "$past"
.annotate 'line', 43
    find_lex $P443, "$/"
    unless_null $P443, vivify_152
    $P443 = root_new ['parrot';'Hash']
  vivify_152:
    set $P444, $P443["termish"]
    unless_null $P444, vivify_153
    new $P444, "Undef"
  vivify_153:
    set $N445, $P444
    isgt $I446, $N445, 1.0
    if $I446, if_442
.annotate 'line', 50
    find_lex $P465, "$/"
    unless_null $P465, vivify_154
    $P465 = root_new ['parrot';'Hash']
  vivify_154:
    set $P466, $P465["termish"]
    unless_null $P466, vivify_155
    $P466 = root_new ['parrot';'ResizablePMCArray']
  vivify_155:
    set $P467, $P466[0]
    unless_null $P467, vivify_156
    new $P467, "Undef"
  vivify_156:
    $P468 = $P467."ast"()
    store_lex "$past", $P468
.annotate 'line', 49
    goto if_442_end
  if_442:
.annotate 'line', 44
    get_hll_global $P447, ["PAST"], "Regex"
    find_lex $P448, "$/"
    $P449 = $P447."new"("alt" :named("pasttype"), $P448 :named("node"))
    store_lex "$past", $P449
.annotate 'line', 45
    find_lex $P451, "$/"
    unless_null $P451, vivify_157
    $P451 = root_new ['parrot';'Hash']
  vivify_157:
    set $P452, $P451["termish"]
    unless_null $P452, vivify_158
    new $P452, "Undef"
  vivify_158:
    defined $I453, $P452
    unless $I453, for_undef_159
    iter $P450, $P452
    new $P463, 'ExceptionHandler'
    set_addr $P463, loop462_handler
    $P463."handle_types"(64, 66, 65)
    push_eh $P463
  loop462_test:
    unless $P450, loop462_done
    shift $P454, $P450
  loop462_redo:
    .const 'Sub' $P456 = "34_1275600002.0917" 
    capture_lex $P456
    $P456($P454)
  loop462_next:
    goto loop462_test
  loop462_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P464, exception, 'type'
    eq $P464, 64, loop462_next
    eq $P464, 66, loop462_redo
  loop462_done:
    pop_eh 
  for_undef_159:
  if_442_end:
.annotate 'line', 52
    find_lex $P469, "$/"
    find_lex $P470, "$past"
    $P471 = $P469."!make"($P470)
.annotate 'line', 30
    .return ($P471)
  control_419:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P472, exception, "payload"
    .return ($P472)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block429"  :anon :subid("33_1275600002.0917") :outer("32_1275600002.0917")
.annotate 'line', 32
    $P431 = root_new ['parrot';'Hash']
    .lex "%old", $P431
.annotate 'line', 33
    $P432 = root_new ['parrot';'Hash']
    .lex "%new", $P432
.annotate 'line', 32
    get_global $P433, "@MODIFIERS"
    unless_null $P433, vivify_150
    $P433 = root_new ['parrot';'ResizablePMCArray']
  vivify_150:
    set $P434, $P433[0]
    unless_null $P434, vivify_151
    new $P434, "Undef"
  vivify_151:
    store_lex "%old", $P434
.annotate 'line', 33

                       $P0 = find_lex '%old'
                       $P435 = clone $P0
                   
    store_lex "%new", $P435
.annotate 'line', 37
    get_global $P436, "@MODIFIERS"
    find_lex $P437, "%new"
    $P436."unshift"($P437)
.annotate 'line', 38
    new $P438, "Exception"
    set $P438['type'], 57
    new $P439, "Integer"
    assign $P439, 1
    setattribute $P438, 'payload', $P439
    throw $P438
.annotate 'line', 31
    .return ()
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block455"  :anon :subid("34_1275600002.0917") :outer("32_1275600002.0917")
    .param pmc param_457
.annotate 'line', 45
    .lex "$_", param_457
.annotate 'line', 46
    find_lex $P458, "$past"
    find_lex $P459, "$_"
    $P460 = $P459."ast"()
    $P461 = $P458."push"($P460)
.annotate 'line', 45
    .return ($P461)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "termish"  :subid("35_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_476
.annotate 'line', 55
    .const 'Sub' $P489 = "36_1275600002.0917" 
    capture_lex $P489
    new $P475, 'ExceptionHandler'
    set_addr $P475, control_474
    $P475."handle_types"(57)
    push_eh $P475
    .lex "self", self
    .lex "$/", param_476
.annotate 'line', 56
    new $P477, "Undef"
    .lex "$past", $P477
.annotate 'line', 57
    new $P478, "Undef"
    .lex "$lastlit", $P478
.annotate 'line', 56
    get_hll_global $P479, ["PAST"], "Regex"
    find_lex $P480, "$/"
    $P481 = $P479."new"("concat" :named("pasttype"), $P480 :named("node"))
    store_lex "$past", $P481
.annotate 'line', 57
    new $P482, "Integer"
    assign $P482, 0
    store_lex "$lastlit", $P482
.annotate 'line', 58
    find_lex $P484, "$/"
    unless_null $P484, vivify_160
    $P484 = root_new ['parrot';'Hash']
  vivify_160:
    set $P485, $P484["noun"]
    unless_null $P485, vivify_161
    new $P485, "Undef"
  vivify_161:
    defined $I486, $P485
    unless $I486, for_undef_162
    iter $P483, $P485
    new $P535, 'ExceptionHandler'
    set_addr $P535, loop534_handler
    $P535."handle_types"(64, 66, 65)
    push_eh $P535
  loop534_test:
    unless $P483, loop534_done
    shift $P487, $P483
  loop534_redo:
    .const 'Sub' $P489 = "36_1275600002.0917" 
    capture_lex $P489
    $P489($P487)
  loop534_next:
    goto loop534_test
  loop534_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P536, exception, 'type'
    eq $P536, 64, loop534_next
    eq $P536, 66, loop534_redo
  loop534_done:
    pop_eh 
  for_undef_162:
.annotate 'line', 73
    find_lex $P537, "$/"
    find_lex $P538, "$past"
    $P539 = $P537."!make"($P538)
.annotate 'line', 55
    .return ($P539)
  control_474:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P540, exception, "payload"
    .return ($P540)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block488"  :anon :subid("36_1275600002.0917") :outer("35_1275600002.0917")
    .param pmc param_491
.annotate 'line', 59
    new $P490, "Undef"
    .lex "$ast", $P490
    .lex "$_", param_491
    find_lex $P492, "$_"
    $P493 = $P492."ast"()
    store_lex "$ast", $P493
.annotate 'line', 60
    find_lex $P496, "$ast"
    if $P496, if_495
    set $P494, $P496
    goto if_495_end
  if_495:
.annotate 'line', 61
    find_lex $P503, "$lastlit"
    if $P503, if_502
    set $P501, $P503
    goto if_502_end
  if_502:
    find_lex $P504, "$ast"
    $S505 = $P504."pasttype"()
    iseq $I506, $S505, "literal"
    new $P501, 'Integer'
    set $P501, $I506
  if_502_end:
    if $P501, if_500
    set $P499, $P501
    goto if_500_end
  if_500:
.annotate 'line', 62
    get_hll_global $P507, ["PAST"], "Node"
    find_lex $P508, "$ast"
    unless_null $P508, vivify_163
    $P508 = root_new ['parrot';'ResizablePMCArray']
  vivify_163:
    set $P509, $P508[0]
    unless_null $P509, vivify_164
    new $P509, "Undef"
  vivify_164:
    $P510 = $P507."ACCEPTS"($P509)
    isfalse $I511, $P510
    new $P499, 'Integer'
    set $P499, $I511
  if_500_end:
    if $P499, if_498
.annotate 'line', 66
    find_lex $P518, "$past"
    find_lex $P519, "$ast"
    $P518."push"($P519)
.annotate 'line', 67
    find_lex $P524, "$ast"
    $S525 = $P524."pasttype"()
    iseq $I526, $S525, "literal"
    if $I526, if_523
    new $P522, 'Integer'
    set $P522, $I526
    goto if_523_end
  if_523:
.annotate 'line', 68
    get_hll_global $P527, ["PAST"], "Node"
    find_lex $P528, "$ast"
    unless_null $P528, vivify_165
    $P528 = root_new ['parrot';'ResizablePMCArray']
  vivify_165:
    set $P529, $P528[0]
    unless_null $P529, vivify_166
    new $P529, "Undef"
  vivify_166:
    $P530 = $P527."ACCEPTS"($P529)
    isfalse $I531, $P530
    new $P522, 'Integer'
    set $P522, $I531
  if_523_end:
    if $P522, if_521
    new $P533, "Integer"
    assign $P533, 0
    set $P520, $P533
    goto if_521_end
  if_521:
    find_lex $P532, "$ast"
    set $P520, $P532
  if_521_end:
.annotate 'line', 69
    store_lex "$lastlit", $P520
.annotate 'line', 65
    set $P497, $P520
.annotate 'line', 62
    goto if_498_end
  if_498:
.annotate 'line', 63
    find_lex $P512, "$lastlit"
    unless_null $P512, vivify_167
    $P512 = root_new ['parrot';'ResizablePMCArray']
  vivify_167:
    set $P513, $P512[0]
    unless_null $P513, vivify_168
    new $P513, "Undef"
  vivify_168:
    find_lex $P514, "$ast"
    unless_null $P514, vivify_169
    $P514 = root_new ['parrot';'ResizablePMCArray']
  vivify_169:
    set $P515, $P514[0]
    unless_null $P515, vivify_170
    new $P515, "Undef"
  vivify_170:
    concat $P516, $P513, $P515
    find_lex $P517, "$lastlit"
    unless_null $P517, vivify_171
    $P517 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$lastlit", $P517
  vivify_171:
    set $P517[0], $P516
.annotate 'line', 62
    set $P497, $P516
  if_498_end:
.annotate 'line', 60
    set $P494, $P497
  if_495_end:
.annotate 'line', 58
    .return ($P494)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantified_atom"  :subid("37_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_544
.annotate 'line', 76
    .const 'Sub' $P553 = "38_1275600002.0917" 
    capture_lex $P553
    new $P543, 'ExceptionHandler'
    set_addr $P543, control_542
    $P543."handle_types"(57)
    push_eh $P543
    .lex "self", self
    .lex "$/", param_544
.annotate 'line', 77
    new $P545, "Undef"
    .lex "$past", $P545
    find_lex $P546, "$/"
    unless_null $P546, vivify_172
    $P546 = root_new ['parrot';'Hash']
  vivify_172:
    set $P547, $P546["atom"]
    unless_null $P547, vivify_173
    new $P547, "Undef"
  vivify_173:
    $P548 = $P547."ast"()
    store_lex "$past", $P548
.annotate 'line', 78
    find_lex $P550, "$/"
    unless_null $P550, vivify_174
    $P550 = root_new ['parrot';'Hash']
  vivify_174:
    set $P551, $P550["quantifier"]
    unless_null $P551, vivify_175
    new $P551, "Undef"
  vivify_175:
    if $P551, if_549
.annotate 'line', 84
    find_lex $P568, "$/"
    unless_null $P568, vivify_176
    $P568 = root_new ['parrot';'Hash']
  vivify_176:
    set $P569, $P568["backmod"]
    unless_null $P569, vivify_177
    $P569 = root_new ['parrot';'ResizablePMCArray']
  vivify_177:
    set $P570, $P569[0]
    unless_null $P570, vivify_178
    new $P570, "Undef"
  vivify_178:
    unless $P570, if_567_end
    find_lex $P571, "$past"
    find_lex $P572, "$/"
    unless_null $P572, vivify_179
    $P572 = root_new ['parrot';'Hash']
  vivify_179:
    set $P573, $P572["backmod"]
    unless_null $P573, vivify_180
    $P573 = root_new ['parrot';'ResizablePMCArray']
  vivify_180:
    set $P574, $P573[0]
    unless_null $P574, vivify_181
    new $P574, "Undef"
  vivify_181:
    "backmod"($P571, $P574)
  if_567_end:
    goto if_549_end
  if_549:
.annotate 'line', 78
    .const 'Sub' $P553 = "38_1275600002.0917" 
    capture_lex $P553
    $P553()
  if_549_end:
.annotate 'line', 85
    find_lex $P580, "$past"
    if $P580, if_579
    set $P578, $P580
    goto if_579_end
  if_579:
    find_lex $P581, "$past"
    $P582 = $P581."backtrack"()
    isfalse $I583, $P582
    new $P578, 'Integer'
    set $P578, $I583
  if_579_end:
    if $P578, if_577
    set $P576, $P578
    goto if_577_end
  if_577:
    get_global $P584, "@MODIFIERS"
    unless_null $P584, vivify_185
    $P584 = root_new ['parrot';'ResizablePMCArray']
  vivify_185:
    set $P585, $P584[0]
    unless_null $P585, vivify_186
    $P585 = root_new ['parrot';'Hash']
  vivify_186:
    set $P586, $P585["r"]
    unless_null $P586, vivify_187
    new $P586, "Undef"
  vivify_187:
    set $P576, $P586
  if_577_end:
    unless $P576, if_575_end
.annotate 'line', 86
    find_lex $P587, "$past"
    $P587."backtrack"("r")
  if_575_end:
.annotate 'line', 88
    find_lex $P588, "$/"
    find_lex $P589, "$past"
    $P590 = $P588."!make"($P589)
.annotate 'line', 76
    .return ($P590)
  control_542:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P591, exception, "payload"
    .return ($P591)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block552"  :anon :subid("38_1275600002.0917") :outer("37_1275600002.0917")
.annotate 'line', 80
    new $P554, "Undef"
    .lex "$qast", $P554
.annotate 'line', 79
    find_lex $P556, "$past"
    isfalse $I557, $P556
    unless $I557, if_555_end
    find_lex $P558, "$/"
    $P559 = $P558."CURSOR"()
    $P559."panic"("Quantifier follows nothing")
  if_555_end:
.annotate 'line', 80
    find_lex $P560, "$/"
    unless_null $P560, vivify_182
    $P560 = root_new ['parrot';'Hash']
  vivify_182:
    set $P561, $P560["quantifier"]
    unless_null $P561, vivify_183
    $P561 = root_new ['parrot';'ResizablePMCArray']
  vivify_183:
    set $P562, $P561[0]
    unless_null $P562, vivify_184
    new $P562, "Undef"
  vivify_184:
    $P563 = $P562."ast"()
    store_lex "$qast", $P563
.annotate 'line', 81
    find_lex $P564, "$qast"
    find_lex $P565, "$past"
    $P564."unshift"($P565)
.annotate 'line', 82
    find_lex $P566, "$qast"
    store_lex "$past", $P566
.annotate 'line', 78
    .return ($P566)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "atom"  :subid("39_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_595
.annotate 'line', 91
    new $P594, 'ExceptionHandler'
    set_addr $P594, control_593
    $P594."handle_types"(57)
    push_eh $P594
    .lex "self", self
    .lex "$/", param_595
.annotate 'line', 92
    new $P596, "Undef"
    .lex "$past", $P596
.annotate 'line', 91
    find_lex $P597, "$past"
.annotate 'line', 93
    find_lex $P599, "$/"
    unless_null $P599, vivify_188
    $P599 = root_new ['parrot';'Hash']
  vivify_188:
    set $P600, $P599["metachar"]
    unless_null $P600, vivify_189
    new $P600, "Undef"
  vivify_189:
    if $P600, if_598
.annotate 'line', 95
    get_hll_global $P604, ["PAST"], "Regex"
    find_lex $P605, "$/"
    set $S606, $P605
    find_lex $P607, "$/"
    $P608 = $P604."new"($S606, "literal" :named("pasttype"), $P607 :named("node"))
    store_lex "$past", $P608
.annotate 'line', 96
    get_global $P610, "@MODIFIERS"
    unless_null $P610, vivify_190
    $P610 = root_new ['parrot';'ResizablePMCArray']
  vivify_190:
    set $P611, $P610[0]
    unless_null $P611, vivify_191
    $P611 = root_new ['parrot';'Hash']
  vivify_191:
    set $P612, $P611["i"]
    unless_null $P612, vivify_192
    new $P612, "Undef"
  vivify_192:
    unless $P612, if_609_end
    find_lex $P613, "$past"
    $P613."subtype"("ignorecase")
  if_609_end:
.annotate 'line', 94
    goto if_598_end
  if_598:
.annotate 'line', 93
    find_lex $P601, "$/"
    unless_null $P601, vivify_193
    $P601 = root_new ['parrot';'Hash']
  vivify_193:
    set $P602, $P601["metachar"]
    unless_null $P602, vivify_194
    new $P602, "Undef"
  vivify_194:
    $P603 = $P602."ast"()
    store_lex "$past", $P603
  if_598_end:
.annotate 'line', 98
    find_lex $P614, "$/"
    find_lex $P615, "$past"
    $P616 = $P614."!make"($P615)
.annotate 'line', 91
    .return ($P616)
  control_593:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P617, exception, "payload"
    .return ($P617)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<*>"  :subid("40_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_621
.annotate 'line', 101
    new $P620, 'ExceptionHandler'
    set_addr $P620, control_619
    $P620."handle_types"(57)
    push_eh $P620
    .lex "self", self
    .lex "$/", param_621
.annotate 'line', 102
    new $P622, "Undef"
    .lex "$past", $P622
    get_hll_global $P623, ["PAST"], "Regex"
    find_lex $P624, "$/"
    $P625 = $P623."new"("quant" :named("pasttype"), $P624 :named("node"))
    store_lex "$past", $P625
.annotate 'line', 103
    find_lex $P626, "$/"
    find_lex $P627, "$past"
    find_lex $P628, "$/"
    unless_null $P628, vivify_195
    $P628 = root_new ['parrot';'Hash']
  vivify_195:
    set $P629, $P628["backmod"]
    unless_null $P629, vivify_196
    new $P629, "Undef"
  vivify_196:
    $P630 = "backmod"($P627, $P629)
    $P631 = $P626."!make"($P630)
.annotate 'line', 101
    .return ($P631)
  control_619:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P632, exception, "payload"
    .return ($P632)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<+>"  :subid("41_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_636
.annotate 'line', 106
    new $P635, 'ExceptionHandler'
    set_addr $P635, control_634
    $P635."handle_types"(57)
    push_eh $P635
    .lex "self", self
    .lex "$/", param_636
.annotate 'line', 107
    new $P637, "Undef"
    .lex "$past", $P637
    get_hll_global $P638, ["PAST"], "Regex"
    find_lex $P639, "$/"
    $P640 = $P638."new"("quant" :named("pasttype"), 1 :named("min"), $P639 :named("node"))
    store_lex "$past", $P640
.annotate 'line', 108
    find_lex $P641, "$/"
    find_lex $P642, "$past"
    find_lex $P643, "$/"
    unless_null $P643, vivify_197
    $P643 = root_new ['parrot';'Hash']
  vivify_197:
    set $P644, $P643["backmod"]
    unless_null $P644, vivify_198
    new $P644, "Undef"
  vivify_198:
    $P645 = "backmod"($P642, $P644)
    $P646 = $P641."!make"($P645)
.annotate 'line', 106
    .return ($P646)
  control_634:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P647, exception, "payload"
    .return ($P647)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<?>"  :subid("42_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_651
.annotate 'line', 111
    new $P650, 'ExceptionHandler'
    set_addr $P650, control_649
    $P650."handle_types"(57)
    push_eh $P650
    .lex "self", self
    .lex "$/", param_651
.annotate 'line', 112
    new $P652, "Undef"
    .lex "$past", $P652
    get_hll_global $P653, ["PAST"], "Regex"
    find_lex $P654, "$/"
    $P655 = $P653."new"("quant" :named("pasttype"), 0 :named("min"), 1 :named("max"), $P654 :named("node"))
    store_lex "$past", $P655
.annotate 'line', 113
    find_lex $P656, "$/"
    find_lex $P657, "$past"
    find_lex $P658, "$/"
    unless_null $P658, vivify_199
    $P658 = root_new ['parrot';'Hash']
  vivify_199:
    set $P659, $P658["backmod"]
    unless_null $P659, vivify_200
    new $P659, "Undef"
  vivify_200:
    $P660 = "backmod"($P657, $P659)
    $P656."!make"($P660)
.annotate 'line', 114
    find_lex $P661, "$/"
    find_lex $P662, "$past"
    $P663 = $P661."!make"($P662)
.annotate 'line', 111
    .return ($P663)
  control_649:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P664, exception, "payload"
    .return ($P664)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<**>"  :subid("43_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_668
.annotate 'line', 117
    .const 'Sub' $P683 = "44_1275600002.0917" 
    capture_lex $P683
    new $P667, 'ExceptionHandler'
    set_addr $P667, control_666
    $P667."handle_types"(57)
    push_eh $P667
    .lex "self", self
    .lex "$/", param_668
.annotate 'line', 118
    new $P669, "Undef"
    .lex "$past", $P669
.annotate 'line', 119
    new $P670, "Undef"
    .lex "$ws", $P670
.annotate 'line', 117
    find_lex $P671, "$past"
.annotate 'line', 119
    find_lex $P674, "$/"
    unless_null $P674, vivify_201
    $P674 = root_new ['parrot';'Hash']
  vivify_201:
    set $P675, $P674["normspace"]
    unless_null $P675, vivify_202
    new $P675, "Undef"
  vivify_202:
    if $P675, if_673
    set $P672, $P675
    goto if_673_end
  if_673:
    get_global $P676, "@MODIFIERS"
    unless_null $P676, vivify_203
    $P676 = root_new ['parrot';'ResizablePMCArray']
  vivify_203:
    set $P677, $P676[0]
    unless_null $P677, vivify_204
    $P677 = root_new ['parrot';'Hash']
  vivify_204:
    set $P678, $P677["s"]
    unless_null $P678, vivify_205
    new $P678, "Undef"
  vivify_205:
    set $P672, $P678
  if_673_end:
    store_lex "$ws", $P672
.annotate 'line', 120
    find_lex $P680, "$/"
    unless_null $P680, vivify_206
    $P680 = root_new ['parrot';'Hash']
  vivify_206:
    set $P681, $P680["quantified_atom"]
    unless_null $P681, vivify_207
    new $P681, "Undef"
  vivify_207:
    if $P681, if_679
.annotate 'line', 136
    get_hll_global $P701, ["PAST"], "Regex"
    find_lex $P702, "$/"
    unless_null $P702, vivify_208
    $P702 = root_new ['parrot';'Hash']
  vivify_208:
    set $P703, $P702["min"]
    unless_null $P703, vivify_209
    new $P703, "Undef"
  vivify_209:
    set $N704, $P703
    find_lex $P705, "$/"
    $P706 = $P701."new"("quant" :named("pasttype"), $N704 :named("min"), $P705 :named("node"))
    store_lex "$past", $P706
.annotate 'line', 137
    find_lex $P708, "$/"
    unless_null $P708, vivify_210
    $P708 = root_new ['parrot';'Hash']
  vivify_210:
    set $P709, $P708["max"]
    unless_null $P709, vivify_211
    new $P709, "Undef"
  vivify_211:
    isfalse $I710, $P709
    if $I710, if_707
.annotate 'line', 138
    find_lex $P716, "$/"
    unless_null $P716, vivify_212
    $P716 = root_new ['parrot';'Hash']
  vivify_212:
    set $P717, $P716["max"]
    unless_null $P717, vivify_213
    $P717 = root_new ['parrot';'ResizablePMCArray']
  vivify_213:
    set $P718, $P717[0]
    unless_null $P718, vivify_214
    new $P718, "Undef"
  vivify_214:
    set $S719, $P718
    isne $I720, $S719, "*"
    unless $I720, if_715_end
    find_lex $P721, "$past"
    find_lex $P722, "$/"
    unless_null $P722, vivify_215
    $P722 = root_new ['parrot';'Hash']
  vivify_215:
    set $P723, $P722["max"]
    unless_null $P723, vivify_216
    $P723 = root_new ['parrot';'ResizablePMCArray']
  vivify_216:
    set $P724, $P723[0]
    unless_null $P724, vivify_217
    new $P724, "Undef"
  vivify_217:
    set $N725, $P724
    $P721."max"($N725)
  if_715_end:
    goto if_707_end
  if_707:
.annotate 'line', 137
    find_lex $P711, "$past"
    find_lex $P712, "$/"
    unless_null $P712, vivify_218
    $P712 = root_new ['parrot';'Hash']
  vivify_218:
    set $P713, $P712["min"]
    unless_null $P713, vivify_219
    new $P713, "Undef"
  vivify_219:
    set $N714, $P713
    $P711."max"($N714)
  if_707_end:
.annotate 'line', 139
    find_lex $P727, "$ws"
    unless $P727, if_726_end
    find_lex $P728, "$past"
    get_hll_global $P729, ["PAST"], "Regex"
    $P730 = $P729."new"("ws", "subrule" :named("pasttype"), "method" :named("subtype"))
    $P728."sep"($P730)
  if_726_end:
.annotate 'line', 135
    goto if_679_end
  if_679:
.annotate 'line', 120
    .const 'Sub' $P683 = "44_1275600002.0917" 
    capture_lex $P683
    $P683()
  if_679_end:
.annotate 'line', 143
    find_lex $P731, "$/"
    find_lex $P732, "$past"
    find_lex $P733, "$/"
    unless_null $P733, vivify_222
    $P733 = root_new ['parrot';'Hash']
  vivify_222:
    set $P734, $P733["backmod"]
    unless_null $P734, vivify_223
    new $P734, "Undef"
  vivify_223:
    $P735 = "backmod"($P732, $P734)
    $P736 = $P731."!make"($P735)
.annotate 'line', 117
    .return ($P736)
  control_666:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P737, exception, "payload"
    .return ($P737)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block682"  :anon :subid("44_1275600002.0917") :outer("43_1275600002.0917")
.annotate 'line', 121
    new $P684, "Undef"
    .lex "$ast", $P684
    find_lex $P685, "$/"
    unless_null $P685, vivify_220
    $P685 = root_new ['parrot';'Hash']
  vivify_220:
    set $P686, $P685["quantified_atom"]
    unless_null $P686, vivify_221
    new $P686, "Undef"
  vivify_221:
    $P687 = $P686."ast"()
    store_lex "$ast", $P687
.annotate 'line', 122
    find_lex $P689, "$ws"
    unless $P689, if_688_end
.annotate 'line', 123
    get_hll_global $P690, ["PAST"], "Regex"
.annotate 'line', 125
    get_hll_global $P691, ["PAST"], "Regex"
    $P692 = $P691."new"("ws", "subrule" :named("pasttype"), "method" :named("subtype"))
    find_lex $P693, "$ast"
.annotate 'line', 128
    get_hll_global $P694, ["PAST"], "Regex"
    $P695 = $P694."new"("ws", "subrule" :named("pasttype"), "method" :named("subtype"))
    $P696 = $P690."new"($P692, $P693, $P695, "concat" :named("pasttype"))
.annotate 'line', 123
    store_lex "$ast", $P696
  if_688_end:
.annotate 'line', 132
    get_hll_global $P697, ["PAST"], "Regex"
    find_lex $P698, "$ast"
    find_lex $P699, "$/"
    $P700 = $P697."new"("quant" :named("pasttype"), 1 :named("min"), $P698 :named("sep"), $P699 :named("node"))
    store_lex "$past", $P700
.annotate 'line', 120
    .return ($P700)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<ws>"  :subid("45_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_741
.annotate 'line', 146
    new $P740, 'ExceptionHandler'
    set_addr $P740, control_739
    $P740."handle_types"(57)
    push_eh $P740
    .lex "self", self
    .lex "$/", param_741
.annotate 'line', 147
    new $P742, "Undef"
    .lex "$past", $P742
.annotate 'line', 148
    get_global $P745, "@MODIFIERS"
    unless_null $P745, vivify_224
    $P745 = root_new ['parrot';'ResizablePMCArray']
  vivify_224:
    set $P746, $P745[0]
    unless_null $P746, vivify_225
    $P746 = root_new ['parrot';'Hash']
  vivify_225:
    set $P747, $P746["s"]
    unless_null $P747, vivify_226
    new $P747, "Undef"
  vivify_226:
    if $P747, if_744
    new $P751, "Integer"
    assign $P751, 0
    set $P743, $P751
    goto if_744_end
  if_744:
    get_hll_global $P748, ["PAST"], "Regex"
    find_lex $P749, "$/"
    $P750 = $P748."new"("ws", "subrule" :named("pasttype"), "method" :named("subtype"), $P749 :named("node"))
    set $P743, $P750
  if_744_end:
    store_lex "$past", $P743
.annotate 'line', 151
    find_lex $P752, "$/"
    find_lex $P753, "$past"
    $P754 = $P752."!make"($P753)
.annotate 'line', 146
    .return ($P754)
  control_739:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P755, exception, "payload"
    .return ($P755)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<[ ]>"  :subid("46_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_759
.annotate 'line', 155
    new $P758, 'ExceptionHandler'
    set_addr $P758, control_757
    $P758."handle_types"(57)
    push_eh $P758
    .lex "self", self
    .lex "$/", param_759
.annotate 'line', 156
    find_lex $P760, "$/"
    find_lex $P761, "$/"
    unless_null $P761, vivify_227
    $P761 = root_new ['parrot';'Hash']
  vivify_227:
    set $P762, $P761["nibbler"]
    unless_null $P762, vivify_228
    new $P762, "Undef"
  vivify_228:
    $P763 = $P762."ast"()
    $P764 = $P760."!make"($P763)
.annotate 'line', 155
    .return ($P764)
  control_757:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P765, exception, "payload"
    .return ($P765)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<( )>"  :subid("47_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_769
.annotate 'line', 159
    new $P768, 'ExceptionHandler'
    set_addr $P768, control_767
    $P768."handle_types"(57)
    push_eh $P768
    .lex "self", self
    .lex "$/", param_769
.annotate 'line', 160
    new $P770, "Undef"
    .lex "$subpast", $P770
.annotate 'line', 161
    new $P771, "Undef"
    .lex "$past", $P771
.annotate 'line', 160
    find_lex $P772, "$/"
    unless_null $P772, vivify_229
    $P772 = root_new ['parrot';'Hash']
  vivify_229:
    set $P773, $P772["nibbler"]
    unless_null $P773, vivify_230
    new $P773, "Undef"
  vivify_230:
    $P774 = $P773."ast"()
    $P775 = "buildsub"($P774)
    store_lex "$subpast", $P775
.annotate 'line', 161
    get_hll_global $P776, ["PAST"], "Regex"
    find_lex $P777, "$subpast"
    find_lex $P778, "$/"
    $P779 = $P776."new"($P777, "subrule" :named("pasttype"), "capture" :named("subtype"), $P778 :named("node"))
    store_lex "$past", $P779
.annotate 'line', 163
    find_lex $P780, "$/"
    find_lex $P781, "$past"
    $P782 = $P780."!make"($P781)
.annotate 'line', 159
    .return ($P782)
  control_767:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P783, exception, "payload"
    .return ($P783)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<'>"  :subid("48_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_787
.annotate 'line', 166
    new $P786, 'ExceptionHandler'
    set_addr $P786, control_785
    $P786."handle_types"(57)
    push_eh $P786
    .lex "self", self
    .lex "$/", param_787
.annotate 'line', 167
    new $P788, "Undef"
    .lex "$quote", $P788
.annotate 'line', 169
    new $P789, "Undef"
    .lex "$past", $P789
.annotate 'line', 167
    find_lex $P790, "$/"
    unless_null $P790, vivify_231
    $P790 = root_new ['parrot';'Hash']
  vivify_231:
    set $P791, $P790["quote_EXPR"]
    unless_null $P791, vivify_232
    new $P791, "Undef"
  vivify_232:
    $P792 = $P791."ast"()
    store_lex "$quote", $P792
.annotate 'line', 168
    get_hll_global $P794, ["PAST"], "Val"
    find_lex $P795, "$quote"
    $P796 = $P794."ACCEPTS"($P795)
    unless $P796, if_793_end
    find_lex $P797, "$quote"
    $P798 = $P797."value"()
    store_lex "$quote", $P798
  if_793_end:
.annotate 'line', 169
    get_hll_global $P799, ["PAST"], "Regex"
    find_lex $P800, "$quote"
    find_lex $P801, "$/"
    $P802 = $P799."new"($P800, "literal" :named("pasttype"), $P801 :named("node"))
    store_lex "$past", $P802
.annotate 'line', 170
    find_lex $P803, "$/"
    find_lex $P804, "$past"
    $P805 = $P803."!make"($P804)
.annotate 'line', 166
    .return ($P805)
  control_785:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P806, exception, "payload"
    .return ($P806)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<\">"  :subid("49_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_810
.annotate 'line', 173
    new $P809, 'ExceptionHandler'
    set_addr $P809, control_808
    $P809."handle_types"(57)
    push_eh $P809
    .lex "self", self
    .lex "$/", param_810
.annotate 'line', 174
    new $P811, "Undef"
    .lex "$quote", $P811
.annotate 'line', 176
    new $P812, "Undef"
    .lex "$past", $P812
.annotate 'line', 174
    find_lex $P813, "$/"
    unless_null $P813, vivify_233
    $P813 = root_new ['parrot';'Hash']
  vivify_233:
    set $P814, $P813["quote_EXPR"]
    unless_null $P814, vivify_234
    new $P814, "Undef"
  vivify_234:
    $P815 = $P814."ast"()
    store_lex "$quote", $P815
.annotate 'line', 175
    get_hll_global $P817, ["PAST"], "Val"
    find_lex $P818, "$quote"
    $P819 = $P817."ACCEPTS"($P818)
    unless $P819, if_816_end
    find_lex $P820, "$quote"
    $P821 = $P820."value"()
    store_lex "$quote", $P821
  if_816_end:
.annotate 'line', 176
    get_hll_global $P822, ["PAST"], "Regex"
    find_lex $P823, "$quote"
    find_lex $P824, "$/"
    $P825 = $P822."new"($P823, "literal" :named("pasttype"), $P824 :named("node"))
    store_lex "$past", $P825
.annotate 'line', 177
    find_lex $P826, "$/"
    find_lex $P827, "$past"
    $P828 = $P826."!make"($P827)
.annotate 'line', 173
    .return ($P828)
  control_808:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P829, exception, "payload"
    .return ($P829)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<.>"  :subid("50_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_833
.annotate 'line', 180
    new $P832, 'ExceptionHandler'
    set_addr $P832, control_831
    $P832."handle_types"(57)
    push_eh $P832
    .lex "self", self
    .lex "$/", param_833
.annotate 'line', 181
    new $P834, "Undef"
    .lex "$past", $P834
    get_hll_global $P835, ["PAST"], "Regex"
    find_lex $P836, "$/"
    $P837 = $P835."new"("charclass" :named("pasttype"), "." :named("subtype"), $P836 :named("node"))
    store_lex "$past", $P837
.annotate 'line', 182
    find_lex $P838, "$/"
    find_lex $P839, "$past"
    $P840 = $P838."!make"($P839)
.annotate 'line', 180
    .return ($P840)
  control_831:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P841, exception, "payload"
    .return ($P841)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<^>"  :subid("51_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_845
.annotate 'line', 185
    new $P844, 'ExceptionHandler'
    set_addr $P844, control_843
    $P844."handle_types"(57)
    push_eh $P844
    .lex "self", self
    .lex "$/", param_845
.annotate 'line', 186
    new $P846, "Undef"
    .lex "$past", $P846
    get_hll_global $P847, ["PAST"], "Regex"
    find_lex $P848, "$/"
    $P849 = $P847."new"("anchor" :named("pasttype"), "bos" :named("subtype"), $P848 :named("node"))
    store_lex "$past", $P849
.annotate 'line', 187
    find_lex $P850, "$/"
    find_lex $P851, "$past"
    $P852 = $P850."!make"($P851)
.annotate 'line', 185
    .return ($P852)
  control_843:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P853, exception, "payload"
    .return ($P853)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<^^>"  :subid("52_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_857
.annotate 'line', 190
    new $P856, 'ExceptionHandler'
    set_addr $P856, control_855
    $P856."handle_types"(57)
    push_eh $P856
    .lex "self", self
    .lex "$/", param_857
.annotate 'line', 191
    new $P858, "Undef"
    .lex "$past", $P858
    get_hll_global $P859, ["PAST"], "Regex"
    find_lex $P860, "$/"
    $P861 = $P859."new"("anchor" :named("pasttype"), "bol" :named("subtype"), $P860 :named("node"))
    store_lex "$past", $P861
.annotate 'line', 192
    find_lex $P862, "$/"
    find_lex $P863, "$past"
    $P864 = $P862."!make"($P863)
.annotate 'line', 190
    .return ($P864)
  control_855:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P865, exception, "payload"
    .return ($P865)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<$>"  :subid("53_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_869
.annotate 'line', 195
    new $P868, 'ExceptionHandler'
    set_addr $P868, control_867
    $P868."handle_types"(57)
    push_eh $P868
    .lex "self", self
    .lex "$/", param_869
.annotate 'line', 196
    new $P870, "Undef"
    .lex "$past", $P870
    get_hll_global $P871, ["PAST"], "Regex"
    find_lex $P872, "$/"
    $P873 = $P871."new"("anchor" :named("pasttype"), "eos" :named("subtype"), $P872 :named("node"))
    store_lex "$past", $P873
.annotate 'line', 197
    find_lex $P874, "$/"
    find_lex $P875, "$past"
    $P876 = $P874."!make"($P875)
.annotate 'line', 195
    .return ($P876)
  control_867:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P877, exception, "payload"
    .return ($P877)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<$$>"  :subid("54_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_881
.annotate 'line', 200
    new $P880, 'ExceptionHandler'
    set_addr $P880, control_879
    $P880."handle_types"(57)
    push_eh $P880
    .lex "self", self
    .lex "$/", param_881
.annotate 'line', 201
    new $P882, "Undef"
    .lex "$past", $P882
    get_hll_global $P883, ["PAST"], "Regex"
    find_lex $P884, "$/"
    $P885 = $P883."new"("anchor" :named("pasttype"), "eol" :named("subtype"), $P884 :named("node"))
    store_lex "$past", $P885
.annotate 'line', 202
    find_lex $P886, "$/"
    find_lex $P887, "$past"
    $P888 = $P886."!make"($P887)
.annotate 'line', 200
    .return ($P888)
  control_879:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P889, exception, "payload"
    .return ($P889)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<:::>"  :subid("55_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_893
.annotate 'line', 205
    new $P892, 'ExceptionHandler'
    set_addr $P892, control_891
    $P892."handle_types"(57)
    push_eh $P892
    .lex "self", self
    .lex "$/", param_893
.annotate 'line', 206
    new $P894, "Undef"
    .lex "$past", $P894
    get_hll_global $P895, ["PAST"], "Regex"
    find_lex $P896, "$/"
    $P897 = $P895."new"("cut" :named("pasttype"), $P896 :named("node"))
    store_lex "$past", $P897
.annotate 'line', 207
    find_lex $P898, "$/"
    find_lex $P899, "$past"
    $P900 = $P898."!make"($P899)
.annotate 'line', 205
    .return ($P900)
  control_891:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P901, exception, "payload"
    .return ($P901)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<lwb>"  :subid("56_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_905
.annotate 'line', 210
    new $P904, 'ExceptionHandler'
    set_addr $P904, control_903
    $P904."handle_types"(57)
    push_eh $P904
    .lex "self", self
    .lex "$/", param_905
.annotate 'line', 211
    new $P906, "Undef"
    .lex "$past", $P906
    get_hll_global $P907, ["PAST"], "Regex"
    find_lex $P908, "$/"
    $P909 = $P907."new"("anchor" :named("pasttype"), "lwb" :named("subtype"), $P908 :named("node"))
    store_lex "$past", $P909
.annotate 'line', 212
    find_lex $P910, "$/"
    find_lex $P911, "$past"
    $P912 = $P910."!make"($P911)
.annotate 'line', 210
    .return ($P912)
  control_903:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P913, exception, "payload"
    .return ($P913)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<rwb>"  :subid("57_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_917
.annotate 'line', 215
    new $P916, 'ExceptionHandler'
    set_addr $P916, control_915
    $P916."handle_types"(57)
    push_eh $P916
    .lex "self", self
    .lex "$/", param_917
.annotate 'line', 216
    new $P918, "Undef"
    .lex "$past", $P918
    get_hll_global $P919, ["PAST"], "Regex"
    find_lex $P920, "$/"
    $P921 = $P919."new"("anchor" :named("pasttype"), "rwb" :named("subtype"), $P920 :named("node"))
    store_lex "$past", $P921
.annotate 'line', 217
    find_lex $P922, "$/"
    find_lex $P923, "$past"
    $P924 = $P922."!make"($P923)
.annotate 'line', 215
    .return ($P924)
  control_915:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P925, exception, "payload"
    .return ($P925)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<bs>"  :subid("58_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_929
.annotate 'line', 220
    new $P928, 'ExceptionHandler'
    set_addr $P928, control_927
    $P928."handle_types"(57)
    push_eh $P928
    .lex "self", self
    .lex "$/", param_929
.annotate 'line', 221
    find_lex $P930, "$/"
    find_lex $P931, "$/"
    unless_null $P931, vivify_235
    $P931 = root_new ['parrot';'Hash']
  vivify_235:
    set $P932, $P931["backslash"]
    unless_null $P932, vivify_236
    new $P932, "Undef"
  vivify_236:
    $P933 = $P932."ast"()
    $P934 = $P930."!make"($P933)
.annotate 'line', 220
    .return ($P934)
  control_927:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P935, exception, "payload"
    .return ($P935)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<mod>"  :subid("59_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_939
.annotate 'line', 224
    new $P938, 'ExceptionHandler'
    set_addr $P938, control_937
    $P938."handle_types"(57)
    push_eh $P938
    .lex "self", self
    .lex "$/", param_939
.annotate 'line', 225
    find_lex $P940, "$/"
    find_lex $P941, "$/"
    unless_null $P941, vivify_237
    $P941 = root_new ['parrot';'Hash']
  vivify_237:
    set $P942, $P941["mod_internal"]
    unless_null $P942, vivify_238
    new $P942, "Undef"
  vivify_238:
    $P943 = $P942."ast"()
    $P944 = $P940."!make"($P943)
.annotate 'line', 224
    .return ($P944)
  control_937:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P945, exception, "payload"
    .return ($P945)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<assert>"  :subid("60_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_949
.annotate 'line', 228
    new $P948, 'ExceptionHandler'
    set_addr $P948, control_947
    $P948."handle_types"(57)
    push_eh $P948
    .lex "self", self
    .lex "$/", param_949
.annotate 'line', 229
    find_lex $P950, "$/"
    find_lex $P951, "$/"
    unless_null $P951, vivify_239
    $P951 = root_new ['parrot';'Hash']
  vivify_239:
    set $P952, $P951["assertion"]
    unless_null $P952, vivify_240
    new $P952, "Undef"
  vivify_240:
    $P953 = $P952."ast"()
    $P954 = $P950."!make"($P953)
.annotate 'line', 228
    .return ($P954)
  control_947:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P955, exception, "payload"
    .return ($P955)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<~>"  :subid("61_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_959
.annotate 'line', 232
    new $P958, 'ExceptionHandler'
    set_addr $P958, control_957
    $P958."handle_types"(57)
    push_eh $P958
    .lex "self", self
    .lex "$/", param_959
.annotate 'line', 233
    find_lex $P960, "$/"
    get_hll_global $P961, ["PAST"], "Regex"
.annotate 'line', 234
    find_lex $P962, "$/"
    unless_null $P962, vivify_241
    $P962 = root_new ['parrot';'Hash']
  vivify_241:
    set $P963, $P962["EXPR"]
    unless_null $P963, vivify_242
    new $P963, "Undef"
  vivify_242:
    $P964 = $P963."ast"()
.annotate 'line', 235
    get_hll_global $P965, ["PAST"], "Regex"
.annotate 'line', 236
    find_lex $P966, "$/"
    unless_null $P966, vivify_243
    $P966 = root_new ['parrot';'Hash']
  vivify_243:
    set $P967, $P966["GOAL"]
    unless_null $P967, vivify_244
    new $P967, "Undef"
  vivify_244:
    $P968 = $P967."ast"()
.annotate 'line', 237
    get_hll_global $P969, ["PAST"], "Regex"
    find_lex $P970, "$/"
    unless_null $P970, vivify_245
    $P970 = root_new ['parrot';'Hash']
  vivify_245:
    set $P971, $P970["GOAL"]
    unless_null $P971, vivify_246
    new $P971, "Undef"
  vivify_246:
    set $S972, $P971
    $P973 = $P969."new"("FAILGOAL", $S972, "subrule" :named("pasttype"), "method" :named("subtype"))
    $P974 = $P965."new"($P968, $P973, "alt" :named("pasttype"))
.annotate 'line', 235
    $P975 = $P961."new"($P964, $P974, "concat" :named("pasttype"))
.annotate 'line', 233
    $P976 = $P960."!make"($P975)
.annotate 'line', 232
    .return ($P976)
  control_957:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P977, exception, "payload"
    .return ($P977)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<{*}>"  :subid("62_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_981
.annotate 'line', 245
    new $P980, 'ExceptionHandler'
    set_addr $P980, control_979
    $P980."handle_types"(57)
    push_eh $P980
    .lex "self", self
    .lex "$/", param_981
.annotate 'line', 246
    new $P982, "Undef"
    .lex "$past", $P982
.annotate 'line', 247
    find_lex $P985, "$/"
    unless_null $P985, vivify_247
    $P985 = root_new ['parrot';'Hash']
  vivify_247:
    set $P986, $P985["key"]
    unless_null $P986, vivify_248
    new $P986, "Undef"
  vivify_248:
    if $P986, if_984
    new $P994, "Integer"
    assign $P994, 0
    set $P983, $P994
    goto if_984_end
  if_984:
    get_hll_global $P987, ["PAST"], "Regex"
    find_lex $P988, "$/"
    unless_null $P988, vivify_249
    $P988 = root_new ['parrot';'Hash']
  vivify_249:
    set $P989, $P988["key"]
    unless_null $P989, vivify_250
    $P989 = root_new ['parrot';'ResizablePMCArray']
  vivify_250:
    set $P990, $P989[0]
    unless_null $P990, vivify_251
    new $P990, "Undef"
  vivify_251:
    set $S991, $P990
    find_lex $P992, "$/"
    $P993 = $P987."new"($S991, "reduce" :named("pasttype"), $P992 :named("node"))
    set $P983, $P993
  if_984_end:
    store_lex "$past", $P983
.annotate 'line', 249
    find_lex $P995, "$/"
    find_lex $P996, "$past"
    $P997 = $P995."!make"($P996)
.annotate 'line', 245
    .return ($P997)
  control_979:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P998, exception, "payload"
    .return ($P998)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<var>"  :subid("63_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_1002
.annotate 'line', 252
    new $P1001, 'ExceptionHandler'
    set_addr $P1001, control_1000
    $P1001."handle_types"(57)
    push_eh $P1001
    .lex "self", self
    .lex "$/", param_1002
.annotate 'line', 253
    new $P1003, "Undef"
    .lex "$past", $P1003
.annotate 'line', 254
    new $P1004, "Undef"
    .lex "$name", $P1004
.annotate 'line', 252
    find_lex $P1005, "$past"
.annotate 'line', 254
    find_lex $P1008, "$/"
    unless_null $P1008, vivify_252
    $P1008 = root_new ['parrot';'Hash']
  vivify_252:
    set $P1009, $P1008["pos"]
    unless_null $P1009, vivify_253
    new $P1009, "Undef"
  vivify_253:
    if $P1009, if_1007
    find_lex $P1013, "$/"
    unless_null $P1013, vivify_254
    $P1013 = root_new ['parrot';'Hash']
  vivify_254:
    set $P1014, $P1013["name"]
    unless_null $P1014, vivify_255
    new $P1014, "Undef"
  vivify_255:
    set $S1015, $P1014
    new $P1006, 'String'
    set $P1006, $S1015
    goto if_1007_end
  if_1007:
    find_lex $P1010, "$/"
    unless_null $P1010, vivify_256
    $P1010 = root_new ['parrot';'Hash']
  vivify_256:
    set $P1011, $P1010["pos"]
    unless_null $P1011, vivify_257
    new $P1011, "Undef"
  vivify_257:
    set $N1012, $P1011
    new $P1006, 'Float'
    set $P1006, $N1012
  if_1007_end:
    store_lex "$name", $P1006
.annotate 'line', 255
    find_lex $P1017, "$/"
    unless_null $P1017, vivify_258
    $P1017 = root_new ['parrot';'Hash']
  vivify_258:
    set $P1018, $P1017["quantified_atom"]
    unless_null $P1018, vivify_259
    new $P1018, "Undef"
  vivify_259:
    if $P1018, if_1016
.annotate 'line', 266
    get_hll_global $P1047, ["PAST"], "Regex"
    find_lex $P1048, "$name"
    find_lex $P1049, "$/"
    $P1050 = $P1047."new"("!BACKREF", $P1048, "subrule" :named("pasttype"), "method" :named("subtype"), $P1049 :named("node"))
    store_lex "$past", $P1050
.annotate 'line', 265
    goto if_1016_end
  if_1016:
.annotate 'line', 256
    find_lex $P1019, "$/"
    unless_null $P1019, vivify_260
    $P1019 = root_new ['parrot';'Hash']
  vivify_260:
    set $P1020, $P1019["quantified_atom"]
    unless_null $P1020, vivify_261
    $P1020 = root_new ['parrot';'ResizablePMCArray']
  vivify_261:
    set $P1021, $P1020[0]
    unless_null $P1021, vivify_262
    new $P1021, "Undef"
  vivify_262:
    $P1022 = $P1021."ast"()
    store_lex "$past", $P1022
.annotate 'line', 257
    find_lex $P1026, "$past"
    $S1027 = $P1026."pasttype"()
    iseq $I1028, $S1027, "quant"
    if $I1028, if_1025
    new $P1024, 'Integer'
    set $P1024, $I1028
    goto if_1025_end
  if_1025:
    find_lex $P1029, "$past"
    unless_null $P1029, vivify_263
    $P1029 = root_new ['parrot';'ResizablePMCArray']
  vivify_263:
    set $P1030, $P1029[0]
    unless_null $P1030, vivify_264
    new $P1030, "Undef"
  vivify_264:
    $S1031 = $P1030."pasttype"()
    iseq $I1032, $S1031, "subrule"
    new $P1024, 'Integer'
    set $P1024, $I1032
  if_1025_end:
    if $P1024, if_1023
.annotate 'line', 260
    find_lex $P1037, "$past"
    $S1038 = $P1037."pasttype"()
    iseq $I1039, $S1038, "subrule"
    if $I1039, if_1036
.annotate 'line', 262
    get_hll_global $P1042, ["PAST"], "Regex"
    find_lex $P1043, "$past"
    find_lex $P1044, "$name"
    find_lex $P1045, "$/"
    $P1046 = $P1042."new"($P1043, $P1044 :named("name"), "subcapture" :named("pasttype"), $P1045 :named("node"))
    store_lex "$past", $P1046
.annotate 'line', 261
    goto if_1036_end
  if_1036:
.annotate 'line', 260
    find_lex $P1040, "$past"
    find_lex $P1041, "$name"
    "subrule_alias"($P1040, $P1041)
  if_1036_end:
    goto if_1023_end
  if_1023:
.annotate 'line', 258
    find_lex $P1033, "$past"
    unless_null $P1033, vivify_265
    $P1033 = root_new ['parrot';'ResizablePMCArray']
  vivify_265:
    set $P1034, $P1033[0]
    unless_null $P1034, vivify_266
    new $P1034, "Undef"
  vivify_266:
    find_lex $P1035, "$name"
    "subrule_alias"($P1034, $P1035)
  if_1023_end:
  if_1016_end:
.annotate 'line', 269
    find_lex $P1051, "$/"
    find_lex $P1052, "$past"
    $P1053 = $P1051."!make"($P1052)
.annotate 'line', 252
    .return ($P1053)
  control_1000:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1054, exception, "payload"
    .return ($P1054)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<PIR>"  :subid("64_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_1058
.annotate 'line', 272
    new $P1057, 'ExceptionHandler'
    set_addr $P1057, control_1056
    $P1057."handle_types"(57)
    push_eh $P1057
    .lex "self", self
    .lex "$/", param_1058
.annotate 'line', 273
    find_lex $P1059, "$/"
    get_hll_global $P1060, ["PAST"], "Regex"
.annotate 'line', 274
    get_hll_global $P1061, ["PAST"], "Op"
    find_lex $P1062, "$/"
    unless_null $P1062, vivify_267
    $P1062 = root_new ['parrot';'Hash']
  vivify_267:
    set $P1063, $P1062["pir"]
    unless_null $P1063, vivify_268
    new $P1063, "Undef"
  vivify_268:
    set $S1064, $P1063
    $P1065 = $P1061."new"($S1064 :named("inline"), "inline" :named("pasttype"))
    find_lex $P1066, "$/"
    $P1067 = $P1060."new"($P1065, "pastnode" :named("pasttype"), $P1066 :named("node"))
.annotate 'line', 273
    $P1068 = $P1059."!make"($P1067)
.annotate 'line', 272
    .return ($P1068)
  control_1056:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1069, exception, "payload"
    .return ($P1069)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<w>"  :subid("65_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_1073
.annotate 'line', 280
    new $P1072, 'ExceptionHandler'
    set_addr $P1072, control_1071
    $P1072."handle_types"(57)
    push_eh $P1072
    .lex "self", self
    .lex "$/", param_1073
.annotate 'line', 281
    new $P1074, "Undef"
    .lex "$subtype", $P1074
.annotate 'line', 282
    new $P1075, "Undef"
    .lex "$past", $P1075
.annotate 'line', 281
    find_lex $P1078, "$/"
    unless_null $P1078, vivify_269
    $P1078 = root_new ['parrot';'Hash']
  vivify_269:
    set $P1079, $P1078["sym"]
    unless_null $P1079, vivify_270
    new $P1079, "Undef"
  vivify_270:
    set $S1080, $P1079
    iseq $I1081, $S1080, "n"
    if $I1081, if_1077
    find_lex $P1083, "$/"
    unless_null $P1083, vivify_271
    $P1083 = root_new ['parrot';'Hash']
  vivify_271:
    set $P1084, $P1083["sym"]
    unless_null $P1084, vivify_272
    new $P1084, "Undef"
  vivify_272:
    set $S1085, $P1084
    new $P1076, 'String'
    set $P1076, $S1085
    goto if_1077_end
  if_1077:
    new $P1082, "String"
    assign $P1082, "nl"
    set $P1076, $P1082
  if_1077_end:
    store_lex "$subtype", $P1076
.annotate 'line', 282
    get_hll_global $P1086, ["PAST"], "Regex"
    find_lex $P1087, "$subtype"
    find_lex $P1088, "$/"
    $P1089 = $P1086."new"("charclass" :named("pasttype"), $P1087 :named("subtype"), $P1088 :named("node"))
    store_lex "$past", $P1089
.annotate 'line', 283
    find_lex $P1090, "$/"
    find_lex $P1091, "$past"
    $P1092 = $P1090."!make"($P1091)
.annotate 'line', 280
    .return ($P1092)
  control_1071:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1093, exception, "payload"
    .return ($P1093)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<b>"  :subid("66_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_1097
.annotate 'line', 286
    new $P1096, 'ExceptionHandler'
    set_addr $P1096, control_1095
    $P1096."handle_types"(57)
    push_eh $P1096
    .lex "self", self
    .lex "$/", param_1097
.annotate 'line', 287
    new $P1098, "Undef"
    .lex "$past", $P1098
    get_hll_global $P1099, ["PAST"], "Regex"
.annotate 'line', 288
    find_lex $P1100, "$/"
    unless_null $P1100, vivify_273
    $P1100 = root_new ['parrot';'Hash']
  vivify_273:
    set $P1101, $P1100["sym"]
    unless_null $P1101, vivify_274
    new $P1101, "Undef"
  vivify_274:
    set $S1102, $P1101
    iseq $I1103, $S1102, "B"
    find_lex $P1104, "$/"
    $P1105 = $P1099."new"("\b", "enumcharlist" :named("pasttype"), $I1103 :named("negate"), $P1104 :named("node"))
.annotate 'line', 287
    store_lex "$past", $P1105
.annotate 'line', 289
    find_lex $P1106, "$/"
    find_lex $P1107, "$past"
    $P1108 = $P1106."!make"($P1107)
.annotate 'line', 286
    .return ($P1108)
  control_1095:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1109, exception, "payload"
    .return ($P1109)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<e>"  :subid("67_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_1113
.annotate 'line', 292
    new $P1112, 'ExceptionHandler'
    set_addr $P1112, control_1111
    $P1112."handle_types"(57)
    push_eh $P1112
    .lex "self", self
    .lex "$/", param_1113
.annotate 'line', 293
    new $P1114, "Undef"
    .lex "$past", $P1114
    get_hll_global $P1115, ["PAST"], "Regex"
.annotate 'line', 294
    find_lex $P1116, "$/"
    unless_null $P1116, vivify_275
    $P1116 = root_new ['parrot';'Hash']
  vivify_275:
    set $P1117, $P1116["sym"]
    unless_null $P1117, vivify_276
    new $P1117, "Undef"
  vivify_276:
    set $S1118, $P1117
    iseq $I1119, $S1118, "E"
    find_lex $P1120, "$/"
    $P1121 = $P1115."new"("\e", "enumcharlist" :named("pasttype"), $I1119 :named("negate"), $P1120 :named("node"))
.annotate 'line', 293
    store_lex "$past", $P1121
.annotate 'line', 295
    find_lex $P1122, "$/"
    find_lex $P1123, "$past"
    $P1124 = $P1122."!make"($P1123)
.annotate 'line', 292
    .return ($P1124)
  control_1111:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1125, exception, "payload"
    .return ($P1125)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<f>"  :subid("68_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_1129
.annotate 'line', 298
    new $P1128, 'ExceptionHandler'
    set_addr $P1128, control_1127
    $P1128."handle_types"(57)
    push_eh $P1128
    .lex "self", self
    .lex "$/", param_1129
.annotate 'line', 299
    new $P1130, "Undef"
    .lex "$past", $P1130
    get_hll_global $P1131, ["PAST"], "Regex"
.annotate 'line', 300
    find_lex $P1132, "$/"
    unless_null $P1132, vivify_277
    $P1132 = root_new ['parrot';'Hash']
  vivify_277:
    set $P1133, $P1132["sym"]
    unless_null $P1133, vivify_278
    new $P1133, "Undef"
  vivify_278:
    set $S1134, $P1133
    iseq $I1135, $S1134, "F"
    find_lex $P1136, "$/"
    $P1137 = $P1131."new"("\f", "enumcharlist" :named("pasttype"), $I1135 :named("negate"), $P1136 :named("node"))
.annotate 'line', 299
    store_lex "$past", $P1137
.annotate 'line', 301
    find_lex $P1138, "$/"
    find_lex $P1139, "$past"
    $P1140 = $P1138."!make"($P1139)
.annotate 'line', 298
    .return ($P1140)
  control_1127:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1141, exception, "payload"
    .return ($P1141)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<h>"  :subid("69_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_1145
.annotate 'line', 304
    new $P1144, 'ExceptionHandler'
    set_addr $P1144, control_1143
    $P1144."handle_types"(57)
    push_eh $P1144
    .lex "self", self
    .lex "$/", param_1145
.annotate 'line', 305
    new $P1146, "Undef"
    .lex "$past", $P1146
    get_hll_global $P1147, ["PAST"], "Regex"
.annotate 'line', 306
    find_lex $P1148, "$/"
    unless_null $P1148, vivify_279
    $P1148 = root_new ['parrot';'Hash']
  vivify_279:
    set $P1149, $P1148["sym"]
    unless_null $P1149, vivify_280
    new $P1149, "Undef"
  vivify_280:
    set $S1150, $P1149
    iseq $I1151, $S1150, "H"
    find_lex $P1152, "$/"
    $P1153 = $P1147."new"(unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", "enumcharlist" :named("pasttype"), $I1151 :named("negate"), $P1152 :named("node"))
.annotate 'line', 305
    store_lex "$past", $P1153
.annotate 'line', 307
    find_lex $P1154, "$/"
    find_lex $P1155, "$past"
    $P1156 = $P1154."!make"($P1155)
.annotate 'line', 304
    .return ($P1156)
  control_1143:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1157, exception, "payload"
    .return ($P1157)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<r>"  :subid("70_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_1161
.annotate 'line', 310
    new $P1160, 'ExceptionHandler'
    set_addr $P1160, control_1159
    $P1160."handle_types"(57)
    push_eh $P1160
    .lex "self", self
    .lex "$/", param_1161
.annotate 'line', 311
    new $P1162, "Undef"
    .lex "$past", $P1162
    get_hll_global $P1163, ["PAST"], "Regex"
.annotate 'line', 312
    find_lex $P1164, "$/"
    unless_null $P1164, vivify_281
    $P1164 = root_new ['parrot';'Hash']
  vivify_281:
    set $P1165, $P1164["sym"]
    unless_null $P1165, vivify_282
    new $P1165, "Undef"
  vivify_282:
    set $S1166, $P1165
    iseq $I1167, $S1166, "R"
    find_lex $P1168, "$/"
    $P1169 = $P1163."new"("\r", "enumcharlist" :named("pasttype"), $I1167 :named("negate"), $P1168 :named("node"))
.annotate 'line', 311
    store_lex "$past", $P1169
.annotate 'line', 313
    find_lex $P1170, "$/"
    find_lex $P1171, "$past"
    $P1172 = $P1170."!make"($P1171)
.annotate 'line', 310
    .return ($P1172)
  control_1159:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1173, exception, "payload"
    .return ($P1173)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<t>"  :subid("71_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_1177
.annotate 'line', 316
    new $P1176, 'ExceptionHandler'
    set_addr $P1176, control_1175
    $P1176."handle_types"(57)
    push_eh $P1176
    .lex "self", self
    .lex "$/", param_1177
.annotate 'line', 317
    new $P1178, "Undef"
    .lex "$past", $P1178
    get_hll_global $P1179, ["PAST"], "Regex"
.annotate 'line', 318
    find_lex $P1180, "$/"
    unless_null $P1180, vivify_283
    $P1180 = root_new ['parrot';'Hash']
  vivify_283:
    set $P1181, $P1180["sym"]
    unless_null $P1181, vivify_284
    new $P1181, "Undef"
  vivify_284:
    set $S1182, $P1181
    iseq $I1183, $S1182, "T"
    find_lex $P1184, "$/"
    $P1185 = $P1179."new"("\t", "enumcharlist" :named("pasttype"), $I1183 :named("negate"), $P1184 :named("node"))
.annotate 'line', 317
    store_lex "$past", $P1185
.annotate 'line', 319
    find_lex $P1186, "$/"
    find_lex $P1187, "$past"
    $P1188 = $P1186."!make"($P1187)
.annotate 'line', 316
    .return ($P1188)
  control_1175:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1189, exception, "payload"
    .return ($P1189)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<v>"  :subid("72_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_1193
.annotate 'line', 322
    new $P1192, 'ExceptionHandler'
    set_addr $P1192, control_1191
    $P1192."handle_types"(57)
    push_eh $P1192
    .lex "self", self
    .lex "$/", param_1193
.annotate 'line', 323
    new $P1194, "Undef"
    .lex "$past", $P1194
    get_hll_global $P1195, ["PAST"], "Regex"
.annotate 'line', 325
    find_lex $P1196, "$/"
    unless_null $P1196, vivify_285
    $P1196 = root_new ['parrot';'Hash']
  vivify_285:
    set $P1197, $P1196["sym"]
    unless_null $P1197, vivify_286
    new $P1197, "Undef"
  vivify_286:
    set $S1198, $P1197
    iseq $I1199, $S1198, "V"
    find_lex $P1200, "$/"
    $P1201 = $P1195."new"(unicode:"\n\x{b}\f\r\x{85}\u2028\u2029", "enumcharlist" :named("pasttype"), $I1199 :named("negate"), $P1200 :named("node"))
.annotate 'line', 323
    store_lex "$past", $P1201
.annotate 'line', 326
    find_lex $P1202, "$/"
    find_lex $P1203, "$past"
    $P1204 = $P1202."!make"($P1203)
.annotate 'line', 322
    .return ($P1204)
  control_1191:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1205, exception, "payload"
    .return ($P1205)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<o>"  :subid("73_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_1209
.annotate 'line', 329
    new $P1208, 'ExceptionHandler'
    set_addr $P1208, control_1207
    $P1208."handle_types"(57)
    push_eh $P1208
    .lex "self", self
    .lex "$/", param_1209
.annotate 'line', 330
    new $P1210, "Undef"
    .lex "$octlit", $P1210
.annotate 'line', 331
    get_hll_global $P1211, ["HLL";"Actions"], "ints_to_string"
    find_lex $P1214, "$/"
    unless_null $P1214, vivify_287
    $P1214 = root_new ['parrot';'Hash']
  vivify_287:
    set $P1215, $P1214["octint"]
    unless_null $P1215, vivify_288
    new $P1215, "Undef"
  vivify_288:
    unless $P1215, unless_1213
    set $P1212, $P1215
    goto unless_1213_end
  unless_1213:
    find_lex $P1216, "$/"
    unless_null $P1216, vivify_289
    $P1216 = root_new ['parrot';'Hash']
  vivify_289:
    set $P1217, $P1216["octints"]
    unless_null $P1217, vivify_290
    $P1217 = root_new ['parrot';'Hash']
  vivify_290:
    set $P1218, $P1217["octint"]
    unless_null $P1218, vivify_291
    new $P1218, "Undef"
  vivify_291:
    set $P1212, $P1218
  unless_1213_end:
    $P1219 = $P1211($P1212)
    store_lex "$octlit", $P1219
.annotate 'line', 332
    find_lex $P1220, "$/"
    find_lex $P1223, "$/"
    unless_null $P1223, vivify_292
    $P1223 = root_new ['parrot';'Hash']
  vivify_292:
    set $P1224, $P1223["sym"]
    unless_null $P1224, vivify_293
    new $P1224, "Undef"
  vivify_293:
    set $S1225, $P1224
    iseq $I1226, $S1225, "O"
    if $I1226, if_1222
.annotate 'line', 335
    get_hll_global $P1231, ["PAST"], "Regex"
    find_lex $P1232, "$octlit"
    find_lex $P1233, "$/"
    $P1234 = $P1231."new"($P1232, "literal" :named("pasttype"), $P1233 :named("node"))
    set $P1221, $P1234
.annotate 'line', 332
    goto if_1222_end
  if_1222:
.annotate 'line', 333
    get_hll_global $P1227, ["PAST"], "Regex"
    find_lex $P1228, "$octlit"
    find_lex $P1229, "$/"
    $P1230 = $P1227."new"($P1228, "enumcharlist" :named("pasttype"), 1 :named("negate"), $P1229 :named("node"))
    set $P1221, $P1230
  if_1222_end:
    $P1235 = $P1220."!make"($P1221)
.annotate 'line', 329
    .return ($P1235)
  control_1207:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1236, exception, "payload"
    .return ($P1236)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<x>"  :subid("74_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_1240
.annotate 'line', 338
    new $P1239, 'ExceptionHandler'
    set_addr $P1239, control_1238
    $P1239."handle_types"(57)
    push_eh $P1239
    .lex "self", self
    .lex "$/", param_1240
.annotate 'line', 339
    new $P1241, "Undef"
    .lex "$hexlit", $P1241
.annotate 'line', 340
    get_hll_global $P1242, ["HLL";"Actions"], "ints_to_string"
    find_lex $P1245, "$/"
    unless_null $P1245, vivify_294
    $P1245 = root_new ['parrot';'Hash']
  vivify_294:
    set $P1246, $P1245["hexint"]
    unless_null $P1246, vivify_295
    new $P1246, "Undef"
  vivify_295:
    unless $P1246, unless_1244
    set $P1243, $P1246
    goto unless_1244_end
  unless_1244:
    find_lex $P1247, "$/"
    unless_null $P1247, vivify_296
    $P1247 = root_new ['parrot';'Hash']
  vivify_296:
    set $P1248, $P1247["hexints"]
    unless_null $P1248, vivify_297
    $P1248 = root_new ['parrot';'Hash']
  vivify_297:
    set $P1249, $P1248["hexint"]
    unless_null $P1249, vivify_298
    new $P1249, "Undef"
  vivify_298:
    set $P1243, $P1249
  unless_1244_end:
    $P1250 = $P1242($P1243)
    store_lex "$hexlit", $P1250
.annotate 'line', 341
    find_lex $P1251, "$/"
    find_lex $P1254, "$/"
    unless_null $P1254, vivify_299
    $P1254 = root_new ['parrot';'Hash']
  vivify_299:
    set $P1255, $P1254["sym"]
    unless_null $P1255, vivify_300
    new $P1255, "Undef"
  vivify_300:
    set $S1256, $P1255
    iseq $I1257, $S1256, "X"
    if $I1257, if_1253
.annotate 'line', 344
    get_hll_global $P1262, ["PAST"], "Regex"
    find_lex $P1263, "$hexlit"
    find_lex $P1264, "$/"
    $P1265 = $P1262."new"($P1263, "literal" :named("pasttype"), $P1264 :named("node"))
    set $P1252, $P1265
.annotate 'line', 341
    goto if_1253_end
  if_1253:
.annotate 'line', 342
    get_hll_global $P1258, ["PAST"], "Regex"
    find_lex $P1259, "$hexlit"
    find_lex $P1260, "$/"
    $P1261 = $P1258."new"($P1259, "enumcharlist" :named("pasttype"), 1 :named("negate"), $P1260 :named("node"))
    set $P1252, $P1261
  if_1253_end:
    $P1266 = $P1251."!make"($P1252)
.annotate 'line', 338
    .return ($P1266)
  control_1238:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1267, exception, "payload"
    .return ($P1267)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<c>"  :subid("75_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_1271
.annotate 'line', 347
    new $P1270, 'ExceptionHandler'
    set_addr $P1270, control_1269
    $P1270."handle_types"(57)
    push_eh $P1270
    .lex "self", self
    .lex "$/", param_1271
.annotate 'line', 348
    find_lex $P1272, "$/"
    get_hll_global $P1273, ["PAST"], "Regex"
    find_lex $P1274, "$/"
    unless_null $P1274, vivify_301
    $P1274 = root_new ['parrot';'Hash']
  vivify_301:
    set $P1275, $P1274["charspec"]
    unless_null $P1275, vivify_302
    new $P1275, "Undef"
  vivify_302:
    $P1276 = $P1275."ast"()
    find_lex $P1277, "$/"
    $P1278 = $P1273."new"($P1276, "literal" :named("pasttype"), $P1277 :named("node"))
    $P1279 = $P1272."!make"($P1278)
.annotate 'line', 347
    .return ($P1279)
  control_1269:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1280, exception, "payload"
    .return ($P1280)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<misc>"  :subid("76_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_1284
.annotate 'line', 351
    new $P1283, 'ExceptionHandler'
    set_addr $P1283, control_1282
    $P1283."handle_types"(57)
    push_eh $P1283
    .lex "self", self
    .lex "$/", param_1284
.annotate 'line', 352
    new $P1285, "Undef"
    .lex "$past", $P1285
    get_hll_global $P1286, ["PAST"], "Regex"
    find_lex $P1287, "$/"
    set $S1288, $P1287
    find_lex $P1289, "$/"
    $P1290 = $P1286."new"($S1288, "literal" :named("pasttype"), $P1289 :named("node"))
    store_lex "$past", $P1290
.annotate 'line', 353
    find_lex $P1291, "$/"
    find_lex $P1292, "$past"
    $P1293 = $P1291."!make"($P1292)
.annotate 'line', 351
    .return ($P1293)
  control_1282:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1294, exception, "payload"
    .return ($P1294)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<?>"  :subid("77_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_1298
.annotate 'line', 357
    new $P1297, 'ExceptionHandler'
    set_addr $P1297, control_1296
    $P1297."handle_types"(57)
    push_eh $P1297
    .lex "self", self
    .lex "$/", param_1298
.annotate 'line', 358
    new $P1299, "Undef"
    .lex "$past", $P1299
.annotate 'line', 357
    find_lex $P1300, "$past"
.annotate 'line', 359
    find_lex $P1302, "$/"
    unless_null $P1302, vivify_303
    $P1302 = root_new ['parrot';'Hash']
  vivify_303:
    set $P1303, $P1302["assertion"]
    unless_null $P1303, vivify_304
    new $P1303, "Undef"
  vivify_304:
    if $P1303, if_1301
.annotate 'line', 363
    new $P1308, "Integer"
    assign $P1308, 0
    store_lex "$past", $P1308
    goto if_1301_end
  if_1301:
.annotate 'line', 360
    find_lex $P1304, "$/"
    unless_null $P1304, vivify_305
    $P1304 = root_new ['parrot';'Hash']
  vivify_305:
    set $P1305, $P1304["assertion"]
    unless_null $P1305, vivify_306
    new $P1305, "Undef"
  vivify_306:
    $P1306 = $P1305."ast"()
    store_lex "$past", $P1306
.annotate 'line', 361
    find_lex $P1307, "$past"
    $P1307."subtype"("zerowidth")
  if_1301_end:
.annotate 'line', 364
    find_lex $P1309, "$/"
    find_lex $P1310, "$past"
    $P1311 = $P1309."!make"($P1310)
.annotate 'line', 357
    .return ($P1311)
  control_1296:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1312, exception, "payload"
    .return ($P1312)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<!>"  :subid("78_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_1316
.annotate 'line', 367
    new $P1315, 'ExceptionHandler'
    set_addr $P1315, control_1314
    $P1315."handle_types"(57)
    push_eh $P1315
    .lex "self", self
    .lex "$/", param_1316
.annotate 'line', 368
    new $P1317, "Undef"
    .lex "$past", $P1317
.annotate 'line', 367
    find_lex $P1318, "$past"
.annotate 'line', 369
    find_lex $P1320, "$/"
    unless_null $P1320, vivify_307
    $P1320 = root_new ['parrot';'Hash']
  vivify_307:
    set $P1321, $P1320["assertion"]
    unless_null $P1321, vivify_308
    new $P1321, "Undef"
  vivify_308:
    if $P1321, if_1319
.annotate 'line', 375
    get_hll_global $P1330, ["PAST"], "Regex"
    find_lex $P1331, "$/"
    $P1332 = $P1330."new"("anchor" :named("pasttype"), "fail" :named("subtype"), $P1331 :named("node"))
    store_lex "$past", $P1332
.annotate 'line', 374
    goto if_1319_end
  if_1319:
.annotate 'line', 370
    find_lex $P1322, "$/"
    unless_null $P1322, vivify_309
    $P1322 = root_new ['parrot';'Hash']
  vivify_309:
    set $P1323, $P1322["assertion"]
    unless_null $P1323, vivify_310
    new $P1323, "Undef"
  vivify_310:
    $P1324 = $P1323."ast"()
    store_lex "$past", $P1324
.annotate 'line', 371
    find_lex $P1325, "$past"
    find_lex $P1326, "$past"
    $P1327 = $P1326."negate"()
    isfalse $I1328, $P1327
    $P1325."negate"($I1328)
.annotate 'line', 372
    find_lex $P1329, "$past"
    $P1329."subtype"("zerowidth")
  if_1319_end:
.annotate 'line', 377
    find_lex $P1333, "$/"
    find_lex $P1334, "$past"
    $P1335 = $P1333."!make"($P1334)
.annotate 'line', 367
    .return ($P1335)
  control_1314:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1336, exception, "payload"
    .return ($P1336)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<method>"  :subid("79_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_1340
.annotate 'line', 380
    new $P1339, 'ExceptionHandler'
    set_addr $P1339, control_1338
    $P1339."handle_types"(57)
    push_eh $P1339
    .lex "self", self
    .lex "$/", param_1340
.annotate 'line', 381
    new $P1341, "Undef"
    .lex "$past", $P1341
    find_lex $P1342, "$/"
    unless_null $P1342, vivify_311
    $P1342 = root_new ['parrot';'Hash']
  vivify_311:
    set $P1343, $P1342["assertion"]
    unless_null $P1343, vivify_312
    new $P1343, "Undef"
  vivify_312:
    $P1344 = $P1343."ast"()
    store_lex "$past", $P1344
.annotate 'line', 382
    find_lex $P1345, "$past"
    $P1345."subtype"("method")
.annotate 'line', 383
    find_lex $P1346, "$past"
    $P1346."name"("")
.annotate 'line', 384
    find_lex $P1347, "$/"
    find_lex $P1348, "$past"
    $P1349 = $P1347."!make"($P1348)
.annotate 'line', 380
    .return ($P1349)
  control_1338:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1350, exception, "payload"
    .return ($P1350)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<name>"  :subid("80_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_1354
.annotate 'line', 387
    .const 'Sub' $P1412 = "82_1275600002.0917" 
    capture_lex $P1412
    .const 'Sub' $P1376 = "81_1275600002.0917" 
    capture_lex $P1376
    new $P1353, 'ExceptionHandler'
    set_addr $P1353, control_1352
    $P1353."handle_types"(57)
    push_eh $P1353
    .lex "self", self
    .lex "$/", param_1354
.annotate 'line', 388
    new $P1355, "Undef"
    .lex "$name", $P1355
.annotate 'line', 389
    new $P1356, "Undef"
    .lex "$past", $P1356
.annotate 'line', 388
    find_lex $P1357, "$/"
    unless_null $P1357, vivify_313
    $P1357 = root_new ['parrot';'Hash']
  vivify_313:
    set $P1358, $P1357["longname"]
    unless_null $P1358, vivify_314
    new $P1358, "Undef"
  vivify_314:
    set $S1359, $P1358
    new $P1360, 'String'
    set $P1360, $S1359
    store_lex "$name", $P1360
    find_lex $P1361, "$past"
.annotate 'line', 390
    find_lex $P1363, "$/"
    unless_null $P1363, vivify_315
    $P1363 = root_new ['parrot';'Hash']
  vivify_315:
    set $P1364, $P1363["assertion"]
    unless_null $P1364, vivify_316
    new $P1364, "Undef"
  vivify_316:
    if $P1364, if_1362
.annotate 'line', 394
    find_lex $P1372, "$name"
    set $S1373, $P1372
    iseq $I1374, $S1373, "sym"
    if $I1374, if_1371
.annotate 'line', 410
    get_hll_global $P1386, ["PAST"], "Regex"
    find_lex $P1387, "$name"
    find_lex $P1388, "$name"
    find_lex $P1389, "$/"
    $P1390 = $P1386."new"($P1387, $P1388 :named("name"), "subrule" :named("pasttype"), "capture" :named("subtype"), $P1389 :named("node"))
    store_lex "$past", $P1390
.annotate 'line', 412
    find_lex $P1392, "$/"
    unless_null $P1392, vivify_317
    $P1392 = root_new ['parrot';'Hash']
  vivify_317:
    set $P1393, $P1392["nibbler"]
    unless_null $P1393, vivify_318
    new $P1393, "Undef"
  vivify_318:
    if $P1393, if_1391
.annotate 'line', 415
    find_lex $P1401, "$/"
    unless_null $P1401, vivify_319
    $P1401 = root_new ['parrot';'Hash']
  vivify_319:
    set $P1402, $P1401["arglist"]
    unless_null $P1402, vivify_320
    new $P1402, "Undef"
  vivify_320:
    unless $P1402, if_1400_end
.annotate 'line', 416
    find_lex $P1404, "$/"
    unless_null $P1404, vivify_321
    $P1404 = root_new ['parrot';'Hash']
  vivify_321:
    set $P1405, $P1404["arglist"]
    unless_null $P1405, vivify_322
    $P1405 = root_new ['parrot';'ResizablePMCArray']
  vivify_322:
    set $P1406, $P1405[0]
    unless_null $P1406, vivify_323
    new $P1406, "Undef"
  vivify_323:
    $P1407 = $P1406."ast"()
    $P1408 = $P1407."list"()
    defined $I1409, $P1408
    unless $I1409, for_undef_324
    iter $P1403, $P1408
    new $P1418, 'ExceptionHandler'
    set_addr $P1418, loop1417_handler
    $P1418."handle_types"(64, 66, 65)
    push_eh $P1418
  loop1417_test:
    unless $P1403, loop1417_done
    shift $P1410, $P1403
  loop1417_redo:
    .const 'Sub' $P1412 = "82_1275600002.0917" 
    capture_lex $P1412
    $P1412($P1410)
  loop1417_next:
    goto loop1417_test
  loop1417_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1419, exception, 'type'
    eq $P1419, 64, loop1417_next
    eq $P1419, 66, loop1417_redo
  loop1417_done:
    pop_eh 
  for_undef_324:
  if_1400_end:
.annotate 'line', 415
    goto if_1391_end
  if_1391:
.annotate 'line', 413
    find_lex $P1394, "$past"
    find_lex $P1395, "$/"
    unless_null $P1395, vivify_325
    $P1395 = root_new ['parrot';'Hash']
  vivify_325:
    set $P1396, $P1395["nibbler"]
    unless_null $P1396, vivify_326
    $P1396 = root_new ['parrot';'ResizablePMCArray']
  vivify_326:
    set $P1397, $P1396[0]
    unless_null $P1397, vivify_327
    new $P1397, "Undef"
  vivify_327:
    $P1398 = $P1397."ast"()
    $P1399 = "buildsub"($P1398)
    $P1394."push"($P1399)
  if_1391_end:
.annotate 'line', 409
    goto if_1371_end
  if_1371:
.annotate 'line', 394
    .const 'Sub' $P1376 = "81_1275600002.0917" 
    capture_lex $P1376
    $P1376()
  if_1371_end:
    goto if_1362_end
  if_1362:
.annotate 'line', 391
    find_lex $P1365, "$/"
    unless_null $P1365, vivify_328
    $P1365 = root_new ['parrot';'Hash']
  vivify_328:
    set $P1366, $P1365["assertion"]
    unless_null $P1366, vivify_329
    $P1366 = root_new ['parrot';'ResizablePMCArray']
  vivify_329:
    set $P1367, $P1366[0]
    unless_null $P1367, vivify_330
    new $P1367, "Undef"
  vivify_330:
    $P1368 = $P1367."ast"()
    store_lex "$past", $P1368
.annotate 'line', 392
    find_lex $P1369, "$past"
    find_lex $P1370, "$name"
    "subrule_alias"($P1369, $P1370)
  if_1362_end:
.annotate 'line', 419
    find_lex $P1420, "$/"
    find_lex $P1421, "$past"
    $P1422 = $P1420."!make"($P1421)
.annotate 'line', 387
    .return ($P1422)
  control_1352:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1423, exception, "payload"
    .return ($P1423)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1411"  :anon :subid("82_1275600002.0917") :outer("80_1275600002.0917")
    .param pmc param_1413
.annotate 'line', 416
    .lex "$_", param_1413
    find_lex $P1414, "$past"
    find_lex $P1415, "$_"
    $P1416 = $P1414."push"($P1415)
    .return ($P1416)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1375"  :anon :subid("81_1275600002.0917") :outer("80_1275600002.0917")
.annotate 'line', 395
    new $P1377, "Undef"
    .lex "$regexsym", $P1377

            $P0 = get_global '$REGEXNAME'
            $S0 = $P0
            $I0 = index $S0, ':sym<'
            add $I0, 5
            $S0 = substr $S0, $I0
            $S0 = chopn $S0, 1
            $P1378 = box $S0
        
    store_lex "$regexsym", $P1378
.annotate 'line', 404
    get_hll_global $P1379, ["PAST"], "Regex"
.annotate 'line', 405
    get_hll_global $P1380, ["PAST"], "Regex"
    find_lex $P1381, "$regexsym"
    $P1382 = $P1380."new"($P1381, "literal" :named("pasttype"))
    find_lex $P1383, "$name"
    find_lex $P1384, "$/"
    $P1385 = $P1379."new"($P1382, $P1383 :named("name"), "subcapture" :named("pasttype"), $P1384 :named("node"))
.annotate 'line', 404
    store_lex "$past", $P1385
.annotate 'line', 394
    .return ($P1385)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<[>"  :subid("83_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_1427
.annotate 'line', 422
    .const 'Sub' $P1462 = "84_1275600002.0917" 
    capture_lex $P1462
    new $P1426, 'ExceptionHandler'
    set_addr $P1426, control_1425
    $P1426."handle_types"(57)
    push_eh $P1426
    .lex "self", self
    .lex "$/", param_1427
.annotate 'line', 423
    new $P1428, "Undef"
    .lex "$clist", $P1428
.annotate 'line', 424
    new $P1429, "Undef"
    .lex "$past", $P1429
.annotate 'line', 433
    new $P1430, "Undef"
    .lex "$i", $P1430
.annotate 'line', 434
    new $P1431, "Undef"
    .lex "$n", $P1431
.annotate 'line', 423
    find_lex $P1432, "$/"
    unless_null $P1432, vivify_331
    $P1432 = root_new ['parrot';'Hash']
  vivify_331:
    set $P1433, $P1432["cclass_elem"]
    unless_null $P1433, vivify_332
    new $P1433, "Undef"
  vivify_332:
    store_lex "$clist", $P1433
.annotate 'line', 424
    find_lex $P1434, "$clist"
    unless_null $P1434, vivify_333
    $P1434 = root_new ['parrot';'ResizablePMCArray']
  vivify_333:
    set $P1435, $P1434[0]
    unless_null $P1435, vivify_334
    new $P1435, "Undef"
  vivify_334:
    $P1436 = $P1435."ast"()
    store_lex "$past", $P1436
.annotate 'line', 425
    find_lex $P1440, "$past"
    $P1441 = $P1440."negate"()
    if $P1441, if_1439
    set $P1438, $P1441
    goto if_1439_end
  if_1439:
    find_lex $P1442, "$past"
    $S1443 = $P1442."pasttype"()
    iseq $I1444, $S1443, "subrule"
    new $P1438, 'Integer'
    set $P1438, $I1444
  if_1439_end:
    unless $P1438, if_1437_end
.annotate 'line', 426
    find_lex $P1445, "$past"
    $P1445."subtype"("zerowidth")
.annotate 'line', 427
    get_hll_global $P1446, ["PAST"], "Regex"
    find_lex $P1447, "$past"
.annotate 'line', 429
    get_hll_global $P1448, ["PAST"], "Regex"
    $P1449 = $P1448."new"("charclass" :named("pasttype"), "." :named("subtype"))
    find_lex $P1450, "$/"
    $P1451 = $P1446."new"($P1447, $P1449, $P1450 :named("node"))
.annotate 'line', 427
    store_lex "$past", $P1451
  if_1437_end:
.annotate 'line', 433
    new $P1452, "Integer"
    assign $P1452, 1
    store_lex "$i", $P1452
.annotate 'line', 434
    find_lex $P1453, "$clist"
    set $N1454, $P1453
    new $P1455, 'Float'
    set $P1455, $N1454
    store_lex "$n", $P1455
.annotate 'line', 435
    new $P1486, 'ExceptionHandler'
    set_addr $P1486, loop1485_handler
    $P1486."handle_types"(64, 66, 65)
    push_eh $P1486
  loop1485_test:
    find_lex $P1456, "$i"
    set $N1457, $P1456
    find_lex $P1458, "$n"
    set $N1459, $P1458
    islt $I1460, $N1457, $N1459
    unless $I1460, loop1485_done
  loop1485_redo:
    .const 'Sub' $P1462 = "84_1275600002.0917" 
    capture_lex $P1462
    $P1462()
  loop1485_next:
    goto loop1485_test
  loop1485_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1487, exception, 'type'
    eq $P1487, 64, loop1485_next
    eq $P1487, 66, loop1485_redo
  loop1485_done:
    pop_eh 
.annotate 'line', 446
    find_lex $P1488, "$/"
    find_lex $P1489, "$past"
    $P1490 = $P1488."!make"($P1489)
.annotate 'line', 422
    .return ($P1490)
  control_1425:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1491, exception, "payload"
    .return ($P1491)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1461"  :anon :subid("84_1275600002.0917") :outer("83_1275600002.0917")
.annotate 'line', 436
    new $P1463, "Undef"
    .lex "$ast", $P1463
    find_lex $P1464, "$i"
    set $I1465, $P1464
    find_lex $P1466, "$clist"
    unless_null $P1466, vivify_335
    $P1466 = root_new ['parrot';'ResizablePMCArray']
  vivify_335:
    set $P1467, $P1466[$I1465]
    unless_null $P1467, vivify_336
    new $P1467, "Undef"
  vivify_336:
    $P1468 = $P1467."ast"()
    store_lex "$ast", $P1468
.annotate 'line', 437
    find_lex $P1470, "$ast"
    $P1471 = $P1470."negate"()
    if $P1471, if_1469
.annotate 'line', 442
    get_hll_global $P1478, ["PAST"], "Regex"
    find_lex $P1479, "$past"
    find_lex $P1480, "$ast"
    find_lex $P1481, "$/"
    $P1482 = $P1478."new"($P1479, $P1480, "alt" :named("pasttype"), $P1481 :named("node"))
    store_lex "$past", $P1482
.annotate 'line', 441
    goto if_1469_end
  if_1469:
.annotate 'line', 438
    find_lex $P1472, "$ast"
    $P1472."subtype"("zerowidth")
.annotate 'line', 439
    get_hll_global $P1473, ["PAST"], "Regex"
    find_lex $P1474, "$ast"
    find_lex $P1475, "$past"
    find_lex $P1476, "$/"
    $P1477 = $P1473."new"($P1474, $P1475, "concat" :named("pasttype"), $P1476 :named("node"))
    store_lex "$past", $P1477
  if_1469_end:
.annotate 'line', 444
    find_lex $P1483, "$i"
    add $P1484, $P1483, 1
    store_lex "$i", $P1484
.annotate 'line', 435
    .return ($P1484)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "cclass_elem"  :subid("85_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_1495
.annotate 'line', 449
    .const 'Sub' $P1520 = "87_1275600002.0917" 
    capture_lex $P1520
    .const 'Sub' $P1504 = "86_1275600002.0917" 
    capture_lex $P1504
    new $P1494, 'ExceptionHandler'
    set_addr $P1494, control_1493
    $P1494."handle_types"(57)
    push_eh $P1494
    .lex "self", self
    .lex "$/", param_1495
.annotate 'line', 450
    new $P1496, "Undef"
    .lex "$str", $P1496
.annotate 'line', 451
    new $P1497, "Undef"
    .lex "$past", $P1497
.annotate 'line', 450
    new $P1498, "String"
    assign $P1498, ""
    store_lex "$str", $P1498
    find_lex $P1499, "$past"
.annotate 'line', 452
    find_lex $P1501, "$/"
    unless_null $P1501, vivify_337
    $P1501 = root_new ['parrot';'Hash']
  vivify_337:
    set $P1502, $P1501["name"]
    unless_null $P1502, vivify_338
    new $P1502, "Undef"
  vivify_338:
    if $P1502, if_1500
.annotate 'line', 456
    find_lex $P1515, "$/"
    unless_null $P1515, vivify_339
    $P1515 = root_new ['parrot';'Hash']
  vivify_339:
    set $P1516, $P1515["charspec"]
    unless_null $P1516, vivify_340
    new $P1516, "Undef"
  vivify_340:
    defined $I1517, $P1516
    unless $I1517, for_undef_341
    iter $P1514, $P1516
    new $P1546, 'ExceptionHandler'
    set_addr $P1546, loop1545_handler
    $P1546."handle_types"(64, 66, 65)
    push_eh $P1546
  loop1545_test:
    unless $P1514, loop1545_done
    shift $P1518, $P1514
  loop1545_redo:
    .const 'Sub' $P1520 = "87_1275600002.0917" 
    capture_lex $P1520
    $P1520($P1518)
  loop1545_next:
    goto loop1545_test
  loop1545_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1547, exception, 'type'
    eq $P1547, 64, loop1545_next
    eq $P1547, 66, loop1545_redo
  loop1545_done:
    pop_eh 
  for_undef_341:
.annotate 'line', 481
    get_hll_global $P1548, ["PAST"], "Regex"
    find_lex $P1549, "$str"
    find_lex $P1550, "$/"
    $P1551 = $P1548."new"($P1549, "enumcharlist" :named("pasttype"), $P1550 :named("node"))
    store_lex "$past", $P1551
.annotate 'line', 455
    goto if_1500_end
  if_1500:
.annotate 'line', 452
    .const 'Sub' $P1504 = "86_1275600002.0917" 
    capture_lex $P1504
    $P1504()
  if_1500_end:
.annotate 'line', 483
    find_lex $P1552, "$past"
    find_lex $P1553, "$/"
    unless_null $P1553, vivify_353
    $P1553 = root_new ['parrot';'Hash']
  vivify_353:
    set $P1554, $P1553["sign"]
    unless_null $P1554, vivify_354
    new $P1554, "Undef"
  vivify_354:
    set $S1555, $P1554
    iseq $I1556, $S1555, "-"
    $P1552."negate"($I1556)
.annotate 'line', 484
    find_lex $P1557, "$/"
    find_lex $P1558, "$past"
    $P1559 = $P1557."!make"($P1558)
.annotate 'line', 449
    .return ($P1559)
  control_1493:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1560, exception, "payload"
    .return ($P1560)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1519"  :anon :subid("87_1275600002.0917") :outer("85_1275600002.0917")
    .param pmc param_1521
.annotate 'line', 456
    .const 'Sub' $P1527 = "88_1275600002.0917" 
    capture_lex $P1527
    .lex "$_", param_1521
.annotate 'line', 457
    find_lex $P1524, "$_"
    unless_null $P1524, vivify_342
    $P1524 = root_new ['parrot';'ResizablePMCArray']
  vivify_342:
    set $P1525, $P1524[1]
    unless_null $P1525, vivify_343
    new $P1525, "Undef"
  vivify_343:
    if $P1525, if_1523
.annotate 'line', 479
    find_lex $P1541, "$str"
    find_lex $P1542, "$_"
    unless_null $P1542, vivify_344
    $P1542 = root_new ['parrot';'ResizablePMCArray']
  vivify_344:
    set $P1543, $P1542[0]
    unless_null $P1543, vivify_345
    new $P1543, "Undef"
  vivify_345:
    concat $P1544, $P1541, $P1543
    store_lex "$str", $P1544
    set $P1522, $P1544
.annotate 'line', 457
    goto if_1523_end
  if_1523:
    .const 'Sub' $P1527 = "88_1275600002.0917" 
    capture_lex $P1527
    $P1540 = $P1527()
    set $P1522, $P1540
  if_1523_end:
.annotate 'line', 456
    .return ($P1522)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1526"  :anon :subid("88_1275600002.0917") :outer("87_1275600002.0917")
.annotate 'line', 458
    new $P1528, "Undef"
    .lex "$a", $P1528
.annotate 'line', 459
    new $P1529, "Undef"
    .lex "$b", $P1529
.annotate 'line', 460
    new $P1530, "Undef"
    .lex "$c", $P1530
.annotate 'line', 458
    find_lex $P1531, "$_"
    unless_null $P1531, vivify_346
    $P1531 = root_new ['parrot';'ResizablePMCArray']
  vivify_346:
    set $P1532, $P1531[0]
    unless_null $P1532, vivify_347
    new $P1532, "Undef"
  vivify_347:
    store_lex "$a", $P1532
.annotate 'line', 459
    find_lex $P1533, "$_"
    unless_null $P1533, vivify_348
    $P1533 = root_new ['parrot';'ResizablePMCArray']
  vivify_348:
    set $P1534, $P1533[1]
    unless_null $P1534, vivify_349
    $P1534 = root_new ['parrot';'ResizablePMCArray']
  vivify_349:
    set $P1535, $P1534[0]
    unless_null $P1535, vivify_350
    new $P1535, "Undef"
  vivify_350:
    store_lex "$b", $P1535
.annotate 'line', 460

                             $P0 = find_lex '$a'
                             $S0 = $P0
                             $I0 = ord $S0
                             $P1 = find_lex '$b'
                             $S1 = $P1
                             $I1 = ord $S1
                             $S2 = ''
                           cclass_loop:
                             if $I0 > $I1 goto cclass_done
                             $S0 = chr $I0
                             $S2 .= $S0
                             inc $I0
                             goto cclass_loop
                           cclass_done:
                             $P1536 = box $S2
                         
    store_lex "$c", $P1536
.annotate 'line', 477
    find_lex $P1537, "$str"
    find_lex $P1538, "$c"
    concat $P1539, $P1537, $P1538
    store_lex "$str", $P1539
.annotate 'line', 457
    .return ($P1539)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1503"  :anon :subid("86_1275600002.0917") :outer("85_1275600002.0917")
.annotate 'line', 453
    new $P1505, "Undef"
    .lex "$name", $P1505
    find_lex $P1506, "$/"
    unless_null $P1506, vivify_351
    $P1506 = root_new ['parrot';'Hash']
  vivify_351:
    set $P1507, $P1506["name"]
    unless_null $P1507, vivify_352
    new $P1507, "Undef"
  vivify_352:
    set $S1508, $P1507
    new $P1509, 'String'
    set $P1509, $S1508
    store_lex "$name", $P1509
.annotate 'line', 454
    get_hll_global $P1510, ["PAST"], "Regex"
    find_lex $P1511, "$name"
    find_lex $P1512, "$/"
    $P1513 = $P1510."new"($P1511, "subrule" :named("pasttype"), "method" :named("subtype"), $P1512 :named("node"))
    store_lex "$past", $P1513
.annotate 'line', 452
    .return ($P1513)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "mod_internal"  :subid("89_1275600002.0917") :method :outer("11_1275600002.0917")
    .param pmc param_1564
.annotate 'line', 487
    new $P1563, 'ExceptionHandler'
    set_addr $P1563, control_1562
    $P1563."handle_types"(57)
    push_eh $P1563
    .lex "self", self
    .lex "$/", param_1564
.annotate 'line', 488
    $P1565 = root_new ['parrot';'Hash']
    .lex "%mods", $P1565
.annotate 'line', 489
    new $P1566, "Undef"
    .lex "$n", $P1566
.annotate 'line', 488
    get_global $P1567, "@MODIFIERS"
    unless_null $P1567, vivify_355
    $P1567 = root_new ['parrot';'ResizablePMCArray']
  vivify_355:
    set $P1568, $P1567[0]
    unless_null $P1568, vivify_356
    new $P1568, "Undef"
  vivify_356:
    store_lex "%mods", $P1568
.annotate 'line', 489
    find_lex $P1571, "$/"
    unless_null $P1571, vivify_357
    $P1571 = root_new ['parrot';'Hash']
  vivify_357:
    set $P1572, $P1571["n"]
    unless_null $P1572, vivify_358
    $P1572 = root_new ['parrot';'ResizablePMCArray']
  vivify_358:
    set $P1573, $P1572[0]
    unless_null $P1573, vivify_359
    new $P1573, "Undef"
  vivify_359:
    set $S1574, $P1573
    isgt $I1575, $S1574, ""
    if $I1575, if_1570
    new $P1580, "Integer"
    assign $P1580, 1
    set $P1569, $P1580
    goto if_1570_end
  if_1570:
    find_lex $P1576, "$/"
    unless_null $P1576, vivify_360
    $P1576 = root_new ['parrot';'Hash']
  vivify_360:
    set $P1577, $P1576["n"]
    unless_null $P1577, vivify_361
    $P1577 = root_new ['parrot';'ResizablePMCArray']
  vivify_361:
    set $P1578, $P1577[0]
    unless_null $P1578, vivify_362
    new $P1578, "Undef"
  vivify_362:
    set $N1579, $P1578
    new $P1569, 'Float'
    set $P1569, $N1579
  if_1570_end:
    store_lex "$n", $P1569
.annotate 'line', 490
    find_lex $P1581, "$n"
    find_lex $P1582, "$/"
    unless_null $P1582, vivify_363
    $P1582 = root_new ['parrot';'Hash']
  vivify_363:
    set $P1583, $P1582["mod_ident"]
    unless_null $P1583, vivify_364
    $P1583 = root_new ['parrot';'Hash']
  vivify_364:
    set $P1584, $P1583["sym"]
    unless_null $P1584, vivify_365
    new $P1584, "Undef"
  vivify_365:
    set $S1585, $P1584
    find_lex $P1586, "%mods"
    unless_null $P1586, vivify_366
    $P1586 = root_new ['parrot';'Hash']
    store_lex "%mods", $P1586
  vivify_366:
    set $P1586[$S1585], $P1581
.annotate 'line', 491
    find_lex $P1587, "$/"
    $P1588 = $P1587."!make"(0)
.annotate 'line', 487
    .return ($P1588)
  control_1562:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1589, exception, "payload"
    .return ($P1589)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1594" :load :anon :subid("90_1275600002.0917")
.annotate 'line', 4
    .const 'Sub' $P1596 = "11_1275600002.0917" 
    $P1597 = $P1596()
    .return ($P1597)
.end


.namespace []
.sub "_block1600" :load :anon :subid("91_1275600002.0917")
.annotate 'line', 1
    .const 'Sub' $P1602 = "10_1275600002.0917" 
    $P1603 = $P1602()
    .return ($P1603)
.end

# .include 'src/cheats/p6regex-grammar.pir'

.namespace ['Regex';'P6Regex';'Compiler']

.sub '' :anon :load :init
    .local pmc p6meta, p6regex
    p6meta = get_hll_global 'P6metaclass'
    p6regex = p6meta.'new_class'('Regex::P6Regex::Compiler', 'parent'=>'HLL::Compiler')
    p6regex.'language'('Regex::P6Regex')
    $P0 = get_hll_global ['Regex';'P6Regex'], 'Grammar'
    p6regex.'parsegrammar'($P0)
    $P0 = get_hll_global ['Regex';'P6Regex'], 'Actions'
    p6regex.'parseactions'($P0)
.end


.sub 'main' :main
    .param pmc args_str

    $P0 = compreg 'Regex::P6Regex'
    $P1 = $P0.'command_line'(args_str, 'encoding'=>'utf8', 'transcode'=>'ascii iso-8859-1')
    exit 0
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
