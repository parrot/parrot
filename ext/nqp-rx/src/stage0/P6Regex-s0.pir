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
.sub "_block11"  :anon :subid("10_1279564390.79897")
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
    $P573 = $P14()
.annotate 'line', 1
    .return ($P573)
    .const 'Sub' $P575 = "161_1279564390.79897" 
    .return ($P575)
.end


.namespace []
.sub "" :load :init :subid("post162") :outer("10_1279564390.79897")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1279564390.79897" 
    .local pmc block
    set block, $P12
    $P578 = get_root_global ["parrot"], "P6metaclass"
    $P578."new_class"("Regex::P6Regex::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block13"  :subid("11_1279564390.79897") :outer("10_1279564390.79897")
.annotate 'line', 3
    .const 'Sub' $P562 = "158_1279564390.79897" 
    capture_lex $P562
    .const 'Sub' $P555 = "156_1279564390.79897" 
    capture_lex $P555
    .const 'Sub' $P548 = "154_1279564390.79897" 
    capture_lex $P548
    .const 'Sub' $P528 = "149_1279564390.79897" 
    capture_lex $P528
    .const 'Sub' $P494 = "143_1279564390.79897" 
    capture_lex $P494
    .const 'Sub' $P482 = "140_1279564390.79897" 
    capture_lex $P482
    .const 'Sub' $P470 = "137_1279564390.79897" 
    capture_lex $P470
    .const 'Sub' $P464 = "135_1279564390.79897" 
    capture_lex $P464
    .const 'Sub' $P453 = "132_1279564390.79897" 
    capture_lex $P453
    .const 'Sub' $P442 = "129_1279564390.79897" 
    capture_lex $P442
    .const 'Sub' $P433 = "125_1279564390.79897" 
    capture_lex $P433
    .const 'Sub' $P427 = "123_1279564390.79897" 
    capture_lex $P427
    .const 'Sub' $P421 = "121_1279564390.79897" 
    capture_lex $P421
    .const 'Sub' $P415 = "119_1279564390.79897" 
    capture_lex $P415
    .const 'Sub' $P409 = "117_1279564390.79897" 
    capture_lex $P409
    .const 'Sub' $P401 = "115_1279564390.79897" 
    capture_lex $P401
    .const 'Sub' $P390 = "113_1279564390.79897" 
    capture_lex $P390
    .const 'Sub' $P379 = "111_1279564390.79897" 
    capture_lex $P379
    .const 'Sub' $P373 = "109_1279564390.79897" 
    capture_lex $P373
    .const 'Sub' $P367 = "107_1279564390.79897" 
    capture_lex $P367
    .const 'Sub' $P361 = "105_1279564390.79897" 
    capture_lex $P361
    .const 'Sub' $P355 = "103_1279564390.79897" 
    capture_lex $P355
    .const 'Sub' $P349 = "101_1279564390.79897" 
    capture_lex $P349
    .const 'Sub' $P343 = "99_1279564390.79897" 
    capture_lex $P343
    .const 'Sub' $P337 = "97_1279564390.79897" 
    capture_lex $P337
    .const 'Sub' $P331 = "95_1279564390.79897" 
    capture_lex $P331
    .const 'Sub' $P319 = "91_1279564390.79897" 
    capture_lex $P319
    .const 'Sub' $P309 = "89_1279564390.79897" 
    capture_lex $P309
    .const 'Sub' $P302 = "87_1279564390.79897" 
    capture_lex $P302
    .const 'Sub' $P290 = "85_1279564390.79897" 
    capture_lex $P290
    .const 'Sub' $P283 = "83_1279564390.79897" 
    capture_lex $P283
    .const 'Sub' $P277 = "81_1279564390.79897" 
    capture_lex $P277
    .const 'Sub' $P271 = "79_1279564390.79897" 
    capture_lex $P271
    .const 'Sub' $P264 = "77_1279564390.79897" 
    capture_lex $P264
    .const 'Sub' $P257 = "75_1279564390.79897" 
    capture_lex $P257
    .const 'Sub' $P250 = "73_1279564390.79897" 
    capture_lex $P250
    .const 'Sub' $P243 = "71_1279564390.79897" 
    capture_lex $P243
    .const 'Sub' $P237 = "69_1279564390.79897" 
    capture_lex $P237
    .const 'Sub' $P231 = "67_1279564390.79897" 
    capture_lex $P231
    .const 'Sub' $P225 = "65_1279564390.79897" 
    capture_lex $P225
    .const 'Sub' $P219 = "63_1279564390.79897" 
    capture_lex $P219
    .const 'Sub' $P213 = "61_1279564390.79897" 
    capture_lex $P213
    .const 'Sub' $P208 = "59_1279564390.79897" 
    capture_lex $P208
    .const 'Sub' $P203 = "57_1279564390.79897" 
    capture_lex $P203
    .const 'Sub' $P197 = "55_1279564390.79897" 
    capture_lex $P197
    .const 'Sub' $P191 = "53_1279564390.79897" 
    capture_lex $P191
    .const 'Sub' $P185 = "51_1279564390.79897" 
    capture_lex $P185
    .const 'Sub' $P170 = "46_1279564390.79897" 
    capture_lex $P170
    .const 'Sub' $P155 = "44_1279564390.79897" 
    capture_lex $P155
    .const 'Sub' $P148 = "42_1279564390.79897" 
    capture_lex $P148
    .const 'Sub' $P141 = "40_1279564390.79897" 
    capture_lex $P141
    .const 'Sub' $P134 = "38_1279564390.79897" 
    capture_lex $P134
    .const 'Sub' $P117 = "33_1279564390.79897" 
    capture_lex $P117
    .const 'Sub' $P105 = "30_1279564390.79897" 
    capture_lex $P105
    .const 'Sub' $P98 = "28_1279564390.79897" 
    capture_lex $P98
    .const 'Sub' $P88 = "26_1279564390.79897" 
    capture_lex $P88
    .const 'Sub' $P81 = "24_1279564390.79897" 
    capture_lex $P81
    .const 'Sub' $P69 = "22_1279564390.79897" 
    capture_lex $P69
    .const 'Sub' $P62 = "20_1279564390.79897" 
    capture_lex $P62
    .const 'Sub' $P55 = "18_1279564390.79897" 
    capture_lex $P55
    .const 'Sub' $P45 = "15_1279564390.79897" 
    capture_lex $P45
    .const 'Sub' $P38 = "13_1279564390.79897" 
    capture_lex $P38
    .const 'Sub' $P15 = "12_1279564390.79897" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    .const 'Sub' $P562 = "158_1279564390.79897" 
    capture_lex $P562
    .return ($P562)
    .const 'Sub' $P570 = "160_1279564390.79897" 
    .return ($P570)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.include "except_types.pasm"
.sub "obs"  :subid("12_1279564390.79897") :method :outer("11_1279564390.79897")
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
.sub "ws"  :subid("13_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx39_tgt
    .local int rx39_pos
    .local int rx39_off
    .local int rx39_eos
    .local int rx39_rep
    .local pmc rx39_cur
    (rx39_cur, rx39_pos, rx39_tgt, $I10) = self."!cursor_start"()
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
    eq $I10, 1, rx39_restart
    rx39_cur."!cursor_debug"("START ", "ws")
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
    set_addr $I10, rxquantr43_done
    rx39_cur."!mark_push"(0, rx39_pos, $I10)
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
    set_addr $I10, rxquantr43_done
    (rx39_rep) = rx39_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr43_done
    rx39_cur."!mark_push"(rx39_rep, rx39_pos, $I10)
    goto rxquantr43_loop
  rxquantr43_done:
  # rx pass
    rx39_cur."!cursor_pass"(rx39_pos, "ws")
    rx39_cur."!cursor_debug"("PASS  ", "ws", " at pos=", rx39_pos)
    .return (rx39_cur)
  rx39_restart:
.annotate 'line', 3
    rx39_cur."!cursor_debug"("NEXT ", "ws")
  rx39_fail:
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
.sub "!PREFIX__ws"  :subid("14_1279564390.79897") :method
.annotate 'line', 3
    new $P41, "ResizablePMCArray"
    push $P41, ""
    .return ($P41)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "normspace"  :subid("15_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .const 'Sub' $P51 = "17_1279564390.79897" 
    capture_lex $P51
    .local string rx46_tgt
    .local int rx46_pos
    .local int rx46_off
    .local int rx46_eos
    .local int rx46_rep
    .local pmc rx46_cur
    (rx46_cur, rx46_pos, rx46_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx46_cur
    .local pmc match
    .lex "$/", match
    length rx46_eos, rx46_tgt
    gt rx46_pos, rx46_eos, rx46_done
    set rx46_off, 0
    lt rx46_pos, 2, rx46_start
    sub rx46_off, rx46_pos, 1
    substr rx46_tgt, rx46_tgt, rx46_off
  rx46_start:
    eq $I10, 1, rx46_restart
    rx46_cur."!cursor_debug"("START ", "normspace")
    $I10 = self.'from'()
    ne $I10, -1, rxscan49_done
    goto rxscan49_scan
  rxscan49_loop:
    ($P10) = rx46_cur."from"()
    inc $P10
    set rx46_pos, $P10
    ge rx46_pos, rx46_eos, rxscan49_done
  rxscan49_scan:
    set_addr $I10, rxscan49_loop
    rx46_cur."!mark_push"(0, rx46_pos, $I10)
  rxscan49_done:
.annotate 'line', 10
  # rx subrule "before" subtype=zerowidth negate=
    rx46_cur."!cursor_pos"(rx46_pos)
    .const 'Sub' $P51 = "17_1279564390.79897" 
    capture_lex $P51
    $P10 = rx46_cur."before"($P51)
    unless $P10, rx46_fail
  # rx subrule "ws" subtype=method negate=
    rx46_cur."!cursor_pos"(rx46_pos)
    $P10 = rx46_cur."ws"()
    unless $P10, rx46_fail
    rx46_pos = $P10."pos"()
  # rx pass
    rx46_cur."!cursor_pass"(rx46_pos, "normspace")
    rx46_cur."!cursor_debug"("PASS  ", "normspace", " at pos=", rx46_pos)
    .return (rx46_cur)
  rx46_restart:
.annotate 'line', 3
    rx46_cur."!cursor_debug"("NEXT ", "normspace")
  rx46_fail:
    (rx46_rep, rx46_pos, $I10, $P10) = rx46_cur."!mark_fail"(0)
    lt rx46_pos, -1, rx46_done
    eq rx46_pos, -1, rx46_fail
    jump $I10
  rx46_done:
    rx46_cur."!cursor_fail"()
    rx46_cur."!cursor_debug"("FAIL  ", "normspace")
    .return (rx46_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__normspace"  :subid("16_1279564390.79897") :method
.annotate 'line', 3
    new $P48, "ResizablePMCArray"
    push $P48, ""
    .return ($P48)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block50"  :anon :subid("17_1279564390.79897") :method :outer("15_1279564390.79897")
.annotate 'line', 10
    .local string rx52_tgt
    .local int rx52_pos
    .local int rx52_off
    .local int rx52_eos
    .local int rx52_rep
    .local pmc rx52_cur
    (rx52_cur, rx52_pos, rx52_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx52_cur
    .local pmc match
    .lex "$/", match
    length rx52_eos, rx52_tgt
    gt rx52_pos, rx52_eos, rx52_done
    set rx52_off, 0
    lt rx52_pos, 2, rx52_start
    sub rx52_off, rx52_pos, 1
    substr rx52_tgt, rx52_tgt, rx52_off
  rx52_start:
    eq $I10, 1, rx52_restart
    rx52_cur."!cursor_debug"("START ", "")
    $I10 = self.'from'()
    ne $I10, -1, rxscan53_done
    goto rxscan53_scan
  rxscan53_loop:
    ($P10) = rx52_cur."from"()
    inc $P10
    set rx52_pos, $P10
    ge rx52_pos, rx52_eos, rxscan53_done
  rxscan53_scan:
    set_addr $I10, rxscan53_loop
    rx52_cur."!mark_push"(0, rx52_pos, $I10)
  rxscan53_done:
  alt54_0:
    set_addr $I10, alt54_1
    rx52_cur."!mark_push"(0, rx52_pos, $I10)
  # rx charclass s
    ge rx52_pos, rx52_eos, rx52_fail
    sub $I10, rx52_pos, rx52_off
    is_cclass $I11, 32, rx52_tgt, $I10
    unless $I11, rx52_fail
    inc rx52_pos
    goto alt54_end
  alt54_1:
  # rx literal  "#"
    add $I11, rx52_pos, 1
    gt $I11, rx52_eos, rx52_fail
    sub $I11, rx52_pos, rx52_off
    substr $S10, rx52_tgt, $I11, 1
    ne $S10, "#", rx52_fail
    add rx52_pos, 1
  alt54_end:
  # rx pass
    rx52_cur."!cursor_pass"(rx52_pos, "")
    rx52_cur."!cursor_debug"("PASS  ", "", " at pos=", rx52_pos)
    .return (rx52_cur)
  rx52_restart:
    rx52_cur."!cursor_debug"("NEXT ", "")
  rx52_fail:
    (rx52_rep, rx52_pos, $I10, $P10) = rx52_cur."!mark_fail"(0)
    lt rx52_pos, -1, rx52_done
    eq rx52_pos, -1, rx52_fail
    jump $I10
  rx52_done:
    rx52_cur."!cursor_fail"()
    rx52_cur."!cursor_debug"("FAIL  ", "")
    .return (rx52_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "identifier"  :subid("18_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx56_tgt
    .local int rx56_pos
    .local int rx56_off
    .local int rx56_eos
    .local int rx56_rep
    .local pmc rx56_cur
    (rx56_cur, rx56_pos, rx56_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx56_cur
    .local pmc match
    .lex "$/", match
    length rx56_eos, rx56_tgt
    gt rx56_pos, rx56_eos, rx56_done
    set rx56_off, 0
    lt rx56_pos, 2, rx56_start
    sub rx56_off, rx56_pos, 1
    substr rx56_tgt, rx56_tgt, rx56_off
  rx56_start:
    eq $I10, 1, rx56_restart
    rx56_cur."!cursor_debug"("START ", "identifier")
    $I10 = self.'from'()
    ne $I10, -1, rxscan60_done
    goto rxscan60_scan
  rxscan60_loop:
    ($P10) = rx56_cur."from"()
    inc $P10
    set rx56_pos, $P10
    ge rx56_pos, rx56_eos, rxscan60_done
  rxscan60_scan:
    set_addr $I10, rxscan60_loop
    rx56_cur."!mark_push"(0, rx56_pos, $I10)
  rxscan60_done:
.annotate 'line', 12
  # rx subrule "ident" subtype=method negate=
    rx56_cur."!cursor_pos"(rx56_pos)
    $P10 = rx56_cur."ident"()
    unless $P10, rx56_fail
    rx56_pos = $P10."pos"()
  # rx rxquantr61 ** 0..*
    set_addr $I10, rxquantr61_done
    rx56_cur."!mark_push"(0, rx56_pos, $I10)
  rxquantr61_loop:
  # rx enumcharlist negate=0 
    ge rx56_pos, rx56_eos, rx56_fail
    sub $I10, rx56_pos, rx56_off
    substr $S10, rx56_tgt, $I10, 1
    index $I11, "-'", $S10
    lt $I11, 0, rx56_fail
    inc rx56_pos
  # rx subrule "ident" subtype=method negate=
    rx56_cur."!cursor_pos"(rx56_pos)
    $P10 = rx56_cur."ident"()
    unless $P10, rx56_fail
    rx56_pos = $P10."pos"()
    set_addr $I10, rxquantr61_done
    (rx56_rep) = rx56_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr61_done
    rx56_cur."!mark_push"(rx56_rep, rx56_pos, $I10)
    goto rxquantr61_loop
  rxquantr61_done:
  # rx pass
    rx56_cur."!cursor_pass"(rx56_pos, "identifier")
    rx56_cur."!cursor_debug"("PASS  ", "identifier", " at pos=", rx56_pos)
    .return (rx56_cur)
  rx56_restart:
.annotate 'line', 3
    rx56_cur."!cursor_debug"("NEXT ", "identifier")
  rx56_fail:
    (rx56_rep, rx56_pos, $I10, $P10) = rx56_cur."!mark_fail"(0)
    lt rx56_pos, -1, rx56_done
    eq rx56_pos, -1, rx56_fail
    jump $I10
  rx56_done:
    rx56_cur."!cursor_fail"()
    rx56_cur."!cursor_debug"("FAIL  ", "identifier")
    .return (rx56_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__identifier"  :subid("19_1279564390.79897") :method
.annotate 'line', 3
    $P58 = self."!PREFIX__!subrule"("ident", "")
    new $P59, "ResizablePMCArray"
    push $P59, $P58
    .return ($P59)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "arg"  :subid("20_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx63_tgt
    .local int rx63_pos
    .local int rx63_off
    .local int rx63_eos
    .local int rx63_rep
    .local pmc rx63_cur
    (rx63_cur, rx63_pos, rx63_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx63_cur
    .local pmc match
    .lex "$/", match
    length rx63_eos, rx63_tgt
    gt rx63_pos, rx63_eos, rx63_done
    set rx63_off, 0
    lt rx63_pos, 2, rx63_start
    sub rx63_off, rx63_pos, 1
    substr rx63_tgt, rx63_tgt, rx63_off
  rx63_start:
    eq $I10, 1, rx63_restart
    rx63_cur."!cursor_debug"("START ", "arg")
    $I10 = self.'from'()
    ne $I10, -1, rxscan66_done
    goto rxscan66_scan
  rxscan66_loop:
    ($P10) = rx63_cur."from"()
    inc $P10
    set rx63_pos, $P10
    ge rx63_pos, rx63_eos, rxscan66_done
  rxscan66_scan:
    set_addr $I10, rxscan66_loop
    rx63_cur."!mark_push"(0, rx63_pos, $I10)
  rxscan66_done:
  alt67_0:
.annotate 'line', 15
    set_addr $I10, alt67_1
    rx63_cur."!mark_push"(0, rx63_pos, $I10)
.annotate 'line', 16
  # rx enumcharlist negate=0 zerowidth
    ge rx63_pos, rx63_eos, rx63_fail
    sub $I10, rx63_pos, rx63_off
    substr $S10, rx63_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx63_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx63_cur."!cursor_pos"(rx63_pos)
    $P10 = rx63_cur."quote_EXPR"(":q")
    unless $P10, rx63_fail
    rx63_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx63_pos = $P10."pos"()
    goto alt67_end
  alt67_1:
    set_addr $I10, alt67_2
    rx63_cur."!mark_push"(0, rx63_pos, $I10)
.annotate 'line', 17
  # rx enumcharlist negate=0 zerowidth
    ge rx63_pos, rx63_eos, rx63_fail
    sub $I10, rx63_pos, rx63_off
    substr $S10, rx63_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx63_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx63_cur."!cursor_pos"(rx63_pos)
    $P10 = rx63_cur."quote_EXPR"(":qq")
    unless $P10, rx63_fail
    rx63_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx63_pos = $P10."pos"()
    goto alt67_end
  alt67_2:
.annotate 'line', 18
  # rx subcapture "val"
    set_addr $I10, rxcap_68_fail
    rx63_cur."!mark_push"(0, rx63_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx63_pos, rx63_off
    find_not_cclass $I11, 8, rx63_tgt, $I10, rx63_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx63_fail
    add rx63_pos, rx63_off, $I11
    set_addr $I10, rxcap_68_fail
    ($I12, $I11) = rx63_cur."!mark_peek"($I10)
    rx63_cur."!cursor_pos"($I11)
    ($P10) = rx63_cur."!cursor_start"()
    $P10."!cursor_pass"(rx63_pos, "")
    rx63_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("val")
    goto rxcap_68_done
  rxcap_68_fail:
    goto rx63_fail
  rxcap_68_done:
  alt67_end:
.annotate 'line', 14
  # rx pass
    rx63_cur."!cursor_pass"(rx63_pos, "arg")
    rx63_cur."!cursor_debug"("PASS  ", "arg", " at pos=", rx63_pos)
    .return (rx63_cur)
  rx63_restart:
.annotate 'line', 3
    rx63_cur."!cursor_debug"("NEXT ", "arg")
  rx63_fail:
    (rx63_rep, rx63_pos, $I10, $P10) = rx63_cur."!mark_fail"(0)
    lt rx63_pos, -1, rx63_done
    eq rx63_pos, -1, rx63_fail
    jump $I10
  rx63_done:
    rx63_cur."!cursor_fail"()
    rx63_cur."!cursor_debug"("FAIL  ", "arg")
    .return (rx63_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__arg"  :subid("21_1279564390.79897") :method
.annotate 'line', 3
    new $P65, "ResizablePMCArray"
    push $P65, ""
    push $P65, "\""
    push $P65, "'"
    .return ($P65)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "arglist"  :subid("22_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx70_tgt
    .local int rx70_pos
    .local int rx70_off
    .local int rx70_eos
    .local int rx70_rep
    .local pmc rx70_cur
    (rx70_cur, rx70_pos, rx70_tgt, $I10) = self."!cursor_start"()
    rx70_cur."!cursor_caparray"("arg")
    .lex unicode:"$\x{a2}", rx70_cur
    .local pmc match
    .lex "$/", match
    length rx70_eos, rx70_tgt
    gt rx70_pos, rx70_eos, rx70_done
    set rx70_off, 0
    lt rx70_pos, 2, rx70_start
    sub rx70_off, rx70_pos, 1
    substr rx70_tgt, rx70_tgt, rx70_off
  rx70_start:
    eq $I10, 1, rx70_restart
    rx70_cur."!cursor_debug"("START ", "arglist")
    $I10 = self.'from'()
    ne $I10, -1, rxscan74_done
    goto rxscan74_scan
  rxscan74_loop:
    ($P10) = rx70_cur."from"()
    inc $P10
    set rx70_pos, $P10
    ge rx70_pos, rx70_eos, rxscan74_done
  rxscan74_scan:
    set_addr $I10, rxscan74_loop
    rx70_cur."!mark_push"(0, rx70_pos, $I10)
  rxscan74_done:
.annotate 'line', 22
  # rx subrule "ws" subtype=method negate=
    rx70_cur."!cursor_pos"(rx70_pos)
    $P10 = rx70_cur."ws"()
    unless $P10, rx70_fail
    rx70_pos = $P10."pos"()
  # rx subrule "arg" subtype=capture negate=
    rx70_cur."!cursor_pos"(rx70_pos)
    $P10 = rx70_cur."arg"()
    unless $P10, rx70_fail
    rx70_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arg")
    rx70_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx70_cur."!cursor_pos"(rx70_pos)
    $P10 = rx70_cur."ws"()
    unless $P10, rx70_fail
    rx70_pos = $P10."pos"()
  # rx rxquantr77 ** 0..*
    set_addr $I10, rxquantr77_done
    rx70_cur."!mark_push"(0, rx70_pos, $I10)
  rxquantr77_loop:
  # rx subrule "ws" subtype=method negate=
    rx70_cur."!cursor_pos"(rx70_pos)
    $P10 = rx70_cur."ws"()
    unless $P10, rx70_fail
    rx70_pos = $P10."pos"()
  # rx literal  ","
    add $I11, rx70_pos, 1
    gt $I11, rx70_eos, rx70_fail
    sub $I11, rx70_pos, rx70_off
    substr $S10, rx70_tgt, $I11, 1
    ne $S10, ",", rx70_fail
    add rx70_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx70_cur."!cursor_pos"(rx70_pos)
    $P10 = rx70_cur."ws"()
    unless $P10, rx70_fail
    rx70_pos = $P10."pos"()
  # rx subrule "arg" subtype=capture negate=
    rx70_cur."!cursor_pos"(rx70_pos)
    $P10 = rx70_cur."arg"()
    unless $P10, rx70_fail
    rx70_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arg")
    rx70_pos = $P10."pos"()
    set_addr $I10, rxquantr77_done
    (rx70_rep) = rx70_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr77_done
    rx70_cur."!mark_push"(rx70_rep, rx70_pos, $I10)
    goto rxquantr77_loop
  rxquantr77_done:
  # rx subrule "ws" subtype=method negate=
    rx70_cur."!cursor_pos"(rx70_pos)
    $P10 = rx70_cur."ws"()
    unless $P10, rx70_fail
    rx70_pos = $P10."pos"()
  # rx pass
    rx70_cur."!cursor_pass"(rx70_pos, "arglist")
    rx70_cur."!cursor_debug"("PASS  ", "arglist", " at pos=", rx70_pos)
    .return (rx70_cur)
  rx70_restart:
.annotate 'line', 3
    rx70_cur."!cursor_debug"("NEXT ", "arglist")
  rx70_fail:
    (rx70_rep, rx70_pos, $I10, $P10) = rx70_cur."!mark_fail"(0)
    lt rx70_pos, -1, rx70_done
    eq rx70_pos, -1, rx70_fail
    jump $I10
  rx70_done:
    rx70_cur."!cursor_fail"()
    rx70_cur."!cursor_debug"("FAIL  ", "arglist")
    .return (rx70_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__arglist"  :subid("23_1279564390.79897") :method
.annotate 'line', 3
    $P72 = self."!PREFIX__!subrule"("ws", "")
    new $P73, "ResizablePMCArray"
    push $P73, $P72
    .return ($P73)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "TOP"  :subid("24_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx82_tgt
    .local int rx82_pos
    .local int rx82_off
    .local int rx82_eos
    .local int rx82_rep
    .local pmc rx82_cur
    (rx82_cur, rx82_pos, rx82_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx82_cur
    .local pmc match
    .lex "$/", match
    length rx82_eos, rx82_tgt
    gt rx82_pos, rx82_eos, rx82_done
    set rx82_off, 0
    lt rx82_pos, 2, rx82_start
    sub rx82_off, rx82_pos, 1
    substr rx82_tgt, rx82_tgt, rx82_off
  rx82_start:
    eq $I10, 1, rx82_restart
    rx82_cur."!cursor_debug"("START ", "TOP")
    $I10 = self.'from'()
    ne $I10, -1, rxscan86_done
    goto rxscan86_scan
  rxscan86_loop:
    ($P10) = rx82_cur."from"()
    inc $P10
    set rx82_pos, $P10
    ge rx82_pos, rx82_eos, rxscan86_done
  rxscan86_scan:
    set_addr $I10, rxscan86_loop
    rx82_cur."!mark_push"(0, rx82_pos, $I10)
  rxscan86_done:
.annotate 'line', 25
  # rx subrule "nibbler" subtype=capture negate=
    rx82_cur."!cursor_pos"(rx82_pos)
    $P10 = rx82_cur."nibbler"()
    unless $P10, rx82_fail
    rx82_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx82_pos = $P10."pos"()
  alt87_0:
.annotate 'line', 26
    set_addr $I10, alt87_1
    rx82_cur."!mark_push"(0, rx82_pos, $I10)
  # rxanchor eos
    ne rx82_pos, rx82_eos, rx82_fail
    goto alt87_end
  alt87_1:
  # rx subrule "panic" subtype=method negate=
    rx82_cur."!cursor_pos"(rx82_pos)
    $P10 = rx82_cur."panic"("Confused")
    unless $P10, rx82_fail
    rx82_pos = $P10."pos"()
  alt87_end:
.annotate 'line', 24
  # rx pass
    rx82_cur."!cursor_pass"(rx82_pos, "TOP")
    rx82_cur."!cursor_debug"("PASS  ", "TOP", " at pos=", rx82_pos)
    .return (rx82_cur)
  rx82_restart:
.annotate 'line', 3
    rx82_cur."!cursor_debug"("NEXT ", "TOP")
  rx82_fail:
    (rx82_rep, rx82_pos, $I10, $P10) = rx82_cur."!mark_fail"(0)
    lt rx82_pos, -1, rx82_done
    eq rx82_pos, -1, rx82_fail
    jump $I10
  rx82_done:
    rx82_cur."!cursor_fail"()
    rx82_cur."!cursor_debug"("FAIL  ", "TOP")
    .return (rx82_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__TOP"  :subid("25_1279564390.79897") :method
.annotate 'line', 3
    $P84 = self."!PREFIX__!subrule"("nibbler", "")
    new $P85, "ResizablePMCArray"
    push $P85, $P84
    .return ($P85)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "nibbler"  :subid("26_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx89_tgt
    .local int rx89_pos
    .local int rx89_off
    .local int rx89_eos
    .local int rx89_rep
    .local pmc rx89_cur
    (rx89_cur, rx89_pos, rx89_tgt, $I10) = self."!cursor_start"()
    rx89_cur."!cursor_caparray"("termish")
    .lex unicode:"$\x{a2}", rx89_cur
    .local pmc match
    .lex "$/", match
    length rx89_eos, rx89_tgt
    gt rx89_pos, rx89_eos, rx89_done
    set rx89_off, 0
    lt rx89_pos, 2, rx89_start
    sub rx89_off, rx89_pos, 1
    substr rx89_tgt, rx89_tgt, rx89_off
  rx89_start:
    eq $I10, 1, rx89_restart
    rx89_cur."!cursor_debug"("START ", "nibbler")
    $I10 = self.'from'()
    ne $I10, -1, rxscan92_done
    goto rxscan92_scan
  rxscan92_loop:
    ($P10) = rx89_cur."from"()
    inc $P10
    set rx89_pos, $P10
    ge rx89_pos, rx89_eos, rxscan92_done
  rxscan92_scan:
    set_addr $I10, rxscan92_loop
    rx89_cur."!mark_push"(0, rx89_pos, $I10)
  rxscan92_done:
.annotate 'line', 30
  # rx reduce name="nibbler" key="open"
    rx89_cur."!cursor_pos"(rx89_pos)
    rx89_cur."!reduce"("nibbler", "open")
.annotate 'line', 31
  # rx rxquantr93 ** 0..1
    set_addr $I10, rxquantr93_done
    rx89_cur."!mark_push"(0, rx89_pos, $I10)
  rxquantr93_loop:
  # rx subrule "ws" subtype=method negate=
    rx89_cur."!cursor_pos"(rx89_pos)
    $P10 = rx89_cur."ws"()
    unless $P10, rx89_fail
    rx89_pos = $P10."pos"()
  alt94_0:
    set_addr $I10, alt94_1
    rx89_cur."!mark_push"(0, rx89_pos, $I10)
  # rx literal  "||"
    add $I11, rx89_pos, 2
    gt $I11, rx89_eos, rx89_fail
    sub $I11, rx89_pos, rx89_off
    substr $S10, rx89_tgt, $I11, 2
    ne $S10, "||", rx89_fail
    add rx89_pos, 2
    goto alt94_end
  alt94_1:
    set_addr $I10, alt94_2
    rx89_cur."!mark_push"(0, rx89_pos, $I10)
  # rx literal  "|"
    add $I11, rx89_pos, 1
    gt $I11, rx89_eos, rx89_fail
    sub $I11, rx89_pos, rx89_off
    substr $S10, rx89_tgt, $I11, 1
    ne $S10, "|", rx89_fail
    add rx89_pos, 1
    goto alt94_end
  alt94_2:
    set_addr $I10, alt94_3
    rx89_cur."!mark_push"(0, rx89_pos, $I10)
  # rx literal  "&&"
    add $I11, rx89_pos, 2
    gt $I11, rx89_eos, rx89_fail
    sub $I11, rx89_pos, rx89_off
    substr $S10, rx89_tgt, $I11, 2
    ne $S10, "&&", rx89_fail
    add rx89_pos, 2
    goto alt94_end
  alt94_3:
  # rx literal  "&"
    add $I11, rx89_pos, 1
    gt $I11, rx89_eos, rx89_fail
    sub $I11, rx89_pos, rx89_off
    substr $S10, rx89_tgt, $I11, 1
    ne $S10, "&", rx89_fail
    add rx89_pos, 1
  alt94_end:
    set_addr $I10, rxquantr93_done
    (rx89_rep) = rx89_cur."!mark_commit"($I10)
  rxquantr93_done:
.annotate 'line', 32
  # rx subrule "termish" subtype=capture negate=
    rx89_cur."!cursor_pos"(rx89_pos)
    $P10 = rx89_cur."termish"()
    unless $P10, rx89_fail
    rx89_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("termish")
    rx89_pos = $P10."pos"()
.annotate 'line', 35
  # rx rxquantr95 ** 0..*
    set_addr $I10, rxquantr95_done
    rx89_cur."!mark_push"(0, rx89_pos, $I10)
  rxquantr95_loop:
  alt96_0:
.annotate 'line', 33
    set_addr $I10, alt96_1
    rx89_cur."!mark_push"(0, rx89_pos, $I10)
  # rx literal  "||"
    add $I11, rx89_pos, 2
    gt $I11, rx89_eos, rx89_fail
    sub $I11, rx89_pos, rx89_off
    substr $S10, rx89_tgt, $I11, 2
    ne $S10, "||", rx89_fail
    add rx89_pos, 2
    goto alt96_end
  alt96_1:
  # rx literal  "|"
    add $I11, rx89_pos, 1
    gt $I11, rx89_eos, rx89_fail
    sub $I11, rx89_pos, rx89_off
    substr $S10, rx89_tgt, $I11, 1
    ne $S10, "|", rx89_fail
    add rx89_pos, 1
  alt96_end:
  alt97_0:
.annotate 'line', 34
    set_addr $I10, alt97_1
    rx89_cur."!mark_push"(0, rx89_pos, $I10)
  # rx subrule "termish" subtype=capture negate=
    rx89_cur."!cursor_pos"(rx89_pos)
    $P10 = rx89_cur."termish"()
    unless $P10, rx89_fail
    rx89_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("termish")
    rx89_pos = $P10."pos"()
    goto alt97_end
  alt97_1:
  # rx subrule "panic" subtype=method negate=
    rx89_cur."!cursor_pos"(rx89_pos)
    $P10 = rx89_cur."panic"("Null pattern not allowed")
    unless $P10, rx89_fail
    rx89_pos = $P10."pos"()
  alt97_end:
.annotate 'line', 35
    set_addr $I10, rxquantr95_done
    (rx89_rep) = rx89_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr95_done
    rx89_cur."!mark_push"(rx89_rep, rx89_pos, $I10)
    goto rxquantr95_loop
  rxquantr95_done:
.annotate 'line', 29
  # rx pass
    rx89_cur."!cursor_pass"(rx89_pos, "nibbler")
    rx89_cur."!cursor_debug"("PASS  ", "nibbler", " at pos=", rx89_pos)
    .return (rx89_cur)
  rx89_restart:
.annotate 'line', 3
    rx89_cur."!cursor_debug"("NEXT ", "nibbler")
  rx89_fail:
    (rx89_rep, rx89_pos, $I10, $P10) = rx89_cur."!mark_fail"(0)
    lt rx89_pos, -1, rx89_done
    eq rx89_pos, -1, rx89_fail
    jump $I10
  rx89_done:
    rx89_cur."!cursor_fail"()
    rx89_cur."!cursor_debug"("FAIL  ", "nibbler")
    .return (rx89_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__nibbler"  :subid("27_1279564390.79897") :method
.annotate 'line', 3
    new $P91, "ResizablePMCArray"
    push $P91, ""
    .return ($P91)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "termish"  :subid("28_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx99_tgt
    .local int rx99_pos
    .local int rx99_off
    .local int rx99_eos
    .local int rx99_rep
    .local pmc rx99_cur
    (rx99_cur, rx99_pos, rx99_tgt, $I10) = self."!cursor_start"()
    rx99_cur."!cursor_caparray"("noun")
    .lex unicode:"$\x{a2}", rx99_cur
    .local pmc match
    .lex "$/", match
    length rx99_eos, rx99_tgt
    gt rx99_pos, rx99_eos, rx99_done
    set rx99_off, 0
    lt rx99_pos, 2, rx99_start
    sub rx99_off, rx99_pos, 1
    substr rx99_tgt, rx99_tgt, rx99_off
  rx99_start:
    eq $I10, 1, rx99_restart
    rx99_cur."!cursor_debug"("START ", "termish")
    $I10 = self.'from'()
    ne $I10, -1, rxscan102_done
    goto rxscan102_scan
  rxscan102_loop:
    ($P10) = rx99_cur."from"()
    inc $P10
    set rx99_pos, $P10
    ge rx99_pos, rx99_eos, rxscan102_done
  rxscan102_scan:
    set_addr $I10, rxscan102_loop
    rx99_cur."!mark_push"(0, rx99_pos, $I10)
  rxscan102_done:
.annotate 'line', 39
  # rx rxquantr103 ** 1..*
    set_addr $I10, rxquantr103_done
    rx99_cur."!mark_push"(0, -1, $I10)
  rxquantr103_loop:
  # rx subrule "quantified_atom" subtype=capture negate=
    rx99_cur."!cursor_pos"(rx99_pos)
    $P10 = rx99_cur."quantified_atom"()
    unless $P10, rx99_fail
    goto rxsubrule104_pass
  rxsubrule104_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx99_fail
  rxsubrule104_pass:
    set_addr $I10, rxsubrule104_back
    rx99_cur."!mark_push"(0, rx99_pos, $I10, $P10)
    $P10."!cursor_names"("noun")
    rx99_pos = $P10."pos"()
    set_addr $I10, rxquantr103_done
    (rx99_rep) = rx99_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr103_done
    rx99_cur."!mark_push"(rx99_rep, rx99_pos, $I10)
    goto rxquantr103_loop
  rxquantr103_done:
.annotate 'line', 38
  # rx pass
    rx99_cur."!cursor_pass"(rx99_pos, "termish")
    rx99_cur."!cursor_debug"("PASS  ", "termish", " at pos=", rx99_pos)
    .return (rx99_cur)
  rx99_restart:
.annotate 'line', 3
    rx99_cur."!cursor_debug"("NEXT ", "termish")
  rx99_fail:
    (rx99_rep, rx99_pos, $I10, $P10) = rx99_cur."!mark_fail"(0)
    lt rx99_pos, -1, rx99_done
    eq rx99_pos, -1, rx99_fail
    jump $I10
  rx99_done:
    rx99_cur."!cursor_fail"()
    rx99_cur."!cursor_debug"("FAIL  ", "termish")
    .return (rx99_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__termish"  :subid("29_1279564390.79897") :method
.annotate 'line', 3
    new $P101, "ResizablePMCArray"
    push $P101, ""
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantified_atom"  :subid("30_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .const 'Sub' $P114 = "32_1279564390.79897" 
    capture_lex $P114
    .local string rx106_tgt
    .local int rx106_pos
    .local int rx106_off
    .local int rx106_eos
    .local int rx106_rep
    .local pmc rx106_cur
    (rx106_cur, rx106_pos, rx106_tgt, $I10) = self."!cursor_start"()
    rx106_cur."!cursor_caparray"("quantifier", "backmod")
    .lex unicode:"$\x{a2}", rx106_cur
    .local pmc match
    .lex "$/", match
    length rx106_eos, rx106_tgt
    gt rx106_pos, rx106_eos, rx106_done
    set rx106_off, 0
    lt rx106_pos, 2, rx106_start
    sub rx106_off, rx106_pos, 1
    substr rx106_tgt, rx106_tgt, rx106_off
  rx106_start:
    eq $I10, 1, rx106_restart
    rx106_cur."!cursor_debug"("START ", "quantified_atom")
    $I10 = self.'from'()
    ne $I10, -1, rxscan110_done
    goto rxscan110_scan
  rxscan110_loop:
    ($P10) = rx106_cur."from"()
    inc $P10
    set rx106_pos, $P10
    ge rx106_pos, rx106_eos, rxscan110_done
  rxscan110_scan:
    set_addr $I10, rxscan110_loop
    rx106_cur."!mark_push"(0, rx106_pos, $I10)
  rxscan110_done:
.annotate 'line', 43
  # rx subrule "atom" subtype=capture negate=
    rx106_cur."!cursor_pos"(rx106_pos)
    $P10 = rx106_cur."atom"()
    unless $P10, rx106_fail
    rx106_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("atom")
    rx106_pos = $P10."pos"()
  # rx rxquantr111 ** 0..1
    set_addr $I10, rxquantr111_done
    rx106_cur."!mark_push"(0, rx106_pos, $I10)
  rxquantr111_loop:
  # rx subrule "ws" subtype=method negate=
    rx106_cur."!cursor_pos"(rx106_pos)
    $P10 = rx106_cur."ws"()
    unless $P10, rx106_fail
    rx106_pos = $P10."pos"()
  alt112_0:
    set_addr $I10, alt112_1
    rx106_cur."!mark_push"(0, rx106_pos, $I10)
  # rx subrule "quantifier" subtype=capture negate=
    rx106_cur."!cursor_pos"(rx106_pos)
    $P10 = rx106_cur."quantifier"()
    unless $P10, rx106_fail
    rx106_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantifier")
    rx106_pos = $P10."pos"()
    goto alt112_end
  alt112_1:
  # rx subrule "before" subtype=zerowidth negate=
    rx106_cur."!cursor_pos"(rx106_pos)
    .const 'Sub' $P114 = "32_1279564390.79897" 
    capture_lex $P114
    $P10 = rx106_cur."before"($P114)
    unless $P10, rx106_fail
  # rx subrule "backmod" subtype=capture negate=
    rx106_cur."!cursor_pos"(rx106_pos)
    $P10 = rx106_cur."backmod"()
    unless $P10, rx106_fail
    rx106_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx106_pos = $P10."pos"()
  # rx subrule "alpha" subtype=zerowidth negate=1
    rx106_cur."!cursor_pos"(rx106_pos)
    $P10 = rx106_cur."alpha"()
    if $P10, rx106_fail
  alt112_end:
    set_addr $I10, rxquantr111_done
    (rx106_rep) = rx106_cur."!mark_commit"($I10)
  rxquantr111_done:
.annotate 'line', 42
  # rx pass
    rx106_cur."!cursor_pass"(rx106_pos, "quantified_atom")
    rx106_cur."!cursor_debug"("PASS  ", "quantified_atom", " at pos=", rx106_pos)
    .return (rx106_cur)
  rx106_restart:
.annotate 'line', 3
    rx106_cur."!cursor_debug"("NEXT ", "quantified_atom")
  rx106_fail:
    (rx106_rep, rx106_pos, $I10, $P10) = rx106_cur."!mark_fail"(0)
    lt rx106_pos, -1, rx106_done
    eq rx106_pos, -1, rx106_fail
    jump $I10
  rx106_done:
    rx106_cur."!cursor_fail"()
    rx106_cur."!cursor_debug"("FAIL  ", "quantified_atom")
    .return (rx106_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantified_atom"  :subid("31_1279564390.79897") :method
.annotate 'line', 3
    $P108 = self."!PREFIX__!subrule"("atom", "")
    new $P109, "ResizablePMCArray"
    push $P109, $P108
    .return ($P109)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block113"  :anon :subid("32_1279564390.79897") :method :outer("30_1279564390.79897")
.annotate 'line', 43
    .local string rx115_tgt
    .local int rx115_pos
    .local int rx115_off
    .local int rx115_eos
    .local int rx115_rep
    .local pmc rx115_cur
    (rx115_cur, rx115_pos, rx115_tgt, $I10) = self."!cursor_start"()
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
    eq $I10, 1, rx115_restart
    rx115_cur."!cursor_debug"("START ", "")
    $I10 = self.'from'()
    ne $I10, -1, rxscan116_done
    goto rxscan116_scan
  rxscan116_loop:
    ($P10) = rx115_cur."from"()
    inc $P10
    set rx115_pos, $P10
    ge rx115_pos, rx115_eos, rxscan116_done
  rxscan116_scan:
    set_addr $I10, rxscan116_loop
    rx115_cur."!mark_push"(0, rx115_pos, $I10)
  rxscan116_done:
  # rx literal  ":"
    add $I11, rx115_pos, 1
    gt $I11, rx115_eos, rx115_fail
    sub $I11, rx115_pos, rx115_off
    substr $S10, rx115_tgt, $I11, 1
    ne $S10, ":", rx115_fail
    add rx115_pos, 1
  # rx pass
    rx115_cur."!cursor_pass"(rx115_pos, "")
    rx115_cur."!cursor_debug"("PASS  ", "", " at pos=", rx115_pos)
    .return (rx115_cur)
  rx115_restart:
    rx115_cur."!cursor_debug"("NEXT ", "")
  rx115_fail:
    (rx115_rep, rx115_pos, $I10, $P10) = rx115_cur."!mark_fail"(0)
    lt rx115_pos, -1, rx115_done
    eq rx115_pos, -1, rx115_fail
    jump $I10
  rx115_done:
    rx115_cur."!cursor_fail"()
    rx115_cur."!cursor_debug"("FAIL  ", "")
    .return (rx115_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "atom"  :subid("33_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .const 'Sub' $P127 = "35_1279564390.79897" 
    capture_lex $P127
    .local string rx118_tgt
    .local int rx118_pos
    .local int rx118_off
    .local int rx118_eos
    .local int rx118_rep
    .local pmc rx118_cur
    (rx118_cur, rx118_pos, rx118_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx118_cur
    .local pmc match
    .lex "$/", match
    length rx118_eos, rx118_tgt
    gt rx118_pos, rx118_eos, rx118_done
    set rx118_off, 0
    lt rx118_pos, 2, rx118_start
    sub rx118_off, rx118_pos, 1
    substr rx118_tgt, rx118_tgt, rx118_off
  rx118_start:
    eq $I10, 1, rx118_restart
    rx118_cur."!cursor_debug"("START ", "atom")
    $I10 = self.'from'()
    ne $I10, -1, rxscan122_done
    goto rxscan122_scan
  rxscan122_loop:
    ($P10) = rx118_cur."from"()
    inc $P10
    set rx118_pos, $P10
    ge rx118_pos, rx118_eos, rxscan122_done
  rxscan122_scan:
    set_addr $I10, rxscan122_loop
    rx118_cur."!mark_push"(0, rx118_pos, $I10)
  rxscan122_done:
  alt123_0:
.annotate 'line', 48
    set_addr $I10, alt123_1
    rx118_cur."!mark_push"(0, rx118_pos, $I10)
.annotate 'line', 49
  # rx charclass w
    ge rx118_pos, rx118_eos, rx118_fail
    sub $I10, rx118_pos, rx118_off
    is_cclass $I11, 8192, rx118_tgt, $I10
    unless $I11, rx118_fail
    inc rx118_pos
  # rx rxquantr124 ** 0..1
    set_addr $I10, rxquantr124_done
    rx118_cur."!mark_push"(0, rx118_pos, $I10)
  rxquantr124_loop:
  # rx rxquantg125 ** 1..*
  rxquantg125_loop:
  # rx charclass w
    ge rx118_pos, rx118_eos, rx118_fail
    sub $I10, rx118_pos, rx118_off
    is_cclass $I11, 8192, rx118_tgt, $I10
    unless $I11, rx118_fail
    inc rx118_pos
    set_addr $I10, rxquantg125_done
    rx118_cur."!mark_push"(rx118_rep, rx118_pos, $I10)
    goto rxquantg125_loop
  rxquantg125_done:
  # rx subrule "before" subtype=zerowidth negate=
    rx118_cur."!cursor_pos"(rx118_pos)
    .const 'Sub' $P127 = "35_1279564390.79897" 
    capture_lex $P127
    $P10 = rx118_cur."before"($P127)
    unless $P10, rx118_fail
    set_addr $I10, rxquantr124_done
    (rx118_rep) = rx118_cur."!mark_commit"($I10)
  rxquantr124_done:
    goto alt123_end
  alt123_1:
.annotate 'line', 50
  # rx subrule "metachar" subtype=capture negate=
    rx118_cur."!cursor_pos"(rx118_pos)
    $P10 = rx118_cur."metachar"()
    unless $P10, rx118_fail
    rx118_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("metachar")
    rx118_pos = $P10."pos"()
  alt123_end:
.annotate 'line', 46
  # rx pass
    rx118_cur."!cursor_pass"(rx118_pos, "atom")
    rx118_cur."!cursor_debug"("PASS  ", "atom", " at pos=", rx118_pos)
    .return (rx118_cur)
  rx118_restart:
.annotate 'line', 3
    rx118_cur."!cursor_debug"("NEXT ", "atom")
  rx118_fail:
    (rx118_rep, rx118_pos, $I10, $P10) = rx118_cur."!mark_fail"(0)
    lt rx118_pos, -1, rx118_done
    eq rx118_pos, -1, rx118_fail
    jump $I10
  rx118_done:
    rx118_cur."!cursor_fail"()
    rx118_cur."!cursor_debug"("FAIL  ", "atom")
    .return (rx118_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__atom"  :subid("34_1279564390.79897") :method
.annotate 'line', 3
    $P120 = self."!PREFIX__!subrule"("metachar", "")
    new $P121, "ResizablePMCArray"
    push $P121, $P120
    push $P121, ""
    .return ($P121)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block126"  :anon :subid("35_1279564390.79897") :method :outer("33_1279564390.79897")
.annotate 'line', 49
    .local string rx128_tgt
    .local int rx128_pos
    .local int rx128_off
    .local int rx128_eos
    .local int rx128_rep
    .local pmc rx128_cur
    (rx128_cur, rx128_pos, rx128_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx128_cur
    .local pmc match
    .lex "$/", match
    length rx128_eos, rx128_tgt
    gt rx128_pos, rx128_eos, rx128_done
    set rx128_off, 0
    lt rx128_pos, 2, rx128_start
    sub rx128_off, rx128_pos, 1
    substr rx128_tgt, rx128_tgt, rx128_off
  rx128_start:
    eq $I10, 1, rx128_restart
    rx128_cur."!cursor_debug"("START ", "")
    $I10 = self.'from'()
    ne $I10, -1, rxscan129_done
    goto rxscan129_scan
  rxscan129_loop:
    ($P10) = rx128_cur."from"()
    inc $P10
    set rx128_pos, $P10
    ge rx128_pos, rx128_eos, rxscan129_done
  rxscan129_scan:
    set_addr $I10, rxscan129_loop
    rx128_cur."!mark_push"(0, rx128_pos, $I10)
  rxscan129_done:
  # rx charclass w
    ge rx128_pos, rx128_eos, rx128_fail
    sub $I10, rx128_pos, rx128_off
    is_cclass $I11, 8192, rx128_tgt, $I10
    unless $I11, rx128_fail
    inc rx128_pos
  # rx pass
    rx128_cur."!cursor_pass"(rx128_pos, "")
    rx128_cur."!cursor_debug"("PASS  ", "", " at pos=", rx128_pos)
    .return (rx128_cur)
  rx128_restart:
    rx128_cur."!cursor_debug"("NEXT ", "")
  rx128_fail:
    (rx128_rep, rx128_pos, $I10, $P10) = rx128_cur."!mark_fail"(0)
    lt rx128_pos, -1, rx128_done
    eq rx128_pos, -1, rx128_fail
    jump $I10
  rx128_done:
    rx128_cur."!cursor_fail"()
    rx128_cur."!cursor_debug"("FAIL  ", "")
    .return (rx128_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier"  :subid("36_1279564390.79897") :method
.annotate 'line', 54
    $P131 = self."!protoregex"("quantifier")
    .return ($P131)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier"  :subid("37_1279564390.79897") :method
.annotate 'line', 54
    $P133 = self."!PREFIX__!protoregex"("quantifier")
    .return ($P133)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<*>"  :subid("38_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx135_tgt
    .local int rx135_pos
    .local int rx135_off
    .local int rx135_eos
    .local int rx135_rep
    .local pmc rx135_cur
    (rx135_cur, rx135_pos, rx135_tgt, $I10) = self."!cursor_start"()
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
    eq $I10, 1, rx135_restart
    rx135_cur."!cursor_debug"("START ", "quantifier:sym<*>")
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
.annotate 'line', 55
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
  rx135_restart:
.annotate 'line', 3
    rx135_cur."!cursor_debug"("NEXT ", "quantifier:sym<*>")
  rx135_fail:
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
.sub "!PREFIX__quantifier:sym<*>"  :subid("39_1279564390.79897") :method
.annotate 'line', 3
    $P137 = self."!PREFIX__!subrule"("backmod", "*")
    new $P138, "ResizablePMCArray"
    push $P138, $P137
    .return ($P138)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<+>"  :subid("40_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx142_tgt
    .local int rx142_pos
    .local int rx142_off
    .local int rx142_eos
    .local int rx142_rep
    .local pmc rx142_cur
    (rx142_cur, rx142_pos, rx142_tgt, $I10) = self."!cursor_start"()
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
    eq $I10, 1, rx142_restart
    rx142_cur."!cursor_debug"("START ", "quantifier:sym<+>")
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
.annotate 'line', 56
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
  rx142_restart:
.annotate 'line', 3
    rx142_cur."!cursor_debug"("NEXT ", "quantifier:sym<+>")
  rx142_fail:
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
.sub "!PREFIX__quantifier:sym<+>"  :subid("41_1279564390.79897") :method
.annotate 'line', 3
    $P144 = self."!PREFIX__!subrule"("backmod", "+")
    new $P145, "ResizablePMCArray"
    push $P145, $P144
    .return ($P145)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<?>"  :subid("42_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx149_tgt
    .local int rx149_pos
    .local int rx149_off
    .local int rx149_eos
    .local int rx149_rep
    .local pmc rx149_cur
    (rx149_cur, rx149_pos, rx149_tgt, $I10) = self."!cursor_start"()
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
    eq $I10, 1, rx149_restart
    rx149_cur."!cursor_debug"("START ", "quantifier:sym<?>")
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
.annotate 'line', 57
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
  rx149_restart:
.annotate 'line', 3
    rx149_cur."!cursor_debug"("NEXT ", "quantifier:sym<?>")
  rx149_fail:
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
.sub "!PREFIX__quantifier:sym<?>"  :subid("43_1279564390.79897") :method
.annotate 'line', 3
    $P151 = self."!PREFIX__!subrule"("backmod", "?")
    new $P152, "ResizablePMCArray"
    push $P152, $P151
    .return ($P152)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<**>"  :subid("44_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx156_tgt
    .local int rx156_pos
    .local int rx156_off
    .local int rx156_eos
    .local int rx156_rep
    .local pmc rx156_cur
    (rx156_cur, rx156_pos, rx156_tgt, $I10) = self."!cursor_start"()
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
    eq $I10, 1, rx156_restart
    rx156_cur."!cursor_debug"("START ", "quantifier:sym<**>")
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
.annotate 'line', 59
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
    set_addr $I10, rxquantr161_done
    rx156_cur."!mark_push"(0, rx156_pos, $I10)
  rxquantr161_loop:
  # rx subrule "normspace" subtype=capture negate=
    rx156_cur."!cursor_pos"(rx156_pos)
    $P10 = rx156_cur."normspace"()
    unless $P10, rx156_fail
    goto rxsubrule162_pass
  rxsubrule162_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx156_fail
  rxsubrule162_pass:
    set_addr $I10, rxsubrule162_back
    rx156_cur."!mark_push"(0, rx156_pos, $I10, $P10)
    $P10."!cursor_names"("normspace")
    rx156_pos = $P10."pos"()
    set_addr $I10, rxquantr161_done
    (rx156_rep) = rx156_cur."!mark_commit"($I10)
  rxquantr161_done:
  # rx subrule "backmod" subtype=capture negate=
    rx156_cur."!cursor_pos"(rx156_pos)
    $P10 = rx156_cur."backmod"()
    unless $P10, rx156_fail
    rx156_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx156_pos = $P10."pos"()
  # rx rxquantr163 ** 0..1
    set_addr $I10, rxquantr163_done
    rx156_cur."!mark_push"(0, rx156_pos, $I10)
  rxquantr163_loop:
  # rx subrule "normspace" subtype=capture negate=
    rx156_cur."!cursor_pos"(rx156_pos)
    $P10 = rx156_cur."normspace"()
    unless $P10, rx156_fail
    goto rxsubrule164_pass
  rxsubrule164_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx156_fail
  rxsubrule164_pass:
    set_addr $I10, rxsubrule164_back
    rx156_cur."!mark_push"(0, rx156_pos, $I10, $P10)
    $P10."!cursor_names"("normspace")
    rx156_pos = $P10."pos"()
    set_addr $I10, rxquantr163_done
    (rx156_rep) = rx156_cur."!mark_commit"($I10)
  rxquantr163_done:
  alt165_0:
.annotate 'line', 60
    set_addr $I10, alt165_1
    rx156_cur."!mark_push"(0, rx156_pos, $I10)
.annotate 'line', 61
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
.annotate 'line', 68
  # rx rxquantr167 ** 0..1
    set_addr $I10, rxquantr167_done
    rx156_cur."!mark_push"(0, rx156_pos, $I10)
  rxquantr167_loop:
.annotate 'line', 62
  # rx literal  ".."
    add $I11, rx156_pos, 2
    gt $I11, rx156_eos, rx156_fail
    sub $I11, rx156_pos, rx156_off
    substr $S10, rx156_tgt, $I11, 2
    ne $S10, "..", rx156_fail
    add rx156_pos, 2
.annotate 'line', 63
  # rx subcapture "max"
    set_addr $I10, rxcap_169_fail
    rx156_cur."!mark_push"(0, rx156_pos, $I10)
  alt168_0:
    set_addr $I10, alt168_1
    rx156_cur."!mark_push"(0, rx156_pos, $I10)
.annotate 'line', 64
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
.annotate 'line', 65
  # rx literal  "*"
    add $I11, rx156_pos, 1
    gt $I11, rx156_eos, rx156_fail
    sub $I11, rx156_pos, rx156_off
    substr $S10, rx156_tgt, $I11, 1
    ne $S10, "*", rx156_fail
    add rx156_pos, 1
    goto alt168_end
  alt168_2:
.annotate 'line', 66
  # rx subrule "panic" subtype=method negate=
    rx156_cur."!cursor_pos"(rx156_pos)
    $P10 = rx156_cur."panic"("Only integers or '*' allowed as range quantifier endpoint")
    unless $P10, rx156_fail
    rx156_pos = $P10."pos"()
  alt168_end:
.annotate 'line', 63
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
.annotate 'line', 68
    set_addr $I10, rxquantr167_done
    (rx156_rep) = rx156_cur."!mark_commit"($I10)
  rxquantr167_done:
.annotate 'line', 61
    goto alt165_end
  alt165_1:
.annotate 'line', 69
  # rx subrule "quantified_atom" subtype=capture negate=
    rx156_cur."!cursor_pos"(rx156_pos)
    $P10 = rx156_cur."quantified_atom"()
    unless $P10, rx156_fail
    rx156_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantified_atom")
    rx156_pos = $P10."pos"()
  alt165_end:
.annotate 'line', 58
  # rx pass
    rx156_cur."!cursor_pass"(rx156_pos, "quantifier:sym<**>")
    rx156_cur."!cursor_debug"("PASS  ", "quantifier:sym<**>", " at pos=", rx156_pos)
    .return (rx156_cur)
  rx156_restart:
.annotate 'line', 3
    rx156_cur."!cursor_debug"("NEXT ", "quantifier:sym<**>")
  rx156_fail:
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
.sub "!PREFIX__quantifier:sym<**>"  :subid("45_1279564390.79897") :method
.annotate 'line', 3
    new $P158, "ResizablePMCArray"
    push $P158, "**"
    .return ($P158)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backmod"  :subid("46_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .const 'Sub' $P178 = "48_1279564390.79897" 
    capture_lex $P178
    .local string rx171_tgt
    .local int rx171_pos
    .local int rx171_off
    .local int rx171_eos
    .local int rx171_rep
    .local pmc rx171_cur
    (rx171_cur, rx171_pos, rx171_tgt, $I10) = self."!cursor_start"()
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
    eq $I10, 1, rx171_restart
    rx171_cur."!cursor_debug"("START ", "backmod")
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
.annotate 'line', 73
  # rx rxquantr175 ** 0..1
    set_addr $I10, rxquantr175_done
    rx171_cur."!mark_push"(0, rx171_pos, $I10)
  rxquantr175_loop:
  # rx literal  ":"
    add $I11, rx171_pos, 1
    gt $I11, rx171_eos, rx171_fail
    sub $I11, rx171_pos, rx171_off
    substr $S10, rx171_tgt, $I11, 1
    ne $S10, ":", rx171_fail
    add rx171_pos, 1
    set_addr $I10, rxquantr175_done
    (rx171_rep) = rx171_cur."!mark_commit"($I10)
  rxquantr175_done:
  alt176_0:
    set_addr $I10, alt176_1
    rx171_cur."!mark_push"(0, rx171_pos, $I10)
  # rx literal  "?"
    add $I11, rx171_pos, 1
    gt $I11, rx171_eos, rx171_fail
    sub $I11, rx171_pos, rx171_off
    substr $S10, rx171_tgt, $I11, 1
    ne $S10, "?", rx171_fail
    add rx171_pos, 1
    goto alt176_end
  alt176_1:
    set_addr $I10, alt176_2
    rx171_cur."!mark_push"(0, rx171_pos, $I10)
  # rx literal  "!"
    add $I11, rx171_pos, 1
    gt $I11, rx171_eos, rx171_fail
    sub $I11, rx171_pos, rx171_off
    substr $S10, rx171_tgt, $I11, 1
    ne $S10, "!", rx171_fail
    add rx171_pos, 1
    goto alt176_end
  alt176_2:
  # rx subrule "before" subtype=zerowidth negate=1
    rx171_cur."!cursor_pos"(rx171_pos)
    .const 'Sub' $P178 = "48_1279564390.79897" 
    capture_lex $P178
    $P10 = rx171_cur."before"($P178)
    if $P10, rx171_fail
  alt176_end:
  # rx pass
    rx171_cur."!cursor_pass"(rx171_pos, "backmod")
    rx171_cur."!cursor_debug"("PASS  ", "backmod", " at pos=", rx171_pos)
    .return (rx171_cur)
  rx171_restart:
.annotate 'line', 3
    rx171_cur."!cursor_debug"("NEXT ", "backmod")
  rx171_fail:
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
.sub "!PREFIX__backmod"  :subid("47_1279564390.79897") :method
.annotate 'line', 3
    new $P173, "ResizablePMCArray"
    push $P173, ""
    .return ($P173)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block177"  :anon :subid("48_1279564390.79897") :method :outer("46_1279564390.79897")
.annotate 'line', 73
    .local string rx179_tgt
    .local int rx179_pos
    .local int rx179_off
    .local int rx179_eos
    .local int rx179_rep
    .local pmc rx179_cur
    (rx179_cur, rx179_pos, rx179_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx179_cur
    .local pmc match
    .lex "$/", match
    length rx179_eos, rx179_tgt
    gt rx179_pos, rx179_eos, rx179_done
    set rx179_off, 0
    lt rx179_pos, 2, rx179_start
    sub rx179_off, rx179_pos, 1
    substr rx179_tgt, rx179_tgt, rx179_off
  rx179_start:
    eq $I10, 1, rx179_restart
    rx179_cur."!cursor_debug"("START ", "")
    $I10 = self.'from'()
    ne $I10, -1, rxscan180_done
    goto rxscan180_scan
  rxscan180_loop:
    ($P10) = rx179_cur."from"()
    inc $P10
    set rx179_pos, $P10
    ge rx179_pos, rx179_eos, rxscan180_done
  rxscan180_scan:
    set_addr $I10, rxscan180_loop
    rx179_cur."!mark_push"(0, rx179_pos, $I10)
  rxscan180_done:
  # rx literal  ":"
    add $I11, rx179_pos, 1
    gt $I11, rx179_eos, rx179_fail
    sub $I11, rx179_pos, rx179_off
    substr $S10, rx179_tgt, $I11, 1
    ne $S10, ":", rx179_fail
    add rx179_pos, 1
  # rx pass
    rx179_cur."!cursor_pass"(rx179_pos, "")
    rx179_cur."!cursor_debug"("PASS  ", "", " at pos=", rx179_pos)
    .return (rx179_cur)
  rx179_restart:
    rx179_cur."!cursor_debug"("NEXT ", "")
  rx179_fail:
    (rx179_rep, rx179_pos, $I10, $P10) = rx179_cur."!mark_fail"(0)
    lt rx179_pos, -1, rx179_done
    eq rx179_pos, -1, rx179_fail
    jump $I10
  rx179_done:
    rx179_cur."!cursor_fail"()
    rx179_cur."!cursor_debug"("FAIL  ", "")
    .return (rx179_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar"  :subid("49_1279564390.79897") :method
.annotate 'line', 75
    $P182 = self."!protoregex"("metachar")
    .return ($P182)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar"  :subid("50_1279564390.79897") :method
.annotate 'line', 75
    $P184 = self."!PREFIX__!protoregex"("metachar")
    .return ($P184)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<ws>"  :subid("51_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx186_tgt
    .local int rx186_pos
    .local int rx186_off
    .local int rx186_eos
    .local int rx186_rep
    .local pmc rx186_cur
    (rx186_cur, rx186_pos, rx186_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx186_cur
    .local pmc match
    .lex "$/", match
    length rx186_eos, rx186_tgt
    gt rx186_pos, rx186_eos, rx186_done
    set rx186_off, 0
    lt rx186_pos, 2, rx186_start
    sub rx186_off, rx186_pos, 1
    substr rx186_tgt, rx186_tgt, rx186_off
  rx186_start:
    eq $I10, 1, rx186_restart
    rx186_cur."!cursor_debug"("START ", "metachar:sym<ws>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan190_done
    goto rxscan190_scan
  rxscan190_loop:
    ($P10) = rx186_cur."from"()
    inc $P10
    set rx186_pos, $P10
    ge rx186_pos, rx186_eos, rxscan190_done
  rxscan190_scan:
    set_addr $I10, rxscan190_loop
    rx186_cur."!mark_push"(0, rx186_pos, $I10)
  rxscan190_done:
.annotate 'line', 76
  # rx subrule "normspace" subtype=method negate=
    rx186_cur."!cursor_pos"(rx186_pos)
    $P10 = rx186_cur."normspace"()
    unless $P10, rx186_fail
    rx186_pos = $P10."pos"()
  # rx pass
    rx186_cur."!cursor_pass"(rx186_pos, "metachar:sym<ws>")
    rx186_cur."!cursor_debug"("PASS  ", "metachar:sym<ws>", " at pos=", rx186_pos)
    .return (rx186_cur)
  rx186_restart:
.annotate 'line', 3
    rx186_cur."!cursor_debug"("NEXT ", "metachar:sym<ws>")
  rx186_fail:
    (rx186_rep, rx186_pos, $I10, $P10) = rx186_cur."!mark_fail"(0)
    lt rx186_pos, -1, rx186_done
    eq rx186_pos, -1, rx186_fail
    jump $I10
  rx186_done:
    rx186_cur."!cursor_fail"()
    rx186_cur."!cursor_debug"("FAIL  ", "metachar:sym<ws>")
    .return (rx186_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<ws>"  :subid("52_1279564390.79897") :method
.annotate 'line', 3
    $P188 = self."!PREFIX__!subrule"("normspace", "")
    new $P189, "ResizablePMCArray"
    push $P189, $P188
    .return ($P189)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<[ ]>"  :subid("53_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx192_tgt
    .local int rx192_pos
    .local int rx192_off
    .local int rx192_eos
    .local int rx192_rep
    .local pmc rx192_cur
    (rx192_cur, rx192_pos, rx192_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx192_cur
    .local pmc match
    .lex "$/", match
    length rx192_eos, rx192_tgt
    gt rx192_pos, rx192_eos, rx192_done
    set rx192_off, 0
    lt rx192_pos, 2, rx192_start
    sub rx192_off, rx192_pos, 1
    substr rx192_tgt, rx192_tgt, rx192_off
  rx192_start:
    eq $I10, 1, rx192_restart
    rx192_cur."!cursor_debug"("START ", "metachar:sym<[ ]>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan196_done
    goto rxscan196_scan
  rxscan196_loop:
    ($P10) = rx192_cur."from"()
    inc $P10
    set rx192_pos, $P10
    ge rx192_pos, rx192_eos, rxscan196_done
  rxscan196_scan:
    set_addr $I10, rxscan196_loop
    rx192_cur."!mark_push"(0, rx192_pos, $I10)
  rxscan196_done:
.annotate 'line', 77
  # rx literal  "["
    add $I11, rx192_pos, 1
    gt $I11, rx192_eos, rx192_fail
    sub $I11, rx192_pos, rx192_off
    substr $S10, rx192_tgt, $I11, 1
    ne $S10, "[", rx192_fail
    add rx192_pos, 1
  # rx subrule "nibbler" subtype=capture negate=
    rx192_cur."!cursor_pos"(rx192_pos)
    $P10 = rx192_cur."nibbler"()
    unless $P10, rx192_fail
    rx192_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx192_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx192_pos, 1
    gt $I11, rx192_eos, rx192_fail
    sub $I11, rx192_pos, rx192_off
    substr $S10, rx192_tgt, $I11, 1
    ne $S10, "]", rx192_fail
    add rx192_pos, 1
  # rx pass
    rx192_cur."!cursor_pass"(rx192_pos, "metachar:sym<[ ]>")
    rx192_cur."!cursor_debug"("PASS  ", "metachar:sym<[ ]>", " at pos=", rx192_pos)
    .return (rx192_cur)
  rx192_restart:
.annotate 'line', 3
    rx192_cur."!cursor_debug"("NEXT ", "metachar:sym<[ ]>")
  rx192_fail:
    (rx192_rep, rx192_pos, $I10, $P10) = rx192_cur."!mark_fail"(0)
    lt rx192_pos, -1, rx192_done
    eq rx192_pos, -1, rx192_fail
    jump $I10
  rx192_done:
    rx192_cur."!cursor_fail"()
    rx192_cur."!cursor_debug"("FAIL  ", "metachar:sym<[ ]>")
    .return (rx192_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<[ ]>"  :subid("54_1279564390.79897") :method
.annotate 'line', 3
    $P194 = self."!PREFIX__!subrule"("nibbler", "[")
    new $P195, "ResizablePMCArray"
    push $P195, $P194
    .return ($P195)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<( )>"  :subid("55_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx198_tgt
    .local int rx198_pos
    .local int rx198_off
    .local int rx198_eos
    .local int rx198_rep
    .local pmc rx198_cur
    (rx198_cur, rx198_pos, rx198_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx198_cur
    .local pmc match
    .lex "$/", match
    length rx198_eos, rx198_tgt
    gt rx198_pos, rx198_eos, rx198_done
    set rx198_off, 0
    lt rx198_pos, 2, rx198_start
    sub rx198_off, rx198_pos, 1
    substr rx198_tgt, rx198_tgt, rx198_off
  rx198_start:
    eq $I10, 1, rx198_restart
    rx198_cur."!cursor_debug"("START ", "metachar:sym<( )>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan202_done
    goto rxscan202_scan
  rxscan202_loop:
    ($P10) = rx198_cur."from"()
    inc $P10
    set rx198_pos, $P10
    ge rx198_pos, rx198_eos, rxscan202_done
  rxscan202_scan:
    set_addr $I10, rxscan202_loop
    rx198_cur."!mark_push"(0, rx198_pos, $I10)
  rxscan202_done:
.annotate 'line', 78
  # rx literal  "("
    add $I11, rx198_pos, 1
    gt $I11, rx198_eos, rx198_fail
    sub $I11, rx198_pos, rx198_off
    substr $S10, rx198_tgt, $I11, 1
    ne $S10, "(", rx198_fail
    add rx198_pos, 1
  # rx subrule "nibbler" subtype=capture negate=
    rx198_cur."!cursor_pos"(rx198_pos)
    $P10 = rx198_cur."nibbler"()
    unless $P10, rx198_fail
    rx198_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx198_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx198_pos, 1
    gt $I11, rx198_eos, rx198_fail
    sub $I11, rx198_pos, rx198_off
    substr $S10, rx198_tgt, $I11, 1
    ne $S10, ")", rx198_fail
    add rx198_pos, 1
  # rx pass
    rx198_cur."!cursor_pass"(rx198_pos, "metachar:sym<( )>")
    rx198_cur."!cursor_debug"("PASS  ", "metachar:sym<( )>", " at pos=", rx198_pos)
    .return (rx198_cur)
  rx198_restart:
.annotate 'line', 3
    rx198_cur."!cursor_debug"("NEXT ", "metachar:sym<( )>")
  rx198_fail:
    (rx198_rep, rx198_pos, $I10, $P10) = rx198_cur."!mark_fail"(0)
    lt rx198_pos, -1, rx198_done
    eq rx198_pos, -1, rx198_fail
    jump $I10
  rx198_done:
    rx198_cur."!cursor_fail"()
    rx198_cur."!cursor_debug"("FAIL  ", "metachar:sym<( )>")
    .return (rx198_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<( )>"  :subid("56_1279564390.79897") :method
.annotate 'line', 3
    $P200 = self."!PREFIX__!subrule"("nibbler", "(")
    new $P201, "ResizablePMCArray"
    push $P201, $P200
    .return ($P201)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<'>"  :subid("57_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx204_tgt
    .local int rx204_pos
    .local int rx204_off
    .local int rx204_eos
    .local int rx204_rep
    .local pmc rx204_cur
    (rx204_cur, rx204_pos, rx204_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx204_cur
    .local pmc match
    .lex "$/", match
    length rx204_eos, rx204_tgt
    gt rx204_pos, rx204_eos, rx204_done
    set rx204_off, 0
    lt rx204_pos, 2, rx204_start
    sub rx204_off, rx204_pos, 1
    substr rx204_tgt, rx204_tgt, rx204_off
  rx204_start:
    eq $I10, 1, rx204_restart
    rx204_cur."!cursor_debug"("START ", "metachar:sym<'>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan207_done
    goto rxscan207_scan
  rxscan207_loop:
    ($P10) = rx204_cur."from"()
    inc $P10
    set rx204_pos, $P10
    ge rx204_pos, rx204_eos, rxscan207_done
  rxscan207_scan:
    set_addr $I10, rxscan207_loop
    rx204_cur."!mark_push"(0, rx204_pos, $I10)
  rxscan207_done:
.annotate 'line', 79
  # rx enumcharlist negate=0 zerowidth
    ge rx204_pos, rx204_eos, rx204_fail
    sub $I10, rx204_pos, rx204_off
    substr $S10, rx204_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx204_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx204_cur."!cursor_pos"(rx204_pos)
    $P10 = rx204_cur."quote_EXPR"(":q")
    unless $P10, rx204_fail
    rx204_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx204_pos = $P10."pos"()
  # rx pass
    rx204_cur."!cursor_pass"(rx204_pos, "metachar:sym<'>")
    rx204_cur."!cursor_debug"("PASS  ", "metachar:sym<'>", " at pos=", rx204_pos)
    .return (rx204_cur)
  rx204_restart:
.annotate 'line', 3
    rx204_cur."!cursor_debug"("NEXT ", "metachar:sym<'>")
  rx204_fail:
    (rx204_rep, rx204_pos, $I10, $P10) = rx204_cur."!mark_fail"(0)
    lt rx204_pos, -1, rx204_done
    eq rx204_pos, -1, rx204_fail
    jump $I10
  rx204_done:
    rx204_cur."!cursor_fail"()
    rx204_cur."!cursor_debug"("FAIL  ", "metachar:sym<'>")
    .return (rx204_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<'>"  :subid("58_1279564390.79897") :method
.annotate 'line', 3
    new $P206, "ResizablePMCArray"
    push $P206, "'"
    .return ($P206)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<\">"  :subid("59_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx209_tgt
    .local int rx209_pos
    .local int rx209_off
    .local int rx209_eos
    .local int rx209_rep
    .local pmc rx209_cur
    (rx209_cur, rx209_pos, rx209_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx209_cur
    .local pmc match
    .lex "$/", match
    length rx209_eos, rx209_tgt
    gt rx209_pos, rx209_eos, rx209_done
    set rx209_off, 0
    lt rx209_pos, 2, rx209_start
    sub rx209_off, rx209_pos, 1
    substr rx209_tgt, rx209_tgt, rx209_off
  rx209_start:
    eq $I10, 1, rx209_restart
    rx209_cur."!cursor_debug"("START ", "metachar:sym<\">")
    $I10 = self.'from'()
    ne $I10, -1, rxscan212_done
    goto rxscan212_scan
  rxscan212_loop:
    ($P10) = rx209_cur."from"()
    inc $P10
    set rx209_pos, $P10
    ge rx209_pos, rx209_eos, rxscan212_done
  rxscan212_scan:
    set_addr $I10, rxscan212_loop
    rx209_cur."!mark_push"(0, rx209_pos, $I10)
  rxscan212_done:
.annotate 'line', 80
  # rx enumcharlist negate=0 zerowidth
    ge rx209_pos, rx209_eos, rx209_fail
    sub $I10, rx209_pos, rx209_off
    substr $S10, rx209_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx209_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx209_cur."!cursor_pos"(rx209_pos)
    $P10 = rx209_cur."quote_EXPR"(":qq")
    unless $P10, rx209_fail
    rx209_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx209_pos = $P10."pos"()
  # rx pass
    rx209_cur."!cursor_pass"(rx209_pos, "metachar:sym<\">")
    rx209_cur."!cursor_debug"("PASS  ", "metachar:sym<\">", " at pos=", rx209_pos)
    .return (rx209_cur)
  rx209_restart:
.annotate 'line', 3
    rx209_cur."!cursor_debug"("NEXT ", "metachar:sym<\">")
  rx209_fail:
    (rx209_rep, rx209_pos, $I10, $P10) = rx209_cur."!mark_fail"(0)
    lt rx209_pos, -1, rx209_done
    eq rx209_pos, -1, rx209_fail
    jump $I10
  rx209_done:
    rx209_cur."!cursor_fail"()
    rx209_cur."!cursor_debug"("FAIL  ", "metachar:sym<\">")
    .return (rx209_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<\">"  :subid("60_1279564390.79897") :method
.annotate 'line', 3
    new $P211, "ResizablePMCArray"
    push $P211, "\""
    .return ($P211)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<.>"  :subid("61_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx214_tgt
    .local int rx214_pos
    .local int rx214_off
    .local int rx214_eos
    .local int rx214_rep
    .local pmc rx214_cur
    (rx214_cur, rx214_pos, rx214_tgt, $I10) = self."!cursor_start"()
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
    eq $I10, 1, rx214_restart
    rx214_cur."!cursor_debug"("START ", "metachar:sym<.>")
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
.annotate 'line', 81
  # rx subcapture "sym"
    set_addr $I10, rxcap_218_fail
    rx214_cur."!mark_push"(0, rx214_pos, $I10)
  # rx literal  "."
    add $I11, rx214_pos, 1
    gt $I11, rx214_eos, rx214_fail
    sub $I11, rx214_pos, rx214_off
    substr $S10, rx214_tgt, $I11, 1
    ne $S10, ".", rx214_fail
    add rx214_pos, 1
    set_addr $I10, rxcap_218_fail
    ($I12, $I11) = rx214_cur."!mark_peek"($I10)
    rx214_cur."!cursor_pos"($I11)
    ($P10) = rx214_cur."!cursor_start"()
    $P10."!cursor_pass"(rx214_pos, "")
    rx214_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_218_done
  rxcap_218_fail:
    goto rx214_fail
  rxcap_218_done:
  # rx pass
    rx214_cur."!cursor_pass"(rx214_pos, "metachar:sym<.>")
    rx214_cur."!cursor_debug"("PASS  ", "metachar:sym<.>", " at pos=", rx214_pos)
    .return (rx214_cur)
  rx214_restart:
.annotate 'line', 3
    rx214_cur."!cursor_debug"("NEXT ", "metachar:sym<.>")
  rx214_fail:
    (rx214_rep, rx214_pos, $I10, $P10) = rx214_cur."!mark_fail"(0)
    lt rx214_pos, -1, rx214_done
    eq rx214_pos, -1, rx214_fail
    jump $I10
  rx214_done:
    rx214_cur."!cursor_fail"()
    rx214_cur."!cursor_debug"("FAIL  ", "metachar:sym<.>")
    .return (rx214_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<.>"  :subid("62_1279564390.79897") :method
.annotate 'line', 3
    new $P216, "ResizablePMCArray"
    push $P216, "."
    .return ($P216)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^>"  :subid("63_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx220_tgt
    .local int rx220_pos
    .local int rx220_off
    .local int rx220_eos
    .local int rx220_rep
    .local pmc rx220_cur
    (rx220_cur, rx220_pos, rx220_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx220_cur
    .local pmc match
    .lex "$/", match
    length rx220_eos, rx220_tgt
    gt rx220_pos, rx220_eos, rx220_done
    set rx220_off, 0
    lt rx220_pos, 2, rx220_start
    sub rx220_off, rx220_pos, 1
    substr rx220_tgt, rx220_tgt, rx220_off
  rx220_start:
    eq $I10, 1, rx220_restart
    rx220_cur."!cursor_debug"("START ", "metachar:sym<^>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan223_done
    goto rxscan223_scan
  rxscan223_loop:
    ($P10) = rx220_cur."from"()
    inc $P10
    set rx220_pos, $P10
    ge rx220_pos, rx220_eos, rxscan223_done
  rxscan223_scan:
    set_addr $I10, rxscan223_loop
    rx220_cur."!mark_push"(0, rx220_pos, $I10)
  rxscan223_done:
.annotate 'line', 82
  # rx subcapture "sym"
    set_addr $I10, rxcap_224_fail
    rx220_cur."!mark_push"(0, rx220_pos, $I10)
  # rx literal  "^"
    add $I11, rx220_pos, 1
    gt $I11, rx220_eos, rx220_fail
    sub $I11, rx220_pos, rx220_off
    substr $S10, rx220_tgt, $I11, 1
    ne $S10, "^", rx220_fail
    add rx220_pos, 1
    set_addr $I10, rxcap_224_fail
    ($I12, $I11) = rx220_cur."!mark_peek"($I10)
    rx220_cur."!cursor_pos"($I11)
    ($P10) = rx220_cur."!cursor_start"()
    $P10."!cursor_pass"(rx220_pos, "")
    rx220_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_224_done
  rxcap_224_fail:
    goto rx220_fail
  rxcap_224_done:
  # rx pass
    rx220_cur."!cursor_pass"(rx220_pos, "metachar:sym<^>")
    rx220_cur."!cursor_debug"("PASS  ", "metachar:sym<^>", " at pos=", rx220_pos)
    .return (rx220_cur)
  rx220_restart:
.annotate 'line', 3
    rx220_cur."!cursor_debug"("NEXT ", "metachar:sym<^>")
  rx220_fail:
    (rx220_rep, rx220_pos, $I10, $P10) = rx220_cur."!mark_fail"(0)
    lt rx220_pos, -1, rx220_done
    eq rx220_pos, -1, rx220_fail
    jump $I10
  rx220_done:
    rx220_cur."!cursor_fail"()
    rx220_cur."!cursor_debug"("FAIL  ", "metachar:sym<^>")
    .return (rx220_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<^>"  :subid("64_1279564390.79897") :method
.annotate 'line', 3
    new $P222, "ResizablePMCArray"
    push $P222, "^"
    .return ($P222)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^^>"  :subid("65_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx226_tgt
    .local int rx226_pos
    .local int rx226_off
    .local int rx226_eos
    .local int rx226_rep
    .local pmc rx226_cur
    (rx226_cur, rx226_pos, rx226_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx226_cur
    .local pmc match
    .lex "$/", match
    length rx226_eos, rx226_tgt
    gt rx226_pos, rx226_eos, rx226_done
    set rx226_off, 0
    lt rx226_pos, 2, rx226_start
    sub rx226_off, rx226_pos, 1
    substr rx226_tgt, rx226_tgt, rx226_off
  rx226_start:
    eq $I10, 1, rx226_restart
    rx226_cur."!cursor_debug"("START ", "metachar:sym<^^>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan229_done
    goto rxscan229_scan
  rxscan229_loop:
    ($P10) = rx226_cur."from"()
    inc $P10
    set rx226_pos, $P10
    ge rx226_pos, rx226_eos, rxscan229_done
  rxscan229_scan:
    set_addr $I10, rxscan229_loop
    rx226_cur."!mark_push"(0, rx226_pos, $I10)
  rxscan229_done:
.annotate 'line', 83
  # rx subcapture "sym"
    set_addr $I10, rxcap_230_fail
    rx226_cur."!mark_push"(0, rx226_pos, $I10)
  # rx literal  "^^"
    add $I11, rx226_pos, 2
    gt $I11, rx226_eos, rx226_fail
    sub $I11, rx226_pos, rx226_off
    substr $S10, rx226_tgt, $I11, 2
    ne $S10, "^^", rx226_fail
    add rx226_pos, 2
    set_addr $I10, rxcap_230_fail
    ($I12, $I11) = rx226_cur."!mark_peek"($I10)
    rx226_cur."!cursor_pos"($I11)
    ($P10) = rx226_cur."!cursor_start"()
    $P10."!cursor_pass"(rx226_pos, "")
    rx226_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_230_done
  rxcap_230_fail:
    goto rx226_fail
  rxcap_230_done:
  # rx pass
    rx226_cur."!cursor_pass"(rx226_pos, "metachar:sym<^^>")
    rx226_cur."!cursor_debug"("PASS  ", "metachar:sym<^^>", " at pos=", rx226_pos)
    .return (rx226_cur)
  rx226_restart:
.annotate 'line', 3
    rx226_cur."!cursor_debug"("NEXT ", "metachar:sym<^^>")
  rx226_fail:
    (rx226_rep, rx226_pos, $I10, $P10) = rx226_cur."!mark_fail"(0)
    lt rx226_pos, -1, rx226_done
    eq rx226_pos, -1, rx226_fail
    jump $I10
  rx226_done:
    rx226_cur."!cursor_fail"()
    rx226_cur."!cursor_debug"("FAIL  ", "metachar:sym<^^>")
    .return (rx226_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<^^>"  :subid("66_1279564390.79897") :method
.annotate 'line', 3
    new $P228, "ResizablePMCArray"
    push $P228, "^^"
    .return ($P228)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$>"  :subid("67_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx232_tgt
    .local int rx232_pos
    .local int rx232_off
    .local int rx232_eos
    .local int rx232_rep
    .local pmc rx232_cur
    (rx232_cur, rx232_pos, rx232_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx232_cur
    .local pmc match
    .lex "$/", match
    length rx232_eos, rx232_tgt
    gt rx232_pos, rx232_eos, rx232_done
    set rx232_off, 0
    lt rx232_pos, 2, rx232_start
    sub rx232_off, rx232_pos, 1
    substr rx232_tgt, rx232_tgt, rx232_off
  rx232_start:
    eq $I10, 1, rx232_restart
    rx232_cur."!cursor_debug"("START ", "metachar:sym<$>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan235_done
    goto rxscan235_scan
  rxscan235_loop:
    ($P10) = rx232_cur."from"()
    inc $P10
    set rx232_pos, $P10
    ge rx232_pos, rx232_eos, rxscan235_done
  rxscan235_scan:
    set_addr $I10, rxscan235_loop
    rx232_cur."!mark_push"(0, rx232_pos, $I10)
  rxscan235_done:
.annotate 'line', 84
  # rx subcapture "sym"
    set_addr $I10, rxcap_236_fail
    rx232_cur."!mark_push"(0, rx232_pos, $I10)
  # rx literal  "$"
    add $I11, rx232_pos, 1
    gt $I11, rx232_eos, rx232_fail
    sub $I11, rx232_pos, rx232_off
    substr $S10, rx232_tgt, $I11, 1
    ne $S10, "$", rx232_fail
    add rx232_pos, 1
    set_addr $I10, rxcap_236_fail
    ($I12, $I11) = rx232_cur."!mark_peek"($I10)
    rx232_cur."!cursor_pos"($I11)
    ($P10) = rx232_cur."!cursor_start"()
    $P10."!cursor_pass"(rx232_pos, "")
    rx232_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_236_done
  rxcap_236_fail:
    goto rx232_fail
  rxcap_236_done:
  # rx pass
    rx232_cur."!cursor_pass"(rx232_pos, "metachar:sym<$>")
    rx232_cur."!cursor_debug"("PASS  ", "metachar:sym<$>", " at pos=", rx232_pos)
    .return (rx232_cur)
  rx232_restart:
.annotate 'line', 3
    rx232_cur."!cursor_debug"("NEXT ", "metachar:sym<$>")
  rx232_fail:
    (rx232_rep, rx232_pos, $I10, $P10) = rx232_cur."!mark_fail"(0)
    lt rx232_pos, -1, rx232_done
    eq rx232_pos, -1, rx232_fail
    jump $I10
  rx232_done:
    rx232_cur."!cursor_fail"()
    rx232_cur."!cursor_debug"("FAIL  ", "metachar:sym<$>")
    .return (rx232_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<$>"  :subid("68_1279564390.79897") :method
.annotate 'line', 3
    new $P234, "ResizablePMCArray"
    push $P234, "$"
    .return ($P234)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$$>"  :subid("69_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx238_tgt
    .local int rx238_pos
    .local int rx238_off
    .local int rx238_eos
    .local int rx238_rep
    .local pmc rx238_cur
    (rx238_cur, rx238_pos, rx238_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx238_cur
    .local pmc match
    .lex "$/", match
    length rx238_eos, rx238_tgt
    gt rx238_pos, rx238_eos, rx238_done
    set rx238_off, 0
    lt rx238_pos, 2, rx238_start
    sub rx238_off, rx238_pos, 1
    substr rx238_tgt, rx238_tgt, rx238_off
  rx238_start:
    eq $I10, 1, rx238_restart
    rx238_cur."!cursor_debug"("START ", "metachar:sym<$$>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan241_done
    goto rxscan241_scan
  rxscan241_loop:
    ($P10) = rx238_cur."from"()
    inc $P10
    set rx238_pos, $P10
    ge rx238_pos, rx238_eos, rxscan241_done
  rxscan241_scan:
    set_addr $I10, rxscan241_loop
    rx238_cur."!mark_push"(0, rx238_pos, $I10)
  rxscan241_done:
.annotate 'line', 85
  # rx subcapture "sym"
    set_addr $I10, rxcap_242_fail
    rx238_cur."!mark_push"(0, rx238_pos, $I10)
  # rx literal  "$$"
    add $I11, rx238_pos, 2
    gt $I11, rx238_eos, rx238_fail
    sub $I11, rx238_pos, rx238_off
    substr $S10, rx238_tgt, $I11, 2
    ne $S10, "$$", rx238_fail
    add rx238_pos, 2
    set_addr $I10, rxcap_242_fail
    ($I12, $I11) = rx238_cur."!mark_peek"($I10)
    rx238_cur."!cursor_pos"($I11)
    ($P10) = rx238_cur."!cursor_start"()
    $P10."!cursor_pass"(rx238_pos, "")
    rx238_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_242_done
  rxcap_242_fail:
    goto rx238_fail
  rxcap_242_done:
  # rx pass
    rx238_cur."!cursor_pass"(rx238_pos, "metachar:sym<$$>")
    rx238_cur."!cursor_debug"("PASS  ", "metachar:sym<$$>", " at pos=", rx238_pos)
    .return (rx238_cur)
  rx238_restart:
.annotate 'line', 3
    rx238_cur."!cursor_debug"("NEXT ", "metachar:sym<$$>")
  rx238_fail:
    (rx238_rep, rx238_pos, $I10, $P10) = rx238_cur."!mark_fail"(0)
    lt rx238_pos, -1, rx238_done
    eq rx238_pos, -1, rx238_fail
    jump $I10
  rx238_done:
    rx238_cur."!cursor_fail"()
    rx238_cur."!cursor_debug"("FAIL  ", "metachar:sym<$$>")
    .return (rx238_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<$$>"  :subid("70_1279564390.79897") :method
.annotate 'line', 3
    new $P240, "ResizablePMCArray"
    push $P240, "$$"
    .return ($P240)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<:::>"  :subid("71_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx244_tgt
    .local int rx244_pos
    .local int rx244_off
    .local int rx244_eos
    .local int rx244_rep
    .local pmc rx244_cur
    (rx244_cur, rx244_pos, rx244_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx244_cur
    .local pmc match
    .lex "$/", match
    length rx244_eos, rx244_tgt
    gt rx244_pos, rx244_eos, rx244_done
    set rx244_off, 0
    lt rx244_pos, 2, rx244_start
    sub rx244_off, rx244_pos, 1
    substr rx244_tgt, rx244_tgt, rx244_off
  rx244_start:
    eq $I10, 1, rx244_restart
    rx244_cur."!cursor_debug"("START ", "metachar:sym<:::>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan248_done
    goto rxscan248_scan
  rxscan248_loop:
    ($P10) = rx244_cur."from"()
    inc $P10
    set rx244_pos, $P10
    ge rx244_pos, rx244_eos, rxscan248_done
  rxscan248_scan:
    set_addr $I10, rxscan248_loop
    rx244_cur."!mark_push"(0, rx244_pos, $I10)
  rxscan248_done:
.annotate 'line', 86
  # rx subcapture "sym"
    set_addr $I10, rxcap_249_fail
    rx244_cur."!mark_push"(0, rx244_pos, $I10)
  # rx literal  ":::"
    add $I11, rx244_pos, 3
    gt $I11, rx244_eos, rx244_fail
    sub $I11, rx244_pos, rx244_off
    substr $S10, rx244_tgt, $I11, 3
    ne $S10, ":::", rx244_fail
    add rx244_pos, 3
    set_addr $I10, rxcap_249_fail
    ($I12, $I11) = rx244_cur."!mark_peek"($I10)
    rx244_cur."!cursor_pos"($I11)
    ($P10) = rx244_cur."!cursor_start"()
    $P10."!cursor_pass"(rx244_pos, "")
    rx244_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_249_done
  rxcap_249_fail:
    goto rx244_fail
  rxcap_249_done:
  # rx subrule "panic" subtype=method negate=
    rx244_cur."!cursor_pos"(rx244_pos)
    $P10 = rx244_cur."panic"("::: not yet implemented")
    unless $P10, rx244_fail
    rx244_pos = $P10."pos"()
  # rx pass
    rx244_cur."!cursor_pass"(rx244_pos, "metachar:sym<:::>")
    rx244_cur."!cursor_debug"("PASS  ", "metachar:sym<:::>", " at pos=", rx244_pos)
    .return (rx244_cur)
  rx244_restart:
.annotate 'line', 3
    rx244_cur."!cursor_debug"("NEXT ", "metachar:sym<:::>")
  rx244_fail:
    (rx244_rep, rx244_pos, $I10, $P10) = rx244_cur."!mark_fail"(0)
    lt rx244_pos, -1, rx244_done
    eq rx244_pos, -1, rx244_fail
    jump $I10
  rx244_done:
    rx244_cur."!cursor_fail"()
    rx244_cur."!cursor_debug"("FAIL  ", "metachar:sym<:::>")
    .return (rx244_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<:::>"  :subid("72_1279564390.79897") :method
.annotate 'line', 3
    $P246 = self."!PREFIX__!subrule"("panic", ":::")
    new $P247, "ResizablePMCArray"
    push $P247, $P246
    .return ($P247)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<::>"  :subid("73_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx251_tgt
    .local int rx251_pos
    .local int rx251_off
    .local int rx251_eos
    .local int rx251_rep
    .local pmc rx251_cur
    (rx251_cur, rx251_pos, rx251_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx251_cur
    .local pmc match
    .lex "$/", match
    length rx251_eos, rx251_tgt
    gt rx251_pos, rx251_eos, rx251_done
    set rx251_off, 0
    lt rx251_pos, 2, rx251_start
    sub rx251_off, rx251_pos, 1
    substr rx251_tgt, rx251_tgt, rx251_off
  rx251_start:
    eq $I10, 1, rx251_restart
    rx251_cur."!cursor_debug"("START ", "metachar:sym<::>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan255_done
    goto rxscan255_scan
  rxscan255_loop:
    ($P10) = rx251_cur."from"()
    inc $P10
    set rx251_pos, $P10
    ge rx251_pos, rx251_eos, rxscan255_done
  rxscan255_scan:
    set_addr $I10, rxscan255_loop
    rx251_cur."!mark_push"(0, rx251_pos, $I10)
  rxscan255_done:
.annotate 'line', 87
  # rx subcapture "sym"
    set_addr $I10, rxcap_256_fail
    rx251_cur."!mark_push"(0, rx251_pos, $I10)
  # rx literal  "::"
    add $I11, rx251_pos, 2
    gt $I11, rx251_eos, rx251_fail
    sub $I11, rx251_pos, rx251_off
    substr $S10, rx251_tgt, $I11, 2
    ne $S10, "::", rx251_fail
    add rx251_pos, 2
    set_addr $I10, rxcap_256_fail
    ($I12, $I11) = rx251_cur."!mark_peek"($I10)
    rx251_cur."!cursor_pos"($I11)
    ($P10) = rx251_cur."!cursor_start"()
    $P10."!cursor_pass"(rx251_pos, "")
    rx251_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_256_done
  rxcap_256_fail:
    goto rx251_fail
  rxcap_256_done:
  # rx subrule "panic" subtype=method negate=
    rx251_cur."!cursor_pos"(rx251_pos)
    $P10 = rx251_cur."panic"(":: not yet implemented")
    unless $P10, rx251_fail
    rx251_pos = $P10."pos"()
  # rx pass
    rx251_cur."!cursor_pass"(rx251_pos, "metachar:sym<::>")
    rx251_cur."!cursor_debug"("PASS  ", "metachar:sym<::>", " at pos=", rx251_pos)
    .return (rx251_cur)
  rx251_restart:
.annotate 'line', 3
    rx251_cur."!cursor_debug"("NEXT ", "metachar:sym<::>")
  rx251_fail:
    (rx251_rep, rx251_pos, $I10, $P10) = rx251_cur."!mark_fail"(0)
    lt rx251_pos, -1, rx251_done
    eq rx251_pos, -1, rx251_fail
    jump $I10
  rx251_done:
    rx251_cur."!cursor_fail"()
    rx251_cur."!cursor_debug"("FAIL  ", "metachar:sym<::>")
    .return (rx251_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<::>"  :subid("74_1279564390.79897") :method
.annotate 'line', 3
    $P253 = self."!PREFIX__!subrule"("panic", "::")
    new $P254, "ResizablePMCArray"
    push $P254, $P253
    .return ($P254)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<lwb>"  :subid("75_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx258_tgt
    .local int rx258_pos
    .local int rx258_off
    .local int rx258_eos
    .local int rx258_rep
    .local pmc rx258_cur
    (rx258_cur, rx258_pos, rx258_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx258_cur
    .local pmc match
    .lex "$/", match
    length rx258_eos, rx258_tgt
    gt rx258_pos, rx258_eos, rx258_done
    set rx258_off, 0
    lt rx258_pos, 2, rx258_start
    sub rx258_off, rx258_pos, 1
    substr rx258_tgt, rx258_tgt, rx258_off
  rx258_start:
    eq $I10, 1, rx258_restart
    rx258_cur."!cursor_debug"("START ", "metachar:sym<lwb>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan261_done
    goto rxscan261_scan
  rxscan261_loop:
    ($P10) = rx258_cur."from"()
    inc $P10
    set rx258_pos, $P10
    ge rx258_pos, rx258_eos, rxscan261_done
  rxscan261_scan:
    set_addr $I10, rxscan261_loop
    rx258_cur."!mark_push"(0, rx258_pos, $I10)
  rxscan261_done:
.annotate 'line', 88
  # rx subcapture "sym"
    set_addr $I10, rxcap_263_fail
    rx258_cur."!mark_push"(0, rx258_pos, $I10)
  alt262_0:
    set_addr $I10, alt262_1
    rx258_cur."!mark_push"(0, rx258_pos, $I10)
  # rx literal  "<<"
    add $I11, rx258_pos, 2
    gt $I11, rx258_eos, rx258_fail
    sub $I11, rx258_pos, rx258_off
    substr $S10, rx258_tgt, $I11, 2
    ne $S10, "<<", rx258_fail
    add rx258_pos, 2
    goto alt262_end
  alt262_1:
  # rx literal  unicode:"\x{ab}"
    add $I11, rx258_pos, 1
    gt $I11, rx258_eos, rx258_fail
    sub $I11, rx258_pos, rx258_off
    substr $S10, rx258_tgt, $I11, 1
    ne $S10, unicode:"\x{ab}", rx258_fail
    add rx258_pos, 1
  alt262_end:
    set_addr $I10, rxcap_263_fail
    ($I12, $I11) = rx258_cur."!mark_peek"($I10)
    rx258_cur."!cursor_pos"($I11)
    ($P10) = rx258_cur."!cursor_start"()
    $P10."!cursor_pass"(rx258_pos, "")
    rx258_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_263_done
  rxcap_263_fail:
    goto rx258_fail
  rxcap_263_done:
  # rx pass
    rx258_cur."!cursor_pass"(rx258_pos, "metachar:sym<lwb>")
    rx258_cur."!cursor_debug"("PASS  ", "metachar:sym<lwb>", " at pos=", rx258_pos)
    .return (rx258_cur)
  rx258_restart:
.annotate 'line', 3
    rx258_cur."!cursor_debug"("NEXT ", "metachar:sym<lwb>")
  rx258_fail:
    (rx258_rep, rx258_pos, $I10, $P10) = rx258_cur."!mark_fail"(0)
    lt rx258_pos, -1, rx258_done
    eq rx258_pos, -1, rx258_fail
    jump $I10
  rx258_done:
    rx258_cur."!cursor_fail"()
    rx258_cur."!cursor_debug"("FAIL  ", "metachar:sym<lwb>")
    .return (rx258_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<lwb>"  :subid("76_1279564390.79897") :method
.annotate 'line', 3
    new $P260, "ResizablePMCArray"
    push $P260, unicode:"\x{ab}"
    push $P260, "<<"
    .return ($P260)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<rwb>"  :subid("77_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx265_tgt
    .local int rx265_pos
    .local int rx265_off
    .local int rx265_eos
    .local int rx265_rep
    .local pmc rx265_cur
    (rx265_cur, rx265_pos, rx265_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx265_cur
    .local pmc match
    .lex "$/", match
    length rx265_eos, rx265_tgt
    gt rx265_pos, rx265_eos, rx265_done
    set rx265_off, 0
    lt rx265_pos, 2, rx265_start
    sub rx265_off, rx265_pos, 1
    substr rx265_tgt, rx265_tgt, rx265_off
  rx265_start:
    eq $I10, 1, rx265_restart
    rx265_cur."!cursor_debug"("START ", "metachar:sym<rwb>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan268_done
    goto rxscan268_scan
  rxscan268_loop:
    ($P10) = rx265_cur."from"()
    inc $P10
    set rx265_pos, $P10
    ge rx265_pos, rx265_eos, rxscan268_done
  rxscan268_scan:
    set_addr $I10, rxscan268_loop
    rx265_cur."!mark_push"(0, rx265_pos, $I10)
  rxscan268_done:
.annotate 'line', 89
  # rx subcapture "sym"
    set_addr $I10, rxcap_270_fail
    rx265_cur."!mark_push"(0, rx265_pos, $I10)
  alt269_0:
    set_addr $I10, alt269_1
    rx265_cur."!mark_push"(0, rx265_pos, $I10)
  # rx literal  ">>"
    add $I11, rx265_pos, 2
    gt $I11, rx265_eos, rx265_fail
    sub $I11, rx265_pos, rx265_off
    substr $S10, rx265_tgt, $I11, 2
    ne $S10, ">>", rx265_fail
    add rx265_pos, 2
    goto alt269_end
  alt269_1:
  # rx literal  unicode:"\x{bb}"
    add $I11, rx265_pos, 1
    gt $I11, rx265_eos, rx265_fail
    sub $I11, rx265_pos, rx265_off
    substr $S10, rx265_tgt, $I11, 1
    ne $S10, unicode:"\x{bb}", rx265_fail
    add rx265_pos, 1
  alt269_end:
    set_addr $I10, rxcap_270_fail
    ($I12, $I11) = rx265_cur."!mark_peek"($I10)
    rx265_cur."!cursor_pos"($I11)
    ($P10) = rx265_cur."!cursor_start"()
    $P10."!cursor_pass"(rx265_pos, "")
    rx265_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_270_done
  rxcap_270_fail:
    goto rx265_fail
  rxcap_270_done:
  # rx pass
    rx265_cur."!cursor_pass"(rx265_pos, "metachar:sym<rwb>")
    rx265_cur."!cursor_debug"("PASS  ", "metachar:sym<rwb>", " at pos=", rx265_pos)
    .return (rx265_cur)
  rx265_restart:
.annotate 'line', 3
    rx265_cur."!cursor_debug"("NEXT ", "metachar:sym<rwb>")
  rx265_fail:
    (rx265_rep, rx265_pos, $I10, $P10) = rx265_cur."!mark_fail"(0)
    lt rx265_pos, -1, rx265_done
    eq rx265_pos, -1, rx265_fail
    jump $I10
  rx265_done:
    rx265_cur."!cursor_fail"()
    rx265_cur."!cursor_debug"("FAIL  ", "metachar:sym<rwb>")
    .return (rx265_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<rwb>"  :subid("78_1279564390.79897") :method
.annotate 'line', 3
    new $P267, "ResizablePMCArray"
    push $P267, unicode:"\x{bb}"
    push $P267, ">>"
    .return ($P267)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<bs>"  :subid("79_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx272_tgt
    .local int rx272_pos
    .local int rx272_off
    .local int rx272_eos
    .local int rx272_rep
    .local pmc rx272_cur
    (rx272_cur, rx272_pos, rx272_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx272_cur
    .local pmc match
    .lex "$/", match
    length rx272_eos, rx272_tgt
    gt rx272_pos, rx272_eos, rx272_done
    set rx272_off, 0
    lt rx272_pos, 2, rx272_start
    sub rx272_off, rx272_pos, 1
    substr rx272_tgt, rx272_tgt, rx272_off
  rx272_start:
    eq $I10, 1, rx272_restart
    rx272_cur."!cursor_debug"("START ", "metachar:sym<bs>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan276_done
    goto rxscan276_scan
  rxscan276_loop:
    ($P10) = rx272_cur."from"()
    inc $P10
    set rx272_pos, $P10
    ge rx272_pos, rx272_eos, rxscan276_done
  rxscan276_scan:
    set_addr $I10, rxscan276_loop
    rx272_cur."!mark_push"(0, rx272_pos, $I10)
  rxscan276_done:
.annotate 'line', 90
  # rx literal  "\\"
    add $I11, rx272_pos, 1
    gt $I11, rx272_eos, rx272_fail
    sub $I11, rx272_pos, rx272_off
    substr $S10, rx272_tgt, $I11, 1
    ne $S10, "\\", rx272_fail
    add rx272_pos, 1
  # rx subrule "backslash" subtype=capture negate=
    rx272_cur."!cursor_pos"(rx272_pos)
    $P10 = rx272_cur."backslash"()
    unless $P10, rx272_fail
    rx272_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backslash")
    rx272_pos = $P10."pos"()
  # rx pass
    rx272_cur."!cursor_pass"(rx272_pos, "metachar:sym<bs>")
    rx272_cur."!cursor_debug"("PASS  ", "metachar:sym<bs>", " at pos=", rx272_pos)
    .return (rx272_cur)
  rx272_restart:
.annotate 'line', 3
    rx272_cur."!cursor_debug"("NEXT ", "metachar:sym<bs>")
  rx272_fail:
    (rx272_rep, rx272_pos, $I10, $P10) = rx272_cur."!mark_fail"(0)
    lt rx272_pos, -1, rx272_done
    eq rx272_pos, -1, rx272_fail
    jump $I10
  rx272_done:
    rx272_cur."!cursor_fail"()
    rx272_cur."!cursor_debug"("FAIL  ", "metachar:sym<bs>")
    .return (rx272_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<bs>"  :subid("80_1279564390.79897") :method
.annotate 'line', 3
    $P274 = self."!PREFIX__!subrule"("backslash", "\\")
    new $P275, "ResizablePMCArray"
    push $P275, $P274
    .return ($P275)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<mod>"  :subid("81_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx278_tgt
    .local int rx278_pos
    .local int rx278_off
    .local int rx278_eos
    .local int rx278_rep
    .local pmc rx278_cur
    (rx278_cur, rx278_pos, rx278_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx278_cur
    .local pmc match
    .lex "$/", match
    length rx278_eos, rx278_tgt
    gt rx278_pos, rx278_eos, rx278_done
    set rx278_off, 0
    lt rx278_pos, 2, rx278_start
    sub rx278_off, rx278_pos, 1
    substr rx278_tgt, rx278_tgt, rx278_off
  rx278_start:
    eq $I10, 1, rx278_restart
    rx278_cur."!cursor_debug"("START ", "metachar:sym<mod>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan282_done
    goto rxscan282_scan
  rxscan282_loop:
    ($P10) = rx278_cur."from"()
    inc $P10
    set rx278_pos, $P10
    ge rx278_pos, rx278_eos, rxscan282_done
  rxscan282_scan:
    set_addr $I10, rxscan282_loop
    rx278_cur."!mark_push"(0, rx278_pos, $I10)
  rxscan282_done:
.annotate 'line', 91
  # rx subrule "mod_internal" subtype=capture negate=
    rx278_cur."!cursor_pos"(rx278_pos)
    $P10 = rx278_cur."mod_internal"()
    unless $P10, rx278_fail
    rx278_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_internal")
    rx278_pos = $P10."pos"()
  # rx pass
    rx278_cur."!cursor_pass"(rx278_pos, "metachar:sym<mod>")
    rx278_cur."!cursor_debug"("PASS  ", "metachar:sym<mod>", " at pos=", rx278_pos)
    .return (rx278_cur)
  rx278_restart:
.annotate 'line', 3
    rx278_cur."!cursor_debug"("NEXT ", "metachar:sym<mod>")
  rx278_fail:
    (rx278_rep, rx278_pos, $I10, $P10) = rx278_cur."!mark_fail"(0)
    lt rx278_pos, -1, rx278_done
    eq rx278_pos, -1, rx278_fail
    jump $I10
  rx278_done:
    rx278_cur."!cursor_fail"()
    rx278_cur."!cursor_debug"("FAIL  ", "metachar:sym<mod>")
    .return (rx278_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<mod>"  :subid("82_1279564390.79897") :method
.annotate 'line', 3
    $P280 = self."!PREFIX__!subrule"("mod_internal", "")
    new $P281, "ResizablePMCArray"
    push $P281, $P280
    .return ($P281)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<~>"  :subid("83_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx284_tgt
    .local int rx284_pos
    .local int rx284_off
    .local int rx284_eos
    .local int rx284_rep
    .local pmc rx284_cur
    (rx284_cur, rx284_pos, rx284_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx284_cur
    .local pmc match
    .lex "$/", match
    length rx284_eos, rx284_tgt
    gt rx284_pos, rx284_eos, rx284_done
    set rx284_off, 0
    lt rx284_pos, 2, rx284_start
    sub rx284_off, rx284_pos, 1
    substr rx284_tgt, rx284_tgt, rx284_off
  rx284_start:
    eq $I10, 1, rx284_restart
    rx284_cur."!cursor_debug"("START ", "metachar:sym<~>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan288_done
    goto rxscan288_scan
  rxscan288_loop:
    ($P10) = rx284_cur."from"()
    inc $P10
    set rx284_pos, $P10
    ge rx284_pos, rx284_eos, rxscan288_done
  rxscan288_scan:
    set_addr $I10, rxscan288_loop
    rx284_cur."!mark_push"(0, rx284_pos, $I10)
  rxscan288_done:
.annotate 'line', 95
  # rx subcapture "sym"
    set_addr $I10, rxcap_289_fail
    rx284_cur."!mark_push"(0, rx284_pos, $I10)
  # rx literal  "~"
    add $I11, rx284_pos, 1
    gt $I11, rx284_eos, rx284_fail
    sub $I11, rx284_pos, rx284_off
    substr $S10, rx284_tgt, $I11, 1
    ne $S10, "~", rx284_fail
    add rx284_pos, 1
    set_addr $I10, rxcap_289_fail
    ($I12, $I11) = rx284_cur."!mark_peek"($I10)
    rx284_cur."!cursor_pos"($I11)
    ($P10) = rx284_cur."!cursor_start"()
    $P10."!cursor_pass"(rx284_pos, "")
    rx284_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_289_done
  rxcap_289_fail:
    goto rx284_fail
  rxcap_289_done:
.annotate 'line', 96
  # rx subrule "ws" subtype=method negate=
    rx284_cur."!cursor_pos"(rx284_pos)
    $P10 = rx284_cur."ws"()
    unless $P10, rx284_fail
    rx284_pos = $P10."pos"()
  # rx subrule "quantified_atom" subtype=capture negate=
    rx284_cur."!cursor_pos"(rx284_pos)
    $P10 = rx284_cur."quantified_atom"()
    unless $P10, rx284_fail
    rx284_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("GOAL")
    rx284_pos = $P10."pos"()
.annotate 'line', 97
  # rx subrule "ws" subtype=method negate=
    rx284_cur."!cursor_pos"(rx284_pos)
    $P10 = rx284_cur."ws"()
    unless $P10, rx284_fail
    rx284_pos = $P10."pos"()
  # rx subrule "quantified_atom" subtype=capture negate=
    rx284_cur."!cursor_pos"(rx284_pos)
    $P10 = rx284_cur."quantified_atom"()
    unless $P10, rx284_fail
    rx284_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx284_pos = $P10."pos"()
.annotate 'line', 94
  # rx pass
    rx284_cur."!cursor_pass"(rx284_pos, "metachar:sym<~>")
    rx284_cur."!cursor_debug"("PASS  ", "metachar:sym<~>", " at pos=", rx284_pos)
    .return (rx284_cur)
  rx284_restart:
.annotate 'line', 3
    rx284_cur."!cursor_debug"("NEXT ", "metachar:sym<~>")
  rx284_fail:
    (rx284_rep, rx284_pos, $I10, $P10) = rx284_cur."!mark_fail"(0)
    lt rx284_pos, -1, rx284_done
    eq rx284_pos, -1, rx284_fail
    jump $I10
  rx284_done:
    rx284_cur."!cursor_fail"()
    rx284_cur."!cursor_debug"("FAIL  ", "metachar:sym<~>")
    .return (rx284_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<~>"  :subid("84_1279564390.79897") :method
.annotate 'line', 3
    $P286 = self."!PREFIX__!subrule"("ws", "~")
    new $P287, "ResizablePMCArray"
    push $P287, $P286
    .return ($P287)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<{*}>"  :subid("85_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx291_tgt
    .local int rx291_pos
    .local int rx291_off
    .local int rx291_eos
    .local int rx291_rep
    .local pmc rx291_cur
    (rx291_cur, rx291_pos, rx291_tgt, $I10) = self."!cursor_start"()
    rx291_cur."!cursor_caparray"("key")
    .lex unicode:"$\x{a2}", rx291_cur
    .local pmc match
    .lex "$/", match
    length rx291_eos, rx291_tgt
    gt rx291_pos, rx291_eos, rx291_done
    set rx291_off, 0
    lt rx291_pos, 2, rx291_start
    sub rx291_off, rx291_pos, 1
    substr rx291_tgt, rx291_tgt, rx291_off
  rx291_start:
    eq $I10, 1, rx291_restart
    rx291_cur."!cursor_debug"("START ", "metachar:sym<{*}>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan294_done
    goto rxscan294_scan
  rxscan294_loop:
    ($P10) = rx291_cur."from"()
    inc $P10
    set rx291_pos, $P10
    ge rx291_pos, rx291_eos, rxscan294_done
  rxscan294_scan:
    set_addr $I10, rxscan294_loop
    rx291_cur."!mark_push"(0, rx291_pos, $I10)
  rxscan294_done:
.annotate 'line', 101
  # rx subcapture "sym"
    set_addr $I10, rxcap_295_fail
    rx291_cur."!mark_push"(0, rx291_pos, $I10)
  # rx literal  "{*}"
    add $I11, rx291_pos, 3
    gt $I11, rx291_eos, rx291_fail
    sub $I11, rx291_pos, rx291_off
    substr $S10, rx291_tgt, $I11, 3
    ne $S10, "{*}", rx291_fail
    add rx291_pos, 3
    set_addr $I10, rxcap_295_fail
    ($I12, $I11) = rx291_cur."!mark_peek"($I10)
    rx291_cur."!cursor_pos"($I11)
    ($P10) = rx291_cur."!cursor_start"()
    $P10."!cursor_pass"(rx291_pos, "")
    rx291_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_295_done
  rxcap_295_fail:
    goto rx291_fail
  rxcap_295_done:
.annotate 'line', 102
  # rx rxquantr296 ** 0..1
    set_addr $I10, rxquantr296_done
    rx291_cur."!mark_push"(0, rx291_pos, $I10)
  rxquantr296_loop:
  # rx rxquantr297 ** 0..*
    set_addr $I10, rxquantr297_done
    rx291_cur."!mark_push"(0, rx291_pos, $I10)
  rxquantr297_loop:
  # rx enumcharlist negate=0 
    ge rx291_pos, rx291_eos, rx291_fail
    sub $I10, rx291_pos, rx291_off
    substr $S10, rx291_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx291_fail
    inc rx291_pos
    set_addr $I10, rxquantr297_done
    (rx291_rep) = rx291_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr297_done
    rx291_cur."!mark_push"(rx291_rep, rx291_pos, $I10)
    goto rxquantr297_loop
  rxquantr297_done:
  # rx literal  "#= "
    add $I11, rx291_pos, 3
    gt $I11, rx291_eos, rx291_fail
    sub $I11, rx291_pos, rx291_off
    substr $S10, rx291_tgt, $I11, 3
    ne $S10, "#= ", rx291_fail
    add rx291_pos, 3
  # rx rxquantr298 ** 0..*
    set_addr $I10, rxquantr298_done
    rx291_cur."!mark_push"(0, rx291_pos, $I10)
  rxquantr298_loop:
  # rx enumcharlist negate=0 
    ge rx291_pos, rx291_eos, rx291_fail
    sub $I10, rx291_pos, rx291_off
    substr $S10, rx291_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx291_fail
    inc rx291_pos
    set_addr $I10, rxquantr298_done
    (rx291_rep) = rx291_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr298_done
    rx291_cur."!mark_push"(rx291_rep, rx291_pos, $I10)
    goto rxquantr298_loop
  rxquantr298_done:
  # rx subcapture "key"
    set_addr $I10, rxcap_301_fail
    rx291_cur."!mark_push"(0, rx291_pos, $I10)
  # rx charclass_q S r 1..-1
    sub $I10, rx291_pos, rx291_off
    find_cclass $I11, 32, rx291_tgt, $I10, rx291_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx291_fail
    add rx291_pos, rx291_off, $I11
  # rx rxquantr299 ** 0..*
    set_addr $I10, rxquantr299_done
    rx291_cur."!mark_push"(0, rx291_pos, $I10)
  rxquantr299_loop:
  # rx rxquantr300 ** 1..*
    set_addr $I10, rxquantr300_done
    rx291_cur."!mark_push"(0, -1, $I10)
  rxquantr300_loop:
  # rx enumcharlist negate=0 
    ge rx291_pos, rx291_eos, rx291_fail
    sub $I10, rx291_pos, rx291_off
    substr $S10, rx291_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx291_fail
    inc rx291_pos
    set_addr $I10, rxquantr300_done
    (rx291_rep) = rx291_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr300_done
    rx291_cur."!mark_push"(rx291_rep, rx291_pos, $I10)
    goto rxquantr300_loop
  rxquantr300_done:
  # rx charclass_q S r 1..-1
    sub $I10, rx291_pos, rx291_off
    find_cclass $I11, 32, rx291_tgt, $I10, rx291_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx291_fail
    add rx291_pos, rx291_off, $I11
    set_addr $I10, rxquantr299_done
    (rx291_rep) = rx291_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr299_done
    rx291_cur."!mark_push"(rx291_rep, rx291_pos, $I10)
    goto rxquantr299_loop
  rxquantr299_done:
    set_addr $I10, rxcap_301_fail
    ($I12, $I11) = rx291_cur."!mark_peek"($I10)
    rx291_cur."!cursor_pos"($I11)
    ($P10) = rx291_cur."!cursor_start"()
    $P10."!cursor_pass"(rx291_pos, "")
    rx291_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("key")
    goto rxcap_301_done
  rxcap_301_fail:
    goto rx291_fail
  rxcap_301_done:
    set_addr $I10, rxquantr296_done
    (rx291_rep) = rx291_cur."!mark_commit"($I10)
  rxquantr296_done:
.annotate 'line', 100
  # rx pass
    rx291_cur."!cursor_pass"(rx291_pos, "metachar:sym<{*}>")
    rx291_cur."!cursor_debug"("PASS  ", "metachar:sym<{*}>", " at pos=", rx291_pos)
    .return (rx291_cur)
  rx291_restart:
.annotate 'line', 3
    rx291_cur."!cursor_debug"("NEXT ", "metachar:sym<{*}>")
  rx291_fail:
    (rx291_rep, rx291_pos, $I10, $P10) = rx291_cur."!mark_fail"(0)
    lt rx291_pos, -1, rx291_done
    eq rx291_pos, -1, rx291_fail
    jump $I10
  rx291_done:
    rx291_cur."!cursor_fail"()
    rx291_cur."!cursor_debug"("FAIL  ", "metachar:sym<{*}>")
    .return (rx291_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<{*}>"  :subid("86_1279564390.79897") :method
.annotate 'line', 3
    new $P293, "ResizablePMCArray"
    push $P293, "{*}"
    .return ($P293)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<assert>"  :subid("87_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx303_tgt
    .local int rx303_pos
    .local int rx303_off
    .local int rx303_eos
    .local int rx303_rep
    .local pmc rx303_cur
    (rx303_cur, rx303_pos, rx303_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx303_cur
    .local pmc match
    .lex "$/", match
    length rx303_eos, rx303_tgt
    gt rx303_pos, rx303_eos, rx303_done
    set rx303_off, 0
    lt rx303_pos, 2, rx303_start
    sub rx303_off, rx303_pos, 1
    substr rx303_tgt, rx303_tgt, rx303_off
  rx303_start:
    eq $I10, 1, rx303_restart
    rx303_cur."!cursor_debug"("START ", "metachar:sym<assert>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan307_done
    goto rxscan307_scan
  rxscan307_loop:
    ($P10) = rx303_cur."from"()
    inc $P10
    set rx303_pos, $P10
    ge rx303_pos, rx303_eos, rxscan307_done
  rxscan307_scan:
    set_addr $I10, rxscan307_loop
    rx303_cur."!mark_push"(0, rx303_pos, $I10)
  rxscan307_done:
.annotate 'line', 105
  # rx literal  "<"
    add $I11, rx303_pos, 1
    gt $I11, rx303_eos, rx303_fail
    sub $I11, rx303_pos, rx303_off
    substr $S10, rx303_tgt, $I11, 1
    ne $S10, "<", rx303_fail
    add rx303_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx303_cur."!cursor_pos"(rx303_pos)
    $P10 = rx303_cur."assertion"()
    unless $P10, rx303_fail
    rx303_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx303_pos = $P10."pos"()
  alt308_0:
.annotate 'line', 106
    set_addr $I10, alt308_1
    rx303_cur."!mark_push"(0, rx303_pos, $I10)
  # rx literal  ">"
    add $I11, rx303_pos, 1
    gt $I11, rx303_eos, rx303_fail
    sub $I11, rx303_pos, rx303_off
    substr $S10, rx303_tgt, $I11, 1
    ne $S10, ">", rx303_fail
    add rx303_pos, 1
    goto alt308_end
  alt308_1:
  # rx subrule "panic" subtype=method negate=
    rx303_cur."!cursor_pos"(rx303_pos)
    $P10 = rx303_cur."panic"("regex assertion not terminated by angle bracket")
    unless $P10, rx303_fail
    rx303_pos = $P10."pos"()
  alt308_end:
.annotate 'line', 104
  # rx pass
    rx303_cur."!cursor_pass"(rx303_pos, "metachar:sym<assert>")
    rx303_cur."!cursor_debug"("PASS  ", "metachar:sym<assert>", " at pos=", rx303_pos)
    .return (rx303_cur)
  rx303_restart:
.annotate 'line', 3
    rx303_cur."!cursor_debug"("NEXT ", "metachar:sym<assert>")
  rx303_fail:
    (rx303_rep, rx303_pos, $I10, $P10) = rx303_cur."!mark_fail"(0)
    lt rx303_pos, -1, rx303_done
    eq rx303_pos, -1, rx303_fail
    jump $I10
  rx303_done:
    rx303_cur."!cursor_fail"()
    rx303_cur."!cursor_debug"("FAIL  ", "metachar:sym<assert>")
    .return (rx303_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<assert>"  :subid("88_1279564390.79897") :method
.annotate 'line', 3
    $P305 = self."!PREFIX__!subrule"("assertion", "<")
    new $P306, "ResizablePMCArray"
    push $P306, $P305
    .return ($P306)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<var>"  :subid("89_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx310_tgt
    .local int rx310_pos
    .local int rx310_off
    .local int rx310_eos
    .local int rx310_rep
    .local pmc rx310_cur
    (rx310_cur, rx310_pos, rx310_tgt, $I10) = self."!cursor_start"()
    rx310_cur."!cursor_caparray"("quantified_atom")
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
    eq $I10, 1, rx310_restart
    rx310_cur."!cursor_debug"("START ", "metachar:sym<var>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan313_done
    goto rxscan313_scan
  rxscan313_loop:
    ($P10) = rx310_cur."from"()
    inc $P10
    set rx310_pos, $P10
    ge rx310_pos, rx310_eos, rxscan313_done
  rxscan313_scan:
    set_addr $I10, rxscan313_loop
    rx310_cur."!mark_push"(0, rx310_pos, $I10)
  rxscan313_done:
  alt314_0:
.annotate 'line', 110
    set_addr $I10, alt314_1
    rx310_cur."!mark_push"(0, rx310_pos, $I10)
.annotate 'line', 111
  # rx literal  "$<"
    add $I11, rx310_pos, 2
    gt $I11, rx310_eos, rx310_fail
    sub $I11, rx310_pos, rx310_off
    substr $S10, rx310_tgt, $I11, 2
    ne $S10, "$<", rx310_fail
    add rx310_pos, 2
  # rx subcapture "name"
    set_addr $I10, rxcap_316_fail
    rx310_cur."!mark_push"(0, rx310_pos, $I10)
  # rx rxquantr315 ** 1..*
    set_addr $I10, rxquantr315_done
    rx310_cur."!mark_push"(0, -1, $I10)
  rxquantr315_loop:
  # rx enumcharlist negate=1 
    ge rx310_pos, rx310_eos, rx310_fail
    sub $I10, rx310_pos, rx310_off
    substr $S10, rx310_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx310_fail
    inc rx310_pos
    set_addr $I10, rxquantr315_done
    (rx310_rep) = rx310_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr315_done
    rx310_cur."!mark_push"(rx310_rep, rx310_pos, $I10)
    goto rxquantr315_loop
  rxquantr315_done:
    set_addr $I10, rxcap_316_fail
    ($I12, $I11) = rx310_cur."!mark_peek"($I10)
    rx310_cur."!cursor_pos"($I11)
    ($P10) = rx310_cur."!cursor_start"()
    $P10."!cursor_pass"(rx310_pos, "")
    rx310_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_316_done
  rxcap_316_fail:
    goto rx310_fail
  rxcap_316_done:
  # rx literal  ">"
    add $I11, rx310_pos, 1
    gt $I11, rx310_eos, rx310_fail
    sub $I11, rx310_pos, rx310_off
    substr $S10, rx310_tgt, $I11, 1
    ne $S10, ">", rx310_fail
    add rx310_pos, 1
    goto alt314_end
  alt314_1:
.annotate 'line', 112
  # rx literal  "$"
    add $I11, rx310_pos, 1
    gt $I11, rx310_eos, rx310_fail
    sub $I11, rx310_pos, rx310_off
    substr $S10, rx310_tgt, $I11, 1
    ne $S10, "$", rx310_fail
    add rx310_pos, 1
  # rx subcapture "pos"
    set_addr $I10, rxcap_317_fail
    rx310_cur."!mark_push"(0, rx310_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx310_pos, rx310_off
    find_not_cclass $I11, 8, rx310_tgt, $I10, rx310_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx310_fail
    add rx310_pos, rx310_off, $I11
    set_addr $I10, rxcap_317_fail
    ($I12, $I11) = rx310_cur."!mark_peek"($I10)
    rx310_cur."!cursor_pos"($I11)
    ($P10) = rx310_cur."!cursor_start"()
    $P10."!cursor_pass"(rx310_pos, "")
    rx310_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pos")
    goto rxcap_317_done
  rxcap_317_fail:
    goto rx310_fail
  rxcap_317_done:
  alt314_end:
.annotate 'line', 115
  # rx rxquantr318 ** 0..1
    set_addr $I10, rxquantr318_done
    rx310_cur."!mark_push"(0, rx310_pos, $I10)
  rxquantr318_loop:
  # rx subrule "ws" subtype=method negate=
    rx310_cur."!cursor_pos"(rx310_pos)
    $P10 = rx310_cur."ws"()
    unless $P10, rx310_fail
    rx310_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx310_pos, 1
    gt $I11, rx310_eos, rx310_fail
    sub $I11, rx310_pos, rx310_off
    substr $S10, rx310_tgt, $I11, 1
    ne $S10, "=", rx310_fail
    add rx310_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx310_cur."!cursor_pos"(rx310_pos)
    $P10 = rx310_cur."ws"()
    unless $P10, rx310_fail
    rx310_pos = $P10."pos"()
  # rx subrule "quantified_atom" subtype=capture negate=
    rx310_cur."!cursor_pos"(rx310_pos)
    $P10 = rx310_cur."quantified_atom"()
    unless $P10, rx310_fail
    rx310_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantified_atom")
    rx310_pos = $P10."pos"()
    set_addr $I10, rxquantr318_done
    (rx310_rep) = rx310_cur."!mark_commit"($I10)
  rxquantr318_done:
.annotate 'line', 109
  # rx pass
    rx310_cur."!cursor_pass"(rx310_pos, "metachar:sym<var>")
    rx310_cur."!cursor_debug"("PASS  ", "metachar:sym<var>", " at pos=", rx310_pos)
    .return (rx310_cur)
  rx310_restart:
.annotate 'line', 3
    rx310_cur."!cursor_debug"("NEXT ", "metachar:sym<var>")
  rx310_fail:
    (rx310_rep, rx310_pos, $I10, $P10) = rx310_cur."!mark_fail"(0)
    lt rx310_pos, -1, rx310_done
    eq rx310_pos, -1, rx310_fail
    jump $I10
  rx310_done:
    rx310_cur."!cursor_fail"()
    rx310_cur."!cursor_debug"("FAIL  ", "metachar:sym<var>")
    .return (rx310_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<var>"  :subid("90_1279564390.79897") :method
.annotate 'line', 3
    new $P312, "ResizablePMCArray"
    push $P312, "$"
    push $P312, "$<"
    .return ($P312)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<PIR>"  :subid("91_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx320_tgt
    .local int rx320_pos
    .local int rx320_off
    .local int rx320_eos
    .local int rx320_rep
    .local pmc rx320_cur
    (rx320_cur, rx320_pos, rx320_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx320_cur
    .local pmc match
    .lex "$/", match
    length rx320_eos, rx320_tgt
    gt rx320_pos, rx320_eos, rx320_done
    set rx320_off, 0
    lt rx320_pos, 2, rx320_start
    sub rx320_off, rx320_pos, 1
    substr rx320_tgt, rx320_tgt, rx320_off
  rx320_start:
    eq $I10, 1, rx320_restart
    rx320_cur."!cursor_debug"("START ", "metachar:sym<PIR>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan323_done
    goto rxscan323_scan
  rxscan323_loop:
    ($P10) = rx320_cur."from"()
    inc $P10
    set rx320_pos, $P10
    ge rx320_pos, rx320_eos, rxscan323_done
  rxscan323_scan:
    set_addr $I10, rxscan323_loop
    rx320_cur."!mark_push"(0, rx320_pos, $I10)
  rxscan323_done:
.annotate 'line', 119
  # rx literal  ":PIR{{"
    add $I11, rx320_pos, 6
    gt $I11, rx320_eos, rx320_fail
    sub $I11, rx320_pos, rx320_off
    substr $S10, rx320_tgt, $I11, 6
    ne $S10, ":PIR{{", rx320_fail
    add rx320_pos, 6
  # rx subcapture "pir"
    set_addr $I10, rxcap_326_fail
    rx320_cur."!mark_push"(0, rx320_pos, $I10)
  # rx rxquantf324 ** 0..*
    set_addr $I10, rxquantf324_loop
    rx320_cur."!mark_push"(0, rx320_pos, $I10)
    goto rxquantf324_done
  rxquantf324_loop:
  # rx charclass .
    ge rx320_pos, rx320_eos, rx320_fail
    inc rx320_pos
    set_addr $I10, rxquantf324_loop
    rx320_cur."!mark_push"(rx320_rep, rx320_pos, $I10)
  rxquantf324_done:
    set_addr $I10, rxcap_326_fail
    ($I12, $I11) = rx320_cur."!mark_peek"($I10)
    rx320_cur."!cursor_pos"($I11)
    ($P10) = rx320_cur."!cursor_start"()
    $P10."!cursor_pass"(rx320_pos, "")
    rx320_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pir")
    goto rxcap_326_done
  rxcap_326_fail:
    goto rx320_fail
  rxcap_326_done:
  # rx literal  "}}"
    add $I11, rx320_pos, 2
    gt $I11, rx320_eos, rx320_fail
    sub $I11, rx320_pos, rx320_off
    substr $S10, rx320_tgt, $I11, 2
    ne $S10, "}}", rx320_fail
    add rx320_pos, 2
.annotate 'line', 118
  # rx pass
    rx320_cur."!cursor_pass"(rx320_pos, "metachar:sym<PIR>")
    rx320_cur."!cursor_debug"("PASS  ", "metachar:sym<PIR>", " at pos=", rx320_pos)
    .return (rx320_cur)
  rx320_restart:
.annotate 'line', 3
    rx320_cur."!cursor_debug"("NEXT ", "metachar:sym<PIR>")
  rx320_fail:
    (rx320_rep, rx320_pos, $I10, $P10) = rx320_cur."!mark_fail"(0)
    lt rx320_pos, -1, rx320_done
    eq rx320_pos, -1, rx320_fail
    jump $I10
  rx320_done:
    rx320_cur."!cursor_fail"()
    rx320_cur."!cursor_debug"("FAIL  ", "metachar:sym<PIR>")
    .return (rx320_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<PIR>"  :subid("92_1279564390.79897") :method
.annotate 'line', 3
    new $P322, "ResizablePMCArray"
    push $P322, ":PIR{{"
    .return ($P322)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash"  :subid("93_1279564390.79897") :method
.annotate 'line', 122
    $P328 = self."!protoregex"("backslash")
    .return ($P328)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash"  :subid("94_1279564390.79897") :method
.annotate 'line', 122
    $P330 = self."!PREFIX__!protoregex"("backslash")
    .return ($P330)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<w>"  :subid("95_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx332_tgt
    .local int rx332_pos
    .local int rx332_off
    .local int rx332_eos
    .local int rx332_rep
    .local pmc rx332_cur
    (rx332_cur, rx332_pos, rx332_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx332_cur
    .local pmc match
    .lex "$/", match
    length rx332_eos, rx332_tgt
    gt rx332_pos, rx332_eos, rx332_done
    set rx332_off, 0
    lt rx332_pos, 2, rx332_start
    sub rx332_off, rx332_pos, 1
    substr rx332_tgt, rx332_tgt, rx332_off
  rx332_start:
    eq $I10, 1, rx332_restart
    rx332_cur."!cursor_debug"("START ", "backslash:sym<w>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan335_done
    goto rxscan335_scan
  rxscan335_loop:
    ($P10) = rx332_cur."from"()
    inc $P10
    set rx332_pos, $P10
    ge rx332_pos, rx332_eos, rxscan335_done
  rxscan335_scan:
    set_addr $I10, rxscan335_loop
    rx332_cur."!mark_push"(0, rx332_pos, $I10)
  rxscan335_done:
.annotate 'line', 123
  # rx subcapture "sym"
    set_addr $I10, rxcap_336_fail
    rx332_cur."!mark_push"(0, rx332_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx332_pos, rx332_eos, rx332_fail
    sub $I10, rx332_pos, rx332_off
    substr $S10, rx332_tgt, $I10, 1
    index $I11, "dswnDSWN", $S10
    lt $I11, 0, rx332_fail
    inc rx332_pos
    set_addr $I10, rxcap_336_fail
    ($I12, $I11) = rx332_cur."!mark_peek"($I10)
    rx332_cur."!cursor_pos"($I11)
    ($P10) = rx332_cur."!cursor_start"()
    $P10."!cursor_pass"(rx332_pos, "")
    rx332_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_336_done
  rxcap_336_fail:
    goto rx332_fail
  rxcap_336_done:
  # rx pass
    rx332_cur."!cursor_pass"(rx332_pos, "backslash:sym<w>")
    rx332_cur."!cursor_debug"("PASS  ", "backslash:sym<w>", " at pos=", rx332_pos)
    .return (rx332_cur)
  rx332_restart:
.annotate 'line', 3
    rx332_cur."!cursor_debug"("NEXT ", "backslash:sym<w>")
  rx332_fail:
    (rx332_rep, rx332_pos, $I10, $P10) = rx332_cur."!mark_fail"(0)
    lt rx332_pos, -1, rx332_done
    eq rx332_pos, -1, rx332_fail
    jump $I10
  rx332_done:
    rx332_cur."!cursor_fail"()
    rx332_cur."!cursor_debug"("FAIL  ", "backslash:sym<w>")
    .return (rx332_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<w>"  :subid("96_1279564390.79897") :method
.annotate 'line', 3
    new $P334, "ResizablePMCArray"
    push $P334, "N"
    push $P334, "W"
    push $P334, "S"
    push $P334, "D"
    push $P334, "n"
    push $P334, "w"
    push $P334, "s"
    push $P334, "d"
    .return ($P334)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<b>"  :subid("97_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx338_tgt
    .local int rx338_pos
    .local int rx338_off
    .local int rx338_eos
    .local int rx338_rep
    .local pmc rx338_cur
    (rx338_cur, rx338_pos, rx338_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx338_cur
    .local pmc match
    .lex "$/", match
    length rx338_eos, rx338_tgt
    gt rx338_pos, rx338_eos, rx338_done
    set rx338_off, 0
    lt rx338_pos, 2, rx338_start
    sub rx338_off, rx338_pos, 1
    substr rx338_tgt, rx338_tgt, rx338_off
  rx338_start:
    eq $I10, 1, rx338_restart
    rx338_cur."!cursor_debug"("START ", "backslash:sym<b>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan341_done
    goto rxscan341_scan
  rxscan341_loop:
    ($P10) = rx338_cur."from"()
    inc $P10
    set rx338_pos, $P10
    ge rx338_pos, rx338_eos, rxscan341_done
  rxscan341_scan:
    set_addr $I10, rxscan341_loop
    rx338_cur."!mark_push"(0, rx338_pos, $I10)
  rxscan341_done:
.annotate 'line', 124
  # rx subcapture "sym"
    set_addr $I10, rxcap_342_fail
    rx338_cur."!mark_push"(0, rx338_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx338_pos, rx338_eos, rx338_fail
    sub $I10, rx338_pos, rx338_off
    substr $S10, rx338_tgt, $I10, 1
    index $I11, "bB", $S10
    lt $I11, 0, rx338_fail
    inc rx338_pos
    set_addr $I10, rxcap_342_fail
    ($I12, $I11) = rx338_cur."!mark_peek"($I10)
    rx338_cur."!cursor_pos"($I11)
    ($P10) = rx338_cur."!cursor_start"()
    $P10."!cursor_pass"(rx338_pos, "")
    rx338_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_342_done
  rxcap_342_fail:
    goto rx338_fail
  rxcap_342_done:
  # rx pass
    rx338_cur."!cursor_pass"(rx338_pos, "backslash:sym<b>")
    rx338_cur."!cursor_debug"("PASS  ", "backslash:sym<b>", " at pos=", rx338_pos)
    .return (rx338_cur)
  rx338_restart:
.annotate 'line', 3
    rx338_cur."!cursor_debug"("NEXT ", "backslash:sym<b>")
  rx338_fail:
    (rx338_rep, rx338_pos, $I10, $P10) = rx338_cur."!mark_fail"(0)
    lt rx338_pos, -1, rx338_done
    eq rx338_pos, -1, rx338_fail
    jump $I10
  rx338_done:
    rx338_cur."!cursor_fail"()
    rx338_cur."!cursor_debug"("FAIL  ", "backslash:sym<b>")
    .return (rx338_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<b>"  :subid("98_1279564390.79897") :method
.annotate 'line', 3
    new $P340, "ResizablePMCArray"
    push $P340, "B"
    push $P340, "b"
    .return ($P340)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<e>"  :subid("99_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx344_tgt
    .local int rx344_pos
    .local int rx344_off
    .local int rx344_eos
    .local int rx344_rep
    .local pmc rx344_cur
    (rx344_cur, rx344_pos, rx344_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx344_cur
    .local pmc match
    .lex "$/", match
    length rx344_eos, rx344_tgt
    gt rx344_pos, rx344_eos, rx344_done
    set rx344_off, 0
    lt rx344_pos, 2, rx344_start
    sub rx344_off, rx344_pos, 1
    substr rx344_tgt, rx344_tgt, rx344_off
  rx344_start:
    eq $I10, 1, rx344_restart
    rx344_cur."!cursor_debug"("START ", "backslash:sym<e>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan347_done
    goto rxscan347_scan
  rxscan347_loop:
    ($P10) = rx344_cur."from"()
    inc $P10
    set rx344_pos, $P10
    ge rx344_pos, rx344_eos, rxscan347_done
  rxscan347_scan:
    set_addr $I10, rxscan347_loop
    rx344_cur."!mark_push"(0, rx344_pos, $I10)
  rxscan347_done:
.annotate 'line', 125
  # rx subcapture "sym"
    set_addr $I10, rxcap_348_fail
    rx344_cur."!mark_push"(0, rx344_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx344_pos, rx344_eos, rx344_fail
    sub $I10, rx344_pos, rx344_off
    substr $S10, rx344_tgt, $I10, 1
    index $I11, "eE", $S10
    lt $I11, 0, rx344_fail
    inc rx344_pos
    set_addr $I10, rxcap_348_fail
    ($I12, $I11) = rx344_cur."!mark_peek"($I10)
    rx344_cur."!cursor_pos"($I11)
    ($P10) = rx344_cur."!cursor_start"()
    $P10."!cursor_pass"(rx344_pos, "")
    rx344_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_348_done
  rxcap_348_fail:
    goto rx344_fail
  rxcap_348_done:
  # rx pass
    rx344_cur."!cursor_pass"(rx344_pos, "backslash:sym<e>")
    rx344_cur."!cursor_debug"("PASS  ", "backslash:sym<e>", " at pos=", rx344_pos)
    .return (rx344_cur)
  rx344_restart:
.annotate 'line', 3
    rx344_cur."!cursor_debug"("NEXT ", "backslash:sym<e>")
  rx344_fail:
    (rx344_rep, rx344_pos, $I10, $P10) = rx344_cur."!mark_fail"(0)
    lt rx344_pos, -1, rx344_done
    eq rx344_pos, -1, rx344_fail
    jump $I10
  rx344_done:
    rx344_cur."!cursor_fail"()
    rx344_cur."!cursor_debug"("FAIL  ", "backslash:sym<e>")
    .return (rx344_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<e>"  :subid("100_1279564390.79897") :method
.annotate 'line', 3
    new $P346, "ResizablePMCArray"
    push $P346, "E"
    push $P346, "e"
    .return ($P346)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<f>"  :subid("101_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx350_tgt
    .local int rx350_pos
    .local int rx350_off
    .local int rx350_eos
    .local int rx350_rep
    .local pmc rx350_cur
    (rx350_cur, rx350_pos, rx350_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx350_cur
    .local pmc match
    .lex "$/", match
    length rx350_eos, rx350_tgt
    gt rx350_pos, rx350_eos, rx350_done
    set rx350_off, 0
    lt rx350_pos, 2, rx350_start
    sub rx350_off, rx350_pos, 1
    substr rx350_tgt, rx350_tgt, rx350_off
  rx350_start:
    eq $I10, 1, rx350_restart
    rx350_cur."!cursor_debug"("START ", "backslash:sym<f>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan353_done
    goto rxscan353_scan
  rxscan353_loop:
    ($P10) = rx350_cur."from"()
    inc $P10
    set rx350_pos, $P10
    ge rx350_pos, rx350_eos, rxscan353_done
  rxscan353_scan:
    set_addr $I10, rxscan353_loop
    rx350_cur."!mark_push"(0, rx350_pos, $I10)
  rxscan353_done:
.annotate 'line', 126
  # rx subcapture "sym"
    set_addr $I10, rxcap_354_fail
    rx350_cur."!mark_push"(0, rx350_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx350_pos, rx350_eos, rx350_fail
    sub $I10, rx350_pos, rx350_off
    substr $S10, rx350_tgt, $I10, 1
    index $I11, "fF", $S10
    lt $I11, 0, rx350_fail
    inc rx350_pos
    set_addr $I10, rxcap_354_fail
    ($I12, $I11) = rx350_cur."!mark_peek"($I10)
    rx350_cur."!cursor_pos"($I11)
    ($P10) = rx350_cur."!cursor_start"()
    $P10."!cursor_pass"(rx350_pos, "")
    rx350_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_354_done
  rxcap_354_fail:
    goto rx350_fail
  rxcap_354_done:
  # rx pass
    rx350_cur."!cursor_pass"(rx350_pos, "backslash:sym<f>")
    rx350_cur."!cursor_debug"("PASS  ", "backslash:sym<f>", " at pos=", rx350_pos)
    .return (rx350_cur)
  rx350_restart:
.annotate 'line', 3
    rx350_cur."!cursor_debug"("NEXT ", "backslash:sym<f>")
  rx350_fail:
    (rx350_rep, rx350_pos, $I10, $P10) = rx350_cur."!mark_fail"(0)
    lt rx350_pos, -1, rx350_done
    eq rx350_pos, -1, rx350_fail
    jump $I10
  rx350_done:
    rx350_cur."!cursor_fail"()
    rx350_cur."!cursor_debug"("FAIL  ", "backslash:sym<f>")
    .return (rx350_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<f>"  :subid("102_1279564390.79897") :method
.annotate 'line', 3
    new $P352, "ResizablePMCArray"
    push $P352, "F"
    push $P352, "f"
    .return ($P352)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<h>"  :subid("103_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx356_tgt
    .local int rx356_pos
    .local int rx356_off
    .local int rx356_eos
    .local int rx356_rep
    .local pmc rx356_cur
    (rx356_cur, rx356_pos, rx356_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx356_cur
    .local pmc match
    .lex "$/", match
    length rx356_eos, rx356_tgt
    gt rx356_pos, rx356_eos, rx356_done
    set rx356_off, 0
    lt rx356_pos, 2, rx356_start
    sub rx356_off, rx356_pos, 1
    substr rx356_tgt, rx356_tgt, rx356_off
  rx356_start:
    eq $I10, 1, rx356_restart
    rx356_cur."!cursor_debug"("START ", "backslash:sym<h>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan359_done
    goto rxscan359_scan
  rxscan359_loop:
    ($P10) = rx356_cur."from"()
    inc $P10
    set rx356_pos, $P10
    ge rx356_pos, rx356_eos, rxscan359_done
  rxscan359_scan:
    set_addr $I10, rxscan359_loop
    rx356_cur."!mark_push"(0, rx356_pos, $I10)
  rxscan359_done:
.annotate 'line', 127
  # rx subcapture "sym"
    set_addr $I10, rxcap_360_fail
    rx356_cur."!mark_push"(0, rx356_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx356_pos, rx356_eos, rx356_fail
    sub $I10, rx356_pos, rx356_off
    substr $S10, rx356_tgt, $I10, 1
    index $I11, "hH", $S10
    lt $I11, 0, rx356_fail
    inc rx356_pos
    set_addr $I10, rxcap_360_fail
    ($I12, $I11) = rx356_cur."!mark_peek"($I10)
    rx356_cur."!cursor_pos"($I11)
    ($P10) = rx356_cur."!cursor_start"()
    $P10."!cursor_pass"(rx356_pos, "")
    rx356_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_360_done
  rxcap_360_fail:
    goto rx356_fail
  rxcap_360_done:
  # rx pass
    rx356_cur."!cursor_pass"(rx356_pos, "backslash:sym<h>")
    rx356_cur."!cursor_debug"("PASS  ", "backslash:sym<h>", " at pos=", rx356_pos)
    .return (rx356_cur)
  rx356_restart:
.annotate 'line', 3
    rx356_cur."!cursor_debug"("NEXT ", "backslash:sym<h>")
  rx356_fail:
    (rx356_rep, rx356_pos, $I10, $P10) = rx356_cur."!mark_fail"(0)
    lt rx356_pos, -1, rx356_done
    eq rx356_pos, -1, rx356_fail
    jump $I10
  rx356_done:
    rx356_cur."!cursor_fail"()
    rx356_cur."!cursor_debug"("FAIL  ", "backslash:sym<h>")
    .return (rx356_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<h>"  :subid("104_1279564390.79897") :method
.annotate 'line', 3
    new $P358, "ResizablePMCArray"
    push $P358, "H"
    push $P358, "h"
    .return ($P358)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<r>"  :subid("105_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx362_tgt
    .local int rx362_pos
    .local int rx362_off
    .local int rx362_eos
    .local int rx362_rep
    .local pmc rx362_cur
    (rx362_cur, rx362_pos, rx362_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx362_cur
    .local pmc match
    .lex "$/", match
    length rx362_eos, rx362_tgt
    gt rx362_pos, rx362_eos, rx362_done
    set rx362_off, 0
    lt rx362_pos, 2, rx362_start
    sub rx362_off, rx362_pos, 1
    substr rx362_tgt, rx362_tgt, rx362_off
  rx362_start:
    eq $I10, 1, rx362_restart
    rx362_cur."!cursor_debug"("START ", "backslash:sym<r>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan365_done
    goto rxscan365_scan
  rxscan365_loop:
    ($P10) = rx362_cur."from"()
    inc $P10
    set rx362_pos, $P10
    ge rx362_pos, rx362_eos, rxscan365_done
  rxscan365_scan:
    set_addr $I10, rxscan365_loop
    rx362_cur."!mark_push"(0, rx362_pos, $I10)
  rxscan365_done:
.annotate 'line', 128
  # rx subcapture "sym"
    set_addr $I10, rxcap_366_fail
    rx362_cur."!mark_push"(0, rx362_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx362_pos, rx362_eos, rx362_fail
    sub $I10, rx362_pos, rx362_off
    substr $S10, rx362_tgt, $I10, 1
    index $I11, "rR", $S10
    lt $I11, 0, rx362_fail
    inc rx362_pos
    set_addr $I10, rxcap_366_fail
    ($I12, $I11) = rx362_cur."!mark_peek"($I10)
    rx362_cur."!cursor_pos"($I11)
    ($P10) = rx362_cur."!cursor_start"()
    $P10."!cursor_pass"(rx362_pos, "")
    rx362_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_366_done
  rxcap_366_fail:
    goto rx362_fail
  rxcap_366_done:
  # rx pass
    rx362_cur."!cursor_pass"(rx362_pos, "backslash:sym<r>")
    rx362_cur."!cursor_debug"("PASS  ", "backslash:sym<r>", " at pos=", rx362_pos)
    .return (rx362_cur)
  rx362_restart:
.annotate 'line', 3
    rx362_cur."!cursor_debug"("NEXT ", "backslash:sym<r>")
  rx362_fail:
    (rx362_rep, rx362_pos, $I10, $P10) = rx362_cur."!mark_fail"(0)
    lt rx362_pos, -1, rx362_done
    eq rx362_pos, -1, rx362_fail
    jump $I10
  rx362_done:
    rx362_cur."!cursor_fail"()
    rx362_cur."!cursor_debug"("FAIL  ", "backslash:sym<r>")
    .return (rx362_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<r>"  :subid("106_1279564390.79897") :method
.annotate 'line', 3
    new $P364, "ResizablePMCArray"
    push $P364, "R"
    push $P364, "r"
    .return ($P364)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<t>"  :subid("107_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx368_tgt
    .local int rx368_pos
    .local int rx368_off
    .local int rx368_eos
    .local int rx368_rep
    .local pmc rx368_cur
    (rx368_cur, rx368_pos, rx368_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx368_cur
    .local pmc match
    .lex "$/", match
    length rx368_eos, rx368_tgt
    gt rx368_pos, rx368_eos, rx368_done
    set rx368_off, 0
    lt rx368_pos, 2, rx368_start
    sub rx368_off, rx368_pos, 1
    substr rx368_tgt, rx368_tgt, rx368_off
  rx368_start:
    eq $I10, 1, rx368_restart
    rx368_cur."!cursor_debug"("START ", "backslash:sym<t>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan371_done
    goto rxscan371_scan
  rxscan371_loop:
    ($P10) = rx368_cur."from"()
    inc $P10
    set rx368_pos, $P10
    ge rx368_pos, rx368_eos, rxscan371_done
  rxscan371_scan:
    set_addr $I10, rxscan371_loop
    rx368_cur."!mark_push"(0, rx368_pos, $I10)
  rxscan371_done:
.annotate 'line', 129
  # rx subcapture "sym"
    set_addr $I10, rxcap_372_fail
    rx368_cur."!mark_push"(0, rx368_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx368_pos, rx368_eos, rx368_fail
    sub $I10, rx368_pos, rx368_off
    substr $S10, rx368_tgt, $I10, 1
    index $I11, "tT", $S10
    lt $I11, 0, rx368_fail
    inc rx368_pos
    set_addr $I10, rxcap_372_fail
    ($I12, $I11) = rx368_cur."!mark_peek"($I10)
    rx368_cur."!cursor_pos"($I11)
    ($P10) = rx368_cur."!cursor_start"()
    $P10."!cursor_pass"(rx368_pos, "")
    rx368_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_372_done
  rxcap_372_fail:
    goto rx368_fail
  rxcap_372_done:
  # rx pass
    rx368_cur."!cursor_pass"(rx368_pos, "backslash:sym<t>")
    rx368_cur."!cursor_debug"("PASS  ", "backslash:sym<t>", " at pos=", rx368_pos)
    .return (rx368_cur)
  rx368_restart:
.annotate 'line', 3
    rx368_cur."!cursor_debug"("NEXT ", "backslash:sym<t>")
  rx368_fail:
    (rx368_rep, rx368_pos, $I10, $P10) = rx368_cur."!mark_fail"(0)
    lt rx368_pos, -1, rx368_done
    eq rx368_pos, -1, rx368_fail
    jump $I10
  rx368_done:
    rx368_cur."!cursor_fail"()
    rx368_cur."!cursor_debug"("FAIL  ", "backslash:sym<t>")
    .return (rx368_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<t>"  :subid("108_1279564390.79897") :method
.annotate 'line', 3
    new $P370, "ResizablePMCArray"
    push $P370, "T"
    push $P370, "t"
    .return ($P370)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<v>"  :subid("109_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx374_tgt
    .local int rx374_pos
    .local int rx374_off
    .local int rx374_eos
    .local int rx374_rep
    .local pmc rx374_cur
    (rx374_cur, rx374_pos, rx374_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx374_cur
    .local pmc match
    .lex "$/", match
    length rx374_eos, rx374_tgt
    gt rx374_pos, rx374_eos, rx374_done
    set rx374_off, 0
    lt rx374_pos, 2, rx374_start
    sub rx374_off, rx374_pos, 1
    substr rx374_tgt, rx374_tgt, rx374_off
  rx374_start:
    eq $I10, 1, rx374_restart
    rx374_cur."!cursor_debug"("START ", "backslash:sym<v>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan377_done
    goto rxscan377_scan
  rxscan377_loop:
    ($P10) = rx374_cur."from"()
    inc $P10
    set rx374_pos, $P10
    ge rx374_pos, rx374_eos, rxscan377_done
  rxscan377_scan:
    set_addr $I10, rxscan377_loop
    rx374_cur."!mark_push"(0, rx374_pos, $I10)
  rxscan377_done:
.annotate 'line', 130
  # rx subcapture "sym"
    set_addr $I10, rxcap_378_fail
    rx374_cur."!mark_push"(0, rx374_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx374_pos, rx374_eos, rx374_fail
    sub $I10, rx374_pos, rx374_off
    substr $S10, rx374_tgt, $I10, 1
    index $I11, "vV", $S10
    lt $I11, 0, rx374_fail
    inc rx374_pos
    set_addr $I10, rxcap_378_fail
    ($I12, $I11) = rx374_cur."!mark_peek"($I10)
    rx374_cur."!cursor_pos"($I11)
    ($P10) = rx374_cur."!cursor_start"()
    $P10."!cursor_pass"(rx374_pos, "")
    rx374_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_378_done
  rxcap_378_fail:
    goto rx374_fail
  rxcap_378_done:
  # rx pass
    rx374_cur."!cursor_pass"(rx374_pos, "backslash:sym<v>")
    rx374_cur."!cursor_debug"("PASS  ", "backslash:sym<v>", " at pos=", rx374_pos)
    .return (rx374_cur)
  rx374_restart:
.annotate 'line', 3
    rx374_cur."!cursor_debug"("NEXT ", "backslash:sym<v>")
  rx374_fail:
    (rx374_rep, rx374_pos, $I10, $P10) = rx374_cur."!mark_fail"(0)
    lt rx374_pos, -1, rx374_done
    eq rx374_pos, -1, rx374_fail
    jump $I10
  rx374_done:
    rx374_cur."!cursor_fail"()
    rx374_cur."!cursor_debug"("FAIL  ", "backslash:sym<v>")
    .return (rx374_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<v>"  :subid("110_1279564390.79897") :method
.annotate 'line', 3
    new $P376, "ResizablePMCArray"
    push $P376, "V"
    push $P376, "v"
    .return ($P376)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<o>"  :subid("111_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx380_tgt
    .local int rx380_pos
    .local int rx380_off
    .local int rx380_eos
    .local int rx380_rep
    .local pmc rx380_cur
    (rx380_cur, rx380_pos, rx380_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx380_cur
    .local pmc match
    .lex "$/", match
    length rx380_eos, rx380_tgt
    gt rx380_pos, rx380_eos, rx380_done
    set rx380_off, 0
    lt rx380_pos, 2, rx380_start
    sub rx380_off, rx380_pos, 1
    substr rx380_tgt, rx380_tgt, rx380_off
  rx380_start:
    eq $I10, 1, rx380_restart
    rx380_cur."!cursor_debug"("START ", "backslash:sym<o>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan387_done
    goto rxscan387_scan
  rxscan387_loop:
    ($P10) = rx380_cur."from"()
    inc $P10
    set rx380_pos, $P10
    ge rx380_pos, rx380_eos, rxscan387_done
  rxscan387_scan:
    set_addr $I10, rxscan387_loop
    rx380_cur."!mark_push"(0, rx380_pos, $I10)
  rxscan387_done:
.annotate 'line', 131
  # rx subcapture "sym"
    set_addr $I10, rxcap_388_fail
    rx380_cur."!mark_push"(0, rx380_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx380_pos, rx380_eos, rx380_fail
    sub $I10, rx380_pos, rx380_off
    substr $S10, rx380_tgt, $I10, 1
    index $I11, "oO", $S10
    lt $I11, 0, rx380_fail
    inc rx380_pos
    set_addr $I10, rxcap_388_fail
    ($I12, $I11) = rx380_cur."!mark_peek"($I10)
    rx380_cur."!cursor_pos"($I11)
    ($P10) = rx380_cur."!cursor_start"()
    $P10."!cursor_pass"(rx380_pos, "")
    rx380_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_388_done
  rxcap_388_fail:
    goto rx380_fail
  rxcap_388_done:
  alt389_0:
    set_addr $I10, alt389_1
    rx380_cur."!mark_push"(0, rx380_pos, $I10)
  # rx subrule "octint" subtype=capture negate=
    rx380_cur."!cursor_pos"(rx380_pos)
    $P10 = rx380_cur."octint"()
    unless $P10, rx380_fail
    rx380_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octint")
    rx380_pos = $P10."pos"()
    goto alt389_end
  alt389_1:
  # rx literal  "["
    add $I11, rx380_pos, 1
    gt $I11, rx380_eos, rx380_fail
    sub $I11, rx380_pos, rx380_off
    substr $S10, rx380_tgt, $I11, 1
    ne $S10, "[", rx380_fail
    add rx380_pos, 1
  # rx subrule "octints" subtype=capture negate=
    rx380_cur."!cursor_pos"(rx380_pos)
    $P10 = rx380_cur."octints"()
    unless $P10, rx380_fail
    rx380_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octints")
    rx380_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx380_pos, 1
    gt $I11, rx380_eos, rx380_fail
    sub $I11, rx380_pos, rx380_off
    substr $S10, rx380_tgt, $I11, 1
    ne $S10, "]", rx380_fail
    add rx380_pos, 1
  alt389_end:
  # rx pass
    rx380_cur."!cursor_pass"(rx380_pos, "backslash:sym<o>")
    rx380_cur."!cursor_debug"("PASS  ", "backslash:sym<o>", " at pos=", rx380_pos)
    .return (rx380_cur)
  rx380_restart:
.annotate 'line', 3
    rx380_cur."!cursor_debug"("NEXT ", "backslash:sym<o>")
  rx380_fail:
    (rx380_rep, rx380_pos, $I10, $P10) = rx380_cur."!mark_fail"(0)
    lt rx380_pos, -1, rx380_done
    eq rx380_pos, -1, rx380_fail
    jump $I10
  rx380_done:
    rx380_cur."!cursor_fail"()
    rx380_cur."!cursor_debug"("FAIL  ", "backslash:sym<o>")
    .return (rx380_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<o>"  :subid("112_1279564390.79897") :method
.annotate 'line', 3
    $P382 = self."!PREFIX__!subrule"("octints", "O[")
    $P383 = self."!PREFIX__!subrule"("octint", "O")
    $P384 = self."!PREFIX__!subrule"("octints", "o[")
    $P385 = self."!PREFIX__!subrule"("octint", "o")
    new $P386, "ResizablePMCArray"
    push $P386, $P382
    push $P386, $P383
    push $P386, $P384
    push $P386, $P385
    .return ($P386)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<x>"  :subid("113_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx391_tgt
    .local int rx391_pos
    .local int rx391_off
    .local int rx391_eos
    .local int rx391_rep
    .local pmc rx391_cur
    (rx391_cur, rx391_pos, rx391_tgt, $I10) = self."!cursor_start"()
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
    eq $I10, 1, rx391_restart
    rx391_cur."!cursor_debug"("START ", "backslash:sym<x>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan398_done
    goto rxscan398_scan
  rxscan398_loop:
    ($P10) = rx391_cur."from"()
    inc $P10
    set rx391_pos, $P10
    ge rx391_pos, rx391_eos, rxscan398_done
  rxscan398_scan:
    set_addr $I10, rxscan398_loop
    rx391_cur."!mark_push"(0, rx391_pos, $I10)
  rxscan398_done:
.annotate 'line', 132
  # rx subcapture "sym"
    set_addr $I10, rxcap_399_fail
    rx391_cur."!mark_push"(0, rx391_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx391_pos, rx391_eos, rx391_fail
    sub $I10, rx391_pos, rx391_off
    substr $S10, rx391_tgt, $I10, 1
    index $I11, "xX", $S10
    lt $I11, 0, rx391_fail
    inc rx391_pos
    set_addr $I10, rxcap_399_fail
    ($I12, $I11) = rx391_cur."!mark_peek"($I10)
    rx391_cur."!cursor_pos"($I11)
    ($P10) = rx391_cur."!cursor_start"()
    $P10."!cursor_pass"(rx391_pos, "")
    rx391_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_399_done
  rxcap_399_fail:
    goto rx391_fail
  rxcap_399_done:
  alt400_0:
    set_addr $I10, alt400_1
    rx391_cur."!mark_push"(0, rx391_pos, $I10)
  # rx subrule "hexint" subtype=capture negate=
    rx391_cur."!cursor_pos"(rx391_pos)
    $P10 = rx391_cur."hexint"()
    unless $P10, rx391_fail
    rx391_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexint")
    rx391_pos = $P10."pos"()
    goto alt400_end
  alt400_1:
  # rx literal  "["
    add $I11, rx391_pos, 1
    gt $I11, rx391_eos, rx391_fail
    sub $I11, rx391_pos, rx391_off
    substr $S10, rx391_tgt, $I11, 1
    ne $S10, "[", rx391_fail
    add rx391_pos, 1
  # rx subrule "hexints" subtype=capture negate=
    rx391_cur."!cursor_pos"(rx391_pos)
    $P10 = rx391_cur."hexints"()
    unless $P10, rx391_fail
    rx391_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexints")
    rx391_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx391_pos, 1
    gt $I11, rx391_eos, rx391_fail
    sub $I11, rx391_pos, rx391_off
    substr $S10, rx391_tgt, $I11, 1
    ne $S10, "]", rx391_fail
    add rx391_pos, 1
  alt400_end:
  # rx pass
    rx391_cur."!cursor_pass"(rx391_pos, "backslash:sym<x>")
    rx391_cur."!cursor_debug"("PASS  ", "backslash:sym<x>", " at pos=", rx391_pos)
    .return (rx391_cur)
  rx391_restart:
.annotate 'line', 3
    rx391_cur."!cursor_debug"("NEXT ", "backslash:sym<x>")
  rx391_fail:
    (rx391_rep, rx391_pos, $I10, $P10) = rx391_cur."!mark_fail"(0)
    lt rx391_pos, -1, rx391_done
    eq rx391_pos, -1, rx391_fail
    jump $I10
  rx391_done:
    rx391_cur."!cursor_fail"()
    rx391_cur."!cursor_debug"("FAIL  ", "backslash:sym<x>")
    .return (rx391_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<x>"  :subid("114_1279564390.79897") :method
.annotate 'line', 3
    $P393 = self."!PREFIX__!subrule"("hexints", "X[")
    $P394 = self."!PREFIX__!subrule"("hexint", "X")
    $P395 = self."!PREFIX__!subrule"("hexints", "x[")
    $P396 = self."!PREFIX__!subrule"("hexint", "x")
    new $P397, "ResizablePMCArray"
    push $P397, $P393
    push $P397, $P394
    push $P397, $P395
    push $P397, $P396
    .return ($P397)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<c>"  :subid("115_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx402_tgt
    .local int rx402_pos
    .local int rx402_off
    .local int rx402_eos
    .local int rx402_rep
    .local pmc rx402_cur
    (rx402_cur, rx402_pos, rx402_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx402_cur
    .local pmc match
    .lex "$/", match
    length rx402_eos, rx402_tgt
    gt rx402_pos, rx402_eos, rx402_done
    set rx402_off, 0
    lt rx402_pos, 2, rx402_start
    sub rx402_off, rx402_pos, 1
    substr rx402_tgt, rx402_tgt, rx402_off
  rx402_start:
    eq $I10, 1, rx402_restart
    rx402_cur."!cursor_debug"("START ", "backslash:sym<c>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan407_done
    goto rxscan407_scan
  rxscan407_loop:
    ($P10) = rx402_cur."from"()
    inc $P10
    set rx402_pos, $P10
    ge rx402_pos, rx402_eos, rxscan407_done
  rxscan407_scan:
    set_addr $I10, rxscan407_loop
    rx402_cur."!mark_push"(0, rx402_pos, $I10)
  rxscan407_done:
.annotate 'line', 133
  # rx subcapture "sym"
    set_addr $I10, rxcap_408_fail
    rx402_cur."!mark_push"(0, rx402_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx402_pos, rx402_eos, rx402_fail
    sub $I10, rx402_pos, rx402_off
    substr $S10, rx402_tgt, $I10, 1
    index $I11, "cC", $S10
    lt $I11, 0, rx402_fail
    inc rx402_pos
    set_addr $I10, rxcap_408_fail
    ($I12, $I11) = rx402_cur."!mark_peek"($I10)
    rx402_cur."!cursor_pos"($I11)
    ($P10) = rx402_cur."!cursor_start"()
    $P10."!cursor_pass"(rx402_pos, "")
    rx402_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_408_done
  rxcap_408_fail:
    goto rx402_fail
  rxcap_408_done:
  # rx subrule "charspec" subtype=capture negate=
    rx402_cur."!cursor_pos"(rx402_pos)
    $P10 = rx402_cur."charspec"()
    unless $P10, rx402_fail
    rx402_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charspec")
    rx402_pos = $P10."pos"()
  # rx pass
    rx402_cur."!cursor_pass"(rx402_pos, "backslash:sym<c>")
    rx402_cur."!cursor_debug"("PASS  ", "backslash:sym<c>", " at pos=", rx402_pos)
    .return (rx402_cur)
  rx402_restart:
.annotate 'line', 3
    rx402_cur."!cursor_debug"("NEXT ", "backslash:sym<c>")
  rx402_fail:
    (rx402_rep, rx402_pos, $I10, $P10) = rx402_cur."!mark_fail"(0)
    lt rx402_pos, -1, rx402_done
    eq rx402_pos, -1, rx402_fail
    jump $I10
  rx402_done:
    rx402_cur."!cursor_fail"()
    rx402_cur."!cursor_debug"("FAIL  ", "backslash:sym<c>")
    .return (rx402_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<c>"  :subid("116_1279564390.79897") :method
.annotate 'line', 3
    $P404 = self."!PREFIX__!subrule"("charspec", "C")
    $P405 = self."!PREFIX__!subrule"("charspec", "c")
    new $P406, "ResizablePMCArray"
    push $P406, $P404
    push $P406, $P405
    .return ($P406)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<A>"  :subid("117_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx410_tgt
    .local int rx410_pos
    .local int rx410_off
    .local int rx410_eos
    .local int rx410_rep
    .local pmc rx410_cur
    (rx410_cur, rx410_pos, rx410_tgt, $I10) = self."!cursor_start"()
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
    eq $I10, 1, rx410_restart
    rx410_cur."!cursor_debug"("START ", "backslash:sym<A>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan414_done
    goto rxscan414_scan
  rxscan414_loop:
    ($P10) = rx410_cur."from"()
    inc $P10
    set rx410_pos, $P10
    ge rx410_pos, rx410_eos, rxscan414_done
  rxscan414_scan:
    set_addr $I10, rxscan414_loop
    rx410_cur."!mark_push"(0, rx410_pos, $I10)
  rxscan414_done:
.annotate 'line', 134
  # rx literal  "A"
    add $I11, rx410_pos, 1
    gt $I11, rx410_eos, rx410_fail
    sub $I11, rx410_pos, rx410_off
    substr $S10, rx410_tgt, $I11, 1
    ne $S10, "A", rx410_fail
    add rx410_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx410_cur."!cursor_pos"(rx410_pos)
    $P10 = rx410_cur."obs"("\\A as beginning-of-string matcher", "^")
    unless $P10, rx410_fail
    rx410_pos = $P10."pos"()
  # rx pass
    rx410_cur."!cursor_pass"(rx410_pos, "backslash:sym<A>")
    rx410_cur."!cursor_debug"("PASS  ", "backslash:sym<A>", " at pos=", rx410_pos)
    .return (rx410_cur)
  rx410_restart:
.annotate 'line', 3
    rx410_cur."!cursor_debug"("NEXT ", "backslash:sym<A>")
  rx410_fail:
    (rx410_rep, rx410_pos, $I10, $P10) = rx410_cur."!mark_fail"(0)
    lt rx410_pos, -1, rx410_done
    eq rx410_pos, -1, rx410_fail
    jump $I10
  rx410_done:
    rx410_cur."!cursor_fail"()
    rx410_cur."!cursor_debug"("FAIL  ", "backslash:sym<A>")
    .return (rx410_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<A>"  :subid("118_1279564390.79897") :method
.annotate 'line', 3
    $P412 = self."!PREFIX__!subrule"("obs", "A")
    new $P413, "ResizablePMCArray"
    push $P413, $P412
    .return ($P413)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<z>"  :subid("119_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx416_tgt
    .local int rx416_pos
    .local int rx416_off
    .local int rx416_eos
    .local int rx416_rep
    .local pmc rx416_cur
    (rx416_cur, rx416_pos, rx416_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx416_cur
    .local pmc match
    .lex "$/", match
    length rx416_eos, rx416_tgt
    gt rx416_pos, rx416_eos, rx416_done
    set rx416_off, 0
    lt rx416_pos, 2, rx416_start
    sub rx416_off, rx416_pos, 1
    substr rx416_tgt, rx416_tgt, rx416_off
  rx416_start:
    eq $I10, 1, rx416_restart
    rx416_cur."!cursor_debug"("START ", "backslash:sym<z>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan420_done
    goto rxscan420_scan
  rxscan420_loop:
    ($P10) = rx416_cur."from"()
    inc $P10
    set rx416_pos, $P10
    ge rx416_pos, rx416_eos, rxscan420_done
  rxscan420_scan:
    set_addr $I10, rxscan420_loop
    rx416_cur."!mark_push"(0, rx416_pos, $I10)
  rxscan420_done:
.annotate 'line', 135
  # rx literal  "z"
    add $I11, rx416_pos, 1
    gt $I11, rx416_eos, rx416_fail
    sub $I11, rx416_pos, rx416_off
    substr $S10, rx416_tgt, $I11, 1
    ne $S10, "z", rx416_fail
    add rx416_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx416_cur."!cursor_pos"(rx416_pos)
    $P10 = rx416_cur."obs"("\\z as end-of-string matcher", "$")
    unless $P10, rx416_fail
    rx416_pos = $P10."pos"()
  # rx pass
    rx416_cur."!cursor_pass"(rx416_pos, "backslash:sym<z>")
    rx416_cur."!cursor_debug"("PASS  ", "backslash:sym<z>", " at pos=", rx416_pos)
    .return (rx416_cur)
  rx416_restart:
.annotate 'line', 3
    rx416_cur."!cursor_debug"("NEXT ", "backslash:sym<z>")
  rx416_fail:
    (rx416_rep, rx416_pos, $I10, $P10) = rx416_cur."!mark_fail"(0)
    lt rx416_pos, -1, rx416_done
    eq rx416_pos, -1, rx416_fail
    jump $I10
  rx416_done:
    rx416_cur."!cursor_fail"()
    rx416_cur."!cursor_debug"("FAIL  ", "backslash:sym<z>")
    .return (rx416_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<z>"  :subid("120_1279564390.79897") :method
.annotate 'line', 3
    $P418 = self."!PREFIX__!subrule"("obs", "z")
    new $P419, "ResizablePMCArray"
    push $P419, $P418
    .return ($P419)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Z>"  :subid("121_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx422_tgt
    .local int rx422_pos
    .local int rx422_off
    .local int rx422_eos
    .local int rx422_rep
    .local pmc rx422_cur
    (rx422_cur, rx422_pos, rx422_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx422_cur
    .local pmc match
    .lex "$/", match
    length rx422_eos, rx422_tgt
    gt rx422_pos, rx422_eos, rx422_done
    set rx422_off, 0
    lt rx422_pos, 2, rx422_start
    sub rx422_off, rx422_pos, 1
    substr rx422_tgt, rx422_tgt, rx422_off
  rx422_start:
    eq $I10, 1, rx422_restart
    rx422_cur."!cursor_debug"("START ", "backslash:sym<Z>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan426_done
    goto rxscan426_scan
  rxscan426_loop:
    ($P10) = rx422_cur."from"()
    inc $P10
    set rx422_pos, $P10
    ge rx422_pos, rx422_eos, rxscan426_done
  rxscan426_scan:
    set_addr $I10, rxscan426_loop
    rx422_cur."!mark_push"(0, rx422_pos, $I10)
  rxscan426_done:
.annotate 'line', 136
  # rx literal  "Z"
    add $I11, rx422_pos, 1
    gt $I11, rx422_eos, rx422_fail
    sub $I11, rx422_pos, rx422_off
    substr $S10, rx422_tgt, $I11, 1
    ne $S10, "Z", rx422_fail
    add rx422_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx422_cur."!cursor_pos"(rx422_pos)
    $P10 = rx422_cur."obs"("\\Z as end-of-string matcher", "\\n?$")
    unless $P10, rx422_fail
    rx422_pos = $P10."pos"()
  # rx pass
    rx422_cur."!cursor_pass"(rx422_pos, "backslash:sym<Z>")
    rx422_cur."!cursor_debug"("PASS  ", "backslash:sym<Z>", " at pos=", rx422_pos)
    .return (rx422_cur)
  rx422_restart:
.annotate 'line', 3
    rx422_cur."!cursor_debug"("NEXT ", "backslash:sym<Z>")
  rx422_fail:
    (rx422_rep, rx422_pos, $I10, $P10) = rx422_cur."!mark_fail"(0)
    lt rx422_pos, -1, rx422_done
    eq rx422_pos, -1, rx422_fail
    jump $I10
  rx422_done:
    rx422_cur."!cursor_fail"()
    rx422_cur."!cursor_debug"("FAIL  ", "backslash:sym<Z>")
    .return (rx422_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<Z>"  :subid("122_1279564390.79897") :method
.annotate 'line', 3
    $P424 = self."!PREFIX__!subrule"("obs", "Z")
    new $P425, "ResizablePMCArray"
    push $P425, $P424
    .return ($P425)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Q>"  :subid("123_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx428_tgt
    .local int rx428_pos
    .local int rx428_off
    .local int rx428_eos
    .local int rx428_rep
    .local pmc rx428_cur
    (rx428_cur, rx428_pos, rx428_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx428_cur
    .local pmc match
    .lex "$/", match
    length rx428_eos, rx428_tgt
    gt rx428_pos, rx428_eos, rx428_done
    set rx428_off, 0
    lt rx428_pos, 2, rx428_start
    sub rx428_off, rx428_pos, 1
    substr rx428_tgt, rx428_tgt, rx428_off
  rx428_start:
    eq $I10, 1, rx428_restart
    rx428_cur."!cursor_debug"("START ", "backslash:sym<Q>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan432_done
    goto rxscan432_scan
  rxscan432_loop:
    ($P10) = rx428_cur."from"()
    inc $P10
    set rx428_pos, $P10
    ge rx428_pos, rx428_eos, rxscan432_done
  rxscan432_scan:
    set_addr $I10, rxscan432_loop
    rx428_cur."!mark_push"(0, rx428_pos, $I10)
  rxscan432_done:
.annotate 'line', 137
  # rx literal  "Q"
    add $I11, rx428_pos, 1
    gt $I11, rx428_eos, rx428_fail
    sub $I11, rx428_pos, rx428_off
    substr $S10, rx428_tgt, $I11, 1
    ne $S10, "Q", rx428_fail
    add rx428_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx428_cur."!cursor_pos"(rx428_pos)
    $P10 = rx428_cur."obs"("\\Q as quotemeta", "quotes or literal variable match")
    unless $P10, rx428_fail
    rx428_pos = $P10."pos"()
  # rx pass
    rx428_cur."!cursor_pass"(rx428_pos, "backslash:sym<Q>")
    rx428_cur."!cursor_debug"("PASS  ", "backslash:sym<Q>", " at pos=", rx428_pos)
    .return (rx428_cur)
  rx428_restart:
.annotate 'line', 3
    rx428_cur."!cursor_debug"("NEXT ", "backslash:sym<Q>")
  rx428_fail:
    (rx428_rep, rx428_pos, $I10, $P10) = rx428_cur."!mark_fail"(0)
    lt rx428_pos, -1, rx428_done
    eq rx428_pos, -1, rx428_fail
    jump $I10
  rx428_done:
    rx428_cur."!cursor_fail"()
    rx428_cur."!cursor_debug"("FAIL  ", "backslash:sym<Q>")
    .return (rx428_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<Q>"  :subid("124_1279564390.79897") :method
.annotate 'line', 3
    $P430 = self."!PREFIX__!subrule"("obs", "Q")
    new $P431, "ResizablePMCArray"
    push $P431, $P430
    .return ($P431)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<misc>"  :subid("125_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx434_tgt
    .local int rx434_pos
    .local int rx434_off
    .local int rx434_eos
    .local int rx434_rep
    .local pmc rx434_cur
    (rx434_cur, rx434_pos, rx434_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx434_cur
    .local pmc match
    .lex "$/", match
    length rx434_eos, rx434_tgt
    gt rx434_pos, rx434_eos, rx434_done
    set rx434_off, 0
    lt rx434_pos, 2, rx434_start
    sub rx434_off, rx434_pos, 1
    substr rx434_tgt, rx434_tgt, rx434_off
  rx434_start:
    eq $I10, 1, rx434_restart
    rx434_cur."!cursor_debug"("START ", "backslash:sym<misc>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan437_done
    goto rxscan437_scan
  rxscan437_loop:
    ($P10) = rx434_cur."from"()
    inc $P10
    set rx434_pos, $P10
    ge rx434_pos, rx434_eos, rxscan437_done
  rxscan437_scan:
    set_addr $I10, rxscan437_loop
    rx434_cur."!mark_push"(0, rx434_pos, $I10)
  rxscan437_done:
.annotate 'line', 138
  # rx charclass W
    ge rx434_pos, rx434_eos, rx434_fail
    sub $I10, rx434_pos, rx434_off
    is_cclass $I11, 8192, rx434_tgt, $I10
    if $I11, rx434_fail
    inc rx434_pos
  # rx pass
    rx434_cur."!cursor_pass"(rx434_pos, "backslash:sym<misc>")
    rx434_cur."!cursor_debug"("PASS  ", "backslash:sym<misc>", " at pos=", rx434_pos)
    .return (rx434_cur)
  rx434_restart:
.annotate 'line', 3
    rx434_cur."!cursor_debug"("NEXT ", "backslash:sym<misc>")
  rx434_fail:
    (rx434_rep, rx434_pos, $I10, $P10) = rx434_cur."!mark_fail"(0)
    lt rx434_pos, -1, rx434_done
    eq rx434_pos, -1, rx434_fail
    jump $I10
  rx434_done:
    rx434_cur."!cursor_fail"()
    rx434_cur."!cursor_debug"("FAIL  ", "backslash:sym<misc>")
    .return (rx434_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<misc>"  :subid("126_1279564390.79897") :method
.annotate 'line', 3
    new $P436, "ResizablePMCArray"
    push $P436, ""
    .return ($P436)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion"  :subid("127_1279564390.79897") :method
.annotate 'line', 140
    $P439 = self."!protoregex"("assertion")
    .return ($P439)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion"  :subid("128_1279564390.79897") :method
.annotate 'line', 140
    $P441 = self."!PREFIX__!protoregex"("assertion")
    .return ($P441)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<?>"  :subid("129_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .const 'Sub' $P450 = "131_1279564390.79897" 
    capture_lex $P450
    .local string rx443_tgt
    .local int rx443_pos
    .local int rx443_off
    .local int rx443_eos
    .local int rx443_rep
    .local pmc rx443_cur
    (rx443_cur, rx443_pos, rx443_tgt, $I10) = self."!cursor_start"()
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
    eq $I10, 1, rx443_restart
    rx443_cur."!cursor_debug"("START ", "assertion:sym<?>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan447_done
    goto rxscan447_scan
  rxscan447_loop:
    ($P10) = rx443_cur."from"()
    inc $P10
    set rx443_pos, $P10
    ge rx443_pos, rx443_eos, rxscan447_done
  rxscan447_scan:
    set_addr $I10, rxscan447_loop
    rx443_cur."!mark_push"(0, rx443_pos, $I10)
  rxscan447_done:
.annotate 'line', 142
  # rx literal  "?"
    add $I11, rx443_pos, 1
    gt $I11, rx443_eos, rx443_fail
    sub $I11, rx443_pos, rx443_off
    substr $S10, rx443_tgt, $I11, 1
    ne $S10, "?", rx443_fail
    add rx443_pos, 1
  alt448_0:
    set_addr $I10, alt448_1
    rx443_cur."!mark_push"(0, rx443_pos, $I10)
  # rx subrule "before" subtype=zerowidth negate=
    rx443_cur."!cursor_pos"(rx443_pos)
    .const 'Sub' $P450 = "131_1279564390.79897" 
    capture_lex $P450
    $P10 = rx443_cur."before"($P450)
    unless $P10, rx443_fail
    goto alt448_end
  alt448_1:
  # rx subrule "assertion" subtype=capture negate=
    rx443_cur."!cursor_pos"(rx443_pos)
    $P10 = rx443_cur."assertion"()
    unless $P10, rx443_fail
    rx443_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx443_pos = $P10."pos"()
  alt448_end:
  # rx pass
    rx443_cur."!cursor_pass"(rx443_pos, "assertion:sym<?>")
    rx443_cur."!cursor_debug"("PASS  ", "assertion:sym<?>", " at pos=", rx443_pos)
    .return (rx443_cur)
  rx443_restart:
.annotate 'line', 3
    rx443_cur."!cursor_debug"("NEXT ", "assertion:sym<?>")
  rx443_fail:
    (rx443_rep, rx443_pos, $I10, $P10) = rx443_cur."!mark_fail"(0)
    lt rx443_pos, -1, rx443_done
    eq rx443_pos, -1, rx443_fail
    jump $I10
  rx443_done:
    rx443_cur."!cursor_fail"()
    rx443_cur."!cursor_debug"("FAIL  ", "assertion:sym<?>")
    .return (rx443_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<?>"  :subid("130_1279564390.79897") :method
.annotate 'line', 3
    $P445 = self."!PREFIX__!subrule"("assertion", "?")
    new $P446, "ResizablePMCArray"
    push $P446, $P445
    push $P446, "?"
    .return ($P446)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block449"  :anon :subid("131_1279564390.79897") :method :outer("129_1279564390.79897")
.annotate 'line', 142
    .local string rx451_tgt
    .local int rx451_pos
    .local int rx451_off
    .local int rx451_eos
    .local int rx451_rep
    .local pmc rx451_cur
    (rx451_cur, rx451_pos, rx451_tgt, $I10) = self."!cursor_start"()
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
    eq $I10, 1, rx451_restart
    rx451_cur."!cursor_debug"("START ", "")
    $I10 = self.'from'()
    ne $I10, -1, rxscan452_done
    goto rxscan452_scan
  rxscan452_loop:
    ($P10) = rx451_cur."from"()
    inc $P10
    set rx451_pos, $P10
    ge rx451_pos, rx451_eos, rxscan452_done
  rxscan452_scan:
    set_addr $I10, rxscan452_loop
    rx451_cur."!mark_push"(0, rx451_pos, $I10)
  rxscan452_done:
  # rx literal  ">"
    add $I11, rx451_pos, 1
    gt $I11, rx451_eos, rx451_fail
    sub $I11, rx451_pos, rx451_off
    substr $S10, rx451_tgt, $I11, 1
    ne $S10, ">", rx451_fail
    add rx451_pos, 1
  # rx pass
    rx451_cur."!cursor_pass"(rx451_pos, "")
    rx451_cur."!cursor_debug"("PASS  ", "", " at pos=", rx451_pos)
    .return (rx451_cur)
  rx451_restart:
    rx451_cur."!cursor_debug"("NEXT ", "")
  rx451_fail:
    (rx451_rep, rx451_pos, $I10, $P10) = rx451_cur."!mark_fail"(0)
    lt rx451_pos, -1, rx451_done
    eq rx451_pos, -1, rx451_fail
    jump $I10
  rx451_done:
    rx451_cur."!cursor_fail"()
    rx451_cur."!cursor_debug"("FAIL  ", "")
    .return (rx451_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<!>"  :subid("132_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .const 'Sub' $P461 = "134_1279564390.79897" 
    capture_lex $P461
    .local string rx454_tgt
    .local int rx454_pos
    .local int rx454_off
    .local int rx454_eos
    .local int rx454_rep
    .local pmc rx454_cur
    (rx454_cur, rx454_pos, rx454_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx454_cur
    .local pmc match
    .lex "$/", match
    length rx454_eos, rx454_tgt
    gt rx454_pos, rx454_eos, rx454_done
    set rx454_off, 0
    lt rx454_pos, 2, rx454_start
    sub rx454_off, rx454_pos, 1
    substr rx454_tgt, rx454_tgt, rx454_off
  rx454_start:
    eq $I10, 1, rx454_restart
    rx454_cur."!cursor_debug"("START ", "assertion:sym<!>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan458_done
    goto rxscan458_scan
  rxscan458_loop:
    ($P10) = rx454_cur."from"()
    inc $P10
    set rx454_pos, $P10
    ge rx454_pos, rx454_eos, rxscan458_done
  rxscan458_scan:
    set_addr $I10, rxscan458_loop
    rx454_cur."!mark_push"(0, rx454_pos, $I10)
  rxscan458_done:
.annotate 'line', 143
  # rx literal  "!"
    add $I11, rx454_pos, 1
    gt $I11, rx454_eos, rx454_fail
    sub $I11, rx454_pos, rx454_off
    substr $S10, rx454_tgt, $I11, 1
    ne $S10, "!", rx454_fail
    add rx454_pos, 1
  alt459_0:
    set_addr $I10, alt459_1
    rx454_cur."!mark_push"(0, rx454_pos, $I10)
  # rx subrule "before" subtype=zerowidth negate=
    rx454_cur."!cursor_pos"(rx454_pos)
    .const 'Sub' $P461 = "134_1279564390.79897" 
    capture_lex $P461
    $P10 = rx454_cur."before"($P461)
    unless $P10, rx454_fail
    goto alt459_end
  alt459_1:
  # rx subrule "assertion" subtype=capture negate=
    rx454_cur."!cursor_pos"(rx454_pos)
    $P10 = rx454_cur."assertion"()
    unless $P10, rx454_fail
    rx454_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx454_pos = $P10."pos"()
  alt459_end:
  # rx pass
    rx454_cur."!cursor_pass"(rx454_pos, "assertion:sym<!>")
    rx454_cur."!cursor_debug"("PASS  ", "assertion:sym<!>", " at pos=", rx454_pos)
    .return (rx454_cur)
  rx454_restart:
.annotate 'line', 3
    rx454_cur."!cursor_debug"("NEXT ", "assertion:sym<!>")
  rx454_fail:
    (rx454_rep, rx454_pos, $I10, $P10) = rx454_cur."!mark_fail"(0)
    lt rx454_pos, -1, rx454_done
    eq rx454_pos, -1, rx454_fail
    jump $I10
  rx454_done:
    rx454_cur."!cursor_fail"()
    rx454_cur."!cursor_debug"("FAIL  ", "assertion:sym<!>")
    .return (rx454_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<!>"  :subid("133_1279564390.79897") :method
.annotate 'line', 3
    $P456 = self."!PREFIX__!subrule"("assertion", "!")
    new $P457, "ResizablePMCArray"
    push $P457, $P456
    push $P457, "!"
    .return ($P457)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block460"  :anon :subid("134_1279564390.79897") :method :outer("132_1279564390.79897")
.annotate 'line', 143
    .local string rx462_tgt
    .local int rx462_pos
    .local int rx462_off
    .local int rx462_eos
    .local int rx462_rep
    .local pmc rx462_cur
    (rx462_cur, rx462_pos, rx462_tgt, $I10) = self."!cursor_start"()
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
    eq $I10, 1, rx462_restart
    rx462_cur."!cursor_debug"("START ", "")
    $I10 = self.'from'()
    ne $I10, -1, rxscan463_done
    goto rxscan463_scan
  rxscan463_loop:
    ($P10) = rx462_cur."from"()
    inc $P10
    set rx462_pos, $P10
    ge rx462_pos, rx462_eos, rxscan463_done
  rxscan463_scan:
    set_addr $I10, rxscan463_loop
    rx462_cur."!mark_push"(0, rx462_pos, $I10)
  rxscan463_done:
  # rx literal  ">"
    add $I11, rx462_pos, 1
    gt $I11, rx462_eos, rx462_fail
    sub $I11, rx462_pos, rx462_off
    substr $S10, rx462_tgt, $I11, 1
    ne $S10, ">", rx462_fail
    add rx462_pos, 1
  # rx pass
    rx462_cur."!cursor_pass"(rx462_pos, "")
    rx462_cur."!cursor_debug"("PASS  ", "", " at pos=", rx462_pos)
    .return (rx462_cur)
  rx462_restart:
    rx462_cur."!cursor_debug"("NEXT ", "")
  rx462_fail:
    (rx462_rep, rx462_pos, $I10, $P10) = rx462_cur."!mark_fail"(0)
    lt rx462_pos, -1, rx462_done
    eq rx462_pos, -1, rx462_fail
    jump $I10
  rx462_done:
    rx462_cur."!cursor_fail"()
    rx462_cur."!cursor_debug"("FAIL  ", "")
    .return (rx462_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<method>"  :subid("135_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx465_tgt
    .local int rx465_pos
    .local int rx465_off
    .local int rx465_eos
    .local int rx465_rep
    .local pmc rx465_cur
    (rx465_cur, rx465_pos, rx465_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx465_cur
    .local pmc match
    .lex "$/", match
    length rx465_eos, rx465_tgt
    gt rx465_pos, rx465_eos, rx465_done
    set rx465_off, 0
    lt rx465_pos, 2, rx465_start
    sub rx465_off, rx465_pos, 1
    substr rx465_tgt, rx465_tgt, rx465_off
  rx465_start:
    eq $I10, 1, rx465_restart
    rx465_cur."!cursor_debug"("START ", "assertion:sym<method>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan469_done
    goto rxscan469_scan
  rxscan469_loop:
    ($P10) = rx465_cur."from"()
    inc $P10
    set rx465_pos, $P10
    ge rx465_pos, rx465_eos, rxscan469_done
  rxscan469_scan:
    set_addr $I10, rxscan469_loop
    rx465_cur."!mark_push"(0, rx465_pos, $I10)
  rxscan469_done:
.annotate 'line', 146
  # rx literal  "."
    add $I11, rx465_pos, 1
    gt $I11, rx465_eos, rx465_fail
    sub $I11, rx465_pos, rx465_off
    substr $S10, rx465_tgt, $I11, 1
    ne $S10, ".", rx465_fail
    add rx465_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx465_cur."!cursor_pos"(rx465_pos)
    $P10 = rx465_cur."assertion"()
    unless $P10, rx465_fail
    rx465_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx465_pos = $P10."pos"()
.annotate 'line', 145
  # rx pass
    rx465_cur."!cursor_pass"(rx465_pos, "assertion:sym<method>")
    rx465_cur."!cursor_debug"("PASS  ", "assertion:sym<method>", " at pos=", rx465_pos)
    .return (rx465_cur)
  rx465_restart:
.annotate 'line', 3
    rx465_cur."!cursor_debug"("NEXT ", "assertion:sym<method>")
  rx465_fail:
    (rx465_rep, rx465_pos, $I10, $P10) = rx465_cur."!mark_fail"(0)
    lt rx465_pos, -1, rx465_done
    eq rx465_pos, -1, rx465_fail
    jump $I10
  rx465_done:
    rx465_cur."!cursor_fail"()
    rx465_cur."!cursor_debug"("FAIL  ", "assertion:sym<method>")
    .return (rx465_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<method>"  :subid("136_1279564390.79897") :method
.annotate 'line', 3
    $P467 = self."!PREFIX__!subrule"("assertion", ".")
    new $P468, "ResizablePMCArray"
    push $P468, $P467
    .return ($P468)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<name>"  :subid("137_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .const 'Sub' $P479 = "139_1279564390.79897" 
    capture_lex $P479
    .local string rx471_tgt
    .local int rx471_pos
    .local int rx471_off
    .local int rx471_eos
    .local int rx471_rep
    .local pmc rx471_cur
    (rx471_cur, rx471_pos, rx471_tgt, $I10) = self."!cursor_start"()
    rx471_cur."!cursor_caparray"("nibbler", "arglist", "assertion")
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
    eq $I10, 1, rx471_restart
    rx471_cur."!cursor_debug"("START ", "assertion:sym<name>")
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
.annotate 'line', 150
  # rx subrule "identifier" subtype=capture negate=
    rx471_cur."!cursor_pos"(rx471_pos)
    $P10 = rx471_cur."identifier"()
    unless $P10, rx471_fail
    rx471_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    rx471_pos = $P10."pos"()
.annotate 'line', 157
  # rx rxquantr476 ** 0..1
    set_addr $I10, rxquantr476_done
    rx471_cur."!mark_push"(0, rx471_pos, $I10)
  rxquantr476_loop:
  alt477_0:
.annotate 'line', 151
    set_addr $I10, alt477_1
    rx471_cur."!mark_push"(0, rx471_pos, $I10)
.annotate 'line', 152
  # rx subrule "before" subtype=zerowidth negate=
    rx471_cur."!cursor_pos"(rx471_pos)
    .const 'Sub' $P479 = "139_1279564390.79897" 
    capture_lex $P479
    $P10 = rx471_cur."before"($P479)
    unless $P10, rx471_fail
    goto alt477_end
  alt477_1:
    set_addr $I10, alt477_2
    rx471_cur."!mark_push"(0, rx471_pos, $I10)
.annotate 'line', 153
  # rx literal  "="
    add $I11, rx471_pos, 1
    gt $I11, rx471_eos, rx471_fail
    sub $I11, rx471_pos, rx471_off
    substr $S10, rx471_tgt, $I11, 1
    ne $S10, "=", rx471_fail
    add rx471_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx471_cur."!cursor_pos"(rx471_pos)
    $P10 = rx471_cur."assertion"()
    unless $P10, rx471_fail
    rx471_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx471_pos = $P10."pos"()
    goto alt477_end
  alt477_2:
    set_addr $I10, alt477_3
    rx471_cur."!mark_push"(0, rx471_pos, $I10)
.annotate 'line', 154
  # rx literal  ":"
    add $I11, rx471_pos, 1
    gt $I11, rx471_eos, rx471_fail
    sub $I11, rx471_pos, rx471_off
    substr $S10, rx471_tgt, $I11, 1
    ne $S10, ":", rx471_fail
    add rx471_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx471_cur."!cursor_pos"(rx471_pos)
    $P10 = rx471_cur."arglist"()
    unless $P10, rx471_fail
    rx471_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx471_pos = $P10."pos"()
    goto alt477_end
  alt477_3:
    set_addr $I10, alt477_4
    rx471_cur."!mark_push"(0, rx471_pos, $I10)
.annotate 'line', 155
  # rx literal  "("
    add $I11, rx471_pos, 1
    gt $I11, rx471_eos, rx471_fail
    sub $I11, rx471_pos, rx471_off
    substr $S10, rx471_tgt, $I11, 1
    ne $S10, "(", rx471_fail
    add rx471_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx471_cur."!cursor_pos"(rx471_pos)
    $P10 = rx471_cur."arglist"()
    unless $P10, rx471_fail
    rx471_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx471_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx471_pos, 1
    gt $I11, rx471_eos, rx471_fail
    sub $I11, rx471_pos, rx471_off
    substr $S10, rx471_tgt, $I11, 1
    ne $S10, ")", rx471_fail
    add rx471_pos, 1
    goto alt477_end
  alt477_4:
.annotate 'line', 156
  # rx subrule "normspace" subtype=method negate=
    rx471_cur."!cursor_pos"(rx471_pos)
    $P10 = rx471_cur."normspace"()
    unless $P10, rx471_fail
    rx471_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx471_cur."!cursor_pos"(rx471_pos)
    $P10 = rx471_cur."nibbler"()
    unless $P10, rx471_fail
    rx471_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx471_pos = $P10."pos"()
  alt477_end:
.annotate 'line', 157
    set_addr $I10, rxquantr476_done
    (rx471_rep) = rx471_cur."!mark_commit"($I10)
  rxquantr476_done:
.annotate 'line', 149
  # rx pass
    rx471_cur."!cursor_pass"(rx471_pos, "assertion:sym<name>")
    rx471_cur."!cursor_debug"("PASS  ", "assertion:sym<name>", " at pos=", rx471_pos)
    .return (rx471_cur)
  rx471_restart:
.annotate 'line', 3
    rx471_cur."!cursor_debug"("NEXT ", "assertion:sym<name>")
  rx471_fail:
    (rx471_rep, rx471_pos, $I10, $P10) = rx471_cur."!mark_fail"(0)
    lt rx471_pos, -1, rx471_done
    eq rx471_pos, -1, rx471_fail
    jump $I10
  rx471_done:
    rx471_cur."!cursor_fail"()
    rx471_cur."!cursor_debug"("FAIL  ", "assertion:sym<name>")
    .return (rx471_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<name>"  :subid("138_1279564390.79897") :method
.annotate 'line', 3
    $P473 = self."!PREFIX__!subrule"("identifier", "")
    new $P474, "ResizablePMCArray"
    push $P474, $P473
    .return ($P474)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block478"  :anon :subid("139_1279564390.79897") :method :outer("137_1279564390.79897")
.annotate 'line', 152
    .local string rx480_tgt
    .local int rx480_pos
    .local int rx480_off
    .local int rx480_eos
    .local int rx480_rep
    .local pmc rx480_cur
    (rx480_cur, rx480_pos, rx480_tgt, $I10) = self."!cursor_start"()
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
    eq $I10, 1, rx480_restart
    rx480_cur."!cursor_debug"("START ", "")
    $I10 = self.'from'()
    ne $I10, -1, rxscan481_done
    goto rxscan481_scan
  rxscan481_loop:
    ($P10) = rx480_cur."from"()
    inc $P10
    set rx480_pos, $P10
    ge rx480_pos, rx480_eos, rxscan481_done
  rxscan481_scan:
    set_addr $I10, rxscan481_loop
    rx480_cur."!mark_push"(0, rx480_pos, $I10)
  rxscan481_done:
  # rx literal  ">"
    add $I11, rx480_pos, 1
    gt $I11, rx480_eos, rx480_fail
    sub $I11, rx480_pos, rx480_off
    substr $S10, rx480_tgt, $I11, 1
    ne $S10, ">", rx480_fail
    add rx480_pos, 1
  # rx pass
    rx480_cur."!cursor_pass"(rx480_pos, "")
    rx480_cur."!cursor_debug"("PASS  ", "", " at pos=", rx480_pos)
    .return (rx480_cur)
  rx480_restart:
    rx480_cur."!cursor_debug"("NEXT ", "")
  rx480_fail:
    (rx480_rep, rx480_pos, $I10, $P10) = rx480_cur."!mark_fail"(0)
    lt rx480_pos, -1, rx480_done
    eq rx480_pos, -1, rx480_fail
    jump $I10
  rx480_done:
    rx480_cur."!cursor_fail"()
    rx480_cur."!cursor_debug"("FAIL  ", "")
    .return (rx480_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<[>"  :subid("140_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .const 'Sub' $P488 = "142_1279564390.79897" 
    capture_lex $P488
    .local string rx483_tgt
    .local int rx483_pos
    .local int rx483_off
    .local int rx483_eos
    .local int rx483_rep
    .local pmc rx483_cur
    (rx483_cur, rx483_pos, rx483_tgt, $I10) = self."!cursor_start"()
    rx483_cur."!cursor_caparray"("cclass_elem")
    .lex unicode:"$\x{a2}", rx483_cur
    .local pmc match
    .lex "$/", match
    length rx483_eos, rx483_tgt
    gt rx483_pos, rx483_eos, rx483_done
    set rx483_off, 0
    lt rx483_pos, 2, rx483_start
    sub rx483_off, rx483_pos, 1
    substr rx483_tgt, rx483_tgt, rx483_off
  rx483_start:
    eq $I10, 1, rx483_restart
    rx483_cur."!cursor_debug"("START ", "assertion:sym<[>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan486_done
    goto rxscan486_scan
  rxscan486_loop:
    ($P10) = rx483_cur."from"()
    inc $P10
    set rx483_pos, $P10
    ge rx483_pos, rx483_eos, rxscan486_done
  rxscan486_scan:
    set_addr $I10, rxscan486_loop
    rx483_cur."!mark_push"(0, rx483_pos, $I10)
  rxscan486_done:
.annotate 'line', 160
  # rx subrule "before" subtype=zerowidth negate=
    rx483_cur."!cursor_pos"(rx483_pos)
    .const 'Sub' $P488 = "142_1279564390.79897" 
    capture_lex $P488
    $P10 = rx483_cur."before"($P488)
    unless $P10, rx483_fail
  # rx rxquantr492 ** 1..*
    set_addr $I10, rxquantr492_done
    rx483_cur."!mark_push"(0, -1, $I10)
  rxquantr492_loop:
  # rx subrule "cclass_elem" subtype=capture negate=
    rx483_cur."!cursor_pos"(rx483_pos)
    $P10 = rx483_cur."cclass_elem"()
    unless $P10, rx483_fail
    goto rxsubrule493_pass
  rxsubrule493_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx483_fail
  rxsubrule493_pass:
    set_addr $I10, rxsubrule493_back
    rx483_cur."!mark_push"(0, rx483_pos, $I10, $P10)
    $P10."!cursor_names"("cclass_elem")
    rx483_pos = $P10."pos"()
    set_addr $I10, rxquantr492_done
    (rx483_rep) = rx483_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr492_done
    rx483_cur."!mark_push"(rx483_rep, rx483_pos, $I10)
    goto rxquantr492_loop
  rxquantr492_done:
  # rx pass
    rx483_cur."!cursor_pass"(rx483_pos, "assertion:sym<[>")
    rx483_cur."!cursor_debug"("PASS  ", "assertion:sym<[>", " at pos=", rx483_pos)
    .return (rx483_cur)
  rx483_restart:
.annotate 'line', 3
    rx483_cur."!cursor_debug"("NEXT ", "assertion:sym<[>")
  rx483_fail:
    (rx483_rep, rx483_pos, $I10, $P10) = rx483_cur."!mark_fail"(0)
    lt rx483_pos, -1, rx483_done
    eq rx483_pos, -1, rx483_fail
    jump $I10
  rx483_done:
    rx483_cur."!cursor_fail"()
    rx483_cur."!cursor_debug"("FAIL  ", "assertion:sym<[>")
    .return (rx483_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<[>"  :subid("141_1279564390.79897") :method
.annotate 'line', 3
    new $P485, "ResizablePMCArray"
    push $P485, ""
    .return ($P485)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block487"  :anon :subid("142_1279564390.79897") :method :outer("140_1279564390.79897")
.annotate 'line', 160
    .local string rx489_tgt
    .local int rx489_pos
    .local int rx489_off
    .local int rx489_eos
    .local int rx489_rep
    .local pmc rx489_cur
    (rx489_cur, rx489_pos, rx489_tgt, $I10) = self."!cursor_start"()
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
    eq $I10, 1, rx489_restart
    rx489_cur."!cursor_debug"("START ", "")
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
  alt491_0:
    set_addr $I10, alt491_1
    rx489_cur."!mark_push"(0, rx489_pos, $I10)
  # rx literal  "["
    add $I11, rx489_pos, 1
    gt $I11, rx489_eos, rx489_fail
    sub $I11, rx489_pos, rx489_off
    substr $S10, rx489_tgt, $I11, 1
    ne $S10, "[", rx489_fail
    add rx489_pos, 1
    goto alt491_end
  alt491_1:
    set_addr $I10, alt491_2
    rx489_cur."!mark_push"(0, rx489_pos, $I10)
  # rx literal  "+"
    add $I11, rx489_pos, 1
    gt $I11, rx489_eos, rx489_fail
    sub $I11, rx489_pos, rx489_off
    substr $S10, rx489_tgt, $I11, 1
    ne $S10, "+", rx489_fail
    add rx489_pos, 1
    goto alt491_end
  alt491_2:
  # rx literal  "-"
    add $I11, rx489_pos, 1
    gt $I11, rx489_eos, rx489_fail
    sub $I11, rx489_pos, rx489_off
    substr $S10, rx489_tgt, $I11, 1
    ne $S10, "-", rx489_fail
    add rx489_pos, 1
  alt491_end:
  # rx pass
    rx489_cur."!cursor_pass"(rx489_pos, "")
    rx489_cur."!cursor_debug"("PASS  ", "", " at pos=", rx489_pos)
    .return (rx489_cur)
  rx489_restart:
    rx489_cur."!cursor_debug"("NEXT ", "")
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
.sub "cclass_elem"  :subid("143_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .const 'Sub' $P506 = "145_1279564390.79897" 
    capture_lex $P506
    .local string rx495_tgt
    .local int rx495_pos
    .local int rx495_off
    .local int rx495_eos
    .local int rx495_rep
    .local pmc rx495_cur
    (rx495_cur, rx495_pos, rx495_tgt, $I10) = self."!cursor_start"()
    rx495_cur."!cursor_caparray"("charspec")
    .lex unicode:"$\x{a2}", rx495_cur
    .local pmc match
    .lex "$/", match
    length rx495_eos, rx495_tgt
    gt rx495_pos, rx495_eos, rx495_done
    set rx495_off, 0
    lt rx495_pos, 2, rx495_start
    sub rx495_off, rx495_pos, 1
    substr rx495_tgt, rx495_tgt, rx495_off
  rx495_start:
    eq $I10, 1, rx495_restart
    rx495_cur."!cursor_debug"("START ", "cclass_elem")
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
.annotate 'line', 163
  # rx subcapture "sign"
    set_addr $I10, rxcap_500_fail
    rx495_cur."!mark_push"(0, rx495_pos, $I10)
  alt499_0:
    set_addr $I10, alt499_1
    rx495_cur."!mark_push"(0, rx495_pos, $I10)
  # rx literal  "+"
    add $I11, rx495_pos, 1
    gt $I11, rx495_eos, rx495_fail
    sub $I11, rx495_pos, rx495_off
    substr $S10, rx495_tgt, $I11, 1
    ne $S10, "+", rx495_fail
    add rx495_pos, 1
    goto alt499_end
  alt499_1:
    set_addr $I10, alt499_2
    rx495_cur."!mark_push"(0, rx495_pos, $I10)
  # rx literal  "-"
    add $I11, rx495_pos, 1
    gt $I11, rx495_eos, rx495_fail
    sub $I11, rx495_pos, rx495_off
    substr $S10, rx495_tgt, $I11, 1
    ne $S10, "-", rx495_fail
    add rx495_pos, 1
    goto alt499_end
  alt499_2:
  alt499_end:
    set_addr $I10, rxcap_500_fail
    ($I12, $I11) = rx495_cur."!mark_peek"($I10)
    rx495_cur."!cursor_pos"($I11)
    ($P10) = rx495_cur."!cursor_start"()
    $P10."!cursor_pass"(rx495_pos, "")
    rx495_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sign")
    goto rxcap_500_done
  rxcap_500_fail:
    goto rx495_fail
  rxcap_500_done:
.annotate 'line', 164
  # rx rxquantr501 ** 0..1
    set_addr $I10, rxquantr501_done
    rx495_cur."!mark_push"(0, rx495_pos, $I10)
  rxquantr501_loop:
  # rx subrule "normspace" subtype=method negate=
    rx495_cur."!cursor_pos"(rx495_pos)
    $P10 = rx495_cur."normspace"()
    unless $P10, rx495_fail
    goto rxsubrule502_pass
  rxsubrule502_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx495_fail
  rxsubrule502_pass:
    set_addr $I10, rxsubrule502_back
    rx495_cur."!mark_push"(0, rx495_pos, $I10, $P10)
    rx495_pos = $P10."pos"()
    set_addr $I10, rxquantr501_done
    (rx495_rep) = rx495_cur."!mark_commit"($I10)
  rxquantr501_done:
  alt503_0:
.annotate 'line', 165
    set_addr $I10, alt503_1
    rx495_cur."!mark_push"(0, rx495_pos, $I10)
.annotate 'line', 166
  # rx literal  "["
    add $I11, rx495_pos, 1
    gt $I11, rx495_eos, rx495_fail
    sub $I11, rx495_pos, rx495_off
    substr $S10, rx495_tgt, $I11, 1
    ne $S10, "[", rx495_fail
    add rx495_pos, 1
.annotate 'line', 169
  # rx rxquantr504 ** 0..*
    set_addr $I10, rxquantr504_done
    rx495_cur."!mark_push"(0, rx495_pos, $I10)
  rxquantr504_loop:
.annotate 'line', 166
  # rx subrule $P506 subtype=capture negate=
    rx495_cur."!cursor_pos"(rx495_pos)
    .const 'Sub' $P506 = "145_1279564390.79897" 
    capture_lex $P506
    $P10 = rx495_cur.$P506()
    unless $P10, rx495_fail
    goto rxsubrule524_pass
  rxsubrule524_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx495_fail
  rxsubrule524_pass:
    set_addr $I10, rxsubrule524_back
    rx495_cur."!mark_push"(0, rx495_pos, $I10, $P10)
    $P10."!cursor_names"("charspec")
    rx495_pos = $P10."pos"()
.annotate 'line', 169
    set_addr $I10, rxquantr504_done
    (rx495_rep) = rx495_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr504_done
    rx495_cur."!mark_push"(rx495_rep, rx495_pos, $I10)
    goto rxquantr504_loop
  rxquantr504_done:
.annotate 'line', 170
  # rx charclass_q s r 0..-1
    sub $I10, rx495_pos, rx495_off
    find_not_cclass $I11, 32, rx495_tgt, $I10, rx495_eos
    add rx495_pos, rx495_off, $I11
  # rx literal  "]"
    add $I11, rx495_pos, 1
    gt $I11, rx495_eos, rx495_fail
    sub $I11, rx495_pos, rx495_off
    substr $S10, rx495_tgt, $I11, 1
    ne $S10, "]", rx495_fail
    add rx495_pos, 1
.annotate 'line', 166
    goto alt503_end
  alt503_1:
.annotate 'line', 171
  # rx subcapture "name"
    set_addr $I10, rxcap_525_fail
    rx495_cur."!mark_push"(0, rx495_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx495_pos, rx495_off
    find_not_cclass $I11, 8192, rx495_tgt, $I10, rx495_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx495_fail
    add rx495_pos, rx495_off, $I11
    set_addr $I10, rxcap_525_fail
    ($I12, $I11) = rx495_cur."!mark_peek"($I10)
    rx495_cur."!cursor_pos"($I11)
    ($P10) = rx495_cur."!cursor_start"()
    $P10."!cursor_pass"(rx495_pos, "")
    rx495_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_525_done
  rxcap_525_fail:
    goto rx495_fail
  rxcap_525_done:
  alt503_end:
.annotate 'line', 173
  # rx rxquantr526 ** 0..1
    set_addr $I10, rxquantr526_done
    rx495_cur."!mark_push"(0, rx495_pos, $I10)
  rxquantr526_loop:
  # rx subrule "normspace" subtype=method negate=
    rx495_cur."!cursor_pos"(rx495_pos)
    $P10 = rx495_cur."normspace"()
    unless $P10, rx495_fail
    goto rxsubrule527_pass
  rxsubrule527_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx495_fail
  rxsubrule527_pass:
    set_addr $I10, rxsubrule527_back
    rx495_cur."!mark_push"(0, rx495_pos, $I10, $P10)
    rx495_pos = $P10."pos"()
    set_addr $I10, rxquantr526_done
    (rx495_rep) = rx495_cur."!mark_commit"($I10)
  rxquantr526_done:
.annotate 'line', 162
  # rx pass
    rx495_cur."!cursor_pass"(rx495_pos, "cclass_elem")
    rx495_cur."!cursor_debug"("PASS  ", "cclass_elem", " at pos=", rx495_pos)
    .return (rx495_cur)
  rx495_restart:
.annotate 'line', 3
    rx495_cur."!cursor_debug"("NEXT ", "cclass_elem")
  rx495_fail:
    (rx495_rep, rx495_pos, $I10, $P10) = rx495_cur."!mark_fail"(0)
    lt rx495_pos, -1, rx495_done
    eq rx495_pos, -1, rx495_fail
    jump $I10
  rx495_done:
    rx495_cur."!cursor_fail"()
    rx495_cur."!cursor_debug"("FAIL  ", "cclass_elem")
    .return (rx495_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__cclass_elem"  :subid("144_1279564390.79897") :method
.annotate 'line', 3
    new $P497, "ResizablePMCArray"
    push $P497, ""
    push $P497, "-"
    push $P497, "+"
    .return ($P497)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block505"  :anon :subid("145_1279564390.79897") :method :outer("143_1279564390.79897")
.annotate 'line', 166
    .const 'Sub' $P521 = "148_1279564390.79897" 
    capture_lex $P521
    .const 'Sub' $P516 = "147_1279564390.79897" 
    capture_lex $P516
    .const 'Sub' $P512 = "146_1279564390.79897" 
    capture_lex $P512
    .local string rx507_tgt
    .local int rx507_pos
    .local int rx507_off
    .local int rx507_eos
    .local int rx507_rep
    .local pmc rx507_cur
    (rx507_cur, rx507_pos, rx507_tgt, $I10) = self."!cursor_start"()
    rx507_cur."!cursor_caparray"("1")
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
    eq $I10, 1, rx507_restart
    rx507_cur."!cursor_debug"("START ", "")
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
.annotate 'line', 167
  # rx charclass_q s r 0..-1
    sub $I10, rx507_pos, rx507_off
    find_not_cclass $I11, 32, rx507_tgt, $I10, rx507_eos
    add rx507_pos, rx507_off, $I11
  # rx literal  "-"
    add $I11, rx507_pos, 1
    gt $I11, rx507_eos, rx507_fail
    sub $I11, rx507_pos, rx507_off
    substr $S10, rx507_tgt, $I11, 1
    ne $S10, "-", rx507_fail
    add rx507_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx507_cur."!cursor_pos"(rx507_pos)
    $P10 = rx507_cur."obs"("hyphen in enumerated character class", "..")
    unless $P10, rx507_fail
    rx507_pos = $P10."pos"()
    goto alt509_end
  alt509_1:
.annotate 'line', 168
  # rx charclass_q s r 0..-1
    sub $I10, rx507_pos, rx507_off
    find_not_cclass $I11, 32, rx507_tgt, $I10, rx507_eos
    add rx507_pos, rx507_off, $I11
  alt510_0:
    set_addr $I10, alt510_1
    rx507_cur."!mark_push"(0, rx507_pos, $I10)
  # rx literal  "\\"
    add $I11, rx507_pos, 1
    gt $I11, rx507_eos, rx507_fail
    sub $I11, rx507_pos, rx507_off
    substr $S10, rx507_tgt, $I11, 1
    ne $S10, "\\", rx507_fail
    add rx507_pos, 1
  # rx subrule $P512 subtype=capture negate=
    rx507_cur."!cursor_pos"(rx507_pos)
    .const 'Sub' $P512 = "146_1279564390.79897" 
    capture_lex $P512
    $P10 = rx507_cur.$P512()
    unless $P10, rx507_fail
    rx507_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"(0)
    rx507_pos = $P10."pos"()
    goto alt510_end
  alt510_1:
  # rx subrule $P516 subtype=capture negate=
    rx507_cur."!cursor_pos"(rx507_pos)
    .const 'Sub' $P516 = "147_1279564390.79897" 
    capture_lex $P516
    $P10 = rx507_cur.$P516()
    unless $P10, rx507_fail
    rx507_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"(0)
    rx507_pos = $P10."pos"()
  alt510_end:
  # rx rxquantr519 ** 0..1
    set_addr $I10, rxquantr519_done
    rx507_cur."!mark_push"(0, rx507_pos, $I10)
  rxquantr519_loop:
  # rx charclass_q s r 0..-1
    sub $I10, rx507_pos, rx507_off
    find_not_cclass $I11, 32, rx507_tgt, $I10, rx507_eos
    add rx507_pos, rx507_off, $I11
  # rx literal  ".."
    add $I11, rx507_pos, 2
    gt $I11, rx507_eos, rx507_fail
    sub $I11, rx507_pos, rx507_off
    substr $S10, rx507_tgt, $I11, 2
    ne $S10, "..", rx507_fail
    add rx507_pos, 2
  # rx charclass_q s r 0..-1
    sub $I10, rx507_pos, rx507_off
    find_not_cclass $I11, 32, rx507_tgt, $I10, rx507_eos
    add rx507_pos, rx507_off, $I11
  # rx subrule $P521 subtype=capture negate=
    rx507_cur."!cursor_pos"(rx507_pos)
    .const 'Sub' $P521 = "148_1279564390.79897" 
    capture_lex $P521
    $P10 = rx507_cur.$P521()
    unless $P10, rx507_fail
    rx507_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("1")
    rx507_pos = $P10."pos"()
    set_addr $I10, rxquantr519_done
    (rx507_rep) = rx507_cur."!mark_commit"($I10)
  rxquantr519_done:
  alt509_end:
.annotate 'line', 166
  # rx pass
    rx507_cur."!cursor_pass"(rx507_pos, "")
    rx507_cur."!cursor_debug"("PASS  ", "", " at pos=", rx507_pos)
    .return (rx507_cur)
  rx507_restart:
    rx507_cur."!cursor_debug"("NEXT ", "")
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
.sub "_block511"  :anon :subid("146_1279564390.79897") :method :outer("145_1279564390.79897")
.annotate 'line', 168
    .local string rx513_tgt
    .local int rx513_pos
    .local int rx513_off
    .local int rx513_eos
    .local int rx513_rep
    .local pmc rx513_cur
    (rx513_cur, rx513_pos, rx513_tgt, $I10) = self."!cursor_start"()
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
    eq $I10, 1, rx513_restart
    rx513_cur."!cursor_debug"("START ", "")
    $I10 = self.'from'()
    ne $I10, -1, rxscan514_done
    goto rxscan514_scan
  rxscan514_loop:
    ($P10) = rx513_cur."from"()
    inc $P10
    set rx513_pos, $P10
    ge rx513_pos, rx513_eos, rxscan514_done
  rxscan514_scan:
    set_addr $I10, rxscan514_loop
    rx513_cur."!mark_push"(0, rx513_pos, $I10)
  rxscan514_done:
  # rx charclass .
    ge rx513_pos, rx513_eos, rx513_fail
    inc rx513_pos
  # rx pass
    rx513_cur."!cursor_pass"(rx513_pos, "")
    rx513_cur."!cursor_debug"("PASS  ", "", " at pos=", rx513_pos)
    .return (rx513_cur)
  rx513_restart:
    rx513_cur."!cursor_debug"("NEXT ", "")
  rx513_fail:
    (rx513_rep, rx513_pos, $I10, $P10) = rx513_cur."!mark_fail"(0)
    lt rx513_pos, -1, rx513_done
    eq rx513_pos, -1, rx513_fail
    jump $I10
  rx513_done:
    rx513_cur."!cursor_fail"()
    rx513_cur."!cursor_debug"("FAIL  ", "")
    .return (rx513_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block515"  :anon :subid("147_1279564390.79897") :method :outer("145_1279564390.79897")
.annotate 'line', 168
    .local string rx517_tgt
    .local int rx517_pos
    .local int rx517_off
    .local int rx517_eos
    .local int rx517_rep
    .local pmc rx517_cur
    (rx517_cur, rx517_pos, rx517_tgt, $I10) = self."!cursor_start"()
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
    eq $I10, 1, rx517_restart
    rx517_cur."!cursor_debug"("START ", "")
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
  # rx enumcharlist negate=1 
    ge rx517_pos, rx517_eos, rx517_fail
    sub $I10, rx517_pos, rx517_off
    substr $S10, rx517_tgt, $I10, 1
    index $I11, "]\\", $S10
    ge $I11, 0, rx517_fail
    inc rx517_pos
  # rx pass
    rx517_cur."!cursor_pass"(rx517_pos, "")
    rx517_cur."!cursor_debug"("PASS  ", "", " at pos=", rx517_pos)
    .return (rx517_cur)
  rx517_restart:
    rx517_cur."!cursor_debug"("NEXT ", "")
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
.sub "_block520"  :anon :subid("148_1279564390.79897") :method :outer("145_1279564390.79897")
.annotate 'line', 168
    .local string rx522_tgt
    .local int rx522_pos
    .local int rx522_off
    .local int rx522_eos
    .local int rx522_rep
    .local pmc rx522_cur
    (rx522_cur, rx522_pos, rx522_tgt, $I10) = self."!cursor_start"()
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
    eq $I10, 1, rx522_restart
    rx522_cur."!cursor_debug"("START ", "")
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
  rx522_restart:
    rx522_cur."!cursor_debug"("NEXT ", "")
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
.sub "mod_internal"  :subid("149_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .const 'Sub' $P537 = "151_1279564390.79897" 
    capture_lex $P537
    .local string rx529_tgt
    .local int rx529_pos
    .local int rx529_off
    .local int rx529_eos
    .local int rx529_rep
    .local pmc rx529_cur
    (rx529_cur, rx529_pos, rx529_tgt, $I10) = self."!cursor_start"()
    rx529_cur."!cursor_caparray"("n")
    .lex unicode:"$\x{a2}", rx529_cur
    .local pmc match
    .lex "$/", match
    length rx529_eos, rx529_tgt
    gt rx529_pos, rx529_eos, rx529_done
    set rx529_off, 0
    lt rx529_pos, 2, rx529_start
    sub rx529_off, rx529_pos, 1
    substr rx529_tgt, rx529_tgt, rx529_off
  rx529_start:
    eq $I10, 1, rx529_restart
    rx529_cur."!cursor_debug"("START ", "mod_internal")
    $I10 = self.'from'()
    ne $I10, -1, rxscan533_done
    goto rxscan533_scan
  rxscan533_loop:
    ($P10) = rx529_cur."from"()
    inc $P10
    set rx529_pos, $P10
    ge rx529_pos, rx529_eos, rxscan533_done
  rxscan533_scan:
    set_addr $I10, rxscan533_loop
    rx529_cur."!mark_push"(0, rx529_pos, $I10)
  rxscan533_done:
  alt534_0:
.annotate 'line', 177
    set_addr $I10, alt534_1
    rx529_cur."!mark_push"(0, rx529_pos, $I10)
.annotate 'line', 178
  # rx literal  ":"
    add $I11, rx529_pos, 1
    gt $I11, rx529_eos, rx529_fail
    sub $I11, rx529_pos, rx529_off
    substr $S10, rx529_tgt, $I11, 1
    ne $S10, ":", rx529_fail
    add rx529_pos, 1
  # rx rxquantr535 ** 1..1
    set_addr $I10, rxquantr535_done
    rx529_cur."!mark_push"(0, -1, $I10)
  rxquantr535_loop:
  # rx subrule $P537 subtype=capture negate=
    rx529_cur."!cursor_pos"(rx529_pos)
    .const 'Sub' $P537 = "151_1279564390.79897" 
    capture_lex $P537
    $P10 = rx529_cur.$P537()
    unless $P10, rx529_fail
    goto rxsubrule541_pass
  rxsubrule541_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx529_fail
  rxsubrule541_pass:
    set_addr $I10, rxsubrule541_back
    rx529_cur."!mark_push"(0, rx529_pos, $I10, $P10)
    $P10."!cursor_names"("n")
    rx529_pos = $P10."pos"()
    set_addr $I10, rxquantr535_done
    (rx529_rep) = rx529_cur."!mark_commit"($I10)
  rxquantr535_done:
  # rx subrule "mod_ident" subtype=capture negate=
    rx529_cur."!cursor_pos"(rx529_pos)
    $P10 = rx529_cur."mod_ident"()
    unless $P10, rx529_fail
    rx529_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_ident")
    rx529_pos = $P10."pos"()
  # rxanchor rwb
    le rx529_pos, 0, rx529_fail
    sub $I10, rx529_pos, rx529_off
    is_cclass $I11, 8192, rx529_tgt, $I10
    if $I11, rx529_fail
    dec $I10
    is_cclass $I11, 8192, rx529_tgt, $I10
    unless $I11, rx529_fail
    goto alt534_end
  alt534_1:
.annotate 'line', 179
  # rx literal  ":"
    add $I11, rx529_pos, 1
    gt $I11, rx529_eos, rx529_fail
    sub $I11, rx529_pos, rx529_off
    substr $S10, rx529_tgt, $I11, 1
    ne $S10, ":", rx529_fail
    add rx529_pos, 1
  # rx subrule "mod_ident" subtype=capture negate=
    rx529_cur."!cursor_pos"(rx529_pos)
    $P10 = rx529_cur."mod_ident"()
    unless $P10, rx529_fail
    rx529_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_ident")
    rx529_pos = $P10."pos"()
  # rx rxquantr542 ** 0..1
    set_addr $I10, rxquantr542_done
    rx529_cur."!mark_push"(0, rx529_pos, $I10)
  rxquantr542_loop:
  # rx literal  "("
    add $I11, rx529_pos, 1
    gt $I11, rx529_eos, rx529_fail
    sub $I11, rx529_pos, rx529_off
    substr $S10, rx529_tgt, $I11, 1
    ne $S10, "(", rx529_fail
    add rx529_pos, 1
  # rx subcapture "n"
    set_addr $I10, rxcap_543_fail
    rx529_cur."!mark_push"(0, rx529_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx529_pos, rx529_off
    find_not_cclass $I11, 8, rx529_tgt, $I10, rx529_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx529_fail
    add rx529_pos, rx529_off, $I11
    set_addr $I10, rxcap_543_fail
    ($I12, $I11) = rx529_cur."!mark_peek"($I10)
    rx529_cur."!cursor_pos"($I11)
    ($P10) = rx529_cur."!cursor_start"()
    $P10."!cursor_pass"(rx529_pos, "")
    rx529_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("n")
    goto rxcap_543_done
  rxcap_543_fail:
    goto rx529_fail
  rxcap_543_done:
  # rx literal  ")"
    add $I11, rx529_pos, 1
    gt $I11, rx529_eos, rx529_fail
    sub $I11, rx529_pos, rx529_off
    substr $S10, rx529_tgt, $I11, 1
    ne $S10, ")", rx529_fail
    add rx529_pos, 1
    set_addr $I10, rxquantr542_done
    (rx529_rep) = rx529_cur."!mark_commit"($I10)
  rxquantr542_done:
  alt534_end:
.annotate 'line', 176
  # rx pass
    rx529_cur."!cursor_pass"(rx529_pos, "mod_internal")
    rx529_cur."!cursor_debug"("PASS  ", "mod_internal", " at pos=", rx529_pos)
    .return (rx529_cur)
  rx529_restart:
.annotate 'line', 3
    rx529_cur."!cursor_debug"("NEXT ", "mod_internal")
  rx529_fail:
    (rx529_rep, rx529_pos, $I10, $P10) = rx529_cur."!mark_fail"(0)
    lt rx529_pos, -1, rx529_done
    eq rx529_pos, -1, rx529_fail
    jump $I10
  rx529_done:
    rx529_cur."!cursor_fail"()
    rx529_cur."!cursor_debug"("FAIL  ", "mod_internal")
    .return (rx529_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_internal"  :subid("150_1279564390.79897") :method
.annotate 'line', 3
    $P531 = self."!PREFIX__!subrule"("mod_ident", ":")
    new $P532, "ResizablePMCArray"
    push $P532, $P531
    push $P532, ":"
    .return ($P532)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block536"  :anon :subid("151_1279564390.79897") :method :outer("149_1279564390.79897")
.annotate 'line', 178
    .local string rx538_tgt
    .local int rx538_pos
    .local int rx538_off
    .local int rx538_eos
    .local int rx538_rep
    .local pmc rx538_cur
    (rx538_cur, rx538_pos, rx538_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx538_cur
    .local pmc match
    .lex "$/", match
    length rx538_eos, rx538_tgt
    gt rx538_pos, rx538_eos, rx538_done
    set rx538_off, 0
    lt rx538_pos, 2, rx538_start
    sub rx538_off, rx538_pos, 1
    substr rx538_tgt, rx538_tgt, rx538_off
  rx538_start:
    eq $I10, 1, rx538_restart
    rx538_cur."!cursor_debug"("START ", "")
    $I10 = self.'from'()
    ne $I10, -1, rxscan539_done
    goto rxscan539_scan
  rxscan539_loop:
    ($P10) = rx538_cur."from"()
    inc $P10
    set rx538_pos, $P10
    ge rx538_pos, rx538_eos, rxscan539_done
  rxscan539_scan:
    set_addr $I10, rxscan539_loop
    rx538_cur."!mark_push"(0, rx538_pos, $I10)
  rxscan539_done:
  alt540_0:
    set_addr $I10, alt540_1
    rx538_cur."!mark_push"(0, rx538_pos, $I10)
  # rx literal  "!"
    add $I11, rx538_pos, 1
    gt $I11, rx538_eos, rx538_fail
    sub $I11, rx538_pos, rx538_off
    substr $S10, rx538_tgt, $I11, 1
    ne $S10, "!", rx538_fail
    add rx538_pos, 1
    goto alt540_end
  alt540_1:
  # rx charclass_q d r 1..-1
    sub $I10, rx538_pos, rx538_off
    find_not_cclass $I11, 8, rx538_tgt, $I10, rx538_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx538_fail
    add rx538_pos, rx538_off, $I11
  alt540_end:
  # rx pass
    rx538_cur."!cursor_pass"(rx538_pos, "")
    rx538_cur."!cursor_debug"("PASS  ", "", " at pos=", rx538_pos)
    .return (rx538_cur)
  rx538_restart:
    rx538_cur."!cursor_debug"("NEXT ", "")
  rx538_fail:
    (rx538_rep, rx538_pos, $I10, $P10) = rx538_cur."!mark_fail"(0)
    lt rx538_pos, -1, rx538_done
    eq rx538_pos, -1, rx538_fail
    jump $I10
  rx538_done:
    rx538_cur."!cursor_fail"()
    rx538_cur."!cursor_debug"("FAIL  ", "")
    .return (rx538_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident"  :subid("152_1279564390.79897") :method
.annotate 'line', 183
    $P545 = self."!protoregex"("mod_ident")
    .return ($P545)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident"  :subid("153_1279564390.79897") :method
.annotate 'line', 183
    $P547 = self."!PREFIX__!protoregex"("mod_ident")
    .return ($P547)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ignorecase>"  :subid("154_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx549_tgt
    .local int rx549_pos
    .local int rx549_off
    .local int rx549_eos
    .local int rx549_rep
    .local pmc rx549_cur
    (rx549_cur, rx549_pos, rx549_tgt, $I10) = self."!cursor_start"()
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
    eq $I10, 1, rx549_restart
    rx549_cur."!cursor_debug"("START ", "mod_ident:sym<ignorecase>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan552_done
    goto rxscan552_scan
  rxscan552_loop:
    ($P10) = rx549_cur."from"()
    inc $P10
    set rx549_pos, $P10
    ge rx549_pos, rx549_eos, rxscan552_done
  rxscan552_scan:
    set_addr $I10, rxscan552_loop
    rx549_cur."!mark_push"(0, rx549_pos, $I10)
  rxscan552_done:
.annotate 'line', 184
  # rx subcapture "sym"
    set_addr $I10, rxcap_553_fail
    rx549_cur."!mark_push"(0, rx549_pos, $I10)
  # rx literal  "i"
    add $I11, rx549_pos, 1
    gt $I11, rx549_eos, rx549_fail
    sub $I11, rx549_pos, rx549_off
    substr $S10, rx549_tgt, $I11, 1
    ne $S10, "i", rx549_fail
    add rx549_pos, 1
    set_addr $I10, rxcap_553_fail
    ($I12, $I11) = rx549_cur."!mark_peek"($I10)
    rx549_cur."!cursor_pos"($I11)
    ($P10) = rx549_cur."!cursor_start"()
    $P10."!cursor_pass"(rx549_pos, "")
    rx549_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_553_done
  rxcap_553_fail:
    goto rx549_fail
  rxcap_553_done:
  # rx rxquantr554 ** 0..1
    set_addr $I10, rxquantr554_done
    rx549_cur."!mark_push"(0, rx549_pos, $I10)
  rxquantr554_loop:
  # rx literal  "gnorecase"
    add $I11, rx549_pos, 9
    gt $I11, rx549_eos, rx549_fail
    sub $I11, rx549_pos, rx549_off
    substr $S10, rx549_tgt, $I11, 9
    ne $S10, "gnorecase", rx549_fail
    add rx549_pos, 9
    set_addr $I10, rxquantr554_done
    (rx549_rep) = rx549_cur."!mark_commit"($I10)
  rxquantr554_done:
  # rx pass
    rx549_cur."!cursor_pass"(rx549_pos, "mod_ident:sym<ignorecase>")
    rx549_cur."!cursor_debug"("PASS  ", "mod_ident:sym<ignorecase>", " at pos=", rx549_pos)
    .return (rx549_cur)
  rx549_restart:
.annotate 'line', 3
    rx549_cur."!cursor_debug"("NEXT ", "mod_ident:sym<ignorecase>")
  rx549_fail:
    (rx549_rep, rx549_pos, $I10, $P10) = rx549_cur."!mark_fail"(0)
    lt rx549_pos, -1, rx549_done
    eq rx549_pos, -1, rx549_fail
    jump $I10
  rx549_done:
    rx549_cur."!cursor_fail"()
    rx549_cur."!cursor_debug"("FAIL  ", "mod_ident:sym<ignorecase>")
    .return (rx549_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident:sym<ignorecase>"  :subid("155_1279564390.79897") :method
.annotate 'line', 3
    new $P551, "ResizablePMCArray"
    push $P551, "i"
    .return ($P551)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ratchet>"  :subid("156_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx556_tgt
    .local int rx556_pos
    .local int rx556_off
    .local int rx556_eos
    .local int rx556_rep
    .local pmc rx556_cur
    (rx556_cur, rx556_pos, rx556_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx556_cur
    .local pmc match
    .lex "$/", match
    length rx556_eos, rx556_tgt
    gt rx556_pos, rx556_eos, rx556_done
    set rx556_off, 0
    lt rx556_pos, 2, rx556_start
    sub rx556_off, rx556_pos, 1
    substr rx556_tgt, rx556_tgt, rx556_off
  rx556_start:
    eq $I10, 1, rx556_restart
    rx556_cur."!cursor_debug"("START ", "mod_ident:sym<ratchet>")
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
.annotate 'line', 185
  # rx subcapture "sym"
    set_addr $I10, rxcap_560_fail
    rx556_cur."!mark_push"(0, rx556_pos, $I10)
  # rx literal  "r"
    add $I11, rx556_pos, 1
    gt $I11, rx556_eos, rx556_fail
    sub $I11, rx556_pos, rx556_off
    substr $S10, rx556_tgt, $I11, 1
    ne $S10, "r", rx556_fail
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
    set_addr $I10, rxquantr561_done
    rx556_cur."!mark_push"(0, rx556_pos, $I10)
  rxquantr561_loop:
  # rx literal  "atchet"
    add $I11, rx556_pos, 6
    gt $I11, rx556_eos, rx556_fail
    sub $I11, rx556_pos, rx556_off
    substr $S10, rx556_tgt, $I11, 6
    ne $S10, "atchet", rx556_fail
    add rx556_pos, 6
    set_addr $I10, rxquantr561_done
    (rx556_rep) = rx556_cur."!mark_commit"($I10)
  rxquantr561_done:
  # rx pass
    rx556_cur."!cursor_pass"(rx556_pos, "mod_ident:sym<ratchet>")
    rx556_cur."!cursor_debug"("PASS  ", "mod_ident:sym<ratchet>", " at pos=", rx556_pos)
    .return (rx556_cur)
  rx556_restart:
.annotate 'line', 3
    rx556_cur."!cursor_debug"("NEXT ", "mod_ident:sym<ratchet>")
  rx556_fail:
    (rx556_rep, rx556_pos, $I10, $P10) = rx556_cur."!mark_fail"(0)
    lt rx556_pos, -1, rx556_done
    eq rx556_pos, -1, rx556_fail
    jump $I10
  rx556_done:
    rx556_cur."!cursor_fail"()
    rx556_cur."!cursor_debug"("FAIL  ", "mod_ident:sym<ratchet>")
    .return (rx556_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident:sym<ratchet>"  :subid("157_1279564390.79897") :method
.annotate 'line', 3
    new $P558, "ResizablePMCArray"
    push $P558, "r"
    .return ($P558)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<sigspace>"  :subid("158_1279564390.79897") :method :outer("11_1279564390.79897")
.annotate 'line', 3
    .local string rx563_tgt
    .local int rx563_pos
    .local int rx563_off
    .local int rx563_eos
    .local int rx563_rep
    .local pmc rx563_cur
    (rx563_cur, rx563_pos, rx563_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx563_cur
    .local pmc match
    .lex "$/", match
    length rx563_eos, rx563_tgt
    gt rx563_pos, rx563_eos, rx563_done
    set rx563_off, 0
    lt rx563_pos, 2, rx563_start
    sub rx563_off, rx563_pos, 1
    substr rx563_tgt, rx563_tgt, rx563_off
  rx563_start:
    eq $I10, 1, rx563_restart
    rx563_cur."!cursor_debug"("START ", "mod_ident:sym<sigspace>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan566_done
    goto rxscan566_scan
  rxscan566_loop:
    ($P10) = rx563_cur."from"()
    inc $P10
    set rx563_pos, $P10
    ge rx563_pos, rx563_eos, rxscan566_done
  rxscan566_scan:
    set_addr $I10, rxscan566_loop
    rx563_cur."!mark_push"(0, rx563_pos, $I10)
  rxscan566_done:
.annotate 'line', 186
  # rx subcapture "sym"
    set_addr $I10, rxcap_567_fail
    rx563_cur."!mark_push"(0, rx563_pos, $I10)
  # rx literal  "s"
    add $I11, rx563_pos, 1
    gt $I11, rx563_eos, rx563_fail
    sub $I11, rx563_pos, rx563_off
    substr $S10, rx563_tgt, $I11, 1
    ne $S10, "s", rx563_fail
    add rx563_pos, 1
    set_addr $I10, rxcap_567_fail
    ($I12, $I11) = rx563_cur."!mark_peek"($I10)
    rx563_cur."!cursor_pos"($I11)
    ($P10) = rx563_cur."!cursor_start"()
    $P10."!cursor_pass"(rx563_pos, "")
    rx563_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_567_done
  rxcap_567_fail:
    goto rx563_fail
  rxcap_567_done:
  # rx rxquantr568 ** 0..1
    set_addr $I10, rxquantr568_done
    rx563_cur."!mark_push"(0, rx563_pos, $I10)
  rxquantr568_loop:
  # rx literal  "igspace"
    add $I11, rx563_pos, 7
    gt $I11, rx563_eos, rx563_fail
    sub $I11, rx563_pos, rx563_off
    substr $S10, rx563_tgt, $I11, 7
    ne $S10, "igspace", rx563_fail
    add rx563_pos, 7
    set_addr $I10, rxquantr568_done
    (rx563_rep) = rx563_cur."!mark_commit"($I10)
  rxquantr568_done:
  # rx pass
    rx563_cur."!cursor_pass"(rx563_pos, "mod_ident:sym<sigspace>")
    rx563_cur."!cursor_debug"("PASS  ", "mod_ident:sym<sigspace>", " at pos=", rx563_pos)
    .return (rx563_cur)
  rx563_restart:
.annotate 'line', 3
    rx563_cur."!cursor_debug"("NEXT ", "mod_ident:sym<sigspace>")
  rx563_fail:
    (rx563_rep, rx563_pos, $I10, $P10) = rx563_cur."!mark_fail"(0)
    lt rx563_pos, -1, rx563_done
    eq rx563_pos, -1, rx563_fail
    jump $I10
  rx563_done:
    rx563_cur."!cursor_fail"()
    rx563_cur."!cursor_debug"("FAIL  ", "mod_ident:sym<sigspace>")
    .return (rx563_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident:sym<sigspace>"  :subid("159_1279564390.79897") :method
.annotate 'line', 3
    new $P565, "ResizablePMCArray"
    push $P565, "s"
    .return ($P565)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block569" :load :anon :subid("160_1279564390.79897")
.annotate 'line', 3
    .const 'Sub' $P571 = "11_1279564390.79897" 
    $P572 = $P571()
    .return ($P572)
.end


.namespace []
.sub "_block574" :load :anon :subid("161_1279564390.79897")
.annotate 'line', 1
    .const 'Sub' $P576 = "10_1279564390.79897" 
    $P577 = $P576()
    .return ($P577)
.end

### .include 'gen/p6regex-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1279564394.02125")
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
    $P1623 = $P14()
.annotate 'line', 1
    .return ($P1623)
    .const 'Sub' $P1625 = "92_1279564394.02125" 
    .return ($P1625)
.end


.namespace []
.sub "" :load :init :subid("post93") :outer("10_1279564394.02125")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1279564394.02125" 
    .local pmc block
    set block, $P12
    $P1628 = get_root_global ["parrot"], "P6metaclass"
    $P1628."new_class"("Regex::P6Regex::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block13"  :subid("11_1279564394.02125") :outer("10_1279564394.02125")
.annotate 'line', 4
    .const 'Sub' $P1571 = "89_1279564394.02125" 
    capture_lex $P1571
    .const 'Sub' $P1551 = "88_1279564394.02125" 
    capture_lex $P1551
    .const 'Sub' $P1519 = "87_1279564394.02125" 
    capture_lex $P1519
    .const 'Sub' $P1450 = "83_1279564394.02125" 
    capture_lex $P1450
    .const 'Sub' $P1382 = "81_1279564394.02125" 
    capture_lex $P1382
    .const 'Sub' $P1339 = "79_1279564394.02125" 
    capture_lex $P1339
    .const 'Sub' $P1325 = "78_1279564394.02125" 
    capture_lex $P1325
    .const 'Sub' $P1301 = "77_1279564394.02125" 
    capture_lex $P1301
    .const 'Sub' $P1283 = "76_1279564394.02125" 
    capture_lex $P1283
    .const 'Sub' $P1269 = "75_1279564394.02125" 
    capture_lex $P1269
    .const 'Sub' $P1256 = "74_1279564394.02125" 
    capture_lex $P1256
    .const 'Sub' $P1225 = "73_1279564394.02125" 
    capture_lex $P1225
    .const 'Sub' $P1194 = "72_1279564394.02125" 
    capture_lex $P1194
    .const 'Sub' $P1178 = "71_1279564394.02125" 
    capture_lex $P1178
    .const 'Sub' $P1162 = "70_1279564394.02125" 
    capture_lex $P1162
    .const 'Sub' $P1146 = "69_1279564394.02125" 
    capture_lex $P1146
    .const 'Sub' $P1130 = "68_1279564394.02125" 
    capture_lex $P1130
    .const 'Sub' $P1114 = "67_1279564394.02125" 
    capture_lex $P1114
    .const 'Sub' $P1098 = "66_1279564394.02125" 
    capture_lex $P1098
    .const 'Sub' $P1082 = "65_1279564394.02125" 
    capture_lex $P1082
    .const 'Sub' $P1058 = "64_1279564394.02125" 
    capture_lex $P1058
    .const 'Sub' $P1043 = "63_1279564394.02125" 
    capture_lex $P1043
    .const 'Sub' $P985 = "62_1279564394.02125" 
    capture_lex $P985
    .const 'Sub' $P964 = "61_1279564394.02125" 
    capture_lex $P964
    .const 'Sub' $P942 = "60_1279564394.02125" 
    capture_lex $P942
    .const 'Sub' $P932 = "59_1279564394.02125" 
    capture_lex $P932
    .const 'Sub' $P922 = "58_1279564394.02125" 
    capture_lex $P922
    .const 'Sub' $P912 = "57_1279564394.02125" 
    capture_lex $P912
    .const 'Sub' $P900 = "56_1279564394.02125" 
    capture_lex $P900
    .const 'Sub' $P888 = "55_1279564394.02125" 
    capture_lex $P888
    .const 'Sub' $P876 = "54_1279564394.02125" 
    capture_lex $P876
    .const 'Sub' $P864 = "53_1279564394.02125" 
    capture_lex $P864
    .const 'Sub' $P852 = "52_1279564394.02125" 
    capture_lex $P852
    .const 'Sub' $P840 = "51_1279564394.02125" 
    capture_lex $P840
    .const 'Sub' $P828 = "50_1279564394.02125" 
    capture_lex $P828
    .const 'Sub' $P816 = "49_1279564394.02125" 
    capture_lex $P816
    .const 'Sub' $P793 = "48_1279564394.02125" 
    capture_lex $P793
    .const 'Sub' $P770 = "47_1279564394.02125" 
    capture_lex $P770
    .const 'Sub' $P752 = "46_1279564394.02125" 
    capture_lex $P752
    .const 'Sub' $P742 = "45_1279564394.02125" 
    capture_lex $P742
    .const 'Sub' $P724 = "44_1279564394.02125" 
    capture_lex $P724
    .const 'Sub' $P651 = "42_1279564394.02125" 
    capture_lex $P651
    .const 'Sub' $P634 = "41_1279564394.02125" 
    capture_lex $P634
    .const 'Sub' $P619 = "40_1279564394.02125" 
    capture_lex $P619
    .const 'Sub' $P604 = "39_1279564394.02125" 
    capture_lex $P604
    .const 'Sub' $P578 = "38_1279564394.02125" 
    capture_lex $P578
    .const 'Sub' $P527 = "36_1279564394.02125" 
    capture_lex $P527
    .const 'Sub' $P459 = "34_1279564394.02125" 
    capture_lex $P459
    .const 'Sub' $P404 = "31_1279564394.02125" 
    capture_lex $P404
    .const 'Sub' $P389 = "30_1279564394.02125" 
    capture_lex $P389
    .const 'Sub' $P363 = "28_1279564394.02125" 
    capture_lex $P363
    .const 'Sub' $P346 = "27_1279564394.02125" 
    capture_lex $P346
    .const 'Sub' $P312 = "26_1279564394.02125" 
    capture_lex $P312
    .const 'Sub' $P57 = "13_1279564394.02125" 
    capture_lex $P57
    .const 'Sub' $P16 = "12_1279564394.02125" 
    capture_lex $P16
    get_global $P15, "@MODIFIERS"
    unless_null $P15, vivify_95
    $P15 = root_new ['parrot';'ResizablePMCArray']
    set_global "@MODIFIERS", $P15
  vivify_95:
.annotate 'line', 487
    .const 'Sub' $P16 = "12_1279564394.02125" 
    newclosure $P56, $P16
    .lex "buildsub", $P56
.annotate 'line', 505
    .const 'Sub' $P57 = "13_1279564394.02125" 
    newclosure $P311, $P57
    .lex "capnames", $P311
.annotate 'line', 571
    .const 'Sub' $P312 = "26_1279564394.02125" 
    newclosure $P344, $P312
    .lex "backmod", $P344
.annotate 'line', 4
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    get_global $P345, "@MODIFIERS"
.annotate 'line', 480
    find_lex $P1548, "buildsub"
    find_lex $P1549, "capnames"
    find_lex $P1550, "backmod"
.annotate 'line', 584
    .const 'Sub' $P1571 = "89_1279564394.02125" 
    newclosure $P1617, $P1571
.annotate 'line', 4
    .return ($P1617)
    .const 'Sub' $P1619 = "91_1279564394.02125" 
    .return ($P1619)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "" :load :init :subid("post94") :outer("11_1279564394.02125")
.annotate 'line', 4
    get_hll_global $P14, ["Regex";"P6Regex";"Actions"], "_block13" 
    .local pmc block
    set block, $P14
.annotate 'line', 7

        $P1622 = new ['ResizablePMCArray']
        $P0 = new ['Hash']
        push $P1622, $P0
    
    set_global "@MODIFIERS", $P1622
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "buildsub"  :subid("12_1279564394.02125") :outer("11_1279564394.02125")
    .param pmc param_19
    .param pmc param_20 :optional
    .param int has_param_20 :opt_flag
.annotate 'line', 487
    new $P18, 'ExceptionHandler'
    set_addr $P18, control_17
    $P18."handle_types"(.CONTROL_RETURN)
    push_eh $P18
    .lex "$rpast", param_19
    if has_param_20, optparam_96
    get_hll_global $P21, ["PAST"], "Block"
    $P22 = $P21."new"()
    set param_20, $P22
  optparam_96:
    .lex "$block", param_20
.annotate 'line', 488
    $P23 = root_new ['parrot';'Hash']
    .lex "%capnames", $P23
    find_lex $P24, "$rpast"
    $P25 = "capnames"($P24, 0)
    store_lex "%capnames", $P25
.annotate 'line', 489
    new $P26, "Integer"
    assign $P26, 0
    find_lex $P27, "%capnames"
    unless_null $P27, vivify_97
    $P27 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P27
  vivify_97:
    set $P27[""], $P26
.annotate 'line', 490
    get_hll_global $P28, ["PAST"], "Regex"
.annotate 'line', 491
    get_hll_global $P29, ["PAST"], "Regex"
    $P30 = $P29."new"("scan" :named("pasttype"))
    find_lex $P31, "$rpast"
.annotate 'line', 493
    get_hll_global $P32, ["PAST"], "Regex"
.annotate 'line', 494
    get_global $P35, "@MODIFIERS"
    unless_null $P35, vivify_98
    $P35 = root_new ['parrot';'ResizablePMCArray']
  vivify_98:
    set $P36, $P35[0]
    unless_null $P36, vivify_99
    $P36 = root_new ['parrot';'Hash']
  vivify_99:
    set $P37, $P36["r"]
    unless_null $P37, vivify_100
    new $P37, "Undef"
  vivify_100:
    if $P37, if_34
    new $P39, "String"
    assign $P39, "g"
    set $P33, $P39
    goto if_34_end
  if_34:
    new $P38, "String"
    assign $P38, "r"
    set $P33, $P38
  if_34_end:
    $P40 = $P32."new"("pass" :named("pasttype"), $P33 :named("backtrack"))
.annotate 'line', 493
    find_lex $P41, "%capnames"
    $P42 = $P28."new"($P30, $P31, $P40, "concat" :named("pasttype"), $P41 :named("capnames"))
.annotate 'line', 490
    store_lex "$rpast", $P42
.annotate 'line', 498
    find_lex $P44, "$block"
    $P45 = $P44."symbol"(unicode:"$\x{a2}")
    if $P45, unless_43_end
    find_lex $P46, "$block"
    $P46."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
  unless_43_end:
.annotate 'line', 499
    find_lex $P48, "$block"
    $P49 = $P48."symbol"("$/")
    if $P49, unless_47_end
    find_lex $P50, "$block"
    $P50."symbol"("$/", "lexical" :named("scope"))
  unless_47_end:
.annotate 'line', 500
    find_lex $P51, "$block"
    find_lex $P52, "$rpast"
    $P51."push"($P52)
.annotate 'line', 501
    find_lex $P53, "$block"
    $P53."blocktype"("method")
    find_lex $P54, "$block"
.annotate 'line', 487
    .return ($P54)
  control_17:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P55, exception, "payload"
    .return ($P55)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "capnames"  :subid("13_1279564394.02125") :outer("11_1279564394.02125")
    .param pmc param_60
    .param pmc param_61
.annotate 'line', 505
    .const 'Sub' $P286 = "24_1279564394.02125" 
    capture_lex $P286
    .const 'Sub' $P223 = "21_1279564394.02125" 
    capture_lex $P223
    .const 'Sub' $P181 = "19_1279564394.02125" 
    capture_lex $P181
    .const 'Sub' $P139 = "17_1279564394.02125" 
    capture_lex $P139
    .const 'Sub' $P72 = "14_1279564394.02125" 
    capture_lex $P72
    new $P59, 'ExceptionHandler'
    set_addr $P59, control_58
    $P59."handle_types"(.CONTROL_RETURN)
    push_eh $P59
    .lex "$ast", param_60
    .lex "$count", param_61
.annotate 'line', 506
    $P62 = root_new ['parrot';'Hash']
    .lex "%capnames", $P62
.annotate 'line', 507
    new $P63, "Undef"
    .lex "$pasttype", $P63
.annotate 'line', 505
    find_lex $P64, "%capnames"
.annotate 'line', 507
    find_lex $P65, "$ast"
    $P66 = $P65."pasttype"()
    store_lex "$pasttype", $P66
.annotate 'line', 508
    find_lex $P68, "$pasttype"
    set $S69, $P68
    iseq $I70, $S69, "alt"
    if $I70, if_67
.annotate 'line', 521
    find_lex $P130, "$pasttype"
    set $S131, $P130
    iseq $I132, $S131, "concat"
    if $I132, if_129
.annotate 'line', 530
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
.annotate 'line', 543
    find_lex $P219, "$pasttype"
    set $S220, $P219
    iseq $I221, $S220, "subcapture"
    if $I221, if_218
.annotate 'line', 560
    find_lex $P282, "$pasttype"
    set $S283, $P282
    iseq $I284, $S283, "quant"
    unless $I284, if_281_end
    .const 'Sub' $P286 = "24_1279564394.02125" 
    capture_lex $P286
    $P286()
  if_281_end:
    goto if_218_end
  if_218:
.annotate 'line', 543
    .const 'Sub' $P223 = "21_1279564394.02125" 
    capture_lex $P223
    $P223()
  if_218_end:
    goto if_171_end
  if_171:
.annotate 'line', 530
    .const 'Sub' $P181 = "19_1279564394.02125" 
    capture_lex $P181
    $P181()
  if_171_end:
    goto if_129_end
  if_129:
.annotate 'line', 522
    find_lex $P134, "$ast"
    $P135 = $P134."list"()
    defined $I136, $P135
    unless $I136, for_undef_121
    iter $P133, $P135
    new $P169, 'ExceptionHandler'
    set_addr $P169, loop168_handler
    $P169."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P169
  loop168_test:
    unless $P133, loop168_done
    shift $P137, $P133
  loop168_redo:
    .const 'Sub' $P139 = "17_1279564394.02125" 
    capture_lex $P139
    $P139($P137)
  loop168_next:
    goto loop168_test
  loop168_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P170, exception, 'type'
    eq $P170, .CONTROL_LOOP_NEXT, loop168_next
    eq $P170, .CONTROL_LOOP_REDO, loop168_redo
  loop168_done:
    pop_eh 
  for_undef_121:
  if_129_end:
.annotate 'line', 521
    goto if_67_end
  if_67:
.annotate 'line', 508
    .const 'Sub' $P72 = "14_1279564394.02125" 
    capture_lex $P72
    $P72()
  if_67_end:
.annotate 'line', 567
    find_lex $P307, "$count"
    find_lex $P308, "%capnames"
    unless_null $P308, vivify_141
    $P308 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P308
  vivify_141:
    set $P308[""], $P307
    find_lex $P309, "%capnames"
.annotate 'line', 505
    .return ($P309)
  control_58:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P310, exception, "payload"
    .return ($P310)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "_block285"  :anon :subid("24_1279564394.02125") :outer("13_1279564394.02125")
.annotate 'line', 560
    .const 'Sub' $P297 = "25_1279564394.02125" 
    capture_lex $P297
.annotate 'line', 561
    $P287 = root_new ['parrot';'Hash']
    .lex "%astcap", $P287
    find_lex $P288, "$ast"
    unless_null $P288, vivify_101
    $P288 = root_new ['parrot';'ResizablePMCArray']
  vivify_101:
    set $P289, $P288[0]
    unless_null $P289, vivify_102
    new $P289, "Undef"
  vivify_102:
    find_lex $P290, "$count"
    $P291 = "capnames"($P289, $P290)
    store_lex "%astcap", $P291
.annotate 'line', 562
    find_lex $P293, "%astcap"
    defined $I294, $P293
    unless $I294, for_undef_103
    iter $P292, $P293
    new $P303, 'ExceptionHandler'
    set_addr $P303, loop302_handler
    $P303."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P303
  loop302_test:
    unless $P292, loop302_done
    shift $P295, $P292
  loop302_redo:
    .const 'Sub' $P297 = "25_1279564394.02125" 
    capture_lex $P297
    $P297($P295)
  loop302_next:
    goto loop302_test
  loop302_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P304, exception, 'type'
    eq $P304, .CONTROL_LOOP_NEXT, loop302_next
    eq $P304, .CONTROL_LOOP_REDO, loop302_redo
  loop302_done:
    pop_eh 
  for_undef_103:
.annotate 'line', 565
    find_lex $P305, "%astcap"
    unless_null $P305, vivify_105
    $P305 = root_new ['parrot';'Hash']
  vivify_105:
    set $P306, $P305[""]
    unless_null $P306, vivify_106
    new $P306, "Undef"
  vivify_106:
    store_lex "$count", $P306
.annotate 'line', 560
    .return ($P306)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block296"  :anon :subid("25_1279564394.02125") :outer("24_1279564394.02125")
    .param pmc param_298
.annotate 'line', 562
    .lex "$_", param_298
.annotate 'line', 563
    new $P299, "Integer"
    assign $P299, 2
    find_lex $P300, "$_"
    find_lex $P301, "%capnames"
    unless_null $P301, vivify_104
    $P301 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P301
  vivify_104:
    set $P301[$P300], $P299
.annotate 'line', 562
    .return ($P299)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "_block222"  :anon :subid("21_1279564394.02125") :outer("13_1279564394.02125")
.annotate 'line', 543
    .const 'Sub' $P263 = "23_1279564394.02125" 
    capture_lex $P263
    .const 'Sub' $P235 = "22_1279564394.02125" 
    capture_lex $P235
.annotate 'line', 544
    new $P224, "Undef"
    .lex "$name", $P224
.annotate 'line', 545
    $P225 = root_new ['parrot';'ResizablePMCArray']
    .lex "@names", $P225
.annotate 'line', 554
    $P226 = root_new ['parrot';'Hash']
    .lex "%x", $P226
.annotate 'line', 544
    find_lex $P227, "$ast"
    $P228 = $P227."name"()
    store_lex "$name", $P228
.annotate 'line', 545

            $P0 = find_lex '$name'
            $S0 = $P0
            $P229 = split '=', $S0
        
    store_lex "@names", $P229
.annotate 'line', 550
    find_lex $P231, "@names"
    defined $I232, $P231
    unless $I232, for_undef_107
    iter $P230, $P231
    new $P252, 'ExceptionHandler'
    set_addr $P252, loop251_handler
    $P252."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P252
  loop251_test:
    unless $P230, loop251_done
    shift $P233, $P230
  loop251_redo:
    .const 'Sub' $P235 = "22_1279564394.02125" 
    capture_lex $P235
    $P235($P233)
  loop251_next:
    goto loop251_test
  loop251_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P253, exception, 'type'
    eq $P253, .CONTROL_LOOP_NEXT, loop251_next
    eq $P253, .CONTROL_LOOP_REDO, loop251_redo
  loop251_done:
    pop_eh 
  for_undef_107:
.annotate 'line', 554
    find_lex $P254, "$ast"
    unless_null $P254, vivify_109
    $P254 = root_new ['parrot';'ResizablePMCArray']
  vivify_109:
    set $P255, $P254[0]
    unless_null $P255, vivify_110
    new $P255, "Undef"
  vivify_110:
    find_lex $P256, "$count"
    $P257 = "capnames"($P255, $P256)
    store_lex "%x", $P257
.annotate 'line', 555
    find_lex $P259, "%x"
    defined $I260, $P259
    unless $I260, for_undef_111
    iter $P258, $P259
    new $P277, 'ExceptionHandler'
    set_addr $P277, loop276_handler
    $P277."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P277
  loop276_test:
    unless $P258, loop276_done
    shift $P261, $P258
  loop276_redo:
    .const 'Sub' $P263 = "23_1279564394.02125" 
    capture_lex $P263
    $P263($P261)
  loop276_next:
    goto loop276_test
  loop276_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P278, exception, 'type'
    eq $P278, .CONTROL_LOOP_NEXT, loop276_next
    eq $P278, .CONTROL_LOOP_REDO, loop276_redo
  loop276_done:
    pop_eh 
  for_undef_111:
.annotate 'line', 558
    find_lex $P279, "%x"
    unless_null $P279, vivify_117
    $P279 = root_new ['parrot';'Hash']
  vivify_117:
    set $P280, $P279[""]
    unless_null $P280, vivify_118
    new $P280, "Undef"
  vivify_118:
    store_lex "$count", $P280
.annotate 'line', 543
    .return ($P280)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block234"  :anon :subid("22_1279564394.02125") :outer("21_1279564394.02125")
    .param pmc param_236
.annotate 'line', 550
    .lex "$_", param_236
.annotate 'line', 551
    find_lex $P240, "$_"
    set $S241, $P240
    iseq $I242, $S241, "0"
    unless $I242, unless_239
    new $P238, 'Integer'
    set $P238, $I242
    goto unless_239_end
  unless_239:
    find_lex $P243, "$_"
    set $N244, $P243
    isgt $I245, $N244, 0.0
    new $P238, 'Integer'
    set $P238, $I245
  unless_239_end:
    unless $P238, if_237_end
    find_lex $P246, "$_"
    add $P247, $P246, 1
    store_lex "$count", $P247
  if_237_end:
.annotate 'line', 552
    new $P248, "Integer"
    assign $P248, 1
    find_lex $P249, "$_"
    find_lex $P250, "%capnames"
    unless_null $P250, vivify_108
    $P250 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P250
  vivify_108:
    set $P250[$P249], $P248
.annotate 'line', 550
    .return ($P248)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block262"  :anon :subid("23_1279564394.02125") :outer("21_1279564394.02125")
    .param pmc param_264
.annotate 'line', 555
    .lex "$_", param_264
.annotate 'line', 556
    find_lex $P265, "$_"
    find_lex $P266, "%capnames"
    unless_null $P266, vivify_112
    $P266 = root_new ['parrot';'Hash']
  vivify_112:
    set $P267, $P266[$P265]
    unless_null $P267, vivify_113
    new $P267, "Undef"
  vivify_113:
    set $N268, $P267
    new $P269, 'Float'
    set $P269, $N268
    find_lex $P270, "$_"
    find_lex $P271, "%x"
    unless_null $P271, vivify_114
    $P271 = root_new ['parrot';'Hash']
  vivify_114:
    set $P272, $P271[$P270]
    unless_null $P272, vivify_115
    new $P272, "Undef"
  vivify_115:
    add $P273, $P269, $P272
    find_lex $P274, "$_"
    find_lex $P275, "%capnames"
    unless_null $P275, vivify_116
    $P275 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P275
  vivify_116:
    set $P275[$P274], $P273
.annotate 'line', 555
    .return ($P273)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "_block180"  :anon :subid("19_1279564394.02125") :outer("13_1279564394.02125")
.annotate 'line', 530
    .const 'Sub' $P199 = "20_1279564394.02125" 
    capture_lex $P199
.annotate 'line', 531
    new $P182, "Undef"
    .lex "$name", $P182
.annotate 'line', 533
    $P183 = root_new ['parrot';'ResizablePMCArray']
    .lex "@names", $P183
.annotate 'line', 531
    find_lex $P184, "$ast"
    $P185 = $P184."name"()
    store_lex "$name", $P185
.annotate 'line', 532
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
.annotate 'line', 533

            $P0 = find_lex '$name'
            $S0 = $P0
            $P193 = split '=', $S0
        
    store_lex "@names", $P193
.annotate 'line', 538
    find_lex $P195, "@names"
    defined $I196, $P195
    unless $I196, for_undef_119
    iter $P194, $P195
    new $P216, 'ExceptionHandler'
    set_addr $P216, loop215_handler
    $P216."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P216
  loop215_test:
    unless $P194, loop215_done
    shift $P197, $P194
  loop215_redo:
    .const 'Sub' $P199 = "20_1279564394.02125" 
    capture_lex $P199
    $P199($P197)
  loop215_next:
    goto loop215_test
  loop215_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P217, exception, 'type'
    eq $P217, .CONTROL_LOOP_NEXT, loop215_next
    eq $P217, .CONTROL_LOOP_REDO, loop215_redo
  loop215_done:
    pop_eh 
  for_undef_119:
.annotate 'line', 530
    .return ($P194)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block198"  :anon :subid("20_1279564394.02125") :outer("19_1279564394.02125")
    .param pmc param_200
.annotate 'line', 538
    .lex "$_", param_200
.annotate 'line', 539
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
    isgt $I209, $N208, 0.0
    new $P202, 'Integer'
    set $P202, $I209
  unless_203_end:
    unless $P202, if_201_end
    find_lex $P210, "$_"
    add $P211, $P210, 1
    store_lex "$count", $P211
  if_201_end:
.annotate 'line', 540
    new $P212, "Integer"
    assign $P212, 1
    find_lex $P213, "$_"
    find_lex $P214, "%capnames"
    unless_null $P214, vivify_120
    $P214 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P214
  vivify_120:
    set $P214[$P213], $P212
.annotate 'line', 538
    .return ($P212)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "_block138"  :anon :subid("17_1279564394.02125") :outer("13_1279564394.02125")
    .param pmc param_141
.annotate 'line', 522
    .const 'Sub' $P150 = "18_1279564394.02125" 
    capture_lex $P150
.annotate 'line', 523
    $P140 = root_new ['parrot';'Hash']
    .lex "%x", $P140
    .lex "$_", param_141
    find_lex $P142, "$_"
    find_lex $P143, "$count"
    $P144 = "capnames"($P142, $P143)
    store_lex "%x", $P144
.annotate 'line', 524
    find_lex $P146, "%x"
    defined $I147, $P146
    unless $I147, for_undef_122
    iter $P145, $P146
    new $P164, 'ExceptionHandler'
    set_addr $P164, loop163_handler
    $P164."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P164
  loop163_test:
    unless $P145, loop163_done
    shift $P148, $P145
  loop163_redo:
    .const 'Sub' $P150 = "18_1279564394.02125" 
    capture_lex $P150
    $P150($P148)
  loop163_next:
    goto loop163_test
  loop163_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P165, exception, 'type'
    eq $P165, .CONTROL_LOOP_NEXT, loop163_next
    eq $P165, .CONTROL_LOOP_REDO, loop163_redo
  loop163_done:
    pop_eh 
  for_undef_122:
.annotate 'line', 527
    find_lex $P166, "%x"
    unless_null $P166, vivify_128
    $P166 = root_new ['parrot';'Hash']
  vivify_128:
    set $P167, $P166[""]
    unless_null $P167, vivify_129
    new $P167, "Undef"
  vivify_129:
    store_lex "$count", $P167
.annotate 'line', 522
    .return ($P167)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block149"  :anon :subid("18_1279564394.02125") :outer("17_1279564394.02125")
    .param pmc param_151
.annotate 'line', 524
    .lex "$_", param_151
.annotate 'line', 525
    find_lex $P152, "$_"
    find_lex $P153, "%capnames"
    unless_null $P153, vivify_123
    $P153 = root_new ['parrot';'Hash']
  vivify_123:
    set $P154, $P153[$P152]
    unless_null $P154, vivify_124
    new $P154, "Undef"
  vivify_124:
    set $N155, $P154
    new $P156, 'Float'
    set $P156, $N155
    find_lex $P157, "$_"
    find_lex $P158, "%x"
    unless_null $P158, vivify_125
    $P158 = root_new ['parrot';'Hash']
  vivify_125:
    set $P159, $P158[$P157]
    unless_null $P159, vivify_126
    new $P159, "Undef"
  vivify_126:
    add $P160, $P156, $P159
    find_lex $P161, "$_"
    find_lex $P162, "%capnames"
    unless_null $P162, vivify_127
    $P162 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P162
  vivify_127:
    set $P162[$P161], $P160
.annotate 'line', 524
    .return ($P160)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "_block71"  :anon :subid("14_1279564394.02125") :outer("13_1279564394.02125")
.annotate 'line', 508
    .const 'Sub' $P81 = "15_1279564394.02125" 
    capture_lex $P81
.annotate 'line', 509
    new $P73, "Undef"
    .lex "$max", $P73
    find_lex $P74, "$count"
    store_lex "$max", $P74
.annotate 'line', 510
    find_lex $P76, "$ast"
    $P77 = $P76."list"()
    defined $I78, $P77
    unless $I78, for_undef_130
    iter $P75, $P77
    new $P126, 'ExceptionHandler'
    set_addr $P126, loop125_handler
    $P126."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P126
  loop125_test:
    unless $P75, loop125_done
    shift $P79, $P75
  loop125_redo:
    .const 'Sub' $P81 = "15_1279564394.02125" 
    capture_lex $P81
    $P81($P79)
  loop125_next:
    goto loop125_test
  loop125_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P127, exception, 'type'
    eq $P127, .CONTROL_LOOP_NEXT, loop125_next
    eq $P127, .CONTROL_LOOP_REDO, loop125_redo
  loop125_done:
    pop_eh 
  for_undef_130:
.annotate 'line', 519
    find_lex $P128, "$max"
    store_lex "$count", $P128
.annotate 'line', 508
    .return ($P128)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "_block80"  :anon :subid("15_1279564394.02125") :outer("14_1279564394.02125")
    .param pmc param_83
.annotate 'line', 510
    .const 'Sub' $P92 = "16_1279564394.02125" 
    capture_lex $P92
.annotate 'line', 511
    $P82 = root_new ['parrot';'Hash']
    .lex "%x", $P82
    .lex "$_", param_83
    find_lex $P84, "$_"
    find_lex $P85, "$count"
    $P86 = "capnames"($P84, $P85)
    store_lex "%x", $P86
.annotate 'line', 512
    find_lex $P88, "%x"
    defined $I89, $P88
    unless $I89, for_undef_131
    iter $P87, $P88
    new $P113, 'ExceptionHandler'
    set_addr $P113, loop112_handler
    $P113."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P113
  loop112_test:
    unless $P87, loop112_done
    shift $P90, $P87
  loop112_redo:
    .const 'Sub' $P92 = "16_1279564394.02125" 
    capture_lex $P92
    $P92($P90)
  loop112_next:
    goto loop112_test
  loop112_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, 'type'
    eq $P114, .CONTROL_LOOP_NEXT, loop112_next
    eq $P114, .CONTROL_LOOP_REDO, loop112_redo
  loop112_done:
    pop_eh 
  for_undef_131:
.annotate 'line', 517
    find_lex $P117, "%x"
    unless_null $P117, vivify_137
    $P117 = root_new ['parrot';'Hash']
  vivify_137:
    set $P118, $P117[""]
    unless_null $P118, vivify_138
    new $P118, "Undef"
  vivify_138:
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
    unless_null $P123, vivify_139
    $P123 = root_new ['parrot';'Hash']
  vivify_139:
    set $P124, $P123[""]
    unless_null $P124, vivify_140
    new $P124, "Undef"
  vivify_140:
    store_lex "$max", $P124
    set $P115, $P124
  if_116_end:
.annotate 'line', 510
    .return ($P115)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block91"  :anon :subid("16_1279564394.02125") :outer("15_1279564394.02125")
    .param pmc param_93
.annotate 'line', 512
    .lex "$_", param_93
.annotate 'line', 513
    find_lex $P98, "$_"
    find_lex $P99, "%capnames"
    unless_null $P99, vivify_132
    $P99 = root_new ['parrot';'Hash']
  vivify_132:
    set $P100, $P99[$P98]
    unless_null $P100, vivify_133
    new $P100, "Undef"
  vivify_133:
    set $N101, $P100
    islt $I102, $N101, 2.0
    if $I102, if_97
    new $P96, 'Integer'
    set $P96, $I102
    goto if_97_end
  if_97:
    find_lex $P103, "$_"
    find_lex $P104, "%x"
    unless_null $P104, vivify_134
    $P104 = root_new ['parrot';'Hash']
  vivify_134:
    set $P105, $P104[$P103]
    unless_null $P105, vivify_135
    new $P105, "Undef"
  vivify_135:
    set $N106, $P105
    iseq $I107, $N106, 1.0
    new $P96, 'Integer'
    set $P96, $I107
  if_97_end:
    if $P96, if_95
    new $P109, "Integer"
    assign $P109, 2
    set $P94, $P109
    goto if_95_end
  if_95:
    new $P108, "Integer"
    assign $P108, 1
    set $P94, $P108
  if_95_end:
.annotate 'line', 514
    find_lex $P110, "$_"
    find_lex $P111, "%capnames"
    unless_null $P111, vivify_136
    $P111 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P111
  vivify_136:
    set $P111[$P110], $P94
.annotate 'line', 512
    .return ($P94)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backmod"  :subid("26_1279564394.02125") :outer("11_1279564394.02125")
    .param pmc param_315
    .param pmc param_316
.annotate 'line', 571
    new $P314, 'ExceptionHandler'
    set_addr $P314, control_313
    $P314."handle_types"(.CONTROL_RETURN)
    push_eh $P314
    .lex "$ast", param_315
    .lex "$backmod", param_316
.annotate 'line', 572
    find_lex $P318, "$backmod"
    set $S319, $P318
    iseq $I320, $S319, ":"
    if $I320, if_317
.annotate 'line', 573
    find_lex $P325, "$backmod"
    set $S326, $P325
    iseq $I327, $S326, ":?"
    unless $I327, unless_324
    new $P323, 'Integer'
    set $P323, $I327
    goto unless_324_end
  unless_324:
    find_lex $P328, "$backmod"
    set $S329, $P328
    iseq $I330, $S329, "?"
    new $P323, 'Integer'
    set $P323, $I330
  unless_324_end:
    if $P323, if_322
.annotate 'line', 574
    find_lex $P335, "$backmod"
    set $S336, $P335
    iseq $I337, $S336, ":!"
    unless $I337, unless_334
    new $P333, 'Integer'
    set $P333, $I337
    goto unless_334_end
  unless_334:
    find_lex $P338, "$backmod"
    set $S339, $P338
    iseq $I340, $S339, "!"
    new $P333, 'Integer'
    set $P333, $I340
  unless_334_end:
    unless $P333, if_332_end
    find_lex $P341, "$ast"
    $P341."backtrack"("g")
  if_332_end:
    goto if_322_end
  if_322:
.annotate 'line', 573
    find_lex $P331, "$ast"
    $P331."backtrack"("f")
  if_322_end:
    goto if_317_end
  if_317:
.annotate 'line', 572
    find_lex $P321, "$ast"
    $P321."backtrack"("r")
  if_317_end:
    find_lex $P342, "$ast"
.annotate 'line', 571
    .return ($P342)
  control_313:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P343, exception, "payload"
    .return ($P343)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "arg"  :subid("27_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_349
.annotate 'line', 14
    new $P348, 'ExceptionHandler'
    set_addr $P348, control_347
    $P348."handle_types"(.CONTROL_RETURN)
    push_eh $P348
    .lex "self", self
    .lex "$/", param_349
.annotate 'line', 15
    find_lex $P350, "$/"
    find_lex $P353, "$/"
    unless_null $P353, vivify_142
    $P353 = root_new ['parrot';'Hash']
  vivify_142:
    set $P354, $P353["quote_EXPR"]
    unless_null $P354, vivify_143
    new $P354, "Undef"
  vivify_143:
    if $P354, if_352
    find_lex $P358, "$/"
    unless_null $P358, vivify_144
    $P358 = root_new ['parrot';'Hash']
  vivify_144:
    set $P359, $P358["val"]
    unless_null $P359, vivify_145
    new $P359, "Undef"
  vivify_145:
    set $N360, $P359
    new $P351, 'Float'
    set $P351, $N360
    goto if_352_end
  if_352:
    find_lex $P355, "$/"
    unless_null $P355, vivify_146
    $P355 = root_new ['parrot';'Hash']
  vivify_146:
    set $P356, $P355["quote_EXPR"]
    unless_null $P356, vivify_147
    new $P356, "Undef"
  vivify_147:
    $P357 = $P356."ast"()
    set $P351, $P357
  if_352_end:
    $P361 = $P350."!make"($P351)
.annotate 'line', 14
    .return ($P361)
  control_347:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P362, exception, "payload"
    .return ($P362)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "arglist"  :subid("28_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_366
.annotate 'line', 18
    .const 'Sub' $P376 = "29_1279564394.02125" 
    capture_lex $P376
    new $P365, 'ExceptionHandler'
    set_addr $P365, control_364
    $P365."handle_types"(.CONTROL_RETURN)
    push_eh $P365
    .lex "self", self
    .lex "$/", param_366
.annotate 'line', 19
    new $P367, "Undef"
    .lex "$past", $P367
    get_hll_global $P368, ["PAST"], "Op"
    $P369 = $P368."new"("list" :named("pasttype"))
    store_lex "$past", $P369
.annotate 'line', 20
    find_lex $P371, "$/"
    unless_null $P371, vivify_148
    $P371 = root_new ['parrot';'Hash']
  vivify_148:
    set $P372, $P371["arg"]
    unless_null $P372, vivify_149
    new $P372, "Undef"
  vivify_149:
    defined $I373, $P372
    unless $I373, for_undef_150
    iter $P370, $P372
    new $P383, 'ExceptionHandler'
    set_addr $P383, loop382_handler
    $P383."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P383
  loop382_test:
    unless $P370, loop382_done
    shift $P374, $P370
  loop382_redo:
    .const 'Sub' $P376 = "29_1279564394.02125" 
    capture_lex $P376
    $P376($P374)
  loop382_next:
    goto loop382_test
  loop382_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P384, exception, 'type'
    eq $P384, .CONTROL_LOOP_NEXT, loop382_next
    eq $P384, .CONTROL_LOOP_REDO, loop382_redo
  loop382_done:
    pop_eh 
  for_undef_150:
.annotate 'line', 21
    find_lex $P385, "$/"
    find_lex $P386, "$past"
    $P387 = $P385."!make"($P386)
.annotate 'line', 18
    .return ($P387)
  control_364:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P388, exception, "payload"
    .return ($P388)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block375"  :anon :subid("29_1279564394.02125") :outer("28_1279564394.02125")
    .param pmc param_377
.annotate 'line', 20
    .lex "$_", param_377
    find_lex $P378, "$past"
    find_lex $P379, "$_"
    $P380 = $P379."ast"()
    $P381 = $P378."push"($P380)
    .return ($P381)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "TOP"  :subid("30_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_392
.annotate 'line', 24
    new $P391, 'ExceptionHandler'
    set_addr $P391, control_390
    $P391."handle_types"(.CONTROL_RETURN)
    push_eh $P391
    .lex "self", self
    .lex "$/", param_392
.annotate 'line', 25
    new $P393, "Undef"
    .lex "$past", $P393
    find_lex $P394, "$/"
    unless_null $P394, vivify_151
    $P394 = root_new ['parrot';'Hash']
  vivify_151:
    set $P395, $P394["nibbler"]
    unless_null $P395, vivify_152
    new $P395, "Undef"
  vivify_152:
    $P396 = $P395."ast"()
    $P397 = "buildsub"($P396)
    store_lex "$past", $P397
.annotate 'line', 26
    find_lex $P398, "$past"
    find_lex $P399, "$/"
    $P398."node"($P399)
.annotate 'line', 27
    find_lex $P400, "$/"
    find_lex $P401, "$past"
    $P402 = $P400."!make"($P401)
.annotate 'line', 24
    .return ($P402)
  control_390:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P403, exception, "payload"
    .return ($P403)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "nibbler"  :subid("31_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_407
    .param pmc param_408 :optional
    .param int has_param_408 :opt_flag
.annotate 'line', 30
    .const 'Sub' $P442 = "33_1279564394.02125" 
    capture_lex $P442
    .const 'Sub' $P416 = "32_1279564394.02125" 
    capture_lex $P416
    new $P406, 'ExceptionHandler'
    set_addr $P406, control_405
    $P406."handle_types"(.CONTROL_RETURN)
    push_eh $P406
    .lex "self", self
    .lex "$/", param_407
    if has_param_408, optparam_153
    new $P409, "Undef"
    set param_408, $P409
  optparam_153:
    .lex "$key", param_408
.annotate 'line', 42
    new $P410, "Undef"
    .lex "$past", $P410
.annotate 'line', 31
    find_lex $P412, "$key"
    set $S413, $P412
    iseq $I414, $S413, "open"
    unless $I414, if_411_end
    .const 'Sub' $P416 = "32_1279564394.02125" 
    capture_lex $P416
    $P416()
  if_411_end:
.annotate 'line', 41
    get_global $P426, "@MODIFIERS"
    $P426."shift"()
    find_lex $P427, "$past"
.annotate 'line', 43
    find_lex $P429, "$/"
    unless_null $P429, vivify_156
    $P429 = root_new ['parrot';'Hash']
  vivify_156:
    set $P430, $P429["termish"]
    unless_null $P430, vivify_157
    new $P430, "Undef"
  vivify_157:
    set $N431, $P430
    isgt $I432, $N431, 1.0
    if $I432, if_428
.annotate 'line', 50
    find_lex $P451, "$/"
    unless_null $P451, vivify_158
    $P451 = root_new ['parrot';'Hash']
  vivify_158:
    set $P452, $P451["termish"]
    unless_null $P452, vivify_159
    $P452 = root_new ['parrot';'ResizablePMCArray']
  vivify_159:
    set $P453, $P452[0]
    unless_null $P453, vivify_160
    new $P453, "Undef"
  vivify_160:
    $P454 = $P453."ast"()
    store_lex "$past", $P454
.annotate 'line', 49
    goto if_428_end
  if_428:
.annotate 'line', 44
    get_hll_global $P433, ["PAST"], "Regex"
    find_lex $P434, "$/"
    $P435 = $P433."new"("alt" :named("pasttype"), $P434 :named("node"))
    store_lex "$past", $P435
.annotate 'line', 45
    find_lex $P437, "$/"
    unless_null $P437, vivify_161
    $P437 = root_new ['parrot';'Hash']
  vivify_161:
    set $P438, $P437["termish"]
    unless_null $P438, vivify_162
    new $P438, "Undef"
  vivify_162:
    defined $I439, $P438
    unless $I439, for_undef_163
    iter $P436, $P438
    new $P449, 'ExceptionHandler'
    set_addr $P449, loop448_handler
    $P449."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P449
  loop448_test:
    unless $P436, loop448_done
    shift $P440, $P436
  loop448_redo:
    .const 'Sub' $P442 = "33_1279564394.02125" 
    capture_lex $P442
    $P442($P440)
  loop448_next:
    goto loop448_test
  loop448_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P450, exception, 'type'
    eq $P450, .CONTROL_LOOP_NEXT, loop448_next
    eq $P450, .CONTROL_LOOP_REDO, loop448_redo
  loop448_done:
    pop_eh 
  for_undef_163:
  if_428_end:
.annotate 'line', 52
    find_lex $P455, "$/"
    find_lex $P456, "$past"
    $P457 = $P455."!make"($P456)
.annotate 'line', 30
    .return ($P457)
  control_405:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P458, exception, "payload"
    .return ($P458)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "_block415"  :anon :subid("32_1279564394.02125") :outer("31_1279564394.02125")
.annotate 'line', 32
    $P417 = root_new ['parrot';'Hash']
    .lex "%old", $P417
.annotate 'line', 33
    $P418 = root_new ['parrot';'Hash']
    .lex "%new", $P418
.annotate 'line', 32
    get_global $P419, "@MODIFIERS"
    unless_null $P419, vivify_154
    $P419 = root_new ['parrot';'ResizablePMCArray']
  vivify_154:
    set $P420, $P419[0]
    unless_null $P420, vivify_155
    new $P420, "Undef"
  vivify_155:
    store_lex "%old", $P420
.annotate 'line', 33

                       $P0 = find_lex '%old'
                       $P421 = clone $P0
                   
    store_lex "%new", $P421
.annotate 'line', 37
    get_global $P422, "@MODIFIERS"
    find_lex $P423, "%new"
    $P422."unshift"($P423)
.annotate 'line', 38
    new $P424, "Exception"
    set $P424['type'], .CONTROL_RETURN
    new $P425, "Integer"
    assign $P425, 1
    setattribute $P424, 'payload', $P425
    throw $P424
.annotate 'line', 31
    .return ()
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block441"  :anon :subid("33_1279564394.02125") :outer("31_1279564394.02125")
    .param pmc param_443
.annotate 'line', 45
    .lex "$_", param_443
.annotate 'line', 46
    find_lex $P444, "$past"
    find_lex $P445, "$_"
    $P446 = $P445."ast"()
    $P447 = $P444."push"($P446)
.annotate 'line', 45
    .return ($P447)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "termish"  :subid("34_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_462
.annotate 'line', 55
    .const 'Sub' $P475 = "35_1279564394.02125" 
    capture_lex $P475
    new $P461, 'ExceptionHandler'
    set_addr $P461, control_460
    $P461."handle_types"(.CONTROL_RETURN)
    push_eh $P461
    .lex "self", self
    .lex "$/", param_462
.annotate 'line', 56
    new $P463, "Undef"
    .lex "$past", $P463
.annotate 'line', 57
    new $P464, "Undef"
    .lex "$lastlit", $P464
.annotate 'line', 56
    get_hll_global $P465, ["PAST"], "Regex"
    find_lex $P466, "$/"
    $P467 = $P465."new"("concat" :named("pasttype"), $P466 :named("node"))
    store_lex "$past", $P467
.annotate 'line', 57
    new $P468, "Integer"
    assign $P468, 0
    store_lex "$lastlit", $P468
.annotate 'line', 58
    find_lex $P470, "$/"
    unless_null $P470, vivify_164
    $P470 = root_new ['parrot';'Hash']
  vivify_164:
    set $P471, $P470["noun"]
    unless_null $P471, vivify_165
    new $P471, "Undef"
  vivify_165:
    defined $I472, $P471
    unless $I472, for_undef_166
    iter $P469, $P471
    new $P521, 'ExceptionHandler'
    set_addr $P521, loop520_handler
    $P521."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P521
  loop520_test:
    unless $P469, loop520_done
    shift $P473, $P469
  loop520_redo:
    .const 'Sub' $P475 = "35_1279564394.02125" 
    capture_lex $P475
    $P475($P473)
  loop520_next:
    goto loop520_test
  loop520_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P522, exception, 'type'
    eq $P522, .CONTROL_LOOP_NEXT, loop520_next
    eq $P522, .CONTROL_LOOP_REDO, loop520_redo
  loop520_done:
    pop_eh 
  for_undef_166:
.annotate 'line', 73
    find_lex $P523, "$/"
    find_lex $P524, "$past"
    $P525 = $P523."!make"($P524)
.annotate 'line', 55
    .return ($P525)
  control_460:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P526, exception, "payload"
    .return ($P526)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block474"  :anon :subid("35_1279564394.02125") :outer("34_1279564394.02125")
    .param pmc param_477
.annotate 'line', 59
    new $P476, "Undef"
    .lex "$ast", $P476
    .lex "$_", param_477
    find_lex $P478, "$_"
    $P479 = $P478."ast"()
    store_lex "$ast", $P479
.annotate 'line', 60
    find_lex $P482, "$ast"
    if $P482, if_481
    set $P480, $P482
    goto if_481_end
  if_481:
.annotate 'line', 61
    find_lex $P489, "$lastlit"
    if $P489, if_488
    set $P487, $P489
    goto if_488_end
  if_488:
    find_lex $P490, "$ast"
    $S491 = $P490."pasttype"()
    iseq $I492, $S491, "literal"
    new $P487, 'Integer'
    set $P487, $I492
  if_488_end:
    if $P487, if_486
    set $P485, $P487
    goto if_486_end
  if_486:
.annotate 'line', 62
    get_hll_global $P493, ["PAST"], "Node"
    find_lex $P494, "$ast"
    unless_null $P494, vivify_167
    $P494 = root_new ['parrot';'ResizablePMCArray']
  vivify_167:
    set $P495, $P494[0]
    unless_null $P495, vivify_168
    new $P495, "Undef"
  vivify_168:
    $P496 = $P493."ACCEPTS"($P495)
    isfalse $I497, $P496
    new $P485, 'Integer'
    set $P485, $I497
  if_486_end:
    if $P485, if_484
.annotate 'line', 66
    find_lex $P504, "$past"
    find_lex $P505, "$ast"
    $P504."push"($P505)
.annotate 'line', 67
    find_lex $P510, "$ast"
    $S511 = $P510."pasttype"()
    iseq $I512, $S511, "literal"
    if $I512, if_509
    new $P508, 'Integer'
    set $P508, $I512
    goto if_509_end
  if_509:
.annotate 'line', 68
    get_hll_global $P513, ["PAST"], "Node"
    find_lex $P514, "$ast"
    unless_null $P514, vivify_169
    $P514 = root_new ['parrot';'ResizablePMCArray']
  vivify_169:
    set $P515, $P514[0]
    unless_null $P515, vivify_170
    new $P515, "Undef"
  vivify_170:
    $P516 = $P513."ACCEPTS"($P515)
    isfalse $I517, $P516
    new $P508, 'Integer'
    set $P508, $I517
  if_509_end:
    if $P508, if_507
    new $P519, "Integer"
    assign $P519, 0
    set $P506, $P519
    goto if_507_end
  if_507:
    find_lex $P518, "$ast"
    set $P506, $P518
  if_507_end:
.annotate 'line', 69
    store_lex "$lastlit", $P506
.annotate 'line', 65
    set $P483, $P506
.annotate 'line', 62
    goto if_484_end
  if_484:
.annotate 'line', 63
    find_lex $P498, "$lastlit"
    unless_null $P498, vivify_171
    $P498 = root_new ['parrot';'ResizablePMCArray']
  vivify_171:
    set $P499, $P498[0]
    unless_null $P499, vivify_172
    new $P499, "Undef"
  vivify_172:
    find_lex $P500, "$ast"
    unless_null $P500, vivify_173
    $P500 = root_new ['parrot';'ResizablePMCArray']
  vivify_173:
    set $P501, $P500[0]
    unless_null $P501, vivify_174
    new $P501, "Undef"
  vivify_174:
    concat $P502, $P499, $P501
    find_lex $P503, "$lastlit"
    unless_null $P503, vivify_175
    $P503 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$lastlit", $P503
  vivify_175:
    set $P503[0], $P502
.annotate 'line', 62
    set $P483, $P502
  if_484_end:
.annotate 'line', 60
    set $P480, $P483
  if_481_end:
.annotate 'line', 58
    .return ($P480)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "quantified_atom"  :subid("36_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_530
.annotate 'line', 76
    .const 'Sub' $P539 = "37_1279564394.02125" 
    capture_lex $P539
    new $P529, 'ExceptionHandler'
    set_addr $P529, control_528
    $P529."handle_types"(.CONTROL_RETURN)
    push_eh $P529
    .lex "self", self
    .lex "$/", param_530
.annotate 'line', 77
    new $P531, "Undef"
    .lex "$past", $P531
    find_lex $P532, "$/"
    unless_null $P532, vivify_176
    $P532 = root_new ['parrot';'Hash']
  vivify_176:
    set $P533, $P532["atom"]
    unless_null $P533, vivify_177
    new $P533, "Undef"
  vivify_177:
    $P534 = $P533."ast"()
    store_lex "$past", $P534
.annotate 'line', 78
    find_lex $P536, "$/"
    unless_null $P536, vivify_178
    $P536 = root_new ['parrot';'Hash']
  vivify_178:
    set $P537, $P536["quantifier"]
    unless_null $P537, vivify_179
    new $P537, "Undef"
  vivify_179:
    if $P537, if_535
.annotate 'line', 84
    find_lex $P554, "$/"
    unless_null $P554, vivify_180
    $P554 = root_new ['parrot';'Hash']
  vivify_180:
    set $P555, $P554["backmod"]
    unless_null $P555, vivify_181
    $P555 = root_new ['parrot';'ResizablePMCArray']
  vivify_181:
    set $P556, $P555[0]
    unless_null $P556, vivify_182
    new $P556, "Undef"
  vivify_182:
    unless $P556, if_553_end
    find_lex $P557, "$past"
    find_lex $P558, "$/"
    unless_null $P558, vivify_183
    $P558 = root_new ['parrot';'Hash']
  vivify_183:
    set $P559, $P558["backmod"]
    unless_null $P559, vivify_184
    $P559 = root_new ['parrot';'ResizablePMCArray']
  vivify_184:
    set $P560, $P559[0]
    unless_null $P560, vivify_185
    new $P560, "Undef"
  vivify_185:
    "backmod"($P557, $P560)
  if_553_end:
    goto if_535_end
  if_535:
.annotate 'line', 78
    .const 'Sub' $P539 = "37_1279564394.02125" 
    capture_lex $P539
    $P539()
  if_535_end:
.annotate 'line', 85
    find_lex $P566, "$past"
    if $P566, if_565
    set $P564, $P566
    goto if_565_end
  if_565:
    find_lex $P567, "$past"
    $P568 = $P567."backtrack"()
    isfalse $I569, $P568
    new $P564, 'Integer'
    set $P564, $I569
  if_565_end:
    if $P564, if_563
    set $P562, $P564
    goto if_563_end
  if_563:
    get_global $P570, "@MODIFIERS"
    unless_null $P570, vivify_189
    $P570 = root_new ['parrot';'ResizablePMCArray']
  vivify_189:
    set $P571, $P570[0]
    unless_null $P571, vivify_190
    $P571 = root_new ['parrot';'Hash']
  vivify_190:
    set $P572, $P571["r"]
    unless_null $P572, vivify_191
    new $P572, "Undef"
  vivify_191:
    set $P562, $P572
  if_563_end:
    unless $P562, if_561_end
.annotate 'line', 86
    find_lex $P573, "$past"
    $P573."backtrack"("r")
  if_561_end:
.annotate 'line', 88
    find_lex $P574, "$/"
    find_lex $P575, "$past"
    $P576 = $P574."!make"($P575)
.annotate 'line', 76
    .return ($P576)
  control_528:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P577, exception, "payload"
    .return ($P577)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block538"  :anon :subid("37_1279564394.02125") :outer("36_1279564394.02125")
.annotate 'line', 80
    new $P540, "Undef"
    .lex "$qast", $P540
.annotate 'line', 79
    find_lex $P542, "$past"
    isfalse $I543, $P542
    unless $I543, if_541_end
    find_lex $P544, "$/"
    $P545 = $P544."CURSOR"()
    $P545."panic"("Quantifier follows nothing")
  if_541_end:
.annotate 'line', 80
    find_lex $P546, "$/"
    unless_null $P546, vivify_186
    $P546 = root_new ['parrot';'Hash']
  vivify_186:
    set $P547, $P546["quantifier"]
    unless_null $P547, vivify_187
    $P547 = root_new ['parrot';'ResizablePMCArray']
  vivify_187:
    set $P548, $P547[0]
    unless_null $P548, vivify_188
    new $P548, "Undef"
  vivify_188:
    $P549 = $P548."ast"()
    store_lex "$qast", $P549
.annotate 'line', 81
    find_lex $P550, "$qast"
    find_lex $P551, "$past"
    $P550."unshift"($P551)
.annotate 'line', 82
    find_lex $P552, "$qast"
    store_lex "$past", $P552
.annotate 'line', 78
    .return ($P552)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "atom"  :subid("38_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_581
.annotate 'line', 91
    new $P580, 'ExceptionHandler'
    set_addr $P580, control_579
    $P580."handle_types"(.CONTROL_RETURN)
    push_eh $P580
    .lex "self", self
    .lex "$/", param_581
.annotate 'line', 92
    new $P582, "Undef"
    .lex "$past", $P582
.annotate 'line', 91
    find_lex $P583, "$past"
.annotate 'line', 93
    find_lex $P585, "$/"
    unless_null $P585, vivify_192
    $P585 = root_new ['parrot';'Hash']
  vivify_192:
    set $P586, $P585["metachar"]
    unless_null $P586, vivify_193
    new $P586, "Undef"
  vivify_193:
    if $P586, if_584
.annotate 'line', 95
    get_hll_global $P590, ["PAST"], "Regex"
    find_lex $P591, "$/"
    set $S592, $P591
    find_lex $P593, "$/"
    $P594 = $P590."new"($S592, "literal" :named("pasttype"), $P593 :named("node"))
    store_lex "$past", $P594
.annotate 'line', 96
    get_global $P596, "@MODIFIERS"
    unless_null $P596, vivify_194
    $P596 = root_new ['parrot';'ResizablePMCArray']
  vivify_194:
    set $P597, $P596[0]
    unless_null $P597, vivify_195
    $P597 = root_new ['parrot';'Hash']
  vivify_195:
    set $P598, $P597["i"]
    unless_null $P598, vivify_196
    new $P598, "Undef"
  vivify_196:
    unless $P598, if_595_end
    find_lex $P599, "$past"
    $P599."subtype"("ignorecase")
  if_595_end:
.annotate 'line', 94
    goto if_584_end
  if_584:
.annotate 'line', 93
    find_lex $P587, "$/"
    unless_null $P587, vivify_197
    $P587 = root_new ['parrot';'Hash']
  vivify_197:
    set $P588, $P587["metachar"]
    unless_null $P588, vivify_198
    new $P588, "Undef"
  vivify_198:
    $P589 = $P588."ast"()
    store_lex "$past", $P589
  if_584_end:
.annotate 'line', 98
    find_lex $P600, "$/"
    find_lex $P601, "$past"
    $P602 = $P600."!make"($P601)
.annotate 'line', 91
    .return ($P602)
  control_579:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P603, exception, "payload"
    .return ($P603)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "quantifier:sym<*>"  :subid("39_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_607
.annotate 'line', 101
    new $P606, 'ExceptionHandler'
    set_addr $P606, control_605
    $P606."handle_types"(.CONTROL_RETURN)
    push_eh $P606
    .lex "self", self
    .lex "$/", param_607
.annotate 'line', 102
    new $P608, "Undef"
    .lex "$past", $P608
    get_hll_global $P609, ["PAST"], "Regex"
    find_lex $P610, "$/"
    $P611 = $P609."new"("quant" :named("pasttype"), $P610 :named("node"))
    store_lex "$past", $P611
.annotate 'line', 103
    find_lex $P612, "$/"
    find_lex $P613, "$past"
    find_lex $P614, "$/"
    unless_null $P614, vivify_199
    $P614 = root_new ['parrot';'Hash']
  vivify_199:
    set $P615, $P614["backmod"]
    unless_null $P615, vivify_200
    new $P615, "Undef"
  vivify_200:
    $P616 = "backmod"($P613, $P615)
    $P617 = $P612."!make"($P616)
.annotate 'line', 101
    .return ($P617)
  control_605:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P618, exception, "payload"
    .return ($P618)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "quantifier:sym<+>"  :subid("40_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_622
.annotate 'line', 106
    new $P621, 'ExceptionHandler'
    set_addr $P621, control_620
    $P621."handle_types"(.CONTROL_RETURN)
    push_eh $P621
    .lex "self", self
    .lex "$/", param_622
.annotate 'line', 107
    new $P623, "Undef"
    .lex "$past", $P623
    get_hll_global $P624, ["PAST"], "Regex"
    find_lex $P625, "$/"
    $P626 = $P624."new"("quant" :named("pasttype"), 1 :named("min"), $P625 :named("node"))
    store_lex "$past", $P626
.annotate 'line', 108
    find_lex $P627, "$/"
    find_lex $P628, "$past"
    find_lex $P629, "$/"
    unless_null $P629, vivify_201
    $P629 = root_new ['parrot';'Hash']
  vivify_201:
    set $P630, $P629["backmod"]
    unless_null $P630, vivify_202
    new $P630, "Undef"
  vivify_202:
    $P631 = "backmod"($P628, $P630)
    $P632 = $P627."!make"($P631)
.annotate 'line', 106
    .return ($P632)
  control_620:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P633, exception, "payload"
    .return ($P633)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "quantifier:sym<?>"  :subid("41_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_637
.annotate 'line', 111
    new $P636, 'ExceptionHandler'
    set_addr $P636, control_635
    $P636."handle_types"(.CONTROL_RETURN)
    push_eh $P636
    .lex "self", self
    .lex "$/", param_637
.annotate 'line', 112
    new $P638, "Undef"
    .lex "$past", $P638
    get_hll_global $P639, ["PAST"], "Regex"
    find_lex $P640, "$/"
    $P641 = $P639."new"("quant" :named("pasttype"), 0 :named("min"), 1 :named("max"), $P640 :named("node"))
    store_lex "$past", $P641
.annotate 'line', 113
    find_lex $P642, "$/"
    find_lex $P643, "$past"
    find_lex $P644, "$/"
    unless_null $P644, vivify_203
    $P644 = root_new ['parrot';'Hash']
  vivify_203:
    set $P645, $P644["backmod"]
    unless_null $P645, vivify_204
    new $P645, "Undef"
  vivify_204:
    $P646 = "backmod"($P643, $P645)
    $P642."!make"($P646)
.annotate 'line', 114
    find_lex $P647, "$/"
    find_lex $P648, "$past"
    $P649 = $P647."!make"($P648)
.annotate 'line', 111
    .return ($P649)
  control_635:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P650, exception, "payload"
    .return ($P650)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "quantifier:sym<**>"  :subid("42_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_654
.annotate 'line', 117
    .const 'Sub' $P669 = "43_1279564394.02125" 
    capture_lex $P669
    new $P653, 'ExceptionHandler'
    set_addr $P653, control_652
    $P653."handle_types"(.CONTROL_RETURN)
    push_eh $P653
    .lex "self", self
    .lex "$/", param_654
.annotate 'line', 118
    new $P655, "Undef"
    .lex "$past", $P655
.annotate 'line', 119
    new $P656, "Undef"
    .lex "$ws", $P656
.annotate 'line', 117
    find_lex $P657, "$past"
.annotate 'line', 119
    find_lex $P660, "$/"
    unless_null $P660, vivify_205
    $P660 = root_new ['parrot';'Hash']
  vivify_205:
    set $P661, $P660["normspace"]
    unless_null $P661, vivify_206
    new $P661, "Undef"
  vivify_206:
    if $P661, if_659
    set $P658, $P661
    goto if_659_end
  if_659:
    get_global $P662, "@MODIFIERS"
    unless_null $P662, vivify_207
    $P662 = root_new ['parrot';'ResizablePMCArray']
  vivify_207:
    set $P663, $P662[0]
    unless_null $P663, vivify_208
    $P663 = root_new ['parrot';'Hash']
  vivify_208:
    set $P664, $P663["s"]
    unless_null $P664, vivify_209
    new $P664, "Undef"
  vivify_209:
    set $P658, $P664
  if_659_end:
    store_lex "$ws", $P658
.annotate 'line', 120
    find_lex $P666, "$/"
    unless_null $P666, vivify_210
    $P666 = root_new ['parrot';'Hash']
  vivify_210:
    set $P667, $P666["quantified_atom"]
    unless_null $P667, vivify_211
    new $P667, "Undef"
  vivify_211:
    if $P667, if_665
.annotate 'line', 136
    get_hll_global $P687, ["PAST"], "Regex"
    find_lex $P688, "$/"
    unless_null $P688, vivify_212
    $P688 = root_new ['parrot';'Hash']
  vivify_212:
    set $P689, $P688["min"]
    unless_null $P689, vivify_213
    new $P689, "Undef"
  vivify_213:
    set $N690, $P689
    find_lex $P691, "$/"
    $P692 = $P687."new"("quant" :named("pasttype"), $N690 :named("min"), $P691 :named("node"))
    store_lex "$past", $P692
.annotate 'line', 137
    find_lex $P694, "$/"
    unless_null $P694, vivify_214
    $P694 = root_new ['parrot';'Hash']
  vivify_214:
    set $P695, $P694["max"]
    unless_null $P695, vivify_215
    new $P695, "Undef"
  vivify_215:
    isfalse $I696, $P695
    if $I696, if_693
.annotate 'line', 138
    find_lex $P702, "$/"
    unless_null $P702, vivify_216
    $P702 = root_new ['parrot';'Hash']
  vivify_216:
    set $P703, $P702["max"]
    unless_null $P703, vivify_217
    $P703 = root_new ['parrot';'ResizablePMCArray']
  vivify_217:
    set $P704, $P703[0]
    unless_null $P704, vivify_218
    new $P704, "Undef"
  vivify_218:
    set $S705, $P704
    isne $I706, $S705, "*"
    unless $I706, if_701_end
    find_lex $P707, "$past"
    find_lex $P708, "$/"
    unless_null $P708, vivify_219
    $P708 = root_new ['parrot';'Hash']
  vivify_219:
    set $P709, $P708["max"]
    unless_null $P709, vivify_220
    $P709 = root_new ['parrot';'ResizablePMCArray']
  vivify_220:
    set $P710, $P709[0]
    unless_null $P710, vivify_221
    new $P710, "Undef"
  vivify_221:
    set $N711, $P710
    $P707."max"($N711)
  if_701_end:
    goto if_693_end
  if_693:
.annotate 'line', 137
    find_lex $P697, "$past"
    find_lex $P698, "$/"
    unless_null $P698, vivify_222
    $P698 = root_new ['parrot';'Hash']
  vivify_222:
    set $P699, $P698["min"]
    unless_null $P699, vivify_223
    new $P699, "Undef"
  vivify_223:
    set $N700, $P699
    $P697."max"($N700)
  if_693_end:
.annotate 'line', 139
    find_lex $P713, "$ws"
    unless $P713, if_712_end
    find_lex $P714, "$past"
    get_hll_global $P715, ["PAST"], "Regex"
    $P716 = $P715."new"("ws", "subrule" :named("pasttype"), "method" :named("subtype"))
    $P714."sep"($P716)
  if_712_end:
.annotate 'line', 135
    goto if_665_end
  if_665:
.annotate 'line', 120
    .const 'Sub' $P669 = "43_1279564394.02125" 
    capture_lex $P669
    $P669()
  if_665_end:
.annotate 'line', 143
    find_lex $P717, "$/"
    find_lex $P718, "$past"
    find_lex $P719, "$/"
    unless_null $P719, vivify_226
    $P719 = root_new ['parrot';'Hash']
  vivify_226:
    set $P720, $P719["backmod"]
    unless_null $P720, vivify_227
    new $P720, "Undef"
  vivify_227:
    $P721 = "backmod"($P718, $P720)
    $P722 = $P717."!make"($P721)
.annotate 'line', 117
    .return ($P722)
  control_652:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P723, exception, "payload"
    .return ($P723)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block668"  :anon :subid("43_1279564394.02125") :outer("42_1279564394.02125")
.annotate 'line', 121
    new $P670, "Undef"
    .lex "$ast", $P670
    find_lex $P671, "$/"
    unless_null $P671, vivify_224
    $P671 = root_new ['parrot';'Hash']
  vivify_224:
    set $P672, $P671["quantified_atom"]
    unless_null $P672, vivify_225
    new $P672, "Undef"
  vivify_225:
    $P673 = $P672."ast"()
    store_lex "$ast", $P673
.annotate 'line', 122
    find_lex $P675, "$ws"
    unless $P675, if_674_end
.annotate 'line', 123
    get_hll_global $P676, ["PAST"], "Regex"
.annotate 'line', 125
    get_hll_global $P677, ["PAST"], "Regex"
    $P678 = $P677."new"("ws", "subrule" :named("pasttype"), "method" :named("subtype"))
    find_lex $P679, "$ast"
.annotate 'line', 128
    get_hll_global $P680, ["PAST"], "Regex"
    $P681 = $P680."new"("ws", "subrule" :named("pasttype"), "method" :named("subtype"))
    $P682 = $P676."new"($P678, $P679, $P681, "concat" :named("pasttype"))
.annotate 'line', 123
    store_lex "$ast", $P682
  if_674_end:
.annotate 'line', 132
    get_hll_global $P683, ["PAST"], "Regex"
    find_lex $P684, "$ast"
    find_lex $P685, "$/"
    $P686 = $P683."new"("quant" :named("pasttype"), 1 :named("min"), $P684 :named("sep"), $P685 :named("node"))
    store_lex "$past", $P686
.annotate 'line', 120
    .return ($P686)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<ws>"  :subid("44_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_727
.annotate 'line', 146
    new $P726, 'ExceptionHandler'
    set_addr $P726, control_725
    $P726."handle_types"(.CONTROL_RETURN)
    push_eh $P726
    .lex "self", self
    .lex "$/", param_727
.annotate 'line', 147
    new $P728, "Undef"
    .lex "$past", $P728
.annotate 'line', 148
    get_global $P731, "@MODIFIERS"
    unless_null $P731, vivify_228
    $P731 = root_new ['parrot';'ResizablePMCArray']
  vivify_228:
    set $P732, $P731[0]
    unless_null $P732, vivify_229
    $P732 = root_new ['parrot';'Hash']
  vivify_229:
    set $P733, $P732["s"]
    unless_null $P733, vivify_230
    new $P733, "Undef"
  vivify_230:
    if $P733, if_730
    new $P737, "Integer"
    assign $P737, 0
    set $P729, $P737
    goto if_730_end
  if_730:
    get_hll_global $P734, ["PAST"], "Regex"
    find_lex $P735, "$/"
    $P736 = $P734."new"("ws", "subrule" :named("pasttype"), "method" :named("subtype"), $P735 :named("node"))
    set $P729, $P736
  if_730_end:
    store_lex "$past", $P729
.annotate 'line', 151
    find_lex $P738, "$/"
    find_lex $P739, "$past"
    $P740 = $P738."!make"($P739)
.annotate 'line', 146
    .return ($P740)
  control_725:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P741, exception, "payload"
    .return ($P741)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<[ ]>"  :subid("45_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_745
.annotate 'line', 155
    new $P744, 'ExceptionHandler'
    set_addr $P744, control_743
    $P744."handle_types"(.CONTROL_RETURN)
    push_eh $P744
    .lex "self", self
    .lex "$/", param_745
.annotate 'line', 156
    find_lex $P746, "$/"
    find_lex $P747, "$/"
    unless_null $P747, vivify_231
    $P747 = root_new ['parrot';'Hash']
  vivify_231:
    set $P748, $P747["nibbler"]
    unless_null $P748, vivify_232
    new $P748, "Undef"
  vivify_232:
    $P749 = $P748."ast"()
    $P750 = $P746."!make"($P749)
.annotate 'line', 155
    .return ($P750)
  control_743:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P751, exception, "payload"
    .return ($P751)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<( )>"  :subid("46_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_755
.annotate 'line', 159
    new $P754, 'ExceptionHandler'
    set_addr $P754, control_753
    $P754."handle_types"(.CONTROL_RETURN)
    push_eh $P754
    .lex "self", self
    .lex "$/", param_755
.annotate 'line', 160
    new $P756, "Undef"
    .lex "$subpast", $P756
.annotate 'line', 161
    new $P757, "Undef"
    .lex "$past", $P757
.annotate 'line', 160
    find_lex $P758, "$/"
    unless_null $P758, vivify_233
    $P758 = root_new ['parrot';'Hash']
  vivify_233:
    set $P759, $P758["nibbler"]
    unless_null $P759, vivify_234
    new $P759, "Undef"
  vivify_234:
    $P760 = $P759."ast"()
    $P761 = "buildsub"($P760)
    store_lex "$subpast", $P761
.annotate 'line', 161
    get_hll_global $P762, ["PAST"], "Regex"
    find_lex $P763, "$subpast"
    find_lex $P764, "$/"
    $P765 = $P762."new"($P763, "subrule" :named("pasttype"), "capture" :named("subtype"), $P764 :named("node"))
    store_lex "$past", $P765
.annotate 'line', 163
    find_lex $P766, "$/"
    find_lex $P767, "$past"
    $P768 = $P766."!make"($P767)
.annotate 'line', 159
    .return ($P768)
  control_753:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P769, exception, "payload"
    .return ($P769)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<'>"  :subid("47_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_773
.annotate 'line', 166
    new $P772, 'ExceptionHandler'
    set_addr $P772, control_771
    $P772."handle_types"(.CONTROL_RETURN)
    push_eh $P772
    .lex "self", self
    .lex "$/", param_773
.annotate 'line', 167
    new $P774, "Undef"
    .lex "$quote", $P774
.annotate 'line', 169
    new $P775, "Undef"
    .lex "$past", $P775
.annotate 'line', 167
    find_lex $P776, "$/"
    unless_null $P776, vivify_235
    $P776 = root_new ['parrot';'Hash']
  vivify_235:
    set $P777, $P776["quote_EXPR"]
    unless_null $P777, vivify_236
    new $P777, "Undef"
  vivify_236:
    $P778 = $P777."ast"()
    store_lex "$quote", $P778
.annotate 'line', 168
    get_hll_global $P780, ["PAST"], "Val"
    find_lex $P781, "$quote"
    $P782 = $P780."ACCEPTS"($P781)
    unless $P782, if_779_end
    find_lex $P783, "$quote"
    $P784 = $P783."value"()
    store_lex "$quote", $P784
  if_779_end:
.annotate 'line', 169
    get_hll_global $P785, ["PAST"], "Regex"
    find_lex $P786, "$quote"
    find_lex $P787, "$/"
    $P788 = $P785."new"($P786, "literal" :named("pasttype"), $P787 :named("node"))
    store_lex "$past", $P788
.annotate 'line', 170
    find_lex $P789, "$/"
    find_lex $P790, "$past"
    $P791 = $P789."!make"($P790)
.annotate 'line', 166
    .return ($P791)
  control_771:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P792, exception, "payload"
    .return ($P792)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<\">"  :subid("48_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_796
.annotate 'line', 173
    new $P795, 'ExceptionHandler'
    set_addr $P795, control_794
    $P795."handle_types"(.CONTROL_RETURN)
    push_eh $P795
    .lex "self", self
    .lex "$/", param_796
.annotate 'line', 174
    new $P797, "Undef"
    .lex "$quote", $P797
.annotate 'line', 176
    new $P798, "Undef"
    .lex "$past", $P798
.annotate 'line', 174
    find_lex $P799, "$/"
    unless_null $P799, vivify_237
    $P799 = root_new ['parrot';'Hash']
  vivify_237:
    set $P800, $P799["quote_EXPR"]
    unless_null $P800, vivify_238
    new $P800, "Undef"
  vivify_238:
    $P801 = $P800."ast"()
    store_lex "$quote", $P801
.annotate 'line', 175
    get_hll_global $P803, ["PAST"], "Val"
    find_lex $P804, "$quote"
    $P805 = $P803."ACCEPTS"($P804)
    unless $P805, if_802_end
    find_lex $P806, "$quote"
    $P807 = $P806."value"()
    store_lex "$quote", $P807
  if_802_end:
.annotate 'line', 176
    get_hll_global $P808, ["PAST"], "Regex"
    find_lex $P809, "$quote"
    find_lex $P810, "$/"
    $P811 = $P808."new"($P809, "literal" :named("pasttype"), $P810 :named("node"))
    store_lex "$past", $P811
.annotate 'line', 177
    find_lex $P812, "$/"
    find_lex $P813, "$past"
    $P814 = $P812."!make"($P813)
.annotate 'line', 173
    .return ($P814)
  control_794:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P815, exception, "payload"
    .return ($P815)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<.>"  :subid("49_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_819
.annotate 'line', 180
    new $P818, 'ExceptionHandler'
    set_addr $P818, control_817
    $P818."handle_types"(.CONTROL_RETURN)
    push_eh $P818
    .lex "self", self
    .lex "$/", param_819
.annotate 'line', 181
    new $P820, "Undef"
    .lex "$past", $P820
    get_hll_global $P821, ["PAST"], "Regex"
    find_lex $P822, "$/"
    $P823 = $P821."new"("charclass" :named("pasttype"), "." :named("subtype"), $P822 :named("node"))
    store_lex "$past", $P823
.annotate 'line', 182
    find_lex $P824, "$/"
    find_lex $P825, "$past"
    $P826 = $P824."!make"($P825)
.annotate 'line', 180
    .return ($P826)
  control_817:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P827, exception, "payload"
    .return ($P827)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<^>"  :subid("50_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_831
.annotate 'line', 185
    new $P830, 'ExceptionHandler'
    set_addr $P830, control_829
    $P830."handle_types"(.CONTROL_RETURN)
    push_eh $P830
    .lex "self", self
    .lex "$/", param_831
.annotate 'line', 186
    new $P832, "Undef"
    .lex "$past", $P832
    get_hll_global $P833, ["PAST"], "Regex"
    find_lex $P834, "$/"
    $P835 = $P833."new"("anchor" :named("pasttype"), "bos" :named("subtype"), $P834 :named("node"))
    store_lex "$past", $P835
.annotate 'line', 187
    find_lex $P836, "$/"
    find_lex $P837, "$past"
    $P838 = $P836."!make"($P837)
.annotate 'line', 185
    .return ($P838)
  control_829:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P839, exception, "payload"
    .return ($P839)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<^^>"  :subid("51_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_843
.annotate 'line', 190
    new $P842, 'ExceptionHandler'
    set_addr $P842, control_841
    $P842."handle_types"(.CONTROL_RETURN)
    push_eh $P842
    .lex "self", self
    .lex "$/", param_843
.annotate 'line', 191
    new $P844, "Undef"
    .lex "$past", $P844
    get_hll_global $P845, ["PAST"], "Regex"
    find_lex $P846, "$/"
    $P847 = $P845."new"("anchor" :named("pasttype"), "bol" :named("subtype"), $P846 :named("node"))
    store_lex "$past", $P847
.annotate 'line', 192
    find_lex $P848, "$/"
    find_lex $P849, "$past"
    $P850 = $P848."!make"($P849)
.annotate 'line', 190
    .return ($P850)
  control_841:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P851, exception, "payload"
    .return ($P851)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<$>"  :subid("52_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_855
.annotate 'line', 195
    new $P854, 'ExceptionHandler'
    set_addr $P854, control_853
    $P854."handle_types"(.CONTROL_RETURN)
    push_eh $P854
    .lex "self", self
    .lex "$/", param_855
.annotate 'line', 196
    new $P856, "Undef"
    .lex "$past", $P856
    get_hll_global $P857, ["PAST"], "Regex"
    find_lex $P858, "$/"
    $P859 = $P857."new"("anchor" :named("pasttype"), "eos" :named("subtype"), $P858 :named("node"))
    store_lex "$past", $P859
.annotate 'line', 197
    find_lex $P860, "$/"
    find_lex $P861, "$past"
    $P862 = $P860."!make"($P861)
.annotate 'line', 195
    .return ($P862)
  control_853:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P863, exception, "payload"
    .return ($P863)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<$$>"  :subid("53_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_867
.annotate 'line', 200
    new $P866, 'ExceptionHandler'
    set_addr $P866, control_865
    $P866."handle_types"(.CONTROL_RETURN)
    push_eh $P866
    .lex "self", self
    .lex "$/", param_867
.annotate 'line', 201
    new $P868, "Undef"
    .lex "$past", $P868
    get_hll_global $P869, ["PAST"], "Regex"
    find_lex $P870, "$/"
    $P871 = $P869."new"("anchor" :named("pasttype"), "eol" :named("subtype"), $P870 :named("node"))
    store_lex "$past", $P871
.annotate 'line', 202
    find_lex $P872, "$/"
    find_lex $P873, "$past"
    $P874 = $P872."!make"($P873)
.annotate 'line', 200
    .return ($P874)
  control_865:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P875, exception, "payload"
    .return ($P875)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<:::>"  :subid("54_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_879
.annotate 'line', 205
    new $P878, 'ExceptionHandler'
    set_addr $P878, control_877
    $P878."handle_types"(.CONTROL_RETURN)
    push_eh $P878
    .lex "self", self
    .lex "$/", param_879
.annotate 'line', 206
    new $P880, "Undef"
    .lex "$past", $P880
    get_hll_global $P881, ["PAST"], "Regex"
    find_lex $P882, "$/"
    $P883 = $P881."new"("cut" :named("pasttype"), $P882 :named("node"))
    store_lex "$past", $P883
.annotate 'line', 207
    find_lex $P884, "$/"
    find_lex $P885, "$past"
    $P886 = $P884."!make"($P885)
.annotate 'line', 205
    .return ($P886)
  control_877:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P887, exception, "payload"
    .return ($P887)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<lwb>"  :subid("55_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_891
.annotate 'line', 210
    new $P890, 'ExceptionHandler'
    set_addr $P890, control_889
    $P890."handle_types"(.CONTROL_RETURN)
    push_eh $P890
    .lex "self", self
    .lex "$/", param_891
.annotate 'line', 211
    new $P892, "Undef"
    .lex "$past", $P892
    get_hll_global $P893, ["PAST"], "Regex"
    find_lex $P894, "$/"
    $P895 = $P893."new"("anchor" :named("pasttype"), "lwb" :named("subtype"), $P894 :named("node"))
    store_lex "$past", $P895
.annotate 'line', 212
    find_lex $P896, "$/"
    find_lex $P897, "$past"
    $P898 = $P896."!make"($P897)
.annotate 'line', 210
    .return ($P898)
  control_889:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P899, exception, "payload"
    .return ($P899)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<rwb>"  :subid("56_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_903
.annotate 'line', 215
    new $P902, 'ExceptionHandler'
    set_addr $P902, control_901
    $P902."handle_types"(.CONTROL_RETURN)
    push_eh $P902
    .lex "self", self
    .lex "$/", param_903
.annotate 'line', 216
    new $P904, "Undef"
    .lex "$past", $P904
    get_hll_global $P905, ["PAST"], "Regex"
    find_lex $P906, "$/"
    $P907 = $P905."new"("anchor" :named("pasttype"), "rwb" :named("subtype"), $P906 :named("node"))
    store_lex "$past", $P907
.annotate 'line', 217
    find_lex $P908, "$/"
    find_lex $P909, "$past"
    $P910 = $P908."!make"($P909)
.annotate 'line', 215
    .return ($P910)
  control_901:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P911, exception, "payload"
    .return ($P911)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<bs>"  :subid("57_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_915
.annotate 'line', 220
    new $P914, 'ExceptionHandler'
    set_addr $P914, control_913
    $P914."handle_types"(.CONTROL_RETURN)
    push_eh $P914
    .lex "self", self
    .lex "$/", param_915
.annotate 'line', 221
    find_lex $P916, "$/"
    find_lex $P917, "$/"
    unless_null $P917, vivify_239
    $P917 = root_new ['parrot';'Hash']
  vivify_239:
    set $P918, $P917["backslash"]
    unless_null $P918, vivify_240
    new $P918, "Undef"
  vivify_240:
    $P919 = $P918."ast"()
    $P920 = $P916."!make"($P919)
.annotate 'line', 220
    .return ($P920)
  control_913:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P921, exception, "payload"
    .return ($P921)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<mod>"  :subid("58_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_925
.annotate 'line', 224
    new $P924, 'ExceptionHandler'
    set_addr $P924, control_923
    $P924."handle_types"(.CONTROL_RETURN)
    push_eh $P924
    .lex "self", self
    .lex "$/", param_925
.annotate 'line', 225
    find_lex $P926, "$/"
    find_lex $P927, "$/"
    unless_null $P927, vivify_241
    $P927 = root_new ['parrot';'Hash']
  vivify_241:
    set $P928, $P927["mod_internal"]
    unless_null $P928, vivify_242
    new $P928, "Undef"
  vivify_242:
    $P929 = $P928."ast"()
    $P930 = $P926."!make"($P929)
.annotate 'line', 224
    .return ($P930)
  control_923:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P931, exception, "payload"
    .return ($P931)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<assert>"  :subid("59_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_935
.annotate 'line', 228
    new $P934, 'ExceptionHandler'
    set_addr $P934, control_933
    $P934."handle_types"(.CONTROL_RETURN)
    push_eh $P934
    .lex "self", self
    .lex "$/", param_935
.annotate 'line', 229
    find_lex $P936, "$/"
    find_lex $P937, "$/"
    unless_null $P937, vivify_243
    $P937 = root_new ['parrot';'Hash']
  vivify_243:
    set $P938, $P937["assertion"]
    unless_null $P938, vivify_244
    new $P938, "Undef"
  vivify_244:
    $P939 = $P938."ast"()
    $P940 = $P936."!make"($P939)
.annotate 'line', 228
    .return ($P940)
  control_933:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P941, exception, "payload"
    .return ($P941)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<~>"  :subid("60_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_945
.annotate 'line', 232
    new $P944, 'ExceptionHandler'
    set_addr $P944, control_943
    $P944."handle_types"(.CONTROL_RETURN)
    push_eh $P944
    .lex "self", self
    .lex "$/", param_945
.annotate 'line', 233
    find_lex $P946, "$/"
    get_hll_global $P947, ["PAST"], "Regex"
.annotate 'line', 234
    find_lex $P948, "$/"
    unless_null $P948, vivify_245
    $P948 = root_new ['parrot';'Hash']
  vivify_245:
    set $P949, $P948["EXPR"]
    unless_null $P949, vivify_246
    new $P949, "Undef"
  vivify_246:
    $P950 = $P949."ast"()
.annotate 'line', 235
    get_hll_global $P951, ["PAST"], "Regex"
.annotate 'line', 236
    find_lex $P952, "$/"
    unless_null $P952, vivify_247
    $P952 = root_new ['parrot';'Hash']
  vivify_247:
    set $P953, $P952["GOAL"]
    unless_null $P953, vivify_248
    new $P953, "Undef"
  vivify_248:
    $P954 = $P953."ast"()
.annotate 'line', 237
    get_hll_global $P955, ["PAST"], "Regex"
    find_lex $P956, "$/"
    unless_null $P956, vivify_249
    $P956 = root_new ['parrot';'Hash']
  vivify_249:
    set $P957, $P956["GOAL"]
    unless_null $P957, vivify_250
    new $P957, "Undef"
  vivify_250:
    set $S958, $P957
    $P959 = $P955."new"("FAILGOAL", $S958, "subrule" :named("pasttype"), "method" :named("subtype"))
    $P960 = $P951."new"($P954, $P959, "alt" :named("pasttype"))
.annotate 'line', 235
    $P961 = $P947."new"($P950, $P960, "concat" :named("pasttype"))
.annotate 'line', 233
    $P962 = $P946."!make"($P961)
.annotate 'line', 232
    .return ($P962)
  control_943:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P963, exception, "payload"
    .return ($P963)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<{*}>"  :subid("61_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_967
.annotate 'line', 245
    new $P966, 'ExceptionHandler'
    set_addr $P966, control_965
    $P966."handle_types"(.CONTROL_RETURN)
    push_eh $P966
    .lex "self", self
    .lex "$/", param_967
.annotate 'line', 246
    new $P968, "Undef"
    .lex "$past", $P968
.annotate 'line', 247
    find_lex $P971, "$/"
    unless_null $P971, vivify_251
    $P971 = root_new ['parrot';'Hash']
  vivify_251:
    set $P972, $P971["key"]
    unless_null $P972, vivify_252
    new $P972, "Undef"
  vivify_252:
    if $P972, if_970
    new $P980, "Integer"
    assign $P980, 0
    set $P969, $P980
    goto if_970_end
  if_970:
    get_hll_global $P973, ["PAST"], "Regex"
    find_lex $P974, "$/"
    unless_null $P974, vivify_253
    $P974 = root_new ['parrot';'Hash']
  vivify_253:
    set $P975, $P974["key"]
    unless_null $P975, vivify_254
    $P975 = root_new ['parrot';'ResizablePMCArray']
  vivify_254:
    set $P976, $P975[0]
    unless_null $P976, vivify_255
    new $P976, "Undef"
  vivify_255:
    set $S977, $P976
    find_lex $P978, "$/"
    $P979 = $P973."new"($S977, "reduce" :named("pasttype"), $P978 :named("node"))
    set $P969, $P979
  if_970_end:
    store_lex "$past", $P969
.annotate 'line', 249
    find_lex $P981, "$/"
    find_lex $P982, "$past"
    $P983 = $P981."!make"($P982)
.annotate 'line', 245
    .return ($P983)
  control_965:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P984, exception, "payload"
    .return ($P984)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<var>"  :subid("62_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_988
.annotate 'line', 252
    new $P987, 'ExceptionHandler'
    set_addr $P987, control_986
    $P987."handle_types"(.CONTROL_RETURN)
    push_eh $P987
    .lex "self", self
    .lex "$/", param_988
.annotate 'line', 253
    new $P989, "Undef"
    .lex "$past", $P989
.annotate 'line', 254
    new $P990, "Undef"
    .lex "$name", $P990
.annotate 'line', 252
    find_lex $P991, "$past"
.annotate 'line', 254
    find_lex $P994, "$/"
    unless_null $P994, vivify_256
    $P994 = root_new ['parrot';'Hash']
  vivify_256:
    set $P995, $P994["pos"]
    unless_null $P995, vivify_257
    new $P995, "Undef"
  vivify_257:
    if $P995, if_993
    find_lex $P999, "$/"
    unless_null $P999, vivify_258
    $P999 = root_new ['parrot';'Hash']
  vivify_258:
    set $P1000, $P999["name"]
    unless_null $P1000, vivify_259
    new $P1000, "Undef"
  vivify_259:
    set $S1001, $P1000
    new $P992, 'String'
    set $P992, $S1001
    goto if_993_end
  if_993:
    find_lex $P996, "$/"
    unless_null $P996, vivify_260
    $P996 = root_new ['parrot';'Hash']
  vivify_260:
    set $P997, $P996["pos"]
    unless_null $P997, vivify_261
    new $P997, "Undef"
  vivify_261:
    set $N998, $P997
    new $P992, 'Float'
    set $P992, $N998
  if_993_end:
    store_lex "$name", $P992
.annotate 'line', 255
    find_lex $P1003, "$/"
    unless_null $P1003, vivify_262
    $P1003 = root_new ['parrot';'Hash']
  vivify_262:
    set $P1004, $P1003["quantified_atom"]
    unless_null $P1004, vivify_263
    new $P1004, "Undef"
  vivify_263:
    if $P1004, if_1002
.annotate 'line', 266
    get_hll_global $P1035, ["PAST"], "Regex"
    find_lex $P1036, "$name"
    find_lex $P1037, "$/"
    $P1038 = $P1035."new"("!BACKREF", $P1036, "subrule" :named("pasttype"), "method" :named("subtype"), $P1037 :named("node"))
    store_lex "$past", $P1038
.annotate 'line', 265
    goto if_1002_end
  if_1002:
.annotate 'line', 256
    find_lex $P1005, "$/"
    unless_null $P1005, vivify_264
    $P1005 = root_new ['parrot';'Hash']
  vivify_264:
    set $P1006, $P1005["quantified_atom"]
    unless_null $P1006, vivify_265
    $P1006 = root_new ['parrot';'ResizablePMCArray']
  vivify_265:
    set $P1007, $P1006[0]
    unless_null $P1007, vivify_266
    new $P1007, "Undef"
  vivify_266:
    $P1008 = $P1007."ast"()
    store_lex "$past", $P1008
.annotate 'line', 257
    find_lex $P1012, "$past"
    $S1013 = $P1012."pasttype"()
    iseq $I1014, $S1013, "quant"
    if $I1014, if_1011
    new $P1010, 'Integer'
    set $P1010, $I1014
    goto if_1011_end
  if_1011:
    find_lex $P1015, "$past"
    unless_null $P1015, vivify_267
    $P1015 = root_new ['parrot';'ResizablePMCArray']
  vivify_267:
    set $P1016, $P1015[0]
    unless_null $P1016, vivify_268
    new $P1016, "Undef"
  vivify_268:
    $S1017 = $P1016."pasttype"()
    iseq $I1018, $S1017, "subrule"
    new $P1010, 'Integer'
    set $P1010, $I1018
  if_1011_end:
    if $P1010, if_1009
.annotate 'line', 260
    find_lex $P1024, "$past"
    $S1025 = $P1024."pasttype"()
    iseq $I1026, $S1025, "subrule"
    if $I1026, if_1023
.annotate 'line', 262
    get_hll_global $P1030, ["PAST"], "Regex"
    find_lex $P1031, "$past"
    find_lex $P1032, "$name"
    find_lex $P1033, "$/"
    $P1034 = $P1030."new"($P1031, $P1032 :named("name"), "subcapture" :named("pasttype"), $P1033 :named("node"))
    store_lex "$past", $P1034
.annotate 'line', 261
    goto if_1023_end
  if_1023:
.annotate 'line', 260
    find_lex $P1027, "self"
    find_lex $P1028, "$past"
    find_lex $P1029, "$name"
    $P1027."subrule_alias"($P1028, $P1029)
  if_1023_end:
    goto if_1009_end
  if_1009:
.annotate 'line', 258
    find_lex $P1019, "self"
    find_lex $P1020, "$past"
    unless_null $P1020, vivify_269
    $P1020 = root_new ['parrot';'ResizablePMCArray']
  vivify_269:
    set $P1021, $P1020[0]
    unless_null $P1021, vivify_270
    new $P1021, "Undef"
  vivify_270:
    find_lex $P1022, "$name"
    $P1019."subrule_alias"($P1021, $P1022)
  if_1009_end:
  if_1002_end:
.annotate 'line', 269
    find_lex $P1039, "$/"
    find_lex $P1040, "$past"
    $P1041 = $P1039."!make"($P1040)
.annotate 'line', 252
    .return ($P1041)
  control_986:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1042, exception, "payload"
    .return ($P1042)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<PIR>"  :subid("63_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_1046
.annotate 'line', 272
    new $P1045, 'ExceptionHandler'
    set_addr $P1045, control_1044
    $P1045."handle_types"(.CONTROL_RETURN)
    push_eh $P1045
    .lex "self", self
    .lex "$/", param_1046
.annotate 'line', 273
    find_lex $P1047, "$/"
    get_hll_global $P1048, ["PAST"], "Regex"
.annotate 'line', 274
    get_hll_global $P1049, ["PAST"], "Op"
    find_lex $P1050, "$/"
    unless_null $P1050, vivify_271
    $P1050 = root_new ['parrot';'Hash']
  vivify_271:
    set $P1051, $P1050["pir"]
    unless_null $P1051, vivify_272
    new $P1051, "Undef"
  vivify_272:
    set $S1052, $P1051
    $P1053 = $P1049."new"($S1052 :named("inline"), "inline" :named("pasttype"))
    find_lex $P1054, "$/"
    $P1055 = $P1048."new"($P1053, "pastnode" :named("pasttype"), $P1054 :named("node"))
.annotate 'line', 273
    $P1056 = $P1047."!make"($P1055)
.annotate 'line', 272
    .return ($P1056)
  control_1044:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1057, exception, "payload"
    .return ($P1057)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<w>"  :subid("64_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_1061
.annotate 'line', 280
    new $P1060, 'ExceptionHandler'
    set_addr $P1060, control_1059
    $P1060."handle_types"(.CONTROL_RETURN)
    push_eh $P1060
    .lex "self", self
    .lex "$/", param_1061
.annotate 'line', 281
    new $P1062, "Undef"
    .lex "$subtype", $P1062
.annotate 'line', 282
    new $P1063, "Undef"
    .lex "$past", $P1063
.annotate 'line', 281
    find_lex $P1066, "$/"
    unless_null $P1066, vivify_273
    $P1066 = root_new ['parrot';'Hash']
  vivify_273:
    set $P1067, $P1066["sym"]
    unless_null $P1067, vivify_274
    new $P1067, "Undef"
  vivify_274:
    set $S1068, $P1067
    iseq $I1069, $S1068, "n"
    if $I1069, if_1065
    find_lex $P1071, "$/"
    unless_null $P1071, vivify_275
    $P1071 = root_new ['parrot';'Hash']
  vivify_275:
    set $P1072, $P1071["sym"]
    unless_null $P1072, vivify_276
    new $P1072, "Undef"
  vivify_276:
    set $S1073, $P1072
    new $P1064, 'String'
    set $P1064, $S1073
    goto if_1065_end
  if_1065:
    new $P1070, "String"
    assign $P1070, "nl"
    set $P1064, $P1070
  if_1065_end:
    store_lex "$subtype", $P1064
.annotate 'line', 282
    get_hll_global $P1074, ["PAST"], "Regex"
    find_lex $P1075, "$subtype"
    find_lex $P1076, "$/"
    $P1077 = $P1074."new"("charclass" :named("pasttype"), $P1075 :named("subtype"), $P1076 :named("node"))
    store_lex "$past", $P1077
.annotate 'line', 283
    find_lex $P1078, "$/"
    find_lex $P1079, "$past"
    $P1080 = $P1078."!make"($P1079)
.annotate 'line', 280
    .return ($P1080)
  control_1059:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1081, exception, "payload"
    .return ($P1081)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<b>"  :subid("65_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_1085
.annotate 'line', 286
    new $P1084, 'ExceptionHandler'
    set_addr $P1084, control_1083
    $P1084."handle_types"(.CONTROL_RETURN)
    push_eh $P1084
    .lex "self", self
    .lex "$/", param_1085
.annotate 'line', 287
    new $P1086, "Undef"
    .lex "$past", $P1086
    get_hll_global $P1087, ["PAST"], "Regex"
.annotate 'line', 288
    find_lex $P1088, "$/"
    unless_null $P1088, vivify_277
    $P1088 = root_new ['parrot';'Hash']
  vivify_277:
    set $P1089, $P1088["sym"]
    unless_null $P1089, vivify_278
    new $P1089, "Undef"
  vivify_278:
    set $S1090, $P1089
    iseq $I1091, $S1090, "B"
    find_lex $P1092, "$/"
    $P1093 = $P1087."new"("\b", "enumcharlist" :named("pasttype"), $I1091 :named("negate"), $P1092 :named("node"))
.annotate 'line', 287
    store_lex "$past", $P1093
.annotate 'line', 289
    find_lex $P1094, "$/"
    find_lex $P1095, "$past"
    $P1096 = $P1094."!make"($P1095)
.annotate 'line', 286
    .return ($P1096)
  control_1083:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1097, exception, "payload"
    .return ($P1097)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<e>"  :subid("66_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_1101
.annotate 'line', 292
    new $P1100, 'ExceptionHandler'
    set_addr $P1100, control_1099
    $P1100."handle_types"(.CONTROL_RETURN)
    push_eh $P1100
    .lex "self", self
    .lex "$/", param_1101
.annotate 'line', 293
    new $P1102, "Undef"
    .lex "$past", $P1102
    get_hll_global $P1103, ["PAST"], "Regex"
.annotate 'line', 294
    find_lex $P1104, "$/"
    unless_null $P1104, vivify_279
    $P1104 = root_new ['parrot';'Hash']
  vivify_279:
    set $P1105, $P1104["sym"]
    unless_null $P1105, vivify_280
    new $P1105, "Undef"
  vivify_280:
    set $S1106, $P1105
    iseq $I1107, $S1106, "E"
    find_lex $P1108, "$/"
    $P1109 = $P1103."new"("\e", "enumcharlist" :named("pasttype"), $I1107 :named("negate"), $P1108 :named("node"))
.annotate 'line', 293
    store_lex "$past", $P1109
.annotate 'line', 295
    find_lex $P1110, "$/"
    find_lex $P1111, "$past"
    $P1112 = $P1110."!make"($P1111)
.annotate 'line', 292
    .return ($P1112)
  control_1099:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1113, exception, "payload"
    .return ($P1113)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<f>"  :subid("67_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_1117
.annotate 'line', 298
    new $P1116, 'ExceptionHandler'
    set_addr $P1116, control_1115
    $P1116."handle_types"(.CONTROL_RETURN)
    push_eh $P1116
    .lex "self", self
    .lex "$/", param_1117
.annotate 'line', 299
    new $P1118, "Undef"
    .lex "$past", $P1118
    get_hll_global $P1119, ["PAST"], "Regex"
.annotate 'line', 300
    find_lex $P1120, "$/"
    unless_null $P1120, vivify_281
    $P1120 = root_new ['parrot';'Hash']
  vivify_281:
    set $P1121, $P1120["sym"]
    unless_null $P1121, vivify_282
    new $P1121, "Undef"
  vivify_282:
    set $S1122, $P1121
    iseq $I1123, $S1122, "F"
    find_lex $P1124, "$/"
    $P1125 = $P1119."new"("\f", "enumcharlist" :named("pasttype"), $I1123 :named("negate"), $P1124 :named("node"))
.annotate 'line', 299
    store_lex "$past", $P1125
.annotate 'line', 301
    find_lex $P1126, "$/"
    find_lex $P1127, "$past"
    $P1128 = $P1126."!make"($P1127)
.annotate 'line', 298
    .return ($P1128)
  control_1115:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1129, exception, "payload"
    .return ($P1129)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<h>"  :subid("68_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_1133
.annotate 'line', 304
    new $P1132, 'ExceptionHandler'
    set_addr $P1132, control_1131
    $P1132."handle_types"(.CONTROL_RETURN)
    push_eh $P1132
    .lex "self", self
    .lex "$/", param_1133
.annotate 'line', 305
    new $P1134, "Undef"
    .lex "$past", $P1134
    get_hll_global $P1135, ["PAST"], "Regex"
.annotate 'line', 306
    find_lex $P1136, "$/"
    unless_null $P1136, vivify_283
    $P1136 = root_new ['parrot';'Hash']
  vivify_283:
    set $P1137, $P1136["sym"]
    unless_null $P1137, vivify_284
    new $P1137, "Undef"
  vivify_284:
    set $S1138, $P1137
    iseq $I1139, $S1138, "H"
    find_lex $P1140, "$/"
    $P1141 = $P1135."new"(unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", "enumcharlist" :named("pasttype"), $I1139 :named("negate"), $P1140 :named("node"))
.annotate 'line', 305
    store_lex "$past", $P1141
.annotate 'line', 307
    find_lex $P1142, "$/"
    find_lex $P1143, "$past"
    $P1144 = $P1142."!make"($P1143)
.annotate 'line', 304
    .return ($P1144)
  control_1131:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1145, exception, "payload"
    .return ($P1145)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<r>"  :subid("69_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_1149
.annotate 'line', 310
    new $P1148, 'ExceptionHandler'
    set_addr $P1148, control_1147
    $P1148."handle_types"(.CONTROL_RETURN)
    push_eh $P1148
    .lex "self", self
    .lex "$/", param_1149
.annotate 'line', 311
    new $P1150, "Undef"
    .lex "$past", $P1150
    get_hll_global $P1151, ["PAST"], "Regex"
.annotate 'line', 312
    find_lex $P1152, "$/"
    unless_null $P1152, vivify_285
    $P1152 = root_new ['parrot';'Hash']
  vivify_285:
    set $P1153, $P1152["sym"]
    unless_null $P1153, vivify_286
    new $P1153, "Undef"
  vivify_286:
    set $S1154, $P1153
    iseq $I1155, $S1154, "R"
    find_lex $P1156, "$/"
    $P1157 = $P1151."new"("\r", "enumcharlist" :named("pasttype"), $I1155 :named("negate"), $P1156 :named("node"))
.annotate 'line', 311
    store_lex "$past", $P1157
.annotate 'line', 313
    find_lex $P1158, "$/"
    find_lex $P1159, "$past"
    $P1160 = $P1158."!make"($P1159)
.annotate 'line', 310
    .return ($P1160)
  control_1147:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1161, exception, "payload"
    .return ($P1161)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<t>"  :subid("70_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_1165
.annotate 'line', 316
    new $P1164, 'ExceptionHandler'
    set_addr $P1164, control_1163
    $P1164."handle_types"(.CONTROL_RETURN)
    push_eh $P1164
    .lex "self", self
    .lex "$/", param_1165
.annotate 'line', 317
    new $P1166, "Undef"
    .lex "$past", $P1166
    get_hll_global $P1167, ["PAST"], "Regex"
.annotate 'line', 318
    find_lex $P1168, "$/"
    unless_null $P1168, vivify_287
    $P1168 = root_new ['parrot';'Hash']
  vivify_287:
    set $P1169, $P1168["sym"]
    unless_null $P1169, vivify_288
    new $P1169, "Undef"
  vivify_288:
    set $S1170, $P1169
    iseq $I1171, $S1170, "T"
    find_lex $P1172, "$/"
    $P1173 = $P1167."new"("\t", "enumcharlist" :named("pasttype"), $I1171 :named("negate"), $P1172 :named("node"))
.annotate 'line', 317
    store_lex "$past", $P1173
.annotate 'line', 319
    find_lex $P1174, "$/"
    find_lex $P1175, "$past"
    $P1176 = $P1174."!make"($P1175)
.annotate 'line', 316
    .return ($P1176)
  control_1163:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1177, exception, "payload"
    .return ($P1177)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<v>"  :subid("71_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_1181
.annotate 'line', 322
    new $P1180, 'ExceptionHandler'
    set_addr $P1180, control_1179
    $P1180."handle_types"(.CONTROL_RETURN)
    push_eh $P1180
    .lex "self", self
    .lex "$/", param_1181
.annotate 'line', 323
    new $P1182, "Undef"
    .lex "$past", $P1182
    get_hll_global $P1183, ["PAST"], "Regex"
.annotate 'line', 325
    find_lex $P1184, "$/"
    unless_null $P1184, vivify_289
    $P1184 = root_new ['parrot';'Hash']
  vivify_289:
    set $P1185, $P1184["sym"]
    unless_null $P1185, vivify_290
    new $P1185, "Undef"
  vivify_290:
    set $S1186, $P1185
    iseq $I1187, $S1186, "V"
    find_lex $P1188, "$/"
    $P1189 = $P1183."new"(unicode:"\n\x{b}\f\r\x{85}\u2028\u2029", "enumcharlist" :named("pasttype"), $I1187 :named("negate"), $P1188 :named("node"))
.annotate 'line', 323
    store_lex "$past", $P1189
.annotate 'line', 326
    find_lex $P1190, "$/"
    find_lex $P1191, "$past"
    $P1192 = $P1190."!make"($P1191)
.annotate 'line', 322
    .return ($P1192)
  control_1179:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1193, exception, "payload"
    .return ($P1193)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<o>"  :subid("72_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_1197
.annotate 'line', 329
    new $P1196, 'ExceptionHandler'
    set_addr $P1196, control_1195
    $P1196."handle_types"(.CONTROL_RETURN)
    push_eh $P1196
    .lex "self", self
    .lex "$/", param_1197
.annotate 'line', 330
    new $P1198, "Undef"
    .lex "$octlit", $P1198
.annotate 'line', 331
    get_hll_global $P1199, ["HLL";"Actions"], "ints_to_string"
    find_lex $P1202, "$/"
    unless_null $P1202, vivify_291
    $P1202 = root_new ['parrot';'Hash']
  vivify_291:
    set $P1203, $P1202["octint"]
    unless_null $P1203, vivify_292
    new $P1203, "Undef"
  vivify_292:
    unless $P1203, unless_1201
    set $P1200, $P1203
    goto unless_1201_end
  unless_1201:
    find_lex $P1204, "$/"
    unless_null $P1204, vivify_293
    $P1204 = root_new ['parrot';'Hash']
  vivify_293:
    set $P1205, $P1204["octints"]
    unless_null $P1205, vivify_294
    $P1205 = root_new ['parrot';'Hash']
  vivify_294:
    set $P1206, $P1205["octint"]
    unless_null $P1206, vivify_295
    new $P1206, "Undef"
  vivify_295:
    set $P1200, $P1206
  unless_1201_end:
    $P1207 = $P1199($P1200)
    store_lex "$octlit", $P1207
.annotate 'line', 332
    find_lex $P1208, "$/"
    find_lex $P1211, "$/"
    unless_null $P1211, vivify_296
    $P1211 = root_new ['parrot';'Hash']
  vivify_296:
    set $P1212, $P1211["sym"]
    unless_null $P1212, vivify_297
    new $P1212, "Undef"
  vivify_297:
    set $S1213, $P1212
    iseq $I1214, $S1213, "O"
    if $I1214, if_1210
.annotate 'line', 335
    get_hll_global $P1219, ["PAST"], "Regex"
    find_lex $P1220, "$octlit"
    find_lex $P1221, "$/"
    $P1222 = $P1219."new"($P1220, "literal" :named("pasttype"), $P1221 :named("node"))
    set $P1209, $P1222
.annotate 'line', 332
    goto if_1210_end
  if_1210:
.annotate 'line', 333
    get_hll_global $P1215, ["PAST"], "Regex"
    find_lex $P1216, "$octlit"
    find_lex $P1217, "$/"
    $P1218 = $P1215."new"($P1216, "enumcharlist" :named("pasttype"), 1 :named("negate"), $P1217 :named("node"))
    set $P1209, $P1218
  if_1210_end:
    $P1223 = $P1208."!make"($P1209)
.annotate 'line', 329
    .return ($P1223)
  control_1195:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1224, exception, "payload"
    .return ($P1224)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<x>"  :subid("73_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_1228
.annotate 'line', 338
    new $P1227, 'ExceptionHandler'
    set_addr $P1227, control_1226
    $P1227."handle_types"(.CONTROL_RETURN)
    push_eh $P1227
    .lex "self", self
    .lex "$/", param_1228
.annotate 'line', 339
    new $P1229, "Undef"
    .lex "$hexlit", $P1229
.annotate 'line', 340
    get_hll_global $P1230, ["HLL";"Actions"], "ints_to_string"
    find_lex $P1233, "$/"
    unless_null $P1233, vivify_298
    $P1233 = root_new ['parrot';'Hash']
  vivify_298:
    set $P1234, $P1233["hexint"]
    unless_null $P1234, vivify_299
    new $P1234, "Undef"
  vivify_299:
    unless $P1234, unless_1232
    set $P1231, $P1234
    goto unless_1232_end
  unless_1232:
    find_lex $P1235, "$/"
    unless_null $P1235, vivify_300
    $P1235 = root_new ['parrot';'Hash']
  vivify_300:
    set $P1236, $P1235["hexints"]
    unless_null $P1236, vivify_301
    $P1236 = root_new ['parrot';'Hash']
  vivify_301:
    set $P1237, $P1236["hexint"]
    unless_null $P1237, vivify_302
    new $P1237, "Undef"
  vivify_302:
    set $P1231, $P1237
  unless_1232_end:
    $P1238 = $P1230($P1231)
    store_lex "$hexlit", $P1238
.annotate 'line', 341
    find_lex $P1239, "$/"
    find_lex $P1242, "$/"
    unless_null $P1242, vivify_303
    $P1242 = root_new ['parrot';'Hash']
  vivify_303:
    set $P1243, $P1242["sym"]
    unless_null $P1243, vivify_304
    new $P1243, "Undef"
  vivify_304:
    set $S1244, $P1243
    iseq $I1245, $S1244, "X"
    if $I1245, if_1241
.annotate 'line', 344
    get_hll_global $P1250, ["PAST"], "Regex"
    find_lex $P1251, "$hexlit"
    find_lex $P1252, "$/"
    $P1253 = $P1250."new"($P1251, "literal" :named("pasttype"), $P1252 :named("node"))
    set $P1240, $P1253
.annotate 'line', 341
    goto if_1241_end
  if_1241:
.annotate 'line', 342
    get_hll_global $P1246, ["PAST"], "Regex"
    find_lex $P1247, "$hexlit"
    find_lex $P1248, "$/"
    $P1249 = $P1246."new"($P1247, "enumcharlist" :named("pasttype"), 1 :named("negate"), $P1248 :named("node"))
    set $P1240, $P1249
  if_1241_end:
    $P1254 = $P1239."!make"($P1240)
.annotate 'line', 338
    .return ($P1254)
  control_1226:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1255, exception, "payload"
    .return ($P1255)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<c>"  :subid("74_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_1259
.annotate 'line', 347
    new $P1258, 'ExceptionHandler'
    set_addr $P1258, control_1257
    $P1258."handle_types"(.CONTROL_RETURN)
    push_eh $P1258
    .lex "self", self
    .lex "$/", param_1259
.annotate 'line', 348
    find_lex $P1260, "$/"
    get_hll_global $P1261, ["PAST"], "Regex"
    find_lex $P1262, "$/"
    unless_null $P1262, vivify_305
    $P1262 = root_new ['parrot';'Hash']
  vivify_305:
    set $P1263, $P1262["charspec"]
    unless_null $P1263, vivify_306
    new $P1263, "Undef"
  vivify_306:
    $P1264 = $P1263."ast"()
    find_lex $P1265, "$/"
    $P1266 = $P1261."new"($P1264, "literal" :named("pasttype"), $P1265 :named("node"))
    $P1267 = $P1260."!make"($P1266)
.annotate 'line', 347
    .return ($P1267)
  control_1257:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1268, exception, "payload"
    .return ($P1268)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<misc>"  :subid("75_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_1272
.annotate 'line', 351
    new $P1271, 'ExceptionHandler'
    set_addr $P1271, control_1270
    $P1271."handle_types"(.CONTROL_RETURN)
    push_eh $P1271
    .lex "self", self
    .lex "$/", param_1272
.annotate 'line', 352
    new $P1273, "Undef"
    .lex "$past", $P1273
    get_hll_global $P1274, ["PAST"], "Regex"
    find_lex $P1275, "$/"
    set $S1276, $P1275
    find_lex $P1277, "$/"
    $P1278 = $P1274."new"($S1276, "literal" :named("pasttype"), $P1277 :named("node"))
    store_lex "$past", $P1278
.annotate 'line', 353
    find_lex $P1279, "$/"
    find_lex $P1280, "$past"
    $P1281 = $P1279."!make"($P1280)
.annotate 'line', 351
    .return ($P1281)
  control_1270:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1282, exception, "payload"
    .return ($P1282)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "assertion:sym<?>"  :subid("76_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_1286
.annotate 'line', 357
    new $P1285, 'ExceptionHandler'
    set_addr $P1285, control_1284
    $P1285."handle_types"(.CONTROL_RETURN)
    push_eh $P1285
    .lex "self", self
    .lex "$/", param_1286
.annotate 'line', 358
    new $P1287, "Undef"
    .lex "$past", $P1287
.annotate 'line', 357
    find_lex $P1288, "$past"
.annotate 'line', 359
    find_lex $P1290, "$/"
    unless_null $P1290, vivify_307
    $P1290 = root_new ['parrot';'Hash']
  vivify_307:
    set $P1291, $P1290["assertion"]
    unless_null $P1291, vivify_308
    new $P1291, "Undef"
  vivify_308:
    if $P1291, if_1289
.annotate 'line', 363
    new $P1296, "Integer"
    assign $P1296, 0
    store_lex "$past", $P1296
    goto if_1289_end
  if_1289:
.annotate 'line', 360
    find_lex $P1292, "$/"
    unless_null $P1292, vivify_309
    $P1292 = root_new ['parrot';'Hash']
  vivify_309:
    set $P1293, $P1292["assertion"]
    unless_null $P1293, vivify_310
    new $P1293, "Undef"
  vivify_310:
    $P1294 = $P1293."ast"()
    store_lex "$past", $P1294
.annotate 'line', 361
    find_lex $P1295, "$past"
    $P1295."subtype"("zerowidth")
  if_1289_end:
.annotate 'line', 364
    find_lex $P1297, "$/"
    find_lex $P1298, "$past"
    $P1299 = $P1297."!make"($P1298)
.annotate 'line', 357
    .return ($P1299)
  control_1284:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1300, exception, "payload"
    .return ($P1300)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "assertion:sym<!>"  :subid("77_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_1304
.annotate 'line', 367
    new $P1303, 'ExceptionHandler'
    set_addr $P1303, control_1302
    $P1303."handle_types"(.CONTROL_RETURN)
    push_eh $P1303
    .lex "self", self
    .lex "$/", param_1304
.annotate 'line', 368
    new $P1305, "Undef"
    .lex "$past", $P1305
.annotate 'line', 367
    find_lex $P1306, "$past"
.annotate 'line', 369
    find_lex $P1308, "$/"
    unless_null $P1308, vivify_311
    $P1308 = root_new ['parrot';'Hash']
  vivify_311:
    set $P1309, $P1308["assertion"]
    unless_null $P1309, vivify_312
    new $P1309, "Undef"
  vivify_312:
    if $P1309, if_1307
.annotate 'line', 375
    get_hll_global $P1318, ["PAST"], "Regex"
    find_lex $P1319, "$/"
    $P1320 = $P1318."new"("anchor" :named("pasttype"), "fail" :named("subtype"), $P1319 :named("node"))
    store_lex "$past", $P1320
.annotate 'line', 374
    goto if_1307_end
  if_1307:
.annotate 'line', 370
    find_lex $P1310, "$/"
    unless_null $P1310, vivify_313
    $P1310 = root_new ['parrot';'Hash']
  vivify_313:
    set $P1311, $P1310["assertion"]
    unless_null $P1311, vivify_314
    new $P1311, "Undef"
  vivify_314:
    $P1312 = $P1311."ast"()
    store_lex "$past", $P1312
.annotate 'line', 371
    find_lex $P1313, "$past"
    find_lex $P1314, "$past"
    $P1315 = $P1314."negate"()
    isfalse $I1316, $P1315
    $P1313."negate"($I1316)
.annotate 'line', 372
    find_lex $P1317, "$past"
    $P1317."subtype"("zerowidth")
  if_1307_end:
.annotate 'line', 377
    find_lex $P1321, "$/"
    find_lex $P1322, "$past"
    $P1323 = $P1321."!make"($P1322)
.annotate 'line', 367
    .return ($P1323)
  control_1302:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1324, exception, "payload"
    .return ($P1324)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "assertion:sym<method>"  :subid("78_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_1328
.annotate 'line', 380
    new $P1327, 'ExceptionHandler'
    set_addr $P1327, control_1326
    $P1327."handle_types"(.CONTROL_RETURN)
    push_eh $P1327
    .lex "self", self
    .lex "$/", param_1328
.annotate 'line', 381
    new $P1329, "Undef"
    .lex "$past", $P1329
    find_lex $P1330, "$/"
    unless_null $P1330, vivify_315
    $P1330 = root_new ['parrot';'Hash']
  vivify_315:
    set $P1331, $P1330["assertion"]
    unless_null $P1331, vivify_316
    new $P1331, "Undef"
  vivify_316:
    $P1332 = $P1331."ast"()
    store_lex "$past", $P1332
.annotate 'line', 382
    find_lex $P1333, "$past"
    $P1333."subtype"("method")
.annotate 'line', 383
    find_lex $P1334, "$past"
    $P1334."name"("")
.annotate 'line', 384
    find_lex $P1335, "$/"
    find_lex $P1336, "$past"
    $P1337 = $P1335."!make"($P1336)
.annotate 'line', 380
    .return ($P1337)
  control_1326:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1338, exception, "payload"
    .return ($P1338)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "assertion:sym<name>"  :subid("79_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_1342
.annotate 'line', 387
    .const 'Sub' $P1365 = "80_1279564394.02125" 
    capture_lex $P1365
    new $P1341, 'ExceptionHandler'
    set_addr $P1341, control_1340
    $P1341."handle_types"(.CONTROL_RETURN)
    push_eh $P1341
    .lex "self", self
    .lex "$/", param_1342
.annotate 'line', 388
    new $P1343, "Undef"
    .lex "$name", $P1343
.annotate 'line', 389
    new $P1344, "Undef"
    .lex "$past", $P1344
.annotate 'line', 388
    find_lex $P1345, "$/"
    unless_null $P1345, vivify_317
    $P1345 = root_new ['parrot';'Hash']
  vivify_317:
    set $P1346, $P1345["longname"]
    unless_null $P1346, vivify_318
    new $P1346, "Undef"
  vivify_318:
    set $S1347, $P1346
    new $P1348, 'String'
    set $P1348, $S1347
    store_lex "$name", $P1348
    find_lex $P1349, "$past"
.annotate 'line', 390
    find_lex $P1351, "$/"
    unless_null $P1351, vivify_319
    $P1351 = root_new ['parrot';'Hash']
  vivify_319:
    set $P1352, $P1351["assertion"]
    unless_null $P1352, vivify_320
    new $P1352, "Undef"
  vivify_320:
    if $P1352, if_1350
.annotate 'line', 394
    find_lex $P1361, "$name"
    set $S1362, $P1361
    iseq $I1363, $S1362, "sym"
    if $I1363, if_1360
.annotate 'line', 410
    find_lex $P1375, "self"
    find_lex $P1376, "$/"
    $P1377 = $P1375."named_assertion"($P1376)
    store_lex "$past", $P1377
.annotate 'line', 409
    goto if_1360_end
  if_1360:
.annotate 'line', 394
    .const 'Sub' $P1365 = "80_1279564394.02125" 
    capture_lex $P1365
    $P1365()
  if_1360_end:
    goto if_1350_end
  if_1350:
.annotate 'line', 391
    find_lex $P1353, "$/"
    unless_null $P1353, vivify_321
    $P1353 = root_new ['parrot';'Hash']
  vivify_321:
    set $P1354, $P1353["assertion"]
    unless_null $P1354, vivify_322
    $P1354 = root_new ['parrot';'ResizablePMCArray']
  vivify_322:
    set $P1355, $P1354[0]
    unless_null $P1355, vivify_323
    new $P1355, "Undef"
  vivify_323:
    $P1356 = $P1355."ast"()
    store_lex "$past", $P1356
.annotate 'line', 392
    find_lex $P1357, "self"
    find_lex $P1358, "$past"
    find_lex $P1359, "$name"
    $P1357."subrule_alias"($P1358, $P1359)
  if_1350_end:
.annotate 'line', 412
    find_lex $P1378, "$/"
    find_lex $P1379, "$past"
    $P1380 = $P1378."!make"($P1379)
.annotate 'line', 387
    .return ($P1380)
  control_1340:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1381, exception, "payload"
    .return ($P1381)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1364"  :anon :subid("80_1279564394.02125") :outer("79_1279564394.02125")
.annotate 'line', 395
    new $P1366, "Undef"
    .lex "$regexsym", $P1366

            $P0 = get_global '$REGEXNAME'
            $S0 = $P0
            $I0 = index $S0, ':sym<'
            add $I0, 5
            $S0 = substr $S0, $I0
            $S0 = chopn $S0, 1
            $P1367 = box $S0
        
    store_lex "$regexsym", $P1367
.annotate 'line', 404
    get_hll_global $P1368, ["PAST"], "Regex"
.annotate 'line', 405
    get_hll_global $P1369, ["PAST"], "Regex"
    find_lex $P1370, "$regexsym"
    $P1371 = $P1369."new"($P1370, "literal" :named("pasttype"))
    find_lex $P1372, "$name"
    find_lex $P1373, "$/"
    $P1374 = $P1368."new"($P1371, $P1372 :named("name"), "subcapture" :named("pasttype"), $P1373 :named("node"))
.annotate 'line', 404
    store_lex "$past", $P1374
.annotate 'line', 394
    .return ($P1374)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "assertion:sym<[>"  :subid("81_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_1385
.annotate 'line', 415
    .const 'Sub' $P1420 = "82_1279564394.02125" 
    capture_lex $P1420
    new $P1384, 'ExceptionHandler'
    set_addr $P1384, control_1383
    $P1384."handle_types"(.CONTROL_RETURN)
    push_eh $P1384
    .lex "self", self
    .lex "$/", param_1385
.annotate 'line', 416
    new $P1386, "Undef"
    .lex "$clist", $P1386
.annotate 'line', 417
    new $P1387, "Undef"
    .lex "$past", $P1387
.annotate 'line', 426
    new $P1388, "Undef"
    .lex "$i", $P1388
.annotate 'line', 427
    new $P1389, "Undef"
    .lex "$n", $P1389
.annotate 'line', 416
    find_lex $P1390, "$/"
    unless_null $P1390, vivify_324
    $P1390 = root_new ['parrot';'Hash']
  vivify_324:
    set $P1391, $P1390["cclass_elem"]
    unless_null $P1391, vivify_325
    new $P1391, "Undef"
  vivify_325:
    store_lex "$clist", $P1391
.annotate 'line', 417
    find_lex $P1392, "$clist"
    unless_null $P1392, vivify_326
    $P1392 = root_new ['parrot';'ResizablePMCArray']
  vivify_326:
    set $P1393, $P1392[0]
    unless_null $P1393, vivify_327
    new $P1393, "Undef"
  vivify_327:
    $P1394 = $P1393."ast"()
    store_lex "$past", $P1394
.annotate 'line', 418
    find_lex $P1398, "$past"
    $P1399 = $P1398."negate"()
    if $P1399, if_1397
    set $P1396, $P1399
    goto if_1397_end
  if_1397:
    find_lex $P1400, "$past"
    $S1401 = $P1400."pasttype"()
    iseq $I1402, $S1401, "subrule"
    new $P1396, 'Integer'
    set $P1396, $I1402
  if_1397_end:
    unless $P1396, if_1395_end
.annotate 'line', 419
    find_lex $P1403, "$past"
    $P1403."subtype"("zerowidth")
.annotate 'line', 420
    get_hll_global $P1404, ["PAST"], "Regex"
    find_lex $P1405, "$past"
.annotate 'line', 422
    get_hll_global $P1406, ["PAST"], "Regex"
    $P1407 = $P1406."new"("charclass" :named("pasttype"), "." :named("subtype"))
    find_lex $P1408, "$/"
    $P1409 = $P1404."new"($P1405, $P1407, $P1408 :named("node"))
.annotate 'line', 420
    store_lex "$past", $P1409
  if_1395_end:
.annotate 'line', 426
    new $P1410, "Integer"
    assign $P1410, 1
    store_lex "$i", $P1410
.annotate 'line', 427
    find_lex $P1411, "$clist"
    set $N1412, $P1411
    new $P1413, 'Float'
    set $P1413, $N1412
    store_lex "$n", $P1413
.annotate 'line', 428
    new $P1444, 'ExceptionHandler'
    set_addr $P1444, loop1443_handler
    $P1444."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1444
  loop1443_test:
    find_lex $P1414, "$i"
    set $N1415, $P1414
    find_lex $P1416, "$n"
    set $N1417, $P1416
    islt $I1418, $N1415, $N1417
    unless $I1418, loop1443_done
  loop1443_redo:
    .const 'Sub' $P1420 = "82_1279564394.02125" 
    capture_lex $P1420
    $P1420()
  loop1443_next:
    goto loop1443_test
  loop1443_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1445, exception, 'type'
    eq $P1445, .CONTROL_LOOP_NEXT, loop1443_next
    eq $P1445, .CONTROL_LOOP_REDO, loop1443_redo
  loop1443_done:
    pop_eh 
.annotate 'line', 439
    find_lex $P1446, "$/"
    find_lex $P1447, "$past"
    $P1448 = $P1446."!make"($P1447)
.annotate 'line', 415
    .return ($P1448)
  control_1383:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1449, exception, "payload"
    .return ($P1449)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1419"  :anon :subid("82_1279564394.02125") :outer("81_1279564394.02125")
.annotate 'line', 429
    new $P1421, "Undef"
    .lex "$ast", $P1421
    find_lex $P1422, "$i"
    set $I1423, $P1422
    find_lex $P1424, "$clist"
    unless_null $P1424, vivify_328
    $P1424 = root_new ['parrot';'ResizablePMCArray']
  vivify_328:
    set $P1425, $P1424[$I1423]
    unless_null $P1425, vivify_329
    new $P1425, "Undef"
  vivify_329:
    $P1426 = $P1425."ast"()
    store_lex "$ast", $P1426
.annotate 'line', 430
    find_lex $P1428, "$ast"
    $P1429 = $P1428."negate"()
    if $P1429, if_1427
.annotate 'line', 435
    get_hll_global $P1436, ["PAST"], "Regex"
    find_lex $P1437, "$past"
    find_lex $P1438, "$ast"
    find_lex $P1439, "$/"
    $P1440 = $P1436."new"($P1437, $P1438, "alt" :named("pasttype"), $P1439 :named("node"))
    store_lex "$past", $P1440
.annotate 'line', 434
    goto if_1427_end
  if_1427:
.annotate 'line', 431
    find_lex $P1430, "$ast"
    $P1430."subtype"("zerowidth")
.annotate 'line', 432
    get_hll_global $P1431, ["PAST"], "Regex"
    find_lex $P1432, "$ast"
    find_lex $P1433, "$past"
    find_lex $P1434, "$/"
    $P1435 = $P1431."new"($P1432, $P1433, "concat" :named("pasttype"), $P1434 :named("node"))
    store_lex "$past", $P1435
  if_1427_end:
.annotate 'line', 437
    find_lex $P1441, "$i"
    add $P1442, $P1441, 1
    store_lex "$i", $P1442
.annotate 'line', 428
    .return ($P1442)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "cclass_elem"  :subid("83_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_1453
.annotate 'line', 442
    .const 'Sub' $P1478 = "85_1279564394.02125" 
    capture_lex $P1478
    .const 'Sub' $P1462 = "84_1279564394.02125" 
    capture_lex $P1462
    new $P1452, 'ExceptionHandler'
    set_addr $P1452, control_1451
    $P1452."handle_types"(.CONTROL_RETURN)
    push_eh $P1452
    .lex "self", self
    .lex "$/", param_1453
.annotate 'line', 443
    new $P1454, "Undef"
    .lex "$str", $P1454
.annotate 'line', 444
    new $P1455, "Undef"
    .lex "$past", $P1455
.annotate 'line', 443
    new $P1456, "String"
    assign $P1456, ""
    store_lex "$str", $P1456
    find_lex $P1457, "$past"
.annotate 'line', 445
    find_lex $P1459, "$/"
    unless_null $P1459, vivify_330
    $P1459 = root_new ['parrot';'Hash']
  vivify_330:
    set $P1460, $P1459["name"]
    unless_null $P1460, vivify_331
    new $P1460, "Undef"
  vivify_331:
    if $P1460, if_1458
.annotate 'line', 449
    find_lex $P1473, "$/"
    unless_null $P1473, vivify_332
    $P1473 = root_new ['parrot';'Hash']
  vivify_332:
    set $P1474, $P1473["charspec"]
    unless_null $P1474, vivify_333
    new $P1474, "Undef"
  vivify_333:
    defined $I1475, $P1474
    unless $I1475, for_undef_334
    iter $P1472, $P1474
    new $P1504, 'ExceptionHandler'
    set_addr $P1504, loop1503_handler
    $P1504."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1504
  loop1503_test:
    unless $P1472, loop1503_done
    shift $P1476, $P1472
  loop1503_redo:
    .const 'Sub' $P1478 = "85_1279564394.02125" 
    capture_lex $P1478
    $P1478($P1476)
  loop1503_next:
    goto loop1503_test
  loop1503_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1505, exception, 'type'
    eq $P1505, .CONTROL_LOOP_NEXT, loop1503_next
    eq $P1505, .CONTROL_LOOP_REDO, loop1503_redo
  loop1503_done:
    pop_eh 
  for_undef_334:
.annotate 'line', 474
    get_hll_global $P1506, ["PAST"], "Regex"
    find_lex $P1507, "$str"
    find_lex $P1508, "$/"
    $P1509 = $P1506."new"($P1507, "enumcharlist" :named("pasttype"), $P1508 :named("node"))
    store_lex "$past", $P1509
.annotate 'line', 448
    goto if_1458_end
  if_1458:
.annotate 'line', 445
    .const 'Sub' $P1462 = "84_1279564394.02125" 
    capture_lex $P1462
    $P1462()
  if_1458_end:
.annotate 'line', 476
    find_lex $P1510, "$past"
    find_lex $P1511, "$/"
    unless_null $P1511, vivify_346
    $P1511 = root_new ['parrot';'Hash']
  vivify_346:
    set $P1512, $P1511["sign"]
    unless_null $P1512, vivify_347
    new $P1512, "Undef"
  vivify_347:
    set $S1513, $P1512
    iseq $I1514, $S1513, "-"
    $P1510."negate"($I1514)
.annotate 'line', 477
    find_lex $P1515, "$/"
    find_lex $P1516, "$past"
    $P1517 = $P1515."!make"($P1516)
.annotate 'line', 442
    .return ($P1517)
  control_1451:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1518, exception, "payload"
    .return ($P1518)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1477"  :anon :subid("85_1279564394.02125") :outer("83_1279564394.02125")
    .param pmc param_1479
.annotate 'line', 449
    .const 'Sub' $P1485 = "86_1279564394.02125" 
    capture_lex $P1485
    .lex "$_", param_1479
.annotate 'line', 450
    find_lex $P1482, "$_"
    unless_null $P1482, vivify_335
    $P1482 = root_new ['parrot';'ResizablePMCArray']
  vivify_335:
    set $P1483, $P1482[1]
    unless_null $P1483, vivify_336
    new $P1483, "Undef"
  vivify_336:
    if $P1483, if_1481
.annotate 'line', 472
    find_lex $P1499, "$str"
    find_lex $P1500, "$_"
    unless_null $P1500, vivify_337
    $P1500 = root_new ['parrot';'ResizablePMCArray']
  vivify_337:
    set $P1501, $P1500[0]
    unless_null $P1501, vivify_338
    new $P1501, "Undef"
  vivify_338:
    concat $P1502, $P1499, $P1501
    store_lex "$str", $P1502
    set $P1480, $P1502
.annotate 'line', 450
    goto if_1481_end
  if_1481:
    .const 'Sub' $P1485 = "86_1279564394.02125" 
    capture_lex $P1485
    $P1498 = $P1485()
    set $P1480, $P1498
  if_1481_end:
.annotate 'line', 449
    .return ($P1480)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1484"  :anon :subid("86_1279564394.02125") :outer("85_1279564394.02125")
.annotate 'line', 451
    new $P1486, "Undef"
    .lex "$a", $P1486
.annotate 'line', 452
    new $P1487, "Undef"
    .lex "$b", $P1487
.annotate 'line', 453
    new $P1488, "Undef"
    .lex "$c", $P1488
.annotate 'line', 451
    find_lex $P1489, "$_"
    unless_null $P1489, vivify_339
    $P1489 = root_new ['parrot';'ResizablePMCArray']
  vivify_339:
    set $P1490, $P1489[0]
    unless_null $P1490, vivify_340
    new $P1490, "Undef"
  vivify_340:
    store_lex "$a", $P1490
.annotate 'line', 452
    find_lex $P1491, "$_"
    unless_null $P1491, vivify_341
    $P1491 = root_new ['parrot';'ResizablePMCArray']
  vivify_341:
    set $P1492, $P1491[1]
    unless_null $P1492, vivify_342
    $P1492 = root_new ['parrot';'ResizablePMCArray']
  vivify_342:
    set $P1493, $P1492[0]
    unless_null $P1493, vivify_343
    new $P1493, "Undef"
  vivify_343:
    store_lex "$b", $P1493
.annotate 'line', 453

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
                             $P1494 = box $S2
                         
    store_lex "$c", $P1494
.annotate 'line', 470
    find_lex $P1495, "$str"
    find_lex $P1496, "$c"
    concat $P1497, $P1495, $P1496
    store_lex "$str", $P1497
.annotate 'line', 450
    .return ($P1497)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1461"  :anon :subid("84_1279564394.02125") :outer("83_1279564394.02125")
.annotate 'line', 446
    new $P1463, "Undef"
    .lex "$name", $P1463
    find_lex $P1464, "$/"
    unless_null $P1464, vivify_344
    $P1464 = root_new ['parrot';'Hash']
  vivify_344:
    set $P1465, $P1464["name"]
    unless_null $P1465, vivify_345
    new $P1465, "Undef"
  vivify_345:
    set $S1466, $P1465
    new $P1467, 'String'
    set $P1467, $S1466
    store_lex "$name", $P1467
.annotate 'line', 447
    get_hll_global $P1468, ["PAST"], "Regex"
    find_lex $P1469, "$name"
    find_lex $P1470, "$/"
    $P1471 = $P1468."new"($P1469, "subrule" :named("pasttype"), "method" :named("subtype"), $P1470 :named("node"))
    store_lex "$past", $P1471
.annotate 'line', 445
    .return ($P1471)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "mod_internal"  :subid("87_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_1522
.annotate 'line', 480
    new $P1521, 'ExceptionHandler'
    set_addr $P1521, control_1520
    $P1521."handle_types"(.CONTROL_RETURN)
    push_eh $P1521
    .lex "self", self
    .lex "$/", param_1522
.annotate 'line', 481
    $P1523 = root_new ['parrot';'Hash']
    .lex "%mods", $P1523
.annotate 'line', 482
    new $P1524, "Undef"
    .lex "$n", $P1524
.annotate 'line', 481
    get_global $P1525, "@MODIFIERS"
    unless_null $P1525, vivify_348
    $P1525 = root_new ['parrot';'ResizablePMCArray']
  vivify_348:
    set $P1526, $P1525[0]
    unless_null $P1526, vivify_349
    new $P1526, "Undef"
  vivify_349:
    store_lex "%mods", $P1526
.annotate 'line', 482
    find_lex $P1529, "$/"
    unless_null $P1529, vivify_350
    $P1529 = root_new ['parrot';'Hash']
  vivify_350:
    set $P1530, $P1529["n"]
    unless_null $P1530, vivify_351
    $P1530 = root_new ['parrot';'ResizablePMCArray']
  vivify_351:
    set $P1531, $P1530[0]
    unless_null $P1531, vivify_352
    new $P1531, "Undef"
  vivify_352:
    set $S1532, $P1531
    isgt $I1533, $S1532, ""
    if $I1533, if_1528
    new $P1538, "Integer"
    assign $P1538, 1
    set $P1527, $P1538
    goto if_1528_end
  if_1528:
    find_lex $P1534, "$/"
    unless_null $P1534, vivify_353
    $P1534 = root_new ['parrot';'Hash']
  vivify_353:
    set $P1535, $P1534["n"]
    unless_null $P1535, vivify_354
    $P1535 = root_new ['parrot';'ResizablePMCArray']
  vivify_354:
    set $P1536, $P1535[0]
    unless_null $P1536, vivify_355
    new $P1536, "Undef"
  vivify_355:
    set $N1537, $P1536
    new $P1527, 'Float'
    set $P1527, $N1537
  if_1528_end:
    store_lex "$n", $P1527
.annotate 'line', 483
    find_lex $P1539, "$n"
    find_lex $P1540, "$/"
    unless_null $P1540, vivify_356
    $P1540 = root_new ['parrot';'Hash']
  vivify_356:
    set $P1541, $P1540["mod_ident"]
    unless_null $P1541, vivify_357
    $P1541 = root_new ['parrot';'Hash']
  vivify_357:
    set $P1542, $P1541["sym"]
    unless_null $P1542, vivify_358
    new $P1542, "Undef"
  vivify_358:
    set $S1543, $P1542
    find_lex $P1544, "%mods"
    unless_null $P1544, vivify_359
    $P1544 = root_new ['parrot';'Hash']
    store_lex "%mods", $P1544
  vivify_359:
    set $P1544[$S1543], $P1539
.annotate 'line', 484
    find_lex $P1545, "$/"
    $P1546 = $P1545."!make"(0)
.annotate 'line', 480
    .return ($P1546)
  control_1520:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1547, exception, "payload"
    .return ($P1547)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "subrule_alias"  :subid("88_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_1554
    .param pmc param_1555
.annotate 'line', 578
    new $P1553, 'ExceptionHandler'
    set_addr $P1553, control_1552
    $P1553."handle_types"(.CONTROL_RETURN)
    push_eh $P1553
    .lex "self", self
    .lex "$past", param_1554
    .lex "$name", param_1555
.annotate 'line', 579
    find_lex $P1557, "$past"
    $S1558 = $P1557."name"()
    isgt $I1559, $S1558, ""
    if $I1559, if_1556
.annotate 'line', 580
    find_lex $P1566, "$past"
    find_lex $P1567, "$name"
    $P1566."name"($P1567)
    goto if_1556_end
  if_1556:
.annotate 'line', 579
    find_lex $P1560, "$past"
    find_lex $P1561, "$name"
    concat $P1562, $P1561, "="
    find_lex $P1563, "$past"
    $S1564 = $P1563."name"()
    concat $P1565, $P1562, $S1564
    $P1560."name"($P1565)
  if_1556_end:
.annotate 'line', 581
    find_lex $P1568, "$past"
    $P1569 = $P1568."subtype"("capture")
.annotate 'line', 578
    .return ($P1569)
  control_1552:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1570, exception, "payload"
    .return ($P1570)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "named_assertion"  :subid("89_1279564394.02125") :method :outer("11_1279564394.02125")
    .param pmc param_1574
.annotate 'line', 584
    .const 'Sub' $P1607 = "90_1279564394.02125" 
    capture_lex $P1607
    new $P1573, 'ExceptionHandler'
    set_addr $P1573, control_1572
    $P1573."handle_types"(.CONTROL_RETURN)
    push_eh $P1573
    .lex "self", self
    .lex "$/", param_1574
.annotate 'line', 585
    new $P1575, "Undef"
    .lex "$name", $P1575
.annotate 'line', 586
    new $P1576, "Undef"
    .lex "$past", $P1576
.annotate 'line', 585
    find_lex $P1577, "$/"
    unless_null $P1577, vivify_360
    $P1577 = root_new ['parrot';'Hash']
  vivify_360:
    set $P1578, $P1577["longname"]
    unless_null $P1578, vivify_361
    new $P1578, "Undef"
  vivify_361:
    set $S1579, $P1578
    new $P1580, 'String'
    set $P1580, $S1579
    store_lex "$name", $P1580
.annotate 'line', 586
    get_hll_global $P1581, ["PAST"], "Regex"
    find_lex $P1582, "$name"
    find_lex $P1583, "$name"
    find_lex $P1584, "$/"
    $P1585 = $P1581."new"($P1582, $P1583 :named("name"), "subrule" :named("pasttype"), "capture" :named("subtype"), $P1584 :named("node"))
    store_lex "$past", $P1585
.annotate 'line', 588
    find_lex $P1587, "$/"
    unless_null $P1587, vivify_362
    $P1587 = root_new ['parrot';'Hash']
  vivify_362:
    set $P1588, $P1587["nibbler"]
    unless_null $P1588, vivify_363
    new $P1588, "Undef"
  vivify_363:
    if $P1588, if_1586
.annotate 'line', 591
    find_lex $P1596, "$/"
    unless_null $P1596, vivify_364
    $P1596 = root_new ['parrot';'Hash']
  vivify_364:
    set $P1597, $P1596["arglist"]
    unless_null $P1597, vivify_365
    new $P1597, "Undef"
  vivify_365:
    unless $P1597, if_1595_end
.annotate 'line', 592
    find_lex $P1599, "$/"
    unless_null $P1599, vivify_366
    $P1599 = root_new ['parrot';'Hash']
  vivify_366:
    set $P1600, $P1599["arglist"]
    unless_null $P1600, vivify_367
    $P1600 = root_new ['parrot';'ResizablePMCArray']
  vivify_367:
    set $P1601, $P1600[0]
    unless_null $P1601, vivify_368
    new $P1601, "Undef"
  vivify_368:
    $P1602 = $P1601."ast"()
    $P1603 = $P1602."list"()
    defined $I1604, $P1603
    unless $I1604, for_undef_369
    iter $P1598, $P1603
    new $P1613, 'ExceptionHandler'
    set_addr $P1613, loop1612_handler
    $P1613."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1613
  loop1612_test:
    unless $P1598, loop1612_done
    shift $P1605, $P1598
  loop1612_redo:
    .const 'Sub' $P1607 = "90_1279564394.02125" 
    capture_lex $P1607
    $P1607($P1605)
  loop1612_next:
    goto loop1612_test
  loop1612_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1614, exception, 'type'
    eq $P1614, .CONTROL_LOOP_NEXT, loop1612_next
    eq $P1614, .CONTROL_LOOP_REDO, loop1612_redo
  loop1612_done:
    pop_eh 
  for_undef_369:
  if_1595_end:
.annotate 'line', 591
    goto if_1586_end
  if_1586:
.annotate 'line', 589
    find_lex $P1589, "$past"
    find_lex $P1590, "$/"
    unless_null $P1590, vivify_370
    $P1590 = root_new ['parrot';'Hash']
  vivify_370:
    set $P1591, $P1590["nibbler"]
    unless_null $P1591, vivify_371
    $P1591 = root_new ['parrot';'ResizablePMCArray']
  vivify_371:
    set $P1592, $P1591[0]
    unless_null $P1592, vivify_372
    new $P1592, "Undef"
  vivify_372:
    $P1593 = $P1592."ast"()
    $P1594 = "buildsub"($P1593)
    $P1589."push"($P1594)
  if_1586_end:
.annotate 'line', 588
    find_lex $P1615, "$past"
.annotate 'line', 584
    .return ($P1615)
  control_1572:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1616, exception, "payload"
    .return ($P1616)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1606"  :anon :subid("90_1279564394.02125") :outer("89_1279564394.02125")
    .param pmc param_1608
.annotate 'line', 592
    .lex "$_", param_1608
    find_lex $P1609, "$past"
    find_lex $P1610, "$_"
    $P1611 = $P1609."push"($P1610)
    .return ($P1611)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1618" :load :anon :subid("91_1279564394.02125")
.annotate 'line', 4
    .const 'Sub' $P1620 = "11_1279564394.02125" 
    $P1621 = $P1620()
    .return ($P1621)
.end


.namespace []
.sub "_block1624" :load :anon :subid("92_1279564394.02125")
.annotate 'line', 1
    .const 'Sub' $P1626 = "10_1279564394.02125" 
    $P1627 = $P1626()
    .return ($P1627)
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
