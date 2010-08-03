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
.sub "_block11"  :anon :subid("10_1280467470.54449")
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
    $P572 = $P14()
.annotate 'line', 1
    .return ($P572)
    .const 'Sub' $P574 = "161_1280467470.54449" 
    .return ($P574)
.end


.namespace []
.sub "" :load :init :subid("post162") :outer("10_1280467470.54449")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1280467470.54449" 
    .local pmc block
    set block, $P12
    $P577 = get_root_global ["parrot"], "P6metaclass"
    $P577."new_class"("Regex::P6Regex::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block13"  :subid("11_1280467470.54449") :outer("10_1280467470.54449")
.annotate 'line', 3
    .const 'Sub' $P561 = "158_1280467470.54449" 
    capture_lex $P561
    .const 'Sub' $P554 = "156_1280467470.54449" 
    capture_lex $P554
    .const 'Sub' $P547 = "154_1280467470.54449" 
    capture_lex $P547
    .const 'Sub' $P527 = "149_1280467470.54449" 
    capture_lex $P527
    .const 'Sub' $P493 = "143_1280467470.54449" 
    capture_lex $P493
    .const 'Sub' $P481 = "140_1280467470.54449" 
    capture_lex $P481
    .const 'Sub' $P469 = "137_1280467470.54449" 
    capture_lex $P469
    .const 'Sub' $P463 = "135_1280467470.54449" 
    capture_lex $P463
    .const 'Sub' $P452 = "132_1280467470.54449" 
    capture_lex $P452
    .const 'Sub' $P441 = "129_1280467470.54449" 
    capture_lex $P441
    .const 'Sub' $P432 = "125_1280467470.54449" 
    capture_lex $P432
    .const 'Sub' $P426 = "123_1280467470.54449" 
    capture_lex $P426
    .const 'Sub' $P420 = "121_1280467470.54449" 
    capture_lex $P420
    .const 'Sub' $P414 = "119_1280467470.54449" 
    capture_lex $P414
    .const 'Sub' $P408 = "117_1280467470.54449" 
    capture_lex $P408
    .const 'Sub' $P400 = "115_1280467470.54449" 
    capture_lex $P400
    .const 'Sub' $P389 = "113_1280467470.54449" 
    capture_lex $P389
    .const 'Sub' $P378 = "111_1280467470.54449" 
    capture_lex $P378
    .const 'Sub' $P372 = "109_1280467470.54449" 
    capture_lex $P372
    .const 'Sub' $P366 = "107_1280467470.54449" 
    capture_lex $P366
    .const 'Sub' $P360 = "105_1280467470.54449" 
    capture_lex $P360
    .const 'Sub' $P354 = "103_1280467470.54449" 
    capture_lex $P354
    .const 'Sub' $P348 = "101_1280467470.54449" 
    capture_lex $P348
    .const 'Sub' $P342 = "99_1280467470.54449" 
    capture_lex $P342
    .const 'Sub' $P336 = "97_1280467470.54449" 
    capture_lex $P336
    .const 'Sub' $P330 = "95_1280467470.54449" 
    capture_lex $P330
    .const 'Sub' $P318 = "91_1280467470.54449" 
    capture_lex $P318
    .const 'Sub' $P308 = "89_1280467470.54449" 
    capture_lex $P308
    .const 'Sub' $P301 = "87_1280467470.54449" 
    capture_lex $P301
    .const 'Sub' $P289 = "85_1280467470.54449" 
    capture_lex $P289
    .const 'Sub' $P282 = "83_1280467470.54449" 
    capture_lex $P282
    .const 'Sub' $P276 = "81_1280467470.54449" 
    capture_lex $P276
    .const 'Sub' $P270 = "79_1280467470.54449" 
    capture_lex $P270
    .const 'Sub' $P263 = "77_1280467470.54449" 
    capture_lex $P263
    .const 'Sub' $P256 = "75_1280467470.54449" 
    capture_lex $P256
    .const 'Sub' $P249 = "73_1280467470.54449" 
    capture_lex $P249
    .const 'Sub' $P242 = "71_1280467470.54449" 
    capture_lex $P242
    .const 'Sub' $P236 = "69_1280467470.54449" 
    capture_lex $P236
    .const 'Sub' $P230 = "67_1280467470.54449" 
    capture_lex $P230
    .const 'Sub' $P224 = "65_1280467470.54449" 
    capture_lex $P224
    .const 'Sub' $P218 = "63_1280467470.54449" 
    capture_lex $P218
    .const 'Sub' $P212 = "61_1280467470.54449" 
    capture_lex $P212
    .const 'Sub' $P207 = "59_1280467470.54449" 
    capture_lex $P207
    .const 'Sub' $P202 = "57_1280467470.54449" 
    capture_lex $P202
    .const 'Sub' $P196 = "55_1280467470.54449" 
    capture_lex $P196
    .const 'Sub' $P190 = "53_1280467470.54449" 
    capture_lex $P190
    .const 'Sub' $P184 = "51_1280467470.54449" 
    capture_lex $P184
    .const 'Sub' $P169 = "46_1280467470.54449" 
    capture_lex $P169
    .const 'Sub' $P154 = "44_1280467470.54449" 
    capture_lex $P154
    .const 'Sub' $P147 = "42_1280467470.54449" 
    capture_lex $P147
    .const 'Sub' $P140 = "40_1280467470.54449" 
    capture_lex $P140
    .const 'Sub' $P133 = "38_1280467470.54449" 
    capture_lex $P133
    .const 'Sub' $P116 = "33_1280467470.54449" 
    capture_lex $P116
    .const 'Sub' $P104 = "30_1280467470.54449" 
    capture_lex $P104
    .const 'Sub' $P97 = "28_1280467470.54449" 
    capture_lex $P97
    .const 'Sub' $P87 = "26_1280467470.54449" 
    capture_lex $P87
    .const 'Sub' $P80 = "24_1280467470.54449" 
    capture_lex $P80
    .const 'Sub' $P68 = "22_1280467470.54449" 
    capture_lex $P68
    .const 'Sub' $P61 = "20_1280467470.54449" 
    capture_lex $P61
    .const 'Sub' $P54 = "18_1280467470.54449" 
    capture_lex $P54
    .const 'Sub' $P44 = "15_1280467470.54449" 
    capture_lex $P44
    .const 'Sub' $P37 = "13_1280467470.54449" 
    capture_lex $P37
    .const 'Sub' $P15 = "12_1280467470.54449" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    .const 'Sub' $P561 = "158_1280467470.54449" 
    capture_lex $P561
    .return ($P561)
    .const 'Sub' $P569 = "160_1280467470.54449" 
    .return ($P569)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.include "except_types.pasm"
.sub "obs"  :subid("12_1280467470.54449") :method :outer("11_1280467470.54449")
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
    assign $P23, "Unsupported use of "
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
    $P35 = $P22."panic"($P34)
.annotate 'line', 3
    .return ($P35)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P36, exception, "payload"
    .return ($P36)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "ws"  :subid("13_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx38_tgt
    .local int rx38_pos
    .local int rx38_off
    .local int rx38_eos
    .local int rx38_rep
    .local pmc rx38_cur
    (rx38_cur, rx38_pos, rx38_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx38_cur
    .local pmc match
    .lex "$/", match
    length rx38_eos, rx38_tgt
    gt rx38_pos, rx38_eos, rx38_done
    set rx38_off, 0
    lt rx38_pos, 2, rx38_start
    sub rx38_off, rx38_pos, 1
    substr rx38_tgt, rx38_tgt, rx38_off
  rx38_start:
    eq $I10, 1, rx38_restart
    rx38_cur."!cursor_debug"("START ", "ws")
    $I10 = self.'from'()
    ne $I10, -1, rxscan41_done
    goto rxscan41_scan
  rxscan41_loop:
    ($P10) = rx38_cur."from"()
    inc $P10
    set rx38_pos, $P10
    ge rx38_pos, rx38_eos, rxscan41_done
  rxscan41_scan:
    set_addr $I10, rxscan41_loop
    rx38_cur."!mark_push"(0, rx38_pos, $I10)
  rxscan41_done:
.annotate 'line', 8
  # rx rxquantr42 ** 0..*
    set_addr $I10, rxquantr42_done
    rx38_cur."!mark_push"(0, rx38_pos, $I10)
  rxquantr42_loop:
  alt43_0:
    set_addr $I10, alt43_1
    rx38_cur."!mark_push"(0, rx38_pos, $I10)
  # rx charclass_q s r 1..-1
    sub $I10, rx38_pos, rx38_off
    find_not_cclass $I11, 32, rx38_tgt, $I10, rx38_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx38_fail
    add rx38_pos, rx38_off, $I11
    goto alt43_end
  alt43_1:
  # rx literal  "#"
    add $I11, rx38_pos, 1
    gt $I11, rx38_eos, rx38_fail
    sub $I11, rx38_pos, rx38_off
    substr $S10, rx38_tgt, $I11, 1
    ne $S10, "#", rx38_fail
    add rx38_pos, 1
  # rx charclass_q N r 0..-1
    sub $I10, rx38_pos, rx38_off
    find_cclass $I11, 4096, rx38_tgt, $I10, rx38_eos
    add rx38_pos, rx38_off, $I11
  alt43_end:
    set_addr $I10, rxquantr42_done
    (rx38_rep) = rx38_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr42_done
    rx38_cur."!mark_push"(rx38_rep, rx38_pos, $I10)
    goto rxquantr42_loop
  rxquantr42_done:
  # rx pass
    rx38_cur."!cursor_pass"(rx38_pos, "ws")
    rx38_cur."!cursor_debug"("PASS  ", "ws", " at pos=", rx38_pos)
    .return (rx38_cur)
  rx38_restart:
.annotate 'line', 3
    rx38_cur."!cursor_debug"("NEXT ", "ws")
  rx38_fail:
    (rx38_rep, rx38_pos, $I10, $P10) = rx38_cur."!mark_fail"(0)
    lt rx38_pos, -1, rx38_done
    eq rx38_pos, -1, rx38_fail
    jump $I10
  rx38_done:
    rx38_cur."!cursor_fail"()
    rx38_cur."!cursor_debug"("FAIL  ", "ws")
    .return (rx38_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__ws"  :subid("14_1280467470.54449") :method
.annotate 'line', 3
    new $P40, "ResizablePMCArray"
    push $P40, ""
    .return ($P40)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "normspace"  :subid("15_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .const 'Sub' $P50 = "17_1280467470.54449" 
    capture_lex $P50
    .local string rx45_tgt
    .local int rx45_pos
    .local int rx45_off
    .local int rx45_eos
    .local int rx45_rep
    .local pmc rx45_cur
    (rx45_cur, rx45_pos, rx45_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx45_cur
    .local pmc match
    .lex "$/", match
    length rx45_eos, rx45_tgt
    gt rx45_pos, rx45_eos, rx45_done
    set rx45_off, 0
    lt rx45_pos, 2, rx45_start
    sub rx45_off, rx45_pos, 1
    substr rx45_tgt, rx45_tgt, rx45_off
  rx45_start:
    eq $I10, 1, rx45_restart
    rx45_cur."!cursor_debug"("START ", "normspace")
    $I10 = self.'from'()
    ne $I10, -1, rxscan48_done
    goto rxscan48_scan
  rxscan48_loop:
    ($P10) = rx45_cur."from"()
    inc $P10
    set rx45_pos, $P10
    ge rx45_pos, rx45_eos, rxscan48_done
  rxscan48_scan:
    set_addr $I10, rxscan48_loop
    rx45_cur."!mark_push"(0, rx45_pos, $I10)
  rxscan48_done:
.annotate 'line', 10
  # rx subrule "before" subtype=zerowidth negate=
    rx45_cur."!cursor_pos"(rx45_pos)
    .const 'Sub' $P50 = "17_1280467470.54449" 
    capture_lex $P50
    $P10 = rx45_cur."before"($P50)
    unless $P10, rx45_fail
  # rx subrule "ws" subtype=method negate=
    rx45_cur."!cursor_pos"(rx45_pos)
    $P10 = rx45_cur."ws"()
    unless $P10, rx45_fail
    rx45_pos = $P10."pos"()
  # rx pass
    rx45_cur."!cursor_pass"(rx45_pos, "normspace")
    rx45_cur."!cursor_debug"("PASS  ", "normspace", " at pos=", rx45_pos)
    .return (rx45_cur)
  rx45_restart:
.annotate 'line', 3
    rx45_cur."!cursor_debug"("NEXT ", "normspace")
  rx45_fail:
    (rx45_rep, rx45_pos, $I10, $P10) = rx45_cur."!mark_fail"(0)
    lt rx45_pos, -1, rx45_done
    eq rx45_pos, -1, rx45_fail
    jump $I10
  rx45_done:
    rx45_cur."!cursor_fail"()
    rx45_cur."!cursor_debug"("FAIL  ", "normspace")
    .return (rx45_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__normspace"  :subid("16_1280467470.54449") :method
.annotate 'line', 3
    new $P47, "ResizablePMCArray"
    push $P47, ""
    .return ($P47)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block49"  :anon :subid("17_1280467470.54449") :method :outer("15_1280467470.54449")
.annotate 'line', 10
    .local string rx51_tgt
    .local int rx51_pos
    .local int rx51_off
    .local int rx51_eos
    .local int rx51_rep
    .local pmc rx51_cur
    (rx51_cur, rx51_pos, rx51_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx51_cur
    .local pmc match
    .lex "$/", match
    length rx51_eos, rx51_tgt
    gt rx51_pos, rx51_eos, rx51_done
    set rx51_off, 0
    lt rx51_pos, 2, rx51_start
    sub rx51_off, rx51_pos, 1
    substr rx51_tgt, rx51_tgt, rx51_off
  rx51_start:
    eq $I10, 1, rx51_restart
    rx51_cur."!cursor_debug"("START ", "")
    $I10 = self.'from'()
    ne $I10, -1, rxscan52_done
    goto rxscan52_scan
  rxscan52_loop:
    ($P10) = rx51_cur."from"()
    inc $P10
    set rx51_pos, $P10
    ge rx51_pos, rx51_eos, rxscan52_done
  rxscan52_scan:
    set_addr $I10, rxscan52_loop
    rx51_cur."!mark_push"(0, rx51_pos, $I10)
  rxscan52_done:
  alt53_0:
    set_addr $I10, alt53_1
    rx51_cur."!mark_push"(0, rx51_pos, $I10)
  # rx charclass s
    ge rx51_pos, rx51_eos, rx51_fail
    sub $I10, rx51_pos, rx51_off
    is_cclass $I11, 32, rx51_tgt, $I10
    unless $I11, rx51_fail
    inc rx51_pos
    goto alt53_end
  alt53_1:
  # rx literal  "#"
    add $I11, rx51_pos, 1
    gt $I11, rx51_eos, rx51_fail
    sub $I11, rx51_pos, rx51_off
    substr $S10, rx51_tgt, $I11, 1
    ne $S10, "#", rx51_fail
    add rx51_pos, 1
  alt53_end:
  # rx pass
    rx51_cur."!cursor_pass"(rx51_pos, "")
    rx51_cur."!cursor_debug"("PASS  ", "", " at pos=", rx51_pos)
    .return (rx51_cur)
  rx51_restart:
    rx51_cur."!cursor_debug"("NEXT ", "")
  rx51_fail:
    (rx51_rep, rx51_pos, $I10, $P10) = rx51_cur."!mark_fail"(0)
    lt rx51_pos, -1, rx51_done
    eq rx51_pos, -1, rx51_fail
    jump $I10
  rx51_done:
    rx51_cur."!cursor_fail"()
    rx51_cur."!cursor_debug"("FAIL  ", "")
    .return (rx51_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "identifier"  :subid("18_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx55_tgt
    .local int rx55_pos
    .local int rx55_off
    .local int rx55_eos
    .local int rx55_rep
    .local pmc rx55_cur
    (rx55_cur, rx55_pos, rx55_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx55_cur
    .local pmc match
    .lex "$/", match
    length rx55_eos, rx55_tgt
    gt rx55_pos, rx55_eos, rx55_done
    set rx55_off, 0
    lt rx55_pos, 2, rx55_start
    sub rx55_off, rx55_pos, 1
    substr rx55_tgt, rx55_tgt, rx55_off
  rx55_start:
    eq $I10, 1, rx55_restart
    rx55_cur."!cursor_debug"("START ", "identifier")
    $I10 = self.'from'()
    ne $I10, -1, rxscan59_done
    goto rxscan59_scan
  rxscan59_loop:
    ($P10) = rx55_cur."from"()
    inc $P10
    set rx55_pos, $P10
    ge rx55_pos, rx55_eos, rxscan59_done
  rxscan59_scan:
    set_addr $I10, rxscan59_loop
    rx55_cur."!mark_push"(0, rx55_pos, $I10)
  rxscan59_done:
.annotate 'line', 12
  # rx subrule "ident" subtype=method negate=
    rx55_cur."!cursor_pos"(rx55_pos)
    $P10 = rx55_cur."ident"()
    unless $P10, rx55_fail
    rx55_pos = $P10."pos"()
  # rx rxquantr60 ** 0..*
    set_addr $I10, rxquantr60_done
    rx55_cur."!mark_push"(0, rx55_pos, $I10)
  rxquantr60_loop:
  # rx enumcharlist negate=0 
    ge rx55_pos, rx55_eos, rx55_fail
    sub $I10, rx55_pos, rx55_off
    substr $S10, rx55_tgt, $I10, 1
    index $I11, "-'", $S10
    lt $I11, 0, rx55_fail
    inc rx55_pos
  # rx subrule "ident" subtype=method negate=
    rx55_cur."!cursor_pos"(rx55_pos)
    $P10 = rx55_cur."ident"()
    unless $P10, rx55_fail
    rx55_pos = $P10."pos"()
    set_addr $I10, rxquantr60_done
    (rx55_rep) = rx55_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr60_done
    rx55_cur."!mark_push"(rx55_rep, rx55_pos, $I10)
    goto rxquantr60_loop
  rxquantr60_done:
  # rx pass
    rx55_cur."!cursor_pass"(rx55_pos, "identifier")
    rx55_cur."!cursor_debug"("PASS  ", "identifier", " at pos=", rx55_pos)
    .return (rx55_cur)
  rx55_restart:
.annotate 'line', 3
    rx55_cur."!cursor_debug"("NEXT ", "identifier")
  rx55_fail:
    (rx55_rep, rx55_pos, $I10, $P10) = rx55_cur."!mark_fail"(0)
    lt rx55_pos, -1, rx55_done
    eq rx55_pos, -1, rx55_fail
    jump $I10
  rx55_done:
    rx55_cur."!cursor_fail"()
    rx55_cur."!cursor_debug"("FAIL  ", "identifier")
    .return (rx55_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__identifier"  :subid("19_1280467470.54449") :method
.annotate 'line', 3
    $P57 = self."!PREFIX__!subrule"("ident", "")
    new $P58, "ResizablePMCArray"
    push $P58, $P57
    .return ($P58)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "arg"  :subid("20_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx62_tgt
    .local int rx62_pos
    .local int rx62_off
    .local int rx62_eos
    .local int rx62_rep
    .local pmc rx62_cur
    (rx62_cur, rx62_pos, rx62_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx62_cur
    .local pmc match
    .lex "$/", match
    length rx62_eos, rx62_tgt
    gt rx62_pos, rx62_eos, rx62_done
    set rx62_off, 0
    lt rx62_pos, 2, rx62_start
    sub rx62_off, rx62_pos, 1
    substr rx62_tgt, rx62_tgt, rx62_off
  rx62_start:
    eq $I10, 1, rx62_restart
    rx62_cur."!cursor_debug"("START ", "arg")
    $I10 = self.'from'()
    ne $I10, -1, rxscan65_done
    goto rxscan65_scan
  rxscan65_loop:
    ($P10) = rx62_cur."from"()
    inc $P10
    set rx62_pos, $P10
    ge rx62_pos, rx62_eos, rxscan65_done
  rxscan65_scan:
    set_addr $I10, rxscan65_loop
    rx62_cur."!mark_push"(0, rx62_pos, $I10)
  rxscan65_done:
  alt66_0:
.annotate 'line', 15
    set_addr $I10, alt66_1
    rx62_cur."!mark_push"(0, rx62_pos, $I10)
.annotate 'line', 16
  # rx enumcharlist negate=0 zerowidth
    ge rx62_pos, rx62_eos, rx62_fail
    sub $I10, rx62_pos, rx62_off
    substr $S10, rx62_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx62_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx62_cur."!cursor_pos"(rx62_pos)
    $P10 = rx62_cur."quote_EXPR"(":q")
    unless $P10, rx62_fail
    rx62_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx62_pos = $P10."pos"()
    goto alt66_end
  alt66_1:
    set_addr $I10, alt66_2
    rx62_cur."!mark_push"(0, rx62_pos, $I10)
.annotate 'line', 17
  # rx enumcharlist negate=0 zerowidth
    ge rx62_pos, rx62_eos, rx62_fail
    sub $I10, rx62_pos, rx62_off
    substr $S10, rx62_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx62_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx62_cur."!cursor_pos"(rx62_pos)
    $P10 = rx62_cur."quote_EXPR"(":qq")
    unless $P10, rx62_fail
    rx62_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx62_pos = $P10."pos"()
    goto alt66_end
  alt66_2:
.annotate 'line', 18
  # rx subcapture "val"
    set_addr $I10, rxcap_67_fail
    rx62_cur."!mark_push"(0, rx62_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx62_pos, rx62_off
    find_not_cclass $I11, 8, rx62_tgt, $I10, rx62_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx62_fail
    add rx62_pos, rx62_off, $I11
    set_addr $I10, rxcap_67_fail
    ($I12, $I11) = rx62_cur."!mark_peek"($I10)
    rx62_cur."!cursor_pos"($I11)
    ($P10) = rx62_cur."!cursor_start"()
    $P10."!cursor_pass"(rx62_pos, "")
    rx62_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("val")
    goto rxcap_67_done
  rxcap_67_fail:
    goto rx62_fail
  rxcap_67_done:
  alt66_end:
.annotate 'line', 14
  # rx pass
    rx62_cur."!cursor_pass"(rx62_pos, "arg")
    rx62_cur."!cursor_debug"("PASS  ", "arg", " at pos=", rx62_pos)
    .return (rx62_cur)
  rx62_restart:
.annotate 'line', 3
    rx62_cur."!cursor_debug"("NEXT ", "arg")
  rx62_fail:
    (rx62_rep, rx62_pos, $I10, $P10) = rx62_cur."!mark_fail"(0)
    lt rx62_pos, -1, rx62_done
    eq rx62_pos, -1, rx62_fail
    jump $I10
  rx62_done:
    rx62_cur."!cursor_fail"()
    rx62_cur."!cursor_debug"("FAIL  ", "arg")
    .return (rx62_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__arg"  :subid("21_1280467470.54449") :method
.annotate 'line', 3
    new $P64, "ResizablePMCArray"
    push $P64, ""
    push $P64, "\""
    push $P64, "'"
    .return ($P64)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "arglist"  :subid("22_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx69_tgt
    .local int rx69_pos
    .local int rx69_off
    .local int rx69_eos
    .local int rx69_rep
    .local pmc rx69_cur
    (rx69_cur, rx69_pos, rx69_tgt, $I10) = self."!cursor_start"()
    rx69_cur."!cursor_caparray"("arg")
    .lex unicode:"$\x{a2}", rx69_cur
    .local pmc match
    .lex "$/", match
    length rx69_eos, rx69_tgt
    gt rx69_pos, rx69_eos, rx69_done
    set rx69_off, 0
    lt rx69_pos, 2, rx69_start
    sub rx69_off, rx69_pos, 1
    substr rx69_tgt, rx69_tgt, rx69_off
  rx69_start:
    eq $I10, 1, rx69_restart
    rx69_cur."!cursor_debug"("START ", "arglist")
    $I10 = self.'from'()
    ne $I10, -1, rxscan73_done
    goto rxscan73_scan
  rxscan73_loop:
    ($P10) = rx69_cur."from"()
    inc $P10
    set rx69_pos, $P10
    ge rx69_pos, rx69_eos, rxscan73_done
  rxscan73_scan:
    set_addr $I10, rxscan73_loop
    rx69_cur."!mark_push"(0, rx69_pos, $I10)
  rxscan73_done:
.annotate 'line', 22
  # rx subrule "ws" subtype=method negate=
    rx69_cur."!cursor_pos"(rx69_pos)
    $P10 = rx69_cur."ws"()
    unless $P10, rx69_fail
    rx69_pos = $P10."pos"()
  # rx subrule "arg" subtype=capture negate=
    rx69_cur."!cursor_pos"(rx69_pos)
    $P10 = rx69_cur."arg"()
    unless $P10, rx69_fail
    rx69_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arg")
    rx69_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx69_cur."!cursor_pos"(rx69_pos)
    $P10 = rx69_cur."ws"()
    unless $P10, rx69_fail
    rx69_pos = $P10."pos"()
  # rx rxquantr76 ** 0..*
    set_addr $I10, rxquantr76_done
    rx69_cur."!mark_push"(0, rx69_pos, $I10)
  rxquantr76_loop:
  # rx subrule "ws" subtype=method negate=
    rx69_cur."!cursor_pos"(rx69_pos)
    $P10 = rx69_cur."ws"()
    unless $P10, rx69_fail
    rx69_pos = $P10."pos"()
  # rx literal  ","
    add $I11, rx69_pos, 1
    gt $I11, rx69_eos, rx69_fail
    sub $I11, rx69_pos, rx69_off
    substr $S10, rx69_tgt, $I11, 1
    ne $S10, ",", rx69_fail
    add rx69_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx69_cur."!cursor_pos"(rx69_pos)
    $P10 = rx69_cur."ws"()
    unless $P10, rx69_fail
    rx69_pos = $P10."pos"()
  # rx subrule "arg" subtype=capture negate=
    rx69_cur."!cursor_pos"(rx69_pos)
    $P10 = rx69_cur."arg"()
    unless $P10, rx69_fail
    rx69_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arg")
    rx69_pos = $P10."pos"()
    set_addr $I10, rxquantr76_done
    (rx69_rep) = rx69_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr76_done
    rx69_cur."!mark_push"(rx69_rep, rx69_pos, $I10)
    goto rxquantr76_loop
  rxquantr76_done:
  # rx subrule "ws" subtype=method negate=
    rx69_cur."!cursor_pos"(rx69_pos)
    $P10 = rx69_cur."ws"()
    unless $P10, rx69_fail
    rx69_pos = $P10."pos"()
  # rx pass
    rx69_cur."!cursor_pass"(rx69_pos, "arglist")
    rx69_cur."!cursor_debug"("PASS  ", "arglist", " at pos=", rx69_pos)
    .return (rx69_cur)
  rx69_restart:
.annotate 'line', 3
    rx69_cur."!cursor_debug"("NEXT ", "arglist")
  rx69_fail:
    (rx69_rep, rx69_pos, $I10, $P10) = rx69_cur."!mark_fail"(0)
    lt rx69_pos, -1, rx69_done
    eq rx69_pos, -1, rx69_fail
    jump $I10
  rx69_done:
    rx69_cur."!cursor_fail"()
    rx69_cur."!cursor_debug"("FAIL  ", "arglist")
    .return (rx69_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__arglist"  :subid("23_1280467470.54449") :method
.annotate 'line', 3
    $P71 = self."!PREFIX__!subrule"("ws", "")
    new $P72, "ResizablePMCArray"
    push $P72, $P71
    .return ($P72)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "TOP"  :subid("24_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx81_tgt
    .local int rx81_pos
    .local int rx81_off
    .local int rx81_eos
    .local int rx81_rep
    .local pmc rx81_cur
    (rx81_cur, rx81_pos, rx81_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx81_cur
    .local pmc match
    .lex "$/", match
    length rx81_eos, rx81_tgt
    gt rx81_pos, rx81_eos, rx81_done
    set rx81_off, 0
    lt rx81_pos, 2, rx81_start
    sub rx81_off, rx81_pos, 1
    substr rx81_tgt, rx81_tgt, rx81_off
  rx81_start:
    eq $I10, 1, rx81_restart
    rx81_cur."!cursor_debug"("START ", "TOP")
    $I10 = self.'from'()
    ne $I10, -1, rxscan85_done
    goto rxscan85_scan
  rxscan85_loop:
    ($P10) = rx81_cur."from"()
    inc $P10
    set rx81_pos, $P10
    ge rx81_pos, rx81_eos, rxscan85_done
  rxscan85_scan:
    set_addr $I10, rxscan85_loop
    rx81_cur."!mark_push"(0, rx81_pos, $I10)
  rxscan85_done:
.annotate 'line', 25
  # rx subrule "nibbler" subtype=capture negate=
    rx81_cur."!cursor_pos"(rx81_pos)
    $P10 = rx81_cur."nibbler"()
    unless $P10, rx81_fail
    rx81_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx81_pos = $P10."pos"()
  alt86_0:
.annotate 'line', 26
    set_addr $I10, alt86_1
    rx81_cur."!mark_push"(0, rx81_pos, $I10)
  # rxanchor eos
    ne rx81_pos, rx81_eos, rx81_fail
    goto alt86_end
  alt86_1:
  # rx subrule "panic" subtype=method negate=
    rx81_cur."!cursor_pos"(rx81_pos)
    $P10 = rx81_cur."panic"("Confused")
    unless $P10, rx81_fail
    rx81_pos = $P10."pos"()
  alt86_end:
.annotate 'line', 24
  # rx pass
    rx81_cur."!cursor_pass"(rx81_pos, "TOP")
    rx81_cur."!cursor_debug"("PASS  ", "TOP", " at pos=", rx81_pos)
    .return (rx81_cur)
  rx81_restart:
.annotate 'line', 3
    rx81_cur."!cursor_debug"("NEXT ", "TOP")
  rx81_fail:
    (rx81_rep, rx81_pos, $I10, $P10) = rx81_cur."!mark_fail"(0)
    lt rx81_pos, -1, rx81_done
    eq rx81_pos, -1, rx81_fail
    jump $I10
  rx81_done:
    rx81_cur."!cursor_fail"()
    rx81_cur."!cursor_debug"("FAIL  ", "TOP")
    .return (rx81_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__TOP"  :subid("25_1280467470.54449") :method
.annotate 'line', 3
    $P83 = self."!PREFIX__!subrule"("nibbler", "")
    new $P84, "ResizablePMCArray"
    push $P84, $P83
    .return ($P84)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "nibbler"  :subid("26_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx88_tgt
    .local int rx88_pos
    .local int rx88_off
    .local int rx88_eos
    .local int rx88_rep
    .local pmc rx88_cur
    (rx88_cur, rx88_pos, rx88_tgt, $I10) = self."!cursor_start"()
    rx88_cur."!cursor_caparray"("termish")
    .lex unicode:"$\x{a2}", rx88_cur
    .local pmc match
    .lex "$/", match
    length rx88_eos, rx88_tgt
    gt rx88_pos, rx88_eos, rx88_done
    set rx88_off, 0
    lt rx88_pos, 2, rx88_start
    sub rx88_off, rx88_pos, 1
    substr rx88_tgt, rx88_tgt, rx88_off
  rx88_start:
    eq $I10, 1, rx88_restart
    rx88_cur."!cursor_debug"("START ", "nibbler")
    $I10 = self.'from'()
    ne $I10, -1, rxscan91_done
    goto rxscan91_scan
  rxscan91_loop:
    ($P10) = rx88_cur."from"()
    inc $P10
    set rx88_pos, $P10
    ge rx88_pos, rx88_eos, rxscan91_done
  rxscan91_scan:
    set_addr $I10, rxscan91_loop
    rx88_cur."!mark_push"(0, rx88_pos, $I10)
  rxscan91_done:
.annotate 'line', 30
  # rx reduce name="nibbler" key="open"
    rx88_cur."!cursor_pos"(rx88_pos)
    rx88_cur."!reduce"("nibbler", "open")
.annotate 'line', 31
  # rx rxquantr92 ** 0..1
    set_addr $I10, rxquantr92_done
    rx88_cur."!mark_push"(0, rx88_pos, $I10)
  rxquantr92_loop:
  # rx subrule "ws" subtype=method negate=
    rx88_cur."!cursor_pos"(rx88_pos)
    $P10 = rx88_cur."ws"()
    unless $P10, rx88_fail
    rx88_pos = $P10."pos"()
  alt93_0:
    set_addr $I10, alt93_1
    rx88_cur."!mark_push"(0, rx88_pos, $I10)
  # rx literal  "||"
    add $I11, rx88_pos, 2
    gt $I11, rx88_eos, rx88_fail
    sub $I11, rx88_pos, rx88_off
    substr $S10, rx88_tgt, $I11, 2
    ne $S10, "||", rx88_fail
    add rx88_pos, 2
    goto alt93_end
  alt93_1:
    set_addr $I10, alt93_2
    rx88_cur."!mark_push"(0, rx88_pos, $I10)
  # rx literal  "|"
    add $I11, rx88_pos, 1
    gt $I11, rx88_eos, rx88_fail
    sub $I11, rx88_pos, rx88_off
    substr $S10, rx88_tgt, $I11, 1
    ne $S10, "|", rx88_fail
    add rx88_pos, 1
    goto alt93_end
  alt93_2:
    set_addr $I10, alt93_3
    rx88_cur."!mark_push"(0, rx88_pos, $I10)
  # rx literal  "&&"
    add $I11, rx88_pos, 2
    gt $I11, rx88_eos, rx88_fail
    sub $I11, rx88_pos, rx88_off
    substr $S10, rx88_tgt, $I11, 2
    ne $S10, "&&", rx88_fail
    add rx88_pos, 2
    goto alt93_end
  alt93_3:
  # rx literal  "&"
    add $I11, rx88_pos, 1
    gt $I11, rx88_eos, rx88_fail
    sub $I11, rx88_pos, rx88_off
    substr $S10, rx88_tgt, $I11, 1
    ne $S10, "&", rx88_fail
    add rx88_pos, 1
  alt93_end:
    set_addr $I10, rxquantr92_done
    (rx88_rep) = rx88_cur."!mark_commit"($I10)
  rxquantr92_done:
.annotate 'line', 32
  # rx subrule "termish" subtype=capture negate=
    rx88_cur."!cursor_pos"(rx88_pos)
    $P10 = rx88_cur."termish"()
    unless $P10, rx88_fail
    rx88_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("termish")
    rx88_pos = $P10."pos"()
.annotate 'line', 35
  # rx rxquantr94 ** 0..*
    set_addr $I10, rxquantr94_done
    rx88_cur."!mark_push"(0, rx88_pos, $I10)
  rxquantr94_loop:
  alt95_0:
.annotate 'line', 33
    set_addr $I10, alt95_1
    rx88_cur."!mark_push"(0, rx88_pos, $I10)
  # rx literal  "||"
    add $I11, rx88_pos, 2
    gt $I11, rx88_eos, rx88_fail
    sub $I11, rx88_pos, rx88_off
    substr $S10, rx88_tgt, $I11, 2
    ne $S10, "||", rx88_fail
    add rx88_pos, 2
    goto alt95_end
  alt95_1:
  # rx literal  "|"
    add $I11, rx88_pos, 1
    gt $I11, rx88_eos, rx88_fail
    sub $I11, rx88_pos, rx88_off
    substr $S10, rx88_tgt, $I11, 1
    ne $S10, "|", rx88_fail
    add rx88_pos, 1
  alt95_end:
  alt96_0:
.annotate 'line', 34
    set_addr $I10, alt96_1
    rx88_cur."!mark_push"(0, rx88_pos, $I10)
  # rx subrule "termish" subtype=capture negate=
    rx88_cur."!cursor_pos"(rx88_pos)
    $P10 = rx88_cur."termish"()
    unless $P10, rx88_fail
    rx88_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("termish")
    rx88_pos = $P10."pos"()
    goto alt96_end
  alt96_1:
  # rx subrule "panic" subtype=method negate=
    rx88_cur."!cursor_pos"(rx88_pos)
    $P10 = rx88_cur."panic"("Null pattern not allowed")
    unless $P10, rx88_fail
    rx88_pos = $P10."pos"()
  alt96_end:
.annotate 'line', 35
    set_addr $I10, rxquantr94_done
    (rx88_rep) = rx88_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr94_done
    rx88_cur."!mark_push"(rx88_rep, rx88_pos, $I10)
    goto rxquantr94_loop
  rxquantr94_done:
.annotate 'line', 29
  # rx pass
    rx88_cur."!cursor_pass"(rx88_pos, "nibbler")
    rx88_cur."!cursor_debug"("PASS  ", "nibbler", " at pos=", rx88_pos)
    .return (rx88_cur)
  rx88_restart:
.annotate 'line', 3
    rx88_cur."!cursor_debug"("NEXT ", "nibbler")
  rx88_fail:
    (rx88_rep, rx88_pos, $I10, $P10) = rx88_cur."!mark_fail"(0)
    lt rx88_pos, -1, rx88_done
    eq rx88_pos, -1, rx88_fail
    jump $I10
  rx88_done:
    rx88_cur."!cursor_fail"()
    rx88_cur."!cursor_debug"("FAIL  ", "nibbler")
    .return (rx88_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__nibbler"  :subid("27_1280467470.54449") :method
.annotate 'line', 3
    new $P90, "ResizablePMCArray"
    push $P90, ""
    .return ($P90)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "termish"  :subid("28_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx98_tgt
    .local int rx98_pos
    .local int rx98_off
    .local int rx98_eos
    .local int rx98_rep
    .local pmc rx98_cur
    (rx98_cur, rx98_pos, rx98_tgt, $I10) = self."!cursor_start"()
    rx98_cur."!cursor_caparray"("noun")
    .lex unicode:"$\x{a2}", rx98_cur
    .local pmc match
    .lex "$/", match
    length rx98_eos, rx98_tgt
    gt rx98_pos, rx98_eos, rx98_done
    set rx98_off, 0
    lt rx98_pos, 2, rx98_start
    sub rx98_off, rx98_pos, 1
    substr rx98_tgt, rx98_tgt, rx98_off
  rx98_start:
    eq $I10, 1, rx98_restart
    rx98_cur."!cursor_debug"("START ", "termish")
    $I10 = self.'from'()
    ne $I10, -1, rxscan101_done
    goto rxscan101_scan
  rxscan101_loop:
    ($P10) = rx98_cur."from"()
    inc $P10
    set rx98_pos, $P10
    ge rx98_pos, rx98_eos, rxscan101_done
  rxscan101_scan:
    set_addr $I10, rxscan101_loop
    rx98_cur."!mark_push"(0, rx98_pos, $I10)
  rxscan101_done:
.annotate 'line', 39
  # rx rxquantr102 ** 1..*
    set_addr $I10, rxquantr102_done
    rx98_cur."!mark_push"(0, -1, $I10)
  rxquantr102_loop:
  # rx subrule "quantified_atom" subtype=capture negate=
    rx98_cur."!cursor_pos"(rx98_pos)
    $P10 = rx98_cur."quantified_atom"()
    unless $P10, rx98_fail
    goto rxsubrule103_pass
  rxsubrule103_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx98_fail
  rxsubrule103_pass:
    set_addr $I10, rxsubrule103_back
    rx98_cur."!mark_push"(0, rx98_pos, $I10, $P10)
    $P10."!cursor_names"("noun")
    rx98_pos = $P10."pos"()
    set_addr $I10, rxquantr102_done
    (rx98_rep) = rx98_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr102_done
    rx98_cur."!mark_push"(rx98_rep, rx98_pos, $I10)
    goto rxquantr102_loop
  rxquantr102_done:
.annotate 'line', 38
  # rx pass
    rx98_cur."!cursor_pass"(rx98_pos, "termish")
    rx98_cur."!cursor_debug"("PASS  ", "termish", " at pos=", rx98_pos)
    .return (rx98_cur)
  rx98_restart:
.annotate 'line', 3
    rx98_cur."!cursor_debug"("NEXT ", "termish")
  rx98_fail:
    (rx98_rep, rx98_pos, $I10, $P10) = rx98_cur."!mark_fail"(0)
    lt rx98_pos, -1, rx98_done
    eq rx98_pos, -1, rx98_fail
    jump $I10
  rx98_done:
    rx98_cur."!cursor_fail"()
    rx98_cur."!cursor_debug"("FAIL  ", "termish")
    .return (rx98_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__termish"  :subid("29_1280467470.54449") :method
.annotate 'line', 3
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantified_atom"  :subid("30_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .const 'Sub' $P113 = "32_1280467470.54449" 
    capture_lex $P113
    .local string rx105_tgt
    .local int rx105_pos
    .local int rx105_off
    .local int rx105_eos
    .local int rx105_rep
    .local pmc rx105_cur
    (rx105_cur, rx105_pos, rx105_tgt, $I10) = self."!cursor_start"()
    rx105_cur."!cursor_caparray"("quantifier", "backmod")
    .lex unicode:"$\x{a2}", rx105_cur
    .local pmc match
    .lex "$/", match
    length rx105_eos, rx105_tgt
    gt rx105_pos, rx105_eos, rx105_done
    set rx105_off, 0
    lt rx105_pos, 2, rx105_start
    sub rx105_off, rx105_pos, 1
    substr rx105_tgt, rx105_tgt, rx105_off
  rx105_start:
    eq $I10, 1, rx105_restart
    rx105_cur."!cursor_debug"("START ", "quantified_atom")
    $I10 = self.'from'()
    ne $I10, -1, rxscan109_done
    goto rxscan109_scan
  rxscan109_loop:
    ($P10) = rx105_cur."from"()
    inc $P10
    set rx105_pos, $P10
    ge rx105_pos, rx105_eos, rxscan109_done
  rxscan109_scan:
    set_addr $I10, rxscan109_loop
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
  rxscan109_done:
.annotate 'line', 43
  # rx subrule "atom" subtype=capture negate=
    rx105_cur."!cursor_pos"(rx105_pos)
    $P10 = rx105_cur."atom"()
    unless $P10, rx105_fail
    rx105_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("atom")
    rx105_pos = $P10."pos"()
  # rx rxquantr110 ** 0..1
    set_addr $I10, rxquantr110_done
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
  rxquantr110_loop:
  # rx subrule "ws" subtype=method negate=
    rx105_cur."!cursor_pos"(rx105_pos)
    $P10 = rx105_cur."ws"()
    unless $P10, rx105_fail
    rx105_pos = $P10."pos"()
  alt111_0:
    set_addr $I10, alt111_1
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
  # rx subrule "quantifier" subtype=capture negate=
    rx105_cur."!cursor_pos"(rx105_pos)
    $P10 = rx105_cur."quantifier"()
    unless $P10, rx105_fail
    rx105_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantifier")
    rx105_pos = $P10."pos"()
    goto alt111_end
  alt111_1:
  # rx subrule "before" subtype=zerowidth negate=
    rx105_cur."!cursor_pos"(rx105_pos)
    .const 'Sub' $P113 = "32_1280467470.54449" 
    capture_lex $P113
    $P10 = rx105_cur."before"($P113)
    unless $P10, rx105_fail
  # rx subrule "backmod" subtype=capture negate=
    rx105_cur."!cursor_pos"(rx105_pos)
    $P10 = rx105_cur."backmod"()
    unless $P10, rx105_fail
    rx105_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx105_pos = $P10."pos"()
  # rx subrule "alpha" subtype=zerowidth negate=1
    rx105_cur."!cursor_pos"(rx105_pos)
    $P10 = rx105_cur."alpha"()
    if $P10, rx105_fail
  alt111_end:
    set_addr $I10, rxquantr110_done
    (rx105_rep) = rx105_cur."!mark_commit"($I10)
  rxquantr110_done:
.annotate 'line', 42
  # rx pass
    rx105_cur."!cursor_pass"(rx105_pos, "quantified_atom")
    rx105_cur."!cursor_debug"("PASS  ", "quantified_atom", " at pos=", rx105_pos)
    .return (rx105_cur)
  rx105_restart:
.annotate 'line', 3
    rx105_cur."!cursor_debug"("NEXT ", "quantified_atom")
  rx105_fail:
    (rx105_rep, rx105_pos, $I10, $P10) = rx105_cur."!mark_fail"(0)
    lt rx105_pos, -1, rx105_done
    eq rx105_pos, -1, rx105_fail
    jump $I10
  rx105_done:
    rx105_cur."!cursor_fail"()
    rx105_cur."!cursor_debug"("FAIL  ", "quantified_atom")
    .return (rx105_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantified_atom"  :subid("31_1280467470.54449") :method
.annotate 'line', 3
    $P107 = self."!PREFIX__!subrule"("atom", "")
    new $P108, "ResizablePMCArray"
    push $P108, $P107
    .return ($P108)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block112"  :anon :subid("32_1280467470.54449") :method :outer("30_1280467470.54449")
.annotate 'line', 43
    .local string rx114_tgt
    .local int rx114_pos
    .local int rx114_off
    .local int rx114_eos
    .local int rx114_rep
    .local pmc rx114_cur
    (rx114_cur, rx114_pos, rx114_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx114_cur
    .local pmc match
    .lex "$/", match
    length rx114_eos, rx114_tgt
    gt rx114_pos, rx114_eos, rx114_done
    set rx114_off, 0
    lt rx114_pos, 2, rx114_start
    sub rx114_off, rx114_pos, 1
    substr rx114_tgt, rx114_tgt, rx114_off
  rx114_start:
    eq $I10, 1, rx114_restart
    rx114_cur."!cursor_debug"("START ", "")
    $I10 = self.'from'()
    ne $I10, -1, rxscan115_done
    goto rxscan115_scan
  rxscan115_loop:
    ($P10) = rx114_cur."from"()
    inc $P10
    set rx114_pos, $P10
    ge rx114_pos, rx114_eos, rxscan115_done
  rxscan115_scan:
    set_addr $I10, rxscan115_loop
    rx114_cur."!mark_push"(0, rx114_pos, $I10)
  rxscan115_done:
  # rx literal  ":"
    add $I11, rx114_pos, 1
    gt $I11, rx114_eos, rx114_fail
    sub $I11, rx114_pos, rx114_off
    substr $S10, rx114_tgt, $I11, 1
    ne $S10, ":", rx114_fail
    add rx114_pos, 1
  # rx pass
    rx114_cur."!cursor_pass"(rx114_pos, "")
    rx114_cur."!cursor_debug"("PASS  ", "", " at pos=", rx114_pos)
    .return (rx114_cur)
  rx114_restart:
    rx114_cur."!cursor_debug"("NEXT ", "")
  rx114_fail:
    (rx114_rep, rx114_pos, $I10, $P10) = rx114_cur."!mark_fail"(0)
    lt rx114_pos, -1, rx114_done
    eq rx114_pos, -1, rx114_fail
    jump $I10
  rx114_done:
    rx114_cur."!cursor_fail"()
    rx114_cur."!cursor_debug"("FAIL  ", "")
    .return (rx114_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "atom"  :subid("33_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .const 'Sub' $P126 = "35_1280467470.54449" 
    capture_lex $P126
    .local string rx117_tgt
    .local int rx117_pos
    .local int rx117_off
    .local int rx117_eos
    .local int rx117_rep
    .local pmc rx117_cur
    (rx117_cur, rx117_pos, rx117_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx117_cur
    .local pmc match
    .lex "$/", match
    length rx117_eos, rx117_tgt
    gt rx117_pos, rx117_eos, rx117_done
    set rx117_off, 0
    lt rx117_pos, 2, rx117_start
    sub rx117_off, rx117_pos, 1
    substr rx117_tgt, rx117_tgt, rx117_off
  rx117_start:
    eq $I10, 1, rx117_restart
    rx117_cur."!cursor_debug"("START ", "atom")
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
.annotate 'line', 48
    set_addr $I10, alt122_1
    rx117_cur."!mark_push"(0, rx117_pos, $I10)
.annotate 'line', 49
  # rx charclass w
    ge rx117_pos, rx117_eos, rx117_fail
    sub $I10, rx117_pos, rx117_off
    is_cclass $I11, 8192, rx117_tgt, $I10
    unless $I11, rx117_fail
    inc rx117_pos
  # rx rxquantr123 ** 0..1
    set_addr $I10, rxquantr123_done
    rx117_cur."!mark_push"(0, rx117_pos, $I10)
  rxquantr123_loop:
  # rx rxquantg124 ** 1..*
  rxquantg124_loop:
  # rx charclass w
    ge rx117_pos, rx117_eos, rx117_fail
    sub $I10, rx117_pos, rx117_off
    is_cclass $I11, 8192, rx117_tgt, $I10
    unless $I11, rx117_fail
    inc rx117_pos
    set_addr $I10, rxquantg124_done
    rx117_cur."!mark_push"(rx117_rep, rx117_pos, $I10)
    goto rxquantg124_loop
  rxquantg124_done:
  # rx subrule "before" subtype=zerowidth negate=
    rx117_cur."!cursor_pos"(rx117_pos)
    .const 'Sub' $P126 = "35_1280467470.54449" 
    capture_lex $P126
    $P10 = rx117_cur."before"($P126)
    unless $P10, rx117_fail
    set_addr $I10, rxquantr123_done
    (rx117_rep) = rx117_cur."!mark_commit"($I10)
  rxquantr123_done:
    goto alt122_end
  alt122_1:
.annotate 'line', 50
  # rx subrule "metachar" subtype=capture negate=
    rx117_cur."!cursor_pos"(rx117_pos)
    $P10 = rx117_cur."metachar"()
    unless $P10, rx117_fail
    rx117_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("metachar")
    rx117_pos = $P10."pos"()
  alt122_end:
.annotate 'line', 46
  # rx pass
    rx117_cur."!cursor_pass"(rx117_pos, "atom")
    rx117_cur."!cursor_debug"("PASS  ", "atom", " at pos=", rx117_pos)
    .return (rx117_cur)
  rx117_restart:
.annotate 'line', 3
    rx117_cur."!cursor_debug"("NEXT ", "atom")
  rx117_fail:
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
.sub "!PREFIX__atom"  :subid("34_1280467470.54449") :method
.annotate 'line', 3
    $P119 = self."!PREFIX__!subrule"("metachar", "")
    new $P120, "ResizablePMCArray"
    push $P120, $P119
    push $P120, ""
    .return ($P120)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block125"  :anon :subid("35_1280467470.54449") :method :outer("33_1280467470.54449")
.annotate 'line', 49
    .local string rx127_tgt
    .local int rx127_pos
    .local int rx127_off
    .local int rx127_eos
    .local int rx127_rep
    .local pmc rx127_cur
    (rx127_cur, rx127_pos, rx127_tgt, $I10) = self."!cursor_start"()
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
    eq $I10, 1, rx127_restart
    rx127_cur."!cursor_debug"("START ", "")
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
  rx127_restart:
    rx127_cur."!cursor_debug"("NEXT ", "")
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
.sub "quantifier"  :subid("36_1280467470.54449") :method
.annotate 'line', 54
    $P130 = self."!protoregex"("quantifier")
    .return ($P130)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier"  :subid("37_1280467470.54449") :method
.annotate 'line', 54
    $P132 = self."!PREFIX__!protoregex"("quantifier")
    .return ($P132)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<*>"  :subid("38_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx134_tgt
    .local int rx134_pos
    .local int rx134_off
    .local int rx134_eos
    .local int rx134_rep
    .local pmc rx134_cur
    (rx134_cur, rx134_pos, rx134_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx134_cur
    .local pmc match
    .lex "$/", match
    length rx134_eos, rx134_tgt
    gt rx134_pos, rx134_eos, rx134_done
    set rx134_off, 0
    lt rx134_pos, 2, rx134_start
    sub rx134_off, rx134_pos, 1
    substr rx134_tgt, rx134_tgt, rx134_off
  rx134_start:
    eq $I10, 1, rx134_restart
    rx134_cur."!cursor_debug"("START ", "quantifier:sym<*>")
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
.annotate 'line', 55
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
  rx134_restart:
.annotate 'line', 3
    rx134_cur."!cursor_debug"("NEXT ", "quantifier:sym<*>")
  rx134_fail:
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
.sub "!PREFIX__quantifier:sym<*>"  :subid("39_1280467470.54449") :method
.annotate 'line', 3
    $P136 = self."!PREFIX__!subrule"("backmod", "*")
    new $P137, "ResizablePMCArray"
    push $P137, $P136
    .return ($P137)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<+>"  :subid("40_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx141_tgt
    .local int rx141_pos
    .local int rx141_off
    .local int rx141_eos
    .local int rx141_rep
    .local pmc rx141_cur
    (rx141_cur, rx141_pos, rx141_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx141_cur
    .local pmc match
    .lex "$/", match
    length rx141_eos, rx141_tgt
    gt rx141_pos, rx141_eos, rx141_done
    set rx141_off, 0
    lt rx141_pos, 2, rx141_start
    sub rx141_off, rx141_pos, 1
    substr rx141_tgt, rx141_tgt, rx141_off
  rx141_start:
    eq $I10, 1, rx141_restart
    rx141_cur."!cursor_debug"("START ", "quantifier:sym<+>")
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
.annotate 'line', 56
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
  rx141_restart:
.annotate 'line', 3
    rx141_cur."!cursor_debug"("NEXT ", "quantifier:sym<+>")
  rx141_fail:
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
.sub "!PREFIX__quantifier:sym<+>"  :subid("41_1280467470.54449") :method
.annotate 'line', 3
    $P143 = self."!PREFIX__!subrule"("backmod", "+")
    new $P144, "ResizablePMCArray"
    push $P144, $P143
    .return ($P144)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<?>"  :subid("42_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx148_tgt
    .local int rx148_pos
    .local int rx148_off
    .local int rx148_eos
    .local int rx148_rep
    .local pmc rx148_cur
    (rx148_cur, rx148_pos, rx148_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx148_cur
    .local pmc match
    .lex "$/", match
    length rx148_eos, rx148_tgt
    gt rx148_pos, rx148_eos, rx148_done
    set rx148_off, 0
    lt rx148_pos, 2, rx148_start
    sub rx148_off, rx148_pos, 1
    substr rx148_tgt, rx148_tgt, rx148_off
  rx148_start:
    eq $I10, 1, rx148_restart
    rx148_cur."!cursor_debug"("START ", "quantifier:sym<?>")
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
.annotate 'line', 57
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
  rx148_restart:
.annotate 'line', 3
    rx148_cur."!cursor_debug"("NEXT ", "quantifier:sym<?>")
  rx148_fail:
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
.sub "!PREFIX__quantifier:sym<?>"  :subid("43_1280467470.54449") :method
.annotate 'line', 3
    $P150 = self."!PREFIX__!subrule"("backmod", "?")
    new $P151, "ResizablePMCArray"
    push $P151, $P150
    .return ($P151)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<**>"  :subid("44_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx155_tgt
    .local int rx155_pos
    .local int rx155_off
    .local int rx155_eos
    .local int rx155_rep
    .local pmc rx155_cur
    (rx155_cur, rx155_pos, rx155_tgt, $I10) = self."!cursor_start"()
    rx155_cur."!cursor_caparray"("max", "normspace")
    .lex unicode:"$\x{a2}", rx155_cur
    .local pmc match
    .lex "$/", match
    length rx155_eos, rx155_tgt
    gt rx155_pos, rx155_eos, rx155_done
    set rx155_off, 0
    lt rx155_pos, 2, rx155_start
    sub rx155_off, rx155_pos, 1
    substr rx155_tgt, rx155_tgt, rx155_off
  rx155_start:
    eq $I10, 1, rx155_restart
    rx155_cur."!cursor_debug"("START ", "quantifier:sym<**>")
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
.annotate 'line', 59
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
  # rx rxquantr160 ** 0..1
    set_addr $I10, rxquantr160_done
    rx155_cur."!mark_push"(0, rx155_pos, $I10)
  rxquantr160_loop:
  # rx subrule "normspace" subtype=capture negate=
    rx155_cur."!cursor_pos"(rx155_pos)
    $P10 = rx155_cur."normspace"()
    unless $P10, rx155_fail
    goto rxsubrule161_pass
  rxsubrule161_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx155_fail
  rxsubrule161_pass:
    set_addr $I10, rxsubrule161_back
    rx155_cur."!mark_push"(0, rx155_pos, $I10, $P10)
    $P10."!cursor_names"("normspace")
    rx155_pos = $P10."pos"()
    set_addr $I10, rxquantr160_done
    (rx155_rep) = rx155_cur."!mark_commit"($I10)
  rxquantr160_done:
  # rx subrule "backmod" subtype=capture negate=
    rx155_cur."!cursor_pos"(rx155_pos)
    $P10 = rx155_cur."backmod"()
    unless $P10, rx155_fail
    rx155_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx155_pos = $P10."pos"()
  # rx rxquantr162 ** 0..1
    set_addr $I10, rxquantr162_done
    rx155_cur."!mark_push"(0, rx155_pos, $I10)
  rxquantr162_loop:
  # rx subrule "normspace" subtype=capture negate=
    rx155_cur."!cursor_pos"(rx155_pos)
    $P10 = rx155_cur."normspace"()
    unless $P10, rx155_fail
    goto rxsubrule163_pass
  rxsubrule163_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx155_fail
  rxsubrule163_pass:
    set_addr $I10, rxsubrule163_back
    rx155_cur."!mark_push"(0, rx155_pos, $I10, $P10)
    $P10."!cursor_names"("normspace")
    rx155_pos = $P10."pos"()
    set_addr $I10, rxquantr162_done
    (rx155_rep) = rx155_cur."!mark_commit"($I10)
  rxquantr162_done:
  alt164_0:
.annotate 'line', 60
    set_addr $I10, alt164_1
    rx155_cur."!mark_push"(0, rx155_pos, $I10)
.annotate 'line', 61
  # rx subcapture "min"
    set_addr $I10, rxcap_165_fail
    rx155_cur."!mark_push"(0, rx155_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx155_pos, rx155_off
    find_not_cclass $I11, 8, rx155_tgt, $I10, rx155_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx155_fail
    add rx155_pos, rx155_off, $I11
    set_addr $I10, rxcap_165_fail
    ($I12, $I11) = rx155_cur."!mark_peek"($I10)
    rx155_cur."!cursor_pos"($I11)
    ($P10) = rx155_cur."!cursor_start"()
    $P10."!cursor_pass"(rx155_pos, "")
    rx155_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("min")
    goto rxcap_165_done
  rxcap_165_fail:
    goto rx155_fail
  rxcap_165_done:
.annotate 'line', 68
  # rx rxquantr166 ** 0..1
    set_addr $I10, rxquantr166_done
    rx155_cur."!mark_push"(0, rx155_pos, $I10)
  rxquantr166_loop:
.annotate 'line', 62
  # rx literal  ".."
    add $I11, rx155_pos, 2
    gt $I11, rx155_eos, rx155_fail
    sub $I11, rx155_pos, rx155_off
    substr $S10, rx155_tgt, $I11, 2
    ne $S10, "..", rx155_fail
    add rx155_pos, 2
.annotate 'line', 63
  # rx subcapture "max"
    set_addr $I10, rxcap_168_fail
    rx155_cur."!mark_push"(0, rx155_pos, $I10)
  alt167_0:
    set_addr $I10, alt167_1
    rx155_cur."!mark_push"(0, rx155_pos, $I10)
.annotate 'line', 64
  # rx charclass_q d r 1..-1
    sub $I10, rx155_pos, rx155_off
    find_not_cclass $I11, 8, rx155_tgt, $I10, rx155_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx155_fail
    add rx155_pos, rx155_off, $I11
    goto alt167_end
  alt167_1:
    set_addr $I10, alt167_2
    rx155_cur."!mark_push"(0, rx155_pos, $I10)
.annotate 'line', 65
  # rx literal  "*"
    add $I11, rx155_pos, 1
    gt $I11, rx155_eos, rx155_fail
    sub $I11, rx155_pos, rx155_off
    substr $S10, rx155_tgt, $I11, 1
    ne $S10, "*", rx155_fail
    add rx155_pos, 1
    goto alt167_end
  alt167_2:
.annotate 'line', 66
  # rx subrule "panic" subtype=method negate=
    rx155_cur."!cursor_pos"(rx155_pos)
    $P10 = rx155_cur."panic"("Only integers or '*' allowed as range quantifier endpoint")
    unless $P10, rx155_fail
    rx155_pos = $P10."pos"()
  alt167_end:
.annotate 'line', 63
    set_addr $I10, rxcap_168_fail
    ($I12, $I11) = rx155_cur."!mark_peek"($I10)
    rx155_cur."!cursor_pos"($I11)
    ($P10) = rx155_cur."!cursor_start"()
    $P10."!cursor_pass"(rx155_pos, "")
    rx155_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("max")
    goto rxcap_168_done
  rxcap_168_fail:
    goto rx155_fail
  rxcap_168_done:
.annotate 'line', 68
    set_addr $I10, rxquantr166_done
    (rx155_rep) = rx155_cur."!mark_commit"($I10)
  rxquantr166_done:
.annotate 'line', 61
    goto alt164_end
  alt164_1:
.annotate 'line', 69
  # rx subrule "quantified_atom" subtype=capture negate=
    rx155_cur."!cursor_pos"(rx155_pos)
    $P10 = rx155_cur."quantified_atom"()
    unless $P10, rx155_fail
    rx155_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantified_atom")
    rx155_pos = $P10."pos"()
  alt164_end:
.annotate 'line', 58
  # rx pass
    rx155_cur."!cursor_pass"(rx155_pos, "quantifier:sym<**>")
    rx155_cur."!cursor_debug"("PASS  ", "quantifier:sym<**>", " at pos=", rx155_pos)
    .return (rx155_cur)
  rx155_restart:
.annotate 'line', 3
    rx155_cur."!cursor_debug"("NEXT ", "quantifier:sym<**>")
  rx155_fail:
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
.sub "!PREFIX__quantifier:sym<**>"  :subid("45_1280467470.54449") :method
.annotate 'line', 3
    new $P157, "ResizablePMCArray"
    push $P157, "**"
    .return ($P157)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backmod"  :subid("46_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .const 'Sub' $P177 = "48_1280467470.54449" 
    capture_lex $P177
    .local string rx170_tgt
    .local int rx170_pos
    .local int rx170_off
    .local int rx170_eos
    .local int rx170_rep
    .local pmc rx170_cur
    (rx170_cur, rx170_pos, rx170_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx170_cur
    .local pmc match
    .lex "$/", match
    length rx170_eos, rx170_tgt
    gt rx170_pos, rx170_eos, rx170_done
    set rx170_off, 0
    lt rx170_pos, 2, rx170_start
    sub rx170_off, rx170_pos, 1
    substr rx170_tgt, rx170_tgt, rx170_off
  rx170_start:
    eq $I10, 1, rx170_restart
    rx170_cur."!cursor_debug"("START ", "backmod")
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
.annotate 'line', 73
  # rx rxquantr174 ** 0..1
    set_addr $I10, rxquantr174_done
    rx170_cur."!mark_push"(0, rx170_pos, $I10)
  rxquantr174_loop:
  # rx literal  ":"
    add $I11, rx170_pos, 1
    gt $I11, rx170_eos, rx170_fail
    sub $I11, rx170_pos, rx170_off
    substr $S10, rx170_tgt, $I11, 1
    ne $S10, ":", rx170_fail
    add rx170_pos, 1
    set_addr $I10, rxquantr174_done
    (rx170_rep) = rx170_cur."!mark_commit"($I10)
  rxquantr174_done:
  alt175_0:
    set_addr $I10, alt175_1
    rx170_cur."!mark_push"(0, rx170_pos, $I10)
  # rx literal  "?"
    add $I11, rx170_pos, 1
    gt $I11, rx170_eos, rx170_fail
    sub $I11, rx170_pos, rx170_off
    substr $S10, rx170_tgt, $I11, 1
    ne $S10, "?", rx170_fail
    add rx170_pos, 1
    goto alt175_end
  alt175_1:
    set_addr $I10, alt175_2
    rx170_cur."!mark_push"(0, rx170_pos, $I10)
  # rx literal  "!"
    add $I11, rx170_pos, 1
    gt $I11, rx170_eos, rx170_fail
    sub $I11, rx170_pos, rx170_off
    substr $S10, rx170_tgt, $I11, 1
    ne $S10, "!", rx170_fail
    add rx170_pos, 1
    goto alt175_end
  alt175_2:
  # rx subrule "before" subtype=zerowidth negate=1
    rx170_cur."!cursor_pos"(rx170_pos)
    .const 'Sub' $P177 = "48_1280467470.54449" 
    capture_lex $P177
    $P10 = rx170_cur."before"($P177)
    if $P10, rx170_fail
  alt175_end:
  # rx pass
    rx170_cur."!cursor_pass"(rx170_pos, "backmod")
    rx170_cur."!cursor_debug"("PASS  ", "backmod", " at pos=", rx170_pos)
    .return (rx170_cur)
  rx170_restart:
.annotate 'line', 3
    rx170_cur."!cursor_debug"("NEXT ", "backmod")
  rx170_fail:
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
.sub "!PREFIX__backmod"  :subid("47_1280467470.54449") :method
.annotate 'line', 3
    new $P172, "ResizablePMCArray"
    push $P172, ""
    .return ($P172)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block176"  :anon :subid("48_1280467470.54449") :method :outer("46_1280467470.54449")
.annotate 'line', 73
    .local string rx178_tgt
    .local int rx178_pos
    .local int rx178_off
    .local int rx178_eos
    .local int rx178_rep
    .local pmc rx178_cur
    (rx178_cur, rx178_pos, rx178_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx178_cur
    .local pmc match
    .lex "$/", match
    length rx178_eos, rx178_tgt
    gt rx178_pos, rx178_eos, rx178_done
    set rx178_off, 0
    lt rx178_pos, 2, rx178_start
    sub rx178_off, rx178_pos, 1
    substr rx178_tgt, rx178_tgt, rx178_off
  rx178_start:
    eq $I10, 1, rx178_restart
    rx178_cur."!cursor_debug"("START ", "")
    $I10 = self.'from'()
    ne $I10, -1, rxscan179_done
    goto rxscan179_scan
  rxscan179_loop:
    ($P10) = rx178_cur."from"()
    inc $P10
    set rx178_pos, $P10
    ge rx178_pos, rx178_eos, rxscan179_done
  rxscan179_scan:
    set_addr $I10, rxscan179_loop
    rx178_cur."!mark_push"(0, rx178_pos, $I10)
  rxscan179_done:
  # rx literal  ":"
    add $I11, rx178_pos, 1
    gt $I11, rx178_eos, rx178_fail
    sub $I11, rx178_pos, rx178_off
    substr $S10, rx178_tgt, $I11, 1
    ne $S10, ":", rx178_fail
    add rx178_pos, 1
  # rx pass
    rx178_cur."!cursor_pass"(rx178_pos, "")
    rx178_cur."!cursor_debug"("PASS  ", "", " at pos=", rx178_pos)
    .return (rx178_cur)
  rx178_restart:
    rx178_cur."!cursor_debug"("NEXT ", "")
  rx178_fail:
    (rx178_rep, rx178_pos, $I10, $P10) = rx178_cur."!mark_fail"(0)
    lt rx178_pos, -1, rx178_done
    eq rx178_pos, -1, rx178_fail
    jump $I10
  rx178_done:
    rx178_cur."!cursor_fail"()
    rx178_cur."!cursor_debug"("FAIL  ", "")
    .return (rx178_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar"  :subid("49_1280467470.54449") :method
.annotate 'line', 75
    $P181 = self."!protoregex"("metachar")
    .return ($P181)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar"  :subid("50_1280467470.54449") :method
.annotate 'line', 75
    $P183 = self."!PREFIX__!protoregex"("metachar")
    .return ($P183)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<ws>"  :subid("51_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx185_tgt
    .local int rx185_pos
    .local int rx185_off
    .local int rx185_eos
    .local int rx185_rep
    .local pmc rx185_cur
    (rx185_cur, rx185_pos, rx185_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx185_cur
    .local pmc match
    .lex "$/", match
    length rx185_eos, rx185_tgt
    gt rx185_pos, rx185_eos, rx185_done
    set rx185_off, 0
    lt rx185_pos, 2, rx185_start
    sub rx185_off, rx185_pos, 1
    substr rx185_tgt, rx185_tgt, rx185_off
  rx185_start:
    eq $I10, 1, rx185_restart
    rx185_cur."!cursor_debug"("START ", "metachar:sym<ws>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan189_done
    goto rxscan189_scan
  rxscan189_loop:
    ($P10) = rx185_cur."from"()
    inc $P10
    set rx185_pos, $P10
    ge rx185_pos, rx185_eos, rxscan189_done
  rxscan189_scan:
    set_addr $I10, rxscan189_loop
    rx185_cur."!mark_push"(0, rx185_pos, $I10)
  rxscan189_done:
.annotate 'line', 76
  # rx subrule "normspace" subtype=method negate=
    rx185_cur."!cursor_pos"(rx185_pos)
    $P10 = rx185_cur."normspace"()
    unless $P10, rx185_fail
    rx185_pos = $P10."pos"()
  # rx pass
    rx185_cur."!cursor_pass"(rx185_pos, "metachar:sym<ws>")
    rx185_cur."!cursor_debug"("PASS  ", "metachar:sym<ws>", " at pos=", rx185_pos)
    .return (rx185_cur)
  rx185_restart:
.annotate 'line', 3
    rx185_cur."!cursor_debug"("NEXT ", "metachar:sym<ws>")
  rx185_fail:
    (rx185_rep, rx185_pos, $I10, $P10) = rx185_cur."!mark_fail"(0)
    lt rx185_pos, -1, rx185_done
    eq rx185_pos, -1, rx185_fail
    jump $I10
  rx185_done:
    rx185_cur."!cursor_fail"()
    rx185_cur."!cursor_debug"("FAIL  ", "metachar:sym<ws>")
    .return (rx185_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<ws>"  :subid("52_1280467470.54449") :method
.annotate 'line', 3
    $P187 = self."!PREFIX__!subrule"("normspace", "")
    new $P188, "ResizablePMCArray"
    push $P188, $P187
    .return ($P188)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<[ ]>"  :subid("53_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx191_tgt
    .local int rx191_pos
    .local int rx191_off
    .local int rx191_eos
    .local int rx191_rep
    .local pmc rx191_cur
    (rx191_cur, rx191_pos, rx191_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx191_cur
    .local pmc match
    .lex "$/", match
    length rx191_eos, rx191_tgt
    gt rx191_pos, rx191_eos, rx191_done
    set rx191_off, 0
    lt rx191_pos, 2, rx191_start
    sub rx191_off, rx191_pos, 1
    substr rx191_tgt, rx191_tgt, rx191_off
  rx191_start:
    eq $I10, 1, rx191_restart
    rx191_cur."!cursor_debug"("START ", "metachar:sym<[ ]>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan195_done
    goto rxscan195_scan
  rxscan195_loop:
    ($P10) = rx191_cur."from"()
    inc $P10
    set rx191_pos, $P10
    ge rx191_pos, rx191_eos, rxscan195_done
  rxscan195_scan:
    set_addr $I10, rxscan195_loop
    rx191_cur."!mark_push"(0, rx191_pos, $I10)
  rxscan195_done:
.annotate 'line', 77
  # rx literal  "["
    add $I11, rx191_pos, 1
    gt $I11, rx191_eos, rx191_fail
    sub $I11, rx191_pos, rx191_off
    substr $S10, rx191_tgt, $I11, 1
    ne $S10, "[", rx191_fail
    add rx191_pos, 1
  # rx subrule "nibbler" subtype=capture negate=
    rx191_cur."!cursor_pos"(rx191_pos)
    $P10 = rx191_cur."nibbler"()
    unless $P10, rx191_fail
    rx191_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx191_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx191_pos, 1
    gt $I11, rx191_eos, rx191_fail
    sub $I11, rx191_pos, rx191_off
    substr $S10, rx191_tgt, $I11, 1
    ne $S10, "]", rx191_fail
    add rx191_pos, 1
  # rx pass
    rx191_cur."!cursor_pass"(rx191_pos, "metachar:sym<[ ]>")
    rx191_cur."!cursor_debug"("PASS  ", "metachar:sym<[ ]>", " at pos=", rx191_pos)
    .return (rx191_cur)
  rx191_restart:
.annotate 'line', 3
    rx191_cur."!cursor_debug"("NEXT ", "metachar:sym<[ ]>")
  rx191_fail:
    (rx191_rep, rx191_pos, $I10, $P10) = rx191_cur."!mark_fail"(0)
    lt rx191_pos, -1, rx191_done
    eq rx191_pos, -1, rx191_fail
    jump $I10
  rx191_done:
    rx191_cur."!cursor_fail"()
    rx191_cur."!cursor_debug"("FAIL  ", "metachar:sym<[ ]>")
    .return (rx191_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<[ ]>"  :subid("54_1280467470.54449") :method
.annotate 'line', 3
    $P193 = self."!PREFIX__!subrule"("nibbler", "[")
    new $P194, "ResizablePMCArray"
    push $P194, $P193
    .return ($P194)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<( )>"  :subid("55_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx197_tgt
    .local int rx197_pos
    .local int rx197_off
    .local int rx197_eos
    .local int rx197_rep
    .local pmc rx197_cur
    (rx197_cur, rx197_pos, rx197_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx197_cur
    .local pmc match
    .lex "$/", match
    length rx197_eos, rx197_tgt
    gt rx197_pos, rx197_eos, rx197_done
    set rx197_off, 0
    lt rx197_pos, 2, rx197_start
    sub rx197_off, rx197_pos, 1
    substr rx197_tgt, rx197_tgt, rx197_off
  rx197_start:
    eq $I10, 1, rx197_restart
    rx197_cur."!cursor_debug"("START ", "metachar:sym<( )>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan201_done
    goto rxscan201_scan
  rxscan201_loop:
    ($P10) = rx197_cur."from"()
    inc $P10
    set rx197_pos, $P10
    ge rx197_pos, rx197_eos, rxscan201_done
  rxscan201_scan:
    set_addr $I10, rxscan201_loop
    rx197_cur."!mark_push"(0, rx197_pos, $I10)
  rxscan201_done:
.annotate 'line', 78
  # rx literal  "("
    add $I11, rx197_pos, 1
    gt $I11, rx197_eos, rx197_fail
    sub $I11, rx197_pos, rx197_off
    substr $S10, rx197_tgt, $I11, 1
    ne $S10, "(", rx197_fail
    add rx197_pos, 1
  # rx subrule "nibbler" subtype=capture negate=
    rx197_cur."!cursor_pos"(rx197_pos)
    $P10 = rx197_cur."nibbler"()
    unless $P10, rx197_fail
    rx197_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx197_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx197_pos, 1
    gt $I11, rx197_eos, rx197_fail
    sub $I11, rx197_pos, rx197_off
    substr $S10, rx197_tgt, $I11, 1
    ne $S10, ")", rx197_fail
    add rx197_pos, 1
  # rx pass
    rx197_cur."!cursor_pass"(rx197_pos, "metachar:sym<( )>")
    rx197_cur."!cursor_debug"("PASS  ", "metachar:sym<( )>", " at pos=", rx197_pos)
    .return (rx197_cur)
  rx197_restart:
.annotate 'line', 3
    rx197_cur."!cursor_debug"("NEXT ", "metachar:sym<( )>")
  rx197_fail:
    (rx197_rep, rx197_pos, $I10, $P10) = rx197_cur."!mark_fail"(0)
    lt rx197_pos, -1, rx197_done
    eq rx197_pos, -1, rx197_fail
    jump $I10
  rx197_done:
    rx197_cur."!cursor_fail"()
    rx197_cur."!cursor_debug"("FAIL  ", "metachar:sym<( )>")
    .return (rx197_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<( )>"  :subid("56_1280467470.54449") :method
.annotate 'line', 3
    $P199 = self."!PREFIX__!subrule"("nibbler", "(")
    new $P200, "ResizablePMCArray"
    push $P200, $P199
    .return ($P200)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<'>"  :subid("57_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx203_tgt
    .local int rx203_pos
    .local int rx203_off
    .local int rx203_eos
    .local int rx203_rep
    .local pmc rx203_cur
    (rx203_cur, rx203_pos, rx203_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx203_cur
    .local pmc match
    .lex "$/", match
    length rx203_eos, rx203_tgt
    gt rx203_pos, rx203_eos, rx203_done
    set rx203_off, 0
    lt rx203_pos, 2, rx203_start
    sub rx203_off, rx203_pos, 1
    substr rx203_tgt, rx203_tgt, rx203_off
  rx203_start:
    eq $I10, 1, rx203_restart
    rx203_cur."!cursor_debug"("START ", "metachar:sym<'>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan206_done
    goto rxscan206_scan
  rxscan206_loop:
    ($P10) = rx203_cur."from"()
    inc $P10
    set rx203_pos, $P10
    ge rx203_pos, rx203_eos, rxscan206_done
  rxscan206_scan:
    set_addr $I10, rxscan206_loop
    rx203_cur."!mark_push"(0, rx203_pos, $I10)
  rxscan206_done:
.annotate 'line', 79
  # rx enumcharlist negate=0 zerowidth
    ge rx203_pos, rx203_eos, rx203_fail
    sub $I10, rx203_pos, rx203_off
    substr $S10, rx203_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx203_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx203_cur."!cursor_pos"(rx203_pos)
    $P10 = rx203_cur."quote_EXPR"(":q")
    unless $P10, rx203_fail
    rx203_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx203_pos = $P10."pos"()
  # rx pass
    rx203_cur."!cursor_pass"(rx203_pos, "metachar:sym<'>")
    rx203_cur."!cursor_debug"("PASS  ", "metachar:sym<'>", " at pos=", rx203_pos)
    .return (rx203_cur)
  rx203_restart:
.annotate 'line', 3
    rx203_cur."!cursor_debug"("NEXT ", "metachar:sym<'>")
  rx203_fail:
    (rx203_rep, rx203_pos, $I10, $P10) = rx203_cur."!mark_fail"(0)
    lt rx203_pos, -1, rx203_done
    eq rx203_pos, -1, rx203_fail
    jump $I10
  rx203_done:
    rx203_cur."!cursor_fail"()
    rx203_cur."!cursor_debug"("FAIL  ", "metachar:sym<'>")
    .return (rx203_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<'>"  :subid("58_1280467470.54449") :method
.annotate 'line', 3
    new $P205, "ResizablePMCArray"
    push $P205, "'"
    .return ($P205)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<\">"  :subid("59_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx208_tgt
    .local int rx208_pos
    .local int rx208_off
    .local int rx208_eos
    .local int rx208_rep
    .local pmc rx208_cur
    (rx208_cur, rx208_pos, rx208_tgt, $I10) = self."!cursor_start"()
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
    eq $I10, 1, rx208_restart
    rx208_cur."!cursor_debug"("START ", "metachar:sym<\">")
    $I10 = self.'from'()
    ne $I10, -1, rxscan211_done
    goto rxscan211_scan
  rxscan211_loop:
    ($P10) = rx208_cur."from"()
    inc $P10
    set rx208_pos, $P10
    ge rx208_pos, rx208_eos, rxscan211_done
  rxscan211_scan:
    set_addr $I10, rxscan211_loop
    rx208_cur."!mark_push"(0, rx208_pos, $I10)
  rxscan211_done:
.annotate 'line', 80
  # rx enumcharlist negate=0 zerowidth
    ge rx208_pos, rx208_eos, rx208_fail
    sub $I10, rx208_pos, rx208_off
    substr $S10, rx208_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx208_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx208_cur."!cursor_pos"(rx208_pos)
    $P10 = rx208_cur."quote_EXPR"(":qq")
    unless $P10, rx208_fail
    rx208_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx208_pos = $P10."pos"()
  # rx pass
    rx208_cur."!cursor_pass"(rx208_pos, "metachar:sym<\">")
    rx208_cur."!cursor_debug"("PASS  ", "metachar:sym<\">", " at pos=", rx208_pos)
    .return (rx208_cur)
  rx208_restart:
.annotate 'line', 3
    rx208_cur."!cursor_debug"("NEXT ", "metachar:sym<\">")
  rx208_fail:
    (rx208_rep, rx208_pos, $I10, $P10) = rx208_cur."!mark_fail"(0)
    lt rx208_pos, -1, rx208_done
    eq rx208_pos, -1, rx208_fail
    jump $I10
  rx208_done:
    rx208_cur."!cursor_fail"()
    rx208_cur."!cursor_debug"("FAIL  ", "metachar:sym<\">")
    .return (rx208_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<\">"  :subid("60_1280467470.54449") :method
.annotate 'line', 3
    new $P210, "ResizablePMCArray"
    push $P210, "\""
    .return ($P210)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<.>"  :subid("61_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx213_tgt
    .local int rx213_pos
    .local int rx213_off
    .local int rx213_eos
    .local int rx213_rep
    .local pmc rx213_cur
    (rx213_cur, rx213_pos, rx213_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx213_cur
    .local pmc match
    .lex "$/", match
    length rx213_eos, rx213_tgt
    gt rx213_pos, rx213_eos, rx213_done
    set rx213_off, 0
    lt rx213_pos, 2, rx213_start
    sub rx213_off, rx213_pos, 1
    substr rx213_tgt, rx213_tgt, rx213_off
  rx213_start:
    eq $I10, 1, rx213_restart
    rx213_cur."!cursor_debug"("START ", "metachar:sym<.>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan216_done
    goto rxscan216_scan
  rxscan216_loop:
    ($P10) = rx213_cur."from"()
    inc $P10
    set rx213_pos, $P10
    ge rx213_pos, rx213_eos, rxscan216_done
  rxscan216_scan:
    set_addr $I10, rxscan216_loop
    rx213_cur."!mark_push"(0, rx213_pos, $I10)
  rxscan216_done:
.annotate 'line', 81
  # rx subcapture "sym"
    set_addr $I10, rxcap_217_fail
    rx213_cur."!mark_push"(0, rx213_pos, $I10)
  # rx literal  "."
    add $I11, rx213_pos, 1
    gt $I11, rx213_eos, rx213_fail
    sub $I11, rx213_pos, rx213_off
    substr $S10, rx213_tgt, $I11, 1
    ne $S10, ".", rx213_fail
    add rx213_pos, 1
    set_addr $I10, rxcap_217_fail
    ($I12, $I11) = rx213_cur."!mark_peek"($I10)
    rx213_cur."!cursor_pos"($I11)
    ($P10) = rx213_cur."!cursor_start"()
    $P10."!cursor_pass"(rx213_pos, "")
    rx213_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_217_done
  rxcap_217_fail:
    goto rx213_fail
  rxcap_217_done:
  # rx pass
    rx213_cur."!cursor_pass"(rx213_pos, "metachar:sym<.>")
    rx213_cur."!cursor_debug"("PASS  ", "metachar:sym<.>", " at pos=", rx213_pos)
    .return (rx213_cur)
  rx213_restart:
.annotate 'line', 3
    rx213_cur."!cursor_debug"("NEXT ", "metachar:sym<.>")
  rx213_fail:
    (rx213_rep, rx213_pos, $I10, $P10) = rx213_cur."!mark_fail"(0)
    lt rx213_pos, -1, rx213_done
    eq rx213_pos, -1, rx213_fail
    jump $I10
  rx213_done:
    rx213_cur."!cursor_fail"()
    rx213_cur."!cursor_debug"("FAIL  ", "metachar:sym<.>")
    .return (rx213_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<.>"  :subid("62_1280467470.54449") :method
.annotate 'line', 3
    new $P215, "ResizablePMCArray"
    push $P215, "."
    .return ($P215)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^>"  :subid("63_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx219_tgt
    .local int rx219_pos
    .local int rx219_off
    .local int rx219_eos
    .local int rx219_rep
    .local pmc rx219_cur
    (rx219_cur, rx219_pos, rx219_tgt, $I10) = self."!cursor_start"()
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
    eq $I10, 1, rx219_restart
    rx219_cur."!cursor_debug"("START ", "metachar:sym<^>")
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
.annotate 'line', 82
  # rx subcapture "sym"
    set_addr $I10, rxcap_223_fail
    rx219_cur."!mark_push"(0, rx219_pos, $I10)
  # rx literal  "^"
    add $I11, rx219_pos, 1
    gt $I11, rx219_eos, rx219_fail
    sub $I11, rx219_pos, rx219_off
    substr $S10, rx219_tgt, $I11, 1
    ne $S10, "^", rx219_fail
    add rx219_pos, 1
    set_addr $I10, rxcap_223_fail
    ($I12, $I11) = rx219_cur."!mark_peek"($I10)
    rx219_cur."!cursor_pos"($I11)
    ($P10) = rx219_cur."!cursor_start"()
    $P10."!cursor_pass"(rx219_pos, "")
    rx219_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_223_done
  rxcap_223_fail:
    goto rx219_fail
  rxcap_223_done:
  # rx pass
    rx219_cur."!cursor_pass"(rx219_pos, "metachar:sym<^>")
    rx219_cur."!cursor_debug"("PASS  ", "metachar:sym<^>", " at pos=", rx219_pos)
    .return (rx219_cur)
  rx219_restart:
.annotate 'line', 3
    rx219_cur."!cursor_debug"("NEXT ", "metachar:sym<^>")
  rx219_fail:
    (rx219_rep, rx219_pos, $I10, $P10) = rx219_cur."!mark_fail"(0)
    lt rx219_pos, -1, rx219_done
    eq rx219_pos, -1, rx219_fail
    jump $I10
  rx219_done:
    rx219_cur."!cursor_fail"()
    rx219_cur."!cursor_debug"("FAIL  ", "metachar:sym<^>")
    .return (rx219_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<^>"  :subid("64_1280467470.54449") :method
.annotate 'line', 3
    new $P221, "ResizablePMCArray"
    push $P221, "^"
    .return ($P221)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^^>"  :subid("65_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx225_tgt
    .local int rx225_pos
    .local int rx225_off
    .local int rx225_eos
    .local int rx225_rep
    .local pmc rx225_cur
    (rx225_cur, rx225_pos, rx225_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx225_cur
    .local pmc match
    .lex "$/", match
    length rx225_eos, rx225_tgt
    gt rx225_pos, rx225_eos, rx225_done
    set rx225_off, 0
    lt rx225_pos, 2, rx225_start
    sub rx225_off, rx225_pos, 1
    substr rx225_tgt, rx225_tgt, rx225_off
  rx225_start:
    eq $I10, 1, rx225_restart
    rx225_cur."!cursor_debug"("START ", "metachar:sym<^^>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan228_done
    goto rxscan228_scan
  rxscan228_loop:
    ($P10) = rx225_cur."from"()
    inc $P10
    set rx225_pos, $P10
    ge rx225_pos, rx225_eos, rxscan228_done
  rxscan228_scan:
    set_addr $I10, rxscan228_loop
    rx225_cur."!mark_push"(0, rx225_pos, $I10)
  rxscan228_done:
.annotate 'line', 83
  # rx subcapture "sym"
    set_addr $I10, rxcap_229_fail
    rx225_cur."!mark_push"(0, rx225_pos, $I10)
  # rx literal  "^^"
    add $I11, rx225_pos, 2
    gt $I11, rx225_eos, rx225_fail
    sub $I11, rx225_pos, rx225_off
    substr $S10, rx225_tgt, $I11, 2
    ne $S10, "^^", rx225_fail
    add rx225_pos, 2
    set_addr $I10, rxcap_229_fail
    ($I12, $I11) = rx225_cur."!mark_peek"($I10)
    rx225_cur."!cursor_pos"($I11)
    ($P10) = rx225_cur."!cursor_start"()
    $P10."!cursor_pass"(rx225_pos, "")
    rx225_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_229_done
  rxcap_229_fail:
    goto rx225_fail
  rxcap_229_done:
  # rx pass
    rx225_cur."!cursor_pass"(rx225_pos, "metachar:sym<^^>")
    rx225_cur."!cursor_debug"("PASS  ", "metachar:sym<^^>", " at pos=", rx225_pos)
    .return (rx225_cur)
  rx225_restart:
.annotate 'line', 3
    rx225_cur."!cursor_debug"("NEXT ", "metachar:sym<^^>")
  rx225_fail:
    (rx225_rep, rx225_pos, $I10, $P10) = rx225_cur."!mark_fail"(0)
    lt rx225_pos, -1, rx225_done
    eq rx225_pos, -1, rx225_fail
    jump $I10
  rx225_done:
    rx225_cur."!cursor_fail"()
    rx225_cur."!cursor_debug"("FAIL  ", "metachar:sym<^^>")
    .return (rx225_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<^^>"  :subid("66_1280467470.54449") :method
.annotate 'line', 3
    new $P227, "ResizablePMCArray"
    push $P227, "^^"
    .return ($P227)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$>"  :subid("67_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx231_tgt
    .local int rx231_pos
    .local int rx231_off
    .local int rx231_eos
    .local int rx231_rep
    .local pmc rx231_cur
    (rx231_cur, rx231_pos, rx231_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx231_cur
    .local pmc match
    .lex "$/", match
    length rx231_eos, rx231_tgt
    gt rx231_pos, rx231_eos, rx231_done
    set rx231_off, 0
    lt rx231_pos, 2, rx231_start
    sub rx231_off, rx231_pos, 1
    substr rx231_tgt, rx231_tgt, rx231_off
  rx231_start:
    eq $I10, 1, rx231_restart
    rx231_cur."!cursor_debug"("START ", "metachar:sym<$>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan234_done
    goto rxscan234_scan
  rxscan234_loop:
    ($P10) = rx231_cur."from"()
    inc $P10
    set rx231_pos, $P10
    ge rx231_pos, rx231_eos, rxscan234_done
  rxscan234_scan:
    set_addr $I10, rxscan234_loop
    rx231_cur."!mark_push"(0, rx231_pos, $I10)
  rxscan234_done:
.annotate 'line', 84
  # rx subcapture "sym"
    set_addr $I10, rxcap_235_fail
    rx231_cur."!mark_push"(0, rx231_pos, $I10)
  # rx literal  "$"
    add $I11, rx231_pos, 1
    gt $I11, rx231_eos, rx231_fail
    sub $I11, rx231_pos, rx231_off
    substr $S10, rx231_tgt, $I11, 1
    ne $S10, "$", rx231_fail
    add rx231_pos, 1
    set_addr $I10, rxcap_235_fail
    ($I12, $I11) = rx231_cur."!mark_peek"($I10)
    rx231_cur."!cursor_pos"($I11)
    ($P10) = rx231_cur."!cursor_start"()
    $P10."!cursor_pass"(rx231_pos, "")
    rx231_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_235_done
  rxcap_235_fail:
    goto rx231_fail
  rxcap_235_done:
  # rx pass
    rx231_cur."!cursor_pass"(rx231_pos, "metachar:sym<$>")
    rx231_cur."!cursor_debug"("PASS  ", "metachar:sym<$>", " at pos=", rx231_pos)
    .return (rx231_cur)
  rx231_restart:
.annotate 'line', 3
    rx231_cur."!cursor_debug"("NEXT ", "metachar:sym<$>")
  rx231_fail:
    (rx231_rep, rx231_pos, $I10, $P10) = rx231_cur."!mark_fail"(0)
    lt rx231_pos, -1, rx231_done
    eq rx231_pos, -1, rx231_fail
    jump $I10
  rx231_done:
    rx231_cur."!cursor_fail"()
    rx231_cur."!cursor_debug"("FAIL  ", "metachar:sym<$>")
    .return (rx231_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<$>"  :subid("68_1280467470.54449") :method
.annotate 'line', 3
    new $P233, "ResizablePMCArray"
    push $P233, "$"
    .return ($P233)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$$>"  :subid("69_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx237_tgt
    .local int rx237_pos
    .local int rx237_off
    .local int rx237_eos
    .local int rx237_rep
    .local pmc rx237_cur
    (rx237_cur, rx237_pos, rx237_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx237_cur
    .local pmc match
    .lex "$/", match
    length rx237_eos, rx237_tgt
    gt rx237_pos, rx237_eos, rx237_done
    set rx237_off, 0
    lt rx237_pos, 2, rx237_start
    sub rx237_off, rx237_pos, 1
    substr rx237_tgt, rx237_tgt, rx237_off
  rx237_start:
    eq $I10, 1, rx237_restart
    rx237_cur."!cursor_debug"("START ", "metachar:sym<$$>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan240_done
    goto rxscan240_scan
  rxscan240_loop:
    ($P10) = rx237_cur."from"()
    inc $P10
    set rx237_pos, $P10
    ge rx237_pos, rx237_eos, rxscan240_done
  rxscan240_scan:
    set_addr $I10, rxscan240_loop
    rx237_cur."!mark_push"(0, rx237_pos, $I10)
  rxscan240_done:
.annotate 'line', 85
  # rx subcapture "sym"
    set_addr $I10, rxcap_241_fail
    rx237_cur."!mark_push"(0, rx237_pos, $I10)
  # rx literal  "$$"
    add $I11, rx237_pos, 2
    gt $I11, rx237_eos, rx237_fail
    sub $I11, rx237_pos, rx237_off
    substr $S10, rx237_tgt, $I11, 2
    ne $S10, "$$", rx237_fail
    add rx237_pos, 2
    set_addr $I10, rxcap_241_fail
    ($I12, $I11) = rx237_cur."!mark_peek"($I10)
    rx237_cur."!cursor_pos"($I11)
    ($P10) = rx237_cur."!cursor_start"()
    $P10."!cursor_pass"(rx237_pos, "")
    rx237_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_241_done
  rxcap_241_fail:
    goto rx237_fail
  rxcap_241_done:
  # rx pass
    rx237_cur."!cursor_pass"(rx237_pos, "metachar:sym<$$>")
    rx237_cur."!cursor_debug"("PASS  ", "metachar:sym<$$>", " at pos=", rx237_pos)
    .return (rx237_cur)
  rx237_restart:
.annotate 'line', 3
    rx237_cur."!cursor_debug"("NEXT ", "metachar:sym<$$>")
  rx237_fail:
    (rx237_rep, rx237_pos, $I10, $P10) = rx237_cur."!mark_fail"(0)
    lt rx237_pos, -1, rx237_done
    eq rx237_pos, -1, rx237_fail
    jump $I10
  rx237_done:
    rx237_cur."!cursor_fail"()
    rx237_cur."!cursor_debug"("FAIL  ", "metachar:sym<$$>")
    .return (rx237_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<$$>"  :subid("70_1280467470.54449") :method
.annotate 'line', 3
    new $P239, "ResizablePMCArray"
    push $P239, "$$"
    .return ($P239)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<:::>"  :subid("71_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx243_tgt
    .local int rx243_pos
    .local int rx243_off
    .local int rx243_eos
    .local int rx243_rep
    .local pmc rx243_cur
    (rx243_cur, rx243_pos, rx243_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx243_cur
    .local pmc match
    .lex "$/", match
    length rx243_eos, rx243_tgt
    gt rx243_pos, rx243_eos, rx243_done
    set rx243_off, 0
    lt rx243_pos, 2, rx243_start
    sub rx243_off, rx243_pos, 1
    substr rx243_tgt, rx243_tgt, rx243_off
  rx243_start:
    eq $I10, 1, rx243_restart
    rx243_cur."!cursor_debug"("START ", "metachar:sym<:::>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan247_done
    goto rxscan247_scan
  rxscan247_loop:
    ($P10) = rx243_cur."from"()
    inc $P10
    set rx243_pos, $P10
    ge rx243_pos, rx243_eos, rxscan247_done
  rxscan247_scan:
    set_addr $I10, rxscan247_loop
    rx243_cur."!mark_push"(0, rx243_pos, $I10)
  rxscan247_done:
.annotate 'line', 86
  # rx subcapture "sym"
    set_addr $I10, rxcap_248_fail
    rx243_cur."!mark_push"(0, rx243_pos, $I10)
  # rx literal  ":::"
    add $I11, rx243_pos, 3
    gt $I11, rx243_eos, rx243_fail
    sub $I11, rx243_pos, rx243_off
    substr $S10, rx243_tgt, $I11, 3
    ne $S10, ":::", rx243_fail
    add rx243_pos, 3
    set_addr $I10, rxcap_248_fail
    ($I12, $I11) = rx243_cur."!mark_peek"($I10)
    rx243_cur."!cursor_pos"($I11)
    ($P10) = rx243_cur."!cursor_start"()
    $P10."!cursor_pass"(rx243_pos, "")
    rx243_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_248_done
  rxcap_248_fail:
    goto rx243_fail
  rxcap_248_done:
  # rx subrule "panic" subtype=method negate=
    rx243_cur."!cursor_pos"(rx243_pos)
    $P10 = rx243_cur."panic"("::: not yet implemented")
    unless $P10, rx243_fail
    rx243_pos = $P10."pos"()
  # rx pass
    rx243_cur."!cursor_pass"(rx243_pos, "metachar:sym<:::>")
    rx243_cur."!cursor_debug"("PASS  ", "metachar:sym<:::>", " at pos=", rx243_pos)
    .return (rx243_cur)
  rx243_restart:
.annotate 'line', 3
    rx243_cur."!cursor_debug"("NEXT ", "metachar:sym<:::>")
  rx243_fail:
    (rx243_rep, rx243_pos, $I10, $P10) = rx243_cur."!mark_fail"(0)
    lt rx243_pos, -1, rx243_done
    eq rx243_pos, -1, rx243_fail
    jump $I10
  rx243_done:
    rx243_cur."!cursor_fail"()
    rx243_cur."!cursor_debug"("FAIL  ", "metachar:sym<:::>")
    .return (rx243_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<:::>"  :subid("72_1280467470.54449") :method
.annotate 'line', 3
    $P245 = self."!PREFIX__!subrule"("panic", ":::")
    new $P246, "ResizablePMCArray"
    push $P246, $P245
    .return ($P246)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<::>"  :subid("73_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx250_tgt
    .local int rx250_pos
    .local int rx250_off
    .local int rx250_eos
    .local int rx250_rep
    .local pmc rx250_cur
    (rx250_cur, rx250_pos, rx250_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx250_cur
    .local pmc match
    .lex "$/", match
    length rx250_eos, rx250_tgt
    gt rx250_pos, rx250_eos, rx250_done
    set rx250_off, 0
    lt rx250_pos, 2, rx250_start
    sub rx250_off, rx250_pos, 1
    substr rx250_tgt, rx250_tgt, rx250_off
  rx250_start:
    eq $I10, 1, rx250_restart
    rx250_cur."!cursor_debug"("START ", "metachar:sym<::>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan254_done
    goto rxscan254_scan
  rxscan254_loop:
    ($P10) = rx250_cur."from"()
    inc $P10
    set rx250_pos, $P10
    ge rx250_pos, rx250_eos, rxscan254_done
  rxscan254_scan:
    set_addr $I10, rxscan254_loop
    rx250_cur."!mark_push"(0, rx250_pos, $I10)
  rxscan254_done:
.annotate 'line', 87
  # rx subcapture "sym"
    set_addr $I10, rxcap_255_fail
    rx250_cur."!mark_push"(0, rx250_pos, $I10)
  # rx literal  "::"
    add $I11, rx250_pos, 2
    gt $I11, rx250_eos, rx250_fail
    sub $I11, rx250_pos, rx250_off
    substr $S10, rx250_tgt, $I11, 2
    ne $S10, "::", rx250_fail
    add rx250_pos, 2
    set_addr $I10, rxcap_255_fail
    ($I12, $I11) = rx250_cur."!mark_peek"($I10)
    rx250_cur."!cursor_pos"($I11)
    ($P10) = rx250_cur."!cursor_start"()
    $P10."!cursor_pass"(rx250_pos, "")
    rx250_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_255_done
  rxcap_255_fail:
    goto rx250_fail
  rxcap_255_done:
  # rx subrule "panic" subtype=method negate=
    rx250_cur."!cursor_pos"(rx250_pos)
    $P10 = rx250_cur."panic"(":: not yet implemented")
    unless $P10, rx250_fail
    rx250_pos = $P10."pos"()
  # rx pass
    rx250_cur."!cursor_pass"(rx250_pos, "metachar:sym<::>")
    rx250_cur."!cursor_debug"("PASS  ", "metachar:sym<::>", " at pos=", rx250_pos)
    .return (rx250_cur)
  rx250_restart:
.annotate 'line', 3
    rx250_cur."!cursor_debug"("NEXT ", "metachar:sym<::>")
  rx250_fail:
    (rx250_rep, rx250_pos, $I10, $P10) = rx250_cur."!mark_fail"(0)
    lt rx250_pos, -1, rx250_done
    eq rx250_pos, -1, rx250_fail
    jump $I10
  rx250_done:
    rx250_cur."!cursor_fail"()
    rx250_cur."!cursor_debug"("FAIL  ", "metachar:sym<::>")
    .return (rx250_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<::>"  :subid("74_1280467470.54449") :method
.annotate 'line', 3
    $P252 = self."!PREFIX__!subrule"("panic", "::")
    new $P253, "ResizablePMCArray"
    push $P253, $P252
    .return ($P253)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<lwb>"  :subid("75_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx257_tgt
    .local int rx257_pos
    .local int rx257_off
    .local int rx257_eos
    .local int rx257_rep
    .local pmc rx257_cur
    (rx257_cur, rx257_pos, rx257_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx257_cur
    .local pmc match
    .lex "$/", match
    length rx257_eos, rx257_tgt
    gt rx257_pos, rx257_eos, rx257_done
    set rx257_off, 0
    lt rx257_pos, 2, rx257_start
    sub rx257_off, rx257_pos, 1
    substr rx257_tgt, rx257_tgt, rx257_off
  rx257_start:
    eq $I10, 1, rx257_restart
    rx257_cur."!cursor_debug"("START ", "metachar:sym<lwb>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan260_done
    goto rxscan260_scan
  rxscan260_loop:
    ($P10) = rx257_cur."from"()
    inc $P10
    set rx257_pos, $P10
    ge rx257_pos, rx257_eos, rxscan260_done
  rxscan260_scan:
    set_addr $I10, rxscan260_loop
    rx257_cur."!mark_push"(0, rx257_pos, $I10)
  rxscan260_done:
.annotate 'line', 88
  # rx subcapture "sym"
    set_addr $I10, rxcap_262_fail
    rx257_cur."!mark_push"(0, rx257_pos, $I10)
  alt261_0:
    set_addr $I10, alt261_1
    rx257_cur."!mark_push"(0, rx257_pos, $I10)
  # rx literal  "<<"
    add $I11, rx257_pos, 2
    gt $I11, rx257_eos, rx257_fail
    sub $I11, rx257_pos, rx257_off
    substr $S10, rx257_tgt, $I11, 2
    ne $S10, "<<", rx257_fail
    add rx257_pos, 2
    goto alt261_end
  alt261_1:
  # rx literal  unicode:"\x{ab}"
    add $I11, rx257_pos, 1
    gt $I11, rx257_eos, rx257_fail
    sub $I11, rx257_pos, rx257_off
    substr $S10, rx257_tgt, $I11, 1
    ne $S10, unicode:"\x{ab}", rx257_fail
    add rx257_pos, 1
  alt261_end:
    set_addr $I10, rxcap_262_fail
    ($I12, $I11) = rx257_cur."!mark_peek"($I10)
    rx257_cur."!cursor_pos"($I11)
    ($P10) = rx257_cur."!cursor_start"()
    $P10."!cursor_pass"(rx257_pos, "")
    rx257_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_262_done
  rxcap_262_fail:
    goto rx257_fail
  rxcap_262_done:
  # rx pass
    rx257_cur."!cursor_pass"(rx257_pos, "metachar:sym<lwb>")
    rx257_cur."!cursor_debug"("PASS  ", "metachar:sym<lwb>", " at pos=", rx257_pos)
    .return (rx257_cur)
  rx257_restart:
.annotate 'line', 3
    rx257_cur."!cursor_debug"("NEXT ", "metachar:sym<lwb>")
  rx257_fail:
    (rx257_rep, rx257_pos, $I10, $P10) = rx257_cur."!mark_fail"(0)
    lt rx257_pos, -1, rx257_done
    eq rx257_pos, -1, rx257_fail
    jump $I10
  rx257_done:
    rx257_cur."!cursor_fail"()
    rx257_cur."!cursor_debug"("FAIL  ", "metachar:sym<lwb>")
    .return (rx257_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<lwb>"  :subid("76_1280467470.54449") :method
.annotate 'line', 3
    new $P259, "ResizablePMCArray"
    push $P259, unicode:"\x{ab}"
    push $P259, "<<"
    .return ($P259)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<rwb>"  :subid("77_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx264_tgt
    .local int rx264_pos
    .local int rx264_off
    .local int rx264_eos
    .local int rx264_rep
    .local pmc rx264_cur
    (rx264_cur, rx264_pos, rx264_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx264_cur
    .local pmc match
    .lex "$/", match
    length rx264_eos, rx264_tgt
    gt rx264_pos, rx264_eos, rx264_done
    set rx264_off, 0
    lt rx264_pos, 2, rx264_start
    sub rx264_off, rx264_pos, 1
    substr rx264_tgt, rx264_tgt, rx264_off
  rx264_start:
    eq $I10, 1, rx264_restart
    rx264_cur."!cursor_debug"("START ", "metachar:sym<rwb>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan267_done
    goto rxscan267_scan
  rxscan267_loop:
    ($P10) = rx264_cur."from"()
    inc $P10
    set rx264_pos, $P10
    ge rx264_pos, rx264_eos, rxscan267_done
  rxscan267_scan:
    set_addr $I10, rxscan267_loop
    rx264_cur."!mark_push"(0, rx264_pos, $I10)
  rxscan267_done:
.annotate 'line', 89
  # rx subcapture "sym"
    set_addr $I10, rxcap_269_fail
    rx264_cur."!mark_push"(0, rx264_pos, $I10)
  alt268_0:
    set_addr $I10, alt268_1
    rx264_cur."!mark_push"(0, rx264_pos, $I10)
  # rx literal  ">>"
    add $I11, rx264_pos, 2
    gt $I11, rx264_eos, rx264_fail
    sub $I11, rx264_pos, rx264_off
    substr $S10, rx264_tgt, $I11, 2
    ne $S10, ">>", rx264_fail
    add rx264_pos, 2
    goto alt268_end
  alt268_1:
  # rx literal  unicode:"\x{bb}"
    add $I11, rx264_pos, 1
    gt $I11, rx264_eos, rx264_fail
    sub $I11, rx264_pos, rx264_off
    substr $S10, rx264_tgt, $I11, 1
    ne $S10, unicode:"\x{bb}", rx264_fail
    add rx264_pos, 1
  alt268_end:
    set_addr $I10, rxcap_269_fail
    ($I12, $I11) = rx264_cur."!mark_peek"($I10)
    rx264_cur."!cursor_pos"($I11)
    ($P10) = rx264_cur."!cursor_start"()
    $P10."!cursor_pass"(rx264_pos, "")
    rx264_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_269_done
  rxcap_269_fail:
    goto rx264_fail
  rxcap_269_done:
  # rx pass
    rx264_cur."!cursor_pass"(rx264_pos, "metachar:sym<rwb>")
    rx264_cur."!cursor_debug"("PASS  ", "metachar:sym<rwb>", " at pos=", rx264_pos)
    .return (rx264_cur)
  rx264_restart:
.annotate 'line', 3
    rx264_cur."!cursor_debug"("NEXT ", "metachar:sym<rwb>")
  rx264_fail:
    (rx264_rep, rx264_pos, $I10, $P10) = rx264_cur."!mark_fail"(0)
    lt rx264_pos, -1, rx264_done
    eq rx264_pos, -1, rx264_fail
    jump $I10
  rx264_done:
    rx264_cur."!cursor_fail"()
    rx264_cur."!cursor_debug"("FAIL  ", "metachar:sym<rwb>")
    .return (rx264_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<rwb>"  :subid("78_1280467470.54449") :method
.annotate 'line', 3
    new $P266, "ResizablePMCArray"
    push $P266, unicode:"\x{bb}"
    push $P266, ">>"
    .return ($P266)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<bs>"  :subid("79_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx271_tgt
    .local int rx271_pos
    .local int rx271_off
    .local int rx271_eos
    .local int rx271_rep
    .local pmc rx271_cur
    (rx271_cur, rx271_pos, rx271_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx271_cur
    .local pmc match
    .lex "$/", match
    length rx271_eos, rx271_tgt
    gt rx271_pos, rx271_eos, rx271_done
    set rx271_off, 0
    lt rx271_pos, 2, rx271_start
    sub rx271_off, rx271_pos, 1
    substr rx271_tgt, rx271_tgt, rx271_off
  rx271_start:
    eq $I10, 1, rx271_restart
    rx271_cur."!cursor_debug"("START ", "metachar:sym<bs>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan275_done
    goto rxscan275_scan
  rxscan275_loop:
    ($P10) = rx271_cur."from"()
    inc $P10
    set rx271_pos, $P10
    ge rx271_pos, rx271_eos, rxscan275_done
  rxscan275_scan:
    set_addr $I10, rxscan275_loop
    rx271_cur."!mark_push"(0, rx271_pos, $I10)
  rxscan275_done:
.annotate 'line', 90
  # rx literal  "\\"
    add $I11, rx271_pos, 1
    gt $I11, rx271_eos, rx271_fail
    sub $I11, rx271_pos, rx271_off
    substr $S10, rx271_tgt, $I11, 1
    ne $S10, "\\", rx271_fail
    add rx271_pos, 1
  # rx subrule "backslash" subtype=capture negate=
    rx271_cur."!cursor_pos"(rx271_pos)
    $P10 = rx271_cur."backslash"()
    unless $P10, rx271_fail
    rx271_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backslash")
    rx271_pos = $P10."pos"()
  # rx pass
    rx271_cur."!cursor_pass"(rx271_pos, "metachar:sym<bs>")
    rx271_cur."!cursor_debug"("PASS  ", "metachar:sym<bs>", " at pos=", rx271_pos)
    .return (rx271_cur)
  rx271_restart:
.annotate 'line', 3
    rx271_cur."!cursor_debug"("NEXT ", "metachar:sym<bs>")
  rx271_fail:
    (rx271_rep, rx271_pos, $I10, $P10) = rx271_cur."!mark_fail"(0)
    lt rx271_pos, -1, rx271_done
    eq rx271_pos, -1, rx271_fail
    jump $I10
  rx271_done:
    rx271_cur."!cursor_fail"()
    rx271_cur."!cursor_debug"("FAIL  ", "metachar:sym<bs>")
    .return (rx271_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<bs>"  :subid("80_1280467470.54449") :method
.annotate 'line', 3
    $P273 = self."!PREFIX__!subrule"("backslash", "\\")
    new $P274, "ResizablePMCArray"
    push $P274, $P273
    .return ($P274)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<mod>"  :subid("81_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx277_tgt
    .local int rx277_pos
    .local int rx277_off
    .local int rx277_eos
    .local int rx277_rep
    .local pmc rx277_cur
    (rx277_cur, rx277_pos, rx277_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx277_cur
    .local pmc match
    .lex "$/", match
    length rx277_eos, rx277_tgt
    gt rx277_pos, rx277_eos, rx277_done
    set rx277_off, 0
    lt rx277_pos, 2, rx277_start
    sub rx277_off, rx277_pos, 1
    substr rx277_tgt, rx277_tgt, rx277_off
  rx277_start:
    eq $I10, 1, rx277_restart
    rx277_cur."!cursor_debug"("START ", "metachar:sym<mod>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan281_done
    goto rxscan281_scan
  rxscan281_loop:
    ($P10) = rx277_cur."from"()
    inc $P10
    set rx277_pos, $P10
    ge rx277_pos, rx277_eos, rxscan281_done
  rxscan281_scan:
    set_addr $I10, rxscan281_loop
    rx277_cur."!mark_push"(0, rx277_pos, $I10)
  rxscan281_done:
.annotate 'line', 91
  # rx subrule "mod_internal" subtype=capture negate=
    rx277_cur."!cursor_pos"(rx277_pos)
    $P10 = rx277_cur."mod_internal"()
    unless $P10, rx277_fail
    rx277_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_internal")
    rx277_pos = $P10."pos"()
  # rx pass
    rx277_cur."!cursor_pass"(rx277_pos, "metachar:sym<mod>")
    rx277_cur."!cursor_debug"("PASS  ", "metachar:sym<mod>", " at pos=", rx277_pos)
    .return (rx277_cur)
  rx277_restart:
.annotate 'line', 3
    rx277_cur."!cursor_debug"("NEXT ", "metachar:sym<mod>")
  rx277_fail:
    (rx277_rep, rx277_pos, $I10, $P10) = rx277_cur."!mark_fail"(0)
    lt rx277_pos, -1, rx277_done
    eq rx277_pos, -1, rx277_fail
    jump $I10
  rx277_done:
    rx277_cur."!cursor_fail"()
    rx277_cur."!cursor_debug"("FAIL  ", "metachar:sym<mod>")
    .return (rx277_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<mod>"  :subid("82_1280467470.54449") :method
.annotate 'line', 3
    $P279 = self."!PREFIX__!subrule"("mod_internal", "")
    new $P280, "ResizablePMCArray"
    push $P280, $P279
    .return ($P280)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<~>"  :subid("83_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx283_tgt
    .local int rx283_pos
    .local int rx283_off
    .local int rx283_eos
    .local int rx283_rep
    .local pmc rx283_cur
    (rx283_cur, rx283_pos, rx283_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx283_cur
    .local pmc match
    .lex "$/", match
    length rx283_eos, rx283_tgt
    gt rx283_pos, rx283_eos, rx283_done
    set rx283_off, 0
    lt rx283_pos, 2, rx283_start
    sub rx283_off, rx283_pos, 1
    substr rx283_tgt, rx283_tgt, rx283_off
  rx283_start:
    eq $I10, 1, rx283_restart
    rx283_cur."!cursor_debug"("START ", "metachar:sym<~>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan287_done
    goto rxscan287_scan
  rxscan287_loop:
    ($P10) = rx283_cur."from"()
    inc $P10
    set rx283_pos, $P10
    ge rx283_pos, rx283_eos, rxscan287_done
  rxscan287_scan:
    set_addr $I10, rxscan287_loop
    rx283_cur."!mark_push"(0, rx283_pos, $I10)
  rxscan287_done:
.annotate 'line', 95
  # rx subcapture "sym"
    set_addr $I10, rxcap_288_fail
    rx283_cur."!mark_push"(0, rx283_pos, $I10)
  # rx literal  "~"
    add $I11, rx283_pos, 1
    gt $I11, rx283_eos, rx283_fail
    sub $I11, rx283_pos, rx283_off
    substr $S10, rx283_tgt, $I11, 1
    ne $S10, "~", rx283_fail
    add rx283_pos, 1
    set_addr $I10, rxcap_288_fail
    ($I12, $I11) = rx283_cur."!mark_peek"($I10)
    rx283_cur."!cursor_pos"($I11)
    ($P10) = rx283_cur."!cursor_start"()
    $P10."!cursor_pass"(rx283_pos, "")
    rx283_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_288_done
  rxcap_288_fail:
    goto rx283_fail
  rxcap_288_done:
.annotate 'line', 96
  # rx subrule "ws" subtype=method negate=
    rx283_cur."!cursor_pos"(rx283_pos)
    $P10 = rx283_cur."ws"()
    unless $P10, rx283_fail
    rx283_pos = $P10."pos"()
  # rx subrule "quantified_atom" subtype=capture negate=
    rx283_cur."!cursor_pos"(rx283_pos)
    $P10 = rx283_cur."quantified_atom"()
    unless $P10, rx283_fail
    rx283_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("GOAL")
    rx283_pos = $P10."pos"()
.annotate 'line', 97
  # rx subrule "ws" subtype=method negate=
    rx283_cur."!cursor_pos"(rx283_pos)
    $P10 = rx283_cur."ws"()
    unless $P10, rx283_fail
    rx283_pos = $P10."pos"()
  # rx subrule "quantified_atom" subtype=capture negate=
    rx283_cur."!cursor_pos"(rx283_pos)
    $P10 = rx283_cur."quantified_atom"()
    unless $P10, rx283_fail
    rx283_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx283_pos = $P10."pos"()
.annotate 'line', 94
  # rx pass
    rx283_cur."!cursor_pass"(rx283_pos, "metachar:sym<~>")
    rx283_cur."!cursor_debug"("PASS  ", "metachar:sym<~>", " at pos=", rx283_pos)
    .return (rx283_cur)
  rx283_restart:
.annotate 'line', 3
    rx283_cur."!cursor_debug"("NEXT ", "metachar:sym<~>")
  rx283_fail:
    (rx283_rep, rx283_pos, $I10, $P10) = rx283_cur."!mark_fail"(0)
    lt rx283_pos, -1, rx283_done
    eq rx283_pos, -1, rx283_fail
    jump $I10
  rx283_done:
    rx283_cur."!cursor_fail"()
    rx283_cur."!cursor_debug"("FAIL  ", "metachar:sym<~>")
    .return (rx283_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<~>"  :subid("84_1280467470.54449") :method
.annotate 'line', 3
    $P285 = self."!PREFIX__!subrule"("ws", "~")
    new $P286, "ResizablePMCArray"
    push $P286, $P285
    .return ($P286)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<{*}>"  :subid("85_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx290_tgt
    .local int rx290_pos
    .local int rx290_off
    .local int rx290_eos
    .local int rx290_rep
    .local pmc rx290_cur
    (rx290_cur, rx290_pos, rx290_tgt, $I10) = self."!cursor_start"()
    rx290_cur."!cursor_caparray"("key")
    .lex unicode:"$\x{a2}", rx290_cur
    .local pmc match
    .lex "$/", match
    length rx290_eos, rx290_tgt
    gt rx290_pos, rx290_eos, rx290_done
    set rx290_off, 0
    lt rx290_pos, 2, rx290_start
    sub rx290_off, rx290_pos, 1
    substr rx290_tgt, rx290_tgt, rx290_off
  rx290_start:
    eq $I10, 1, rx290_restart
    rx290_cur."!cursor_debug"("START ", "metachar:sym<{*}>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan293_done
    goto rxscan293_scan
  rxscan293_loop:
    ($P10) = rx290_cur."from"()
    inc $P10
    set rx290_pos, $P10
    ge rx290_pos, rx290_eos, rxscan293_done
  rxscan293_scan:
    set_addr $I10, rxscan293_loop
    rx290_cur."!mark_push"(0, rx290_pos, $I10)
  rxscan293_done:
.annotate 'line', 101
  # rx subcapture "sym"
    set_addr $I10, rxcap_294_fail
    rx290_cur."!mark_push"(0, rx290_pos, $I10)
  # rx literal  "{*}"
    add $I11, rx290_pos, 3
    gt $I11, rx290_eos, rx290_fail
    sub $I11, rx290_pos, rx290_off
    substr $S10, rx290_tgt, $I11, 3
    ne $S10, "{*}", rx290_fail
    add rx290_pos, 3
    set_addr $I10, rxcap_294_fail
    ($I12, $I11) = rx290_cur."!mark_peek"($I10)
    rx290_cur."!cursor_pos"($I11)
    ($P10) = rx290_cur."!cursor_start"()
    $P10."!cursor_pass"(rx290_pos, "")
    rx290_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_294_done
  rxcap_294_fail:
    goto rx290_fail
  rxcap_294_done:
.annotate 'line', 102
  # rx rxquantr295 ** 0..1
    set_addr $I10, rxquantr295_done
    rx290_cur."!mark_push"(0, rx290_pos, $I10)
  rxquantr295_loop:
  # rx rxquantr296 ** 0..*
    set_addr $I10, rxquantr296_done
    rx290_cur."!mark_push"(0, rx290_pos, $I10)
  rxquantr296_loop:
  # rx enumcharlist negate=0 
    ge rx290_pos, rx290_eos, rx290_fail
    sub $I10, rx290_pos, rx290_off
    substr $S10, rx290_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx290_fail
    inc rx290_pos
    set_addr $I10, rxquantr296_done
    (rx290_rep) = rx290_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr296_done
    rx290_cur."!mark_push"(rx290_rep, rx290_pos, $I10)
    goto rxquantr296_loop
  rxquantr296_done:
  # rx literal  "#= "
    add $I11, rx290_pos, 3
    gt $I11, rx290_eos, rx290_fail
    sub $I11, rx290_pos, rx290_off
    substr $S10, rx290_tgt, $I11, 3
    ne $S10, "#= ", rx290_fail
    add rx290_pos, 3
  # rx rxquantr297 ** 0..*
    set_addr $I10, rxquantr297_done
    rx290_cur."!mark_push"(0, rx290_pos, $I10)
  rxquantr297_loop:
  # rx enumcharlist negate=0 
    ge rx290_pos, rx290_eos, rx290_fail
    sub $I10, rx290_pos, rx290_off
    substr $S10, rx290_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx290_fail
    inc rx290_pos
    set_addr $I10, rxquantr297_done
    (rx290_rep) = rx290_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr297_done
    rx290_cur."!mark_push"(rx290_rep, rx290_pos, $I10)
    goto rxquantr297_loop
  rxquantr297_done:
  # rx subcapture "key"
    set_addr $I10, rxcap_300_fail
    rx290_cur."!mark_push"(0, rx290_pos, $I10)
  # rx charclass_q S r 1..-1
    sub $I10, rx290_pos, rx290_off
    find_cclass $I11, 32, rx290_tgt, $I10, rx290_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx290_fail
    add rx290_pos, rx290_off, $I11
  # rx rxquantr298 ** 0..*
    set_addr $I10, rxquantr298_done
    rx290_cur."!mark_push"(0, rx290_pos, $I10)
  rxquantr298_loop:
  # rx rxquantr299 ** 1..*
    set_addr $I10, rxquantr299_done
    rx290_cur."!mark_push"(0, -1, $I10)
  rxquantr299_loop:
  # rx enumcharlist negate=0 
    ge rx290_pos, rx290_eos, rx290_fail
    sub $I10, rx290_pos, rx290_off
    substr $S10, rx290_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx290_fail
    inc rx290_pos
    set_addr $I10, rxquantr299_done
    (rx290_rep) = rx290_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr299_done
    rx290_cur."!mark_push"(rx290_rep, rx290_pos, $I10)
    goto rxquantr299_loop
  rxquantr299_done:
  # rx charclass_q S r 1..-1
    sub $I10, rx290_pos, rx290_off
    find_cclass $I11, 32, rx290_tgt, $I10, rx290_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx290_fail
    add rx290_pos, rx290_off, $I11
    set_addr $I10, rxquantr298_done
    (rx290_rep) = rx290_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr298_done
    rx290_cur."!mark_push"(rx290_rep, rx290_pos, $I10)
    goto rxquantr298_loop
  rxquantr298_done:
    set_addr $I10, rxcap_300_fail
    ($I12, $I11) = rx290_cur."!mark_peek"($I10)
    rx290_cur."!cursor_pos"($I11)
    ($P10) = rx290_cur."!cursor_start"()
    $P10."!cursor_pass"(rx290_pos, "")
    rx290_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("key")
    goto rxcap_300_done
  rxcap_300_fail:
    goto rx290_fail
  rxcap_300_done:
    set_addr $I10, rxquantr295_done
    (rx290_rep) = rx290_cur."!mark_commit"($I10)
  rxquantr295_done:
.annotate 'line', 100
  # rx pass
    rx290_cur."!cursor_pass"(rx290_pos, "metachar:sym<{*}>")
    rx290_cur."!cursor_debug"("PASS  ", "metachar:sym<{*}>", " at pos=", rx290_pos)
    .return (rx290_cur)
  rx290_restart:
.annotate 'line', 3
    rx290_cur."!cursor_debug"("NEXT ", "metachar:sym<{*}>")
  rx290_fail:
    (rx290_rep, rx290_pos, $I10, $P10) = rx290_cur."!mark_fail"(0)
    lt rx290_pos, -1, rx290_done
    eq rx290_pos, -1, rx290_fail
    jump $I10
  rx290_done:
    rx290_cur."!cursor_fail"()
    rx290_cur."!cursor_debug"("FAIL  ", "metachar:sym<{*}>")
    .return (rx290_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<{*}>"  :subid("86_1280467470.54449") :method
.annotate 'line', 3
    new $P292, "ResizablePMCArray"
    push $P292, "{*}"
    .return ($P292)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<assert>"  :subid("87_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx302_tgt
    .local int rx302_pos
    .local int rx302_off
    .local int rx302_eos
    .local int rx302_rep
    .local pmc rx302_cur
    (rx302_cur, rx302_pos, rx302_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx302_cur
    .local pmc match
    .lex "$/", match
    length rx302_eos, rx302_tgt
    gt rx302_pos, rx302_eos, rx302_done
    set rx302_off, 0
    lt rx302_pos, 2, rx302_start
    sub rx302_off, rx302_pos, 1
    substr rx302_tgt, rx302_tgt, rx302_off
  rx302_start:
    eq $I10, 1, rx302_restart
    rx302_cur."!cursor_debug"("START ", "metachar:sym<assert>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan306_done
    goto rxscan306_scan
  rxscan306_loop:
    ($P10) = rx302_cur."from"()
    inc $P10
    set rx302_pos, $P10
    ge rx302_pos, rx302_eos, rxscan306_done
  rxscan306_scan:
    set_addr $I10, rxscan306_loop
    rx302_cur."!mark_push"(0, rx302_pos, $I10)
  rxscan306_done:
.annotate 'line', 105
  # rx literal  "<"
    add $I11, rx302_pos, 1
    gt $I11, rx302_eos, rx302_fail
    sub $I11, rx302_pos, rx302_off
    substr $S10, rx302_tgt, $I11, 1
    ne $S10, "<", rx302_fail
    add rx302_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx302_cur."!cursor_pos"(rx302_pos)
    $P10 = rx302_cur."assertion"()
    unless $P10, rx302_fail
    rx302_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx302_pos = $P10."pos"()
  alt307_0:
.annotate 'line', 106
    set_addr $I10, alt307_1
    rx302_cur."!mark_push"(0, rx302_pos, $I10)
  # rx literal  ">"
    add $I11, rx302_pos, 1
    gt $I11, rx302_eos, rx302_fail
    sub $I11, rx302_pos, rx302_off
    substr $S10, rx302_tgt, $I11, 1
    ne $S10, ">", rx302_fail
    add rx302_pos, 1
    goto alt307_end
  alt307_1:
  # rx subrule "panic" subtype=method negate=
    rx302_cur."!cursor_pos"(rx302_pos)
    $P10 = rx302_cur."panic"("regex assertion not terminated by angle bracket")
    unless $P10, rx302_fail
    rx302_pos = $P10."pos"()
  alt307_end:
.annotate 'line', 104
  # rx pass
    rx302_cur."!cursor_pass"(rx302_pos, "metachar:sym<assert>")
    rx302_cur."!cursor_debug"("PASS  ", "metachar:sym<assert>", " at pos=", rx302_pos)
    .return (rx302_cur)
  rx302_restart:
.annotate 'line', 3
    rx302_cur."!cursor_debug"("NEXT ", "metachar:sym<assert>")
  rx302_fail:
    (rx302_rep, rx302_pos, $I10, $P10) = rx302_cur."!mark_fail"(0)
    lt rx302_pos, -1, rx302_done
    eq rx302_pos, -1, rx302_fail
    jump $I10
  rx302_done:
    rx302_cur."!cursor_fail"()
    rx302_cur."!cursor_debug"("FAIL  ", "metachar:sym<assert>")
    .return (rx302_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<assert>"  :subid("88_1280467470.54449") :method
.annotate 'line', 3
    $P304 = self."!PREFIX__!subrule"("assertion", "<")
    new $P305, "ResizablePMCArray"
    push $P305, $P304
    .return ($P305)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<var>"  :subid("89_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx309_tgt
    .local int rx309_pos
    .local int rx309_off
    .local int rx309_eos
    .local int rx309_rep
    .local pmc rx309_cur
    (rx309_cur, rx309_pos, rx309_tgt, $I10) = self."!cursor_start"()
    rx309_cur."!cursor_caparray"("quantified_atom")
    .lex unicode:"$\x{a2}", rx309_cur
    .local pmc match
    .lex "$/", match
    length rx309_eos, rx309_tgt
    gt rx309_pos, rx309_eos, rx309_done
    set rx309_off, 0
    lt rx309_pos, 2, rx309_start
    sub rx309_off, rx309_pos, 1
    substr rx309_tgt, rx309_tgt, rx309_off
  rx309_start:
    eq $I10, 1, rx309_restart
    rx309_cur."!cursor_debug"("START ", "metachar:sym<var>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan312_done
    goto rxscan312_scan
  rxscan312_loop:
    ($P10) = rx309_cur."from"()
    inc $P10
    set rx309_pos, $P10
    ge rx309_pos, rx309_eos, rxscan312_done
  rxscan312_scan:
    set_addr $I10, rxscan312_loop
    rx309_cur."!mark_push"(0, rx309_pos, $I10)
  rxscan312_done:
  alt313_0:
.annotate 'line', 110
    set_addr $I10, alt313_1
    rx309_cur."!mark_push"(0, rx309_pos, $I10)
.annotate 'line', 111
  # rx literal  "$<"
    add $I11, rx309_pos, 2
    gt $I11, rx309_eos, rx309_fail
    sub $I11, rx309_pos, rx309_off
    substr $S10, rx309_tgt, $I11, 2
    ne $S10, "$<", rx309_fail
    add rx309_pos, 2
  # rx subcapture "name"
    set_addr $I10, rxcap_315_fail
    rx309_cur."!mark_push"(0, rx309_pos, $I10)
  # rx rxquantr314 ** 1..*
    set_addr $I10, rxquantr314_done
    rx309_cur."!mark_push"(0, -1, $I10)
  rxquantr314_loop:
  # rx enumcharlist negate=1 
    ge rx309_pos, rx309_eos, rx309_fail
    sub $I10, rx309_pos, rx309_off
    substr $S10, rx309_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx309_fail
    inc rx309_pos
    set_addr $I10, rxquantr314_done
    (rx309_rep) = rx309_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr314_done
    rx309_cur."!mark_push"(rx309_rep, rx309_pos, $I10)
    goto rxquantr314_loop
  rxquantr314_done:
    set_addr $I10, rxcap_315_fail
    ($I12, $I11) = rx309_cur."!mark_peek"($I10)
    rx309_cur."!cursor_pos"($I11)
    ($P10) = rx309_cur."!cursor_start"()
    $P10."!cursor_pass"(rx309_pos, "")
    rx309_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_315_done
  rxcap_315_fail:
    goto rx309_fail
  rxcap_315_done:
  # rx literal  ">"
    add $I11, rx309_pos, 1
    gt $I11, rx309_eos, rx309_fail
    sub $I11, rx309_pos, rx309_off
    substr $S10, rx309_tgt, $I11, 1
    ne $S10, ">", rx309_fail
    add rx309_pos, 1
    goto alt313_end
  alt313_1:
.annotate 'line', 112
  # rx literal  "$"
    add $I11, rx309_pos, 1
    gt $I11, rx309_eos, rx309_fail
    sub $I11, rx309_pos, rx309_off
    substr $S10, rx309_tgt, $I11, 1
    ne $S10, "$", rx309_fail
    add rx309_pos, 1
  # rx subcapture "pos"
    set_addr $I10, rxcap_316_fail
    rx309_cur."!mark_push"(0, rx309_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx309_pos, rx309_off
    find_not_cclass $I11, 8, rx309_tgt, $I10, rx309_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx309_fail
    add rx309_pos, rx309_off, $I11
    set_addr $I10, rxcap_316_fail
    ($I12, $I11) = rx309_cur."!mark_peek"($I10)
    rx309_cur."!cursor_pos"($I11)
    ($P10) = rx309_cur."!cursor_start"()
    $P10."!cursor_pass"(rx309_pos, "")
    rx309_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pos")
    goto rxcap_316_done
  rxcap_316_fail:
    goto rx309_fail
  rxcap_316_done:
  alt313_end:
.annotate 'line', 115
  # rx rxquantr317 ** 0..1
    set_addr $I10, rxquantr317_done
    rx309_cur."!mark_push"(0, rx309_pos, $I10)
  rxquantr317_loop:
  # rx subrule "ws" subtype=method negate=
    rx309_cur."!cursor_pos"(rx309_pos)
    $P10 = rx309_cur."ws"()
    unless $P10, rx309_fail
    rx309_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx309_pos, 1
    gt $I11, rx309_eos, rx309_fail
    sub $I11, rx309_pos, rx309_off
    substr $S10, rx309_tgt, $I11, 1
    ne $S10, "=", rx309_fail
    add rx309_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx309_cur."!cursor_pos"(rx309_pos)
    $P10 = rx309_cur."ws"()
    unless $P10, rx309_fail
    rx309_pos = $P10."pos"()
  # rx subrule "quantified_atom" subtype=capture negate=
    rx309_cur."!cursor_pos"(rx309_pos)
    $P10 = rx309_cur."quantified_atom"()
    unless $P10, rx309_fail
    rx309_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantified_atom")
    rx309_pos = $P10."pos"()
    set_addr $I10, rxquantr317_done
    (rx309_rep) = rx309_cur."!mark_commit"($I10)
  rxquantr317_done:
.annotate 'line', 109
  # rx pass
    rx309_cur."!cursor_pass"(rx309_pos, "metachar:sym<var>")
    rx309_cur."!cursor_debug"("PASS  ", "metachar:sym<var>", " at pos=", rx309_pos)
    .return (rx309_cur)
  rx309_restart:
.annotate 'line', 3
    rx309_cur."!cursor_debug"("NEXT ", "metachar:sym<var>")
  rx309_fail:
    (rx309_rep, rx309_pos, $I10, $P10) = rx309_cur."!mark_fail"(0)
    lt rx309_pos, -1, rx309_done
    eq rx309_pos, -1, rx309_fail
    jump $I10
  rx309_done:
    rx309_cur."!cursor_fail"()
    rx309_cur."!cursor_debug"("FAIL  ", "metachar:sym<var>")
    .return (rx309_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<var>"  :subid("90_1280467470.54449") :method
.annotate 'line', 3
    new $P311, "ResizablePMCArray"
    push $P311, "$"
    push $P311, "$<"
    .return ($P311)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<PIR>"  :subid("91_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx319_tgt
    .local int rx319_pos
    .local int rx319_off
    .local int rx319_eos
    .local int rx319_rep
    .local pmc rx319_cur
    (rx319_cur, rx319_pos, rx319_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx319_cur
    .local pmc match
    .lex "$/", match
    length rx319_eos, rx319_tgt
    gt rx319_pos, rx319_eos, rx319_done
    set rx319_off, 0
    lt rx319_pos, 2, rx319_start
    sub rx319_off, rx319_pos, 1
    substr rx319_tgt, rx319_tgt, rx319_off
  rx319_start:
    eq $I10, 1, rx319_restart
    rx319_cur."!cursor_debug"("START ", "metachar:sym<PIR>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan322_done
    goto rxscan322_scan
  rxscan322_loop:
    ($P10) = rx319_cur."from"()
    inc $P10
    set rx319_pos, $P10
    ge rx319_pos, rx319_eos, rxscan322_done
  rxscan322_scan:
    set_addr $I10, rxscan322_loop
    rx319_cur."!mark_push"(0, rx319_pos, $I10)
  rxscan322_done:
.annotate 'line', 119
  # rx literal  ":PIR{{"
    add $I11, rx319_pos, 6
    gt $I11, rx319_eos, rx319_fail
    sub $I11, rx319_pos, rx319_off
    substr $S10, rx319_tgt, $I11, 6
    ne $S10, ":PIR{{", rx319_fail
    add rx319_pos, 6
  # rx subcapture "pir"
    set_addr $I10, rxcap_325_fail
    rx319_cur."!mark_push"(0, rx319_pos, $I10)
  # rx rxquantf323 ** 0..*
    set_addr $I10, rxquantf323_loop
    rx319_cur."!mark_push"(0, rx319_pos, $I10)
    goto rxquantf323_done
  rxquantf323_loop:
  # rx charclass .
    ge rx319_pos, rx319_eos, rx319_fail
    inc rx319_pos
    set_addr $I10, rxquantf323_loop
    rx319_cur."!mark_push"(rx319_rep, rx319_pos, $I10)
  rxquantf323_done:
    set_addr $I10, rxcap_325_fail
    ($I12, $I11) = rx319_cur."!mark_peek"($I10)
    rx319_cur."!cursor_pos"($I11)
    ($P10) = rx319_cur."!cursor_start"()
    $P10."!cursor_pass"(rx319_pos, "")
    rx319_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pir")
    goto rxcap_325_done
  rxcap_325_fail:
    goto rx319_fail
  rxcap_325_done:
  # rx literal  "}}"
    add $I11, rx319_pos, 2
    gt $I11, rx319_eos, rx319_fail
    sub $I11, rx319_pos, rx319_off
    substr $S10, rx319_tgt, $I11, 2
    ne $S10, "}}", rx319_fail
    add rx319_pos, 2
.annotate 'line', 118
  # rx pass
    rx319_cur."!cursor_pass"(rx319_pos, "metachar:sym<PIR>")
    rx319_cur."!cursor_debug"("PASS  ", "metachar:sym<PIR>", " at pos=", rx319_pos)
    .return (rx319_cur)
  rx319_restart:
.annotate 'line', 3
    rx319_cur."!cursor_debug"("NEXT ", "metachar:sym<PIR>")
  rx319_fail:
    (rx319_rep, rx319_pos, $I10, $P10) = rx319_cur."!mark_fail"(0)
    lt rx319_pos, -1, rx319_done
    eq rx319_pos, -1, rx319_fail
    jump $I10
  rx319_done:
    rx319_cur."!cursor_fail"()
    rx319_cur."!cursor_debug"("FAIL  ", "metachar:sym<PIR>")
    .return (rx319_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<PIR>"  :subid("92_1280467470.54449") :method
.annotate 'line', 3
    new $P321, "ResizablePMCArray"
    push $P321, ":PIR{{"
    .return ($P321)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash"  :subid("93_1280467470.54449") :method
.annotate 'line', 122
    $P327 = self."!protoregex"("backslash")
    .return ($P327)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash"  :subid("94_1280467470.54449") :method
.annotate 'line', 122
    $P329 = self."!PREFIX__!protoregex"("backslash")
    .return ($P329)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<w>"  :subid("95_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx331_tgt
    .local int rx331_pos
    .local int rx331_off
    .local int rx331_eos
    .local int rx331_rep
    .local pmc rx331_cur
    (rx331_cur, rx331_pos, rx331_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx331_cur
    .local pmc match
    .lex "$/", match
    length rx331_eos, rx331_tgt
    gt rx331_pos, rx331_eos, rx331_done
    set rx331_off, 0
    lt rx331_pos, 2, rx331_start
    sub rx331_off, rx331_pos, 1
    substr rx331_tgt, rx331_tgt, rx331_off
  rx331_start:
    eq $I10, 1, rx331_restart
    rx331_cur."!cursor_debug"("START ", "backslash:sym<w>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan334_done
    goto rxscan334_scan
  rxscan334_loop:
    ($P10) = rx331_cur."from"()
    inc $P10
    set rx331_pos, $P10
    ge rx331_pos, rx331_eos, rxscan334_done
  rxscan334_scan:
    set_addr $I10, rxscan334_loop
    rx331_cur."!mark_push"(0, rx331_pos, $I10)
  rxscan334_done:
.annotate 'line', 123
  # rx subcapture "sym"
    set_addr $I10, rxcap_335_fail
    rx331_cur."!mark_push"(0, rx331_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx331_pos, rx331_eos, rx331_fail
    sub $I10, rx331_pos, rx331_off
    substr $S10, rx331_tgt, $I10, 1
    index $I11, "dswnDSWN", $S10
    lt $I11, 0, rx331_fail
    inc rx331_pos
    set_addr $I10, rxcap_335_fail
    ($I12, $I11) = rx331_cur."!mark_peek"($I10)
    rx331_cur."!cursor_pos"($I11)
    ($P10) = rx331_cur."!cursor_start"()
    $P10."!cursor_pass"(rx331_pos, "")
    rx331_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_335_done
  rxcap_335_fail:
    goto rx331_fail
  rxcap_335_done:
  # rx pass
    rx331_cur."!cursor_pass"(rx331_pos, "backslash:sym<w>")
    rx331_cur."!cursor_debug"("PASS  ", "backslash:sym<w>", " at pos=", rx331_pos)
    .return (rx331_cur)
  rx331_restart:
.annotate 'line', 3
    rx331_cur."!cursor_debug"("NEXT ", "backslash:sym<w>")
  rx331_fail:
    (rx331_rep, rx331_pos, $I10, $P10) = rx331_cur."!mark_fail"(0)
    lt rx331_pos, -1, rx331_done
    eq rx331_pos, -1, rx331_fail
    jump $I10
  rx331_done:
    rx331_cur."!cursor_fail"()
    rx331_cur."!cursor_debug"("FAIL  ", "backslash:sym<w>")
    .return (rx331_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<w>"  :subid("96_1280467470.54449") :method
.annotate 'line', 3
    new $P333, "ResizablePMCArray"
    push $P333, "N"
    push $P333, "W"
    push $P333, "S"
    push $P333, "D"
    push $P333, "n"
    push $P333, "w"
    push $P333, "s"
    push $P333, "d"
    .return ($P333)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<b>"  :subid("97_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx337_tgt
    .local int rx337_pos
    .local int rx337_off
    .local int rx337_eos
    .local int rx337_rep
    .local pmc rx337_cur
    (rx337_cur, rx337_pos, rx337_tgt, $I10) = self."!cursor_start"()
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
    eq $I10, 1, rx337_restart
    rx337_cur."!cursor_debug"("START ", "backslash:sym<b>")
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
.annotate 'line', 124
  # rx subcapture "sym"
    set_addr $I10, rxcap_341_fail
    rx337_cur."!mark_push"(0, rx337_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx337_pos, rx337_eos, rx337_fail
    sub $I10, rx337_pos, rx337_off
    substr $S10, rx337_tgt, $I10, 1
    index $I11, "bB", $S10
    lt $I11, 0, rx337_fail
    inc rx337_pos
    set_addr $I10, rxcap_341_fail
    ($I12, $I11) = rx337_cur."!mark_peek"($I10)
    rx337_cur."!cursor_pos"($I11)
    ($P10) = rx337_cur."!cursor_start"()
    $P10."!cursor_pass"(rx337_pos, "")
    rx337_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_341_done
  rxcap_341_fail:
    goto rx337_fail
  rxcap_341_done:
  # rx pass
    rx337_cur."!cursor_pass"(rx337_pos, "backslash:sym<b>")
    rx337_cur."!cursor_debug"("PASS  ", "backslash:sym<b>", " at pos=", rx337_pos)
    .return (rx337_cur)
  rx337_restart:
.annotate 'line', 3
    rx337_cur."!cursor_debug"("NEXT ", "backslash:sym<b>")
  rx337_fail:
    (rx337_rep, rx337_pos, $I10, $P10) = rx337_cur."!mark_fail"(0)
    lt rx337_pos, -1, rx337_done
    eq rx337_pos, -1, rx337_fail
    jump $I10
  rx337_done:
    rx337_cur."!cursor_fail"()
    rx337_cur."!cursor_debug"("FAIL  ", "backslash:sym<b>")
    .return (rx337_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<b>"  :subid("98_1280467470.54449") :method
.annotate 'line', 3
    new $P339, "ResizablePMCArray"
    push $P339, "B"
    push $P339, "b"
    .return ($P339)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<e>"  :subid("99_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx343_tgt
    .local int rx343_pos
    .local int rx343_off
    .local int rx343_eos
    .local int rx343_rep
    .local pmc rx343_cur
    (rx343_cur, rx343_pos, rx343_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx343_cur
    .local pmc match
    .lex "$/", match
    length rx343_eos, rx343_tgt
    gt rx343_pos, rx343_eos, rx343_done
    set rx343_off, 0
    lt rx343_pos, 2, rx343_start
    sub rx343_off, rx343_pos, 1
    substr rx343_tgt, rx343_tgt, rx343_off
  rx343_start:
    eq $I10, 1, rx343_restart
    rx343_cur."!cursor_debug"("START ", "backslash:sym<e>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan346_done
    goto rxscan346_scan
  rxscan346_loop:
    ($P10) = rx343_cur."from"()
    inc $P10
    set rx343_pos, $P10
    ge rx343_pos, rx343_eos, rxscan346_done
  rxscan346_scan:
    set_addr $I10, rxscan346_loop
    rx343_cur."!mark_push"(0, rx343_pos, $I10)
  rxscan346_done:
.annotate 'line', 125
  # rx subcapture "sym"
    set_addr $I10, rxcap_347_fail
    rx343_cur."!mark_push"(0, rx343_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx343_pos, rx343_eos, rx343_fail
    sub $I10, rx343_pos, rx343_off
    substr $S10, rx343_tgt, $I10, 1
    index $I11, "eE", $S10
    lt $I11, 0, rx343_fail
    inc rx343_pos
    set_addr $I10, rxcap_347_fail
    ($I12, $I11) = rx343_cur."!mark_peek"($I10)
    rx343_cur."!cursor_pos"($I11)
    ($P10) = rx343_cur."!cursor_start"()
    $P10."!cursor_pass"(rx343_pos, "")
    rx343_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_347_done
  rxcap_347_fail:
    goto rx343_fail
  rxcap_347_done:
  # rx pass
    rx343_cur."!cursor_pass"(rx343_pos, "backslash:sym<e>")
    rx343_cur."!cursor_debug"("PASS  ", "backslash:sym<e>", " at pos=", rx343_pos)
    .return (rx343_cur)
  rx343_restart:
.annotate 'line', 3
    rx343_cur."!cursor_debug"("NEXT ", "backslash:sym<e>")
  rx343_fail:
    (rx343_rep, rx343_pos, $I10, $P10) = rx343_cur."!mark_fail"(0)
    lt rx343_pos, -1, rx343_done
    eq rx343_pos, -1, rx343_fail
    jump $I10
  rx343_done:
    rx343_cur."!cursor_fail"()
    rx343_cur."!cursor_debug"("FAIL  ", "backslash:sym<e>")
    .return (rx343_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<e>"  :subid("100_1280467470.54449") :method
.annotate 'line', 3
    new $P345, "ResizablePMCArray"
    push $P345, "E"
    push $P345, "e"
    .return ($P345)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<f>"  :subid("101_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx349_tgt
    .local int rx349_pos
    .local int rx349_off
    .local int rx349_eos
    .local int rx349_rep
    .local pmc rx349_cur
    (rx349_cur, rx349_pos, rx349_tgt, $I10) = self."!cursor_start"()
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
    eq $I10, 1, rx349_restart
    rx349_cur."!cursor_debug"("START ", "backslash:sym<f>")
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
.annotate 'line', 126
  # rx subcapture "sym"
    set_addr $I10, rxcap_353_fail
    rx349_cur."!mark_push"(0, rx349_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx349_pos, rx349_eos, rx349_fail
    sub $I10, rx349_pos, rx349_off
    substr $S10, rx349_tgt, $I10, 1
    index $I11, "fF", $S10
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
    rx349_cur."!cursor_pass"(rx349_pos, "backslash:sym<f>")
    rx349_cur."!cursor_debug"("PASS  ", "backslash:sym<f>", " at pos=", rx349_pos)
    .return (rx349_cur)
  rx349_restart:
.annotate 'line', 3
    rx349_cur."!cursor_debug"("NEXT ", "backslash:sym<f>")
  rx349_fail:
    (rx349_rep, rx349_pos, $I10, $P10) = rx349_cur."!mark_fail"(0)
    lt rx349_pos, -1, rx349_done
    eq rx349_pos, -1, rx349_fail
    jump $I10
  rx349_done:
    rx349_cur."!cursor_fail"()
    rx349_cur."!cursor_debug"("FAIL  ", "backslash:sym<f>")
    .return (rx349_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<f>"  :subid("102_1280467470.54449") :method
.annotate 'line', 3
    new $P351, "ResizablePMCArray"
    push $P351, "F"
    push $P351, "f"
    .return ($P351)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<h>"  :subid("103_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx355_tgt
    .local int rx355_pos
    .local int rx355_off
    .local int rx355_eos
    .local int rx355_rep
    .local pmc rx355_cur
    (rx355_cur, rx355_pos, rx355_tgt, $I10) = self."!cursor_start"()
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
    eq $I10, 1, rx355_restart
    rx355_cur."!cursor_debug"("START ", "backslash:sym<h>")
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
.annotate 'line', 127
  # rx subcapture "sym"
    set_addr $I10, rxcap_359_fail
    rx355_cur."!mark_push"(0, rx355_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx355_pos, rx355_eos, rx355_fail
    sub $I10, rx355_pos, rx355_off
    substr $S10, rx355_tgt, $I10, 1
    index $I11, "hH", $S10
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
    rx355_cur."!cursor_pass"(rx355_pos, "backslash:sym<h>")
    rx355_cur."!cursor_debug"("PASS  ", "backslash:sym<h>", " at pos=", rx355_pos)
    .return (rx355_cur)
  rx355_restart:
.annotate 'line', 3
    rx355_cur."!cursor_debug"("NEXT ", "backslash:sym<h>")
  rx355_fail:
    (rx355_rep, rx355_pos, $I10, $P10) = rx355_cur."!mark_fail"(0)
    lt rx355_pos, -1, rx355_done
    eq rx355_pos, -1, rx355_fail
    jump $I10
  rx355_done:
    rx355_cur."!cursor_fail"()
    rx355_cur."!cursor_debug"("FAIL  ", "backslash:sym<h>")
    .return (rx355_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<h>"  :subid("104_1280467470.54449") :method
.annotate 'line', 3
    new $P357, "ResizablePMCArray"
    push $P357, "H"
    push $P357, "h"
    .return ($P357)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<r>"  :subid("105_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx361_tgt
    .local int rx361_pos
    .local int rx361_off
    .local int rx361_eos
    .local int rx361_rep
    .local pmc rx361_cur
    (rx361_cur, rx361_pos, rx361_tgt, $I10) = self."!cursor_start"()
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
    eq $I10, 1, rx361_restart
    rx361_cur."!cursor_debug"("START ", "backslash:sym<r>")
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
.annotate 'line', 128
  # rx subcapture "sym"
    set_addr $I10, rxcap_365_fail
    rx361_cur."!mark_push"(0, rx361_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx361_pos, rx361_eos, rx361_fail
    sub $I10, rx361_pos, rx361_off
    substr $S10, rx361_tgt, $I10, 1
    index $I11, "rR", $S10
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
    rx361_cur."!cursor_pass"(rx361_pos, "backslash:sym<r>")
    rx361_cur."!cursor_debug"("PASS  ", "backslash:sym<r>", " at pos=", rx361_pos)
    .return (rx361_cur)
  rx361_restart:
.annotate 'line', 3
    rx361_cur."!cursor_debug"("NEXT ", "backslash:sym<r>")
  rx361_fail:
    (rx361_rep, rx361_pos, $I10, $P10) = rx361_cur."!mark_fail"(0)
    lt rx361_pos, -1, rx361_done
    eq rx361_pos, -1, rx361_fail
    jump $I10
  rx361_done:
    rx361_cur."!cursor_fail"()
    rx361_cur."!cursor_debug"("FAIL  ", "backslash:sym<r>")
    .return (rx361_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<r>"  :subid("106_1280467470.54449") :method
.annotate 'line', 3
    new $P363, "ResizablePMCArray"
    push $P363, "R"
    push $P363, "r"
    .return ($P363)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<t>"  :subid("107_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx367_tgt
    .local int rx367_pos
    .local int rx367_off
    .local int rx367_eos
    .local int rx367_rep
    .local pmc rx367_cur
    (rx367_cur, rx367_pos, rx367_tgt, $I10) = self."!cursor_start"()
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
    eq $I10, 1, rx367_restart
    rx367_cur."!cursor_debug"("START ", "backslash:sym<t>")
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
.annotate 'line', 129
  # rx subcapture "sym"
    set_addr $I10, rxcap_371_fail
    rx367_cur."!mark_push"(0, rx367_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx367_pos, rx367_eos, rx367_fail
    sub $I10, rx367_pos, rx367_off
    substr $S10, rx367_tgt, $I10, 1
    index $I11, "tT", $S10
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
    rx367_cur."!cursor_pass"(rx367_pos, "backslash:sym<t>")
    rx367_cur."!cursor_debug"("PASS  ", "backslash:sym<t>", " at pos=", rx367_pos)
    .return (rx367_cur)
  rx367_restart:
.annotate 'line', 3
    rx367_cur."!cursor_debug"("NEXT ", "backslash:sym<t>")
  rx367_fail:
    (rx367_rep, rx367_pos, $I10, $P10) = rx367_cur."!mark_fail"(0)
    lt rx367_pos, -1, rx367_done
    eq rx367_pos, -1, rx367_fail
    jump $I10
  rx367_done:
    rx367_cur."!cursor_fail"()
    rx367_cur."!cursor_debug"("FAIL  ", "backslash:sym<t>")
    .return (rx367_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<t>"  :subid("108_1280467470.54449") :method
.annotate 'line', 3
    new $P369, "ResizablePMCArray"
    push $P369, "T"
    push $P369, "t"
    .return ($P369)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<v>"  :subid("109_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx373_tgt
    .local int rx373_pos
    .local int rx373_off
    .local int rx373_eos
    .local int rx373_rep
    .local pmc rx373_cur
    (rx373_cur, rx373_pos, rx373_tgt, $I10) = self."!cursor_start"()
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
    eq $I10, 1, rx373_restart
    rx373_cur."!cursor_debug"("START ", "backslash:sym<v>")
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
.annotate 'line', 130
  # rx subcapture "sym"
    set_addr $I10, rxcap_377_fail
    rx373_cur."!mark_push"(0, rx373_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx373_pos, rx373_eos, rx373_fail
    sub $I10, rx373_pos, rx373_off
    substr $S10, rx373_tgt, $I10, 1
    index $I11, "vV", $S10
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
    rx373_cur."!cursor_pass"(rx373_pos, "backslash:sym<v>")
    rx373_cur."!cursor_debug"("PASS  ", "backslash:sym<v>", " at pos=", rx373_pos)
    .return (rx373_cur)
  rx373_restart:
.annotate 'line', 3
    rx373_cur."!cursor_debug"("NEXT ", "backslash:sym<v>")
  rx373_fail:
    (rx373_rep, rx373_pos, $I10, $P10) = rx373_cur."!mark_fail"(0)
    lt rx373_pos, -1, rx373_done
    eq rx373_pos, -1, rx373_fail
    jump $I10
  rx373_done:
    rx373_cur."!cursor_fail"()
    rx373_cur."!cursor_debug"("FAIL  ", "backslash:sym<v>")
    .return (rx373_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<v>"  :subid("110_1280467470.54449") :method
.annotate 'line', 3
    new $P375, "ResizablePMCArray"
    push $P375, "V"
    push $P375, "v"
    .return ($P375)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<o>"  :subid("111_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx379_tgt
    .local int rx379_pos
    .local int rx379_off
    .local int rx379_eos
    .local int rx379_rep
    .local pmc rx379_cur
    (rx379_cur, rx379_pos, rx379_tgt, $I10) = self."!cursor_start"()
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
    eq $I10, 1, rx379_restart
    rx379_cur."!cursor_debug"("START ", "backslash:sym<o>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan386_done
    goto rxscan386_scan
  rxscan386_loop:
    ($P10) = rx379_cur."from"()
    inc $P10
    set rx379_pos, $P10
    ge rx379_pos, rx379_eos, rxscan386_done
  rxscan386_scan:
    set_addr $I10, rxscan386_loop
    rx379_cur."!mark_push"(0, rx379_pos, $I10)
  rxscan386_done:
.annotate 'line', 131
  # rx subcapture "sym"
    set_addr $I10, rxcap_387_fail
    rx379_cur."!mark_push"(0, rx379_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx379_pos, rx379_eos, rx379_fail
    sub $I10, rx379_pos, rx379_off
    substr $S10, rx379_tgt, $I10, 1
    index $I11, "oO", $S10
    lt $I11, 0, rx379_fail
    inc rx379_pos
    set_addr $I10, rxcap_387_fail
    ($I12, $I11) = rx379_cur."!mark_peek"($I10)
    rx379_cur."!cursor_pos"($I11)
    ($P10) = rx379_cur."!cursor_start"()
    $P10."!cursor_pass"(rx379_pos, "")
    rx379_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_387_done
  rxcap_387_fail:
    goto rx379_fail
  rxcap_387_done:
  alt388_0:
    set_addr $I10, alt388_1
    rx379_cur."!mark_push"(0, rx379_pos, $I10)
  # rx subrule "octint" subtype=capture negate=
    rx379_cur."!cursor_pos"(rx379_pos)
    $P10 = rx379_cur."octint"()
    unless $P10, rx379_fail
    rx379_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octint")
    rx379_pos = $P10."pos"()
    goto alt388_end
  alt388_1:
  # rx literal  "["
    add $I11, rx379_pos, 1
    gt $I11, rx379_eos, rx379_fail
    sub $I11, rx379_pos, rx379_off
    substr $S10, rx379_tgt, $I11, 1
    ne $S10, "[", rx379_fail
    add rx379_pos, 1
  # rx subrule "octints" subtype=capture negate=
    rx379_cur."!cursor_pos"(rx379_pos)
    $P10 = rx379_cur."octints"()
    unless $P10, rx379_fail
    rx379_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octints")
    rx379_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx379_pos, 1
    gt $I11, rx379_eos, rx379_fail
    sub $I11, rx379_pos, rx379_off
    substr $S10, rx379_tgt, $I11, 1
    ne $S10, "]", rx379_fail
    add rx379_pos, 1
  alt388_end:
  # rx pass
    rx379_cur."!cursor_pass"(rx379_pos, "backslash:sym<o>")
    rx379_cur."!cursor_debug"("PASS  ", "backslash:sym<o>", " at pos=", rx379_pos)
    .return (rx379_cur)
  rx379_restart:
.annotate 'line', 3
    rx379_cur."!cursor_debug"("NEXT ", "backslash:sym<o>")
  rx379_fail:
    (rx379_rep, rx379_pos, $I10, $P10) = rx379_cur."!mark_fail"(0)
    lt rx379_pos, -1, rx379_done
    eq rx379_pos, -1, rx379_fail
    jump $I10
  rx379_done:
    rx379_cur."!cursor_fail"()
    rx379_cur."!cursor_debug"("FAIL  ", "backslash:sym<o>")
    .return (rx379_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<o>"  :subid("112_1280467470.54449") :method
.annotate 'line', 3
    $P381 = self."!PREFIX__!subrule"("octints", "O[")
    $P382 = self."!PREFIX__!subrule"("octint", "O")
    $P383 = self."!PREFIX__!subrule"("octints", "o[")
    $P384 = self."!PREFIX__!subrule"("octint", "o")
    new $P385, "ResizablePMCArray"
    push $P385, $P381
    push $P385, $P382
    push $P385, $P383
    push $P385, $P384
    .return ($P385)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<x>"  :subid("113_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx390_tgt
    .local int rx390_pos
    .local int rx390_off
    .local int rx390_eos
    .local int rx390_rep
    .local pmc rx390_cur
    (rx390_cur, rx390_pos, rx390_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx390_cur
    .local pmc match
    .lex "$/", match
    length rx390_eos, rx390_tgt
    gt rx390_pos, rx390_eos, rx390_done
    set rx390_off, 0
    lt rx390_pos, 2, rx390_start
    sub rx390_off, rx390_pos, 1
    substr rx390_tgt, rx390_tgt, rx390_off
  rx390_start:
    eq $I10, 1, rx390_restart
    rx390_cur."!cursor_debug"("START ", "backslash:sym<x>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan397_done
    goto rxscan397_scan
  rxscan397_loop:
    ($P10) = rx390_cur."from"()
    inc $P10
    set rx390_pos, $P10
    ge rx390_pos, rx390_eos, rxscan397_done
  rxscan397_scan:
    set_addr $I10, rxscan397_loop
    rx390_cur."!mark_push"(0, rx390_pos, $I10)
  rxscan397_done:
.annotate 'line', 132
  # rx subcapture "sym"
    set_addr $I10, rxcap_398_fail
    rx390_cur."!mark_push"(0, rx390_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx390_pos, rx390_eos, rx390_fail
    sub $I10, rx390_pos, rx390_off
    substr $S10, rx390_tgt, $I10, 1
    index $I11, "xX", $S10
    lt $I11, 0, rx390_fail
    inc rx390_pos
    set_addr $I10, rxcap_398_fail
    ($I12, $I11) = rx390_cur."!mark_peek"($I10)
    rx390_cur."!cursor_pos"($I11)
    ($P10) = rx390_cur."!cursor_start"()
    $P10."!cursor_pass"(rx390_pos, "")
    rx390_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_398_done
  rxcap_398_fail:
    goto rx390_fail
  rxcap_398_done:
  alt399_0:
    set_addr $I10, alt399_1
    rx390_cur."!mark_push"(0, rx390_pos, $I10)
  # rx subrule "hexint" subtype=capture negate=
    rx390_cur."!cursor_pos"(rx390_pos)
    $P10 = rx390_cur."hexint"()
    unless $P10, rx390_fail
    rx390_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexint")
    rx390_pos = $P10."pos"()
    goto alt399_end
  alt399_1:
  # rx literal  "["
    add $I11, rx390_pos, 1
    gt $I11, rx390_eos, rx390_fail
    sub $I11, rx390_pos, rx390_off
    substr $S10, rx390_tgt, $I11, 1
    ne $S10, "[", rx390_fail
    add rx390_pos, 1
  # rx subrule "hexints" subtype=capture negate=
    rx390_cur."!cursor_pos"(rx390_pos)
    $P10 = rx390_cur."hexints"()
    unless $P10, rx390_fail
    rx390_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexints")
    rx390_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx390_pos, 1
    gt $I11, rx390_eos, rx390_fail
    sub $I11, rx390_pos, rx390_off
    substr $S10, rx390_tgt, $I11, 1
    ne $S10, "]", rx390_fail
    add rx390_pos, 1
  alt399_end:
  # rx pass
    rx390_cur."!cursor_pass"(rx390_pos, "backslash:sym<x>")
    rx390_cur."!cursor_debug"("PASS  ", "backslash:sym<x>", " at pos=", rx390_pos)
    .return (rx390_cur)
  rx390_restart:
.annotate 'line', 3
    rx390_cur."!cursor_debug"("NEXT ", "backslash:sym<x>")
  rx390_fail:
    (rx390_rep, rx390_pos, $I10, $P10) = rx390_cur."!mark_fail"(0)
    lt rx390_pos, -1, rx390_done
    eq rx390_pos, -1, rx390_fail
    jump $I10
  rx390_done:
    rx390_cur."!cursor_fail"()
    rx390_cur."!cursor_debug"("FAIL  ", "backslash:sym<x>")
    .return (rx390_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<x>"  :subid("114_1280467470.54449") :method
.annotate 'line', 3
    $P392 = self."!PREFIX__!subrule"("hexints", "X[")
    $P393 = self."!PREFIX__!subrule"("hexint", "X")
    $P394 = self."!PREFIX__!subrule"("hexints", "x[")
    $P395 = self."!PREFIX__!subrule"("hexint", "x")
    new $P396, "ResizablePMCArray"
    push $P396, $P392
    push $P396, $P393
    push $P396, $P394
    push $P396, $P395
    .return ($P396)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<c>"  :subid("115_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx401_tgt
    .local int rx401_pos
    .local int rx401_off
    .local int rx401_eos
    .local int rx401_rep
    .local pmc rx401_cur
    (rx401_cur, rx401_pos, rx401_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx401_cur
    .local pmc match
    .lex "$/", match
    length rx401_eos, rx401_tgt
    gt rx401_pos, rx401_eos, rx401_done
    set rx401_off, 0
    lt rx401_pos, 2, rx401_start
    sub rx401_off, rx401_pos, 1
    substr rx401_tgt, rx401_tgt, rx401_off
  rx401_start:
    eq $I10, 1, rx401_restart
    rx401_cur."!cursor_debug"("START ", "backslash:sym<c>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan406_done
    goto rxscan406_scan
  rxscan406_loop:
    ($P10) = rx401_cur."from"()
    inc $P10
    set rx401_pos, $P10
    ge rx401_pos, rx401_eos, rxscan406_done
  rxscan406_scan:
    set_addr $I10, rxscan406_loop
    rx401_cur."!mark_push"(0, rx401_pos, $I10)
  rxscan406_done:
.annotate 'line', 133
  # rx subcapture "sym"
    set_addr $I10, rxcap_407_fail
    rx401_cur."!mark_push"(0, rx401_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx401_pos, rx401_eos, rx401_fail
    sub $I10, rx401_pos, rx401_off
    substr $S10, rx401_tgt, $I10, 1
    index $I11, "cC", $S10
    lt $I11, 0, rx401_fail
    inc rx401_pos
    set_addr $I10, rxcap_407_fail
    ($I12, $I11) = rx401_cur."!mark_peek"($I10)
    rx401_cur."!cursor_pos"($I11)
    ($P10) = rx401_cur."!cursor_start"()
    $P10."!cursor_pass"(rx401_pos, "")
    rx401_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_407_done
  rxcap_407_fail:
    goto rx401_fail
  rxcap_407_done:
  # rx subrule "charspec" subtype=capture negate=
    rx401_cur."!cursor_pos"(rx401_pos)
    $P10 = rx401_cur."charspec"()
    unless $P10, rx401_fail
    rx401_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charspec")
    rx401_pos = $P10."pos"()
  # rx pass
    rx401_cur."!cursor_pass"(rx401_pos, "backslash:sym<c>")
    rx401_cur."!cursor_debug"("PASS  ", "backslash:sym<c>", " at pos=", rx401_pos)
    .return (rx401_cur)
  rx401_restart:
.annotate 'line', 3
    rx401_cur."!cursor_debug"("NEXT ", "backslash:sym<c>")
  rx401_fail:
    (rx401_rep, rx401_pos, $I10, $P10) = rx401_cur."!mark_fail"(0)
    lt rx401_pos, -1, rx401_done
    eq rx401_pos, -1, rx401_fail
    jump $I10
  rx401_done:
    rx401_cur."!cursor_fail"()
    rx401_cur."!cursor_debug"("FAIL  ", "backslash:sym<c>")
    .return (rx401_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<c>"  :subid("116_1280467470.54449") :method
.annotate 'line', 3
    $P403 = self."!PREFIX__!subrule"("charspec", "C")
    $P404 = self."!PREFIX__!subrule"("charspec", "c")
    new $P405, "ResizablePMCArray"
    push $P405, $P403
    push $P405, $P404
    .return ($P405)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<A>"  :subid("117_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx409_tgt
    .local int rx409_pos
    .local int rx409_off
    .local int rx409_eos
    .local int rx409_rep
    .local pmc rx409_cur
    (rx409_cur, rx409_pos, rx409_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx409_cur
    .local pmc match
    .lex "$/", match
    length rx409_eos, rx409_tgt
    gt rx409_pos, rx409_eos, rx409_done
    set rx409_off, 0
    lt rx409_pos, 2, rx409_start
    sub rx409_off, rx409_pos, 1
    substr rx409_tgt, rx409_tgt, rx409_off
  rx409_start:
    eq $I10, 1, rx409_restart
    rx409_cur."!cursor_debug"("START ", "backslash:sym<A>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan413_done
    goto rxscan413_scan
  rxscan413_loop:
    ($P10) = rx409_cur."from"()
    inc $P10
    set rx409_pos, $P10
    ge rx409_pos, rx409_eos, rxscan413_done
  rxscan413_scan:
    set_addr $I10, rxscan413_loop
    rx409_cur."!mark_push"(0, rx409_pos, $I10)
  rxscan413_done:
.annotate 'line', 134
  # rx literal  "A"
    add $I11, rx409_pos, 1
    gt $I11, rx409_eos, rx409_fail
    sub $I11, rx409_pos, rx409_off
    substr $S10, rx409_tgt, $I11, 1
    ne $S10, "A", rx409_fail
    add rx409_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx409_cur."!cursor_pos"(rx409_pos)
    $P10 = rx409_cur."obs"("\\A as beginning-of-string matcher", "^")
    unless $P10, rx409_fail
    rx409_pos = $P10."pos"()
  # rx pass
    rx409_cur."!cursor_pass"(rx409_pos, "backslash:sym<A>")
    rx409_cur."!cursor_debug"("PASS  ", "backslash:sym<A>", " at pos=", rx409_pos)
    .return (rx409_cur)
  rx409_restart:
.annotate 'line', 3
    rx409_cur."!cursor_debug"("NEXT ", "backslash:sym<A>")
  rx409_fail:
    (rx409_rep, rx409_pos, $I10, $P10) = rx409_cur."!mark_fail"(0)
    lt rx409_pos, -1, rx409_done
    eq rx409_pos, -1, rx409_fail
    jump $I10
  rx409_done:
    rx409_cur."!cursor_fail"()
    rx409_cur."!cursor_debug"("FAIL  ", "backslash:sym<A>")
    .return (rx409_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<A>"  :subid("118_1280467470.54449") :method
.annotate 'line', 3
    $P411 = self."!PREFIX__!subrule"("obs", "A")
    new $P412, "ResizablePMCArray"
    push $P412, $P411
    .return ($P412)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<z>"  :subid("119_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx415_tgt
    .local int rx415_pos
    .local int rx415_off
    .local int rx415_eos
    .local int rx415_rep
    .local pmc rx415_cur
    (rx415_cur, rx415_pos, rx415_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx415_cur
    .local pmc match
    .lex "$/", match
    length rx415_eos, rx415_tgt
    gt rx415_pos, rx415_eos, rx415_done
    set rx415_off, 0
    lt rx415_pos, 2, rx415_start
    sub rx415_off, rx415_pos, 1
    substr rx415_tgt, rx415_tgt, rx415_off
  rx415_start:
    eq $I10, 1, rx415_restart
    rx415_cur."!cursor_debug"("START ", "backslash:sym<z>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan419_done
    goto rxscan419_scan
  rxscan419_loop:
    ($P10) = rx415_cur."from"()
    inc $P10
    set rx415_pos, $P10
    ge rx415_pos, rx415_eos, rxscan419_done
  rxscan419_scan:
    set_addr $I10, rxscan419_loop
    rx415_cur."!mark_push"(0, rx415_pos, $I10)
  rxscan419_done:
.annotate 'line', 135
  # rx literal  "z"
    add $I11, rx415_pos, 1
    gt $I11, rx415_eos, rx415_fail
    sub $I11, rx415_pos, rx415_off
    substr $S10, rx415_tgt, $I11, 1
    ne $S10, "z", rx415_fail
    add rx415_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx415_cur."!cursor_pos"(rx415_pos)
    $P10 = rx415_cur."obs"("\\z as end-of-string matcher", "$")
    unless $P10, rx415_fail
    rx415_pos = $P10."pos"()
  # rx pass
    rx415_cur."!cursor_pass"(rx415_pos, "backslash:sym<z>")
    rx415_cur."!cursor_debug"("PASS  ", "backslash:sym<z>", " at pos=", rx415_pos)
    .return (rx415_cur)
  rx415_restart:
.annotate 'line', 3
    rx415_cur."!cursor_debug"("NEXT ", "backslash:sym<z>")
  rx415_fail:
    (rx415_rep, rx415_pos, $I10, $P10) = rx415_cur."!mark_fail"(0)
    lt rx415_pos, -1, rx415_done
    eq rx415_pos, -1, rx415_fail
    jump $I10
  rx415_done:
    rx415_cur."!cursor_fail"()
    rx415_cur."!cursor_debug"("FAIL  ", "backslash:sym<z>")
    .return (rx415_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<z>"  :subid("120_1280467470.54449") :method
.annotate 'line', 3
    $P417 = self."!PREFIX__!subrule"("obs", "z")
    new $P418, "ResizablePMCArray"
    push $P418, $P417
    .return ($P418)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Z>"  :subid("121_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx421_tgt
    .local int rx421_pos
    .local int rx421_off
    .local int rx421_eos
    .local int rx421_rep
    .local pmc rx421_cur
    (rx421_cur, rx421_pos, rx421_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx421_cur
    .local pmc match
    .lex "$/", match
    length rx421_eos, rx421_tgt
    gt rx421_pos, rx421_eos, rx421_done
    set rx421_off, 0
    lt rx421_pos, 2, rx421_start
    sub rx421_off, rx421_pos, 1
    substr rx421_tgt, rx421_tgt, rx421_off
  rx421_start:
    eq $I10, 1, rx421_restart
    rx421_cur."!cursor_debug"("START ", "backslash:sym<Z>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan425_done
    goto rxscan425_scan
  rxscan425_loop:
    ($P10) = rx421_cur."from"()
    inc $P10
    set rx421_pos, $P10
    ge rx421_pos, rx421_eos, rxscan425_done
  rxscan425_scan:
    set_addr $I10, rxscan425_loop
    rx421_cur."!mark_push"(0, rx421_pos, $I10)
  rxscan425_done:
.annotate 'line', 136
  # rx literal  "Z"
    add $I11, rx421_pos, 1
    gt $I11, rx421_eos, rx421_fail
    sub $I11, rx421_pos, rx421_off
    substr $S10, rx421_tgt, $I11, 1
    ne $S10, "Z", rx421_fail
    add rx421_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx421_cur."!cursor_pos"(rx421_pos)
    $P10 = rx421_cur."obs"("\\Z as end-of-string matcher", "\\n?$")
    unless $P10, rx421_fail
    rx421_pos = $P10."pos"()
  # rx pass
    rx421_cur."!cursor_pass"(rx421_pos, "backslash:sym<Z>")
    rx421_cur."!cursor_debug"("PASS  ", "backslash:sym<Z>", " at pos=", rx421_pos)
    .return (rx421_cur)
  rx421_restart:
.annotate 'line', 3
    rx421_cur."!cursor_debug"("NEXT ", "backslash:sym<Z>")
  rx421_fail:
    (rx421_rep, rx421_pos, $I10, $P10) = rx421_cur."!mark_fail"(0)
    lt rx421_pos, -1, rx421_done
    eq rx421_pos, -1, rx421_fail
    jump $I10
  rx421_done:
    rx421_cur."!cursor_fail"()
    rx421_cur."!cursor_debug"("FAIL  ", "backslash:sym<Z>")
    .return (rx421_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<Z>"  :subid("122_1280467470.54449") :method
.annotate 'line', 3
    $P423 = self."!PREFIX__!subrule"("obs", "Z")
    new $P424, "ResizablePMCArray"
    push $P424, $P423
    .return ($P424)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Q>"  :subid("123_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx427_tgt
    .local int rx427_pos
    .local int rx427_off
    .local int rx427_eos
    .local int rx427_rep
    .local pmc rx427_cur
    (rx427_cur, rx427_pos, rx427_tgt, $I10) = self."!cursor_start"()
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
    eq $I10, 1, rx427_restart
    rx427_cur."!cursor_debug"("START ", "backslash:sym<Q>")
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
.annotate 'line', 137
  # rx literal  "Q"
    add $I11, rx427_pos, 1
    gt $I11, rx427_eos, rx427_fail
    sub $I11, rx427_pos, rx427_off
    substr $S10, rx427_tgt, $I11, 1
    ne $S10, "Q", rx427_fail
    add rx427_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx427_cur."!cursor_pos"(rx427_pos)
    $P10 = rx427_cur."obs"("\\Q as quotemeta", "quotes or literal variable match")
    unless $P10, rx427_fail
    rx427_pos = $P10."pos"()
  # rx pass
    rx427_cur."!cursor_pass"(rx427_pos, "backslash:sym<Q>")
    rx427_cur."!cursor_debug"("PASS  ", "backslash:sym<Q>", " at pos=", rx427_pos)
    .return (rx427_cur)
  rx427_restart:
.annotate 'line', 3
    rx427_cur."!cursor_debug"("NEXT ", "backslash:sym<Q>")
  rx427_fail:
    (rx427_rep, rx427_pos, $I10, $P10) = rx427_cur."!mark_fail"(0)
    lt rx427_pos, -1, rx427_done
    eq rx427_pos, -1, rx427_fail
    jump $I10
  rx427_done:
    rx427_cur."!cursor_fail"()
    rx427_cur."!cursor_debug"("FAIL  ", "backslash:sym<Q>")
    .return (rx427_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<Q>"  :subid("124_1280467470.54449") :method
.annotate 'line', 3
    $P429 = self."!PREFIX__!subrule"("obs", "Q")
    new $P430, "ResizablePMCArray"
    push $P430, $P429
    .return ($P430)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<misc>"  :subid("125_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx433_tgt
    .local int rx433_pos
    .local int rx433_off
    .local int rx433_eos
    .local int rx433_rep
    .local pmc rx433_cur
    (rx433_cur, rx433_pos, rx433_tgt, $I10) = self."!cursor_start"()
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
    eq $I10, 1, rx433_restart
    rx433_cur."!cursor_debug"("START ", "backslash:sym<misc>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan436_done
    goto rxscan436_scan
  rxscan436_loop:
    ($P10) = rx433_cur."from"()
    inc $P10
    set rx433_pos, $P10
    ge rx433_pos, rx433_eos, rxscan436_done
  rxscan436_scan:
    set_addr $I10, rxscan436_loop
    rx433_cur."!mark_push"(0, rx433_pos, $I10)
  rxscan436_done:
.annotate 'line', 138
  # rx charclass W
    ge rx433_pos, rx433_eos, rx433_fail
    sub $I10, rx433_pos, rx433_off
    is_cclass $I11, 8192, rx433_tgt, $I10
    if $I11, rx433_fail
    inc rx433_pos
  # rx pass
    rx433_cur."!cursor_pass"(rx433_pos, "backslash:sym<misc>")
    rx433_cur."!cursor_debug"("PASS  ", "backslash:sym<misc>", " at pos=", rx433_pos)
    .return (rx433_cur)
  rx433_restart:
.annotate 'line', 3
    rx433_cur."!cursor_debug"("NEXT ", "backslash:sym<misc>")
  rx433_fail:
    (rx433_rep, rx433_pos, $I10, $P10) = rx433_cur."!mark_fail"(0)
    lt rx433_pos, -1, rx433_done
    eq rx433_pos, -1, rx433_fail
    jump $I10
  rx433_done:
    rx433_cur."!cursor_fail"()
    rx433_cur."!cursor_debug"("FAIL  ", "backslash:sym<misc>")
    .return (rx433_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<misc>"  :subid("126_1280467470.54449") :method
.annotate 'line', 3
    new $P435, "ResizablePMCArray"
    push $P435, ""
    .return ($P435)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion"  :subid("127_1280467470.54449") :method
.annotate 'line', 140
    $P438 = self."!protoregex"("assertion")
    .return ($P438)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion"  :subid("128_1280467470.54449") :method
.annotate 'line', 140
    $P440 = self."!PREFIX__!protoregex"("assertion")
    .return ($P440)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<?>"  :subid("129_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .const 'Sub' $P449 = "131_1280467470.54449" 
    capture_lex $P449
    .local string rx442_tgt
    .local int rx442_pos
    .local int rx442_off
    .local int rx442_eos
    .local int rx442_rep
    .local pmc rx442_cur
    (rx442_cur, rx442_pos, rx442_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx442_cur
    .local pmc match
    .lex "$/", match
    length rx442_eos, rx442_tgt
    gt rx442_pos, rx442_eos, rx442_done
    set rx442_off, 0
    lt rx442_pos, 2, rx442_start
    sub rx442_off, rx442_pos, 1
    substr rx442_tgt, rx442_tgt, rx442_off
  rx442_start:
    eq $I10, 1, rx442_restart
    rx442_cur."!cursor_debug"("START ", "assertion:sym<?>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan446_done
    goto rxscan446_scan
  rxscan446_loop:
    ($P10) = rx442_cur."from"()
    inc $P10
    set rx442_pos, $P10
    ge rx442_pos, rx442_eos, rxscan446_done
  rxscan446_scan:
    set_addr $I10, rxscan446_loop
    rx442_cur."!mark_push"(0, rx442_pos, $I10)
  rxscan446_done:
.annotate 'line', 142
  # rx literal  "?"
    add $I11, rx442_pos, 1
    gt $I11, rx442_eos, rx442_fail
    sub $I11, rx442_pos, rx442_off
    substr $S10, rx442_tgt, $I11, 1
    ne $S10, "?", rx442_fail
    add rx442_pos, 1
  alt447_0:
    set_addr $I10, alt447_1
    rx442_cur."!mark_push"(0, rx442_pos, $I10)
  # rx subrule "before" subtype=zerowidth negate=
    rx442_cur."!cursor_pos"(rx442_pos)
    .const 'Sub' $P449 = "131_1280467470.54449" 
    capture_lex $P449
    $P10 = rx442_cur."before"($P449)
    unless $P10, rx442_fail
    goto alt447_end
  alt447_1:
  # rx subrule "assertion" subtype=capture negate=
    rx442_cur."!cursor_pos"(rx442_pos)
    $P10 = rx442_cur."assertion"()
    unless $P10, rx442_fail
    rx442_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx442_pos = $P10."pos"()
  alt447_end:
  # rx pass
    rx442_cur."!cursor_pass"(rx442_pos, "assertion:sym<?>")
    rx442_cur."!cursor_debug"("PASS  ", "assertion:sym<?>", " at pos=", rx442_pos)
    .return (rx442_cur)
  rx442_restart:
.annotate 'line', 3
    rx442_cur."!cursor_debug"("NEXT ", "assertion:sym<?>")
  rx442_fail:
    (rx442_rep, rx442_pos, $I10, $P10) = rx442_cur."!mark_fail"(0)
    lt rx442_pos, -1, rx442_done
    eq rx442_pos, -1, rx442_fail
    jump $I10
  rx442_done:
    rx442_cur."!cursor_fail"()
    rx442_cur."!cursor_debug"("FAIL  ", "assertion:sym<?>")
    .return (rx442_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<?>"  :subid("130_1280467470.54449") :method
.annotate 'line', 3
    $P444 = self."!PREFIX__!subrule"("assertion", "?")
    new $P445, "ResizablePMCArray"
    push $P445, $P444
    push $P445, "?"
    .return ($P445)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block448"  :anon :subid("131_1280467470.54449") :method :outer("129_1280467470.54449")
.annotate 'line', 142
    .local string rx450_tgt
    .local int rx450_pos
    .local int rx450_off
    .local int rx450_eos
    .local int rx450_rep
    .local pmc rx450_cur
    (rx450_cur, rx450_pos, rx450_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx450_cur
    .local pmc match
    .lex "$/", match
    length rx450_eos, rx450_tgt
    gt rx450_pos, rx450_eos, rx450_done
    set rx450_off, 0
    lt rx450_pos, 2, rx450_start
    sub rx450_off, rx450_pos, 1
    substr rx450_tgt, rx450_tgt, rx450_off
  rx450_start:
    eq $I10, 1, rx450_restart
    rx450_cur."!cursor_debug"("START ", "")
    $I10 = self.'from'()
    ne $I10, -1, rxscan451_done
    goto rxscan451_scan
  rxscan451_loop:
    ($P10) = rx450_cur."from"()
    inc $P10
    set rx450_pos, $P10
    ge rx450_pos, rx450_eos, rxscan451_done
  rxscan451_scan:
    set_addr $I10, rxscan451_loop
    rx450_cur."!mark_push"(0, rx450_pos, $I10)
  rxscan451_done:
  # rx literal  ">"
    add $I11, rx450_pos, 1
    gt $I11, rx450_eos, rx450_fail
    sub $I11, rx450_pos, rx450_off
    substr $S10, rx450_tgt, $I11, 1
    ne $S10, ">", rx450_fail
    add rx450_pos, 1
  # rx pass
    rx450_cur."!cursor_pass"(rx450_pos, "")
    rx450_cur."!cursor_debug"("PASS  ", "", " at pos=", rx450_pos)
    .return (rx450_cur)
  rx450_restart:
    rx450_cur."!cursor_debug"("NEXT ", "")
  rx450_fail:
    (rx450_rep, rx450_pos, $I10, $P10) = rx450_cur."!mark_fail"(0)
    lt rx450_pos, -1, rx450_done
    eq rx450_pos, -1, rx450_fail
    jump $I10
  rx450_done:
    rx450_cur."!cursor_fail"()
    rx450_cur."!cursor_debug"("FAIL  ", "")
    .return (rx450_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<!>"  :subid("132_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .const 'Sub' $P460 = "134_1280467470.54449" 
    capture_lex $P460
    .local string rx453_tgt
    .local int rx453_pos
    .local int rx453_off
    .local int rx453_eos
    .local int rx453_rep
    .local pmc rx453_cur
    (rx453_cur, rx453_pos, rx453_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx453_cur
    .local pmc match
    .lex "$/", match
    length rx453_eos, rx453_tgt
    gt rx453_pos, rx453_eos, rx453_done
    set rx453_off, 0
    lt rx453_pos, 2, rx453_start
    sub rx453_off, rx453_pos, 1
    substr rx453_tgt, rx453_tgt, rx453_off
  rx453_start:
    eq $I10, 1, rx453_restart
    rx453_cur."!cursor_debug"("START ", "assertion:sym<!>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan457_done
    goto rxscan457_scan
  rxscan457_loop:
    ($P10) = rx453_cur."from"()
    inc $P10
    set rx453_pos, $P10
    ge rx453_pos, rx453_eos, rxscan457_done
  rxscan457_scan:
    set_addr $I10, rxscan457_loop
    rx453_cur."!mark_push"(0, rx453_pos, $I10)
  rxscan457_done:
.annotate 'line', 143
  # rx literal  "!"
    add $I11, rx453_pos, 1
    gt $I11, rx453_eos, rx453_fail
    sub $I11, rx453_pos, rx453_off
    substr $S10, rx453_tgt, $I11, 1
    ne $S10, "!", rx453_fail
    add rx453_pos, 1
  alt458_0:
    set_addr $I10, alt458_1
    rx453_cur."!mark_push"(0, rx453_pos, $I10)
  # rx subrule "before" subtype=zerowidth negate=
    rx453_cur."!cursor_pos"(rx453_pos)
    .const 'Sub' $P460 = "134_1280467470.54449" 
    capture_lex $P460
    $P10 = rx453_cur."before"($P460)
    unless $P10, rx453_fail
    goto alt458_end
  alt458_1:
  # rx subrule "assertion" subtype=capture negate=
    rx453_cur."!cursor_pos"(rx453_pos)
    $P10 = rx453_cur."assertion"()
    unless $P10, rx453_fail
    rx453_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx453_pos = $P10."pos"()
  alt458_end:
  # rx pass
    rx453_cur."!cursor_pass"(rx453_pos, "assertion:sym<!>")
    rx453_cur."!cursor_debug"("PASS  ", "assertion:sym<!>", " at pos=", rx453_pos)
    .return (rx453_cur)
  rx453_restart:
.annotate 'line', 3
    rx453_cur."!cursor_debug"("NEXT ", "assertion:sym<!>")
  rx453_fail:
    (rx453_rep, rx453_pos, $I10, $P10) = rx453_cur."!mark_fail"(0)
    lt rx453_pos, -1, rx453_done
    eq rx453_pos, -1, rx453_fail
    jump $I10
  rx453_done:
    rx453_cur."!cursor_fail"()
    rx453_cur."!cursor_debug"("FAIL  ", "assertion:sym<!>")
    .return (rx453_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<!>"  :subid("133_1280467470.54449") :method
.annotate 'line', 3
    $P455 = self."!PREFIX__!subrule"("assertion", "!")
    new $P456, "ResizablePMCArray"
    push $P456, $P455
    push $P456, "!"
    .return ($P456)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block459"  :anon :subid("134_1280467470.54449") :method :outer("132_1280467470.54449")
.annotate 'line', 143
    .local string rx461_tgt
    .local int rx461_pos
    .local int rx461_off
    .local int rx461_eos
    .local int rx461_rep
    .local pmc rx461_cur
    (rx461_cur, rx461_pos, rx461_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx461_cur
    .local pmc match
    .lex "$/", match
    length rx461_eos, rx461_tgt
    gt rx461_pos, rx461_eos, rx461_done
    set rx461_off, 0
    lt rx461_pos, 2, rx461_start
    sub rx461_off, rx461_pos, 1
    substr rx461_tgt, rx461_tgt, rx461_off
  rx461_start:
    eq $I10, 1, rx461_restart
    rx461_cur."!cursor_debug"("START ", "")
    $I10 = self.'from'()
    ne $I10, -1, rxscan462_done
    goto rxscan462_scan
  rxscan462_loop:
    ($P10) = rx461_cur."from"()
    inc $P10
    set rx461_pos, $P10
    ge rx461_pos, rx461_eos, rxscan462_done
  rxscan462_scan:
    set_addr $I10, rxscan462_loop
    rx461_cur."!mark_push"(0, rx461_pos, $I10)
  rxscan462_done:
  # rx literal  ">"
    add $I11, rx461_pos, 1
    gt $I11, rx461_eos, rx461_fail
    sub $I11, rx461_pos, rx461_off
    substr $S10, rx461_tgt, $I11, 1
    ne $S10, ">", rx461_fail
    add rx461_pos, 1
  # rx pass
    rx461_cur."!cursor_pass"(rx461_pos, "")
    rx461_cur."!cursor_debug"("PASS  ", "", " at pos=", rx461_pos)
    .return (rx461_cur)
  rx461_restart:
    rx461_cur."!cursor_debug"("NEXT ", "")
  rx461_fail:
    (rx461_rep, rx461_pos, $I10, $P10) = rx461_cur."!mark_fail"(0)
    lt rx461_pos, -1, rx461_done
    eq rx461_pos, -1, rx461_fail
    jump $I10
  rx461_done:
    rx461_cur."!cursor_fail"()
    rx461_cur."!cursor_debug"("FAIL  ", "")
    .return (rx461_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<method>"  :subid("135_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx464_tgt
    .local int rx464_pos
    .local int rx464_off
    .local int rx464_eos
    .local int rx464_rep
    .local pmc rx464_cur
    (rx464_cur, rx464_pos, rx464_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx464_cur
    .local pmc match
    .lex "$/", match
    length rx464_eos, rx464_tgt
    gt rx464_pos, rx464_eos, rx464_done
    set rx464_off, 0
    lt rx464_pos, 2, rx464_start
    sub rx464_off, rx464_pos, 1
    substr rx464_tgt, rx464_tgt, rx464_off
  rx464_start:
    eq $I10, 1, rx464_restart
    rx464_cur."!cursor_debug"("START ", "assertion:sym<method>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan468_done
    goto rxscan468_scan
  rxscan468_loop:
    ($P10) = rx464_cur."from"()
    inc $P10
    set rx464_pos, $P10
    ge rx464_pos, rx464_eos, rxscan468_done
  rxscan468_scan:
    set_addr $I10, rxscan468_loop
    rx464_cur."!mark_push"(0, rx464_pos, $I10)
  rxscan468_done:
.annotate 'line', 146
  # rx literal  "."
    add $I11, rx464_pos, 1
    gt $I11, rx464_eos, rx464_fail
    sub $I11, rx464_pos, rx464_off
    substr $S10, rx464_tgt, $I11, 1
    ne $S10, ".", rx464_fail
    add rx464_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx464_cur."!cursor_pos"(rx464_pos)
    $P10 = rx464_cur."assertion"()
    unless $P10, rx464_fail
    rx464_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx464_pos = $P10."pos"()
.annotate 'line', 145
  # rx pass
    rx464_cur."!cursor_pass"(rx464_pos, "assertion:sym<method>")
    rx464_cur."!cursor_debug"("PASS  ", "assertion:sym<method>", " at pos=", rx464_pos)
    .return (rx464_cur)
  rx464_restart:
.annotate 'line', 3
    rx464_cur."!cursor_debug"("NEXT ", "assertion:sym<method>")
  rx464_fail:
    (rx464_rep, rx464_pos, $I10, $P10) = rx464_cur."!mark_fail"(0)
    lt rx464_pos, -1, rx464_done
    eq rx464_pos, -1, rx464_fail
    jump $I10
  rx464_done:
    rx464_cur."!cursor_fail"()
    rx464_cur."!cursor_debug"("FAIL  ", "assertion:sym<method>")
    .return (rx464_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<method>"  :subid("136_1280467470.54449") :method
.annotate 'line', 3
    $P466 = self."!PREFIX__!subrule"("assertion", ".")
    new $P467, "ResizablePMCArray"
    push $P467, $P466
    .return ($P467)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<name>"  :subid("137_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .const 'Sub' $P478 = "139_1280467470.54449" 
    capture_lex $P478
    .local string rx470_tgt
    .local int rx470_pos
    .local int rx470_off
    .local int rx470_eos
    .local int rx470_rep
    .local pmc rx470_cur
    (rx470_cur, rx470_pos, rx470_tgt, $I10) = self."!cursor_start"()
    rx470_cur."!cursor_caparray"("nibbler", "arglist", "assertion")
    .lex unicode:"$\x{a2}", rx470_cur
    .local pmc match
    .lex "$/", match
    length rx470_eos, rx470_tgt
    gt rx470_pos, rx470_eos, rx470_done
    set rx470_off, 0
    lt rx470_pos, 2, rx470_start
    sub rx470_off, rx470_pos, 1
    substr rx470_tgt, rx470_tgt, rx470_off
  rx470_start:
    eq $I10, 1, rx470_restart
    rx470_cur."!cursor_debug"("START ", "assertion:sym<name>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan474_done
    goto rxscan474_scan
  rxscan474_loop:
    ($P10) = rx470_cur."from"()
    inc $P10
    set rx470_pos, $P10
    ge rx470_pos, rx470_eos, rxscan474_done
  rxscan474_scan:
    set_addr $I10, rxscan474_loop
    rx470_cur."!mark_push"(0, rx470_pos, $I10)
  rxscan474_done:
.annotate 'line', 150
  # rx subrule "identifier" subtype=capture negate=
    rx470_cur."!cursor_pos"(rx470_pos)
    $P10 = rx470_cur."identifier"()
    unless $P10, rx470_fail
    rx470_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    rx470_pos = $P10."pos"()
.annotate 'line', 157
  # rx rxquantr475 ** 0..1
    set_addr $I10, rxquantr475_done
    rx470_cur."!mark_push"(0, rx470_pos, $I10)
  rxquantr475_loop:
  alt476_0:
.annotate 'line', 151
    set_addr $I10, alt476_1
    rx470_cur."!mark_push"(0, rx470_pos, $I10)
.annotate 'line', 152
  # rx subrule "before" subtype=zerowidth negate=
    rx470_cur."!cursor_pos"(rx470_pos)
    .const 'Sub' $P478 = "139_1280467470.54449" 
    capture_lex $P478
    $P10 = rx470_cur."before"($P478)
    unless $P10, rx470_fail
    goto alt476_end
  alt476_1:
    set_addr $I10, alt476_2
    rx470_cur."!mark_push"(0, rx470_pos, $I10)
.annotate 'line', 153
  # rx literal  "="
    add $I11, rx470_pos, 1
    gt $I11, rx470_eos, rx470_fail
    sub $I11, rx470_pos, rx470_off
    substr $S10, rx470_tgt, $I11, 1
    ne $S10, "=", rx470_fail
    add rx470_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx470_cur."!cursor_pos"(rx470_pos)
    $P10 = rx470_cur."assertion"()
    unless $P10, rx470_fail
    rx470_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx470_pos = $P10."pos"()
    goto alt476_end
  alt476_2:
    set_addr $I10, alt476_3
    rx470_cur."!mark_push"(0, rx470_pos, $I10)
.annotate 'line', 154
  # rx literal  ":"
    add $I11, rx470_pos, 1
    gt $I11, rx470_eos, rx470_fail
    sub $I11, rx470_pos, rx470_off
    substr $S10, rx470_tgt, $I11, 1
    ne $S10, ":", rx470_fail
    add rx470_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx470_cur."!cursor_pos"(rx470_pos)
    $P10 = rx470_cur."arglist"()
    unless $P10, rx470_fail
    rx470_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx470_pos = $P10."pos"()
    goto alt476_end
  alt476_3:
    set_addr $I10, alt476_4
    rx470_cur."!mark_push"(0, rx470_pos, $I10)
.annotate 'line', 155
  # rx literal  "("
    add $I11, rx470_pos, 1
    gt $I11, rx470_eos, rx470_fail
    sub $I11, rx470_pos, rx470_off
    substr $S10, rx470_tgt, $I11, 1
    ne $S10, "(", rx470_fail
    add rx470_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx470_cur."!cursor_pos"(rx470_pos)
    $P10 = rx470_cur."arglist"()
    unless $P10, rx470_fail
    rx470_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx470_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx470_pos, 1
    gt $I11, rx470_eos, rx470_fail
    sub $I11, rx470_pos, rx470_off
    substr $S10, rx470_tgt, $I11, 1
    ne $S10, ")", rx470_fail
    add rx470_pos, 1
    goto alt476_end
  alt476_4:
.annotate 'line', 156
  # rx subrule "normspace" subtype=method negate=
    rx470_cur."!cursor_pos"(rx470_pos)
    $P10 = rx470_cur."normspace"()
    unless $P10, rx470_fail
    rx470_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx470_cur."!cursor_pos"(rx470_pos)
    $P10 = rx470_cur."nibbler"()
    unless $P10, rx470_fail
    rx470_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx470_pos = $P10."pos"()
  alt476_end:
.annotate 'line', 157
    set_addr $I10, rxquantr475_done
    (rx470_rep) = rx470_cur."!mark_commit"($I10)
  rxquantr475_done:
.annotate 'line', 149
  # rx pass
    rx470_cur."!cursor_pass"(rx470_pos, "assertion:sym<name>")
    rx470_cur."!cursor_debug"("PASS  ", "assertion:sym<name>", " at pos=", rx470_pos)
    .return (rx470_cur)
  rx470_restart:
.annotate 'line', 3
    rx470_cur."!cursor_debug"("NEXT ", "assertion:sym<name>")
  rx470_fail:
    (rx470_rep, rx470_pos, $I10, $P10) = rx470_cur."!mark_fail"(0)
    lt rx470_pos, -1, rx470_done
    eq rx470_pos, -1, rx470_fail
    jump $I10
  rx470_done:
    rx470_cur."!cursor_fail"()
    rx470_cur."!cursor_debug"("FAIL  ", "assertion:sym<name>")
    .return (rx470_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<name>"  :subid("138_1280467470.54449") :method
.annotate 'line', 3
    $P472 = self."!PREFIX__!subrule"("identifier", "")
    new $P473, "ResizablePMCArray"
    push $P473, $P472
    .return ($P473)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block477"  :anon :subid("139_1280467470.54449") :method :outer("137_1280467470.54449")
.annotate 'line', 152
    .local string rx479_tgt
    .local int rx479_pos
    .local int rx479_off
    .local int rx479_eos
    .local int rx479_rep
    .local pmc rx479_cur
    (rx479_cur, rx479_pos, rx479_tgt, $I10) = self."!cursor_start"()
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
    eq $I10, 1, rx479_restart
    rx479_cur."!cursor_debug"("START ", "")
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
  rx479_restart:
    rx479_cur."!cursor_debug"("NEXT ", "")
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
.sub "assertion:sym<[>"  :subid("140_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .const 'Sub' $P487 = "142_1280467470.54449" 
    capture_lex $P487
    .local string rx482_tgt
    .local int rx482_pos
    .local int rx482_off
    .local int rx482_eos
    .local int rx482_rep
    .local pmc rx482_cur
    (rx482_cur, rx482_pos, rx482_tgt, $I10) = self."!cursor_start"()
    rx482_cur."!cursor_caparray"("cclass_elem")
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
    eq $I10, 1, rx482_restart
    rx482_cur."!cursor_debug"("START ", "assertion:sym<[>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan485_done
    goto rxscan485_scan
  rxscan485_loop:
    ($P10) = rx482_cur."from"()
    inc $P10
    set rx482_pos, $P10
    ge rx482_pos, rx482_eos, rxscan485_done
  rxscan485_scan:
    set_addr $I10, rxscan485_loop
    rx482_cur."!mark_push"(0, rx482_pos, $I10)
  rxscan485_done:
.annotate 'line', 160
  # rx subrule "before" subtype=zerowidth negate=
    rx482_cur."!cursor_pos"(rx482_pos)
    .const 'Sub' $P487 = "142_1280467470.54449" 
    capture_lex $P487
    $P10 = rx482_cur."before"($P487)
    unless $P10, rx482_fail
  # rx rxquantr491 ** 1..*
    set_addr $I10, rxquantr491_done
    rx482_cur."!mark_push"(0, -1, $I10)
  rxquantr491_loop:
  # rx subrule "cclass_elem" subtype=capture negate=
    rx482_cur."!cursor_pos"(rx482_pos)
    $P10 = rx482_cur."cclass_elem"()
    unless $P10, rx482_fail
    goto rxsubrule492_pass
  rxsubrule492_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx482_fail
  rxsubrule492_pass:
    set_addr $I10, rxsubrule492_back
    rx482_cur."!mark_push"(0, rx482_pos, $I10, $P10)
    $P10."!cursor_names"("cclass_elem")
    rx482_pos = $P10."pos"()
    set_addr $I10, rxquantr491_done
    (rx482_rep) = rx482_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr491_done
    rx482_cur."!mark_push"(rx482_rep, rx482_pos, $I10)
    goto rxquantr491_loop
  rxquantr491_done:
  # rx pass
    rx482_cur."!cursor_pass"(rx482_pos, "assertion:sym<[>")
    rx482_cur."!cursor_debug"("PASS  ", "assertion:sym<[>", " at pos=", rx482_pos)
    .return (rx482_cur)
  rx482_restart:
.annotate 'line', 3
    rx482_cur."!cursor_debug"("NEXT ", "assertion:sym<[>")
  rx482_fail:
    (rx482_rep, rx482_pos, $I10, $P10) = rx482_cur."!mark_fail"(0)
    lt rx482_pos, -1, rx482_done
    eq rx482_pos, -1, rx482_fail
    jump $I10
  rx482_done:
    rx482_cur."!cursor_fail"()
    rx482_cur."!cursor_debug"("FAIL  ", "assertion:sym<[>")
    .return (rx482_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<[>"  :subid("141_1280467470.54449") :method
.annotate 'line', 3
    new $P484, "ResizablePMCArray"
    push $P484, ""
    .return ($P484)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block486"  :anon :subid("142_1280467470.54449") :method :outer("140_1280467470.54449")
.annotate 'line', 160
    .local string rx488_tgt
    .local int rx488_pos
    .local int rx488_off
    .local int rx488_eos
    .local int rx488_rep
    .local pmc rx488_cur
    (rx488_cur, rx488_pos, rx488_tgt, $I10) = self."!cursor_start"()
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
    eq $I10, 1, rx488_restart
    rx488_cur."!cursor_debug"("START ", "")
    $I10 = self.'from'()
    ne $I10, -1, rxscan489_done
    goto rxscan489_scan
  rxscan489_loop:
    ($P10) = rx488_cur."from"()
    inc $P10
    set rx488_pos, $P10
    ge rx488_pos, rx488_eos, rxscan489_done
  rxscan489_scan:
    set_addr $I10, rxscan489_loop
    rx488_cur."!mark_push"(0, rx488_pos, $I10)
  rxscan489_done:
  alt490_0:
    set_addr $I10, alt490_1
    rx488_cur."!mark_push"(0, rx488_pos, $I10)
  # rx literal  "["
    add $I11, rx488_pos, 1
    gt $I11, rx488_eos, rx488_fail
    sub $I11, rx488_pos, rx488_off
    substr $S10, rx488_tgt, $I11, 1
    ne $S10, "[", rx488_fail
    add rx488_pos, 1
    goto alt490_end
  alt490_1:
    set_addr $I10, alt490_2
    rx488_cur."!mark_push"(0, rx488_pos, $I10)
  # rx literal  "+"
    add $I11, rx488_pos, 1
    gt $I11, rx488_eos, rx488_fail
    sub $I11, rx488_pos, rx488_off
    substr $S10, rx488_tgt, $I11, 1
    ne $S10, "+", rx488_fail
    add rx488_pos, 1
    goto alt490_end
  alt490_2:
  # rx literal  "-"
    add $I11, rx488_pos, 1
    gt $I11, rx488_eos, rx488_fail
    sub $I11, rx488_pos, rx488_off
    substr $S10, rx488_tgt, $I11, 1
    ne $S10, "-", rx488_fail
    add rx488_pos, 1
  alt490_end:
  # rx pass
    rx488_cur."!cursor_pass"(rx488_pos, "")
    rx488_cur."!cursor_debug"("PASS  ", "", " at pos=", rx488_pos)
    .return (rx488_cur)
  rx488_restart:
    rx488_cur."!cursor_debug"("NEXT ", "")
  rx488_fail:
    (rx488_rep, rx488_pos, $I10, $P10) = rx488_cur."!mark_fail"(0)
    lt rx488_pos, -1, rx488_done
    eq rx488_pos, -1, rx488_fail
    jump $I10
  rx488_done:
    rx488_cur."!cursor_fail"()
    rx488_cur."!cursor_debug"("FAIL  ", "")
    .return (rx488_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "cclass_elem"  :subid("143_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .const 'Sub' $P505 = "145_1280467470.54449" 
    capture_lex $P505
    .local string rx494_tgt
    .local int rx494_pos
    .local int rx494_off
    .local int rx494_eos
    .local int rx494_rep
    .local pmc rx494_cur
    (rx494_cur, rx494_pos, rx494_tgt, $I10) = self."!cursor_start"()
    rx494_cur."!cursor_caparray"("charspec")
    .lex unicode:"$\x{a2}", rx494_cur
    .local pmc match
    .lex "$/", match
    length rx494_eos, rx494_tgt
    gt rx494_pos, rx494_eos, rx494_done
    set rx494_off, 0
    lt rx494_pos, 2, rx494_start
    sub rx494_off, rx494_pos, 1
    substr rx494_tgt, rx494_tgt, rx494_off
  rx494_start:
    eq $I10, 1, rx494_restart
    rx494_cur."!cursor_debug"("START ", "cclass_elem")
    $I10 = self.'from'()
    ne $I10, -1, rxscan497_done
    goto rxscan497_scan
  rxscan497_loop:
    ($P10) = rx494_cur."from"()
    inc $P10
    set rx494_pos, $P10
    ge rx494_pos, rx494_eos, rxscan497_done
  rxscan497_scan:
    set_addr $I10, rxscan497_loop
    rx494_cur."!mark_push"(0, rx494_pos, $I10)
  rxscan497_done:
.annotate 'line', 163
  # rx subcapture "sign"
    set_addr $I10, rxcap_499_fail
    rx494_cur."!mark_push"(0, rx494_pos, $I10)
  alt498_0:
    set_addr $I10, alt498_1
    rx494_cur."!mark_push"(0, rx494_pos, $I10)
  # rx literal  "+"
    add $I11, rx494_pos, 1
    gt $I11, rx494_eos, rx494_fail
    sub $I11, rx494_pos, rx494_off
    substr $S10, rx494_tgt, $I11, 1
    ne $S10, "+", rx494_fail
    add rx494_pos, 1
    goto alt498_end
  alt498_1:
    set_addr $I10, alt498_2
    rx494_cur."!mark_push"(0, rx494_pos, $I10)
  # rx literal  "-"
    add $I11, rx494_pos, 1
    gt $I11, rx494_eos, rx494_fail
    sub $I11, rx494_pos, rx494_off
    substr $S10, rx494_tgt, $I11, 1
    ne $S10, "-", rx494_fail
    add rx494_pos, 1
    goto alt498_end
  alt498_2:
  alt498_end:
    set_addr $I10, rxcap_499_fail
    ($I12, $I11) = rx494_cur."!mark_peek"($I10)
    rx494_cur."!cursor_pos"($I11)
    ($P10) = rx494_cur."!cursor_start"()
    $P10."!cursor_pass"(rx494_pos, "")
    rx494_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sign")
    goto rxcap_499_done
  rxcap_499_fail:
    goto rx494_fail
  rxcap_499_done:
.annotate 'line', 164
  # rx rxquantr500 ** 0..1
    set_addr $I10, rxquantr500_done
    rx494_cur."!mark_push"(0, rx494_pos, $I10)
  rxquantr500_loop:
  # rx subrule "normspace" subtype=method negate=
    rx494_cur."!cursor_pos"(rx494_pos)
    $P10 = rx494_cur."normspace"()
    unless $P10, rx494_fail
    goto rxsubrule501_pass
  rxsubrule501_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx494_fail
  rxsubrule501_pass:
    set_addr $I10, rxsubrule501_back
    rx494_cur."!mark_push"(0, rx494_pos, $I10, $P10)
    rx494_pos = $P10."pos"()
    set_addr $I10, rxquantr500_done
    (rx494_rep) = rx494_cur."!mark_commit"($I10)
  rxquantr500_done:
  alt502_0:
.annotate 'line', 165
    set_addr $I10, alt502_1
    rx494_cur."!mark_push"(0, rx494_pos, $I10)
.annotate 'line', 166
  # rx literal  "["
    add $I11, rx494_pos, 1
    gt $I11, rx494_eos, rx494_fail
    sub $I11, rx494_pos, rx494_off
    substr $S10, rx494_tgt, $I11, 1
    ne $S10, "[", rx494_fail
    add rx494_pos, 1
.annotate 'line', 169
  # rx rxquantr503 ** 0..*
    set_addr $I10, rxquantr503_done
    rx494_cur."!mark_push"(0, rx494_pos, $I10)
  rxquantr503_loop:
.annotate 'line', 166
  # rx subrule $P505 subtype=capture negate=
    rx494_cur."!cursor_pos"(rx494_pos)
    .const 'Sub' $P505 = "145_1280467470.54449" 
    capture_lex $P505
    $P10 = rx494_cur.$P505()
    unless $P10, rx494_fail
    goto rxsubrule523_pass
  rxsubrule523_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx494_fail
  rxsubrule523_pass:
    set_addr $I10, rxsubrule523_back
    rx494_cur."!mark_push"(0, rx494_pos, $I10, $P10)
    $P10."!cursor_names"("charspec")
    rx494_pos = $P10."pos"()
.annotate 'line', 169
    set_addr $I10, rxquantr503_done
    (rx494_rep) = rx494_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr503_done
    rx494_cur."!mark_push"(rx494_rep, rx494_pos, $I10)
    goto rxquantr503_loop
  rxquantr503_done:
.annotate 'line', 170
  # rx charclass_q s r 0..-1
    sub $I10, rx494_pos, rx494_off
    find_not_cclass $I11, 32, rx494_tgt, $I10, rx494_eos
    add rx494_pos, rx494_off, $I11
  # rx literal  "]"
    add $I11, rx494_pos, 1
    gt $I11, rx494_eos, rx494_fail
    sub $I11, rx494_pos, rx494_off
    substr $S10, rx494_tgt, $I11, 1
    ne $S10, "]", rx494_fail
    add rx494_pos, 1
.annotate 'line', 166
    goto alt502_end
  alt502_1:
.annotate 'line', 171
  # rx subcapture "name"
    set_addr $I10, rxcap_524_fail
    rx494_cur."!mark_push"(0, rx494_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx494_pos, rx494_off
    find_not_cclass $I11, 8192, rx494_tgt, $I10, rx494_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx494_fail
    add rx494_pos, rx494_off, $I11
    set_addr $I10, rxcap_524_fail
    ($I12, $I11) = rx494_cur."!mark_peek"($I10)
    rx494_cur."!cursor_pos"($I11)
    ($P10) = rx494_cur."!cursor_start"()
    $P10."!cursor_pass"(rx494_pos, "")
    rx494_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_524_done
  rxcap_524_fail:
    goto rx494_fail
  rxcap_524_done:
  alt502_end:
.annotate 'line', 173
  # rx rxquantr525 ** 0..1
    set_addr $I10, rxquantr525_done
    rx494_cur."!mark_push"(0, rx494_pos, $I10)
  rxquantr525_loop:
  # rx subrule "normspace" subtype=method negate=
    rx494_cur."!cursor_pos"(rx494_pos)
    $P10 = rx494_cur."normspace"()
    unless $P10, rx494_fail
    goto rxsubrule526_pass
  rxsubrule526_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx494_fail
  rxsubrule526_pass:
    set_addr $I10, rxsubrule526_back
    rx494_cur."!mark_push"(0, rx494_pos, $I10, $P10)
    rx494_pos = $P10."pos"()
    set_addr $I10, rxquantr525_done
    (rx494_rep) = rx494_cur."!mark_commit"($I10)
  rxquantr525_done:
.annotate 'line', 162
  # rx pass
    rx494_cur."!cursor_pass"(rx494_pos, "cclass_elem")
    rx494_cur."!cursor_debug"("PASS  ", "cclass_elem", " at pos=", rx494_pos)
    .return (rx494_cur)
  rx494_restart:
.annotate 'line', 3
    rx494_cur."!cursor_debug"("NEXT ", "cclass_elem")
  rx494_fail:
    (rx494_rep, rx494_pos, $I10, $P10) = rx494_cur."!mark_fail"(0)
    lt rx494_pos, -1, rx494_done
    eq rx494_pos, -1, rx494_fail
    jump $I10
  rx494_done:
    rx494_cur."!cursor_fail"()
    rx494_cur."!cursor_debug"("FAIL  ", "cclass_elem")
    .return (rx494_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__cclass_elem"  :subid("144_1280467470.54449") :method
.annotate 'line', 3
    new $P496, "ResizablePMCArray"
    push $P496, ""
    push $P496, "-"
    push $P496, "+"
    .return ($P496)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block504"  :anon :subid("145_1280467470.54449") :method :outer("143_1280467470.54449")
.annotate 'line', 166
    .const 'Sub' $P520 = "148_1280467470.54449" 
    capture_lex $P520
    .const 'Sub' $P515 = "147_1280467470.54449" 
    capture_lex $P515
    .const 'Sub' $P511 = "146_1280467470.54449" 
    capture_lex $P511
    .local string rx506_tgt
    .local int rx506_pos
    .local int rx506_off
    .local int rx506_eos
    .local int rx506_rep
    .local pmc rx506_cur
    (rx506_cur, rx506_pos, rx506_tgt, $I10) = self."!cursor_start"()
    rx506_cur."!cursor_caparray"("1")
    .lex unicode:"$\x{a2}", rx506_cur
    .local pmc match
    .lex "$/", match
    length rx506_eos, rx506_tgt
    gt rx506_pos, rx506_eos, rx506_done
    set rx506_off, 0
    lt rx506_pos, 2, rx506_start
    sub rx506_off, rx506_pos, 1
    substr rx506_tgt, rx506_tgt, rx506_off
  rx506_start:
    eq $I10, 1, rx506_restart
    rx506_cur."!cursor_debug"("START ", "")
    $I10 = self.'from'()
    ne $I10, -1, rxscan507_done
    goto rxscan507_scan
  rxscan507_loop:
    ($P10) = rx506_cur."from"()
    inc $P10
    set rx506_pos, $P10
    ge rx506_pos, rx506_eos, rxscan507_done
  rxscan507_scan:
    set_addr $I10, rxscan507_loop
    rx506_cur."!mark_push"(0, rx506_pos, $I10)
  rxscan507_done:
  alt508_0:
    set_addr $I10, alt508_1
    rx506_cur."!mark_push"(0, rx506_pos, $I10)
.annotate 'line', 167
  # rx charclass_q s r 0..-1
    sub $I10, rx506_pos, rx506_off
    find_not_cclass $I11, 32, rx506_tgt, $I10, rx506_eos
    add rx506_pos, rx506_off, $I11
  # rx literal  "-"
    add $I11, rx506_pos, 1
    gt $I11, rx506_eos, rx506_fail
    sub $I11, rx506_pos, rx506_off
    substr $S10, rx506_tgt, $I11, 1
    ne $S10, "-", rx506_fail
    add rx506_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx506_cur."!cursor_pos"(rx506_pos)
    $P10 = rx506_cur."obs"("- as character range", "..")
    unless $P10, rx506_fail
    rx506_pos = $P10."pos"()
    goto alt508_end
  alt508_1:
.annotate 'line', 168
  # rx charclass_q s r 0..-1
    sub $I10, rx506_pos, rx506_off
    find_not_cclass $I11, 32, rx506_tgt, $I10, rx506_eos
    add rx506_pos, rx506_off, $I11
  alt509_0:
    set_addr $I10, alt509_1
    rx506_cur."!mark_push"(0, rx506_pos, $I10)
  # rx literal  "\\"
    add $I11, rx506_pos, 1
    gt $I11, rx506_eos, rx506_fail
    sub $I11, rx506_pos, rx506_off
    substr $S10, rx506_tgt, $I11, 1
    ne $S10, "\\", rx506_fail
    add rx506_pos, 1
  # rx subrule $P511 subtype=capture negate=
    rx506_cur."!cursor_pos"(rx506_pos)
    .const 'Sub' $P511 = "146_1280467470.54449" 
    capture_lex $P511
    $P10 = rx506_cur.$P511()
    unless $P10, rx506_fail
    rx506_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"(0)
    rx506_pos = $P10."pos"()
    goto alt509_end
  alt509_1:
  # rx subrule $P515 subtype=capture negate=
    rx506_cur."!cursor_pos"(rx506_pos)
    .const 'Sub' $P515 = "147_1280467470.54449" 
    capture_lex $P515
    $P10 = rx506_cur.$P515()
    unless $P10, rx506_fail
    rx506_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"(0)
    rx506_pos = $P10."pos"()
  alt509_end:
  # rx rxquantr518 ** 0..1
    set_addr $I10, rxquantr518_done
    rx506_cur."!mark_push"(0, rx506_pos, $I10)
  rxquantr518_loop:
  # rx charclass_q s r 0..-1
    sub $I10, rx506_pos, rx506_off
    find_not_cclass $I11, 32, rx506_tgt, $I10, rx506_eos
    add rx506_pos, rx506_off, $I11
  # rx literal  ".."
    add $I11, rx506_pos, 2
    gt $I11, rx506_eos, rx506_fail
    sub $I11, rx506_pos, rx506_off
    substr $S10, rx506_tgt, $I11, 2
    ne $S10, "..", rx506_fail
    add rx506_pos, 2
  # rx charclass_q s r 0..-1
    sub $I10, rx506_pos, rx506_off
    find_not_cclass $I11, 32, rx506_tgt, $I10, rx506_eos
    add rx506_pos, rx506_off, $I11
  # rx subrule $P520 subtype=capture negate=
    rx506_cur."!cursor_pos"(rx506_pos)
    .const 'Sub' $P520 = "148_1280467470.54449" 
    capture_lex $P520
    $P10 = rx506_cur.$P520()
    unless $P10, rx506_fail
    rx506_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("1")
    rx506_pos = $P10."pos"()
    set_addr $I10, rxquantr518_done
    (rx506_rep) = rx506_cur."!mark_commit"($I10)
  rxquantr518_done:
  alt508_end:
.annotate 'line', 166
  # rx pass
    rx506_cur."!cursor_pass"(rx506_pos, "")
    rx506_cur."!cursor_debug"("PASS  ", "", " at pos=", rx506_pos)
    .return (rx506_cur)
  rx506_restart:
    rx506_cur."!cursor_debug"("NEXT ", "")
  rx506_fail:
    (rx506_rep, rx506_pos, $I10, $P10) = rx506_cur."!mark_fail"(0)
    lt rx506_pos, -1, rx506_done
    eq rx506_pos, -1, rx506_fail
    jump $I10
  rx506_done:
    rx506_cur."!cursor_fail"()
    rx506_cur."!cursor_debug"("FAIL  ", "")
    .return (rx506_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block510"  :anon :subid("146_1280467470.54449") :method :outer("145_1280467470.54449")
.annotate 'line', 168
    .local string rx512_tgt
    .local int rx512_pos
    .local int rx512_off
    .local int rx512_eos
    .local int rx512_rep
    .local pmc rx512_cur
    (rx512_cur, rx512_pos, rx512_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx512_cur
    .local pmc match
    .lex "$/", match
    length rx512_eos, rx512_tgt
    gt rx512_pos, rx512_eos, rx512_done
    set rx512_off, 0
    lt rx512_pos, 2, rx512_start
    sub rx512_off, rx512_pos, 1
    substr rx512_tgt, rx512_tgt, rx512_off
  rx512_start:
    eq $I10, 1, rx512_restart
    rx512_cur."!cursor_debug"("START ", "")
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
  # rx charclass .
    ge rx512_pos, rx512_eos, rx512_fail
    inc rx512_pos
  # rx pass
    rx512_cur."!cursor_pass"(rx512_pos, "")
    rx512_cur."!cursor_debug"("PASS  ", "", " at pos=", rx512_pos)
    .return (rx512_cur)
  rx512_restart:
    rx512_cur."!cursor_debug"("NEXT ", "")
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
.sub "_block514"  :anon :subid("147_1280467470.54449") :method :outer("145_1280467470.54449")
.annotate 'line', 168
    .local string rx516_tgt
    .local int rx516_pos
    .local int rx516_off
    .local int rx516_eos
    .local int rx516_rep
    .local pmc rx516_cur
    (rx516_cur, rx516_pos, rx516_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx516_cur
    .local pmc match
    .lex "$/", match
    length rx516_eos, rx516_tgt
    gt rx516_pos, rx516_eos, rx516_done
    set rx516_off, 0
    lt rx516_pos, 2, rx516_start
    sub rx516_off, rx516_pos, 1
    substr rx516_tgt, rx516_tgt, rx516_off
  rx516_start:
    eq $I10, 1, rx516_restart
    rx516_cur."!cursor_debug"("START ", "")
    $I10 = self.'from'()
    ne $I10, -1, rxscan517_done
    goto rxscan517_scan
  rxscan517_loop:
    ($P10) = rx516_cur."from"()
    inc $P10
    set rx516_pos, $P10
    ge rx516_pos, rx516_eos, rxscan517_done
  rxscan517_scan:
    set_addr $I10, rxscan517_loop
    rx516_cur."!mark_push"(0, rx516_pos, $I10)
  rxscan517_done:
  # rx enumcharlist negate=1 
    ge rx516_pos, rx516_eos, rx516_fail
    sub $I10, rx516_pos, rx516_off
    substr $S10, rx516_tgt, $I10, 1
    index $I11, "]\\", $S10
    ge $I11, 0, rx516_fail
    inc rx516_pos
  # rx pass
    rx516_cur."!cursor_pass"(rx516_pos, "")
    rx516_cur."!cursor_debug"("PASS  ", "", " at pos=", rx516_pos)
    .return (rx516_cur)
  rx516_restart:
    rx516_cur."!cursor_debug"("NEXT ", "")
  rx516_fail:
    (rx516_rep, rx516_pos, $I10, $P10) = rx516_cur."!mark_fail"(0)
    lt rx516_pos, -1, rx516_done
    eq rx516_pos, -1, rx516_fail
    jump $I10
  rx516_done:
    rx516_cur."!cursor_fail"()
    rx516_cur."!cursor_debug"("FAIL  ", "")
    .return (rx516_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block519"  :anon :subid("148_1280467470.54449") :method :outer("145_1280467470.54449")
.annotate 'line', 168
    .local string rx521_tgt
    .local int rx521_pos
    .local int rx521_off
    .local int rx521_eos
    .local int rx521_rep
    .local pmc rx521_cur
    (rx521_cur, rx521_pos, rx521_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx521_cur
    .local pmc match
    .lex "$/", match
    length rx521_eos, rx521_tgt
    gt rx521_pos, rx521_eos, rx521_done
    set rx521_off, 0
    lt rx521_pos, 2, rx521_start
    sub rx521_off, rx521_pos, 1
    substr rx521_tgt, rx521_tgt, rx521_off
  rx521_start:
    eq $I10, 1, rx521_restart
    rx521_cur."!cursor_debug"("START ", "")
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
  # rx charclass .
    ge rx521_pos, rx521_eos, rx521_fail
    inc rx521_pos
  # rx pass
    rx521_cur."!cursor_pass"(rx521_pos, "")
    rx521_cur."!cursor_debug"("PASS  ", "", " at pos=", rx521_pos)
    .return (rx521_cur)
  rx521_restart:
    rx521_cur."!cursor_debug"("NEXT ", "")
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
.sub "mod_internal"  :subid("149_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .const 'Sub' $P536 = "151_1280467470.54449" 
    capture_lex $P536
    .local string rx528_tgt
    .local int rx528_pos
    .local int rx528_off
    .local int rx528_eos
    .local int rx528_rep
    .local pmc rx528_cur
    (rx528_cur, rx528_pos, rx528_tgt, $I10) = self."!cursor_start"()
    rx528_cur."!cursor_caparray"("n")
    .lex unicode:"$\x{a2}", rx528_cur
    .local pmc match
    .lex "$/", match
    length rx528_eos, rx528_tgt
    gt rx528_pos, rx528_eos, rx528_done
    set rx528_off, 0
    lt rx528_pos, 2, rx528_start
    sub rx528_off, rx528_pos, 1
    substr rx528_tgt, rx528_tgt, rx528_off
  rx528_start:
    eq $I10, 1, rx528_restart
    rx528_cur."!cursor_debug"("START ", "mod_internal")
    $I10 = self.'from'()
    ne $I10, -1, rxscan532_done
    goto rxscan532_scan
  rxscan532_loop:
    ($P10) = rx528_cur."from"()
    inc $P10
    set rx528_pos, $P10
    ge rx528_pos, rx528_eos, rxscan532_done
  rxscan532_scan:
    set_addr $I10, rxscan532_loop
    rx528_cur."!mark_push"(0, rx528_pos, $I10)
  rxscan532_done:
  alt533_0:
.annotate 'line', 177
    set_addr $I10, alt533_1
    rx528_cur."!mark_push"(0, rx528_pos, $I10)
.annotate 'line', 178
  # rx literal  ":"
    add $I11, rx528_pos, 1
    gt $I11, rx528_eos, rx528_fail
    sub $I11, rx528_pos, rx528_off
    substr $S10, rx528_tgt, $I11, 1
    ne $S10, ":", rx528_fail
    add rx528_pos, 1
  # rx rxquantr534 ** 1..1
    set_addr $I10, rxquantr534_done
    rx528_cur."!mark_push"(0, -1, $I10)
  rxquantr534_loop:
  # rx subrule $P536 subtype=capture negate=
    rx528_cur."!cursor_pos"(rx528_pos)
    .const 'Sub' $P536 = "151_1280467470.54449" 
    capture_lex $P536
    $P10 = rx528_cur.$P536()
    unless $P10, rx528_fail
    goto rxsubrule540_pass
  rxsubrule540_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx528_fail
  rxsubrule540_pass:
    set_addr $I10, rxsubrule540_back
    rx528_cur."!mark_push"(0, rx528_pos, $I10, $P10)
    $P10."!cursor_names"("n")
    rx528_pos = $P10."pos"()
    set_addr $I10, rxquantr534_done
    (rx528_rep) = rx528_cur."!mark_commit"($I10)
  rxquantr534_done:
  # rx subrule "mod_ident" subtype=capture negate=
    rx528_cur."!cursor_pos"(rx528_pos)
    $P10 = rx528_cur."mod_ident"()
    unless $P10, rx528_fail
    rx528_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_ident")
    rx528_pos = $P10."pos"()
  # rxanchor rwb
    le rx528_pos, 0, rx528_fail
    sub $I10, rx528_pos, rx528_off
    is_cclass $I11, 8192, rx528_tgt, $I10
    if $I11, rx528_fail
    dec $I10
    is_cclass $I11, 8192, rx528_tgt, $I10
    unless $I11, rx528_fail
    goto alt533_end
  alt533_1:
.annotate 'line', 179
  # rx literal  ":"
    add $I11, rx528_pos, 1
    gt $I11, rx528_eos, rx528_fail
    sub $I11, rx528_pos, rx528_off
    substr $S10, rx528_tgt, $I11, 1
    ne $S10, ":", rx528_fail
    add rx528_pos, 1
  # rx subrule "mod_ident" subtype=capture negate=
    rx528_cur."!cursor_pos"(rx528_pos)
    $P10 = rx528_cur."mod_ident"()
    unless $P10, rx528_fail
    rx528_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_ident")
    rx528_pos = $P10."pos"()
  # rx rxquantr541 ** 0..1
    set_addr $I10, rxquantr541_done
    rx528_cur."!mark_push"(0, rx528_pos, $I10)
  rxquantr541_loop:
  # rx literal  "("
    add $I11, rx528_pos, 1
    gt $I11, rx528_eos, rx528_fail
    sub $I11, rx528_pos, rx528_off
    substr $S10, rx528_tgt, $I11, 1
    ne $S10, "(", rx528_fail
    add rx528_pos, 1
  # rx subcapture "n"
    set_addr $I10, rxcap_542_fail
    rx528_cur."!mark_push"(0, rx528_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx528_pos, rx528_off
    find_not_cclass $I11, 8, rx528_tgt, $I10, rx528_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx528_fail
    add rx528_pos, rx528_off, $I11
    set_addr $I10, rxcap_542_fail
    ($I12, $I11) = rx528_cur."!mark_peek"($I10)
    rx528_cur."!cursor_pos"($I11)
    ($P10) = rx528_cur."!cursor_start"()
    $P10."!cursor_pass"(rx528_pos, "")
    rx528_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("n")
    goto rxcap_542_done
  rxcap_542_fail:
    goto rx528_fail
  rxcap_542_done:
  # rx literal  ")"
    add $I11, rx528_pos, 1
    gt $I11, rx528_eos, rx528_fail
    sub $I11, rx528_pos, rx528_off
    substr $S10, rx528_tgt, $I11, 1
    ne $S10, ")", rx528_fail
    add rx528_pos, 1
    set_addr $I10, rxquantr541_done
    (rx528_rep) = rx528_cur."!mark_commit"($I10)
  rxquantr541_done:
  alt533_end:
.annotate 'line', 176
  # rx pass
    rx528_cur."!cursor_pass"(rx528_pos, "mod_internal")
    rx528_cur."!cursor_debug"("PASS  ", "mod_internal", " at pos=", rx528_pos)
    .return (rx528_cur)
  rx528_restart:
.annotate 'line', 3
    rx528_cur."!cursor_debug"("NEXT ", "mod_internal")
  rx528_fail:
    (rx528_rep, rx528_pos, $I10, $P10) = rx528_cur."!mark_fail"(0)
    lt rx528_pos, -1, rx528_done
    eq rx528_pos, -1, rx528_fail
    jump $I10
  rx528_done:
    rx528_cur."!cursor_fail"()
    rx528_cur."!cursor_debug"("FAIL  ", "mod_internal")
    .return (rx528_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_internal"  :subid("150_1280467470.54449") :method
.annotate 'line', 3
    $P530 = self."!PREFIX__!subrule"("mod_ident", ":")
    new $P531, "ResizablePMCArray"
    push $P531, $P530
    push $P531, ":"
    .return ($P531)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block535"  :anon :subid("151_1280467470.54449") :method :outer("149_1280467470.54449")
.annotate 'line', 178
    .local string rx537_tgt
    .local int rx537_pos
    .local int rx537_off
    .local int rx537_eos
    .local int rx537_rep
    .local pmc rx537_cur
    (rx537_cur, rx537_pos, rx537_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx537_cur
    .local pmc match
    .lex "$/", match
    length rx537_eos, rx537_tgt
    gt rx537_pos, rx537_eos, rx537_done
    set rx537_off, 0
    lt rx537_pos, 2, rx537_start
    sub rx537_off, rx537_pos, 1
    substr rx537_tgt, rx537_tgt, rx537_off
  rx537_start:
    eq $I10, 1, rx537_restart
    rx537_cur."!cursor_debug"("START ", "")
    $I10 = self.'from'()
    ne $I10, -1, rxscan538_done
    goto rxscan538_scan
  rxscan538_loop:
    ($P10) = rx537_cur."from"()
    inc $P10
    set rx537_pos, $P10
    ge rx537_pos, rx537_eos, rxscan538_done
  rxscan538_scan:
    set_addr $I10, rxscan538_loop
    rx537_cur."!mark_push"(0, rx537_pos, $I10)
  rxscan538_done:
  alt539_0:
    set_addr $I10, alt539_1
    rx537_cur."!mark_push"(0, rx537_pos, $I10)
  # rx literal  "!"
    add $I11, rx537_pos, 1
    gt $I11, rx537_eos, rx537_fail
    sub $I11, rx537_pos, rx537_off
    substr $S10, rx537_tgt, $I11, 1
    ne $S10, "!", rx537_fail
    add rx537_pos, 1
    goto alt539_end
  alt539_1:
  # rx charclass_q d r 1..-1
    sub $I10, rx537_pos, rx537_off
    find_not_cclass $I11, 8, rx537_tgt, $I10, rx537_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx537_fail
    add rx537_pos, rx537_off, $I11
  alt539_end:
  # rx pass
    rx537_cur."!cursor_pass"(rx537_pos, "")
    rx537_cur."!cursor_debug"("PASS  ", "", " at pos=", rx537_pos)
    .return (rx537_cur)
  rx537_restart:
    rx537_cur."!cursor_debug"("NEXT ", "")
  rx537_fail:
    (rx537_rep, rx537_pos, $I10, $P10) = rx537_cur."!mark_fail"(0)
    lt rx537_pos, -1, rx537_done
    eq rx537_pos, -1, rx537_fail
    jump $I10
  rx537_done:
    rx537_cur."!cursor_fail"()
    rx537_cur."!cursor_debug"("FAIL  ", "")
    .return (rx537_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident"  :subid("152_1280467470.54449") :method
.annotate 'line', 183
    $P544 = self."!protoregex"("mod_ident")
    .return ($P544)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident"  :subid("153_1280467470.54449") :method
.annotate 'line', 183
    $P546 = self."!PREFIX__!protoregex"("mod_ident")
    .return ($P546)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ignorecase>"  :subid("154_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx548_tgt
    .local int rx548_pos
    .local int rx548_off
    .local int rx548_eos
    .local int rx548_rep
    .local pmc rx548_cur
    (rx548_cur, rx548_pos, rx548_tgt, $I10) = self."!cursor_start"()
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
    eq $I10, 1, rx548_restart
    rx548_cur."!cursor_debug"("START ", "mod_ident:sym<ignorecase>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan551_done
    goto rxscan551_scan
  rxscan551_loop:
    ($P10) = rx548_cur."from"()
    inc $P10
    set rx548_pos, $P10
    ge rx548_pos, rx548_eos, rxscan551_done
  rxscan551_scan:
    set_addr $I10, rxscan551_loop
    rx548_cur."!mark_push"(0, rx548_pos, $I10)
  rxscan551_done:
.annotate 'line', 184
  # rx subcapture "sym"
    set_addr $I10, rxcap_552_fail
    rx548_cur."!mark_push"(0, rx548_pos, $I10)
  # rx literal  "i"
    add $I11, rx548_pos, 1
    gt $I11, rx548_eos, rx548_fail
    sub $I11, rx548_pos, rx548_off
    substr $S10, rx548_tgt, $I11, 1
    ne $S10, "i", rx548_fail
    add rx548_pos, 1
    set_addr $I10, rxcap_552_fail
    ($I12, $I11) = rx548_cur."!mark_peek"($I10)
    rx548_cur."!cursor_pos"($I11)
    ($P10) = rx548_cur."!cursor_start"()
    $P10."!cursor_pass"(rx548_pos, "")
    rx548_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_552_done
  rxcap_552_fail:
    goto rx548_fail
  rxcap_552_done:
  # rx rxquantr553 ** 0..1
    set_addr $I10, rxquantr553_done
    rx548_cur."!mark_push"(0, rx548_pos, $I10)
  rxquantr553_loop:
  # rx literal  "gnorecase"
    add $I11, rx548_pos, 9
    gt $I11, rx548_eos, rx548_fail
    sub $I11, rx548_pos, rx548_off
    substr $S10, rx548_tgt, $I11, 9
    ne $S10, "gnorecase", rx548_fail
    add rx548_pos, 9
    set_addr $I10, rxquantr553_done
    (rx548_rep) = rx548_cur."!mark_commit"($I10)
  rxquantr553_done:
  # rx pass
    rx548_cur."!cursor_pass"(rx548_pos, "mod_ident:sym<ignorecase>")
    rx548_cur."!cursor_debug"("PASS  ", "mod_ident:sym<ignorecase>", " at pos=", rx548_pos)
    .return (rx548_cur)
  rx548_restart:
.annotate 'line', 3
    rx548_cur."!cursor_debug"("NEXT ", "mod_ident:sym<ignorecase>")
  rx548_fail:
    (rx548_rep, rx548_pos, $I10, $P10) = rx548_cur."!mark_fail"(0)
    lt rx548_pos, -1, rx548_done
    eq rx548_pos, -1, rx548_fail
    jump $I10
  rx548_done:
    rx548_cur."!cursor_fail"()
    rx548_cur."!cursor_debug"("FAIL  ", "mod_ident:sym<ignorecase>")
    .return (rx548_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident:sym<ignorecase>"  :subid("155_1280467470.54449") :method
.annotate 'line', 3
    new $P550, "ResizablePMCArray"
    push $P550, "i"
    .return ($P550)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ratchet>"  :subid("156_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx555_tgt
    .local int rx555_pos
    .local int rx555_off
    .local int rx555_eos
    .local int rx555_rep
    .local pmc rx555_cur
    (rx555_cur, rx555_pos, rx555_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx555_cur
    .local pmc match
    .lex "$/", match
    length rx555_eos, rx555_tgt
    gt rx555_pos, rx555_eos, rx555_done
    set rx555_off, 0
    lt rx555_pos, 2, rx555_start
    sub rx555_off, rx555_pos, 1
    substr rx555_tgt, rx555_tgt, rx555_off
  rx555_start:
    eq $I10, 1, rx555_restart
    rx555_cur."!cursor_debug"("START ", "mod_ident:sym<ratchet>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan558_done
    goto rxscan558_scan
  rxscan558_loop:
    ($P10) = rx555_cur."from"()
    inc $P10
    set rx555_pos, $P10
    ge rx555_pos, rx555_eos, rxscan558_done
  rxscan558_scan:
    set_addr $I10, rxscan558_loop
    rx555_cur."!mark_push"(0, rx555_pos, $I10)
  rxscan558_done:
.annotate 'line', 185
  # rx subcapture "sym"
    set_addr $I10, rxcap_559_fail
    rx555_cur."!mark_push"(0, rx555_pos, $I10)
  # rx literal  "r"
    add $I11, rx555_pos, 1
    gt $I11, rx555_eos, rx555_fail
    sub $I11, rx555_pos, rx555_off
    substr $S10, rx555_tgt, $I11, 1
    ne $S10, "r", rx555_fail
    add rx555_pos, 1
    set_addr $I10, rxcap_559_fail
    ($I12, $I11) = rx555_cur."!mark_peek"($I10)
    rx555_cur."!cursor_pos"($I11)
    ($P10) = rx555_cur."!cursor_start"()
    $P10."!cursor_pass"(rx555_pos, "")
    rx555_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_559_done
  rxcap_559_fail:
    goto rx555_fail
  rxcap_559_done:
  # rx rxquantr560 ** 0..1
    set_addr $I10, rxquantr560_done
    rx555_cur."!mark_push"(0, rx555_pos, $I10)
  rxquantr560_loop:
  # rx literal  "atchet"
    add $I11, rx555_pos, 6
    gt $I11, rx555_eos, rx555_fail
    sub $I11, rx555_pos, rx555_off
    substr $S10, rx555_tgt, $I11, 6
    ne $S10, "atchet", rx555_fail
    add rx555_pos, 6
    set_addr $I10, rxquantr560_done
    (rx555_rep) = rx555_cur."!mark_commit"($I10)
  rxquantr560_done:
  # rx pass
    rx555_cur."!cursor_pass"(rx555_pos, "mod_ident:sym<ratchet>")
    rx555_cur."!cursor_debug"("PASS  ", "mod_ident:sym<ratchet>", " at pos=", rx555_pos)
    .return (rx555_cur)
  rx555_restart:
.annotate 'line', 3
    rx555_cur."!cursor_debug"("NEXT ", "mod_ident:sym<ratchet>")
  rx555_fail:
    (rx555_rep, rx555_pos, $I10, $P10) = rx555_cur."!mark_fail"(0)
    lt rx555_pos, -1, rx555_done
    eq rx555_pos, -1, rx555_fail
    jump $I10
  rx555_done:
    rx555_cur."!cursor_fail"()
    rx555_cur."!cursor_debug"("FAIL  ", "mod_ident:sym<ratchet>")
    .return (rx555_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident:sym<ratchet>"  :subid("157_1280467470.54449") :method
.annotate 'line', 3
    new $P557, "ResizablePMCArray"
    push $P557, "r"
    .return ($P557)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<sigspace>"  :subid("158_1280467470.54449") :method :outer("11_1280467470.54449")
.annotate 'line', 3
    .local string rx562_tgt
    .local int rx562_pos
    .local int rx562_off
    .local int rx562_eos
    .local int rx562_rep
    .local pmc rx562_cur
    (rx562_cur, rx562_pos, rx562_tgt, $I10) = self."!cursor_start"()
    .lex unicode:"$\x{a2}", rx562_cur
    .local pmc match
    .lex "$/", match
    length rx562_eos, rx562_tgt
    gt rx562_pos, rx562_eos, rx562_done
    set rx562_off, 0
    lt rx562_pos, 2, rx562_start
    sub rx562_off, rx562_pos, 1
    substr rx562_tgt, rx562_tgt, rx562_off
  rx562_start:
    eq $I10, 1, rx562_restart
    rx562_cur."!cursor_debug"("START ", "mod_ident:sym<sigspace>")
    $I10 = self.'from'()
    ne $I10, -1, rxscan565_done
    goto rxscan565_scan
  rxscan565_loop:
    ($P10) = rx562_cur."from"()
    inc $P10
    set rx562_pos, $P10
    ge rx562_pos, rx562_eos, rxscan565_done
  rxscan565_scan:
    set_addr $I10, rxscan565_loop
    rx562_cur."!mark_push"(0, rx562_pos, $I10)
  rxscan565_done:
.annotate 'line', 186
  # rx subcapture "sym"
    set_addr $I10, rxcap_566_fail
    rx562_cur."!mark_push"(0, rx562_pos, $I10)
  # rx literal  "s"
    add $I11, rx562_pos, 1
    gt $I11, rx562_eos, rx562_fail
    sub $I11, rx562_pos, rx562_off
    substr $S10, rx562_tgt, $I11, 1
    ne $S10, "s", rx562_fail
    add rx562_pos, 1
    set_addr $I10, rxcap_566_fail
    ($I12, $I11) = rx562_cur."!mark_peek"($I10)
    rx562_cur."!cursor_pos"($I11)
    ($P10) = rx562_cur."!cursor_start"()
    $P10."!cursor_pass"(rx562_pos, "")
    rx562_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_566_done
  rxcap_566_fail:
    goto rx562_fail
  rxcap_566_done:
  # rx rxquantr567 ** 0..1
    set_addr $I10, rxquantr567_done
    rx562_cur."!mark_push"(0, rx562_pos, $I10)
  rxquantr567_loop:
  # rx literal  "igspace"
    add $I11, rx562_pos, 7
    gt $I11, rx562_eos, rx562_fail
    sub $I11, rx562_pos, rx562_off
    substr $S10, rx562_tgt, $I11, 7
    ne $S10, "igspace", rx562_fail
    add rx562_pos, 7
    set_addr $I10, rxquantr567_done
    (rx562_rep) = rx562_cur."!mark_commit"($I10)
  rxquantr567_done:
  # rx pass
    rx562_cur."!cursor_pass"(rx562_pos, "mod_ident:sym<sigspace>")
    rx562_cur."!cursor_debug"("PASS  ", "mod_ident:sym<sigspace>", " at pos=", rx562_pos)
    .return (rx562_cur)
  rx562_restart:
.annotate 'line', 3
    rx562_cur."!cursor_debug"("NEXT ", "mod_ident:sym<sigspace>")
  rx562_fail:
    (rx562_rep, rx562_pos, $I10, $P10) = rx562_cur."!mark_fail"(0)
    lt rx562_pos, -1, rx562_done
    eq rx562_pos, -1, rx562_fail
    jump $I10
  rx562_done:
    rx562_cur."!cursor_fail"()
    rx562_cur."!cursor_debug"("FAIL  ", "mod_ident:sym<sigspace>")
    .return (rx562_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident:sym<sigspace>"  :subid("159_1280467470.54449") :method
.annotate 'line', 3
    new $P564, "ResizablePMCArray"
    push $P564, "s"
    .return ($P564)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block568" :load :anon :subid("160_1280467470.54449")
.annotate 'line', 3
    .const 'Sub' $P570 = "11_1280467470.54449" 
    $P571 = $P570()
    .return ($P571)
.end


.namespace []
.sub "_block573" :load :anon :subid("161_1280467470.54449")
.annotate 'line', 1
    .const 'Sub' $P575 = "10_1280467470.54449" 
    $P576 = $P575()
    .return ($P576)
.end

### .include 'gen/p6regex-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1280467473.99327")
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
    $P1634 = $P14()
.annotate 'line', 1
    .return ($P1634)
    .const 'Sub' $P1636 = "92_1280467473.99327" 
    .return ($P1636)
.end


.namespace []
.sub "" :load :init :subid("post93") :outer("10_1280467473.99327")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1280467473.99327" 
    .local pmc block
    set block, $P12
    $P1639 = get_root_global ["parrot"], "P6metaclass"
    $P1639."new_class"("Regex::P6Regex::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block13"  :subid("11_1280467473.99327") :outer("10_1280467473.99327")
.annotate 'line', 4
    .const 'Sub' $P1611 = "90_1280467473.99327" 
    capture_lex $P1611
    .const 'Sub' $P1591 = "89_1280467473.99327" 
    capture_lex $P1591
    .const 'Sub' $P1559 = "88_1280467473.99327" 
    capture_lex $P1559
    .const 'Sub' $P1490 = "84_1280467473.99327" 
    capture_lex $P1490
    .const 'Sub' $P1422 = "82_1280467473.99327" 
    capture_lex $P1422
    .const 'Sub' $P1350 = "79_1280467473.99327" 
    capture_lex $P1350
    .const 'Sub' $P1336 = "78_1280467473.99327" 
    capture_lex $P1336
    .const 'Sub' $P1312 = "77_1280467473.99327" 
    capture_lex $P1312
    .const 'Sub' $P1294 = "76_1280467473.99327" 
    capture_lex $P1294
    .const 'Sub' $P1280 = "75_1280467473.99327" 
    capture_lex $P1280
    .const 'Sub' $P1267 = "74_1280467473.99327" 
    capture_lex $P1267
    .const 'Sub' $P1236 = "73_1280467473.99327" 
    capture_lex $P1236
    .const 'Sub' $P1205 = "72_1280467473.99327" 
    capture_lex $P1205
    .const 'Sub' $P1189 = "71_1280467473.99327" 
    capture_lex $P1189
    .const 'Sub' $P1173 = "70_1280467473.99327" 
    capture_lex $P1173
    .const 'Sub' $P1157 = "69_1280467473.99327" 
    capture_lex $P1157
    .const 'Sub' $P1141 = "68_1280467473.99327" 
    capture_lex $P1141
    .const 'Sub' $P1125 = "67_1280467473.99327" 
    capture_lex $P1125
    .const 'Sub' $P1109 = "66_1280467473.99327" 
    capture_lex $P1109
    .const 'Sub' $P1093 = "65_1280467473.99327" 
    capture_lex $P1093
    .const 'Sub' $P1069 = "64_1280467473.99327" 
    capture_lex $P1069
    .const 'Sub' $P1054 = "63_1280467473.99327" 
    capture_lex $P1054
    .const 'Sub' $P996 = "62_1280467473.99327" 
    capture_lex $P996
    .const 'Sub' $P975 = "61_1280467473.99327" 
    capture_lex $P975
    .const 'Sub' $P953 = "60_1280467473.99327" 
    capture_lex $P953
    .const 'Sub' $P943 = "59_1280467473.99327" 
    capture_lex $P943
    .const 'Sub' $P933 = "58_1280467473.99327" 
    capture_lex $P933
    .const 'Sub' $P923 = "57_1280467473.99327" 
    capture_lex $P923
    .const 'Sub' $P911 = "56_1280467473.99327" 
    capture_lex $P911
    .const 'Sub' $P899 = "55_1280467473.99327" 
    capture_lex $P899
    .const 'Sub' $P887 = "54_1280467473.99327" 
    capture_lex $P887
    .const 'Sub' $P875 = "53_1280467473.99327" 
    capture_lex $P875
    .const 'Sub' $P863 = "52_1280467473.99327" 
    capture_lex $P863
    .const 'Sub' $P851 = "51_1280467473.99327" 
    capture_lex $P851
    .const 'Sub' $P839 = "50_1280467473.99327" 
    capture_lex $P839
    .const 'Sub' $P827 = "49_1280467473.99327" 
    capture_lex $P827
    .const 'Sub' $P799 = "48_1280467473.99327" 
    capture_lex $P799
    .const 'Sub' $P771 = "47_1280467473.99327" 
    capture_lex $P771
    .const 'Sub' $P753 = "46_1280467473.99327" 
    capture_lex $P753
    .const 'Sub' $P743 = "45_1280467473.99327" 
    capture_lex $P743
    .const 'Sub' $P725 = "44_1280467473.99327" 
    capture_lex $P725
    .const 'Sub' $P652 = "42_1280467473.99327" 
    capture_lex $P652
    .const 'Sub' $P635 = "41_1280467473.99327" 
    capture_lex $P635
    .const 'Sub' $P620 = "40_1280467473.99327" 
    capture_lex $P620
    .const 'Sub' $P605 = "39_1280467473.99327" 
    capture_lex $P605
    .const 'Sub' $P579 = "38_1280467473.99327" 
    capture_lex $P579
    .const 'Sub' $P528 = "36_1280467473.99327" 
    capture_lex $P528
    .const 'Sub' $P460 = "34_1280467473.99327" 
    capture_lex $P460
    .const 'Sub' $P404 = "31_1280467473.99327" 
    capture_lex $P404
    .const 'Sub' $P389 = "30_1280467473.99327" 
    capture_lex $P389
    .const 'Sub' $P363 = "28_1280467473.99327" 
    capture_lex $P363
    .const 'Sub' $P346 = "27_1280467473.99327" 
    capture_lex $P346
    .const 'Sub' $P312 = "26_1280467473.99327" 
    capture_lex $P312
    .const 'Sub' $P57 = "13_1280467473.99327" 
    capture_lex $P57
    .const 'Sub' $P16 = "12_1280467473.99327" 
    capture_lex $P16
    get_global $P15, "@MODIFIERS"
    unless_null $P15, vivify_95
    $P15 = root_new ['parrot';'ResizablePMCArray']
    set_global "@MODIFIERS", $P15
  vivify_95:
.annotate 'line', 492
    .const 'Sub' $P16 = "12_1280467473.99327" 
    newclosure $P56, $P16
    .lex "buildsub", $P56
.annotate 'line', 510
    .const 'Sub' $P57 = "13_1280467473.99327" 
    newclosure $P311, $P57
    .lex "capnames", $P311
.annotate 'line', 576
    .const 'Sub' $P312 = "26_1280467473.99327" 
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
.annotate 'line', 485
    find_lex $P1588, "buildsub"
    find_lex $P1589, "capnames"
    find_lex $P1590, "backmod"
.annotate 'line', 589
    .const 'Sub' $P1611 = "90_1280467473.99327" 
    newclosure $P1628, $P1611
.annotate 'line', 4
    .return ($P1628)
    .const 'Sub' $P1630 = "91_1280467473.99327" 
    .return ($P1630)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "" :load :init :subid("post94") :outer("11_1280467473.99327")
.annotate 'line', 4
    get_hll_global $P14, ["Regex";"P6Regex";"Actions"], "_block13" 
    .local pmc block
    set block, $P14
.annotate 'line', 7

        $P1633 = new ['ResizablePMCArray']
        $P0 = new ['Hash']
        push $P1633, $P0
    
    set_global "@MODIFIERS", $P1633
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "buildsub"  :subid("12_1280467473.99327") :outer("11_1280467473.99327")
    .param pmc param_19
    .param pmc param_20 :optional
    .param int has_param_20 :opt_flag
.annotate 'line', 492
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
.annotate 'line', 493
    $P23 = root_new ['parrot';'Hash']
    .lex "%capnames", $P23
    find_lex $P24, "$rpast"
    $P25 = "capnames"($P24, 0)
    store_lex "%capnames", $P25
.annotate 'line', 494
    new $P26, "Integer"
    assign $P26, 0
    find_lex $P27, "%capnames"
    unless_null $P27, vivify_97
    $P27 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P27
  vivify_97:
    set $P27[""], $P26
.annotate 'line', 495
    get_hll_global $P28, ["PAST"], "Regex"
.annotate 'line', 496
    get_hll_global $P29, ["PAST"], "Regex"
    $P30 = $P29."new"("scan" :named("pasttype"))
    find_lex $P31, "$rpast"
.annotate 'line', 498
    get_hll_global $P32, ["PAST"], "Regex"
.annotate 'line', 499
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
.annotate 'line', 498
    find_lex $P41, "%capnames"
    $P42 = $P28."new"($P30, $P31, $P40, "concat" :named("pasttype"), $P41 :named("capnames"))
.annotate 'line', 495
    store_lex "$rpast", $P42
.annotate 'line', 503
    find_lex $P44, "$block"
    $P45 = $P44."symbol"(unicode:"$\x{a2}")
    if $P45, unless_43_end
    find_lex $P46, "$block"
    $P46."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
  unless_43_end:
.annotate 'line', 504
    find_lex $P48, "$block"
    $P49 = $P48."symbol"("$/")
    if $P49, unless_47_end
    find_lex $P50, "$block"
    $P50."symbol"("$/", "lexical" :named("scope"))
  unless_47_end:
.annotate 'line', 505
    find_lex $P51, "$block"
    find_lex $P52, "$rpast"
    $P51."push"($P52)
.annotate 'line', 506
    find_lex $P53, "$block"
    $P53."blocktype"("method")
    find_lex $P54, "$block"
.annotate 'line', 492
    .return ($P54)
  control_17:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P55, exception, "payload"
    .return ($P55)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "capnames"  :subid("13_1280467473.99327") :outer("11_1280467473.99327")
    .param pmc param_60
    .param pmc param_61
.annotate 'line', 510
    .const 'Sub' $P286 = "24_1280467473.99327" 
    capture_lex $P286
    .const 'Sub' $P223 = "21_1280467473.99327" 
    capture_lex $P223
    .const 'Sub' $P181 = "19_1280467473.99327" 
    capture_lex $P181
    .const 'Sub' $P139 = "17_1280467473.99327" 
    capture_lex $P139
    .const 'Sub' $P72 = "14_1280467473.99327" 
    capture_lex $P72
    new $P59, 'ExceptionHandler'
    set_addr $P59, control_58
    $P59."handle_types"(.CONTROL_RETURN)
    push_eh $P59
    .lex "$ast", param_60
    .lex "$count", param_61
.annotate 'line', 511
    $P62 = root_new ['parrot';'Hash']
    .lex "%capnames", $P62
.annotate 'line', 512
    new $P63, "Undef"
    .lex "$pasttype", $P63
.annotate 'line', 510
    find_lex $P64, "%capnames"
.annotate 'line', 512
    find_lex $P65, "$ast"
    $P66 = $P65."pasttype"()
    store_lex "$pasttype", $P66
.annotate 'line', 513
    find_lex $P68, "$pasttype"
    set $S69, $P68
    iseq $I70, $S69, "alt"
    if $I70, if_67
.annotate 'line', 526
    find_lex $P130, "$pasttype"
    set $S131, $P130
    iseq $I132, $S131, "concat"
    if $I132, if_129
.annotate 'line', 535
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
.annotate 'line', 548
    find_lex $P219, "$pasttype"
    set $S220, $P219
    iseq $I221, $S220, "subcapture"
    if $I221, if_218
.annotate 'line', 565
    find_lex $P282, "$pasttype"
    set $S283, $P282
    iseq $I284, $S283, "quant"
    unless $I284, if_281_end
    .const 'Sub' $P286 = "24_1280467473.99327" 
    capture_lex $P286
    $P286()
  if_281_end:
    goto if_218_end
  if_218:
.annotate 'line', 548
    .const 'Sub' $P223 = "21_1280467473.99327" 
    capture_lex $P223
    $P223()
  if_218_end:
    goto if_171_end
  if_171:
.annotate 'line', 535
    .const 'Sub' $P181 = "19_1280467473.99327" 
    capture_lex $P181
    $P181()
  if_171_end:
    goto if_129_end
  if_129:
.annotate 'line', 527
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
    .const 'Sub' $P139 = "17_1280467473.99327" 
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
.annotate 'line', 526
    goto if_67_end
  if_67:
.annotate 'line', 513
    .const 'Sub' $P72 = "14_1280467473.99327" 
    capture_lex $P72
    $P72()
  if_67_end:
.annotate 'line', 572
    find_lex $P307, "$count"
    find_lex $P308, "%capnames"
    unless_null $P308, vivify_141
    $P308 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P308
  vivify_141:
    set $P308[""], $P307
    find_lex $P309, "%capnames"
.annotate 'line', 510
    .return ($P309)
  control_58:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P310, exception, "payload"
    .return ($P310)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "_block285"  :anon :subid("24_1280467473.99327") :outer("13_1280467473.99327")
.annotate 'line', 565
    .const 'Sub' $P297 = "25_1280467473.99327" 
    capture_lex $P297
.annotate 'line', 566
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
.annotate 'line', 567
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
    .const 'Sub' $P297 = "25_1280467473.99327" 
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
.annotate 'line', 570
    find_lex $P305, "%astcap"
    unless_null $P305, vivify_105
    $P305 = root_new ['parrot';'Hash']
  vivify_105:
    set $P306, $P305[""]
    unless_null $P306, vivify_106
    new $P306, "Undef"
  vivify_106:
    store_lex "$count", $P306
.annotate 'line', 565
    .return ($P306)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block296"  :anon :subid("25_1280467473.99327") :outer("24_1280467473.99327")
    .param pmc param_298
.annotate 'line', 567
    .lex "$_", param_298
.annotate 'line', 568
    new $P299, "Integer"
    assign $P299, 2
    find_lex $P300, "$_"
    find_lex $P301, "%capnames"
    unless_null $P301, vivify_104
    $P301 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P301
  vivify_104:
    set $P301[$P300], $P299
.annotate 'line', 567
    .return ($P299)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "_block222"  :anon :subid("21_1280467473.99327") :outer("13_1280467473.99327")
.annotate 'line', 548
    .const 'Sub' $P263 = "23_1280467473.99327" 
    capture_lex $P263
    .const 'Sub' $P235 = "22_1280467473.99327" 
    capture_lex $P235
.annotate 'line', 549
    new $P224, "Undef"
    .lex "$name", $P224
.annotate 'line', 550
    $P225 = root_new ['parrot';'ResizablePMCArray']
    .lex "@names", $P225
.annotate 'line', 559
    $P226 = root_new ['parrot';'Hash']
    .lex "%x", $P226
.annotate 'line', 549
    find_lex $P227, "$ast"
    $P228 = $P227."name"()
    store_lex "$name", $P228
.annotate 'line', 550

            $P0 = find_lex '$name'
            $S0 = $P0
            $P229 = split '=', $S0
        
    store_lex "@names", $P229
.annotate 'line', 555
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
    .const 'Sub' $P235 = "22_1280467473.99327" 
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
.annotate 'line', 559
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
.annotate 'line', 560
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
    .const 'Sub' $P263 = "23_1280467473.99327" 
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
.annotate 'line', 563
    find_lex $P279, "%x"
    unless_null $P279, vivify_117
    $P279 = root_new ['parrot';'Hash']
  vivify_117:
    set $P280, $P279[""]
    unless_null $P280, vivify_118
    new $P280, "Undef"
  vivify_118:
    store_lex "$count", $P280
.annotate 'line', 548
    .return ($P280)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block234"  :anon :subid("22_1280467473.99327") :outer("21_1280467473.99327")
    .param pmc param_236
.annotate 'line', 555
    .lex "$_", param_236
.annotate 'line', 556
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
.annotate 'line', 557
    new $P248, "Integer"
    assign $P248, 1
    find_lex $P249, "$_"
    find_lex $P250, "%capnames"
    unless_null $P250, vivify_108
    $P250 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P250
  vivify_108:
    set $P250[$P249], $P248
.annotate 'line', 555
    .return ($P248)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block262"  :anon :subid("23_1280467473.99327") :outer("21_1280467473.99327")
    .param pmc param_264
.annotate 'line', 560
    .lex "$_", param_264
.annotate 'line', 561
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
.annotate 'line', 560
    .return ($P273)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "_block180"  :anon :subid("19_1280467473.99327") :outer("13_1280467473.99327")
.annotate 'line', 535
    .const 'Sub' $P199 = "20_1280467473.99327" 
    capture_lex $P199
.annotate 'line', 536
    new $P182, "Undef"
    .lex "$name", $P182
.annotate 'line', 538
    $P183 = root_new ['parrot';'ResizablePMCArray']
    .lex "@names", $P183
.annotate 'line', 536
    find_lex $P184, "$ast"
    $P185 = $P184."name"()
    store_lex "$name", $P185
.annotate 'line', 537
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
.annotate 'line', 538

            $P0 = find_lex '$name'
            $S0 = $P0
            $P193 = split '=', $S0
        
    store_lex "@names", $P193
.annotate 'line', 543
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
    .const 'Sub' $P199 = "20_1280467473.99327" 
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
.annotate 'line', 535
    .return ($P194)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block198"  :anon :subid("20_1280467473.99327") :outer("19_1280467473.99327")
    .param pmc param_200
.annotate 'line', 543
    .lex "$_", param_200
.annotate 'line', 544
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
.annotate 'line', 545
    new $P212, "Integer"
    assign $P212, 1
    find_lex $P213, "$_"
    find_lex $P214, "%capnames"
    unless_null $P214, vivify_120
    $P214 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P214
  vivify_120:
    set $P214[$P213], $P212
.annotate 'line', 543
    .return ($P212)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "_block138"  :anon :subid("17_1280467473.99327") :outer("13_1280467473.99327")
    .param pmc param_141
.annotate 'line', 527
    .const 'Sub' $P150 = "18_1280467473.99327" 
    capture_lex $P150
.annotate 'line', 528
    $P140 = root_new ['parrot';'Hash']
    .lex "%x", $P140
    .lex "$_", param_141
    find_lex $P142, "$_"
    find_lex $P143, "$count"
    $P144 = "capnames"($P142, $P143)
    store_lex "%x", $P144
.annotate 'line', 529
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
    .const 'Sub' $P150 = "18_1280467473.99327" 
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
.annotate 'line', 532
    find_lex $P166, "%x"
    unless_null $P166, vivify_128
    $P166 = root_new ['parrot';'Hash']
  vivify_128:
    set $P167, $P166[""]
    unless_null $P167, vivify_129
    new $P167, "Undef"
  vivify_129:
    store_lex "$count", $P167
.annotate 'line', 527
    .return ($P167)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block149"  :anon :subid("18_1280467473.99327") :outer("17_1280467473.99327")
    .param pmc param_151
.annotate 'line', 529
    .lex "$_", param_151
.annotate 'line', 530
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
.annotate 'line', 529
    .return ($P160)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "_block71"  :anon :subid("14_1280467473.99327") :outer("13_1280467473.99327")
.annotate 'line', 513
    .const 'Sub' $P81 = "15_1280467473.99327" 
    capture_lex $P81
.annotate 'line', 514
    new $P73, "Undef"
    .lex "$max", $P73
    find_lex $P74, "$count"
    store_lex "$max", $P74
.annotate 'line', 515
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
    .const 'Sub' $P81 = "15_1280467473.99327" 
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
.annotate 'line', 524
    find_lex $P128, "$max"
    store_lex "$count", $P128
.annotate 'line', 513
    .return ($P128)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "_block80"  :anon :subid("15_1280467473.99327") :outer("14_1280467473.99327")
    .param pmc param_83
.annotate 'line', 515
    .const 'Sub' $P92 = "16_1280467473.99327" 
    capture_lex $P92
.annotate 'line', 516
    $P82 = root_new ['parrot';'Hash']
    .lex "%x", $P82
    .lex "$_", param_83
    find_lex $P84, "$_"
    find_lex $P85, "$count"
    $P86 = "capnames"($P84, $P85)
    store_lex "%x", $P86
.annotate 'line', 517
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
    .const 'Sub' $P92 = "16_1280467473.99327" 
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
.annotate 'line', 522
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
.annotate 'line', 515
    .return ($P115)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block91"  :anon :subid("16_1280467473.99327") :outer("15_1280467473.99327")
    .param pmc param_93
.annotate 'line', 517
    .lex "$_", param_93
.annotate 'line', 518
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
.annotate 'line', 519
    find_lex $P110, "$_"
    find_lex $P111, "%capnames"
    unless_null $P111, vivify_136
    $P111 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P111
  vivify_136:
    set $P111[$P110], $P94
.annotate 'line', 517
    .return ($P94)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backmod"  :subid("26_1280467473.99327") :outer("11_1280467473.99327")
    .param pmc param_315
    .param pmc param_316
.annotate 'line', 576
    new $P314, 'ExceptionHandler'
    set_addr $P314, control_313
    $P314."handle_types"(.CONTROL_RETURN)
    push_eh $P314
    .lex "$ast", param_315
    .lex "$backmod", param_316
.annotate 'line', 577
    find_lex $P318, "$backmod"
    set $S319, $P318
    iseq $I320, $S319, ":"
    if $I320, if_317
.annotate 'line', 578
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
.annotate 'line', 579
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
.annotate 'line', 578
    find_lex $P331, "$ast"
    $P331."backtrack"("f")
  if_322_end:
    goto if_317_end
  if_317:
.annotate 'line', 577
    find_lex $P321, "$ast"
    $P321."backtrack"("r")
  if_317_end:
    find_lex $P342, "$ast"
.annotate 'line', 576
    .return ($P342)
  control_313:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P343, exception, "payload"
    .return ($P343)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "arg"  :subid("27_1280467473.99327") :method :outer("11_1280467473.99327")
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
.sub "arglist"  :subid("28_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_366
.annotate 'line', 18
    .const 'Sub' $P376 = "29_1280467473.99327" 
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
    .const 'Sub' $P376 = "29_1280467473.99327" 
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
.sub "_block375"  :anon :subid("29_1280467473.99327") :outer("28_1280467473.99327")
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
.sub "TOP"  :subid("30_1280467473.99327") :method :outer("11_1280467473.99327")
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
.sub "nibbler"  :subid("31_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_407
    .param pmc param_408 :optional
    .param int has_param_408 :opt_flag
.annotate 'line', 30
    .const 'Sub' $P443 = "33_1280467473.99327" 
    capture_lex $P443
    .const 'Sub' $P416 = "32_1280467473.99327" 
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
.annotate 'line', 39
    new $P410, "Undef"
    .lex "$past", $P410
.annotate 'line', 31
    find_lex $P412, "$key"
    set $S413, $P412
    iseq $I414, $S413, "open"
    unless $I414, if_411_end
    .const 'Sub' $P416 = "32_1280467473.99327" 
    capture_lex $P416
    $P416()
  if_411_end:
.annotate 'line', 38
    get_global $P427, "@MODIFIERS"
    $P427."shift"()
    find_lex $P428, "$past"
.annotate 'line', 40
    find_lex $P430, "$/"
    unless_null $P430, vivify_156
    $P430 = root_new ['parrot';'Hash']
  vivify_156:
    set $P431, $P430["termish"]
    unless_null $P431, vivify_157
    new $P431, "Undef"
  vivify_157:
    set $N432, $P431
    isgt $I433, $N432, 1.0
    if $I433, if_429
.annotate 'line', 47
    find_lex $P452, "$/"
    unless_null $P452, vivify_158
    $P452 = root_new ['parrot';'Hash']
  vivify_158:
    set $P453, $P452["termish"]
    unless_null $P453, vivify_159
    $P453 = root_new ['parrot';'ResizablePMCArray']
  vivify_159:
    set $P454, $P453[0]
    unless_null $P454, vivify_160
    new $P454, "Undef"
  vivify_160:
    $P455 = $P454."ast"()
    store_lex "$past", $P455
.annotate 'line', 46
    goto if_429_end
  if_429:
.annotate 'line', 41
    get_hll_global $P434, ["PAST"], "Regex"
    find_lex $P435, "$/"
    $P436 = $P434."new"("alt" :named("pasttype"), $P435 :named("node"))
    store_lex "$past", $P436
.annotate 'line', 42
    find_lex $P438, "$/"
    unless_null $P438, vivify_161
    $P438 = root_new ['parrot';'Hash']
  vivify_161:
    set $P439, $P438["termish"]
    unless_null $P439, vivify_162
    new $P439, "Undef"
  vivify_162:
    defined $I440, $P439
    unless $I440, for_undef_163
    iter $P437, $P439
    new $P450, 'ExceptionHandler'
    set_addr $P450, loop449_handler
    $P450."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P450
  loop449_test:
    unless $P437, loop449_done
    shift $P441, $P437
  loop449_redo:
    .const 'Sub' $P443 = "33_1280467473.99327" 
    capture_lex $P443
    $P443($P441)
  loop449_next:
    goto loop449_test
  loop449_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P451, exception, 'type'
    eq $P451, .CONTROL_LOOP_NEXT, loop449_next
    eq $P451, .CONTROL_LOOP_REDO, loop449_redo
  loop449_done:
    pop_eh 
  for_undef_163:
  if_429_end:
.annotate 'line', 49
    find_lex $P456, "$/"
    find_lex $P457, "$past"
    $P458 = $P456."!make"($P457)
.annotate 'line', 30
    .return ($P458)
  control_405:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P459, exception, "payload"
    .return ($P459)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "_block415"  :anon :subid("32_1280467473.99327") :outer("31_1280467473.99327")
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
    find_lex $P421, "%old"
    clone $P422, $P421
    store_lex "%new", $P422
.annotate 'line', 34
    get_global $P423, "@MODIFIERS"
    find_lex $P424, "%new"
    $P423."unshift"($P424)
.annotate 'line', 35
    new $P425, "Exception"
    set $P425['type'], .CONTROL_RETURN
    new $P426, "Integer"
    assign $P426, 1
    setattribute $P425, 'payload', $P426
    throw $P425
.annotate 'line', 31
    .return ()
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block442"  :anon :subid("33_1280467473.99327") :outer("31_1280467473.99327")
    .param pmc param_444
.annotate 'line', 42
    .lex "$_", param_444
.annotate 'line', 43
    find_lex $P445, "$past"
    find_lex $P446, "$_"
    $P447 = $P446."ast"()
    $P448 = $P445."push"($P447)
.annotate 'line', 42
    .return ($P448)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "termish"  :subid("34_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_463
.annotate 'line', 52
    .const 'Sub' $P476 = "35_1280467473.99327" 
    capture_lex $P476
    new $P462, 'ExceptionHandler'
    set_addr $P462, control_461
    $P462."handle_types"(.CONTROL_RETURN)
    push_eh $P462
    .lex "self", self
    .lex "$/", param_463
.annotate 'line', 53
    new $P464, "Undef"
    .lex "$past", $P464
.annotate 'line', 54
    new $P465, "Undef"
    .lex "$lastlit", $P465
.annotate 'line', 53
    get_hll_global $P466, ["PAST"], "Regex"
    find_lex $P467, "$/"
    $P468 = $P466."new"("concat" :named("pasttype"), $P467 :named("node"))
    store_lex "$past", $P468
.annotate 'line', 54
    new $P469, "Integer"
    assign $P469, 0
    store_lex "$lastlit", $P469
.annotate 'line', 55
    find_lex $P471, "$/"
    unless_null $P471, vivify_164
    $P471 = root_new ['parrot';'Hash']
  vivify_164:
    set $P472, $P471["noun"]
    unless_null $P472, vivify_165
    new $P472, "Undef"
  vivify_165:
    defined $I473, $P472
    unless $I473, for_undef_166
    iter $P470, $P472
    new $P522, 'ExceptionHandler'
    set_addr $P522, loop521_handler
    $P522."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P522
  loop521_test:
    unless $P470, loop521_done
    shift $P474, $P470
  loop521_redo:
    .const 'Sub' $P476 = "35_1280467473.99327" 
    capture_lex $P476
    $P476($P474)
  loop521_next:
    goto loop521_test
  loop521_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P523, exception, 'type'
    eq $P523, .CONTROL_LOOP_NEXT, loop521_next
    eq $P523, .CONTROL_LOOP_REDO, loop521_redo
  loop521_done:
    pop_eh 
  for_undef_166:
.annotate 'line', 70
    find_lex $P524, "$/"
    find_lex $P525, "$past"
    $P526 = $P524."!make"($P525)
.annotate 'line', 52
    .return ($P526)
  control_461:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P527, exception, "payload"
    .return ($P527)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block475"  :anon :subid("35_1280467473.99327") :outer("34_1280467473.99327")
    .param pmc param_478
.annotate 'line', 56
    new $P477, "Undef"
    .lex "$ast", $P477
    .lex "$_", param_478
    find_lex $P479, "$_"
    $P480 = $P479."ast"()
    store_lex "$ast", $P480
.annotate 'line', 57
    find_lex $P483, "$ast"
    if $P483, if_482
    set $P481, $P483
    goto if_482_end
  if_482:
.annotate 'line', 58
    find_lex $P490, "$lastlit"
    if $P490, if_489
    set $P488, $P490
    goto if_489_end
  if_489:
    find_lex $P491, "$ast"
    $S492 = $P491."pasttype"()
    iseq $I493, $S492, "literal"
    new $P488, 'Integer'
    set $P488, $I493
  if_489_end:
    if $P488, if_487
    set $P486, $P488
    goto if_487_end
  if_487:
.annotate 'line', 59
    get_hll_global $P494, ["PAST"], "Node"
    find_lex $P495, "$ast"
    unless_null $P495, vivify_167
    $P495 = root_new ['parrot';'ResizablePMCArray']
  vivify_167:
    set $P496, $P495[0]
    unless_null $P496, vivify_168
    new $P496, "Undef"
  vivify_168:
    $P497 = $P494."ACCEPTS"($P496)
    isfalse $I498, $P497
    new $P486, 'Integer'
    set $P486, $I498
  if_487_end:
    if $P486, if_485
.annotate 'line', 63
    find_lex $P505, "$past"
    find_lex $P506, "$ast"
    $P505."push"($P506)
.annotate 'line', 64
    find_lex $P511, "$ast"
    $S512 = $P511."pasttype"()
    iseq $I513, $S512, "literal"
    if $I513, if_510
    new $P509, 'Integer'
    set $P509, $I513
    goto if_510_end
  if_510:
.annotate 'line', 65
    get_hll_global $P514, ["PAST"], "Node"
    find_lex $P515, "$ast"
    unless_null $P515, vivify_169
    $P515 = root_new ['parrot';'ResizablePMCArray']
  vivify_169:
    set $P516, $P515[0]
    unless_null $P516, vivify_170
    new $P516, "Undef"
  vivify_170:
    $P517 = $P514."ACCEPTS"($P516)
    isfalse $I518, $P517
    new $P509, 'Integer'
    set $P509, $I518
  if_510_end:
    if $P509, if_508
    new $P520, "Integer"
    assign $P520, 0
    set $P507, $P520
    goto if_508_end
  if_508:
    find_lex $P519, "$ast"
    set $P507, $P519
  if_508_end:
.annotate 'line', 66
    store_lex "$lastlit", $P507
.annotate 'line', 62
    set $P484, $P507
.annotate 'line', 59
    goto if_485_end
  if_485:
.annotate 'line', 60
    find_lex $P499, "$lastlit"
    unless_null $P499, vivify_171
    $P499 = root_new ['parrot';'ResizablePMCArray']
  vivify_171:
    set $P500, $P499[0]
    unless_null $P500, vivify_172
    new $P500, "Undef"
  vivify_172:
    find_lex $P501, "$ast"
    unless_null $P501, vivify_173
    $P501 = root_new ['parrot';'ResizablePMCArray']
  vivify_173:
    set $P502, $P501[0]
    unless_null $P502, vivify_174
    new $P502, "Undef"
  vivify_174:
    concat $P503, $P500, $P502
    find_lex $P504, "$lastlit"
    unless_null $P504, vivify_175
    $P504 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$lastlit", $P504
  vivify_175:
    set $P504[0], $P503
.annotate 'line', 59
    set $P484, $P503
  if_485_end:
.annotate 'line', 57
    set $P481, $P484
  if_482_end:
.annotate 'line', 55
    .return ($P481)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "quantified_atom"  :subid("36_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_531
.annotate 'line', 73
    .const 'Sub' $P540 = "37_1280467473.99327" 
    capture_lex $P540
    new $P530, 'ExceptionHandler'
    set_addr $P530, control_529
    $P530."handle_types"(.CONTROL_RETURN)
    push_eh $P530
    .lex "self", self
    .lex "$/", param_531
.annotate 'line', 74
    new $P532, "Undef"
    .lex "$past", $P532
    find_lex $P533, "$/"
    unless_null $P533, vivify_176
    $P533 = root_new ['parrot';'Hash']
  vivify_176:
    set $P534, $P533["atom"]
    unless_null $P534, vivify_177
    new $P534, "Undef"
  vivify_177:
    $P535 = $P534."ast"()
    store_lex "$past", $P535
.annotate 'line', 75
    find_lex $P537, "$/"
    unless_null $P537, vivify_178
    $P537 = root_new ['parrot';'Hash']
  vivify_178:
    set $P538, $P537["quantifier"]
    unless_null $P538, vivify_179
    new $P538, "Undef"
  vivify_179:
    if $P538, if_536
.annotate 'line', 81
    find_lex $P555, "$/"
    unless_null $P555, vivify_180
    $P555 = root_new ['parrot';'Hash']
  vivify_180:
    set $P556, $P555["backmod"]
    unless_null $P556, vivify_181
    $P556 = root_new ['parrot';'ResizablePMCArray']
  vivify_181:
    set $P557, $P556[0]
    unless_null $P557, vivify_182
    new $P557, "Undef"
  vivify_182:
    unless $P557, if_554_end
    find_lex $P558, "$past"
    find_lex $P559, "$/"
    unless_null $P559, vivify_183
    $P559 = root_new ['parrot';'Hash']
  vivify_183:
    set $P560, $P559["backmod"]
    unless_null $P560, vivify_184
    $P560 = root_new ['parrot';'ResizablePMCArray']
  vivify_184:
    set $P561, $P560[0]
    unless_null $P561, vivify_185
    new $P561, "Undef"
  vivify_185:
    "backmod"($P558, $P561)
  if_554_end:
    goto if_536_end
  if_536:
.annotate 'line', 75
    .const 'Sub' $P540 = "37_1280467473.99327" 
    capture_lex $P540
    $P540()
  if_536_end:
.annotate 'line', 82
    find_lex $P567, "$past"
    if $P567, if_566
    set $P565, $P567
    goto if_566_end
  if_566:
    find_lex $P568, "$past"
    $P569 = $P568."backtrack"()
    isfalse $I570, $P569
    new $P565, 'Integer'
    set $P565, $I570
  if_566_end:
    if $P565, if_564
    set $P563, $P565
    goto if_564_end
  if_564:
    get_global $P571, "@MODIFIERS"
    unless_null $P571, vivify_189
    $P571 = root_new ['parrot';'ResizablePMCArray']
  vivify_189:
    set $P572, $P571[0]
    unless_null $P572, vivify_190
    $P572 = root_new ['parrot';'Hash']
  vivify_190:
    set $P573, $P572["r"]
    unless_null $P573, vivify_191
    new $P573, "Undef"
  vivify_191:
    set $P563, $P573
  if_564_end:
    unless $P563, if_562_end
.annotate 'line', 83
    find_lex $P574, "$past"
    $P574."backtrack"("r")
  if_562_end:
.annotate 'line', 85
    find_lex $P575, "$/"
    find_lex $P576, "$past"
    $P577 = $P575."!make"($P576)
.annotate 'line', 73
    .return ($P577)
  control_529:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P578, exception, "payload"
    .return ($P578)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block539"  :anon :subid("37_1280467473.99327") :outer("36_1280467473.99327")
.annotate 'line', 77
    new $P541, "Undef"
    .lex "$qast", $P541
.annotate 'line', 76
    find_lex $P543, "$past"
    isfalse $I544, $P543
    unless $I544, if_542_end
    find_lex $P545, "$/"
    $P546 = $P545."CURSOR"()
    $P546."panic"("Quantifier follows nothing")
  if_542_end:
.annotate 'line', 77
    find_lex $P547, "$/"
    unless_null $P547, vivify_186
    $P547 = root_new ['parrot';'Hash']
  vivify_186:
    set $P548, $P547["quantifier"]
    unless_null $P548, vivify_187
    $P548 = root_new ['parrot';'ResizablePMCArray']
  vivify_187:
    set $P549, $P548[0]
    unless_null $P549, vivify_188
    new $P549, "Undef"
  vivify_188:
    $P550 = $P549."ast"()
    store_lex "$qast", $P550
.annotate 'line', 78
    find_lex $P551, "$qast"
    find_lex $P552, "$past"
    $P551."unshift"($P552)
.annotate 'line', 79
    find_lex $P553, "$qast"
    store_lex "$past", $P553
.annotate 'line', 75
    .return ($P553)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "atom"  :subid("38_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_582
.annotate 'line', 88
    new $P581, 'ExceptionHandler'
    set_addr $P581, control_580
    $P581."handle_types"(.CONTROL_RETURN)
    push_eh $P581
    .lex "self", self
    .lex "$/", param_582
.annotate 'line', 89
    new $P583, "Undef"
    .lex "$past", $P583
.annotate 'line', 88
    find_lex $P584, "$past"
.annotate 'line', 90
    find_lex $P586, "$/"
    unless_null $P586, vivify_192
    $P586 = root_new ['parrot';'Hash']
  vivify_192:
    set $P587, $P586["metachar"]
    unless_null $P587, vivify_193
    new $P587, "Undef"
  vivify_193:
    if $P587, if_585
.annotate 'line', 92
    get_hll_global $P591, ["PAST"], "Regex"
    find_lex $P592, "$/"
    set $S593, $P592
    find_lex $P594, "$/"
    $P595 = $P591."new"($S593, "literal" :named("pasttype"), $P594 :named("node"))
    store_lex "$past", $P595
.annotate 'line', 93
    get_global $P597, "@MODIFIERS"
    unless_null $P597, vivify_194
    $P597 = root_new ['parrot';'ResizablePMCArray']
  vivify_194:
    set $P598, $P597[0]
    unless_null $P598, vivify_195
    $P598 = root_new ['parrot';'Hash']
  vivify_195:
    set $P599, $P598["i"]
    unless_null $P599, vivify_196
    new $P599, "Undef"
  vivify_196:
    unless $P599, if_596_end
    find_lex $P600, "$past"
    $P600."subtype"("ignorecase")
  if_596_end:
.annotate 'line', 91
    goto if_585_end
  if_585:
.annotate 'line', 90
    find_lex $P588, "$/"
    unless_null $P588, vivify_197
    $P588 = root_new ['parrot';'Hash']
  vivify_197:
    set $P589, $P588["metachar"]
    unless_null $P589, vivify_198
    new $P589, "Undef"
  vivify_198:
    $P590 = $P589."ast"()
    store_lex "$past", $P590
  if_585_end:
.annotate 'line', 95
    find_lex $P601, "$/"
    find_lex $P602, "$past"
    $P603 = $P601."!make"($P602)
.annotate 'line', 88
    .return ($P603)
  control_580:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P604, exception, "payload"
    .return ($P604)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "quantifier:sym<*>"  :subid("39_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_608
.annotate 'line', 98
    new $P607, 'ExceptionHandler'
    set_addr $P607, control_606
    $P607."handle_types"(.CONTROL_RETURN)
    push_eh $P607
    .lex "self", self
    .lex "$/", param_608
.annotate 'line', 99
    new $P609, "Undef"
    .lex "$past", $P609
    get_hll_global $P610, ["PAST"], "Regex"
    find_lex $P611, "$/"
    $P612 = $P610."new"("quant" :named("pasttype"), $P611 :named("node"))
    store_lex "$past", $P612
.annotate 'line', 100
    find_lex $P613, "$/"
    find_lex $P614, "$past"
    find_lex $P615, "$/"
    unless_null $P615, vivify_199
    $P615 = root_new ['parrot';'Hash']
  vivify_199:
    set $P616, $P615["backmod"]
    unless_null $P616, vivify_200
    new $P616, "Undef"
  vivify_200:
    $P617 = "backmod"($P614, $P616)
    $P618 = $P613."!make"($P617)
.annotate 'line', 98
    .return ($P618)
  control_606:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P619, exception, "payload"
    .return ($P619)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "quantifier:sym<+>"  :subid("40_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_623
.annotate 'line', 103
    new $P622, 'ExceptionHandler'
    set_addr $P622, control_621
    $P622."handle_types"(.CONTROL_RETURN)
    push_eh $P622
    .lex "self", self
    .lex "$/", param_623
.annotate 'line', 104
    new $P624, "Undef"
    .lex "$past", $P624
    get_hll_global $P625, ["PAST"], "Regex"
    find_lex $P626, "$/"
    $P627 = $P625."new"("quant" :named("pasttype"), 1 :named("min"), $P626 :named("node"))
    store_lex "$past", $P627
.annotate 'line', 105
    find_lex $P628, "$/"
    find_lex $P629, "$past"
    find_lex $P630, "$/"
    unless_null $P630, vivify_201
    $P630 = root_new ['parrot';'Hash']
  vivify_201:
    set $P631, $P630["backmod"]
    unless_null $P631, vivify_202
    new $P631, "Undef"
  vivify_202:
    $P632 = "backmod"($P629, $P631)
    $P633 = $P628."!make"($P632)
.annotate 'line', 103
    .return ($P633)
  control_621:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P634, exception, "payload"
    .return ($P634)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "quantifier:sym<?>"  :subid("41_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_638
.annotate 'line', 108
    new $P637, 'ExceptionHandler'
    set_addr $P637, control_636
    $P637."handle_types"(.CONTROL_RETURN)
    push_eh $P637
    .lex "self", self
    .lex "$/", param_638
.annotate 'line', 109
    new $P639, "Undef"
    .lex "$past", $P639
    get_hll_global $P640, ["PAST"], "Regex"
    find_lex $P641, "$/"
    $P642 = $P640."new"("quant" :named("pasttype"), 0 :named("min"), 1 :named("max"), $P641 :named("node"))
    store_lex "$past", $P642
.annotate 'line', 110
    find_lex $P643, "$/"
    find_lex $P644, "$past"
    find_lex $P645, "$/"
    unless_null $P645, vivify_203
    $P645 = root_new ['parrot';'Hash']
  vivify_203:
    set $P646, $P645["backmod"]
    unless_null $P646, vivify_204
    new $P646, "Undef"
  vivify_204:
    $P647 = "backmod"($P644, $P646)
    $P643."!make"($P647)
.annotate 'line', 111
    find_lex $P648, "$/"
    find_lex $P649, "$past"
    $P650 = $P648."!make"($P649)
.annotate 'line', 108
    .return ($P650)
  control_636:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P651, exception, "payload"
    .return ($P651)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "quantifier:sym<**>"  :subid("42_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_655
.annotate 'line', 114
    .const 'Sub' $P670 = "43_1280467473.99327" 
    capture_lex $P670
    new $P654, 'ExceptionHandler'
    set_addr $P654, control_653
    $P654."handle_types"(.CONTROL_RETURN)
    push_eh $P654
    .lex "self", self
    .lex "$/", param_655
.annotate 'line', 115
    new $P656, "Undef"
    .lex "$past", $P656
.annotate 'line', 116
    new $P657, "Undef"
    .lex "$ws", $P657
.annotate 'line', 114
    find_lex $P658, "$past"
.annotate 'line', 116
    find_lex $P661, "$/"
    unless_null $P661, vivify_205
    $P661 = root_new ['parrot';'Hash']
  vivify_205:
    set $P662, $P661["normspace"]
    unless_null $P662, vivify_206
    new $P662, "Undef"
  vivify_206:
    if $P662, if_660
    set $P659, $P662
    goto if_660_end
  if_660:
    get_global $P663, "@MODIFIERS"
    unless_null $P663, vivify_207
    $P663 = root_new ['parrot';'ResizablePMCArray']
  vivify_207:
    set $P664, $P663[0]
    unless_null $P664, vivify_208
    $P664 = root_new ['parrot';'Hash']
  vivify_208:
    set $P665, $P664["s"]
    unless_null $P665, vivify_209
    new $P665, "Undef"
  vivify_209:
    set $P659, $P665
  if_660_end:
    store_lex "$ws", $P659
.annotate 'line', 117
    find_lex $P667, "$/"
    unless_null $P667, vivify_210
    $P667 = root_new ['parrot';'Hash']
  vivify_210:
    set $P668, $P667["quantified_atom"]
    unless_null $P668, vivify_211
    new $P668, "Undef"
  vivify_211:
    if $P668, if_666
.annotate 'line', 133
    get_hll_global $P688, ["PAST"], "Regex"
    find_lex $P689, "$/"
    unless_null $P689, vivify_212
    $P689 = root_new ['parrot';'Hash']
  vivify_212:
    set $P690, $P689["min"]
    unless_null $P690, vivify_213
    new $P690, "Undef"
  vivify_213:
    set $N691, $P690
    find_lex $P692, "$/"
    $P693 = $P688."new"("quant" :named("pasttype"), $N691 :named("min"), $P692 :named("node"))
    store_lex "$past", $P693
.annotate 'line', 134
    find_lex $P695, "$/"
    unless_null $P695, vivify_214
    $P695 = root_new ['parrot';'Hash']
  vivify_214:
    set $P696, $P695["max"]
    unless_null $P696, vivify_215
    new $P696, "Undef"
  vivify_215:
    isfalse $I697, $P696
    if $I697, if_694
.annotate 'line', 135
    find_lex $P703, "$/"
    unless_null $P703, vivify_216
    $P703 = root_new ['parrot';'Hash']
  vivify_216:
    set $P704, $P703["max"]
    unless_null $P704, vivify_217
    $P704 = root_new ['parrot';'ResizablePMCArray']
  vivify_217:
    set $P705, $P704[0]
    unless_null $P705, vivify_218
    new $P705, "Undef"
  vivify_218:
    set $S706, $P705
    isne $I707, $S706, "*"
    unless $I707, if_702_end
    find_lex $P708, "$past"
    find_lex $P709, "$/"
    unless_null $P709, vivify_219
    $P709 = root_new ['parrot';'Hash']
  vivify_219:
    set $P710, $P709["max"]
    unless_null $P710, vivify_220
    $P710 = root_new ['parrot';'ResizablePMCArray']
  vivify_220:
    set $P711, $P710[0]
    unless_null $P711, vivify_221
    new $P711, "Undef"
  vivify_221:
    set $N712, $P711
    $P708."max"($N712)
  if_702_end:
    goto if_694_end
  if_694:
.annotate 'line', 134
    find_lex $P698, "$past"
    find_lex $P699, "$/"
    unless_null $P699, vivify_222
    $P699 = root_new ['parrot';'Hash']
  vivify_222:
    set $P700, $P699["min"]
    unless_null $P700, vivify_223
    new $P700, "Undef"
  vivify_223:
    set $N701, $P700
    $P698."max"($N701)
  if_694_end:
.annotate 'line', 136
    find_lex $P714, "$ws"
    unless $P714, if_713_end
    find_lex $P715, "$past"
    get_hll_global $P716, ["PAST"], "Regex"
    $P717 = $P716."new"("ws", "subrule" :named("pasttype"), "method" :named("subtype"))
    $P715."sep"($P717)
  if_713_end:
.annotate 'line', 132
    goto if_666_end
  if_666:
.annotate 'line', 117
    .const 'Sub' $P670 = "43_1280467473.99327" 
    capture_lex $P670
    $P670()
  if_666_end:
.annotate 'line', 140
    find_lex $P718, "$/"
    find_lex $P719, "$past"
    find_lex $P720, "$/"
    unless_null $P720, vivify_226
    $P720 = root_new ['parrot';'Hash']
  vivify_226:
    set $P721, $P720["backmod"]
    unless_null $P721, vivify_227
    new $P721, "Undef"
  vivify_227:
    $P722 = "backmod"($P719, $P721)
    $P723 = $P718."!make"($P722)
.annotate 'line', 114
    .return ($P723)
  control_653:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P724, exception, "payload"
    .return ($P724)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block669"  :anon :subid("43_1280467473.99327") :outer("42_1280467473.99327")
.annotate 'line', 118
    new $P671, "Undef"
    .lex "$ast", $P671
    find_lex $P672, "$/"
    unless_null $P672, vivify_224
    $P672 = root_new ['parrot';'Hash']
  vivify_224:
    set $P673, $P672["quantified_atom"]
    unless_null $P673, vivify_225
    new $P673, "Undef"
  vivify_225:
    $P674 = $P673."ast"()
    store_lex "$ast", $P674
.annotate 'line', 119
    find_lex $P676, "$ws"
    unless $P676, if_675_end
.annotate 'line', 120
    get_hll_global $P677, ["PAST"], "Regex"
.annotate 'line', 122
    get_hll_global $P678, ["PAST"], "Regex"
    $P679 = $P678."new"("ws", "subrule" :named("pasttype"), "method" :named("subtype"))
    find_lex $P680, "$ast"
.annotate 'line', 125
    get_hll_global $P681, ["PAST"], "Regex"
    $P682 = $P681."new"("ws", "subrule" :named("pasttype"), "method" :named("subtype"))
    $P683 = $P677."new"($P679, $P680, $P682, "concat" :named("pasttype"))
.annotate 'line', 120
    store_lex "$ast", $P683
  if_675_end:
.annotate 'line', 129
    get_hll_global $P684, ["PAST"], "Regex"
    find_lex $P685, "$ast"
    find_lex $P686, "$/"
    $P687 = $P684."new"("quant" :named("pasttype"), 1 :named("min"), $P685 :named("sep"), $P686 :named("node"))
    store_lex "$past", $P687
.annotate 'line', 117
    .return ($P687)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<ws>"  :subid("44_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_728
.annotate 'line', 143
    new $P727, 'ExceptionHandler'
    set_addr $P727, control_726
    $P727."handle_types"(.CONTROL_RETURN)
    push_eh $P727
    .lex "self", self
    .lex "$/", param_728
.annotate 'line', 144
    new $P729, "Undef"
    .lex "$past", $P729
.annotate 'line', 145
    get_global $P732, "@MODIFIERS"
    unless_null $P732, vivify_228
    $P732 = root_new ['parrot';'ResizablePMCArray']
  vivify_228:
    set $P733, $P732[0]
    unless_null $P733, vivify_229
    $P733 = root_new ['parrot';'Hash']
  vivify_229:
    set $P734, $P733["s"]
    unless_null $P734, vivify_230
    new $P734, "Undef"
  vivify_230:
    if $P734, if_731
    new $P738, "Integer"
    assign $P738, 0
    set $P730, $P738
    goto if_731_end
  if_731:
    get_hll_global $P735, ["PAST"], "Regex"
    find_lex $P736, "$/"
    $P737 = $P735."new"("ws", "subrule" :named("pasttype"), "method" :named("subtype"), $P736 :named("node"))
    set $P730, $P737
  if_731_end:
    store_lex "$past", $P730
.annotate 'line', 148
    find_lex $P739, "$/"
    find_lex $P740, "$past"
    $P741 = $P739."!make"($P740)
.annotate 'line', 143
    .return ($P741)
  control_726:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P742, exception, "payload"
    .return ($P742)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<[ ]>"  :subid("45_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_746
.annotate 'line', 152
    new $P745, 'ExceptionHandler'
    set_addr $P745, control_744
    $P745."handle_types"(.CONTROL_RETURN)
    push_eh $P745
    .lex "self", self
    .lex "$/", param_746
.annotate 'line', 153
    find_lex $P747, "$/"
    find_lex $P748, "$/"
    unless_null $P748, vivify_231
    $P748 = root_new ['parrot';'Hash']
  vivify_231:
    set $P749, $P748["nibbler"]
    unless_null $P749, vivify_232
    new $P749, "Undef"
  vivify_232:
    $P750 = $P749."ast"()
    $P751 = $P747."!make"($P750)
.annotate 'line', 152
    .return ($P751)
  control_744:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P752, exception, "payload"
    .return ($P752)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<( )>"  :subid("46_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_756
.annotate 'line', 156
    new $P755, 'ExceptionHandler'
    set_addr $P755, control_754
    $P755."handle_types"(.CONTROL_RETURN)
    push_eh $P755
    .lex "self", self
    .lex "$/", param_756
.annotate 'line', 157
    new $P757, "Undef"
    .lex "$subpast", $P757
.annotate 'line', 158
    new $P758, "Undef"
    .lex "$past", $P758
.annotate 'line', 157
    find_lex $P759, "$/"
    unless_null $P759, vivify_233
    $P759 = root_new ['parrot';'Hash']
  vivify_233:
    set $P760, $P759["nibbler"]
    unless_null $P760, vivify_234
    new $P760, "Undef"
  vivify_234:
    $P761 = $P760."ast"()
    $P762 = "buildsub"($P761)
    store_lex "$subpast", $P762
.annotate 'line', 158
    get_hll_global $P763, ["PAST"], "Regex"
    find_lex $P764, "$subpast"
    find_lex $P765, "$/"
    $P766 = $P763."new"($P764, "subrule" :named("pasttype"), "capture" :named("subtype"), $P765 :named("node"))
    store_lex "$past", $P766
.annotate 'line', 160
    find_lex $P767, "$/"
    find_lex $P768, "$past"
    $P769 = $P767."!make"($P768)
.annotate 'line', 156
    .return ($P769)
  control_754:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P770, exception, "payload"
    .return ($P770)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<'>"  :subid("47_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_774
.annotate 'line', 163
    new $P773, 'ExceptionHandler'
    set_addr $P773, control_772
    $P773."handle_types"(.CONTROL_RETURN)
    push_eh $P773
    .lex "self", self
    .lex "$/", param_774
.annotate 'line', 164
    new $P775, "Undef"
    .lex "$quote", $P775
.annotate 'line', 166
    new $P776, "Undef"
    .lex "$past", $P776
.annotate 'line', 164
    find_lex $P777, "$/"
    unless_null $P777, vivify_235
    $P777 = root_new ['parrot';'Hash']
  vivify_235:
    set $P778, $P777["quote_EXPR"]
    unless_null $P778, vivify_236
    new $P778, "Undef"
  vivify_236:
    $P779 = $P778."ast"()
    store_lex "$quote", $P779
.annotate 'line', 165
    get_hll_global $P781, ["PAST"], "Val"
    find_lex $P782, "$quote"
    $P783 = $P781."ACCEPTS"($P782)
    unless $P783, if_780_end
    find_lex $P784, "$quote"
    $P785 = $P784."value"()
    store_lex "$quote", $P785
  if_780_end:
.annotate 'line', 166
    get_hll_global $P786, ["PAST"], "Regex"
    find_lex $P787, "$quote"
    find_lex $P788, "$/"
    $P789 = $P786."new"($P787, "literal" :named("pasttype"), $P788 :named("node"))
    store_lex "$past", $P789
.annotate 'line', 167
    get_global $P791, "@MODIFIERS"
    unless_null $P791, vivify_237
    $P791 = root_new ['parrot';'ResizablePMCArray']
  vivify_237:
    set $P792, $P791[0]
    unless_null $P792, vivify_238
    $P792 = root_new ['parrot';'Hash']
  vivify_238:
    set $P793, $P792["i"]
    unless_null $P793, vivify_239
    new $P793, "Undef"
  vivify_239:
    unless $P793, if_790_end
    find_lex $P794, "$past"
    $P794."subtype"("ignorecase")
  if_790_end:
.annotate 'line', 168
    find_lex $P795, "$/"
    find_lex $P796, "$past"
    $P797 = $P795."!make"($P796)
.annotate 'line', 163
    .return ($P797)
  control_772:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P798, exception, "payload"
    .return ($P798)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<\">"  :subid("48_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_802
.annotate 'line', 171
    new $P801, 'ExceptionHandler'
    set_addr $P801, control_800
    $P801."handle_types"(.CONTROL_RETURN)
    push_eh $P801
    .lex "self", self
    .lex "$/", param_802
.annotate 'line', 172
    new $P803, "Undef"
    .lex "$quote", $P803
.annotate 'line', 174
    new $P804, "Undef"
    .lex "$past", $P804
.annotate 'line', 172
    find_lex $P805, "$/"
    unless_null $P805, vivify_240
    $P805 = root_new ['parrot';'Hash']
  vivify_240:
    set $P806, $P805["quote_EXPR"]
    unless_null $P806, vivify_241
    new $P806, "Undef"
  vivify_241:
    $P807 = $P806."ast"()
    store_lex "$quote", $P807
.annotate 'line', 173
    get_hll_global $P809, ["PAST"], "Val"
    find_lex $P810, "$quote"
    $P811 = $P809."ACCEPTS"($P810)
    unless $P811, if_808_end
    find_lex $P812, "$quote"
    $P813 = $P812."value"()
    store_lex "$quote", $P813
  if_808_end:
.annotate 'line', 174
    get_hll_global $P814, ["PAST"], "Regex"
    find_lex $P815, "$quote"
    find_lex $P816, "$/"
    $P817 = $P814."new"($P815, "literal" :named("pasttype"), $P816 :named("node"))
    store_lex "$past", $P817
.annotate 'line', 175
    get_global $P819, "@MODIFIERS"
    unless_null $P819, vivify_242
    $P819 = root_new ['parrot';'ResizablePMCArray']
  vivify_242:
    set $P820, $P819[0]
    unless_null $P820, vivify_243
    $P820 = root_new ['parrot';'Hash']
  vivify_243:
    set $P821, $P820["i"]
    unless_null $P821, vivify_244
    new $P821, "Undef"
  vivify_244:
    unless $P821, if_818_end
    find_lex $P822, "$past"
    $P822."subtype"("ignorecase")
  if_818_end:
.annotate 'line', 176
    find_lex $P823, "$/"
    find_lex $P824, "$past"
    $P825 = $P823."!make"($P824)
.annotate 'line', 171
    .return ($P825)
  control_800:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P826, exception, "payload"
    .return ($P826)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<.>"  :subid("49_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_830
.annotate 'line', 179
    new $P829, 'ExceptionHandler'
    set_addr $P829, control_828
    $P829."handle_types"(.CONTROL_RETURN)
    push_eh $P829
    .lex "self", self
    .lex "$/", param_830
.annotate 'line', 180
    new $P831, "Undef"
    .lex "$past", $P831
    get_hll_global $P832, ["PAST"], "Regex"
    find_lex $P833, "$/"
    $P834 = $P832."new"("charclass" :named("pasttype"), "." :named("subtype"), $P833 :named("node"))
    store_lex "$past", $P834
.annotate 'line', 181
    find_lex $P835, "$/"
    find_lex $P836, "$past"
    $P837 = $P835."!make"($P836)
.annotate 'line', 179
    .return ($P837)
  control_828:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P838, exception, "payload"
    .return ($P838)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<^>"  :subid("50_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_842
.annotate 'line', 184
    new $P841, 'ExceptionHandler'
    set_addr $P841, control_840
    $P841."handle_types"(.CONTROL_RETURN)
    push_eh $P841
    .lex "self", self
    .lex "$/", param_842
.annotate 'line', 185
    new $P843, "Undef"
    .lex "$past", $P843
    get_hll_global $P844, ["PAST"], "Regex"
    find_lex $P845, "$/"
    $P846 = $P844."new"("anchor" :named("pasttype"), "bos" :named("subtype"), $P845 :named("node"))
    store_lex "$past", $P846
.annotate 'line', 186
    find_lex $P847, "$/"
    find_lex $P848, "$past"
    $P849 = $P847."!make"($P848)
.annotate 'line', 184
    .return ($P849)
  control_840:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P850, exception, "payload"
    .return ($P850)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<^^>"  :subid("51_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_854
.annotate 'line', 189
    new $P853, 'ExceptionHandler'
    set_addr $P853, control_852
    $P853."handle_types"(.CONTROL_RETURN)
    push_eh $P853
    .lex "self", self
    .lex "$/", param_854
.annotate 'line', 190
    new $P855, "Undef"
    .lex "$past", $P855
    get_hll_global $P856, ["PAST"], "Regex"
    find_lex $P857, "$/"
    $P858 = $P856."new"("anchor" :named("pasttype"), "bol" :named("subtype"), $P857 :named("node"))
    store_lex "$past", $P858
.annotate 'line', 191
    find_lex $P859, "$/"
    find_lex $P860, "$past"
    $P861 = $P859."!make"($P860)
.annotate 'line', 189
    .return ($P861)
  control_852:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P862, exception, "payload"
    .return ($P862)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<$>"  :subid("52_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_866
.annotate 'line', 194
    new $P865, 'ExceptionHandler'
    set_addr $P865, control_864
    $P865."handle_types"(.CONTROL_RETURN)
    push_eh $P865
    .lex "self", self
    .lex "$/", param_866
.annotate 'line', 195
    new $P867, "Undef"
    .lex "$past", $P867
    get_hll_global $P868, ["PAST"], "Regex"
    find_lex $P869, "$/"
    $P870 = $P868."new"("anchor" :named("pasttype"), "eos" :named("subtype"), $P869 :named("node"))
    store_lex "$past", $P870
.annotate 'line', 196
    find_lex $P871, "$/"
    find_lex $P872, "$past"
    $P873 = $P871."!make"($P872)
.annotate 'line', 194
    .return ($P873)
  control_864:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P874, exception, "payload"
    .return ($P874)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<$$>"  :subid("53_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_878
.annotate 'line', 199
    new $P877, 'ExceptionHandler'
    set_addr $P877, control_876
    $P877."handle_types"(.CONTROL_RETURN)
    push_eh $P877
    .lex "self", self
    .lex "$/", param_878
.annotate 'line', 200
    new $P879, "Undef"
    .lex "$past", $P879
    get_hll_global $P880, ["PAST"], "Regex"
    find_lex $P881, "$/"
    $P882 = $P880."new"("anchor" :named("pasttype"), "eol" :named("subtype"), $P881 :named("node"))
    store_lex "$past", $P882
.annotate 'line', 201
    find_lex $P883, "$/"
    find_lex $P884, "$past"
    $P885 = $P883."!make"($P884)
.annotate 'line', 199
    .return ($P885)
  control_876:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P886, exception, "payload"
    .return ($P886)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<:::>"  :subid("54_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_890
.annotate 'line', 204
    new $P889, 'ExceptionHandler'
    set_addr $P889, control_888
    $P889."handle_types"(.CONTROL_RETURN)
    push_eh $P889
    .lex "self", self
    .lex "$/", param_890
.annotate 'line', 205
    new $P891, "Undef"
    .lex "$past", $P891
    get_hll_global $P892, ["PAST"], "Regex"
    find_lex $P893, "$/"
    $P894 = $P892."new"("cut" :named("pasttype"), $P893 :named("node"))
    store_lex "$past", $P894
.annotate 'line', 206
    find_lex $P895, "$/"
    find_lex $P896, "$past"
    $P897 = $P895."!make"($P896)
.annotate 'line', 204
    .return ($P897)
  control_888:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P898, exception, "payload"
    .return ($P898)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<lwb>"  :subid("55_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_902
.annotate 'line', 209
    new $P901, 'ExceptionHandler'
    set_addr $P901, control_900
    $P901."handle_types"(.CONTROL_RETURN)
    push_eh $P901
    .lex "self", self
    .lex "$/", param_902
.annotate 'line', 210
    new $P903, "Undef"
    .lex "$past", $P903
    get_hll_global $P904, ["PAST"], "Regex"
    find_lex $P905, "$/"
    $P906 = $P904."new"("anchor" :named("pasttype"), "lwb" :named("subtype"), $P905 :named("node"))
    store_lex "$past", $P906
.annotate 'line', 211
    find_lex $P907, "$/"
    find_lex $P908, "$past"
    $P909 = $P907."!make"($P908)
.annotate 'line', 209
    .return ($P909)
  control_900:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P910, exception, "payload"
    .return ($P910)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<rwb>"  :subid("56_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_914
.annotate 'line', 214
    new $P913, 'ExceptionHandler'
    set_addr $P913, control_912
    $P913."handle_types"(.CONTROL_RETURN)
    push_eh $P913
    .lex "self", self
    .lex "$/", param_914
.annotate 'line', 215
    new $P915, "Undef"
    .lex "$past", $P915
    get_hll_global $P916, ["PAST"], "Regex"
    find_lex $P917, "$/"
    $P918 = $P916."new"("anchor" :named("pasttype"), "rwb" :named("subtype"), $P917 :named("node"))
    store_lex "$past", $P918
.annotate 'line', 216
    find_lex $P919, "$/"
    find_lex $P920, "$past"
    $P921 = $P919."!make"($P920)
.annotate 'line', 214
    .return ($P921)
  control_912:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P922, exception, "payload"
    .return ($P922)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<bs>"  :subid("57_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_926
.annotate 'line', 219
    new $P925, 'ExceptionHandler'
    set_addr $P925, control_924
    $P925."handle_types"(.CONTROL_RETURN)
    push_eh $P925
    .lex "self", self
    .lex "$/", param_926
.annotate 'line', 220
    find_lex $P927, "$/"
    find_lex $P928, "$/"
    unless_null $P928, vivify_245
    $P928 = root_new ['parrot';'Hash']
  vivify_245:
    set $P929, $P928["backslash"]
    unless_null $P929, vivify_246
    new $P929, "Undef"
  vivify_246:
    $P930 = $P929."ast"()
    $P931 = $P927."!make"($P930)
.annotate 'line', 219
    .return ($P931)
  control_924:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P932, exception, "payload"
    .return ($P932)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<mod>"  :subid("58_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_936
.annotate 'line', 223
    new $P935, 'ExceptionHandler'
    set_addr $P935, control_934
    $P935."handle_types"(.CONTROL_RETURN)
    push_eh $P935
    .lex "self", self
    .lex "$/", param_936
.annotate 'line', 224
    find_lex $P937, "$/"
    find_lex $P938, "$/"
    unless_null $P938, vivify_247
    $P938 = root_new ['parrot';'Hash']
  vivify_247:
    set $P939, $P938["mod_internal"]
    unless_null $P939, vivify_248
    new $P939, "Undef"
  vivify_248:
    $P940 = $P939."ast"()
    $P941 = $P937."!make"($P940)
.annotate 'line', 223
    .return ($P941)
  control_934:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P942, exception, "payload"
    .return ($P942)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<assert>"  :subid("59_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_946
.annotate 'line', 227
    new $P945, 'ExceptionHandler'
    set_addr $P945, control_944
    $P945."handle_types"(.CONTROL_RETURN)
    push_eh $P945
    .lex "self", self
    .lex "$/", param_946
.annotate 'line', 228
    find_lex $P947, "$/"
    find_lex $P948, "$/"
    unless_null $P948, vivify_249
    $P948 = root_new ['parrot';'Hash']
  vivify_249:
    set $P949, $P948["assertion"]
    unless_null $P949, vivify_250
    new $P949, "Undef"
  vivify_250:
    $P950 = $P949."ast"()
    $P951 = $P947."!make"($P950)
.annotate 'line', 227
    .return ($P951)
  control_944:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P952, exception, "payload"
    .return ($P952)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<~>"  :subid("60_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_956
.annotate 'line', 231
    new $P955, 'ExceptionHandler'
    set_addr $P955, control_954
    $P955."handle_types"(.CONTROL_RETURN)
    push_eh $P955
    .lex "self", self
    .lex "$/", param_956
.annotate 'line', 232
    find_lex $P957, "$/"
    get_hll_global $P958, ["PAST"], "Regex"
.annotate 'line', 233
    find_lex $P959, "$/"
    unless_null $P959, vivify_251
    $P959 = root_new ['parrot';'Hash']
  vivify_251:
    set $P960, $P959["EXPR"]
    unless_null $P960, vivify_252
    new $P960, "Undef"
  vivify_252:
    $P961 = $P960."ast"()
.annotate 'line', 234
    get_hll_global $P962, ["PAST"], "Regex"
.annotate 'line', 235
    find_lex $P963, "$/"
    unless_null $P963, vivify_253
    $P963 = root_new ['parrot';'Hash']
  vivify_253:
    set $P964, $P963["GOAL"]
    unless_null $P964, vivify_254
    new $P964, "Undef"
  vivify_254:
    $P965 = $P964."ast"()
.annotate 'line', 236
    get_hll_global $P966, ["PAST"], "Regex"
    find_lex $P967, "$/"
    unless_null $P967, vivify_255
    $P967 = root_new ['parrot';'Hash']
  vivify_255:
    set $P968, $P967["GOAL"]
    unless_null $P968, vivify_256
    new $P968, "Undef"
  vivify_256:
    set $S969, $P968
    $P970 = $P966."new"("FAILGOAL", $S969, "subrule" :named("pasttype"), "method" :named("subtype"))
    $P971 = $P962."new"($P965, $P970, "alt" :named("pasttype"))
.annotate 'line', 234
    $P972 = $P958."new"($P961, $P971, "concat" :named("pasttype"))
.annotate 'line', 232
    $P973 = $P957."!make"($P972)
.annotate 'line', 231
    .return ($P973)
  control_954:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P974, exception, "payload"
    .return ($P974)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<{*}>"  :subid("61_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_978
.annotate 'line', 244
    new $P977, 'ExceptionHandler'
    set_addr $P977, control_976
    $P977."handle_types"(.CONTROL_RETURN)
    push_eh $P977
    .lex "self", self
    .lex "$/", param_978
.annotate 'line', 245
    new $P979, "Undef"
    .lex "$past", $P979
.annotate 'line', 246
    find_lex $P982, "$/"
    unless_null $P982, vivify_257
    $P982 = root_new ['parrot';'Hash']
  vivify_257:
    set $P983, $P982["key"]
    unless_null $P983, vivify_258
    new $P983, "Undef"
  vivify_258:
    if $P983, if_981
    new $P991, "Integer"
    assign $P991, 0
    set $P980, $P991
    goto if_981_end
  if_981:
    get_hll_global $P984, ["PAST"], "Regex"
    find_lex $P985, "$/"
    unless_null $P985, vivify_259
    $P985 = root_new ['parrot';'Hash']
  vivify_259:
    set $P986, $P985["key"]
    unless_null $P986, vivify_260
    $P986 = root_new ['parrot';'ResizablePMCArray']
  vivify_260:
    set $P987, $P986[0]
    unless_null $P987, vivify_261
    new $P987, "Undef"
  vivify_261:
    set $S988, $P987
    find_lex $P989, "$/"
    $P990 = $P984."new"($S988, "reduce" :named("pasttype"), $P989 :named("node"))
    set $P980, $P990
  if_981_end:
    store_lex "$past", $P980
.annotate 'line', 248
    find_lex $P992, "$/"
    find_lex $P993, "$past"
    $P994 = $P992."!make"($P993)
.annotate 'line', 244
    .return ($P994)
  control_976:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P995, exception, "payload"
    .return ($P995)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<var>"  :subid("62_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_999
.annotate 'line', 251
    new $P998, 'ExceptionHandler'
    set_addr $P998, control_997
    $P998."handle_types"(.CONTROL_RETURN)
    push_eh $P998
    .lex "self", self
    .lex "$/", param_999
.annotate 'line', 252
    new $P1000, "Undef"
    .lex "$past", $P1000
.annotate 'line', 253
    new $P1001, "Undef"
    .lex "$name", $P1001
.annotate 'line', 251
    find_lex $P1002, "$past"
.annotate 'line', 253
    find_lex $P1005, "$/"
    unless_null $P1005, vivify_262
    $P1005 = root_new ['parrot';'Hash']
  vivify_262:
    set $P1006, $P1005["pos"]
    unless_null $P1006, vivify_263
    new $P1006, "Undef"
  vivify_263:
    if $P1006, if_1004
    find_lex $P1010, "$/"
    unless_null $P1010, vivify_264
    $P1010 = root_new ['parrot';'Hash']
  vivify_264:
    set $P1011, $P1010["name"]
    unless_null $P1011, vivify_265
    new $P1011, "Undef"
  vivify_265:
    set $S1012, $P1011
    new $P1003, 'String'
    set $P1003, $S1012
    goto if_1004_end
  if_1004:
    find_lex $P1007, "$/"
    unless_null $P1007, vivify_266
    $P1007 = root_new ['parrot';'Hash']
  vivify_266:
    set $P1008, $P1007["pos"]
    unless_null $P1008, vivify_267
    new $P1008, "Undef"
  vivify_267:
    set $N1009, $P1008
    new $P1003, 'Float'
    set $P1003, $N1009
  if_1004_end:
    store_lex "$name", $P1003
.annotate 'line', 254
    find_lex $P1014, "$/"
    unless_null $P1014, vivify_268
    $P1014 = root_new ['parrot';'Hash']
  vivify_268:
    set $P1015, $P1014["quantified_atom"]
    unless_null $P1015, vivify_269
    new $P1015, "Undef"
  vivify_269:
    if $P1015, if_1013
.annotate 'line', 265
    get_hll_global $P1046, ["PAST"], "Regex"
    find_lex $P1047, "$name"
    find_lex $P1048, "$/"
    $P1049 = $P1046."new"("!BACKREF", $P1047, "subrule" :named("pasttype"), "method" :named("subtype"), $P1048 :named("node"))
    store_lex "$past", $P1049
.annotate 'line', 264
    goto if_1013_end
  if_1013:
.annotate 'line', 255
    find_lex $P1016, "$/"
    unless_null $P1016, vivify_270
    $P1016 = root_new ['parrot';'Hash']
  vivify_270:
    set $P1017, $P1016["quantified_atom"]
    unless_null $P1017, vivify_271
    $P1017 = root_new ['parrot';'ResizablePMCArray']
  vivify_271:
    set $P1018, $P1017[0]
    unless_null $P1018, vivify_272
    new $P1018, "Undef"
  vivify_272:
    $P1019 = $P1018."ast"()
    store_lex "$past", $P1019
.annotate 'line', 256
    find_lex $P1023, "$past"
    $S1024 = $P1023."pasttype"()
    iseq $I1025, $S1024, "quant"
    if $I1025, if_1022
    new $P1021, 'Integer'
    set $P1021, $I1025
    goto if_1022_end
  if_1022:
    find_lex $P1026, "$past"
    unless_null $P1026, vivify_273
    $P1026 = root_new ['parrot';'ResizablePMCArray']
  vivify_273:
    set $P1027, $P1026[0]
    unless_null $P1027, vivify_274
    new $P1027, "Undef"
  vivify_274:
    $S1028 = $P1027."pasttype"()
    iseq $I1029, $S1028, "subrule"
    new $P1021, 'Integer'
    set $P1021, $I1029
  if_1022_end:
    if $P1021, if_1020
.annotate 'line', 259
    find_lex $P1035, "$past"
    $S1036 = $P1035."pasttype"()
    iseq $I1037, $S1036, "subrule"
    if $I1037, if_1034
.annotate 'line', 261
    get_hll_global $P1041, ["PAST"], "Regex"
    find_lex $P1042, "$past"
    find_lex $P1043, "$name"
    find_lex $P1044, "$/"
    $P1045 = $P1041."new"($P1042, $P1043 :named("name"), "subcapture" :named("pasttype"), $P1044 :named("node"))
    store_lex "$past", $P1045
.annotate 'line', 260
    goto if_1034_end
  if_1034:
.annotate 'line', 259
    find_lex $P1038, "self"
    find_lex $P1039, "$past"
    find_lex $P1040, "$name"
    $P1038."subrule_alias"($P1039, $P1040)
  if_1034_end:
    goto if_1020_end
  if_1020:
.annotate 'line', 257
    find_lex $P1030, "self"
    find_lex $P1031, "$past"
    unless_null $P1031, vivify_275
    $P1031 = root_new ['parrot';'ResizablePMCArray']
  vivify_275:
    set $P1032, $P1031[0]
    unless_null $P1032, vivify_276
    new $P1032, "Undef"
  vivify_276:
    find_lex $P1033, "$name"
    $P1030."subrule_alias"($P1032, $P1033)
  if_1020_end:
  if_1013_end:
.annotate 'line', 268
    find_lex $P1050, "$/"
    find_lex $P1051, "$past"
    $P1052 = $P1050."!make"($P1051)
.annotate 'line', 251
    .return ($P1052)
  control_997:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1053, exception, "payload"
    .return ($P1053)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<PIR>"  :subid("63_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_1057
.annotate 'line', 271
    new $P1056, 'ExceptionHandler'
    set_addr $P1056, control_1055
    $P1056."handle_types"(.CONTROL_RETURN)
    push_eh $P1056
    .lex "self", self
    .lex "$/", param_1057
.annotate 'line', 272
    find_lex $P1058, "$/"
    get_hll_global $P1059, ["PAST"], "Regex"
.annotate 'line', 273
    get_hll_global $P1060, ["PAST"], "Op"
    find_lex $P1061, "$/"
    unless_null $P1061, vivify_277
    $P1061 = root_new ['parrot';'Hash']
  vivify_277:
    set $P1062, $P1061["pir"]
    unless_null $P1062, vivify_278
    new $P1062, "Undef"
  vivify_278:
    set $S1063, $P1062
    $P1064 = $P1060."new"($S1063 :named("inline"), "inline" :named("pasttype"))
    find_lex $P1065, "$/"
    $P1066 = $P1059."new"($P1064, "pastnode" :named("pasttype"), $P1065 :named("node"))
.annotate 'line', 272
    $P1067 = $P1058."!make"($P1066)
.annotate 'line', 271
    .return ($P1067)
  control_1055:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1068, exception, "payload"
    .return ($P1068)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<w>"  :subid("64_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_1072
.annotate 'line', 279
    new $P1071, 'ExceptionHandler'
    set_addr $P1071, control_1070
    $P1071."handle_types"(.CONTROL_RETURN)
    push_eh $P1071
    .lex "self", self
    .lex "$/", param_1072
.annotate 'line', 280
    new $P1073, "Undef"
    .lex "$subtype", $P1073
.annotate 'line', 281
    new $P1074, "Undef"
    .lex "$past", $P1074
.annotate 'line', 280
    find_lex $P1077, "$/"
    unless_null $P1077, vivify_279
    $P1077 = root_new ['parrot';'Hash']
  vivify_279:
    set $P1078, $P1077["sym"]
    unless_null $P1078, vivify_280
    new $P1078, "Undef"
  vivify_280:
    set $S1079, $P1078
    iseq $I1080, $S1079, "n"
    if $I1080, if_1076
    find_lex $P1082, "$/"
    unless_null $P1082, vivify_281
    $P1082 = root_new ['parrot';'Hash']
  vivify_281:
    set $P1083, $P1082["sym"]
    unless_null $P1083, vivify_282
    new $P1083, "Undef"
  vivify_282:
    set $S1084, $P1083
    new $P1075, 'String'
    set $P1075, $S1084
    goto if_1076_end
  if_1076:
    new $P1081, "String"
    assign $P1081, "nl"
    set $P1075, $P1081
  if_1076_end:
    store_lex "$subtype", $P1075
.annotate 'line', 281
    get_hll_global $P1085, ["PAST"], "Regex"
    find_lex $P1086, "$subtype"
    find_lex $P1087, "$/"
    $P1088 = $P1085."new"("charclass" :named("pasttype"), $P1086 :named("subtype"), $P1087 :named("node"))
    store_lex "$past", $P1088
.annotate 'line', 282
    find_lex $P1089, "$/"
    find_lex $P1090, "$past"
    $P1091 = $P1089."!make"($P1090)
.annotate 'line', 279
    .return ($P1091)
  control_1070:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1092, exception, "payload"
    .return ($P1092)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<b>"  :subid("65_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_1096
.annotate 'line', 285
    new $P1095, 'ExceptionHandler'
    set_addr $P1095, control_1094
    $P1095."handle_types"(.CONTROL_RETURN)
    push_eh $P1095
    .lex "self", self
    .lex "$/", param_1096
.annotate 'line', 286
    new $P1097, "Undef"
    .lex "$past", $P1097
    get_hll_global $P1098, ["PAST"], "Regex"
.annotate 'line', 287
    find_lex $P1099, "$/"
    unless_null $P1099, vivify_283
    $P1099 = root_new ['parrot';'Hash']
  vivify_283:
    set $P1100, $P1099["sym"]
    unless_null $P1100, vivify_284
    new $P1100, "Undef"
  vivify_284:
    set $S1101, $P1100
    iseq $I1102, $S1101, "B"
    find_lex $P1103, "$/"
    $P1104 = $P1098."new"("\b", "enumcharlist" :named("pasttype"), $I1102 :named("negate"), $P1103 :named("node"))
.annotate 'line', 286
    store_lex "$past", $P1104
.annotate 'line', 288
    find_lex $P1105, "$/"
    find_lex $P1106, "$past"
    $P1107 = $P1105."!make"($P1106)
.annotate 'line', 285
    .return ($P1107)
  control_1094:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1108, exception, "payload"
    .return ($P1108)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<e>"  :subid("66_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_1112
.annotate 'line', 291
    new $P1111, 'ExceptionHandler'
    set_addr $P1111, control_1110
    $P1111."handle_types"(.CONTROL_RETURN)
    push_eh $P1111
    .lex "self", self
    .lex "$/", param_1112
.annotate 'line', 292
    new $P1113, "Undef"
    .lex "$past", $P1113
    get_hll_global $P1114, ["PAST"], "Regex"
.annotate 'line', 293
    find_lex $P1115, "$/"
    unless_null $P1115, vivify_285
    $P1115 = root_new ['parrot';'Hash']
  vivify_285:
    set $P1116, $P1115["sym"]
    unless_null $P1116, vivify_286
    new $P1116, "Undef"
  vivify_286:
    set $S1117, $P1116
    iseq $I1118, $S1117, "E"
    find_lex $P1119, "$/"
    $P1120 = $P1114."new"("\e", "enumcharlist" :named("pasttype"), $I1118 :named("negate"), $P1119 :named("node"))
.annotate 'line', 292
    store_lex "$past", $P1120
.annotate 'line', 294
    find_lex $P1121, "$/"
    find_lex $P1122, "$past"
    $P1123 = $P1121."!make"($P1122)
.annotate 'line', 291
    .return ($P1123)
  control_1110:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1124, exception, "payload"
    .return ($P1124)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<f>"  :subid("67_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_1128
.annotate 'line', 297
    new $P1127, 'ExceptionHandler'
    set_addr $P1127, control_1126
    $P1127."handle_types"(.CONTROL_RETURN)
    push_eh $P1127
    .lex "self", self
    .lex "$/", param_1128
.annotate 'line', 298
    new $P1129, "Undef"
    .lex "$past", $P1129
    get_hll_global $P1130, ["PAST"], "Regex"
.annotate 'line', 299
    find_lex $P1131, "$/"
    unless_null $P1131, vivify_287
    $P1131 = root_new ['parrot';'Hash']
  vivify_287:
    set $P1132, $P1131["sym"]
    unless_null $P1132, vivify_288
    new $P1132, "Undef"
  vivify_288:
    set $S1133, $P1132
    iseq $I1134, $S1133, "F"
    find_lex $P1135, "$/"
    $P1136 = $P1130."new"("\f", "enumcharlist" :named("pasttype"), $I1134 :named("negate"), $P1135 :named("node"))
.annotate 'line', 298
    store_lex "$past", $P1136
.annotate 'line', 300
    find_lex $P1137, "$/"
    find_lex $P1138, "$past"
    $P1139 = $P1137."!make"($P1138)
.annotate 'line', 297
    .return ($P1139)
  control_1126:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1140, exception, "payload"
    .return ($P1140)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<h>"  :subid("68_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_1144
.annotate 'line', 303
    new $P1143, 'ExceptionHandler'
    set_addr $P1143, control_1142
    $P1143."handle_types"(.CONTROL_RETURN)
    push_eh $P1143
    .lex "self", self
    .lex "$/", param_1144
.annotate 'line', 304
    new $P1145, "Undef"
    .lex "$past", $P1145
    get_hll_global $P1146, ["PAST"], "Regex"
.annotate 'line', 305
    find_lex $P1147, "$/"
    unless_null $P1147, vivify_289
    $P1147 = root_new ['parrot';'Hash']
  vivify_289:
    set $P1148, $P1147["sym"]
    unless_null $P1148, vivify_290
    new $P1148, "Undef"
  vivify_290:
    set $S1149, $P1148
    iseq $I1150, $S1149, "H"
    find_lex $P1151, "$/"
    $P1152 = $P1146."new"(unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", "enumcharlist" :named("pasttype"), $I1150 :named("negate"), $P1151 :named("node"))
.annotate 'line', 304
    store_lex "$past", $P1152
.annotate 'line', 306
    find_lex $P1153, "$/"
    find_lex $P1154, "$past"
    $P1155 = $P1153."!make"($P1154)
.annotate 'line', 303
    .return ($P1155)
  control_1142:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1156, exception, "payload"
    .return ($P1156)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<r>"  :subid("69_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_1160
.annotate 'line', 309
    new $P1159, 'ExceptionHandler'
    set_addr $P1159, control_1158
    $P1159."handle_types"(.CONTROL_RETURN)
    push_eh $P1159
    .lex "self", self
    .lex "$/", param_1160
.annotate 'line', 310
    new $P1161, "Undef"
    .lex "$past", $P1161
    get_hll_global $P1162, ["PAST"], "Regex"
.annotate 'line', 311
    find_lex $P1163, "$/"
    unless_null $P1163, vivify_291
    $P1163 = root_new ['parrot';'Hash']
  vivify_291:
    set $P1164, $P1163["sym"]
    unless_null $P1164, vivify_292
    new $P1164, "Undef"
  vivify_292:
    set $S1165, $P1164
    iseq $I1166, $S1165, "R"
    find_lex $P1167, "$/"
    $P1168 = $P1162."new"("\r", "enumcharlist" :named("pasttype"), $I1166 :named("negate"), $P1167 :named("node"))
.annotate 'line', 310
    store_lex "$past", $P1168
.annotate 'line', 312
    find_lex $P1169, "$/"
    find_lex $P1170, "$past"
    $P1171 = $P1169."!make"($P1170)
.annotate 'line', 309
    .return ($P1171)
  control_1158:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1172, exception, "payload"
    .return ($P1172)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<t>"  :subid("70_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_1176
.annotate 'line', 315
    new $P1175, 'ExceptionHandler'
    set_addr $P1175, control_1174
    $P1175."handle_types"(.CONTROL_RETURN)
    push_eh $P1175
    .lex "self", self
    .lex "$/", param_1176
.annotate 'line', 316
    new $P1177, "Undef"
    .lex "$past", $P1177
    get_hll_global $P1178, ["PAST"], "Regex"
.annotate 'line', 317
    find_lex $P1179, "$/"
    unless_null $P1179, vivify_293
    $P1179 = root_new ['parrot';'Hash']
  vivify_293:
    set $P1180, $P1179["sym"]
    unless_null $P1180, vivify_294
    new $P1180, "Undef"
  vivify_294:
    set $S1181, $P1180
    iseq $I1182, $S1181, "T"
    find_lex $P1183, "$/"
    $P1184 = $P1178."new"("\t", "enumcharlist" :named("pasttype"), $I1182 :named("negate"), $P1183 :named("node"))
.annotate 'line', 316
    store_lex "$past", $P1184
.annotate 'line', 318
    find_lex $P1185, "$/"
    find_lex $P1186, "$past"
    $P1187 = $P1185."!make"($P1186)
.annotate 'line', 315
    .return ($P1187)
  control_1174:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1188, exception, "payload"
    .return ($P1188)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<v>"  :subid("71_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_1192
.annotate 'line', 321
    new $P1191, 'ExceptionHandler'
    set_addr $P1191, control_1190
    $P1191."handle_types"(.CONTROL_RETURN)
    push_eh $P1191
    .lex "self", self
    .lex "$/", param_1192
.annotate 'line', 322
    new $P1193, "Undef"
    .lex "$past", $P1193
    get_hll_global $P1194, ["PAST"], "Regex"
.annotate 'line', 324
    find_lex $P1195, "$/"
    unless_null $P1195, vivify_295
    $P1195 = root_new ['parrot';'Hash']
  vivify_295:
    set $P1196, $P1195["sym"]
    unless_null $P1196, vivify_296
    new $P1196, "Undef"
  vivify_296:
    set $S1197, $P1196
    iseq $I1198, $S1197, "V"
    find_lex $P1199, "$/"
    $P1200 = $P1194."new"(unicode:"\n\x{b}\f\r\x{85}\u2028\u2029", "enumcharlist" :named("pasttype"), $I1198 :named("negate"), $P1199 :named("node"))
.annotate 'line', 322
    store_lex "$past", $P1200
.annotate 'line', 325
    find_lex $P1201, "$/"
    find_lex $P1202, "$past"
    $P1203 = $P1201."!make"($P1202)
.annotate 'line', 321
    .return ($P1203)
  control_1190:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1204, exception, "payload"
    .return ($P1204)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<o>"  :subid("72_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_1208
.annotate 'line', 328
    new $P1207, 'ExceptionHandler'
    set_addr $P1207, control_1206
    $P1207."handle_types"(.CONTROL_RETURN)
    push_eh $P1207
    .lex "self", self
    .lex "$/", param_1208
.annotate 'line', 329
    new $P1209, "Undef"
    .lex "$octlit", $P1209
.annotate 'line', 330
    get_hll_global $P1210, ["HLL";"Actions"], "ints_to_string"
    find_lex $P1213, "$/"
    unless_null $P1213, vivify_297
    $P1213 = root_new ['parrot';'Hash']
  vivify_297:
    set $P1214, $P1213["octint"]
    unless_null $P1214, vivify_298
    new $P1214, "Undef"
  vivify_298:
    unless $P1214, unless_1212
    set $P1211, $P1214
    goto unless_1212_end
  unless_1212:
    find_lex $P1215, "$/"
    unless_null $P1215, vivify_299
    $P1215 = root_new ['parrot';'Hash']
  vivify_299:
    set $P1216, $P1215["octints"]
    unless_null $P1216, vivify_300
    $P1216 = root_new ['parrot';'Hash']
  vivify_300:
    set $P1217, $P1216["octint"]
    unless_null $P1217, vivify_301
    new $P1217, "Undef"
  vivify_301:
    set $P1211, $P1217
  unless_1212_end:
    $P1218 = $P1210($P1211)
    store_lex "$octlit", $P1218
.annotate 'line', 331
    find_lex $P1219, "$/"
    find_lex $P1222, "$/"
    unless_null $P1222, vivify_302
    $P1222 = root_new ['parrot';'Hash']
  vivify_302:
    set $P1223, $P1222["sym"]
    unless_null $P1223, vivify_303
    new $P1223, "Undef"
  vivify_303:
    set $S1224, $P1223
    iseq $I1225, $S1224, "O"
    if $I1225, if_1221
.annotate 'line', 334
    get_hll_global $P1230, ["PAST"], "Regex"
    find_lex $P1231, "$octlit"
    find_lex $P1232, "$/"
    $P1233 = $P1230."new"($P1231, "literal" :named("pasttype"), $P1232 :named("node"))
    set $P1220, $P1233
.annotate 'line', 331
    goto if_1221_end
  if_1221:
.annotate 'line', 332
    get_hll_global $P1226, ["PAST"], "Regex"
    find_lex $P1227, "$octlit"
    find_lex $P1228, "$/"
    $P1229 = $P1226."new"($P1227, "enumcharlist" :named("pasttype"), 1 :named("negate"), $P1228 :named("node"))
    set $P1220, $P1229
  if_1221_end:
    $P1234 = $P1219."!make"($P1220)
.annotate 'line', 328
    .return ($P1234)
  control_1206:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1235, exception, "payload"
    .return ($P1235)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<x>"  :subid("73_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_1239
.annotate 'line', 337
    new $P1238, 'ExceptionHandler'
    set_addr $P1238, control_1237
    $P1238."handle_types"(.CONTROL_RETURN)
    push_eh $P1238
    .lex "self", self
    .lex "$/", param_1239
.annotate 'line', 338
    new $P1240, "Undef"
    .lex "$hexlit", $P1240
.annotate 'line', 339
    get_hll_global $P1241, ["HLL";"Actions"], "ints_to_string"
    find_lex $P1244, "$/"
    unless_null $P1244, vivify_304
    $P1244 = root_new ['parrot';'Hash']
  vivify_304:
    set $P1245, $P1244["hexint"]
    unless_null $P1245, vivify_305
    new $P1245, "Undef"
  vivify_305:
    unless $P1245, unless_1243
    set $P1242, $P1245
    goto unless_1243_end
  unless_1243:
    find_lex $P1246, "$/"
    unless_null $P1246, vivify_306
    $P1246 = root_new ['parrot';'Hash']
  vivify_306:
    set $P1247, $P1246["hexints"]
    unless_null $P1247, vivify_307
    $P1247 = root_new ['parrot';'Hash']
  vivify_307:
    set $P1248, $P1247["hexint"]
    unless_null $P1248, vivify_308
    new $P1248, "Undef"
  vivify_308:
    set $P1242, $P1248
  unless_1243_end:
    $P1249 = $P1241($P1242)
    store_lex "$hexlit", $P1249
.annotate 'line', 340
    find_lex $P1250, "$/"
    find_lex $P1253, "$/"
    unless_null $P1253, vivify_309
    $P1253 = root_new ['parrot';'Hash']
  vivify_309:
    set $P1254, $P1253["sym"]
    unless_null $P1254, vivify_310
    new $P1254, "Undef"
  vivify_310:
    set $S1255, $P1254
    iseq $I1256, $S1255, "X"
    if $I1256, if_1252
.annotate 'line', 343
    get_hll_global $P1261, ["PAST"], "Regex"
    find_lex $P1262, "$hexlit"
    find_lex $P1263, "$/"
    $P1264 = $P1261."new"($P1262, "literal" :named("pasttype"), $P1263 :named("node"))
    set $P1251, $P1264
.annotate 'line', 340
    goto if_1252_end
  if_1252:
.annotate 'line', 341
    get_hll_global $P1257, ["PAST"], "Regex"
    find_lex $P1258, "$hexlit"
    find_lex $P1259, "$/"
    $P1260 = $P1257."new"($P1258, "enumcharlist" :named("pasttype"), 1 :named("negate"), $P1259 :named("node"))
    set $P1251, $P1260
  if_1252_end:
    $P1265 = $P1250."!make"($P1251)
.annotate 'line', 337
    .return ($P1265)
  control_1237:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1266, exception, "payload"
    .return ($P1266)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<c>"  :subid("74_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_1270
.annotate 'line', 346
    new $P1269, 'ExceptionHandler'
    set_addr $P1269, control_1268
    $P1269."handle_types"(.CONTROL_RETURN)
    push_eh $P1269
    .lex "self", self
    .lex "$/", param_1270
.annotate 'line', 347
    find_lex $P1271, "$/"
    get_hll_global $P1272, ["PAST"], "Regex"
    find_lex $P1273, "$/"
    unless_null $P1273, vivify_311
    $P1273 = root_new ['parrot';'Hash']
  vivify_311:
    set $P1274, $P1273["charspec"]
    unless_null $P1274, vivify_312
    new $P1274, "Undef"
  vivify_312:
    $P1275 = $P1274."ast"()
    find_lex $P1276, "$/"
    $P1277 = $P1272."new"($P1275, "literal" :named("pasttype"), $P1276 :named("node"))
    $P1278 = $P1271."!make"($P1277)
.annotate 'line', 346
    .return ($P1278)
  control_1268:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1279, exception, "payload"
    .return ($P1279)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<misc>"  :subid("75_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_1283
.annotate 'line', 350
    new $P1282, 'ExceptionHandler'
    set_addr $P1282, control_1281
    $P1282."handle_types"(.CONTROL_RETURN)
    push_eh $P1282
    .lex "self", self
    .lex "$/", param_1283
.annotate 'line', 351
    new $P1284, "Undef"
    .lex "$past", $P1284
    get_hll_global $P1285, ["PAST"], "Regex"
    find_lex $P1286, "$/"
    set $S1287, $P1286
    find_lex $P1288, "$/"
    $P1289 = $P1285."new"($S1287, "literal" :named("pasttype"), $P1288 :named("node"))
    store_lex "$past", $P1289
.annotate 'line', 352
    find_lex $P1290, "$/"
    find_lex $P1291, "$past"
    $P1292 = $P1290."!make"($P1291)
.annotate 'line', 350
    .return ($P1292)
  control_1281:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1293, exception, "payload"
    .return ($P1293)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "assertion:sym<?>"  :subid("76_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_1297
.annotate 'line', 356
    new $P1296, 'ExceptionHandler'
    set_addr $P1296, control_1295
    $P1296."handle_types"(.CONTROL_RETURN)
    push_eh $P1296
    .lex "self", self
    .lex "$/", param_1297
.annotate 'line', 357
    new $P1298, "Undef"
    .lex "$past", $P1298
.annotate 'line', 356
    find_lex $P1299, "$past"
.annotate 'line', 358
    find_lex $P1301, "$/"
    unless_null $P1301, vivify_313
    $P1301 = root_new ['parrot';'Hash']
  vivify_313:
    set $P1302, $P1301["assertion"]
    unless_null $P1302, vivify_314
    new $P1302, "Undef"
  vivify_314:
    if $P1302, if_1300
.annotate 'line', 362
    new $P1307, "Integer"
    assign $P1307, 0
    store_lex "$past", $P1307
    goto if_1300_end
  if_1300:
.annotate 'line', 359
    find_lex $P1303, "$/"
    unless_null $P1303, vivify_315
    $P1303 = root_new ['parrot';'Hash']
  vivify_315:
    set $P1304, $P1303["assertion"]
    unless_null $P1304, vivify_316
    new $P1304, "Undef"
  vivify_316:
    $P1305 = $P1304."ast"()
    store_lex "$past", $P1305
.annotate 'line', 360
    find_lex $P1306, "$past"
    $P1306."subtype"("zerowidth")
  if_1300_end:
.annotate 'line', 363
    find_lex $P1308, "$/"
    find_lex $P1309, "$past"
    $P1310 = $P1308."!make"($P1309)
.annotate 'line', 356
    .return ($P1310)
  control_1295:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1311, exception, "payload"
    .return ($P1311)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "assertion:sym<!>"  :subid("77_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_1315
.annotate 'line', 366
    new $P1314, 'ExceptionHandler'
    set_addr $P1314, control_1313
    $P1314."handle_types"(.CONTROL_RETURN)
    push_eh $P1314
    .lex "self", self
    .lex "$/", param_1315
.annotate 'line', 367
    new $P1316, "Undef"
    .lex "$past", $P1316
.annotate 'line', 366
    find_lex $P1317, "$past"
.annotate 'line', 368
    find_lex $P1319, "$/"
    unless_null $P1319, vivify_317
    $P1319 = root_new ['parrot';'Hash']
  vivify_317:
    set $P1320, $P1319["assertion"]
    unless_null $P1320, vivify_318
    new $P1320, "Undef"
  vivify_318:
    if $P1320, if_1318
.annotate 'line', 374
    get_hll_global $P1329, ["PAST"], "Regex"
    find_lex $P1330, "$/"
    $P1331 = $P1329."new"("anchor" :named("pasttype"), "fail" :named("subtype"), $P1330 :named("node"))
    store_lex "$past", $P1331
.annotate 'line', 373
    goto if_1318_end
  if_1318:
.annotate 'line', 369
    find_lex $P1321, "$/"
    unless_null $P1321, vivify_319
    $P1321 = root_new ['parrot';'Hash']
  vivify_319:
    set $P1322, $P1321["assertion"]
    unless_null $P1322, vivify_320
    new $P1322, "Undef"
  vivify_320:
    $P1323 = $P1322."ast"()
    store_lex "$past", $P1323
.annotate 'line', 370
    find_lex $P1324, "$past"
    find_lex $P1325, "$past"
    $P1326 = $P1325."negate"()
    isfalse $I1327, $P1326
    $P1324."negate"($I1327)
.annotate 'line', 371
    find_lex $P1328, "$past"
    $P1328."subtype"("zerowidth")
  if_1318_end:
.annotate 'line', 376
    find_lex $P1332, "$/"
    find_lex $P1333, "$past"
    $P1334 = $P1332."!make"($P1333)
.annotate 'line', 366
    .return ($P1334)
  control_1313:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1335, exception, "payload"
    .return ($P1335)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "assertion:sym<method>"  :subid("78_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_1339
.annotate 'line', 379
    new $P1338, 'ExceptionHandler'
    set_addr $P1338, control_1337
    $P1338."handle_types"(.CONTROL_RETURN)
    push_eh $P1338
    .lex "self", self
    .lex "$/", param_1339
.annotate 'line', 380
    new $P1340, "Undef"
    .lex "$past", $P1340
    find_lex $P1341, "$/"
    unless_null $P1341, vivify_321
    $P1341 = root_new ['parrot';'Hash']
  vivify_321:
    set $P1342, $P1341["assertion"]
    unless_null $P1342, vivify_322
    new $P1342, "Undef"
  vivify_322:
    $P1343 = $P1342."ast"()
    store_lex "$past", $P1343
.annotate 'line', 381
    find_lex $P1344, "$past"
    $P1344."subtype"("method")
.annotate 'line', 382
    find_lex $P1345, "$past"
    $P1345."name"("")
.annotate 'line', 383
    find_lex $P1346, "$/"
    find_lex $P1347, "$past"
    $P1348 = $P1346."!make"($P1347)
.annotate 'line', 379
    .return ($P1348)
  control_1337:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1349, exception, "payload"
    .return ($P1349)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "assertion:sym<name>"  :subid("79_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_1353
.annotate 'line', 386
    .const 'Sub' $P1410 = "81_1280467473.99327" 
    capture_lex $P1410
    .const 'Sub' $P1376 = "80_1280467473.99327" 
    capture_lex $P1376
    new $P1352, 'ExceptionHandler'
    set_addr $P1352, control_1351
    $P1352."handle_types"(.CONTROL_RETURN)
    push_eh $P1352
    .lex "self", self
    .lex "$/", param_1353
.annotate 'line', 387
    new $P1354, "Undef"
    .lex "$name", $P1354
.annotate 'line', 388
    new $P1355, "Undef"
    .lex "$past", $P1355
.annotate 'line', 387
    find_lex $P1356, "$/"
    unless_null $P1356, vivify_323
    $P1356 = root_new ['parrot';'Hash']
  vivify_323:
    set $P1357, $P1356["longname"]
    unless_null $P1357, vivify_324
    new $P1357, "Undef"
  vivify_324:
    set $S1358, $P1357
    new $P1359, 'String'
    set $P1359, $S1358
    store_lex "$name", $P1359
    find_lex $P1360, "$past"
.annotate 'line', 389
    find_lex $P1362, "$/"
    unless_null $P1362, vivify_325
    $P1362 = root_new ['parrot';'Hash']
  vivify_325:
    set $P1363, $P1362["assertion"]
    unless_null $P1363, vivify_326
    new $P1363, "Undef"
  vivify_326:
    if $P1363, if_1361
.annotate 'line', 393
    find_lex $P1372, "$name"
    set $S1373, $P1372
    iseq $I1374, $S1373, "sym"
    if $I1374, if_1371
.annotate 'line', 409
    find_lex $P1386, "self"
    find_lex $P1387, "$/"
    $P1388 = $P1386."named_assertion"($P1387)
    store_lex "$past", $P1388
.annotate 'line', 410
    find_lex $P1390, "$/"
    unless_null $P1390, vivify_327
    $P1390 = root_new ['parrot';'Hash']
  vivify_327:
    set $P1391, $P1390["nibbler"]
    unless_null $P1391, vivify_328
    new $P1391, "Undef"
  vivify_328:
    if $P1391, if_1389
.annotate 'line', 413
    find_lex $P1399, "$/"
    unless_null $P1399, vivify_329
    $P1399 = root_new ['parrot';'Hash']
  vivify_329:
    set $P1400, $P1399["arglist"]
    unless_null $P1400, vivify_330
    new $P1400, "Undef"
  vivify_330:
    unless $P1400, if_1398_end
.annotate 'line', 414
    find_lex $P1402, "$/"
    unless_null $P1402, vivify_331
    $P1402 = root_new ['parrot';'Hash']
  vivify_331:
    set $P1403, $P1402["arglist"]
    unless_null $P1403, vivify_332
    $P1403 = root_new ['parrot';'ResizablePMCArray']
  vivify_332:
    set $P1404, $P1403[0]
    unless_null $P1404, vivify_333
    new $P1404, "Undef"
  vivify_333:
    $P1405 = $P1404."ast"()
    $P1406 = $P1405."list"()
    defined $I1407, $P1406
    unless $I1407, for_undef_334
    iter $P1401, $P1406
    new $P1416, 'ExceptionHandler'
    set_addr $P1416, loop1415_handler
    $P1416."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1416
  loop1415_test:
    unless $P1401, loop1415_done
    shift $P1408, $P1401
  loop1415_redo:
    .const 'Sub' $P1410 = "81_1280467473.99327" 
    capture_lex $P1410
    $P1410($P1408)
  loop1415_next:
    goto loop1415_test
  loop1415_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1417, exception, 'type'
    eq $P1417, .CONTROL_LOOP_NEXT, loop1415_next
    eq $P1417, .CONTROL_LOOP_REDO, loop1415_redo
  loop1415_done:
    pop_eh 
  for_undef_334:
  if_1398_end:
.annotate 'line', 413
    goto if_1389_end
  if_1389:
.annotate 'line', 411
    find_lex $P1392, "$past"
    find_lex $P1393, "$/"
    unless_null $P1393, vivify_335
    $P1393 = root_new ['parrot';'Hash']
  vivify_335:
    set $P1394, $P1393["nibbler"]
    unless_null $P1394, vivify_336
    $P1394 = root_new ['parrot';'ResizablePMCArray']
  vivify_336:
    set $P1395, $P1394[0]
    unless_null $P1395, vivify_337
    new $P1395, "Undef"
  vivify_337:
    $P1396 = $P1395."ast"()
    $P1397 = "buildsub"($P1396)
    $P1392."push"($P1397)
  if_1389_end:
.annotate 'line', 408
    goto if_1371_end
  if_1371:
.annotate 'line', 393
    .const 'Sub' $P1376 = "80_1280467473.99327" 
    capture_lex $P1376
    $P1376()
  if_1371_end:
    goto if_1361_end
  if_1361:
.annotate 'line', 390
    find_lex $P1364, "$/"
    unless_null $P1364, vivify_338
    $P1364 = root_new ['parrot';'Hash']
  vivify_338:
    set $P1365, $P1364["assertion"]
    unless_null $P1365, vivify_339
    $P1365 = root_new ['parrot';'ResizablePMCArray']
  vivify_339:
    set $P1366, $P1365[0]
    unless_null $P1366, vivify_340
    new $P1366, "Undef"
  vivify_340:
    $P1367 = $P1366."ast"()
    store_lex "$past", $P1367
.annotate 'line', 391
    find_lex $P1368, "self"
    find_lex $P1369, "$past"
    find_lex $P1370, "$name"
    $P1368."subrule_alias"($P1369, $P1370)
  if_1361_end:
.annotate 'line', 417
    find_lex $P1418, "$/"
    find_lex $P1419, "$past"
    $P1420 = $P1418."!make"($P1419)
.annotate 'line', 386
    .return ($P1420)
  control_1351:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1421, exception, "payload"
    .return ($P1421)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1409"  :anon :subid("81_1280467473.99327") :outer("79_1280467473.99327")
    .param pmc param_1411
.annotate 'line', 414
    .lex "$_", param_1411
    find_lex $P1412, "$past"
    find_lex $P1413, "$_"
    $P1414 = $P1412."push"($P1413)
    .return ($P1414)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1375"  :anon :subid("80_1280467473.99327") :outer("79_1280467473.99327")
.annotate 'line', 394
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
.annotate 'line', 403
    get_hll_global $P1379, ["PAST"], "Regex"
.annotate 'line', 404
    get_hll_global $P1380, ["PAST"], "Regex"
    find_lex $P1381, "$regexsym"
    $P1382 = $P1380."new"($P1381, "literal" :named("pasttype"))
    find_lex $P1383, "$name"
    find_lex $P1384, "$/"
    $P1385 = $P1379."new"($P1382, $P1383 :named("name"), "subcapture" :named("pasttype"), $P1384 :named("node"))
.annotate 'line', 403
    store_lex "$past", $P1385
.annotate 'line', 393
    .return ($P1385)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "assertion:sym<[>"  :subid("82_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_1425
.annotate 'line', 420
    .const 'Sub' $P1460 = "83_1280467473.99327" 
    capture_lex $P1460
    new $P1424, 'ExceptionHandler'
    set_addr $P1424, control_1423
    $P1424."handle_types"(.CONTROL_RETURN)
    push_eh $P1424
    .lex "self", self
    .lex "$/", param_1425
.annotate 'line', 421
    new $P1426, "Undef"
    .lex "$clist", $P1426
.annotate 'line', 422
    new $P1427, "Undef"
    .lex "$past", $P1427
.annotate 'line', 431
    new $P1428, "Undef"
    .lex "$i", $P1428
.annotate 'line', 432
    new $P1429, "Undef"
    .lex "$n", $P1429
.annotate 'line', 421
    find_lex $P1430, "$/"
    unless_null $P1430, vivify_341
    $P1430 = root_new ['parrot';'Hash']
  vivify_341:
    set $P1431, $P1430["cclass_elem"]
    unless_null $P1431, vivify_342
    new $P1431, "Undef"
  vivify_342:
    store_lex "$clist", $P1431
.annotate 'line', 422
    find_lex $P1432, "$clist"
    unless_null $P1432, vivify_343
    $P1432 = root_new ['parrot';'ResizablePMCArray']
  vivify_343:
    set $P1433, $P1432[0]
    unless_null $P1433, vivify_344
    new $P1433, "Undef"
  vivify_344:
    $P1434 = $P1433."ast"()
    store_lex "$past", $P1434
.annotate 'line', 423
    find_lex $P1438, "$past"
    $P1439 = $P1438."negate"()
    if $P1439, if_1437
    set $P1436, $P1439
    goto if_1437_end
  if_1437:
    find_lex $P1440, "$past"
    $S1441 = $P1440."pasttype"()
    iseq $I1442, $S1441, "subrule"
    new $P1436, 'Integer'
    set $P1436, $I1442
  if_1437_end:
    unless $P1436, if_1435_end
.annotate 'line', 424
    find_lex $P1443, "$past"
    $P1443."subtype"("zerowidth")
.annotate 'line', 425
    get_hll_global $P1444, ["PAST"], "Regex"
    find_lex $P1445, "$past"
.annotate 'line', 427
    get_hll_global $P1446, ["PAST"], "Regex"
    $P1447 = $P1446."new"("charclass" :named("pasttype"), "." :named("subtype"))
    find_lex $P1448, "$/"
    $P1449 = $P1444."new"($P1445, $P1447, $P1448 :named("node"))
.annotate 'line', 425
    store_lex "$past", $P1449
  if_1435_end:
.annotate 'line', 431
    new $P1450, "Integer"
    assign $P1450, 1
    store_lex "$i", $P1450
.annotate 'line', 432
    find_lex $P1451, "$clist"
    set $N1452, $P1451
    new $P1453, 'Float'
    set $P1453, $N1452
    store_lex "$n", $P1453
.annotate 'line', 433
    new $P1484, 'ExceptionHandler'
    set_addr $P1484, loop1483_handler
    $P1484."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1484
  loop1483_test:
    find_lex $P1454, "$i"
    set $N1455, $P1454
    find_lex $P1456, "$n"
    set $N1457, $P1456
    islt $I1458, $N1455, $N1457
    unless $I1458, loop1483_done
  loop1483_redo:
    .const 'Sub' $P1460 = "83_1280467473.99327" 
    capture_lex $P1460
    $P1460()
  loop1483_next:
    goto loop1483_test
  loop1483_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1485, exception, 'type'
    eq $P1485, .CONTROL_LOOP_NEXT, loop1483_next
    eq $P1485, .CONTROL_LOOP_REDO, loop1483_redo
  loop1483_done:
    pop_eh 
.annotate 'line', 444
    find_lex $P1486, "$/"
    find_lex $P1487, "$past"
    $P1488 = $P1486."!make"($P1487)
.annotate 'line', 420
    .return ($P1488)
  control_1423:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1489, exception, "payload"
    .return ($P1489)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1459"  :anon :subid("83_1280467473.99327") :outer("82_1280467473.99327")
.annotate 'line', 434
    new $P1461, "Undef"
    .lex "$ast", $P1461
    find_lex $P1462, "$i"
    set $I1463, $P1462
    find_lex $P1464, "$clist"
    unless_null $P1464, vivify_345
    $P1464 = root_new ['parrot';'ResizablePMCArray']
  vivify_345:
    set $P1465, $P1464[$I1463]
    unless_null $P1465, vivify_346
    new $P1465, "Undef"
  vivify_346:
    $P1466 = $P1465."ast"()
    store_lex "$ast", $P1466
.annotate 'line', 435
    find_lex $P1468, "$ast"
    $P1469 = $P1468."negate"()
    if $P1469, if_1467
.annotate 'line', 440
    get_hll_global $P1476, ["PAST"], "Regex"
    find_lex $P1477, "$past"
    find_lex $P1478, "$ast"
    find_lex $P1479, "$/"
    $P1480 = $P1476."new"($P1477, $P1478, "alt" :named("pasttype"), $P1479 :named("node"))
    store_lex "$past", $P1480
.annotate 'line', 439
    goto if_1467_end
  if_1467:
.annotate 'line', 436
    find_lex $P1470, "$ast"
    $P1470."subtype"("zerowidth")
.annotate 'line', 437
    get_hll_global $P1471, ["PAST"], "Regex"
    find_lex $P1472, "$ast"
    find_lex $P1473, "$past"
    find_lex $P1474, "$/"
    $P1475 = $P1471."new"($P1472, $P1473, "concat" :named("pasttype"), $P1474 :named("node"))
    store_lex "$past", $P1475
  if_1467_end:
.annotate 'line', 442
    find_lex $P1481, "$i"
    add $P1482, $P1481, 1
    store_lex "$i", $P1482
.annotate 'line', 433
    .return ($P1482)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "cclass_elem"  :subid("84_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_1493
.annotate 'line', 447
    .const 'Sub' $P1518 = "86_1280467473.99327" 
    capture_lex $P1518
    .const 'Sub' $P1502 = "85_1280467473.99327" 
    capture_lex $P1502
    new $P1492, 'ExceptionHandler'
    set_addr $P1492, control_1491
    $P1492."handle_types"(.CONTROL_RETURN)
    push_eh $P1492
    .lex "self", self
    .lex "$/", param_1493
.annotate 'line', 448
    new $P1494, "Undef"
    .lex "$str", $P1494
.annotate 'line', 449
    new $P1495, "Undef"
    .lex "$past", $P1495
.annotate 'line', 448
    new $P1496, "String"
    assign $P1496, ""
    store_lex "$str", $P1496
    find_lex $P1497, "$past"
.annotate 'line', 450
    find_lex $P1499, "$/"
    unless_null $P1499, vivify_347
    $P1499 = root_new ['parrot';'Hash']
  vivify_347:
    set $P1500, $P1499["name"]
    unless_null $P1500, vivify_348
    new $P1500, "Undef"
  vivify_348:
    if $P1500, if_1498
.annotate 'line', 454
    find_lex $P1513, "$/"
    unless_null $P1513, vivify_349
    $P1513 = root_new ['parrot';'Hash']
  vivify_349:
    set $P1514, $P1513["charspec"]
    unless_null $P1514, vivify_350
    new $P1514, "Undef"
  vivify_350:
    defined $I1515, $P1514
    unless $I1515, for_undef_351
    iter $P1512, $P1514
    new $P1544, 'ExceptionHandler'
    set_addr $P1544, loop1543_handler
    $P1544."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1544
  loop1543_test:
    unless $P1512, loop1543_done
    shift $P1516, $P1512
  loop1543_redo:
    .const 'Sub' $P1518 = "86_1280467473.99327" 
    capture_lex $P1518
    $P1518($P1516)
  loop1543_next:
    goto loop1543_test
  loop1543_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1545, exception, 'type'
    eq $P1545, .CONTROL_LOOP_NEXT, loop1543_next
    eq $P1545, .CONTROL_LOOP_REDO, loop1543_redo
  loop1543_done:
    pop_eh 
  for_undef_351:
.annotate 'line', 479
    get_hll_global $P1546, ["PAST"], "Regex"
    find_lex $P1547, "$str"
    find_lex $P1548, "$/"
    $P1549 = $P1546."new"($P1547, "enumcharlist" :named("pasttype"), $P1548 :named("node"))
    store_lex "$past", $P1549
.annotate 'line', 453
    goto if_1498_end
  if_1498:
.annotate 'line', 450
    .const 'Sub' $P1502 = "85_1280467473.99327" 
    capture_lex $P1502
    $P1502()
  if_1498_end:
.annotate 'line', 481
    find_lex $P1550, "$past"
    find_lex $P1551, "$/"
    unless_null $P1551, vivify_363
    $P1551 = root_new ['parrot';'Hash']
  vivify_363:
    set $P1552, $P1551["sign"]
    unless_null $P1552, vivify_364
    new $P1552, "Undef"
  vivify_364:
    set $S1553, $P1552
    iseq $I1554, $S1553, "-"
    $P1550."negate"($I1554)
.annotate 'line', 482
    find_lex $P1555, "$/"
    find_lex $P1556, "$past"
    $P1557 = $P1555."!make"($P1556)
.annotate 'line', 447
    .return ($P1557)
  control_1491:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1558, exception, "payload"
    .return ($P1558)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1517"  :anon :subid("86_1280467473.99327") :outer("84_1280467473.99327")
    .param pmc param_1519
.annotate 'line', 454
    .const 'Sub' $P1525 = "87_1280467473.99327" 
    capture_lex $P1525
    .lex "$_", param_1519
.annotate 'line', 455
    find_lex $P1522, "$_"
    unless_null $P1522, vivify_352
    $P1522 = root_new ['parrot';'ResizablePMCArray']
  vivify_352:
    set $P1523, $P1522[1]
    unless_null $P1523, vivify_353
    new $P1523, "Undef"
  vivify_353:
    if $P1523, if_1521
.annotate 'line', 477
    find_lex $P1539, "$str"
    find_lex $P1540, "$_"
    unless_null $P1540, vivify_354
    $P1540 = root_new ['parrot';'ResizablePMCArray']
  vivify_354:
    set $P1541, $P1540[0]
    unless_null $P1541, vivify_355
    new $P1541, "Undef"
  vivify_355:
    concat $P1542, $P1539, $P1541
    store_lex "$str", $P1542
    set $P1520, $P1542
.annotate 'line', 455
    goto if_1521_end
  if_1521:
    .const 'Sub' $P1525 = "87_1280467473.99327" 
    capture_lex $P1525
    $P1538 = $P1525()
    set $P1520, $P1538
  if_1521_end:
.annotate 'line', 454
    .return ($P1520)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1524"  :anon :subid("87_1280467473.99327") :outer("86_1280467473.99327")
.annotate 'line', 456
    new $P1526, "Undef"
    .lex "$a", $P1526
.annotate 'line', 457
    new $P1527, "Undef"
    .lex "$b", $P1527
.annotate 'line', 458
    new $P1528, "Undef"
    .lex "$c", $P1528
.annotate 'line', 456
    find_lex $P1529, "$_"
    unless_null $P1529, vivify_356
    $P1529 = root_new ['parrot';'ResizablePMCArray']
  vivify_356:
    set $P1530, $P1529[0]
    unless_null $P1530, vivify_357
    new $P1530, "Undef"
  vivify_357:
    store_lex "$a", $P1530
.annotate 'line', 457
    find_lex $P1531, "$_"
    unless_null $P1531, vivify_358
    $P1531 = root_new ['parrot';'ResizablePMCArray']
  vivify_358:
    set $P1532, $P1531[1]
    unless_null $P1532, vivify_359
    $P1532 = root_new ['parrot';'ResizablePMCArray']
  vivify_359:
    set $P1533, $P1532[0]
    unless_null $P1533, vivify_360
    new $P1533, "Undef"
  vivify_360:
    store_lex "$b", $P1533
.annotate 'line', 458

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
                             $P1534 = box $S2
                         
    store_lex "$c", $P1534
.annotate 'line', 475
    find_lex $P1535, "$str"
    find_lex $P1536, "$c"
    concat $P1537, $P1535, $P1536
    store_lex "$str", $P1537
.annotate 'line', 455
    .return ($P1537)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1501"  :anon :subid("85_1280467473.99327") :outer("84_1280467473.99327")
.annotate 'line', 451
    new $P1503, "Undef"
    .lex "$name", $P1503
    find_lex $P1504, "$/"
    unless_null $P1504, vivify_361
    $P1504 = root_new ['parrot';'Hash']
  vivify_361:
    set $P1505, $P1504["name"]
    unless_null $P1505, vivify_362
    new $P1505, "Undef"
  vivify_362:
    set $S1506, $P1505
    new $P1507, 'String'
    set $P1507, $S1506
    store_lex "$name", $P1507
.annotate 'line', 452
    get_hll_global $P1508, ["PAST"], "Regex"
    find_lex $P1509, "$name"
    find_lex $P1510, "$/"
    $P1511 = $P1508."new"($P1509, "subrule" :named("pasttype"), "method" :named("subtype"), $P1510 :named("node"))
    store_lex "$past", $P1511
.annotate 'line', 450
    .return ($P1511)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "mod_internal"  :subid("88_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_1562
.annotate 'line', 485
    new $P1561, 'ExceptionHandler'
    set_addr $P1561, control_1560
    $P1561."handle_types"(.CONTROL_RETURN)
    push_eh $P1561
    .lex "self", self
    .lex "$/", param_1562
.annotate 'line', 486
    $P1563 = root_new ['parrot';'Hash']
    .lex "%mods", $P1563
.annotate 'line', 487
    new $P1564, "Undef"
    .lex "$n", $P1564
.annotate 'line', 486
    get_global $P1565, "@MODIFIERS"
    unless_null $P1565, vivify_365
    $P1565 = root_new ['parrot';'ResizablePMCArray']
  vivify_365:
    set $P1566, $P1565[0]
    unless_null $P1566, vivify_366
    new $P1566, "Undef"
  vivify_366:
    store_lex "%mods", $P1566
.annotate 'line', 487
    find_lex $P1569, "$/"
    unless_null $P1569, vivify_367
    $P1569 = root_new ['parrot';'Hash']
  vivify_367:
    set $P1570, $P1569["n"]
    unless_null $P1570, vivify_368
    $P1570 = root_new ['parrot';'ResizablePMCArray']
  vivify_368:
    set $P1571, $P1570[0]
    unless_null $P1571, vivify_369
    new $P1571, "Undef"
  vivify_369:
    set $S1572, $P1571
    isgt $I1573, $S1572, ""
    if $I1573, if_1568
    new $P1578, "Integer"
    assign $P1578, 1
    set $P1567, $P1578
    goto if_1568_end
  if_1568:
    find_lex $P1574, "$/"
    unless_null $P1574, vivify_370
    $P1574 = root_new ['parrot';'Hash']
  vivify_370:
    set $P1575, $P1574["n"]
    unless_null $P1575, vivify_371
    $P1575 = root_new ['parrot';'ResizablePMCArray']
  vivify_371:
    set $P1576, $P1575[0]
    unless_null $P1576, vivify_372
    new $P1576, "Undef"
  vivify_372:
    set $N1577, $P1576
    new $P1567, 'Float'
    set $P1567, $N1577
  if_1568_end:
    store_lex "$n", $P1567
.annotate 'line', 488
    find_lex $P1579, "$n"
    find_lex $P1580, "$/"
    unless_null $P1580, vivify_373
    $P1580 = root_new ['parrot';'Hash']
  vivify_373:
    set $P1581, $P1580["mod_ident"]
    unless_null $P1581, vivify_374
    $P1581 = root_new ['parrot';'Hash']
  vivify_374:
    set $P1582, $P1581["sym"]
    unless_null $P1582, vivify_375
    new $P1582, "Undef"
  vivify_375:
    set $S1583, $P1582
    find_lex $P1584, "%mods"
    unless_null $P1584, vivify_376
    $P1584 = root_new ['parrot';'Hash']
    store_lex "%mods", $P1584
  vivify_376:
    set $P1584[$S1583], $P1579
.annotate 'line', 489
    find_lex $P1585, "$/"
    $P1586 = $P1585."!make"(0)
.annotate 'line', 485
    .return ($P1586)
  control_1560:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1587, exception, "payload"
    .return ($P1587)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "subrule_alias"  :subid("89_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_1594
    .param pmc param_1595
.annotate 'line', 583
    new $P1593, 'ExceptionHandler'
    set_addr $P1593, control_1592
    $P1593."handle_types"(.CONTROL_RETURN)
    push_eh $P1593
    .lex "self", self
    .lex "$past", param_1594
    .lex "$name", param_1595
.annotate 'line', 584
    find_lex $P1597, "$past"
    $S1598 = $P1597."name"()
    isgt $I1599, $S1598, ""
    if $I1599, if_1596
.annotate 'line', 585
    find_lex $P1606, "$past"
    find_lex $P1607, "$name"
    $P1606."name"($P1607)
    goto if_1596_end
  if_1596:
.annotate 'line', 584
    find_lex $P1600, "$past"
    find_lex $P1601, "$name"
    concat $P1602, $P1601, "="
    find_lex $P1603, "$past"
    $S1604 = $P1603."name"()
    concat $P1605, $P1602, $S1604
    $P1600."name"($P1605)
  if_1596_end:
.annotate 'line', 586
    find_lex $P1608, "$past"
    $P1609 = $P1608."subtype"("capture")
.annotate 'line', 583
    .return ($P1609)
  control_1592:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1610, exception, "payload"
    .return ($P1610)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "named_assertion"  :subid("90_1280467473.99327") :method :outer("11_1280467473.99327")
    .param pmc param_1614
.annotate 'line', 589
    new $P1613, 'ExceptionHandler'
    set_addr $P1613, control_1612
    $P1613."handle_types"(.CONTROL_RETURN)
    push_eh $P1613
    .lex "self", self
    .lex "$/", param_1614
.annotate 'line', 590
    new $P1615, "Undef"
    .lex "$name", $P1615
.annotate 'line', 591
    new $P1616, "Undef"
    .lex "$past", $P1616
.annotate 'line', 590
    find_lex $P1617, "$/"
    unless_null $P1617, vivify_377
    $P1617 = root_new ['parrot';'Hash']
  vivify_377:
    set $P1618, $P1617["longname"]
    unless_null $P1618, vivify_378
    new $P1618, "Undef"
  vivify_378:
    set $S1619, $P1618
    new $P1620, 'String'
    set $P1620, $S1619
    store_lex "$name", $P1620
.annotate 'line', 591
    get_hll_global $P1621, ["PAST"], "Regex"
    find_lex $P1622, "$name"
    find_lex $P1623, "$name"
    find_lex $P1624, "$/"
    $P1625 = $P1621."new"($P1622, $P1623 :named("name"), "subrule" :named("pasttype"), "capture" :named("subtype"), $P1624 :named("node"))
    store_lex "$past", $P1625
    find_lex $P1626, "$past"
.annotate 'line', 589
    .return ($P1626)
  control_1612:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1627, exception, "payload"
    .return ($P1627)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1629" :load :anon :subid("91_1280467473.99327")
.annotate 'line', 4
    .const 'Sub' $P1631 = "11_1280467473.99327" 
    $P1632 = $P1631()
    .return ($P1632)
.end


.namespace []
.sub "_block1635" :load :anon :subid("92_1280467473.99327")
.annotate 'line', 1
    .const 'Sub' $P1637 = "10_1280467473.99327" 
    $P1638 = $P1637()
    .return ($P1638)
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
