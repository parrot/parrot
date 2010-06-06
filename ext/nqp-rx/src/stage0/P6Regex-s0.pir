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
.sub "_block11"  :anon :subid("10_1275811476.7961")
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
    $P588 = $P14()
.annotate 'line', 1
    .return ($P588)
    .const 'Sub' $P590 = "159_1275811476.7961" 
    .return ($P590)
.end


.namespace []
.sub "" :load :init :subid("post160") :outer("10_1275811476.7961")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1275811476.7961" 
    .local pmc block
    set block, $P12
    $P593 = get_root_global ["parrot"], "P6metaclass"
    $P593."new_class"("Regex::P6Regex::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block13"  :subid("11_1275811476.7961") :outer("10_1275811476.7961")
.annotate 'line', 3
    .const 'Sub' $P576 = "156_1275811476.7961" 
    capture_lex $P576
    .const 'Sub' $P568 = "154_1275811476.7961" 
    capture_lex $P568
    .const 'Sub' $P560 = "152_1275811476.7961" 
    capture_lex $P560
    .const 'Sub' $P539 = "147_1275811476.7961" 
    capture_lex $P539
    .const 'Sub' $P504 = "141_1275811476.7961" 
    capture_lex $P504
    .const 'Sub' $P492 = "138_1275811476.7961" 
    capture_lex $P492
    .const 'Sub' $P479 = "135_1275811476.7961" 
    capture_lex $P479
    .const 'Sub' $P473 = "133_1275811476.7961" 
    capture_lex $P473
    .const 'Sub' $P462 = "130_1275811476.7961" 
    capture_lex $P462
    .const 'Sub' $P451 = "127_1275811476.7961" 
    capture_lex $P451
    .const 'Sub' $P442 = "123_1275811476.7961" 
    capture_lex $P442
    .const 'Sub' $P436 = "121_1275811476.7961" 
    capture_lex $P436
    .const 'Sub' $P430 = "119_1275811476.7961" 
    capture_lex $P430
    .const 'Sub' $P424 = "117_1275811476.7961" 
    capture_lex $P424
    .const 'Sub' $P418 = "115_1275811476.7961" 
    capture_lex $P418
    .const 'Sub' $P410 = "113_1275811476.7961" 
    capture_lex $P410
    .const 'Sub' $P399 = "111_1275811476.7961" 
    capture_lex $P399
    .const 'Sub' $P388 = "109_1275811476.7961" 
    capture_lex $P388
    .const 'Sub' $P382 = "107_1275811476.7961" 
    capture_lex $P382
    .const 'Sub' $P376 = "105_1275811476.7961" 
    capture_lex $P376
    .const 'Sub' $P370 = "103_1275811476.7961" 
    capture_lex $P370
    .const 'Sub' $P364 = "101_1275811476.7961" 
    capture_lex $P364
    .const 'Sub' $P358 = "99_1275811476.7961" 
    capture_lex $P358
    .const 'Sub' $P352 = "97_1275811476.7961" 
    capture_lex $P352
    .const 'Sub' $P346 = "95_1275811476.7961" 
    capture_lex $P346
    .const 'Sub' $P340 = "93_1275811476.7961" 
    capture_lex $P340
    .const 'Sub' $P328 = "89_1275811476.7961" 
    capture_lex $P328
    .const 'Sub' $P316 = "87_1275811476.7961" 
    capture_lex $P316
    .const 'Sub' $P309 = "85_1275811476.7961" 
    capture_lex $P309
    .const 'Sub' $P292 = "83_1275811476.7961" 
    capture_lex $P292
    .const 'Sub' $P285 = "81_1275811476.7961" 
    capture_lex $P285
    .const 'Sub' $P279 = "79_1275811476.7961" 
    capture_lex $P279
    .const 'Sub' $P273 = "77_1275811476.7961" 
    capture_lex $P273
    .const 'Sub' $P266 = "75_1275811476.7961" 
    capture_lex $P266
    .const 'Sub' $P259 = "73_1275811476.7961" 
    capture_lex $P259
    .const 'Sub' $P252 = "71_1275811476.7961" 
    capture_lex $P252
    .const 'Sub' $P245 = "69_1275811476.7961" 
    capture_lex $P245
    .const 'Sub' $P239 = "67_1275811476.7961" 
    capture_lex $P239
    .const 'Sub' $P233 = "65_1275811476.7961" 
    capture_lex $P233
    .const 'Sub' $P227 = "63_1275811476.7961" 
    capture_lex $P227
    .const 'Sub' $P221 = "61_1275811476.7961" 
    capture_lex $P221
    .const 'Sub' $P215 = "59_1275811476.7961" 
    capture_lex $P215
    .const 'Sub' $P210 = "57_1275811476.7961" 
    capture_lex $P210
    .const 'Sub' $P205 = "55_1275811476.7961" 
    capture_lex $P205
    .const 'Sub' $P199 = "53_1275811476.7961" 
    capture_lex $P199
    .const 'Sub' $P193 = "51_1275811476.7961" 
    capture_lex $P193
    .const 'Sub' $P187 = "49_1275811476.7961" 
    capture_lex $P187
    .const 'Sub' $P171 = "44_1275811476.7961" 
    capture_lex $P171
    .const 'Sub' $P155 = "42_1275811476.7961" 
    capture_lex $P155
    .const 'Sub' $P148 = "40_1275811476.7961" 
    capture_lex $P148
    .const 'Sub' $P141 = "38_1275811476.7961" 
    capture_lex $P141
    .const 'Sub' $P134 = "36_1275811476.7961" 
    capture_lex $P134
    .const 'Sub' $P115 = "31_1275811476.7961" 
    capture_lex $P115
    .const 'Sub' $P102 = "28_1275811476.7961" 
    capture_lex $P102
    .const 'Sub' $P95 = "26_1275811476.7961" 
    capture_lex $P95
    .const 'Sub' $P83 = "24_1275811476.7961" 
    capture_lex $P83
    .const 'Sub' $P76 = "22_1275811476.7961" 
    capture_lex $P76
    .const 'Sub' $P63 = "20_1275811476.7961" 
    capture_lex $P63
    .const 'Sub' $P56 = "18_1275811476.7961" 
    capture_lex $P56
    .const 'Sub' $P46 = "15_1275811476.7961" 
    capture_lex $P46
    .const 'Sub' $P38 = "13_1275811476.7961" 
    capture_lex $P38
    .const 'Sub' $P15 = "12_1275811476.7961" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    .const 'Sub' $P576 = "156_1275811476.7961" 
    capture_lex $P576
    .return ($P576)
    .const 'Sub' $P585 = "158_1275811476.7961" 
    .return ($P585)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.include "except_types.pasm"
.sub "obs"  :subid("12_1275811476.7961") :method :outer("11_1275811476.7961")
    .param pmc param_18
    .param pmc param_19
    .param pmc param_20 :optional
    .param int has_param_20 :opt_flag
.annotate 'line', 3
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(.CONTROL_RETURN)
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
.sub "ws"  :subid("13_1275811476.7961") :method :outer("11_1275811476.7961")
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
.sub "!PREFIX__ws"  :subid("14_1275811476.7961") :method
.annotate 'line', 3
    new $P41, "ResizablePMCArray"
    push $P41, ""
    .return ($P41)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "normspace"  :subid("15_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .const 'Sub' $P52 = "17_1275811476.7961" 
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
    .const 'Sub' $P52 = "17_1275811476.7961" 
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
.sub "!PREFIX__normspace"  :subid("16_1275811476.7961") :method
.annotate 'line', 3
    new $P49, "ResizablePMCArray"
    push $P49, ""
    .return ($P49)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block51"  :anon :subid("17_1275811476.7961") :method :outer("15_1275811476.7961")
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
.sub "arg"  :subid("18_1275811476.7961") :method :outer("11_1275811476.7961")
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
.sub "!PREFIX__arg"  :subid("19_1275811476.7961") :method
.annotate 'line', 3
    new $P59, "ResizablePMCArray"
    push $P59, ""
    push $P59, "\""
    push $P59, "'"
    .return ($P59)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "arglist"  :subid("20_1275811476.7961") :method :outer("11_1275811476.7961")
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
    ne $I10, -1, rxscan68_done
    goto rxscan68_scan
  rxscan68_loop:
    ($P10) = rx64_cur."from"()
    inc $P10
    set rx64_pos, $P10
    ge rx64_pos, rx64_eos, rxscan68_done
  rxscan68_scan:
    set_addr $I10, rxscan68_loop
    rx64_cur."!mark_push"(0, rx64_pos, $I10)
  rxscan68_done:
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
  # rx rxquantr71 ** 0..*
    set_addr $I74, rxquantr71_done
    rx64_cur."!mark_push"(0, rx64_pos, $I74)
  rxquantr71_loop:
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
    (rx64_rep) = rx64_cur."!mark_commit"($I74)
    rx64_cur."!mark_push"(rx64_rep, rx64_pos, $I74)
    goto rxquantr71_loop
  rxquantr71_done:
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
.sub "!PREFIX__arglist"  :subid("21_1275811476.7961") :method
.annotate 'line', 3
    $P66 = self."!PREFIX__!subrule"("ws", "")
    new $P67, "ResizablePMCArray"
    push $P67, $P66
    .return ($P67)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "TOP"  :subid("22_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx77_tgt
    .local int rx77_pos
    .local int rx77_off
    .local int rx77_eos
    .local int rx77_rep
    .local pmc rx77_cur
    (rx77_cur, rx77_pos, rx77_tgt) = self."!cursor_start"()
    rx77_cur."!cursor_debug"("START ", "TOP")
    .lex unicode:"$\x{a2}", rx77_cur
    .local pmc match
    .lex "$/", match
    length rx77_eos, rx77_tgt
    gt rx77_pos, rx77_eos, rx77_done
    set rx77_off, 0
    lt rx77_pos, 2, rx77_start
    sub rx77_off, rx77_pos, 1
    substr rx77_tgt, rx77_tgt, rx77_off
  rx77_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan81_done
    goto rxscan81_scan
  rxscan81_loop:
    ($P10) = rx77_cur."from"()
    inc $P10
    set rx77_pos, $P10
    ge rx77_pos, rx77_eos, rxscan81_done
  rxscan81_scan:
    set_addr $I10, rxscan81_loop
    rx77_cur."!mark_push"(0, rx77_pos, $I10)
  rxscan81_done:
.annotate 'line', 23
  # rx subrule "nibbler" subtype=capture negate=
    rx77_cur."!cursor_pos"(rx77_pos)
    $P10 = rx77_cur."nibbler"()
    unless $P10, rx77_fail
    rx77_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx77_pos = $P10."pos"()
  alt82_0:
.annotate 'line', 24
    set_addr $I10, alt82_1
    rx77_cur."!mark_push"(0, rx77_pos, $I10)
  # rxanchor eos
    ne rx77_pos, rx77_eos, rx77_fail
    goto alt82_end
  alt82_1:
  # rx subrule "panic" subtype=method negate=
    rx77_cur."!cursor_pos"(rx77_pos)
    $P10 = rx77_cur."panic"("Confused")
    unless $P10, rx77_fail
    rx77_pos = $P10."pos"()
  alt82_end:
.annotate 'line', 22
  # rx pass
    rx77_cur."!cursor_pass"(rx77_pos, "TOP")
    rx77_cur."!cursor_debug"("PASS  ", "TOP", " at pos=", rx77_pos)
    .return (rx77_cur)
  rx77_fail:
.annotate 'line', 3
    (rx77_rep, rx77_pos, $I10, $P10) = rx77_cur."!mark_fail"(0)
    lt rx77_pos, -1, rx77_done
    eq rx77_pos, -1, rx77_fail
    jump $I10
  rx77_done:
    rx77_cur."!cursor_fail"()
    rx77_cur."!cursor_debug"("FAIL  ", "TOP")
    .return (rx77_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__TOP"  :subid("23_1275811476.7961") :method
.annotate 'line', 3
    $P79 = self."!PREFIX__!subrule"("nibbler", "")
    new $P80, "ResizablePMCArray"
    push $P80, $P79
    .return ($P80)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "nibbler"  :subid("24_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx84_tgt
    .local int rx84_pos
    .local int rx84_off
    .local int rx84_eos
    .local int rx84_rep
    .local pmc rx84_cur
    (rx84_cur, rx84_pos, rx84_tgt) = self."!cursor_start"()
    rx84_cur."!cursor_debug"("START ", "nibbler")
    rx84_cur."!cursor_caparray"("termish")
    .lex unicode:"$\x{a2}", rx84_cur
    .local pmc match
    .lex "$/", match
    length rx84_eos, rx84_tgt
    gt rx84_pos, rx84_eos, rx84_done
    set rx84_off, 0
    lt rx84_pos, 2, rx84_start
    sub rx84_off, rx84_pos, 1
    substr rx84_tgt, rx84_tgt, rx84_off
  rx84_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan87_done
    goto rxscan87_scan
  rxscan87_loop:
    ($P10) = rx84_cur."from"()
    inc $P10
    set rx84_pos, $P10
    ge rx84_pos, rx84_eos, rxscan87_done
  rxscan87_scan:
    set_addr $I10, rxscan87_loop
    rx84_cur."!mark_push"(0, rx84_pos, $I10)
  rxscan87_done:
.annotate 'line', 28
  # rx reduce name="nibbler" key="open"
    rx84_cur."!cursor_pos"(rx84_pos)
    rx84_cur."!reduce"("nibbler", "open")
.annotate 'line', 29
  # rx rxquantr88 ** 0..1
    set_addr $I90, rxquantr88_done
    rx84_cur."!mark_push"(0, rx84_pos, $I90)
  rxquantr88_loop:
  # rx subrule "ws" subtype=method negate=
    rx84_cur."!cursor_pos"(rx84_pos)
    $P10 = rx84_cur."ws"()
    unless $P10, rx84_fail
    rx84_pos = $P10."pos"()
  alt89_0:
    set_addr $I10, alt89_1
    rx84_cur."!mark_push"(0, rx84_pos, $I10)
  # rx literal  "||"
    add $I11, rx84_pos, 2
    gt $I11, rx84_eos, rx84_fail
    sub $I11, rx84_pos, rx84_off
    substr $S10, rx84_tgt, $I11, 2
    ne $S10, "||", rx84_fail
    add rx84_pos, 2
    goto alt89_end
  alt89_1:
    set_addr $I10, alt89_2
    rx84_cur."!mark_push"(0, rx84_pos, $I10)
  # rx literal  "|"
    add $I11, rx84_pos, 1
    gt $I11, rx84_eos, rx84_fail
    sub $I11, rx84_pos, rx84_off
    substr $S10, rx84_tgt, $I11, 1
    ne $S10, "|", rx84_fail
    add rx84_pos, 1
    goto alt89_end
  alt89_2:
    set_addr $I10, alt89_3
    rx84_cur."!mark_push"(0, rx84_pos, $I10)
  # rx literal  "&&"
    add $I11, rx84_pos, 2
    gt $I11, rx84_eos, rx84_fail
    sub $I11, rx84_pos, rx84_off
    substr $S10, rx84_tgt, $I11, 2
    ne $S10, "&&", rx84_fail
    add rx84_pos, 2
    goto alt89_end
  alt89_3:
  # rx literal  "&"
    add $I11, rx84_pos, 1
    gt $I11, rx84_eos, rx84_fail
    sub $I11, rx84_pos, rx84_off
    substr $S10, rx84_tgt, $I11, 1
    ne $S10, "&", rx84_fail
    add rx84_pos, 1
  alt89_end:
    (rx84_rep) = rx84_cur."!mark_commit"($I90)
  rxquantr88_done:
.annotate 'line', 30
  # rx subrule "termish" subtype=capture negate=
    rx84_cur."!cursor_pos"(rx84_pos)
    $P10 = rx84_cur."termish"()
    unless $P10, rx84_fail
    rx84_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("termish")
    rx84_pos = $P10."pos"()
.annotate 'line', 33
  # rx rxquantr91 ** 0..*
    set_addr $I94, rxquantr91_done
    rx84_cur."!mark_push"(0, rx84_pos, $I94)
  rxquantr91_loop:
  alt92_0:
.annotate 'line', 31
    set_addr $I10, alt92_1
    rx84_cur."!mark_push"(0, rx84_pos, $I10)
  # rx literal  "||"
    add $I11, rx84_pos, 2
    gt $I11, rx84_eos, rx84_fail
    sub $I11, rx84_pos, rx84_off
    substr $S10, rx84_tgt, $I11, 2
    ne $S10, "||", rx84_fail
    add rx84_pos, 2
    goto alt92_end
  alt92_1:
  # rx literal  "|"
    add $I11, rx84_pos, 1
    gt $I11, rx84_eos, rx84_fail
    sub $I11, rx84_pos, rx84_off
    substr $S10, rx84_tgt, $I11, 1
    ne $S10, "|", rx84_fail
    add rx84_pos, 1
  alt92_end:
  alt93_0:
.annotate 'line', 32
    set_addr $I10, alt93_1
    rx84_cur."!mark_push"(0, rx84_pos, $I10)
  # rx subrule "termish" subtype=capture negate=
    rx84_cur."!cursor_pos"(rx84_pos)
    $P10 = rx84_cur."termish"()
    unless $P10, rx84_fail
    rx84_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("termish")
    rx84_pos = $P10."pos"()
    goto alt93_end
  alt93_1:
  # rx subrule "panic" subtype=method negate=
    rx84_cur."!cursor_pos"(rx84_pos)
    $P10 = rx84_cur."panic"("Null pattern not allowed")
    unless $P10, rx84_fail
    rx84_pos = $P10."pos"()
  alt93_end:
.annotate 'line', 33
    (rx84_rep) = rx84_cur."!mark_commit"($I94)
    rx84_cur."!mark_push"(rx84_rep, rx84_pos, $I94)
    goto rxquantr91_loop
  rxquantr91_done:
.annotate 'line', 27
  # rx pass
    rx84_cur."!cursor_pass"(rx84_pos, "nibbler")
    rx84_cur."!cursor_debug"("PASS  ", "nibbler", " at pos=", rx84_pos)
    .return (rx84_cur)
  rx84_fail:
.annotate 'line', 3
    (rx84_rep, rx84_pos, $I10, $P10) = rx84_cur."!mark_fail"(0)
    lt rx84_pos, -1, rx84_done
    eq rx84_pos, -1, rx84_fail
    jump $I10
  rx84_done:
    rx84_cur."!cursor_fail"()
    rx84_cur."!cursor_debug"("FAIL  ", "nibbler")
    .return (rx84_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__nibbler"  :subid("25_1275811476.7961") :method
.annotate 'line', 3
    new $P86, "ResizablePMCArray"
    push $P86, ""
    .return ($P86)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "termish"  :subid("26_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx96_tgt
    .local int rx96_pos
    .local int rx96_off
    .local int rx96_eos
    .local int rx96_rep
    .local pmc rx96_cur
    (rx96_cur, rx96_pos, rx96_tgt) = self."!cursor_start"()
    rx96_cur."!cursor_debug"("START ", "termish")
    rx96_cur."!cursor_caparray"("noun")
    .lex unicode:"$\x{a2}", rx96_cur
    .local pmc match
    .lex "$/", match
    length rx96_eos, rx96_tgt
    gt rx96_pos, rx96_eos, rx96_done
    set rx96_off, 0
    lt rx96_pos, 2, rx96_start
    sub rx96_off, rx96_pos, 1
    substr rx96_tgt, rx96_tgt, rx96_off
  rx96_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan99_done
    goto rxscan99_scan
  rxscan99_loop:
    ($P10) = rx96_cur."from"()
    inc $P10
    set rx96_pos, $P10
    ge rx96_pos, rx96_eos, rxscan99_done
  rxscan99_scan:
    set_addr $I10, rxscan99_loop
    rx96_cur."!mark_push"(0, rx96_pos, $I10)
  rxscan99_done:
.annotate 'line', 37
  # rx rxquantr100 ** 1..*
    set_addr $I101, rxquantr100_done
    rx96_cur."!mark_push"(0, -1, $I101)
  rxquantr100_loop:
  # rx subrule "quantified_atom" subtype=capture negate=
    rx96_cur."!cursor_pos"(rx96_pos)
    $P10 = rx96_cur."quantified_atom"()
    unless $P10, rx96_fail
    rx96_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("noun")
    rx96_pos = $P10."pos"()
    (rx96_rep) = rx96_cur."!mark_commit"($I101)
    rx96_cur."!mark_push"(rx96_rep, rx96_pos, $I101)
    goto rxquantr100_loop
  rxquantr100_done:
.annotate 'line', 36
  # rx pass
    rx96_cur."!cursor_pass"(rx96_pos, "termish")
    rx96_cur."!cursor_debug"("PASS  ", "termish", " at pos=", rx96_pos)
    .return (rx96_cur)
  rx96_fail:
.annotate 'line', 3
    (rx96_rep, rx96_pos, $I10, $P10) = rx96_cur."!mark_fail"(0)
    lt rx96_pos, -1, rx96_done
    eq rx96_pos, -1, rx96_fail
    jump $I10
  rx96_done:
    rx96_cur."!cursor_fail"()
    rx96_cur."!cursor_debug"("FAIL  ", "termish")
    .return (rx96_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__termish"  :subid("27_1275811476.7961") :method
.annotate 'line', 3
    new $P98, "ResizablePMCArray"
    push $P98, ""
    .return ($P98)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantified_atom"  :subid("28_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .const 'Sub' $P111 = "30_1275811476.7961" 
    capture_lex $P111
    .local string rx103_tgt
    .local int rx103_pos
    .local int rx103_off
    .local int rx103_eos
    .local int rx103_rep
    .local pmc rx103_cur
    (rx103_cur, rx103_pos, rx103_tgt) = self."!cursor_start"()
    rx103_cur."!cursor_debug"("START ", "quantified_atom")
    rx103_cur."!cursor_caparray"("quantifier", "backmod")
    .lex unicode:"$\x{a2}", rx103_cur
    .local pmc match
    .lex "$/", match
    length rx103_eos, rx103_tgt
    gt rx103_pos, rx103_eos, rx103_done
    set rx103_off, 0
    lt rx103_pos, 2, rx103_start
    sub rx103_off, rx103_pos, 1
    substr rx103_tgt, rx103_tgt, rx103_off
  rx103_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan107_done
    goto rxscan107_scan
  rxscan107_loop:
    ($P10) = rx103_cur."from"()
    inc $P10
    set rx103_pos, $P10
    ge rx103_pos, rx103_eos, rxscan107_done
  rxscan107_scan:
    set_addr $I10, rxscan107_loop
    rx103_cur."!mark_push"(0, rx103_pos, $I10)
  rxscan107_done:
.annotate 'line', 41
  # rx subrule "atom" subtype=capture negate=
    rx103_cur."!cursor_pos"(rx103_pos)
    $P10 = rx103_cur."atom"()
    unless $P10, rx103_fail
    rx103_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("atom")
    rx103_pos = $P10."pos"()
  # rx rxquantr108 ** 0..1
    set_addr $I114, rxquantr108_done
    rx103_cur."!mark_push"(0, rx103_pos, $I114)
  rxquantr108_loop:
  # rx subrule "ws" subtype=method negate=
    rx103_cur."!cursor_pos"(rx103_pos)
    $P10 = rx103_cur."ws"()
    unless $P10, rx103_fail
    rx103_pos = $P10."pos"()
  alt109_0:
    set_addr $I10, alt109_1
    rx103_cur."!mark_push"(0, rx103_pos, $I10)
  # rx subrule "quantifier" subtype=capture negate=
    rx103_cur."!cursor_pos"(rx103_pos)
    $P10 = rx103_cur."quantifier"()
    unless $P10, rx103_fail
    rx103_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantifier")
    rx103_pos = $P10."pos"()
    goto alt109_end
  alt109_1:
  # rx subrule "before" subtype=zerowidth negate=
    rx103_cur."!cursor_pos"(rx103_pos)
    .const 'Sub' $P111 = "30_1275811476.7961" 
    capture_lex $P111
    $P10 = rx103_cur."before"($P111)
    unless $P10, rx103_fail
  # rx subrule "backmod" subtype=capture negate=
    rx103_cur."!cursor_pos"(rx103_pos)
    $P10 = rx103_cur."backmod"()
    unless $P10, rx103_fail
    rx103_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx103_pos = $P10."pos"()
  # rx subrule "alpha" subtype=zerowidth negate=1
    rx103_cur."!cursor_pos"(rx103_pos)
    $P10 = rx103_cur."alpha"()
    if $P10, rx103_fail
  alt109_end:
    (rx103_rep) = rx103_cur."!mark_commit"($I114)
  rxquantr108_done:
.annotate 'line', 40
  # rx pass
    rx103_cur."!cursor_pass"(rx103_pos, "quantified_atom")
    rx103_cur."!cursor_debug"("PASS  ", "quantified_atom", " at pos=", rx103_pos)
    .return (rx103_cur)
  rx103_fail:
.annotate 'line', 3
    (rx103_rep, rx103_pos, $I10, $P10) = rx103_cur."!mark_fail"(0)
    lt rx103_pos, -1, rx103_done
    eq rx103_pos, -1, rx103_fail
    jump $I10
  rx103_done:
    rx103_cur."!cursor_fail"()
    rx103_cur."!cursor_debug"("FAIL  ", "quantified_atom")
    .return (rx103_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantified_atom"  :subid("29_1275811476.7961") :method
.annotate 'line', 3
    $P105 = self."!PREFIX__!subrule"("atom", "")
    new $P106, "ResizablePMCArray"
    push $P106, $P105
    .return ($P106)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block110"  :anon :subid("30_1275811476.7961") :method :outer("28_1275811476.7961")
.annotate 'line', 41
    .local string rx112_tgt
    .local int rx112_pos
    .local int rx112_off
    .local int rx112_eos
    .local int rx112_rep
    .local pmc rx112_cur
    (rx112_cur, rx112_pos, rx112_tgt) = self."!cursor_start"()
    rx112_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx112_cur
    .local pmc match
    .lex "$/", match
    length rx112_eos, rx112_tgt
    gt rx112_pos, rx112_eos, rx112_done
    set rx112_off, 0
    lt rx112_pos, 2, rx112_start
    sub rx112_off, rx112_pos, 1
    substr rx112_tgt, rx112_tgt, rx112_off
  rx112_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan113_done
    goto rxscan113_scan
  rxscan113_loop:
    ($P10) = rx112_cur."from"()
    inc $P10
    set rx112_pos, $P10
    ge rx112_pos, rx112_eos, rxscan113_done
  rxscan113_scan:
    set_addr $I10, rxscan113_loop
    rx112_cur."!mark_push"(0, rx112_pos, $I10)
  rxscan113_done:
  # rx literal  ":"
    add $I11, rx112_pos, 1
    gt $I11, rx112_eos, rx112_fail
    sub $I11, rx112_pos, rx112_off
    substr $S10, rx112_tgt, $I11, 1
    ne $S10, ":", rx112_fail
    add rx112_pos, 1
  # rx pass
    rx112_cur."!cursor_pass"(rx112_pos, "")
    rx112_cur."!cursor_debug"("PASS  ", "", " at pos=", rx112_pos)
    .return (rx112_cur)
  rx112_fail:
    (rx112_rep, rx112_pos, $I10, $P10) = rx112_cur."!mark_fail"(0)
    lt rx112_pos, -1, rx112_done
    eq rx112_pos, -1, rx112_fail
    jump $I10
  rx112_done:
    rx112_cur."!cursor_fail"()
    rx112_cur."!cursor_debug"("FAIL  ", "")
    .return (rx112_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "atom"  :subid("31_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .const 'Sub' $P126 = "33_1275811476.7961" 
    capture_lex $P126
    .local string rx116_tgt
    .local int rx116_pos
    .local int rx116_off
    .local int rx116_eos
    .local int rx116_rep
    .local pmc rx116_cur
    (rx116_cur, rx116_pos, rx116_tgt) = self."!cursor_start"()
    rx116_cur."!cursor_debug"("START ", "atom")
    .lex unicode:"$\x{a2}", rx116_cur
    .local pmc match
    .lex "$/", match
    length rx116_eos, rx116_tgt
    gt rx116_pos, rx116_eos, rx116_done
    set rx116_off, 0
    lt rx116_pos, 2, rx116_start
    sub rx116_off, rx116_pos, 1
    substr rx116_tgt, rx116_tgt, rx116_off
  rx116_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan120_done
    goto rxscan120_scan
  rxscan120_loop:
    ($P10) = rx116_cur."from"()
    inc $P10
    set rx116_pos, $P10
    ge rx116_pos, rx116_eos, rxscan120_done
  rxscan120_scan:
    set_addr $I10, rxscan120_loop
    rx116_cur."!mark_push"(0, rx116_pos, $I10)
  rxscan120_done:
  alt121_0:
.annotate 'line', 46
    set_addr $I10, alt121_1
    rx116_cur."!mark_push"(0, rx116_pos, $I10)
.annotate 'line', 47
  # rx charclass w
    ge rx116_pos, rx116_eos, rx116_fail
    sub $I10, rx116_pos, rx116_off
    is_cclass $I11, 8192, rx116_tgt, $I10
    unless $I11, rx116_fail
    inc rx116_pos
  # rx rxquantr122 ** 0..1
    set_addr $I129, rxquantr122_done
    rx116_cur."!mark_push"(0, rx116_pos, $I129)
  rxquantr122_loop:
  # rx rxquantg123 ** 1..*
    set_addr $I124, rxquantg123_done
  rxquantg123_loop:
  # rx charclass w
    ge rx116_pos, rx116_eos, rx116_fail
    sub $I10, rx116_pos, rx116_off
    is_cclass $I11, 8192, rx116_tgt, $I10
    unless $I11, rx116_fail
    inc rx116_pos
    rx116_cur."!mark_push"(rx116_rep, rx116_pos, $I124)
    goto rxquantg123_loop
  rxquantg123_done:
  # rx subrule "before" subtype=zerowidth negate=
    rx116_cur."!cursor_pos"(rx116_pos)
    .const 'Sub' $P126 = "33_1275811476.7961" 
    capture_lex $P126
    $P10 = rx116_cur."before"($P126)
    unless $P10, rx116_fail
    (rx116_rep) = rx116_cur."!mark_commit"($I129)
  rxquantr122_done:
    goto alt121_end
  alt121_1:
.annotate 'line', 48
  # rx subrule "metachar" subtype=capture negate=
    rx116_cur."!cursor_pos"(rx116_pos)
    $P10 = rx116_cur."metachar"()
    unless $P10, rx116_fail
    rx116_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("metachar")
    rx116_pos = $P10."pos"()
  alt121_end:
.annotate 'line', 44
  # rx pass
    rx116_cur."!cursor_pass"(rx116_pos, "atom")
    rx116_cur."!cursor_debug"("PASS  ", "atom", " at pos=", rx116_pos)
    .return (rx116_cur)
  rx116_fail:
.annotate 'line', 3
    (rx116_rep, rx116_pos, $I10, $P10) = rx116_cur."!mark_fail"(0)
    lt rx116_pos, -1, rx116_done
    eq rx116_pos, -1, rx116_fail
    jump $I10
  rx116_done:
    rx116_cur."!cursor_fail"()
    rx116_cur."!cursor_debug"("FAIL  ", "atom")
    .return (rx116_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__atom"  :subid("32_1275811476.7961") :method
.annotate 'line', 3
    $P118 = self."!PREFIX__!subrule"("metachar", "")
    new $P119, "ResizablePMCArray"
    push $P119, $P118
    push $P119, ""
    .return ($P119)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block125"  :anon :subid("33_1275811476.7961") :method :outer("31_1275811476.7961")
.annotate 'line', 47
    .local string rx127_tgt
    .local int rx127_pos
    .local int rx127_off
    .local int rx127_eos
    .local int rx127_rep
    .local pmc rx127_cur
    (rx127_cur, rx127_pos, rx127_tgt) = self."!cursor_start"()
    rx127_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx127_cur
    .local pmc match
    .lex "$/", match
    length rx127_eos, rx127_tgt
    gt rx127_pos, rx127_eos, rx127_done
    set rx127_off, 0
    lt rx127_pos, 2, rx127_start
    sub rx127_off, rx127_pos, 1
    substr rx127_tgt, rx127_tgt, rx127_off
  rx127_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan128_done
    goto rxscan128_scan
  rxscan128_loop:
    ($P10) = rx127_cur."from"()
    inc $P10
    set rx127_pos, $P10
    ge rx127_pos, rx127_eos, rxscan128_done
  rxscan128_scan:
    set_addr $I10, rxscan128_loop
    rx127_cur."!mark_push"(0, rx127_pos, $I10)
  rxscan128_done:
  # rx charclass w
    ge rx127_pos, rx127_eos, rx127_fail
    sub $I10, rx127_pos, rx127_off
    is_cclass $I11, 8192, rx127_tgt, $I10
    unless $I11, rx127_fail
    inc rx127_pos
  # rx pass
    rx127_cur."!cursor_pass"(rx127_pos, "")
    rx127_cur."!cursor_debug"("PASS  ", "", " at pos=", rx127_pos)
    .return (rx127_cur)
  rx127_fail:
    (rx127_rep, rx127_pos, $I10, $P10) = rx127_cur."!mark_fail"(0)
    lt rx127_pos, -1, rx127_done
    eq rx127_pos, -1, rx127_fail
    jump $I10
  rx127_done:
    rx127_cur."!cursor_fail"()
    rx127_cur."!cursor_debug"("FAIL  ", "")
    .return (rx127_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier"  :subid("34_1275811476.7961") :method
.annotate 'line', 52
    $P131 = self."!protoregex"("quantifier")
    .return ($P131)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier"  :subid("35_1275811476.7961") :method
.annotate 'line', 52
    $P133 = self."!PREFIX__!protoregex"("quantifier")
    .return ($P133)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<*>"  :subid("36_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx135_tgt
    .local int rx135_pos
    .local int rx135_off
    .local int rx135_eos
    .local int rx135_rep
    .local pmc rx135_cur
    (rx135_cur, rx135_pos, rx135_tgt) = self."!cursor_start"()
    rx135_cur."!cursor_debug"("START ", "quantifier:sym<*>")
    .lex unicode:"$\x{a2}", rx135_cur
    .local pmc match
    .lex "$/", match
    length rx135_eos, rx135_tgt
    gt rx135_pos, rx135_eos, rx135_done
    set rx135_off, 0
    lt rx135_pos, 2, rx135_start
    sub rx135_off, rx135_pos, 1
    substr rx135_tgt, rx135_tgt, rx135_off
  rx135_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan139_done
    goto rxscan139_scan
  rxscan139_loop:
    ($P10) = rx135_cur."from"()
    inc $P10
    set rx135_pos, $P10
    ge rx135_pos, rx135_eos, rxscan139_done
  rxscan139_scan:
    set_addr $I10, rxscan139_loop
    rx135_cur."!mark_push"(0, rx135_pos, $I10)
  rxscan139_done:
.annotate 'line', 53
  # rx subcapture "sym"
    set_addr $I10, rxcap_140_fail
    rx135_cur."!mark_push"(0, rx135_pos, $I10)
  # rx literal  "*"
    add $I11, rx135_pos, 1
    gt $I11, rx135_eos, rx135_fail
    sub $I11, rx135_pos, rx135_off
    substr $S10, rx135_tgt, $I11, 1
    ne $S10, "*", rx135_fail
    add rx135_pos, 1
    set_addr $I10, rxcap_140_fail
    ($I12, $I11) = rx135_cur."!mark_peek"($I10)
    rx135_cur."!cursor_pos"($I11)
    ($P10) = rx135_cur."!cursor_start"()
    $P10."!cursor_pass"(rx135_pos, "")
    rx135_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_140_done
  rxcap_140_fail:
    goto rx135_fail
  rxcap_140_done:
  # rx subrule "backmod" subtype=capture negate=
    rx135_cur."!cursor_pos"(rx135_pos)
    $P10 = rx135_cur."backmod"()
    unless $P10, rx135_fail
    rx135_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx135_pos = $P10."pos"()
  # rx pass
    rx135_cur."!cursor_pass"(rx135_pos, "quantifier:sym<*>")
    rx135_cur."!cursor_debug"("PASS  ", "quantifier:sym<*>", " at pos=", rx135_pos)
    .return (rx135_cur)
  rx135_fail:
.annotate 'line', 3
    (rx135_rep, rx135_pos, $I10, $P10) = rx135_cur."!mark_fail"(0)
    lt rx135_pos, -1, rx135_done
    eq rx135_pos, -1, rx135_fail
    jump $I10
  rx135_done:
    rx135_cur."!cursor_fail"()
    rx135_cur."!cursor_debug"("FAIL  ", "quantifier:sym<*>")
    .return (rx135_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<*>"  :subid("37_1275811476.7961") :method
.annotate 'line', 3
    $P137 = self."!PREFIX__!subrule"("backmod", "*")
    new $P138, "ResizablePMCArray"
    push $P138, $P137
    .return ($P138)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<+>"  :subid("38_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx142_tgt
    .local int rx142_pos
    .local int rx142_off
    .local int rx142_eos
    .local int rx142_rep
    .local pmc rx142_cur
    (rx142_cur, rx142_pos, rx142_tgt) = self."!cursor_start"()
    rx142_cur."!cursor_debug"("START ", "quantifier:sym<+>")
    .lex unicode:"$\x{a2}", rx142_cur
    .local pmc match
    .lex "$/", match
    length rx142_eos, rx142_tgt
    gt rx142_pos, rx142_eos, rx142_done
    set rx142_off, 0
    lt rx142_pos, 2, rx142_start
    sub rx142_off, rx142_pos, 1
    substr rx142_tgt, rx142_tgt, rx142_off
  rx142_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan146_done
    goto rxscan146_scan
  rxscan146_loop:
    ($P10) = rx142_cur."from"()
    inc $P10
    set rx142_pos, $P10
    ge rx142_pos, rx142_eos, rxscan146_done
  rxscan146_scan:
    set_addr $I10, rxscan146_loop
    rx142_cur."!mark_push"(0, rx142_pos, $I10)
  rxscan146_done:
.annotate 'line', 54
  # rx subcapture "sym"
    set_addr $I10, rxcap_147_fail
    rx142_cur."!mark_push"(0, rx142_pos, $I10)
  # rx literal  "+"
    add $I11, rx142_pos, 1
    gt $I11, rx142_eos, rx142_fail
    sub $I11, rx142_pos, rx142_off
    substr $S10, rx142_tgt, $I11, 1
    ne $S10, "+", rx142_fail
    add rx142_pos, 1
    set_addr $I10, rxcap_147_fail
    ($I12, $I11) = rx142_cur."!mark_peek"($I10)
    rx142_cur."!cursor_pos"($I11)
    ($P10) = rx142_cur."!cursor_start"()
    $P10."!cursor_pass"(rx142_pos, "")
    rx142_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_147_done
  rxcap_147_fail:
    goto rx142_fail
  rxcap_147_done:
  # rx subrule "backmod" subtype=capture negate=
    rx142_cur."!cursor_pos"(rx142_pos)
    $P10 = rx142_cur."backmod"()
    unless $P10, rx142_fail
    rx142_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx142_pos = $P10."pos"()
  # rx pass
    rx142_cur."!cursor_pass"(rx142_pos, "quantifier:sym<+>")
    rx142_cur."!cursor_debug"("PASS  ", "quantifier:sym<+>", " at pos=", rx142_pos)
    .return (rx142_cur)
  rx142_fail:
.annotate 'line', 3
    (rx142_rep, rx142_pos, $I10, $P10) = rx142_cur."!mark_fail"(0)
    lt rx142_pos, -1, rx142_done
    eq rx142_pos, -1, rx142_fail
    jump $I10
  rx142_done:
    rx142_cur."!cursor_fail"()
    rx142_cur."!cursor_debug"("FAIL  ", "quantifier:sym<+>")
    .return (rx142_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<+>"  :subid("39_1275811476.7961") :method
.annotate 'line', 3
    $P144 = self."!PREFIX__!subrule"("backmod", "+")
    new $P145, "ResizablePMCArray"
    push $P145, $P144
    .return ($P145)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<?>"  :subid("40_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx149_tgt
    .local int rx149_pos
    .local int rx149_off
    .local int rx149_eos
    .local int rx149_rep
    .local pmc rx149_cur
    (rx149_cur, rx149_pos, rx149_tgt) = self."!cursor_start"()
    rx149_cur."!cursor_debug"("START ", "quantifier:sym<?>")
    .lex unicode:"$\x{a2}", rx149_cur
    .local pmc match
    .lex "$/", match
    length rx149_eos, rx149_tgt
    gt rx149_pos, rx149_eos, rx149_done
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
.annotate 'line', 55
  # rx subcapture "sym"
    set_addr $I10, rxcap_154_fail
    rx149_cur."!mark_push"(0, rx149_pos, $I10)
  # rx literal  "?"
    add $I11, rx149_pos, 1
    gt $I11, rx149_eos, rx149_fail
    sub $I11, rx149_pos, rx149_off
    substr $S10, rx149_tgt, $I11, 1
    ne $S10, "?", rx149_fail
    add rx149_pos, 1
    set_addr $I10, rxcap_154_fail
    ($I12, $I11) = rx149_cur."!mark_peek"($I10)
    rx149_cur."!cursor_pos"($I11)
    ($P10) = rx149_cur."!cursor_start"()
    $P10."!cursor_pass"(rx149_pos, "")
    rx149_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_154_done
  rxcap_154_fail:
    goto rx149_fail
  rxcap_154_done:
  # rx subrule "backmod" subtype=capture negate=
    rx149_cur."!cursor_pos"(rx149_pos)
    $P10 = rx149_cur."backmod"()
    unless $P10, rx149_fail
    rx149_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx149_pos = $P10."pos"()
  # rx pass
    rx149_cur."!cursor_pass"(rx149_pos, "quantifier:sym<?>")
    rx149_cur."!cursor_debug"("PASS  ", "quantifier:sym<?>", " at pos=", rx149_pos)
    .return (rx149_cur)
  rx149_fail:
.annotate 'line', 3
    (rx149_rep, rx149_pos, $I10, $P10) = rx149_cur."!mark_fail"(0)
    lt rx149_pos, -1, rx149_done
    eq rx149_pos, -1, rx149_fail
    jump $I10
  rx149_done:
    rx149_cur."!cursor_fail"()
    rx149_cur."!cursor_debug"("FAIL  ", "quantifier:sym<?>")
    .return (rx149_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<?>"  :subid("41_1275811476.7961") :method
.annotate 'line', 3
    $P151 = self."!PREFIX__!subrule"("backmod", "?")
    new $P152, "ResizablePMCArray"
    push $P152, $P151
    .return ($P152)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<**>"  :subid("42_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx156_tgt
    .local int rx156_pos
    .local int rx156_off
    .local int rx156_eos
    .local int rx156_rep
    .local pmc rx156_cur
    (rx156_cur, rx156_pos, rx156_tgt) = self."!cursor_start"()
    rx156_cur."!cursor_debug"("START ", "quantifier:sym<**>")
    rx156_cur."!cursor_caparray"("max", "normspace")
    .lex unicode:"$\x{a2}", rx156_cur
    .local pmc match
    .lex "$/", match
    length rx156_eos, rx156_tgt
    gt rx156_pos, rx156_eos, rx156_done
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
.annotate 'line', 57
  # rx subcapture "sym"
    set_addr $I10, rxcap_160_fail
    rx156_cur."!mark_push"(0, rx156_pos, $I10)
  # rx literal  "**"
    add $I11, rx156_pos, 2
    gt $I11, rx156_eos, rx156_fail
    sub $I11, rx156_pos, rx156_off
    substr $S10, rx156_tgt, $I11, 2
    ne $S10, "**", rx156_fail
    add rx156_pos, 2
    set_addr $I10, rxcap_160_fail
    ($I12, $I11) = rx156_cur."!mark_peek"($I10)
    rx156_cur."!cursor_pos"($I11)
    ($P10) = rx156_cur."!cursor_start"()
    $P10."!cursor_pass"(rx156_pos, "")
    rx156_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_160_done
  rxcap_160_fail:
    goto rx156_fail
  rxcap_160_done:
  # rx rxquantr161 ** 0..1
    set_addr $I162, rxquantr161_done
    rx156_cur."!mark_push"(0, rx156_pos, $I162)
  rxquantr161_loop:
  # rx subrule "normspace" subtype=capture negate=
    rx156_cur."!cursor_pos"(rx156_pos)
    $P10 = rx156_cur."normspace"()
    unless $P10, rx156_fail
    rx156_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("normspace")
    rx156_pos = $P10."pos"()
    (rx156_rep) = rx156_cur."!mark_commit"($I162)
  rxquantr161_done:
  # rx subrule "backmod" subtype=capture negate=
    rx156_cur."!cursor_pos"(rx156_pos)
    $P10 = rx156_cur."backmod"()
    unless $P10, rx156_fail
    rx156_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx156_pos = $P10."pos"()
  # rx rxquantr163 ** 0..1
    set_addr $I164, rxquantr163_done
    rx156_cur."!mark_push"(0, rx156_pos, $I164)
  rxquantr163_loop:
  # rx subrule "normspace" subtype=capture negate=
    rx156_cur."!cursor_pos"(rx156_pos)
    $P10 = rx156_cur."normspace"()
    unless $P10, rx156_fail
    rx156_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("normspace")
    rx156_pos = $P10."pos"()
    (rx156_rep) = rx156_cur."!mark_commit"($I164)
  rxquantr163_done:
  alt165_0:
.annotate 'line', 58
    set_addr $I10, alt165_1
    rx156_cur."!mark_push"(0, rx156_pos, $I10)
.annotate 'line', 59
  # rx subcapture "min"
    set_addr $I10, rxcap_166_fail
    rx156_cur."!mark_push"(0, rx156_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx156_pos, rx156_off
    find_not_cclass $I11, 8, rx156_tgt, $I10, rx156_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx156_fail
    add rx156_pos, rx156_off, $I11
    set_addr $I10, rxcap_166_fail
    ($I12, $I11) = rx156_cur."!mark_peek"($I10)
    rx156_cur."!cursor_pos"($I11)
    ($P10) = rx156_cur."!cursor_start"()
    $P10."!cursor_pass"(rx156_pos, "")
    rx156_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("min")
    goto rxcap_166_done
  rxcap_166_fail:
    goto rx156_fail
  rxcap_166_done:
.annotate 'line', 66
  # rx rxquantr167 ** 0..1
    set_addr $I170, rxquantr167_done
    rx156_cur."!mark_push"(0, rx156_pos, $I170)
  rxquantr167_loop:
.annotate 'line', 60
  # rx literal  ".."
    add $I11, rx156_pos, 2
    gt $I11, rx156_eos, rx156_fail
    sub $I11, rx156_pos, rx156_off
    substr $S10, rx156_tgt, $I11, 2
    ne $S10, "..", rx156_fail
    add rx156_pos, 2
.annotate 'line', 61
  # rx subcapture "max"
    set_addr $I10, rxcap_169_fail
    rx156_cur."!mark_push"(0, rx156_pos, $I10)
  alt168_0:
    set_addr $I10, alt168_1
    rx156_cur."!mark_push"(0, rx156_pos, $I10)
.annotate 'line', 62
  # rx charclass_q d r 1..-1
    sub $I10, rx156_pos, rx156_off
    find_not_cclass $I11, 8, rx156_tgt, $I10, rx156_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx156_fail
    add rx156_pos, rx156_off, $I11
    goto alt168_end
  alt168_1:
    set_addr $I10, alt168_2
    rx156_cur."!mark_push"(0, rx156_pos, $I10)
.annotate 'line', 63
  # rx literal  "*"
    add $I11, rx156_pos, 1
    gt $I11, rx156_eos, rx156_fail
    sub $I11, rx156_pos, rx156_off
    substr $S10, rx156_tgt, $I11, 1
    ne $S10, "*", rx156_fail
    add rx156_pos, 1
    goto alt168_end
  alt168_2:
.annotate 'line', 64
  # rx subrule "panic" subtype=method negate=
    rx156_cur."!cursor_pos"(rx156_pos)
    $P10 = rx156_cur."panic"("Only integers or '*' allowed as range quantifier endpoint")
    unless $P10, rx156_fail
    rx156_pos = $P10."pos"()
  alt168_end:
.annotate 'line', 61
    set_addr $I10, rxcap_169_fail
    ($I12, $I11) = rx156_cur."!mark_peek"($I10)
    rx156_cur."!cursor_pos"($I11)
    ($P10) = rx156_cur."!cursor_start"()
    $P10."!cursor_pass"(rx156_pos, "")
    rx156_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("max")
    goto rxcap_169_done
  rxcap_169_fail:
    goto rx156_fail
  rxcap_169_done:
.annotate 'line', 66
    (rx156_rep) = rx156_cur."!mark_commit"($I170)
  rxquantr167_done:
.annotate 'line', 59
    goto alt165_end
  alt165_1:
.annotate 'line', 67
  # rx subrule "quantified_atom" subtype=capture negate=
    rx156_cur."!cursor_pos"(rx156_pos)
    $P10 = rx156_cur."quantified_atom"()
    unless $P10, rx156_fail
    rx156_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantified_atom")
    rx156_pos = $P10."pos"()
  alt165_end:
.annotate 'line', 56
  # rx pass
    rx156_cur."!cursor_pass"(rx156_pos, "quantifier:sym<**>")
    rx156_cur."!cursor_debug"("PASS  ", "quantifier:sym<**>", " at pos=", rx156_pos)
    .return (rx156_cur)
  rx156_fail:
.annotate 'line', 3
    (rx156_rep, rx156_pos, $I10, $P10) = rx156_cur."!mark_fail"(0)
    lt rx156_pos, -1, rx156_done
    eq rx156_pos, -1, rx156_fail
    jump $I10
  rx156_done:
    rx156_cur."!cursor_fail"()
    rx156_cur."!cursor_debug"("FAIL  ", "quantifier:sym<**>")
    .return (rx156_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<**>"  :subid("43_1275811476.7961") :method
.annotate 'line', 3
    new $P158, "ResizablePMCArray"
    push $P158, "**"
    .return ($P158)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backmod"  :subid("44_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .const 'Sub' $P180 = "46_1275811476.7961" 
    capture_lex $P180
    .local string rx172_tgt
    .local int rx172_pos
    .local int rx172_off
    .local int rx172_eos
    .local int rx172_rep
    .local pmc rx172_cur
    (rx172_cur, rx172_pos, rx172_tgt) = self."!cursor_start"()
    rx172_cur."!cursor_debug"("START ", "backmod")
    .lex unicode:"$\x{a2}", rx172_cur
    .local pmc match
    .lex "$/", match
    length rx172_eos, rx172_tgt
    gt rx172_pos, rx172_eos, rx172_done
    set rx172_off, 0
    lt rx172_pos, 2, rx172_start
    sub rx172_off, rx172_pos, 1
    substr rx172_tgt, rx172_tgt, rx172_off
  rx172_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan175_done
    goto rxscan175_scan
  rxscan175_loop:
    ($P10) = rx172_cur."from"()
    inc $P10
    set rx172_pos, $P10
    ge rx172_pos, rx172_eos, rxscan175_done
  rxscan175_scan:
    set_addr $I10, rxscan175_loop
    rx172_cur."!mark_push"(0, rx172_pos, $I10)
  rxscan175_done:
.annotate 'line', 71
  # rx rxquantr176 ** 0..1
    set_addr $I177, rxquantr176_done
    rx172_cur."!mark_push"(0, rx172_pos, $I177)
  rxquantr176_loop:
  # rx literal  ":"
    add $I11, rx172_pos, 1
    gt $I11, rx172_eos, rx172_fail
    sub $I11, rx172_pos, rx172_off
    substr $S10, rx172_tgt, $I11, 1
    ne $S10, ":", rx172_fail
    add rx172_pos, 1
    (rx172_rep) = rx172_cur."!mark_commit"($I177)
  rxquantr176_done:
  alt178_0:
    set_addr $I10, alt178_1
    rx172_cur."!mark_push"(0, rx172_pos, $I10)
  # rx literal  "?"
    add $I11, rx172_pos, 1
    gt $I11, rx172_eos, rx172_fail
    sub $I11, rx172_pos, rx172_off
    substr $S10, rx172_tgt, $I11, 1
    ne $S10, "?", rx172_fail
    add rx172_pos, 1
    goto alt178_end
  alt178_1:
    set_addr $I10, alt178_2
    rx172_cur."!mark_push"(0, rx172_pos, $I10)
  # rx literal  "!"
    add $I11, rx172_pos, 1
    gt $I11, rx172_eos, rx172_fail
    sub $I11, rx172_pos, rx172_off
    substr $S10, rx172_tgt, $I11, 1
    ne $S10, "!", rx172_fail
    add rx172_pos, 1
    goto alt178_end
  alt178_2:
  # rx subrule "before" subtype=zerowidth negate=1
    rx172_cur."!cursor_pos"(rx172_pos)
    .const 'Sub' $P180 = "46_1275811476.7961" 
    capture_lex $P180
    $P10 = rx172_cur."before"($P180)
    if $P10, rx172_fail
  alt178_end:
  # rx pass
    rx172_cur."!cursor_pass"(rx172_pos, "backmod")
    rx172_cur."!cursor_debug"("PASS  ", "backmod", " at pos=", rx172_pos)
    .return (rx172_cur)
  rx172_fail:
.annotate 'line', 3
    (rx172_rep, rx172_pos, $I10, $P10) = rx172_cur."!mark_fail"(0)
    lt rx172_pos, -1, rx172_done
    eq rx172_pos, -1, rx172_fail
    jump $I10
  rx172_done:
    rx172_cur."!cursor_fail"()
    rx172_cur."!cursor_debug"("FAIL  ", "backmod")
    .return (rx172_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backmod"  :subid("45_1275811476.7961") :method
.annotate 'line', 3
    new $P174, "ResizablePMCArray"
    push $P174, ""
    .return ($P174)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block179"  :anon :subid("46_1275811476.7961") :method :outer("44_1275811476.7961")
.annotate 'line', 71
    .local string rx181_tgt
    .local int rx181_pos
    .local int rx181_off
    .local int rx181_eos
    .local int rx181_rep
    .local pmc rx181_cur
    (rx181_cur, rx181_pos, rx181_tgt) = self."!cursor_start"()
    rx181_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx181_cur
    .local pmc match
    .lex "$/", match
    length rx181_eos, rx181_tgt
    gt rx181_pos, rx181_eos, rx181_done
    set rx181_off, 0
    lt rx181_pos, 2, rx181_start
    sub rx181_off, rx181_pos, 1
    substr rx181_tgt, rx181_tgt, rx181_off
  rx181_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan182_done
    goto rxscan182_scan
  rxscan182_loop:
    ($P10) = rx181_cur."from"()
    inc $P10
    set rx181_pos, $P10
    ge rx181_pos, rx181_eos, rxscan182_done
  rxscan182_scan:
    set_addr $I10, rxscan182_loop
    rx181_cur."!mark_push"(0, rx181_pos, $I10)
  rxscan182_done:
  # rx literal  ":"
    add $I11, rx181_pos, 1
    gt $I11, rx181_eos, rx181_fail
    sub $I11, rx181_pos, rx181_off
    substr $S10, rx181_tgt, $I11, 1
    ne $S10, ":", rx181_fail
    add rx181_pos, 1
  # rx pass
    rx181_cur."!cursor_pass"(rx181_pos, "")
    rx181_cur."!cursor_debug"("PASS  ", "", " at pos=", rx181_pos)
    .return (rx181_cur)
  rx181_fail:
    (rx181_rep, rx181_pos, $I10, $P10) = rx181_cur."!mark_fail"(0)
    lt rx181_pos, -1, rx181_done
    eq rx181_pos, -1, rx181_fail
    jump $I10
  rx181_done:
    rx181_cur."!cursor_fail"()
    rx181_cur."!cursor_debug"("FAIL  ", "")
    .return (rx181_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar"  :subid("47_1275811476.7961") :method
.annotate 'line', 73
    $P184 = self."!protoregex"("metachar")
    .return ($P184)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar"  :subid("48_1275811476.7961") :method
.annotate 'line', 73
    $P186 = self."!PREFIX__!protoregex"("metachar")
    .return ($P186)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<ws>"  :subid("49_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx188_tgt
    .local int rx188_pos
    .local int rx188_off
    .local int rx188_eos
    .local int rx188_rep
    .local pmc rx188_cur
    (rx188_cur, rx188_pos, rx188_tgt) = self."!cursor_start"()
    rx188_cur."!cursor_debug"("START ", "metachar:sym<ws>")
    .lex unicode:"$\x{a2}", rx188_cur
    .local pmc match
    .lex "$/", match
    length rx188_eos, rx188_tgt
    gt rx188_pos, rx188_eos, rx188_done
    set rx188_off, 0
    lt rx188_pos, 2, rx188_start
    sub rx188_off, rx188_pos, 1
    substr rx188_tgt, rx188_tgt, rx188_off
  rx188_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan192_done
    goto rxscan192_scan
  rxscan192_loop:
    ($P10) = rx188_cur."from"()
    inc $P10
    set rx188_pos, $P10
    ge rx188_pos, rx188_eos, rxscan192_done
  rxscan192_scan:
    set_addr $I10, rxscan192_loop
    rx188_cur."!mark_push"(0, rx188_pos, $I10)
  rxscan192_done:
.annotate 'line', 74
  # rx subrule "normspace" subtype=method negate=
    rx188_cur."!cursor_pos"(rx188_pos)
    $P10 = rx188_cur."normspace"()
    unless $P10, rx188_fail
    rx188_pos = $P10."pos"()
  # rx pass
    rx188_cur."!cursor_pass"(rx188_pos, "metachar:sym<ws>")
    rx188_cur."!cursor_debug"("PASS  ", "metachar:sym<ws>", " at pos=", rx188_pos)
    .return (rx188_cur)
  rx188_fail:
.annotate 'line', 3
    (rx188_rep, rx188_pos, $I10, $P10) = rx188_cur."!mark_fail"(0)
    lt rx188_pos, -1, rx188_done
    eq rx188_pos, -1, rx188_fail
    jump $I10
  rx188_done:
    rx188_cur."!cursor_fail"()
    rx188_cur."!cursor_debug"("FAIL  ", "metachar:sym<ws>")
    .return (rx188_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<ws>"  :subid("50_1275811476.7961") :method
.annotate 'line', 3
    $P190 = self."!PREFIX__!subrule"("normspace", "")
    new $P191, "ResizablePMCArray"
    push $P191, $P190
    .return ($P191)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<[ ]>"  :subid("51_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx194_tgt
    .local int rx194_pos
    .local int rx194_off
    .local int rx194_eos
    .local int rx194_rep
    .local pmc rx194_cur
    (rx194_cur, rx194_pos, rx194_tgt) = self."!cursor_start"()
    rx194_cur."!cursor_debug"("START ", "metachar:sym<[ ]>")
    .lex unicode:"$\x{a2}", rx194_cur
    .local pmc match
    .lex "$/", match
    length rx194_eos, rx194_tgt
    gt rx194_pos, rx194_eos, rx194_done
    set rx194_off, 0
    lt rx194_pos, 2, rx194_start
    sub rx194_off, rx194_pos, 1
    substr rx194_tgt, rx194_tgt, rx194_off
  rx194_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan198_done
    goto rxscan198_scan
  rxscan198_loop:
    ($P10) = rx194_cur."from"()
    inc $P10
    set rx194_pos, $P10
    ge rx194_pos, rx194_eos, rxscan198_done
  rxscan198_scan:
    set_addr $I10, rxscan198_loop
    rx194_cur."!mark_push"(0, rx194_pos, $I10)
  rxscan198_done:
.annotate 'line', 75
  # rx literal  "["
    add $I11, rx194_pos, 1
    gt $I11, rx194_eos, rx194_fail
    sub $I11, rx194_pos, rx194_off
    substr $S10, rx194_tgt, $I11, 1
    ne $S10, "[", rx194_fail
    add rx194_pos, 1
  # rx subrule "nibbler" subtype=capture negate=
    rx194_cur."!cursor_pos"(rx194_pos)
    $P10 = rx194_cur."nibbler"()
    unless $P10, rx194_fail
    rx194_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx194_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx194_pos, 1
    gt $I11, rx194_eos, rx194_fail
    sub $I11, rx194_pos, rx194_off
    substr $S10, rx194_tgt, $I11, 1
    ne $S10, "]", rx194_fail
    add rx194_pos, 1
  # rx pass
    rx194_cur."!cursor_pass"(rx194_pos, "metachar:sym<[ ]>")
    rx194_cur."!cursor_debug"("PASS  ", "metachar:sym<[ ]>", " at pos=", rx194_pos)
    .return (rx194_cur)
  rx194_fail:
.annotate 'line', 3
    (rx194_rep, rx194_pos, $I10, $P10) = rx194_cur."!mark_fail"(0)
    lt rx194_pos, -1, rx194_done
    eq rx194_pos, -1, rx194_fail
    jump $I10
  rx194_done:
    rx194_cur."!cursor_fail"()
    rx194_cur."!cursor_debug"("FAIL  ", "metachar:sym<[ ]>")
    .return (rx194_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<[ ]>"  :subid("52_1275811476.7961") :method
.annotate 'line', 3
    $P196 = self."!PREFIX__!subrule"("nibbler", "[")
    new $P197, "ResizablePMCArray"
    push $P197, $P196
    .return ($P197)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<( )>"  :subid("53_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx200_tgt
    .local int rx200_pos
    .local int rx200_off
    .local int rx200_eos
    .local int rx200_rep
    .local pmc rx200_cur
    (rx200_cur, rx200_pos, rx200_tgt) = self."!cursor_start"()
    rx200_cur."!cursor_debug"("START ", "metachar:sym<( )>")
    .lex unicode:"$\x{a2}", rx200_cur
    .local pmc match
    .lex "$/", match
    length rx200_eos, rx200_tgt
    gt rx200_pos, rx200_eos, rx200_done
    set rx200_off, 0
    lt rx200_pos, 2, rx200_start
    sub rx200_off, rx200_pos, 1
    substr rx200_tgt, rx200_tgt, rx200_off
  rx200_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan204_done
    goto rxscan204_scan
  rxscan204_loop:
    ($P10) = rx200_cur."from"()
    inc $P10
    set rx200_pos, $P10
    ge rx200_pos, rx200_eos, rxscan204_done
  rxscan204_scan:
    set_addr $I10, rxscan204_loop
    rx200_cur."!mark_push"(0, rx200_pos, $I10)
  rxscan204_done:
.annotate 'line', 76
  # rx literal  "("
    add $I11, rx200_pos, 1
    gt $I11, rx200_eos, rx200_fail
    sub $I11, rx200_pos, rx200_off
    substr $S10, rx200_tgt, $I11, 1
    ne $S10, "(", rx200_fail
    add rx200_pos, 1
  # rx subrule "nibbler" subtype=capture negate=
    rx200_cur."!cursor_pos"(rx200_pos)
    $P10 = rx200_cur."nibbler"()
    unless $P10, rx200_fail
    rx200_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx200_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx200_pos, 1
    gt $I11, rx200_eos, rx200_fail
    sub $I11, rx200_pos, rx200_off
    substr $S10, rx200_tgt, $I11, 1
    ne $S10, ")", rx200_fail
    add rx200_pos, 1
  # rx pass
    rx200_cur."!cursor_pass"(rx200_pos, "metachar:sym<( )>")
    rx200_cur."!cursor_debug"("PASS  ", "metachar:sym<( )>", " at pos=", rx200_pos)
    .return (rx200_cur)
  rx200_fail:
.annotate 'line', 3
    (rx200_rep, rx200_pos, $I10, $P10) = rx200_cur."!mark_fail"(0)
    lt rx200_pos, -1, rx200_done
    eq rx200_pos, -1, rx200_fail
    jump $I10
  rx200_done:
    rx200_cur."!cursor_fail"()
    rx200_cur."!cursor_debug"("FAIL  ", "metachar:sym<( )>")
    .return (rx200_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<( )>"  :subid("54_1275811476.7961") :method
.annotate 'line', 3
    $P202 = self."!PREFIX__!subrule"("nibbler", "(")
    new $P203, "ResizablePMCArray"
    push $P203, $P202
    .return ($P203)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<'>"  :subid("55_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx206_tgt
    .local int rx206_pos
    .local int rx206_off
    .local int rx206_eos
    .local int rx206_rep
    .local pmc rx206_cur
    (rx206_cur, rx206_pos, rx206_tgt) = self."!cursor_start"()
    rx206_cur."!cursor_debug"("START ", "metachar:sym<'>")
    .lex unicode:"$\x{a2}", rx206_cur
    .local pmc match
    .lex "$/", match
    length rx206_eos, rx206_tgt
    gt rx206_pos, rx206_eos, rx206_done
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
.annotate 'line', 77
  # rx enumcharlist negate=0 zerowidth
    ge rx206_pos, rx206_eos, rx206_fail
    sub $I10, rx206_pos, rx206_off
    substr $S10, rx206_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx206_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx206_cur."!cursor_pos"(rx206_pos)
    $P10 = rx206_cur."quote_EXPR"(":q")
    unless $P10, rx206_fail
    rx206_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx206_pos = $P10."pos"()
  # rx pass
    rx206_cur."!cursor_pass"(rx206_pos, "metachar:sym<'>")
    rx206_cur."!cursor_debug"("PASS  ", "metachar:sym<'>", " at pos=", rx206_pos)
    .return (rx206_cur)
  rx206_fail:
.annotate 'line', 3
    (rx206_rep, rx206_pos, $I10, $P10) = rx206_cur."!mark_fail"(0)
    lt rx206_pos, -1, rx206_done
    eq rx206_pos, -1, rx206_fail
    jump $I10
  rx206_done:
    rx206_cur."!cursor_fail"()
    rx206_cur."!cursor_debug"("FAIL  ", "metachar:sym<'>")
    .return (rx206_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<'>"  :subid("56_1275811476.7961") :method
.annotate 'line', 3
    new $P208, "ResizablePMCArray"
    push $P208, "'"
    .return ($P208)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<\">"  :subid("57_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx211_tgt
    .local int rx211_pos
    .local int rx211_off
    .local int rx211_eos
    .local int rx211_rep
    .local pmc rx211_cur
    (rx211_cur, rx211_pos, rx211_tgt) = self."!cursor_start"()
    rx211_cur."!cursor_debug"("START ", "metachar:sym<\">")
    .lex unicode:"$\x{a2}", rx211_cur
    .local pmc match
    .lex "$/", match
    length rx211_eos, rx211_tgt
    gt rx211_pos, rx211_eos, rx211_done
    set rx211_off, 0
    lt rx211_pos, 2, rx211_start
    sub rx211_off, rx211_pos, 1
    substr rx211_tgt, rx211_tgt, rx211_off
  rx211_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan214_done
    goto rxscan214_scan
  rxscan214_loop:
    ($P10) = rx211_cur."from"()
    inc $P10
    set rx211_pos, $P10
    ge rx211_pos, rx211_eos, rxscan214_done
  rxscan214_scan:
    set_addr $I10, rxscan214_loop
    rx211_cur."!mark_push"(0, rx211_pos, $I10)
  rxscan214_done:
.annotate 'line', 78
  # rx enumcharlist negate=0 zerowidth
    ge rx211_pos, rx211_eos, rx211_fail
    sub $I10, rx211_pos, rx211_off
    substr $S10, rx211_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx211_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx211_cur."!cursor_pos"(rx211_pos)
    $P10 = rx211_cur."quote_EXPR"(":qq")
    unless $P10, rx211_fail
    rx211_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx211_pos = $P10."pos"()
  # rx pass
    rx211_cur."!cursor_pass"(rx211_pos, "metachar:sym<\">")
    rx211_cur."!cursor_debug"("PASS  ", "metachar:sym<\">", " at pos=", rx211_pos)
    .return (rx211_cur)
  rx211_fail:
.annotate 'line', 3
    (rx211_rep, rx211_pos, $I10, $P10) = rx211_cur."!mark_fail"(0)
    lt rx211_pos, -1, rx211_done
    eq rx211_pos, -1, rx211_fail
    jump $I10
  rx211_done:
    rx211_cur."!cursor_fail"()
    rx211_cur."!cursor_debug"("FAIL  ", "metachar:sym<\">")
    .return (rx211_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<\">"  :subid("58_1275811476.7961") :method
.annotate 'line', 3
    new $P213, "ResizablePMCArray"
    push $P213, "\""
    .return ($P213)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<.>"  :subid("59_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx216_tgt
    .local int rx216_pos
    .local int rx216_off
    .local int rx216_eos
    .local int rx216_rep
    .local pmc rx216_cur
    (rx216_cur, rx216_pos, rx216_tgt) = self."!cursor_start"()
    rx216_cur."!cursor_debug"("START ", "metachar:sym<.>")
    .lex unicode:"$\x{a2}", rx216_cur
    .local pmc match
    .lex "$/", match
    length rx216_eos, rx216_tgt
    gt rx216_pos, rx216_eos, rx216_done
    set rx216_off, 0
    lt rx216_pos, 2, rx216_start
    sub rx216_off, rx216_pos, 1
    substr rx216_tgt, rx216_tgt, rx216_off
  rx216_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan219_done
    goto rxscan219_scan
  rxscan219_loop:
    ($P10) = rx216_cur."from"()
    inc $P10
    set rx216_pos, $P10
    ge rx216_pos, rx216_eos, rxscan219_done
  rxscan219_scan:
    set_addr $I10, rxscan219_loop
    rx216_cur."!mark_push"(0, rx216_pos, $I10)
  rxscan219_done:
.annotate 'line', 79
  # rx subcapture "sym"
    set_addr $I10, rxcap_220_fail
    rx216_cur."!mark_push"(0, rx216_pos, $I10)
  # rx literal  "."
    add $I11, rx216_pos, 1
    gt $I11, rx216_eos, rx216_fail
    sub $I11, rx216_pos, rx216_off
    substr $S10, rx216_tgt, $I11, 1
    ne $S10, ".", rx216_fail
    add rx216_pos, 1
    set_addr $I10, rxcap_220_fail
    ($I12, $I11) = rx216_cur."!mark_peek"($I10)
    rx216_cur."!cursor_pos"($I11)
    ($P10) = rx216_cur."!cursor_start"()
    $P10."!cursor_pass"(rx216_pos, "")
    rx216_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_220_done
  rxcap_220_fail:
    goto rx216_fail
  rxcap_220_done:
  # rx pass
    rx216_cur."!cursor_pass"(rx216_pos, "metachar:sym<.>")
    rx216_cur."!cursor_debug"("PASS  ", "metachar:sym<.>", " at pos=", rx216_pos)
    .return (rx216_cur)
  rx216_fail:
.annotate 'line', 3
    (rx216_rep, rx216_pos, $I10, $P10) = rx216_cur."!mark_fail"(0)
    lt rx216_pos, -1, rx216_done
    eq rx216_pos, -1, rx216_fail
    jump $I10
  rx216_done:
    rx216_cur."!cursor_fail"()
    rx216_cur."!cursor_debug"("FAIL  ", "metachar:sym<.>")
    .return (rx216_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<.>"  :subid("60_1275811476.7961") :method
.annotate 'line', 3
    new $P218, "ResizablePMCArray"
    push $P218, "."
    .return ($P218)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^>"  :subid("61_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx222_tgt
    .local int rx222_pos
    .local int rx222_off
    .local int rx222_eos
    .local int rx222_rep
    .local pmc rx222_cur
    (rx222_cur, rx222_pos, rx222_tgt) = self."!cursor_start"()
    rx222_cur."!cursor_debug"("START ", "metachar:sym<^>")
    .lex unicode:"$\x{a2}", rx222_cur
    .local pmc match
    .lex "$/", match
    length rx222_eos, rx222_tgt
    gt rx222_pos, rx222_eos, rx222_done
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
.annotate 'line', 80
  # rx subcapture "sym"
    set_addr $I10, rxcap_226_fail
    rx222_cur."!mark_push"(0, rx222_pos, $I10)
  # rx literal  "^"
    add $I11, rx222_pos, 1
    gt $I11, rx222_eos, rx222_fail
    sub $I11, rx222_pos, rx222_off
    substr $S10, rx222_tgt, $I11, 1
    ne $S10, "^", rx222_fail
    add rx222_pos, 1
    set_addr $I10, rxcap_226_fail
    ($I12, $I11) = rx222_cur."!mark_peek"($I10)
    rx222_cur."!cursor_pos"($I11)
    ($P10) = rx222_cur."!cursor_start"()
    $P10."!cursor_pass"(rx222_pos, "")
    rx222_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_226_done
  rxcap_226_fail:
    goto rx222_fail
  rxcap_226_done:
  # rx pass
    rx222_cur."!cursor_pass"(rx222_pos, "metachar:sym<^>")
    rx222_cur."!cursor_debug"("PASS  ", "metachar:sym<^>", " at pos=", rx222_pos)
    .return (rx222_cur)
  rx222_fail:
.annotate 'line', 3
    (rx222_rep, rx222_pos, $I10, $P10) = rx222_cur."!mark_fail"(0)
    lt rx222_pos, -1, rx222_done
    eq rx222_pos, -1, rx222_fail
    jump $I10
  rx222_done:
    rx222_cur."!cursor_fail"()
    rx222_cur."!cursor_debug"("FAIL  ", "metachar:sym<^>")
    .return (rx222_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<^>"  :subid("62_1275811476.7961") :method
.annotate 'line', 3
    new $P224, "ResizablePMCArray"
    push $P224, "^"
    .return ($P224)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^^>"  :subid("63_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx228_tgt
    .local int rx228_pos
    .local int rx228_off
    .local int rx228_eos
    .local int rx228_rep
    .local pmc rx228_cur
    (rx228_cur, rx228_pos, rx228_tgt) = self."!cursor_start"()
    rx228_cur."!cursor_debug"("START ", "metachar:sym<^^>")
    .lex unicode:"$\x{a2}", rx228_cur
    .local pmc match
    .lex "$/", match
    length rx228_eos, rx228_tgt
    gt rx228_pos, rx228_eos, rx228_done
    set rx228_off, 0
    lt rx228_pos, 2, rx228_start
    sub rx228_off, rx228_pos, 1
    substr rx228_tgt, rx228_tgt, rx228_off
  rx228_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan231_done
    goto rxscan231_scan
  rxscan231_loop:
    ($P10) = rx228_cur."from"()
    inc $P10
    set rx228_pos, $P10
    ge rx228_pos, rx228_eos, rxscan231_done
  rxscan231_scan:
    set_addr $I10, rxscan231_loop
    rx228_cur."!mark_push"(0, rx228_pos, $I10)
  rxscan231_done:
.annotate 'line', 81
  # rx subcapture "sym"
    set_addr $I10, rxcap_232_fail
    rx228_cur."!mark_push"(0, rx228_pos, $I10)
  # rx literal  "^^"
    add $I11, rx228_pos, 2
    gt $I11, rx228_eos, rx228_fail
    sub $I11, rx228_pos, rx228_off
    substr $S10, rx228_tgt, $I11, 2
    ne $S10, "^^", rx228_fail
    add rx228_pos, 2
    set_addr $I10, rxcap_232_fail
    ($I12, $I11) = rx228_cur."!mark_peek"($I10)
    rx228_cur."!cursor_pos"($I11)
    ($P10) = rx228_cur."!cursor_start"()
    $P10."!cursor_pass"(rx228_pos, "")
    rx228_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_232_done
  rxcap_232_fail:
    goto rx228_fail
  rxcap_232_done:
  # rx pass
    rx228_cur."!cursor_pass"(rx228_pos, "metachar:sym<^^>")
    rx228_cur."!cursor_debug"("PASS  ", "metachar:sym<^^>", " at pos=", rx228_pos)
    .return (rx228_cur)
  rx228_fail:
.annotate 'line', 3
    (rx228_rep, rx228_pos, $I10, $P10) = rx228_cur."!mark_fail"(0)
    lt rx228_pos, -1, rx228_done
    eq rx228_pos, -1, rx228_fail
    jump $I10
  rx228_done:
    rx228_cur."!cursor_fail"()
    rx228_cur."!cursor_debug"("FAIL  ", "metachar:sym<^^>")
    .return (rx228_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<^^>"  :subid("64_1275811476.7961") :method
.annotate 'line', 3
    new $P230, "ResizablePMCArray"
    push $P230, "^^"
    .return ($P230)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$>"  :subid("65_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx234_tgt
    .local int rx234_pos
    .local int rx234_off
    .local int rx234_eos
    .local int rx234_rep
    .local pmc rx234_cur
    (rx234_cur, rx234_pos, rx234_tgt) = self."!cursor_start"()
    rx234_cur."!cursor_debug"("START ", "metachar:sym<$>")
    .lex unicode:"$\x{a2}", rx234_cur
    .local pmc match
    .lex "$/", match
    length rx234_eos, rx234_tgt
    gt rx234_pos, rx234_eos, rx234_done
    set rx234_off, 0
    lt rx234_pos, 2, rx234_start
    sub rx234_off, rx234_pos, 1
    substr rx234_tgt, rx234_tgt, rx234_off
  rx234_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan237_done
    goto rxscan237_scan
  rxscan237_loop:
    ($P10) = rx234_cur."from"()
    inc $P10
    set rx234_pos, $P10
    ge rx234_pos, rx234_eos, rxscan237_done
  rxscan237_scan:
    set_addr $I10, rxscan237_loop
    rx234_cur."!mark_push"(0, rx234_pos, $I10)
  rxscan237_done:
.annotate 'line', 82
  # rx subcapture "sym"
    set_addr $I10, rxcap_238_fail
    rx234_cur."!mark_push"(0, rx234_pos, $I10)
  # rx literal  "$"
    add $I11, rx234_pos, 1
    gt $I11, rx234_eos, rx234_fail
    sub $I11, rx234_pos, rx234_off
    substr $S10, rx234_tgt, $I11, 1
    ne $S10, "$", rx234_fail
    add rx234_pos, 1
    set_addr $I10, rxcap_238_fail
    ($I12, $I11) = rx234_cur."!mark_peek"($I10)
    rx234_cur."!cursor_pos"($I11)
    ($P10) = rx234_cur."!cursor_start"()
    $P10."!cursor_pass"(rx234_pos, "")
    rx234_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_238_done
  rxcap_238_fail:
    goto rx234_fail
  rxcap_238_done:
  # rx pass
    rx234_cur."!cursor_pass"(rx234_pos, "metachar:sym<$>")
    rx234_cur."!cursor_debug"("PASS  ", "metachar:sym<$>", " at pos=", rx234_pos)
    .return (rx234_cur)
  rx234_fail:
.annotate 'line', 3
    (rx234_rep, rx234_pos, $I10, $P10) = rx234_cur."!mark_fail"(0)
    lt rx234_pos, -1, rx234_done
    eq rx234_pos, -1, rx234_fail
    jump $I10
  rx234_done:
    rx234_cur."!cursor_fail"()
    rx234_cur."!cursor_debug"("FAIL  ", "metachar:sym<$>")
    .return (rx234_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<$>"  :subid("66_1275811476.7961") :method
.annotate 'line', 3
    new $P236, "ResizablePMCArray"
    push $P236, "$"
    .return ($P236)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$$>"  :subid("67_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx240_tgt
    .local int rx240_pos
    .local int rx240_off
    .local int rx240_eos
    .local int rx240_rep
    .local pmc rx240_cur
    (rx240_cur, rx240_pos, rx240_tgt) = self."!cursor_start"()
    rx240_cur."!cursor_debug"("START ", "metachar:sym<$$>")
    .lex unicode:"$\x{a2}", rx240_cur
    .local pmc match
    .lex "$/", match
    length rx240_eos, rx240_tgt
    gt rx240_pos, rx240_eos, rx240_done
    set rx240_off, 0
    lt rx240_pos, 2, rx240_start
    sub rx240_off, rx240_pos, 1
    substr rx240_tgt, rx240_tgt, rx240_off
  rx240_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan243_done
    goto rxscan243_scan
  rxscan243_loop:
    ($P10) = rx240_cur."from"()
    inc $P10
    set rx240_pos, $P10
    ge rx240_pos, rx240_eos, rxscan243_done
  rxscan243_scan:
    set_addr $I10, rxscan243_loop
    rx240_cur."!mark_push"(0, rx240_pos, $I10)
  rxscan243_done:
.annotate 'line', 83
  # rx subcapture "sym"
    set_addr $I10, rxcap_244_fail
    rx240_cur."!mark_push"(0, rx240_pos, $I10)
  # rx literal  "$$"
    add $I11, rx240_pos, 2
    gt $I11, rx240_eos, rx240_fail
    sub $I11, rx240_pos, rx240_off
    substr $S10, rx240_tgt, $I11, 2
    ne $S10, "$$", rx240_fail
    add rx240_pos, 2
    set_addr $I10, rxcap_244_fail
    ($I12, $I11) = rx240_cur."!mark_peek"($I10)
    rx240_cur."!cursor_pos"($I11)
    ($P10) = rx240_cur."!cursor_start"()
    $P10."!cursor_pass"(rx240_pos, "")
    rx240_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_244_done
  rxcap_244_fail:
    goto rx240_fail
  rxcap_244_done:
  # rx pass
    rx240_cur."!cursor_pass"(rx240_pos, "metachar:sym<$$>")
    rx240_cur."!cursor_debug"("PASS  ", "metachar:sym<$$>", " at pos=", rx240_pos)
    .return (rx240_cur)
  rx240_fail:
.annotate 'line', 3
    (rx240_rep, rx240_pos, $I10, $P10) = rx240_cur."!mark_fail"(0)
    lt rx240_pos, -1, rx240_done
    eq rx240_pos, -1, rx240_fail
    jump $I10
  rx240_done:
    rx240_cur."!cursor_fail"()
    rx240_cur."!cursor_debug"("FAIL  ", "metachar:sym<$$>")
    .return (rx240_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<$$>"  :subid("68_1275811476.7961") :method
.annotate 'line', 3
    new $P242, "ResizablePMCArray"
    push $P242, "$$"
    .return ($P242)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<:::>"  :subid("69_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx246_tgt
    .local int rx246_pos
    .local int rx246_off
    .local int rx246_eos
    .local int rx246_rep
    .local pmc rx246_cur
    (rx246_cur, rx246_pos, rx246_tgt) = self."!cursor_start"()
    rx246_cur."!cursor_debug"("START ", "metachar:sym<:::>")
    .lex unicode:"$\x{a2}", rx246_cur
    .local pmc match
    .lex "$/", match
    length rx246_eos, rx246_tgt
    gt rx246_pos, rx246_eos, rx246_done
    set rx246_off, 0
    lt rx246_pos, 2, rx246_start
    sub rx246_off, rx246_pos, 1
    substr rx246_tgt, rx246_tgt, rx246_off
  rx246_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan250_done
    goto rxscan250_scan
  rxscan250_loop:
    ($P10) = rx246_cur."from"()
    inc $P10
    set rx246_pos, $P10
    ge rx246_pos, rx246_eos, rxscan250_done
  rxscan250_scan:
    set_addr $I10, rxscan250_loop
    rx246_cur."!mark_push"(0, rx246_pos, $I10)
  rxscan250_done:
.annotate 'line', 84
  # rx subcapture "sym"
    set_addr $I10, rxcap_251_fail
    rx246_cur."!mark_push"(0, rx246_pos, $I10)
  # rx literal  ":::"
    add $I11, rx246_pos, 3
    gt $I11, rx246_eos, rx246_fail
    sub $I11, rx246_pos, rx246_off
    substr $S10, rx246_tgt, $I11, 3
    ne $S10, ":::", rx246_fail
    add rx246_pos, 3
    set_addr $I10, rxcap_251_fail
    ($I12, $I11) = rx246_cur."!mark_peek"($I10)
    rx246_cur."!cursor_pos"($I11)
    ($P10) = rx246_cur."!cursor_start"()
    $P10."!cursor_pass"(rx246_pos, "")
    rx246_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_251_done
  rxcap_251_fail:
    goto rx246_fail
  rxcap_251_done:
  # rx subrule "panic" subtype=method negate=
    rx246_cur."!cursor_pos"(rx246_pos)
    $P10 = rx246_cur."panic"("::: not yet implemented")
    unless $P10, rx246_fail
    rx246_pos = $P10."pos"()
  # rx pass
    rx246_cur."!cursor_pass"(rx246_pos, "metachar:sym<:::>")
    rx246_cur."!cursor_debug"("PASS  ", "metachar:sym<:::>", " at pos=", rx246_pos)
    .return (rx246_cur)
  rx246_fail:
.annotate 'line', 3
    (rx246_rep, rx246_pos, $I10, $P10) = rx246_cur."!mark_fail"(0)
    lt rx246_pos, -1, rx246_done
    eq rx246_pos, -1, rx246_fail
    jump $I10
  rx246_done:
    rx246_cur."!cursor_fail"()
    rx246_cur."!cursor_debug"("FAIL  ", "metachar:sym<:::>")
    .return (rx246_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<:::>"  :subid("70_1275811476.7961") :method
.annotate 'line', 3
    $P248 = self."!PREFIX__!subrule"("panic", ":::")
    new $P249, "ResizablePMCArray"
    push $P249, $P248
    .return ($P249)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<::>"  :subid("71_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx253_tgt
    .local int rx253_pos
    .local int rx253_off
    .local int rx253_eos
    .local int rx253_rep
    .local pmc rx253_cur
    (rx253_cur, rx253_pos, rx253_tgt) = self."!cursor_start"()
    rx253_cur."!cursor_debug"("START ", "metachar:sym<::>")
    .lex unicode:"$\x{a2}", rx253_cur
    .local pmc match
    .lex "$/", match
    length rx253_eos, rx253_tgt
    gt rx253_pos, rx253_eos, rx253_done
    set rx253_off, 0
    lt rx253_pos, 2, rx253_start
    sub rx253_off, rx253_pos, 1
    substr rx253_tgt, rx253_tgt, rx253_off
  rx253_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan257_done
    goto rxscan257_scan
  rxscan257_loop:
    ($P10) = rx253_cur."from"()
    inc $P10
    set rx253_pos, $P10
    ge rx253_pos, rx253_eos, rxscan257_done
  rxscan257_scan:
    set_addr $I10, rxscan257_loop
    rx253_cur."!mark_push"(0, rx253_pos, $I10)
  rxscan257_done:
.annotate 'line', 85
  # rx subcapture "sym"
    set_addr $I10, rxcap_258_fail
    rx253_cur."!mark_push"(0, rx253_pos, $I10)
  # rx literal  "::"
    add $I11, rx253_pos, 2
    gt $I11, rx253_eos, rx253_fail
    sub $I11, rx253_pos, rx253_off
    substr $S10, rx253_tgt, $I11, 2
    ne $S10, "::", rx253_fail
    add rx253_pos, 2
    set_addr $I10, rxcap_258_fail
    ($I12, $I11) = rx253_cur."!mark_peek"($I10)
    rx253_cur."!cursor_pos"($I11)
    ($P10) = rx253_cur."!cursor_start"()
    $P10."!cursor_pass"(rx253_pos, "")
    rx253_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_258_done
  rxcap_258_fail:
    goto rx253_fail
  rxcap_258_done:
  # rx subrule "panic" subtype=method negate=
    rx253_cur."!cursor_pos"(rx253_pos)
    $P10 = rx253_cur."panic"(":: not yet implemented")
    unless $P10, rx253_fail
    rx253_pos = $P10."pos"()
  # rx pass
    rx253_cur."!cursor_pass"(rx253_pos, "metachar:sym<::>")
    rx253_cur."!cursor_debug"("PASS  ", "metachar:sym<::>", " at pos=", rx253_pos)
    .return (rx253_cur)
  rx253_fail:
.annotate 'line', 3
    (rx253_rep, rx253_pos, $I10, $P10) = rx253_cur."!mark_fail"(0)
    lt rx253_pos, -1, rx253_done
    eq rx253_pos, -1, rx253_fail
    jump $I10
  rx253_done:
    rx253_cur."!cursor_fail"()
    rx253_cur."!cursor_debug"("FAIL  ", "metachar:sym<::>")
    .return (rx253_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<::>"  :subid("72_1275811476.7961") :method
.annotate 'line', 3
    $P255 = self."!PREFIX__!subrule"("panic", "::")
    new $P256, "ResizablePMCArray"
    push $P256, $P255
    .return ($P256)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<lwb>"  :subid("73_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx260_tgt
    .local int rx260_pos
    .local int rx260_off
    .local int rx260_eos
    .local int rx260_rep
    .local pmc rx260_cur
    (rx260_cur, rx260_pos, rx260_tgt) = self."!cursor_start"()
    rx260_cur."!cursor_debug"("START ", "metachar:sym<lwb>")
    .lex unicode:"$\x{a2}", rx260_cur
    .local pmc match
    .lex "$/", match
    length rx260_eos, rx260_tgt
    gt rx260_pos, rx260_eos, rx260_done
    set rx260_off, 0
    lt rx260_pos, 2, rx260_start
    sub rx260_off, rx260_pos, 1
    substr rx260_tgt, rx260_tgt, rx260_off
  rx260_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan263_done
    goto rxscan263_scan
  rxscan263_loop:
    ($P10) = rx260_cur."from"()
    inc $P10
    set rx260_pos, $P10
    ge rx260_pos, rx260_eos, rxscan263_done
  rxscan263_scan:
    set_addr $I10, rxscan263_loop
    rx260_cur."!mark_push"(0, rx260_pos, $I10)
  rxscan263_done:
.annotate 'line', 86
  # rx subcapture "sym"
    set_addr $I10, rxcap_265_fail
    rx260_cur."!mark_push"(0, rx260_pos, $I10)
  alt264_0:
    set_addr $I10, alt264_1
    rx260_cur."!mark_push"(0, rx260_pos, $I10)
  # rx literal  "<<"
    add $I11, rx260_pos, 2
    gt $I11, rx260_eos, rx260_fail
    sub $I11, rx260_pos, rx260_off
    substr $S10, rx260_tgt, $I11, 2
    ne $S10, "<<", rx260_fail
    add rx260_pos, 2
    goto alt264_end
  alt264_1:
  # rx literal  unicode:"\x{ab}"
    add $I11, rx260_pos, 1
    gt $I11, rx260_eos, rx260_fail
    sub $I11, rx260_pos, rx260_off
    substr $S10, rx260_tgt, $I11, 1
    ne $S10, unicode:"\x{ab}", rx260_fail
    add rx260_pos, 1
  alt264_end:
    set_addr $I10, rxcap_265_fail
    ($I12, $I11) = rx260_cur."!mark_peek"($I10)
    rx260_cur."!cursor_pos"($I11)
    ($P10) = rx260_cur."!cursor_start"()
    $P10."!cursor_pass"(rx260_pos, "")
    rx260_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_265_done
  rxcap_265_fail:
    goto rx260_fail
  rxcap_265_done:
  # rx pass
    rx260_cur."!cursor_pass"(rx260_pos, "metachar:sym<lwb>")
    rx260_cur."!cursor_debug"("PASS  ", "metachar:sym<lwb>", " at pos=", rx260_pos)
    .return (rx260_cur)
  rx260_fail:
.annotate 'line', 3
    (rx260_rep, rx260_pos, $I10, $P10) = rx260_cur."!mark_fail"(0)
    lt rx260_pos, -1, rx260_done
    eq rx260_pos, -1, rx260_fail
    jump $I10
  rx260_done:
    rx260_cur."!cursor_fail"()
    rx260_cur."!cursor_debug"("FAIL  ", "metachar:sym<lwb>")
    .return (rx260_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<lwb>"  :subid("74_1275811476.7961") :method
.annotate 'line', 3
    new $P262, "ResizablePMCArray"
    push $P262, unicode:"\x{ab}"
    push $P262, "<<"
    .return ($P262)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<rwb>"  :subid("75_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx267_tgt
    .local int rx267_pos
    .local int rx267_off
    .local int rx267_eos
    .local int rx267_rep
    .local pmc rx267_cur
    (rx267_cur, rx267_pos, rx267_tgt) = self."!cursor_start"()
    rx267_cur."!cursor_debug"("START ", "metachar:sym<rwb>")
    .lex unicode:"$\x{a2}", rx267_cur
    .local pmc match
    .lex "$/", match
    length rx267_eos, rx267_tgt
    gt rx267_pos, rx267_eos, rx267_done
    set rx267_off, 0
    lt rx267_pos, 2, rx267_start
    sub rx267_off, rx267_pos, 1
    substr rx267_tgt, rx267_tgt, rx267_off
  rx267_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan270_done
    goto rxscan270_scan
  rxscan270_loop:
    ($P10) = rx267_cur."from"()
    inc $P10
    set rx267_pos, $P10
    ge rx267_pos, rx267_eos, rxscan270_done
  rxscan270_scan:
    set_addr $I10, rxscan270_loop
    rx267_cur."!mark_push"(0, rx267_pos, $I10)
  rxscan270_done:
.annotate 'line', 87
  # rx subcapture "sym"
    set_addr $I10, rxcap_272_fail
    rx267_cur."!mark_push"(0, rx267_pos, $I10)
  alt271_0:
    set_addr $I10, alt271_1
    rx267_cur."!mark_push"(0, rx267_pos, $I10)
  # rx literal  ">>"
    add $I11, rx267_pos, 2
    gt $I11, rx267_eos, rx267_fail
    sub $I11, rx267_pos, rx267_off
    substr $S10, rx267_tgt, $I11, 2
    ne $S10, ">>", rx267_fail
    add rx267_pos, 2
    goto alt271_end
  alt271_1:
  # rx literal  unicode:"\x{bb}"
    add $I11, rx267_pos, 1
    gt $I11, rx267_eos, rx267_fail
    sub $I11, rx267_pos, rx267_off
    substr $S10, rx267_tgt, $I11, 1
    ne $S10, unicode:"\x{bb}", rx267_fail
    add rx267_pos, 1
  alt271_end:
    set_addr $I10, rxcap_272_fail
    ($I12, $I11) = rx267_cur."!mark_peek"($I10)
    rx267_cur."!cursor_pos"($I11)
    ($P10) = rx267_cur."!cursor_start"()
    $P10."!cursor_pass"(rx267_pos, "")
    rx267_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_272_done
  rxcap_272_fail:
    goto rx267_fail
  rxcap_272_done:
  # rx pass
    rx267_cur."!cursor_pass"(rx267_pos, "metachar:sym<rwb>")
    rx267_cur."!cursor_debug"("PASS  ", "metachar:sym<rwb>", " at pos=", rx267_pos)
    .return (rx267_cur)
  rx267_fail:
.annotate 'line', 3
    (rx267_rep, rx267_pos, $I10, $P10) = rx267_cur."!mark_fail"(0)
    lt rx267_pos, -1, rx267_done
    eq rx267_pos, -1, rx267_fail
    jump $I10
  rx267_done:
    rx267_cur."!cursor_fail"()
    rx267_cur."!cursor_debug"("FAIL  ", "metachar:sym<rwb>")
    .return (rx267_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<rwb>"  :subid("76_1275811476.7961") :method
.annotate 'line', 3
    new $P269, "ResizablePMCArray"
    push $P269, unicode:"\x{bb}"
    push $P269, ">>"
    .return ($P269)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<bs>"  :subid("77_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx274_tgt
    .local int rx274_pos
    .local int rx274_off
    .local int rx274_eos
    .local int rx274_rep
    .local pmc rx274_cur
    (rx274_cur, rx274_pos, rx274_tgt) = self."!cursor_start"()
    rx274_cur."!cursor_debug"("START ", "metachar:sym<bs>")
    .lex unicode:"$\x{a2}", rx274_cur
    .local pmc match
    .lex "$/", match
    length rx274_eos, rx274_tgt
    gt rx274_pos, rx274_eos, rx274_done
    set rx274_off, 0
    lt rx274_pos, 2, rx274_start
    sub rx274_off, rx274_pos, 1
    substr rx274_tgt, rx274_tgt, rx274_off
  rx274_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan278_done
    goto rxscan278_scan
  rxscan278_loop:
    ($P10) = rx274_cur."from"()
    inc $P10
    set rx274_pos, $P10
    ge rx274_pos, rx274_eos, rxscan278_done
  rxscan278_scan:
    set_addr $I10, rxscan278_loop
    rx274_cur."!mark_push"(0, rx274_pos, $I10)
  rxscan278_done:
.annotate 'line', 88
  # rx literal  "\\"
    add $I11, rx274_pos, 1
    gt $I11, rx274_eos, rx274_fail
    sub $I11, rx274_pos, rx274_off
    substr $S10, rx274_tgt, $I11, 1
    ne $S10, "\\", rx274_fail
    add rx274_pos, 1
  # rx subrule "backslash" subtype=capture negate=
    rx274_cur."!cursor_pos"(rx274_pos)
    $P10 = rx274_cur."backslash"()
    unless $P10, rx274_fail
    rx274_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backslash")
    rx274_pos = $P10."pos"()
  # rx pass
    rx274_cur."!cursor_pass"(rx274_pos, "metachar:sym<bs>")
    rx274_cur."!cursor_debug"("PASS  ", "metachar:sym<bs>", " at pos=", rx274_pos)
    .return (rx274_cur)
  rx274_fail:
.annotate 'line', 3
    (rx274_rep, rx274_pos, $I10, $P10) = rx274_cur."!mark_fail"(0)
    lt rx274_pos, -1, rx274_done
    eq rx274_pos, -1, rx274_fail
    jump $I10
  rx274_done:
    rx274_cur."!cursor_fail"()
    rx274_cur."!cursor_debug"("FAIL  ", "metachar:sym<bs>")
    .return (rx274_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<bs>"  :subid("78_1275811476.7961") :method
.annotate 'line', 3
    $P276 = self."!PREFIX__!subrule"("backslash", "\\")
    new $P277, "ResizablePMCArray"
    push $P277, $P276
    .return ($P277)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<mod>"  :subid("79_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx280_tgt
    .local int rx280_pos
    .local int rx280_off
    .local int rx280_eos
    .local int rx280_rep
    .local pmc rx280_cur
    (rx280_cur, rx280_pos, rx280_tgt) = self."!cursor_start"()
    rx280_cur."!cursor_debug"("START ", "metachar:sym<mod>")
    .lex unicode:"$\x{a2}", rx280_cur
    .local pmc match
    .lex "$/", match
    length rx280_eos, rx280_tgt
    gt rx280_pos, rx280_eos, rx280_done
    set rx280_off, 0
    lt rx280_pos, 2, rx280_start
    sub rx280_off, rx280_pos, 1
    substr rx280_tgt, rx280_tgt, rx280_off
  rx280_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan284_done
    goto rxscan284_scan
  rxscan284_loop:
    ($P10) = rx280_cur."from"()
    inc $P10
    set rx280_pos, $P10
    ge rx280_pos, rx280_eos, rxscan284_done
  rxscan284_scan:
    set_addr $I10, rxscan284_loop
    rx280_cur."!mark_push"(0, rx280_pos, $I10)
  rxscan284_done:
.annotate 'line', 89
  # rx subrule "mod_internal" subtype=capture negate=
    rx280_cur."!cursor_pos"(rx280_pos)
    $P10 = rx280_cur."mod_internal"()
    unless $P10, rx280_fail
    rx280_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_internal")
    rx280_pos = $P10."pos"()
  # rx pass
    rx280_cur."!cursor_pass"(rx280_pos, "metachar:sym<mod>")
    rx280_cur."!cursor_debug"("PASS  ", "metachar:sym<mod>", " at pos=", rx280_pos)
    .return (rx280_cur)
  rx280_fail:
.annotate 'line', 3
    (rx280_rep, rx280_pos, $I10, $P10) = rx280_cur."!mark_fail"(0)
    lt rx280_pos, -1, rx280_done
    eq rx280_pos, -1, rx280_fail
    jump $I10
  rx280_done:
    rx280_cur."!cursor_fail"()
    rx280_cur."!cursor_debug"("FAIL  ", "metachar:sym<mod>")
    .return (rx280_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<mod>"  :subid("80_1275811476.7961") :method
.annotate 'line', 3
    $P282 = self."!PREFIX__!subrule"("mod_internal", "")
    new $P283, "ResizablePMCArray"
    push $P283, $P282
    .return ($P283)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<~>"  :subid("81_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx286_tgt
    .local int rx286_pos
    .local int rx286_off
    .local int rx286_eos
    .local int rx286_rep
    .local pmc rx286_cur
    (rx286_cur, rx286_pos, rx286_tgt) = self."!cursor_start"()
    rx286_cur."!cursor_debug"("START ", "metachar:sym<~>")
    .lex unicode:"$\x{a2}", rx286_cur
    .local pmc match
    .lex "$/", match
    length rx286_eos, rx286_tgt
    gt rx286_pos, rx286_eos, rx286_done
    set rx286_off, 0
    lt rx286_pos, 2, rx286_start
    sub rx286_off, rx286_pos, 1
    substr rx286_tgt, rx286_tgt, rx286_off
  rx286_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan290_done
    goto rxscan290_scan
  rxscan290_loop:
    ($P10) = rx286_cur."from"()
    inc $P10
    set rx286_pos, $P10
    ge rx286_pos, rx286_eos, rxscan290_done
  rxscan290_scan:
    set_addr $I10, rxscan290_loop
    rx286_cur."!mark_push"(0, rx286_pos, $I10)
  rxscan290_done:
.annotate 'line', 93
  # rx subcapture "sym"
    set_addr $I10, rxcap_291_fail
    rx286_cur."!mark_push"(0, rx286_pos, $I10)
  # rx literal  "~"
    add $I11, rx286_pos, 1
    gt $I11, rx286_eos, rx286_fail
    sub $I11, rx286_pos, rx286_off
    substr $S10, rx286_tgt, $I11, 1
    ne $S10, "~", rx286_fail
    add rx286_pos, 1
    set_addr $I10, rxcap_291_fail
    ($I12, $I11) = rx286_cur."!mark_peek"($I10)
    rx286_cur."!cursor_pos"($I11)
    ($P10) = rx286_cur."!cursor_start"()
    $P10."!cursor_pass"(rx286_pos, "")
    rx286_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_291_done
  rxcap_291_fail:
    goto rx286_fail
  rxcap_291_done:
.annotate 'line', 94
  # rx subrule "ws" subtype=method negate=
    rx286_cur."!cursor_pos"(rx286_pos)
    $P10 = rx286_cur."ws"()
    unless $P10, rx286_fail
    rx286_pos = $P10."pos"()
  # rx subrule "quantified_atom" subtype=capture negate=
    rx286_cur."!cursor_pos"(rx286_pos)
    $P10 = rx286_cur."quantified_atom"()
    unless $P10, rx286_fail
    rx286_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("GOAL")
    rx286_pos = $P10."pos"()
.annotate 'line', 95
  # rx subrule "ws" subtype=method negate=
    rx286_cur."!cursor_pos"(rx286_pos)
    $P10 = rx286_cur."ws"()
    unless $P10, rx286_fail
    rx286_pos = $P10."pos"()
  # rx subrule "quantified_atom" subtype=capture negate=
    rx286_cur."!cursor_pos"(rx286_pos)
    $P10 = rx286_cur."quantified_atom"()
    unless $P10, rx286_fail
    rx286_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx286_pos = $P10."pos"()
.annotate 'line', 92
  # rx pass
    rx286_cur."!cursor_pass"(rx286_pos, "metachar:sym<~>")
    rx286_cur."!cursor_debug"("PASS  ", "metachar:sym<~>", " at pos=", rx286_pos)
    .return (rx286_cur)
  rx286_fail:
.annotate 'line', 3
    (rx286_rep, rx286_pos, $I10, $P10) = rx286_cur."!mark_fail"(0)
    lt rx286_pos, -1, rx286_done
    eq rx286_pos, -1, rx286_fail
    jump $I10
  rx286_done:
    rx286_cur."!cursor_fail"()
    rx286_cur."!cursor_debug"("FAIL  ", "metachar:sym<~>")
    .return (rx286_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<~>"  :subid("82_1275811476.7961") :method
.annotate 'line', 3
    $P288 = self."!PREFIX__!subrule"("ws", "~")
    new $P289, "ResizablePMCArray"
    push $P289, $P288
    .return ($P289)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<{*}>"  :subid("83_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx293_tgt
    .local int rx293_pos
    .local int rx293_off
    .local int rx293_eos
    .local int rx293_rep
    .local pmc rx293_cur
    (rx293_cur, rx293_pos, rx293_tgt) = self."!cursor_start"()
    rx293_cur."!cursor_debug"("START ", "metachar:sym<{*}>")
    rx293_cur."!cursor_caparray"("key")
    .lex unicode:"$\x{a2}", rx293_cur
    .local pmc match
    .lex "$/", match
    length rx293_eos, rx293_tgt
    gt rx293_pos, rx293_eos, rx293_done
    set rx293_off, 0
    lt rx293_pos, 2, rx293_start
    sub rx293_off, rx293_pos, 1
    substr rx293_tgt, rx293_tgt, rx293_off
  rx293_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan296_done
    goto rxscan296_scan
  rxscan296_loop:
    ($P10) = rx293_cur."from"()
    inc $P10
    set rx293_pos, $P10
    ge rx293_pos, rx293_eos, rxscan296_done
  rxscan296_scan:
    set_addr $I10, rxscan296_loop
    rx293_cur."!mark_push"(0, rx293_pos, $I10)
  rxscan296_done:
.annotate 'line', 99
  # rx subcapture "sym"
    set_addr $I10, rxcap_297_fail
    rx293_cur."!mark_push"(0, rx293_pos, $I10)
  # rx literal  "{*}"
    add $I11, rx293_pos, 3
    gt $I11, rx293_eos, rx293_fail
    sub $I11, rx293_pos, rx293_off
    substr $S10, rx293_tgt, $I11, 3
    ne $S10, "{*}", rx293_fail
    add rx293_pos, 3
    set_addr $I10, rxcap_297_fail
    ($I12, $I11) = rx293_cur."!mark_peek"($I10)
    rx293_cur."!cursor_pos"($I11)
    ($P10) = rx293_cur."!cursor_start"()
    $P10."!cursor_pass"(rx293_pos, "")
    rx293_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_297_done
  rxcap_297_fail:
    goto rx293_fail
  rxcap_297_done:
.annotate 'line', 100
  # rx rxquantr298 ** 0..1
    set_addr $I308, rxquantr298_done
    rx293_cur."!mark_push"(0, rx293_pos, $I308)
  rxquantr298_loop:
  # rx rxquantr299 ** 0..*
    set_addr $I300, rxquantr299_done
    rx293_cur."!mark_push"(0, rx293_pos, $I300)
  rxquantr299_loop:
  # rx enumcharlist negate=0 
    ge rx293_pos, rx293_eos, rx293_fail
    sub $I10, rx293_pos, rx293_off
    substr $S10, rx293_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx293_fail
    inc rx293_pos
    (rx293_rep) = rx293_cur."!mark_commit"($I300)
    rx293_cur."!mark_push"(rx293_rep, rx293_pos, $I300)
    goto rxquantr299_loop
  rxquantr299_done:
  # rx literal  "#= "
    add $I11, rx293_pos, 3
    gt $I11, rx293_eos, rx293_fail
    sub $I11, rx293_pos, rx293_off
    substr $S10, rx293_tgt, $I11, 3
    ne $S10, "#= ", rx293_fail
    add rx293_pos, 3
  # rx rxquantr301 ** 0..*
    set_addr $I302, rxquantr301_done
    rx293_cur."!mark_push"(0, rx293_pos, $I302)
  rxquantr301_loop:
  # rx enumcharlist negate=0 
    ge rx293_pos, rx293_eos, rx293_fail
    sub $I10, rx293_pos, rx293_off
    substr $S10, rx293_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx293_fail
    inc rx293_pos
    (rx293_rep) = rx293_cur."!mark_commit"($I302)
    rx293_cur."!mark_push"(rx293_rep, rx293_pos, $I302)
    goto rxquantr301_loop
  rxquantr301_done:
  # rx subcapture "key"
    set_addr $I10, rxcap_307_fail
    rx293_cur."!mark_push"(0, rx293_pos, $I10)
  # rx charclass_q S r 1..-1
    sub $I10, rx293_pos, rx293_off
    find_cclass $I11, 32, rx293_tgt, $I10, rx293_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx293_fail
    add rx293_pos, rx293_off, $I11
  # rx rxquantr303 ** 0..*
    set_addr $I306, rxquantr303_done
    rx293_cur."!mark_push"(0, rx293_pos, $I306)
  rxquantr303_loop:
  # rx rxquantr304 ** 1..*
    set_addr $I305, rxquantr304_done
    rx293_cur."!mark_push"(0, -1, $I305)
  rxquantr304_loop:
  # rx enumcharlist negate=0 
    ge rx293_pos, rx293_eos, rx293_fail
    sub $I10, rx293_pos, rx293_off
    substr $S10, rx293_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx293_fail
    inc rx293_pos
    (rx293_rep) = rx293_cur."!mark_commit"($I305)
    rx293_cur."!mark_push"(rx293_rep, rx293_pos, $I305)
    goto rxquantr304_loop
  rxquantr304_done:
  # rx charclass_q S r 1..-1
    sub $I10, rx293_pos, rx293_off
    find_cclass $I11, 32, rx293_tgt, $I10, rx293_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx293_fail
    add rx293_pos, rx293_off, $I11
    (rx293_rep) = rx293_cur."!mark_commit"($I306)
    rx293_cur."!mark_push"(rx293_rep, rx293_pos, $I306)
    goto rxquantr303_loop
  rxquantr303_done:
    set_addr $I10, rxcap_307_fail
    ($I12, $I11) = rx293_cur."!mark_peek"($I10)
    rx293_cur."!cursor_pos"($I11)
    ($P10) = rx293_cur."!cursor_start"()
    $P10."!cursor_pass"(rx293_pos, "")
    rx293_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("key")
    goto rxcap_307_done
  rxcap_307_fail:
    goto rx293_fail
  rxcap_307_done:
    (rx293_rep) = rx293_cur."!mark_commit"($I308)
  rxquantr298_done:
.annotate 'line', 98
  # rx pass
    rx293_cur."!cursor_pass"(rx293_pos, "metachar:sym<{*}>")
    rx293_cur."!cursor_debug"("PASS  ", "metachar:sym<{*}>", " at pos=", rx293_pos)
    .return (rx293_cur)
  rx293_fail:
.annotate 'line', 3
    (rx293_rep, rx293_pos, $I10, $P10) = rx293_cur."!mark_fail"(0)
    lt rx293_pos, -1, rx293_done
    eq rx293_pos, -1, rx293_fail
    jump $I10
  rx293_done:
    rx293_cur."!cursor_fail"()
    rx293_cur."!cursor_debug"("FAIL  ", "metachar:sym<{*}>")
    .return (rx293_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<{*}>"  :subid("84_1275811476.7961") :method
.annotate 'line', 3
    new $P295, "ResizablePMCArray"
    push $P295, "{*}"
    .return ($P295)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<assert>"  :subid("85_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx310_tgt
    .local int rx310_pos
    .local int rx310_off
    .local int rx310_eos
    .local int rx310_rep
    .local pmc rx310_cur
    (rx310_cur, rx310_pos, rx310_tgt) = self."!cursor_start"()
    rx310_cur."!cursor_debug"("START ", "metachar:sym<assert>")
    .lex unicode:"$\x{a2}", rx310_cur
    .local pmc match
    .lex "$/", match
    length rx310_eos, rx310_tgt
    gt rx310_pos, rx310_eos, rx310_done
    set rx310_off, 0
    lt rx310_pos, 2, rx310_start
    sub rx310_off, rx310_pos, 1
    substr rx310_tgt, rx310_tgt, rx310_off
  rx310_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan314_done
    goto rxscan314_scan
  rxscan314_loop:
    ($P10) = rx310_cur."from"()
    inc $P10
    set rx310_pos, $P10
    ge rx310_pos, rx310_eos, rxscan314_done
  rxscan314_scan:
    set_addr $I10, rxscan314_loop
    rx310_cur."!mark_push"(0, rx310_pos, $I10)
  rxscan314_done:
.annotate 'line', 103
  # rx literal  "<"
    add $I11, rx310_pos, 1
    gt $I11, rx310_eos, rx310_fail
    sub $I11, rx310_pos, rx310_off
    substr $S10, rx310_tgt, $I11, 1
    ne $S10, "<", rx310_fail
    add rx310_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx310_cur."!cursor_pos"(rx310_pos)
    $P10 = rx310_cur."assertion"()
    unless $P10, rx310_fail
    rx310_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx310_pos = $P10."pos"()
  alt315_0:
.annotate 'line', 104
    set_addr $I10, alt315_1
    rx310_cur."!mark_push"(0, rx310_pos, $I10)
  # rx literal  ">"
    add $I11, rx310_pos, 1
    gt $I11, rx310_eos, rx310_fail
    sub $I11, rx310_pos, rx310_off
    substr $S10, rx310_tgt, $I11, 1
    ne $S10, ">", rx310_fail
    add rx310_pos, 1
    goto alt315_end
  alt315_1:
  # rx subrule "panic" subtype=method negate=
    rx310_cur."!cursor_pos"(rx310_pos)
    $P10 = rx310_cur."panic"("regex assertion not terminated by angle bracket")
    unless $P10, rx310_fail
    rx310_pos = $P10."pos"()
  alt315_end:
.annotate 'line', 102
  # rx pass
    rx310_cur."!cursor_pass"(rx310_pos, "metachar:sym<assert>")
    rx310_cur."!cursor_debug"("PASS  ", "metachar:sym<assert>", " at pos=", rx310_pos)
    .return (rx310_cur)
  rx310_fail:
.annotate 'line', 3
    (rx310_rep, rx310_pos, $I10, $P10) = rx310_cur."!mark_fail"(0)
    lt rx310_pos, -1, rx310_done
    eq rx310_pos, -1, rx310_fail
    jump $I10
  rx310_done:
    rx310_cur."!cursor_fail"()
    rx310_cur."!cursor_debug"("FAIL  ", "metachar:sym<assert>")
    .return (rx310_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<assert>"  :subid("86_1275811476.7961") :method
.annotate 'line', 3
    $P312 = self."!PREFIX__!subrule"("assertion", "<")
    new $P313, "ResizablePMCArray"
    push $P313, $P312
    .return ($P313)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<var>"  :subid("87_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx317_tgt
    .local int rx317_pos
    .local int rx317_off
    .local int rx317_eos
    .local int rx317_rep
    .local pmc rx317_cur
    (rx317_cur, rx317_pos, rx317_tgt) = self."!cursor_start"()
    rx317_cur."!cursor_debug"("START ", "metachar:sym<var>")
    rx317_cur."!cursor_caparray"("quantified_atom")
    .lex unicode:"$\x{a2}", rx317_cur
    .local pmc match
    .lex "$/", match
    length rx317_eos, rx317_tgt
    gt rx317_pos, rx317_eos, rx317_done
    set rx317_off, 0
    lt rx317_pos, 2, rx317_start
    sub rx317_off, rx317_pos, 1
    substr rx317_tgt, rx317_tgt, rx317_off
  rx317_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan320_done
    goto rxscan320_scan
  rxscan320_loop:
    ($P10) = rx317_cur."from"()
    inc $P10
    set rx317_pos, $P10
    ge rx317_pos, rx317_eos, rxscan320_done
  rxscan320_scan:
    set_addr $I10, rxscan320_loop
    rx317_cur."!mark_push"(0, rx317_pos, $I10)
  rxscan320_done:
  alt321_0:
.annotate 'line', 108
    set_addr $I10, alt321_1
    rx317_cur."!mark_push"(0, rx317_pos, $I10)
.annotate 'line', 109
  # rx literal  "$<"
    add $I11, rx317_pos, 2
    gt $I11, rx317_eos, rx317_fail
    sub $I11, rx317_pos, rx317_off
    substr $S10, rx317_tgt, $I11, 2
    ne $S10, "$<", rx317_fail
    add rx317_pos, 2
  # rx subcapture "name"
    set_addr $I10, rxcap_324_fail
    rx317_cur."!mark_push"(0, rx317_pos, $I10)
  # rx rxquantr322 ** 1..*
    set_addr $I323, rxquantr322_done
    rx317_cur."!mark_push"(0, -1, $I323)
  rxquantr322_loop:
  # rx enumcharlist negate=1 
    ge rx317_pos, rx317_eos, rx317_fail
    sub $I10, rx317_pos, rx317_off
    substr $S10, rx317_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx317_fail
    inc rx317_pos
    (rx317_rep) = rx317_cur."!mark_commit"($I323)
    rx317_cur."!mark_push"(rx317_rep, rx317_pos, $I323)
    goto rxquantr322_loop
  rxquantr322_done:
    set_addr $I10, rxcap_324_fail
    ($I12, $I11) = rx317_cur."!mark_peek"($I10)
    rx317_cur."!cursor_pos"($I11)
    ($P10) = rx317_cur."!cursor_start"()
    $P10."!cursor_pass"(rx317_pos, "")
    rx317_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_324_done
  rxcap_324_fail:
    goto rx317_fail
  rxcap_324_done:
  # rx literal  ">"
    add $I11, rx317_pos, 1
    gt $I11, rx317_eos, rx317_fail
    sub $I11, rx317_pos, rx317_off
    substr $S10, rx317_tgt, $I11, 1
    ne $S10, ">", rx317_fail
    add rx317_pos, 1
    goto alt321_end
  alt321_1:
.annotate 'line', 110
  # rx literal  "$"
    add $I11, rx317_pos, 1
    gt $I11, rx317_eos, rx317_fail
    sub $I11, rx317_pos, rx317_off
    substr $S10, rx317_tgt, $I11, 1
    ne $S10, "$", rx317_fail
    add rx317_pos, 1
  # rx subcapture "pos"
    set_addr $I10, rxcap_325_fail
    rx317_cur."!mark_push"(0, rx317_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx317_pos, rx317_off
    find_not_cclass $I11, 8, rx317_tgt, $I10, rx317_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx317_fail
    add rx317_pos, rx317_off, $I11
    set_addr $I10, rxcap_325_fail
    ($I12, $I11) = rx317_cur."!mark_peek"($I10)
    rx317_cur."!cursor_pos"($I11)
    ($P10) = rx317_cur."!cursor_start"()
    $P10."!cursor_pass"(rx317_pos, "")
    rx317_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pos")
    goto rxcap_325_done
  rxcap_325_fail:
    goto rx317_fail
  rxcap_325_done:
  alt321_end:
.annotate 'line', 113
  # rx rxquantr326 ** 0..1
    set_addr $I327, rxquantr326_done
    rx317_cur."!mark_push"(0, rx317_pos, $I327)
  rxquantr326_loop:
  # rx subrule "ws" subtype=method negate=
    rx317_cur."!cursor_pos"(rx317_pos)
    $P10 = rx317_cur."ws"()
    unless $P10, rx317_fail
    rx317_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx317_pos, 1
    gt $I11, rx317_eos, rx317_fail
    sub $I11, rx317_pos, rx317_off
    substr $S10, rx317_tgt, $I11, 1
    ne $S10, "=", rx317_fail
    add rx317_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx317_cur."!cursor_pos"(rx317_pos)
    $P10 = rx317_cur."ws"()
    unless $P10, rx317_fail
    rx317_pos = $P10."pos"()
  # rx subrule "quantified_atom" subtype=capture negate=
    rx317_cur."!cursor_pos"(rx317_pos)
    $P10 = rx317_cur."quantified_atom"()
    unless $P10, rx317_fail
    rx317_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantified_atom")
    rx317_pos = $P10."pos"()
    (rx317_rep) = rx317_cur."!mark_commit"($I327)
  rxquantr326_done:
.annotate 'line', 107
  # rx pass
    rx317_cur."!cursor_pass"(rx317_pos, "metachar:sym<var>")
    rx317_cur."!cursor_debug"("PASS  ", "metachar:sym<var>", " at pos=", rx317_pos)
    .return (rx317_cur)
  rx317_fail:
.annotate 'line', 3
    (rx317_rep, rx317_pos, $I10, $P10) = rx317_cur."!mark_fail"(0)
    lt rx317_pos, -1, rx317_done
    eq rx317_pos, -1, rx317_fail
    jump $I10
  rx317_done:
    rx317_cur."!cursor_fail"()
    rx317_cur."!cursor_debug"("FAIL  ", "metachar:sym<var>")
    .return (rx317_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<var>"  :subid("88_1275811476.7961") :method
.annotate 'line', 3
    new $P319, "ResizablePMCArray"
    push $P319, "$"
    push $P319, "$<"
    .return ($P319)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<PIR>"  :subid("89_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx329_tgt
    .local int rx329_pos
    .local int rx329_off
    .local int rx329_eos
    .local int rx329_rep
    .local pmc rx329_cur
    (rx329_cur, rx329_pos, rx329_tgt) = self."!cursor_start"()
    rx329_cur."!cursor_debug"("START ", "metachar:sym<PIR>")
    .lex unicode:"$\x{a2}", rx329_cur
    .local pmc match
    .lex "$/", match
    length rx329_eos, rx329_tgt
    gt rx329_pos, rx329_eos, rx329_done
    set rx329_off, 0
    lt rx329_pos, 2, rx329_start
    sub rx329_off, rx329_pos, 1
    substr rx329_tgt, rx329_tgt, rx329_off
  rx329_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan332_done
    goto rxscan332_scan
  rxscan332_loop:
    ($P10) = rx329_cur."from"()
    inc $P10
    set rx329_pos, $P10
    ge rx329_pos, rx329_eos, rxscan332_done
  rxscan332_scan:
    set_addr $I10, rxscan332_loop
    rx329_cur."!mark_push"(0, rx329_pos, $I10)
  rxscan332_done:
.annotate 'line', 117
  # rx literal  ":PIR{{"
    add $I11, rx329_pos, 6
    gt $I11, rx329_eos, rx329_fail
    sub $I11, rx329_pos, rx329_off
    substr $S10, rx329_tgt, $I11, 6
    ne $S10, ":PIR{{", rx329_fail
    add rx329_pos, 6
  # rx subcapture "pir"
    set_addr $I10, rxcap_335_fail
    rx329_cur."!mark_push"(0, rx329_pos, $I10)
  # rx rxquantf333 ** 0..*
    set_addr $I10, rxquantf333_loop
    rx329_cur."!mark_push"(0, rx329_pos, $I10)
    goto rxquantf333_done
  rxquantf333_loop:
  # rx charclass .
    ge rx329_pos, rx329_eos, rx329_fail
    inc rx329_pos
    set_addr $I10, rxquantf333_loop
    rx329_cur."!mark_push"($I334, rx329_pos, $I10)
  rxquantf333_done:
    set_addr $I10, rxcap_335_fail
    ($I12, $I11) = rx329_cur."!mark_peek"($I10)
    rx329_cur."!cursor_pos"($I11)
    ($P10) = rx329_cur."!cursor_start"()
    $P10."!cursor_pass"(rx329_pos, "")
    rx329_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pir")
    goto rxcap_335_done
  rxcap_335_fail:
    goto rx329_fail
  rxcap_335_done:
  # rx literal  "}}"
    add $I11, rx329_pos, 2
    gt $I11, rx329_eos, rx329_fail
    sub $I11, rx329_pos, rx329_off
    substr $S10, rx329_tgt, $I11, 2
    ne $S10, "}}", rx329_fail
    add rx329_pos, 2
.annotate 'line', 116
  # rx pass
    rx329_cur."!cursor_pass"(rx329_pos, "metachar:sym<PIR>")
    rx329_cur."!cursor_debug"("PASS  ", "metachar:sym<PIR>", " at pos=", rx329_pos)
    .return (rx329_cur)
  rx329_fail:
.annotate 'line', 3
    (rx329_rep, rx329_pos, $I10, $P10) = rx329_cur."!mark_fail"(0)
    lt rx329_pos, -1, rx329_done
    eq rx329_pos, -1, rx329_fail
    jump $I10
  rx329_done:
    rx329_cur."!cursor_fail"()
    rx329_cur."!cursor_debug"("FAIL  ", "metachar:sym<PIR>")
    .return (rx329_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<PIR>"  :subid("90_1275811476.7961") :method
.annotate 'line', 3
    new $P331, "ResizablePMCArray"
    push $P331, ":PIR{{"
    .return ($P331)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash"  :subid("91_1275811476.7961") :method
.annotate 'line', 120
    $P337 = self."!protoregex"("backslash")
    .return ($P337)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash"  :subid("92_1275811476.7961") :method
.annotate 'line', 120
    $P339 = self."!PREFIX__!protoregex"("backslash")
    .return ($P339)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<w>"  :subid("93_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx341_tgt
    .local int rx341_pos
    .local int rx341_off
    .local int rx341_eos
    .local int rx341_rep
    .local pmc rx341_cur
    (rx341_cur, rx341_pos, rx341_tgt) = self."!cursor_start"()
    rx341_cur."!cursor_debug"("START ", "backslash:sym<w>")
    .lex unicode:"$\x{a2}", rx341_cur
    .local pmc match
    .lex "$/", match
    length rx341_eos, rx341_tgt
    gt rx341_pos, rx341_eos, rx341_done
    set rx341_off, 0
    lt rx341_pos, 2, rx341_start
    sub rx341_off, rx341_pos, 1
    substr rx341_tgt, rx341_tgt, rx341_off
  rx341_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan344_done
    goto rxscan344_scan
  rxscan344_loop:
    ($P10) = rx341_cur."from"()
    inc $P10
    set rx341_pos, $P10
    ge rx341_pos, rx341_eos, rxscan344_done
  rxscan344_scan:
    set_addr $I10, rxscan344_loop
    rx341_cur."!mark_push"(0, rx341_pos, $I10)
  rxscan344_done:
.annotate 'line', 121
  # rx subcapture "sym"
    set_addr $I10, rxcap_345_fail
    rx341_cur."!mark_push"(0, rx341_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx341_pos, rx341_eos, rx341_fail
    sub $I10, rx341_pos, rx341_off
    substr $S10, rx341_tgt, $I10, 1
    index $I11, "dswnDSWN", $S10
    lt $I11, 0, rx341_fail
    inc rx341_pos
    set_addr $I10, rxcap_345_fail
    ($I12, $I11) = rx341_cur."!mark_peek"($I10)
    rx341_cur."!cursor_pos"($I11)
    ($P10) = rx341_cur."!cursor_start"()
    $P10."!cursor_pass"(rx341_pos, "")
    rx341_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_345_done
  rxcap_345_fail:
    goto rx341_fail
  rxcap_345_done:
  # rx pass
    rx341_cur."!cursor_pass"(rx341_pos, "backslash:sym<w>")
    rx341_cur."!cursor_debug"("PASS  ", "backslash:sym<w>", " at pos=", rx341_pos)
    .return (rx341_cur)
  rx341_fail:
.annotate 'line', 3
    (rx341_rep, rx341_pos, $I10, $P10) = rx341_cur."!mark_fail"(0)
    lt rx341_pos, -1, rx341_done
    eq rx341_pos, -1, rx341_fail
    jump $I10
  rx341_done:
    rx341_cur."!cursor_fail"()
    rx341_cur."!cursor_debug"("FAIL  ", "backslash:sym<w>")
    .return (rx341_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<w>"  :subid("94_1275811476.7961") :method
.annotate 'line', 3
    new $P343, "ResizablePMCArray"
    push $P343, "N"
    push $P343, "W"
    push $P343, "S"
    push $P343, "D"
    push $P343, "n"
    push $P343, "w"
    push $P343, "s"
    push $P343, "d"
    .return ($P343)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<b>"  :subid("95_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx347_tgt
    .local int rx347_pos
    .local int rx347_off
    .local int rx347_eos
    .local int rx347_rep
    .local pmc rx347_cur
    (rx347_cur, rx347_pos, rx347_tgt) = self."!cursor_start"()
    rx347_cur."!cursor_debug"("START ", "backslash:sym<b>")
    .lex unicode:"$\x{a2}", rx347_cur
    .local pmc match
    .lex "$/", match
    length rx347_eos, rx347_tgt
    gt rx347_pos, rx347_eos, rx347_done
    set rx347_off, 0
    lt rx347_pos, 2, rx347_start
    sub rx347_off, rx347_pos, 1
    substr rx347_tgt, rx347_tgt, rx347_off
  rx347_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan350_done
    goto rxscan350_scan
  rxscan350_loop:
    ($P10) = rx347_cur."from"()
    inc $P10
    set rx347_pos, $P10
    ge rx347_pos, rx347_eos, rxscan350_done
  rxscan350_scan:
    set_addr $I10, rxscan350_loop
    rx347_cur."!mark_push"(0, rx347_pos, $I10)
  rxscan350_done:
.annotate 'line', 122
  # rx subcapture "sym"
    set_addr $I10, rxcap_351_fail
    rx347_cur."!mark_push"(0, rx347_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx347_pos, rx347_eos, rx347_fail
    sub $I10, rx347_pos, rx347_off
    substr $S10, rx347_tgt, $I10, 1
    index $I11, "bB", $S10
    lt $I11, 0, rx347_fail
    inc rx347_pos
    set_addr $I10, rxcap_351_fail
    ($I12, $I11) = rx347_cur."!mark_peek"($I10)
    rx347_cur."!cursor_pos"($I11)
    ($P10) = rx347_cur."!cursor_start"()
    $P10."!cursor_pass"(rx347_pos, "")
    rx347_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_351_done
  rxcap_351_fail:
    goto rx347_fail
  rxcap_351_done:
  # rx pass
    rx347_cur."!cursor_pass"(rx347_pos, "backslash:sym<b>")
    rx347_cur."!cursor_debug"("PASS  ", "backslash:sym<b>", " at pos=", rx347_pos)
    .return (rx347_cur)
  rx347_fail:
.annotate 'line', 3
    (rx347_rep, rx347_pos, $I10, $P10) = rx347_cur."!mark_fail"(0)
    lt rx347_pos, -1, rx347_done
    eq rx347_pos, -1, rx347_fail
    jump $I10
  rx347_done:
    rx347_cur."!cursor_fail"()
    rx347_cur."!cursor_debug"("FAIL  ", "backslash:sym<b>")
    .return (rx347_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<b>"  :subid("96_1275811476.7961") :method
.annotate 'line', 3
    new $P349, "ResizablePMCArray"
    push $P349, "B"
    push $P349, "b"
    .return ($P349)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<e>"  :subid("97_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx353_tgt
    .local int rx353_pos
    .local int rx353_off
    .local int rx353_eos
    .local int rx353_rep
    .local pmc rx353_cur
    (rx353_cur, rx353_pos, rx353_tgt) = self."!cursor_start"()
    rx353_cur."!cursor_debug"("START ", "backslash:sym<e>")
    .lex unicode:"$\x{a2}", rx353_cur
    .local pmc match
    .lex "$/", match
    length rx353_eos, rx353_tgt
    gt rx353_pos, rx353_eos, rx353_done
    set rx353_off, 0
    lt rx353_pos, 2, rx353_start
    sub rx353_off, rx353_pos, 1
    substr rx353_tgt, rx353_tgt, rx353_off
  rx353_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan356_done
    goto rxscan356_scan
  rxscan356_loop:
    ($P10) = rx353_cur."from"()
    inc $P10
    set rx353_pos, $P10
    ge rx353_pos, rx353_eos, rxscan356_done
  rxscan356_scan:
    set_addr $I10, rxscan356_loop
    rx353_cur."!mark_push"(0, rx353_pos, $I10)
  rxscan356_done:
.annotate 'line', 123
  # rx subcapture "sym"
    set_addr $I10, rxcap_357_fail
    rx353_cur."!mark_push"(0, rx353_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx353_pos, rx353_eos, rx353_fail
    sub $I10, rx353_pos, rx353_off
    substr $S10, rx353_tgt, $I10, 1
    index $I11, "eE", $S10
    lt $I11, 0, rx353_fail
    inc rx353_pos
    set_addr $I10, rxcap_357_fail
    ($I12, $I11) = rx353_cur."!mark_peek"($I10)
    rx353_cur."!cursor_pos"($I11)
    ($P10) = rx353_cur."!cursor_start"()
    $P10."!cursor_pass"(rx353_pos, "")
    rx353_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_357_done
  rxcap_357_fail:
    goto rx353_fail
  rxcap_357_done:
  # rx pass
    rx353_cur."!cursor_pass"(rx353_pos, "backslash:sym<e>")
    rx353_cur."!cursor_debug"("PASS  ", "backslash:sym<e>", " at pos=", rx353_pos)
    .return (rx353_cur)
  rx353_fail:
.annotate 'line', 3
    (rx353_rep, rx353_pos, $I10, $P10) = rx353_cur."!mark_fail"(0)
    lt rx353_pos, -1, rx353_done
    eq rx353_pos, -1, rx353_fail
    jump $I10
  rx353_done:
    rx353_cur."!cursor_fail"()
    rx353_cur."!cursor_debug"("FAIL  ", "backslash:sym<e>")
    .return (rx353_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<e>"  :subid("98_1275811476.7961") :method
.annotate 'line', 3
    new $P355, "ResizablePMCArray"
    push $P355, "E"
    push $P355, "e"
    .return ($P355)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<f>"  :subid("99_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx359_tgt
    .local int rx359_pos
    .local int rx359_off
    .local int rx359_eos
    .local int rx359_rep
    .local pmc rx359_cur
    (rx359_cur, rx359_pos, rx359_tgt) = self."!cursor_start"()
    rx359_cur."!cursor_debug"("START ", "backslash:sym<f>")
    .lex unicode:"$\x{a2}", rx359_cur
    .local pmc match
    .lex "$/", match
    length rx359_eos, rx359_tgt
    gt rx359_pos, rx359_eos, rx359_done
    set rx359_off, 0
    lt rx359_pos, 2, rx359_start
    sub rx359_off, rx359_pos, 1
    substr rx359_tgt, rx359_tgt, rx359_off
  rx359_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan362_done
    goto rxscan362_scan
  rxscan362_loop:
    ($P10) = rx359_cur."from"()
    inc $P10
    set rx359_pos, $P10
    ge rx359_pos, rx359_eos, rxscan362_done
  rxscan362_scan:
    set_addr $I10, rxscan362_loop
    rx359_cur."!mark_push"(0, rx359_pos, $I10)
  rxscan362_done:
.annotate 'line', 124
  # rx subcapture "sym"
    set_addr $I10, rxcap_363_fail
    rx359_cur."!mark_push"(0, rx359_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx359_pos, rx359_eos, rx359_fail
    sub $I10, rx359_pos, rx359_off
    substr $S10, rx359_tgt, $I10, 1
    index $I11, "fF", $S10
    lt $I11, 0, rx359_fail
    inc rx359_pos
    set_addr $I10, rxcap_363_fail
    ($I12, $I11) = rx359_cur."!mark_peek"($I10)
    rx359_cur."!cursor_pos"($I11)
    ($P10) = rx359_cur."!cursor_start"()
    $P10."!cursor_pass"(rx359_pos, "")
    rx359_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_363_done
  rxcap_363_fail:
    goto rx359_fail
  rxcap_363_done:
  # rx pass
    rx359_cur."!cursor_pass"(rx359_pos, "backslash:sym<f>")
    rx359_cur."!cursor_debug"("PASS  ", "backslash:sym<f>", " at pos=", rx359_pos)
    .return (rx359_cur)
  rx359_fail:
.annotate 'line', 3
    (rx359_rep, rx359_pos, $I10, $P10) = rx359_cur."!mark_fail"(0)
    lt rx359_pos, -1, rx359_done
    eq rx359_pos, -1, rx359_fail
    jump $I10
  rx359_done:
    rx359_cur."!cursor_fail"()
    rx359_cur."!cursor_debug"("FAIL  ", "backslash:sym<f>")
    .return (rx359_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<f>"  :subid("100_1275811476.7961") :method
.annotate 'line', 3
    new $P361, "ResizablePMCArray"
    push $P361, "F"
    push $P361, "f"
    .return ($P361)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<h>"  :subid("101_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx365_tgt
    .local int rx365_pos
    .local int rx365_off
    .local int rx365_eos
    .local int rx365_rep
    .local pmc rx365_cur
    (rx365_cur, rx365_pos, rx365_tgt) = self."!cursor_start"()
    rx365_cur."!cursor_debug"("START ", "backslash:sym<h>")
    .lex unicode:"$\x{a2}", rx365_cur
    .local pmc match
    .lex "$/", match
    length rx365_eos, rx365_tgt
    gt rx365_pos, rx365_eos, rx365_done
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
.annotate 'line', 125
  # rx subcapture "sym"
    set_addr $I10, rxcap_369_fail
    rx365_cur."!mark_push"(0, rx365_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx365_pos, rx365_eos, rx365_fail
    sub $I10, rx365_pos, rx365_off
    substr $S10, rx365_tgt, $I10, 1
    index $I11, "hH", $S10
    lt $I11, 0, rx365_fail
    inc rx365_pos
    set_addr $I10, rxcap_369_fail
    ($I12, $I11) = rx365_cur."!mark_peek"($I10)
    rx365_cur."!cursor_pos"($I11)
    ($P10) = rx365_cur."!cursor_start"()
    $P10."!cursor_pass"(rx365_pos, "")
    rx365_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_369_done
  rxcap_369_fail:
    goto rx365_fail
  rxcap_369_done:
  # rx pass
    rx365_cur."!cursor_pass"(rx365_pos, "backslash:sym<h>")
    rx365_cur."!cursor_debug"("PASS  ", "backslash:sym<h>", " at pos=", rx365_pos)
    .return (rx365_cur)
  rx365_fail:
.annotate 'line', 3
    (rx365_rep, rx365_pos, $I10, $P10) = rx365_cur."!mark_fail"(0)
    lt rx365_pos, -1, rx365_done
    eq rx365_pos, -1, rx365_fail
    jump $I10
  rx365_done:
    rx365_cur."!cursor_fail"()
    rx365_cur."!cursor_debug"("FAIL  ", "backslash:sym<h>")
    .return (rx365_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<h>"  :subid("102_1275811476.7961") :method
.annotate 'line', 3
    new $P367, "ResizablePMCArray"
    push $P367, "H"
    push $P367, "h"
    .return ($P367)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<r>"  :subid("103_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx371_tgt
    .local int rx371_pos
    .local int rx371_off
    .local int rx371_eos
    .local int rx371_rep
    .local pmc rx371_cur
    (rx371_cur, rx371_pos, rx371_tgt) = self."!cursor_start"()
    rx371_cur."!cursor_debug"("START ", "backslash:sym<r>")
    .lex unicode:"$\x{a2}", rx371_cur
    .local pmc match
    .lex "$/", match
    length rx371_eos, rx371_tgt
    gt rx371_pos, rx371_eos, rx371_done
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
.annotate 'line', 126
  # rx subcapture "sym"
    set_addr $I10, rxcap_375_fail
    rx371_cur."!mark_push"(0, rx371_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx371_pos, rx371_eos, rx371_fail
    sub $I10, rx371_pos, rx371_off
    substr $S10, rx371_tgt, $I10, 1
    index $I11, "rR", $S10
    lt $I11, 0, rx371_fail
    inc rx371_pos
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
  # rx pass
    rx371_cur."!cursor_pass"(rx371_pos, "backslash:sym<r>")
    rx371_cur."!cursor_debug"("PASS  ", "backslash:sym<r>", " at pos=", rx371_pos)
    .return (rx371_cur)
  rx371_fail:
.annotate 'line', 3
    (rx371_rep, rx371_pos, $I10, $P10) = rx371_cur."!mark_fail"(0)
    lt rx371_pos, -1, rx371_done
    eq rx371_pos, -1, rx371_fail
    jump $I10
  rx371_done:
    rx371_cur."!cursor_fail"()
    rx371_cur."!cursor_debug"("FAIL  ", "backslash:sym<r>")
    .return (rx371_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<r>"  :subid("104_1275811476.7961") :method
.annotate 'line', 3
    new $P373, "ResizablePMCArray"
    push $P373, "R"
    push $P373, "r"
    .return ($P373)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<t>"  :subid("105_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx377_tgt
    .local int rx377_pos
    .local int rx377_off
    .local int rx377_eos
    .local int rx377_rep
    .local pmc rx377_cur
    (rx377_cur, rx377_pos, rx377_tgt) = self."!cursor_start"()
    rx377_cur."!cursor_debug"("START ", "backslash:sym<t>")
    .lex unicode:"$\x{a2}", rx377_cur
    .local pmc match
    .lex "$/", match
    length rx377_eos, rx377_tgt
    gt rx377_pos, rx377_eos, rx377_done
    set rx377_off, 0
    lt rx377_pos, 2, rx377_start
    sub rx377_off, rx377_pos, 1
    substr rx377_tgt, rx377_tgt, rx377_off
  rx377_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan380_done
    goto rxscan380_scan
  rxscan380_loop:
    ($P10) = rx377_cur."from"()
    inc $P10
    set rx377_pos, $P10
    ge rx377_pos, rx377_eos, rxscan380_done
  rxscan380_scan:
    set_addr $I10, rxscan380_loop
    rx377_cur."!mark_push"(0, rx377_pos, $I10)
  rxscan380_done:
.annotate 'line', 127
  # rx subcapture "sym"
    set_addr $I10, rxcap_381_fail
    rx377_cur."!mark_push"(0, rx377_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx377_pos, rx377_eos, rx377_fail
    sub $I10, rx377_pos, rx377_off
    substr $S10, rx377_tgt, $I10, 1
    index $I11, "tT", $S10
    lt $I11, 0, rx377_fail
    inc rx377_pos
    set_addr $I10, rxcap_381_fail
    ($I12, $I11) = rx377_cur."!mark_peek"($I10)
    rx377_cur."!cursor_pos"($I11)
    ($P10) = rx377_cur."!cursor_start"()
    $P10."!cursor_pass"(rx377_pos, "")
    rx377_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_381_done
  rxcap_381_fail:
    goto rx377_fail
  rxcap_381_done:
  # rx pass
    rx377_cur."!cursor_pass"(rx377_pos, "backslash:sym<t>")
    rx377_cur."!cursor_debug"("PASS  ", "backslash:sym<t>", " at pos=", rx377_pos)
    .return (rx377_cur)
  rx377_fail:
.annotate 'line', 3
    (rx377_rep, rx377_pos, $I10, $P10) = rx377_cur."!mark_fail"(0)
    lt rx377_pos, -1, rx377_done
    eq rx377_pos, -1, rx377_fail
    jump $I10
  rx377_done:
    rx377_cur."!cursor_fail"()
    rx377_cur."!cursor_debug"("FAIL  ", "backslash:sym<t>")
    .return (rx377_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<t>"  :subid("106_1275811476.7961") :method
.annotate 'line', 3
    new $P379, "ResizablePMCArray"
    push $P379, "T"
    push $P379, "t"
    .return ($P379)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<v>"  :subid("107_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx383_tgt
    .local int rx383_pos
    .local int rx383_off
    .local int rx383_eos
    .local int rx383_rep
    .local pmc rx383_cur
    (rx383_cur, rx383_pos, rx383_tgt) = self."!cursor_start"()
    rx383_cur."!cursor_debug"("START ", "backslash:sym<v>")
    .lex unicode:"$\x{a2}", rx383_cur
    .local pmc match
    .lex "$/", match
    length rx383_eos, rx383_tgt
    gt rx383_pos, rx383_eos, rx383_done
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
.annotate 'line', 128
  # rx subcapture "sym"
    set_addr $I10, rxcap_387_fail
    rx383_cur."!mark_push"(0, rx383_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx383_pos, rx383_eos, rx383_fail
    sub $I10, rx383_pos, rx383_off
    substr $S10, rx383_tgt, $I10, 1
    index $I11, "vV", $S10
    lt $I11, 0, rx383_fail
    inc rx383_pos
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
  # rx pass
    rx383_cur."!cursor_pass"(rx383_pos, "backslash:sym<v>")
    rx383_cur."!cursor_debug"("PASS  ", "backslash:sym<v>", " at pos=", rx383_pos)
    .return (rx383_cur)
  rx383_fail:
.annotate 'line', 3
    (rx383_rep, rx383_pos, $I10, $P10) = rx383_cur."!mark_fail"(0)
    lt rx383_pos, -1, rx383_done
    eq rx383_pos, -1, rx383_fail
    jump $I10
  rx383_done:
    rx383_cur."!cursor_fail"()
    rx383_cur."!cursor_debug"("FAIL  ", "backslash:sym<v>")
    .return (rx383_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<v>"  :subid("108_1275811476.7961") :method
.annotate 'line', 3
    new $P385, "ResizablePMCArray"
    push $P385, "V"
    push $P385, "v"
    .return ($P385)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<o>"  :subid("109_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx389_tgt
    .local int rx389_pos
    .local int rx389_off
    .local int rx389_eos
    .local int rx389_rep
    .local pmc rx389_cur
    (rx389_cur, rx389_pos, rx389_tgt) = self."!cursor_start"()
    rx389_cur."!cursor_debug"("START ", "backslash:sym<o>")
    .lex unicode:"$\x{a2}", rx389_cur
    .local pmc match
    .lex "$/", match
    length rx389_eos, rx389_tgt
    gt rx389_pos, rx389_eos, rx389_done
    set rx389_off, 0
    lt rx389_pos, 2, rx389_start
    sub rx389_off, rx389_pos, 1
    substr rx389_tgt, rx389_tgt, rx389_off
  rx389_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan396_done
    goto rxscan396_scan
  rxscan396_loop:
    ($P10) = rx389_cur."from"()
    inc $P10
    set rx389_pos, $P10
    ge rx389_pos, rx389_eos, rxscan396_done
  rxscan396_scan:
    set_addr $I10, rxscan396_loop
    rx389_cur."!mark_push"(0, rx389_pos, $I10)
  rxscan396_done:
.annotate 'line', 129
  # rx subcapture "sym"
    set_addr $I10, rxcap_397_fail
    rx389_cur."!mark_push"(0, rx389_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx389_pos, rx389_eos, rx389_fail
    sub $I10, rx389_pos, rx389_off
    substr $S10, rx389_tgt, $I10, 1
    index $I11, "oO", $S10
    lt $I11, 0, rx389_fail
    inc rx389_pos
    set_addr $I10, rxcap_397_fail
    ($I12, $I11) = rx389_cur."!mark_peek"($I10)
    rx389_cur."!cursor_pos"($I11)
    ($P10) = rx389_cur."!cursor_start"()
    $P10."!cursor_pass"(rx389_pos, "")
    rx389_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_397_done
  rxcap_397_fail:
    goto rx389_fail
  rxcap_397_done:
  alt398_0:
    set_addr $I10, alt398_1
    rx389_cur."!mark_push"(0, rx389_pos, $I10)
  # rx subrule "octint" subtype=capture negate=
    rx389_cur."!cursor_pos"(rx389_pos)
    $P10 = rx389_cur."octint"()
    unless $P10, rx389_fail
    rx389_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octint")
    rx389_pos = $P10."pos"()
    goto alt398_end
  alt398_1:
  # rx literal  "["
    add $I11, rx389_pos, 1
    gt $I11, rx389_eos, rx389_fail
    sub $I11, rx389_pos, rx389_off
    substr $S10, rx389_tgt, $I11, 1
    ne $S10, "[", rx389_fail
    add rx389_pos, 1
  # rx subrule "octints" subtype=capture negate=
    rx389_cur."!cursor_pos"(rx389_pos)
    $P10 = rx389_cur."octints"()
    unless $P10, rx389_fail
    rx389_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octints")
    rx389_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx389_pos, 1
    gt $I11, rx389_eos, rx389_fail
    sub $I11, rx389_pos, rx389_off
    substr $S10, rx389_tgt, $I11, 1
    ne $S10, "]", rx389_fail
    add rx389_pos, 1
  alt398_end:
  # rx pass
    rx389_cur."!cursor_pass"(rx389_pos, "backslash:sym<o>")
    rx389_cur."!cursor_debug"("PASS  ", "backslash:sym<o>", " at pos=", rx389_pos)
    .return (rx389_cur)
  rx389_fail:
.annotate 'line', 3
    (rx389_rep, rx389_pos, $I10, $P10) = rx389_cur."!mark_fail"(0)
    lt rx389_pos, -1, rx389_done
    eq rx389_pos, -1, rx389_fail
    jump $I10
  rx389_done:
    rx389_cur."!cursor_fail"()
    rx389_cur."!cursor_debug"("FAIL  ", "backslash:sym<o>")
    .return (rx389_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<o>"  :subid("110_1275811476.7961") :method
.annotate 'line', 3
    $P391 = self."!PREFIX__!subrule"("octints", "O[")
    $P392 = self."!PREFIX__!subrule"("octint", "O")
    $P393 = self."!PREFIX__!subrule"("octints", "o[")
    $P394 = self."!PREFIX__!subrule"("octint", "o")
    new $P395, "ResizablePMCArray"
    push $P395, $P391
    push $P395, $P392
    push $P395, $P393
    push $P395, $P394
    .return ($P395)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<x>"  :subid("111_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx400_tgt
    .local int rx400_pos
    .local int rx400_off
    .local int rx400_eos
    .local int rx400_rep
    .local pmc rx400_cur
    (rx400_cur, rx400_pos, rx400_tgt) = self."!cursor_start"()
    rx400_cur."!cursor_debug"("START ", "backslash:sym<x>")
    .lex unicode:"$\x{a2}", rx400_cur
    .local pmc match
    .lex "$/", match
    length rx400_eos, rx400_tgt
    gt rx400_pos, rx400_eos, rx400_done
    set rx400_off, 0
    lt rx400_pos, 2, rx400_start
    sub rx400_off, rx400_pos, 1
    substr rx400_tgt, rx400_tgt, rx400_off
  rx400_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan407_done
    goto rxscan407_scan
  rxscan407_loop:
    ($P10) = rx400_cur."from"()
    inc $P10
    set rx400_pos, $P10
    ge rx400_pos, rx400_eos, rxscan407_done
  rxscan407_scan:
    set_addr $I10, rxscan407_loop
    rx400_cur."!mark_push"(0, rx400_pos, $I10)
  rxscan407_done:
.annotate 'line', 130
  # rx subcapture "sym"
    set_addr $I10, rxcap_408_fail
    rx400_cur."!mark_push"(0, rx400_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx400_pos, rx400_eos, rx400_fail
    sub $I10, rx400_pos, rx400_off
    substr $S10, rx400_tgt, $I10, 1
    index $I11, "xX", $S10
    lt $I11, 0, rx400_fail
    inc rx400_pos
    set_addr $I10, rxcap_408_fail
    ($I12, $I11) = rx400_cur."!mark_peek"($I10)
    rx400_cur."!cursor_pos"($I11)
    ($P10) = rx400_cur."!cursor_start"()
    $P10."!cursor_pass"(rx400_pos, "")
    rx400_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_408_done
  rxcap_408_fail:
    goto rx400_fail
  rxcap_408_done:
  alt409_0:
    set_addr $I10, alt409_1
    rx400_cur."!mark_push"(0, rx400_pos, $I10)
  # rx subrule "hexint" subtype=capture negate=
    rx400_cur."!cursor_pos"(rx400_pos)
    $P10 = rx400_cur."hexint"()
    unless $P10, rx400_fail
    rx400_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexint")
    rx400_pos = $P10."pos"()
    goto alt409_end
  alt409_1:
  # rx literal  "["
    add $I11, rx400_pos, 1
    gt $I11, rx400_eos, rx400_fail
    sub $I11, rx400_pos, rx400_off
    substr $S10, rx400_tgt, $I11, 1
    ne $S10, "[", rx400_fail
    add rx400_pos, 1
  # rx subrule "hexints" subtype=capture negate=
    rx400_cur."!cursor_pos"(rx400_pos)
    $P10 = rx400_cur."hexints"()
    unless $P10, rx400_fail
    rx400_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexints")
    rx400_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx400_pos, 1
    gt $I11, rx400_eos, rx400_fail
    sub $I11, rx400_pos, rx400_off
    substr $S10, rx400_tgt, $I11, 1
    ne $S10, "]", rx400_fail
    add rx400_pos, 1
  alt409_end:
  # rx pass
    rx400_cur."!cursor_pass"(rx400_pos, "backslash:sym<x>")
    rx400_cur."!cursor_debug"("PASS  ", "backslash:sym<x>", " at pos=", rx400_pos)
    .return (rx400_cur)
  rx400_fail:
.annotate 'line', 3
    (rx400_rep, rx400_pos, $I10, $P10) = rx400_cur."!mark_fail"(0)
    lt rx400_pos, -1, rx400_done
    eq rx400_pos, -1, rx400_fail
    jump $I10
  rx400_done:
    rx400_cur."!cursor_fail"()
    rx400_cur."!cursor_debug"("FAIL  ", "backslash:sym<x>")
    .return (rx400_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<x>"  :subid("112_1275811476.7961") :method
.annotate 'line', 3
    $P402 = self."!PREFIX__!subrule"("hexints", "X[")
    $P403 = self."!PREFIX__!subrule"("hexint", "X")
    $P404 = self."!PREFIX__!subrule"("hexints", "x[")
    $P405 = self."!PREFIX__!subrule"("hexint", "x")
    new $P406, "ResizablePMCArray"
    push $P406, $P402
    push $P406, $P403
    push $P406, $P404
    push $P406, $P405
    .return ($P406)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<c>"  :subid("113_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx411_tgt
    .local int rx411_pos
    .local int rx411_off
    .local int rx411_eos
    .local int rx411_rep
    .local pmc rx411_cur
    (rx411_cur, rx411_pos, rx411_tgt) = self."!cursor_start"()
    rx411_cur."!cursor_debug"("START ", "backslash:sym<c>")
    .lex unicode:"$\x{a2}", rx411_cur
    .local pmc match
    .lex "$/", match
    length rx411_eos, rx411_tgt
    gt rx411_pos, rx411_eos, rx411_done
    set rx411_off, 0
    lt rx411_pos, 2, rx411_start
    sub rx411_off, rx411_pos, 1
    substr rx411_tgt, rx411_tgt, rx411_off
  rx411_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan416_done
    goto rxscan416_scan
  rxscan416_loop:
    ($P10) = rx411_cur."from"()
    inc $P10
    set rx411_pos, $P10
    ge rx411_pos, rx411_eos, rxscan416_done
  rxscan416_scan:
    set_addr $I10, rxscan416_loop
    rx411_cur."!mark_push"(0, rx411_pos, $I10)
  rxscan416_done:
.annotate 'line', 131
  # rx subcapture "sym"
    set_addr $I10, rxcap_417_fail
    rx411_cur."!mark_push"(0, rx411_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx411_pos, rx411_eos, rx411_fail
    sub $I10, rx411_pos, rx411_off
    substr $S10, rx411_tgt, $I10, 1
    index $I11, "cC", $S10
    lt $I11, 0, rx411_fail
    inc rx411_pos
    set_addr $I10, rxcap_417_fail
    ($I12, $I11) = rx411_cur."!mark_peek"($I10)
    rx411_cur."!cursor_pos"($I11)
    ($P10) = rx411_cur."!cursor_start"()
    $P10."!cursor_pass"(rx411_pos, "")
    rx411_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_417_done
  rxcap_417_fail:
    goto rx411_fail
  rxcap_417_done:
  # rx subrule "charspec" subtype=capture negate=
    rx411_cur."!cursor_pos"(rx411_pos)
    $P10 = rx411_cur."charspec"()
    unless $P10, rx411_fail
    rx411_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charspec")
    rx411_pos = $P10."pos"()
  # rx pass
    rx411_cur."!cursor_pass"(rx411_pos, "backslash:sym<c>")
    rx411_cur."!cursor_debug"("PASS  ", "backslash:sym<c>", " at pos=", rx411_pos)
    .return (rx411_cur)
  rx411_fail:
.annotate 'line', 3
    (rx411_rep, rx411_pos, $I10, $P10) = rx411_cur."!mark_fail"(0)
    lt rx411_pos, -1, rx411_done
    eq rx411_pos, -1, rx411_fail
    jump $I10
  rx411_done:
    rx411_cur."!cursor_fail"()
    rx411_cur."!cursor_debug"("FAIL  ", "backslash:sym<c>")
    .return (rx411_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<c>"  :subid("114_1275811476.7961") :method
.annotate 'line', 3
    $P413 = self."!PREFIX__!subrule"("charspec", "C")
    $P414 = self."!PREFIX__!subrule"("charspec", "c")
    new $P415, "ResizablePMCArray"
    push $P415, $P413
    push $P415, $P414
    .return ($P415)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<A>"  :subid("115_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx419_tgt
    .local int rx419_pos
    .local int rx419_off
    .local int rx419_eos
    .local int rx419_rep
    .local pmc rx419_cur
    (rx419_cur, rx419_pos, rx419_tgt) = self."!cursor_start"()
    rx419_cur."!cursor_debug"("START ", "backslash:sym<A>")
    .lex unicode:"$\x{a2}", rx419_cur
    .local pmc match
    .lex "$/", match
    length rx419_eos, rx419_tgt
    gt rx419_pos, rx419_eos, rx419_done
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
.annotate 'line', 132
  # rx literal  "A"
    add $I11, rx419_pos, 1
    gt $I11, rx419_eos, rx419_fail
    sub $I11, rx419_pos, rx419_off
    substr $S10, rx419_tgt, $I11, 1
    ne $S10, "A", rx419_fail
    add rx419_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx419_cur."!cursor_pos"(rx419_pos)
    $P10 = rx419_cur."obs"("\\A as beginning-of-string matcher", "^")
    unless $P10, rx419_fail
    rx419_pos = $P10."pos"()
  # rx pass
    rx419_cur."!cursor_pass"(rx419_pos, "backslash:sym<A>")
    rx419_cur."!cursor_debug"("PASS  ", "backslash:sym<A>", " at pos=", rx419_pos)
    .return (rx419_cur)
  rx419_fail:
.annotate 'line', 3
    (rx419_rep, rx419_pos, $I10, $P10) = rx419_cur."!mark_fail"(0)
    lt rx419_pos, -1, rx419_done
    eq rx419_pos, -1, rx419_fail
    jump $I10
  rx419_done:
    rx419_cur."!cursor_fail"()
    rx419_cur."!cursor_debug"("FAIL  ", "backslash:sym<A>")
    .return (rx419_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<A>"  :subid("116_1275811476.7961") :method
.annotate 'line', 3
    $P421 = self."!PREFIX__!subrule"("obs", "A")
    new $P422, "ResizablePMCArray"
    push $P422, $P421
    .return ($P422)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<z>"  :subid("117_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx425_tgt
    .local int rx425_pos
    .local int rx425_off
    .local int rx425_eos
    .local int rx425_rep
    .local pmc rx425_cur
    (rx425_cur, rx425_pos, rx425_tgt) = self."!cursor_start"()
    rx425_cur."!cursor_debug"("START ", "backslash:sym<z>")
    .lex unicode:"$\x{a2}", rx425_cur
    .local pmc match
    .lex "$/", match
    length rx425_eos, rx425_tgt
    gt rx425_pos, rx425_eos, rx425_done
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
.annotate 'line', 133
  # rx literal  "z"
    add $I11, rx425_pos, 1
    gt $I11, rx425_eos, rx425_fail
    sub $I11, rx425_pos, rx425_off
    substr $S10, rx425_tgt, $I11, 1
    ne $S10, "z", rx425_fail
    add rx425_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx425_cur."!cursor_pos"(rx425_pos)
    $P10 = rx425_cur."obs"("\\z as end-of-string matcher", "$")
    unless $P10, rx425_fail
    rx425_pos = $P10."pos"()
  # rx pass
    rx425_cur."!cursor_pass"(rx425_pos, "backslash:sym<z>")
    rx425_cur."!cursor_debug"("PASS  ", "backslash:sym<z>", " at pos=", rx425_pos)
    .return (rx425_cur)
  rx425_fail:
.annotate 'line', 3
    (rx425_rep, rx425_pos, $I10, $P10) = rx425_cur."!mark_fail"(0)
    lt rx425_pos, -1, rx425_done
    eq rx425_pos, -1, rx425_fail
    jump $I10
  rx425_done:
    rx425_cur."!cursor_fail"()
    rx425_cur."!cursor_debug"("FAIL  ", "backslash:sym<z>")
    .return (rx425_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<z>"  :subid("118_1275811476.7961") :method
.annotate 'line', 3
    $P427 = self."!PREFIX__!subrule"("obs", "z")
    new $P428, "ResizablePMCArray"
    push $P428, $P427
    .return ($P428)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Z>"  :subid("119_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx431_tgt
    .local int rx431_pos
    .local int rx431_off
    .local int rx431_eos
    .local int rx431_rep
    .local pmc rx431_cur
    (rx431_cur, rx431_pos, rx431_tgt) = self."!cursor_start"()
    rx431_cur."!cursor_debug"("START ", "backslash:sym<Z>")
    .lex unicode:"$\x{a2}", rx431_cur
    .local pmc match
    .lex "$/", match
    length rx431_eos, rx431_tgt
    gt rx431_pos, rx431_eos, rx431_done
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
.annotate 'line', 134
  # rx literal  "Z"
    add $I11, rx431_pos, 1
    gt $I11, rx431_eos, rx431_fail
    sub $I11, rx431_pos, rx431_off
    substr $S10, rx431_tgt, $I11, 1
    ne $S10, "Z", rx431_fail
    add rx431_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx431_cur."!cursor_pos"(rx431_pos)
    $P10 = rx431_cur."obs"("\\Z as end-of-string matcher", "\\n?$")
    unless $P10, rx431_fail
    rx431_pos = $P10."pos"()
  # rx pass
    rx431_cur."!cursor_pass"(rx431_pos, "backslash:sym<Z>")
    rx431_cur."!cursor_debug"("PASS  ", "backslash:sym<Z>", " at pos=", rx431_pos)
    .return (rx431_cur)
  rx431_fail:
.annotate 'line', 3
    (rx431_rep, rx431_pos, $I10, $P10) = rx431_cur."!mark_fail"(0)
    lt rx431_pos, -1, rx431_done
    eq rx431_pos, -1, rx431_fail
    jump $I10
  rx431_done:
    rx431_cur."!cursor_fail"()
    rx431_cur."!cursor_debug"("FAIL  ", "backslash:sym<Z>")
    .return (rx431_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<Z>"  :subid("120_1275811476.7961") :method
.annotate 'line', 3
    $P433 = self."!PREFIX__!subrule"("obs", "Z")
    new $P434, "ResizablePMCArray"
    push $P434, $P433
    .return ($P434)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Q>"  :subid("121_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx437_tgt
    .local int rx437_pos
    .local int rx437_off
    .local int rx437_eos
    .local int rx437_rep
    .local pmc rx437_cur
    (rx437_cur, rx437_pos, rx437_tgt) = self."!cursor_start"()
    rx437_cur."!cursor_debug"("START ", "backslash:sym<Q>")
    .lex unicode:"$\x{a2}", rx437_cur
    .local pmc match
    .lex "$/", match
    length rx437_eos, rx437_tgt
    gt rx437_pos, rx437_eos, rx437_done
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
.annotate 'line', 135
  # rx literal  "Q"
    add $I11, rx437_pos, 1
    gt $I11, rx437_eos, rx437_fail
    sub $I11, rx437_pos, rx437_off
    substr $S10, rx437_tgt, $I11, 1
    ne $S10, "Q", rx437_fail
    add rx437_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx437_cur."!cursor_pos"(rx437_pos)
    $P10 = rx437_cur."obs"("\\Q as quotemeta", "quotes or literal variable match")
    unless $P10, rx437_fail
    rx437_pos = $P10."pos"()
  # rx pass
    rx437_cur."!cursor_pass"(rx437_pos, "backslash:sym<Q>")
    rx437_cur."!cursor_debug"("PASS  ", "backslash:sym<Q>", " at pos=", rx437_pos)
    .return (rx437_cur)
  rx437_fail:
.annotate 'line', 3
    (rx437_rep, rx437_pos, $I10, $P10) = rx437_cur."!mark_fail"(0)
    lt rx437_pos, -1, rx437_done
    eq rx437_pos, -1, rx437_fail
    jump $I10
  rx437_done:
    rx437_cur."!cursor_fail"()
    rx437_cur."!cursor_debug"("FAIL  ", "backslash:sym<Q>")
    .return (rx437_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<Q>"  :subid("122_1275811476.7961") :method
.annotate 'line', 3
    $P439 = self."!PREFIX__!subrule"("obs", "Q")
    new $P440, "ResizablePMCArray"
    push $P440, $P439
    .return ($P440)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<misc>"  :subid("123_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx443_tgt
    .local int rx443_pos
    .local int rx443_off
    .local int rx443_eos
    .local int rx443_rep
    .local pmc rx443_cur
    (rx443_cur, rx443_pos, rx443_tgt) = self."!cursor_start"()
    rx443_cur."!cursor_debug"("START ", "backslash:sym<misc>")
    .lex unicode:"$\x{a2}", rx443_cur
    .local pmc match
    .lex "$/", match
    length rx443_eos, rx443_tgt
    gt rx443_pos, rx443_eos, rx443_done
    set rx443_off, 0
    lt rx443_pos, 2, rx443_start
    sub rx443_off, rx443_pos, 1
    substr rx443_tgt, rx443_tgt, rx443_off
  rx443_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan446_done
    goto rxscan446_scan
  rxscan446_loop:
    ($P10) = rx443_cur."from"()
    inc $P10
    set rx443_pos, $P10
    ge rx443_pos, rx443_eos, rxscan446_done
  rxscan446_scan:
    set_addr $I10, rxscan446_loop
    rx443_cur."!mark_push"(0, rx443_pos, $I10)
  rxscan446_done:
.annotate 'line', 136
  # rx charclass W
    ge rx443_pos, rx443_eos, rx443_fail
    sub $I10, rx443_pos, rx443_off
    is_cclass $I11, 8192, rx443_tgt, $I10
    if $I11, rx443_fail
    inc rx443_pos
  # rx pass
    rx443_cur."!cursor_pass"(rx443_pos, "backslash:sym<misc>")
    rx443_cur."!cursor_debug"("PASS  ", "backslash:sym<misc>", " at pos=", rx443_pos)
    .return (rx443_cur)
  rx443_fail:
.annotate 'line', 3
    (rx443_rep, rx443_pos, $I10, $P10) = rx443_cur."!mark_fail"(0)
    lt rx443_pos, -1, rx443_done
    eq rx443_pos, -1, rx443_fail
    jump $I10
  rx443_done:
    rx443_cur."!cursor_fail"()
    rx443_cur."!cursor_debug"("FAIL  ", "backslash:sym<misc>")
    .return (rx443_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<misc>"  :subid("124_1275811476.7961") :method
.annotate 'line', 3
    new $P445, "ResizablePMCArray"
    push $P445, ""
    .return ($P445)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion"  :subid("125_1275811476.7961") :method
.annotate 'line', 138
    $P448 = self."!protoregex"("assertion")
    .return ($P448)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion"  :subid("126_1275811476.7961") :method
.annotate 'line', 138
    $P450 = self."!PREFIX__!protoregex"("assertion")
    .return ($P450)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<?>"  :subid("127_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .const 'Sub' $P459 = "129_1275811476.7961" 
    capture_lex $P459
    .local string rx452_tgt
    .local int rx452_pos
    .local int rx452_off
    .local int rx452_eos
    .local int rx452_rep
    .local pmc rx452_cur
    (rx452_cur, rx452_pos, rx452_tgt) = self."!cursor_start"()
    rx452_cur."!cursor_debug"("START ", "assertion:sym<?>")
    .lex unicode:"$\x{a2}", rx452_cur
    .local pmc match
    .lex "$/", match
    length rx452_eos, rx452_tgt
    gt rx452_pos, rx452_eos, rx452_done
    set rx452_off, 0
    lt rx452_pos, 2, rx452_start
    sub rx452_off, rx452_pos, 1
    substr rx452_tgt, rx452_tgt, rx452_off
  rx452_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan456_done
    goto rxscan456_scan
  rxscan456_loop:
    ($P10) = rx452_cur."from"()
    inc $P10
    set rx452_pos, $P10
    ge rx452_pos, rx452_eos, rxscan456_done
  rxscan456_scan:
    set_addr $I10, rxscan456_loop
    rx452_cur."!mark_push"(0, rx452_pos, $I10)
  rxscan456_done:
.annotate 'line', 140
  # rx literal  "?"
    add $I11, rx452_pos, 1
    gt $I11, rx452_eos, rx452_fail
    sub $I11, rx452_pos, rx452_off
    substr $S10, rx452_tgt, $I11, 1
    ne $S10, "?", rx452_fail
    add rx452_pos, 1
  alt457_0:
    set_addr $I10, alt457_1
    rx452_cur."!mark_push"(0, rx452_pos, $I10)
  # rx subrule "before" subtype=zerowidth negate=
    rx452_cur."!cursor_pos"(rx452_pos)
    .const 'Sub' $P459 = "129_1275811476.7961" 
    capture_lex $P459
    $P10 = rx452_cur."before"($P459)
    unless $P10, rx452_fail
    goto alt457_end
  alt457_1:
  # rx subrule "assertion" subtype=capture negate=
    rx452_cur."!cursor_pos"(rx452_pos)
    $P10 = rx452_cur."assertion"()
    unless $P10, rx452_fail
    rx452_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx452_pos = $P10."pos"()
  alt457_end:
  # rx pass
    rx452_cur."!cursor_pass"(rx452_pos, "assertion:sym<?>")
    rx452_cur."!cursor_debug"("PASS  ", "assertion:sym<?>", " at pos=", rx452_pos)
    .return (rx452_cur)
  rx452_fail:
.annotate 'line', 3
    (rx452_rep, rx452_pos, $I10, $P10) = rx452_cur."!mark_fail"(0)
    lt rx452_pos, -1, rx452_done
    eq rx452_pos, -1, rx452_fail
    jump $I10
  rx452_done:
    rx452_cur."!cursor_fail"()
    rx452_cur."!cursor_debug"("FAIL  ", "assertion:sym<?>")
    .return (rx452_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<?>"  :subid("128_1275811476.7961") :method
.annotate 'line', 3
    $P454 = self."!PREFIX__!subrule"("assertion", "?")
    new $P455, "ResizablePMCArray"
    push $P455, $P454
    push $P455, "?"
    .return ($P455)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block458"  :anon :subid("129_1275811476.7961") :method :outer("127_1275811476.7961")
.annotate 'line', 140
    .local string rx460_tgt
    .local int rx460_pos
    .local int rx460_off
    .local int rx460_eos
    .local int rx460_rep
    .local pmc rx460_cur
    (rx460_cur, rx460_pos, rx460_tgt) = self."!cursor_start"()
    rx460_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx460_cur
    .local pmc match
    .lex "$/", match
    length rx460_eos, rx460_tgt
    gt rx460_pos, rx460_eos, rx460_done
    set rx460_off, 0
    lt rx460_pos, 2, rx460_start
    sub rx460_off, rx460_pos, 1
    substr rx460_tgt, rx460_tgt, rx460_off
  rx460_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan461_done
    goto rxscan461_scan
  rxscan461_loop:
    ($P10) = rx460_cur."from"()
    inc $P10
    set rx460_pos, $P10
    ge rx460_pos, rx460_eos, rxscan461_done
  rxscan461_scan:
    set_addr $I10, rxscan461_loop
    rx460_cur."!mark_push"(0, rx460_pos, $I10)
  rxscan461_done:
  # rx literal  ">"
    add $I11, rx460_pos, 1
    gt $I11, rx460_eos, rx460_fail
    sub $I11, rx460_pos, rx460_off
    substr $S10, rx460_tgt, $I11, 1
    ne $S10, ">", rx460_fail
    add rx460_pos, 1
  # rx pass
    rx460_cur."!cursor_pass"(rx460_pos, "")
    rx460_cur."!cursor_debug"("PASS  ", "", " at pos=", rx460_pos)
    .return (rx460_cur)
  rx460_fail:
    (rx460_rep, rx460_pos, $I10, $P10) = rx460_cur."!mark_fail"(0)
    lt rx460_pos, -1, rx460_done
    eq rx460_pos, -1, rx460_fail
    jump $I10
  rx460_done:
    rx460_cur."!cursor_fail"()
    rx460_cur."!cursor_debug"("FAIL  ", "")
    .return (rx460_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<!>"  :subid("130_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .const 'Sub' $P470 = "132_1275811476.7961" 
    capture_lex $P470
    .local string rx463_tgt
    .local int rx463_pos
    .local int rx463_off
    .local int rx463_eos
    .local int rx463_rep
    .local pmc rx463_cur
    (rx463_cur, rx463_pos, rx463_tgt) = self."!cursor_start"()
    rx463_cur."!cursor_debug"("START ", "assertion:sym<!>")
    .lex unicode:"$\x{a2}", rx463_cur
    .local pmc match
    .lex "$/", match
    length rx463_eos, rx463_tgt
    gt rx463_pos, rx463_eos, rx463_done
    set rx463_off, 0
    lt rx463_pos, 2, rx463_start
    sub rx463_off, rx463_pos, 1
    substr rx463_tgt, rx463_tgt, rx463_off
  rx463_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan467_done
    goto rxscan467_scan
  rxscan467_loop:
    ($P10) = rx463_cur."from"()
    inc $P10
    set rx463_pos, $P10
    ge rx463_pos, rx463_eos, rxscan467_done
  rxscan467_scan:
    set_addr $I10, rxscan467_loop
    rx463_cur."!mark_push"(0, rx463_pos, $I10)
  rxscan467_done:
.annotate 'line', 141
  # rx literal  "!"
    add $I11, rx463_pos, 1
    gt $I11, rx463_eos, rx463_fail
    sub $I11, rx463_pos, rx463_off
    substr $S10, rx463_tgt, $I11, 1
    ne $S10, "!", rx463_fail
    add rx463_pos, 1
  alt468_0:
    set_addr $I10, alt468_1
    rx463_cur."!mark_push"(0, rx463_pos, $I10)
  # rx subrule "before" subtype=zerowidth negate=
    rx463_cur."!cursor_pos"(rx463_pos)
    .const 'Sub' $P470 = "132_1275811476.7961" 
    capture_lex $P470
    $P10 = rx463_cur."before"($P470)
    unless $P10, rx463_fail
    goto alt468_end
  alt468_1:
  # rx subrule "assertion" subtype=capture negate=
    rx463_cur."!cursor_pos"(rx463_pos)
    $P10 = rx463_cur."assertion"()
    unless $P10, rx463_fail
    rx463_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx463_pos = $P10."pos"()
  alt468_end:
  # rx pass
    rx463_cur."!cursor_pass"(rx463_pos, "assertion:sym<!>")
    rx463_cur."!cursor_debug"("PASS  ", "assertion:sym<!>", " at pos=", rx463_pos)
    .return (rx463_cur)
  rx463_fail:
.annotate 'line', 3
    (rx463_rep, rx463_pos, $I10, $P10) = rx463_cur."!mark_fail"(0)
    lt rx463_pos, -1, rx463_done
    eq rx463_pos, -1, rx463_fail
    jump $I10
  rx463_done:
    rx463_cur."!cursor_fail"()
    rx463_cur."!cursor_debug"("FAIL  ", "assertion:sym<!>")
    .return (rx463_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<!>"  :subid("131_1275811476.7961") :method
.annotate 'line', 3
    $P465 = self."!PREFIX__!subrule"("assertion", "!")
    new $P466, "ResizablePMCArray"
    push $P466, $P465
    push $P466, "!"
    .return ($P466)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block469"  :anon :subid("132_1275811476.7961") :method :outer("130_1275811476.7961")
.annotate 'line', 141
    .local string rx471_tgt
    .local int rx471_pos
    .local int rx471_off
    .local int rx471_eos
    .local int rx471_rep
    .local pmc rx471_cur
    (rx471_cur, rx471_pos, rx471_tgt) = self."!cursor_start"()
    rx471_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx471_cur
    .local pmc match
    .lex "$/", match
    length rx471_eos, rx471_tgt
    gt rx471_pos, rx471_eos, rx471_done
    set rx471_off, 0
    lt rx471_pos, 2, rx471_start
    sub rx471_off, rx471_pos, 1
    substr rx471_tgt, rx471_tgt, rx471_off
  rx471_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan472_done
    goto rxscan472_scan
  rxscan472_loop:
    ($P10) = rx471_cur."from"()
    inc $P10
    set rx471_pos, $P10
    ge rx471_pos, rx471_eos, rxscan472_done
  rxscan472_scan:
    set_addr $I10, rxscan472_loop
    rx471_cur."!mark_push"(0, rx471_pos, $I10)
  rxscan472_done:
  # rx literal  ">"
    add $I11, rx471_pos, 1
    gt $I11, rx471_eos, rx471_fail
    sub $I11, rx471_pos, rx471_off
    substr $S10, rx471_tgt, $I11, 1
    ne $S10, ">", rx471_fail
    add rx471_pos, 1
  # rx pass
    rx471_cur."!cursor_pass"(rx471_pos, "")
    rx471_cur."!cursor_debug"("PASS  ", "", " at pos=", rx471_pos)
    .return (rx471_cur)
  rx471_fail:
    (rx471_rep, rx471_pos, $I10, $P10) = rx471_cur."!mark_fail"(0)
    lt rx471_pos, -1, rx471_done
    eq rx471_pos, -1, rx471_fail
    jump $I10
  rx471_done:
    rx471_cur."!cursor_fail"()
    rx471_cur."!cursor_debug"("FAIL  ", "")
    .return (rx471_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<method>"  :subid("133_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx474_tgt
    .local int rx474_pos
    .local int rx474_off
    .local int rx474_eos
    .local int rx474_rep
    .local pmc rx474_cur
    (rx474_cur, rx474_pos, rx474_tgt) = self."!cursor_start"()
    rx474_cur."!cursor_debug"("START ", "assertion:sym<method>")
    .lex unicode:"$\x{a2}", rx474_cur
    .local pmc match
    .lex "$/", match
    length rx474_eos, rx474_tgt
    gt rx474_pos, rx474_eos, rx474_done
    set rx474_off, 0
    lt rx474_pos, 2, rx474_start
    sub rx474_off, rx474_pos, 1
    substr rx474_tgt, rx474_tgt, rx474_off
  rx474_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan478_done
    goto rxscan478_scan
  rxscan478_loop:
    ($P10) = rx474_cur."from"()
    inc $P10
    set rx474_pos, $P10
    ge rx474_pos, rx474_eos, rxscan478_done
  rxscan478_scan:
    set_addr $I10, rxscan478_loop
    rx474_cur."!mark_push"(0, rx474_pos, $I10)
  rxscan478_done:
.annotate 'line', 144
  # rx literal  "."
    add $I11, rx474_pos, 1
    gt $I11, rx474_eos, rx474_fail
    sub $I11, rx474_pos, rx474_off
    substr $S10, rx474_tgt, $I11, 1
    ne $S10, ".", rx474_fail
    add rx474_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx474_cur."!cursor_pos"(rx474_pos)
    $P10 = rx474_cur."assertion"()
    unless $P10, rx474_fail
    rx474_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx474_pos = $P10."pos"()
.annotate 'line', 143
  # rx pass
    rx474_cur."!cursor_pass"(rx474_pos, "assertion:sym<method>")
    rx474_cur."!cursor_debug"("PASS  ", "assertion:sym<method>", " at pos=", rx474_pos)
    .return (rx474_cur)
  rx474_fail:
.annotate 'line', 3
    (rx474_rep, rx474_pos, $I10, $P10) = rx474_cur."!mark_fail"(0)
    lt rx474_pos, -1, rx474_done
    eq rx474_pos, -1, rx474_fail
    jump $I10
  rx474_done:
    rx474_cur."!cursor_fail"()
    rx474_cur."!cursor_debug"("FAIL  ", "assertion:sym<method>")
    .return (rx474_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<method>"  :subid("134_1275811476.7961") :method
.annotate 'line', 3
    $P476 = self."!PREFIX__!subrule"("assertion", ".")
    new $P477, "ResizablePMCArray"
    push $P477, $P476
    .return ($P477)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<name>"  :subid("135_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .const 'Sub' $P488 = "137_1275811476.7961" 
    capture_lex $P488
    .local string rx480_tgt
    .local int rx480_pos
    .local int rx480_off
    .local int rx480_eos
    .local int rx480_rep
    .local pmc rx480_cur
    (rx480_cur, rx480_pos, rx480_tgt) = self."!cursor_start"()
    rx480_cur."!cursor_debug"("START ", "assertion:sym<name>")
    rx480_cur."!cursor_caparray"("nibbler", "arglist", "assertion")
    .lex unicode:"$\x{a2}", rx480_cur
    .local pmc match
    .lex "$/", match
    length rx480_eos, rx480_tgt
    gt rx480_pos, rx480_eos, rx480_done
    set rx480_off, 0
    lt rx480_pos, 2, rx480_start
    sub rx480_off, rx480_pos, 1
    substr rx480_tgt, rx480_tgt, rx480_off
  rx480_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan483_done
    goto rxscan483_scan
  rxscan483_loop:
    ($P10) = rx480_cur."from"()
    inc $P10
    set rx480_pos, $P10
    ge rx480_pos, rx480_eos, rxscan483_done
  rxscan483_scan:
    set_addr $I10, rxscan483_loop
    rx480_cur."!mark_push"(0, rx480_pos, $I10)
  rxscan483_done:
.annotate 'line', 148
  # rx subcapture "longname"
    set_addr $I10, rxcap_484_fail
    rx480_cur."!mark_push"(0, rx480_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx480_pos, rx480_off
    find_not_cclass $I11, 8192, rx480_tgt, $I10, rx480_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx480_fail
    add rx480_pos, rx480_off, $I11
    set_addr $I10, rxcap_484_fail
    ($I12, $I11) = rx480_cur."!mark_peek"($I10)
    rx480_cur."!cursor_pos"($I11)
    ($P10) = rx480_cur."!cursor_start"()
    $P10."!cursor_pass"(rx480_pos, "")
    rx480_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    goto rxcap_484_done
  rxcap_484_fail:
    goto rx480_fail
  rxcap_484_done:
.annotate 'line', 155
  # rx rxquantr485 ** 0..1
    set_addr $I491, rxquantr485_done
    rx480_cur."!mark_push"(0, rx480_pos, $I491)
  rxquantr485_loop:
  alt486_0:
.annotate 'line', 149
    set_addr $I10, alt486_1
    rx480_cur."!mark_push"(0, rx480_pos, $I10)
.annotate 'line', 150
  # rx subrule "before" subtype=zerowidth negate=
    rx480_cur."!cursor_pos"(rx480_pos)
    .const 'Sub' $P488 = "137_1275811476.7961" 
    capture_lex $P488
    $P10 = rx480_cur."before"($P488)
    unless $P10, rx480_fail
    goto alt486_end
  alt486_1:
    set_addr $I10, alt486_2
    rx480_cur."!mark_push"(0, rx480_pos, $I10)
.annotate 'line', 151
  # rx literal  "="
    add $I11, rx480_pos, 1
    gt $I11, rx480_eos, rx480_fail
    sub $I11, rx480_pos, rx480_off
    substr $S10, rx480_tgt, $I11, 1
    ne $S10, "=", rx480_fail
    add rx480_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx480_cur."!cursor_pos"(rx480_pos)
    $P10 = rx480_cur."assertion"()
    unless $P10, rx480_fail
    rx480_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx480_pos = $P10."pos"()
    goto alt486_end
  alt486_2:
    set_addr $I10, alt486_3
    rx480_cur."!mark_push"(0, rx480_pos, $I10)
.annotate 'line', 152
  # rx literal  ":"
    add $I11, rx480_pos, 1
    gt $I11, rx480_eos, rx480_fail
    sub $I11, rx480_pos, rx480_off
    substr $S10, rx480_tgt, $I11, 1
    ne $S10, ":", rx480_fail
    add rx480_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx480_cur."!cursor_pos"(rx480_pos)
    $P10 = rx480_cur."arglist"()
    unless $P10, rx480_fail
    rx480_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx480_pos = $P10."pos"()
    goto alt486_end
  alt486_3:
    set_addr $I10, alt486_4
    rx480_cur."!mark_push"(0, rx480_pos, $I10)
.annotate 'line', 153
  # rx literal  "("
    add $I11, rx480_pos, 1
    gt $I11, rx480_eos, rx480_fail
    sub $I11, rx480_pos, rx480_off
    substr $S10, rx480_tgt, $I11, 1
    ne $S10, "(", rx480_fail
    add rx480_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx480_cur."!cursor_pos"(rx480_pos)
    $P10 = rx480_cur."arglist"()
    unless $P10, rx480_fail
    rx480_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx480_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx480_pos, 1
    gt $I11, rx480_eos, rx480_fail
    sub $I11, rx480_pos, rx480_off
    substr $S10, rx480_tgt, $I11, 1
    ne $S10, ")", rx480_fail
    add rx480_pos, 1
    goto alt486_end
  alt486_4:
.annotate 'line', 154
  # rx subrule "normspace" subtype=method negate=
    rx480_cur."!cursor_pos"(rx480_pos)
    $P10 = rx480_cur."normspace"()
    unless $P10, rx480_fail
    rx480_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx480_cur."!cursor_pos"(rx480_pos)
    $P10 = rx480_cur."nibbler"()
    unless $P10, rx480_fail
    rx480_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx480_pos = $P10."pos"()
  alt486_end:
.annotate 'line', 155
    (rx480_rep) = rx480_cur."!mark_commit"($I491)
  rxquantr485_done:
.annotate 'line', 147
  # rx pass
    rx480_cur."!cursor_pass"(rx480_pos, "assertion:sym<name>")
    rx480_cur."!cursor_debug"("PASS  ", "assertion:sym<name>", " at pos=", rx480_pos)
    .return (rx480_cur)
  rx480_fail:
.annotate 'line', 3
    (rx480_rep, rx480_pos, $I10, $P10) = rx480_cur."!mark_fail"(0)
    lt rx480_pos, -1, rx480_done
    eq rx480_pos, -1, rx480_fail
    jump $I10
  rx480_done:
    rx480_cur."!cursor_fail"()
    rx480_cur."!cursor_debug"("FAIL  ", "assertion:sym<name>")
    .return (rx480_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<name>"  :subid("136_1275811476.7961") :method
.annotate 'line', 3
    new $P482, "ResizablePMCArray"
    push $P482, ""
    .return ($P482)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block487"  :anon :subid("137_1275811476.7961") :method :outer("135_1275811476.7961")
.annotate 'line', 150
    .local string rx489_tgt
    .local int rx489_pos
    .local int rx489_off
    .local int rx489_eos
    .local int rx489_rep
    .local pmc rx489_cur
    (rx489_cur, rx489_pos, rx489_tgt) = self."!cursor_start"()
    rx489_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx489_cur
    .local pmc match
    .lex "$/", match
    length rx489_eos, rx489_tgt
    gt rx489_pos, rx489_eos, rx489_done
    set rx489_off, 0
    lt rx489_pos, 2, rx489_start
    sub rx489_off, rx489_pos, 1
    substr rx489_tgt, rx489_tgt, rx489_off
  rx489_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan490_done
    goto rxscan490_scan
  rxscan490_loop:
    ($P10) = rx489_cur."from"()
    inc $P10
    set rx489_pos, $P10
    ge rx489_pos, rx489_eos, rxscan490_done
  rxscan490_scan:
    set_addr $I10, rxscan490_loop
    rx489_cur."!mark_push"(0, rx489_pos, $I10)
  rxscan490_done:
  # rx literal  ">"
    add $I11, rx489_pos, 1
    gt $I11, rx489_eos, rx489_fail
    sub $I11, rx489_pos, rx489_off
    substr $S10, rx489_tgt, $I11, 1
    ne $S10, ">", rx489_fail
    add rx489_pos, 1
  # rx pass
    rx489_cur."!cursor_pass"(rx489_pos, "")
    rx489_cur."!cursor_debug"("PASS  ", "", " at pos=", rx489_pos)
    .return (rx489_cur)
  rx489_fail:
    (rx489_rep, rx489_pos, $I10, $P10) = rx489_cur."!mark_fail"(0)
    lt rx489_pos, -1, rx489_done
    eq rx489_pos, -1, rx489_fail
    jump $I10
  rx489_done:
    rx489_cur."!cursor_fail"()
    rx489_cur."!cursor_debug"("FAIL  ", "")
    .return (rx489_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<[>"  :subid("138_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .const 'Sub' $P498 = "140_1275811476.7961" 
    capture_lex $P498
    .local string rx493_tgt
    .local int rx493_pos
    .local int rx493_off
    .local int rx493_eos
    .local int rx493_rep
    .local pmc rx493_cur
    (rx493_cur, rx493_pos, rx493_tgt) = self."!cursor_start"()
    rx493_cur."!cursor_debug"("START ", "assertion:sym<[>")
    rx493_cur."!cursor_caparray"("cclass_elem")
    .lex unicode:"$\x{a2}", rx493_cur
    .local pmc match
    .lex "$/", match
    length rx493_eos, rx493_tgt
    gt rx493_pos, rx493_eos, rx493_done
    set rx493_off, 0
    lt rx493_pos, 2, rx493_start
    sub rx493_off, rx493_pos, 1
    substr rx493_tgt, rx493_tgt, rx493_off
  rx493_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan496_done
    goto rxscan496_scan
  rxscan496_loop:
    ($P10) = rx493_cur."from"()
    inc $P10
    set rx493_pos, $P10
    ge rx493_pos, rx493_eos, rxscan496_done
  rxscan496_scan:
    set_addr $I10, rxscan496_loop
    rx493_cur."!mark_push"(0, rx493_pos, $I10)
  rxscan496_done:
.annotate 'line', 158
  # rx subrule "before" subtype=zerowidth negate=
    rx493_cur."!cursor_pos"(rx493_pos)
    .const 'Sub' $P498 = "140_1275811476.7961" 
    capture_lex $P498
    $P10 = rx493_cur."before"($P498)
    unless $P10, rx493_fail
  # rx rxquantr502 ** 1..*
    set_addr $I503, rxquantr502_done
    rx493_cur."!mark_push"(0, -1, $I503)
  rxquantr502_loop:
  # rx subrule "cclass_elem" subtype=capture negate=
    rx493_cur."!cursor_pos"(rx493_pos)
    $P10 = rx493_cur."cclass_elem"()
    unless $P10, rx493_fail
    rx493_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cclass_elem")
    rx493_pos = $P10."pos"()
    (rx493_rep) = rx493_cur."!mark_commit"($I503)
    rx493_cur."!mark_push"(rx493_rep, rx493_pos, $I503)
    goto rxquantr502_loop
  rxquantr502_done:
  # rx pass
    rx493_cur."!cursor_pass"(rx493_pos, "assertion:sym<[>")
    rx493_cur."!cursor_debug"("PASS  ", "assertion:sym<[>", " at pos=", rx493_pos)
    .return (rx493_cur)
  rx493_fail:
.annotate 'line', 3
    (rx493_rep, rx493_pos, $I10, $P10) = rx493_cur."!mark_fail"(0)
    lt rx493_pos, -1, rx493_done
    eq rx493_pos, -1, rx493_fail
    jump $I10
  rx493_done:
    rx493_cur."!cursor_fail"()
    rx493_cur."!cursor_debug"("FAIL  ", "assertion:sym<[>")
    .return (rx493_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<[>"  :subid("139_1275811476.7961") :method
.annotate 'line', 3
    new $P495, "ResizablePMCArray"
    push $P495, ""
    .return ($P495)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block497"  :anon :subid("140_1275811476.7961") :method :outer("138_1275811476.7961")
.annotate 'line', 158
    .local string rx499_tgt
    .local int rx499_pos
    .local int rx499_off
    .local int rx499_eos
    .local int rx499_rep
    .local pmc rx499_cur
    (rx499_cur, rx499_pos, rx499_tgt) = self."!cursor_start"()
    rx499_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx499_cur
    .local pmc match
    .lex "$/", match
    length rx499_eos, rx499_tgt
    gt rx499_pos, rx499_eos, rx499_done
    set rx499_off, 0
    lt rx499_pos, 2, rx499_start
    sub rx499_off, rx499_pos, 1
    substr rx499_tgt, rx499_tgt, rx499_off
  rx499_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan500_done
    goto rxscan500_scan
  rxscan500_loop:
    ($P10) = rx499_cur."from"()
    inc $P10
    set rx499_pos, $P10
    ge rx499_pos, rx499_eos, rxscan500_done
  rxscan500_scan:
    set_addr $I10, rxscan500_loop
    rx499_cur."!mark_push"(0, rx499_pos, $I10)
  rxscan500_done:
  alt501_0:
    set_addr $I10, alt501_1
    rx499_cur."!mark_push"(0, rx499_pos, $I10)
  # rx literal  "["
    add $I11, rx499_pos, 1
    gt $I11, rx499_eos, rx499_fail
    sub $I11, rx499_pos, rx499_off
    substr $S10, rx499_tgt, $I11, 1
    ne $S10, "[", rx499_fail
    add rx499_pos, 1
    goto alt501_end
  alt501_1:
    set_addr $I10, alt501_2
    rx499_cur."!mark_push"(0, rx499_pos, $I10)
  # rx literal  "+"
    add $I11, rx499_pos, 1
    gt $I11, rx499_eos, rx499_fail
    sub $I11, rx499_pos, rx499_off
    substr $S10, rx499_tgt, $I11, 1
    ne $S10, "+", rx499_fail
    add rx499_pos, 1
    goto alt501_end
  alt501_2:
  # rx literal  "-"
    add $I11, rx499_pos, 1
    gt $I11, rx499_eos, rx499_fail
    sub $I11, rx499_pos, rx499_off
    substr $S10, rx499_tgt, $I11, 1
    ne $S10, "-", rx499_fail
    add rx499_pos, 1
  alt501_end:
  # rx pass
    rx499_cur."!cursor_pass"(rx499_pos, "")
    rx499_cur."!cursor_debug"("PASS  ", "", " at pos=", rx499_pos)
    .return (rx499_cur)
  rx499_fail:
    (rx499_rep, rx499_pos, $I10, $P10) = rx499_cur."!mark_fail"(0)
    lt rx499_pos, -1, rx499_done
    eq rx499_pos, -1, rx499_fail
    jump $I10
  rx499_done:
    rx499_cur."!cursor_fail"()
    rx499_cur."!cursor_debug"("FAIL  ", "")
    .return (rx499_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "cclass_elem"  :subid("141_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .const 'Sub' $P516 = "143_1275811476.7961" 
    capture_lex $P516
    .local string rx505_tgt
    .local int rx505_pos
    .local int rx505_off
    .local int rx505_eos
    .local int rx505_rep
    .local pmc rx505_cur
    (rx505_cur, rx505_pos, rx505_tgt) = self."!cursor_start"()
    rx505_cur."!cursor_debug"("START ", "cclass_elem")
    rx505_cur."!cursor_caparray"("charspec")
    .lex unicode:"$\x{a2}", rx505_cur
    .local pmc match
    .lex "$/", match
    length rx505_eos, rx505_tgt
    gt rx505_pos, rx505_eos, rx505_done
    set rx505_off, 0
    lt rx505_pos, 2, rx505_start
    sub rx505_off, rx505_pos, 1
    substr rx505_tgt, rx505_tgt, rx505_off
  rx505_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan508_done
    goto rxscan508_scan
  rxscan508_loop:
    ($P10) = rx505_cur."from"()
    inc $P10
    set rx505_pos, $P10
    ge rx505_pos, rx505_eos, rxscan508_done
  rxscan508_scan:
    set_addr $I10, rxscan508_loop
    rx505_cur."!mark_push"(0, rx505_pos, $I10)
  rxscan508_done:
.annotate 'line', 161
  # rx subcapture "sign"
    set_addr $I10, rxcap_510_fail
    rx505_cur."!mark_push"(0, rx505_pos, $I10)
  alt509_0:
    set_addr $I10, alt509_1
    rx505_cur."!mark_push"(0, rx505_pos, $I10)
  # rx literal  "+"
    add $I11, rx505_pos, 1
    gt $I11, rx505_eos, rx505_fail
    sub $I11, rx505_pos, rx505_off
    substr $S10, rx505_tgt, $I11, 1
    ne $S10, "+", rx505_fail
    add rx505_pos, 1
    goto alt509_end
  alt509_1:
    set_addr $I10, alt509_2
    rx505_cur."!mark_push"(0, rx505_pos, $I10)
  # rx literal  "-"
    add $I11, rx505_pos, 1
    gt $I11, rx505_eos, rx505_fail
    sub $I11, rx505_pos, rx505_off
    substr $S10, rx505_tgt, $I11, 1
    ne $S10, "-", rx505_fail
    add rx505_pos, 1
    goto alt509_end
  alt509_2:
  alt509_end:
    set_addr $I10, rxcap_510_fail
    ($I12, $I11) = rx505_cur."!mark_peek"($I10)
    rx505_cur."!cursor_pos"($I11)
    ($P10) = rx505_cur."!cursor_start"()
    $P10."!cursor_pass"(rx505_pos, "")
    rx505_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sign")
    goto rxcap_510_done
  rxcap_510_fail:
    goto rx505_fail
  rxcap_510_done:
.annotate 'line', 162
  # rx rxquantr511 ** 0..1
    set_addr $I512, rxquantr511_done
    rx505_cur."!mark_push"(0, rx505_pos, $I512)
  rxquantr511_loop:
  # rx subrule "normspace" subtype=method negate=
    rx505_cur."!cursor_pos"(rx505_pos)
    $P10 = rx505_cur."normspace"()
    unless $P10, rx505_fail
    rx505_pos = $P10."pos"()
    (rx505_rep) = rx505_cur."!mark_commit"($I512)
  rxquantr511_done:
  alt513_0:
.annotate 'line', 163
    set_addr $I10, alt513_1
    rx505_cur."!mark_push"(0, rx505_pos, $I10)
.annotate 'line', 164
  # rx literal  "["
    add $I11, rx505_pos, 1
    gt $I11, rx505_eos, rx505_fail
    sub $I11, rx505_pos, rx505_off
    substr $S10, rx505_tgt, $I11, 1
    ne $S10, "[", rx505_fail
    add rx505_pos, 1
.annotate 'line', 167
  # rx rxquantr514 ** 0..*
    set_addr $I535, rxquantr514_done
    rx505_cur."!mark_push"(0, rx505_pos, $I535)
  rxquantr514_loop:
.annotate 'line', 164
  # rx subrule $P516 subtype=capture negate=
    rx505_cur."!cursor_pos"(rx505_pos)
    .const 'Sub' $P516 = "143_1275811476.7961" 
    capture_lex $P516
    $P10 = rx505_cur.$P516()
    unless $P10, rx505_fail
    rx505_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charspec")
    rx505_pos = $P10."pos"()
.annotate 'line', 167
    (rx505_rep) = rx505_cur."!mark_commit"($I535)
    rx505_cur."!mark_push"(rx505_rep, rx505_pos, $I535)
    goto rxquantr514_loop
  rxquantr514_done:
.annotate 'line', 168
  # rx charclass_q s r 0..-1
    sub $I10, rx505_pos, rx505_off
    find_not_cclass $I11, 32, rx505_tgt, $I10, rx505_eos
    add rx505_pos, rx505_off, $I11
  # rx literal  "]"
    add $I11, rx505_pos, 1
    gt $I11, rx505_eos, rx505_fail
    sub $I11, rx505_pos, rx505_off
    substr $S10, rx505_tgt, $I11, 1
    ne $S10, "]", rx505_fail
    add rx505_pos, 1
.annotate 'line', 164
    goto alt513_end
  alt513_1:
.annotate 'line', 169
  # rx subcapture "name"
    set_addr $I10, rxcap_536_fail
    rx505_cur."!mark_push"(0, rx505_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx505_pos, rx505_off
    find_not_cclass $I11, 8192, rx505_tgt, $I10, rx505_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx505_fail
    add rx505_pos, rx505_off, $I11
    set_addr $I10, rxcap_536_fail
    ($I12, $I11) = rx505_cur."!mark_peek"($I10)
    rx505_cur."!cursor_pos"($I11)
    ($P10) = rx505_cur."!cursor_start"()
    $P10."!cursor_pass"(rx505_pos, "")
    rx505_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_536_done
  rxcap_536_fail:
    goto rx505_fail
  rxcap_536_done:
  alt513_end:
.annotate 'line', 171
  # rx rxquantr537 ** 0..1
    set_addr $I538, rxquantr537_done
    rx505_cur."!mark_push"(0, rx505_pos, $I538)
  rxquantr537_loop:
  # rx subrule "normspace" subtype=method negate=
    rx505_cur."!cursor_pos"(rx505_pos)
    $P10 = rx505_cur."normspace"()
    unless $P10, rx505_fail
    rx505_pos = $P10."pos"()
    (rx505_rep) = rx505_cur."!mark_commit"($I538)
  rxquantr537_done:
.annotate 'line', 160
  # rx pass
    rx505_cur."!cursor_pass"(rx505_pos, "cclass_elem")
    rx505_cur."!cursor_debug"("PASS  ", "cclass_elem", " at pos=", rx505_pos)
    .return (rx505_cur)
  rx505_fail:
.annotate 'line', 3
    (rx505_rep, rx505_pos, $I10, $P10) = rx505_cur."!mark_fail"(0)
    lt rx505_pos, -1, rx505_done
    eq rx505_pos, -1, rx505_fail
    jump $I10
  rx505_done:
    rx505_cur."!cursor_fail"()
    rx505_cur."!cursor_debug"("FAIL  ", "cclass_elem")
    .return (rx505_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__cclass_elem"  :subid("142_1275811476.7961") :method
.annotate 'line', 3
    new $P507, "ResizablePMCArray"
    push $P507, ""
    push $P507, "-"
    push $P507, "+"
    .return ($P507)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block515"  :anon :subid("143_1275811476.7961") :method :outer("141_1275811476.7961")
.annotate 'line', 164
    .const 'Sub' $P531 = "146_1275811476.7961" 
    capture_lex $P531
    .const 'Sub' $P526 = "145_1275811476.7961" 
    capture_lex $P526
    .const 'Sub' $P522 = "144_1275811476.7961" 
    capture_lex $P522
    .local string rx517_tgt
    .local int rx517_pos
    .local int rx517_off
    .local int rx517_eos
    .local int rx517_rep
    .local pmc rx517_cur
    (rx517_cur, rx517_pos, rx517_tgt) = self."!cursor_start"()
    rx517_cur."!cursor_debug"("START ", "")
    rx517_cur."!cursor_caparray"("1")
    .lex unicode:"$\x{a2}", rx517_cur
    .local pmc match
    .lex "$/", match
    length rx517_eos, rx517_tgt
    gt rx517_pos, rx517_eos, rx517_done
    set rx517_off, 0
    lt rx517_pos, 2, rx517_start
    sub rx517_off, rx517_pos, 1
    substr rx517_tgt, rx517_tgt, rx517_off
  rx517_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan518_done
    goto rxscan518_scan
  rxscan518_loop:
    ($P10) = rx517_cur."from"()
    inc $P10
    set rx517_pos, $P10
    ge rx517_pos, rx517_eos, rxscan518_done
  rxscan518_scan:
    set_addr $I10, rxscan518_loop
    rx517_cur."!mark_push"(0, rx517_pos, $I10)
  rxscan518_done:
  alt519_0:
    set_addr $I10, alt519_1
    rx517_cur."!mark_push"(0, rx517_pos, $I10)
.annotate 'line', 165
  # rx charclass_q s r 0..-1
    sub $I10, rx517_pos, rx517_off
    find_not_cclass $I11, 32, rx517_tgt, $I10, rx517_eos
    add rx517_pos, rx517_off, $I11
  # rx literal  "-"
    add $I11, rx517_pos, 1
    gt $I11, rx517_eos, rx517_fail
    sub $I11, rx517_pos, rx517_off
    substr $S10, rx517_tgt, $I11, 1
    ne $S10, "-", rx517_fail
    add rx517_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx517_cur."!cursor_pos"(rx517_pos)
    $P10 = rx517_cur."obs"("hyphen in enumerated character class", "..")
    unless $P10, rx517_fail
    rx517_pos = $P10."pos"()
    goto alt519_end
  alt519_1:
.annotate 'line', 166
  # rx charclass_q s r 0..-1
    sub $I10, rx517_pos, rx517_off
    find_not_cclass $I11, 32, rx517_tgt, $I10, rx517_eos
    add rx517_pos, rx517_off, $I11
  alt520_0:
    set_addr $I10, alt520_1
    rx517_cur."!mark_push"(0, rx517_pos, $I10)
  # rx literal  "\\"
    add $I11, rx517_pos, 1
    gt $I11, rx517_eos, rx517_fail
    sub $I11, rx517_pos, rx517_off
    substr $S10, rx517_tgt, $I11, 1
    ne $S10, "\\", rx517_fail
    add rx517_pos, 1
  # rx subrule $P522 subtype=capture negate=
    rx517_cur."!cursor_pos"(rx517_pos)
    .const 'Sub' $P522 = "144_1275811476.7961" 
    capture_lex $P522
    $P10 = rx517_cur.$P522()
    unless $P10, rx517_fail
    rx517_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"(0)
    rx517_pos = $P10."pos"()
    goto alt520_end
  alt520_1:
  # rx subrule $P526 subtype=capture negate=
    rx517_cur."!cursor_pos"(rx517_pos)
    .const 'Sub' $P526 = "145_1275811476.7961" 
    capture_lex $P526
    $P10 = rx517_cur.$P526()
    unless $P10, rx517_fail
    rx517_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"(0)
    rx517_pos = $P10."pos"()
  alt520_end:
  # rx rxquantr529 ** 0..1
    set_addr $I534, rxquantr529_done
    rx517_cur."!mark_push"(0, rx517_pos, $I534)
  rxquantr529_loop:
  # rx charclass_q s r 0..-1
    sub $I10, rx517_pos, rx517_off
    find_not_cclass $I11, 32, rx517_tgt, $I10, rx517_eos
    add rx517_pos, rx517_off, $I11
  # rx literal  ".."
    add $I11, rx517_pos, 2
    gt $I11, rx517_eos, rx517_fail
    sub $I11, rx517_pos, rx517_off
    substr $S10, rx517_tgt, $I11, 2
    ne $S10, "..", rx517_fail
    add rx517_pos, 2
  # rx charclass_q s r 0..-1
    sub $I10, rx517_pos, rx517_off
    find_not_cclass $I11, 32, rx517_tgt, $I10, rx517_eos
    add rx517_pos, rx517_off, $I11
  # rx subrule $P531 subtype=capture negate=
    rx517_cur."!cursor_pos"(rx517_pos)
    .const 'Sub' $P531 = "146_1275811476.7961" 
    capture_lex $P531
    $P10 = rx517_cur.$P531()
    unless $P10, rx517_fail
    rx517_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("1")
    rx517_pos = $P10."pos"()
    (rx517_rep) = rx517_cur."!mark_commit"($I534)
  rxquantr529_done:
  alt519_end:
.annotate 'line', 164
  # rx pass
    rx517_cur."!cursor_pass"(rx517_pos, "")
    rx517_cur."!cursor_debug"("PASS  ", "", " at pos=", rx517_pos)
    .return (rx517_cur)
  rx517_fail:
    (rx517_rep, rx517_pos, $I10, $P10) = rx517_cur."!mark_fail"(0)
    lt rx517_pos, -1, rx517_done
    eq rx517_pos, -1, rx517_fail
    jump $I10
  rx517_done:
    rx517_cur."!cursor_fail"()
    rx517_cur."!cursor_debug"("FAIL  ", "")
    .return (rx517_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block521"  :anon :subid("144_1275811476.7961") :method :outer("143_1275811476.7961")
.annotate 'line', 166
    .local string rx523_tgt
    .local int rx523_pos
    .local int rx523_off
    .local int rx523_eos
    .local int rx523_rep
    .local pmc rx523_cur
    (rx523_cur, rx523_pos, rx523_tgt) = self."!cursor_start"()
    rx523_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx523_cur
    .local pmc match
    .lex "$/", match
    length rx523_eos, rx523_tgt
    gt rx523_pos, rx523_eos, rx523_done
    set rx523_off, 0
    lt rx523_pos, 2, rx523_start
    sub rx523_off, rx523_pos, 1
    substr rx523_tgt, rx523_tgt, rx523_off
  rx523_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan524_done
    goto rxscan524_scan
  rxscan524_loop:
    ($P10) = rx523_cur."from"()
    inc $P10
    set rx523_pos, $P10
    ge rx523_pos, rx523_eos, rxscan524_done
  rxscan524_scan:
    set_addr $I10, rxscan524_loop
    rx523_cur."!mark_push"(0, rx523_pos, $I10)
  rxscan524_done:
  # rx charclass .
    ge rx523_pos, rx523_eos, rx523_fail
    inc rx523_pos
  # rx pass
    rx523_cur."!cursor_pass"(rx523_pos, "")
    rx523_cur."!cursor_debug"("PASS  ", "", " at pos=", rx523_pos)
    .return (rx523_cur)
  rx523_fail:
    (rx523_rep, rx523_pos, $I10, $P10) = rx523_cur."!mark_fail"(0)
    lt rx523_pos, -1, rx523_done
    eq rx523_pos, -1, rx523_fail
    jump $I10
  rx523_done:
    rx523_cur."!cursor_fail"()
    rx523_cur."!cursor_debug"("FAIL  ", "")
    .return (rx523_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block525"  :anon :subid("145_1275811476.7961") :method :outer("143_1275811476.7961")
.annotate 'line', 166
    .local string rx527_tgt
    .local int rx527_pos
    .local int rx527_off
    .local int rx527_eos
    .local int rx527_rep
    .local pmc rx527_cur
    (rx527_cur, rx527_pos, rx527_tgt) = self."!cursor_start"()
    rx527_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx527_cur
    .local pmc match
    .lex "$/", match
    length rx527_eos, rx527_tgt
    gt rx527_pos, rx527_eos, rx527_done
    set rx527_off, 0
    lt rx527_pos, 2, rx527_start
    sub rx527_off, rx527_pos, 1
    substr rx527_tgt, rx527_tgt, rx527_off
  rx527_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan528_done
    goto rxscan528_scan
  rxscan528_loop:
    ($P10) = rx527_cur."from"()
    inc $P10
    set rx527_pos, $P10
    ge rx527_pos, rx527_eos, rxscan528_done
  rxscan528_scan:
    set_addr $I10, rxscan528_loop
    rx527_cur."!mark_push"(0, rx527_pos, $I10)
  rxscan528_done:
  # rx enumcharlist negate=1 
    ge rx527_pos, rx527_eos, rx527_fail
    sub $I10, rx527_pos, rx527_off
    substr $S10, rx527_tgt, $I10, 1
    index $I11, "]\\", $S10
    ge $I11, 0, rx527_fail
    inc rx527_pos
  # rx pass
    rx527_cur."!cursor_pass"(rx527_pos, "")
    rx527_cur."!cursor_debug"("PASS  ", "", " at pos=", rx527_pos)
    .return (rx527_cur)
  rx527_fail:
    (rx527_rep, rx527_pos, $I10, $P10) = rx527_cur."!mark_fail"(0)
    lt rx527_pos, -1, rx527_done
    eq rx527_pos, -1, rx527_fail
    jump $I10
  rx527_done:
    rx527_cur."!cursor_fail"()
    rx527_cur."!cursor_debug"("FAIL  ", "")
    .return (rx527_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block530"  :anon :subid("146_1275811476.7961") :method :outer("143_1275811476.7961")
.annotate 'line', 166
    .local string rx532_tgt
    .local int rx532_pos
    .local int rx532_off
    .local int rx532_eos
    .local int rx532_rep
    .local pmc rx532_cur
    (rx532_cur, rx532_pos, rx532_tgt) = self."!cursor_start"()
    rx532_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx532_cur
    .local pmc match
    .lex "$/", match
    length rx532_eos, rx532_tgt
    gt rx532_pos, rx532_eos, rx532_done
    set rx532_off, 0
    lt rx532_pos, 2, rx532_start
    sub rx532_off, rx532_pos, 1
    substr rx532_tgt, rx532_tgt, rx532_off
  rx532_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan533_done
    goto rxscan533_scan
  rxscan533_loop:
    ($P10) = rx532_cur."from"()
    inc $P10
    set rx532_pos, $P10
    ge rx532_pos, rx532_eos, rxscan533_done
  rxscan533_scan:
    set_addr $I10, rxscan533_loop
    rx532_cur."!mark_push"(0, rx532_pos, $I10)
  rxscan533_done:
  # rx charclass .
    ge rx532_pos, rx532_eos, rx532_fail
    inc rx532_pos
  # rx pass
    rx532_cur."!cursor_pass"(rx532_pos, "")
    rx532_cur."!cursor_debug"("PASS  ", "", " at pos=", rx532_pos)
    .return (rx532_cur)
  rx532_fail:
    (rx532_rep, rx532_pos, $I10, $P10) = rx532_cur."!mark_fail"(0)
    lt rx532_pos, -1, rx532_done
    eq rx532_pos, -1, rx532_fail
    jump $I10
  rx532_done:
    rx532_cur."!cursor_fail"()
    rx532_cur."!cursor_debug"("FAIL  ", "")
    .return (rx532_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_internal"  :subid("147_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .const 'Sub' $P548 = "149_1275811476.7961" 
    capture_lex $P548
    .local string rx540_tgt
    .local int rx540_pos
    .local int rx540_off
    .local int rx540_eos
    .local int rx540_rep
    .local pmc rx540_cur
    (rx540_cur, rx540_pos, rx540_tgt) = self."!cursor_start"()
    rx540_cur."!cursor_debug"("START ", "mod_internal")
    rx540_cur."!cursor_caparray"("n")
    .lex unicode:"$\x{a2}", rx540_cur
    .local pmc match
    .lex "$/", match
    length rx540_eos, rx540_tgt
    gt rx540_pos, rx540_eos, rx540_done
    set rx540_off, 0
    lt rx540_pos, 2, rx540_start
    sub rx540_off, rx540_pos, 1
    substr rx540_tgt, rx540_tgt, rx540_off
  rx540_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan544_done
    goto rxscan544_scan
  rxscan544_loop:
    ($P10) = rx540_cur."from"()
    inc $P10
    set rx540_pos, $P10
    ge rx540_pos, rx540_eos, rxscan544_done
  rxscan544_scan:
    set_addr $I10, rxscan544_loop
    rx540_cur."!mark_push"(0, rx540_pos, $I10)
  rxscan544_done:
  alt545_0:
.annotate 'line', 175
    set_addr $I10, alt545_1
    rx540_cur."!mark_push"(0, rx540_pos, $I10)
.annotate 'line', 176
  # rx literal  ":"
    add $I11, rx540_pos, 1
    gt $I11, rx540_eos, rx540_fail
    sub $I11, rx540_pos, rx540_off
    substr $S10, rx540_tgt, $I11, 1
    ne $S10, ":", rx540_fail
    add rx540_pos, 1
  # rx rxquantr546 ** 1..1
    set_addr $I552, rxquantr546_done
    rx540_cur."!mark_push"(0, -1, $I552)
  rxquantr546_loop:
  # rx subrule $P548 subtype=capture negate=
    rx540_cur."!cursor_pos"(rx540_pos)
    .const 'Sub' $P548 = "149_1275811476.7961" 
    capture_lex $P548
    $P10 = rx540_cur.$P548()
    unless $P10, rx540_fail
    rx540_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("n")
    rx540_pos = $P10."pos"()
    (rx540_rep) = rx540_cur."!mark_commit"($I552)
  rxquantr546_done:
  # rx subrule "mod_ident" subtype=capture negate=
    rx540_cur."!cursor_pos"(rx540_pos)
    $P10 = rx540_cur."mod_ident"()
    unless $P10, rx540_fail
    rx540_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_ident")
    rx540_pos = $P10."pos"()
  # rxanchor rwb
    le rx540_pos, 0, rx540_fail
    sub $I10, rx540_pos, rx540_off
    is_cclass $I11, 8192, rx540_tgt, $I10
    if $I11, rx540_fail
    dec $I10
    is_cclass $I11, 8192, rx540_tgt, $I10
    unless $I11, rx540_fail
    goto alt545_end
  alt545_1:
.annotate 'line', 177
  # rx literal  ":"
    add $I11, rx540_pos, 1
    gt $I11, rx540_eos, rx540_fail
    sub $I11, rx540_pos, rx540_off
    substr $S10, rx540_tgt, $I11, 1
    ne $S10, ":", rx540_fail
    add rx540_pos, 1
  # rx subrule "mod_ident" subtype=capture negate=
    rx540_cur."!cursor_pos"(rx540_pos)
    $P10 = rx540_cur."mod_ident"()
    unless $P10, rx540_fail
    rx540_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_ident")
    rx540_pos = $P10."pos"()
  # rx rxquantr553 ** 0..1
    set_addr $I555, rxquantr553_done
    rx540_cur."!mark_push"(0, rx540_pos, $I555)
  rxquantr553_loop:
  # rx literal  "("
    add $I11, rx540_pos, 1
    gt $I11, rx540_eos, rx540_fail
    sub $I11, rx540_pos, rx540_off
    substr $S10, rx540_tgt, $I11, 1
    ne $S10, "(", rx540_fail
    add rx540_pos, 1
  # rx subcapture "n"
    set_addr $I10, rxcap_554_fail
    rx540_cur."!mark_push"(0, rx540_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx540_pos, rx540_off
    find_not_cclass $I11, 8, rx540_tgt, $I10, rx540_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx540_fail
    add rx540_pos, rx540_off, $I11
    set_addr $I10, rxcap_554_fail
    ($I12, $I11) = rx540_cur."!mark_peek"($I10)
    rx540_cur."!cursor_pos"($I11)
    ($P10) = rx540_cur."!cursor_start"()
    $P10."!cursor_pass"(rx540_pos, "")
    rx540_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("n")
    goto rxcap_554_done
  rxcap_554_fail:
    goto rx540_fail
  rxcap_554_done:
  # rx literal  ")"
    add $I11, rx540_pos, 1
    gt $I11, rx540_eos, rx540_fail
    sub $I11, rx540_pos, rx540_off
    substr $S10, rx540_tgt, $I11, 1
    ne $S10, ")", rx540_fail
    add rx540_pos, 1
    (rx540_rep) = rx540_cur."!mark_commit"($I555)
  rxquantr553_done:
  alt545_end:
.annotate 'line', 174
  # rx pass
    rx540_cur."!cursor_pass"(rx540_pos, "mod_internal")
    rx540_cur."!cursor_debug"("PASS  ", "mod_internal", " at pos=", rx540_pos)
    .return (rx540_cur)
  rx540_fail:
.annotate 'line', 3
    (rx540_rep, rx540_pos, $I10, $P10) = rx540_cur."!mark_fail"(0)
    lt rx540_pos, -1, rx540_done
    eq rx540_pos, -1, rx540_fail
    jump $I10
  rx540_done:
    rx540_cur."!cursor_fail"()
    rx540_cur."!cursor_debug"("FAIL  ", "mod_internal")
    .return (rx540_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_internal"  :subid("148_1275811476.7961") :method
.annotate 'line', 3
    $P542 = self."!PREFIX__!subrule"("mod_ident", ":")
    new $P543, "ResizablePMCArray"
    push $P543, $P542
    push $P543, ":"
    .return ($P543)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block547"  :anon :subid("149_1275811476.7961") :method :outer("147_1275811476.7961")
.annotate 'line', 176
    .local string rx549_tgt
    .local int rx549_pos
    .local int rx549_off
    .local int rx549_eos
    .local int rx549_rep
    .local pmc rx549_cur
    (rx549_cur, rx549_pos, rx549_tgt) = self."!cursor_start"()
    rx549_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx549_cur
    .local pmc match
    .lex "$/", match
    length rx549_eos, rx549_tgt
    gt rx549_pos, rx549_eos, rx549_done
    set rx549_off, 0
    lt rx549_pos, 2, rx549_start
    sub rx549_off, rx549_pos, 1
    substr rx549_tgt, rx549_tgt, rx549_off
  rx549_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan550_done
    goto rxscan550_scan
  rxscan550_loop:
    ($P10) = rx549_cur."from"()
    inc $P10
    set rx549_pos, $P10
    ge rx549_pos, rx549_eos, rxscan550_done
  rxscan550_scan:
    set_addr $I10, rxscan550_loop
    rx549_cur."!mark_push"(0, rx549_pos, $I10)
  rxscan550_done:
  alt551_0:
    set_addr $I10, alt551_1
    rx549_cur."!mark_push"(0, rx549_pos, $I10)
  # rx literal  "!"
    add $I11, rx549_pos, 1
    gt $I11, rx549_eos, rx549_fail
    sub $I11, rx549_pos, rx549_off
    substr $S10, rx549_tgt, $I11, 1
    ne $S10, "!", rx549_fail
    add rx549_pos, 1
    goto alt551_end
  alt551_1:
  # rx charclass_q d r 1..-1
    sub $I10, rx549_pos, rx549_off
    find_not_cclass $I11, 8, rx549_tgt, $I10, rx549_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx549_fail
    add rx549_pos, rx549_off, $I11
  alt551_end:
  # rx pass
    rx549_cur."!cursor_pass"(rx549_pos, "")
    rx549_cur."!cursor_debug"("PASS  ", "", " at pos=", rx549_pos)
    .return (rx549_cur)
  rx549_fail:
    (rx549_rep, rx549_pos, $I10, $P10) = rx549_cur."!mark_fail"(0)
    lt rx549_pos, -1, rx549_done
    eq rx549_pos, -1, rx549_fail
    jump $I10
  rx549_done:
    rx549_cur."!cursor_fail"()
    rx549_cur."!cursor_debug"("FAIL  ", "")
    .return (rx549_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident"  :subid("150_1275811476.7961") :method
.annotate 'line', 181
    $P557 = self."!protoregex"("mod_ident")
    .return ($P557)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident"  :subid("151_1275811476.7961") :method
.annotate 'line', 181
    $P559 = self."!PREFIX__!protoregex"("mod_ident")
    .return ($P559)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ignorecase>"  :subid("152_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx561_tgt
    .local int rx561_pos
    .local int rx561_off
    .local int rx561_eos
    .local int rx561_rep
    .local pmc rx561_cur
    (rx561_cur, rx561_pos, rx561_tgt) = self."!cursor_start"()
    rx561_cur."!cursor_debug"("START ", "mod_ident:sym<ignorecase>")
    .lex unicode:"$\x{a2}", rx561_cur
    .local pmc match
    .lex "$/", match
    length rx561_eos, rx561_tgt
    gt rx561_pos, rx561_eos, rx561_done
    set rx561_off, 0
    lt rx561_pos, 2, rx561_start
    sub rx561_off, rx561_pos, 1
    substr rx561_tgt, rx561_tgt, rx561_off
  rx561_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan564_done
    goto rxscan564_scan
  rxscan564_loop:
    ($P10) = rx561_cur."from"()
    inc $P10
    set rx561_pos, $P10
    ge rx561_pos, rx561_eos, rxscan564_done
  rxscan564_scan:
    set_addr $I10, rxscan564_loop
    rx561_cur."!mark_push"(0, rx561_pos, $I10)
  rxscan564_done:
.annotate 'line', 182
  # rx subcapture "sym"
    set_addr $I10, rxcap_565_fail
    rx561_cur."!mark_push"(0, rx561_pos, $I10)
  # rx literal  "i"
    add $I11, rx561_pos, 1
    gt $I11, rx561_eos, rx561_fail
    sub $I11, rx561_pos, rx561_off
    substr $S10, rx561_tgt, $I11, 1
    ne $S10, "i", rx561_fail
    add rx561_pos, 1
    set_addr $I10, rxcap_565_fail
    ($I12, $I11) = rx561_cur."!mark_peek"($I10)
    rx561_cur."!cursor_pos"($I11)
    ($P10) = rx561_cur."!cursor_start"()
    $P10."!cursor_pass"(rx561_pos, "")
    rx561_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_565_done
  rxcap_565_fail:
    goto rx561_fail
  rxcap_565_done:
  # rx rxquantr566 ** 0..1
    set_addr $I567, rxquantr566_done
    rx561_cur."!mark_push"(0, rx561_pos, $I567)
  rxquantr566_loop:
  # rx literal  "gnorecase"
    add $I11, rx561_pos, 9
    gt $I11, rx561_eos, rx561_fail
    sub $I11, rx561_pos, rx561_off
    substr $S10, rx561_tgt, $I11, 9
    ne $S10, "gnorecase", rx561_fail
    add rx561_pos, 9
    (rx561_rep) = rx561_cur."!mark_commit"($I567)
  rxquantr566_done:
  # rx pass
    rx561_cur."!cursor_pass"(rx561_pos, "mod_ident:sym<ignorecase>")
    rx561_cur."!cursor_debug"("PASS  ", "mod_ident:sym<ignorecase>", " at pos=", rx561_pos)
    .return (rx561_cur)
  rx561_fail:
.annotate 'line', 3
    (rx561_rep, rx561_pos, $I10, $P10) = rx561_cur."!mark_fail"(0)
    lt rx561_pos, -1, rx561_done
    eq rx561_pos, -1, rx561_fail
    jump $I10
  rx561_done:
    rx561_cur."!cursor_fail"()
    rx561_cur."!cursor_debug"("FAIL  ", "mod_ident:sym<ignorecase>")
    .return (rx561_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident:sym<ignorecase>"  :subid("153_1275811476.7961") :method
.annotate 'line', 3
    new $P563, "ResizablePMCArray"
    push $P563, "i"
    .return ($P563)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ratchet>"  :subid("154_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx569_tgt
    .local int rx569_pos
    .local int rx569_off
    .local int rx569_eos
    .local int rx569_rep
    .local pmc rx569_cur
    (rx569_cur, rx569_pos, rx569_tgt) = self."!cursor_start"()
    rx569_cur."!cursor_debug"("START ", "mod_ident:sym<ratchet>")
    .lex unicode:"$\x{a2}", rx569_cur
    .local pmc match
    .lex "$/", match
    length rx569_eos, rx569_tgt
    gt rx569_pos, rx569_eos, rx569_done
    set rx569_off, 0
    lt rx569_pos, 2, rx569_start
    sub rx569_off, rx569_pos, 1
    substr rx569_tgt, rx569_tgt, rx569_off
  rx569_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan572_done
    goto rxscan572_scan
  rxscan572_loop:
    ($P10) = rx569_cur."from"()
    inc $P10
    set rx569_pos, $P10
    ge rx569_pos, rx569_eos, rxscan572_done
  rxscan572_scan:
    set_addr $I10, rxscan572_loop
    rx569_cur."!mark_push"(0, rx569_pos, $I10)
  rxscan572_done:
.annotate 'line', 183
  # rx subcapture "sym"
    set_addr $I10, rxcap_573_fail
    rx569_cur."!mark_push"(0, rx569_pos, $I10)
  # rx literal  "r"
    add $I11, rx569_pos, 1
    gt $I11, rx569_eos, rx569_fail
    sub $I11, rx569_pos, rx569_off
    substr $S10, rx569_tgt, $I11, 1
    ne $S10, "r", rx569_fail
    add rx569_pos, 1
    set_addr $I10, rxcap_573_fail
    ($I12, $I11) = rx569_cur."!mark_peek"($I10)
    rx569_cur."!cursor_pos"($I11)
    ($P10) = rx569_cur."!cursor_start"()
    $P10."!cursor_pass"(rx569_pos, "")
    rx569_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_573_done
  rxcap_573_fail:
    goto rx569_fail
  rxcap_573_done:
  # rx rxquantr574 ** 0..1
    set_addr $I575, rxquantr574_done
    rx569_cur."!mark_push"(0, rx569_pos, $I575)
  rxquantr574_loop:
  # rx literal  "atchet"
    add $I11, rx569_pos, 6
    gt $I11, rx569_eos, rx569_fail
    sub $I11, rx569_pos, rx569_off
    substr $S10, rx569_tgt, $I11, 6
    ne $S10, "atchet", rx569_fail
    add rx569_pos, 6
    (rx569_rep) = rx569_cur."!mark_commit"($I575)
  rxquantr574_done:
  # rx pass
    rx569_cur."!cursor_pass"(rx569_pos, "mod_ident:sym<ratchet>")
    rx569_cur."!cursor_debug"("PASS  ", "mod_ident:sym<ratchet>", " at pos=", rx569_pos)
    .return (rx569_cur)
  rx569_fail:
.annotate 'line', 3
    (rx569_rep, rx569_pos, $I10, $P10) = rx569_cur."!mark_fail"(0)
    lt rx569_pos, -1, rx569_done
    eq rx569_pos, -1, rx569_fail
    jump $I10
  rx569_done:
    rx569_cur."!cursor_fail"()
    rx569_cur."!cursor_debug"("FAIL  ", "mod_ident:sym<ratchet>")
    .return (rx569_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident:sym<ratchet>"  :subid("155_1275811476.7961") :method
.annotate 'line', 3
    new $P571, "ResizablePMCArray"
    push $P571, "r"
    .return ($P571)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<sigspace>"  :subid("156_1275811476.7961") :method :outer("11_1275811476.7961")
.annotate 'line', 3
    .local string rx577_tgt
    .local int rx577_pos
    .local int rx577_off
    .local int rx577_eos
    .local int rx577_rep
    .local pmc rx577_cur
    (rx577_cur, rx577_pos, rx577_tgt) = self."!cursor_start"()
    rx577_cur."!cursor_debug"("START ", "mod_ident:sym<sigspace>")
    .lex unicode:"$\x{a2}", rx577_cur
    .local pmc match
    .lex "$/", match
    length rx577_eos, rx577_tgt
    gt rx577_pos, rx577_eos, rx577_done
    set rx577_off, 0
    lt rx577_pos, 2, rx577_start
    sub rx577_off, rx577_pos, 1
    substr rx577_tgt, rx577_tgt, rx577_off
  rx577_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan580_done
    goto rxscan580_scan
  rxscan580_loop:
    ($P10) = rx577_cur."from"()
    inc $P10
    set rx577_pos, $P10
    ge rx577_pos, rx577_eos, rxscan580_done
  rxscan580_scan:
    set_addr $I10, rxscan580_loop
    rx577_cur."!mark_push"(0, rx577_pos, $I10)
  rxscan580_done:
.annotate 'line', 184
  # rx subcapture "sym"
    set_addr $I10, rxcap_581_fail
    rx577_cur."!mark_push"(0, rx577_pos, $I10)
  # rx literal  "s"
    add $I11, rx577_pos, 1
    gt $I11, rx577_eos, rx577_fail
    sub $I11, rx577_pos, rx577_off
    substr $S10, rx577_tgt, $I11, 1
    ne $S10, "s", rx577_fail
    add rx577_pos, 1
    set_addr $I10, rxcap_581_fail
    ($I12, $I11) = rx577_cur."!mark_peek"($I10)
    rx577_cur."!cursor_pos"($I11)
    ($P10) = rx577_cur."!cursor_start"()
    $P10."!cursor_pass"(rx577_pos, "")
    rx577_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_581_done
  rxcap_581_fail:
    goto rx577_fail
  rxcap_581_done:
  # rx rxquantr582 ** 0..1
    set_addr $I583, rxquantr582_done
    rx577_cur."!mark_push"(0, rx577_pos, $I583)
  rxquantr582_loop:
  # rx literal  "igspace"
    add $I11, rx577_pos, 7
    gt $I11, rx577_eos, rx577_fail
    sub $I11, rx577_pos, rx577_off
    substr $S10, rx577_tgt, $I11, 7
    ne $S10, "igspace", rx577_fail
    add rx577_pos, 7
    (rx577_rep) = rx577_cur."!mark_commit"($I583)
  rxquantr582_done:
  # rx pass
    rx577_cur."!cursor_pass"(rx577_pos, "mod_ident:sym<sigspace>")
    rx577_cur."!cursor_debug"("PASS  ", "mod_ident:sym<sigspace>", " at pos=", rx577_pos)
    .return (rx577_cur)
  rx577_fail:
.annotate 'line', 3
    (rx577_rep, rx577_pos, $I10, $P10) = rx577_cur."!mark_fail"(0)
    lt rx577_pos, -1, rx577_done
    eq rx577_pos, -1, rx577_fail
    jump $I10
  rx577_done:
    rx577_cur."!cursor_fail"()
    rx577_cur."!cursor_debug"("FAIL  ", "mod_ident:sym<sigspace>")
    .return (rx577_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident:sym<sigspace>"  :subid("157_1275811476.7961") :method
.annotate 'line', 3
    new $P579, "ResizablePMCArray"
    push $P579, "s"
    .return ($P579)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block584" :load :anon :subid("158_1275811476.7961")
.annotate 'line', 3
    .const 'Sub' $P586 = "11_1275811476.7961" 
    $P587 = $P586()
    .return ($P587)
.end


.namespace []
.sub "_block589" :load :anon :subid("159_1275811476.7961")
.annotate 'line', 1
    .const 'Sub' $P591 = "10_1275811476.7961" 
    $P592 = $P591()
    .return ($P592)
.end

### .include 'gen/p6regex-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1275811482.3686")
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
    .const 'Sub' $P1601 = "91_1275811482.3686" 
    .return ($P1601)
.end


.namespace []
.sub "" :load :init :subid("post92") :outer("10_1275811482.3686")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1275811482.3686" 
    .local pmc block
    set block, $P12
    $P1604 = get_root_global ["parrot"], "P6metaclass"
    $P1604."new_class"("Regex::P6Regex::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block13"  :subid("11_1275811482.3686") :outer("10_1275811482.3686")
.annotate 'line', 4
    .const 'Sub' $P1561 = "89_1275811482.3686" 
    capture_lex $P1561
    .const 'Sub' $P1492 = "85_1275811482.3686" 
    capture_lex $P1492
    .const 'Sub' $P1424 = "83_1275811482.3686" 
    capture_lex $P1424
    .const 'Sub' $P1351 = "80_1275811482.3686" 
    capture_lex $P1351
    .const 'Sub' $P1337 = "79_1275811482.3686" 
    capture_lex $P1337
    .const 'Sub' $P1313 = "78_1275811482.3686" 
    capture_lex $P1313
    .const 'Sub' $P1295 = "77_1275811482.3686" 
    capture_lex $P1295
    .const 'Sub' $P1281 = "76_1275811482.3686" 
    capture_lex $P1281
    .const 'Sub' $P1268 = "75_1275811482.3686" 
    capture_lex $P1268
    .const 'Sub' $P1237 = "74_1275811482.3686" 
    capture_lex $P1237
    .const 'Sub' $P1206 = "73_1275811482.3686" 
    capture_lex $P1206
    .const 'Sub' $P1190 = "72_1275811482.3686" 
    capture_lex $P1190
    .const 'Sub' $P1174 = "71_1275811482.3686" 
    capture_lex $P1174
    .const 'Sub' $P1158 = "70_1275811482.3686" 
    capture_lex $P1158
    .const 'Sub' $P1142 = "69_1275811482.3686" 
    capture_lex $P1142
    .const 'Sub' $P1126 = "68_1275811482.3686" 
    capture_lex $P1126
    .const 'Sub' $P1110 = "67_1275811482.3686" 
    capture_lex $P1110
    .const 'Sub' $P1094 = "66_1275811482.3686" 
    capture_lex $P1094
    .const 'Sub' $P1070 = "65_1275811482.3686" 
    capture_lex $P1070
    .const 'Sub' $P1055 = "64_1275811482.3686" 
    capture_lex $P1055
    .const 'Sub' $P999 = "63_1275811482.3686" 
    capture_lex $P999
    .const 'Sub' $P978 = "62_1275811482.3686" 
    capture_lex $P978
    .const 'Sub' $P956 = "61_1275811482.3686" 
    capture_lex $P956
    .const 'Sub' $P946 = "60_1275811482.3686" 
    capture_lex $P946
    .const 'Sub' $P936 = "59_1275811482.3686" 
    capture_lex $P936
    .const 'Sub' $P926 = "58_1275811482.3686" 
    capture_lex $P926
    .const 'Sub' $P914 = "57_1275811482.3686" 
    capture_lex $P914
    .const 'Sub' $P902 = "56_1275811482.3686" 
    capture_lex $P902
    .const 'Sub' $P890 = "55_1275811482.3686" 
    capture_lex $P890
    .const 'Sub' $P878 = "54_1275811482.3686" 
    capture_lex $P878
    .const 'Sub' $P866 = "53_1275811482.3686" 
    capture_lex $P866
    .const 'Sub' $P854 = "52_1275811482.3686" 
    capture_lex $P854
    .const 'Sub' $P842 = "51_1275811482.3686" 
    capture_lex $P842
    .const 'Sub' $P830 = "50_1275811482.3686" 
    capture_lex $P830
    .const 'Sub' $P807 = "49_1275811482.3686" 
    capture_lex $P807
    .const 'Sub' $P784 = "48_1275811482.3686" 
    capture_lex $P784
    .const 'Sub' $P766 = "47_1275811482.3686" 
    capture_lex $P766
    .const 'Sub' $P756 = "46_1275811482.3686" 
    capture_lex $P756
    .const 'Sub' $P738 = "45_1275811482.3686" 
    capture_lex $P738
    .const 'Sub' $P665 = "43_1275811482.3686" 
    capture_lex $P665
    .const 'Sub' $P648 = "42_1275811482.3686" 
    capture_lex $P648
    .const 'Sub' $P633 = "41_1275811482.3686" 
    capture_lex $P633
    .const 'Sub' $P618 = "40_1275811482.3686" 
    capture_lex $P618
    .const 'Sub' $P592 = "39_1275811482.3686" 
    capture_lex $P592
    .const 'Sub' $P541 = "37_1275811482.3686" 
    capture_lex $P541
    .const 'Sub' $P473 = "35_1275811482.3686" 
    capture_lex $P473
    .const 'Sub' $P418 = "32_1275811482.3686" 
    capture_lex $P418
    .const 'Sub' $P403 = "31_1275811482.3686" 
    capture_lex $P403
    .const 'Sub' $P377 = "29_1275811482.3686" 
    capture_lex $P377
    .const 'Sub' $P360 = "28_1275811482.3686" 
    capture_lex $P360
    .const 'Sub' $P338 = "27_1275811482.3686" 
    capture_lex $P338
    .const 'Sub' $P305 = "26_1275811482.3686" 
    capture_lex $P305
    .const 'Sub' $P50 = "13_1275811482.3686" 
    capture_lex $P50
    .const 'Sub' $P16 = "12_1275811482.3686" 
    capture_lex $P16
    get_global $P15, "@MODIFIERS"
    unless_null $P15, vivify_94
    $P15 = root_new ['parrot';'ResizablePMCArray']
    set_global "@MODIFIERS", $P15
  vivify_94:
.annotate 'line', 494
    .const 'Sub' $P16 = "12_1275811482.3686" 
    newclosure $P49, $P16
    .lex "buildsub", $P49
.annotate 'line', 511
    .const 'Sub' $P50 = "13_1275811482.3686" 
    newclosure $P304, $P50
    .lex "capnames", $P304
.annotate 'line', 577
    .const 'Sub' $P305 = "26_1275811482.3686" 
    newclosure $P337, $P305
    .lex "backmod", $P337
.annotate 'line', 584
    .const 'Sub' $P338 = "27_1275811482.3686" 
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
    .const 'Sub' $P1595 = "90_1275811482.3686" 
    .return ($P1595)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "" :load :init :subid("post93") :outer("11_1275811482.3686")
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
.include "except_types.pasm"
.sub "buildsub"  :subid("12_1275811482.3686") :outer("11_1275811482.3686")
    .param pmc param_19
    .param pmc param_20 :optional
    .param int has_param_20 :opt_flag
.annotate 'line', 494
    new $P18, 'ExceptionHandler'
    set_addr $P18, control_17
    $P18."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "capnames"  :subid("13_1275811482.3686") :outer("11_1275811482.3686")
    .param pmc param_53
    .param pmc param_54
.annotate 'line', 511
    .const 'Sub' $P279 = "24_1275811482.3686" 
    capture_lex $P279
    .const 'Sub' $P216 = "21_1275811482.3686" 
    capture_lex $P216
    .const 'Sub' $P174 = "19_1275811482.3686" 
    capture_lex $P174
    .const 'Sub' $P132 = "17_1275811482.3686" 
    capture_lex $P132
    .const 'Sub' $P65 = "14_1275811482.3686" 
    capture_lex $P65
    new $P52, 'ExceptionHandler'
    set_addr $P52, control_51
    $P52."handle_types"(.CONTROL_RETURN)
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
    .const 'Sub' $P279 = "24_1275811482.3686" 
    capture_lex $P279
    $P279()
  if_274_end:
    goto if_211_end
  if_211:
.annotate 'line', 549
    .const 'Sub' $P216 = "21_1275811482.3686" 
    capture_lex $P216
    $P216()
  if_211_end:
    goto if_164_end
  if_164:
.annotate 'line', 536
    .const 'Sub' $P174 = "19_1275811482.3686" 
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
    $P162."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P162
  loop161_test:
    unless $P126, loop161_done
    shift $P130, $P126
  loop161_redo:
    .const 'Sub' $P132 = "17_1275811482.3686" 
    capture_lex $P132
    $P132($P130)
  loop161_next:
    goto loop161_test
  loop161_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P163, exception, 'type'
    eq $P163, .CONTROL_LOOP_NEXT, loop161_next
    eq $P163, .CONTROL_LOOP_REDO, loop161_redo
  loop161_done:
    pop_eh 
  for_undef_117:
  if_122_end:
.annotate 'line', 527
    goto if_60_end
  if_60:
.annotate 'line', 514
    .const 'Sub' $P65 = "14_1275811482.3686" 
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
.include "except_types.pasm"
.sub "_block278"  :anon :subid("24_1275811482.3686") :outer("13_1275811482.3686")
.annotate 'line', 566
    .const 'Sub' $P290 = "25_1275811482.3686" 
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
    $P296."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P296
  loop295_test:
    unless $P285, loop295_done
    shift $P288, $P285
  loop295_redo:
    .const 'Sub' $P290 = "25_1275811482.3686" 
    capture_lex $P290
    $P290($P288)
  loop295_next:
    goto loop295_test
  loop295_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P297, exception, 'type'
    eq $P297, .CONTROL_LOOP_NEXT, loop295_next
    eq $P297, .CONTROL_LOOP_REDO, loop295_redo
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
.sub "_block289"  :anon :subid("25_1275811482.3686") :outer("24_1275811482.3686")
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
.include "except_types.pasm"
.sub "_block215"  :anon :subid("21_1275811482.3686") :outer("13_1275811482.3686")
.annotate 'line', 549
    .const 'Sub' $P256 = "23_1275811482.3686" 
    capture_lex $P256
    .const 'Sub' $P228 = "22_1275811482.3686" 
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
    $P245."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P245
  loop244_test:
    unless $P223, loop244_done
    shift $P226, $P223
  loop244_redo:
    .const 'Sub' $P228 = "22_1275811482.3686" 
    capture_lex $P228
    $P228($P226)
  loop244_next:
    goto loop244_test
  loop244_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P246, exception, 'type'
    eq $P246, .CONTROL_LOOP_NEXT, loop244_next
    eq $P246, .CONTROL_LOOP_REDO, loop244_redo
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
    $P270."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P270
  loop269_test:
    unless $P251, loop269_done
    shift $P254, $P251
  loop269_redo:
    .const 'Sub' $P256 = "23_1275811482.3686" 
    capture_lex $P256
    $P256($P254)
  loop269_next:
    goto loop269_test
  loop269_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P271, exception, 'type'
    eq $P271, .CONTROL_LOOP_NEXT, loop269_next
    eq $P271, .CONTROL_LOOP_REDO, loop269_redo
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
.sub "_block227"  :anon :subid("22_1275811482.3686") :outer("21_1275811482.3686")
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
.sub "_block255"  :anon :subid("23_1275811482.3686") :outer("21_1275811482.3686")
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
.include "except_types.pasm"
.sub "_block173"  :anon :subid("19_1275811482.3686") :outer("13_1275811482.3686")
.annotate 'line', 536
    .const 'Sub' $P192 = "20_1275811482.3686" 
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
    $P209."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P209
  loop208_test:
    unless $P187, loop208_done
    shift $P190, $P187
  loop208_redo:
    .const 'Sub' $P192 = "20_1275811482.3686" 
    capture_lex $P192
    $P192($P190)
  loop208_next:
    goto loop208_test
  loop208_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P210, exception, 'type'
    eq $P210, .CONTROL_LOOP_NEXT, loop208_next
    eq $P210, .CONTROL_LOOP_REDO, loop208_redo
  loop208_done:
    pop_eh 
  for_undef_115:
.annotate 'line', 536
    .return ($P187)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block191"  :anon :subid("20_1275811482.3686") :outer("19_1275811482.3686")
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
.include "except_types.pasm"
.sub "_block131"  :anon :subid("17_1275811482.3686") :outer("13_1275811482.3686")
    .param pmc param_134
.annotate 'line', 528
    .const 'Sub' $P143 = "18_1275811482.3686" 
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
    $P157."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P157
  loop156_test:
    unless $P138, loop156_done
    shift $P141, $P138
  loop156_redo:
    .const 'Sub' $P143 = "18_1275811482.3686" 
    capture_lex $P143
    $P143($P141)
  loop156_next:
    goto loop156_test
  loop156_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P158, exception, 'type'
    eq $P158, .CONTROL_LOOP_NEXT, loop156_next
    eq $P158, .CONTROL_LOOP_REDO, loop156_redo
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
.sub "_block142"  :anon :subid("18_1275811482.3686") :outer("17_1275811482.3686")
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
.include "except_types.pasm"
.sub "_block64"  :anon :subid("14_1275811482.3686") :outer("13_1275811482.3686")
.annotate 'line', 514
    .const 'Sub' $P74 = "15_1275811482.3686" 
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
    $P119."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P119
  loop118_test:
    unless $P68, loop118_done
    shift $P72, $P68
  loop118_redo:
    .const 'Sub' $P74 = "15_1275811482.3686" 
    capture_lex $P74
    $P74($P72)
  loop118_next:
    goto loop118_test
  loop118_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P120, exception, 'type'
    eq $P120, .CONTROL_LOOP_NEXT, loop118_next
    eq $P120, .CONTROL_LOOP_REDO, loop118_redo
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
.include "except_types.pasm"
.sub "_block73"  :anon :subid("15_1275811482.3686") :outer("14_1275811482.3686")
    .param pmc param_76
.annotate 'line', 516
    .const 'Sub' $P85 = "16_1275811482.3686" 
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
    $P106."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P106
  loop105_test:
    unless $P80, loop105_done
    shift $P83, $P80
  loop105_redo:
    .const 'Sub' $P85 = "16_1275811482.3686" 
    capture_lex $P85
    $P85($P83)
  loop105_next:
    goto loop105_test
  loop105_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, 'type'
    eq $P107, .CONTROL_LOOP_NEXT, loop105_next
    eq $P107, .CONTROL_LOOP_REDO, loop105_redo
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
.sub "_block84"  :anon :subid("16_1275811482.3686") :outer("15_1275811482.3686")
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
.include "except_types.pasm"
.sub "backmod"  :subid("26_1275811482.3686") :outer("11_1275811482.3686")
    .param pmc param_308
    .param pmc param_309
.annotate 'line', 577
    new $P307, 'ExceptionHandler'
    set_addr $P307, control_306
    $P307."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "subrule_alias"  :subid("27_1275811482.3686") :outer("11_1275811482.3686")
    .param pmc param_341
    .param pmc param_342
.annotate 'line', 584
    new $P340, 'ExceptionHandler'
    set_addr $P340, control_339
    $P340."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "arg"  :subid("28_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_363
.annotate 'line', 14
    new $P362, 'ExceptionHandler'
    set_addr $P362, control_361
    $P362."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "arglist"  :subid("29_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_380
.annotate 'line', 18
    .const 'Sub' $P390 = "30_1275811482.3686" 
    capture_lex $P390
    new $P379, 'ExceptionHandler'
    set_addr $P379, control_378
    $P379."handle_types"(.CONTROL_RETURN)
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
    $P397."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P397
  loop396_test:
    unless $P384, loop396_done
    shift $P388, $P384
  loop396_redo:
    .const 'Sub' $P390 = "30_1275811482.3686" 
    capture_lex $P390
    $P390($P388)
  loop396_next:
    goto loop396_test
  loop396_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P398, exception, 'type'
    eq $P398, .CONTROL_LOOP_NEXT, loop396_next
    eq $P398, .CONTROL_LOOP_REDO, loop396_redo
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
.sub "_block389"  :anon :subid("30_1275811482.3686") :outer("29_1275811482.3686")
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
.include "except_types.pasm"
.sub "TOP"  :subid("31_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_406
.annotate 'line', 24
    new $P405, 'ExceptionHandler'
    set_addr $P405, control_404
    $P405."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "nibbler"  :subid("32_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_421
    .param pmc param_422 :optional
    .param int has_param_422 :opt_flag
.annotate 'line', 30
    .const 'Sub' $P456 = "34_1275811482.3686" 
    capture_lex $P456
    .const 'Sub' $P430 = "33_1275811482.3686" 
    capture_lex $P430
    new $P420, 'ExceptionHandler'
    set_addr $P420, control_419
    $P420."handle_types"(.CONTROL_RETURN)
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
    .const 'Sub' $P430 = "33_1275811482.3686" 
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
    $P463."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P463
  loop462_test:
    unless $P450, loop462_done
    shift $P454, $P450
  loop462_redo:
    .const 'Sub' $P456 = "34_1275811482.3686" 
    capture_lex $P456
    $P456($P454)
  loop462_next:
    goto loop462_test
  loop462_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P464, exception, 'type'
    eq $P464, .CONTROL_LOOP_NEXT, loop462_next
    eq $P464, .CONTROL_LOOP_REDO, loop462_redo
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
.include "except_types.pasm"
.sub "_block429"  :anon :subid("33_1275811482.3686") :outer("32_1275811482.3686")
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
    set $P438['type'], .CONTROL_RETURN
    new $P439, "Integer"
    assign $P439, 1
    setattribute $P438, 'payload', $P439
    throw $P438
.annotate 'line', 31
    .return ()
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block455"  :anon :subid("34_1275811482.3686") :outer("32_1275811482.3686")
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
.include "except_types.pasm"
.sub "termish"  :subid("35_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_476
.annotate 'line', 55
    .const 'Sub' $P489 = "36_1275811482.3686" 
    capture_lex $P489
    new $P475, 'ExceptionHandler'
    set_addr $P475, control_474
    $P475."handle_types"(.CONTROL_RETURN)
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
    $P535."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P535
  loop534_test:
    unless $P483, loop534_done
    shift $P487, $P483
  loop534_redo:
    .const 'Sub' $P489 = "36_1275811482.3686" 
    capture_lex $P489
    $P489($P487)
  loop534_next:
    goto loop534_test
  loop534_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P536, exception, 'type'
    eq $P536, .CONTROL_LOOP_NEXT, loop534_next
    eq $P536, .CONTROL_LOOP_REDO, loop534_redo
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
.sub "_block488"  :anon :subid("36_1275811482.3686") :outer("35_1275811482.3686")
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
.include "except_types.pasm"
.sub "quantified_atom"  :subid("37_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_544
.annotate 'line', 76
    .const 'Sub' $P553 = "38_1275811482.3686" 
    capture_lex $P553
    new $P543, 'ExceptionHandler'
    set_addr $P543, control_542
    $P543."handle_types"(.CONTROL_RETURN)
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
    .const 'Sub' $P553 = "38_1275811482.3686" 
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
.sub "_block552"  :anon :subid("38_1275811482.3686") :outer("37_1275811482.3686")
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
.include "except_types.pasm"
.sub "atom"  :subid("39_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_595
.annotate 'line', 91
    new $P594, 'ExceptionHandler'
    set_addr $P594, control_593
    $P594."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "quantifier:sym<*>"  :subid("40_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_621
.annotate 'line', 101
    new $P620, 'ExceptionHandler'
    set_addr $P620, control_619
    $P620."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "quantifier:sym<+>"  :subid("41_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_636
.annotate 'line', 106
    new $P635, 'ExceptionHandler'
    set_addr $P635, control_634
    $P635."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "quantifier:sym<?>"  :subid("42_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_651
.annotate 'line', 111
    new $P650, 'ExceptionHandler'
    set_addr $P650, control_649
    $P650."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "quantifier:sym<**>"  :subid("43_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_668
.annotate 'line', 117
    .const 'Sub' $P683 = "44_1275811482.3686" 
    capture_lex $P683
    new $P667, 'ExceptionHandler'
    set_addr $P667, control_666
    $P667."handle_types"(.CONTROL_RETURN)
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
    .const 'Sub' $P683 = "44_1275811482.3686" 
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
.sub "_block682"  :anon :subid("44_1275811482.3686") :outer("43_1275811482.3686")
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
.include "except_types.pasm"
.sub "metachar:sym<ws>"  :subid("45_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_741
.annotate 'line', 146
    new $P740, 'ExceptionHandler'
    set_addr $P740, control_739
    $P740."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "metachar:sym<[ ]>"  :subid("46_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_759
.annotate 'line', 155
    new $P758, 'ExceptionHandler'
    set_addr $P758, control_757
    $P758."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "metachar:sym<( )>"  :subid("47_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_769
.annotate 'line', 159
    new $P768, 'ExceptionHandler'
    set_addr $P768, control_767
    $P768."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "metachar:sym<'>"  :subid("48_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_787
.annotate 'line', 166
    new $P786, 'ExceptionHandler'
    set_addr $P786, control_785
    $P786."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "metachar:sym<\">"  :subid("49_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_810
.annotate 'line', 173
    new $P809, 'ExceptionHandler'
    set_addr $P809, control_808
    $P809."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "metachar:sym<.>"  :subid("50_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_833
.annotate 'line', 180
    new $P832, 'ExceptionHandler'
    set_addr $P832, control_831
    $P832."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "metachar:sym<^>"  :subid("51_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_845
.annotate 'line', 185
    new $P844, 'ExceptionHandler'
    set_addr $P844, control_843
    $P844."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "metachar:sym<^^>"  :subid("52_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_857
.annotate 'line', 190
    new $P856, 'ExceptionHandler'
    set_addr $P856, control_855
    $P856."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "metachar:sym<$>"  :subid("53_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_869
.annotate 'line', 195
    new $P868, 'ExceptionHandler'
    set_addr $P868, control_867
    $P868."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "metachar:sym<$$>"  :subid("54_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_881
.annotate 'line', 200
    new $P880, 'ExceptionHandler'
    set_addr $P880, control_879
    $P880."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "metachar:sym<:::>"  :subid("55_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_893
.annotate 'line', 205
    new $P892, 'ExceptionHandler'
    set_addr $P892, control_891
    $P892."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "metachar:sym<lwb>"  :subid("56_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_905
.annotate 'line', 210
    new $P904, 'ExceptionHandler'
    set_addr $P904, control_903
    $P904."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "metachar:sym<rwb>"  :subid("57_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_917
.annotate 'line', 215
    new $P916, 'ExceptionHandler'
    set_addr $P916, control_915
    $P916."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "metachar:sym<bs>"  :subid("58_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_929
.annotate 'line', 220
    new $P928, 'ExceptionHandler'
    set_addr $P928, control_927
    $P928."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "metachar:sym<mod>"  :subid("59_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_939
.annotate 'line', 224
    new $P938, 'ExceptionHandler'
    set_addr $P938, control_937
    $P938."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "metachar:sym<assert>"  :subid("60_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_949
.annotate 'line', 228
    new $P948, 'ExceptionHandler'
    set_addr $P948, control_947
    $P948."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "metachar:sym<~>"  :subid("61_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_959
.annotate 'line', 232
    new $P958, 'ExceptionHandler'
    set_addr $P958, control_957
    $P958."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "metachar:sym<{*}>"  :subid("62_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_981
.annotate 'line', 245
    new $P980, 'ExceptionHandler'
    set_addr $P980, control_979
    $P980."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "metachar:sym<var>"  :subid("63_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_1002
.annotate 'line', 252
    new $P1001, 'ExceptionHandler'
    set_addr $P1001, control_1000
    $P1001."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "metachar:sym<PIR>"  :subid("64_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_1058
.annotate 'line', 272
    new $P1057, 'ExceptionHandler'
    set_addr $P1057, control_1056
    $P1057."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "backslash:sym<w>"  :subid("65_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_1073
.annotate 'line', 280
    new $P1072, 'ExceptionHandler'
    set_addr $P1072, control_1071
    $P1072."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "backslash:sym<b>"  :subid("66_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_1097
.annotate 'line', 286
    new $P1096, 'ExceptionHandler'
    set_addr $P1096, control_1095
    $P1096."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "backslash:sym<e>"  :subid("67_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_1113
.annotate 'line', 292
    new $P1112, 'ExceptionHandler'
    set_addr $P1112, control_1111
    $P1112."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "backslash:sym<f>"  :subid("68_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_1129
.annotate 'line', 298
    new $P1128, 'ExceptionHandler'
    set_addr $P1128, control_1127
    $P1128."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "backslash:sym<h>"  :subid("69_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_1145
.annotate 'line', 304
    new $P1144, 'ExceptionHandler'
    set_addr $P1144, control_1143
    $P1144."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "backslash:sym<r>"  :subid("70_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_1161
.annotate 'line', 310
    new $P1160, 'ExceptionHandler'
    set_addr $P1160, control_1159
    $P1160."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "backslash:sym<t>"  :subid("71_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_1177
.annotate 'line', 316
    new $P1176, 'ExceptionHandler'
    set_addr $P1176, control_1175
    $P1176."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "backslash:sym<v>"  :subid("72_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_1193
.annotate 'line', 322
    new $P1192, 'ExceptionHandler'
    set_addr $P1192, control_1191
    $P1192."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "backslash:sym<o>"  :subid("73_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_1209
.annotate 'line', 329
    new $P1208, 'ExceptionHandler'
    set_addr $P1208, control_1207
    $P1208."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "backslash:sym<x>"  :subid("74_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_1240
.annotate 'line', 338
    new $P1239, 'ExceptionHandler'
    set_addr $P1239, control_1238
    $P1239."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "backslash:sym<c>"  :subid("75_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_1271
.annotate 'line', 347
    new $P1270, 'ExceptionHandler'
    set_addr $P1270, control_1269
    $P1270."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "backslash:sym<misc>"  :subid("76_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_1284
.annotate 'line', 351
    new $P1283, 'ExceptionHandler'
    set_addr $P1283, control_1282
    $P1283."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "assertion:sym<?>"  :subid("77_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_1298
.annotate 'line', 357
    new $P1297, 'ExceptionHandler'
    set_addr $P1297, control_1296
    $P1297."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "assertion:sym<!>"  :subid("78_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_1316
.annotate 'line', 367
    new $P1315, 'ExceptionHandler'
    set_addr $P1315, control_1314
    $P1315."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "assertion:sym<method>"  :subid("79_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_1340
.annotate 'line', 380
    new $P1339, 'ExceptionHandler'
    set_addr $P1339, control_1338
    $P1339."handle_types"(.CONTROL_RETURN)
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
.include "except_types.pasm"
.sub "assertion:sym<name>"  :subid("80_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_1354
.annotate 'line', 387
    .const 'Sub' $P1412 = "82_1275811482.3686" 
    capture_lex $P1412
    .const 'Sub' $P1376 = "81_1275811482.3686" 
    capture_lex $P1376
    new $P1353, 'ExceptionHandler'
    set_addr $P1353, control_1352
    $P1353."handle_types"(.CONTROL_RETURN)
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
    $P1418."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1418
  loop1417_test:
    unless $P1403, loop1417_done
    shift $P1410, $P1403
  loop1417_redo:
    .const 'Sub' $P1412 = "82_1275811482.3686" 
    capture_lex $P1412
    $P1412($P1410)
  loop1417_next:
    goto loop1417_test
  loop1417_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1419, exception, 'type'
    eq $P1419, .CONTROL_LOOP_NEXT, loop1417_next
    eq $P1419, .CONTROL_LOOP_REDO, loop1417_redo
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
    .const 'Sub' $P1376 = "81_1275811482.3686" 
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
.sub "_block1411"  :anon :subid("82_1275811482.3686") :outer("80_1275811482.3686")
    .param pmc param_1413
.annotate 'line', 416
    .lex "$_", param_1413
    find_lex $P1414, "$past"
    find_lex $P1415, "$_"
    $P1416 = $P1414."push"($P1415)
    .return ($P1416)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1375"  :anon :subid("81_1275811482.3686") :outer("80_1275811482.3686")
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
.include "except_types.pasm"
.sub "assertion:sym<[>"  :subid("83_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_1427
.annotate 'line', 422
    .const 'Sub' $P1462 = "84_1275811482.3686" 
    capture_lex $P1462
    new $P1426, 'ExceptionHandler'
    set_addr $P1426, control_1425
    $P1426."handle_types"(.CONTROL_RETURN)
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
    $P1486."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1486
  loop1485_test:
    find_lex $P1456, "$i"
    set $N1457, $P1456
    find_lex $P1458, "$n"
    set $N1459, $P1458
    islt $I1460, $N1457, $N1459
    unless $I1460, loop1485_done
  loop1485_redo:
    .const 'Sub' $P1462 = "84_1275811482.3686" 
    capture_lex $P1462
    $P1462()
  loop1485_next:
    goto loop1485_test
  loop1485_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1487, exception, 'type'
    eq $P1487, .CONTROL_LOOP_NEXT, loop1485_next
    eq $P1487, .CONTROL_LOOP_REDO, loop1485_redo
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
.sub "_block1461"  :anon :subid("84_1275811482.3686") :outer("83_1275811482.3686")
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
.include "except_types.pasm"
.sub "cclass_elem"  :subid("85_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_1495
.annotate 'line', 449
    .const 'Sub' $P1520 = "87_1275811482.3686" 
    capture_lex $P1520
    .const 'Sub' $P1504 = "86_1275811482.3686" 
    capture_lex $P1504
    new $P1494, 'ExceptionHandler'
    set_addr $P1494, control_1493
    $P1494."handle_types"(.CONTROL_RETURN)
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
    $P1546."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1546
  loop1545_test:
    unless $P1514, loop1545_done
    shift $P1518, $P1514
  loop1545_redo:
    .const 'Sub' $P1520 = "87_1275811482.3686" 
    capture_lex $P1520
    $P1520($P1518)
  loop1545_next:
    goto loop1545_test
  loop1545_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1547, exception, 'type'
    eq $P1547, .CONTROL_LOOP_NEXT, loop1545_next
    eq $P1547, .CONTROL_LOOP_REDO, loop1545_redo
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
    .const 'Sub' $P1504 = "86_1275811482.3686" 
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
.sub "_block1519"  :anon :subid("87_1275811482.3686") :outer("85_1275811482.3686")
    .param pmc param_1521
.annotate 'line', 456
    .const 'Sub' $P1527 = "88_1275811482.3686" 
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
    .const 'Sub' $P1527 = "88_1275811482.3686" 
    capture_lex $P1527
    $P1540 = $P1527()
    set $P1522, $P1540
  if_1523_end:
.annotate 'line', 456
    .return ($P1522)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1526"  :anon :subid("88_1275811482.3686") :outer("87_1275811482.3686")
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
.sub "_block1503"  :anon :subid("86_1275811482.3686") :outer("85_1275811482.3686")
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
.include "except_types.pasm"
.sub "mod_internal"  :subid("89_1275811482.3686") :method :outer("11_1275811482.3686")
    .param pmc param_1564
.annotate 'line', 487
    new $P1563, 'ExceptionHandler'
    set_addr $P1563, control_1562
    $P1563."handle_types"(.CONTROL_RETURN)
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
.sub "_block1594" :load :anon :subid("90_1275811482.3686")
.annotate 'line', 4
    .const 'Sub' $P1596 = "11_1275811482.3686" 
    $P1597 = $P1596()
    .return ($P1597)
.end


.namespace []
.sub "_block1600" :load :anon :subid("91_1275811482.3686")
.annotate 'line', 1
    .const 'Sub' $P1602 = "10_1275811482.3686" 
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
