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
.sub "_block11"  :anon :subid("10_1267204688.82934")
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
.sub "" :load :init :subid("post158") :outer("10_1267204688.82934")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1267204688.82934" 
    .local pmc block
    set block, $P12
    $P580 = get_root_global ["parrot"], "P6metaclass"
    $P580."new_class"("Regex::P6Regex::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block13"  :subid("11_1267204688.82934") :outer("10_1267204688.82934")
.annotate "line", 3
    .const 'Sub' $P571 = "156_1267204688.82934" 
    capture_lex $P571
    .const 'Sub' $P563 = "154_1267204688.82934" 
    capture_lex $P563
    .const 'Sub' $P555 = "152_1267204688.82934" 
    capture_lex $P555
    .const 'Sub' $P534 = "147_1267204688.82934" 
    capture_lex $P534
    .const 'Sub' $P499 = "141_1267204688.82934" 
    capture_lex $P499
    .const 'Sub' $P487 = "138_1267204688.82934" 
    capture_lex $P487
    .const 'Sub' $P474 = "135_1267204688.82934" 
    capture_lex $P474
    .const 'Sub' $P468 = "133_1267204688.82934" 
    capture_lex $P468
    .const 'Sub' $P457 = "130_1267204688.82934" 
    capture_lex $P457
    .const 'Sub' $P446 = "127_1267204688.82934" 
    capture_lex $P446
    .const 'Sub' $P437 = "123_1267204688.82934" 
    capture_lex $P437
    .const 'Sub' $P431 = "121_1267204688.82934" 
    capture_lex $P431
    .const 'Sub' $P425 = "119_1267204688.82934" 
    capture_lex $P425
    .const 'Sub' $P419 = "117_1267204688.82934" 
    capture_lex $P419
    .const 'Sub' $P413 = "115_1267204688.82934" 
    capture_lex $P413
    .const 'Sub' $P405 = "113_1267204688.82934" 
    capture_lex $P405
    .const 'Sub' $P394 = "111_1267204688.82934" 
    capture_lex $P394
    .const 'Sub' $P383 = "109_1267204688.82934" 
    capture_lex $P383
    .const 'Sub' $P377 = "107_1267204688.82934" 
    capture_lex $P377
    .const 'Sub' $P371 = "105_1267204688.82934" 
    capture_lex $P371
    .const 'Sub' $P365 = "103_1267204688.82934" 
    capture_lex $P365
    .const 'Sub' $P359 = "101_1267204688.82934" 
    capture_lex $P359
    .const 'Sub' $P353 = "99_1267204688.82934" 
    capture_lex $P353
    .const 'Sub' $P347 = "97_1267204688.82934" 
    capture_lex $P347
    .const 'Sub' $P341 = "95_1267204688.82934" 
    capture_lex $P341
    .const 'Sub' $P335 = "93_1267204688.82934" 
    capture_lex $P335
    .const 'Sub' $P323 = "89_1267204688.82934" 
    capture_lex $P323
    .const 'Sub' $P311 = "87_1267204688.82934" 
    capture_lex $P311
    .const 'Sub' $P304 = "85_1267204688.82934" 
    capture_lex $P304
    .const 'Sub' $P287 = "83_1267204688.82934" 
    capture_lex $P287
    .const 'Sub' $P280 = "81_1267204688.82934" 
    capture_lex $P280
    .const 'Sub' $P274 = "79_1267204688.82934" 
    capture_lex $P274
    .const 'Sub' $P268 = "77_1267204688.82934" 
    capture_lex $P268
    .const 'Sub' $P261 = "75_1267204688.82934" 
    capture_lex $P261
    .const 'Sub' $P254 = "73_1267204688.82934" 
    capture_lex $P254
    .const 'Sub' $P247 = "71_1267204688.82934" 
    capture_lex $P247
    .const 'Sub' $P240 = "69_1267204688.82934" 
    capture_lex $P240
    .const 'Sub' $P234 = "67_1267204688.82934" 
    capture_lex $P234
    .const 'Sub' $P228 = "65_1267204688.82934" 
    capture_lex $P228
    .const 'Sub' $P222 = "63_1267204688.82934" 
    capture_lex $P222
    .const 'Sub' $P216 = "61_1267204688.82934" 
    capture_lex $P216
    .const 'Sub' $P210 = "59_1267204688.82934" 
    capture_lex $P210
    .const 'Sub' $P205 = "57_1267204688.82934" 
    capture_lex $P205
    .const 'Sub' $P200 = "55_1267204688.82934" 
    capture_lex $P200
    .const 'Sub' $P194 = "53_1267204688.82934" 
    capture_lex $P194
    .const 'Sub' $P188 = "51_1267204688.82934" 
    capture_lex $P188
    .const 'Sub' $P182 = "49_1267204688.82934" 
    capture_lex $P182
    .const 'Sub' $P166 = "44_1267204688.82934" 
    capture_lex $P166
    .const 'Sub' $P154 = "42_1267204688.82934" 
    capture_lex $P154
    .const 'Sub' $P147 = "40_1267204688.82934" 
    capture_lex $P147
    .const 'Sub' $P140 = "38_1267204688.82934" 
    capture_lex $P140
    .const 'Sub' $P133 = "36_1267204688.82934" 
    capture_lex $P133
    .const 'Sub' $P114 = "31_1267204688.82934" 
    capture_lex $P114
    .const 'Sub' $P101 = "28_1267204688.82934" 
    capture_lex $P101
    .const 'Sub' $P94 = "26_1267204688.82934" 
    capture_lex $P94
    .const 'Sub' $P82 = "24_1267204688.82934" 
    capture_lex $P82
    .const 'Sub' $P75 = "22_1267204688.82934" 
    capture_lex $P75
    .const 'Sub' $P63 = "20_1267204688.82934" 
    capture_lex $P63
    .const 'Sub' $P56 = "18_1267204688.82934" 
    capture_lex $P56
    .const 'Sub' $P46 = "15_1267204688.82934" 
    capture_lex $P46
    .const 'Sub' $P38 = "13_1267204688.82934" 
    capture_lex $P38
    .const 'Sub' $P15 = "12_1267204688.82934" 
    capture_lex $P15
    .const 'Sub' $P571 = "156_1267204688.82934" 
    capture_lex $P571
    .return ($P571)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "obs"  :subid("12_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "ws"  :subid("13_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__ws"  :subid("14_1267204688.82934") :method
.annotate "line", 3
    new $P41, "ResizablePMCArray"
    push $P41, ""
    .return ($P41)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "normspace"  :subid("15_1267204688.82934") :method :outer("11_1267204688.82934")
.annotate "line", 3
    .const 'Sub' $P52 = "17_1267204688.82934" 
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
    .const 'Sub' $P52 = "17_1267204688.82934" 
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
.sub "!PREFIX__normspace"  :subid("16_1267204688.82934") :method
.annotate "line", 3
    new $P49, "ResizablePMCArray"
    push $P49, ""
    .return ($P49)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block51"  :anon :subid("17_1267204688.82934") :method :outer("15_1267204688.82934")
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
.sub "arg"  :subid("18_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__arg"  :subid("19_1267204688.82934") :method
.annotate "line", 3
    new $P59, "ResizablePMCArray"
    push $P59, ""
    push $P59, "\""
    push $P59, "'"
    .return ($P59)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "arglist"  :subid("20_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__arglist"  :subid("21_1267204688.82934") :method
.annotate "line", 3
    new $P66, "ResizablePMCArray"
    push $P66, ""
    .return ($P66)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "TOP"  :subid("22_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__TOP"  :subid("23_1267204688.82934") :method
.annotate "line", 3
    $P78 = self."!PREFIX__!subrule"("nibbler", "")
    new $P79, "ResizablePMCArray"
    push $P79, $P78
    .return ($P79)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "nibbler"  :subid("24_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__nibbler"  :subid("25_1267204688.82934") :method
.annotate "line", 3
    new $P85, "ResizablePMCArray"
    push $P85, ""
    .return ($P85)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "termish"  :subid("26_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__termish"  :subid("27_1267204688.82934") :method
.annotate "line", 3
    new $P97, "ResizablePMCArray"
    push $P97, ""
    .return ($P97)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantified_atom"  :subid("28_1267204688.82934") :method :outer("11_1267204688.82934")
.annotate "line", 3
    .const 'Sub' $P110 = "30_1267204688.82934" 
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
    .const 'Sub' $P110 = "30_1267204688.82934" 
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
.sub "!PREFIX__quantified_atom"  :subid("29_1267204688.82934") :method
.annotate "line", 3
    $P104 = self."!PREFIX__!subrule"("atom", "")
    new $P105, "ResizablePMCArray"
    push $P105, $P104
    .return ($P105)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block109"  :anon :subid("30_1267204688.82934") :method :outer("28_1267204688.82934")
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
.sub "atom"  :subid("31_1267204688.82934") :method :outer("11_1267204688.82934")
.annotate "line", 3
    .const 'Sub' $P125 = "33_1267204688.82934" 
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
    .const 'Sub' $P125 = "33_1267204688.82934" 
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
.sub "!PREFIX__atom"  :subid("32_1267204688.82934") :method
.annotate "line", 3
    $P117 = self."!PREFIX__!subrule"("metachar", "")
    new $P118, "ResizablePMCArray"
    push $P118, $P117
    push $P118, ""
    .return ($P118)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block124"  :anon :subid("33_1267204688.82934") :method :outer("31_1267204688.82934")
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
.sub "quantifier"  :subid("34_1267204688.82934") :method
.annotate "line", 52
    $P130 = self."!protoregex"("quantifier")
    .return ($P130)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier"  :subid("35_1267204688.82934") :method
.annotate "line", 52
    $P132 = self."!PREFIX__!protoregex"("quantifier")
    .return ($P132)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<*>"  :subid("36_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__quantifier:sym<*>"  :subid("37_1267204688.82934") :method
.annotate "line", 3
    $P136 = self."!PREFIX__!subrule"("backmod", "*")
    new $P137, "ResizablePMCArray"
    push $P137, $P136
    .return ($P137)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<+>"  :subid("38_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__quantifier:sym<+>"  :subid("39_1267204688.82934") :method
.annotate "line", 3
    $P143 = self."!PREFIX__!subrule"("backmod", "+")
    new $P144, "ResizablePMCArray"
    push $P144, $P143
    .return ($P144)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<?>"  :subid("40_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__quantifier:sym<?>"  :subid("41_1267204688.82934") :method
.annotate "line", 3
    $P150 = self."!PREFIX__!subrule"("backmod", "?")
    new $P151, "ResizablePMCArray"
    push $P151, $P150
    .return ($P151)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<**>"  :subid("42_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__quantifier:sym<**>"  :subid("43_1267204688.82934") :method
.annotate "line", 3
    new $P157, "ResizablePMCArray"
    push $P157, "**"
    .return ($P157)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backmod"  :subid("44_1267204688.82934") :method :outer("11_1267204688.82934")
.annotate "line", 3
    .const 'Sub' $P175 = "46_1267204688.82934" 
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
    .const 'Sub' $P175 = "46_1267204688.82934" 
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
.sub "!PREFIX__backmod"  :subid("45_1267204688.82934") :method
.annotate "line", 3
    new $P169, "ResizablePMCArray"
    push $P169, ""
    .return ($P169)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block174"  :anon :subid("46_1267204688.82934") :method :outer("44_1267204688.82934")
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
.sub "metachar"  :subid("47_1267204688.82934") :method
.annotate "line", 73
    $P179 = self."!protoregex"("metachar")
    .return ($P179)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar"  :subid("48_1267204688.82934") :method
.annotate "line", 73
    $P181 = self."!PREFIX__!protoregex"("metachar")
    .return ($P181)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<ws>"  :subid("49_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__metachar:sym<ws>"  :subid("50_1267204688.82934") :method
.annotate "line", 3
    $P185 = self."!PREFIX__!subrule"("", "")
    new $P186, "ResizablePMCArray"
    push $P186, $P185
    .return ($P186)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<[ ]>"  :subid("51_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__metachar:sym<[ ]>"  :subid("52_1267204688.82934") :method
.annotate "line", 3
    $P191 = self."!PREFIX__!subrule"("nibbler", "[")
    new $P192, "ResizablePMCArray"
    push $P192, $P191
    .return ($P192)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<( )>"  :subid("53_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__metachar:sym<( )>"  :subid("54_1267204688.82934") :method
.annotate "line", 3
    $P197 = self."!PREFIX__!subrule"("nibbler", "(")
    new $P198, "ResizablePMCArray"
    push $P198, $P197
    .return ($P198)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<'>"  :subid("55_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__metachar:sym<'>"  :subid("56_1267204688.82934") :method
.annotate "line", 3
    new $P203, "ResizablePMCArray"
    push $P203, "'"
    .return ($P203)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<\">"  :subid("57_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__metachar:sym<\">"  :subid("58_1267204688.82934") :method
.annotate "line", 3
    new $P208, "ResizablePMCArray"
    push $P208, "\""
    .return ($P208)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<.>"  :subid("59_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__metachar:sym<.>"  :subid("60_1267204688.82934") :method
.annotate "line", 3
    new $P213, "ResizablePMCArray"
    push $P213, "."
    .return ($P213)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^>"  :subid("61_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__metachar:sym<^>"  :subid("62_1267204688.82934") :method
.annotate "line", 3
    new $P219, "ResizablePMCArray"
    push $P219, "^"
    .return ($P219)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^^>"  :subid("63_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__metachar:sym<^^>"  :subid("64_1267204688.82934") :method
.annotate "line", 3
    new $P225, "ResizablePMCArray"
    push $P225, "^^"
    .return ($P225)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$>"  :subid("65_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__metachar:sym<$>"  :subid("66_1267204688.82934") :method
.annotate "line", 3
    new $P231, "ResizablePMCArray"
    push $P231, "$"
    .return ($P231)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$$>"  :subid("67_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__metachar:sym<$$>"  :subid("68_1267204688.82934") :method
.annotate "line", 3
    new $P237, "ResizablePMCArray"
    push $P237, "$$"
    .return ($P237)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<:::>"  :subid("69_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__metachar:sym<:::>"  :subid("70_1267204688.82934") :method
.annotate "line", 3
    $P243 = self."!PREFIX__!subrule"("", ":::")
    new $P244, "ResizablePMCArray"
    push $P244, $P243
    .return ($P244)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<::>"  :subid("71_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__metachar:sym<::>"  :subid("72_1267204688.82934") :method
.annotate "line", 3
    $P250 = self."!PREFIX__!subrule"("", "::")
    new $P251, "ResizablePMCArray"
    push $P251, $P250
    .return ($P251)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<lwb>"  :subid("73_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__metachar:sym<lwb>"  :subid("74_1267204688.82934") :method
.annotate "line", 3
    new $P257, "ResizablePMCArray"
    push $P257, unicode:"\x{ab}"
    push $P257, "<<"
    .return ($P257)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<rwb>"  :subid("75_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__metachar:sym<rwb>"  :subid("76_1267204688.82934") :method
.annotate "line", 3
    new $P264, "ResizablePMCArray"
    push $P264, unicode:"\x{bb}"
    push $P264, ">>"
    .return ($P264)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<bs>"  :subid("77_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__metachar:sym<bs>"  :subid("78_1267204688.82934") :method
.annotate "line", 3
    $P271 = self."!PREFIX__!subrule"("backslash", "\\")
    new $P272, "ResizablePMCArray"
    push $P272, $P271
    .return ($P272)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<mod>"  :subid("79_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__metachar:sym<mod>"  :subid("80_1267204688.82934") :method
.annotate "line", 3
    $P277 = self."!PREFIX__!subrule"("mod_internal", "")
    new $P278, "ResizablePMCArray"
    push $P278, $P277
    .return ($P278)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<~>"  :subid("81_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__metachar:sym<~>"  :subid("82_1267204688.82934") :method
.annotate "line", 3
    $P283 = self."!PREFIX__!subrule"("", "~")
    new $P284, "ResizablePMCArray"
    push $P284, $P283
    .return ($P284)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<{*}>"  :subid("83_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__metachar:sym<{*}>"  :subid("84_1267204688.82934") :method
.annotate "line", 3
    new $P290, "ResizablePMCArray"
    push $P290, "{*}"
    .return ($P290)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<assert>"  :subid("85_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__metachar:sym<assert>"  :subid("86_1267204688.82934") :method
.annotate "line", 3
    $P307 = self."!PREFIX__!subrule"("assertion", "<")
    new $P308, "ResizablePMCArray"
    push $P308, $P307
    .return ($P308)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<var>"  :subid("87_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__metachar:sym<var>"  :subid("88_1267204688.82934") :method
.annotate "line", 3
    new $P314, "ResizablePMCArray"
    push $P314, "$"
    push $P314, "$<"
    .return ($P314)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<PIR>"  :subid("89_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__metachar:sym<PIR>"  :subid("90_1267204688.82934") :method
.annotate "line", 3
    new $P326, "ResizablePMCArray"
    push $P326, ":PIR{{"
    .return ($P326)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash"  :subid("91_1267204688.82934") :method
.annotate "line", 120
    $P332 = self."!protoregex"("backslash")
    .return ($P332)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash"  :subid("92_1267204688.82934") :method
.annotate "line", 120
    $P334 = self."!PREFIX__!protoregex"("backslash")
    .return ($P334)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<w>"  :subid("93_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__backslash:sym<w>"  :subid("94_1267204688.82934") :method
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
.sub "backslash:sym<b>"  :subid("95_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__backslash:sym<b>"  :subid("96_1267204688.82934") :method
.annotate "line", 3
    new $P344, "ResizablePMCArray"
    push $P344, "B"
    push $P344, "b"
    .return ($P344)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<e>"  :subid("97_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__backslash:sym<e>"  :subid("98_1267204688.82934") :method
.annotate "line", 3
    new $P350, "ResizablePMCArray"
    push $P350, "E"
    push $P350, "e"
    .return ($P350)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<f>"  :subid("99_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__backslash:sym<f>"  :subid("100_1267204688.82934") :method
.annotate "line", 3
    new $P356, "ResizablePMCArray"
    push $P356, "F"
    push $P356, "f"
    .return ($P356)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<h>"  :subid("101_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__backslash:sym<h>"  :subid("102_1267204688.82934") :method
.annotate "line", 3
    new $P362, "ResizablePMCArray"
    push $P362, "H"
    push $P362, "h"
    .return ($P362)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<r>"  :subid("103_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__backslash:sym<r>"  :subid("104_1267204688.82934") :method
.annotate "line", 3
    new $P368, "ResizablePMCArray"
    push $P368, "R"
    push $P368, "r"
    .return ($P368)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<t>"  :subid("105_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__backslash:sym<t>"  :subid("106_1267204688.82934") :method
.annotate "line", 3
    new $P374, "ResizablePMCArray"
    push $P374, "T"
    push $P374, "t"
    .return ($P374)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<v>"  :subid("107_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__backslash:sym<v>"  :subid("108_1267204688.82934") :method
.annotate "line", 3
    new $P380, "ResizablePMCArray"
    push $P380, "V"
    push $P380, "v"
    .return ($P380)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<o>"  :subid("109_1267204688.82934") :method :outer("11_1267204688.82934")
.annotate "line", 3
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
.annotate "line", 129
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
.annotate "line", 3
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
.sub "!PREFIX__backslash:sym<o>"  :subid("110_1267204688.82934") :method
.annotate "line", 3
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
.sub "backslash:sym<x>"  :subid("111_1267204688.82934") :method :outer("11_1267204688.82934")
.annotate "line", 3
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
.annotate "line", 130
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
.annotate "line", 3
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
.sub "!PREFIX__backslash:sym<x>"  :subid("112_1267204688.82934") :method
.annotate "line", 3
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
.sub "backslash:sym<c>"  :subid("113_1267204688.82934") :method :outer("11_1267204688.82934")
.annotate "line", 3
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
.annotate "line", 131
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
.annotate "line", 3
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
.sub "!PREFIX__backslash:sym<c>"  :subid("114_1267204688.82934") :method
.annotate "line", 3
    $P408 = self."!PREFIX__!subrule"("charspec", "C")
    $P409 = self."!PREFIX__!subrule"("charspec", "c")
    new $P410, "ResizablePMCArray"
    push $P410, $P408
    push $P410, $P409
    .return ($P410)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<A>"  :subid("115_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__backslash:sym<A>"  :subid("116_1267204688.82934") :method
.annotate "line", 3
    $P416 = self."!PREFIX__!subrule"("", "A")
    new $P417, "ResizablePMCArray"
    push $P417, $P416
    .return ($P417)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<z>"  :subid("117_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__backslash:sym<z>"  :subid("118_1267204688.82934") :method
.annotate "line", 3
    $P422 = self."!PREFIX__!subrule"("", "z")
    new $P423, "ResizablePMCArray"
    push $P423, $P422
    .return ($P423)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Z>"  :subid("119_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__backslash:sym<Z>"  :subid("120_1267204688.82934") :method
.annotate "line", 3
    $P428 = self."!PREFIX__!subrule"("", "Z")
    new $P429, "ResizablePMCArray"
    push $P429, $P428
    .return ($P429)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Q>"  :subid("121_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__backslash:sym<Q>"  :subid("122_1267204688.82934") :method
.annotate "line", 3
    $P434 = self."!PREFIX__!subrule"("", "Q")
    new $P435, "ResizablePMCArray"
    push $P435, $P434
    .return ($P435)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<misc>"  :subid("123_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__backslash:sym<misc>"  :subid("124_1267204688.82934") :method
.annotate "line", 3
    new $P440, "ResizablePMCArray"
    push $P440, ""
    .return ($P440)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion"  :subid("125_1267204688.82934") :method
.annotate "line", 138
    $P443 = self."!protoregex"("assertion")
    .return ($P443)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion"  :subid("126_1267204688.82934") :method
.annotate "line", 138
    $P445 = self."!PREFIX__!protoregex"("assertion")
    .return ($P445)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<?>"  :subid("127_1267204688.82934") :method :outer("11_1267204688.82934")
.annotate "line", 3
    .const 'Sub' $P454 = "129_1267204688.82934" 
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
    .const 'Sub' $P454 = "129_1267204688.82934" 
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
.sub "!PREFIX__assertion:sym<?>"  :subid("128_1267204688.82934") :method
.annotate "line", 3
    $P449 = self."!PREFIX__!subrule"("assertion", "?")
    new $P450, "ResizablePMCArray"
    push $P450, $P449
    push $P450, "?"
    .return ($P450)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block453"  :anon :subid("129_1267204688.82934") :method :outer("127_1267204688.82934")
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
.sub "assertion:sym<!>"  :subid("130_1267204688.82934") :method :outer("11_1267204688.82934")
.annotate "line", 3
    .const 'Sub' $P465 = "132_1267204688.82934" 
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
    .const 'Sub' $P465 = "132_1267204688.82934" 
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
.sub "!PREFIX__assertion:sym<!>"  :subid("131_1267204688.82934") :method
.annotate "line", 3
    $P460 = self."!PREFIX__!subrule"("assertion", "!")
    new $P461, "ResizablePMCArray"
    push $P461, $P460
    push $P461, "!"
    .return ($P461)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block464"  :anon :subid("132_1267204688.82934") :method :outer("130_1267204688.82934")
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
.sub "assertion:sym<method>"  :subid("133_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__assertion:sym<method>"  :subid("134_1267204688.82934") :method
.annotate "line", 3
    $P471 = self."!PREFIX__!subrule"("assertion", ".")
    new $P472, "ResizablePMCArray"
    push $P472, $P471
    .return ($P472)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<name>"  :subid("135_1267204688.82934") :method :outer("11_1267204688.82934")
.annotate "line", 3
    .const 'Sub' $P483 = "137_1267204688.82934" 
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
    .const 'Sub' $P483 = "137_1267204688.82934" 
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
.sub "!PREFIX__assertion:sym<name>"  :subid("136_1267204688.82934") :method
.annotate "line", 3
    new $P477, "ResizablePMCArray"
    push $P477, ""
    .return ($P477)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block482"  :anon :subid("137_1267204688.82934") :method :outer("135_1267204688.82934")
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
.sub "assertion:sym<[>"  :subid("138_1267204688.82934") :method :outer("11_1267204688.82934")
.annotate "line", 3
    .const 'Sub' $P493 = "140_1267204688.82934" 
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
    .const 'Sub' $P493 = "140_1267204688.82934" 
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
.sub "!PREFIX__assertion:sym<[>"  :subid("139_1267204688.82934") :method
.annotate "line", 3
    new $P490, "ResizablePMCArray"
    push $P490, ""
    .return ($P490)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block492"  :anon :subid("140_1267204688.82934") :method :outer("138_1267204688.82934")
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
.sub "cclass_elem"  :subid("141_1267204688.82934") :method :outer("11_1267204688.82934")
.annotate "line", 3
    .const 'Sub' $P511 = "143_1267204688.82934" 
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
    .const 'Sub' $P511 = "143_1267204688.82934" 
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
.sub "!PREFIX__cclass_elem"  :subid("142_1267204688.82934") :method
.annotate "line", 3
    new $P502, "ResizablePMCArray"
    push $P502, ""
    push $P502, "-"
    push $P502, "+"
    .return ($P502)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block510"  :anon :subid("143_1267204688.82934") :method :outer("141_1267204688.82934")
.annotate "line", 164
    .const 'Sub' $P526 = "146_1267204688.82934" 
    capture_lex $P526
    .const 'Sub' $P521 = "145_1267204688.82934" 
    capture_lex $P521
    .const 'Sub' $P517 = "144_1267204688.82934" 
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
    .const 'Sub' $P517 = "144_1267204688.82934" 
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
    .const 'Sub' $P521 = "145_1267204688.82934" 
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
    .const 'Sub' $P526 = "146_1267204688.82934" 
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
.sub "_block516"  :anon :subid("144_1267204688.82934") :method :outer("143_1267204688.82934")
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
.sub "_block520"  :anon :subid("145_1267204688.82934") :method :outer("143_1267204688.82934")
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
.sub "_block525"  :anon :subid("146_1267204688.82934") :method :outer("143_1267204688.82934")
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
.sub "mod_internal"  :subid("147_1267204688.82934") :method :outer("11_1267204688.82934")
.annotate "line", 3
    .const 'Sub' $P543 = "149_1267204688.82934" 
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
    .const 'Sub' $P543 = "149_1267204688.82934" 
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
.sub "!PREFIX__mod_internal"  :subid("148_1267204688.82934") :method
.annotate "line", 3
    $P537 = self."!PREFIX__!subrule"("mod_ident", ":")
    new $P538, "ResizablePMCArray"
    push $P538, $P537
    push $P538, ":"
    .return ($P538)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block542"  :anon :subid("149_1267204688.82934") :method :outer("147_1267204688.82934")
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
.sub "mod_ident"  :subid("150_1267204688.82934") :method
.annotate "line", 181
    $P552 = self."!protoregex"("mod_ident")
    .return ($P552)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident"  :subid("151_1267204688.82934") :method
.annotate "line", 181
    $P554 = self."!PREFIX__!protoregex"("mod_ident")
    .return ($P554)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ignorecase>"  :subid("152_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__mod_ident:sym<ignorecase>"  :subid("153_1267204688.82934") :method
.annotate "line", 3
    new $P558, "ResizablePMCArray"
    push $P558, "i"
    .return ($P558)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ratchet>"  :subid("154_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__mod_ident:sym<ratchet>"  :subid("155_1267204688.82934") :method
.annotate "line", 3
    new $P566, "ResizablePMCArray"
    push $P566, "r"
    .return ($P566)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<sigspace>"  :subid("156_1267204688.82934") :method :outer("11_1267204688.82934")
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
.sub "!PREFIX__mod_ident:sym<sigspace>"  :subid("157_1267204688.82934") :method
.annotate "line", 3
    new $P574, "ResizablePMCArray"
    push $P574, "s"
    .return ($P574)
.end

### .include 'gen/p6regex-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1267204695.47543")
.annotate "line", 0
    get_hll_global $P14, ["Regex";"P6Regex";"Actions"], "_block13" 
    capture_lex $P14
.annotate "line", 4
    get_hll_global $P14, ["Regex";"P6Regex";"Actions"], "_block13" 
    capture_lex $P14
    $P1569 = $P14()
.annotate "line", 1
    .return ($P1569)
.end


.namespace []
.sub "" :load :init :subid("post90") :outer("10_1267204695.47543")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1267204695.47543" 
    .local pmc block
    set block, $P12
    $P1570 = get_root_global ["parrot"], "P6metaclass"
    $P1570."new_class"("Regex::P6Regex::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block13"  :subid("11_1267204695.47543") :outer("10_1267204695.47543")
.annotate "line", 4
    .const 'Sub' $P1536 = "89_1267204695.47543" 
    capture_lex $P1536
    .const 'Sub' $P1467 = "85_1267204695.47543" 
    capture_lex $P1467
    .const 'Sub' $P1399 = "83_1267204695.47543" 
    capture_lex $P1399
    .const 'Sub' $P1326 = "80_1267204695.47543" 
    capture_lex $P1326
    .const 'Sub' $P1312 = "79_1267204695.47543" 
    capture_lex $P1312
    .const 'Sub' $P1288 = "78_1267204695.47543" 
    capture_lex $P1288
    .const 'Sub' $P1270 = "77_1267204695.47543" 
    capture_lex $P1270
    .const 'Sub' $P1256 = "76_1267204695.47543" 
    capture_lex $P1256
    .const 'Sub' $P1243 = "75_1267204695.47543" 
    capture_lex $P1243
    .const 'Sub' $P1212 = "74_1267204695.47543" 
    capture_lex $P1212
    .const 'Sub' $P1181 = "73_1267204695.47543" 
    capture_lex $P1181
    .const 'Sub' $P1165 = "72_1267204695.47543" 
    capture_lex $P1165
    .const 'Sub' $P1149 = "71_1267204695.47543" 
    capture_lex $P1149
    .const 'Sub' $P1133 = "70_1267204695.47543" 
    capture_lex $P1133
    .const 'Sub' $P1117 = "69_1267204695.47543" 
    capture_lex $P1117
    .const 'Sub' $P1101 = "68_1267204695.47543" 
    capture_lex $P1101
    .const 'Sub' $P1085 = "67_1267204695.47543" 
    capture_lex $P1085
    .const 'Sub' $P1069 = "66_1267204695.47543" 
    capture_lex $P1069
    .const 'Sub' $P1045 = "65_1267204695.47543" 
    capture_lex $P1045
    .const 'Sub' $P1030 = "64_1267204695.47543" 
    capture_lex $P1030
    .const 'Sub' $P974 = "63_1267204695.47543" 
    capture_lex $P974
    .const 'Sub' $P953 = "62_1267204695.47543" 
    capture_lex $P953
    .const 'Sub' $P931 = "61_1267204695.47543" 
    capture_lex $P931
    .const 'Sub' $P921 = "60_1267204695.47543" 
    capture_lex $P921
    .const 'Sub' $P911 = "59_1267204695.47543" 
    capture_lex $P911
    .const 'Sub' $P901 = "58_1267204695.47543" 
    capture_lex $P901
    .const 'Sub' $P889 = "57_1267204695.47543" 
    capture_lex $P889
    .const 'Sub' $P877 = "56_1267204695.47543" 
    capture_lex $P877
    .const 'Sub' $P865 = "55_1267204695.47543" 
    capture_lex $P865
    .const 'Sub' $P853 = "54_1267204695.47543" 
    capture_lex $P853
    .const 'Sub' $P841 = "53_1267204695.47543" 
    capture_lex $P841
    .const 'Sub' $P829 = "52_1267204695.47543" 
    capture_lex $P829
    .const 'Sub' $P817 = "51_1267204695.47543" 
    capture_lex $P817
    .const 'Sub' $P805 = "50_1267204695.47543" 
    capture_lex $P805
    .const 'Sub' $P782 = "49_1267204695.47543" 
    capture_lex $P782
    .const 'Sub' $P759 = "48_1267204695.47543" 
    capture_lex $P759
    .const 'Sub' $P741 = "47_1267204695.47543" 
    capture_lex $P741
    .const 'Sub' $P731 = "46_1267204695.47543" 
    capture_lex $P731
    .const 'Sub' $P713 = "45_1267204695.47543" 
    capture_lex $P713
    .const 'Sub' $P666 = "44_1267204695.47543" 
    capture_lex $P666
    .const 'Sub' $P649 = "43_1267204695.47543" 
    capture_lex $P649
    .const 'Sub' $P634 = "42_1267204695.47543" 
    capture_lex $P634
    .const 'Sub' $P619 = "41_1267204695.47543" 
    capture_lex $P619
    .const 'Sub' $P593 = "40_1267204695.47543" 
    capture_lex $P593
    .const 'Sub' $P543 = "38_1267204695.47543" 
    capture_lex $P543
    .const 'Sub' $P475 = "36_1267204695.47543" 
    capture_lex $P475
    .const 'Sub' $P420 = "33_1267204695.47543" 
    capture_lex $P420
    .const 'Sub' $P405 = "32_1267204695.47543" 
    capture_lex $P405
    .const 'Sub' $P379 = "30_1267204695.47543" 
    capture_lex $P379
    .const 'Sub' $P362 = "29_1267204695.47543" 
    capture_lex $P362
    .const 'Sub' $P340 = "28_1267204695.47543" 
    capture_lex $P340
    .const 'Sub' $P308 = "27_1267204695.47543" 
    capture_lex $P308
    .const 'Sub' $P54 = "14_1267204695.47543" 
    capture_lex $P54
    .const 'Sub' $P21 = "13_1267204695.47543" 
    capture_lex $P21
    .const 'Sub' $P16 = "12_1267204695.47543" 
    capture_lex $P16
    get_global $P15, "@MODIFIERS"
    unless_null $P15, vivify_91
    $P15 = root_new ['parrot';'ResizablePMCArray']
    set_global "@MODIFIERS", $P15
  vivify_91:
.annotate "line", 6
    .const 'Sub' $P16 = "12_1267204695.47543" 
    capture_lex $P16
    .lex "INIT", $P16
.annotate "line", 479
    .const 'Sub' $P21 = "13_1267204695.47543" 
    capture_lex $P21
    .lex "buildsub", $P21
.annotate "line", 496
    .const 'Sub' $P54 = "14_1267204695.47543" 
    capture_lex $P54
    .lex "capnames", $P54
.annotate "line", 562
    .const 'Sub' $P308 = "27_1267204695.47543" 
    capture_lex $P308
    .lex "backmod", $P308
.annotate "line", 569
    .const 'Sub' $P340 = "28_1267204695.47543" 
    capture_lex $P340
    .lex "subrule_alias", $P340
.annotate "line", 4
    get_global $P360, "@MODIFIERS"
    find_lex $P361, "INIT"
.annotate "line", 472
    find_lex $P1565, "buildsub"
    find_lex $P1566, "capnames"
    find_lex $P1567, "backmod"
    find_lex $P1568, "subrule_alias"
.annotate "line", 4
    .return ($P1568)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "INIT"  :subid("12_1267204695.47543") :outer("11_1267204695.47543")
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
.sub "buildsub"  :subid("13_1267204695.47543") :outer("11_1267204695.47543")
    .param pmc param_24
    .param pmc param_25 :optional
    .param int has_param_25 :opt_flag
.annotate "line", 479
    new $P23, 'ExceptionHandler'
    set_addr $P23, control_22
    $P23."handle_types"(58)
    push_eh $P23
    .lex "$rpast", param_24
    if has_param_25, optparam_92
    get_hll_global $P26, ["PAST"], "Block"
    $P27 = $P26."new"()
    set param_25, $P27
  optparam_92:
    .lex "$block", param_25
.annotate "line", 480
    $P28 = root_new ['parrot';'Hash']
    .lex "%capnames", $P28
    find_lex $P29, "$rpast"
    $P30 = "capnames"($P29, 0)
    store_lex "%capnames", $P30
.annotate "line", 481
    new $P31, "Integer"
    assign $P31, 0
    find_lex $P32, "%capnames"
    unless_null $P32, vivify_93
    $P32 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P32
  vivify_93:
    set $P32[""], $P31
.annotate "line", 482
    get_hll_global $P33, ["PAST"], "Regex"
.annotate "line", 483
    get_hll_global $P34, ["PAST"], "Regex"
    $P35 = $P34."new"("scan" :named("pasttype"))
    find_lex $P36, "$rpast"
.annotate "line", 485
    get_hll_global $P37, ["PAST"], "Regex"
    $P38 = $P37."new"("pass" :named("pasttype"))
    find_lex $P39, "%capnames"
    $P40 = $P33."new"($P35, $P36, $P38, "concat" :named("pasttype"), $P39 :named("capnames"))
.annotate "line", 482
    store_lex "$rpast", $P40
.annotate "line", 489
    find_lex $P42, "$block"
    $P43 = $P42."symbol"(unicode:"$\x{a2}")
    if $P43, unless_41_end
    find_lex $P44, "$block"
    $P44."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
  unless_41_end:
.annotate "line", 490
    find_lex $P46, "$block"
    $P47 = $P46."symbol"("$/")
    if $P47, unless_45_end
    find_lex $P48, "$block"
    $P48."symbol"("$/", "lexical" :named("scope"))
  unless_45_end:
.annotate "line", 491
    find_lex $P49, "$block"
    find_lex $P50, "$rpast"
    $P49."push"($P50)
.annotate "line", 492
    find_lex $P51, "$block"
    $P51."blocktype"("method")
    find_lex $P52, "$block"
.annotate "line", 479
    .return ($P52)
  control_22:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P53, exception, "payload"
    .return ($P53)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "capnames"  :subid("14_1267204695.47543") :outer("11_1267204695.47543")
    .param pmc param_57
    .param pmc param_58
.annotate "line", 496
    .const 'Sub' $P283 = "25_1267204695.47543" 
    capture_lex $P283
    .const 'Sub' $P220 = "22_1267204695.47543" 
    capture_lex $P220
    .const 'Sub' $P178 = "20_1267204695.47543" 
    capture_lex $P178
    .const 'Sub' $P136 = "18_1267204695.47543" 
    capture_lex $P136
    .const 'Sub' $P69 = "15_1267204695.47543" 
    capture_lex $P69
    new $P56, 'ExceptionHandler'
    set_addr $P56, control_55
    $P56."handle_types"(58)
    push_eh $P56
    .lex "$ast", param_57
    .lex "$count", param_58
.annotate "line", 497
    $P59 = root_new ['parrot';'Hash']
    .lex "%capnames", $P59
.annotate "line", 498
    new $P60, "Undef"
    .lex "$pasttype", $P60
.annotate "line", 496
    find_lex $P61, "%capnames"
.annotate "line", 498
    find_lex $P62, "$ast"
    $P63 = $P62."pasttype"()
    store_lex "$pasttype", $P63
.annotate "line", 499
    find_lex $P65, "$pasttype"
    set $S66, $P65
    iseq $I67, $S66, "alt"
    if $I67, if_64
.annotate "line", 512
    find_lex $P127, "$pasttype"
    set $S128, $P127
    iseq $I129, $S128, "concat"
    if $I129, if_126
.annotate "line", 521
    find_lex $P171, "$pasttype"
    set $S172, $P171
    iseq $I173, $S172, "subrule"
    if $I173, if_170
    new $P169, 'Integer'
    set $P169, $I173
    goto if_170_end
  if_170:
    find_lex $P174, "$ast"
    $S175 = $P174."subtype"()
    iseq $I176, $S175, "capture"
    new $P169, 'Integer'
    set $P169, $I176
  if_170_end:
    if $P169, if_168
.annotate "line", 534
    find_lex $P216, "$pasttype"
    set $S217, $P216
    iseq $I218, $S217, "subcapture"
    if $I218, if_215
.annotate "line", 551
    find_lex $P279, "$pasttype"
    set $S280, $P279
    iseq $I281, $S280, "quant"
    unless $I281, if_278_end
    .const 'Sub' $P283 = "25_1267204695.47543" 
    capture_lex $P283
    $P283()
  if_278_end:
    goto if_215_end
  if_215:
.annotate "line", 534
    .const 'Sub' $P220 = "22_1267204695.47543" 
    capture_lex $P220
    $P220()
  if_215_end:
    goto if_168_end
  if_168:
.annotate "line", 521
    .const 'Sub' $P178 = "20_1267204695.47543" 
    capture_lex $P178
    $P178()
  if_168_end:
    goto if_126_end
  if_126:
.annotate "line", 513
    find_lex $P131, "$ast"
    $P132 = $P131."list"()
    defined $I133, $P132
    unless $I133, for_undef_114
    iter $P130, $P132
    new $P166, 'ExceptionHandler'
    set_addr $P166, loop165_handler
    $P166."handle_types"(65, 67, 66)
    push_eh $P166
  loop165_test:
    unless $P130, loop165_done
    shift $P134, $P130
  loop165_redo:
    .const 'Sub' $P136 = "18_1267204695.47543" 
    capture_lex $P136
    $P136($P134)
  loop165_next:
    goto loop165_test
  loop165_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P167, exception, 'type'
    eq $P167, 65, loop165_next
    eq $P167, 67, loop165_redo
  loop165_done:
    pop_eh 
  for_undef_114:
  if_126_end:
.annotate "line", 512
    goto if_64_end
  if_64:
.annotate "line", 499
    .const 'Sub' $P69 = "15_1267204695.47543" 
    capture_lex $P69
    $P69()
  if_64_end:
.annotate "line", 558
    find_lex $P304, "$count"
    find_lex $P305, "%capnames"
    unless_null $P305, vivify_134
    $P305 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P305
  vivify_134:
    set $P305[""], $P304
    find_lex $P306, "%capnames"
.annotate "line", 496
    .return ($P306)
  control_55:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P307, exception, "payload"
    .return ($P307)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block282"  :anon :subid("25_1267204695.47543") :outer("14_1267204695.47543")
.annotate "line", 551
    .const 'Sub' $P294 = "26_1267204695.47543" 
    capture_lex $P294
.annotate "line", 552
    $P284 = root_new ['parrot';'Hash']
    .lex "%astcap", $P284
    find_lex $P285, "$ast"
    unless_null $P285, vivify_94
    $P285 = root_new ['parrot';'ResizablePMCArray']
  vivify_94:
    set $P286, $P285[0]
    unless_null $P286, vivify_95
    new $P286, "Undef"
  vivify_95:
    find_lex $P287, "$count"
    $P288 = "capnames"($P286, $P287)
    store_lex "%astcap", $P288
.annotate "line", 553
    find_lex $P290, "%astcap"
    defined $I291, $P290
    unless $I291, for_undef_96
    iter $P289, $P290
    new $P300, 'ExceptionHandler'
    set_addr $P300, loop299_handler
    $P300."handle_types"(65, 67, 66)
    push_eh $P300
  loop299_test:
    unless $P289, loop299_done
    shift $P292, $P289
  loop299_redo:
    .const 'Sub' $P294 = "26_1267204695.47543" 
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
  for_undef_96:
.annotate "line", 556
    find_lex $P302, "%astcap"
    unless_null $P302, vivify_98
    $P302 = root_new ['parrot';'Hash']
  vivify_98:
    set $P303, $P302[""]
    unless_null $P303, vivify_99
    new $P303, "Undef"
  vivify_99:
    store_lex "$count", $P303
.annotate "line", 551
    .return ($P303)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block293"  :anon :subid("26_1267204695.47543") :outer("25_1267204695.47543")
    .param pmc param_295
.annotate "line", 553
    .lex "$_", param_295
.annotate "line", 554
    new $P296, "Integer"
    assign $P296, 2
    find_lex $P297, "$_"
    find_lex $P298, "%capnames"
    unless_null $P298, vivify_97
    $P298 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P298
  vivify_97:
    set $P298[$P297], $P296
.annotate "line", 553
    .return ($P296)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block219"  :anon :subid("22_1267204695.47543") :outer("14_1267204695.47543")
.annotate "line", 534
    .const 'Sub' $P260 = "24_1267204695.47543" 
    capture_lex $P260
    .const 'Sub' $P232 = "23_1267204695.47543" 
    capture_lex $P232
.annotate "line", 535
    new $P221, "Undef"
    .lex "$name", $P221
.annotate "line", 536
    $P222 = root_new ['parrot';'ResizablePMCArray']
    .lex "@names", $P222
.annotate "line", 545
    $P223 = root_new ['parrot';'Hash']
    .lex "%x", $P223
.annotate "line", 535
    find_lex $P224, "$ast"
    $P225 = $P224."name"()
    store_lex "$name", $P225
.annotate "line", 536

            $P0 = find_lex '$name'
            $S0 = $P0
            $P226 = split '=', $S0
        
    store_lex "@names", $P226
.annotate "line", 541
    find_lex $P228, "@names"
    defined $I229, $P228
    unless $I229, for_undef_100
    iter $P227, $P228
    new $P249, 'ExceptionHandler'
    set_addr $P249, loop248_handler
    $P249."handle_types"(65, 67, 66)
    push_eh $P249
  loop248_test:
    unless $P227, loop248_done
    shift $P230, $P227
  loop248_redo:
    .const 'Sub' $P232 = "23_1267204695.47543" 
    capture_lex $P232
    $P232($P230)
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
  for_undef_100:
.annotate "line", 545
    find_lex $P251, "$ast"
    unless_null $P251, vivify_102
    $P251 = root_new ['parrot';'ResizablePMCArray']
  vivify_102:
    set $P252, $P251[0]
    unless_null $P252, vivify_103
    new $P252, "Undef"
  vivify_103:
    find_lex $P253, "$count"
    $P254 = "capnames"($P252, $P253)
    store_lex "%x", $P254
.annotate "line", 546
    find_lex $P256, "%x"
    defined $I257, $P256
    unless $I257, for_undef_104
    iter $P255, $P256
    new $P274, 'ExceptionHandler'
    set_addr $P274, loop273_handler
    $P274."handle_types"(65, 67, 66)
    push_eh $P274
  loop273_test:
    unless $P255, loop273_done
    shift $P258, $P255
  loop273_redo:
    .const 'Sub' $P260 = "24_1267204695.47543" 
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
  for_undef_104:
.annotate "line", 549
    find_lex $P276, "%x"
    unless_null $P276, vivify_110
    $P276 = root_new ['parrot';'Hash']
  vivify_110:
    set $P277, $P276[""]
    unless_null $P277, vivify_111
    new $P277, "Undef"
  vivify_111:
    store_lex "$count", $P277
.annotate "line", 534
    .return ($P277)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block231"  :anon :subid("23_1267204695.47543") :outer("22_1267204695.47543")
    .param pmc param_233
.annotate "line", 541
    .lex "$_", param_233
.annotate "line", 542
    find_lex $P237, "$_"
    set $S238, $P237
    iseq $I239, $S238, "0"
    unless $I239, unless_236
    new $P235, 'Integer'
    set $P235, $I239
    goto unless_236_end
  unless_236:
    find_lex $P240, "$_"
    set $N241, $P240
    isgt $I242, $N241, 0.0
    new $P235, 'Integer'
    set $P235, $I242
  unless_236_end:
    unless $P235, if_234_end
    find_lex $P243, "$_"
    add $P244, $P243, 1
    store_lex "$count", $P244
  if_234_end:
.annotate "line", 543
    new $P245, "Integer"
    assign $P245, 1
    find_lex $P246, "$_"
    find_lex $P247, "%capnames"
    unless_null $P247, vivify_101
    $P247 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P247
  vivify_101:
    set $P247[$P246], $P245
.annotate "line", 541
    .return ($P245)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block259"  :anon :subid("24_1267204695.47543") :outer("22_1267204695.47543")
    .param pmc param_261
.annotate "line", 546
    .lex "$_", param_261
.annotate "line", 547
    find_lex $P262, "$_"
    find_lex $P263, "%capnames"
    unless_null $P263, vivify_105
    $P263 = root_new ['parrot';'Hash']
  vivify_105:
    set $P264, $P263[$P262]
    unless_null $P264, vivify_106
    new $P264, "Undef"
  vivify_106:
    set $N265, $P264
    new $P266, 'Float'
    set $P266, $N265
    find_lex $P267, "$_"
    find_lex $P268, "%x"
    unless_null $P268, vivify_107
    $P268 = root_new ['parrot';'Hash']
  vivify_107:
    set $P269, $P268[$P267]
    unless_null $P269, vivify_108
    new $P269, "Undef"
  vivify_108:
    add $P270, $P266, $P269
    find_lex $P271, "$_"
    find_lex $P272, "%capnames"
    unless_null $P272, vivify_109
    $P272 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P272
  vivify_109:
    set $P272[$P271], $P270
.annotate "line", 546
    .return ($P270)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block177"  :anon :subid("20_1267204695.47543") :outer("14_1267204695.47543")
.annotate "line", 521
    .const 'Sub' $P196 = "21_1267204695.47543" 
    capture_lex $P196
.annotate "line", 522
    new $P179, "Undef"
    .lex "$name", $P179
.annotate "line", 524
    $P180 = root_new ['parrot';'ResizablePMCArray']
    .lex "@names", $P180
.annotate "line", 522
    find_lex $P181, "$ast"
    $P182 = $P181."name"()
    store_lex "$name", $P182
.annotate "line", 523
    find_lex $P184, "$name"
    set $S185, $P184
    iseq $I186, $S185, ""
    unless $I186, if_183_end
    find_lex $P187, "$count"
    store_lex "$name", $P187
    find_lex $P188, "$ast"
    find_lex $P189, "$name"
    $P188."name"($P189)
  if_183_end:
.annotate "line", 524

            $P0 = find_lex '$name'
            $S0 = $P0
            $P190 = split '=', $S0
        
    store_lex "@names", $P190
.annotate "line", 529
    find_lex $P192, "@names"
    defined $I193, $P192
    unless $I193, for_undef_112
    iter $P191, $P192
    new $P213, 'ExceptionHandler'
    set_addr $P213, loop212_handler
    $P213."handle_types"(65, 67, 66)
    push_eh $P213
  loop212_test:
    unless $P191, loop212_done
    shift $P194, $P191
  loop212_redo:
    .const 'Sub' $P196 = "21_1267204695.47543" 
    capture_lex $P196
    $P196($P194)
  loop212_next:
    goto loop212_test
  loop212_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P214, exception, 'type'
    eq $P214, 65, loop212_next
    eq $P214, 67, loop212_redo
  loop212_done:
    pop_eh 
  for_undef_112:
.annotate "line", 521
    .return ($P191)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block195"  :anon :subid("21_1267204695.47543") :outer("20_1267204695.47543")
    .param pmc param_197
.annotate "line", 529
    .lex "$_", param_197
.annotate "line", 530
    find_lex $P201, "$_"
    set $S202, $P201
    iseq $I203, $S202, "0"
    unless $I203, unless_200
    new $P199, 'Integer'
    set $P199, $I203
    goto unless_200_end
  unless_200:
    find_lex $P204, "$_"
    set $N205, $P204
    isgt $I206, $N205, 0.0
    new $P199, 'Integer'
    set $P199, $I206
  unless_200_end:
    unless $P199, if_198_end
    find_lex $P207, "$_"
    add $P208, $P207, 1
    store_lex "$count", $P208
  if_198_end:
.annotate "line", 531
    new $P209, "Integer"
    assign $P209, 1
    find_lex $P210, "$_"
    find_lex $P211, "%capnames"
    unless_null $P211, vivify_113
    $P211 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P211
  vivify_113:
    set $P211[$P210], $P209
.annotate "line", 529
    .return ($P209)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block135"  :anon :subid("18_1267204695.47543") :outer("14_1267204695.47543")
    .param pmc param_138
.annotate "line", 513
    .const 'Sub' $P147 = "19_1267204695.47543" 
    capture_lex $P147
.annotate "line", 514
    $P137 = root_new ['parrot';'Hash']
    .lex "%x", $P137
    .lex "$_", param_138
    find_lex $P139, "$_"
    find_lex $P140, "$count"
    $P141 = "capnames"($P139, $P140)
    store_lex "%x", $P141
.annotate "line", 515
    find_lex $P143, "%x"
    defined $I144, $P143
    unless $I144, for_undef_115
    iter $P142, $P143
    new $P161, 'ExceptionHandler'
    set_addr $P161, loop160_handler
    $P161."handle_types"(65, 67, 66)
    push_eh $P161
  loop160_test:
    unless $P142, loop160_done
    shift $P145, $P142
  loop160_redo:
    .const 'Sub' $P147 = "19_1267204695.47543" 
    capture_lex $P147
    $P147($P145)
  loop160_next:
    goto loop160_test
  loop160_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P162, exception, 'type'
    eq $P162, 65, loop160_next
    eq $P162, 67, loop160_redo
  loop160_done:
    pop_eh 
  for_undef_115:
.annotate "line", 518
    find_lex $P163, "%x"
    unless_null $P163, vivify_121
    $P163 = root_new ['parrot';'Hash']
  vivify_121:
    set $P164, $P163[""]
    unless_null $P164, vivify_122
    new $P164, "Undef"
  vivify_122:
    store_lex "$count", $P164
.annotate "line", 513
    .return ($P164)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block146"  :anon :subid("19_1267204695.47543") :outer("18_1267204695.47543")
    .param pmc param_148
.annotate "line", 515
    .lex "$_", param_148
.annotate "line", 516
    find_lex $P149, "$_"
    find_lex $P150, "%capnames"
    unless_null $P150, vivify_116
    $P150 = root_new ['parrot';'Hash']
  vivify_116:
    set $P151, $P150[$P149]
    unless_null $P151, vivify_117
    new $P151, "Undef"
  vivify_117:
    set $N152, $P151
    new $P153, 'Float'
    set $P153, $N152
    find_lex $P154, "$_"
    find_lex $P155, "%x"
    unless_null $P155, vivify_118
    $P155 = root_new ['parrot';'Hash']
  vivify_118:
    set $P156, $P155[$P154]
    unless_null $P156, vivify_119
    new $P156, "Undef"
  vivify_119:
    add $P157, $P153, $P156
    find_lex $P158, "$_"
    find_lex $P159, "%capnames"
    unless_null $P159, vivify_120
    $P159 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P159
  vivify_120:
    set $P159[$P158], $P157
.annotate "line", 515
    .return ($P157)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block68"  :anon :subid("15_1267204695.47543") :outer("14_1267204695.47543")
.annotate "line", 499
    .const 'Sub' $P78 = "16_1267204695.47543" 
    capture_lex $P78
.annotate "line", 500
    new $P70, "Undef"
    .lex "$max", $P70
    find_lex $P71, "$count"
    store_lex "$max", $P71
.annotate "line", 501
    find_lex $P73, "$ast"
    $P74 = $P73."list"()
    defined $I75, $P74
    unless $I75, for_undef_123
    iter $P72, $P74
    new $P123, 'ExceptionHandler'
    set_addr $P123, loop122_handler
    $P123."handle_types"(65, 67, 66)
    push_eh $P123
  loop122_test:
    unless $P72, loop122_done
    shift $P76, $P72
  loop122_redo:
    .const 'Sub' $P78 = "16_1267204695.47543" 
    capture_lex $P78
    $P78($P76)
  loop122_next:
    goto loop122_test
  loop122_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P124, exception, 'type'
    eq $P124, 65, loop122_next
    eq $P124, 67, loop122_redo
  loop122_done:
    pop_eh 
  for_undef_123:
.annotate "line", 510
    find_lex $P125, "$max"
    store_lex "$count", $P125
.annotate "line", 499
    .return ($P125)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block77"  :anon :subid("16_1267204695.47543") :outer("15_1267204695.47543")
    .param pmc param_80
.annotate "line", 501
    .const 'Sub' $P89 = "17_1267204695.47543" 
    capture_lex $P89
.annotate "line", 502
    $P79 = root_new ['parrot';'Hash']
    .lex "%x", $P79
    .lex "$_", param_80
    find_lex $P81, "$_"
    find_lex $P82, "$count"
    $P83 = "capnames"($P81, $P82)
    store_lex "%x", $P83
.annotate "line", 503
    find_lex $P85, "%x"
    defined $I86, $P85
    unless $I86, for_undef_124
    iter $P84, $P85
    new $P110, 'ExceptionHandler'
    set_addr $P110, loop109_handler
    $P110."handle_types"(65, 67, 66)
    push_eh $P110
  loop109_test:
    unless $P84, loop109_done
    shift $P87, $P84
  loop109_redo:
    .const 'Sub' $P89 = "17_1267204695.47543" 
    capture_lex $P89
    $P89($P87)
  loop109_next:
    goto loop109_test
  loop109_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, 'type'
    eq $P111, 65, loop109_next
    eq $P111, 67, loop109_redo
  loop109_done:
    pop_eh 
  for_undef_124:
.annotate "line", 508
    find_lex $P114, "%x"
    unless_null $P114, vivify_130
    $P114 = root_new ['parrot';'Hash']
  vivify_130:
    set $P115, $P114[""]
    unless_null $P115, vivify_131
    new $P115, "Undef"
  vivify_131:
    set $N116, $P115
    find_lex $P117, "$max"
    set $N118, $P117
    isgt $I119, $N116, $N118
    if $I119, if_113
    new $P112, 'Integer'
    set $P112, $I119
    goto if_113_end
  if_113:
    find_lex $P120, "%x"
    unless_null $P120, vivify_132
    $P120 = root_new ['parrot';'Hash']
  vivify_132:
    set $P121, $P120[""]
    unless_null $P121, vivify_133
    new $P121, "Undef"
  vivify_133:
    store_lex "$max", $P121
    set $P112, $P121
  if_113_end:
.annotate "line", 501
    .return ($P112)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block88"  :anon :subid("17_1267204695.47543") :outer("16_1267204695.47543")
    .param pmc param_90
.annotate "line", 503
    .lex "$_", param_90
.annotate "line", 504
    find_lex $P95, "$_"
    find_lex $P96, "%capnames"
    unless_null $P96, vivify_125
    $P96 = root_new ['parrot';'Hash']
  vivify_125:
    set $P97, $P96[$P95]
    unless_null $P97, vivify_126
    new $P97, "Undef"
  vivify_126:
    set $N98, $P97
    islt $I99, $N98, 2.0
    if $I99, if_94
    new $P93, 'Integer'
    set $P93, $I99
    goto if_94_end
  if_94:
    find_lex $P100, "$_"
    find_lex $P101, "%x"
    unless_null $P101, vivify_127
    $P101 = root_new ['parrot';'Hash']
  vivify_127:
    set $P102, $P101[$P100]
    unless_null $P102, vivify_128
    new $P102, "Undef"
  vivify_128:
    set $N103, $P102
    iseq $I104, $N103, 1.0
    new $P93, 'Integer'
    set $P93, $I104
  if_94_end:
    if $P93, if_92
    new $P106, "Integer"
    assign $P106, 2
    set $P91, $P106
    goto if_92_end
  if_92:
    new $P105, "Integer"
    assign $P105, 1
    set $P91, $P105
  if_92_end:
.annotate "line", 505
    find_lex $P107, "$_"
    find_lex $P108, "%capnames"
    unless_null $P108, vivify_129
    $P108 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P108
  vivify_129:
    set $P108[$P107], $P91
.annotate "line", 503
    .return ($P91)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backmod"  :subid("27_1267204695.47543") :outer("11_1267204695.47543")
    .param pmc param_311
    .param pmc param_312
.annotate "line", 562
    new $P310, 'ExceptionHandler'
    set_addr $P310, control_309
    $P310."handle_types"(58)
    push_eh $P310
    .lex "$ast", param_311
    .lex "$backmod", param_312
.annotate "line", 563
    find_lex $P314, "$backmod"
    set $S315, $P314
    iseq $I316, $S315, ":"
    if $I316, if_313
.annotate "line", 564
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
.annotate "line", 565
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
.annotate "line", 564
    find_lex $P327, "$ast"
    $P327."backtrack"("f")
  if_318_end:
    goto if_313_end
  if_313:
.annotate "line", 563
    find_lex $P317, "$ast"
    $P317."backtrack"("r")
  if_313_end:
    find_lex $P338, "$ast"
.annotate "line", 562
    .return ($P338)
  control_309:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P339, exception, "payload"
    .return ($P339)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "subrule_alias"  :subid("28_1267204695.47543") :outer("11_1267204695.47543")
    .param pmc param_343
    .param pmc param_344
.annotate "line", 569
    new $P342, 'ExceptionHandler'
    set_addr $P342, control_341
    $P342."handle_types"(58)
    push_eh $P342
    .lex "$past", param_343
    .lex "$name", param_344
.annotate "line", 570
    find_lex $P346, "$past"
    $S347 = $P346."name"()
    isgt $I348, $S347, ""
    if $I348, if_345
.annotate "line", 571
    find_lex $P355, "$past"
    find_lex $P356, "$name"
    $P355."name"($P356)
    goto if_345_end
  if_345:
.annotate "line", 570
    find_lex $P349, "$past"
    find_lex $P350, "$name"
    concat $P351, $P350, "="
    find_lex $P352, "$past"
    $S353 = $P352."name"()
    concat $P354, $P351, $S353
    $P349."name"($P354)
  if_345_end:
.annotate "line", 572
    find_lex $P357, "$past"
    $P358 = $P357."subtype"("capture")
.annotate "line", 569
    .return ($P358)
  control_341:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P359, exception, "payload"
    .return ($P359)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "arg"  :subid("29_1267204695.47543") :method :outer("11_1267204695.47543")
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
    unless_null $P369, vivify_135
    $P369 = root_new ['parrot';'Hash']
  vivify_135:
    set $P370, $P369["quote_EXPR"]
    unless_null $P370, vivify_136
    new $P370, "Undef"
  vivify_136:
    if $P370, if_368
    find_lex $P374, "$/"
    unless_null $P374, vivify_137
    $P374 = root_new ['parrot';'Hash']
  vivify_137:
    set $P375, $P374["val"]
    unless_null $P375, vivify_138
    new $P375, "Undef"
  vivify_138:
    set $N376, $P375
    new $P367, 'Float'
    set $P367, $N376
    goto if_368_end
  if_368:
    find_lex $P371, "$/"
    unless_null $P371, vivify_139
    $P371 = root_new ['parrot';'Hash']
  vivify_139:
    set $P372, $P371["quote_EXPR"]
    unless_null $P372, vivify_140
    new $P372, "Undef"
  vivify_140:
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
.sub "arglist"  :subid("30_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_382
.annotate "line", 18
    .const 'Sub' $P392 = "31_1267204695.47543" 
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
    unless_null $P387, vivify_141
    $P387 = root_new ['parrot';'Hash']
  vivify_141:
    set $P388, $P387["arg"]
    unless_null $P388, vivify_142
    new $P388, "Undef"
  vivify_142:
    defined $I389, $P388
    unless $I389, for_undef_143
    iter $P386, $P388
    new $P399, 'ExceptionHandler'
    set_addr $P399, loop398_handler
    $P399."handle_types"(65, 67, 66)
    push_eh $P399
  loop398_test:
    unless $P386, loop398_done
    shift $P390, $P386
  loop398_redo:
    .const 'Sub' $P392 = "31_1267204695.47543" 
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
  for_undef_143:
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
.sub "_block391"  :anon :subid("31_1267204695.47543") :outer("30_1267204695.47543")
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
.sub "TOP"  :subid("32_1267204695.47543") :method :outer("11_1267204695.47543")
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
    unless_null $P410, vivify_144
    $P410 = root_new ['parrot';'Hash']
  vivify_144:
    set $P411, $P410["nibbler"]
    unless_null $P411, vivify_145
    new $P411, "Undef"
  vivify_145:
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
.sub "nibbler"  :subid("33_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_423
    .param pmc param_424 :optional
    .param int has_param_424 :opt_flag
.annotate "line", 30
    .const 'Sub' $P458 = "35_1267204695.47543" 
    capture_lex $P458
    .const 'Sub' $P432 = "34_1267204695.47543" 
    capture_lex $P432
    new $P422, 'ExceptionHandler'
    set_addr $P422, control_421
    $P422."handle_types"(58)
    push_eh $P422
    .lex "self", self
    .lex "$/", param_423
    if has_param_424, optparam_146
    new $P425, "Undef"
    set param_424, $P425
  optparam_146:
    .lex "$key", param_424
.annotate "line", 42
    new $P426, "Undef"
    .lex "$past", $P426
.annotate "line", 31
    find_lex $P428, "$key"
    set $S429, $P428
    iseq $I430, $S429, "open"
    unless $I430, if_427_end
    .const 'Sub' $P432 = "34_1267204695.47543" 
    capture_lex $P432
    $P432()
  if_427_end:
.annotate "line", 41
    get_global $P442, "@MODIFIERS"
    $P442."shift"()
    find_lex $P443, "$past"
.annotate "line", 43
    find_lex $P445, "$/"
    unless_null $P445, vivify_149
    $P445 = root_new ['parrot';'Hash']
  vivify_149:
    set $P446, $P445["termish"]
    unless_null $P446, vivify_150
    new $P446, "Undef"
  vivify_150:
    set $N447, $P446
    isgt $I448, $N447, 1.0
    if $I448, if_444
.annotate "line", 50
    find_lex $P467, "$/"
    unless_null $P467, vivify_151
    $P467 = root_new ['parrot';'Hash']
  vivify_151:
    set $P468, $P467["termish"]
    unless_null $P468, vivify_152
    $P468 = root_new ['parrot';'ResizablePMCArray']
  vivify_152:
    set $P469, $P468[0]
    unless_null $P469, vivify_153
    new $P469, "Undef"
  vivify_153:
    $P470 = $P469."ast"()
    store_lex "$past", $P470
.annotate "line", 49
    goto if_444_end
  if_444:
.annotate "line", 44
    get_hll_global $P449, ["PAST"], "Regex"
    find_lex $P450, "$/"
    $P451 = $P449."new"("alt" :named("pasttype"), $P450 :named("node"))
    store_lex "$past", $P451
.annotate "line", 45
    find_lex $P453, "$/"
    unless_null $P453, vivify_154
    $P453 = root_new ['parrot';'Hash']
  vivify_154:
    set $P454, $P453["termish"]
    unless_null $P454, vivify_155
    new $P454, "Undef"
  vivify_155:
    defined $I455, $P454
    unless $I455, for_undef_156
    iter $P452, $P454
    new $P465, 'ExceptionHandler'
    set_addr $P465, loop464_handler
    $P465."handle_types"(65, 67, 66)
    push_eh $P465
  loop464_test:
    unless $P452, loop464_done
    shift $P456, $P452
  loop464_redo:
    .const 'Sub' $P458 = "35_1267204695.47543" 
    capture_lex $P458
    $P458($P456)
  loop464_next:
    goto loop464_test
  loop464_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P466, exception, 'type'
    eq $P466, 65, loop464_next
    eq $P466, 67, loop464_redo
  loop464_done:
    pop_eh 
  for_undef_156:
  if_444_end:
.annotate "line", 52
    find_lex $P471, "$/"
    find_lex $P472, "$past"
    $P473 = $P471."!make"($P472)
.annotate "line", 30
    .return ($P473)
  control_421:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P474, exception, "payload"
    .return ($P474)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block431"  :anon :subid("34_1267204695.47543") :outer("33_1267204695.47543")
.annotate "line", 32
    $P433 = root_new ['parrot';'Hash']
    .lex "%old", $P433
.annotate "line", 33
    $P434 = root_new ['parrot';'Hash']
    .lex "%new", $P434
.annotate "line", 32
    get_global $P435, "@MODIFIERS"
    unless_null $P435, vivify_147
    $P435 = root_new ['parrot';'ResizablePMCArray']
  vivify_147:
    set $P436, $P435[0]
    unless_null $P436, vivify_148
    new $P436, "Undef"
  vivify_148:
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
.sub "_block457"  :anon :subid("35_1267204695.47543") :outer("33_1267204695.47543")
    .param pmc param_459
.annotate "line", 45
    .lex "$_", param_459
.annotate "line", 46
    find_lex $P460, "$past"
    find_lex $P461, "$_"
    $P462 = $P461."ast"()
    $P463 = $P460."push"($P462)
.annotate "line", 45
    .return ($P463)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "termish"  :subid("36_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_478
.annotate "line", 55
    .const 'Sub' $P491 = "37_1267204695.47543" 
    capture_lex $P491
    new $P477, 'ExceptionHandler'
    set_addr $P477, control_476
    $P477."handle_types"(58)
    push_eh $P477
    .lex "self", self
    .lex "$/", param_478
.annotate "line", 56
    new $P479, "Undef"
    .lex "$past", $P479
.annotate "line", 57
    new $P480, "Undef"
    .lex "$lastlit", $P480
.annotate "line", 56
    get_hll_global $P481, ["PAST"], "Regex"
    find_lex $P482, "$/"
    $P483 = $P481."new"("concat" :named("pasttype"), $P482 :named("node"))
    store_lex "$past", $P483
.annotate "line", 57
    new $P484, "Integer"
    assign $P484, 0
    store_lex "$lastlit", $P484
.annotate "line", 58
    find_lex $P486, "$/"
    unless_null $P486, vivify_157
    $P486 = root_new ['parrot';'Hash']
  vivify_157:
    set $P487, $P486["noun"]
    unless_null $P487, vivify_158
    new $P487, "Undef"
  vivify_158:
    defined $I488, $P487
    unless $I488, for_undef_159
    iter $P485, $P487
    new $P537, 'ExceptionHandler'
    set_addr $P537, loop536_handler
    $P537."handle_types"(65, 67, 66)
    push_eh $P537
  loop536_test:
    unless $P485, loop536_done
    shift $P489, $P485
  loop536_redo:
    .const 'Sub' $P491 = "37_1267204695.47543" 
    capture_lex $P491
    $P491($P489)
  loop536_next:
    goto loop536_test
  loop536_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P538, exception, 'type'
    eq $P538, 65, loop536_next
    eq $P538, 67, loop536_redo
  loop536_done:
    pop_eh 
  for_undef_159:
.annotate "line", 73
    find_lex $P539, "$/"
    find_lex $P540, "$past"
    $P541 = $P539."!make"($P540)
.annotate "line", 55
    .return ($P541)
  control_476:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P542, exception, "payload"
    .return ($P542)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block490"  :anon :subid("37_1267204695.47543") :outer("36_1267204695.47543")
    .param pmc param_493
.annotate "line", 59
    new $P492, "Undef"
    .lex "$ast", $P492
    .lex "$_", param_493
    find_lex $P494, "$_"
    $P495 = $P494."ast"()
    store_lex "$ast", $P495
.annotate "line", 60
    find_lex $P498, "$ast"
    if $P498, if_497
    set $P496, $P498
    goto if_497_end
  if_497:
.annotate "line", 61
    find_lex $P505, "$lastlit"
    if $P505, if_504
    set $P503, $P505
    goto if_504_end
  if_504:
    find_lex $P506, "$ast"
    $S507 = $P506."pasttype"()
    iseq $I508, $S507, "literal"
    new $P503, 'Integer'
    set $P503, $I508
  if_504_end:
    if $P503, if_502
    set $P501, $P503
    goto if_502_end
  if_502:
.annotate "line", 62
    get_hll_global $P509, ["PAST"], "Node"
    find_lex $P510, "$ast"
    unless_null $P510, vivify_160
    $P510 = root_new ['parrot';'ResizablePMCArray']
  vivify_160:
    set $P511, $P510[0]
    unless_null $P511, vivify_161
    new $P511, "Undef"
  vivify_161:
    $P512 = $P509."ACCEPTS"($P511)
    isfalse $I513, $P512
    new $P501, 'Integer'
    set $P501, $I513
  if_502_end:
    if $P501, if_500
.annotate "line", 66
    find_lex $P520, "$past"
    find_lex $P521, "$ast"
    $P520."push"($P521)
.annotate "line", 67
    find_lex $P526, "$ast"
    $S527 = $P526."pasttype"()
    iseq $I528, $S527, "literal"
    if $I528, if_525
    new $P524, 'Integer'
    set $P524, $I528
    goto if_525_end
  if_525:
.annotate "line", 68
    get_hll_global $P529, ["PAST"], "Node"
    find_lex $P530, "$ast"
    unless_null $P530, vivify_162
    $P530 = root_new ['parrot';'ResizablePMCArray']
  vivify_162:
    set $P531, $P530[0]
    unless_null $P531, vivify_163
    new $P531, "Undef"
  vivify_163:
    $P532 = $P529."ACCEPTS"($P531)
    isfalse $I533, $P532
    new $P524, 'Integer'
    set $P524, $I533
  if_525_end:
    if $P524, if_523
    new $P535, "Integer"
    assign $P535, 0
    set $P522, $P535
    goto if_523_end
  if_523:
    find_lex $P534, "$ast"
    set $P522, $P534
  if_523_end:
.annotate "line", 69
    store_lex "$lastlit", $P522
.annotate "line", 65
    set $P499, $P522
.annotate "line", 62
    goto if_500_end
  if_500:
.annotate "line", 63
    find_lex $P514, "$lastlit"
    unless_null $P514, vivify_164
    $P514 = root_new ['parrot';'ResizablePMCArray']
  vivify_164:
    set $P515, $P514[0]
    unless_null $P515, vivify_165
    new $P515, "Undef"
  vivify_165:
    find_lex $P516, "$ast"
    unless_null $P516, vivify_166
    $P516 = root_new ['parrot';'ResizablePMCArray']
  vivify_166:
    set $P517, $P516[0]
    unless_null $P517, vivify_167
    new $P517, "Undef"
  vivify_167:
    concat $P518, $P515, $P517
    find_lex $P519, "$lastlit"
    unless_null $P519, vivify_168
    $P519 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$lastlit", $P519
  vivify_168:
    set $P519[0], $P518
.annotate "line", 62
    set $P499, $P518
  if_500_end:
.annotate "line", 60
    set $P496, $P499
  if_497_end:
.annotate "line", 58
    .return ($P496)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantified_atom"  :subid("38_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_546
.annotate "line", 76
    .const 'Sub' $P555 = "39_1267204695.47543" 
    capture_lex $P555
    new $P545, 'ExceptionHandler'
    set_addr $P545, control_544
    $P545."handle_types"(58)
    push_eh $P545
    .lex "self", self
    .lex "$/", param_546
.annotate "line", 77
    new $P547, "Undef"
    .lex "$past", $P547
    find_lex $P548, "$/"
    unless_null $P548, vivify_169
    $P548 = root_new ['parrot';'Hash']
  vivify_169:
    set $P549, $P548["atom"]
    unless_null $P549, vivify_170
    new $P549, "Undef"
  vivify_170:
    $P550 = $P549."ast"()
    store_lex "$past", $P550
.annotate "line", 78
    find_lex $P552, "$/"
    unless_null $P552, vivify_171
    $P552 = root_new ['parrot';'Hash']
  vivify_171:
    set $P553, $P552["quantifier"]
    unless_null $P553, vivify_172
    new $P553, "Undef"
  vivify_172:
    if $P553, if_551
.annotate "line", 84
    find_lex $P569, "$/"
    unless_null $P569, vivify_173
    $P569 = root_new ['parrot';'Hash']
  vivify_173:
    set $P570, $P569["backmod"]
    unless_null $P570, vivify_174
    $P570 = root_new ['parrot';'ResizablePMCArray']
  vivify_174:
    set $P571, $P570[0]
    unless_null $P571, vivify_175
    new $P571, "Undef"
  vivify_175:
    unless $P571, if_568_end
    find_lex $P572, "$past"
    find_lex $P573, "$/"
    unless_null $P573, vivify_176
    $P573 = root_new ['parrot';'Hash']
  vivify_176:
    set $P574, $P573["backmod"]
    unless_null $P574, vivify_177
    $P574 = root_new ['parrot';'ResizablePMCArray']
  vivify_177:
    set $P575, $P574[0]
    unless_null $P575, vivify_178
    new $P575, "Undef"
  vivify_178:
    "backmod"($P572, $P575)
  if_568_end:
    goto if_551_end
  if_551:
.annotate "line", 78
    .const 'Sub' $P555 = "39_1267204695.47543" 
    capture_lex $P555
    $P555()
  if_551_end:
.annotate "line", 85
    find_lex $P581, "$past"
    if $P581, if_580
    set $P579, $P581
    goto if_580_end
  if_580:
    find_lex $P582, "$past"
    $P583 = $P582."backtrack"()
    isfalse $I584, $P583
    new $P579, 'Integer'
    set $P579, $I584
  if_580_end:
    if $P579, if_578
    set $P577, $P579
    goto if_578_end
  if_578:
    get_global $P585, "@MODIFIERS"
    unless_null $P585, vivify_182
    $P585 = root_new ['parrot';'ResizablePMCArray']
  vivify_182:
    set $P586, $P585[0]
    unless_null $P586, vivify_183
    $P586 = root_new ['parrot';'Hash']
  vivify_183:
    set $P587, $P586["r"]
    unless_null $P587, vivify_184
    new $P587, "Undef"
  vivify_184:
    set $P577, $P587
  if_578_end:
    unless $P577, if_576_end
.annotate "line", 86
    find_lex $P588, "$past"
    $P588."backtrack"("r")
  if_576_end:
.annotate "line", 88
    find_lex $P589, "$/"
    find_lex $P590, "$past"
    $P591 = $P589."!make"($P590)
.annotate "line", 76
    .return ($P591)
  control_544:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P592, exception, "payload"
    .return ($P592)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block554"  :anon :subid("39_1267204695.47543") :outer("38_1267204695.47543")
.annotate "line", 80
    new $P556, "Undef"
    .lex "$qast", $P556
.annotate "line", 79
    find_lex $P558, "$past"
    isfalse $I559, $P558
    unless $I559, if_557_end
    find_lex $P560, "$/"
    $P560."panic"("Can't quantify zero-width atom")
  if_557_end:
.annotate "line", 80
    find_lex $P561, "$/"
    unless_null $P561, vivify_179
    $P561 = root_new ['parrot';'Hash']
  vivify_179:
    set $P562, $P561["quantifier"]
    unless_null $P562, vivify_180
    $P562 = root_new ['parrot';'ResizablePMCArray']
  vivify_180:
    set $P563, $P562[0]
    unless_null $P563, vivify_181
    new $P563, "Undef"
  vivify_181:
    $P564 = $P563."ast"()
    store_lex "$qast", $P564
.annotate "line", 81
    find_lex $P565, "$qast"
    find_lex $P566, "$past"
    $P565."unshift"($P566)
.annotate "line", 82
    find_lex $P567, "$qast"
    store_lex "$past", $P567
.annotate "line", 78
    .return ($P567)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "atom"  :subid("40_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_596
.annotate "line", 91
    new $P595, 'ExceptionHandler'
    set_addr $P595, control_594
    $P595."handle_types"(58)
    push_eh $P595
    .lex "self", self
    .lex "$/", param_596
.annotate "line", 92
    new $P597, "Undef"
    .lex "$past", $P597
.annotate "line", 91
    find_lex $P598, "$past"
.annotate "line", 93
    find_lex $P600, "$/"
    unless_null $P600, vivify_185
    $P600 = root_new ['parrot';'Hash']
  vivify_185:
    set $P601, $P600["metachar"]
    unless_null $P601, vivify_186
    new $P601, "Undef"
  vivify_186:
    if $P601, if_599
.annotate "line", 95
    get_hll_global $P605, ["PAST"], "Regex"
    find_lex $P606, "$/"
    set $S607, $P606
    find_lex $P608, "$/"
    $P609 = $P605."new"($S607, "literal" :named("pasttype"), $P608 :named("node"))
    store_lex "$past", $P609
.annotate "line", 96
    get_global $P611, "@MODIFIERS"
    unless_null $P611, vivify_187
    $P611 = root_new ['parrot';'ResizablePMCArray']
  vivify_187:
    set $P612, $P611[0]
    unless_null $P612, vivify_188
    $P612 = root_new ['parrot';'Hash']
  vivify_188:
    set $P613, $P612["i"]
    unless_null $P613, vivify_189
    new $P613, "Undef"
  vivify_189:
    unless $P613, if_610_end
    find_lex $P614, "$past"
    $P614."subtype"("ignorecase")
  if_610_end:
.annotate "line", 94
    goto if_599_end
  if_599:
.annotate "line", 93
    find_lex $P602, "$/"
    unless_null $P602, vivify_190
    $P602 = root_new ['parrot';'Hash']
  vivify_190:
    set $P603, $P602["metachar"]
    unless_null $P603, vivify_191
    new $P603, "Undef"
  vivify_191:
    $P604 = $P603."ast"()
    store_lex "$past", $P604
  if_599_end:
.annotate "line", 98
    find_lex $P615, "$/"
    find_lex $P616, "$past"
    $P617 = $P615."!make"($P616)
.annotate "line", 91
    .return ($P617)
  control_594:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P618, exception, "payload"
    .return ($P618)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<*>"  :subid("41_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_622
.annotate "line", 101
    new $P621, 'ExceptionHandler'
    set_addr $P621, control_620
    $P621."handle_types"(58)
    push_eh $P621
    .lex "self", self
    .lex "$/", param_622
.annotate "line", 102
    new $P623, "Undef"
    .lex "$past", $P623
    get_hll_global $P624, ["PAST"], "Regex"
    find_lex $P625, "$/"
    $P626 = $P624."new"("quant" :named("pasttype"), $P625 :named("node"))
    store_lex "$past", $P626
.annotate "line", 103
    find_lex $P627, "$/"
    find_lex $P628, "$past"
    find_lex $P629, "$/"
    unless_null $P629, vivify_192
    $P629 = root_new ['parrot';'Hash']
  vivify_192:
    set $P630, $P629["backmod"]
    unless_null $P630, vivify_193
    new $P630, "Undef"
  vivify_193:
    $P631 = "backmod"($P628, $P630)
    $P632 = $P627."!make"($P631)
.annotate "line", 101
    .return ($P632)
  control_620:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P633, exception, "payload"
    .return ($P633)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<+>"  :subid("42_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_637
.annotate "line", 106
    new $P636, 'ExceptionHandler'
    set_addr $P636, control_635
    $P636."handle_types"(58)
    push_eh $P636
    .lex "self", self
    .lex "$/", param_637
.annotate "line", 107
    new $P638, "Undef"
    .lex "$past", $P638
    get_hll_global $P639, ["PAST"], "Regex"
    find_lex $P640, "$/"
    $P641 = $P639."new"("quant" :named("pasttype"), 1 :named("min"), $P640 :named("node"))
    store_lex "$past", $P641
.annotate "line", 108
    find_lex $P642, "$/"
    find_lex $P643, "$past"
    find_lex $P644, "$/"
    unless_null $P644, vivify_194
    $P644 = root_new ['parrot';'Hash']
  vivify_194:
    set $P645, $P644["backmod"]
    unless_null $P645, vivify_195
    new $P645, "Undef"
  vivify_195:
    $P646 = "backmod"($P643, $P645)
    $P647 = $P642."!make"($P646)
.annotate "line", 106
    .return ($P647)
  control_635:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P648, exception, "payload"
    .return ($P648)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<?>"  :subid("43_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_652
.annotate "line", 111
    new $P651, 'ExceptionHandler'
    set_addr $P651, control_650
    $P651."handle_types"(58)
    push_eh $P651
    .lex "self", self
    .lex "$/", param_652
.annotate "line", 112
    new $P653, "Undef"
    .lex "$past", $P653
    get_hll_global $P654, ["PAST"], "Regex"
    find_lex $P655, "$/"
    $P656 = $P654."new"("quant" :named("pasttype"), 0 :named("min"), 1 :named("max"), $P655 :named("node"))
    store_lex "$past", $P656
.annotate "line", 113
    find_lex $P657, "$/"
    find_lex $P658, "$past"
    find_lex $P659, "$/"
    unless_null $P659, vivify_196
    $P659 = root_new ['parrot';'Hash']
  vivify_196:
    set $P660, $P659["backmod"]
    unless_null $P660, vivify_197
    new $P660, "Undef"
  vivify_197:
    $P661 = "backmod"($P658, $P660)
    $P657."!make"($P661)
.annotate "line", 114
    find_lex $P662, "$/"
    find_lex $P663, "$past"
    $P664 = $P662."!make"($P663)
.annotate "line", 111
    .return ($P664)
  control_650:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P665, exception, "payload"
    .return ($P665)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<**>"  :subid("44_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_669
.annotate "line", 117
    new $P668, 'ExceptionHandler'
    set_addr $P668, control_667
    $P668."handle_types"(58)
    push_eh $P668
    .lex "self", self
    .lex "$/", param_669
.annotate "line", 118
    new $P670, "Undef"
    .lex "$past", $P670
.annotate "line", 117
    find_lex $P671, "$past"
.annotate "line", 119
    find_lex $P673, "$/"
    unless_null $P673, vivify_198
    $P673 = root_new ['parrot';'Hash']
  vivify_198:
    set $P674, $P673["quantified_atom"]
    unless_null $P674, vivify_199
    new $P674, "Undef"
  vivify_199:
    if $P674, if_672
.annotate "line", 124
    get_hll_global $P681, ["PAST"], "Regex"
    find_lex $P682, "$/"
    unless_null $P682, vivify_200
    $P682 = root_new ['parrot';'Hash']
  vivify_200:
    set $P683, $P682["min"]
    unless_null $P683, vivify_201
    new $P683, "Undef"
  vivify_201:
    set $N684, $P683
    find_lex $P685, "$/"
    $P686 = $P681."new"("quant" :named("pasttype"), $N684 :named("min"), $P685 :named("node"))
    store_lex "$past", $P686
.annotate "line", 125
    find_lex $P688, "$/"
    unless_null $P688, vivify_202
    $P688 = root_new ['parrot';'Hash']
  vivify_202:
    set $P689, $P688["max"]
    unless_null $P689, vivify_203
    new $P689, "Undef"
  vivify_203:
    isfalse $I690, $P689
    if $I690, if_687
.annotate "line", 126
    find_lex $P696, "$/"
    unless_null $P696, vivify_204
    $P696 = root_new ['parrot';'Hash']
  vivify_204:
    set $P697, $P696["max"]
    unless_null $P697, vivify_205
    $P697 = root_new ['parrot';'ResizablePMCArray']
  vivify_205:
    set $P698, $P697[0]
    unless_null $P698, vivify_206
    new $P698, "Undef"
  vivify_206:
    set $S699, $P698
    isne $I700, $S699, "*"
    unless $I700, if_695_end
    find_lex $P701, "$past"
    find_lex $P702, "$/"
    unless_null $P702, vivify_207
    $P702 = root_new ['parrot';'Hash']
  vivify_207:
    set $P703, $P702["max"]
    unless_null $P703, vivify_208
    $P703 = root_new ['parrot';'ResizablePMCArray']
  vivify_208:
    set $P704, $P703[0]
    unless_null $P704, vivify_209
    new $P704, "Undef"
  vivify_209:
    set $N705, $P704
    $P701."max"($N705)
  if_695_end:
    goto if_687_end
  if_687:
.annotate "line", 125
    find_lex $P691, "$past"
    find_lex $P692, "$/"
    unless_null $P692, vivify_210
    $P692 = root_new ['parrot';'Hash']
  vivify_210:
    set $P693, $P692["min"]
    unless_null $P693, vivify_211
    new $P693, "Undef"
  vivify_211:
    set $N694, $P693
    $P691."max"($N694)
  if_687_end:
.annotate "line", 123
    goto if_672_end
  if_672:
.annotate "line", 120
    get_hll_global $P675, ["PAST"], "Regex"
.annotate "line", 121
    find_lex $P676, "$/"
    unless_null $P676, vivify_212
    $P676 = root_new ['parrot';'Hash']
  vivify_212:
    set $P677, $P676["quantified_atom"]
    unless_null $P677, vivify_213
    new $P677, "Undef"
  vivify_213:
    $P678 = $P677."ast"()
    find_lex $P679, "$/"
    $P680 = $P675."new"("quant" :named("pasttype"), 1 :named("min"), $P678 :named("sep"), $P679 :named("node"))
.annotate "line", 120
    store_lex "$past", $P680
  if_672_end:
.annotate "line", 128
    find_lex $P706, "$/"
    find_lex $P707, "$past"
    find_lex $P708, "$/"
    unless_null $P708, vivify_214
    $P708 = root_new ['parrot';'Hash']
  vivify_214:
    set $P709, $P708["backmod"]
    unless_null $P709, vivify_215
    new $P709, "Undef"
  vivify_215:
    $P710 = "backmod"($P707, $P709)
    $P711 = $P706."!make"($P710)
.annotate "line", 117
    .return ($P711)
  control_667:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P712, exception, "payload"
    .return ($P712)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<ws>"  :subid("45_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_716
.annotate "line", 131
    new $P715, 'ExceptionHandler'
    set_addr $P715, control_714
    $P715."handle_types"(58)
    push_eh $P715
    .lex "self", self
    .lex "$/", param_716
.annotate "line", 132
    new $P717, "Undef"
    .lex "$past", $P717
.annotate "line", 133
    get_global $P720, "@MODIFIERS"
    unless_null $P720, vivify_216
    $P720 = root_new ['parrot';'ResizablePMCArray']
  vivify_216:
    set $P721, $P720[0]
    unless_null $P721, vivify_217
    $P721 = root_new ['parrot';'Hash']
  vivify_217:
    set $P722, $P721["s"]
    unless_null $P722, vivify_218
    new $P722, "Undef"
  vivify_218:
    if $P722, if_719
    new $P726, "Integer"
    assign $P726, 0
    set $P718, $P726
    goto if_719_end
  if_719:
    get_hll_global $P723, ["PAST"], "Regex"
    find_lex $P724, "$/"
    $P725 = $P723."new"("ws", "subrule" :named("pasttype"), "method" :named("subtype"), $P724 :named("node"))
    set $P718, $P725
  if_719_end:
    store_lex "$past", $P718
.annotate "line", 136
    find_lex $P727, "$/"
    find_lex $P728, "$past"
    $P729 = $P727."!make"($P728)
.annotate "line", 131
    .return ($P729)
  control_714:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P730, exception, "payload"
    .return ($P730)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<[ ]>"  :subid("46_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_734
.annotate "line", 140
    new $P733, 'ExceptionHandler'
    set_addr $P733, control_732
    $P733."handle_types"(58)
    push_eh $P733
    .lex "self", self
    .lex "$/", param_734
.annotate "line", 141
    find_lex $P735, "$/"
    find_lex $P736, "$/"
    unless_null $P736, vivify_219
    $P736 = root_new ['parrot';'Hash']
  vivify_219:
    set $P737, $P736["nibbler"]
    unless_null $P737, vivify_220
    new $P737, "Undef"
  vivify_220:
    $P738 = $P737."ast"()
    $P739 = $P735."!make"($P738)
.annotate "line", 140
    .return ($P739)
  control_732:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P740, exception, "payload"
    .return ($P740)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<( )>"  :subid("47_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_744
.annotate "line", 144
    new $P743, 'ExceptionHandler'
    set_addr $P743, control_742
    $P743."handle_types"(58)
    push_eh $P743
    .lex "self", self
    .lex "$/", param_744
.annotate "line", 145
    new $P745, "Undef"
    .lex "$subpast", $P745
.annotate "line", 146
    new $P746, "Undef"
    .lex "$past", $P746
.annotate "line", 145
    find_lex $P747, "$/"
    unless_null $P747, vivify_221
    $P747 = root_new ['parrot';'Hash']
  vivify_221:
    set $P748, $P747["nibbler"]
    unless_null $P748, vivify_222
    new $P748, "Undef"
  vivify_222:
    $P749 = $P748."ast"()
    $P750 = "buildsub"($P749)
    store_lex "$subpast", $P750
.annotate "line", 146
    get_hll_global $P751, ["PAST"], "Regex"
    find_lex $P752, "$subpast"
    find_lex $P753, "$/"
    $P754 = $P751."new"($P752, "subrule" :named("pasttype"), "capture" :named("subtype"), $P753 :named("node"))
    store_lex "$past", $P754
.annotate "line", 148
    find_lex $P755, "$/"
    find_lex $P756, "$past"
    $P757 = $P755."!make"($P756)
.annotate "line", 144
    .return ($P757)
  control_742:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P758, exception, "payload"
    .return ($P758)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<'>"  :subid("48_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_762
.annotate "line", 151
    new $P761, 'ExceptionHandler'
    set_addr $P761, control_760
    $P761."handle_types"(58)
    push_eh $P761
    .lex "self", self
    .lex "$/", param_762
.annotate "line", 152
    new $P763, "Undef"
    .lex "$quote", $P763
.annotate "line", 154
    new $P764, "Undef"
    .lex "$past", $P764
.annotate "line", 152
    find_lex $P765, "$/"
    unless_null $P765, vivify_223
    $P765 = root_new ['parrot';'Hash']
  vivify_223:
    set $P766, $P765["quote_EXPR"]
    unless_null $P766, vivify_224
    new $P766, "Undef"
  vivify_224:
    $P767 = $P766."ast"()
    store_lex "$quote", $P767
.annotate "line", 153
    get_hll_global $P769, ["PAST"], "Val"
    find_lex $P770, "$quote"
    $P771 = $P769."ACCEPTS"($P770)
    unless $P771, if_768_end
    find_lex $P772, "$quote"
    $P773 = $P772."value"()
    store_lex "$quote", $P773
  if_768_end:
.annotate "line", 154
    get_hll_global $P774, ["PAST"], "Regex"
    find_lex $P775, "$quote"
    find_lex $P776, "$/"
    $P777 = $P774."new"($P775, "literal" :named("pasttype"), $P776 :named("node"))
    store_lex "$past", $P777
.annotate "line", 155
    find_lex $P778, "$/"
    find_lex $P779, "$past"
    $P780 = $P778."!make"($P779)
.annotate "line", 151
    .return ($P780)
  control_760:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P781, exception, "payload"
    .return ($P781)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<\">"  :subid("49_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_785
.annotate "line", 158
    new $P784, 'ExceptionHandler'
    set_addr $P784, control_783
    $P784."handle_types"(58)
    push_eh $P784
    .lex "self", self
    .lex "$/", param_785
.annotate "line", 159
    new $P786, "Undef"
    .lex "$quote", $P786
.annotate "line", 161
    new $P787, "Undef"
    .lex "$past", $P787
.annotate "line", 159
    find_lex $P788, "$/"
    unless_null $P788, vivify_225
    $P788 = root_new ['parrot';'Hash']
  vivify_225:
    set $P789, $P788["quote_EXPR"]
    unless_null $P789, vivify_226
    new $P789, "Undef"
  vivify_226:
    $P790 = $P789."ast"()
    store_lex "$quote", $P790
.annotate "line", 160
    get_hll_global $P792, ["PAST"], "Val"
    find_lex $P793, "$quote"
    $P794 = $P792."ACCEPTS"($P793)
    unless $P794, if_791_end
    find_lex $P795, "$quote"
    $P796 = $P795."value"()
    store_lex "$quote", $P796
  if_791_end:
.annotate "line", 161
    get_hll_global $P797, ["PAST"], "Regex"
    find_lex $P798, "$quote"
    find_lex $P799, "$/"
    $P800 = $P797."new"($P798, "literal" :named("pasttype"), $P799 :named("node"))
    store_lex "$past", $P800
.annotate "line", 162
    find_lex $P801, "$/"
    find_lex $P802, "$past"
    $P803 = $P801."!make"($P802)
.annotate "line", 158
    .return ($P803)
  control_783:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P804, exception, "payload"
    .return ($P804)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<.>"  :subid("50_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_808
.annotate "line", 165
    new $P807, 'ExceptionHandler'
    set_addr $P807, control_806
    $P807."handle_types"(58)
    push_eh $P807
    .lex "self", self
    .lex "$/", param_808
.annotate "line", 166
    new $P809, "Undef"
    .lex "$past", $P809
    get_hll_global $P810, ["PAST"], "Regex"
    find_lex $P811, "$/"
    $P812 = $P810."new"("charclass" :named("pasttype"), "." :named("subtype"), $P811 :named("node"))
    store_lex "$past", $P812
.annotate "line", 167
    find_lex $P813, "$/"
    find_lex $P814, "$past"
    $P815 = $P813."!make"($P814)
.annotate "line", 165
    .return ($P815)
  control_806:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P816, exception, "payload"
    .return ($P816)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<^>"  :subid("51_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_820
.annotate "line", 170
    new $P819, 'ExceptionHandler'
    set_addr $P819, control_818
    $P819."handle_types"(58)
    push_eh $P819
    .lex "self", self
    .lex "$/", param_820
.annotate "line", 171
    new $P821, "Undef"
    .lex "$past", $P821
    get_hll_global $P822, ["PAST"], "Regex"
    find_lex $P823, "$/"
    $P824 = $P822."new"("anchor" :named("pasttype"), "bos" :named("subtype"), $P823 :named("node"))
    store_lex "$past", $P824
.annotate "line", 172
    find_lex $P825, "$/"
    find_lex $P826, "$past"
    $P827 = $P825."!make"($P826)
.annotate "line", 170
    .return ($P827)
  control_818:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P828, exception, "payload"
    .return ($P828)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<^^>"  :subid("52_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_832
.annotate "line", 175
    new $P831, 'ExceptionHandler'
    set_addr $P831, control_830
    $P831."handle_types"(58)
    push_eh $P831
    .lex "self", self
    .lex "$/", param_832
.annotate "line", 176
    new $P833, "Undef"
    .lex "$past", $P833
    get_hll_global $P834, ["PAST"], "Regex"
    find_lex $P835, "$/"
    $P836 = $P834."new"("anchor" :named("pasttype"), "bol" :named("subtype"), $P835 :named("node"))
    store_lex "$past", $P836
.annotate "line", 177
    find_lex $P837, "$/"
    find_lex $P838, "$past"
    $P839 = $P837."!make"($P838)
.annotate "line", 175
    .return ($P839)
  control_830:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P840, exception, "payload"
    .return ($P840)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<$>"  :subid("53_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_844
.annotate "line", 180
    new $P843, 'ExceptionHandler'
    set_addr $P843, control_842
    $P843."handle_types"(58)
    push_eh $P843
    .lex "self", self
    .lex "$/", param_844
.annotate "line", 181
    new $P845, "Undef"
    .lex "$past", $P845
    get_hll_global $P846, ["PAST"], "Regex"
    find_lex $P847, "$/"
    $P848 = $P846."new"("anchor" :named("pasttype"), "eos" :named("subtype"), $P847 :named("node"))
    store_lex "$past", $P848
.annotate "line", 182
    find_lex $P849, "$/"
    find_lex $P850, "$past"
    $P851 = $P849."!make"($P850)
.annotate "line", 180
    .return ($P851)
  control_842:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P852, exception, "payload"
    .return ($P852)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<$$>"  :subid("54_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_856
.annotate "line", 185
    new $P855, 'ExceptionHandler'
    set_addr $P855, control_854
    $P855."handle_types"(58)
    push_eh $P855
    .lex "self", self
    .lex "$/", param_856
.annotate "line", 186
    new $P857, "Undef"
    .lex "$past", $P857
    get_hll_global $P858, ["PAST"], "Regex"
    find_lex $P859, "$/"
    $P860 = $P858."new"("anchor" :named("pasttype"), "eol" :named("subtype"), $P859 :named("node"))
    store_lex "$past", $P860
.annotate "line", 187
    find_lex $P861, "$/"
    find_lex $P862, "$past"
    $P863 = $P861."!make"($P862)
.annotate "line", 185
    .return ($P863)
  control_854:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P864, exception, "payload"
    .return ($P864)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<:::>"  :subid("55_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_868
.annotate "line", 190
    new $P867, 'ExceptionHandler'
    set_addr $P867, control_866
    $P867."handle_types"(58)
    push_eh $P867
    .lex "self", self
    .lex "$/", param_868
.annotate "line", 191
    new $P869, "Undef"
    .lex "$past", $P869
    get_hll_global $P870, ["PAST"], "Regex"
    find_lex $P871, "$/"
    $P872 = $P870."new"("cut" :named("pasttype"), $P871 :named("node"))
    store_lex "$past", $P872
.annotate "line", 192
    find_lex $P873, "$/"
    find_lex $P874, "$past"
    $P875 = $P873."!make"($P874)
.annotate "line", 190
    .return ($P875)
  control_866:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P876, exception, "payload"
    .return ($P876)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<lwb>"  :subid("56_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_880
.annotate "line", 195
    new $P879, 'ExceptionHandler'
    set_addr $P879, control_878
    $P879."handle_types"(58)
    push_eh $P879
    .lex "self", self
    .lex "$/", param_880
.annotate "line", 196
    new $P881, "Undef"
    .lex "$past", $P881
    get_hll_global $P882, ["PAST"], "Regex"
    find_lex $P883, "$/"
    $P884 = $P882."new"("anchor" :named("pasttype"), "lwb" :named("subtype"), $P883 :named("node"))
    store_lex "$past", $P884
.annotate "line", 197
    find_lex $P885, "$/"
    find_lex $P886, "$past"
    $P887 = $P885."!make"($P886)
.annotate "line", 195
    .return ($P887)
  control_878:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P888, exception, "payload"
    .return ($P888)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<rwb>"  :subid("57_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_892
.annotate "line", 200
    new $P891, 'ExceptionHandler'
    set_addr $P891, control_890
    $P891."handle_types"(58)
    push_eh $P891
    .lex "self", self
    .lex "$/", param_892
.annotate "line", 201
    new $P893, "Undef"
    .lex "$past", $P893
    get_hll_global $P894, ["PAST"], "Regex"
    find_lex $P895, "$/"
    $P896 = $P894."new"("anchor" :named("pasttype"), "rwb" :named("subtype"), $P895 :named("node"))
    store_lex "$past", $P896
.annotate "line", 202
    find_lex $P897, "$/"
    find_lex $P898, "$past"
    $P899 = $P897."!make"($P898)
.annotate "line", 200
    .return ($P899)
  control_890:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P900, exception, "payload"
    .return ($P900)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<bs>"  :subid("58_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_904
.annotate "line", 205
    new $P903, 'ExceptionHandler'
    set_addr $P903, control_902
    $P903."handle_types"(58)
    push_eh $P903
    .lex "self", self
    .lex "$/", param_904
.annotate "line", 206
    find_lex $P905, "$/"
    find_lex $P906, "$/"
    unless_null $P906, vivify_227
    $P906 = root_new ['parrot';'Hash']
  vivify_227:
    set $P907, $P906["backslash"]
    unless_null $P907, vivify_228
    new $P907, "Undef"
  vivify_228:
    $P908 = $P907."ast"()
    $P909 = $P905."!make"($P908)
.annotate "line", 205
    .return ($P909)
  control_902:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P910, exception, "payload"
    .return ($P910)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<mod>"  :subid("59_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_914
.annotate "line", 209
    new $P913, 'ExceptionHandler'
    set_addr $P913, control_912
    $P913."handle_types"(58)
    push_eh $P913
    .lex "self", self
    .lex "$/", param_914
.annotate "line", 210
    find_lex $P915, "$/"
    find_lex $P916, "$/"
    unless_null $P916, vivify_229
    $P916 = root_new ['parrot';'Hash']
  vivify_229:
    set $P917, $P916["mod_internal"]
    unless_null $P917, vivify_230
    new $P917, "Undef"
  vivify_230:
    $P918 = $P917."ast"()
    $P919 = $P915."!make"($P918)
.annotate "line", 209
    .return ($P919)
  control_912:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P920, exception, "payload"
    .return ($P920)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<assert>"  :subid("60_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_924
.annotate "line", 213
    new $P923, 'ExceptionHandler'
    set_addr $P923, control_922
    $P923."handle_types"(58)
    push_eh $P923
    .lex "self", self
    .lex "$/", param_924
.annotate "line", 214
    find_lex $P925, "$/"
    find_lex $P926, "$/"
    unless_null $P926, vivify_231
    $P926 = root_new ['parrot';'Hash']
  vivify_231:
    set $P927, $P926["assertion"]
    unless_null $P927, vivify_232
    new $P927, "Undef"
  vivify_232:
    $P928 = $P927."ast"()
    $P929 = $P925."!make"($P928)
.annotate "line", 213
    .return ($P929)
  control_922:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P930, exception, "payload"
    .return ($P930)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<~>"  :subid("61_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_934
.annotate "line", 217
    new $P933, 'ExceptionHandler'
    set_addr $P933, control_932
    $P933."handle_types"(58)
    push_eh $P933
    .lex "self", self
    .lex "$/", param_934
.annotate "line", 218
    find_lex $P935, "$/"
    get_hll_global $P936, ["PAST"], "Regex"
.annotate "line", 219
    find_lex $P937, "$/"
    unless_null $P937, vivify_233
    $P937 = root_new ['parrot';'Hash']
  vivify_233:
    set $P938, $P937["EXPR"]
    unless_null $P938, vivify_234
    new $P938, "Undef"
  vivify_234:
    $P939 = $P938."ast"()
.annotate "line", 220
    get_hll_global $P940, ["PAST"], "Regex"
.annotate "line", 221
    find_lex $P941, "$/"
    unless_null $P941, vivify_235
    $P941 = root_new ['parrot';'Hash']
  vivify_235:
    set $P942, $P941["GOAL"]
    unless_null $P942, vivify_236
    new $P942, "Undef"
  vivify_236:
    $P943 = $P942."ast"()
.annotate "line", 222
    get_hll_global $P944, ["PAST"], "Regex"
    find_lex $P945, "$/"
    unless_null $P945, vivify_237
    $P945 = root_new ['parrot';'Hash']
  vivify_237:
    set $P946, $P945["GOAL"]
    unless_null $P946, vivify_238
    new $P946, "Undef"
  vivify_238:
    set $S947, $P946
    $P948 = $P944."new"("FAILGOAL", $S947, "subrule" :named("pasttype"), "method" :named("subtype"))
    $P949 = $P940."new"($P943, $P948, "alt" :named("pasttype"))
.annotate "line", 220
    $P950 = $P936."new"($P939, $P949, "concat" :named("pasttype"))
.annotate "line", 218
    $P951 = $P935."!make"($P950)
.annotate "line", 217
    .return ($P951)
  control_932:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P952, exception, "payload"
    .return ($P952)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<{*}>"  :subid("62_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_956
.annotate "line", 230
    new $P955, 'ExceptionHandler'
    set_addr $P955, control_954
    $P955."handle_types"(58)
    push_eh $P955
    .lex "self", self
    .lex "$/", param_956
.annotate "line", 231
    new $P957, "Undef"
    .lex "$past", $P957
.annotate "line", 232
    find_lex $P960, "$/"
    unless_null $P960, vivify_239
    $P960 = root_new ['parrot';'Hash']
  vivify_239:
    set $P961, $P960["key"]
    unless_null $P961, vivify_240
    new $P961, "Undef"
  vivify_240:
    if $P961, if_959
    new $P969, "Integer"
    assign $P969, 0
    set $P958, $P969
    goto if_959_end
  if_959:
    get_hll_global $P962, ["PAST"], "Regex"
    find_lex $P963, "$/"
    unless_null $P963, vivify_241
    $P963 = root_new ['parrot';'Hash']
  vivify_241:
    set $P964, $P963["key"]
    unless_null $P964, vivify_242
    $P964 = root_new ['parrot';'ResizablePMCArray']
  vivify_242:
    set $P965, $P964[0]
    unless_null $P965, vivify_243
    new $P965, "Undef"
  vivify_243:
    set $S966, $P965
    find_lex $P967, "$/"
    $P968 = $P962."new"($S966, "reduce" :named("pasttype"), $P967 :named("node"))
    set $P958, $P968
  if_959_end:
    store_lex "$past", $P958
.annotate "line", 234
    find_lex $P970, "$/"
    find_lex $P971, "$past"
    $P972 = $P970."!make"($P971)
.annotate "line", 230
    .return ($P972)
  control_954:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P973, exception, "payload"
    .return ($P973)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<var>"  :subid("63_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_977
.annotate "line", 237
    new $P976, 'ExceptionHandler'
    set_addr $P976, control_975
    $P976."handle_types"(58)
    push_eh $P976
    .lex "self", self
    .lex "$/", param_977
.annotate "line", 238
    new $P978, "Undef"
    .lex "$past", $P978
.annotate "line", 239
    new $P979, "Undef"
    .lex "$name", $P979
.annotate "line", 237
    find_lex $P980, "$past"
.annotate "line", 239
    find_lex $P983, "$/"
    unless_null $P983, vivify_244
    $P983 = root_new ['parrot';'Hash']
  vivify_244:
    set $P984, $P983["pos"]
    unless_null $P984, vivify_245
    new $P984, "Undef"
  vivify_245:
    if $P984, if_982
    find_lex $P988, "$/"
    unless_null $P988, vivify_246
    $P988 = root_new ['parrot';'Hash']
  vivify_246:
    set $P989, $P988["name"]
    unless_null $P989, vivify_247
    new $P989, "Undef"
  vivify_247:
    set $S990, $P989
    new $P981, 'String'
    set $P981, $S990
    goto if_982_end
  if_982:
    find_lex $P985, "$/"
    unless_null $P985, vivify_248
    $P985 = root_new ['parrot';'Hash']
  vivify_248:
    set $P986, $P985["pos"]
    unless_null $P986, vivify_249
    new $P986, "Undef"
  vivify_249:
    set $N987, $P986
    new $P981, 'Float'
    set $P981, $N987
  if_982_end:
    store_lex "$name", $P981
.annotate "line", 240
    find_lex $P992, "$/"
    unless_null $P992, vivify_250
    $P992 = root_new ['parrot';'Hash']
  vivify_250:
    set $P993, $P992["quantified_atom"]
    unless_null $P993, vivify_251
    new $P993, "Undef"
  vivify_251:
    if $P993, if_991
.annotate "line", 251
    get_hll_global $P1022, ["PAST"], "Regex"
    find_lex $P1023, "$name"
    find_lex $P1024, "$/"
    $P1025 = $P1022."new"("!BACKREF", $P1023, "subrule" :named("pasttype"), "method" :named("subtype"), $P1024 :named("node"))
    store_lex "$past", $P1025
.annotate "line", 250
    goto if_991_end
  if_991:
.annotate "line", 241
    find_lex $P994, "$/"
    unless_null $P994, vivify_252
    $P994 = root_new ['parrot';'Hash']
  vivify_252:
    set $P995, $P994["quantified_atom"]
    unless_null $P995, vivify_253
    $P995 = root_new ['parrot';'ResizablePMCArray']
  vivify_253:
    set $P996, $P995[0]
    unless_null $P996, vivify_254
    new $P996, "Undef"
  vivify_254:
    $P997 = $P996."ast"()
    store_lex "$past", $P997
.annotate "line", 242
    find_lex $P1001, "$past"
    $S1002 = $P1001."pasttype"()
    iseq $I1003, $S1002, "quant"
    if $I1003, if_1000
    new $P999, 'Integer'
    set $P999, $I1003
    goto if_1000_end
  if_1000:
    find_lex $P1004, "$past"
    unless_null $P1004, vivify_255
    $P1004 = root_new ['parrot';'ResizablePMCArray']
  vivify_255:
    set $P1005, $P1004[0]
    unless_null $P1005, vivify_256
    new $P1005, "Undef"
  vivify_256:
    $S1006 = $P1005."pasttype"()
    iseq $I1007, $S1006, "subrule"
    new $P999, 'Integer'
    set $P999, $I1007
  if_1000_end:
    if $P999, if_998
.annotate "line", 245
    find_lex $P1012, "$past"
    $S1013 = $P1012."pasttype"()
    iseq $I1014, $S1013, "subrule"
    if $I1014, if_1011
.annotate "line", 247
    get_hll_global $P1017, ["PAST"], "Regex"
    find_lex $P1018, "$past"
    find_lex $P1019, "$name"
    find_lex $P1020, "$/"
    $P1021 = $P1017."new"($P1018, $P1019 :named("name"), "subcapture" :named("pasttype"), $P1020 :named("node"))
    store_lex "$past", $P1021
.annotate "line", 246
    goto if_1011_end
  if_1011:
.annotate "line", 245
    find_lex $P1015, "$past"
    find_lex $P1016, "$name"
    "subrule_alias"($P1015, $P1016)
  if_1011_end:
    goto if_998_end
  if_998:
.annotate "line", 243
    find_lex $P1008, "$past"
    unless_null $P1008, vivify_257
    $P1008 = root_new ['parrot';'ResizablePMCArray']
  vivify_257:
    set $P1009, $P1008[0]
    unless_null $P1009, vivify_258
    new $P1009, "Undef"
  vivify_258:
    find_lex $P1010, "$name"
    "subrule_alias"($P1009, $P1010)
  if_998_end:
  if_991_end:
.annotate "line", 254
    find_lex $P1026, "$/"
    find_lex $P1027, "$past"
    $P1028 = $P1026."!make"($P1027)
.annotate "line", 237
    .return ($P1028)
  control_975:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1029, exception, "payload"
    .return ($P1029)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<PIR>"  :subid("64_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_1033
.annotate "line", 257
    new $P1032, 'ExceptionHandler'
    set_addr $P1032, control_1031
    $P1032."handle_types"(58)
    push_eh $P1032
    .lex "self", self
    .lex "$/", param_1033
.annotate "line", 258
    find_lex $P1034, "$/"
    get_hll_global $P1035, ["PAST"], "Regex"
.annotate "line", 259
    get_hll_global $P1036, ["PAST"], "Op"
    find_lex $P1037, "$/"
    unless_null $P1037, vivify_259
    $P1037 = root_new ['parrot';'Hash']
  vivify_259:
    set $P1038, $P1037["pir"]
    unless_null $P1038, vivify_260
    new $P1038, "Undef"
  vivify_260:
    set $S1039, $P1038
    $P1040 = $P1036."new"($S1039 :named("inline"), "inline" :named("pasttype"))
    find_lex $P1041, "$/"
    $P1042 = $P1035."new"($P1040, "pastnode" :named("pasttype"), $P1041 :named("node"))
.annotate "line", 258
    $P1043 = $P1034."!make"($P1042)
.annotate "line", 257
    .return ($P1043)
  control_1031:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1044, exception, "payload"
    .return ($P1044)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<w>"  :subid("65_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_1048
.annotate "line", 265
    new $P1047, 'ExceptionHandler'
    set_addr $P1047, control_1046
    $P1047."handle_types"(58)
    push_eh $P1047
    .lex "self", self
    .lex "$/", param_1048
.annotate "line", 266
    new $P1049, "Undef"
    .lex "$subtype", $P1049
.annotate "line", 267
    new $P1050, "Undef"
    .lex "$past", $P1050
.annotate "line", 266
    find_lex $P1053, "$/"
    unless_null $P1053, vivify_261
    $P1053 = root_new ['parrot';'Hash']
  vivify_261:
    set $P1054, $P1053["sym"]
    unless_null $P1054, vivify_262
    new $P1054, "Undef"
  vivify_262:
    set $S1055, $P1054
    iseq $I1056, $S1055, "n"
    if $I1056, if_1052
    find_lex $P1058, "$/"
    unless_null $P1058, vivify_263
    $P1058 = root_new ['parrot';'Hash']
  vivify_263:
    set $P1059, $P1058["sym"]
    unless_null $P1059, vivify_264
    new $P1059, "Undef"
  vivify_264:
    set $S1060, $P1059
    new $P1051, 'String'
    set $P1051, $S1060
    goto if_1052_end
  if_1052:
    new $P1057, "String"
    assign $P1057, "nl"
    set $P1051, $P1057
  if_1052_end:
    store_lex "$subtype", $P1051
.annotate "line", 267
    get_hll_global $P1061, ["PAST"], "Regex"
    find_lex $P1062, "$subtype"
    find_lex $P1063, "$/"
    $P1064 = $P1061."new"("charclass" :named("pasttype"), $P1062 :named("subtype"), $P1063 :named("node"))
    store_lex "$past", $P1064
.annotate "line", 268
    find_lex $P1065, "$/"
    find_lex $P1066, "$past"
    $P1067 = $P1065."!make"($P1066)
.annotate "line", 265
    .return ($P1067)
  control_1046:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1068, exception, "payload"
    .return ($P1068)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<b>"  :subid("66_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_1072
.annotate "line", 271
    new $P1071, 'ExceptionHandler'
    set_addr $P1071, control_1070
    $P1071."handle_types"(58)
    push_eh $P1071
    .lex "self", self
    .lex "$/", param_1072
.annotate "line", 272
    new $P1073, "Undef"
    .lex "$past", $P1073
    get_hll_global $P1074, ["PAST"], "Regex"
.annotate "line", 273
    find_lex $P1075, "$/"
    unless_null $P1075, vivify_265
    $P1075 = root_new ['parrot';'Hash']
  vivify_265:
    set $P1076, $P1075["sym"]
    unless_null $P1076, vivify_266
    new $P1076, "Undef"
  vivify_266:
    set $S1077, $P1076
    iseq $I1078, $S1077, "B"
    find_lex $P1079, "$/"
    $P1080 = $P1074."new"("\b", "enumcharlist" :named("pasttype"), $I1078 :named("negate"), $P1079 :named("node"))
.annotate "line", 272
    store_lex "$past", $P1080
.annotate "line", 274
    find_lex $P1081, "$/"
    find_lex $P1082, "$past"
    $P1083 = $P1081."!make"($P1082)
.annotate "line", 271
    .return ($P1083)
  control_1070:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1084, exception, "payload"
    .return ($P1084)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<e>"  :subid("67_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_1088
.annotate "line", 277
    new $P1087, 'ExceptionHandler'
    set_addr $P1087, control_1086
    $P1087."handle_types"(58)
    push_eh $P1087
    .lex "self", self
    .lex "$/", param_1088
.annotate "line", 278
    new $P1089, "Undef"
    .lex "$past", $P1089
    get_hll_global $P1090, ["PAST"], "Regex"
.annotate "line", 279
    find_lex $P1091, "$/"
    unless_null $P1091, vivify_267
    $P1091 = root_new ['parrot';'Hash']
  vivify_267:
    set $P1092, $P1091["sym"]
    unless_null $P1092, vivify_268
    new $P1092, "Undef"
  vivify_268:
    set $S1093, $P1092
    iseq $I1094, $S1093, "E"
    find_lex $P1095, "$/"
    $P1096 = $P1090."new"("\\e", "enumcharlist" :named("pasttype"), $I1094 :named("negate"), $P1095 :named("node"))
.annotate "line", 278
    store_lex "$past", $P1096
.annotate "line", 280
    find_lex $P1097, "$/"
    find_lex $P1098, "$past"
    $P1099 = $P1097."!make"($P1098)
.annotate "line", 277
    .return ($P1099)
  control_1086:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1100, exception, "payload"
    .return ($P1100)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<f>"  :subid("68_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_1104
.annotate "line", 283
    new $P1103, 'ExceptionHandler'
    set_addr $P1103, control_1102
    $P1103."handle_types"(58)
    push_eh $P1103
    .lex "self", self
    .lex "$/", param_1104
.annotate "line", 284
    new $P1105, "Undef"
    .lex "$past", $P1105
    get_hll_global $P1106, ["PAST"], "Regex"
.annotate "line", 285
    find_lex $P1107, "$/"
    unless_null $P1107, vivify_269
    $P1107 = root_new ['parrot';'Hash']
  vivify_269:
    set $P1108, $P1107["sym"]
    unless_null $P1108, vivify_270
    new $P1108, "Undef"
  vivify_270:
    set $S1109, $P1108
    iseq $I1110, $S1109, "F"
    find_lex $P1111, "$/"
    $P1112 = $P1106."new"("\\f", "enumcharlist" :named("pasttype"), $I1110 :named("negate"), $P1111 :named("node"))
.annotate "line", 284
    store_lex "$past", $P1112
.annotate "line", 286
    find_lex $P1113, "$/"
    find_lex $P1114, "$past"
    $P1115 = $P1113."!make"($P1114)
.annotate "line", 283
    .return ($P1115)
  control_1102:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1116, exception, "payload"
    .return ($P1116)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<h>"  :subid("69_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_1120
.annotate "line", 289
    new $P1119, 'ExceptionHandler'
    set_addr $P1119, control_1118
    $P1119."handle_types"(58)
    push_eh $P1119
    .lex "self", self
    .lex "$/", param_1120
.annotate "line", 290
    new $P1121, "Undef"
    .lex "$past", $P1121
    get_hll_global $P1122, ["PAST"], "Regex"
.annotate "line", 291
    find_lex $P1123, "$/"
    unless_null $P1123, vivify_271
    $P1123 = root_new ['parrot';'Hash']
  vivify_271:
    set $P1124, $P1123["sym"]
    unless_null $P1124, vivify_272
    new $P1124, "Undef"
  vivify_272:
    set $S1125, $P1124
    iseq $I1126, $S1125, "H"
    find_lex $P1127, "$/"
    $P1128 = $P1122."new"(unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", "enumcharlist" :named("pasttype"), $I1126 :named("negate"), $P1127 :named("node"))
.annotate "line", 290
    store_lex "$past", $P1128
.annotate "line", 292
    find_lex $P1129, "$/"
    find_lex $P1130, "$past"
    $P1131 = $P1129."!make"($P1130)
.annotate "line", 289
    .return ($P1131)
  control_1118:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1132, exception, "payload"
    .return ($P1132)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<r>"  :subid("70_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_1136
.annotate "line", 295
    new $P1135, 'ExceptionHandler'
    set_addr $P1135, control_1134
    $P1135."handle_types"(58)
    push_eh $P1135
    .lex "self", self
    .lex "$/", param_1136
.annotate "line", 296
    new $P1137, "Undef"
    .lex "$past", $P1137
    get_hll_global $P1138, ["PAST"], "Regex"
.annotate "line", 297
    find_lex $P1139, "$/"
    unless_null $P1139, vivify_273
    $P1139 = root_new ['parrot';'Hash']
  vivify_273:
    set $P1140, $P1139["sym"]
    unless_null $P1140, vivify_274
    new $P1140, "Undef"
  vivify_274:
    set $S1141, $P1140
    iseq $I1142, $S1141, "R"
    find_lex $P1143, "$/"
    $P1144 = $P1138."new"("\r", "enumcharlist" :named("pasttype"), $I1142 :named("negate"), $P1143 :named("node"))
.annotate "line", 296
    store_lex "$past", $P1144
.annotate "line", 298
    find_lex $P1145, "$/"
    find_lex $P1146, "$past"
    $P1147 = $P1145."!make"($P1146)
.annotate "line", 295
    .return ($P1147)
  control_1134:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1148, exception, "payload"
    .return ($P1148)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<t>"  :subid("71_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_1152
.annotate "line", 301
    new $P1151, 'ExceptionHandler'
    set_addr $P1151, control_1150
    $P1151."handle_types"(58)
    push_eh $P1151
    .lex "self", self
    .lex "$/", param_1152
.annotate "line", 302
    new $P1153, "Undef"
    .lex "$past", $P1153
    get_hll_global $P1154, ["PAST"], "Regex"
.annotate "line", 303
    find_lex $P1155, "$/"
    unless_null $P1155, vivify_275
    $P1155 = root_new ['parrot';'Hash']
  vivify_275:
    set $P1156, $P1155["sym"]
    unless_null $P1156, vivify_276
    new $P1156, "Undef"
  vivify_276:
    set $S1157, $P1156
    iseq $I1158, $S1157, "T"
    find_lex $P1159, "$/"
    $P1160 = $P1154."new"("\t", "enumcharlist" :named("pasttype"), $I1158 :named("negate"), $P1159 :named("node"))
.annotate "line", 302
    store_lex "$past", $P1160
.annotate "line", 304
    find_lex $P1161, "$/"
    find_lex $P1162, "$past"
    $P1163 = $P1161."!make"($P1162)
.annotate "line", 301
    .return ($P1163)
  control_1150:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1164, exception, "payload"
    .return ($P1164)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<v>"  :subid("72_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_1168
.annotate "line", 307
    new $P1167, 'ExceptionHandler'
    set_addr $P1167, control_1166
    $P1167."handle_types"(58)
    push_eh $P1167
    .lex "self", self
    .lex "$/", param_1168
.annotate "line", 308
    new $P1169, "Undef"
    .lex "$past", $P1169
    get_hll_global $P1170, ["PAST"], "Regex"
.annotate "line", 310
    find_lex $P1171, "$/"
    unless_null $P1171, vivify_277
    $P1171 = root_new ['parrot';'Hash']
  vivify_277:
    set $P1172, $P1171["sym"]
    unless_null $P1172, vivify_278
    new $P1172, "Undef"
  vivify_278:
    set $S1173, $P1172
    iseq $I1174, $S1173, "V"
    find_lex $P1175, "$/"
    $P1176 = $P1170."new"(unicode:"\n\x{b}\f\r\x{85}\u2028\u2029", "enumcharlist" :named("pasttype"), $I1174 :named("negate"), $P1175 :named("node"))
.annotate "line", 308
    store_lex "$past", $P1176
.annotate "line", 311
    find_lex $P1177, "$/"
    find_lex $P1178, "$past"
    $P1179 = $P1177."!make"($P1178)
.annotate "line", 307
    .return ($P1179)
  control_1166:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1180, exception, "payload"
    .return ($P1180)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<o>"  :subid("73_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_1184
.annotate "line", 314
    new $P1183, 'ExceptionHandler'
    set_addr $P1183, control_1182
    $P1183."handle_types"(58)
    push_eh $P1183
    .lex "self", self
    .lex "$/", param_1184
.annotate "line", 315
    new $P1185, "Undef"
    .lex "$octlit", $P1185
.annotate "line", 316
    get_hll_global $P1186, ["HLL";"Actions"], "ints_to_string"
    find_lex $P1189, "$/"
    unless_null $P1189, vivify_279
    $P1189 = root_new ['parrot';'Hash']
  vivify_279:
    set $P1190, $P1189["octint"]
    unless_null $P1190, vivify_280
    new $P1190, "Undef"
  vivify_280:
    unless $P1190, unless_1188
    set $P1187, $P1190
    goto unless_1188_end
  unless_1188:
    find_lex $P1191, "$/"
    unless_null $P1191, vivify_281
    $P1191 = root_new ['parrot';'Hash']
  vivify_281:
    set $P1192, $P1191["octints"]
    unless_null $P1192, vivify_282
    $P1192 = root_new ['parrot';'Hash']
  vivify_282:
    set $P1193, $P1192["octint"]
    unless_null $P1193, vivify_283
    new $P1193, "Undef"
  vivify_283:
    set $P1187, $P1193
  unless_1188_end:
    $P1194 = $P1186($P1187)
    store_lex "$octlit", $P1194
.annotate "line", 317
    find_lex $P1195, "$/"
    find_lex $P1198, "$/"
    unless_null $P1198, vivify_284
    $P1198 = root_new ['parrot';'Hash']
  vivify_284:
    set $P1199, $P1198["sym"]
    unless_null $P1199, vivify_285
    new $P1199, "Undef"
  vivify_285:
    set $S1200, $P1199
    iseq $I1201, $S1200, "O"
    if $I1201, if_1197
.annotate "line", 320
    get_hll_global $P1206, ["PAST"], "Regex"
    find_lex $P1207, "$octlit"
    find_lex $P1208, "$/"
    $P1209 = $P1206."new"($P1207, "literal" :named("pasttype"), $P1208 :named("node"))
    set $P1196, $P1209
.annotate "line", 317
    goto if_1197_end
  if_1197:
.annotate "line", 318
    get_hll_global $P1202, ["PAST"], "Regex"
    find_lex $P1203, "$octlit"
    find_lex $P1204, "$/"
    $P1205 = $P1202."new"($P1203, "enumcharlist" :named("pasttype"), 1 :named("negate"), $P1204 :named("node"))
    set $P1196, $P1205
  if_1197_end:
    $P1210 = $P1195."!make"($P1196)
.annotate "line", 314
    .return ($P1210)
  control_1182:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1211, exception, "payload"
    .return ($P1211)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<x>"  :subid("74_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_1215
.annotate "line", 323
    new $P1214, 'ExceptionHandler'
    set_addr $P1214, control_1213
    $P1214."handle_types"(58)
    push_eh $P1214
    .lex "self", self
    .lex "$/", param_1215
.annotate "line", 324
    new $P1216, "Undef"
    .lex "$hexlit", $P1216
.annotate "line", 325
    get_hll_global $P1217, ["HLL";"Actions"], "ints_to_string"
    find_lex $P1220, "$/"
    unless_null $P1220, vivify_286
    $P1220 = root_new ['parrot';'Hash']
  vivify_286:
    set $P1221, $P1220["hexint"]
    unless_null $P1221, vivify_287
    new $P1221, "Undef"
  vivify_287:
    unless $P1221, unless_1219
    set $P1218, $P1221
    goto unless_1219_end
  unless_1219:
    find_lex $P1222, "$/"
    unless_null $P1222, vivify_288
    $P1222 = root_new ['parrot';'Hash']
  vivify_288:
    set $P1223, $P1222["hexints"]
    unless_null $P1223, vivify_289
    $P1223 = root_new ['parrot';'Hash']
  vivify_289:
    set $P1224, $P1223["hexint"]
    unless_null $P1224, vivify_290
    new $P1224, "Undef"
  vivify_290:
    set $P1218, $P1224
  unless_1219_end:
    $P1225 = $P1217($P1218)
    store_lex "$hexlit", $P1225
.annotate "line", 326
    find_lex $P1226, "$/"
    find_lex $P1229, "$/"
    unless_null $P1229, vivify_291
    $P1229 = root_new ['parrot';'Hash']
  vivify_291:
    set $P1230, $P1229["sym"]
    unless_null $P1230, vivify_292
    new $P1230, "Undef"
  vivify_292:
    set $S1231, $P1230
    iseq $I1232, $S1231, "X"
    if $I1232, if_1228
.annotate "line", 329
    get_hll_global $P1237, ["PAST"], "Regex"
    find_lex $P1238, "$hexlit"
    find_lex $P1239, "$/"
    $P1240 = $P1237."new"($P1238, "literal" :named("pasttype"), $P1239 :named("node"))
    set $P1227, $P1240
.annotate "line", 326
    goto if_1228_end
  if_1228:
.annotate "line", 327
    get_hll_global $P1233, ["PAST"], "Regex"
    find_lex $P1234, "$hexlit"
    find_lex $P1235, "$/"
    $P1236 = $P1233."new"($P1234, "enumcharlist" :named("pasttype"), 1 :named("negate"), $P1235 :named("node"))
    set $P1227, $P1236
  if_1228_end:
    $P1241 = $P1226."!make"($P1227)
.annotate "line", 323
    .return ($P1241)
  control_1213:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1242, exception, "payload"
    .return ($P1242)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<c>"  :subid("75_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_1246
.annotate "line", 332
    new $P1245, 'ExceptionHandler'
    set_addr $P1245, control_1244
    $P1245."handle_types"(58)
    push_eh $P1245
    .lex "self", self
    .lex "$/", param_1246
.annotate "line", 333
    find_lex $P1247, "$/"
    get_hll_global $P1248, ["PAST"], "Regex"
    find_lex $P1249, "$/"
    unless_null $P1249, vivify_293
    $P1249 = root_new ['parrot';'Hash']
  vivify_293:
    set $P1250, $P1249["charspec"]
    unless_null $P1250, vivify_294
    new $P1250, "Undef"
  vivify_294:
    $P1251 = $P1250."ast"()
    find_lex $P1252, "$/"
    $P1253 = $P1248."new"($P1251, "literal" :named("pasttype"), $P1252 :named("node"))
    $P1254 = $P1247."!make"($P1253)
.annotate "line", 332
    .return ($P1254)
  control_1244:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1255, exception, "payload"
    .return ($P1255)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<misc>"  :subid("76_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_1259
.annotate "line", 336
    new $P1258, 'ExceptionHandler'
    set_addr $P1258, control_1257
    $P1258."handle_types"(58)
    push_eh $P1258
    .lex "self", self
    .lex "$/", param_1259
.annotate "line", 337
    new $P1260, "Undef"
    .lex "$past", $P1260
    get_hll_global $P1261, ["PAST"], "Regex"
    find_lex $P1262, "$/"
    set $S1263, $P1262
    find_lex $P1264, "$/"
    $P1265 = $P1261."new"($S1263, "literal" :named("pasttype"), $P1264 :named("node"))
    store_lex "$past", $P1265
.annotate "line", 338
    find_lex $P1266, "$/"
    find_lex $P1267, "$past"
    $P1268 = $P1266."!make"($P1267)
.annotate "line", 336
    .return ($P1268)
  control_1257:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1269, exception, "payload"
    .return ($P1269)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<?>"  :subid("77_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_1273
.annotate "line", 342
    new $P1272, 'ExceptionHandler'
    set_addr $P1272, control_1271
    $P1272."handle_types"(58)
    push_eh $P1272
    .lex "self", self
    .lex "$/", param_1273
.annotate "line", 343
    new $P1274, "Undef"
    .lex "$past", $P1274
.annotate "line", 342
    find_lex $P1275, "$past"
.annotate "line", 344
    find_lex $P1277, "$/"
    unless_null $P1277, vivify_295
    $P1277 = root_new ['parrot';'Hash']
  vivify_295:
    set $P1278, $P1277["assertion"]
    unless_null $P1278, vivify_296
    new $P1278, "Undef"
  vivify_296:
    if $P1278, if_1276
.annotate "line", 348
    new $P1283, "Integer"
    assign $P1283, 0
    store_lex "$past", $P1283
    goto if_1276_end
  if_1276:
.annotate "line", 345
    find_lex $P1279, "$/"
    unless_null $P1279, vivify_297
    $P1279 = root_new ['parrot';'Hash']
  vivify_297:
    set $P1280, $P1279["assertion"]
    unless_null $P1280, vivify_298
    new $P1280, "Undef"
  vivify_298:
    $P1281 = $P1280."ast"()
    store_lex "$past", $P1281
.annotate "line", 346
    find_lex $P1282, "$past"
    $P1282."subtype"("zerowidth")
  if_1276_end:
.annotate "line", 349
    find_lex $P1284, "$/"
    find_lex $P1285, "$past"
    $P1286 = $P1284."!make"($P1285)
.annotate "line", 342
    .return ($P1286)
  control_1271:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1287, exception, "payload"
    .return ($P1287)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<!>"  :subid("78_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_1291
.annotate "line", 352
    new $P1290, 'ExceptionHandler'
    set_addr $P1290, control_1289
    $P1290."handle_types"(58)
    push_eh $P1290
    .lex "self", self
    .lex "$/", param_1291
.annotate "line", 353
    new $P1292, "Undef"
    .lex "$past", $P1292
.annotate "line", 352
    find_lex $P1293, "$past"
.annotate "line", 354
    find_lex $P1295, "$/"
    unless_null $P1295, vivify_299
    $P1295 = root_new ['parrot';'Hash']
  vivify_299:
    set $P1296, $P1295["assertion"]
    unless_null $P1296, vivify_300
    new $P1296, "Undef"
  vivify_300:
    if $P1296, if_1294
.annotate "line", 360
    get_hll_global $P1305, ["PAST"], "Regex"
    find_lex $P1306, "$/"
    $P1307 = $P1305."new"("anchor" :named("pasttype"), "fail" :named("subtype"), $P1306 :named("node"))
    store_lex "$past", $P1307
.annotate "line", 359
    goto if_1294_end
  if_1294:
.annotate "line", 355
    find_lex $P1297, "$/"
    unless_null $P1297, vivify_301
    $P1297 = root_new ['parrot';'Hash']
  vivify_301:
    set $P1298, $P1297["assertion"]
    unless_null $P1298, vivify_302
    new $P1298, "Undef"
  vivify_302:
    $P1299 = $P1298."ast"()
    store_lex "$past", $P1299
.annotate "line", 356
    find_lex $P1300, "$past"
    find_lex $P1301, "$past"
    $P1302 = $P1301."negate"()
    isfalse $I1303, $P1302
    $P1300."negate"($I1303)
.annotate "line", 357
    find_lex $P1304, "$past"
    $P1304."subtype"("zerowidth")
  if_1294_end:
.annotate "line", 362
    find_lex $P1308, "$/"
    find_lex $P1309, "$past"
    $P1310 = $P1308."!make"($P1309)
.annotate "line", 352
    .return ($P1310)
  control_1289:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1311, exception, "payload"
    .return ($P1311)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<method>"  :subid("79_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_1315
.annotate "line", 365
    new $P1314, 'ExceptionHandler'
    set_addr $P1314, control_1313
    $P1314."handle_types"(58)
    push_eh $P1314
    .lex "self", self
    .lex "$/", param_1315
.annotate "line", 366
    new $P1316, "Undef"
    .lex "$past", $P1316
    find_lex $P1317, "$/"
    unless_null $P1317, vivify_303
    $P1317 = root_new ['parrot';'Hash']
  vivify_303:
    set $P1318, $P1317["assertion"]
    unless_null $P1318, vivify_304
    new $P1318, "Undef"
  vivify_304:
    $P1319 = $P1318."ast"()
    store_lex "$past", $P1319
.annotate "line", 367
    find_lex $P1320, "$past"
    $P1320."subtype"("method")
.annotate "line", 368
    find_lex $P1321, "$past"
    $P1321."name"("")
.annotate "line", 369
    find_lex $P1322, "$/"
    find_lex $P1323, "$past"
    $P1324 = $P1322."!make"($P1323)
.annotate "line", 365
    .return ($P1324)
  control_1313:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1325, exception, "payload"
    .return ($P1325)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<name>"  :subid("80_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_1329
.annotate "line", 372
    .const 'Sub' $P1387 = "82_1267204695.47543" 
    capture_lex $P1387
    .const 'Sub' $P1351 = "81_1267204695.47543" 
    capture_lex $P1351
    new $P1328, 'ExceptionHandler'
    set_addr $P1328, control_1327
    $P1328."handle_types"(58)
    push_eh $P1328
    .lex "self", self
    .lex "$/", param_1329
.annotate "line", 373
    new $P1330, "Undef"
    .lex "$name", $P1330
.annotate "line", 374
    new $P1331, "Undef"
    .lex "$past", $P1331
.annotate "line", 373
    find_lex $P1332, "$/"
    unless_null $P1332, vivify_305
    $P1332 = root_new ['parrot';'Hash']
  vivify_305:
    set $P1333, $P1332["longname"]
    unless_null $P1333, vivify_306
    new $P1333, "Undef"
  vivify_306:
    set $S1334, $P1333
    new $P1335, 'String'
    set $P1335, $S1334
    store_lex "$name", $P1335
    find_lex $P1336, "$past"
.annotate "line", 375
    find_lex $P1338, "$/"
    unless_null $P1338, vivify_307
    $P1338 = root_new ['parrot';'Hash']
  vivify_307:
    set $P1339, $P1338["assertion"]
    unless_null $P1339, vivify_308
    new $P1339, "Undef"
  vivify_308:
    if $P1339, if_1337
.annotate "line", 379
    find_lex $P1347, "$name"
    set $S1348, $P1347
    iseq $I1349, $S1348, "sym"
    if $I1349, if_1346
.annotate "line", 395
    get_hll_global $P1361, ["PAST"], "Regex"
    find_lex $P1362, "$name"
    find_lex $P1363, "$name"
    find_lex $P1364, "$/"
    $P1365 = $P1361."new"($P1362, $P1363 :named("name"), "subrule" :named("pasttype"), "capture" :named("subtype"), $P1364 :named("node"))
    store_lex "$past", $P1365
.annotate "line", 397
    find_lex $P1367, "$/"
    unless_null $P1367, vivify_309
    $P1367 = root_new ['parrot';'Hash']
  vivify_309:
    set $P1368, $P1367["nibbler"]
    unless_null $P1368, vivify_310
    new $P1368, "Undef"
  vivify_310:
    if $P1368, if_1366
.annotate "line", 400
    find_lex $P1376, "$/"
    unless_null $P1376, vivify_311
    $P1376 = root_new ['parrot';'Hash']
  vivify_311:
    set $P1377, $P1376["arglist"]
    unless_null $P1377, vivify_312
    new $P1377, "Undef"
  vivify_312:
    unless $P1377, if_1375_end
.annotate "line", 401
    find_lex $P1379, "$/"
    unless_null $P1379, vivify_313
    $P1379 = root_new ['parrot';'Hash']
  vivify_313:
    set $P1380, $P1379["arglist"]
    unless_null $P1380, vivify_314
    $P1380 = root_new ['parrot';'ResizablePMCArray']
  vivify_314:
    set $P1381, $P1380[0]
    unless_null $P1381, vivify_315
    new $P1381, "Undef"
  vivify_315:
    $P1382 = $P1381."ast"()
    $P1383 = $P1382."list"()
    defined $I1384, $P1383
    unless $I1384, for_undef_316
    iter $P1378, $P1383
    new $P1393, 'ExceptionHandler'
    set_addr $P1393, loop1392_handler
    $P1393."handle_types"(65, 67, 66)
    push_eh $P1393
  loop1392_test:
    unless $P1378, loop1392_done
    shift $P1385, $P1378
  loop1392_redo:
    .const 'Sub' $P1387 = "82_1267204695.47543" 
    capture_lex $P1387
    $P1387($P1385)
  loop1392_next:
    goto loop1392_test
  loop1392_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1394, exception, 'type'
    eq $P1394, 65, loop1392_next
    eq $P1394, 67, loop1392_redo
  loop1392_done:
    pop_eh 
  for_undef_316:
  if_1375_end:
.annotate "line", 400
    goto if_1366_end
  if_1366:
.annotate "line", 398
    find_lex $P1369, "$past"
    find_lex $P1370, "$/"
    unless_null $P1370, vivify_317
    $P1370 = root_new ['parrot';'Hash']
  vivify_317:
    set $P1371, $P1370["nibbler"]
    unless_null $P1371, vivify_318
    $P1371 = root_new ['parrot';'ResizablePMCArray']
  vivify_318:
    set $P1372, $P1371[0]
    unless_null $P1372, vivify_319
    new $P1372, "Undef"
  vivify_319:
    $P1373 = $P1372."ast"()
    $P1374 = "buildsub"($P1373)
    $P1369."push"($P1374)
  if_1366_end:
.annotate "line", 394
    goto if_1346_end
  if_1346:
.annotate "line", 379
    .const 'Sub' $P1351 = "81_1267204695.47543" 
    capture_lex $P1351
    $P1351()
  if_1346_end:
    goto if_1337_end
  if_1337:
.annotate "line", 376
    find_lex $P1340, "$/"
    unless_null $P1340, vivify_320
    $P1340 = root_new ['parrot';'Hash']
  vivify_320:
    set $P1341, $P1340["assertion"]
    unless_null $P1341, vivify_321
    $P1341 = root_new ['parrot';'ResizablePMCArray']
  vivify_321:
    set $P1342, $P1341[0]
    unless_null $P1342, vivify_322
    new $P1342, "Undef"
  vivify_322:
    $P1343 = $P1342."ast"()
    store_lex "$past", $P1343
.annotate "line", 377
    find_lex $P1344, "$past"
    find_lex $P1345, "$name"
    "subrule_alias"($P1344, $P1345)
  if_1337_end:
.annotate "line", 404
    find_lex $P1395, "$/"
    find_lex $P1396, "$past"
    $P1397 = $P1395."!make"($P1396)
.annotate "line", 372
    .return ($P1397)
  control_1327:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1398, exception, "payload"
    .return ($P1398)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1386"  :anon :subid("82_1267204695.47543") :outer("80_1267204695.47543")
    .param pmc param_1388
.annotate "line", 401
    .lex "$_", param_1388
    find_lex $P1389, "$past"
    find_lex $P1390, "$_"
    $P1391 = $P1389."push"($P1390)
    .return ($P1391)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1350"  :anon :subid("81_1267204695.47543") :outer("80_1267204695.47543")
.annotate "line", 380
    new $P1352, "Undef"
    .lex "$regexsym", $P1352

            $P0 = get_global '$REGEXNAME'
            $S0 = $P0
            $I0 = index $S0, ':sym<'
            add $I0, 5
            $S0 = substr $S0, $I0
            chopn $S0, 1
            $P1353 = box $S0
        
    store_lex "$regexsym", $P1353
.annotate "line", 389
    get_hll_global $P1354, ["PAST"], "Regex"
.annotate "line", 390
    get_hll_global $P1355, ["PAST"], "Regex"
    find_lex $P1356, "$regexsym"
    $P1357 = $P1355."new"($P1356, "literal" :named("pasttype"))
    find_lex $P1358, "$name"
    find_lex $P1359, "$/"
    $P1360 = $P1354."new"($P1357, $P1358 :named("name"), "subcapture" :named("pasttype"), $P1359 :named("node"))
.annotate "line", 389
    store_lex "$past", $P1360
.annotate "line", 379
    .return ($P1360)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<[>"  :subid("83_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_1402
.annotate "line", 407
    .const 'Sub' $P1437 = "84_1267204695.47543" 
    capture_lex $P1437
    new $P1401, 'ExceptionHandler'
    set_addr $P1401, control_1400
    $P1401."handle_types"(58)
    push_eh $P1401
    .lex "self", self
    .lex "$/", param_1402
.annotate "line", 408
    new $P1403, "Undef"
    .lex "$clist", $P1403
.annotate "line", 409
    new $P1404, "Undef"
    .lex "$past", $P1404
.annotate "line", 418
    new $P1405, "Undef"
    .lex "$i", $P1405
.annotate "line", 419
    new $P1406, "Undef"
    .lex "$n", $P1406
.annotate "line", 408
    find_lex $P1407, "$/"
    unless_null $P1407, vivify_323
    $P1407 = root_new ['parrot';'Hash']
  vivify_323:
    set $P1408, $P1407["cclass_elem"]
    unless_null $P1408, vivify_324
    new $P1408, "Undef"
  vivify_324:
    store_lex "$clist", $P1408
.annotate "line", 409
    find_lex $P1409, "$clist"
    unless_null $P1409, vivify_325
    $P1409 = root_new ['parrot';'ResizablePMCArray']
  vivify_325:
    set $P1410, $P1409[0]
    unless_null $P1410, vivify_326
    new $P1410, "Undef"
  vivify_326:
    $P1411 = $P1410."ast"()
    store_lex "$past", $P1411
.annotate "line", 410
    find_lex $P1415, "$past"
    $P1416 = $P1415."negate"()
    if $P1416, if_1414
    set $P1413, $P1416
    goto if_1414_end
  if_1414:
    find_lex $P1417, "$past"
    $S1418 = $P1417."pasttype"()
    iseq $I1419, $S1418, "subrule"
    new $P1413, 'Integer'
    set $P1413, $I1419
  if_1414_end:
    unless $P1413, if_1412_end
.annotate "line", 411
    find_lex $P1420, "$past"
    $P1420."subtype"("zerowidth")
.annotate "line", 412
    get_hll_global $P1421, ["PAST"], "Regex"
    find_lex $P1422, "$past"
.annotate "line", 414
    get_hll_global $P1423, ["PAST"], "Regex"
    $P1424 = $P1423."new"("charclass" :named("pasttype"), "." :named("subtype"))
    find_lex $P1425, "$/"
    $P1426 = $P1421."new"($P1422, $P1424, $P1425 :named("node"))
.annotate "line", 412
    store_lex "$past", $P1426
  if_1412_end:
.annotate "line", 418
    new $P1427, "Integer"
    assign $P1427, 1
    store_lex "$i", $P1427
.annotate "line", 419
    find_lex $P1428, "$clist"
    set $N1429, $P1428
    new $P1430, 'Float'
    set $P1430, $N1429
    store_lex "$n", $P1430
.annotate "line", 420
    new $P1461, 'ExceptionHandler'
    set_addr $P1461, loop1460_handler
    $P1461."handle_types"(65, 67, 66)
    push_eh $P1461
  loop1460_test:
    find_lex $P1431, "$i"
    set $N1432, $P1431
    find_lex $P1433, "$n"
    set $N1434, $P1433
    islt $I1435, $N1432, $N1434
    unless $I1435, loop1460_done
  loop1460_redo:
    .const 'Sub' $P1437 = "84_1267204695.47543" 
    capture_lex $P1437
    $P1437()
  loop1460_next:
    goto loop1460_test
  loop1460_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1462, exception, 'type'
    eq $P1462, 65, loop1460_next
    eq $P1462, 67, loop1460_redo
  loop1460_done:
    pop_eh 
.annotate "line", 431
    find_lex $P1463, "$/"
    find_lex $P1464, "$past"
    $P1465 = $P1463."!make"($P1464)
.annotate "line", 407
    .return ($P1465)
  control_1400:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1466, exception, "payload"
    .return ($P1466)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1436"  :anon :subid("84_1267204695.47543") :outer("83_1267204695.47543")
.annotate "line", 421
    new $P1438, "Undef"
    .lex "$ast", $P1438
    find_lex $P1439, "$i"
    set $I1440, $P1439
    find_lex $P1441, "$clist"
    unless_null $P1441, vivify_327
    $P1441 = root_new ['parrot';'ResizablePMCArray']
  vivify_327:
    set $P1442, $P1441[$I1440]
    unless_null $P1442, vivify_328
    new $P1442, "Undef"
  vivify_328:
    $P1443 = $P1442."ast"()
    store_lex "$ast", $P1443
.annotate "line", 422
    find_lex $P1445, "$ast"
    $P1446 = $P1445."negate"()
    if $P1446, if_1444
.annotate "line", 427
    get_hll_global $P1453, ["PAST"], "Regex"
    find_lex $P1454, "$past"
    find_lex $P1455, "$ast"
    find_lex $P1456, "$/"
    $P1457 = $P1453."new"($P1454, $P1455, "alt" :named("pasttype"), $P1456 :named("node"))
    store_lex "$past", $P1457
.annotate "line", 426
    goto if_1444_end
  if_1444:
.annotate "line", 423
    find_lex $P1447, "$ast"
    $P1447."subtype"("zerowidth")
.annotate "line", 424
    get_hll_global $P1448, ["PAST"], "Regex"
    find_lex $P1449, "$ast"
    find_lex $P1450, "$past"
    find_lex $P1451, "$/"
    $P1452 = $P1448."new"($P1449, $P1450, "concat" :named("pasttype"), $P1451 :named("node"))
    store_lex "$past", $P1452
  if_1444_end:
.annotate "line", 429
    find_lex $P1458, "$i"
    add $P1459, $P1458, 1
    store_lex "$i", $P1459
.annotate "line", 420
    .return ($P1459)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "cclass_elem"  :subid("85_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_1470
.annotate "line", 434
    .const 'Sub' $P1495 = "87_1267204695.47543" 
    capture_lex $P1495
    .const 'Sub' $P1479 = "86_1267204695.47543" 
    capture_lex $P1479
    new $P1469, 'ExceptionHandler'
    set_addr $P1469, control_1468
    $P1469."handle_types"(58)
    push_eh $P1469
    .lex "self", self
    .lex "$/", param_1470
.annotate "line", 435
    new $P1471, "Undef"
    .lex "$str", $P1471
.annotate "line", 436
    new $P1472, "Undef"
    .lex "$past", $P1472
.annotate "line", 435
    new $P1473, "String"
    assign $P1473, ""
    store_lex "$str", $P1473
    find_lex $P1474, "$past"
.annotate "line", 437
    find_lex $P1476, "$/"
    unless_null $P1476, vivify_329
    $P1476 = root_new ['parrot';'Hash']
  vivify_329:
    set $P1477, $P1476["name"]
    unless_null $P1477, vivify_330
    new $P1477, "Undef"
  vivify_330:
    if $P1477, if_1475
.annotate "line", 441
    find_lex $P1490, "$/"
    unless_null $P1490, vivify_331
    $P1490 = root_new ['parrot';'Hash']
  vivify_331:
    set $P1491, $P1490["charspec"]
    unless_null $P1491, vivify_332
    new $P1491, "Undef"
  vivify_332:
    defined $I1492, $P1491
    unless $I1492, for_undef_333
    iter $P1489, $P1491
    new $P1521, 'ExceptionHandler'
    set_addr $P1521, loop1520_handler
    $P1521."handle_types"(65, 67, 66)
    push_eh $P1521
  loop1520_test:
    unless $P1489, loop1520_done
    shift $P1493, $P1489
  loop1520_redo:
    .const 'Sub' $P1495 = "87_1267204695.47543" 
    capture_lex $P1495
    $P1495($P1493)
  loop1520_next:
    goto loop1520_test
  loop1520_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1522, exception, 'type'
    eq $P1522, 65, loop1520_next
    eq $P1522, 67, loop1520_redo
  loop1520_done:
    pop_eh 
  for_undef_333:
.annotate "line", 466
    get_hll_global $P1523, ["PAST"], "Regex"
    find_lex $P1524, "$str"
    find_lex $P1525, "$/"
    $P1526 = $P1523."new"($P1524, "enumcharlist" :named("pasttype"), $P1525 :named("node"))
    store_lex "$past", $P1526
.annotate "line", 440
    goto if_1475_end
  if_1475:
.annotate "line", 437
    .const 'Sub' $P1479 = "86_1267204695.47543" 
    capture_lex $P1479
    $P1479()
  if_1475_end:
.annotate "line", 468
    find_lex $P1527, "$past"
    find_lex $P1528, "$/"
    unless_null $P1528, vivify_345
    $P1528 = root_new ['parrot';'Hash']
  vivify_345:
    set $P1529, $P1528["sign"]
    unless_null $P1529, vivify_346
    new $P1529, "Undef"
  vivify_346:
    set $S1530, $P1529
    iseq $I1531, $S1530, "-"
    $P1527."negate"($I1531)
.annotate "line", 469
    find_lex $P1532, "$/"
    find_lex $P1533, "$past"
    $P1534 = $P1532."!make"($P1533)
.annotate "line", 434
    .return ($P1534)
  control_1468:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1535, exception, "payload"
    .return ($P1535)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1494"  :anon :subid("87_1267204695.47543") :outer("85_1267204695.47543")
    .param pmc param_1496
.annotate "line", 441
    .const 'Sub' $P1502 = "88_1267204695.47543" 
    capture_lex $P1502
    .lex "$_", param_1496
.annotate "line", 442
    find_lex $P1499, "$_"
    unless_null $P1499, vivify_334
    $P1499 = root_new ['parrot';'ResizablePMCArray']
  vivify_334:
    set $P1500, $P1499[1]
    unless_null $P1500, vivify_335
    new $P1500, "Undef"
  vivify_335:
    if $P1500, if_1498
.annotate "line", 464
    find_lex $P1516, "$str"
    find_lex $P1517, "$_"
    unless_null $P1517, vivify_336
    $P1517 = root_new ['parrot';'ResizablePMCArray']
  vivify_336:
    set $P1518, $P1517[0]
    unless_null $P1518, vivify_337
    new $P1518, "Undef"
  vivify_337:
    concat $P1519, $P1516, $P1518
    store_lex "$str", $P1519
    set $P1497, $P1519
.annotate "line", 442
    goto if_1498_end
  if_1498:
    .const 'Sub' $P1502 = "88_1267204695.47543" 
    capture_lex $P1502
    $P1515 = $P1502()
    set $P1497, $P1515
  if_1498_end:
.annotate "line", 441
    .return ($P1497)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1501"  :anon :subid("88_1267204695.47543") :outer("87_1267204695.47543")
.annotate "line", 443
    new $P1503, "Undef"
    .lex "$a", $P1503
.annotate "line", 444
    new $P1504, "Undef"
    .lex "$b", $P1504
.annotate "line", 445
    new $P1505, "Undef"
    .lex "$c", $P1505
.annotate "line", 443
    find_lex $P1506, "$_"
    unless_null $P1506, vivify_338
    $P1506 = root_new ['parrot';'ResizablePMCArray']
  vivify_338:
    set $P1507, $P1506[0]
    unless_null $P1507, vivify_339
    new $P1507, "Undef"
  vivify_339:
    store_lex "$a", $P1507
.annotate "line", 444
    find_lex $P1508, "$_"
    unless_null $P1508, vivify_340
    $P1508 = root_new ['parrot';'ResizablePMCArray']
  vivify_340:
    set $P1509, $P1508[1]
    unless_null $P1509, vivify_341
    $P1509 = root_new ['parrot';'ResizablePMCArray']
  vivify_341:
    set $P1510, $P1509[0]
    unless_null $P1510, vivify_342
    new $P1510, "Undef"
  vivify_342:
    store_lex "$b", $P1510
.annotate "line", 445

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
                             $P1511 = box $S2
                         
    store_lex "$c", $P1511
.annotate "line", 462
    find_lex $P1512, "$str"
    find_lex $P1513, "$c"
    concat $P1514, $P1512, $P1513
    store_lex "$str", $P1514
.annotate "line", 442
    .return ($P1514)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1478"  :anon :subid("86_1267204695.47543") :outer("85_1267204695.47543")
.annotate "line", 438
    new $P1480, "Undef"
    .lex "$name", $P1480
    find_lex $P1481, "$/"
    unless_null $P1481, vivify_343
    $P1481 = root_new ['parrot';'Hash']
  vivify_343:
    set $P1482, $P1481["name"]
    unless_null $P1482, vivify_344
    new $P1482, "Undef"
  vivify_344:
    set $S1483, $P1482
    new $P1484, 'String'
    set $P1484, $S1483
    store_lex "$name", $P1484
.annotate "line", 439
    get_hll_global $P1485, ["PAST"], "Regex"
    find_lex $P1486, "$name"
    find_lex $P1487, "$/"
    $P1488 = $P1485."new"($P1486, "subrule" :named("pasttype"), "method" :named("subtype"), $P1487 :named("node"))
    store_lex "$past", $P1488
.annotate "line", 437
    .return ($P1488)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "mod_internal"  :subid("89_1267204695.47543") :method :outer("11_1267204695.47543")
    .param pmc param_1539
.annotate "line", 472
    new $P1538, 'ExceptionHandler'
    set_addr $P1538, control_1537
    $P1538."handle_types"(58)
    push_eh $P1538
    .lex "self", self
    .lex "$/", param_1539
.annotate "line", 473
    $P1540 = root_new ['parrot';'Hash']
    .lex "%mods", $P1540
.annotate "line", 474
    new $P1541, "Undef"
    .lex "$n", $P1541
.annotate "line", 473
    get_global $P1542, "@MODIFIERS"
    unless_null $P1542, vivify_347
    $P1542 = root_new ['parrot';'ResizablePMCArray']
  vivify_347:
    set $P1543, $P1542[0]
    unless_null $P1543, vivify_348
    new $P1543, "Undef"
  vivify_348:
    store_lex "%mods", $P1543
.annotate "line", 474
    find_lex $P1546, "$/"
    unless_null $P1546, vivify_349
    $P1546 = root_new ['parrot';'Hash']
  vivify_349:
    set $P1547, $P1546["n"]
    unless_null $P1547, vivify_350
    $P1547 = root_new ['parrot';'ResizablePMCArray']
  vivify_350:
    set $P1548, $P1547[0]
    unless_null $P1548, vivify_351
    new $P1548, "Undef"
  vivify_351:
    set $S1549, $P1548
    isgt $I1550, $S1549, ""
    if $I1550, if_1545
    new $P1555, "Integer"
    assign $P1555, 1
    set $P1544, $P1555
    goto if_1545_end
  if_1545:
    find_lex $P1551, "$/"
    unless_null $P1551, vivify_352
    $P1551 = root_new ['parrot';'Hash']
  vivify_352:
    set $P1552, $P1551["n"]
    unless_null $P1552, vivify_353
    $P1552 = root_new ['parrot';'ResizablePMCArray']
  vivify_353:
    set $P1553, $P1552[0]
    unless_null $P1553, vivify_354
    new $P1553, "Undef"
  vivify_354:
    set $N1554, $P1553
    new $P1544, 'Float'
    set $P1544, $N1554
  if_1545_end:
    store_lex "$n", $P1544
.annotate "line", 475
    find_lex $P1556, "$n"
    find_lex $P1557, "$/"
    unless_null $P1557, vivify_355
    $P1557 = root_new ['parrot';'Hash']
  vivify_355:
    set $P1558, $P1557["mod_ident"]
    unless_null $P1558, vivify_356
    $P1558 = root_new ['parrot';'Hash']
  vivify_356:
    set $P1559, $P1558["sym"]
    unless_null $P1559, vivify_357
    new $P1559, "Undef"
  vivify_357:
    set $S1560, $P1559
    find_lex $P1561, "%mods"
    unless_null $P1561, vivify_358
    $P1561 = root_new ['parrot';'Hash']
    store_lex "%mods", $P1561
  vivify_358:
    set $P1561[$S1560], $P1556
.annotate "line", 476
    find_lex $P1562, "$/"
    $P1563 = $P1562."!make"(0)
.annotate "line", 472
    .return ($P1563)
  control_1537:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1564, exception, "payload"
    .return ($P1564)
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
