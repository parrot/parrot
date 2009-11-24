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
.sub "_block11"  :anon :subid("10_1259078874.10857")
.annotate "line", 0
    get_hll_global $P14, ["Regex";"P6Regex";"Grammar"], "_block13" 
    capture_lex $P14
.annotate "line", 3
    get_hll_global $P14, ["Regex";"P6Regex";"Grammar"], "_block13" 
    capture_lex $P14
    $P592 = $P14()
.annotate "line", 1
    .return ($P592)
.end


.namespace []
.sub "" :load :init :subid("post158") :outer("10_1259078874.10857")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1259078874.10857" 
    .local pmc block
    set block, $P12
    $P593 = get_root_global ["parrot"], "P6metaclass"
    $P593."new_class"("Regex::P6Regex::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block13"  :subid("11_1259078874.10857") :outer("10_1259078874.10857")
.annotate "line", 3
    .const 'Sub' $P584 = "156_1259078874.10857" 
    capture_lex $P584
    .const 'Sub' $P576 = "154_1259078874.10857" 
    capture_lex $P576
    .const 'Sub' $P568 = "152_1259078874.10857" 
    capture_lex $P568
    .const 'Sub' $P546 = "147_1259078874.10857" 
    capture_lex $P546
    .const 'Sub' $P507 = "141_1259078874.10857" 
    capture_lex $P507
    .const 'Sub' $P494 = "138_1259078874.10857" 
    capture_lex $P494
    .const 'Sub' $P480 = "135_1259078874.10857" 
    capture_lex $P480
    .const 'Sub' $P474 = "133_1259078874.10857" 
    capture_lex $P474
    .const 'Sub' $P462 = "130_1259078874.10857" 
    capture_lex $P462
    .const 'Sub' $P450 = "127_1259078874.10857" 
    capture_lex $P450
    .const 'Sub' $P441 = "123_1259078874.10857" 
    capture_lex $P441
    .const 'Sub' $P435 = "121_1259078874.10857" 
    capture_lex $P435
    .const 'Sub' $P429 = "119_1259078874.10857" 
    capture_lex $P429
    .const 'Sub' $P423 = "117_1259078874.10857" 
    capture_lex $P423
    .const 'Sub' $P417 = "115_1259078874.10857" 
    capture_lex $P417
    .const 'Sub' $P406 = "113_1259078874.10857" 
    capture_lex $P406
    .const 'Sub' $P395 = "111_1259078874.10857" 
    capture_lex $P395
    .const 'Sub' $P387 = "109_1259078874.10857" 
    capture_lex $P387
    .const 'Sub' $P381 = "107_1259078874.10857" 
    capture_lex $P381
    .const 'Sub' $P375 = "105_1259078874.10857" 
    capture_lex $P375
    .const 'Sub' $P369 = "103_1259078874.10857" 
    capture_lex $P369
    .const 'Sub' $P363 = "101_1259078874.10857" 
    capture_lex $P363
    .const 'Sub' $P357 = "99_1259078874.10857" 
    capture_lex $P357
    .const 'Sub' $P351 = "97_1259078874.10857" 
    capture_lex $P351
    .const 'Sub' $P345 = "95_1259078874.10857" 
    capture_lex $P345
    .const 'Sub' $P339 = "93_1259078874.10857" 
    capture_lex $P339
    .const 'Sub' $P327 = "89_1259078874.10857" 
    capture_lex $P327
    .const 'Sub' $P315 = "87_1259078874.10857" 
    capture_lex $P315
    .const 'Sub' $P308 = "85_1259078874.10857" 
    capture_lex $P308
    .const 'Sub' $P291 = "83_1259078874.10857" 
    capture_lex $P291
    .const 'Sub' $P284 = "81_1259078874.10857" 
    capture_lex $P284
    .const 'Sub' $P278 = "79_1259078874.10857" 
    capture_lex $P278
    .const 'Sub' $P272 = "77_1259078874.10857" 
    capture_lex $P272
    .const 'Sub' $P265 = "75_1259078874.10857" 
    capture_lex $P265
    .const 'Sub' $P258 = "73_1259078874.10857" 
    capture_lex $P258
    .const 'Sub' $P251 = "71_1259078874.10857" 
    capture_lex $P251
    .const 'Sub' $P244 = "69_1259078874.10857" 
    capture_lex $P244
    .const 'Sub' $P238 = "67_1259078874.10857" 
    capture_lex $P238
    .const 'Sub' $P232 = "65_1259078874.10857" 
    capture_lex $P232
    .const 'Sub' $P226 = "63_1259078874.10857" 
    capture_lex $P226
    .const 'Sub' $P220 = "61_1259078874.10857" 
    capture_lex $P220
    .const 'Sub' $P214 = "59_1259078874.10857" 
    capture_lex $P214
    .const 'Sub' $P209 = "57_1259078874.10857" 
    capture_lex $P209
    .const 'Sub' $P204 = "55_1259078874.10857" 
    capture_lex $P204
    .const 'Sub' $P198 = "53_1259078874.10857" 
    capture_lex $P198
    .const 'Sub' $P192 = "51_1259078874.10857" 
    capture_lex $P192
    .const 'Sub' $P186 = "49_1259078874.10857" 
    capture_lex $P186
    .const 'Sub' $P169 = "44_1259078874.10857" 
    capture_lex $P169
    .const 'Sub' $P157 = "42_1259078874.10857" 
    capture_lex $P157
    .const 'Sub' $P150 = "40_1259078874.10857" 
    capture_lex $P150
    .const 'Sub' $P143 = "38_1259078874.10857" 
    capture_lex $P143
    .const 'Sub' $P136 = "36_1259078874.10857" 
    capture_lex $P136
    .const 'Sub' $P116 = "31_1259078874.10857" 
    capture_lex $P116
    .const 'Sub' $P102 = "28_1259078874.10857" 
    capture_lex $P102
    .const 'Sub' $P95 = "26_1259078874.10857" 
    capture_lex $P95
    .const 'Sub' $P83 = "24_1259078874.10857" 
    capture_lex $P83
    .const 'Sub' $P76 = "22_1259078874.10857" 
    capture_lex $P76
    .const 'Sub' $P64 = "20_1259078874.10857" 
    capture_lex $P64
    .const 'Sub' $P57 = "18_1259078874.10857" 
    capture_lex $P57
    .const 'Sub' $P46 = "15_1259078874.10857" 
    capture_lex $P46
    .const 'Sub' $P38 = "13_1259078874.10857" 
    capture_lex $P38
    .const 'Sub' $P15 = "12_1259078874.10857" 
    capture_lex $P15
    .const 'Sub' $P584 = "156_1259078874.10857" 
    capture_lex $P584
    .return ($P584)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "obs"  :subid("12_1259078874.10857") :method :outer("11_1259078874.10857")
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
.sub "ws"  :subid("13_1259078874.10857") :method :outer("11_1259078874.10857")
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
.sub "!PREFIX__ws"  :subid("14_1259078874.10857") :method
.annotate "line", 3
    new $P41, "ResizablePMCArray"
    push $P41, ""
    .return ($P41)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "normspace"  :subid("15_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
    .const 'Sub' $P52 = "17_1259078874.10857" 
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
    .const 'Sub' $P52 = "17_1259078874.10857" 
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
.sub "!PREFIX__normspace"  :subid("16_1259078874.10857") :method
.annotate "line", 3
    new $P49, "ResizablePMCArray"
    push $P49, ""
    .return ($P49)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block51"  :anon :subid("17_1259078874.10857") :method :outer("15_1259078874.10857")
.annotate "line", 10
    .lex unicode:"$\x{a2}", $P53
    .local string rx54_tgt
    .local int rx54_pos
    .local int rx54_off
    .local int rx54_eos
    .local int rx54_rep
    .local pmc rx54_cur
    (rx54_cur, rx54_pos, rx54_tgt) = self."!cursor_start"()
    rx54_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx54_cur
    .local pmc match
    .lex "$/", match
    length rx54_eos, rx54_tgt
    set rx54_off, 0
    lt rx54_pos, 2, rx54_start
    sub rx54_off, rx54_pos, 1
    substr rx54_tgt, rx54_tgt, rx54_off
  rx54_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan55_done
    goto rxscan55_scan
  rxscan55_loop:
    ($P10) = rx54_cur."from"()
    inc $P10
    set rx54_pos, $P10
    ge rx54_pos, rx54_eos, rxscan55_done
  rxscan55_scan:
    set_addr $I10, rxscan55_loop
    rx54_cur."!mark_push"(0, rx54_pos, $I10)
  rxscan55_done:
  alt56_0:
    set_addr $I10, alt56_1
    rx54_cur."!mark_push"(0, rx54_pos, $I10)
  # rx charclass s
    ge rx54_pos, rx54_eos, rx54_fail
    sub $I10, rx54_pos, rx54_off
    is_cclass $I11, 32, rx54_tgt, $I10
    unless $I11, rx54_fail
    inc rx54_pos
    goto alt56_end
  alt56_1:
  # rx literal  "#"
    add $I11, rx54_pos, 1
    gt $I11, rx54_eos, rx54_fail
    sub $I11, rx54_pos, rx54_off
    substr $S10, rx54_tgt, $I11, 1
    ne $S10, "#", rx54_fail
    add rx54_pos, 1
  alt56_end:
  # rx pass
    rx54_cur."!cursor_pass"(rx54_pos, "")
    rx54_cur."!cursor_debug"("PASS  ", "", " at pos=", rx54_pos)
    .return (rx54_cur)
  rx54_fail:
    (rx54_rep, rx54_pos, $I10, $P10) = rx54_cur."!mark_fail"(0)
    lt rx54_pos, -1, rx54_done
    eq rx54_pos, -1, rx54_fail
    jump $I10
  rx54_done:
    rx54_cur."!cursor_fail"()
    rx54_cur."!cursor_debug"("FAIL  ", "")
    .return (rx54_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "arg"  :subid("18_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
    .local string rx58_tgt
    .local int rx58_pos
    .local int rx58_off
    .local int rx58_eos
    .local int rx58_rep
    .local pmc rx58_cur
    (rx58_cur, rx58_pos, rx58_tgt) = self."!cursor_start"()
    rx58_cur."!cursor_debug"("START ", "arg")
    .lex unicode:"$\x{a2}", rx58_cur
    .local pmc match
    .lex "$/", match
    length rx58_eos, rx58_tgt
    set rx58_off, 0
    lt rx58_pos, 2, rx58_start
    sub rx58_off, rx58_pos, 1
    substr rx58_tgt, rx58_tgt, rx58_off
  rx58_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan61_done
    goto rxscan61_scan
  rxscan61_loop:
    ($P10) = rx58_cur."from"()
    inc $P10
    set rx58_pos, $P10
    ge rx58_pos, rx58_eos, rxscan61_done
  rxscan61_scan:
    set_addr $I10, rxscan61_loop
    rx58_cur."!mark_push"(0, rx58_pos, $I10)
  rxscan61_done:
  alt62_0:
.annotate "line", 13
    set_addr $I10, alt62_1
    rx58_cur."!mark_push"(0, rx58_pos, $I10)
.annotate "line", 14
  # rx enumcharlist negate=0 zerowidth
    ge rx58_pos, rx58_eos, rx58_fail
    sub $I10, rx58_pos, rx58_off
    substr $S10, rx58_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx58_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx58_cur."!cursor_pos"(rx58_pos)
    $P10 = rx58_cur."quote_EXPR"(":q")
    unless $P10, rx58_fail
    rx58_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx58_pos = $P10."pos"()
    goto alt62_end
  alt62_1:
    set_addr $I10, alt62_2
    rx58_cur."!mark_push"(0, rx58_pos, $I10)
.annotate "line", 15
  # rx enumcharlist negate=0 zerowidth
    ge rx58_pos, rx58_eos, rx58_fail
    sub $I10, rx58_pos, rx58_off
    substr $S10, rx58_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx58_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx58_cur."!cursor_pos"(rx58_pos)
    $P10 = rx58_cur."quote_EXPR"(":qq")
    unless $P10, rx58_fail
    rx58_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx58_pos = $P10."pos"()
    goto alt62_end
  alt62_2:
.annotate "line", 16
  # rx subcapture "val"
    set_addr $I10, rxcap_63_fail
    rx58_cur."!mark_push"(0, rx58_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx58_pos, rx58_off
    find_not_cclass $I11, 8, rx58_tgt, $I10, rx58_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx58_fail
    add rx58_pos, rx58_off, $I11
    set_addr $I10, rxcap_63_fail
    ($I12, $I11) = rx58_cur."!mark_peek"($I10)
    rx58_cur."!cursor_pos"($I11)
    ($P10) = rx58_cur."!cursor_start"()
    $P10."!cursor_pass"(rx58_pos, "")
    rx58_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("val")
    goto rxcap_63_done
  rxcap_63_fail:
    goto rx58_fail
  rxcap_63_done:
  alt62_end:
.annotate "line", 12
  # rx pass
    rx58_cur."!cursor_pass"(rx58_pos, "arg")
    rx58_cur."!cursor_debug"("PASS  ", "arg", " at pos=", rx58_pos)
    .return (rx58_cur)
  rx58_fail:
.annotate "line", 3
    (rx58_rep, rx58_pos, $I10, $P10) = rx58_cur."!mark_fail"(0)
    lt rx58_pos, -1, rx58_done
    eq rx58_pos, -1, rx58_fail
    jump $I10
  rx58_done:
    rx58_cur."!cursor_fail"()
    rx58_cur."!cursor_debug"("FAIL  ", "arg")
    .return (rx58_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__arg"  :subid("19_1259078874.10857") :method
.annotate "line", 3
    new $P60, "ResizablePMCArray"
    push $P60, ""
    push $P60, "\""
    push $P60, "'"
    .return ($P60)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "arglist"  :subid("20_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
    .local string rx65_tgt
    .local int rx65_pos
    .local int rx65_off
    .local int rx65_eos
    .local int rx65_rep
    .local pmc rx65_cur
    (rx65_cur, rx65_pos, rx65_tgt) = self."!cursor_start"()
    rx65_cur."!cursor_debug"("START ", "arglist")
    rx65_cur."!cursor_caparray"("arg")
    .lex unicode:"$\x{a2}", rx65_cur
    .local pmc match
    .lex "$/", match
    length rx65_eos, rx65_tgt
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
.annotate "line", 20
  # rx subrule "ws" subtype=method negate=
    rx65_cur."!cursor_pos"(rx65_pos)
    $P10 = rx65_cur."ws"()
    unless $P10, rx65_fail
    rx65_pos = $P10."pos"()
  # rx subrule "arg" subtype=capture negate=
    rx65_cur."!cursor_pos"(rx65_pos)
    $P10 = rx65_cur."arg"()
    unless $P10, rx65_fail
    rx65_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arg")
    rx65_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx65_cur."!cursor_pos"(rx65_pos)
    $P10 = rx65_cur."ws"()
    unless $P10, rx65_fail
    rx65_pos = $P10."pos"()
  # rx rxquantr71 ** 0..*
    set_addr $I74, rxquantr71_done
    rx65_cur."!mark_push"(0, rx65_pos, $I74)
  rxquantr71_loop:
  # rx subrule "ws" subtype=method negate=
    rx65_cur."!cursor_pos"(rx65_pos)
    $P10 = rx65_cur."ws"()
    unless $P10, rx65_fail
    rx65_pos = $P10."pos"()
  # rx literal  ","
    add $I11, rx65_pos, 1
    gt $I11, rx65_eos, rx65_fail
    sub $I11, rx65_pos, rx65_off
    substr $S10, rx65_tgt, $I11, 1
    ne $S10, ",", rx65_fail
    add rx65_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx65_cur."!cursor_pos"(rx65_pos)
    $P10 = rx65_cur."ws"()
    unless $P10, rx65_fail
    rx65_pos = $P10."pos"()
  # rx subrule "arg" subtype=capture negate=
    rx65_cur."!cursor_pos"(rx65_pos)
    $P10 = rx65_cur."arg"()
    unless $P10, rx65_fail
    rx65_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arg")
    rx65_pos = $P10."pos"()
    (rx65_rep) = rx65_cur."!mark_commit"($I74)
    rx65_cur."!mark_push"(rx65_rep, rx65_pos, $I74)
    goto rxquantr71_loop
  rxquantr71_done:
  # rx subrule "ws" subtype=method negate=
    rx65_cur."!cursor_pos"(rx65_pos)
    $P10 = rx65_cur."ws"()
    unless $P10, rx65_fail
    rx65_pos = $P10."pos"()
  # rx pass
    rx65_cur."!cursor_pass"(rx65_pos, "arglist")
    rx65_cur."!cursor_debug"("PASS  ", "arglist", " at pos=", rx65_pos)
    .return (rx65_cur)
  rx65_fail:
.annotate "line", 3
    (rx65_rep, rx65_pos, $I10, $P10) = rx65_cur."!mark_fail"(0)
    lt rx65_pos, -1, rx65_done
    eq rx65_pos, -1, rx65_fail
    jump $I10
  rx65_done:
    rx65_cur."!cursor_fail"()
    rx65_cur."!cursor_debug"("FAIL  ", "arglist")
    .return (rx65_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__arglist"  :subid("21_1259078874.10857") :method
.annotate "line", 3
    new $P67, "ResizablePMCArray"
    push $P67, ""
    .return ($P67)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "TOP"  :subid("22_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 23
  # rx subrule "nibbler" subtype=capture negate=
    rx77_cur."!cursor_pos"(rx77_pos)
    $P10 = rx77_cur."nibbler"()
    unless $P10, rx77_fail
    rx77_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx77_pos = $P10."pos"()
  alt82_0:
.annotate "line", 24
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
.annotate "line", 22
  # rx pass
    rx77_cur."!cursor_pass"(rx77_pos, "TOP")
    rx77_cur."!cursor_debug"("PASS  ", "TOP", " at pos=", rx77_pos)
    .return (rx77_cur)
  rx77_fail:
.annotate "line", 3
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
.sub "!PREFIX__TOP"  :subid("23_1259078874.10857") :method
.annotate "line", 3
    $P79 = self."!PREFIX__!subrule"("nibbler", "")
    new $P80, "ResizablePMCArray"
    push $P80, $P79
    .return ($P80)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "nibbler"  :subid("24_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 28
  # rx reduce name="nibbler" key="open"
    rx84_cur."!cursor_pos"(rx84_pos)
    rx84_cur."!reduce"("nibbler", "open")
.annotate "line", 29
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
.annotate "line", 30
  # rx subrule "termish" subtype=capture negate=
    rx84_cur."!cursor_pos"(rx84_pos)
    $P10 = rx84_cur."termish"()
    unless $P10, rx84_fail
    rx84_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("termish")
    rx84_pos = $P10."pos"()
.annotate "line", 33
  # rx rxquantr91 ** 0..*
    set_addr $I94, rxquantr91_done
    rx84_cur."!mark_push"(0, rx84_pos, $I94)
  rxquantr91_loop:
  alt92_0:
.annotate "line", 31
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
.annotate "line", 32
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
.annotate "line", 33
    (rx84_rep) = rx84_cur."!mark_commit"($I94)
    rx84_cur."!mark_push"(rx84_rep, rx84_pos, $I94)
    goto rxquantr91_loop
  rxquantr91_done:
.annotate "line", 27
  # rx pass
    rx84_cur."!cursor_pass"(rx84_pos, "nibbler")
    rx84_cur."!cursor_debug"("PASS  ", "nibbler", " at pos=", rx84_pos)
    .return (rx84_cur)
  rx84_fail:
.annotate "line", 3
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
.sub "!PREFIX__nibbler"  :subid("25_1259078874.10857") :method
.annotate "line", 3
    new $P86, "ResizablePMCArray"
    push $P86, ""
    .return ($P86)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "termish"  :subid("26_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 37
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
.annotate "line", 36
  # rx pass
    rx96_cur."!cursor_pass"(rx96_pos, "termish")
    rx96_cur."!cursor_debug"("PASS  ", "termish", " at pos=", rx96_pos)
    .return (rx96_cur)
  rx96_fail:
.annotate "line", 3
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
.sub "!PREFIX__termish"  :subid("27_1259078874.10857") :method
.annotate "line", 3
    new $P98, "ResizablePMCArray"
    push $P98, ""
    .return ($P98)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantified_atom"  :subid("28_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
    .const 'Sub' $P111 = "30_1259078874.10857" 
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
.annotate "line", 41
  # rx subrule "atom" subtype=capture negate=
    rx103_cur."!cursor_pos"(rx103_pos)
    $P10 = rx103_cur."atom"()
    unless $P10, rx103_fail
    rx103_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("atom")
    rx103_pos = $P10."pos"()
  # rx rxquantr108 ** 0..1
    set_addr $I115, rxquantr108_done
    rx103_cur."!mark_push"(0, rx103_pos, $I115)
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
    .const 'Sub' $P111 = "30_1259078874.10857" 
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
    (rx103_rep) = rx103_cur."!mark_commit"($I115)
  rxquantr108_done:
.annotate "line", 40
  # rx pass
    rx103_cur."!cursor_pass"(rx103_pos, "quantified_atom")
    rx103_cur."!cursor_debug"("PASS  ", "quantified_atom", " at pos=", rx103_pos)
    .return (rx103_cur)
  rx103_fail:
.annotate "line", 3
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
.sub "!PREFIX__quantified_atom"  :subid("29_1259078874.10857") :method
.annotate "line", 3
    $P105 = self."!PREFIX__!subrule"("atom", "")
    new $P106, "ResizablePMCArray"
    push $P106, $P105
    .return ($P106)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block110"  :anon :subid("30_1259078874.10857") :method :outer("28_1259078874.10857")
.annotate "line", 41
    .lex unicode:"$\x{a2}", $P112
    .local string rx113_tgt
    .local int rx113_pos
    .local int rx113_off
    .local int rx113_eos
    .local int rx113_rep
    .local pmc rx113_cur
    (rx113_cur, rx113_pos, rx113_tgt) = self."!cursor_start"()
    rx113_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx113_cur
    .local pmc match
    .lex "$/", match
    length rx113_eos, rx113_tgt
    set rx113_off, 0
    lt rx113_pos, 2, rx113_start
    sub rx113_off, rx113_pos, 1
    substr rx113_tgt, rx113_tgt, rx113_off
  rx113_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan114_done
    goto rxscan114_scan
  rxscan114_loop:
    ($P10) = rx113_cur."from"()
    inc $P10
    set rx113_pos, $P10
    ge rx113_pos, rx113_eos, rxscan114_done
  rxscan114_scan:
    set_addr $I10, rxscan114_loop
    rx113_cur."!mark_push"(0, rx113_pos, $I10)
  rxscan114_done:
  # rx literal  ":"
    add $I11, rx113_pos, 1
    gt $I11, rx113_eos, rx113_fail
    sub $I11, rx113_pos, rx113_off
    substr $S10, rx113_tgt, $I11, 1
    ne $S10, ":", rx113_fail
    add rx113_pos, 1
  # rx pass
    rx113_cur."!cursor_pass"(rx113_pos, "")
    rx113_cur."!cursor_debug"("PASS  ", "", " at pos=", rx113_pos)
    .return (rx113_cur)
  rx113_fail:
    (rx113_rep, rx113_pos, $I10, $P10) = rx113_cur."!mark_fail"(0)
    lt rx113_pos, -1, rx113_done
    eq rx113_pos, -1, rx113_fail
    jump $I10
  rx113_done:
    rx113_cur."!cursor_fail"()
    rx113_cur."!cursor_debug"("FAIL  ", "")
    .return (rx113_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "atom"  :subid("31_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
    .const 'Sub' $P127 = "33_1259078874.10857" 
    capture_lex $P127
    .local string rx117_tgt
    .local int rx117_pos
    .local int rx117_off
    .local int rx117_eos
    .local int rx117_rep
    .local pmc rx117_cur
    (rx117_cur, rx117_pos, rx117_tgt) = self."!cursor_start"()
    rx117_cur."!cursor_debug"("START ", "atom")
    .lex unicode:"$\x{a2}", rx117_cur
    .local pmc match
    .lex "$/", match
    length rx117_eos, rx117_tgt
    set rx117_off, 0
    lt rx117_pos, 2, rx117_start
    sub rx117_off, rx117_pos, 1
    substr rx117_tgt, rx117_tgt, rx117_off
  rx117_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan121_done
    goto rxscan121_scan
  rxscan121_loop:
    ($P10) = rx117_cur."from"()
    inc $P10
    set rx117_pos, $P10
    ge rx117_pos, rx117_eos, rxscan121_done
  rxscan121_scan:
    set_addr $I10, rxscan121_loop
    rx117_cur."!mark_push"(0, rx117_pos, $I10)
  rxscan121_done:
  alt122_0:
.annotate "line", 46
    set_addr $I10, alt122_1
    rx117_cur."!mark_push"(0, rx117_pos, $I10)
.annotate "line", 47
  # rx charclass w
    ge rx117_pos, rx117_eos, rx117_fail
    sub $I10, rx117_pos, rx117_off
    is_cclass $I11, 8192, rx117_tgt, $I10
    unless $I11, rx117_fail
    inc rx117_pos
  # rx rxquantr123 ** 0..1
    set_addr $I131, rxquantr123_done
    rx117_cur."!mark_push"(0, rx117_pos, $I131)
  rxquantr123_loop:
  # rx rxquantg124 ** 1..*
    set_addr $I125, rxquantg124_done
  rxquantg124_loop:
  # rx charclass w
    ge rx117_pos, rx117_eos, rx117_fail
    sub $I10, rx117_pos, rx117_off
    is_cclass $I11, 8192, rx117_tgt, $I10
    unless $I11, rx117_fail
    inc rx117_pos
    rx117_cur."!mark_push"(rx117_rep, rx117_pos, $I125)
    goto rxquantg124_loop
  rxquantg124_done:
  # rx subrule "before" subtype=zerowidth negate=
    rx117_cur."!cursor_pos"(rx117_pos)
    .const 'Sub' $P127 = "33_1259078874.10857" 
    capture_lex $P127
    $P10 = rx117_cur."before"($P127)
    unless $P10, rx117_fail
    (rx117_rep) = rx117_cur."!mark_commit"($I131)
  rxquantr123_done:
    goto alt122_end
  alt122_1:
.annotate "line", 48
  # rx subrule "metachar" subtype=capture negate=
    rx117_cur."!cursor_pos"(rx117_pos)
    $P10 = rx117_cur."metachar"()
    unless $P10, rx117_fail
    rx117_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("metachar")
    rx117_pos = $P10."pos"()
  alt122_end:
.annotate "line", 44
  # rx pass
    rx117_cur."!cursor_pass"(rx117_pos, "atom")
    rx117_cur."!cursor_debug"("PASS  ", "atom", " at pos=", rx117_pos)
    .return (rx117_cur)
  rx117_fail:
.annotate "line", 3
    (rx117_rep, rx117_pos, $I10, $P10) = rx117_cur."!mark_fail"(0)
    lt rx117_pos, -1, rx117_done
    eq rx117_pos, -1, rx117_fail
    jump $I10
  rx117_done:
    rx117_cur."!cursor_fail"()
    rx117_cur."!cursor_debug"("FAIL  ", "atom")
    .return (rx117_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__atom"  :subid("32_1259078874.10857") :method
.annotate "line", 3
    $P119 = self."!PREFIX__!subrule"("metachar", "")
    new $P120, "ResizablePMCArray"
    push $P120, $P119
    push $P120, ""
    .return ($P120)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block126"  :anon :subid("33_1259078874.10857") :method :outer("31_1259078874.10857")
.annotate "line", 47
    .lex unicode:"$\x{a2}", $P128
    .local string rx129_tgt
    .local int rx129_pos
    .local int rx129_off
    .local int rx129_eos
    .local int rx129_rep
    .local pmc rx129_cur
    (rx129_cur, rx129_pos, rx129_tgt) = self."!cursor_start"()
    rx129_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx129_cur
    .local pmc match
    .lex "$/", match
    length rx129_eos, rx129_tgt
    set rx129_off, 0
    lt rx129_pos, 2, rx129_start
    sub rx129_off, rx129_pos, 1
    substr rx129_tgt, rx129_tgt, rx129_off
  rx129_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan130_done
    goto rxscan130_scan
  rxscan130_loop:
    ($P10) = rx129_cur."from"()
    inc $P10
    set rx129_pos, $P10
    ge rx129_pos, rx129_eos, rxscan130_done
  rxscan130_scan:
    set_addr $I10, rxscan130_loop
    rx129_cur."!mark_push"(0, rx129_pos, $I10)
  rxscan130_done:
  # rx charclass w
    ge rx129_pos, rx129_eos, rx129_fail
    sub $I10, rx129_pos, rx129_off
    is_cclass $I11, 8192, rx129_tgt, $I10
    unless $I11, rx129_fail
    inc rx129_pos
  # rx pass
    rx129_cur."!cursor_pass"(rx129_pos, "")
    rx129_cur."!cursor_debug"("PASS  ", "", " at pos=", rx129_pos)
    .return (rx129_cur)
  rx129_fail:
    (rx129_rep, rx129_pos, $I10, $P10) = rx129_cur."!mark_fail"(0)
    lt rx129_pos, -1, rx129_done
    eq rx129_pos, -1, rx129_fail
    jump $I10
  rx129_done:
    rx129_cur."!cursor_fail"()
    rx129_cur."!cursor_debug"("FAIL  ", "")
    .return (rx129_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier"  :subid("34_1259078874.10857") :method
.annotate "line", 52
    $P133 = self."!protoregex"("quantifier")
    .return ($P133)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier"  :subid("35_1259078874.10857") :method
.annotate "line", 52
    $P135 = self."!PREFIX__!protoregex"("quantifier")
    .return ($P135)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<*>"  :subid("36_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
    .local string rx137_tgt
    .local int rx137_pos
    .local int rx137_off
    .local int rx137_eos
    .local int rx137_rep
    .local pmc rx137_cur
    (rx137_cur, rx137_pos, rx137_tgt) = self."!cursor_start"()
    rx137_cur."!cursor_debug"("START ", "quantifier:sym<*>")
    .lex unicode:"$\x{a2}", rx137_cur
    .local pmc match
    .lex "$/", match
    length rx137_eos, rx137_tgt
    set rx137_off, 0
    lt rx137_pos, 2, rx137_start
    sub rx137_off, rx137_pos, 1
    substr rx137_tgt, rx137_tgt, rx137_off
  rx137_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan141_done
    goto rxscan141_scan
  rxscan141_loop:
    ($P10) = rx137_cur."from"()
    inc $P10
    set rx137_pos, $P10
    ge rx137_pos, rx137_eos, rxscan141_done
  rxscan141_scan:
    set_addr $I10, rxscan141_loop
    rx137_cur."!mark_push"(0, rx137_pos, $I10)
  rxscan141_done:
.annotate "line", 53
  # rx subcapture "sym"
    set_addr $I10, rxcap_142_fail
    rx137_cur."!mark_push"(0, rx137_pos, $I10)
  # rx literal  "*"
    add $I11, rx137_pos, 1
    gt $I11, rx137_eos, rx137_fail
    sub $I11, rx137_pos, rx137_off
    substr $S10, rx137_tgt, $I11, 1
    ne $S10, "*", rx137_fail
    add rx137_pos, 1
    set_addr $I10, rxcap_142_fail
    ($I12, $I11) = rx137_cur."!mark_peek"($I10)
    rx137_cur."!cursor_pos"($I11)
    ($P10) = rx137_cur."!cursor_start"()
    $P10."!cursor_pass"(rx137_pos, "")
    rx137_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_142_done
  rxcap_142_fail:
    goto rx137_fail
  rxcap_142_done:
  # rx subrule "backmod" subtype=capture negate=
    rx137_cur."!cursor_pos"(rx137_pos)
    $P10 = rx137_cur."backmod"()
    unless $P10, rx137_fail
    rx137_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx137_pos = $P10."pos"()
  # rx pass
    rx137_cur."!cursor_pass"(rx137_pos, "quantifier:sym<*>")
    rx137_cur."!cursor_debug"("PASS  ", "quantifier:sym<*>", " at pos=", rx137_pos)
    .return (rx137_cur)
  rx137_fail:
.annotate "line", 3
    (rx137_rep, rx137_pos, $I10, $P10) = rx137_cur."!mark_fail"(0)
    lt rx137_pos, -1, rx137_done
    eq rx137_pos, -1, rx137_fail
    jump $I10
  rx137_done:
    rx137_cur."!cursor_fail"()
    rx137_cur."!cursor_debug"("FAIL  ", "quantifier:sym<*>")
    .return (rx137_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<*>"  :subid("37_1259078874.10857") :method
.annotate "line", 3
    $P139 = self."!PREFIX__!subrule"("backmod", "*")
    new $P140, "ResizablePMCArray"
    push $P140, $P139
    .return ($P140)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<+>"  :subid("38_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
    .local string rx144_tgt
    .local int rx144_pos
    .local int rx144_off
    .local int rx144_eos
    .local int rx144_rep
    .local pmc rx144_cur
    (rx144_cur, rx144_pos, rx144_tgt) = self."!cursor_start"()
    rx144_cur."!cursor_debug"("START ", "quantifier:sym<+>")
    .lex unicode:"$\x{a2}", rx144_cur
    .local pmc match
    .lex "$/", match
    length rx144_eos, rx144_tgt
    set rx144_off, 0
    lt rx144_pos, 2, rx144_start
    sub rx144_off, rx144_pos, 1
    substr rx144_tgt, rx144_tgt, rx144_off
  rx144_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan148_done
    goto rxscan148_scan
  rxscan148_loop:
    ($P10) = rx144_cur."from"()
    inc $P10
    set rx144_pos, $P10
    ge rx144_pos, rx144_eos, rxscan148_done
  rxscan148_scan:
    set_addr $I10, rxscan148_loop
    rx144_cur."!mark_push"(0, rx144_pos, $I10)
  rxscan148_done:
.annotate "line", 54
  # rx subcapture "sym"
    set_addr $I10, rxcap_149_fail
    rx144_cur."!mark_push"(0, rx144_pos, $I10)
  # rx literal  "+"
    add $I11, rx144_pos, 1
    gt $I11, rx144_eos, rx144_fail
    sub $I11, rx144_pos, rx144_off
    substr $S10, rx144_tgt, $I11, 1
    ne $S10, "+", rx144_fail
    add rx144_pos, 1
    set_addr $I10, rxcap_149_fail
    ($I12, $I11) = rx144_cur."!mark_peek"($I10)
    rx144_cur."!cursor_pos"($I11)
    ($P10) = rx144_cur."!cursor_start"()
    $P10."!cursor_pass"(rx144_pos, "")
    rx144_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_149_done
  rxcap_149_fail:
    goto rx144_fail
  rxcap_149_done:
  # rx subrule "backmod" subtype=capture negate=
    rx144_cur."!cursor_pos"(rx144_pos)
    $P10 = rx144_cur."backmod"()
    unless $P10, rx144_fail
    rx144_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx144_pos = $P10."pos"()
  # rx pass
    rx144_cur."!cursor_pass"(rx144_pos, "quantifier:sym<+>")
    rx144_cur."!cursor_debug"("PASS  ", "quantifier:sym<+>", " at pos=", rx144_pos)
    .return (rx144_cur)
  rx144_fail:
.annotate "line", 3
    (rx144_rep, rx144_pos, $I10, $P10) = rx144_cur."!mark_fail"(0)
    lt rx144_pos, -1, rx144_done
    eq rx144_pos, -1, rx144_fail
    jump $I10
  rx144_done:
    rx144_cur."!cursor_fail"()
    rx144_cur."!cursor_debug"("FAIL  ", "quantifier:sym<+>")
    .return (rx144_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<+>"  :subid("39_1259078874.10857") :method
.annotate "line", 3
    $P146 = self."!PREFIX__!subrule"("backmod", "+")
    new $P147, "ResizablePMCArray"
    push $P147, $P146
    .return ($P147)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<?>"  :subid("40_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
    .local string rx151_tgt
    .local int rx151_pos
    .local int rx151_off
    .local int rx151_eos
    .local int rx151_rep
    .local pmc rx151_cur
    (rx151_cur, rx151_pos, rx151_tgt) = self."!cursor_start"()
    rx151_cur."!cursor_debug"("START ", "quantifier:sym<?>")
    .lex unicode:"$\x{a2}", rx151_cur
    .local pmc match
    .lex "$/", match
    length rx151_eos, rx151_tgt
    set rx151_off, 0
    lt rx151_pos, 2, rx151_start
    sub rx151_off, rx151_pos, 1
    substr rx151_tgt, rx151_tgt, rx151_off
  rx151_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan155_done
    goto rxscan155_scan
  rxscan155_loop:
    ($P10) = rx151_cur."from"()
    inc $P10
    set rx151_pos, $P10
    ge rx151_pos, rx151_eos, rxscan155_done
  rxscan155_scan:
    set_addr $I10, rxscan155_loop
    rx151_cur."!mark_push"(0, rx151_pos, $I10)
  rxscan155_done:
.annotate "line", 55
  # rx subcapture "sym"
    set_addr $I10, rxcap_156_fail
    rx151_cur."!mark_push"(0, rx151_pos, $I10)
  # rx literal  "?"
    add $I11, rx151_pos, 1
    gt $I11, rx151_eos, rx151_fail
    sub $I11, rx151_pos, rx151_off
    substr $S10, rx151_tgt, $I11, 1
    ne $S10, "?", rx151_fail
    add rx151_pos, 1
    set_addr $I10, rxcap_156_fail
    ($I12, $I11) = rx151_cur."!mark_peek"($I10)
    rx151_cur."!cursor_pos"($I11)
    ($P10) = rx151_cur."!cursor_start"()
    $P10."!cursor_pass"(rx151_pos, "")
    rx151_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_156_done
  rxcap_156_fail:
    goto rx151_fail
  rxcap_156_done:
  # rx subrule "backmod" subtype=capture negate=
    rx151_cur."!cursor_pos"(rx151_pos)
    $P10 = rx151_cur."backmod"()
    unless $P10, rx151_fail
    rx151_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx151_pos = $P10."pos"()
  # rx pass
    rx151_cur."!cursor_pass"(rx151_pos, "quantifier:sym<?>")
    rx151_cur."!cursor_debug"("PASS  ", "quantifier:sym<?>", " at pos=", rx151_pos)
    .return (rx151_cur)
  rx151_fail:
.annotate "line", 3
    (rx151_rep, rx151_pos, $I10, $P10) = rx151_cur."!mark_fail"(0)
    lt rx151_pos, -1, rx151_done
    eq rx151_pos, -1, rx151_fail
    jump $I10
  rx151_done:
    rx151_cur."!cursor_fail"()
    rx151_cur."!cursor_debug"("FAIL  ", "quantifier:sym<?>")
    .return (rx151_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<?>"  :subid("41_1259078874.10857") :method
.annotate "line", 3
    $P153 = self."!PREFIX__!subrule"("backmod", "?")
    new $P154, "ResizablePMCArray"
    push $P154, $P153
    .return ($P154)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<**>"  :subid("42_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
    .local string rx158_tgt
    .local int rx158_pos
    .local int rx158_off
    .local int rx158_eos
    .local int rx158_rep
    .local pmc rx158_cur
    (rx158_cur, rx158_pos, rx158_tgt) = self."!cursor_start"()
    rx158_cur."!cursor_debug"("START ", "quantifier:sym<**>")
    rx158_cur."!cursor_caparray"("max")
    .lex unicode:"$\x{a2}", rx158_cur
    .local pmc match
    .lex "$/", match
    length rx158_eos, rx158_tgt
    set rx158_off, 0
    lt rx158_pos, 2, rx158_start
    sub rx158_off, rx158_pos, 1
    substr rx158_tgt, rx158_tgt, rx158_off
  rx158_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan161_done
    goto rxscan161_scan
  rxscan161_loop:
    ($P10) = rx158_cur."from"()
    inc $P10
    set rx158_pos, $P10
    ge rx158_pos, rx158_eos, rxscan161_done
  rxscan161_scan:
    set_addr $I10, rxscan161_loop
    rx158_cur."!mark_push"(0, rx158_pos, $I10)
  rxscan161_done:
.annotate "line", 57
  # rx subcapture "sym"
    set_addr $I10, rxcap_162_fail
    rx158_cur."!mark_push"(0, rx158_pos, $I10)
  # rx literal  "**"
    add $I11, rx158_pos, 2
    gt $I11, rx158_eos, rx158_fail
    sub $I11, rx158_pos, rx158_off
    substr $S10, rx158_tgt, $I11, 2
    ne $S10, "**", rx158_fail
    add rx158_pos, 2
    set_addr $I10, rxcap_162_fail
    ($I12, $I11) = rx158_cur."!mark_peek"($I10)
    rx158_cur."!cursor_pos"($I11)
    ($P10) = rx158_cur."!cursor_start"()
    $P10."!cursor_pass"(rx158_pos, "")
    rx158_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_162_done
  rxcap_162_fail:
    goto rx158_fail
  rxcap_162_done:
  # rx charclass_q s r 0..-1
    sub $I10, rx158_pos, rx158_off
    find_not_cclass $I11, 32, rx158_tgt, $I10, rx158_eos
    add rx158_pos, rx158_off, $I11
  # rx subrule "backmod" subtype=capture negate=
    rx158_cur."!cursor_pos"(rx158_pos)
    $P10 = rx158_cur."backmod"()
    unless $P10, rx158_fail
    rx158_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx158_pos = $P10."pos"()
  # rx charclass_q s r 0..-1
    sub $I10, rx158_pos, rx158_off
    find_not_cclass $I11, 32, rx158_tgt, $I10, rx158_eos
    add rx158_pos, rx158_off, $I11
  alt163_0:
.annotate "line", 58
    set_addr $I10, alt163_1
    rx158_cur."!mark_push"(0, rx158_pos, $I10)
.annotate "line", 59
  # rx subcapture "min"
    set_addr $I10, rxcap_164_fail
    rx158_cur."!mark_push"(0, rx158_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx158_pos, rx158_off
    find_not_cclass $I11, 8, rx158_tgt, $I10, rx158_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx158_fail
    add rx158_pos, rx158_off, $I11
    set_addr $I10, rxcap_164_fail
    ($I12, $I11) = rx158_cur."!mark_peek"($I10)
    rx158_cur."!cursor_pos"($I11)
    ($P10) = rx158_cur."!cursor_start"()
    $P10."!cursor_pass"(rx158_pos, "")
    rx158_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("min")
    goto rxcap_164_done
  rxcap_164_fail:
    goto rx158_fail
  rxcap_164_done:
.annotate "line", 66
  # rx rxquantr165 ** 0..1
    set_addr $I168, rxquantr165_done
    rx158_cur."!mark_push"(0, rx158_pos, $I168)
  rxquantr165_loop:
.annotate "line", 60
  # rx literal  ".."
    add $I11, rx158_pos, 2
    gt $I11, rx158_eos, rx158_fail
    sub $I11, rx158_pos, rx158_off
    substr $S10, rx158_tgt, $I11, 2
    ne $S10, "..", rx158_fail
    add rx158_pos, 2
.annotate "line", 61
  # rx subcapture "max"
    set_addr $I10, rxcap_167_fail
    rx158_cur."!mark_push"(0, rx158_pos, $I10)
  alt166_0:
    set_addr $I10, alt166_1
    rx158_cur."!mark_push"(0, rx158_pos, $I10)
.annotate "line", 62
  # rx charclass_q d r 1..-1
    sub $I10, rx158_pos, rx158_off
    find_not_cclass $I11, 8, rx158_tgt, $I10, rx158_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx158_fail
    add rx158_pos, rx158_off, $I11
    goto alt166_end
  alt166_1:
    set_addr $I10, alt166_2
    rx158_cur."!mark_push"(0, rx158_pos, $I10)
.annotate "line", 63
  # rx literal  "*"
    add $I11, rx158_pos, 1
    gt $I11, rx158_eos, rx158_fail
    sub $I11, rx158_pos, rx158_off
    substr $S10, rx158_tgt, $I11, 1
    ne $S10, "*", rx158_fail
    add rx158_pos, 1
    goto alt166_end
  alt166_2:
.annotate "line", 64
  # rx subrule "panic" subtype=method negate=
    rx158_cur."!cursor_pos"(rx158_pos)
    $P10 = rx158_cur."panic"("Only integers or '*' allowed as range quantifier endpoint")
    unless $P10, rx158_fail
    rx158_pos = $P10."pos"()
  alt166_end:
.annotate "line", 61
    set_addr $I10, rxcap_167_fail
    ($I12, $I11) = rx158_cur."!mark_peek"($I10)
    rx158_cur."!cursor_pos"($I11)
    ($P10) = rx158_cur."!cursor_start"()
    $P10."!cursor_pass"(rx158_pos, "")
    rx158_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("max")
    goto rxcap_167_done
  rxcap_167_fail:
    goto rx158_fail
  rxcap_167_done:
.annotate "line", 66
    (rx158_rep) = rx158_cur."!mark_commit"($I168)
  rxquantr165_done:
.annotate "line", 59
    goto alt163_end
  alt163_1:
.annotate "line", 67
  # rx subrule "quantified_atom" subtype=capture negate=
    rx158_cur."!cursor_pos"(rx158_pos)
    $P10 = rx158_cur."quantified_atom"()
    unless $P10, rx158_fail
    rx158_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantified_atom")
    rx158_pos = $P10."pos"()
  alt163_end:
.annotate "line", 56
  # rx pass
    rx158_cur."!cursor_pass"(rx158_pos, "quantifier:sym<**>")
    rx158_cur."!cursor_debug"("PASS  ", "quantifier:sym<**>", " at pos=", rx158_pos)
    .return (rx158_cur)
  rx158_fail:
.annotate "line", 3
    (rx158_rep, rx158_pos, $I10, $P10) = rx158_cur."!mark_fail"(0)
    lt rx158_pos, -1, rx158_done
    eq rx158_pos, -1, rx158_fail
    jump $I10
  rx158_done:
    rx158_cur."!cursor_fail"()
    rx158_cur."!cursor_debug"("FAIL  ", "quantifier:sym<**>")
    .return (rx158_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<**>"  :subid("43_1259078874.10857") :method
.annotate "line", 3
    new $P160, "ResizablePMCArray"
    push $P160, "**"
    .return ($P160)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backmod"  :subid("44_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
    .const 'Sub' $P178 = "46_1259078874.10857" 
    capture_lex $P178
    .local string rx170_tgt
    .local int rx170_pos
    .local int rx170_off
    .local int rx170_eos
    .local int rx170_rep
    .local pmc rx170_cur
    (rx170_cur, rx170_pos, rx170_tgt) = self."!cursor_start"()
    rx170_cur."!cursor_debug"("START ", "backmod")
    .lex unicode:"$\x{a2}", rx170_cur
    .local pmc match
    .lex "$/", match
    length rx170_eos, rx170_tgt
    set rx170_off, 0
    lt rx170_pos, 2, rx170_start
    sub rx170_off, rx170_pos, 1
    substr rx170_tgt, rx170_tgt, rx170_off
  rx170_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan173_done
    goto rxscan173_scan
  rxscan173_loop:
    ($P10) = rx170_cur."from"()
    inc $P10
    set rx170_pos, $P10
    ge rx170_pos, rx170_eos, rxscan173_done
  rxscan173_scan:
    set_addr $I10, rxscan173_loop
    rx170_cur."!mark_push"(0, rx170_pos, $I10)
  rxscan173_done:
.annotate "line", 71
  # rx rxquantr174 ** 0..1
    set_addr $I175, rxquantr174_done
    rx170_cur."!mark_push"(0, rx170_pos, $I175)
  rxquantr174_loop:
  # rx literal  ":"
    add $I11, rx170_pos, 1
    gt $I11, rx170_eos, rx170_fail
    sub $I11, rx170_pos, rx170_off
    substr $S10, rx170_tgt, $I11, 1
    ne $S10, ":", rx170_fail
    add rx170_pos, 1
    (rx170_rep) = rx170_cur."!mark_commit"($I175)
  rxquantr174_done:
  alt176_0:
    set_addr $I10, alt176_1
    rx170_cur."!mark_push"(0, rx170_pos, $I10)
  # rx literal  "?"
    add $I11, rx170_pos, 1
    gt $I11, rx170_eos, rx170_fail
    sub $I11, rx170_pos, rx170_off
    substr $S10, rx170_tgt, $I11, 1
    ne $S10, "?", rx170_fail
    add rx170_pos, 1
    goto alt176_end
  alt176_1:
    set_addr $I10, alt176_2
    rx170_cur."!mark_push"(0, rx170_pos, $I10)
  # rx literal  "!"
    add $I11, rx170_pos, 1
    gt $I11, rx170_eos, rx170_fail
    sub $I11, rx170_pos, rx170_off
    substr $S10, rx170_tgt, $I11, 1
    ne $S10, "!", rx170_fail
    add rx170_pos, 1
    goto alt176_end
  alt176_2:
  # rx subrule "before" subtype=zerowidth negate=1
    rx170_cur."!cursor_pos"(rx170_pos)
    .const 'Sub' $P178 = "46_1259078874.10857" 
    capture_lex $P178
    $P10 = rx170_cur."before"($P178)
    if $P10, rx170_fail
  alt176_end:
  # rx pass
    rx170_cur."!cursor_pass"(rx170_pos, "backmod")
    rx170_cur."!cursor_debug"("PASS  ", "backmod", " at pos=", rx170_pos)
    .return (rx170_cur)
  rx170_fail:
.annotate "line", 3
    (rx170_rep, rx170_pos, $I10, $P10) = rx170_cur."!mark_fail"(0)
    lt rx170_pos, -1, rx170_done
    eq rx170_pos, -1, rx170_fail
    jump $I10
  rx170_done:
    rx170_cur."!cursor_fail"()
    rx170_cur."!cursor_debug"("FAIL  ", "backmod")
    .return (rx170_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backmod"  :subid("45_1259078874.10857") :method
.annotate "line", 3
    new $P172, "ResizablePMCArray"
    push $P172, ""
    .return ($P172)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block177"  :anon :subid("46_1259078874.10857") :method :outer("44_1259078874.10857")
.annotate "line", 71
    .lex unicode:"$\x{a2}", $P179
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
.sub "metachar"  :subid("47_1259078874.10857") :method
.annotate "line", 73
    $P183 = self."!protoregex"("metachar")
    .return ($P183)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar"  :subid("48_1259078874.10857") :method
.annotate "line", 73
    $P185 = self."!PREFIX__!protoregex"("metachar")
    .return ($P185)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<ws>"  :subid("49_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 74
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
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<ws>"  :subid("50_1259078874.10857") :method
.annotate "line", 3
    $P189 = self."!PREFIX__!subrule"("", "")
    new $P190, "ResizablePMCArray"
    push $P190, $P189
    .return ($P190)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<[ ]>"  :subid("51_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 75
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
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<[ ]>"  :subid("52_1259078874.10857") :method
.annotate "line", 3
    $P195 = self."!PREFIX__!subrule"("nibbler", "[")
    new $P196, "ResizablePMCArray"
    push $P196, $P195
    .return ($P196)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<( )>"  :subid("53_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 76
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
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<( )>"  :subid("54_1259078874.10857") :method
.annotate "line", 3
    $P201 = self."!PREFIX__!subrule"("nibbler", "(")
    new $P202, "ResizablePMCArray"
    push $P202, $P201
    .return ($P202)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<'>"  :subid("55_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 77
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
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<'>"  :subid("56_1259078874.10857") :method
.annotate "line", 3
    new $P207, "ResizablePMCArray"
    push $P207, "'"
    .return ($P207)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<\">"  :subid("57_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 78
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
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<\">"  :subid("58_1259078874.10857") :method
.annotate "line", 3
    new $P212, "ResizablePMCArray"
    push $P212, "\""
    .return ($P212)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<.>"  :subid("59_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 79
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
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<.>"  :subid("60_1259078874.10857") :method
.annotate "line", 3
    new $P217, "ResizablePMCArray"
    push $P217, "."
    .return ($P217)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^>"  :subid("61_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 80
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
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<^>"  :subid("62_1259078874.10857") :method
.annotate "line", 3
    new $P223, "ResizablePMCArray"
    push $P223, "^"
    .return ($P223)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^^>"  :subid("63_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 81
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
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<^^>"  :subid("64_1259078874.10857") :method
.annotate "line", 3
    new $P229, "ResizablePMCArray"
    push $P229, "^^"
    .return ($P229)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$>"  :subid("65_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 82
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
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<$>"  :subid("66_1259078874.10857") :method
.annotate "line", 3
    new $P235, "ResizablePMCArray"
    push $P235, "$"
    .return ($P235)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$$>"  :subid("67_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 83
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
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<$$>"  :subid("68_1259078874.10857") :method
.annotate "line", 3
    new $P241, "ResizablePMCArray"
    push $P241, "$$"
    .return ($P241)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<:::>"  :subid("69_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 84
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
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<:::>"  :subid("70_1259078874.10857") :method
.annotate "line", 3
    $P247 = self."!PREFIX__!subrule"("", ":::")
    new $P248, "ResizablePMCArray"
    push $P248, $P247
    .return ($P248)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<::>"  :subid("71_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 85
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
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<::>"  :subid("72_1259078874.10857") :method
.annotate "line", 3
    $P254 = self."!PREFIX__!subrule"("", "::")
    new $P255, "ResizablePMCArray"
    push $P255, $P254
    .return ($P255)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<lwb>"  :subid("73_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 86
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
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<lwb>"  :subid("74_1259078874.10857") :method
.annotate "line", 3
    new $P261, "ResizablePMCArray"
    push $P261, unicode:"\x{ab}"
    push $P261, "<<"
    .return ($P261)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<rwb>"  :subid("75_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 87
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
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<rwb>"  :subid("76_1259078874.10857") :method
.annotate "line", 3
    new $P268, "ResizablePMCArray"
    push $P268, unicode:"\x{bb}"
    push $P268, ">>"
    .return ($P268)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<bs>"  :subid("77_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 88
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
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<bs>"  :subid("78_1259078874.10857") :method
.annotate "line", 3
    $P275 = self."!PREFIX__!subrule"("backslash", "\\")
    new $P276, "ResizablePMCArray"
    push $P276, $P275
    .return ($P276)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<mod>"  :subid("79_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 89
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
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<mod>"  :subid("80_1259078874.10857") :method
.annotate "line", 3
    $P281 = self."!PREFIX__!subrule"("mod_internal", "")
    new $P282, "ResizablePMCArray"
    push $P282, $P281
    .return ($P282)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<~>"  :subid("81_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 93
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
.annotate "line", 94
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
.annotate "line", 95
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
.annotate "line", 92
  # rx pass
    rx285_cur."!cursor_pass"(rx285_pos, "metachar:sym<~>")
    rx285_cur."!cursor_debug"("PASS  ", "metachar:sym<~>", " at pos=", rx285_pos)
    .return (rx285_cur)
  rx285_fail:
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<~>"  :subid("82_1259078874.10857") :method
.annotate "line", 3
    $P287 = self."!PREFIX__!subrule"("", "~")
    new $P288, "ResizablePMCArray"
    push $P288, $P287
    .return ($P288)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<{*}>"  :subid("83_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 99
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
.annotate "line", 100
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
.annotate "line", 98
  # rx pass
    rx292_cur."!cursor_pass"(rx292_pos, "metachar:sym<{*}>")
    rx292_cur."!cursor_debug"("PASS  ", "metachar:sym<{*}>", " at pos=", rx292_pos)
    .return (rx292_cur)
  rx292_fail:
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<{*}>"  :subid("84_1259078874.10857") :method
.annotate "line", 3
    new $P294, "ResizablePMCArray"
    push $P294, "{*}"
    .return ($P294)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<assert>"  :subid("85_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 103
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
.annotate "line", 104
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
.annotate "line", 102
  # rx pass
    rx309_cur."!cursor_pass"(rx309_pos, "metachar:sym<assert>")
    rx309_cur."!cursor_debug"("PASS  ", "metachar:sym<assert>", " at pos=", rx309_pos)
    .return (rx309_cur)
  rx309_fail:
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<assert>"  :subid("86_1259078874.10857") :method
.annotate "line", 3
    $P311 = self."!PREFIX__!subrule"("assertion", "<")
    new $P312, "ResizablePMCArray"
    push $P312, $P311
    .return ($P312)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<var>"  :subid("87_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 108
    set_addr $I10, alt320_1
    rx316_cur."!mark_push"(0, rx316_pos, $I10)
.annotate "line", 109
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
.annotate "line", 110
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
.annotate "line", 113
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
.annotate "line", 107
  # rx pass
    rx316_cur."!cursor_pass"(rx316_pos, "metachar:sym<var>")
    rx316_cur."!cursor_debug"("PASS  ", "metachar:sym<var>", " at pos=", rx316_pos)
    .return (rx316_cur)
  rx316_fail:
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<var>"  :subid("88_1259078874.10857") :method
.annotate "line", 3
    new $P318, "ResizablePMCArray"
    push $P318, "$"
    push $P318, "$<"
    .return ($P318)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<PIR>"  :subid("89_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 117
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
.annotate "line", 116
  # rx pass
    rx328_cur."!cursor_pass"(rx328_pos, "metachar:sym<PIR>")
    rx328_cur."!cursor_debug"("PASS  ", "metachar:sym<PIR>", " at pos=", rx328_pos)
    .return (rx328_cur)
  rx328_fail:
.annotate "line", 3
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
.sub "!PREFIX__metachar:sym<PIR>"  :subid("90_1259078874.10857") :method
.annotate "line", 3
    new $P330, "ResizablePMCArray"
    push $P330, ":PIR{{"
    .return ($P330)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash"  :subid("91_1259078874.10857") :method
.annotate "line", 120
    $P336 = self."!protoregex"("backslash")
    .return ($P336)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash"  :subid("92_1259078874.10857") :method
.annotate "line", 120
    $P338 = self."!PREFIX__!protoregex"("backslash")
    .return ($P338)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<w>"  :subid("93_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 121
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
.annotate "line", 3
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
.sub "!PREFIX__backslash:sym<w>"  :subid("94_1259078874.10857") :method
.annotate "line", 3
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
.sub "backslash:sym<b>"  :subid("95_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 122
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
.annotate "line", 3
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
.sub "!PREFIX__backslash:sym<b>"  :subid("96_1259078874.10857") :method
.annotate "line", 3
    new $P348, "ResizablePMCArray"
    push $P348, "B"
    push $P348, "b"
    .return ($P348)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<e>"  :subid("97_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 123
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
.annotate "line", 3
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
.sub "!PREFIX__backslash:sym<e>"  :subid("98_1259078874.10857") :method
.annotate "line", 3
    new $P354, "ResizablePMCArray"
    push $P354, "E"
    push $P354, "e"
    .return ($P354)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<f>"  :subid("99_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 124
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
.annotate "line", 3
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
.sub "!PREFIX__backslash:sym<f>"  :subid("100_1259078874.10857") :method
.annotate "line", 3
    new $P360, "ResizablePMCArray"
    push $P360, "F"
    push $P360, "f"
    .return ($P360)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<h>"  :subid("101_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 125
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
.annotate "line", 3
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
.sub "!PREFIX__backslash:sym<h>"  :subid("102_1259078874.10857") :method
.annotate "line", 3
    new $P366, "ResizablePMCArray"
    push $P366, "H"
    push $P366, "h"
    .return ($P366)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<r>"  :subid("103_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 126
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
.annotate "line", 3
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
.sub "!PREFIX__backslash:sym<r>"  :subid("104_1259078874.10857") :method
.annotate "line", 3
    new $P372, "ResizablePMCArray"
    push $P372, "R"
    push $P372, "r"
    .return ($P372)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<t>"  :subid("105_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 127
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
.annotate "line", 3
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
.sub "!PREFIX__backslash:sym<t>"  :subid("106_1259078874.10857") :method
.annotate "line", 3
    new $P378, "ResizablePMCArray"
    push $P378, "T"
    push $P378, "t"
    .return ($P378)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<v>"  :subid("107_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 128
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
.annotate "line", 3
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
.sub "!PREFIX__backslash:sym<v>"  :subid("108_1259078874.10857") :method
.annotate "line", 3
    new $P384, "ResizablePMCArray"
    push $P384, "V"
    push $P384, "v"
    .return ($P384)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<c>"  :subid("109_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
    .local string rx388_tgt
    .local int rx388_pos
    .local int rx388_off
    .local int rx388_eos
    .local int rx388_rep
    .local pmc rx388_cur
    (rx388_cur, rx388_pos, rx388_tgt) = self."!cursor_start"()
    rx388_cur."!cursor_debug"("START ", "backslash:sym<c>")
    .lex unicode:"$\x{a2}", rx388_cur
    .local pmc match
    .lex "$/", match
    length rx388_eos, rx388_tgt
    set rx388_off, 0
    lt rx388_pos, 2, rx388_start
    sub rx388_off, rx388_pos, 1
    substr rx388_tgt, rx388_tgt, rx388_off
  rx388_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan393_done
    goto rxscan393_scan
  rxscan393_loop:
    ($P10) = rx388_cur."from"()
    inc $P10
    set rx388_pos, $P10
    ge rx388_pos, rx388_eos, rxscan393_done
  rxscan393_scan:
    set_addr $I10, rxscan393_loop
    rx388_cur."!mark_push"(0, rx388_pos, $I10)
  rxscan393_done:
.annotate "line", 129
  # rx subcapture "sym"
    set_addr $I10, rxcap_394_fail
    rx388_cur."!mark_push"(0, rx388_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx388_pos, rx388_eos, rx388_fail
    sub $I10, rx388_pos, rx388_off
    substr $S10, rx388_tgt, $I10, 1
    index $I11, "cC", $S10
    lt $I11, 0, rx388_fail
    inc rx388_pos
    set_addr $I10, rxcap_394_fail
    ($I12, $I11) = rx388_cur."!mark_peek"($I10)
    rx388_cur."!cursor_pos"($I11)
    ($P10) = rx388_cur."!cursor_start"()
    $P10."!cursor_pass"(rx388_pos, "")
    rx388_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_394_done
  rxcap_394_fail:
    goto rx388_fail
  rxcap_394_done:
  # rx subrule "charspec" subtype=capture negate=
    rx388_cur."!cursor_pos"(rx388_pos)
    $P10 = rx388_cur."charspec"()
    unless $P10, rx388_fail
    rx388_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charspec")
    rx388_pos = $P10."pos"()
  # rx pass
    rx388_cur."!cursor_pass"(rx388_pos, "backslash:sym<c>")
    rx388_cur."!cursor_debug"("PASS  ", "backslash:sym<c>", " at pos=", rx388_pos)
    .return (rx388_cur)
  rx388_fail:
.annotate "line", 3
    (rx388_rep, rx388_pos, $I10, $P10) = rx388_cur."!mark_fail"(0)
    lt rx388_pos, -1, rx388_done
    eq rx388_pos, -1, rx388_fail
    jump $I10
  rx388_done:
    rx388_cur."!cursor_fail"()
    rx388_cur."!cursor_debug"("FAIL  ", "backslash:sym<c>")
    .return (rx388_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<c>"  :subid("110_1259078874.10857") :method
.annotate "line", 3
    $P390 = self."!PREFIX__!subrule"("charspec", "C")
    $P391 = self."!PREFIX__!subrule"("charspec", "c")
    new $P392, "ResizablePMCArray"
    push $P392, $P390
    push $P392, $P391
    .return ($P392)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<o>"  :subid("111_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
    .local string rx396_tgt
    .local int rx396_pos
    .local int rx396_off
    .local int rx396_eos
    .local int rx396_rep
    .local pmc rx396_cur
    (rx396_cur, rx396_pos, rx396_tgt) = self."!cursor_start"()
    rx396_cur."!cursor_debug"("START ", "backslash:sym<o>")
    .lex unicode:"$\x{a2}", rx396_cur
    .local pmc match
    .lex "$/", match
    length rx396_eos, rx396_tgt
    set rx396_off, 0
    lt rx396_pos, 2, rx396_start
    sub rx396_off, rx396_pos, 1
    substr rx396_tgt, rx396_tgt, rx396_off
  rx396_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan403_done
    goto rxscan403_scan
  rxscan403_loop:
    ($P10) = rx396_cur."from"()
    inc $P10
    set rx396_pos, $P10
    ge rx396_pos, rx396_eos, rxscan403_done
  rxscan403_scan:
    set_addr $I10, rxscan403_loop
    rx396_cur."!mark_push"(0, rx396_pos, $I10)
  rxscan403_done:
.annotate "line", 130
  # rx subcapture "sym"
    set_addr $I10, rxcap_404_fail
    rx396_cur."!mark_push"(0, rx396_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx396_pos, rx396_eos, rx396_fail
    sub $I10, rx396_pos, rx396_off
    substr $S10, rx396_tgt, $I10, 1
    index $I11, "oO", $S10
    lt $I11, 0, rx396_fail
    inc rx396_pos
    set_addr $I10, rxcap_404_fail
    ($I12, $I11) = rx396_cur."!mark_peek"($I10)
    rx396_cur."!cursor_pos"($I11)
    ($P10) = rx396_cur."!cursor_start"()
    $P10."!cursor_pass"(rx396_pos, "")
    rx396_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_404_done
  rxcap_404_fail:
    goto rx396_fail
  rxcap_404_done:
  alt405_0:
    set_addr $I10, alt405_1
    rx396_cur."!mark_push"(0, rx396_pos, $I10)
  # rx subrule "octint" subtype=capture negate=
    rx396_cur."!cursor_pos"(rx396_pos)
    $P10 = rx396_cur."octint"()
    unless $P10, rx396_fail
    rx396_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octint")
    rx396_pos = $P10."pos"()
    goto alt405_end
  alt405_1:
  # rx literal  "["
    add $I11, rx396_pos, 1
    gt $I11, rx396_eos, rx396_fail
    sub $I11, rx396_pos, rx396_off
    substr $S10, rx396_tgt, $I11, 1
    ne $S10, "[", rx396_fail
    add rx396_pos, 1
  # rx subrule "octints" subtype=capture negate=
    rx396_cur."!cursor_pos"(rx396_pos)
    $P10 = rx396_cur."octints"()
    unless $P10, rx396_fail
    rx396_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octints")
    rx396_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx396_pos, 1
    gt $I11, rx396_eos, rx396_fail
    sub $I11, rx396_pos, rx396_off
    substr $S10, rx396_tgt, $I11, 1
    ne $S10, "]", rx396_fail
    add rx396_pos, 1
  alt405_end:
  # rx pass
    rx396_cur."!cursor_pass"(rx396_pos, "backslash:sym<o>")
    rx396_cur."!cursor_debug"("PASS  ", "backslash:sym<o>", " at pos=", rx396_pos)
    .return (rx396_cur)
  rx396_fail:
.annotate "line", 3
    (rx396_rep, rx396_pos, $I10, $P10) = rx396_cur."!mark_fail"(0)
    lt rx396_pos, -1, rx396_done
    eq rx396_pos, -1, rx396_fail
    jump $I10
  rx396_done:
    rx396_cur."!cursor_fail"()
    rx396_cur."!cursor_debug"("FAIL  ", "backslash:sym<o>")
    .return (rx396_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<o>"  :subid("112_1259078874.10857") :method
.annotate "line", 3
    $P398 = self."!PREFIX__!subrule"("octints", "O[")
    $P399 = self."!PREFIX__!subrule"("octint", "O")
    $P400 = self."!PREFIX__!subrule"("octints", "o[")
    $P401 = self."!PREFIX__!subrule"("octint", "o")
    new $P402, "ResizablePMCArray"
    push $P402, $P398
    push $P402, $P399
    push $P402, $P400
    push $P402, $P401
    .return ($P402)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<x>"  :subid("113_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
    .local string rx407_tgt
    .local int rx407_pos
    .local int rx407_off
    .local int rx407_eos
    .local int rx407_rep
    .local pmc rx407_cur
    (rx407_cur, rx407_pos, rx407_tgt) = self."!cursor_start"()
    rx407_cur."!cursor_debug"("START ", "backslash:sym<x>")
    .lex unicode:"$\x{a2}", rx407_cur
    .local pmc match
    .lex "$/", match
    length rx407_eos, rx407_tgt
    set rx407_off, 0
    lt rx407_pos, 2, rx407_start
    sub rx407_off, rx407_pos, 1
    substr rx407_tgt, rx407_tgt, rx407_off
  rx407_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan414_done
    goto rxscan414_scan
  rxscan414_loop:
    ($P10) = rx407_cur."from"()
    inc $P10
    set rx407_pos, $P10
    ge rx407_pos, rx407_eos, rxscan414_done
  rxscan414_scan:
    set_addr $I10, rxscan414_loop
    rx407_cur."!mark_push"(0, rx407_pos, $I10)
  rxscan414_done:
.annotate "line", 131
  # rx subcapture "sym"
    set_addr $I10, rxcap_415_fail
    rx407_cur."!mark_push"(0, rx407_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx407_pos, rx407_eos, rx407_fail
    sub $I10, rx407_pos, rx407_off
    substr $S10, rx407_tgt, $I10, 1
    index $I11, "xX", $S10
    lt $I11, 0, rx407_fail
    inc rx407_pos
    set_addr $I10, rxcap_415_fail
    ($I12, $I11) = rx407_cur."!mark_peek"($I10)
    rx407_cur."!cursor_pos"($I11)
    ($P10) = rx407_cur."!cursor_start"()
    $P10."!cursor_pass"(rx407_pos, "")
    rx407_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_415_done
  rxcap_415_fail:
    goto rx407_fail
  rxcap_415_done:
  alt416_0:
    set_addr $I10, alt416_1
    rx407_cur."!mark_push"(0, rx407_pos, $I10)
  # rx subrule "hexint" subtype=capture negate=
    rx407_cur."!cursor_pos"(rx407_pos)
    $P10 = rx407_cur."hexint"()
    unless $P10, rx407_fail
    rx407_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexint")
    rx407_pos = $P10."pos"()
    goto alt416_end
  alt416_1:
  # rx literal  "["
    add $I11, rx407_pos, 1
    gt $I11, rx407_eos, rx407_fail
    sub $I11, rx407_pos, rx407_off
    substr $S10, rx407_tgt, $I11, 1
    ne $S10, "[", rx407_fail
    add rx407_pos, 1
  # rx subrule "hexints" subtype=capture negate=
    rx407_cur."!cursor_pos"(rx407_pos)
    $P10 = rx407_cur."hexints"()
    unless $P10, rx407_fail
    rx407_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexints")
    rx407_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx407_pos, 1
    gt $I11, rx407_eos, rx407_fail
    sub $I11, rx407_pos, rx407_off
    substr $S10, rx407_tgt, $I11, 1
    ne $S10, "]", rx407_fail
    add rx407_pos, 1
  alt416_end:
  # rx pass
    rx407_cur."!cursor_pass"(rx407_pos, "backslash:sym<x>")
    rx407_cur."!cursor_debug"("PASS  ", "backslash:sym<x>", " at pos=", rx407_pos)
    .return (rx407_cur)
  rx407_fail:
.annotate "line", 3
    (rx407_rep, rx407_pos, $I10, $P10) = rx407_cur."!mark_fail"(0)
    lt rx407_pos, -1, rx407_done
    eq rx407_pos, -1, rx407_fail
    jump $I10
  rx407_done:
    rx407_cur."!cursor_fail"()
    rx407_cur."!cursor_debug"("FAIL  ", "backslash:sym<x>")
    .return (rx407_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<x>"  :subid("114_1259078874.10857") :method
.annotate "line", 3
    $P409 = self."!PREFIX__!subrule"("hexints", "X[")
    $P410 = self."!PREFIX__!subrule"("hexint", "X")
    $P411 = self."!PREFIX__!subrule"("hexints", "x[")
    $P412 = self."!PREFIX__!subrule"("hexint", "x")
    new $P413, "ResizablePMCArray"
    push $P413, $P409
    push $P413, $P410
    push $P413, $P411
    push $P413, $P412
    .return ($P413)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<A>"  :subid("115_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 132
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
.annotate "line", 3
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
.sub "!PREFIX__backslash:sym<A>"  :subid("116_1259078874.10857") :method
.annotate "line", 3
    $P420 = self."!PREFIX__!subrule"("", "A")
    new $P421, "ResizablePMCArray"
    push $P421, $P420
    .return ($P421)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<z>"  :subid("117_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 133
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
.annotate "line", 3
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
.sub "!PREFIX__backslash:sym<z>"  :subid("118_1259078874.10857") :method
.annotate "line", 3
    $P426 = self."!PREFIX__!subrule"("", "z")
    new $P427, "ResizablePMCArray"
    push $P427, $P426
    .return ($P427)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Z>"  :subid("119_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 134
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
.annotate "line", 3
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
.sub "!PREFIX__backslash:sym<Z>"  :subid("120_1259078874.10857") :method
.annotate "line", 3
    $P432 = self."!PREFIX__!subrule"("", "Z")
    new $P433, "ResizablePMCArray"
    push $P433, $P432
    .return ($P433)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Q>"  :subid("121_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 135
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
.annotate "line", 3
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
.sub "!PREFIX__backslash:sym<Q>"  :subid("122_1259078874.10857") :method
.annotate "line", 3
    $P438 = self."!PREFIX__!subrule"("", "Q")
    new $P439, "ResizablePMCArray"
    push $P439, $P438
    .return ($P439)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<misc>"  :subid("123_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 136
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
.annotate "line", 3
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
.sub "!PREFIX__backslash:sym<misc>"  :subid("124_1259078874.10857") :method
.annotate "line", 3
    new $P444, "ResizablePMCArray"
    push $P444, ""
    .return ($P444)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion"  :subid("125_1259078874.10857") :method
.annotate "line", 138
    $P447 = self."!protoregex"("assertion")
    .return ($P447)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion"  :subid("126_1259078874.10857") :method
.annotate "line", 138
    $P449 = self."!PREFIX__!protoregex"("assertion")
    .return ($P449)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<?>"  :subid("127_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
    .const 'Sub' $P458 = "129_1259078874.10857" 
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
.annotate "line", 140
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
    .const 'Sub' $P458 = "129_1259078874.10857" 
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
.annotate "line", 3
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
.sub "!PREFIX__assertion:sym<?>"  :subid("128_1259078874.10857") :method
.annotate "line", 3
    $P453 = self."!PREFIX__!subrule"("assertion", "?")
    new $P454, "ResizablePMCArray"
    push $P454, $P453
    push $P454, "?"
    .return ($P454)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block457"  :anon :subid("129_1259078874.10857") :method :outer("127_1259078874.10857")
.annotate "line", 140
    .lex unicode:"$\x{a2}", $P459
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
.sub "assertion:sym<!>"  :subid("130_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
    .const 'Sub' $P470 = "132_1259078874.10857" 
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
.annotate "line", 141
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
    .const 'Sub' $P470 = "132_1259078874.10857" 
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
.annotate "line", 3
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
.sub "!PREFIX__assertion:sym<!>"  :subid("131_1259078874.10857") :method
.annotate "line", 3
    $P465 = self."!PREFIX__!subrule"("assertion", "!")
    new $P466, "ResizablePMCArray"
    push $P466, $P465
    push $P466, "!"
    .return ($P466)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block469"  :anon :subid("132_1259078874.10857") :method :outer("130_1259078874.10857")
.annotate "line", 141
    .lex unicode:"$\x{a2}", $P471
    .local string rx472_tgt
    .local int rx472_pos
    .local int rx472_off
    .local int rx472_eos
    .local int rx472_rep
    .local pmc rx472_cur
    (rx472_cur, rx472_pos, rx472_tgt) = self."!cursor_start"()
    rx472_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx472_cur
    .local pmc match
    .lex "$/", match
    length rx472_eos, rx472_tgt
    set rx472_off, 0
    lt rx472_pos, 2, rx472_start
    sub rx472_off, rx472_pos, 1
    substr rx472_tgt, rx472_tgt, rx472_off
  rx472_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan473_done
    goto rxscan473_scan
  rxscan473_loop:
    ($P10) = rx472_cur."from"()
    inc $P10
    set rx472_pos, $P10
    ge rx472_pos, rx472_eos, rxscan473_done
  rxscan473_scan:
    set_addr $I10, rxscan473_loop
    rx472_cur."!mark_push"(0, rx472_pos, $I10)
  rxscan473_done:
  # rx literal  ">"
    add $I11, rx472_pos, 1
    gt $I11, rx472_eos, rx472_fail
    sub $I11, rx472_pos, rx472_off
    substr $S10, rx472_tgt, $I11, 1
    ne $S10, ">", rx472_fail
    add rx472_pos, 1
  # rx pass
    rx472_cur."!cursor_pass"(rx472_pos, "")
    rx472_cur."!cursor_debug"("PASS  ", "", " at pos=", rx472_pos)
    .return (rx472_cur)
  rx472_fail:
    (rx472_rep, rx472_pos, $I10, $P10) = rx472_cur."!mark_fail"(0)
    lt rx472_pos, -1, rx472_done
    eq rx472_pos, -1, rx472_fail
    jump $I10
  rx472_done:
    rx472_cur."!cursor_fail"()
    rx472_cur."!cursor_debug"("FAIL  ", "")
    .return (rx472_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<method>"  :subid("133_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
    .local string rx475_tgt
    .local int rx475_pos
    .local int rx475_off
    .local int rx475_eos
    .local int rx475_rep
    .local pmc rx475_cur
    (rx475_cur, rx475_pos, rx475_tgt) = self."!cursor_start"()
    rx475_cur."!cursor_debug"("START ", "assertion:sym<method>")
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
    ne $I10, -1, rxscan479_done
    goto rxscan479_scan
  rxscan479_loop:
    ($P10) = rx475_cur."from"()
    inc $P10
    set rx475_pos, $P10
    ge rx475_pos, rx475_eos, rxscan479_done
  rxscan479_scan:
    set_addr $I10, rxscan479_loop
    rx475_cur."!mark_push"(0, rx475_pos, $I10)
  rxscan479_done:
.annotate "line", 144
  # rx literal  "."
    add $I11, rx475_pos, 1
    gt $I11, rx475_eos, rx475_fail
    sub $I11, rx475_pos, rx475_off
    substr $S10, rx475_tgt, $I11, 1
    ne $S10, ".", rx475_fail
    add rx475_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx475_cur."!cursor_pos"(rx475_pos)
    $P10 = rx475_cur."assertion"()
    unless $P10, rx475_fail
    rx475_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx475_pos = $P10."pos"()
.annotate "line", 143
  # rx pass
    rx475_cur."!cursor_pass"(rx475_pos, "assertion:sym<method>")
    rx475_cur."!cursor_debug"("PASS  ", "assertion:sym<method>", " at pos=", rx475_pos)
    .return (rx475_cur)
  rx475_fail:
.annotate "line", 3
    (rx475_rep, rx475_pos, $I10, $P10) = rx475_cur."!mark_fail"(0)
    lt rx475_pos, -1, rx475_done
    eq rx475_pos, -1, rx475_fail
    jump $I10
  rx475_done:
    rx475_cur."!cursor_fail"()
    rx475_cur."!cursor_debug"("FAIL  ", "assertion:sym<method>")
    .return (rx475_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<method>"  :subid("134_1259078874.10857") :method
.annotate "line", 3
    $P477 = self."!PREFIX__!subrule"("assertion", ".")
    new $P478, "ResizablePMCArray"
    push $P478, $P477
    .return ($P478)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<name>"  :subid("135_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
    .const 'Sub' $P489 = "137_1259078874.10857" 
    capture_lex $P489
    .local string rx481_tgt
    .local int rx481_pos
    .local int rx481_off
    .local int rx481_eos
    .local int rx481_rep
    .local pmc rx481_cur
    (rx481_cur, rx481_pos, rx481_tgt) = self."!cursor_start"()
    rx481_cur."!cursor_debug"("START ", "assertion:sym<name>")
    rx481_cur."!cursor_caparray"("nibbler", "arglist", "assertion")
    .lex unicode:"$\x{a2}", rx481_cur
    .local pmc match
    .lex "$/", match
    length rx481_eos, rx481_tgt
    set rx481_off, 0
    lt rx481_pos, 2, rx481_start
    sub rx481_off, rx481_pos, 1
    substr rx481_tgt, rx481_tgt, rx481_off
  rx481_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan484_done
    goto rxscan484_scan
  rxscan484_loop:
    ($P10) = rx481_cur."from"()
    inc $P10
    set rx481_pos, $P10
    ge rx481_pos, rx481_eos, rxscan484_done
  rxscan484_scan:
    set_addr $I10, rxscan484_loop
    rx481_cur."!mark_push"(0, rx481_pos, $I10)
  rxscan484_done:
.annotate "line", 148
  # rx subcapture "longname"
    set_addr $I10, rxcap_485_fail
    rx481_cur."!mark_push"(0, rx481_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx481_pos, rx481_off
    find_not_cclass $I11, 8192, rx481_tgt, $I10, rx481_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx481_fail
    add rx481_pos, rx481_off, $I11
    set_addr $I10, rxcap_485_fail
    ($I12, $I11) = rx481_cur."!mark_peek"($I10)
    rx481_cur."!cursor_pos"($I11)
    ($P10) = rx481_cur."!cursor_start"()
    $P10."!cursor_pass"(rx481_pos, "")
    rx481_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    goto rxcap_485_done
  rxcap_485_fail:
    goto rx481_fail
  rxcap_485_done:
.annotate "line", 155
  # rx rxquantr486 ** 0..1
    set_addr $I493, rxquantr486_done
    rx481_cur."!mark_push"(0, rx481_pos, $I493)
  rxquantr486_loop:
  alt487_0:
.annotate "line", 149
    set_addr $I10, alt487_1
    rx481_cur."!mark_push"(0, rx481_pos, $I10)
.annotate "line", 150
  # rx subrule "before" subtype=zerowidth negate=
    rx481_cur."!cursor_pos"(rx481_pos)
    .const 'Sub' $P489 = "137_1259078874.10857" 
    capture_lex $P489
    $P10 = rx481_cur."before"($P489)
    unless $P10, rx481_fail
    goto alt487_end
  alt487_1:
    set_addr $I10, alt487_2
    rx481_cur."!mark_push"(0, rx481_pos, $I10)
.annotate "line", 151
  # rx literal  "="
    add $I11, rx481_pos, 1
    gt $I11, rx481_eos, rx481_fail
    sub $I11, rx481_pos, rx481_off
    substr $S10, rx481_tgt, $I11, 1
    ne $S10, "=", rx481_fail
    add rx481_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx481_cur."!cursor_pos"(rx481_pos)
    $P10 = rx481_cur."assertion"()
    unless $P10, rx481_fail
    rx481_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx481_pos = $P10."pos"()
    goto alt487_end
  alt487_2:
    set_addr $I10, alt487_3
    rx481_cur."!mark_push"(0, rx481_pos, $I10)
.annotate "line", 152
  # rx literal  ":"
    add $I11, rx481_pos, 1
    gt $I11, rx481_eos, rx481_fail
    sub $I11, rx481_pos, rx481_off
    substr $S10, rx481_tgt, $I11, 1
    ne $S10, ":", rx481_fail
    add rx481_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx481_cur."!cursor_pos"(rx481_pos)
    $P10 = rx481_cur."arglist"()
    unless $P10, rx481_fail
    rx481_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx481_pos = $P10."pos"()
    goto alt487_end
  alt487_3:
    set_addr $I10, alt487_4
    rx481_cur."!mark_push"(0, rx481_pos, $I10)
.annotate "line", 153
  # rx literal  "("
    add $I11, rx481_pos, 1
    gt $I11, rx481_eos, rx481_fail
    sub $I11, rx481_pos, rx481_off
    substr $S10, rx481_tgt, $I11, 1
    ne $S10, "(", rx481_fail
    add rx481_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx481_cur."!cursor_pos"(rx481_pos)
    $P10 = rx481_cur."arglist"()
    unless $P10, rx481_fail
    rx481_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx481_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx481_pos, 1
    gt $I11, rx481_eos, rx481_fail
    sub $I11, rx481_pos, rx481_off
    substr $S10, rx481_tgt, $I11, 1
    ne $S10, ")", rx481_fail
    add rx481_pos, 1
    goto alt487_end
  alt487_4:
.annotate "line", 154
  # rx subrule "normspace" subtype=method negate=
    rx481_cur."!cursor_pos"(rx481_pos)
    $P10 = rx481_cur."normspace"()
    unless $P10, rx481_fail
    rx481_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx481_cur."!cursor_pos"(rx481_pos)
    $P10 = rx481_cur."nibbler"()
    unless $P10, rx481_fail
    rx481_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx481_pos = $P10."pos"()
  alt487_end:
.annotate "line", 155
    (rx481_rep) = rx481_cur."!mark_commit"($I493)
  rxquantr486_done:
.annotate "line", 147
  # rx pass
    rx481_cur."!cursor_pass"(rx481_pos, "assertion:sym<name>")
    rx481_cur."!cursor_debug"("PASS  ", "assertion:sym<name>", " at pos=", rx481_pos)
    .return (rx481_cur)
  rx481_fail:
.annotate "line", 3
    (rx481_rep, rx481_pos, $I10, $P10) = rx481_cur."!mark_fail"(0)
    lt rx481_pos, -1, rx481_done
    eq rx481_pos, -1, rx481_fail
    jump $I10
  rx481_done:
    rx481_cur."!cursor_fail"()
    rx481_cur."!cursor_debug"("FAIL  ", "assertion:sym<name>")
    .return (rx481_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<name>"  :subid("136_1259078874.10857") :method
.annotate "line", 3
    new $P483, "ResizablePMCArray"
    push $P483, ""
    .return ($P483)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block488"  :anon :subid("137_1259078874.10857") :method :outer("135_1259078874.10857")
.annotate "line", 150
    .lex unicode:"$\x{a2}", $P490
    .local string rx491_tgt
    .local int rx491_pos
    .local int rx491_off
    .local int rx491_eos
    .local int rx491_rep
    .local pmc rx491_cur
    (rx491_cur, rx491_pos, rx491_tgt) = self."!cursor_start"()
    rx491_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx491_cur
    .local pmc match
    .lex "$/", match
    length rx491_eos, rx491_tgt
    set rx491_off, 0
    lt rx491_pos, 2, rx491_start
    sub rx491_off, rx491_pos, 1
    substr rx491_tgt, rx491_tgt, rx491_off
  rx491_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan492_done
    goto rxscan492_scan
  rxscan492_loop:
    ($P10) = rx491_cur."from"()
    inc $P10
    set rx491_pos, $P10
    ge rx491_pos, rx491_eos, rxscan492_done
  rxscan492_scan:
    set_addr $I10, rxscan492_loop
    rx491_cur."!mark_push"(0, rx491_pos, $I10)
  rxscan492_done:
  # rx literal  ">"
    add $I11, rx491_pos, 1
    gt $I11, rx491_eos, rx491_fail
    sub $I11, rx491_pos, rx491_off
    substr $S10, rx491_tgt, $I11, 1
    ne $S10, ">", rx491_fail
    add rx491_pos, 1
  # rx pass
    rx491_cur."!cursor_pass"(rx491_pos, "")
    rx491_cur."!cursor_debug"("PASS  ", "", " at pos=", rx491_pos)
    .return (rx491_cur)
  rx491_fail:
    (rx491_rep, rx491_pos, $I10, $P10) = rx491_cur."!mark_fail"(0)
    lt rx491_pos, -1, rx491_done
    eq rx491_pos, -1, rx491_fail
    jump $I10
  rx491_done:
    rx491_cur."!cursor_fail"()
    rx491_cur."!cursor_debug"("FAIL  ", "")
    .return (rx491_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<[>"  :subid("138_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
    .const 'Sub' $P500 = "140_1259078874.10857" 
    capture_lex $P500
    .local string rx495_tgt
    .local int rx495_pos
    .local int rx495_off
    .local int rx495_eos
    .local int rx495_rep
    .local pmc rx495_cur
    (rx495_cur, rx495_pos, rx495_tgt) = self."!cursor_start"()
    rx495_cur."!cursor_debug"("START ", "assertion:sym<[>")
    rx495_cur."!cursor_caparray"("cclass_elem")
    .lex unicode:"$\x{a2}", rx495_cur
    .local pmc match
    .lex "$/", match
    length rx495_eos, rx495_tgt
    set rx495_off, 0
    lt rx495_pos, 2, rx495_start
    sub rx495_off, rx495_pos, 1
    substr rx495_tgt, rx495_tgt, rx495_off
  rx495_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan498_done
    goto rxscan498_scan
  rxscan498_loop:
    ($P10) = rx495_cur."from"()
    inc $P10
    set rx495_pos, $P10
    ge rx495_pos, rx495_eos, rxscan498_done
  rxscan498_scan:
    set_addr $I10, rxscan498_loop
    rx495_cur."!mark_push"(0, rx495_pos, $I10)
  rxscan498_done:
.annotate "line", 158
  # rx subrule "before" subtype=zerowidth negate=
    rx495_cur."!cursor_pos"(rx495_pos)
    .const 'Sub' $P500 = "140_1259078874.10857" 
    capture_lex $P500
    $P10 = rx495_cur."before"($P500)
    unless $P10, rx495_fail
  # rx rxquantr505 ** 1..*
    set_addr $I506, rxquantr505_done
    rx495_cur."!mark_push"(0, -1, $I506)
  rxquantr505_loop:
  # rx subrule "cclass_elem" subtype=capture negate=
    rx495_cur."!cursor_pos"(rx495_pos)
    $P10 = rx495_cur."cclass_elem"()
    unless $P10, rx495_fail
    rx495_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cclass_elem")
    rx495_pos = $P10."pos"()
    (rx495_rep) = rx495_cur."!mark_commit"($I506)
    rx495_cur."!mark_push"(rx495_rep, rx495_pos, $I506)
    goto rxquantr505_loop
  rxquantr505_done:
  # rx pass
    rx495_cur."!cursor_pass"(rx495_pos, "assertion:sym<[>")
    rx495_cur."!cursor_debug"("PASS  ", "assertion:sym<[>", " at pos=", rx495_pos)
    .return (rx495_cur)
  rx495_fail:
.annotate "line", 3
    (rx495_rep, rx495_pos, $I10, $P10) = rx495_cur."!mark_fail"(0)
    lt rx495_pos, -1, rx495_done
    eq rx495_pos, -1, rx495_fail
    jump $I10
  rx495_done:
    rx495_cur."!cursor_fail"()
    rx495_cur."!cursor_debug"("FAIL  ", "assertion:sym<[>")
    .return (rx495_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<[>"  :subid("139_1259078874.10857") :method
.annotate "line", 3
    new $P497, "ResizablePMCArray"
    push $P497, ""
    .return ($P497)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block499"  :anon :subid("140_1259078874.10857") :method :outer("138_1259078874.10857")
.annotate "line", 158
    .lex unicode:"$\x{a2}", $P501
    .local string rx502_tgt
    .local int rx502_pos
    .local int rx502_off
    .local int rx502_eos
    .local int rx502_rep
    .local pmc rx502_cur
    (rx502_cur, rx502_pos, rx502_tgt) = self."!cursor_start"()
    rx502_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx502_cur
    .local pmc match
    .lex "$/", match
    length rx502_eos, rx502_tgt
    set rx502_off, 0
    lt rx502_pos, 2, rx502_start
    sub rx502_off, rx502_pos, 1
    substr rx502_tgt, rx502_tgt, rx502_off
  rx502_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan503_done
    goto rxscan503_scan
  rxscan503_loop:
    ($P10) = rx502_cur."from"()
    inc $P10
    set rx502_pos, $P10
    ge rx502_pos, rx502_eos, rxscan503_done
  rxscan503_scan:
    set_addr $I10, rxscan503_loop
    rx502_cur."!mark_push"(0, rx502_pos, $I10)
  rxscan503_done:
  alt504_0:
    set_addr $I10, alt504_1
    rx502_cur."!mark_push"(0, rx502_pos, $I10)
  # rx literal  "["
    add $I11, rx502_pos, 1
    gt $I11, rx502_eos, rx502_fail
    sub $I11, rx502_pos, rx502_off
    substr $S10, rx502_tgt, $I11, 1
    ne $S10, "[", rx502_fail
    add rx502_pos, 1
    goto alt504_end
  alt504_1:
    set_addr $I10, alt504_2
    rx502_cur."!mark_push"(0, rx502_pos, $I10)
  # rx literal  "+"
    add $I11, rx502_pos, 1
    gt $I11, rx502_eos, rx502_fail
    sub $I11, rx502_pos, rx502_off
    substr $S10, rx502_tgt, $I11, 1
    ne $S10, "+", rx502_fail
    add rx502_pos, 1
    goto alt504_end
  alt504_2:
  # rx literal  "-"
    add $I11, rx502_pos, 1
    gt $I11, rx502_eos, rx502_fail
    sub $I11, rx502_pos, rx502_off
    substr $S10, rx502_tgt, $I11, 1
    ne $S10, "-", rx502_fail
    add rx502_pos, 1
  alt504_end:
  # rx pass
    rx502_cur."!cursor_pass"(rx502_pos, "")
    rx502_cur."!cursor_debug"("PASS  ", "", " at pos=", rx502_pos)
    .return (rx502_cur)
  rx502_fail:
    (rx502_rep, rx502_pos, $I10, $P10) = rx502_cur."!mark_fail"(0)
    lt rx502_pos, -1, rx502_done
    eq rx502_pos, -1, rx502_fail
    jump $I10
  rx502_done:
    rx502_cur."!cursor_fail"()
    rx502_cur."!cursor_debug"("FAIL  ", "")
    .return (rx502_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "cclass_elem"  :subid("141_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
    .const 'Sub' $P519 = "143_1259078874.10857" 
    capture_lex $P519
    .local string rx508_tgt
    .local int rx508_pos
    .local int rx508_off
    .local int rx508_eos
    .local int rx508_rep
    .local pmc rx508_cur
    (rx508_cur, rx508_pos, rx508_tgt) = self."!cursor_start"()
    rx508_cur."!cursor_debug"("START ", "cclass_elem")
    rx508_cur."!cursor_caparray"("charspec")
    .lex unicode:"$\x{a2}", rx508_cur
    .local pmc match
    .lex "$/", match
    length rx508_eos, rx508_tgt
    set rx508_off, 0
    lt rx508_pos, 2, rx508_start
    sub rx508_off, rx508_pos, 1
    substr rx508_tgt, rx508_tgt, rx508_off
  rx508_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan511_done
    goto rxscan511_scan
  rxscan511_loop:
    ($P10) = rx508_cur."from"()
    inc $P10
    set rx508_pos, $P10
    ge rx508_pos, rx508_eos, rxscan511_done
  rxscan511_scan:
    set_addr $I10, rxscan511_loop
    rx508_cur."!mark_push"(0, rx508_pos, $I10)
  rxscan511_done:
.annotate "line", 161
  # rx subcapture "sign"
    set_addr $I10, rxcap_513_fail
    rx508_cur."!mark_push"(0, rx508_pos, $I10)
  alt512_0:
    set_addr $I10, alt512_1
    rx508_cur."!mark_push"(0, rx508_pos, $I10)
  # rx literal  "+"
    add $I11, rx508_pos, 1
    gt $I11, rx508_eos, rx508_fail
    sub $I11, rx508_pos, rx508_off
    substr $S10, rx508_tgt, $I11, 1
    ne $S10, "+", rx508_fail
    add rx508_pos, 1
    goto alt512_end
  alt512_1:
    set_addr $I10, alt512_2
    rx508_cur."!mark_push"(0, rx508_pos, $I10)
  # rx literal  "-"
    add $I11, rx508_pos, 1
    gt $I11, rx508_eos, rx508_fail
    sub $I11, rx508_pos, rx508_off
    substr $S10, rx508_tgt, $I11, 1
    ne $S10, "-", rx508_fail
    add rx508_pos, 1
    goto alt512_end
  alt512_2:
  alt512_end:
    set_addr $I10, rxcap_513_fail
    ($I12, $I11) = rx508_cur."!mark_peek"($I10)
    rx508_cur."!cursor_pos"($I11)
    ($P10) = rx508_cur."!cursor_start"()
    $P10."!cursor_pass"(rx508_pos, "")
    rx508_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sign")
    goto rxcap_513_done
  rxcap_513_fail:
    goto rx508_fail
  rxcap_513_done:
.annotate "line", 162
  # rx rxquantr514 ** 0..1
    set_addr $I515, rxquantr514_done
    rx508_cur."!mark_push"(0, rx508_pos, $I515)
  rxquantr514_loop:
  # rx subrule "normspace" subtype=method negate=
    rx508_cur."!cursor_pos"(rx508_pos)
    $P10 = rx508_cur."normspace"()
    unless $P10, rx508_fail
    rx508_pos = $P10."pos"()
    (rx508_rep) = rx508_cur."!mark_commit"($I515)
  rxquantr514_done:
  alt516_0:
.annotate "line", 163
    set_addr $I10, alt516_1
    rx508_cur."!mark_push"(0, rx508_pos, $I10)
.annotate "line", 164
  # rx literal  "["
    add $I11, rx508_pos, 1
    gt $I11, rx508_eos, rx508_fail
    sub $I11, rx508_pos, rx508_off
    substr $S10, rx508_tgt, $I11, 1
    ne $S10, "[", rx508_fail
    add rx508_pos, 1
.annotate "line", 167
  # rx rxquantr517 ** 0..*
    set_addr $I542, rxquantr517_done
    rx508_cur."!mark_push"(0, rx508_pos, $I542)
  rxquantr517_loop:
.annotate "line", 164
  # rx subrule $P519 subtype=capture negate=
    rx508_cur."!cursor_pos"(rx508_pos)
    .const 'Sub' $P519 = "143_1259078874.10857" 
    capture_lex $P519
    $P10 = rx508_cur.$P519()
    unless $P10, rx508_fail
    rx508_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charspec")
    rx508_pos = $P10."pos"()
.annotate "line", 167
    (rx508_rep) = rx508_cur."!mark_commit"($I542)
    rx508_cur."!mark_push"(rx508_rep, rx508_pos, $I542)
    goto rxquantr517_loop
  rxquantr517_done:
.annotate "line", 168
  # rx charclass_q s r 0..-1
    sub $I10, rx508_pos, rx508_off
    find_not_cclass $I11, 32, rx508_tgt, $I10, rx508_eos
    add rx508_pos, rx508_off, $I11
  # rx literal  "]"
    add $I11, rx508_pos, 1
    gt $I11, rx508_eos, rx508_fail
    sub $I11, rx508_pos, rx508_off
    substr $S10, rx508_tgt, $I11, 1
    ne $S10, "]", rx508_fail
    add rx508_pos, 1
.annotate "line", 164
    goto alt516_end
  alt516_1:
.annotate "line", 169
  # rx subcapture "name"
    set_addr $I10, rxcap_543_fail
    rx508_cur."!mark_push"(0, rx508_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx508_pos, rx508_off
    find_not_cclass $I11, 8192, rx508_tgt, $I10, rx508_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx508_fail
    add rx508_pos, rx508_off, $I11
    set_addr $I10, rxcap_543_fail
    ($I12, $I11) = rx508_cur."!mark_peek"($I10)
    rx508_cur."!cursor_pos"($I11)
    ($P10) = rx508_cur."!cursor_start"()
    $P10."!cursor_pass"(rx508_pos, "")
    rx508_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_543_done
  rxcap_543_fail:
    goto rx508_fail
  rxcap_543_done:
  alt516_end:
.annotate "line", 171
  # rx rxquantr544 ** 0..1
    set_addr $I545, rxquantr544_done
    rx508_cur."!mark_push"(0, rx508_pos, $I545)
  rxquantr544_loop:
  # rx subrule "normspace" subtype=method negate=
    rx508_cur."!cursor_pos"(rx508_pos)
    $P10 = rx508_cur."normspace"()
    unless $P10, rx508_fail
    rx508_pos = $P10."pos"()
    (rx508_rep) = rx508_cur."!mark_commit"($I545)
  rxquantr544_done:
.annotate "line", 160
  # rx pass
    rx508_cur."!cursor_pass"(rx508_pos, "cclass_elem")
    rx508_cur."!cursor_debug"("PASS  ", "cclass_elem", " at pos=", rx508_pos)
    .return (rx508_cur)
  rx508_fail:
.annotate "line", 3
    (rx508_rep, rx508_pos, $I10, $P10) = rx508_cur."!mark_fail"(0)
    lt rx508_pos, -1, rx508_done
    eq rx508_pos, -1, rx508_fail
    jump $I10
  rx508_done:
    rx508_cur."!cursor_fail"()
    rx508_cur."!cursor_debug"("FAIL  ", "cclass_elem")
    .return (rx508_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__cclass_elem"  :subid("142_1259078874.10857") :method
.annotate "line", 3
    new $P510, "ResizablePMCArray"
    push $P510, ""
    push $P510, "-"
    push $P510, "+"
    .return ($P510)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block518"  :anon :subid("143_1259078874.10857") :method :outer("141_1259078874.10857")
.annotate "line", 164
    .const 'Sub' $P537 = "146_1259078874.10857" 
    capture_lex $P537
    .const 'Sub' $P531 = "145_1259078874.10857" 
    capture_lex $P531
    .const 'Sub' $P526 = "144_1259078874.10857" 
    capture_lex $P526
    .lex unicode:"$\x{a2}", $P520
    .local string rx521_tgt
    .local int rx521_pos
    .local int rx521_off
    .local int rx521_eos
    .local int rx521_rep
    .local pmc rx521_cur
    (rx521_cur, rx521_pos, rx521_tgt) = self."!cursor_start"()
    rx521_cur."!cursor_debug"("START ", "")
    rx521_cur."!cursor_caparray"("1")
    .lex unicode:"$\x{a2}", rx521_cur
    .local pmc match
    .lex "$/", match
    length rx521_eos, rx521_tgt
    set rx521_off, 0
    lt rx521_pos, 2, rx521_start
    sub rx521_off, rx521_pos, 1
    substr rx521_tgt, rx521_tgt, rx521_off
  rx521_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan522_done
    goto rxscan522_scan
  rxscan522_loop:
    ($P10) = rx521_cur."from"()
    inc $P10
    set rx521_pos, $P10
    ge rx521_pos, rx521_eos, rxscan522_done
  rxscan522_scan:
    set_addr $I10, rxscan522_loop
    rx521_cur."!mark_push"(0, rx521_pos, $I10)
  rxscan522_done:
  alt523_0:
    set_addr $I10, alt523_1
    rx521_cur."!mark_push"(0, rx521_pos, $I10)
.annotate "line", 165
  # rx charclass_q s r 0..-1
    sub $I10, rx521_pos, rx521_off
    find_not_cclass $I11, 32, rx521_tgt, $I10, rx521_eos
    add rx521_pos, rx521_off, $I11
  # rx literal  "-"
    add $I11, rx521_pos, 1
    gt $I11, rx521_eos, rx521_fail
    sub $I11, rx521_pos, rx521_off
    substr $S10, rx521_tgt, $I11, 1
    ne $S10, "-", rx521_fail
    add rx521_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx521_cur."!cursor_pos"(rx521_pos)
    $P10 = rx521_cur."obs"("hyphen in enumerated character class", "..")
    unless $P10, rx521_fail
    rx521_pos = $P10."pos"()
    goto alt523_end
  alt523_1:
.annotate "line", 166
  # rx charclass_q s r 0..-1
    sub $I10, rx521_pos, rx521_off
    find_not_cclass $I11, 32, rx521_tgt, $I10, rx521_eos
    add rx521_pos, rx521_off, $I11
  alt524_0:
    set_addr $I10, alt524_1
    rx521_cur."!mark_push"(0, rx521_pos, $I10)
  # rx literal  "\\"
    add $I11, rx521_pos, 1
    gt $I11, rx521_eos, rx521_fail
    sub $I11, rx521_pos, rx521_off
    substr $S10, rx521_tgt, $I11, 1
    ne $S10, "\\", rx521_fail
    add rx521_pos, 1
  # rx subrule $P526 subtype=capture negate=
    rx521_cur."!cursor_pos"(rx521_pos)
    .const 'Sub' $P526 = "144_1259078874.10857" 
    capture_lex $P526
    $P10 = rx521_cur.$P526()
    unless $P10, rx521_fail
    rx521_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"(0)
    rx521_pos = $P10."pos"()
    goto alt524_end
  alt524_1:
  # rx subrule $P531 subtype=capture negate=
    rx521_cur."!cursor_pos"(rx521_pos)
    .const 'Sub' $P531 = "145_1259078874.10857" 
    capture_lex $P531
    $P10 = rx521_cur.$P531()
    unless $P10, rx521_fail
    rx521_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"(0)
    rx521_pos = $P10."pos"()
  alt524_end:
  # rx rxquantr535 ** 0..1
    set_addr $I541, rxquantr535_done
    rx521_cur."!mark_push"(0, rx521_pos, $I541)
  rxquantr535_loop:
  # rx charclass_q s r 0..-1
    sub $I10, rx521_pos, rx521_off
    find_not_cclass $I11, 32, rx521_tgt, $I10, rx521_eos
    add rx521_pos, rx521_off, $I11
  # rx literal  ".."
    add $I11, rx521_pos, 2
    gt $I11, rx521_eos, rx521_fail
    sub $I11, rx521_pos, rx521_off
    substr $S10, rx521_tgt, $I11, 2
    ne $S10, "..", rx521_fail
    add rx521_pos, 2
  # rx charclass_q s r 0..-1
    sub $I10, rx521_pos, rx521_off
    find_not_cclass $I11, 32, rx521_tgt, $I10, rx521_eos
    add rx521_pos, rx521_off, $I11
  # rx subrule $P537 subtype=capture negate=
    rx521_cur."!cursor_pos"(rx521_pos)
    .const 'Sub' $P537 = "146_1259078874.10857" 
    capture_lex $P537
    $P10 = rx521_cur.$P537()
    unless $P10, rx521_fail
    rx521_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("1")
    rx521_pos = $P10."pos"()
    (rx521_rep) = rx521_cur."!mark_commit"($I541)
  rxquantr535_done:
  alt523_end:
.annotate "line", 164
  # rx pass
    rx521_cur."!cursor_pass"(rx521_pos, "")
    rx521_cur."!cursor_debug"("PASS  ", "", " at pos=", rx521_pos)
    .return (rx521_cur)
  rx521_fail:
    (rx521_rep, rx521_pos, $I10, $P10) = rx521_cur."!mark_fail"(0)
    lt rx521_pos, -1, rx521_done
    eq rx521_pos, -1, rx521_fail
    jump $I10
  rx521_done:
    rx521_cur."!cursor_fail"()
    rx521_cur."!cursor_debug"("FAIL  ", "")
    .return (rx521_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block525"  :anon :subid("144_1259078874.10857") :method :outer("143_1259078874.10857")
.annotate "line", 166
    .lex unicode:"$\x{a2}", $P527
    .local string rx528_tgt
    .local int rx528_pos
    .local int rx528_off
    .local int rx528_eos
    .local int rx528_rep
    .local pmc rx528_cur
    (rx528_cur, rx528_pos, rx528_tgt) = self."!cursor_start"()
    rx528_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx528_cur
    .local pmc match
    .lex "$/", match
    length rx528_eos, rx528_tgt
    set rx528_off, 0
    lt rx528_pos, 2, rx528_start
    sub rx528_off, rx528_pos, 1
    substr rx528_tgt, rx528_tgt, rx528_off
  rx528_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan529_done
    goto rxscan529_scan
  rxscan529_loop:
    ($P10) = rx528_cur."from"()
    inc $P10
    set rx528_pos, $P10
    ge rx528_pos, rx528_eos, rxscan529_done
  rxscan529_scan:
    set_addr $I10, rxscan529_loop
    rx528_cur."!mark_push"(0, rx528_pos, $I10)
  rxscan529_done:
  # rx charclass .
    ge rx528_pos, rx528_eos, rx528_fail
    inc rx528_pos
  # rx pass
    rx528_cur."!cursor_pass"(rx528_pos, "")
    rx528_cur."!cursor_debug"("PASS  ", "", " at pos=", rx528_pos)
    .return (rx528_cur)
  rx528_fail:
    (rx528_rep, rx528_pos, $I10, $P10) = rx528_cur."!mark_fail"(0)
    lt rx528_pos, -1, rx528_done
    eq rx528_pos, -1, rx528_fail
    jump $I10
  rx528_done:
    rx528_cur."!cursor_fail"()
    rx528_cur."!cursor_debug"("FAIL  ", "")
    .return (rx528_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block530"  :anon :subid("145_1259078874.10857") :method :outer("143_1259078874.10857")
.annotate "line", 166
    .lex unicode:"$\x{a2}", $P532
    .local string rx533_tgt
    .local int rx533_pos
    .local int rx533_off
    .local int rx533_eos
    .local int rx533_rep
    .local pmc rx533_cur
    (rx533_cur, rx533_pos, rx533_tgt) = self."!cursor_start"()
    rx533_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx533_cur
    .local pmc match
    .lex "$/", match
    length rx533_eos, rx533_tgt
    set rx533_off, 0
    lt rx533_pos, 2, rx533_start
    sub rx533_off, rx533_pos, 1
    substr rx533_tgt, rx533_tgt, rx533_off
  rx533_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan534_done
    goto rxscan534_scan
  rxscan534_loop:
    ($P10) = rx533_cur."from"()
    inc $P10
    set rx533_pos, $P10
    ge rx533_pos, rx533_eos, rxscan534_done
  rxscan534_scan:
    set_addr $I10, rxscan534_loop
    rx533_cur."!mark_push"(0, rx533_pos, $I10)
  rxscan534_done:
  # rx enumcharlist negate=1 
    ge rx533_pos, rx533_eos, rx533_fail
    sub $I10, rx533_pos, rx533_off
    substr $S10, rx533_tgt, $I10, 1
    index $I11, "]\\", $S10
    ge $I11, 0, rx533_fail
    inc rx533_pos
  # rx pass
    rx533_cur."!cursor_pass"(rx533_pos, "")
    rx533_cur."!cursor_debug"("PASS  ", "", " at pos=", rx533_pos)
    .return (rx533_cur)
  rx533_fail:
    (rx533_rep, rx533_pos, $I10, $P10) = rx533_cur."!mark_fail"(0)
    lt rx533_pos, -1, rx533_done
    eq rx533_pos, -1, rx533_fail
    jump $I10
  rx533_done:
    rx533_cur."!cursor_fail"()
    rx533_cur."!cursor_debug"("FAIL  ", "")
    .return (rx533_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block536"  :anon :subid("146_1259078874.10857") :method :outer("143_1259078874.10857")
.annotate "line", 166
    .lex unicode:"$\x{a2}", $P538
    .local string rx539_tgt
    .local int rx539_pos
    .local int rx539_off
    .local int rx539_eos
    .local int rx539_rep
    .local pmc rx539_cur
    (rx539_cur, rx539_pos, rx539_tgt) = self."!cursor_start"()
    rx539_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx539_cur
    .local pmc match
    .lex "$/", match
    length rx539_eos, rx539_tgt
    set rx539_off, 0
    lt rx539_pos, 2, rx539_start
    sub rx539_off, rx539_pos, 1
    substr rx539_tgt, rx539_tgt, rx539_off
  rx539_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan540_done
    goto rxscan540_scan
  rxscan540_loop:
    ($P10) = rx539_cur."from"()
    inc $P10
    set rx539_pos, $P10
    ge rx539_pos, rx539_eos, rxscan540_done
  rxscan540_scan:
    set_addr $I10, rxscan540_loop
    rx539_cur."!mark_push"(0, rx539_pos, $I10)
  rxscan540_done:
  # rx charclass .
    ge rx539_pos, rx539_eos, rx539_fail
    inc rx539_pos
  # rx pass
    rx539_cur."!cursor_pass"(rx539_pos, "")
    rx539_cur."!cursor_debug"("PASS  ", "", " at pos=", rx539_pos)
    .return (rx539_cur)
  rx539_fail:
    (rx539_rep, rx539_pos, $I10, $P10) = rx539_cur."!mark_fail"(0)
    lt rx539_pos, -1, rx539_done
    eq rx539_pos, -1, rx539_fail
    jump $I10
  rx539_done:
    rx539_cur."!cursor_fail"()
    rx539_cur."!cursor_debug"("FAIL  ", "")
    .return (rx539_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_internal"  :subid("147_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
    .const 'Sub' $P555 = "149_1259078874.10857" 
    capture_lex $P555
    .local string rx547_tgt
    .local int rx547_pos
    .local int rx547_off
    .local int rx547_eos
    .local int rx547_rep
    .local pmc rx547_cur
    (rx547_cur, rx547_pos, rx547_tgt) = self."!cursor_start"()
    rx547_cur."!cursor_debug"("START ", "mod_internal")
    rx547_cur."!cursor_caparray"("n")
    .lex unicode:"$\x{a2}", rx547_cur
    .local pmc match
    .lex "$/", match
    length rx547_eos, rx547_tgt
    set rx547_off, 0
    lt rx547_pos, 2, rx547_start
    sub rx547_off, rx547_pos, 1
    substr rx547_tgt, rx547_tgt, rx547_off
  rx547_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan551_done
    goto rxscan551_scan
  rxscan551_loop:
    ($P10) = rx547_cur."from"()
    inc $P10
    set rx547_pos, $P10
    ge rx547_pos, rx547_eos, rxscan551_done
  rxscan551_scan:
    set_addr $I10, rxscan551_loop
    rx547_cur."!mark_push"(0, rx547_pos, $I10)
  rxscan551_done:
  alt552_0:
.annotate "line", 175
    set_addr $I10, alt552_1
    rx547_cur."!mark_push"(0, rx547_pos, $I10)
.annotate "line", 176
  # rx literal  ":"
    add $I11, rx547_pos, 1
    gt $I11, rx547_eos, rx547_fail
    sub $I11, rx547_pos, rx547_off
    substr $S10, rx547_tgt, $I11, 1
    ne $S10, ":", rx547_fail
    add rx547_pos, 1
  # rx rxquantr553 ** 1..1
    set_addr $I560, rxquantr553_done
    rx547_cur."!mark_push"(0, -1, $I560)
  rxquantr553_loop:
  # rx subrule $P555 subtype=capture negate=
    rx547_cur."!cursor_pos"(rx547_pos)
    .const 'Sub' $P555 = "149_1259078874.10857" 
    capture_lex $P555
    $P10 = rx547_cur.$P555()
    unless $P10, rx547_fail
    rx547_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("n")
    rx547_pos = $P10."pos"()
    (rx547_rep) = rx547_cur."!mark_commit"($I560)
  rxquantr553_done:
  # rx subrule "mod_ident" subtype=capture negate=
    rx547_cur."!cursor_pos"(rx547_pos)
    $P10 = rx547_cur."mod_ident"()
    unless $P10, rx547_fail
    rx547_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_ident")
    rx547_pos = $P10."pos"()
  # rxanchor rwb
    le rx547_pos, 0, rx547_fail
    sub $I10, rx547_pos, rx547_off
    is_cclass $I11, 8192, rx547_tgt, $I10
    if $I11, rx547_fail
    dec $I10
    is_cclass $I11, 8192, rx547_tgt, $I10
    unless $I11, rx547_fail
    goto alt552_end
  alt552_1:
.annotate "line", 177
  # rx literal  ":"
    add $I11, rx547_pos, 1
    gt $I11, rx547_eos, rx547_fail
    sub $I11, rx547_pos, rx547_off
    substr $S10, rx547_tgt, $I11, 1
    ne $S10, ":", rx547_fail
    add rx547_pos, 1
  # rx subrule "mod_ident" subtype=capture negate=
    rx547_cur."!cursor_pos"(rx547_pos)
    $P10 = rx547_cur."mod_ident"()
    unless $P10, rx547_fail
    rx547_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_ident")
    rx547_pos = $P10."pos"()
  # rx rxquantr561 ** 0..1
    set_addr $I563, rxquantr561_done
    rx547_cur."!mark_push"(0, rx547_pos, $I563)
  rxquantr561_loop:
  # rx literal  "("
    add $I11, rx547_pos, 1
    gt $I11, rx547_eos, rx547_fail
    sub $I11, rx547_pos, rx547_off
    substr $S10, rx547_tgt, $I11, 1
    ne $S10, "(", rx547_fail
    add rx547_pos, 1
  # rx subcapture "n"
    set_addr $I10, rxcap_562_fail
    rx547_cur."!mark_push"(0, rx547_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx547_pos, rx547_off
    find_not_cclass $I11, 8, rx547_tgt, $I10, rx547_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx547_fail
    add rx547_pos, rx547_off, $I11
    set_addr $I10, rxcap_562_fail
    ($I12, $I11) = rx547_cur."!mark_peek"($I10)
    rx547_cur."!cursor_pos"($I11)
    ($P10) = rx547_cur."!cursor_start"()
    $P10."!cursor_pass"(rx547_pos, "")
    rx547_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("n")
    goto rxcap_562_done
  rxcap_562_fail:
    goto rx547_fail
  rxcap_562_done:
  # rx literal  ")"
    add $I11, rx547_pos, 1
    gt $I11, rx547_eos, rx547_fail
    sub $I11, rx547_pos, rx547_off
    substr $S10, rx547_tgt, $I11, 1
    ne $S10, ")", rx547_fail
    add rx547_pos, 1
    (rx547_rep) = rx547_cur."!mark_commit"($I563)
  rxquantr561_done:
  alt552_end:
.annotate "line", 174
  # rx pass
    rx547_cur."!cursor_pass"(rx547_pos, "mod_internal")
    rx547_cur."!cursor_debug"("PASS  ", "mod_internal", " at pos=", rx547_pos)
    .return (rx547_cur)
  rx547_fail:
.annotate "line", 3
    (rx547_rep, rx547_pos, $I10, $P10) = rx547_cur."!mark_fail"(0)
    lt rx547_pos, -1, rx547_done
    eq rx547_pos, -1, rx547_fail
    jump $I10
  rx547_done:
    rx547_cur."!cursor_fail"()
    rx547_cur."!cursor_debug"("FAIL  ", "mod_internal")
    .return (rx547_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_internal"  :subid("148_1259078874.10857") :method
.annotate "line", 3
    $P549 = self."!PREFIX__!subrule"("mod_ident", ":")
    new $P550, "ResizablePMCArray"
    push $P550, $P549
    push $P550, ":"
    .return ($P550)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block554"  :anon :subid("149_1259078874.10857") :method :outer("147_1259078874.10857")
.annotate "line", 176
    .lex unicode:"$\x{a2}", $P556
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
.sub "mod_ident"  :subid("150_1259078874.10857") :method
.annotate "line", 181
    $P565 = self."!protoregex"("mod_ident")
    .return ($P565)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident"  :subid("151_1259078874.10857") :method
.annotate "line", 181
    $P567 = self."!PREFIX__!protoregex"("mod_ident")
    .return ($P567)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ignorecase>"  :subid("152_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 182
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
.annotate "line", 3
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
.sub "!PREFIX__mod_ident:sym<ignorecase>"  :subid("153_1259078874.10857") :method
.annotate "line", 3
    new $P571, "ResizablePMCArray"
    push $P571, "i"
    .return ($P571)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ratchet>"  :subid("154_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 183
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
.annotate "line", 3
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
.sub "!PREFIX__mod_ident:sym<ratchet>"  :subid("155_1259078874.10857") :method
.annotate "line", 3
    new $P579, "ResizablePMCArray"
    push $P579, "r"
    .return ($P579)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<sigspace>"  :subid("156_1259078874.10857") :method :outer("11_1259078874.10857")
.annotate "line", 3
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
.annotate "line", 184
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
.annotate "line", 3
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
.sub "!PREFIX__mod_ident:sym<sigspace>"  :subid("157_1259078874.10857") :method
.annotate "line", 3
    new $P587, "ResizablePMCArray"
    push $P587, "s"
    .return ($P587)
.end

### .include 'gen/p6regex-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1259078878.34875")
.annotate "line", 0
    get_hll_global $P14, ["Regex";"P6Regex";"Actions"], "_block13" 
    capture_lex $P14
.annotate "line", 4
    get_hll_global $P14, ["Regex";"P6Regex";"Actions"], "_block13" 
    capture_lex $P14
    $P1565 = $P14()
.annotate "line", 1
    .return ($P1565)
.end


.namespace []
.sub "" :load :init :subid("post89") :outer("10_1259078878.34875")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1259078878.34875" 
    .local pmc block
    set block, $P12
    $P1566 = get_root_global ["parrot"], "P6metaclass"
    $P1566."new_class"("Regex::P6Regex::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block13"  :subid("11_1259078878.34875") :outer("10_1259078878.34875")
.annotate "line", 4
    .const 'Sub' $P1532 = "88_1259078878.34875" 
    capture_lex $P1532
    .const 'Sub' $P1463 = "84_1259078878.34875" 
    capture_lex $P1463
    .const 'Sub' $P1395 = "82_1259078878.34875" 
    capture_lex $P1395
    .const 'Sub' $P1322 = "79_1259078878.34875" 
    capture_lex $P1322
    .const 'Sub' $P1308 = "78_1259078878.34875" 
    capture_lex $P1308
    .const 'Sub' $P1284 = "77_1259078878.34875" 
    capture_lex $P1284
    .const 'Sub' $P1266 = "76_1259078878.34875" 
    capture_lex $P1266
    .const 'Sub' $P1252 = "75_1259078878.34875" 
    capture_lex $P1252
    .const 'Sub' $P1221 = "74_1259078878.34875" 
    capture_lex $P1221
    .const 'Sub' $P1190 = "73_1259078878.34875" 
    capture_lex $P1190
    .const 'Sub' $P1174 = "72_1259078878.34875" 
    capture_lex $P1174
    .const 'Sub' $P1158 = "71_1259078878.34875" 
    capture_lex $P1158
    .const 'Sub' $P1142 = "70_1259078878.34875" 
    capture_lex $P1142
    .const 'Sub' $P1126 = "69_1259078878.34875" 
    capture_lex $P1126
    .const 'Sub' $P1110 = "68_1259078878.34875" 
    capture_lex $P1110
    .const 'Sub' $P1094 = "67_1259078878.34875" 
    capture_lex $P1094
    .const 'Sub' $P1078 = "66_1259078878.34875" 
    capture_lex $P1078
    .const 'Sub' $P1054 = "65_1259078878.34875" 
    capture_lex $P1054
    .const 'Sub' $P1039 = "64_1259078878.34875" 
    capture_lex $P1039
    .const 'Sub' $P983 = "63_1259078878.34875" 
    capture_lex $P983
    .const 'Sub' $P962 = "62_1259078878.34875" 
    capture_lex $P962
    .const 'Sub' $P940 = "61_1259078878.34875" 
    capture_lex $P940
    .const 'Sub' $P930 = "60_1259078878.34875" 
    capture_lex $P930
    .const 'Sub' $P920 = "59_1259078878.34875" 
    capture_lex $P920
    .const 'Sub' $P910 = "58_1259078878.34875" 
    capture_lex $P910
    .const 'Sub' $P898 = "57_1259078878.34875" 
    capture_lex $P898
    .const 'Sub' $P886 = "56_1259078878.34875" 
    capture_lex $P886
    .const 'Sub' $P874 = "55_1259078878.34875" 
    capture_lex $P874
    .const 'Sub' $P862 = "54_1259078878.34875" 
    capture_lex $P862
    .const 'Sub' $P850 = "53_1259078878.34875" 
    capture_lex $P850
    .const 'Sub' $P838 = "52_1259078878.34875" 
    capture_lex $P838
    .const 'Sub' $P826 = "51_1259078878.34875" 
    capture_lex $P826
    .const 'Sub' $P814 = "50_1259078878.34875" 
    capture_lex $P814
    .const 'Sub' $P791 = "49_1259078878.34875" 
    capture_lex $P791
    .const 'Sub' $P768 = "48_1259078878.34875" 
    capture_lex $P768
    .const 'Sub' $P750 = "47_1259078878.34875" 
    capture_lex $P750
    .const 'Sub' $P740 = "46_1259078878.34875" 
    capture_lex $P740
    .const 'Sub' $P722 = "45_1259078878.34875" 
    capture_lex $P722
    .const 'Sub' $P675 = "44_1259078878.34875" 
    capture_lex $P675
    .const 'Sub' $P658 = "43_1259078878.34875" 
    capture_lex $P658
    .const 'Sub' $P643 = "42_1259078878.34875" 
    capture_lex $P643
    .const 'Sub' $P628 = "41_1259078878.34875" 
    capture_lex $P628
    .const 'Sub' $P602 = "40_1259078878.34875" 
    capture_lex $P602
    .const 'Sub' $P552 = "38_1259078878.34875" 
    capture_lex $P552
    .const 'Sub' $P484 = "36_1259078878.34875" 
    capture_lex $P484
    .const 'Sub' $P427 = "33_1259078878.34875" 
    capture_lex $P427
    .const 'Sub' $P412 = "32_1259078878.34875" 
    capture_lex $P412
    .const 'Sub' $P386 = "30_1259078878.34875" 
    capture_lex $P386
    .const 'Sub' $P369 = "29_1259078878.34875" 
    capture_lex $P369
    .const 'Sub' $P347 = "28_1259078878.34875" 
    capture_lex $P347
    .const 'Sub' $P315 = "27_1259078878.34875" 
    capture_lex $P315
    .const 'Sub' $P53 = "14_1259078878.34875" 
    capture_lex $P53
    .const 'Sub' $P21 = "13_1259078878.34875" 
    capture_lex $P21
    .const 'Sub' $P16 = "12_1259078878.34875" 
    capture_lex $P16
    get_global $P15, "@MODIFIERS"
    unless_null $P15, vivify_90
    new $P15, "ResizablePMCArray"
    set_global "@MODIFIERS", $P15
  vivify_90:
.annotate "line", 6
    .const 'Sub' $P16 = "12_1259078878.34875" 
    capture_lex $P16
    .lex "INIT", $P16
.annotate "line", 475
    .const 'Sub' $P21 = "13_1259078878.34875" 
    capture_lex $P21
    .lex "buildsub", $P21
.annotate "line", 494
    .const 'Sub' $P53 = "14_1259078878.34875" 
    capture_lex $P53
    .lex "capnames", $P53
.annotate "line", 560
    .const 'Sub' $P315 = "27_1259078878.34875" 
    capture_lex $P315
    .lex "backmod", $P315
.annotate "line", 567
    .const 'Sub' $P347 = "28_1259078878.34875" 
    capture_lex $P347
    .lex "subrule_alias", $P347
.annotate "line", 4
    get_global $P367, "@MODIFIERS"
    find_lex $P368, "INIT"
.annotate "line", 468
    find_lex $P1561, "buildsub"
    find_lex $P1562, "capnames"
    find_lex $P1563, "backmod"
    find_lex $P1564, "subrule_alias"
.annotate "line", 4
    .return ($P1564)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "INIT"  :subid("12_1259078878.34875") :outer("11_1259078878.34875")
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
.sub "buildsub"  :subid("13_1259078878.34875") :outer("11_1259078878.34875")
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
.annotate "line", 486
    find_lex $P44, "$block"
    get_hll_global $P45, ["PAST"], "Var"
    $P46 = $P45."new"(unicode:"$\x{a2}" :named("name"), "lexical" :named("scope"), 1 :named("isdecl"))
    $P44."push"($P46)
.annotate "line", 487
    find_lex $P47, "$block"
    $P47."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
  unless_41_end:
.annotate "line", 489
    find_lex $P48, "$block"
    find_lex $P49, "$rpast"
    $P48."push"($P49)
.annotate "line", 490
    find_lex $P50, "$block"
    $P50."blocktype"("method")
    find_lex $P51, "$block"
.annotate "line", 475
    .return ($P51)
  control_22:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P52, exception, "payload"
    .return ($P52)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "capnames"  :subid("14_1259078878.34875") :outer("11_1259078878.34875")
    .param pmc param_56
    .param pmc param_57
.annotate "line", 494
    .const 'Sub' $P290 = "25_1259078878.34875" 
    capture_lex $P290
    .const 'Sub' $P225 = "22_1259078878.34875" 
    capture_lex $P225
    .const 'Sub' $P181 = "20_1259078878.34875" 
    capture_lex $P181
    .const 'Sub' $P139 = "18_1259078878.34875" 
    capture_lex $P139
    .const 'Sub' $P68 = "15_1259078878.34875" 
    capture_lex $P68
    new $P55, 'ExceptionHandler'
    set_addr $P55, control_54
    $P55."handle_types"(58)
    push_eh $P55
    .lex "$ast", param_56
    .lex "$count", param_57
.annotate "line", 495
    new $P58, "Hash"
    .lex "%capnames", $P58
.annotate "line", 496
    new $P59, "Undef"
    .lex "$pasttype", $P59
.annotate "line", 494
    find_lex $P60, "%capnames"
.annotate "line", 496
    find_lex $P61, "$ast"
    $P62 = $P61."pasttype"()
    store_lex "$pasttype", $P62
.annotate "line", 497
    find_lex $P64, "$pasttype"
    set $S65, $P64
    iseq $I66, $S65, "alt"
    if $I66, if_63
.annotate "line", 510
    find_lex $P130, "$pasttype"
    set $S131, $P130
    iseq $I132, $S131, "concat"
    if $I132, if_129
.annotate "line", 519
    find_lex $P174, "$pasttype"
    set $S175, $P174
    iseq $I176, $S175, "subrule"
    if $I176, if_173
    new $P172, 'Integer'
    set $P172, $I176
    goto if_173_end
  if_173:
    find_lex $P177, "$ast"
    $S178 = $P177."subtype"()
    iseq $I179, $S178, "capture"
    new $P172, 'Integer'
    set $P172, $I179
  if_173_end:
    if $P172, if_171
.annotate "line", 532
    find_lex $P221, "$pasttype"
    set $S222, $P221
    iseq $I223, $S222, "subcapture"
    if $I223, if_220
.annotate "line", 549
    find_lex $P286, "$pasttype"
    set $S287, $P286
    iseq $I288, $S287, "quant"
    unless $I288, if_285_end
    .const 'Sub' $P290 = "25_1259078878.34875" 
    capture_lex $P290
    $P290()
  if_285_end:
    goto if_220_end
  if_220:
.annotate "line", 532
    .const 'Sub' $P225 = "22_1259078878.34875" 
    capture_lex $P225
    $P225()
  if_220_end:
    goto if_171_end
  if_171:
.annotate "line", 519
    .const 'Sub' $P181 = "20_1259078878.34875" 
    capture_lex $P181
    $P181()
  if_171_end:
    goto if_129_end
  if_129:
.annotate "line", 511
    find_lex $P134, "$ast"
    $P135 = $P134."list"()
    defined $I136, $P135
    unless $I136, for_undef_113
    iter $P133, $P135
    new $P169, 'ExceptionHandler'
    set_addr $P169, loop168_handler
    $P169."handle_types"(65, 67, 66)
    push_eh $P169
  loop168_test:
    unless $P133, loop168_done
    shift $P137, $P133
  loop168_redo:
    .const 'Sub' $P139 = "18_1259078878.34875" 
    capture_lex $P139
    $P139($P137)
  loop168_next:
    goto loop168_test
  loop168_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P170, exception, 'type'
    eq $P170, 65, loop168_next
    eq $P170, 67, loop168_redo
  loop168_done:
    pop_eh 
  for_undef_113:
  if_129_end:
.annotate "line", 510
    goto if_63_end
  if_63:
.annotate "line", 497
    .const 'Sub' $P68 = "15_1259078878.34875" 
    capture_lex $P68
    $P68()
  if_63_end:
.annotate "line", 556
    find_lex $P311, "$count"
    find_lex $P312, "%capnames"
    unless_null $P312, vivify_133
    new $P312, "Hash"
    store_lex "%capnames", $P312
  vivify_133:
    set $P312[""], $P311
    find_lex $P313, "%capnames"
.annotate "line", 494
    .return ($P313)
  control_54:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P314, exception, "payload"
    .return ($P314)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block289"  :anon :subid("25_1259078878.34875") :outer("14_1259078878.34875")
.annotate "line", 549
    .const 'Sub' $P301 = "26_1259078878.34875" 
    capture_lex $P301
.annotate "line", 550
    new $P291, "Hash"
    .lex "%astcap", $P291
    find_lex $P292, "$ast"
    unless_null $P292, vivify_93
    new $P292, "ResizablePMCArray"
  vivify_93:
    set $P293, $P292[0]
    unless_null $P293, vivify_94
    new $P293, "Undef"
  vivify_94:
    find_lex $P294, "$count"
    $P295 = "capnames"($P293, $P294)
    store_lex "%astcap", $P295
.annotate "line", 551
    find_lex $P297, "%astcap"
    defined $I298, $P297
    unless $I298, for_undef_95
    iter $P296, $P297
    new $P307, 'ExceptionHandler'
    set_addr $P307, loop306_handler
    $P307."handle_types"(65, 67, 66)
    push_eh $P307
  loop306_test:
    unless $P296, loop306_done
    shift $P299, $P296
  loop306_redo:
    .const 'Sub' $P301 = "26_1259078878.34875" 
    capture_lex $P301
    $P301($P299)
  loop306_next:
    goto loop306_test
  loop306_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P308, exception, 'type'
    eq $P308, 65, loop306_next
    eq $P308, 67, loop306_redo
  loop306_done:
    pop_eh 
  for_undef_95:
.annotate "line", 554
    find_lex $P309, "%astcap"
    unless_null $P309, vivify_97
    new $P309, "Hash"
  vivify_97:
    set $P310, $P309[""]
    unless_null $P310, vivify_98
    new $P310, "Undef"
  vivify_98:
    store_lex "$count", $P310
.annotate "line", 549
    .return ($P310)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block300"  :anon :subid("26_1259078878.34875") :outer("25_1259078878.34875")
    .param pmc param_302
.annotate "line", 551
    .lex "$_", param_302
.annotate "line", 552
    new $P303, "Integer"
    assign $P303, 2
    find_lex $P304, "$_"
    find_lex $P305, "%capnames"
    unless_null $P305, vivify_96
    new $P305, "Hash"
    store_lex "%capnames", $P305
  vivify_96:
    set $P305[$P304], $P303
.annotate "line", 551
    .return ($P303)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block224"  :anon :subid("22_1259078878.34875") :outer("14_1259078878.34875")
.annotate "line", 532
    .const 'Sub' $P267 = "24_1259078878.34875" 
    capture_lex $P267
    .const 'Sub' $P237 = "23_1259078878.34875" 
    capture_lex $P237
.annotate "line", 533
    new $P226, "Undef"
    .lex "$name", $P226
.annotate "line", 534
    new $P227, "ResizablePMCArray"
    .lex "@names", $P227
.annotate "line", 543
    new $P228, "Hash"
    .lex "%x", $P228
.annotate "line", 533
    find_lex $P229, "$ast"
    $P230 = $P229."name"()
    store_lex "$name", $P230
.annotate "line", 534

            $P0 = find_lex '$name'
            $S0 = $P0
            $P231 = split '=', $S0
        
    store_lex "@names", $P231
.annotate "line", 539
    find_lex $P233, "@names"
    defined $I234, $P233
    unless $I234, for_undef_99
    iter $P232, $P233
    new $P256, 'ExceptionHandler'
    set_addr $P256, loop255_handler
    $P256."handle_types"(65, 67, 66)
    push_eh $P256
  loop255_test:
    unless $P232, loop255_done
    shift $P235, $P232
  loop255_redo:
    .const 'Sub' $P237 = "23_1259078878.34875" 
    capture_lex $P237
    $P237($P235)
  loop255_next:
    goto loop255_test
  loop255_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P257, exception, 'type'
    eq $P257, 65, loop255_next
    eq $P257, 67, loop255_redo
  loop255_done:
    pop_eh 
  for_undef_99:
.annotate "line", 543
    find_lex $P258, "$ast"
    unless_null $P258, vivify_101
    new $P258, "ResizablePMCArray"
  vivify_101:
    set $P259, $P258[0]
    unless_null $P259, vivify_102
    new $P259, "Undef"
  vivify_102:
    find_lex $P260, "$count"
    $P261 = "capnames"($P259, $P260)
    store_lex "%x", $P261
.annotate "line", 544
    find_lex $P263, "%x"
    defined $I264, $P263
    unless $I264, for_undef_103
    iter $P262, $P263
    new $P281, 'ExceptionHandler'
    set_addr $P281, loop280_handler
    $P281."handle_types"(65, 67, 66)
    push_eh $P281
  loop280_test:
    unless $P262, loop280_done
    shift $P265, $P262
  loop280_redo:
    .const 'Sub' $P267 = "24_1259078878.34875" 
    capture_lex $P267
    $P267($P265)
  loop280_next:
    goto loop280_test
  loop280_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P282, exception, 'type'
    eq $P282, 65, loop280_next
    eq $P282, 67, loop280_redo
  loop280_done:
    pop_eh 
  for_undef_103:
.annotate "line", 547
    find_lex $P283, "%x"
    unless_null $P283, vivify_109
    new $P283, "Hash"
  vivify_109:
    set $P284, $P283[""]
    unless_null $P284, vivify_110
    new $P284, "Undef"
  vivify_110:
    store_lex "$count", $P284
.annotate "line", 532
    .return ($P284)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block236"  :anon :subid("23_1259078878.34875") :outer("22_1259078878.34875")
    .param pmc param_238
.annotate "line", 539
    .lex "$_", param_238
.annotate "line", 540
    find_lex $P242, "$_"
    set $S243, $P242
    iseq $I244, $S243, "0"
    unless $I244, unless_241
    new $P240, 'Integer'
    set $P240, $I244
    goto unless_241_end
  unless_241:
    find_lex $P245, "$_"
    set $N246, $P245
    new $P247, "Integer"
    assign $P247, 0
    set $N248, $P247
    isgt $I249, $N246, $N248
    new $P240, 'Integer'
    set $P240, $I249
  unless_241_end:
    unless $P240, if_239_end
    find_lex $P250, "$_"
    add $P251, $P250, 1
    store_lex "$count", $P251
  if_239_end:
.annotate "line", 541
    new $P252, "Integer"
    assign $P252, 1
    find_lex $P253, "$_"
    find_lex $P254, "%capnames"
    unless_null $P254, vivify_100
    new $P254, "Hash"
    store_lex "%capnames", $P254
  vivify_100:
    set $P254[$P253], $P252
.annotate "line", 539
    .return ($P252)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block266"  :anon :subid("24_1259078878.34875") :outer("22_1259078878.34875")
    .param pmc param_268
.annotate "line", 544
    .lex "$_", param_268
.annotate "line", 545
    find_lex $P269, "$_"
    find_lex $P270, "%capnames"
    unless_null $P270, vivify_104
    new $P270, "Hash"
  vivify_104:
    set $P271, $P270[$P269]
    unless_null $P271, vivify_105
    new $P271, "Undef"
  vivify_105:
    set $N272, $P271
    new $P273, 'Float'
    set $P273, $N272
    find_lex $P274, "$_"
    find_lex $P275, "%x"
    unless_null $P275, vivify_106
    new $P275, "Hash"
  vivify_106:
    set $P276, $P275[$P274]
    unless_null $P276, vivify_107
    new $P276, "Undef"
  vivify_107:
    add $P277, $P273, $P276
    find_lex $P278, "$_"
    find_lex $P279, "%capnames"
    unless_null $P279, vivify_108
    new $P279, "Hash"
    store_lex "%capnames", $P279
  vivify_108:
    set $P279[$P278], $P277
.annotate "line", 544
    .return ($P277)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block180"  :anon :subid("20_1259078878.34875") :outer("14_1259078878.34875")
.annotate "line", 519
    .const 'Sub' $P199 = "21_1259078878.34875" 
    capture_lex $P199
.annotate "line", 520
    new $P182, "Undef"
    .lex "$name", $P182
.annotate "line", 522
    new $P183, "ResizablePMCArray"
    .lex "@names", $P183
.annotate "line", 520
    find_lex $P184, "$ast"
    $P185 = $P184."name"()
    store_lex "$name", $P185
.annotate "line", 521
    find_lex $P187, "$name"
    set $S188, $P187
    iseq $I189, $S188, ""
    unless $I189, if_186_end
    find_lex $P190, "$count"
    store_lex "$name", $P190
    find_lex $P191, "$ast"
    find_lex $P192, "$name"
    $P191."name"($P192)
  if_186_end:
.annotate "line", 522

            $P0 = find_lex '$name'
            $S0 = $P0
            $P193 = split '=', $S0
        
    store_lex "@names", $P193
.annotate "line", 527
    find_lex $P195, "@names"
    defined $I196, $P195
    unless $I196, for_undef_111
    iter $P194, $P195
    new $P218, 'ExceptionHandler'
    set_addr $P218, loop217_handler
    $P218."handle_types"(65, 67, 66)
    push_eh $P218
  loop217_test:
    unless $P194, loop217_done
    shift $P197, $P194
  loop217_redo:
    .const 'Sub' $P199 = "21_1259078878.34875" 
    capture_lex $P199
    $P199($P197)
  loop217_next:
    goto loop217_test
  loop217_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P219, exception, 'type'
    eq $P219, 65, loop217_next
    eq $P219, 67, loop217_redo
  loop217_done:
    pop_eh 
  for_undef_111:
.annotate "line", 519
    .return ($P194)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block198"  :anon :subid("21_1259078878.34875") :outer("20_1259078878.34875")
    .param pmc param_200
.annotate "line", 527
    .lex "$_", param_200
.annotate "line", 528
    find_lex $P204, "$_"
    set $S205, $P204
    iseq $I206, $S205, "0"
    unless $I206, unless_203
    new $P202, 'Integer'
    set $P202, $I206
    goto unless_203_end
  unless_203:
    find_lex $P207, "$_"
    set $N208, $P207
    new $P209, "Integer"
    assign $P209, 0
    set $N210, $P209
    isgt $I211, $N208, $N210
    new $P202, 'Integer'
    set $P202, $I211
  unless_203_end:
    unless $P202, if_201_end
    find_lex $P212, "$_"
    add $P213, $P212, 1
    store_lex "$count", $P213
  if_201_end:
.annotate "line", 529
    new $P214, "Integer"
    assign $P214, 1
    find_lex $P215, "$_"
    find_lex $P216, "%capnames"
    unless_null $P216, vivify_112
    new $P216, "Hash"
    store_lex "%capnames", $P216
  vivify_112:
    set $P216[$P215], $P214
.annotate "line", 527
    .return ($P214)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block138"  :anon :subid("18_1259078878.34875") :outer("14_1259078878.34875")
    .param pmc param_141
.annotate "line", 511
    .const 'Sub' $P150 = "19_1259078878.34875" 
    capture_lex $P150
.annotate "line", 512
    new $P140, "Hash"
    .lex "%x", $P140
    .lex "$_", param_141
    find_lex $P142, "$_"
    find_lex $P143, "$count"
    $P144 = "capnames"($P142, $P143)
    store_lex "%x", $P144
.annotate "line", 513
    find_lex $P146, "%x"
    defined $I147, $P146
    unless $I147, for_undef_114
    iter $P145, $P146
    new $P164, 'ExceptionHandler'
    set_addr $P164, loop163_handler
    $P164."handle_types"(65, 67, 66)
    push_eh $P164
  loop163_test:
    unless $P145, loop163_done
    shift $P148, $P145
  loop163_redo:
    .const 'Sub' $P150 = "19_1259078878.34875" 
    capture_lex $P150
    $P150($P148)
  loop163_next:
    goto loop163_test
  loop163_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P165, exception, 'type'
    eq $P165, 65, loop163_next
    eq $P165, 67, loop163_redo
  loop163_done:
    pop_eh 
  for_undef_114:
.annotate "line", 516
    find_lex $P166, "%x"
    unless_null $P166, vivify_120
    new $P166, "Hash"
  vivify_120:
    set $P167, $P166[""]
    unless_null $P167, vivify_121
    new $P167, "Undef"
  vivify_121:
    store_lex "$count", $P167
.annotate "line", 511
    .return ($P167)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block149"  :anon :subid("19_1259078878.34875") :outer("18_1259078878.34875")
    .param pmc param_151
.annotate "line", 513
    .lex "$_", param_151
.annotate "line", 514
    find_lex $P152, "$_"
    find_lex $P153, "%capnames"
    unless_null $P153, vivify_115
    new $P153, "Hash"
  vivify_115:
    set $P154, $P153[$P152]
    unless_null $P154, vivify_116
    new $P154, "Undef"
  vivify_116:
    set $N155, $P154
    new $P156, 'Float'
    set $P156, $N155
    find_lex $P157, "$_"
    find_lex $P158, "%x"
    unless_null $P158, vivify_117
    new $P158, "Hash"
  vivify_117:
    set $P159, $P158[$P157]
    unless_null $P159, vivify_118
    new $P159, "Undef"
  vivify_118:
    add $P160, $P156, $P159
    find_lex $P161, "$_"
    find_lex $P162, "%capnames"
    unless_null $P162, vivify_119
    new $P162, "Hash"
    store_lex "%capnames", $P162
  vivify_119:
    set $P162[$P161], $P160
.annotate "line", 513
    .return ($P160)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block67"  :anon :subid("15_1259078878.34875") :outer("14_1259078878.34875")
.annotate "line", 497
    .const 'Sub' $P77 = "16_1259078878.34875" 
    capture_lex $P77
.annotate "line", 498
    new $P69, "Undef"
    .lex "$max", $P69
    find_lex $P70, "$count"
    store_lex "$max", $P70
.annotate "line", 499
    find_lex $P72, "$ast"
    $P73 = $P72."list"()
    defined $I74, $P73
    unless $I74, for_undef_122
    iter $P71, $P73
    new $P126, 'ExceptionHandler'
    set_addr $P126, loop125_handler
    $P126."handle_types"(65, 67, 66)
    push_eh $P126
  loop125_test:
    unless $P71, loop125_done
    shift $P75, $P71
  loop125_redo:
    .const 'Sub' $P77 = "16_1259078878.34875" 
    capture_lex $P77
    $P77($P75)
  loop125_next:
    goto loop125_test
  loop125_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P127, exception, 'type'
    eq $P127, 65, loop125_next
    eq $P127, 67, loop125_redo
  loop125_done:
    pop_eh 
  for_undef_122:
.annotate "line", 508
    find_lex $P128, "$max"
    store_lex "$count", $P128
.annotate "line", 497
    .return ($P128)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block76"  :anon :subid("16_1259078878.34875") :outer("15_1259078878.34875")
    .param pmc param_79
.annotate "line", 499
    .const 'Sub' $P88 = "17_1259078878.34875" 
    capture_lex $P88
.annotate "line", 500
    new $P78, "Hash"
    .lex "%x", $P78
    .lex "$_", param_79
    find_lex $P80, "$_"
    find_lex $P81, "$count"
    $P82 = "capnames"($P80, $P81)
    store_lex "%x", $P82
.annotate "line", 501
    find_lex $P84, "%x"
    defined $I85, $P84
    unless $I85, for_undef_123
    iter $P83, $P84
    new $P113, 'ExceptionHandler'
    set_addr $P113, loop112_handler
    $P113."handle_types"(65, 67, 66)
    push_eh $P113
  loop112_test:
    unless $P83, loop112_done
    shift $P86, $P83
  loop112_redo:
    .const 'Sub' $P88 = "17_1259078878.34875" 
    capture_lex $P88
    $P88($P86)
  loop112_next:
    goto loop112_test
  loop112_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, 'type'
    eq $P114, 65, loop112_next
    eq $P114, 67, loop112_redo
  loop112_done:
    pop_eh 
  for_undef_123:
.annotate "line", 506
    find_lex $P117, "%x"
    unless_null $P117, vivify_129
    new $P117, "Hash"
  vivify_129:
    set $P118, $P117[""]
    unless_null $P118, vivify_130
    new $P118, "Undef"
  vivify_130:
    set $N119, $P118
    find_lex $P120, "$max"
    set $N121, $P120
    isgt $I122, $N119, $N121
    if $I122, if_116
    new $P115, 'Integer'
    set $P115, $I122
    goto if_116_end
  if_116:
    find_lex $P123, "%x"
    unless_null $P123, vivify_131
    new $P123, "Hash"
  vivify_131:
    set $P124, $P123[""]
    unless_null $P124, vivify_132
    new $P124, "Undef"
  vivify_132:
    store_lex "$max", $P124
    set $P115, $P124
  if_116_end:
.annotate "line", 499
    .return ($P115)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block87"  :anon :subid("17_1259078878.34875") :outer("16_1259078878.34875")
    .param pmc param_89
.annotate "line", 501
    .lex "$_", param_89
.annotate "line", 502
    find_lex $P94, "$_"
    find_lex $P95, "%capnames"
    unless_null $P95, vivify_124
    new $P95, "Hash"
  vivify_124:
    set $P96, $P95[$P94]
    unless_null $P96, vivify_125
    new $P96, "Undef"
  vivify_125:
    set $N97, $P96
    new $P98, "Integer"
    assign $P98, 2
    set $N99, $P98
    islt $I100, $N97, $N99
    if $I100, if_93
    new $P92, 'Integer'
    set $P92, $I100
    goto if_93_end
  if_93:
    find_lex $P101, "$_"
    find_lex $P102, "%x"
    unless_null $P102, vivify_126
    new $P102, "Hash"
  vivify_126:
    set $P103, $P102[$P101]
    unless_null $P103, vivify_127
    new $P103, "Undef"
  vivify_127:
    set $N104, $P103
    new $P105, "Integer"
    assign $P105, 1
    set $N106, $P105
    iseq $I107, $N104, $N106
    new $P92, 'Integer'
    set $P92, $I107
  if_93_end:
    if $P92, if_91
    new $P109, "Integer"
    assign $P109, 2
    set $P90, $P109
    goto if_91_end
  if_91:
    new $P108, "Integer"
    assign $P108, 1
    set $P90, $P108
  if_91_end:
.annotate "line", 503
    find_lex $P110, "$_"
    find_lex $P111, "%capnames"
    unless_null $P111, vivify_128
    new $P111, "Hash"
    store_lex "%capnames", $P111
  vivify_128:
    set $P111[$P110], $P90
.annotate "line", 501
    .return ($P90)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backmod"  :subid("27_1259078878.34875") :outer("11_1259078878.34875")
    .param pmc param_318
    .param pmc param_319
.annotate "line", 560
    new $P317, 'ExceptionHandler'
    set_addr $P317, control_316
    $P317."handle_types"(58)
    push_eh $P317
    .lex "$ast", param_318
    .lex "$backmod", param_319
.annotate "line", 561
    find_lex $P321, "$backmod"
    set $S322, $P321
    iseq $I323, $S322, ":"
    if $I323, if_320
.annotate "line", 562
    find_lex $P328, "$backmod"
    set $S329, $P328
    iseq $I330, $S329, ":?"
    unless $I330, unless_327
    new $P326, 'Integer'
    set $P326, $I330
    goto unless_327_end
  unless_327:
    find_lex $P331, "$backmod"
    set $S332, $P331
    iseq $I333, $S332, "?"
    new $P326, 'Integer'
    set $P326, $I333
  unless_327_end:
    if $P326, if_325
.annotate "line", 563
    find_lex $P338, "$backmod"
    set $S339, $P338
    iseq $I340, $S339, ":!"
    unless $I340, unless_337
    new $P336, 'Integer'
    set $P336, $I340
    goto unless_337_end
  unless_337:
    find_lex $P341, "$backmod"
    set $S342, $P341
    iseq $I343, $S342, "!"
    new $P336, 'Integer'
    set $P336, $I343
  unless_337_end:
    unless $P336, if_335_end
    find_lex $P344, "$ast"
    $P344."backtrack"("g")
  if_335_end:
    goto if_325_end
  if_325:
.annotate "line", 562
    find_lex $P334, "$ast"
    $P334."backtrack"("f")
  if_325_end:
    goto if_320_end
  if_320:
.annotate "line", 561
    find_lex $P324, "$ast"
    $P324."backtrack"("r")
  if_320_end:
    find_lex $P345, "$ast"
.annotate "line", 560
    .return ($P345)
  control_316:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P346, exception, "payload"
    .return ($P346)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "subrule_alias"  :subid("28_1259078878.34875") :outer("11_1259078878.34875")
    .param pmc param_350
    .param pmc param_351
.annotate "line", 567
    new $P349, 'ExceptionHandler'
    set_addr $P349, control_348
    $P349."handle_types"(58)
    push_eh $P349
    .lex "$past", param_350
    .lex "$name", param_351
.annotate "line", 568
    find_lex $P353, "$past"
    $S354 = $P353."name"()
    isgt $I355, $S354, ""
    if $I355, if_352
.annotate "line", 569
    find_lex $P362, "$past"
    find_lex $P363, "$name"
    $P362."name"($P363)
    goto if_352_end
  if_352:
.annotate "line", 568
    find_lex $P356, "$past"
    find_lex $P357, "$name"
    concat $P358, $P357, "="
    find_lex $P359, "$past"
    $S360 = $P359."name"()
    concat $P361, $P358, $S360
    $P356."name"($P361)
  if_352_end:
.annotate "line", 570
    find_lex $P364, "$past"
    $P365 = $P364."subtype"("capture")
.annotate "line", 567
    .return ($P365)
  control_348:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P366, exception, "payload"
    .return ($P366)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "arg"  :subid("29_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_372
.annotate "line", 14
    new $P371, 'ExceptionHandler'
    set_addr $P371, control_370
    $P371."handle_types"(58)
    push_eh $P371
    .lex "self", self
    .lex "$/", param_372
.annotate "line", 15
    find_lex $P373, "$/"
    find_lex $P376, "$/"
    unless_null $P376, vivify_134
    new $P376, "Hash"
  vivify_134:
    set $P377, $P376["quote_EXPR"]
    unless_null $P377, vivify_135
    new $P377, "Undef"
  vivify_135:
    if $P377, if_375
    find_lex $P381, "$/"
    unless_null $P381, vivify_136
    new $P381, "Hash"
  vivify_136:
    set $P382, $P381["val"]
    unless_null $P382, vivify_137
    new $P382, "Undef"
  vivify_137:
    set $N383, $P382
    new $P374, 'Float'
    set $P374, $N383
    goto if_375_end
  if_375:
    find_lex $P378, "$/"
    unless_null $P378, vivify_138
    new $P378, "Hash"
  vivify_138:
    set $P379, $P378["quote_EXPR"]
    unless_null $P379, vivify_139
    new $P379, "Undef"
  vivify_139:
    $P380 = $P379."ast"()
    set $P374, $P380
  if_375_end:
    $P384 = $P373."!make"($P374)
.annotate "line", 14
    .return ($P384)
  control_370:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P385, exception, "payload"
    .return ($P385)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "arglist"  :subid("30_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_389
.annotate "line", 18
    .const 'Sub' $P399 = "31_1259078878.34875" 
    capture_lex $P399
    new $P388, 'ExceptionHandler'
    set_addr $P388, control_387
    $P388."handle_types"(58)
    push_eh $P388
    .lex "self", self
    .lex "$/", param_389
.annotate "line", 19
    new $P390, "Undef"
    .lex "$past", $P390
    get_hll_global $P391, ["PAST"], "Op"
    $P392 = $P391."new"("list" :named("pasttype"))
    store_lex "$past", $P392
.annotate "line", 20
    find_lex $P394, "$/"
    unless_null $P394, vivify_140
    new $P394, "Hash"
  vivify_140:
    set $P395, $P394["arg"]
    unless_null $P395, vivify_141
    new $P395, "Undef"
  vivify_141:
    defined $I396, $P395
    unless $I396, for_undef_142
    iter $P393, $P395
    new $P406, 'ExceptionHandler'
    set_addr $P406, loop405_handler
    $P406."handle_types"(65, 67, 66)
    push_eh $P406
  loop405_test:
    unless $P393, loop405_done
    shift $P397, $P393
  loop405_redo:
    .const 'Sub' $P399 = "31_1259078878.34875" 
    capture_lex $P399
    $P399($P397)
  loop405_next:
    goto loop405_test
  loop405_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P407, exception, 'type'
    eq $P407, 65, loop405_next
    eq $P407, 67, loop405_redo
  loop405_done:
    pop_eh 
  for_undef_142:
.annotate "line", 21
    find_lex $P408, "$/"
    find_lex $P409, "$past"
    $P410 = $P408."!make"($P409)
.annotate "line", 18
    .return ($P410)
  control_387:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P411, exception, "payload"
    .return ($P411)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block398"  :anon :subid("31_1259078878.34875") :outer("30_1259078878.34875")
    .param pmc param_400
.annotate "line", 20
    .lex "$_", param_400
    find_lex $P401, "$past"
    find_lex $P402, "$_"
    $P403 = $P402."ast"()
    $P404 = $P401."push"($P403)
    .return ($P404)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "TOP"  :subid("32_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_415
.annotate "line", 24
    new $P414, 'ExceptionHandler'
    set_addr $P414, control_413
    $P414."handle_types"(58)
    push_eh $P414
    .lex "self", self
    .lex "$/", param_415
.annotate "line", 25
    new $P416, "Undef"
    .lex "$past", $P416
    find_lex $P417, "$/"
    unless_null $P417, vivify_143
    new $P417, "Hash"
  vivify_143:
    set $P418, $P417["nibbler"]
    unless_null $P418, vivify_144
    new $P418, "Undef"
  vivify_144:
    $P419 = $P418."ast"()
    $P420 = "buildsub"($P419)
    store_lex "$past", $P420
.annotate "line", 26
    find_lex $P421, "$past"
    find_lex $P422, "$/"
    $P421."node"($P422)
.annotate "line", 27
    find_lex $P423, "$/"
    find_lex $P424, "$past"
    $P425 = $P423."!make"($P424)
.annotate "line", 24
    .return ($P425)
  control_413:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P426, exception, "payload"
    .return ($P426)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "nibbler"  :subid("33_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_430
    .param pmc param_431 :optional
    .param int has_param_431 :opt_flag
.annotate "line", 30
    .const 'Sub' $P467 = "35_1259078878.34875" 
    capture_lex $P467
    .const 'Sub' $P439 = "34_1259078878.34875" 
    capture_lex $P439
    new $P429, 'ExceptionHandler'
    set_addr $P429, control_428
    $P429."handle_types"(58)
    push_eh $P429
    .lex "self", self
    .lex "$/", param_430
    if has_param_431, optparam_145
    new $P432, "Undef"
    set param_431, $P432
  optparam_145:
    .lex "$key", param_431
.annotate "line", 42
    new $P433, "Undef"
    .lex "$past", $P433
.annotate "line", 31
    find_lex $P435, "$key"
    set $S436, $P435
    iseq $I437, $S436, "open"
    unless $I437, if_434_end
    .const 'Sub' $P439 = "34_1259078878.34875" 
    capture_lex $P439
    $P439()
  if_434_end:
.annotate "line", 41
    get_global $P449, "@MODIFIERS"
    $P449."shift"()
    find_lex $P450, "$past"
.annotate "line", 43
    find_lex $P452, "$/"
    unless_null $P452, vivify_148
    new $P452, "Hash"
  vivify_148:
    set $P453, $P452["termish"]
    unless_null $P453, vivify_149
    new $P453, "Undef"
  vivify_149:
    set $N454, $P453
    new $P455, "Integer"
    assign $P455, 1
    set $N456, $P455
    isgt $I457, $N454, $N456
    if $I457, if_451
.annotate "line", 50
    find_lex $P476, "$/"
    unless_null $P476, vivify_150
    new $P476, "Hash"
  vivify_150:
    set $P477, $P476["termish"]
    unless_null $P477, vivify_151
    new $P477, "ResizablePMCArray"
  vivify_151:
    set $P478, $P477[0]
    unless_null $P478, vivify_152
    new $P478, "Undef"
  vivify_152:
    $P479 = $P478."ast"()
    store_lex "$past", $P479
.annotate "line", 49
    goto if_451_end
  if_451:
.annotate "line", 44
    get_hll_global $P458, ["PAST"], "Regex"
    find_lex $P459, "$/"
    $P460 = $P458."new"("alt" :named("pasttype"), $P459 :named("node"))
    store_lex "$past", $P460
.annotate "line", 45
    find_lex $P462, "$/"
    unless_null $P462, vivify_153
    new $P462, "Hash"
  vivify_153:
    set $P463, $P462["termish"]
    unless_null $P463, vivify_154
    new $P463, "Undef"
  vivify_154:
    defined $I464, $P463
    unless $I464, for_undef_155
    iter $P461, $P463
    new $P474, 'ExceptionHandler'
    set_addr $P474, loop473_handler
    $P474."handle_types"(65, 67, 66)
    push_eh $P474
  loop473_test:
    unless $P461, loop473_done
    shift $P465, $P461
  loop473_redo:
    .const 'Sub' $P467 = "35_1259078878.34875" 
    capture_lex $P467
    $P467($P465)
  loop473_next:
    goto loop473_test
  loop473_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P475, exception, 'type'
    eq $P475, 65, loop473_next
    eq $P475, 67, loop473_redo
  loop473_done:
    pop_eh 
  for_undef_155:
  if_451_end:
.annotate "line", 52
    find_lex $P480, "$/"
    find_lex $P481, "$past"
    $P482 = $P480."!make"($P481)
.annotate "line", 30
    .return ($P482)
  control_428:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P483, exception, "payload"
    .return ($P483)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block438"  :anon :subid("34_1259078878.34875") :outer("33_1259078878.34875")
.annotate "line", 32
    new $P440, "Hash"
    .lex "%old", $P440
.annotate "line", 33
    new $P441, "Hash"
    .lex "%new", $P441
.annotate "line", 32
    get_global $P442, "@MODIFIERS"
    unless_null $P442, vivify_146
    new $P442, "ResizablePMCArray"
  vivify_146:
    set $P443, $P442[0]
    unless_null $P443, vivify_147
    new $P443, "Undef"
  vivify_147:
    store_lex "%old", $P443
.annotate "line", 33

                       $P0 = find_lex '%old'
                       $P444 = clone $P0
                   
    store_lex "%new", $P444
.annotate "line", 37
    get_global $P445, "@MODIFIERS"
    find_lex $P446, "%new"
    $P445."unshift"($P446)
.annotate "line", 38
    new $P447, "Exception"
    set $P447['type'], 58
    new $P448, "Integer"
    assign $P448, 1
    setattribute $P447, 'payload', $P448
    throw $P447
.annotate "line", 31
    .return ()
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block466"  :anon :subid("35_1259078878.34875") :outer("33_1259078878.34875")
    .param pmc param_468
.annotate "line", 45
    .lex "$_", param_468
.annotate "line", 46
    find_lex $P469, "$past"
    find_lex $P470, "$_"
    $P471 = $P470."ast"()
    $P472 = $P469."push"($P471)
.annotate "line", 45
    .return ($P472)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "termish"  :subid("36_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_487
.annotate "line", 55
    .const 'Sub' $P500 = "37_1259078878.34875" 
    capture_lex $P500
    new $P486, 'ExceptionHandler'
    set_addr $P486, control_485
    $P486."handle_types"(58)
    push_eh $P486
    .lex "self", self
    .lex "$/", param_487
.annotate "line", 56
    new $P488, "Undef"
    .lex "$past", $P488
.annotate "line", 57
    new $P489, "Undef"
    .lex "$lastlit", $P489
.annotate "line", 56
    get_hll_global $P490, ["PAST"], "Regex"
    find_lex $P491, "$/"
    $P492 = $P490."new"("concat" :named("pasttype"), $P491 :named("node"))
    store_lex "$past", $P492
.annotate "line", 57
    new $P493, "Integer"
    assign $P493, 0
    store_lex "$lastlit", $P493
.annotate "line", 58
    find_lex $P495, "$/"
    unless_null $P495, vivify_156
    new $P495, "Hash"
  vivify_156:
    set $P496, $P495["noun"]
    unless_null $P496, vivify_157
    new $P496, "Undef"
  vivify_157:
    defined $I497, $P496
    unless $I497, for_undef_158
    iter $P494, $P496
    new $P546, 'ExceptionHandler'
    set_addr $P546, loop545_handler
    $P546."handle_types"(65, 67, 66)
    push_eh $P546
  loop545_test:
    unless $P494, loop545_done
    shift $P498, $P494
  loop545_redo:
    .const 'Sub' $P500 = "37_1259078878.34875" 
    capture_lex $P500
    $P500($P498)
  loop545_next:
    goto loop545_test
  loop545_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P547, exception, 'type'
    eq $P547, 65, loop545_next
    eq $P547, 67, loop545_redo
  loop545_done:
    pop_eh 
  for_undef_158:
.annotate "line", 73
    find_lex $P548, "$/"
    find_lex $P549, "$past"
    $P550 = $P548."!make"($P549)
.annotate "line", 55
    .return ($P550)
  control_485:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P551, exception, "payload"
    .return ($P551)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block499"  :anon :subid("37_1259078878.34875") :outer("36_1259078878.34875")
    .param pmc param_502
.annotate "line", 59
    new $P501, "Undef"
    .lex "$ast", $P501
    .lex "$_", param_502
    find_lex $P503, "$_"
    $P504 = $P503."ast"()
    store_lex "$ast", $P504
.annotate "line", 60
    find_lex $P507, "$ast"
    if $P507, if_506
    set $P505, $P507
    goto if_506_end
  if_506:
.annotate "line", 61
    find_lex $P514, "$lastlit"
    if $P514, if_513
    set $P512, $P514
    goto if_513_end
  if_513:
    find_lex $P515, "$ast"
    $S516 = $P515."pasttype"()
    iseq $I517, $S516, "literal"
    new $P512, 'Integer'
    set $P512, $I517
  if_513_end:
    if $P512, if_511
    set $P510, $P512
    goto if_511_end
  if_511:
.annotate "line", 62
    get_hll_global $P518, ["PAST"], "Node"
    find_lex $P519, "$ast"
    unless_null $P519, vivify_159
    new $P519, "ResizablePMCArray"
  vivify_159:
    set $P520, $P519[0]
    unless_null $P520, vivify_160
    new $P520, "Undef"
  vivify_160:
    $P521 = $P518."ACCEPTS"($P520)
    isfalse $I522, $P521
    new $P510, 'Integer'
    set $P510, $I522
  if_511_end:
    if $P510, if_509
.annotate "line", 66
    find_lex $P529, "$past"
    find_lex $P530, "$ast"
    $P529."push"($P530)
.annotate "line", 67
    find_lex $P535, "$ast"
    $S536 = $P535."pasttype"()
    iseq $I537, $S536, "literal"
    if $I537, if_534
    new $P533, 'Integer'
    set $P533, $I537
    goto if_534_end
  if_534:
.annotate "line", 68
    get_hll_global $P538, ["PAST"], "Node"
    find_lex $P539, "$ast"
    unless_null $P539, vivify_161
    new $P539, "ResizablePMCArray"
  vivify_161:
    set $P540, $P539[0]
    unless_null $P540, vivify_162
    new $P540, "Undef"
  vivify_162:
    $P541 = $P538."ACCEPTS"($P540)
    isfalse $I542, $P541
    new $P533, 'Integer'
    set $P533, $I542
  if_534_end:
    if $P533, if_532
    new $P544, "Integer"
    assign $P544, 0
    set $P531, $P544
    goto if_532_end
  if_532:
    find_lex $P543, "$ast"
    set $P531, $P543
  if_532_end:
.annotate "line", 69
    store_lex "$lastlit", $P531
.annotate "line", 65
    set $P508, $P531
.annotate "line", 62
    goto if_509_end
  if_509:
.annotate "line", 63
    find_lex $P523, "$lastlit"
    unless_null $P523, vivify_163
    new $P523, "ResizablePMCArray"
  vivify_163:
    set $P524, $P523[0]
    unless_null $P524, vivify_164
    new $P524, "Undef"
  vivify_164:
    find_lex $P525, "$ast"
    unless_null $P525, vivify_165
    new $P525, "ResizablePMCArray"
  vivify_165:
    set $P526, $P525[0]
    unless_null $P526, vivify_166
    new $P526, "Undef"
  vivify_166:
    concat $P527, $P524, $P526
    find_lex $P528, "$lastlit"
    unless_null $P528, vivify_167
    new $P528, "ResizablePMCArray"
    store_lex "$lastlit", $P528
  vivify_167:
    set $P528[0], $P527
.annotate "line", 62
    set $P508, $P527
  if_509_end:
.annotate "line", 60
    set $P505, $P508
  if_506_end:
.annotate "line", 58
    .return ($P505)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantified_atom"  :subid("38_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_555
.annotate "line", 76
    .const 'Sub' $P564 = "39_1259078878.34875" 
    capture_lex $P564
    new $P554, 'ExceptionHandler'
    set_addr $P554, control_553
    $P554."handle_types"(58)
    push_eh $P554
    .lex "self", self
    .lex "$/", param_555
.annotate "line", 77
    new $P556, "Undef"
    .lex "$past", $P556
    find_lex $P557, "$/"
    unless_null $P557, vivify_168
    new $P557, "Hash"
  vivify_168:
    set $P558, $P557["atom"]
    unless_null $P558, vivify_169
    new $P558, "Undef"
  vivify_169:
    $P559 = $P558."ast"()
    store_lex "$past", $P559
.annotate "line", 78
    find_lex $P561, "$/"
    unless_null $P561, vivify_170
    new $P561, "Hash"
  vivify_170:
    set $P562, $P561["quantifier"]
    unless_null $P562, vivify_171
    new $P562, "Undef"
  vivify_171:
    if $P562, if_560
.annotate "line", 84
    find_lex $P578, "$/"
    unless_null $P578, vivify_172
    new $P578, "Hash"
  vivify_172:
    set $P579, $P578["backmod"]
    unless_null $P579, vivify_173
    new $P579, "ResizablePMCArray"
  vivify_173:
    set $P580, $P579[0]
    unless_null $P580, vivify_174
    new $P580, "Undef"
  vivify_174:
    unless $P580, if_577_end
    find_lex $P581, "$past"
    find_lex $P582, "$/"
    unless_null $P582, vivify_175
    new $P582, "Hash"
  vivify_175:
    set $P583, $P582["backmod"]
    unless_null $P583, vivify_176
    new $P583, "ResizablePMCArray"
  vivify_176:
    set $P584, $P583[0]
    unless_null $P584, vivify_177
    new $P584, "Undef"
  vivify_177:
    "backmod"($P581, $P584)
  if_577_end:
    goto if_560_end
  if_560:
.annotate "line", 78
    .const 'Sub' $P564 = "39_1259078878.34875" 
    capture_lex $P564
    $P564()
  if_560_end:
.annotate "line", 85
    find_lex $P590, "$past"
    if $P590, if_589
    set $P588, $P590
    goto if_589_end
  if_589:
    find_lex $P591, "$past"
    $P592 = $P591."backtrack"()
    isfalse $I593, $P592
    new $P588, 'Integer'
    set $P588, $I593
  if_589_end:
    if $P588, if_587
    set $P586, $P588
    goto if_587_end
  if_587:
    get_global $P594, "@MODIFIERS"
    unless_null $P594, vivify_181
    new $P594, "ResizablePMCArray"
  vivify_181:
    set $P595, $P594[0]
    unless_null $P595, vivify_182
    new $P595, "Hash"
  vivify_182:
    set $P596, $P595["r"]
    unless_null $P596, vivify_183
    new $P596, "Undef"
  vivify_183:
    set $P586, $P596
  if_587_end:
    unless $P586, if_585_end
.annotate "line", 86
    find_lex $P597, "$past"
    $P597."backtrack"("r")
  if_585_end:
.annotate "line", 88
    find_lex $P598, "$/"
    find_lex $P599, "$past"
    $P600 = $P598."!make"($P599)
.annotate "line", 76
    .return ($P600)
  control_553:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P601, exception, "payload"
    .return ($P601)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block563"  :anon :subid("39_1259078878.34875") :outer("38_1259078878.34875")
.annotate "line", 80
    new $P565, "Undef"
    .lex "$qast", $P565
.annotate "line", 79
    find_lex $P567, "$past"
    isfalse $I568, $P567
    unless $I568, if_566_end
    find_lex $P569, "$/"
    $P569."panic"("Can't quantify zero-width atom")
  if_566_end:
.annotate "line", 80
    find_lex $P570, "$/"
    unless_null $P570, vivify_178
    new $P570, "Hash"
  vivify_178:
    set $P571, $P570["quantifier"]
    unless_null $P571, vivify_179
    new $P571, "ResizablePMCArray"
  vivify_179:
    set $P572, $P571[0]
    unless_null $P572, vivify_180
    new $P572, "Undef"
  vivify_180:
    $P573 = $P572."ast"()
    store_lex "$qast", $P573
.annotate "line", 81
    find_lex $P574, "$qast"
    find_lex $P575, "$past"
    $P574."unshift"($P575)
.annotate "line", 82
    find_lex $P576, "$qast"
    store_lex "$past", $P576
.annotate "line", 78
    .return ($P576)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "atom"  :subid("40_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_605
.annotate "line", 91
    new $P604, 'ExceptionHandler'
    set_addr $P604, control_603
    $P604."handle_types"(58)
    push_eh $P604
    .lex "self", self
    .lex "$/", param_605
.annotate "line", 92
    new $P606, "Undef"
    .lex "$past", $P606
.annotate "line", 91
    find_lex $P607, "$past"
.annotate "line", 93
    find_lex $P609, "$/"
    unless_null $P609, vivify_184
    new $P609, "Hash"
  vivify_184:
    set $P610, $P609["metachar"]
    unless_null $P610, vivify_185
    new $P610, "Undef"
  vivify_185:
    if $P610, if_608
.annotate "line", 95
    get_hll_global $P614, ["PAST"], "Regex"
    find_lex $P615, "$/"
    set $S616, $P615
    find_lex $P617, "$/"
    $P618 = $P614."new"($S616, "literal" :named("pasttype"), $P617 :named("node"))
    store_lex "$past", $P618
.annotate "line", 96
    get_global $P620, "@MODIFIERS"
    unless_null $P620, vivify_186
    new $P620, "ResizablePMCArray"
  vivify_186:
    set $P621, $P620[0]
    unless_null $P621, vivify_187
    new $P621, "Hash"
  vivify_187:
    set $P622, $P621["i"]
    unless_null $P622, vivify_188
    new $P622, "Undef"
  vivify_188:
    unless $P622, if_619_end
    find_lex $P623, "$past"
    $P623."subtype"("ignorecase")
  if_619_end:
.annotate "line", 94
    goto if_608_end
  if_608:
.annotate "line", 93
    find_lex $P611, "$/"
    unless_null $P611, vivify_189
    new $P611, "Hash"
  vivify_189:
    set $P612, $P611["metachar"]
    unless_null $P612, vivify_190
    new $P612, "Undef"
  vivify_190:
    $P613 = $P612."ast"()
    store_lex "$past", $P613
  if_608_end:
.annotate "line", 98
    find_lex $P624, "$/"
    find_lex $P625, "$past"
    $P626 = $P624."!make"($P625)
.annotate "line", 91
    .return ($P626)
  control_603:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P627, exception, "payload"
    .return ($P627)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<*>"  :subid("41_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_631
.annotate "line", 101
    new $P630, 'ExceptionHandler'
    set_addr $P630, control_629
    $P630."handle_types"(58)
    push_eh $P630
    .lex "self", self
    .lex "$/", param_631
.annotate "line", 102
    new $P632, "Undef"
    .lex "$past", $P632
    get_hll_global $P633, ["PAST"], "Regex"
    find_lex $P634, "$/"
    $P635 = $P633."new"("quant" :named("pasttype"), $P634 :named("node"))
    store_lex "$past", $P635
.annotate "line", 103
    find_lex $P636, "$/"
    find_lex $P637, "$past"
    find_lex $P638, "$/"
    unless_null $P638, vivify_191
    new $P638, "Hash"
  vivify_191:
    set $P639, $P638["backmod"]
    unless_null $P639, vivify_192
    new $P639, "Undef"
  vivify_192:
    $P640 = "backmod"($P637, $P639)
    $P641 = $P636."!make"($P640)
.annotate "line", 101
    .return ($P641)
  control_629:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P642, exception, "payload"
    .return ($P642)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<+>"  :subid("42_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_646
.annotate "line", 106
    new $P645, 'ExceptionHandler'
    set_addr $P645, control_644
    $P645."handle_types"(58)
    push_eh $P645
    .lex "self", self
    .lex "$/", param_646
.annotate "line", 107
    new $P647, "Undef"
    .lex "$past", $P647
    get_hll_global $P648, ["PAST"], "Regex"
    find_lex $P649, "$/"
    $P650 = $P648."new"("quant" :named("pasttype"), 1 :named("min"), $P649 :named("node"))
    store_lex "$past", $P650
.annotate "line", 108
    find_lex $P651, "$/"
    find_lex $P652, "$past"
    find_lex $P653, "$/"
    unless_null $P653, vivify_193
    new $P653, "Hash"
  vivify_193:
    set $P654, $P653["backmod"]
    unless_null $P654, vivify_194
    new $P654, "Undef"
  vivify_194:
    $P655 = "backmod"($P652, $P654)
    $P656 = $P651."!make"($P655)
.annotate "line", 106
    .return ($P656)
  control_644:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P657, exception, "payload"
    .return ($P657)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<?>"  :subid("43_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_661
.annotate "line", 111
    new $P660, 'ExceptionHandler'
    set_addr $P660, control_659
    $P660."handle_types"(58)
    push_eh $P660
    .lex "self", self
    .lex "$/", param_661
.annotate "line", 112
    new $P662, "Undef"
    .lex "$past", $P662
    get_hll_global $P663, ["PAST"], "Regex"
    find_lex $P664, "$/"
    $P665 = $P663."new"("quant" :named("pasttype"), 0 :named("min"), 1 :named("max"), $P664 :named("node"))
    store_lex "$past", $P665
.annotate "line", 113
    find_lex $P666, "$/"
    find_lex $P667, "$past"
    find_lex $P668, "$/"
    unless_null $P668, vivify_195
    new $P668, "Hash"
  vivify_195:
    set $P669, $P668["backmod"]
    unless_null $P669, vivify_196
    new $P669, "Undef"
  vivify_196:
    $P670 = "backmod"($P667, $P669)
    $P666."!make"($P670)
.annotate "line", 114
    find_lex $P671, "$/"
    find_lex $P672, "$past"
    $P673 = $P671."!make"($P672)
.annotate "line", 111
    .return ($P673)
  control_659:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P674, exception, "payload"
    .return ($P674)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<**>"  :subid("44_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_678
.annotate "line", 117
    new $P677, 'ExceptionHandler'
    set_addr $P677, control_676
    $P677."handle_types"(58)
    push_eh $P677
    .lex "self", self
    .lex "$/", param_678
.annotate "line", 118
    new $P679, "Undef"
    .lex "$past", $P679
.annotate "line", 117
    find_lex $P680, "$past"
.annotate "line", 119
    find_lex $P682, "$/"
    unless_null $P682, vivify_197
    new $P682, "Hash"
  vivify_197:
    set $P683, $P682["quantified_atom"]
    unless_null $P683, vivify_198
    new $P683, "Undef"
  vivify_198:
    if $P683, if_681
.annotate "line", 124
    get_hll_global $P690, ["PAST"], "Regex"
    find_lex $P691, "$/"
    unless_null $P691, vivify_199
    new $P691, "Hash"
  vivify_199:
    set $P692, $P691["min"]
    unless_null $P692, vivify_200
    new $P692, "Undef"
  vivify_200:
    set $N693, $P692
    find_lex $P694, "$/"
    $P695 = $P690."new"("quant" :named("pasttype"), $N693 :named("min"), $P694 :named("node"))
    store_lex "$past", $P695
.annotate "line", 125
    find_lex $P697, "$/"
    unless_null $P697, vivify_201
    new $P697, "Hash"
  vivify_201:
    set $P698, $P697["max"]
    unless_null $P698, vivify_202
    new $P698, "Undef"
  vivify_202:
    isfalse $I699, $P698
    if $I699, if_696
.annotate "line", 126
    find_lex $P705, "$/"
    unless_null $P705, vivify_203
    new $P705, "Hash"
  vivify_203:
    set $P706, $P705["max"]
    unless_null $P706, vivify_204
    new $P706, "ResizablePMCArray"
  vivify_204:
    set $P707, $P706[0]
    unless_null $P707, vivify_205
    new $P707, "Undef"
  vivify_205:
    set $S708, $P707
    isne $I709, $S708, "*"
    unless $I709, if_704_end
    find_lex $P710, "$past"
    find_lex $P711, "$/"
    unless_null $P711, vivify_206
    new $P711, "Hash"
  vivify_206:
    set $P712, $P711["max"]
    unless_null $P712, vivify_207
    new $P712, "ResizablePMCArray"
  vivify_207:
    set $P713, $P712[0]
    unless_null $P713, vivify_208
    new $P713, "Undef"
  vivify_208:
    set $N714, $P713
    $P710."max"($N714)
  if_704_end:
    goto if_696_end
  if_696:
.annotate "line", 125
    find_lex $P700, "$past"
    find_lex $P701, "$/"
    unless_null $P701, vivify_209
    new $P701, "Hash"
  vivify_209:
    set $P702, $P701["min"]
    unless_null $P702, vivify_210
    new $P702, "Undef"
  vivify_210:
    set $N703, $P702
    $P700."max"($N703)
  if_696_end:
.annotate "line", 123
    goto if_681_end
  if_681:
.annotate "line", 120
    get_hll_global $P684, ["PAST"], "Regex"
.annotate "line", 121
    find_lex $P685, "$/"
    unless_null $P685, vivify_211
    new $P685, "Hash"
  vivify_211:
    set $P686, $P685["quantified_atom"]
    unless_null $P686, vivify_212
    new $P686, "Undef"
  vivify_212:
    $P687 = $P686."ast"()
    find_lex $P688, "$/"
    $P689 = $P684."new"("quant" :named("pasttype"), 1 :named("min"), $P687 :named("sep"), $P688 :named("node"))
.annotate "line", 120
    store_lex "$past", $P689
  if_681_end:
.annotate "line", 128
    find_lex $P715, "$/"
    find_lex $P716, "$past"
    find_lex $P717, "$/"
    unless_null $P717, vivify_213
    new $P717, "Hash"
  vivify_213:
    set $P718, $P717["backmod"]
    unless_null $P718, vivify_214
    new $P718, "Undef"
  vivify_214:
    $P719 = "backmod"($P716, $P718)
    $P720 = $P715."!make"($P719)
.annotate "line", 117
    .return ($P720)
  control_676:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P721, exception, "payload"
    .return ($P721)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<ws>"  :subid("45_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_725
.annotate "line", 131
    new $P724, 'ExceptionHandler'
    set_addr $P724, control_723
    $P724."handle_types"(58)
    push_eh $P724
    .lex "self", self
    .lex "$/", param_725
.annotate "line", 132
    new $P726, "Undef"
    .lex "$past", $P726
.annotate "line", 133
    get_global $P729, "@MODIFIERS"
    unless_null $P729, vivify_215
    new $P729, "ResizablePMCArray"
  vivify_215:
    set $P730, $P729[0]
    unless_null $P730, vivify_216
    new $P730, "Hash"
  vivify_216:
    set $P731, $P730["s"]
    unless_null $P731, vivify_217
    new $P731, "Undef"
  vivify_217:
    if $P731, if_728
    new $P735, "Integer"
    assign $P735, 0
    set $P727, $P735
    goto if_728_end
  if_728:
    get_hll_global $P732, ["PAST"], "Regex"
    find_lex $P733, "$/"
    $P734 = $P732."new"("ws", "subrule" :named("pasttype"), "method" :named("subtype"), $P733 :named("node"))
    set $P727, $P734
  if_728_end:
    store_lex "$past", $P727
.annotate "line", 136
    find_lex $P736, "$/"
    find_lex $P737, "$past"
    $P738 = $P736."!make"($P737)
.annotate "line", 131
    .return ($P738)
  control_723:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P739, exception, "payload"
    .return ($P739)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<[ ]>"  :subid("46_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_743
.annotate "line", 140
    new $P742, 'ExceptionHandler'
    set_addr $P742, control_741
    $P742."handle_types"(58)
    push_eh $P742
    .lex "self", self
    .lex "$/", param_743
.annotate "line", 141
    find_lex $P744, "$/"
    find_lex $P745, "$/"
    unless_null $P745, vivify_218
    new $P745, "Hash"
  vivify_218:
    set $P746, $P745["nibbler"]
    unless_null $P746, vivify_219
    new $P746, "Undef"
  vivify_219:
    $P747 = $P746."ast"()
    $P748 = $P744."!make"($P747)
.annotate "line", 140
    .return ($P748)
  control_741:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P749, exception, "payload"
    .return ($P749)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<( )>"  :subid("47_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_753
.annotate "line", 144
    new $P752, 'ExceptionHandler'
    set_addr $P752, control_751
    $P752."handle_types"(58)
    push_eh $P752
    .lex "self", self
    .lex "$/", param_753
.annotate "line", 145
    new $P754, "Undef"
    .lex "$subpast", $P754
.annotate "line", 146
    new $P755, "Undef"
    .lex "$past", $P755
.annotate "line", 145
    find_lex $P756, "$/"
    unless_null $P756, vivify_220
    new $P756, "Hash"
  vivify_220:
    set $P757, $P756["nibbler"]
    unless_null $P757, vivify_221
    new $P757, "Undef"
  vivify_221:
    $P758 = $P757."ast"()
    $P759 = "buildsub"($P758)
    store_lex "$subpast", $P759
.annotate "line", 146
    get_hll_global $P760, ["PAST"], "Regex"
    find_lex $P761, "$subpast"
    find_lex $P762, "$/"
    $P763 = $P760."new"($P761, "subrule" :named("pasttype"), "capture" :named("subtype"), $P762 :named("node"))
    store_lex "$past", $P763
.annotate "line", 148
    find_lex $P764, "$/"
    find_lex $P765, "$past"
    $P766 = $P764."!make"($P765)
.annotate "line", 144
    .return ($P766)
  control_751:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P767, exception, "payload"
    .return ($P767)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<'>"  :subid("48_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_771
.annotate "line", 151
    new $P770, 'ExceptionHandler'
    set_addr $P770, control_769
    $P770."handle_types"(58)
    push_eh $P770
    .lex "self", self
    .lex "$/", param_771
.annotate "line", 152
    new $P772, "Undef"
    .lex "$quote", $P772
.annotate "line", 154
    new $P773, "Undef"
    .lex "$past", $P773
.annotate "line", 152
    find_lex $P774, "$/"
    unless_null $P774, vivify_222
    new $P774, "Hash"
  vivify_222:
    set $P775, $P774["quote_EXPR"]
    unless_null $P775, vivify_223
    new $P775, "Undef"
  vivify_223:
    $P776 = $P775."ast"()
    store_lex "$quote", $P776
.annotate "line", 153
    get_hll_global $P778, ["PAST"], "Val"
    find_lex $P779, "$quote"
    $P780 = $P778."ACCEPTS"($P779)
    unless $P780, if_777_end
    find_lex $P781, "$quote"
    $P782 = $P781."value"()
    store_lex "$quote", $P782
  if_777_end:
.annotate "line", 154
    get_hll_global $P783, ["PAST"], "Regex"
    find_lex $P784, "$quote"
    find_lex $P785, "$/"
    $P786 = $P783."new"($P784, "literal" :named("pasttype"), $P785 :named("node"))
    store_lex "$past", $P786
.annotate "line", 155
    find_lex $P787, "$/"
    find_lex $P788, "$past"
    $P789 = $P787."!make"($P788)
.annotate "line", 151
    .return ($P789)
  control_769:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P790, exception, "payload"
    .return ($P790)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<\">"  :subid("49_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_794
.annotate "line", 158
    new $P793, 'ExceptionHandler'
    set_addr $P793, control_792
    $P793."handle_types"(58)
    push_eh $P793
    .lex "self", self
    .lex "$/", param_794
.annotate "line", 159
    new $P795, "Undef"
    .lex "$quote", $P795
.annotate "line", 161
    new $P796, "Undef"
    .lex "$past", $P796
.annotate "line", 159
    find_lex $P797, "$/"
    unless_null $P797, vivify_224
    new $P797, "Hash"
  vivify_224:
    set $P798, $P797["quote_EXPR"]
    unless_null $P798, vivify_225
    new $P798, "Undef"
  vivify_225:
    $P799 = $P798."ast"()
    store_lex "$quote", $P799
.annotate "line", 160
    get_hll_global $P801, ["PAST"], "Val"
    find_lex $P802, "$quote"
    $P803 = $P801."ACCEPTS"($P802)
    unless $P803, if_800_end
    find_lex $P804, "$quote"
    $P805 = $P804."value"()
    store_lex "$quote", $P805
  if_800_end:
.annotate "line", 161
    get_hll_global $P806, ["PAST"], "Regex"
    find_lex $P807, "$quote"
    find_lex $P808, "$/"
    $P809 = $P806."new"($P807, "literal" :named("pasttype"), $P808 :named("node"))
    store_lex "$past", $P809
.annotate "line", 162
    find_lex $P810, "$/"
    find_lex $P811, "$past"
    $P812 = $P810."!make"($P811)
.annotate "line", 158
    .return ($P812)
  control_792:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P813, exception, "payload"
    .return ($P813)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<.>"  :subid("50_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_817
.annotate "line", 165
    new $P816, 'ExceptionHandler'
    set_addr $P816, control_815
    $P816."handle_types"(58)
    push_eh $P816
    .lex "self", self
    .lex "$/", param_817
.annotate "line", 166
    new $P818, "Undef"
    .lex "$past", $P818
    get_hll_global $P819, ["PAST"], "Regex"
    find_lex $P820, "$/"
    $P821 = $P819."new"("charclass" :named("pasttype"), "." :named("subtype"), $P820 :named("node"))
    store_lex "$past", $P821
.annotate "line", 167
    find_lex $P822, "$/"
    find_lex $P823, "$past"
    $P824 = $P822."!make"($P823)
.annotate "line", 165
    .return ($P824)
  control_815:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P825, exception, "payload"
    .return ($P825)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<^>"  :subid("51_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_829
.annotate "line", 170
    new $P828, 'ExceptionHandler'
    set_addr $P828, control_827
    $P828."handle_types"(58)
    push_eh $P828
    .lex "self", self
    .lex "$/", param_829
.annotate "line", 171
    new $P830, "Undef"
    .lex "$past", $P830
    get_hll_global $P831, ["PAST"], "Regex"
    find_lex $P832, "$/"
    $P833 = $P831."new"("anchor" :named("pasttype"), "bos" :named("subtype"), $P832 :named("node"))
    store_lex "$past", $P833
.annotate "line", 172
    find_lex $P834, "$/"
    find_lex $P835, "$past"
    $P836 = $P834."!make"($P835)
.annotate "line", 170
    .return ($P836)
  control_827:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P837, exception, "payload"
    .return ($P837)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<^^>"  :subid("52_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_841
.annotate "line", 175
    new $P840, 'ExceptionHandler'
    set_addr $P840, control_839
    $P840."handle_types"(58)
    push_eh $P840
    .lex "self", self
    .lex "$/", param_841
.annotate "line", 176
    new $P842, "Undef"
    .lex "$past", $P842
    get_hll_global $P843, ["PAST"], "Regex"
    find_lex $P844, "$/"
    $P845 = $P843."new"("anchor" :named("pasttype"), "bol" :named("subtype"), $P844 :named("node"))
    store_lex "$past", $P845
.annotate "line", 177
    find_lex $P846, "$/"
    find_lex $P847, "$past"
    $P848 = $P846."!make"($P847)
.annotate "line", 175
    .return ($P848)
  control_839:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P849, exception, "payload"
    .return ($P849)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<$>"  :subid("53_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_853
.annotate "line", 180
    new $P852, 'ExceptionHandler'
    set_addr $P852, control_851
    $P852."handle_types"(58)
    push_eh $P852
    .lex "self", self
    .lex "$/", param_853
.annotate "line", 181
    new $P854, "Undef"
    .lex "$past", $P854
    get_hll_global $P855, ["PAST"], "Regex"
    find_lex $P856, "$/"
    $P857 = $P855."new"("anchor" :named("pasttype"), "eos" :named("subtype"), $P856 :named("node"))
    store_lex "$past", $P857
.annotate "line", 182
    find_lex $P858, "$/"
    find_lex $P859, "$past"
    $P860 = $P858."!make"($P859)
.annotate "line", 180
    .return ($P860)
  control_851:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P861, exception, "payload"
    .return ($P861)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<$$>"  :subid("54_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_865
.annotate "line", 185
    new $P864, 'ExceptionHandler'
    set_addr $P864, control_863
    $P864."handle_types"(58)
    push_eh $P864
    .lex "self", self
    .lex "$/", param_865
.annotate "line", 186
    new $P866, "Undef"
    .lex "$past", $P866
    get_hll_global $P867, ["PAST"], "Regex"
    find_lex $P868, "$/"
    $P869 = $P867."new"("anchor" :named("pasttype"), "eol" :named("subtype"), $P868 :named("node"))
    store_lex "$past", $P869
.annotate "line", 187
    find_lex $P870, "$/"
    find_lex $P871, "$past"
    $P872 = $P870."!make"($P871)
.annotate "line", 185
    .return ($P872)
  control_863:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P873, exception, "payload"
    .return ($P873)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<:::>"  :subid("55_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_877
.annotate "line", 190
    new $P876, 'ExceptionHandler'
    set_addr $P876, control_875
    $P876."handle_types"(58)
    push_eh $P876
    .lex "self", self
    .lex "$/", param_877
.annotate "line", 191
    new $P878, "Undef"
    .lex "$past", $P878
    get_hll_global $P879, ["PAST"], "Regex"
    find_lex $P880, "$/"
    $P881 = $P879."new"("cut" :named("pasttype"), $P880 :named("node"))
    store_lex "$past", $P881
.annotate "line", 192
    find_lex $P882, "$/"
    find_lex $P883, "$past"
    $P884 = $P882."!make"($P883)
.annotate "line", 190
    .return ($P884)
  control_875:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P885, exception, "payload"
    .return ($P885)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<lwb>"  :subid("56_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_889
.annotate "line", 195
    new $P888, 'ExceptionHandler'
    set_addr $P888, control_887
    $P888."handle_types"(58)
    push_eh $P888
    .lex "self", self
    .lex "$/", param_889
.annotate "line", 196
    new $P890, "Undef"
    .lex "$past", $P890
    get_hll_global $P891, ["PAST"], "Regex"
    find_lex $P892, "$/"
    $P893 = $P891."new"("anchor" :named("pasttype"), "lwb" :named("subtype"), $P892 :named("node"))
    store_lex "$past", $P893
.annotate "line", 197
    find_lex $P894, "$/"
    find_lex $P895, "$past"
    $P896 = $P894."!make"($P895)
.annotate "line", 195
    .return ($P896)
  control_887:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P897, exception, "payload"
    .return ($P897)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<rwb>"  :subid("57_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_901
.annotate "line", 200
    new $P900, 'ExceptionHandler'
    set_addr $P900, control_899
    $P900."handle_types"(58)
    push_eh $P900
    .lex "self", self
    .lex "$/", param_901
.annotate "line", 201
    new $P902, "Undef"
    .lex "$past", $P902
    get_hll_global $P903, ["PAST"], "Regex"
    find_lex $P904, "$/"
    $P905 = $P903."new"("anchor" :named("pasttype"), "rwb" :named("subtype"), $P904 :named("node"))
    store_lex "$past", $P905
.annotate "line", 202
    find_lex $P906, "$/"
    find_lex $P907, "$past"
    $P908 = $P906."!make"($P907)
.annotate "line", 200
    .return ($P908)
  control_899:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P909, exception, "payload"
    .return ($P909)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<bs>"  :subid("58_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_913
.annotate "line", 205
    new $P912, 'ExceptionHandler'
    set_addr $P912, control_911
    $P912."handle_types"(58)
    push_eh $P912
    .lex "self", self
    .lex "$/", param_913
.annotate "line", 206
    find_lex $P914, "$/"
    find_lex $P915, "$/"
    unless_null $P915, vivify_226
    new $P915, "Hash"
  vivify_226:
    set $P916, $P915["backslash"]
    unless_null $P916, vivify_227
    new $P916, "Undef"
  vivify_227:
    $P917 = $P916."ast"()
    $P918 = $P914."!make"($P917)
.annotate "line", 205
    .return ($P918)
  control_911:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P919, exception, "payload"
    .return ($P919)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<mod>"  :subid("59_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_923
.annotate "line", 209
    new $P922, 'ExceptionHandler'
    set_addr $P922, control_921
    $P922."handle_types"(58)
    push_eh $P922
    .lex "self", self
    .lex "$/", param_923
.annotate "line", 210
    find_lex $P924, "$/"
    find_lex $P925, "$/"
    unless_null $P925, vivify_228
    new $P925, "Hash"
  vivify_228:
    set $P926, $P925["mod_internal"]
    unless_null $P926, vivify_229
    new $P926, "Undef"
  vivify_229:
    $P927 = $P926."ast"()
    $P928 = $P924."!make"($P927)
.annotate "line", 209
    .return ($P928)
  control_921:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P929, exception, "payload"
    .return ($P929)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<assert>"  :subid("60_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_933
.annotate "line", 213
    new $P932, 'ExceptionHandler'
    set_addr $P932, control_931
    $P932."handle_types"(58)
    push_eh $P932
    .lex "self", self
    .lex "$/", param_933
.annotate "line", 214
    find_lex $P934, "$/"
    find_lex $P935, "$/"
    unless_null $P935, vivify_230
    new $P935, "Hash"
  vivify_230:
    set $P936, $P935["assertion"]
    unless_null $P936, vivify_231
    new $P936, "Undef"
  vivify_231:
    $P937 = $P936."ast"()
    $P938 = $P934."!make"($P937)
.annotate "line", 213
    .return ($P938)
  control_931:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P939, exception, "payload"
    .return ($P939)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<~>"  :subid("61_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_943
.annotate "line", 217
    new $P942, 'ExceptionHandler'
    set_addr $P942, control_941
    $P942."handle_types"(58)
    push_eh $P942
    .lex "self", self
    .lex "$/", param_943
.annotate "line", 218
    find_lex $P944, "$/"
    get_hll_global $P945, ["PAST"], "Regex"
.annotate "line", 219
    find_lex $P946, "$/"
    unless_null $P946, vivify_232
    new $P946, "Hash"
  vivify_232:
    set $P947, $P946["EXPR"]
    unless_null $P947, vivify_233
    new $P947, "Undef"
  vivify_233:
    $P948 = $P947."ast"()
.annotate "line", 220
    get_hll_global $P949, ["PAST"], "Regex"
.annotate "line", 221
    find_lex $P950, "$/"
    unless_null $P950, vivify_234
    new $P950, "Hash"
  vivify_234:
    set $P951, $P950["GOAL"]
    unless_null $P951, vivify_235
    new $P951, "Undef"
  vivify_235:
    $P952 = $P951."ast"()
.annotate "line", 222
    get_hll_global $P953, ["PAST"], "Regex"
    find_lex $P954, "$/"
    unless_null $P954, vivify_236
    new $P954, "Hash"
  vivify_236:
    set $P955, $P954["GOAL"]
    unless_null $P955, vivify_237
    new $P955, "Undef"
  vivify_237:
    set $S956, $P955
    $P957 = $P953."new"("FAILGOAL", $S956, "subrule" :named("pasttype"), "method" :named("subtype"))
    $P958 = $P949."new"($P952, $P957, "alt" :named("pasttype"))
.annotate "line", 220
    $P959 = $P945."new"($P948, $P958, "concat" :named("pasttype"))
.annotate "line", 218
    $P960 = $P944."!make"($P959)
.annotate "line", 217
    .return ($P960)
  control_941:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P961, exception, "payload"
    .return ($P961)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<{*}>"  :subid("62_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_965
.annotate "line", 230
    new $P964, 'ExceptionHandler'
    set_addr $P964, control_963
    $P964."handle_types"(58)
    push_eh $P964
    .lex "self", self
    .lex "$/", param_965
.annotate "line", 231
    new $P966, "Undef"
    .lex "$past", $P966
.annotate "line", 232
    find_lex $P969, "$/"
    unless_null $P969, vivify_238
    new $P969, "Hash"
  vivify_238:
    set $P970, $P969["key"]
    unless_null $P970, vivify_239
    new $P970, "Undef"
  vivify_239:
    if $P970, if_968
    new $P978, "Integer"
    assign $P978, 0
    set $P967, $P978
    goto if_968_end
  if_968:
    get_hll_global $P971, ["PAST"], "Regex"
    find_lex $P972, "$/"
    unless_null $P972, vivify_240
    new $P972, "Hash"
  vivify_240:
    set $P973, $P972["key"]
    unless_null $P973, vivify_241
    new $P973, "ResizablePMCArray"
  vivify_241:
    set $P974, $P973[0]
    unless_null $P974, vivify_242
    new $P974, "Undef"
  vivify_242:
    set $S975, $P974
    find_lex $P976, "$/"
    $P977 = $P971."new"($S975, "reduce" :named("pasttype"), $P976 :named("node"))
    set $P967, $P977
  if_968_end:
    store_lex "$past", $P967
.annotate "line", 234
    find_lex $P979, "$/"
    find_lex $P980, "$past"
    $P981 = $P979."!make"($P980)
.annotate "line", 230
    .return ($P981)
  control_963:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P982, exception, "payload"
    .return ($P982)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<var>"  :subid("63_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_986
.annotate "line", 237
    new $P985, 'ExceptionHandler'
    set_addr $P985, control_984
    $P985."handle_types"(58)
    push_eh $P985
    .lex "self", self
    .lex "$/", param_986
.annotate "line", 238
    new $P987, "Undef"
    .lex "$past", $P987
.annotate "line", 239
    new $P988, "Undef"
    .lex "$name", $P988
.annotate "line", 237
    find_lex $P989, "$past"
.annotate "line", 239
    find_lex $P992, "$/"
    unless_null $P992, vivify_243
    new $P992, "Hash"
  vivify_243:
    set $P993, $P992["pos"]
    unless_null $P993, vivify_244
    new $P993, "Undef"
  vivify_244:
    if $P993, if_991
    find_lex $P997, "$/"
    unless_null $P997, vivify_245
    new $P997, "Hash"
  vivify_245:
    set $P998, $P997["name"]
    unless_null $P998, vivify_246
    new $P998, "Undef"
  vivify_246:
    set $S999, $P998
    new $P990, 'String'
    set $P990, $S999
    goto if_991_end
  if_991:
    find_lex $P994, "$/"
    unless_null $P994, vivify_247
    new $P994, "Hash"
  vivify_247:
    set $P995, $P994["pos"]
    unless_null $P995, vivify_248
    new $P995, "Undef"
  vivify_248:
    set $N996, $P995
    new $P990, 'Float'
    set $P990, $N996
  if_991_end:
    store_lex "$name", $P990
.annotate "line", 240
    find_lex $P1001, "$/"
    unless_null $P1001, vivify_249
    new $P1001, "Hash"
  vivify_249:
    set $P1002, $P1001["quantified_atom"]
    unless_null $P1002, vivify_250
    new $P1002, "Undef"
  vivify_250:
    if $P1002, if_1000
.annotate "line", 251
    get_hll_global $P1031, ["PAST"], "Regex"
    find_lex $P1032, "$name"
    find_lex $P1033, "$/"
    $P1034 = $P1031."new"("!BACKREF", $P1032, "subrule" :named("pasttype"), "method" :named("subtype"), $P1033 :named("node"))
    store_lex "$past", $P1034
.annotate "line", 250
    goto if_1000_end
  if_1000:
.annotate "line", 241
    find_lex $P1003, "$/"
    unless_null $P1003, vivify_251
    new $P1003, "Hash"
  vivify_251:
    set $P1004, $P1003["quantified_atom"]
    unless_null $P1004, vivify_252
    new $P1004, "ResizablePMCArray"
  vivify_252:
    set $P1005, $P1004[0]
    unless_null $P1005, vivify_253
    new $P1005, "Undef"
  vivify_253:
    $P1006 = $P1005."ast"()
    store_lex "$past", $P1006
.annotate "line", 242
    find_lex $P1010, "$past"
    $S1011 = $P1010."pasttype"()
    iseq $I1012, $S1011, "quant"
    if $I1012, if_1009
    new $P1008, 'Integer'
    set $P1008, $I1012
    goto if_1009_end
  if_1009:
    find_lex $P1013, "$past"
    unless_null $P1013, vivify_254
    new $P1013, "ResizablePMCArray"
  vivify_254:
    set $P1014, $P1013[0]
    unless_null $P1014, vivify_255
    new $P1014, "Undef"
  vivify_255:
    $S1015 = $P1014."pasttype"()
    iseq $I1016, $S1015, "subrule"
    new $P1008, 'Integer'
    set $P1008, $I1016
  if_1009_end:
    if $P1008, if_1007
.annotate "line", 245
    find_lex $P1021, "$past"
    $S1022 = $P1021."pasttype"()
    iseq $I1023, $S1022, "subrule"
    if $I1023, if_1020
.annotate "line", 247
    get_hll_global $P1026, ["PAST"], "Regex"
    find_lex $P1027, "$past"
    find_lex $P1028, "$name"
    find_lex $P1029, "$/"
    $P1030 = $P1026."new"($P1027, $P1028 :named("name"), "subcapture" :named("pasttype"), $P1029 :named("node"))
    store_lex "$past", $P1030
.annotate "line", 246
    goto if_1020_end
  if_1020:
.annotate "line", 245
    find_lex $P1024, "$past"
    find_lex $P1025, "$name"
    "subrule_alias"($P1024, $P1025)
  if_1020_end:
    goto if_1007_end
  if_1007:
.annotate "line", 243
    find_lex $P1017, "$past"
    unless_null $P1017, vivify_256
    new $P1017, "ResizablePMCArray"
  vivify_256:
    set $P1018, $P1017[0]
    unless_null $P1018, vivify_257
    new $P1018, "Undef"
  vivify_257:
    find_lex $P1019, "$name"
    "subrule_alias"($P1018, $P1019)
  if_1007_end:
  if_1000_end:
.annotate "line", 254
    find_lex $P1035, "$/"
    find_lex $P1036, "$past"
    $P1037 = $P1035."!make"($P1036)
.annotate "line", 237
    .return ($P1037)
  control_984:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1038, exception, "payload"
    .return ($P1038)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<PIR>"  :subid("64_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_1042
.annotate "line", 257
    new $P1041, 'ExceptionHandler'
    set_addr $P1041, control_1040
    $P1041."handle_types"(58)
    push_eh $P1041
    .lex "self", self
    .lex "$/", param_1042
.annotate "line", 258
    find_lex $P1043, "$/"
    get_hll_global $P1044, ["PAST"], "Regex"
.annotate "line", 259
    get_hll_global $P1045, ["PAST"], "Op"
    find_lex $P1046, "$/"
    unless_null $P1046, vivify_258
    new $P1046, "Hash"
  vivify_258:
    set $P1047, $P1046["pir"]
    unless_null $P1047, vivify_259
    new $P1047, "Undef"
  vivify_259:
    set $S1048, $P1047
    $P1049 = $P1045."new"($S1048 :named("inline"), "inline" :named("pasttype"))
    find_lex $P1050, "$/"
    $P1051 = $P1044."new"($P1049, "pastnode" :named("pasttype"), $P1050 :named("node"))
.annotate "line", 258
    $P1052 = $P1043."!make"($P1051)
.annotate "line", 257
    .return ($P1052)
  control_1040:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1053, exception, "payload"
    .return ($P1053)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<w>"  :subid("65_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_1057
.annotate "line", 265
    new $P1056, 'ExceptionHandler'
    set_addr $P1056, control_1055
    $P1056."handle_types"(58)
    push_eh $P1056
    .lex "self", self
    .lex "$/", param_1057
.annotate "line", 266
    new $P1058, "Undef"
    .lex "$subtype", $P1058
.annotate "line", 267
    new $P1059, "Undef"
    .lex "$past", $P1059
.annotate "line", 266
    find_lex $P1062, "$/"
    unless_null $P1062, vivify_260
    new $P1062, "Hash"
  vivify_260:
    set $P1063, $P1062["sym"]
    unless_null $P1063, vivify_261
    new $P1063, "Undef"
  vivify_261:
    set $S1064, $P1063
    iseq $I1065, $S1064, "n"
    if $I1065, if_1061
    find_lex $P1067, "$/"
    unless_null $P1067, vivify_262
    new $P1067, "Hash"
  vivify_262:
    set $P1068, $P1067["sym"]
    unless_null $P1068, vivify_263
    new $P1068, "Undef"
  vivify_263:
    set $S1069, $P1068
    new $P1060, 'String'
    set $P1060, $S1069
    goto if_1061_end
  if_1061:
    new $P1066, "String"
    assign $P1066, "nl"
    set $P1060, $P1066
  if_1061_end:
    store_lex "$subtype", $P1060
.annotate "line", 267
    get_hll_global $P1070, ["PAST"], "Regex"
    find_lex $P1071, "$subtype"
    find_lex $P1072, "$/"
    $P1073 = $P1070."new"("charclass" :named("pasttype"), $P1071 :named("subtype"), $P1072 :named("node"))
    store_lex "$past", $P1073
.annotate "line", 268
    find_lex $P1074, "$/"
    find_lex $P1075, "$past"
    $P1076 = $P1074."!make"($P1075)
.annotate "line", 265
    .return ($P1076)
  control_1055:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1077, exception, "payload"
    .return ($P1077)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<b>"  :subid("66_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_1081
.annotate "line", 271
    new $P1080, 'ExceptionHandler'
    set_addr $P1080, control_1079
    $P1080."handle_types"(58)
    push_eh $P1080
    .lex "self", self
    .lex "$/", param_1081
.annotate "line", 272
    new $P1082, "Undef"
    .lex "$past", $P1082
    get_hll_global $P1083, ["PAST"], "Regex"
.annotate "line", 273
    find_lex $P1084, "$/"
    unless_null $P1084, vivify_264
    new $P1084, "Hash"
  vivify_264:
    set $P1085, $P1084["sym"]
    unless_null $P1085, vivify_265
    new $P1085, "Undef"
  vivify_265:
    set $S1086, $P1085
    iseq $I1087, $S1086, "B"
    find_lex $P1088, "$/"
    $P1089 = $P1083."new"("\b", "enumcharlist" :named("pasttype"), $I1087 :named("negate"), $P1088 :named("node"))
.annotate "line", 272
    store_lex "$past", $P1089
.annotate "line", 274
    find_lex $P1090, "$/"
    find_lex $P1091, "$past"
    $P1092 = $P1090."!make"($P1091)
.annotate "line", 271
    .return ($P1092)
  control_1079:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1093, exception, "payload"
    .return ($P1093)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<e>"  :subid("67_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_1097
.annotate "line", 277
    new $P1096, 'ExceptionHandler'
    set_addr $P1096, control_1095
    $P1096."handle_types"(58)
    push_eh $P1096
    .lex "self", self
    .lex "$/", param_1097
.annotate "line", 278
    new $P1098, "Undef"
    .lex "$past", $P1098
    get_hll_global $P1099, ["PAST"], "Regex"
.annotate "line", 279
    find_lex $P1100, "$/"
    unless_null $P1100, vivify_266
    new $P1100, "Hash"
  vivify_266:
    set $P1101, $P1100["sym"]
    unless_null $P1101, vivify_267
    new $P1101, "Undef"
  vivify_267:
    set $S1102, $P1101
    iseq $I1103, $S1102, "E"
    find_lex $P1104, "$/"
    $P1105 = $P1099."new"("\\e", "enumcharlist" :named("pasttype"), $I1103 :named("negate"), $P1104 :named("node"))
.annotate "line", 278
    store_lex "$past", $P1105
.annotate "line", 280
    find_lex $P1106, "$/"
    find_lex $P1107, "$past"
    $P1108 = $P1106."!make"($P1107)
.annotate "line", 277
    .return ($P1108)
  control_1095:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1109, exception, "payload"
    .return ($P1109)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<f>"  :subid("68_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_1113
.annotate "line", 283
    new $P1112, 'ExceptionHandler'
    set_addr $P1112, control_1111
    $P1112."handle_types"(58)
    push_eh $P1112
    .lex "self", self
    .lex "$/", param_1113
.annotate "line", 284
    new $P1114, "Undef"
    .lex "$past", $P1114
    get_hll_global $P1115, ["PAST"], "Regex"
.annotate "line", 285
    find_lex $P1116, "$/"
    unless_null $P1116, vivify_268
    new $P1116, "Hash"
  vivify_268:
    set $P1117, $P1116["sym"]
    unless_null $P1117, vivify_269
    new $P1117, "Undef"
  vivify_269:
    set $S1118, $P1117
    iseq $I1119, $S1118, "F"
    find_lex $P1120, "$/"
    $P1121 = $P1115."new"("\\f", "enumcharlist" :named("pasttype"), $I1119 :named("negate"), $P1120 :named("node"))
.annotate "line", 284
    store_lex "$past", $P1121
.annotate "line", 286
    find_lex $P1122, "$/"
    find_lex $P1123, "$past"
    $P1124 = $P1122."!make"($P1123)
.annotate "line", 283
    .return ($P1124)
  control_1111:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1125, exception, "payload"
    .return ($P1125)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<h>"  :subid("69_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_1129
.annotate "line", 289
    new $P1128, 'ExceptionHandler'
    set_addr $P1128, control_1127
    $P1128."handle_types"(58)
    push_eh $P1128
    .lex "self", self
    .lex "$/", param_1129
.annotate "line", 290
    new $P1130, "Undef"
    .lex "$past", $P1130
    get_hll_global $P1131, ["PAST"], "Regex"
.annotate "line", 291
    find_lex $P1132, "$/"
    unless_null $P1132, vivify_270
    new $P1132, "Hash"
  vivify_270:
    set $P1133, $P1132["sym"]
    unless_null $P1133, vivify_271
    new $P1133, "Undef"
  vivify_271:
    set $S1134, $P1133
    iseq $I1135, $S1134, "H"
    find_lex $P1136, "$/"
    $P1137 = $P1131."new"(unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", "enumcharlist" :named("pasttype"), $I1135 :named("negate"), $P1136 :named("node"))
.annotate "line", 290
    store_lex "$past", $P1137
.annotate "line", 292
    find_lex $P1138, "$/"
    find_lex $P1139, "$past"
    $P1140 = $P1138."!make"($P1139)
.annotate "line", 289
    .return ($P1140)
  control_1127:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1141, exception, "payload"
    .return ($P1141)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<r>"  :subid("70_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_1145
.annotate "line", 295
    new $P1144, 'ExceptionHandler'
    set_addr $P1144, control_1143
    $P1144."handle_types"(58)
    push_eh $P1144
    .lex "self", self
    .lex "$/", param_1145
.annotate "line", 296
    new $P1146, "Undef"
    .lex "$past", $P1146
    get_hll_global $P1147, ["PAST"], "Regex"
.annotate "line", 297
    find_lex $P1148, "$/"
    unless_null $P1148, vivify_272
    new $P1148, "Hash"
  vivify_272:
    set $P1149, $P1148["sym"]
    unless_null $P1149, vivify_273
    new $P1149, "Undef"
  vivify_273:
    set $S1150, $P1149
    iseq $I1151, $S1150, "R"
    find_lex $P1152, "$/"
    $P1153 = $P1147."new"("\r", "enumcharlist" :named("pasttype"), $I1151 :named("negate"), $P1152 :named("node"))
.annotate "line", 296
    store_lex "$past", $P1153
.annotate "line", 298
    find_lex $P1154, "$/"
    find_lex $P1155, "$past"
    $P1156 = $P1154."!make"($P1155)
.annotate "line", 295
    .return ($P1156)
  control_1143:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1157, exception, "payload"
    .return ($P1157)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<t>"  :subid("71_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_1161
.annotate "line", 301
    new $P1160, 'ExceptionHandler'
    set_addr $P1160, control_1159
    $P1160."handle_types"(58)
    push_eh $P1160
    .lex "self", self
    .lex "$/", param_1161
.annotate "line", 302
    new $P1162, "Undef"
    .lex "$past", $P1162
    get_hll_global $P1163, ["PAST"], "Regex"
.annotate "line", 303
    find_lex $P1164, "$/"
    unless_null $P1164, vivify_274
    new $P1164, "Hash"
  vivify_274:
    set $P1165, $P1164["sym"]
    unless_null $P1165, vivify_275
    new $P1165, "Undef"
  vivify_275:
    set $S1166, $P1165
    iseq $I1167, $S1166, "T"
    find_lex $P1168, "$/"
    $P1169 = $P1163."new"("\t", "enumcharlist" :named("pasttype"), $I1167 :named("negate"), $P1168 :named("node"))
.annotate "line", 302
    store_lex "$past", $P1169
.annotate "line", 304
    find_lex $P1170, "$/"
    find_lex $P1171, "$past"
    $P1172 = $P1170."!make"($P1171)
.annotate "line", 301
    .return ($P1172)
  control_1159:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1173, exception, "payload"
    .return ($P1173)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<v>"  :subid("72_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_1177
.annotate "line", 307
    new $P1176, 'ExceptionHandler'
    set_addr $P1176, control_1175
    $P1176."handle_types"(58)
    push_eh $P1176
    .lex "self", self
    .lex "$/", param_1177
.annotate "line", 308
    new $P1178, "Undef"
    .lex "$past", $P1178
    get_hll_global $P1179, ["PAST"], "Regex"
.annotate "line", 310
    find_lex $P1180, "$/"
    unless_null $P1180, vivify_276
    new $P1180, "Hash"
  vivify_276:
    set $P1181, $P1180["sym"]
    unless_null $P1181, vivify_277
    new $P1181, "Undef"
  vivify_277:
    set $S1182, $P1181
    iseq $I1183, $S1182, "V"
    find_lex $P1184, "$/"
    $P1185 = $P1179."new"(unicode:"\n\x{b}\f\r\x{85}\u2028\u2029", "enumcharlist" :named("pasttype"), $I1183 :named("negate"), $P1184 :named("node"))
.annotate "line", 308
    store_lex "$past", $P1185
.annotate "line", 311
    find_lex $P1186, "$/"
    find_lex $P1187, "$past"
    $P1188 = $P1186."!make"($P1187)
.annotate "line", 307
    .return ($P1188)
  control_1175:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1189, exception, "payload"
    .return ($P1189)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<o>"  :subid("73_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_1193
.annotate "line", 314
    new $P1192, 'ExceptionHandler'
    set_addr $P1192, control_1191
    $P1192."handle_types"(58)
    push_eh $P1192
    .lex "self", self
    .lex "$/", param_1193
.annotate "line", 315
    new $P1194, "Undef"
    .lex "$octlit", $P1194
.annotate "line", 316
    get_hll_global $P1195, ["HLL";"Actions"], "ints_to_string"
    find_lex $P1198, "$/"
    unless_null $P1198, vivify_278
    new $P1198, "Hash"
  vivify_278:
    set $P1199, $P1198["octint"]
    unless_null $P1199, vivify_279
    new $P1199, "Undef"
  vivify_279:
    unless $P1199, unless_1197
    set $P1196, $P1199
    goto unless_1197_end
  unless_1197:
    find_lex $P1200, "$/"
    unless_null $P1200, vivify_280
    new $P1200, "Hash"
  vivify_280:
    set $P1201, $P1200["octints"]
    unless_null $P1201, vivify_281
    new $P1201, "Hash"
  vivify_281:
    set $P1202, $P1201["octint"]
    unless_null $P1202, vivify_282
    new $P1202, "Undef"
  vivify_282:
    set $P1196, $P1202
  unless_1197_end:
    $P1203 = $P1195($P1196)
    store_lex "$octlit", $P1203
.annotate "line", 317
    find_lex $P1204, "$/"
    find_lex $P1207, "$/"
    unless_null $P1207, vivify_283
    new $P1207, "Hash"
  vivify_283:
    set $P1208, $P1207["sym"]
    unless_null $P1208, vivify_284
    new $P1208, "Undef"
  vivify_284:
    set $S1209, $P1208
    iseq $I1210, $S1209, "O"
    if $I1210, if_1206
.annotate "line", 320
    get_hll_global $P1215, ["PAST"], "Regex"
    find_lex $P1216, "$octlit"
    find_lex $P1217, "$/"
    $P1218 = $P1215."new"($P1216, "literal" :named("pasttype"), $P1217 :named("node"))
    set $P1205, $P1218
.annotate "line", 317
    goto if_1206_end
  if_1206:
.annotate "line", 318
    get_hll_global $P1211, ["PAST"], "Regex"
    find_lex $P1212, "$octlit"
    find_lex $P1213, "$/"
    $P1214 = $P1211."new"($P1212, "enumcharlist" :named("pasttype"), 1 :named("negate"), $P1213 :named("node"))
    set $P1205, $P1214
  if_1206_end:
    $P1219 = $P1204."!make"($P1205)
.annotate "line", 314
    .return ($P1219)
  control_1191:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1220, exception, "payload"
    .return ($P1220)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<x>"  :subid("74_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_1224
.annotate "line", 323
    new $P1223, 'ExceptionHandler'
    set_addr $P1223, control_1222
    $P1223."handle_types"(58)
    push_eh $P1223
    .lex "self", self
    .lex "$/", param_1224
.annotate "line", 324
    new $P1225, "Undef"
    .lex "$hexlit", $P1225
.annotate "line", 325
    get_hll_global $P1226, ["HLL";"Actions"], "ints_to_string"
    find_lex $P1229, "$/"
    unless_null $P1229, vivify_285
    new $P1229, "Hash"
  vivify_285:
    set $P1230, $P1229["hexint"]
    unless_null $P1230, vivify_286
    new $P1230, "Undef"
  vivify_286:
    unless $P1230, unless_1228
    set $P1227, $P1230
    goto unless_1228_end
  unless_1228:
    find_lex $P1231, "$/"
    unless_null $P1231, vivify_287
    new $P1231, "Hash"
  vivify_287:
    set $P1232, $P1231["hexints"]
    unless_null $P1232, vivify_288
    new $P1232, "Hash"
  vivify_288:
    set $P1233, $P1232["hexint"]
    unless_null $P1233, vivify_289
    new $P1233, "Undef"
  vivify_289:
    set $P1227, $P1233
  unless_1228_end:
    $P1234 = $P1226($P1227)
    store_lex "$hexlit", $P1234
.annotate "line", 326
    find_lex $P1235, "$/"
    find_lex $P1238, "$/"
    unless_null $P1238, vivify_290
    new $P1238, "Hash"
  vivify_290:
    set $P1239, $P1238["sym"]
    unless_null $P1239, vivify_291
    new $P1239, "Undef"
  vivify_291:
    set $S1240, $P1239
    iseq $I1241, $S1240, "X"
    if $I1241, if_1237
.annotate "line", 329
    get_hll_global $P1246, ["PAST"], "Regex"
    find_lex $P1247, "$hexlit"
    find_lex $P1248, "$/"
    $P1249 = $P1246."new"($P1247, "literal" :named("pasttype"), $P1248 :named("node"))
    set $P1236, $P1249
.annotate "line", 326
    goto if_1237_end
  if_1237:
.annotate "line", 327
    get_hll_global $P1242, ["PAST"], "Regex"
    find_lex $P1243, "$hexlit"
    find_lex $P1244, "$/"
    $P1245 = $P1242."new"($P1243, "enumcharlist" :named("pasttype"), 1 :named("negate"), $P1244 :named("node"))
    set $P1236, $P1245
  if_1237_end:
    $P1250 = $P1235."!make"($P1236)
.annotate "line", 323
    .return ($P1250)
  control_1222:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1251, exception, "payload"
    .return ($P1251)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<misc>"  :subid("75_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_1255
.annotate "line", 332
    new $P1254, 'ExceptionHandler'
    set_addr $P1254, control_1253
    $P1254."handle_types"(58)
    push_eh $P1254
    .lex "self", self
    .lex "$/", param_1255
.annotate "line", 333
    new $P1256, "Undef"
    .lex "$past", $P1256
    get_hll_global $P1257, ["PAST"], "Regex"
    find_lex $P1258, "$/"
    set $S1259, $P1258
    find_lex $P1260, "$/"
    $P1261 = $P1257."new"($S1259, "literal" :named("pasttype"), $P1260 :named("node"))
    store_lex "$past", $P1261
.annotate "line", 334
    find_lex $P1262, "$/"
    find_lex $P1263, "$past"
    $P1264 = $P1262."!make"($P1263)
.annotate "line", 332
    .return ($P1264)
  control_1253:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1265, exception, "payload"
    .return ($P1265)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<?>"  :subid("76_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_1269
.annotate "line", 338
    new $P1268, 'ExceptionHandler'
    set_addr $P1268, control_1267
    $P1268."handle_types"(58)
    push_eh $P1268
    .lex "self", self
    .lex "$/", param_1269
.annotate "line", 339
    new $P1270, "Undef"
    .lex "$past", $P1270
.annotate "line", 338
    find_lex $P1271, "$past"
.annotate "line", 340
    find_lex $P1273, "$/"
    unless_null $P1273, vivify_292
    new $P1273, "Hash"
  vivify_292:
    set $P1274, $P1273["assertion"]
    unless_null $P1274, vivify_293
    new $P1274, "Undef"
  vivify_293:
    if $P1274, if_1272
.annotate "line", 344
    new $P1279, "Integer"
    assign $P1279, 0
    store_lex "$past", $P1279
    goto if_1272_end
  if_1272:
.annotate "line", 341
    find_lex $P1275, "$/"
    unless_null $P1275, vivify_294
    new $P1275, "Hash"
  vivify_294:
    set $P1276, $P1275["assertion"]
    unless_null $P1276, vivify_295
    new $P1276, "Undef"
  vivify_295:
    $P1277 = $P1276."ast"()
    store_lex "$past", $P1277
.annotate "line", 342
    find_lex $P1278, "$past"
    $P1278."subtype"("zerowidth")
  if_1272_end:
.annotate "line", 345
    find_lex $P1280, "$/"
    find_lex $P1281, "$past"
    $P1282 = $P1280."!make"($P1281)
.annotate "line", 338
    .return ($P1282)
  control_1267:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1283, exception, "payload"
    .return ($P1283)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<!>"  :subid("77_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_1287
.annotate "line", 348
    new $P1286, 'ExceptionHandler'
    set_addr $P1286, control_1285
    $P1286."handle_types"(58)
    push_eh $P1286
    .lex "self", self
    .lex "$/", param_1287
.annotate "line", 349
    new $P1288, "Undef"
    .lex "$past", $P1288
.annotate "line", 348
    find_lex $P1289, "$past"
.annotate "line", 350
    find_lex $P1291, "$/"
    unless_null $P1291, vivify_296
    new $P1291, "Hash"
  vivify_296:
    set $P1292, $P1291["assertion"]
    unless_null $P1292, vivify_297
    new $P1292, "Undef"
  vivify_297:
    if $P1292, if_1290
.annotate "line", 356
    get_hll_global $P1301, ["PAST"], "Regex"
    find_lex $P1302, "$/"
    $P1303 = $P1301."new"("anchor" :named("pasttype"), "fail" :named("subtype"), $P1302 :named("node"))
    store_lex "$past", $P1303
.annotate "line", 355
    goto if_1290_end
  if_1290:
.annotate "line", 351
    find_lex $P1293, "$/"
    unless_null $P1293, vivify_298
    new $P1293, "Hash"
  vivify_298:
    set $P1294, $P1293["assertion"]
    unless_null $P1294, vivify_299
    new $P1294, "Undef"
  vivify_299:
    $P1295 = $P1294."ast"()
    store_lex "$past", $P1295
.annotate "line", 352
    find_lex $P1296, "$past"
    find_lex $P1297, "$past"
    $P1298 = $P1297."negate"()
    isfalse $I1299, $P1298
    $P1296."negate"($I1299)
.annotate "line", 353
    find_lex $P1300, "$past"
    $P1300."subtype"("zerowidth")
  if_1290_end:
.annotate "line", 358
    find_lex $P1304, "$/"
    find_lex $P1305, "$past"
    $P1306 = $P1304."!make"($P1305)
.annotate "line", 348
    .return ($P1306)
  control_1285:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1307, exception, "payload"
    .return ($P1307)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<method>"  :subid("78_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_1311
.annotate "line", 361
    new $P1310, 'ExceptionHandler'
    set_addr $P1310, control_1309
    $P1310."handle_types"(58)
    push_eh $P1310
    .lex "self", self
    .lex "$/", param_1311
.annotate "line", 362
    new $P1312, "Undef"
    .lex "$past", $P1312
    find_lex $P1313, "$/"
    unless_null $P1313, vivify_300
    new $P1313, "Hash"
  vivify_300:
    set $P1314, $P1313["assertion"]
    unless_null $P1314, vivify_301
    new $P1314, "Undef"
  vivify_301:
    $P1315 = $P1314."ast"()
    store_lex "$past", $P1315
.annotate "line", 363
    find_lex $P1316, "$past"
    $P1316."subtype"("method")
.annotate "line", 364
    find_lex $P1317, "$past"
    $P1317."name"("")
.annotate "line", 365
    find_lex $P1318, "$/"
    find_lex $P1319, "$past"
    $P1320 = $P1318."!make"($P1319)
.annotate "line", 361
    .return ($P1320)
  control_1309:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1321, exception, "payload"
    .return ($P1321)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<name>"  :subid("79_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_1325
.annotate "line", 368
    .const 'Sub' $P1383 = "81_1259078878.34875" 
    capture_lex $P1383
    .const 'Sub' $P1347 = "80_1259078878.34875" 
    capture_lex $P1347
    new $P1324, 'ExceptionHandler'
    set_addr $P1324, control_1323
    $P1324."handle_types"(58)
    push_eh $P1324
    .lex "self", self
    .lex "$/", param_1325
.annotate "line", 369
    new $P1326, "Undef"
    .lex "$name", $P1326
.annotate "line", 370
    new $P1327, "Undef"
    .lex "$past", $P1327
.annotate "line", 369
    find_lex $P1328, "$/"
    unless_null $P1328, vivify_302
    new $P1328, "Hash"
  vivify_302:
    set $P1329, $P1328["longname"]
    unless_null $P1329, vivify_303
    new $P1329, "Undef"
  vivify_303:
    set $S1330, $P1329
    new $P1331, 'String'
    set $P1331, $S1330
    store_lex "$name", $P1331
    find_lex $P1332, "$past"
.annotate "line", 371
    find_lex $P1334, "$/"
    unless_null $P1334, vivify_304
    new $P1334, "Hash"
  vivify_304:
    set $P1335, $P1334["assertion"]
    unless_null $P1335, vivify_305
    new $P1335, "Undef"
  vivify_305:
    if $P1335, if_1333
.annotate "line", 375
    find_lex $P1343, "$name"
    set $S1344, $P1343
    iseq $I1345, $S1344, "sym"
    if $I1345, if_1342
.annotate "line", 391
    get_hll_global $P1357, ["PAST"], "Regex"
    find_lex $P1358, "$name"
    find_lex $P1359, "$name"
    find_lex $P1360, "$/"
    $P1361 = $P1357."new"($P1358, $P1359 :named("name"), "subrule" :named("pasttype"), "capture" :named("subtype"), $P1360 :named("node"))
    store_lex "$past", $P1361
.annotate "line", 393
    find_lex $P1363, "$/"
    unless_null $P1363, vivify_306
    new $P1363, "Hash"
  vivify_306:
    set $P1364, $P1363["nibbler"]
    unless_null $P1364, vivify_307
    new $P1364, "Undef"
  vivify_307:
    if $P1364, if_1362
.annotate "line", 396
    find_lex $P1372, "$/"
    unless_null $P1372, vivify_308
    new $P1372, "Hash"
  vivify_308:
    set $P1373, $P1372["arglist"]
    unless_null $P1373, vivify_309
    new $P1373, "Undef"
  vivify_309:
    unless $P1373, if_1371_end
.annotate "line", 397
    find_lex $P1375, "$/"
    unless_null $P1375, vivify_310
    new $P1375, "Hash"
  vivify_310:
    set $P1376, $P1375["arglist"]
    unless_null $P1376, vivify_311
    new $P1376, "ResizablePMCArray"
  vivify_311:
    set $P1377, $P1376[0]
    unless_null $P1377, vivify_312
    new $P1377, "Undef"
  vivify_312:
    $P1378 = $P1377."ast"()
    $P1379 = $P1378."list"()
    defined $I1380, $P1379
    unless $I1380, for_undef_313
    iter $P1374, $P1379
    new $P1389, 'ExceptionHandler'
    set_addr $P1389, loop1388_handler
    $P1389."handle_types"(65, 67, 66)
    push_eh $P1389
  loop1388_test:
    unless $P1374, loop1388_done
    shift $P1381, $P1374
  loop1388_redo:
    .const 'Sub' $P1383 = "81_1259078878.34875" 
    capture_lex $P1383
    $P1383($P1381)
  loop1388_next:
    goto loop1388_test
  loop1388_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1390, exception, 'type'
    eq $P1390, 65, loop1388_next
    eq $P1390, 67, loop1388_redo
  loop1388_done:
    pop_eh 
  for_undef_313:
  if_1371_end:
.annotate "line", 396
    goto if_1362_end
  if_1362:
.annotate "line", 394
    find_lex $P1365, "$past"
    find_lex $P1366, "$/"
    unless_null $P1366, vivify_314
    new $P1366, "Hash"
  vivify_314:
    set $P1367, $P1366["nibbler"]
    unless_null $P1367, vivify_315
    new $P1367, "ResizablePMCArray"
  vivify_315:
    set $P1368, $P1367[0]
    unless_null $P1368, vivify_316
    new $P1368, "Undef"
  vivify_316:
    $P1369 = $P1368."ast"()
    $P1370 = "buildsub"($P1369)
    $P1365."push"($P1370)
  if_1362_end:
.annotate "line", 390
    goto if_1342_end
  if_1342:
.annotate "line", 375
    .const 'Sub' $P1347 = "80_1259078878.34875" 
    capture_lex $P1347
    $P1347()
  if_1342_end:
    goto if_1333_end
  if_1333:
.annotate "line", 372
    find_lex $P1336, "$/"
    unless_null $P1336, vivify_317
    new $P1336, "Hash"
  vivify_317:
    set $P1337, $P1336["assertion"]
    unless_null $P1337, vivify_318
    new $P1337, "ResizablePMCArray"
  vivify_318:
    set $P1338, $P1337[0]
    unless_null $P1338, vivify_319
    new $P1338, "Undef"
  vivify_319:
    $P1339 = $P1338."ast"()
    store_lex "$past", $P1339
.annotate "line", 373
    find_lex $P1340, "$past"
    find_lex $P1341, "$name"
    "subrule_alias"($P1340, $P1341)
  if_1333_end:
.annotate "line", 400
    find_lex $P1391, "$/"
    find_lex $P1392, "$past"
    $P1393 = $P1391."!make"($P1392)
.annotate "line", 368
    .return ($P1393)
  control_1323:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1394, exception, "payload"
    .return ($P1394)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1382"  :anon :subid("81_1259078878.34875") :outer("79_1259078878.34875")
    .param pmc param_1384
.annotate "line", 397
    .lex "$_", param_1384
    find_lex $P1385, "$past"
    find_lex $P1386, "$_"
    $P1387 = $P1385."push"($P1386)
    .return ($P1387)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1346"  :anon :subid("80_1259078878.34875") :outer("79_1259078878.34875")
.annotate "line", 376
    new $P1348, "Undef"
    .lex "$regexsym", $P1348

            $P0 = get_global '$REGEXNAME'
            $S0 = $P0
            $I0 = index $S0, ':sym<'
            add $I0, 5
            $S0 = substr $S0, $I0
            chopn $S0, 1
            $P1349 = box $S0
        
    store_lex "$regexsym", $P1349
.annotate "line", 385
    get_hll_global $P1350, ["PAST"], "Regex"
.annotate "line", 386
    get_hll_global $P1351, ["PAST"], "Regex"
    find_lex $P1352, "$regexsym"
    $P1353 = $P1351."new"($P1352, "literal" :named("pasttype"))
    find_lex $P1354, "$name"
    find_lex $P1355, "$/"
    $P1356 = $P1350."new"($P1353, $P1354 :named("name"), "subcapture" :named("pasttype"), $P1355 :named("node"))
.annotate "line", 385
    store_lex "$past", $P1356
.annotate "line", 375
    .return ($P1356)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<[>"  :subid("82_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_1398
.annotate "line", 403
    .const 'Sub' $P1433 = "83_1259078878.34875" 
    capture_lex $P1433
    new $P1397, 'ExceptionHandler'
    set_addr $P1397, control_1396
    $P1397."handle_types"(58)
    push_eh $P1397
    .lex "self", self
    .lex "$/", param_1398
.annotate "line", 404
    new $P1399, "Undef"
    .lex "$clist", $P1399
.annotate "line", 405
    new $P1400, "Undef"
    .lex "$past", $P1400
.annotate "line", 414
    new $P1401, "Undef"
    .lex "$i", $P1401
.annotate "line", 415
    new $P1402, "Undef"
    .lex "$n", $P1402
.annotate "line", 404
    find_lex $P1403, "$/"
    unless_null $P1403, vivify_320
    new $P1403, "Hash"
  vivify_320:
    set $P1404, $P1403["cclass_elem"]
    unless_null $P1404, vivify_321
    new $P1404, "Undef"
  vivify_321:
    store_lex "$clist", $P1404
.annotate "line", 405
    find_lex $P1405, "$clist"
    unless_null $P1405, vivify_322
    new $P1405, "ResizablePMCArray"
  vivify_322:
    set $P1406, $P1405[0]
    unless_null $P1406, vivify_323
    new $P1406, "Undef"
  vivify_323:
    $P1407 = $P1406."ast"()
    store_lex "$past", $P1407
.annotate "line", 406
    find_lex $P1411, "$past"
    $P1412 = $P1411."negate"()
    if $P1412, if_1410
    set $P1409, $P1412
    goto if_1410_end
  if_1410:
    find_lex $P1413, "$past"
    $S1414 = $P1413."pasttype"()
    iseq $I1415, $S1414, "subrule"
    new $P1409, 'Integer'
    set $P1409, $I1415
  if_1410_end:
    unless $P1409, if_1408_end
.annotate "line", 407
    find_lex $P1416, "$past"
    $P1416."subtype"("zerowidth")
.annotate "line", 408
    get_hll_global $P1417, ["PAST"], "Regex"
    find_lex $P1418, "$past"
.annotate "line", 410
    get_hll_global $P1419, ["PAST"], "Regex"
    $P1420 = $P1419."new"("charclass" :named("pasttype"), "." :named("subtype"))
    find_lex $P1421, "$/"
    $P1422 = $P1417."new"($P1418, $P1420, $P1421 :named("node"))
.annotate "line", 408
    store_lex "$past", $P1422
  if_1408_end:
.annotate "line", 414
    new $P1423, "Integer"
    assign $P1423, 1
    store_lex "$i", $P1423
.annotate "line", 415
    find_lex $P1424, "$clist"
    set $N1425, $P1424
    new $P1426, 'Float'
    set $P1426, $N1425
    store_lex "$n", $P1426
.annotate "line", 416
    new $P1457, 'ExceptionHandler'
    set_addr $P1457, loop1456_handler
    $P1457."handle_types"(65, 67, 66)
    push_eh $P1457
  loop1456_test:
    find_lex $P1427, "$i"
    set $N1428, $P1427
    find_lex $P1429, "$n"
    set $N1430, $P1429
    islt $I1431, $N1428, $N1430
    unless $I1431, loop1456_done
  loop1456_redo:
    .const 'Sub' $P1433 = "83_1259078878.34875" 
    capture_lex $P1433
    $P1433()
  loop1456_next:
    goto loop1456_test
  loop1456_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1458, exception, 'type'
    eq $P1458, 65, loop1456_next
    eq $P1458, 67, loop1456_redo
  loop1456_done:
    pop_eh 
.annotate "line", 427
    find_lex $P1459, "$/"
    find_lex $P1460, "$past"
    $P1461 = $P1459."!make"($P1460)
.annotate "line", 403
    .return ($P1461)
  control_1396:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1462, exception, "payload"
    .return ($P1462)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1432"  :anon :subid("83_1259078878.34875") :outer("82_1259078878.34875")
.annotate "line", 417
    new $P1434, "Undef"
    .lex "$ast", $P1434
    find_lex $P1435, "$i"
    set $I1436, $P1435
    find_lex $P1437, "$clist"
    unless_null $P1437, vivify_324
    new $P1437, "ResizablePMCArray"
  vivify_324:
    set $P1438, $P1437[$I1436]
    unless_null $P1438, vivify_325
    new $P1438, "Undef"
  vivify_325:
    $P1439 = $P1438."ast"()
    store_lex "$ast", $P1439
.annotate "line", 418
    find_lex $P1441, "$ast"
    $P1442 = $P1441."negate"()
    if $P1442, if_1440
.annotate "line", 423
    get_hll_global $P1449, ["PAST"], "Regex"
    find_lex $P1450, "$past"
    find_lex $P1451, "$ast"
    find_lex $P1452, "$/"
    $P1453 = $P1449."new"($P1450, $P1451, "alt" :named("pasttype"), $P1452 :named("node"))
    store_lex "$past", $P1453
.annotate "line", 422
    goto if_1440_end
  if_1440:
.annotate "line", 419
    find_lex $P1443, "$ast"
    $P1443."subtype"("zerowidth")
.annotate "line", 420
    get_hll_global $P1444, ["PAST"], "Regex"
    find_lex $P1445, "$ast"
    find_lex $P1446, "$past"
    find_lex $P1447, "$/"
    $P1448 = $P1444."new"($P1445, $P1446, "concat" :named("pasttype"), $P1447 :named("node"))
    store_lex "$past", $P1448
  if_1440_end:
.annotate "line", 425
    find_lex $P1454, "$i"
    add $P1455, $P1454, 1
    store_lex "$i", $P1455
.annotate "line", 416
    .return ($P1455)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "cclass_elem"  :subid("84_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_1466
.annotate "line", 430
    .const 'Sub' $P1491 = "86_1259078878.34875" 
    capture_lex $P1491
    .const 'Sub' $P1475 = "85_1259078878.34875" 
    capture_lex $P1475
    new $P1465, 'ExceptionHandler'
    set_addr $P1465, control_1464
    $P1465."handle_types"(58)
    push_eh $P1465
    .lex "self", self
    .lex "$/", param_1466
.annotate "line", 431
    new $P1467, "Undef"
    .lex "$str", $P1467
.annotate "line", 432
    new $P1468, "Undef"
    .lex "$past", $P1468
.annotate "line", 431
    new $P1469, "String"
    assign $P1469, ""
    store_lex "$str", $P1469
    find_lex $P1470, "$past"
.annotate "line", 433
    find_lex $P1472, "$/"
    unless_null $P1472, vivify_326
    new $P1472, "Hash"
  vivify_326:
    set $P1473, $P1472["name"]
    unless_null $P1473, vivify_327
    new $P1473, "Undef"
  vivify_327:
    if $P1473, if_1471
.annotate "line", 437
    find_lex $P1486, "$/"
    unless_null $P1486, vivify_328
    new $P1486, "Hash"
  vivify_328:
    set $P1487, $P1486["charspec"]
    unless_null $P1487, vivify_329
    new $P1487, "Undef"
  vivify_329:
    defined $I1488, $P1487
    unless $I1488, for_undef_330
    iter $P1485, $P1487
    new $P1517, 'ExceptionHandler'
    set_addr $P1517, loop1516_handler
    $P1517."handle_types"(65, 67, 66)
    push_eh $P1517
  loop1516_test:
    unless $P1485, loop1516_done
    shift $P1489, $P1485
  loop1516_redo:
    .const 'Sub' $P1491 = "86_1259078878.34875" 
    capture_lex $P1491
    $P1491($P1489)
  loop1516_next:
    goto loop1516_test
  loop1516_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1518, exception, 'type'
    eq $P1518, 65, loop1516_next
    eq $P1518, 67, loop1516_redo
  loop1516_done:
    pop_eh 
  for_undef_330:
.annotate "line", 462
    get_hll_global $P1519, ["PAST"], "Regex"
    find_lex $P1520, "$str"
    find_lex $P1521, "$/"
    $P1522 = $P1519."new"($P1520, "enumcharlist" :named("pasttype"), $P1521 :named("node"))
    store_lex "$past", $P1522
.annotate "line", 436
    goto if_1471_end
  if_1471:
.annotate "line", 433
    .const 'Sub' $P1475 = "85_1259078878.34875" 
    capture_lex $P1475
    $P1475()
  if_1471_end:
.annotate "line", 464
    find_lex $P1523, "$past"
    find_lex $P1524, "$/"
    unless_null $P1524, vivify_342
    new $P1524, "Hash"
  vivify_342:
    set $P1525, $P1524["sign"]
    unless_null $P1525, vivify_343
    new $P1525, "Undef"
  vivify_343:
    set $S1526, $P1525
    iseq $I1527, $S1526, "-"
    $P1523."negate"($I1527)
.annotate "line", 465
    find_lex $P1528, "$/"
    find_lex $P1529, "$past"
    $P1530 = $P1528."!make"($P1529)
.annotate "line", 430
    .return ($P1530)
  control_1464:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1531, exception, "payload"
    .return ($P1531)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1490"  :anon :subid("86_1259078878.34875") :outer("84_1259078878.34875")
    .param pmc param_1492
.annotate "line", 437
    .const 'Sub' $P1498 = "87_1259078878.34875" 
    capture_lex $P1498
    .lex "$_", param_1492
.annotate "line", 438
    find_lex $P1495, "$_"
    unless_null $P1495, vivify_331
    new $P1495, "ResizablePMCArray"
  vivify_331:
    set $P1496, $P1495[1]
    unless_null $P1496, vivify_332
    new $P1496, "Undef"
  vivify_332:
    if $P1496, if_1494
.annotate "line", 460
    find_lex $P1512, "$str"
    find_lex $P1513, "$_"
    unless_null $P1513, vivify_333
    new $P1513, "ResizablePMCArray"
  vivify_333:
    set $P1514, $P1513[0]
    unless_null $P1514, vivify_334
    new $P1514, "Undef"
  vivify_334:
    concat $P1515, $P1512, $P1514
    store_lex "$str", $P1515
    set $P1493, $P1515
.annotate "line", 438
    goto if_1494_end
  if_1494:
    .const 'Sub' $P1498 = "87_1259078878.34875" 
    capture_lex $P1498
    $P1511 = $P1498()
    set $P1493, $P1511
  if_1494_end:
.annotate "line", 437
    .return ($P1493)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1497"  :anon :subid("87_1259078878.34875") :outer("86_1259078878.34875")
.annotate "line", 439
    new $P1499, "Undef"
    .lex "$a", $P1499
.annotate "line", 440
    new $P1500, "Undef"
    .lex "$b", $P1500
.annotate "line", 441
    new $P1501, "Undef"
    .lex "$c", $P1501
.annotate "line", 439
    find_lex $P1502, "$_"
    unless_null $P1502, vivify_335
    new $P1502, "ResizablePMCArray"
  vivify_335:
    set $P1503, $P1502[0]
    unless_null $P1503, vivify_336
    new $P1503, "Undef"
  vivify_336:
    store_lex "$a", $P1503
.annotate "line", 440
    find_lex $P1504, "$_"
    unless_null $P1504, vivify_337
    new $P1504, "ResizablePMCArray"
  vivify_337:
    set $P1505, $P1504[1]
    unless_null $P1505, vivify_338
    new $P1505, "ResizablePMCArray"
  vivify_338:
    set $P1506, $P1505[0]
    unless_null $P1506, vivify_339
    new $P1506, "Undef"
  vivify_339:
    store_lex "$b", $P1506
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
                             $P1507 = box $S2
                         
    store_lex "$c", $P1507
.annotate "line", 458
    find_lex $P1508, "$str"
    find_lex $P1509, "$c"
    concat $P1510, $P1508, $P1509
    store_lex "$str", $P1510
.annotate "line", 438
    .return ($P1510)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1474"  :anon :subid("85_1259078878.34875") :outer("84_1259078878.34875")
.annotate "line", 434
    new $P1476, "Undef"
    .lex "$name", $P1476
    find_lex $P1477, "$/"
    unless_null $P1477, vivify_340
    new $P1477, "Hash"
  vivify_340:
    set $P1478, $P1477["name"]
    unless_null $P1478, vivify_341
    new $P1478, "Undef"
  vivify_341:
    set $S1479, $P1478
    new $P1480, 'String'
    set $P1480, $S1479
    store_lex "$name", $P1480
.annotate "line", 435
    get_hll_global $P1481, ["PAST"], "Regex"
    find_lex $P1482, "$name"
    find_lex $P1483, "$/"
    $P1484 = $P1481."new"($P1482, "subrule" :named("pasttype"), "method" :named("subtype"), $P1483 :named("node"))
    store_lex "$past", $P1484
.annotate "line", 433
    .return ($P1484)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "mod_internal"  :subid("88_1259078878.34875") :method :outer("11_1259078878.34875")
    .param pmc param_1535
.annotate "line", 468
    new $P1534, 'ExceptionHandler'
    set_addr $P1534, control_1533
    $P1534."handle_types"(58)
    push_eh $P1534
    .lex "self", self
    .lex "$/", param_1535
.annotate "line", 469
    new $P1536, "Hash"
    .lex "%mods", $P1536
.annotate "line", 470
    new $P1537, "Undef"
    .lex "$n", $P1537
.annotate "line", 469
    get_global $P1538, "@MODIFIERS"
    unless_null $P1538, vivify_344
    new $P1538, "ResizablePMCArray"
  vivify_344:
    set $P1539, $P1538[0]
    unless_null $P1539, vivify_345
    new $P1539, "Undef"
  vivify_345:
    store_lex "%mods", $P1539
.annotate "line", 470
    find_lex $P1542, "$/"
    unless_null $P1542, vivify_346
    new $P1542, "Hash"
  vivify_346:
    set $P1543, $P1542["n"]
    unless_null $P1543, vivify_347
    new $P1543, "ResizablePMCArray"
  vivify_347:
    set $P1544, $P1543[0]
    unless_null $P1544, vivify_348
    new $P1544, "Undef"
  vivify_348:
    set $S1545, $P1544
    isgt $I1546, $S1545, ""
    if $I1546, if_1541
    new $P1551, "Integer"
    assign $P1551, 1
    set $P1540, $P1551
    goto if_1541_end
  if_1541:
    find_lex $P1547, "$/"
    unless_null $P1547, vivify_349
    new $P1547, "Hash"
  vivify_349:
    set $P1548, $P1547["n"]
    unless_null $P1548, vivify_350
    new $P1548, "ResizablePMCArray"
  vivify_350:
    set $P1549, $P1548[0]
    unless_null $P1549, vivify_351
    new $P1549, "Undef"
  vivify_351:
    set $N1550, $P1549
    new $P1540, 'Float'
    set $P1540, $N1550
  if_1541_end:
    store_lex "$n", $P1540
.annotate "line", 471
    find_lex $P1552, "$n"
    find_lex $P1553, "$/"
    unless_null $P1553, vivify_352
    new $P1553, "Hash"
  vivify_352:
    set $P1554, $P1553["mod_ident"]
    unless_null $P1554, vivify_353
    new $P1554, "Hash"
  vivify_353:
    set $P1555, $P1554["sym"]
    unless_null $P1555, vivify_354
    new $P1555, "Undef"
  vivify_354:
    set $S1556, $P1555
    find_lex $P1557, "%mods"
    unless_null $P1557, vivify_355
    new $P1557, "Hash"
    store_lex "%mods", $P1557
  vivify_355:
    set $P1557[$S1556], $P1552
.annotate "line", 472
    find_lex $P1558, "$/"
    $P1559 = $P1558."!make"(0)
.annotate "line", 468
    .return ($P1559)
  control_1533:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1560, exception, "payload"
    .return ($P1560)
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
