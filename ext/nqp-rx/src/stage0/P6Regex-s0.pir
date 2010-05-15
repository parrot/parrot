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
.sub "_block11"  :anon :subid("10_1273884015.94636")
.annotate 'line', 0
    get_hll_global $P14, ["Regex";"P6Regex";"Grammar"], "_block13" 
    capture_lex $P14
.annotate 'line', 3
    get_hll_global $P14, ["Regex";"P6Regex";"Grammar"], "_block13" 
    capture_lex $P14
    $P579 = $P14()
.annotate 'line', 1
    .return ($P579)
.end


.namespace []
.sub "" :load :init :subid("post158") :outer("10_1273884015.94636")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1273884015.94636" 
    .local pmc block
    set block, $P12
    $P580 = get_root_global ["parrot"], "P6metaclass"
    $P580."new_class"("Regex::P6Regex::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block13"  :subid("11_1273884015.94636") :outer("10_1273884015.94636")
.annotate 'line', 3
    .const 'Sub' $P571 = "156_1273884015.94636" 
    capture_lex $P571
    .const 'Sub' $P563 = "154_1273884015.94636" 
    capture_lex $P563
    .const 'Sub' $P555 = "152_1273884015.94636" 
    capture_lex $P555
    .const 'Sub' $P534 = "147_1273884015.94636" 
    capture_lex $P534
    .const 'Sub' $P499 = "141_1273884015.94636" 
    capture_lex $P499
    .const 'Sub' $P487 = "138_1273884015.94636" 
    capture_lex $P487
    .const 'Sub' $P474 = "135_1273884015.94636" 
    capture_lex $P474
    .const 'Sub' $P468 = "133_1273884015.94636" 
    capture_lex $P468
    .const 'Sub' $P457 = "130_1273884015.94636" 
    capture_lex $P457
    .const 'Sub' $P446 = "127_1273884015.94636" 
    capture_lex $P446
    .const 'Sub' $P437 = "123_1273884015.94636" 
    capture_lex $P437
    .const 'Sub' $P431 = "121_1273884015.94636" 
    capture_lex $P431
    .const 'Sub' $P425 = "119_1273884015.94636" 
    capture_lex $P425
    .const 'Sub' $P419 = "117_1273884015.94636" 
    capture_lex $P419
    .const 'Sub' $P413 = "115_1273884015.94636" 
    capture_lex $P413
    .const 'Sub' $P405 = "113_1273884015.94636" 
    capture_lex $P405
    .const 'Sub' $P394 = "111_1273884015.94636" 
    capture_lex $P394
    .const 'Sub' $P383 = "109_1273884015.94636" 
    capture_lex $P383
    .const 'Sub' $P377 = "107_1273884015.94636" 
    capture_lex $P377
    .const 'Sub' $P371 = "105_1273884015.94636" 
    capture_lex $P371
    .const 'Sub' $P365 = "103_1273884015.94636" 
    capture_lex $P365
    .const 'Sub' $P359 = "101_1273884015.94636" 
    capture_lex $P359
    .const 'Sub' $P353 = "99_1273884015.94636" 
    capture_lex $P353
    .const 'Sub' $P347 = "97_1273884015.94636" 
    capture_lex $P347
    .const 'Sub' $P341 = "95_1273884015.94636" 
    capture_lex $P341
    .const 'Sub' $P335 = "93_1273884015.94636" 
    capture_lex $P335
    .const 'Sub' $P323 = "89_1273884015.94636" 
    capture_lex $P323
    .const 'Sub' $P311 = "87_1273884015.94636" 
    capture_lex $P311
    .const 'Sub' $P304 = "85_1273884015.94636" 
    capture_lex $P304
    .const 'Sub' $P287 = "83_1273884015.94636" 
    capture_lex $P287
    .const 'Sub' $P280 = "81_1273884015.94636" 
    capture_lex $P280
    .const 'Sub' $P274 = "79_1273884015.94636" 
    capture_lex $P274
    .const 'Sub' $P268 = "77_1273884015.94636" 
    capture_lex $P268
    .const 'Sub' $P261 = "75_1273884015.94636" 
    capture_lex $P261
    .const 'Sub' $P254 = "73_1273884015.94636" 
    capture_lex $P254
    .const 'Sub' $P247 = "71_1273884015.94636" 
    capture_lex $P247
    .const 'Sub' $P240 = "69_1273884015.94636" 
    capture_lex $P240
    .const 'Sub' $P234 = "67_1273884015.94636" 
    capture_lex $P234
    .const 'Sub' $P228 = "65_1273884015.94636" 
    capture_lex $P228
    .const 'Sub' $P222 = "63_1273884015.94636" 
    capture_lex $P222
    .const 'Sub' $P216 = "61_1273884015.94636" 
    capture_lex $P216
    .const 'Sub' $P210 = "59_1273884015.94636" 
    capture_lex $P210
    .const 'Sub' $P205 = "57_1273884015.94636" 
    capture_lex $P205
    .const 'Sub' $P200 = "55_1273884015.94636" 
    capture_lex $P200
    .const 'Sub' $P194 = "53_1273884015.94636" 
    capture_lex $P194
    .const 'Sub' $P188 = "51_1273884015.94636" 
    capture_lex $P188
    .const 'Sub' $P182 = "49_1273884015.94636" 
    capture_lex $P182
    .const 'Sub' $P166 = "44_1273884015.94636" 
    capture_lex $P166
    .const 'Sub' $P154 = "42_1273884015.94636" 
    capture_lex $P154
    .const 'Sub' $P147 = "40_1273884015.94636" 
    capture_lex $P147
    .const 'Sub' $P140 = "38_1273884015.94636" 
    capture_lex $P140
    .const 'Sub' $P133 = "36_1273884015.94636" 
    capture_lex $P133
    .const 'Sub' $P114 = "31_1273884015.94636" 
    capture_lex $P114
    .const 'Sub' $P101 = "28_1273884015.94636" 
    capture_lex $P101
    .const 'Sub' $P94 = "26_1273884015.94636" 
    capture_lex $P94
    .const 'Sub' $P82 = "24_1273884015.94636" 
    capture_lex $P82
    .const 'Sub' $P75 = "22_1273884015.94636" 
    capture_lex $P75
    .const 'Sub' $P63 = "20_1273884015.94636" 
    capture_lex $P63
    .const 'Sub' $P56 = "18_1273884015.94636" 
    capture_lex $P56
    .const 'Sub' $P46 = "15_1273884015.94636" 
    capture_lex $P46
    .const 'Sub' $P38 = "13_1273884015.94636" 
    capture_lex $P38
    .const 'Sub' $P15 = "12_1273884015.94636" 
    capture_lex $P15
    .const 'Sub' $P571 = "156_1273884015.94636" 
    capture_lex $P571
    .return ($P571)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "obs"  :subid("12_1273884015.94636") :method :outer("11_1273884015.94636")
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
    if has_param_20, optparam_159
    new $P21, "String"
    assign $P21, "in Perl 6"
    set param_20, $P21
  optparam_159:
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
.sub "ws"  :subid("13_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__ws"  :subid("14_1273884015.94636") :method
.annotate 'line', 3
    new $P41, "ResizablePMCArray"
    push $P41, ""
    .return ($P41)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "normspace"  :subid("15_1273884015.94636") :method :outer("11_1273884015.94636")
.annotate 'line', 3
    .const 'Sub' $P52 = "17_1273884015.94636" 
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
    .const 'Sub' $P52 = "17_1273884015.94636" 
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
.sub "!PREFIX__normspace"  :subid("16_1273884015.94636") :method
.annotate 'line', 3
    new $P49, "ResizablePMCArray"
    push $P49, ""
    .return ($P49)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block51"  :anon :subid("17_1273884015.94636") :method :outer("15_1273884015.94636")
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
.sub "arg"  :subid("18_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__arg"  :subid("19_1273884015.94636") :method
.annotate 'line', 3
    new $P59, "ResizablePMCArray"
    push $P59, ""
    push $P59, "\""
    push $P59, "'"
    .return ($P59)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "arglist"  :subid("20_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__arglist"  :subid("21_1273884015.94636") :method
.annotate 'line', 3
    new $P66, "ResizablePMCArray"
    push $P66, ""
    .return ($P66)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "TOP"  :subid("22_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__TOP"  :subid("23_1273884015.94636") :method
.annotate 'line', 3
    $P78 = self."!PREFIX__!subrule"("nibbler", "")
    new $P79, "ResizablePMCArray"
    push $P79, $P78
    .return ($P79)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "nibbler"  :subid("24_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__nibbler"  :subid("25_1273884015.94636") :method
.annotate 'line', 3
    new $P85, "ResizablePMCArray"
    push $P85, ""
    .return ($P85)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "termish"  :subid("26_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__termish"  :subid("27_1273884015.94636") :method
.annotate 'line', 3
    new $P97, "ResizablePMCArray"
    push $P97, ""
    .return ($P97)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantified_atom"  :subid("28_1273884015.94636") :method :outer("11_1273884015.94636")
.annotate 'line', 3
    .const 'Sub' $P110 = "30_1273884015.94636" 
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
    .const 'Sub' $P110 = "30_1273884015.94636" 
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
.sub "!PREFIX__quantified_atom"  :subid("29_1273884015.94636") :method
.annotate 'line', 3
    $P104 = self."!PREFIX__!subrule"("atom", "")
    new $P105, "ResizablePMCArray"
    push $P105, $P104
    .return ($P105)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block109"  :anon :subid("30_1273884015.94636") :method :outer("28_1273884015.94636")
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
.sub "atom"  :subid("31_1273884015.94636") :method :outer("11_1273884015.94636")
.annotate 'line', 3
    .const 'Sub' $P125 = "33_1273884015.94636" 
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
    .const 'Sub' $P125 = "33_1273884015.94636" 
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
.sub "!PREFIX__atom"  :subid("32_1273884015.94636") :method
.annotate 'line', 3
    $P117 = self."!PREFIX__!subrule"("metachar", "")
    new $P118, "ResizablePMCArray"
    push $P118, $P117
    push $P118, ""
    .return ($P118)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block124"  :anon :subid("33_1273884015.94636") :method :outer("31_1273884015.94636")
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
.sub "quantifier"  :subid("34_1273884015.94636") :method
.annotate 'line', 52
    $P130 = self."!protoregex"("quantifier")
    .return ($P130)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier"  :subid("35_1273884015.94636") :method
.annotate 'line', 52
    $P132 = self."!PREFIX__!protoregex"("quantifier")
    .return ($P132)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<*>"  :subid("36_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__quantifier:sym<*>"  :subid("37_1273884015.94636") :method
.annotate 'line', 3
    $P136 = self."!PREFIX__!subrule"("backmod", "*")
    new $P137, "ResizablePMCArray"
    push $P137, $P136
    .return ($P137)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<+>"  :subid("38_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__quantifier:sym<+>"  :subid("39_1273884015.94636") :method
.annotate 'line', 3
    $P143 = self."!PREFIX__!subrule"("backmod", "+")
    new $P144, "ResizablePMCArray"
    push $P144, $P143
    .return ($P144)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<?>"  :subid("40_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__quantifier:sym<?>"  :subid("41_1273884015.94636") :method
.annotate 'line', 3
    $P150 = self."!PREFIX__!subrule"("backmod", "?")
    new $P151, "ResizablePMCArray"
    push $P151, $P150
    .return ($P151)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<**>"  :subid("42_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__quantifier:sym<**>"  :subid("43_1273884015.94636") :method
.annotate 'line', 3
    new $P157, "ResizablePMCArray"
    push $P157, "**"
    .return ($P157)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backmod"  :subid("44_1273884015.94636") :method :outer("11_1273884015.94636")
.annotate 'line', 3
    .const 'Sub' $P175 = "46_1273884015.94636" 
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
    .const 'Sub' $P175 = "46_1273884015.94636" 
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
.sub "!PREFIX__backmod"  :subid("45_1273884015.94636") :method
.annotate 'line', 3
    new $P169, "ResizablePMCArray"
    push $P169, ""
    .return ($P169)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block174"  :anon :subid("46_1273884015.94636") :method :outer("44_1273884015.94636")
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
.sub "metachar"  :subid("47_1273884015.94636") :method
.annotate 'line', 73
    $P179 = self."!protoregex"("metachar")
    .return ($P179)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar"  :subid("48_1273884015.94636") :method
.annotate 'line', 73
    $P181 = self."!PREFIX__!protoregex"("metachar")
    .return ($P181)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<ws>"  :subid("49_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__metachar:sym<ws>"  :subid("50_1273884015.94636") :method
.annotate 'line', 3
    $P185 = self."!PREFIX__!subrule"("", "")
    new $P186, "ResizablePMCArray"
    push $P186, $P185
    .return ($P186)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<[ ]>"  :subid("51_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__metachar:sym<[ ]>"  :subid("52_1273884015.94636") :method
.annotate 'line', 3
    $P191 = self."!PREFIX__!subrule"("nibbler", "[")
    new $P192, "ResizablePMCArray"
    push $P192, $P191
    .return ($P192)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<( )>"  :subid("53_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__metachar:sym<( )>"  :subid("54_1273884015.94636") :method
.annotate 'line', 3
    $P197 = self."!PREFIX__!subrule"("nibbler", "(")
    new $P198, "ResizablePMCArray"
    push $P198, $P197
    .return ($P198)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<'>"  :subid("55_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__metachar:sym<'>"  :subid("56_1273884015.94636") :method
.annotate 'line', 3
    new $P203, "ResizablePMCArray"
    push $P203, "'"
    .return ($P203)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<\">"  :subid("57_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__metachar:sym<\">"  :subid("58_1273884015.94636") :method
.annotate 'line', 3
    new $P208, "ResizablePMCArray"
    push $P208, "\""
    .return ($P208)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<.>"  :subid("59_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__metachar:sym<.>"  :subid("60_1273884015.94636") :method
.annotate 'line', 3
    new $P213, "ResizablePMCArray"
    push $P213, "."
    .return ($P213)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^>"  :subid("61_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__metachar:sym<^>"  :subid("62_1273884015.94636") :method
.annotate 'line', 3
    new $P219, "ResizablePMCArray"
    push $P219, "^"
    .return ($P219)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^^>"  :subid("63_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__metachar:sym<^^>"  :subid("64_1273884015.94636") :method
.annotate 'line', 3
    new $P225, "ResizablePMCArray"
    push $P225, "^^"
    .return ($P225)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$>"  :subid("65_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__metachar:sym<$>"  :subid("66_1273884015.94636") :method
.annotate 'line', 3
    new $P231, "ResizablePMCArray"
    push $P231, "$"
    .return ($P231)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$$>"  :subid("67_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__metachar:sym<$$>"  :subid("68_1273884015.94636") :method
.annotate 'line', 3
    new $P237, "ResizablePMCArray"
    push $P237, "$$"
    .return ($P237)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<:::>"  :subid("69_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__metachar:sym<:::>"  :subid("70_1273884015.94636") :method
.annotate 'line', 3
    $P243 = self."!PREFIX__!subrule"("", ":::")
    new $P244, "ResizablePMCArray"
    push $P244, $P243
    .return ($P244)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<::>"  :subid("71_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__metachar:sym<::>"  :subid("72_1273884015.94636") :method
.annotate 'line', 3
    $P250 = self."!PREFIX__!subrule"("", "::")
    new $P251, "ResizablePMCArray"
    push $P251, $P250
    .return ($P251)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<lwb>"  :subid("73_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__metachar:sym<lwb>"  :subid("74_1273884015.94636") :method
.annotate 'line', 3
    new $P257, "ResizablePMCArray"
    push $P257, unicode:"\x{ab}"
    push $P257, "<<"
    .return ($P257)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<rwb>"  :subid("75_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__metachar:sym<rwb>"  :subid("76_1273884015.94636") :method
.annotate 'line', 3
    new $P264, "ResizablePMCArray"
    push $P264, unicode:"\x{bb}"
    push $P264, ">>"
    .return ($P264)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<bs>"  :subid("77_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__metachar:sym<bs>"  :subid("78_1273884015.94636") :method
.annotate 'line', 3
    $P271 = self."!PREFIX__!subrule"("backslash", "\\")
    new $P272, "ResizablePMCArray"
    push $P272, $P271
    .return ($P272)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<mod>"  :subid("79_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__metachar:sym<mod>"  :subid("80_1273884015.94636") :method
.annotate 'line', 3
    $P277 = self."!PREFIX__!subrule"("mod_internal", "")
    new $P278, "ResizablePMCArray"
    push $P278, $P277
    .return ($P278)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<~>"  :subid("81_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__metachar:sym<~>"  :subid("82_1273884015.94636") :method
.annotate 'line', 3
    $P283 = self."!PREFIX__!subrule"("", "~")
    new $P284, "ResizablePMCArray"
    push $P284, $P283
    .return ($P284)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<{*}>"  :subid("83_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__metachar:sym<{*}>"  :subid("84_1273884015.94636") :method
.annotate 'line', 3
    new $P290, "ResizablePMCArray"
    push $P290, "{*}"
    .return ($P290)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<assert>"  :subid("85_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__metachar:sym<assert>"  :subid("86_1273884015.94636") :method
.annotate 'line', 3
    $P307 = self."!PREFIX__!subrule"("assertion", "<")
    new $P308, "ResizablePMCArray"
    push $P308, $P307
    .return ($P308)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<var>"  :subid("87_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__metachar:sym<var>"  :subid("88_1273884015.94636") :method
.annotate 'line', 3
    new $P314, "ResizablePMCArray"
    push $P314, "$"
    push $P314, "$<"
    .return ($P314)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<PIR>"  :subid("89_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__metachar:sym<PIR>"  :subid("90_1273884015.94636") :method
.annotate 'line', 3
    new $P326, "ResizablePMCArray"
    push $P326, ":PIR{{"
    .return ($P326)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash"  :subid("91_1273884015.94636") :method
.annotate 'line', 120
    $P332 = self."!protoregex"("backslash")
    .return ($P332)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash"  :subid("92_1273884015.94636") :method
.annotate 'line', 120
    $P334 = self."!PREFIX__!protoregex"("backslash")
    .return ($P334)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<w>"  :subid("93_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__backslash:sym<w>"  :subid("94_1273884015.94636") :method
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
.sub "backslash:sym<b>"  :subid("95_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__backslash:sym<b>"  :subid("96_1273884015.94636") :method
.annotate 'line', 3
    new $P344, "ResizablePMCArray"
    push $P344, "B"
    push $P344, "b"
    .return ($P344)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<e>"  :subid("97_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__backslash:sym<e>"  :subid("98_1273884015.94636") :method
.annotate 'line', 3
    new $P350, "ResizablePMCArray"
    push $P350, "E"
    push $P350, "e"
    .return ($P350)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<f>"  :subid("99_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__backslash:sym<f>"  :subid("100_1273884015.94636") :method
.annotate 'line', 3
    new $P356, "ResizablePMCArray"
    push $P356, "F"
    push $P356, "f"
    .return ($P356)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<h>"  :subid("101_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__backslash:sym<h>"  :subid("102_1273884015.94636") :method
.annotate 'line', 3
    new $P362, "ResizablePMCArray"
    push $P362, "H"
    push $P362, "h"
    .return ($P362)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<r>"  :subid("103_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__backslash:sym<r>"  :subid("104_1273884015.94636") :method
.annotate 'line', 3
    new $P368, "ResizablePMCArray"
    push $P368, "R"
    push $P368, "r"
    .return ($P368)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<t>"  :subid("105_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__backslash:sym<t>"  :subid("106_1273884015.94636") :method
.annotate 'line', 3
    new $P374, "ResizablePMCArray"
    push $P374, "T"
    push $P374, "t"
    .return ($P374)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<v>"  :subid("107_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__backslash:sym<v>"  :subid("108_1273884015.94636") :method
.annotate 'line', 3
    new $P380, "ResizablePMCArray"
    push $P380, "V"
    push $P380, "v"
    .return ($P380)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<o>"  :subid("109_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__backslash:sym<o>"  :subid("110_1273884015.94636") :method
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
.sub "backslash:sym<x>"  :subid("111_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__backslash:sym<x>"  :subid("112_1273884015.94636") :method
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
.sub "backslash:sym<c>"  :subid("113_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__backslash:sym<c>"  :subid("114_1273884015.94636") :method
.annotate 'line', 3
    $P408 = self."!PREFIX__!subrule"("charspec", "C")
    $P409 = self."!PREFIX__!subrule"("charspec", "c")
    new $P410, "ResizablePMCArray"
    push $P410, $P408
    push $P410, $P409
    .return ($P410)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<A>"  :subid("115_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__backslash:sym<A>"  :subid("116_1273884015.94636") :method
.annotate 'line', 3
    $P416 = self."!PREFIX__!subrule"("", "A")
    new $P417, "ResizablePMCArray"
    push $P417, $P416
    .return ($P417)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<z>"  :subid("117_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__backslash:sym<z>"  :subid("118_1273884015.94636") :method
.annotate 'line', 3
    $P422 = self."!PREFIX__!subrule"("", "z")
    new $P423, "ResizablePMCArray"
    push $P423, $P422
    .return ($P423)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Z>"  :subid("119_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__backslash:sym<Z>"  :subid("120_1273884015.94636") :method
.annotate 'line', 3
    $P428 = self."!PREFIX__!subrule"("", "Z")
    new $P429, "ResizablePMCArray"
    push $P429, $P428
    .return ($P429)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Q>"  :subid("121_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__backslash:sym<Q>"  :subid("122_1273884015.94636") :method
.annotate 'line', 3
    $P434 = self."!PREFIX__!subrule"("", "Q")
    new $P435, "ResizablePMCArray"
    push $P435, $P434
    .return ($P435)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<misc>"  :subid("123_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__backslash:sym<misc>"  :subid("124_1273884015.94636") :method
.annotate 'line', 3
    new $P440, "ResizablePMCArray"
    push $P440, ""
    .return ($P440)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion"  :subid("125_1273884015.94636") :method
.annotate 'line', 138
    $P443 = self."!protoregex"("assertion")
    .return ($P443)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion"  :subid("126_1273884015.94636") :method
.annotate 'line', 138
    $P445 = self."!PREFIX__!protoregex"("assertion")
    .return ($P445)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<?>"  :subid("127_1273884015.94636") :method :outer("11_1273884015.94636")
.annotate 'line', 3
    .const 'Sub' $P454 = "129_1273884015.94636" 
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
    .const 'Sub' $P454 = "129_1273884015.94636" 
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
.sub "!PREFIX__assertion:sym<?>"  :subid("128_1273884015.94636") :method
.annotate 'line', 3
    $P449 = self."!PREFIX__!subrule"("assertion", "?")
    new $P450, "ResizablePMCArray"
    push $P450, $P449
    push $P450, "?"
    .return ($P450)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block453"  :anon :subid("129_1273884015.94636") :method :outer("127_1273884015.94636")
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
.sub "assertion:sym<!>"  :subid("130_1273884015.94636") :method :outer("11_1273884015.94636")
.annotate 'line', 3
    .const 'Sub' $P465 = "132_1273884015.94636" 
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
    .const 'Sub' $P465 = "132_1273884015.94636" 
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
.sub "!PREFIX__assertion:sym<!>"  :subid("131_1273884015.94636") :method
.annotate 'line', 3
    $P460 = self."!PREFIX__!subrule"("assertion", "!")
    new $P461, "ResizablePMCArray"
    push $P461, $P460
    push $P461, "!"
    .return ($P461)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block464"  :anon :subid("132_1273884015.94636") :method :outer("130_1273884015.94636")
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
.sub "assertion:sym<method>"  :subid("133_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__assertion:sym<method>"  :subid("134_1273884015.94636") :method
.annotate 'line', 3
    $P471 = self."!PREFIX__!subrule"("assertion", ".")
    new $P472, "ResizablePMCArray"
    push $P472, $P471
    .return ($P472)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<name>"  :subid("135_1273884015.94636") :method :outer("11_1273884015.94636")
.annotate 'line', 3
    .const 'Sub' $P483 = "137_1273884015.94636" 
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
    .const 'Sub' $P483 = "137_1273884015.94636" 
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
.sub "!PREFIX__assertion:sym<name>"  :subid("136_1273884015.94636") :method
.annotate 'line', 3
    new $P477, "ResizablePMCArray"
    push $P477, ""
    .return ($P477)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block482"  :anon :subid("137_1273884015.94636") :method :outer("135_1273884015.94636")
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
.sub "assertion:sym<[>"  :subid("138_1273884015.94636") :method :outer("11_1273884015.94636")
.annotate 'line', 3
    .const 'Sub' $P493 = "140_1273884015.94636" 
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
    .const 'Sub' $P493 = "140_1273884015.94636" 
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
.sub "!PREFIX__assertion:sym<[>"  :subid("139_1273884015.94636") :method
.annotate 'line', 3
    new $P490, "ResizablePMCArray"
    push $P490, ""
    .return ($P490)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block492"  :anon :subid("140_1273884015.94636") :method :outer("138_1273884015.94636")
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
.sub "cclass_elem"  :subid("141_1273884015.94636") :method :outer("11_1273884015.94636")
.annotate 'line', 3
    .const 'Sub' $P511 = "143_1273884015.94636" 
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
    .const 'Sub' $P511 = "143_1273884015.94636" 
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
.sub "!PREFIX__cclass_elem"  :subid("142_1273884015.94636") :method
.annotate 'line', 3
    new $P502, "ResizablePMCArray"
    push $P502, ""
    push $P502, "-"
    push $P502, "+"
    .return ($P502)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block510"  :anon :subid("143_1273884015.94636") :method :outer("141_1273884015.94636")
.annotate 'line', 164
    .const 'Sub' $P526 = "146_1273884015.94636" 
    capture_lex $P526
    .const 'Sub' $P521 = "145_1273884015.94636" 
    capture_lex $P521
    .const 'Sub' $P517 = "144_1273884015.94636" 
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
    .const 'Sub' $P517 = "144_1273884015.94636" 
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
    .const 'Sub' $P521 = "145_1273884015.94636" 
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
    .const 'Sub' $P526 = "146_1273884015.94636" 
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
.sub "_block516"  :anon :subid("144_1273884015.94636") :method :outer("143_1273884015.94636")
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
.sub "_block520"  :anon :subid("145_1273884015.94636") :method :outer("143_1273884015.94636")
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
.sub "_block525"  :anon :subid("146_1273884015.94636") :method :outer("143_1273884015.94636")
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
.sub "mod_internal"  :subid("147_1273884015.94636") :method :outer("11_1273884015.94636")
.annotate 'line', 3
    .const 'Sub' $P543 = "149_1273884015.94636" 
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
    .const 'Sub' $P543 = "149_1273884015.94636" 
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
.sub "!PREFIX__mod_internal"  :subid("148_1273884015.94636") :method
.annotate 'line', 3
    $P537 = self."!PREFIX__!subrule"("mod_ident", ":")
    new $P538, "ResizablePMCArray"
    push $P538, $P537
    push $P538, ":"
    .return ($P538)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block542"  :anon :subid("149_1273884015.94636") :method :outer("147_1273884015.94636")
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
.sub "mod_ident"  :subid("150_1273884015.94636") :method
.annotate 'line', 181
    $P552 = self."!protoregex"("mod_ident")
    .return ($P552)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident"  :subid("151_1273884015.94636") :method
.annotate 'line', 181
    $P554 = self."!PREFIX__!protoregex"("mod_ident")
    .return ($P554)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ignorecase>"  :subid("152_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__mod_ident:sym<ignorecase>"  :subid("153_1273884015.94636") :method
.annotate 'line', 3
    new $P558, "ResizablePMCArray"
    push $P558, "i"
    .return ($P558)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ratchet>"  :subid("154_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__mod_ident:sym<ratchet>"  :subid("155_1273884015.94636") :method
.annotate 'line', 3
    new $P566, "ResizablePMCArray"
    push $P566, "r"
    .return ($P566)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<sigspace>"  :subid("156_1273884015.94636") :method :outer("11_1273884015.94636")
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
.sub "!PREFIX__mod_ident:sym<sigspace>"  :subid("157_1273884015.94636") :method
.annotate 'line', 3
    new $P574, "ResizablePMCArray"
    push $P574, "s"
    .return ($P574)
.end

### .include 'gen/p6regex-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1273884021.34483")
.annotate 'line', 0
    get_hll_global $P14, ["Regex";"P6Regex";"Actions"], "_block13" 
    capture_lex $P14
.annotate 'line', 4
    get_hll_global $P14, ["Regex";"P6Regex";"Actions"], "_block13" 
    capture_lex $P14
    $P1574 = $P14()
.annotate 'line', 1
    .return ($P1574)
.end


.namespace []
.sub "" :load :init :subid("post90") :outer("10_1273884021.34483")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1273884021.34483" 
    .local pmc block
    set block, $P12
    $P1575 = get_root_global ["parrot"], "P6metaclass"
    $P1575."new_class"("Regex::P6Regex::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block13"  :subid("11_1273884021.34483") :outer("10_1273884021.34483")
.annotate 'line', 4
    .const 'Sub' $P1541 = "89_1273884021.34483" 
    capture_lex $P1541
    .const 'Sub' $P1472 = "85_1273884021.34483" 
    capture_lex $P1472
    .const 'Sub' $P1404 = "83_1273884021.34483" 
    capture_lex $P1404
    .const 'Sub' $P1331 = "80_1273884021.34483" 
    capture_lex $P1331
    .const 'Sub' $P1317 = "79_1273884021.34483" 
    capture_lex $P1317
    .const 'Sub' $P1293 = "78_1273884021.34483" 
    capture_lex $P1293
    .const 'Sub' $P1275 = "77_1273884021.34483" 
    capture_lex $P1275
    .const 'Sub' $P1261 = "76_1273884021.34483" 
    capture_lex $P1261
    .const 'Sub' $P1248 = "75_1273884021.34483" 
    capture_lex $P1248
    .const 'Sub' $P1217 = "74_1273884021.34483" 
    capture_lex $P1217
    .const 'Sub' $P1186 = "73_1273884021.34483" 
    capture_lex $P1186
    .const 'Sub' $P1170 = "72_1273884021.34483" 
    capture_lex $P1170
    .const 'Sub' $P1154 = "71_1273884021.34483" 
    capture_lex $P1154
    .const 'Sub' $P1138 = "70_1273884021.34483" 
    capture_lex $P1138
    .const 'Sub' $P1122 = "69_1273884021.34483" 
    capture_lex $P1122
    .const 'Sub' $P1106 = "68_1273884021.34483" 
    capture_lex $P1106
    .const 'Sub' $P1090 = "67_1273884021.34483" 
    capture_lex $P1090
    .const 'Sub' $P1074 = "66_1273884021.34483" 
    capture_lex $P1074
    .const 'Sub' $P1050 = "65_1273884021.34483" 
    capture_lex $P1050
    .const 'Sub' $P1035 = "64_1273884021.34483" 
    capture_lex $P1035
    .const 'Sub' $P979 = "63_1273884021.34483" 
    capture_lex $P979
    .const 'Sub' $P958 = "62_1273884021.34483" 
    capture_lex $P958
    .const 'Sub' $P936 = "61_1273884021.34483" 
    capture_lex $P936
    .const 'Sub' $P926 = "60_1273884021.34483" 
    capture_lex $P926
    .const 'Sub' $P916 = "59_1273884021.34483" 
    capture_lex $P916
    .const 'Sub' $P906 = "58_1273884021.34483" 
    capture_lex $P906
    .const 'Sub' $P894 = "57_1273884021.34483" 
    capture_lex $P894
    .const 'Sub' $P882 = "56_1273884021.34483" 
    capture_lex $P882
    .const 'Sub' $P870 = "55_1273884021.34483" 
    capture_lex $P870
    .const 'Sub' $P858 = "54_1273884021.34483" 
    capture_lex $P858
    .const 'Sub' $P846 = "53_1273884021.34483" 
    capture_lex $P846
    .const 'Sub' $P834 = "52_1273884021.34483" 
    capture_lex $P834
    .const 'Sub' $P822 = "51_1273884021.34483" 
    capture_lex $P822
    .const 'Sub' $P810 = "50_1273884021.34483" 
    capture_lex $P810
    .const 'Sub' $P787 = "49_1273884021.34483" 
    capture_lex $P787
    .const 'Sub' $P764 = "48_1273884021.34483" 
    capture_lex $P764
    .const 'Sub' $P746 = "47_1273884021.34483" 
    capture_lex $P746
    .const 'Sub' $P736 = "46_1273884021.34483" 
    capture_lex $P736
    .const 'Sub' $P718 = "45_1273884021.34483" 
    capture_lex $P718
    .const 'Sub' $P671 = "44_1273884021.34483" 
    capture_lex $P671
    .const 'Sub' $P654 = "43_1273884021.34483" 
    capture_lex $P654
    .const 'Sub' $P639 = "42_1273884021.34483" 
    capture_lex $P639
    .const 'Sub' $P624 = "41_1273884021.34483" 
    capture_lex $P624
    .const 'Sub' $P598 = "40_1273884021.34483" 
    capture_lex $P598
    .const 'Sub' $P548 = "38_1273884021.34483" 
    capture_lex $P548
    .const 'Sub' $P480 = "36_1273884021.34483" 
    capture_lex $P480
    .const 'Sub' $P425 = "33_1273884021.34483" 
    capture_lex $P425
    .const 'Sub' $P410 = "32_1273884021.34483" 
    capture_lex $P410
    .const 'Sub' $P384 = "30_1273884021.34483" 
    capture_lex $P384
    .const 'Sub' $P367 = "29_1273884021.34483" 
    capture_lex $P367
    .const 'Sub' $P344 = "28_1273884021.34483" 
    capture_lex $P344
    .const 'Sub' $P311 = "27_1273884021.34483" 
    capture_lex $P311
    .const 'Sub' $P56 = "14_1273884021.34483" 
    capture_lex $P56
    .const 'Sub' $P22 = "13_1273884021.34483" 
    capture_lex $P22
    .const 'Sub' $P16 = "12_1273884021.34483" 
    capture_lex $P16
    get_global $P15, "@MODIFIERS"
    unless_null $P15, vivify_91
    $P15 = root_new ['parrot';'ResizablePMCArray']
    set_global "@MODIFIERS", $P15
  vivify_91:
.annotate 'line', 6
    .const 'Sub' $P16 = "12_1273884021.34483" 
    newclosure $P21, $P16
    .lex "INIT", $P21
.annotate 'line', 479
    .const 'Sub' $P22 = "13_1273884021.34483" 
    newclosure $P55, $P22
    .lex "buildsub", $P55
.annotate 'line', 496
    .const 'Sub' $P56 = "14_1273884021.34483" 
    newclosure $P310, $P56
    .lex "capnames", $P310
.annotate 'line', 562
    .const 'Sub' $P311 = "27_1273884021.34483" 
    newclosure $P343, $P311
    .lex "backmod", $P343
.annotate 'line', 569
    .const 'Sub' $P344 = "28_1273884021.34483" 
    newclosure $P364, $P344
    .lex "subrule_alias", $P364
.annotate 'line', 4
    get_global $P365, "@MODIFIERS"
    find_lex $P366, "INIT"
.annotate 'line', 472
    find_lex $P1570, "buildsub"
    find_lex $P1571, "capnames"
    find_lex $P1572, "backmod"
    find_lex $P1573, "subrule_alias"
.annotate 'line', 4
    .return ($P1573)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "INIT"  :subid("12_1273884021.34483") :outer("11_1273884021.34483")
.annotate 'line', 6
    new $P18, 'ExceptionHandler'
    set_addr $P18, control_17
    $P18."handle_types"(57)
    push_eh $P18
.annotate 'line', 7

        $P19 = new ['ResizablePMCArray']
        $P0 = new ['Hash']
        push $P19, $P0
    
    set_global "@MODIFIERS", $P19
.annotate 'line', 6
    .return ($P19)
  control_17:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P20, exception, "payload"
    .return ($P20)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "buildsub"  :subid("13_1273884021.34483") :outer("11_1273884021.34483")
    .param pmc param_25
    .param pmc param_26 :optional
    .param int has_param_26 :opt_flag
.annotate 'line', 479
    new $P24, 'ExceptionHandler'
    set_addr $P24, control_23
    $P24."handle_types"(57)
    push_eh $P24
    .lex "$rpast", param_25
    if has_param_26, optparam_92
    get_hll_global $P27, ["PAST"], "Block"
    $P28 = $P27."new"()
    set param_26, $P28
  optparam_92:
    .lex "$block", param_26
.annotate 'line', 480
    $P29 = root_new ['parrot';'Hash']
    .lex "%capnames", $P29
    find_lex $P30, "$rpast"
    $P31 = "capnames"($P30, 0)
    store_lex "%capnames", $P31
.annotate 'line', 481
    new $P32, "Integer"
    assign $P32, 0
    find_lex $P33, "%capnames"
    unless_null $P33, vivify_93
    $P33 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P33
  vivify_93:
    set $P33[""], $P32
.annotate 'line', 482
    get_hll_global $P34, ["PAST"], "Regex"
.annotate 'line', 483
    get_hll_global $P35, ["PAST"], "Regex"
    $P36 = $P35."new"("scan" :named("pasttype"))
    find_lex $P37, "$rpast"
.annotate 'line', 485
    get_hll_global $P38, ["PAST"], "Regex"
    $P39 = $P38."new"("pass" :named("pasttype"))
    find_lex $P40, "%capnames"
    $P41 = $P34."new"($P36, $P37, $P39, "concat" :named("pasttype"), $P40 :named("capnames"))
.annotate 'line', 482
    store_lex "$rpast", $P41
.annotate 'line', 489
    find_lex $P43, "$block"
    $P44 = $P43."symbol"(unicode:"$\x{a2}")
    if $P44, unless_42_end
    find_lex $P45, "$block"
    $P45."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
  unless_42_end:
.annotate 'line', 490
    find_lex $P47, "$block"
    $P48 = $P47."symbol"("$/")
    if $P48, unless_46_end
    find_lex $P49, "$block"
    $P49."symbol"("$/", "lexical" :named("scope"))
  unless_46_end:
.annotate 'line', 491
    find_lex $P50, "$block"
    find_lex $P51, "$rpast"
    $P50."push"($P51)
.annotate 'line', 492
    find_lex $P52, "$block"
    $P52."blocktype"("method")
    find_lex $P53, "$block"
.annotate 'line', 479
    .return ($P53)
  control_23:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P54, exception, "payload"
    .return ($P54)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "capnames"  :subid("14_1273884021.34483") :outer("11_1273884021.34483")
    .param pmc param_59
    .param pmc param_60
.annotate 'line', 496
    .const 'Sub' $P285 = "25_1273884021.34483" 
    capture_lex $P285
    .const 'Sub' $P222 = "22_1273884021.34483" 
    capture_lex $P222
    .const 'Sub' $P180 = "20_1273884021.34483" 
    capture_lex $P180
    .const 'Sub' $P138 = "18_1273884021.34483" 
    capture_lex $P138
    .const 'Sub' $P71 = "15_1273884021.34483" 
    capture_lex $P71
    new $P58, 'ExceptionHandler'
    set_addr $P58, control_57
    $P58."handle_types"(57)
    push_eh $P58
    .lex "$ast", param_59
    .lex "$count", param_60
.annotate 'line', 497
    $P61 = root_new ['parrot';'Hash']
    .lex "%capnames", $P61
.annotate 'line', 498
    new $P62, "Undef"
    .lex "$pasttype", $P62
.annotate 'line', 496
    find_lex $P63, "%capnames"
.annotate 'line', 498
    find_lex $P64, "$ast"
    $P65 = $P64."pasttype"()
    store_lex "$pasttype", $P65
.annotate 'line', 499
    find_lex $P67, "$pasttype"
    set $S68, $P67
    iseq $I69, $S68, "alt"
    if $I69, if_66
.annotate 'line', 512
    find_lex $P129, "$pasttype"
    set $S130, $P129
    iseq $I131, $S130, "concat"
    if $I131, if_128
.annotate 'line', 521
    find_lex $P173, "$pasttype"
    set $S174, $P173
    iseq $I175, $S174, "subrule"
    if $I175, if_172
    new $P171, 'Integer'
    set $P171, $I175
    goto if_172_end
  if_172:
    find_lex $P176, "$ast"
    $S177 = $P176."subtype"()
    iseq $I178, $S177, "capture"
    new $P171, 'Integer'
    set $P171, $I178
  if_172_end:
    if $P171, if_170
.annotate 'line', 534
    find_lex $P218, "$pasttype"
    set $S219, $P218
    iseq $I220, $S219, "subcapture"
    if $I220, if_217
.annotate 'line', 551
    find_lex $P281, "$pasttype"
    set $S282, $P281
    iseq $I283, $S282, "quant"
    unless $I283, if_280_end
    .const 'Sub' $P285 = "25_1273884021.34483" 
    capture_lex $P285
    $P285()
  if_280_end:
    goto if_217_end
  if_217:
.annotate 'line', 534
    .const 'Sub' $P222 = "22_1273884021.34483" 
    capture_lex $P222
    $P222()
  if_217_end:
    goto if_170_end
  if_170:
.annotate 'line', 521
    .const 'Sub' $P180 = "20_1273884021.34483" 
    capture_lex $P180
    $P180()
  if_170_end:
    goto if_128_end
  if_128:
.annotate 'line', 513
    find_lex $P133, "$ast"
    $P134 = $P133."list"()
    defined $I135, $P134
    unless $I135, for_undef_114
    iter $P132, $P134
    new $P168, 'ExceptionHandler'
    set_addr $P168, loop167_handler
    $P168."handle_types"(64, 66, 65)
    push_eh $P168
  loop167_test:
    unless $P132, loop167_done
    shift $P136, $P132
  loop167_redo:
    .const 'Sub' $P138 = "18_1273884021.34483" 
    capture_lex $P138
    $P138($P136)
  loop167_next:
    goto loop167_test
  loop167_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P169, exception, 'type'
    eq $P169, 64, loop167_next
    eq $P169, 66, loop167_redo
  loop167_done:
    pop_eh 
  for_undef_114:
  if_128_end:
.annotate 'line', 512
    goto if_66_end
  if_66:
.annotate 'line', 499
    .const 'Sub' $P71 = "15_1273884021.34483" 
    capture_lex $P71
    $P71()
  if_66_end:
.annotate 'line', 558
    find_lex $P306, "$count"
    find_lex $P307, "%capnames"
    unless_null $P307, vivify_134
    $P307 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P307
  vivify_134:
    set $P307[""], $P306
    find_lex $P308, "%capnames"
.annotate 'line', 496
    .return ($P308)
  control_57:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P309, exception, "payload"
    .return ($P309)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block284"  :anon :subid("25_1273884021.34483") :outer("14_1273884021.34483")
.annotate 'line', 551
    .const 'Sub' $P296 = "26_1273884021.34483" 
    capture_lex $P296
.annotate 'line', 552
    $P286 = root_new ['parrot';'Hash']
    .lex "%astcap", $P286
    find_lex $P287, "$ast"
    unless_null $P287, vivify_94
    $P287 = root_new ['parrot';'ResizablePMCArray']
  vivify_94:
    set $P288, $P287[0]
    unless_null $P288, vivify_95
    new $P288, "Undef"
  vivify_95:
    find_lex $P289, "$count"
    $P290 = "capnames"($P288, $P289)
    store_lex "%astcap", $P290
.annotate 'line', 553
    find_lex $P292, "%astcap"
    defined $I293, $P292
    unless $I293, for_undef_96
    iter $P291, $P292
    new $P302, 'ExceptionHandler'
    set_addr $P302, loop301_handler
    $P302."handle_types"(64, 66, 65)
    push_eh $P302
  loop301_test:
    unless $P291, loop301_done
    shift $P294, $P291
  loop301_redo:
    .const 'Sub' $P296 = "26_1273884021.34483" 
    capture_lex $P296
    $P296($P294)
  loop301_next:
    goto loop301_test
  loop301_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P303, exception, 'type'
    eq $P303, 64, loop301_next
    eq $P303, 66, loop301_redo
  loop301_done:
    pop_eh 
  for_undef_96:
.annotate 'line', 556
    find_lex $P304, "%astcap"
    unless_null $P304, vivify_98
    $P304 = root_new ['parrot';'Hash']
  vivify_98:
    set $P305, $P304[""]
    unless_null $P305, vivify_99
    new $P305, "Undef"
  vivify_99:
    store_lex "$count", $P305
.annotate 'line', 551
    .return ($P305)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block295"  :anon :subid("26_1273884021.34483") :outer("25_1273884021.34483")
    .param pmc param_297
.annotate 'line', 553
    .lex "$_", param_297
.annotate 'line', 554
    new $P298, "Integer"
    assign $P298, 2
    find_lex $P299, "$_"
    find_lex $P300, "%capnames"
    unless_null $P300, vivify_97
    $P300 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P300
  vivify_97:
    set $P300[$P299], $P298
.annotate 'line', 553
    .return ($P298)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block221"  :anon :subid("22_1273884021.34483") :outer("14_1273884021.34483")
.annotate 'line', 534
    .const 'Sub' $P262 = "24_1273884021.34483" 
    capture_lex $P262
    .const 'Sub' $P234 = "23_1273884021.34483" 
    capture_lex $P234
.annotate 'line', 535
    new $P223, "Undef"
    .lex "$name", $P223
.annotate 'line', 536
    $P224 = root_new ['parrot';'ResizablePMCArray']
    .lex "@names", $P224
.annotate 'line', 545
    $P225 = root_new ['parrot';'Hash']
    .lex "%x", $P225
.annotate 'line', 535
    find_lex $P226, "$ast"
    $P227 = $P226."name"()
    store_lex "$name", $P227
.annotate 'line', 536

            $P0 = find_lex '$name'
            $S0 = $P0
            $P228 = split '=', $S0
        
    store_lex "@names", $P228
.annotate 'line', 541
    find_lex $P230, "@names"
    defined $I231, $P230
    unless $I231, for_undef_100
    iter $P229, $P230
    new $P251, 'ExceptionHandler'
    set_addr $P251, loop250_handler
    $P251."handle_types"(64, 66, 65)
    push_eh $P251
  loop250_test:
    unless $P229, loop250_done
    shift $P232, $P229
  loop250_redo:
    .const 'Sub' $P234 = "23_1273884021.34483" 
    capture_lex $P234
    $P234($P232)
  loop250_next:
    goto loop250_test
  loop250_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P252, exception, 'type'
    eq $P252, 64, loop250_next
    eq $P252, 66, loop250_redo
  loop250_done:
    pop_eh 
  for_undef_100:
.annotate 'line', 545
    find_lex $P253, "$ast"
    unless_null $P253, vivify_102
    $P253 = root_new ['parrot';'ResizablePMCArray']
  vivify_102:
    set $P254, $P253[0]
    unless_null $P254, vivify_103
    new $P254, "Undef"
  vivify_103:
    find_lex $P255, "$count"
    $P256 = "capnames"($P254, $P255)
    store_lex "%x", $P256
.annotate 'line', 546
    find_lex $P258, "%x"
    defined $I259, $P258
    unless $I259, for_undef_104
    iter $P257, $P258
    new $P276, 'ExceptionHandler'
    set_addr $P276, loop275_handler
    $P276."handle_types"(64, 66, 65)
    push_eh $P276
  loop275_test:
    unless $P257, loop275_done
    shift $P260, $P257
  loop275_redo:
    .const 'Sub' $P262 = "24_1273884021.34483" 
    capture_lex $P262
    $P262($P260)
  loop275_next:
    goto loop275_test
  loop275_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P277, exception, 'type'
    eq $P277, 64, loop275_next
    eq $P277, 66, loop275_redo
  loop275_done:
    pop_eh 
  for_undef_104:
.annotate 'line', 549
    find_lex $P278, "%x"
    unless_null $P278, vivify_110
    $P278 = root_new ['parrot';'Hash']
  vivify_110:
    set $P279, $P278[""]
    unless_null $P279, vivify_111
    new $P279, "Undef"
  vivify_111:
    store_lex "$count", $P279
.annotate 'line', 534
    .return ($P279)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block233"  :anon :subid("23_1273884021.34483") :outer("22_1273884021.34483")
    .param pmc param_235
.annotate 'line', 541
    .lex "$_", param_235
.annotate 'line', 542
    find_lex $P239, "$_"
    set $S240, $P239
    iseq $I241, $S240, "0"
    unless $I241, unless_238
    new $P237, 'Integer'
    set $P237, $I241
    goto unless_238_end
  unless_238:
    find_lex $P242, "$_"
    set $N243, $P242
    isgt $I244, $N243, 0.0
    new $P237, 'Integer'
    set $P237, $I244
  unless_238_end:
    unless $P237, if_236_end
    find_lex $P245, "$_"
    add $P246, $P245, 1
    store_lex "$count", $P246
  if_236_end:
.annotate 'line', 543
    new $P247, "Integer"
    assign $P247, 1
    find_lex $P248, "$_"
    find_lex $P249, "%capnames"
    unless_null $P249, vivify_101
    $P249 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P249
  vivify_101:
    set $P249[$P248], $P247
.annotate 'line', 541
    .return ($P247)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block261"  :anon :subid("24_1273884021.34483") :outer("22_1273884021.34483")
    .param pmc param_263
.annotate 'line', 546
    .lex "$_", param_263
.annotate 'line', 547
    find_lex $P264, "$_"
    find_lex $P265, "%capnames"
    unless_null $P265, vivify_105
    $P265 = root_new ['parrot';'Hash']
  vivify_105:
    set $P266, $P265[$P264]
    unless_null $P266, vivify_106
    new $P266, "Undef"
  vivify_106:
    set $N267, $P266
    new $P268, 'Float'
    set $P268, $N267
    find_lex $P269, "$_"
    find_lex $P270, "%x"
    unless_null $P270, vivify_107
    $P270 = root_new ['parrot';'Hash']
  vivify_107:
    set $P271, $P270[$P269]
    unless_null $P271, vivify_108
    new $P271, "Undef"
  vivify_108:
    add $P272, $P268, $P271
    find_lex $P273, "$_"
    find_lex $P274, "%capnames"
    unless_null $P274, vivify_109
    $P274 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P274
  vivify_109:
    set $P274[$P273], $P272
.annotate 'line', 546
    .return ($P272)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block179"  :anon :subid("20_1273884021.34483") :outer("14_1273884021.34483")
.annotate 'line', 521
    .const 'Sub' $P198 = "21_1273884021.34483" 
    capture_lex $P198
.annotate 'line', 522
    new $P181, "Undef"
    .lex "$name", $P181
.annotate 'line', 524
    $P182 = root_new ['parrot';'ResizablePMCArray']
    .lex "@names", $P182
.annotate 'line', 522
    find_lex $P183, "$ast"
    $P184 = $P183."name"()
    store_lex "$name", $P184
.annotate 'line', 523
    find_lex $P186, "$name"
    set $S187, $P186
    iseq $I188, $S187, ""
    unless $I188, if_185_end
    find_lex $P189, "$count"
    store_lex "$name", $P189
    find_lex $P190, "$ast"
    find_lex $P191, "$name"
    $P190."name"($P191)
  if_185_end:
.annotate 'line', 524

            $P0 = find_lex '$name'
            $S0 = $P0
            $P192 = split '=', $S0
        
    store_lex "@names", $P192
.annotate 'line', 529
    find_lex $P194, "@names"
    defined $I195, $P194
    unless $I195, for_undef_112
    iter $P193, $P194
    new $P215, 'ExceptionHandler'
    set_addr $P215, loop214_handler
    $P215."handle_types"(64, 66, 65)
    push_eh $P215
  loop214_test:
    unless $P193, loop214_done
    shift $P196, $P193
  loop214_redo:
    .const 'Sub' $P198 = "21_1273884021.34483" 
    capture_lex $P198
    $P198($P196)
  loop214_next:
    goto loop214_test
  loop214_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P216, exception, 'type'
    eq $P216, 64, loop214_next
    eq $P216, 66, loop214_redo
  loop214_done:
    pop_eh 
  for_undef_112:
.annotate 'line', 521
    .return ($P193)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block197"  :anon :subid("21_1273884021.34483") :outer("20_1273884021.34483")
    .param pmc param_199
.annotate 'line', 529
    .lex "$_", param_199
.annotate 'line', 530
    find_lex $P203, "$_"
    set $S204, $P203
    iseq $I205, $S204, "0"
    unless $I205, unless_202
    new $P201, 'Integer'
    set $P201, $I205
    goto unless_202_end
  unless_202:
    find_lex $P206, "$_"
    set $N207, $P206
    isgt $I208, $N207, 0.0
    new $P201, 'Integer'
    set $P201, $I208
  unless_202_end:
    unless $P201, if_200_end
    find_lex $P209, "$_"
    add $P210, $P209, 1
    store_lex "$count", $P210
  if_200_end:
.annotate 'line', 531
    new $P211, "Integer"
    assign $P211, 1
    find_lex $P212, "$_"
    find_lex $P213, "%capnames"
    unless_null $P213, vivify_113
    $P213 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P213
  vivify_113:
    set $P213[$P212], $P211
.annotate 'line', 529
    .return ($P211)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block137"  :anon :subid("18_1273884021.34483") :outer("14_1273884021.34483")
    .param pmc param_140
.annotate 'line', 513
    .const 'Sub' $P149 = "19_1273884021.34483" 
    capture_lex $P149
.annotate 'line', 514
    $P139 = root_new ['parrot';'Hash']
    .lex "%x", $P139
    .lex "$_", param_140
    find_lex $P141, "$_"
    find_lex $P142, "$count"
    $P143 = "capnames"($P141, $P142)
    store_lex "%x", $P143
.annotate 'line', 515
    find_lex $P145, "%x"
    defined $I146, $P145
    unless $I146, for_undef_115
    iter $P144, $P145
    new $P163, 'ExceptionHandler'
    set_addr $P163, loop162_handler
    $P163."handle_types"(64, 66, 65)
    push_eh $P163
  loop162_test:
    unless $P144, loop162_done
    shift $P147, $P144
  loop162_redo:
    .const 'Sub' $P149 = "19_1273884021.34483" 
    capture_lex $P149
    $P149($P147)
  loop162_next:
    goto loop162_test
  loop162_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P164, exception, 'type'
    eq $P164, 64, loop162_next
    eq $P164, 66, loop162_redo
  loop162_done:
    pop_eh 
  for_undef_115:
.annotate 'line', 518
    find_lex $P165, "%x"
    unless_null $P165, vivify_121
    $P165 = root_new ['parrot';'Hash']
  vivify_121:
    set $P166, $P165[""]
    unless_null $P166, vivify_122
    new $P166, "Undef"
  vivify_122:
    store_lex "$count", $P166
.annotate 'line', 513
    .return ($P166)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block148"  :anon :subid("19_1273884021.34483") :outer("18_1273884021.34483")
    .param pmc param_150
.annotate 'line', 515
    .lex "$_", param_150
.annotate 'line', 516
    find_lex $P151, "$_"
    find_lex $P152, "%capnames"
    unless_null $P152, vivify_116
    $P152 = root_new ['parrot';'Hash']
  vivify_116:
    set $P153, $P152[$P151]
    unless_null $P153, vivify_117
    new $P153, "Undef"
  vivify_117:
    set $N154, $P153
    new $P155, 'Float'
    set $P155, $N154
    find_lex $P156, "$_"
    find_lex $P157, "%x"
    unless_null $P157, vivify_118
    $P157 = root_new ['parrot';'Hash']
  vivify_118:
    set $P158, $P157[$P156]
    unless_null $P158, vivify_119
    new $P158, "Undef"
  vivify_119:
    add $P159, $P155, $P158
    find_lex $P160, "$_"
    find_lex $P161, "%capnames"
    unless_null $P161, vivify_120
    $P161 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P161
  vivify_120:
    set $P161[$P160], $P159
.annotate 'line', 515
    .return ($P159)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block70"  :anon :subid("15_1273884021.34483") :outer("14_1273884021.34483")
.annotate 'line', 499
    .const 'Sub' $P80 = "16_1273884021.34483" 
    capture_lex $P80
.annotate 'line', 500
    new $P72, "Undef"
    .lex "$max", $P72
    find_lex $P73, "$count"
    store_lex "$max", $P73
.annotate 'line', 501
    find_lex $P75, "$ast"
    $P76 = $P75."list"()
    defined $I77, $P76
    unless $I77, for_undef_123
    iter $P74, $P76
    new $P125, 'ExceptionHandler'
    set_addr $P125, loop124_handler
    $P125."handle_types"(64, 66, 65)
    push_eh $P125
  loop124_test:
    unless $P74, loop124_done
    shift $P78, $P74
  loop124_redo:
    .const 'Sub' $P80 = "16_1273884021.34483" 
    capture_lex $P80
    $P80($P78)
  loop124_next:
    goto loop124_test
  loop124_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P126, exception, 'type'
    eq $P126, 64, loop124_next
    eq $P126, 66, loop124_redo
  loop124_done:
    pop_eh 
  for_undef_123:
.annotate 'line', 510
    find_lex $P127, "$max"
    store_lex "$count", $P127
.annotate 'line', 499
    .return ($P127)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block79"  :anon :subid("16_1273884021.34483") :outer("15_1273884021.34483")
    .param pmc param_82
.annotate 'line', 501
    .const 'Sub' $P91 = "17_1273884021.34483" 
    capture_lex $P91
.annotate 'line', 502
    $P81 = root_new ['parrot';'Hash']
    .lex "%x", $P81
    .lex "$_", param_82
    find_lex $P83, "$_"
    find_lex $P84, "$count"
    $P85 = "capnames"($P83, $P84)
    store_lex "%x", $P85
.annotate 'line', 503
    find_lex $P87, "%x"
    defined $I88, $P87
    unless $I88, for_undef_124
    iter $P86, $P87
    new $P112, 'ExceptionHandler'
    set_addr $P112, loop111_handler
    $P112."handle_types"(64, 66, 65)
    push_eh $P112
  loop111_test:
    unless $P86, loop111_done
    shift $P89, $P86
  loop111_redo:
    .const 'Sub' $P91 = "17_1273884021.34483" 
    capture_lex $P91
    $P91($P89)
  loop111_next:
    goto loop111_test
  loop111_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P113, exception, 'type'
    eq $P113, 64, loop111_next
    eq $P113, 66, loop111_redo
  loop111_done:
    pop_eh 
  for_undef_124:
.annotate 'line', 508
    find_lex $P116, "%x"
    unless_null $P116, vivify_130
    $P116 = root_new ['parrot';'Hash']
  vivify_130:
    set $P117, $P116[""]
    unless_null $P117, vivify_131
    new $P117, "Undef"
  vivify_131:
    set $N118, $P117
    find_lex $P119, "$max"
    set $N120, $P119
    isgt $I121, $N118, $N120
    if $I121, if_115
    new $P114, 'Integer'
    set $P114, $I121
    goto if_115_end
  if_115:
    find_lex $P122, "%x"
    unless_null $P122, vivify_132
    $P122 = root_new ['parrot';'Hash']
  vivify_132:
    set $P123, $P122[""]
    unless_null $P123, vivify_133
    new $P123, "Undef"
  vivify_133:
    store_lex "$max", $P123
    set $P114, $P123
  if_115_end:
.annotate 'line', 501
    .return ($P114)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block90"  :anon :subid("17_1273884021.34483") :outer("16_1273884021.34483")
    .param pmc param_92
.annotate 'line', 503
    .lex "$_", param_92
.annotate 'line', 504
    find_lex $P97, "$_"
    find_lex $P98, "%capnames"
    unless_null $P98, vivify_125
    $P98 = root_new ['parrot';'Hash']
  vivify_125:
    set $P99, $P98[$P97]
    unless_null $P99, vivify_126
    new $P99, "Undef"
  vivify_126:
    set $N100, $P99
    islt $I101, $N100, 2.0
    if $I101, if_96
    new $P95, 'Integer'
    set $P95, $I101
    goto if_96_end
  if_96:
    find_lex $P102, "$_"
    find_lex $P103, "%x"
    unless_null $P103, vivify_127
    $P103 = root_new ['parrot';'Hash']
  vivify_127:
    set $P104, $P103[$P102]
    unless_null $P104, vivify_128
    new $P104, "Undef"
  vivify_128:
    set $N105, $P104
    iseq $I106, $N105, 1.0
    new $P95, 'Integer'
    set $P95, $I106
  if_96_end:
    if $P95, if_94
    new $P108, "Integer"
    assign $P108, 2
    set $P93, $P108
    goto if_94_end
  if_94:
    new $P107, "Integer"
    assign $P107, 1
    set $P93, $P107
  if_94_end:
.annotate 'line', 505
    find_lex $P109, "$_"
    find_lex $P110, "%capnames"
    unless_null $P110, vivify_129
    $P110 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P110
  vivify_129:
    set $P110[$P109], $P93
.annotate 'line', 503
    .return ($P93)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backmod"  :subid("27_1273884021.34483") :outer("11_1273884021.34483")
    .param pmc param_314
    .param pmc param_315
.annotate 'line', 562
    new $P313, 'ExceptionHandler'
    set_addr $P313, control_312
    $P313."handle_types"(57)
    push_eh $P313
    .lex "$ast", param_314
    .lex "$backmod", param_315
.annotate 'line', 563
    find_lex $P317, "$backmod"
    set $S318, $P317
    iseq $I319, $S318, ":"
    if $I319, if_316
.annotate 'line', 564
    find_lex $P324, "$backmod"
    set $S325, $P324
    iseq $I326, $S325, ":?"
    unless $I326, unless_323
    new $P322, 'Integer'
    set $P322, $I326
    goto unless_323_end
  unless_323:
    find_lex $P327, "$backmod"
    set $S328, $P327
    iseq $I329, $S328, "?"
    new $P322, 'Integer'
    set $P322, $I329
  unless_323_end:
    if $P322, if_321
.annotate 'line', 565
    find_lex $P334, "$backmod"
    set $S335, $P334
    iseq $I336, $S335, ":!"
    unless $I336, unless_333
    new $P332, 'Integer'
    set $P332, $I336
    goto unless_333_end
  unless_333:
    find_lex $P337, "$backmod"
    set $S338, $P337
    iseq $I339, $S338, "!"
    new $P332, 'Integer'
    set $P332, $I339
  unless_333_end:
    unless $P332, if_331_end
    find_lex $P340, "$ast"
    $P340."backtrack"("g")
  if_331_end:
    goto if_321_end
  if_321:
.annotate 'line', 564
    find_lex $P330, "$ast"
    $P330."backtrack"("f")
  if_321_end:
    goto if_316_end
  if_316:
.annotate 'line', 563
    find_lex $P320, "$ast"
    $P320."backtrack"("r")
  if_316_end:
    find_lex $P341, "$ast"
.annotate 'line', 562
    .return ($P341)
  control_312:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P342, exception, "payload"
    .return ($P342)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "subrule_alias"  :subid("28_1273884021.34483") :outer("11_1273884021.34483")
    .param pmc param_347
    .param pmc param_348
.annotate 'line', 569
    new $P346, 'ExceptionHandler'
    set_addr $P346, control_345
    $P346."handle_types"(57)
    push_eh $P346
    .lex "$past", param_347
    .lex "$name", param_348
.annotate 'line', 570
    find_lex $P350, "$past"
    $S351 = $P350."name"()
    isgt $I352, $S351, ""
    if $I352, if_349
.annotate 'line', 571
    find_lex $P359, "$past"
    find_lex $P360, "$name"
    $P359."name"($P360)
    goto if_349_end
  if_349:
.annotate 'line', 570
    find_lex $P353, "$past"
    find_lex $P354, "$name"
    concat $P355, $P354, "="
    find_lex $P356, "$past"
    $S357 = $P356."name"()
    concat $P358, $P355, $S357
    $P353."name"($P358)
  if_349_end:
.annotate 'line', 572
    find_lex $P361, "$past"
    $P362 = $P361."subtype"("capture")
.annotate 'line', 569
    .return ($P362)
  control_345:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P363, exception, "payload"
    .return ($P363)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "arg"  :subid("29_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_370
.annotate 'line', 14
    new $P369, 'ExceptionHandler'
    set_addr $P369, control_368
    $P369."handle_types"(57)
    push_eh $P369
    .lex "self", self
    .lex "$/", param_370
.annotate 'line', 15
    find_lex $P371, "$/"
    find_lex $P374, "$/"
    unless_null $P374, vivify_135
    $P374 = root_new ['parrot';'Hash']
  vivify_135:
    set $P375, $P374["quote_EXPR"]
    unless_null $P375, vivify_136
    new $P375, "Undef"
  vivify_136:
    if $P375, if_373
    find_lex $P379, "$/"
    unless_null $P379, vivify_137
    $P379 = root_new ['parrot';'Hash']
  vivify_137:
    set $P380, $P379["val"]
    unless_null $P380, vivify_138
    new $P380, "Undef"
  vivify_138:
    set $N381, $P380
    new $P372, 'Float'
    set $P372, $N381
    goto if_373_end
  if_373:
    find_lex $P376, "$/"
    unless_null $P376, vivify_139
    $P376 = root_new ['parrot';'Hash']
  vivify_139:
    set $P377, $P376["quote_EXPR"]
    unless_null $P377, vivify_140
    new $P377, "Undef"
  vivify_140:
    $P378 = $P377."ast"()
    set $P372, $P378
  if_373_end:
    $P382 = $P371."!make"($P372)
.annotate 'line', 14
    .return ($P382)
  control_368:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P383, exception, "payload"
    .return ($P383)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "arglist"  :subid("30_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_387
.annotate 'line', 18
    .const 'Sub' $P397 = "31_1273884021.34483" 
    capture_lex $P397
    new $P386, 'ExceptionHandler'
    set_addr $P386, control_385
    $P386."handle_types"(57)
    push_eh $P386
    .lex "self", self
    .lex "$/", param_387
.annotate 'line', 19
    new $P388, "Undef"
    .lex "$past", $P388
    get_hll_global $P389, ["PAST"], "Op"
    $P390 = $P389."new"("list" :named("pasttype"))
    store_lex "$past", $P390
.annotate 'line', 20
    find_lex $P392, "$/"
    unless_null $P392, vivify_141
    $P392 = root_new ['parrot';'Hash']
  vivify_141:
    set $P393, $P392["arg"]
    unless_null $P393, vivify_142
    new $P393, "Undef"
  vivify_142:
    defined $I394, $P393
    unless $I394, for_undef_143
    iter $P391, $P393
    new $P404, 'ExceptionHandler'
    set_addr $P404, loop403_handler
    $P404."handle_types"(64, 66, 65)
    push_eh $P404
  loop403_test:
    unless $P391, loop403_done
    shift $P395, $P391
  loop403_redo:
    .const 'Sub' $P397 = "31_1273884021.34483" 
    capture_lex $P397
    $P397($P395)
  loop403_next:
    goto loop403_test
  loop403_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P405, exception, 'type'
    eq $P405, 64, loop403_next
    eq $P405, 66, loop403_redo
  loop403_done:
    pop_eh 
  for_undef_143:
.annotate 'line', 21
    find_lex $P406, "$/"
    find_lex $P407, "$past"
    $P408 = $P406."!make"($P407)
.annotate 'line', 18
    .return ($P408)
  control_385:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P409, exception, "payload"
    .return ($P409)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block396"  :anon :subid("31_1273884021.34483") :outer("30_1273884021.34483")
    .param pmc param_398
.annotate 'line', 20
    .lex "$_", param_398
    find_lex $P399, "$past"
    find_lex $P400, "$_"
    $P401 = $P400."ast"()
    $P402 = $P399."push"($P401)
    .return ($P402)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "TOP"  :subid("32_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_413
.annotate 'line', 24
    new $P412, 'ExceptionHandler'
    set_addr $P412, control_411
    $P412."handle_types"(57)
    push_eh $P412
    .lex "self", self
    .lex "$/", param_413
.annotate 'line', 25
    new $P414, "Undef"
    .lex "$past", $P414
    find_lex $P415, "$/"
    unless_null $P415, vivify_144
    $P415 = root_new ['parrot';'Hash']
  vivify_144:
    set $P416, $P415["nibbler"]
    unless_null $P416, vivify_145
    new $P416, "Undef"
  vivify_145:
    $P417 = $P416."ast"()
    $P418 = "buildsub"($P417)
    store_lex "$past", $P418
.annotate 'line', 26
    find_lex $P419, "$past"
    find_lex $P420, "$/"
    $P419."node"($P420)
.annotate 'line', 27
    find_lex $P421, "$/"
    find_lex $P422, "$past"
    $P423 = $P421."!make"($P422)
.annotate 'line', 24
    .return ($P423)
  control_411:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P424, exception, "payload"
    .return ($P424)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "nibbler"  :subid("33_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_428
    .param pmc param_429 :optional
    .param int has_param_429 :opt_flag
.annotate 'line', 30
    .const 'Sub' $P463 = "35_1273884021.34483" 
    capture_lex $P463
    .const 'Sub' $P437 = "34_1273884021.34483" 
    capture_lex $P437
    new $P427, 'ExceptionHandler'
    set_addr $P427, control_426
    $P427."handle_types"(57)
    push_eh $P427
    .lex "self", self
    .lex "$/", param_428
    if has_param_429, optparam_146
    new $P430, "Undef"
    set param_429, $P430
  optparam_146:
    .lex "$key", param_429
.annotate 'line', 42
    new $P431, "Undef"
    .lex "$past", $P431
.annotate 'line', 31
    find_lex $P433, "$key"
    set $S434, $P433
    iseq $I435, $S434, "open"
    unless $I435, if_432_end
    .const 'Sub' $P437 = "34_1273884021.34483" 
    capture_lex $P437
    $P437()
  if_432_end:
.annotate 'line', 41
    get_global $P447, "@MODIFIERS"
    $P447."shift"()
    find_lex $P448, "$past"
.annotate 'line', 43
    find_lex $P450, "$/"
    unless_null $P450, vivify_149
    $P450 = root_new ['parrot';'Hash']
  vivify_149:
    set $P451, $P450["termish"]
    unless_null $P451, vivify_150
    new $P451, "Undef"
  vivify_150:
    set $N452, $P451
    isgt $I453, $N452, 1.0
    if $I453, if_449
.annotate 'line', 50
    find_lex $P472, "$/"
    unless_null $P472, vivify_151
    $P472 = root_new ['parrot';'Hash']
  vivify_151:
    set $P473, $P472["termish"]
    unless_null $P473, vivify_152
    $P473 = root_new ['parrot';'ResizablePMCArray']
  vivify_152:
    set $P474, $P473[0]
    unless_null $P474, vivify_153
    new $P474, "Undef"
  vivify_153:
    $P475 = $P474."ast"()
    store_lex "$past", $P475
.annotate 'line', 49
    goto if_449_end
  if_449:
.annotate 'line', 44
    get_hll_global $P454, ["PAST"], "Regex"
    find_lex $P455, "$/"
    $P456 = $P454."new"("alt" :named("pasttype"), $P455 :named("node"))
    store_lex "$past", $P456
.annotate 'line', 45
    find_lex $P458, "$/"
    unless_null $P458, vivify_154
    $P458 = root_new ['parrot';'Hash']
  vivify_154:
    set $P459, $P458["termish"]
    unless_null $P459, vivify_155
    new $P459, "Undef"
  vivify_155:
    defined $I460, $P459
    unless $I460, for_undef_156
    iter $P457, $P459
    new $P470, 'ExceptionHandler'
    set_addr $P470, loop469_handler
    $P470."handle_types"(64, 66, 65)
    push_eh $P470
  loop469_test:
    unless $P457, loop469_done
    shift $P461, $P457
  loop469_redo:
    .const 'Sub' $P463 = "35_1273884021.34483" 
    capture_lex $P463
    $P463($P461)
  loop469_next:
    goto loop469_test
  loop469_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P471, exception, 'type'
    eq $P471, 64, loop469_next
    eq $P471, 66, loop469_redo
  loop469_done:
    pop_eh 
  for_undef_156:
  if_449_end:
.annotate 'line', 52
    find_lex $P476, "$/"
    find_lex $P477, "$past"
    $P478 = $P476."!make"($P477)
.annotate 'line', 30
    .return ($P478)
  control_426:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P479, exception, "payload"
    .return ($P479)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block436"  :anon :subid("34_1273884021.34483") :outer("33_1273884021.34483")
.annotate 'line', 32
    $P438 = root_new ['parrot';'Hash']
    .lex "%old", $P438
.annotate 'line', 33
    $P439 = root_new ['parrot';'Hash']
    .lex "%new", $P439
.annotate 'line', 32
    get_global $P440, "@MODIFIERS"
    unless_null $P440, vivify_147
    $P440 = root_new ['parrot';'ResizablePMCArray']
  vivify_147:
    set $P441, $P440[0]
    unless_null $P441, vivify_148
    new $P441, "Undef"
  vivify_148:
    store_lex "%old", $P441
.annotate 'line', 33

                       $P0 = find_lex '%old'
                       $P442 = clone $P0
                   
    store_lex "%new", $P442
.annotate 'line', 37
    get_global $P443, "@MODIFIERS"
    find_lex $P444, "%new"
    $P443."unshift"($P444)
.annotate 'line', 38
    new $P445, "Exception"
    set $P445['type'], 57
    new $P446, "Integer"
    assign $P446, 1
    setattribute $P445, 'payload', $P446
    throw $P445
.annotate 'line', 31
    .return ()
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block462"  :anon :subid("35_1273884021.34483") :outer("33_1273884021.34483")
    .param pmc param_464
.annotate 'line', 45
    .lex "$_", param_464
.annotate 'line', 46
    find_lex $P465, "$past"
    find_lex $P466, "$_"
    $P467 = $P466."ast"()
    $P468 = $P465."push"($P467)
.annotate 'line', 45
    .return ($P468)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "termish"  :subid("36_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_483
.annotate 'line', 55
    .const 'Sub' $P496 = "37_1273884021.34483" 
    capture_lex $P496
    new $P482, 'ExceptionHandler'
    set_addr $P482, control_481
    $P482."handle_types"(57)
    push_eh $P482
    .lex "self", self
    .lex "$/", param_483
.annotate 'line', 56
    new $P484, "Undef"
    .lex "$past", $P484
.annotate 'line', 57
    new $P485, "Undef"
    .lex "$lastlit", $P485
.annotate 'line', 56
    get_hll_global $P486, ["PAST"], "Regex"
    find_lex $P487, "$/"
    $P488 = $P486."new"("concat" :named("pasttype"), $P487 :named("node"))
    store_lex "$past", $P488
.annotate 'line', 57
    new $P489, "Integer"
    assign $P489, 0
    store_lex "$lastlit", $P489
.annotate 'line', 58
    find_lex $P491, "$/"
    unless_null $P491, vivify_157
    $P491 = root_new ['parrot';'Hash']
  vivify_157:
    set $P492, $P491["noun"]
    unless_null $P492, vivify_158
    new $P492, "Undef"
  vivify_158:
    defined $I493, $P492
    unless $I493, for_undef_159
    iter $P490, $P492
    new $P542, 'ExceptionHandler'
    set_addr $P542, loop541_handler
    $P542."handle_types"(64, 66, 65)
    push_eh $P542
  loop541_test:
    unless $P490, loop541_done
    shift $P494, $P490
  loop541_redo:
    .const 'Sub' $P496 = "37_1273884021.34483" 
    capture_lex $P496
    $P496($P494)
  loop541_next:
    goto loop541_test
  loop541_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P543, exception, 'type'
    eq $P543, 64, loop541_next
    eq $P543, 66, loop541_redo
  loop541_done:
    pop_eh 
  for_undef_159:
.annotate 'line', 73
    find_lex $P544, "$/"
    find_lex $P545, "$past"
    $P546 = $P544."!make"($P545)
.annotate 'line', 55
    .return ($P546)
  control_481:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P547, exception, "payload"
    .return ($P547)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block495"  :anon :subid("37_1273884021.34483") :outer("36_1273884021.34483")
    .param pmc param_498
.annotate 'line', 59
    new $P497, "Undef"
    .lex "$ast", $P497
    .lex "$_", param_498
    find_lex $P499, "$_"
    $P500 = $P499."ast"()
    store_lex "$ast", $P500
.annotate 'line', 60
    find_lex $P503, "$ast"
    if $P503, if_502
    set $P501, $P503
    goto if_502_end
  if_502:
.annotate 'line', 61
    find_lex $P510, "$lastlit"
    if $P510, if_509
    set $P508, $P510
    goto if_509_end
  if_509:
    find_lex $P511, "$ast"
    $S512 = $P511."pasttype"()
    iseq $I513, $S512, "literal"
    new $P508, 'Integer'
    set $P508, $I513
  if_509_end:
    if $P508, if_507
    set $P506, $P508
    goto if_507_end
  if_507:
.annotate 'line', 62
    get_hll_global $P514, ["PAST"], "Node"
    find_lex $P515, "$ast"
    unless_null $P515, vivify_160
    $P515 = root_new ['parrot';'ResizablePMCArray']
  vivify_160:
    set $P516, $P515[0]
    unless_null $P516, vivify_161
    new $P516, "Undef"
  vivify_161:
    $P517 = $P514."ACCEPTS"($P516)
    isfalse $I518, $P517
    new $P506, 'Integer'
    set $P506, $I518
  if_507_end:
    if $P506, if_505
.annotate 'line', 66
    find_lex $P525, "$past"
    find_lex $P526, "$ast"
    $P525."push"($P526)
.annotate 'line', 67
    find_lex $P531, "$ast"
    $S532 = $P531."pasttype"()
    iseq $I533, $S532, "literal"
    if $I533, if_530
    new $P529, 'Integer'
    set $P529, $I533
    goto if_530_end
  if_530:
.annotate 'line', 68
    get_hll_global $P534, ["PAST"], "Node"
    find_lex $P535, "$ast"
    unless_null $P535, vivify_162
    $P535 = root_new ['parrot';'ResizablePMCArray']
  vivify_162:
    set $P536, $P535[0]
    unless_null $P536, vivify_163
    new $P536, "Undef"
  vivify_163:
    $P537 = $P534."ACCEPTS"($P536)
    isfalse $I538, $P537
    new $P529, 'Integer'
    set $P529, $I538
  if_530_end:
    if $P529, if_528
    new $P540, "Integer"
    assign $P540, 0
    set $P527, $P540
    goto if_528_end
  if_528:
    find_lex $P539, "$ast"
    set $P527, $P539
  if_528_end:
.annotate 'line', 69
    store_lex "$lastlit", $P527
.annotate 'line', 65
    set $P504, $P527
.annotate 'line', 62
    goto if_505_end
  if_505:
.annotate 'line', 63
    find_lex $P519, "$lastlit"
    unless_null $P519, vivify_164
    $P519 = root_new ['parrot';'ResizablePMCArray']
  vivify_164:
    set $P520, $P519[0]
    unless_null $P520, vivify_165
    new $P520, "Undef"
  vivify_165:
    find_lex $P521, "$ast"
    unless_null $P521, vivify_166
    $P521 = root_new ['parrot';'ResizablePMCArray']
  vivify_166:
    set $P522, $P521[0]
    unless_null $P522, vivify_167
    new $P522, "Undef"
  vivify_167:
    concat $P523, $P520, $P522
    find_lex $P524, "$lastlit"
    unless_null $P524, vivify_168
    $P524 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$lastlit", $P524
  vivify_168:
    set $P524[0], $P523
.annotate 'line', 62
    set $P504, $P523
  if_505_end:
.annotate 'line', 60
    set $P501, $P504
  if_502_end:
.annotate 'line', 58
    .return ($P501)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantified_atom"  :subid("38_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_551
.annotate 'line', 76
    .const 'Sub' $P560 = "39_1273884021.34483" 
    capture_lex $P560
    new $P550, 'ExceptionHandler'
    set_addr $P550, control_549
    $P550."handle_types"(57)
    push_eh $P550
    .lex "self", self
    .lex "$/", param_551
.annotate 'line', 77
    new $P552, "Undef"
    .lex "$past", $P552
    find_lex $P553, "$/"
    unless_null $P553, vivify_169
    $P553 = root_new ['parrot';'Hash']
  vivify_169:
    set $P554, $P553["atom"]
    unless_null $P554, vivify_170
    new $P554, "Undef"
  vivify_170:
    $P555 = $P554."ast"()
    store_lex "$past", $P555
.annotate 'line', 78
    find_lex $P557, "$/"
    unless_null $P557, vivify_171
    $P557 = root_new ['parrot';'Hash']
  vivify_171:
    set $P558, $P557["quantifier"]
    unless_null $P558, vivify_172
    new $P558, "Undef"
  vivify_172:
    if $P558, if_556
.annotate 'line', 84
    find_lex $P574, "$/"
    unless_null $P574, vivify_173
    $P574 = root_new ['parrot';'Hash']
  vivify_173:
    set $P575, $P574["backmod"]
    unless_null $P575, vivify_174
    $P575 = root_new ['parrot';'ResizablePMCArray']
  vivify_174:
    set $P576, $P575[0]
    unless_null $P576, vivify_175
    new $P576, "Undef"
  vivify_175:
    unless $P576, if_573_end
    find_lex $P577, "$past"
    find_lex $P578, "$/"
    unless_null $P578, vivify_176
    $P578 = root_new ['parrot';'Hash']
  vivify_176:
    set $P579, $P578["backmod"]
    unless_null $P579, vivify_177
    $P579 = root_new ['parrot';'ResizablePMCArray']
  vivify_177:
    set $P580, $P579[0]
    unless_null $P580, vivify_178
    new $P580, "Undef"
  vivify_178:
    "backmod"($P577, $P580)
  if_573_end:
    goto if_556_end
  if_556:
.annotate 'line', 78
    .const 'Sub' $P560 = "39_1273884021.34483" 
    capture_lex $P560
    $P560()
  if_556_end:
.annotate 'line', 85
    find_lex $P586, "$past"
    if $P586, if_585
    set $P584, $P586
    goto if_585_end
  if_585:
    find_lex $P587, "$past"
    $P588 = $P587."backtrack"()
    isfalse $I589, $P588
    new $P584, 'Integer'
    set $P584, $I589
  if_585_end:
    if $P584, if_583
    set $P582, $P584
    goto if_583_end
  if_583:
    get_global $P590, "@MODIFIERS"
    unless_null $P590, vivify_182
    $P590 = root_new ['parrot';'ResizablePMCArray']
  vivify_182:
    set $P591, $P590[0]
    unless_null $P591, vivify_183
    $P591 = root_new ['parrot';'Hash']
  vivify_183:
    set $P592, $P591["r"]
    unless_null $P592, vivify_184
    new $P592, "Undef"
  vivify_184:
    set $P582, $P592
  if_583_end:
    unless $P582, if_581_end
.annotate 'line', 86
    find_lex $P593, "$past"
    $P593."backtrack"("r")
  if_581_end:
.annotate 'line', 88
    find_lex $P594, "$/"
    find_lex $P595, "$past"
    $P596 = $P594."!make"($P595)
.annotate 'line', 76
    .return ($P596)
  control_549:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P597, exception, "payload"
    .return ($P597)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block559"  :anon :subid("39_1273884021.34483") :outer("38_1273884021.34483")
.annotate 'line', 80
    new $P561, "Undef"
    .lex "$qast", $P561
.annotate 'line', 79
    find_lex $P563, "$past"
    isfalse $I564, $P563
    unless $I564, if_562_end
    find_lex $P565, "$/"
    $P565."panic"("Can't quantify zero-width atom")
  if_562_end:
.annotate 'line', 80
    find_lex $P566, "$/"
    unless_null $P566, vivify_179
    $P566 = root_new ['parrot';'Hash']
  vivify_179:
    set $P567, $P566["quantifier"]
    unless_null $P567, vivify_180
    $P567 = root_new ['parrot';'ResizablePMCArray']
  vivify_180:
    set $P568, $P567[0]
    unless_null $P568, vivify_181
    new $P568, "Undef"
  vivify_181:
    $P569 = $P568."ast"()
    store_lex "$qast", $P569
.annotate 'line', 81
    find_lex $P570, "$qast"
    find_lex $P571, "$past"
    $P570."unshift"($P571)
.annotate 'line', 82
    find_lex $P572, "$qast"
    store_lex "$past", $P572
.annotate 'line', 78
    .return ($P572)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "atom"  :subid("40_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_601
.annotate 'line', 91
    new $P600, 'ExceptionHandler'
    set_addr $P600, control_599
    $P600."handle_types"(57)
    push_eh $P600
    .lex "self", self
    .lex "$/", param_601
.annotate 'line', 92
    new $P602, "Undef"
    .lex "$past", $P602
.annotate 'line', 91
    find_lex $P603, "$past"
.annotate 'line', 93
    find_lex $P605, "$/"
    unless_null $P605, vivify_185
    $P605 = root_new ['parrot';'Hash']
  vivify_185:
    set $P606, $P605["metachar"]
    unless_null $P606, vivify_186
    new $P606, "Undef"
  vivify_186:
    if $P606, if_604
.annotate 'line', 95
    get_hll_global $P610, ["PAST"], "Regex"
    find_lex $P611, "$/"
    set $S612, $P611
    find_lex $P613, "$/"
    $P614 = $P610."new"($S612, "literal" :named("pasttype"), $P613 :named("node"))
    store_lex "$past", $P614
.annotate 'line', 96
    get_global $P616, "@MODIFIERS"
    unless_null $P616, vivify_187
    $P616 = root_new ['parrot';'ResizablePMCArray']
  vivify_187:
    set $P617, $P616[0]
    unless_null $P617, vivify_188
    $P617 = root_new ['parrot';'Hash']
  vivify_188:
    set $P618, $P617["i"]
    unless_null $P618, vivify_189
    new $P618, "Undef"
  vivify_189:
    unless $P618, if_615_end
    find_lex $P619, "$past"
    $P619."subtype"("ignorecase")
  if_615_end:
.annotate 'line', 94
    goto if_604_end
  if_604:
.annotate 'line', 93
    find_lex $P607, "$/"
    unless_null $P607, vivify_190
    $P607 = root_new ['parrot';'Hash']
  vivify_190:
    set $P608, $P607["metachar"]
    unless_null $P608, vivify_191
    new $P608, "Undef"
  vivify_191:
    $P609 = $P608."ast"()
    store_lex "$past", $P609
  if_604_end:
.annotate 'line', 98
    find_lex $P620, "$/"
    find_lex $P621, "$past"
    $P622 = $P620."!make"($P621)
.annotate 'line', 91
    .return ($P622)
  control_599:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P623, exception, "payload"
    .return ($P623)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<*>"  :subid("41_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_627
.annotate 'line', 101
    new $P626, 'ExceptionHandler'
    set_addr $P626, control_625
    $P626."handle_types"(57)
    push_eh $P626
    .lex "self", self
    .lex "$/", param_627
.annotate 'line', 102
    new $P628, "Undef"
    .lex "$past", $P628
    get_hll_global $P629, ["PAST"], "Regex"
    find_lex $P630, "$/"
    $P631 = $P629."new"("quant" :named("pasttype"), $P630 :named("node"))
    store_lex "$past", $P631
.annotate 'line', 103
    find_lex $P632, "$/"
    find_lex $P633, "$past"
    find_lex $P634, "$/"
    unless_null $P634, vivify_192
    $P634 = root_new ['parrot';'Hash']
  vivify_192:
    set $P635, $P634["backmod"]
    unless_null $P635, vivify_193
    new $P635, "Undef"
  vivify_193:
    $P636 = "backmod"($P633, $P635)
    $P637 = $P632."!make"($P636)
.annotate 'line', 101
    .return ($P637)
  control_625:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P638, exception, "payload"
    .return ($P638)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<+>"  :subid("42_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_642
.annotate 'line', 106
    new $P641, 'ExceptionHandler'
    set_addr $P641, control_640
    $P641."handle_types"(57)
    push_eh $P641
    .lex "self", self
    .lex "$/", param_642
.annotate 'line', 107
    new $P643, "Undef"
    .lex "$past", $P643
    get_hll_global $P644, ["PAST"], "Regex"
    find_lex $P645, "$/"
    $P646 = $P644."new"("quant" :named("pasttype"), 1 :named("min"), $P645 :named("node"))
    store_lex "$past", $P646
.annotate 'line', 108
    find_lex $P647, "$/"
    find_lex $P648, "$past"
    find_lex $P649, "$/"
    unless_null $P649, vivify_194
    $P649 = root_new ['parrot';'Hash']
  vivify_194:
    set $P650, $P649["backmod"]
    unless_null $P650, vivify_195
    new $P650, "Undef"
  vivify_195:
    $P651 = "backmod"($P648, $P650)
    $P652 = $P647."!make"($P651)
.annotate 'line', 106
    .return ($P652)
  control_640:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P653, exception, "payload"
    .return ($P653)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<?>"  :subid("43_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_657
.annotate 'line', 111
    new $P656, 'ExceptionHandler'
    set_addr $P656, control_655
    $P656."handle_types"(57)
    push_eh $P656
    .lex "self", self
    .lex "$/", param_657
.annotate 'line', 112
    new $P658, "Undef"
    .lex "$past", $P658
    get_hll_global $P659, ["PAST"], "Regex"
    find_lex $P660, "$/"
    $P661 = $P659."new"("quant" :named("pasttype"), 0 :named("min"), 1 :named("max"), $P660 :named("node"))
    store_lex "$past", $P661
.annotate 'line', 113
    find_lex $P662, "$/"
    find_lex $P663, "$past"
    find_lex $P664, "$/"
    unless_null $P664, vivify_196
    $P664 = root_new ['parrot';'Hash']
  vivify_196:
    set $P665, $P664["backmod"]
    unless_null $P665, vivify_197
    new $P665, "Undef"
  vivify_197:
    $P666 = "backmod"($P663, $P665)
    $P662."!make"($P666)
.annotate 'line', 114
    find_lex $P667, "$/"
    find_lex $P668, "$past"
    $P669 = $P667."!make"($P668)
.annotate 'line', 111
    .return ($P669)
  control_655:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P670, exception, "payload"
    .return ($P670)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<**>"  :subid("44_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_674
.annotate 'line', 117
    new $P673, 'ExceptionHandler'
    set_addr $P673, control_672
    $P673."handle_types"(57)
    push_eh $P673
    .lex "self", self
    .lex "$/", param_674
.annotate 'line', 118
    new $P675, "Undef"
    .lex "$past", $P675
.annotate 'line', 117
    find_lex $P676, "$past"
.annotate 'line', 119
    find_lex $P678, "$/"
    unless_null $P678, vivify_198
    $P678 = root_new ['parrot';'Hash']
  vivify_198:
    set $P679, $P678["quantified_atom"]
    unless_null $P679, vivify_199
    new $P679, "Undef"
  vivify_199:
    if $P679, if_677
.annotate 'line', 124
    get_hll_global $P686, ["PAST"], "Regex"
    find_lex $P687, "$/"
    unless_null $P687, vivify_200
    $P687 = root_new ['parrot';'Hash']
  vivify_200:
    set $P688, $P687["min"]
    unless_null $P688, vivify_201
    new $P688, "Undef"
  vivify_201:
    set $N689, $P688
    find_lex $P690, "$/"
    $P691 = $P686."new"("quant" :named("pasttype"), $N689 :named("min"), $P690 :named("node"))
    store_lex "$past", $P691
.annotate 'line', 125
    find_lex $P693, "$/"
    unless_null $P693, vivify_202
    $P693 = root_new ['parrot';'Hash']
  vivify_202:
    set $P694, $P693["max"]
    unless_null $P694, vivify_203
    new $P694, "Undef"
  vivify_203:
    isfalse $I695, $P694
    if $I695, if_692
.annotate 'line', 126
    find_lex $P701, "$/"
    unless_null $P701, vivify_204
    $P701 = root_new ['parrot';'Hash']
  vivify_204:
    set $P702, $P701["max"]
    unless_null $P702, vivify_205
    $P702 = root_new ['parrot';'ResizablePMCArray']
  vivify_205:
    set $P703, $P702[0]
    unless_null $P703, vivify_206
    new $P703, "Undef"
  vivify_206:
    set $S704, $P703
    isne $I705, $S704, "*"
    unless $I705, if_700_end
    find_lex $P706, "$past"
    find_lex $P707, "$/"
    unless_null $P707, vivify_207
    $P707 = root_new ['parrot';'Hash']
  vivify_207:
    set $P708, $P707["max"]
    unless_null $P708, vivify_208
    $P708 = root_new ['parrot';'ResizablePMCArray']
  vivify_208:
    set $P709, $P708[0]
    unless_null $P709, vivify_209
    new $P709, "Undef"
  vivify_209:
    set $N710, $P709
    $P706."max"($N710)
  if_700_end:
    goto if_692_end
  if_692:
.annotate 'line', 125
    find_lex $P696, "$past"
    find_lex $P697, "$/"
    unless_null $P697, vivify_210
    $P697 = root_new ['parrot';'Hash']
  vivify_210:
    set $P698, $P697["min"]
    unless_null $P698, vivify_211
    new $P698, "Undef"
  vivify_211:
    set $N699, $P698
    $P696."max"($N699)
  if_692_end:
.annotate 'line', 123
    goto if_677_end
  if_677:
.annotate 'line', 120
    get_hll_global $P680, ["PAST"], "Regex"
.annotate 'line', 121
    find_lex $P681, "$/"
    unless_null $P681, vivify_212
    $P681 = root_new ['parrot';'Hash']
  vivify_212:
    set $P682, $P681["quantified_atom"]
    unless_null $P682, vivify_213
    new $P682, "Undef"
  vivify_213:
    $P683 = $P682."ast"()
    find_lex $P684, "$/"
    $P685 = $P680."new"("quant" :named("pasttype"), 1 :named("min"), $P683 :named("sep"), $P684 :named("node"))
.annotate 'line', 120
    store_lex "$past", $P685
  if_677_end:
.annotate 'line', 128
    find_lex $P711, "$/"
    find_lex $P712, "$past"
    find_lex $P713, "$/"
    unless_null $P713, vivify_214
    $P713 = root_new ['parrot';'Hash']
  vivify_214:
    set $P714, $P713["backmod"]
    unless_null $P714, vivify_215
    new $P714, "Undef"
  vivify_215:
    $P715 = "backmod"($P712, $P714)
    $P716 = $P711."!make"($P715)
.annotate 'line', 117
    .return ($P716)
  control_672:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P717, exception, "payload"
    .return ($P717)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<ws>"  :subid("45_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_721
.annotate 'line', 131
    new $P720, 'ExceptionHandler'
    set_addr $P720, control_719
    $P720."handle_types"(57)
    push_eh $P720
    .lex "self", self
    .lex "$/", param_721
.annotate 'line', 132
    new $P722, "Undef"
    .lex "$past", $P722
.annotate 'line', 133
    get_global $P725, "@MODIFIERS"
    unless_null $P725, vivify_216
    $P725 = root_new ['parrot';'ResizablePMCArray']
  vivify_216:
    set $P726, $P725[0]
    unless_null $P726, vivify_217
    $P726 = root_new ['parrot';'Hash']
  vivify_217:
    set $P727, $P726["s"]
    unless_null $P727, vivify_218
    new $P727, "Undef"
  vivify_218:
    if $P727, if_724
    new $P731, "Integer"
    assign $P731, 0
    set $P723, $P731
    goto if_724_end
  if_724:
    get_hll_global $P728, ["PAST"], "Regex"
    find_lex $P729, "$/"
    $P730 = $P728."new"("ws", "subrule" :named("pasttype"), "method" :named("subtype"), $P729 :named("node"))
    set $P723, $P730
  if_724_end:
    store_lex "$past", $P723
.annotate 'line', 136
    find_lex $P732, "$/"
    find_lex $P733, "$past"
    $P734 = $P732."!make"($P733)
.annotate 'line', 131
    .return ($P734)
  control_719:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P735, exception, "payload"
    .return ($P735)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<[ ]>"  :subid("46_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_739
.annotate 'line', 140
    new $P738, 'ExceptionHandler'
    set_addr $P738, control_737
    $P738."handle_types"(57)
    push_eh $P738
    .lex "self", self
    .lex "$/", param_739
.annotate 'line', 141
    find_lex $P740, "$/"
    find_lex $P741, "$/"
    unless_null $P741, vivify_219
    $P741 = root_new ['parrot';'Hash']
  vivify_219:
    set $P742, $P741["nibbler"]
    unless_null $P742, vivify_220
    new $P742, "Undef"
  vivify_220:
    $P743 = $P742."ast"()
    $P744 = $P740."!make"($P743)
.annotate 'line', 140
    .return ($P744)
  control_737:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P745, exception, "payload"
    .return ($P745)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<( )>"  :subid("47_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_749
.annotate 'line', 144
    new $P748, 'ExceptionHandler'
    set_addr $P748, control_747
    $P748."handle_types"(57)
    push_eh $P748
    .lex "self", self
    .lex "$/", param_749
.annotate 'line', 145
    new $P750, "Undef"
    .lex "$subpast", $P750
.annotate 'line', 146
    new $P751, "Undef"
    .lex "$past", $P751
.annotate 'line', 145
    find_lex $P752, "$/"
    unless_null $P752, vivify_221
    $P752 = root_new ['parrot';'Hash']
  vivify_221:
    set $P753, $P752["nibbler"]
    unless_null $P753, vivify_222
    new $P753, "Undef"
  vivify_222:
    $P754 = $P753."ast"()
    $P755 = "buildsub"($P754)
    store_lex "$subpast", $P755
.annotate 'line', 146
    get_hll_global $P756, ["PAST"], "Regex"
    find_lex $P757, "$subpast"
    find_lex $P758, "$/"
    $P759 = $P756."new"($P757, "subrule" :named("pasttype"), "capture" :named("subtype"), $P758 :named("node"))
    store_lex "$past", $P759
.annotate 'line', 148
    find_lex $P760, "$/"
    find_lex $P761, "$past"
    $P762 = $P760."!make"($P761)
.annotate 'line', 144
    .return ($P762)
  control_747:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P763, exception, "payload"
    .return ($P763)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<'>"  :subid("48_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_767
.annotate 'line', 151
    new $P766, 'ExceptionHandler'
    set_addr $P766, control_765
    $P766."handle_types"(57)
    push_eh $P766
    .lex "self", self
    .lex "$/", param_767
.annotate 'line', 152
    new $P768, "Undef"
    .lex "$quote", $P768
.annotate 'line', 154
    new $P769, "Undef"
    .lex "$past", $P769
.annotate 'line', 152
    find_lex $P770, "$/"
    unless_null $P770, vivify_223
    $P770 = root_new ['parrot';'Hash']
  vivify_223:
    set $P771, $P770["quote_EXPR"]
    unless_null $P771, vivify_224
    new $P771, "Undef"
  vivify_224:
    $P772 = $P771."ast"()
    store_lex "$quote", $P772
.annotate 'line', 153
    get_hll_global $P774, ["PAST"], "Val"
    find_lex $P775, "$quote"
    $P776 = $P774."ACCEPTS"($P775)
    unless $P776, if_773_end
    find_lex $P777, "$quote"
    $P778 = $P777."value"()
    store_lex "$quote", $P778
  if_773_end:
.annotate 'line', 154
    get_hll_global $P779, ["PAST"], "Regex"
    find_lex $P780, "$quote"
    find_lex $P781, "$/"
    $P782 = $P779."new"($P780, "literal" :named("pasttype"), $P781 :named("node"))
    store_lex "$past", $P782
.annotate 'line', 155
    find_lex $P783, "$/"
    find_lex $P784, "$past"
    $P785 = $P783."!make"($P784)
.annotate 'line', 151
    .return ($P785)
  control_765:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P786, exception, "payload"
    .return ($P786)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<\">"  :subid("49_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_790
.annotate 'line', 158
    new $P789, 'ExceptionHandler'
    set_addr $P789, control_788
    $P789."handle_types"(57)
    push_eh $P789
    .lex "self", self
    .lex "$/", param_790
.annotate 'line', 159
    new $P791, "Undef"
    .lex "$quote", $P791
.annotate 'line', 161
    new $P792, "Undef"
    .lex "$past", $P792
.annotate 'line', 159
    find_lex $P793, "$/"
    unless_null $P793, vivify_225
    $P793 = root_new ['parrot';'Hash']
  vivify_225:
    set $P794, $P793["quote_EXPR"]
    unless_null $P794, vivify_226
    new $P794, "Undef"
  vivify_226:
    $P795 = $P794."ast"()
    store_lex "$quote", $P795
.annotate 'line', 160
    get_hll_global $P797, ["PAST"], "Val"
    find_lex $P798, "$quote"
    $P799 = $P797."ACCEPTS"($P798)
    unless $P799, if_796_end
    find_lex $P800, "$quote"
    $P801 = $P800."value"()
    store_lex "$quote", $P801
  if_796_end:
.annotate 'line', 161
    get_hll_global $P802, ["PAST"], "Regex"
    find_lex $P803, "$quote"
    find_lex $P804, "$/"
    $P805 = $P802."new"($P803, "literal" :named("pasttype"), $P804 :named("node"))
    store_lex "$past", $P805
.annotate 'line', 162
    find_lex $P806, "$/"
    find_lex $P807, "$past"
    $P808 = $P806."!make"($P807)
.annotate 'line', 158
    .return ($P808)
  control_788:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P809, exception, "payload"
    .return ($P809)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<.>"  :subid("50_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_813
.annotate 'line', 165
    new $P812, 'ExceptionHandler'
    set_addr $P812, control_811
    $P812."handle_types"(57)
    push_eh $P812
    .lex "self", self
    .lex "$/", param_813
.annotate 'line', 166
    new $P814, "Undef"
    .lex "$past", $P814
    get_hll_global $P815, ["PAST"], "Regex"
    find_lex $P816, "$/"
    $P817 = $P815."new"("charclass" :named("pasttype"), "." :named("subtype"), $P816 :named("node"))
    store_lex "$past", $P817
.annotate 'line', 167
    find_lex $P818, "$/"
    find_lex $P819, "$past"
    $P820 = $P818."!make"($P819)
.annotate 'line', 165
    .return ($P820)
  control_811:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P821, exception, "payload"
    .return ($P821)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<^>"  :subid("51_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_825
.annotate 'line', 170
    new $P824, 'ExceptionHandler'
    set_addr $P824, control_823
    $P824."handle_types"(57)
    push_eh $P824
    .lex "self", self
    .lex "$/", param_825
.annotate 'line', 171
    new $P826, "Undef"
    .lex "$past", $P826
    get_hll_global $P827, ["PAST"], "Regex"
    find_lex $P828, "$/"
    $P829 = $P827."new"("anchor" :named("pasttype"), "bos" :named("subtype"), $P828 :named("node"))
    store_lex "$past", $P829
.annotate 'line', 172
    find_lex $P830, "$/"
    find_lex $P831, "$past"
    $P832 = $P830."!make"($P831)
.annotate 'line', 170
    .return ($P832)
  control_823:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P833, exception, "payload"
    .return ($P833)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<^^>"  :subid("52_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_837
.annotate 'line', 175
    new $P836, 'ExceptionHandler'
    set_addr $P836, control_835
    $P836."handle_types"(57)
    push_eh $P836
    .lex "self", self
    .lex "$/", param_837
.annotate 'line', 176
    new $P838, "Undef"
    .lex "$past", $P838
    get_hll_global $P839, ["PAST"], "Regex"
    find_lex $P840, "$/"
    $P841 = $P839."new"("anchor" :named("pasttype"), "bol" :named("subtype"), $P840 :named("node"))
    store_lex "$past", $P841
.annotate 'line', 177
    find_lex $P842, "$/"
    find_lex $P843, "$past"
    $P844 = $P842."!make"($P843)
.annotate 'line', 175
    .return ($P844)
  control_835:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P845, exception, "payload"
    .return ($P845)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<$>"  :subid("53_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_849
.annotate 'line', 180
    new $P848, 'ExceptionHandler'
    set_addr $P848, control_847
    $P848."handle_types"(57)
    push_eh $P848
    .lex "self", self
    .lex "$/", param_849
.annotate 'line', 181
    new $P850, "Undef"
    .lex "$past", $P850
    get_hll_global $P851, ["PAST"], "Regex"
    find_lex $P852, "$/"
    $P853 = $P851."new"("anchor" :named("pasttype"), "eos" :named("subtype"), $P852 :named("node"))
    store_lex "$past", $P853
.annotate 'line', 182
    find_lex $P854, "$/"
    find_lex $P855, "$past"
    $P856 = $P854."!make"($P855)
.annotate 'line', 180
    .return ($P856)
  control_847:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P857, exception, "payload"
    .return ($P857)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<$$>"  :subid("54_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_861
.annotate 'line', 185
    new $P860, 'ExceptionHandler'
    set_addr $P860, control_859
    $P860."handle_types"(57)
    push_eh $P860
    .lex "self", self
    .lex "$/", param_861
.annotate 'line', 186
    new $P862, "Undef"
    .lex "$past", $P862
    get_hll_global $P863, ["PAST"], "Regex"
    find_lex $P864, "$/"
    $P865 = $P863."new"("anchor" :named("pasttype"), "eol" :named("subtype"), $P864 :named("node"))
    store_lex "$past", $P865
.annotate 'line', 187
    find_lex $P866, "$/"
    find_lex $P867, "$past"
    $P868 = $P866."!make"($P867)
.annotate 'line', 185
    .return ($P868)
  control_859:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P869, exception, "payload"
    .return ($P869)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<:::>"  :subid("55_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_873
.annotate 'line', 190
    new $P872, 'ExceptionHandler'
    set_addr $P872, control_871
    $P872."handle_types"(57)
    push_eh $P872
    .lex "self", self
    .lex "$/", param_873
.annotate 'line', 191
    new $P874, "Undef"
    .lex "$past", $P874
    get_hll_global $P875, ["PAST"], "Regex"
    find_lex $P876, "$/"
    $P877 = $P875."new"("cut" :named("pasttype"), $P876 :named("node"))
    store_lex "$past", $P877
.annotate 'line', 192
    find_lex $P878, "$/"
    find_lex $P879, "$past"
    $P880 = $P878."!make"($P879)
.annotate 'line', 190
    .return ($P880)
  control_871:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P881, exception, "payload"
    .return ($P881)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<lwb>"  :subid("56_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_885
.annotate 'line', 195
    new $P884, 'ExceptionHandler'
    set_addr $P884, control_883
    $P884."handle_types"(57)
    push_eh $P884
    .lex "self", self
    .lex "$/", param_885
.annotate 'line', 196
    new $P886, "Undef"
    .lex "$past", $P886
    get_hll_global $P887, ["PAST"], "Regex"
    find_lex $P888, "$/"
    $P889 = $P887."new"("anchor" :named("pasttype"), "lwb" :named("subtype"), $P888 :named("node"))
    store_lex "$past", $P889
.annotate 'line', 197
    find_lex $P890, "$/"
    find_lex $P891, "$past"
    $P892 = $P890."!make"($P891)
.annotate 'line', 195
    .return ($P892)
  control_883:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P893, exception, "payload"
    .return ($P893)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<rwb>"  :subid("57_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_897
.annotate 'line', 200
    new $P896, 'ExceptionHandler'
    set_addr $P896, control_895
    $P896."handle_types"(57)
    push_eh $P896
    .lex "self", self
    .lex "$/", param_897
.annotate 'line', 201
    new $P898, "Undef"
    .lex "$past", $P898
    get_hll_global $P899, ["PAST"], "Regex"
    find_lex $P900, "$/"
    $P901 = $P899."new"("anchor" :named("pasttype"), "rwb" :named("subtype"), $P900 :named("node"))
    store_lex "$past", $P901
.annotate 'line', 202
    find_lex $P902, "$/"
    find_lex $P903, "$past"
    $P904 = $P902."!make"($P903)
.annotate 'line', 200
    .return ($P904)
  control_895:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P905, exception, "payload"
    .return ($P905)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<bs>"  :subid("58_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_909
.annotate 'line', 205
    new $P908, 'ExceptionHandler'
    set_addr $P908, control_907
    $P908."handle_types"(57)
    push_eh $P908
    .lex "self", self
    .lex "$/", param_909
.annotate 'line', 206
    find_lex $P910, "$/"
    find_lex $P911, "$/"
    unless_null $P911, vivify_227
    $P911 = root_new ['parrot';'Hash']
  vivify_227:
    set $P912, $P911["backslash"]
    unless_null $P912, vivify_228
    new $P912, "Undef"
  vivify_228:
    $P913 = $P912."ast"()
    $P914 = $P910."!make"($P913)
.annotate 'line', 205
    .return ($P914)
  control_907:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P915, exception, "payload"
    .return ($P915)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<mod>"  :subid("59_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_919
.annotate 'line', 209
    new $P918, 'ExceptionHandler'
    set_addr $P918, control_917
    $P918."handle_types"(57)
    push_eh $P918
    .lex "self", self
    .lex "$/", param_919
.annotate 'line', 210
    find_lex $P920, "$/"
    find_lex $P921, "$/"
    unless_null $P921, vivify_229
    $P921 = root_new ['parrot';'Hash']
  vivify_229:
    set $P922, $P921["mod_internal"]
    unless_null $P922, vivify_230
    new $P922, "Undef"
  vivify_230:
    $P923 = $P922."ast"()
    $P924 = $P920."!make"($P923)
.annotate 'line', 209
    .return ($P924)
  control_917:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P925, exception, "payload"
    .return ($P925)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<assert>"  :subid("60_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_929
.annotate 'line', 213
    new $P928, 'ExceptionHandler'
    set_addr $P928, control_927
    $P928."handle_types"(57)
    push_eh $P928
    .lex "self", self
    .lex "$/", param_929
.annotate 'line', 214
    find_lex $P930, "$/"
    find_lex $P931, "$/"
    unless_null $P931, vivify_231
    $P931 = root_new ['parrot';'Hash']
  vivify_231:
    set $P932, $P931["assertion"]
    unless_null $P932, vivify_232
    new $P932, "Undef"
  vivify_232:
    $P933 = $P932."ast"()
    $P934 = $P930."!make"($P933)
.annotate 'line', 213
    .return ($P934)
  control_927:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P935, exception, "payload"
    .return ($P935)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<~>"  :subid("61_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_939
.annotate 'line', 217
    new $P938, 'ExceptionHandler'
    set_addr $P938, control_937
    $P938."handle_types"(57)
    push_eh $P938
    .lex "self", self
    .lex "$/", param_939
.annotate 'line', 218
    find_lex $P940, "$/"
    get_hll_global $P941, ["PAST"], "Regex"
.annotate 'line', 219
    find_lex $P942, "$/"
    unless_null $P942, vivify_233
    $P942 = root_new ['parrot';'Hash']
  vivify_233:
    set $P943, $P942["EXPR"]
    unless_null $P943, vivify_234
    new $P943, "Undef"
  vivify_234:
    $P944 = $P943."ast"()
.annotate 'line', 220
    get_hll_global $P945, ["PAST"], "Regex"
.annotate 'line', 221
    find_lex $P946, "$/"
    unless_null $P946, vivify_235
    $P946 = root_new ['parrot';'Hash']
  vivify_235:
    set $P947, $P946["GOAL"]
    unless_null $P947, vivify_236
    new $P947, "Undef"
  vivify_236:
    $P948 = $P947."ast"()
.annotate 'line', 222
    get_hll_global $P949, ["PAST"], "Regex"
    find_lex $P950, "$/"
    unless_null $P950, vivify_237
    $P950 = root_new ['parrot';'Hash']
  vivify_237:
    set $P951, $P950["GOAL"]
    unless_null $P951, vivify_238
    new $P951, "Undef"
  vivify_238:
    set $S952, $P951
    $P953 = $P949."new"("FAILGOAL", $S952, "subrule" :named("pasttype"), "method" :named("subtype"))
    $P954 = $P945."new"($P948, $P953, "alt" :named("pasttype"))
.annotate 'line', 220
    $P955 = $P941."new"($P944, $P954, "concat" :named("pasttype"))
.annotate 'line', 218
    $P956 = $P940."!make"($P955)
.annotate 'line', 217
    .return ($P956)
  control_937:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P957, exception, "payload"
    .return ($P957)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<{*}>"  :subid("62_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_961
.annotate 'line', 230
    new $P960, 'ExceptionHandler'
    set_addr $P960, control_959
    $P960."handle_types"(57)
    push_eh $P960
    .lex "self", self
    .lex "$/", param_961
.annotate 'line', 231
    new $P962, "Undef"
    .lex "$past", $P962
.annotate 'line', 232
    find_lex $P965, "$/"
    unless_null $P965, vivify_239
    $P965 = root_new ['parrot';'Hash']
  vivify_239:
    set $P966, $P965["key"]
    unless_null $P966, vivify_240
    new $P966, "Undef"
  vivify_240:
    if $P966, if_964
    new $P974, "Integer"
    assign $P974, 0
    set $P963, $P974
    goto if_964_end
  if_964:
    get_hll_global $P967, ["PAST"], "Regex"
    find_lex $P968, "$/"
    unless_null $P968, vivify_241
    $P968 = root_new ['parrot';'Hash']
  vivify_241:
    set $P969, $P968["key"]
    unless_null $P969, vivify_242
    $P969 = root_new ['parrot';'ResizablePMCArray']
  vivify_242:
    set $P970, $P969[0]
    unless_null $P970, vivify_243
    new $P970, "Undef"
  vivify_243:
    set $S971, $P970
    find_lex $P972, "$/"
    $P973 = $P967."new"($S971, "reduce" :named("pasttype"), $P972 :named("node"))
    set $P963, $P973
  if_964_end:
    store_lex "$past", $P963
.annotate 'line', 234
    find_lex $P975, "$/"
    find_lex $P976, "$past"
    $P977 = $P975."!make"($P976)
.annotate 'line', 230
    .return ($P977)
  control_959:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P978, exception, "payload"
    .return ($P978)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<var>"  :subid("63_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_982
.annotate 'line', 237
    new $P981, 'ExceptionHandler'
    set_addr $P981, control_980
    $P981."handle_types"(57)
    push_eh $P981
    .lex "self", self
    .lex "$/", param_982
.annotate 'line', 238
    new $P983, "Undef"
    .lex "$past", $P983
.annotate 'line', 239
    new $P984, "Undef"
    .lex "$name", $P984
.annotate 'line', 237
    find_lex $P985, "$past"
.annotate 'line', 239
    find_lex $P988, "$/"
    unless_null $P988, vivify_244
    $P988 = root_new ['parrot';'Hash']
  vivify_244:
    set $P989, $P988["pos"]
    unless_null $P989, vivify_245
    new $P989, "Undef"
  vivify_245:
    if $P989, if_987
    find_lex $P993, "$/"
    unless_null $P993, vivify_246
    $P993 = root_new ['parrot';'Hash']
  vivify_246:
    set $P994, $P993["name"]
    unless_null $P994, vivify_247
    new $P994, "Undef"
  vivify_247:
    set $S995, $P994
    new $P986, 'String'
    set $P986, $S995
    goto if_987_end
  if_987:
    find_lex $P990, "$/"
    unless_null $P990, vivify_248
    $P990 = root_new ['parrot';'Hash']
  vivify_248:
    set $P991, $P990["pos"]
    unless_null $P991, vivify_249
    new $P991, "Undef"
  vivify_249:
    set $N992, $P991
    new $P986, 'Float'
    set $P986, $N992
  if_987_end:
    store_lex "$name", $P986
.annotate 'line', 240
    find_lex $P997, "$/"
    unless_null $P997, vivify_250
    $P997 = root_new ['parrot';'Hash']
  vivify_250:
    set $P998, $P997["quantified_atom"]
    unless_null $P998, vivify_251
    new $P998, "Undef"
  vivify_251:
    if $P998, if_996
.annotate 'line', 251
    get_hll_global $P1027, ["PAST"], "Regex"
    find_lex $P1028, "$name"
    find_lex $P1029, "$/"
    $P1030 = $P1027."new"("!BACKREF", $P1028, "subrule" :named("pasttype"), "method" :named("subtype"), $P1029 :named("node"))
    store_lex "$past", $P1030
.annotate 'line', 250
    goto if_996_end
  if_996:
.annotate 'line', 241
    find_lex $P999, "$/"
    unless_null $P999, vivify_252
    $P999 = root_new ['parrot';'Hash']
  vivify_252:
    set $P1000, $P999["quantified_atom"]
    unless_null $P1000, vivify_253
    $P1000 = root_new ['parrot';'ResizablePMCArray']
  vivify_253:
    set $P1001, $P1000[0]
    unless_null $P1001, vivify_254
    new $P1001, "Undef"
  vivify_254:
    $P1002 = $P1001."ast"()
    store_lex "$past", $P1002
.annotate 'line', 242
    find_lex $P1006, "$past"
    $S1007 = $P1006."pasttype"()
    iseq $I1008, $S1007, "quant"
    if $I1008, if_1005
    new $P1004, 'Integer'
    set $P1004, $I1008
    goto if_1005_end
  if_1005:
    find_lex $P1009, "$past"
    unless_null $P1009, vivify_255
    $P1009 = root_new ['parrot';'ResizablePMCArray']
  vivify_255:
    set $P1010, $P1009[0]
    unless_null $P1010, vivify_256
    new $P1010, "Undef"
  vivify_256:
    $S1011 = $P1010."pasttype"()
    iseq $I1012, $S1011, "subrule"
    new $P1004, 'Integer'
    set $P1004, $I1012
  if_1005_end:
    if $P1004, if_1003
.annotate 'line', 245
    find_lex $P1017, "$past"
    $S1018 = $P1017."pasttype"()
    iseq $I1019, $S1018, "subrule"
    if $I1019, if_1016
.annotate 'line', 247
    get_hll_global $P1022, ["PAST"], "Regex"
    find_lex $P1023, "$past"
    find_lex $P1024, "$name"
    find_lex $P1025, "$/"
    $P1026 = $P1022."new"($P1023, $P1024 :named("name"), "subcapture" :named("pasttype"), $P1025 :named("node"))
    store_lex "$past", $P1026
.annotate 'line', 246
    goto if_1016_end
  if_1016:
.annotate 'line', 245
    find_lex $P1020, "$past"
    find_lex $P1021, "$name"
    "subrule_alias"($P1020, $P1021)
  if_1016_end:
    goto if_1003_end
  if_1003:
.annotate 'line', 243
    find_lex $P1013, "$past"
    unless_null $P1013, vivify_257
    $P1013 = root_new ['parrot';'ResizablePMCArray']
  vivify_257:
    set $P1014, $P1013[0]
    unless_null $P1014, vivify_258
    new $P1014, "Undef"
  vivify_258:
    find_lex $P1015, "$name"
    "subrule_alias"($P1014, $P1015)
  if_1003_end:
  if_996_end:
.annotate 'line', 254
    find_lex $P1031, "$/"
    find_lex $P1032, "$past"
    $P1033 = $P1031."!make"($P1032)
.annotate 'line', 237
    .return ($P1033)
  control_980:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1034, exception, "payload"
    .return ($P1034)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<PIR>"  :subid("64_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_1038
.annotate 'line', 257
    new $P1037, 'ExceptionHandler'
    set_addr $P1037, control_1036
    $P1037."handle_types"(57)
    push_eh $P1037
    .lex "self", self
    .lex "$/", param_1038
.annotate 'line', 258
    find_lex $P1039, "$/"
    get_hll_global $P1040, ["PAST"], "Regex"
.annotate 'line', 259
    get_hll_global $P1041, ["PAST"], "Op"
    find_lex $P1042, "$/"
    unless_null $P1042, vivify_259
    $P1042 = root_new ['parrot';'Hash']
  vivify_259:
    set $P1043, $P1042["pir"]
    unless_null $P1043, vivify_260
    new $P1043, "Undef"
  vivify_260:
    set $S1044, $P1043
    $P1045 = $P1041."new"($S1044 :named("inline"), "inline" :named("pasttype"))
    find_lex $P1046, "$/"
    $P1047 = $P1040."new"($P1045, "pastnode" :named("pasttype"), $P1046 :named("node"))
.annotate 'line', 258
    $P1048 = $P1039."!make"($P1047)
.annotate 'line', 257
    .return ($P1048)
  control_1036:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1049, exception, "payload"
    .return ($P1049)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<w>"  :subid("65_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_1053
.annotate 'line', 265
    new $P1052, 'ExceptionHandler'
    set_addr $P1052, control_1051
    $P1052."handle_types"(57)
    push_eh $P1052
    .lex "self", self
    .lex "$/", param_1053
.annotate 'line', 266
    new $P1054, "Undef"
    .lex "$subtype", $P1054
.annotate 'line', 267
    new $P1055, "Undef"
    .lex "$past", $P1055
.annotate 'line', 266
    find_lex $P1058, "$/"
    unless_null $P1058, vivify_261
    $P1058 = root_new ['parrot';'Hash']
  vivify_261:
    set $P1059, $P1058["sym"]
    unless_null $P1059, vivify_262
    new $P1059, "Undef"
  vivify_262:
    set $S1060, $P1059
    iseq $I1061, $S1060, "n"
    if $I1061, if_1057
    find_lex $P1063, "$/"
    unless_null $P1063, vivify_263
    $P1063 = root_new ['parrot';'Hash']
  vivify_263:
    set $P1064, $P1063["sym"]
    unless_null $P1064, vivify_264
    new $P1064, "Undef"
  vivify_264:
    set $S1065, $P1064
    new $P1056, 'String'
    set $P1056, $S1065
    goto if_1057_end
  if_1057:
    new $P1062, "String"
    assign $P1062, "nl"
    set $P1056, $P1062
  if_1057_end:
    store_lex "$subtype", $P1056
.annotate 'line', 267
    get_hll_global $P1066, ["PAST"], "Regex"
    find_lex $P1067, "$subtype"
    find_lex $P1068, "$/"
    $P1069 = $P1066."new"("charclass" :named("pasttype"), $P1067 :named("subtype"), $P1068 :named("node"))
    store_lex "$past", $P1069
.annotate 'line', 268
    find_lex $P1070, "$/"
    find_lex $P1071, "$past"
    $P1072 = $P1070."!make"($P1071)
.annotate 'line', 265
    .return ($P1072)
  control_1051:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1073, exception, "payload"
    .return ($P1073)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<b>"  :subid("66_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_1077
.annotate 'line', 271
    new $P1076, 'ExceptionHandler'
    set_addr $P1076, control_1075
    $P1076."handle_types"(57)
    push_eh $P1076
    .lex "self", self
    .lex "$/", param_1077
.annotate 'line', 272
    new $P1078, "Undef"
    .lex "$past", $P1078
    get_hll_global $P1079, ["PAST"], "Regex"
.annotate 'line', 273
    find_lex $P1080, "$/"
    unless_null $P1080, vivify_265
    $P1080 = root_new ['parrot';'Hash']
  vivify_265:
    set $P1081, $P1080["sym"]
    unless_null $P1081, vivify_266
    new $P1081, "Undef"
  vivify_266:
    set $S1082, $P1081
    iseq $I1083, $S1082, "B"
    find_lex $P1084, "$/"
    $P1085 = $P1079."new"("\b", "enumcharlist" :named("pasttype"), $I1083 :named("negate"), $P1084 :named("node"))
.annotate 'line', 272
    store_lex "$past", $P1085
.annotate 'line', 274
    find_lex $P1086, "$/"
    find_lex $P1087, "$past"
    $P1088 = $P1086."!make"($P1087)
.annotate 'line', 271
    .return ($P1088)
  control_1075:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1089, exception, "payload"
    .return ($P1089)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<e>"  :subid("67_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_1093
.annotate 'line', 277
    new $P1092, 'ExceptionHandler'
    set_addr $P1092, control_1091
    $P1092."handle_types"(57)
    push_eh $P1092
    .lex "self", self
    .lex "$/", param_1093
.annotate 'line', 278
    new $P1094, "Undef"
    .lex "$past", $P1094
    get_hll_global $P1095, ["PAST"], "Regex"
.annotate 'line', 279
    find_lex $P1096, "$/"
    unless_null $P1096, vivify_267
    $P1096 = root_new ['parrot';'Hash']
  vivify_267:
    set $P1097, $P1096["sym"]
    unless_null $P1097, vivify_268
    new $P1097, "Undef"
  vivify_268:
    set $S1098, $P1097
    iseq $I1099, $S1098, "E"
    find_lex $P1100, "$/"
    $P1101 = $P1095."new"("\e", "enumcharlist" :named("pasttype"), $I1099 :named("negate"), $P1100 :named("node"))
.annotate 'line', 278
    store_lex "$past", $P1101
.annotate 'line', 280
    find_lex $P1102, "$/"
    find_lex $P1103, "$past"
    $P1104 = $P1102."!make"($P1103)
.annotate 'line', 277
    .return ($P1104)
  control_1091:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1105, exception, "payload"
    .return ($P1105)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<f>"  :subid("68_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_1109
.annotate 'line', 283
    new $P1108, 'ExceptionHandler'
    set_addr $P1108, control_1107
    $P1108."handle_types"(57)
    push_eh $P1108
    .lex "self", self
    .lex "$/", param_1109
.annotate 'line', 284
    new $P1110, "Undef"
    .lex "$past", $P1110
    get_hll_global $P1111, ["PAST"], "Regex"
.annotate 'line', 285
    find_lex $P1112, "$/"
    unless_null $P1112, vivify_269
    $P1112 = root_new ['parrot';'Hash']
  vivify_269:
    set $P1113, $P1112["sym"]
    unless_null $P1113, vivify_270
    new $P1113, "Undef"
  vivify_270:
    set $S1114, $P1113
    iseq $I1115, $S1114, "F"
    find_lex $P1116, "$/"
    $P1117 = $P1111."new"("\f", "enumcharlist" :named("pasttype"), $I1115 :named("negate"), $P1116 :named("node"))
.annotate 'line', 284
    store_lex "$past", $P1117
.annotate 'line', 286
    find_lex $P1118, "$/"
    find_lex $P1119, "$past"
    $P1120 = $P1118."!make"($P1119)
.annotate 'line', 283
    .return ($P1120)
  control_1107:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1121, exception, "payload"
    .return ($P1121)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<h>"  :subid("69_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_1125
.annotate 'line', 289
    new $P1124, 'ExceptionHandler'
    set_addr $P1124, control_1123
    $P1124."handle_types"(57)
    push_eh $P1124
    .lex "self", self
    .lex "$/", param_1125
.annotate 'line', 290
    new $P1126, "Undef"
    .lex "$past", $P1126
    get_hll_global $P1127, ["PAST"], "Regex"
.annotate 'line', 291
    find_lex $P1128, "$/"
    unless_null $P1128, vivify_271
    $P1128 = root_new ['parrot';'Hash']
  vivify_271:
    set $P1129, $P1128["sym"]
    unless_null $P1129, vivify_272
    new $P1129, "Undef"
  vivify_272:
    set $S1130, $P1129
    iseq $I1131, $S1130, "H"
    find_lex $P1132, "$/"
    $P1133 = $P1127."new"(unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", "enumcharlist" :named("pasttype"), $I1131 :named("negate"), $P1132 :named("node"))
.annotate 'line', 290
    store_lex "$past", $P1133
.annotate 'line', 292
    find_lex $P1134, "$/"
    find_lex $P1135, "$past"
    $P1136 = $P1134."!make"($P1135)
.annotate 'line', 289
    .return ($P1136)
  control_1123:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1137, exception, "payload"
    .return ($P1137)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<r>"  :subid("70_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_1141
.annotate 'line', 295
    new $P1140, 'ExceptionHandler'
    set_addr $P1140, control_1139
    $P1140."handle_types"(57)
    push_eh $P1140
    .lex "self", self
    .lex "$/", param_1141
.annotate 'line', 296
    new $P1142, "Undef"
    .lex "$past", $P1142
    get_hll_global $P1143, ["PAST"], "Regex"
.annotate 'line', 297
    find_lex $P1144, "$/"
    unless_null $P1144, vivify_273
    $P1144 = root_new ['parrot';'Hash']
  vivify_273:
    set $P1145, $P1144["sym"]
    unless_null $P1145, vivify_274
    new $P1145, "Undef"
  vivify_274:
    set $S1146, $P1145
    iseq $I1147, $S1146, "R"
    find_lex $P1148, "$/"
    $P1149 = $P1143."new"("\r", "enumcharlist" :named("pasttype"), $I1147 :named("negate"), $P1148 :named("node"))
.annotate 'line', 296
    store_lex "$past", $P1149
.annotate 'line', 298
    find_lex $P1150, "$/"
    find_lex $P1151, "$past"
    $P1152 = $P1150."!make"($P1151)
.annotate 'line', 295
    .return ($P1152)
  control_1139:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1153, exception, "payload"
    .return ($P1153)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<t>"  :subid("71_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_1157
.annotate 'line', 301
    new $P1156, 'ExceptionHandler'
    set_addr $P1156, control_1155
    $P1156."handle_types"(57)
    push_eh $P1156
    .lex "self", self
    .lex "$/", param_1157
.annotate 'line', 302
    new $P1158, "Undef"
    .lex "$past", $P1158
    get_hll_global $P1159, ["PAST"], "Regex"
.annotate 'line', 303
    find_lex $P1160, "$/"
    unless_null $P1160, vivify_275
    $P1160 = root_new ['parrot';'Hash']
  vivify_275:
    set $P1161, $P1160["sym"]
    unless_null $P1161, vivify_276
    new $P1161, "Undef"
  vivify_276:
    set $S1162, $P1161
    iseq $I1163, $S1162, "T"
    find_lex $P1164, "$/"
    $P1165 = $P1159."new"("\t", "enumcharlist" :named("pasttype"), $I1163 :named("negate"), $P1164 :named("node"))
.annotate 'line', 302
    store_lex "$past", $P1165
.annotate 'line', 304
    find_lex $P1166, "$/"
    find_lex $P1167, "$past"
    $P1168 = $P1166."!make"($P1167)
.annotate 'line', 301
    .return ($P1168)
  control_1155:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1169, exception, "payload"
    .return ($P1169)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<v>"  :subid("72_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_1173
.annotate 'line', 307
    new $P1172, 'ExceptionHandler'
    set_addr $P1172, control_1171
    $P1172."handle_types"(57)
    push_eh $P1172
    .lex "self", self
    .lex "$/", param_1173
.annotate 'line', 308
    new $P1174, "Undef"
    .lex "$past", $P1174
    get_hll_global $P1175, ["PAST"], "Regex"
.annotate 'line', 310
    find_lex $P1176, "$/"
    unless_null $P1176, vivify_277
    $P1176 = root_new ['parrot';'Hash']
  vivify_277:
    set $P1177, $P1176["sym"]
    unless_null $P1177, vivify_278
    new $P1177, "Undef"
  vivify_278:
    set $S1178, $P1177
    iseq $I1179, $S1178, "V"
    find_lex $P1180, "$/"
    $P1181 = $P1175."new"(unicode:"\n\x{b}\f\r\x{85}\u2028\u2029", "enumcharlist" :named("pasttype"), $I1179 :named("negate"), $P1180 :named("node"))
.annotate 'line', 308
    store_lex "$past", $P1181
.annotate 'line', 311
    find_lex $P1182, "$/"
    find_lex $P1183, "$past"
    $P1184 = $P1182."!make"($P1183)
.annotate 'line', 307
    .return ($P1184)
  control_1171:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1185, exception, "payload"
    .return ($P1185)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<o>"  :subid("73_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_1189
.annotate 'line', 314
    new $P1188, 'ExceptionHandler'
    set_addr $P1188, control_1187
    $P1188."handle_types"(57)
    push_eh $P1188
    .lex "self", self
    .lex "$/", param_1189
.annotate 'line', 315
    new $P1190, "Undef"
    .lex "$octlit", $P1190
.annotate 'line', 316
    get_hll_global $P1191, ["HLL";"Actions"], "ints_to_string"
    find_lex $P1194, "$/"
    unless_null $P1194, vivify_279
    $P1194 = root_new ['parrot';'Hash']
  vivify_279:
    set $P1195, $P1194["octint"]
    unless_null $P1195, vivify_280
    new $P1195, "Undef"
  vivify_280:
    unless $P1195, unless_1193
    set $P1192, $P1195
    goto unless_1193_end
  unless_1193:
    find_lex $P1196, "$/"
    unless_null $P1196, vivify_281
    $P1196 = root_new ['parrot';'Hash']
  vivify_281:
    set $P1197, $P1196["octints"]
    unless_null $P1197, vivify_282
    $P1197 = root_new ['parrot';'Hash']
  vivify_282:
    set $P1198, $P1197["octint"]
    unless_null $P1198, vivify_283
    new $P1198, "Undef"
  vivify_283:
    set $P1192, $P1198
  unless_1193_end:
    $P1199 = $P1191($P1192)
    store_lex "$octlit", $P1199
.annotate 'line', 317
    find_lex $P1200, "$/"
    find_lex $P1203, "$/"
    unless_null $P1203, vivify_284
    $P1203 = root_new ['parrot';'Hash']
  vivify_284:
    set $P1204, $P1203["sym"]
    unless_null $P1204, vivify_285
    new $P1204, "Undef"
  vivify_285:
    set $S1205, $P1204
    iseq $I1206, $S1205, "O"
    if $I1206, if_1202
.annotate 'line', 320
    get_hll_global $P1211, ["PAST"], "Regex"
    find_lex $P1212, "$octlit"
    find_lex $P1213, "$/"
    $P1214 = $P1211."new"($P1212, "literal" :named("pasttype"), $P1213 :named("node"))
    set $P1201, $P1214
.annotate 'line', 317
    goto if_1202_end
  if_1202:
.annotate 'line', 318
    get_hll_global $P1207, ["PAST"], "Regex"
    find_lex $P1208, "$octlit"
    find_lex $P1209, "$/"
    $P1210 = $P1207."new"($P1208, "enumcharlist" :named("pasttype"), 1 :named("negate"), $P1209 :named("node"))
    set $P1201, $P1210
  if_1202_end:
    $P1215 = $P1200."!make"($P1201)
.annotate 'line', 314
    .return ($P1215)
  control_1187:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1216, exception, "payload"
    .return ($P1216)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<x>"  :subid("74_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_1220
.annotate 'line', 323
    new $P1219, 'ExceptionHandler'
    set_addr $P1219, control_1218
    $P1219."handle_types"(57)
    push_eh $P1219
    .lex "self", self
    .lex "$/", param_1220
.annotate 'line', 324
    new $P1221, "Undef"
    .lex "$hexlit", $P1221
.annotate 'line', 325
    get_hll_global $P1222, ["HLL";"Actions"], "ints_to_string"
    find_lex $P1225, "$/"
    unless_null $P1225, vivify_286
    $P1225 = root_new ['parrot';'Hash']
  vivify_286:
    set $P1226, $P1225["hexint"]
    unless_null $P1226, vivify_287
    new $P1226, "Undef"
  vivify_287:
    unless $P1226, unless_1224
    set $P1223, $P1226
    goto unless_1224_end
  unless_1224:
    find_lex $P1227, "$/"
    unless_null $P1227, vivify_288
    $P1227 = root_new ['parrot';'Hash']
  vivify_288:
    set $P1228, $P1227["hexints"]
    unless_null $P1228, vivify_289
    $P1228 = root_new ['parrot';'Hash']
  vivify_289:
    set $P1229, $P1228["hexint"]
    unless_null $P1229, vivify_290
    new $P1229, "Undef"
  vivify_290:
    set $P1223, $P1229
  unless_1224_end:
    $P1230 = $P1222($P1223)
    store_lex "$hexlit", $P1230
.annotate 'line', 326
    find_lex $P1231, "$/"
    find_lex $P1234, "$/"
    unless_null $P1234, vivify_291
    $P1234 = root_new ['parrot';'Hash']
  vivify_291:
    set $P1235, $P1234["sym"]
    unless_null $P1235, vivify_292
    new $P1235, "Undef"
  vivify_292:
    set $S1236, $P1235
    iseq $I1237, $S1236, "X"
    if $I1237, if_1233
.annotate 'line', 329
    get_hll_global $P1242, ["PAST"], "Regex"
    find_lex $P1243, "$hexlit"
    find_lex $P1244, "$/"
    $P1245 = $P1242."new"($P1243, "literal" :named("pasttype"), $P1244 :named("node"))
    set $P1232, $P1245
.annotate 'line', 326
    goto if_1233_end
  if_1233:
.annotate 'line', 327
    get_hll_global $P1238, ["PAST"], "Regex"
    find_lex $P1239, "$hexlit"
    find_lex $P1240, "$/"
    $P1241 = $P1238."new"($P1239, "enumcharlist" :named("pasttype"), 1 :named("negate"), $P1240 :named("node"))
    set $P1232, $P1241
  if_1233_end:
    $P1246 = $P1231."!make"($P1232)
.annotate 'line', 323
    .return ($P1246)
  control_1218:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1247, exception, "payload"
    .return ($P1247)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<c>"  :subid("75_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_1251
.annotate 'line', 332
    new $P1250, 'ExceptionHandler'
    set_addr $P1250, control_1249
    $P1250."handle_types"(57)
    push_eh $P1250
    .lex "self", self
    .lex "$/", param_1251
.annotate 'line', 333
    find_lex $P1252, "$/"
    get_hll_global $P1253, ["PAST"], "Regex"
    find_lex $P1254, "$/"
    unless_null $P1254, vivify_293
    $P1254 = root_new ['parrot';'Hash']
  vivify_293:
    set $P1255, $P1254["charspec"]
    unless_null $P1255, vivify_294
    new $P1255, "Undef"
  vivify_294:
    $P1256 = $P1255."ast"()
    find_lex $P1257, "$/"
    $P1258 = $P1253."new"($P1256, "literal" :named("pasttype"), $P1257 :named("node"))
    $P1259 = $P1252."!make"($P1258)
.annotate 'line', 332
    .return ($P1259)
  control_1249:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1260, exception, "payload"
    .return ($P1260)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<misc>"  :subid("76_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_1264
.annotate 'line', 336
    new $P1263, 'ExceptionHandler'
    set_addr $P1263, control_1262
    $P1263."handle_types"(57)
    push_eh $P1263
    .lex "self", self
    .lex "$/", param_1264
.annotate 'line', 337
    new $P1265, "Undef"
    .lex "$past", $P1265
    get_hll_global $P1266, ["PAST"], "Regex"
    find_lex $P1267, "$/"
    set $S1268, $P1267
    find_lex $P1269, "$/"
    $P1270 = $P1266."new"($S1268, "literal" :named("pasttype"), $P1269 :named("node"))
    store_lex "$past", $P1270
.annotate 'line', 338
    find_lex $P1271, "$/"
    find_lex $P1272, "$past"
    $P1273 = $P1271."!make"($P1272)
.annotate 'line', 336
    .return ($P1273)
  control_1262:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1274, exception, "payload"
    .return ($P1274)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<?>"  :subid("77_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_1278
.annotate 'line', 342
    new $P1277, 'ExceptionHandler'
    set_addr $P1277, control_1276
    $P1277."handle_types"(57)
    push_eh $P1277
    .lex "self", self
    .lex "$/", param_1278
.annotate 'line', 343
    new $P1279, "Undef"
    .lex "$past", $P1279
.annotate 'line', 342
    find_lex $P1280, "$past"
.annotate 'line', 344
    find_lex $P1282, "$/"
    unless_null $P1282, vivify_295
    $P1282 = root_new ['parrot';'Hash']
  vivify_295:
    set $P1283, $P1282["assertion"]
    unless_null $P1283, vivify_296
    new $P1283, "Undef"
  vivify_296:
    if $P1283, if_1281
.annotate 'line', 348
    new $P1288, "Integer"
    assign $P1288, 0
    store_lex "$past", $P1288
    goto if_1281_end
  if_1281:
.annotate 'line', 345
    find_lex $P1284, "$/"
    unless_null $P1284, vivify_297
    $P1284 = root_new ['parrot';'Hash']
  vivify_297:
    set $P1285, $P1284["assertion"]
    unless_null $P1285, vivify_298
    new $P1285, "Undef"
  vivify_298:
    $P1286 = $P1285."ast"()
    store_lex "$past", $P1286
.annotate 'line', 346
    find_lex $P1287, "$past"
    $P1287."subtype"("zerowidth")
  if_1281_end:
.annotate 'line', 349
    find_lex $P1289, "$/"
    find_lex $P1290, "$past"
    $P1291 = $P1289."!make"($P1290)
.annotate 'line', 342
    .return ($P1291)
  control_1276:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1292, exception, "payload"
    .return ($P1292)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<!>"  :subid("78_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_1296
.annotate 'line', 352
    new $P1295, 'ExceptionHandler'
    set_addr $P1295, control_1294
    $P1295."handle_types"(57)
    push_eh $P1295
    .lex "self", self
    .lex "$/", param_1296
.annotate 'line', 353
    new $P1297, "Undef"
    .lex "$past", $P1297
.annotate 'line', 352
    find_lex $P1298, "$past"
.annotate 'line', 354
    find_lex $P1300, "$/"
    unless_null $P1300, vivify_299
    $P1300 = root_new ['parrot';'Hash']
  vivify_299:
    set $P1301, $P1300["assertion"]
    unless_null $P1301, vivify_300
    new $P1301, "Undef"
  vivify_300:
    if $P1301, if_1299
.annotate 'line', 360
    get_hll_global $P1310, ["PAST"], "Regex"
    find_lex $P1311, "$/"
    $P1312 = $P1310."new"("anchor" :named("pasttype"), "fail" :named("subtype"), $P1311 :named("node"))
    store_lex "$past", $P1312
.annotate 'line', 359
    goto if_1299_end
  if_1299:
.annotate 'line', 355
    find_lex $P1302, "$/"
    unless_null $P1302, vivify_301
    $P1302 = root_new ['parrot';'Hash']
  vivify_301:
    set $P1303, $P1302["assertion"]
    unless_null $P1303, vivify_302
    new $P1303, "Undef"
  vivify_302:
    $P1304 = $P1303."ast"()
    store_lex "$past", $P1304
.annotate 'line', 356
    find_lex $P1305, "$past"
    find_lex $P1306, "$past"
    $P1307 = $P1306."negate"()
    isfalse $I1308, $P1307
    $P1305."negate"($I1308)
.annotate 'line', 357
    find_lex $P1309, "$past"
    $P1309."subtype"("zerowidth")
  if_1299_end:
.annotate 'line', 362
    find_lex $P1313, "$/"
    find_lex $P1314, "$past"
    $P1315 = $P1313."!make"($P1314)
.annotate 'line', 352
    .return ($P1315)
  control_1294:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1316, exception, "payload"
    .return ($P1316)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<method>"  :subid("79_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_1320
.annotate 'line', 365
    new $P1319, 'ExceptionHandler'
    set_addr $P1319, control_1318
    $P1319."handle_types"(57)
    push_eh $P1319
    .lex "self", self
    .lex "$/", param_1320
.annotate 'line', 366
    new $P1321, "Undef"
    .lex "$past", $P1321
    find_lex $P1322, "$/"
    unless_null $P1322, vivify_303
    $P1322 = root_new ['parrot';'Hash']
  vivify_303:
    set $P1323, $P1322["assertion"]
    unless_null $P1323, vivify_304
    new $P1323, "Undef"
  vivify_304:
    $P1324 = $P1323."ast"()
    store_lex "$past", $P1324
.annotate 'line', 367
    find_lex $P1325, "$past"
    $P1325."subtype"("method")
.annotate 'line', 368
    find_lex $P1326, "$past"
    $P1326."name"("")
.annotate 'line', 369
    find_lex $P1327, "$/"
    find_lex $P1328, "$past"
    $P1329 = $P1327."!make"($P1328)
.annotate 'line', 365
    .return ($P1329)
  control_1318:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1330, exception, "payload"
    .return ($P1330)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<name>"  :subid("80_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_1334
.annotate 'line', 372
    .const 'Sub' $P1392 = "82_1273884021.34483" 
    capture_lex $P1392
    .const 'Sub' $P1356 = "81_1273884021.34483" 
    capture_lex $P1356
    new $P1333, 'ExceptionHandler'
    set_addr $P1333, control_1332
    $P1333."handle_types"(57)
    push_eh $P1333
    .lex "self", self
    .lex "$/", param_1334
.annotate 'line', 373
    new $P1335, "Undef"
    .lex "$name", $P1335
.annotate 'line', 374
    new $P1336, "Undef"
    .lex "$past", $P1336
.annotate 'line', 373
    find_lex $P1337, "$/"
    unless_null $P1337, vivify_305
    $P1337 = root_new ['parrot';'Hash']
  vivify_305:
    set $P1338, $P1337["longname"]
    unless_null $P1338, vivify_306
    new $P1338, "Undef"
  vivify_306:
    set $S1339, $P1338
    new $P1340, 'String'
    set $P1340, $S1339
    store_lex "$name", $P1340
    find_lex $P1341, "$past"
.annotate 'line', 375
    find_lex $P1343, "$/"
    unless_null $P1343, vivify_307
    $P1343 = root_new ['parrot';'Hash']
  vivify_307:
    set $P1344, $P1343["assertion"]
    unless_null $P1344, vivify_308
    new $P1344, "Undef"
  vivify_308:
    if $P1344, if_1342
.annotate 'line', 379
    find_lex $P1352, "$name"
    set $S1353, $P1352
    iseq $I1354, $S1353, "sym"
    if $I1354, if_1351
.annotate 'line', 395
    get_hll_global $P1366, ["PAST"], "Regex"
    find_lex $P1367, "$name"
    find_lex $P1368, "$name"
    find_lex $P1369, "$/"
    $P1370 = $P1366."new"($P1367, $P1368 :named("name"), "subrule" :named("pasttype"), "capture" :named("subtype"), $P1369 :named("node"))
    store_lex "$past", $P1370
.annotate 'line', 397
    find_lex $P1372, "$/"
    unless_null $P1372, vivify_309
    $P1372 = root_new ['parrot';'Hash']
  vivify_309:
    set $P1373, $P1372["nibbler"]
    unless_null $P1373, vivify_310
    new $P1373, "Undef"
  vivify_310:
    if $P1373, if_1371
.annotate 'line', 400
    find_lex $P1381, "$/"
    unless_null $P1381, vivify_311
    $P1381 = root_new ['parrot';'Hash']
  vivify_311:
    set $P1382, $P1381["arglist"]
    unless_null $P1382, vivify_312
    new $P1382, "Undef"
  vivify_312:
    unless $P1382, if_1380_end
.annotate 'line', 401
    find_lex $P1384, "$/"
    unless_null $P1384, vivify_313
    $P1384 = root_new ['parrot';'Hash']
  vivify_313:
    set $P1385, $P1384["arglist"]
    unless_null $P1385, vivify_314
    $P1385 = root_new ['parrot';'ResizablePMCArray']
  vivify_314:
    set $P1386, $P1385[0]
    unless_null $P1386, vivify_315
    new $P1386, "Undef"
  vivify_315:
    $P1387 = $P1386."ast"()
    $P1388 = $P1387."list"()
    defined $I1389, $P1388
    unless $I1389, for_undef_316
    iter $P1383, $P1388
    new $P1398, 'ExceptionHandler'
    set_addr $P1398, loop1397_handler
    $P1398."handle_types"(64, 66, 65)
    push_eh $P1398
  loop1397_test:
    unless $P1383, loop1397_done
    shift $P1390, $P1383
  loop1397_redo:
    .const 'Sub' $P1392 = "82_1273884021.34483" 
    capture_lex $P1392
    $P1392($P1390)
  loop1397_next:
    goto loop1397_test
  loop1397_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1399, exception, 'type'
    eq $P1399, 64, loop1397_next
    eq $P1399, 66, loop1397_redo
  loop1397_done:
    pop_eh 
  for_undef_316:
  if_1380_end:
.annotate 'line', 400
    goto if_1371_end
  if_1371:
.annotate 'line', 398
    find_lex $P1374, "$past"
    find_lex $P1375, "$/"
    unless_null $P1375, vivify_317
    $P1375 = root_new ['parrot';'Hash']
  vivify_317:
    set $P1376, $P1375["nibbler"]
    unless_null $P1376, vivify_318
    $P1376 = root_new ['parrot';'ResizablePMCArray']
  vivify_318:
    set $P1377, $P1376[0]
    unless_null $P1377, vivify_319
    new $P1377, "Undef"
  vivify_319:
    $P1378 = $P1377."ast"()
    $P1379 = "buildsub"($P1378)
    $P1374."push"($P1379)
  if_1371_end:
.annotate 'line', 394
    goto if_1351_end
  if_1351:
.annotate 'line', 379
    .const 'Sub' $P1356 = "81_1273884021.34483" 
    capture_lex $P1356
    $P1356()
  if_1351_end:
    goto if_1342_end
  if_1342:
.annotate 'line', 376
    find_lex $P1345, "$/"
    unless_null $P1345, vivify_320
    $P1345 = root_new ['parrot';'Hash']
  vivify_320:
    set $P1346, $P1345["assertion"]
    unless_null $P1346, vivify_321
    $P1346 = root_new ['parrot';'ResizablePMCArray']
  vivify_321:
    set $P1347, $P1346[0]
    unless_null $P1347, vivify_322
    new $P1347, "Undef"
  vivify_322:
    $P1348 = $P1347."ast"()
    store_lex "$past", $P1348
.annotate 'line', 377
    find_lex $P1349, "$past"
    find_lex $P1350, "$name"
    "subrule_alias"($P1349, $P1350)
  if_1342_end:
.annotate 'line', 404
    find_lex $P1400, "$/"
    find_lex $P1401, "$past"
    $P1402 = $P1400."!make"($P1401)
.annotate 'line', 372
    .return ($P1402)
  control_1332:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1403, exception, "payload"
    .return ($P1403)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1391"  :anon :subid("82_1273884021.34483") :outer("80_1273884021.34483")
    .param pmc param_1393
.annotate 'line', 401
    .lex "$_", param_1393
    find_lex $P1394, "$past"
    find_lex $P1395, "$_"
    $P1396 = $P1394."push"($P1395)
    .return ($P1396)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1355"  :anon :subid("81_1273884021.34483") :outer("80_1273884021.34483")
.annotate 'line', 380
    new $P1357, "Undef"
    .lex "$regexsym", $P1357

            $P0 = get_global '$REGEXNAME'
            $S0 = $P0
            $I0 = index $S0, ':sym<'
            add $I0, 5
            $S0 = substr $S0, $I0
            $S0 = chopn $S0, 1
            $P1358 = box $S0
        
    store_lex "$regexsym", $P1358
.annotate 'line', 389
    get_hll_global $P1359, ["PAST"], "Regex"
.annotate 'line', 390
    get_hll_global $P1360, ["PAST"], "Regex"
    find_lex $P1361, "$regexsym"
    $P1362 = $P1360."new"($P1361, "literal" :named("pasttype"))
    find_lex $P1363, "$name"
    find_lex $P1364, "$/"
    $P1365 = $P1359."new"($P1362, $P1363 :named("name"), "subcapture" :named("pasttype"), $P1364 :named("node"))
.annotate 'line', 389
    store_lex "$past", $P1365
.annotate 'line', 379
    .return ($P1365)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<[>"  :subid("83_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_1407
.annotate 'line', 407
    .const 'Sub' $P1442 = "84_1273884021.34483" 
    capture_lex $P1442
    new $P1406, 'ExceptionHandler'
    set_addr $P1406, control_1405
    $P1406."handle_types"(57)
    push_eh $P1406
    .lex "self", self
    .lex "$/", param_1407
.annotate 'line', 408
    new $P1408, "Undef"
    .lex "$clist", $P1408
.annotate 'line', 409
    new $P1409, "Undef"
    .lex "$past", $P1409
.annotate 'line', 418
    new $P1410, "Undef"
    .lex "$i", $P1410
.annotate 'line', 419
    new $P1411, "Undef"
    .lex "$n", $P1411
.annotate 'line', 408
    find_lex $P1412, "$/"
    unless_null $P1412, vivify_323
    $P1412 = root_new ['parrot';'Hash']
  vivify_323:
    set $P1413, $P1412["cclass_elem"]
    unless_null $P1413, vivify_324
    new $P1413, "Undef"
  vivify_324:
    store_lex "$clist", $P1413
.annotate 'line', 409
    find_lex $P1414, "$clist"
    unless_null $P1414, vivify_325
    $P1414 = root_new ['parrot';'ResizablePMCArray']
  vivify_325:
    set $P1415, $P1414[0]
    unless_null $P1415, vivify_326
    new $P1415, "Undef"
  vivify_326:
    $P1416 = $P1415."ast"()
    store_lex "$past", $P1416
.annotate 'line', 410
    find_lex $P1420, "$past"
    $P1421 = $P1420."negate"()
    if $P1421, if_1419
    set $P1418, $P1421
    goto if_1419_end
  if_1419:
    find_lex $P1422, "$past"
    $S1423 = $P1422."pasttype"()
    iseq $I1424, $S1423, "subrule"
    new $P1418, 'Integer'
    set $P1418, $I1424
  if_1419_end:
    unless $P1418, if_1417_end
.annotate 'line', 411
    find_lex $P1425, "$past"
    $P1425."subtype"("zerowidth")
.annotate 'line', 412
    get_hll_global $P1426, ["PAST"], "Regex"
    find_lex $P1427, "$past"
.annotate 'line', 414
    get_hll_global $P1428, ["PAST"], "Regex"
    $P1429 = $P1428."new"("charclass" :named("pasttype"), "." :named("subtype"))
    find_lex $P1430, "$/"
    $P1431 = $P1426."new"($P1427, $P1429, $P1430 :named("node"))
.annotate 'line', 412
    store_lex "$past", $P1431
  if_1417_end:
.annotate 'line', 418
    new $P1432, "Integer"
    assign $P1432, 1
    store_lex "$i", $P1432
.annotate 'line', 419
    find_lex $P1433, "$clist"
    set $N1434, $P1433
    new $P1435, 'Float'
    set $P1435, $N1434
    store_lex "$n", $P1435
.annotate 'line', 420
    new $P1466, 'ExceptionHandler'
    set_addr $P1466, loop1465_handler
    $P1466."handle_types"(64, 66, 65)
    push_eh $P1466
  loop1465_test:
    find_lex $P1436, "$i"
    set $N1437, $P1436
    find_lex $P1438, "$n"
    set $N1439, $P1438
    islt $I1440, $N1437, $N1439
    unless $I1440, loop1465_done
  loop1465_redo:
    .const 'Sub' $P1442 = "84_1273884021.34483" 
    capture_lex $P1442
    $P1442()
  loop1465_next:
    goto loop1465_test
  loop1465_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1467, exception, 'type'
    eq $P1467, 64, loop1465_next
    eq $P1467, 66, loop1465_redo
  loop1465_done:
    pop_eh 
.annotate 'line', 431
    find_lex $P1468, "$/"
    find_lex $P1469, "$past"
    $P1470 = $P1468."!make"($P1469)
.annotate 'line', 407
    .return ($P1470)
  control_1405:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1471, exception, "payload"
    .return ($P1471)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1441"  :anon :subid("84_1273884021.34483") :outer("83_1273884021.34483")
.annotate 'line', 421
    new $P1443, "Undef"
    .lex "$ast", $P1443
    find_lex $P1444, "$i"
    set $I1445, $P1444
    find_lex $P1446, "$clist"
    unless_null $P1446, vivify_327
    $P1446 = root_new ['parrot';'ResizablePMCArray']
  vivify_327:
    set $P1447, $P1446[$I1445]
    unless_null $P1447, vivify_328
    new $P1447, "Undef"
  vivify_328:
    $P1448 = $P1447."ast"()
    store_lex "$ast", $P1448
.annotate 'line', 422
    find_lex $P1450, "$ast"
    $P1451 = $P1450."negate"()
    if $P1451, if_1449
.annotate 'line', 427
    get_hll_global $P1458, ["PAST"], "Regex"
    find_lex $P1459, "$past"
    find_lex $P1460, "$ast"
    find_lex $P1461, "$/"
    $P1462 = $P1458."new"($P1459, $P1460, "alt" :named("pasttype"), $P1461 :named("node"))
    store_lex "$past", $P1462
.annotate 'line', 426
    goto if_1449_end
  if_1449:
.annotate 'line', 423
    find_lex $P1452, "$ast"
    $P1452."subtype"("zerowidth")
.annotate 'line', 424
    get_hll_global $P1453, ["PAST"], "Regex"
    find_lex $P1454, "$ast"
    find_lex $P1455, "$past"
    find_lex $P1456, "$/"
    $P1457 = $P1453."new"($P1454, $P1455, "concat" :named("pasttype"), $P1456 :named("node"))
    store_lex "$past", $P1457
  if_1449_end:
.annotate 'line', 429
    find_lex $P1463, "$i"
    add $P1464, $P1463, 1
    store_lex "$i", $P1464
.annotate 'line', 420
    .return ($P1464)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "cclass_elem"  :subid("85_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_1475
.annotate 'line', 434
    .const 'Sub' $P1500 = "87_1273884021.34483" 
    capture_lex $P1500
    .const 'Sub' $P1484 = "86_1273884021.34483" 
    capture_lex $P1484
    new $P1474, 'ExceptionHandler'
    set_addr $P1474, control_1473
    $P1474."handle_types"(57)
    push_eh $P1474
    .lex "self", self
    .lex "$/", param_1475
.annotate 'line', 435
    new $P1476, "Undef"
    .lex "$str", $P1476
.annotate 'line', 436
    new $P1477, "Undef"
    .lex "$past", $P1477
.annotate 'line', 435
    new $P1478, "String"
    assign $P1478, ""
    store_lex "$str", $P1478
    find_lex $P1479, "$past"
.annotate 'line', 437
    find_lex $P1481, "$/"
    unless_null $P1481, vivify_329
    $P1481 = root_new ['parrot';'Hash']
  vivify_329:
    set $P1482, $P1481["name"]
    unless_null $P1482, vivify_330
    new $P1482, "Undef"
  vivify_330:
    if $P1482, if_1480
.annotate 'line', 441
    find_lex $P1495, "$/"
    unless_null $P1495, vivify_331
    $P1495 = root_new ['parrot';'Hash']
  vivify_331:
    set $P1496, $P1495["charspec"]
    unless_null $P1496, vivify_332
    new $P1496, "Undef"
  vivify_332:
    defined $I1497, $P1496
    unless $I1497, for_undef_333
    iter $P1494, $P1496
    new $P1526, 'ExceptionHandler'
    set_addr $P1526, loop1525_handler
    $P1526."handle_types"(64, 66, 65)
    push_eh $P1526
  loop1525_test:
    unless $P1494, loop1525_done
    shift $P1498, $P1494
  loop1525_redo:
    .const 'Sub' $P1500 = "87_1273884021.34483" 
    capture_lex $P1500
    $P1500($P1498)
  loop1525_next:
    goto loop1525_test
  loop1525_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1527, exception, 'type'
    eq $P1527, 64, loop1525_next
    eq $P1527, 66, loop1525_redo
  loop1525_done:
    pop_eh 
  for_undef_333:
.annotate 'line', 466
    get_hll_global $P1528, ["PAST"], "Regex"
    find_lex $P1529, "$str"
    find_lex $P1530, "$/"
    $P1531 = $P1528."new"($P1529, "enumcharlist" :named("pasttype"), $P1530 :named("node"))
    store_lex "$past", $P1531
.annotate 'line', 440
    goto if_1480_end
  if_1480:
.annotate 'line', 437
    .const 'Sub' $P1484 = "86_1273884021.34483" 
    capture_lex $P1484
    $P1484()
  if_1480_end:
.annotate 'line', 468
    find_lex $P1532, "$past"
    find_lex $P1533, "$/"
    unless_null $P1533, vivify_345
    $P1533 = root_new ['parrot';'Hash']
  vivify_345:
    set $P1534, $P1533["sign"]
    unless_null $P1534, vivify_346
    new $P1534, "Undef"
  vivify_346:
    set $S1535, $P1534
    iseq $I1536, $S1535, "-"
    $P1532."negate"($I1536)
.annotate 'line', 469
    find_lex $P1537, "$/"
    find_lex $P1538, "$past"
    $P1539 = $P1537."!make"($P1538)
.annotate 'line', 434
    .return ($P1539)
  control_1473:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1540, exception, "payload"
    .return ($P1540)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1499"  :anon :subid("87_1273884021.34483") :outer("85_1273884021.34483")
    .param pmc param_1501
.annotate 'line', 441
    .const 'Sub' $P1507 = "88_1273884021.34483" 
    capture_lex $P1507
    .lex "$_", param_1501
.annotate 'line', 442
    find_lex $P1504, "$_"
    unless_null $P1504, vivify_334
    $P1504 = root_new ['parrot';'ResizablePMCArray']
  vivify_334:
    set $P1505, $P1504[1]
    unless_null $P1505, vivify_335
    new $P1505, "Undef"
  vivify_335:
    if $P1505, if_1503
.annotate 'line', 464
    find_lex $P1521, "$str"
    find_lex $P1522, "$_"
    unless_null $P1522, vivify_336
    $P1522 = root_new ['parrot';'ResizablePMCArray']
  vivify_336:
    set $P1523, $P1522[0]
    unless_null $P1523, vivify_337
    new $P1523, "Undef"
  vivify_337:
    concat $P1524, $P1521, $P1523
    store_lex "$str", $P1524
    set $P1502, $P1524
.annotate 'line', 442
    goto if_1503_end
  if_1503:
    .const 'Sub' $P1507 = "88_1273884021.34483" 
    capture_lex $P1507
    $P1520 = $P1507()
    set $P1502, $P1520
  if_1503_end:
.annotate 'line', 441
    .return ($P1502)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1506"  :anon :subid("88_1273884021.34483") :outer("87_1273884021.34483")
.annotate 'line', 443
    new $P1508, "Undef"
    .lex "$a", $P1508
.annotate 'line', 444
    new $P1509, "Undef"
    .lex "$b", $P1509
.annotate 'line', 445
    new $P1510, "Undef"
    .lex "$c", $P1510
.annotate 'line', 443
    find_lex $P1511, "$_"
    unless_null $P1511, vivify_338
    $P1511 = root_new ['parrot';'ResizablePMCArray']
  vivify_338:
    set $P1512, $P1511[0]
    unless_null $P1512, vivify_339
    new $P1512, "Undef"
  vivify_339:
    store_lex "$a", $P1512
.annotate 'line', 444
    find_lex $P1513, "$_"
    unless_null $P1513, vivify_340
    $P1513 = root_new ['parrot';'ResizablePMCArray']
  vivify_340:
    set $P1514, $P1513[1]
    unless_null $P1514, vivify_341
    $P1514 = root_new ['parrot';'ResizablePMCArray']
  vivify_341:
    set $P1515, $P1514[0]
    unless_null $P1515, vivify_342
    new $P1515, "Undef"
  vivify_342:
    store_lex "$b", $P1515
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
                             $P1516 = box $S2
                         
    store_lex "$c", $P1516
.annotate 'line', 462
    find_lex $P1517, "$str"
    find_lex $P1518, "$c"
    concat $P1519, $P1517, $P1518
    store_lex "$str", $P1519
.annotate 'line', 442
    .return ($P1519)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1483"  :anon :subid("86_1273884021.34483") :outer("85_1273884021.34483")
.annotate 'line', 438
    new $P1485, "Undef"
    .lex "$name", $P1485
    find_lex $P1486, "$/"
    unless_null $P1486, vivify_343
    $P1486 = root_new ['parrot';'Hash']
  vivify_343:
    set $P1487, $P1486["name"]
    unless_null $P1487, vivify_344
    new $P1487, "Undef"
  vivify_344:
    set $S1488, $P1487
    new $P1489, 'String'
    set $P1489, $S1488
    store_lex "$name", $P1489
.annotate 'line', 439
    get_hll_global $P1490, ["PAST"], "Regex"
    find_lex $P1491, "$name"
    find_lex $P1492, "$/"
    $P1493 = $P1490."new"($P1491, "subrule" :named("pasttype"), "method" :named("subtype"), $P1492 :named("node"))
    store_lex "$past", $P1493
.annotate 'line', 437
    .return ($P1493)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "mod_internal"  :subid("89_1273884021.34483") :method :outer("11_1273884021.34483")
    .param pmc param_1544
.annotate 'line', 472
    new $P1543, 'ExceptionHandler'
    set_addr $P1543, control_1542
    $P1543."handle_types"(57)
    push_eh $P1543
    .lex "self", self
    .lex "$/", param_1544
.annotate 'line', 473
    $P1545 = root_new ['parrot';'Hash']
    .lex "%mods", $P1545
.annotate 'line', 474
    new $P1546, "Undef"
    .lex "$n", $P1546
.annotate 'line', 473
    get_global $P1547, "@MODIFIERS"
    unless_null $P1547, vivify_347
    $P1547 = root_new ['parrot';'ResizablePMCArray']
  vivify_347:
    set $P1548, $P1547[0]
    unless_null $P1548, vivify_348
    new $P1548, "Undef"
  vivify_348:
    store_lex "%mods", $P1548
.annotate 'line', 474
    find_lex $P1551, "$/"
    unless_null $P1551, vivify_349
    $P1551 = root_new ['parrot';'Hash']
  vivify_349:
    set $P1552, $P1551["n"]
    unless_null $P1552, vivify_350
    $P1552 = root_new ['parrot';'ResizablePMCArray']
  vivify_350:
    set $P1553, $P1552[0]
    unless_null $P1553, vivify_351
    new $P1553, "Undef"
  vivify_351:
    set $S1554, $P1553
    isgt $I1555, $S1554, ""
    if $I1555, if_1550
    new $P1560, "Integer"
    assign $P1560, 1
    set $P1549, $P1560
    goto if_1550_end
  if_1550:
    find_lex $P1556, "$/"
    unless_null $P1556, vivify_352
    $P1556 = root_new ['parrot';'Hash']
  vivify_352:
    set $P1557, $P1556["n"]
    unless_null $P1557, vivify_353
    $P1557 = root_new ['parrot';'ResizablePMCArray']
  vivify_353:
    set $P1558, $P1557[0]
    unless_null $P1558, vivify_354
    new $P1558, "Undef"
  vivify_354:
    set $N1559, $P1558
    new $P1549, 'Float'
    set $P1549, $N1559
  if_1550_end:
    store_lex "$n", $P1549
.annotate 'line', 475
    find_lex $P1561, "$n"
    find_lex $P1562, "$/"
    unless_null $P1562, vivify_355
    $P1562 = root_new ['parrot';'Hash']
  vivify_355:
    set $P1563, $P1562["mod_ident"]
    unless_null $P1563, vivify_356
    $P1563 = root_new ['parrot';'Hash']
  vivify_356:
    set $P1564, $P1563["sym"]
    unless_null $P1564, vivify_357
    new $P1564, "Undef"
  vivify_357:
    set $S1565, $P1564
    find_lex $P1566, "%mods"
    unless_null $P1566, vivify_358
    $P1566 = root_new ['parrot';'Hash']
    store_lex "%mods", $P1566
  vivify_358:
    set $P1566[$S1565], $P1561
.annotate 'line', 476
    find_lex $P1567, "$/"
    $P1568 = $P1567."!make"(0)
.annotate 'line', 472
    .return ($P1568)
  control_1542:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1569, exception, "payload"
    .return ($P1569)
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
