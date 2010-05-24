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
.sub "_block11"  :anon :subid("10_1274564774.16047")
.annotate 'line', 0
    get_hll_global $P14, ["Regex";"P6Regex";"Grammar"], "_block13" 
    capture_lex $P14
.annotate 'line', 3
    get_hll_global $P14, ["Regex";"P6Regex";"Grammar"], "_block13" 
    capture_lex $P14
    $P583 = $P14()
.annotate 'line', 1
    .return ($P583)
    .const 'Sub' $P585 = "159_1274564774.16047" 
    .return ($P585)
.end


.namespace []
.sub "" :load :init :subid("post160") :outer("10_1274564774.16047")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1274564774.16047" 
    .local pmc block
    set block, $P12
    $P588 = get_root_global ["parrot"], "P6metaclass"
    $P588."new_class"("Regex::P6Regex::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block13"  :subid("11_1274564774.16047") :outer("10_1274564774.16047")
.annotate 'line', 3
    .const 'Sub' $P571 = "156_1274564774.16047" 
    capture_lex $P571
    .const 'Sub' $P563 = "154_1274564774.16047" 
    capture_lex $P563
    .const 'Sub' $P555 = "152_1274564774.16047" 
    capture_lex $P555
    .const 'Sub' $P534 = "147_1274564774.16047" 
    capture_lex $P534
    .const 'Sub' $P499 = "141_1274564774.16047" 
    capture_lex $P499
    .const 'Sub' $P487 = "138_1274564774.16047" 
    capture_lex $P487
    .const 'Sub' $P474 = "135_1274564774.16047" 
    capture_lex $P474
    .const 'Sub' $P468 = "133_1274564774.16047" 
    capture_lex $P468
    .const 'Sub' $P457 = "130_1274564774.16047" 
    capture_lex $P457
    .const 'Sub' $P446 = "127_1274564774.16047" 
    capture_lex $P446
    .const 'Sub' $P437 = "123_1274564774.16047" 
    capture_lex $P437
    .const 'Sub' $P431 = "121_1274564774.16047" 
    capture_lex $P431
    .const 'Sub' $P425 = "119_1274564774.16047" 
    capture_lex $P425
    .const 'Sub' $P419 = "117_1274564774.16047" 
    capture_lex $P419
    .const 'Sub' $P413 = "115_1274564774.16047" 
    capture_lex $P413
    .const 'Sub' $P405 = "113_1274564774.16047" 
    capture_lex $P405
    .const 'Sub' $P394 = "111_1274564774.16047" 
    capture_lex $P394
    .const 'Sub' $P383 = "109_1274564774.16047" 
    capture_lex $P383
    .const 'Sub' $P377 = "107_1274564774.16047" 
    capture_lex $P377
    .const 'Sub' $P371 = "105_1274564774.16047" 
    capture_lex $P371
    .const 'Sub' $P365 = "103_1274564774.16047" 
    capture_lex $P365
    .const 'Sub' $P359 = "101_1274564774.16047" 
    capture_lex $P359
    .const 'Sub' $P353 = "99_1274564774.16047" 
    capture_lex $P353
    .const 'Sub' $P347 = "97_1274564774.16047" 
    capture_lex $P347
    .const 'Sub' $P341 = "95_1274564774.16047" 
    capture_lex $P341
    .const 'Sub' $P335 = "93_1274564774.16047" 
    capture_lex $P335
    .const 'Sub' $P323 = "89_1274564774.16047" 
    capture_lex $P323
    .const 'Sub' $P311 = "87_1274564774.16047" 
    capture_lex $P311
    .const 'Sub' $P304 = "85_1274564774.16047" 
    capture_lex $P304
    .const 'Sub' $P287 = "83_1274564774.16047" 
    capture_lex $P287
    .const 'Sub' $P280 = "81_1274564774.16047" 
    capture_lex $P280
    .const 'Sub' $P274 = "79_1274564774.16047" 
    capture_lex $P274
    .const 'Sub' $P268 = "77_1274564774.16047" 
    capture_lex $P268
    .const 'Sub' $P261 = "75_1274564774.16047" 
    capture_lex $P261
    .const 'Sub' $P254 = "73_1274564774.16047" 
    capture_lex $P254
    .const 'Sub' $P247 = "71_1274564774.16047" 
    capture_lex $P247
    .const 'Sub' $P240 = "69_1274564774.16047" 
    capture_lex $P240
    .const 'Sub' $P234 = "67_1274564774.16047" 
    capture_lex $P234
    .const 'Sub' $P228 = "65_1274564774.16047" 
    capture_lex $P228
    .const 'Sub' $P222 = "63_1274564774.16047" 
    capture_lex $P222
    .const 'Sub' $P216 = "61_1274564774.16047" 
    capture_lex $P216
    .const 'Sub' $P210 = "59_1274564774.16047" 
    capture_lex $P210
    .const 'Sub' $P205 = "57_1274564774.16047" 
    capture_lex $P205
    .const 'Sub' $P200 = "55_1274564774.16047" 
    capture_lex $P200
    .const 'Sub' $P194 = "53_1274564774.16047" 
    capture_lex $P194
    .const 'Sub' $P188 = "51_1274564774.16047" 
    capture_lex $P188
    .const 'Sub' $P182 = "49_1274564774.16047" 
    capture_lex $P182
    .const 'Sub' $P166 = "44_1274564774.16047" 
    capture_lex $P166
    .const 'Sub' $P154 = "42_1274564774.16047" 
    capture_lex $P154
    .const 'Sub' $P147 = "40_1274564774.16047" 
    capture_lex $P147
    .const 'Sub' $P140 = "38_1274564774.16047" 
    capture_lex $P140
    .const 'Sub' $P133 = "36_1274564774.16047" 
    capture_lex $P133
    .const 'Sub' $P114 = "31_1274564774.16047" 
    capture_lex $P114
    .const 'Sub' $P101 = "28_1274564774.16047" 
    capture_lex $P101
    .const 'Sub' $P94 = "26_1274564774.16047" 
    capture_lex $P94
    .const 'Sub' $P82 = "24_1274564774.16047" 
    capture_lex $P82
    .const 'Sub' $P75 = "22_1274564774.16047" 
    capture_lex $P75
    .const 'Sub' $P63 = "20_1274564774.16047" 
    capture_lex $P63
    .const 'Sub' $P56 = "18_1274564774.16047" 
    capture_lex $P56
    .const 'Sub' $P46 = "15_1274564774.16047" 
    capture_lex $P46
    .const 'Sub' $P38 = "13_1274564774.16047" 
    capture_lex $P38
    .const 'Sub' $P15 = "12_1274564774.16047" 
    capture_lex $P15
    .const 'Sub' $P571 = "156_1274564774.16047" 
    capture_lex $P571
    .return ($P571)
    .const 'Sub' $P580 = "158_1274564774.16047" 
    .return ($P580)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "obs"  :subid("12_1274564774.16047") :method :outer("11_1274564774.16047")
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
.sub "ws"  :subid("13_1274564774.16047") :method :outer("11_1274564774.16047")
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
.sub "!PREFIX__ws"  :subid("14_1274564774.16047") :method
.annotate 'line', 3
    new $P41, "ResizablePMCArray"
    push $P41, ""
    .return ($P41)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "normspace"  :subid("15_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .const 'Sub' $P52 = "17_1274564774.16047" 
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
    .const 'Sub' $P52 = "17_1274564774.16047" 
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
.sub "!PREFIX__normspace"  :subid("16_1274564774.16047") :method
.annotate 'line', 3
    new $P49, "ResizablePMCArray"
    push $P49, ""
    .return ($P49)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block51"  :anon :subid("17_1274564774.16047") :method :outer("15_1274564774.16047")
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
.sub "arg"  :subid("18_1274564774.16047") :method :outer("11_1274564774.16047")
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
.sub "!PREFIX__arg"  :subid("19_1274564774.16047") :method
.annotate 'line', 3
    new $P59, "ResizablePMCArray"
    push $P59, ""
    push $P59, "\""
    push $P59, "'"
    .return ($P59)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "arglist"  :subid("20_1274564774.16047") :method :outer("11_1274564774.16047")
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
.sub "!PREFIX__arglist"  :subid("21_1274564774.16047") :method
.annotate 'line', 3
    new $P66, "ResizablePMCArray"
    push $P66, ""
    .return ($P66)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "TOP"  :subid("22_1274564774.16047") :method :outer("11_1274564774.16047")
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
.sub "!PREFIX__TOP"  :subid("23_1274564774.16047") :method
.annotate 'line', 3
    $P78 = self."!PREFIX__!subrule"("nibbler", "")
    new $P79, "ResizablePMCArray"
    push $P79, $P78
    .return ($P79)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "nibbler"  :subid("24_1274564774.16047") :method :outer("11_1274564774.16047")
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
.sub "!PREFIX__nibbler"  :subid("25_1274564774.16047") :method
.annotate 'line', 3
    new $P85, "ResizablePMCArray"
    push $P85, ""
    .return ($P85)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "termish"  :subid("26_1274564774.16047") :method :outer("11_1274564774.16047")
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
.sub "!PREFIX__termish"  :subid("27_1274564774.16047") :method
.annotate 'line', 3
    new $P97, "ResizablePMCArray"
    push $P97, ""
    .return ($P97)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantified_atom"  :subid("28_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .const 'Sub' $P110 = "30_1274564774.16047" 
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
    .const 'Sub' $P110 = "30_1274564774.16047" 
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
.sub "!PREFIX__quantified_atom"  :subid("29_1274564774.16047") :method
.annotate 'line', 3
    $P104 = self."!PREFIX__!subrule"("atom", "")
    new $P105, "ResizablePMCArray"
    push $P105, $P104
    .return ($P105)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block109"  :anon :subid("30_1274564774.16047") :method :outer("28_1274564774.16047")
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
.sub "atom"  :subid("31_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .const 'Sub' $P125 = "33_1274564774.16047" 
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
    .const 'Sub' $P125 = "33_1274564774.16047" 
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
.sub "!PREFIX__atom"  :subid("32_1274564774.16047") :method
.annotate 'line', 3
    $P117 = self."!PREFIX__!subrule"("metachar", "")
    new $P118, "ResizablePMCArray"
    push $P118, $P117
    push $P118, ""
    .return ($P118)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block124"  :anon :subid("33_1274564774.16047") :method :outer("31_1274564774.16047")
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
.sub "quantifier"  :subid("34_1274564774.16047") :method
.annotate 'line', 52
    $P130 = self."!protoregex"("quantifier")
    .return ($P130)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier"  :subid("35_1274564774.16047") :method
.annotate 'line', 52
    $P132 = self."!PREFIX__!protoregex"("quantifier")
    .return ($P132)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<*>"  :subid("36_1274564774.16047") :method :outer("11_1274564774.16047")
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
.sub "!PREFIX__quantifier:sym<*>"  :subid("37_1274564774.16047") :method
.annotate 'line', 3
    $P136 = self."!PREFIX__!subrule"("backmod", "*")
    new $P137, "ResizablePMCArray"
    push $P137, $P136
    .return ($P137)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<+>"  :subid("38_1274564774.16047") :method :outer("11_1274564774.16047")
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
.sub "!PREFIX__quantifier:sym<+>"  :subid("39_1274564774.16047") :method
.annotate 'line', 3
    $P143 = self."!PREFIX__!subrule"("backmod", "+")
    new $P144, "ResizablePMCArray"
    push $P144, $P143
    .return ($P144)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<?>"  :subid("40_1274564774.16047") :method :outer("11_1274564774.16047")
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
.sub "!PREFIX__quantifier:sym<?>"  :subid("41_1274564774.16047") :method
.annotate 'line', 3
    $P150 = self."!PREFIX__!subrule"("backmod", "?")
    new $P151, "ResizablePMCArray"
    push $P151, $P150
    .return ($P151)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<**>"  :subid("42_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx155_tgt
    .local int rx155_pos
    .local int rx155_off
    .local int rx155_eos
    .local int rx155_rep
    .local pmc rx155_cur
    (rx155_cur, rx155_pos, rx155_tgt) = self."!cursor_start"()
    rx155_cur."!cursor_debug"("START ", "quantifier:sym<**>")
    rx155_cur."!cursor_caparray"("max")
    .lex unicode:"$\x{a2}", rx155_cur
    .local pmc match
    .lex "$/", match
    length rx155_eos, rx155_tgt
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
  # rx charclass_q s r 0..-1
    sub $I10, rx155_pos, rx155_off
    find_not_cclass $I11, 32, rx155_tgt, $I10, rx155_eos
    add rx155_pos, rx155_off, $I11
  # rx subrule "backmod" subtype=capture negate=
    rx155_cur."!cursor_pos"(rx155_pos)
    $P10 = rx155_cur."backmod"()
    unless $P10, rx155_fail
    rx155_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx155_pos = $P10."pos"()
  # rx charclass_q s r 0..-1
    sub $I10, rx155_pos, rx155_off
    find_not_cclass $I11, 32, rx155_tgt, $I10, rx155_eos
    add rx155_pos, rx155_off, $I11
  alt160_0:
.annotate 'line', 58
    set_addr $I10, alt160_1
    rx155_cur."!mark_push"(0, rx155_pos, $I10)
.annotate 'line', 59
  # rx subcapture "min"
    set_addr $I10, rxcap_161_fail
    rx155_cur."!mark_push"(0, rx155_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx155_pos, rx155_off
    find_not_cclass $I11, 8, rx155_tgt, $I10, rx155_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx155_fail
    add rx155_pos, rx155_off, $I11
    set_addr $I10, rxcap_161_fail
    ($I12, $I11) = rx155_cur."!mark_peek"($I10)
    rx155_cur."!cursor_pos"($I11)
    ($P10) = rx155_cur."!cursor_start"()
    $P10."!cursor_pass"(rx155_pos, "")
    rx155_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("min")
    goto rxcap_161_done
  rxcap_161_fail:
    goto rx155_fail
  rxcap_161_done:
.annotate 'line', 66
  # rx rxquantr162 ** 0..1
    set_addr $I165, rxquantr162_done
    rx155_cur."!mark_push"(0, rx155_pos, $I165)
  rxquantr162_loop:
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
    set_addr $I10, rxcap_164_fail
    rx155_cur."!mark_push"(0, rx155_pos, $I10)
  alt163_0:
    set_addr $I10, alt163_1
    rx155_cur."!mark_push"(0, rx155_pos, $I10)
.annotate 'line', 62
  # rx charclass_q d r 1..-1
    sub $I10, rx155_pos, rx155_off
    find_not_cclass $I11, 8, rx155_tgt, $I10, rx155_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx155_fail
    add rx155_pos, rx155_off, $I11
    goto alt163_end
  alt163_1:
    set_addr $I10, alt163_2
    rx155_cur."!mark_push"(0, rx155_pos, $I10)
.annotate 'line', 63
  # rx literal  "*"
    add $I11, rx155_pos, 1
    gt $I11, rx155_eos, rx155_fail
    sub $I11, rx155_pos, rx155_off
    substr $S10, rx155_tgt, $I11, 1
    ne $S10, "*", rx155_fail
    add rx155_pos, 1
    goto alt163_end
  alt163_2:
.annotate 'line', 64
  # rx subrule "panic" subtype=method negate=
    rx155_cur."!cursor_pos"(rx155_pos)
    $P10 = rx155_cur."panic"("Only integers or '*' allowed as range quantifier endpoint")
    unless $P10, rx155_fail
    rx155_pos = $P10."pos"()
  alt163_end:
.annotate 'line', 61
    set_addr $I10, rxcap_164_fail
    ($I12, $I11) = rx155_cur."!mark_peek"($I10)
    rx155_cur."!cursor_pos"($I11)
    ($P10) = rx155_cur."!cursor_start"()
    $P10."!cursor_pass"(rx155_pos, "")
    rx155_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("max")
    goto rxcap_164_done
  rxcap_164_fail:
    goto rx155_fail
  rxcap_164_done:
.annotate 'line', 66
    (rx155_rep) = rx155_cur."!mark_commit"($I165)
  rxquantr162_done:
.annotate 'line', 59
    goto alt160_end
  alt160_1:
.annotate 'line', 67
  # rx subrule "quantified_atom" subtype=capture negate=
    rx155_cur."!cursor_pos"(rx155_pos)
    $P10 = rx155_cur."quantified_atom"()
    unless $P10, rx155_fail
    rx155_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantified_atom")
    rx155_pos = $P10."pos"()
  alt160_end:
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
.sub "!PREFIX__quantifier:sym<**>"  :subid("43_1274564774.16047") :method
.annotate 'line', 3
    new $P157, "ResizablePMCArray"
    push $P157, "**"
    .return ($P157)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backmod"  :subid("44_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .const 'Sub' $P175 = "46_1274564774.16047" 
    capture_lex $P175
    .local string rx167_tgt
    .local int rx167_pos
    .local int rx167_off
    .local int rx167_eos
    .local int rx167_rep
    .local pmc rx167_cur
    (rx167_cur, rx167_pos, rx167_tgt) = self."!cursor_start"()
    rx167_cur."!cursor_debug"("START ", "backmod")
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
.annotate 'line', 71
  # rx rxquantr171 ** 0..1
    set_addr $I172, rxquantr171_done
    rx167_cur."!mark_push"(0, rx167_pos, $I172)
  rxquantr171_loop:
  # rx literal  ":"
    add $I11, rx167_pos, 1
    gt $I11, rx167_eos, rx167_fail
    sub $I11, rx167_pos, rx167_off
    substr $S10, rx167_tgt, $I11, 1
    ne $S10, ":", rx167_fail
    add rx167_pos, 1
    (rx167_rep) = rx167_cur."!mark_commit"($I172)
  rxquantr171_done:
  alt173_0:
    set_addr $I10, alt173_1
    rx167_cur."!mark_push"(0, rx167_pos, $I10)
  # rx literal  "?"
    add $I11, rx167_pos, 1
    gt $I11, rx167_eos, rx167_fail
    sub $I11, rx167_pos, rx167_off
    substr $S10, rx167_tgt, $I11, 1
    ne $S10, "?", rx167_fail
    add rx167_pos, 1
    goto alt173_end
  alt173_1:
    set_addr $I10, alt173_2
    rx167_cur."!mark_push"(0, rx167_pos, $I10)
  # rx literal  "!"
    add $I11, rx167_pos, 1
    gt $I11, rx167_eos, rx167_fail
    sub $I11, rx167_pos, rx167_off
    substr $S10, rx167_tgt, $I11, 1
    ne $S10, "!", rx167_fail
    add rx167_pos, 1
    goto alt173_end
  alt173_2:
  # rx subrule "before" subtype=zerowidth negate=1
    rx167_cur."!cursor_pos"(rx167_pos)
    .const 'Sub' $P175 = "46_1274564774.16047" 
    capture_lex $P175
    $P10 = rx167_cur."before"($P175)
    if $P10, rx167_fail
  alt173_end:
  # rx pass
    rx167_cur."!cursor_pass"(rx167_pos, "backmod")
    rx167_cur."!cursor_debug"("PASS  ", "backmod", " at pos=", rx167_pos)
    .return (rx167_cur)
  rx167_fail:
.annotate 'line', 3
    (rx167_rep, rx167_pos, $I10, $P10) = rx167_cur."!mark_fail"(0)
    lt rx167_pos, -1, rx167_done
    eq rx167_pos, -1, rx167_fail
    jump $I10
  rx167_done:
    rx167_cur."!cursor_fail"()
    rx167_cur."!cursor_debug"("FAIL  ", "backmod")
    .return (rx167_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backmod"  :subid("45_1274564774.16047") :method
.annotate 'line', 3
    new $P169, "ResizablePMCArray"
    push $P169, ""
    .return ($P169)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block174"  :anon :subid("46_1274564774.16047") :method :outer("44_1274564774.16047")
.annotate 'line', 71
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
  # rx literal  ":"
    add $I11, rx176_pos, 1
    gt $I11, rx176_eos, rx176_fail
    sub $I11, rx176_pos, rx176_off
    substr $S10, rx176_tgt, $I11, 1
    ne $S10, ":", rx176_fail
    add rx176_pos, 1
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


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar"  :subid("47_1274564774.16047") :method
.annotate 'line', 73
    $P179 = self."!protoregex"("metachar")
    .return ($P179)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar"  :subid("48_1274564774.16047") :method
.annotate 'line', 73
    $P181 = self."!PREFIX__!protoregex"("metachar")
    .return ($P181)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<ws>"  :subid("49_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx183_tgt
    .local int rx183_pos
    .local int rx183_off
    .local int rx183_eos
    .local int rx183_rep
    .local pmc rx183_cur
    (rx183_cur, rx183_pos, rx183_tgt) = self."!cursor_start"()
    rx183_cur."!cursor_debug"("START ", "metachar:sym<ws>")
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
    ne $I10, -1, rxscan187_done
    goto rxscan187_scan
  rxscan187_loop:
    ($P10) = rx183_cur."from"()
    inc $P10
    set rx183_pos, $P10
    ge rx183_pos, rx183_eos, rxscan187_done
  rxscan187_scan:
    set_addr $I10, rxscan187_loop
    rx183_cur."!mark_push"(0, rx183_pos, $I10)
  rxscan187_done:
.annotate 'line', 74
  # rx subrule "normspace" subtype=method negate=
    rx183_cur."!cursor_pos"(rx183_pos)
    $P10 = rx183_cur."normspace"()
    unless $P10, rx183_fail
    rx183_pos = $P10."pos"()
  # rx pass
    rx183_cur."!cursor_pass"(rx183_pos, "metachar:sym<ws>")
    rx183_cur."!cursor_debug"("PASS  ", "metachar:sym<ws>", " at pos=", rx183_pos)
    .return (rx183_cur)
  rx183_fail:
.annotate 'line', 3
    (rx183_rep, rx183_pos, $I10, $P10) = rx183_cur."!mark_fail"(0)
    lt rx183_pos, -1, rx183_done
    eq rx183_pos, -1, rx183_fail
    jump $I10
  rx183_done:
    rx183_cur."!cursor_fail"()
    rx183_cur."!cursor_debug"("FAIL  ", "metachar:sym<ws>")
    .return (rx183_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<ws>"  :subid("50_1274564774.16047") :method
.annotate 'line', 3
    $P185 = self."!PREFIX__!subrule"("", "")
    new $P186, "ResizablePMCArray"
    push $P186, $P185
    .return ($P186)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<[ ]>"  :subid("51_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx189_tgt
    .local int rx189_pos
    .local int rx189_off
    .local int rx189_eos
    .local int rx189_rep
    .local pmc rx189_cur
    (rx189_cur, rx189_pos, rx189_tgt) = self."!cursor_start"()
    rx189_cur."!cursor_debug"("START ", "metachar:sym<[ ]>")
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
.annotate 'line', 75
  # rx literal  "["
    add $I11, rx189_pos, 1
    gt $I11, rx189_eos, rx189_fail
    sub $I11, rx189_pos, rx189_off
    substr $S10, rx189_tgt, $I11, 1
    ne $S10, "[", rx189_fail
    add rx189_pos, 1
  # rx subrule "nibbler" subtype=capture negate=
    rx189_cur."!cursor_pos"(rx189_pos)
    $P10 = rx189_cur."nibbler"()
    unless $P10, rx189_fail
    rx189_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx189_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx189_pos, 1
    gt $I11, rx189_eos, rx189_fail
    sub $I11, rx189_pos, rx189_off
    substr $S10, rx189_tgt, $I11, 1
    ne $S10, "]", rx189_fail
    add rx189_pos, 1
  # rx pass
    rx189_cur."!cursor_pass"(rx189_pos, "metachar:sym<[ ]>")
    rx189_cur."!cursor_debug"("PASS  ", "metachar:sym<[ ]>", " at pos=", rx189_pos)
    .return (rx189_cur)
  rx189_fail:
.annotate 'line', 3
    (rx189_rep, rx189_pos, $I10, $P10) = rx189_cur."!mark_fail"(0)
    lt rx189_pos, -1, rx189_done
    eq rx189_pos, -1, rx189_fail
    jump $I10
  rx189_done:
    rx189_cur."!cursor_fail"()
    rx189_cur."!cursor_debug"("FAIL  ", "metachar:sym<[ ]>")
    .return (rx189_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<[ ]>"  :subid("52_1274564774.16047") :method
.annotate 'line', 3
    $P191 = self."!PREFIX__!subrule"("nibbler", "[")
    new $P192, "ResizablePMCArray"
    push $P192, $P191
    .return ($P192)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<( )>"  :subid("53_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx195_tgt
    .local int rx195_pos
    .local int rx195_off
    .local int rx195_eos
    .local int rx195_rep
    .local pmc rx195_cur
    (rx195_cur, rx195_pos, rx195_tgt) = self."!cursor_start"()
    rx195_cur."!cursor_debug"("START ", "metachar:sym<( )>")
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
    ne $I10, -1, rxscan199_done
    goto rxscan199_scan
  rxscan199_loop:
    ($P10) = rx195_cur."from"()
    inc $P10
    set rx195_pos, $P10
    ge rx195_pos, rx195_eos, rxscan199_done
  rxscan199_scan:
    set_addr $I10, rxscan199_loop
    rx195_cur."!mark_push"(0, rx195_pos, $I10)
  rxscan199_done:
.annotate 'line', 76
  # rx literal  "("
    add $I11, rx195_pos, 1
    gt $I11, rx195_eos, rx195_fail
    sub $I11, rx195_pos, rx195_off
    substr $S10, rx195_tgt, $I11, 1
    ne $S10, "(", rx195_fail
    add rx195_pos, 1
  # rx subrule "nibbler" subtype=capture negate=
    rx195_cur."!cursor_pos"(rx195_pos)
    $P10 = rx195_cur."nibbler"()
    unless $P10, rx195_fail
    rx195_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx195_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx195_pos, 1
    gt $I11, rx195_eos, rx195_fail
    sub $I11, rx195_pos, rx195_off
    substr $S10, rx195_tgt, $I11, 1
    ne $S10, ")", rx195_fail
    add rx195_pos, 1
  # rx pass
    rx195_cur."!cursor_pass"(rx195_pos, "metachar:sym<( )>")
    rx195_cur."!cursor_debug"("PASS  ", "metachar:sym<( )>", " at pos=", rx195_pos)
    .return (rx195_cur)
  rx195_fail:
.annotate 'line', 3
    (rx195_rep, rx195_pos, $I10, $P10) = rx195_cur."!mark_fail"(0)
    lt rx195_pos, -1, rx195_done
    eq rx195_pos, -1, rx195_fail
    jump $I10
  rx195_done:
    rx195_cur."!cursor_fail"()
    rx195_cur."!cursor_debug"("FAIL  ", "metachar:sym<( )>")
    .return (rx195_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<( )>"  :subid("54_1274564774.16047") :method
.annotate 'line', 3
    $P197 = self."!PREFIX__!subrule"("nibbler", "(")
    new $P198, "ResizablePMCArray"
    push $P198, $P197
    .return ($P198)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<'>"  :subid("55_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx201_tgt
    .local int rx201_pos
    .local int rx201_off
    .local int rx201_eos
    .local int rx201_rep
    .local pmc rx201_cur
    (rx201_cur, rx201_pos, rx201_tgt) = self."!cursor_start"()
    rx201_cur."!cursor_debug"("START ", "metachar:sym<'>")
    .lex unicode:"$\x{a2}", rx201_cur
    .local pmc match
    .lex "$/", match
    length rx201_eos, rx201_tgt
    set rx201_off, 0
    lt rx201_pos, 2, rx201_start
    sub rx201_off, rx201_pos, 1
    substr rx201_tgt, rx201_tgt, rx201_off
  rx201_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan204_done
    goto rxscan204_scan
  rxscan204_loop:
    ($P10) = rx201_cur."from"()
    inc $P10
    set rx201_pos, $P10
    ge rx201_pos, rx201_eos, rxscan204_done
  rxscan204_scan:
    set_addr $I10, rxscan204_loop
    rx201_cur."!mark_push"(0, rx201_pos, $I10)
  rxscan204_done:
.annotate 'line', 77
  # rx enumcharlist negate=0 zerowidth
    ge rx201_pos, rx201_eos, rx201_fail
    sub $I10, rx201_pos, rx201_off
    substr $S10, rx201_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx201_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx201_cur."!cursor_pos"(rx201_pos)
    $P10 = rx201_cur."quote_EXPR"(":q")
    unless $P10, rx201_fail
    rx201_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx201_pos = $P10."pos"()
  # rx pass
    rx201_cur."!cursor_pass"(rx201_pos, "metachar:sym<'>")
    rx201_cur."!cursor_debug"("PASS  ", "metachar:sym<'>", " at pos=", rx201_pos)
    .return (rx201_cur)
  rx201_fail:
.annotate 'line', 3
    (rx201_rep, rx201_pos, $I10, $P10) = rx201_cur."!mark_fail"(0)
    lt rx201_pos, -1, rx201_done
    eq rx201_pos, -1, rx201_fail
    jump $I10
  rx201_done:
    rx201_cur."!cursor_fail"()
    rx201_cur."!cursor_debug"("FAIL  ", "metachar:sym<'>")
    .return (rx201_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<'>"  :subid("56_1274564774.16047") :method
.annotate 'line', 3
    new $P203, "ResizablePMCArray"
    push $P203, "'"
    .return ($P203)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<\">"  :subid("57_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx206_tgt
    .local int rx206_pos
    .local int rx206_off
    .local int rx206_eos
    .local int rx206_rep
    .local pmc rx206_cur
    (rx206_cur, rx206_pos, rx206_tgt) = self."!cursor_start"()
    rx206_cur."!cursor_debug"("START ", "metachar:sym<\">")
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
.annotate 'line', 78
  # rx enumcharlist negate=0 zerowidth
    ge rx206_pos, rx206_eos, rx206_fail
    sub $I10, rx206_pos, rx206_off
    substr $S10, rx206_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx206_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx206_cur."!cursor_pos"(rx206_pos)
    $P10 = rx206_cur."quote_EXPR"(":qq")
    unless $P10, rx206_fail
    rx206_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx206_pos = $P10."pos"()
  # rx pass
    rx206_cur."!cursor_pass"(rx206_pos, "metachar:sym<\">")
    rx206_cur."!cursor_debug"("PASS  ", "metachar:sym<\">", " at pos=", rx206_pos)
    .return (rx206_cur)
  rx206_fail:
.annotate 'line', 3
    (rx206_rep, rx206_pos, $I10, $P10) = rx206_cur."!mark_fail"(0)
    lt rx206_pos, -1, rx206_done
    eq rx206_pos, -1, rx206_fail
    jump $I10
  rx206_done:
    rx206_cur."!cursor_fail"()
    rx206_cur."!cursor_debug"("FAIL  ", "metachar:sym<\">")
    .return (rx206_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<\">"  :subid("58_1274564774.16047") :method
.annotate 'line', 3
    new $P208, "ResizablePMCArray"
    push $P208, "\""
    .return ($P208)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<.>"  :subid("59_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx211_tgt
    .local int rx211_pos
    .local int rx211_off
    .local int rx211_eos
    .local int rx211_rep
    .local pmc rx211_cur
    (rx211_cur, rx211_pos, rx211_tgt) = self."!cursor_start"()
    rx211_cur."!cursor_debug"("START ", "metachar:sym<.>")
    .lex unicode:"$\x{a2}", rx211_cur
    .local pmc match
    .lex "$/", match
    length rx211_eos, rx211_tgt
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
.annotate 'line', 79
  # rx subcapture "sym"
    set_addr $I10, rxcap_215_fail
    rx211_cur."!mark_push"(0, rx211_pos, $I10)
  # rx literal  "."
    add $I11, rx211_pos, 1
    gt $I11, rx211_eos, rx211_fail
    sub $I11, rx211_pos, rx211_off
    substr $S10, rx211_tgt, $I11, 1
    ne $S10, ".", rx211_fail
    add rx211_pos, 1
    set_addr $I10, rxcap_215_fail
    ($I12, $I11) = rx211_cur."!mark_peek"($I10)
    rx211_cur."!cursor_pos"($I11)
    ($P10) = rx211_cur."!cursor_start"()
    $P10."!cursor_pass"(rx211_pos, "")
    rx211_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_215_done
  rxcap_215_fail:
    goto rx211_fail
  rxcap_215_done:
  # rx pass
    rx211_cur."!cursor_pass"(rx211_pos, "metachar:sym<.>")
    rx211_cur."!cursor_debug"("PASS  ", "metachar:sym<.>", " at pos=", rx211_pos)
    .return (rx211_cur)
  rx211_fail:
.annotate 'line', 3
    (rx211_rep, rx211_pos, $I10, $P10) = rx211_cur."!mark_fail"(0)
    lt rx211_pos, -1, rx211_done
    eq rx211_pos, -1, rx211_fail
    jump $I10
  rx211_done:
    rx211_cur."!cursor_fail"()
    rx211_cur."!cursor_debug"("FAIL  ", "metachar:sym<.>")
    .return (rx211_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<.>"  :subid("60_1274564774.16047") :method
.annotate 'line', 3
    new $P213, "ResizablePMCArray"
    push $P213, "."
    .return ($P213)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^>"  :subid("61_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx217_tgt
    .local int rx217_pos
    .local int rx217_off
    .local int rx217_eos
    .local int rx217_rep
    .local pmc rx217_cur
    (rx217_cur, rx217_pos, rx217_tgt) = self."!cursor_start"()
    rx217_cur."!cursor_debug"("START ", "metachar:sym<^>")
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
.annotate 'line', 80
  # rx subcapture "sym"
    set_addr $I10, rxcap_221_fail
    rx217_cur."!mark_push"(0, rx217_pos, $I10)
  # rx literal  "^"
    add $I11, rx217_pos, 1
    gt $I11, rx217_eos, rx217_fail
    sub $I11, rx217_pos, rx217_off
    substr $S10, rx217_tgt, $I11, 1
    ne $S10, "^", rx217_fail
    add rx217_pos, 1
    set_addr $I10, rxcap_221_fail
    ($I12, $I11) = rx217_cur."!mark_peek"($I10)
    rx217_cur."!cursor_pos"($I11)
    ($P10) = rx217_cur."!cursor_start"()
    $P10."!cursor_pass"(rx217_pos, "")
    rx217_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_221_done
  rxcap_221_fail:
    goto rx217_fail
  rxcap_221_done:
  # rx pass
    rx217_cur."!cursor_pass"(rx217_pos, "metachar:sym<^>")
    rx217_cur."!cursor_debug"("PASS  ", "metachar:sym<^>", " at pos=", rx217_pos)
    .return (rx217_cur)
  rx217_fail:
.annotate 'line', 3
    (rx217_rep, rx217_pos, $I10, $P10) = rx217_cur."!mark_fail"(0)
    lt rx217_pos, -1, rx217_done
    eq rx217_pos, -1, rx217_fail
    jump $I10
  rx217_done:
    rx217_cur."!cursor_fail"()
    rx217_cur."!cursor_debug"("FAIL  ", "metachar:sym<^>")
    .return (rx217_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<^>"  :subid("62_1274564774.16047") :method
.annotate 'line', 3
    new $P219, "ResizablePMCArray"
    push $P219, "^"
    .return ($P219)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^^>"  :subid("63_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx223_tgt
    .local int rx223_pos
    .local int rx223_off
    .local int rx223_eos
    .local int rx223_rep
    .local pmc rx223_cur
    (rx223_cur, rx223_pos, rx223_tgt) = self."!cursor_start"()
    rx223_cur."!cursor_debug"("START ", "metachar:sym<^^>")
    .lex unicode:"$\x{a2}", rx223_cur
    .local pmc match
    .lex "$/", match
    length rx223_eos, rx223_tgt
    set rx223_off, 0
    lt rx223_pos, 2, rx223_start
    sub rx223_off, rx223_pos, 1
    substr rx223_tgt, rx223_tgt, rx223_off
  rx223_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan226_done
    goto rxscan226_scan
  rxscan226_loop:
    ($P10) = rx223_cur."from"()
    inc $P10
    set rx223_pos, $P10
    ge rx223_pos, rx223_eos, rxscan226_done
  rxscan226_scan:
    set_addr $I10, rxscan226_loop
    rx223_cur."!mark_push"(0, rx223_pos, $I10)
  rxscan226_done:
.annotate 'line', 81
  # rx subcapture "sym"
    set_addr $I10, rxcap_227_fail
    rx223_cur."!mark_push"(0, rx223_pos, $I10)
  # rx literal  "^^"
    add $I11, rx223_pos, 2
    gt $I11, rx223_eos, rx223_fail
    sub $I11, rx223_pos, rx223_off
    substr $S10, rx223_tgt, $I11, 2
    ne $S10, "^^", rx223_fail
    add rx223_pos, 2
    set_addr $I10, rxcap_227_fail
    ($I12, $I11) = rx223_cur."!mark_peek"($I10)
    rx223_cur."!cursor_pos"($I11)
    ($P10) = rx223_cur."!cursor_start"()
    $P10."!cursor_pass"(rx223_pos, "")
    rx223_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_227_done
  rxcap_227_fail:
    goto rx223_fail
  rxcap_227_done:
  # rx pass
    rx223_cur."!cursor_pass"(rx223_pos, "metachar:sym<^^>")
    rx223_cur."!cursor_debug"("PASS  ", "metachar:sym<^^>", " at pos=", rx223_pos)
    .return (rx223_cur)
  rx223_fail:
.annotate 'line', 3
    (rx223_rep, rx223_pos, $I10, $P10) = rx223_cur."!mark_fail"(0)
    lt rx223_pos, -1, rx223_done
    eq rx223_pos, -1, rx223_fail
    jump $I10
  rx223_done:
    rx223_cur."!cursor_fail"()
    rx223_cur."!cursor_debug"("FAIL  ", "metachar:sym<^^>")
    .return (rx223_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<^^>"  :subid("64_1274564774.16047") :method
.annotate 'line', 3
    new $P225, "ResizablePMCArray"
    push $P225, "^^"
    .return ($P225)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$>"  :subid("65_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx229_tgt
    .local int rx229_pos
    .local int rx229_off
    .local int rx229_eos
    .local int rx229_rep
    .local pmc rx229_cur
    (rx229_cur, rx229_pos, rx229_tgt) = self."!cursor_start"()
    rx229_cur."!cursor_debug"("START ", "metachar:sym<$>")
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
.annotate 'line', 82
  # rx subcapture "sym"
    set_addr $I10, rxcap_233_fail
    rx229_cur."!mark_push"(0, rx229_pos, $I10)
  # rx literal  "$"
    add $I11, rx229_pos, 1
    gt $I11, rx229_eos, rx229_fail
    sub $I11, rx229_pos, rx229_off
    substr $S10, rx229_tgt, $I11, 1
    ne $S10, "$", rx229_fail
    add rx229_pos, 1
    set_addr $I10, rxcap_233_fail
    ($I12, $I11) = rx229_cur."!mark_peek"($I10)
    rx229_cur."!cursor_pos"($I11)
    ($P10) = rx229_cur."!cursor_start"()
    $P10."!cursor_pass"(rx229_pos, "")
    rx229_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_233_done
  rxcap_233_fail:
    goto rx229_fail
  rxcap_233_done:
  # rx pass
    rx229_cur."!cursor_pass"(rx229_pos, "metachar:sym<$>")
    rx229_cur."!cursor_debug"("PASS  ", "metachar:sym<$>", " at pos=", rx229_pos)
    .return (rx229_cur)
  rx229_fail:
.annotate 'line', 3
    (rx229_rep, rx229_pos, $I10, $P10) = rx229_cur."!mark_fail"(0)
    lt rx229_pos, -1, rx229_done
    eq rx229_pos, -1, rx229_fail
    jump $I10
  rx229_done:
    rx229_cur."!cursor_fail"()
    rx229_cur."!cursor_debug"("FAIL  ", "metachar:sym<$>")
    .return (rx229_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<$>"  :subid("66_1274564774.16047") :method
.annotate 'line', 3
    new $P231, "ResizablePMCArray"
    push $P231, "$"
    .return ($P231)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$$>"  :subid("67_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx235_tgt
    .local int rx235_pos
    .local int rx235_off
    .local int rx235_eos
    .local int rx235_rep
    .local pmc rx235_cur
    (rx235_cur, rx235_pos, rx235_tgt) = self."!cursor_start"()
    rx235_cur."!cursor_debug"("START ", "metachar:sym<$$>")
    .lex unicode:"$\x{a2}", rx235_cur
    .local pmc match
    .lex "$/", match
    length rx235_eos, rx235_tgt
    set rx235_off, 0
    lt rx235_pos, 2, rx235_start
    sub rx235_off, rx235_pos, 1
    substr rx235_tgt, rx235_tgt, rx235_off
  rx235_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan238_done
    goto rxscan238_scan
  rxscan238_loop:
    ($P10) = rx235_cur."from"()
    inc $P10
    set rx235_pos, $P10
    ge rx235_pos, rx235_eos, rxscan238_done
  rxscan238_scan:
    set_addr $I10, rxscan238_loop
    rx235_cur."!mark_push"(0, rx235_pos, $I10)
  rxscan238_done:
.annotate 'line', 83
  # rx subcapture "sym"
    set_addr $I10, rxcap_239_fail
    rx235_cur."!mark_push"(0, rx235_pos, $I10)
  # rx literal  "$$"
    add $I11, rx235_pos, 2
    gt $I11, rx235_eos, rx235_fail
    sub $I11, rx235_pos, rx235_off
    substr $S10, rx235_tgt, $I11, 2
    ne $S10, "$$", rx235_fail
    add rx235_pos, 2
    set_addr $I10, rxcap_239_fail
    ($I12, $I11) = rx235_cur."!mark_peek"($I10)
    rx235_cur."!cursor_pos"($I11)
    ($P10) = rx235_cur."!cursor_start"()
    $P10."!cursor_pass"(rx235_pos, "")
    rx235_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_239_done
  rxcap_239_fail:
    goto rx235_fail
  rxcap_239_done:
  # rx pass
    rx235_cur."!cursor_pass"(rx235_pos, "metachar:sym<$$>")
    rx235_cur."!cursor_debug"("PASS  ", "metachar:sym<$$>", " at pos=", rx235_pos)
    .return (rx235_cur)
  rx235_fail:
.annotate 'line', 3
    (rx235_rep, rx235_pos, $I10, $P10) = rx235_cur."!mark_fail"(0)
    lt rx235_pos, -1, rx235_done
    eq rx235_pos, -1, rx235_fail
    jump $I10
  rx235_done:
    rx235_cur."!cursor_fail"()
    rx235_cur."!cursor_debug"("FAIL  ", "metachar:sym<$$>")
    .return (rx235_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<$$>"  :subid("68_1274564774.16047") :method
.annotate 'line', 3
    new $P237, "ResizablePMCArray"
    push $P237, "$$"
    .return ($P237)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<:::>"  :subid("69_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx241_tgt
    .local int rx241_pos
    .local int rx241_off
    .local int rx241_eos
    .local int rx241_rep
    .local pmc rx241_cur
    (rx241_cur, rx241_pos, rx241_tgt) = self."!cursor_start"()
    rx241_cur."!cursor_debug"("START ", "metachar:sym<:::>")
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
    ne $I10, -1, rxscan245_done
    goto rxscan245_scan
  rxscan245_loop:
    ($P10) = rx241_cur."from"()
    inc $P10
    set rx241_pos, $P10
    ge rx241_pos, rx241_eos, rxscan245_done
  rxscan245_scan:
    set_addr $I10, rxscan245_loop
    rx241_cur."!mark_push"(0, rx241_pos, $I10)
  rxscan245_done:
.annotate 'line', 84
  # rx subcapture "sym"
    set_addr $I10, rxcap_246_fail
    rx241_cur."!mark_push"(0, rx241_pos, $I10)
  # rx literal  ":::"
    add $I11, rx241_pos, 3
    gt $I11, rx241_eos, rx241_fail
    sub $I11, rx241_pos, rx241_off
    substr $S10, rx241_tgt, $I11, 3
    ne $S10, ":::", rx241_fail
    add rx241_pos, 3
    set_addr $I10, rxcap_246_fail
    ($I12, $I11) = rx241_cur."!mark_peek"($I10)
    rx241_cur."!cursor_pos"($I11)
    ($P10) = rx241_cur."!cursor_start"()
    $P10."!cursor_pass"(rx241_pos, "")
    rx241_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_246_done
  rxcap_246_fail:
    goto rx241_fail
  rxcap_246_done:
  # rx subrule "panic" subtype=method negate=
    rx241_cur."!cursor_pos"(rx241_pos)
    $P10 = rx241_cur."panic"("::: not yet implemented")
    unless $P10, rx241_fail
    rx241_pos = $P10."pos"()
  # rx pass
    rx241_cur."!cursor_pass"(rx241_pos, "metachar:sym<:::>")
    rx241_cur."!cursor_debug"("PASS  ", "metachar:sym<:::>", " at pos=", rx241_pos)
    .return (rx241_cur)
  rx241_fail:
.annotate 'line', 3
    (rx241_rep, rx241_pos, $I10, $P10) = rx241_cur."!mark_fail"(0)
    lt rx241_pos, -1, rx241_done
    eq rx241_pos, -1, rx241_fail
    jump $I10
  rx241_done:
    rx241_cur."!cursor_fail"()
    rx241_cur."!cursor_debug"("FAIL  ", "metachar:sym<:::>")
    .return (rx241_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<:::>"  :subid("70_1274564774.16047") :method
.annotate 'line', 3
    $P243 = self."!PREFIX__!subrule"("", ":::")
    new $P244, "ResizablePMCArray"
    push $P244, $P243
    .return ($P244)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<::>"  :subid("71_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx248_tgt
    .local int rx248_pos
    .local int rx248_off
    .local int rx248_eos
    .local int rx248_rep
    .local pmc rx248_cur
    (rx248_cur, rx248_pos, rx248_tgt) = self."!cursor_start"()
    rx248_cur."!cursor_debug"("START ", "metachar:sym<::>")
    .lex unicode:"$\x{a2}", rx248_cur
    .local pmc match
    .lex "$/", match
    length rx248_eos, rx248_tgt
    set rx248_off, 0
    lt rx248_pos, 2, rx248_start
    sub rx248_off, rx248_pos, 1
    substr rx248_tgt, rx248_tgt, rx248_off
  rx248_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan252_done
    goto rxscan252_scan
  rxscan252_loop:
    ($P10) = rx248_cur."from"()
    inc $P10
    set rx248_pos, $P10
    ge rx248_pos, rx248_eos, rxscan252_done
  rxscan252_scan:
    set_addr $I10, rxscan252_loop
    rx248_cur."!mark_push"(0, rx248_pos, $I10)
  rxscan252_done:
.annotate 'line', 85
  # rx subcapture "sym"
    set_addr $I10, rxcap_253_fail
    rx248_cur."!mark_push"(0, rx248_pos, $I10)
  # rx literal  "::"
    add $I11, rx248_pos, 2
    gt $I11, rx248_eos, rx248_fail
    sub $I11, rx248_pos, rx248_off
    substr $S10, rx248_tgt, $I11, 2
    ne $S10, "::", rx248_fail
    add rx248_pos, 2
    set_addr $I10, rxcap_253_fail
    ($I12, $I11) = rx248_cur."!mark_peek"($I10)
    rx248_cur."!cursor_pos"($I11)
    ($P10) = rx248_cur."!cursor_start"()
    $P10."!cursor_pass"(rx248_pos, "")
    rx248_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_253_done
  rxcap_253_fail:
    goto rx248_fail
  rxcap_253_done:
  # rx subrule "panic" subtype=method negate=
    rx248_cur."!cursor_pos"(rx248_pos)
    $P10 = rx248_cur."panic"(":: not yet implemented")
    unless $P10, rx248_fail
    rx248_pos = $P10."pos"()
  # rx pass
    rx248_cur."!cursor_pass"(rx248_pos, "metachar:sym<::>")
    rx248_cur."!cursor_debug"("PASS  ", "metachar:sym<::>", " at pos=", rx248_pos)
    .return (rx248_cur)
  rx248_fail:
.annotate 'line', 3
    (rx248_rep, rx248_pos, $I10, $P10) = rx248_cur."!mark_fail"(0)
    lt rx248_pos, -1, rx248_done
    eq rx248_pos, -1, rx248_fail
    jump $I10
  rx248_done:
    rx248_cur."!cursor_fail"()
    rx248_cur."!cursor_debug"("FAIL  ", "metachar:sym<::>")
    .return (rx248_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<::>"  :subid("72_1274564774.16047") :method
.annotate 'line', 3
    $P250 = self."!PREFIX__!subrule"("", "::")
    new $P251, "ResizablePMCArray"
    push $P251, $P250
    .return ($P251)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<lwb>"  :subid("73_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx255_tgt
    .local int rx255_pos
    .local int rx255_off
    .local int rx255_eos
    .local int rx255_rep
    .local pmc rx255_cur
    (rx255_cur, rx255_pos, rx255_tgt) = self."!cursor_start"()
    rx255_cur."!cursor_debug"("START ", "metachar:sym<lwb>")
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
.annotate 'line', 86
  # rx subcapture "sym"
    set_addr $I10, rxcap_260_fail
    rx255_cur."!mark_push"(0, rx255_pos, $I10)
  alt259_0:
    set_addr $I10, alt259_1
    rx255_cur."!mark_push"(0, rx255_pos, $I10)
  # rx literal  "<<"
    add $I11, rx255_pos, 2
    gt $I11, rx255_eos, rx255_fail
    sub $I11, rx255_pos, rx255_off
    substr $S10, rx255_tgt, $I11, 2
    ne $S10, "<<", rx255_fail
    add rx255_pos, 2
    goto alt259_end
  alt259_1:
  # rx literal  unicode:"\x{ab}"
    add $I11, rx255_pos, 1
    gt $I11, rx255_eos, rx255_fail
    sub $I11, rx255_pos, rx255_off
    substr $S10, rx255_tgt, $I11, 1
    ne $S10, unicode:"\x{ab}", rx255_fail
    add rx255_pos, 1
  alt259_end:
    set_addr $I10, rxcap_260_fail
    ($I12, $I11) = rx255_cur."!mark_peek"($I10)
    rx255_cur."!cursor_pos"($I11)
    ($P10) = rx255_cur."!cursor_start"()
    $P10."!cursor_pass"(rx255_pos, "")
    rx255_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_260_done
  rxcap_260_fail:
    goto rx255_fail
  rxcap_260_done:
  # rx pass
    rx255_cur."!cursor_pass"(rx255_pos, "metachar:sym<lwb>")
    rx255_cur."!cursor_debug"("PASS  ", "metachar:sym<lwb>", " at pos=", rx255_pos)
    .return (rx255_cur)
  rx255_fail:
.annotate 'line', 3
    (rx255_rep, rx255_pos, $I10, $P10) = rx255_cur."!mark_fail"(0)
    lt rx255_pos, -1, rx255_done
    eq rx255_pos, -1, rx255_fail
    jump $I10
  rx255_done:
    rx255_cur."!cursor_fail"()
    rx255_cur."!cursor_debug"("FAIL  ", "metachar:sym<lwb>")
    .return (rx255_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<lwb>"  :subid("74_1274564774.16047") :method
.annotate 'line', 3
    new $P257, "ResizablePMCArray"
    push $P257, unicode:"\x{ab}"
    push $P257, "<<"
    .return ($P257)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<rwb>"  :subid("75_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx262_tgt
    .local int rx262_pos
    .local int rx262_off
    .local int rx262_eos
    .local int rx262_rep
    .local pmc rx262_cur
    (rx262_cur, rx262_pos, rx262_tgt) = self."!cursor_start"()
    rx262_cur."!cursor_debug"("START ", "metachar:sym<rwb>")
    .lex unicode:"$\x{a2}", rx262_cur
    .local pmc match
    .lex "$/", match
    length rx262_eos, rx262_tgt
    set rx262_off, 0
    lt rx262_pos, 2, rx262_start
    sub rx262_off, rx262_pos, 1
    substr rx262_tgt, rx262_tgt, rx262_off
  rx262_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan265_done
    goto rxscan265_scan
  rxscan265_loop:
    ($P10) = rx262_cur."from"()
    inc $P10
    set rx262_pos, $P10
    ge rx262_pos, rx262_eos, rxscan265_done
  rxscan265_scan:
    set_addr $I10, rxscan265_loop
    rx262_cur."!mark_push"(0, rx262_pos, $I10)
  rxscan265_done:
.annotate 'line', 87
  # rx subcapture "sym"
    set_addr $I10, rxcap_267_fail
    rx262_cur."!mark_push"(0, rx262_pos, $I10)
  alt266_0:
    set_addr $I10, alt266_1
    rx262_cur."!mark_push"(0, rx262_pos, $I10)
  # rx literal  ">>"
    add $I11, rx262_pos, 2
    gt $I11, rx262_eos, rx262_fail
    sub $I11, rx262_pos, rx262_off
    substr $S10, rx262_tgt, $I11, 2
    ne $S10, ">>", rx262_fail
    add rx262_pos, 2
    goto alt266_end
  alt266_1:
  # rx literal  unicode:"\x{bb}"
    add $I11, rx262_pos, 1
    gt $I11, rx262_eos, rx262_fail
    sub $I11, rx262_pos, rx262_off
    substr $S10, rx262_tgt, $I11, 1
    ne $S10, unicode:"\x{bb}", rx262_fail
    add rx262_pos, 1
  alt266_end:
    set_addr $I10, rxcap_267_fail
    ($I12, $I11) = rx262_cur."!mark_peek"($I10)
    rx262_cur."!cursor_pos"($I11)
    ($P10) = rx262_cur."!cursor_start"()
    $P10."!cursor_pass"(rx262_pos, "")
    rx262_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_267_done
  rxcap_267_fail:
    goto rx262_fail
  rxcap_267_done:
  # rx pass
    rx262_cur."!cursor_pass"(rx262_pos, "metachar:sym<rwb>")
    rx262_cur."!cursor_debug"("PASS  ", "metachar:sym<rwb>", " at pos=", rx262_pos)
    .return (rx262_cur)
  rx262_fail:
.annotate 'line', 3
    (rx262_rep, rx262_pos, $I10, $P10) = rx262_cur."!mark_fail"(0)
    lt rx262_pos, -1, rx262_done
    eq rx262_pos, -1, rx262_fail
    jump $I10
  rx262_done:
    rx262_cur."!cursor_fail"()
    rx262_cur."!cursor_debug"("FAIL  ", "metachar:sym<rwb>")
    .return (rx262_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<rwb>"  :subid("76_1274564774.16047") :method
.annotate 'line', 3
    new $P264, "ResizablePMCArray"
    push $P264, unicode:"\x{bb}"
    push $P264, ">>"
    .return ($P264)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<bs>"  :subid("77_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx269_tgt
    .local int rx269_pos
    .local int rx269_off
    .local int rx269_eos
    .local int rx269_rep
    .local pmc rx269_cur
    (rx269_cur, rx269_pos, rx269_tgt) = self."!cursor_start"()
    rx269_cur."!cursor_debug"("START ", "metachar:sym<bs>")
    .lex unicode:"$\x{a2}", rx269_cur
    .local pmc match
    .lex "$/", match
    length rx269_eos, rx269_tgt
    set rx269_off, 0
    lt rx269_pos, 2, rx269_start
    sub rx269_off, rx269_pos, 1
    substr rx269_tgt, rx269_tgt, rx269_off
  rx269_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan273_done
    goto rxscan273_scan
  rxscan273_loop:
    ($P10) = rx269_cur."from"()
    inc $P10
    set rx269_pos, $P10
    ge rx269_pos, rx269_eos, rxscan273_done
  rxscan273_scan:
    set_addr $I10, rxscan273_loop
    rx269_cur."!mark_push"(0, rx269_pos, $I10)
  rxscan273_done:
.annotate 'line', 88
  # rx literal  "\\"
    add $I11, rx269_pos, 1
    gt $I11, rx269_eos, rx269_fail
    sub $I11, rx269_pos, rx269_off
    substr $S10, rx269_tgt, $I11, 1
    ne $S10, "\\", rx269_fail
    add rx269_pos, 1
  # rx subrule "backslash" subtype=capture negate=
    rx269_cur."!cursor_pos"(rx269_pos)
    $P10 = rx269_cur."backslash"()
    unless $P10, rx269_fail
    rx269_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backslash")
    rx269_pos = $P10."pos"()
  # rx pass
    rx269_cur."!cursor_pass"(rx269_pos, "metachar:sym<bs>")
    rx269_cur."!cursor_debug"("PASS  ", "metachar:sym<bs>", " at pos=", rx269_pos)
    .return (rx269_cur)
  rx269_fail:
.annotate 'line', 3
    (rx269_rep, rx269_pos, $I10, $P10) = rx269_cur."!mark_fail"(0)
    lt rx269_pos, -1, rx269_done
    eq rx269_pos, -1, rx269_fail
    jump $I10
  rx269_done:
    rx269_cur."!cursor_fail"()
    rx269_cur."!cursor_debug"("FAIL  ", "metachar:sym<bs>")
    .return (rx269_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<bs>"  :subid("78_1274564774.16047") :method
.annotate 'line', 3
    $P271 = self."!PREFIX__!subrule"("backslash", "\\")
    new $P272, "ResizablePMCArray"
    push $P272, $P271
    .return ($P272)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<mod>"  :subid("79_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx275_tgt
    .local int rx275_pos
    .local int rx275_off
    .local int rx275_eos
    .local int rx275_rep
    .local pmc rx275_cur
    (rx275_cur, rx275_pos, rx275_tgt) = self."!cursor_start"()
    rx275_cur."!cursor_debug"("START ", "metachar:sym<mod>")
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
    ne $I10, -1, rxscan279_done
    goto rxscan279_scan
  rxscan279_loop:
    ($P10) = rx275_cur."from"()
    inc $P10
    set rx275_pos, $P10
    ge rx275_pos, rx275_eos, rxscan279_done
  rxscan279_scan:
    set_addr $I10, rxscan279_loop
    rx275_cur."!mark_push"(0, rx275_pos, $I10)
  rxscan279_done:
.annotate 'line', 89
  # rx subrule "mod_internal" subtype=capture negate=
    rx275_cur."!cursor_pos"(rx275_pos)
    $P10 = rx275_cur."mod_internal"()
    unless $P10, rx275_fail
    rx275_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_internal")
    rx275_pos = $P10."pos"()
  # rx pass
    rx275_cur."!cursor_pass"(rx275_pos, "metachar:sym<mod>")
    rx275_cur."!cursor_debug"("PASS  ", "metachar:sym<mod>", " at pos=", rx275_pos)
    .return (rx275_cur)
  rx275_fail:
.annotate 'line', 3
    (rx275_rep, rx275_pos, $I10, $P10) = rx275_cur."!mark_fail"(0)
    lt rx275_pos, -1, rx275_done
    eq rx275_pos, -1, rx275_fail
    jump $I10
  rx275_done:
    rx275_cur."!cursor_fail"()
    rx275_cur."!cursor_debug"("FAIL  ", "metachar:sym<mod>")
    .return (rx275_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<mod>"  :subid("80_1274564774.16047") :method
.annotate 'line', 3
    $P277 = self."!PREFIX__!subrule"("mod_internal", "")
    new $P278, "ResizablePMCArray"
    push $P278, $P277
    .return ($P278)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<~>"  :subid("81_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx281_tgt
    .local int rx281_pos
    .local int rx281_off
    .local int rx281_eos
    .local int rx281_rep
    .local pmc rx281_cur
    (rx281_cur, rx281_pos, rx281_tgt) = self."!cursor_start"()
    rx281_cur."!cursor_debug"("START ", "metachar:sym<~>")
    .lex unicode:"$\x{a2}", rx281_cur
    .local pmc match
    .lex "$/", match
    length rx281_eos, rx281_tgt
    set rx281_off, 0
    lt rx281_pos, 2, rx281_start
    sub rx281_off, rx281_pos, 1
    substr rx281_tgt, rx281_tgt, rx281_off
  rx281_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan285_done
    goto rxscan285_scan
  rxscan285_loop:
    ($P10) = rx281_cur."from"()
    inc $P10
    set rx281_pos, $P10
    ge rx281_pos, rx281_eos, rxscan285_done
  rxscan285_scan:
    set_addr $I10, rxscan285_loop
    rx281_cur."!mark_push"(0, rx281_pos, $I10)
  rxscan285_done:
.annotate 'line', 93
  # rx subcapture "sym"
    set_addr $I10, rxcap_286_fail
    rx281_cur."!mark_push"(0, rx281_pos, $I10)
  # rx literal  "~"
    add $I11, rx281_pos, 1
    gt $I11, rx281_eos, rx281_fail
    sub $I11, rx281_pos, rx281_off
    substr $S10, rx281_tgt, $I11, 1
    ne $S10, "~", rx281_fail
    add rx281_pos, 1
    set_addr $I10, rxcap_286_fail
    ($I12, $I11) = rx281_cur."!mark_peek"($I10)
    rx281_cur."!cursor_pos"($I11)
    ($P10) = rx281_cur."!cursor_start"()
    $P10."!cursor_pass"(rx281_pos, "")
    rx281_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_286_done
  rxcap_286_fail:
    goto rx281_fail
  rxcap_286_done:
.annotate 'line', 94
  # rx subrule "ws" subtype=method negate=
    rx281_cur."!cursor_pos"(rx281_pos)
    $P10 = rx281_cur."ws"()
    unless $P10, rx281_fail
    rx281_pos = $P10."pos"()
  # rx subrule "quantified_atom" subtype=capture negate=
    rx281_cur."!cursor_pos"(rx281_pos)
    $P10 = rx281_cur."quantified_atom"()
    unless $P10, rx281_fail
    rx281_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("GOAL")
    rx281_pos = $P10."pos"()
.annotate 'line', 95
  # rx subrule "ws" subtype=method negate=
    rx281_cur."!cursor_pos"(rx281_pos)
    $P10 = rx281_cur."ws"()
    unless $P10, rx281_fail
    rx281_pos = $P10."pos"()
  # rx subrule "quantified_atom" subtype=capture negate=
    rx281_cur."!cursor_pos"(rx281_pos)
    $P10 = rx281_cur."quantified_atom"()
    unless $P10, rx281_fail
    rx281_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx281_pos = $P10."pos"()
.annotate 'line', 92
  # rx pass
    rx281_cur."!cursor_pass"(rx281_pos, "metachar:sym<~>")
    rx281_cur."!cursor_debug"("PASS  ", "metachar:sym<~>", " at pos=", rx281_pos)
    .return (rx281_cur)
  rx281_fail:
.annotate 'line', 3
    (rx281_rep, rx281_pos, $I10, $P10) = rx281_cur."!mark_fail"(0)
    lt rx281_pos, -1, rx281_done
    eq rx281_pos, -1, rx281_fail
    jump $I10
  rx281_done:
    rx281_cur."!cursor_fail"()
    rx281_cur."!cursor_debug"("FAIL  ", "metachar:sym<~>")
    .return (rx281_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<~>"  :subid("82_1274564774.16047") :method
.annotate 'line', 3
    $P283 = self."!PREFIX__!subrule"("", "~")
    new $P284, "ResizablePMCArray"
    push $P284, $P283
    .return ($P284)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<{*}>"  :subid("83_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx288_tgt
    .local int rx288_pos
    .local int rx288_off
    .local int rx288_eos
    .local int rx288_rep
    .local pmc rx288_cur
    (rx288_cur, rx288_pos, rx288_tgt) = self."!cursor_start"()
    rx288_cur."!cursor_debug"("START ", "metachar:sym<{*}>")
    rx288_cur."!cursor_caparray"("key")
    .lex unicode:"$\x{a2}", rx288_cur
    .local pmc match
    .lex "$/", match
    length rx288_eos, rx288_tgt
    set rx288_off, 0
    lt rx288_pos, 2, rx288_start
    sub rx288_off, rx288_pos, 1
    substr rx288_tgt, rx288_tgt, rx288_off
  rx288_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan291_done
    goto rxscan291_scan
  rxscan291_loop:
    ($P10) = rx288_cur."from"()
    inc $P10
    set rx288_pos, $P10
    ge rx288_pos, rx288_eos, rxscan291_done
  rxscan291_scan:
    set_addr $I10, rxscan291_loop
    rx288_cur."!mark_push"(0, rx288_pos, $I10)
  rxscan291_done:
.annotate 'line', 99
  # rx subcapture "sym"
    set_addr $I10, rxcap_292_fail
    rx288_cur."!mark_push"(0, rx288_pos, $I10)
  # rx literal  "{*}"
    add $I11, rx288_pos, 3
    gt $I11, rx288_eos, rx288_fail
    sub $I11, rx288_pos, rx288_off
    substr $S10, rx288_tgt, $I11, 3
    ne $S10, "{*}", rx288_fail
    add rx288_pos, 3
    set_addr $I10, rxcap_292_fail
    ($I12, $I11) = rx288_cur."!mark_peek"($I10)
    rx288_cur."!cursor_pos"($I11)
    ($P10) = rx288_cur."!cursor_start"()
    $P10."!cursor_pass"(rx288_pos, "")
    rx288_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_292_done
  rxcap_292_fail:
    goto rx288_fail
  rxcap_292_done:
.annotate 'line', 100
  # rx rxquantr293 ** 0..1
    set_addr $I303, rxquantr293_done
    rx288_cur."!mark_push"(0, rx288_pos, $I303)
  rxquantr293_loop:
  # rx rxquantr294 ** 0..*
    set_addr $I295, rxquantr294_done
    rx288_cur."!mark_push"(0, rx288_pos, $I295)
  rxquantr294_loop:
  # rx enumcharlist negate=0 
    ge rx288_pos, rx288_eos, rx288_fail
    sub $I10, rx288_pos, rx288_off
    substr $S10, rx288_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx288_fail
    inc rx288_pos
    (rx288_rep) = rx288_cur."!mark_commit"($I295)
    rx288_cur."!mark_push"(rx288_rep, rx288_pos, $I295)
    goto rxquantr294_loop
  rxquantr294_done:
  # rx literal  "#= "
    add $I11, rx288_pos, 3
    gt $I11, rx288_eos, rx288_fail
    sub $I11, rx288_pos, rx288_off
    substr $S10, rx288_tgt, $I11, 3
    ne $S10, "#= ", rx288_fail
    add rx288_pos, 3
  # rx rxquantr296 ** 0..*
    set_addr $I297, rxquantr296_done
    rx288_cur."!mark_push"(0, rx288_pos, $I297)
  rxquantr296_loop:
  # rx enumcharlist negate=0 
    ge rx288_pos, rx288_eos, rx288_fail
    sub $I10, rx288_pos, rx288_off
    substr $S10, rx288_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx288_fail
    inc rx288_pos
    (rx288_rep) = rx288_cur."!mark_commit"($I297)
    rx288_cur."!mark_push"(rx288_rep, rx288_pos, $I297)
    goto rxquantr296_loop
  rxquantr296_done:
  # rx subcapture "key"
    set_addr $I10, rxcap_302_fail
    rx288_cur."!mark_push"(0, rx288_pos, $I10)
  # rx charclass_q S r 1..-1
    sub $I10, rx288_pos, rx288_off
    find_cclass $I11, 32, rx288_tgt, $I10, rx288_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx288_fail
    add rx288_pos, rx288_off, $I11
  # rx rxquantr298 ** 0..*
    set_addr $I301, rxquantr298_done
    rx288_cur."!mark_push"(0, rx288_pos, $I301)
  rxquantr298_loop:
  # rx rxquantr299 ** 1..*
    set_addr $I300, rxquantr299_done
    rx288_cur."!mark_push"(0, -1, $I300)
  rxquantr299_loop:
  # rx enumcharlist negate=0 
    ge rx288_pos, rx288_eos, rx288_fail
    sub $I10, rx288_pos, rx288_off
    substr $S10, rx288_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx288_fail
    inc rx288_pos
    (rx288_rep) = rx288_cur."!mark_commit"($I300)
    rx288_cur."!mark_push"(rx288_rep, rx288_pos, $I300)
    goto rxquantr299_loop
  rxquantr299_done:
  # rx charclass_q S r 1..-1
    sub $I10, rx288_pos, rx288_off
    find_cclass $I11, 32, rx288_tgt, $I10, rx288_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx288_fail
    add rx288_pos, rx288_off, $I11
    (rx288_rep) = rx288_cur."!mark_commit"($I301)
    rx288_cur."!mark_push"(rx288_rep, rx288_pos, $I301)
    goto rxquantr298_loop
  rxquantr298_done:
    set_addr $I10, rxcap_302_fail
    ($I12, $I11) = rx288_cur."!mark_peek"($I10)
    rx288_cur."!cursor_pos"($I11)
    ($P10) = rx288_cur."!cursor_start"()
    $P10."!cursor_pass"(rx288_pos, "")
    rx288_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("key")
    goto rxcap_302_done
  rxcap_302_fail:
    goto rx288_fail
  rxcap_302_done:
    (rx288_rep) = rx288_cur."!mark_commit"($I303)
  rxquantr293_done:
.annotate 'line', 98
  # rx pass
    rx288_cur."!cursor_pass"(rx288_pos, "metachar:sym<{*}>")
    rx288_cur."!cursor_debug"("PASS  ", "metachar:sym<{*}>", " at pos=", rx288_pos)
    .return (rx288_cur)
  rx288_fail:
.annotate 'line', 3
    (rx288_rep, rx288_pos, $I10, $P10) = rx288_cur."!mark_fail"(0)
    lt rx288_pos, -1, rx288_done
    eq rx288_pos, -1, rx288_fail
    jump $I10
  rx288_done:
    rx288_cur."!cursor_fail"()
    rx288_cur."!cursor_debug"("FAIL  ", "metachar:sym<{*}>")
    .return (rx288_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<{*}>"  :subid("84_1274564774.16047") :method
.annotate 'line', 3
    new $P290, "ResizablePMCArray"
    push $P290, "{*}"
    .return ($P290)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<assert>"  :subid("85_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx305_tgt
    .local int rx305_pos
    .local int rx305_off
    .local int rx305_eos
    .local int rx305_rep
    .local pmc rx305_cur
    (rx305_cur, rx305_pos, rx305_tgt) = self."!cursor_start"()
    rx305_cur."!cursor_debug"("START ", "metachar:sym<assert>")
    .lex unicode:"$\x{a2}", rx305_cur
    .local pmc match
    .lex "$/", match
    length rx305_eos, rx305_tgt
    set rx305_off, 0
    lt rx305_pos, 2, rx305_start
    sub rx305_off, rx305_pos, 1
    substr rx305_tgt, rx305_tgt, rx305_off
  rx305_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan309_done
    goto rxscan309_scan
  rxscan309_loop:
    ($P10) = rx305_cur."from"()
    inc $P10
    set rx305_pos, $P10
    ge rx305_pos, rx305_eos, rxscan309_done
  rxscan309_scan:
    set_addr $I10, rxscan309_loop
    rx305_cur."!mark_push"(0, rx305_pos, $I10)
  rxscan309_done:
.annotate 'line', 103
  # rx literal  "<"
    add $I11, rx305_pos, 1
    gt $I11, rx305_eos, rx305_fail
    sub $I11, rx305_pos, rx305_off
    substr $S10, rx305_tgt, $I11, 1
    ne $S10, "<", rx305_fail
    add rx305_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx305_cur."!cursor_pos"(rx305_pos)
    $P10 = rx305_cur."assertion"()
    unless $P10, rx305_fail
    rx305_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx305_pos = $P10."pos"()
  alt310_0:
.annotate 'line', 104
    set_addr $I10, alt310_1
    rx305_cur."!mark_push"(0, rx305_pos, $I10)
  # rx literal  ">"
    add $I11, rx305_pos, 1
    gt $I11, rx305_eos, rx305_fail
    sub $I11, rx305_pos, rx305_off
    substr $S10, rx305_tgt, $I11, 1
    ne $S10, ">", rx305_fail
    add rx305_pos, 1
    goto alt310_end
  alt310_1:
  # rx subrule "panic" subtype=method negate=
    rx305_cur."!cursor_pos"(rx305_pos)
    $P10 = rx305_cur."panic"("regex assertion not terminated by angle bracket")
    unless $P10, rx305_fail
    rx305_pos = $P10."pos"()
  alt310_end:
.annotate 'line', 102
  # rx pass
    rx305_cur."!cursor_pass"(rx305_pos, "metachar:sym<assert>")
    rx305_cur."!cursor_debug"("PASS  ", "metachar:sym<assert>", " at pos=", rx305_pos)
    .return (rx305_cur)
  rx305_fail:
.annotate 'line', 3
    (rx305_rep, rx305_pos, $I10, $P10) = rx305_cur."!mark_fail"(0)
    lt rx305_pos, -1, rx305_done
    eq rx305_pos, -1, rx305_fail
    jump $I10
  rx305_done:
    rx305_cur."!cursor_fail"()
    rx305_cur."!cursor_debug"("FAIL  ", "metachar:sym<assert>")
    .return (rx305_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<assert>"  :subid("86_1274564774.16047") :method
.annotate 'line', 3
    $P307 = self."!PREFIX__!subrule"("assertion", "<")
    new $P308, "ResizablePMCArray"
    push $P308, $P307
    .return ($P308)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<var>"  :subid("87_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx312_tgt
    .local int rx312_pos
    .local int rx312_off
    .local int rx312_eos
    .local int rx312_rep
    .local pmc rx312_cur
    (rx312_cur, rx312_pos, rx312_tgt) = self."!cursor_start"()
    rx312_cur."!cursor_debug"("START ", "metachar:sym<var>")
    rx312_cur."!cursor_caparray"("quantified_atom")
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
  alt316_0:
.annotate 'line', 108
    set_addr $I10, alt316_1
    rx312_cur."!mark_push"(0, rx312_pos, $I10)
.annotate 'line', 109
  # rx literal  "$<"
    add $I11, rx312_pos, 2
    gt $I11, rx312_eos, rx312_fail
    sub $I11, rx312_pos, rx312_off
    substr $S10, rx312_tgt, $I11, 2
    ne $S10, "$<", rx312_fail
    add rx312_pos, 2
  # rx subcapture "name"
    set_addr $I10, rxcap_319_fail
    rx312_cur."!mark_push"(0, rx312_pos, $I10)
  # rx rxquantr317 ** 1..*
    set_addr $I318, rxquantr317_done
    rx312_cur."!mark_push"(0, -1, $I318)
  rxquantr317_loop:
  # rx enumcharlist negate=1 
    ge rx312_pos, rx312_eos, rx312_fail
    sub $I10, rx312_pos, rx312_off
    substr $S10, rx312_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx312_fail
    inc rx312_pos
    (rx312_rep) = rx312_cur."!mark_commit"($I318)
    rx312_cur."!mark_push"(rx312_rep, rx312_pos, $I318)
    goto rxquantr317_loop
  rxquantr317_done:
    set_addr $I10, rxcap_319_fail
    ($I12, $I11) = rx312_cur."!mark_peek"($I10)
    rx312_cur."!cursor_pos"($I11)
    ($P10) = rx312_cur."!cursor_start"()
    $P10."!cursor_pass"(rx312_pos, "")
    rx312_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_319_done
  rxcap_319_fail:
    goto rx312_fail
  rxcap_319_done:
  # rx literal  ">"
    add $I11, rx312_pos, 1
    gt $I11, rx312_eos, rx312_fail
    sub $I11, rx312_pos, rx312_off
    substr $S10, rx312_tgt, $I11, 1
    ne $S10, ">", rx312_fail
    add rx312_pos, 1
    goto alt316_end
  alt316_1:
.annotate 'line', 110
  # rx literal  "$"
    add $I11, rx312_pos, 1
    gt $I11, rx312_eos, rx312_fail
    sub $I11, rx312_pos, rx312_off
    substr $S10, rx312_tgt, $I11, 1
    ne $S10, "$", rx312_fail
    add rx312_pos, 1
  # rx subcapture "pos"
    set_addr $I10, rxcap_320_fail
    rx312_cur."!mark_push"(0, rx312_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx312_pos, rx312_off
    find_not_cclass $I11, 8, rx312_tgt, $I10, rx312_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx312_fail
    add rx312_pos, rx312_off, $I11
    set_addr $I10, rxcap_320_fail
    ($I12, $I11) = rx312_cur."!mark_peek"($I10)
    rx312_cur."!cursor_pos"($I11)
    ($P10) = rx312_cur."!cursor_start"()
    $P10."!cursor_pass"(rx312_pos, "")
    rx312_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pos")
    goto rxcap_320_done
  rxcap_320_fail:
    goto rx312_fail
  rxcap_320_done:
  alt316_end:
.annotate 'line', 113
  # rx rxquantr321 ** 0..1
    set_addr $I322, rxquantr321_done
    rx312_cur."!mark_push"(0, rx312_pos, $I322)
  rxquantr321_loop:
  # rx subrule "ws" subtype=method negate=
    rx312_cur."!cursor_pos"(rx312_pos)
    $P10 = rx312_cur."ws"()
    unless $P10, rx312_fail
    rx312_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx312_pos, 1
    gt $I11, rx312_eos, rx312_fail
    sub $I11, rx312_pos, rx312_off
    substr $S10, rx312_tgt, $I11, 1
    ne $S10, "=", rx312_fail
    add rx312_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx312_cur."!cursor_pos"(rx312_pos)
    $P10 = rx312_cur."ws"()
    unless $P10, rx312_fail
    rx312_pos = $P10."pos"()
  # rx subrule "quantified_atom" subtype=capture negate=
    rx312_cur."!cursor_pos"(rx312_pos)
    $P10 = rx312_cur."quantified_atom"()
    unless $P10, rx312_fail
    rx312_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantified_atom")
    rx312_pos = $P10."pos"()
    (rx312_rep) = rx312_cur."!mark_commit"($I322)
  rxquantr321_done:
.annotate 'line', 107
  # rx pass
    rx312_cur."!cursor_pass"(rx312_pos, "metachar:sym<var>")
    rx312_cur."!cursor_debug"("PASS  ", "metachar:sym<var>", " at pos=", rx312_pos)
    .return (rx312_cur)
  rx312_fail:
.annotate 'line', 3
    (rx312_rep, rx312_pos, $I10, $P10) = rx312_cur."!mark_fail"(0)
    lt rx312_pos, -1, rx312_done
    eq rx312_pos, -1, rx312_fail
    jump $I10
  rx312_done:
    rx312_cur."!cursor_fail"()
    rx312_cur."!cursor_debug"("FAIL  ", "metachar:sym<var>")
    .return (rx312_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<var>"  :subid("88_1274564774.16047") :method
.annotate 'line', 3
    new $P314, "ResizablePMCArray"
    push $P314, "$"
    push $P314, "$<"
    .return ($P314)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<PIR>"  :subid("89_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx324_tgt
    .local int rx324_pos
    .local int rx324_off
    .local int rx324_eos
    .local int rx324_rep
    .local pmc rx324_cur
    (rx324_cur, rx324_pos, rx324_tgt) = self."!cursor_start"()
    rx324_cur."!cursor_debug"("START ", "metachar:sym<PIR>")
    .lex unicode:"$\x{a2}", rx324_cur
    .local pmc match
    .lex "$/", match
    length rx324_eos, rx324_tgt
    set rx324_off, 0
    lt rx324_pos, 2, rx324_start
    sub rx324_off, rx324_pos, 1
    substr rx324_tgt, rx324_tgt, rx324_off
  rx324_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan327_done
    goto rxscan327_scan
  rxscan327_loop:
    ($P10) = rx324_cur."from"()
    inc $P10
    set rx324_pos, $P10
    ge rx324_pos, rx324_eos, rxscan327_done
  rxscan327_scan:
    set_addr $I10, rxscan327_loop
    rx324_cur."!mark_push"(0, rx324_pos, $I10)
  rxscan327_done:
.annotate 'line', 117
  # rx literal  ":PIR{{"
    add $I11, rx324_pos, 6
    gt $I11, rx324_eos, rx324_fail
    sub $I11, rx324_pos, rx324_off
    substr $S10, rx324_tgt, $I11, 6
    ne $S10, ":PIR{{", rx324_fail
    add rx324_pos, 6
  # rx subcapture "pir"
    set_addr $I10, rxcap_330_fail
    rx324_cur."!mark_push"(0, rx324_pos, $I10)
  # rx rxquantf328 ** 0..*
    set_addr $I10, rxquantf328_loop
    rx324_cur."!mark_push"(0, rx324_pos, $I10)
    goto rxquantf328_done
  rxquantf328_loop:
  # rx charclass .
    ge rx324_pos, rx324_eos, rx324_fail
    inc rx324_pos
    set_addr $I10, rxquantf328_loop
    rx324_cur."!mark_push"($I329, rx324_pos, $I10)
  rxquantf328_done:
    set_addr $I10, rxcap_330_fail
    ($I12, $I11) = rx324_cur."!mark_peek"($I10)
    rx324_cur."!cursor_pos"($I11)
    ($P10) = rx324_cur."!cursor_start"()
    $P10."!cursor_pass"(rx324_pos, "")
    rx324_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pir")
    goto rxcap_330_done
  rxcap_330_fail:
    goto rx324_fail
  rxcap_330_done:
  # rx literal  "}}"
    add $I11, rx324_pos, 2
    gt $I11, rx324_eos, rx324_fail
    sub $I11, rx324_pos, rx324_off
    substr $S10, rx324_tgt, $I11, 2
    ne $S10, "}}", rx324_fail
    add rx324_pos, 2
.annotate 'line', 116
  # rx pass
    rx324_cur."!cursor_pass"(rx324_pos, "metachar:sym<PIR>")
    rx324_cur."!cursor_debug"("PASS  ", "metachar:sym<PIR>", " at pos=", rx324_pos)
    .return (rx324_cur)
  rx324_fail:
.annotate 'line', 3
    (rx324_rep, rx324_pos, $I10, $P10) = rx324_cur."!mark_fail"(0)
    lt rx324_pos, -1, rx324_done
    eq rx324_pos, -1, rx324_fail
    jump $I10
  rx324_done:
    rx324_cur."!cursor_fail"()
    rx324_cur."!cursor_debug"("FAIL  ", "metachar:sym<PIR>")
    .return (rx324_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<PIR>"  :subid("90_1274564774.16047") :method
.annotate 'line', 3
    new $P326, "ResizablePMCArray"
    push $P326, ":PIR{{"
    .return ($P326)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash"  :subid("91_1274564774.16047") :method
.annotate 'line', 120
    $P332 = self."!protoregex"("backslash")
    .return ($P332)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash"  :subid("92_1274564774.16047") :method
.annotate 'line', 120
    $P334 = self."!PREFIX__!protoregex"("backslash")
    .return ($P334)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<w>"  :subid("93_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx336_tgt
    .local int rx336_pos
    .local int rx336_off
    .local int rx336_eos
    .local int rx336_rep
    .local pmc rx336_cur
    (rx336_cur, rx336_pos, rx336_tgt) = self."!cursor_start"()
    rx336_cur."!cursor_debug"("START ", "backslash:sym<w>")
    .lex unicode:"$\x{a2}", rx336_cur
    .local pmc match
    .lex "$/", match
    length rx336_eos, rx336_tgt
    set rx336_off, 0
    lt rx336_pos, 2, rx336_start
    sub rx336_off, rx336_pos, 1
    substr rx336_tgt, rx336_tgt, rx336_off
  rx336_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan339_done
    goto rxscan339_scan
  rxscan339_loop:
    ($P10) = rx336_cur."from"()
    inc $P10
    set rx336_pos, $P10
    ge rx336_pos, rx336_eos, rxscan339_done
  rxscan339_scan:
    set_addr $I10, rxscan339_loop
    rx336_cur."!mark_push"(0, rx336_pos, $I10)
  rxscan339_done:
.annotate 'line', 121
  # rx subcapture "sym"
    set_addr $I10, rxcap_340_fail
    rx336_cur."!mark_push"(0, rx336_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx336_pos, rx336_eos, rx336_fail
    sub $I10, rx336_pos, rx336_off
    substr $S10, rx336_tgt, $I10, 1
    index $I11, "dswnDSWN", $S10
    lt $I11, 0, rx336_fail
    inc rx336_pos
    set_addr $I10, rxcap_340_fail
    ($I12, $I11) = rx336_cur."!mark_peek"($I10)
    rx336_cur."!cursor_pos"($I11)
    ($P10) = rx336_cur."!cursor_start"()
    $P10."!cursor_pass"(rx336_pos, "")
    rx336_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_340_done
  rxcap_340_fail:
    goto rx336_fail
  rxcap_340_done:
  # rx pass
    rx336_cur."!cursor_pass"(rx336_pos, "backslash:sym<w>")
    rx336_cur."!cursor_debug"("PASS  ", "backslash:sym<w>", " at pos=", rx336_pos)
    .return (rx336_cur)
  rx336_fail:
.annotate 'line', 3
    (rx336_rep, rx336_pos, $I10, $P10) = rx336_cur."!mark_fail"(0)
    lt rx336_pos, -1, rx336_done
    eq rx336_pos, -1, rx336_fail
    jump $I10
  rx336_done:
    rx336_cur."!cursor_fail"()
    rx336_cur."!cursor_debug"("FAIL  ", "backslash:sym<w>")
    .return (rx336_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<w>"  :subid("94_1274564774.16047") :method
.annotate 'line', 3
    new $P338, "ResizablePMCArray"
    push $P338, "N"
    push $P338, "W"
    push $P338, "S"
    push $P338, "D"
    push $P338, "n"
    push $P338, "w"
    push $P338, "s"
    push $P338, "d"
    .return ($P338)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<b>"  :subid("95_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx342_tgt
    .local int rx342_pos
    .local int rx342_off
    .local int rx342_eos
    .local int rx342_rep
    .local pmc rx342_cur
    (rx342_cur, rx342_pos, rx342_tgt) = self."!cursor_start"()
    rx342_cur."!cursor_debug"("START ", "backslash:sym<b>")
    .lex unicode:"$\x{a2}", rx342_cur
    .local pmc match
    .lex "$/", match
    length rx342_eos, rx342_tgt
    set rx342_off, 0
    lt rx342_pos, 2, rx342_start
    sub rx342_off, rx342_pos, 1
    substr rx342_tgt, rx342_tgt, rx342_off
  rx342_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan345_done
    goto rxscan345_scan
  rxscan345_loop:
    ($P10) = rx342_cur."from"()
    inc $P10
    set rx342_pos, $P10
    ge rx342_pos, rx342_eos, rxscan345_done
  rxscan345_scan:
    set_addr $I10, rxscan345_loop
    rx342_cur."!mark_push"(0, rx342_pos, $I10)
  rxscan345_done:
.annotate 'line', 122
  # rx subcapture "sym"
    set_addr $I10, rxcap_346_fail
    rx342_cur."!mark_push"(0, rx342_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx342_pos, rx342_eos, rx342_fail
    sub $I10, rx342_pos, rx342_off
    substr $S10, rx342_tgt, $I10, 1
    index $I11, "bB", $S10
    lt $I11, 0, rx342_fail
    inc rx342_pos
    set_addr $I10, rxcap_346_fail
    ($I12, $I11) = rx342_cur."!mark_peek"($I10)
    rx342_cur."!cursor_pos"($I11)
    ($P10) = rx342_cur."!cursor_start"()
    $P10."!cursor_pass"(rx342_pos, "")
    rx342_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_346_done
  rxcap_346_fail:
    goto rx342_fail
  rxcap_346_done:
  # rx pass
    rx342_cur."!cursor_pass"(rx342_pos, "backslash:sym<b>")
    rx342_cur."!cursor_debug"("PASS  ", "backslash:sym<b>", " at pos=", rx342_pos)
    .return (rx342_cur)
  rx342_fail:
.annotate 'line', 3
    (rx342_rep, rx342_pos, $I10, $P10) = rx342_cur."!mark_fail"(0)
    lt rx342_pos, -1, rx342_done
    eq rx342_pos, -1, rx342_fail
    jump $I10
  rx342_done:
    rx342_cur."!cursor_fail"()
    rx342_cur."!cursor_debug"("FAIL  ", "backslash:sym<b>")
    .return (rx342_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<b>"  :subid("96_1274564774.16047") :method
.annotate 'line', 3
    new $P344, "ResizablePMCArray"
    push $P344, "B"
    push $P344, "b"
    .return ($P344)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<e>"  :subid("97_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx348_tgt
    .local int rx348_pos
    .local int rx348_off
    .local int rx348_eos
    .local int rx348_rep
    .local pmc rx348_cur
    (rx348_cur, rx348_pos, rx348_tgt) = self."!cursor_start"()
    rx348_cur."!cursor_debug"("START ", "backslash:sym<e>")
    .lex unicode:"$\x{a2}", rx348_cur
    .local pmc match
    .lex "$/", match
    length rx348_eos, rx348_tgt
    set rx348_off, 0
    lt rx348_pos, 2, rx348_start
    sub rx348_off, rx348_pos, 1
    substr rx348_tgt, rx348_tgt, rx348_off
  rx348_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan351_done
    goto rxscan351_scan
  rxscan351_loop:
    ($P10) = rx348_cur."from"()
    inc $P10
    set rx348_pos, $P10
    ge rx348_pos, rx348_eos, rxscan351_done
  rxscan351_scan:
    set_addr $I10, rxscan351_loop
    rx348_cur."!mark_push"(0, rx348_pos, $I10)
  rxscan351_done:
.annotate 'line', 123
  # rx subcapture "sym"
    set_addr $I10, rxcap_352_fail
    rx348_cur."!mark_push"(0, rx348_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx348_pos, rx348_eos, rx348_fail
    sub $I10, rx348_pos, rx348_off
    substr $S10, rx348_tgt, $I10, 1
    index $I11, "eE", $S10
    lt $I11, 0, rx348_fail
    inc rx348_pos
    set_addr $I10, rxcap_352_fail
    ($I12, $I11) = rx348_cur."!mark_peek"($I10)
    rx348_cur."!cursor_pos"($I11)
    ($P10) = rx348_cur."!cursor_start"()
    $P10."!cursor_pass"(rx348_pos, "")
    rx348_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_352_done
  rxcap_352_fail:
    goto rx348_fail
  rxcap_352_done:
  # rx pass
    rx348_cur."!cursor_pass"(rx348_pos, "backslash:sym<e>")
    rx348_cur."!cursor_debug"("PASS  ", "backslash:sym<e>", " at pos=", rx348_pos)
    .return (rx348_cur)
  rx348_fail:
.annotate 'line', 3
    (rx348_rep, rx348_pos, $I10, $P10) = rx348_cur."!mark_fail"(0)
    lt rx348_pos, -1, rx348_done
    eq rx348_pos, -1, rx348_fail
    jump $I10
  rx348_done:
    rx348_cur."!cursor_fail"()
    rx348_cur."!cursor_debug"("FAIL  ", "backslash:sym<e>")
    .return (rx348_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<e>"  :subid("98_1274564774.16047") :method
.annotate 'line', 3
    new $P350, "ResizablePMCArray"
    push $P350, "E"
    push $P350, "e"
    .return ($P350)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<f>"  :subid("99_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx354_tgt
    .local int rx354_pos
    .local int rx354_off
    .local int rx354_eos
    .local int rx354_rep
    .local pmc rx354_cur
    (rx354_cur, rx354_pos, rx354_tgt) = self."!cursor_start"()
    rx354_cur."!cursor_debug"("START ", "backslash:sym<f>")
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
.annotate 'line', 124
  # rx subcapture "sym"
    set_addr $I10, rxcap_358_fail
    rx354_cur."!mark_push"(0, rx354_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx354_pos, rx354_eos, rx354_fail
    sub $I10, rx354_pos, rx354_off
    substr $S10, rx354_tgt, $I10, 1
    index $I11, "fF", $S10
    lt $I11, 0, rx354_fail
    inc rx354_pos
    set_addr $I10, rxcap_358_fail
    ($I12, $I11) = rx354_cur."!mark_peek"($I10)
    rx354_cur."!cursor_pos"($I11)
    ($P10) = rx354_cur."!cursor_start"()
    $P10."!cursor_pass"(rx354_pos, "")
    rx354_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_358_done
  rxcap_358_fail:
    goto rx354_fail
  rxcap_358_done:
  # rx pass
    rx354_cur."!cursor_pass"(rx354_pos, "backslash:sym<f>")
    rx354_cur."!cursor_debug"("PASS  ", "backslash:sym<f>", " at pos=", rx354_pos)
    .return (rx354_cur)
  rx354_fail:
.annotate 'line', 3
    (rx354_rep, rx354_pos, $I10, $P10) = rx354_cur."!mark_fail"(0)
    lt rx354_pos, -1, rx354_done
    eq rx354_pos, -1, rx354_fail
    jump $I10
  rx354_done:
    rx354_cur."!cursor_fail"()
    rx354_cur."!cursor_debug"("FAIL  ", "backslash:sym<f>")
    .return (rx354_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<f>"  :subid("100_1274564774.16047") :method
.annotate 'line', 3
    new $P356, "ResizablePMCArray"
    push $P356, "F"
    push $P356, "f"
    .return ($P356)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<h>"  :subid("101_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx360_tgt
    .local int rx360_pos
    .local int rx360_off
    .local int rx360_eos
    .local int rx360_rep
    .local pmc rx360_cur
    (rx360_cur, rx360_pos, rx360_tgt) = self."!cursor_start"()
    rx360_cur."!cursor_debug"("START ", "backslash:sym<h>")
    .lex unicode:"$\x{a2}", rx360_cur
    .local pmc match
    .lex "$/", match
    length rx360_eos, rx360_tgt
    set rx360_off, 0
    lt rx360_pos, 2, rx360_start
    sub rx360_off, rx360_pos, 1
    substr rx360_tgt, rx360_tgt, rx360_off
  rx360_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan363_done
    goto rxscan363_scan
  rxscan363_loop:
    ($P10) = rx360_cur."from"()
    inc $P10
    set rx360_pos, $P10
    ge rx360_pos, rx360_eos, rxscan363_done
  rxscan363_scan:
    set_addr $I10, rxscan363_loop
    rx360_cur."!mark_push"(0, rx360_pos, $I10)
  rxscan363_done:
.annotate 'line', 125
  # rx subcapture "sym"
    set_addr $I10, rxcap_364_fail
    rx360_cur."!mark_push"(0, rx360_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx360_pos, rx360_eos, rx360_fail
    sub $I10, rx360_pos, rx360_off
    substr $S10, rx360_tgt, $I10, 1
    index $I11, "hH", $S10
    lt $I11, 0, rx360_fail
    inc rx360_pos
    set_addr $I10, rxcap_364_fail
    ($I12, $I11) = rx360_cur."!mark_peek"($I10)
    rx360_cur."!cursor_pos"($I11)
    ($P10) = rx360_cur."!cursor_start"()
    $P10."!cursor_pass"(rx360_pos, "")
    rx360_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_364_done
  rxcap_364_fail:
    goto rx360_fail
  rxcap_364_done:
  # rx pass
    rx360_cur."!cursor_pass"(rx360_pos, "backslash:sym<h>")
    rx360_cur."!cursor_debug"("PASS  ", "backslash:sym<h>", " at pos=", rx360_pos)
    .return (rx360_cur)
  rx360_fail:
.annotate 'line', 3
    (rx360_rep, rx360_pos, $I10, $P10) = rx360_cur."!mark_fail"(0)
    lt rx360_pos, -1, rx360_done
    eq rx360_pos, -1, rx360_fail
    jump $I10
  rx360_done:
    rx360_cur."!cursor_fail"()
    rx360_cur."!cursor_debug"("FAIL  ", "backslash:sym<h>")
    .return (rx360_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<h>"  :subid("102_1274564774.16047") :method
.annotate 'line', 3
    new $P362, "ResizablePMCArray"
    push $P362, "H"
    push $P362, "h"
    .return ($P362)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<r>"  :subid("103_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx366_tgt
    .local int rx366_pos
    .local int rx366_off
    .local int rx366_eos
    .local int rx366_rep
    .local pmc rx366_cur
    (rx366_cur, rx366_pos, rx366_tgt) = self."!cursor_start"()
    rx366_cur."!cursor_debug"("START ", "backslash:sym<r>")
    .lex unicode:"$\x{a2}", rx366_cur
    .local pmc match
    .lex "$/", match
    length rx366_eos, rx366_tgt
    set rx366_off, 0
    lt rx366_pos, 2, rx366_start
    sub rx366_off, rx366_pos, 1
    substr rx366_tgt, rx366_tgt, rx366_off
  rx366_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan369_done
    goto rxscan369_scan
  rxscan369_loop:
    ($P10) = rx366_cur."from"()
    inc $P10
    set rx366_pos, $P10
    ge rx366_pos, rx366_eos, rxscan369_done
  rxscan369_scan:
    set_addr $I10, rxscan369_loop
    rx366_cur."!mark_push"(0, rx366_pos, $I10)
  rxscan369_done:
.annotate 'line', 126
  # rx subcapture "sym"
    set_addr $I10, rxcap_370_fail
    rx366_cur."!mark_push"(0, rx366_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx366_pos, rx366_eos, rx366_fail
    sub $I10, rx366_pos, rx366_off
    substr $S10, rx366_tgt, $I10, 1
    index $I11, "rR", $S10
    lt $I11, 0, rx366_fail
    inc rx366_pos
    set_addr $I10, rxcap_370_fail
    ($I12, $I11) = rx366_cur."!mark_peek"($I10)
    rx366_cur."!cursor_pos"($I11)
    ($P10) = rx366_cur."!cursor_start"()
    $P10."!cursor_pass"(rx366_pos, "")
    rx366_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_370_done
  rxcap_370_fail:
    goto rx366_fail
  rxcap_370_done:
  # rx pass
    rx366_cur."!cursor_pass"(rx366_pos, "backslash:sym<r>")
    rx366_cur."!cursor_debug"("PASS  ", "backslash:sym<r>", " at pos=", rx366_pos)
    .return (rx366_cur)
  rx366_fail:
.annotate 'line', 3
    (rx366_rep, rx366_pos, $I10, $P10) = rx366_cur."!mark_fail"(0)
    lt rx366_pos, -1, rx366_done
    eq rx366_pos, -1, rx366_fail
    jump $I10
  rx366_done:
    rx366_cur."!cursor_fail"()
    rx366_cur."!cursor_debug"("FAIL  ", "backslash:sym<r>")
    .return (rx366_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<r>"  :subid("104_1274564774.16047") :method
.annotate 'line', 3
    new $P368, "ResizablePMCArray"
    push $P368, "R"
    push $P368, "r"
    .return ($P368)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<t>"  :subid("105_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx372_tgt
    .local int rx372_pos
    .local int rx372_off
    .local int rx372_eos
    .local int rx372_rep
    .local pmc rx372_cur
    (rx372_cur, rx372_pos, rx372_tgt) = self."!cursor_start"()
    rx372_cur."!cursor_debug"("START ", "backslash:sym<t>")
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
.annotate 'line', 127
  # rx subcapture "sym"
    set_addr $I10, rxcap_376_fail
    rx372_cur."!mark_push"(0, rx372_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx372_pos, rx372_eos, rx372_fail
    sub $I10, rx372_pos, rx372_off
    substr $S10, rx372_tgt, $I10, 1
    index $I11, "tT", $S10
    lt $I11, 0, rx372_fail
    inc rx372_pos
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
  # rx pass
    rx372_cur."!cursor_pass"(rx372_pos, "backslash:sym<t>")
    rx372_cur."!cursor_debug"("PASS  ", "backslash:sym<t>", " at pos=", rx372_pos)
    .return (rx372_cur)
  rx372_fail:
.annotate 'line', 3
    (rx372_rep, rx372_pos, $I10, $P10) = rx372_cur."!mark_fail"(0)
    lt rx372_pos, -1, rx372_done
    eq rx372_pos, -1, rx372_fail
    jump $I10
  rx372_done:
    rx372_cur."!cursor_fail"()
    rx372_cur."!cursor_debug"("FAIL  ", "backslash:sym<t>")
    .return (rx372_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<t>"  :subid("106_1274564774.16047") :method
.annotate 'line', 3
    new $P374, "ResizablePMCArray"
    push $P374, "T"
    push $P374, "t"
    .return ($P374)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<v>"  :subid("107_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx378_tgt
    .local int rx378_pos
    .local int rx378_off
    .local int rx378_eos
    .local int rx378_rep
    .local pmc rx378_cur
    (rx378_cur, rx378_pos, rx378_tgt) = self."!cursor_start"()
    rx378_cur."!cursor_debug"("START ", "backslash:sym<v>")
    .lex unicode:"$\x{a2}", rx378_cur
    .local pmc match
    .lex "$/", match
    length rx378_eos, rx378_tgt
    set rx378_off, 0
    lt rx378_pos, 2, rx378_start
    sub rx378_off, rx378_pos, 1
    substr rx378_tgt, rx378_tgt, rx378_off
  rx378_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan381_done
    goto rxscan381_scan
  rxscan381_loop:
    ($P10) = rx378_cur."from"()
    inc $P10
    set rx378_pos, $P10
    ge rx378_pos, rx378_eos, rxscan381_done
  rxscan381_scan:
    set_addr $I10, rxscan381_loop
    rx378_cur."!mark_push"(0, rx378_pos, $I10)
  rxscan381_done:
.annotate 'line', 128
  # rx subcapture "sym"
    set_addr $I10, rxcap_382_fail
    rx378_cur."!mark_push"(0, rx378_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx378_pos, rx378_eos, rx378_fail
    sub $I10, rx378_pos, rx378_off
    substr $S10, rx378_tgt, $I10, 1
    index $I11, "vV", $S10
    lt $I11, 0, rx378_fail
    inc rx378_pos
    set_addr $I10, rxcap_382_fail
    ($I12, $I11) = rx378_cur."!mark_peek"($I10)
    rx378_cur."!cursor_pos"($I11)
    ($P10) = rx378_cur."!cursor_start"()
    $P10."!cursor_pass"(rx378_pos, "")
    rx378_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_382_done
  rxcap_382_fail:
    goto rx378_fail
  rxcap_382_done:
  # rx pass
    rx378_cur."!cursor_pass"(rx378_pos, "backslash:sym<v>")
    rx378_cur."!cursor_debug"("PASS  ", "backslash:sym<v>", " at pos=", rx378_pos)
    .return (rx378_cur)
  rx378_fail:
.annotate 'line', 3
    (rx378_rep, rx378_pos, $I10, $P10) = rx378_cur."!mark_fail"(0)
    lt rx378_pos, -1, rx378_done
    eq rx378_pos, -1, rx378_fail
    jump $I10
  rx378_done:
    rx378_cur."!cursor_fail"()
    rx378_cur."!cursor_debug"("FAIL  ", "backslash:sym<v>")
    .return (rx378_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<v>"  :subid("108_1274564774.16047") :method
.annotate 'line', 3
    new $P380, "ResizablePMCArray"
    push $P380, "V"
    push $P380, "v"
    .return ($P380)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<o>"  :subid("109_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx384_tgt
    .local int rx384_pos
    .local int rx384_off
    .local int rx384_eos
    .local int rx384_rep
    .local pmc rx384_cur
    (rx384_cur, rx384_pos, rx384_tgt) = self."!cursor_start"()
    rx384_cur."!cursor_debug"("START ", "backslash:sym<o>")
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
    ne $I10, -1, rxscan391_done
    goto rxscan391_scan
  rxscan391_loop:
    ($P10) = rx384_cur."from"()
    inc $P10
    set rx384_pos, $P10
    ge rx384_pos, rx384_eos, rxscan391_done
  rxscan391_scan:
    set_addr $I10, rxscan391_loop
    rx384_cur."!mark_push"(0, rx384_pos, $I10)
  rxscan391_done:
.annotate 'line', 129
  # rx subcapture "sym"
    set_addr $I10, rxcap_392_fail
    rx384_cur."!mark_push"(0, rx384_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx384_pos, rx384_eos, rx384_fail
    sub $I10, rx384_pos, rx384_off
    substr $S10, rx384_tgt, $I10, 1
    index $I11, "oO", $S10
    lt $I11, 0, rx384_fail
    inc rx384_pos
    set_addr $I10, rxcap_392_fail
    ($I12, $I11) = rx384_cur."!mark_peek"($I10)
    rx384_cur."!cursor_pos"($I11)
    ($P10) = rx384_cur."!cursor_start"()
    $P10."!cursor_pass"(rx384_pos, "")
    rx384_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_392_done
  rxcap_392_fail:
    goto rx384_fail
  rxcap_392_done:
  alt393_0:
    set_addr $I10, alt393_1
    rx384_cur."!mark_push"(0, rx384_pos, $I10)
  # rx subrule "octint" subtype=capture negate=
    rx384_cur."!cursor_pos"(rx384_pos)
    $P10 = rx384_cur."octint"()
    unless $P10, rx384_fail
    rx384_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octint")
    rx384_pos = $P10."pos"()
    goto alt393_end
  alt393_1:
  # rx literal  "["
    add $I11, rx384_pos, 1
    gt $I11, rx384_eos, rx384_fail
    sub $I11, rx384_pos, rx384_off
    substr $S10, rx384_tgt, $I11, 1
    ne $S10, "[", rx384_fail
    add rx384_pos, 1
  # rx subrule "octints" subtype=capture negate=
    rx384_cur."!cursor_pos"(rx384_pos)
    $P10 = rx384_cur."octints"()
    unless $P10, rx384_fail
    rx384_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octints")
    rx384_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx384_pos, 1
    gt $I11, rx384_eos, rx384_fail
    sub $I11, rx384_pos, rx384_off
    substr $S10, rx384_tgt, $I11, 1
    ne $S10, "]", rx384_fail
    add rx384_pos, 1
  alt393_end:
  # rx pass
    rx384_cur."!cursor_pass"(rx384_pos, "backslash:sym<o>")
    rx384_cur."!cursor_debug"("PASS  ", "backslash:sym<o>", " at pos=", rx384_pos)
    .return (rx384_cur)
  rx384_fail:
.annotate 'line', 3
    (rx384_rep, rx384_pos, $I10, $P10) = rx384_cur."!mark_fail"(0)
    lt rx384_pos, -1, rx384_done
    eq rx384_pos, -1, rx384_fail
    jump $I10
  rx384_done:
    rx384_cur."!cursor_fail"()
    rx384_cur."!cursor_debug"("FAIL  ", "backslash:sym<o>")
    .return (rx384_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<o>"  :subid("110_1274564774.16047") :method
.annotate 'line', 3
    $P386 = self."!PREFIX__!subrule"("octints", "O[")
    $P387 = self."!PREFIX__!subrule"("octint", "O")
    $P388 = self."!PREFIX__!subrule"("octints", "o[")
    $P389 = self."!PREFIX__!subrule"("octint", "o")
    new $P390, "ResizablePMCArray"
    push $P390, $P386
    push $P390, $P387
    push $P390, $P388
    push $P390, $P389
    .return ($P390)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<x>"  :subid("111_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx395_tgt
    .local int rx395_pos
    .local int rx395_off
    .local int rx395_eos
    .local int rx395_rep
    .local pmc rx395_cur
    (rx395_cur, rx395_pos, rx395_tgt) = self."!cursor_start"()
    rx395_cur."!cursor_debug"("START ", "backslash:sym<x>")
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
    ne $I10, -1, rxscan402_done
    goto rxscan402_scan
  rxscan402_loop:
    ($P10) = rx395_cur."from"()
    inc $P10
    set rx395_pos, $P10
    ge rx395_pos, rx395_eos, rxscan402_done
  rxscan402_scan:
    set_addr $I10, rxscan402_loop
    rx395_cur."!mark_push"(0, rx395_pos, $I10)
  rxscan402_done:
.annotate 'line', 130
  # rx subcapture "sym"
    set_addr $I10, rxcap_403_fail
    rx395_cur."!mark_push"(0, rx395_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx395_pos, rx395_eos, rx395_fail
    sub $I10, rx395_pos, rx395_off
    substr $S10, rx395_tgt, $I10, 1
    index $I11, "xX", $S10
    lt $I11, 0, rx395_fail
    inc rx395_pos
    set_addr $I10, rxcap_403_fail
    ($I12, $I11) = rx395_cur."!mark_peek"($I10)
    rx395_cur."!cursor_pos"($I11)
    ($P10) = rx395_cur."!cursor_start"()
    $P10."!cursor_pass"(rx395_pos, "")
    rx395_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_403_done
  rxcap_403_fail:
    goto rx395_fail
  rxcap_403_done:
  alt404_0:
    set_addr $I10, alt404_1
    rx395_cur."!mark_push"(0, rx395_pos, $I10)
  # rx subrule "hexint" subtype=capture negate=
    rx395_cur."!cursor_pos"(rx395_pos)
    $P10 = rx395_cur."hexint"()
    unless $P10, rx395_fail
    rx395_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexint")
    rx395_pos = $P10."pos"()
    goto alt404_end
  alt404_1:
  # rx literal  "["
    add $I11, rx395_pos, 1
    gt $I11, rx395_eos, rx395_fail
    sub $I11, rx395_pos, rx395_off
    substr $S10, rx395_tgt, $I11, 1
    ne $S10, "[", rx395_fail
    add rx395_pos, 1
  # rx subrule "hexints" subtype=capture negate=
    rx395_cur."!cursor_pos"(rx395_pos)
    $P10 = rx395_cur."hexints"()
    unless $P10, rx395_fail
    rx395_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexints")
    rx395_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx395_pos, 1
    gt $I11, rx395_eos, rx395_fail
    sub $I11, rx395_pos, rx395_off
    substr $S10, rx395_tgt, $I11, 1
    ne $S10, "]", rx395_fail
    add rx395_pos, 1
  alt404_end:
  # rx pass
    rx395_cur."!cursor_pass"(rx395_pos, "backslash:sym<x>")
    rx395_cur."!cursor_debug"("PASS  ", "backslash:sym<x>", " at pos=", rx395_pos)
    .return (rx395_cur)
  rx395_fail:
.annotate 'line', 3
    (rx395_rep, rx395_pos, $I10, $P10) = rx395_cur."!mark_fail"(0)
    lt rx395_pos, -1, rx395_done
    eq rx395_pos, -1, rx395_fail
    jump $I10
  rx395_done:
    rx395_cur."!cursor_fail"()
    rx395_cur."!cursor_debug"("FAIL  ", "backslash:sym<x>")
    .return (rx395_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<x>"  :subid("112_1274564774.16047") :method
.annotate 'line', 3
    $P397 = self."!PREFIX__!subrule"("hexints", "X[")
    $P398 = self."!PREFIX__!subrule"("hexint", "X")
    $P399 = self."!PREFIX__!subrule"("hexints", "x[")
    $P400 = self."!PREFIX__!subrule"("hexint", "x")
    new $P401, "ResizablePMCArray"
    push $P401, $P397
    push $P401, $P398
    push $P401, $P399
    push $P401, $P400
    .return ($P401)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<c>"  :subid("113_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx406_tgt
    .local int rx406_pos
    .local int rx406_off
    .local int rx406_eos
    .local int rx406_rep
    .local pmc rx406_cur
    (rx406_cur, rx406_pos, rx406_tgt) = self."!cursor_start"()
    rx406_cur."!cursor_debug"("START ", "backslash:sym<c>")
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
    ne $I10, -1, rxscan411_done
    goto rxscan411_scan
  rxscan411_loop:
    ($P10) = rx406_cur."from"()
    inc $P10
    set rx406_pos, $P10
    ge rx406_pos, rx406_eos, rxscan411_done
  rxscan411_scan:
    set_addr $I10, rxscan411_loop
    rx406_cur."!mark_push"(0, rx406_pos, $I10)
  rxscan411_done:
.annotate 'line', 131
  # rx subcapture "sym"
    set_addr $I10, rxcap_412_fail
    rx406_cur."!mark_push"(0, rx406_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx406_pos, rx406_eos, rx406_fail
    sub $I10, rx406_pos, rx406_off
    substr $S10, rx406_tgt, $I10, 1
    index $I11, "cC", $S10
    lt $I11, 0, rx406_fail
    inc rx406_pos
    set_addr $I10, rxcap_412_fail
    ($I12, $I11) = rx406_cur."!mark_peek"($I10)
    rx406_cur."!cursor_pos"($I11)
    ($P10) = rx406_cur."!cursor_start"()
    $P10."!cursor_pass"(rx406_pos, "")
    rx406_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_412_done
  rxcap_412_fail:
    goto rx406_fail
  rxcap_412_done:
  # rx subrule "charspec" subtype=capture negate=
    rx406_cur."!cursor_pos"(rx406_pos)
    $P10 = rx406_cur."charspec"()
    unless $P10, rx406_fail
    rx406_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charspec")
    rx406_pos = $P10."pos"()
  # rx pass
    rx406_cur."!cursor_pass"(rx406_pos, "backslash:sym<c>")
    rx406_cur."!cursor_debug"("PASS  ", "backslash:sym<c>", " at pos=", rx406_pos)
    .return (rx406_cur)
  rx406_fail:
.annotate 'line', 3
    (rx406_rep, rx406_pos, $I10, $P10) = rx406_cur."!mark_fail"(0)
    lt rx406_pos, -1, rx406_done
    eq rx406_pos, -1, rx406_fail
    jump $I10
  rx406_done:
    rx406_cur."!cursor_fail"()
    rx406_cur."!cursor_debug"("FAIL  ", "backslash:sym<c>")
    .return (rx406_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<c>"  :subid("114_1274564774.16047") :method
.annotate 'line', 3
    $P408 = self."!PREFIX__!subrule"("charspec", "C")
    $P409 = self."!PREFIX__!subrule"("charspec", "c")
    new $P410, "ResizablePMCArray"
    push $P410, $P408
    push $P410, $P409
    .return ($P410)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<A>"  :subid("115_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx414_tgt
    .local int rx414_pos
    .local int rx414_off
    .local int rx414_eos
    .local int rx414_rep
    .local pmc rx414_cur
    (rx414_cur, rx414_pos, rx414_tgt) = self."!cursor_start"()
    rx414_cur."!cursor_debug"("START ", "backslash:sym<A>")
    .lex unicode:"$\x{a2}", rx414_cur
    .local pmc match
    .lex "$/", match
    length rx414_eos, rx414_tgt
    set rx414_off, 0
    lt rx414_pos, 2, rx414_start
    sub rx414_off, rx414_pos, 1
    substr rx414_tgt, rx414_tgt, rx414_off
  rx414_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan418_done
    goto rxscan418_scan
  rxscan418_loop:
    ($P10) = rx414_cur."from"()
    inc $P10
    set rx414_pos, $P10
    ge rx414_pos, rx414_eos, rxscan418_done
  rxscan418_scan:
    set_addr $I10, rxscan418_loop
    rx414_cur."!mark_push"(0, rx414_pos, $I10)
  rxscan418_done:
.annotate 'line', 132
  # rx literal  "A"
    add $I11, rx414_pos, 1
    gt $I11, rx414_eos, rx414_fail
    sub $I11, rx414_pos, rx414_off
    substr $S10, rx414_tgt, $I11, 1
    ne $S10, "A", rx414_fail
    add rx414_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx414_cur."!cursor_pos"(rx414_pos)
    $P10 = rx414_cur."obs"("\\A as beginning-of-string matcher", "^")
    unless $P10, rx414_fail
    rx414_pos = $P10."pos"()
  # rx pass
    rx414_cur."!cursor_pass"(rx414_pos, "backslash:sym<A>")
    rx414_cur."!cursor_debug"("PASS  ", "backslash:sym<A>", " at pos=", rx414_pos)
    .return (rx414_cur)
  rx414_fail:
.annotate 'line', 3
    (rx414_rep, rx414_pos, $I10, $P10) = rx414_cur."!mark_fail"(0)
    lt rx414_pos, -1, rx414_done
    eq rx414_pos, -1, rx414_fail
    jump $I10
  rx414_done:
    rx414_cur."!cursor_fail"()
    rx414_cur."!cursor_debug"("FAIL  ", "backslash:sym<A>")
    .return (rx414_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<A>"  :subid("116_1274564774.16047") :method
.annotate 'line', 3
    $P416 = self."!PREFIX__!subrule"("", "A")
    new $P417, "ResizablePMCArray"
    push $P417, $P416
    .return ($P417)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<z>"  :subid("117_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx420_tgt
    .local int rx420_pos
    .local int rx420_off
    .local int rx420_eos
    .local int rx420_rep
    .local pmc rx420_cur
    (rx420_cur, rx420_pos, rx420_tgt) = self."!cursor_start"()
    rx420_cur."!cursor_debug"("START ", "backslash:sym<z>")
    .lex unicode:"$\x{a2}", rx420_cur
    .local pmc match
    .lex "$/", match
    length rx420_eos, rx420_tgt
    set rx420_off, 0
    lt rx420_pos, 2, rx420_start
    sub rx420_off, rx420_pos, 1
    substr rx420_tgt, rx420_tgt, rx420_off
  rx420_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan424_done
    goto rxscan424_scan
  rxscan424_loop:
    ($P10) = rx420_cur."from"()
    inc $P10
    set rx420_pos, $P10
    ge rx420_pos, rx420_eos, rxscan424_done
  rxscan424_scan:
    set_addr $I10, rxscan424_loop
    rx420_cur."!mark_push"(0, rx420_pos, $I10)
  rxscan424_done:
.annotate 'line', 133
  # rx literal  "z"
    add $I11, rx420_pos, 1
    gt $I11, rx420_eos, rx420_fail
    sub $I11, rx420_pos, rx420_off
    substr $S10, rx420_tgt, $I11, 1
    ne $S10, "z", rx420_fail
    add rx420_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx420_cur."!cursor_pos"(rx420_pos)
    $P10 = rx420_cur."obs"("\\z as end-of-string matcher", "$")
    unless $P10, rx420_fail
    rx420_pos = $P10."pos"()
  # rx pass
    rx420_cur."!cursor_pass"(rx420_pos, "backslash:sym<z>")
    rx420_cur."!cursor_debug"("PASS  ", "backslash:sym<z>", " at pos=", rx420_pos)
    .return (rx420_cur)
  rx420_fail:
.annotate 'line', 3
    (rx420_rep, rx420_pos, $I10, $P10) = rx420_cur."!mark_fail"(0)
    lt rx420_pos, -1, rx420_done
    eq rx420_pos, -1, rx420_fail
    jump $I10
  rx420_done:
    rx420_cur."!cursor_fail"()
    rx420_cur."!cursor_debug"("FAIL  ", "backslash:sym<z>")
    .return (rx420_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<z>"  :subid("118_1274564774.16047") :method
.annotate 'line', 3
    $P422 = self."!PREFIX__!subrule"("", "z")
    new $P423, "ResizablePMCArray"
    push $P423, $P422
    .return ($P423)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Z>"  :subid("119_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx426_tgt
    .local int rx426_pos
    .local int rx426_off
    .local int rx426_eos
    .local int rx426_rep
    .local pmc rx426_cur
    (rx426_cur, rx426_pos, rx426_tgt) = self."!cursor_start"()
    rx426_cur."!cursor_debug"("START ", "backslash:sym<Z>")
    .lex unicode:"$\x{a2}", rx426_cur
    .local pmc match
    .lex "$/", match
    length rx426_eos, rx426_tgt
    set rx426_off, 0
    lt rx426_pos, 2, rx426_start
    sub rx426_off, rx426_pos, 1
    substr rx426_tgt, rx426_tgt, rx426_off
  rx426_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan430_done
    goto rxscan430_scan
  rxscan430_loop:
    ($P10) = rx426_cur."from"()
    inc $P10
    set rx426_pos, $P10
    ge rx426_pos, rx426_eos, rxscan430_done
  rxscan430_scan:
    set_addr $I10, rxscan430_loop
    rx426_cur."!mark_push"(0, rx426_pos, $I10)
  rxscan430_done:
.annotate 'line', 134
  # rx literal  "Z"
    add $I11, rx426_pos, 1
    gt $I11, rx426_eos, rx426_fail
    sub $I11, rx426_pos, rx426_off
    substr $S10, rx426_tgt, $I11, 1
    ne $S10, "Z", rx426_fail
    add rx426_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx426_cur."!cursor_pos"(rx426_pos)
    $P10 = rx426_cur."obs"("\\Z as end-of-string matcher", "\\n?$")
    unless $P10, rx426_fail
    rx426_pos = $P10."pos"()
  # rx pass
    rx426_cur."!cursor_pass"(rx426_pos, "backslash:sym<Z>")
    rx426_cur."!cursor_debug"("PASS  ", "backslash:sym<Z>", " at pos=", rx426_pos)
    .return (rx426_cur)
  rx426_fail:
.annotate 'line', 3
    (rx426_rep, rx426_pos, $I10, $P10) = rx426_cur."!mark_fail"(0)
    lt rx426_pos, -1, rx426_done
    eq rx426_pos, -1, rx426_fail
    jump $I10
  rx426_done:
    rx426_cur."!cursor_fail"()
    rx426_cur."!cursor_debug"("FAIL  ", "backslash:sym<Z>")
    .return (rx426_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<Z>"  :subid("120_1274564774.16047") :method
.annotate 'line', 3
    $P428 = self."!PREFIX__!subrule"("", "Z")
    new $P429, "ResizablePMCArray"
    push $P429, $P428
    .return ($P429)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Q>"  :subid("121_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx432_tgt
    .local int rx432_pos
    .local int rx432_off
    .local int rx432_eos
    .local int rx432_rep
    .local pmc rx432_cur
    (rx432_cur, rx432_pos, rx432_tgt) = self."!cursor_start"()
    rx432_cur."!cursor_debug"("START ", "backslash:sym<Q>")
    .lex unicode:"$\x{a2}", rx432_cur
    .local pmc match
    .lex "$/", match
    length rx432_eos, rx432_tgt
    set rx432_off, 0
    lt rx432_pos, 2, rx432_start
    sub rx432_off, rx432_pos, 1
    substr rx432_tgt, rx432_tgt, rx432_off
  rx432_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan436_done
    goto rxscan436_scan
  rxscan436_loop:
    ($P10) = rx432_cur."from"()
    inc $P10
    set rx432_pos, $P10
    ge rx432_pos, rx432_eos, rxscan436_done
  rxscan436_scan:
    set_addr $I10, rxscan436_loop
    rx432_cur."!mark_push"(0, rx432_pos, $I10)
  rxscan436_done:
.annotate 'line', 135
  # rx literal  "Q"
    add $I11, rx432_pos, 1
    gt $I11, rx432_eos, rx432_fail
    sub $I11, rx432_pos, rx432_off
    substr $S10, rx432_tgt, $I11, 1
    ne $S10, "Q", rx432_fail
    add rx432_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx432_cur."!cursor_pos"(rx432_pos)
    $P10 = rx432_cur."obs"("\\Q as quotemeta", "quotes or literal variable match")
    unless $P10, rx432_fail
    rx432_pos = $P10."pos"()
  # rx pass
    rx432_cur."!cursor_pass"(rx432_pos, "backslash:sym<Q>")
    rx432_cur."!cursor_debug"("PASS  ", "backslash:sym<Q>", " at pos=", rx432_pos)
    .return (rx432_cur)
  rx432_fail:
.annotate 'line', 3
    (rx432_rep, rx432_pos, $I10, $P10) = rx432_cur."!mark_fail"(0)
    lt rx432_pos, -1, rx432_done
    eq rx432_pos, -1, rx432_fail
    jump $I10
  rx432_done:
    rx432_cur."!cursor_fail"()
    rx432_cur."!cursor_debug"("FAIL  ", "backslash:sym<Q>")
    .return (rx432_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<Q>"  :subid("122_1274564774.16047") :method
.annotate 'line', 3
    $P434 = self."!PREFIX__!subrule"("", "Q")
    new $P435, "ResizablePMCArray"
    push $P435, $P434
    .return ($P435)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<misc>"  :subid("123_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx438_tgt
    .local int rx438_pos
    .local int rx438_off
    .local int rx438_eos
    .local int rx438_rep
    .local pmc rx438_cur
    (rx438_cur, rx438_pos, rx438_tgt) = self."!cursor_start"()
    rx438_cur."!cursor_debug"("START ", "backslash:sym<misc>")
    .lex unicode:"$\x{a2}", rx438_cur
    .local pmc match
    .lex "$/", match
    length rx438_eos, rx438_tgt
    set rx438_off, 0
    lt rx438_pos, 2, rx438_start
    sub rx438_off, rx438_pos, 1
    substr rx438_tgt, rx438_tgt, rx438_off
  rx438_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan441_done
    goto rxscan441_scan
  rxscan441_loop:
    ($P10) = rx438_cur."from"()
    inc $P10
    set rx438_pos, $P10
    ge rx438_pos, rx438_eos, rxscan441_done
  rxscan441_scan:
    set_addr $I10, rxscan441_loop
    rx438_cur."!mark_push"(0, rx438_pos, $I10)
  rxscan441_done:
.annotate 'line', 136
  # rx charclass W
    ge rx438_pos, rx438_eos, rx438_fail
    sub $I10, rx438_pos, rx438_off
    is_cclass $I11, 8192, rx438_tgt, $I10
    if $I11, rx438_fail
    inc rx438_pos
  # rx pass
    rx438_cur."!cursor_pass"(rx438_pos, "backslash:sym<misc>")
    rx438_cur."!cursor_debug"("PASS  ", "backslash:sym<misc>", " at pos=", rx438_pos)
    .return (rx438_cur)
  rx438_fail:
.annotate 'line', 3
    (rx438_rep, rx438_pos, $I10, $P10) = rx438_cur."!mark_fail"(0)
    lt rx438_pos, -1, rx438_done
    eq rx438_pos, -1, rx438_fail
    jump $I10
  rx438_done:
    rx438_cur."!cursor_fail"()
    rx438_cur."!cursor_debug"("FAIL  ", "backslash:sym<misc>")
    .return (rx438_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<misc>"  :subid("124_1274564774.16047") :method
.annotate 'line', 3
    new $P440, "ResizablePMCArray"
    push $P440, ""
    .return ($P440)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion"  :subid("125_1274564774.16047") :method
.annotate 'line', 138
    $P443 = self."!protoregex"("assertion")
    .return ($P443)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion"  :subid("126_1274564774.16047") :method
.annotate 'line', 138
    $P445 = self."!PREFIX__!protoregex"("assertion")
    .return ($P445)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<?>"  :subid("127_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .const 'Sub' $P454 = "129_1274564774.16047" 
    capture_lex $P454
    .local string rx447_tgt
    .local int rx447_pos
    .local int rx447_off
    .local int rx447_eos
    .local int rx447_rep
    .local pmc rx447_cur
    (rx447_cur, rx447_pos, rx447_tgt) = self."!cursor_start"()
    rx447_cur."!cursor_debug"("START ", "assertion:sym<?>")
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
.annotate 'line', 140
  # rx literal  "?"
    add $I11, rx447_pos, 1
    gt $I11, rx447_eos, rx447_fail
    sub $I11, rx447_pos, rx447_off
    substr $S10, rx447_tgt, $I11, 1
    ne $S10, "?", rx447_fail
    add rx447_pos, 1
  alt452_0:
    set_addr $I10, alt452_1
    rx447_cur."!mark_push"(0, rx447_pos, $I10)
  # rx subrule "before" subtype=zerowidth negate=
    rx447_cur."!cursor_pos"(rx447_pos)
    .const 'Sub' $P454 = "129_1274564774.16047" 
    capture_lex $P454
    $P10 = rx447_cur."before"($P454)
    unless $P10, rx447_fail
    goto alt452_end
  alt452_1:
  # rx subrule "assertion" subtype=capture negate=
    rx447_cur."!cursor_pos"(rx447_pos)
    $P10 = rx447_cur."assertion"()
    unless $P10, rx447_fail
    rx447_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx447_pos = $P10."pos"()
  alt452_end:
  # rx pass
    rx447_cur."!cursor_pass"(rx447_pos, "assertion:sym<?>")
    rx447_cur."!cursor_debug"("PASS  ", "assertion:sym<?>", " at pos=", rx447_pos)
    .return (rx447_cur)
  rx447_fail:
.annotate 'line', 3
    (rx447_rep, rx447_pos, $I10, $P10) = rx447_cur."!mark_fail"(0)
    lt rx447_pos, -1, rx447_done
    eq rx447_pos, -1, rx447_fail
    jump $I10
  rx447_done:
    rx447_cur."!cursor_fail"()
    rx447_cur."!cursor_debug"("FAIL  ", "assertion:sym<?>")
    .return (rx447_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<?>"  :subid("128_1274564774.16047") :method
.annotate 'line', 3
    $P449 = self."!PREFIX__!subrule"("assertion", "?")
    new $P450, "ResizablePMCArray"
    push $P450, $P449
    push $P450, "?"
    .return ($P450)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block453"  :anon :subid("129_1274564774.16047") :method :outer("127_1274564774.16047")
.annotate 'line', 140
    .local string rx455_tgt
    .local int rx455_pos
    .local int rx455_off
    .local int rx455_eos
    .local int rx455_rep
    .local pmc rx455_cur
    (rx455_cur, rx455_pos, rx455_tgt) = self."!cursor_start"()
    rx455_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx455_cur
    .local pmc match
    .lex "$/", match
    length rx455_eos, rx455_tgt
    set rx455_off, 0
    lt rx455_pos, 2, rx455_start
    sub rx455_off, rx455_pos, 1
    substr rx455_tgt, rx455_tgt, rx455_off
  rx455_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan456_done
    goto rxscan456_scan
  rxscan456_loop:
    ($P10) = rx455_cur."from"()
    inc $P10
    set rx455_pos, $P10
    ge rx455_pos, rx455_eos, rxscan456_done
  rxscan456_scan:
    set_addr $I10, rxscan456_loop
    rx455_cur."!mark_push"(0, rx455_pos, $I10)
  rxscan456_done:
  # rx literal  ">"
    add $I11, rx455_pos, 1
    gt $I11, rx455_eos, rx455_fail
    sub $I11, rx455_pos, rx455_off
    substr $S10, rx455_tgt, $I11, 1
    ne $S10, ">", rx455_fail
    add rx455_pos, 1
  # rx pass
    rx455_cur."!cursor_pass"(rx455_pos, "")
    rx455_cur."!cursor_debug"("PASS  ", "", " at pos=", rx455_pos)
    .return (rx455_cur)
  rx455_fail:
    (rx455_rep, rx455_pos, $I10, $P10) = rx455_cur."!mark_fail"(0)
    lt rx455_pos, -1, rx455_done
    eq rx455_pos, -1, rx455_fail
    jump $I10
  rx455_done:
    rx455_cur."!cursor_fail"()
    rx455_cur."!cursor_debug"("FAIL  ", "")
    .return (rx455_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<!>"  :subid("130_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .const 'Sub' $P465 = "132_1274564774.16047" 
    capture_lex $P465
    .local string rx458_tgt
    .local int rx458_pos
    .local int rx458_off
    .local int rx458_eos
    .local int rx458_rep
    .local pmc rx458_cur
    (rx458_cur, rx458_pos, rx458_tgt) = self."!cursor_start"()
    rx458_cur."!cursor_debug"("START ", "assertion:sym<!>")
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
    ne $I10, -1, rxscan462_done
    goto rxscan462_scan
  rxscan462_loop:
    ($P10) = rx458_cur."from"()
    inc $P10
    set rx458_pos, $P10
    ge rx458_pos, rx458_eos, rxscan462_done
  rxscan462_scan:
    set_addr $I10, rxscan462_loop
    rx458_cur."!mark_push"(0, rx458_pos, $I10)
  rxscan462_done:
.annotate 'line', 141
  # rx literal  "!"
    add $I11, rx458_pos, 1
    gt $I11, rx458_eos, rx458_fail
    sub $I11, rx458_pos, rx458_off
    substr $S10, rx458_tgt, $I11, 1
    ne $S10, "!", rx458_fail
    add rx458_pos, 1
  alt463_0:
    set_addr $I10, alt463_1
    rx458_cur."!mark_push"(0, rx458_pos, $I10)
  # rx subrule "before" subtype=zerowidth negate=
    rx458_cur."!cursor_pos"(rx458_pos)
    .const 'Sub' $P465 = "132_1274564774.16047" 
    capture_lex $P465
    $P10 = rx458_cur."before"($P465)
    unless $P10, rx458_fail
    goto alt463_end
  alt463_1:
  # rx subrule "assertion" subtype=capture negate=
    rx458_cur."!cursor_pos"(rx458_pos)
    $P10 = rx458_cur."assertion"()
    unless $P10, rx458_fail
    rx458_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx458_pos = $P10."pos"()
  alt463_end:
  # rx pass
    rx458_cur."!cursor_pass"(rx458_pos, "assertion:sym<!>")
    rx458_cur."!cursor_debug"("PASS  ", "assertion:sym<!>", " at pos=", rx458_pos)
    .return (rx458_cur)
  rx458_fail:
.annotate 'line', 3
    (rx458_rep, rx458_pos, $I10, $P10) = rx458_cur."!mark_fail"(0)
    lt rx458_pos, -1, rx458_done
    eq rx458_pos, -1, rx458_fail
    jump $I10
  rx458_done:
    rx458_cur."!cursor_fail"()
    rx458_cur."!cursor_debug"("FAIL  ", "assertion:sym<!>")
    .return (rx458_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<!>"  :subid("131_1274564774.16047") :method
.annotate 'line', 3
    $P460 = self."!PREFIX__!subrule"("assertion", "!")
    new $P461, "ResizablePMCArray"
    push $P461, $P460
    push $P461, "!"
    .return ($P461)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block464"  :anon :subid("132_1274564774.16047") :method :outer("130_1274564774.16047")
.annotate 'line', 141
    .local string rx466_tgt
    .local int rx466_pos
    .local int rx466_off
    .local int rx466_eos
    .local int rx466_rep
    .local pmc rx466_cur
    (rx466_cur, rx466_pos, rx466_tgt) = self."!cursor_start"()
    rx466_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx466_cur
    .local pmc match
    .lex "$/", match
    length rx466_eos, rx466_tgt
    set rx466_off, 0
    lt rx466_pos, 2, rx466_start
    sub rx466_off, rx466_pos, 1
    substr rx466_tgt, rx466_tgt, rx466_off
  rx466_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan467_done
    goto rxscan467_scan
  rxscan467_loop:
    ($P10) = rx466_cur."from"()
    inc $P10
    set rx466_pos, $P10
    ge rx466_pos, rx466_eos, rxscan467_done
  rxscan467_scan:
    set_addr $I10, rxscan467_loop
    rx466_cur."!mark_push"(0, rx466_pos, $I10)
  rxscan467_done:
  # rx literal  ">"
    add $I11, rx466_pos, 1
    gt $I11, rx466_eos, rx466_fail
    sub $I11, rx466_pos, rx466_off
    substr $S10, rx466_tgt, $I11, 1
    ne $S10, ">", rx466_fail
    add rx466_pos, 1
  # rx pass
    rx466_cur."!cursor_pass"(rx466_pos, "")
    rx466_cur."!cursor_debug"("PASS  ", "", " at pos=", rx466_pos)
    .return (rx466_cur)
  rx466_fail:
    (rx466_rep, rx466_pos, $I10, $P10) = rx466_cur."!mark_fail"(0)
    lt rx466_pos, -1, rx466_done
    eq rx466_pos, -1, rx466_fail
    jump $I10
  rx466_done:
    rx466_cur."!cursor_fail"()
    rx466_cur."!cursor_debug"("FAIL  ", "")
    .return (rx466_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<method>"  :subid("133_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx469_tgt
    .local int rx469_pos
    .local int rx469_off
    .local int rx469_eos
    .local int rx469_rep
    .local pmc rx469_cur
    (rx469_cur, rx469_pos, rx469_tgt) = self."!cursor_start"()
    rx469_cur."!cursor_debug"("START ", "assertion:sym<method>")
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
    ne $I10, -1, rxscan473_done
    goto rxscan473_scan
  rxscan473_loop:
    ($P10) = rx469_cur."from"()
    inc $P10
    set rx469_pos, $P10
    ge rx469_pos, rx469_eos, rxscan473_done
  rxscan473_scan:
    set_addr $I10, rxscan473_loop
    rx469_cur."!mark_push"(0, rx469_pos, $I10)
  rxscan473_done:
.annotate 'line', 144
  # rx literal  "."
    add $I11, rx469_pos, 1
    gt $I11, rx469_eos, rx469_fail
    sub $I11, rx469_pos, rx469_off
    substr $S10, rx469_tgt, $I11, 1
    ne $S10, ".", rx469_fail
    add rx469_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx469_cur."!cursor_pos"(rx469_pos)
    $P10 = rx469_cur."assertion"()
    unless $P10, rx469_fail
    rx469_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx469_pos = $P10."pos"()
.annotate 'line', 143
  # rx pass
    rx469_cur."!cursor_pass"(rx469_pos, "assertion:sym<method>")
    rx469_cur."!cursor_debug"("PASS  ", "assertion:sym<method>", " at pos=", rx469_pos)
    .return (rx469_cur)
  rx469_fail:
.annotate 'line', 3
    (rx469_rep, rx469_pos, $I10, $P10) = rx469_cur."!mark_fail"(0)
    lt rx469_pos, -1, rx469_done
    eq rx469_pos, -1, rx469_fail
    jump $I10
  rx469_done:
    rx469_cur."!cursor_fail"()
    rx469_cur."!cursor_debug"("FAIL  ", "assertion:sym<method>")
    .return (rx469_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<method>"  :subid("134_1274564774.16047") :method
.annotate 'line', 3
    $P471 = self."!PREFIX__!subrule"("assertion", ".")
    new $P472, "ResizablePMCArray"
    push $P472, $P471
    .return ($P472)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<name>"  :subid("135_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .const 'Sub' $P483 = "137_1274564774.16047" 
    capture_lex $P483
    .local string rx475_tgt
    .local int rx475_pos
    .local int rx475_off
    .local int rx475_eos
    .local int rx475_rep
    .local pmc rx475_cur
    (rx475_cur, rx475_pos, rx475_tgt) = self."!cursor_start"()
    rx475_cur."!cursor_debug"("START ", "assertion:sym<name>")
    rx475_cur."!cursor_caparray"("assertion", "nibbler", "arglist")
    .lex unicode:"$\x{a2}", rx475_cur
    .local pmc match
    .lex "$/", match
    length rx475_eos, rx475_tgt
    set rx475_off, 0
    lt rx475_pos, 2, rx475_start
    sub rx475_off, rx475_pos, 1
    substr rx475_tgt, rx475_tgt, rx475_off
  rx475_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan478_done
    goto rxscan478_scan
  rxscan478_loop:
    ($P10) = rx475_cur."from"()
    inc $P10
    set rx475_pos, $P10
    ge rx475_pos, rx475_eos, rxscan478_done
  rxscan478_scan:
    set_addr $I10, rxscan478_loop
    rx475_cur."!mark_push"(0, rx475_pos, $I10)
  rxscan478_done:
.annotate 'line', 148
  # rx subcapture "longname"
    set_addr $I10, rxcap_479_fail
    rx475_cur."!mark_push"(0, rx475_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx475_pos, rx475_off
    find_not_cclass $I11, 8192, rx475_tgt, $I10, rx475_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx475_fail
    add rx475_pos, rx475_off, $I11
    set_addr $I10, rxcap_479_fail
    ($I12, $I11) = rx475_cur."!mark_peek"($I10)
    rx475_cur."!cursor_pos"($I11)
    ($P10) = rx475_cur."!cursor_start"()
    $P10."!cursor_pass"(rx475_pos, "")
    rx475_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    goto rxcap_479_done
  rxcap_479_fail:
    goto rx475_fail
  rxcap_479_done:
.annotate 'line', 155
  # rx rxquantr480 ** 0..1
    set_addr $I486, rxquantr480_done
    rx475_cur."!mark_push"(0, rx475_pos, $I486)
  rxquantr480_loop:
  alt481_0:
.annotate 'line', 149
    set_addr $I10, alt481_1
    rx475_cur."!mark_push"(0, rx475_pos, $I10)
.annotate 'line', 150
  # rx subrule "before" subtype=zerowidth negate=
    rx475_cur."!cursor_pos"(rx475_pos)
    .const 'Sub' $P483 = "137_1274564774.16047" 
    capture_lex $P483
    $P10 = rx475_cur."before"($P483)
    unless $P10, rx475_fail
    goto alt481_end
  alt481_1:
    set_addr $I10, alt481_2
    rx475_cur."!mark_push"(0, rx475_pos, $I10)
.annotate 'line', 151
  # rx literal  "="
    add $I11, rx475_pos, 1
    gt $I11, rx475_eos, rx475_fail
    sub $I11, rx475_pos, rx475_off
    substr $S10, rx475_tgt, $I11, 1
    ne $S10, "=", rx475_fail
    add rx475_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx475_cur."!cursor_pos"(rx475_pos)
    $P10 = rx475_cur."assertion"()
    unless $P10, rx475_fail
    rx475_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx475_pos = $P10."pos"()
    goto alt481_end
  alt481_2:
    set_addr $I10, alt481_3
    rx475_cur."!mark_push"(0, rx475_pos, $I10)
.annotate 'line', 152
  # rx literal  ":"
    add $I11, rx475_pos, 1
    gt $I11, rx475_eos, rx475_fail
    sub $I11, rx475_pos, rx475_off
    substr $S10, rx475_tgt, $I11, 1
    ne $S10, ":", rx475_fail
    add rx475_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx475_cur."!cursor_pos"(rx475_pos)
    $P10 = rx475_cur."arglist"()
    unless $P10, rx475_fail
    rx475_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx475_pos = $P10."pos"()
    goto alt481_end
  alt481_3:
    set_addr $I10, alt481_4
    rx475_cur."!mark_push"(0, rx475_pos, $I10)
.annotate 'line', 153
  # rx literal  "("
    add $I11, rx475_pos, 1
    gt $I11, rx475_eos, rx475_fail
    sub $I11, rx475_pos, rx475_off
    substr $S10, rx475_tgt, $I11, 1
    ne $S10, "(", rx475_fail
    add rx475_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx475_cur."!cursor_pos"(rx475_pos)
    $P10 = rx475_cur."arglist"()
    unless $P10, rx475_fail
    rx475_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx475_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx475_pos, 1
    gt $I11, rx475_eos, rx475_fail
    sub $I11, rx475_pos, rx475_off
    substr $S10, rx475_tgt, $I11, 1
    ne $S10, ")", rx475_fail
    add rx475_pos, 1
    goto alt481_end
  alt481_4:
.annotate 'line', 154
  # rx subrule "normspace" subtype=method negate=
    rx475_cur."!cursor_pos"(rx475_pos)
    $P10 = rx475_cur."normspace"()
    unless $P10, rx475_fail
    rx475_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx475_cur."!cursor_pos"(rx475_pos)
    $P10 = rx475_cur."nibbler"()
    unless $P10, rx475_fail
    rx475_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx475_pos = $P10."pos"()
  alt481_end:
.annotate 'line', 155
    (rx475_rep) = rx475_cur."!mark_commit"($I486)
  rxquantr480_done:
.annotate 'line', 147
  # rx pass
    rx475_cur."!cursor_pass"(rx475_pos, "assertion:sym<name>")
    rx475_cur."!cursor_debug"("PASS  ", "assertion:sym<name>", " at pos=", rx475_pos)
    .return (rx475_cur)
  rx475_fail:
.annotate 'line', 3
    (rx475_rep, rx475_pos, $I10, $P10) = rx475_cur."!mark_fail"(0)
    lt rx475_pos, -1, rx475_done
    eq rx475_pos, -1, rx475_fail
    jump $I10
  rx475_done:
    rx475_cur."!cursor_fail"()
    rx475_cur."!cursor_debug"("FAIL  ", "assertion:sym<name>")
    .return (rx475_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<name>"  :subid("136_1274564774.16047") :method
.annotate 'line', 3
    new $P477, "ResizablePMCArray"
    push $P477, ""
    .return ($P477)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block482"  :anon :subid("137_1274564774.16047") :method :outer("135_1274564774.16047")
.annotate 'line', 150
    .local string rx484_tgt
    .local int rx484_pos
    .local int rx484_off
    .local int rx484_eos
    .local int rx484_rep
    .local pmc rx484_cur
    (rx484_cur, rx484_pos, rx484_tgt) = self."!cursor_start"()
    rx484_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx484_cur
    .local pmc match
    .lex "$/", match
    length rx484_eos, rx484_tgt
    set rx484_off, 0
    lt rx484_pos, 2, rx484_start
    sub rx484_off, rx484_pos, 1
    substr rx484_tgt, rx484_tgt, rx484_off
  rx484_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan485_done
    goto rxscan485_scan
  rxscan485_loop:
    ($P10) = rx484_cur."from"()
    inc $P10
    set rx484_pos, $P10
    ge rx484_pos, rx484_eos, rxscan485_done
  rxscan485_scan:
    set_addr $I10, rxscan485_loop
    rx484_cur."!mark_push"(0, rx484_pos, $I10)
  rxscan485_done:
  # rx literal  ">"
    add $I11, rx484_pos, 1
    gt $I11, rx484_eos, rx484_fail
    sub $I11, rx484_pos, rx484_off
    substr $S10, rx484_tgt, $I11, 1
    ne $S10, ">", rx484_fail
    add rx484_pos, 1
  # rx pass
    rx484_cur."!cursor_pass"(rx484_pos, "")
    rx484_cur."!cursor_debug"("PASS  ", "", " at pos=", rx484_pos)
    .return (rx484_cur)
  rx484_fail:
    (rx484_rep, rx484_pos, $I10, $P10) = rx484_cur."!mark_fail"(0)
    lt rx484_pos, -1, rx484_done
    eq rx484_pos, -1, rx484_fail
    jump $I10
  rx484_done:
    rx484_cur."!cursor_fail"()
    rx484_cur."!cursor_debug"("FAIL  ", "")
    .return (rx484_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<[>"  :subid("138_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .const 'Sub' $P493 = "140_1274564774.16047" 
    capture_lex $P493
    .local string rx488_tgt
    .local int rx488_pos
    .local int rx488_off
    .local int rx488_eos
    .local int rx488_rep
    .local pmc rx488_cur
    (rx488_cur, rx488_pos, rx488_tgt) = self."!cursor_start"()
    rx488_cur."!cursor_debug"("START ", "assertion:sym<[>")
    rx488_cur."!cursor_caparray"("cclass_elem")
    .lex unicode:"$\x{a2}", rx488_cur
    .local pmc match
    .lex "$/", match
    length rx488_eos, rx488_tgt
    set rx488_off, 0
    lt rx488_pos, 2, rx488_start
    sub rx488_off, rx488_pos, 1
    substr rx488_tgt, rx488_tgt, rx488_off
  rx488_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan491_done
    goto rxscan491_scan
  rxscan491_loop:
    ($P10) = rx488_cur."from"()
    inc $P10
    set rx488_pos, $P10
    ge rx488_pos, rx488_eos, rxscan491_done
  rxscan491_scan:
    set_addr $I10, rxscan491_loop
    rx488_cur."!mark_push"(0, rx488_pos, $I10)
  rxscan491_done:
.annotate 'line', 158
  # rx subrule "before" subtype=zerowidth negate=
    rx488_cur."!cursor_pos"(rx488_pos)
    .const 'Sub' $P493 = "140_1274564774.16047" 
    capture_lex $P493
    $P10 = rx488_cur."before"($P493)
    unless $P10, rx488_fail
  # rx rxquantr497 ** 1..*
    set_addr $I498, rxquantr497_done
    rx488_cur."!mark_push"(0, -1, $I498)
  rxquantr497_loop:
  # rx subrule "cclass_elem" subtype=capture negate=
    rx488_cur."!cursor_pos"(rx488_pos)
    $P10 = rx488_cur."cclass_elem"()
    unless $P10, rx488_fail
    rx488_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cclass_elem")
    rx488_pos = $P10."pos"()
    (rx488_rep) = rx488_cur."!mark_commit"($I498)
    rx488_cur."!mark_push"(rx488_rep, rx488_pos, $I498)
    goto rxquantr497_loop
  rxquantr497_done:
  # rx pass
    rx488_cur."!cursor_pass"(rx488_pos, "assertion:sym<[>")
    rx488_cur."!cursor_debug"("PASS  ", "assertion:sym<[>", " at pos=", rx488_pos)
    .return (rx488_cur)
  rx488_fail:
.annotate 'line', 3
    (rx488_rep, rx488_pos, $I10, $P10) = rx488_cur."!mark_fail"(0)
    lt rx488_pos, -1, rx488_done
    eq rx488_pos, -1, rx488_fail
    jump $I10
  rx488_done:
    rx488_cur."!cursor_fail"()
    rx488_cur."!cursor_debug"("FAIL  ", "assertion:sym<[>")
    .return (rx488_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<[>"  :subid("139_1274564774.16047") :method
.annotate 'line', 3
    new $P490, "ResizablePMCArray"
    push $P490, ""
    .return ($P490)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block492"  :anon :subid("140_1274564774.16047") :method :outer("138_1274564774.16047")
.annotate 'line', 158
    .local string rx494_tgt
    .local int rx494_pos
    .local int rx494_off
    .local int rx494_eos
    .local int rx494_rep
    .local pmc rx494_cur
    (rx494_cur, rx494_pos, rx494_tgt) = self."!cursor_start"()
    rx494_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx494_cur
    .local pmc match
    .lex "$/", match
    length rx494_eos, rx494_tgt
    set rx494_off, 0
    lt rx494_pos, 2, rx494_start
    sub rx494_off, rx494_pos, 1
    substr rx494_tgt, rx494_tgt, rx494_off
  rx494_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan495_done
    goto rxscan495_scan
  rxscan495_loop:
    ($P10) = rx494_cur."from"()
    inc $P10
    set rx494_pos, $P10
    ge rx494_pos, rx494_eos, rxscan495_done
  rxscan495_scan:
    set_addr $I10, rxscan495_loop
    rx494_cur."!mark_push"(0, rx494_pos, $I10)
  rxscan495_done:
  alt496_0:
    set_addr $I10, alt496_1
    rx494_cur."!mark_push"(0, rx494_pos, $I10)
  # rx literal  "["
    add $I11, rx494_pos, 1
    gt $I11, rx494_eos, rx494_fail
    sub $I11, rx494_pos, rx494_off
    substr $S10, rx494_tgt, $I11, 1
    ne $S10, "[", rx494_fail
    add rx494_pos, 1
    goto alt496_end
  alt496_1:
    set_addr $I10, alt496_2
    rx494_cur."!mark_push"(0, rx494_pos, $I10)
  # rx literal  "+"
    add $I11, rx494_pos, 1
    gt $I11, rx494_eos, rx494_fail
    sub $I11, rx494_pos, rx494_off
    substr $S10, rx494_tgt, $I11, 1
    ne $S10, "+", rx494_fail
    add rx494_pos, 1
    goto alt496_end
  alt496_2:
  # rx literal  "-"
    add $I11, rx494_pos, 1
    gt $I11, rx494_eos, rx494_fail
    sub $I11, rx494_pos, rx494_off
    substr $S10, rx494_tgt, $I11, 1
    ne $S10, "-", rx494_fail
    add rx494_pos, 1
  alt496_end:
  # rx pass
    rx494_cur."!cursor_pass"(rx494_pos, "")
    rx494_cur."!cursor_debug"("PASS  ", "", " at pos=", rx494_pos)
    .return (rx494_cur)
  rx494_fail:
    (rx494_rep, rx494_pos, $I10, $P10) = rx494_cur."!mark_fail"(0)
    lt rx494_pos, -1, rx494_done
    eq rx494_pos, -1, rx494_fail
    jump $I10
  rx494_done:
    rx494_cur."!cursor_fail"()
    rx494_cur."!cursor_debug"("FAIL  ", "")
    .return (rx494_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "cclass_elem"  :subid("141_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .const 'Sub' $P511 = "143_1274564774.16047" 
    capture_lex $P511
    .local string rx500_tgt
    .local int rx500_pos
    .local int rx500_off
    .local int rx500_eos
    .local int rx500_rep
    .local pmc rx500_cur
    (rx500_cur, rx500_pos, rx500_tgt) = self."!cursor_start"()
    rx500_cur."!cursor_debug"("START ", "cclass_elem")
    rx500_cur."!cursor_caparray"("charspec")
    .lex unicode:"$\x{a2}", rx500_cur
    .local pmc match
    .lex "$/", match
    length rx500_eos, rx500_tgt
    set rx500_off, 0
    lt rx500_pos, 2, rx500_start
    sub rx500_off, rx500_pos, 1
    substr rx500_tgt, rx500_tgt, rx500_off
  rx500_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan503_done
    goto rxscan503_scan
  rxscan503_loop:
    ($P10) = rx500_cur."from"()
    inc $P10
    set rx500_pos, $P10
    ge rx500_pos, rx500_eos, rxscan503_done
  rxscan503_scan:
    set_addr $I10, rxscan503_loop
    rx500_cur."!mark_push"(0, rx500_pos, $I10)
  rxscan503_done:
.annotate 'line', 161
  # rx subcapture "sign"
    set_addr $I10, rxcap_505_fail
    rx500_cur."!mark_push"(0, rx500_pos, $I10)
  alt504_0:
    set_addr $I10, alt504_1
    rx500_cur."!mark_push"(0, rx500_pos, $I10)
  # rx literal  "+"
    add $I11, rx500_pos, 1
    gt $I11, rx500_eos, rx500_fail
    sub $I11, rx500_pos, rx500_off
    substr $S10, rx500_tgt, $I11, 1
    ne $S10, "+", rx500_fail
    add rx500_pos, 1
    goto alt504_end
  alt504_1:
    set_addr $I10, alt504_2
    rx500_cur."!mark_push"(0, rx500_pos, $I10)
  # rx literal  "-"
    add $I11, rx500_pos, 1
    gt $I11, rx500_eos, rx500_fail
    sub $I11, rx500_pos, rx500_off
    substr $S10, rx500_tgt, $I11, 1
    ne $S10, "-", rx500_fail
    add rx500_pos, 1
    goto alt504_end
  alt504_2:
  alt504_end:
    set_addr $I10, rxcap_505_fail
    ($I12, $I11) = rx500_cur."!mark_peek"($I10)
    rx500_cur."!cursor_pos"($I11)
    ($P10) = rx500_cur."!cursor_start"()
    $P10."!cursor_pass"(rx500_pos, "")
    rx500_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sign")
    goto rxcap_505_done
  rxcap_505_fail:
    goto rx500_fail
  rxcap_505_done:
.annotate 'line', 162
  # rx rxquantr506 ** 0..1
    set_addr $I507, rxquantr506_done
    rx500_cur."!mark_push"(0, rx500_pos, $I507)
  rxquantr506_loop:
  # rx subrule "normspace" subtype=method negate=
    rx500_cur."!cursor_pos"(rx500_pos)
    $P10 = rx500_cur."normspace"()
    unless $P10, rx500_fail
    rx500_pos = $P10."pos"()
    (rx500_rep) = rx500_cur."!mark_commit"($I507)
  rxquantr506_done:
  alt508_0:
.annotate 'line', 163
    set_addr $I10, alt508_1
    rx500_cur."!mark_push"(0, rx500_pos, $I10)
.annotate 'line', 164
  # rx literal  "["
    add $I11, rx500_pos, 1
    gt $I11, rx500_eos, rx500_fail
    sub $I11, rx500_pos, rx500_off
    substr $S10, rx500_tgt, $I11, 1
    ne $S10, "[", rx500_fail
    add rx500_pos, 1
.annotate 'line', 167
  # rx rxquantr509 ** 0..*
    set_addr $I530, rxquantr509_done
    rx500_cur."!mark_push"(0, rx500_pos, $I530)
  rxquantr509_loop:
.annotate 'line', 164
  # rx subrule $P511 subtype=capture negate=
    rx500_cur."!cursor_pos"(rx500_pos)
    .const 'Sub' $P511 = "143_1274564774.16047" 
    capture_lex $P511
    $P10 = rx500_cur.$P511()
    unless $P10, rx500_fail
    rx500_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charspec")
    rx500_pos = $P10."pos"()
.annotate 'line', 167
    (rx500_rep) = rx500_cur."!mark_commit"($I530)
    rx500_cur."!mark_push"(rx500_rep, rx500_pos, $I530)
    goto rxquantr509_loop
  rxquantr509_done:
.annotate 'line', 168
  # rx charclass_q s r 0..-1
    sub $I10, rx500_pos, rx500_off
    find_not_cclass $I11, 32, rx500_tgt, $I10, rx500_eos
    add rx500_pos, rx500_off, $I11
  # rx literal  "]"
    add $I11, rx500_pos, 1
    gt $I11, rx500_eos, rx500_fail
    sub $I11, rx500_pos, rx500_off
    substr $S10, rx500_tgt, $I11, 1
    ne $S10, "]", rx500_fail
    add rx500_pos, 1
.annotate 'line', 164
    goto alt508_end
  alt508_1:
.annotate 'line', 169
  # rx subcapture "name"
    set_addr $I10, rxcap_531_fail
    rx500_cur."!mark_push"(0, rx500_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx500_pos, rx500_off
    find_not_cclass $I11, 8192, rx500_tgt, $I10, rx500_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx500_fail
    add rx500_pos, rx500_off, $I11
    set_addr $I10, rxcap_531_fail
    ($I12, $I11) = rx500_cur."!mark_peek"($I10)
    rx500_cur."!cursor_pos"($I11)
    ($P10) = rx500_cur."!cursor_start"()
    $P10."!cursor_pass"(rx500_pos, "")
    rx500_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_531_done
  rxcap_531_fail:
    goto rx500_fail
  rxcap_531_done:
  alt508_end:
.annotate 'line', 171
  # rx rxquantr532 ** 0..1
    set_addr $I533, rxquantr532_done
    rx500_cur."!mark_push"(0, rx500_pos, $I533)
  rxquantr532_loop:
  # rx subrule "normspace" subtype=method negate=
    rx500_cur."!cursor_pos"(rx500_pos)
    $P10 = rx500_cur."normspace"()
    unless $P10, rx500_fail
    rx500_pos = $P10."pos"()
    (rx500_rep) = rx500_cur."!mark_commit"($I533)
  rxquantr532_done:
.annotate 'line', 160
  # rx pass
    rx500_cur."!cursor_pass"(rx500_pos, "cclass_elem")
    rx500_cur."!cursor_debug"("PASS  ", "cclass_elem", " at pos=", rx500_pos)
    .return (rx500_cur)
  rx500_fail:
.annotate 'line', 3
    (rx500_rep, rx500_pos, $I10, $P10) = rx500_cur."!mark_fail"(0)
    lt rx500_pos, -1, rx500_done
    eq rx500_pos, -1, rx500_fail
    jump $I10
  rx500_done:
    rx500_cur."!cursor_fail"()
    rx500_cur."!cursor_debug"("FAIL  ", "cclass_elem")
    .return (rx500_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__cclass_elem"  :subid("142_1274564774.16047") :method
.annotate 'line', 3
    new $P502, "ResizablePMCArray"
    push $P502, ""
    push $P502, "-"
    push $P502, "+"
    .return ($P502)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block510"  :anon :subid("143_1274564774.16047") :method :outer("141_1274564774.16047")
.annotate 'line', 164
    .const 'Sub' $P526 = "146_1274564774.16047" 
    capture_lex $P526
    .const 'Sub' $P521 = "145_1274564774.16047" 
    capture_lex $P521
    .const 'Sub' $P517 = "144_1274564774.16047" 
    capture_lex $P517
    .local string rx512_tgt
    .local int rx512_pos
    .local int rx512_off
    .local int rx512_eos
    .local int rx512_rep
    .local pmc rx512_cur
    (rx512_cur, rx512_pos, rx512_tgt) = self."!cursor_start"()
    rx512_cur."!cursor_debug"("START ", "")
    rx512_cur."!cursor_caparray"("1")
    .lex unicode:"$\x{a2}", rx512_cur
    .local pmc match
    .lex "$/", match
    length rx512_eos, rx512_tgt
    set rx512_off, 0
    lt rx512_pos, 2, rx512_start
    sub rx512_off, rx512_pos, 1
    substr rx512_tgt, rx512_tgt, rx512_off
  rx512_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan513_done
    goto rxscan513_scan
  rxscan513_loop:
    ($P10) = rx512_cur."from"()
    inc $P10
    set rx512_pos, $P10
    ge rx512_pos, rx512_eos, rxscan513_done
  rxscan513_scan:
    set_addr $I10, rxscan513_loop
    rx512_cur."!mark_push"(0, rx512_pos, $I10)
  rxscan513_done:
  alt514_0:
    set_addr $I10, alt514_1
    rx512_cur."!mark_push"(0, rx512_pos, $I10)
.annotate 'line', 165
  # rx charclass_q s r 0..-1
    sub $I10, rx512_pos, rx512_off
    find_not_cclass $I11, 32, rx512_tgt, $I10, rx512_eos
    add rx512_pos, rx512_off, $I11
  # rx literal  "-"
    add $I11, rx512_pos, 1
    gt $I11, rx512_eos, rx512_fail
    sub $I11, rx512_pos, rx512_off
    substr $S10, rx512_tgt, $I11, 1
    ne $S10, "-", rx512_fail
    add rx512_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx512_cur."!cursor_pos"(rx512_pos)
    $P10 = rx512_cur."obs"("hyphen in enumerated character class", "..")
    unless $P10, rx512_fail
    rx512_pos = $P10."pos"()
    goto alt514_end
  alt514_1:
.annotate 'line', 166
  # rx charclass_q s r 0..-1
    sub $I10, rx512_pos, rx512_off
    find_not_cclass $I11, 32, rx512_tgt, $I10, rx512_eos
    add rx512_pos, rx512_off, $I11
  alt515_0:
    set_addr $I10, alt515_1
    rx512_cur."!mark_push"(0, rx512_pos, $I10)
  # rx literal  "\\"
    add $I11, rx512_pos, 1
    gt $I11, rx512_eos, rx512_fail
    sub $I11, rx512_pos, rx512_off
    substr $S10, rx512_tgt, $I11, 1
    ne $S10, "\\", rx512_fail
    add rx512_pos, 1
  # rx subrule $P517 subtype=capture negate=
    rx512_cur."!cursor_pos"(rx512_pos)
    .const 'Sub' $P517 = "144_1274564774.16047" 
    capture_lex $P517
    $P10 = rx512_cur.$P517()
    unless $P10, rx512_fail
    rx512_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"(0)
    rx512_pos = $P10."pos"()
    goto alt515_end
  alt515_1:
  # rx subrule $P521 subtype=capture negate=
    rx512_cur."!cursor_pos"(rx512_pos)
    .const 'Sub' $P521 = "145_1274564774.16047" 
    capture_lex $P521
    $P10 = rx512_cur.$P521()
    unless $P10, rx512_fail
    rx512_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"(0)
    rx512_pos = $P10."pos"()
  alt515_end:
  # rx rxquantr524 ** 0..1
    set_addr $I529, rxquantr524_done
    rx512_cur."!mark_push"(0, rx512_pos, $I529)
  rxquantr524_loop:
  # rx charclass_q s r 0..-1
    sub $I10, rx512_pos, rx512_off
    find_not_cclass $I11, 32, rx512_tgt, $I10, rx512_eos
    add rx512_pos, rx512_off, $I11
  # rx literal  ".."
    add $I11, rx512_pos, 2
    gt $I11, rx512_eos, rx512_fail
    sub $I11, rx512_pos, rx512_off
    substr $S10, rx512_tgt, $I11, 2
    ne $S10, "..", rx512_fail
    add rx512_pos, 2
  # rx charclass_q s r 0..-1
    sub $I10, rx512_pos, rx512_off
    find_not_cclass $I11, 32, rx512_tgt, $I10, rx512_eos
    add rx512_pos, rx512_off, $I11
  # rx subrule $P526 subtype=capture negate=
    rx512_cur."!cursor_pos"(rx512_pos)
    .const 'Sub' $P526 = "146_1274564774.16047" 
    capture_lex $P526
    $P10 = rx512_cur.$P526()
    unless $P10, rx512_fail
    rx512_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("1")
    rx512_pos = $P10."pos"()
    (rx512_rep) = rx512_cur."!mark_commit"($I529)
  rxquantr524_done:
  alt514_end:
.annotate 'line', 164
  # rx pass
    rx512_cur."!cursor_pass"(rx512_pos, "")
    rx512_cur."!cursor_debug"("PASS  ", "", " at pos=", rx512_pos)
    .return (rx512_cur)
  rx512_fail:
    (rx512_rep, rx512_pos, $I10, $P10) = rx512_cur."!mark_fail"(0)
    lt rx512_pos, -1, rx512_done
    eq rx512_pos, -1, rx512_fail
    jump $I10
  rx512_done:
    rx512_cur."!cursor_fail"()
    rx512_cur."!cursor_debug"("FAIL  ", "")
    .return (rx512_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block516"  :anon :subid("144_1274564774.16047") :method :outer("143_1274564774.16047")
.annotate 'line', 166
    .local string rx518_tgt
    .local int rx518_pos
    .local int rx518_off
    .local int rx518_eos
    .local int rx518_rep
    .local pmc rx518_cur
    (rx518_cur, rx518_pos, rx518_tgt) = self."!cursor_start"()
    rx518_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx518_cur
    .local pmc match
    .lex "$/", match
    length rx518_eos, rx518_tgt
    set rx518_off, 0
    lt rx518_pos, 2, rx518_start
    sub rx518_off, rx518_pos, 1
    substr rx518_tgt, rx518_tgt, rx518_off
  rx518_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan519_done
    goto rxscan519_scan
  rxscan519_loop:
    ($P10) = rx518_cur."from"()
    inc $P10
    set rx518_pos, $P10
    ge rx518_pos, rx518_eos, rxscan519_done
  rxscan519_scan:
    set_addr $I10, rxscan519_loop
    rx518_cur."!mark_push"(0, rx518_pos, $I10)
  rxscan519_done:
  # rx charclass .
    ge rx518_pos, rx518_eos, rx518_fail
    inc rx518_pos
  # rx pass
    rx518_cur."!cursor_pass"(rx518_pos, "")
    rx518_cur."!cursor_debug"("PASS  ", "", " at pos=", rx518_pos)
    .return (rx518_cur)
  rx518_fail:
    (rx518_rep, rx518_pos, $I10, $P10) = rx518_cur."!mark_fail"(0)
    lt rx518_pos, -1, rx518_done
    eq rx518_pos, -1, rx518_fail
    jump $I10
  rx518_done:
    rx518_cur."!cursor_fail"()
    rx518_cur."!cursor_debug"("FAIL  ", "")
    .return (rx518_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block520"  :anon :subid("145_1274564774.16047") :method :outer("143_1274564774.16047")
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
  # rx enumcharlist negate=1 
    ge rx522_pos, rx522_eos, rx522_fail
    sub $I10, rx522_pos, rx522_off
    substr $S10, rx522_tgt, $I10, 1
    index $I11, "]\\", $S10
    ge $I11, 0, rx522_fail
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
.sub "_block525"  :anon :subid("146_1274564774.16047") :method :outer("143_1274564774.16047")
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
  # rx charclass .
    ge rx527_pos, rx527_eos, rx527_fail
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
.sub "mod_internal"  :subid("147_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .const 'Sub' $P543 = "149_1274564774.16047" 
    capture_lex $P543
    .local string rx535_tgt
    .local int rx535_pos
    .local int rx535_off
    .local int rx535_eos
    .local int rx535_rep
    .local pmc rx535_cur
    (rx535_cur, rx535_pos, rx535_tgt) = self."!cursor_start"()
    rx535_cur."!cursor_debug"("START ", "mod_internal")
    rx535_cur."!cursor_caparray"("n")
    .lex unicode:"$\x{a2}", rx535_cur
    .local pmc match
    .lex "$/", match
    length rx535_eos, rx535_tgt
    set rx535_off, 0
    lt rx535_pos, 2, rx535_start
    sub rx535_off, rx535_pos, 1
    substr rx535_tgt, rx535_tgt, rx535_off
  rx535_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan539_done
    goto rxscan539_scan
  rxscan539_loop:
    ($P10) = rx535_cur."from"()
    inc $P10
    set rx535_pos, $P10
    ge rx535_pos, rx535_eos, rxscan539_done
  rxscan539_scan:
    set_addr $I10, rxscan539_loop
    rx535_cur."!mark_push"(0, rx535_pos, $I10)
  rxscan539_done:
  alt540_0:
.annotate 'line', 175
    set_addr $I10, alt540_1
    rx535_cur."!mark_push"(0, rx535_pos, $I10)
.annotate 'line', 176
  # rx literal  ":"
    add $I11, rx535_pos, 1
    gt $I11, rx535_eos, rx535_fail
    sub $I11, rx535_pos, rx535_off
    substr $S10, rx535_tgt, $I11, 1
    ne $S10, ":", rx535_fail
    add rx535_pos, 1
  # rx rxquantr541 ** 1..1
    set_addr $I547, rxquantr541_done
    rx535_cur."!mark_push"(0, -1, $I547)
  rxquantr541_loop:
  # rx subrule $P543 subtype=capture negate=
    rx535_cur."!cursor_pos"(rx535_pos)
    .const 'Sub' $P543 = "149_1274564774.16047" 
    capture_lex $P543
    $P10 = rx535_cur.$P543()
    unless $P10, rx535_fail
    rx535_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("n")
    rx535_pos = $P10."pos"()
    (rx535_rep) = rx535_cur."!mark_commit"($I547)
  rxquantr541_done:
  # rx subrule "mod_ident" subtype=capture negate=
    rx535_cur."!cursor_pos"(rx535_pos)
    $P10 = rx535_cur."mod_ident"()
    unless $P10, rx535_fail
    rx535_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_ident")
    rx535_pos = $P10."pos"()
  # rxanchor rwb
    le rx535_pos, 0, rx535_fail
    sub $I10, rx535_pos, rx535_off
    is_cclass $I11, 8192, rx535_tgt, $I10
    if $I11, rx535_fail
    dec $I10
    is_cclass $I11, 8192, rx535_tgt, $I10
    unless $I11, rx535_fail
    goto alt540_end
  alt540_1:
.annotate 'line', 177
  # rx literal  ":"
    add $I11, rx535_pos, 1
    gt $I11, rx535_eos, rx535_fail
    sub $I11, rx535_pos, rx535_off
    substr $S10, rx535_tgt, $I11, 1
    ne $S10, ":", rx535_fail
    add rx535_pos, 1
  # rx subrule "mod_ident" subtype=capture negate=
    rx535_cur."!cursor_pos"(rx535_pos)
    $P10 = rx535_cur."mod_ident"()
    unless $P10, rx535_fail
    rx535_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_ident")
    rx535_pos = $P10."pos"()
  # rx rxquantr548 ** 0..1
    set_addr $I550, rxquantr548_done
    rx535_cur."!mark_push"(0, rx535_pos, $I550)
  rxquantr548_loop:
  # rx literal  "("
    add $I11, rx535_pos, 1
    gt $I11, rx535_eos, rx535_fail
    sub $I11, rx535_pos, rx535_off
    substr $S10, rx535_tgt, $I11, 1
    ne $S10, "(", rx535_fail
    add rx535_pos, 1
  # rx subcapture "n"
    set_addr $I10, rxcap_549_fail
    rx535_cur."!mark_push"(0, rx535_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx535_pos, rx535_off
    find_not_cclass $I11, 8, rx535_tgt, $I10, rx535_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx535_fail
    add rx535_pos, rx535_off, $I11
    set_addr $I10, rxcap_549_fail
    ($I12, $I11) = rx535_cur."!mark_peek"($I10)
    rx535_cur."!cursor_pos"($I11)
    ($P10) = rx535_cur."!cursor_start"()
    $P10."!cursor_pass"(rx535_pos, "")
    rx535_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("n")
    goto rxcap_549_done
  rxcap_549_fail:
    goto rx535_fail
  rxcap_549_done:
  # rx literal  ")"
    add $I11, rx535_pos, 1
    gt $I11, rx535_eos, rx535_fail
    sub $I11, rx535_pos, rx535_off
    substr $S10, rx535_tgt, $I11, 1
    ne $S10, ")", rx535_fail
    add rx535_pos, 1
    (rx535_rep) = rx535_cur."!mark_commit"($I550)
  rxquantr548_done:
  alt540_end:
.annotate 'line', 174
  # rx pass
    rx535_cur."!cursor_pass"(rx535_pos, "mod_internal")
    rx535_cur."!cursor_debug"("PASS  ", "mod_internal", " at pos=", rx535_pos)
    .return (rx535_cur)
  rx535_fail:
.annotate 'line', 3
    (rx535_rep, rx535_pos, $I10, $P10) = rx535_cur."!mark_fail"(0)
    lt rx535_pos, -1, rx535_done
    eq rx535_pos, -1, rx535_fail
    jump $I10
  rx535_done:
    rx535_cur."!cursor_fail"()
    rx535_cur."!cursor_debug"("FAIL  ", "mod_internal")
    .return (rx535_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_internal"  :subid("148_1274564774.16047") :method
.annotate 'line', 3
    $P537 = self."!PREFIX__!subrule"("mod_ident", ":")
    new $P538, "ResizablePMCArray"
    push $P538, $P537
    push $P538, ":"
    .return ($P538)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block542"  :anon :subid("149_1274564774.16047") :method :outer("147_1274564774.16047")
.annotate 'line', 176
    .local string rx544_tgt
    .local int rx544_pos
    .local int rx544_off
    .local int rx544_eos
    .local int rx544_rep
    .local pmc rx544_cur
    (rx544_cur, rx544_pos, rx544_tgt) = self."!cursor_start"()
    rx544_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx544_cur
    .local pmc match
    .lex "$/", match
    length rx544_eos, rx544_tgt
    set rx544_off, 0
    lt rx544_pos, 2, rx544_start
    sub rx544_off, rx544_pos, 1
    substr rx544_tgt, rx544_tgt, rx544_off
  rx544_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan545_done
    goto rxscan545_scan
  rxscan545_loop:
    ($P10) = rx544_cur."from"()
    inc $P10
    set rx544_pos, $P10
    ge rx544_pos, rx544_eos, rxscan545_done
  rxscan545_scan:
    set_addr $I10, rxscan545_loop
    rx544_cur."!mark_push"(0, rx544_pos, $I10)
  rxscan545_done:
  alt546_0:
    set_addr $I10, alt546_1
    rx544_cur."!mark_push"(0, rx544_pos, $I10)
  # rx literal  "!"
    add $I11, rx544_pos, 1
    gt $I11, rx544_eos, rx544_fail
    sub $I11, rx544_pos, rx544_off
    substr $S10, rx544_tgt, $I11, 1
    ne $S10, "!", rx544_fail
    add rx544_pos, 1
    goto alt546_end
  alt546_1:
  # rx charclass_q d r 1..-1
    sub $I10, rx544_pos, rx544_off
    find_not_cclass $I11, 8, rx544_tgt, $I10, rx544_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx544_fail
    add rx544_pos, rx544_off, $I11
  alt546_end:
  # rx pass
    rx544_cur."!cursor_pass"(rx544_pos, "")
    rx544_cur."!cursor_debug"("PASS  ", "", " at pos=", rx544_pos)
    .return (rx544_cur)
  rx544_fail:
    (rx544_rep, rx544_pos, $I10, $P10) = rx544_cur."!mark_fail"(0)
    lt rx544_pos, -1, rx544_done
    eq rx544_pos, -1, rx544_fail
    jump $I10
  rx544_done:
    rx544_cur."!cursor_fail"()
    rx544_cur."!cursor_debug"("FAIL  ", "")
    .return (rx544_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident"  :subid("150_1274564774.16047") :method
.annotate 'line', 181
    $P552 = self."!protoregex"("mod_ident")
    .return ($P552)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident"  :subid("151_1274564774.16047") :method
.annotate 'line', 181
    $P554 = self."!PREFIX__!protoregex"("mod_ident")
    .return ($P554)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ignorecase>"  :subid("152_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx556_tgt
    .local int rx556_pos
    .local int rx556_off
    .local int rx556_eos
    .local int rx556_rep
    .local pmc rx556_cur
    (rx556_cur, rx556_pos, rx556_tgt) = self."!cursor_start"()
    rx556_cur."!cursor_debug"("START ", "mod_ident:sym<ignorecase>")
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
.annotate 'line', 182
  # rx subcapture "sym"
    set_addr $I10, rxcap_560_fail
    rx556_cur."!mark_push"(0, rx556_pos, $I10)
  # rx literal  "i"
    add $I11, rx556_pos, 1
    gt $I11, rx556_eos, rx556_fail
    sub $I11, rx556_pos, rx556_off
    substr $S10, rx556_tgt, $I11, 1
    ne $S10, "i", rx556_fail
    add rx556_pos, 1
    set_addr $I10, rxcap_560_fail
    ($I12, $I11) = rx556_cur."!mark_peek"($I10)
    rx556_cur."!cursor_pos"($I11)
    ($P10) = rx556_cur."!cursor_start"()
    $P10."!cursor_pass"(rx556_pos, "")
    rx556_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_560_done
  rxcap_560_fail:
    goto rx556_fail
  rxcap_560_done:
  # rx rxquantr561 ** 0..1
    set_addr $I562, rxquantr561_done
    rx556_cur."!mark_push"(0, rx556_pos, $I562)
  rxquantr561_loop:
  # rx literal  "gnorecase"
    add $I11, rx556_pos, 9
    gt $I11, rx556_eos, rx556_fail
    sub $I11, rx556_pos, rx556_off
    substr $S10, rx556_tgt, $I11, 9
    ne $S10, "gnorecase", rx556_fail
    add rx556_pos, 9
    (rx556_rep) = rx556_cur."!mark_commit"($I562)
  rxquantr561_done:
  # rx pass
    rx556_cur."!cursor_pass"(rx556_pos, "mod_ident:sym<ignorecase>")
    rx556_cur."!cursor_debug"("PASS  ", "mod_ident:sym<ignorecase>", " at pos=", rx556_pos)
    .return (rx556_cur)
  rx556_fail:
.annotate 'line', 3
    (rx556_rep, rx556_pos, $I10, $P10) = rx556_cur."!mark_fail"(0)
    lt rx556_pos, -1, rx556_done
    eq rx556_pos, -1, rx556_fail
    jump $I10
  rx556_done:
    rx556_cur."!cursor_fail"()
    rx556_cur."!cursor_debug"("FAIL  ", "mod_ident:sym<ignorecase>")
    .return (rx556_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident:sym<ignorecase>"  :subid("153_1274564774.16047") :method
.annotate 'line', 3
    new $P558, "ResizablePMCArray"
    push $P558, "i"
    .return ($P558)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ratchet>"  :subid("154_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx564_tgt
    .local int rx564_pos
    .local int rx564_off
    .local int rx564_eos
    .local int rx564_rep
    .local pmc rx564_cur
    (rx564_cur, rx564_pos, rx564_tgt) = self."!cursor_start"()
    rx564_cur."!cursor_debug"("START ", "mod_ident:sym<ratchet>")
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
.annotate 'line', 183
  # rx subcapture "sym"
    set_addr $I10, rxcap_568_fail
    rx564_cur."!mark_push"(0, rx564_pos, $I10)
  # rx literal  "r"
    add $I11, rx564_pos, 1
    gt $I11, rx564_eos, rx564_fail
    sub $I11, rx564_pos, rx564_off
    substr $S10, rx564_tgt, $I11, 1
    ne $S10, "r", rx564_fail
    add rx564_pos, 1
    set_addr $I10, rxcap_568_fail
    ($I12, $I11) = rx564_cur."!mark_peek"($I10)
    rx564_cur."!cursor_pos"($I11)
    ($P10) = rx564_cur."!cursor_start"()
    $P10."!cursor_pass"(rx564_pos, "")
    rx564_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_568_done
  rxcap_568_fail:
    goto rx564_fail
  rxcap_568_done:
  # rx rxquantr569 ** 0..1
    set_addr $I570, rxquantr569_done
    rx564_cur."!mark_push"(0, rx564_pos, $I570)
  rxquantr569_loop:
  # rx literal  "atchet"
    add $I11, rx564_pos, 6
    gt $I11, rx564_eos, rx564_fail
    sub $I11, rx564_pos, rx564_off
    substr $S10, rx564_tgt, $I11, 6
    ne $S10, "atchet", rx564_fail
    add rx564_pos, 6
    (rx564_rep) = rx564_cur."!mark_commit"($I570)
  rxquantr569_done:
  # rx pass
    rx564_cur."!cursor_pass"(rx564_pos, "mod_ident:sym<ratchet>")
    rx564_cur."!cursor_debug"("PASS  ", "mod_ident:sym<ratchet>", " at pos=", rx564_pos)
    .return (rx564_cur)
  rx564_fail:
.annotate 'line', 3
    (rx564_rep, rx564_pos, $I10, $P10) = rx564_cur."!mark_fail"(0)
    lt rx564_pos, -1, rx564_done
    eq rx564_pos, -1, rx564_fail
    jump $I10
  rx564_done:
    rx564_cur."!cursor_fail"()
    rx564_cur."!cursor_debug"("FAIL  ", "mod_ident:sym<ratchet>")
    .return (rx564_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident:sym<ratchet>"  :subid("155_1274564774.16047") :method
.annotate 'line', 3
    new $P566, "ResizablePMCArray"
    push $P566, "r"
    .return ($P566)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<sigspace>"  :subid("156_1274564774.16047") :method :outer("11_1274564774.16047")
.annotate 'line', 3
    .local string rx572_tgt
    .local int rx572_pos
    .local int rx572_off
    .local int rx572_eos
    .local int rx572_rep
    .local pmc rx572_cur
    (rx572_cur, rx572_pos, rx572_tgt) = self."!cursor_start"()
    rx572_cur."!cursor_debug"("START ", "mod_ident:sym<sigspace>")
    .lex unicode:"$\x{a2}", rx572_cur
    .local pmc match
    .lex "$/", match
    length rx572_eos, rx572_tgt
    set rx572_off, 0
    lt rx572_pos, 2, rx572_start
    sub rx572_off, rx572_pos, 1
    substr rx572_tgt, rx572_tgt, rx572_off
  rx572_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan575_done
    goto rxscan575_scan
  rxscan575_loop:
    ($P10) = rx572_cur."from"()
    inc $P10
    set rx572_pos, $P10
    ge rx572_pos, rx572_eos, rxscan575_done
  rxscan575_scan:
    set_addr $I10, rxscan575_loop
    rx572_cur."!mark_push"(0, rx572_pos, $I10)
  rxscan575_done:
.annotate 'line', 184
  # rx subcapture "sym"
    set_addr $I10, rxcap_576_fail
    rx572_cur."!mark_push"(0, rx572_pos, $I10)
  # rx literal  "s"
    add $I11, rx572_pos, 1
    gt $I11, rx572_eos, rx572_fail
    sub $I11, rx572_pos, rx572_off
    substr $S10, rx572_tgt, $I11, 1
    ne $S10, "s", rx572_fail
    add rx572_pos, 1
    set_addr $I10, rxcap_576_fail
    ($I12, $I11) = rx572_cur."!mark_peek"($I10)
    rx572_cur."!cursor_pos"($I11)
    ($P10) = rx572_cur."!cursor_start"()
    $P10."!cursor_pass"(rx572_pos, "")
    rx572_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_576_done
  rxcap_576_fail:
    goto rx572_fail
  rxcap_576_done:
  # rx rxquantr577 ** 0..1
    set_addr $I578, rxquantr577_done
    rx572_cur."!mark_push"(0, rx572_pos, $I578)
  rxquantr577_loop:
  # rx literal  "igspace"
    add $I11, rx572_pos, 7
    gt $I11, rx572_eos, rx572_fail
    sub $I11, rx572_pos, rx572_off
    substr $S10, rx572_tgt, $I11, 7
    ne $S10, "igspace", rx572_fail
    add rx572_pos, 7
    (rx572_rep) = rx572_cur."!mark_commit"($I578)
  rxquantr577_done:
  # rx pass
    rx572_cur."!cursor_pass"(rx572_pos, "mod_ident:sym<sigspace>")
    rx572_cur."!cursor_debug"("PASS  ", "mod_ident:sym<sigspace>", " at pos=", rx572_pos)
    .return (rx572_cur)
  rx572_fail:
.annotate 'line', 3
    (rx572_rep, rx572_pos, $I10, $P10) = rx572_cur."!mark_fail"(0)
    lt rx572_pos, -1, rx572_done
    eq rx572_pos, -1, rx572_fail
    jump $I10
  rx572_done:
    rx572_cur."!cursor_fail"()
    rx572_cur."!cursor_debug"("FAIL  ", "mod_ident:sym<sigspace>")
    .return (rx572_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident:sym<sigspace>"  :subid("157_1274564774.16047") :method
.annotate 'line', 3
    new $P574, "ResizablePMCArray"
    push $P574, "s"
    .return ($P574)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block579" :load :anon :subid("158_1274564774.16047")
.annotate 'line', 3
    .const 'Sub' $P581 = "11_1274564774.16047" 
    $P582 = $P581()
    .return ($P582)
.end


.namespace []
.sub "_block584" :load :anon :subid("159_1274564774.16047")
.annotate 'line', 1
    .const 'Sub' $P586 = "10_1274564774.16047" 
    $P587 = $P586()
    .return ($P587)
.end

### .include 'gen/p6regex-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1274564778.23532")
.annotate 'line', 0
    get_hll_global $P14, ["Regex";"P6Regex";"Actions"], "_block13" 
    capture_lex $P14
.annotate 'line', 4
    get_hll_global $P14, ["Regex";"P6Regex";"Actions"], "_block13" 
    capture_lex $P14
    $P1572 = $P14()
.annotate 'line', 1
    .return ($P1572)
    .const 'Sub' $P1574 = "90_1274564778.23532" 
    .return ($P1574)
.end


.namespace []
.sub "" :load :init :subid("post91") :outer("10_1274564778.23532")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1274564778.23532" 
    .local pmc block
    set block, $P12
    $P1577 = get_root_global ["parrot"], "P6metaclass"
    $P1577."new_class"("Regex::P6Regex::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block13"  :subid("11_1274564778.23532") :outer("10_1274564778.23532")
.annotate 'line', 4
    .const 'Sub' $P1534 = "88_1274564778.23532" 
    capture_lex $P1534
    .const 'Sub' $P1465 = "84_1274564778.23532" 
    capture_lex $P1465
    .const 'Sub' $P1397 = "82_1274564778.23532" 
    capture_lex $P1397
    .const 'Sub' $P1324 = "79_1274564778.23532" 
    capture_lex $P1324
    .const 'Sub' $P1310 = "78_1274564778.23532" 
    capture_lex $P1310
    .const 'Sub' $P1286 = "77_1274564778.23532" 
    capture_lex $P1286
    .const 'Sub' $P1268 = "76_1274564778.23532" 
    capture_lex $P1268
    .const 'Sub' $P1254 = "75_1274564778.23532" 
    capture_lex $P1254
    .const 'Sub' $P1241 = "74_1274564778.23532" 
    capture_lex $P1241
    .const 'Sub' $P1210 = "73_1274564778.23532" 
    capture_lex $P1210
    .const 'Sub' $P1179 = "72_1274564778.23532" 
    capture_lex $P1179
    .const 'Sub' $P1163 = "71_1274564778.23532" 
    capture_lex $P1163
    .const 'Sub' $P1147 = "70_1274564778.23532" 
    capture_lex $P1147
    .const 'Sub' $P1131 = "69_1274564778.23532" 
    capture_lex $P1131
    .const 'Sub' $P1115 = "68_1274564778.23532" 
    capture_lex $P1115
    .const 'Sub' $P1099 = "67_1274564778.23532" 
    capture_lex $P1099
    .const 'Sub' $P1083 = "66_1274564778.23532" 
    capture_lex $P1083
    .const 'Sub' $P1067 = "65_1274564778.23532" 
    capture_lex $P1067
    .const 'Sub' $P1043 = "64_1274564778.23532" 
    capture_lex $P1043
    .const 'Sub' $P1028 = "63_1274564778.23532" 
    capture_lex $P1028
    .const 'Sub' $P972 = "62_1274564778.23532" 
    capture_lex $P972
    .const 'Sub' $P951 = "61_1274564778.23532" 
    capture_lex $P951
    .const 'Sub' $P929 = "60_1274564778.23532" 
    capture_lex $P929
    .const 'Sub' $P919 = "59_1274564778.23532" 
    capture_lex $P919
    .const 'Sub' $P909 = "58_1274564778.23532" 
    capture_lex $P909
    .const 'Sub' $P899 = "57_1274564778.23532" 
    capture_lex $P899
    .const 'Sub' $P887 = "56_1274564778.23532" 
    capture_lex $P887
    .const 'Sub' $P875 = "55_1274564778.23532" 
    capture_lex $P875
    .const 'Sub' $P863 = "54_1274564778.23532" 
    capture_lex $P863
    .const 'Sub' $P851 = "53_1274564778.23532" 
    capture_lex $P851
    .const 'Sub' $P839 = "52_1274564778.23532" 
    capture_lex $P839
    .const 'Sub' $P827 = "51_1274564778.23532" 
    capture_lex $P827
    .const 'Sub' $P815 = "50_1274564778.23532" 
    capture_lex $P815
    .const 'Sub' $P803 = "49_1274564778.23532" 
    capture_lex $P803
    .const 'Sub' $P780 = "48_1274564778.23532" 
    capture_lex $P780
    .const 'Sub' $P757 = "47_1274564778.23532" 
    capture_lex $P757
    .const 'Sub' $P739 = "46_1274564778.23532" 
    capture_lex $P739
    .const 'Sub' $P729 = "45_1274564778.23532" 
    capture_lex $P729
    .const 'Sub' $P711 = "44_1274564778.23532" 
    capture_lex $P711
    .const 'Sub' $P664 = "43_1274564778.23532" 
    capture_lex $P664
    .const 'Sub' $P647 = "42_1274564778.23532" 
    capture_lex $P647
    .const 'Sub' $P632 = "41_1274564778.23532" 
    capture_lex $P632
    .const 'Sub' $P617 = "40_1274564778.23532" 
    capture_lex $P617
    .const 'Sub' $P591 = "39_1274564778.23532" 
    capture_lex $P591
    .const 'Sub' $P541 = "37_1274564778.23532" 
    capture_lex $P541
    .const 'Sub' $P473 = "35_1274564778.23532" 
    capture_lex $P473
    .const 'Sub' $P418 = "32_1274564778.23532" 
    capture_lex $P418
    .const 'Sub' $P403 = "31_1274564778.23532" 
    capture_lex $P403
    .const 'Sub' $P377 = "29_1274564778.23532" 
    capture_lex $P377
    .const 'Sub' $P360 = "28_1274564778.23532" 
    capture_lex $P360
    .const 'Sub' $P338 = "27_1274564778.23532" 
    capture_lex $P338
    .const 'Sub' $P305 = "26_1274564778.23532" 
    capture_lex $P305
    .const 'Sub' $P50 = "13_1274564778.23532" 
    capture_lex $P50
    .const 'Sub' $P16 = "12_1274564778.23532" 
    capture_lex $P16
    get_global $P15, "@MODIFIERS"
    unless_null $P15, vivify_93
    $P15 = root_new ['parrot';'ResizablePMCArray']
    set_global "@MODIFIERS", $P15
  vivify_93:
.annotate 'line', 479
    .const 'Sub' $P16 = "12_1274564778.23532" 
    newclosure $P49, $P16
    .lex "buildsub", $P49
.annotate 'line', 496
    .const 'Sub' $P50 = "13_1274564778.23532" 
    newclosure $P304, $P50
    .lex "capnames", $P304
.annotate 'line', 562
    .const 'Sub' $P305 = "26_1274564778.23532" 
    newclosure $P337, $P305
    .lex "backmod", $P337
.annotate 'line', 569
    .const 'Sub' $P338 = "27_1274564778.23532" 
    newclosure $P358, $P338
    .lex "subrule_alias", $P358
.annotate 'line', 4
    get_global $P359, "@MODIFIERS"
.annotate 'line', 472
    find_lex $P1563, "buildsub"
    find_lex $P1564, "capnames"
    find_lex $P1565, "backmod"
    find_lex $P1566, "subrule_alias"
.annotate 'line', 4
    .return ($P1566)
    .const 'Sub' $P1568 = "89_1274564778.23532" 
    .return ($P1568)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "" :load :init :subid("post92") :outer("11_1274564778.23532")
.annotate 'line', 4
    get_hll_global $P14, ["Regex";"P6Regex";"Actions"], "_block13" 
    .local pmc block
    set block, $P14
.annotate 'line', 7

        $P1571 = new ['ResizablePMCArray']
        $P0 = new ['Hash']
        push $P1571, $P0
    
    set_global "@MODIFIERS", $P1571
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "buildsub"  :subid("12_1274564778.23532") :outer("11_1274564778.23532")
    .param pmc param_19
    .param pmc param_20 :optional
    .param int has_param_20 :opt_flag
.annotate 'line', 479
    new $P18, 'ExceptionHandler'
    set_addr $P18, control_17
    $P18."handle_types"(57)
    push_eh $P18
    .lex "$rpast", param_19
    if has_param_20, optparam_94
    get_hll_global $P21, ["PAST"], "Block"
    $P22 = $P21."new"()
    set param_20, $P22
  optparam_94:
    .lex "$block", param_20
.annotate 'line', 480
    $P23 = root_new ['parrot';'Hash']
    .lex "%capnames", $P23
    find_lex $P24, "$rpast"
    $P25 = "capnames"($P24, 0)
    store_lex "%capnames", $P25
.annotate 'line', 481
    new $P26, "Integer"
    assign $P26, 0
    find_lex $P27, "%capnames"
    unless_null $P27, vivify_95
    $P27 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P27
  vivify_95:
    set $P27[""], $P26
.annotate 'line', 482
    get_hll_global $P28, ["PAST"], "Regex"
.annotate 'line', 483
    get_hll_global $P29, ["PAST"], "Regex"
    $P30 = $P29."new"("scan" :named("pasttype"))
    find_lex $P31, "$rpast"
.annotate 'line', 485
    get_hll_global $P32, ["PAST"], "Regex"
    $P33 = $P32."new"("pass" :named("pasttype"))
    find_lex $P34, "%capnames"
    $P35 = $P28."new"($P30, $P31, $P33, "concat" :named("pasttype"), $P34 :named("capnames"))
.annotate 'line', 482
    store_lex "$rpast", $P35
.annotate 'line', 489
    find_lex $P37, "$block"
    $P38 = $P37."symbol"(unicode:"$\x{a2}")
    if $P38, unless_36_end
    find_lex $P39, "$block"
    $P39."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
  unless_36_end:
.annotate 'line', 490
    find_lex $P41, "$block"
    $P42 = $P41."symbol"("$/")
    if $P42, unless_40_end
    find_lex $P43, "$block"
    $P43."symbol"("$/", "lexical" :named("scope"))
  unless_40_end:
.annotate 'line', 491
    find_lex $P44, "$block"
    find_lex $P45, "$rpast"
    $P44."push"($P45)
.annotate 'line', 492
    find_lex $P46, "$block"
    $P46."blocktype"("method")
    find_lex $P47, "$block"
.annotate 'line', 479
    .return ($P47)
  control_17:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P48, exception, "payload"
    .return ($P48)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "capnames"  :subid("13_1274564778.23532") :outer("11_1274564778.23532")
    .param pmc param_53
    .param pmc param_54
.annotate 'line', 496
    .const 'Sub' $P279 = "24_1274564778.23532" 
    capture_lex $P279
    .const 'Sub' $P216 = "21_1274564778.23532" 
    capture_lex $P216
    .const 'Sub' $P174 = "19_1274564778.23532" 
    capture_lex $P174
    .const 'Sub' $P132 = "17_1274564778.23532" 
    capture_lex $P132
    .const 'Sub' $P65 = "14_1274564778.23532" 
    capture_lex $P65
    new $P52, 'ExceptionHandler'
    set_addr $P52, control_51
    $P52."handle_types"(57)
    push_eh $P52
    .lex "$ast", param_53
    .lex "$count", param_54
.annotate 'line', 497
    $P55 = root_new ['parrot';'Hash']
    .lex "%capnames", $P55
.annotate 'line', 498
    new $P56, "Undef"
    .lex "$pasttype", $P56
.annotate 'line', 496
    find_lex $P57, "%capnames"
.annotate 'line', 498
    find_lex $P58, "$ast"
    $P59 = $P58."pasttype"()
    store_lex "$pasttype", $P59
.annotate 'line', 499
    find_lex $P61, "$pasttype"
    set $S62, $P61
    iseq $I63, $S62, "alt"
    if $I63, if_60
.annotate 'line', 512
    find_lex $P123, "$pasttype"
    set $S124, $P123
    iseq $I125, $S124, "concat"
    if $I125, if_122
.annotate 'line', 521
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
.annotate 'line', 534
    find_lex $P212, "$pasttype"
    set $S213, $P212
    iseq $I214, $S213, "subcapture"
    if $I214, if_211
.annotate 'line', 551
    find_lex $P275, "$pasttype"
    set $S276, $P275
    iseq $I277, $S276, "quant"
    unless $I277, if_274_end
    .const 'Sub' $P279 = "24_1274564778.23532" 
    capture_lex $P279
    $P279()
  if_274_end:
    goto if_211_end
  if_211:
.annotate 'line', 534
    .const 'Sub' $P216 = "21_1274564778.23532" 
    capture_lex $P216
    $P216()
  if_211_end:
    goto if_164_end
  if_164:
.annotate 'line', 521
    .const 'Sub' $P174 = "19_1274564778.23532" 
    capture_lex $P174
    $P174()
  if_164_end:
    goto if_122_end
  if_122:
.annotate 'line', 513
    find_lex $P127, "$ast"
    $P128 = $P127."list"()
    defined $I129, $P128
    unless $I129, for_undef_116
    iter $P126, $P128
    new $P162, 'ExceptionHandler'
    set_addr $P162, loop161_handler
    $P162."handle_types"(64, 66, 65)
    push_eh $P162
  loop161_test:
    unless $P126, loop161_done
    shift $P130, $P126
  loop161_redo:
    .const 'Sub' $P132 = "17_1274564778.23532" 
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
  for_undef_116:
  if_122_end:
.annotate 'line', 512
    goto if_60_end
  if_60:
.annotate 'line', 499
    .const 'Sub' $P65 = "14_1274564778.23532" 
    capture_lex $P65
    $P65()
  if_60_end:
.annotate 'line', 558
    find_lex $P300, "$count"
    find_lex $P301, "%capnames"
    unless_null $P301, vivify_136
    $P301 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P301
  vivify_136:
    set $P301[""], $P300
    find_lex $P302, "%capnames"
.annotate 'line', 496
    .return ($P302)
  control_51:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P303, exception, "payload"
    .return ($P303)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block278"  :anon :subid("24_1274564778.23532") :outer("13_1274564778.23532")
.annotate 'line', 551
    .const 'Sub' $P290 = "25_1274564778.23532" 
    capture_lex $P290
.annotate 'line', 552
    $P280 = root_new ['parrot';'Hash']
    .lex "%astcap", $P280
    find_lex $P281, "$ast"
    unless_null $P281, vivify_96
    $P281 = root_new ['parrot';'ResizablePMCArray']
  vivify_96:
    set $P282, $P281[0]
    unless_null $P282, vivify_97
    new $P282, "Undef"
  vivify_97:
    find_lex $P283, "$count"
    $P284 = "capnames"($P282, $P283)
    store_lex "%astcap", $P284
.annotate 'line', 553
    find_lex $P286, "%astcap"
    defined $I287, $P286
    unless $I287, for_undef_98
    iter $P285, $P286
    new $P296, 'ExceptionHandler'
    set_addr $P296, loop295_handler
    $P296."handle_types"(64, 66, 65)
    push_eh $P296
  loop295_test:
    unless $P285, loop295_done
    shift $P288, $P285
  loop295_redo:
    .const 'Sub' $P290 = "25_1274564778.23532" 
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
  for_undef_98:
.annotate 'line', 556
    find_lex $P298, "%astcap"
    unless_null $P298, vivify_100
    $P298 = root_new ['parrot';'Hash']
  vivify_100:
    set $P299, $P298[""]
    unless_null $P299, vivify_101
    new $P299, "Undef"
  vivify_101:
    store_lex "$count", $P299
.annotate 'line', 551
    .return ($P299)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block289"  :anon :subid("25_1274564778.23532") :outer("24_1274564778.23532")
    .param pmc param_291
.annotate 'line', 553
    .lex "$_", param_291
.annotate 'line', 554
    new $P292, "Integer"
    assign $P292, 2
    find_lex $P293, "$_"
    find_lex $P294, "%capnames"
    unless_null $P294, vivify_99
    $P294 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P294
  vivify_99:
    set $P294[$P293], $P292
.annotate 'line', 553
    .return ($P292)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block215"  :anon :subid("21_1274564778.23532") :outer("13_1274564778.23532")
.annotate 'line', 534
    .const 'Sub' $P256 = "23_1274564778.23532" 
    capture_lex $P256
    .const 'Sub' $P228 = "22_1274564778.23532" 
    capture_lex $P228
.annotate 'line', 535
    new $P217, "Undef"
    .lex "$name", $P217
.annotate 'line', 536
    $P218 = root_new ['parrot';'ResizablePMCArray']
    .lex "@names", $P218
.annotate 'line', 545
    $P219 = root_new ['parrot';'Hash']
    .lex "%x", $P219
.annotate 'line', 535
    find_lex $P220, "$ast"
    $P221 = $P220."name"()
    store_lex "$name", $P221
.annotate 'line', 536

            $P0 = find_lex '$name'
            $S0 = $P0
            $P222 = split '=', $S0
        
    store_lex "@names", $P222
.annotate 'line', 541
    find_lex $P224, "@names"
    defined $I225, $P224
    unless $I225, for_undef_102
    iter $P223, $P224
    new $P245, 'ExceptionHandler'
    set_addr $P245, loop244_handler
    $P245."handle_types"(64, 66, 65)
    push_eh $P245
  loop244_test:
    unless $P223, loop244_done
    shift $P226, $P223
  loop244_redo:
    .const 'Sub' $P228 = "22_1274564778.23532" 
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
  for_undef_102:
.annotate 'line', 545
    find_lex $P247, "$ast"
    unless_null $P247, vivify_104
    $P247 = root_new ['parrot';'ResizablePMCArray']
  vivify_104:
    set $P248, $P247[0]
    unless_null $P248, vivify_105
    new $P248, "Undef"
  vivify_105:
    find_lex $P249, "$count"
    $P250 = "capnames"($P248, $P249)
    store_lex "%x", $P250
.annotate 'line', 546
    find_lex $P252, "%x"
    defined $I253, $P252
    unless $I253, for_undef_106
    iter $P251, $P252
    new $P270, 'ExceptionHandler'
    set_addr $P270, loop269_handler
    $P270."handle_types"(64, 66, 65)
    push_eh $P270
  loop269_test:
    unless $P251, loop269_done
    shift $P254, $P251
  loop269_redo:
    .const 'Sub' $P256 = "23_1274564778.23532" 
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
  for_undef_106:
.annotate 'line', 549
    find_lex $P272, "%x"
    unless_null $P272, vivify_112
    $P272 = root_new ['parrot';'Hash']
  vivify_112:
    set $P273, $P272[""]
    unless_null $P273, vivify_113
    new $P273, "Undef"
  vivify_113:
    store_lex "$count", $P273
.annotate 'line', 534
    .return ($P273)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block227"  :anon :subid("22_1274564778.23532") :outer("21_1274564778.23532")
    .param pmc param_229
.annotate 'line', 541
    .lex "$_", param_229
.annotate 'line', 542
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
.annotate 'line', 543
    new $P241, "Integer"
    assign $P241, 1
    find_lex $P242, "$_"
    find_lex $P243, "%capnames"
    unless_null $P243, vivify_103
    $P243 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P243
  vivify_103:
    set $P243[$P242], $P241
.annotate 'line', 541
    .return ($P241)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block255"  :anon :subid("23_1274564778.23532") :outer("21_1274564778.23532")
    .param pmc param_257
.annotate 'line', 546
    .lex "$_", param_257
.annotate 'line', 547
    find_lex $P258, "$_"
    find_lex $P259, "%capnames"
    unless_null $P259, vivify_107
    $P259 = root_new ['parrot';'Hash']
  vivify_107:
    set $P260, $P259[$P258]
    unless_null $P260, vivify_108
    new $P260, "Undef"
  vivify_108:
    set $N261, $P260
    new $P262, 'Float'
    set $P262, $N261
    find_lex $P263, "$_"
    find_lex $P264, "%x"
    unless_null $P264, vivify_109
    $P264 = root_new ['parrot';'Hash']
  vivify_109:
    set $P265, $P264[$P263]
    unless_null $P265, vivify_110
    new $P265, "Undef"
  vivify_110:
    add $P266, $P262, $P265
    find_lex $P267, "$_"
    find_lex $P268, "%capnames"
    unless_null $P268, vivify_111
    $P268 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P268
  vivify_111:
    set $P268[$P267], $P266
.annotate 'line', 546
    .return ($P266)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block173"  :anon :subid("19_1274564778.23532") :outer("13_1274564778.23532")
.annotate 'line', 521
    .const 'Sub' $P192 = "20_1274564778.23532" 
    capture_lex $P192
.annotate 'line', 522
    new $P175, "Undef"
    .lex "$name", $P175
.annotate 'line', 524
    $P176 = root_new ['parrot';'ResizablePMCArray']
    .lex "@names", $P176
.annotate 'line', 522
    find_lex $P177, "$ast"
    $P178 = $P177."name"()
    store_lex "$name", $P178
.annotate 'line', 523
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
.annotate 'line', 524

            $P0 = find_lex '$name'
            $S0 = $P0
            $P186 = split '=', $S0
        
    store_lex "@names", $P186
.annotate 'line', 529
    find_lex $P188, "@names"
    defined $I189, $P188
    unless $I189, for_undef_114
    iter $P187, $P188
    new $P209, 'ExceptionHandler'
    set_addr $P209, loop208_handler
    $P209."handle_types"(64, 66, 65)
    push_eh $P209
  loop208_test:
    unless $P187, loop208_done
    shift $P190, $P187
  loop208_redo:
    .const 'Sub' $P192 = "20_1274564778.23532" 
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
  for_undef_114:
.annotate 'line', 521
    .return ($P187)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block191"  :anon :subid("20_1274564778.23532") :outer("19_1274564778.23532")
    .param pmc param_193
.annotate 'line', 529
    .lex "$_", param_193
.annotate 'line', 530
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
.annotate 'line', 531
    new $P205, "Integer"
    assign $P205, 1
    find_lex $P206, "$_"
    find_lex $P207, "%capnames"
    unless_null $P207, vivify_115
    $P207 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P207
  vivify_115:
    set $P207[$P206], $P205
.annotate 'line', 529
    .return ($P205)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block131"  :anon :subid("17_1274564778.23532") :outer("13_1274564778.23532")
    .param pmc param_134
.annotate 'line', 513
    .const 'Sub' $P143 = "18_1274564778.23532" 
    capture_lex $P143
.annotate 'line', 514
    $P133 = root_new ['parrot';'Hash']
    .lex "%x", $P133
    .lex "$_", param_134
    find_lex $P135, "$_"
    find_lex $P136, "$count"
    $P137 = "capnames"($P135, $P136)
    store_lex "%x", $P137
.annotate 'line', 515
    find_lex $P139, "%x"
    defined $I140, $P139
    unless $I140, for_undef_117
    iter $P138, $P139
    new $P157, 'ExceptionHandler'
    set_addr $P157, loop156_handler
    $P157."handle_types"(64, 66, 65)
    push_eh $P157
  loop156_test:
    unless $P138, loop156_done
    shift $P141, $P138
  loop156_redo:
    .const 'Sub' $P143 = "18_1274564778.23532" 
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
  for_undef_117:
.annotate 'line', 518
    find_lex $P159, "%x"
    unless_null $P159, vivify_123
    $P159 = root_new ['parrot';'Hash']
  vivify_123:
    set $P160, $P159[""]
    unless_null $P160, vivify_124
    new $P160, "Undef"
  vivify_124:
    store_lex "$count", $P160
.annotate 'line', 513
    .return ($P160)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block142"  :anon :subid("18_1274564778.23532") :outer("17_1274564778.23532")
    .param pmc param_144
.annotate 'line', 515
    .lex "$_", param_144
.annotate 'line', 516
    find_lex $P145, "$_"
    find_lex $P146, "%capnames"
    unless_null $P146, vivify_118
    $P146 = root_new ['parrot';'Hash']
  vivify_118:
    set $P147, $P146[$P145]
    unless_null $P147, vivify_119
    new $P147, "Undef"
  vivify_119:
    set $N148, $P147
    new $P149, 'Float'
    set $P149, $N148
    find_lex $P150, "$_"
    find_lex $P151, "%x"
    unless_null $P151, vivify_120
    $P151 = root_new ['parrot';'Hash']
  vivify_120:
    set $P152, $P151[$P150]
    unless_null $P152, vivify_121
    new $P152, "Undef"
  vivify_121:
    add $P153, $P149, $P152
    find_lex $P154, "$_"
    find_lex $P155, "%capnames"
    unless_null $P155, vivify_122
    $P155 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P155
  vivify_122:
    set $P155[$P154], $P153
.annotate 'line', 515
    .return ($P153)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block64"  :anon :subid("14_1274564778.23532") :outer("13_1274564778.23532")
.annotate 'line', 499
    .const 'Sub' $P74 = "15_1274564778.23532" 
    capture_lex $P74
.annotate 'line', 500
    new $P66, "Undef"
    .lex "$max", $P66
    find_lex $P67, "$count"
    store_lex "$max", $P67
.annotate 'line', 501
    find_lex $P69, "$ast"
    $P70 = $P69."list"()
    defined $I71, $P70
    unless $I71, for_undef_125
    iter $P68, $P70
    new $P119, 'ExceptionHandler'
    set_addr $P119, loop118_handler
    $P119."handle_types"(64, 66, 65)
    push_eh $P119
  loop118_test:
    unless $P68, loop118_done
    shift $P72, $P68
  loop118_redo:
    .const 'Sub' $P74 = "15_1274564778.23532" 
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
  for_undef_125:
.annotate 'line', 510
    find_lex $P121, "$max"
    store_lex "$count", $P121
.annotate 'line', 499
    .return ($P121)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block73"  :anon :subid("15_1274564778.23532") :outer("14_1274564778.23532")
    .param pmc param_76
.annotate 'line', 501
    .const 'Sub' $P85 = "16_1274564778.23532" 
    capture_lex $P85
.annotate 'line', 502
    $P75 = root_new ['parrot';'Hash']
    .lex "%x", $P75
    .lex "$_", param_76
    find_lex $P77, "$_"
    find_lex $P78, "$count"
    $P79 = "capnames"($P77, $P78)
    store_lex "%x", $P79
.annotate 'line', 503
    find_lex $P81, "%x"
    defined $I82, $P81
    unless $I82, for_undef_126
    iter $P80, $P81
    new $P106, 'ExceptionHandler'
    set_addr $P106, loop105_handler
    $P106."handle_types"(64, 66, 65)
    push_eh $P106
  loop105_test:
    unless $P80, loop105_done
    shift $P83, $P80
  loop105_redo:
    .const 'Sub' $P85 = "16_1274564778.23532" 
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
  for_undef_126:
.annotate 'line', 508
    find_lex $P110, "%x"
    unless_null $P110, vivify_132
    $P110 = root_new ['parrot';'Hash']
  vivify_132:
    set $P111, $P110[""]
    unless_null $P111, vivify_133
    new $P111, "Undef"
  vivify_133:
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
    unless_null $P116, vivify_134
    $P116 = root_new ['parrot';'Hash']
  vivify_134:
    set $P117, $P116[""]
    unless_null $P117, vivify_135
    new $P117, "Undef"
  vivify_135:
    store_lex "$max", $P117
    set $P108, $P117
  if_109_end:
.annotate 'line', 501
    .return ($P108)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block84"  :anon :subid("16_1274564778.23532") :outer("15_1274564778.23532")
    .param pmc param_86
.annotate 'line', 503
    .lex "$_", param_86
.annotate 'line', 504
    find_lex $P91, "$_"
    find_lex $P92, "%capnames"
    unless_null $P92, vivify_127
    $P92 = root_new ['parrot';'Hash']
  vivify_127:
    set $P93, $P92[$P91]
    unless_null $P93, vivify_128
    new $P93, "Undef"
  vivify_128:
    set $N94, $P93
    islt $I95, $N94, 2.0
    if $I95, if_90
    new $P89, 'Integer'
    set $P89, $I95
    goto if_90_end
  if_90:
    find_lex $P96, "$_"
    find_lex $P97, "%x"
    unless_null $P97, vivify_129
    $P97 = root_new ['parrot';'Hash']
  vivify_129:
    set $P98, $P97[$P96]
    unless_null $P98, vivify_130
    new $P98, "Undef"
  vivify_130:
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
.annotate 'line', 505
    find_lex $P103, "$_"
    find_lex $P104, "%capnames"
    unless_null $P104, vivify_131
    $P104 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P104
  vivify_131:
    set $P104[$P103], $P87
.annotate 'line', 503
    .return ($P87)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backmod"  :subid("26_1274564778.23532") :outer("11_1274564778.23532")
    .param pmc param_308
    .param pmc param_309
.annotate 'line', 562
    new $P307, 'ExceptionHandler'
    set_addr $P307, control_306
    $P307."handle_types"(57)
    push_eh $P307
    .lex "$ast", param_308
    .lex "$backmod", param_309
.annotate 'line', 563
    find_lex $P311, "$backmod"
    set $S312, $P311
    iseq $I313, $S312, ":"
    if $I313, if_310
.annotate 'line', 564
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
.annotate 'line', 565
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
.annotate 'line', 564
    find_lex $P324, "$ast"
    $P324."backtrack"("f")
  if_315_end:
    goto if_310_end
  if_310:
.annotate 'line', 563
    find_lex $P314, "$ast"
    $P314."backtrack"("r")
  if_310_end:
    find_lex $P335, "$ast"
.annotate 'line', 562
    .return ($P335)
  control_306:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P336, exception, "payload"
    .return ($P336)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "subrule_alias"  :subid("27_1274564778.23532") :outer("11_1274564778.23532")
    .param pmc param_341
    .param pmc param_342
.annotate 'line', 569
    new $P340, 'ExceptionHandler'
    set_addr $P340, control_339
    $P340."handle_types"(57)
    push_eh $P340
    .lex "$past", param_341
    .lex "$name", param_342
.annotate 'line', 570
    find_lex $P344, "$past"
    $S345 = $P344."name"()
    isgt $I346, $S345, ""
    if $I346, if_343
.annotate 'line', 571
    find_lex $P353, "$past"
    find_lex $P354, "$name"
    $P353."name"($P354)
    goto if_343_end
  if_343:
.annotate 'line', 570
    find_lex $P347, "$past"
    find_lex $P348, "$name"
    concat $P349, $P348, "="
    find_lex $P350, "$past"
    $S351 = $P350."name"()
    concat $P352, $P349, $S351
    $P347."name"($P352)
  if_343_end:
.annotate 'line', 572
    find_lex $P355, "$past"
    $P356 = $P355."subtype"("capture")
.annotate 'line', 569
    .return ($P356)
  control_339:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P357, exception, "payload"
    .return ($P357)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "arg"  :subid("28_1274564778.23532") :method :outer("11_1274564778.23532")
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
    unless_null $P367, vivify_137
    $P367 = root_new ['parrot';'Hash']
  vivify_137:
    set $P368, $P367["quote_EXPR"]
    unless_null $P368, vivify_138
    new $P368, "Undef"
  vivify_138:
    if $P368, if_366
    find_lex $P372, "$/"
    unless_null $P372, vivify_139
    $P372 = root_new ['parrot';'Hash']
  vivify_139:
    set $P373, $P372["val"]
    unless_null $P373, vivify_140
    new $P373, "Undef"
  vivify_140:
    set $N374, $P373
    new $P365, 'Float'
    set $P365, $N374
    goto if_366_end
  if_366:
    find_lex $P369, "$/"
    unless_null $P369, vivify_141
    $P369 = root_new ['parrot';'Hash']
  vivify_141:
    set $P370, $P369["quote_EXPR"]
    unless_null $P370, vivify_142
    new $P370, "Undef"
  vivify_142:
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
.sub "arglist"  :subid("29_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_380
.annotate 'line', 18
    .const 'Sub' $P390 = "30_1274564778.23532" 
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
    unless_null $P385, vivify_143
    $P385 = root_new ['parrot';'Hash']
  vivify_143:
    set $P386, $P385["arg"]
    unless_null $P386, vivify_144
    new $P386, "Undef"
  vivify_144:
    defined $I387, $P386
    unless $I387, for_undef_145
    iter $P384, $P386
    new $P397, 'ExceptionHandler'
    set_addr $P397, loop396_handler
    $P397."handle_types"(64, 66, 65)
    push_eh $P397
  loop396_test:
    unless $P384, loop396_done
    shift $P388, $P384
  loop396_redo:
    .const 'Sub' $P390 = "30_1274564778.23532" 
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
  for_undef_145:
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
.sub "_block389"  :anon :subid("30_1274564778.23532") :outer("29_1274564778.23532")
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
.sub "TOP"  :subid("31_1274564778.23532") :method :outer("11_1274564778.23532")
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
    unless_null $P408, vivify_146
    $P408 = root_new ['parrot';'Hash']
  vivify_146:
    set $P409, $P408["nibbler"]
    unless_null $P409, vivify_147
    new $P409, "Undef"
  vivify_147:
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
.sub "nibbler"  :subid("32_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_421
    .param pmc param_422 :optional
    .param int has_param_422 :opt_flag
.annotate 'line', 30
    .const 'Sub' $P456 = "34_1274564778.23532" 
    capture_lex $P456
    .const 'Sub' $P430 = "33_1274564778.23532" 
    capture_lex $P430
    new $P420, 'ExceptionHandler'
    set_addr $P420, control_419
    $P420."handle_types"(57)
    push_eh $P420
    .lex "self", self
    .lex "$/", param_421
    if has_param_422, optparam_148
    new $P423, "Undef"
    set param_422, $P423
  optparam_148:
    .lex "$key", param_422
.annotate 'line', 42
    new $P424, "Undef"
    .lex "$past", $P424
.annotate 'line', 31
    find_lex $P426, "$key"
    set $S427, $P426
    iseq $I428, $S427, "open"
    unless $I428, if_425_end
    .const 'Sub' $P430 = "33_1274564778.23532" 
    capture_lex $P430
    $P430()
  if_425_end:
.annotate 'line', 41
    get_global $P440, "@MODIFIERS"
    $P440."shift"()
    find_lex $P441, "$past"
.annotate 'line', 43
    find_lex $P443, "$/"
    unless_null $P443, vivify_151
    $P443 = root_new ['parrot';'Hash']
  vivify_151:
    set $P444, $P443["termish"]
    unless_null $P444, vivify_152
    new $P444, "Undef"
  vivify_152:
    set $N445, $P444
    isgt $I446, $N445, 1.0
    if $I446, if_442
.annotate 'line', 50
    find_lex $P465, "$/"
    unless_null $P465, vivify_153
    $P465 = root_new ['parrot';'Hash']
  vivify_153:
    set $P466, $P465["termish"]
    unless_null $P466, vivify_154
    $P466 = root_new ['parrot';'ResizablePMCArray']
  vivify_154:
    set $P467, $P466[0]
    unless_null $P467, vivify_155
    new $P467, "Undef"
  vivify_155:
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
    unless_null $P451, vivify_156
    $P451 = root_new ['parrot';'Hash']
  vivify_156:
    set $P452, $P451["termish"]
    unless_null $P452, vivify_157
    new $P452, "Undef"
  vivify_157:
    defined $I453, $P452
    unless $I453, for_undef_158
    iter $P450, $P452
    new $P463, 'ExceptionHandler'
    set_addr $P463, loop462_handler
    $P463."handle_types"(64, 66, 65)
    push_eh $P463
  loop462_test:
    unless $P450, loop462_done
    shift $P454, $P450
  loop462_redo:
    .const 'Sub' $P456 = "34_1274564778.23532" 
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
  for_undef_158:
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
.sub "_block429"  :anon :subid("33_1274564778.23532") :outer("32_1274564778.23532")
.annotate 'line', 32
    $P431 = root_new ['parrot';'Hash']
    .lex "%old", $P431
.annotate 'line', 33
    $P432 = root_new ['parrot';'Hash']
    .lex "%new", $P432
.annotate 'line', 32
    get_global $P433, "@MODIFIERS"
    unless_null $P433, vivify_149
    $P433 = root_new ['parrot';'ResizablePMCArray']
  vivify_149:
    set $P434, $P433[0]
    unless_null $P434, vivify_150
    new $P434, "Undef"
  vivify_150:
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
.sub "_block455"  :anon :subid("34_1274564778.23532") :outer("32_1274564778.23532")
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
.sub "termish"  :subid("35_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_476
.annotate 'line', 55
    .const 'Sub' $P489 = "36_1274564778.23532" 
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
    unless_null $P484, vivify_159
    $P484 = root_new ['parrot';'Hash']
  vivify_159:
    set $P485, $P484["noun"]
    unless_null $P485, vivify_160
    new $P485, "Undef"
  vivify_160:
    defined $I486, $P485
    unless $I486, for_undef_161
    iter $P483, $P485
    new $P535, 'ExceptionHandler'
    set_addr $P535, loop534_handler
    $P535."handle_types"(64, 66, 65)
    push_eh $P535
  loop534_test:
    unless $P483, loop534_done
    shift $P487, $P483
  loop534_redo:
    .const 'Sub' $P489 = "36_1274564778.23532" 
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
  for_undef_161:
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
.sub "_block488"  :anon :subid("36_1274564778.23532") :outer("35_1274564778.23532")
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
    unless_null $P508, vivify_162
    $P508 = root_new ['parrot';'ResizablePMCArray']
  vivify_162:
    set $P509, $P508[0]
    unless_null $P509, vivify_163
    new $P509, "Undef"
  vivify_163:
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
    unless_null $P528, vivify_164
    $P528 = root_new ['parrot';'ResizablePMCArray']
  vivify_164:
    set $P529, $P528[0]
    unless_null $P529, vivify_165
    new $P529, "Undef"
  vivify_165:
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
    unless_null $P512, vivify_166
    $P512 = root_new ['parrot';'ResizablePMCArray']
  vivify_166:
    set $P513, $P512[0]
    unless_null $P513, vivify_167
    new $P513, "Undef"
  vivify_167:
    find_lex $P514, "$ast"
    unless_null $P514, vivify_168
    $P514 = root_new ['parrot';'ResizablePMCArray']
  vivify_168:
    set $P515, $P514[0]
    unless_null $P515, vivify_169
    new $P515, "Undef"
  vivify_169:
    concat $P516, $P513, $P515
    find_lex $P517, "$lastlit"
    unless_null $P517, vivify_170
    $P517 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$lastlit", $P517
  vivify_170:
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
.sub "quantified_atom"  :subid("37_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_544
.annotate 'line', 76
    .const 'Sub' $P553 = "38_1274564778.23532" 
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
    unless_null $P546, vivify_171
    $P546 = root_new ['parrot';'Hash']
  vivify_171:
    set $P547, $P546["atom"]
    unless_null $P547, vivify_172
    new $P547, "Undef"
  vivify_172:
    $P548 = $P547."ast"()
    store_lex "$past", $P548
.annotate 'line', 78
    find_lex $P550, "$/"
    unless_null $P550, vivify_173
    $P550 = root_new ['parrot';'Hash']
  vivify_173:
    set $P551, $P550["quantifier"]
    unless_null $P551, vivify_174
    new $P551, "Undef"
  vivify_174:
    if $P551, if_549
.annotate 'line', 84
    find_lex $P567, "$/"
    unless_null $P567, vivify_175
    $P567 = root_new ['parrot';'Hash']
  vivify_175:
    set $P568, $P567["backmod"]
    unless_null $P568, vivify_176
    $P568 = root_new ['parrot';'ResizablePMCArray']
  vivify_176:
    set $P569, $P568[0]
    unless_null $P569, vivify_177
    new $P569, "Undef"
  vivify_177:
    unless $P569, if_566_end
    find_lex $P570, "$past"
    find_lex $P571, "$/"
    unless_null $P571, vivify_178
    $P571 = root_new ['parrot';'Hash']
  vivify_178:
    set $P572, $P571["backmod"]
    unless_null $P572, vivify_179
    $P572 = root_new ['parrot';'ResizablePMCArray']
  vivify_179:
    set $P573, $P572[0]
    unless_null $P573, vivify_180
    new $P573, "Undef"
  vivify_180:
    "backmod"($P570, $P573)
  if_566_end:
    goto if_549_end
  if_549:
.annotate 'line', 78
    .const 'Sub' $P553 = "38_1274564778.23532" 
    capture_lex $P553
    $P553()
  if_549_end:
.annotate 'line', 85
    find_lex $P579, "$past"
    if $P579, if_578
    set $P577, $P579
    goto if_578_end
  if_578:
    find_lex $P580, "$past"
    $P581 = $P580."backtrack"()
    isfalse $I582, $P581
    new $P577, 'Integer'
    set $P577, $I582
  if_578_end:
    if $P577, if_576
    set $P575, $P577
    goto if_576_end
  if_576:
    get_global $P583, "@MODIFIERS"
    unless_null $P583, vivify_184
    $P583 = root_new ['parrot';'ResizablePMCArray']
  vivify_184:
    set $P584, $P583[0]
    unless_null $P584, vivify_185
    $P584 = root_new ['parrot';'Hash']
  vivify_185:
    set $P585, $P584["r"]
    unless_null $P585, vivify_186
    new $P585, "Undef"
  vivify_186:
    set $P575, $P585
  if_576_end:
    unless $P575, if_574_end
.annotate 'line', 86
    find_lex $P586, "$past"
    $P586."backtrack"("r")
  if_574_end:
.annotate 'line', 88
    find_lex $P587, "$/"
    find_lex $P588, "$past"
    $P589 = $P587."!make"($P588)
.annotate 'line', 76
    .return ($P589)
  control_542:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P590, exception, "payload"
    .return ($P590)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block552"  :anon :subid("38_1274564778.23532") :outer("37_1274564778.23532")
.annotate 'line', 80
    new $P554, "Undef"
    .lex "$qast", $P554
.annotate 'line', 79
    find_lex $P556, "$past"
    isfalse $I557, $P556
    unless $I557, if_555_end
    find_lex $P558, "$/"
    $P558."panic"("Can't quantify zero-width atom")
  if_555_end:
.annotate 'line', 80
    find_lex $P559, "$/"
    unless_null $P559, vivify_181
    $P559 = root_new ['parrot';'Hash']
  vivify_181:
    set $P560, $P559["quantifier"]
    unless_null $P560, vivify_182
    $P560 = root_new ['parrot';'ResizablePMCArray']
  vivify_182:
    set $P561, $P560[0]
    unless_null $P561, vivify_183
    new $P561, "Undef"
  vivify_183:
    $P562 = $P561."ast"()
    store_lex "$qast", $P562
.annotate 'line', 81
    find_lex $P563, "$qast"
    find_lex $P564, "$past"
    $P563."unshift"($P564)
.annotate 'line', 82
    find_lex $P565, "$qast"
    store_lex "$past", $P565
.annotate 'line', 78
    .return ($P565)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "atom"  :subid("39_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_594
.annotate 'line', 91
    new $P593, 'ExceptionHandler'
    set_addr $P593, control_592
    $P593."handle_types"(57)
    push_eh $P593
    .lex "self", self
    .lex "$/", param_594
.annotate 'line', 92
    new $P595, "Undef"
    .lex "$past", $P595
.annotate 'line', 91
    find_lex $P596, "$past"
.annotate 'line', 93
    find_lex $P598, "$/"
    unless_null $P598, vivify_187
    $P598 = root_new ['parrot';'Hash']
  vivify_187:
    set $P599, $P598["metachar"]
    unless_null $P599, vivify_188
    new $P599, "Undef"
  vivify_188:
    if $P599, if_597
.annotate 'line', 95
    get_hll_global $P603, ["PAST"], "Regex"
    find_lex $P604, "$/"
    set $S605, $P604
    find_lex $P606, "$/"
    $P607 = $P603."new"($S605, "literal" :named("pasttype"), $P606 :named("node"))
    store_lex "$past", $P607
.annotate 'line', 96
    get_global $P609, "@MODIFIERS"
    unless_null $P609, vivify_189
    $P609 = root_new ['parrot';'ResizablePMCArray']
  vivify_189:
    set $P610, $P609[0]
    unless_null $P610, vivify_190
    $P610 = root_new ['parrot';'Hash']
  vivify_190:
    set $P611, $P610["i"]
    unless_null $P611, vivify_191
    new $P611, "Undef"
  vivify_191:
    unless $P611, if_608_end
    find_lex $P612, "$past"
    $P612."subtype"("ignorecase")
  if_608_end:
.annotate 'line', 94
    goto if_597_end
  if_597:
.annotate 'line', 93
    find_lex $P600, "$/"
    unless_null $P600, vivify_192
    $P600 = root_new ['parrot';'Hash']
  vivify_192:
    set $P601, $P600["metachar"]
    unless_null $P601, vivify_193
    new $P601, "Undef"
  vivify_193:
    $P602 = $P601."ast"()
    store_lex "$past", $P602
  if_597_end:
.annotate 'line', 98
    find_lex $P613, "$/"
    find_lex $P614, "$past"
    $P615 = $P613."!make"($P614)
.annotate 'line', 91
    .return ($P615)
  control_592:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P616, exception, "payload"
    .return ($P616)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<*>"  :subid("40_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_620
.annotate 'line', 101
    new $P619, 'ExceptionHandler'
    set_addr $P619, control_618
    $P619."handle_types"(57)
    push_eh $P619
    .lex "self", self
    .lex "$/", param_620
.annotate 'line', 102
    new $P621, "Undef"
    .lex "$past", $P621
    get_hll_global $P622, ["PAST"], "Regex"
    find_lex $P623, "$/"
    $P624 = $P622."new"("quant" :named("pasttype"), $P623 :named("node"))
    store_lex "$past", $P624
.annotate 'line', 103
    find_lex $P625, "$/"
    find_lex $P626, "$past"
    find_lex $P627, "$/"
    unless_null $P627, vivify_194
    $P627 = root_new ['parrot';'Hash']
  vivify_194:
    set $P628, $P627["backmod"]
    unless_null $P628, vivify_195
    new $P628, "Undef"
  vivify_195:
    $P629 = "backmod"($P626, $P628)
    $P630 = $P625."!make"($P629)
.annotate 'line', 101
    .return ($P630)
  control_618:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P631, exception, "payload"
    .return ($P631)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<+>"  :subid("41_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_635
.annotate 'line', 106
    new $P634, 'ExceptionHandler'
    set_addr $P634, control_633
    $P634."handle_types"(57)
    push_eh $P634
    .lex "self", self
    .lex "$/", param_635
.annotate 'line', 107
    new $P636, "Undef"
    .lex "$past", $P636
    get_hll_global $P637, ["PAST"], "Regex"
    find_lex $P638, "$/"
    $P639 = $P637."new"("quant" :named("pasttype"), 1 :named("min"), $P638 :named("node"))
    store_lex "$past", $P639
.annotate 'line', 108
    find_lex $P640, "$/"
    find_lex $P641, "$past"
    find_lex $P642, "$/"
    unless_null $P642, vivify_196
    $P642 = root_new ['parrot';'Hash']
  vivify_196:
    set $P643, $P642["backmod"]
    unless_null $P643, vivify_197
    new $P643, "Undef"
  vivify_197:
    $P644 = "backmod"($P641, $P643)
    $P645 = $P640."!make"($P644)
.annotate 'line', 106
    .return ($P645)
  control_633:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P646, exception, "payload"
    .return ($P646)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<?>"  :subid("42_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_650
.annotate 'line', 111
    new $P649, 'ExceptionHandler'
    set_addr $P649, control_648
    $P649."handle_types"(57)
    push_eh $P649
    .lex "self", self
    .lex "$/", param_650
.annotate 'line', 112
    new $P651, "Undef"
    .lex "$past", $P651
    get_hll_global $P652, ["PAST"], "Regex"
    find_lex $P653, "$/"
    $P654 = $P652."new"("quant" :named("pasttype"), 0 :named("min"), 1 :named("max"), $P653 :named("node"))
    store_lex "$past", $P654
.annotate 'line', 113
    find_lex $P655, "$/"
    find_lex $P656, "$past"
    find_lex $P657, "$/"
    unless_null $P657, vivify_198
    $P657 = root_new ['parrot';'Hash']
  vivify_198:
    set $P658, $P657["backmod"]
    unless_null $P658, vivify_199
    new $P658, "Undef"
  vivify_199:
    $P659 = "backmod"($P656, $P658)
    $P655."!make"($P659)
.annotate 'line', 114
    find_lex $P660, "$/"
    find_lex $P661, "$past"
    $P662 = $P660."!make"($P661)
.annotate 'line', 111
    .return ($P662)
  control_648:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P663, exception, "payload"
    .return ($P663)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<**>"  :subid("43_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_667
.annotate 'line', 117
    new $P666, 'ExceptionHandler'
    set_addr $P666, control_665
    $P666."handle_types"(57)
    push_eh $P666
    .lex "self", self
    .lex "$/", param_667
.annotate 'line', 118
    new $P668, "Undef"
    .lex "$past", $P668
.annotate 'line', 117
    find_lex $P669, "$past"
.annotate 'line', 119
    find_lex $P671, "$/"
    unless_null $P671, vivify_200
    $P671 = root_new ['parrot';'Hash']
  vivify_200:
    set $P672, $P671["quantified_atom"]
    unless_null $P672, vivify_201
    new $P672, "Undef"
  vivify_201:
    if $P672, if_670
.annotate 'line', 124
    get_hll_global $P679, ["PAST"], "Regex"
    find_lex $P680, "$/"
    unless_null $P680, vivify_202
    $P680 = root_new ['parrot';'Hash']
  vivify_202:
    set $P681, $P680["min"]
    unless_null $P681, vivify_203
    new $P681, "Undef"
  vivify_203:
    set $N682, $P681
    find_lex $P683, "$/"
    $P684 = $P679."new"("quant" :named("pasttype"), $N682 :named("min"), $P683 :named("node"))
    store_lex "$past", $P684
.annotate 'line', 125
    find_lex $P686, "$/"
    unless_null $P686, vivify_204
    $P686 = root_new ['parrot';'Hash']
  vivify_204:
    set $P687, $P686["max"]
    unless_null $P687, vivify_205
    new $P687, "Undef"
  vivify_205:
    isfalse $I688, $P687
    if $I688, if_685
.annotate 'line', 126
    find_lex $P694, "$/"
    unless_null $P694, vivify_206
    $P694 = root_new ['parrot';'Hash']
  vivify_206:
    set $P695, $P694["max"]
    unless_null $P695, vivify_207
    $P695 = root_new ['parrot';'ResizablePMCArray']
  vivify_207:
    set $P696, $P695[0]
    unless_null $P696, vivify_208
    new $P696, "Undef"
  vivify_208:
    set $S697, $P696
    isne $I698, $S697, "*"
    unless $I698, if_693_end
    find_lex $P699, "$past"
    find_lex $P700, "$/"
    unless_null $P700, vivify_209
    $P700 = root_new ['parrot';'Hash']
  vivify_209:
    set $P701, $P700["max"]
    unless_null $P701, vivify_210
    $P701 = root_new ['parrot';'ResizablePMCArray']
  vivify_210:
    set $P702, $P701[0]
    unless_null $P702, vivify_211
    new $P702, "Undef"
  vivify_211:
    set $N703, $P702
    $P699."max"($N703)
  if_693_end:
    goto if_685_end
  if_685:
.annotate 'line', 125
    find_lex $P689, "$past"
    find_lex $P690, "$/"
    unless_null $P690, vivify_212
    $P690 = root_new ['parrot';'Hash']
  vivify_212:
    set $P691, $P690["min"]
    unless_null $P691, vivify_213
    new $P691, "Undef"
  vivify_213:
    set $N692, $P691
    $P689."max"($N692)
  if_685_end:
.annotate 'line', 123
    goto if_670_end
  if_670:
.annotate 'line', 120
    get_hll_global $P673, ["PAST"], "Regex"
.annotate 'line', 121
    find_lex $P674, "$/"
    unless_null $P674, vivify_214
    $P674 = root_new ['parrot';'Hash']
  vivify_214:
    set $P675, $P674["quantified_atom"]
    unless_null $P675, vivify_215
    new $P675, "Undef"
  vivify_215:
    $P676 = $P675."ast"()
    find_lex $P677, "$/"
    $P678 = $P673."new"("quant" :named("pasttype"), 1 :named("min"), $P676 :named("sep"), $P677 :named("node"))
.annotate 'line', 120
    store_lex "$past", $P678
  if_670_end:
.annotate 'line', 128
    find_lex $P704, "$/"
    find_lex $P705, "$past"
    find_lex $P706, "$/"
    unless_null $P706, vivify_216
    $P706 = root_new ['parrot';'Hash']
  vivify_216:
    set $P707, $P706["backmod"]
    unless_null $P707, vivify_217
    new $P707, "Undef"
  vivify_217:
    $P708 = "backmod"($P705, $P707)
    $P709 = $P704."!make"($P708)
.annotate 'line', 117
    .return ($P709)
  control_665:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P710, exception, "payload"
    .return ($P710)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<ws>"  :subid("44_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_714
.annotate 'line', 131
    new $P713, 'ExceptionHandler'
    set_addr $P713, control_712
    $P713."handle_types"(57)
    push_eh $P713
    .lex "self", self
    .lex "$/", param_714
.annotate 'line', 132
    new $P715, "Undef"
    .lex "$past", $P715
.annotate 'line', 133
    get_global $P718, "@MODIFIERS"
    unless_null $P718, vivify_218
    $P718 = root_new ['parrot';'ResizablePMCArray']
  vivify_218:
    set $P719, $P718[0]
    unless_null $P719, vivify_219
    $P719 = root_new ['parrot';'Hash']
  vivify_219:
    set $P720, $P719["s"]
    unless_null $P720, vivify_220
    new $P720, "Undef"
  vivify_220:
    if $P720, if_717
    new $P724, "Integer"
    assign $P724, 0
    set $P716, $P724
    goto if_717_end
  if_717:
    get_hll_global $P721, ["PAST"], "Regex"
    find_lex $P722, "$/"
    $P723 = $P721."new"("ws", "subrule" :named("pasttype"), "method" :named("subtype"), $P722 :named("node"))
    set $P716, $P723
  if_717_end:
    store_lex "$past", $P716
.annotate 'line', 136
    find_lex $P725, "$/"
    find_lex $P726, "$past"
    $P727 = $P725."!make"($P726)
.annotate 'line', 131
    .return ($P727)
  control_712:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P728, exception, "payload"
    .return ($P728)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<[ ]>"  :subid("45_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_732
.annotate 'line', 140
    new $P731, 'ExceptionHandler'
    set_addr $P731, control_730
    $P731."handle_types"(57)
    push_eh $P731
    .lex "self", self
    .lex "$/", param_732
.annotate 'line', 141
    find_lex $P733, "$/"
    find_lex $P734, "$/"
    unless_null $P734, vivify_221
    $P734 = root_new ['parrot';'Hash']
  vivify_221:
    set $P735, $P734["nibbler"]
    unless_null $P735, vivify_222
    new $P735, "Undef"
  vivify_222:
    $P736 = $P735."ast"()
    $P737 = $P733."!make"($P736)
.annotate 'line', 140
    .return ($P737)
  control_730:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P738, exception, "payload"
    .return ($P738)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<( )>"  :subid("46_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_742
.annotate 'line', 144
    new $P741, 'ExceptionHandler'
    set_addr $P741, control_740
    $P741."handle_types"(57)
    push_eh $P741
    .lex "self", self
    .lex "$/", param_742
.annotate 'line', 145
    new $P743, "Undef"
    .lex "$subpast", $P743
.annotate 'line', 146
    new $P744, "Undef"
    .lex "$past", $P744
.annotate 'line', 145
    find_lex $P745, "$/"
    unless_null $P745, vivify_223
    $P745 = root_new ['parrot';'Hash']
  vivify_223:
    set $P746, $P745["nibbler"]
    unless_null $P746, vivify_224
    new $P746, "Undef"
  vivify_224:
    $P747 = $P746."ast"()
    $P748 = "buildsub"($P747)
    store_lex "$subpast", $P748
.annotate 'line', 146
    get_hll_global $P749, ["PAST"], "Regex"
    find_lex $P750, "$subpast"
    find_lex $P751, "$/"
    $P752 = $P749."new"($P750, "subrule" :named("pasttype"), "capture" :named("subtype"), $P751 :named("node"))
    store_lex "$past", $P752
.annotate 'line', 148
    find_lex $P753, "$/"
    find_lex $P754, "$past"
    $P755 = $P753."!make"($P754)
.annotate 'line', 144
    .return ($P755)
  control_740:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P756, exception, "payload"
    .return ($P756)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<'>"  :subid("47_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_760
.annotate 'line', 151
    new $P759, 'ExceptionHandler'
    set_addr $P759, control_758
    $P759."handle_types"(57)
    push_eh $P759
    .lex "self", self
    .lex "$/", param_760
.annotate 'line', 152
    new $P761, "Undef"
    .lex "$quote", $P761
.annotate 'line', 154
    new $P762, "Undef"
    .lex "$past", $P762
.annotate 'line', 152
    find_lex $P763, "$/"
    unless_null $P763, vivify_225
    $P763 = root_new ['parrot';'Hash']
  vivify_225:
    set $P764, $P763["quote_EXPR"]
    unless_null $P764, vivify_226
    new $P764, "Undef"
  vivify_226:
    $P765 = $P764."ast"()
    store_lex "$quote", $P765
.annotate 'line', 153
    get_hll_global $P767, ["PAST"], "Val"
    find_lex $P768, "$quote"
    $P769 = $P767."ACCEPTS"($P768)
    unless $P769, if_766_end
    find_lex $P770, "$quote"
    $P771 = $P770."value"()
    store_lex "$quote", $P771
  if_766_end:
.annotate 'line', 154
    get_hll_global $P772, ["PAST"], "Regex"
    find_lex $P773, "$quote"
    find_lex $P774, "$/"
    $P775 = $P772."new"($P773, "literal" :named("pasttype"), $P774 :named("node"))
    store_lex "$past", $P775
.annotate 'line', 155
    find_lex $P776, "$/"
    find_lex $P777, "$past"
    $P778 = $P776."!make"($P777)
.annotate 'line', 151
    .return ($P778)
  control_758:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P779, exception, "payload"
    .return ($P779)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<\">"  :subid("48_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_783
.annotate 'line', 158
    new $P782, 'ExceptionHandler'
    set_addr $P782, control_781
    $P782."handle_types"(57)
    push_eh $P782
    .lex "self", self
    .lex "$/", param_783
.annotate 'line', 159
    new $P784, "Undef"
    .lex "$quote", $P784
.annotate 'line', 161
    new $P785, "Undef"
    .lex "$past", $P785
.annotate 'line', 159
    find_lex $P786, "$/"
    unless_null $P786, vivify_227
    $P786 = root_new ['parrot';'Hash']
  vivify_227:
    set $P787, $P786["quote_EXPR"]
    unless_null $P787, vivify_228
    new $P787, "Undef"
  vivify_228:
    $P788 = $P787."ast"()
    store_lex "$quote", $P788
.annotate 'line', 160
    get_hll_global $P790, ["PAST"], "Val"
    find_lex $P791, "$quote"
    $P792 = $P790."ACCEPTS"($P791)
    unless $P792, if_789_end
    find_lex $P793, "$quote"
    $P794 = $P793."value"()
    store_lex "$quote", $P794
  if_789_end:
.annotate 'line', 161
    get_hll_global $P795, ["PAST"], "Regex"
    find_lex $P796, "$quote"
    find_lex $P797, "$/"
    $P798 = $P795."new"($P796, "literal" :named("pasttype"), $P797 :named("node"))
    store_lex "$past", $P798
.annotate 'line', 162
    find_lex $P799, "$/"
    find_lex $P800, "$past"
    $P801 = $P799."!make"($P800)
.annotate 'line', 158
    .return ($P801)
  control_781:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P802, exception, "payload"
    .return ($P802)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<.>"  :subid("49_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_806
.annotate 'line', 165
    new $P805, 'ExceptionHandler'
    set_addr $P805, control_804
    $P805."handle_types"(57)
    push_eh $P805
    .lex "self", self
    .lex "$/", param_806
.annotate 'line', 166
    new $P807, "Undef"
    .lex "$past", $P807
    get_hll_global $P808, ["PAST"], "Regex"
    find_lex $P809, "$/"
    $P810 = $P808."new"("charclass" :named("pasttype"), "." :named("subtype"), $P809 :named("node"))
    store_lex "$past", $P810
.annotate 'line', 167
    find_lex $P811, "$/"
    find_lex $P812, "$past"
    $P813 = $P811."!make"($P812)
.annotate 'line', 165
    .return ($P813)
  control_804:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P814, exception, "payload"
    .return ($P814)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<^>"  :subid("50_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_818
.annotate 'line', 170
    new $P817, 'ExceptionHandler'
    set_addr $P817, control_816
    $P817."handle_types"(57)
    push_eh $P817
    .lex "self", self
    .lex "$/", param_818
.annotate 'line', 171
    new $P819, "Undef"
    .lex "$past", $P819
    get_hll_global $P820, ["PAST"], "Regex"
    find_lex $P821, "$/"
    $P822 = $P820."new"("anchor" :named("pasttype"), "bos" :named("subtype"), $P821 :named("node"))
    store_lex "$past", $P822
.annotate 'line', 172
    find_lex $P823, "$/"
    find_lex $P824, "$past"
    $P825 = $P823."!make"($P824)
.annotate 'line', 170
    .return ($P825)
  control_816:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P826, exception, "payload"
    .return ($P826)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<^^>"  :subid("51_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_830
.annotate 'line', 175
    new $P829, 'ExceptionHandler'
    set_addr $P829, control_828
    $P829."handle_types"(57)
    push_eh $P829
    .lex "self", self
    .lex "$/", param_830
.annotate 'line', 176
    new $P831, "Undef"
    .lex "$past", $P831
    get_hll_global $P832, ["PAST"], "Regex"
    find_lex $P833, "$/"
    $P834 = $P832."new"("anchor" :named("pasttype"), "bol" :named("subtype"), $P833 :named("node"))
    store_lex "$past", $P834
.annotate 'line', 177
    find_lex $P835, "$/"
    find_lex $P836, "$past"
    $P837 = $P835."!make"($P836)
.annotate 'line', 175
    .return ($P837)
  control_828:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P838, exception, "payload"
    .return ($P838)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<$>"  :subid("52_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_842
.annotate 'line', 180
    new $P841, 'ExceptionHandler'
    set_addr $P841, control_840
    $P841."handle_types"(57)
    push_eh $P841
    .lex "self", self
    .lex "$/", param_842
.annotate 'line', 181
    new $P843, "Undef"
    .lex "$past", $P843
    get_hll_global $P844, ["PAST"], "Regex"
    find_lex $P845, "$/"
    $P846 = $P844."new"("anchor" :named("pasttype"), "eos" :named("subtype"), $P845 :named("node"))
    store_lex "$past", $P846
.annotate 'line', 182
    find_lex $P847, "$/"
    find_lex $P848, "$past"
    $P849 = $P847."!make"($P848)
.annotate 'line', 180
    .return ($P849)
  control_840:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P850, exception, "payload"
    .return ($P850)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<$$>"  :subid("53_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_854
.annotate 'line', 185
    new $P853, 'ExceptionHandler'
    set_addr $P853, control_852
    $P853."handle_types"(57)
    push_eh $P853
    .lex "self", self
    .lex "$/", param_854
.annotate 'line', 186
    new $P855, "Undef"
    .lex "$past", $P855
    get_hll_global $P856, ["PAST"], "Regex"
    find_lex $P857, "$/"
    $P858 = $P856."new"("anchor" :named("pasttype"), "eol" :named("subtype"), $P857 :named("node"))
    store_lex "$past", $P858
.annotate 'line', 187
    find_lex $P859, "$/"
    find_lex $P860, "$past"
    $P861 = $P859."!make"($P860)
.annotate 'line', 185
    .return ($P861)
  control_852:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P862, exception, "payload"
    .return ($P862)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<:::>"  :subid("54_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_866
.annotate 'line', 190
    new $P865, 'ExceptionHandler'
    set_addr $P865, control_864
    $P865."handle_types"(57)
    push_eh $P865
    .lex "self", self
    .lex "$/", param_866
.annotate 'line', 191
    new $P867, "Undef"
    .lex "$past", $P867
    get_hll_global $P868, ["PAST"], "Regex"
    find_lex $P869, "$/"
    $P870 = $P868."new"("cut" :named("pasttype"), $P869 :named("node"))
    store_lex "$past", $P870
.annotate 'line', 192
    find_lex $P871, "$/"
    find_lex $P872, "$past"
    $P873 = $P871."!make"($P872)
.annotate 'line', 190
    .return ($P873)
  control_864:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P874, exception, "payload"
    .return ($P874)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<lwb>"  :subid("55_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_878
.annotate 'line', 195
    new $P877, 'ExceptionHandler'
    set_addr $P877, control_876
    $P877."handle_types"(57)
    push_eh $P877
    .lex "self", self
    .lex "$/", param_878
.annotate 'line', 196
    new $P879, "Undef"
    .lex "$past", $P879
    get_hll_global $P880, ["PAST"], "Regex"
    find_lex $P881, "$/"
    $P882 = $P880."new"("anchor" :named("pasttype"), "lwb" :named("subtype"), $P881 :named("node"))
    store_lex "$past", $P882
.annotate 'line', 197
    find_lex $P883, "$/"
    find_lex $P884, "$past"
    $P885 = $P883."!make"($P884)
.annotate 'line', 195
    .return ($P885)
  control_876:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P886, exception, "payload"
    .return ($P886)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<rwb>"  :subid("56_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_890
.annotate 'line', 200
    new $P889, 'ExceptionHandler'
    set_addr $P889, control_888
    $P889."handle_types"(57)
    push_eh $P889
    .lex "self", self
    .lex "$/", param_890
.annotate 'line', 201
    new $P891, "Undef"
    .lex "$past", $P891
    get_hll_global $P892, ["PAST"], "Regex"
    find_lex $P893, "$/"
    $P894 = $P892."new"("anchor" :named("pasttype"), "rwb" :named("subtype"), $P893 :named("node"))
    store_lex "$past", $P894
.annotate 'line', 202
    find_lex $P895, "$/"
    find_lex $P896, "$past"
    $P897 = $P895."!make"($P896)
.annotate 'line', 200
    .return ($P897)
  control_888:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P898, exception, "payload"
    .return ($P898)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<bs>"  :subid("57_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_902
.annotate 'line', 205
    new $P901, 'ExceptionHandler'
    set_addr $P901, control_900
    $P901."handle_types"(57)
    push_eh $P901
    .lex "self", self
    .lex "$/", param_902
.annotate 'line', 206
    find_lex $P903, "$/"
    find_lex $P904, "$/"
    unless_null $P904, vivify_229
    $P904 = root_new ['parrot';'Hash']
  vivify_229:
    set $P905, $P904["backslash"]
    unless_null $P905, vivify_230
    new $P905, "Undef"
  vivify_230:
    $P906 = $P905."ast"()
    $P907 = $P903."!make"($P906)
.annotate 'line', 205
    .return ($P907)
  control_900:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P908, exception, "payload"
    .return ($P908)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<mod>"  :subid("58_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_912
.annotate 'line', 209
    new $P911, 'ExceptionHandler'
    set_addr $P911, control_910
    $P911."handle_types"(57)
    push_eh $P911
    .lex "self", self
    .lex "$/", param_912
.annotate 'line', 210
    find_lex $P913, "$/"
    find_lex $P914, "$/"
    unless_null $P914, vivify_231
    $P914 = root_new ['parrot';'Hash']
  vivify_231:
    set $P915, $P914["mod_internal"]
    unless_null $P915, vivify_232
    new $P915, "Undef"
  vivify_232:
    $P916 = $P915."ast"()
    $P917 = $P913."!make"($P916)
.annotate 'line', 209
    .return ($P917)
  control_910:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P918, exception, "payload"
    .return ($P918)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<assert>"  :subid("59_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_922
.annotate 'line', 213
    new $P921, 'ExceptionHandler'
    set_addr $P921, control_920
    $P921."handle_types"(57)
    push_eh $P921
    .lex "self", self
    .lex "$/", param_922
.annotate 'line', 214
    find_lex $P923, "$/"
    find_lex $P924, "$/"
    unless_null $P924, vivify_233
    $P924 = root_new ['parrot';'Hash']
  vivify_233:
    set $P925, $P924["assertion"]
    unless_null $P925, vivify_234
    new $P925, "Undef"
  vivify_234:
    $P926 = $P925."ast"()
    $P927 = $P923."!make"($P926)
.annotate 'line', 213
    .return ($P927)
  control_920:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P928, exception, "payload"
    .return ($P928)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<~>"  :subid("60_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_932
.annotate 'line', 217
    new $P931, 'ExceptionHandler'
    set_addr $P931, control_930
    $P931."handle_types"(57)
    push_eh $P931
    .lex "self", self
    .lex "$/", param_932
.annotate 'line', 218
    find_lex $P933, "$/"
    get_hll_global $P934, ["PAST"], "Regex"
.annotate 'line', 219
    find_lex $P935, "$/"
    unless_null $P935, vivify_235
    $P935 = root_new ['parrot';'Hash']
  vivify_235:
    set $P936, $P935["EXPR"]
    unless_null $P936, vivify_236
    new $P936, "Undef"
  vivify_236:
    $P937 = $P936."ast"()
.annotate 'line', 220
    get_hll_global $P938, ["PAST"], "Regex"
.annotate 'line', 221
    find_lex $P939, "$/"
    unless_null $P939, vivify_237
    $P939 = root_new ['parrot';'Hash']
  vivify_237:
    set $P940, $P939["GOAL"]
    unless_null $P940, vivify_238
    new $P940, "Undef"
  vivify_238:
    $P941 = $P940."ast"()
.annotate 'line', 222
    get_hll_global $P942, ["PAST"], "Regex"
    find_lex $P943, "$/"
    unless_null $P943, vivify_239
    $P943 = root_new ['parrot';'Hash']
  vivify_239:
    set $P944, $P943["GOAL"]
    unless_null $P944, vivify_240
    new $P944, "Undef"
  vivify_240:
    set $S945, $P944
    $P946 = $P942."new"("FAILGOAL", $S945, "subrule" :named("pasttype"), "method" :named("subtype"))
    $P947 = $P938."new"($P941, $P946, "alt" :named("pasttype"))
.annotate 'line', 220
    $P948 = $P934."new"($P937, $P947, "concat" :named("pasttype"))
.annotate 'line', 218
    $P949 = $P933."!make"($P948)
.annotate 'line', 217
    .return ($P949)
  control_930:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P950, exception, "payload"
    .return ($P950)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<{*}>"  :subid("61_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_954
.annotate 'line', 230
    new $P953, 'ExceptionHandler'
    set_addr $P953, control_952
    $P953."handle_types"(57)
    push_eh $P953
    .lex "self", self
    .lex "$/", param_954
.annotate 'line', 231
    new $P955, "Undef"
    .lex "$past", $P955
.annotate 'line', 232
    find_lex $P958, "$/"
    unless_null $P958, vivify_241
    $P958 = root_new ['parrot';'Hash']
  vivify_241:
    set $P959, $P958["key"]
    unless_null $P959, vivify_242
    new $P959, "Undef"
  vivify_242:
    if $P959, if_957
    new $P967, "Integer"
    assign $P967, 0
    set $P956, $P967
    goto if_957_end
  if_957:
    get_hll_global $P960, ["PAST"], "Regex"
    find_lex $P961, "$/"
    unless_null $P961, vivify_243
    $P961 = root_new ['parrot';'Hash']
  vivify_243:
    set $P962, $P961["key"]
    unless_null $P962, vivify_244
    $P962 = root_new ['parrot';'ResizablePMCArray']
  vivify_244:
    set $P963, $P962[0]
    unless_null $P963, vivify_245
    new $P963, "Undef"
  vivify_245:
    set $S964, $P963
    find_lex $P965, "$/"
    $P966 = $P960."new"($S964, "reduce" :named("pasttype"), $P965 :named("node"))
    set $P956, $P966
  if_957_end:
    store_lex "$past", $P956
.annotate 'line', 234
    find_lex $P968, "$/"
    find_lex $P969, "$past"
    $P970 = $P968."!make"($P969)
.annotate 'line', 230
    .return ($P970)
  control_952:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P971, exception, "payload"
    .return ($P971)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<var>"  :subid("62_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_975
.annotate 'line', 237
    new $P974, 'ExceptionHandler'
    set_addr $P974, control_973
    $P974."handle_types"(57)
    push_eh $P974
    .lex "self", self
    .lex "$/", param_975
.annotate 'line', 238
    new $P976, "Undef"
    .lex "$past", $P976
.annotate 'line', 239
    new $P977, "Undef"
    .lex "$name", $P977
.annotate 'line', 237
    find_lex $P978, "$past"
.annotate 'line', 239
    find_lex $P981, "$/"
    unless_null $P981, vivify_246
    $P981 = root_new ['parrot';'Hash']
  vivify_246:
    set $P982, $P981["pos"]
    unless_null $P982, vivify_247
    new $P982, "Undef"
  vivify_247:
    if $P982, if_980
    find_lex $P986, "$/"
    unless_null $P986, vivify_248
    $P986 = root_new ['parrot';'Hash']
  vivify_248:
    set $P987, $P986["name"]
    unless_null $P987, vivify_249
    new $P987, "Undef"
  vivify_249:
    set $S988, $P987
    new $P979, 'String'
    set $P979, $S988
    goto if_980_end
  if_980:
    find_lex $P983, "$/"
    unless_null $P983, vivify_250
    $P983 = root_new ['parrot';'Hash']
  vivify_250:
    set $P984, $P983["pos"]
    unless_null $P984, vivify_251
    new $P984, "Undef"
  vivify_251:
    set $N985, $P984
    new $P979, 'Float'
    set $P979, $N985
  if_980_end:
    store_lex "$name", $P979
.annotate 'line', 240
    find_lex $P990, "$/"
    unless_null $P990, vivify_252
    $P990 = root_new ['parrot';'Hash']
  vivify_252:
    set $P991, $P990["quantified_atom"]
    unless_null $P991, vivify_253
    new $P991, "Undef"
  vivify_253:
    if $P991, if_989
.annotate 'line', 251
    get_hll_global $P1020, ["PAST"], "Regex"
    find_lex $P1021, "$name"
    find_lex $P1022, "$/"
    $P1023 = $P1020."new"("!BACKREF", $P1021, "subrule" :named("pasttype"), "method" :named("subtype"), $P1022 :named("node"))
    store_lex "$past", $P1023
.annotate 'line', 250
    goto if_989_end
  if_989:
.annotate 'line', 241
    find_lex $P992, "$/"
    unless_null $P992, vivify_254
    $P992 = root_new ['parrot';'Hash']
  vivify_254:
    set $P993, $P992["quantified_atom"]
    unless_null $P993, vivify_255
    $P993 = root_new ['parrot';'ResizablePMCArray']
  vivify_255:
    set $P994, $P993[0]
    unless_null $P994, vivify_256
    new $P994, "Undef"
  vivify_256:
    $P995 = $P994."ast"()
    store_lex "$past", $P995
.annotate 'line', 242
    find_lex $P999, "$past"
    $S1000 = $P999."pasttype"()
    iseq $I1001, $S1000, "quant"
    if $I1001, if_998
    new $P997, 'Integer'
    set $P997, $I1001
    goto if_998_end
  if_998:
    find_lex $P1002, "$past"
    unless_null $P1002, vivify_257
    $P1002 = root_new ['parrot';'ResizablePMCArray']
  vivify_257:
    set $P1003, $P1002[0]
    unless_null $P1003, vivify_258
    new $P1003, "Undef"
  vivify_258:
    $S1004 = $P1003."pasttype"()
    iseq $I1005, $S1004, "subrule"
    new $P997, 'Integer'
    set $P997, $I1005
  if_998_end:
    if $P997, if_996
.annotate 'line', 245
    find_lex $P1010, "$past"
    $S1011 = $P1010."pasttype"()
    iseq $I1012, $S1011, "subrule"
    if $I1012, if_1009
.annotate 'line', 247
    get_hll_global $P1015, ["PAST"], "Regex"
    find_lex $P1016, "$past"
    find_lex $P1017, "$name"
    find_lex $P1018, "$/"
    $P1019 = $P1015."new"($P1016, $P1017 :named("name"), "subcapture" :named("pasttype"), $P1018 :named("node"))
    store_lex "$past", $P1019
.annotate 'line', 246
    goto if_1009_end
  if_1009:
.annotate 'line', 245
    find_lex $P1013, "$past"
    find_lex $P1014, "$name"
    "subrule_alias"($P1013, $P1014)
  if_1009_end:
    goto if_996_end
  if_996:
.annotate 'line', 243
    find_lex $P1006, "$past"
    unless_null $P1006, vivify_259
    $P1006 = root_new ['parrot';'ResizablePMCArray']
  vivify_259:
    set $P1007, $P1006[0]
    unless_null $P1007, vivify_260
    new $P1007, "Undef"
  vivify_260:
    find_lex $P1008, "$name"
    "subrule_alias"($P1007, $P1008)
  if_996_end:
  if_989_end:
.annotate 'line', 254
    find_lex $P1024, "$/"
    find_lex $P1025, "$past"
    $P1026 = $P1024."!make"($P1025)
.annotate 'line', 237
    .return ($P1026)
  control_973:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1027, exception, "payload"
    .return ($P1027)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<PIR>"  :subid("63_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_1031
.annotate 'line', 257
    new $P1030, 'ExceptionHandler'
    set_addr $P1030, control_1029
    $P1030."handle_types"(57)
    push_eh $P1030
    .lex "self", self
    .lex "$/", param_1031
.annotate 'line', 258
    find_lex $P1032, "$/"
    get_hll_global $P1033, ["PAST"], "Regex"
.annotate 'line', 259
    get_hll_global $P1034, ["PAST"], "Op"
    find_lex $P1035, "$/"
    unless_null $P1035, vivify_261
    $P1035 = root_new ['parrot';'Hash']
  vivify_261:
    set $P1036, $P1035["pir"]
    unless_null $P1036, vivify_262
    new $P1036, "Undef"
  vivify_262:
    set $S1037, $P1036
    $P1038 = $P1034."new"($S1037 :named("inline"), "inline" :named("pasttype"))
    find_lex $P1039, "$/"
    $P1040 = $P1033."new"($P1038, "pastnode" :named("pasttype"), $P1039 :named("node"))
.annotate 'line', 258
    $P1041 = $P1032."!make"($P1040)
.annotate 'line', 257
    .return ($P1041)
  control_1029:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1042, exception, "payload"
    .return ($P1042)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<w>"  :subid("64_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_1046
.annotate 'line', 265
    new $P1045, 'ExceptionHandler'
    set_addr $P1045, control_1044
    $P1045."handle_types"(57)
    push_eh $P1045
    .lex "self", self
    .lex "$/", param_1046
.annotate 'line', 266
    new $P1047, "Undef"
    .lex "$subtype", $P1047
.annotate 'line', 267
    new $P1048, "Undef"
    .lex "$past", $P1048
.annotate 'line', 266
    find_lex $P1051, "$/"
    unless_null $P1051, vivify_263
    $P1051 = root_new ['parrot';'Hash']
  vivify_263:
    set $P1052, $P1051["sym"]
    unless_null $P1052, vivify_264
    new $P1052, "Undef"
  vivify_264:
    set $S1053, $P1052
    iseq $I1054, $S1053, "n"
    if $I1054, if_1050
    find_lex $P1056, "$/"
    unless_null $P1056, vivify_265
    $P1056 = root_new ['parrot';'Hash']
  vivify_265:
    set $P1057, $P1056["sym"]
    unless_null $P1057, vivify_266
    new $P1057, "Undef"
  vivify_266:
    set $S1058, $P1057
    new $P1049, 'String'
    set $P1049, $S1058
    goto if_1050_end
  if_1050:
    new $P1055, "String"
    assign $P1055, "nl"
    set $P1049, $P1055
  if_1050_end:
    store_lex "$subtype", $P1049
.annotate 'line', 267
    get_hll_global $P1059, ["PAST"], "Regex"
    find_lex $P1060, "$subtype"
    find_lex $P1061, "$/"
    $P1062 = $P1059."new"("charclass" :named("pasttype"), $P1060 :named("subtype"), $P1061 :named("node"))
    store_lex "$past", $P1062
.annotate 'line', 268
    find_lex $P1063, "$/"
    find_lex $P1064, "$past"
    $P1065 = $P1063."!make"($P1064)
.annotate 'line', 265
    .return ($P1065)
  control_1044:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1066, exception, "payload"
    .return ($P1066)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<b>"  :subid("65_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_1070
.annotate 'line', 271
    new $P1069, 'ExceptionHandler'
    set_addr $P1069, control_1068
    $P1069."handle_types"(57)
    push_eh $P1069
    .lex "self", self
    .lex "$/", param_1070
.annotate 'line', 272
    new $P1071, "Undef"
    .lex "$past", $P1071
    get_hll_global $P1072, ["PAST"], "Regex"
.annotate 'line', 273
    find_lex $P1073, "$/"
    unless_null $P1073, vivify_267
    $P1073 = root_new ['parrot';'Hash']
  vivify_267:
    set $P1074, $P1073["sym"]
    unless_null $P1074, vivify_268
    new $P1074, "Undef"
  vivify_268:
    set $S1075, $P1074
    iseq $I1076, $S1075, "B"
    find_lex $P1077, "$/"
    $P1078 = $P1072."new"("\b", "enumcharlist" :named("pasttype"), $I1076 :named("negate"), $P1077 :named("node"))
.annotate 'line', 272
    store_lex "$past", $P1078
.annotate 'line', 274
    find_lex $P1079, "$/"
    find_lex $P1080, "$past"
    $P1081 = $P1079."!make"($P1080)
.annotate 'line', 271
    .return ($P1081)
  control_1068:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1082, exception, "payload"
    .return ($P1082)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<e>"  :subid("66_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_1086
.annotate 'line', 277
    new $P1085, 'ExceptionHandler'
    set_addr $P1085, control_1084
    $P1085."handle_types"(57)
    push_eh $P1085
    .lex "self", self
    .lex "$/", param_1086
.annotate 'line', 278
    new $P1087, "Undef"
    .lex "$past", $P1087
    get_hll_global $P1088, ["PAST"], "Regex"
.annotate 'line', 279
    find_lex $P1089, "$/"
    unless_null $P1089, vivify_269
    $P1089 = root_new ['parrot';'Hash']
  vivify_269:
    set $P1090, $P1089["sym"]
    unless_null $P1090, vivify_270
    new $P1090, "Undef"
  vivify_270:
    set $S1091, $P1090
    iseq $I1092, $S1091, "E"
    find_lex $P1093, "$/"
    $P1094 = $P1088."new"("\e", "enumcharlist" :named("pasttype"), $I1092 :named("negate"), $P1093 :named("node"))
.annotate 'line', 278
    store_lex "$past", $P1094
.annotate 'line', 280
    find_lex $P1095, "$/"
    find_lex $P1096, "$past"
    $P1097 = $P1095."!make"($P1096)
.annotate 'line', 277
    .return ($P1097)
  control_1084:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1098, exception, "payload"
    .return ($P1098)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<f>"  :subid("67_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_1102
.annotate 'line', 283
    new $P1101, 'ExceptionHandler'
    set_addr $P1101, control_1100
    $P1101."handle_types"(57)
    push_eh $P1101
    .lex "self", self
    .lex "$/", param_1102
.annotate 'line', 284
    new $P1103, "Undef"
    .lex "$past", $P1103
    get_hll_global $P1104, ["PAST"], "Regex"
.annotate 'line', 285
    find_lex $P1105, "$/"
    unless_null $P1105, vivify_271
    $P1105 = root_new ['parrot';'Hash']
  vivify_271:
    set $P1106, $P1105["sym"]
    unless_null $P1106, vivify_272
    new $P1106, "Undef"
  vivify_272:
    set $S1107, $P1106
    iseq $I1108, $S1107, "F"
    find_lex $P1109, "$/"
    $P1110 = $P1104."new"("\f", "enumcharlist" :named("pasttype"), $I1108 :named("negate"), $P1109 :named("node"))
.annotate 'line', 284
    store_lex "$past", $P1110
.annotate 'line', 286
    find_lex $P1111, "$/"
    find_lex $P1112, "$past"
    $P1113 = $P1111."!make"($P1112)
.annotate 'line', 283
    .return ($P1113)
  control_1100:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1114, exception, "payload"
    .return ($P1114)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<h>"  :subid("68_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_1118
.annotate 'line', 289
    new $P1117, 'ExceptionHandler'
    set_addr $P1117, control_1116
    $P1117."handle_types"(57)
    push_eh $P1117
    .lex "self", self
    .lex "$/", param_1118
.annotate 'line', 290
    new $P1119, "Undef"
    .lex "$past", $P1119
    get_hll_global $P1120, ["PAST"], "Regex"
.annotate 'line', 291
    find_lex $P1121, "$/"
    unless_null $P1121, vivify_273
    $P1121 = root_new ['parrot';'Hash']
  vivify_273:
    set $P1122, $P1121["sym"]
    unless_null $P1122, vivify_274
    new $P1122, "Undef"
  vivify_274:
    set $S1123, $P1122
    iseq $I1124, $S1123, "H"
    find_lex $P1125, "$/"
    $P1126 = $P1120."new"(unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", "enumcharlist" :named("pasttype"), $I1124 :named("negate"), $P1125 :named("node"))
.annotate 'line', 290
    store_lex "$past", $P1126
.annotate 'line', 292
    find_lex $P1127, "$/"
    find_lex $P1128, "$past"
    $P1129 = $P1127."!make"($P1128)
.annotate 'line', 289
    .return ($P1129)
  control_1116:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1130, exception, "payload"
    .return ($P1130)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<r>"  :subid("69_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_1134
.annotate 'line', 295
    new $P1133, 'ExceptionHandler'
    set_addr $P1133, control_1132
    $P1133."handle_types"(57)
    push_eh $P1133
    .lex "self", self
    .lex "$/", param_1134
.annotate 'line', 296
    new $P1135, "Undef"
    .lex "$past", $P1135
    get_hll_global $P1136, ["PAST"], "Regex"
.annotate 'line', 297
    find_lex $P1137, "$/"
    unless_null $P1137, vivify_275
    $P1137 = root_new ['parrot';'Hash']
  vivify_275:
    set $P1138, $P1137["sym"]
    unless_null $P1138, vivify_276
    new $P1138, "Undef"
  vivify_276:
    set $S1139, $P1138
    iseq $I1140, $S1139, "R"
    find_lex $P1141, "$/"
    $P1142 = $P1136."new"("\r", "enumcharlist" :named("pasttype"), $I1140 :named("negate"), $P1141 :named("node"))
.annotate 'line', 296
    store_lex "$past", $P1142
.annotate 'line', 298
    find_lex $P1143, "$/"
    find_lex $P1144, "$past"
    $P1145 = $P1143."!make"($P1144)
.annotate 'line', 295
    .return ($P1145)
  control_1132:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1146, exception, "payload"
    .return ($P1146)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<t>"  :subid("70_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_1150
.annotate 'line', 301
    new $P1149, 'ExceptionHandler'
    set_addr $P1149, control_1148
    $P1149."handle_types"(57)
    push_eh $P1149
    .lex "self", self
    .lex "$/", param_1150
.annotate 'line', 302
    new $P1151, "Undef"
    .lex "$past", $P1151
    get_hll_global $P1152, ["PAST"], "Regex"
.annotate 'line', 303
    find_lex $P1153, "$/"
    unless_null $P1153, vivify_277
    $P1153 = root_new ['parrot';'Hash']
  vivify_277:
    set $P1154, $P1153["sym"]
    unless_null $P1154, vivify_278
    new $P1154, "Undef"
  vivify_278:
    set $S1155, $P1154
    iseq $I1156, $S1155, "T"
    find_lex $P1157, "$/"
    $P1158 = $P1152."new"("\t", "enumcharlist" :named("pasttype"), $I1156 :named("negate"), $P1157 :named("node"))
.annotate 'line', 302
    store_lex "$past", $P1158
.annotate 'line', 304
    find_lex $P1159, "$/"
    find_lex $P1160, "$past"
    $P1161 = $P1159."!make"($P1160)
.annotate 'line', 301
    .return ($P1161)
  control_1148:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1162, exception, "payload"
    .return ($P1162)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<v>"  :subid("71_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_1166
.annotate 'line', 307
    new $P1165, 'ExceptionHandler'
    set_addr $P1165, control_1164
    $P1165."handle_types"(57)
    push_eh $P1165
    .lex "self", self
    .lex "$/", param_1166
.annotate 'line', 308
    new $P1167, "Undef"
    .lex "$past", $P1167
    get_hll_global $P1168, ["PAST"], "Regex"
.annotate 'line', 310
    find_lex $P1169, "$/"
    unless_null $P1169, vivify_279
    $P1169 = root_new ['parrot';'Hash']
  vivify_279:
    set $P1170, $P1169["sym"]
    unless_null $P1170, vivify_280
    new $P1170, "Undef"
  vivify_280:
    set $S1171, $P1170
    iseq $I1172, $S1171, "V"
    find_lex $P1173, "$/"
    $P1174 = $P1168."new"(unicode:"\n\x{b}\f\r\x{85}\u2028\u2029", "enumcharlist" :named("pasttype"), $I1172 :named("negate"), $P1173 :named("node"))
.annotate 'line', 308
    store_lex "$past", $P1174
.annotate 'line', 311
    find_lex $P1175, "$/"
    find_lex $P1176, "$past"
    $P1177 = $P1175."!make"($P1176)
.annotate 'line', 307
    .return ($P1177)
  control_1164:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1178, exception, "payload"
    .return ($P1178)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<o>"  :subid("72_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_1182
.annotate 'line', 314
    new $P1181, 'ExceptionHandler'
    set_addr $P1181, control_1180
    $P1181."handle_types"(57)
    push_eh $P1181
    .lex "self", self
    .lex "$/", param_1182
.annotate 'line', 315
    new $P1183, "Undef"
    .lex "$octlit", $P1183
.annotate 'line', 316
    get_hll_global $P1184, ["HLL";"Actions"], "ints_to_string"
    find_lex $P1187, "$/"
    unless_null $P1187, vivify_281
    $P1187 = root_new ['parrot';'Hash']
  vivify_281:
    set $P1188, $P1187["octint"]
    unless_null $P1188, vivify_282
    new $P1188, "Undef"
  vivify_282:
    unless $P1188, unless_1186
    set $P1185, $P1188
    goto unless_1186_end
  unless_1186:
    find_lex $P1189, "$/"
    unless_null $P1189, vivify_283
    $P1189 = root_new ['parrot';'Hash']
  vivify_283:
    set $P1190, $P1189["octints"]
    unless_null $P1190, vivify_284
    $P1190 = root_new ['parrot';'Hash']
  vivify_284:
    set $P1191, $P1190["octint"]
    unless_null $P1191, vivify_285
    new $P1191, "Undef"
  vivify_285:
    set $P1185, $P1191
  unless_1186_end:
    $P1192 = $P1184($P1185)
    store_lex "$octlit", $P1192
.annotate 'line', 317
    find_lex $P1193, "$/"
    find_lex $P1196, "$/"
    unless_null $P1196, vivify_286
    $P1196 = root_new ['parrot';'Hash']
  vivify_286:
    set $P1197, $P1196["sym"]
    unless_null $P1197, vivify_287
    new $P1197, "Undef"
  vivify_287:
    set $S1198, $P1197
    iseq $I1199, $S1198, "O"
    if $I1199, if_1195
.annotate 'line', 320
    get_hll_global $P1204, ["PAST"], "Regex"
    find_lex $P1205, "$octlit"
    find_lex $P1206, "$/"
    $P1207 = $P1204."new"($P1205, "literal" :named("pasttype"), $P1206 :named("node"))
    set $P1194, $P1207
.annotate 'line', 317
    goto if_1195_end
  if_1195:
.annotate 'line', 318
    get_hll_global $P1200, ["PAST"], "Regex"
    find_lex $P1201, "$octlit"
    find_lex $P1202, "$/"
    $P1203 = $P1200."new"($P1201, "enumcharlist" :named("pasttype"), 1 :named("negate"), $P1202 :named("node"))
    set $P1194, $P1203
  if_1195_end:
    $P1208 = $P1193."!make"($P1194)
.annotate 'line', 314
    .return ($P1208)
  control_1180:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1209, exception, "payload"
    .return ($P1209)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<x>"  :subid("73_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_1213
.annotate 'line', 323
    new $P1212, 'ExceptionHandler'
    set_addr $P1212, control_1211
    $P1212."handle_types"(57)
    push_eh $P1212
    .lex "self", self
    .lex "$/", param_1213
.annotate 'line', 324
    new $P1214, "Undef"
    .lex "$hexlit", $P1214
.annotate 'line', 325
    get_hll_global $P1215, ["HLL";"Actions"], "ints_to_string"
    find_lex $P1218, "$/"
    unless_null $P1218, vivify_288
    $P1218 = root_new ['parrot';'Hash']
  vivify_288:
    set $P1219, $P1218["hexint"]
    unless_null $P1219, vivify_289
    new $P1219, "Undef"
  vivify_289:
    unless $P1219, unless_1217
    set $P1216, $P1219
    goto unless_1217_end
  unless_1217:
    find_lex $P1220, "$/"
    unless_null $P1220, vivify_290
    $P1220 = root_new ['parrot';'Hash']
  vivify_290:
    set $P1221, $P1220["hexints"]
    unless_null $P1221, vivify_291
    $P1221 = root_new ['parrot';'Hash']
  vivify_291:
    set $P1222, $P1221["hexint"]
    unless_null $P1222, vivify_292
    new $P1222, "Undef"
  vivify_292:
    set $P1216, $P1222
  unless_1217_end:
    $P1223 = $P1215($P1216)
    store_lex "$hexlit", $P1223
.annotate 'line', 326
    find_lex $P1224, "$/"
    find_lex $P1227, "$/"
    unless_null $P1227, vivify_293
    $P1227 = root_new ['parrot';'Hash']
  vivify_293:
    set $P1228, $P1227["sym"]
    unless_null $P1228, vivify_294
    new $P1228, "Undef"
  vivify_294:
    set $S1229, $P1228
    iseq $I1230, $S1229, "X"
    if $I1230, if_1226
.annotate 'line', 329
    get_hll_global $P1235, ["PAST"], "Regex"
    find_lex $P1236, "$hexlit"
    find_lex $P1237, "$/"
    $P1238 = $P1235."new"($P1236, "literal" :named("pasttype"), $P1237 :named("node"))
    set $P1225, $P1238
.annotate 'line', 326
    goto if_1226_end
  if_1226:
.annotate 'line', 327
    get_hll_global $P1231, ["PAST"], "Regex"
    find_lex $P1232, "$hexlit"
    find_lex $P1233, "$/"
    $P1234 = $P1231."new"($P1232, "enumcharlist" :named("pasttype"), 1 :named("negate"), $P1233 :named("node"))
    set $P1225, $P1234
  if_1226_end:
    $P1239 = $P1224."!make"($P1225)
.annotate 'line', 323
    .return ($P1239)
  control_1211:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1240, exception, "payload"
    .return ($P1240)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<c>"  :subid("74_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_1244
.annotate 'line', 332
    new $P1243, 'ExceptionHandler'
    set_addr $P1243, control_1242
    $P1243."handle_types"(57)
    push_eh $P1243
    .lex "self", self
    .lex "$/", param_1244
.annotate 'line', 333
    find_lex $P1245, "$/"
    get_hll_global $P1246, ["PAST"], "Regex"
    find_lex $P1247, "$/"
    unless_null $P1247, vivify_295
    $P1247 = root_new ['parrot';'Hash']
  vivify_295:
    set $P1248, $P1247["charspec"]
    unless_null $P1248, vivify_296
    new $P1248, "Undef"
  vivify_296:
    $P1249 = $P1248."ast"()
    find_lex $P1250, "$/"
    $P1251 = $P1246."new"($P1249, "literal" :named("pasttype"), $P1250 :named("node"))
    $P1252 = $P1245."!make"($P1251)
.annotate 'line', 332
    .return ($P1252)
  control_1242:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1253, exception, "payload"
    .return ($P1253)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<misc>"  :subid("75_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_1257
.annotate 'line', 336
    new $P1256, 'ExceptionHandler'
    set_addr $P1256, control_1255
    $P1256."handle_types"(57)
    push_eh $P1256
    .lex "self", self
    .lex "$/", param_1257
.annotate 'line', 337
    new $P1258, "Undef"
    .lex "$past", $P1258
    get_hll_global $P1259, ["PAST"], "Regex"
    find_lex $P1260, "$/"
    set $S1261, $P1260
    find_lex $P1262, "$/"
    $P1263 = $P1259."new"($S1261, "literal" :named("pasttype"), $P1262 :named("node"))
    store_lex "$past", $P1263
.annotate 'line', 338
    find_lex $P1264, "$/"
    find_lex $P1265, "$past"
    $P1266 = $P1264."!make"($P1265)
.annotate 'line', 336
    .return ($P1266)
  control_1255:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1267, exception, "payload"
    .return ($P1267)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<?>"  :subid("76_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_1271
.annotate 'line', 342
    new $P1270, 'ExceptionHandler'
    set_addr $P1270, control_1269
    $P1270."handle_types"(57)
    push_eh $P1270
    .lex "self", self
    .lex "$/", param_1271
.annotate 'line', 343
    new $P1272, "Undef"
    .lex "$past", $P1272
.annotate 'line', 342
    find_lex $P1273, "$past"
.annotate 'line', 344
    find_lex $P1275, "$/"
    unless_null $P1275, vivify_297
    $P1275 = root_new ['parrot';'Hash']
  vivify_297:
    set $P1276, $P1275["assertion"]
    unless_null $P1276, vivify_298
    new $P1276, "Undef"
  vivify_298:
    if $P1276, if_1274
.annotate 'line', 348
    new $P1281, "Integer"
    assign $P1281, 0
    store_lex "$past", $P1281
    goto if_1274_end
  if_1274:
.annotate 'line', 345
    find_lex $P1277, "$/"
    unless_null $P1277, vivify_299
    $P1277 = root_new ['parrot';'Hash']
  vivify_299:
    set $P1278, $P1277["assertion"]
    unless_null $P1278, vivify_300
    new $P1278, "Undef"
  vivify_300:
    $P1279 = $P1278."ast"()
    store_lex "$past", $P1279
.annotate 'line', 346
    find_lex $P1280, "$past"
    $P1280."subtype"("zerowidth")
  if_1274_end:
.annotate 'line', 349
    find_lex $P1282, "$/"
    find_lex $P1283, "$past"
    $P1284 = $P1282."!make"($P1283)
.annotate 'line', 342
    .return ($P1284)
  control_1269:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1285, exception, "payload"
    .return ($P1285)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<!>"  :subid("77_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_1289
.annotate 'line', 352
    new $P1288, 'ExceptionHandler'
    set_addr $P1288, control_1287
    $P1288."handle_types"(57)
    push_eh $P1288
    .lex "self", self
    .lex "$/", param_1289
.annotate 'line', 353
    new $P1290, "Undef"
    .lex "$past", $P1290
.annotate 'line', 352
    find_lex $P1291, "$past"
.annotate 'line', 354
    find_lex $P1293, "$/"
    unless_null $P1293, vivify_301
    $P1293 = root_new ['parrot';'Hash']
  vivify_301:
    set $P1294, $P1293["assertion"]
    unless_null $P1294, vivify_302
    new $P1294, "Undef"
  vivify_302:
    if $P1294, if_1292
.annotate 'line', 360
    get_hll_global $P1303, ["PAST"], "Regex"
    find_lex $P1304, "$/"
    $P1305 = $P1303."new"("anchor" :named("pasttype"), "fail" :named("subtype"), $P1304 :named("node"))
    store_lex "$past", $P1305
.annotate 'line', 359
    goto if_1292_end
  if_1292:
.annotate 'line', 355
    find_lex $P1295, "$/"
    unless_null $P1295, vivify_303
    $P1295 = root_new ['parrot';'Hash']
  vivify_303:
    set $P1296, $P1295["assertion"]
    unless_null $P1296, vivify_304
    new $P1296, "Undef"
  vivify_304:
    $P1297 = $P1296."ast"()
    store_lex "$past", $P1297
.annotate 'line', 356
    find_lex $P1298, "$past"
    find_lex $P1299, "$past"
    $P1300 = $P1299."negate"()
    isfalse $I1301, $P1300
    $P1298."negate"($I1301)
.annotate 'line', 357
    find_lex $P1302, "$past"
    $P1302."subtype"("zerowidth")
  if_1292_end:
.annotate 'line', 362
    find_lex $P1306, "$/"
    find_lex $P1307, "$past"
    $P1308 = $P1306."!make"($P1307)
.annotate 'line', 352
    .return ($P1308)
  control_1287:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1309, exception, "payload"
    .return ($P1309)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<method>"  :subid("78_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_1313
.annotate 'line', 365
    new $P1312, 'ExceptionHandler'
    set_addr $P1312, control_1311
    $P1312."handle_types"(57)
    push_eh $P1312
    .lex "self", self
    .lex "$/", param_1313
.annotate 'line', 366
    new $P1314, "Undef"
    .lex "$past", $P1314
    find_lex $P1315, "$/"
    unless_null $P1315, vivify_305
    $P1315 = root_new ['parrot';'Hash']
  vivify_305:
    set $P1316, $P1315["assertion"]
    unless_null $P1316, vivify_306
    new $P1316, "Undef"
  vivify_306:
    $P1317 = $P1316."ast"()
    store_lex "$past", $P1317
.annotate 'line', 367
    find_lex $P1318, "$past"
    $P1318."subtype"("method")
.annotate 'line', 368
    find_lex $P1319, "$past"
    $P1319."name"("")
.annotate 'line', 369
    find_lex $P1320, "$/"
    find_lex $P1321, "$past"
    $P1322 = $P1320."!make"($P1321)
.annotate 'line', 365
    .return ($P1322)
  control_1311:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1323, exception, "payload"
    .return ($P1323)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<name>"  :subid("79_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_1327
.annotate 'line', 372
    .const 'Sub' $P1385 = "81_1274564778.23532" 
    capture_lex $P1385
    .const 'Sub' $P1349 = "80_1274564778.23532" 
    capture_lex $P1349
    new $P1326, 'ExceptionHandler'
    set_addr $P1326, control_1325
    $P1326."handle_types"(57)
    push_eh $P1326
    .lex "self", self
    .lex "$/", param_1327
.annotate 'line', 373
    new $P1328, "Undef"
    .lex "$name", $P1328
.annotate 'line', 374
    new $P1329, "Undef"
    .lex "$past", $P1329
.annotate 'line', 373
    find_lex $P1330, "$/"
    unless_null $P1330, vivify_307
    $P1330 = root_new ['parrot';'Hash']
  vivify_307:
    set $P1331, $P1330["longname"]
    unless_null $P1331, vivify_308
    new $P1331, "Undef"
  vivify_308:
    set $S1332, $P1331
    new $P1333, 'String'
    set $P1333, $S1332
    store_lex "$name", $P1333
    find_lex $P1334, "$past"
.annotate 'line', 375
    find_lex $P1336, "$/"
    unless_null $P1336, vivify_309
    $P1336 = root_new ['parrot';'Hash']
  vivify_309:
    set $P1337, $P1336["assertion"]
    unless_null $P1337, vivify_310
    new $P1337, "Undef"
  vivify_310:
    if $P1337, if_1335
.annotate 'line', 379
    find_lex $P1345, "$name"
    set $S1346, $P1345
    iseq $I1347, $S1346, "sym"
    if $I1347, if_1344
.annotate 'line', 395
    get_hll_global $P1359, ["PAST"], "Regex"
    find_lex $P1360, "$name"
    find_lex $P1361, "$name"
    find_lex $P1362, "$/"
    $P1363 = $P1359."new"($P1360, $P1361 :named("name"), "subrule" :named("pasttype"), "capture" :named("subtype"), $P1362 :named("node"))
    store_lex "$past", $P1363
.annotate 'line', 397
    find_lex $P1365, "$/"
    unless_null $P1365, vivify_311
    $P1365 = root_new ['parrot';'Hash']
  vivify_311:
    set $P1366, $P1365["nibbler"]
    unless_null $P1366, vivify_312
    new $P1366, "Undef"
  vivify_312:
    if $P1366, if_1364
.annotate 'line', 400
    find_lex $P1374, "$/"
    unless_null $P1374, vivify_313
    $P1374 = root_new ['parrot';'Hash']
  vivify_313:
    set $P1375, $P1374["arglist"]
    unless_null $P1375, vivify_314
    new $P1375, "Undef"
  vivify_314:
    unless $P1375, if_1373_end
.annotate 'line', 401
    find_lex $P1377, "$/"
    unless_null $P1377, vivify_315
    $P1377 = root_new ['parrot';'Hash']
  vivify_315:
    set $P1378, $P1377["arglist"]
    unless_null $P1378, vivify_316
    $P1378 = root_new ['parrot';'ResizablePMCArray']
  vivify_316:
    set $P1379, $P1378[0]
    unless_null $P1379, vivify_317
    new $P1379, "Undef"
  vivify_317:
    $P1380 = $P1379."ast"()
    $P1381 = $P1380."list"()
    defined $I1382, $P1381
    unless $I1382, for_undef_318
    iter $P1376, $P1381
    new $P1391, 'ExceptionHandler'
    set_addr $P1391, loop1390_handler
    $P1391."handle_types"(64, 66, 65)
    push_eh $P1391
  loop1390_test:
    unless $P1376, loop1390_done
    shift $P1383, $P1376
  loop1390_redo:
    .const 'Sub' $P1385 = "81_1274564778.23532" 
    capture_lex $P1385
    $P1385($P1383)
  loop1390_next:
    goto loop1390_test
  loop1390_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1392, exception, 'type'
    eq $P1392, 64, loop1390_next
    eq $P1392, 66, loop1390_redo
  loop1390_done:
    pop_eh 
  for_undef_318:
  if_1373_end:
.annotate 'line', 400
    goto if_1364_end
  if_1364:
.annotate 'line', 398
    find_lex $P1367, "$past"
    find_lex $P1368, "$/"
    unless_null $P1368, vivify_319
    $P1368 = root_new ['parrot';'Hash']
  vivify_319:
    set $P1369, $P1368["nibbler"]
    unless_null $P1369, vivify_320
    $P1369 = root_new ['parrot';'ResizablePMCArray']
  vivify_320:
    set $P1370, $P1369[0]
    unless_null $P1370, vivify_321
    new $P1370, "Undef"
  vivify_321:
    $P1371 = $P1370."ast"()
    $P1372 = "buildsub"($P1371)
    $P1367."push"($P1372)
  if_1364_end:
.annotate 'line', 394
    goto if_1344_end
  if_1344:
.annotate 'line', 379
    .const 'Sub' $P1349 = "80_1274564778.23532" 
    capture_lex $P1349
    $P1349()
  if_1344_end:
    goto if_1335_end
  if_1335:
.annotate 'line', 376
    find_lex $P1338, "$/"
    unless_null $P1338, vivify_322
    $P1338 = root_new ['parrot';'Hash']
  vivify_322:
    set $P1339, $P1338["assertion"]
    unless_null $P1339, vivify_323
    $P1339 = root_new ['parrot';'ResizablePMCArray']
  vivify_323:
    set $P1340, $P1339[0]
    unless_null $P1340, vivify_324
    new $P1340, "Undef"
  vivify_324:
    $P1341 = $P1340."ast"()
    store_lex "$past", $P1341
.annotate 'line', 377
    find_lex $P1342, "$past"
    find_lex $P1343, "$name"
    "subrule_alias"($P1342, $P1343)
  if_1335_end:
.annotate 'line', 404
    find_lex $P1393, "$/"
    find_lex $P1394, "$past"
    $P1395 = $P1393."!make"($P1394)
.annotate 'line', 372
    .return ($P1395)
  control_1325:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1396, exception, "payload"
    .return ($P1396)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1384"  :anon :subid("81_1274564778.23532") :outer("79_1274564778.23532")
    .param pmc param_1386
.annotate 'line', 401
    .lex "$_", param_1386
    find_lex $P1387, "$past"
    find_lex $P1388, "$_"
    $P1389 = $P1387."push"($P1388)
    .return ($P1389)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1348"  :anon :subid("80_1274564778.23532") :outer("79_1274564778.23532")
.annotate 'line', 380
    new $P1350, "Undef"
    .lex "$regexsym", $P1350

            $P0 = get_global '$REGEXNAME'
            $S0 = $P0
            $I0 = index $S0, ':sym<'
            add $I0, 5
            $S0 = substr $S0, $I0
            $S0 = chopn $S0, 1
            $P1351 = box $S0
        
    store_lex "$regexsym", $P1351
.annotate 'line', 389
    get_hll_global $P1352, ["PAST"], "Regex"
.annotate 'line', 390
    get_hll_global $P1353, ["PAST"], "Regex"
    find_lex $P1354, "$regexsym"
    $P1355 = $P1353."new"($P1354, "literal" :named("pasttype"))
    find_lex $P1356, "$name"
    find_lex $P1357, "$/"
    $P1358 = $P1352."new"($P1355, $P1356 :named("name"), "subcapture" :named("pasttype"), $P1357 :named("node"))
.annotate 'line', 389
    store_lex "$past", $P1358
.annotate 'line', 379
    .return ($P1358)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<[>"  :subid("82_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_1400
.annotate 'line', 407
    .const 'Sub' $P1435 = "83_1274564778.23532" 
    capture_lex $P1435
    new $P1399, 'ExceptionHandler'
    set_addr $P1399, control_1398
    $P1399."handle_types"(57)
    push_eh $P1399
    .lex "self", self
    .lex "$/", param_1400
.annotate 'line', 408
    new $P1401, "Undef"
    .lex "$clist", $P1401
.annotate 'line', 409
    new $P1402, "Undef"
    .lex "$past", $P1402
.annotate 'line', 418
    new $P1403, "Undef"
    .lex "$i", $P1403
.annotate 'line', 419
    new $P1404, "Undef"
    .lex "$n", $P1404
.annotate 'line', 408
    find_lex $P1405, "$/"
    unless_null $P1405, vivify_325
    $P1405 = root_new ['parrot';'Hash']
  vivify_325:
    set $P1406, $P1405["cclass_elem"]
    unless_null $P1406, vivify_326
    new $P1406, "Undef"
  vivify_326:
    store_lex "$clist", $P1406
.annotate 'line', 409
    find_lex $P1407, "$clist"
    unless_null $P1407, vivify_327
    $P1407 = root_new ['parrot';'ResizablePMCArray']
  vivify_327:
    set $P1408, $P1407[0]
    unless_null $P1408, vivify_328
    new $P1408, "Undef"
  vivify_328:
    $P1409 = $P1408."ast"()
    store_lex "$past", $P1409
.annotate 'line', 410
    find_lex $P1413, "$past"
    $P1414 = $P1413."negate"()
    if $P1414, if_1412
    set $P1411, $P1414
    goto if_1412_end
  if_1412:
    find_lex $P1415, "$past"
    $S1416 = $P1415."pasttype"()
    iseq $I1417, $S1416, "subrule"
    new $P1411, 'Integer'
    set $P1411, $I1417
  if_1412_end:
    unless $P1411, if_1410_end
.annotate 'line', 411
    find_lex $P1418, "$past"
    $P1418."subtype"("zerowidth")
.annotate 'line', 412
    get_hll_global $P1419, ["PAST"], "Regex"
    find_lex $P1420, "$past"
.annotate 'line', 414
    get_hll_global $P1421, ["PAST"], "Regex"
    $P1422 = $P1421."new"("charclass" :named("pasttype"), "." :named("subtype"))
    find_lex $P1423, "$/"
    $P1424 = $P1419."new"($P1420, $P1422, $P1423 :named("node"))
.annotate 'line', 412
    store_lex "$past", $P1424
  if_1410_end:
.annotate 'line', 418
    new $P1425, "Integer"
    assign $P1425, 1
    store_lex "$i", $P1425
.annotate 'line', 419
    find_lex $P1426, "$clist"
    set $N1427, $P1426
    new $P1428, 'Float'
    set $P1428, $N1427
    store_lex "$n", $P1428
.annotate 'line', 420
    new $P1459, 'ExceptionHandler'
    set_addr $P1459, loop1458_handler
    $P1459."handle_types"(64, 66, 65)
    push_eh $P1459
  loop1458_test:
    find_lex $P1429, "$i"
    set $N1430, $P1429
    find_lex $P1431, "$n"
    set $N1432, $P1431
    islt $I1433, $N1430, $N1432
    unless $I1433, loop1458_done
  loop1458_redo:
    .const 'Sub' $P1435 = "83_1274564778.23532" 
    capture_lex $P1435
    $P1435()
  loop1458_next:
    goto loop1458_test
  loop1458_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1460, exception, 'type'
    eq $P1460, 64, loop1458_next
    eq $P1460, 66, loop1458_redo
  loop1458_done:
    pop_eh 
.annotate 'line', 431
    find_lex $P1461, "$/"
    find_lex $P1462, "$past"
    $P1463 = $P1461."!make"($P1462)
.annotate 'line', 407
    .return ($P1463)
  control_1398:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1464, exception, "payload"
    .return ($P1464)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1434"  :anon :subid("83_1274564778.23532") :outer("82_1274564778.23532")
.annotate 'line', 421
    new $P1436, "Undef"
    .lex "$ast", $P1436
    find_lex $P1437, "$i"
    set $I1438, $P1437
    find_lex $P1439, "$clist"
    unless_null $P1439, vivify_329
    $P1439 = root_new ['parrot';'ResizablePMCArray']
  vivify_329:
    set $P1440, $P1439[$I1438]
    unless_null $P1440, vivify_330
    new $P1440, "Undef"
  vivify_330:
    $P1441 = $P1440."ast"()
    store_lex "$ast", $P1441
.annotate 'line', 422
    find_lex $P1443, "$ast"
    $P1444 = $P1443."negate"()
    if $P1444, if_1442
.annotate 'line', 427
    get_hll_global $P1451, ["PAST"], "Regex"
    find_lex $P1452, "$past"
    find_lex $P1453, "$ast"
    find_lex $P1454, "$/"
    $P1455 = $P1451."new"($P1452, $P1453, "alt" :named("pasttype"), $P1454 :named("node"))
    store_lex "$past", $P1455
.annotate 'line', 426
    goto if_1442_end
  if_1442:
.annotate 'line', 423
    find_lex $P1445, "$ast"
    $P1445."subtype"("zerowidth")
.annotate 'line', 424
    get_hll_global $P1446, ["PAST"], "Regex"
    find_lex $P1447, "$ast"
    find_lex $P1448, "$past"
    find_lex $P1449, "$/"
    $P1450 = $P1446."new"($P1447, $P1448, "concat" :named("pasttype"), $P1449 :named("node"))
    store_lex "$past", $P1450
  if_1442_end:
.annotate 'line', 429
    find_lex $P1456, "$i"
    add $P1457, $P1456, 1
    store_lex "$i", $P1457
.annotate 'line', 420
    .return ($P1457)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "cclass_elem"  :subid("84_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_1468
.annotate 'line', 434
    .const 'Sub' $P1493 = "86_1274564778.23532" 
    capture_lex $P1493
    .const 'Sub' $P1477 = "85_1274564778.23532" 
    capture_lex $P1477
    new $P1467, 'ExceptionHandler'
    set_addr $P1467, control_1466
    $P1467."handle_types"(57)
    push_eh $P1467
    .lex "self", self
    .lex "$/", param_1468
.annotate 'line', 435
    new $P1469, "Undef"
    .lex "$str", $P1469
.annotate 'line', 436
    new $P1470, "Undef"
    .lex "$past", $P1470
.annotate 'line', 435
    new $P1471, "String"
    assign $P1471, ""
    store_lex "$str", $P1471
    find_lex $P1472, "$past"
.annotate 'line', 437
    find_lex $P1474, "$/"
    unless_null $P1474, vivify_331
    $P1474 = root_new ['parrot';'Hash']
  vivify_331:
    set $P1475, $P1474["name"]
    unless_null $P1475, vivify_332
    new $P1475, "Undef"
  vivify_332:
    if $P1475, if_1473
.annotate 'line', 441
    find_lex $P1488, "$/"
    unless_null $P1488, vivify_333
    $P1488 = root_new ['parrot';'Hash']
  vivify_333:
    set $P1489, $P1488["charspec"]
    unless_null $P1489, vivify_334
    new $P1489, "Undef"
  vivify_334:
    defined $I1490, $P1489
    unless $I1490, for_undef_335
    iter $P1487, $P1489
    new $P1519, 'ExceptionHandler'
    set_addr $P1519, loop1518_handler
    $P1519."handle_types"(64, 66, 65)
    push_eh $P1519
  loop1518_test:
    unless $P1487, loop1518_done
    shift $P1491, $P1487
  loop1518_redo:
    .const 'Sub' $P1493 = "86_1274564778.23532" 
    capture_lex $P1493
    $P1493($P1491)
  loop1518_next:
    goto loop1518_test
  loop1518_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1520, exception, 'type'
    eq $P1520, 64, loop1518_next
    eq $P1520, 66, loop1518_redo
  loop1518_done:
    pop_eh 
  for_undef_335:
.annotate 'line', 466
    get_hll_global $P1521, ["PAST"], "Regex"
    find_lex $P1522, "$str"
    find_lex $P1523, "$/"
    $P1524 = $P1521."new"($P1522, "enumcharlist" :named("pasttype"), $P1523 :named("node"))
    store_lex "$past", $P1524
.annotate 'line', 440
    goto if_1473_end
  if_1473:
.annotate 'line', 437
    .const 'Sub' $P1477 = "85_1274564778.23532" 
    capture_lex $P1477
    $P1477()
  if_1473_end:
.annotate 'line', 468
    find_lex $P1525, "$past"
    find_lex $P1526, "$/"
    unless_null $P1526, vivify_347
    $P1526 = root_new ['parrot';'Hash']
  vivify_347:
    set $P1527, $P1526["sign"]
    unless_null $P1527, vivify_348
    new $P1527, "Undef"
  vivify_348:
    set $S1528, $P1527
    iseq $I1529, $S1528, "-"
    $P1525."negate"($I1529)
.annotate 'line', 469
    find_lex $P1530, "$/"
    find_lex $P1531, "$past"
    $P1532 = $P1530."!make"($P1531)
.annotate 'line', 434
    .return ($P1532)
  control_1466:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1533, exception, "payload"
    .return ($P1533)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1492"  :anon :subid("86_1274564778.23532") :outer("84_1274564778.23532")
    .param pmc param_1494
.annotate 'line', 441
    .const 'Sub' $P1500 = "87_1274564778.23532" 
    capture_lex $P1500
    .lex "$_", param_1494
.annotate 'line', 442
    find_lex $P1497, "$_"
    unless_null $P1497, vivify_336
    $P1497 = root_new ['parrot';'ResizablePMCArray']
  vivify_336:
    set $P1498, $P1497[1]
    unless_null $P1498, vivify_337
    new $P1498, "Undef"
  vivify_337:
    if $P1498, if_1496
.annotate 'line', 464
    find_lex $P1514, "$str"
    find_lex $P1515, "$_"
    unless_null $P1515, vivify_338
    $P1515 = root_new ['parrot';'ResizablePMCArray']
  vivify_338:
    set $P1516, $P1515[0]
    unless_null $P1516, vivify_339
    new $P1516, "Undef"
  vivify_339:
    concat $P1517, $P1514, $P1516
    store_lex "$str", $P1517
    set $P1495, $P1517
.annotate 'line', 442
    goto if_1496_end
  if_1496:
    .const 'Sub' $P1500 = "87_1274564778.23532" 
    capture_lex $P1500
    $P1513 = $P1500()
    set $P1495, $P1513
  if_1496_end:
.annotate 'line', 441
    .return ($P1495)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1499"  :anon :subid("87_1274564778.23532") :outer("86_1274564778.23532")
.annotate 'line', 443
    new $P1501, "Undef"
    .lex "$a", $P1501
.annotate 'line', 444
    new $P1502, "Undef"
    .lex "$b", $P1502
.annotate 'line', 445
    new $P1503, "Undef"
    .lex "$c", $P1503
.annotate 'line', 443
    find_lex $P1504, "$_"
    unless_null $P1504, vivify_340
    $P1504 = root_new ['parrot';'ResizablePMCArray']
  vivify_340:
    set $P1505, $P1504[0]
    unless_null $P1505, vivify_341
    new $P1505, "Undef"
  vivify_341:
    store_lex "$a", $P1505
.annotate 'line', 444
    find_lex $P1506, "$_"
    unless_null $P1506, vivify_342
    $P1506 = root_new ['parrot';'ResizablePMCArray']
  vivify_342:
    set $P1507, $P1506[1]
    unless_null $P1507, vivify_343
    $P1507 = root_new ['parrot';'ResizablePMCArray']
  vivify_343:
    set $P1508, $P1507[0]
    unless_null $P1508, vivify_344
    new $P1508, "Undef"
  vivify_344:
    store_lex "$b", $P1508
.annotate 'line', 445

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
                             $P1509 = box $S2
                         
    store_lex "$c", $P1509
.annotate 'line', 462
    find_lex $P1510, "$str"
    find_lex $P1511, "$c"
    concat $P1512, $P1510, $P1511
    store_lex "$str", $P1512
.annotate 'line', 442
    .return ($P1512)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1476"  :anon :subid("85_1274564778.23532") :outer("84_1274564778.23532")
.annotate 'line', 438
    new $P1478, "Undef"
    .lex "$name", $P1478
    find_lex $P1479, "$/"
    unless_null $P1479, vivify_345
    $P1479 = root_new ['parrot';'Hash']
  vivify_345:
    set $P1480, $P1479["name"]
    unless_null $P1480, vivify_346
    new $P1480, "Undef"
  vivify_346:
    set $S1481, $P1480
    new $P1482, 'String'
    set $P1482, $S1481
    store_lex "$name", $P1482
.annotate 'line', 439
    get_hll_global $P1483, ["PAST"], "Regex"
    find_lex $P1484, "$name"
    find_lex $P1485, "$/"
    $P1486 = $P1483."new"($P1484, "subrule" :named("pasttype"), "method" :named("subtype"), $P1485 :named("node"))
    store_lex "$past", $P1486
.annotate 'line', 437
    .return ($P1486)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "mod_internal"  :subid("88_1274564778.23532") :method :outer("11_1274564778.23532")
    .param pmc param_1537
.annotate 'line', 472
    new $P1536, 'ExceptionHandler'
    set_addr $P1536, control_1535
    $P1536."handle_types"(57)
    push_eh $P1536
    .lex "self", self
    .lex "$/", param_1537
.annotate 'line', 473
    $P1538 = root_new ['parrot';'Hash']
    .lex "%mods", $P1538
.annotate 'line', 474
    new $P1539, "Undef"
    .lex "$n", $P1539
.annotate 'line', 473
    get_global $P1540, "@MODIFIERS"
    unless_null $P1540, vivify_349
    $P1540 = root_new ['parrot';'ResizablePMCArray']
  vivify_349:
    set $P1541, $P1540[0]
    unless_null $P1541, vivify_350
    new $P1541, "Undef"
  vivify_350:
    store_lex "%mods", $P1541
.annotate 'line', 474
    find_lex $P1544, "$/"
    unless_null $P1544, vivify_351
    $P1544 = root_new ['parrot';'Hash']
  vivify_351:
    set $P1545, $P1544["n"]
    unless_null $P1545, vivify_352
    $P1545 = root_new ['parrot';'ResizablePMCArray']
  vivify_352:
    set $P1546, $P1545[0]
    unless_null $P1546, vivify_353
    new $P1546, "Undef"
  vivify_353:
    set $S1547, $P1546
    isgt $I1548, $S1547, ""
    if $I1548, if_1543
    new $P1553, "Integer"
    assign $P1553, 1
    set $P1542, $P1553
    goto if_1543_end
  if_1543:
    find_lex $P1549, "$/"
    unless_null $P1549, vivify_354
    $P1549 = root_new ['parrot';'Hash']
  vivify_354:
    set $P1550, $P1549["n"]
    unless_null $P1550, vivify_355
    $P1550 = root_new ['parrot';'ResizablePMCArray']
  vivify_355:
    set $P1551, $P1550[0]
    unless_null $P1551, vivify_356
    new $P1551, "Undef"
  vivify_356:
    set $N1552, $P1551
    new $P1542, 'Float'
    set $P1542, $N1552
  if_1543_end:
    store_lex "$n", $P1542
.annotate 'line', 475
    find_lex $P1554, "$n"
    find_lex $P1555, "$/"
    unless_null $P1555, vivify_357
    $P1555 = root_new ['parrot';'Hash']
  vivify_357:
    set $P1556, $P1555["mod_ident"]
    unless_null $P1556, vivify_358
    $P1556 = root_new ['parrot';'Hash']
  vivify_358:
    set $P1557, $P1556["sym"]
    unless_null $P1557, vivify_359
    new $P1557, "Undef"
  vivify_359:
    set $S1558, $P1557
    find_lex $P1559, "%mods"
    unless_null $P1559, vivify_360
    $P1559 = root_new ['parrot';'Hash']
    store_lex "%mods", $P1559
  vivify_360:
    set $P1559[$S1558], $P1554
.annotate 'line', 476
    find_lex $P1560, "$/"
    $P1561 = $P1560."!make"(0)
.annotate 'line', 472
    .return ($P1561)
  control_1535:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1562, exception, "payload"
    .return ($P1562)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1567" :load :anon :subid("89_1274564778.23532")
.annotate 'line', 4
    .const 'Sub' $P1569 = "11_1274564778.23532" 
    $P1570 = $P1569()
    .return ($P1570)
.end


.namespace []
.sub "_block1573" :load :anon :subid("90_1274564778.23532")
.annotate 'line', 1
    .const 'Sub' $P1575 = "10_1274564778.23532" 
    $P1576 = $P1575()
    .return ($P1576)
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
