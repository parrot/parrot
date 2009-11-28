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
.sub "_block11"  :anon :subid("10_1259420183.18494")
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
.sub "" :load :init :subid("post158") :outer("10_1259420183.18494")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1259420183.18494" 
    .local pmc block
    set block, $P12
    $P580 = get_root_global ["parrot"], "P6metaclass"
    $P580."new_class"("Regex::P6Regex::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block13"  :subid("11_1259420183.18494") :outer("10_1259420183.18494")
.annotate "line", 3
    .const 'Sub' $P571 = "156_1259420183.18494" 
    capture_lex $P571
    .const 'Sub' $P563 = "154_1259420183.18494" 
    capture_lex $P563
    .const 'Sub' $P555 = "152_1259420183.18494" 
    capture_lex $P555
    .const 'Sub' $P534 = "147_1259420183.18494" 
    capture_lex $P534
    .const 'Sub' $P499 = "141_1259420183.18494" 
    capture_lex $P499
    .const 'Sub' $P487 = "138_1259420183.18494" 
    capture_lex $P487
    .const 'Sub' $P474 = "135_1259420183.18494" 
    capture_lex $P474
    .const 'Sub' $P468 = "133_1259420183.18494" 
    capture_lex $P468
    .const 'Sub' $P457 = "130_1259420183.18494" 
    capture_lex $P457
    .const 'Sub' $P446 = "127_1259420183.18494" 
    capture_lex $P446
    .const 'Sub' $P437 = "123_1259420183.18494" 
    capture_lex $P437
    .const 'Sub' $P431 = "121_1259420183.18494" 
    capture_lex $P431
    .const 'Sub' $P425 = "119_1259420183.18494" 
    capture_lex $P425
    .const 'Sub' $P419 = "117_1259420183.18494" 
    capture_lex $P419
    .const 'Sub' $P413 = "115_1259420183.18494" 
    capture_lex $P413
    .const 'Sub' $P402 = "113_1259420183.18494" 
    capture_lex $P402
    .const 'Sub' $P391 = "111_1259420183.18494" 
    capture_lex $P391
    .const 'Sub' $P383 = "109_1259420183.18494" 
    capture_lex $P383
    .const 'Sub' $P377 = "107_1259420183.18494" 
    capture_lex $P377
    .const 'Sub' $P371 = "105_1259420183.18494" 
    capture_lex $P371
    .const 'Sub' $P365 = "103_1259420183.18494" 
    capture_lex $P365
    .const 'Sub' $P359 = "101_1259420183.18494" 
    capture_lex $P359
    .const 'Sub' $P353 = "99_1259420183.18494" 
    capture_lex $P353
    .const 'Sub' $P347 = "97_1259420183.18494" 
    capture_lex $P347
    .const 'Sub' $P341 = "95_1259420183.18494" 
    capture_lex $P341
    .const 'Sub' $P335 = "93_1259420183.18494" 
    capture_lex $P335
    .const 'Sub' $P323 = "89_1259420183.18494" 
    capture_lex $P323
    .const 'Sub' $P311 = "87_1259420183.18494" 
    capture_lex $P311
    .const 'Sub' $P304 = "85_1259420183.18494" 
    capture_lex $P304
    .const 'Sub' $P287 = "83_1259420183.18494" 
    capture_lex $P287
    .const 'Sub' $P280 = "81_1259420183.18494" 
    capture_lex $P280
    .const 'Sub' $P274 = "79_1259420183.18494" 
    capture_lex $P274
    .const 'Sub' $P268 = "77_1259420183.18494" 
    capture_lex $P268
    .const 'Sub' $P261 = "75_1259420183.18494" 
    capture_lex $P261
    .const 'Sub' $P254 = "73_1259420183.18494" 
    capture_lex $P254
    .const 'Sub' $P247 = "71_1259420183.18494" 
    capture_lex $P247
    .const 'Sub' $P240 = "69_1259420183.18494" 
    capture_lex $P240
    .const 'Sub' $P234 = "67_1259420183.18494" 
    capture_lex $P234
    .const 'Sub' $P228 = "65_1259420183.18494" 
    capture_lex $P228
    .const 'Sub' $P222 = "63_1259420183.18494" 
    capture_lex $P222
    .const 'Sub' $P216 = "61_1259420183.18494" 
    capture_lex $P216
    .const 'Sub' $P210 = "59_1259420183.18494" 
    capture_lex $P210
    .const 'Sub' $P205 = "57_1259420183.18494" 
    capture_lex $P205
    .const 'Sub' $P200 = "55_1259420183.18494" 
    capture_lex $P200
    .const 'Sub' $P194 = "53_1259420183.18494" 
    capture_lex $P194
    .const 'Sub' $P188 = "51_1259420183.18494" 
    capture_lex $P188
    .const 'Sub' $P182 = "49_1259420183.18494" 
    capture_lex $P182
    .const 'Sub' $P166 = "44_1259420183.18494" 
    capture_lex $P166
    .const 'Sub' $P154 = "42_1259420183.18494" 
    capture_lex $P154
    .const 'Sub' $P147 = "40_1259420183.18494" 
    capture_lex $P147
    .const 'Sub' $P140 = "38_1259420183.18494" 
    capture_lex $P140
    .const 'Sub' $P133 = "36_1259420183.18494" 
    capture_lex $P133
    .const 'Sub' $P114 = "31_1259420183.18494" 
    capture_lex $P114
    .const 'Sub' $P101 = "28_1259420183.18494" 
    capture_lex $P101
    .const 'Sub' $P94 = "26_1259420183.18494" 
    capture_lex $P94
    .const 'Sub' $P82 = "24_1259420183.18494" 
    capture_lex $P82
    .const 'Sub' $P75 = "22_1259420183.18494" 
    capture_lex $P75
    .const 'Sub' $P63 = "20_1259420183.18494" 
    capture_lex $P63
    .const 'Sub' $P56 = "18_1259420183.18494" 
    capture_lex $P56
    .const 'Sub' $P46 = "15_1259420183.18494" 
    capture_lex $P46
    .const 'Sub' $P38 = "13_1259420183.18494" 
    capture_lex $P38
    .const 'Sub' $P15 = "12_1259420183.18494" 
    capture_lex $P15
    .const 'Sub' $P571 = "156_1259420183.18494" 
    capture_lex $P571
    .return ($P571)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "obs"  :subid("12_1259420183.18494") :method :outer("11_1259420183.18494")
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
    concat $P35, $P34, " instead"
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
.sub "ws"  :subid("13_1259420183.18494") :method :outer("11_1259420183.18494")
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
.sub "!PREFIX__ws"  :subid("14_1259420183.18494") :method
.annotate "line", 3
    new $P41, "ResizablePMCArray"
    push $P41, ""
    .return ($P41)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "normspace"  :subid("15_1259420183.18494") :method :outer("11_1259420183.18494")
.annotate "line", 3
    .const 'Sub' $P52 = "17_1259420183.18494" 
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
    .const 'Sub' $P52 = "17_1259420183.18494" 
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
.sub "!PREFIX__normspace"  :subid("16_1259420183.18494") :method
.annotate "line", 3
    new $P49, "ResizablePMCArray"
    push $P49, ""
    .return ($P49)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block51"  :anon :subid("17_1259420183.18494") :method :outer("15_1259420183.18494")
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
.sub "arg"  :subid("18_1259420183.18494") :method :outer("11_1259420183.18494")
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
.sub "!PREFIX__arg"  :subid("19_1259420183.18494") :method
.annotate "line", 3
    new $P59, "ResizablePMCArray"
    push $P59, ""
    push $P59, "\""
    push $P59, "'"
    .return ($P59)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "arglist"  :subid("20_1259420183.18494") :method :outer("11_1259420183.18494")
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
.sub "!PREFIX__arglist"  :subid("21_1259420183.18494") :method
.annotate "line", 3
    new $P66, "ResizablePMCArray"
    push $P66, ""
    .return ($P66)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "TOP"  :subid("22_1259420183.18494") :method :outer("11_1259420183.18494")
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
.sub "!PREFIX__TOP"  :subid("23_1259420183.18494") :method
.annotate "line", 3
    $P78 = self."!PREFIX__!subrule"("nibbler", "")
    new $P79, "ResizablePMCArray"
    push $P79, $P78
    .return ($P79)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "nibbler"  :subid("24_1259420183.18494") :method :outer("11_1259420183.18494")
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
.sub "!PREFIX__nibbler"  :subid("25_1259420183.18494") :method
.annotate "line", 3
    new $P85, "ResizablePMCArray"
    push $P85, ""
    .return ($P85)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "termish"  :subid("26_1259420183.18494") :method :outer("11_1259420183.18494")
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
.sub "!PREFIX__termish"  :subid("27_1259420183.18494") :method
.annotate "line", 3
    new $P97, "ResizablePMCArray"
    push $P97, ""
    .return ($P97)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantified_atom"  :subid("28_1259420183.18494") :method :outer("11_1259420183.18494")
.annotate "line", 3
    .const 'Sub' $P110 = "30_1259420183.18494" 
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
    .const 'Sub' $P110 = "30_1259420183.18494" 
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
.sub "!PREFIX__quantified_atom"  :subid("29_1259420183.18494") :method
.annotate "line", 3
    $P104 = self."!PREFIX__!subrule"("atom", "")
    new $P105, "ResizablePMCArray"
    push $P105, $P104
    .return ($P105)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block109"  :anon :subid("30_1259420183.18494") :method :outer("28_1259420183.18494")
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
.sub "atom"  :subid("31_1259420183.18494") :method :outer("11_1259420183.18494")
.annotate "line", 3
    .const 'Sub' $P125 = "33_1259420183.18494" 
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
    .const 'Sub' $P125 = "33_1259420183.18494" 
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
.sub "!PREFIX__atom"  :subid("32_1259420183.18494") :method
.annotate "line", 3
    $P117 = self."!PREFIX__!subrule"("metachar", "")
    new $P118, "ResizablePMCArray"
    push $P118, $P117
    push $P118, ""
    .return ($P118)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block124"  :anon :subid("33_1259420183.18494") :method :outer("31_1259420183.18494")
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
.sub "quantifier"  :subid("34_1259420183.18494") :method
.annotate "line", 52
    $P130 = self."!protoregex"("quantifier")
    .return ($P130)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier"  :subid("35_1259420183.18494") :method
.annotate "line", 52
    $P132 = self."!PREFIX__!protoregex"("quantifier")
    .return ($P132)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<*>"  :subid("36_1259420183.18494") :method :outer("11_1259420183.18494")
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
.sub "!PREFIX__quantifier:sym<*>"  :subid("37_1259420183.18494") :method
.annotate "line", 3
    $P136 = self."!PREFIX__!subrule"("backmod", "*")
    new $P137, "ResizablePMCArray"
    push $P137, $P136
    .return ($P137)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<+>"  :subid("38_1259420183.18494") :method :outer("11_1259420183.18494")
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
.sub "!PREFIX__quantifier:sym<+>"  :subid("39_1259420183.18494") :method
.annotate "line", 3
    $P143 = self."!PREFIX__!subrule"("backmod", "+")
    new $P144, "ResizablePMCArray"
    push $P144, $P143
    .return ($P144)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<?>"  :subid("40_1259420183.18494") :method :outer("11_1259420183.18494")
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
.sub "!PREFIX__quantifier:sym<?>"  :subid("41_1259420183.18494") :method
.annotate "line", 3
    $P150 = self."!PREFIX__!subrule"("backmod", "?")
    new $P151, "ResizablePMCArray"
    push $P151, $P150
    .return ($P151)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<**>"  :subid("42_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 66
  # rx rxquantr162 ** 0..1
    set_addr $I165, rxquantr162_done
    rx155_cur."!mark_push"(0, rx155_pos, $I165)
  rxquantr162_loop:
.annotate "line", 60
  # rx literal  ".."
    add $I11, rx155_pos, 2
    gt $I11, rx155_eos, rx155_fail
    sub $I11, rx155_pos, rx155_off
    substr $S10, rx155_tgt, $I11, 2
    ne $S10, "..", rx155_fail
    add rx155_pos, 2
.annotate "line", 61
  # rx subcapture "max"
    set_addr $I10, rxcap_164_fail
    rx155_cur."!mark_push"(0, rx155_pos, $I10)
  alt163_0:
    set_addr $I10, alt163_1
    rx155_cur."!mark_push"(0, rx155_pos, $I10)
.annotate "line", 62
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
.annotate "line", 63
  # rx literal  "*"
    add $I11, rx155_pos, 1
    gt $I11, rx155_eos, rx155_fail
    sub $I11, rx155_pos, rx155_off
    substr $S10, rx155_tgt, $I11, 1
    ne $S10, "*", rx155_fail
    add rx155_pos, 1
    goto alt163_end
  alt163_2:
.annotate "line", 64
  # rx subrule "panic" subtype=method negate=
    rx155_cur."!cursor_pos"(rx155_pos)
    $P10 = rx155_cur."panic"("Only integers or '*' allowed as range quantifier endpoint")
    unless $P10, rx155_fail
    rx155_pos = $P10."pos"()
  alt163_end:
.annotate "line", 61
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
.annotate "line", 66
    (rx155_rep) = rx155_cur."!mark_commit"($I165)
  rxquantr162_done:
.annotate "line", 59
    goto alt160_end
  alt160_1:
.annotate "line", 67
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
.sub "!PREFIX__quantifier:sym<**>"  :subid("43_1259420183.18494") :method
.annotate "line", 3
    new $P157, "ResizablePMCArray"
    push $P157, "**"
    .return ($P157)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backmod"  :subid("44_1259420183.18494") :method :outer("11_1259420183.18494")
.annotate "line", 3
    .const 'Sub' $P175 = "46_1259420183.18494" 
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
.annotate "line", 71
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
    .const 'Sub' $P175 = "46_1259420183.18494" 
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
.sub "!PREFIX__backmod"  :subid("45_1259420183.18494") :method
.annotate "line", 3
    new $P169, "ResizablePMCArray"
    push $P169, ""
    .return ($P169)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block174"  :anon :subid("46_1259420183.18494") :method :outer("44_1259420183.18494")
.annotate "line", 71
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
.sub "metachar"  :subid("47_1259420183.18494") :method
.annotate "line", 73
    $P179 = self."!protoregex"("metachar")
    .return ($P179)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar"  :subid("48_1259420183.18494") :method
.annotate "line", 73
    $P181 = self."!PREFIX__!protoregex"("metachar")
    .return ($P181)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<ws>"  :subid("49_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 74
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
.sub "!PREFIX__metachar:sym<ws>"  :subid("50_1259420183.18494") :method
.annotate "line", 3
    $P185 = self."!PREFIX__!subrule"("", "")
    new $P186, "ResizablePMCArray"
    push $P186, $P185
    .return ($P186)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<[ ]>"  :subid("51_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 75
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
.sub "!PREFIX__metachar:sym<[ ]>"  :subid("52_1259420183.18494") :method
.annotate "line", 3
    $P191 = self."!PREFIX__!subrule"("nibbler", "[")
    new $P192, "ResizablePMCArray"
    push $P192, $P191
    .return ($P192)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<( )>"  :subid("53_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 76
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
.sub "!PREFIX__metachar:sym<( )>"  :subid("54_1259420183.18494") :method
.annotate "line", 3
    $P197 = self."!PREFIX__!subrule"("nibbler", "(")
    new $P198, "ResizablePMCArray"
    push $P198, $P197
    .return ($P198)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<'>"  :subid("55_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 77
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
.sub "!PREFIX__metachar:sym<'>"  :subid("56_1259420183.18494") :method
.annotate "line", 3
    new $P203, "ResizablePMCArray"
    push $P203, "'"
    .return ($P203)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<\">"  :subid("57_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 78
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
.sub "!PREFIX__metachar:sym<\">"  :subid("58_1259420183.18494") :method
.annotate "line", 3
    new $P208, "ResizablePMCArray"
    push $P208, "\""
    .return ($P208)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<.>"  :subid("59_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 79
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
.sub "!PREFIX__metachar:sym<.>"  :subid("60_1259420183.18494") :method
.annotate "line", 3
    new $P213, "ResizablePMCArray"
    push $P213, "."
    .return ($P213)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^>"  :subid("61_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 80
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
.sub "!PREFIX__metachar:sym<^>"  :subid("62_1259420183.18494") :method
.annotate "line", 3
    new $P219, "ResizablePMCArray"
    push $P219, "^"
    .return ($P219)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^^>"  :subid("63_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 81
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
.sub "!PREFIX__metachar:sym<^^>"  :subid("64_1259420183.18494") :method
.annotate "line", 3
    new $P225, "ResizablePMCArray"
    push $P225, "^^"
    .return ($P225)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$>"  :subid("65_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 82
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
.sub "!PREFIX__metachar:sym<$>"  :subid("66_1259420183.18494") :method
.annotate "line", 3
    new $P231, "ResizablePMCArray"
    push $P231, "$"
    .return ($P231)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$$>"  :subid("67_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 83
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
.sub "!PREFIX__metachar:sym<$$>"  :subid("68_1259420183.18494") :method
.annotate "line", 3
    new $P237, "ResizablePMCArray"
    push $P237, "$$"
    .return ($P237)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<:::>"  :subid("69_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 84
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
.sub "!PREFIX__metachar:sym<:::>"  :subid("70_1259420183.18494") :method
.annotate "line", 3
    $P243 = self."!PREFIX__!subrule"("", ":::")
    new $P244, "ResizablePMCArray"
    push $P244, $P243
    .return ($P244)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<::>"  :subid("71_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 85
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
.sub "!PREFIX__metachar:sym<::>"  :subid("72_1259420183.18494") :method
.annotate "line", 3
    $P250 = self."!PREFIX__!subrule"("", "::")
    new $P251, "ResizablePMCArray"
    push $P251, $P250
    .return ($P251)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<lwb>"  :subid("73_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 86
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
.sub "!PREFIX__metachar:sym<lwb>"  :subid("74_1259420183.18494") :method
.annotate "line", 3
    new $P257, "ResizablePMCArray"
    push $P257, unicode:"\x{ab}"
    push $P257, "<<"
    .return ($P257)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<rwb>"  :subid("75_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 87
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
.sub "!PREFIX__metachar:sym<rwb>"  :subid("76_1259420183.18494") :method
.annotate "line", 3
    new $P264, "ResizablePMCArray"
    push $P264, unicode:"\x{bb}"
    push $P264, ">>"
    .return ($P264)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<bs>"  :subid("77_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 88
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
.sub "!PREFIX__metachar:sym<bs>"  :subid("78_1259420183.18494") :method
.annotate "line", 3
    $P271 = self."!PREFIX__!subrule"("backslash", "\\")
    new $P272, "ResizablePMCArray"
    push $P272, $P271
    .return ($P272)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<mod>"  :subid("79_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 89
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
.sub "!PREFIX__metachar:sym<mod>"  :subid("80_1259420183.18494") :method
.annotate "line", 3
    $P277 = self."!PREFIX__!subrule"("mod_internal", "")
    new $P278, "ResizablePMCArray"
    push $P278, $P277
    .return ($P278)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<~>"  :subid("81_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 93
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
.annotate "line", 94
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
.annotate "line", 95
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
.annotate "line", 92
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
.sub "!PREFIX__metachar:sym<~>"  :subid("82_1259420183.18494") :method
.annotate "line", 3
    $P283 = self."!PREFIX__!subrule"("", "~")
    new $P284, "ResizablePMCArray"
    push $P284, $P283
    .return ($P284)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<{*}>"  :subid("83_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 99
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
.annotate "line", 100
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
.annotate "line", 98
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
.sub "!PREFIX__metachar:sym<{*}>"  :subid("84_1259420183.18494") :method
.annotate "line", 3
    new $P290, "ResizablePMCArray"
    push $P290, "{*}"
    .return ($P290)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<assert>"  :subid("85_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 103
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
.annotate "line", 104
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
.annotate "line", 102
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
.sub "!PREFIX__metachar:sym<assert>"  :subid("86_1259420183.18494") :method
.annotate "line", 3
    $P307 = self."!PREFIX__!subrule"("assertion", "<")
    new $P308, "ResizablePMCArray"
    push $P308, $P307
    .return ($P308)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<var>"  :subid("87_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 108
    set_addr $I10, alt316_1
    rx312_cur."!mark_push"(0, rx312_pos, $I10)
.annotate "line", 109
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
.annotate "line", 110
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
.annotate "line", 113
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
.annotate "line", 107
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
.sub "!PREFIX__metachar:sym<var>"  :subid("88_1259420183.18494") :method
.annotate "line", 3
    new $P314, "ResizablePMCArray"
    push $P314, "$"
    push $P314, "$<"
    .return ($P314)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<PIR>"  :subid("89_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 117
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
.annotate "line", 116
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
.sub "!PREFIX__metachar:sym<PIR>"  :subid("90_1259420183.18494") :method
.annotate "line", 3
    new $P326, "ResizablePMCArray"
    push $P326, ":PIR{{"
    .return ($P326)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash"  :subid("91_1259420183.18494") :method
.annotate "line", 120
    $P332 = self."!protoregex"("backslash")
    .return ($P332)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash"  :subid("92_1259420183.18494") :method
.annotate "line", 120
    $P334 = self."!PREFIX__!protoregex"("backslash")
    .return ($P334)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<w>"  :subid("93_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 121
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
.sub "!PREFIX__backslash:sym<w>"  :subid("94_1259420183.18494") :method
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
.sub "backslash:sym<b>"  :subid("95_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 122
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
.sub "!PREFIX__backslash:sym<b>"  :subid("96_1259420183.18494") :method
.annotate "line", 3
    new $P344, "ResizablePMCArray"
    push $P344, "B"
    push $P344, "b"
    .return ($P344)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<e>"  :subid("97_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 123
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
.sub "!PREFIX__backslash:sym<e>"  :subid("98_1259420183.18494") :method
.annotate "line", 3
    new $P350, "ResizablePMCArray"
    push $P350, "E"
    push $P350, "e"
    .return ($P350)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<f>"  :subid("99_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 124
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
.sub "!PREFIX__backslash:sym<f>"  :subid("100_1259420183.18494") :method
.annotate "line", 3
    new $P356, "ResizablePMCArray"
    push $P356, "F"
    push $P356, "f"
    .return ($P356)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<h>"  :subid("101_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 125
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
.sub "!PREFIX__backslash:sym<h>"  :subid("102_1259420183.18494") :method
.annotate "line", 3
    new $P362, "ResizablePMCArray"
    push $P362, "H"
    push $P362, "h"
    .return ($P362)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<r>"  :subid("103_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 126
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
.sub "!PREFIX__backslash:sym<r>"  :subid("104_1259420183.18494") :method
.annotate "line", 3
    new $P368, "ResizablePMCArray"
    push $P368, "R"
    push $P368, "r"
    .return ($P368)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<t>"  :subid("105_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 127
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
.sub "!PREFIX__backslash:sym<t>"  :subid("106_1259420183.18494") :method
.annotate "line", 3
    new $P374, "ResizablePMCArray"
    push $P374, "T"
    push $P374, "t"
    .return ($P374)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<v>"  :subid("107_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 128
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
.sub "!PREFIX__backslash:sym<v>"  :subid("108_1259420183.18494") :method
.annotate "line", 3
    new $P380, "ResizablePMCArray"
    push $P380, "V"
    push $P380, "v"
    .return ($P380)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<c>"  :subid("109_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 129
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
.sub "!PREFIX__backslash:sym<c>"  :subid("110_1259420183.18494") :method
.annotate "line", 3
    $P386 = self."!PREFIX__!subrule"("charspec", "C")
    $P387 = self."!PREFIX__!subrule"("charspec", "c")
    new $P388, "ResizablePMCArray"
    push $P388, $P386
    push $P388, $P387
    .return ($P388)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<o>"  :subid("111_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 130
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
.sub "!PREFIX__backslash:sym<o>"  :subid("112_1259420183.18494") :method
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
.sub "backslash:sym<x>"  :subid("113_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 131
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
.sub "!PREFIX__backslash:sym<x>"  :subid("114_1259420183.18494") :method
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
.sub "backslash:sym<A>"  :subid("115_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 132
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
.sub "!PREFIX__backslash:sym<A>"  :subid("116_1259420183.18494") :method
.annotate "line", 3
    $P416 = self."!PREFIX__!subrule"("", "A")
    new $P417, "ResizablePMCArray"
    push $P417, $P416
    .return ($P417)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<z>"  :subid("117_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 133
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
.sub "!PREFIX__backslash:sym<z>"  :subid("118_1259420183.18494") :method
.annotate "line", 3
    $P422 = self."!PREFIX__!subrule"("", "z")
    new $P423, "ResizablePMCArray"
    push $P423, $P422
    .return ($P423)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Z>"  :subid("119_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 134
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
.sub "!PREFIX__backslash:sym<Z>"  :subid("120_1259420183.18494") :method
.annotate "line", 3
    $P428 = self."!PREFIX__!subrule"("", "Z")
    new $P429, "ResizablePMCArray"
    push $P429, $P428
    .return ($P429)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Q>"  :subid("121_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 135
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
.sub "!PREFIX__backslash:sym<Q>"  :subid("122_1259420183.18494") :method
.annotate "line", 3
    $P434 = self."!PREFIX__!subrule"("", "Q")
    new $P435, "ResizablePMCArray"
    push $P435, $P434
    .return ($P435)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<misc>"  :subid("123_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 136
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
.sub "!PREFIX__backslash:sym<misc>"  :subid("124_1259420183.18494") :method
.annotate "line", 3
    new $P440, "ResizablePMCArray"
    push $P440, ""
    .return ($P440)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion"  :subid("125_1259420183.18494") :method
.annotate "line", 138
    $P443 = self."!protoregex"("assertion")
    .return ($P443)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion"  :subid("126_1259420183.18494") :method
.annotate "line", 138
    $P445 = self."!PREFIX__!protoregex"("assertion")
    .return ($P445)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<?>"  :subid("127_1259420183.18494") :method :outer("11_1259420183.18494")
.annotate "line", 3
    .const 'Sub' $P454 = "129_1259420183.18494" 
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
.annotate "line", 140
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
    .const 'Sub' $P454 = "129_1259420183.18494" 
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
.sub "!PREFIX__assertion:sym<?>"  :subid("128_1259420183.18494") :method
.annotate "line", 3
    $P449 = self."!PREFIX__!subrule"("assertion", "?")
    new $P450, "ResizablePMCArray"
    push $P450, $P449
    push $P450, "?"
    .return ($P450)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block453"  :anon :subid("129_1259420183.18494") :method :outer("127_1259420183.18494")
.annotate "line", 140
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
.sub "assertion:sym<!>"  :subid("130_1259420183.18494") :method :outer("11_1259420183.18494")
.annotate "line", 3
    .const 'Sub' $P465 = "132_1259420183.18494" 
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
.annotate "line", 141
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
    .const 'Sub' $P465 = "132_1259420183.18494" 
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
.sub "!PREFIX__assertion:sym<!>"  :subid("131_1259420183.18494") :method
.annotate "line", 3
    $P460 = self."!PREFIX__!subrule"("assertion", "!")
    new $P461, "ResizablePMCArray"
    push $P461, $P460
    push $P461, "!"
    .return ($P461)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block464"  :anon :subid("132_1259420183.18494") :method :outer("130_1259420183.18494")
.annotate "line", 141
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
.sub "assertion:sym<method>"  :subid("133_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 144
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
.annotate "line", 143
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
.sub "!PREFIX__assertion:sym<method>"  :subid("134_1259420183.18494") :method
.annotate "line", 3
    $P471 = self."!PREFIX__!subrule"("assertion", ".")
    new $P472, "ResizablePMCArray"
    push $P472, $P471
    .return ($P472)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<name>"  :subid("135_1259420183.18494") :method :outer("11_1259420183.18494")
.annotate "line", 3
    .const 'Sub' $P483 = "137_1259420183.18494" 
    capture_lex $P483
    .local string rx475_tgt
    .local int rx475_pos
    .local int rx475_off
    .local int rx475_eos
    .local int rx475_rep
    .local pmc rx475_cur
    (rx475_cur, rx475_pos, rx475_tgt) = self."!cursor_start"()
    rx475_cur."!cursor_debug"("START ", "assertion:sym<name>")
    rx475_cur."!cursor_caparray"("nibbler", "arglist", "assertion")
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
.annotate "line", 148
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
.annotate "line", 155
  # rx rxquantr480 ** 0..1
    set_addr $I486, rxquantr480_done
    rx475_cur."!mark_push"(0, rx475_pos, $I486)
  rxquantr480_loop:
  alt481_0:
.annotate "line", 149
    set_addr $I10, alt481_1
    rx475_cur."!mark_push"(0, rx475_pos, $I10)
.annotate "line", 150
  # rx subrule "before" subtype=zerowidth negate=
    rx475_cur."!cursor_pos"(rx475_pos)
    .const 'Sub' $P483 = "137_1259420183.18494" 
    capture_lex $P483
    $P10 = rx475_cur."before"($P483)
    unless $P10, rx475_fail
    goto alt481_end
  alt481_1:
    set_addr $I10, alt481_2
    rx475_cur."!mark_push"(0, rx475_pos, $I10)
.annotate "line", 151
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
.annotate "line", 152
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
.annotate "line", 153
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
.annotate "line", 154
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
.annotate "line", 155
    (rx475_rep) = rx475_cur."!mark_commit"($I486)
  rxquantr480_done:
.annotate "line", 147
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
.sub "!PREFIX__assertion:sym<name>"  :subid("136_1259420183.18494") :method
.annotate "line", 3
    new $P477, "ResizablePMCArray"
    push $P477, ""
    .return ($P477)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block482"  :anon :subid("137_1259420183.18494") :method :outer("135_1259420183.18494")
.annotate "line", 150
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
.sub "assertion:sym<[>"  :subid("138_1259420183.18494") :method :outer("11_1259420183.18494")
.annotate "line", 3
    .const 'Sub' $P493 = "140_1259420183.18494" 
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
.annotate "line", 158
  # rx subrule "before" subtype=zerowidth negate=
    rx488_cur."!cursor_pos"(rx488_pos)
    .const 'Sub' $P493 = "140_1259420183.18494" 
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
.sub "!PREFIX__assertion:sym<[>"  :subid("139_1259420183.18494") :method
.annotate "line", 3
    new $P490, "ResizablePMCArray"
    push $P490, ""
    .return ($P490)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block492"  :anon :subid("140_1259420183.18494") :method :outer("138_1259420183.18494")
.annotate "line", 158
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
.sub "cclass_elem"  :subid("141_1259420183.18494") :method :outer("11_1259420183.18494")
.annotate "line", 3
    .const 'Sub' $P511 = "143_1259420183.18494" 
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
.annotate "line", 161
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
.annotate "line", 162
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
.annotate "line", 163
    set_addr $I10, alt508_1
    rx500_cur."!mark_push"(0, rx500_pos, $I10)
.annotate "line", 164
  # rx literal  "["
    add $I11, rx500_pos, 1
    gt $I11, rx500_eos, rx500_fail
    sub $I11, rx500_pos, rx500_off
    substr $S10, rx500_tgt, $I11, 1
    ne $S10, "[", rx500_fail
    add rx500_pos, 1
.annotate "line", 167
  # rx rxquantr509 ** 0..*
    set_addr $I530, rxquantr509_done
    rx500_cur."!mark_push"(0, rx500_pos, $I530)
  rxquantr509_loop:
.annotate "line", 164
  # rx subrule $P511 subtype=capture negate=
    rx500_cur."!cursor_pos"(rx500_pos)
    .const 'Sub' $P511 = "143_1259420183.18494" 
    capture_lex $P511
    $P10 = rx500_cur.$P511()
    unless $P10, rx500_fail
    rx500_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charspec")
    rx500_pos = $P10."pos"()
.annotate "line", 167
    (rx500_rep) = rx500_cur."!mark_commit"($I530)
    rx500_cur."!mark_push"(rx500_rep, rx500_pos, $I530)
    goto rxquantr509_loop
  rxquantr509_done:
.annotate "line", 168
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
.annotate "line", 164
    goto alt508_end
  alt508_1:
.annotate "line", 169
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
.annotate "line", 171
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
.annotate "line", 160
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
.sub "!PREFIX__cclass_elem"  :subid("142_1259420183.18494") :method
.annotate "line", 3
    new $P502, "ResizablePMCArray"
    push $P502, ""
    push $P502, "-"
    push $P502, "+"
    .return ($P502)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block510"  :anon :subid("143_1259420183.18494") :method :outer("141_1259420183.18494")
.annotate "line", 164
    .const 'Sub' $P526 = "146_1259420183.18494" 
    capture_lex $P526
    .const 'Sub' $P521 = "145_1259420183.18494" 
    capture_lex $P521
    .const 'Sub' $P517 = "144_1259420183.18494" 
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
.annotate "line", 165
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
.annotate "line", 166
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
    .const 'Sub' $P517 = "144_1259420183.18494" 
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
    .const 'Sub' $P521 = "145_1259420183.18494" 
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
    .const 'Sub' $P526 = "146_1259420183.18494" 
    capture_lex $P526
    $P10 = rx512_cur.$P526()
    unless $P10, rx512_fail
    rx512_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("1")
    rx512_pos = $P10."pos"()
    (rx512_rep) = rx512_cur."!mark_commit"($I529)
  rxquantr524_done:
  alt514_end:
.annotate "line", 164
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
.sub "_block516"  :anon :subid("144_1259420183.18494") :method :outer("143_1259420183.18494")
.annotate "line", 166
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
.sub "_block520"  :anon :subid("145_1259420183.18494") :method :outer("143_1259420183.18494")
.annotate "line", 166
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
.sub "_block525"  :anon :subid("146_1259420183.18494") :method :outer("143_1259420183.18494")
.annotate "line", 166
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
.sub "mod_internal"  :subid("147_1259420183.18494") :method :outer("11_1259420183.18494")
.annotate "line", 3
    .const 'Sub' $P543 = "149_1259420183.18494" 
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
.annotate "line", 175
    set_addr $I10, alt540_1
    rx535_cur."!mark_push"(0, rx535_pos, $I10)
.annotate "line", 176
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
    .const 'Sub' $P543 = "149_1259420183.18494" 
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
.annotate "line", 177
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
.annotate "line", 174
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
.sub "!PREFIX__mod_internal"  :subid("148_1259420183.18494") :method
.annotate "line", 3
    $P537 = self."!PREFIX__!subrule"("mod_ident", ":")
    new $P538, "ResizablePMCArray"
    push $P538, $P537
    push $P538, ":"
    .return ($P538)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block542"  :anon :subid("149_1259420183.18494") :method :outer("147_1259420183.18494")
.annotate "line", 176
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
.sub "mod_ident"  :subid("150_1259420183.18494") :method
.annotate "line", 181
    $P552 = self."!protoregex"("mod_ident")
    .return ($P552)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident"  :subid("151_1259420183.18494") :method
.annotate "line", 181
    $P554 = self."!PREFIX__!protoregex"("mod_ident")
    .return ($P554)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ignorecase>"  :subid("152_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 182
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
.sub "!PREFIX__mod_ident:sym<ignorecase>"  :subid("153_1259420183.18494") :method
.annotate "line", 3
    new $P558, "ResizablePMCArray"
    push $P558, "i"
    .return ($P558)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ratchet>"  :subid("154_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 183
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
.sub "!PREFIX__mod_ident:sym<ratchet>"  :subid("155_1259420183.18494") :method
.annotate "line", 3
    new $P566, "ResizablePMCArray"
    push $P566, "r"
    .return ($P566)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<sigspace>"  :subid("156_1259420183.18494") :method :outer("11_1259420183.18494")
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
.annotate "line", 184
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
.sub "!PREFIX__mod_ident:sym<sigspace>"  :subid("157_1259420183.18494") :method
.annotate "line", 3
    new $P574, "ResizablePMCArray"
    push $P574, "s"
    .return ($P574)
.end

### .include 'gen/p6regex-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1259420187.47956")
.annotate "line", 0
    get_hll_global $P14, ["Regex";"P6Regex";"Actions"], "_block13" 
    capture_lex $P14
.annotate "line", 4
    get_hll_global $P14, ["Regex";"P6Regex";"Actions"], "_block13" 
    capture_lex $P14
    $P1566 = $P14()
.annotate "line", 1
    .return ($P1566)
.end


.namespace []
.sub "" :load :init :subid("post89") :outer("10_1259420187.47956")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1259420187.47956" 
    .local pmc block
    set block, $P12
    $P1567 = get_root_global ["parrot"], "P6metaclass"
    $P1567."new_class"("Regex::P6Regex::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block13"  :subid("11_1259420187.47956") :outer("10_1259420187.47956")
.annotate "line", 4
    .const 'Sub' $P1533 = "88_1259420187.47956" 
    capture_lex $P1533
    .const 'Sub' $P1464 = "84_1259420187.47956" 
    capture_lex $P1464
    .const 'Sub' $P1396 = "82_1259420187.47956" 
    capture_lex $P1396
    .const 'Sub' $P1323 = "79_1259420187.47956" 
    capture_lex $P1323
    .const 'Sub' $P1309 = "78_1259420187.47956" 
    capture_lex $P1309
    .const 'Sub' $P1285 = "77_1259420187.47956" 
    capture_lex $P1285
    .const 'Sub' $P1267 = "76_1259420187.47956" 
    capture_lex $P1267
    .const 'Sub' $P1253 = "75_1259420187.47956" 
    capture_lex $P1253
    .const 'Sub' $P1222 = "74_1259420187.47956" 
    capture_lex $P1222
    .const 'Sub' $P1191 = "73_1259420187.47956" 
    capture_lex $P1191
    .const 'Sub' $P1175 = "72_1259420187.47956" 
    capture_lex $P1175
    .const 'Sub' $P1159 = "71_1259420187.47956" 
    capture_lex $P1159
    .const 'Sub' $P1143 = "70_1259420187.47956" 
    capture_lex $P1143
    .const 'Sub' $P1127 = "69_1259420187.47956" 
    capture_lex $P1127
    .const 'Sub' $P1111 = "68_1259420187.47956" 
    capture_lex $P1111
    .const 'Sub' $P1095 = "67_1259420187.47956" 
    capture_lex $P1095
    .const 'Sub' $P1079 = "66_1259420187.47956" 
    capture_lex $P1079
    .const 'Sub' $P1055 = "65_1259420187.47956" 
    capture_lex $P1055
    .const 'Sub' $P1040 = "64_1259420187.47956" 
    capture_lex $P1040
    .const 'Sub' $P984 = "63_1259420187.47956" 
    capture_lex $P984
    .const 'Sub' $P963 = "62_1259420187.47956" 
    capture_lex $P963
    .const 'Sub' $P941 = "61_1259420187.47956" 
    capture_lex $P941
    .const 'Sub' $P931 = "60_1259420187.47956" 
    capture_lex $P931
    .const 'Sub' $P921 = "59_1259420187.47956" 
    capture_lex $P921
    .const 'Sub' $P911 = "58_1259420187.47956" 
    capture_lex $P911
    .const 'Sub' $P899 = "57_1259420187.47956" 
    capture_lex $P899
    .const 'Sub' $P887 = "56_1259420187.47956" 
    capture_lex $P887
    .const 'Sub' $P875 = "55_1259420187.47956" 
    capture_lex $P875
    .const 'Sub' $P863 = "54_1259420187.47956" 
    capture_lex $P863
    .const 'Sub' $P851 = "53_1259420187.47956" 
    capture_lex $P851
    .const 'Sub' $P839 = "52_1259420187.47956" 
    capture_lex $P839
    .const 'Sub' $P827 = "51_1259420187.47956" 
    capture_lex $P827
    .const 'Sub' $P815 = "50_1259420187.47956" 
    capture_lex $P815
    .const 'Sub' $P792 = "49_1259420187.47956" 
    capture_lex $P792
    .const 'Sub' $P769 = "48_1259420187.47956" 
    capture_lex $P769
    .const 'Sub' $P751 = "47_1259420187.47956" 
    capture_lex $P751
    .const 'Sub' $P741 = "46_1259420187.47956" 
    capture_lex $P741
    .const 'Sub' $P723 = "45_1259420187.47956" 
    capture_lex $P723
    .const 'Sub' $P676 = "44_1259420187.47956" 
    capture_lex $P676
    .const 'Sub' $P659 = "43_1259420187.47956" 
    capture_lex $P659
    .const 'Sub' $P644 = "42_1259420187.47956" 
    capture_lex $P644
    .const 'Sub' $P629 = "41_1259420187.47956" 
    capture_lex $P629
    .const 'Sub' $P603 = "40_1259420187.47956" 
    capture_lex $P603
    .const 'Sub' $P553 = "38_1259420187.47956" 
    capture_lex $P553
    .const 'Sub' $P485 = "36_1259420187.47956" 
    capture_lex $P485
    .const 'Sub' $P428 = "33_1259420187.47956" 
    capture_lex $P428
    .const 'Sub' $P413 = "32_1259420187.47956" 
    capture_lex $P413
    .const 'Sub' $P387 = "30_1259420187.47956" 
    capture_lex $P387
    .const 'Sub' $P370 = "29_1259420187.47956" 
    capture_lex $P370
    .const 'Sub' $P348 = "28_1259420187.47956" 
    capture_lex $P348
    .const 'Sub' $P316 = "27_1259420187.47956" 
    capture_lex $P316
    .const 'Sub' $P54 = "14_1259420187.47956" 
    capture_lex $P54
    .const 'Sub' $P21 = "13_1259420187.47956" 
    capture_lex $P21
    .const 'Sub' $P16 = "12_1259420187.47956" 
    capture_lex $P16
    get_global $P15, "@MODIFIERS"
    unless_null $P15, vivify_90
    new $P15, "ResizablePMCArray"
    set_global "@MODIFIERS", $P15
  vivify_90:
.annotate "line", 6
    .const 'Sub' $P16 = "12_1259420187.47956" 
    capture_lex $P16
    .lex "INIT", $P16
.annotate "line", 475
    .const 'Sub' $P21 = "13_1259420187.47956" 
    capture_lex $P21
    .lex "buildsub", $P21
.annotate "line", 492
    .const 'Sub' $P54 = "14_1259420187.47956" 
    capture_lex $P54
    .lex "capnames", $P54
.annotate "line", 558
    .const 'Sub' $P316 = "27_1259420187.47956" 
    capture_lex $P316
    .lex "backmod", $P316
.annotate "line", 565
    .const 'Sub' $P348 = "28_1259420187.47956" 
    capture_lex $P348
    .lex "subrule_alias", $P348
.annotate "line", 4
    get_global $P368, "@MODIFIERS"
    find_lex $P369, "INIT"
.annotate "line", 468
    find_lex $P1562, "buildsub"
    find_lex $P1563, "capnames"
    find_lex $P1564, "backmod"
    find_lex $P1565, "subrule_alias"
.annotate "line", 4
    .return ($P1565)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "INIT"  :subid("12_1259420187.47956") :outer("11_1259420187.47956")
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
.sub "buildsub"  :subid("13_1259420187.47956") :outer("11_1259420187.47956")
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
    find_lex $P42, "$block"
    $P43 = $P42."symbol"(unicode:"$\x{a2}")
    if $P43, unless_41_end
    find_lex $P44, "$block"
    $P44."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
  unless_41_end:
.annotate "line", 486
    find_lex $P46, "$block"
    $P47 = $P46."symbol"("$/")
    if $P47, unless_45_end
    find_lex $P48, "$block"
    $P48."symbol"("$/", "lexical" :named("scope"))
  unless_45_end:
.annotate "line", 487
    find_lex $P49, "$block"
    find_lex $P50, "$rpast"
    $P49."push"($P50)
.annotate "line", 488
    find_lex $P51, "$block"
    $P51."blocktype"("method")
    find_lex $P52, "$block"
.annotate "line", 475
    .return ($P52)
  control_22:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P53, exception, "payload"
    .return ($P53)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "capnames"  :subid("14_1259420187.47956") :outer("11_1259420187.47956")
    .param pmc param_57
    .param pmc param_58
.annotate "line", 492
    .const 'Sub' $P291 = "25_1259420187.47956" 
    capture_lex $P291
    .const 'Sub' $P226 = "22_1259420187.47956" 
    capture_lex $P226
    .const 'Sub' $P182 = "20_1259420187.47956" 
    capture_lex $P182
    .const 'Sub' $P140 = "18_1259420187.47956" 
    capture_lex $P140
    .const 'Sub' $P69 = "15_1259420187.47956" 
    capture_lex $P69
    new $P56, 'ExceptionHandler'
    set_addr $P56, control_55
    $P56."handle_types"(58)
    push_eh $P56
    .lex "$ast", param_57
    .lex "$count", param_58
.annotate "line", 493
    new $P59, "Hash"
    .lex "%capnames", $P59
.annotate "line", 494
    new $P60, "Undef"
    .lex "$pasttype", $P60
.annotate "line", 492
    find_lex $P61, "%capnames"
.annotate "line", 494
    find_lex $P62, "$ast"
    $P63 = $P62."pasttype"()
    store_lex "$pasttype", $P63
.annotate "line", 495
    find_lex $P65, "$pasttype"
    set $S66, $P65
    iseq $I67, $S66, "alt"
    if $I67, if_64
.annotate "line", 508
    find_lex $P131, "$pasttype"
    set $S132, $P131
    iseq $I133, $S132, "concat"
    if $I133, if_130
.annotate "line", 517
    find_lex $P175, "$pasttype"
    set $S176, $P175
    iseq $I177, $S176, "subrule"
    if $I177, if_174
    new $P173, 'Integer'
    set $P173, $I177
    goto if_174_end
  if_174:
    find_lex $P178, "$ast"
    $S179 = $P178."subtype"()
    iseq $I180, $S179, "capture"
    new $P173, 'Integer'
    set $P173, $I180
  if_174_end:
    if $P173, if_172
.annotate "line", 530
    find_lex $P222, "$pasttype"
    set $S223, $P222
    iseq $I224, $S223, "subcapture"
    if $I224, if_221
.annotate "line", 547
    find_lex $P287, "$pasttype"
    set $S288, $P287
    iseq $I289, $S288, "quant"
    unless $I289, if_286_end
    .const 'Sub' $P291 = "25_1259420187.47956" 
    capture_lex $P291
    $P291()
  if_286_end:
    goto if_221_end
  if_221:
.annotate "line", 530
    .const 'Sub' $P226 = "22_1259420187.47956" 
    capture_lex $P226
    $P226()
  if_221_end:
    goto if_172_end
  if_172:
.annotate "line", 517
    .const 'Sub' $P182 = "20_1259420187.47956" 
    capture_lex $P182
    $P182()
  if_172_end:
    goto if_130_end
  if_130:
.annotate "line", 509
    find_lex $P135, "$ast"
    $P136 = $P135."list"()
    defined $I137, $P136
    unless $I137, for_undef_113
    iter $P134, $P136
    new $P170, 'ExceptionHandler'
    set_addr $P170, loop169_handler
    $P170."handle_types"(65, 67, 66)
    push_eh $P170
  loop169_test:
    unless $P134, loop169_done
    shift $P138, $P134
  loop169_redo:
    .const 'Sub' $P140 = "18_1259420187.47956" 
    capture_lex $P140
    $P140($P138)
  loop169_next:
    goto loop169_test
  loop169_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P171, exception, 'type'
    eq $P171, 65, loop169_next
    eq $P171, 67, loop169_redo
  loop169_done:
    pop_eh 
  for_undef_113:
  if_130_end:
.annotate "line", 508
    goto if_64_end
  if_64:
.annotate "line", 495
    .const 'Sub' $P69 = "15_1259420187.47956" 
    capture_lex $P69
    $P69()
  if_64_end:
.annotate "line", 554
    find_lex $P312, "$count"
    find_lex $P313, "%capnames"
    unless_null $P313, vivify_133
    new $P313, "Hash"
    store_lex "%capnames", $P313
  vivify_133:
    set $P313[""], $P312
    find_lex $P314, "%capnames"
.annotate "line", 492
    .return ($P314)
  control_55:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P315, exception, "payload"
    .return ($P315)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block290"  :anon :subid("25_1259420187.47956") :outer("14_1259420187.47956")
.annotate "line", 547
    .const 'Sub' $P302 = "26_1259420187.47956" 
    capture_lex $P302
.annotate "line", 548
    new $P292, "Hash"
    .lex "%astcap", $P292
    find_lex $P293, "$ast"
    unless_null $P293, vivify_93
    new $P293, "ResizablePMCArray"
  vivify_93:
    set $P294, $P293[0]
    unless_null $P294, vivify_94
    new $P294, "Undef"
  vivify_94:
    find_lex $P295, "$count"
    $P296 = "capnames"($P294, $P295)
    store_lex "%astcap", $P296
.annotate "line", 549
    find_lex $P298, "%astcap"
    defined $I299, $P298
    unless $I299, for_undef_95
    iter $P297, $P298
    new $P308, 'ExceptionHandler'
    set_addr $P308, loop307_handler
    $P308."handle_types"(65, 67, 66)
    push_eh $P308
  loop307_test:
    unless $P297, loop307_done
    shift $P300, $P297
  loop307_redo:
    .const 'Sub' $P302 = "26_1259420187.47956" 
    capture_lex $P302
    $P302($P300)
  loop307_next:
    goto loop307_test
  loop307_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P309, exception, 'type'
    eq $P309, 65, loop307_next
    eq $P309, 67, loop307_redo
  loop307_done:
    pop_eh 
  for_undef_95:
.annotate "line", 552
    find_lex $P310, "%astcap"
    unless_null $P310, vivify_97
    new $P310, "Hash"
  vivify_97:
    set $P311, $P310[""]
    unless_null $P311, vivify_98
    new $P311, "Undef"
  vivify_98:
    store_lex "$count", $P311
.annotate "line", 547
    .return ($P311)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block301"  :anon :subid("26_1259420187.47956") :outer("25_1259420187.47956")
    .param pmc param_303
.annotate "line", 549
    .lex "$_", param_303
.annotate "line", 550
    new $P304, "Integer"
    assign $P304, 2
    find_lex $P305, "$_"
    find_lex $P306, "%capnames"
    unless_null $P306, vivify_96
    new $P306, "Hash"
    store_lex "%capnames", $P306
  vivify_96:
    set $P306[$P305], $P304
.annotate "line", 549
    .return ($P304)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block225"  :anon :subid("22_1259420187.47956") :outer("14_1259420187.47956")
.annotate "line", 530
    .const 'Sub' $P268 = "24_1259420187.47956" 
    capture_lex $P268
    .const 'Sub' $P238 = "23_1259420187.47956" 
    capture_lex $P238
.annotate "line", 531
    new $P227, "Undef"
    .lex "$name", $P227
.annotate "line", 532
    new $P228, "ResizablePMCArray"
    .lex "@names", $P228
.annotate "line", 541
    new $P229, "Hash"
    .lex "%x", $P229
.annotate "line", 531
    find_lex $P230, "$ast"
    $P231 = $P230."name"()
    store_lex "$name", $P231
.annotate "line", 532

            $P0 = find_lex '$name'
            $S0 = $P0
            $P232 = split '=', $S0
        
    store_lex "@names", $P232
.annotate "line", 537
    find_lex $P234, "@names"
    defined $I235, $P234
    unless $I235, for_undef_99
    iter $P233, $P234
    new $P257, 'ExceptionHandler'
    set_addr $P257, loop256_handler
    $P257."handle_types"(65, 67, 66)
    push_eh $P257
  loop256_test:
    unless $P233, loop256_done
    shift $P236, $P233
  loop256_redo:
    .const 'Sub' $P238 = "23_1259420187.47956" 
    capture_lex $P238
    $P238($P236)
  loop256_next:
    goto loop256_test
  loop256_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P258, exception, 'type'
    eq $P258, 65, loop256_next
    eq $P258, 67, loop256_redo
  loop256_done:
    pop_eh 
  for_undef_99:
.annotate "line", 541
    find_lex $P259, "$ast"
    unless_null $P259, vivify_101
    new $P259, "ResizablePMCArray"
  vivify_101:
    set $P260, $P259[0]
    unless_null $P260, vivify_102
    new $P260, "Undef"
  vivify_102:
    find_lex $P261, "$count"
    $P262 = "capnames"($P260, $P261)
    store_lex "%x", $P262
.annotate "line", 542
    find_lex $P264, "%x"
    defined $I265, $P264
    unless $I265, for_undef_103
    iter $P263, $P264
    new $P282, 'ExceptionHandler'
    set_addr $P282, loop281_handler
    $P282."handle_types"(65, 67, 66)
    push_eh $P282
  loop281_test:
    unless $P263, loop281_done
    shift $P266, $P263
  loop281_redo:
    .const 'Sub' $P268 = "24_1259420187.47956" 
    capture_lex $P268
    $P268($P266)
  loop281_next:
    goto loop281_test
  loop281_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P283, exception, 'type'
    eq $P283, 65, loop281_next
    eq $P283, 67, loop281_redo
  loop281_done:
    pop_eh 
  for_undef_103:
.annotate "line", 545
    find_lex $P284, "%x"
    unless_null $P284, vivify_109
    new $P284, "Hash"
  vivify_109:
    set $P285, $P284[""]
    unless_null $P285, vivify_110
    new $P285, "Undef"
  vivify_110:
    store_lex "$count", $P285
.annotate "line", 530
    .return ($P285)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block237"  :anon :subid("23_1259420187.47956") :outer("22_1259420187.47956")
    .param pmc param_239
.annotate "line", 537
    .lex "$_", param_239
.annotate "line", 538
    find_lex $P243, "$_"
    set $S244, $P243
    iseq $I245, $S244, "0"
    unless $I245, unless_242
    new $P241, 'Integer'
    set $P241, $I245
    goto unless_242_end
  unless_242:
    find_lex $P246, "$_"
    set $N247, $P246
    new $P248, "Integer"
    assign $P248, 0
    set $N249, $P248
    isgt $I250, $N247, $N249
    new $P241, 'Integer'
    set $P241, $I250
  unless_242_end:
    unless $P241, if_240_end
    find_lex $P251, "$_"
    add $P252, $P251, 1
    store_lex "$count", $P252
  if_240_end:
.annotate "line", 539
    new $P253, "Integer"
    assign $P253, 1
    find_lex $P254, "$_"
    find_lex $P255, "%capnames"
    unless_null $P255, vivify_100
    new $P255, "Hash"
    store_lex "%capnames", $P255
  vivify_100:
    set $P255[$P254], $P253
.annotate "line", 537
    .return ($P253)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block267"  :anon :subid("24_1259420187.47956") :outer("22_1259420187.47956")
    .param pmc param_269
.annotate "line", 542
    .lex "$_", param_269
.annotate "line", 543
    find_lex $P270, "$_"
    find_lex $P271, "%capnames"
    unless_null $P271, vivify_104
    new $P271, "Hash"
  vivify_104:
    set $P272, $P271[$P270]
    unless_null $P272, vivify_105
    new $P272, "Undef"
  vivify_105:
    set $N273, $P272
    new $P274, 'Float'
    set $P274, $N273
    find_lex $P275, "$_"
    find_lex $P276, "%x"
    unless_null $P276, vivify_106
    new $P276, "Hash"
  vivify_106:
    set $P277, $P276[$P275]
    unless_null $P277, vivify_107
    new $P277, "Undef"
  vivify_107:
    add $P278, $P274, $P277
    find_lex $P279, "$_"
    find_lex $P280, "%capnames"
    unless_null $P280, vivify_108
    new $P280, "Hash"
    store_lex "%capnames", $P280
  vivify_108:
    set $P280[$P279], $P278
.annotate "line", 542
    .return ($P278)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block181"  :anon :subid("20_1259420187.47956") :outer("14_1259420187.47956")
.annotate "line", 517
    .const 'Sub' $P200 = "21_1259420187.47956" 
    capture_lex $P200
.annotate "line", 518
    new $P183, "Undef"
    .lex "$name", $P183
.annotate "line", 520
    new $P184, "ResizablePMCArray"
    .lex "@names", $P184
.annotate "line", 518
    find_lex $P185, "$ast"
    $P186 = $P185."name"()
    store_lex "$name", $P186
.annotate "line", 519
    find_lex $P188, "$name"
    set $S189, $P188
    iseq $I190, $S189, ""
    unless $I190, if_187_end
    find_lex $P191, "$count"
    store_lex "$name", $P191
    find_lex $P192, "$ast"
    find_lex $P193, "$name"
    $P192."name"($P193)
  if_187_end:
.annotate "line", 520

            $P0 = find_lex '$name'
            $S0 = $P0
            $P194 = split '=', $S0
        
    store_lex "@names", $P194
.annotate "line", 525
    find_lex $P196, "@names"
    defined $I197, $P196
    unless $I197, for_undef_111
    iter $P195, $P196
    new $P219, 'ExceptionHandler'
    set_addr $P219, loop218_handler
    $P219."handle_types"(65, 67, 66)
    push_eh $P219
  loop218_test:
    unless $P195, loop218_done
    shift $P198, $P195
  loop218_redo:
    .const 'Sub' $P200 = "21_1259420187.47956" 
    capture_lex $P200
    $P200($P198)
  loop218_next:
    goto loop218_test
  loop218_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P220, exception, 'type'
    eq $P220, 65, loop218_next
    eq $P220, 67, loop218_redo
  loop218_done:
    pop_eh 
  for_undef_111:
.annotate "line", 517
    .return ($P195)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block199"  :anon :subid("21_1259420187.47956") :outer("20_1259420187.47956")
    .param pmc param_201
.annotate "line", 525
    .lex "$_", param_201
.annotate "line", 526
    find_lex $P205, "$_"
    set $S206, $P205
    iseq $I207, $S206, "0"
    unless $I207, unless_204
    new $P203, 'Integer'
    set $P203, $I207
    goto unless_204_end
  unless_204:
    find_lex $P208, "$_"
    set $N209, $P208
    new $P210, "Integer"
    assign $P210, 0
    set $N211, $P210
    isgt $I212, $N209, $N211
    new $P203, 'Integer'
    set $P203, $I212
  unless_204_end:
    unless $P203, if_202_end
    find_lex $P213, "$_"
    add $P214, $P213, 1
    store_lex "$count", $P214
  if_202_end:
.annotate "line", 527
    new $P215, "Integer"
    assign $P215, 1
    find_lex $P216, "$_"
    find_lex $P217, "%capnames"
    unless_null $P217, vivify_112
    new $P217, "Hash"
    store_lex "%capnames", $P217
  vivify_112:
    set $P217[$P216], $P215
.annotate "line", 525
    .return ($P215)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block139"  :anon :subid("18_1259420187.47956") :outer("14_1259420187.47956")
    .param pmc param_142
.annotate "line", 509
    .const 'Sub' $P151 = "19_1259420187.47956" 
    capture_lex $P151
.annotate "line", 510
    new $P141, "Hash"
    .lex "%x", $P141
    .lex "$_", param_142
    find_lex $P143, "$_"
    find_lex $P144, "$count"
    $P145 = "capnames"($P143, $P144)
    store_lex "%x", $P145
.annotate "line", 511
    find_lex $P147, "%x"
    defined $I148, $P147
    unless $I148, for_undef_114
    iter $P146, $P147
    new $P165, 'ExceptionHandler'
    set_addr $P165, loop164_handler
    $P165."handle_types"(65, 67, 66)
    push_eh $P165
  loop164_test:
    unless $P146, loop164_done
    shift $P149, $P146
  loop164_redo:
    .const 'Sub' $P151 = "19_1259420187.47956" 
    capture_lex $P151
    $P151($P149)
  loop164_next:
    goto loop164_test
  loop164_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P166, exception, 'type'
    eq $P166, 65, loop164_next
    eq $P166, 67, loop164_redo
  loop164_done:
    pop_eh 
  for_undef_114:
.annotate "line", 514
    find_lex $P167, "%x"
    unless_null $P167, vivify_120
    new $P167, "Hash"
  vivify_120:
    set $P168, $P167[""]
    unless_null $P168, vivify_121
    new $P168, "Undef"
  vivify_121:
    store_lex "$count", $P168
.annotate "line", 509
    .return ($P168)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block150"  :anon :subid("19_1259420187.47956") :outer("18_1259420187.47956")
    .param pmc param_152
.annotate "line", 511
    .lex "$_", param_152
.annotate "line", 512
    find_lex $P153, "$_"
    find_lex $P154, "%capnames"
    unless_null $P154, vivify_115
    new $P154, "Hash"
  vivify_115:
    set $P155, $P154[$P153]
    unless_null $P155, vivify_116
    new $P155, "Undef"
  vivify_116:
    set $N156, $P155
    new $P157, 'Float'
    set $P157, $N156
    find_lex $P158, "$_"
    find_lex $P159, "%x"
    unless_null $P159, vivify_117
    new $P159, "Hash"
  vivify_117:
    set $P160, $P159[$P158]
    unless_null $P160, vivify_118
    new $P160, "Undef"
  vivify_118:
    add $P161, $P157, $P160
    find_lex $P162, "$_"
    find_lex $P163, "%capnames"
    unless_null $P163, vivify_119
    new $P163, "Hash"
    store_lex "%capnames", $P163
  vivify_119:
    set $P163[$P162], $P161
.annotate "line", 511
    .return ($P161)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block68"  :anon :subid("15_1259420187.47956") :outer("14_1259420187.47956")
.annotate "line", 495
    .const 'Sub' $P78 = "16_1259420187.47956" 
    capture_lex $P78
.annotate "line", 496
    new $P70, "Undef"
    .lex "$max", $P70
    find_lex $P71, "$count"
    store_lex "$max", $P71
.annotate "line", 497
    find_lex $P73, "$ast"
    $P74 = $P73."list"()
    defined $I75, $P74
    unless $I75, for_undef_122
    iter $P72, $P74
    new $P127, 'ExceptionHandler'
    set_addr $P127, loop126_handler
    $P127."handle_types"(65, 67, 66)
    push_eh $P127
  loop126_test:
    unless $P72, loop126_done
    shift $P76, $P72
  loop126_redo:
    .const 'Sub' $P78 = "16_1259420187.47956" 
    capture_lex $P78
    $P78($P76)
  loop126_next:
    goto loop126_test
  loop126_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P128, exception, 'type'
    eq $P128, 65, loop126_next
    eq $P128, 67, loop126_redo
  loop126_done:
    pop_eh 
  for_undef_122:
.annotate "line", 506
    find_lex $P129, "$max"
    store_lex "$count", $P129
.annotate "line", 495
    .return ($P129)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block77"  :anon :subid("16_1259420187.47956") :outer("15_1259420187.47956")
    .param pmc param_80
.annotate "line", 497
    .const 'Sub' $P89 = "17_1259420187.47956" 
    capture_lex $P89
.annotate "line", 498
    new $P79, "Hash"
    .lex "%x", $P79
    .lex "$_", param_80
    find_lex $P81, "$_"
    find_lex $P82, "$count"
    $P83 = "capnames"($P81, $P82)
    store_lex "%x", $P83
.annotate "line", 499
    find_lex $P85, "%x"
    defined $I86, $P85
    unless $I86, for_undef_123
    iter $P84, $P85
    new $P114, 'ExceptionHandler'
    set_addr $P114, loop113_handler
    $P114."handle_types"(65, 67, 66)
    push_eh $P114
  loop113_test:
    unless $P84, loop113_done
    shift $P87, $P84
  loop113_redo:
    .const 'Sub' $P89 = "17_1259420187.47956" 
    capture_lex $P89
    $P89($P87)
  loop113_next:
    goto loop113_test
  loop113_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, 'type'
    eq $P115, 65, loop113_next
    eq $P115, 67, loop113_redo
  loop113_done:
    pop_eh 
  for_undef_123:
.annotate "line", 504
    find_lex $P118, "%x"
    unless_null $P118, vivify_129
    new $P118, "Hash"
  vivify_129:
    set $P119, $P118[""]
    unless_null $P119, vivify_130
    new $P119, "Undef"
  vivify_130:
    set $N120, $P119
    find_lex $P121, "$max"
    set $N122, $P121
    isgt $I123, $N120, $N122
    if $I123, if_117
    new $P116, 'Integer'
    set $P116, $I123
    goto if_117_end
  if_117:
    find_lex $P124, "%x"
    unless_null $P124, vivify_131
    new $P124, "Hash"
  vivify_131:
    set $P125, $P124[""]
    unless_null $P125, vivify_132
    new $P125, "Undef"
  vivify_132:
    store_lex "$max", $P125
    set $P116, $P125
  if_117_end:
.annotate "line", 497
    .return ($P116)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block88"  :anon :subid("17_1259420187.47956") :outer("16_1259420187.47956")
    .param pmc param_90
.annotate "line", 499
    .lex "$_", param_90
.annotate "line", 500
    find_lex $P95, "$_"
    find_lex $P96, "%capnames"
    unless_null $P96, vivify_124
    new $P96, "Hash"
  vivify_124:
    set $P97, $P96[$P95]
    unless_null $P97, vivify_125
    new $P97, "Undef"
  vivify_125:
    set $N98, $P97
    new $P99, "Integer"
    assign $P99, 2
    set $N100, $P99
    islt $I101, $N98, $N100
    if $I101, if_94
    new $P93, 'Integer'
    set $P93, $I101
    goto if_94_end
  if_94:
    find_lex $P102, "$_"
    find_lex $P103, "%x"
    unless_null $P103, vivify_126
    new $P103, "Hash"
  vivify_126:
    set $P104, $P103[$P102]
    unless_null $P104, vivify_127
    new $P104, "Undef"
  vivify_127:
    set $N105, $P104
    new $P106, "Integer"
    assign $P106, 1
    set $N107, $P106
    iseq $I108, $N105, $N107
    new $P93, 'Integer'
    set $P93, $I108
  if_94_end:
    if $P93, if_92
    new $P110, "Integer"
    assign $P110, 2
    set $P91, $P110
    goto if_92_end
  if_92:
    new $P109, "Integer"
    assign $P109, 1
    set $P91, $P109
  if_92_end:
.annotate "line", 501
    find_lex $P111, "$_"
    find_lex $P112, "%capnames"
    unless_null $P112, vivify_128
    new $P112, "Hash"
    store_lex "%capnames", $P112
  vivify_128:
    set $P112[$P111], $P91
.annotate "line", 499
    .return ($P91)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backmod"  :subid("27_1259420187.47956") :outer("11_1259420187.47956")
    .param pmc param_319
    .param pmc param_320
.annotate "line", 558
    new $P318, 'ExceptionHandler'
    set_addr $P318, control_317
    $P318."handle_types"(58)
    push_eh $P318
    .lex "$ast", param_319
    .lex "$backmod", param_320
.annotate "line", 559
    find_lex $P322, "$backmod"
    set $S323, $P322
    iseq $I324, $S323, ":"
    if $I324, if_321
.annotate "line", 560
    find_lex $P329, "$backmod"
    set $S330, $P329
    iseq $I331, $S330, ":?"
    unless $I331, unless_328
    new $P327, 'Integer'
    set $P327, $I331
    goto unless_328_end
  unless_328:
    find_lex $P332, "$backmod"
    set $S333, $P332
    iseq $I334, $S333, "?"
    new $P327, 'Integer'
    set $P327, $I334
  unless_328_end:
    if $P327, if_326
.annotate "line", 561
    find_lex $P339, "$backmod"
    set $S340, $P339
    iseq $I341, $S340, ":!"
    unless $I341, unless_338
    new $P337, 'Integer'
    set $P337, $I341
    goto unless_338_end
  unless_338:
    find_lex $P342, "$backmod"
    set $S343, $P342
    iseq $I344, $S343, "!"
    new $P337, 'Integer'
    set $P337, $I344
  unless_338_end:
    unless $P337, if_336_end
    find_lex $P345, "$ast"
    $P345."backtrack"("g")
  if_336_end:
    goto if_326_end
  if_326:
.annotate "line", 560
    find_lex $P335, "$ast"
    $P335."backtrack"("f")
  if_326_end:
    goto if_321_end
  if_321:
.annotate "line", 559
    find_lex $P325, "$ast"
    $P325."backtrack"("r")
  if_321_end:
    find_lex $P346, "$ast"
.annotate "line", 558
    .return ($P346)
  control_317:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P347, exception, "payload"
    .return ($P347)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "subrule_alias"  :subid("28_1259420187.47956") :outer("11_1259420187.47956")
    .param pmc param_351
    .param pmc param_352
.annotate "line", 565
    new $P350, 'ExceptionHandler'
    set_addr $P350, control_349
    $P350."handle_types"(58)
    push_eh $P350
    .lex "$past", param_351
    .lex "$name", param_352
.annotate "line", 566
    find_lex $P354, "$past"
    $S355 = $P354."name"()
    isgt $I356, $S355, ""
    if $I356, if_353
.annotate "line", 567
    find_lex $P363, "$past"
    find_lex $P364, "$name"
    $P363."name"($P364)
    goto if_353_end
  if_353:
.annotate "line", 566
    find_lex $P357, "$past"
    find_lex $P358, "$name"
    concat $P359, $P358, "="
    find_lex $P360, "$past"
    $S361 = $P360."name"()
    concat $P362, $P359, $S361
    $P357."name"($P362)
  if_353_end:
.annotate "line", 568
    find_lex $P365, "$past"
    $P366 = $P365."subtype"("capture")
.annotate "line", 565
    .return ($P366)
  control_349:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P367, exception, "payload"
    .return ($P367)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "arg"  :subid("29_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_373
.annotate "line", 14
    new $P372, 'ExceptionHandler'
    set_addr $P372, control_371
    $P372."handle_types"(58)
    push_eh $P372
    .lex "self", self
    .lex "$/", param_373
.annotate "line", 15
    find_lex $P374, "$/"
    find_lex $P377, "$/"
    unless_null $P377, vivify_134
    new $P377, "Hash"
  vivify_134:
    set $P378, $P377["quote_EXPR"]
    unless_null $P378, vivify_135
    new $P378, "Undef"
  vivify_135:
    if $P378, if_376
    find_lex $P382, "$/"
    unless_null $P382, vivify_136
    new $P382, "Hash"
  vivify_136:
    set $P383, $P382["val"]
    unless_null $P383, vivify_137
    new $P383, "Undef"
  vivify_137:
    set $N384, $P383
    new $P375, 'Float'
    set $P375, $N384
    goto if_376_end
  if_376:
    find_lex $P379, "$/"
    unless_null $P379, vivify_138
    new $P379, "Hash"
  vivify_138:
    set $P380, $P379["quote_EXPR"]
    unless_null $P380, vivify_139
    new $P380, "Undef"
  vivify_139:
    $P381 = $P380."ast"()
    set $P375, $P381
  if_376_end:
    $P385 = $P374."!make"($P375)
.annotate "line", 14
    .return ($P385)
  control_371:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P386, exception, "payload"
    .return ($P386)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "arglist"  :subid("30_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_390
.annotate "line", 18
    .const 'Sub' $P400 = "31_1259420187.47956" 
    capture_lex $P400
    new $P389, 'ExceptionHandler'
    set_addr $P389, control_388
    $P389."handle_types"(58)
    push_eh $P389
    .lex "self", self
    .lex "$/", param_390
.annotate "line", 19
    new $P391, "Undef"
    .lex "$past", $P391
    get_hll_global $P392, ["PAST"], "Op"
    $P393 = $P392."new"("list" :named("pasttype"))
    store_lex "$past", $P393
.annotate "line", 20
    find_lex $P395, "$/"
    unless_null $P395, vivify_140
    new $P395, "Hash"
  vivify_140:
    set $P396, $P395["arg"]
    unless_null $P396, vivify_141
    new $P396, "Undef"
  vivify_141:
    defined $I397, $P396
    unless $I397, for_undef_142
    iter $P394, $P396
    new $P407, 'ExceptionHandler'
    set_addr $P407, loop406_handler
    $P407."handle_types"(65, 67, 66)
    push_eh $P407
  loop406_test:
    unless $P394, loop406_done
    shift $P398, $P394
  loop406_redo:
    .const 'Sub' $P400 = "31_1259420187.47956" 
    capture_lex $P400
    $P400($P398)
  loop406_next:
    goto loop406_test
  loop406_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P408, exception, 'type'
    eq $P408, 65, loop406_next
    eq $P408, 67, loop406_redo
  loop406_done:
    pop_eh 
  for_undef_142:
.annotate "line", 21
    find_lex $P409, "$/"
    find_lex $P410, "$past"
    $P411 = $P409."!make"($P410)
.annotate "line", 18
    .return ($P411)
  control_388:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P412, exception, "payload"
    .return ($P412)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block399"  :anon :subid("31_1259420187.47956") :outer("30_1259420187.47956")
    .param pmc param_401
.annotate "line", 20
    .lex "$_", param_401
    find_lex $P402, "$past"
    find_lex $P403, "$_"
    $P404 = $P403."ast"()
    $P405 = $P402."push"($P404)
    .return ($P405)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "TOP"  :subid("32_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_416
.annotate "line", 24
    new $P415, 'ExceptionHandler'
    set_addr $P415, control_414
    $P415."handle_types"(58)
    push_eh $P415
    .lex "self", self
    .lex "$/", param_416
.annotate "line", 25
    new $P417, "Undef"
    .lex "$past", $P417
    find_lex $P418, "$/"
    unless_null $P418, vivify_143
    new $P418, "Hash"
  vivify_143:
    set $P419, $P418["nibbler"]
    unless_null $P419, vivify_144
    new $P419, "Undef"
  vivify_144:
    $P420 = $P419."ast"()
    $P421 = "buildsub"($P420)
    store_lex "$past", $P421
.annotate "line", 26
    find_lex $P422, "$past"
    find_lex $P423, "$/"
    $P422."node"($P423)
.annotate "line", 27
    find_lex $P424, "$/"
    find_lex $P425, "$past"
    $P426 = $P424."!make"($P425)
.annotate "line", 24
    .return ($P426)
  control_414:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P427, exception, "payload"
    .return ($P427)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "nibbler"  :subid("33_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_431
    .param pmc param_432 :optional
    .param int has_param_432 :opt_flag
.annotate "line", 30
    .const 'Sub' $P468 = "35_1259420187.47956" 
    capture_lex $P468
    .const 'Sub' $P440 = "34_1259420187.47956" 
    capture_lex $P440
    new $P430, 'ExceptionHandler'
    set_addr $P430, control_429
    $P430."handle_types"(58)
    push_eh $P430
    .lex "self", self
    .lex "$/", param_431
    if has_param_432, optparam_145
    new $P433, "Undef"
    set param_432, $P433
  optparam_145:
    .lex "$key", param_432
.annotate "line", 42
    new $P434, "Undef"
    .lex "$past", $P434
.annotate "line", 31
    find_lex $P436, "$key"
    set $S437, $P436
    iseq $I438, $S437, "open"
    unless $I438, if_435_end
    .const 'Sub' $P440 = "34_1259420187.47956" 
    capture_lex $P440
    $P440()
  if_435_end:
.annotate "line", 41
    get_global $P450, "@MODIFIERS"
    $P450."shift"()
    find_lex $P451, "$past"
.annotate "line", 43
    find_lex $P453, "$/"
    unless_null $P453, vivify_148
    new $P453, "Hash"
  vivify_148:
    set $P454, $P453["termish"]
    unless_null $P454, vivify_149
    new $P454, "Undef"
  vivify_149:
    set $N455, $P454
    new $P456, "Integer"
    assign $P456, 1
    set $N457, $P456
    isgt $I458, $N455, $N457
    if $I458, if_452
.annotate "line", 50
    find_lex $P477, "$/"
    unless_null $P477, vivify_150
    new $P477, "Hash"
  vivify_150:
    set $P478, $P477["termish"]
    unless_null $P478, vivify_151
    new $P478, "ResizablePMCArray"
  vivify_151:
    set $P479, $P478[0]
    unless_null $P479, vivify_152
    new $P479, "Undef"
  vivify_152:
    $P480 = $P479."ast"()
    store_lex "$past", $P480
.annotate "line", 49
    goto if_452_end
  if_452:
.annotate "line", 44
    get_hll_global $P459, ["PAST"], "Regex"
    find_lex $P460, "$/"
    $P461 = $P459."new"("alt" :named("pasttype"), $P460 :named("node"))
    store_lex "$past", $P461
.annotate "line", 45
    find_lex $P463, "$/"
    unless_null $P463, vivify_153
    new $P463, "Hash"
  vivify_153:
    set $P464, $P463["termish"]
    unless_null $P464, vivify_154
    new $P464, "Undef"
  vivify_154:
    defined $I465, $P464
    unless $I465, for_undef_155
    iter $P462, $P464
    new $P475, 'ExceptionHandler'
    set_addr $P475, loop474_handler
    $P475."handle_types"(65, 67, 66)
    push_eh $P475
  loop474_test:
    unless $P462, loop474_done
    shift $P466, $P462
  loop474_redo:
    .const 'Sub' $P468 = "35_1259420187.47956" 
    capture_lex $P468
    $P468($P466)
  loop474_next:
    goto loop474_test
  loop474_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P476, exception, 'type'
    eq $P476, 65, loop474_next
    eq $P476, 67, loop474_redo
  loop474_done:
    pop_eh 
  for_undef_155:
  if_452_end:
.annotate "line", 52
    find_lex $P481, "$/"
    find_lex $P482, "$past"
    $P483 = $P481."!make"($P482)
.annotate "line", 30
    .return ($P483)
  control_429:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P484, exception, "payload"
    .return ($P484)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block439"  :anon :subid("34_1259420187.47956") :outer("33_1259420187.47956")
.annotate "line", 32
    new $P441, "Hash"
    .lex "%old", $P441
.annotate "line", 33
    new $P442, "Hash"
    .lex "%new", $P442
.annotate "line", 32
    get_global $P443, "@MODIFIERS"
    unless_null $P443, vivify_146
    new $P443, "ResizablePMCArray"
  vivify_146:
    set $P444, $P443[0]
    unless_null $P444, vivify_147
    new $P444, "Undef"
  vivify_147:
    store_lex "%old", $P444
.annotate "line", 33

                       $P0 = find_lex '%old'
                       $P445 = clone $P0
                   
    store_lex "%new", $P445
.annotate "line", 37
    get_global $P446, "@MODIFIERS"
    find_lex $P447, "%new"
    $P446."unshift"($P447)
.annotate "line", 38
    new $P448, "Exception"
    set $P448['type'], 58
    new $P449, "Integer"
    assign $P449, 1
    setattribute $P448, 'payload', $P449
    throw $P448
.annotate "line", 31
    .return ()
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block467"  :anon :subid("35_1259420187.47956") :outer("33_1259420187.47956")
    .param pmc param_469
.annotate "line", 45
    .lex "$_", param_469
.annotate "line", 46
    find_lex $P470, "$past"
    find_lex $P471, "$_"
    $P472 = $P471."ast"()
    $P473 = $P470."push"($P472)
.annotate "line", 45
    .return ($P473)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "termish"  :subid("36_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_488
.annotate "line", 55
    .const 'Sub' $P501 = "37_1259420187.47956" 
    capture_lex $P501
    new $P487, 'ExceptionHandler'
    set_addr $P487, control_486
    $P487."handle_types"(58)
    push_eh $P487
    .lex "self", self
    .lex "$/", param_488
.annotate "line", 56
    new $P489, "Undef"
    .lex "$past", $P489
.annotate "line", 57
    new $P490, "Undef"
    .lex "$lastlit", $P490
.annotate "line", 56
    get_hll_global $P491, ["PAST"], "Regex"
    find_lex $P492, "$/"
    $P493 = $P491."new"("concat" :named("pasttype"), $P492 :named("node"))
    store_lex "$past", $P493
.annotate "line", 57
    new $P494, "Integer"
    assign $P494, 0
    store_lex "$lastlit", $P494
.annotate "line", 58
    find_lex $P496, "$/"
    unless_null $P496, vivify_156
    new $P496, "Hash"
  vivify_156:
    set $P497, $P496["noun"]
    unless_null $P497, vivify_157
    new $P497, "Undef"
  vivify_157:
    defined $I498, $P497
    unless $I498, for_undef_158
    iter $P495, $P497
    new $P547, 'ExceptionHandler'
    set_addr $P547, loop546_handler
    $P547."handle_types"(65, 67, 66)
    push_eh $P547
  loop546_test:
    unless $P495, loop546_done
    shift $P499, $P495
  loop546_redo:
    .const 'Sub' $P501 = "37_1259420187.47956" 
    capture_lex $P501
    $P501($P499)
  loop546_next:
    goto loop546_test
  loop546_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P548, exception, 'type'
    eq $P548, 65, loop546_next
    eq $P548, 67, loop546_redo
  loop546_done:
    pop_eh 
  for_undef_158:
.annotate "line", 73
    find_lex $P549, "$/"
    find_lex $P550, "$past"
    $P551 = $P549."!make"($P550)
.annotate "line", 55
    .return ($P551)
  control_486:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P552, exception, "payload"
    .return ($P552)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block500"  :anon :subid("37_1259420187.47956") :outer("36_1259420187.47956")
    .param pmc param_503
.annotate "line", 59
    new $P502, "Undef"
    .lex "$ast", $P502
    .lex "$_", param_503
    find_lex $P504, "$_"
    $P505 = $P504."ast"()
    store_lex "$ast", $P505
.annotate "line", 60
    find_lex $P508, "$ast"
    if $P508, if_507
    set $P506, $P508
    goto if_507_end
  if_507:
.annotate "line", 61
    find_lex $P515, "$lastlit"
    if $P515, if_514
    set $P513, $P515
    goto if_514_end
  if_514:
    find_lex $P516, "$ast"
    $S517 = $P516."pasttype"()
    iseq $I518, $S517, "literal"
    new $P513, 'Integer'
    set $P513, $I518
  if_514_end:
    if $P513, if_512
    set $P511, $P513
    goto if_512_end
  if_512:
.annotate "line", 62
    get_hll_global $P519, ["PAST"], "Node"
    find_lex $P520, "$ast"
    unless_null $P520, vivify_159
    new $P520, "ResizablePMCArray"
  vivify_159:
    set $P521, $P520[0]
    unless_null $P521, vivify_160
    new $P521, "Undef"
  vivify_160:
    $P522 = $P519."ACCEPTS"($P521)
    isfalse $I523, $P522
    new $P511, 'Integer'
    set $P511, $I523
  if_512_end:
    if $P511, if_510
.annotate "line", 66
    find_lex $P530, "$past"
    find_lex $P531, "$ast"
    $P530."push"($P531)
.annotate "line", 67
    find_lex $P536, "$ast"
    $S537 = $P536."pasttype"()
    iseq $I538, $S537, "literal"
    if $I538, if_535
    new $P534, 'Integer'
    set $P534, $I538
    goto if_535_end
  if_535:
.annotate "line", 68
    get_hll_global $P539, ["PAST"], "Node"
    find_lex $P540, "$ast"
    unless_null $P540, vivify_161
    new $P540, "ResizablePMCArray"
  vivify_161:
    set $P541, $P540[0]
    unless_null $P541, vivify_162
    new $P541, "Undef"
  vivify_162:
    $P542 = $P539."ACCEPTS"($P541)
    isfalse $I543, $P542
    new $P534, 'Integer'
    set $P534, $I543
  if_535_end:
    if $P534, if_533
    new $P545, "Integer"
    assign $P545, 0
    set $P532, $P545
    goto if_533_end
  if_533:
    find_lex $P544, "$ast"
    set $P532, $P544
  if_533_end:
.annotate "line", 69
    store_lex "$lastlit", $P532
.annotate "line", 65
    set $P509, $P532
.annotate "line", 62
    goto if_510_end
  if_510:
.annotate "line", 63
    find_lex $P524, "$lastlit"
    unless_null $P524, vivify_163
    new $P524, "ResizablePMCArray"
  vivify_163:
    set $P525, $P524[0]
    unless_null $P525, vivify_164
    new $P525, "Undef"
  vivify_164:
    find_lex $P526, "$ast"
    unless_null $P526, vivify_165
    new $P526, "ResizablePMCArray"
  vivify_165:
    set $P527, $P526[0]
    unless_null $P527, vivify_166
    new $P527, "Undef"
  vivify_166:
    concat $P528, $P525, $P527
    find_lex $P529, "$lastlit"
    unless_null $P529, vivify_167
    new $P529, "ResizablePMCArray"
    store_lex "$lastlit", $P529
  vivify_167:
    set $P529[0], $P528
.annotate "line", 62
    set $P509, $P528
  if_510_end:
.annotate "line", 60
    set $P506, $P509
  if_507_end:
.annotate "line", 58
    .return ($P506)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantified_atom"  :subid("38_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_556
.annotate "line", 76
    .const 'Sub' $P565 = "39_1259420187.47956" 
    capture_lex $P565
    new $P555, 'ExceptionHandler'
    set_addr $P555, control_554
    $P555."handle_types"(58)
    push_eh $P555
    .lex "self", self
    .lex "$/", param_556
.annotate "line", 77
    new $P557, "Undef"
    .lex "$past", $P557
    find_lex $P558, "$/"
    unless_null $P558, vivify_168
    new $P558, "Hash"
  vivify_168:
    set $P559, $P558["atom"]
    unless_null $P559, vivify_169
    new $P559, "Undef"
  vivify_169:
    $P560 = $P559."ast"()
    store_lex "$past", $P560
.annotate "line", 78
    find_lex $P562, "$/"
    unless_null $P562, vivify_170
    new $P562, "Hash"
  vivify_170:
    set $P563, $P562["quantifier"]
    unless_null $P563, vivify_171
    new $P563, "Undef"
  vivify_171:
    if $P563, if_561
.annotate "line", 84
    find_lex $P579, "$/"
    unless_null $P579, vivify_172
    new $P579, "Hash"
  vivify_172:
    set $P580, $P579["backmod"]
    unless_null $P580, vivify_173
    new $P580, "ResizablePMCArray"
  vivify_173:
    set $P581, $P580[0]
    unless_null $P581, vivify_174
    new $P581, "Undef"
  vivify_174:
    unless $P581, if_578_end
    find_lex $P582, "$past"
    find_lex $P583, "$/"
    unless_null $P583, vivify_175
    new $P583, "Hash"
  vivify_175:
    set $P584, $P583["backmod"]
    unless_null $P584, vivify_176
    new $P584, "ResizablePMCArray"
  vivify_176:
    set $P585, $P584[0]
    unless_null $P585, vivify_177
    new $P585, "Undef"
  vivify_177:
    "backmod"($P582, $P585)
  if_578_end:
    goto if_561_end
  if_561:
.annotate "line", 78
    .const 'Sub' $P565 = "39_1259420187.47956" 
    capture_lex $P565
    $P565()
  if_561_end:
.annotate "line", 85
    find_lex $P591, "$past"
    if $P591, if_590
    set $P589, $P591
    goto if_590_end
  if_590:
    find_lex $P592, "$past"
    $P593 = $P592."backtrack"()
    isfalse $I594, $P593
    new $P589, 'Integer'
    set $P589, $I594
  if_590_end:
    if $P589, if_588
    set $P587, $P589
    goto if_588_end
  if_588:
    get_global $P595, "@MODIFIERS"
    unless_null $P595, vivify_181
    new $P595, "ResizablePMCArray"
  vivify_181:
    set $P596, $P595[0]
    unless_null $P596, vivify_182
    new $P596, "Hash"
  vivify_182:
    set $P597, $P596["r"]
    unless_null $P597, vivify_183
    new $P597, "Undef"
  vivify_183:
    set $P587, $P597
  if_588_end:
    unless $P587, if_586_end
.annotate "line", 86
    find_lex $P598, "$past"
    $P598."backtrack"("r")
  if_586_end:
.annotate "line", 88
    find_lex $P599, "$/"
    find_lex $P600, "$past"
    $P601 = $P599."!make"($P600)
.annotate "line", 76
    .return ($P601)
  control_554:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P602, exception, "payload"
    .return ($P602)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block564"  :anon :subid("39_1259420187.47956") :outer("38_1259420187.47956")
.annotate "line", 80
    new $P566, "Undef"
    .lex "$qast", $P566
.annotate "line", 79
    find_lex $P568, "$past"
    isfalse $I569, $P568
    unless $I569, if_567_end
    find_lex $P570, "$/"
    $P570."panic"("Can't quantify zero-width atom")
  if_567_end:
.annotate "line", 80
    find_lex $P571, "$/"
    unless_null $P571, vivify_178
    new $P571, "Hash"
  vivify_178:
    set $P572, $P571["quantifier"]
    unless_null $P572, vivify_179
    new $P572, "ResizablePMCArray"
  vivify_179:
    set $P573, $P572[0]
    unless_null $P573, vivify_180
    new $P573, "Undef"
  vivify_180:
    $P574 = $P573."ast"()
    store_lex "$qast", $P574
.annotate "line", 81
    find_lex $P575, "$qast"
    find_lex $P576, "$past"
    $P575."unshift"($P576)
.annotate "line", 82
    find_lex $P577, "$qast"
    store_lex "$past", $P577
.annotate "line", 78
    .return ($P577)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "atom"  :subid("40_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_606
.annotate "line", 91
    new $P605, 'ExceptionHandler'
    set_addr $P605, control_604
    $P605."handle_types"(58)
    push_eh $P605
    .lex "self", self
    .lex "$/", param_606
.annotate "line", 92
    new $P607, "Undef"
    .lex "$past", $P607
.annotate "line", 91
    find_lex $P608, "$past"
.annotate "line", 93
    find_lex $P610, "$/"
    unless_null $P610, vivify_184
    new $P610, "Hash"
  vivify_184:
    set $P611, $P610["metachar"]
    unless_null $P611, vivify_185
    new $P611, "Undef"
  vivify_185:
    if $P611, if_609
.annotate "line", 95
    get_hll_global $P615, ["PAST"], "Regex"
    find_lex $P616, "$/"
    set $S617, $P616
    find_lex $P618, "$/"
    $P619 = $P615."new"($S617, "literal" :named("pasttype"), $P618 :named("node"))
    store_lex "$past", $P619
.annotate "line", 96
    get_global $P621, "@MODIFIERS"
    unless_null $P621, vivify_186
    new $P621, "ResizablePMCArray"
  vivify_186:
    set $P622, $P621[0]
    unless_null $P622, vivify_187
    new $P622, "Hash"
  vivify_187:
    set $P623, $P622["i"]
    unless_null $P623, vivify_188
    new $P623, "Undef"
  vivify_188:
    unless $P623, if_620_end
    find_lex $P624, "$past"
    $P624."subtype"("ignorecase")
  if_620_end:
.annotate "line", 94
    goto if_609_end
  if_609:
.annotate "line", 93
    find_lex $P612, "$/"
    unless_null $P612, vivify_189
    new $P612, "Hash"
  vivify_189:
    set $P613, $P612["metachar"]
    unless_null $P613, vivify_190
    new $P613, "Undef"
  vivify_190:
    $P614 = $P613."ast"()
    store_lex "$past", $P614
  if_609_end:
.annotate "line", 98
    find_lex $P625, "$/"
    find_lex $P626, "$past"
    $P627 = $P625."!make"($P626)
.annotate "line", 91
    .return ($P627)
  control_604:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P628, exception, "payload"
    .return ($P628)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<*>"  :subid("41_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_632
.annotate "line", 101
    new $P631, 'ExceptionHandler'
    set_addr $P631, control_630
    $P631."handle_types"(58)
    push_eh $P631
    .lex "self", self
    .lex "$/", param_632
.annotate "line", 102
    new $P633, "Undef"
    .lex "$past", $P633
    get_hll_global $P634, ["PAST"], "Regex"
    find_lex $P635, "$/"
    $P636 = $P634."new"("quant" :named("pasttype"), $P635 :named("node"))
    store_lex "$past", $P636
.annotate "line", 103
    find_lex $P637, "$/"
    find_lex $P638, "$past"
    find_lex $P639, "$/"
    unless_null $P639, vivify_191
    new $P639, "Hash"
  vivify_191:
    set $P640, $P639["backmod"]
    unless_null $P640, vivify_192
    new $P640, "Undef"
  vivify_192:
    $P641 = "backmod"($P638, $P640)
    $P642 = $P637."!make"($P641)
.annotate "line", 101
    .return ($P642)
  control_630:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P643, exception, "payload"
    .return ($P643)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<+>"  :subid("42_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_647
.annotate "line", 106
    new $P646, 'ExceptionHandler'
    set_addr $P646, control_645
    $P646."handle_types"(58)
    push_eh $P646
    .lex "self", self
    .lex "$/", param_647
.annotate "line", 107
    new $P648, "Undef"
    .lex "$past", $P648
    get_hll_global $P649, ["PAST"], "Regex"
    find_lex $P650, "$/"
    $P651 = $P649."new"("quant" :named("pasttype"), 1 :named("min"), $P650 :named("node"))
    store_lex "$past", $P651
.annotate "line", 108
    find_lex $P652, "$/"
    find_lex $P653, "$past"
    find_lex $P654, "$/"
    unless_null $P654, vivify_193
    new $P654, "Hash"
  vivify_193:
    set $P655, $P654["backmod"]
    unless_null $P655, vivify_194
    new $P655, "Undef"
  vivify_194:
    $P656 = "backmod"($P653, $P655)
    $P657 = $P652."!make"($P656)
.annotate "line", 106
    .return ($P657)
  control_645:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P658, exception, "payload"
    .return ($P658)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<?>"  :subid("43_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_662
.annotate "line", 111
    new $P661, 'ExceptionHandler'
    set_addr $P661, control_660
    $P661."handle_types"(58)
    push_eh $P661
    .lex "self", self
    .lex "$/", param_662
.annotate "line", 112
    new $P663, "Undef"
    .lex "$past", $P663
    get_hll_global $P664, ["PAST"], "Regex"
    find_lex $P665, "$/"
    $P666 = $P664."new"("quant" :named("pasttype"), 0 :named("min"), 1 :named("max"), $P665 :named("node"))
    store_lex "$past", $P666
.annotate "line", 113
    find_lex $P667, "$/"
    find_lex $P668, "$past"
    find_lex $P669, "$/"
    unless_null $P669, vivify_195
    new $P669, "Hash"
  vivify_195:
    set $P670, $P669["backmod"]
    unless_null $P670, vivify_196
    new $P670, "Undef"
  vivify_196:
    $P671 = "backmod"($P668, $P670)
    $P667."!make"($P671)
.annotate "line", 114
    find_lex $P672, "$/"
    find_lex $P673, "$past"
    $P674 = $P672."!make"($P673)
.annotate "line", 111
    .return ($P674)
  control_660:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P675, exception, "payload"
    .return ($P675)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<**>"  :subid("44_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_679
.annotate "line", 117
    new $P678, 'ExceptionHandler'
    set_addr $P678, control_677
    $P678."handle_types"(58)
    push_eh $P678
    .lex "self", self
    .lex "$/", param_679
.annotate "line", 118
    new $P680, "Undef"
    .lex "$past", $P680
.annotate "line", 117
    find_lex $P681, "$past"
.annotate "line", 119
    find_lex $P683, "$/"
    unless_null $P683, vivify_197
    new $P683, "Hash"
  vivify_197:
    set $P684, $P683["quantified_atom"]
    unless_null $P684, vivify_198
    new $P684, "Undef"
  vivify_198:
    if $P684, if_682
.annotate "line", 124
    get_hll_global $P691, ["PAST"], "Regex"
    find_lex $P692, "$/"
    unless_null $P692, vivify_199
    new $P692, "Hash"
  vivify_199:
    set $P693, $P692["min"]
    unless_null $P693, vivify_200
    new $P693, "Undef"
  vivify_200:
    set $N694, $P693
    find_lex $P695, "$/"
    $P696 = $P691."new"("quant" :named("pasttype"), $N694 :named("min"), $P695 :named("node"))
    store_lex "$past", $P696
.annotate "line", 125
    find_lex $P698, "$/"
    unless_null $P698, vivify_201
    new $P698, "Hash"
  vivify_201:
    set $P699, $P698["max"]
    unless_null $P699, vivify_202
    new $P699, "Undef"
  vivify_202:
    isfalse $I700, $P699
    if $I700, if_697
.annotate "line", 126
    find_lex $P706, "$/"
    unless_null $P706, vivify_203
    new $P706, "Hash"
  vivify_203:
    set $P707, $P706["max"]
    unless_null $P707, vivify_204
    new $P707, "ResizablePMCArray"
  vivify_204:
    set $P708, $P707[0]
    unless_null $P708, vivify_205
    new $P708, "Undef"
  vivify_205:
    set $S709, $P708
    isne $I710, $S709, "*"
    unless $I710, if_705_end
    find_lex $P711, "$past"
    find_lex $P712, "$/"
    unless_null $P712, vivify_206
    new $P712, "Hash"
  vivify_206:
    set $P713, $P712["max"]
    unless_null $P713, vivify_207
    new $P713, "ResizablePMCArray"
  vivify_207:
    set $P714, $P713[0]
    unless_null $P714, vivify_208
    new $P714, "Undef"
  vivify_208:
    set $N715, $P714
    $P711."max"($N715)
  if_705_end:
    goto if_697_end
  if_697:
.annotate "line", 125
    find_lex $P701, "$past"
    find_lex $P702, "$/"
    unless_null $P702, vivify_209
    new $P702, "Hash"
  vivify_209:
    set $P703, $P702["min"]
    unless_null $P703, vivify_210
    new $P703, "Undef"
  vivify_210:
    set $N704, $P703
    $P701."max"($N704)
  if_697_end:
.annotate "line", 123
    goto if_682_end
  if_682:
.annotate "line", 120
    get_hll_global $P685, ["PAST"], "Regex"
.annotate "line", 121
    find_lex $P686, "$/"
    unless_null $P686, vivify_211
    new $P686, "Hash"
  vivify_211:
    set $P687, $P686["quantified_atom"]
    unless_null $P687, vivify_212
    new $P687, "Undef"
  vivify_212:
    $P688 = $P687."ast"()
    find_lex $P689, "$/"
    $P690 = $P685."new"("quant" :named("pasttype"), 1 :named("min"), $P688 :named("sep"), $P689 :named("node"))
.annotate "line", 120
    store_lex "$past", $P690
  if_682_end:
.annotate "line", 128
    find_lex $P716, "$/"
    find_lex $P717, "$past"
    find_lex $P718, "$/"
    unless_null $P718, vivify_213
    new $P718, "Hash"
  vivify_213:
    set $P719, $P718["backmod"]
    unless_null $P719, vivify_214
    new $P719, "Undef"
  vivify_214:
    $P720 = "backmod"($P717, $P719)
    $P721 = $P716."!make"($P720)
.annotate "line", 117
    .return ($P721)
  control_677:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P722, exception, "payload"
    .return ($P722)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<ws>"  :subid("45_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_726
.annotate "line", 131
    new $P725, 'ExceptionHandler'
    set_addr $P725, control_724
    $P725."handle_types"(58)
    push_eh $P725
    .lex "self", self
    .lex "$/", param_726
.annotate "line", 132
    new $P727, "Undef"
    .lex "$past", $P727
.annotate "line", 133
    get_global $P730, "@MODIFIERS"
    unless_null $P730, vivify_215
    new $P730, "ResizablePMCArray"
  vivify_215:
    set $P731, $P730[0]
    unless_null $P731, vivify_216
    new $P731, "Hash"
  vivify_216:
    set $P732, $P731["s"]
    unless_null $P732, vivify_217
    new $P732, "Undef"
  vivify_217:
    if $P732, if_729
    new $P736, "Integer"
    assign $P736, 0
    set $P728, $P736
    goto if_729_end
  if_729:
    get_hll_global $P733, ["PAST"], "Regex"
    find_lex $P734, "$/"
    $P735 = $P733."new"("ws", "subrule" :named("pasttype"), "method" :named("subtype"), $P734 :named("node"))
    set $P728, $P735
  if_729_end:
    store_lex "$past", $P728
.annotate "line", 136
    find_lex $P737, "$/"
    find_lex $P738, "$past"
    $P739 = $P737."!make"($P738)
.annotate "line", 131
    .return ($P739)
  control_724:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P740, exception, "payload"
    .return ($P740)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<[ ]>"  :subid("46_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_744
.annotate "line", 140
    new $P743, 'ExceptionHandler'
    set_addr $P743, control_742
    $P743."handle_types"(58)
    push_eh $P743
    .lex "self", self
    .lex "$/", param_744
.annotate "line", 141
    find_lex $P745, "$/"
    find_lex $P746, "$/"
    unless_null $P746, vivify_218
    new $P746, "Hash"
  vivify_218:
    set $P747, $P746["nibbler"]
    unless_null $P747, vivify_219
    new $P747, "Undef"
  vivify_219:
    $P748 = $P747."ast"()
    $P749 = $P745."!make"($P748)
.annotate "line", 140
    .return ($P749)
  control_742:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P750, exception, "payload"
    .return ($P750)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<( )>"  :subid("47_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_754
.annotate "line", 144
    new $P753, 'ExceptionHandler'
    set_addr $P753, control_752
    $P753."handle_types"(58)
    push_eh $P753
    .lex "self", self
    .lex "$/", param_754
.annotate "line", 145
    new $P755, "Undef"
    .lex "$subpast", $P755
.annotate "line", 146
    new $P756, "Undef"
    .lex "$past", $P756
.annotate "line", 145
    find_lex $P757, "$/"
    unless_null $P757, vivify_220
    new $P757, "Hash"
  vivify_220:
    set $P758, $P757["nibbler"]
    unless_null $P758, vivify_221
    new $P758, "Undef"
  vivify_221:
    $P759 = $P758."ast"()
    $P760 = "buildsub"($P759)
    store_lex "$subpast", $P760
.annotate "line", 146
    get_hll_global $P761, ["PAST"], "Regex"
    find_lex $P762, "$subpast"
    find_lex $P763, "$/"
    $P764 = $P761."new"($P762, "subrule" :named("pasttype"), "capture" :named("subtype"), $P763 :named("node"))
    store_lex "$past", $P764
.annotate "line", 148
    find_lex $P765, "$/"
    find_lex $P766, "$past"
    $P767 = $P765."!make"($P766)
.annotate "line", 144
    .return ($P767)
  control_752:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P768, exception, "payload"
    .return ($P768)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<'>"  :subid("48_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_772
.annotate "line", 151
    new $P771, 'ExceptionHandler'
    set_addr $P771, control_770
    $P771."handle_types"(58)
    push_eh $P771
    .lex "self", self
    .lex "$/", param_772
.annotate "line", 152
    new $P773, "Undef"
    .lex "$quote", $P773
.annotate "line", 154
    new $P774, "Undef"
    .lex "$past", $P774
.annotate "line", 152
    find_lex $P775, "$/"
    unless_null $P775, vivify_222
    new $P775, "Hash"
  vivify_222:
    set $P776, $P775["quote_EXPR"]
    unless_null $P776, vivify_223
    new $P776, "Undef"
  vivify_223:
    $P777 = $P776."ast"()
    store_lex "$quote", $P777
.annotate "line", 153
    get_hll_global $P779, ["PAST"], "Val"
    find_lex $P780, "$quote"
    $P781 = $P779."ACCEPTS"($P780)
    unless $P781, if_778_end
    find_lex $P782, "$quote"
    $P783 = $P782."value"()
    store_lex "$quote", $P783
  if_778_end:
.annotate "line", 154
    get_hll_global $P784, ["PAST"], "Regex"
    find_lex $P785, "$quote"
    find_lex $P786, "$/"
    $P787 = $P784."new"($P785, "literal" :named("pasttype"), $P786 :named("node"))
    store_lex "$past", $P787
.annotate "line", 155
    find_lex $P788, "$/"
    find_lex $P789, "$past"
    $P790 = $P788."!make"($P789)
.annotate "line", 151
    .return ($P790)
  control_770:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P791, exception, "payload"
    .return ($P791)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<\">"  :subid("49_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_795
.annotate "line", 158
    new $P794, 'ExceptionHandler'
    set_addr $P794, control_793
    $P794."handle_types"(58)
    push_eh $P794
    .lex "self", self
    .lex "$/", param_795
.annotate "line", 159
    new $P796, "Undef"
    .lex "$quote", $P796
.annotate "line", 161
    new $P797, "Undef"
    .lex "$past", $P797
.annotate "line", 159
    find_lex $P798, "$/"
    unless_null $P798, vivify_224
    new $P798, "Hash"
  vivify_224:
    set $P799, $P798["quote_EXPR"]
    unless_null $P799, vivify_225
    new $P799, "Undef"
  vivify_225:
    $P800 = $P799."ast"()
    store_lex "$quote", $P800
.annotate "line", 160
    get_hll_global $P802, ["PAST"], "Val"
    find_lex $P803, "$quote"
    $P804 = $P802."ACCEPTS"($P803)
    unless $P804, if_801_end
    find_lex $P805, "$quote"
    $P806 = $P805."value"()
    store_lex "$quote", $P806
  if_801_end:
.annotate "line", 161
    get_hll_global $P807, ["PAST"], "Regex"
    find_lex $P808, "$quote"
    find_lex $P809, "$/"
    $P810 = $P807."new"($P808, "literal" :named("pasttype"), $P809 :named("node"))
    store_lex "$past", $P810
.annotate "line", 162
    find_lex $P811, "$/"
    find_lex $P812, "$past"
    $P813 = $P811."!make"($P812)
.annotate "line", 158
    .return ($P813)
  control_793:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P814, exception, "payload"
    .return ($P814)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<.>"  :subid("50_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_818
.annotate "line", 165
    new $P817, 'ExceptionHandler'
    set_addr $P817, control_816
    $P817."handle_types"(58)
    push_eh $P817
    .lex "self", self
    .lex "$/", param_818
.annotate "line", 166
    new $P819, "Undef"
    .lex "$past", $P819
    get_hll_global $P820, ["PAST"], "Regex"
    find_lex $P821, "$/"
    $P822 = $P820."new"("charclass" :named("pasttype"), "." :named("subtype"), $P821 :named("node"))
    store_lex "$past", $P822
.annotate "line", 167
    find_lex $P823, "$/"
    find_lex $P824, "$past"
    $P825 = $P823."!make"($P824)
.annotate "line", 165
    .return ($P825)
  control_816:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P826, exception, "payload"
    .return ($P826)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<^>"  :subid("51_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_830
.annotate "line", 170
    new $P829, 'ExceptionHandler'
    set_addr $P829, control_828
    $P829."handle_types"(58)
    push_eh $P829
    .lex "self", self
    .lex "$/", param_830
.annotate "line", 171
    new $P831, "Undef"
    .lex "$past", $P831
    get_hll_global $P832, ["PAST"], "Regex"
    find_lex $P833, "$/"
    $P834 = $P832."new"("anchor" :named("pasttype"), "bos" :named("subtype"), $P833 :named("node"))
    store_lex "$past", $P834
.annotate "line", 172
    find_lex $P835, "$/"
    find_lex $P836, "$past"
    $P837 = $P835."!make"($P836)
.annotate "line", 170
    .return ($P837)
  control_828:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P838, exception, "payload"
    .return ($P838)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<^^>"  :subid("52_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_842
.annotate "line", 175
    new $P841, 'ExceptionHandler'
    set_addr $P841, control_840
    $P841."handle_types"(58)
    push_eh $P841
    .lex "self", self
    .lex "$/", param_842
.annotate "line", 176
    new $P843, "Undef"
    .lex "$past", $P843
    get_hll_global $P844, ["PAST"], "Regex"
    find_lex $P845, "$/"
    $P846 = $P844."new"("anchor" :named("pasttype"), "bol" :named("subtype"), $P845 :named("node"))
    store_lex "$past", $P846
.annotate "line", 177
    find_lex $P847, "$/"
    find_lex $P848, "$past"
    $P849 = $P847."!make"($P848)
.annotate "line", 175
    .return ($P849)
  control_840:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P850, exception, "payload"
    .return ($P850)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<$>"  :subid("53_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_854
.annotate "line", 180
    new $P853, 'ExceptionHandler'
    set_addr $P853, control_852
    $P853."handle_types"(58)
    push_eh $P853
    .lex "self", self
    .lex "$/", param_854
.annotate "line", 181
    new $P855, "Undef"
    .lex "$past", $P855
    get_hll_global $P856, ["PAST"], "Regex"
    find_lex $P857, "$/"
    $P858 = $P856."new"("anchor" :named("pasttype"), "eos" :named("subtype"), $P857 :named("node"))
    store_lex "$past", $P858
.annotate "line", 182
    find_lex $P859, "$/"
    find_lex $P860, "$past"
    $P861 = $P859."!make"($P860)
.annotate "line", 180
    .return ($P861)
  control_852:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P862, exception, "payload"
    .return ($P862)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<$$>"  :subid("54_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_866
.annotate "line", 185
    new $P865, 'ExceptionHandler'
    set_addr $P865, control_864
    $P865."handle_types"(58)
    push_eh $P865
    .lex "self", self
    .lex "$/", param_866
.annotate "line", 186
    new $P867, "Undef"
    .lex "$past", $P867
    get_hll_global $P868, ["PAST"], "Regex"
    find_lex $P869, "$/"
    $P870 = $P868."new"("anchor" :named("pasttype"), "eol" :named("subtype"), $P869 :named("node"))
    store_lex "$past", $P870
.annotate "line", 187
    find_lex $P871, "$/"
    find_lex $P872, "$past"
    $P873 = $P871."!make"($P872)
.annotate "line", 185
    .return ($P873)
  control_864:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P874, exception, "payload"
    .return ($P874)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<:::>"  :subid("55_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_878
.annotate "line", 190
    new $P877, 'ExceptionHandler'
    set_addr $P877, control_876
    $P877."handle_types"(58)
    push_eh $P877
    .lex "self", self
    .lex "$/", param_878
.annotate "line", 191
    new $P879, "Undef"
    .lex "$past", $P879
    get_hll_global $P880, ["PAST"], "Regex"
    find_lex $P881, "$/"
    $P882 = $P880."new"("cut" :named("pasttype"), $P881 :named("node"))
    store_lex "$past", $P882
.annotate "line", 192
    find_lex $P883, "$/"
    find_lex $P884, "$past"
    $P885 = $P883."!make"($P884)
.annotate "line", 190
    .return ($P885)
  control_876:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P886, exception, "payload"
    .return ($P886)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<lwb>"  :subid("56_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_890
.annotate "line", 195
    new $P889, 'ExceptionHandler'
    set_addr $P889, control_888
    $P889."handle_types"(58)
    push_eh $P889
    .lex "self", self
    .lex "$/", param_890
.annotate "line", 196
    new $P891, "Undef"
    .lex "$past", $P891
    get_hll_global $P892, ["PAST"], "Regex"
    find_lex $P893, "$/"
    $P894 = $P892."new"("anchor" :named("pasttype"), "lwb" :named("subtype"), $P893 :named("node"))
    store_lex "$past", $P894
.annotate "line", 197
    find_lex $P895, "$/"
    find_lex $P896, "$past"
    $P897 = $P895."!make"($P896)
.annotate "line", 195
    .return ($P897)
  control_888:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P898, exception, "payload"
    .return ($P898)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<rwb>"  :subid("57_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_902
.annotate "line", 200
    new $P901, 'ExceptionHandler'
    set_addr $P901, control_900
    $P901."handle_types"(58)
    push_eh $P901
    .lex "self", self
    .lex "$/", param_902
.annotate "line", 201
    new $P903, "Undef"
    .lex "$past", $P903
    get_hll_global $P904, ["PAST"], "Regex"
    find_lex $P905, "$/"
    $P906 = $P904."new"("anchor" :named("pasttype"), "rwb" :named("subtype"), $P905 :named("node"))
    store_lex "$past", $P906
.annotate "line", 202
    find_lex $P907, "$/"
    find_lex $P908, "$past"
    $P909 = $P907."!make"($P908)
.annotate "line", 200
    .return ($P909)
  control_900:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P910, exception, "payload"
    .return ($P910)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<bs>"  :subid("58_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_914
.annotate "line", 205
    new $P913, 'ExceptionHandler'
    set_addr $P913, control_912
    $P913."handle_types"(58)
    push_eh $P913
    .lex "self", self
    .lex "$/", param_914
.annotate "line", 206
    find_lex $P915, "$/"
    find_lex $P916, "$/"
    unless_null $P916, vivify_226
    new $P916, "Hash"
  vivify_226:
    set $P917, $P916["backslash"]
    unless_null $P917, vivify_227
    new $P917, "Undef"
  vivify_227:
    $P918 = $P917."ast"()
    $P919 = $P915."!make"($P918)
.annotate "line", 205
    .return ($P919)
  control_912:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P920, exception, "payload"
    .return ($P920)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<mod>"  :subid("59_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_924
.annotate "line", 209
    new $P923, 'ExceptionHandler'
    set_addr $P923, control_922
    $P923."handle_types"(58)
    push_eh $P923
    .lex "self", self
    .lex "$/", param_924
.annotate "line", 210
    find_lex $P925, "$/"
    find_lex $P926, "$/"
    unless_null $P926, vivify_228
    new $P926, "Hash"
  vivify_228:
    set $P927, $P926["mod_internal"]
    unless_null $P927, vivify_229
    new $P927, "Undef"
  vivify_229:
    $P928 = $P927."ast"()
    $P929 = $P925."!make"($P928)
.annotate "line", 209
    .return ($P929)
  control_922:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P930, exception, "payload"
    .return ($P930)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<assert>"  :subid("60_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_934
.annotate "line", 213
    new $P933, 'ExceptionHandler'
    set_addr $P933, control_932
    $P933."handle_types"(58)
    push_eh $P933
    .lex "self", self
    .lex "$/", param_934
.annotate "line", 214
    find_lex $P935, "$/"
    find_lex $P936, "$/"
    unless_null $P936, vivify_230
    new $P936, "Hash"
  vivify_230:
    set $P937, $P936["assertion"]
    unless_null $P937, vivify_231
    new $P937, "Undef"
  vivify_231:
    $P938 = $P937."ast"()
    $P939 = $P935."!make"($P938)
.annotate "line", 213
    .return ($P939)
  control_932:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P940, exception, "payload"
    .return ($P940)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<~>"  :subid("61_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_944
.annotate "line", 217
    new $P943, 'ExceptionHandler'
    set_addr $P943, control_942
    $P943."handle_types"(58)
    push_eh $P943
    .lex "self", self
    .lex "$/", param_944
.annotate "line", 218
    find_lex $P945, "$/"
    get_hll_global $P946, ["PAST"], "Regex"
.annotate "line", 219
    find_lex $P947, "$/"
    unless_null $P947, vivify_232
    new $P947, "Hash"
  vivify_232:
    set $P948, $P947["EXPR"]
    unless_null $P948, vivify_233
    new $P948, "Undef"
  vivify_233:
    $P949 = $P948."ast"()
.annotate "line", 220
    get_hll_global $P950, ["PAST"], "Regex"
.annotate "line", 221
    find_lex $P951, "$/"
    unless_null $P951, vivify_234
    new $P951, "Hash"
  vivify_234:
    set $P952, $P951["GOAL"]
    unless_null $P952, vivify_235
    new $P952, "Undef"
  vivify_235:
    $P953 = $P952."ast"()
.annotate "line", 222
    get_hll_global $P954, ["PAST"], "Regex"
    find_lex $P955, "$/"
    unless_null $P955, vivify_236
    new $P955, "Hash"
  vivify_236:
    set $P956, $P955["GOAL"]
    unless_null $P956, vivify_237
    new $P956, "Undef"
  vivify_237:
    set $S957, $P956
    $P958 = $P954."new"("FAILGOAL", $S957, "subrule" :named("pasttype"), "method" :named("subtype"))
    $P959 = $P950."new"($P953, $P958, "alt" :named("pasttype"))
.annotate "line", 220
    $P960 = $P946."new"($P949, $P959, "concat" :named("pasttype"))
.annotate "line", 218
    $P961 = $P945."!make"($P960)
.annotate "line", 217
    .return ($P961)
  control_942:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P962, exception, "payload"
    .return ($P962)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<{*}>"  :subid("62_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_966
.annotate "line", 230
    new $P965, 'ExceptionHandler'
    set_addr $P965, control_964
    $P965."handle_types"(58)
    push_eh $P965
    .lex "self", self
    .lex "$/", param_966
.annotate "line", 231
    new $P967, "Undef"
    .lex "$past", $P967
.annotate "line", 232
    find_lex $P970, "$/"
    unless_null $P970, vivify_238
    new $P970, "Hash"
  vivify_238:
    set $P971, $P970["key"]
    unless_null $P971, vivify_239
    new $P971, "Undef"
  vivify_239:
    if $P971, if_969
    new $P979, "Integer"
    assign $P979, 0
    set $P968, $P979
    goto if_969_end
  if_969:
    get_hll_global $P972, ["PAST"], "Regex"
    find_lex $P973, "$/"
    unless_null $P973, vivify_240
    new $P973, "Hash"
  vivify_240:
    set $P974, $P973["key"]
    unless_null $P974, vivify_241
    new $P974, "ResizablePMCArray"
  vivify_241:
    set $P975, $P974[0]
    unless_null $P975, vivify_242
    new $P975, "Undef"
  vivify_242:
    set $S976, $P975
    find_lex $P977, "$/"
    $P978 = $P972."new"($S976, "reduce" :named("pasttype"), $P977 :named("node"))
    set $P968, $P978
  if_969_end:
    store_lex "$past", $P968
.annotate "line", 234
    find_lex $P980, "$/"
    find_lex $P981, "$past"
    $P982 = $P980."!make"($P981)
.annotate "line", 230
    .return ($P982)
  control_964:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P983, exception, "payload"
    .return ($P983)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<var>"  :subid("63_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_987
.annotate "line", 237
    new $P986, 'ExceptionHandler'
    set_addr $P986, control_985
    $P986."handle_types"(58)
    push_eh $P986
    .lex "self", self
    .lex "$/", param_987
.annotate "line", 238
    new $P988, "Undef"
    .lex "$past", $P988
.annotate "line", 239
    new $P989, "Undef"
    .lex "$name", $P989
.annotate "line", 237
    find_lex $P990, "$past"
.annotate "line", 239
    find_lex $P993, "$/"
    unless_null $P993, vivify_243
    new $P993, "Hash"
  vivify_243:
    set $P994, $P993["pos"]
    unless_null $P994, vivify_244
    new $P994, "Undef"
  vivify_244:
    if $P994, if_992
    find_lex $P998, "$/"
    unless_null $P998, vivify_245
    new $P998, "Hash"
  vivify_245:
    set $P999, $P998["name"]
    unless_null $P999, vivify_246
    new $P999, "Undef"
  vivify_246:
    set $S1000, $P999
    new $P991, 'String'
    set $P991, $S1000
    goto if_992_end
  if_992:
    find_lex $P995, "$/"
    unless_null $P995, vivify_247
    new $P995, "Hash"
  vivify_247:
    set $P996, $P995["pos"]
    unless_null $P996, vivify_248
    new $P996, "Undef"
  vivify_248:
    set $N997, $P996
    new $P991, 'Float'
    set $P991, $N997
  if_992_end:
    store_lex "$name", $P991
.annotate "line", 240
    find_lex $P1002, "$/"
    unless_null $P1002, vivify_249
    new $P1002, "Hash"
  vivify_249:
    set $P1003, $P1002["quantified_atom"]
    unless_null $P1003, vivify_250
    new $P1003, "Undef"
  vivify_250:
    if $P1003, if_1001
.annotate "line", 251
    get_hll_global $P1032, ["PAST"], "Regex"
    find_lex $P1033, "$name"
    find_lex $P1034, "$/"
    $P1035 = $P1032."new"("!BACKREF", $P1033, "subrule" :named("pasttype"), "method" :named("subtype"), $P1034 :named("node"))
    store_lex "$past", $P1035
.annotate "line", 250
    goto if_1001_end
  if_1001:
.annotate "line", 241
    find_lex $P1004, "$/"
    unless_null $P1004, vivify_251
    new $P1004, "Hash"
  vivify_251:
    set $P1005, $P1004["quantified_atom"]
    unless_null $P1005, vivify_252
    new $P1005, "ResizablePMCArray"
  vivify_252:
    set $P1006, $P1005[0]
    unless_null $P1006, vivify_253
    new $P1006, "Undef"
  vivify_253:
    $P1007 = $P1006."ast"()
    store_lex "$past", $P1007
.annotate "line", 242
    find_lex $P1011, "$past"
    $S1012 = $P1011."pasttype"()
    iseq $I1013, $S1012, "quant"
    if $I1013, if_1010
    new $P1009, 'Integer'
    set $P1009, $I1013
    goto if_1010_end
  if_1010:
    find_lex $P1014, "$past"
    unless_null $P1014, vivify_254
    new $P1014, "ResizablePMCArray"
  vivify_254:
    set $P1015, $P1014[0]
    unless_null $P1015, vivify_255
    new $P1015, "Undef"
  vivify_255:
    $S1016 = $P1015."pasttype"()
    iseq $I1017, $S1016, "subrule"
    new $P1009, 'Integer'
    set $P1009, $I1017
  if_1010_end:
    if $P1009, if_1008
.annotate "line", 245
    find_lex $P1022, "$past"
    $S1023 = $P1022."pasttype"()
    iseq $I1024, $S1023, "subrule"
    if $I1024, if_1021
.annotate "line", 247
    get_hll_global $P1027, ["PAST"], "Regex"
    find_lex $P1028, "$past"
    find_lex $P1029, "$name"
    find_lex $P1030, "$/"
    $P1031 = $P1027."new"($P1028, $P1029 :named("name"), "subcapture" :named("pasttype"), $P1030 :named("node"))
    store_lex "$past", $P1031
.annotate "line", 246
    goto if_1021_end
  if_1021:
.annotate "line", 245
    find_lex $P1025, "$past"
    find_lex $P1026, "$name"
    "subrule_alias"($P1025, $P1026)
  if_1021_end:
    goto if_1008_end
  if_1008:
.annotate "line", 243
    find_lex $P1018, "$past"
    unless_null $P1018, vivify_256
    new $P1018, "ResizablePMCArray"
  vivify_256:
    set $P1019, $P1018[0]
    unless_null $P1019, vivify_257
    new $P1019, "Undef"
  vivify_257:
    find_lex $P1020, "$name"
    "subrule_alias"($P1019, $P1020)
  if_1008_end:
  if_1001_end:
.annotate "line", 254
    find_lex $P1036, "$/"
    find_lex $P1037, "$past"
    $P1038 = $P1036."!make"($P1037)
.annotate "line", 237
    .return ($P1038)
  control_985:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1039, exception, "payload"
    .return ($P1039)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<PIR>"  :subid("64_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_1043
.annotate "line", 257
    new $P1042, 'ExceptionHandler'
    set_addr $P1042, control_1041
    $P1042."handle_types"(58)
    push_eh $P1042
    .lex "self", self
    .lex "$/", param_1043
.annotate "line", 258
    find_lex $P1044, "$/"
    get_hll_global $P1045, ["PAST"], "Regex"
.annotate "line", 259
    get_hll_global $P1046, ["PAST"], "Op"
    find_lex $P1047, "$/"
    unless_null $P1047, vivify_258
    new $P1047, "Hash"
  vivify_258:
    set $P1048, $P1047["pir"]
    unless_null $P1048, vivify_259
    new $P1048, "Undef"
  vivify_259:
    set $S1049, $P1048
    $P1050 = $P1046."new"($S1049 :named("inline"), "inline" :named("pasttype"))
    find_lex $P1051, "$/"
    $P1052 = $P1045."new"($P1050, "pastnode" :named("pasttype"), $P1051 :named("node"))
.annotate "line", 258
    $P1053 = $P1044."!make"($P1052)
.annotate "line", 257
    .return ($P1053)
  control_1041:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1054, exception, "payload"
    .return ($P1054)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<w>"  :subid("65_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_1058
.annotate "line", 265
    new $P1057, 'ExceptionHandler'
    set_addr $P1057, control_1056
    $P1057."handle_types"(58)
    push_eh $P1057
    .lex "self", self
    .lex "$/", param_1058
.annotate "line", 266
    new $P1059, "Undef"
    .lex "$subtype", $P1059
.annotate "line", 267
    new $P1060, "Undef"
    .lex "$past", $P1060
.annotate "line", 266
    find_lex $P1063, "$/"
    unless_null $P1063, vivify_260
    new $P1063, "Hash"
  vivify_260:
    set $P1064, $P1063["sym"]
    unless_null $P1064, vivify_261
    new $P1064, "Undef"
  vivify_261:
    set $S1065, $P1064
    iseq $I1066, $S1065, "n"
    if $I1066, if_1062
    find_lex $P1068, "$/"
    unless_null $P1068, vivify_262
    new $P1068, "Hash"
  vivify_262:
    set $P1069, $P1068["sym"]
    unless_null $P1069, vivify_263
    new $P1069, "Undef"
  vivify_263:
    set $S1070, $P1069
    new $P1061, 'String'
    set $P1061, $S1070
    goto if_1062_end
  if_1062:
    new $P1067, "String"
    assign $P1067, "nl"
    set $P1061, $P1067
  if_1062_end:
    store_lex "$subtype", $P1061
.annotate "line", 267
    get_hll_global $P1071, ["PAST"], "Regex"
    find_lex $P1072, "$subtype"
    find_lex $P1073, "$/"
    $P1074 = $P1071."new"("charclass" :named("pasttype"), $P1072 :named("subtype"), $P1073 :named("node"))
    store_lex "$past", $P1074
.annotate "line", 268
    find_lex $P1075, "$/"
    find_lex $P1076, "$past"
    $P1077 = $P1075."!make"($P1076)
.annotate "line", 265
    .return ($P1077)
  control_1056:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1078, exception, "payload"
    .return ($P1078)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<b>"  :subid("66_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_1082
.annotate "line", 271
    new $P1081, 'ExceptionHandler'
    set_addr $P1081, control_1080
    $P1081."handle_types"(58)
    push_eh $P1081
    .lex "self", self
    .lex "$/", param_1082
.annotate "line", 272
    new $P1083, "Undef"
    .lex "$past", $P1083
    get_hll_global $P1084, ["PAST"], "Regex"
.annotate "line", 273
    find_lex $P1085, "$/"
    unless_null $P1085, vivify_264
    new $P1085, "Hash"
  vivify_264:
    set $P1086, $P1085["sym"]
    unless_null $P1086, vivify_265
    new $P1086, "Undef"
  vivify_265:
    set $S1087, $P1086
    iseq $I1088, $S1087, "B"
    find_lex $P1089, "$/"
    $P1090 = $P1084."new"("\b", "enumcharlist" :named("pasttype"), $I1088 :named("negate"), $P1089 :named("node"))
.annotate "line", 272
    store_lex "$past", $P1090
.annotate "line", 274
    find_lex $P1091, "$/"
    find_lex $P1092, "$past"
    $P1093 = $P1091."!make"($P1092)
.annotate "line", 271
    .return ($P1093)
  control_1080:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1094, exception, "payload"
    .return ($P1094)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<e>"  :subid("67_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_1098
.annotate "line", 277
    new $P1097, 'ExceptionHandler'
    set_addr $P1097, control_1096
    $P1097."handle_types"(58)
    push_eh $P1097
    .lex "self", self
    .lex "$/", param_1098
.annotate "line", 278
    new $P1099, "Undef"
    .lex "$past", $P1099
    get_hll_global $P1100, ["PAST"], "Regex"
.annotate "line", 279
    find_lex $P1101, "$/"
    unless_null $P1101, vivify_266
    new $P1101, "Hash"
  vivify_266:
    set $P1102, $P1101["sym"]
    unless_null $P1102, vivify_267
    new $P1102, "Undef"
  vivify_267:
    set $S1103, $P1102
    iseq $I1104, $S1103, "E"
    find_lex $P1105, "$/"
    $P1106 = $P1100."new"("\\e", "enumcharlist" :named("pasttype"), $I1104 :named("negate"), $P1105 :named("node"))
.annotate "line", 278
    store_lex "$past", $P1106
.annotate "line", 280
    find_lex $P1107, "$/"
    find_lex $P1108, "$past"
    $P1109 = $P1107."!make"($P1108)
.annotate "line", 277
    .return ($P1109)
  control_1096:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1110, exception, "payload"
    .return ($P1110)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<f>"  :subid("68_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_1114
.annotate "line", 283
    new $P1113, 'ExceptionHandler'
    set_addr $P1113, control_1112
    $P1113."handle_types"(58)
    push_eh $P1113
    .lex "self", self
    .lex "$/", param_1114
.annotate "line", 284
    new $P1115, "Undef"
    .lex "$past", $P1115
    get_hll_global $P1116, ["PAST"], "Regex"
.annotate "line", 285
    find_lex $P1117, "$/"
    unless_null $P1117, vivify_268
    new $P1117, "Hash"
  vivify_268:
    set $P1118, $P1117["sym"]
    unless_null $P1118, vivify_269
    new $P1118, "Undef"
  vivify_269:
    set $S1119, $P1118
    iseq $I1120, $S1119, "F"
    find_lex $P1121, "$/"
    $P1122 = $P1116."new"("\\f", "enumcharlist" :named("pasttype"), $I1120 :named("negate"), $P1121 :named("node"))
.annotate "line", 284
    store_lex "$past", $P1122
.annotate "line", 286
    find_lex $P1123, "$/"
    find_lex $P1124, "$past"
    $P1125 = $P1123."!make"($P1124)
.annotate "line", 283
    .return ($P1125)
  control_1112:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1126, exception, "payload"
    .return ($P1126)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<h>"  :subid("69_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_1130
.annotate "line", 289
    new $P1129, 'ExceptionHandler'
    set_addr $P1129, control_1128
    $P1129."handle_types"(58)
    push_eh $P1129
    .lex "self", self
    .lex "$/", param_1130
.annotate "line", 290
    new $P1131, "Undef"
    .lex "$past", $P1131
    get_hll_global $P1132, ["PAST"], "Regex"
.annotate "line", 291
    find_lex $P1133, "$/"
    unless_null $P1133, vivify_270
    new $P1133, "Hash"
  vivify_270:
    set $P1134, $P1133["sym"]
    unless_null $P1134, vivify_271
    new $P1134, "Undef"
  vivify_271:
    set $S1135, $P1134
    iseq $I1136, $S1135, "H"
    find_lex $P1137, "$/"
    $P1138 = $P1132."new"(unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", "enumcharlist" :named("pasttype"), $I1136 :named("negate"), $P1137 :named("node"))
.annotate "line", 290
    store_lex "$past", $P1138
.annotate "line", 292
    find_lex $P1139, "$/"
    find_lex $P1140, "$past"
    $P1141 = $P1139."!make"($P1140)
.annotate "line", 289
    .return ($P1141)
  control_1128:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1142, exception, "payload"
    .return ($P1142)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<r>"  :subid("70_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_1146
.annotate "line", 295
    new $P1145, 'ExceptionHandler'
    set_addr $P1145, control_1144
    $P1145."handle_types"(58)
    push_eh $P1145
    .lex "self", self
    .lex "$/", param_1146
.annotate "line", 296
    new $P1147, "Undef"
    .lex "$past", $P1147
    get_hll_global $P1148, ["PAST"], "Regex"
.annotate "line", 297
    find_lex $P1149, "$/"
    unless_null $P1149, vivify_272
    new $P1149, "Hash"
  vivify_272:
    set $P1150, $P1149["sym"]
    unless_null $P1150, vivify_273
    new $P1150, "Undef"
  vivify_273:
    set $S1151, $P1150
    iseq $I1152, $S1151, "R"
    find_lex $P1153, "$/"
    $P1154 = $P1148."new"("\r", "enumcharlist" :named("pasttype"), $I1152 :named("negate"), $P1153 :named("node"))
.annotate "line", 296
    store_lex "$past", $P1154
.annotate "line", 298
    find_lex $P1155, "$/"
    find_lex $P1156, "$past"
    $P1157 = $P1155."!make"($P1156)
.annotate "line", 295
    .return ($P1157)
  control_1144:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1158, exception, "payload"
    .return ($P1158)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<t>"  :subid("71_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_1162
.annotate "line", 301
    new $P1161, 'ExceptionHandler'
    set_addr $P1161, control_1160
    $P1161."handle_types"(58)
    push_eh $P1161
    .lex "self", self
    .lex "$/", param_1162
.annotate "line", 302
    new $P1163, "Undef"
    .lex "$past", $P1163
    get_hll_global $P1164, ["PAST"], "Regex"
.annotate "line", 303
    find_lex $P1165, "$/"
    unless_null $P1165, vivify_274
    new $P1165, "Hash"
  vivify_274:
    set $P1166, $P1165["sym"]
    unless_null $P1166, vivify_275
    new $P1166, "Undef"
  vivify_275:
    set $S1167, $P1166
    iseq $I1168, $S1167, "T"
    find_lex $P1169, "$/"
    $P1170 = $P1164."new"("\t", "enumcharlist" :named("pasttype"), $I1168 :named("negate"), $P1169 :named("node"))
.annotate "line", 302
    store_lex "$past", $P1170
.annotate "line", 304
    find_lex $P1171, "$/"
    find_lex $P1172, "$past"
    $P1173 = $P1171."!make"($P1172)
.annotate "line", 301
    .return ($P1173)
  control_1160:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1174, exception, "payload"
    .return ($P1174)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<v>"  :subid("72_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_1178
.annotate "line", 307
    new $P1177, 'ExceptionHandler'
    set_addr $P1177, control_1176
    $P1177."handle_types"(58)
    push_eh $P1177
    .lex "self", self
    .lex "$/", param_1178
.annotate "line", 308
    new $P1179, "Undef"
    .lex "$past", $P1179
    get_hll_global $P1180, ["PAST"], "Regex"
.annotate "line", 310
    find_lex $P1181, "$/"
    unless_null $P1181, vivify_276
    new $P1181, "Hash"
  vivify_276:
    set $P1182, $P1181["sym"]
    unless_null $P1182, vivify_277
    new $P1182, "Undef"
  vivify_277:
    set $S1183, $P1182
    iseq $I1184, $S1183, "V"
    find_lex $P1185, "$/"
    $P1186 = $P1180."new"(unicode:"\n\x{b}\f\r\x{85}\u2028\u2029", "enumcharlist" :named("pasttype"), $I1184 :named("negate"), $P1185 :named("node"))
.annotate "line", 308
    store_lex "$past", $P1186
.annotate "line", 311
    find_lex $P1187, "$/"
    find_lex $P1188, "$past"
    $P1189 = $P1187."!make"($P1188)
.annotate "line", 307
    .return ($P1189)
  control_1176:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1190, exception, "payload"
    .return ($P1190)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<o>"  :subid("73_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_1194
.annotate "line", 314
    new $P1193, 'ExceptionHandler'
    set_addr $P1193, control_1192
    $P1193."handle_types"(58)
    push_eh $P1193
    .lex "self", self
    .lex "$/", param_1194
.annotate "line", 315
    new $P1195, "Undef"
    .lex "$octlit", $P1195
.annotate "line", 316
    get_hll_global $P1196, ["HLL";"Actions"], "ints_to_string"
    find_lex $P1199, "$/"
    unless_null $P1199, vivify_278
    new $P1199, "Hash"
  vivify_278:
    set $P1200, $P1199["octint"]
    unless_null $P1200, vivify_279
    new $P1200, "Undef"
  vivify_279:
    unless $P1200, unless_1198
    set $P1197, $P1200
    goto unless_1198_end
  unless_1198:
    find_lex $P1201, "$/"
    unless_null $P1201, vivify_280
    new $P1201, "Hash"
  vivify_280:
    set $P1202, $P1201["octints"]
    unless_null $P1202, vivify_281
    new $P1202, "Hash"
  vivify_281:
    set $P1203, $P1202["octint"]
    unless_null $P1203, vivify_282
    new $P1203, "Undef"
  vivify_282:
    set $P1197, $P1203
  unless_1198_end:
    $P1204 = $P1196($P1197)
    store_lex "$octlit", $P1204
.annotate "line", 317
    find_lex $P1205, "$/"
    find_lex $P1208, "$/"
    unless_null $P1208, vivify_283
    new $P1208, "Hash"
  vivify_283:
    set $P1209, $P1208["sym"]
    unless_null $P1209, vivify_284
    new $P1209, "Undef"
  vivify_284:
    set $S1210, $P1209
    iseq $I1211, $S1210, "O"
    if $I1211, if_1207
.annotate "line", 320
    get_hll_global $P1216, ["PAST"], "Regex"
    find_lex $P1217, "$octlit"
    find_lex $P1218, "$/"
    $P1219 = $P1216."new"($P1217, "literal" :named("pasttype"), $P1218 :named("node"))
    set $P1206, $P1219
.annotate "line", 317
    goto if_1207_end
  if_1207:
.annotate "line", 318
    get_hll_global $P1212, ["PAST"], "Regex"
    find_lex $P1213, "$octlit"
    find_lex $P1214, "$/"
    $P1215 = $P1212."new"($P1213, "enumcharlist" :named("pasttype"), 1 :named("negate"), $P1214 :named("node"))
    set $P1206, $P1215
  if_1207_end:
    $P1220 = $P1205."!make"($P1206)
.annotate "line", 314
    .return ($P1220)
  control_1192:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1221, exception, "payload"
    .return ($P1221)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<x>"  :subid("74_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_1225
.annotate "line", 323
    new $P1224, 'ExceptionHandler'
    set_addr $P1224, control_1223
    $P1224."handle_types"(58)
    push_eh $P1224
    .lex "self", self
    .lex "$/", param_1225
.annotate "line", 324
    new $P1226, "Undef"
    .lex "$hexlit", $P1226
.annotate "line", 325
    get_hll_global $P1227, ["HLL";"Actions"], "ints_to_string"
    find_lex $P1230, "$/"
    unless_null $P1230, vivify_285
    new $P1230, "Hash"
  vivify_285:
    set $P1231, $P1230["hexint"]
    unless_null $P1231, vivify_286
    new $P1231, "Undef"
  vivify_286:
    unless $P1231, unless_1229
    set $P1228, $P1231
    goto unless_1229_end
  unless_1229:
    find_lex $P1232, "$/"
    unless_null $P1232, vivify_287
    new $P1232, "Hash"
  vivify_287:
    set $P1233, $P1232["hexints"]
    unless_null $P1233, vivify_288
    new $P1233, "Hash"
  vivify_288:
    set $P1234, $P1233["hexint"]
    unless_null $P1234, vivify_289
    new $P1234, "Undef"
  vivify_289:
    set $P1228, $P1234
  unless_1229_end:
    $P1235 = $P1227($P1228)
    store_lex "$hexlit", $P1235
.annotate "line", 326
    find_lex $P1236, "$/"
    find_lex $P1239, "$/"
    unless_null $P1239, vivify_290
    new $P1239, "Hash"
  vivify_290:
    set $P1240, $P1239["sym"]
    unless_null $P1240, vivify_291
    new $P1240, "Undef"
  vivify_291:
    set $S1241, $P1240
    iseq $I1242, $S1241, "X"
    if $I1242, if_1238
.annotate "line", 329
    get_hll_global $P1247, ["PAST"], "Regex"
    find_lex $P1248, "$hexlit"
    find_lex $P1249, "$/"
    $P1250 = $P1247."new"($P1248, "literal" :named("pasttype"), $P1249 :named("node"))
    set $P1237, $P1250
.annotate "line", 326
    goto if_1238_end
  if_1238:
.annotate "line", 327
    get_hll_global $P1243, ["PAST"], "Regex"
    find_lex $P1244, "$hexlit"
    find_lex $P1245, "$/"
    $P1246 = $P1243."new"($P1244, "enumcharlist" :named("pasttype"), 1 :named("negate"), $P1245 :named("node"))
    set $P1237, $P1246
  if_1238_end:
    $P1251 = $P1236."!make"($P1237)
.annotate "line", 323
    .return ($P1251)
  control_1223:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1252, exception, "payload"
    .return ($P1252)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<misc>"  :subid("75_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_1256
.annotate "line", 332
    new $P1255, 'ExceptionHandler'
    set_addr $P1255, control_1254
    $P1255."handle_types"(58)
    push_eh $P1255
    .lex "self", self
    .lex "$/", param_1256
.annotate "line", 333
    new $P1257, "Undef"
    .lex "$past", $P1257
    get_hll_global $P1258, ["PAST"], "Regex"
    find_lex $P1259, "$/"
    set $S1260, $P1259
    find_lex $P1261, "$/"
    $P1262 = $P1258."new"($S1260, "literal" :named("pasttype"), $P1261 :named("node"))
    store_lex "$past", $P1262
.annotate "line", 334
    find_lex $P1263, "$/"
    find_lex $P1264, "$past"
    $P1265 = $P1263."!make"($P1264)
.annotate "line", 332
    .return ($P1265)
  control_1254:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1266, exception, "payload"
    .return ($P1266)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<?>"  :subid("76_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_1270
.annotate "line", 338
    new $P1269, 'ExceptionHandler'
    set_addr $P1269, control_1268
    $P1269."handle_types"(58)
    push_eh $P1269
    .lex "self", self
    .lex "$/", param_1270
.annotate "line", 339
    new $P1271, "Undef"
    .lex "$past", $P1271
.annotate "line", 338
    find_lex $P1272, "$past"
.annotate "line", 340
    find_lex $P1274, "$/"
    unless_null $P1274, vivify_292
    new $P1274, "Hash"
  vivify_292:
    set $P1275, $P1274["assertion"]
    unless_null $P1275, vivify_293
    new $P1275, "Undef"
  vivify_293:
    if $P1275, if_1273
.annotate "line", 344
    new $P1280, "Integer"
    assign $P1280, 0
    store_lex "$past", $P1280
    goto if_1273_end
  if_1273:
.annotate "line", 341
    find_lex $P1276, "$/"
    unless_null $P1276, vivify_294
    new $P1276, "Hash"
  vivify_294:
    set $P1277, $P1276["assertion"]
    unless_null $P1277, vivify_295
    new $P1277, "Undef"
  vivify_295:
    $P1278 = $P1277."ast"()
    store_lex "$past", $P1278
.annotate "line", 342
    find_lex $P1279, "$past"
    $P1279."subtype"("zerowidth")
  if_1273_end:
.annotate "line", 345
    find_lex $P1281, "$/"
    find_lex $P1282, "$past"
    $P1283 = $P1281."!make"($P1282)
.annotate "line", 338
    .return ($P1283)
  control_1268:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1284, exception, "payload"
    .return ($P1284)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<!>"  :subid("77_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_1288
.annotate "line", 348
    new $P1287, 'ExceptionHandler'
    set_addr $P1287, control_1286
    $P1287."handle_types"(58)
    push_eh $P1287
    .lex "self", self
    .lex "$/", param_1288
.annotate "line", 349
    new $P1289, "Undef"
    .lex "$past", $P1289
.annotate "line", 348
    find_lex $P1290, "$past"
.annotate "line", 350
    find_lex $P1292, "$/"
    unless_null $P1292, vivify_296
    new $P1292, "Hash"
  vivify_296:
    set $P1293, $P1292["assertion"]
    unless_null $P1293, vivify_297
    new $P1293, "Undef"
  vivify_297:
    if $P1293, if_1291
.annotate "line", 356
    get_hll_global $P1302, ["PAST"], "Regex"
    find_lex $P1303, "$/"
    $P1304 = $P1302."new"("anchor" :named("pasttype"), "fail" :named("subtype"), $P1303 :named("node"))
    store_lex "$past", $P1304
.annotate "line", 355
    goto if_1291_end
  if_1291:
.annotate "line", 351
    find_lex $P1294, "$/"
    unless_null $P1294, vivify_298
    new $P1294, "Hash"
  vivify_298:
    set $P1295, $P1294["assertion"]
    unless_null $P1295, vivify_299
    new $P1295, "Undef"
  vivify_299:
    $P1296 = $P1295."ast"()
    store_lex "$past", $P1296
.annotate "line", 352
    find_lex $P1297, "$past"
    find_lex $P1298, "$past"
    $P1299 = $P1298."negate"()
    isfalse $I1300, $P1299
    $P1297."negate"($I1300)
.annotate "line", 353
    find_lex $P1301, "$past"
    $P1301."subtype"("zerowidth")
  if_1291_end:
.annotate "line", 358
    find_lex $P1305, "$/"
    find_lex $P1306, "$past"
    $P1307 = $P1305."!make"($P1306)
.annotate "line", 348
    .return ($P1307)
  control_1286:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1308, exception, "payload"
    .return ($P1308)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<method>"  :subid("78_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_1312
.annotate "line", 361
    new $P1311, 'ExceptionHandler'
    set_addr $P1311, control_1310
    $P1311."handle_types"(58)
    push_eh $P1311
    .lex "self", self
    .lex "$/", param_1312
.annotate "line", 362
    new $P1313, "Undef"
    .lex "$past", $P1313
    find_lex $P1314, "$/"
    unless_null $P1314, vivify_300
    new $P1314, "Hash"
  vivify_300:
    set $P1315, $P1314["assertion"]
    unless_null $P1315, vivify_301
    new $P1315, "Undef"
  vivify_301:
    $P1316 = $P1315."ast"()
    store_lex "$past", $P1316
.annotate "line", 363
    find_lex $P1317, "$past"
    $P1317."subtype"("method")
.annotate "line", 364
    find_lex $P1318, "$past"
    $P1318."name"("")
.annotate "line", 365
    find_lex $P1319, "$/"
    find_lex $P1320, "$past"
    $P1321 = $P1319."!make"($P1320)
.annotate "line", 361
    .return ($P1321)
  control_1310:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1322, exception, "payload"
    .return ($P1322)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<name>"  :subid("79_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_1326
.annotate "line", 368
    .const 'Sub' $P1384 = "81_1259420187.47956" 
    capture_lex $P1384
    .const 'Sub' $P1348 = "80_1259420187.47956" 
    capture_lex $P1348
    new $P1325, 'ExceptionHandler'
    set_addr $P1325, control_1324
    $P1325."handle_types"(58)
    push_eh $P1325
    .lex "self", self
    .lex "$/", param_1326
.annotate "line", 369
    new $P1327, "Undef"
    .lex "$name", $P1327
.annotate "line", 370
    new $P1328, "Undef"
    .lex "$past", $P1328
.annotate "line", 369
    find_lex $P1329, "$/"
    unless_null $P1329, vivify_302
    new $P1329, "Hash"
  vivify_302:
    set $P1330, $P1329["longname"]
    unless_null $P1330, vivify_303
    new $P1330, "Undef"
  vivify_303:
    set $S1331, $P1330
    new $P1332, 'String'
    set $P1332, $S1331
    store_lex "$name", $P1332
    find_lex $P1333, "$past"
.annotate "line", 371
    find_lex $P1335, "$/"
    unless_null $P1335, vivify_304
    new $P1335, "Hash"
  vivify_304:
    set $P1336, $P1335["assertion"]
    unless_null $P1336, vivify_305
    new $P1336, "Undef"
  vivify_305:
    if $P1336, if_1334
.annotate "line", 375
    find_lex $P1344, "$name"
    set $S1345, $P1344
    iseq $I1346, $S1345, "sym"
    if $I1346, if_1343
.annotate "line", 391
    get_hll_global $P1358, ["PAST"], "Regex"
    find_lex $P1359, "$name"
    find_lex $P1360, "$name"
    find_lex $P1361, "$/"
    $P1362 = $P1358."new"($P1359, $P1360 :named("name"), "subrule" :named("pasttype"), "capture" :named("subtype"), $P1361 :named("node"))
    store_lex "$past", $P1362
.annotate "line", 393
    find_lex $P1364, "$/"
    unless_null $P1364, vivify_306
    new $P1364, "Hash"
  vivify_306:
    set $P1365, $P1364["nibbler"]
    unless_null $P1365, vivify_307
    new $P1365, "Undef"
  vivify_307:
    if $P1365, if_1363
.annotate "line", 396
    find_lex $P1373, "$/"
    unless_null $P1373, vivify_308
    new $P1373, "Hash"
  vivify_308:
    set $P1374, $P1373["arglist"]
    unless_null $P1374, vivify_309
    new $P1374, "Undef"
  vivify_309:
    unless $P1374, if_1372_end
.annotate "line", 397
    find_lex $P1376, "$/"
    unless_null $P1376, vivify_310
    new $P1376, "Hash"
  vivify_310:
    set $P1377, $P1376["arglist"]
    unless_null $P1377, vivify_311
    new $P1377, "ResizablePMCArray"
  vivify_311:
    set $P1378, $P1377[0]
    unless_null $P1378, vivify_312
    new $P1378, "Undef"
  vivify_312:
    $P1379 = $P1378."ast"()
    $P1380 = $P1379."list"()
    defined $I1381, $P1380
    unless $I1381, for_undef_313
    iter $P1375, $P1380
    new $P1390, 'ExceptionHandler'
    set_addr $P1390, loop1389_handler
    $P1390."handle_types"(65, 67, 66)
    push_eh $P1390
  loop1389_test:
    unless $P1375, loop1389_done
    shift $P1382, $P1375
  loop1389_redo:
    .const 'Sub' $P1384 = "81_1259420187.47956" 
    capture_lex $P1384
    $P1384($P1382)
  loop1389_next:
    goto loop1389_test
  loop1389_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1391, exception, 'type'
    eq $P1391, 65, loop1389_next
    eq $P1391, 67, loop1389_redo
  loop1389_done:
    pop_eh 
  for_undef_313:
  if_1372_end:
.annotate "line", 396
    goto if_1363_end
  if_1363:
.annotate "line", 394
    find_lex $P1366, "$past"
    find_lex $P1367, "$/"
    unless_null $P1367, vivify_314
    new $P1367, "Hash"
  vivify_314:
    set $P1368, $P1367["nibbler"]
    unless_null $P1368, vivify_315
    new $P1368, "ResizablePMCArray"
  vivify_315:
    set $P1369, $P1368[0]
    unless_null $P1369, vivify_316
    new $P1369, "Undef"
  vivify_316:
    $P1370 = $P1369."ast"()
    $P1371 = "buildsub"($P1370)
    $P1366."push"($P1371)
  if_1363_end:
.annotate "line", 390
    goto if_1343_end
  if_1343:
.annotate "line", 375
    .const 'Sub' $P1348 = "80_1259420187.47956" 
    capture_lex $P1348
    $P1348()
  if_1343_end:
    goto if_1334_end
  if_1334:
.annotate "line", 372
    find_lex $P1337, "$/"
    unless_null $P1337, vivify_317
    new $P1337, "Hash"
  vivify_317:
    set $P1338, $P1337["assertion"]
    unless_null $P1338, vivify_318
    new $P1338, "ResizablePMCArray"
  vivify_318:
    set $P1339, $P1338[0]
    unless_null $P1339, vivify_319
    new $P1339, "Undef"
  vivify_319:
    $P1340 = $P1339."ast"()
    store_lex "$past", $P1340
.annotate "line", 373
    find_lex $P1341, "$past"
    find_lex $P1342, "$name"
    "subrule_alias"($P1341, $P1342)
  if_1334_end:
.annotate "line", 400
    find_lex $P1392, "$/"
    find_lex $P1393, "$past"
    $P1394 = $P1392."!make"($P1393)
.annotate "line", 368
    .return ($P1394)
  control_1324:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1395, exception, "payload"
    .return ($P1395)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1383"  :anon :subid("81_1259420187.47956") :outer("79_1259420187.47956")
    .param pmc param_1385
.annotate "line", 397
    .lex "$_", param_1385
    find_lex $P1386, "$past"
    find_lex $P1387, "$_"
    $P1388 = $P1386."push"($P1387)
    .return ($P1388)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1347"  :anon :subid("80_1259420187.47956") :outer("79_1259420187.47956")
.annotate "line", 376
    new $P1349, "Undef"
    .lex "$regexsym", $P1349

            $P0 = get_global '$REGEXNAME'
            $S0 = $P0
            $I0 = index $S0, ':sym<'
            add $I0, 5
            $S0 = substr $S0, $I0
            chopn $S0, 1
            $P1350 = box $S0
        
    store_lex "$regexsym", $P1350
.annotate "line", 385
    get_hll_global $P1351, ["PAST"], "Regex"
.annotate "line", 386
    get_hll_global $P1352, ["PAST"], "Regex"
    find_lex $P1353, "$regexsym"
    $P1354 = $P1352."new"($P1353, "literal" :named("pasttype"))
    find_lex $P1355, "$name"
    find_lex $P1356, "$/"
    $P1357 = $P1351."new"($P1354, $P1355 :named("name"), "subcapture" :named("pasttype"), $P1356 :named("node"))
.annotate "line", 385
    store_lex "$past", $P1357
.annotate "line", 375
    .return ($P1357)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<[>"  :subid("82_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_1399
.annotate "line", 403
    .const 'Sub' $P1434 = "83_1259420187.47956" 
    capture_lex $P1434
    new $P1398, 'ExceptionHandler'
    set_addr $P1398, control_1397
    $P1398."handle_types"(58)
    push_eh $P1398
    .lex "self", self
    .lex "$/", param_1399
.annotate "line", 404
    new $P1400, "Undef"
    .lex "$clist", $P1400
.annotate "line", 405
    new $P1401, "Undef"
    .lex "$past", $P1401
.annotate "line", 414
    new $P1402, "Undef"
    .lex "$i", $P1402
.annotate "line", 415
    new $P1403, "Undef"
    .lex "$n", $P1403
.annotate "line", 404
    find_lex $P1404, "$/"
    unless_null $P1404, vivify_320
    new $P1404, "Hash"
  vivify_320:
    set $P1405, $P1404["cclass_elem"]
    unless_null $P1405, vivify_321
    new $P1405, "Undef"
  vivify_321:
    store_lex "$clist", $P1405
.annotate "line", 405
    find_lex $P1406, "$clist"
    unless_null $P1406, vivify_322
    new $P1406, "ResizablePMCArray"
  vivify_322:
    set $P1407, $P1406[0]
    unless_null $P1407, vivify_323
    new $P1407, "Undef"
  vivify_323:
    $P1408 = $P1407."ast"()
    store_lex "$past", $P1408
.annotate "line", 406
    find_lex $P1412, "$past"
    $P1413 = $P1412."negate"()
    if $P1413, if_1411
    set $P1410, $P1413
    goto if_1411_end
  if_1411:
    find_lex $P1414, "$past"
    $S1415 = $P1414."pasttype"()
    iseq $I1416, $S1415, "subrule"
    new $P1410, 'Integer'
    set $P1410, $I1416
  if_1411_end:
    unless $P1410, if_1409_end
.annotate "line", 407
    find_lex $P1417, "$past"
    $P1417."subtype"("zerowidth")
.annotate "line", 408
    get_hll_global $P1418, ["PAST"], "Regex"
    find_lex $P1419, "$past"
.annotate "line", 410
    get_hll_global $P1420, ["PAST"], "Regex"
    $P1421 = $P1420."new"("charclass" :named("pasttype"), "." :named("subtype"))
    find_lex $P1422, "$/"
    $P1423 = $P1418."new"($P1419, $P1421, $P1422 :named("node"))
.annotate "line", 408
    store_lex "$past", $P1423
  if_1409_end:
.annotate "line", 414
    new $P1424, "Integer"
    assign $P1424, 1
    store_lex "$i", $P1424
.annotate "line", 415
    find_lex $P1425, "$clist"
    set $N1426, $P1425
    new $P1427, 'Float'
    set $P1427, $N1426
    store_lex "$n", $P1427
.annotate "line", 416
    new $P1458, 'ExceptionHandler'
    set_addr $P1458, loop1457_handler
    $P1458."handle_types"(65, 67, 66)
    push_eh $P1458
  loop1457_test:
    find_lex $P1428, "$i"
    set $N1429, $P1428
    find_lex $P1430, "$n"
    set $N1431, $P1430
    islt $I1432, $N1429, $N1431
    unless $I1432, loop1457_done
  loop1457_redo:
    .const 'Sub' $P1434 = "83_1259420187.47956" 
    capture_lex $P1434
    $P1434()
  loop1457_next:
    goto loop1457_test
  loop1457_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1459, exception, 'type'
    eq $P1459, 65, loop1457_next
    eq $P1459, 67, loop1457_redo
  loop1457_done:
    pop_eh 
.annotate "line", 427
    find_lex $P1460, "$/"
    find_lex $P1461, "$past"
    $P1462 = $P1460."!make"($P1461)
.annotate "line", 403
    .return ($P1462)
  control_1397:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1463, exception, "payload"
    .return ($P1463)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1433"  :anon :subid("83_1259420187.47956") :outer("82_1259420187.47956")
.annotate "line", 417
    new $P1435, "Undef"
    .lex "$ast", $P1435
    find_lex $P1436, "$i"
    set $I1437, $P1436
    find_lex $P1438, "$clist"
    unless_null $P1438, vivify_324
    new $P1438, "ResizablePMCArray"
  vivify_324:
    set $P1439, $P1438[$I1437]
    unless_null $P1439, vivify_325
    new $P1439, "Undef"
  vivify_325:
    $P1440 = $P1439."ast"()
    store_lex "$ast", $P1440
.annotate "line", 418
    find_lex $P1442, "$ast"
    $P1443 = $P1442."negate"()
    if $P1443, if_1441
.annotate "line", 423
    get_hll_global $P1450, ["PAST"], "Regex"
    find_lex $P1451, "$past"
    find_lex $P1452, "$ast"
    find_lex $P1453, "$/"
    $P1454 = $P1450."new"($P1451, $P1452, "alt" :named("pasttype"), $P1453 :named("node"))
    store_lex "$past", $P1454
.annotate "line", 422
    goto if_1441_end
  if_1441:
.annotate "line", 419
    find_lex $P1444, "$ast"
    $P1444."subtype"("zerowidth")
.annotate "line", 420
    get_hll_global $P1445, ["PAST"], "Regex"
    find_lex $P1446, "$ast"
    find_lex $P1447, "$past"
    find_lex $P1448, "$/"
    $P1449 = $P1445."new"($P1446, $P1447, "concat" :named("pasttype"), $P1448 :named("node"))
    store_lex "$past", $P1449
  if_1441_end:
.annotate "line", 425
    find_lex $P1455, "$i"
    add $P1456, $P1455, 1
    store_lex "$i", $P1456
.annotate "line", 416
    .return ($P1456)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "cclass_elem"  :subid("84_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_1467
.annotate "line", 430
    .const 'Sub' $P1492 = "86_1259420187.47956" 
    capture_lex $P1492
    .const 'Sub' $P1476 = "85_1259420187.47956" 
    capture_lex $P1476
    new $P1466, 'ExceptionHandler'
    set_addr $P1466, control_1465
    $P1466."handle_types"(58)
    push_eh $P1466
    .lex "self", self
    .lex "$/", param_1467
.annotate "line", 431
    new $P1468, "Undef"
    .lex "$str", $P1468
.annotate "line", 432
    new $P1469, "Undef"
    .lex "$past", $P1469
.annotate "line", 431
    new $P1470, "String"
    assign $P1470, ""
    store_lex "$str", $P1470
    find_lex $P1471, "$past"
.annotate "line", 433
    find_lex $P1473, "$/"
    unless_null $P1473, vivify_326
    new $P1473, "Hash"
  vivify_326:
    set $P1474, $P1473["name"]
    unless_null $P1474, vivify_327
    new $P1474, "Undef"
  vivify_327:
    if $P1474, if_1472
.annotate "line", 437
    find_lex $P1487, "$/"
    unless_null $P1487, vivify_328
    new $P1487, "Hash"
  vivify_328:
    set $P1488, $P1487["charspec"]
    unless_null $P1488, vivify_329
    new $P1488, "Undef"
  vivify_329:
    defined $I1489, $P1488
    unless $I1489, for_undef_330
    iter $P1486, $P1488
    new $P1518, 'ExceptionHandler'
    set_addr $P1518, loop1517_handler
    $P1518."handle_types"(65, 67, 66)
    push_eh $P1518
  loop1517_test:
    unless $P1486, loop1517_done
    shift $P1490, $P1486
  loop1517_redo:
    .const 'Sub' $P1492 = "86_1259420187.47956" 
    capture_lex $P1492
    $P1492($P1490)
  loop1517_next:
    goto loop1517_test
  loop1517_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1519, exception, 'type'
    eq $P1519, 65, loop1517_next
    eq $P1519, 67, loop1517_redo
  loop1517_done:
    pop_eh 
  for_undef_330:
.annotate "line", 462
    get_hll_global $P1520, ["PAST"], "Regex"
    find_lex $P1521, "$str"
    find_lex $P1522, "$/"
    $P1523 = $P1520."new"($P1521, "enumcharlist" :named("pasttype"), $P1522 :named("node"))
    store_lex "$past", $P1523
.annotate "line", 436
    goto if_1472_end
  if_1472:
.annotate "line", 433
    .const 'Sub' $P1476 = "85_1259420187.47956" 
    capture_lex $P1476
    $P1476()
  if_1472_end:
.annotate "line", 464
    find_lex $P1524, "$past"
    find_lex $P1525, "$/"
    unless_null $P1525, vivify_342
    new $P1525, "Hash"
  vivify_342:
    set $P1526, $P1525["sign"]
    unless_null $P1526, vivify_343
    new $P1526, "Undef"
  vivify_343:
    set $S1527, $P1526
    iseq $I1528, $S1527, "-"
    $P1524."negate"($I1528)
.annotate "line", 465
    find_lex $P1529, "$/"
    find_lex $P1530, "$past"
    $P1531 = $P1529."!make"($P1530)
.annotate "line", 430
    .return ($P1531)
  control_1465:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1532, exception, "payload"
    .return ($P1532)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1491"  :anon :subid("86_1259420187.47956") :outer("84_1259420187.47956")
    .param pmc param_1493
.annotate "line", 437
    .const 'Sub' $P1499 = "87_1259420187.47956" 
    capture_lex $P1499
    .lex "$_", param_1493
.annotate "line", 438
    find_lex $P1496, "$_"
    unless_null $P1496, vivify_331
    new $P1496, "ResizablePMCArray"
  vivify_331:
    set $P1497, $P1496[1]
    unless_null $P1497, vivify_332
    new $P1497, "Undef"
  vivify_332:
    if $P1497, if_1495
.annotate "line", 460
    find_lex $P1513, "$str"
    find_lex $P1514, "$_"
    unless_null $P1514, vivify_333
    new $P1514, "ResizablePMCArray"
  vivify_333:
    set $P1515, $P1514[0]
    unless_null $P1515, vivify_334
    new $P1515, "Undef"
  vivify_334:
    concat $P1516, $P1513, $P1515
    store_lex "$str", $P1516
    set $P1494, $P1516
.annotate "line", 438
    goto if_1495_end
  if_1495:
    .const 'Sub' $P1499 = "87_1259420187.47956" 
    capture_lex $P1499
    $P1512 = $P1499()
    set $P1494, $P1512
  if_1495_end:
.annotate "line", 437
    .return ($P1494)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1498"  :anon :subid("87_1259420187.47956") :outer("86_1259420187.47956")
.annotate "line", 439
    new $P1500, "Undef"
    .lex "$a", $P1500
.annotate "line", 440
    new $P1501, "Undef"
    .lex "$b", $P1501
.annotate "line", 441
    new $P1502, "Undef"
    .lex "$c", $P1502
.annotate "line", 439
    find_lex $P1503, "$_"
    unless_null $P1503, vivify_335
    new $P1503, "ResizablePMCArray"
  vivify_335:
    set $P1504, $P1503[0]
    unless_null $P1504, vivify_336
    new $P1504, "Undef"
  vivify_336:
    store_lex "$a", $P1504
.annotate "line", 440
    find_lex $P1505, "$_"
    unless_null $P1505, vivify_337
    new $P1505, "ResizablePMCArray"
  vivify_337:
    set $P1506, $P1505[1]
    unless_null $P1506, vivify_338
    new $P1506, "ResizablePMCArray"
  vivify_338:
    set $P1507, $P1506[0]
    unless_null $P1507, vivify_339
    new $P1507, "Undef"
  vivify_339:
    store_lex "$b", $P1507
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
                             $P1508 = box $S2
                         
    store_lex "$c", $P1508
.annotate "line", 458
    find_lex $P1509, "$str"
    find_lex $P1510, "$c"
    concat $P1511, $P1509, $P1510
    store_lex "$str", $P1511
.annotate "line", 438
    .return ($P1511)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1475"  :anon :subid("85_1259420187.47956") :outer("84_1259420187.47956")
.annotate "line", 434
    new $P1477, "Undef"
    .lex "$name", $P1477
    find_lex $P1478, "$/"
    unless_null $P1478, vivify_340
    new $P1478, "Hash"
  vivify_340:
    set $P1479, $P1478["name"]
    unless_null $P1479, vivify_341
    new $P1479, "Undef"
  vivify_341:
    set $S1480, $P1479
    new $P1481, 'String'
    set $P1481, $S1480
    store_lex "$name", $P1481
.annotate "line", 435
    get_hll_global $P1482, ["PAST"], "Regex"
    find_lex $P1483, "$name"
    find_lex $P1484, "$/"
    $P1485 = $P1482."new"($P1483, "subrule" :named("pasttype"), "method" :named("subtype"), $P1484 :named("node"))
    store_lex "$past", $P1485
.annotate "line", 433
    .return ($P1485)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "mod_internal"  :subid("88_1259420187.47956") :method :outer("11_1259420187.47956")
    .param pmc param_1536
.annotate "line", 468
    new $P1535, 'ExceptionHandler'
    set_addr $P1535, control_1534
    $P1535."handle_types"(58)
    push_eh $P1535
    .lex "self", self
    .lex "$/", param_1536
.annotate "line", 469
    new $P1537, "Hash"
    .lex "%mods", $P1537
.annotate "line", 470
    new $P1538, "Undef"
    .lex "$n", $P1538
.annotate "line", 469
    get_global $P1539, "@MODIFIERS"
    unless_null $P1539, vivify_344
    new $P1539, "ResizablePMCArray"
  vivify_344:
    set $P1540, $P1539[0]
    unless_null $P1540, vivify_345
    new $P1540, "Undef"
  vivify_345:
    store_lex "%mods", $P1540
.annotate "line", 470
    find_lex $P1543, "$/"
    unless_null $P1543, vivify_346
    new $P1543, "Hash"
  vivify_346:
    set $P1544, $P1543["n"]
    unless_null $P1544, vivify_347
    new $P1544, "ResizablePMCArray"
  vivify_347:
    set $P1545, $P1544[0]
    unless_null $P1545, vivify_348
    new $P1545, "Undef"
  vivify_348:
    set $S1546, $P1545
    isgt $I1547, $S1546, ""
    if $I1547, if_1542
    new $P1552, "Integer"
    assign $P1552, 1
    set $P1541, $P1552
    goto if_1542_end
  if_1542:
    find_lex $P1548, "$/"
    unless_null $P1548, vivify_349
    new $P1548, "Hash"
  vivify_349:
    set $P1549, $P1548["n"]
    unless_null $P1549, vivify_350
    new $P1549, "ResizablePMCArray"
  vivify_350:
    set $P1550, $P1549[0]
    unless_null $P1550, vivify_351
    new $P1550, "Undef"
  vivify_351:
    set $N1551, $P1550
    new $P1541, 'Float'
    set $P1541, $N1551
  if_1542_end:
    store_lex "$n", $P1541
.annotate "line", 471
    find_lex $P1553, "$n"
    find_lex $P1554, "$/"
    unless_null $P1554, vivify_352
    new $P1554, "Hash"
  vivify_352:
    set $P1555, $P1554["mod_ident"]
    unless_null $P1555, vivify_353
    new $P1555, "Hash"
  vivify_353:
    set $P1556, $P1555["sym"]
    unless_null $P1556, vivify_354
    new $P1556, "Undef"
  vivify_354:
    set $S1557, $P1556
    find_lex $P1558, "%mods"
    unless_null $P1558, vivify_355
    new $P1558, "Hash"
    store_lex "%mods", $P1558
  vivify_355:
    set $P1558[$S1557], $P1553
.annotate "line", 472
    find_lex $P1559, "$/"
    $P1560 = $P1559."!make"(0)
.annotate "line", 468
    .return ($P1560)
  control_1534:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1561, exception, "payload"
    .return ($P1561)
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
