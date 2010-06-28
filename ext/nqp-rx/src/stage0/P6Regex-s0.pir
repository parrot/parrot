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
.sub "_block11"  :anon :subid("10_1277356887.58177")
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
    .const 'Sub' $P598 = "161_1277356887.58177" 
    .return ($P598)
.end


.namespace []
.sub "" :load :init :subid("post162") :outer("10_1277356887.58177")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1277356887.58177" 
    .local pmc block
    set block, $P12
    $P601 = get_root_global ["parrot"], "P6metaclass"
    $P601."new_class"("Regex::P6Regex::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block13"  :subid("11_1277356887.58177") :outer("10_1277356887.58177")
.annotate 'line', 3
    .const 'Sub' $P584 = "158_1277356887.58177" 
    capture_lex $P584
    .const 'Sub' $P576 = "156_1277356887.58177" 
    capture_lex $P576
    .const 'Sub' $P568 = "154_1277356887.58177" 
    capture_lex $P568
    .const 'Sub' $P547 = "149_1277356887.58177" 
    capture_lex $P547
    .const 'Sub' $P512 = "143_1277356887.58177" 
    capture_lex $P512
    .const 'Sub' $P500 = "140_1277356887.58177" 
    capture_lex $P500
    .const 'Sub' $P487 = "137_1277356887.58177" 
    capture_lex $P487
    .const 'Sub' $P481 = "135_1277356887.58177" 
    capture_lex $P481
    .const 'Sub' $P470 = "132_1277356887.58177" 
    capture_lex $P470
    .const 'Sub' $P459 = "129_1277356887.58177" 
    capture_lex $P459
    .const 'Sub' $P450 = "125_1277356887.58177" 
    capture_lex $P450
    .const 'Sub' $P444 = "123_1277356887.58177" 
    capture_lex $P444
    .const 'Sub' $P438 = "121_1277356887.58177" 
    capture_lex $P438
    .const 'Sub' $P432 = "119_1277356887.58177" 
    capture_lex $P432
    .const 'Sub' $P426 = "117_1277356887.58177" 
    capture_lex $P426
    .const 'Sub' $P418 = "115_1277356887.58177" 
    capture_lex $P418
    .const 'Sub' $P407 = "113_1277356887.58177" 
    capture_lex $P407
    .const 'Sub' $P396 = "111_1277356887.58177" 
    capture_lex $P396
    .const 'Sub' $P390 = "109_1277356887.58177" 
    capture_lex $P390
    .const 'Sub' $P384 = "107_1277356887.58177" 
    capture_lex $P384
    .const 'Sub' $P378 = "105_1277356887.58177" 
    capture_lex $P378
    .const 'Sub' $P372 = "103_1277356887.58177" 
    capture_lex $P372
    .const 'Sub' $P366 = "101_1277356887.58177" 
    capture_lex $P366
    .const 'Sub' $P360 = "99_1277356887.58177" 
    capture_lex $P360
    .const 'Sub' $P354 = "97_1277356887.58177" 
    capture_lex $P354
    .const 'Sub' $P348 = "95_1277356887.58177" 
    capture_lex $P348
    .const 'Sub' $P336 = "91_1277356887.58177" 
    capture_lex $P336
    .const 'Sub' $P324 = "89_1277356887.58177" 
    capture_lex $P324
    .const 'Sub' $P317 = "87_1277356887.58177" 
    capture_lex $P317
    .const 'Sub' $P300 = "85_1277356887.58177" 
    capture_lex $P300
    .const 'Sub' $P293 = "83_1277356887.58177" 
    capture_lex $P293
    .const 'Sub' $P287 = "81_1277356887.58177" 
    capture_lex $P287
    .const 'Sub' $P281 = "79_1277356887.58177" 
    capture_lex $P281
    .const 'Sub' $P274 = "77_1277356887.58177" 
    capture_lex $P274
    .const 'Sub' $P267 = "75_1277356887.58177" 
    capture_lex $P267
    .const 'Sub' $P260 = "73_1277356887.58177" 
    capture_lex $P260
    .const 'Sub' $P253 = "71_1277356887.58177" 
    capture_lex $P253
    .const 'Sub' $P247 = "69_1277356887.58177" 
    capture_lex $P247
    .const 'Sub' $P241 = "67_1277356887.58177" 
    capture_lex $P241
    .const 'Sub' $P235 = "65_1277356887.58177" 
    capture_lex $P235
    .const 'Sub' $P229 = "63_1277356887.58177" 
    capture_lex $P229
    .const 'Sub' $P223 = "61_1277356887.58177" 
    capture_lex $P223
    .const 'Sub' $P218 = "59_1277356887.58177" 
    capture_lex $P218
    .const 'Sub' $P213 = "57_1277356887.58177" 
    capture_lex $P213
    .const 'Sub' $P207 = "55_1277356887.58177" 
    capture_lex $P207
    .const 'Sub' $P201 = "53_1277356887.58177" 
    capture_lex $P201
    .const 'Sub' $P195 = "51_1277356887.58177" 
    capture_lex $P195
    .const 'Sub' $P179 = "46_1277356887.58177" 
    capture_lex $P179
    .const 'Sub' $P163 = "44_1277356887.58177" 
    capture_lex $P163
    .const 'Sub' $P156 = "42_1277356887.58177" 
    capture_lex $P156
    .const 'Sub' $P149 = "40_1277356887.58177" 
    capture_lex $P149
    .const 'Sub' $P142 = "38_1277356887.58177" 
    capture_lex $P142
    .const 'Sub' $P123 = "33_1277356887.58177" 
    capture_lex $P123
    .const 'Sub' $P110 = "30_1277356887.58177" 
    capture_lex $P110
    .const 'Sub' $P103 = "28_1277356887.58177" 
    capture_lex $P103
    .const 'Sub' $P91 = "26_1277356887.58177" 
    capture_lex $P91
    .const 'Sub' $P84 = "24_1277356887.58177" 
    capture_lex $P84
    .const 'Sub' $P71 = "22_1277356887.58177" 
    capture_lex $P71
    .const 'Sub' $P64 = "20_1277356887.58177" 
    capture_lex $P64
    .const 'Sub' $P56 = "18_1277356887.58177" 
    capture_lex $P56
    .const 'Sub' $P46 = "15_1277356887.58177" 
    capture_lex $P46
    .const 'Sub' $P38 = "13_1277356887.58177" 
    capture_lex $P38
    .const 'Sub' $P15 = "12_1277356887.58177" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    .const 'Sub' $P584 = "158_1277356887.58177" 
    capture_lex $P584
    .return ($P584)
    .const 'Sub' $P593 = "160_1277356887.58177" 
    .return ($P593)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.include "except_types.pasm"
.sub "obs"  :subid("12_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "ws"  :subid("13_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__ws"  :subid("14_1277356887.58177") :method
.annotate 'line', 3
    new $P41, "ResizablePMCArray"
    push $P41, ""
    .return ($P41)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "normspace"  :subid("15_1277356887.58177") :method :outer("11_1277356887.58177")
.annotate 'line', 3
    .const 'Sub' $P52 = "17_1277356887.58177" 
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
    .const 'Sub' $P52 = "17_1277356887.58177" 
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
.sub "!PREFIX__normspace"  :subid("16_1277356887.58177") :method
.annotate 'line', 3
    new $P49, "ResizablePMCArray"
    push $P49, ""
    .return ($P49)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block51"  :anon :subid("17_1277356887.58177") :method :outer("15_1277356887.58177")
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
.sub "identifier"  :subid("18_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__identifier"  :subid("19_1277356887.58177") :method
.annotate 'line', 3
    $P59 = self."!PREFIX__!subrule"("ident", "")
    new $P60, "ResizablePMCArray"
    push $P60, $P59
    .return ($P60)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "arg"  :subid("20_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__arg"  :subid("21_1277356887.58177") :method
.annotate 'line', 3
    new $P67, "ResizablePMCArray"
    push $P67, ""
    push $P67, "\""
    push $P67, "'"
    .return ($P67)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "arglist"  :subid("22_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__arglist"  :subid("23_1277356887.58177") :method
.annotate 'line', 3
    $P74 = self."!PREFIX__!subrule"("ws", "")
    new $P75, "ResizablePMCArray"
    push $P75, $P74
    .return ($P75)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "TOP"  :subid("24_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__TOP"  :subid("25_1277356887.58177") :method
.annotate 'line', 3
    $P87 = self."!PREFIX__!subrule"("nibbler", "")
    new $P88, "ResizablePMCArray"
    push $P88, $P87
    .return ($P88)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "nibbler"  :subid("26_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__nibbler"  :subid("27_1277356887.58177") :method
.annotate 'line', 3
    new $P94, "ResizablePMCArray"
    push $P94, ""
    .return ($P94)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "termish"  :subid("28_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__termish"  :subid("29_1277356887.58177") :method
.annotate 'line', 3
    new $P106, "ResizablePMCArray"
    push $P106, ""
    .return ($P106)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantified_atom"  :subid("30_1277356887.58177") :method :outer("11_1277356887.58177")
.annotate 'line', 3
    .const 'Sub' $P119 = "32_1277356887.58177" 
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
    .const 'Sub' $P119 = "32_1277356887.58177" 
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
.sub "!PREFIX__quantified_atom"  :subid("31_1277356887.58177") :method
.annotate 'line', 3
    $P113 = self."!PREFIX__!subrule"("atom", "")
    new $P114, "ResizablePMCArray"
    push $P114, $P113
    .return ($P114)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block118"  :anon :subid("32_1277356887.58177") :method :outer("30_1277356887.58177")
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
.sub "atom"  :subid("33_1277356887.58177") :method :outer("11_1277356887.58177")
.annotate 'line', 3
    .const 'Sub' $P134 = "35_1277356887.58177" 
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
    .const 'Sub' $P134 = "35_1277356887.58177" 
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
.sub "!PREFIX__atom"  :subid("34_1277356887.58177") :method
.annotate 'line', 3
    $P126 = self."!PREFIX__!subrule"("metachar", "")
    new $P127, "ResizablePMCArray"
    push $P127, $P126
    push $P127, ""
    .return ($P127)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block133"  :anon :subid("35_1277356887.58177") :method :outer("33_1277356887.58177")
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
.sub "quantifier"  :subid("36_1277356887.58177") :method
.annotate 'line', 54
    $P139 = self."!protoregex"("quantifier")
    .return ($P139)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier"  :subid("37_1277356887.58177") :method
.annotate 'line', 54
    $P141 = self."!PREFIX__!protoregex"("quantifier")
    .return ($P141)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<*>"  :subid("38_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__quantifier:sym<*>"  :subid("39_1277356887.58177") :method
.annotate 'line', 3
    $P145 = self."!PREFIX__!subrule"("backmod", "*")
    new $P146, "ResizablePMCArray"
    push $P146, $P145
    .return ($P146)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<+>"  :subid("40_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__quantifier:sym<+>"  :subid("41_1277356887.58177") :method
.annotate 'line', 3
    $P152 = self."!PREFIX__!subrule"("backmod", "+")
    new $P153, "ResizablePMCArray"
    push $P153, $P152
    .return ($P153)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<?>"  :subid("42_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__quantifier:sym<?>"  :subid("43_1277356887.58177") :method
.annotate 'line', 3
    $P159 = self."!PREFIX__!subrule"("backmod", "?")
    new $P160, "ResizablePMCArray"
    push $P160, $P159
    .return ($P160)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<**>"  :subid("44_1277356887.58177") :method :outer("11_1277356887.58177")
.annotate 'line', 3
    .local string rx164_tgt
    .local int rx164_pos
    .local int rx164_off
    .local int rx164_eos
    .local int rx164_rep
    .local pmc rx164_cur
    (rx164_cur, rx164_pos, rx164_tgt) = self."!cursor_start"()
    rx164_cur."!cursor_debug"("START ", "quantifier:sym<**>")
    rx164_cur."!cursor_caparray"("max", "normspace")
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
.sub "!PREFIX__quantifier:sym<**>"  :subid("45_1277356887.58177") :method
.annotate 'line', 3
    new $P166, "ResizablePMCArray"
    push $P166, "**"
    .return ($P166)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backmod"  :subid("46_1277356887.58177") :method :outer("11_1277356887.58177")
.annotate 'line', 3
    .const 'Sub' $P188 = "48_1277356887.58177" 
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
    .const 'Sub' $P188 = "48_1277356887.58177" 
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
.sub "!PREFIX__backmod"  :subid("47_1277356887.58177") :method
.annotate 'line', 3
    new $P182, "ResizablePMCArray"
    push $P182, ""
    .return ($P182)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block187"  :anon :subid("48_1277356887.58177") :method :outer("46_1277356887.58177")
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
.sub "metachar"  :subid("49_1277356887.58177") :method
.annotate 'line', 75
    $P192 = self."!protoregex"("metachar")
    .return ($P192)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar"  :subid("50_1277356887.58177") :method
.annotate 'line', 75
    $P194 = self."!PREFIX__!protoregex"("metachar")
    .return ($P194)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<ws>"  :subid("51_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__metachar:sym<ws>"  :subid("52_1277356887.58177") :method
.annotate 'line', 3
    $P198 = self."!PREFIX__!subrule"("normspace", "")
    new $P199, "ResizablePMCArray"
    push $P199, $P198
    .return ($P199)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<[ ]>"  :subid("53_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__metachar:sym<[ ]>"  :subid("54_1277356887.58177") :method
.annotate 'line', 3
    $P204 = self."!PREFIX__!subrule"("nibbler", "[")
    new $P205, "ResizablePMCArray"
    push $P205, $P204
    .return ($P205)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<( )>"  :subid("55_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__metachar:sym<( )>"  :subid("56_1277356887.58177") :method
.annotate 'line', 3
    $P210 = self."!PREFIX__!subrule"("nibbler", "(")
    new $P211, "ResizablePMCArray"
    push $P211, $P210
    .return ($P211)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<'>"  :subid("57_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__metachar:sym<'>"  :subid("58_1277356887.58177") :method
.annotate 'line', 3
    new $P216, "ResizablePMCArray"
    push $P216, "'"
    .return ($P216)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<\">"  :subid("59_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__metachar:sym<\">"  :subid("60_1277356887.58177") :method
.annotate 'line', 3
    new $P221, "ResizablePMCArray"
    push $P221, "\""
    .return ($P221)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<.>"  :subid("61_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__metachar:sym<.>"  :subid("62_1277356887.58177") :method
.annotate 'line', 3
    new $P226, "ResizablePMCArray"
    push $P226, "."
    .return ($P226)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^>"  :subid("63_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__metachar:sym<^>"  :subid("64_1277356887.58177") :method
.annotate 'line', 3
    new $P232, "ResizablePMCArray"
    push $P232, "^"
    .return ($P232)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^^>"  :subid("65_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__metachar:sym<^^>"  :subid("66_1277356887.58177") :method
.annotate 'line', 3
    new $P238, "ResizablePMCArray"
    push $P238, "^^"
    .return ($P238)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$>"  :subid("67_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__metachar:sym<$>"  :subid("68_1277356887.58177") :method
.annotate 'line', 3
    new $P244, "ResizablePMCArray"
    push $P244, "$"
    .return ($P244)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$$>"  :subid("69_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__metachar:sym<$$>"  :subid("70_1277356887.58177") :method
.annotate 'line', 3
    new $P250, "ResizablePMCArray"
    push $P250, "$$"
    .return ($P250)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<:::>"  :subid("71_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__metachar:sym<:::>"  :subid("72_1277356887.58177") :method
.annotate 'line', 3
    $P256 = self."!PREFIX__!subrule"("panic", ":::")
    new $P257, "ResizablePMCArray"
    push $P257, $P256
    .return ($P257)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<::>"  :subid("73_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__metachar:sym<::>"  :subid("74_1277356887.58177") :method
.annotate 'line', 3
    $P263 = self."!PREFIX__!subrule"("panic", "::")
    new $P264, "ResizablePMCArray"
    push $P264, $P263
    .return ($P264)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<lwb>"  :subid("75_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__metachar:sym<lwb>"  :subid("76_1277356887.58177") :method
.annotate 'line', 3
    new $P270, "ResizablePMCArray"
    push $P270, unicode:"\x{ab}"
    push $P270, "<<"
    .return ($P270)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<rwb>"  :subid("77_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__metachar:sym<rwb>"  :subid("78_1277356887.58177") :method
.annotate 'line', 3
    new $P277, "ResizablePMCArray"
    push $P277, unicode:"\x{bb}"
    push $P277, ">>"
    .return ($P277)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<bs>"  :subid("79_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__metachar:sym<bs>"  :subid("80_1277356887.58177") :method
.annotate 'line', 3
    $P284 = self."!PREFIX__!subrule"("backslash", "\\")
    new $P285, "ResizablePMCArray"
    push $P285, $P284
    .return ($P285)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<mod>"  :subid("81_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__metachar:sym<mod>"  :subid("82_1277356887.58177") :method
.annotate 'line', 3
    $P290 = self."!PREFIX__!subrule"("mod_internal", "")
    new $P291, "ResizablePMCArray"
    push $P291, $P290
    .return ($P291)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<~>"  :subid("83_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__metachar:sym<~>"  :subid("84_1277356887.58177") :method
.annotate 'line', 3
    $P296 = self."!PREFIX__!subrule"("ws", "~")
    new $P297, "ResizablePMCArray"
    push $P297, $P296
    .return ($P297)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<{*}>"  :subid("85_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__metachar:sym<{*}>"  :subid("86_1277356887.58177") :method
.annotate 'line', 3
    new $P303, "ResizablePMCArray"
    push $P303, "{*}"
    .return ($P303)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<assert>"  :subid("87_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__metachar:sym<assert>"  :subid("88_1277356887.58177") :method
.annotate 'line', 3
    $P320 = self."!PREFIX__!subrule"("assertion", "<")
    new $P321, "ResizablePMCArray"
    push $P321, $P320
    .return ($P321)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<var>"  :subid("89_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__metachar:sym<var>"  :subid("90_1277356887.58177") :method
.annotate 'line', 3
    new $P327, "ResizablePMCArray"
    push $P327, "$"
    push $P327, "$<"
    .return ($P327)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<PIR>"  :subid("91_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__metachar:sym<PIR>"  :subid("92_1277356887.58177") :method
.annotate 'line', 3
    new $P339, "ResizablePMCArray"
    push $P339, ":PIR{{"
    .return ($P339)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash"  :subid("93_1277356887.58177") :method
.annotate 'line', 122
    $P345 = self."!protoregex"("backslash")
    .return ($P345)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash"  :subid("94_1277356887.58177") :method
.annotate 'line', 122
    $P347 = self."!PREFIX__!protoregex"("backslash")
    .return ($P347)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<w>"  :subid("95_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__backslash:sym<w>"  :subid("96_1277356887.58177") :method
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
.sub "backslash:sym<b>"  :subid("97_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__backslash:sym<b>"  :subid("98_1277356887.58177") :method
.annotate 'line', 3
    new $P357, "ResizablePMCArray"
    push $P357, "B"
    push $P357, "b"
    .return ($P357)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<e>"  :subid("99_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__backslash:sym<e>"  :subid("100_1277356887.58177") :method
.annotate 'line', 3
    new $P363, "ResizablePMCArray"
    push $P363, "E"
    push $P363, "e"
    .return ($P363)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<f>"  :subid("101_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__backslash:sym<f>"  :subid("102_1277356887.58177") :method
.annotate 'line', 3
    new $P369, "ResizablePMCArray"
    push $P369, "F"
    push $P369, "f"
    .return ($P369)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<h>"  :subid("103_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__backslash:sym<h>"  :subid("104_1277356887.58177") :method
.annotate 'line', 3
    new $P375, "ResizablePMCArray"
    push $P375, "H"
    push $P375, "h"
    .return ($P375)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<r>"  :subid("105_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__backslash:sym<r>"  :subid("106_1277356887.58177") :method
.annotate 'line', 3
    new $P381, "ResizablePMCArray"
    push $P381, "R"
    push $P381, "r"
    .return ($P381)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<t>"  :subid("107_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__backslash:sym<t>"  :subid("108_1277356887.58177") :method
.annotate 'line', 3
    new $P387, "ResizablePMCArray"
    push $P387, "T"
    push $P387, "t"
    .return ($P387)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<v>"  :subid("109_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__backslash:sym<v>"  :subid("110_1277356887.58177") :method
.annotate 'line', 3
    new $P393, "ResizablePMCArray"
    push $P393, "V"
    push $P393, "v"
    .return ($P393)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<o>"  :subid("111_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__backslash:sym<o>"  :subid("112_1277356887.58177") :method
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
.sub "backslash:sym<x>"  :subid("113_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__backslash:sym<x>"  :subid("114_1277356887.58177") :method
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
.sub "backslash:sym<c>"  :subid("115_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__backslash:sym<c>"  :subid("116_1277356887.58177") :method
.annotate 'line', 3
    $P421 = self."!PREFIX__!subrule"("charspec", "C")
    $P422 = self."!PREFIX__!subrule"("charspec", "c")
    new $P423, "ResizablePMCArray"
    push $P423, $P421
    push $P423, $P422
    .return ($P423)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<A>"  :subid("117_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__backslash:sym<A>"  :subid("118_1277356887.58177") :method
.annotate 'line', 3
    $P429 = self."!PREFIX__!subrule"("obs", "A")
    new $P430, "ResizablePMCArray"
    push $P430, $P429
    .return ($P430)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<z>"  :subid("119_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__backslash:sym<z>"  :subid("120_1277356887.58177") :method
.annotate 'line', 3
    $P435 = self."!PREFIX__!subrule"("obs", "z")
    new $P436, "ResizablePMCArray"
    push $P436, $P435
    .return ($P436)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Z>"  :subid("121_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__backslash:sym<Z>"  :subid("122_1277356887.58177") :method
.annotate 'line', 3
    $P441 = self."!PREFIX__!subrule"("obs", "Z")
    new $P442, "ResizablePMCArray"
    push $P442, $P441
    .return ($P442)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Q>"  :subid("123_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__backslash:sym<Q>"  :subid("124_1277356887.58177") :method
.annotate 'line', 3
    $P447 = self."!PREFIX__!subrule"("obs", "Q")
    new $P448, "ResizablePMCArray"
    push $P448, $P447
    .return ($P448)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<misc>"  :subid("125_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__backslash:sym<misc>"  :subid("126_1277356887.58177") :method
.annotate 'line', 3
    new $P453, "ResizablePMCArray"
    push $P453, ""
    .return ($P453)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion"  :subid("127_1277356887.58177") :method
.annotate 'line', 140
    $P456 = self."!protoregex"("assertion")
    .return ($P456)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion"  :subid("128_1277356887.58177") :method
.annotate 'line', 140
    $P458 = self."!PREFIX__!protoregex"("assertion")
    .return ($P458)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<?>"  :subid("129_1277356887.58177") :method :outer("11_1277356887.58177")
.annotate 'line', 3
    .const 'Sub' $P467 = "131_1277356887.58177" 
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
    .const 'Sub' $P467 = "131_1277356887.58177" 
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
.sub "!PREFIX__assertion:sym<?>"  :subid("130_1277356887.58177") :method
.annotate 'line', 3
    $P462 = self."!PREFIX__!subrule"("assertion", "?")
    new $P463, "ResizablePMCArray"
    push $P463, $P462
    push $P463, "?"
    .return ($P463)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block466"  :anon :subid("131_1277356887.58177") :method :outer("129_1277356887.58177")
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
.sub "assertion:sym<!>"  :subid("132_1277356887.58177") :method :outer("11_1277356887.58177")
.annotate 'line', 3
    .const 'Sub' $P478 = "134_1277356887.58177" 
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
    .const 'Sub' $P478 = "134_1277356887.58177" 
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
.sub "!PREFIX__assertion:sym<!>"  :subid("133_1277356887.58177") :method
.annotate 'line', 3
    $P473 = self."!PREFIX__!subrule"("assertion", "!")
    new $P474, "ResizablePMCArray"
    push $P474, $P473
    push $P474, "!"
    .return ($P474)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block477"  :anon :subid("134_1277356887.58177") :method :outer("132_1277356887.58177")
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
.sub "assertion:sym<method>"  :subid("135_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__assertion:sym<method>"  :subid("136_1277356887.58177") :method
.annotate 'line', 3
    $P484 = self."!PREFIX__!subrule"("assertion", ".")
    new $P485, "ResizablePMCArray"
    push $P485, $P484
    .return ($P485)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<name>"  :subid("137_1277356887.58177") :method :outer("11_1277356887.58177")
.annotate 'line', 3
    .const 'Sub' $P496 = "139_1277356887.58177" 
    capture_lex $P496
    .local string rx488_tgt
    .local int rx488_pos
    .local int rx488_off
    .local int rx488_eos
    .local int rx488_rep
    .local pmc rx488_cur
    (rx488_cur, rx488_pos, rx488_tgt) = self."!cursor_start"()
    rx488_cur."!cursor_debug"("START ", "assertion:sym<name>")
    rx488_cur."!cursor_caparray"("nibbler", "arglist", "assertion")
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
    .const 'Sub' $P496 = "139_1277356887.58177" 
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
.sub "!PREFIX__assertion:sym<name>"  :subid("138_1277356887.58177") :method
.annotate 'line', 3
    $P490 = self."!PREFIX__!subrule"("identifier", "")
    new $P491, "ResizablePMCArray"
    push $P491, $P490
    .return ($P491)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block495"  :anon :subid("139_1277356887.58177") :method :outer("137_1277356887.58177")
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
.sub "assertion:sym<[>"  :subid("140_1277356887.58177") :method :outer("11_1277356887.58177")
.annotate 'line', 3
    .const 'Sub' $P506 = "142_1277356887.58177" 
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
    .const 'Sub' $P506 = "142_1277356887.58177" 
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
.sub "!PREFIX__assertion:sym<[>"  :subid("141_1277356887.58177") :method
.annotate 'line', 3
    new $P503, "ResizablePMCArray"
    push $P503, ""
    .return ($P503)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block505"  :anon :subid("142_1277356887.58177") :method :outer("140_1277356887.58177")
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
.sub "cclass_elem"  :subid("143_1277356887.58177") :method :outer("11_1277356887.58177")
.annotate 'line', 3
    .const 'Sub' $P524 = "145_1277356887.58177" 
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
    .const 'Sub' $P524 = "145_1277356887.58177" 
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
.sub "!PREFIX__cclass_elem"  :subid("144_1277356887.58177") :method
.annotate 'line', 3
    new $P515, "ResizablePMCArray"
    push $P515, ""
    push $P515, "-"
    push $P515, "+"
    .return ($P515)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block523"  :anon :subid("145_1277356887.58177") :method :outer("143_1277356887.58177")
.annotate 'line', 166
    .const 'Sub' $P539 = "148_1277356887.58177" 
    capture_lex $P539
    .const 'Sub' $P534 = "147_1277356887.58177" 
    capture_lex $P534
    .const 'Sub' $P530 = "146_1277356887.58177" 
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
    .const 'Sub' $P530 = "146_1277356887.58177" 
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
    .const 'Sub' $P534 = "147_1277356887.58177" 
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
    .const 'Sub' $P539 = "148_1277356887.58177" 
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
.sub "_block529"  :anon :subid("146_1277356887.58177") :method :outer("145_1277356887.58177")
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
.sub "_block533"  :anon :subid("147_1277356887.58177") :method :outer("145_1277356887.58177")
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
.sub "_block538"  :anon :subid("148_1277356887.58177") :method :outer("145_1277356887.58177")
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
.sub "mod_internal"  :subid("149_1277356887.58177") :method :outer("11_1277356887.58177")
.annotate 'line', 3
    .const 'Sub' $P556 = "151_1277356887.58177" 
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
    .const 'Sub' $P556 = "151_1277356887.58177" 
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
.sub "!PREFIX__mod_internal"  :subid("150_1277356887.58177") :method
.annotate 'line', 3
    $P550 = self."!PREFIX__!subrule"("mod_ident", ":")
    new $P551, "ResizablePMCArray"
    push $P551, $P550
    push $P551, ":"
    .return ($P551)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block555"  :anon :subid("151_1277356887.58177") :method :outer("149_1277356887.58177")
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
.sub "mod_ident"  :subid("152_1277356887.58177") :method
.annotate 'line', 183
    $P565 = self."!protoregex"("mod_ident")
    .return ($P565)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident"  :subid("153_1277356887.58177") :method
.annotate 'line', 183
    $P567 = self."!PREFIX__!protoregex"("mod_ident")
    .return ($P567)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ignorecase>"  :subid("154_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__mod_ident:sym<ignorecase>"  :subid("155_1277356887.58177") :method
.annotate 'line', 3
    new $P571, "ResizablePMCArray"
    push $P571, "i"
    .return ($P571)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ratchet>"  :subid("156_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__mod_ident:sym<ratchet>"  :subid("157_1277356887.58177") :method
.annotate 'line', 3
    new $P579, "ResizablePMCArray"
    push $P579, "r"
    .return ($P579)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<sigspace>"  :subid("158_1277356887.58177") :method :outer("11_1277356887.58177")
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
.sub "!PREFIX__mod_ident:sym<sigspace>"  :subid("159_1277356887.58177") :method
.annotate 'line', 3
    new $P587, "ResizablePMCArray"
    push $P587, "s"
    .return ($P587)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block592" :load :anon :subid("160_1277356887.58177")
.annotate 'line', 3
    .const 'Sub' $P594 = "11_1277356887.58177" 
    $P595 = $P594()
    .return ($P595)
.end


.namespace []
.sub "_block597" :load :anon :subid("161_1277356887.58177")
.annotate 'line', 1
    .const 'Sub' $P599 = "10_1277356887.58177" 
    $P600 = $P599()
    .return ($P600)
.end

### .include 'gen/p6regex-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1277356890.79584")
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
    .const 'Sub' $P1601 = "91_1277356890.79584" 
    .return ($P1601)
.end


.namespace []
.sub "" :load :init :subid("post92") :outer("10_1277356890.79584")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1277356890.79584" 
    .local pmc block
    set block, $P12
    $P1604 = get_root_global ["parrot"], "P6metaclass"
    $P1604."new_class"("Regex::P6Regex::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block13"  :subid("11_1277356890.79584") :outer("10_1277356890.79584")
.annotate 'line', 4
    .const 'Sub' $P1561 = "89_1277356890.79584" 
    capture_lex $P1561
    .const 'Sub' $P1492 = "85_1277356890.79584" 
    capture_lex $P1492
    .const 'Sub' $P1424 = "83_1277356890.79584" 
    capture_lex $P1424
    .const 'Sub' $P1351 = "80_1277356890.79584" 
    capture_lex $P1351
    .const 'Sub' $P1337 = "79_1277356890.79584" 
    capture_lex $P1337
    .const 'Sub' $P1313 = "78_1277356890.79584" 
    capture_lex $P1313
    .const 'Sub' $P1295 = "77_1277356890.79584" 
    capture_lex $P1295
    .const 'Sub' $P1281 = "76_1277356890.79584" 
    capture_lex $P1281
    .const 'Sub' $P1268 = "75_1277356890.79584" 
    capture_lex $P1268
    .const 'Sub' $P1237 = "74_1277356890.79584" 
    capture_lex $P1237
    .const 'Sub' $P1206 = "73_1277356890.79584" 
    capture_lex $P1206
    .const 'Sub' $P1190 = "72_1277356890.79584" 
    capture_lex $P1190
    .const 'Sub' $P1174 = "71_1277356890.79584" 
    capture_lex $P1174
    .const 'Sub' $P1158 = "70_1277356890.79584" 
    capture_lex $P1158
    .const 'Sub' $P1142 = "69_1277356890.79584" 
    capture_lex $P1142
    .const 'Sub' $P1126 = "68_1277356890.79584" 
    capture_lex $P1126
    .const 'Sub' $P1110 = "67_1277356890.79584" 
    capture_lex $P1110
    .const 'Sub' $P1094 = "66_1277356890.79584" 
    capture_lex $P1094
    .const 'Sub' $P1070 = "65_1277356890.79584" 
    capture_lex $P1070
    .const 'Sub' $P1055 = "64_1277356890.79584" 
    capture_lex $P1055
    .const 'Sub' $P999 = "63_1277356890.79584" 
    capture_lex $P999
    .const 'Sub' $P978 = "62_1277356890.79584" 
    capture_lex $P978
    .const 'Sub' $P956 = "61_1277356890.79584" 
    capture_lex $P956
    .const 'Sub' $P946 = "60_1277356890.79584" 
    capture_lex $P946
    .const 'Sub' $P936 = "59_1277356890.79584" 
    capture_lex $P936
    .const 'Sub' $P926 = "58_1277356890.79584" 
    capture_lex $P926
    .const 'Sub' $P914 = "57_1277356890.79584" 
    capture_lex $P914
    .const 'Sub' $P902 = "56_1277356890.79584" 
    capture_lex $P902
    .const 'Sub' $P890 = "55_1277356890.79584" 
    capture_lex $P890
    .const 'Sub' $P878 = "54_1277356890.79584" 
    capture_lex $P878
    .const 'Sub' $P866 = "53_1277356890.79584" 
    capture_lex $P866
    .const 'Sub' $P854 = "52_1277356890.79584" 
    capture_lex $P854
    .const 'Sub' $P842 = "51_1277356890.79584" 
    capture_lex $P842
    .const 'Sub' $P830 = "50_1277356890.79584" 
    capture_lex $P830
    .const 'Sub' $P807 = "49_1277356890.79584" 
    capture_lex $P807
    .const 'Sub' $P784 = "48_1277356890.79584" 
    capture_lex $P784
    .const 'Sub' $P766 = "47_1277356890.79584" 
    capture_lex $P766
    .const 'Sub' $P756 = "46_1277356890.79584" 
    capture_lex $P756
    .const 'Sub' $P738 = "45_1277356890.79584" 
    capture_lex $P738
    .const 'Sub' $P665 = "43_1277356890.79584" 
    capture_lex $P665
    .const 'Sub' $P648 = "42_1277356890.79584" 
    capture_lex $P648
    .const 'Sub' $P633 = "41_1277356890.79584" 
    capture_lex $P633
    .const 'Sub' $P618 = "40_1277356890.79584" 
    capture_lex $P618
    .const 'Sub' $P592 = "39_1277356890.79584" 
    capture_lex $P592
    .const 'Sub' $P541 = "37_1277356890.79584" 
    capture_lex $P541
    .const 'Sub' $P473 = "35_1277356890.79584" 
    capture_lex $P473
    .const 'Sub' $P418 = "32_1277356890.79584" 
    capture_lex $P418
    .const 'Sub' $P403 = "31_1277356890.79584" 
    capture_lex $P403
    .const 'Sub' $P377 = "29_1277356890.79584" 
    capture_lex $P377
    .const 'Sub' $P360 = "28_1277356890.79584" 
    capture_lex $P360
    .const 'Sub' $P338 = "27_1277356890.79584" 
    capture_lex $P338
    .const 'Sub' $P305 = "26_1277356890.79584" 
    capture_lex $P305
    .const 'Sub' $P50 = "13_1277356890.79584" 
    capture_lex $P50
    .const 'Sub' $P16 = "12_1277356890.79584" 
    capture_lex $P16
    get_global $P15, "@MODIFIERS"
    unless_null $P15, vivify_94
    $P15 = root_new ['parrot';'ResizablePMCArray']
    set_global "@MODIFIERS", $P15
  vivify_94:
.annotate 'line', 494
    .const 'Sub' $P16 = "12_1277356890.79584" 
    newclosure $P49, $P16
    .lex "buildsub", $P49
.annotate 'line', 511
    .const 'Sub' $P50 = "13_1277356890.79584" 
    newclosure $P304, $P50
    .lex "capnames", $P304
.annotate 'line', 577
    .const 'Sub' $P305 = "26_1277356890.79584" 
    newclosure $P337, $P305
    .lex "backmod", $P337
.annotate 'line', 584
    .const 'Sub' $P338 = "27_1277356890.79584" 
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
    .const 'Sub' $P1595 = "90_1277356890.79584" 
    .return ($P1595)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "" :load :init :subid("post93") :outer("11_1277356890.79584")
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
.sub "buildsub"  :subid("12_1277356890.79584") :outer("11_1277356890.79584")
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
.sub "capnames"  :subid("13_1277356890.79584") :outer("11_1277356890.79584")
    .param pmc param_53
    .param pmc param_54
.annotate 'line', 511
    .const 'Sub' $P279 = "24_1277356890.79584" 
    capture_lex $P279
    .const 'Sub' $P216 = "21_1277356890.79584" 
    capture_lex $P216
    .const 'Sub' $P174 = "19_1277356890.79584" 
    capture_lex $P174
    .const 'Sub' $P132 = "17_1277356890.79584" 
    capture_lex $P132
    .const 'Sub' $P65 = "14_1277356890.79584" 
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
    .const 'Sub' $P279 = "24_1277356890.79584" 
    capture_lex $P279
    $P279()
  if_274_end:
    goto if_211_end
  if_211:
.annotate 'line', 549
    .const 'Sub' $P216 = "21_1277356890.79584" 
    capture_lex $P216
    $P216()
  if_211_end:
    goto if_164_end
  if_164:
.annotate 'line', 536
    .const 'Sub' $P174 = "19_1277356890.79584" 
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
    .const 'Sub' $P132 = "17_1277356890.79584" 
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
    .const 'Sub' $P65 = "14_1277356890.79584" 
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
.sub "_block278"  :anon :subid("24_1277356890.79584") :outer("13_1277356890.79584")
.annotate 'line', 566
    .const 'Sub' $P290 = "25_1277356890.79584" 
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
    .const 'Sub' $P290 = "25_1277356890.79584" 
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
.sub "_block289"  :anon :subid("25_1277356890.79584") :outer("24_1277356890.79584")
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
.sub "_block215"  :anon :subid("21_1277356890.79584") :outer("13_1277356890.79584")
.annotate 'line', 549
    .const 'Sub' $P256 = "23_1277356890.79584" 
    capture_lex $P256
    .const 'Sub' $P228 = "22_1277356890.79584" 
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
    .const 'Sub' $P228 = "22_1277356890.79584" 
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
    .const 'Sub' $P256 = "23_1277356890.79584" 
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
.sub "_block227"  :anon :subid("22_1277356890.79584") :outer("21_1277356890.79584")
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
.sub "_block255"  :anon :subid("23_1277356890.79584") :outer("21_1277356890.79584")
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
.sub "_block173"  :anon :subid("19_1277356890.79584") :outer("13_1277356890.79584")
.annotate 'line', 536
    .const 'Sub' $P192 = "20_1277356890.79584" 
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
    .const 'Sub' $P192 = "20_1277356890.79584" 
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
.sub "_block191"  :anon :subid("20_1277356890.79584") :outer("19_1277356890.79584")
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
.sub "_block131"  :anon :subid("17_1277356890.79584") :outer("13_1277356890.79584")
    .param pmc param_134
.annotate 'line', 528
    .const 'Sub' $P143 = "18_1277356890.79584" 
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
    .const 'Sub' $P143 = "18_1277356890.79584" 
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
.sub "_block142"  :anon :subid("18_1277356890.79584") :outer("17_1277356890.79584")
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
.sub "_block64"  :anon :subid("14_1277356890.79584") :outer("13_1277356890.79584")
.annotate 'line', 514
    .const 'Sub' $P74 = "15_1277356890.79584" 
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
    .const 'Sub' $P74 = "15_1277356890.79584" 
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
.sub "_block73"  :anon :subid("15_1277356890.79584") :outer("14_1277356890.79584")
    .param pmc param_76
.annotate 'line', 516
    .const 'Sub' $P85 = "16_1277356890.79584" 
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
    .const 'Sub' $P85 = "16_1277356890.79584" 
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
.sub "_block84"  :anon :subid("16_1277356890.79584") :outer("15_1277356890.79584")
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
.sub "backmod"  :subid("26_1277356890.79584") :outer("11_1277356890.79584")
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
.sub "subrule_alias"  :subid("27_1277356890.79584") :outer("11_1277356890.79584")
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
.sub "arg"  :subid("28_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "arglist"  :subid("29_1277356890.79584") :method :outer("11_1277356890.79584")
    .param pmc param_380
.annotate 'line', 18
    .const 'Sub' $P390 = "30_1277356890.79584" 
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
    .const 'Sub' $P390 = "30_1277356890.79584" 
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
.sub "_block389"  :anon :subid("30_1277356890.79584") :outer("29_1277356890.79584")
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
.sub "TOP"  :subid("31_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "nibbler"  :subid("32_1277356890.79584") :method :outer("11_1277356890.79584")
    .param pmc param_421
    .param pmc param_422 :optional
    .param int has_param_422 :opt_flag
.annotate 'line', 30
    .const 'Sub' $P456 = "34_1277356890.79584" 
    capture_lex $P456
    .const 'Sub' $P430 = "33_1277356890.79584" 
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
    .const 'Sub' $P430 = "33_1277356890.79584" 
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
    .const 'Sub' $P456 = "34_1277356890.79584" 
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
.sub "_block429"  :anon :subid("33_1277356890.79584") :outer("32_1277356890.79584")
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
.sub "_block455"  :anon :subid("34_1277356890.79584") :outer("32_1277356890.79584")
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
.sub "termish"  :subid("35_1277356890.79584") :method :outer("11_1277356890.79584")
    .param pmc param_476
.annotate 'line', 55
    .const 'Sub' $P489 = "36_1277356890.79584" 
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
    .const 'Sub' $P489 = "36_1277356890.79584" 
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
.sub "_block488"  :anon :subid("36_1277356890.79584") :outer("35_1277356890.79584")
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
.sub "quantified_atom"  :subid("37_1277356890.79584") :method :outer("11_1277356890.79584")
    .param pmc param_544
.annotate 'line', 76
    .const 'Sub' $P553 = "38_1277356890.79584" 
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
    .const 'Sub' $P553 = "38_1277356890.79584" 
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
.sub "_block552"  :anon :subid("38_1277356890.79584") :outer("37_1277356890.79584")
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
.sub "atom"  :subid("39_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "quantifier:sym<*>"  :subid("40_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "quantifier:sym<+>"  :subid("41_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "quantifier:sym<?>"  :subid("42_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "quantifier:sym<**>"  :subid("43_1277356890.79584") :method :outer("11_1277356890.79584")
    .param pmc param_668
.annotate 'line', 117
    .const 'Sub' $P683 = "44_1277356890.79584" 
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
    .const 'Sub' $P683 = "44_1277356890.79584" 
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
.sub "_block682"  :anon :subid("44_1277356890.79584") :outer("43_1277356890.79584")
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
.sub "metachar:sym<ws>"  :subid("45_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "metachar:sym<[ ]>"  :subid("46_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "metachar:sym<( )>"  :subid("47_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "metachar:sym<'>"  :subid("48_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "metachar:sym<\">"  :subid("49_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "metachar:sym<.>"  :subid("50_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "metachar:sym<^>"  :subid("51_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "metachar:sym<^^>"  :subid("52_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "metachar:sym<$>"  :subid("53_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "metachar:sym<$$>"  :subid("54_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "metachar:sym<:::>"  :subid("55_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "metachar:sym<lwb>"  :subid("56_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "metachar:sym<rwb>"  :subid("57_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "metachar:sym<bs>"  :subid("58_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "metachar:sym<mod>"  :subid("59_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "metachar:sym<assert>"  :subid("60_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "metachar:sym<~>"  :subid("61_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "metachar:sym<{*}>"  :subid("62_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "metachar:sym<var>"  :subid("63_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "metachar:sym<PIR>"  :subid("64_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "backslash:sym<w>"  :subid("65_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "backslash:sym<b>"  :subid("66_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "backslash:sym<e>"  :subid("67_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "backslash:sym<f>"  :subid("68_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "backslash:sym<h>"  :subid("69_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "backslash:sym<r>"  :subid("70_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "backslash:sym<t>"  :subid("71_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "backslash:sym<v>"  :subid("72_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "backslash:sym<o>"  :subid("73_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "backslash:sym<x>"  :subid("74_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "backslash:sym<c>"  :subid("75_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "backslash:sym<misc>"  :subid("76_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "assertion:sym<?>"  :subid("77_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "assertion:sym<!>"  :subid("78_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "assertion:sym<method>"  :subid("79_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "assertion:sym<name>"  :subid("80_1277356890.79584") :method :outer("11_1277356890.79584")
    .param pmc param_1354
.annotate 'line', 387
    .const 'Sub' $P1412 = "82_1277356890.79584" 
    capture_lex $P1412
    .const 'Sub' $P1376 = "81_1277356890.79584" 
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
    .const 'Sub' $P1412 = "82_1277356890.79584" 
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
    .const 'Sub' $P1376 = "81_1277356890.79584" 
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
.sub "_block1411"  :anon :subid("82_1277356890.79584") :outer("80_1277356890.79584")
    .param pmc param_1413
.annotate 'line', 416
    .lex "$_", param_1413
    find_lex $P1414, "$past"
    find_lex $P1415, "$_"
    $P1416 = $P1414."push"($P1415)
    .return ($P1416)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1375"  :anon :subid("81_1277356890.79584") :outer("80_1277356890.79584")
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
.sub "assertion:sym<[>"  :subid("83_1277356890.79584") :method :outer("11_1277356890.79584")
    .param pmc param_1427
.annotate 'line', 422
    .const 'Sub' $P1462 = "84_1277356890.79584" 
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
    .const 'Sub' $P1462 = "84_1277356890.79584" 
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
.sub "_block1461"  :anon :subid("84_1277356890.79584") :outer("83_1277356890.79584")
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
.sub "cclass_elem"  :subid("85_1277356890.79584") :method :outer("11_1277356890.79584")
    .param pmc param_1495
.annotate 'line', 449
    .const 'Sub' $P1520 = "87_1277356890.79584" 
    capture_lex $P1520
    .const 'Sub' $P1504 = "86_1277356890.79584" 
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
    .const 'Sub' $P1520 = "87_1277356890.79584" 
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
    .const 'Sub' $P1504 = "86_1277356890.79584" 
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
.sub "_block1519"  :anon :subid("87_1277356890.79584") :outer("85_1277356890.79584")
    .param pmc param_1521
.annotate 'line', 456
    .const 'Sub' $P1527 = "88_1277356890.79584" 
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
    .const 'Sub' $P1527 = "88_1277356890.79584" 
    capture_lex $P1527
    $P1540 = $P1527()
    set $P1522, $P1540
  if_1523_end:
.annotate 'line', 456
    .return ($P1522)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1526"  :anon :subid("88_1277356890.79584") :outer("87_1277356890.79584")
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
.sub "_block1503"  :anon :subid("86_1277356890.79584") :outer("85_1277356890.79584")
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
.sub "mod_internal"  :subid("89_1277356890.79584") :method :outer("11_1277356890.79584")
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
.sub "_block1594" :load :anon :subid("90_1277356890.79584")
.annotate 'line', 4
    .const 'Sub' $P1596 = "11_1277356890.79584" 
    $P1597 = $P1596()
    .return ($P1597)
.end


.namespace []
.sub "_block1600" :load :anon :subid("91_1277356890.79584")
.annotate 'line', 1
    .const 'Sub' $P1602 = "10_1277356890.79584" 
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
