# Copyright (C) 2009, Patrick R. Michaud
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
.sub "_block11"  :anon :subid("10_1258924502.96798")
.annotate "line", 0
    get_hll_global $P14, ["Regex";"P6Regex";"Grammar"], "_block13" 
    capture_lex $P14
.annotate "line", 3
    get_hll_global $P14, ["Regex";"P6Regex";"Grammar"], "_block13" 
    capture_lex $P14
    $P579 = $P14()
.annotate "line", 1
    .return ($P579)
.end


.namespace []
.sub "" :load :init :subid("post158") :outer("10_1258924502.96798")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1258924502.96798" 
    .local pmc block
    set block, $P12
    $P580 = get_root_global ["parrot"], "P6metaclass"
    $P580."new_class"("Regex::P6Regex::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block13"  :subid("11_1258924502.96798") :outer("10_1258924502.96798")
.annotate "line", 3
    .const 'Sub' $P571 = "156_1258924502.96798" 
    capture_lex $P571
    .const 'Sub' $P563 = "154_1258924502.96798" 
    capture_lex $P563
    .const 'Sub' $P555 = "152_1258924502.96798" 
    capture_lex $P555
    .const 'Sub' $P534 = "147_1258924502.96798" 
    capture_lex $P534
    .const 'Sub' $P499 = "141_1258924502.96798" 
    capture_lex $P499
    .const 'Sub' $P487 = "138_1258924502.96798" 
    capture_lex $P487
    .const 'Sub' $P474 = "135_1258924502.96798" 
    capture_lex $P474
    .const 'Sub' $P468 = "133_1258924502.96798" 
    capture_lex $P468
    .const 'Sub' $P457 = "130_1258924502.96798" 
    capture_lex $P457
    .const 'Sub' $P446 = "127_1258924502.96798" 
    capture_lex $P446
    .const 'Sub' $P437 = "123_1258924502.96798" 
    capture_lex $P437
    .const 'Sub' $P431 = "121_1258924502.96798" 
    capture_lex $P431
    .const 'Sub' $P425 = "119_1258924502.96798" 
    capture_lex $P425
    .const 'Sub' $P419 = "117_1258924502.96798" 
    capture_lex $P419
    .const 'Sub' $P413 = "115_1258924502.96798" 
    capture_lex $P413
    .const 'Sub' $P402 = "113_1258924502.96798" 
    capture_lex $P402
    .const 'Sub' $P391 = "111_1258924502.96798" 
    capture_lex $P391
    .const 'Sub' $P383 = "109_1258924502.96798" 
    capture_lex $P383
    .const 'Sub' $P377 = "107_1258924502.96798" 
    capture_lex $P377
    .const 'Sub' $P371 = "105_1258924502.96798" 
    capture_lex $P371
    .const 'Sub' $P365 = "103_1258924502.96798" 
    capture_lex $P365
    .const 'Sub' $P359 = "101_1258924502.96798" 
    capture_lex $P359
    .const 'Sub' $P353 = "99_1258924502.96798" 
    capture_lex $P353
    .const 'Sub' $P347 = "97_1258924502.96798" 
    capture_lex $P347
    .const 'Sub' $P341 = "95_1258924502.96798" 
    capture_lex $P341
    .const 'Sub' $P335 = "93_1258924502.96798" 
    capture_lex $P335
    .const 'Sub' $P323 = "89_1258924502.96798" 
    capture_lex $P323
    .const 'Sub' $P311 = "87_1258924502.96798" 
    capture_lex $P311
    .const 'Sub' $P304 = "85_1258924502.96798" 
    capture_lex $P304
    .const 'Sub' $P287 = "83_1258924502.96798" 
    capture_lex $P287
    .const 'Sub' $P280 = "81_1258924502.96798" 
    capture_lex $P280
    .const 'Sub' $P274 = "79_1258924502.96798" 
    capture_lex $P274
    .const 'Sub' $P268 = "77_1258924502.96798" 
    capture_lex $P268
    .const 'Sub' $P261 = "75_1258924502.96798" 
    capture_lex $P261
    .const 'Sub' $P254 = "73_1258924502.96798" 
    capture_lex $P254
    .const 'Sub' $P247 = "71_1258924502.96798" 
    capture_lex $P247
    .const 'Sub' $P240 = "69_1258924502.96798" 
    capture_lex $P240
    .const 'Sub' $P234 = "67_1258924502.96798" 
    capture_lex $P234
    .const 'Sub' $P228 = "65_1258924502.96798" 
    capture_lex $P228
    .const 'Sub' $P222 = "63_1258924502.96798" 
    capture_lex $P222
    .const 'Sub' $P216 = "61_1258924502.96798" 
    capture_lex $P216
    .const 'Sub' $P210 = "59_1258924502.96798" 
    capture_lex $P210
    .const 'Sub' $P205 = "57_1258924502.96798" 
    capture_lex $P205
    .const 'Sub' $P200 = "55_1258924502.96798" 
    capture_lex $P200
    .const 'Sub' $P194 = "53_1258924502.96798" 
    capture_lex $P194
    .const 'Sub' $P188 = "51_1258924502.96798" 
    capture_lex $P188
    .const 'Sub' $P182 = "49_1258924502.96798" 
    capture_lex $P182
    .const 'Sub' $P166 = "44_1258924502.96798" 
    capture_lex $P166
    .const 'Sub' $P154 = "42_1258924502.96798" 
    capture_lex $P154
    .const 'Sub' $P147 = "40_1258924502.96798" 
    capture_lex $P147
    .const 'Sub' $P140 = "38_1258924502.96798" 
    capture_lex $P140
    .const 'Sub' $P133 = "36_1258924502.96798" 
    capture_lex $P133
    .const 'Sub' $P114 = "31_1258924502.96798" 
    capture_lex $P114
    .const 'Sub' $P101 = "28_1258924502.96798" 
    capture_lex $P101
    .const 'Sub' $P94 = "26_1258924502.96798" 
    capture_lex $P94
    .const 'Sub' $P82 = "24_1258924502.96798" 
    capture_lex $P82
    .const 'Sub' $P75 = "22_1258924502.96798" 
    capture_lex $P75
    .const 'Sub' $P63 = "20_1258924502.96798" 
    capture_lex $P63
    .const 'Sub' $P56 = "18_1258924502.96798" 
    capture_lex $P56
    .const 'Sub' $P46 = "15_1258924502.96798" 
    capture_lex $P46
    .const 'Sub' $P38 = "13_1258924502.96798" 
    capture_lex $P38
    .const 'Sub' $P15 = "12_1258924502.96798" 
    capture_lex $P15
    .const 'Sub' $P571 = "156_1258924502.96798" 
    capture_lex $P571
    .return ($P571)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "obs"  :subid("12_1258924502.96798") :method :outer("11_1258924502.96798")
    .param pmc param_18
    .param pmc param_19
    .param pmc param_20 :optional
    .param int has_param_20 :opt_flag
.annotate "line", 3
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "self", self
    .lex "$old", param_18
    .lex "$new", param_19
    if has_param_20, optparam_159
    new $P21, "String"
    assign $P21, "in Perl 6"
    set param_20, $P21
  optparam_159:
    .lex "$when", param_20
.annotate "line", 4
    find_lex $P22, "self"
    new $P23, "String"
    assign $P23, "Obsolete use of "
    find_lex $P24, "$old"
    set $S25, $P24
    concat $P26, $P23, $S25
    concat $P27, $P26, ";"
.annotate "line", 5
    find_lex $P28, "$when"
    set $S29, $P28
    concat $P30, $P27, $S29
    concat $P31, $P30, " please use "
    find_lex $P32, "$new"
    set $S33, $P32
    concat $P34, $P31, $S33
    concat $P35, $P34, "instead"
    $P36 = $P22."panic"($P35)
.annotate "line", 3
    .return ($P36)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P37, exception, "payload"
    .return ($P37)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "ws"  :subid("13_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 8
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
.annotate "line", 3
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
.sub "!PREFIX__ws"  :subid("14_1258924502.96798") :method
.annotate "line", 3
    new $P41, "ResizablePMCArray"
    push $P41, ""
    .return ($P41)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "normspace"  :subid("15_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
    .const 'Sub' $P52 = "17_1258924502.96798" 
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
.annotate "line", 10
  # rx subrule "before" subtype=zerowidth negate=
    rx47_cur."!cursor_pos"(rx47_pos)
    .const 'Sub' $P52 = "17_1258924502.96798" 
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
.annotate "line", 3
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
.sub "!PREFIX__normspace"  :subid("16_1258924502.96798") :method
.annotate "line", 3
    new $P49, "ResizablePMCArray"
    push $P49, ""
    .return ($P49)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block51"  :anon :subid("17_1258924502.96798") :method :outer("15_1258924502.96798")
.annotate "line", 10
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
.sub "arg"  :subid("18_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 13
    set_addr $I10, alt61_1
    rx57_cur."!mark_push"(0, rx57_pos, $I10)
.annotate "line", 14
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
.annotate "line", 15
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
.annotate "line", 16
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
.annotate "line", 12
  # rx pass
    rx57_cur."!cursor_pass"(rx57_pos, "arg")
    rx57_cur."!cursor_debug"("PASS  ", "arg", " at pos=", rx57_pos)
    .return (rx57_cur)
  rx57_fail:
.annotate "line", 3
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
.sub "!PREFIX__arg"  :subid("19_1258924502.96798") :method
.annotate "line", 3
    new $P59, "ResizablePMCArray"
    push $P59, ""
    push $P59, "\""
    push $P59, "'"
    .return ($P59)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "arglist"  :subid("20_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 20
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
.annotate "line", 3
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
.sub "!PREFIX__arglist"  :subid("21_1258924502.96798") :method
.annotate "line", 3
    new $P66, "ResizablePMCArray"
    push $P66, ""
    .return ($P66)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "TOP"  :subid("22_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 23
  # rx subrule "nibbler" subtype=capture negate=
    rx76_cur."!cursor_pos"(rx76_pos)
    $P10 = rx76_cur."nibbler"()
    unless $P10, rx76_fail
    rx76_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx76_pos = $P10."pos"()
  alt81_0:
.annotate "line", 24
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
.annotate "line", 22
  # rx pass
    rx76_cur."!cursor_pass"(rx76_pos, "TOP")
    rx76_cur."!cursor_debug"("PASS  ", "TOP", " at pos=", rx76_pos)
    .return (rx76_cur)
  rx76_fail:
.annotate "line", 3
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
.sub "!PREFIX__TOP"  :subid("23_1258924502.96798") :method
.annotate "line", 3
    $P78 = self."!PREFIX__!subrule"("nibbler", "")
    new $P79, "ResizablePMCArray"
    push $P79, $P78
    .return ($P79)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "nibbler"  :subid("24_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 28
  # rx reduce name="nibbler" key="open"
    rx83_cur."!cursor_pos"(rx83_pos)
    rx83_cur."!reduce"("nibbler", "open")
.annotate "line", 29
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
.annotate "line", 30
  # rx subrule "termish" subtype=capture negate=
    rx83_cur."!cursor_pos"(rx83_pos)
    $P10 = rx83_cur."termish"()
    unless $P10, rx83_fail
    rx83_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("termish")
    rx83_pos = $P10."pos"()
.annotate "line", 33
  # rx rxquantr90 ** 0..*
    set_addr $I93, rxquantr90_done
    rx83_cur."!mark_push"(0, rx83_pos, $I93)
  rxquantr90_loop:
  alt91_0:
.annotate "line", 31
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
.annotate "line", 32
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
.annotate "line", 33
    (rx83_rep) = rx83_cur."!mark_commit"($I93)
    rx83_cur."!mark_push"(rx83_rep, rx83_pos, $I93)
    goto rxquantr90_loop
  rxquantr90_done:
.annotate "line", 27
  # rx pass
    rx83_cur."!cursor_pass"(rx83_pos, "nibbler")
    rx83_cur."!cursor_debug"("PASS  ", "nibbler", " at pos=", rx83_pos)
    .return (rx83_cur)
  rx83_fail:
.annotate "line", 3
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
.sub "!PREFIX__nibbler"  :subid("25_1258924502.96798") :method
.annotate "line", 3
    new $P85, "ResizablePMCArray"
    push $P85, ""
    .return ($P85)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "termish"  :subid("26_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 37
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
.annotate "line", 36
  # rx pass
    rx95_cur."!cursor_pass"(rx95_pos, "termish")
    rx95_cur."!cursor_debug"("PASS  ", "termish", " at pos=", rx95_pos)
    .return (rx95_cur)
  rx95_fail:
.annotate "line", 3
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
.sub "!PREFIX__termish"  :subid("27_1258924502.96798") :method
.annotate "line", 3
    new $P97, "ResizablePMCArray"
    push $P97, ""
    .return ($P97)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantified_atom"  :subid("28_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
    .const 'Sub' $P110 = "30_1258924502.96798" 
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
.annotate "line", 41
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
    .const 'Sub' $P110 = "30_1258924502.96798" 
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
.annotate "line", 40
  # rx pass
    rx102_cur."!cursor_pass"(rx102_pos, "quantified_atom")
    rx102_cur."!cursor_debug"("PASS  ", "quantified_atom", " at pos=", rx102_pos)
    .return (rx102_cur)
  rx102_fail:
.annotate "line", 3
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
.sub "!PREFIX__quantified_atom"  :subid("29_1258924502.96798") :method
.annotate "line", 3
    $P104 = self."!PREFIX__!subrule"("atom", "")
    new $P105, "ResizablePMCArray"
    push $P105, $P104
    .return ($P105)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block109"  :anon :subid("30_1258924502.96798") :method :outer("28_1258924502.96798")
.annotate "line", 41
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
.sub "atom"  :subid("31_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
    .const 'Sub' $P125 = "33_1258924502.96798" 
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
.annotate "line", 46
    set_addr $I10, alt120_1
    rx115_cur."!mark_push"(0, rx115_pos, $I10)
.annotate "line", 47
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
    .const 'Sub' $P125 = "33_1258924502.96798" 
    capture_lex $P125
    $P10 = rx115_cur."before"($P125)
    unless $P10, rx115_fail
    (rx115_rep) = rx115_cur."!mark_commit"($I128)
  rxquantr121_done:
    goto alt120_end
  alt120_1:
.annotate "line", 48
  # rx subrule "metachar" subtype=capture negate=
    rx115_cur."!cursor_pos"(rx115_pos)
    $P10 = rx115_cur."metachar"()
    unless $P10, rx115_fail
    rx115_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("metachar")
    rx115_pos = $P10."pos"()
  alt120_end:
.annotate "line", 44
  # rx pass
    rx115_cur."!cursor_pass"(rx115_pos, "atom")
    rx115_cur."!cursor_debug"("PASS  ", "atom", " at pos=", rx115_pos)
    .return (rx115_cur)
  rx115_fail:
.annotate "line", 3
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
.sub "!PREFIX__atom"  :subid("32_1258924502.96798") :method
.annotate "line", 3
    $P117 = self."!PREFIX__!subrule"("metachar", "")
    new $P118, "ResizablePMCArray"
    push $P118, $P117
    push $P118, ""
    .return ($P118)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block124"  :anon :subid("33_1258924502.96798") :method :outer("31_1258924502.96798")
.annotate "line", 47
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
.sub "quantifier"  :subid("34_1258924502.96798") :method
.annotate "line", 52
    $P130 = self."!protoregex"("quantifier")
    .return ($P130)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier"  :subid("35_1258924502.96798") :method
.annotate "line", 52
    $P132 = self."!PREFIX__!protoregex"("quantifier")
    .return ($P132)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<*>"  :subid("36_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 53
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
.annotate "line", 3
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
.sub "!PREFIX__quantifier:sym<*>"  :subid("37_1258924502.96798") :method
.annotate "line", 3
    $P136 = self."!PREFIX__!subrule"("backmod", "*")
    new $P137, "ResizablePMCArray"
    push $P137, $P136
    .return ($P137)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<+>"  :subid("38_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 54
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
.annotate "line", 3
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
.sub "!PREFIX__quantifier:sym<+>"  :subid("39_1258924502.96798") :method
.annotate "line", 3
    $P143 = self."!PREFIX__!subrule"("backmod", "+")
    new $P144, "ResizablePMCArray"
    push $P144, $P143
    .return ($P144)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<?>"  :subid("40_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 55
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
.annotate "line", 3
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
.sub "!PREFIX__quantifier:sym<?>"  :subid("41_1258924502.96798") :method
.annotate "line", 3
    $P150 = self."!PREFIX__!subrule"("backmod", "?")
    new $P151, "ResizablePMCArray"
    push $P151, $P150
    .return ($P151)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<**>"  :subid("42_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 57
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
.annotate "line", 58
    set_addr $I10, alt160_1
    rx155_cur."!mark_push"(0, rx155_pos, $I10)
.annotate "line", 59
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
  # rx rxquantr162 ** 0..1
    set_addr $I165, rxquantr162_done
    rx155_cur."!mark_push"(0, rx155_pos, $I165)
  rxquantr162_loop:
  # rx literal  ".."
    add $I11, rx155_pos, 2
    gt $I11, rx155_eos, rx155_fail
    sub $I11, rx155_pos, rx155_off
    substr $S10, rx155_tgt, $I11, 2
    ne $S10, "..", rx155_fail
    add rx155_pos, 2
  # rx subcapture "max"
    set_addr $I10, rxcap_164_fail
    rx155_cur."!mark_push"(0, rx155_pos, $I10)
  alt163_0:
    set_addr $I10, alt163_1
    rx155_cur."!mark_push"(0, rx155_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx155_pos, rx155_off
    find_not_cclass $I11, 8, rx155_tgt, $I10, rx155_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx155_fail
    add rx155_pos, rx155_off, $I11
    goto alt163_end
  alt163_1:
  # rx literal  "*"
    add $I11, rx155_pos, 1
    gt $I11, rx155_eos, rx155_fail
    sub $I11, rx155_pos, rx155_off
    substr $S10, rx155_tgt, $I11, 1
    ne $S10, "*", rx155_fail
    add rx155_pos, 1
  alt163_end:
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
    (rx155_rep) = rx155_cur."!mark_commit"($I165)
  rxquantr162_done:
    goto alt160_end
  alt160_1:
.annotate "line", 60
  # rx subrule "quantified_atom" subtype=capture negate=
    rx155_cur."!cursor_pos"(rx155_pos)
    $P10 = rx155_cur."quantified_atom"()
    unless $P10, rx155_fail
    rx155_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantified_atom")
    rx155_pos = $P10."pos"()
  alt160_end:
.annotate "line", 56
  # rx pass
    rx155_cur."!cursor_pass"(rx155_pos, "quantifier:sym<**>")
    rx155_cur."!cursor_debug"("PASS  ", "quantifier:sym<**>", " at pos=", rx155_pos)
    .return (rx155_cur)
  rx155_fail:
.annotate "line", 3
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
.sub "!PREFIX__quantifier:sym<**>"  :subid("43_1258924502.96798") :method
.annotate "line", 3
    new $P157, "ResizablePMCArray"
    push $P157, "**"
    .return ($P157)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backmod"  :subid("44_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
    .const 'Sub' $P175 = "46_1258924502.96798" 
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
.annotate "line", 64
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
    .const 'Sub' $P175 = "46_1258924502.96798" 
    capture_lex $P175
    $P10 = rx167_cur."before"($P175)
    if $P10, rx167_fail
  alt173_end:
  # rx pass
    rx167_cur."!cursor_pass"(rx167_pos, "backmod")
    rx167_cur."!cursor_debug"("PASS  ", "backmod", " at pos=", rx167_pos)
    .return (rx167_cur)
  rx167_fail:
.annotate "line", 3
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
.sub "!PREFIX__backmod"  :subid("45_1258924502.96798") :method
.annotate "line", 3
    new $P169, "ResizablePMCArray"
    push $P169, ""
    .return ($P169)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block174"  :anon :subid("46_1258924502.96798") :method :outer("44_1258924502.96798")
.annotate "line", 64
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
.sub "metachar"  :subid("47_1258924502.96798") :method
.annotate "line", 66
    $P179 = self."!protoregex"("metachar")
    .return ($P179)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar"  :subid("48_1258924502.96798") :method
.annotate "line", 66
    $P181 = self."!PREFIX__!protoregex"("metachar")
    .return ($P181)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<ws>"  :subid("49_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 67
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
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<ws>"  :subid("50_1258924502.96798") :method
.annotate "line", 3
    $P185 = self."!PREFIX__!subrule"("", "")
    new $P186, "ResizablePMCArray"
    push $P186, $P185
    .return ($P186)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<[ ]>"  :subid("51_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 68
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
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<[ ]>"  :subid("52_1258924502.96798") :method
.annotate "line", 3
    $P191 = self."!PREFIX__!subrule"("nibbler", "[")
    new $P192, "ResizablePMCArray"
    push $P192, $P191
    .return ($P192)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<( )>"  :subid("53_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 69
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
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<( )>"  :subid("54_1258924502.96798") :method
.annotate "line", 3
    $P197 = self."!PREFIX__!subrule"("nibbler", "(")
    new $P198, "ResizablePMCArray"
    push $P198, $P197
    .return ($P198)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<'>"  :subid("55_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 70
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
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<'>"  :subid("56_1258924502.96798") :method
.annotate "line", 3
    new $P203, "ResizablePMCArray"
    push $P203, "'"
    .return ($P203)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<\">"  :subid("57_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 71
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
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<\">"  :subid("58_1258924502.96798") :method
.annotate "line", 3
    new $P208, "ResizablePMCArray"
    push $P208, "\""
    .return ($P208)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<.>"  :subid("59_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 72
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
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<.>"  :subid("60_1258924502.96798") :method
.annotate "line", 3
    new $P213, "ResizablePMCArray"
    push $P213, "."
    .return ($P213)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^>"  :subid("61_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 73
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
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<^>"  :subid("62_1258924502.96798") :method
.annotate "line", 3
    new $P219, "ResizablePMCArray"
    push $P219, "^"
    .return ($P219)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^^>"  :subid("63_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 74
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
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<^^>"  :subid("64_1258924502.96798") :method
.annotate "line", 3
    new $P225, "ResizablePMCArray"
    push $P225, "^^"
    .return ($P225)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$>"  :subid("65_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 75
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
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<$>"  :subid("66_1258924502.96798") :method
.annotate "line", 3
    new $P231, "ResizablePMCArray"
    push $P231, "$"
    .return ($P231)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$$>"  :subid("67_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 76
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
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<$$>"  :subid("68_1258924502.96798") :method
.annotate "line", 3
    new $P237, "ResizablePMCArray"
    push $P237, "$$"
    .return ($P237)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<:::>"  :subid("69_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 77
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
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<:::>"  :subid("70_1258924502.96798") :method
.annotate "line", 3
    $P243 = self."!PREFIX__!subrule"("", ":::")
    new $P244, "ResizablePMCArray"
    push $P244, $P243
    .return ($P244)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<::>"  :subid("71_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 78
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
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<::>"  :subid("72_1258924502.96798") :method
.annotate "line", 3
    $P250 = self."!PREFIX__!subrule"("", "::")
    new $P251, "ResizablePMCArray"
    push $P251, $P250
    .return ($P251)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<lwb>"  :subid("73_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 79
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
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<lwb>"  :subid("74_1258924502.96798") :method
.annotate "line", 3
    new $P257, "ResizablePMCArray"
    push $P257, unicode:"\x{ab}"
    push $P257, "<<"
    .return ($P257)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<rwb>"  :subid("75_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 80
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
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<rwb>"  :subid("76_1258924502.96798") :method
.annotate "line", 3
    new $P264, "ResizablePMCArray"
    push $P264, unicode:"\x{bb}"
    push $P264, ">>"
    .return ($P264)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<bs>"  :subid("77_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 81
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
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<bs>"  :subid("78_1258924502.96798") :method
.annotate "line", 3
    $P271 = self."!PREFIX__!subrule"("backslash", "\\")
    new $P272, "ResizablePMCArray"
    push $P272, $P271
    .return ($P272)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<mod>"  :subid("79_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 82
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
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<mod>"  :subid("80_1258924502.96798") :method
.annotate "line", 3
    $P277 = self."!PREFIX__!subrule"("mod_internal", "")
    new $P278, "ResizablePMCArray"
    push $P278, $P277
    .return ($P278)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<~>"  :subid("81_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 86
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
.annotate "line", 87
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
.annotate "line", 88
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
.annotate "line", 85
  # rx pass
    rx281_cur."!cursor_pass"(rx281_pos, "metachar:sym<~>")
    rx281_cur."!cursor_debug"("PASS  ", "metachar:sym<~>", " at pos=", rx281_pos)
    .return (rx281_cur)
  rx281_fail:
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<~>"  :subid("82_1258924502.96798") :method
.annotate "line", 3
    $P283 = self."!PREFIX__!subrule"("", "~")
    new $P284, "ResizablePMCArray"
    push $P284, $P283
    .return ($P284)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<{*}>"  :subid("83_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 92
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
.annotate "line", 93
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
.annotate "line", 91
  # rx pass
    rx288_cur."!cursor_pass"(rx288_pos, "metachar:sym<{*}>")
    rx288_cur."!cursor_debug"("PASS  ", "metachar:sym<{*}>", " at pos=", rx288_pos)
    .return (rx288_cur)
  rx288_fail:
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<{*}>"  :subid("84_1258924502.96798") :method
.annotate "line", 3
    new $P290, "ResizablePMCArray"
    push $P290, "{*}"
    .return ($P290)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<assert>"  :subid("85_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 96
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
.annotate "line", 97
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
.annotate "line", 95
  # rx pass
    rx305_cur."!cursor_pass"(rx305_pos, "metachar:sym<assert>")
    rx305_cur."!cursor_debug"("PASS  ", "metachar:sym<assert>", " at pos=", rx305_pos)
    .return (rx305_cur)
  rx305_fail:
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<assert>"  :subid("86_1258924502.96798") :method
.annotate "line", 3
    $P307 = self."!PREFIX__!subrule"("assertion", "<")
    new $P308, "ResizablePMCArray"
    push $P308, $P307
    .return ($P308)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<var>"  :subid("87_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 101
    set_addr $I10, alt316_1
    rx312_cur."!mark_push"(0, rx312_pos, $I10)
.annotate "line", 102
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
.annotate "line", 103
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
.annotate "line", 106
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
.annotate "line", 100
  # rx pass
    rx312_cur."!cursor_pass"(rx312_pos, "metachar:sym<var>")
    rx312_cur."!cursor_debug"("PASS  ", "metachar:sym<var>", " at pos=", rx312_pos)
    .return (rx312_cur)
  rx312_fail:
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<var>"  :subid("88_1258924502.96798") :method
.annotate "line", 3
    new $P314, "ResizablePMCArray"
    push $P314, "$"
    push $P314, "$<"
    .return ($P314)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<PIR>"  :subid("89_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 110
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
.annotate "line", 109
  # rx pass
    rx324_cur."!cursor_pass"(rx324_pos, "metachar:sym<PIR>")
    rx324_cur."!cursor_debug"("PASS  ", "metachar:sym<PIR>", " at pos=", rx324_pos)
    .return (rx324_cur)
  rx324_fail:
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<PIR>"  :subid("90_1258924502.96798") :method
.annotate "line", 3
    new $P326, "ResizablePMCArray"
    push $P326, ":PIR{{"
    .return ($P326)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash"  :subid("91_1258924502.96798") :method
.annotate "line", 113
    $P332 = self."!protoregex"("backslash")
    .return ($P332)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash"  :subid("92_1258924502.96798") :method
.annotate "line", 113
    $P334 = self."!PREFIX__!protoregex"("backslash")
    .return ($P334)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<w>"  :subid("93_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 114
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
.annotate "line", 3
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
.sub "!PREFIX__backslash:sym<w>"  :subid("94_1258924502.96798") :method
.annotate "line", 3
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
.sub "backslash:sym<b>"  :subid("95_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 115
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
.annotate "line", 3
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
.sub "!PREFIX__backslash:sym<b>"  :subid("96_1258924502.96798") :method
.annotate "line", 3
    new $P344, "ResizablePMCArray"
    push $P344, "B"
    push $P344, "b"
    .return ($P344)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<e>"  :subid("97_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 116
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
.annotate "line", 3
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
.sub "!PREFIX__backslash:sym<e>"  :subid("98_1258924502.96798") :method
.annotate "line", 3
    new $P350, "ResizablePMCArray"
    push $P350, "E"
    push $P350, "e"
    .return ($P350)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<f>"  :subid("99_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 117
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
.annotate "line", 3
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
.sub "!PREFIX__backslash:sym<f>"  :subid("100_1258924502.96798") :method
.annotate "line", 3
    new $P356, "ResizablePMCArray"
    push $P356, "F"
    push $P356, "f"
    .return ($P356)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<h>"  :subid("101_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 118
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
.annotate "line", 3
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
.sub "!PREFIX__backslash:sym<h>"  :subid("102_1258924502.96798") :method
.annotate "line", 3
    new $P362, "ResizablePMCArray"
    push $P362, "H"
    push $P362, "h"
    .return ($P362)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<r>"  :subid("103_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 119
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
.annotate "line", 3
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
.sub "!PREFIX__backslash:sym<r>"  :subid("104_1258924502.96798") :method
.annotate "line", 3
    new $P368, "ResizablePMCArray"
    push $P368, "R"
    push $P368, "r"
    .return ($P368)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<t>"  :subid("105_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 120
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
.annotate "line", 3
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
.sub "!PREFIX__backslash:sym<t>"  :subid("106_1258924502.96798") :method
.annotate "line", 3
    new $P374, "ResizablePMCArray"
    push $P374, "T"
    push $P374, "t"
    .return ($P374)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<v>"  :subid("107_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 121
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
.annotate "line", 3
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
.sub "!PREFIX__backslash:sym<v>"  :subid("108_1258924502.96798") :method
.annotate "line", 3
    new $P380, "ResizablePMCArray"
    push $P380, "V"
    push $P380, "v"
    .return ($P380)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<c>"  :subid("109_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
    .local string rx384_tgt
    .local int rx384_pos
    .local int rx384_off
    .local int rx384_eos
    .local int rx384_rep
    .local pmc rx384_cur
    (rx384_cur, rx384_pos, rx384_tgt) = self."!cursor_start"()
    rx384_cur."!cursor_debug"("START ", "backslash:sym<c>")
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
    ne $I10, -1, rxscan389_done
    goto rxscan389_scan
  rxscan389_loop:
    ($P10) = rx384_cur."from"()
    inc $P10
    set rx384_pos, $P10
    ge rx384_pos, rx384_eos, rxscan389_done
  rxscan389_scan:
    set_addr $I10, rxscan389_loop
    rx384_cur."!mark_push"(0, rx384_pos, $I10)
  rxscan389_done:
.annotate "line", 122
  # rx subcapture "sym"
    set_addr $I10, rxcap_390_fail
    rx384_cur."!mark_push"(0, rx384_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx384_pos, rx384_eos, rx384_fail
    sub $I10, rx384_pos, rx384_off
    substr $S10, rx384_tgt, $I10, 1
    index $I11, "cC", $S10
    lt $I11, 0, rx384_fail
    inc rx384_pos
    set_addr $I10, rxcap_390_fail
    ($I12, $I11) = rx384_cur."!mark_peek"($I10)
    rx384_cur."!cursor_pos"($I11)
    ($P10) = rx384_cur."!cursor_start"()
    $P10."!cursor_pass"(rx384_pos, "")
    rx384_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_390_done
  rxcap_390_fail:
    goto rx384_fail
  rxcap_390_done:
  # rx subrule "charspec" subtype=capture negate=
    rx384_cur."!cursor_pos"(rx384_pos)
    $P10 = rx384_cur."charspec"()
    unless $P10, rx384_fail
    rx384_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charspec")
    rx384_pos = $P10."pos"()
  # rx pass
    rx384_cur."!cursor_pass"(rx384_pos, "backslash:sym<c>")
    rx384_cur."!cursor_debug"("PASS  ", "backslash:sym<c>", " at pos=", rx384_pos)
    .return (rx384_cur)
  rx384_fail:
.annotate "line", 3
    (rx384_rep, rx384_pos, $I10, $P10) = rx384_cur."!mark_fail"(0)
    lt rx384_pos, -1, rx384_done
    eq rx384_pos, -1, rx384_fail
    jump $I10
  rx384_done:
    rx384_cur."!cursor_fail"()
    rx384_cur."!cursor_debug"("FAIL  ", "backslash:sym<c>")
    .return (rx384_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<c>"  :subid("110_1258924502.96798") :method
.annotate "line", 3
    $P386 = self."!PREFIX__!subrule"("charspec", "C")
    $P387 = self."!PREFIX__!subrule"("charspec", "c")
    new $P388, "ResizablePMCArray"
    push $P388, $P386
    push $P388, $P387
    .return ($P388)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<o>"  :subid("111_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
    .local string rx392_tgt
    .local int rx392_pos
    .local int rx392_off
    .local int rx392_eos
    .local int rx392_rep
    .local pmc rx392_cur
    (rx392_cur, rx392_pos, rx392_tgt) = self."!cursor_start"()
    rx392_cur."!cursor_debug"("START ", "backslash:sym<o>")
    .lex unicode:"$\x{a2}", rx392_cur
    .local pmc match
    .lex "$/", match
    length rx392_eos, rx392_tgt
    set rx392_off, 0
    lt rx392_pos, 2, rx392_start
    sub rx392_off, rx392_pos, 1
    substr rx392_tgt, rx392_tgt, rx392_off
  rx392_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan399_done
    goto rxscan399_scan
  rxscan399_loop:
    ($P10) = rx392_cur."from"()
    inc $P10
    set rx392_pos, $P10
    ge rx392_pos, rx392_eos, rxscan399_done
  rxscan399_scan:
    set_addr $I10, rxscan399_loop
    rx392_cur."!mark_push"(0, rx392_pos, $I10)
  rxscan399_done:
.annotate "line", 123
  # rx subcapture "sym"
    set_addr $I10, rxcap_400_fail
    rx392_cur."!mark_push"(0, rx392_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx392_pos, rx392_eos, rx392_fail
    sub $I10, rx392_pos, rx392_off
    substr $S10, rx392_tgt, $I10, 1
    index $I11, "oO", $S10
    lt $I11, 0, rx392_fail
    inc rx392_pos
    set_addr $I10, rxcap_400_fail
    ($I12, $I11) = rx392_cur."!mark_peek"($I10)
    rx392_cur."!cursor_pos"($I11)
    ($P10) = rx392_cur."!cursor_start"()
    $P10."!cursor_pass"(rx392_pos, "")
    rx392_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_400_done
  rxcap_400_fail:
    goto rx392_fail
  rxcap_400_done:
  alt401_0:
    set_addr $I10, alt401_1
    rx392_cur."!mark_push"(0, rx392_pos, $I10)
  # rx subrule "octint" subtype=capture negate=
    rx392_cur."!cursor_pos"(rx392_pos)
    $P10 = rx392_cur."octint"()
    unless $P10, rx392_fail
    rx392_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octint")
    rx392_pos = $P10."pos"()
    goto alt401_end
  alt401_1:
  # rx literal  "["
    add $I11, rx392_pos, 1
    gt $I11, rx392_eos, rx392_fail
    sub $I11, rx392_pos, rx392_off
    substr $S10, rx392_tgt, $I11, 1
    ne $S10, "[", rx392_fail
    add rx392_pos, 1
  # rx subrule "octints" subtype=capture negate=
    rx392_cur."!cursor_pos"(rx392_pos)
    $P10 = rx392_cur."octints"()
    unless $P10, rx392_fail
    rx392_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octints")
    rx392_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx392_pos, 1
    gt $I11, rx392_eos, rx392_fail
    sub $I11, rx392_pos, rx392_off
    substr $S10, rx392_tgt, $I11, 1
    ne $S10, "]", rx392_fail
    add rx392_pos, 1
  alt401_end:
  # rx pass
    rx392_cur."!cursor_pass"(rx392_pos, "backslash:sym<o>")
    rx392_cur."!cursor_debug"("PASS  ", "backslash:sym<o>", " at pos=", rx392_pos)
    .return (rx392_cur)
  rx392_fail:
.annotate "line", 3
    (rx392_rep, rx392_pos, $I10, $P10) = rx392_cur."!mark_fail"(0)
    lt rx392_pos, -1, rx392_done
    eq rx392_pos, -1, rx392_fail
    jump $I10
  rx392_done:
    rx392_cur."!cursor_fail"()
    rx392_cur."!cursor_debug"("FAIL  ", "backslash:sym<o>")
    .return (rx392_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<o>"  :subid("112_1258924502.96798") :method
.annotate "line", 3
    $P394 = self."!PREFIX__!subrule"("octints", "O[")
    $P395 = self."!PREFIX__!subrule"("octint", "O")
    $P396 = self."!PREFIX__!subrule"("octints", "o[")
    $P397 = self."!PREFIX__!subrule"("octint", "o")
    new $P398, "ResizablePMCArray"
    push $P398, $P394
    push $P398, $P395
    push $P398, $P396
    push $P398, $P397
    .return ($P398)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<x>"  :subid("113_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
    .local string rx403_tgt
    .local int rx403_pos
    .local int rx403_off
    .local int rx403_eos
    .local int rx403_rep
    .local pmc rx403_cur
    (rx403_cur, rx403_pos, rx403_tgt) = self."!cursor_start"()
    rx403_cur."!cursor_debug"("START ", "backslash:sym<x>")
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
    ne $I10, -1, rxscan410_done
    goto rxscan410_scan
  rxscan410_loop:
    ($P10) = rx403_cur."from"()
    inc $P10
    set rx403_pos, $P10
    ge rx403_pos, rx403_eos, rxscan410_done
  rxscan410_scan:
    set_addr $I10, rxscan410_loop
    rx403_cur."!mark_push"(0, rx403_pos, $I10)
  rxscan410_done:
.annotate "line", 124
  # rx subcapture "sym"
    set_addr $I10, rxcap_411_fail
    rx403_cur."!mark_push"(0, rx403_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx403_pos, rx403_eos, rx403_fail
    sub $I10, rx403_pos, rx403_off
    substr $S10, rx403_tgt, $I10, 1
    index $I11, "xX", $S10
    lt $I11, 0, rx403_fail
    inc rx403_pos
    set_addr $I10, rxcap_411_fail
    ($I12, $I11) = rx403_cur."!mark_peek"($I10)
    rx403_cur."!cursor_pos"($I11)
    ($P10) = rx403_cur."!cursor_start"()
    $P10."!cursor_pass"(rx403_pos, "")
    rx403_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_411_done
  rxcap_411_fail:
    goto rx403_fail
  rxcap_411_done:
  alt412_0:
    set_addr $I10, alt412_1
    rx403_cur."!mark_push"(0, rx403_pos, $I10)
  # rx subrule "hexint" subtype=capture negate=
    rx403_cur."!cursor_pos"(rx403_pos)
    $P10 = rx403_cur."hexint"()
    unless $P10, rx403_fail
    rx403_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexint")
    rx403_pos = $P10."pos"()
    goto alt412_end
  alt412_1:
  # rx literal  "["
    add $I11, rx403_pos, 1
    gt $I11, rx403_eos, rx403_fail
    sub $I11, rx403_pos, rx403_off
    substr $S10, rx403_tgt, $I11, 1
    ne $S10, "[", rx403_fail
    add rx403_pos, 1
  # rx subrule "hexints" subtype=capture negate=
    rx403_cur."!cursor_pos"(rx403_pos)
    $P10 = rx403_cur."hexints"()
    unless $P10, rx403_fail
    rx403_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexints")
    rx403_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx403_pos, 1
    gt $I11, rx403_eos, rx403_fail
    sub $I11, rx403_pos, rx403_off
    substr $S10, rx403_tgt, $I11, 1
    ne $S10, "]", rx403_fail
    add rx403_pos, 1
  alt412_end:
  # rx pass
    rx403_cur."!cursor_pass"(rx403_pos, "backslash:sym<x>")
    rx403_cur."!cursor_debug"("PASS  ", "backslash:sym<x>", " at pos=", rx403_pos)
    .return (rx403_cur)
  rx403_fail:
.annotate "line", 3
    (rx403_rep, rx403_pos, $I10, $P10) = rx403_cur."!mark_fail"(0)
    lt rx403_pos, -1, rx403_done
    eq rx403_pos, -1, rx403_fail
    jump $I10
  rx403_done:
    rx403_cur."!cursor_fail"()
    rx403_cur."!cursor_debug"("FAIL  ", "backslash:sym<x>")
    .return (rx403_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<x>"  :subid("114_1258924502.96798") :method
.annotate "line", 3
    $P405 = self."!PREFIX__!subrule"("hexints", "X[")
    $P406 = self."!PREFIX__!subrule"("hexint", "X")
    $P407 = self."!PREFIX__!subrule"("hexints", "x[")
    $P408 = self."!PREFIX__!subrule"("hexint", "x")
    new $P409, "ResizablePMCArray"
    push $P409, $P405
    push $P409, $P406
    push $P409, $P407
    push $P409, $P408
    .return ($P409)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<A>"  :subid("115_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 125
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
.annotate "line", 3
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
.sub "!PREFIX__backslash:sym<A>"  :subid("116_1258924502.96798") :method
.annotate "line", 3
    $P416 = self."!PREFIX__!subrule"("", "A")
    new $P417, "ResizablePMCArray"
    push $P417, $P416
    .return ($P417)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<z>"  :subid("117_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 126
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
.annotate "line", 3
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
.sub "!PREFIX__backslash:sym<z>"  :subid("118_1258924502.96798") :method
.annotate "line", 3
    $P422 = self."!PREFIX__!subrule"("", "z")
    new $P423, "ResizablePMCArray"
    push $P423, $P422
    .return ($P423)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Z>"  :subid("119_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 127
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
.annotate "line", 3
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
.sub "!PREFIX__backslash:sym<Z>"  :subid("120_1258924502.96798") :method
.annotate "line", 3
    $P428 = self."!PREFIX__!subrule"("", "Z")
    new $P429, "ResizablePMCArray"
    push $P429, $P428
    .return ($P429)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Q>"  :subid("121_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 128
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
.annotate "line", 3
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
.sub "!PREFIX__backslash:sym<Q>"  :subid("122_1258924502.96798") :method
.annotate "line", 3
    $P434 = self."!PREFIX__!subrule"("", "Q")
    new $P435, "ResizablePMCArray"
    push $P435, $P434
    .return ($P435)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<misc>"  :subid("123_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 129
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
.annotate "line", 3
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
.sub "!PREFIX__backslash:sym<misc>"  :subid("124_1258924502.96798") :method
.annotate "line", 3
    new $P440, "ResizablePMCArray"
    push $P440, ""
    .return ($P440)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion"  :subid("125_1258924502.96798") :method
.annotate "line", 131
    $P443 = self."!protoregex"("assertion")
    .return ($P443)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion"  :subid("126_1258924502.96798") :method
.annotate "line", 131
    $P445 = self."!PREFIX__!protoregex"("assertion")
    .return ($P445)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<?>"  :subid("127_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
    .const 'Sub' $P454 = "129_1258924502.96798" 
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
.annotate "line", 133
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
    .const 'Sub' $P454 = "129_1258924502.96798" 
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
.annotate "line", 3
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
.sub "!PREFIX__assertion:sym<?>"  :subid("128_1258924502.96798") :method
.annotate "line", 3
    $P449 = self."!PREFIX__!subrule"("assertion", "?")
    new $P450, "ResizablePMCArray"
    push $P450, $P449
    push $P450, "?"
    .return ($P450)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block453"  :anon :subid("129_1258924502.96798") :method :outer("127_1258924502.96798")
.annotate "line", 133
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
.sub "assertion:sym<!>"  :subid("130_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
    .const 'Sub' $P465 = "132_1258924502.96798" 
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
.annotate "line", 134
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
    .const 'Sub' $P465 = "132_1258924502.96798" 
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
.annotate "line", 3
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
.sub "!PREFIX__assertion:sym<!>"  :subid("131_1258924502.96798") :method
.annotate "line", 3
    $P460 = self."!PREFIX__!subrule"("assertion", "!")
    new $P461, "ResizablePMCArray"
    push $P461, $P460
    push $P461, "!"
    .return ($P461)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block464"  :anon :subid("132_1258924502.96798") :method :outer("130_1258924502.96798")
.annotate "line", 134
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
.sub "assertion:sym<method>"  :subid("133_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 137
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
.annotate "line", 136
  # rx pass
    rx469_cur."!cursor_pass"(rx469_pos, "assertion:sym<method>")
    rx469_cur."!cursor_debug"("PASS  ", "assertion:sym<method>", " at pos=", rx469_pos)
    .return (rx469_cur)
  rx469_fail:
.annotate "line", 3
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
.sub "!PREFIX__assertion:sym<method>"  :subid("134_1258924502.96798") :method
.annotate "line", 3
    $P471 = self."!PREFIX__!subrule"("assertion", ".")
    new $P472, "ResizablePMCArray"
    push $P472, $P471
    .return ($P472)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<name>"  :subid("135_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
    .const 'Sub' $P483 = "137_1258924502.96798" 
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
.annotate "line", 141
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
.annotate "line", 148
  # rx rxquantr480 ** 0..1
    set_addr $I486, rxquantr480_done
    rx475_cur."!mark_push"(0, rx475_pos, $I486)
  rxquantr480_loop:
  alt481_0:
.annotate "line", 142
    set_addr $I10, alt481_1
    rx475_cur."!mark_push"(0, rx475_pos, $I10)
.annotate "line", 143
  # rx subrule "before" subtype=zerowidth negate=
    rx475_cur."!cursor_pos"(rx475_pos)
    .const 'Sub' $P483 = "137_1258924502.96798" 
    capture_lex $P483
    $P10 = rx475_cur."before"($P483)
    unless $P10, rx475_fail
    goto alt481_end
  alt481_1:
    set_addr $I10, alt481_2
    rx475_cur."!mark_push"(0, rx475_pos, $I10)
.annotate "line", 144
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
.annotate "line", 145
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
.annotate "line", 146
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
.annotate "line", 147
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
.annotate "line", 148
    (rx475_rep) = rx475_cur."!mark_commit"($I486)
  rxquantr480_done:
.annotate "line", 140
  # rx pass
    rx475_cur."!cursor_pass"(rx475_pos, "assertion:sym<name>")
    rx475_cur."!cursor_debug"("PASS  ", "assertion:sym<name>", " at pos=", rx475_pos)
    .return (rx475_cur)
  rx475_fail:
.annotate "line", 3
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
.sub "!PREFIX__assertion:sym<name>"  :subid("136_1258924502.96798") :method
.annotate "line", 3
    new $P477, "ResizablePMCArray"
    push $P477, ""
    .return ($P477)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block482"  :anon :subid("137_1258924502.96798") :method :outer("135_1258924502.96798")
.annotate "line", 143
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
.sub "assertion:sym<[>"  :subid("138_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
    .const 'Sub' $P493 = "140_1258924502.96798" 
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
.annotate "line", 151
  # rx subrule "before" subtype=zerowidth negate=
    rx488_cur."!cursor_pos"(rx488_pos)
    .const 'Sub' $P493 = "140_1258924502.96798" 
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
.annotate "line", 3
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
.sub "!PREFIX__assertion:sym<[>"  :subid("139_1258924502.96798") :method
.annotate "line", 3
    new $P490, "ResizablePMCArray"
    push $P490, ""
    .return ($P490)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block492"  :anon :subid("140_1258924502.96798") :method :outer("138_1258924502.96798")
.annotate "line", 151
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
.sub "cclass_elem"  :subid("141_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
    .const 'Sub' $P511 = "143_1258924502.96798" 
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
.annotate "line", 154
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
.annotate "line", 155
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
.annotate "line", 156
    set_addr $I10, alt508_1
    rx500_cur."!mark_push"(0, rx500_pos, $I10)
.annotate "line", 157
  # rx literal  "["
    add $I11, rx500_pos, 1
    gt $I11, rx500_eos, rx500_fail
    sub $I11, rx500_pos, rx500_off
    substr $S10, rx500_tgt, $I11, 1
    ne $S10, "[", rx500_fail
    add rx500_pos, 1
.annotate "line", 160
  # rx rxquantr509 ** 0..*
    set_addr $I530, rxquantr509_done
    rx500_cur."!mark_push"(0, rx500_pos, $I530)
  rxquantr509_loop:
.annotate "line", 157
  # rx subrule $P511 subtype=capture negate=
    rx500_cur."!cursor_pos"(rx500_pos)
    .const 'Sub' $P511 = "143_1258924502.96798" 
    capture_lex $P511
    $P10 = rx500_cur.$P511()
    unless $P10, rx500_fail
    rx500_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charspec")
    rx500_pos = $P10."pos"()
.annotate "line", 160
    (rx500_rep) = rx500_cur."!mark_commit"($I530)
    rx500_cur."!mark_push"(rx500_rep, rx500_pos, $I530)
    goto rxquantr509_loop
  rxquantr509_done:
.annotate "line", 161
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
.annotate "line", 157
    goto alt508_end
  alt508_1:
.annotate "line", 162
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
.annotate "line", 164
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
.annotate "line", 153
  # rx pass
    rx500_cur."!cursor_pass"(rx500_pos, "cclass_elem")
    rx500_cur."!cursor_debug"("PASS  ", "cclass_elem", " at pos=", rx500_pos)
    .return (rx500_cur)
  rx500_fail:
.annotate "line", 3
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
.sub "!PREFIX__cclass_elem"  :subid("142_1258924502.96798") :method
.annotate "line", 3
    new $P502, "ResizablePMCArray"
    push $P502, ""
    push $P502, "-"
    push $P502, "+"
    .return ($P502)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block510"  :anon :subid("143_1258924502.96798") :method :outer("141_1258924502.96798")
.annotate "line", 157
    .const 'Sub' $P526 = "146_1258924502.96798" 
    capture_lex $P526
    .const 'Sub' $P521 = "145_1258924502.96798" 
    capture_lex $P521
    .const 'Sub' $P517 = "144_1258924502.96798" 
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
.annotate "line", 158
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
.annotate "line", 159
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
    .const 'Sub' $P517 = "144_1258924502.96798" 
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
    .const 'Sub' $P521 = "145_1258924502.96798" 
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
    .const 'Sub' $P526 = "146_1258924502.96798" 
    capture_lex $P526
    $P10 = rx512_cur.$P526()
    unless $P10, rx512_fail
    rx512_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("1")
    rx512_pos = $P10."pos"()
    (rx512_rep) = rx512_cur."!mark_commit"($I529)
  rxquantr524_done:
  alt514_end:
.annotate "line", 157
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
.sub "_block516"  :anon :subid("144_1258924502.96798") :method :outer("143_1258924502.96798")
.annotate "line", 159
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
.sub "_block520"  :anon :subid("145_1258924502.96798") :method :outer("143_1258924502.96798")
.annotate "line", 159
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
.sub "_block525"  :anon :subid("146_1258924502.96798") :method :outer("143_1258924502.96798")
.annotate "line", 159
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
.sub "mod_internal"  :subid("147_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
    .const 'Sub' $P543 = "149_1258924502.96798" 
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
.annotate "line", 168
    set_addr $I10, alt540_1
    rx535_cur."!mark_push"(0, rx535_pos, $I10)
.annotate "line", 169
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
    .const 'Sub' $P543 = "149_1258924502.96798" 
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
.annotate "line", 170
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
.annotate "line", 167
  # rx pass
    rx535_cur."!cursor_pass"(rx535_pos, "mod_internal")
    rx535_cur."!cursor_debug"("PASS  ", "mod_internal", " at pos=", rx535_pos)
    .return (rx535_cur)
  rx535_fail:
.annotate "line", 3
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
.sub "!PREFIX__mod_internal"  :subid("148_1258924502.96798") :method
.annotate "line", 3
    $P537 = self."!PREFIX__!subrule"("mod_ident", ":")
    new $P538, "ResizablePMCArray"
    push $P538, $P537
    push $P538, ":"
    .return ($P538)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block542"  :anon :subid("149_1258924502.96798") :method :outer("147_1258924502.96798")
.annotate "line", 169
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
.sub "mod_ident"  :subid("150_1258924502.96798") :method
.annotate "line", 174
    $P552 = self."!protoregex"("mod_ident")
    .return ($P552)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident"  :subid("151_1258924502.96798") :method
.annotate "line", 174
    $P554 = self."!PREFIX__!protoregex"("mod_ident")
    .return ($P554)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ignorecase>"  :subid("152_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 175
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
.annotate "line", 3
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
.sub "!PREFIX__mod_ident:sym<ignorecase>"  :subid("153_1258924502.96798") :method
.annotate "line", 3
    new $P558, "ResizablePMCArray"
    push $P558, "i"
    .return ($P558)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ratchet>"  :subid("154_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 176
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
.annotate "line", 3
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
.sub "!PREFIX__mod_ident:sym<ratchet>"  :subid("155_1258924502.96798") :method
.annotate "line", 3
    new $P566, "ResizablePMCArray"
    push $P566, "r"
    .return ($P566)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<sigspace>"  :subid("156_1258924502.96798") :method :outer("11_1258924502.96798")
.annotate "line", 3
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
.annotate "line", 177
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
.annotate "line", 3
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
.sub "!PREFIX__mod_ident:sym<sigspace>"  :subid("157_1258924502.96798") :method
.annotate "line", 3
    new $P574, "ResizablePMCArray"
    push $P574, "s"
    .return ($P574)
.end

### .include 'gen/p6regex-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1258924510.05036")
.annotate "line", 0
    get_hll_global $P14, ["Regex";"P6Regex";"Actions"], "_block13" 
    capture_lex $P14
.annotate "line", 4
    get_hll_global $P14, ["Regex";"P6Regex";"Actions"], "_block13" 
    capture_lex $P14
    $P1558 = $P14()
.annotate "line", 1
    .return ($P1558)
.end


.namespace []
.sub "" :load :init :subid("post89") :outer("10_1258924510.05036")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1258924510.05036" 
    .local pmc block
    set block, $P12
    $P1559 = get_root_global ["parrot"], "P6metaclass"
    $P1559."new_class"("Regex::P6Regex::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block13"  :subid("11_1258924510.05036") :outer("10_1258924510.05036")
.annotate "line", 4
    .const 'Sub' $P1525 = "88_1258924510.05036" 
    capture_lex $P1525
    .const 'Sub' $P1456 = "84_1258924510.05036" 
    capture_lex $P1456
    .const 'Sub' $P1388 = "82_1258924510.05036" 
    capture_lex $P1388
    .const 'Sub' $P1315 = "79_1258924510.05036" 
    capture_lex $P1315
    .const 'Sub' $P1301 = "78_1258924510.05036" 
    capture_lex $P1301
    .const 'Sub' $P1277 = "77_1258924510.05036" 
    capture_lex $P1277
    .const 'Sub' $P1259 = "76_1258924510.05036" 
    capture_lex $P1259
    .const 'Sub' $P1245 = "75_1258924510.05036" 
    capture_lex $P1245
    .const 'Sub' $P1214 = "74_1258924510.05036" 
    capture_lex $P1214
    .const 'Sub' $P1183 = "73_1258924510.05036" 
    capture_lex $P1183
    .const 'Sub' $P1167 = "72_1258924510.05036" 
    capture_lex $P1167
    .const 'Sub' $P1151 = "71_1258924510.05036" 
    capture_lex $P1151
    .const 'Sub' $P1135 = "70_1258924510.05036" 
    capture_lex $P1135
    .const 'Sub' $P1119 = "69_1258924510.05036" 
    capture_lex $P1119
    .const 'Sub' $P1103 = "68_1258924510.05036" 
    capture_lex $P1103
    .const 'Sub' $P1087 = "67_1258924510.05036" 
    capture_lex $P1087
    .const 'Sub' $P1071 = "66_1258924510.05036" 
    capture_lex $P1071
    .const 'Sub' $P1047 = "65_1258924510.05036" 
    capture_lex $P1047
    .const 'Sub' $P1032 = "64_1258924510.05036" 
    capture_lex $P1032
    .const 'Sub' $P976 = "63_1258924510.05036" 
    capture_lex $P976
    .const 'Sub' $P955 = "62_1258924510.05036" 
    capture_lex $P955
    .const 'Sub' $P933 = "61_1258924510.05036" 
    capture_lex $P933
    .const 'Sub' $P923 = "60_1258924510.05036" 
    capture_lex $P923
    .const 'Sub' $P913 = "59_1258924510.05036" 
    capture_lex $P913
    .const 'Sub' $P903 = "58_1258924510.05036" 
    capture_lex $P903
    .const 'Sub' $P891 = "57_1258924510.05036" 
    capture_lex $P891
    .const 'Sub' $P879 = "56_1258924510.05036" 
    capture_lex $P879
    .const 'Sub' $P867 = "55_1258924510.05036" 
    capture_lex $P867
    .const 'Sub' $P855 = "54_1258924510.05036" 
    capture_lex $P855
    .const 'Sub' $P843 = "53_1258924510.05036" 
    capture_lex $P843
    .const 'Sub' $P831 = "52_1258924510.05036" 
    capture_lex $P831
    .const 'Sub' $P819 = "51_1258924510.05036" 
    capture_lex $P819
    .const 'Sub' $P807 = "50_1258924510.05036" 
    capture_lex $P807
    .const 'Sub' $P784 = "49_1258924510.05036" 
    capture_lex $P784
    .const 'Sub' $P761 = "48_1258924510.05036" 
    capture_lex $P761
    .const 'Sub' $P743 = "47_1258924510.05036" 
    capture_lex $P743
    .const 'Sub' $P733 = "46_1258924510.05036" 
    capture_lex $P733
    .const 'Sub' $P715 = "45_1258924510.05036" 
    capture_lex $P715
    .const 'Sub' $P668 = "44_1258924510.05036" 
    capture_lex $P668
    .const 'Sub' $P651 = "43_1258924510.05036" 
    capture_lex $P651
    .const 'Sub' $P636 = "42_1258924510.05036" 
    capture_lex $P636
    .const 'Sub' $P621 = "41_1258924510.05036" 
    capture_lex $P621
    .const 'Sub' $P595 = "40_1258924510.05036" 
    capture_lex $P595
    .const 'Sub' $P545 = "38_1258924510.05036" 
    capture_lex $P545
    .const 'Sub' $P477 = "36_1258924510.05036" 
    capture_lex $P477
    .const 'Sub' $P420 = "33_1258924510.05036" 
    capture_lex $P420
    .const 'Sub' $P405 = "32_1258924510.05036" 
    capture_lex $P405
    .const 'Sub' $P379 = "30_1258924510.05036" 
    capture_lex $P379
    .const 'Sub' $P362 = "29_1258924510.05036" 
    capture_lex $P362
    .const 'Sub' $P340 = "28_1258924510.05036" 
    capture_lex $P340
    .const 'Sub' $P308 = "27_1258924510.05036" 
    capture_lex $P308
    .const 'Sub' $P46 = "14_1258924510.05036" 
    capture_lex $P46
    .const 'Sub' $P21 = "13_1258924510.05036" 
    capture_lex $P21
    .const 'Sub' $P16 = "12_1258924510.05036" 
    capture_lex $P16
    get_global $P15, "@MODIFIERS"
    unless_null $P15, vivify_90
    new $P15, "ResizablePMCArray"
    set_global "@MODIFIERS", $P15
  vivify_90:
.annotate "line", 6
    .const 'Sub' $P16 = "12_1258924510.05036" 
    capture_lex $P16
    .lex "INIT", $P16
.annotate "line", 475
    .const 'Sub' $P21 = "13_1258924510.05036" 
    capture_lex $P21
    .lex "buildsub", $P21
.annotate "line", 490
    .const 'Sub' $P46 = "14_1258924510.05036" 
    capture_lex $P46
    .lex "capnames", $P46
.annotate "line", 556
    .const 'Sub' $P308 = "27_1258924510.05036" 
    capture_lex $P308
    .lex "backmod", $P308
.annotate "line", 563
    .const 'Sub' $P340 = "28_1258924510.05036" 
    capture_lex $P340
    .lex "subrule_alias", $P340
.annotate "line", 4
    get_global $P360, "@MODIFIERS"
    find_lex $P361, "INIT"
.annotate "line", 468
    find_lex $P1554, "buildsub"
    find_lex $P1555, "capnames"
    find_lex $P1556, "backmod"
    find_lex $P1557, "subrule_alias"
.annotate "line", 4
    .return ($P1557)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "INIT"  :subid("12_1258924510.05036") :outer("11_1258924510.05036")
.annotate "line", 6
    new $P18, 'ExceptionHandler'
    set_addr $P18, control_17
    $P18."handle_types"(58)
    push_eh $P18
.annotate "line", 7

        $P19 = new ['ResizablePMCArray']
        $P0 = new ['Hash']
        push $P19, $P0
    
    set_global "@MODIFIERS", $P19
.annotate "line", 6
    .return ($P19)
  control_17:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P20, exception, "payload"
    .return ($P20)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "buildsub"  :subid("13_1258924510.05036") :outer("11_1258924510.05036")
    .param pmc param_24
    .param pmc param_25 :optional
    .param int has_param_25 :opt_flag
.annotate "line", 475
    new $P23, 'ExceptionHandler'
    set_addr $P23, control_22
    $P23."handle_types"(58)
    push_eh $P23
    .lex "$rpast", param_24
    if has_param_25, optparam_91
    get_hll_global $P26, ["PAST"], "Block"
    $P27 = $P26."new"()
    set param_25, $P27
  optparam_91:
    .lex "$block", param_25
.annotate "line", 476
    new $P28, "Hash"
    .lex "%capnames", $P28
    find_lex $P29, "$rpast"
    $P30 = "capnames"($P29, 0)
    store_lex "%capnames", $P30
.annotate "line", 477
    new $P31, "Integer"
    assign $P31, 0
    find_lex $P32, "%capnames"
    unless_null $P32, vivify_92
    new $P32, "Hash"
    store_lex "%capnames", $P32
  vivify_92:
    set $P32[""], $P31
.annotate "line", 478
    get_hll_global $P33, ["PAST"], "Regex"
.annotate "line", 479
    get_hll_global $P34, ["PAST"], "Regex"
    $P35 = $P34."new"("scan" :named("pasttype"))
    find_lex $P36, "$rpast"
.annotate "line", 481
    get_hll_global $P37, ["PAST"], "Regex"
    $P38 = $P37."new"("pass" :named("pasttype"))
    find_lex $P39, "%capnames"
    $P40 = $P33."new"($P35, $P36, $P38, "concat" :named("pasttype"), $P39 :named("capnames"))
.annotate "line", 478
    store_lex "$rpast", $P40
.annotate "line", 485
    find_lex $P41, "$block"
    find_lex $P42, "$rpast"
    $P41."push"($P42)
.annotate "line", 486
    find_lex $P43, "$block"
    $P43."blocktype"("method")
    find_lex $P44, "$block"
.annotate "line", 475
    .return ($P44)
  control_22:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P45, exception, "payload"
    .return ($P45)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "capnames"  :subid("14_1258924510.05036") :outer("11_1258924510.05036")
    .param pmc param_49
    .param pmc param_50
.annotate "line", 490
    .const 'Sub' $P283 = "25_1258924510.05036" 
    capture_lex $P283
    .const 'Sub' $P218 = "22_1258924510.05036" 
    capture_lex $P218
    .const 'Sub' $P174 = "20_1258924510.05036" 
    capture_lex $P174
    .const 'Sub' $P132 = "18_1258924510.05036" 
    capture_lex $P132
    .const 'Sub' $P61 = "15_1258924510.05036" 
    capture_lex $P61
    new $P48, 'ExceptionHandler'
    set_addr $P48, control_47
    $P48."handle_types"(58)
    push_eh $P48
    .lex "$ast", param_49
    .lex "$count", param_50
.annotate "line", 491
    new $P51, "Hash"
    .lex "%capnames", $P51
.annotate "line", 492
    new $P52, "Undef"
    .lex "$pasttype", $P52
.annotate "line", 490
    find_lex $P53, "%capnames"
.annotate "line", 492
    find_lex $P54, "$ast"
    $P55 = $P54."pasttype"()
    store_lex "$pasttype", $P55
.annotate "line", 493
    find_lex $P57, "$pasttype"
    set $S58, $P57
    iseq $I59, $S58, "alt"
    if $I59, if_56
.annotate "line", 506
    find_lex $P123, "$pasttype"
    set $S124, $P123
    iseq $I125, $S124, "concat"
    if $I125, if_122
.annotate "line", 515
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
.annotate "line", 528
    find_lex $P214, "$pasttype"
    set $S215, $P214
    iseq $I216, $S215, "subcapture"
    if $I216, if_213
.annotate "line", 545
    find_lex $P279, "$pasttype"
    set $S280, $P279
    iseq $I281, $S280, "quant"
    unless $I281, if_278_end
    .const 'Sub' $P283 = "25_1258924510.05036" 
    capture_lex $P283
    $P283()
  if_278_end:
    goto if_213_end
  if_213:
.annotate "line", 528
    .const 'Sub' $P218 = "22_1258924510.05036" 
    capture_lex $P218
    $P218()
  if_213_end:
    goto if_164_end
  if_164:
.annotate "line", 515
    .const 'Sub' $P174 = "20_1258924510.05036" 
    capture_lex $P174
    $P174()
  if_164_end:
    goto if_122_end
  if_122:
.annotate "line", 507
    find_lex $P127, "$ast"
    $P128 = $P127."list"()
    defined $I129, $P128
    unless $I129, for_undef_113
    iter $P126, $P128
    new $P162, 'ExceptionHandler'
    set_addr $P162, loop161_handler
    $P162."handle_types"(65, 67, 66)
    push_eh $P162
  loop161_test:
    unless $P126, loop161_done
    shift $P130, $P126
  loop161_redo:
    .const 'Sub' $P132 = "18_1258924510.05036" 
    capture_lex $P132
    $P132($P130)
  loop161_next:
    goto loop161_test
  loop161_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P163, exception, 'type'
    eq $P163, 65, loop161_next
    eq $P163, 67, loop161_redo
  loop161_done:
    pop_eh 
  for_undef_113:
  if_122_end:
.annotate "line", 506
    goto if_56_end
  if_56:
.annotate "line", 493
    .const 'Sub' $P61 = "15_1258924510.05036" 
    capture_lex $P61
    $P61()
  if_56_end:
.annotate "line", 552
    find_lex $P304, "$count"
    find_lex $P305, "%capnames"
    unless_null $P305, vivify_133
    new $P305, "Hash"
    store_lex "%capnames", $P305
  vivify_133:
    set $P305[""], $P304
    find_lex $P306, "%capnames"
.annotate "line", 490
    .return ($P306)
  control_47:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P307, exception, "payload"
    .return ($P307)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block282"  :anon :subid("25_1258924510.05036") :outer("14_1258924510.05036")
.annotate "line", 545
    .const 'Sub' $P294 = "26_1258924510.05036" 
    capture_lex $P294
.annotate "line", 546
    new $P284, "Hash"
    .lex "%astcap", $P284
    find_lex $P285, "$ast"
    unless_null $P285, vivify_93
    new $P285, "ResizablePMCArray"
  vivify_93:
    set $P286, $P285[0]
    unless_null $P286, vivify_94
    new $P286, "Undef"
  vivify_94:
    find_lex $P287, "$count"
    $P288 = "capnames"($P286, $P287)
    store_lex "%astcap", $P288
.annotate "line", 547
    find_lex $P290, "%astcap"
    defined $I291, $P290
    unless $I291, for_undef_95
    iter $P289, $P290
    new $P300, 'ExceptionHandler'
    set_addr $P300, loop299_handler
    $P300."handle_types"(65, 67, 66)
    push_eh $P300
  loop299_test:
    unless $P289, loop299_done
    shift $P292, $P289
  loop299_redo:
    .const 'Sub' $P294 = "26_1258924510.05036" 
    capture_lex $P294
    $P294($P292)
  loop299_next:
    goto loop299_test
  loop299_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P301, exception, 'type'
    eq $P301, 65, loop299_next
    eq $P301, 67, loop299_redo
  loop299_done:
    pop_eh 
  for_undef_95:
.annotate "line", 550
    find_lex $P302, "%astcap"
    unless_null $P302, vivify_97
    new $P302, "Hash"
  vivify_97:
    set $P303, $P302[""]
    unless_null $P303, vivify_98
    new $P303, "Undef"
  vivify_98:
    store_lex "$count", $P303
.annotate "line", 545
    .return ($P303)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block293"  :anon :subid("26_1258924510.05036") :outer("25_1258924510.05036")
    .param pmc param_295
.annotate "line", 547
    .lex "$_", param_295
.annotate "line", 548
    new $P296, "Integer"
    assign $P296, 2
    find_lex $P297, "$_"
    find_lex $P298, "%capnames"
    unless_null $P298, vivify_96
    new $P298, "Hash"
    store_lex "%capnames", $P298
  vivify_96:
    set $P298[$P297], $P296
.annotate "line", 547
    .return ($P296)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block217"  :anon :subid("22_1258924510.05036") :outer("14_1258924510.05036")
.annotate "line", 528
    .const 'Sub' $P260 = "24_1258924510.05036" 
    capture_lex $P260
    .const 'Sub' $P230 = "23_1258924510.05036" 
    capture_lex $P230
.annotate "line", 529
    new $P219, "Undef"
    .lex "$name", $P219
.annotate "line", 530
    new $P220, "ResizablePMCArray"
    .lex "@names", $P220
.annotate "line", 539
    new $P221, "Hash"
    .lex "%x", $P221
.annotate "line", 529
    find_lex $P222, "$ast"
    $P223 = $P222."name"()
    store_lex "$name", $P223
.annotate "line", 530

            $P0 = find_lex '$name'
            $S0 = $P0
            $P224 = split '=', $S0
        
    store_lex "@names", $P224
.annotate "line", 535
    find_lex $P226, "@names"
    defined $I227, $P226
    unless $I227, for_undef_99
    iter $P225, $P226
    new $P249, 'ExceptionHandler'
    set_addr $P249, loop248_handler
    $P249."handle_types"(65, 67, 66)
    push_eh $P249
  loop248_test:
    unless $P225, loop248_done
    shift $P228, $P225
  loop248_redo:
    .const 'Sub' $P230 = "23_1258924510.05036" 
    capture_lex $P230
    $P230($P228)
  loop248_next:
    goto loop248_test
  loop248_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P250, exception, 'type'
    eq $P250, 65, loop248_next
    eq $P250, 67, loop248_redo
  loop248_done:
    pop_eh 
  for_undef_99:
.annotate "line", 539
    find_lex $P251, "$ast"
    unless_null $P251, vivify_101
    new $P251, "ResizablePMCArray"
  vivify_101:
    set $P252, $P251[0]
    unless_null $P252, vivify_102
    new $P252, "Undef"
  vivify_102:
    find_lex $P253, "$count"
    $P254 = "capnames"($P252, $P253)
    store_lex "%x", $P254
.annotate "line", 540
    find_lex $P256, "%x"
    defined $I257, $P256
    unless $I257, for_undef_103
    iter $P255, $P256
    new $P274, 'ExceptionHandler'
    set_addr $P274, loop273_handler
    $P274."handle_types"(65, 67, 66)
    push_eh $P274
  loop273_test:
    unless $P255, loop273_done
    shift $P258, $P255
  loop273_redo:
    .const 'Sub' $P260 = "24_1258924510.05036" 
    capture_lex $P260
    $P260($P258)
  loop273_next:
    goto loop273_test
  loop273_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P275, exception, 'type'
    eq $P275, 65, loop273_next
    eq $P275, 67, loop273_redo
  loop273_done:
    pop_eh 
  for_undef_103:
.annotate "line", 543
    find_lex $P276, "%x"
    unless_null $P276, vivify_109
    new $P276, "Hash"
  vivify_109:
    set $P277, $P276[""]
    unless_null $P277, vivify_110
    new $P277, "Undef"
  vivify_110:
    store_lex "$count", $P277
.annotate "line", 528
    .return ($P277)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block229"  :anon :subid("23_1258924510.05036") :outer("22_1258924510.05036")
    .param pmc param_231
.annotate "line", 535
    .lex "$_", param_231
.annotate "line", 536
    find_lex $P235, "$_"
    set $S236, $P235
    iseq $I237, $S236, "0"
    unless $I237, unless_234
    new $P233, 'Integer'
    set $P233, $I237
    goto unless_234_end
  unless_234:
    find_lex $P238, "$_"
    set $N239, $P238
    new $P240, "Integer"
    assign $P240, 0
    set $N241, $P240
    isgt $I242, $N239, $N241
    new $P233, 'Integer'
    set $P233, $I242
  unless_234_end:
    unless $P233, if_232_end
    find_lex $P243, "$_"
    add $P244, $P243, 1
    store_lex "$count", $P244
  if_232_end:
.annotate "line", 537
    new $P245, "Integer"
    assign $P245, 1
    find_lex $P246, "$_"
    find_lex $P247, "%capnames"
    unless_null $P247, vivify_100
    new $P247, "Hash"
    store_lex "%capnames", $P247
  vivify_100:
    set $P247[$P246], $P245
.annotate "line", 535
    .return ($P245)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block259"  :anon :subid("24_1258924510.05036") :outer("22_1258924510.05036")
    .param pmc param_261
.annotate "line", 540
    .lex "$_", param_261
.annotate "line", 541
    find_lex $P262, "$_"
    find_lex $P263, "%capnames"
    unless_null $P263, vivify_104
    new $P263, "Hash"
  vivify_104:
    set $P264, $P263[$P262]
    unless_null $P264, vivify_105
    new $P264, "Undef"
  vivify_105:
    set $N265, $P264
    new $P266, 'Float'
    set $P266, $N265
    find_lex $P267, "$_"
    find_lex $P268, "%x"
    unless_null $P268, vivify_106
    new $P268, "Hash"
  vivify_106:
    set $P269, $P268[$P267]
    unless_null $P269, vivify_107
    new $P269, "Undef"
  vivify_107:
    add $P270, $P266, $P269
    find_lex $P271, "$_"
    find_lex $P272, "%capnames"
    unless_null $P272, vivify_108
    new $P272, "Hash"
    store_lex "%capnames", $P272
  vivify_108:
    set $P272[$P271], $P270
.annotate "line", 540
    .return ($P270)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block173"  :anon :subid("20_1258924510.05036") :outer("14_1258924510.05036")
.annotate "line", 515
    .const 'Sub' $P192 = "21_1258924510.05036" 
    capture_lex $P192
.annotate "line", 516
    new $P175, "Undef"
    .lex "$name", $P175
.annotate "line", 518
    new $P176, "ResizablePMCArray"
    .lex "@names", $P176
.annotate "line", 516
    find_lex $P177, "$ast"
    $P178 = $P177."name"()
    store_lex "$name", $P178
.annotate "line", 517
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
.annotate "line", 518

            $P0 = find_lex '$name'
            $S0 = $P0
            $P186 = split '=', $S0
        
    store_lex "@names", $P186
.annotate "line", 523
    find_lex $P188, "@names"
    defined $I189, $P188
    unless $I189, for_undef_111
    iter $P187, $P188
    new $P211, 'ExceptionHandler'
    set_addr $P211, loop210_handler
    $P211."handle_types"(65, 67, 66)
    push_eh $P211
  loop210_test:
    unless $P187, loop210_done
    shift $P190, $P187
  loop210_redo:
    .const 'Sub' $P192 = "21_1258924510.05036" 
    capture_lex $P192
    $P192($P190)
  loop210_next:
    goto loop210_test
  loop210_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P212, exception, 'type'
    eq $P212, 65, loop210_next
    eq $P212, 67, loop210_redo
  loop210_done:
    pop_eh 
  for_undef_111:
.annotate "line", 515
    .return ($P187)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block191"  :anon :subid("21_1258924510.05036") :outer("20_1258924510.05036")
    .param pmc param_193
.annotate "line", 523
    .lex "$_", param_193
.annotate "line", 524
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
    new $P202, "Integer"
    assign $P202, 0
    set $N203, $P202
    isgt $I204, $N201, $N203
    new $P195, 'Integer'
    set $P195, $I204
  unless_196_end:
    unless $P195, if_194_end
    find_lex $P205, "$_"
    add $P206, $P205, 1
    store_lex "$count", $P206
  if_194_end:
.annotate "line", 525
    new $P207, "Integer"
    assign $P207, 1
    find_lex $P208, "$_"
    find_lex $P209, "%capnames"
    unless_null $P209, vivify_112
    new $P209, "Hash"
    store_lex "%capnames", $P209
  vivify_112:
    set $P209[$P208], $P207
.annotate "line", 523
    .return ($P207)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block131"  :anon :subid("18_1258924510.05036") :outer("14_1258924510.05036")
    .param pmc param_134
.annotate "line", 507
    .const 'Sub' $P143 = "19_1258924510.05036" 
    capture_lex $P143
.annotate "line", 508
    new $P133, "Hash"
    .lex "%x", $P133
    .lex "$_", param_134
    find_lex $P135, "$_"
    find_lex $P136, "$count"
    $P137 = "capnames"($P135, $P136)
    store_lex "%x", $P137
.annotate "line", 509
    find_lex $P139, "%x"
    defined $I140, $P139
    unless $I140, for_undef_114
    iter $P138, $P139
    new $P157, 'ExceptionHandler'
    set_addr $P157, loop156_handler
    $P157."handle_types"(65, 67, 66)
    push_eh $P157
  loop156_test:
    unless $P138, loop156_done
    shift $P141, $P138
  loop156_redo:
    .const 'Sub' $P143 = "19_1258924510.05036" 
    capture_lex $P143
    $P143($P141)
  loop156_next:
    goto loop156_test
  loop156_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P158, exception, 'type'
    eq $P158, 65, loop156_next
    eq $P158, 67, loop156_redo
  loop156_done:
    pop_eh 
  for_undef_114:
.annotate "line", 512
    find_lex $P159, "%x"
    unless_null $P159, vivify_120
    new $P159, "Hash"
  vivify_120:
    set $P160, $P159[""]
    unless_null $P160, vivify_121
    new $P160, "Undef"
  vivify_121:
    store_lex "$count", $P160
.annotate "line", 507
    .return ($P160)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block142"  :anon :subid("19_1258924510.05036") :outer("18_1258924510.05036")
    .param pmc param_144
.annotate "line", 509
    .lex "$_", param_144
.annotate "line", 510
    find_lex $P145, "$_"
    find_lex $P146, "%capnames"
    unless_null $P146, vivify_115
    new $P146, "Hash"
  vivify_115:
    set $P147, $P146[$P145]
    unless_null $P147, vivify_116
    new $P147, "Undef"
  vivify_116:
    set $N148, $P147
    new $P149, 'Float'
    set $P149, $N148
    find_lex $P150, "$_"
    find_lex $P151, "%x"
    unless_null $P151, vivify_117
    new $P151, "Hash"
  vivify_117:
    set $P152, $P151[$P150]
    unless_null $P152, vivify_118
    new $P152, "Undef"
  vivify_118:
    add $P153, $P149, $P152
    find_lex $P154, "$_"
    find_lex $P155, "%capnames"
    unless_null $P155, vivify_119
    new $P155, "Hash"
    store_lex "%capnames", $P155
  vivify_119:
    set $P155[$P154], $P153
.annotate "line", 509
    .return ($P153)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block60"  :anon :subid("15_1258924510.05036") :outer("14_1258924510.05036")
.annotate "line", 493
    .const 'Sub' $P70 = "16_1258924510.05036" 
    capture_lex $P70
.annotate "line", 494
    new $P62, "Undef"
    .lex "$max", $P62
    find_lex $P63, "$count"
    store_lex "$max", $P63
.annotate "line", 495
    find_lex $P65, "$ast"
    $P66 = $P65."list"()
    defined $I67, $P66
    unless $I67, for_undef_122
    iter $P64, $P66
    new $P119, 'ExceptionHandler'
    set_addr $P119, loop118_handler
    $P119."handle_types"(65, 67, 66)
    push_eh $P119
  loop118_test:
    unless $P64, loop118_done
    shift $P68, $P64
  loop118_redo:
    .const 'Sub' $P70 = "16_1258924510.05036" 
    capture_lex $P70
    $P70($P68)
  loop118_next:
    goto loop118_test
  loop118_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P120, exception, 'type'
    eq $P120, 65, loop118_next
    eq $P120, 67, loop118_redo
  loop118_done:
    pop_eh 
  for_undef_122:
.annotate "line", 504
    find_lex $P121, "$max"
    store_lex "$count", $P121
.annotate "line", 493
    .return ($P121)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block69"  :anon :subid("16_1258924510.05036") :outer("15_1258924510.05036")
    .param pmc param_72
.annotate "line", 495
    .const 'Sub' $P81 = "17_1258924510.05036" 
    capture_lex $P81
.annotate "line", 496
    new $P71, "Hash"
    .lex "%x", $P71
    .lex "$_", param_72
    find_lex $P73, "$_"
    find_lex $P74, "$count"
    $P75 = "capnames"($P73, $P74)
    store_lex "%x", $P75
.annotate "line", 497
    find_lex $P77, "%x"
    defined $I78, $P77
    unless $I78, for_undef_123
    iter $P76, $P77
    new $P106, 'ExceptionHandler'
    set_addr $P106, loop105_handler
    $P106."handle_types"(65, 67, 66)
    push_eh $P106
  loop105_test:
    unless $P76, loop105_done
    shift $P79, $P76
  loop105_redo:
    .const 'Sub' $P81 = "17_1258924510.05036" 
    capture_lex $P81
    $P81($P79)
  loop105_next:
    goto loop105_test
  loop105_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, 'type'
    eq $P107, 65, loop105_next
    eq $P107, 67, loop105_redo
  loop105_done:
    pop_eh 
  for_undef_123:
.annotate "line", 502
    find_lex $P110, "%x"
    unless_null $P110, vivify_129
    new $P110, "Hash"
  vivify_129:
    set $P111, $P110[""]
    unless_null $P111, vivify_130
    new $P111, "Undef"
  vivify_130:
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
    unless_null $P116, vivify_131
    new $P116, "Hash"
  vivify_131:
    set $P117, $P116[""]
    unless_null $P117, vivify_132
    new $P117, "Undef"
  vivify_132:
    store_lex "$max", $P117
    set $P108, $P117
  if_109_end:
.annotate "line", 495
    .return ($P108)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block80"  :anon :subid("17_1258924510.05036") :outer("16_1258924510.05036")
    .param pmc param_82
.annotate "line", 497
    .lex "$_", param_82
.annotate "line", 498
    find_lex $P87, "$_"
    find_lex $P88, "%capnames"
    unless_null $P88, vivify_124
    new $P88, "Hash"
  vivify_124:
    set $P89, $P88[$P87]
    unless_null $P89, vivify_125
    new $P89, "Undef"
  vivify_125:
    set $N90, $P89
    new $P91, "Integer"
    assign $P91, 2
    set $N92, $P91
    islt $I93, $N90, $N92
    if $I93, if_86
    new $P85, 'Integer'
    set $P85, $I93
    goto if_86_end
  if_86:
    find_lex $P94, "$_"
    find_lex $P95, "%x"
    unless_null $P95, vivify_126
    new $P95, "Hash"
  vivify_126:
    set $P96, $P95[$P94]
    unless_null $P96, vivify_127
    new $P96, "Undef"
  vivify_127:
    set $N97, $P96
    new $P98, "Integer"
    assign $P98, 1
    set $N99, $P98
    iseq $I100, $N97, $N99
    new $P85, 'Integer'
    set $P85, $I100
  if_86_end:
    if $P85, if_84
    new $P102, "Integer"
    assign $P102, 2
    set $P83, $P102
    goto if_84_end
  if_84:
    new $P101, "Integer"
    assign $P101, 1
    set $P83, $P101
  if_84_end:
.annotate "line", 499
    find_lex $P103, "$_"
    find_lex $P104, "%capnames"
    unless_null $P104, vivify_128
    new $P104, "Hash"
    store_lex "%capnames", $P104
  vivify_128:
    set $P104[$P103], $P83
.annotate "line", 497
    .return ($P83)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backmod"  :subid("27_1258924510.05036") :outer("11_1258924510.05036")
    .param pmc param_311
    .param pmc param_312
.annotate "line", 556
    new $P310, 'ExceptionHandler'
    set_addr $P310, control_309
    $P310."handle_types"(58)
    push_eh $P310
    .lex "$ast", param_311
    .lex "$backmod", param_312
.annotate "line", 557
    find_lex $P314, "$backmod"
    set $S315, $P314
    iseq $I316, $S315, ":"
    if $I316, if_313
.annotate "line", 558
    find_lex $P321, "$backmod"
    set $S322, $P321
    iseq $I323, $S322, ":?"
    unless $I323, unless_320
    new $P319, 'Integer'
    set $P319, $I323
    goto unless_320_end
  unless_320:
    find_lex $P324, "$backmod"
    set $S325, $P324
    iseq $I326, $S325, "?"
    new $P319, 'Integer'
    set $P319, $I326
  unless_320_end:
    if $P319, if_318
.annotate "line", 559
    find_lex $P331, "$backmod"
    set $S332, $P331
    iseq $I333, $S332, ":!"
    unless $I333, unless_330
    new $P329, 'Integer'
    set $P329, $I333
    goto unless_330_end
  unless_330:
    find_lex $P334, "$backmod"
    set $S335, $P334
    iseq $I336, $S335, "!"
    new $P329, 'Integer'
    set $P329, $I336
  unless_330_end:
    unless $P329, if_328_end
    find_lex $P337, "$ast"
    $P337."backtrack"("g")
  if_328_end:
    goto if_318_end
  if_318:
.annotate "line", 558
    find_lex $P327, "$ast"
    $P327."backtrack"("f")
  if_318_end:
    goto if_313_end
  if_313:
.annotate "line", 557
    find_lex $P317, "$ast"
    $P317."backtrack"("r")
  if_313_end:
    find_lex $P338, "$ast"
.annotate "line", 556
    .return ($P338)
  control_309:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P339, exception, "payload"
    .return ($P339)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "subrule_alias"  :subid("28_1258924510.05036") :outer("11_1258924510.05036")
    .param pmc param_343
    .param pmc param_344
.annotate "line", 563
    new $P342, 'ExceptionHandler'
    set_addr $P342, control_341
    $P342."handle_types"(58)
    push_eh $P342
    .lex "$past", param_343
    .lex "$name", param_344
.annotate "line", 564
    find_lex $P346, "$past"
    $S347 = $P346."name"()
    isgt $I348, $S347, ""
    if $I348, if_345
.annotate "line", 565
    find_lex $P355, "$past"
    find_lex $P356, "$name"
    $P355."name"($P356)
    goto if_345_end
  if_345:
.annotate "line", 564
    find_lex $P349, "$past"
    find_lex $P350, "$name"
    concat $P351, $P350, "="
    find_lex $P352, "$past"
    $S353 = $P352."name"()
    concat $P354, $P351, $S353
    $P349."name"($P354)
  if_345_end:
.annotate "line", 566
    find_lex $P357, "$past"
    $P358 = $P357."subtype"("capture")
.annotate "line", 563
    .return ($P358)
  control_341:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P359, exception, "payload"
    .return ($P359)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "arg"  :subid("29_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_365
.annotate "line", 14
    new $P364, 'ExceptionHandler'
    set_addr $P364, control_363
    $P364."handle_types"(58)
    push_eh $P364
    .lex "self", self
    .lex "$/", param_365
.annotate "line", 15
    find_lex $P366, "$/"
    find_lex $P369, "$/"
    unless_null $P369, vivify_134
    new $P369, "Hash"
  vivify_134:
    set $P370, $P369["quote_EXPR"]
    unless_null $P370, vivify_135
    new $P370, "Undef"
  vivify_135:
    if $P370, if_368
    find_lex $P374, "$/"
    unless_null $P374, vivify_136
    new $P374, "Hash"
  vivify_136:
    set $P375, $P374["val"]
    unless_null $P375, vivify_137
    new $P375, "Undef"
  vivify_137:
    set $N376, $P375
    new $P367, 'Float'
    set $P367, $N376
    goto if_368_end
  if_368:
    find_lex $P371, "$/"
    unless_null $P371, vivify_138
    new $P371, "Hash"
  vivify_138:
    set $P372, $P371["quote_EXPR"]
    unless_null $P372, vivify_139
    new $P372, "Undef"
  vivify_139:
    $P373 = $P372."ast"()
    set $P367, $P373
  if_368_end:
    $P377 = $P366."!make"($P367)
.annotate "line", 14
    .return ($P377)
  control_363:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P378, exception, "payload"
    .return ($P378)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "arglist"  :subid("30_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_382
.annotate "line", 18
    .const 'Sub' $P392 = "31_1258924510.05036" 
    capture_lex $P392
    new $P381, 'ExceptionHandler'
    set_addr $P381, control_380
    $P381."handle_types"(58)
    push_eh $P381
    .lex "self", self
    .lex "$/", param_382
.annotate "line", 19
    new $P383, "Undef"
    .lex "$past", $P383
    get_hll_global $P384, ["PAST"], "Op"
    $P385 = $P384."new"("list" :named("pasttype"))
    store_lex "$past", $P385
.annotate "line", 20
    find_lex $P387, "$/"
    unless_null $P387, vivify_140
    new $P387, "Hash"
  vivify_140:
    set $P388, $P387["arg"]
    unless_null $P388, vivify_141
    new $P388, "Undef"
  vivify_141:
    defined $I389, $P388
    unless $I389, for_undef_142
    iter $P386, $P388
    new $P399, 'ExceptionHandler'
    set_addr $P399, loop398_handler
    $P399."handle_types"(65, 67, 66)
    push_eh $P399
  loop398_test:
    unless $P386, loop398_done
    shift $P390, $P386
  loop398_redo:
    .const 'Sub' $P392 = "31_1258924510.05036" 
    capture_lex $P392
    $P392($P390)
  loop398_next:
    goto loop398_test
  loop398_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P400, exception, 'type'
    eq $P400, 65, loop398_next
    eq $P400, 67, loop398_redo
  loop398_done:
    pop_eh 
  for_undef_142:
.annotate "line", 21
    find_lex $P401, "$/"
    find_lex $P402, "$past"
    $P403 = $P401."!make"($P402)
.annotate "line", 18
    .return ($P403)
  control_380:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P404, exception, "payload"
    .return ($P404)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block391"  :anon :subid("31_1258924510.05036") :outer("30_1258924510.05036")
    .param pmc param_393
.annotate "line", 20
    .lex "$_", param_393
    find_lex $P394, "$past"
    find_lex $P395, "$_"
    $P396 = $P395."ast"()
    $P397 = $P394."push"($P396)
    .return ($P397)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "TOP"  :subid("32_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_408
.annotate "line", 24
    new $P407, 'ExceptionHandler'
    set_addr $P407, control_406
    $P407."handle_types"(58)
    push_eh $P407
    .lex "self", self
    .lex "$/", param_408
.annotate "line", 25
    new $P409, "Undef"
    .lex "$past", $P409
    find_lex $P410, "$/"
    unless_null $P410, vivify_143
    new $P410, "Hash"
  vivify_143:
    set $P411, $P410["nibbler"]
    unless_null $P411, vivify_144
    new $P411, "Undef"
  vivify_144:
    $P412 = $P411."ast"()
    $P413 = "buildsub"($P412)
    store_lex "$past", $P413
.annotate "line", 26
    find_lex $P414, "$past"
    find_lex $P415, "$/"
    $P414."node"($P415)
.annotate "line", 27
    find_lex $P416, "$/"
    find_lex $P417, "$past"
    $P418 = $P416."!make"($P417)
.annotate "line", 24
    .return ($P418)
  control_406:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P419, exception, "payload"
    .return ($P419)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "nibbler"  :subid("33_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_423
    .param pmc param_424 :optional
    .param int has_param_424 :opt_flag
.annotate "line", 30
    .const 'Sub' $P460 = "35_1258924510.05036" 
    capture_lex $P460
    .const 'Sub' $P432 = "34_1258924510.05036" 
    capture_lex $P432
    new $P422, 'ExceptionHandler'
    set_addr $P422, control_421
    $P422."handle_types"(58)
    push_eh $P422
    .lex "self", self
    .lex "$/", param_423
    if has_param_424, optparam_145
    new $P425, "Undef"
    set param_424, $P425
  optparam_145:
    .lex "$key", param_424
.annotate "line", 42
    new $P426, "Undef"
    .lex "$past", $P426
.annotate "line", 31
    find_lex $P428, "$key"
    set $S429, $P428
    iseq $I430, $S429, "open"
    unless $I430, if_427_end
    .const 'Sub' $P432 = "34_1258924510.05036" 
    capture_lex $P432
    $P432()
  if_427_end:
.annotate "line", 41
    get_global $P442, "@MODIFIERS"
    $P442."shift"()
    find_lex $P443, "$past"
.annotate "line", 43
    find_lex $P445, "$/"
    unless_null $P445, vivify_148
    new $P445, "Hash"
  vivify_148:
    set $P446, $P445["termish"]
    unless_null $P446, vivify_149
    new $P446, "Undef"
  vivify_149:
    set $N447, $P446
    new $P448, "Integer"
    assign $P448, 1
    set $N449, $P448
    isgt $I450, $N447, $N449
    if $I450, if_444
.annotate "line", 50
    find_lex $P469, "$/"
    unless_null $P469, vivify_150
    new $P469, "Hash"
  vivify_150:
    set $P470, $P469["termish"]
    unless_null $P470, vivify_151
    new $P470, "ResizablePMCArray"
  vivify_151:
    set $P471, $P470[0]
    unless_null $P471, vivify_152
    new $P471, "Undef"
  vivify_152:
    $P472 = $P471."ast"()
    store_lex "$past", $P472
.annotate "line", 49
    goto if_444_end
  if_444:
.annotate "line", 44
    get_hll_global $P451, ["PAST"], "Regex"
    find_lex $P452, "$/"
    $P453 = $P451."new"("alt" :named("pasttype"), $P452 :named("node"))
    store_lex "$past", $P453
.annotate "line", 45
    find_lex $P455, "$/"
    unless_null $P455, vivify_153
    new $P455, "Hash"
  vivify_153:
    set $P456, $P455["termish"]
    unless_null $P456, vivify_154
    new $P456, "Undef"
  vivify_154:
    defined $I457, $P456
    unless $I457, for_undef_155
    iter $P454, $P456
    new $P467, 'ExceptionHandler'
    set_addr $P467, loop466_handler
    $P467."handle_types"(65, 67, 66)
    push_eh $P467
  loop466_test:
    unless $P454, loop466_done
    shift $P458, $P454
  loop466_redo:
    .const 'Sub' $P460 = "35_1258924510.05036" 
    capture_lex $P460
    $P460($P458)
  loop466_next:
    goto loop466_test
  loop466_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P468, exception, 'type'
    eq $P468, 65, loop466_next
    eq $P468, 67, loop466_redo
  loop466_done:
    pop_eh 
  for_undef_155:
  if_444_end:
.annotate "line", 52
    find_lex $P473, "$/"
    find_lex $P474, "$past"
    $P475 = $P473."!make"($P474)
.annotate "line", 30
    .return ($P475)
  control_421:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P476, exception, "payload"
    .return ($P476)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block431"  :anon :subid("34_1258924510.05036") :outer("33_1258924510.05036")
.annotate "line", 32
    new $P433, "Hash"
    .lex "%old", $P433
.annotate "line", 33
    new $P434, "Hash"
    .lex "%new", $P434
.annotate "line", 32
    get_global $P435, "@MODIFIERS"
    unless_null $P435, vivify_146
    new $P435, "ResizablePMCArray"
  vivify_146:
    set $P436, $P435[0]
    unless_null $P436, vivify_147
    new $P436, "Undef"
  vivify_147:
    store_lex "%old", $P436
.annotate "line", 33

                       $P0 = find_lex '%old'
                       $P437 = clone $P0
                   
    store_lex "%new", $P437
.annotate "line", 37
    get_global $P438, "@MODIFIERS"
    find_lex $P439, "%new"
    $P438."unshift"($P439)
.annotate "line", 38
    new $P440, "Exception"
    set $P440['type'], 58
    new $P441, "Integer"
    assign $P441, 1
    setattribute $P440, 'payload', $P441
    throw $P440
.annotate "line", 31
    .return ()
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block459"  :anon :subid("35_1258924510.05036") :outer("33_1258924510.05036")
    .param pmc param_461
.annotate "line", 45
    .lex "$_", param_461
.annotate "line", 46
    find_lex $P462, "$past"
    find_lex $P463, "$_"
    $P464 = $P463."ast"()
    $P465 = $P462."push"($P464)
.annotate "line", 45
    .return ($P465)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "termish"  :subid("36_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_480
.annotate "line", 55
    .const 'Sub' $P493 = "37_1258924510.05036" 
    capture_lex $P493
    new $P479, 'ExceptionHandler'
    set_addr $P479, control_478
    $P479."handle_types"(58)
    push_eh $P479
    .lex "self", self
    .lex "$/", param_480
.annotate "line", 56
    new $P481, "Undef"
    .lex "$past", $P481
.annotate "line", 57
    new $P482, "Undef"
    .lex "$lastlit", $P482
.annotate "line", 56
    get_hll_global $P483, ["PAST"], "Regex"
    find_lex $P484, "$/"
    $P485 = $P483."new"("concat" :named("pasttype"), $P484 :named("node"))
    store_lex "$past", $P485
.annotate "line", 57
    new $P486, "Integer"
    assign $P486, 0
    store_lex "$lastlit", $P486
.annotate "line", 58
    find_lex $P488, "$/"
    unless_null $P488, vivify_156
    new $P488, "Hash"
  vivify_156:
    set $P489, $P488["noun"]
    unless_null $P489, vivify_157
    new $P489, "Undef"
  vivify_157:
    defined $I490, $P489
    unless $I490, for_undef_158
    iter $P487, $P489
    new $P539, 'ExceptionHandler'
    set_addr $P539, loop538_handler
    $P539."handle_types"(65, 67, 66)
    push_eh $P539
  loop538_test:
    unless $P487, loop538_done
    shift $P491, $P487
  loop538_redo:
    .const 'Sub' $P493 = "37_1258924510.05036" 
    capture_lex $P493
    $P493($P491)
  loop538_next:
    goto loop538_test
  loop538_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P540, exception, 'type'
    eq $P540, 65, loop538_next
    eq $P540, 67, loop538_redo
  loop538_done:
    pop_eh 
  for_undef_158:
.annotate "line", 73
    find_lex $P541, "$/"
    find_lex $P542, "$past"
    $P543 = $P541."!make"($P542)
.annotate "line", 55
    .return ($P543)
  control_478:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P544, exception, "payload"
    .return ($P544)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block492"  :anon :subid("37_1258924510.05036") :outer("36_1258924510.05036")
    .param pmc param_495
.annotate "line", 59
    new $P494, "Undef"
    .lex "$ast", $P494
    .lex "$_", param_495
    find_lex $P496, "$_"
    $P497 = $P496."ast"()
    store_lex "$ast", $P497
.annotate "line", 60
    find_lex $P500, "$ast"
    if $P500, if_499
    set $P498, $P500
    goto if_499_end
  if_499:
.annotate "line", 61
    find_lex $P507, "$lastlit"
    if $P507, if_506
    set $P505, $P507
    goto if_506_end
  if_506:
    find_lex $P508, "$ast"
    $S509 = $P508."pasttype"()
    iseq $I510, $S509, "literal"
    new $P505, 'Integer'
    set $P505, $I510
  if_506_end:
    if $P505, if_504
    set $P503, $P505
    goto if_504_end
  if_504:
.annotate "line", 62
    get_hll_global $P511, ["PAST"], "Node"
    find_lex $P512, "$ast"
    unless_null $P512, vivify_159
    new $P512, "ResizablePMCArray"
  vivify_159:
    set $P513, $P512[0]
    unless_null $P513, vivify_160
    new $P513, "Undef"
  vivify_160:
    $P514 = $P511."ACCEPTS"($P513)
    isfalse $I515, $P514
    new $P503, 'Integer'
    set $P503, $I515
  if_504_end:
    if $P503, if_502
.annotate "line", 66
    find_lex $P522, "$past"
    find_lex $P523, "$ast"
    $P522."push"($P523)
.annotate "line", 67
    find_lex $P528, "$ast"
    $S529 = $P528."pasttype"()
    iseq $I530, $S529, "literal"
    if $I530, if_527
    new $P526, 'Integer'
    set $P526, $I530
    goto if_527_end
  if_527:
.annotate "line", 68
    get_hll_global $P531, ["PAST"], "Node"
    find_lex $P532, "$ast"
    unless_null $P532, vivify_161
    new $P532, "ResizablePMCArray"
  vivify_161:
    set $P533, $P532[0]
    unless_null $P533, vivify_162
    new $P533, "Undef"
  vivify_162:
    $P534 = $P531."ACCEPTS"($P533)
    isfalse $I535, $P534
    new $P526, 'Integer'
    set $P526, $I535
  if_527_end:
    if $P526, if_525
    new $P537, "Integer"
    assign $P537, 0
    set $P524, $P537
    goto if_525_end
  if_525:
    find_lex $P536, "$ast"
    set $P524, $P536
  if_525_end:
.annotate "line", 69
    store_lex "$lastlit", $P524
.annotate "line", 65
    set $P501, $P524
.annotate "line", 62
    goto if_502_end
  if_502:
.annotate "line", 63
    find_lex $P516, "$lastlit"
    unless_null $P516, vivify_163
    new $P516, "ResizablePMCArray"
  vivify_163:
    set $P517, $P516[0]
    unless_null $P517, vivify_164
    new $P517, "Undef"
  vivify_164:
    find_lex $P518, "$ast"
    unless_null $P518, vivify_165
    new $P518, "ResizablePMCArray"
  vivify_165:
    set $P519, $P518[0]
    unless_null $P519, vivify_166
    new $P519, "Undef"
  vivify_166:
    concat $P520, $P517, $P519
    find_lex $P521, "$lastlit"
    unless_null $P521, vivify_167
    new $P521, "ResizablePMCArray"
    store_lex "$lastlit", $P521
  vivify_167:
    set $P521[0], $P520
.annotate "line", 62
    set $P501, $P520
  if_502_end:
.annotate "line", 60
    set $P498, $P501
  if_499_end:
.annotate "line", 58
    .return ($P498)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantified_atom"  :subid("38_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_548
.annotate "line", 76
    .const 'Sub' $P557 = "39_1258924510.05036" 
    capture_lex $P557
    new $P547, 'ExceptionHandler'
    set_addr $P547, control_546
    $P547."handle_types"(58)
    push_eh $P547
    .lex "self", self
    .lex "$/", param_548
.annotate "line", 77
    new $P549, "Undef"
    .lex "$past", $P549
    find_lex $P550, "$/"
    unless_null $P550, vivify_168
    new $P550, "Hash"
  vivify_168:
    set $P551, $P550["atom"]
    unless_null $P551, vivify_169
    new $P551, "Undef"
  vivify_169:
    $P552 = $P551."ast"()
    store_lex "$past", $P552
.annotate "line", 78
    find_lex $P554, "$/"
    unless_null $P554, vivify_170
    new $P554, "Hash"
  vivify_170:
    set $P555, $P554["quantifier"]
    unless_null $P555, vivify_171
    new $P555, "Undef"
  vivify_171:
    if $P555, if_553
.annotate "line", 84
    find_lex $P571, "$/"
    unless_null $P571, vivify_172
    new $P571, "Hash"
  vivify_172:
    set $P572, $P571["backmod"]
    unless_null $P572, vivify_173
    new $P572, "ResizablePMCArray"
  vivify_173:
    set $P573, $P572[0]
    unless_null $P573, vivify_174
    new $P573, "Undef"
  vivify_174:
    unless $P573, if_570_end
    find_lex $P574, "$past"
    find_lex $P575, "$/"
    unless_null $P575, vivify_175
    new $P575, "Hash"
  vivify_175:
    set $P576, $P575["backmod"]
    unless_null $P576, vivify_176
    new $P576, "ResizablePMCArray"
  vivify_176:
    set $P577, $P576[0]
    unless_null $P577, vivify_177
    new $P577, "Undef"
  vivify_177:
    "backmod"($P574, $P577)
  if_570_end:
    goto if_553_end
  if_553:
.annotate "line", 78
    .const 'Sub' $P557 = "39_1258924510.05036" 
    capture_lex $P557
    $P557()
  if_553_end:
.annotate "line", 85
    find_lex $P583, "$past"
    if $P583, if_582
    set $P581, $P583
    goto if_582_end
  if_582:
    find_lex $P584, "$past"
    $P585 = $P584."backtrack"()
    isfalse $I586, $P585
    new $P581, 'Integer'
    set $P581, $I586
  if_582_end:
    if $P581, if_580
    set $P579, $P581
    goto if_580_end
  if_580:
    get_global $P587, "@MODIFIERS"
    unless_null $P587, vivify_181
    new $P587, "ResizablePMCArray"
  vivify_181:
    set $P588, $P587[0]
    unless_null $P588, vivify_182
    new $P588, "Hash"
  vivify_182:
    set $P589, $P588["r"]
    unless_null $P589, vivify_183
    new $P589, "Undef"
  vivify_183:
    set $P579, $P589
  if_580_end:
    unless $P579, if_578_end
.annotate "line", 86
    find_lex $P590, "$past"
    $P590."backtrack"("r")
  if_578_end:
.annotate "line", 88
    find_lex $P591, "$/"
    find_lex $P592, "$past"
    $P593 = $P591."!make"($P592)
.annotate "line", 76
    .return ($P593)
  control_546:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P594, exception, "payload"
    .return ($P594)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block556"  :anon :subid("39_1258924510.05036") :outer("38_1258924510.05036")
.annotate "line", 80
    new $P558, "Undef"
    .lex "$qast", $P558
.annotate "line", 79
    find_lex $P560, "$past"
    isfalse $I561, $P560
    unless $I561, if_559_end
    find_lex $P562, "$/"
    $P562."panic"("Can't quantify zero-width atom")
  if_559_end:
.annotate "line", 80
    find_lex $P563, "$/"
    unless_null $P563, vivify_178
    new $P563, "Hash"
  vivify_178:
    set $P564, $P563["quantifier"]
    unless_null $P564, vivify_179
    new $P564, "ResizablePMCArray"
  vivify_179:
    set $P565, $P564[0]
    unless_null $P565, vivify_180
    new $P565, "Undef"
  vivify_180:
    $P566 = $P565."ast"()
    store_lex "$qast", $P566
.annotate "line", 81
    find_lex $P567, "$qast"
    find_lex $P568, "$past"
    $P567."unshift"($P568)
.annotate "line", 82
    find_lex $P569, "$qast"
    store_lex "$past", $P569
.annotate "line", 78
    .return ($P569)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "atom"  :subid("40_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_598
.annotate "line", 91
    new $P597, 'ExceptionHandler'
    set_addr $P597, control_596
    $P597."handle_types"(58)
    push_eh $P597
    .lex "self", self
    .lex "$/", param_598
.annotate "line", 92
    new $P599, "Undef"
    .lex "$past", $P599
.annotate "line", 91
    find_lex $P600, "$past"
.annotate "line", 93
    find_lex $P602, "$/"
    unless_null $P602, vivify_184
    new $P602, "Hash"
  vivify_184:
    set $P603, $P602["metachar"]
    unless_null $P603, vivify_185
    new $P603, "Undef"
  vivify_185:
    if $P603, if_601
.annotate "line", 95
    get_hll_global $P607, ["PAST"], "Regex"
    find_lex $P608, "$/"
    set $S609, $P608
    find_lex $P610, "$/"
    $P611 = $P607."new"($S609, "literal" :named("pasttype"), $P610 :named("node"))
    store_lex "$past", $P611
.annotate "line", 96
    get_global $P613, "@MODIFIERS"
    unless_null $P613, vivify_186
    new $P613, "ResizablePMCArray"
  vivify_186:
    set $P614, $P613[0]
    unless_null $P614, vivify_187
    new $P614, "Hash"
  vivify_187:
    set $P615, $P614["i"]
    unless_null $P615, vivify_188
    new $P615, "Undef"
  vivify_188:
    unless $P615, if_612_end
    find_lex $P616, "$past"
    $P616."subtype"("ignorecase")
  if_612_end:
.annotate "line", 94
    goto if_601_end
  if_601:
.annotate "line", 93
    find_lex $P604, "$/"
    unless_null $P604, vivify_189
    new $P604, "Hash"
  vivify_189:
    set $P605, $P604["metachar"]
    unless_null $P605, vivify_190
    new $P605, "Undef"
  vivify_190:
    $P606 = $P605."ast"()
    store_lex "$past", $P606
  if_601_end:
.annotate "line", 98
    find_lex $P617, "$/"
    find_lex $P618, "$past"
    $P619 = $P617."!make"($P618)
.annotate "line", 91
    .return ($P619)
  control_596:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P620, exception, "payload"
    .return ($P620)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<*>"  :subid("41_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_624
.annotate "line", 101
    new $P623, 'ExceptionHandler'
    set_addr $P623, control_622
    $P623."handle_types"(58)
    push_eh $P623
    .lex "self", self
    .lex "$/", param_624
.annotate "line", 102
    new $P625, "Undef"
    .lex "$past", $P625
    get_hll_global $P626, ["PAST"], "Regex"
    find_lex $P627, "$/"
    $P628 = $P626."new"("quant" :named("pasttype"), $P627 :named("node"))
    store_lex "$past", $P628
.annotate "line", 103
    find_lex $P629, "$/"
    find_lex $P630, "$past"
    find_lex $P631, "$/"
    unless_null $P631, vivify_191
    new $P631, "Hash"
  vivify_191:
    set $P632, $P631["backmod"]
    unless_null $P632, vivify_192
    new $P632, "Undef"
  vivify_192:
    $P633 = "backmod"($P630, $P632)
    $P634 = $P629."!make"($P633)
.annotate "line", 101
    .return ($P634)
  control_622:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P635, exception, "payload"
    .return ($P635)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<+>"  :subid("42_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_639
.annotate "line", 106
    new $P638, 'ExceptionHandler'
    set_addr $P638, control_637
    $P638."handle_types"(58)
    push_eh $P638
    .lex "self", self
    .lex "$/", param_639
.annotate "line", 107
    new $P640, "Undef"
    .lex "$past", $P640
    get_hll_global $P641, ["PAST"], "Regex"
    find_lex $P642, "$/"
    $P643 = $P641."new"("quant" :named("pasttype"), 1 :named("min"), $P642 :named("node"))
    store_lex "$past", $P643
.annotate "line", 108
    find_lex $P644, "$/"
    find_lex $P645, "$past"
    find_lex $P646, "$/"
    unless_null $P646, vivify_193
    new $P646, "Hash"
  vivify_193:
    set $P647, $P646["backmod"]
    unless_null $P647, vivify_194
    new $P647, "Undef"
  vivify_194:
    $P648 = "backmod"($P645, $P647)
    $P649 = $P644."!make"($P648)
.annotate "line", 106
    .return ($P649)
  control_637:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P650, exception, "payload"
    .return ($P650)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<?>"  :subid("43_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_654
.annotate "line", 111
    new $P653, 'ExceptionHandler'
    set_addr $P653, control_652
    $P653."handle_types"(58)
    push_eh $P653
    .lex "self", self
    .lex "$/", param_654
.annotate "line", 112
    new $P655, "Undef"
    .lex "$past", $P655
    get_hll_global $P656, ["PAST"], "Regex"
    find_lex $P657, "$/"
    $P658 = $P656."new"("quant" :named("pasttype"), 0 :named("min"), 1 :named("max"), $P657 :named("node"))
    store_lex "$past", $P658
.annotate "line", 113
    find_lex $P659, "$/"
    find_lex $P660, "$past"
    find_lex $P661, "$/"
    unless_null $P661, vivify_195
    new $P661, "Hash"
  vivify_195:
    set $P662, $P661["backmod"]
    unless_null $P662, vivify_196
    new $P662, "Undef"
  vivify_196:
    $P663 = "backmod"($P660, $P662)
    $P659."!make"($P663)
.annotate "line", 114
    find_lex $P664, "$/"
    find_lex $P665, "$past"
    $P666 = $P664."!make"($P665)
.annotate "line", 111
    .return ($P666)
  control_652:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P667, exception, "payload"
    .return ($P667)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<**>"  :subid("44_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_671
.annotate "line", 117
    new $P670, 'ExceptionHandler'
    set_addr $P670, control_669
    $P670."handle_types"(58)
    push_eh $P670
    .lex "self", self
    .lex "$/", param_671
.annotate "line", 118
    new $P672, "Undef"
    .lex "$past", $P672
.annotate "line", 117
    find_lex $P673, "$past"
.annotate "line", 119
    find_lex $P675, "$/"
    unless_null $P675, vivify_197
    new $P675, "Hash"
  vivify_197:
    set $P676, $P675["quantified_atom"]
    unless_null $P676, vivify_198
    new $P676, "Undef"
  vivify_198:
    if $P676, if_674
.annotate "line", 124
    get_hll_global $P683, ["PAST"], "Regex"
    find_lex $P684, "$/"
    unless_null $P684, vivify_199
    new $P684, "Hash"
  vivify_199:
    set $P685, $P684["min"]
    unless_null $P685, vivify_200
    new $P685, "Undef"
  vivify_200:
    set $N686, $P685
    find_lex $P687, "$/"
    $P688 = $P683."new"("quant" :named("pasttype"), $N686 :named("min"), $P687 :named("node"))
    store_lex "$past", $P688
.annotate "line", 125
    find_lex $P690, "$/"
    unless_null $P690, vivify_201
    new $P690, "Hash"
  vivify_201:
    set $P691, $P690["max"]
    unless_null $P691, vivify_202
    new $P691, "Undef"
  vivify_202:
    isfalse $I692, $P691
    if $I692, if_689
.annotate "line", 126
    find_lex $P698, "$/"
    unless_null $P698, vivify_203
    new $P698, "Hash"
  vivify_203:
    set $P699, $P698["max"]
    unless_null $P699, vivify_204
    new $P699, "ResizablePMCArray"
  vivify_204:
    set $P700, $P699[0]
    unless_null $P700, vivify_205
    new $P700, "Undef"
  vivify_205:
    set $S701, $P700
    isne $I702, $S701, "*"
    unless $I702, if_697_end
    find_lex $P703, "$past"
    find_lex $P704, "$/"
    unless_null $P704, vivify_206
    new $P704, "Hash"
  vivify_206:
    set $P705, $P704["max"]
    unless_null $P705, vivify_207
    new $P705, "ResizablePMCArray"
  vivify_207:
    set $P706, $P705[0]
    unless_null $P706, vivify_208
    new $P706, "Undef"
  vivify_208:
    set $N707, $P706
    $P703."max"($N707)
  if_697_end:
    goto if_689_end
  if_689:
.annotate "line", 125
    find_lex $P693, "$past"
    find_lex $P694, "$/"
    unless_null $P694, vivify_209
    new $P694, "Hash"
  vivify_209:
    set $P695, $P694["min"]
    unless_null $P695, vivify_210
    new $P695, "Undef"
  vivify_210:
    set $N696, $P695
    $P693."max"($N696)
  if_689_end:
.annotate "line", 123
    goto if_674_end
  if_674:
.annotate "line", 120
    get_hll_global $P677, ["PAST"], "Regex"
.annotate "line", 121
    find_lex $P678, "$/"
    unless_null $P678, vivify_211
    new $P678, "Hash"
  vivify_211:
    set $P679, $P678["quantified_atom"]
    unless_null $P679, vivify_212
    new $P679, "Undef"
  vivify_212:
    $P680 = $P679."ast"()
    find_lex $P681, "$/"
    $P682 = $P677."new"("quant" :named("pasttype"), 1 :named("min"), $P680 :named("sep"), $P681 :named("node"))
.annotate "line", 120
    store_lex "$past", $P682
  if_674_end:
.annotate "line", 128
    find_lex $P708, "$/"
    find_lex $P709, "$past"
    find_lex $P710, "$/"
    unless_null $P710, vivify_213
    new $P710, "Hash"
  vivify_213:
    set $P711, $P710["backmod"]
    unless_null $P711, vivify_214
    new $P711, "Undef"
  vivify_214:
    $P712 = "backmod"($P709, $P711)
    $P713 = $P708."!make"($P712)
.annotate "line", 117
    .return ($P713)
  control_669:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P714, exception, "payload"
    .return ($P714)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<ws>"  :subid("45_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_718
.annotate "line", 131
    new $P717, 'ExceptionHandler'
    set_addr $P717, control_716
    $P717."handle_types"(58)
    push_eh $P717
    .lex "self", self
    .lex "$/", param_718
.annotate "line", 132
    new $P719, "Undef"
    .lex "$past", $P719
.annotate "line", 133
    get_global $P722, "@MODIFIERS"
    unless_null $P722, vivify_215
    new $P722, "ResizablePMCArray"
  vivify_215:
    set $P723, $P722[0]
    unless_null $P723, vivify_216
    new $P723, "Hash"
  vivify_216:
    set $P724, $P723["s"]
    unless_null $P724, vivify_217
    new $P724, "Undef"
  vivify_217:
    if $P724, if_721
    new $P728, "Integer"
    assign $P728, 0
    set $P720, $P728
    goto if_721_end
  if_721:
    get_hll_global $P725, ["PAST"], "Regex"
    find_lex $P726, "$/"
    $P727 = $P725."new"("ws", "subrule" :named("pasttype"), "method" :named("subtype"), $P726 :named("node"))
    set $P720, $P727
  if_721_end:
    store_lex "$past", $P720
.annotate "line", 136
    find_lex $P729, "$/"
    find_lex $P730, "$past"
    $P731 = $P729."!make"($P730)
.annotate "line", 131
    .return ($P731)
  control_716:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P732, exception, "payload"
    .return ($P732)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<[ ]>"  :subid("46_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_736
.annotate "line", 140
    new $P735, 'ExceptionHandler'
    set_addr $P735, control_734
    $P735."handle_types"(58)
    push_eh $P735
    .lex "self", self
    .lex "$/", param_736
.annotate "line", 141
    find_lex $P737, "$/"
    find_lex $P738, "$/"
    unless_null $P738, vivify_218
    new $P738, "Hash"
  vivify_218:
    set $P739, $P738["nibbler"]
    unless_null $P739, vivify_219
    new $P739, "Undef"
  vivify_219:
    $P740 = $P739."ast"()
    $P741 = $P737."!make"($P740)
.annotate "line", 140
    .return ($P741)
  control_734:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P742, exception, "payload"
    .return ($P742)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<( )>"  :subid("47_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_746
.annotate "line", 144
    new $P745, 'ExceptionHandler'
    set_addr $P745, control_744
    $P745."handle_types"(58)
    push_eh $P745
    .lex "self", self
    .lex "$/", param_746
.annotate "line", 145
    new $P747, "Undef"
    .lex "$subpast", $P747
.annotate "line", 146
    new $P748, "Undef"
    .lex "$past", $P748
.annotate "line", 145
    find_lex $P749, "$/"
    unless_null $P749, vivify_220
    new $P749, "Hash"
  vivify_220:
    set $P750, $P749["nibbler"]
    unless_null $P750, vivify_221
    new $P750, "Undef"
  vivify_221:
    $P751 = $P750."ast"()
    $P752 = "buildsub"($P751)
    store_lex "$subpast", $P752
.annotate "line", 146
    get_hll_global $P753, ["PAST"], "Regex"
    find_lex $P754, "$subpast"
    find_lex $P755, "$/"
    $P756 = $P753."new"($P754, "subrule" :named("pasttype"), "capture" :named("subtype"), $P755 :named("node"))
    store_lex "$past", $P756
.annotate "line", 148
    find_lex $P757, "$/"
    find_lex $P758, "$past"
    $P759 = $P757."!make"($P758)
.annotate "line", 144
    .return ($P759)
  control_744:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P760, exception, "payload"
    .return ($P760)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<'>"  :subid("48_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_764
.annotate "line", 151
    new $P763, 'ExceptionHandler'
    set_addr $P763, control_762
    $P763."handle_types"(58)
    push_eh $P763
    .lex "self", self
    .lex "$/", param_764
.annotate "line", 152
    new $P765, "Undef"
    .lex "$quote", $P765
.annotate "line", 154
    new $P766, "Undef"
    .lex "$past", $P766
.annotate "line", 152
    find_lex $P767, "$/"
    unless_null $P767, vivify_222
    new $P767, "Hash"
  vivify_222:
    set $P768, $P767["quote_EXPR"]
    unless_null $P768, vivify_223
    new $P768, "Undef"
  vivify_223:
    $P769 = $P768."ast"()
    store_lex "$quote", $P769
.annotate "line", 153
    get_hll_global $P771, ["PAST"], "Val"
    find_lex $P772, "$quote"
    $P773 = $P771."ACCEPTS"($P772)
    unless $P773, if_770_end
    find_lex $P774, "$quote"
    $P775 = $P774."value"()
    store_lex "$quote", $P775
  if_770_end:
.annotate "line", 154
    get_hll_global $P776, ["PAST"], "Regex"
    find_lex $P777, "$quote"
    find_lex $P778, "$/"
    $P779 = $P776."new"($P777, "literal" :named("pasttype"), $P778 :named("node"))
    store_lex "$past", $P779
.annotate "line", 155
    find_lex $P780, "$/"
    find_lex $P781, "$past"
    $P782 = $P780."!make"($P781)
.annotate "line", 151
    .return ($P782)
  control_762:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P783, exception, "payload"
    .return ($P783)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<\">"  :subid("49_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_787
.annotate "line", 158
    new $P786, 'ExceptionHandler'
    set_addr $P786, control_785
    $P786."handle_types"(58)
    push_eh $P786
    .lex "self", self
    .lex "$/", param_787
.annotate "line", 159
    new $P788, "Undef"
    .lex "$quote", $P788
.annotate "line", 161
    new $P789, "Undef"
    .lex "$past", $P789
.annotate "line", 159
    find_lex $P790, "$/"
    unless_null $P790, vivify_224
    new $P790, "Hash"
  vivify_224:
    set $P791, $P790["quote_EXPR"]
    unless_null $P791, vivify_225
    new $P791, "Undef"
  vivify_225:
    $P792 = $P791."ast"()
    store_lex "$quote", $P792
.annotate "line", 160
    get_hll_global $P794, ["PAST"], "Val"
    find_lex $P795, "$quote"
    $P796 = $P794."ACCEPTS"($P795)
    unless $P796, if_793_end
    find_lex $P797, "$quote"
    $P798 = $P797."value"()
    store_lex "$quote", $P798
  if_793_end:
.annotate "line", 161
    get_hll_global $P799, ["PAST"], "Regex"
    find_lex $P800, "$quote"
    find_lex $P801, "$/"
    $P802 = $P799."new"($P800, "literal" :named("pasttype"), $P801 :named("node"))
    store_lex "$past", $P802
.annotate "line", 162
    find_lex $P803, "$/"
    find_lex $P804, "$past"
    $P805 = $P803."!make"($P804)
.annotate "line", 158
    .return ($P805)
  control_785:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P806, exception, "payload"
    .return ($P806)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<.>"  :subid("50_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_810
.annotate "line", 165
    new $P809, 'ExceptionHandler'
    set_addr $P809, control_808
    $P809."handle_types"(58)
    push_eh $P809
    .lex "self", self
    .lex "$/", param_810
.annotate "line", 166
    new $P811, "Undef"
    .lex "$past", $P811
    get_hll_global $P812, ["PAST"], "Regex"
    find_lex $P813, "$/"
    $P814 = $P812."new"("charclass" :named("pasttype"), "." :named("subtype"), $P813 :named("node"))
    store_lex "$past", $P814
.annotate "line", 167
    find_lex $P815, "$/"
    find_lex $P816, "$past"
    $P817 = $P815."!make"($P816)
.annotate "line", 165
    .return ($P817)
  control_808:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P818, exception, "payload"
    .return ($P818)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<^>"  :subid("51_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_822
.annotate "line", 170
    new $P821, 'ExceptionHandler'
    set_addr $P821, control_820
    $P821."handle_types"(58)
    push_eh $P821
    .lex "self", self
    .lex "$/", param_822
.annotate "line", 171
    new $P823, "Undef"
    .lex "$past", $P823
    get_hll_global $P824, ["PAST"], "Regex"
    find_lex $P825, "$/"
    $P826 = $P824."new"("anchor" :named("pasttype"), "bos" :named("subtype"), $P825 :named("node"))
    store_lex "$past", $P826
.annotate "line", 172
    find_lex $P827, "$/"
    find_lex $P828, "$past"
    $P829 = $P827."!make"($P828)
.annotate "line", 170
    .return ($P829)
  control_820:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P830, exception, "payload"
    .return ($P830)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<^^>"  :subid("52_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_834
.annotate "line", 175
    new $P833, 'ExceptionHandler'
    set_addr $P833, control_832
    $P833."handle_types"(58)
    push_eh $P833
    .lex "self", self
    .lex "$/", param_834
.annotate "line", 176
    new $P835, "Undef"
    .lex "$past", $P835
    get_hll_global $P836, ["PAST"], "Regex"
    find_lex $P837, "$/"
    $P838 = $P836."new"("anchor" :named("pasttype"), "bol" :named("subtype"), $P837 :named("node"))
    store_lex "$past", $P838
.annotate "line", 177
    find_lex $P839, "$/"
    find_lex $P840, "$past"
    $P841 = $P839."!make"($P840)
.annotate "line", 175
    .return ($P841)
  control_832:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P842, exception, "payload"
    .return ($P842)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<$>"  :subid("53_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_846
.annotate "line", 180
    new $P845, 'ExceptionHandler'
    set_addr $P845, control_844
    $P845."handle_types"(58)
    push_eh $P845
    .lex "self", self
    .lex "$/", param_846
.annotate "line", 181
    new $P847, "Undef"
    .lex "$past", $P847
    get_hll_global $P848, ["PAST"], "Regex"
    find_lex $P849, "$/"
    $P850 = $P848."new"("anchor" :named("pasttype"), "eos" :named("subtype"), $P849 :named("node"))
    store_lex "$past", $P850
.annotate "line", 182
    find_lex $P851, "$/"
    find_lex $P852, "$past"
    $P853 = $P851."!make"($P852)
.annotate "line", 180
    .return ($P853)
  control_844:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P854, exception, "payload"
    .return ($P854)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<$$>"  :subid("54_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_858
.annotate "line", 185
    new $P857, 'ExceptionHandler'
    set_addr $P857, control_856
    $P857."handle_types"(58)
    push_eh $P857
    .lex "self", self
    .lex "$/", param_858
.annotate "line", 186
    new $P859, "Undef"
    .lex "$past", $P859
    get_hll_global $P860, ["PAST"], "Regex"
    find_lex $P861, "$/"
    $P862 = $P860."new"("anchor" :named("pasttype"), "eol" :named("subtype"), $P861 :named("node"))
    store_lex "$past", $P862
.annotate "line", 187
    find_lex $P863, "$/"
    find_lex $P864, "$past"
    $P865 = $P863."!make"($P864)
.annotate "line", 185
    .return ($P865)
  control_856:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P866, exception, "payload"
    .return ($P866)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<:::>"  :subid("55_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_870
.annotate "line", 190
    new $P869, 'ExceptionHandler'
    set_addr $P869, control_868
    $P869."handle_types"(58)
    push_eh $P869
    .lex "self", self
    .lex "$/", param_870
.annotate "line", 191
    new $P871, "Undef"
    .lex "$past", $P871
    get_hll_global $P872, ["PAST"], "Regex"
    find_lex $P873, "$/"
    $P874 = $P872."new"("cut" :named("pasttype"), $P873 :named("node"))
    store_lex "$past", $P874
.annotate "line", 192
    find_lex $P875, "$/"
    find_lex $P876, "$past"
    $P877 = $P875."!make"($P876)
.annotate "line", 190
    .return ($P877)
  control_868:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P878, exception, "payload"
    .return ($P878)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<lwb>"  :subid("56_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_882
.annotate "line", 195
    new $P881, 'ExceptionHandler'
    set_addr $P881, control_880
    $P881."handle_types"(58)
    push_eh $P881
    .lex "self", self
    .lex "$/", param_882
.annotate "line", 196
    new $P883, "Undef"
    .lex "$past", $P883
    get_hll_global $P884, ["PAST"], "Regex"
    find_lex $P885, "$/"
    $P886 = $P884."new"("anchor" :named("pasttype"), "lwb" :named("subtype"), $P885 :named("node"))
    store_lex "$past", $P886
.annotate "line", 197
    find_lex $P887, "$/"
    find_lex $P888, "$past"
    $P889 = $P887."!make"($P888)
.annotate "line", 195
    .return ($P889)
  control_880:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P890, exception, "payload"
    .return ($P890)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<rwb>"  :subid("57_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_894
.annotate "line", 200
    new $P893, 'ExceptionHandler'
    set_addr $P893, control_892
    $P893."handle_types"(58)
    push_eh $P893
    .lex "self", self
    .lex "$/", param_894
.annotate "line", 201
    new $P895, "Undef"
    .lex "$past", $P895
    get_hll_global $P896, ["PAST"], "Regex"
    find_lex $P897, "$/"
    $P898 = $P896."new"("anchor" :named("pasttype"), "rwb" :named("subtype"), $P897 :named("node"))
    store_lex "$past", $P898
.annotate "line", 202
    find_lex $P899, "$/"
    find_lex $P900, "$past"
    $P901 = $P899."!make"($P900)
.annotate "line", 200
    .return ($P901)
  control_892:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P902, exception, "payload"
    .return ($P902)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<bs>"  :subid("58_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_906
.annotate "line", 205
    new $P905, 'ExceptionHandler'
    set_addr $P905, control_904
    $P905."handle_types"(58)
    push_eh $P905
    .lex "self", self
    .lex "$/", param_906
.annotate "line", 206
    find_lex $P907, "$/"
    find_lex $P908, "$/"
    unless_null $P908, vivify_226
    new $P908, "Hash"
  vivify_226:
    set $P909, $P908["backslash"]
    unless_null $P909, vivify_227
    new $P909, "Undef"
  vivify_227:
    $P910 = $P909."ast"()
    $P911 = $P907."!make"($P910)
.annotate "line", 205
    .return ($P911)
  control_904:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P912, exception, "payload"
    .return ($P912)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<mod>"  :subid("59_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_916
.annotate "line", 209
    new $P915, 'ExceptionHandler'
    set_addr $P915, control_914
    $P915."handle_types"(58)
    push_eh $P915
    .lex "self", self
    .lex "$/", param_916
.annotate "line", 210
    find_lex $P917, "$/"
    find_lex $P918, "$/"
    unless_null $P918, vivify_228
    new $P918, "Hash"
  vivify_228:
    set $P919, $P918["mod_internal"]
    unless_null $P919, vivify_229
    new $P919, "Undef"
  vivify_229:
    $P920 = $P919."ast"()
    $P921 = $P917."!make"($P920)
.annotate "line", 209
    .return ($P921)
  control_914:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P922, exception, "payload"
    .return ($P922)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<assert>"  :subid("60_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_926
.annotate "line", 213
    new $P925, 'ExceptionHandler'
    set_addr $P925, control_924
    $P925."handle_types"(58)
    push_eh $P925
    .lex "self", self
    .lex "$/", param_926
.annotate "line", 214
    find_lex $P927, "$/"
    find_lex $P928, "$/"
    unless_null $P928, vivify_230
    new $P928, "Hash"
  vivify_230:
    set $P929, $P928["assertion"]
    unless_null $P929, vivify_231
    new $P929, "Undef"
  vivify_231:
    $P930 = $P929."ast"()
    $P931 = $P927."!make"($P930)
.annotate "line", 213
    .return ($P931)
  control_924:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P932, exception, "payload"
    .return ($P932)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<~>"  :subid("61_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_936
.annotate "line", 217
    new $P935, 'ExceptionHandler'
    set_addr $P935, control_934
    $P935."handle_types"(58)
    push_eh $P935
    .lex "self", self
    .lex "$/", param_936
.annotate "line", 218
    find_lex $P937, "$/"
    get_hll_global $P938, ["PAST"], "Regex"
.annotate "line", 219
    find_lex $P939, "$/"
    unless_null $P939, vivify_232
    new $P939, "Hash"
  vivify_232:
    set $P940, $P939["EXPR"]
    unless_null $P940, vivify_233
    new $P940, "Undef"
  vivify_233:
    $P941 = $P940."ast"()
.annotate "line", 220
    get_hll_global $P942, ["PAST"], "Regex"
.annotate "line", 221
    find_lex $P943, "$/"
    unless_null $P943, vivify_234
    new $P943, "Hash"
  vivify_234:
    set $P944, $P943["GOAL"]
    unless_null $P944, vivify_235
    new $P944, "Undef"
  vivify_235:
    $P945 = $P944."ast"()
.annotate "line", 222
    get_hll_global $P946, ["PAST"], "Regex"
    find_lex $P947, "$/"
    unless_null $P947, vivify_236
    new $P947, "Hash"
  vivify_236:
    set $P948, $P947["GOAL"]
    unless_null $P948, vivify_237
    new $P948, "Undef"
  vivify_237:
    set $S949, $P948
    $P950 = $P946."new"("FAILGOAL", $S949, "subrule" :named("pasttype"), "method" :named("subtype"))
    $P951 = $P942."new"($P945, $P950, "alt" :named("pasttype"))
.annotate "line", 220
    $P952 = $P938."new"($P941, $P951, "concat" :named("pasttype"))
.annotate "line", 218
    $P953 = $P937."!make"($P952)
.annotate "line", 217
    .return ($P953)
  control_934:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P954, exception, "payload"
    .return ($P954)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<{*}>"  :subid("62_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_958
.annotate "line", 230
    new $P957, 'ExceptionHandler'
    set_addr $P957, control_956
    $P957."handle_types"(58)
    push_eh $P957
    .lex "self", self
    .lex "$/", param_958
.annotate "line", 231
    new $P959, "Undef"
    .lex "$past", $P959
.annotate "line", 232
    find_lex $P962, "$/"
    unless_null $P962, vivify_238
    new $P962, "Hash"
  vivify_238:
    set $P963, $P962["key"]
    unless_null $P963, vivify_239
    new $P963, "Undef"
  vivify_239:
    if $P963, if_961
    new $P971, "Integer"
    assign $P971, 0
    set $P960, $P971
    goto if_961_end
  if_961:
    get_hll_global $P964, ["PAST"], "Regex"
    find_lex $P965, "$/"
    unless_null $P965, vivify_240
    new $P965, "Hash"
  vivify_240:
    set $P966, $P965["key"]
    unless_null $P966, vivify_241
    new $P966, "ResizablePMCArray"
  vivify_241:
    set $P967, $P966[0]
    unless_null $P967, vivify_242
    new $P967, "Undef"
  vivify_242:
    set $S968, $P967
    find_lex $P969, "$/"
    $P970 = $P964."new"($S968, "reduce" :named("pasttype"), $P969 :named("node"))
    set $P960, $P970
  if_961_end:
    store_lex "$past", $P960
.annotate "line", 234
    find_lex $P972, "$/"
    find_lex $P973, "$past"
    $P974 = $P972."!make"($P973)
.annotate "line", 230
    .return ($P974)
  control_956:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P975, exception, "payload"
    .return ($P975)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<var>"  :subid("63_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_979
.annotate "line", 237
    new $P978, 'ExceptionHandler'
    set_addr $P978, control_977
    $P978."handle_types"(58)
    push_eh $P978
    .lex "self", self
    .lex "$/", param_979
.annotate "line", 238
    new $P980, "Undef"
    .lex "$past", $P980
.annotate "line", 239
    new $P981, "Undef"
    .lex "$name", $P981
.annotate "line", 237
    find_lex $P982, "$past"
.annotate "line", 239
    find_lex $P985, "$/"
    unless_null $P985, vivify_243
    new $P985, "Hash"
  vivify_243:
    set $P986, $P985["pos"]
    unless_null $P986, vivify_244
    new $P986, "Undef"
  vivify_244:
    if $P986, if_984
    find_lex $P990, "$/"
    unless_null $P990, vivify_245
    new $P990, "Hash"
  vivify_245:
    set $P991, $P990["name"]
    unless_null $P991, vivify_246
    new $P991, "Undef"
  vivify_246:
    set $S992, $P991
    new $P983, 'String'
    set $P983, $S992
    goto if_984_end
  if_984:
    find_lex $P987, "$/"
    unless_null $P987, vivify_247
    new $P987, "Hash"
  vivify_247:
    set $P988, $P987["pos"]
    unless_null $P988, vivify_248
    new $P988, "Undef"
  vivify_248:
    set $N989, $P988
    new $P983, 'Float'
    set $P983, $N989
  if_984_end:
    store_lex "$name", $P983
.annotate "line", 240
    find_lex $P994, "$/"
    unless_null $P994, vivify_249
    new $P994, "Hash"
  vivify_249:
    set $P995, $P994["quantified_atom"]
    unless_null $P995, vivify_250
    new $P995, "Undef"
  vivify_250:
    if $P995, if_993
.annotate "line", 251
    get_hll_global $P1024, ["PAST"], "Regex"
    find_lex $P1025, "$name"
    find_lex $P1026, "$/"
    $P1027 = $P1024."new"("!BACKREF", $P1025, "subrule" :named("pasttype"), "method" :named("subtype"), $P1026 :named("node"))
    store_lex "$past", $P1027
.annotate "line", 250
    goto if_993_end
  if_993:
.annotate "line", 241
    find_lex $P996, "$/"
    unless_null $P996, vivify_251
    new $P996, "Hash"
  vivify_251:
    set $P997, $P996["quantified_atom"]
    unless_null $P997, vivify_252
    new $P997, "ResizablePMCArray"
  vivify_252:
    set $P998, $P997[0]
    unless_null $P998, vivify_253
    new $P998, "Undef"
  vivify_253:
    $P999 = $P998."ast"()
    store_lex "$past", $P999
.annotate "line", 242
    find_lex $P1003, "$past"
    $S1004 = $P1003."pasttype"()
    iseq $I1005, $S1004, "quant"
    if $I1005, if_1002
    new $P1001, 'Integer'
    set $P1001, $I1005
    goto if_1002_end
  if_1002:
    find_lex $P1006, "$past"
    unless_null $P1006, vivify_254
    new $P1006, "ResizablePMCArray"
  vivify_254:
    set $P1007, $P1006[0]
    unless_null $P1007, vivify_255
    new $P1007, "Undef"
  vivify_255:
    $S1008 = $P1007."pasttype"()
    iseq $I1009, $S1008, "subrule"
    new $P1001, 'Integer'
    set $P1001, $I1009
  if_1002_end:
    if $P1001, if_1000
.annotate "line", 245
    find_lex $P1014, "$past"
    $S1015 = $P1014."pasttype"()
    iseq $I1016, $S1015, "subrule"
    if $I1016, if_1013
.annotate "line", 247
    get_hll_global $P1019, ["PAST"], "Regex"
    find_lex $P1020, "$past"
    find_lex $P1021, "$name"
    find_lex $P1022, "$/"
    $P1023 = $P1019."new"($P1020, $P1021 :named("name"), "subcapture" :named("pasttype"), $P1022 :named("node"))
    store_lex "$past", $P1023
.annotate "line", 246
    goto if_1013_end
  if_1013:
.annotate "line", 245
    find_lex $P1017, "$past"
    find_lex $P1018, "$name"
    "subrule_alias"($P1017, $P1018)
  if_1013_end:
    goto if_1000_end
  if_1000:
.annotate "line", 243
    find_lex $P1010, "$past"
    unless_null $P1010, vivify_256
    new $P1010, "ResizablePMCArray"
  vivify_256:
    set $P1011, $P1010[0]
    unless_null $P1011, vivify_257
    new $P1011, "Undef"
  vivify_257:
    find_lex $P1012, "$name"
    "subrule_alias"($P1011, $P1012)
  if_1000_end:
  if_993_end:
.annotate "line", 254
    find_lex $P1028, "$/"
    find_lex $P1029, "$past"
    $P1030 = $P1028."!make"($P1029)
.annotate "line", 237
    .return ($P1030)
  control_977:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1031, exception, "payload"
    .return ($P1031)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<PIR>"  :subid("64_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_1035
.annotate "line", 257
    new $P1034, 'ExceptionHandler'
    set_addr $P1034, control_1033
    $P1034."handle_types"(58)
    push_eh $P1034
    .lex "self", self
    .lex "$/", param_1035
.annotate "line", 258
    find_lex $P1036, "$/"
    get_hll_global $P1037, ["PAST"], "Regex"
.annotate "line", 259
    get_hll_global $P1038, ["PAST"], "Op"
    find_lex $P1039, "$/"
    unless_null $P1039, vivify_258
    new $P1039, "Hash"
  vivify_258:
    set $P1040, $P1039["pir"]
    unless_null $P1040, vivify_259
    new $P1040, "Undef"
  vivify_259:
    set $S1041, $P1040
    $P1042 = $P1038."new"($S1041 :named("inline"), "inline" :named("pasttype"))
    find_lex $P1043, "$/"
    $P1044 = $P1037."new"($P1042, "pastnode" :named("pasttype"), $P1043 :named("node"))
.annotate "line", 258
    $P1045 = $P1036."!make"($P1044)
.annotate "line", 257
    .return ($P1045)
  control_1033:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1046, exception, "payload"
    .return ($P1046)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<w>"  :subid("65_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_1050
.annotate "line", 265
    new $P1049, 'ExceptionHandler'
    set_addr $P1049, control_1048
    $P1049."handle_types"(58)
    push_eh $P1049
    .lex "self", self
    .lex "$/", param_1050
.annotate "line", 266
    new $P1051, "Undef"
    .lex "$subtype", $P1051
.annotate "line", 267
    new $P1052, "Undef"
    .lex "$past", $P1052
.annotate "line", 266
    find_lex $P1055, "$/"
    unless_null $P1055, vivify_260
    new $P1055, "Hash"
  vivify_260:
    set $P1056, $P1055["sym"]
    unless_null $P1056, vivify_261
    new $P1056, "Undef"
  vivify_261:
    set $S1057, $P1056
    iseq $I1058, $S1057, "n"
    if $I1058, if_1054
    find_lex $P1060, "$/"
    unless_null $P1060, vivify_262
    new $P1060, "Hash"
  vivify_262:
    set $P1061, $P1060["sym"]
    unless_null $P1061, vivify_263
    new $P1061, "Undef"
  vivify_263:
    set $S1062, $P1061
    new $P1053, 'String'
    set $P1053, $S1062
    goto if_1054_end
  if_1054:
    new $P1059, "String"
    assign $P1059, "nl"
    set $P1053, $P1059
  if_1054_end:
    store_lex "$subtype", $P1053
.annotate "line", 267
    get_hll_global $P1063, ["PAST"], "Regex"
    find_lex $P1064, "$subtype"
    find_lex $P1065, "$/"
    $P1066 = $P1063."new"("charclass" :named("pasttype"), $P1064 :named("subtype"), $P1065 :named("node"))
    store_lex "$past", $P1066
.annotate "line", 268
    find_lex $P1067, "$/"
    find_lex $P1068, "$past"
    $P1069 = $P1067."!make"($P1068)
.annotate "line", 265
    .return ($P1069)
  control_1048:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1070, exception, "payload"
    .return ($P1070)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<b>"  :subid("66_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_1074
.annotate "line", 271
    new $P1073, 'ExceptionHandler'
    set_addr $P1073, control_1072
    $P1073."handle_types"(58)
    push_eh $P1073
    .lex "self", self
    .lex "$/", param_1074
.annotate "line", 272
    new $P1075, "Undef"
    .lex "$past", $P1075
    get_hll_global $P1076, ["PAST"], "Regex"
.annotate "line", 273
    find_lex $P1077, "$/"
    unless_null $P1077, vivify_264
    new $P1077, "Hash"
  vivify_264:
    set $P1078, $P1077["sym"]
    unless_null $P1078, vivify_265
    new $P1078, "Undef"
  vivify_265:
    set $S1079, $P1078
    iseq $I1080, $S1079, "B"
    find_lex $P1081, "$/"
    $P1082 = $P1076."new"("\b", "enumcharlist" :named("pasttype"), $I1080 :named("negate"), $P1081 :named("node"))
.annotate "line", 272
    store_lex "$past", $P1082
.annotate "line", 274
    find_lex $P1083, "$/"
    find_lex $P1084, "$past"
    $P1085 = $P1083."!make"($P1084)
.annotate "line", 271
    .return ($P1085)
  control_1072:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1086, exception, "payload"
    .return ($P1086)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<e>"  :subid("67_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_1090
.annotate "line", 277
    new $P1089, 'ExceptionHandler'
    set_addr $P1089, control_1088
    $P1089."handle_types"(58)
    push_eh $P1089
    .lex "self", self
    .lex "$/", param_1090
.annotate "line", 278
    new $P1091, "Undef"
    .lex "$past", $P1091
    get_hll_global $P1092, ["PAST"], "Regex"
.annotate "line", 279
    find_lex $P1093, "$/"
    unless_null $P1093, vivify_266
    new $P1093, "Hash"
  vivify_266:
    set $P1094, $P1093["sym"]
    unless_null $P1094, vivify_267
    new $P1094, "Undef"
  vivify_267:
    set $S1095, $P1094
    iseq $I1096, $S1095, "E"
    find_lex $P1097, "$/"
    $P1098 = $P1092."new"("\\e", "enumcharlist" :named("pasttype"), $I1096 :named("negate"), $P1097 :named("node"))
.annotate "line", 278
    store_lex "$past", $P1098
.annotate "line", 280
    find_lex $P1099, "$/"
    find_lex $P1100, "$past"
    $P1101 = $P1099."!make"($P1100)
.annotate "line", 277
    .return ($P1101)
  control_1088:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1102, exception, "payload"
    .return ($P1102)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<f>"  :subid("68_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_1106
.annotate "line", 283
    new $P1105, 'ExceptionHandler'
    set_addr $P1105, control_1104
    $P1105."handle_types"(58)
    push_eh $P1105
    .lex "self", self
    .lex "$/", param_1106
.annotate "line", 284
    new $P1107, "Undef"
    .lex "$past", $P1107
    get_hll_global $P1108, ["PAST"], "Regex"
.annotate "line", 285
    find_lex $P1109, "$/"
    unless_null $P1109, vivify_268
    new $P1109, "Hash"
  vivify_268:
    set $P1110, $P1109["sym"]
    unless_null $P1110, vivify_269
    new $P1110, "Undef"
  vivify_269:
    set $S1111, $P1110
    iseq $I1112, $S1111, "F"
    find_lex $P1113, "$/"
    $P1114 = $P1108."new"("\\f", "enumcharlist" :named("pasttype"), $I1112 :named("negate"), $P1113 :named("node"))
.annotate "line", 284
    store_lex "$past", $P1114
.annotate "line", 286
    find_lex $P1115, "$/"
    find_lex $P1116, "$past"
    $P1117 = $P1115."!make"($P1116)
.annotate "line", 283
    .return ($P1117)
  control_1104:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1118, exception, "payload"
    .return ($P1118)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<h>"  :subid("69_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_1122
.annotate "line", 289
    new $P1121, 'ExceptionHandler'
    set_addr $P1121, control_1120
    $P1121."handle_types"(58)
    push_eh $P1121
    .lex "self", self
    .lex "$/", param_1122
.annotate "line", 290
    new $P1123, "Undef"
    .lex "$past", $P1123
    get_hll_global $P1124, ["PAST"], "Regex"
.annotate "line", 291
    find_lex $P1125, "$/"
    unless_null $P1125, vivify_270
    new $P1125, "Hash"
  vivify_270:
    set $P1126, $P1125["sym"]
    unless_null $P1126, vivify_271
    new $P1126, "Undef"
  vivify_271:
    set $S1127, $P1126
    iseq $I1128, $S1127, "H"
    find_lex $P1129, "$/"
    $P1130 = $P1124."new"(unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", "enumcharlist" :named("pasttype"), $I1128 :named("negate"), $P1129 :named("node"))
.annotate "line", 290
    store_lex "$past", $P1130
.annotate "line", 292
    find_lex $P1131, "$/"
    find_lex $P1132, "$past"
    $P1133 = $P1131."!make"($P1132)
.annotate "line", 289
    .return ($P1133)
  control_1120:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1134, exception, "payload"
    .return ($P1134)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<r>"  :subid("70_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_1138
.annotate "line", 295
    new $P1137, 'ExceptionHandler'
    set_addr $P1137, control_1136
    $P1137."handle_types"(58)
    push_eh $P1137
    .lex "self", self
    .lex "$/", param_1138
.annotate "line", 296
    new $P1139, "Undef"
    .lex "$past", $P1139
    get_hll_global $P1140, ["PAST"], "Regex"
.annotate "line", 297
    find_lex $P1141, "$/"
    unless_null $P1141, vivify_272
    new $P1141, "Hash"
  vivify_272:
    set $P1142, $P1141["sym"]
    unless_null $P1142, vivify_273
    new $P1142, "Undef"
  vivify_273:
    set $S1143, $P1142
    iseq $I1144, $S1143, "R"
    find_lex $P1145, "$/"
    $P1146 = $P1140."new"("\r", "enumcharlist" :named("pasttype"), $I1144 :named("negate"), $P1145 :named("node"))
.annotate "line", 296
    store_lex "$past", $P1146
.annotate "line", 298
    find_lex $P1147, "$/"
    find_lex $P1148, "$past"
    $P1149 = $P1147."!make"($P1148)
.annotate "line", 295
    .return ($P1149)
  control_1136:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1150, exception, "payload"
    .return ($P1150)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<t>"  :subid("71_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_1154
.annotate "line", 301
    new $P1153, 'ExceptionHandler'
    set_addr $P1153, control_1152
    $P1153."handle_types"(58)
    push_eh $P1153
    .lex "self", self
    .lex "$/", param_1154
.annotate "line", 302
    new $P1155, "Undef"
    .lex "$past", $P1155
    get_hll_global $P1156, ["PAST"], "Regex"
.annotate "line", 303
    find_lex $P1157, "$/"
    unless_null $P1157, vivify_274
    new $P1157, "Hash"
  vivify_274:
    set $P1158, $P1157["sym"]
    unless_null $P1158, vivify_275
    new $P1158, "Undef"
  vivify_275:
    set $S1159, $P1158
    iseq $I1160, $S1159, "T"
    find_lex $P1161, "$/"
    $P1162 = $P1156."new"("\t", "enumcharlist" :named("pasttype"), $I1160 :named("negate"), $P1161 :named("node"))
.annotate "line", 302
    store_lex "$past", $P1162
.annotate "line", 304
    find_lex $P1163, "$/"
    find_lex $P1164, "$past"
    $P1165 = $P1163."!make"($P1164)
.annotate "line", 301
    .return ($P1165)
  control_1152:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1166, exception, "payload"
    .return ($P1166)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<v>"  :subid("72_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_1170
.annotate "line", 307
    new $P1169, 'ExceptionHandler'
    set_addr $P1169, control_1168
    $P1169."handle_types"(58)
    push_eh $P1169
    .lex "self", self
    .lex "$/", param_1170
.annotate "line", 308
    new $P1171, "Undef"
    .lex "$past", $P1171
    get_hll_global $P1172, ["PAST"], "Regex"
.annotate "line", 310
    find_lex $P1173, "$/"
    unless_null $P1173, vivify_276
    new $P1173, "Hash"
  vivify_276:
    set $P1174, $P1173["sym"]
    unless_null $P1174, vivify_277
    new $P1174, "Undef"
  vivify_277:
    set $S1175, $P1174
    iseq $I1176, $S1175, "V"
    find_lex $P1177, "$/"
    $P1178 = $P1172."new"(unicode:"\n\x{b}\f\r\x{85}\u2028\u2029", "enumcharlist" :named("pasttype"), $I1176 :named("negate"), $P1177 :named("node"))
.annotate "line", 308
    store_lex "$past", $P1178
.annotate "line", 311
    find_lex $P1179, "$/"
    find_lex $P1180, "$past"
    $P1181 = $P1179."!make"($P1180)
.annotate "line", 307
    .return ($P1181)
  control_1168:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1182, exception, "payload"
    .return ($P1182)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<o>"  :subid("73_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_1186
.annotate "line", 314
    new $P1185, 'ExceptionHandler'
    set_addr $P1185, control_1184
    $P1185."handle_types"(58)
    push_eh $P1185
    .lex "self", self
    .lex "$/", param_1186
.annotate "line", 315
    new $P1187, "Undef"
    .lex "$octlit", $P1187
.annotate "line", 316
    get_hll_global $P1188, ["HLL";"Actions"], "ints_to_string"
    find_lex $P1191, "$/"
    unless_null $P1191, vivify_278
    new $P1191, "Hash"
  vivify_278:
    set $P1192, $P1191["octint"]
    unless_null $P1192, vivify_279
    new $P1192, "Undef"
  vivify_279:
    unless $P1192, unless_1190
    set $P1189, $P1192
    goto unless_1190_end
  unless_1190:
    find_lex $P1193, "$/"
    unless_null $P1193, vivify_280
    new $P1193, "Hash"
  vivify_280:
    set $P1194, $P1193["octints"]
    unless_null $P1194, vivify_281
    new $P1194, "Hash"
  vivify_281:
    set $P1195, $P1194["octint"]
    unless_null $P1195, vivify_282
    new $P1195, "Undef"
  vivify_282:
    set $P1189, $P1195
  unless_1190_end:
    $P1196 = $P1188($P1189)
    store_lex "$octlit", $P1196
.annotate "line", 317
    find_lex $P1197, "$/"
    find_lex $P1200, "$/"
    unless_null $P1200, vivify_283
    new $P1200, "Hash"
  vivify_283:
    set $P1201, $P1200["sym"]
    unless_null $P1201, vivify_284
    new $P1201, "Undef"
  vivify_284:
    set $S1202, $P1201
    iseq $I1203, $S1202, "O"
    if $I1203, if_1199
.annotate "line", 320
    get_hll_global $P1208, ["PAST"], "Regex"
    find_lex $P1209, "$octlit"
    find_lex $P1210, "$/"
    $P1211 = $P1208."new"($P1209, "literal" :named("pasttype"), $P1210 :named("node"))
    set $P1198, $P1211
.annotate "line", 317
    goto if_1199_end
  if_1199:
.annotate "line", 318
    get_hll_global $P1204, ["PAST"], "Regex"
    find_lex $P1205, "$octlit"
    find_lex $P1206, "$/"
    $P1207 = $P1204."new"($P1205, "enumcharlist" :named("pasttype"), 1 :named("negate"), $P1206 :named("node"))
    set $P1198, $P1207
  if_1199_end:
    $P1212 = $P1197."!make"($P1198)
.annotate "line", 314
    .return ($P1212)
  control_1184:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1213, exception, "payload"
    .return ($P1213)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<x>"  :subid("74_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_1217
.annotate "line", 323
    new $P1216, 'ExceptionHandler'
    set_addr $P1216, control_1215
    $P1216."handle_types"(58)
    push_eh $P1216
    .lex "self", self
    .lex "$/", param_1217
.annotate "line", 324
    new $P1218, "Undef"
    .lex "$hexlit", $P1218
.annotate "line", 325
    get_hll_global $P1219, ["HLL";"Actions"], "ints_to_string"
    find_lex $P1222, "$/"
    unless_null $P1222, vivify_285
    new $P1222, "Hash"
  vivify_285:
    set $P1223, $P1222["hexint"]
    unless_null $P1223, vivify_286
    new $P1223, "Undef"
  vivify_286:
    unless $P1223, unless_1221
    set $P1220, $P1223
    goto unless_1221_end
  unless_1221:
    find_lex $P1224, "$/"
    unless_null $P1224, vivify_287
    new $P1224, "Hash"
  vivify_287:
    set $P1225, $P1224["hexints"]
    unless_null $P1225, vivify_288
    new $P1225, "Hash"
  vivify_288:
    set $P1226, $P1225["hexint"]
    unless_null $P1226, vivify_289
    new $P1226, "Undef"
  vivify_289:
    set $P1220, $P1226
  unless_1221_end:
    $P1227 = $P1219($P1220)
    store_lex "$hexlit", $P1227
.annotate "line", 326
    find_lex $P1228, "$/"
    find_lex $P1231, "$/"
    unless_null $P1231, vivify_290
    new $P1231, "Hash"
  vivify_290:
    set $P1232, $P1231["sym"]
    unless_null $P1232, vivify_291
    new $P1232, "Undef"
  vivify_291:
    set $S1233, $P1232
    iseq $I1234, $S1233, "X"
    if $I1234, if_1230
.annotate "line", 329
    get_hll_global $P1239, ["PAST"], "Regex"
    find_lex $P1240, "$hexlit"
    find_lex $P1241, "$/"
    $P1242 = $P1239."new"($P1240, "literal" :named("pasttype"), $P1241 :named("node"))
    set $P1229, $P1242
.annotate "line", 326
    goto if_1230_end
  if_1230:
.annotate "line", 327
    get_hll_global $P1235, ["PAST"], "Regex"
    find_lex $P1236, "$hexlit"
    find_lex $P1237, "$/"
    $P1238 = $P1235."new"($P1236, "enumcharlist" :named("pasttype"), 1 :named("negate"), $P1237 :named("node"))
    set $P1229, $P1238
  if_1230_end:
    $P1243 = $P1228."!make"($P1229)
.annotate "line", 323
    .return ($P1243)
  control_1215:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1244, exception, "payload"
    .return ($P1244)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<misc>"  :subid("75_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_1248
.annotate "line", 332
    new $P1247, 'ExceptionHandler'
    set_addr $P1247, control_1246
    $P1247."handle_types"(58)
    push_eh $P1247
    .lex "self", self
    .lex "$/", param_1248
.annotate "line", 333
    new $P1249, "Undef"
    .lex "$past", $P1249
    get_hll_global $P1250, ["PAST"], "Regex"
    find_lex $P1251, "$/"
    set $S1252, $P1251
    find_lex $P1253, "$/"
    $P1254 = $P1250."new"($S1252, "literal" :named("pasttype"), $P1253 :named("node"))
    store_lex "$past", $P1254
.annotate "line", 334
    find_lex $P1255, "$/"
    find_lex $P1256, "$past"
    $P1257 = $P1255."!make"($P1256)
.annotate "line", 332
    .return ($P1257)
  control_1246:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1258, exception, "payload"
    .return ($P1258)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<?>"  :subid("76_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_1262
.annotate "line", 338
    new $P1261, 'ExceptionHandler'
    set_addr $P1261, control_1260
    $P1261."handle_types"(58)
    push_eh $P1261
    .lex "self", self
    .lex "$/", param_1262
.annotate "line", 339
    new $P1263, "Undef"
    .lex "$past", $P1263
.annotate "line", 338
    find_lex $P1264, "$past"
.annotate "line", 340
    find_lex $P1266, "$/"
    unless_null $P1266, vivify_292
    new $P1266, "Hash"
  vivify_292:
    set $P1267, $P1266["assertion"]
    unless_null $P1267, vivify_293
    new $P1267, "Undef"
  vivify_293:
    if $P1267, if_1265
.annotate "line", 344
    new $P1272, "Integer"
    assign $P1272, 0
    store_lex "$past", $P1272
    goto if_1265_end
  if_1265:
.annotate "line", 341
    find_lex $P1268, "$/"
    unless_null $P1268, vivify_294
    new $P1268, "Hash"
  vivify_294:
    set $P1269, $P1268["assertion"]
    unless_null $P1269, vivify_295
    new $P1269, "Undef"
  vivify_295:
    $P1270 = $P1269."ast"()
    store_lex "$past", $P1270
.annotate "line", 342
    find_lex $P1271, "$past"
    $P1271."subtype"("zerowidth")
  if_1265_end:
.annotate "line", 345
    find_lex $P1273, "$/"
    find_lex $P1274, "$past"
    $P1275 = $P1273."!make"($P1274)
.annotate "line", 338
    .return ($P1275)
  control_1260:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1276, exception, "payload"
    .return ($P1276)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<!>"  :subid("77_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_1280
.annotate "line", 348
    new $P1279, 'ExceptionHandler'
    set_addr $P1279, control_1278
    $P1279."handle_types"(58)
    push_eh $P1279
    .lex "self", self
    .lex "$/", param_1280
.annotate "line", 349
    new $P1281, "Undef"
    .lex "$past", $P1281
.annotate "line", 348
    find_lex $P1282, "$past"
.annotate "line", 350
    find_lex $P1284, "$/"
    unless_null $P1284, vivify_296
    new $P1284, "Hash"
  vivify_296:
    set $P1285, $P1284["assertion"]
    unless_null $P1285, vivify_297
    new $P1285, "Undef"
  vivify_297:
    if $P1285, if_1283
.annotate "line", 356
    get_hll_global $P1294, ["PAST"], "Regex"
    find_lex $P1295, "$/"
    $P1296 = $P1294."new"("anchor" :named("pasttype"), "fail" :named("subtype"), $P1295 :named("node"))
    store_lex "$past", $P1296
.annotate "line", 355
    goto if_1283_end
  if_1283:
.annotate "line", 351
    find_lex $P1286, "$/"
    unless_null $P1286, vivify_298
    new $P1286, "Hash"
  vivify_298:
    set $P1287, $P1286["assertion"]
    unless_null $P1287, vivify_299
    new $P1287, "Undef"
  vivify_299:
    $P1288 = $P1287."ast"()
    store_lex "$past", $P1288
.annotate "line", 352
    find_lex $P1289, "$past"
    find_lex $P1290, "$past"
    $P1291 = $P1290."negate"()
    isfalse $I1292, $P1291
    $P1289."negate"($I1292)
.annotate "line", 353
    find_lex $P1293, "$past"
    $P1293."subtype"("zerowidth")
  if_1283_end:
.annotate "line", 358
    find_lex $P1297, "$/"
    find_lex $P1298, "$past"
    $P1299 = $P1297."!make"($P1298)
.annotate "line", 348
    .return ($P1299)
  control_1278:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1300, exception, "payload"
    .return ($P1300)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<method>"  :subid("78_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_1304
.annotate "line", 361
    new $P1303, 'ExceptionHandler'
    set_addr $P1303, control_1302
    $P1303."handle_types"(58)
    push_eh $P1303
    .lex "self", self
    .lex "$/", param_1304
.annotate "line", 362
    new $P1305, "Undef"
    .lex "$past", $P1305
    find_lex $P1306, "$/"
    unless_null $P1306, vivify_300
    new $P1306, "Hash"
  vivify_300:
    set $P1307, $P1306["assertion"]
    unless_null $P1307, vivify_301
    new $P1307, "Undef"
  vivify_301:
    $P1308 = $P1307."ast"()
    store_lex "$past", $P1308
.annotate "line", 363
    find_lex $P1309, "$past"
    $P1309."subtype"("method")
.annotate "line", 364
    find_lex $P1310, "$past"
    $P1310."name"("")
.annotate "line", 365
    find_lex $P1311, "$/"
    find_lex $P1312, "$past"
    $P1313 = $P1311."!make"($P1312)
.annotate "line", 361
    .return ($P1313)
  control_1302:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1314, exception, "payload"
    .return ($P1314)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<name>"  :subid("79_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_1318
.annotate "line", 368
    .const 'Sub' $P1376 = "81_1258924510.05036" 
    capture_lex $P1376
    .const 'Sub' $P1340 = "80_1258924510.05036" 
    capture_lex $P1340
    new $P1317, 'ExceptionHandler'
    set_addr $P1317, control_1316
    $P1317."handle_types"(58)
    push_eh $P1317
    .lex "self", self
    .lex "$/", param_1318
.annotate "line", 369
    new $P1319, "Undef"
    .lex "$name", $P1319
.annotate "line", 370
    new $P1320, "Undef"
    .lex "$past", $P1320
.annotate "line", 369
    find_lex $P1321, "$/"
    unless_null $P1321, vivify_302
    new $P1321, "Hash"
  vivify_302:
    set $P1322, $P1321["longname"]
    unless_null $P1322, vivify_303
    new $P1322, "Undef"
  vivify_303:
    set $S1323, $P1322
    new $P1324, 'String'
    set $P1324, $S1323
    store_lex "$name", $P1324
    find_lex $P1325, "$past"
.annotate "line", 371
    find_lex $P1327, "$/"
    unless_null $P1327, vivify_304
    new $P1327, "Hash"
  vivify_304:
    set $P1328, $P1327["assertion"]
    unless_null $P1328, vivify_305
    new $P1328, "Undef"
  vivify_305:
    if $P1328, if_1326
.annotate "line", 375
    find_lex $P1336, "$name"
    set $S1337, $P1336
    iseq $I1338, $S1337, "sym"
    if $I1338, if_1335
.annotate "line", 391
    get_hll_global $P1350, ["PAST"], "Regex"
    find_lex $P1351, "$name"
    find_lex $P1352, "$name"
    find_lex $P1353, "$/"
    $P1354 = $P1350."new"($P1351, $P1352 :named("name"), "subrule" :named("pasttype"), "capture" :named("subtype"), $P1353 :named("node"))
    store_lex "$past", $P1354
.annotate "line", 393
    find_lex $P1356, "$/"
    unless_null $P1356, vivify_306
    new $P1356, "Hash"
  vivify_306:
    set $P1357, $P1356["nibbler"]
    unless_null $P1357, vivify_307
    new $P1357, "Undef"
  vivify_307:
    if $P1357, if_1355
.annotate "line", 396
    find_lex $P1365, "$/"
    unless_null $P1365, vivify_308
    new $P1365, "Hash"
  vivify_308:
    set $P1366, $P1365["arglist"]
    unless_null $P1366, vivify_309
    new $P1366, "Undef"
  vivify_309:
    unless $P1366, if_1364_end
.annotate "line", 397
    find_lex $P1368, "$/"
    unless_null $P1368, vivify_310
    new $P1368, "Hash"
  vivify_310:
    set $P1369, $P1368["arglist"]
    unless_null $P1369, vivify_311
    new $P1369, "ResizablePMCArray"
  vivify_311:
    set $P1370, $P1369[0]
    unless_null $P1370, vivify_312
    new $P1370, "Undef"
  vivify_312:
    $P1371 = $P1370."ast"()
    $P1372 = $P1371."list"()
    defined $I1373, $P1372
    unless $I1373, for_undef_313
    iter $P1367, $P1372
    new $P1382, 'ExceptionHandler'
    set_addr $P1382, loop1381_handler
    $P1382."handle_types"(65, 67, 66)
    push_eh $P1382
  loop1381_test:
    unless $P1367, loop1381_done
    shift $P1374, $P1367
  loop1381_redo:
    .const 'Sub' $P1376 = "81_1258924510.05036" 
    capture_lex $P1376
    $P1376($P1374)
  loop1381_next:
    goto loop1381_test
  loop1381_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1383, exception, 'type'
    eq $P1383, 65, loop1381_next
    eq $P1383, 67, loop1381_redo
  loop1381_done:
    pop_eh 
  for_undef_313:
  if_1364_end:
.annotate "line", 396
    goto if_1355_end
  if_1355:
.annotate "line", 394
    find_lex $P1358, "$past"
    find_lex $P1359, "$/"
    unless_null $P1359, vivify_314
    new $P1359, "Hash"
  vivify_314:
    set $P1360, $P1359["nibbler"]
    unless_null $P1360, vivify_315
    new $P1360, "ResizablePMCArray"
  vivify_315:
    set $P1361, $P1360[0]
    unless_null $P1361, vivify_316
    new $P1361, "Undef"
  vivify_316:
    $P1362 = $P1361."ast"()
    $P1363 = "buildsub"($P1362)
    $P1358."push"($P1363)
  if_1355_end:
.annotate "line", 390
    goto if_1335_end
  if_1335:
.annotate "line", 375
    .const 'Sub' $P1340 = "80_1258924510.05036" 
    capture_lex $P1340
    $P1340()
  if_1335_end:
    goto if_1326_end
  if_1326:
.annotate "line", 372
    find_lex $P1329, "$/"
    unless_null $P1329, vivify_317
    new $P1329, "Hash"
  vivify_317:
    set $P1330, $P1329["assertion"]
    unless_null $P1330, vivify_318
    new $P1330, "ResizablePMCArray"
  vivify_318:
    set $P1331, $P1330[0]
    unless_null $P1331, vivify_319
    new $P1331, "Undef"
  vivify_319:
    $P1332 = $P1331."ast"()
    store_lex "$past", $P1332
.annotate "line", 373
    find_lex $P1333, "$past"
    find_lex $P1334, "$name"
    "subrule_alias"($P1333, $P1334)
  if_1326_end:
.annotate "line", 400
    find_lex $P1384, "$/"
    find_lex $P1385, "$past"
    $P1386 = $P1384."!make"($P1385)
.annotate "line", 368
    .return ($P1386)
  control_1316:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1387, exception, "payload"
    .return ($P1387)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1375"  :anon :subid("81_1258924510.05036") :outer("79_1258924510.05036")
    .param pmc param_1377
.annotate "line", 397
    .lex "$_", param_1377
    find_lex $P1378, "$past"
    find_lex $P1379, "$_"
    $P1380 = $P1378."push"($P1379)
    .return ($P1380)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1339"  :anon :subid("80_1258924510.05036") :outer("79_1258924510.05036")
.annotate "line", 376
    new $P1341, "Undef"
    .lex "$regexsym", $P1341

            $P0 = get_global '$REGEXNAME'
            $S0 = $P0
            $I0 = index $S0, ':sym<'
            add $I0, 5
            $S0 = substr $S0, $I0
            chopn $S0, 1
            $P1342 = box $S0
        
    store_lex "$regexsym", $P1342
.annotate "line", 385
    get_hll_global $P1343, ["PAST"], "Regex"
.annotate "line", 386
    get_hll_global $P1344, ["PAST"], "Regex"
    find_lex $P1345, "$regexsym"
    $P1346 = $P1344."new"($P1345, "literal" :named("pasttype"))
    find_lex $P1347, "$name"
    find_lex $P1348, "$/"
    $P1349 = $P1343."new"($P1346, $P1347 :named("name"), "subcapture" :named("pasttype"), $P1348 :named("node"))
.annotate "line", 385
    store_lex "$past", $P1349
.annotate "line", 375
    .return ($P1349)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<[>"  :subid("82_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_1391
.annotate "line", 403
    .const 'Sub' $P1426 = "83_1258924510.05036" 
    capture_lex $P1426
    new $P1390, 'ExceptionHandler'
    set_addr $P1390, control_1389
    $P1390."handle_types"(58)
    push_eh $P1390
    .lex "self", self
    .lex "$/", param_1391
.annotate "line", 404
    new $P1392, "Undef"
    .lex "$clist", $P1392
.annotate "line", 405
    new $P1393, "Undef"
    .lex "$past", $P1393
.annotate "line", 414
    new $P1394, "Undef"
    .lex "$i", $P1394
.annotate "line", 415
    new $P1395, "Undef"
    .lex "$n", $P1395
.annotate "line", 404
    find_lex $P1396, "$/"
    unless_null $P1396, vivify_320
    new $P1396, "Hash"
  vivify_320:
    set $P1397, $P1396["cclass_elem"]
    unless_null $P1397, vivify_321
    new $P1397, "Undef"
  vivify_321:
    store_lex "$clist", $P1397
.annotate "line", 405
    find_lex $P1398, "$clist"
    unless_null $P1398, vivify_322
    new $P1398, "ResizablePMCArray"
  vivify_322:
    set $P1399, $P1398[0]
    unless_null $P1399, vivify_323
    new $P1399, "Undef"
  vivify_323:
    $P1400 = $P1399."ast"()
    store_lex "$past", $P1400
.annotate "line", 406
    find_lex $P1404, "$past"
    $P1405 = $P1404."negate"()
    if $P1405, if_1403
    set $P1402, $P1405
    goto if_1403_end
  if_1403:
    find_lex $P1406, "$past"
    $S1407 = $P1406."pasttype"()
    iseq $I1408, $S1407, "subrule"
    new $P1402, 'Integer'
    set $P1402, $I1408
  if_1403_end:
    unless $P1402, if_1401_end
.annotate "line", 407
    find_lex $P1409, "$past"
    $P1409."subtype"("zerowidth")
.annotate "line", 408
    get_hll_global $P1410, ["PAST"], "Regex"
    find_lex $P1411, "$past"
.annotate "line", 410
    get_hll_global $P1412, ["PAST"], "Regex"
    $P1413 = $P1412."new"("charclass" :named("pasttype"), "." :named("subtype"))
    find_lex $P1414, "$/"
    $P1415 = $P1410."new"($P1411, $P1413, $P1414 :named("node"))
.annotate "line", 408
    store_lex "$past", $P1415
  if_1401_end:
.annotate "line", 414
    new $P1416, "Integer"
    assign $P1416, 1
    store_lex "$i", $P1416
.annotate "line", 415
    find_lex $P1417, "$clist"
    set $N1418, $P1417
    new $P1419, 'Float'
    set $P1419, $N1418
    store_lex "$n", $P1419
.annotate "line", 416
    new $P1450, 'ExceptionHandler'
    set_addr $P1450, loop1449_handler
    $P1450."handle_types"(65, 67, 66)
    push_eh $P1450
  loop1449_test:
    find_lex $P1420, "$i"
    set $N1421, $P1420
    find_lex $P1422, "$n"
    set $N1423, $P1422
    islt $I1424, $N1421, $N1423
    unless $I1424, loop1449_done
  loop1449_redo:
    .const 'Sub' $P1426 = "83_1258924510.05036" 
    capture_lex $P1426
    $P1426()
  loop1449_next:
    goto loop1449_test
  loop1449_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1451, exception, 'type'
    eq $P1451, 65, loop1449_next
    eq $P1451, 67, loop1449_redo
  loop1449_done:
    pop_eh 
.annotate "line", 427
    find_lex $P1452, "$/"
    find_lex $P1453, "$past"
    $P1454 = $P1452."!make"($P1453)
.annotate "line", 403
    .return ($P1454)
  control_1389:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1455, exception, "payload"
    .return ($P1455)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1425"  :anon :subid("83_1258924510.05036") :outer("82_1258924510.05036")
.annotate "line", 417
    new $P1427, "Undef"
    .lex "$ast", $P1427
    find_lex $P1428, "$i"
    set $I1429, $P1428
    find_lex $P1430, "$clist"
    unless_null $P1430, vivify_324
    new $P1430, "ResizablePMCArray"
  vivify_324:
    set $P1431, $P1430[$I1429]
    unless_null $P1431, vivify_325
    new $P1431, "Undef"
  vivify_325:
    $P1432 = $P1431."ast"()
    store_lex "$ast", $P1432
.annotate "line", 418
    find_lex $P1434, "$ast"
    $P1435 = $P1434."negate"()
    if $P1435, if_1433
.annotate "line", 423
    get_hll_global $P1442, ["PAST"], "Regex"
    find_lex $P1443, "$past"
    find_lex $P1444, "$ast"
    find_lex $P1445, "$/"
    $P1446 = $P1442."new"($P1443, $P1444, "alt" :named("pasttype"), $P1445 :named("node"))
    store_lex "$past", $P1446
.annotate "line", 422
    goto if_1433_end
  if_1433:
.annotate "line", 419
    find_lex $P1436, "$ast"
    $P1436."subtype"("zerowidth")
.annotate "line", 420
    get_hll_global $P1437, ["PAST"], "Regex"
    find_lex $P1438, "$ast"
    find_lex $P1439, "$past"
    find_lex $P1440, "$/"
    $P1441 = $P1437."new"($P1438, $P1439, "concat" :named("pasttype"), $P1440 :named("node"))
    store_lex "$past", $P1441
  if_1433_end:
.annotate "line", 425
    find_lex $P1447, "$i"
    add $P1448, $P1447, 1
    store_lex "$i", $P1448
.annotate "line", 416
    .return ($P1448)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "cclass_elem"  :subid("84_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_1459
.annotate "line", 430
    .const 'Sub' $P1484 = "86_1258924510.05036" 
    capture_lex $P1484
    .const 'Sub' $P1468 = "85_1258924510.05036" 
    capture_lex $P1468
    new $P1458, 'ExceptionHandler'
    set_addr $P1458, control_1457
    $P1458."handle_types"(58)
    push_eh $P1458
    .lex "self", self
    .lex "$/", param_1459
.annotate "line", 431
    new $P1460, "Undef"
    .lex "$str", $P1460
.annotate "line", 432
    new $P1461, "Undef"
    .lex "$past", $P1461
.annotate "line", 431
    new $P1462, "String"
    assign $P1462, ""
    store_lex "$str", $P1462
    find_lex $P1463, "$past"
.annotate "line", 433
    find_lex $P1465, "$/"
    unless_null $P1465, vivify_326
    new $P1465, "Hash"
  vivify_326:
    set $P1466, $P1465["name"]
    unless_null $P1466, vivify_327
    new $P1466, "Undef"
  vivify_327:
    if $P1466, if_1464
.annotate "line", 437
    find_lex $P1479, "$/"
    unless_null $P1479, vivify_328
    new $P1479, "Hash"
  vivify_328:
    set $P1480, $P1479["charspec"]
    unless_null $P1480, vivify_329
    new $P1480, "Undef"
  vivify_329:
    defined $I1481, $P1480
    unless $I1481, for_undef_330
    iter $P1478, $P1480
    new $P1510, 'ExceptionHandler'
    set_addr $P1510, loop1509_handler
    $P1510."handle_types"(65, 67, 66)
    push_eh $P1510
  loop1509_test:
    unless $P1478, loop1509_done
    shift $P1482, $P1478
  loop1509_redo:
    .const 'Sub' $P1484 = "86_1258924510.05036" 
    capture_lex $P1484
    $P1484($P1482)
  loop1509_next:
    goto loop1509_test
  loop1509_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1511, exception, 'type'
    eq $P1511, 65, loop1509_next
    eq $P1511, 67, loop1509_redo
  loop1509_done:
    pop_eh 
  for_undef_330:
.annotate "line", 462
    get_hll_global $P1512, ["PAST"], "Regex"
    find_lex $P1513, "$str"
    find_lex $P1514, "$/"
    $P1515 = $P1512."new"($P1513, "enumcharlist" :named("pasttype"), $P1514 :named("node"))
    store_lex "$past", $P1515
.annotate "line", 436
    goto if_1464_end
  if_1464:
.annotate "line", 433
    .const 'Sub' $P1468 = "85_1258924510.05036" 
    capture_lex $P1468
    $P1468()
  if_1464_end:
.annotate "line", 464
    find_lex $P1516, "$past"
    find_lex $P1517, "$/"
    unless_null $P1517, vivify_342
    new $P1517, "Hash"
  vivify_342:
    set $P1518, $P1517["sign"]
    unless_null $P1518, vivify_343
    new $P1518, "Undef"
  vivify_343:
    set $S1519, $P1518
    iseq $I1520, $S1519, "-"
    $P1516."negate"($I1520)
.annotate "line", 465
    find_lex $P1521, "$/"
    find_lex $P1522, "$past"
    $P1523 = $P1521."!make"($P1522)
.annotate "line", 430
    .return ($P1523)
  control_1457:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1524, exception, "payload"
    .return ($P1524)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1483"  :anon :subid("86_1258924510.05036") :outer("84_1258924510.05036")
    .param pmc param_1485
.annotate "line", 437
    .const 'Sub' $P1491 = "87_1258924510.05036" 
    capture_lex $P1491
    .lex "$_", param_1485
.annotate "line", 438
    find_lex $P1488, "$_"
    unless_null $P1488, vivify_331
    new $P1488, "ResizablePMCArray"
  vivify_331:
    set $P1489, $P1488[1]
    unless_null $P1489, vivify_332
    new $P1489, "Undef"
  vivify_332:
    if $P1489, if_1487
.annotate "line", 460
    find_lex $P1505, "$str"
    find_lex $P1506, "$_"
    unless_null $P1506, vivify_333
    new $P1506, "ResizablePMCArray"
  vivify_333:
    set $P1507, $P1506[0]
    unless_null $P1507, vivify_334
    new $P1507, "Undef"
  vivify_334:
    concat $P1508, $P1505, $P1507
    store_lex "$str", $P1508
    set $P1486, $P1508
.annotate "line", 438
    goto if_1487_end
  if_1487:
    .const 'Sub' $P1491 = "87_1258924510.05036" 
    capture_lex $P1491
    $P1504 = $P1491()
    set $P1486, $P1504
  if_1487_end:
.annotate "line", 437
    .return ($P1486)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1490"  :anon :subid("87_1258924510.05036") :outer("86_1258924510.05036")
.annotate "line", 439
    new $P1492, "Undef"
    .lex "$a", $P1492
.annotate "line", 440
    new $P1493, "Undef"
    .lex "$b", $P1493
.annotate "line", 441
    new $P1494, "Undef"
    .lex "$c", $P1494
.annotate "line", 439
    find_lex $P1495, "$_"
    unless_null $P1495, vivify_335
    new $P1495, "ResizablePMCArray"
  vivify_335:
    set $P1496, $P1495[0]
    unless_null $P1496, vivify_336
    new $P1496, "Undef"
  vivify_336:
    store_lex "$a", $P1496
.annotate "line", 440
    find_lex $P1497, "$_"
    unless_null $P1497, vivify_337
    new $P1497, "ResizablePMCArray"
  vivify_337:
    set $P1498, $P1497[1]
    unless_null $P1498, vivify_338
    new $P1498, "ResizablePMCArray"
  vivify_338:
    set $P1499, $P1498[0]
    unless_null $P1499, vivify_339
    new $P1499, "Undef"
  vivify_339:
    store_lex "$b", $P1499
.annotate "line", 441

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
                             $P1500 = box $S2
                         
    store_lex "$c", $P1500
.annotate "line", 458
    find_lex $P1501, "$str"
    find_lex $P1502, "$c"
    concat $P1503, $P1501, $P1502
    store_lex "$str", $P1503
.annotate "line", 438
    .return ($P1503)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1467"  :anon :subid("85_1258924510.05036") :outer("84_1258924510.05036")
.annotate "line", 434
    new $P1469, "Undef"
    .lex "$name", $P1469
    find_lex $P1470, "$/"
    unless_null $P1470, vivify_340
    new $P1470, "Hash"
  vivify_340:
    set $P1471, $P1470["name"]
    unless_null $P1471, vivify_341
    new $P1471, "Undef"
  vivify_341:
    set $S1472, $P1471
    new $P1473, 'String'
    set $P1473, $S1472
    store_lex "$name", $P1473
.annotate "line", 435
    get_hll_global $P1474, ["PAST"], "Regex"
    find_lex $P1475, "$name"
    find_lex $P1476, "$/"
    $P1477 = $P1474."new"($P1475, "subrule" :named("pasttype"), "method" :named("subtype"), $P1476 :named("node"))
    store_lex "$past", $P1477
.annotate "line", 433
    .return ($P1477)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "mod_internal"  :subid("88_1258924510.05036") :method :outer("11_1258924510.05036")
    .param pmc param_1528
.annotate "line", 468
    new $P1527, 'ExceptionHandler'
    set_addr $P1527, control_1526
    $P1527."handle_types"(58)
    push_eh $P1527
    .lex "self", self
    .lex "$/", param_1528
.annotate "line", 469
    new $P1529, "Hash"
    .lex "%mods", $P1529
.annotate "line", 470
    new $P1530, "Undef"
    .lex "$n", $P1530
.annotate "line", 469
    get_global $P1531, "@MODIFIERS"
    unless_null $P1531, vivify_344
    new $P1531, "ResizablePMCArray"
  vivify_344:
    set $P1532, $P1531[0]
    unless_null $P1532, vivify_345
    new $P1532, "Undef"
  vivify_345:
    store_lex "%mods", $P1532
.annotate "line", 470
    find_lex $P1535, "$/"
    unless_null $P1535, vivify_346
    new $P1535, "Hash"
  vivify_346:
    set $P1536, $P1535["n"]
    unless_null $P1536, vivify_347
    new $P1536, "ResizablePMCArray"
  vivify_347:
    set $P1537, $P1536[0]
    unless_null $P1537, vivify_348
    new $P1537, "Undef"
  vivify_348:
    set $S1538, $P1537
    isgt $I1539, $S1538, ""
    if $I1539, if_1534
    new $P1544, "Integer"
    assign $P1544, 1
    set $P1533, $P1544
    goto if_1534_end
  if_1534:
    find_lex $P1540, "$/"
    unless_null $P1540, vivify_349
    new $P1540, "Hash"
  vivify_349:
    set $P1541, $P1540["n"]
    unless_null $P1541, vivify_350
    new $P1541, "ResizablePMCArray"
  vivify_350:
    set $P1542, $P1541[0]
    unless_null $P1542, vivify_351
    new $P1542, "Undef"
  vivify_351:
    set $N1543, $P1542
    new $P1533, 'Float'
    set $P1533, $N1543
  if_1534_end:
    store_lex "$n", $P1533
.annotate "line", 471
    find_lex $P1545, "$n"
    find_lex $P1546, "$/"
    unless_null $P1546, vivify_352
    new $P1546, "Hash"
  vivify_352:
    set $P1547, $P1546["mod_ident"]
    unless_null $P1547, vivify_353
    new $P1547, "Hash"
  vivify_353:
    set $P1548, $P1547["sym"]
    unless_null $P1548, vivify_354
    new $P1548, "Undef"
  vivify_354:
    set $S1549, $P1548
    find_lex $P1550, "%mods"
    unless_null $P1550, vivify_355
    new $P1550, "Hash"
    store_lex "%mods", $P1550
  vivify_355:
    set $P1550[$S1549], $P1545
.annotate "line", 472
    find_lex $P1551, "$/"
    $P1552 = $P1551."!make"(0)
.annotate "line", 468
    .return ($P1552)
  control_1526:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1553, exception, "payload"
    .return ($P1553)
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
    $P0 = get_hll_global ['Regex';'P6Regex';'Actions'], 'INIT'
    $P0()
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
