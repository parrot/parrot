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
.sub "_block11"  :anon :subid("10_1278500530.77787")
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
    $P596 = $P14()
.annotate 'line', 1
    .return ($P596)
    .const 'Sub' $P598 = "161_1278500530.77787" 
    .return ($P598)
.end


.namespace []
.sub "" :load :init :subid("post162") :outer("10_1278500530.77787")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1278500530.77787" 
    .local pmc block
    set block, $P12
    $P601 = get_root_global ["parrot"], "P6metaclass"
    $P601."new_class"("Regex::P6Regex::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block13"  :subid("11_1278500530.77787") :outer("10_1278500530.77787")
.annotate 'line', 3
    .const 'Sub' $P584 = "158_1278500530.77787" 
    capture_lex $P584
    .const 'Sub' $P576 = "156_1278500530.77787" 
    capture_lex $P576
    .const 'Sub' $P568 = "154_1278500530.77787" 
    capture_lex $P568
    .const 'Sub' $P547 = "149_1278500530.77787" 
    capture_lex $P547
    .const 'Sub' $P512 = "143_1278500530.77787" 
    capture_lex $P512
    .const 'Sub' $P500 = "140_1278500530.77787" 
    capture_lex $P500
    .const 'Sub' $P487 = "137_1278500530.77787" 
    capture_lex $P487
    .const 'Sub' $P481 = "135_1278500530.77787" 
    capture_lex $P481
    .const 'Sub' $P470 = "132_1278500530.77787" 
    capture_lex $P470
    .const 'Sub' $P459 = "129_1278500530.77787" 
    capture_lex $P459
    .const 'Sub' $P450 = "125_1278500530.77787" 
    capture_lex $P450
    .const 'Sub' $P444 = "123_1278500530.77787" 
    capture_lex $P444
    .const 'Sub' $P438 = "121_1278500530.77787" 
    capture_lex $P438
    .const 'Sub' $P432 = "119_1278500530.77787" 
    capture_lex $P432
    .const 'Sub' $P426 = "117_1278500530.77787" 
    capture_lex $P426
    .const 'Sub' $P418 = "115_1278500530.77787" 
    capture_lex $P418
    .const 'Sub' $P407 = "113_1278500530.77787" 
    capture_lex $P407
    .const 'Sub' $P396 = "111_1278500530.77787" 
    capture_lex $P396
    .const 'Sub' $P390 = "109_1278500530.77787" 
    capture_lex $P390
    .const 'Sub' $P384 = "107_1278500530.77787" 
    capture_lex $P384
    .const 'Sub' $P378 = "105_1278500530.77787" 
    capture_lex $P378
    .const 'Sub' $P372 = "103_1278500530.77787" 
    capture_lex $P372
    .const 'Sub' $P366 = "101_1278500530.77787" 
    capture_lex $P366
    .const 'Sub' $P360 = "99_1278500530.77787" 
    capture_lex $P360
    .const 'Sub' $P354 = "97_1278500530.77787" 
    capture_lex $P354
    .const 'Sub' $P348 = "95_1278500530.77787" 
    capture_lex $P348
    .const 'Sub' $P336 = "91_1278500530.77787" 
    capture_lex $P336
    .const 'Sub' $P324 = "89_1278500530.77787" 
    capture_lex $P324
    .const 'Sub' $P317 = "87_1278500530.77787" 
    capture_lex $P317
    .const 'Sub' $P300 = "85_1278500530.77787" 
    capture_lex $P300
    .const 'Sub' $P293 = "83_1278500530.77787" 
    capture_lex $P293
    .const 'Sub' $P287 = "81_1278500530.77787" 
    capture_lex $P287
    .const 'Sub' $P281 = "79_1278500530.77787" 
    capture_lex $P281
    .const 'Sub' $P274 = "77_1278500530.77787" 
    capture_lex $P274
    .const 'Sub' $P267 = "75_1278500530.77787" 
    capture_lex $P267
    .const 'Sub' $P260 = "73_1278500530.77787" 
    capture_lex $P260
    .const 'Sub' $P253 = "71_1278500530.77787" 
    capture_lex $P253
    .const 'Sub' $P247 = "69_1278500530.77787" 
    capture_lex $P247
    .const 'Sub' $P241 = "67_1278500530.77787" 
    capture_lex $P241
    .const 'Sub' $P235 = "65_1278500530.77787" 
    capture_lex $P235
    .const 'Sub' $P229 = "63_1278500530.77787" 
    capture_lex $P229
    .const 'Sub' $P223 = "61_1278500530.77787" 
    capture_lex $P223
    .const 'Sub' $P218 = "59_1278500530.77787" 
    capture_lex $P218
    .const 'Sub' $P213 = "57_1278500530.77787" 
    capture_lex $P213
    .const 'Sub' $P207 = "55_1278500530.77787" 
    capture_lex $P207
    .const 'Sub' $P201 = "53_1278500530.77787" 
    capture_lex $P201
    .const 'Sub' $P195 = "51_1278500530.77787" 
    capture_lex $P195
    .const 'Sub' $P179 = "46_1278500530.77787" 
    capture_lex $P179
    .const 'Sub' $P163 = "44_1278500530.77787" 
    capture_lex $P163
    .const 'Sub' $P156 = "42_1278500530.77787" 
    capture_lex $P156
    .const 'Sub' $P149 = "40_1278500530.77787" 
    capture_lex $P149
    .const 'Sub' $P142 = "38_1278500530.77787" 
    capture_lex $P142
    .const 'Sub' $P123 = "33_1278500530.77787" 
    capture_lex $P123
    .const 'Sub' $P110 = "30_1278500530.77787" 
    capture_lex $P110
    .const 'Sub' $P103 = "28_1278500530.77787" 
    capture_lex $P103
    .const 'Sub' $P91 = "26_1278500530.77787" 
    capture_lex $P91
    .const 'Sub' $P84 = "24_1278500530.77787" 
    capture_lex $P84
    .const 'Sub' $P71 = "22_1278500530.77787" 
    capture_lex $P71
    .const 'Sub' $P64 = "20_1278500530.77787" 
    capture_lex $P64
    .const 'Sub' $P56 = "18_1278500530.77787" 
    capture_lex $P56
    .const 'Sub' $P46 = "15_1278500530.77787" 
    capture_lex $P46
    .const 'Sub' $P38 = "13_1278500530.77787" 
    capture_lex $P38
    .const 'Sub' $P15 = "12_1278500530.77787" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    .const 'Sub' $P584 = "158_1278500530.77787" 
    capture_lex $P584
    .return ($P584)
    .const 'Sub' $P593 = "160_1278500530.77787" 
    .return ($P593)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.include "except_types.pasm"
.sub "obs"  :subid("12_1278500530.77787") :method :outer("11_1278500530.77787")
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
    if has_param_20, optparam_163
    new $P21, "String"
    assign $P21, "in Perl 6"
    set param_20, $P21
  optparam_163:
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
.sub "ws"  :subid("13_1278500530.77787") :method :outer("11_1278500530.77787")
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
.sub "!PREFIX__ws"  :subid("14_1278500530.77787") :method
.annotate 'line', 3
    new $P41, "ResizablePMCArray"
    push $P41, ""
    .return ($P41)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "normspace"  :subid("15_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .const 'Sub' $P52 = "17_1278500530.77787" 
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
    .const 'Sub' $P52 = "17_1278500530.77787" 
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
.sub "!PREFIX__normspace"  :subid("16_1278500530.77787") :method
.annotate 'line', 3
    new $P49, "ResizablePMCArray"
    push $P49, ""
    .return ($P49)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block51"  :anon :subid("17_1278500530.77787") :method :outer("15_1278500530.77787")
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
.sub "identifier"  :subid("18_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx57_tgt
    .local int rx57_pos
    .local int rx57_off
    .local int rx57_eos
    .local int rx57_rep
    .local pmc rx57_cur
    (rx57_cur, rx57_pos, rx57_tgt) = self."!cursor_start"()
    rx57_cur."!cursor_debug"("START ", "identifier")
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
    ne $I10, -1, rxscan61_done
    goto rxscan61_scan
  rxscan61_loop:
    ($P10) = rx57_cur."from"()
    inc $P10
    set rx57_pos, $P10
    ge rx57_pos, rx57_eos, rxscan61_done
  rxscan61_scan:
    set_addr $I10, rxscan61_loop
    rx57_cur."!mark_push"(0, rx57_pos, $I10)
  rxscan61_done:
.annotate 'line', 12
  # rx subrule "ident" subtype=method negate=
    rx57_cur."!cursor_pos"(rx57_pos)
    $P10 = rx57_cur."ident"()
    unless $P10, rx57_fail
    rx57_pos = $P10."pos"()
  # rx rxquantr62 ** 0..*
    set_addr $I63, rxquantr62_done
    rx57_cur."!mark_push"(0, rx57_pos, $I63)
  rxquantr62_loop:
  # rx enumcharlist negate=0 
    ge rx57_pos, rx57_eos, rx57_fail
    sub $I10, rx57_pos, rx57_off
    substr $S10, rx57_tgt, $I10, 1
    index $I11, "-'", $S10
    lt $I11, 0, rx57_fail
    inc rx57_pos
  # rx subrule "ident" subtype=method negate=
    rx57_cur."!cursor_pos"(rx57_pos)
    $P10 = rx57_cur."ident"()
    unless $P10, rx57_fail
    rx57_pos = $P10."pos"()
    (rx57_rep) = rx57_cur."!mark_commit"($I63)
    rx57_cur."!mark_push"(rx57_rep, rx57_pos, $I63)
    goto rxquantr62_loop
  rxquantr62_done:
  # rx pass
    rx57_cur."!cursor_pass"(rx57_pos, "identifier")
    rx57_cur."!cursor_debug"("PASS  ", "identifier", " at pos=", rx57_pos)
    .return (rx57_cur)
  rx57_fail:
.annotate 'line', 3
    (rx57_rep, rx57_pos, $I10, $P10) = rx57_cur."!mark_fail"(0)
    lt rx57_pos, -1, rx57_done
    eq rx57_pos, -1, rx57_fail
    jump $I10
  rx57_done:
    rx57_cur."!cursor_fail"()
    rx57_cur."!cursor_debug"("FAIL  ", "identifier")
    .return (rx57_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__identifier"  :subid("19_1278500530.77787") :method
.annotate 'line', 3
    $P59 = self."!PREFIX__!subrule"("ident", "")
    new $P60, "ResizablePMCArray"
    push $P60, $P59
    .return ($P60)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "arg"  :subid("20_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx65_tgt
    .local int rx65_pos
    .local int rx65_off
    .local int rx65_eos
    .local int rx65_rep
    .local pmc rx65_cur
    (rx65_cur, rx65_pos, rx65_tgt) = self."!cursor_start"()
    rx65_cur."!cursor_debug"("START ", "arg")
    .lex unicode:"$\x{a2}", rx65_cur
    .local pmc match
    .lex "$/", match
    length rx65_eos, rx65_tgt
    gt rx65_pos, rx65_eos, rx65_done
    set rx65_off, 0
    lt rx65_pos, 2, rx65_start
    sub rx65_off, rx65_pos, 1
    substr rx65_tgt, rx65_tgt, rx65_off
  rx65_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan68_done
    goto rxscan68_scan
  rxscan68_loop:
    ($P10) = rx65_cur."from"()
    inc $P10
    set rx65_pos, $P10
    ge rx65_pos, rx65_eos, rxscan68_done
  rxscan68_scan:
    set_addr $I10, rxscan68_loop
    rx65_cur."!mark_push"(0, rx65_pos, $I10)
  rxscan68_done:
  alt69_0:
.annotate 'line', 15
    set_addr $I10, alt69_1
    rx65_cur."!mark_push"(0, rx65_pos, $I10)
.annotate 'line', 16
  # rx enumcharlist negate=0 zerowidth
    ge rx65_pos, rx65_eos, rx65_fail
    sub $I10, rx65_pos, rx65_off
    substr $S10, rx65_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx65_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx65_cur."!cursor_pos"(rx65_pos)
    $P10 = rx65_cur."quote_EXPR"(":q")
    unless $P10, rx65_fail
    rx65_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx65_pos = $P10."pos"()
    goto alt69_end
  alt69_1:
    set_addr $I10, alt69_2
    rx65_cur."!mark_push"(0, rx65_pos, $I10)
.annotate 'line', 17
  # rx enumcharlist negate=0 zerowidth
    ge rx65_pos, rx65_eos, rx65_fail
    sub $I10, rx65_pos, rx65_off
    substr $S10, rx65_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx65_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx65_cur."!cursor_pos"(rx65_pos)
    $P10 = rx65_cur."quote_EXPR"(":qq")
    unless $P10, rx65_fail
    rx65_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx65_pos = $P10."pos"()
    goto alt69_end
  alt69_2:
.annotate 'line', 18
  # rx subcapture "val"
    set_addr $I10, rxcap_70_fail
    rx65_cur."!mark_push"(0, rx65_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx65_pos, rx65_off
    find_not_cclass $I11, 8, rx65_tgt, $I10, rx65_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx65_fail
    add rx65_pos, rx65_off, $I11
    set_addr $I10, rxcap_70_fail
    ($I12, $I11) = rx65_cur."!mark_peek"($I10)
    rx65_cur."!cursor_pos"($I11)
    ($P10) = rx65_cur."!cursor_start"()
    $P10."!cursor_pass"(rx65_pos, "")
    rx65_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("val")
    goto rxcap_70_done
  rxcap_70_fail:
    goto rx65_fail
  rxcap_70_done:
  alt69_end:
.annotate 'line', 14
  # rx pass
    rx65_cur."!cursor_pass"(rx65_pos, "arg")
    rx65_cur."!cursor_debug"("PASS  ", "arg", " at pos=", rx65_pos)
    .return (rx65_cur)
  rx65_fail:
.annotate 'line', 3
    (rx65_rep, rx65_pos, $I10, $P10) = rx65_cur."!mark_fail"(0)
    lt rx65_pos, -1, rx65_done
    eq rx65_pos, -1, rx65_fail
    jump $I10
  rx65_done:
    rx65_cur."!cursor_fail"()
    rx65_cur."!cursor_debug"("FAIL  ", "arg")
    .return (rx65_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__arg"  :subid("21_1278500530.77787") :method
.annotate 'line', 3
    new $P67, "ResizablePMCArray"
    push $P67, ""
    push $P67, "\""
    push $P67, "'"
    .return ($P67)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "arglist"  :subid("22_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx72_tgt
    .local int rx72_pos
    .local int rx72_off
    .local int rx72_eos
    .local int rx72_rep
    .local pmc rx72_cur
    (rx72_cur, rx72_pos, rx72_tgt) = self."!cursor_start"()
    rx72_cur."!cursor_debug"("START ", "arglist")
    rx72_cur."!cursor_caparray"("arg")
    .lex unicode:"$\x{a2}", rx72_cur
    .local pmc match
    .lex "$/", match
    length rx72_eos, rx72_tgt
    gt rx72_pos, rx72_eos, rx72_done
    set rx72_off, 0
    lt rx72_pos, 2, rx72_start
    sub rx72_off, rx72_pos, 1
    substr rx72_tgt, rx72_tgt, rx72_off
  rx72_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan76_done
    goto rxscan76_scan
  rxscan76_loop:
    ($P10) = rx72_cur."from"()
    inc $P10
    set rx72_pos, $P10
    ge rx72_pos, rx72_eos, rxscan76_done
  rxscan76_scan:
    set_addr $I10, rxscan76_loop
    rx72_cur."!mark_push"(0, rx72_pos, $I10)
  rxscan76_done:
.annotate 'line', 22
  # rx subrule "ws" subtype=method negate=
    rx72_cur."!cursor_pos"(rx72_pos)
    $P10 = rx72_cur."ws"()
    unless $P10, rx72_fail
    rx72_pos = $P10."pos"()
  # rx subrule "arg" subtype=capture negate=
    rx72_cur."!cursor_pos"(rx72_pos)
    $P10 = rx72_cur."arg"()
    unless $P10, rx72_fail
    rx72_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arg")
    rx72_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx72_cur."!cursor_pos"(rx72_pos)
    $P10 = rx72_cur."ws"()
    unless $P10, rx72_fail
    rx72_pos = $P10."pos"()
  # rx rxquantr79 ** 0..*
    set_addr $I82, rxquantr79_done
    rx72_cur."!mark_push"(0, rx72_pos, $I82)
  rxquantr79_loop:
  # rx subrule "ws" subtype=method negate=
    rx72_cur."!cursor_pos"(rx72_pos)
    $P10 = rx72_cur."ws"()
    unless $P10, rx72_fail
    rx72_pos = $P10."pos"()
  # rx literal  ","
    add $I11, rx72_pos, 1
    gt $I11, rx72_eos, rx72_fail
    sub $I11, rx72_pos, rx72_off
    substr $S10, rx72_tgt, $I11, 1
    ne $S10, ",", rx72_fail
    add rx72_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx72_cur."!cursor_pos"(rx72_pos)
    $P10 = rx72_cur."ws"()
    unless $P10, rx72_fail
    rx72_pos = $P10."pos"()
  # rx subrule "arg" subtype=capture negate=
    rx72_cur."!cursor_pos"(rx72_pos)
    $P10 = rx72_cur."arg"()
    unless $P10, rx72_fail
    rx72_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arg")
    rx72_pos = $P10."pos"()
    (rx72_rep) = rx72_cur."!mark_commit"($I82)
    rx72_cur."!mark_push"(rx72_rep, rx72_pos, $I82)
    goto rxquantr79_loop
  rxquantr79_done:
  # rx subrule "ws" subtype=method negate=
    rx72_cur."!cursor_pos"(rx72_pos)
    $P10 = rx72_cur."ws"()
    unless $P10, rx72_fail
    rx72_pos = $P10."pos"()
  # rx pass
    rx72_cur."!cursor_pass"(rx72_pos, "arglist")
    rx72_cur."!cursor_debug"("PASS  ", "arglist", " at pos=", rx72_pos)
    .return (rx72_cur)
  rx72_fail:
.annotate 'line', 3
    (rx72_rep, rx72_pos, $I10, $P10) = rx72_cur."!mark_fail"(0)
    lt rx72_pos, -1, rx72_done
    eq rx72_pos, -1, rx72_fail
    jump $I10
  rx72_done:
    rx72_cur."!cursor_fail"()
    rx72_cur."!cursor_debug"("FAIL  ", "arglist")
    .return (rx72_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__arglist"  :subid("23_1278500530.77787") :method
.annotate 'line', 3
    $P74 = self."!PREFIX__!subrule"("ws", "")
    new $P75, "ResizablePMCArray"
    push $P75, $P74
    .return ($P75)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "TOP"  :subid("24_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx85_tgt
    .local int rx85_pos
    .local int rx85_off
    .local int rx85_eos
    .local int rx85_rep
    .local pmc rx85_cur
    (rx85_cur, rx85_pos, rx85_tgt) = self."!cursor_start"()
    rx85_cur."!cursor_debug"("START ", "TOP")
    .lex unicode:"$\x{a2}", rx85_cur
    .local pmc match
    .lex "$/", match
    length rx85_eos, rx85_tgt
    gt rx85_pos, rx85_eos, rx85_done
    set rx85_off, 0
    lt rx85_pos, 2, rx85_start
    sub rx85_off, rx85_pos, 1
    substr rx85_tgt, rx85_tgt, rx85_off
  rx85_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan89_done
    goto rxscan89_scan
  rxscan89_loop:
    ($P10) = rx85_cur."from"()
    inc $P10
    set rx85_pos, $P10
    ge rx85_pos, rx85_eos, rxscan89_done
  rxscan89_scan:
    set_addr $I10, rxscan89_loop
    rx85_cur."!mark_push"(0, rx85_pos, $I10)
  rxscan89_done:
.annotate 'line', 25
  # rx subrule "nibbler" subtype=capture negate=
    rx85_cur."!cursor_pos"(rx85_pos)
    $P10 = rx85_cur."nibbler"()
    unless $P10, rx85_fail
    rx85_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx85_pos = $P10."pos"()
  alt90_0:
.annotate 'line', 26
    set_addr $I10, alt90_1
    rx85_cur."!mark_push"(0, rx85_pos, $I10)
  # rxanchor eos
    ne rx85_pos, rx85_eos, rx85_fail
    goto alt90_end
  alt90_1:
  # rx subrule "panic" subtype=method negate=
    rx85_cur."!cursor_pos"(rx85_pos)
    $P10 = rx85_cur."panic"("Confused")
    unless $P10, rx85_fail
    rx85_pos = $P10."pos"()
  alt90_end:
.annotate 'line', 24
  # rx pass
    rx85_cur."!cursor_pass"(rx85_pos, "TOP")
    rx85_cur."!cursor_debug"("PASS  ", "TOP", " at pos=", rx85_pos)
    .return (rx85_cur)
  rx85_fail:
.annotate 'line', 3
    (rx85_rep, rx85_pos, $I10, $P10) = rx85_cur."!mark_fail"(0)
    lt rx85_pos, -1, rx85_done
    eq rx85_pos, -1, rx85_fail
    jump $I10
  rx85_done:
    rx85_cur."!cursor_fail"()
    rx85_cur."!cursor_debug"("FAIL  ", "TOP")
    .return (rx85_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__TOP"  :subid("25_1278500530.77787") :method
.annotate 'line', 3
    $P87 = self."!PREFIX__!subrule"("nibbler", "")
    new $P88, "ResizablePMCArray"
    push $P88, $P87
    .return ($P88)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "nibbler"  :subid("26_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx92_tgt
    .local int rx92_pos
    .local int rx92_off
    .local int rx92_eos
    .local int rx92_rep
    .local pmc rx92_cur
    (rx92_cur, rx92_pos, rx92_tgt) = self."!cursor_start"()
    rx92_cur."!cursor_debug"("START ", "nibbler")
    rx92_cur."!cursor_caparray"("termish")
    .lex unicode:"$\x{a2}", rx92_cur
    .local pmc match
    .lex "$/", match
    length rx92_eos, rx92_tgt
    gt rx92_pos, rx92_eos, rx92_done
    set rx92_off, 0
    lt rx92_pos, 2, rx92_start
    sub rx92_off, rx92_pos, 1
    substr rx92_tgt, rx92_tgt, rx92_off
  rx92_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan95_done
    goto rxscan95_scan
  rxscan95_loop:
    ($P10) = rx92_cur."from"()
    inc $P10
    set rx92_pos, $P10
    ge rx92_pos, rx92_eos, rxscan95_done
  rxscan95_scan:
    set_addr $I10, rxscan95_loop
    rx92_cur."!mark_push"(0, rx92_pos, $I10)
  rxscan95_done:
.annotate 'line', 30
  # rx reduce name="nibbler" key="open"
    rx92_cur."!cursor_pos"(rx92_pos)
    rx92_cur."!reduce"("nibbler", "open")
.annotate 'line', 31
  # rx rxquantr96 ** 0..1
    set_addr $I98, rxquantr96_done
    rx92_cur."!mark_push"(0, rx92_pos, $I98)
  rxquantr96_loop:
  # rx subrule "ws" subtype=method negate=
    rx92_cur."!cursor_pos"(rx92_pos)
    $P10 = rx92_cur."ws"()
    unless $P10, rx92_fail
    rx92_pos = $P10."pos"()
  alt97_0:
    set_addr $I10, alt97_1
    rx92_cur."!mark_push"(0, rx92_pos, $I10)
  # rx literal  "||"
    add $I11, rx92_pos, 2
    gt $I11, rx92_eos, rx92_fail
    sub $I11, rx92_pos, rx92_off
    substr $S10, rx92_tgt, $I11, 2
    ne $S10, "||", rx92_fail
    add rx92_pos, 2
    goto alt97_end
  alt97_1:
    set_addr $I10, alt97_2
    rx92_cur."!mark_push"(0, rx92_pos, $I10)
  # rx literal  "|"
    add $I11, rx92_pos, 1
    gt $I11, rx92_eos, rx92_fail
    sub $I11, rx92_pos, rx92_off
    substr $S10, rx92_tgt, $I11, 1
    ne $S10, "|", rx92_fail
    add rx92_pos, 1
    goto alt97_end
  alt97_2:
    set_addr $I10, alt97_3
    rx92_cur."!mark_push"(0, rx92_pos, $I10)
  # rx literal  "&&"
    add $I11, rx92_pos, 2
    gt $I11, rx92_eos, rx92_fail
    sub $I11, rx92_pos, rx92_off
    substr $S10, rx92_tgt, $I11, 2
    ne $S10, "&&", rx92_fail
    add rx92_pos, 2
    goto alt97_end
  alt97_3:
  # rx literal  "&"
    add $I11, rx92_pos, 1
    gt $I11, rx92_eos, rx92_fail
    sub $I11, rx92_pos, rx92_off
    substr $S10, rx92_tgt, $I11, 1
    ne $S10, "&", rx92_fail
    add rx92_pos, 1
  alt97_end:
    (rx92_rep) = rx92_cur."!mark_commit"($I98)
  rxquantr96_done:
.annotate 'line', 32
  # rx subrule "termish" subtype=capture negate=
    rx92_cur."!cursor_pos"(rx92_pos)
    $P10 = rx92_cur."termish"()
    unless $P10, rx92_fail
    rx92_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("termish")
    rx92_pos = $P10."pos"()
.annotate 'line', 35
  # rx rxquantr99 ** 0..*
    set_addr $I102, rxquantr99_done
    rx92_cur."!mark_push"(0, rx92_pos, $I102)
  rxquantr99_loop:
  alt100_0:
.annotate 'line', 33
    set_addr $I10, alt100_1
    rx92_cur."!mark_push"(0, rx92_pos, $I10)
  # rx literal  "||"
    add $I11, rx92_pos, 2
    gt $I11, rx92_eos, rx92_fail
    sub $I11, rx92_pos, rx92_off
    substr $S10, rx92_tgt, $I11, 2
    ne $S10, "||", rx92_fail
    add rx92_pos, 2
    goto alt100_end
  alt100_1:
  # rx literal  "|"
    add $I11, rx92_pos, 1
    gt $I11, rx92_eos, rx92_fail
    sub $I11, rx92_pos, rx92_off
    substr $S10, rx92_tgt, $I11, 1
    ne $S10, "|", rx92_fail
    add rx92_pos, 1
  alt100_end:
  alt101_0:
.annotate 'line', 34
    set_addr $I10, alt101_1
    rx92_cur."!mark_push"(0, rx92_pos, $I10)
  # rx subrule "termish" subtype=capture negate=
    rx92_cur."!cursor_pos"(rx92_pos)
    $P10 = rx92_cur."termish"()
    unless $P10, rx92_fail
    rx92_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("termish")
    rx92_pos = $P10."pos"()
    goto alt101_end
  alt101_1:
  # rx subrule "panic" subtype=method negate=
    rx92_cur."!cursor_pos"(rx92_pos)
    $P10 = rx92_cur."panic"("Null pattern not allowed")
    unless $P10, rx92_fail
    rx92_pos = $P10."pos"()
  alt101_end:
.annotate 'line', 35
    (rx92_rep) = rx92_cur."!mark_commit"($I102)
    rx92_cur."!mark_push"(rx92_rep, rx92_pos, $I102)
    goto rxquantr99_loop
  rxquantr99_done:
.annotate 'line', 29
  # rx pass
    rx92_cur."!cursor_pass"(rx92_pos, "nibbler")
    rx92_cur."!cursor_debug"("PASS  ", "nibbler", " at pos=", rx92_pos)
    .return (rx92_cur)
  rx92_fail:
.annotate 'line', 3
    (rx92_rep, rx92_pos, $I10, $P10) = rx92_cur."!mark_fail"(0)
    lt rx92_pos, -1, rx92_done
    eq rx92_pos, -1, rx92_fail
    jump $I10
  rx92_done:
    rx92_cur."!cursor_fail"()
    rx92_cur."!cursor_debug"("FAIL  ", "nibbler")
    .return (rx92_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__nibbler"  :subid("27_1278500530.77787") :method
.annotate 'line', 3
    new $P94, "ResizablePMCArray"
    push $P94, ""
    .return ($P94)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "termish"  :subid("28_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx104_tgt
    .local int rx104_pos
    .local int rx104_off
    .local int rx104_eos
    .local int rx104_rep
    .local pmc rx104_cur
    (rx104_cur, rx104_pos, rx104_tgt) = self."!cursor_start"()
    rx104_cur."!cursor_debug"("START ", "termish")
    rx104_cur."!cursor_caparray"("noun")
    .lex unicode:"$\x{a2}", rx104_cur
    .local pmc match
    .lex "$/", match
    length rx104_eos, rx104_tgt
    gt rx104_pos, rx104_eos, rx104_done
    set rx104_off, 0
    lt rx104_pos, 2, rx104_start
    sub rx104_off, rx104_pos, 1
    substr rx104_tgt, rx104_tgt, rx104_off
  rx104_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan107_done
    goto rxscan107_scan
  rxscan107_loop:
    ($P10) = rx104_cur."from"()
    inc $P10
    set rx104_pos, $P10
    ge rx104_pos, rx104_eos, rxscan107_done
  rxscan107_scan:
    set_addr $I10, rxscan107_loop
    rx104_cur."!mark_push"(0, rx104_pos, $I10)
  rxscan107_done:
.annotate 'line', 39
  # rx rxquantr108 ** 1..*
    set_addr $I109, rxquantr108_done
    rx104_cur."!mark_push"(0, -1, $I109)
  rxquantr108_loop:
  # rx subrule "quantified_atom" subtype=capture negate=
    rx104_cur."!cursor_pos"(rx104_pos)
    $P10 = rx104_cur."quantified_atom"()
    unless $P10, rx104_fail
    rx104_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("noun")
    rx104_pos = $P10."pos"()
    (rx104_rep) = rx104_cur."!mark_commit"($I109)
    rx104_cur."!mark_push"(rx104_rep, rx104_pos, $I109)
    goto rxquantr108_loop
  rxquantr108_done:
.annotate 'line', 38
  # rx pass
    rx104_cur."!cursor_pass"(rx104_pos, "termish")
    rx104_cur."!cursor_debug"("PASS  ", "termish", " at pos=", rx104_pos)
    .return (rx104_cur)
  rx104_fail:
.annotate 'line', 3
    (rx104_rep, rx104_pos, $I10, $P10) = rx104_cur."!mark_fail"(0)
    lt rx104_pos, -1, rx104_done
    eq rx104_pos, -1, rx104_fail
    jump $I10
  rx104_done:
    rx104_cur."!cursor_fail"()
    rx104_cur."!cursor_debug"("FAIL  ", "termish")
    .return (rx104_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__termish"  :subid("29_1278500530.77787") :method
.annotate 'line', 3
    new $P106, "ResizablePMCArray"
    push $P106, ""
    .return ($P106)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantified_atom"  :subid("30_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .const 'Sub' $P119 = "32_1278500530.77787" 
    capture_lex $P119
    .local string rx111_tgt
    .local int rx111_pos
    .local int rx111_off
    .local int rx111_eos
    .local int rx111_rep
    .local pmc rx111_cur
    (rx111_cur, rx111_pos, rx111_tgt) = self."!cursor_start"()
    rx111_cur."!cursor_debug"("START ", "quantified_atom")
    rx111_cur."!cursor_caparray"("quantifier", "backmod")
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
    ne $I10, -1, rxscan115_done
    goto rxscan115_scan
  rxscan115_loop:
    ($P10) = rx111_cur."from"()
    inc $P10
    set rx111_pos, $P10
    ge rx111_pos, rx111_eos, rxscan115_done
  rxscan115_scan:
    set_addr $I10, rxscan115_loop
    rx111_cur."!mark_push"(0, rx111_pos, $I10)
  rxscan115_done:
.annotate 'line', 43
  # rx subrule "atom" subtype=capture negate=
    rx111_cur."!cursor_pos"(rx111_pos)
    $P10 = rx111_cur."atom"()
    unless $P10, rx111_fail
    rx111_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("atom")
    rx111_pos = $P10."pos"()
  # rx rxquantr116 ** 0..1
    set_addr $I122, rxquantr116_done
    rx111_cur."!mark_push"(0, rx111_pos, $I122)
  rxquantr116_loop:
  # rx subrule "ws" subtype=method negate=
    rx111_cur."!cursor_pos"(rx111_pos)
    $P10 = rx111_cur."ws"()
    unless $P10, rx111_fail
    rx111_pos = $P10."pos"()
  alt117_0:
    set_addr $I10, alt117_1
    rx111_cur."!mark_push"(0, rx111_pos, $I10)
  # rx subrule "quantifier" subtype=capture negate=
    rx111_cur."!cursor_pos"(rx111_pos)
    $P10 = rx111_cur."quantifier"()
    unless $P10, rx111_fail
    rx111_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantifier")
    rx111_pos = $P10."pos"()
    goto alt117_end
  alt117_1:
  # rx subrule "before" subtype=zerowidth negate=
    rx111_cur."!cursor_pos"(rx111_pos)
    .const 'Sub' $P119 = "32_1278500530.77787" 
    capture_lex $P119
    $P10 = rx111_cur."before"($P119)
    unless $P10, rx111_fail
  # rx subrule "backmod" subtype=capture negate=
    rx111_cur."!cursor_pos"(rx111_pos)
    $P10 = rx111_cur."backmod"()
    unless $P10, rx111_fail
    rx111_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx111_pos = $P10."pos"()
  # rx subrule "alpha" subtype=zerowidth negate=1
    rx111_cur."!cursor_pos"(rx111_pos)
    $P10 = rx111_cur."alpha"()
    if $P10, rx111_fail
  alt117_end:
    (rx111_rep) = rx111_cur."!mark_commit"($I122)
  rxquantr116_done:
.annotate 'line', 42
  # rx pass
    rx111_cur."!cursor_pass"(rx111_pos, "quantified_atom")
    rx111_cur."!cursor_debug"("PASS  ", "quantified_atom", " at pos=", rx111_pos)
    .return (rx111_cur)
  rx111_fail:
.annotate 'line', 3
    (rx111_rep, rx111_pos, $I10, $P10) = rx111_cur."!mark_fail"(0)
    lt rx111_pos, -1, rx111_done
    eq rx111_pos, -1, rx111_fail
    jump $I10
  rx111_done:
    rx111_cur."!cursor_fail"()
    rx111_cur."!cursor_debug"("FAIL  ", "quantified_atom")
    .return (rx111_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantified_atom"  :subid("31_1278500530.77787") :method
.annotate 'line', 3
    $P113 = self."!PREFIX__!subrule"("atom", "")
    new $P114, "ResizablePMCArray"
    push $P114, $P113
    .return ($P114)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block118"  :anon :subid("32_1278500530.77787") :method :outer("30_1278500530.77787")
.annotate 'line', 43
    .local string rx120_tgt
    .local int rx120_pos
    .local int rx120_off
    .local int rx120_eos
    .local int rx120_rep
    .local pmc rx120_cur
    (rx120_cur, rx120_pos, rx120_tgt) = self."!cursor_start"()
    rx120_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx120_cur
    .local pmc match
    .lex "$/", match
    length rx120_eos, rx120_tgt
    gt rx120_pos, rx120_eos, rx120_done
    set rx120_off, 0
    lt rx120_pos, 2, rx120_start
    sub rx120_off, rx120_pos, 1
    substr rx120_tgt, rx120_tgt, rx120_off
  rx120_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan121_done
    goto rxscan121_scan
  rxscan121_loop:
    ($P10) = rx120_cur."from"()
    inc $P10
    set rx120_pos, $P10
    ge rx120_pos, rx120_eos, rxscan121_done
  rxscan121_scan:
    set_addr $I10, rxscan121_loop
    rx120_cur."!mark_push"(0, rx120_pos, $I10)
  rxscan121_done:
  # rx literal  ":"
    add $I11, rx120_pos, 1
    gt $I11, rx120_eos, rx120_fail
    sub $I11, rx120_pos, rx120_off
    substr $S10, rx120_tgt, $I11, 1
    ne $S10, ":", rx120_fail
    add rx120_pos, 1
  # rx pass
    rx120_cur."!cursor_pass"(rx120_pos, "")
    rx120_cur."!cursor_debug"("PASS  ", "", " at pos=", rx120_pos)
    .return (rx120_cur)
  rx120_fail:
    (rx120_rep, rx120_pos, $I10, $P10) = rx120_cur."!mark_fail"(0)
    lt rx120_pos, -1, rx120_done
    eq rx120_pos, -1, rx120_fail
    jump $I10
  rx120_done:
    rx120_cur."!cursor_fail"()
    rx120_cur."!cursor_debug"("FAIL  ", "")
    .return (rx120_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "atom"  :subid("33_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .const 'Sub' $P134 = "35_1278500530.77787" 
    capture_lex $P134
    .local string rx124_tgt
    .local int rx124_pos
    .local int rx124_off
    .local int rx124_eos
    .local int rx124_rep
    .local pmc rx124_cur
    (rx124_cur, rx124_pos, rx124_tgt) = self."!cursor_start"()
    rx124_cur."!cursor_debug"("START ", "atom")
    .lex unicode:"$\x{a2}", rx124_cur
    .local pmc match
    .lex "$/", match
    length rx124_eos, rx124_tgt
    gt rx124_pos, rx124_eos, rx124_done
    set rx124_off, 0
    lt rx124_pos, 2, rx124_start
    sub rx124_off, rx124_pos, 1
    substr rx124_tgt, rx124_tgt, rx124_off
  rx124_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan128_done
    goto rxscan128_scan
  rxscan128_loop:
    ($P10) = rx124_cur."from"()
    inc $P10
    set rx124_pos, $P10
    ge rx124_pos, rx124_eos, rxscan128_done
  rxscan128_scan:
    set_addr $I10, rxscan128_loop
    rx124_cur."!mark_push"(0, rx124_pos, $I10)
  rxscan128_done:
  alt129_0:
.annotate 'line', 48
    set_addr $I10, alt129_1
    rx124_cur."!mark_push"(0, rx124_pos, $I10)
.annotate 'line', 49
  # rx charclass w
    ge rx124_pos, rx124_eos, rx124_fail
    sub $I10, rx124_pos, rx124_off
    is_cclass $I11, 8192, rx124_tgt, $I10
    unless $I11, rx124_fail
    inc rx124_pos
  # rx rxquantr130 ** 0..1
    set_addr $I137, rxquantr130_done
    rx124_cur."!mark_push"(0, rx124_pos, $I137)
  rxquantr130_loop:
  # rx rxquantg131 ** 1..*
    set_addr $I132, rxquantg131_done
  rxquantg131_loop:
  # rx charclass w
    ge rx124_pos, rx124_eos, rx124_fail
    sub $I10, rx124_pos, rx124_off
    is_cclass $I11, 8192, rx124_tgt, $I10
    unless $I11, rx124_fail
    inc rx124_pos
    rx124_cur."!mark_push"(rx124_rep, rx124_pos, $I132)
    goto rxquantg131_loop
  rxquantg131_done:
  # rx subrule "before" subtype=zerowidth negate=
    rx124_cur."!cursor_pos"(rx124_pos)
    .const 'Sub' $P134 = "35_1278500530.77787" 
    capture_lex $P134
    $P10 = rx124_cur."before"($P134)
    unless $P10, rx124_fail
    (rx124_rep) = rx124_cur."!mark_commit"($I137)
  rxquantr130_done:
    goto alt129_end
  alt129_1:
.annotate 'line', 50
  # rx subrule "metachar" subtype=capture negate=
    rx124_cur."!cursor_pos"(rx124_pos)
    $P10 = rx124_cur."metachar"()
    unless $P10, rx124_fail
    rx124_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("metachar")
    rx124_pos = $P10."pos"()
  alt129_end:
.annotate 'line', 46
  # rx pass
    rx124_cur."!cursor_pass"(rx124_pos, "atom")
    rx124_cur."!cursor_debug"("PASS  ", "atom", " at pos=", rx124_pos)
    .return (rx124_cur)
  rx124_fail:
.annotate 'line', 3
    (rx124_rep, rx124_pos, $I10, $P10) = rx124_cur."!mark_fail"(0)
    lt rx124_pos, -1, rx124_done
    eq rx124_pos, -1, rx124_fail
    jump $I10
  rx124_done:
    rx124_cur."!cursor_fail"()
    rx124_cur."!cursor_debug"("FAIL  ", "atom")
    .return (rx124_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__atom"  :subid("34_1278500530.77787") :method
.annotate 'line', 3
    $P126 = self."!PREFIX__!subrule"("metachar", "")
    new $P127, "ResizablePMCArray"
    push $P127, $P126
    push $P127, ""
    .return ($P127)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block133"  :anon :subid("35_1278500530.77787") :method :outer("33_1278500530.77787")
.annotate 'line', 49
    .local string rx135_tgt
    .local int rx135_pos
    .local int rx135_off
    .local int rx135_eos
    .local int rx135_rep
    .local pmc rx135_cur
    (rx135_cur, rx135_pos, rx135_tgt) = self."!cursor_start"()
    rx135_cur."!cursor_debug"("START ", "")
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
    ne $I10, -1, rxscan136_done
    goto rxscan136_scan
  rxscan136_loop:
    ($P10) = rx135_cur."from"()
    inc $P10
    set rx135_pos, $P10
    ge rx135_pos, rx135_eos, rxscan136_done
  rxscan136_scan:
    set_addr $I10, rxscan136_loop
    rx135_cur."!mark_push"(0, rx135_pos, $I10)
  rxscan136_done:
  # rx charclass w
    ge rx135_pos, rx135_eos, rx135_fail
    sub $I10, rx135_pos, rx135_off
    is_cclass $I11, 8192, rx135_tgt, $I10
    unless $I11, rx135_fail
    inc rx135_pos
  # rx pass
    rx135_cur."!cursor_pass"(rx135_pos, "")
    rx135_cur."!cursor_debug"("PASS  ", "", " at pos=", rx135_pos)
    .return (rx135_cur)
  rx135_fail:
    (rx135_rep, rx135_pos, $I10, $P10) = rx135_cur."!mark_fail"(0)
    lt rx135_pos, -1, rx135_done
    eq rx135_pos, -1, rx135_fail
    jump $I10
  rx135_done:
    rx135_cur."!cursor_fail"()
    rx135_cur."!cursor_debug"("FAIL  ", "")
    .return (rx135_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier"  :subid("36_1278500530.77787") :method
.annotate 'line', 54
    $P139 = self."!protoregex"("quantifier")
    .return ($P139)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier"  :subid("37_1278500530.77787") :method
.annotate 'line', 54
    $P141 = self."!PREFIX__!protoregex"("quantifier")
    .return ($P141)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<*>"  :subid("38_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx143_tgt
    .local int rx143_pos
    .local int rx143_off
    .local int rx143_eos
    .local int rx143_rep
    .local pmc rx143_cur
    (rx143_cur, rx143_pos, rx143_tgt) = self."!cursor_start"()
    rx143_cur."!cursor_debug"("START ", "quantifier:sym<*>")
    .lex unicode:"$\x{a2}", rx143_cur
    .local pmc match
    .lex "$/", match
    length rx143_eos, rx143_tgt
    gt rx143_pos, rx143_eos, rx143_done
    set rx143_off, 0
    lt rx143_pos, 2, rx143_start
    sub rx143_off, rx143_pos, 1
    substr rx143_tgt, rx143_tgt, rx143_off
  rx143_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan147_done
    goto rxscan147_scan
  rxscan147_loop:
    ($P10) = rx143_cur."from"()
    inc $P10
    set rx143_pos, $P10
    ge rx143_pos, rx143_eos, rxscan147_done
  rxscan147_scan:
    set_addr $I10, rxscan147_loop
    rx143_cur."!mark_push"(0, rx143_pos, $I10)
  rxscan147_done:
.annotate 'line', 55
  # rx subcapture "sym"
    set_addr $I10, rxcap_148_fail
    rx143_cur."!mark_push"(0, rx143_pos, $I10)
  # rx literal  "*"
    add $I11, rx143_pos, 1
    gt $I11, rx143_eos, rx143_fail
    sub $I11, rx143_pos, rx143_off
    substr $S10, rx143_tgt, $I11, 1
    ne $S10, "*", rx143_fail
    add rx143_pos, 1
    set_addr $I10, rxcap_148_fail
    ($I12, $I11) = rx143_cur."!mark_peek"($I10)
    rx143_cur."!cursor_pos"($I11)
    ($P10) = rx143_cur."!cursor_start"()
    $P10."!cursor_pass"(rx143_pos, "")
    rx143_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_148_done
  rxcap_148_fail:
    goto rx143_fail
  rxcap_148_done:
  # rx subrule "backmod" subtype=capture negate=
    rx143_cur."!cursor_pos"(rx143_pos)
    $P10 = rx143_cur."backmod"()
    unless $P10, rx143_fail
    rx143_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx143_pos = $P10."pos"()
  # rx pass
    rx143_cur."!cursor_pass"(rx143_pos, "quantifier:sym<*>")
    rx143_cur."!cursor_debug"("PASS  ", "quantifier:sym<*>", " at pos=", rx143_pos)
    .return (rx143_cur)
  rx143_fail:
.annotate 'line', 3
    (rx143_rep, rx143_pos, $I10, $P10) = rx143_cur."!mark_fail"(0)
    lt rx143_pos, -1, rx143_done
    eq rx143_pos, -1, rx143_fail
    jump $I10
  rx143_done:
    rx143_cur."!cursor_fail"()
    rx143_cur."!cursor_debug"("FAIL  ", "quantifier:sym<*>")
    .return (rx143_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<*>"  :subid("39_1278500530.77787") :method
.annotate 'line', 3
    $P145 = self."!PREFIX__!subrule"("backmod", "*")
    new $P146, "ResizablePMCArray"
    push $P146, $P145
    .return ($P146)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<+>"  :subid("40_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx150_tgt
    .local int rx150_pos
    .local int rx150_off
    .local int rx150_eos
    .local int rx150_rep
    .local pmc rx150_cur
    (rx150_cur, rx150_pos, rx150_tgt) = self."!cursor_start"()
    rx150_cur."!cursor_debug"("START ", "quantifier:sym<+>")
    .lex unicode:"$\x{a2}", rx150_cur
    .local pmc match
    .lex "$/", match
    length rx150_eos, rx150_tgt
    gt rx150_pos, rx150_eos, rx150_done
    set rx150_off, 0
    lt rx150_pos, 2, rx150_start
    sub rx150_off, rx150_pos, 1
    substr rx150_tgt, rx150_tgt, rx150_off
  rx150_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan154_done
    goto rxscan154_scan
  rxscan154_loop:
    ($P10) = rx150_cur."from"()
    inc $P10
    set rx150_pos, $P10
    ge rx150_pos, rx150_eos, rxscan154_done
  rxscan154_scan:
    set_addr $I10, rxscan154_loop
    rx150_cur."!mark_push"(0, rx150_pos, $I10)
  rxscan154_done:
.annotate 'line', 56
  # rx subcapture "sym"
    set_addr $I10, rxcap_155_fail
    rx150_cur."!mark_push"(0, rx150_pos, $I10)
  # rx literal  "+"
    add $I11, rx150_pos, 1
    gt $I11, rx150_eos, rx150_fail
    sub $I11, rx150_pos, rx150_off
    substr $S10, rx150_tgt, $I11, 1
    ne $S10, "+", rx150_fail
    add rx150_pos, 1
    set_addr $I10, rxcap_155_fail
    ($I12, $I11) = rx150_cur."!mark_peek"($I10)
    rx150_cur."!cursor_pos"($I11)
    ($P10) = rx150_cur."!cursor_start"()
    $P10."!cursor_pass"(rx150_pos, "")
    rx150_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_155_done
  rxcap_155_fail:
    goto rx150_fail
  rxcap_155_done:
  # rx subrule "backmod" subtype=capture negate=
    rx150_cur."!cursor_pos"(rx150_pos)
    $P10 = rx150_cur."backmod"()
    unless $P10, rx150_fail
    rx150_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx150_pos = $P10."pos"()
  # rx pass
    rx150_cur."!cursor_pass"(rx150_pos, "quantifier:sym<+>")
    rx150_cur."!cursor_debug"("PASS  ", "quantifier:sym<+>", " at pos=", rx150_pos)
    .return (rx150_cur)
  rx150_fail:
.annotate 'line', 3
    (rx150_rep, rx150_pos, $I10, $P10) = rx150_cur."!mark_fail"(0)
    lt rx150_pos, -1, rx150_done
    eq rx150_pos, -1, rx150_fail
    jump $I10
  rx150_done:
    rx150_cur."!cursor_fail"()
    rx150_cur."!cursor_debug"("FAIL  ", "quantifier:sym<+>")
    .return (rx150_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<+>"  :subid("41_1278500530.77787") :method
.annotate 'line', 3
    $P152 = self."!PREFIX__!subrule"("backmod", "+")
    new $P153, "ResizablePMCArray"
    push $P153, $P152
    .return ($P153)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<?>"  :subid("42_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx157_tgt
    .local int rx157_pos
    .local int rx157_off
    .local int rx157_eos
    .local int rx157_rep
    .local pmc rx157_cur
    (rx157_cur, rx157_pos, rx157_tgt) = self."!cursor_start"()
    rx157_cur."!cursor_debug"("START ", "quantifier:sym<?>")
    .lex unicode:"$\x{a2}", rx157_cur
    .local pmc match
    .lex "$/", match
    length rx157_eos, rx157_tgt
    gt rx157_pos, rx157_eos, rx157_done
    set rx157_off, 0
    lt rx157_pos, 2, rx157_start
    sub rx157_off, rx157_pos, 1
    substr rx157_tgt, rx157_tgt, rx157_off
  rx157_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan161_done
    goto rxscan161_scan
  rxscan161_loop:
    ($P10) = rx157_cur."from"()
    inc $P10
    set rx157_pos, $P10
    ge rx157_pos, rx157_eos, rxscan161_done
  rxscan161_scan:
    set_addr $I10, rxscan161_loop
    rx157_cur."!mark_push"(0, rx157_pos, $I10)
  rxscan161_done:
.annotate 'line', 57
  # rx subcapture "sym"
    set_addr $I10, rxcap_162_fail
    rx157_cur."!mark_push"(0, rx157_pos, $I10)
  # rx literal  "?"
    add $I11, rx157_pos, 1
    gt $I11, rx157_eos, rx157_fail
    sub $I11, rx157_pos, rx157_off
    substr $S10, rx157_tgt, $I11, 1
    ne $S10, "?", rx157_fail
    add rx157_pos, 1
    set_addr $I10, rxcap_162_fail
    ($I12, $I11) = rx157_cur."!mark_peek"($I10)
    rx157_cur."!cursor_pos"($I11)
    ($P10) = rx157_cur."!cursor_start"()
    $P10."!cursor_pass"(rx157_pos, "")
    rx157_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_162_done
  rxcap_162_fail:
    goto rx157_fail
  rxcap_162_done:
  # rx subrule "backmod" subtype=capture negate=
    rx157_cur."!cursor_pos"(rx157_pos)
    $P10 = rx157_cur."backmod"()
    unless $P10, rx157_fail
    rx157_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx157_pos = $P10."pos"()
  # rx pass
    rx157_cur."!cursor_pass"(rx157_pos, "quantifier:sym<?>")
    rx157_cur."!cursor_debug"("PASS  ", "quantifier:sym<?>", " at pos=", rx157_pos)
    .return (rx157_cur)
  rx157_fail:
.annotate 'line', 3
    (rx157_rep, rx157_pos, $I10, $P10) = rx157_cur."!mark_fail"(0)
    lt rx157_pos, -1, rx157_done
    eq rx157_pos, -1, rx157_fail
    jump $I10
  rx157_done:
    rx157_cur."!cursor_fail"()
    rx157_cur."!cursor_debug"("FAIL  ", "quantifier:sym<?>")
    .return (rx157_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<?>"  :subid("43_1278500530.77787") :method
.annotate 'line', 3
    $P159 = self."!PREFIX__!subrule"("backmod", "?")
    new $P160, "ResizablePMCArray"
    push $P160, $P159
    .return ($P160)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<**>"  :subid("44_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx164_tgt
    .local int rx164_pos
    .local int rx164_off
    .local int rx164_eos
    .local int rx164_rep
    .local pmc rx164_cur
    (rx164_cur, rx164_pos, rx164_tgt) = self."!cursor_start"()
    rx164_cur."!cursor_debug"("START ", "quantifier:sym<**>")
    rx164_cur."!cursor_caparray"("normspace", "max")
    .lex unicode:"$\x{a2}", rx164_cur
    .local pmc match
    .lex "$/", match
    length rx164_eos, rx164_tgt
    gt rx164_pos, rx164_eos, rx164_done
    set rx164_off, 0
    lt rx164_pos, 2, rx164_start
    sub rx164_off, rx164_pos, 1
    substr rx164_tgt, rx164_tgt, rx164_off
  rx164_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan167_done
    goto rxscan167_scan
  rxscan167_loop:
    ($P10) = rx164_cur."from"()
    inc $P10
    set rx164_pos, $P10
    ge rx164_pos, rx164_eos, rxscan167_done
  rxscan167_scan:
    set_addr $I10, rxscan167_loop
    rx164_cur."!mark_push"(0, rx164_pos, $I10)
  rxscan167_done:
.annotate 'line', 59
  # rx subcapture "sym"
    set_addr $I10, rxcap_168_fail
    rx164_cur."!mark_push"(0, rx164_pos, $I10)
  # rx literal  "**"
    add $I11, rx164_pos, 2
    gt $I11, rx164_eos, rx164_fail
    sub $I11, rx164_pos, rx164_off
    substr $S10, rx164_tgt, $I11, 2
    ne $S10, "**", rx164_fail
    add rx164_pos, 2
    set_addr $I10, rxcap_168_fail
    ($I12, $I11) = rx164_cur."!mark_peek"($I10)
    rx164_cur."!cursor_pos"($I11)
    ($P10) = rx164_cur."!cursor_start"()
    $P10."!cursor_pass"(rx164_pos, "")
    rx164_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_168_done
  rxcap_168_fail:
    goto rx164_fail
  rxcap_168_done:
  # rx rxquantr169 ** 0..1
    set_addr $I170, rxquantr169_done
    rx164_cur."!mark_push"(0, rx164_pos, $I170)
  rxquantr169_loop:
  # rx subrule "normspace" subtype=capture negate=
    rx164_cur."!cursor_pos"(rx164_pos)
    $P10 = rx164_cur."normspace"()
    unless $P10, rx164_fail
    rx164_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("normspace")
    rx164_pos = $P10."pos"()
    (rx164_rep) = rx164_cur."!mark_commit"($I170)
  rxquantr169_done:
  # rx subrule "backmod" subtype=capture negate=
    rx164_cur."!cursor_pos"(rx164_pos)
    $P10 = rx164_cur."backmod"()
    unless $P10, rx164_fail
    rx164_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx164_pos = $P10."pos"()
  # rx rxquantr171 ** 0..1
    set_addr $I172, rxquantr171_done
    rx164_cur."!mark_push"(0, rx164_pos, $I172)
  rxquantr171_loop:
  # rx subrule "normspace" subtype=capture negate=
    rx164_cur."!cursor_pos"(rx164_pos)
    $P10 = rx164_cur."normspace"()
    unless $P10, rx164_fail
    rx164_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("normspace")
    rx164_pos = $P10."pos"()
    (rx164_rep) = rx164_cur."!mark_commit"($I172)
  rxquantr171_done:
  alt173_0:
.annotate 'line', 60
    set_addr $I10, alt173_1
    rx164_cur."!mark_push"(0, rx164_pos, $I10)
.annotate 'line', 61
  # rx subcapture "min"
    set_addr $I10, rxcap_174_fail
    rx164_cur."!mark_push"(0, rx164_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx164_pos, rx164_off
    find_not_cclass $I11, 8, rx164_tgt, $I10, rx164_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx164_fail
    add rx164_pos, rx164_off, $I11
    set_addr $I10, rxcap_174_fail
    ($I12, $I11) = rx164_cur."!mark_peek"($I10)
    rx164_cur."!cursor_pos"($I11)
    ($P10) = rx164_cur."!cursor_start"()
    $P10."!cursor_pass"(rx164_pos, "")
    rx164_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("min")
    goto rxcap_174_done
  rxcap_174_fail:
    goto rx164_fail
  rxcap_174_done:
.annotate 'line', 68
  # rx rxquantr175 ** 0..1
    set_addr $I178, rxquantr175_done
    rx164_cur."!mark_push"(0, rx164_pos, $I178)
  rxquantr175_loop:
.annotate 'line', 62
  # rx literal  ".."
    add $I11, rx164_pos, 2
    gt $I11, rx164_eos, rx164_fail
    sub $I11, rx164_pos, rx164_off
    substr $S10, rx164_tgt, $I11, 2
    ne $S10, "..", rx164_fail
    add rx164_pos, 2
.annotate 'line', 63
  # rx subcapture "max"
    set_addr $I10, rxcap_177_fail
    rx164_cur."!mark_push"(0, rx164_pos, $I10)
  alt176_0:
    set_addr $I10, alt176_1
    rx164_cur."!mark_push"(0, rx164_pos, $I10)
.annotate 'line', 64
  # rx charclass_q d r 1..-1
    sub $I10, rx164_pos, rx164_off
    find_not_cclass $I11, 8, rx164_tgt, $I10, rx164_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx164_fail
    add rx164_pos, rx164_off, $I11
    goto alt176_end
  alt176_1:
    set_addr $I10, alt176_2
    rx164_cur."!mark_push"(0, rx164_pos, $I10)
.annotate 'line', 65
  # rx literal  "*"
    add $I11, rx164_pos, 1
    gt $I11, rx164_eos, rx164_fail
    sub $I11, rx164_pos, rx164_off
    substr $S10, rx164_tgt, $I11, 1
    ne $S10, "*", rx164_fail
    add rx164_pos, 1
    goto alt176_end
  alt176_2:
.annotate 'line', 66
  # rx subrule "panic" subtype=method negate=
    rx164_cur."!cursor_pos"(rx164_pos)
    $P10 = rx164_cur."panic"("Only integers or '*' allowed as range quantifier endpoint")
    unless $P10, rx164_fail
    rx164_pos = $P10."pos"()
  alt176_end:
.annotate 'line', 63
    set_addr $I10, rxcap_177_fail
    ($I12, $I11) = rx164_cur."!mark_peek"($I10)
    rx164_cur."!cursor_pos"($I11)
    ($P10) = rx164_cur."!cursor_start"()
    $P10."!cursor_pass"(rx164_pos, "")
    rx164_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("max")
    goto rxcap_177_done
  rxcap_177_fail:
    goto rx164_fail
  rxcap_177_done:
.annotate 'line', 68
    (rx164_rep) = rx164_cur."!mark_commit"($I178)
  rxquantr175_done:
.annotate 'line', 61
    goto alt173_end
  alt173_1:
.annotate 'line', 69
  # rx subrule "quantified_atom" subtype=capture negate=
    rx164_cur."!cursor_pos"(rx164_pos)
    $P10 = rx164_cur."quantified_atom"()
    unless $P10, rx164_fail
    rx164_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantified_atom")
    rx164_pos = $P10."pos"()
  alt173_end:
.annotate 'line', 58
  # rx pass
    rx164_cur."!cursor_pass"(rx164_pos, "quantifier:sym<**>")
    rx164_cur."!cursor_debug"("PASS  ", "quantifier:sym<**>", " at pos=", rx164_pos)
    .return (rx164_cur)
  rx164_fail:
.annotate 'line', 3
    (rx164_rep, rx164_pos, $I10, $P10) = rx164_cur."!mark_fail"(0)
    lt rx164_pos, -1, rx164_done
    eq rx164_pos, -1, rx164_fail
    jump $I10
  rx164_done:
    rx164_cur."!cursor_fail"()
    rx164_cur."!cursor_debug"("FAIL  ", "quantifier:sym<**>")
    .return (rx164_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<**>"  :subid("45_1278500530.77787") :method
.annotate 'line', 3
    new $P166, "ResizablePMCArray"
    push $P166, "**"
    .return ($P166)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backmod"  :subid("46_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .const 'Sub' $P188 = "48_1278500530.77787" 
    capture_lex $P188
    .local string rx180_tgt
    .local int rx180_pos
    .local int rx180_off
    .local int rx180_eos
    .local int rx180_rep
    .local pmc rx180_cur
    (rx180_cur, rx180_pos, rx180_tgt) = self."!cursor_start"()
    rx180_cur."!cursor_debug"("START ", "backmod")
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
    ne $I10, -1, rxscan183_done
    goto rxscan183_scan
  rxscan183_loop:
    ($P10) = rx180_cur."from"()
    inc $P10
    set rx180_pos, $P10
    ge rx180_pos, rx180_eos, rxscan183_done
  rxscan183_scan:
    set_addr $I10, rxscan183_loop
    rx180_cur."!mark_push"(0, rx180_pos, $I10)
  rxscan183_done:
.annotate 'line', 73
  # rx rxquantr184 ** 0..1
    set_addr $I185, rxquantr184_done
    rx180_cur."!mark_push"(0, rx180_pos, $I185)
  rxquantr184_loop:
  # rx literal  ":"
    add $I11, rx180_pos, 1
    gt $I11, rx180_eos, rx180_fail
    sub $I11, rx180_pos, rx180_off
    substr $S10, rx180_tgt, $I11, 1
    ne $S10, ":", rx180_fail
    add rx180_pos, 1
    (rx180_rep) = rx180_cur."!mark_commit"($I185)
  rxquantr184_done:
  alt186_0:
    set_addr $I10, alt186_1
    rx180_cur."!mark_push"(0, rx180_pos, $I10)
  # rx literal  "?"
    add $I11, rx180_pos, 1
    gt $I11, rx180_eos, rx180_fail
    sub $I11, rx180_pos, rx180_off
    substr $S10, rx180_tgt, $I11, 1
    ne $S10, "?", rx180_fail
    add rx180_pos, 1
    goto alt186_end
  alt186_1:
    set_addr $I10, alt186_2
    rx180_cur."!mark_push"(0, rx180_pos, $I10)
  # rx literal  "!"
    add $I11, rx180_pos, 1
    gt $I11, rx180_eos, rx180_fail
    sub $I11, rx180_pos, rx180_off
    substr $S10, rx180_tgt, $I11, 1
    ne $S10, "!", rx180_fail
    add rx180_pos, 1
    goto alt186_end
  alt186_2:
  # rx subrule "before" subtype=zerowidth negate=1
    rx180_cur."!cursor_pos"(rx180_pos)
    .const 'Sub' $P188 = "48_1278500530.77787" 
    capture_lex $P188
    $P10 = rx180_cur."before"($P188)
    if $P10, rx180_fail
  alt186_end:
  # rx pass
    rx180_cur."!cursor_pass"(rx180_pos, "backmod")
    rx180_cur."!cursor_debug"("PASS  ", "backmod", " at pos=", rx180_pos)
    .return (rx180_cur)
  rx180_fail:
.annotate 'line', 3
    (rx180_rep, rx180_pos, $I10, $P10) = rx180_cur."!mark_fail"(0)
    lt rx180_pos, -1, rx180_done
    eq rx180_pos, -1, rx180_fail
    jump $I10
  rx180_done:
    rx180_cur."!cursor_fail"()
    rx180_cur."!cursor_debug"("FAIL  ", "backmod")
    .return (rx180_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backmod"  :subid("47_1278500530.77787") :method
.annotate 'line', 3
    new $P182, "ResizablePMCArray"
    push $P182, ""
    .return ($P182)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block187"  :anon :subid("48_1278500530.77787") :method :outer("46_1278500530.77787")
.annotate 'line', 73
    .local string rx189_tgt
    .local int rx189_pos
    .local int rx189_off
    .local int rx189_eos
    .local int rx189_rep
    .local pmc rx189_cur
    (rx189_cur, rx189_pos, rx189_tgt) = self."!cursor_start"()
    rx189_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx189_cur
    .local pmc match
    .lex "$/", match
    length rx189_eos, rx189_tgt
    gt rx189_pos, rx189_eos, rx189_done
    set rx189_off, 0
    lt rx189_pos, 2, rx189_start
    sub rx189_off, rx189_pos, 1
    substr rx189_tgt, rx189_tgt, rx189_off
  rx189_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan190_done
    goto rxscan190_scan
  rxscan190_loop:
    ($P10) = rx189_cur."from"()
    inc $P10
    set rx189_pos, $P10
    ge rx189_pos, rx189_eos, rxscan190_done
  rxscan190_scan:
    set_addr $I10, rxscan190_loop
    rx189_cur."!mark_push"(0, rx189_pos, $I10)
  rxscan190_done:
  # rx literal  ":"
    add $I11, rx189_pos, 1
    gt $I11, rx189_eos, rx189_fail
    sub $I11, rx189_pos, rx189_off
    substr $S10, rx189_tgt, $I11, 1
    ne $S10, ":", rx189_fail
    add rx189_pos, 1
  # rx pass
    rx189_cur."!cursor_pass"(rx189_pos, "")
    rx189_cur."!cursor_debug"("PASS  ", "", " at pos=", rx189_pos)
    .return (rx189_cur)
  rx189_fail:
    (rx189_rep, rx189_pos, $I10, $P10) = rx189_cur."!mark_fail"(0)
    lt rx189_pos, -1, rx189_done
    eq rx189_pos, -1, rx189_fail
    jump $I10
  rx189_done:
    rx189_cur."!cursor_fail"()
    rx189_cur."!cursor_debug"("FAIL  ", "")
    .return (rx189_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar"  :subid("49_1278500530.77787") :method
.annotate 'line', 75
    $P192 = self."!protoregex"("metachar")
    .return ($P192)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar"  :subid("50_1278500530.77787") :method
.annotate 'line', 75
    $P194 = self."!PREFIX__!protoregex"("metachar")
    .return ($P194)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<ws>"  :subid("51_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx196_tgt
    .local int rx196_pos
    .local int rx196_off
    .local int rx196_eos
    .local int rx196_rep
    .local pmc rx196_cur
    (rx196_cur, rx196_pos, rx196_tgt) = self."!cursor_start"()
    rx196_cur."!cursor_debug"("START ", "metachar:sym<ws>")
    .lex unicode:"$\x{a2}", rx196_cur
    .local pmc match
    .lex "$/", match
    length rx196_eos, rx196_tgt
    gt rx196_pos, rx196_eos, rx196_done
    set rx196_off, 0
    lt rx196_pos, 2, rx196_start
    sub rx196_off, rx196_pos, 1
    substr rx196_tgt, rx196_tgt, rx196_off
  rx196_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan200_done
    goto rxscan200_scan
  rxscan200_loop:
    ($P10) = rx196_cur."from"()
    inc $P10
    set rx196_pos, $P10
    ge rx196_pos, rx196_eos, rxscan200_done
  rxscan200_scan:
    set_addr $I10, rxscan200_loop
    rx196_cur."!mark_push"(0, rx196_pos, $I10)
  rxscan200_done:
.annotate 'line', 76
  # rx subrule "normspace" subtype=method negate=
    rx196_cur."!cursor_pos"(rx196_pos)
    $P10 = rx196_cur."normspace"()
    unless $P10, rx196_fail
    rx196_pos = $P10."pos"()
  # rx pass
    rx196_cur."!cursor_pass"(rx196_pos, "metachar:sym<ws>")
    rx196_cur."!cursor_debug"("PASS  ", "metachar:sym<ws>", " at pos=", rx196_pos)
    .return (rx196_cur)
  rx196_fail:
.annotate 'line', 3
    (rx196_rep, rx196_pos, $I10, $P10) = rx196_cur."!mark_fail"(0)
    lt rx196_pos, -1, rx196_done
    eq rx196_pos, -1, rx196_fail
    jump $I10
  rx196_done:
    rx196_cur."!cursor_fail"()
    rx196_cur."!cursor_debug"("FAIL  ", "metachar:sym<ws>")
    .return (rx196_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<ws>"  :subid("52_1278500530.77787") :method
.annotate 'line', 3
    $P198 = self."!PREFIX__!subrule"("normspace", "")
    new $P199, "ResizablePMCArray"
    push $P199, $P198
    .return ($P199)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<[ ]>"  :subid("53_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx202_tgt
    .local int rx202_pos
    .local int rx202_off
    .local int rx202_eos
    .local int rx202_rep
    .local pmc rx202_cur
    (rx202_cur, rx202_pos, rx202_tgt) = self."!cursor_start"()
    rx202_cur."!cursor_debug"("START ", "metachar:sym<[ ]>")
    .lex unicode:"$\x{a2}", rx202_cur
    .local pmc match
    .lex "$/", match
    length rx202_eos, rx202_tgt
    gt rx202_pos, rx202_eos, rx202_done
    set rx202_off, 0
    lt rx202_pos, 2, rx202_start
    sub rx202_off, rx202_pos, 1
    substr rx202_tgt, rx202_tgt, rx202_off
  rx202_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan206_done
    goto rxscan206_scan
  rxscan206_loop:
    ($P10) = rx202_cur."from"()
    inc $P10
    set rx202_pos, $P10
    ge rx202_pos, rx202_eos, rxscan206_done
  rxscan206_scan:
    set_addr $I10, rxscan206_loop
    rx202_cur."!mark_push"(0, rx202_pos, $I10)
  rxscan206_done:
.annotate 'line', 77
  # rx literal  "["
    add $I11, rx202_pos, 1
    gt $I11, rx202_eos, rx202_fail
    sub $I11, rx202_pos, rx202_off
    substr $S10, rx202_tgt, $I11, 1
    ne $S10, "[", rx202_fail
    add rx202_pos, 1
  # rx subrule "nibbler" subtype=capture negate=
    rx202_cur."!cursor_pos"(rx202_pos)
    $P10 = rx202_cur."nibbler"()
    unless $P10, rx202_fail
    rx202_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx202_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx202_pos, 1
    gt $I11, rx202_eos, rx202_fail
    sub $I11, rx202_pos, rx202_off
    substr $S10, rx202_tgt, $I11, 1
    ne $S10, "]", rx202_fail
    add rx202_pos, 1
  # rx pass
    rx202_cur."!cursor_pass"(rx202_pos, "metachar:sym<[ ]>")
    rx202_cur."!cursor_debug"("PASS  ", "metachar:sym<[ ]>", " at pos=", rx202_pos)
    .return (rx202_cur)
  rx202_fail:
.annotate 'line', 3
    (rx202_rep, rx202_pos, $I10, $P10) = rx202_cur."!mark_fail"(0)
    lt rx202_pos, -1, rx202_done
    eq rx202_pos, -1, rx202_fail
    jump $I10
  rx202_done:
    rx202_cur."!cursor_fail"()
    rx202_cur."!cursor_debug"("FAIL  ", "metachar:sym<[ ]>")
    .return (rx202_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<[ ]>"  :subid("54_1278500530.77787") :method
.annotate 'line', 3
    $P204 = self."!PREFIX__!subrule"("nibbler", "[")
    new $P205, "ResizablePMCArray"
    push $P205, $P204
    .return ($P205)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<( )>"  :subid("55_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx208_tgt
    .local int rx208_pos
    .local int rx208_off
    .local int rx208_eos
    .local int rx208_rep
    .local pmc rx208_cur
    (rx208_cur, rx208_pos, rx208_tgt) = self."!cursor_start"()
    rx208_cur."!cursor_debug"("START ", "metachar:sym<( )>")
    .lex unicode:"$\x{a2}", rx208_cur
    .local pmc match
    .lex "$/", match
    length rx208_eos, rx208_tgt
    gt rx208_pos, rx208_eos, rx208_done
    set rx208_off, 0
    lt rx208_pos, 2, rx208_start
    sub rx208_off, rx208_pos, 1
    substr rx208_tgt, rx208_tgt, rx208_off
  rx208_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan212_done
    goto rxscan212_scan
  rxscan212_loop:
    ($P10) = rx208_cur."from"()
    inc $P10
    set rx208_pos, $P10
    ge rx208_pos, rx208_eos, rxscan212_done
  rxscan212_scan:
    set_addr $I10, rxscan212_loop
    rx208_cur."!mark_push"(0, rx208_pos, $I10)
  rxscan212_done:
.annotate 'line', 78
  # rx literal  "("
    add $I11, rx208_pos, 1
    gt $I11, rx208_eos, rx208_fail
    sub $I11, rx208_pos, rx208_off
    substr $S10, rx208_tgt, $I11, 1
    ne $S10, "(", rx208_fail
    add rx208_pos, 1
  # rx subrule "nibbler" subtype=capture negate=
    rx208_cur."!cursor_pos"(rx208_pos)
    $P10 = rx208_cur."nibbler"()
    unless $P10, rx208_fail
    rx208_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx208_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx208_pos, 1
    gt $I11, rx208_eos, rx208_fail
    sub $I11, rx208_pos, rx208_off
    substr $S10, rx208_tgt, $I11, 1
    ne $S10, ")", rx208_fail
    add rx208_pos, 1
  # rx pass
    rx208_cur."!cursor_pass"(rx208_pos, "metachar:sym<( )>")
    rx208_cur."!cursor_debug"("PASS  ", "metachar:sym<( )>", " at pos=", rx208_pos)
    .return (rx208_cur)
  rx208_fail:
.annotate 'line', 3
    (rx208_rep, rx208_pos, $I10, $P10) = rx208_cur."!mark_fail"(0)
    lt rx208_pos, -1, rx208_done
    eq rx208_pos, -1, rx208_fail
    jump $I10
  rx208_done:
    rx208_cur."!cursor_fail"()
    rx208_cur."!cursor_debug"("FAIL  ", "metachar:sym<( )>")
    .return (rx208_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<( )>"  :subid("56_1278500530.77787") :method
.annotate 'line', 3
    $P210 = self."!PREFIX__!subrule"("nibbler", "(")
    new $P211, "ResizablePMCArray"
    push $P211, $P210
    .return ($P211)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<'>"  :subid("57_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx214_tgt
    .local int rx214_pos
    .local int rx214_off
    .local int rx214_eos
    .local int rx214_rep
    .local pmc rx214_cur
    (rx214_cur, rx214_pos, rx214_tgt) = self."!cursor_start"()
    rx214_cur."!cursor_debug"("START ", "metachar:sym<'>")
    .lex unicode:"$\x{a2}", rx214_cur
    .local pmc match
    .lex "$/", match
    length rx214_eos, rx214_tgt
    gt rx214_pos, rx214_eos, rx214_done
    set rx214_off, 0
    lt rx214_pos, 2, rx214_start
    sub rx214_off, rx214_pos, 1
    substr rx214_tgt, rx214_tgt, rx214_off
  rx214_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan217_done
    goto rxscan217_scan
  rxscan217_loop:
    ($P10) = rx214_cur."from"()
    inc $P10
    set rx214_pos, $P10
    ge rx214_pos, rx214_eos, rxscan217_done
  rxscan217_scan:
    set_addr $I10, rxscan217_loop
    rx214_cur."!mark_push"(0, rx214_pos, $I10)
  rxscan217_done:
.annotate 'line', 79
  # rx enumcharlist negate=0 zerowidth
    ge rx214_pos, rx214_eos, rx214_fail
    sub $I10, rx214_pos, rx214_off
    substr $S10, rx214_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx214_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx214_cur."!cursor_pos"(rx214_pos)
    $P10 = rx214_cur."quote_EXPR"(":q")
    unless $P10, rx214_fail
    rx214_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx214_pos = $P10."pos"()
  # rx pass
    rx214_cur."!cursor_pass"(rx214_pos, "metachar:sym<'>")
    rx214_cur."!cursor_debug"("PASS  ", "metachar:sym<'>", " at pos=", rx214_pos)
    .return (rx214_cur)
  rx214_fail:
.annotate 'line', 3
    (rx214_rep, rx214_pos, $I10, $P10) = rx214_cur."!mark_fail"(0)
    lt rx214_pos, -1, rx214_done
    eq rx214_pos, -1, rx214_fail
    jump $I10
  rx214_done:
    rx214_cur."!cursor_fail"()
    rx214_cur."!cursor_debug"("FAIL  ", "metachar:sym<'>")
    .return (rx214_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<'>"  :subid("58_1278500530.77787") :method
.annotate 'line', 3
    new $P216, "ResizablePMCArray"
    push $P216, "'"
    .return ($P216)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<\">"  :subid("59_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx219_tgt
    .local int rx219_pos
    .local int rx219_off
    .local int rx219_eos
    .local int rx219_rep
    .local pmc rx219_cur
    (rx219_cur, rx219_pos, rx219_tgt) = self."!cursor_start"()
    rx219_cur."!cursor_debug"("START ", "metachar:sym<\">")
    .lex unicode:"$\x{a2}", rx219_cur
    .local pmc match
    .lex "$/", match
    length rx219_eos, rx219_tgt
    gt rx219_pos, rx219_eos, rx219_done
    set rx219_off, 0
    lt rx219_pos, 2, rx219_start
    sub rx219_off, rx219_pos, 1
    substr rx219_tgt, rx219_tgt, rx219_off
  rx219_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan222_done
    goto rxscan222_scan
  rxscan222_loop:
    ($P10) = rx219_cur."from"()
    inc $P10
    set rx219_pos, $P10
    ge rx219_pos, rx219_eos, rxscan222_done
  rxscan222_scan:
    set_addr $I10, rxscan222_loop
    rx219_cur."!mark_push"(0, rx219_pos, $I10)
  rxscan222_done:
.annotate 'line', 80
  # rx enumcharlist negate=0 zerowidth
    ge rx219_pos, rx219_eos, rx219_fail
    sub $I10, rx219_pos, rx219_off
    substr $S10, rx219_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx219_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx219_cur."!cursor_pos"(rx219_pos)
    $P10 = rx219_cur."quote_EXPR"(":qq")
    unless $P10, rx219_fail
    rx219_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx219_pos = $P10."pos"()
  # rx pass
    rx219_cur."!cursor_pass"(rx219_pos, "metachar:sym<\">")
    rx219_cur."!cursor_debug"("PASS  ", "metachar:sym<\">", " at pos=", rx219_pos)
    .return (rx219_cur)
  rx219_fail:
.annotate 'line', 3
    (rx219_rep, rx219_pos, $I10, $P10) = rx219_cur."!mark_fail"(0)
    lt rx219_pos, -1, rx219_done
    eq rx219_pos, -1, rx219_fail
    jump $I10
  rx219_done:
    rx219_cur."!cursor_fail"()
    rx219_cur."!cursor_debug"("FAIL  ", "metachar:sym<\">")
    .return (rx219_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<\">"  :subid("60_1278500530.77787") :method
.annotate 'line', 3
    new $P221, "ResizablePMCArray"
    push $P221, "\""
    .return ($P221)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<.>"  :subid("61_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx224_tgt
    .local int rx224_pos
    .local int rx224_off
    .local int rx224_eos
    .local int rx224_rep
    .local pmc rx224_cur
    (rx224_cur, rx224_pos, rx224_tgt) = self."!cursor_start"()
    rx224_cur."!cursor_debug"("START ", "metachar:sym<.>")
    .lex unicode:"$\x{a2}", rx224_cur
    .local pmc match
    .lex "$/", match
    length rx224_eos, rx224_tgt
    gt rx224_pos, rx224_eos, rx224_done
    set rx224_off, 0
    lt rx224_pos, 2, rx224_start
    sub rx224_off, rx224_pos, 1
    substr rx224_tgt, rx224_tgt, rx224_off
  rx224_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan227_done
    goto rxscan227_scan
  rxscan227_loop:
    ($P10) = rx224_cur."from"()
    inc $P10
    set rx224_pos, $P10
    ge rx224_pos, rx224_eos, rxscan227_done
  rxscan227_scan:
    set_addr $I10, rxscan227_loop
    rx224_cur."!mark_push"(0, rx224_pos, $I10)
  rxscan227_done:
.annotate 'line', 81
  # rx subcapture "sym"
    set_addr $I10, rxcap_228_fail
    rx224_cur."!mark_push"(0, rx224_pos, $I10)
  # rx literal  "."
    add $I11, rx224_pos, 1
    gt $I11, rx224_eos, rx224_fail
    sub $I11, rx224_pos, rx224_off
    substr $S10, rx224_tgt, $I11, 1
    ne $S10, ".", rx224_fail
    add rx224_pos, 1
    set_addr $I10, rxcap_228_fail
    ($I12, $I11) = rx224_cur."!mark_peek"($I10)
    rx224_cur."!cursor_pos"($I11)
    ($P10) = rx224_cur."!cursor_start"()
    $P10."!cursor_pass"(rx224_pos, "")
    rx224_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_228_done
  rxcap_228_fail:
    goto rx224_fail
  rxcap_228_done:
  # rx pass
    rx224_cur."!cursor_pass"(rx224_pos, "metachar:sym<.>")
    rx224_cur."!cursor_debug"("PASS  ", "metachar:sym<.>", " at pos=", rx224_pos)
    .return (rx224_cur)
  rx224_fail:
.annotate 'line', 3
    (rx224_rep, rx224_pos, $I10, $P10) = rx224_cur."!mark_fail"(0)
    lt rx224_pos, -1, rx224_done
    eq rx224_pos, -1, rx224_fail
    jump $I10
  rx224_done:
    rx224_cur."!cursor_fail"()
    rx224_cur."!cursor_debug"("FAIL  ", "metachar:sym<.>")
    .return (rx224_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<.>"  :subid("62_1278500530.77787") :method
.annotate 'line', 3
    new $P226, "ResizablePMCArray"
    push $P226, "."
    .return ($P226)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^>"  :subid("63_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx230_tgt
    .local int rx230_pos
    .local int rx230_off
    .local int rx230_eos
    .local int rx230_rep
    .local pmc rx230_cur
    (rx230_cur, rx230_pos, rx230_tgt) = self."!cursor_start"()
    rx230_cur."!cursor_debug"("START ", "metachar:sym<^>")
    .lex unicode:"$\x{a2}", rx230_cur
    .local pmc match
    .lex "$/", match
    length rx230_eos, rx230_tgt
    gt rx230_pos, rx230_eos, rx230_done
    set rx230_off, 0
    lt rx230_pos, 2, rx230_start
    sub rx230_off, rx230_pos, 1
    substr rx230_tgt, rx230_tgt, rx230_off
  rx230_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan233_done
    goto rxscan233_scan
  rxscan233_loop:
    ($P10) = rx230_cur."from"()
    inc $P10
    set rx230_pos, $P10
    ge rx230_pos, rx230_eos, rxscan233_done
  rxscan233_scan:
    set_addr $I10, rxscan233_loop
    rx230_cur."!mark_push"(0, rx230_pos, $I10)
  rxscan233_done:
.annotate 'line', 82
  # rx subcapture "sym"
    set_addr $I10, rxcap_234_fail
    rx230_cur."!mark_push"(0, rx230_pos, $I10)
  # rx literal  "^"
    add $I11, rx230_pos, 1
    gt $I11, rx230_eos, rx230_fail
    sub $I11, rx230_pos, rx230_off
    substr $S10, rx230_tgt, $I11, 1
    ne $S10, "^", rx230_fail
    add rx230_pos, 1
    set_addr $I10, rxcap_234_fail
    ($I12, $I11) = rx230_cur."!mark_peek"($I10)
    rx230_cur."!cursor_pos"($I11)
    ($P10) = rx230_cur."!cursor_start"()
    $P10."!cursor_pass"(rx230_pos, "")
    rx230_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_234_done
  rxcap_234_fail:
    goto rx230_fail
  rxcap_234_done:
  # rx pass
    rx230_cur."!cursor_pass"(rx230_pos, "metachar:sym<^>")
    rx230_cur."!cursor_debug"("PASS  ", "metachar:sym<^>", " at pos=", rx230_pos)
    .return (rx230_cur)
  rx230_fail:
.annotate 'line', 3
    (rx230_rep, rx230_pos, $I10, $P10) = rx230_cur."!mark_fail"(0)
    lt rx230_pos, -1, rx230_done
    eq rx230_pos, -1, rx230_fail
    jump $I10
  rx230_done:
    rx230_cur."!cursor_fail"()
    rx230_cur."!cursor_debug"("FAIL  ", "metachar:sym<^>")
    .return (rx230_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<^>"  :subid("64_1278500530.77787") :method
.annotate 'line', 3
    new $P232, "ResizablePMCArray"
    push $P232, "^"
    .return ($P232)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^^>"  :subid("65_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx236_tgt
    .local int rx236_pos
    .local int rx236_off
    .local int rx236_eos
    .local int rx236_rep
    .local pmc rx236_cur
    (rx236_cur, rx236_pos, rx236_tgt) = self."!cursor_start"()
    rx236_cur."!cursor_debug"("START ", "metachar:sym<^^>")
    .lex unicode:"$\x{a2}", rx236_cur
    .local pmc match
    .lex "$/", match
    length rx236_eos, rx236_tgt
    gt rx236_pos, rx236_eos, rx236_done
    set rx236_off, 0
    lt rx236_pos, 2, rx236_start
    sub rx236_off, rx236_pos, 1
    substr rx236_tgt, rx236_tgt, rx236_off
  rx236_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan239_done
    goto rxscan239_scan
  rxscan239_loop:
    ($P10) = rx236_cur."from"()
    inc $P10
    set rx236_pos, $P10
    ge rx236_pos, rx236_eos, rxscan239_done
  rxscan239_scan:
    set_addr $I10, rxscan239_loop
    rx236_cur."!mark_push"(0, rx236_pos, $I10)
  rxscan239_done:
.annotate 'line', 83
  # rx subcapture "sym"
    set_addr $I10, rxcap_240_fail
    rx236_cur."!mark_push"(0, rx236_pos, $I10)
  # rx literal  "^^"
    add $I11, rx236_pos, 2
    gt $I11, rx236_eos, rx236_fail
    sub $I11, rx236_pos, rx236_off
    substr $S10, rx236_tgt, $I11, 2
    ne $S10, "^^", rx236_fail
    add rx236_pos, 2
    set_addr $I10, rxcap_240_fail
    ($I12, $I11) = rx236_cur."!mark_peek"($I10)
    rx236_cur."!cursor_pos"($I11)
    ($P10) = rx236_cur."!cursor_start"()
    $P10."!cursor_pass"(rx236_pos, "")
    rx236_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_240_done
  rxcap_240_fail:
    goto rx236_fail
  rxcap_240_done:
  # rx pass
    rx236_cur."!cursor_pass"(rx236_pos, "metachar:sym<^^>")
    rx236_cur."!cursor_debug"("PASS  ", "metachar:sym<^^>", " at pos=", rx236_pos)
    .return (rx236_cur)
  rx236_fail:
.annotate 'line', 3
    (rx236_rep, rx236_pos, $I10, $P10) = rx236_cur."!mark_fail"(0)
    lt rx236_pos, -1, rx236_done
    eq rx236_pos, -1, rx236_fail
    jump $I10
  rx236_done:
    rx236_cur."!cursor_fail"()
    rx236_cur."!cursor_debug"("FAIL  ", "metachar:sym<^^>")
    .return (rx236_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<^^>"  :subid("66_1278500530.77787") :method
.annotate 'line', 3
    new $P238, "ResizablePMCArray"
    push $P238, "^^"
    .return ($P238)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$>"  :subid("67_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx242_tgt
    .local int rx242_pos
    .local int rx242_off
    .local int rx242_eos
    .local int rx242_rep
    .local pmc rx242_cur
    (rx242_cur, rx242_pos, rx242_tgt) = self."!cursor_start"()
    rx242_cur."!cursor_debug"("START ", "metachar:sym<$>")
    .lex unicode:"$\x{a2}", rx242_cur
    .local pmc match
    .lex "$/", match
    length rx242_eos, rx242_tgt
    gt rx242_pos, rx242_eos, rx242_done
    set rx242_off, 0
    lt rx242_pos, 2, rx242_start
    sub rx242_off, rx242_pos, 1
    substr rx242_tgt, rx242_tgt, rx242_off
  rx242_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan245_done
    goto rxscan245_scan
  rxscan245_loop:
    ($P10) = rx242_cur."from"()
    inc $P10
    set rx242_pos, $P10
    ge rx242_pos, rx242_eos, rxscan245_done
  rxscan245_scan:
    set_addr $I10, rxscan245_loop
    rx242_cur."!mark_push"(0, rx242_pos, $I10)
  rxscan245_done:
.annotate 'line', 84
  # rx subcapture "sym"
    set_addr $I10, rxcap_246_fail
    rx242_cur."!mark_push"(0, rx242_pos, $I10)
  # rx literal  "$"
    add $I11, rx242_pos, 1
    gt $I11, rx242_eos, rx242_fail
    sub $I11, rx242_pos, rx242_off
    substr $S10, rx242_tgt, $I11, 1
    ne $S10, "$", rx242_fail
    add rx242_pos, 1
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
  # rx pass
    rx242_cur."!cursor_pass"(rx242_pos, "metachar:sym<$>")
    rx242_cur."!cursor_debug"("PASS  ", "metachar:sym<$>", " at pos=", rx242_pos)
    .return (rx242_cur)
  rx242_fail:
.annotate 'line', 3
    (rx242_rep, rx242_pos, $I10, $P10) = rx242_cur."!mark_fail"(0)
    lt rx242_pos, -1, rx242_done
    eq rx242_pos, -1, rx242_fail
    jump $I10
  rx242_done:
    rx242_cur."!cursor_fail"()
    rx242_cur."!cursor_debug"("FAIL  ", "metachar:sym<$>")
    .return (rx242_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<$>"  :subid("68_1278500530.77787") :method
.annotate 'line', 3
    new $P244, "ResizablePMCArray"
    push $P244, "$"
    .return ($P244)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$$>"  :subid("69_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx248_tgt
    .local int rx248_pos
    .local int rx248_off
    .local int rx248_eos
    .local int rx248_rep
    .local pmc rx248_cur
    (rx248_cur, rx248_pos, rx248_tgt) = self."!cursor_start"()
    rx248_cur."!cursor_debug"("START ", "metachar:sym<$$>")
    .lex unicode:"$\x{a2}", rx248_cur
    .local pmc match
    .lex "$/", match
    length rx248_eos, rx248_tgt
    gt rx248_pos, rx248_eos, rx248_done
    set rx248_off, 0
    lt rx248_pos, 2, rx248_start
    sub rx248_off, rx248_pos, 1
    substr rx248_tgt, rx248_tgt, rx248_off
  rx248_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan251_done
    goto rxscan251_scan
  rxscan251_loop:
    ($P10) = rx248_cur."from"()
    inc $P10
    set rx248_pos, $P10
    ge rx248_pos, rx248_eos, rxscan251_done
  rxscan251_scan:
    set_addr $I10, rxscan251_loop
    rx248_cur."!mark_push"(0, rx248_pos, $I10)
  rxscan251_done:
.annotate 'line', 85
  # rx subcapture "sym"
    set_addr $I10, rxcap_252_fail
    rx248_cur."!mark_push"(0, rx248_pos, $I10)
  # rx literal  "$$"
    add $I11, rx248_pos, 2
    gt $I11, rx248_eos, rx248_fail
    sub $I11, rx248_pos, rx248_off
    substr $S10, rx248_tgt, $I11, 2
    ne $S10, "$$", rx248_fail
    add rx248_pos, 2
    set_addr $I10, rxcap_252_fail
    ($I12, $I11) = rx248_cur."!mark_peek"($I10)
    rx248_cur."!cursor_pos"($I11)
    ($P10) = rx248_cur."!cursor_start"()
    $P10."!cursor_pass"(rx248_pos, "")
    rx248_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_252_done
  rxcap_252_fail:
    goto rx248_fail
  rxcap_252_done:
  # rx pass
    rx248_cur."!cursor_pass"(rx248_pos, "metachar:sym<$$>")
    rx248_cur."!cursor_debug"("PASS  ", "metachar:sym<$$>", " at pos=", rx248_pos)
    .return (rx248_cur)
  rx248_fail:
.annotate 'line', 3
    (rx248_rep, rx248_pos, $I10, $P10) = rx248_cur."!mark_fail"(0)
    lt rx248_pos, -1, rx248_done
    eq rx248_pos, -1, rx248_fail
    jump $I10
  rx248_done:
    rx248_cur."!cursor_fail"()
    rx248_cur."!cursor_debug"("FAIL  ", "metachar:sym<$$>")
    .return (rx248_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<$$>"  :subid("70_1278500530.77787") :method
.annotate 'line', 3
    new $P250, "ResizablePMCArray"
    push $P250, "$$"
    .return ($P250)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<:::>"  :subid("71_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx254_tgt
    .local int rx254_pos
    .local int rx254_off
    .local int rx254_eos
    .local int rx254_rep
    .local pmc rx254_cur
    (rx254_cur, rx254_pos, rx254_tgt) = self."!cursor_start"()
    rx254_cur."!cursor_debug"("START ", "metachar:sym<:::>")
    .lex unicode:"$\x{a2}", rx254_cur
    .local pmc match
    .lex "$/", match
    length rx254_eos, rx254_tgt
    gt rx254_pos, rx254_eos, rx254_done
    set rx254_off, 0
    lt rx254_pos, 2, rx254_start
    sub rx254_off, rx254_pos, 1
    substr rx254_tgt, rx254_tgt, rx254_off
  rx254_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan258_done
    goto rxscan258_scan
  rxscan258_loop:
    ($P10) = rx254_cur."from"()
    inc $P10
    set rx254_pos, $P10
    ge rx254_pos, rx254_eos, rxscan258_done
  rxscan258_scan:
    set_addr $I10, rxscan258_loop
    rx254_cur."!mark_push"(0, rx254_pos, $I10)
  rxscan258_done:
.annotate 'line', 86
  # rx subcapture "sym"
    set_addr $I10, rxcap_259_fail
    rx254_cur."!mark_push"(0, rx254_pos, $I10)
  # rx literal  ":::"
    add $I11, rx254_pos, 3
    gt $I11, rx254_eos, rx254_fail
    sub $I11, rx254_pos, rx254_off
    substr $S10, rx254_tgt, $I11, 3
    ne $S10, ":::", rx254_fail
    add rx254_pos, 3
    set_addr $I10, rxcap_259_fail
    ($I12, $I11) = rx254_cur."!mark_peek"($I10)
    rx254_cur."!cursor_pos"($I11)
    ($P10) = rx254_cur."!cursor_start"()
    $P10."!cursor_pass"(rx254_pos, "")
    rx254_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_259_done
  rxcap_259_fail:
    goto rx254_fail
  rxcap_259_done:
  # rx subrule "panic" subtype=method negate=
    rx254_cur."!cursor_pos"(rx254_pos)
    $P10 = rx254_cur."panic"("::: not yet implemented")
    unless $P10, rx254_fail
    rx254_pos = $P10."pos"()
  # rx pass
    rx254_cur."!cursor_pass"(rx254_pos, "metachar:sym<:::>")
    rx254_cur."!cursor_debug"("PASS  ", "metachar:sym<:::>", " at pos=", rx254_pos)
    .return (rx254_cur)
  rx254_fail:
.annotate 'line', 3
    (rx254_rep, rx254_pos, $I10, $P10) = rx254_cur."!mark_fail"(0)
    lt rx254_pos, -1, rx254_done
    eq rx254_pos, -1, rx254_fail
    jump $I10
  rx254_done:
    rx254_cur."!cursor_fail"()
    rx254_cur."!cursor_debug"("FAIL  ", "metachar:sym<:::>")
    .return (rx254_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<:::>"  :subid("72_1278500530.77787") :method
.annotate 'line', 3
    $P256 = self."!PREFIX__!subrule"("panic", ":::")
    new $P257, "ResizablePMCArray"
    push $P257, $P256
    .return ($P257)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<::>"  :subid("73_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx261_tgt
    .local int rx261_pos
    .local int rx261_off
    .local int rx261_eos
    .local int rx261_rep
    .local pmc rx261_cur
    (rx261_cur, rx261_pos, rx261_tgt) = self."!cursor_start"()
    rx261_cur."!cursor_debug"("START ", "metachar:sym<::>")
    .lex unicode:"$\x{a2}", rx261_cur
    .local pmc match
    .lex "$/", match
    length rx261_eos, rx261_tgt
    gt rx261_pos, rx261_eos, rx261_done
    set rx261_off, 0
    lt rx261_pos, 2, rx261_start
    sub rx261_off, rx261_pos, 1
    substr rx261_tgt, rx261_tgt, rx261_off
  rx261_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan265_done
    goto rxscan265_scan
  rxscan265_loop:
    ($P10) = rx261_cur."from"()
    inc $P10
    set rx261_pos, $P10
    ge rx261_pos, rx261_eos, rxscan265_done
  rxscan265_scan:
    set_addr $I10, rxscan265_loop
    rx261_cur."!mark_push"(0, rx261_pos, $I10)
  rxscan265_done:
.annotate 'line', 87
  # rx subcapture "sym"
    set_addr $I10, rxcap_266_fail
    rx261_cur."!mark_push"(0, rx261_pos, $I10)
  # rx literal  "::"
    add $I11, rx261_pos, 2
    gt $I11, rx261_eos, rx261_fail
    sub $I11, rx261_pos, rx261_off
    substr $S10, rx261_tgt, $I11, 2
    ne $S10, "::", rx261_fail
    add rx261_pos, 2
    set_addr $I10, rxcap_266_fail
    ($I12, $I11) = rx261_cur."!mark_peek"($I10)
    rx261_cur."!cursor_pos"($I11)
    ($P10) = rx261_cur."!cursor_start"()
    $P10."!cursor_pass"(rx261_pos, "")
    rx261_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_266_done
  rxcap_266_fail:
    goto rx261_fail
  rxcap_266_done:
  # rx subrule "panic" subtype=method negate=
    rx261_cur."!cursor_pos"(rx261_pos)
    $P10 = rx261_cur."panic"(":: not yet implemented")
    unless $P10, rx261_fail
    rx261_pos = $P10."pos"()
  # rx pass
    rx261_cur."!cursor_pass"(rx261_pos, "metachar:sym<::>")
    rx261_cur."!cursor_debug"("PASS  ", "metachar:sym<::>", " at pos=", rx261_pos)
    .return (rx261_cur)
  rx261_fail:
.annotate 'line', 3
    (rx261_rep, rx261_pos, $I10, $P10) = rx261_cur."!mark_fail"(0)
    lt rx261_pos, -1, rx261_done
    eq rx261_pos, -1, rx261_fail
    jump $I10
  rx261_done:
    rx261_cur."!cursor_fail"()
    rx261_cur."!cursor_debug"("FAIL  ", "metachar:sym<::>")
    .return (rx261_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<::>"  :subid("74_1278500530.77787") :method
.annotate 'line', 3
    $P263 = self."!PREFIX__!subrule"("panic", "::")
    new $P264, "ResizablePMCArray"
    push $P264, $P263
    .return ($P264)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<lwb>"  :subid("75_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx268_tgt
    .local int rx268_pos
    .local int rx268_off
    .local int rx268_eos
    .local int rx268_rep
    .local pmc rx268_cur
    (rx268_cur, rx268_pos, rx268_tgt) = self."!cursor_start"()
    rx268_cur."!cursor_debug"("START ", "metachar:sym<lwb>")
    .lex unicode:"$\x{a2}", rx268_cur
    .local pmc match
    .lex "$/", match
    length rx268_eos, rx268_tgt
    gt rx268_pos, rx268_eos, rx268_done
    set rx268_off, 0
    lt rx268_pos, 2, rx268_start
    sub rx268_off, rx268_pos, 1
    substr rx268_tgt, rx268_tgt, rx268_off
  rx268_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan271_done
    goto rxscan271_scan
  rxscan271_loop:
    ($P10) = rx268_cur."from"()
    inc $P10
    set rx268_pos, $P10
    ge rx268_pos, rx268_eos, rxscan271_done
  rxscan271_scan:
    set_addr $I10, rxscan271_loop
    rx268_cur."!mark_push"(0, rx268_pos, $I10)
  rxscan271_done:
.annotate 'line', 88
  # rx subcapture "sym"
    set_addr $I10, rxcap_273_fail
    rx268_cur."!mark_push"(0, rx268_pos, $I10)
  alt272_0:
    set_addr $I10, alt272_1
    rx268_cur."!mark_push"(0, rx268_pos, $I10)
  # rx literal  "<<"
    add $I11, rx268_pos, 2
    gt $I11, rx268_eos, rx268_fail
    sub $I11, rx268_pos, rx268_off
    substr $S10, rx268_tgt, $I11, 2
    ne $S10, "<<", rx268_fail
    add rx268_pos, 2
    goto alt272_end
  alt272_1:
  # rx literal  unicode:"\x{ab}"
    add $I11, rx268_pos, 1
    gt $I11, rx268_eos, rx268_fail
    sub $I11, rx268_pos, rx268_off
    substr $S10, rx268_tgt, $I11, 1
    ne $S10, unicode:"\x{ab}", rx268_fail
    add rx268_pos, 1
  alt272_end:
    set_addr $I10, rxcap_273_fail
    ($I12, $I11) = rx268_cur."!mark_peek"($I10)
    rx268_cur."!cursor_pos"($I11)
    ($P10) = rx268_cur."!cursor_start"()
    $P10."!cursor_pass"(rx268_pos, "")
    rx268_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_273_done
  rxcap_273_fail:
    goto rx268_fail
  rxcap_273_done:
  # rx pass
    rx268_cur."!cursor_pass"(rx268_pos, "metachar:sym<lwb>")
    rx268_cur."!cursor_debug"("PASS  ", "metachar:sym<lwb>", " at pos=", rx268_pos)
    .return (rx268_cur)
  rx268_fail:
.annotate 'line', 3
    (rx268_rep, rx268_pos, $I10, $P10) = rx268_cur."!mark_fail"(0)
    lt rx268_pos, -1, rx268_done
    eq rx268_pos, -1, rx268_fail
    jump $I10
  rx268_done:
    rx268_cur."!cursor_fail"()
    rx268_cur."!cursor_debug"("FAIL  ", "metachar:sym<lwb>")
    .return (rx268_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<lwb>"  :subid("76_1278500530.77787") :method
.annotate 'line', 3
    new $P270, "ResizablePMCArray"
    push $P270, unicode:"\x{ab}"
    push $P270, "<<"
    .return ($P270)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<rwb>"  :subid("77_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx275_tgt
    .local int rx275_pos
    .local int rx275_off
    .local int rx275_eos
    .local int rx275_rep
    .local pmc rx275_cur
    (rx275_cur, rx275_pos, rx275_tgt) = self."!cursor_start"()
    rx275_cur."!cursor_debug"("START ", "metachar:sym<rwb>")
    .lex unicode:"$\x{a2}", rx275_cur
    .local pmc match
    .lex "$/", match
    length rx275_eos, rx275_tgt
    gt rx275_pos, rx275_eos, rx275_done
    set rx275_off, 0
    lt rx275_pos, 2, rx275_start
    sub rx275_off, rx275_pos, 1
    substr rx275_tgt, rx275_tgt, rx275_off
  rx275_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan278_done
    goto rxscan278_scan
  rxscan278_loop:
    ($P10) = rx275_cur."from"()
    inc $P10
    set rx275_pos, $P10
    ge rx275_pos, rx275_eos, rxscan278_done
  rxscan278_scan:
    set_addr $I10, rxscan278_loop
    rx275_cur."!mark_push"(0, rx275_pos, $I10)
  rxscan278_done:
.annotate 'line', 89
  # rx subcapture "sym"
    set_addr $I10, rxcap_280_fail
    rx275_cur."!mark_push"(0, rx275_pos, $I10)
  alt279_0:
    set_addr $I10, alt279_1
    rx275_cur."!mark_push"(0, rx275_pos, $I10)
  # rx literal  ">>"
    add $I11, rx275_pos, 2
    gt $I11, rx275_eos, rx275_fail
    sub $I11, rx275_pos, rx275_off
    substr $S10, rx275_tgt, $I11, 2
    ne $S10, ">>", rx275_fail
    add rx275_pos, 2
    goto alt279_end
  alt279_1:
  # rx literal  unicode:"\x{bb}"
    add $I11, rx275_pos, 1
    gt $I11, rx275_eos, rx275_fail
    sub $I11, rx275_pos, rx275_off
    substr $S10, rx275_tgt, $I11, 1
    ne $S10, unicode:"\x{bb}", rx275_fail
    add rx275_pos, 1
  alt279_end:
    set_addr $I10, rxcap_280_fail
    ($I12, $I11) = rx275_cur."!mark_peek"($I10)
    rx275_cur."!cursor_pos"($I11)
    ($P10) = rx275_cur."!cursor_start"()
    $P10."!cursor_pass"(rx275_pos, "")
    rx275_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_280_done
  rxcap_280_fail:
    goto rx275_fail
  rxcap_280_done:
  # rx pass
    rx275_cur."!cursor_pass"(rx275_pos, "metachar:sym<rwb>")
    rx275_cur."!cursor_debug"("PASS  ", "metachar:sym<rwb>", " at pos=", rx275_pos)
    .return (rx275_cur)
  rx275_fail:
.annotate 'line', 3
    (rx275_rep, rx275_pos, $I10, $P10) = rx275_cur."!mark_fail"(0)
    lt rx275_pos, -1, rx275_done
    eq rx275_pos, -1, rx275_fail
    jump $I10
  rx275_done:
    rx275_cur."!cursor_fail"()
    rx275_cur."!cursor_debug"("FAIL  ", "metachar:sym<rwb>")
    .return (rx275_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<rwb>"  :subid("78_1278500530.77787") :method
.annotate 'line', 3
    new $P277, "ResizablePMCArray"
    push $P277, unicode:"\x{bb}"
    push $P277, ">>"
    .return ($P277)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<bs>"  :subid("79_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx282_tgt
    .local int rx282_pos
    .local int rx282_off
    .local int rx282_eos
    .local int rx282_rep
    .local pmc rx282_cur
    (rx282_cur, rx282_pos, rx282_tgt) = self."!cursor_start"()
    rx282_cur."!cursor_debug"("START ", "metachar:sym<bs>")
    .lex unicode:"$\x{a2}", rx282_cur
    .local pmc match
    .lex "$/", match
    length rx282_eos, rx282_tgt
    gt rx282_pos, rx282_eos, rx282_done
    set rx282_off, 0
    lt rx282_pos, 2, rx282_start
    sub rx282_off, rx282_pos, 1
    substr rx282_tgt, rx282_tgt, rx282_off
  rx282_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan286_done
    goto rxscan286_scan
  rxscan286_loop:
    ($P10) = rx282_cur."from"()
    inc $P10
    set rx282_pos, $P10
    ge rx282_pos, rx282_eos, rxscan286_done
  rxscan286_scan:
    set_addr $I10, rxscan286_loop
    rx282_cur."!mark_push"(0, rx282_pos, $I10)
  rxscan286_done:
.annotate 'line', 90
  # rx literal  "\\"
    add $I11, rx282_pos, 1
    gt $I11, rx282_eos, rx282_fail
    sub $I11, rx282_pos, rx282_off
    substr $S10, rx282_tgt, $I11, 1
    ne $S10, "\\", rx282_fail
    add rx282_pos, 1
  # rx subrule "backslash" subtype=capture negate=
    rx282_cur."!cursor_pos"(rx282_pos)
    $P10 = rx282_cur."backslash"()
    unless $P10, rx282_fail
    rx282_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backslash")
    rx282_pos = $P10."pos"()
  # rx pass
    rx282_cur."!cursor_pass"(rx282_pos, "metachar:sym<bs>")
    rx282_cur."!cursor_debug"("PASS  ", "metachar:sym<bs>", " at pos=", rx282_pos)
    .return (rx282_cur)
  rx282_fail:
.annotate 'line', 3
    (rx282_rep, rx282_pos, $I10, $P10) = rx282_cur."!mark_fail"(0)
    lt rx282_pos, -1, rx282_done
    eq rx282_pos, -1, rx282_fail
    jump $I10
  rx282_done:
    rx282_cur."!cursor_fail"()
    rx282_cur."!cursor_debug"("FAIL  ", "metachar:sym<bs>")
    .return (rx282_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<bs>"  :subid("80_1278500530.77787") :method
.annotate 'line', 3
    $P284 = self."!PREFIX__!subrule"("backslash", "\\")
    new $P285, "ResizablePMCArray"
    push $P285, $P284
    .return ($P285)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<mod>"  :subid("81_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx288_tgt
    .local int rx288_pos
    .local int rx288_off
    .local int rx288_eos
    .local int rx288_rep
    .local pmc rx288_cur
    (rx288_cur, rx288_pos, rx288_tgt) = self."!cursor_start"()
    rx288_cur."!cursor_debug"("START ", "metachar:sym<mod>")
    .lex unicode:"$\x{a2}", rx288_cur
    .local pmc match
    .lex "$/", match
    length rx288_eos, rx288_tgt
    gt rx288_pos, rx288_eos, rx288_done
    set rx288_off, 0
    lt rx288_pos, 2, rx288_start
    sub rx288_off, rx288_pos, 1
    substr rx288_tgt, rx288_tgt, rx288_off
  rx288_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan292_done
    goto rxscan292_scan
  rxscan292_loop:
    ($P10) = rx288_cur."from"()
    inc $P10
    set rx288_pos, $P10
    ge rx288_pos, rx288_eos, rxscan292_done
  rxscan292_scan:
    set_addr $I10, rxscan292_loop
    rx288_cur."!mark_push"(0, rx288_pos, $I10)
  rxscan292_done:
.annotate 'line', 91
  # rx subrule "mod_internal" subtype=capture negate=
    rx288_cur."!cursor_pos"(rx288_pos)
    $P10 = rx288_cur."mod_internal"()
    unless $P10, rx288_fail
    rx288_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_internal")
    rx288_pos = $P10."pos"()
  # rx pass
    rx288_cur."!cursor_pass"(rx288_pos, "metachar:sym<mod>")
    rx288_cur."!cursor_debug"("PASS  ", "metachar:sym<mod>", " at pos=", rx288_pos)
    .return (rx288_cur)
  rx288_fail:
.annotate 'line', 3
    (rx288_rep, rx288_pos, $I10, $P10) = rx288_cur."!mark_fail"(0)
    lt rx288_pos, -1, rx288_done
    eq rx288_pos, -1, rx288_fail
    jump $I10
  rx288_done:
    rx288_cur."!cursor_fail"()
    rx288_cur."!cursor_debug"("FAIL  ", "metachar:sym<mod>")
    .return (rx288_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<mod>"  :subid("82_1278500530.77787") :method
.annotate 'line', 3
    $P290 = self."!PREFIX__!subrule"("mod_internal", "")
    new $P291, "ResizablePMCArray"
    push $P291, $P290
    .return ($P291)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<~>"  :subid("83_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx294_tgt
    .local int rx294_pos
    .local int rx294_off
    .local int rx294_eos
    .local int rx294_rep
    .local pmc rx294_cur
    (rx294_cur, rx294_pos, rx294_tgt) = self."!cursor_start"()
    rx294_cur."!cursor_debug"("START ", "metachar:sym<~>")
    .lex unicode:"$\x{a2}", rx294_cur
    .local pmc match
    .lex "$/", match
    length rx294_eos, rx294_tgt
    gt rx294_pos, rx294_eos, rx294_done
    set rx294_off, 0
    lt rx294_pos, 2, rx294_start
    sub rx294_off, rx294_pos, 1
    substr rx294_tgt, rx294_tgt, rx294_off
  rx294_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan298_done
    goto rxscan298_scan
  rxscan298_loop:
    ($P10) = rx294_cur."from"()
    inc $P10
    set rx294_pos, $P10
    ge rx294_pos, rx294_eos, rxscan298_done
  rxscan298_scan:
    set_addr $I10, rxscan298_loop
    rx294_cur."!mark_push"(0, rx294_pos, $I10)
  rxscan298_done:
.annotate 'line', 95
  # rx subcapture "sym"
    set_addr $I10, rxcap_299_fail
    rx294_cur."!mark_push"(0, rx294_pos, $I10)
  # rx literal  "~"
    add $I11, rx294_pos, 1
    gt $I11, rx294_eos, rx294_fail
    sub $I11, rx294_pos, rx294_off
    substr $S10, rx294_tgt, $I11, 1
    ne $S10, "~", rx294_fail
    add rx294_pos, 1
    set_addr $I10, rxcap_299_fail
    ($I12, $I11) = rx294_cur."!mark_peek"($I10)
    rx294_cur."!cursor_pos"($I11)
    ($P10) = rx294_cur."!cursor_start"()
    $P10."!cursor_pass"(rx294_pos, "")
    rx294_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_299_done
  rxcap_299_fail:
    goto rx294_fail
  rxcap_299_done:
.annotate 'line', 96
  # rx subrule "ws" subtype=method negate=
    rx294_cur."!cursor_pos"(rx294_pos)
    $P10 = rx294_cur."ws"()
    unless $P10, rx294_fail
    rx294_pos = $P10."pos"()
  # rx subrule "quantified_atom" subtype=capture negate=
    rx294_cur."!cursor_pos"(rx294_pos)
    $P10 = rx294_cur."quantified_atom"()
    unless $P10, rx294_fail
    rx294_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("GOAL")
    rx294_pos = $P10."pos"()
.annotate 'line', 97
  # rx subrule "ws" subtype=method negate=
    rx294_cur."!cursor_pos"(rx294_pos)
    $P10 = rx294_cur."ws"()
    unless $P10, rx294_fail
    rx294_pos = $P10."pos"()
  # rx subrule "quantified_atom" subtype=capture negate=
    rx294_cur."!cursor_pos"(rx294_pos)
    $P10 = rx294_cur."quantified_atom"()
    unless $P10, rx294_fail
    rx294_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx294_pos = $P10."pos"()
.annotate 'line', 94
  # rx pass
    rx294_cur."!cursor_pass"(rx294_pos, "metachar:sym<~>")
    rx294_cur."!cursor_debug"("PASS  ", "metachar:sym<~>", " at pos=", rx294_pos)
    .return (rx294_cur)
  rx294_fail:
.annotate 'line', 3
    (rx294_rep, rx294_pos, $I10, $P10) = rx294_cur."!mark_fail"(0)
    lt rx294_pos, -1, rx294_done
    eq rx294_pos, -1, rx294_fail
    jump $I10
  rx294_done:
    rx294_cur."!cursor_fail"()
    rx294_cur."!cursor_debug"("FAIL  ", "metachar:sym<~>")
    .return (rx294_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<~>"  :subid("84_1278500530.77787") :method
.annotate 'line', 3
    $P296 = self."!PREFIX__!subrule"("ws", "~")
    new $P297, "ResizablePMCArray"
    push $P297, $P296
    .return ($P297)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<{*}>"  :subid("85_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx301_tgt
    .local int rx301_pos
    .local int rx301_off
    .local int rx301_eos
    .local int rx301_rep
    .local pmc rx301_cur
    (rx301_cur, rx301_pos, rx301_tgt) = self."!cursor_start"()
    rx301_cur."!cursor_debug"("START ", "metachar:sym<{*}>")
    rx301_cur."!cursor_caparray"("key")
    .lex unicode:"$\x{a2}", rx301_cur
    .local pmc match
    .lex "$/", match
    length rx301_eos, rx301_tgt
    gt rx301_pos, rx301_eos, rx301_done
    set rx301_off, 0
    lt rx301_pos, 2, rx301_start
    sub rx301_off, rx301_pos, 1
    substr rx301_tgt, rx301_tgt, rx301_off
  rx301_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan304_done
    goto rxscan304_scan
  rxscan304_loop:
    ($P10) = rx301_cur."from"()
    inc $P10
    set rx301_pos, $P10
    ge rx301_pos, rx301_eos, rxscan304_done
  rxscan304_scan:
    set_addr $I10, rxscan304_loop
    rx301_cur."!mark_push"(0, rx301_pos, $I10)
  rxscan304_done:
.annotate 'line', 101
  # rx subcapture "sym"
    set_addr $I10, rxcap_305_fail
    rx301_cur."!mark_push"(0, rx301_pos, $I10)
  # rx literal  "{*}"
    add $I11, rx301_pos, 3
    gt $I11, rx301_eos, rx301_fail
    sub $I11, rx301_pos, rx301_off
    substr $S10, rx301_tgt, $I11, 3
    ne $S10, "{*}", rx301_fail
    add rx301_pos, 3
    set_addr $I10, rxcap_305_fail
    ($I12, $I11) = rx301_cur."!mark_peek"($I10)
    rx301_cur."!cursor_pos"($I11)
    ($P10) = rx301_cur."!cursor_start"()
    $P10."!cursor_pass"(rx301_pos, "")
    rx301_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_305_done
  rxcap_305_fail:
    goto rx301_fail
  rxcap_305_done:
.annotate 'line', 102
  # rx rxquantr306 ** 0..1
    set_addr $I316, rxquantr306_done
    rx301_cur."!mark_push"(0, rx301_pos, $I316)
  rxquantr306_loop:
  # rx rxquantr307 ** 0..*
    set_addr $I308, rxquantr307_done
    rx301_cur."!mark_push"(0, rx301_pos, $I308)
  rxquantr307_loop:
  # rx enumcharlist negate=0 
    ge rx301_pos, rx301_eos, rx301_fail
    sub $I10, rx301_pos, rx301_off
    substr $S10, rx301_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx301_fail
    inc rx301_pos
    (rx301_rep) = rx301_cur."!mark_commit"($I308)
    rx301_cur."!mark_push"(rx301_rep, rx301_pos, $I308)
    goto rxquantr307_loop
  rxquantr307_done:
  # rx literal  "#= "
    add $I11, rx301_pos, 3
    gt $I11, rx301_eos, rx301_fail
    sub $I11, rx301_pos, rx301_off
    substr $S10, rx301_tgt, $I11, 3
    ne $S10, "#= ", rx301_fail
    add rx301_pos, 3
  # rx rxquantr309 ** 0..*
    set_addr $I310, rxquantr309_done
    rx301_cur."!mark_push"(0, rx301_pos, $I310)
  rxquantr309_loop:
  # rx enumcharlist negate=0 
    ge rx301_pos, rx301_eos, rx301_fail
    sub $I10, rx301_pos, rx301_off
    substr $S10, rx301_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx301_fail
    inc rx301_pos
    (rx301_rep) = rx301_cur."!mark_commit"($I310)
    rx301_cur."!mark_push"(rx301_rep, rx301_pos, $I310)
    goto rxquantr309_loop
  rxquantr309_done:
  # rx subcapture "key"
    set_addr $I10, rxcap_315_fail
    rx301_cur."!mark_push"(0, rx301_pos, $I10)
  # rx charclass_q S r 1..-1
    sub $I10, rx301_pos, rx301_off
    find_cclass $I11, 32, rx301_tgt, $I10, rx301_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx301_fail
    add rx301_pos, rx301_off, $I11
  # rx rxquantr311 ** 0..*
    set_addr $I314, rxquantr311_done
    rx301_cur."!mark_push"(0, rx301_pos, $I314)
  rxquantr311_loop:
  # rx rxquantr312 ** 1..*
    set_addr $I313, rxquantr312_done
    rx301_cur."!mark_push"(0, -1, $I313)
  rxquantr312_loop:
  # rx enumcharlist negate=0 
    ge rx301_pos, rx301_eos, rx301_fail
    sub $I10, rx301_pos, rx301_off
    substr $S10, rx301_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx301_fail
    inc rx301_pos
    (rx301_rep) = rx301_cur."!mark_commit"($I313)
    rx301_cur."!mark_push"(rx301_rep, rx301_pos, $I313)
    goto rxquantr312_loop
  rxquantr312_done:
  # rx charclass_q S r 1..-1
    sub $I10, rx301_pos, rx301_off
    find_cclass $I11, 32, rx301_tgt, $I10, rx301_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx301_fail
    add rx301_pos, rx301_off, $I11
    (rx301_rep) = rx301_cur."!mark_commit"($I314)
    rx301_cur."!mark_push"(rx301_rep, rx301_pos, $I314)
    goto rxquantr311_loop
  rxquantr311_done:
    set_addr $I10, rxcap_315_fail
    ($I12, $I11) = rx301_cur."!mark_peek"($I10)
    rx301_cur."!cursor_pos"($I11)
    ($P10) = rx301_cur."!cursor_start"()
    $P10."!cursor_pass"(rx301_pos, "")
    rx301_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("key")
    goto rxcap_315_done
  rxcap_315_fail:
    goto rx301_fail
  rxcap_315_done:
    (rx301_rep) = rx301_cur."!mark_commit"($I316)
  rxquantr306_done:
.annotate 'line', 100
  # rx pass
    rx301_cur."!cursor_pass"(rx301_pos, "metachar:sym<{*}>")
    rx301_cur."!cursor_debug"("PASS  ", "metachar:sym<{*}>", " at pos=", rx301_pos)
    .return (rx301_cur)
  rx301_fail:
.annotate 'line', 3
    (rx301_rep, rx301_pos, $I10, $P10) = rx301_cur."!mark_fail"(0)
    lt rx301_pos, -1, rx301_done
    eq rx301_pos, -1, rx301_fail
    jump $I10
  rx301_done:
    rx301_cur."!cursor_fail"()
    rx301_cur."!cursor_debug"("FAIL  ", "metachar:sym<{*}>")
    .return (rx301_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<{*}>"  :subid("86_1278500530.77787") :method
.annotate 'line', 3
    new $P303, "ResizablePMCArray"
    push $P303, "{*}"
    .return ($P303)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<assert>"  :subid("87_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx318_tgt
    .local int rx318_pos
    .local int rx318_off
    .local int rx318_eos
    .local int rx318_rep
    .local pmc rx318_cur
    (rx318_cur, rx318_pos, rx318_tgt) = self."!cursor_start"()
    rx318_cur."!cursor_debug"("START ", "metachar:sym<assert>")
    .lex unicode:"$\x{a2}", rx318_cur
    .local pmc match
    .lex "$/", match
    length rx318_eos, rx318_tgt
    gt rx318_pos, rx318_eos, rx318_done
    set rx318_off, 0
    lt rx318_pos, 2, rx318_start
    sub rx318_off, rx318_pos, 1
    substr rx318_tgt, rx318_tgt, rx318_off
  rx318_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan322_done
    goto rxscan322_scan
  rxscan322_loop:
    ($P10) = rx318_cur."from"()
    inc $P10
    set rx318_pos, $P10
    ge rx318_pos, rx318_eos, rxscan322_done
  rxscan322_scan:
    set_addr $I10, rxscan322_loop
    rx318_cur."!mark_push"(0, rx318_pos, $I10)
  rxscan322_done:
.annotate 'line', 105
  # rx literal  "<"
    add $I11, rx318_pos, 1
    gt $I11, rx318_eos, rx318_fail
    sub $I11, rx318_pos, rx318_off
    substr $S10, rx318_tgt, $I11, 1
    ne $S10, "<", rx318_fail
    add rx318_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx318_cur."!cursor_pos"(rx318_pos)
    $P10 = rx318_cur."assertion"()
    unless $P10, rx318_fail
    rx318_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx318_pos = $P10."pos"()
  alt323_0:
.annotate 'line', 106
    set_addr $I10, alt323_1
    rx318_cur."!mark_push"(0, rx318_pos, $I10)
  # rx literal  ">"
    add $I11, rx318_pos, 1
    gt $I11, rx318_eos, rx318_fail
    sub $I11, rx318_pos, rx318_off
    substr $S10, rx318_tgt, $I11, 1
    ne $S10, ">", rx318_fail
    add rx318_pos, 1
    goto alt323_end
  alt323_1:
  # rx subrule "panic" subtype=method negate=
    rx318_cur."!cursor_pos"(rx318_pos)
    $P10 = rx318_cur."panic"("regex assertion not terminated by angle bracket")
    unless $P10, rx318_fail
    rx318_pos = $P10."pos"()
  alt323_end:
.annotate 'line', 104
  # rx pass
    rx318_cur."!cursor_pass"(rx318_pos, "metachar:sym<assert>")
    rx318_cur."!cursor_debug"("PASS  ", "metachar:sym<assert>", " at pos=", rx318_pos)
    .return (rx318_cur)
  rx318_fail:
.annotate 'line', 3
    (rx318_rep, rx318_pos, $I10, $P10) = rx318_cur."!mark_fail"(0)
    lt rx318_pos, -1, rx318_done
    eq rx318_pos, -1, rx318_fail
    jump $I10
  rx318_done:
    rx318_cur."!cursor_fail"()
    rx318_cur."!cursor_debug"("FAIL  ", "metachar:sym<assert>")
    .return (rx318_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<assert>"  :subid("88_1278500530.77787") :method
.annotate 'line', 3
    $P320 = self."!PREFIX__!subrule"("assertion", "<")
    new $P321, "ResizablePMCArray"
    push $P321, $P320
    .return ($P321)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<var>"  :subid("89_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx325_tgt
    .local int rx325_pos
    .local int rx325_off
    .local int rx325_eos
    .local int rx325_rep
    .local pmc rx325_cur
    (rx325_cur, rx325_pos, rx325_tgt) = self."!cursor_start"()
    rx325_cur."!cursor_debug"("START ", "metachar:sym<var>")
    rx325_cur."!cursor_caparray"("quantified_atom")
    .lex unicode:"$\x{a2}", rx325_cur
    .local pmc match
    .lex "$/", match
    length rx325_eos, rx325_tgt
    gt rx325_pos, rx325_eos, rx325_done
    set rx325_off, 0
    lt rx325_pos, 2, rx325_start
    sub rx325_off, rx325_pos, 1
    substr rx325_tgt, rx325_tgt, rx325_off
  rx325_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan328_done
    goto rxscan328_scan
  rxscan328_loop:
    ($P10) = rx325_cur."from"()
    inc $P10
    set rx325_pos, $P10
    ge rx325_pos, rx325_eos, rxscan328_done
  rxscan328_scan:
    set_addr $I10, rxscan328_loop
    rx325_cur."!mark_push"(0, rx325_pos, $I10)
  rxscan328_done:
  alt329_0:
.annotate 'line', 110
    set_addr $I10, alt329_1
    rx325_cur."!mark_push"(0, rx325_pos, $I10)
.annotate 'line', 111
  # rx literal  "$<"
    add $I11, rx325_pos, 2
    gt $I11, rx325_eos, rx325_fail
    sub $I11, rx325_pos, rx325_off
    substr $S10, rx325_tgt, $I11, 2
    ne $S10, "$<", rx325_fail
    add rx325_pos, 2
  # rx subcapture "name"
    set_addr $I10, rxcap_332_fail
    rx325_cur."!mark_push"(0, rx325_pos, $I10)
  # rx rxquantr330 ** 1..*
    set_addr $I331, rxquantr330_done
    rx325_cur."!mark_push"(0, -1, $I331)
  rxquantr330_loop:
  # rx enumcharlist negate=1 
    ge rx325_pos, rx325_eos, rx325_fail
    sub $I10, rx325_pos, rx325_off
    substr $S10, rx325_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx325_fail
    inc rx325_pos
    (rx325_rep) = rx325_cur."!mark_commit"($I331)
    rx325_cur."!mark_push"(rx325_rep, rx325_pos, $I331)
    goto rxquantr330_loop
  rxquantr330_done:
    set_addr $I10, rxcap_332_fail
    ($I12, $I11) = rx325_cur."!mark_peek"($I10)
    rx325_cur."!cursor_pos"($I11)
    ($P10) = rx325_cur."!cursor_start"()
    $P10."!cursor_pass"(rx325_pos, "")
    rx325_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_332_done
  rxcap_332_fail:
    goto rx325_fail
  rxcap_332_done:
  # rx literal  ">"
    add $I11, rx325_pos, 1
    gt $I11, rx325_eos, rx325_fail
    sub $I11, rx325_pos, rx325_off
    substr $S10, rx325_tgt, $I11, 1
    ne $S10, ">", rx325_fail
    add rx325_pos, 1
    goto alt329_end
  alt329_1:
.annotate 'line', 112
  # rx literal  "$"
    add $I11, rx325_pos, 1
    gt $I11, rx325_eos, rx325_fail
    sub $I11, rx325_pos, rx325_off
    substr $S10, rx325_tgt, $I11, 1
    ne $S10, "$", rx325_fail
    add rx325_pos, 1
  # rx subcapture "pos"
    set_addr $I10, rxcap_333_fail
    rx325_cur."!mark_push"(0, rx325_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx325_pos, rx325_off
    find_not_cclass $I11, 8, rx325_tgt, $I10, rx325_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx325_fail
    add rx325_pos, rx325_off, $I11
    set_addr $I10, rxcap_333_fail
    ($I12, $I11) = rx325_cur."!mark_peek"($I10)
    rx325_cur."!cursor_pos"($I11)
    ($P10) = rx325_cur."!cursor_start"()
    $P10."!cursor_pass"(rx325_pos, "")
    rx325_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pos")
    goto rxcap_333_done
  rxcap_333_fail:
    goto rx325_fail
  rxcap_333_done:
  alt329_end:
.annotate 'line', 115
  # rx rxquantr334 ** 0..1
    set_addr $I335, rxquantr334_done
    rx325_cur."!mark_push"(0, rx325_pos, $I335)
  rxquantr334_loop:
  # rx subrule "ws" subtype=method negate=
    rx325_cur."!cursor_pos"(rx325_pos)
    $P10 = rx325_cur."ws"()
    unless $P10, rx325_fail
    rx325_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx325_pos, 1
    gt $I11, rx325_eos, rx325_fail
    sub $I11, rx325_pos, rx325_off
    substr $S10, rx325_tgt, $I11, 1
    ne $S10, "=", rx325_fail
    add rx325_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx325_cur."!cursor_pos"(rx325_pos)
    $P10 = rx325_cur."ws"()
    unless $P10, rx325_fail
    rx325_pos = $P10."pos"()
  # rx subrule "quantified_atom" subtype=capture negate=
    rx325_cur."!cursor_pos"(rx325_pos)
    $P10 = rx325_cur."quantified_atom"()
    unless $P10, rx325_fail
    rx325_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantified_atom")
    rx325_pos = $P10."pos"()
    (rx325_rep) = rx325_cur."!mark_commit"($I335)
  rxquantr334_done:
.annotate 'line', 109
  # rx pass
    rx325_cur."!cursor_pass"(rx325_pos, "metachar:sym<var>")
    rx325_cur."!cursor_debug"("PASS  ", "metachar:sym<var>", " at pos=", rx325_pos)
    .return (rx325_cur)
  rx325_fail:
.annotate 'line', 3
    (rx325_rep, rx325_pos, $I10, $P10) = rx325_cur."!mark_fail"(0)
    lt rx325_pos, -1, rx325_done
    eq rx325_pos, -1, rx325_fail
    jump $I10
  rx325_done:
    rx325_cur."!cursor_fail"()
    rx325_cur."!cursor_debug"("FAIL  ", "metachar:sym<var>")
    .return (rx325_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<var>"  :subid("90_1278500530.77787") :method
.annotate 'line', 3
    new $P327, "ResizablePMCArray"
    push $P327, "$"
    push $P327, "$<"
    .return ($P327)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<PIR>"  :subid("91_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx337_tgt
    .local int rx337_pos
    .local int rx337_off
    .local int rx337_eos
    .local int rx337_rep
    .local pmc rx337_cur
    (rx337_cur, rx337_pos, rx337_tgt) = self."!cursor_start"()
    rx337_cur."!cursor_debug"("START ", "metachar:sym<PIR>")
    .lex unicode:"$\x{a2}", rx337_cur
    .local pmc match
    .lex "$/", match
    length rx337_eos, rx337_tgt
    gt rx337_pos, rx337_eos, rx337_done
    set rx337_off, 0
    lt rx337_pos, 2, rx337_start
    sub rx337_off, rx337_pos, 1
    substr rx337_tgt, rx337_tgt, rx337_off
  rx337_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan340_done
    goto rxscan340_scan
  rxscan340_loop:
    ($P10) = rx337_cur."from"()
    inc $P10
    set rx337_pos, $P10
    ge rx337_pos, rx337_eos, rxscan340_done
  rxscan340_scan:
    set_addr $I10, rxscan340_loop
    rx337_cur."!mark_push"(0, rx337_pos, $I10)
  rxscan340_done:
.annotate 'line', 119
  # rx literal  ":PIR{{"
    add $I11, rx337_pos, 6
    gt $I11, rx337_eos, rx337_fail
    sub $I11, rx337_pos, rx337_off
    substr $S10, rx337_tgt, $I11, 6
    ne $S10, ":PIR{{", rx337_fail
    add rx337_pos, 6
  # rx subcapture "pir"
    set_addr $I10, rxcap_343_fail
    rx337_cur."!mark_push"(0, rx337_pos, $I10)
  # rx rxquantf341 ** 0..*
    set_addr $I10, rxquantf341_loop
    rx337_cur."!mark_push"(0, rx337_pos, $I10)
    goto rxquantf341_done
  rxquantf341_loop:
  # rx charclass .
    ge rx337_pos, rx337_eos, rx337_fail
    inc rx337_pos
    set_addr $I10, rxquantf341_loop
    rx337_cur."!mark_push"($I342, rx337_pos, $I10)
  rxquantf341_done:
    set_addr $I10, rxcap_343_fail
    ($I12, $I11) = rx337_cur."!mark_peek"($I10)
    rx337_cur."!cursor_pos"($I11)
    ($P10) = rx337_cur."!cursor_start"()
    $P10."!cursor_pass"(rx337_pos, "")
    rx337_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pir")
    goto rxcap_343_done
  rxcap_343_fail:
    goto rx337_fail
  rxcap_343_done:
  # rx literal  "}}"
    add $I11, rx337_pos, 2
    gt $I11, rx337_eos, rx337_fail
    sub $I11, rx337_pos, rx337_off
    substr $S10, rx337_tgt, $I11, 2
    ne $S10, "}}", rx337_fail
    add rx337_pos, 2
.annotate 'line', 118
  # rx pass
    rx337_cur."!cursor_pass"(rx337_pos, "metachar:sym<PIR>")
    rx337_cur."!cursor_debug"("PASS  ", "metachar:sym<PIR>", " at pos=", rx337_pos)
    .return (rx337_cur)
  rx337_fail:
.annotate 'line', 3
    (rx337_rep, rx337_pos, $I10, $P10) = rx337_cur."!mark_fail"(0)
    lt rx337_pos, -1, rx337_done
    eq rx337_pos, -1, rx337_fail
    jump $I10
  rx337_done:
    rx337_cur."!cursor_fail"()
    rx337_cur."!cursor_debug"("FAIL  ", "metachar:sym<PIR>")
    .return (rx337_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<PIR>"  :subid("92_1278500530.77787") :method
.annotate 'line', 3
    new $P339, "ResizablePMCArray"
    push $P339, ":PIR{{"
    .return ($P339)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash"  :subid("93_1278500530.77787") :method
.annotate 'line', 122
    $P345 = self."!protoregex"("backslash")
    .return ($P345)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash"  :subid("94_1278500530.77787") :method
.annotate 'line', 122
    $P347 = self."!PREFIX__!protoregex"("backslash")
    .return ($P347)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<w>"  :subid("95_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx349_tgt
    .local int rx349_pos
    .local int rx349_off
    .local int rx349_eos
    .local int rx349_rep
    .local pmc rx349_cur
    (rx349_cur, rx349_pos, rx349_tgt) = self."!cursor_start"()
    rx349_cur."!cursor_debug"("START ", "backslash:sym<w>")
    .lex unicode:"$\x{a2}", rx349_cur
    .local pmc match
    .lex "$/", match
    length rx349_eos, rx349_tgt
    gt rx349_pos, rx349_eos, rx349_done
    set rx349_off, 0
    lt rx349_pos, 2, rx349_start
    sub rx349_off, rx349_pos, 1
    substr rx349_tgt, rx349_tgt, rx349_off
  rx349_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan352_done
    goto rxscan352_scan
  rxscan352_loop:
    ($P10) = rx349_cur."from"()
    inc $P10
    set rx349_pos, $P10
    ge rx349_pos, rx349_eos, rxscan352_done
  rxscan352_scan:
    set_addr $I10, rxscan352_loop
    rx349_cur."!mark_push"(0, rx349_pos, $I10)
  rxscan352_done:
.annotate 'line', 123
  # rx subcapture "sym"
    set_addr $I10, rxcap_353_fail
    rx349_cur."!mark_push"(0, rx349_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx349_pos, rx349_eos, rx349_fail
    sub $I10, rx349_pos, rx349_off
    substr $S10, rx349_tgt, $I10, 1
    index $I11, "dswnDSWN", $S10
    lt $I11, 0, rx349_fail
    inc rx349_pos
    set_addr $I10, rxcap_353_fail
    ($I12, $I11) = rx349_cur."!mark_peek"($I10)
    rx349_cur."!cursor_pos"($I11)
    ($P10) = rx349_cur."!cursor_start"()
    $P10."!cursor_pass"(rx349_pos, "")
    rx349_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_353_done
  rxcap_353_fail:
    goto rx349_fail
  rxcap_353_done:
  # rx pass
    rx349_cur."!cursor_pass"(rx349_pos, "backslash:sym<w>")
    rx349_cur."!cursor_debug"("PASS  ", "backslash:sym<w>", " at pos=", rx349_pos)
    .return (rx349_cur)
  rx349_fail:
.annotate 'line', 3
    (rx349_rep, rx349_pos, $I10, $P10) = rx349_cur."!mark_fail"(0)
    lt rx349_pos, -1, rx349_done
    eq rx349_pos, -1, rx349_fail
    jump $I10
  rx349_done:
    rx349_cur."!cursor_fail"()
    rx349_cur."!cursor_debug"("FAIL  ", "backslash:sym<w>")
    .return (rx349_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<w>"  :subid("96_1278500530.77787") :method
.annotate 'line', 3
    new $P351, "ResizablePMCArray"
    push $P351, "N"
    push $P351, "W"
    push $P351, "S"
    push $P351, "D"
    push $P351, "n"
    push $P351, "w"
    push $P351, "s"
    push $P351, "d"
    .return ($P351)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<b>"  :subid("97_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx355_tgt
    .local int rx355_pos
    .local int rx355_off
    .local int rx355_eos
    .local int rx355_rep
    .local pmc rx355_cur
    (rx355_cur, rx355_pos, rx355_tgt) = self."!cursor_start"()
    rx355_cur."!cursor_debug"("START ", "backslash:sym<b>")
    .lex unicode:"$\x{a2}", rx355_cur
    .local pmc match
    .lex "$/", match
    length rx355_eos, rx355_tgt
    gt rx355_pos, rx355_eos, rx355_done
    set rx355_off, 0
    lt rx355_pos, 2, rx355_start
    sub rx355_off, rx355_pos, 1
    substr rx355_tgt, rx355_tgt, rx355_off
  rx355_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan358_done
    goto rxscan358_scan
  rxscan358_loop:
    ($P10) = rx355_cur."from"()
    inc $P10
    set rx355_pos, $P10
    ge rx355_pos, rx355_eos, rxscan358_done
  rxscan358_scan:
    set_addr $I10, rxscan358_loop
    rx355_cur."!mark_push"(0, rx355_pos, $I10)
  rxscan358_done:
.annotate 'line', 124
  # rx subcapture "sym"
    set_addr $I10, rxcap_359_fail
    rx355_cur."!mark_push"(0, rx355_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx355_pos, rx355_eos, rx355_fail
    sub $I10, rx355_pos, rx355_off
    substr $S10, rx355_tgt, $I10, 1
    index $I11, "bB", $S10
    lt $I11, 0, rx355_fail
    inc rx355_pos
    set_addr $I10, rxcap_359_fail
    ($I12, $I11) = rx355_cur."!mark_peek"($I10)
    rx355_cur."!cursor_pos"($I11)
    ($P10) = rx355_cur."!cursor_start"()
    $P10."!cursor_pass"(rx355_pos, "")
    rx355_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_359_done
  rxcap_359_fail:
    goto rx355_fail
  rxcap_359_done:
  # rx pass
    rx355_cur."!cursor_pass"(rx355_pos, "backslash:sym<b>")
    rx355_cur."!cursor_debug"("PASS  ", "backslash:sym<b>", " at pos=", rx355_pos)
    .return (rx355_cur)
  rx355_fail:
.annotate 'line', 3
    (rx355_rep, rx355_pos, $I10, $P10) = rx355_cur."!mark_fail"(0)
    lt rx355_pos, -1, rx355_done
    eq rx355_pos, -1, rx355_fail
    jump $I10
  rx355_done:
    rx355_cur."!cursor_fail"()
    rx355_cur."!cursor_debug"("FAIL  ", "backslash:sym<b>")
    .return (rx355_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<b>"  :subid("98_1278500530.77787") :method
.annotate 'line', 3
    new $P357, "ResizablePMCArray"
    push $P357, "B"
    push $P357, "b"
    .return ($P357)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<e>"  :subid("99_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx361_tgt
    .local int rx361_pos
    .local int rx361_off
    .local int rx361_eos
    .local int rx361_rep
    .local pmc rx361_cur
    (rx361_cur, rx361_pos, rx361_tgt) = self."!cursor_start"()
    rx361_cur."!cursor_debug"("START ", "backslash:sym<e>")
    .lex unicode:"$\x{a2}", rx361_cur
    .local pmc match
    .lex "$/", match
    length rx361_eos, rx361_tgt
    gt rx361_pos, rx361_eos, rx361_done
    set rx361_off, 0
    lt rx361_pos, 2, rx361_start
    sub rx361_off, rx361_pos, 1
    substr rx361_tgt, rx361_tgt, rx361_off
  rx361_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan364_done
    goto rxscan364_scan
  rxscan364_loop:
    ($P10) = rx361_cur."from"()
    inc $P10
    set rx361_pos, $P10
    ge rx361_pos, rx361_eos, rxscan364_done
  rxscan364_scan:
    set_addr $I10, rxscan364_loop
    rx361_cur."!mark_push"(0, rx361_pos, $I10)
  rxscan364_done:
.annotate 'line', 125
  # rx subcapture "sym"
    set_addr $I10, rxcap_365_fail
    rx361_cur."!mark_push"(0, rx361_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx361_pos, rx361_eos, rx361_fail
    sub $I10, rx361_pos, rx361_off
    substr $S10, rx361_tgt, $I10, 1
    index $I11, "eE", $S10
    lt $I11, 0, rx361_fail
    inc rx361_pos
    set_addr $I10, rxcap_365_fail
    ($I12, $I11) = rx361_cur."!mark_peek"($I10)
    rx361_cur."!cursor_pos"($I11)
    ($P10) = rx361_cur."!cursor_start"()
    $P10."!cursor_pass"(rx361_pos, "")
    rx361_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_365_done
  rxcap_365_fail:
    goto rx361_fail
  rxcap_365_done:
  # rx pass
    rx361_cur."!cursor_pass"(rx361_pos, "backslash:sym<e>")
    rx361_cur."!cursor_debug"("PASS  ", "backslash:sym<e>", " at pos=", rx361_pos)
    .return (rx361_cur)
  rx361_fail:
.annotate 'line', 3
    (rx361_rep, rx361_pos, $I10, $P10) = rx361_cur."!mark_fail"(0)
    lt rx361_pos, -1, rx361_done
    eq rx361_pos, -1, rx361_fail
    jump $I10
  rx361_done:
    rx361_cur."!cursor_fail"()
    rx361_cur."!cursor_debug"("FAIL  ", "backslash:sym<e>")
    .return (rx361_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<e>"  :subid("100_1278500530.77787") :method
.annotate 'line', 3
    new $P363, "ResizablePMCArray"
    push $P363, "E"
    push $P363, "e"
    .return ($P363)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<f>"  :subid("101_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx367_tgt
    .local int rx367_pos
    .local int rx367_off
    .local int rx367_eos
    .local int rx367_rep
    .local pmc rx367_cur
    (rx367_cur, rx367_pos, rx367_tgt) = self."!cursor_start"()
    rx367_cur."!cursor_debug"("START ", "backslash:sym<f>")
    .lex unicode:"$\x{a2}", rx367_cur
    .local pmc match
    .lex "$/", match
    length rx367_eos, rx367_tgt
    gt rx367_pos, rx367_eos, rx367_done
    set rx367_off, 0
    lt rx367_pos, 2, rx367_start
    sub rx367_off, rx367_pos, 1
    substr rx367_tgt, rx367_tgt, rx367_off
  rx367_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan370_done
    goto rxscan370_scan
  rxscan370_loop:
    ($P10) = rx367_cur."from"()
    inc $P10
    set rx367_pos, $P10
    ge rx367_pos, rx367_eos, rxscan370_done
  rxscan370_scan:
    set_addr $I10, rxscan370_loop
    rx367_cur."!mark_push"(0, rx367_pos, $I10)
  rxscan370_done:
.annotate 'line', 126
  # rx subcapture "sym"
    set_addr $I10, rxcap_371_fail
    rx367_cur."!mark_push"(0, rx367_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx367_pos, rx367_eos, rx367_fail
    sub $I10, rx367_pos, rx367_off
    substr $S10, rx367_tgt, $I10, 1
    index $I11, "fF", $S10
    lt $I11, 0, rx367_fail
    inc rx367_pos
    set_addr $I10, rxcap_371_fail
    ($I12, $I11) = rx367_cur."!mark_peek"($I10)
    rx367_cur."!cursor_pos"($I11)
    ($P10) = rx367_cur."!cursor_start"()
    $P10."!cursor_pass"(rx367_pos, "")
    rx367_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_371_done
  rxcap_371_fail:
    goto rx367_fail
  rxcap_371_done:
  # rx pass
    rx367_cur."!cursor_pass"(rx367_pos, "backslash:sym<f>")
    rx367_cur."!cursor_debug"("PASS  ", "backslash:sym<f>", " at pos=", rx367_pos)
    .return (rx367_cur)
  rx367_fail:
.annotate 'line', 3
    (rx367_rep, rx367_pos, $I10, $P10) = rx367_cur."!mark_fail"(0)
    lt rx367_pos, -1, rx367_done
    eq rx367_pos, -1, rx367_fail
    jump $I10
  rx367_done:
    rx367_cur."!cursor_fail"()
    rx367_cur."!cursor_debug"("FAIL  ", "backslash:sym<f>")
    .return (rx367_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<f>"  :subid("102_1278500530.77787") :method
.annotate 'line', 3
    new $P369, "ResizablePMCArray"
    push $P369, "F"
    push $P369, "f"
    .return ($P369)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<h>"  :subid("103_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx373_tgt
    .local int rx373_pos
    .local int rx373_off
    .local int rx373_eos
    .local int rx373_rep
    .local pmc rx373_cur
    (rx373_cur, rx373_pos, rx373_tgt) = self."!cursor_start"()
    rx373_cur."!cursor_debug"("START ", "backslash:sym<h>")
    .lex unicode:"$\x{a2}", rx373_cur
    .local pmc match
    .lex "$/", match
    length rx373_eos, rx373_tgt
    gt rx373_pos, rx373_eos, rx373_done
    set rx373_off, 0
    lt rx373_pos, 2, rx373_start
    sub rx373_off, rx373_pos, 1
    substr rx373_tgt, rx373_tgt, rx373_off
  rx373_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan376_done
    goto rxscan376_scan
  rxscan376_loop:
    ($P10) = rx373_cur."from"()
    inc $P10
    set rx373_pos, $P10
    ge rx373_pos, rx373_eos, rxscan376_done
  rxscan376_scan:
    set_addr $I10, rxscan376_loop
    rx373_cur."!mark_push"(0, rx373_pos, $I10)
  rxscan376_done:
.annotate 'line', 127
  # rx subcapture "sym"
    set_addr $I10, rxcap_377_fail
    rx373_cur."!mark_push"(0, rx373_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx373_pos, rx373_eos, rx373_fail
    sub $I10, rx373_pos, rx373_off
    substr $S10, rx373_tgt, $I10, 1
    index $I11, "hH", $S10
    lt $I11, 0, rx373_fail
    inc rx373_pos
    set_addr $I10, rxcap_377_fail
    ($I12, $I11) = rx373_cur."!mark_peek"($I10)
    rx373_cur."!cursor_pos"($I11)
    ($P10) = rx373_cur."!cursor_start"()
    $P10."!cursor_pass"(rx373_pos, "")
    rx373_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_377_done
  rxcap_377_fail:
    goto rx373_fail
  rxcap_377_done:
  # rx pass
    rx373_cur."!cursor_pass"(rx373_pos, "backslash:sym<h>")
    rx373_cur."!cursor_debug"("PASS  ", "backslash:sym<h>", " at pos=", rx373_pos)
    .return (rx373_cur)
  rx373_fail:
.annotate 'line', 3
    (rx373_rep, rx373_pos, $I10, $P10) = rx373_cur."!mark_fail"(0)
    lt rx373_pos, -1, rx373_done
    eq rx373_pos, -1, rx373_fail
    jump $I10
  rx373_done:
    rx373_cur."!cursor_fail"()
    rx373_cur."!cursor_debug"("FAIL  ", "backslash:sym<h>")
    .return (rx373_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<h>"  :subid("104_1278500530.77787") :method
.annotate 'line', 3
    new $P375, "ResizablePMCArray"
    push $P375, "H"
    push $P375, "h"
    .return ($P375)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<r>"  :subid("105_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx379_tgt
    .local int rx379_pos
    .local int rx379_off
    .local int rx379_eos
    .local int rx379_rep
    .local pmc rx379_cur
    (rx379_cur, rx379_pos, rx379_tgt) = self."!cursor_start"()
    rx379_cur."!cursor_debug"("START ", "backslash:sym<r>")
    .lex unicode:"$\x{a2}", rx379_cur
    .local pmc match
    .lex "$/", match
    length rx379_eos, rx379_tgt
    gt rx379_pos, rx379_eos, rx379_done
    set rx379_off, 0
    lt rx379_pos, 2, rx379_start
    sub rx379_off, rx379_pos, 1
    substr rx379_tgt, rx379_tgt, rx379_off
  rx379_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan382_done
    goto rxscan382_scan
  rxscan382_loop:
    ($P10) = rx379_cur."from"()
    inc $P10
    set rx379_pos, $P10
    ge rx379_pos, rx379_eos, rxscan382_done
  rxscan382_scan:
    set_addr $I10, rxscan382_loop
    rx379_cur."!mark_push"(0, rx379_pos, $I10)
  rxscan382_done:
.annotate 'line', 128
  # rx subcapture "sym"
    set_addr $I10, rxcap_383_fail
    rx379_cur."!mark_push"(0, rx379_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx379_pos, rx379_eos, rx379_fail
    sub $I10, rx379_pos, rx379_off
    substr $S10, rx379_tgt, $I10, 1
    index $I11, "rR", $S10
    lt $I11, 0, rx379_fail
    inc rx379_pos
    set_addr $I10, rxcap_383_fail
    ($I12, $I11) = rx379_cur."!mark_peek"($I10)
    rx379_cur."!cursor_pos"($I11)
    ($P10) = rx379_cur."!cursor_start"()
    $P10."!cursor_pass"(rx379_pos, "")
    rx379_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_383_done
  rxcap_383_fail:
    goto rx379_fail
  rxcap_383_done:
  # rx pass
    rx379_cur."!cursor_pass"(rx379_pos, "backslash:sym<r>")
    rx379_cur."!cursor_debug"("PASS  ", "backslash:sym<r>", " at pos=", rx379_pos)
    .return (rx379_cur)
  rx379_fail:
.annotate 'line', 3
    (rx379_rep, rx379_pos, $I10, $P10) = rx379_cur."!mark_fail"(0)
    lt rx379_pos, -1, rx379_done
    eq rx379_pos, -1, rx379_fail
    jump $I10
  rx379_done:
    rx379_cur."!cursor_fail"()
    rx379_cur."!cursor_debug"("FAIL  ", "backslash:sym<r>")
    .return (rx379_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<r>"  :subid("106_1278500530.77787") :method
.annotate 'line', 3
    new $P381, "ResizablePMCArray"
    push $P381, "R"
    push $P381, "r"
    .return ($P381)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<t>"  :subid("107_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx385_tgt
    .local int rx385_pos
    .local int rx385_off
    .local int rx385_eos
    .local int rx385_rep
    .local pmc rx385_cur
    (rx385_cur, rx385_pos, rx385_tgt) = self."!cursor_start"()
    rx385_cur."!cursor_debug"("START ", "backslash:sym<t>")
    .lex unicode:"$\x{a2}", rx385_cur
    .local pmc match
    .lex "$/", match
    length rx385_eos, rx385_tgt
    gt rx385_pos, rx385_eos, rx385_done
    set rx385_off, 0
    lt rx385_pos, 2, rx385_start
    sub rx385_off, rx385_pos, 1
    substr rx385_tgt, rx385_tgt, rx385_off
  rx385_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan388_done
    goto rxscan388_scan
  rxscan388_loop:
    ($P10) = rx385_cur."from"()
    inc $P10
    set rx385_pos, $P10
    ge rx385_pos, rx385_eos, rxscan388_done
  rxscan388_scan:
    set_addr $I10, rxscan388_loop
    rx385_cur."!mark_push"(0, rx385_pos, $I10)
  rxscan388_done:
.annotate 'line', 129
  # rx subcapture "sym"
    set_addr $I10, rxcap_389_fail
    rx385_cur."!mark_push"(0, rx385_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx385_pos, rx385_eos, rx385_fail
    sub $I10, rx385_pos, rx385_off
    substr $S10, rx385_tgt, $I10, 1
    index $I11, "tT", $S10
    lt $I11, 0, rx385_fail
    inc rx385_pos
    set_addr $I10, rxcap_389_fail
    ($I12, $I11) = rx385_cur."!mark_peek"($I10)
    rx385_cur."!cursor_pos"($I11)
    ($P10) = rx385_cur."!cursor_start"()
    $P10."!cursor_pass"(rx385_pos, "")
    rx385_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_389_done
  rxcap_389_fail:
    goto rx385_fail
  rxcap_389_done:
  # rx pass
    rx385_cur."!cursor_pass"(rx385_pos, "backslash:sym<t>")
    rx385_cur."!cursor_debug"("PASS  ", "backslash:sym<t>", " at pos=", rx385_pos)
    .return (rx385_cur)
  rx385_fail:
.annotate 'line', 3
    (rx385_rep, rx385_pos, $I10, $P10) = rx385_cur."!mark_fail"(0)
    lt rx385_pos, -1, rx385_done
    eq rx385_pos, -1, rx385_fail
    jump $I10
  rx385_done:
    rx385_cur."!cursor_fail"()
    rx385_cur."!cursor_debug"("FAIL  ", "backslash:sym<t>")
    .return (rx385_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<t>"  :subid("108_1278500530.77787") :method
.annotate 'line', 3
    new $P387, "ResizablePMCArray"
    push $P387, "T"
    push $P387, "t"
    .return ($P387)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<v>"  :subid("109_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx391_tgt
    .local int rx391_pos
    .local int rx391_off
    .local int rx391_eos
    .local int rx391_rep
    .local pmc rx391_cur
    (rx391_cur, rx391_pos, rx391_tgt) = self."!cursor_start"()
    rx391_cur."!cursor_debug"("START ", "backslash:sym<v>")
    .lex unicode:"$\x{a2}", rx391_cur
    .local pmc match
    .lex "$/", match
    length rx391_eos, rx391_tgt
    gt rx391_pos, rx391_eos, rx391_done
    set rx391_off, 0
    lt rx391_pos, 2, rx391_start
    sub rx391_off, rx391_pos, 1
    substr rx391_tgt, rx391_tgt, rx391_off
  rx391_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan394_done
    goto rxscan394_scan
  rxscan394_loop:
    ($P10) = rx391_cur."from"()
    inc $P10
    set rx391_pos, $P10
    ge rx391_pos, rx391_eos, rxscan394_done
  rxscan394_scan:
    set_addr $I10, rxscan394_loop
    rx391_cur."!mark_push"(0, rx391_pos, $I10)
  rxscan394_done:
.annotate 'line', 130
  # rx subcapture "sym"
    set_addr $I10, rxcap_395_fail
    rx391_cur."!mark_push"(0, rx391_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx391_pos, rx391_eos, rx391_fail
    sub $I10, rx391_pos, rx391_off
    substr $S10, rx391_tgt, $I10, 1
    index $I11, "vV", $S10
    lt $I11, 0, rx391_fail
    inc rx391_pos
    set_addr $I10, rxcap_395_fail
    ($I12, $I11) = rx391_cur."!mark_peek"($I10)
    rx391_cur."!cursor_pos"($I11)
    ($P10) = rx391_cur."!cursor_start"()
    $P10."!cursor_pass"(rx391_pos, "")
    rx391_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_395_done
  rxcap_395_fail:
    goto rx391_fail
  rxcap_395_done:
  # rx pass
    rx391_cur."!cursor_pass"(rx391_pos, "backslash:sym<v>")
    rx391_cur."!cursor_debug"("PASS  ", "backslash:sym<v>", " at pos=", rx391_pos)
    .return (rx391_cur)
  rx391_fail:
.annotate 'line', 3
    (rx391_rep, rx391_pos, $I10, $P10) = rx391_cur."!mark_fail"(0)
    lt rx391_pos, -1, rx391_done
    eq rx391_pos, -1, rx391_fail
    jump $I10
  rx391_done:
    rx391_cur."!cursor_fail"()
    rx391_cur."!cursor_debug"("FAIL  ", "backslash:sym<v>")
    .return (rx391_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<v>"  :subid("110_1278500530.77787") :method
.annotate 'line', 3
    new $P393, "ResizablePMCArray"
    push $P393, "V"
    push $P393, "v"
    .return ($P393)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<o>"  :subid("111_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx397_tgt
    .local int rx397_pos
    .local int rx397_off
    .local int rx397_eos
    .local int rx397_rep
    .local pmc rx397_cur
    (rx397_cur, rx397_pos, rx397_tgt) = self."!cursor_start"()
    rx397_cur."!cursor_debug"("START ", "backslash:sym<o>")
    .lex unicode:"$\x{a2}", rx397_cur
    .local pmc match
    .lex "$/", match
    length rx397_eos, rx397_tgt
    gt rx397_pos, rx397_eos, rx397_done
    set rx397_off, 0
    lt rx397_pos, 2, rx397_start
    sub rx397_off, rx397_pos, 1
    substr rx397_tgt, rx397_tgt, rx397_off
  rx397_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan404_done
    goto rxscan404_scan
  rxscan404_loop:
    ($P10) = rx397_cur."from"()
    inc $P10
    set rx397_pos, $P10
    ge rx397_pos, rx397_eos, rxscan404_done
  rxscan404_scan:
    set_addr $I10, rxscan404_loop
    rx397_cur."!mark_push"(0, rx397_pos, $I10)
  rxscan404_done:
.annotate 'line', 131
  # rx subcapture "sym"
    set_addr $I10, rxcap_405_fail
    rx397_cur."!mark_push"(0, rx397_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx397_pos, rx397_eos, rx397_fail
    sub $I10, rx397_pos, rx397_off
    substr $S10, rx397_tgt, $I10, 1
    index $I11, "oO", $S10
    lt $I11, 0, rx397_fail
    inc rx397_pos
    set_addr $I10, rxcap_405_fail
    ($I12, $I11) = rx397_cur."!mark_peek"($I10)
    rx397_cur."!cursor_pos"($I11)
    ($P10) = rx397_cur."!cursor_start"()
    $P10."!cursor_pass"(rx397_pos, "")
    rx397_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_405_done
  rxcap_405_fail:
    goto rx397_fail
  rxcap_405_done:
  alt406_0:
    set_addr $I10, alt406_1
    rx397_cur."!mark_push"(0, rx397_pos, $I10)
  # rx subrule "octint" subtype=capture negate=
    rx397_cur."!cursor_pos"(rx397_pos)
    $P10 = rx397_cur."octint"()
    unless $P10, rx397_fail
    rx397_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octint")
    rx397_pos = $P10."pos"()
    goto alt406_end
  alt406_1:
  # rx literal  "["
    add $I11, rx397_pos, 1
    gt $I11, rx397_eos, rx397_fail
    sub $I11, rx397_pos, rx397_off
    substr $S10, rx397_tgt, $I11, 1
    ne $S10, "[", rx397_fail
    add rx397_pos, 1
  # rx subrule "octints" subtype=capture negate=
    rx397_cur."!cursor_pos"(rx397_pos)
    $P10 = rx397_cur."octints"()
    unless $P10, rx397_fail
    rx397_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octints")
    rx397_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx397_pos, 1
    gt $I11, rx397_eos, rx397_fail
    sub $I11, rx397_pos, rx397_off
    substr $S10, rx397_tgt, $I11, 1
    ne $S10, "]", rx397_fail
    add rx397_pos, 1
  alt406_end:
  # rx pass
    rx397_cur."!cursor_pass"(rx397_pos, "backslash:sym<o>")
    rx397_cur."!cursor_debug"("PASS  ", "backslash:sym<o>", " at pos=", rx397_pos)
    .return (rx397_cur)
  rx397_fail:
.annotate 'line', 3
    (rx397_rep, rx397_pos, $I10, $P10) = rx397_cur."!mark_fail"(0)
    lt rx397_pos, -1, rx397_done
    eq rx397_pos, -1, rx397_fail
    jump $I10
  rx397_done:
    rx397_cur."!cursor_fail"()
    rx397_cur."!cursor_debug"("FAIL  ", "backslash:sym<o>")
    .return (rx397_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<o>"  :subid("112_1278500530.77787") :method
.annotate 'line', 3
    $P399 = self."!PREFIX__!subrule"("octints", "O[")
    $P400 = self."!PREFIX__!subrule"("octint", "O")
    $P401 = self."!PREFIX__!subrule"("octints", "o[")
    $P402 = self."!PREFIX__!subrule"("octint", "o")
    new $P403, "ResizablePMCArray"
    push $P403, $P399
    push $P403, $P400
    push $P403, $P401
    push $P403, $P402
    .return ($P403)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<x>"  :subid("113_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx408_tgt
    .local int rx408_pos
    .local int rx408_off
    .local int rx408_eos
    .local int rx408_rep
    .local pmc rx408_cur
    (rx408_cur, rx408_pos, rx408_tgt) = self."!cursor_start"()
    rx408_cur."!cursor_debug"("START ", "backslash:sym<x>")
    .lex unicode:"$\x{a2}", rx408_cur
    .local pmc match
    .lex "$/", match
    length rx408_eos, rx408_tgt
    gt rx408_pos, rx408_eos, rx408_done
    set rx408_off, 0
    lt rx408_pos, 2, rx408_start
    sub rx408_off, rx408_pos, 1
    substr rx408_tgt, rx408_tgt, rx408_off
  rx408_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan415_done
    goto rxscan415_scan
  rxscan415_loop:
    ($P10) = rx408_cur."from"()
    inc $P10
    set rx408_pos, $P10
    ge rx408_pos, rx408_eos, rxscan415_done
  rxscan415_scan:
    set_addr $I10, rxscan415_loop
    rx408_cur."!mark_push"(0, rx408_pos, $I10)
  rxscan415_done:
.annotate 'line', 132
  # rx subcapture "sym"
    set_addr $I10, rxcap_416_fail
    rx408_cur."!mark_push"(0, rx408_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx408_pos, rx408_eos, rx408_fail
    sub $I10, rx408_pos, rx408_off
    substr $S10, rx408_tgt, $I10, 1
    index $I11, "xX", $S10
    lt $I11, 0, rx408_fail
    inc rx408_pos
    set_addr $I10, rxcap_416_fail
    ($I12, $I11) = rx408_cur."!mark_peek"($I10)
    rx408_cur."!cursor_pos"($I11)
    ($P10) = rx408_cur."!cursor_start"()
    $P10."!cursor_pass"(rx408_pos, "")
    rx408_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_416_done
  rxcap_416_fail:
    goto rx408_fail
  rxcap_416_done:
  alt417_0:
    set_addr $I10, alt417_1
    rx408_cur."!mark_push"(0, rx408_pos, $I10)
  # rx subrule "hexint" subtype=capture negate=
    rx408_cur."!cursor_pos"(rx408_pos)
    $P10 = rx408_cur."hexint"()
    unless $P10, rx408_fail
    rx408_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexint")
    rx408_pos = $P10."pos"()
    goto alt417_end
  alt417_1:
  # rx literal  "["
    add $I11, rx408_pos, 1
    gt $I11, rx408_eos, rx408_fail
    sub $I11, rx408_pos, rx408_off
    substr $S10, rx408_tgt, $I11, 1
    ne $S10, "[", rx408_fail
    add rx408_pos, 1
  # rx subrule "hexints" subtype=capture negate=
    rx408_cur."!cursor_pos"(rx408_pos)
    $P10 = rx408_cur."hexints"()
    unless $P10, rx408_fail
    rx408_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexints")
    rx408_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx408_pos, 1
    gt $I11, rx408_eos, rx408_fail
    sub $I11, rx408_pos, rx408_off
    substr $S10, rx408_tgt, $I11, 1
    ne $S10, "]", rx408_fail
    add rx408_pos, 1
  alt417_end:
  # rx pass
    rx408_cur."!cursor_pass"(rx408_pos, "backslash:sym<x>")
    rx408_cur."!cursor_debug"("PASS  ", "backslash:sym<x>", " at pos=", rx408_pos)
    .return (rx408_cur)
  rx408_fail:
.annotate 'line', 3
    (rx408_rep, rx408_pos, $I10, $P10) = rx408_cur."!mark_fail"(0)
    lt rx408_pos, -1, rx408_done
    eq rx408_pos, -1, rx408_fail
    jump $I10
  rx408_done:
    rx408_cur."!cursor_fail"()
    rx408_cur."!cursor_debug"("FAIL  ", "backslash:sym<x>")
    .return (rx408_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<x>"  :subid("114_1278500530.77787") :method
.annotate 'line', 3
    $P410 = self."!PREFIX__!subrule"("hexints", "X[")
    $P411 = self."!PREFIX__!subrule"("hexint", "X")
    $P412 = self."!PREFIX__!subrule"("hexints", "x[")
    $P413 = self."!PREFIX__!subrule"("hexint", "x")
    new $P414, "ResizablePMCArray"
    push $P414, $P410
    push $P414, $P411
    push $P414, $P412
    push $P414, $P413
    .return ($P414)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<c>"  :subid("115_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx419_tgt
    .local int rx419_pos
    .local int rx419_off
    .local int rx419_eos
    .local int rx419_rep
    .local pmc rx419_cur
    (rx419_cur, rx419_pos, rx419_tgt) = self."!cursor_start"()
    rx419_cur."!cursor_debug"("START ", "backslash:sym<c>")
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
    ne $I10, -1, rxscan424_done
    goto rxscan424_scan
  rxscan424_loop:
    ($P10) = rx419_cur."from"()
    inc $P10
    set rx419_pos, $P10
    ge rx419_pos, rx419_eos, rxscan424_done
  rxscan424_scan:
    set_addr $I10, rxscan424_loop
    rx419_cur."!mark_push"(0, rx419_pos, $I10)
  rxscan424_done:
.annotate 'line', 133
  # rx subcapture "sym"
    set_addr $I10, rxcap_425_fail
    rx419_cur."!mark_push"(0, rx419_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx419_pos, rx419_eos, rx419_fail
    sub $I10, rx419_pos, rx419_off
    substr $S10, rx419_tgt, $I10, 1
    index $I11, "cC", $S10
    lt $I11, 0, rx419_fail
    inc rx419_pos
    set_addr $I10, rxcap_425_fail
    ($I12, $I11) = rx419_cur."!mark_peek"($I10)
    rx419_cur."!cursor_pos"($I11)
    ($P10) = rx419_cur."!cursor_start"()
    $P10."!cursor_pass"(rx419_pos, "")
    rx419_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_425_done
  rxcap_425_fail:
    goto rx419_fail
  rxcap_425_done:
  # rx subrule "charspec" subtype=capture negate=
    rx419_cur."!cursor_pos"(rx419_pos)
    $P10 = rx419_cur."charspec"()
    unless $P10, rx419_fail
    rx419_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charspec")
    rx419_pos = $P10."pos"()
  # rx pass
    rx419_cur."!cursor_pass"(rx419_pos, "backslash:sym<c>")
    rx419_cur."!cursor_debug"("PASS  ", "backslash:sym<c>", " at pos=", rx419_pos)
    .return (rx419_cur)
  rx419_fail:
.annotate 'line', 3
    (rx419_rep, rx419_pos, $I10, $P10) = rx419_cur."!mark_fail"(0)
    lt rx419_pos, -1, rx419_done
    eq rx419_pos, -1, rx419_fail
    jump $I10
  rx419_done:
    rx419_cur."!cursor_fail"()
    rx419_cur."!cursor_debug"("FAIL  ", "backslash:sym<c>")
    .return (rx419_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<c>"  :subid("116_1278500530.77787") :method
.annotate 'line', 3
    $P421 = self."!PREFIX__!subrule"("charspec", "C")
    $P422 = self."!PREFIX__!subrule"("charspec", "c")
    new $P423, "ResizablePMCArray"
    push $P423, $P421
    push $P423, $P422
    .return ($P423)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<A>"  :subid("117_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx427_tgt
    .local int rx427_pos
    .local int rx427_off
    .local int rx427_eos
    .local int rx427_rep
    .local pmc rx427_cur
    (rx427_cur, rx427_pos, rx427_tgt) = self."!cursor_start"()
    rx427_cur."!cursor_debug"("START ", "backslash:sym<A>")
    .lex unicode:"$\x{a2}", rx427_cur
    .local pmc match
    .lex "$/", match
    length rx427_eos, rx427_tgt
    gt rx427_pos, rx427_eos, rx427_done
    set rx427_off, 0
    lt rx427_pos, 2, rx427_start
    sub rx427_off, rx427_pos, 1
    substr rx427_tgt, rx427_tgt, rx427_off
  rx427_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan431_done
    goto rxscan431_scan
  rxscan431_loop:
    ($P10) = rx427_cur."from"()
    inc $P10
    set rx427_pos, $P10
    ge rx427_pos, rx427_eos, rxscan431_done
  rxscan431_scan:
    set_addr $I10, rxscan431_loop
    rx427_cur."!mark_push"(0, rx427_pos, $I10)
  rxscan431_done:
.annotate 'line', 134
  # rx literal  "A"
    add $I11, rx427_pos, 1
    gt $I11, rx427_eos, rx427_fail
    sub $I11, rx427_pos, rx427_off
    substr $S10, rx427_tgt, $I11, 1
    ne $S10, "A", rx427_fail
    add rx427_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx427_cur."!cursor_pos"(rx427_pos)
    $P10 = rx427_cur."obs"("\\A as beginning-of-string matcher", "^")
    unless $P10, rx427_fail
    rx427_pos = $P10."pos"()
  # rx pass
    rx427_cur."!cursor_pass"(rx427_pos, "backslash:sym<A>")
    rx427_cur."!cursor_debug"("PASS  ", "backslash:sym<A>", " at pos=", rx427_pos)
    .return (rx427_cur)
  rx427_fail:
.annotate 'line', 3
    (rx427_rep, rx427_pos, $I10, $P10) = rx427_cur."!mark_fail"(0)
    lt rx427_pos, -1, rx427_done
    eq rx427_pos, -1, rx427_fail
    jump $I10
  rx427_done:
    rx427_cur."!cursor_fail"()
    rx427_cur."!cursor_debug"("FAIL  ", "backslash:sym<A>")
    .return (rx427_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<A>"  :subid("118_1278500530.77787") :method
.annotate 'line', 3
    $P429 = self."!PREFIX__!subrule"("obs", "A")
    new $P430, "ResizablePMCArray"
    push $P430, $P429
    .return ($P430)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<z>"  :subid("119_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx433_tgt
    .local int rx433_pos
    .local int rx433_off
    .local int rx433_eos
    .local int rx433_rep
    .local pmc rx433_cur
    (rx433_cur, rx433_pos, rx433_tgt) = self."!cursor_start"()
    rx433_cur."!cursor_debug"("START ", "backslash:sym<z>")
    .lex unicode:"$\x{a2}", rx433_cur
    .local pmc match
    .lex "$/", match
    length rx433_eos, rx433_tgt
    gt rx433_pos, rx433_eos, rx433_done
    set rx433_off, 0
    lt rx433_pos, 2, rx433_start
    sub rx433_off, rx433_pos, 1
    substr rx433_tgt, rx433_tgt, rx433_off
  rx433_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan437_done
    goto rxscan437_scan
  rxscan437_loop:
    ($P10) = rx433_cur."from"()
    inc $P10
    set rx433_pos, $P10
    ge rx433_pos, rx433_eos, rxscan437_done
  rxscan437_scan:
    set_addr $I10, rxscan437_loop
    rx433_cur."!mark_push"(0, rx433_pos, $I10)
  rxscan437_done:
.annotate 'line', 135
  # rx literal  "z"
    add $I11, rx433_pos, 1
    gt $I11, rx433_eos, rx433_fail
    sub $I11, rx433_pos, rx433_off
    substr $S10, rx433_tgt, $I11, 1
    ne $S10, "z", rx433_fail
    add rx433_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx433_cur."!cursor_pos"(rx433_pos)
    $P10 = rx433_cur."obs"("\\z as end-of-string matcher", "$")
    unless $P10, rx433_fail
    rx433_pos = $P10."pos"()
  # rx pass
    rx433_cur."!cursor_pass"(rx433_pos, "backslash:sym<z>")
    rx433_cur."!cursor_debug"("PASS  ", "backslash:sym<z>", " at pos=", rx433_pos)
    .return (rx433_cur)
  rx433_fail:
.annotate 'line', 3
    (rx433_rep, rx433_pos, $I10, $P10) = rx433_cur."!mark_fail"(0)
    lt rx433_pos, -1, rx433_done
    eq rx433_pos, -1, rx433_fail
    jump $I10
  rx433_done:
    rx433_cur."!cursor_fail"()
    rx433_cur."!cursor_debug"("FAIL  ", "backslash:sym<z>")
    .return (rx433_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<z>"  :subid("120_1278500530.77787") :method
.annotate 'line', 3
    $P435 = self."!PREFIX__!subrule"("obs", "z")
    new $P436, "ResizablePMCArray"
    push $P436, $P435
    .return ($P436)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Z>"  :subid("121_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx439_tgt
    .local int rx439_pos
    .local int rx439_off
    .local int rx439_eos
    .local int rx439_rep
    .local pmc rx439_cur
    (rx439_cur, rx439_pos, rx439_tgt) = self."!cursor_start"()
    rx439_cur."!cursor_debug"("START ", "backslash:sym<Z>")
    .lex unicode:"$\x{a2}", rx439_cur
    .local pmc match
    .lex "$/", match
    length rx439_eos, rx439_tgt
    gt rx439_pos, rx439_eos, rx439_done
    set rx439_off, 0
    lt rx439_pos, 2, rx439_start
    sub rx439_off, rx439_pos, 1
    substr rx439_tgt, rx439_tgt, rx439_off
  rx439_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan443_done
    goto rxscan443_scan
  rxscan443_loop:
    ($P10) = rx439_cur."from"()
    inc $P10
    set rx439_pos, $P10
    ge rx439_pos, rx439_eos, rxscan443_done
  rxscan443_scan:
    set_addr $I10, rxscan443_loop
    rx439_cur."!mark_push"(0, rx439_pos, $I10)
  rxscan443_done:
.annotate 'line', 136
  # rx literal  "Z"
    add $I11, rx439_pos, 1
    gt $I11, rx439_eos, rx439_fail
    sub $I11, rx439_pos, rx439_off
    substr $S10, rx439_tgt, $I11, 1
    ne $S10, "Z", rx439_fail
    add rx439_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx439_cur."!cursor_pos"(rx439_pos)
    $P10 = rx439_cur."obs"("\\Z as end-of-string matcher", "\\n?$")
    unless $P10, rx439_fail
    rx439_pos = $P10."pos"()
  # rx pass
    rx439_cur."!cursor_pass"(rx439_pos, "backslash:sym<Z>")
    rx439_cur."!cursor_debug"("PASS  ", "backslash:sym<Z>", " at pos=", rx439_pos)
    .return (rx439_cur)
  rx439_fail:
.annotate 'line', 3
    (rx439_rep, rx439_pos, $I10, $P10) = rx439_cur."!mark_fail"(0)
    lt rx439_pos, -1, rx439_done
    eq rx439_pos, -1, rx439_fail
    jump $I10
  rx439_done:
    rx439_cur."!cursor_fail"()
    rx439_cur."!cursor_debug"("FAIL  ", "backslash:sym<Z>")
    .return (rx439_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<Z>"  :subid("122_1278500530.77787") :method
.annotate 'line', 3
    $P441 = self."!PREFIX__!subrule"("obs", "Z")
    new $P442, "ResizablePMCArray"
    push $P442, $P441
    .return ($P442)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Q>"  :subid("123_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx445_tgt
    .local int rx445_pos
    .local int rx445_off
    .local int rx445_eos
    .local int rx445_rep
    .local pmc rx445_cur
    (rx445_cur, rx445_pos, rx445_tgt) = self."!cursor_start"()
    rx445_cur."!cursor_debug"("START ", "backslash:sym<Q>")
    .lex unicode:"$\x{a2}", rx445_cur
    .local pmc match
    .lex "$/", match
    length rx445_eos, rx445_tgt
    gt rx445_pos, rx445_eos, rx445_done
    set rx445_off, 0
    lt rx445_pos, 2, rx445_start
    sub rx445_off, rx445_pos, 1
    substr rx445_tgt, rx445_tgt, rx445_off
  rx445_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan449_done
    goto rxscan449_scan
  rxscan449_loop:
    ($P10) = rx445_cur."from"()
    inc $P10
    set rx445_pos, $P10
    ge rx445_pos, rx445_eos, rxscan449_done
  rxscan449_scan:
    set_addr $I10, rxscan449_loop
    rx445_cur."!mark_push"(0, rx445_pos, $I10)
  rxscan449_done:
.annotate 'line', 137
  # rx literal  "Q"
    add $I11, rx445_pos, 1
    gt $I11, rx445_eos, rx445_fail
    sub $I11, rx445_pos, rx445_off
    substr $S10, rx445_tgt, $I11, 1
    ne $S10, "Q", rx445_fail
    add rx445_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx445_cur."!cursor_pos"(rx445_pos)
    $P10 = rx445_cur."obs"("\\Q as quotemeta", "quotes or literal variable match")
    unless $P10, rx445_fail
    rx445_pos = $P10."pos"()
  # rx pass
    rx445_cur."!cursor_pass"(rx445_pos, "backslash:sym<Q>")
    rx445_cur."!cursor_debug"("PASS  ", "backslash:sym<Q>", " at pos=", rx445_pos)
    .return (rx445_cur)
  rx445_fail:
.annotate 'line', 3
    (rx445_rep, rx445_pos, $I10, $P10) = rx445_cur."!mark_fail"(0)
    lt rx445_pos, -1, rx445_done
    eq rx445_pos, -1, rx445_fail
    jump $I10
  rx445_done:
    rx445_cur."!cursor_fail"()
    rx445_cur."!cursor_debug"("FAIL  ", "backslash:sym<Q>")
    .return (rx445_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<Q>"  :subid("124_1278500530.77787") :method
.annotate 'line', 3
    $P447 = self."!PREFIX__!subrule"("obs", "Q")
    new $P448, "ResizablePMCArray"
    push $P448, $P447
    .return ($P448)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<misc>"  :subid("125_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx451_tgt
    .local int rx451_pos
    .local int rx451_off
    .local int rx451_eos
    .local int rx451_rep
    .local pmc rx451_cur
    (rx451_cur, rx451_pos, rx451_tgt) = self."!cursor_start"()
    rx451_cur."!cursor_debug"("START ", "backslash:sym<misc>")
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
    ne $I10, -1, rxscan454_done
    goto rxscan454_scan
  rxscan454_loop:
    ($P10) = rx451_cur."from"()
    inc $P10
    set rx451_pos, $P10
    ge rx451_pos, rx451_eos, rxscan454_done
  rxscan454_scan:
    set_addr $I10, rxscan454_loop
    rx451_cur."!mark_push"(0, rx451_pos, $I10)
  rxscan454_done:
.annotate 'line', 138
  # rx charclass W
    ge rx451_pos, rx451_eos, rx451_fail
    sub $I10, rx451_pos, rx451_off
    is_cclass $I11, 8192, rx451_tgt, $I10
    if $I11, rx451_fail
    inc rx451_pos
  # rx pass
    rx451_cur."!cursor_pass"(rx451_pos, "backslash:sym<misc>")
    rx451_cur."!cursor_debug"("PASS  ", "backslash:sym<misc>", " at pos=", rx451_pos)
    .return (rx451_cur)
  rx451_fail:
.annotate 'line', 3
    (rx451_rep, rx451_pos, $I10, $P10) = rx451_cur."!mark_fail"(0)
    lt rx451_pos, -1, rx451_done
    eq rx451_pos, -1, rx451_fail
    jump $I10
  rx451_done:
    rx451_cur."!cursor_fail"()
    rx451_cur."!cursor_debug"("FAIL  ", "backslash:sym<misc>")
    .return (rx451_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<misc>"  :subid("126_1278500530.77787") :method
.annotate 'line', 3
    new $P453, "ResizablePMCArray"
    push $P453, ""
    .return ($P453)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion"  :subid("127_1278500530.77787") :method
.annotate 'line', 140
    $P456 = self."!protoregex"("assertion")
    .return ($P456)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion"  :subid("128_1278500530.77787") :method
.annotate 'line', 140
    $P458 = self."!PREFIX__!protoregex"("assertion")
    .return ($P458)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<?>"  :subid("129_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .const 'Sub' $P467 = "131_1278500530.77787" 
    capture_lex $P467
    .local string rx460_tgt
    .local int rx460_pos
    .local int rx460_off
    .local int rx460_eos
    .local int rx460_rep
    .local pmc rx460_cur
    (rx460_cur, rx460_pos, rx460_tgt) = self."!cursor_start"()
    rx460_cur."!cursor_debug"("START ", "assertion:sym<?>")
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
    ne $I10, -1, rxscan464_done
    goto rxscan464_scan
  rxscan464_loop:
    ($P10) = rx460_cur."from"()
    inc $P10
    set rx460_pos, $P10
    ge rx460_pos, rx460_eos, rxscan464_done
  rxscan464_scan:
    set_addr $I10, rxscan464_loop
    rx460_cur."!mark_push"(0, rx460_pos, $I10)
  rxscan464_done:
.annotate 'line', 142
  # rx literal  "?"
    add $I11, rx460_pos, 1
    gt $I11, rx460_eos, rx460_fail
    sub $I11, rx460_pos, rx460_off
    substr $S10, rx460_tgt, $I11, 1
    ne $S10, "?", rx460_fail
    add rx460_pos, 1
  alt465_0:
    set_addr $I10, alt465_1
    rx460_cur."!mark_push"(0, rx460_pos, $I10)
  # rx subrule "before" subtype=zerowidth negate=
    rx460_cur."!cursor_pos"(rx460_pos)
    .const 'Sub' $P467 = "131_1278500530.77787" 
    capture_lex $P467
    $P10 = rx460_cur."before"($P467)
    unless $P10, rx460_fail
    goto alt465_end
  alt465_1:
  # rx subrule "assertion" subtype=capture negate=
    rx460_cur."!cursor_pos"(rx460_pos)
    $P10 = rx460_cur."assertion"()
    unless $P10, rx460_fail
    rx460_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx460_pos = $P10."pos"()
  alt465_end:
  # rx pass
    rx460_cur."!cursor_pass"(rx460_pos, "assertion:sym<?>")
    rx460_cur."!cursor_debug"("PASS  ", "assertion:sym<?>", " at pos=", rx460_pos)
    .return (rx460_cur)
  rx460_fail:
.annotate 'line', 3
    (rx460_rep, rx460_pos, $I10, $P10) = rx460_cur."!mark_fail"(0)
    lt rx460_pos, -1, rx460_done
    eq rx460_pos, -1, rx460_fail
    jump $I10
  rx460_done:
    rx460_cur."!cursor_fail"()
    rx460_cur."!cursor_debug"("FAIL  ", "assertion:sym<?>")
    .return (rx460_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<?>"  :subid("130_1278500530.77787") :method
.annotate 'line', 3
    $P462 = self."!PREFIX__!subrule"("assertion", "?")
    new $P463, "ResizablePMCArray"
    push $P463, $P462
    push $P463, "?"
    .return ($P463)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block466"  :anon :subid("131_1278500530.77787") :method :outer("129_1278500530.77787")
.annotate 'line', 142
    .local string rx468_tgt
    .local int rx468_pos
    .local int rx468_off
    .local int rx468_eos
    .local int rx468_rep
    .local pmc rx468_cur
    (rx468_cur, rx468_pos, rx468_tgt) = self."!cursor_start"()
    rx468_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx468_cur
    .local pmc match
    .lex "$/", match
    length rx468_eos, rx468_tgt
    gt rx468_pos, rx468_eos, rx468_done
    set rx468_off, 0
    lt rx468_pos, 2, rx468_start
    sub rx468_off, rx468_pos, 1
    substr rx468_tgt, rx468_tgt, rx468_off
  rx468_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan469_done
    goto rxscan469_scan
  rxscan469_loop:
    ($P10) = rx468_cur."from"()
    inc $P10
    set rx468_pos, $P10
    ge rx468_pos, rx468_eos, rxscan469_done
  rxscan469_scan:
    set_addr $I10, rxscan469_loop
    rx468_cur."!mark_push"(0, rx468_pos, $I10)
  rxscan469_done:
  # rx literal  ">"
    add $I11, rx468_pos, 1
    gt $I11, rx468_eos, rx468_fail
    sub $I11, rx468_pos, rx468_off
    substr $S10, rx468_tgt, $I11, 1
    ne $S10, ">", rx468_fail
    add rx468_pos, 1
  # rx pass
    rx468_cur."!cursor_pass"(rx468_pos, "")
    rx468_cur."!cursor_debug"("PASS  ", "", " at pos=", rx468_pos)
    .return (rx468_cur)
  rx468_fail:
    (rx468_rep, rx468_pos, $I10, $P10) = rx468_cur."!mark_fail"(0)
    lt rx468_pos, -1, rx468_done
    eq rx468_pos, -1, rx468_fail
    jump $I10
  rx468_done:
    rx468_cur."!cursor_fail"()
    rx468_cur."!cursor_debug"("FAIL  ", "")
    .return (rx468_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<!>"  :subid("132_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .const 'Sub' $P478 = "134_1278500530.77787" 
    capture_lex $P478
    .local string rx471_tgt
    .local int rx471_pos
    .local int rx471_off
    .local int rx471_eos
    .local int rx471_rep
    .local pmc rx471_cur
    (rx471_cur, rx471_pos, rx471_tgt) = self."!cursor_start"()
    rx471_cur."!cursor_debug"("START ", "assertion:sym<!>")
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
    ne $I10, -1, rxscan475_done
    goto rxscan475_scan
  rxscan475_loop:
    ($P10) = rx471_cur."from"()
    inc $P10
    set rx471_pos, $P10
    ge rx471_pos, rx471_eos, rxscan475_done
  rxscan475_scan:
    set_addr $I10, rxscan475_loop
    rx471_cur."!mark_push"(0, rx471_pos, $I10)
  rxscan475_done:
.annotate 'line', 143
  # rx literal  "!"
    add $I11, rx471_pos, 1
    gt $I11, rx471_eos, rx471_fail
    sub $I11, rx471_pos, rx471_off
    substr $S10, rx471_tgt, $I11, 1
    ne $S10, "!", rx471_fail
    add rx471_pos, 1
  alt476_0:
    set_addr $I10, alt476_1
    rx471_cur."!mark_push"(0, rx471_pos, $I10)
  # rx subrule "before" subtype=zerowidth negate=
    rx471_cur."!cursor_pos"(rx471_pos)
    .const 'Sub' $P478 = "134_1278500530.77787" 
    capture_lex $P478
    $P10 = rx471_cur."before"($P478)
    unless $P10, rx471_fail
    goto alt476_end
  alt476_1:
  # rx subrule "assertion" subtype=capture negate=
    rx471_cur."!cursor_pos"(rx471_pos)
    $P10 = rx471_cur."assertion"()
    unless $P10, rx471_fail
    rx471_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx471_pos = $P10."pos"()
  alt476_end:
  # rx pass
    rx471_cur."!cursor_pass"(rx471_pos, "assertion:sym<!>")
    rx471_cur."!cursor_debug"("PASS  ", "assertion:sym<!>", " at pos=", rx471_pos)
    .return (rx471_cur)
  rx471_fail:
.annotate 'line', 3
    (rx471_rep, rx471_pos, $I10, $P10) = rx471_cur."!mark_fail"(0)
    lt rx471_pos, -1, rx471_done
    eq rx471_pos, -1, rx471_fail
    jump $I10
  rx471_done:
    rx471_cur."!cursor_fail"()
    rx471_cur."!cursor_debug"("FAIL  ", "assertion:sym<!>")
    .return (rx471_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<!>"  :subid("133_1278500530.77787") :method
.annotate 'line', 3
    $P473 = self."!PREFIX__!subrule"("assertion", "!")
    new $P474, "ResizablePMCArray"
    push $P474, $P473
    push $P474, "!"
    .return ($P474)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block477"  :anon :subid("134_1278500530.77787") :method :outer("132_1278500530.77787")
.annotate 'line', 143
    .local string rx479_tgt
    .local int rx479_pos
    .local int rx479_off
    .local int rx479_eos
    .local int rx479_rep
    .local pmc rx479_cur
    (rx479_cur, rx479_pos, rx479_tgt) = self."!cursor_start"()
    rx479_cur."!cursor_debug"("START ", "")
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
    ne $I10, -1, rxscan480_done
    goto rxscan480_scan
  rxscan480_loop:
    ($P10) = rx479_cur."from"()
    inc $P10
    set rx479_pos, $P10
    ge rx479_pos, rx479_eos, rxscan480_done
  rxscan480_scan:
    set_addr $I10, rxscan480_loop
    rx479_cur."!mark_push"(0, rx479_pos, $I10)
  rxscan480_done:
  # rx literal  ">"
    add $I11, rx479_pos, 1
    gt $I11, rx479_eos, rx479_fail
    sub $I11, rx479_pos, rx479_off
    substr $S10, rx479_tgt, $I11, 1
    ne $S10, ">", rx479_fail
    add rx479_pos, 1
  # rx pass
    rx479_cur."!cursor_pass"(rx479_pos, "")
    rx479_cur."!cursor_debug"("PASS  ", "", " at pos=", rx479_pos)
    .return (rx479_cur)
  rx479_fail:
    (rx479_rep, rx479_pos, $I10, $P10) = rx479_cur."!mark_fail"(0)
    lt rx479_pos, -1, rx479_done
    eq rx479_pos, -1, rx479_fail
    jump $I10
  rx479_done:
    rx479_cur."!cursor_fail"()
    rx479_cur."!cursor_debug"("FAIL  ", "")
    .return (rx479_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<method>"  :subid("135_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx482_tgt
    .local int rx482_pos
    .local int rx482_off
    .local int rx482_eos
    .local int rx482_rep
    .local pmc rx482_cur
    (rx482_cur, rx482_pos, rx482_tgt) = self."!cursor_start"()
    rx482_cur."!cursor_debug"("START ", "assertion:sym<method>")
    .lex unicode:"$\x{a2}", rx482_cur
    .local pmc match
    .lex "$/", match
    length rx482_eos, rx482_tgt
    gt rx482_pos, rx482_eos, rx482_done
    set rx482_off, 0
    lt rx482_pos, 2, rx482_start
    sub rx482_off, rx482_pos, 1
    substr rx482_tgt, rx482_tgt, rx482_off
  rx482_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan486_done
    goto rxscan486_scan
  rxscan486_loop:
    ($P10) = rx482_cur."from"()
    inc $P10
    set rx482_pos, $P10
    ge rx482_pos, rx482_eos, rxscan486_done
  rxscan486_scan:
    set_addr $I10, rxscan486_loop
    rx482_cur."!mark_push"(0, rx482_pos, $I10)
  rxscan486_done:
.annotate 'line', 146
  # rx literal  "."
    add $I11, rx482_pos, 1
    gt $I11, rx482_eos, rx482_fail
    sub $I11, rx482_pos, rx482_off
    substr $S10, rx482_tgt, $I11, 1
    ne $S10, ".", rx482_fail
    add rx482_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx482_cur."!cursor_pos"(rx482_pos)
    $P10 = rx482_cur."assertion"()
    unless $P10, rx482_fail
    rx482_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx482_pos = $P10."pos"()
.annotate 'line', 145
  # rx pass
    rx482_cur."!cursor_pass"(rx482_pos, "assertion:sym<method>")
    rx482_cur."!cursor_debug"("PASS  ", "assertion:sym<method>", " at pos=", rx482_pos)
    .return (rx482_cur)
  rx482_fail:
.annotate 'line', 3
    (rx482_rep, rx482_pos, $I10, $P10) = rx482_cur."!mark_fail"(0)
    lt rx482_pos, -1, rx482_done
    eq rx482_pos, -1, rx482_fail
    jump $I10
  rx482_done:
    rx482_cur."!cursor_fail"()
    rx482_cur."!cursor_debug"("FAIL  ", "assertion:sym<method>")
    .return (rx482_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<method>"  :subid("136_1278500530.77787") :method
.annotate 'line', 3
    $P484 = self."!PREFIX__!subrule"("assertion", ".")
    new $P485, "ResizablePMCArray"
    push $P485, $P484
    .return ($P485)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<name>"  :subid("137_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .const 'Sub' $P496 = "139_1278500530.77787" 
    capture_lex $P496
    .local string rx488_tgt
    .local int rx488_pos
    .local int rx488_off
    .local int rx488_eos
    .local int rx488_rep
    .local pmc rx488_cur
    (rx488_cur, rx488_pos, rx488_tgt) = self."!cursor_start"()
    rx488_cur."!cursor_debug"("START ", "assertion:sym<name>")
    rx488_cur."!cursor_caparray"("assertion", "nibbler", "arglist")
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
    ne $I10, -1, rxscan492_done
    goto rxscan492_scan
  rxscan492_loop:
    ($P10) = rx488_cur."from"()
    inc $P10
    set rx488_pos, $P10
    ge rx488_pos, rx488_eos, rxscan492_done
  rxscan492_scan:
    set_addr $I10, rxscan492_loop
    rx488_cur."!mark_push"(0, rx488_pos, $I10)
  rxscan492_done:
.annotate 'line', 150
  # rx subrule "identifier" subtype=capture negate=
    rx488_cur."!cursor_pos"(rx488_pos)
    $P10 = rx488_cur."identifier"()
    unless $P10, rx488_fail
    rx488_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    rx488_pos = $P10."pos"()
.annotate 'line', 157
  # rx rxquantr493 ** 0..1
    set_addr $I499, rxquantr493_done
    rx488_cur."!mark_push"(0, rx488_pos, $I499)
  rxquantr493_loop:
  alt494_0:
.annotate 'line', 151
    set_addr $I10, alt494_1
    rx488_cur."!mark_push"(0, rx488_pos, $I10)
.annotate 'line', 152
  # rx subrule "before" subtype=zerowidth negate=
    rx488_cur."!cursor_pos"(rx488_pos)
    .const 'Sub' $P496 = "139_1278500530.77787" 
    capture_lex $P496
    $P10 = rx488_cur."before"($P496)
    unless $P10, rx488_fail
    goto alt494_end
  alt494_1:
    set_addr $I10, alt494_2
    rx488_cur."!mark_push"(0, rx488_pos, $I10)
.annotate 'line', 153
  # rx literal  "="
    add $I11, rx488_pos, 1
    gt $I11, rx488_eos, rx488_fail
    sub $I11, rx488_pos, rx488_off
    substr $S10, rx488_tgt, $I11, 1
    ne $S10, "=", rx488_fail
    add rx488_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx488_cur."!cursor_pos"(rx488_pos)
    $P10 = rx488_cur."assertion"()
    unless $P10, rx488_fail
    rx488_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx488_pos = $P10."pos"()
    goto alt494_end
  alt494_2:
    set_addr $I10, alt494_3
    rx488_cur."!mark_push"(0, rx488_pos, $I10)
.annotate 'line', 154
  # rx literal  ":"
    add $I11, rx488_pos, 1
    gt $I11, rx488_eos, rx488_fail
    sub $I11, rx488_pos, rx488_off
    substr $S10, rx488_tgt, $I11, 1
    ne $S10, ":", rx488_fail
    add rx488_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx488_cur."!cursor_pos"(rx488_pos)
    $P10 = rx488_cur."arglist"()
    unless $P10, rx488_fail
    rx488_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx488_pos = $P10."pos"()
    goto alt494_end
  alt494_3:
    set_addr $I10, alt494_4
    rx488_cur."!mark_push"(0, rx488_pos, $I10)
.annotate 'line', 155
  # rx literal  "("
    add $I11, rx488_pos, 1
    gt $I11, rx488_eos, rx488_fail
    sub $I11, rx488_pos, rx488_off
    substr $S10, rx488_tgt, $I11, 1
    ne $S10, "(", rx488_fail
    add rx488_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx488_cur."!cursor_pos"(rx488_pos)
    $P10 = rx488_cur."arglist"()
    unless $P10, rx488_fail
    rx488_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx488_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx488_pos, 1
    gt $I11, rx488_eos, rx488_fail
    sub $I11, rx488_pos, rx488_off
    substr $S10, rx488_tgt, $I11, 1
    ne $S10, ")", rx488_fail
    add rx488_pos, 1
    goto alt494_end
  alt494_4:
.annotate 'line', 156
  # rx subrule "normspace" subtype=method negate=
    rx488_cur."!cursor_pos"(rx488_pos)
    $P10 = rx488_cur."normspace"()
    unless $P10, rx488_fail
    rx488_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx488_cur."!cursor_pos"(rx488_pos)
    $P10 = rx488_cur."nibbler"()
    unless $P10, rx488_fail
    rx488_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx488_pos = $P10."pos"()
  alt494_end:
.annotate 'line', 157
    (rx488_rep) = rx488_cur."!mark_commit"($I499)
  rxquantr493_done:
.annotate 'line', 149
  # rx pass
    rx488_cur."!cursor_pass"(rx488_pos, "assertion:sym<name>")
    rx488_cur."!cursor_debug"("PASS  ", "assertion:sym<name>", " at pos=", rx488_pos)
    .return (rx488_cur)
  rx488_fail:
.annotate 'line', 3
    (rx488_rep, rx488_pos, $I10, $P10) = rx488_cur."!mark_fail"(0)
    lt rx488_pos, -1, rx488_done
    eq rx488_pos, -1, rx488_fail
    jump $I10
  rx488_done:
    rx488_cur."!cursor_fail"()
    rx488_cur."!cursor_debug"("FAIL  ", "assertion:sym<name>")
    .return (rx488_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<name>"  :subid("138_1278500530.77787") :method
.annotate 'line', 3
    $P490 = self."!PREFIX__!subrule"("identifier", "")
    new $P491, "ResizablePMCArray"
    push $P491, $P490
    .return ($P491)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block495"  :anon :subid("139_1278500530.77787") :method :outer("137_1278500530.77787")
.annotate 'line', 152
    .local string rx497_tgt
    .local int rx497_pos
    .local int rx497_off
    .local int rx497_eos
    .local int rx497_rep
    .local pmc rx497_cur
    (rx497_cur, rx497_pos, rx497_tgt) = self."!cursor_start"()
    rx497_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx497_cur
    .local pmc match
    .lex "$/", match
    length rx497_eos, rx497_tgt
    gt rx497_pos, rx497_eos, rx497_done
    set rx497_off, 0
    lt rx497_pos, 2, rx497_start
    sub rx497_off, rx497_pos, 1
    substr rx497_tgt, rx497_tgt, rx497_off
  rx497_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan498_done
    goto rxscan498_scan
  rxscan498_loop:
    ($P10) = rx497_cur."from"()
    inc $P10
    set rx497_pos, $P10
    ge rx497_pos, rx497_eos, rxscan498_done
  rxscan498_scan:
    set_addr $I10, rxscan498_loop
    rx497_cur."!mark_push"(0, rx497_pos, $I10)
  rxscan498_done:
  # rx literal  ">"
    add $I11, rx497_pos, 1
    gt $I11, rx497_eos, rx497_fail
    sub $I11, rx497_pos, rx497_off
    substr $S10, rx497_tgt, $I11, 1
    ne $S10, ">", rx497_fail
    add rx497_pos, 1
  # rx pass
    rx497_cur."!cursor_pass"(rx497_pos, "")
    rx497_cur."!cursor_debug"("PASS  ", "", " at pos=", rx497_pos)
    .return (rx497_cur)
  rx497_fail:
    (rx497_rep, rx497_pos, $I10, $P10) = rx497_cur."!mark_fail"(0)
    lt rx497_pos, -1, rx497_done
    eq rx497_pos, -1, rx497_fail
    jump $I10
  rx497_done:
    rx497_cur."!cursor_fail"()
    rx497_cur."!cursor_debug"("FAIL  ", "")
    .return (rx497_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<[>"  :subid("140_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .const 'Sub' $P506 = "142_1278500530.77787" 
    capture_lex $P506
    .local string rx501_tgt
    .local int rx501_pos
    .local int rx501_off
    .local int rx501_eos
    .local int rx501_rep
    .local pmc rx501_cur
    (rx501_cur, rx501_pos, rx501_tgt) = self."!cursor_start"()
    rx501_cur."!cursor_debug"("START ", "assertion:sym<[>")
    rx501_cur."!cursor_caparray"("cclass_elem")
    .lex unicode:"$\x{a2}", rx501_cur
    .local pmc match
    .lex "$/", match
    length rx501_eos, rx501_tgt
    gt rx501_pos, rx501_eos, rx501_done
    set rx501_off, 0
    lt rx501_pos, 2, rx501_start
    sub rx501_off, rx501_pos, 1
    substr rx501_tgt, rx501_tgt, rx501_off
  rx501_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan504_done
    goto rxscan504_scan
  rxscan504_loop:
    ($P10) = rx501_cur."from"()
    inc $P10
    set rx501_pos, $P10
    ge rx501_pos, rx501_eos, rxscan504_done
  rxscan504_scan:
    set_addr $I10, rxscan504_loop
    rx501_cur."!mark_push"(0, rx501_pos, $I10)
  rxscan504_done:
.annotate 'line', 160
  # rx subrule "before" subtype=zerowidth negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    .const 'Sub' $P506 = "142_1278500530.77787" 
    capture_lex $P506
    $P10 = rx501_cur."before"($P506)
    unless $P10, rx501_fail
  # rx rxquantr510 ** 1..*
    set_addr $I511, rxquantr510_done
    rx501_cur."!mark_push"(0, -1, $I511)
  rxquantr510_loop:
  # rx subrule "cclass_elem" subtype=capture negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."cclass_elem"()
    unless $P10, rx501_fail
    rx501_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cclass_elem")
    rx501_pos = $P10."pos"()
    (rx501_rep) = rx501_cur."!mark_commit"($I511)
    rx501_cur."!mark_push"(rx501_rep, rx501_pos, $I511)
    goto rxquantr510_loop
  rxquantr510_done:
  # rx pass
    rx501_cur."!cursor_pass"(rx501_pos, "assertion:sym<[>")
    rx501_cur."!cursor_debug"("PASS  ", "assertion:sym<[>", " at pos=", rx501_pos)
    .return (rx501_cur)
  rx501_fail:
.annotate 'line', 3
    (rx501_rep, rx501_pos, $I10, $P10) = rx501_cur."!mark_fail"(0)
    lt rx501_pos, -1, rx501_done
    eq rx501_pos, -1, rx501_fail
    jump $I10
  rx501_done:
    rx501_cur."!cursor_fail"()
    rx501_cur."!cursor_debug"("FAIL  ", "assertion:sym<[>")
    .return (rx501_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<[>"  :subid("141_1278500530.77787") :method
.annotate 'line', 3
    new $P503, "ResizablePMCArray"
    push $P503, ""
    .return ($P503)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block505"  :anon :subid("142_1278500530.77787") :method :outer("140_1278500530.77787")
.annotate 'line', 160
    .local string rx507_tgt
    .local int rx507_pos
    .local int rx507_off
    .local int rx507_eos
    .local int rx507_rep
    .local pmc rx507_cur
    (rx507_cur, rx507_pos, rx507_tgt) = self."!cursor_start"()
    rx507_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx507_cur
    .local pmc match
    .lex "$/", match
    length rx507_eos, rx507_tgt
    gt rx507_pos, rx507_eos, rx507_done
    set rx507_off, 0
    lt rx507_pos, 2, rx507_start
    sub rx507_off, rx507_pos, 1
    substr rx507_tgt, rx507_tgt, rx507_off
  rx507_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan508_done
    goto rxscan508_scan
  rxscan508_loop:
    ($P10) = rx507_cur."from"()
    inc $P10
    set rx507_pos, $P10
    ge rx507_pos, rx507_eos, rxscan508_done
  rxscan508_scan:
    set_addr $I10, rxscan508_loop
    rx507_cur."!mark_push"(0, rx507_pos, $I10)
  rxscan508_done:
  alt509_0:
    set_addr $I10, alt509_1
    rx507_cur."!mark_push"(0, rx507_pos, $I10)
  # rx literal  "["
    add $I11, rx507_pos, 1
    gt $I11, rx507_eos, rx507_fail
    sub $I11, rx507_pos, rx507_off
    substr $S10, rx507_tgt, $I11, 1
    ne $S10, "[", rx507_fail
    add rx507_pos, 1
    goto alt509_end
  alt509_1:
    set_addr $I10, alt509_2
    rx507_cur."!mark_push"(0, rx507_pos, $I10)
  # rx literal  "+"
    add $I11, rx507_pos, 1
    gt $I11, rx507_eos, rx507_fail
    sub $I11, rx507_pos, rx507_off
    substr $S10, rx507_tgt, $I11, 1
    ne $S10, "+", rx507_fail
    add rx507_pos, 1
    goto alt509_end
  alt509_2:
  # rx literal  "-"
    add $I11, rx507_pos, 1
    gt $I11, rx507_eos, rx507_fail
    sub $I11, rx507_pos, rx507_off
    substr $S10, rx507_tgt, $I11, 1
    ne $S10, "-", rx507_fail
    add rx507_pos, 1
  alt509_end:
  # rx pass
    rx507_cur."!cursor_pass"(rx507_pos, "")
    rx507_cur."!cursor_debug"("PASS  ", "", " at pos=", rx507_pos)
    .return (rx507_cur)
  rx507_fail:
    (rx507_rep, rx507_pos, $I10, $P10) = rx507_cur."!mark_fail"(0)
    lt rx507_pos, -1, rx507_done
    eq rx507_pos, -1, rx507_fail
    jump $I10
  rx507_done:
    rx507_cur."!cursor_fail"()
    rx507_cur."!cursor_debug"("FAIL  ", "")
    .return (rx507_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "cclass_elem"  :subid("143_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .const 'Sub' $P524 = "145_1278500530.77787" 
    capture_lex $P524
    .local string rx513_tgt
    .local int rx513_pos
    .local int rx513_off
    .local int rx513_eos
    .local int rx513_rep
    .local pmc rx513_cur
    (rx513_cur, rx513_pos, rx513_tgt) = self."!cursor_start"()
    rx513_cur."!cursor_debug"("START ", "cclass_elem")
    rx513_cur."!cursor_caparray"("charspec")
    .lex unicode:"$\x{a2}", rx513_cur
    .local pmc match
    .lex "$/", match
    length rx513_eos, rx513_tgt
    gt rx513_pos, rx513_eos, rx513_done
    set rx513_off, 0
    lt rx513_pos, 2, rx513_start
    sub rx513_off, rx513_pos, 1
    substr rx513_tgt, rx513_tgt, rx513_off
  rx513_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan516_done
    goto rxscan516_scan
  rxscan516_loop:
    ($P10) = rx513_cur."from"()
    inc $P10
    set rx513_pos, $P10
    ge rx513_pos, rx513_eos, rxscan516_done
  rxscan516_scan:
    set_addr $I10, rxscan516_loop
    rx513_cur."!mark_push"(0, rx513_pos, $I10)
  rxscan516_done:
.annotate 'line', 163
  # rx subcapture "sign"
    set_addr $I10, rxcap_518_fail
    rx513_cur."!mark_push"(0, rx513_pos, $I10)
  alt517_0:
    set_addr $I10, alt517_1
    rx513_cur."!mark_push"(0, rx513_pos, $I10)
  # rx literal  "+"
    add $I11, rx513_pos, 1
    gt $I11, rx513_eos, rx513_fail
    sub $I11, rx513_pos, rx513_off
    substr $S10, rx513_tgt, $I11, 1
    ne $S10, "+", rx513_fail
    add rx513_pos, 1
    goto alt517_end
  alt517_1:
    set_addr $I10, alt517_2
    rx513_cur."!mark_push"(0, rx513_pos, $I10)
  # rx literal  "-"
    add $I11, rx513_pos, 1
    gt $I11, rx513_eos, rx513_fail
    sub $I11, rx513_pos, rx513_off
    substr $S10, rx513_tgt, $I11, 1
    ne $S10, "-", rx513_fail
    add rx513_pos, 1
    goto alt517_end
  alt517_2:
  alt517_end:
    set_addr $I10, rxcap_518_fail
    ($I12, $I11) = rx513_cur."!mark_peek"($I10)
    rx513_cur."!cursor_pos"($I11)
    ($P10) = rx513_cur."!cursor_start"()
    $P10."!cursor_pass"(rx513_pos, "")
    rx513_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sign")
    goto rxcap_518_done
  rxcap_518_fail:
    goto rx513_fail
  rxcap_518_done:
.annotate 'line', 164
  # rx rxquantr519 ** 0..1
    set_addr $I520, rxquantr519_done
    rx513_cur."!mark_push"(0, rx513_pos, $I520)
  rxquantr519_loop:
  # rx subrule "normspace" subtype=method negate=
    rx513_cur."!cursor_pos"(rx513_pos)
    $P10 = rx513_cur."normspace"()
    unless $P10, rx513_fail
    rx513_pos = $P10."pos"()
    (rx513_rep) = rx513_cur."!mark_commit"($I520)
  rxquantr519_done:
  alt521_0:
.annotate 'line', 165
    set_addr $I10, alt521_1
    rx513_cur."!mark_push"(0, rx513_pos, $I10)
.annotate 'line', 166
  # rx literal  "["
    add $I11, rx513_pos, 1
    gt $I11, rx513_eos, rx513_fail
    sub $I11, rx513_pos, rx513_off
    substr $S10, rx513_tgt, $I11, 1
    ne $S10, "[", rx513_fail
    add rx513_pos, 1
.annotate 'line', 169
  # rx rxquantr522 ** 0..*
    set_addr $I543, rxquantr522_done
    rx513_cur."!mark_push"(0, rx513_pos, $I543)
  rxquantr522_loop:
.annotate 'line', 166
  # rx subrule $P524 subtype=capture negate=
    rx513_cur."!cursor_pos"(rx513_pos)
    .const 'Sub' $P524 = "145_1278500530.77787" 
    capture_lex $P524
    $P10 = rx513_cur.$P524()
    unless $P10, rx513_fail
    rx513_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charspec")
    rx513_pos = $P10."pos"()
.annotate 'line', 169
    (rx513_rep) = rx513_cur."!mark_commit"($I543)
    rx513_cur."!mark_push"(rx513_rep, rx513_pos, $I543)
    goto rxquantr522_loop
  rxquantr522_done:
.annotate 'line', 170
  # rx charclass_q s r 0..-1
    sub $I10, rx513_pos, rx513_off
    find_not_cclass $I11, 32, rx513_tgt, $I10, rx513_eos
    add rx513_pos, rx513_off, $I11
  # rx literal  "]"
    add $I11, rx513_pos, 1
    gt $I11, rx513_eos, rx513_fail
    sub $I11, rx513_pos, rx513_off
    substr $S10, rx513_tgt, $I11, 1
    ne $S10, "]", rx513_fail
    add rx513_pos, 1
.annotate 'line', 166
    goto alt521_end
  alt521_1:
.annotate 'line', 171
  # rx subcapture "name"
    set_addr $I10, rxcap_544_fail
    rx513_cur."!mark_push"(0, rx513_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx513_pos, rx513_off
    find_not_cclass $I11, 8192, rx513_tgt, $I10, rx513_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx513_fail
    add rx513_pos, rx513_off, $I11
    set_addr $I10, rxcap_544_fail
    ($I12, $I11) = rx513_cur."!mark_peek"($I10)
    rx513_cur."!cursor_pos"($I11)
    ($P10) = rx513_cur."!cursor_start"()
    $P10."!cursor_pass"(rx513_pos, "")
    rx513_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_544_done
  rxcap_544_fail:
    goto rx513_fail
  rxcap_544_done:
  alt521_end:
.annotate 'line', 173
  # rx rxquantr545 ** 0..1
    set_addr $I546, rxquantr545_done
    rx513_cur."!mark_push"(0, rx513_pos, $I546)
  rxquantr545_loop:
  # rx subrule "normspace" subtype=method negate=
    rx513_cur."!cursor_pos"(rx513_pos)
    $P10 = rx513_cur."normspace"()
    unless $P10, rx513_fail
    rx513_pos = $P10."pos"()
    (rx513_rep) = rx513_cur."!mark_commit"($I546)
  rxquantr545_done:
.annotate 'line', 162
  # rx pass
    rx513_cur."!cursor_pass"(rx513_pos, "cclass_elem")
    rx513_cur."!cursor_debug"("PASS  ", "cclass_elem", " at pos=", rx513_pos)
    .return (rx513_cur)
  rx513_fail:
.annotate 'line', 3
    (rx513_rep, rx513_pos, $I10, $P10) = rx513_cur."!mark_fail"(0)
    lt rx513_pos, -1, rx513_done
    eq rx513_pos, -1, rx513_fail
    jump $I10
  rx513_done:
    rx513_cur."!cursor_fail"()
    rx513_cur."!cursor_debug"("FAIL  ", "cclass_elem")
    .return (rx513_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__cclass_elem"  :subid("144_1278500530.77787") :method
.annotate 'line', 3
    new $P515, "ResizablePMCArray"
    push $P515, ""
    push $P515, "-"
    push $P515, "+"
    .return ($P515)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block523"  :anon :subid("145_1278500530.77787") :method :outer("143_1278500530.77787")
.annotate 'line', 166
    .const 'Sub' $P539 = "148_1278500530.77787" 
    capture_lex $P539
    .const 'Sub' $P534 = "147_1278500530.77787" 
    capture_lex $P534
    .const 'Sub' $P530 = "146_1278500530.77787" 
    capture_lex $P530
    .local string rx525_tgt
    .local int rx525_pos
    .local int rx525_off
    .local int rx525_eos
    .local int rx525_rep
    .local pmc rx525_cur
    (rx525_cur, rx525_pos, rx525_tgt) = self."!cursor_start"()
    rx525_cur."!cursor_debug"("START ", "")
    rx525_cur."!cursor_caparray"("1")
    .lex unicode:"$\x{a2}", rx525_cur
    .local pmc match
    .lex "$/", match
    length rx525_eos, rx525_tgt
    gt rx525_pos, rx525_eos, rx525_done
    set rx525_off, 0
    lt rx525_pos, 2, rx525_start
    sub rx525_off, rx525_pos, 1
    substr rx525_tgt, rx525_tgt, rx525_off
  rx525_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan526_done
    goto rxscan526_scan
  rxscan526_loop:
    ($P10) = rx525_cur."from"()
    inc $P10
    set rx525_pos, $P10
    ge rx525_pos, rx525_eos, rxscan526_done
  rxscan526_scan:
    set_addr $I10, rxscan526_loop
    rx525_cur."!mark_push"(0, rx525_pos, $I10)
  rxscan526_done:
  alt527_0:
    set_addr $I10, alt527_1
    rx525_cur."!mark_push"(0, rx525_pos, $I10)
.annotate 'line', 167
  # rx charclass_q s r 0..-1
    sub $I10, rx525_pos, rx525_off
    find_not_cclass $I11, 32, rx525_tgt, $I10, rx525_eos
    add rx525_pos, rx525_off, $I11
  # rx literal  "-"
    add $I11, rx525_pos, 1
    gt $I11, rx525_eos, rx525_fail
    sub $I11, rx525_pos, rx525_off
    substr $S10, rx525_tgt, $I11, 1
    ne $S10, "-", rx525_fail
    add rx525_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx525_cur."!cursor_pos"(rx525_pos)
    $P10 = rx525_cur."obs"("hyphen in enumerated character class", "..")
    unless $P10, rx525_fail
    rx525_pos = $P10."pos"()
    goto alt527_end
  alt527_1:
.annotate 'line', 168
  # rx charclass_q s r 0..-1
    sub $I10, rx525_pos, rx525_off
    find_not_cclass $I11, 32, rx525_tgt, $I10, rx525_eos
    add rx525_pos, rx525_off, $I11
  alt528_0:
    set_addr $I10, alt528_1
    rx525_cur."!mark_push"(0, rx525_pos, $I10)
  # rx literal  "\\"
    add $I11, rx525_pos, 1
    gt $I11, rx525_eos, rx525_fail
    sub $I11, rx525_pos, rx525_off
    substr $S10, rx525_tgt, $I11, 1
    ne $S10, "\\", rx525_fail
    add rx525_pos, 1
  # rx subrule $P530 subtype=capture negate=
    rx525_cur."!cursor_pos"(rx525_pos)
    .const 'Sub' $P530 = "146_1278500530.77787" 
    capture_lex $P530
    $P10 = rx525_cur.$P530()
    unless $P10, rx525_fail
    rx525_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"(0)
    rx525_pos = $P10."pos"()
    goto alt528_end
  alt528_1:
  # rx subrule $P534 subtype=capture negate=
    rx525_cur."!cursor_pos"(rx525_pos)
    .const 'Sub' $P534 = "147_1278500530.77787" 
    capture_lex $P534
    $P10 = rx525_cur.$P534()
    unless $P10, rx525_fail
    rx525_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"(0)
    rx525_pos = $P10."pos"()
  alt528_end:
  # rx rxquantr537 ** 0..1
    set_addr $I542, rxquantr537_done
    rx525_cur."!mark_push"(0, rx525_pos, $I542)
  rxquantr537_loop:
  # rx charclass_q s r 0..-1
    sub $I10, rx525_pos, rx525_off
    find_not_cclass $I11, 32, rx525_tgt, $I10, rx525_eos
    add rx525_pos, rx525_off, $I11
  # rx literal  ".."
    add $I11, rx525_pos, 2
    gt $I11, rx525_eos, rx525_fail
    sub $I11, rx525_pos, rx525_off
    substr $S10, rx525_tgt, $I11, 2
    ne $S10, "..", rx525_fail
    add rx525_pos, 2
  # rx charclass_q s r 0..-1
    sub $I10, rx525_pos, rx525_off
    find_not_cclass $I11, 32, rx525_tgt, $I10, rx525_eos
    add rx525_pos, rx525_off, $I11
  # rx subrule $P539 subtype=capture negate=
    rx525_cur."!cursor_pos"(rx525_pos)
    .const 'Sub' $P539 = "148_1278500530.77787" 
    capture_lex $P539
    $P10 = rx525_cur.$P539()
    unless $P10, rx525_fail
    rx525_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("1")
    rx525_pos = $P10."pos"()
    (rx525_rep) = rx525_cur."!mark_commit"($I542)
  rxquantr537_done:
  alt527_end:
.annotate 'line', 166
  # rx pass
    rx525_cur."!cursor_pass"(rx525_pos, "")
    rx525_cur."!cursor_debug"("PASS  ", "", " at pos=", rx525_pos)
    .return (rx525_cur)
  rx525_fail:
    (rx525_rep, rx525_pos, $I10, $P10) = rx525_cur."!mark_fail"(0)
    lt rx525_pos, -1, rx525_done
    eq rx525_pos, -1, rx525_fail
    jump $I10
  rx525_done:
    rx525_cur."!cursor_fail"()
    rx525_cur."!cursor_debug"("FAIL  ", "")
    .return (rx525_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block529"  :anon :subid("146_1278500530.77787") :method :outer("145_1278500530.77787")
.annotate 'line', 168
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
.sub "_block533"  :anon :subid("147_1278500530.77787") :method :outer("145_1278500530.77787")
.annotate 'line', 168
    .local string rx535_tgt
    .local int rx535_pos
    .local int rx535_off
    .local int rx535_eos
    .local int rx535_rep
    .local pmc rx535_cur
    (rx535_cur, rx535_pos, rx535_tgt) = self."!cursor_start"()
    rx535_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx535_cur
    .local pmc match
    .lex "$/", match
    length rx535_eos, rx535_tgt
    gt rx535_pos, rx535_eos, rx535_done
    set rx535_off, 0
    lt rx535_pos, 2, rx535_start
    sub rx535_off, rx535_pos, 1
    substr rx535_tgt, rx535_tgt, rx535_off
  rx535_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan536_done
    goto rxscan536_scan
  rxscan536_loop:
    ($P10) = rx535_cur."from"()
    inc $P10
    set rx535_pos, $P10
    ge rx535_pos, rx535_eos, rxscan536_done
  rxscan536_scan:
    set_addr $I10, rxscan536_loop
    rx535_cur."!mark_push"(0, rx535_pos, $I10)
  rxscan536_done:
  # rx enumcharlist negate=1 
    ge rx535_pos, rx535_eos, rx535_fail
    sub $I10, rx535_pos, rx535_off
    substr $S10, rx535_tgt, $I10, 1
    index $I11, "]\\", $S10
    ge $I11, 0, rx535_fail
    inc rx535_pos
  # rx pass
    rx535_cur."!cursor_pass"(rx535_pos, "")
    rx535_cur."!cursor_debug"("PASS  ", "", " at pos=", rx535_pos)
    .return (rx535_cur)
  rx535_fail:
    (rx535_rep, rx535_pos, $I10, $P10) = rx535_cur."!mark_fail"(0)
    lt rx535_pos, -1, rx535_done
    eq rx535_pos, -1, rx535_fail
    jump $I10
  rx535_done:
    rx535_cur."!cursor_fail"()
    rx535_cur."!cursor_debug"("FAIL  ", "")
    .return (rx535_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block538"  :anon :subid("148_1278500530.77787") :method :outer("145_1278500530.77787")
.annotate 'line', 168
    .local string rx540_tgt
    .local int rx540_pos
    .local int rx540_off
    .local int rx540_eos
    .local int rx540_rep
    .local pmc rx540_cur
    (rx540_cur, rx540_pos, rx540_tgt) = self."!cursor_start"()
    rx540_cur."!cursor_debug"("START ", "")
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
    ne $I10, -1, rxscan541_done
    goto rxscan541_scan
  rxscan541_loop:
    ($P10) = rx540_cur."from"()
    inc $P10
    set rx540_pos, $P10
    ge rx540_pos, rx540_eos, rxscan541_done
  rxscan541_scan:
    set_addr $I10, rxscan541_loop
    rx540_cur."!mark_push"(0, rx540_pos, $I10)
  rxscan541_done:
  # rx charclass .
    ge rx540_pos, rx540_eos, rx540_fail
    inc rx540_pos
  # rx pass
    rx540_cur."!cursor_pass"(rx540_pos, "")
    rx540_cur."!cursor_debug"("PASS  ", "", " at pos=", rx540_pos)
    .return (rx540_cur)
  rx540_fail:
    (rx540_rep, rx540_pos, $I10, $P10) = rx540_cur."!mark_fail"(0)
    lt rx540_pos, -1, rx540_done
    eq rx540_pos, -1, rx540_fail
    jump $I10
  rx540_done:
    rx540_cur."!cursor_fail"()
    rx540_cur."!cursor_debug"("FAIL  ", "")
    .return (rx540_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_internal"  :subid("149_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .const 'Sub' $P556 = "151_1278500530.77787" 
    capture_lex $P556
    .local string rx548_tgt
    .local int rx548_pos
    .local int rx548_off
    .local int rx548_eos
    .local int rx548_rep
    .local pmc rx548_cur
    (rx548_cur, rx548_pos, rx548_tgt) = self."!cursor_start"()
    rx548_cur."!cursor_debug"("START ", "mod_internal")
    rx548_cur."!cursor_caparray"("n")
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
    ne $I10, -1, rxscan552_done
    goto rxscan552_scan
  rxscan552_loop:
    ($P10) = rx548_cur."from"()
    inc $P10
    set rx548_pos, $P10
    ge rx548_pos, rx548_eos, rxscan552_done
  rxscan552_scan:
    set_addr $I10, rxscan552_loop
    rx548_cur."!mark_push"(0, rx548_pos, $I10)
  rxscan552_done:
  alt553_0:
.annotate 'line', 177
    set_addr $I10, alt553_1
    rx548_cur."!mark_push"(0, rx548_pos, $I10)
.annotate 'line', 178
  # rx literal  ":"
    add $I11, rx548_pos, 1
    gt $I11, rx548_eos, rx548_fail
    sub $I11, rx548_pos, rx548_off
    substr $S10, rx548_tgt, $I11, 1
    ne $S10, ":", rx548_fail
    add rx548_pos, 1
  # rx rxquantr554 ** 1..1
    set_addr $I560, rxquantr554_done
    rx548_cur."!mark_push"(0, -1, $I560)
  rxquantr554_loop:
  # rx subrule $P556 subtype=capture negate=
    rx548_cur."!cursor_pos"(rx548_pos)
    .const 'Sub' $P556 = "151_1278500530.77787" 
    capture_lex $P556
    $P10 = rx548_cur.$P556()
    unless $P10, rx548_fail
    rx548_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("n")
    rx548_pos = $P10."pos"()
    (rx548_rep) = rx548_cur."!mark_commit"($I560)
  rxquantr554_done:
  # rx subrule "mod_ident" subtype=capture negate=
    rx548_cur."!cursor_pos"(rx548_pos)
    $P10 = rx548_cur."mod_ident"()
    unless $P10, rx548_fail
    rx548_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_ident")
    rx548_pos = $P10."pos"()
  # rxanchor rwb
    le rx548_pos, 0, rx548_fail
    sub $I10, rx548_pos, rx548_off
    is_cclass $I11, 8192, rx548_tgt, $I10
    if $I11, rx548_fail
    dec $I10
    is_cclass $I11, 8192, rx548_tgt, $I10
    unless $I11, rx548_fail
    goto alt553_end
  alt553_1:
.annotate 'line', 179
  # rx literal  ":"
    add $I11, rx548_pos, 1
    gt $I11, rx548_eos, rx548_fail
    sub $I11, rx548_pos, rx548_off
    substr $S10, rx548_tgt, $I11, 1
    ne $S10, ":", rx548_fail
    add rx548_pos, 1
  # rx subrule "mod_ident" subtype=capture negate=
    rx548_cur."!cursor_pos"(rx548_pos)
    $P10 = rx548_cur."mod_ident"()
    unless $P10, rx548_fail
    rx548_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_ident")
    rx548_pos = $P10."pos"()
  # rx rxquantr561 ** 0..1
    set_addr $I563, rxquantr561_done
    rx548_cur."!mark_push"(0, rx548_pos, $I563)
  rxquantr561_loop:
  # rx literal  "("
    add $I11, rx548_pos, 1
    gt $I11, rx548_eos, rx548_fail
    sub $I11, rx548_pos, rx548_off
    substr $S10, rx548_tgt, $I11, 1
    ne $S10, "(", rx548_fail
    add rx548_pos, 1
  # rx subcapture "n"
    set_addr $I10, rxcap_562_fail
    rx548_cur."!mark_push"(0, rx548_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx548_pos, rx548_off
    find_not_cclass $I11, 8, rx548_tgt, $I10, rx548_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx548_fail
    add rx548_pos, rx548_off, $I11
    set_addr $I10, rxcap_562_fail
    ($I12, $I11) = rx548_cur."!mark_peek"($I10)
    rx548_cur."!cursor_pos"($I11)
    ($P10) = rx548_cur."!cursor_start"()
    $P10."!cursor_pass"(rx548_pos, "")
    rx548_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("n")
    goto rxcap_562_done
  rxcap_562_fail:
    goto rx548_fail
  rxcap_562_done:
  # rx literal  ")"
    add $I11, rx548_pos, 1
    gt $I11, rx548_eos, rx548_fail
    sub $I11, rx548_pos, rx548_off
    substr $S10, rx548_tgt, $I11, 1
    ne $S10, ")", rx548_fail
    add rx548_pos, 1
    (rx548_rep) = rx548_cur."!mark_commit"($I563)
  rxquantr561_done:
  alt553_end:
.annotate 'line', 176
  # rx pass
    rx548_cur."!cursor_pass"(rx548_pos, "mod_internal")
    rx548_cur."!cursor_debug"("PASS  ", "mod_internal", " at pos=", rx548_pos)
    .return (rx548_cur)
  rx548_fail:
.annotate 'line', 3
    (rx548_rep, rx548_pos, $I10, $P10) = rx548_cur."!mark_fail"(0)
    lt rx548_pos, -1, rx548_done
    eq rx548_pos, -1, rx548_fail
    jump $I10
  rx548_done:
    rx548_cur."!cursor_fail"()
    rx548_cur."!cursor_debug"("FAIL  ", "mod_internal")
    .return (rx548_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_internal"  :subid("150_1278500530.77787") :method
.annotate 'line', 3
    $P550 = self."!PREFIX__!subrule"("mod_ident", ":")
    new $P551, "ResizablePMCArray"
    push $P551, $P550
    push $P551, ":"
    .return ($P551)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block555"  :anon :subid("151_1278500530.77787") :method :outer("149_1278500530.77787")
.annotate 'line', 178
    .local string rx557_tgt
    .local int rx557_pos
    .local int rx557_off
    .local int rx557_eos
    .local int rx557_rep
    .local pmc rx557_cur
    (rx557_cur, rx557_pos, rx557_tgt) = self."!cursor_start"()
    rx557_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx557_cur
    .local pmc match
    .lex "$/", match
    length rx557_eos, rx557_tgt
    gt rx557_pos, rx557_eos, rx557_done
    set rx557_off, 0
    lt rx557_pos, 2, rx557_start
    sub rx557_off, rx557_pos, 1
    substr rx557_tgt, rx557_tgt, rx557_off
  rx557_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan558_done
    goto rxscan558_scan
  rxscan558_loop:
    ($P10) = rx557_cur."from"()
    inc $P10
    set rx557_pos, $P10
    ge rx557_pos, rx557_eos, rxscan558_done
  rxscan558_scan:
    set_addr $I10, rxscan558_loop
    rx557_cur."!mark_push"(0, rx557_pos, $I10)
  rxscan558_done:
  alt559_0:
    set_addr $I10, alt559_1
    rx557_cur."!mark_push"(0, rx557_pos, $I10)
  # rx literal  "!"
    add $I11, rx557_pos, 1
    gt $I11, rx557_eos, rx557_fail
    sub $I11, rx557_pos, rx557_off
    substr $S10, rx557_tgt, $I11, 1
    ne $S10, "!", rx557_fail
    add rx557_pos, 1
    goto alt559_end
  alt559_1:
  # rx charclass_q d r 1..-1
    sub $I10, rx557_pos, rx557_off
    find_not_cclass $I11, 8, rx557_tgt, $I10, rx557_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx557_fail
    add rx557_pos, rx557_off, $I11
  alt559_end:
  # rx pass
    rx557_cur."!cursor_pass"(rx557_pos, "")
    rx557_cur."!cursor_debug"("PASS  ", "", " at pos=", rx557_pos)
    .return (rx557_cur)
  rx557_fail:
    (rx557_rep, rx557_pos, $I10, $P10) = rx557_cur."!mark_fail"(0)
    lt rx557_pos, -1, rx557_done
    eq rx557_pos, -1, rx557_fail
    jump $I10
  rx557_done:
    rx557_cur."!cursor_fail"()
    rx557_cur."!cursor_debug"("FAIL  ", "")
    .return (rx557_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident"  :subid("152_1278500530.77787") :method
.annotate 'line', 183
    $P565 = self."!protoregex"("mod_ident")
    .return ($P565)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident"  :subid("153_1278500530.77787") :method
.annotate 'line', 183
    $P567 = self."!PREFIX__!protoregex"("mod_ident")
    .return ($P567)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ignorecase>"  :subid("154_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx569_tgt
    .local int rx569_pos
    .local int rx569_off
    .local int rx569_eos
    .local int rx569_rep
    .local pmc rx569_cur
    (rx569_cur, rx569_pos, rx569_tgt) = self."!cursor_start"()
    rx569_cur."!cursor_debug"("START ", "mod_ident:sym<ignorecase>")
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
.annotate 'line', 184
  # rx subcapture "sym"
    set_addr $I10, rxcap_573_fail
    rx569_cur."!mark_push"(0, rx569_pos, $I10)
  # rx literal  "i"
    add $I11, rx569_pos, 1
    gt $I11, rx569_eos, rx569_fail
    sub $I11, rx569_pos, rx569_off
    substr $S10, rx569_tgt, $I11, 1
    ne $S10, "i", rx569_fail
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
  # rx literal  "gnorecase"
    add $I11, rx569_pos, 9
    gt $I11, rx569_eos, rx569_fail
    sub $I11, rx569_pos, rx569_off
    substr $S10, rx569_tgt, $I11, 9
    ne $S10, "gnorecase", rx569_fail
    add rx569_pos, 9
    (rx569_rep) = rx569_cur."!mark_commit"($I575)
  rxquantr574_done:
  # rx pass
    rx569_cur."!cursor_pass"(rx569_pos, "mod_ident:sym<ignorecase>")
    rx569_cur."!cursor_debug"("PASS  ", "mod_ident:sym<ignorecase>", " at pos=", rx569_pos)
    .return (rx569_cur)
  rx569_fail:
.annotate 'line', 3
    (rx569_rep, rx569_pos, $I10, $P10) = rx569_cur."!mark_fail"(0)
    lt rx569_pos, -1, rx569_done
    eq rx569_pos, -1, rx569_fail
    jump $I10
  rx569_done:
    rx569_cur."!cursor_fail"()
    rx569_cur."!cursor_debug"("FAIL  ", "mod_ident:sym<ignorecase>")
    .return (rx569_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident:sym<ignorecase>"  :subid("155_1278500530.77787") :method
.annotate 'line', 3
    new $P571, "ResizablePMCArray"
    push $P571, "i"
    .return ($P571)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ratchet>"  :subid("156_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx577_tgt
    .local int rx577_pos
    .local int rx577_off
    .local int rx577_eos
    .local int rx577_rep
    .local pmc rx577_cur
    (rx577_cur, rx577_pos, rx577_tgt) = self."!cursor_start"()
    rx577_cur."!cursor_debug"("START ", "mod_ident:sym<ratchet>")
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
.annotate 'line', 185
  # rx subcapture "sym"
    set_addr $I10, rxcap_581_fail
    rx577_cur."!mark_push"(0, rx577_pos, $I10)
  # rx literal  "r"
    add $I11, rx577_pos, 1
    gt $I11, rx577_eos, rx577_fail
    sub $I11, rx577_pos, rx577_off
    substr $S10, rx577_tgt, $I11, 1
    ne $S10, "r", rx577_fail
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
  # rx literal  "atchet"
    add $I11, rx577_pos, 6
    gt $I11, rx577_eos, rx577_fail
    sub $I11, rx577_pos, rx577_off
    substr $S10, rx577_tgt, $I11, 6
    ne $S10, "atchet", rx577_fail
    add rx577_pos, 6
    (rx577_rep) = rx577_cur."!mark_commit"($I583)
  rxquantr582_done:
  # rx pass
    rx577_cur."!cursor_pass"(rx577_pos, "mod_ident:sym<ratchet>")
    rx577_cur."!cursor_debug"("PASS  ", "mod_ident:sym<ratchet>", " at pos=", rx577_pos)
    .return (rx577_cur)
  rx577_fail:
.annotate 'line', 3
    (rx577_rep, rx577_pos, $I10, $P10) = rx577_cur."!mark_fail"(0)
    lt rx577_pos, -1, rx577_done
    eq rx577_pos, -1, rx577_fail
    jump $I10
  rx577_done:
    rx577_cur."!cursor_fail"()
    rx577_cur."!cursor_debug"("FAIL  ", "mod_ident:sym<ratchet>")
    .return (rx577_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident:sym<ratchet>"  :subid("157_1278500530.77787") :method
.annotate 'line', 3
    new $P579, "ResizablePMCArray"
    push $P579, "r"
    .return ($P579)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<sigspace>"  :subid("158_1278500530.77787") :method :outer("11_1278500530.77787")
.annotate 'line', 3
    .local string rx585_tgt
    .local int rx585_pos
    .local int rx585_off
    .local int rx585_eos
    .local int rx585_rep
    .local pmc rx585_cur
    (rx585_cur, rx585_pos, rx585_tgt) = self."!cursor_start"()
    rx585_cur."!cursor_debug"("START ", "mod_ident:sym<sigspace>")
    .lex unicode:"$\x{a2}", rx585_cur
    .local pmc match
    .lex "$/", match
    length rx585_eos, rx585_tgt
    gt rx585_pos, rx585_eos, rx585_done
    set rx585_off, 0
    lt rx585_pos, 2, rx585_start
    sub rx585_off, rx585_pos, 1
    substr rx585_tgt, rx585_tgt, rx585_off
  rx585_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan588_done
    goto rxscan588_scan
  rxscan588_loop:
    ($P10) = rx585_cur."from"()
    inc $P10
    set rx585_pos, $P10
    ge rx585_pos, rx585_eos, rxscan588_done
  rxscan588_scan:
    set_addr $I10, rxscan588_loop
    rx585_cur."!mark_push"(0, rx585_pos, $I10)
  rxscan588_done:
.annotate 'line', 186
  # rx subcapture "sym"
    set_addr $I10, rxcap_589_fail
    rx585_cur."!mark_push"(0, rx585_pos, $I10)
  # rx literal  "s"
    add $I11, rx585_pos, 1
    gt $I11, rx585_eos, rx585_fail
    sub $I11, rx585_pos, rx585_off
    substr $S10, rx585_tgt, $I11, 1
    ne $S10, "s", rx585_fail
    add rx585_pos, 1
    set_addr $I10, rxcap_589_fail
    ($I12, $I11) = rx585_cur."!mark_peek"($I10)
    rx585_cur."!cursor_pos"($I11)
    ($P10) = rx585_cur."!cursor_start"()
    $P10."!cursor_pass"(rx585_pos, "")
    rx585_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_589_done
  rxcap_589_fail:
    goto rx585_fail
  rxcap_589_done:
  # rx rxquantr590 ** 0..1
    set_addr $I591, rxquantr590_done
    rx585_cur."!mark_push"(0, rx585_pos, $I591)
  rxquantr590_loop:
  # rx literal  "igspace"
    add $I11, rx585_pos, 7
    gt $I11, rx585_eos, rx585_fail
    sub $I11, rx585_pos, rx585_off
    substr $S10, rx585_tgt, $I11, 7
    ne $S10, "igspace", rx585_fail
    add rx585_pos, 7
    (rx585_rep) = rx585_cur."!mark_commit"($I591)
  rxquantr590_done:
  # rx pass
    rx585_cur."!cursor_pass"(rx585_pos, "mod_ident:sym<sigspace>")
    rx585_cur."!cursor_debug"("PASS  ", "mod_ident:sym<sigspace>", " at pos=", rx585_pos)
    .return (rx585_cur)
  rx585_fail:
.annotate 'line', 3
    (rx585_rep, rx585_pos, $I10, $P10) = rx585_cur."!mark_fail"(0)
    lt rx585_pos, -1, rx585_done
    eq rx585_pos, -1, rx585_fail
    jump $I10
  rx585_done:
    rx585_cur."!cursor_fail"()
    rx585_cur."!cursor_debug"("FAIL  ", "mod_ident:sym<sigspace>")
    .return (rx585_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident:sym<sigspace>"  :subid("159_1278500530.77787") :method
.annotate 'line', 3
    new $P587, "ResizablePMCArray"
    push $P587, "s"
    .return ($P587)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block592" :load :anon :subid("160_1278500530.77787")
.annotate 'line', 3
    .const 'Sub' $P594 = "11_1278500530.77787" 
    $P595 = $P594()
    .return ($P595)
.end


.namespace []
.sub "_block597" :load :anon :subid("161_1278500530.77787")
.annotate 'line', 1
    .const 'Sub' $P599 = "10_1278500530.77787" 
    $P600 = $P599()
    .return ($P600)
.end

### .include 'gen/p6regex-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1278500533.96053")
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
    $P1601 = $P14()
.annotate 'line', 1
    .return ($P1601)
    .const 'Sub' $P1603 = "91_1278500533.96053" 
    .return ($P1603)
.end


.namespace []
.sub "" :load :init :subid("post92") :outer("10_1278500533.96053")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1278500533.96053" 
    .local pmc block
    set block, $P12
    $P1606 = get_root_global ["parrot"], "P6metaclass"
    $P1606."new_class"("Regex::P6Regex::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block13"  :subid("11_1278500533.96053") :outer("10_1278500533.96053")
.annotate 'line', 4
    .const 'Sub' $P1575 = "89_1278500533.96053" 
    capture_lex $P1575
    .const 'Sub' $P1543 = "88_1278500533.96053" 
    capture_lex $P1543
    .const 'Sub' $P1474 = "84_1278500533.96053" 
    capture_lex $P1474
    .const 'Sub' $P1406 = "82_1278500533.96053" 
    capture_lex $P1406
    .const 'Sub' $P1332 = "79_1278500533.96053" 
    capture_lex $P1332
    .const 'Sub' $P1318 = "78_1278500533.96053" 
    capture_lex $P1318
    .const 'Sub' $P1294 = "77_1278500533.96053" 
    capture_lex $P1294
    .const 'Sub' $P1276 = "76_1278500533.96053" 
    capture_lex $P1276
    .const 'Sub' $P1262 = "75_1278500533.96053" 
    capture_lex $P1262
    .const 'Sub' $P1249 = "74_1278500533.96053" 
    capture_lex $P1249
    .const 'Sub' $P1218 = "73_1278500533.96053" 
    capture_lex $P1218
    .const 'Sub' $P1187 = "72_1278500533.96053" 
    capture_lex $P1187
    .const 'Sub' $P1171 = "71_1278500533.96053" 
    capture_lex $P1171
    .const 'Sub' $P1155 = "70_1278500533.96053" 
    capture_lex $P1155
    .const 'Sub' $P1139 = "69_1278500533.96053" 
    capture_lex $P1139
    .const 'Sub' $P1123 = "68_1278500533.96053" 
    capture_lex $P1123
    .const 'Sub' $P1107 = "67_1278500533.96053" 
    capture_lex $P1107
    .const 'Sub' $P1091 = "66_1278500533.96053" 
    capture_lex $P1091
    .const 'Sub' $P1075 = "65_1278500533.96053" 
    capture_lex $P1075
    .const 'Sub' $P1051 = "64_1278500533.96053" 
    capture_lex $P1051
    .const 'Sub' $P1036 = "63_1278500533.96053" 
    capture_lex $P1036
    .const 'Sub' $P978 = "62_1278500533.96053" 
    capture_lex $P978
    .const 'Sub' $P957 = "61_1278500533.96053" 
    capture_lex $P957
    .const 'Sub' $P935 = "60_1278500533.96053" 
    capture_lex $P935
    .const 'Sub' $P925 = "59_1278500533.96053" 
    capture_lex $P925
    .const 'Sub' $P915 = "58_1278500533.96053" 
    capture_lex $P915
    .const 'Sub' $P905 = "57_1278500533.96053" 
    capture_lex $P905
    .const 'Sub' $P893 = "56_1278500533.96053" 
    capture_lex $P893
    .const 'Sub' $P881 = "55_1278500533.96053" 
    capture_lex $P881
    .const 'Sub' $P869 = "54_1278500533.96053" 
    capture_lex $P869
    .const 'Sub' $P857 = "53_1278500533.96053" 
    capture_lex $P857
    .const 'Sub' $P845 = "52_1278500533.96053" 
    capture_lex $P845
    .const 'Sub' $P833 = "51_1278500533.96053" 
    capture_lex $P833
    .const 'Sub' $P821 = "50_1278500533.96053" 
    capture_lex $P821
    .const 'Sub' $P809 = "49_1278500533.96053" 
    capture_lex $P809
    .const 'Sub' $P786 = "48_1278500533.96053" 
    capture_lex $P786
    .const 'Sub' $P763 = "47_1278500533.96053" 
    capture_lex $P763
    .const 'Sub' $P745 = "46_1278500533.96053" 
    capture_lex $P745
    .const 'Sub' $P735 = "45_1278500533.96053" 
    capture_lex $P735
    .const 'Sub' $P717 = "44_1278500533.96053" 
    capture_lex $P717
    .const 'Sub' $P644 = "42_1278500533.96053" 
    capture_lex $P644
    .const 'Sub' $P627 = "41_1278500533.96053" 
    capture_lex $P627
    .const 'Sub' $P612 = "40_1278500533.96053" 
    capture_lex $P612
    .const 'Sub' $P597 = "39_1278500533.96053" 
    capture_lex $P597
    .const 'Sub' $P571 = "38_1278500533.96053" 
    capture_lex $P571
    .const 'Sub' $P520 = "36_1278500533.96053" 
    capture_lex $P520
    .const 'Sub' $P452 = "34_1278500533.96053" 
    capture_lex $P452
    .const 'Sub' $P397 = "31_1278500533.96053" 
    capture_lex $P397
    .const 'Sub' $P382 = "30_1278500533.96053" 
    capture_lex $P382
    .const 'Sub' $P356 = "28_1278500533.96053" 
    capture_lex $P356
    .const 'Sub' $P339 = "27_1278500533.96053" 
    capture_lex $P339
    .const 'Sub' $P305 = "26_1278500533.96053" 
    capture_lex $P305
    .const 'Sub' $P50 = "13_1278500533.96053" 
    capture_lex $P50
    .const 'Sub' $P16 = "12_1278500533.96053" 
    capture_lex $P16
    get_global $P15, "@MODIFIERS"
    unless_null $P15, vivify_94
    $P15 = root_new ['parrot';'ResizablePMCArray']
    set_global "@MODIFIERS", $P15
  vivify_94:
.annotate 'line', 494
    .const 'Sub' $P16 = "12_1278500533.96053" 
    newclosure $P49, $P16
    .lex "buildsub", $P49
.annotate 'line', 511
    .const 'Sub' $P50 = "13_1278500533.96053" 
    newclosure $P304, $P50
    .lex "capnames", $P304
.annotate 'line', 577
    .const 'Sub' $P305 = "26_1278500533.96053" 
    newclosure $P337, $P305
    .lex "backmod", $P337
.annotate 'line', 4
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    get_global $P338, "@MODIFIERS"
.annotate 'line', 487
    find_lex $P1572, "buildsub"
    find_lex $P1573, "capnames"
    find_lex $P1574, "backmod"
.annotate 'line', 584
    .const 'Sub' $P1575 = "89_1278500533.96053" 
    newclosure $P1595, $P1575
.annotate 'line', 4
    .return ($P1595)
    .const 'Sub' $P1597 = "90_1278500533.96053" 
    .return ($P1597)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "" :load :init :subid("post93") :outer("11_1278500533.96053")
.annotate 'line', 4
    get_hll_global $P14, ["Regex";"P6Regex";"Actions"], "_block13" 
    .local pmc block
    set block, $P14
.annotate 'line', 7

        $P1600 = new ['ResizablePMCArray']
        $P0 = new ['Hash']
        push $P1600, $P0
    
    set_global "@MODIFIERS", $P1600
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "buildsub"  :subid("12_1278500533.96053") :outer("11_1278500533.96053")
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
.sub "capnames"  :subid("13_1278500533.96053") :outer("11_1278500533.96053")
    .param pmc param_53
    .param pmc param_54
.annotate 'line', 511
    .const 'Sub' $P279 = "24_1278500533.96053" 
    capture_lex $P279
    .const 'Sub' $P216 = "21_1278500533.96053" 
    capture_lex $P216
    .const 'Sub' $P174 = "19_1278500533.96053" 
    capture_lex $P174
    .const 'Sub' $P132 = "17_1278500533.96053" 
    capture_lex $P132
    .const 'Sub' $P65 = "14_1278500533.96053" 
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
    .const 'Sub' $P279 = "24_1278500533.96053" 
    capture_lex $P279
    $P279()
  if_274_end:
    goto if_211_end
  if_211:
.annotate 'line', 549
    .const 'Sub' $P216 = "21_1278500533.96053" 
    capture_lex $P216
    $P216()
  if_211_end:
    goto if_164_end
  if_164:
.annotate 'line', 536
    .const 'Sub' $P174 = "19_1278500533.96053" 
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
    .const 'Sub' $P132 = "17_1278500533.96053" 
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
    .const 'Sub' $P65 = "14_1278500533.96053" 
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
.sub "_block278"  :anon :subid("24_1278500533.96053") :outer("13_1278500533.96053")
.annotate 'line', 566
    .const 'Sub' $P290 = "25_1278500533.96053" 
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
    .const 'Sub' $P290 = "25_1278500533.96053" 
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
.sub "_block289"  :anon :subid("25_1278500533.96053") :outer("24_1278500533.96053")
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
.sub "_block215"  :anon :subid("21_1278500533.96053") :outer("13_1278500533.96053")
.annotate 'line', 549
    .const 'Sub' $P256 = "23_1278500533.96053" 
    capture_lex $P256
    .const 'Sub' $P228 = "22_1278500533.96053" 
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
    .const 'Sub' $P228 = "22_1278500533.96053" 
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
    .const 'Sub' $P256 = "23_1278500533.96053" 
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
.sub "_block227"  :anon :subid("22_1278500533.96053") :outer("21_1278500533.96053")
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
.sub "_block255"  :anon :subid("23_1278500533.96053") :outer("21_1278500533.96053")
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
.sub "_block173"  :anon :subid("19_1278500533.96053") :outer("13_1278500533.96053")
.annotate 'line', 536
    .const 'Sub' $P192 = "20_1278500533.96053" 
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
    .const 'Sub' $P192 = "20_1278500533.96053" 
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
.sub "_block191"  :anon :subid("20_1278500533.96053") :outer("19_1278500533.96053")
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
.sub "_block131"  :anon :subid("17_1278500533.96053") :outer("13_1278500533.96053")
    .param pmc param_134
.annotate 'line', 528
    .const 'Sub' $P143 = "18_1278500533.96053" 
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
    .const 'Sub' $P143 = "18_1278500533.96053" 
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
.sub "_block142"  :anon :subid("18_1278500533.96053") :outer("17_1278500533.96053")
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
.sub "_block64"  :anon :subid("14_1278500533.96053") :outer("13_1278500533.96053")
.annotate 'line', 514
    .const 'Sub' $P74 = "15_1278500533.96053" 
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
    .const 'Sub' $P74 = "15_1278500533.96053" 
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
.sub "_block73"  :anon :subid("15_1278500533.96053") :outer("14_1278500533.96053")
    .param pmc param_76
.annotate 'line', 516
    .const 'Sub' $P85 = "16_1278500533.96053" 
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
    .const 'Sub' $P85 = "16_1278500533.96053" 
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
.sub "_block84"  :anon :subid("16_1278500533.96053") :outer("15_1278500533.96053")
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
.sub "backmod"  :subid("26_1278500533.96053") :outer("11_1278500533.96053")
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
.sub "arg"  :subid("27_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_342
.annotate 'line', 14
    new $P341, 'ExceptionHandler'
    set_addr $P341, control_340
    $P341."handle_types"(.CONTROL_RETURN)
    push_eh $P341
    .lex "self", self
    .lex "$/", param_342
.annotate 'line', 15
    find_lex $P343, "$/"
    find_lex $P346, "$/"
    unless_null $P346, vivify_138
    $P346 = root_new ['parrot';'Hash']
  vivify_138:
    set $P347, $P346["quote_EXPR"]
    unless_null $P347, vivify_139
    new $P347, "Undef"
  vivify_139:
    if $P347, if_345
    find_lex $P351, "$/"
    unless_null $P351, vivify_140
    $P351 = root_new ['parrot';'Hash']
  vivify_140:
    set $P352, $P351["val"]
    unless_null $P352, vivify_141
    new $P352, "Undef"
  vivify_141:
    set $N353, $P352
    new $P344, 'Float'
    set $P344, $N353
    goto if_345_end
  if_345:
    find_lex $P348, "$/"
    unless_null $P348, vivify_142
    $P348 = root_new ['parrot';'Hash']
  vivify_142:
    set $P349, $P348["quote_EXPR"]
    unless_null $P349, vivify_143
    new $P349, "Undef"
  vivify_143:
    $P350 = $P349."ast"()
    set $P344, $P350
  if_345_end:
    $P354 = $P343."!make"($P344)
.annotate 'line', 14
    .return ($P354)
  control_340:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P355, exception, "payload"
    .return ($P355)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "arglist"  :subid("28_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_359
.annotate 'line', 18
    .const 'Sub' $P369 = "29_1278500533.96053" 
    capture_lex $P369
    new $P358, 'ExceptionHandler'
    set_addr $P358, control_357
    $P358."handle_types"(.CONTROL_RETURN)
    push_eh $P358
    .lex "self", self
    .lex "$/", param_359
.annotate 'line', 19
    new $P360, "Undef"
    .lex "$past", $P360
    get_hll_global $P361, ["PAST"], "Op"
    $P362 = $P361."new"("list" :named("pasttype"))
    store_lex "$past", $P362
.annotate 'line', 20
    find_lex $P364, "$/"
    unless_null $P364, vivify_144
    $P364 = root_new ['parrot';'Hash']
  vivify_144:
    set $P365, $P364["arg"]
    unless_null $P365, vivify_145
    new $P365, "Undef"
  vivify_145:
    defined $I366, $P365
    unless $I366, for_undef_146
    iter $P363, $P365
    new $P376, 'ExceptionHandler'
    set_addr $P376, loop375_handler
    $P376."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P376
  loop375_test:
    unless $P363, loop375_done
    shift $P367, $P363
  loop375_redo:
    .const 'Sub' $P369 = "29_1278500533.96053" 
    capture_lex $P369
    $P369($P367)
  loop375_next:
    goto loop375_test
  loop375_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P377, exception, 'type'
    eq $P377, .CONTROL_LOOP_NEXT, loop375_next
    eq $P377, .CONTROL_LOOP_REDO, loop375_redo
  loop375_done:
    pop_eh 
  for_undef_146:
.annotate 'line', 21
    find_lex $P378, "$/"
    find_lex $P379, "$past"
    $P380 = $P378."!make"($P379)
.annotate 'line', 18
    .return ($P380)
  control_357:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P381, exception, "payload"
    .return ($P381)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block368"  :anon :subid("29_1278500533.96053") :outer("28_1278500533.96053")
    .param pmc param_370
.annotate 'line', 20
    .lex "$_", param_370
    find_lex $P371, "$past"
    find_lex $P372, "$_"
    $P373 = $P372."ast"()
    $P374 = $P371."push"($P373)
    .return ($P374)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "TOP"  :subid("30_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_385
.annotate 'line', 24
    new $P384, 'ExceptionHandler'
    set_addr $P384, control_383
    $P384."handle_types"(.CONTROL_RETURN)
    push_eh $P384
    .lex "self", self
    .lex "$/", param_385
.annotate 'line', 25
    new $P386, "Undef"
    .lex "$past", $P386
    find_lex $P387, "$/"
    unless_null $P387, vivify_147
    $P387 = root_new ['parrot';'Hash']
  vivify_147:
    set $P388, $P387["nibbler"]
    unless_null $P388, vivify_148
    new $P388, "Undef"
  vivify_148:
    $P389 = $P388."ast"()
    $P390 = "buildsub"($P389)
    store_lex "$past", $P390
.annotate 'line', 26
    find_lex $P391, "$past"
    find_lex $P392, "$/"
    $P391."node"($P392)
.annotate 'line', 27
    find_lex $P393, "$/"
    find_lex $P394, "$past"
    $P395 = $P393."!make"($P394)
.annotate 'line', 24
    .return ($P395)
  control_383:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P396, exception, "payload"
    .return ($P396)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "nibbler"  :subid("31_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_400
    .param pmc param_401 :optional
    .param int has_param_401 :opt_flag
.annotate 'line', 30
    .const 'Sub' $P435 = "33_1278500533.96053" 
    capture_lex $P435
    .const 'Sub' $P409 = "32_1278500533.96053" 
    capture_lex $P409
    new $P399, 'ExceptionHandler'
    set_addr $P399, control_398
    $P399."handle_types"(.CONTROL_RETURN)
    push_eh $P399
    .lex "self", self
    .lex "$/", param_400
    if has_param_401, optparam_149
    new $P402, "Undef"
    set param_401, $P402
  optparam_149:
    .lex "$key", param_401
.annotate 'line', 42
    new $P403, "Undef"
    .lex "$past", $P403
.annotate 'line', 31
    find_lex $P405, "$key"
    set $S406, $P405
    iseq $I407, $S406, "open"
    unless $I407, if_404_end
    .const 'Sub' $P409 = "32_1278500533.96053" 
    capture_lex $P409
    $P409()
  if_404_end:
.annotate 'line', 41
    get_global $P419, "@MODIFIERS"
    $P419."shift"()
    find_lex $P420, "$past"
.annotate 'line', 43
    find_lex $P422, "$/"
    unless_null $P422, vivify_152
    $P422 = root_new ['parrot';'Hash']
  vivify_152:
    set $P423, $P422["termish"]
    unless_null $P423, vivify_153
    new $P423, "Undef"
  vivify_153:
    set $N424, $P423
    isgt $I425, $N424, 1.0
    if $I425, if_421
.annotate 'line', 50
    find_lex $P444, "$/"
    unless_null $P444, vivify_154
    $P444 = root_new ['parrot';'Hash']
  vivify_154:
    set $P445, $P444["termish"]
    unless_null $P445, vivify_155
    $P445 = root_new ['parrot';'ResizablePMCArray']
  vivify_155:
    set $P446, $P445[0]
    unless_null $P446, vivify_156
    new $P446, "Undef"
  vivify_156:
    $P447 = $P446."ast"()
    store_lex "$past", $P447
.annotate 'line', 49
    goto if_421_end
  if_421:
.annotate 'line', 44
    get_hll_global $P426, ["PAST"], "Regex"
    find_lex $P427, "$/"
    $P428 = $P426."new"("alt" :named("pasttype"), $P427 :named("node"))
    store_lex "$past", $P428
.annotate 'line', 45
    find_lex $P430, "$/"
    unless_null $P430, vivify_157
    $P430 = root_new ['parrot';'Hash']
  vivify_157:
    set $P431, $P430["termish"]
    unless_null $P431, vivify_158
    new $P431, "Undef"
  vivify_158:
    defined $I432, $P431
    unless $I432, for_undef_159
    iter $P429, $P431
    new $P442, 'ExceptionHandler'
    set_addr $P442, loop441_handler
    $P442."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P442
  loop441_test:
    unless $P429, loop441_done
    shift $P433, $P429
  loop441_redo:
    .const 'Sub' $P435 = "33_1278500533.96053" 
    capture_lex $P435
    $P435($P433)
  loop441_next:
    goto loop441_test
  loop441_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P443, exception, 'type'
    eq $P443, .CONTROL_LOOP_NEXT, loop441_next
    eq $P443, .CONTROL_LOOP_REDO, loop441_redo
  loop441_done:
    pop_eh 
  for_undef_159:
  if_421_end:
.annotate 'line', 52
    find_lex $P448, "$/"
    find_lex $P449, "$past"
    $P450 = $P448."!make"($P449)
.annotate 'line', 30
    .return ($P450)
  control_398:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P451, exception, "payload"
    .return ($P451)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "_block408"  :anon :subid("32_1278500533.96053") :outer("31_1278500533.96053")
.annotate 'line', 32
    $P410 = root_new ['parrot';'Hash']
    .lex "%old", $P410
.annotate 'line', 33
    $P411 = root_new ['parrot';'Hash']
    .lex "%new", $P411
.annotate 'line', 32
    get_global $P412, "@MODIFIERS"
    unless_null $P412, vivify_150
    $P412 = root_new ['parrot';'ResizablePMCArray']
  vivify_150:
    set $P413, $P412[0]
    unless_null $P413, vivify_151
    new $P413, "Undef"
  vivify_151:
    store_lex "%old", $P413
.annotate 'line', 33

                       $P0 = find_lex '%old'
                       $P414 = clone $P0
                   
    store_lex "%new", $P414
.annotate 'line', 37
    get_global $P415, "@MODIFIERS"
    find_lex $P416, "%new"
    $P415."unshift"($P416)
.annotate 'line', 38
    new $P417, "Exception"
    set $P417['type'], .CONTROL_RETURN
    new $P418, "Integer"
    assign $P418, 1
    setattribute $P417, 'payload', $P418
    throw $P417
.annotate 'line', 31
    .return ()
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block434"  :anon :subid("33_1278500533.96053") :outer("31_1278500533.96053")
    .param pmc param_436
.annotate 'line', 45
    .lex "$_", param_436
.annotate 'line', 46
    find_lex $P437, "$past"
    find_lex $P438, "$_"
    $P439 = $P438."ast"()
    $P440 = $P437."push"($P439)
.annotate 'line', 45
    .return ($P440)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "termish"  :subid("34_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_455
.annotate 'line', 55
    .const 'Sub' $P468 = "35_1278500533.96053" 
    capture_lex $P468
    new $P454, 'ExceptionHandler'
    set_addr $P454, control_453
    $P454."handle_types"(.CONTROL_RETURN)
    push_eh $P454
    .lex "self", self
    .lex "$/", param_455
.annotate 'line', 56
    new $P456, "Undef"
    .lex "$past", $P456
.annotate 'line', 57
    new $P457, "Undef"
    .lex "$lastlit", $P457
.annotate 'line', 56
    get_hll_global $P458, ["PAST"], "Regex"
    find_lex $P459, "$/"
    $P460 = $P458."new"("concat" :named("pasttype"), $P459 :named("node"))
    store_lex "$past", $P460
.annotate 'line', 57
    new $P461, "Integer"
    assign $P461, 0
    store_lex "$lastlit", $P461
.annotate 'line', 58
    find_lex $P463, "$/"
    unless_null $P463, vivify_160
    $P463 = root_new ['parrot';'Hash']
  vivify_160:
    set $P464, $P463["noun"]
    unless_null $P464, vivify_161
    new $P464, "Undef"
  vivify_161:
    defined $I465, $P464
    unless $I465, for_undef_162
    iter $P462, $P464
    new $P514, 'ExceptionHandler'
    set_addr $P514, loop513_handler
    $P514."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P514
  loop513_test:
    unless $P462, loop513_done
    shift $P466, $P462
  loop513_redo:
    .const 'Sub' $P468 = "35_1278500533.96053" 
    capture_lex $P468
    $P468($P466)
  loop513_next:
    goto loop513_test
  loop513_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P515, exception, 'type'
    eq $P515, .CONTROL_LOOP_NEXT, loop513_next
    eq $P515, .CONTROL_LOOP_REDO, loop513_redo
  loop513_done:
    pop_eh 
  for_undef_162:
.annotate 'line', 73
    find_lex $P516, "$/"
    find_lex $P517, "$past"
    $P518 = $P516."!make"($P517)
.annotate 'line', 55
    .return ($P518)
  control_453:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P519, exception, "payload"
    .return ($P519)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block467"  :anon :subid("35_1278500533.96053") :outer("34_1278500533.96053")
    .param pmc param_470
.annotate 'line', 59
    new $P469, "Undef"
    .lex "$ast", $P469
    .lex "$_", param_470
    find_lex $P471, "$_"
    $P472 = $P471."ast"()
    store_lex "$ast", $P472
.annotate 'line', 60
    find_lex $P475, "$ast"
    if $P475, if_474
    set $P473, $P475
    goto if_474_end
  if_474:
.annotate 'line', 61
    find_lex $P482, "$lastlit"
    if $P482, if_481
    set $P480, $P482
    goto if_481_end
  if_481:
    find_lex $P483, "$ast"
    $S484 = $P483."pasttype"()
    iseq $I485, $S484, "literal"
    new $P480, 'Integer'
    set $P480, $I485
  if_481_end:
    if $P480, if_479
    set $P478, $P480
    goto if_479_end
  if_479:
.annotate 'line', 62
    get_hll_global $P486, ["PAST"], "Node"
    find_lex $P487, "$ast"
    unless_null $P487, vivify_163
    $P487 = root_new ['parrot';'ResizablePMCArray']
  vivify_163:
    set $P488, $P487[0]
    unless_null $P488, vivify_164
    new $P488, "Undef"
  vivify_164:
    $P489 = $P486."ACCEPTS"($P488)
    isfalse $I490, $P489
    new $P478, 'Integer'
    set $P478, $I490
  if_479_end:
    if $P478, if_477
.annotate 'line', 66
    find_lex $P497, "$past"
    find_lex $P498, "$ast"
    $P497."push"($P498)
.annotate 'line', 67
    find_lex $P503, "$ast"
    $S504 = $P503."pasttype"()
    iseq $I505, $S504, "literal"
    if $I505, if_502
    new $P501, 'Integer'
    set $P501, $I505
    goto if_502_end
  if_502:
.annotate 'line', 68
    get_hll_global $P506, ["PAST"], "Node"
    find_lex $P507, "$ast"
    unless_null $P507, vivify_165
    $P507 = root_new ['parrot';'ResizablePMCArray']
  vivify_165:
    set $P508, $P507[0]
    unless_null $P508, vivify_166
    new $P508, "Undef"
  vivify_166:
    $P509 = $P506."ACCEPTS"($P508)
    isfalse $I510, $P509
    new $P501, 'Integer'
    set $P501, $I510
  if_502_end:
    if $P501, if_500
    new $P512, "Integer"
    assign $P512, 0
    set $P499, $P512
    goto if_500_end
  if_500:
    find_lex $P511, "$ast"
    set $P499, $P511
  if_500_end:
.annotate 'line', 69
    store_lex "$lastlit", $P499
.annotate 'line', 65
    set $P476, $P499
.annotate 'line', 62
    goto if_477_end
  if_477:
.annotate 'line', 63
    find_lex $P491, "$lastlit"
    unless_null $P491, vivify_167
    $P491 = root_new ['parrot';'ResizablePMCArray']
  vivify_167:
    set $P492, $P491[0]
    unless_null $P492, vivify_168
    new $P492, "Undef"
  vivify_168:
    find_lex $P493, "$ast"
    unless_null $P493, vivify_169
    $P493 = root_new ['parrot';'ResizablePMCArray']
  vivify_169:
    set $P494, $P493[0]
    unless_null $P494, vivify_170
    new $P494, "Undef"
  vivify_170:
    concat $P495, $P492, $P494
    find_lex $P496, "$lastlit"
    unless_null $P496, vivify_171
    $P496 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$lastlit", $P496
  vivify_171:
    set $P496[0], $P495
.annotate 'line', 62
    set $P476, $P495
  if_477_end:
.annotate 'line', 60
    set $P473, $P476
  if_474_end:
.annotate 'line', 58
    .return ($P473)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "quantified_atom"  :subid("36_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_523
.annotate 'line', 76
    .const 'Sub' $P532 = "37_1278500533.96053" 
    capture_lex $P532
    new $P522, 'ExceptionHandler'
    set_addr $P522, control_521
    $P522."handle_types"(.CONTROL_RETURN)
    push_eh $P522
    .lex "self", self
    .lex "$/", param_523
.annotate 'line', 77
    new $P524, "Undef"
    .lex "$past", $P524
    find_lex $P525, "$/"
    unless_null $P525, vivify_172
    $P525 = root_new ['parrot';'Hash']
  vivify_172:
    set $P526, $P525["atom"]
    unless_null $P526, vivify_173
    new $P526, "Undef"
  vivify_173:
    $P527 = $P526."ast"()
    store_lex "$past", $P527
.annotate 'line', 78
    find_lex $P529, "$/"
    unless_null $P529, vivify_174
    $P529 = root_new ['parrot';'Hash']
  vivify_174:
    set $P530, $P529["quantifier"]
    unless_null $P530, vivify_175
    new $P530, "Undef"
  vivify_175:
    if $P530, if_528
.annotate 'line', 84
    find_lex $P547, "$/"
    unless_null $P547, vivify_176
    $P547 = root_new ['parrot';'Hash']
  vivify_176:
    set $P548, $P547["backmod"]
    unless_null $P548, vivify_177
    $P548 = root_new ['parrot';'ResizablePMCArray']
  vivify_177:
    set $P549, $P548[0]
    unless_null $P549, vivify_178
    new $P549, "Undef"
  vivify_178:
    unless $P549, if_546_end
    find_lex $P550, "$past"
    find_lex $P551, "$/"
    unless_null $P551, vivify_179
    $P551 = root_new ['parrot';'Hash']
  vivify_179:
    set $P552, $P551["backmod"]
    unless_null $P552, vivify_180
    $P552 = root_new ['parrot';'ResizablePMCArray']
  vivify_180:
    set $P553, $P552[0]
    unless_null $P553, vivify_181
    new $P553, "Undef"
  vivify_181:
    "backmod"($P550, $P553)
  if_546_end:
    goto if_528_end
  if_528:
.annotate 'line', 78
    .const 'Sub' $P532 = "37_1278500533.96053" 
    capture_lex $P532
    $P532()
  if_528_end:
.annotate 'line', 85
    find_lex $P559, "$past"
    if $P559, if_558
    set $P557, $P559
    goto if_558_end
  if_558:
    find_lex $P560, "$past"
    $P561 = $P560."backtrack"()
    isfalse $I562, $P561
    new $P557, 'Integer'
    set $P557, $I562
  if_558_end:
    if $P557, if_556
    set $P555, $P557
    goto if_556_end
  if_556:
    get_global $P563, "@MODIFIERS"
    unless_null $P563, vivify_185
    $P563 = root_new ['parrot';'ResizablePMCArray']
  vivify_185:
    set $P564, $P563[0]
    unless_null $P564, vivify_186
    $P564 = root_new ['parrot';'Hash']
  vivify_186:
    set $P565, $P564["r"]
    unless_null $P565, vivify_187
    new $P565, "Undef"
  vivify_187:
    set $P555, $P565
  if_556_end:
    unless $P555, if_554_end
.annotate 'line', 86
    find_lex $P566, "$past"
    $P566."backtrack"("r")
  if_554_end:
.annotate 'line', 88
    find_lex $P567, "$/"
    find_lex $P568, "$past"
    $P569 = $P567."!make"($P568)
.annotate 'line', 76
    .return ($P569)
  control_521:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P570, exception, "payload"
    .return ($P570)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block531"  :anon :subid("37_1278500533.96053") :outer("36_1278500533.96053")
.annotate 'line', 80
    new $P533, "Undef"
    .lex "$qast", $P533
.annotate 'line', 79
    find_lex $P535, "$past"
    isfalse $I536, $P535
    unless $I536, if_534_end
    find_lex $P537, "$/"
    $P538 = $P537."CURSOR"()
    $P538."panic"("Quantifier follows nothing")
  if_534_end:
.annotate 'line', 80
    find_lex $P539, "$/"
    unless_null $P539, vivify_182
    $P539 = root_new ['parrot';'Hash']
  vivify_182:
    set $P540, $P539["quantifier"]
    unless_null $P540, vivify_183
    $P540 = root_new ['parrot';'ResizablePMCArray']
  vivify_183:
    set $P541, $P540[0]
    unless_null $P541, vivify_184
    new $P541, "Undef"
  vivify_184:
    $P542 = $P541."ast"()
    store_lex "$qast", $P542
.annotate 'line', 81
    find_lex $P543, "$qast"
    find_lex $P544, "$past"
    $P543."unshift"($P544)
.annotate 'line', 82
    find_lex $P545, "$qast"
    store_lex "$past", $P545
.annotate 'line', 78
    .return ($P545)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "atom"  :subid("38_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_574
.annotate 'line', 91
    new $P573, 'ExceptionHandler'
    set_addr $P573, control_572
    $P573."handle_types"(.CONTROL_RETURN)
    push_eh $P573
    .lex "self", self
    .lex "$/", param_574
.annotate 'line', 92
    new $P575, "Undef"
    .lex "$past", $P575
.annotate 'line', 91
    find_lex $P576, "$past"
.annotate 'line', 93
    find_lex $P578, "$/"
    unless_null $P578, vivify_188
    $P578 = root_new ['parrot';'Hash']
  vivify_188:
    set $P579, $P578["metachar"]
    unless_null $P579, vivify_189
    new $P579, "Undef"
  vivify_189:
    if $P579, if_577
.annotate 'line', 95
    get_hll_global $P583, ["PAST"], "Regex"
    find_lex $P584, "$/"
    set $S585, $P584
    find_lex $P586, "$/"
    $P587 = $P583."new"($S585, "literal" :named("pasttype"), $P586 :named("node"))
    store_lex "$past", $P587
.annotate 'line', 96
    get_global $P589, "@MODIFIERS"
    unless_null $P589, vivify_190
    $P589 = root_new ['parrot';'ResizablePMCArray']
  vivify_190:
    set $P590, $P589[0]
    unless_null $P590, vivify_191
    $P590 = root_new ['parrot';'Hash']
  vivify_191:
    set $P591, $P590["i"]
    unless_null $P591, vivify_192
    new $P591, "Undef"
  vivify_192:
    unless $P591, if_588_end
    find_lex $P592, "$past"
    $P592."subtype"("ignorecase")
  if_588_end:
.annotate 'line', 94
    goto if_577_end
  if_577:
.annotate 'line', 93
    find_lex $P580, "$/"
    unless_null $P580, vivify_193
    $P580 = root_new ['parrot';'Hash']
  vivify_193:
    set $P581, $P580["metachar"]
    unless_null $P581, vivify_194
    new $P581, "Undef"
  vivify_194:
    $P582 = $P581."ast"()
    store_lex "$past", $P582
  if_577_end:
.annotate 'line', 98
    find_lex $P593, "$/"
    find_lex $P594, "$past"
    $P595 = $P593."!make"($P594)
.annotate 'line', 91
    .return ($P595)
  control_572:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P596, exception, "payload"
    .return ($P596)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "quantifier:sym<*>"  :subid("39_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_600
.annotate 'line', 101
    new $P599, 'ExceptionHandler'
    set_addr $P599, control_598
    $P599."handle_types"(.CONTROL_RETURN)
    push_eh $P599
    .lex "self", self
    .lex "$/", param_600
.annotate 'line', 102
    new $P601, "Undef"
    .lex "$past", $P601
    get_hll_global $P602, ["PAST"], "Regex"
    find_lex $P603, "$/"
    $P604 = $P602."new"("quant" :named("pasttype"), $P603 :named("node"))
    store_lex "$past", $P604
.annotate 'line', 103
    find_lex $P605, "$/"
    find_lex $P606, "$past"
    find_lex $P607, "$/"
    unless_null $P607, vivify_195
    $P607 = root_new ['parrot';'Hash']
  vivify_195:
    set $P608, $P607["backmod"]
    unless_null $P608, vivify_196
    new $P608, "Undef"
  vivify_196:
    $P609 = "backmod"($P606, $P608)
    $P610 = $P605."!make"($P609)
.annotate 'line', 101
    .return ($P610)
  control_598:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P611, exception, "payload"
    .return ($P611)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "quantifier:sym<+>"  :subid("40_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_615
.annotate 'line', 106
    new $P614, 'ExceptionHandler'
    set_addr $P614, control_613
    $P614."handle_types"(.CONTROL_RETURN)
    push_eh $P614
    .lex "self", self
    .lex "$/", param_615
.annotate 'line', 107
    new $P616, "Undef"
    .lex "$past", $P616
    get_hll_global $P617, ["PAST"], "Regex"
    find_lex $P618, "$/"
    $P619 = $P617."new"("quant" :named("pasttype"), 1 :named("min"), $P618 :named("node"))
    store_lex "$past", $P619
.annotate 'line', 108
    find_lex $P620, "$/"
    find_lex $P621, "$past"
    find_lex $P622, "$/"
    unless_null $P622, vivify_197
    $P622 = root_new ['parrot';'Hash']
  vivify_197:
    set $P623, $P622["backmod"]
    unless_null $P623, vivify_198
    new $P623, "Undef"
  vivify_198:
    $P624 = "backmod"($P621, $P623)
    $P625 = $P620."!make"($P624)
.annotate 'line', 106
    .return ($P625)
  control_613:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P626, exception, "payload"
    .return ($P626)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "quantifier:sym<?>"  :subid("41_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_630
.annotate 'line', 111
    new $P629, 'ExceptionHandler'
    set_addr $P629, control_628
    $P629."handle_types"(.CONTROL_RETURN)
    push_eh $P629
    .lex "self", self
    .lex "$/", param_630
.annotate 'line', 112
    new $P631, "Undef"
    .lex "$past", $P631
    get_hll_global $P632, ["PAST"], "Regex"
    find_lex $P633, "$/"
    $P634 = $P632."new"("quant" :named("pasttype"), 0 :named("min"), 1 :named("max"), $P633 :named("node"))
    store_lex "$past", $P634
.annotate 'line', 113
    find_lex $P635, "$/"
    find_lex $P636, "$past"
    find_lex $P637, "$/"
    unless_null $P637, vivify_199
    $P637 = root_new ['parrot';'Hash']
  vivify_199:
    set $P638, $P637["backmod"]
    unless_null $P638, vivify_200
    new $P638, "Undef"
  vivify_200:
    $P639 = "backmod"($P636, $P638)
    $P635."!make"($P639)
.annotate 'line', 114
    find_lex $P640, "$/"
    find_lex $P641, "$past"
    $P642 = $P640."!make"($P641)
.annotate 'line', 111
    .return ($P642)
  control_628:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P643, exception, "payload"
    .return ($P643)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "quantifier:sym<**>"  :subid("42_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_647
.annotate 'line', 117
    .const 'Sub' $P662 = "43_1278500533.96053" 
    capture_lex $P662
    new $P646, 'ExceptionHandler'
    set_addr $P646, control_645
    $P646."handle_types"(.CONTROL_RETURN)
    push_eh $P646
    .lex "self", self
    .lex "$/", param_647
.annotate 'line', 118
    new $P648, "Undef"
    .lex "$past", $P648
.annotate 'line', 119
    new $P649, "Undef"
    .lex "$ws", $P649
.annotate 'line', 117
    find_lex $P650, "$past"
.annotate 'line', 119
    find_lex $P653, "$/"
    unless_null $P653, vivify_201
    $P653 = root_new ['parrot';'Hash']
  vivify_201:
    set $P654, $P653["normspace"]
    unless_null $P654, vivify_202
    new $P654, "Undef"
  vivify_202:
    if $P654, if_652
    set $P651, $P654
    goto if_652_end
  if_652:
    get_global $P655, "@MODIFIERS"
    unless_null $P655, vivify_203
    $P655 = root_new ['parrot';'ResizablePMCArray']
  vivify_203:
    set $P656, $P655[0]
    unless_null $P656, vivify_204
    $P656 = root_new ['parrot';'Hash']
  vivify_204:
    set $P657, $P656["s"]
    unless_null $P657, vivify_205
    new $P657, "Undef"
  vivify_205:
    set $P651, $P657
  if_652_end:
    store_lex "$ws", $P651
.annotate 'line', 120
    find_lex $P659, "$/"
    unless_null $P659, vivify_206
    $P659 = root_new ['parrot';'Hash']
  vivify_206:
    set $P660, $P659["quantified_atom"]
    unless_null $P660, vivify_207
    new $P660, "Undef"
  vivify_207:
    if $P660, if_658
.annotate 'line', 136
    get_hll_global $P680, ["PAST"], "Regex"
    find_lex $P681, "$/"
    unless_null $P681, vivify_208
    $P681 = root_new ['parrot';'Hash']
  vivify_208:
    set $P682, $P681["min"]
    unless_null $P682, vivify_209
    new $P682, "Undef"
  vivify_209:
    set $N683, $P682
    find_lex $P684, "$/"
    $P685 = $P680."new"("quant" :named("pasttype"), $N683 :named("min"), $P684 :named("node"))
    store_lex "$past", $P685
.annotate 'line', 137
    find_lex $P687, "$/"
    unless_null $P687, vivify_210
    $P687 = root_new ['parrot';'Hash']
  vivify_210:
    set $P688, $P687["max"]
    unless_null $P688, vivify_211
    new $P688, "Undef"
  vivify_211:
    isfalse $I689, $P688
    if $I689, if_686
.annotate 'line', 138
    find_lex $P695, "$/"
    unless_null $P695, vivify_212
    $P695 = root_new ['parrot';'Hash']
  vivify_212:
    set $P696, $P695["max"]
    unless_null $P696, vivify_213
    $P696 = root_new ['parrot';'ResizablePMCArray']
  vivify_213:
    set $P697, $P696[0]
    unless_null $P697, vivify_214
    new $P697, "Undef"
  vivify_214:
    set $S698, $P697
    isne $I699, $S698, "*"
    unless $I699, if_694_end
    find_lex $P700, "$past"
    find_lex $P701, "$/"
    unless_null $P701, vivify_215
    $P701 = root_new ['parrot';'Hash']
  vivify_215:
    set $P702, $P701["max"]
    unless_null $P702, vivify_216
    $P702 = root_new ['parrot';'ResizablePMCArray']
  vivify_216:
    set $P703, $P702[0]
    unless_null $P703, vivify_217
    new $P703, "Undef"
  vivify_217:
    set $N704, $P703
    $P700."max"($N704)
  if_694_end:
    goto if_686_end
  if_686:
.annotate 'line', 137
    find_lex $P690, "$past"
    find_lex $P691, "$/"
    unless_null $P691, vivify_218
    $P691 = root_new ['parrot';'Hash']
  vivify_218:
    set $P692, $P691["min"]
    unless_null $P692, vivify_219
    new $P692, "Undef"
  vivify_219:
    set $N693, $P692
    $P690."max"($N693)
  if_686_end:
.annotate 'line', 139
    find_lex $P706, "$ws"
    unless $P706, if_705_end
    find_lex $P707, "$past"
    get_hll_global $P708, ["PAST"], "Regex"
    $P709 = $P708."new"("ws", "subrule" :named("pasttype"), "method" :named("subtype"))
    $P707."sep"($P709)
  if_705_end:
.annotate 'line', 135
    goto if_658_end
  if_658:
.annotate 'line', 120
    .const 'Sub' $P662 = "43_1278500533.96053" 
    capture_lex $P662
    $P662()
  if_658_end:
.annotate 'line', 143
    find_lex $P710, "$/"
    find_lex $P711, "$past"
    find_lex $P712, "$/"
    unless_null $P712, vivify_222
    $P712 = root_new ['parrot';'Hash']
  vivify_222:
    set $P713, $P712["backmod"]
    unless_null $P713, vivify_223
    new $P713, "Undef"
  vivify_223:
    $P714 = "backmod"($P711, $P713)
    $P715 = $P710."!make"($P714)
.annotate 'line', 117
    .return ($P715)
  control_645:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P716, exception, "payload"
    .return ($P716)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block661"  :anon :subid("43_1278500533.96053") :outer("42_1278500533.96053")
.annotate 'line', 121
    new $P663, "Undef"
    .lex "$ast", $P663
    find_lex $P664, "$/"
    unless_null $P664, vivify_220
    $P664 = root_new ['parrot';'Hash']
  vivify_220:
    set $P665, $P664["quantified_atom"]
    unless_null $P665, vivify_221
    new $P665, "Undef"
  vivify_221:
    $P666 = $P665."ast"()
    store_lex "$ast", $P666
.annotate 'line', 122
    find_lex $P668, "$ws"
    unless $P668, if_667_end
.annotate 'line', 123
    get_hll_global $P669, ["PAST"], "Regex"
.annotate 'line', 125
    get_hll_global $P670, ["PAST"], "Regex"
    $P671 = $P670."new"("ws", "subrule" :named("pasttype"), "method" :named("subtype"))
    find_lex $P672, "$ast"
.annotate 'line', 128
    get_hll_global $P673, ["PAST"], "Regex"
    $P674 = $P673."new"("ws", "subrule" :named("pasttype"), "method" :named("subtype"))
    $P675 = $P669."new"($P671, $P672, $P674, "concat" :named("pasttype"))
.annotate 'line', 123
    store_lex "$ast", $P675
  if_667_end:
.annotate 'line', 132
    get_hll_global $P676, ["PAST"], "Regex"
    find_lex $P677, "$ast"
    find_lex $P678, "$/"
    $P679 = $P676."new"("quant" :named("pasttype"), 1 :named("min"), $P677 :named("sep"), $P678 :named("node"))
    store_lex "$past", $P679
.annotate 'line', 120
    .return ($P679)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<ws>"  :subid("44_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_720
.annotate 'line', 146
    new $P719, 'ExceptionHandler'
    set_addr $P719, control_718
    $P719."handle_types"(.CONTROL_RETURN)
    push_eh $P719
    .lex "self", self
    .lex "$/", param_720
.annotate 'line', 147
    new $P721, "Undef"
    .lex "$past", $P721
.annotate 'line', 148
    get_global $P724, "@MODIFIERS"
    unless_null $P724, vivify_224
    $P724 = root_new ['parrot';'ResizablePMCArray']
  vivify_224:
    set $P725, $P724[0]
    unless_null $P725, vivify_225
    $P725 = root_new ['parrot';'Hash']
  vivify_225:
    set $P726, $P725["s"]
    unless_null $P726, vivify_226
    new $P726, "Undef"
  vivify_226:
    if $P726, if_723
    new $P730, "Integer"
    assign $P730, 0
    set $P722, $P730
    goto if_723_end
  if_723:
    get_hll_global $P727, ["PAST"], "Regex"
    find_lex $P728, "$/"
    $P729 = $P727."new"("ws", "subrule" :named("pasttype"), "method" :named("subtype"), $P728 :named("node"))
    set $P722, $P729
  if_723_end:
    store_lex "$past", $P722
.annotate 'line', 151
    find_lex $P731, "$/"
    find_lex $P732, "$past"
    $P733 = $P731."!make"($P732)
.annotate 'line', 146
    .return ($P733)
  control_718:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P734, exception, "payload"
    .return ($P734)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<[ ]>"  :subid("45_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_738
.annotate 'line', 155
    new $P737, 'ExceptionHandler'
    set_addr $P737, control_736
    $P737."handle_types"(.CONTROL_RETURN)
    push_eh $P737
    .lex "self", self
    .lex "$/", param_738
.annotate 'line', 156
    find_lex $P739, "$/"
    find_lex $P740, "$/"
    unless_null $P740, vivify_227
    $P740 = root_new ['parrot';'Hash']
  vivify_227:
    set $P741, $P740["nibbler"]
    unless_null $P741, vivify_228
    new $P741, "Undef"
  vivify_228:
    $P742 = $P741."ast"()
    $P743 = $P739."!make"($P742)
.annotate 'line', 155
    .return ($P743)
  control_736:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P744, exception, "payload"
    .return ($P744)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<( )>"  :subid("46_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_748
.annotate 'line', 159
    new $P747, 'ExceptionHandler'
    set_addr $P747, control_746
    $P747."handle_types"(.CONTROL_RETURN)
    push_eh $P747
    .lex "self", self
    .lex "$/", param_748
.annotate 'line', 160
    new $P749, "Undef"
    .lex "$subpast", $P749
.annotate 'line', 161
    new $P750, "Undef"
    .lex "$past", $P750
.annotate 'line', 160
    find_lex $P751, "$/"
    unless_null $P751, vivify_229
    $P751 = root_new ['parrot';'Hash']
  vivify_229:
    set $P752, $P751["nibbler"]
    unless_null $P752, vivify_230
    new $P752, "Undef"
  vivify_230:
    $P753 = $P752."ast"()
    $P754 = "buildsub"($P753)
    store_lex "$subpast", $P754
.annotate 'line', 161
    get_hll_global $P755, ["PAST"], "Regex"
    find_lex $P756, "$subpast"
    find_lex $P757, "$/"
    $P758 = $P755."new"($P756, "subrule" :named("pasttype"), "capture" :named("subtype"), $P757 :named("node"))
    store_lex "$past", $P758
.annotate 'line', 163
    find_lex $P759, "$/"
    find_lex $P760, "$past"
    $P761 = $P759."!make"($P760)
.annotate 'line', 159
    .return ($P761)
  control_746:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P762, exception, "payload"
    .return ($P762)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<'>"  :subid("47_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_766
.annotate 'line', 166
    new $P765, 'ExceptionHandler'
    set_addr $P765, control_764
    $P765."handle_types"(.CONTROL_RETURN)
    push_eh $P765
    .lex "self", self
    .lex "$/", param_766
.annotate 'line', 167
    new $P767, "Undef"
    .lex "$quote", $P767
.annotate 'line', 169
    new $P768, "Undef"
    .lex "$past", $P768
.annotate 'line', 167
    find_lex $P769, "$/"
    unless_null $P769, vivify_231
    $P769 = root_new ['parrot';'Hash']
  vivify_231:
    set $P770, $P769["quote_EXPR"]
    unless_null $P770, vivify_232
    new $P770, "Undef"
  vivify_232:
    $P771 = $P770."ast"()
    store_lex "$quote", $P771
.annotate 'line', 168
    get_hll_global $P773, ["PAST"], "Val"
    find_lex $P774, "$quote"
    $P775 = $P773."ACCEPTS"($P774)
    unless $P775, if_772_end
    find_lex $P776, "$quote"
    $P777 = $P776."value"()
    store_lex "$quote", $P777
  if_772_end:
.annotate 'line', 169
    get_hll_global $P778, ["PAST"], "Regex"
    find_lex $P779, "$quote"
    find_lex $P780, "$/"
    $P781 = $P778."new"($P779, "literal" :named("pasttype"), $P780 :named("node"))
    store_lex "$past", $P781
.annotate 'line', 170
    find_lex $P782, "$/"
    find_lex $P783, "$past"
    $P784 = $P782."!make"($P783)
.annotate 'line', 166
    .return ($P784)
  control_764:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P785, exception, "payload"
    .return ($P785)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<\">"  :subid("48_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_789
.annotate 'line', 173
    new $P788, 'ExceptionHandler'
    set_addr $P788, control_787
    $P788."handle_types"(.CONTROL_RETURN)
    push_eh $P788
    .lex "self", self
    .lex "$/", param_789
.annotate 'line', 174
    new $P790, "Undef"
    .lex "$quote", $P790
.annotate 'line', 176
    new $P791, "Undef"
    .lex "$past", $P791
.annotate 'line', 174
    find_lex $P792, "$/"
    unless_null $P792, vivify_233
    $P792 = root_new ['parrot';'Hash']
  vivify_233:
    set $P793, $P792["quote_EXPR"]
    unless_null $P793, vivify_234
    new $P793, "Undef"
  vivify_234:
    $P794 = $P793."ast"()
    store_lex "$quote", $P794
.annotate 'line', 175
    get_hll_global $P796, ["PAST"], "Val"
    find_lex $P797, "$quote"
    $P798 = $P796."ACCEPTS"($P797)
    unless $P798, if_795_end
    find_lex $P799, "$quote"
    $P800 = $P799."value"()
    store_lex "$quote", $P800
  if_795_end:
.annotate 'line', 176
    get_hll_global $P801, ["PAST"], "Regex"
    find_lex $P802, "$quote"
    find_lex $P803, "$/"
    $P804 = $P801."new"($P802, "literal" :named("pasttype"), $P803 :named("node"))
    store_lex "$past", $P804
.annotate 'line', 177
    find_lex $P805, "$/"
    find_lex $P806, "$past"
    $P807 = $P805."!make"($P806)
.annotate 'line', 173
    .return ($P807)
  control_787:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P808, exception, "payload"
    .return ($P808)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<.>"  :subid("49_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_812
.annotate 'line', 180
    new $P811, 'ExceptionHandler'
    set_addr $P811, control_810
    $P811."handle_types"(.CONTROL_RETURN)
    push_eh $P811
    .lex "self", self
    .lex "$/", param_812
.annotate 'line', 181
    new $P813, "Undef"
    .lex "$past", $P813
    get_hll_global $P814, ["PAST"], "Regex"
    find_lex $P815, "$/"
    $P816 = $P814."new"("charclass" :named("pasttype"), "." :named("subtype"), $P815 :named("node"))
    store_lex "$past", $P816
.annotate 'line', 182
    find_lex $P817, "$/"
    find_lex $P818, "$past"
    $P819 = $P817."!make"($P818)
.annotate 'line', 180
    .return ($P819)
  control_810:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P820, exception, "payload"
    .return ($P820)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<^>"  :subid("50_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_824
.annotate 'line', 185
    new $P823, 'ExceptionHandler'
    set_addr $P823, control_822
    $P823."handle_types"(.CONTROL_RETURN)
    push_eh $P823
    .lex "self", self
    .lex "$/", param_824
.annotate 'line', 186
    new $P825, "Undef"
    .lex "$past", $P825
    get_hll_global $P826, ["PAST"], "Regex"
    find_lex $P827, "$/"
    $P828 = $P826."new"("anchor" :named("pasttype"), "bos" :named("subtype"), $P827 :named("node"))
    store_lex "$past", $P828
.annotate 'line', 187
    find_lex $P829, "$/"
    find_lex $P830, "$past"
    $P831 = $P829."!make"($P830)
.annotate 'line', 185
    .return ($P831)
  control_822:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P832, exception, "payload"
    .return ($P832)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<^^>"  :subid("51_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_836
.annotate 'line', 190
    new $P835, 'ExceptionHandler'
    set_addr $P835, control_834
    $P835."handle_types"(.CONTROL_RETURN)
    push_eh $P835
    .lex "self", self
    .lex "$/", param_836
.annotate 'line', 191
    new $P837, "Undef"
    .lex "$past", $P837
    get_hll_global $P838, ["PAST"], "Regex"
    find_lex $P839, "$/"
    $P840 = $P838."new"("anchor" :named("pasttype"), "bol" :named("subtype"), $P839 :named("node"))
    store_lex "$past", $P840
.annotate 'line', 192
    find_lex $P841, "$/"
    find_lex $P842, "$past"
    $P843 = $P841."!make"($P842)
.annotate 'line', 190
    .return ($P843)
  control_834:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P844, exception, "payload"
    .return ($P844)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<$>"  :subid("52_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_848
.annotate 'line', 195
    new $P847, 'ExceptionHandler'
    set_addr $P847, control_846
    $P847."handle_types"(.CONTROL_RETURN)
    push_eh $P847
    .lex "self", self
    .lex "$/", param_848
.annotate 'line', 196
    new $P849, "Undef"
    .lex "$past", $P849
    get_hll_global $P850, ["PAST"], "Regex"
    find_lex $P851, "$/"
    $P852 = $P850."new"("anchor" :named("pasttype"), "eos" :named("subtype"), $P851 :named("node"))
    store_lex "$past", $P852
.annotate 'line', 197
    find_lex $P853, "$/"
    find_lex $P854, "$past"
    $P855 = $P853."!make"($P854)
.annotate 'line', 195
    .return ($P855)
  control_846:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P856, exception, "payload"
    .return ($P856)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<$$>"  :subid("53_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_860
.annotate 'line', 200
    new $P859, 'ExceptionHandler'
    set_addr $P859, control_858
    $P859."handle_types"(.CONTROL_RETURN)
    push_eh $P859
    .lex "self", self
    .lex "$/", param_860
.annotate 'line', 201
    new $P861, "Undef"
    .lex "$past", $P861
    get_hll_global $P862, ["PAST"], "Regex"
    find_lex $P863, "$/"
    $P864 = $P862."new"("anchor" :named("pasttype"), "eol" :named("subtype"), $P863 :named("node"))
    store_lex "$past", $P864
.annotate 'line', 202
    find_lex $P865, "$/"
    find_lex $P866, "$past"
    $P867 = $P865."!make"($P866)
.annotate 'line', 200
    .return ($P867)
  control_858:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P868, exception, "payload"
    .return ($P868)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<:::>"  :subid("54_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_872
.annotate 'line', 205
    new $P871, 'ExceptionHandler'
    set_addr $P871, control_870
    $P871."handle_types"(.CONTROL_RETURN)
    push_eh $P871
    .lex "self", self
    .lex "$/", param_872
.annotate 'line', 206
    new $P873, "Undef"
    .lex "$past", $P873
    get_hll_global $P874, ["PAST"], "Regex"
    find_lex $P875, "$/"
    $P876 = $P874."new"("cut" :named("pasttype"), $P875 :named("node"))
    store_lex "$past", $P876
.annotate 'line', 207
    find_lex $P877, "$/"
    find_lex $P878, "$past"
    $P879 = $P877."!make"($P878)
.annotate 'line', 205
    .return ($P879)
  control_870:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P880, exception, "payload"
    .return ($P880)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<lwb>"  :subid("55_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_884
.annotate 'line', 210
    new $P883, 'ExceptionHandler'
    set_addr $P883, control_882
    $P883."handle_types"(.CONTROL_RETURN)
    push_eh $P883
    .lex "self", self
    .lex "$/", param_884
.annotate 'line', 211
    new $P885, "Undef"
    .lex "$past", $P885
    get_hll_global $P886, ["PAST"], "Regex"
    find_lex $P887, "$/"
    $P888 = $P886."new"("anchor" :named("pasttype"), "lwb" :named("subtype"), $P887 :named("node"))
    store_lex "$past", $P888
.annotate 'line', 212
    find_lex $P889, "$/"
    find_lex $P890, "$past"
    $P891 = $P889."!make"($P890)
.annotate 'line', 210
    .return ($P891)
  control_882:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P892, exception, "payload"
    .return ($P892)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<rwb>"  :subid("56_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_896
.annotate 'line', 215
    new $P895, 'ExceptionHandler'
    set_addr $P895, control_894
    $P895."handle_types"(.CONTROL_RETURN)
    push_eh $P895
    .lex "self", self
    .lex "$/", param_896
.annotate 'line', 216
    new $P897, "Undef"
    .lex "$past", $P897
    get_hll_global $P898, ["PAST"], "Regex"
    find_lex $P899, "$/"
    $P900 = $P898."new"("anchor" :named("pasttype"), "rwb" :named("subtype"), $P899 :named("node"))
    store_lex "$past", $P900
.annotate 'line', 217
    find_lex $P901, "$/"
    find_lex $P902, "$past"
    $P903 = $P901."!make"($P902)
.annotate 'line', 215
    .return ($P903)
  control_894:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P904, exception, "payload"
    .return ($P904)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<bs>"  :subid("57_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_908
.annotate 'line', 220
    new $P907, 'ExceptionHandler'
    set_addr $P907, control_906
    $P907."handle_types"(.CONTROL_RETURN)
    push_eh $P907
    .lex "self", self
    .lex "$/", param_908
.annotate 'line', 221
    find_lex $P909, "$/"
    find_lex $P910, "$/"
    unless_null $P910, vivify_235
    $P910 = root_new ['parrot';'Hash']
  vivify_235:
    set $P911, $P910["backslash"]
    unless_null $P911, vivify_236
    new $P911, "Undef"
  vivify_236:
    $P912 = $P911."ast"()
    $P913 = $P909."!make"($P912)
.annotate 'line', 220
    .return ($P913)
  control_906:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P914, exception, "payload"
    .return ($P914)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<mod>"  :subid("58_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_918
.annotate 'line', 224
    new $P917, 'ExceptionHandler'
    set_addr $P917, control_916
    $P917."handle_types"(.CONTROL_RETURN)
    push_eh $P917
    .lex "self", self
    .lex "$/", param_918
.annotate 'line', 225
    find_lex $P919, "$/"
    find_lex $P920, "$/"
    unless_null $P920, vivify_237
    $P920 = root_new ['parrot';'Hash']
  vivify_237:
    set $P921, $P920["mod_internal"]
    unless_null $P921, vivify_238
    new $P921, "Undef"
  vivify_238:
    $P922 = $P921."ast"()
    $P923 = $P919."!make"($P922)
.annotate 'line', 224
    .return ($P923)
  control_916:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P924, exception, "payload"
    .return ($P924)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<assert>"  :subid("59_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_928
.annotate 'line', 228
    new $P927, 'ExceptionHandler'
    set_addr $P927, control_926
    $P927."handle_types"(.CONTROL_RETURN)
    push_eh $P927
    .lex "self", self
    .lex "$/", param_928
.annotate 'line', 229
    find_lex $P929, "$/"
    find_lex $P930, "$/"
    unless_null $P930, vivify_239
    $P930 = root_new ['parrot';'Hash']
  vivify_239:
    set $P931, $P930["assertion"]
    unless_null $P931, vivify_240
    new $P931, "Undef"
  vivify_240:
    $P932 = $P931."ast"()
    $P933 = $P929."!make"($P932)
.annotate 'line', 228
    .return ($P933)
  control_926:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P934, exception, "payload"
    .return ($P934)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<~>"  :subid("60_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_938
.annotate 'line', 232
    new $P937, 'ExceptionHandler'
    set_addr $P937, control_936
    $P937."handle_types"(.CONTROL_RETURN)
    push_eh $P937
    .lex "self", self
    .lex "$/", param_938
.annotate 'line', 233
    find_lex $P939, "$/"
    get_hll_global $P940, ["PAST"], "Regex"
.annotate 'line', 234
    find_lex $P941, "$/"
    unless_null $P941, vivify_241
    $P941 = root_new ['parrot';'Hash']
  vivify_241:
    set $P942, $P941["EXPR"]
    unless_null $P942, vivify_242
    new $P942, "Undef"
  vivify_242:
    $P943 = $P942."ast"()
.annotate 'line', 235
    get_hll_global $P944, ["PAST"], "Regex"
.annotate 'line', 236
    find_lex $P945, "$/"
    unless_null $P945, vivify_243
    $P945 = root_new ['parrot';'Hash']
  vivify_243:
    set $P946, $P945["GOAL"]
    unless_null $P946, vivify_244
    new $P946, "Undef"
  vivify_244:
    $P947 = $P946."ast"()
.annotate 'line', 237
    get_hll_global $P948, ["PAST"], "Regex"
    find_lex $P949, "$/"
    unless_null $P949, vivify_245
    $P949 = root_new ['parrot';'Hash']
  vivify_245:
    set $P950, $P949["GOAL"]
    unless_null $P950, vivify_246
    new $P950, "Undef"
  vivify_246:
    set $S951, $P950
    $P952 = $P948."new"("FAILGOAL", $S951, "subrule" :named("pasttype"), "method" :named("subtype"))
    $P953 = $P944."new"($P947, $P952, "alt" :named("pasttype"))
.annotate 'line', 235
    $P954 = $P940."new"($P943, $P953, "concat" :named("pasttype"))
.annotate 'line', 233
    $P955 = $P939."!make"($P954)
.annotate 'line', 232
    .return ($P955)
  control_936:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P956, exception, "payload"
    .return ($P956)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<{*}>"  :subid("61_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_960
.annotate 'line', 245
    new $P959, 'ExceptionHandler'
    set_addr $P959, control_958
    $P959."handle_types"(.CONTROL_RETURN)
    push_eh $P959
    .lex "self", self
    .lex "$/", param_960
.annotate 'line', 246
    new $P961, "Undef"
    .lex "$past", $P961
.annotate 'line', 247
    find_lex $P964, "$/"
    unless_null $P964, vivify_247
    $P964 = root_new ['parrot';'Hash']
  vivify_247:
    set $P965, $P964["key"]
    unless_null $P965, vivify_248
    new $P965, "Undef"
  vivify_248:
    if $P965, if_963
    new $P973, "Integer"
    assign $P973, 0
    set $P962, $P973
    goto if_963_end
  if_963:
    get_hll_global $P966, ["PAST"], "Regex"
    find_lex $P967, "$/"
    unless_null $P967, vivify_249
    $P967 = root_new ['parrot';'Hash']
  vivify_249:
    set $P968, $P967["key"]
    unless_null $P968, vivify_250
    $P968 = root_new ['parrot';'ResizablePMCArray']
  vivify_250:
    set $P969, $P968[0]
    unless_null $P969, vivify_251
    new $P969, "Undef"
  vivify_251:
    set $S970, $P969
    find_lex $P971, "$/"
    $P972 = $P966."new"($S970, "reduce" :named("pasttype"), $P971 :named("node"))
    set $P962, $P972
  if_963_end:
    store_lex "$past", $P962
.annotate 'line', 249
    find_lex $P974, "$/"
    find_lex $P975, "$past"
    $P976 = $P974."!make"($P975)
.annotate 'line', 245
    .return ($P976)
  control_958:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P977, exception, "payload"
    .return ($P977)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<var>"  :subid("62_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_981
.annotate 'line', 252
    new $P980, 'ExceptionHandler'
    set_addr $P980, control_979
    $P980."handle_types"(.CONTROL_RETURN)
    push_eh $P980
    .lex "self", self
    .lex "$/", param_981
.annotate 'line', 253
    new $P982, "Undef"
    .lex "$past", $P982
.annotate 'line', 254
    new $P983, "Undef"
    .lex "$name", $P983
.annotate 'line', 252
    find_lex $P984, "$past"
.annotate 'line', 254
    find_lex $P987, "$/"
    unless_null $P987, vivify_252
    $P987 = root_new ['parrot';'Hash']
  vivify_252:
    set $P988, $P987["pos"]
    unless_null $P988, vivify_253
    new $P988, "Undef"
  vivify_253:
    if $P988, if_986
    find_lex $P992, "$/"
    unless_null $P992, vivify_254
    $P992 = root_new ['parrot';'Hash']
  vivify_254:
    set $P993, $P992["name"]
    unless_null $P993, vivify_255
    new $P993, "Undef"
  vivify_255:
    set $S994, $P993
    new $P985, 'String'
    set $P985, $S994
    goto if_986_end
  if_986:
    find_lex $P989, "$/"
    unless_null $P989, vivify_256
    $P989 = root_new ['parrot';'Hash']
  vivify_256:
    set $P990, $P989["pos"]
    unless_null $P990, vivify_257
    new $P990, "Undef"
  vivify_257:
    set $N991, $P990
    new $P985, 'Float'
    set $P985, $N991
  if_986_end:
    store_lex "$name", $P985
.annotate 'line', 255
    find_lex $P996, "$/"
    unless_null $P996, vivify_258
    $P996 = root_new ['parrot';'Hash']
  vivify_258:
    set $P997, $P996["quantified_atom"]
    unless_null $P997, vivify_259
    new $P997, "Undef"
  vivify_259:
    if $P997, if_995
.annotate 'line', 266
    get_hll_global $P1028, ["PAST"], "Regex"
    find_lex $P1029, "$name"
    find_lex $P1030, "$/"
    $P1031 = $P1028."new"("!BACKREF", $P1029, "subrule" :named("pasttype"), "method" :named("subtype"), $P1030 :named("node"))
    store_lex "$past", $P1031
.annotate 'line', 265
    goto if_995_end
  if_995:
.annotate 'line', 256
    find_lex $P998, "$/"
    unless_null $P998, vivify_260
    $P998 = root_new ['parrot';'Hash']
  vivify_260:
    set $P999, $P998["quantified_atom"]
    unless_null $P999, vivify_261
    $P999 = root_new ['parrot';'ResizablePMCArray']
  vivify_261:
    set $P1000, $P999[0]
    unless_null $P1000, vivify_262
    new $P1000, "Undef"
  vivify_262:
    $P1001 = $P1000."ast"()
    store_lex "$past", $P1001
.annotate 'line', 257
    find_lex $P1005, "$past"
    $S1006 = $P1005."pasttype"()
    iseq $I1007, $S1006, "quant"
    if $I1007, if_1004
    new $P1003, 'Integer'
    set $P1003, $I1007
    goto if_1004_end
  if_1004:
    find_lex $P1008, "$past"
    unless_null $P1008, vivify_263
    $P1008 = root_new ['parrot';'ResizablePMCArray']
  vivify_263:
    set $P1009, $P1008[0]
    unless_null $P1009, vivify_264
    new $P1009, "Undef"
  vivify_264:
    $S1010 = $P1009."pasttype"()
    iseq $I1011, $S1010, "subrule"
    new $P1003, 'Integer'
    set $P1003, $I1011
  if_1004_end:
    if $P1003, if_1002
.annotate 'line', 260
    find_lex $P1017, "$past"
    $S1018 = $P1017."pasttype"()
    iseq $I1019, $S1018, "subrule"
    if $I1019, if_1016
.annotate 'line', 262
    get_hll_global $P1023, ["PAST"], "Regex"
    find_lex $P1024, "$past"
    find_lex $P1025, "$name"
    find_lex $P1026, "$/"
    $P1027 = $P1023."new"($P1024, $P1025 :named("name"), "subcapture" :named("pasttype"), $P1026 :named("node"))
    store_lex "$past", $P1027
.annotate 'line', 261
    goto if_1016_end
  if_1016:
.annotate 'line', 260
    find_lex $P1020, "self"
    find_lex $P1021, "$past"
    find_lex $P1022, "$name"
    $P1020."subrule_alias"($P1021, $P1022)
  if_1016_end:
    goto if_1002_end
  if_1002:
.annotate 'line', 258
    find_lex $P1012, "self"
    find_lex $P1013, "$past"
    unless_null $P1013, vivify_265
    $P1013 = root_new ['parrot';'ResizablePMCArray']
  vivify_265:
    set $P1014, $P1013[0]
    unless_null $P1014, vivify_266
    new $P1014, "Undef"
  vivify_266:
    find_lex $P1015, "$name"
    $P1012."subrule_alias"($P1014, $P1015)
  if_1002_end:
  if_995_end:
.annotate 'line', 269
    find_lex $P1032, "$/"
    find_lex $P1033, "$past"
    $P1034 = $P1032."!make"($P1033)
.annotate 'line', 252
    .return ($P1034)
  control_979:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1035, exception, "payload"
    .return ($P1035)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<PIR>"  :subid("63_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_1039
.annotate 'line', 272
    new $P1038, 'ExceptionHandler'
    set_addr $P1038, control_1037
    $P1038."handle_types"(.CONTROL_RETURN)
    push_eh $P1038
    .lex "self", self
    .lex "$/", param_1039
.annotate 'line', 273
    find_lex $P1040, "$/"
    get_hll_global $P1041, ["PAST"], "Regex"
.annotate 'line', 274
    get_hll_global $P1042, ["PAST"], "Op"
    find_lex $P1043, "$/"
    unless_null $P1043, vivify_267
    $P1043 = root_new ['parrot';'Hash']
  vivify_267:
    set $P1044, $P1043["pir"]
    unless_null $P1044, vivify_268
    new $P1044, "Undef"
  vivify_268:
    set $S1045, $P1044
    $P1046 = $P1042."new"($S1045 :named("inline"), "inline" :named("pasttype"))
    find_lex $P1047, "$/"
    $P1048 = $P1041."new"($P1046, "pastnode" :named("pasttype"), $P1047 :named("node"))
.annotate 'line', 273
    $P1049 = $P1040."!make"($P1048)
.annotate 'line', 272
    .return ($P1049)
  control_1037:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1050, exception, "payload"
    .return ($P1050)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<w>"  :subid("64_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_1054
.annotate 'line', 280
    new $P1053, 'ExceptionHandler'
    set_addr $P1053, control_1052
    $P1053."handle_types"(.CONTROL_RETURN)
    push_eh $P1053
    .lex "self", self
    .lex "$/", param_1054
.annotate 'line', 281
    new $P1055, "Undef"
    .lex "$subtype", $P1055
.annotate 'line', 282
    new $P1056, "Undef"
    .lex "$past", $P1056
.annotate 'line', 281
    find_lex $P1059, "$/"
    unless_null $P1059, vivify_269
    $P1059 = root_new ['parrot';'Hash']
  vivify_269:
    set $P1060, $P1059["sym"]
    unless_null $P1060, vivify_270
    new $P1060, "Undef"
  vivify_270:
    set $S1061, $P1060
    iseq $I1062, $S1061, "n"
    if $I1062, if_1058
    find_lex $P1064, "$/"
    unless_null $P1064, vivify_271
    $P1064 = root_new ['parrot';'Hash']
  vivify_271:
    set $P1065, $P1064["sym"]
    unless_null $P1065, vivify_272
    new $P1065, "Undef"
  vivify_272:
    set $S1066, $P1065
    new $P1057, 'String'
    set $P1057, $S1066
    goto if_1058_end
  if_1058:
    new $P1063, "String"
    assign $P1063, "nl"
    set $P1057, $P1063
  if_1058_end:
    store_lex "$subtype", $P1057
.annotate 'line', 282
    get_hll_global $P1067, ["PAST"], "Regex"
    find_lex $P1068, "$subtype"
    find_lex $P1069, "$/"
    $P1070 = $P1067."new"("charclass" :named("pasttype"), $P1068 :named("subtype"), $P1069 :named("node"))
    store_lex "$past", $P1070
.annotate 'line', 283
    find_lex $P1071, "$/"
    find_lex $P1072, "$past"
    $P1073 = $P1071."!make"($P1072)
.annotate 'line', 280
    .return ($P1073)
  control_1052:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1074, exception, "payload"
    .return ($P1074)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<b>"  :subid("65_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_1078
.annotate 'line', 286
    new $P1077, 'ExceptionHandler'
    set_addr $P1077, control_1076
    $P1077."handle_types"(.CONTROL_RETURN)
    push_eh $P1077
    .lex "self", self
    .lex "$/", param_1078
.annotate 'line', 287
    new $P1079, "Undef"
    .lex "$past", $P1079
    get_hll_global $P1080, ["PAST"], "Regex"
.annotate 'line', 288
    find_lex $P1081, "$/"
    unless_null $P1081, vivify_273
    $P1081 = root_new ['parrot';'Hash']
  vivify_273:
    set $P1082, $P1081["sym"]
    unless_null $P1082, vivify_274
    new $P1082, "Undef"
  vivify_274:
    set $S1083, $P1082
    iseq $I1084, $S1083, "B"
    find_lex $P1085, "$/"
    $P1086 = $P1080."new"("\b", "enumcharlist" :named("pasttype"), $I1084 :named("negate"), $P1085 :named("node"))
.annotate 'line', 287
    store_lex "$past", $P1086
.annotate 'line', 289
    find_lex $P1087, "$/"
    find_lex $P1088, "$past"
    $P1089 = $P1087."!make"($P1088)
.annotate 'line', 286
    .return ($P1089)
  control_1076:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1090, exception, "payload"
    .return ($P1090)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<e>"  :subid("66_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_1094
.annotate 'line', 292
    new $P1093, 'ExceptionHandler'
    set_addr $P1093, control_1092
    $P1093."handle_types"(.CONTROL_RETURN)
    push_eh $P1093
    .lex "self", self
    .lex "$/", param_1094
.annotate 'line', 293
    new $P1095, "Undef"
    .lex "$past", $P1095
    get_hll_global $P1096, ["PAST"], "Regex"
.annotate 'line', 294
    find_lex $P1097, "$/"
    unless_null $P1097, vivify_275
    $P1097 = root_new ['parrot';'Hash']
  vivify_275:
    set $P1098, $P1097["sym"]
    unless_null $P1098, vivify_276
    new $P1098, "Undef"
  vivify_276:
    set $S1099, $P1098
    iseq $I1100, $S1099, "E"
    find_lex $P1101, "$/"
    $P1102 = $P1096."new"("\e", "enumcharlist" :named("pasttype"), $I1100 :named("negate"), $P1101 :named("node"))
.annotate 'line', 293
    store_lex "$past", $P1102
.annotate 'line', 295
    find_lex $P1103, "$/"
    find_lex $P1104, "$past"
    $P1105 = $P1103."!make"($P1104)
.annotate 'line', 292
    .return ($P1105)
  control_1092:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1106, exception, "payload"
    .return ($P1106)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<f>"  :subid("67_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_1110
.annotate 'line', 298
    new $P1109, 'ExceptionHandler'
    set_addr $P1109, control_1108
    $P1109."handle_types"(.CONTROL_RETURN)
    push_eh $P1109
    .lex "self", self
    .lex "$/", param_1110
.annotate 'line', 299
    new $P1111, "Undef"
    .lex "$past", $P1111
    get_hll_global $P1112, ["PAST"], "Regex"
.annotate 'line', 300
    find_lex $P1113, "$/"
    unless_null $P1113, vivify_277
    $P1113 = root_new ['parrot';'Hash']
  vivify_277:
    set $P1114, $P1113["sym"]
    unless_null $P1114, vivify_278
    new $P1114, "Undef"
  vivify_278:
    set $S1115, $P1114
    iseq $I1116, $S1115, "F"
    find_lex $P1117, "$/"
    $P1118 = $P1112."new"("\f", "enumcharlist" :named("pasttype"), $I1116 :named("negate"), $P1117 :named("node"))
.annotate 'line', 299
    store_lex "$past", $P1118
.annotate 'line', 301
    find_lex $P1119, "$/"
    find_lex $P1120, "$past"
    $P1121 = $P1119."!make"($P1120)
.annotate 'line', 298
    .return ($P1121)
  control_1108:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1122, exception, "payload"
    .return ($P1122)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<h>"  :subid("68_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_1126
.annotate 'line', 304
    new $P1125, 'ExceptionHandler'
    set_addr $P1125, control_1124
    $P1125."handle_types"(.CONTROL_RETURN)
    push_eh $P1125
    .lex "self", self
    .lex "$/", param_1126
.annotate 'line', 305
    new $P1127, "Undef"
    .lex "$past", $P1127
    get_hll_global $P1128, ["PAST"], "Regex"
.annotate 'line', 306
    find_lex $P1129, "$/"
    unless_null $P1129, vivify_279
    $P1129 = root_new ['parrot';'Hash']
  vivify_279:
    set $P1130, $P1129["sym"]
    unless_null $P1130, vivify_280
    new $P1130, "Undef"
  vivify_280:
    set $S1131, $P1130
    iseq $I1132, $S1131, "H"
    find_lex $P1133, "$/"
    $P1134 = $P1128."new"(unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", "enumcharlist" :named("pasttype"), $I1132 :named("negate"), $P1133 :named("node"))
.annotate 'line', 305
    store_lex "$past", $P1134
.annotate 'line', 307
    find_lex $P1135, "$/"
    find_lex $P1136, "$past"
    $P1137 = $P1135."!make"($P1136)
.annotate 'line', 304
    .return ($P1137)
  control_1124:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1138, exception, "payload"
    .return ($P1138)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<r>"  :subid("69_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_1142
.annotate 'line', 310
    new $P1141, 'ExceptionHandler'
    set_addr $P1141, control_1140
    $P1141."handle_types"(.CONTROL_RETURN)
    push_eh $P1141
    .lex "self", self
    .lex "$/", param_1142
.annotate 'line', 311
    new $P1143, "Undef"
    .lex "$past", $P1143
    get_hll_global $P1144, ["PAST"], "Regex"
.annotate 'line', 312
    find_lex $P1145, "$/"
    unless_null $P1145, vivify_281
    $P1145 = root_new ['parrot';'Hash']
  vivify_281:
    set $P1146, $P1145["sym"]
    unless_null $P1146, vivify_282
    new $P1146, "Undef"
  vivify_282:
    set $S1147, $P1146
    iseq $I1148, $S1147, "R"
    find_lex $P1149, "$/"
    $P1150 = $P1144."new"("\r", "enumcharlist" :named("pasttype"), $I1148 :named("negate"), $P1149 :named("node"))
.annotate 'line', 311
    store_lex "$past", $P1150
.annotate 'line', 313
    find_lex $P1151, "$/"
    find_lex $P1152, "$past"
    $P1153 = $P1151."!make"($P1152)
.annotate 'line', 310
    .return ($P1153)
  control_1140:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1154, exception, "payload"
    .return ($P1154)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<t>"  :subid("70_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_1158
.annotate 'line', 316
    new $P1157, 'ExceptionHandler'
    set_addr $P1157, control_1156
    $P1157."handle_types"(.CONTROL_RETURN)
    push_eh $P1157
    .lex "self", self
    .lex "$/", param_1158
.annotate 'line', 317
    new $P1159, "Undef"
    .lex "$past", $P1159
    get_hll_global $P1160, ["PAST"], "Regex"
.annotate 'line', 318
    find_lex $P1161, "$/"
    unless_null $P1161, vivify_283
    $P1161 = root_new ['parrot';'Hash']
  vivify_283:
    set $P1162, $P1161["sym"]
    unless_null $P1162, vivify_284
    new $P1162, "Undef"
  vivify_284:
    set $S1163, $P1162
    iseq $I1164, $S1163, "T"
    find_lex $P1165, "$/"
    $P1166 = $P1160."new"("\t", "enumcharlist" :named("pasttype"), $I1164 :named("negate"), $P1165 :named("node"))
.annotate 'line', 317
    store_lex "$past", $P1166
.annotate 'line', 319
    find_lex $P1167, "$/"
    find_lex $P1168, "$past"
    $P1169 = $P1167."!make"($P1168)
.annotate 'line', 316
    .return ($P1169)
  control_1156:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1170, exception, "payload"
    .return ($P1170)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<v>"  :subid("71_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_1174
.annotate 'line', 322
    new $P1173, 'ExceptionHandler'
    set_addr $P1173, control_1172
    $P1173."handle_types"(.CONTROL_RETURN)
    push_eh $P1173
    .lex "self", self
    .lex "$/", param_1174
.annotate 'line', 323
    new $P1175, "Undef"
    .lex "$past", $P1175
    get_hll_global $P1176, ["PAST"], "Regex"
.annotate 'line', 325
    find_lex $P1177, "$/"
    unless_null $P1177, vivify_285
    $P1177 = root_new ['parrot';'Hash']
  vivify_285:
    set $P1178, $P1177["sym"]
    unless_null $P1178, vivify_286
    new $P1178, "Undef"
  vivify_286:
    set $S1179, $P1178
    iseq $I1180, $S1179, "V"
    find_lex $P1181, "$/"
    $P1182 = $P1176."new"(unicode:"\n\x{b}\f\r\x{85}\u2028\u2029", "enumcharlist" :named("pasttype"), $I1180 :named("negate"), $P1181 :named("node"))
.annotate 'line', 323
    store_lex "$past", $P1182
.annotate 'line', 326
    find_lex $P1183, "$/"
    find_lex $P1184, "$past"
    $P1185 = $P1183."!make"($P1184)
.annotate 'line', 322
    .return ($P1185)
  control_1172:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1186, exception, "payload"
    .return ($P1186)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<o>"  :subid("72_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_1190
.annotate 'line', 329
    new $P1189, 'ExceptionHandler'
    set_addr $P1189, control_1188
    $P1189."handle_types"(.CONTROL_RETURN)
    push_eh $P1189
    .lex "self", self
    .lex "$/", param_1190
.annotate 'line', 330
    new $P1191, "Undef"
    .lex "$octlit", $P1191
.annotate 'line', 331
    get_hll_global $P1192, ["HLL";"Actions"], "ints_to_string"
    find_lex $P1195, "$/"
    unless_null $P1195, vivify_287
    $P1195 = root_new ['parrot';'Hash']
  vivify_287:
    set $P1196, $P1195["octint"]
    unless_null $P1196, vivify_288
    new $P1196, "Undef"
  vivify_288:
    unless $P1196, unless_1194
    set $P1193, $P1196
    goto unless_1194_end
  unless_1194:
    find_lex $P1197, "$/"
    unless_null $P1197, vivify_289
    $P1197 = root_new ['parrot';'Hash']
  vivify_289:
    set $P1198, $P1197["octints"]
    unless_null $P1198, vivify_290
    $P1198 = root_new ['parrot';'Hash']
  vivify_290:
    set $P1199, $P1198["octint"]
    unless_null $P1199, vivify_291
    new $P1199, "Undef"
  vivify_291:
    set $P1193, $P1199
  unless_1194_end:
    $P1200 = $P1192($P1193)
    store_lex "$octlit", $P1200
.annotate 'line', 332
    find_lex $P1201, "$/"
    find_lex $P1204, "$/"
    unless_null $P1204, vivify_292
    $P1204 = root_new ['parrot';'Hash']
  vivify_292:
    set $P1205, $P1204["sym"]
    unless_null $P1205, vivify_293
    new $P1205, "Undef"
  vivify_293:
    set $S1206, $P1205
    iseq $I1207, $S1206, "O"
    if $I1207, if_1203
.annotate 'line', 335
    get_hll_global $P1212, ["PAST"], "Regex"
    find_lex $P1213, "$octlit"
    find_lex $P1214, "$/"
    $P1215 = $P1212."new"($P1213, "literal" :named("pasttype"), $P1214 :named("node"))
    set $P1202, $P1215
.annotate 'line', 332
    goto if_1203_end
  if_1203:
.annotate 'line', 333
    get_hll_global $P1208, ["PAST"], "Regex"
    find_lex $P1209, "$octlit"
    find_lex $P1210, "$/"
    $P1211 = $P1208."new"($P1209, "enumcharlist" :named("pasttype"), 1 :named("negate"), $P1210 :named("node"))
    set $P1202, $P1211
  if_1203_end:
    $P1216 = $P1201."!make"($P1202)
.annotate 'line', 329
    .return ($P1216)
  control_1188:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1217, exception, "payload"
    .return ($P1217)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<x>"  :subid("73_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_1221
.annotate 'line', 338
    new $P1220, 'ExceptionHandler'
    set_addr $P1220, control_1219
    $P1220."handle_types"(.CONTROL_RETURN)
    push_eh $P1220
    .lex "self", self
    .lex "$/", param_1221
.annotate 'line', 339
    new $P1222, "Undef"
    .lex "$hexlit", $P1222
.annotate 'line', 340
    get_hll_global $P1223, ["HLL";"Actions"], "ints_to_string"
    find_lex $P1226, "$/"
    unless_null $P1226, vivify_294
    $P1226 = root_new ['parrot';'Hash']
  vivify_294:
    set $P1227, $P1226["hexint"]
    unless_null $P1227, vivify_295
    new $P1227, "Undef"
  vivify_295:
    unless $P1227, unless_1225
    set $P1224, $P1227
    goto unless_1225_end
  unless_1225:
    find_lex $P1228, "$/"
    unless_null $P1228, vivify_296
    $P1228 = root_new ['parrot';'Hash']
  vivify_296:
    set $P1229, $P1228["hexints"]
    unless_null $P1229, vivify_297
    $P1229 = root_new ['parrot';'Hash']
  vivify_297:
    set $P1230, $P1229["hexint"]
    unless_null $P1230, vivify_298
    new $P1230, "Undef"
  vivify_298:
    set $P1224, $P1230
  unless_1225_end:
    $P1231 = $P1223($P1224)
    store_lex "$hexlit", $P1231
.annotate 'line', 341
    find_lex $P1232, "$/"
    find_lex $P1235, "$/"
    unless_null $P1235, vivify_299
    $P1235 = root_new ['parrot';'Hash']
  vivify_299:
    set $P1236, $P1235["sym"]
    unless_null $P1236, vivify_300
    new $P1236, "Undef"
  vivify_300:
    set $S1237, $P1236
    iseq $I1238, $S1237, "X"
    if $I1238, if_1234
.annotate 'line', 344
    get_hll_global $P1243, ["PAST"], "Regex"
    find_lex $P1244, "$hexlit"
    find_lex $P1245, "$/"
    $P1246 = $P1243."new"($P1244, "literal" :named("pasttype"), $P1245 :named("node"))
    set $P1233, $P1246
.annotate 'line', 341
    goto if_1234_end
  if_1234:
.annotate 'line', 342
    get_hll_global $P1239, ["PAST"], "Regex"
    find_lex $P1240, "$hexlit"
    find_lex $P1241, "$/"
    $P1242 = $P1239."new"($P1240, "enumcharlist" :named("pasttype"), 1 :named("negate"), $P1241 :named("node"))
    set $P1233, $P1242
  if_1234_end:
    $P1247 = $P1232."!make"($P1233)
.annotate 'line', 338
    .return ($P1247)
  control_1219:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1248, exception, "payload"
    .return ($P1248)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<c>"  :subid("74_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_1252
.annotate 'line', 347
    new $P1251, 'ExceptionHandler'
    set_addr $P1251, control_1250
    $P1251."handle_types"(.CONTROL_RETURN)
    push_eh $P1251
    .lex "self", self
    .lex "$/", param_1252
.annotate 'line', 348
    find_lex $P1253, "$/"
    get_hll_global $P1254, ["PAST"], "Regex"
    find_lex $P1255, "$/"
    unless_null $P1255, vivify_301
    $P1255 = root_new ['parrot';'Hash']
  vivify_301:
    set $P1256, $P1255["charspec"]
    unless_null $P1256, vivify_302
    new $P1256, "Undef"
  vivify_302:
    $P1257 = $P1256."ast"()
    find_lex $P1258, "$/"
    $P1259 = $P1254."new"($P1257, "literal" :named("pasttype"), $P1258 :named("node"))
    $P1260 = $P1253."!make"($P1259)
.annotate 'line', 347
    .return ($P1260)
  control_1250:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1261, exception, "payload"
    .return ($P1261)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<misc>"  :subid("75_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_1265
.annotate 'line', 351
    new $P1264, 'ExceptionHandler'
    set_addr $P1264, control_1263
    $P1264."handle_types"(.CONTROL_RETURN)
    push_eh $P1264
    .lex "self", self
    .lex "$/", param_1265
.annotate 'line', 352
    new $P1266, "Undef"
    .lex "$past", $P1266
    get_hll_global $P1267, ["PAST"], "Regex"
    find_lex $P1268, "$/"
    set $S1269, $P1268
    find_lex $P1270, "$/"
    $P1271 = $P1267."new"($S1269, "literal" :named("pasttype"), $P1270 :named("node"))
    store_lex "$past", $P1271
.annotate 'line', 353
    find_lex $P1272, "$/"
    find_lex $P1273, "$past"
    $P1274 = $P1272."!make"($P1273)
.annotate 'line', 351
    .return ($P1274)
  control_1263:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1275, exception, "payload"
    .return ($P1275)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "assertion:sym<?>"  :subid("76_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_1279
.annotate 'line', 357
    new $P1278, 'ExceptionHandler'
    set_addr $P1278, control_1277
    $P1278."handle_types"(.CONTROL_RETURN)
    push_eh $P1278
    .lex "self", self
    .lex "$/", param_1279
.annotate 'line', 358
    new $P1280, "Undef"
    .lex "$past", $P1280
.annotate 'line', 357
    find_lex $P1281, "$past"
.annotate 'line', 359
    find_lex $P1283, "$/"
    unless_null $P1283, vivify_303
    $P1283 = root_new ['parrot';'Hash']
  vivify_303:
    set $P1284, $P1283["assertion"]
    unless_null $P1284, vivify_304
    new $P1284, "Undef"
  vivify_304:
    if $P1284, if_1282
.annotate 'line', 363
    new $P1289, "Integer"
    assign $P1289, 0
    store_lex "$past", $P1289
    goto if_1282_end
  if_1282:
.annotate 'line', 360
    find_lex $P1285, "$/"
    unless_null $P1285, vivify_305
    $P1285 = root_new ['parrot';'Hash']
  vivify_305:
    set $P1286, $P1285["assertion"]
    unless_null $P1286, vivify_306
    new $P1286, "Undef"
  vivify_306:
    $P1287 = $P1286."ast"()
    store_lex "$past", $P1287
.annotate 'line', 361
    find_lex $P1288, "$past"
    $P1288."subtype"("zerowidth")
  if_1282_end:
.annotate 'line', 364
    find_lex $P1290, "$/"
    find_lex $P1291, "$past"
    $P1292 = $P1290."!make"($P1291)
.annotate 'line', 357
    .return ($P1292)
  control_1277:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1293, exception, "payload"
    .return ($P1293)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "assertion:sym<!>"  :subid("77_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_1297
.annotate 'line', 367
    new $P1296, 'ExceptionHandler'
    set_addr $P1296, control_1295
    $P1296."handle_types"(.CONTROL_RETURN)
    push_eh $P1296
    .lex "self", self
    .lex "$/", param_1297
.annotate 'line', 368
    new $P1298, "Undef"
    .lex "$past", $P1298
.annotate 'line', 367
    find_lex $P1299, "$past"
.annotate 'line', 369
    find_lex $P1301, "$/"
    unless_null $P1301, vivify_307
    $P1301 = root_new ['parrot';'Hash']
  vivify_307:
    set $P1302, $P1301["assertion"]
    unless_null $P1302, vivify_308
    new $P1302, "Undef"
  vivify_308:
    if $P1302, if_1300
.annotate 'line', 375
    get_hll_global $P1311, ["PAST"], "Regex"
    find_lex $P1312, "$/"
    $P1313 = $P1311."new"("anchor" :named("pasttype"), "fail" :named("subtype"), $P1312 :named("node"))
    store_lex "$past", $P1313
.annotate 'line', 374
    goto if_1300_end
  if_1300:
.annotate 'line', 370
    find_lex $P1303, "$/"
    unless_null $P1303, vivify_309
    $P1303 = root_new ['parrot';'Hash']
  vivify_309:
    set $P1304, $P1303["assertion"]
    unless_null $P1304, vivify_310
    new $P1304, "Undef"
  vivify_310:
    $P1305 = $P1304."ast"()
    store_lex "$past", $P1305
.annotate 'line', 371
    find_lex $P1306, "$past"
    find_lex $P1307, "$past"
    $P1308 = $P1307."negate"()
    isfalse $I1309, $P1308
    $P1306."negate"($I1309)
.annotate 'line', 372
    find_lex $P1310, "$past"
    $P1310."subtype"("zerowidth")
  if_1300_end:
.annotate 'line', 377
    find_lex $P1314, "$/"
    find_lex $P1315, "$past"
    $P1316 = $P1314."!make"($P1315)
.annotate 'line', 367
    .return ($P1316)
  control_1295:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1317, exception, "payload"
    .return ($P1317)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "assertion:sym<method>"  :subid("78_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_1321
.annotate 'line', 380
    new $P1320, 'ExceptionHandler'
    set_addr $P1320, control_1319
    $P1320."handle_types"(.CONTROL_RETURN)
    push_eh $P1320
    .lex "self", self
    .lex "$/", param_1321
.annotate 'line', 381
    new $P1322, "Undef"
    .lex "$past", $P1322
    find_lex $P1323, "$/"
    unless_null $P1323, vivify_311
    $P1323 = root_new ['parrot';'Hash']
  vivify_311:
    set $P1324, $P1323["assertion"]
    unless_null $P1324, vivify_312
    new $P1324, "Undef"
  vivify_312:
    $P1325 = $P1324."ast"()
    store_lex "$past", $P1325
.annotate 'line', 382
    find_lex $P1326, "$past"
    $P1326."subtype"("method")
.annotate 'line', 383
    find_lex $P1327, "$past"
    $P1327."name"("")
.annotate 'line', 384
    find_lex $P1328, "$/"
    find_lex $P1329, "$past"
    $P1330 = $P1328."!make"($P1329)
.annotate 'line', 380
    .return ($P1330)
  control_1319:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1331, exception, "payload"
    .return ($P1331)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "assertion:sym<name>"  :subid("79_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_1335
.annotate 'line', 387
    .const 'Sub' $P1394 = "81_1278500533.96053" 
    capture_lex $P1394
    .const 'Sub' $P1358 = "80_1278500533.96053" 
    capture_lex $P1358
    new $P1334, 'ExceptionHandler'
    set_addr $P1334, control_1333
    $P1334."handle_types"(.CONTROL_RETURN)
    push_eh $P1334
    .lex "self", self
    .lex "$/", param_1335
.annotate 'line', 388
    new $P1336, "Undef"
    .lex "$name", $P1336
.annotate 'line', 389
    new $P1337, "Undef"
    .lex "$past", $P1337
.annotate 'line', 388
    find_lex $P1338, "$/"
    unless_null $P1338, vivify_313
    $P1338 = root_new ['parrot';'Hash']
  vivify_313:
    set $P1339, $P1338["longname"]
    unless_null $P1339, vivify_314
    new $P1339, "Undef"
  vivify_314:
    set $S1340, $P1339
    new $P1341, 'String'
    set $P1341, $S1340
    store_lex "$name", $P1341
    find_lex $P1342, "$past"
.annotate 'line', 390
    find_lex $P1344, "$/"
    unless_null $P1344, vivify_315
    $P1344 = root_new ['parrot';'Hash']
  vivify_315:
    set $P1345, $P1344["assertion"]
    unless_null $P1345, vivify_316
    new $P1345, "Undef"
  vivify_316:
    if $P1345, if_1343
.annotate 'line', 394
    find_lex $P1354, "$name"
    set $S1355, $P1354
    iseq $I1356, $S1355, "sym"
    if $I1356, if_1353
.annotate 'line', 410
    get_hll_global $P1368, ["PAST"], "Regex"
    find_lex $P1369, "$name"
    find_lex $P1370, "$name"
    find_lex $P1371, "$/"
    $P1372 = $P1368."new"($P1369, $P1370 :named("name"), "subrule" :named("pasttype"), "capture" :named("subtype"), $P1371 :named("node"))
    store_lex "$past", $P1372
.annotate 'line', 412
    find_lex $P1374, "$/"
    unless_null $P1374, vivify_317
    $P1374 = root_new ['parrot';'Hash']
  vivify_317:
    set $P1375, $P1374["nibbler"]
    unless_null $P1375, vivify_318
    new $P1375, "Undef"
  vivify_318:
    if $P1375, if_1373
.annotate 'line', 415
    find_lex $P1383, "$/"
    unless_null $P1383, vivify_319
    $P1383 = root_new ['parrot';'Hash']
  vivify_319:
    set $P1384, $P1383["arglist"]
    unless_null $P1384, vivify_320
    new $P1384, "Undef"
  vivify_320:
    unless $P1384, if_1382_end
.annotate 'line', 416
    find_lex $P1386, "$/"
    unless_null $P1386, vivify_321
    $P1386 = root_new ['parrot';'Hash']
  vivify_321:
    set $P1387, $P1386["arglist"]
    unless_null $P1387, vivify_322
    $P1387 = root_new ['parrot';'ResizablePMCArray']
  vivify_322:
    set $P1388, $P1387[0]
    unless_null $P1388, vivify_323
    new $P1388, "Undef"
  vivify_323:
    $P1389 = $P1388."ast"()
    $P1390 = $P1389."list"()
    defined $I1391, $P1390
    unless $I1391, for_undef_324
    iter $P1385, $P1390
    new $P1400, 'ExceptionHandler'
    set_addr $P1400, loop1399_handler
    $P1400."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1400
  loop1399_test:
    unless $P1385, loop1399_done
    shift $P1392, $P1385
  loop1399_redo:
    .const 'Sub' $P1394 = "81_1278500533.96053" 
    capture_lex $P1394
    $P1394($P1392)
  loop1399_next:
    goto loop1399_test
  loop1399_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1401, exception, 'type'
    eq $P1401, .CONTROL_LOOP_NEXT, loop1399_next
    eq $P1401, .CONTROL_LOOP_REDO, loop1399_redo
  loop1399_done:
    pop_eh 
  for_undef_324:
  if_1382_end:
.annotate 'line', 415
    goto if_1373_end
  if_1373:
.annotate 'line', 413
    find_lex $P1376, "$past"
    find_lex $P1377, "$/"
    unless_null $P1377, vivify_325
    $P1377 = root_new ['parrot';'Hash']
  vivify_325:
    set $P1378, $P1377["nibbler"]
    unless_null $P1378, vivify_326
    $P1378 = root_new ['parrot';'ResizablePMCArray']
  vivify_326:
    set $P1379, $P1378[0]
    unless_null $P1379, vivify_327
    new $P1379, "Undef"
  vivify_327:
    $P1380 = $P1379."ast"()
    $P1381 = "buildsub"($P1380)
    $P1376."push"($P1381)
  if_1373_end:
.annotate 'line', 409
    goto if_1353_end
  if_1353:
.annotate 'line', 394
    .const 'Sub' $P1358 = "80_1278500533.96053" 
    capture_lex $P1358
    $P1358()
  if_1353_end:
    goto if_1343_end
  if_1343:
.annotate 'line', 391
    find_lex $P1346, "$/"
    unless_null $P1346, vivify_328
    $P1346 = root_new ['parrot';'Hash']
  vivify_328:
    set $P1347, $P1346["assertion"]
    unless_null $P1347, vivify_329
    $P1347 = root_new ['parrot';'ResizablePMCArray']
  vivify_329:
    set $P1348, $P1347[0]
    unless_null $P1348, vivify_330
    new $P1348, "Undef"
  vivify_330:
    $P1349 = $P1348."ast"()
    store_lex "$past", $P1349
.annotate 'line', 392
    find_lex $P1350, "self"
    find_lex $P1351, "$past"
    find_lex $P1352, "$name"
    $P1350."subrule_alias"($P1351, $P1352)
  if_1343_end:
.annotate 'line', 419
    find_lex $P1402, "$/"
    find_lex $P1403, "$past"
    $P1404 = $P1402."!make"($P1403)
.annotate 'line', 387
    .return ($P1404)
  control_1333:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1405, exception, "payload"
    .return ($P1405)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1393"  :anon :subid("81_1278500533.96053") :outer("79_1278500533.96053")
    .param pmc param_1395
.annotate 'line', 416
    .lex "$_", param_1395
    find_lex $P1396, "$past"
    find_lex $P1397, "$_"
    $P1398 = $P1396."push"($P1397)
    .return ($P1398)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1357"  :anon :subid("80_1278500533.96053") :outer("79_1278500533.96053")
.annotate 'line', 395
    new $P1359, "Undef"
    .lex "$regexsym", $P1359

            $P0 = get_global '$REGEXNAME'
            $S0 = $P0
            $I0 = index $S0, ':sym<'
            add $I0, 5
            $S0 = substr $S0, $I0
            $S0 = chopn $S0, 1
            $P1360 = box $S0
        
    store_lex "$regexsym", $P1360
.annotate 'line', 404
    get_hll_global $P1361, ["PAST"], "Regex"
.annotate 'line', 405
    get_hll_global $P1362, ["PAST"], "Regex"
    find_lex $P1363, "$regexsym"
    $P1364 = $P1362."new"($P1363, "literal" :named("pasttype"))
    find_lex $P1365, "$name"
    find_lex $P1366, "$/"
    $P1367 = $P1361."new"($P1364, $P1365 :named("name"), "subcapture" :named("pasttype"), $P1366 :named("node"))
.annotate 'line', 404
    store_lex "$past", $P1367
.annotate 'line', 394
    .return ($P1367)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "assertion:sym<[>"  :subid("82_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_1409
.annotate 'line', 422
    .const 'Sub' $P1444 = "83_1278500533.96053" 
    capture_lex $P1444
    new $P1408, 'ExceptionHandler'
    set_addr $P1408, control_1407
    $P1408."handle_types"(.CONTROL_RETURN)
    push_eh $P1408
    .lex "self", self
    .lex "$/", param_1409
.annotate 'line', 423
    new $P1410, "Undef"
    .lex "$clist", $P1410
.annotate 'line', 424
    new $P1411, "Undef"
    .lex "$past", $P1411
.annotate 'line', 433
    new $P1412, "Undef"
    .lex "$i", $P1412
.annotate 'line', 434
    new $P1413, "Undef"
    .lex "$n", $P1413
.annotate 'line', 423
    find_lex $P1414, "$/"
    unless_null $P1414, vivify_331
    $P1414 = root_new ['parrot';'Hash']
  vivify_331:
    set $P1415, $P1414["cclass_elem"]
    unless_null $P1415, vivify_332
    new $P1415, "Undef"
  vivify_332:
    store_lex "$clist", $P1415
.annotate 'line', 424
    find_lex $P1416, "$clist"
    unless_null $P1416, vivify_333
    $P1416 = root_new ['parrot';'ResizablePMCArray']
  vivify_333:
    set $P1417, $P1416[0]
    unless_null $P1417, vivify_334
    new $P1417, "Undef"
  vivify_334:
    $P1418 = $P1417."ast"()
    store_lex "$past", $P1418
.annotate 'line', 425
    find_lex $P1422, "$past"
    $P1423 = $P1422."negate"()
    if $P1423, if_1421
    set $P1420, $P1423
    goto if_1421_end
  if_1421:
    find_lex $P1424, "$past"
    $S1425 = $P1424."pasttype"()
    iseq $I1426, $S1425, "subrule"
    new $P1420, 'Integer'
    set $P1420, $I1426
  if_1421_end:
    unless $P1420, if_1419_end
.annotate 'line', 426
    find_lex $P1427, "$past"
    $P1427."subtype"("zerowidth")
.annotate 'line', 427
    get_hll_global $P1428, ["PAST"], "Regex"
    find_lex $P1429, "$past"
.annotate 'line', 429
    get_hll_global $P1430, ["PAST"], "Regex"
    $P1431 = $P1430."new"("charclass" :named("pasttype"), "." :named("subtype"))
    find_lex $P1432, "$/"
    $P1433 = $P1428."new"($P1429, $P1431, $P1432 :named("node"))
.annotate 'line', 427
    store_lex "$past", $P1433
  if_1419_end:
.annotate 'line', 433
    new $P1434, "Integer"
    assign $P1434, 1
    store_lex "$i", $P1434
.annotate 'line', 434
    find_lex $P1435, "$clist"
    set $N1436, $P1435
    new $P1437, 'Float'
    set $P1437, $N1436
    store_lex "$n", $P1437
.annotate 'line', 435
    new $P1468, 'ExceptionHandler'
    set_addr $P1468, loop1467_handler
    $P1468."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1468
  loop1467_test:
    find_lex $P1438, "$i"
    set $N1439, $P1438
    find_lex $P1440, "$n"
    set $N1441, $P1440
    islt $I1442, $N1439, $N1441
    unless $I1442, loop1467_done
  loop1467_redo:
    .const 'Sub' $P1444 = "83_1278500533.96053" 
    capture_lex $P1444
    $P1444()
  loop1467_next:
    goto loop1467_test
  loop1467_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1469, exception, 'type'
    eq $P1469, .CONTROL_LOOP_NEXT, loop1467_next
    eq $P1469, .CONTROL_LOOP_REDO, loop1467_redo
  loop1467_done:
    pop_eh 
.annotate 'line', 446
    find_lex $P1470, "$/"
    find_lex $P1471, "$past"
    $P1472 = $P1470."!make"($P1471)
.annotate 'line', 422
    .return ($P1472)
  control_1407:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1473, exception, "payload"
    .return ($P1473)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1443"  :anon :subid("83_1278500533.96053") :outer("82_1278500533.96053")
.annotate 'line', 436
    new $P1445, "Undef"
    .lex "$ast", $P1445
    find_lex $P1446, "$i"
    set $I1447, $P1446
    find_lex $P1448, "$clist"
    unless_null $P1448, vivify_335
    $P1448 = root_new ['parrot';'ResizablePMCArray']
  vivify_335:
    set $P1449, $P1448[$I1447]
    unless_null $P1449, vivify_336
    new $P1449, "Undef"
  vivify_336:
    $P1450 = $P1449."ast"()
    store_lex "$ast", $P1450
.annotate 'line', 437
    find_lex $P1452, "$ast"
    $P1453 = $P1452."negate"()
    if $P1453, if_1451
.annotate 'line', 442
    get_hll_global $P1460, ["PAST"], "Regex"
    find_lex $P1461, "$past"
    find_lex $P1462, "$ast"
    find_lex $P1463, "$/"
    $P1464 = $P1460."new"($P1461, $P1462, "alt" :named("pasttype"), $P1463 :named("node"))
    store_lex "$past", $P1464
.annotate 'line', 441
    goto if_1451_end
  if_1451:
.annotate 'line', 438
    find_lex $P1454, "$ast"
    $P1454."subtype"("zerowidth")
.annotate 'line', 439
    get_hll_global $P1455, ["PAST"], "Regex"
    find_lex $P1456, "$ast"
    find_lex $P1457, "$past"
    find_lex $P1458, "$/"
    $P1459 = $P1455."new"($P1456, $P1457, "concat" :named("pasttype"), $P1458 :named("node"))
    store_lex "$past", $P1459
  if_1451_end:
.annotate 'line', 444
    find_lex $P1465, "$i"
    add $P1466, $P1465, 1
    store_lex "$i", $P1466
.annotate 'line', 435
    .return ($P1466)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "cclass_elem"  :subid("84_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_1477
.annotate 'line', 449
    .const 'Sub' $P1502 = "86_1278500533.96053" 
    capture_lex $P1502
    .const 'Sub' $P1486 = "85_1278500533.96053" 
    capture_lex $P1486
    new $P1476, 'ExceptionHandler'
    set_addr $P1476, control_1475
    $P1476."handle_types"(.CONTROL_RETURN)
    push_eh $P1476
    .lex "self", self
    .lex "$/", param_1477
.annotate 'line', 450
    new $P1478, "Undef"
    .lex "$str", $P1478
.annotate 'line', 451
    new $P1479, "Undef"
    .lex "$past", $P1479
.annotate 'line', 450
    new $P1480, "String"
    assign $P1480, ""
    store_lex "$str", $P1480
    find_lex $P1481, "$past"
.annotate 'line', 452
    find_lex $P1483, "$/"
    unless_null $P1483, vivify_337
    $P1483 = root_new ['parrot';'Hash']
  vivify_337:
    set $P1484, $P1483["name"]
    unless_null $P1484, vivify_338
    new $P1484, "Undef"
  vivify_338:
    if $P1484, if_1482
.annotate 'line', 456
    find_lex $P1497, "$/"
    unless_null $P1497, vivify_339
    $P1497 = root_new ['parrot';'Hash']
  vivify_339:
    set $P1498, $P1497["charspec"]
    unless_null $P1498, vivify_340
    new $P1498, "Undef"
  vivify_340:
    defined $I1499, $P1498
    unless $I1499, for_undef_341
    iter $P1496, $P1498
    new $P1528, 'ExceptionHandler'
    set_addr $P1528, loop1527_handler
    $P1528."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1528
  loop1527_test:
    unless $P1496, loop1527_done
    shift $P1500, $P1496
  loop1527_redo:
    .const 'Sub' $P1502 = "86_1278500533.96053" 
    capture_lex $P1502
    $P1502($P1500)
  loop1527_next:
    goto loop1527_test
  loop1527_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1529, exception, 'type'
    eq $P1529, .CONTROL_LOOP_NEXT, loop1527_next
    eq $P1529, .CONTROL_LOOP_REDO, loop1527_redo
  loop1527_done:
    pop_eh 
  for_undef_341:
.annotate 'line', 481
    get_hll_global $P1530, ["PAST"], "Regex"
    find_lex $P1531, "$str"
    find_lex $P1532, "$/"
    $P1533 = $P1530."new"($P1531, "enumcharlist" :named("pasttype"), $P1532 :named("node"))
    store_lex "$past", $P1533
.annotate 'line', 455
    goto if_1482_end
  if_1482:
.annotate 'line', 452
    .const 'Sub' $P1486 = "85_1278500533.96053" 
    capture_lex $P1486
    $P1486()
  if_1482_end:
.annotate 'line', 483
    find_lex $P1534, "$past"
    find_lex $P1535, "$/"
    unless_null $P1535, vivify_353
    $P1535 = root_new ['parrot';'Hash']
  vivify_353:
    set $P1536, $P1535["sign"]
    unless_null $P1536, vivify_354
    new $P1536, "Undef"
  vivify_354:
    set $S1537, $P1536
    iseq $I1538, $S1537, "-"
    $P1534."negate"($I1538)
.annotate 'line', 484
    find_lex $P1539, "$/"
    find_lex $P1540, "$past"
    $P1541 = $P1539."!make"($P1540)
.annotate 'line', 449
    .return ($P1541)
  control_1475:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1542, exception, "payload"
    .return ($P1542)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1501"  :anon :subid("86_1278500533.96053") :outer("84_1278500533.96053")
    .param pmc param_1503
.annotate 'line', 456
    .const 'Sub' $P1509 = "87_1278500533.96053" 
    capture_lex $P1509
    .lex "$_", param_1503
.annotate 'line', 457
    find_lex $P1506, "$_"
    unless_null $P1506, vivify_342
    $P1506 = root_new ['parrot';'ResizablePMCArray']
  vivify_342:
    set $P1507, $P1506[1]
    unless_null $P1507, vivify_343
    new $P1507, "Undef"
  vivify_343:
    if $P1507, if_1505
.annotate 'line', 479
    find_lex $P1523, "$str"
    find_lex $P1524, "$_"
    unless_null $P1524, vivify_344
    $P1524 = root_new ['parrot';'ResizablePMCArray']
  vivify_344:
    set $P1525, $P1524[0]
    unless_null $P1525, vivify_345
    new $P1525, "Undef"
  vivify_345:
    concat $P1526, $P1523, $P1525
    store_lex "$str", $P1526
    set $P1504, $P1526
.annotate 'line', 457
    goto if_1505_end
  if_1505:
    .const 'Sub' $P1509 = "87_1278500533.96053" 
    capture_lex $P1509
    $P1522 = $P1509()
    set $P1504, $P1522
  if_1505_end:
.annotate 'line', 456
    .return ($P1504)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1508"  :anon :subid("87_1278500533.96053") :outer("86_1278500533.96053")
.annotate 'line', 458
    new $P1510, "Undef"
    .lex "$a", $P1510
.annotate 'line', 459
    new $P1511, "Undef"
    .lex "$b", $P1511
.annotate 'line', 460
    new $P1512, "Undef"
    .lex "$c", $P1512
.annotate 'line', 458
    find_lex $P1513, "$_"
    unless_null $P1513, vivify_346
    $P1513 = root_new ['parrot';'ResizablePMCArray']
  vivify_346:
    set $P1514, $P1513[0]
    unless_null $P1514, vivify_347
    new $P1514, "Undef"
  vivify_347:
    store_lex "$a", $P1514
.annotate 'line', 459
    find_lex $P1515, "$_"
    unless_null $P1515, vivify_348
    $P1515 = root_new ['parrot';'ResizablePMCArray']
  vivify_348:
    set $P1516, $P1515[1]
    unless_null $P1516, vivify_349
    $P1516 = root_new ['parrot';'ResizablePMCArray']
  vivify_349:
    set $P1517, $P1516[0]
    unless_null $P1517, vivify_350
    new $P1517, "Undef"
  vivify_350:
    store_lex "$b", $P1517
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
                             $P1518 = box $S2
                         
    store_lex "$c", $P1518
.annotate 'line', 477
    find_lex $P1519, "$str"
    find_lex $P1520, "$c"
    concat $P1521, $P1519, $P1520
    store_lex "$str", $P1521
.annotate 'line', 457
    .return ($P1521)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1485"  :anon :subid("85_1278500533.96053") :outer("84_1278500533.96053")
.annotate 'line', 453
    new $P1487, "Undef"
    .lex "$name", $P1487
    find_lex $P1488, "$/"
    unless_null $P1488, vivify_351
    $P1488 = root_new ['parrot';'Hash']
  vivify_351:
    set $P1489, $P1488["name"]
    unless_null $P1489, vivify_352
    new $P1489, "Undef"
  vivify_352:
    set $S1490, $P1489
    new $P1491, 'String'
    set $P1491, $S1490
    store_lex "$name", $P1491
.annotate 'line', 454
    get_hll_global $P1492, ["PAST"], "Regex"
    find_lex $P1493, "$name"
    find_lex $P1494, "$/"
    $P1495 = $P1492."new"($P1493, "subrule" :named("pasttype"), "method" :named("subtype"), $P1494 :named("node"))
    store_lex "$past", $P1495
.annotate 'line', 452
    .return ($P1495)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "mod_internal"  :subid("88_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_1546
.annotate 'line', 487
    new $P1545, 'ExceptionHandler'
    set_addr $P1545, control_1544
    $P1545."handle_types"(.CONTROL_RETURN)
    push_eh $P1545
    .lex "self", self
    .lex "$/", param_1546
.annotate 'line', 488
    $P1547 = root_new ['parrot';'Hash']
    .lex "%mods", $P1547
.annotate 'line', 489
    new $P1548, "Undef"
    .lex "$n", $P1548
.annotate 'line', 488
    get_global $P1549, "@MODIFIERS"
    unless_null $P1549, vivify_355
    $P1549 = root_new ['parrot';'ResizablePMCArray']
  vivify_355:
    set $P1550, $P1549[0]
    unless_null $P1550, vivify_356
    new $P1550, "Undef"
  vivify_356:
    store_lex "%mods", $P1550
.annotate 'line', 489
    find_lex $P1553, "$/"
    unless_null $P1553, vivify_357
    $P1553 = root_new ['parrot';'Hash']
  vivify_357:
    set $P1554, $P1553["n"]
    unless_null $P1554, vivify_358
    $P1554 = root_new ['parrot';'ResizablePMCArray']
  vivify_358:
    set $P1555, $P1554[0]
    unless_null $P1555, vivify_359
    new $P1555, "Undef"
  vivify_359:
    set $S1556, $P1555
    isgt $I1557, $S1556, ""
    if $I1557, if_1552
    new $P1562, "Integer"
    assign $P1562, 1
    set $P1551, $P1562
    goto if_1552_end
  if_1552:
    find_lex $P1558, "$/"
    unless_null $P1558, vivify_360
    $P1558 = root_new ['parrot';'Hash']
  vivify_360:
    set $P1559, $P1558["n"]
    unless_null $P1559, vivify_361
    $P1559 = root_new ['parrot';'ResizablePMCArray']
  vivify_361:
    set $P1560, $P1559[0]
    unless_null $P1560, vivify_362
    new $P1560, "Undef"
  vivify_362:
    set $N1561, $P1560
    new $P1551, 'Float'
    set $P1551, $N1561
  if_1552_end:
    store_lex "$n", $P1551
.annotate 'line', 490
    find_lex $P1563, "$n"
    find_lex $P1564, "$/"
    unless_null $P1564, vivify_363
    $P1564 = root_new ['parrot';'Hash']
  vivify_363:
    set $P1565, $P1564["mod_ident"]
    unless_null $P1565, vivify_364
    $P1565 = root_new ['parrot';'Hash']
  vivify_364:
    set $P1566, $P1565["sym"]
    unless_null $P1566, vivify_365
    new $P1566, "Undef"
  vivify_365:
    set $S1567, $P1566
    find_lex $P1568, "%mods"
    unless_null $P1568, vivify_366
    $P1568 = root_new ['parrot';'Hash']
    store_lex "%mods", $P1568
  vivify_366:
    set $P1568[$S1567], $P1563
.annotate 'line', 491
    find_lex $P1569, "$/"
    $P1570 = $P1569."!make"(0)
.annotate 'line', 487
    .return ($P1570)
  control_1544:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1571, exception, "payload"
    .return ($P1571)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "subrule_alias"  :subid("89_1278500533.96053") :method :outer("11_1278500533.96053")
    .param pmc param_1578
    .param pmc param_1579
.annotate 'line', 584
    new $P1577, 'ExceptionHandler'
    set_addr $P1577, control_1576
    $P1577."handle_types"(.CONTROL_RETURN)
    push_eh $P1577
    .lex "self", self
    .lex "$past", param_1578
    .lex "$name", param_1579
.annotate 'line', 585
    find_lex $P1581, "$past"
    $S1582 = $P1581."name"()
    isgt $I1583, $S1582, ""
    if $I1583, if_1580
.annotate 'line', 586
    find_lex $P1590, "$past"
    find_lex $P1591, "$name"
    $P1590."name"($P1591)
    goto if_1580_end
  if_1580:
.annotate 'line', 585
    find_lex $P1584, "$past"
    find_lex $P1585, "$name"
    concat $P1586, $P1585, "="
    find_lex $P1587, "$past"
    $S1588 = $P1587."name"()
    concat $P1589, $P1586, $S1588
    $P1584."name"($P1589)
  if_1580_end:
.annotate 'line', 587
    find_lex $P1592, "$past"
    $P1593 = $P1592."subtype"("capture")
.annotate 'line', 584
    .return ($P1593)
  control_1576:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1594, exception, "payload"
    .return ($P1594)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1596" :load :anon :subid("90_1278500533.96053")
.annotate 'line', 4
    .const 'Sub' $P1598 = "11_1278500533.96053" 
    $P1599 = $P1598()
    .return ($P1599)
.end


.namespace []
.sub "_block1602" :load :anon :subid("91_1278500533.96053")
.annotate 'line', 1
    .const 'Sub' $P1604 = "10_1278500533.96053" 
    $P1605 = $P1604()
    .return ($P1605)
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
