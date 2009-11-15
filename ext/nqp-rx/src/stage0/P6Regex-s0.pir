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
.sub "_block11"  :anon :subid("10_1258208089.76063")
.annotate "line", 0
    get_hll_global $P14, ["Regex";"P6Regex";"Grammar"], "_block13"
    capture_lex $P14
.annotate "line", 3
    get_hll_global $P14, ["Regex";"P6Regex";"Grammar"], "_block13"
    capture_lex $P14
    $P523 = $P14()
.annotate "line", 1
    .return ($P523)
.end


.namespace []
.sub "" :load :init :subid("post158") :outer("10_1258208089.76063")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1258208089.76063"
    .local pmc block
    set block, $P12
    $P524 = get_root_global ["parrot"], "P6metaclass"
    $P524."new_class"("Regex::P6Regex::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block13"  :subid("11_1258208089.76063") :outer("10_1258208089.76063")
.annotate "line", 3
    .const 'Sub' $P516 = "156_1258208089.76063"
    capture_lex $P516
    .const 'Sub' $P509 = "154_1258208089.76063"
    capture_lex $P509
    .const 'Sub' $P502 = "152_1258208089.76063"
    capture_lex $P502
    .const 'Sub' $P482 = "147_1258208089.76063"
    capture_lex $P482
    .const 'Sub' $P448 = "141_1258208089.76063"
    capture_lex $P448
    .const 'Sub' $P437 = "138_1258208089.76063"
    capture_lex $P437
    .const 'Sub' $P425 = "135_1258208089.76063"
    capture_lex $P425
    .const 'Sub' $P420 = "133_1258208089.76063"
    capture_lex $P420
    .const 'Sub' $P410 = "130_1258208089.76063"
    capture_lex $P410
    .const 'Sub' $P400 = "127_1258208089.76063"
    capture_lex $P400
    .const 'Sub' $P392 = "123_1258208089.76063"
    capture_lex $P392
    .const 'Sub' $P387 = "121_1258208089.76063"
    capture_lex $P387
    .const 'Sub' $P382 = "119_1258208089.76063"
    capture_lex $P382
    .const 'Sub' $P377 = "117_1258208089.76063"
    capture_lex $P377
    .const 'Sub' $P372 = "115_1258208089.76063"
    capture_lex $P372
    .const 'Sub' $P362 = "113_1258208089.76063"
    capture_lex $P362
    .const 'Sub' $P352 = "111_1258208089.76063"
    capture_lex $P352
    .const 'Sub' $P345 = "109_1258208089.76063"
    capture_lex $P345
    .const 'Sub' $P340 = "107_1258208089.76063"
    capture_lex $P340
    .const 'Sub' $P335 = "105_1258208089.76063"
    capture_lex $P335
    .const 'Sub' $P330 = "103_1258208089.76063"
    capture_lex $P330
    .const 'Sub' $P325 = "101_1258208089.76063"
    capture_lex $P325
    .const 'Sub' $P320 = "99_1258208089.76063"
    capture_lex $P320
    .const 'Sub' $P315 = "97_1258208089.76063"
    capture_lex $P315
    .const 'Sub' $P310 = "95_1258208089.76063"
    capture_lex $P310
    .const 'Sub' $P305 = "93_1258208089.76063"
    capture_lex $P305
    .const 'Sub' $P294 = "89_1258208089.76063"
    capture_lex $P294
    .const 'Sub' $P283 = "87_1258208089.76063"
    capture_lex $P283
    .const 'Sub' $P277 = "85_1258208089.76063"
    capture_lex $P277
    .const 'Sub' $P261 = "83_1258208089.76063"
    capture_lex $P261
    .const 'Sub' $P255 = "81_1258208089.76063"
    capture_lex $P255
    .const 'Sub' $P250 = "79_1258208089.76063"
    capture_lex $P250
    .const 'Sub' $P245 = "77_1258208089.76063"
    capture_lex $P245
    .const 'Sub' $P239 = "75_1258208089.76063"
    capture_lex $P239
    .const 'Sub' $P233 = "73_1258208089.76063"
    capture_lex $P233
    .const 'Sub' $P227 = "71_1258208089.76063"
    capture_lex $P227
    .const 'Sub' $P221 = "69_1258208089.76063"
    capture_lex $P221
    .const 'Sub' $P216 = "67_1258208089.76063"
    capture_lex $P216
    .const 'Sub' $P211 = "65_1258208089.76063"
    capture_lex $P211
    .const 'Sub' $P206 = "63_1258208089.76063"
    capture_lex $P206
    .const 'Sub' $P201 = "61_1258208089.76063"
    capture_lex $P201
    .const 'Sub' $P196 = "59_1258208089.76063"
    capture_lex $P196
    .const 'Sub' $P191 = "57_1258208089.76063"
    capture_lex $P191
    .const 'Sub' $P186 = "55_1258208089.76063"
    capture_lex $P186
    .const 'Sub' $P181 = "53_1258208089.76063"
    capture_lex $P181
    .const 'Sub' $P176 = "51_1258208089.76063"
    capture_lex $P176
    .const 'Sub' $P161 = "46_1258208089.76063"
    capture_lex $P161
    .const 'Sub' $P150 = "44_1258208089.76063"
    capture_lex $P150
    .const 'Sub' $P144 = "42_1258208089.76063"
    capture_lex $P144
    .const 'Sub' $P138 = "40_1258208089.76063"
    capture_lex $P138
    .const 'Sub' $P132 = "38_1258208089.76063"
    capture_lex $P132
    .const 'Sub' $P114 = "33_1258208089.76063"
    capture_lex $P114
    .const 'Sub' $P102 = "30_1258208089.76063"
    capture_lex $P102
    .const 'Sub' $P96 = "28_1258208089.76063"
    capture_lex $P96
    .const 'Sub' $P85 = "26_1258208089.76063"
    capture_lex $P85
    .const 'Sub' $P79 = "24_1258208089.76063"
    capture_lex $P79
    .const 'Sub' $P68 = "22_1258208089.76063"
    capture_lex $P68
    .const 'Sub' $P61 = "20_1258208089.76063"
    capture_lex $P61
    .const 'Sub' $P54 = "18_1258208089.76063"
    capture_lex $P54
    .const 'Sub' $P45 = "15_1258208089.76063"
    capture_lex $P45
    .const 'Sub' $P38 = "13_1258208089.76063"
    capture_lex $P38
    .const 'Sub' $P15 = "12_1258208089.76063"
    capture_lex $P15
    .const 'Sub' $P516 = "156_1258208089.76063"
    capture_lex $P516
    .return ($P516)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "obs"  :subid("12_1258208089.76063") :method :outer("11_1258208089.76063")
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
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "ws"  :subid("13_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx39_tgt
    .local int rx39_pos
    .local int rx39_off
    .local int rx39_eos
    .local int rx39_rep
    .local pmc rx39_cur
    (rx39_cur, rx39_pos, rx39_tgt, $I10) = self."!cursor_start"()
    rx39_cur."!cursor_debug"("START ", "ws")
    .lex unicode:"$\x{a2}", rx39_cur
    .local pmc match
    .lex "$/", match
    length rx39_eos, rx39_tgt
    set rx39_off, 0
    lt $I10, 2, rx39_start
    sub rx39_off, $I10, 1
    substr rx39_tgt, rx39_tgt, rx39_off
  rx39_start:
.annotate "line", 8
  # rx rxquantr42 ** 0..*
    set_addr $I44, rxquantr42_done
    rx39_cur."!mark_push"(0, rx39_pos, $I44)
  rxquantr42_loop:
  alt43_0:
    set_addr $I10, alt43_1
    rx39_cur."!mark_push"(0, rx39_pos, $I10)
  # rx charclass_q s r 1..-1
    sub $I10, rx39_pos, rx39_off
    find_not_cclass $I11, 32, rx39_tgt, $I10, rx39_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx39_fail
    add rx39_pos, rx39_off, $I11
    goto alt43_end
  alt43_1:
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
  alt43_end:
    (rx39_rep) = rx39_cur."!mark_commit"($I44)
    rx39_cur."!mark_push"(rx39_rep, rx39_pos, $I44)
    goto rxquantr42_loop
  rxquantr42_done:
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
.sub "!PREFIX__ws"  :subid("14_1258208089.76063") :method
.annotate "line", 3
    new $P41, "ResizablePMCArray"
    push $P41, ""
    .return ($P41)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "normspace"  :subid("15_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .const 'Sub' $P50 = "17_1258208089.76063"
    capture_lex $P50
    .local string rx46_tgt
    .local int rx46_pos
    .local int rx46_off
    .local int rx46_eos
    .local int rx46_rep
    .local pmc rx46_cur
    (rx46_cur, rx46_pos, rx46_tgt, $I10) = self."!cursor_start"()
    rx46_cur."!cursor_debug"("START ", "normspace")
    .lex unicode:"$\x{a2}", rx46_cur
    .local pmc match
    .lex "$/", match
    length rx46_eos, rx46_tgt
    set rx46_off, 0
    lt $I10, 2, rx46_start
    sub rx46_off, $I10, 1
    substr rx46_tgt, rx46_tgt, rx46_off
  rx46_start:
.annotate "line", 10
  # rx subrule "before" subtype=zerowidth negate=
    rx46_cur."!cursor_pos"(rx46_pos)
    .const 'Sub' $P50 = "17_1258208089.76063"
    capture_lex $P50
    $P10 = rx46_cur."before"($P50)
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
  rx46_fail:
.annotate "line", 3
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
.sub "!PREFIX__normspace"  :subid("16_1258208089.76063") :method
.annotate "line", 3
    new $P48, "ResizablePMCArray"
    push $P48, ""
    .return ($P48)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block49"  :anon :subid("17_1258208089.76063") :method :outer("15_1258208089.76063")
.annotate "line", 10
    .local string rx51_tgt
    .local int rx51_pos
    .local int rx51_off
    .local int rx51_eos
    .local int rx51_rep
    .local pmc rx51_cur
    (rx51_cur, rx51_pos, rx51_tgt, $I10) = self."!cursor_start"()
    rx51_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx51_cur
    .local pmc match
    .lex "$/", match
    length rx51_eos, rx51_tgt
    set rx51_off, 0
    lt $I10, 2, rx51_start
    sub rx51_off, $I10, 1
    substr rx51_tgt, rx51_tgt, rx51_off
  rx51_start:
    ge rx51_pos, 0, rxscan52_done
  rxscan52_loop:
    ($P10) = rx51_cur."from"()
    inc $P10
    set rx51_pos, $P10
    ge rx51_pos, rx51_eos, rxscan52_done
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
.sub "quote"  :subid("18_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx55_tgt
    .local int rx55_pos
    .local int rx55_off
    .local int rx55_eos
    .local int rx55_rep
    .local pmc rx55_cur
    (rx55_cur, rx55_pos, rx55_tgt, $I10) = self."!cursor_start"()
    rx55_cur."!cursor_debug"("START ", "quote")
    .lex unicode:"$\x{a2}", rx55_cur
    .local pmc match
    .lex "$/", match
    length rx55_eos, rx55_tgt
    set rx55_off, 0
    lt $I10, 2, rx55_start
    sub rx55_off, $I10, 1
    substr rx55_tgt, rx55_tgt, rx55_off
  rx55_start:
.annotate "line", 12
  # rx literal  "'"
    add $I11, rx55_pos, 1
    gt $I11, rx55_eos, rx55_fail
    sub $I11, rx55_pos, rx55_off
    substr $S10, rx55_tgt, $I11, 1
    ne $S10, "'", rx55_fail
    add rx55_pos, 1
  # rx subcapture "val"
    set_addr $I10, rxcap_60_fail
    rx55_cur."!mark_push"(0, rx55_pos, $I10)
  # rx rxquantr58 ** 0..*
    set_addr $I59, rxquantr58_done
    rx55_cur."!mark_push"(0, rx55_pos, $I59)
  rxquantr58_loop:
  # rx enumcharlist negate=1
    ge rx55_pos, rx55_eos, rx55_fail
    sub $I10, rx55_pos, rx55_off
    substr $S10, rx55_tgt, $I10, 1
    index $I11, "'", $S10
    ge $I11, 0, rx55_fail
    inc rx55_pos
    (rx55_rep) = rx55_cur."!mark_commit"($I59)
    rx55_cur."!mark_push"(rx55_rep, rx55_pos, $I59)
    goto rxquantr58_loop
  rxquantr58_done:
    set_addr $I10, rxcap_60_fail
    ($I12, $I11) = rx55_cur."!mark_peek"($I10)
    rx55_cur."!cursor_pos"($I11)
    ($P10) = rx55_cur."!cursor_start"()
    $P10."!cursor_pass"(rx55_pos, "")
    rx55_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("val")
    goto rxcap_60_done
  rxcap_60_fail:
    goto rx55_fail
  rxcap_60_done:
  # rx literal  "'"
    add $I11, rx55_pos, 1
    gt $I11, rx55_eos, rx55_fail
    sub $I11, rx55_pos, rx55_off
    substr $S10, rx55_tgt, $I11, 1
    ne $S10, "'", rx55_fail
    add rx55_pos, 1
  # rx pass
    rx55_cur."!cursor_pass"(rx55_pos, "quote")
    rx55_cur."!cursor_debug"("PASS  ", "quote", " at pos=", rx55_pos)
    .return (rx55_cur)
  rx55_fail:
.annotate "line", 3
    (rx55_rep, rx55_pos, $I10, $P10) = rx55_cur."!mark_fail"(0)
    lt rx55_pos, -1, rx55_done
    eq rx55_pos, -1, rx55_fail
    jump $I10
  rx55_done:
    rx55_cur."!cursor_fail"()
    rx55_cur."!cursor_debug"("FAIL  ", "quote")
    .return (rx55_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quote"  :subid("19_1258208089.76063") :method
.annotate "line", 3
    new $P57, "ResizablePMCArray"
    push $P57, "'"
    .return ($P57)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "arg"  :subid("20_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx62_tgt
    .local int rx62_pos
    .local int rx62_off
    .local int rx62_eos
    .local int rx62_rep
    .local pmc rx62_cur
    (rx62_cur, rx62_pos, rx62_tgt, $I10) = self."!cursor_start"()
    rx62_cur."!cursor_debug"("START ", "arg")
    .lex unicode:"$\x{a2}", rx62_cur
    .local pmc match
    .lex "$/", match
    length rx62_eos, rx62_tgt
    set rx62_off, 0
    lt $I10, 2, rx62_start
    sub rx62_off, $I10, 1
    substr rx62_tgt, rx62_tgt, rx62_off
  rx62_start:
  alt66_0:
.annotate "line", 15
    set_addr $I10, alt66_1
    rx62_cur."!mark_push"(0, rx62_pos, $I10)
.annotate "line", 16
  # rx subrule "quote" subtype=capture negate=
    rx62_cur."!cursor_pos"(rx62_pos)
    $P10 = rx62_cur."quote"()
    unless $P10, rx62_fail
    rx62_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx62_pos = $P10."pos"()
    goto alt66_end
  alt66_1:
.annotate "line", 17
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
.annotate "line", 14
  # rx pass
    rx62_cur."!cursor_pass"(rx62_pos, "arg")
    rx62_cur."!cursor_debug"("PASS  ", "arg", " at pos=", rx62_pos)
    .return (rx62_cur)
  rx62_fail:
.annotate "line", 3
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
.sub "!PREFIX__arg"  :subid("21_1258208089.76063") :method
.annotate "line", 3
    $P64 = self."!PREFIX__!subrule"("quote", "")
    new $P65, "ResizablePMCArray"
    push $P65, ""
    push $P65, $P64
    .return ($P65)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "arglist"  :subid("22_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx69_tgt
    .local int rx69_pos
    .local int rx69_off
    .local int rx69_eos
    .local int rx69_rep
    .local pmc rx69_cur
    (rx69_cur, rx69_pos, rx69_tgt, $I10) = self."!cursor_start"()
    rx69_cur."!cursor_debug"("START ", "arglist")
    rx69_cur."!cursor_caparray"("arg")
    .lex unicode:"$\x{a2}", rx69_cur
    .local pmc match
    .lex "$/", match
    length rx69_eos, rx69_tgt
    set rx69_off, 0
    lt $I10, 2, rx69_start
    sub rx69_off, $I10, 1
    substr rx69_tgt, rx69_tgt, rx69_off
  rx69_start:
.annotate "line", 21
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
  # rx rxquantr74 ** 0..*
    set_addr $I77, rxquantr74_done
    rx69_cur."!mark_push"(0, rx69_pos, $I77)
  rxquantr74_loop:
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
    (rx69_rep) = rx69_cur."!mark_commit"($I77)
    rx69_cur."!mark_push"(rx69_rep, rx69_pos, $I77)
    goto rxquantr74_loop
  rxquantr74_done:
  # rx subrule "ws" subtype=method negate=
    rx69_cur."!cursor_pos"(rx69_pos)
    $P10 = rx69_cur."ws"()
    unless $P10, rx69_fail
    rx69_pos = $P10."pos"()
  # rx pass
    rx69_cur."!cursor_pass"(rx69_pos, "arglist")
    rx69_cur."!cursor_debug"("PASS  ", "arglist", " at pos=", rx69_pos)
    .return (rx69_cur)
  rx69_fail:
.annotate "line", 3
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
.sub "!PREFIX__arglist"  :subid("23_1258208089.76063") :method
.annotate "line", 3
    new $P71, "ResizablePMCArray"
    push $P71, ""
    .return ($P71)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "TOP"  :subid("24_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx80_tgt
    .local int rx80_pos
    .local int rx80_off
    .local int rx80_eos
    .local int rx80_rep
    .local pmc rx80_cur
    (rx80_cur, rx80_pos, rx80_tgt, $I10) = self."!cursor_start"()
    rx80_cur."!cursor_debug"("START ", "TOP")
    .lex unicode:"$\x{a2}", rx80_cur
    .local pmc match
    .lex "$/", match
    length rx80_eos, rx80_tgt
    set rx80_off, 0
    lt $I10, 2, rx80_start
    sub rx80_off, $I10, 1
    substr rx80_tgt, rx80_tgt, rx80_off
  rx80_start:
.annotate "line", 24
  # rx subrule "nibbler" subtype=capture negate=
    rx80_cur."!cursor_pos"(rx80_pos)
    $P10 = rx80_cur."nibbler"()
    unless $P10, rx80_fail
    rx80_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx80_pos = $P10."pos"()
  alt84_0:
.annotate "line", 25
    set_addr $I10, alt84_1
    rx80_cur."!mark_push"(0, rx80_pos, $I10)
  # rxanchor eos
    ne rx80_pos, rx80_eos, rx80_fail
    goto alt84_end
  alt84_1:
  # rx subrule "panic" subtype=method negate=
    rx80_cur."!cursor_pos"(rx80_pos)
    $P10 = rx80_cur."panic"("Confused")
    unless $P10, rx80_fail
    rx80_pos = $P10."pos"()
  alt84_end:
.annotate "line", 23
  # rx pass
    rx80_cur."!cursor_pass"(rx80_pos, "TOP")
    rx80_cur."!cursor_debug"("PASS  ", "TOP", " at pos=", rx80_pos)
    .return (rx80_cur)
  rx80_fail:
.annotate "line", 3
    (rx80_rep, rx80_pos, $I10, $P10) = rx80_cur."!mark_fail"(0)
    lt rx80_pos, -1, rx80_done
    eq rx80_pos, -1, rx80_fail
    jump $I10
  rx80_done:
    rx80_cur."!cursor_fail"()
    rx80_cur."!cursor_debug"("FAIL  ", "TOP")
    .return (rx80_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__TOP"  :subid("25_1258208089.76063") :method
.annotate "line", 3
    $P82 = self."!PREFIX__!subrule"("nibbler", "")
    new $P83, "ResizablePMCArray"
    push $P83, $P82
    .return ($P83)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "nibbler"  :subid("26_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx86_tgt
    .local int rx86_pos
    .local int rx86_off
    .local int rx86_eos
    .local int rx86_rep
    .local pmc rx86_cur
    (rx86_cur, rx86_pos, rx86_tgt, $I10) = self."!cursor_start"()
    rx86_cur."!cursor_debug"("START ", "nibbler")
    rx86_cur."!cursor_caparray"("termish")
    .lex unicode:"$\x{a2}", rx86_cur
    .local pmc match
    .lex "$/", match
    length rx86_eos, rx86_tgt
    set rx86_off, 0
    lt $I10, 2, rx86_start
    sub rx86_off, $I10, 1
    substr rx86_tgt, rx86_tgt, rx86_off
  rx86_start:
.annotate "line", 29
  # rx reduce name="nibbler" key="open"
    rx86_cur."!cursor_pos"(rx86_pos)
    rx86_cur."!reduce"("nibbler", "open")
.annotate "line", 30
  # rx rxquantr89 ** 0..1
    set_addr $I91, rxquantr89_done
    rx86_cur."!mark_push"(0, rx86_pos, $I91)
  rxquantr89_loop:
  # rx subrule "ws" subtype=method negate=
    rx86_cur."!cursor_pos"(rx86_pos)
    $P10 = rx86_cur."ws"()
    unless $P10, rx86_fail
    rx86_pos = $P10."pos"()
  alt90_0:
    set_addr $I10, alt90_1
    rx86_cur."!mark_push"(0, rx86_pos, $I10)
  # rx literal  "||"
    add $I11, rx86_pos, 2
    gt $I11, rx86_eos, rx86_fail
    sub $I11, rx86_pos, rx86_off
    substr $S10, rx86_tgt, $I11, 2
    ne $S10, "||", rx86_fail
    add rx86_pos, 2
    goto alt90_end
  alt90_1:
    set_addr $I10, alt90_2
    rx86_cur."!mark_push"(0, rx86_pos, $I10)
  # rx literal  "|"
    add $I11, rx86_pos, 1
    gt $I11, rx86_eos, rx86_fail
    sub $I11, rx86_pos, rx86_off
    substr $S10, rx86_tgt, $I11, 1
    ne $S10, "|", rx86_fail
    add rx86_pos, 1
    goto alt90_end
  alt90_2:
    set_addr $I10, alt90_3
    rx86_cur."!mark_push"(0, rx86_pos, $I10)
  # rx literal  "&&"
    add $I11, rx86_pos, 2
    gt $I11, rx86_eos, rx86_fail
    sub $I11, rx86_pos, rx86_off
    substr $S10, rx86_tgt, $I11, 2
    ne $S10, "&&", rx86_fail
    add rx86_pos, 2
    goto alt90_end
  alt90_3:
  # rx literal  "&"
    add $I11, rx86_pos, 1
    gt $I11, rx86_eos, rx86_fail
    sub $I11, rx86_pos, rx86_off
    substr $S10, rx86_tgt, $I11, 1
    ne $S10, "&", rx86_fail
    add rx86_pos, 1
  alt90_end:
    (rx86_rep) = rx86_cur."!mark_commit"($I91)
  rxquantr89_done:
.annotate "line", 31
  # rx subrule "termish" subtype=capture negate=
    rx86_cur."!cursor_pos"(rx86_pos)
    $P10 = rx86_cur."termish"()
    unless $P10, rx86_fail
    rx86_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("termish")
    rx86_pos = $P10."pos"()
.annotate "line", 34
  # rx rxquantr92 ** 0..*
    set_addr $I95, rxquantr92_done
    rx86_cur."!mark_push"(0, rx86_pos, $I95)
  rxquantr92_loop:
  alt93_0:
.annotate "line", 32
    set_addr $I10, alt93_1
    rx86_cur."!mark_push"(0, rx86_pos, $I10)
  # rx literal  "||"
    add $I11, rx86_pos, 2
    gt $I11, rx86_eos, rx86_fail
    sub $I11, rx86_pos, rx86_off
    substr $S10, rx86_tgt, $I11, 2
    ne $S10, "||", rx86_fail
    add rx86_pos, 2
    goto alt93_end
  alt93_1:
  # rx literal  "|"
    add $I11, rx86_pos, 1
    gt $I11, rx86_eos, rx86_fail
    sub $I11, rx86_pos, rx86_off
    substr $S10, rx86_tgt, $I11, 1
    ne $S10, "|", rx86_fail
    add rx86_pos, 1
  alt93_end:
  alt94_0:
.annotate "line", 33
    set_addr $I10, alt94_1
    rx86_cur."!mark_push"(0, rx86_pos, $I10)
  # rx subrule "termish" subtype=capture negate=
    rx86_cur."!cursor_pos"(rx86_pos)
    $P10 = rx86_cur."termish"()
    unless $P10, rx86_fail
    rx86_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("termish")
    rx86_pos = $P10."pos"()
    goto alt94_end
  alt94_1:
  # rx subrule "panic" subtype=method negate=
    rx86_cur."!cursor_pos"(rx86_pos)
    $P10 = rx86_cur."panic"("Null pattern not allowed")
    unless $P10, rx86_fail
    rx86_pos = $P10."pos"()
  alt94_end:
.annotate "line", 34
    (rx86_rep) = rx86_cur."!mark_commit"($I95)
    rx86_cur."!mark_push"(rx86_rep, rx86_pos, $I95)
    goto rxquantr92_loop
  rxquantr92_done:
.annotate "line", 28
  # rx pass
    rx86_cur."!cursor_pass"(rx86_pos, "nibbler")
    rx86_cur."!cursor_debug"("PASS  ", "nibbler", " at pos=", rx86_pos)
    .return (rx86_cur)
  rx86_fail:
.annotate "line", 3
    (rx86_rep, rx86_pos, $I10, $P10) = rx86_cur."!mark_fail"(0)
    lt rx86_pos, -1, rx86_done
    eq rx86_pos, -1, rx86_fail
    jump $I10
  rx86_done:
    rx86_cur."!cursor_fail"()
    rx86_cur."!cursor_debug"("FAIL  ", "nibbler")
    .return (rx86_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__nibbler"  :subid("27_1258208089.76063") :method
.annotate "line", 3
    new $P88, "ResizablePMCArray"
    push $P88, ""
    .return ($P88)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "termish"  :subid("28_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx97_tgt
    .local int rx97_pos
    .local int rx97_off
    .local int rx97_eos
    .local int rx97_rep
    .local pmc rx97_cur
    (rx97_cur, rx97_pos, rx97_tgt, $I10) = self."!cursor_start"()
    rx97_cur."!cursor_debug"("START ", "termish")
    rx97_cur."!cursor_caparray"("noun")
    .lex unicode:"$\x{a2}", rx97_cur
    .local pmc match
    .lex "$/", match
    length rx97_eos, rx97_tgt
    set rx97_off, 0
    lt $I10, 2, rx97_start
    sub rx97_off, $I10, 1
    substr rx97_tgt, rx97_tgt, rx97_off
  rx97_start:
.annotate "line", 38
  # rx rxquantr100 ** 1..*
    set_addr $I101, rxquantr100_done
    rx97_cur."!mark_push"(0, -1, $I101)
  rxquantr100_loop:
  # rx subrule "quantified_atom" subtype=capture negate=
    rx97_cur."!cursor_pos"(rx97_pos)
    $P10 = rx97_cur."quantified_atom"()
    unless $P10, rx97_fail
    rx97_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("noun")
    rx97_pos = $P10."pos"()
    (rx97_rep) = rx97_cur."!mark_commit"($I101)
    rx97_cur."!mark_push"(rx97_rep, rx97_pos, $I101)
    goto rxquantr100_loop
  rxquantr100_done:
.annotate "line", 37
  # rx pass
    rx97_cur."!cursor_pass"(rx97_pos, "termish")
    rx97_cur."!cursor_debug"("PASS  ", "termish", " at pos=", rx97_pos)
    .return (rx97_cur)
  rx97_fail:
.annotate "line", 3
    (rx97_rep, rx97_pos, $I10, $P10) = rx97_cur."!mark_fail"(0)
    lt rx97_pos, -1, rx97_done
    eq rx97_pos, -1, rx97_fail
    jump $I10
  rx97_done:
    rx97_cur."!cursor_fail"()
    rx97_cur."!cursor_debug"("FAIL  ", "termish")
    .return (rx97_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__termish"  :subid("29_1258208089.76063") :method
.annotate "line", 3
    new $P99, "ResizablePMCArray"
    push $P99, ""
    .return ($P99)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantified_atom"  :subid("30_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .const 'Sub' $P110 = "32_1258208089.76063"
    capture_lex $P110
    .local string rx103_tgt
    .local int rx103_pos
    .local int rx103_off
    .local int rx103_eos
    .local int rx103_rep
    .local pmc rx103_cur
    (rx103_cur, rx103_pos, rx103_tgt, $I10) = self."!cursor_start"()
    rx103_cur."!cursor_debug"("START ", "quantified_atom")
    rx103_cur."!cursor_caparray"("backmod", "quantifier")
    .lex unicode:"$\x{a2}", rx103_cur
    .local pmc match
    .lex "$/", match
    length rx103_eos, rx103_tgt
    set rx103_off, 0
    lt $I10, 2, rx103_start
    sub rx103_off, $I10, 1
    substr rx103_tgt, rx103_tgt, rx103_off
  rx103_start:
.annotate "line", 42
  # rx subrule "atom" subtype=capture negate=
    rx103_cur."!cursor_pos"(rx103_pos)
    $P10 = rx103_cur."atom"()
    unless $P10, rx103_fail
    rx103_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("atom")
    rx103_pos = $P10."pos"()
  # rx rxquantr107 ** 0..1
    set_addr $I113, rxquantr107_done
    rx103_cur."!mark_push"(0, rx103_pos, $I113)
  rxquantr107_loop:
  # rx subrule "ws" subtype=method negate=
    rx103_cur."!cursor_pos"(rx103_pos)
    $P10 = rx103_cur."ws"()
    unless $P10, rx103_fail
    rx103_pos = $P10."pos"()
  alt108_0:
    set_addr $I10, alt108_1
    rx103_cur."!mark_push"(0, rx103_pos, $I10)
  # rx subrule "quantifier" subtype=capture negate=
    rx103_cur."!cursor_pos"(rx103_pos)
    $P10 = rx103_cur."quantifier"()
    unless $P10, rx103_fail
    rx103_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantifier")
    rx103_pos = $P10."pos"()
    goto alt108_end
  alt108_1:
  # rx subrule "before" subtype=zerowidth negate=
    rx103_cur."!cursor_pos"(rx103_pos)
    .const 'Sub' $P110 = "32_1258208089.76063"
    capture_lex $P110
    $P10 = rx103_cur."before"($P110)
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
  alt108_end:
    (rx103_rep) = rx103_cur."!mark_commit"($I113)
  rxquantr107_done:
.annotate "line", 41
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
.sub "!PREFIX__quantified_atom"  :subid("31_1258208089.76063") :method
.annotate "line", 3
    $P105 = self."!PREFIX__!subrule"("atom", "")
    new $P106, "ResizablePMCArray"
    push $P106, $P105
    .return ($P106)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block109"  :anon :subid("32_1258208089.76063") :method :outer("30_1258208089.76063")
.annotate "line", 42
    .local string rx111_tgt
    .local int rx111_pos
    .local int rx111_off
    .local int rx111_eos
    .local int rx111_rep
    .local pmc rx111_cur
    (rx111_cur, rx111_pos, rx111_tgt, $I10) = self."!cursor_start"()
    rx111_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx111_cur
    .local pmc match
    .lex "$/", match
    length rx111_eos, rx111_tgt
    set rx111_off, 0
    lt $I10, 2, rx111_start
    sub rx111_off, $I10, 1
    substr rx111_tgt, rx111_tgt, rx111_off
  rx111_start:
    ge rx111_pos, 0, rxscan112_done
  rxscan112_loop:
    ($P10) = rx111_cur."from"()
    inc $P10
    set rx111_pos, $P10
    ge rx111_pos, rx111_eos, rxscan112_done
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
.sub "atom"  :subid("33_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .const 'Sub' $P124 = "35_1258208089.76063"
    capture_lex $P124
    .local string rx115_tgt
    .local int rx115_pos
    .local int rx115_off
    .local int rx115_eos
    .local int rx115_rep
    .local pmc rx115_cur
    (rx115_cur, rx115_pos, rx115_tgt, $I10) = self."!cursor_start"()
    rx115_cur."!cursor_debug"("START ", "atom")
    .lex unicode:"$\x{a2}", rx115_cur
    .local pmc match
    .lex "$/", match
    length rx115_eos, rx115_tgt
    set rx115_off, 0
    lt $I10, 2, rx115_start
    sub rx115_off, $I10, 1
    substr rx115_tgt, rx115_tgt, rx115_off
  rx115_start:
  alt119_0:
.annotate "line", 47
    set_addr $I10, alt119_1
    rx115_cur."!mark_push"(0, rx115_pos, $I10)
.annotate "line", 48
  # rx charclass w
    ge rx115_pos, rx115_eos, rx115_fail
    sub $I10, rx115_pos, rx115_off
    is_cclass $I11, 8192, rx115_tgt, $I10
    unless $I11, rx115_fail
    inc rx115_pos
  # rx rxquantr120 ** 0..1
    set_addr $I127, rxquantr120_done
    rx115_cur."!mark_push"(0, rx115_pos, $I127)
  rxquantr120_loop:
  # rx rxquantg121 ** 1..*
    set_addr $I122, rxquantg121_done
  rxquantg121_loop:
  # rx charclass w
    ge rx115_pos, rx115_eos, rx115_fail
    sub $I10, rx115_pos, rx115_off
    is_cclass $I11, 8192, rx115_tgt, $I10
    unless $I11, rx115_fail
    inc rx115_pos
    rx115_cur."!mark_push"(rx115_rep, rx115_pos, $I122)
    goto rxquantg121_loop
  rxquantg121_done:
  # rx subrule "before" subtype=zerowidth negate=
    rx115_cur."!cursor_pos"(rx115_pos)
    .const 'Sub' $P124 = "35_1258208089.76063"
    capture_lex $P124
    $P10 = rx115_cur."before"($P124)
    unless $P10, rx115_fail
    (rx115_rep) = rx115_cur."!mark_commit"($I127)
  rxquantr120_done:
    goto alt119_end
  alt119_1:
.annotate "line", 49
  # rx subrule "metachar" subtype=capture negate=
    rx115_cur."!cursor_pos"(rx115_pos)
    $P10 = rx115_cur."metachar"()
    unless $P10, rx115_fail
    rx115_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("metachar")
    rx115_pos = $P10."pos"()
  alt119_end:
.annotate "line", 45
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
.sub "!PREFIX__atom"  :subid("34_1258208089.76063") :method
.annotate "line", 3
    $P117 = self."!PREFIX__!subrule"("metachar", "")
    new $P118, "ResizablePMCArray"
    push $P118, $P117
    push $P118, ""
    .return ($P118)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block123"  :anon :subid("35_1258208089.76063") :method :outer("33_1258208089.76063")
.annotate "line", 48
    .local string rx125_tgt
    .local int rx125_pos
    .local int rx125_off
    .local int rx125_eos
    .local int rx125_rep
    .local pmc rx125_cur
    (rx125_cur, rx125_pos, rx125_tgt, $I10) = self."!cursor_start"()
    rx125_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx125_cur
    .local pmc match
    .lex "$/", match
    length rx125_eos, rx125_tgt
    set rx125_off, 0
    lt $I10, 2, rx125_start
    sub rx125_off, $I10, 1
    substr rx125_tgt, rx125_tgt, rx125_off
  rx125_start:
    ge rx125_pos, 0, rxscan126_done
  rxscan126_loop:
    ($P10) = rx125_cur."from"()
    inc $P10
    set rx125_pos, $P10
    ge rx125_pos, rx125_eos, rxscan126_done
    set_addr $I10, rxscan126_loop
    rx125_cur."!mark_push"(0, rx125_pos, $I10)
  rxscan126_done:
  # rx charclass w
    ge rx125_pos, rx125_eos, rx125_fail
    sub $I10, rx125_pos, rx125_off
    is_cclass $I11, 8192, rx125_tgt, $I10
    unless $I11, rx125_fail
    inc rx125_pos
  # rx pass
    rx125_cur."!cursor_pass"(rx125_pos, "")
    rx125_cur."!cursor_debug"("PASS  ", "", " at pos=", rx125_pos)
    .return (rx125_cur)
  rx125_fail:
    (rx125_rep, rx125_pos, $I10, $P10) = rx125_cur."!mark_fail"(0)
    lt rx125_pos, -1, rx125_done
    eq rx125_pos, -1, rx125_fail
    jump $I10
  rx125_done:
    rx125_cur."!cursor_fail"()
    rx125_cur."!cursor_debug"("FAIL  ", "")
    .return (rx125_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier"  :subid("36_1258208089.76063") :method
.annotate "line", 53
    $P129 = self."!protoregex"("quantifier")
    .return ($P129)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier"  :subid("37_1258208089.76063") :method
.annotate "line", 53
    $P131 = self."!PREFIX__!protoregex"("quantifier")
    .return ($P131)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<*>"  :subid("38_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx133_tgt
    .local int rx133_pos
    .local int rx133_off
    .local int rx133_eos
    .local int rx133_rep
    .local pmc rx133_cur
    (rx133_cur, rx133_pos, rx133_tgt, $I10) = self."!cursor_start"()
    rx133_cur."!cursor_debug"("START ", "quantifier:sym<*>")
    .lex unicode:"$\x{a2}", rx133_cur
    .local pmc match
    .lex "$/", match
    length rx133_eos, rx133_tgt
    set rx133_off, 0
    lt $I10, 2, rx133_start
    sub rx133_off, $I10, 1
    substr rx133_tgt, rx133_tgt, rx133_off
  rx133_start:
.annotate "line", 54
  # rx subcapture "sym"
    set_addr $I10, rxcap_137_fail
    rx133_cur."!mark_push"(0, rx133_pos, $I10)
  # rx literal  "*"
    add $I11, rx133_pos, 1
    gt $I11, rx133_eos, rx133_fail
    sub $I11, rx133_pos, rx133_off
    substr $S10, rx133_tgt, $I11, 1
    ne $S10, "*", rx133_fail
    add rx133_pos, 1
    set_addr $I10, rxcap_137_fail
    ($I12, $I11) = rx133_cur."!mark_peek"($I10)
    rx133_cur."!cursor_pos"($I11)
    ($P10) = rx133_cur."!cursor_start"()
    $P10."!cursor_pass"(rx133_pos, "")
    rx133_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_137_done
  rxcap_137_fail:
    goto rx133_fail
  rxcap_137_done:
  # rx subrule "backmod" subtype=capture negate=
    rx133_cur."!cursor_pos"(rx133_pos)
    $P10 = rx133_cur."backmod"()
    unless $P10, rx133_fail
    rx133_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx133_pos = $P10."pos"()
  # rx pass
    rx133_cur."!cursor_pass"(rx133_pos, "quantifier:sym<*>")
    rx133_cur."!cursor_debug"("PASS  ", "quantifier:sym<*>", " at pos=", rx133_pos)
    .return (rx133_cur)
  rx133_fail:
.annotate "line", 3
    (rx133_rep, rx133_pos, $I10, $P10) = rx133_cur."!mark_fail"(0)
    lt rx133_pos, -1, rx133_done
    eq rx133_pos, -1, rx133_fail
    jump $I10
  rx133_done:
    rx133_cur."!cursor_fail"()
    rx133_cur."!cursor_debug"("FAIL  ", "quantifier:sym<*>")
    .return (rx133_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<*>"  :subid("39_1258208089.76063") :method
.annotate "line", 3
    $P135 = self."!PREFIX__!subrule"("backmod", "*")
    new $P136, "ResizablePMCArray"
    push $P136, $P135
    .return ($P136)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<+>"  :subid("40_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx139_tgt
    .local int rx139_pos
    .local int rx139_off
    .local int rx139_eos
    .local int rx139_rep
    .local pmc rx139_cur
    (rx139_cur, rx139_pos, rx139_tgt, $I10) = self."!cursor_start"()
    rx139_cur."!cursor_debug"("START ", "quantifier:sym<+>")
    .lex unicode:"$\x{a2}", rx139_cur
    .local pmc match
    .lex "$/", match
    length rx139_eos, rx139_tgt
    set rx139_off, 0
    lt $I10, 2, rx139_start
    sub rx139_off, $I10, 1
    substr rx139_tgt, rx139_tgt, rx139_off
  rx139_start:
.annotate "line", 55
  # rx subcapture "sym"
    set_addr $I10, rxcap_143_fail
    rx139_cur."!mark_push"(0, rx139_pos, $I10)
  # rx literal  "+"
    add $I11, rx139_pos, 1
    gt $I11, rx139_eos, rx139_fail
    sub $I11, rx139_pos, rx139_off
    substr $S10, rx139_tgt, $I11, 1
    ne $S10, "+", rx139_fail
    add rx139_pos, 1
    set_addr $I10, rxcap_143_fail
    ($I12, $I11) = rx139_cur."!mark_peek"($I10)
    rx139_cur."!cursor_pos"($I11)
    ($P10) = rx139_cur."!cursor_start"()
    $P10."!cursor_pass"(rx139_pos, "")
    rx139_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_143_done
  rxcap_143_fail:
    goto rx139_fail
  rxcap_143_done:
  # rx subrule "backmod" subtype=capture negate=
    rx139_cur."!cursor_pos"(rx139_pos)
    $P10 = rx139_cur."backmod"()
    unless $P10, rx139_fail
    rx139_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx139_pos = $P10."pos"()
  # rx pass
    rx139_cur."!cursor_pass"(rx139_pos, "quantifier:sym<+>")
    rx139_cur."!cursor_debug"("PASS  ", "quantifier:sym<+>", " at pos=", rx139_pos)
    .return (rx139_cur)
  rx139_fail:
.annotate "line", 3
    (rx139_rep, rx139_pos, $I10, $P10) = rx139_cur."!mark_fail"(0)
    lt rx139_pos, -1, rx139_done
    eq rx139_pos, -1, rx139_fail
    jump $I10
  rx139_done:
    rx139_cur."!cursor_fail"()
    rx139_cur."!cursor_debug"("FAIL  ", "quantifier:sym<+>")
    .return (rx139_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<+>"  :subid("41_1258208089.76063") :method
.annotate "line", 3
    $P141 = self."!PREFIX__!subrule"("backmod", "+")
    new $P142, "ResizablePMCArray"
    push $P142, $P141
    .return ($P142)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<?>"  :subid("42_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx145_tgt
    .local int rx145_pos
    .local int rx145_off
    .local int rx145_eos
    .local int rx145_rep
    .local pmc rx145_cur
    (rx145_cur, rx145_pos, rx145_tgt, $I10) = self."!cursor_start"()
    rx145_cur."!cursor_debug"("START ", "quantifier:sym<?>")
    .lex unicode:"$\x{a2}", rx145_cur
    .local pmc match
    .lex "$/", match
    length rx145_eos, rx145_tgt
    set rx145_off, 0
    lt $I10, 2, rx145_start
    sub rx145_off, $I10, 1
    substr rx145_tgt, rx145_tgt, rx145_off
  rx145_start:
.annotate "line", 56
  # rx subcapture "sym"
    set_addr $I10, rxcap_149_fail
    rx145_cur."!mark_push"(0, rx145_pos, $I10)
  # rx literal  "?"
    add $I11, rx145_pos, 1
    gt $I11, rx145_eos, rx145_fail
    sub $I11, rx145_pos, rx145_off
    substr $S10, rx145_tgt, $I11, 1
    ne $S10, "?", rx145_fail
    add rx145_pos, 1
    set_addr $I10, rxcap_149_fail
    ($I12, $I11) = rx145_cur."!mark_peek"($I10)
    rx145_cur."!cursor_pos"($I11)
    ($P10) = rx145_cur."!cursor_start"()
    $P10."!cursor_pass"(rx145_pos, "")
    rx145_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_149_done
  rxcap_149_fail:
    goto rx145_fail
  rxcap_149_done:
  # rx subrule "backmod" subtype=capture negate=
    rx145_cur."!cursor_pos"(rx145_pos)
    $P10 = rx145_cur."backmod"()
    unless $P10, rx145_fail
    rx145_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx145_pos = $P10."pos"()
  # rx pass
    rx145_cur."!cursor_pass"(rx145_pos, "quantifier:sym<?>")
    rx145_cur."!cursor_debug"("PASS  ", "quantifier:sym<?>", " at pos=", rx145_pos)
    .return (rx145_cur)
  rx145_fail:
.annotate "line", 3
    (rx145_rep, rx145_pos, $I10, $P10) = rx145_cur."!mark_fail"(0)
    lt rx145_pos, -1, rx145_done
    eq rx145_pos, -1, rx145_fail
    jump $I10
  rx145_done:
    rx145_cur."!cursor_fail"()
    rx145_cur."!cursor_debug"("FAIL  ", "quantifier:sym<?>")
    .return (rx145_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<?>"  :subid("43_1258208089.76063") :method
.annotate "line", 3
    $P147 = self."!PREFIX__!subrule"("backmod", "?")
    new $P148, "ResizablePMCArray"
    push $P148, $P147
    .return ($P148)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<**>"  :subid("44_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx151_tgt
    .local int rx151_pos
    .local int rx151_off
    .local int rx151_eos
    .local int rx151_rep
    .local pmc rx151_cur
    (rx151_cur, rx151_pos, rx151_tgt, $I10) = self."!cursor_start"()
    rx151_cur."!cursor_debug"("START ", "quantifier:sym<**>")
    rx151_cur."!cursor_caparray"("max")
    .lex unicode:"$\x{a2}", rx151_cur
    .local pmc match
    .lex "$/", match
    length rx151_eos, rx151_tgt
    set rx151_off, 0
    lt $I10, 2, rx151_start
    sub rx151_off, $I10, 1
    substr rx151_tgt, rx151_tgt, rx151_off
  rx151_start:
.annotate "line", 58
  # rx subcapture "sym"
    set_addr $I10, rxcap_154_fail
    rx151_cur."!mark_push"(0, rx151_pos, $I10)
  # rx literal  "**"
    add $I11, rx151_pos, 2
    gt $I11, rx151_eos, rx151_fail
    sub $I11, rx151_pos, rx151_off
    substr $S10, rx151_tgt, $I11, 2
    ne $S10, "**", rx151_fail
    add rx151_pos, 2
    set_addr $I10, rxcap_154_fail
    ($I12, $I11) = rx151_cur."!mark_peek"($I10)
    rx151_cur."!cursor_pos"($I11)
    ($P10) = rx151_cur."!cursor_start"()
    $P10."!cursor_pass"(rx151_pos, "")
    rx151_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_154_done
  rxcap_154_fail:
    goto rx151_fail
  rxcap_154_done:
  # rx charclass_q s r 0..-1
    sub $I10, rx151_pos, rx151_off
    find_not_cclass $I11, 32, rx151_tgt, $I10, rx151_eos
    add rx151_pos, rx151_off, $I11
  # rx subrule "backmod" subtype=capture negate=
    rx151_cur."!cursor_pos"(rx151_pos)
    $P10 = rx151_cur."backmod"()
    unless $P10, rx151_fail
    rx151_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx151_pos = $P10."pos"()
  # rx charclass_q s r 0..-1
    sub $I10, rx151_pos, rx151_off
    find_not_cclass $I11, 32, rx151_tgt, $I10, rx151_eos
    add rx151_pos, rx151_off, $I11
  alt155_0:
.annotate "line", 59
    set_addr $I10, alt155_1
    rx151_cur."!mark_push"(0, rx151_pos, $I10)
.annotate "line", 60
  # rx subcapture "min"
    set_addr $I10, rxcap_156_fail
    rx151_cur."!mark_push"(0, rx151_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx151_pos, rx151_off
    find_not_cclass $I11, 8, rx151_tgt, $I10, rx151_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx151_fail
    add rx151_pos, rx151_off, $I11
    set_addr $I10, rxcap_156_fail
    ($I12, $I11) = rx151_cur."!mark_peek"($I10)
    rx151_cur."!cursor_pos"($I11)
    ($P10) = rx151_cur."!cursor_start"()
    $P10."!cursor_pass"(rx151_pos, "")
    rx151_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("min")
    goto rxcap_156_done
  rxcap_156_fail:
    goto rx151_fail
  rxcap_156_done:
  # rx rxquantr157 ** 0..1
    set_addr $I160, rxquantr157_done
    rx151_cur."!mark_push"(0, rx151_pos, $I160)
  rxquantr157_loop:
  # rx literal  ".."
    add $I11, rx151_pos, 2
    gt $I11, rx151_eos, rx151_fail
    sub $I11, rx151_pos, rx151_off
    substr $S10, rx151_tgt, $I11, 2
    ne $S10, "..", rx151_fail
    add rx151_pos, 2
  # rx subcapture "max"
    set_addr $I10, rxcap_159_fail
    rx151_cur."!mark_push"(0, rx151_pos, $I10)
  alt158_0:
    set_addr $I10, alt158_1
    rx151_cur."!mark_push"(0, rx151_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx151_pos, rx151_off
    find_not_cclass $I11, 8, rx151_tgt, $I10, rx151_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx151_fail
    add rx151_pos, rx151_off, $I11
    goto alt158_end
  alt158_1:
  # rx literal  "*"
    add $I11, rx151_pos, 1
    gt $I11, rx151_eos, rx151_fail
    sub $I11, rx151_pos, rx151_off
    substr $S10, rx151_tgt, $I11, 1
    ne $S10, "*", rx151_fail
    add rx151_pos, 1
  alt158_end:
    set_addr $I10, rxcap_159_fail
    ($I12, $I11) = rx151_cur."!mark_peek"($I10)
    rx151_cur."!cursor_pos"($I11)
    ($P10) = rx151_cur."!cursor_start"()
    $P10."!cursor_pass"(rx151_pos, "")
    rx151_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("max")
    goto rxcap_159_done
  rxcap_159_fail:
    goto rx151_fail
  rxcap_159_done:
    (rx151_rep) = rx151_cur."!mark_commit"($I160)
  rxquantr157_done:
    goto alt155_end
  alt155_1:
.annotate "line", 61
  # rx subrule "quantified_atom" subtype=capture negate=
    rx151_cur."!cursor_pos"(rx151_pos)
    $P10 = rx151_cur."quantified_atom"()
    unless $P10, rx151_fail
    rx151_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantified_atom")
    rx151_pos = $P10."pos"()
  alt155_end:
.annotate "line", 57
  # rx pass
    rx151_cur."!cursor_pass"(rx151_pos, "quantifier:sym<**>")
    rx151_cur."!cursor_debug"("PASS  ", "quantifier:sym<**>", " at pos=", rx151_pos)
    .return (rx151_cur)
  rx151_fail:
.annotate "line", 3
    (rx151_rep, rx151_pos, $I10, $P10) = rx151_cur."!mark_fail"(0)
    lt rx151_pos, -1, rx151_done
    eq rx151_pos, -1, rx151_fail
    jump $I10
  rx151_done:
    rx151_cur."!cursor_fail"()
    rx151_cur."!cursor_debug"("FAIL  ", "quantifier:sym<**>")
    .return (rx151_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<**>"  :subid("45_1258208089.76063") :method
.annotate "line", 3
    new $P153, "ResizablePMCArray"
    push $P153, "**"
    .return ($P153)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backmod"  :subid("46_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .const 'Sub' $P169 = "48_1258208089.76063"
    capture_lex $P169
    .local string rx162_tgt
    .local int rx162_pos
    .local int rx162_off
    .local int rx162_eos
    .local int rx162_rep
    .local pmc rx162_cur
    (rx162_cur, rx162_pos, rx162_tgt, $I10) = self."!cursor_start"()
    rx162_cur."!cursor_debug"("START ", "backmod")
    .lex unicode:"$\x{a2}", rx162_cur
    .local pmc match
    .lex "$/", match
    length rx162_eos, rx162_tgt
    set rx162_off, 0
    lt $I10, 2, rx162_start
    sub rx162_off, $I10, 1
    substr rx162_tgt, rx162_tgt, rx162_off
  rx162_start:
.annotate "line", 65
  # rx rxquantr165 ** 0..1
    set_addr $I166, rxquantr165_done
    rx162_cur."!mark_push"(0, rx162_pos, $I166)
  rxquantr165_loop:
  # rx literal  ":"
    add $I11, rx162_pos, 1
    gt $I11, rx162_eos, rx162_fail
    sub $I11, rx162_pos, rx162_off
    substr $S10, rx162_tgt, $I11, 1
    ne $S10, ":", rx162_fail
    add rx162_pos, 1
    (rx162_rep) = rx162_cur."!mark_commit"($I166)
  rxquantr165_done:
  alt167_0:
    set_addr $I10, alt167_1
    rx162_cur."!mark_push"(0, rx162_pos, $I10)
  # rx literal  "?"
    add $I11, rx162_pos, 1
    gt $I11, rx162_eos, rx162_fail
    sub $I11, rx162_pos, rx162_off
    substr $S10, rx162_tgt, $I11, 1
    ne $S10, "?", rx162_fail
    add rx162_pos, 1
    goto alt167_end
  alt167_1:
    set_addr $I10, alt167_2
    rx162_cur."!mark_push"(0, rx162_pos, $I10)
  # rx literal  "!"
    add $I11, rx162_pos, 1
    gt $I11, rx162_eos, rx162_fail
    sub $I11, rx162_pos, rx162_off
    substr $S10, rx162_tgt, $I11, 1
    ne $S10, "!", rx162_fail
    add rx162_pos, 1
    goto alt167_end
  alt167_2:
  # rx subrule "before" subtype=zerowidth negate=1
    rx162_cur."!cursor_pos"(rx162_pos)
    .const 'Sub' $P169 = "48_1258208089.76063"
    capture_lex $P169
    $P10 = rx162_cur."before"($P169)
    if $P10, rx162_fail
  alt167_end:
  # rx pass
    rx162_cur."!cursor_pass"(rx162_pos, "backmod")
    rx162_cur."!cursor_debug"("PASS  ", "backmod", " at pos=", rx162_pos)
    .return (rx162_cur)
  rx162_fail:
.annotate "line", 3
    (rx162_rep, rx162_pos, $I10, $P10) = rx162_cur."!mark_fail"(0)
    lt rx162_pos, -1, rx162_done
    eq rx162_pos, -1, rx162_fail
    jump $I10
  rx162_done:
    rx162_cur."!cursor_fail"()
    rx162_cur."!cursor_debug"("FAIL  ", "backmod")
    .return (rx162_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backmod"  :subid("47_1258208089.76063") :method
.annotate "line", 3
    new $P164, "ResizablePMCArray"
    push $P164, ""
    .return ($P164)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block168"  :anon :subid("48_1258208089.76063") :method :outer("46_1258208089.76063")
.annotate "line", 65
    .local string rx170_tgt
    .local int rx170_pos
    .local int rx170_off
    .local int rx170_eos
    .local int rx170_rep
    .local pmc rx170_cur
    (rx170_cur, rx170_pos, rx170_tgt, $I10) = self."!cursor_start"()
    rx170_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx170_cur
    .local pmc match
    .lex "$/", match
    length rx170_eos, rx170_tgt
    set rx170_off, 0
    lt $I10, 2, rx170_start
    sub rx170_off, $I10, 1
    substr rx170_tgt, rx170_tgt, rx170_off
  rx170_start:
    ge rx170_pos, 0, rxscan171_done
  rxscan171_loop:
    ($P10) = rx170_cur."from"()
    inc $P10
    set rx170_pos, $P10
    ge rx170_pos, rx170_eos, rxscan171_done
    set_addr $I10, rxscan171_loop
    rx170_cur."!mark_push"(0, rx170_pos, $I10)
  rxscan171_done:
  # rx literal  ":"
    add $I11, rx170_pos, 1
    gt $I11, rx170_eos, rx170_fail
    sub $I11, rx170_pos, rx170_off
    substr $S10, rx170_tgt, $I11, 1
    ne $S10, ":", rx170_fail
    add rx170_pos, 1
  # rx pass
    rx170_cur."!cursor_pass"(rx170_pos, "")
    rx170_cur."!cursor_debug"("PASS  ", "", " at pos=", rx170_pos)
    .return (rx170_cur)
  rx170_fail:
    (rx170_rep, rx170_pos, $I10, $P10) = rx170_cur."!mark_fail"(0)
    lt rx170_pos, -1, rx170_done
    eq rx170_pos, -1, rx170_fail
    jump $I10
  rx170_done:
    rx170_cur."!cursor_fail"()
    rx170_cur."!cursor_debug"("FAIL  ", "")
    .return (rx170_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar"  :subid("49_1258208089.76063") :method
.annotate "line", 67
    $P173 = self."!protoregex"("metachar")
    .return ($P173)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar"  :subid("50_1258208089.76063") :method
.annotate "line", 67
    $P175 = self."!PREFIX__!protoregex"("metachar")
    .return ($P175)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<ws>"  :subid("51_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx177_tgt
    .local int rx177_pos
    .local int rx177_off
    .local int rx177_eos
    .local int rx177_rep
    .local pmc rx177_cur
    (rx177_cur, rx177_pos, rx177_tgt, $I10) = self."!cursor_start"()
    rx177_cur."!cursor_debug"("START ", "metachar:sym<ws>")
    .lex unicode:"$\x{a2}", rx177_cur
    .local pmc match
    .lex "$/", match
    length rx177_eos, rx177_tgt
    set rx177_off, 0
    lt $I10, 2, rx177_start
    sub rx177_off, $I10, 1
    substr rx177_tgt, rx177_tgt, rx177_off
  rx177_start:
.annotate "line", 68
  # rx subrule "normspace" subtype=method negate=
    rx177_cur."!cursor_pos"(rx177_pos)
    $P10 = rx177_cur."normspace"()
    unless $P10, rx177_fail
    rx177_pos = $P10."pos"()
  # rx pass
    rx177_cur."!cursor_pass"(rx177_pos, "metachar:sym<ws>")
    rx177_cur."!cursor_debug"("PASS  ", "metachar:sym<ws>", " at pos=", rx177_pos)
    .return (rx177_cur)
  rx177_fail:
.annotate "line", 3
    (rx177_rep, rx177_pos, $I10, $P10) = rx177_cur."!mark_fail"(0)
    lt rx177_pos, -1, rx177_done
    eq rx177_pos, -1, rx177_fail
    jump $I10
  rx177_done:
    rx177_cur."!cursor_fail"()
    rx177_cur."!cursor_debug"("FAIL  ", "metachar:sym<ws>")
    .return (rx177_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<ws>"  :subid("52_1258208089.76063") :method
.annotate "line", 3
    $P179 = self."!PREFIX__!subrule"("", "")
    new $P180, "ResizablePMCArray"
    push $P180, $P179
    .return ($P180)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<[ ]>"  :subid("53_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx182_tgt
    .local int rx182_pos
    .local int rx182_off
    .local int rx182_eos
    .local int rx182_rep
    .local pmc rx182_cur
    (rx182_cur, rx182_pos, rx182_tgt, $I10) = self."!cursor_start"()
    rx182_cur."!cursor_debug"("START ", "metachar:sym<[ ]>")
    .lex unicode:"$\x{a2}", rx182_cur
    .local pmc match
    .lex "$/", match
    length rx182_eos, rx182_tgt
    set rx182_off, 0
    lt $I10, 2, rx182_start
    sub rx182_off, $I10, 1
    substr rx182_tgt, rx182_tgt, rx182_off
  rx182_start:
.annotate "line", 69
  # rx literal  "["
    add $I11, rx182_pos, 1
    gt $I11, rx182_eos, rx182_fail
    sub $I11, rx182_pos, rx182_off
    substr $S10, rx182_tgt, $I11, 1
    ne $S10, "[", rx182_fail
    add rx182_pos, 1
  # rx subrule "nibbler" subtype=capture negate=
    rx182_cur."!cursor_pos"(rx182_pos)
    $P10 = rx182_cur."nibbler"()
    unless $P10, rx182_fail
    rx182_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx182_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx182_pos, 1
    gt $I11, rx182_eos, rx182_fail
    sub $I11, rx182_pos, rx182_off
    substr $S10, rx182_tgt, $I11, 1
    ne $S10, "]", rx182_fail
    add rx182_pos, 1
  # rx pass
    rx182_cur."!cursor_pass"(rx182_pos, "metachar:sym<[ ]>")
    rx182_cur."!cursor_debug"("PASS  ", "metachar:sym<[ ]>", " at pos=", rx182_pos)
    .return (rx182_cur)
  rx182_fail:
.annotate "line", 3
    (rx182_rep, rx182_pos, $I10, $P10) = rx182_cur."!mark_fail"(0)
    lt rx182_pos, -1, rx182_done
    eq rx182_pos, -1, rx182_fail
    jump $I10
  rx182_done:
    rx182_cur."!cursor_fail"()
    rx182_cur."!cursor_debug"("FAIL  ", "metachar:sym<[ ]>")
    .return (rx182_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<[ ]>"  :subid("54_1258208089.76063") :method
.annotate "line", 3
    $P184 = self."!PREFIX__!subrule"("nibbler", "[")
    new $P185, "ResizablePMCArray"
    push $P185, $P184
    .return ($P185)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<( )>"  :subid("55_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx187_tgt
    .local int rx187_pos
    .local int rx187_off
    .local int rx187_eos
    .local int rx187_rep
    .local pmc rx187_cur
    (rx187_cur, rx187_pos, rx187_tgt, $I10) = self."!cursor_start"()
    rx187_cur."!cursor_debug"("START ", "metachar:sym<( )>")
    .lex unicode:"$\x{a2}", rx187_cur
    .local pmc match
    .lex "$/", match
    length rx187_eos, rx187_tgt
    set rx187_off, 0
    lt $I10, 2, rx187_start
    sub rx187_off, $I10, 1
    substr rx187_tgt, rx187_tgt, rx187_off
  rx187_start:
.annotate "line", 70
  # rx literal  "("
    add $I11, rx187_pos, 1
    gt $I11, rx187_eos, rx187_fail
    sub $I11, rx187_pos, rx187_off
    substr $S10, rx187_tgt, $I11, 1
    ne $S10, "(", rx187_fail
    add rx187_pos, 1
  # rx subrule "nibbler" subtype=capture negate=
    rx187_cur."!cursor_pos"(rx187_pos)
    $P10 = rx187_cur."nibbler"()
    unless $P10, rx187_fail
    rx187_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx187_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx187_pos, 1
    gt $I11, rx187_eos, rx187_fail
    sub $I11, rx187_pos, rx187_off
    substr $S10, rx187_tgt, $I11, 1
    ne $S10, ")", rx187_fail
    add rx187_pos, 1
  # rx pass
    rx187_cur."!cursor_pass"(rx187_pos, "metachar:sym<( )>")
    rx187_cur."!cursor_debug"("PASS  ", "metachar:sym<( )>", " at pos=", rx187_pos)
    .return (rx187_cur)
  rx187_fail:
.annotate "line", 3
    (rx187_rep, rx187_pos, $I10, $P10) = rx187_cur."!mark_fail"(0)
    lt rx187_pos, -1, rx187_done
    eq rx187_pos, -1, rx187_fail
    jump $I10
  rx187_done:
    rx187_cur."!cursor_fail"()
    rx187_cur."!cursor_debug"("FAIL  ", "metachar:sym<( )>")
    .return (rx187_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<( )>"  :subid("56_1258208089.76063") :method
.annotate "line", 3
    $P189 = self."!PREFIX__!subrule"("nibbler", "(")
    new $P190, "ResizablePMCArray"
    push $P190, $P189
    .return ($P190)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<'>"  :subid("57_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx192_tgt
    .local int rx192_pos
    .local int rx192_off
    .local int rx192_eos
    .local int rx192_rep
    .local pmc rx192_cur
    (rx192_cur, rx192_pos, rx192_tgt, $I10) = self."!cursor_start"()
    rx192_cur."!cursor_debug"("START ", "metachar:sym<'>")
    .lex unicode:"$\x{a2}", rx192_cur
    .local pmc match
    .lex "$/", match
    length rx192_eos, rx192_tgt
    set rx192_off, 0
    lt $I10, 2, rx192_start
    sub rx192_off, $I10, 1
    substr rx192_tgt, rx192_tgt, rx192_off
  rx192_start:
.annotate "line", 71
  # rx subrule "quote" subtype=capture negate=
    rx192_cur."!cursor_pos"(rx192_pos)
    $P10 = rx192_cur."quote"()
    unless $P10, rx192_fail
    rx192_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx192_pos = $P10."pos"()
  # rx pass
    rx192_cur."!cursor_pass"(rx192_pos, "metachar:sym<'>")
    rx192_cur."!cursor_debug"("PASS  ", "metachar:sym<'>", " at pos=", rx192_pos)
    .return (rx192_cur)
  rx192_fail:
.annotate "line", 3
    (rx192_rep, rx192_pos, $I10, $P10) = rx192_cur."!mark_fail"(0)
    lt rx192_pos, -1, rx192_done
    eq rx192_pos, -1, rx192_fail
    jump $I10
  rx192_done:
    rx192_cur."!cursor_fail"()
    rx192_cur."!cursor_debug"("FAIL  ", "metachar:sym<'>")
    .return (rx192_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<'>"  :subid("58_1258208089.76063") :method
.annotate "line", 3
    $P194 = self."!PREFIX__!subrule"("quote", "")
    new $P195, "ResizablePMCArray"
    push $P195, $P194
    .return ($P195)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<.>"  :subid("59_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx197_tgt
    .local int rx197_pos
    .local int rx197_off
    .local int rx197_eos
    .local int rx197_rep
    .local pmc rx197_cur
    (rx197_cur, rx197_pos, rx197_tgt, $I10) = self."!cursor_start"()
    rx197_cur."!cursor_debug"("START ", "metachar:sym<.>")
    .lex unicode:"$\x{a2}", rx197_cur
    .local pmc match
    .lex "$/", match
    length rx197_eos, rx197_tgt
    set rx197_off, 0
    lt $I10, 2, rx197_start
    sub rx197_off, $I10, 1
    substr rx197_tgt, rx197_tgt, rx197_off
  rx197_start:
.annotate "line", 72
  # rx subcapture "sym"
    set_addr $I10, rxcap_200_fail
    rx197_cur."!mark_push"(0, rx197_pos, $I10)
  # rx literal  "."
    add $I11, rx197_pos, 1
    gt $I11, rx197_eos, rx197_fail
    sub $I11, rx197_pos, rx197_off
    substr $S10, rx197_tgt, $I11, 1
    ne $S10, ".", rx197_fail
    add rx197_pos, 1
    set_addr $I10, rxcap_200_fail
    ($I12, $I11) = rx197_cur."!mark_peek"($I10)
    rx197_cur."!cursor_pos"($I11)
    ($P10) = rx197_cur."!cursor_start"()
    $P10."!cursor_pass"(rx197_pos, "")
    rx197_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_200_done
  rxcap_200_fail:
    goto rx197_fail
  rxcap_200_done:
  # rx pass
    rx197_cur."!cursor_pass"(rx197_pos, "metachar:sym<.>")
    rx197_cur."!cursor_debug"("PASS  ", "metachar:sym<.>", " at pos=", rx197_pos)
    .return (rx197_cur)
  rx197_fail:
.annotate "line", 3
    (rx197_rep, rx197_pos, $I10, $P10) = rx197_cur."!mark_fail"(0)
    lt rx197_pos, -1, rx197_done
    eq rx197_pos, -1, rx197_fail
    jump $I10
  rx197_done:
    rx197_cur."!cursor_fail"()
    rx197_cur."!cursor_debug"("FAIL  ", "metachar:sym<.>")
    .return (rx197_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<.>"  :subid("60_1258208089.76063") :method
.annotate "line", 3
    new $P199, "ResizablePMCArray"
    push $P199, "."
    .return ($P199)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^>"  :subid("61_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx202_tgt
    .local int rx202_pos
    .local int rx202_off
    .local int rx202_eos
    .local int rx202_rep
    .local pmc rx202_cur
    (rx202_cur, rx202_pos, rx202_tgt, $I10) = self."!cursor_start"()
    rx202_cur."!cursor_debug"("START ", "metachar:sym<^>")
    .lex unicode:"$\x{a2}", rx202_cur
    .local pmc match
    .lex "$/", match
    length rx202_eos, rx202_tgt
    set rx202_off, 0
    lt $I10, 2, rx202_start
    sub rx202_off, $I10, 1
    substr rx202_tgt, rx202_tgt, rx202_off
  rx202_start:
.annotate "line", 73
  # rx subcapture "sym"
    set_addr $I10, rxcap_205_fail
    rx202_cur."!mark_push"(0, rx202_pos, $I10)
  # rx literal  "^"
    add $I11, rx202_pos, 1
    gt $I11, rx202_eos, rx202_fail
    sub $I11, rx202_pos, rx202_off
    substr $S10, rx202_tgt, $I11, 1
    ne $S10, "^", rx202_fail
    add rx202_pos, 1
    set_addr $I10, rxcap_205_fail
    ($I12, $I11) = rx202_cur."!mark_peek"($I10)
    rx202_cur."!cursor_pos"($I11)
    ($P10) = rx202_cur."!cursor_start"()
    $P10."!cursor_pass"(rx202_pos, "")
    rx202_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_205_done
  rxcap_205_fail:
    goto rx202_fail
  rxcap_205_done:
  # rx pass
    rx202_cur."!cursor_pass"(rx202_pos, "metachar:sym<^>")
    rx202_cur."!cursor_debug"("PASS  ", "metachar:sym<^>", " at pos=", rx202_pos)
    .return (rx202_cur)
  rx202_fail:
.annotate "line", 3
    (rx202_rep, rx202_pos, $I10, $P10) = rx202_cur."!mark_fail"(0)
    lt rx202_pos, -1, rx202_done
    eq rx202_pos, -1, rx202_fail
    jump $I10
  rx202_done:
    rx202_cur."!cursor_fail"()
    rx202_cur."!cursor_debug"("FAIL  ", "metachar:sym<^>")
    .return (rx202_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<^>"  :subid("62_1258208089.76063") :method
.annotate "line", 3
    new $P204, "ResizablePMCArray"
    push $P204, "^"
    .return ($P204)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^^>"  :subid("63_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx207_tgt
    .local int rx207_pos
    .local int rx207_off
    .local int rx207_eos
    .local int rx207_rep
    .local pmc rx207_cur
    (rx207_cur, rx207_pos, rx207_tgt, $I10) = self."!cursor_start"()
    rx207_cur."!cursor_debug"("START ", "metachar:sym<^^>")
    .lex unicode:"$\x{a2}", rx207_cur
    .local pmc match
    .lex "$/", match
    length rx207_eos, rx207_tgt
    set rx207_off, 0
    lt $I10, 2, rx207_start
    sub rx207_off, $I10, 1
    substr rx207_tgt, rx207_tgt, rx207_off
  rx207_start:
.annotate "line", 74
  # rx subcapture "sym"
    set_addr $I10, rxcap_210_fail
    rx207_cur."!mark_push"(0, rx207_pos, $I10)
  # rx literal  "^^"
    add $I11, rx207_pos, 2
    gt $I11, rx207_eos, rx207_fail
    sub $I11, rx207_pos, rx207_off
    substr $S10, rx207_tgt, $I11, 2
    ne $S10, "^^", rx207_fail
    add rx207_pos, 2
    set_addr $I10, rxcap_210_fail
    ($I12, $I11) = rx207_cur."!mark_peek"($I10)
    rx207_cur."!cursor_pos"($I11)
    ($P10) = rx207_cur."!cursor_start"()
    $P10."!cursor_pass"(rx207_pos, "")
    rx207_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_210_done
  rxcap_210_fail:
    goto rx207_fail
  rxcap_210_done:
  # rx pass
    rx207_cur."!cursor_pass"(rx207_pos, "metachar:sym<^^>")
    rx207_cur."!cursor_debug"("PASS  ", "metachar:sym<^^>", " at pos=", rx207_pos)
    .return (rx207_cur)
  rx207_fail:
.annotate "line", 3
    (rx207_rep, rx207_pos, $I10, $P10) = rx207_cur."!mark_fail"(0)
    lt rx207_pos, -1, rx207_done
    eq rx207_pos, -1, rx207_fail
    jump $I10
  rx207_done:
    rx207_cur."!cursor_fail"()
    rx207_cur."!cursor_debug"("FAIL  ", "metachar:sym<^^>")
    .return (rx207_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<^^>"  :subid("64_1258208089.76063") :method
.annotate "line", 3
    new $P209, "ResizablePMCArray"
    push $P209, "^^"
    .return ($P209)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$>"  :subid("65_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx212_tgt
    .local int rx212_pos
    .local int rx212_off
    .local int rx212_eos
    .local int rx212_rep
    .local pmc rx212_cur
    (rx212_cur, rx212_pos, rx212_tgt, $I10) = self."!cursor_start"()
    rx212_cur."!cursor_debug"("START ", "metachar:sym<$>")
    .lex unicode:"$\x{a2}", rx212_cur
    .local pmc match
    .lex "$/", match
    length rx212_eos, rx212_tgt
    set rx212_off, 0
    lt $I10, 2, rx212_start
    sub rx212_off, $I10, 1
    substr rx212_tgt, rx212_tgt, rx212_off
  rx212_start:
.annotate "line", 75
  # rx subcapture "sym"
    set_addr $I10, rxcap_215_fail
    rx212_cur."!mark_push"(0, rx212_pos, $I10)
  # rx literal  "$"
    add $I11, rx212_pos, 1
    gt $I11, rx212_eos, rx212_fail
    sub $I11, rx212_pos, rx212_off
    substr $S10, rx212_tgt, $I11, 1
    ne $S10, "$", rx212_fail
    add rx212_pos, 1
    set_addr $I10, rxcap_215_fail
    ($I12, $I11) = rx212_cur."!mark_peek"($I10)
    rx212_cur."!cursor_pos"($I11)
    ($P10) = rx212_cur."!cursor_start"()
    $P10."!cursor_pass"(rx212_pos, "")
    rx212_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_215_done
  rxcap_215_fail:
    goto rx212_fail
  rxcap_215_done:
  # rx pass
    rx212_cur."!cursor_pass"(rx212_pos, "metachar:sym<$>")
    rx212_cur."!cursor_debug"("PASS  ", "metachar:sym<$>", " at pos=", rx212_pos)
    .return (rx212_cur)
  rx212_fail:
.annotate "line", 3
    (rx212_rep, rx212_pos, $I10, $P10) = rx212_cur."!mark_fail"(0)
    lt rx212_pos, -1, rx212_done
    eq rx212_pos, -1, rx212_fail
    jump $I10
  rx212_done:
    rx212_cur."!cursor_fail"()
    rx212_cur."!cursor_debug"("FAIL  ", "metachar:sym<$>")
    .return (rx212_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<$>"  :subid("66_1258208089.76063") :method
.annotate "line", 3
    new $P214, "ResizablePMCArray"
    push $P214, "$"
    .return ($P214)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$$>"  :subid("67_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx217_tgt
    .local int rx217_pos
    .local int rx217_off
    .local int rx217_eos
    .local int rx217_rep
    .local pmc rx217_cur
    (rx217_cur, rx217_pos, rx217_tgt, $I10) = self."!cursor_start"()
    rx217_cur."!cursor_debug"("START ", "metachar:sym<$$>")
    .lex unicode:"$\x{a2}", rx217_cur
    .local pmc match
    .lex "$/", match
    length rx217_eos, rx217_tgt
    set rx217_off, 0
    lt $I10, 2, rx217_start
    sub rx217_off, $I10, 1
    substr rx217_tgt, rx217_tgt, rx217_off
  rx217_start:
.annotate "line", 76
  # rx subcapture "sym"
    set_addr $I10, rxcap_220_fail
    rx217_cur."!mark_push"(0, rx217_pos, $I10)
  # rx literal  "$$"
    add $I11, rx217_pos, 2
    gt $I11, rx217_eos, rx217_fail
    sub $I11, rx217_pos, rx217_off
    substr $S10, rx217_tgt, $I11, 2
    ne $S10, "$$", rx217_fail
    add rx217_pos, 2
    set_addr $I10, rxcap_220_fail
    ($I12, $I11) = rx217_cur."!mark_peek"($I10)
    rx217_cur."!cursor_pos"($I11)
    ($P10) = rx217_cur."!cursor_start"()
    $P10."!cursor_pass"(rx217_pos, "")
    rx217_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_220_done
  rxcap_220_fail:
    goto rx217_fail
  rxcap_220_done:
  # rx pass
    rx217_cur."!cursor_pass"(rx217_pos, "metachar:sym<$$>")
    rx217_cur."!cursor_debug"("PASS  ", "metachar:sym<$$>", " at pos=", rx217_pos)
    .return (rx217_cur)
  rx217_fail:
.annotate "line", 3
    (rx217_rep, rx217_pos, $I10, $P10) = rx217_cur."!mark_fail"(0)
    lt rx217_pos, -1, rx217_done
    eq rx217_pos, -1, rx217_fail
    jump $I10
  rx217_done:
    rx217_cur."!cursor_fail"()
    rx217_cur."!cursor_debug"("FAIL  ", "metachar:sym<$$>")
    .return (rx217_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<$$>"  :subid("68_1258208089.76063") :method
.annotate "line", 3
    new $P219, "ResizablePMCArray"
    push $P219, "$$"
    .return ($P219)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<:::>"  :subid("69_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx222_tgt
    .local int rx222_pos
    .local int rx222_off
    .local int rx222_eos
    .local int rx222_rep
    .local pmc rx222_cur
    (rx222_cur, rx222_pos, rx222_tgt, $I10) = self."!cursor_start"()
    rx222_cur."!cursor_debug"("START ", "metachar:sym<:::>")
    .lex unicode:"$\x{a2}", rx222_cur
    .local pmc match
    .lex "$/", match
    length rx222_eos, rx222_tgt
    set rx222_off, 0
    lt $I10, 2, rx222_start
    sub rx222_off, $I10, 1
    substr rx222_tgt, rx222_tgt, rx222_off
  rx222_start:
.annotate "line", 77
  # rx subcapture "sym"
    set_addr $I10, rxcap_226_fail
    rx222_cur."!mark_push"(0, rx222_pos, $I10)
  # rx literal  ":::"
    add $I11, rx222_pos, 3
    gt $I11, rx222_eos, rx222_fail
    sub $I11, rx222_pos, rx222_off
    substr $S10, rx222_tgt, $I11, 3
    ne $S10, ":::", rx222_fail
    add rx222_pos, 3
    set_addr $I10, rxcap_226_fail
    ($I12, $I11) = rx222_cur."!mark_peek"($I10)
    rx222_cur."!cursor_pos"($I11)
    ($P10) = rx222_cur."!cursor_start"()
    $P10."!cursor_pass"(rx222_pos, "")
    rx222_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_226_done
  rxcap_226_fail:
    goto rx222_fail
  rxcap_226_done:
  # rx subrule "panic" subtype=method negate=
    rx222_cur."!cursor_pos"(rx222_pos)
    $P10 = rx222_cur."panic"("::: not yet implemented")
    unless $P10, rx222_fail
    rx222_pos = $P10."pos"()
  # rx pass
    rx222_cur."!cursor_pass"(rx222_pos, "metachar:sym<:::>")
    rx222_cur."!cursor_debug"("PASS  ", "metachar:sym<:::>", " at pos=", rx222_pos)
    .return (rx222_cur)
  rx222_fail:
.annotate "line", 3
    (rx222_rep, rx222_pos, $I10, $P10) = rx222_cur."!mark_fail"(0)
    lt rx222_pos, -1, rx222_done
    eq rx222_pos, -1, rx222_fail
    jump $I10
  rx222_done:
    rx222_cur."!cursor_fail"()
    rx222_cur."!cursor_debug"("FAIL  ", "metachar:sym<:::>")
    .return (rx222_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<:::>"  :subid("70_1258208089.76063") :method
.annotate "line", 3
    $P224 = self."!PREFIX__!subrule"("", ":::")
    new $P225, "ResizablePMCArray"
    push $P225, $P224
    .return ($P225)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<::>"  :subid("71_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx228_tgt
    .local int rx228_pos
    .local int rx228_off
    .local int rx228_eos
    .local int rx228_rep
    .local pmc rx228_cur
    (rx228_cur, rx228_pos, rx228_tgt, $I10) = self."!cursor_start"()
    rx228_cur."!cursor_debug"("START ", "metachar:sym<::>")
    .lex unicode:"$\x{a2}", rx228_cur
    .local pmc match
    .lex "$/", match
    length rx228_eos, rx228_tgt
    set rx228_off, 0
    lt $I10, 2, rx228_start
    sub rx228_off, $I10, 1
    substr rx228_tgt, rx228_tgt, rx228_off
  rx228_start:
.annotate "line", 78
  # rx subcapture "sym"
    set_addr $I10, rxcap_232_fail
    rx228_cur."!mark_push"(0, rx228_pos, $I10)
  # rx literal  "::"
    add $I11, rx228_pos, 2
    gt $I11, rx228_eos, rx228_fail
    sub $I11, rx228_pos, rx228_off
    substr $S10, rx228_tgt, $I11, 2
    ne $S10, "::", rx228_fail
    add rx228_pos, 2
    set_addr $I10, rxcap_232_fail
    ($I12, $I11) = rx228_cur."!mark_peek"($I10)
    rx228_cur."!cursor_pos"($I11)
    ($P10) = rx228_cur."!cursor_start"()
    $P10."!cursor_pass"(rx228_pos, "")
    rx228_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_232_done
  rxcap_232_fail:
    goto rx228_fail
  rxcap_232_done:
  # rx subrule "panic" subtype=method negate=
    rx228_cur."!cursor_pos"(rx228_pos)
    $P10 = rx228_cur."panic"(":: not yet implemented")
    unless $P10, rx228_fail
    rx228_pos = $P10."pos"()
  # rx pass
    rx228_cur."!cursor_pass"(rx228_pos, "metachar:sym<::>")
    rx228_cur."!cursor_debug"("PASS  ", "metachar:sym<::>", " at pos=", rx228_pos)
    .return (rx228_cur)
  rx228_fail:
.annotate "line", 3
    (rx228_rep, rx228_pos, $I10, $P10) = rx228_cur."!mark_fail"(0)
    lt rx228_pos, -1, rx228_done
    eq rx228_pos, -1, rx228_fail
    jump $I10
  rx228_done:
    rx228_cur."!cursor_fail"()
    rx228_cur."!cursor_debug"("FAIL  ", "metachar:sym<::>")
    .return (rx228_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<::>"  :subid("72_1258208089.76063") :method
.annotate "line", 3
    $P230 = self."!PREFIX__!subrule"("", "::")
    new $P231, "ResizablePMCArray"
    push $P231, $P230
    .return ($P231)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<lwb>"  :subid("73_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx234_tgt
    .local int rx234_pos
    .local int rx234_off
    .local int rx234_eos
    .local int rx234_rep
    .local pmc rx234_cur
    (rx234_cur, rx234_pos, rx234_tgt, $I10) = self."!cursor_start"()
    rx234_cur."!cursor_debug"("START ", "metachar:sym<lwb>")
    .lex unicode:"$\x{a2}", rx234_cur
    .local pmc match
    .lex "$/", match
    length rx234_eos, rx234_tgt
    set rx234_off, 0
    lt $I10, 2, rx234_start
    sub rx234_off, $I10, 1
    substr rx234_tgt, rx234_tgt, rx234_off
  rx234_start:
.annotate "line", 79
  # rx subcapture "sym"
    set_addr $I10, rxcap_238_fail
    rx234_cur."!mark_push"(0, rx234_pos, $I10)
  alt237_0:
    set_addr $I10, alt237_1
    rx234_cur."!mark_push"(0, rx234_pos, $I10)
  # rx literal  "<<"
    add $I11, rx234_pos, 2
    gt $I11, rx234_eos, rx234_fail
    sub $I11, rx234_pos, rx234_off
    substr $S10, rx234_tgt, $I11, 2
    ne $S10, "<<", rx234_fail
    add rx234_pos, 2
    goto alt237_end
  alt237_1:
  # rx literal  unicode:"\x{ab}"
    add $I11, rx234_pos, 1
    gt $I11, rx234_eos, rx234_fail
    sub $I11, rx234_pos, rx234_off
    substr $S10, rx234_tgt, $I11, 1
    ne $S10, unicode:"\x{ab}", rx234_fail
    add rx234_pos, 1
  alt237_end:
    set_addr $I10, rxcap_238_fail
    ($I12, $I11) = rx234_cur."!mark_peek"($I10)
    rx234_cur."!cursor_pos"($I11)
    ($P10) = rx234_cur."!cursor_start"()
    $P10."!cursor_pass"(rx234_pos, "")
    rx234_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_238_done
  rxcap_238_fail:
    goto rx234_fail
  rxcap_238_done:
  # rx pass
    rx234_cur."!cursor_pass"(rx234_pos, "metachar:sym<lwb>")
    rx234_cur."!cursor_debug"("PASS  ", "metachar:sym<lwb>", " at pos=", rx234_pos)
    .return (rx234_cur)
  rx234_fail:
.annotate "line", 3
    (rx234_rep, rx234_pos, $I10, $P10) = rx234_cur."!mark_fail"(0)
    lt rx234_pos, -1, rx234_done
    eq rx234_pos, -1, rx234_fail
    jump $I10
  rx234_done:
    rx234_cur."!cursor_fail"()
    rx234_cur."!cursor_debug"("FAIL  ", "metachar:sym<lwb>")
    .return (rx234_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<lwb>"  :subid("74_1258208089.76063") :method
.annotate "line", 3
    new $P236, "ResizablePMCArray"
    push $P236, unicode:"\x{ab}"
    push $P236, "<<"
    .return ($P236)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<rwb>"  :subid("75_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx240_tgt
    .local int rx240_pos
    .local int rx240_off
    .local int rx240_eos
    .local int rx240_rep
    .local pmc rx240_cur
    (rx240_cur, rx240_pos, rx240_tgt, $I10) = self."!cursor_start"()
    rx240_cur."!cursor_debug"("START ", "metachar:sym<rwb>")
    .lex unicode:"$\x{a2}", rx240_cur
    .local pmc match
    .lex "$/", match
    length rx240_eos, rx240_tgt
    set rx240_off, 0
    lt $I10, 2, rx240_start
    sub rx240_off, $I10, 1
    substr rx240_tgt, rx240_tgt, rx240_off
  rx240_start:
.annotate "line", 80
  # rx subcapture "sym"
    set_addr $I10, rxcap_244_fail
    rx240_cur."!mark_push"(0, rx240_pos, $I10)
  alt243_0:
    set_addr $I10, alt243_1
    rx240_cur."!mark_push"(0, rx240_pos, $I10)
  # rx literal  ">>"
    add $I11, rx240_pos, 2
    gt $I11, rx240_eos, rx240_fail
    sub $I11, rx240_pos, rx240_off
    substr $S10, rx240_tgt, $I11, 2
    ne $S10, ">>", rx240_fail
    add rx240_pos, 2
    goto alt243_end
  alt243_1:
  # rx literal  unicode:"\x{bb}"
    add $I11, rx240_pos, 1
    gt $I11, rx240_eos, rx240_fail
    sub $I11, rx240_pos, rx240_off
    substr $S10, rx240_tgt, $I11, 1
    ne $S10, unicode:"\x{bb}", rx240_fail
    add rx240_pos, 1
  alt243_end:
    set_addr $I10, rxcap_244_fail
    ($I12, $I11) = rx240_cur."!mark_peek"($I10)
    rx240_cur."!cursor_pos"($I11)
    ($P10) = rx240_cur."!cursor_start"()
    $P10."!cursor_pass"(rx240_pos, "")
    rx240_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_244_done
  rxcap_244_fail:
    goto rx240_fail
  rxcap_244_done:
  # rx pass
    rx240_cur."!cursor_pass"(rx240_pos, "metachar:sym<rwb>")
    rx240_cur."!cursor_debug"("PASS  ", "metachar:sym<rwb>", " at pos=", rx240_pos)
    .return (rx240_cur)
  rx240_fail:
.annotate "line", 3
    (rx240_rep, rx240_pos, $I10, $P10) = rx240_cur."!mark_fail"(0)
    lt rx240_pos, -1, rx240_done
    eq rx240_pos, -1, rx240_fail
    jump $I10
  rx240_done:
    rx240_cur."!cursor_fail"()
    rx240_cur."!cursor_debug"("FAIL  ", "metachar:sym<rwb>")
    .return (rx240_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<rwb>"  :subid("76_1258208089.76063") :method
.annotate "line", 3
    new $P242, "ResizablePMCArray"
    push $P242, unicode:"\x{bb}"
    push $P242, ">>"
    .return ($P242)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<bs>"  :subid("77_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx246_tgt
    .local int rx246_pos
    .local int rx246_off
    .local int rx246_eos
    .local int rx246_rep
    .local pmc rx246_cur
    (rx246_cur, rx246_pos, rx246_tgt, $I10) = self."!cursor_start"()
    rx246_cur."!cursor_debug"("START ", "metachar:sym<bs>")
    .lex unicode:"$\x{a2}", rx246_cur
    .local pmc match
    .lex "$/", match
    length rx246_eos, rx246_tgt
    set rx246_off, 0
    lt $I10, 2, rx246_start
    sub rx246_off, $I10, 1
    substr rx246_tgt, rx246_tgt, rx246_off
  rx246_start:
.annotate "line", 81
  # rx literal  "\\"
    add $I11, rx246_pos, 1
    gt $I11, rx246_eos, rx246_fail
    sub $I11, rx246_pos, rx246_off
    substr $S10, rx246_tgt, $I11, 1
    ne $S10, "\\", rx246_fail
    add rx246_pos, 1
  # rx subrule "backslash" subtype=capture negate=
    rx246_cur."!cursor_pos"(rx246_pos)
    $P10 = rx246_cur."backslash"()
    unless $P10, rx246_fail
    rx246_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backslash")
    rx246_pos = $P10."pos"()
  # rx pass
    rx246_cur."!cursor_pass"(rx246_pos, "metachar:sym<bs>")
    rx246_cur."!cursor_debug"("PASS  ", "metachar:sym<bs>", " at pos=", rx246_pos)
    .return (rx246_cur)
  rx246_fail:
.annotate "line", 3
    (rx246_rep, rx246_pos, $I10, $P10) = rx246_cur."!mark_fail"(0)
    lt rx246_pos, -1, rx246_done
    eq rx246_pos, -1, rx246_fail
    jump $I10
  rx246_done:
    rx246_cur."!cursor_fail"()
    rx246_cur."!cursor_debug"("FAIL  ", "metachar:sym<bs>")
    .return (rx246_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<bs>"  :subid("78_1258208089.76063") :method
.annotate "line", 3
    $P248 = self."!PREFIX__!subrule"("backslash", "\\")
    new $P249, "ResizablePMCArray"
    push $P249, $P248
    .return ($P249)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<mod>"  :subid("79_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx251_tgt
    .local int rx251_pos
    .local int rx251_off
    .local int rx251_eos
    .local int rx251_rep
    .local pmc rx251_cur
    (rx251_cur, rx251_pos, rx251_tgt, $I10) = self."!cursor_start"()
    rx251_cur."!cursor_debug"("START ", "metachar:sym<mod>")
    .lex unicode:"$\x{a2}", rx251_cur
    .local pmc match
    .lex "$/", match
    length rx251_eos, rx251_tgt
    set rx251_off, 0
    lt $I10, 2, rx251_start
    sub rx251_off, $I10, 1
    substr rx251_tgt, rx251_tgt, rx251_off
  rx251_start:
.annotate "line", 82
  # rx subrule "mod_internal" subtype=capture negate=
    rx251_cur."!cursor_pos"(rx251_pos)
    $P10 = rx251_cur."mod_internal"()
    unless $P10, rx251_fail
    rx251_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_internal")
    rx251_pos = $P10."pos"()
  # rx pass
    rx251_cur."!cursor_pass"(rx251_pos, "metachar:sym<mod>")
    rx251_cur."!cursor_debug"("PASS  ", "metachar:sym<mod>", " at pos=", rx251_pos)
    .return (rx251_cur)
  rx251_fail:
.annotate "line", 3
    (rx251_rep, rx251_pos, $I10, $P10) = rx251_cur."!mark_fail"(0)
    lt rx251_pos, -1, rx251_done
    eq rx251_pos, -1, rx251_fail
    jump $I10
  rx251_done:
    rx251_cur."!cursor_fail"()
    rx251_cur."!cursor_debug"("FAIL  ", "metachar:sym<mod>")
    .return (rx251_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<mod>"  :subid("80_1258208089.76063") :method
.annotate "line", 3
    $P253 = self."!PREFIX__!subrule"("mod_internal", "")
    new $P254, "ResizablePMCArray"
    push $P254, $P253
    .return ($P254)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<~>"  :subid("81_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx256_tgt
    .local int rx256_pos
    .local int rx256_off
    .local int rx256_eos
    .local int rx256_rep
    .local pmc rx256_cur
    (rx256_cur, rx256_pos, rx256_tgt, $I10) = self."!cursor_start"()
    rx256_cur."!cursor_debug"("START ", "metachar:sym<~>")
    .lex unicode:"$\x{a2}", rx256_cur
    .local pmc match
    .lex "$/", match
    length rx256_eos, rx256_tgt
    set rx256_off, 0
    lt $I10, 2, rx256_start
    sub rx256_off, $I10, 1
    substr rx256_tgt, rx256_tgt, rx256_off
  rx256_start:
.annotate "line", 86
  # rx subcapture "sym"
    set_addr $I10, rxcap_260_fail
    rx256_cur."!mark_push"(0, rx256_pos, $I10)
  # rx literal  "~"
    add $I11, rx256_pos, 1
    gt $I11, rx256_eos, rx256_fail
    sub $I11, rx256_pos, rx256_off
    substr $S10, rx256_tgt, $I11, 1
    ne $S10, "~", rx256_fail
    add rx256_pos, 1
    set_addr $I10, rxcap_260_fail
    ($I12, $I11) = rx256_cur."!mark_peek"($I10)
    rx256_cur."!cursor_pos"($I11)
    ($P10) = rx256_cur."!cursor_start"()
    $P10."!cursor_pass"(rx256_pos, "")
    rx256_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_260_done
  rxcap_260_fail:
    goto rx256_fail
  rxcap_260_done:
.annotate "line", 87
  # rx subrule "ws" subtype=method negate=
    rx256_cur."!cursor_pos"(rx256_pos)
    $P10 = rx256_cur."ws"()
    unless $P10, rx256_fail
    rx256_pos = $P10."pos"()
  # rx subrule "quantified_atom" subtype=capture negate=
    rx256_cur."!cursor_pos"(rx256_pos)
    $P10 = rx256_cur."quantified_atom"()
    unless $P10, rx256_fail
    rx256_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("GOAL")
    rx256_pos = $P10."pos"()
.annotate "line", 88
  # rx subrule "ws" subtype=method negate=
    rx256_cur."!cursor_pos"(rx256_pos)
    $P10 = rx256_cur."ws"()
    unless $P10, rx256_fail
    rx256_pos = $P10."pos"()
  # rx subrule "quantified_atom" subtype=capture negate=
    rx256_cur."!cursor_pos"(rx256_pos)
    $P10 = rx256_cur."quantified_atom"()
    unless $P10, rx256_fail
    rx256_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx256_pos = $P10."pos"()
.annotate "line", 85
  # rx pass
    rx256_cur."!cursor_pass"(rx256_pos, "metachar:sym<~>")
    rx256_cur."!cursor_debug"("PASS  ", "metachar:sym<~>", " at pos=", rx256_pos)
    .return (rx256_cur)
  rx256_fail:
.annotate "line", 3
    (rx256_rep, rx256_pos, $I10, $P10) = rx256_cur."!mark_fail"(0)
    lt rx256_pos, -1, rx256_done
    eq rx256_pos, -1, rx256_fail
    jump $I10
  rx256_done:
    rx256_cur."!cursor_fail"()
    rx256_cur."!cursor_debug"("FAIL  ", "metachar:sym<~>")
    .return (rx256_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<~>"  :subid("82_1258208089.76063") :method
.annotate "line", 3
    $P258 = self."!PREFIX__!subrule"("", "~")
    new $P259, "ResizablePMCArray"
    push $P259, $P258
    .return ($P259)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<{*}>"  :subid("83_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx262_tgt
    .local int rx262_pos
    .local int rx262_off
    .local int rx262_eos
    .local int rx262_rep
    .local pmc rx262_cur
    (rx262_cur, rx262_pos, rx262_tgt, $I10) = self."!cursor_start"()
    rx262_cur."!cursor_debug"("START ", "metachar:sym<{*}>")
    rx262_cur."!cursor_caparray"("key")
    .lex unicode:"$\x{a2}", rx262_cur
    .local pmc match
    .lex "$/", match
    length rx262_eos, rx262_tgt
    set rx262_off, 0
    lt $I10, 2, rx262_start
    sub rx262_off, $I10, 1
    substr rx262_tgt, rx262_tgt, rx262_off
  rx262_start:
.annotate "line", 92
  # rx subcapture "sym"
    set_addr $I10, rxcap_265_fail
    rx262_cur."!mark_push"(0, rx262_pos, $I10)
  # rx literal  "{*}"
    add $I11, rx262_pos, 3
    gt $I11, rx262_eos, rx262_fail
    sub $I11, rx262_pos, rx262_off
    substr $S10, rx262_tgt, $I11, 3
    ne $S10, "{*}", rx262_fail
    add rx262_pos, 3
    set_addr $I10, rxcap_265_fail
    ($I12, $I11) = rx262_cur."!mark_peek"($I10)
    rx262_cur."!cursor_pos"($I11)
    ($P10) = rx262_cur."!cursor_start"()
    $P10."!cursor_pass"(rx262_pos, "")
    rx262_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_265_done
  rxcap_265_fail:
    goto rx262_fail
  rxcap_265_done:
.annotate "line", 93
  # rx rxquantr266 ** 0..1
    set_addr $I276, rxquantr266_done
    rx262_cur."!mark_push"(0, rx262_pos, $I276)
  rxquantr266_loop:
  # rx rxquantr267 ** 0..*
    set_addr $I268, rxquantr267_done
    rx262_cur."!mark_push"(0, rx262_pos, $I268)
  rxquantr267_loop:
  # rx enumcharlist negate=0
    ge rx262_pos, rx262_eos, rx262_fail
    sub $I10, rx262_pos, rx262_off
    substr $S10, rx262_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx262_fail
    inc rx262_pos
    (rx262_rep) = rx262_cur."!mark_commit"($I268)
    rx262_cur."!mark_push"(rx262_rep, rx262_pos, $I268)
    goto rxquantr267_loop
  rxquantr267_done:
  # rx literal  "#= "
    add $I11, rx262_pos, 3
    gt $I11, rx262_eos, rx262_fail
    sub $I11, rx262_pos, rx262_off
    substr $S10, rx262_tgt, $I11, 3
    ne $S10, "#= ", rx262_fail
    add rx262_pos, 3
  # rx rxquantr269 ** 0..*
    set_addr $I270, rxquantr269_done
    rx262_cur."!mark_push"(0, rx262_pos, $I270)
  rxquantr269_loop:
  # rx enumcharlist negate=0
    ge rx262_pos, rx262_eos, rx262_fail
    sub $I10, rx262_pos, rx262_off
    substr $S10, rx262_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx262_fail
    inc rx262_pos
    (rx262_rep) = rx262_cur."!mark_commit"($I270)
    rx262_cur."!mark_push"(rx262_rep, rx262_pos, $I270)
    goto rxquantr269_loop
  rxquantr269_done:
  # rx subcapture "key"
    set_addr $I10, rxcap_275_fail
    rx262_cur."!mark_push"(0, rx262_pos, $I10)
  # rx charclass_q S r 1..-1
    sub $I10, rx262_pos, rx262_off
    find_cclass $I11, 32, rx262_tgt, $I10, rx262_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx262_fail
    add rx262_pos, rx262_off, $I11
  # rx rxquantr271 ** 0..*
    set_addr $I274, rxquantr271_done
    rx262_cur."!mark_push"(0, rx262_pos, $I274)
  rxquantr271_loop:
  # rx rxquantr272 ** 1..*
    set_addr $I273, rxquantr272_done
    rx262_cur."!mark_push"(0, -1, $I273)
  rxquantr272_loop:
  # rx enumcharlist negate=0
    ge rx262_pos, rx262_eos, rx262_fail
    sub $I10, rx262_pos, rx262_off
    substr $S10, rx262_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx262_fail
    inc rx262_pos
    (rx262_rep) = rx262_cur."!mark_commit"($I273)
    rx262_cur."!mark_push"(rx262_rep, rx262_pos, $I273)
    goto rxquantr272_loop
  rxquantr272_done:
  # rx charclass_q S r 1..-1
    sub $I10, rx262_pos, rx262_off
    find_cclass $I11, 32, rx262_tgt, $I10, rx262_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx262_fail
    add rx262_pos, rx262_off, $I11
    (rx262_rep) = rx262_cur."!mark_commit"($I274)
    rx262_cur."!mark_push"(rx262_rep, rx262_pos, $I274)
    goto rxquantr271_loop
  rxquantr271_done:
    set_addr $I10, rxcap_275_fail
    ($I12, $I11) = rx262_cur."!mark_peek"($I10)
    rx262_cur."!cursor_pos"($I11)
    ($P10) = rx262_cur."!cursor_start"()
    $P10."!cursor_pass"(rx262_pos, "")
    rx262_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("key")
    goto rxcap_275_done
  rxcap_275_fail:
    goto rx262_fail
  rxcap_275_done:
    (rx262_rep) = rx262_cur."!mark_commit"($I276)
  rxquantr266_done:
.annotate "line", 91
  # rx pass
    rx262_cur."!cursor_pass"(rx262_pos, "metachar:sym<{*}>")
    rx262_cur."!cursor_debug"("PASS  ", "metachar:sym<{*}>", " at pos=", rx262_pos)
    .return (rx262_cur)
  rx262_fail:
.annotate "line", 3
    (rx262_rep, rx262_pos, $I10, $P10) = rx262_cur."!mark_fail"(0)
    lt rx262_pos, -1, rx262_done
    eq rx262_pos, -1, rx262_fail
    jump $I10
  rx262_done:
    rx262_cur."!cursor_fail"()
    rx262_cur."!cursor_debug"("FAIL  ", "metachar:sym<{*}>")
    .return (rx262_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<{*}>"  :subid("84_1258208089.76063") :method
.annotate "line", 3
    new $P264, "ResizablePMCArray"
    push $P264, "{*}"
    .return ($P264)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<assert>"  :subid("85_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx278_tgt
    .local int rx278_pos
    .local int rx278_off
    .local int rx278_eos
    .local int rx278_rep
    .local pmc rx278_cur
    (rx278_cur, rx278_pos, rx278_tgt, $I10) = self."!cursor_start"()
    rx278_cur."!cursor_debug"("START ", "metachar:sym<assert>")
    .lex unicode:"$\x{a2}", rx278_cur
    .local pmc match
    .lex "$/", match
    length rx278_eos, rx278_tgt
    set rx278_off, 0
    lt $I10, 2, rx278_start
    sub rx278_off, $I10, 1
    substr rx278_tgt, rx278_tgt, rx278_off
  rx278_start:
.annotate "line", 96
  # rx literal  "<"
    add $I11, rx278_pos, 1
    gt $I11, rx278_eos, rx278_fail
    sub $I11, rx278_pos, rx278_off
    substr $S10, rx278_tgt, $I11, 1
    ne $S10, "<", rx278_fail
    add rx278_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx278_cur."!cursor_pos"(rx278_pos)
    $P10 = rx278_cur."assertion"()
    unless $P10, rx278_fail
    rx278_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx278_pos = $P10."pos"()
  alt282_0:
.annotate "line", 97
    set_addr $I10, alt282_1
    rx278_cur."!mark_push"(0, rx278_pos, $I10)
  # rx literal  ">"
    add $I11, rx278_pos, 1
    gt $I11, rx278_eos, rx278_fail
    sub $I11, rx278_pos, rx278_off
    substr $S10, rx278_tgt, $I11, 1
    ne $S10, ">", rx278_fail
    add rx278_pos, 1
    goto alt282_end
  alt282_1:
  # rx subrule "panic" subtype=method negate=
    rx278_cur."!cursor_pos"(rx278_pos)
    $P10 = rx278_cur."panic"("regex assertion not terminated by angle bracket")
    unless $P10, rx278_fail
    rx278_pos = $P10."pos"()
  alt282_end:
.annotate "line", 95
  # rx pass
    rx278_cur."!cursor_pass"(rx278_pos, "metachar:sym<assert>")
    rx278_cur."!cursor_debug"("PASS  ", "metachar:sym<assert>", " at pos=", rx278_pos)
    .return (rx278_cur)
  rx278_fail:
.annotate "line", 3
    (rx278_rep, rx278_pos, $I10, $P10) = rx278_cur."!mark_fail"(0)
    lt rx278_pos, -1, rx278_done
    eq rx278_pos, -1, rx278_fail
    jump $I10
  rx278_done:
    rx278_cur."!cursor_fail"()
    rx278_cur."!cursor_debug"("FAIL  ", "metachar:sym<assert>")
    .return (rx278_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<assert>"  :subid("86_1258208089.76063") :method
.annotate "line", 3
    $P280 = self."!PREFIX__!subrule"("assertion", "<")
    new $P281, "ResizablePMCArray"
    push $P281, $P280
    .return ($P281)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<var>"  :subid("87_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx284_tgt
    .local int rx284_pos
    .local int rx284_off
    .local int rx284_eos
    .local int rx284_rep
    .local pmc rx284_cur
    (rx284_cur, rx284_pos, rx284_tgt, $I10) = self."!cursor_start"()
    rx284_cur."!cursor_debug"("START ", "metachar:sym<var>")
    rx284_cur."!cursor_caparray"("quantified_atom")
    .lex unicode:"$\x{a2}", rx284_cur
    .local pmc match
    .lex "$/", match
    length rx284_eos, rx284_tgt
    set rx284_off, 0
    lt $I10, 2, rx284_start
    sub rx284_off, $I10, 1
    substr rx284_tgt, rx284_tgt, rx284_off
  rx284_start:
  alt287_0:
.annotate "line", 101
    set_addr $I10, alt287_1
    rx284_cur."!mark_push"(0, rx284_pos, $I10)
.annotate "line", 102
  # rx literal  "$<"
    add $I11, rx284_pos, 2
    gt $I11, rx284_eos, rx284_fail
    sub $I11, rx284_pos, rx284_off
    substr $S10, rx284_tgt, $I11, 2
    ne $S10, "$<", rx284_fail
    add rx284_pos, 2
  # rx subcapture "name"
    set_addr $I10, rxcap_290_fail
    rx284_cur."!mark_push"(0, rx284_pos, $I10)
  # rx rxquantr288 ** 1..*
    set_addr $I289, rxquantr288_done
    rx284_cur."!mark_push"(0, -1, $I289)
  rxquantr288_loop:
  # rx enumcharlist negate=1
    ge rx284_pos, rx284_eos, rx284_fail
    sub $I10, rx284_pos, rx284_off
    substr $S10, rx284_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx284_fail
    inc rx284_pos
    (rx284_rep) = rx284_cur."!mark_commit"($I289)
    rx284_cur."!mark_push"(rx284_rep, rx284_pos, $I289)
    goto rxquantr288_loop
  rxquantr288_done:
    set_addr $I10, rxcap_290_fail
    ($I12, $I11) = rx284_cur."!mark_peek"($I10)
    rx284_cur."!cursor_pos"($I11)
    ($P10) = rx284_cur."!cursor_start"()
    $P10."!cursor_pass"(rx284_pos, "")
    rx284_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_290_done
  rxcap_290_fail:
    goto rx284_fail
  rxcap_290_done:
  # rx literal  ">"
    add $I11, rx284_pos, 1
    gt $I11, rx284_eos, rx284_fail
    sub $I11, rx284_pos, rx284_off
    substr $S10, rx284_tgt, $I11, 1
    ne $S10, ">", rx284_fail
    add rx284_pos, 1
    goto alt287_end
  alt287_1:
.annotate "line", 103
  # rx literal  "$"
    add $I11, rx284_pos, 1
    gt $I11, rx284_eos, rx284_fail
    sub $I11, rx284_pos, rx284_off
    substr $S10, rx284_tgt, $I11, 1
    ne $S10, "$", rx284_fail
    add rx284_pos, 1
  # rx subcapture "pos"
    set_addr $I10, rxcap_291_fail
    rx284_cur."!mark_push"(0, rx284_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx284_pos, rx284_off
    find_not_cclass $I11, 8, rx284_tgt, $I10, rx284_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx284_fail
    add rx284_pos, rx284_off, $I11
    set_addr $I10, rxcap_291_fail
    ($I12, $I11) = rx284_cur."!mark_peek"($I10)
    rx284_cur."!cursor_pos"($I11)
    ($P10) = rx284_cur."!cursor_start"()
    $P10."!cursor_pass"(rx284_pos, "")
    rx284_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pos")
    goto rxcap_291_done
  rxcap_291_fail:
    goto rx284_fail
  rxcap_291_done:
  alt287_end:
.annotate "line", 106
  # rx rxquantr292 ** 0..1
    set_addr $I293, rxquantr292_done
    rx284_cur."!mark_push"(0, rx284_pos, $I293)
  rxquantr292_loop:
  # rx subrule "ws" subtype=method negate=
    rx284_cur."!cursor_pos"(rx284_pos)
    $P10 = rx284_cur."ws"()
    unless $P10, rx284_fail
    rx284_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx284_pos, 1
    gt $I11, rx284_eos, rx284_fail
    sub $I11, rx284_pos, rx284_off
    substr $S10, rx284_tgt, $I11, 1
    ne $S10, "=", rx284_fail
    add rx284_pos, 1
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
    $P10."!cursor_names"("quantified_atom")
    rx284_pos = $P10."pos"()
    (rx284_rep) = rx284_cur."!mark_commit"($I293)
  rxquantr292_done:
.annotate "line", 100
  # rx pass
    rx284_cur."!cursor_pass"(rx284_pos, "metachar:sym<var>")
    rx284_cur."!cursor_debug"("PASS  ", "metachar:sym<var>", " at pos=", rx284_pos)
    .return (rx284_cur)
  rx284_fail:
.annotate "line", 3
    (rx284_rep, rx284_pos, $I10, $P10) = rx284_cur."!mark_fail"(0)
    lt rx284_pos, -1, rx284_done
    eq rx284_pos, -1, rx284_fail
    jump $I10
  rx284_done:
    rx284_cur."!cursor_fail"()
    rx284_cur."!cursor_debug"("FAIL  ", "metachar:sym<var>")
    .return (rx284_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<var>"  :subid("88_1258208089.76063") :method
.annotate "line", 3
    new $P286, "ResizablePMCArray"
    push $P286, "$"
    push $P286, "$<"
    .return ($P286)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<PIR>"  :subid("89_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx295_tgt
    .local int rx295_pos
    .local int rx295_off
    .local int rx295_eos
    .local int rx295_rep
    .local pmc rx295_cur
    (rx295_cur, rx295_pos, rx295_tgt, $I10) = self."!cursor_start"()
    rx295_cur."!cursor_debug"("START ", "metachar:sym<PIR>")
    .lex unicode:"$\x{a2}", rx295_cur
    .local pmc match
    .lex "$/", match
    length rx295_eos, rx295_tgt
    set rx295_off, 0
    lt $I10, 2, rx295_start
    sub rx295_off, $I10, 1
    substr rx295_tgt, rx295_tgt, rx295_off
  rx295_start:
.annotate "line", 110
  # rx literal  ":PIR{{"
    add $I11, rx295_pos, 6
    gt $I11, rx295_eos, rx295_fail
    sub $I11, rx295_pos, rx295_off
    substr $S10, rx295_tgt, $I11, 6
    ne $S10, ":PIR{{", rx295_fail
    add rx295_pos, 6
  # rx subcapture "pir"
    set_addr $I10, rxcap_300_fail
    rx295_cur."!mark_push"(0, rx295_pos, $I10)
  # rx rxquantf298 ** 0..*
    set_addr $I10, rxquantf298_loop
    rx295_cur."!mark_push"(0, rx295_pos, $I10)
    goto rxquantf298_done
  rxquantf298_loop:
  # rx charclass .
    ge rx295_pos, rx295_eos, rx295_fail
    inc rx295_pos
    set_addr $I10, rxquantf298_loop
    rx295_cur."!mark_push"($I299, rx295_pos, $I10)
  rxquantf298_done:
    set_addr $I10, rxcap_300_fail
    ($I12, $I11) = rx295_cur."!mark_peek"($I10)
    rx295_cur."!cursor_pos"($I11)
    ($P10) = rx295_cur."!cursor_start"()
    $P10."!cursor_pass"(rx295_pos, "")
    rx295_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pir")
    goto rxcap_300_done
  rxcap_300_fail:
    goto rx295_fail
  rxcap_300_done:
  # rx literal  "}}"
    add $I11, rx295_pos, 2
    gt $I11, rx295_eos, rx295_fail
    sub $I11, rx295_pos, rx295_off
    substr $S10, rx295_tgt, $I11, 2
    ne $S10, "}}", rx295_fail
    add rx295_pos, 2
.annotate "line", 109
  # rx pass
    rx295_cur."!cursor_pass"(rx295_pos, "metachar:sym<PIR>")
    rx295_cur."!cursor_debug"("PASS  ", "metachar:sym<PIR>", " at pos=", rx295_pos)
    .return (rx295_cur)
  rx295_fail:
.annotate "line", 3
    (rx295_rep, rx295_pos, $I10, $P10) = rx295_cur."!mark_fail"(0)
    lt rx295_pos, -1, rx295_done
    eq rx295_pos, -1, rx295_fail
    jump $I10
  rx295_done:
    rx295_cur."!cursor_fail"()
    rx295_cur."!cursor_debug"("FAIL  ", "metachar:sym<PIR>")
    .return (rx295_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<PIR>"  :subid("90_1258208089.76063") :method
.annotate "line", 3
    new $P297, "ResizablePMCArray"
    push $P297, ":PIR{{"
    .return ($P297)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash"  :subid("91_1258208089.76063") :method
.annotate "line", 113
    $P302 = self."!protoregex"("backslash")
    .return ($P302)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash"  :subid("92_1258208089.76063") :method
.annotate "line", 113
    $P304 = self."!PREFIX__!protoregex"("backslash")
    .return ($P304)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<w>"  :subid("93_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx306_tgt
    .local int rx306_pos
    .local int rx306_off
    .local int rx306_eos
    .local int rx306_rep
    .local pmc rx306_cur
    (rx306_cur, rx306_pos, rx306_tgt, $I10) = self."!cursor_start"()
    rx306_cur."!cursor_debug"("START ", "backslash:sym<w>")
    .lex unicode:"$\x{a2}", rx306_cur
    .local pmc match
    .lex "$/", match
    length rx306_eos, rx306_tgt
    set rx306_off, 0
    lt $I10, 2, rx306_start
    sub rx306_off, $I10, 1
    substr rx306_tgt, rx306_tgt, rx306_off
  rx306_start:
.annotate "line", 114
  # rx subcapture "sym"
    set_addr $I10, rxcap_309_fail
    rx306_cur."!mark_push"(0, rx306_pos, $I10)
  # rx enumcharlist negate=0
    ge rx306_pos, rx306_eos, rx306_fail
    sub $I10, rx306_pos, rx306_off
    substr $S10, rx306_tgt, $I10, 1
    index $I11, "dswnDSWN", $S10
    lt $I11, 0, rx306_fail
    inc rx306_pos
    set_addr $I10, rxcap_309_fail
    ($I12, $I11) = rx306_cur."!mark_peek"($I10)
    rx306_cur."!cursor_pos"($I11)
    ($P10) = rx306_cur."!cursor_start"()
    $P10."!cursor_pass"(rx306_pos, "")
    rx306_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_309_done
  rxcap_309_fail:
    goto rx306_fail
  rxcap_309_done:
  # rx pass
    rx306_cur."!cursor_pass"(rx306_pos, "backslash:sym<w>")
    rx306_cur."!cursor_debug"("PASS  ", "backslash:sym<w>", " at pos=", rx306_pos)
    .return (rx306_cur)
  rx306_fail:
.annotate "line", 3
    (rx306_rep, rx306_pos, $I10, $P10) = rx306_cur."!mark_fail"(0)
    lt rx306_pos, -1, rx306_done
    eq rx306_pos, -1, rx306_fail
    jump $I10
  rx306_done:
    rx306_cur."!cursor_fail"()
    rx306_cur."!cursor_debug"("FAIL  ", "backslash:sym<w>")
    .return (rx306_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<w>"  :subid("94_1258208089.76063") :method
.annotate "line", 3
    new $P308, "ResizablePMCArray"
    push $P308, "N"
    push $P308, "W"
    push $P308, "S"
    push $P308, "D"
    push $P308, "n"
    push $P308, "w"
    push $P308, "s"
    push $P308, "d"
    .return ($P308)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<b>"  :subid("95_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx311_tgt
    .local int rx311_pos
    .local int rx311_off
    .local int rx311_eos
    .local int rx311_rep
    .local pmc rx311_cur
    (rx311_cur, rx311_pos, rx311_tgt, $I10) = self."!cursor_start"()
    rx311_cur."!cursor_debug"("START ", "backslash:sym<b>")
    .lex unicode:"$\x{a2}", rx311_cur
    .local pmc match
    .lex "$/", match
    length rx311_eos, rx311_tgt
    set rx311_off, 0
    lt $I10, 2, rx311_start
    sub rx311_off, $I10, 1
    substr rx311_tgt, rx311_tgt, rx311_off
  rx311_start:
.annotate "line", 115
  # rx subcapture "sym"
    set_addr $I10, rxcap_314_fail
    rx311_cur."!mark_push"(0, rx311_pos, $I10)
  # rx enumcharlist negate=0
    ge rx311_pos, rx311_eos, rx311_fail
    sub $I10, rx311_pos, rx311_off
    substr $S10, rx311_tgt, $I10, 1
    index $I11, "bB", $S10
    lt $I11, 0, rx311_fail
    inc rx311_pos
    set_addr $I10, rxcap_314_fail
    ($I12, $I11) = rx311_cur."!mark_peek"($I10)
    rx311_cur."!cursor_pos"($I11)
    ($P10) = rx311_cur."!cursor_start"()
    $P10."!cursor_pass"(rx311_pos, "")
    rx311_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_314_done
  rxcap_314_fail:
    goto rx311_fail
  rxcap_314_done:
  # rx pass
    rx311_cur."!cursor_pass"(rx311_pos, "backslash:sym<b>")
    rx311_cur."!cursor_debug"("PASS  ", "backslash:sym<b>", " at pos=", rx311_pos)
    .return (rx311_cur)
  rx311_fail:
.annotate "line", 3
    (rx311_rep, rx311_pos, $I10, $P10) = rx311_cur."!mark_fail"(0)
    lt rx311_pos, -1, rx311_done
    eq rx311_pos, -1, rx311_fail
    jump $I10
  rx311_done:
    rx311_cur."!cursor_fail"()
    rx311_cur."!cursor_debug"("FAIL  ", "backslash:sym<b>")
    .return (rx311_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<b>"  :subid("96_1258208089.76063") :method
.annotate "line", 3
    new $P313, "ResizablePMCArray"
    push $P313, "B"
    push $P313, "b"
    .return ($P313)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<e>"  :subid("97_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx316_tgt
    .local int rx316_pos
    .local int rx316_off
    .local int rx316_eos
    .local int rx316_rep
    .local pmc rx316_cur
    (rx316_cur, rx316_pos, rx316_tgt, $I10) = self."!cursor_start"()
    rx316_cur."!cursor_debug"("START ", "backslash:sym<e>")
    .lex unicode:"$\x{a2}", rx316_cur
    .local pmc match
    .lex "$/", match
    length rx316_eos, rx316_tgt
    set rx316_off, 0
    lt $I10, 2, rx316_start
    sub rx316_off, $I10, 1
    substr rx316_tgt, rx316_tgt, rx316_off
  rx316_start:
.annotate "line", 116
  # rx subcapture "sym"
    set_addr $I10, rxcap_319_fail
    rx316_cur."!mark_push"(0, rx316_pos, $I10)
  # rx enumcharlist negate=0
    ge rx316_pos, rx316_eos, rx316_fail
    sub $I10, rx316_pos, rx316_off
    substr $S10, rx316_tgt, $I10, 1
    index $I11, "eE", $S10
    lt $I11, 0, rx316_fail
    inc rx316_pos
    set_addr $I10, rxcap_319_fail
    ($I12, $I11) = rx316_cur."!mark_peek"($I10)
    rx316_cur."!cursor_pos"($I11)
    ($P10) = rx316_cur."!cursor_start"()
    $P10."!cursor_pass"(rx316_pos, "")
    rx316_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_319_done
  rxcap_319_fail:
    goto rx316_fail
  rxcap_319_done:
  # rx pass
    rx316_cur."!cursor_pass"(rx316_pos, "backslash:sym<e>")
    rx316_cur."!cursor_debug"("PASS  ", "backslash:sym<e>", " at pos=", rx316_pos)
    .return (rx316_cur)
  rx316_fail:
.annotate "line", 3
    (rx316_rep, rx316_pos, $I10, $P10) = rx316_cur."!mark_fail"(0)
    lt rx316_pos, -1, rx316_done
    eq rx316_pos, -1, rx316_fail
    jump $I10
  rx316_done:
    rx316_cur."!cursor_fail"()
    rx316_cur."!cursor_debug"("FAIL  ", "backslash:sym<e>")
    .return (rx316_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<e>"  :subid("98_1258208089.76063") :method
.annotate "line", 3
    new $P318, "ResizablePMCArray"
    push $P318, "E"
    push $P318, "e"
    .return ($P318)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<f>"  :subid("99_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx321_tgt
    .local int rx321_pos
    .local int rx321_off
    .local int rx321_eos
    .local int rx321_rep
    .local pmc rx321_cur
    (rx321_cur, rx321_pos, rx321_tgt, $I10) = self."!cursor_start"()
    rx321_cur."!cursor_debug"("START ", "backslash:sym<f>")
    .lex unicode:"$\x{a2}", rx321_cur
    .local pmc match
    .lex "$/", match
    length rx321_eos, rx321_tgt
    set rx321_off, 0
    lt $I10, 2, rx321_start
    sub rx321_off, $I10, 1
    substr rx321_tgt, rx321_tgt, rx321_off
  rx321_start:
.annotate "line", 117
  # rx subcapture "sym"
    set_addr $I10, rxcap_324_fail
    rx321_cur."!mark_push"(0, rx321_pos, $I10)
  # rx enumcharlist negate=0
    ge rx321_pos, rx321_eos, rx321_fail
    sub $I10, rx321_pos, rx321_off
    substr $S10, rx321_tgt, $I10, 1
    index $I11, "fF", $S10
    lt $I11, 0, rx321_fail
    inc rx321_pos
    set_addr $I10, rxcap_324_fail
    ($I12, $I11) = rx321_cur."!mark_peek"($I10)
    rx321_cur."!cursor_pos"($I11)
    ($P10) = rx321_cur."!cursor_start"()
    $P10."!cursor_pass"(rx321_pos, "")
    rx321_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_324_done
  rxcap_324_fail:
    goto rx321_fail
  rxcap_324_done:
  # rx pass
    rx321_cur."!cursor_pass"(rx321_pos, "backslash:sym<f>")
    rx321_cur."!cursor_debug"("PASS  ", "backslash:sym<f>", " at pos=", rx321_pos)
    .return (rx321_cur)
  rx321_fail:
.annotate "line", 3
    (rx321_rep, rx321_pos, $I10, $P10) = rx321_cur."!mark_fail"(0)
    lt rx321_pos, -1, rx321_done
    eq rx321_pos, -1, rx321_fail
    jump $I10
  rx321_done:
    rx321_cur."!cursor_fail"()
    rx321_cur."!cursor_debug"("FAIL  ", "backslash:sym<f>")
    .return (rx321_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<f>"  :subid("100_1258208089.76063") :method
.annotate "line", 3
    new $P323, "ResizablePMCArray"
    push $P323, "F"
    push $P323, "f"
    .return ($P323)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<h>"  :subid("101_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx326_tgt
    .local int rx326_pos
    .local int rx326_off
    .local int rx326_eos
    .local int rx326_rep
    .local pmc rx326_cur
    (rx326_cur, rx326_pos, rx326_tgt, $I10) = self."!cursor_start"()
    rx326_cur."!cursor_debug"("START ", "backslash:sym<h>")
    .lex unicode:"$\x{a2}", rx326_cur
    .local pmc match
    .lex "$/", match
    length rx326_eos, rx326_tgt
    set rx326_off, 0
    lt $I10, 2, rx326_start
    sub rx326_off, $I10, 1
    substr rx326_tgt, rx326_tgt, rx326_off
  rx326_start:
.annotate "line", 118
  # rx subcapture "sym"
    set_addr $I10, rxcap_329_fail
    rx326_cur."!mark_push"(0, rx326_pos, $I10)
  # rx enumcharlist negate=0
    ge rx326_pos, rx326_eos, rx326_fail
    sub $I10, rx326_pos, rx326_off
    substr $S10, rx326_tgt, $I10, 1
    index $I11, "hH", $S10
    lt $I11, 0, rx326_fail
    inc rx326_pos
    set_addr $I10, rxcap_329_fail
    ($I12, $I11) = rx326_cur."!mark_peek"($I10)
    rx326_cur."!cursor_pos"($I11)
    ($P10) = rx326_cur."!cursor_start"()
    $P10."!cursor_pass"(rx326_pos, "")
    rx326_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_329_done
  rxcap_329_fail:
    goto rx326_fail
  rxcap_329_done:
  # rx pass
    rx326_cur."!cursor_pass"(rx326_pos, "backslash:sym<h>")
    rx326_cur."!cursor_debug"("PASS  ", "backslash:sym<h>", " at pos=", rx326_pos)
    .return (rx326_cur)
  rx326_fail:
.annotate "line", 3
    (rx326_rep, rx326_pos, $I10, $P10) = rx326_cur."!mark_fail"(0)
    lt rx326_pos, -1, rx326_done
    eq rx326_pos, -1, rx326_fail
    jump $I10
  rx326_done:
    rx326_cur."!cursor_fail"()
    rx326_cur."!cursor_debug"("FAIL  ", "backslash:sym<h>")
    .return (rx326_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<h>"  :subid("102_1258208089.76063") :method
.annotate "line", 3
    new $P328, "ResizablePMCArray"
    push $P328, "H"
    push $P328, "h"
    .return ($P328)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<r>"  :subid("103_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx331_tgt
    .local int rx331_pos
    .local int rx331_off
    .local int rx331_eos
    .local int rx331_rep
    .local pmc rx331_cur
    (rx331_cur, rx331_pos, rx331_tgt, $I10) = self."!cursor_start"()
    rx331_cur."!cursor_debug"("START ", "backslash:sym<r>")
    .lex unicode:"$\x{a2}", rx331_cur
    .local pmc match
    .lex "$/", match
    length rx331_eos, rx331_tgt
    set rx331_off, 0
    lt $I10, 2, rx331_start
    sub rx331_off, $I10, 1
    substr rx331_tgt, rx331_tgt, rx331_off
  rx331_start:
.annotate "line", 119
  # rx subcapture "sym"
    set_addr $I10, rxcap_334_fail
    rx331_cur."!mark_push"(0, rx331_pos, $I10)
  # rx enumcharlist negate=0
    ge rx331_pos, rx331_eos, rx331_fail
    sub $I10, rx331_pos, rx331_off
    substr $S10, rx331_tgt, $I10, 1
    index $I11, "rR", $S10
    lt $I11, 0, rx331_fail
    inc rx331_pos
    set_addr $I10, rxcap_334_fail
    ($I12, $I11) = rx331_cur."!mark_peek"($I10)
    rx331_cur."!cursor_pos"($I11)
    ($P10) = rx331_cur."!cursor_start"()
    $P10."!cursor_pass"(rx331_pos, "")
    rx331_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_334_done
  rxcap_334_fail:
    goto rx331_fail
  rxcap_334_done:
  # rx pass
    rx331_cur."!cursor_pass"(rx331_pos, "backslash:sym<r>")
    rx331_cur."!cursor_debug"("PASS  ", "backslash:sym<r>", " at pos=", rx331_pos)
    .return (rx331_cur)
  rx331_fail:
.annotate "line", 3
    (rx331_rep, rx331_pos, $I10, $P10) = rx331_cur."!mark_fail"(0)
    lt rx331_pos, -1, rx331_done
    eq rx331_pos, -1, rx331_fail
    jump $I10
  rx331_done:
    rx331_cur."!cursor_fail"()
    rx331_cur."!cursor_debug"("FAIL  ", "backslash:sym<r>")
    .return (rx331_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<r>"  :subid("104_1258208089.76063") :method
.annotate "line", 3
    new $P333, "ResizablePMCArray"
    push $P333, "R"
    push $P333, "r"
    .return ($P333)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<t>"  :subid("105_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx336_tgt
    .local int rx336_pos
    .local int rx336_off
    .local int rx336_eos
    .local int rx336_rep
    .local pmc rx336_cur
    (rx336_cur, rx336_pos, rx336_tgt, $I10) = self."!cursor_start"()
    rx336_cur."!cursor_debug"("START ", "backslash:sym<t>")
    .lex unicode:"$\x{a2}", rx336_cur
    .local pmc match
    .lex "$/", match
    length rx336_eos, rx336_tgt
    set rx336_off, 0
    lt $I10, 2, rx336_start
    sub rx336_off, $I10, 1
    substr rx336_tgt, rx336_tgt, rx336_off
  rx336_start:
.annotate "line", 120
  # rx subcapture "sym"
    set_addr $I10, rxcap_339_fail
    rx336_cur."!mark_push"(0, rx336_pos, $I10)
  # rx enumcharlist negate=0
    ge rx336_pos, rx336_eos, rx336_fail
    sub $I10, rx336_pos, rx336_off
    substr $S10, rx336_tgt, $I10, 1
    index $I11, "tT", $S10
    lt $I11, 0, rx336_fail
    inc rx336_pos
    set_addr $I10, rxcap_339_fail
    ($I12, $I11) = rx336_cur."!mark_peek"($I10)
    rx336_cur."!cursor_pos"($I11)
    ($P10) = rx336_cur."!cursor_start"()
    $P10."!cursor_pass"(rx336_pos, "")
    rx336_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_339_done
  rxcap_339_fail:
    goto rx336_fail
  rxcap_339_done:
  # rx pass
    rx336_cur."!cursor_pass"(rx336_pos, "backslash:sym<t>")
    rx336_cur."!cursor_debug"("PASS  ", "backslash:sym<t>", " at pos=", rx336_pos)
    .return (rx336_cur)
  rx336_fail:
.annotate "line", 3
    (rx336_rep, rx336_pos, $I10, $P10) = rx336_cur."!mark_fail"(0)
    lt rx336_pos, -1, rx336_done
    eq rx336_pos, -1, rx336_fail
    jump $I10
  rx336_done:
    rx336_cur."!cursor_fail"()
    rx336_cur."!cursor_debug"("FAIL  ", "backslash:sym<t>")
    .return (rx336_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<t>"  :subid("106_1258208089.76063") :method
.annotate "line", 3
    new $P338, "ResizablePMCArray"
    push $P338, "T"
    push $P338, "t"
    .return ($P338)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<v>"  :subid("107_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx341_tgt
    .local int rx341_pos
    .local int rx341_off
    .local int rx341_eos
    .local int rx341_rep
    .local pmc rx341_cur
    (rx341_cur, rx341_pos, rx341_tgt, $I10) = self."!cursor_start"()
    rx341_cur."!cursor_debug"("START ", "backslash:sym<v>")
    .lex unicode:"$\x{a2}", rx341_cur
    .local pmc match
    .lex "$/", match
    length rx341_eos, rx341_tgt
    set rx341_off, 0
    lt $I10, 2, rx341_start
    sub rx341_off, $I10, 1
    substr rx341_tgt, rx341_tgt, rx341_off
  rx341_start:
.annotate "line", 121
  # rx subcapture "sym"
    set_addr $I10, rxcap_344_fail
    rx341_cur."!mark_push"(0, rx341_pos, $I10)
  # rx enumcharlist negate=0
    ge rx341_pos, rx341_eos, rx341_fail
    sub $I10, rx341_pos, rx341_off
    substr $S10, rx341_tgt, $I10, 1
    index $I11, "vV", $S10
    lt $I11, 0, rx341_fail
    inc rx341_pos
    set_addr $I10, rxcap_344_fail
    ($I12, $I11) = rx341_cur."!mark_peek"($I10)
    rx341_cur."!cursor_pos"($I11)
    ($P10) = rx341_cur."!cursor_start"()
    $P10."!cursor_pass"(rx341_pos, "")
    rx341_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_344_done
  rxcap_344_fail:
    goto rx341_fail
  rxcap_344_done:
  # rx pass
    rx341_cur."!cursor_pass"(rx341_pos, "backslash:sym<v>")
    rx341_cur."!cursor_debug"("PASS  ", "backslash:sym<v>", " at pos=", rx341_pos)
    .return (rx341_cur)
  rx341_fail:
.annotate "line", 3
    (rx341_rep, rx341_pos, $I10, $P10) = rx341_cur."!mark_fail"(0)
    lt rx341_pos, -1, rx341_done
    eq rx341_pos, -1, rx341_fail
    jump $I10
  rx341_done:
    rx341_cur."!cursor_fail"()
    rx341_cur."!cursor_debug"("FAIL  ", "backslash:sym<v>")
    .return (rx341_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<v>"  :subid("108_1258208089.76063") :method
.annotate "line", 3
    new $P343, "ResizablePMCArray"
    push $P343, "V"
    push $P343, "v"
    .return ($P343)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<c>"  :subid("109_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx346_tgt
    .local int rx346_pos
    .local int rx346_off
    .local int rx346_eos
    .local int rx346_rep
    .local pmc rx346_cur
    (rx346_cur, rx346_pos, rx346_tgt, $I10) = self."!cursor_start"()
    rx346_cur."!cursor_debug"("START ", "backslash:sym<c>")
    .lex unicode:"$\x{a2}", rx346_cur
    .local pmc match
    .lex "$/", match
    length rx346_eos, rx346_tgt
    set rx346_off, 0
    lt $I10, 2, rx346_start
    sub rx346_off, $I10, 1
    substr rx346_tgt, rx346_tgt, rx346_off
  rx346_start:
.annotate "line", 122
  # rx subcapture "sym"
    set_addr $I10, rxcap_351_fail
    rx346_cur."!mark_push"(0, rx346_pos, $I10)
  # rx enumcharlist negate=0
    ge rx346_pos, rx346_eos, rx346_fail
    sub $I10, rx346_pos, rx346_off
    substr $S10, rx346_tgt, $I10, 1
    index $I11, "cC", $S10
    lt $I11, 0, rx346_fail
    inc rx346_pos
    set_addr $I10, rxcap_351_fail
    ($I12, $I11) = rx346_cur."!mark_peek"($I10)
    rx346_cur."!cursor_pos"($I11)
    ($P10) = rx346_cur."!cursor_start"()
    $P10."!cursor_pass"(rx346_pos, "")
    rx346_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_351_done
  rxcap_351_fail:
    goto rx346_fail
  rxcap_351_done:
  # rx subrule "charspec" subtype=capture negate=
    rx346_cur."!cursor_pos"(rx346_pos)
    $P10 = rx346_cur."charspec"()
    unless $P10, rx346_fail
    rx346_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charspec")
    rx346_pos = $P10."pos"()
  # rx pass
    rx346_cur."!cursor_pass"(rx346_pos, "backslash:sym<c>")
    rx346_cur."!cursor_debug"("PASS  ", "backslash:sym<c>", " at pos=", rx346_pos)
    .return (rx346_cur)
  rx346_fail:
.annotate "line", 3
    (rx346_rep, rx346_pos, $I10, $P10) = rx346_cur."!mark_fail"(0)
    lt rx346_pos, -1, rx346_done
    eq rx346_pos, -1, rx346_fail
    jump $I10
  rx346_done:
    rx346_cur."!cursor_fail"()
    rx346_cur."!cursor_debug"("FAIL  ", "backslash:sym<c>")
    .return (rx346_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<c>"  :subid("110_1258208089.76063") :method
.annotate "line", 3
    $P348 = self."!PREFIX__!subrule"("charspec", "C")
    $P349 = self."!PREFIX__!subrule"("charspec", "c")
    new $P350, "ResizablePMCArray"
    push $P350, $P348
    push $P350, $P349
    .return ($P350)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<o>"  :subid("111_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx353_tgt
    .local int rx353_pos
    .local int rx353_off
    .local int rx353_eos
    .local int rx353_rep
    .local pmc rx353_cur
    (rx353_cur, rx353_pos, rx353_tgt, $I10) = self."!cursor_start"()
    rx353_cur."!cursor_debug"("START ", "backslash:sym<o>")
    .lex unicode:"$\x{a2}", rx353_cur
    .local pmc match
    .lex "$/", match
    length rx353_eos, rx353_tgt
    set rx353_off, 0
    lt $I10, 2, rx353_start
    sub rx353_off, $I10, 1
    substr rx353_tgt, rx353_tgt, rx353_off
  rx353_start:
.annotate "line", 123
  # rx subcapture "sym"
    set_addr $I10, rxcap_360_fail
    rx353_cur."!mark_push"(0, rx353_pos, $I10)
  # rx enumcharlist negate=0
    ge rx353_pos, rx353_eos, rx353_fail
    sub $I10, rx353_pos, rx353_off
    substr $S10, rx353_tgt, $I10, 1
    index $I11, "oO", $S10
    lt $I11, 0, rx353_fail
    inc rx353_pos
    set_addr $I10, rxcap_360_fail
    ($I12, $I11) = rx353_cur."!mark_peek"($I10)
    rx353_cur."!cursor_pos"($I11)
    ($P10) = rx353_cur."!cursor_start"()
    $P10."!cursor_pass"(rx353_pos, "")
    rx353_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_360_done
  rxcap_360_fail:
    goto rx353_fail
  rxcap_360_done:
  alt361_0:
    set_addr $I10, alt361_1
    rx353_cur."!mark_push"(0, rx353_pos, $I10)
  # rx subrule "octint" subtype=capture negate=
    rx353_cur."!cursor_pos"(rx353_pos)
    $P10 = rx353_cur."octint"()
    unless $P10, rx353_fail
    rx353_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octint")
    rx353_pos = $P10."pos"()
    goto alt361_end
  alt361_1:
  # rx literal  "["
    add $I11, rx353_pos, 1
    gt $I11, rx353_eos, rx353_fail
    sub $I11, rx353_pos, rx353_off
    substr $S10, rx353_tgt, $I11, 1
    ne $S10, "[", rx353_fail
    add rx353_pos, 1
  # rx subrule "octints" subtype=capture negate=
    rx353_cur."!cursor_pos"(rx353_pos)
    $P10 = rx353_cur."octints"()
    unless $P10, rx353_fail
    rx353_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octints")
    rx353_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx353_pos, 1
    gt $I11, rx353_eos, rx353_fail
    sub $I11, rx353_pos, rx353_off
    substr $S10, rx353_tgt, $I11, 1
    ne $S10, "]", rx353_fail
    add rx353_pos, 1
  alt361_end:
  # rx pass
    rx353_cur."!cursor_pass"(rx353_pos, "backslash:sym<o>")
    rx353_cur."!cursor_debug"("PASS  ", "backslash:sym<o>", " at pos=", rx353_pos)
    .return (rx353_cur)
  rx353_fail:
.annotate "line", 3
    (rx353_rep, rx353_pos, $I10, $P10) = rx353_cur."!mark_fail"(0)
    lt rx353_pos, -1, rx353_done
    eq rx353_pos, -1, rx353_fail
    jump $I10
  rx353_done:
    rx353_cur."!cursor_fail"()
    rx353_cur."!cursor_debug"("FAIL  ", "backslash:sym<o>")
    .return (rx353_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<o>"  :subid("112_1258208089.76063") :method
.annotate "line", 3
    $P355 = self."!PREFIX__!subrule"("octints", "O[")
    $P356 = self."!PREFIX__!subrule"("octint", "O")
    $P357 = self."!PREFIX__!subrule"("octints", "o[")
    $P358 = self."!PREFIX__!subrule"("octint", "o")
    new $P359, "ResizablePMCArray"
    push $P359, $P355
    push $P359, $P356
    push $P359, $P357
    push $P359, $P358
    .return ($P359)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<x>"  :subid("113_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx363_tgt
    .local int rx363_pos
    .local int rx363_off
    .local int rx363_eos
    .local int rx363_rep
    .local pmc rx363_cur
    (rx363_cur, rx363_pos, rx363_tgt, $I10) = self."!cursor_start"()
    rx363_cur."!cursor_debug"("START ", "backslash:sym<x>")
    .lex unicode:"$\x{a2}", rx363_cur
    .local pmc match
    .lex "$/", match
    length rx363_eos, rx363_tgt
    set rx363_off, 0
    lt $I10, 2, rx363_start
    sub rx363_off, $I10, 1
    substr rx363_tgt, rx363_tgt, rx363_off
  rx363_start:
.annotate "line", 124
  # rx subcapture "sym"
    set_addr $I10, rxcap_370_fail
    rx363_cur."!mark_push"(0, rx363_pos, $I10)
  # rx enumcharlist negate=0
    ge rx363_pos, rx363_eos, rx363_fail
    sub $I10, rx363_pos, rx363_off
    substr $S10, rx363_tgt, $I10, 1
    index $I11, "xX", $S10
    lt $I11, 0, rx363_fail
    inc rx363_pos
    set_addr $I10, rxcap_370_fail
    ($I12, $I11) = rx363_cur."!mark_peek"($I10)
    rx363_cur."!cursor_pos"($I11)
    ($P10) = rx363_cur."!cursor_start"()
    $P10."!cursor_pass"(rx363_pos, "")
    rx363_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_370_done
  rxcap_370_fail:
    goto rx363_fail
  rxcap_370_done:
  alt371_0:
    set_addr $I10, alt371_1
    rx363_cur."!mark_push"(0, rx363_pos, $I10)
  # rx subrule "hexint" subtype=capture negate=
    rx363_cur."!cursor_pos"(rx363_pos)
    $P10 = rx363_cur."hexint"()
    unless $P10, rx363_fail
    rx363_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexint")
    rx363_pos = $P10."pos"()
    goto alt371_end
  alt371_1:
  # rx literal  "["
    add $I11, rx363_pos, 1
    gt $I11, rx363_eos, rx363_fail
    sub $I11, rx363_pos, rx363_off
    substr $S10, rx363_tgt, $I11, 1
    ne $S10, "[", rx363_fail
    add rx363_pos, 1
  # rx subrule "hexints" subtype=capture negate=
    rx363_cur."!cursor_pos"(rx363_pos)
    $P10 = rx363_cur."hexints"()
    unless $P10, rx363_fail
    rx363_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexints")
    rx363_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx363_pos, 1
    gt $I11, rx363_eos, rx363_fail
    sub $I11, rx363_pos, rx363_off
    substr $S10, rx363_tgt, $I11, 1
    ne $S10, "]", rx363_fail
    add rx363_pos, 1
  alt371_end:
  # rx pass
    rx363_cur."!cursor_pass"(rx363_pos, "backslash:sym<x>")
    rx363_cur."!cursor_debug"("PASS  ", "backslash:sym<x>", " at pos=", rx363_pos)
    .return (rx363_cur)
  rx363_fail:
.annotate "line", 3
    (rx363_rep, rx363_pos, $I10, $P10) = rx363_cur."!mark_fail"(0)
    lt rx363_pos, -1, rx363_done
    eq rx363_pos, -1, rx363_fail
    jump $I10
  rx363_done:
    rx363_cur."!cursor_fail"()
    rx363_cur."!cursor_debug"("FAIL  ", "backslash:sym<x>")
    .return (rx363_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<x>"  :subid("114_1258208089.76063") :method
.annotate "line", 3
    $P365 = self."!PREFIX__!subrule"("hexints", "X[")
    $P366 = self."!PREFIX__!subrule"("hexint", "X")
    $P367 = self."!PREFIX__!subrule"("hexints", "x[")
    $P368 = self."!PREFIX__!subrule"("hexint", "x")
    new $P369, "ResizablePMCArray"
    push $P369, $P365
    push $P369, $P366
    push $P369, $P367
    push $P369, $P368
    .return ($P369)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<A>"  :subid("115_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx373_tgt
    .local int rx373_pos
    .local int rx373_off
    .local int rx373_eos
    .local int rx373_rep
    .local pmc rx373_cur
    (rx373_cur, rx373_pos, rx373_tgt, $I10) = self."!cursor_start"()
    rx373_cur."!cursor_debug"("START ", "backslash:sym<A>")
    .lex unicode:"$\x{a2}", rx373_cur
    .local pmc match
    .lex "$/", match
    length rx373_eos, rx373_tgt
    set rx373_off, 0
    lt $I10, 2, rx373_start
    sub rx373_off, $I10, 1
    substr rx373_tgt, rx373_tgt, rx373_off
  rx373_start:
.annotate "line", 125
  # rx literal  "A"
    add $I11, rx373_pos, 1
    gt $I11, rx373_eos, rx373_fail
    sub $I11, rx373_pos, rx373_off
    substr $S10, rx373_tgt, $I11, 1
    ne $S10, "A", rx373_fail
    add rx373_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx373_cur."!cursor_pos"(rx373_pos)
    $P10 = rx373_cur."obs"("\\\\A as beginning-of-string matcher", "^")
    unless $P10, rx373_fail
    rx373_pos = $P10."pos"()
  # rx pass
    rx373_cur."!cursor_pass"(rx373_pos, "backslash:sym<A>")
    rx373_cur."!cursor_debug"("PASS  ", "backslash:sym<A>", " at pos=", rx373_pos)
    .return (rx373_cur)
  rx373_fail:
.annotate "line", 3
    (rx373_rep, rx373_pos, $I10, $P10) = rx373_cur."!mark_fail"(0)
    lt rx373_pos, -1, rx373_done
    eq rx373_pos, -1, rx373_fail
    jump $I10
  rx373_done:
    rx373_cur."!cursor_fail"()
    rx373_cur."!cursor_debug"("FAIL  ", "backslash:sym<A>")
    .return (rx373_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<A>"  :subid("116_1258208089.76063") :method
.annotate "line", 3
    $P375 = self."!PREFIX__!subrule"("", "A")
    new $P376, "ResizablePMCArray"
    push $P376, $P375
    .return ($P376)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<z>"  :subid("117_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx378_tgt
    .local int rx378_pos
    .local int rx378_off
    .local int rx378_eos
    .local int rx378_rep
    .local pmc rx378_cur
    (rx378_cur, rx378_pos, rx378_tgt, $I10) = self."!cursor_start"()
    rx378_cur."!cursor_debug"("START ", "backslash:sym<z>")
    .lex unicode:"$\x{a2}", rx378_cur
    .local pmc match
    .lex "$/", match
    length rx378_eos, rx378_tgt
    set rx378_off, 0
    lt $I10, 2, rx378_start
    sub rx378_off, $I10, 1
    substr rx378_tgt, rx378_tgt, rx378_off
  rx378_start:
.annotate "line", 126
  # rx literal  "z"
    add $I11, rx378_pos, 1
    gt $I11, rx378_eos, rx378_fail
    sub $I11, rx378_pos, rx378_off
    substr $S10, rx378_tgt, $I11, 1
    ne $S10, "z", rx378_fail
    add rx378_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx378_cur."!cursor_pos"(rx378_pos)
    $P10 = rx378_cur."obs"("\\\\z as end-of-string matcher", "$")
    unless $P10, rx378_fail
    rx378_pos = $P10."pos"()
  # rx pass
    rx378_cur."!cursor_pass"(rx378_pos, "backslash:sym<z>")
    rx378_cur."!cursor_debug"("PASS  ", "backslash:sym<z>", " at pos=", rx378_pos)
    .return (rx378_cur)
  rx378_fail:
.annotate "line", 3
    (rx378_rep, rx378_pos, $I10, $P10) = rx378_cur."!mark_fail"(0)
    lt rx378_pos, -1, rx378_done
    eq rx378_pos, -1, rx378_fail
    jump $I10
  rx378_done:
    rx378_cur."!cursor_fail"()
    rx378_cur."!cursor_debug"("FAIL  ", "backslash:sym<z>")
    .return (rx378_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<z>"  :subid("118_1258208089.76063") :method
.annotate "line", 3
    $P380 = self."!PREFIX__!subrule"("", "z")
    new $P381, "ResizablePMCArray"
    push $P381, $P380
    .return ($P381)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Z>"  :subid("119_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx383_tgt
    .local int rx383_pos
    .local int rx383_off
    .local int rx383_eos
    .local int rx383_rep
    .local pmc rx383_cur
    (rx383_cur, rx383_pos, rx383_tgt, $I10) = self."!cursor_start"()
    rx383_cur."!cursor_debug"("START ", "backslash:sym<Z>")
    .lex unicode:"$\x{a2}", rx383_cur
    .local pmc match
    .lex "$/", match
    length rx383_eos, rx383_tgt
    set rx383_off, 0
    lt $I10, 2, rx383_start
    sub rx383_off, $I10, 1
    substr rx383_tgt, rx383_tgt, rx383_off
  rx383_start:
.annotate "line", 127
  # rx literal  "Z"
    add $I11, rx383_pos, 1
    gt $I11, rx383_eos, rx383_fail
    sub $I11, rx383_pos, rx383_off
    substr $S10, rx383_tgt, $I11, 1
    ne $S10, "Z", rx383_fail
    add rx383_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx383_cur."!cursor_pos"(rx383_pos)
    $P10 = rx383_cur."obs"("\\\\Z as end-of-string matcher", "\\\\n?$")
    unless $P10, rx383_fail
    rx383_pos = $P10."pos"()
  # rx pass
    rx383_cur."!cursor_pass"(rx383_pos, "backslash:sym<Z>")
    rx383_cur."!cursor_debug"("PASS  ", "backslash:sym<Z>", " at pos=", rx383_pos)
    .return (rx383_cur)
  rx383_fail:
.annotate "line", 3
    (rx383_rep, rx383_pos, $I10, $P10) = rx383_cur."!mark_fail"(0)
    lt rx383_pos, -1, rx383_done
    eq rx383_pos, -1, rx383_fail
    jump $I10
  rx383_done:
    rx383_cur."!cursor_fail"()
    rx383_cur."!cursor_debug"("FAIL  ", "backslash:sym<Z>")
    .return (rx383_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<Z>"  :subid("120_1258208089.76063") :method
.annotate "line", 3
    $P385 = self."!PREFIX__!subrule"("", "Z")
    new $P386, "ResizablePMCArray"
    push $P386, $P385
    .return ($P386)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Q>"  :subid("121_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx388_tgt
    .local int rx388_pos
    .local int rx388_off
    .local int rx388_eos
    .local int rx388_rep
    .local pmc rx388_cur
    (rx388_cur, rx388_pos, rx388_tgt, $I10) = self."!cursor_start"()
    rx388_cur."!cursor_debug"("START ", "backslash:sym<Q>")
    .lex unicode:"$\x{a2}", rx388_cur
    .local pmc match
    .lex "$/", match
    length rx388_eos, rx388_tgt
    set rx388_off, 0
    lt $I10, 2, rx388_start
    sub rx388_off, $I10, 1
    substr rx388_tgt, rx388_tgt, rx388_off
  rx388_start:
.annotate "line", 128
  # rx literal  "Q"
    add $I11, rx388_pos, 1
    gt $I11, rx388_eos, rx388_fail
    sub $I11, rx388_pos, rx388_off
    substr $S10, rx388_tgt, $I11, 1
    ne $S10, "Q", rx388_fail
    add rx388_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx388_cur."!cursor_pos"(rx388_pos)
    $P10 = rx388_cur."obs"("\\\\Q as quotemeta", "quotes or literal variable match")
    unless $P10, rx388_fail
    rx388_pos = $P10."pos"()
  # rx pass
    rx388_cur."!cursor_pass"(rx388_pos, "backslash:sym<Q>")
    rx388_cur."!cursor_debug"("PASS  ", "backslash:sym<Q>", " at pos=", rx388_pos)
    .return (rx388_cur)
  rx388_fail:
.annotate "line", 3
    (rx388_rep, rx388_pos, $I10, $P10) = rx388_cur."!mark_fail"(0)
    lt rx388_pos, -1, rx388_done
    eq rx388_pos, -1, rx388_fail
    jump $I10
  rx388_done:
    rx388_cur."!cursor_fail"()
    rx388_cur."!cursor_debug"("FAIL  ", "backslash:sym<Q>")
    .return (rx388_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<Q>"  :subid("122_1258208089.76063") :method
.annotate "line", 3
    $P390 = self."!PREFIX__!subrule"("", "Q")
    new $P391, "ResizablePMCArray"
    push $P391, $P390
    .return ($P391)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<misc>"  :subid("123_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx393_tgt
    .local int rx393_pos
    .local int rx393_off
    .local int rx393_eos
    .local int rx393_rep
    .local pmc rx393_cur
    (rx393_cur, rx393_pos, rx393_tgt, $I10) = self."!cursor_start"()
    rx393_cur."!cursor_debug"("START ", "backslash:sym<misc>")
    .lex unicode:"$\x{a2}", rx393_cur
    .local pmc match
    .lex "$/", match
    length rx393_eos, rx393_tgt
    set rx393_off, 0
    lt $I10, 2, rx393_start
    sub rx393_off, $I10, 1
    substr rx393_tgt, rx393_tgt, rx393_off
  rx393_start:
.annotate "line", 129
  # rx charclass W
    ge rx393_pos, rx393_eos, rx393_fail
    sub $I10, rx393_pos, rx393_off
    is_cclass $I11, 8192, rx393_tgt, $I10
    if $I11, rx393_fail
    inc rx393_pos
  # rx pass
    rx393_cur."!cursor_pass"(rx393_pos, "backslash:sym<misc>")
    rx393_cur."!cursor_debug"("PASS  ", "backslash:sym<misc>", " at pos=", rx393_pos)
    .return (rx393_cur)
  rx393_fail:
.annotate "line", 3
    (rx393_rep, rx393_pos, $I10, $P10) = rx393_cur."!mark_fail"(0)
    lt rx393_pos, -1, rx393_done
    eq rx393_pos, -1, rx393_fail
    jump $I10
  rx393_done:
    rx393_cur."!cursor_fail"()
    rx393_cur."!cursor_debug"("FAIL  ", "backslash:sym<misc>")
    .return (rx393_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<misc>"  :subid("124_1258208089.76063") :method
.annotate "line", 3
    new $P395, "ResizablePMCArray"
    push $P395, ""
    .return ($P395)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion"  :subid("125_1258208089.76063") :method
.annotate "line", 131
    $P397 = self."!protoregex"("assertion")
    .return ($P397)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion"  :subid("126_1258208089.76063") :method
.annotate "line", 131
    $P399 = self."!PREFIX__!protoregex"("assertion")
    .return ($P399)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<?>"  :subid("127_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .const 'Sub' $P407 = "129_1258208089.76063"
    capture_lex $P407
    .local string rx401_tgt
    .local int rx401_pos
    .local int rx401_off
    .local int rx401_eos
    .local int rx401_rep
    .local pmc rx401_cur
    (rx401_cur, rx401_pos, rx401_tgt, $I10) = self."!cursor_start"()
    rx401_cur."!cursor_debug"("START ", "assertion:sym<?>")
    .lex unicode:"$\x{a2}", rx401_cur
    .local pmc match
    .lex "$/", match
    length rx401_eos, rx401_tgt
    set rx401_off, 0
    lt $I10, 2, rx401_start
    sub rx401_off, $I10, 1
    substr rx401_tgt, rx401_tgt, rx401_off
  rx401_start:
.annotate "line", 133
  # rx literal  "?"
    add $I11, rx401_pos, 1
    gt $I11, rx401_eos, rx401_fail
    sub $I11, rx401_pos, rx401_off
    substr $S10, rx401_tgt, $I11, 1
    ne $S10, "?", rx401_fail
    add rx401_pos, 1
  alt405_0:
    set_addr $I10, alt405_1
    rx401_cur."!mark_push"(0, rx401_pos, $I10)
  # rx subrule "before" subtype=zerowidth negate=
    rx401_cur."!cursor_pos"(rx401_pos)
    .const 'Sub' $P407 = "129_1258208089.76063"
    capture_lex $P407
    $P10 = rx401_cur."before"($P407)
    unless $P10, rx401_fail
    goto alt405_end
  alt405_1:
  # rx subrule "assertion" subtype=capture negate=
    rx401_cur."!cursor_pos"(rx401_pos)
    $P10 = rx401_cur."assertion"()
    unless $P10, rx401_fail
    rx401_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx401_pos = $P10."pos"()
  alt405_end:
  # rx pass
    rx401_cur."!cursor_pass"(rx401_pos, "assertion:sym<?>")
    rx401_cur."!cursor_debug"("PASS  ", "assertion:sym<?>", " at pos=", rx401_pos)
    .return (rx401_cur)
  rx401_fail:
.annotate "line", 3
    (rx401_rep, rx401_pos, $I10, $P10) = rx401_cur."!mark_fail"(0)
    lt rx401_pos, -1, rx401_done
    eq rx401_pos, -1, rx401_fail
    jump $I10
  rx401_done:
    rx401_cur."!cursor_fail"()
    rx401_cur."!cursor_debug"("FAIL  ", "assertion:sym<?>")
    .return (rx401_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<?>"  :subid("128_1258208089.76063") :method
.annotate "line", 3
    $P403 = self."!PREFIX__!subrule"("assertion", "?")
    new $P404, "ResizablePMCArray"
    push $P404, $P403
    push $P404, "?"
    .return ($P404)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block406"  :anon :subid("129_1258208089.76063") :method :outer("127_1258208089.76063")
.annotate "line", 133
    .local string rx408_tgt
    .local int rx408_pos
    .local int rx408_off
    .local int rx408_eos
    .local int rx408_rep
    .local pmc rx408_cur
    (rx408_cur, rx408_pos, rx408_tgt, $I10) = self."!cursor_start"()
    rx408_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx408_cur
    .local pmc match
    .lex "$/", match
    length rx408_eos, rx408_tgt
    set rx408_off, 0
    lt $I10, 2, rx408_start
    sub rx408_off, $I10, 1
    substr rx408_tgt, rx408_tgt, rx408_off
  rx408_start:
    ge rx408_pos, 0, rxscan409_done
  rxscan409_loop:
    ($P10) = rx408_cur."from"()
    inc $P10
    set rx408_pos, $P10
    ge rx408_pos, rx408_eos, rxscan409_done
    set_addr $I10, rxscan409_loop
    rx408_cur."!mark_push"(0, rx408_pos, $I10)
  rxscan409_done:
  # rx literal  ">"
    add $I11, rx408_pos, 1
    gt $I11, rx408_eos, rx408_fail
    sub $I11, rx408_pos, rx408_off
    substr $S10, rx408_tgt, $I11, 1
    ne $S10, ">", rx408_fail
    add rx408_pos, 1
  # rx pass
    rx408_cur."!cursor_pass"(rx408_pos, "")
    rx408_cur."!cursor_debug"("PASS  ", "", " at pos=", rx408_pos)
    .return (rx408_cur)
  rx408_fail:
    (rx408_rep, rx408_pos, $I10, $P10) = rx408_cur."!mark_fail"(0)
    lt rx408_pos, -1, rx408_done
    eq rx408_pos, -1, rx408_fail
    jump $I10
  rx408_done:
    rx408_cur."!cursor_fail"()
    rx408_cur."!cursor_debug"("FAIL  ", "")
    .return (rx408_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<!>"  :subid("130_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .const 'Sub' $P417 = "132_1258208089.76063"
    capture_lex $P417
    .local string rx411_tgt
    .local int rx411_pos
    .local int rx411_off
    .local int rx411_eos
    .local int rx411_rep
    .local pmc rx411_cur
    (rx411_cur, rx411_pos, rx411_tgt, $I10) = self."!cursor_start"()
    rx411_cur."!cursor_debug"("START ", "assertion:sym<!>")
    .lex unicode:"$\x{a2}", rx411_cur
    .local pmc match
    .lex "$/", match
    length rx411_eos, rx411_tgt
    set rx411_off, 0
    lt $I10, 2, rx411_start
    sub rx411_off, $I10, 1
    substr rx411_tgt, rx411_tgt, rx411_off
  rx411_start:
.annotate "line", 134
  # rx literal  "!"
    add $I11, rx411_pos, 1
    gt $I11, rx411_eos, rx411_fail
    sub $I11, rx411_pos, rx411_off
    substr $S10, rx411_tgt, $I11, 1
    ne $S10, "!", rx411_fail
    add rx411_pos, 1
  alt415_0:
    set_addr $I10, alt415_1
    rx411_cur."!mark_push"(0, rx411_pos, $I10)
  # rx subrule "before" subtype=zerowidth negate=
    rx411_cur."!cursor_pos"(rx411_pos)
    .const 'Sub' $P417 = "132_1258208089.76063"
    capture_lex $P417
    $P10 = rx411_cur."before"($P417)
    unless $P10, rx411_fail
    goto alt415_end
  alt415_1:
  # rx subrule "assertion" subtype=capture negate=
    rx411_cur."!cursor_pos"(rx411_pos)
    $P10 = rx411_cur."assertion"()
    unless $P10, rx411_fail
    rx411_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx411_pos = $P10."pos"()
  alt415_end:
  # rx pass
    rx411_cur."!cursor_pass"(rx411_pos, "assertion:sym<!>")
    rx411_cur."!cursor_debug"("PASS  ", "assertion:sym<!>", " at pos=", rx411_pos)
    .return (rx411_cur)
  rx411_fail:
.annotate "line", 3
    (rx411_rep, rx411_pos, $I10, $P10) = rx411_cur."!mark_fail"(0)
    lt rx411_pos, -1, rx411_done
    eq rx411_pos, -1, rx411_fail
    jump $I10
  rx411_done:
    rx411_cur."!cursor_fail"()
    rx411_cur."!cursor_debug"("FAIL  ", "assertion:sym<!>")
    .return (rx411_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<!>"  :subid("131_1258208089.76063") :method
.annotate "line", 3
    $P413 = self."!PREFIX__!subrule"("assertion", "!")
    new $P414, "ResizablePMCArray"
    push $P414, $P413
    push $P414, "!"
    .return ($P414)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block416"  :anon :subid("132_1258208089.76063") :method :outer("130_1258208089.76063")
.annotate "line", 134
    .local string rx418_tgt
    .local int rx418_pos
    .local int rx418_off
    .local int rx418_eos
    .local int rx418_rep
    .local pmc rx418_cur
    (rx418_cur, rx418_pos, rx418_tgt, $I10) = self."!cursor_start"()
    rx418_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx418_cur
    .local pmc match
    .lex "$/", match
    length rx418_eos, rx418_tgt
    set rx418_off, 0
    lt $I10, 2, rx418_start
    sub rx418_off, $I10, 1
    substr rx418_tgt, rx418_tgt, rx418_off
  rx418_start:
    ge rx418_pos, 0, rxscan419_done
  rxscan419_loop:
    ($P10) = rx418_cur."from"()
    inc $P10
    set rx418_pos, $P10
    ge rx418_pos, rx418_eos, rxscan419_done
    set_addr $I10, rxscan419_loop
    rx418_cur."!mark_push"(0, rx418_pos, $I10)
  rxscan419_done:
  # rx literal  ">"
    add $I11, rx418_pos, 1
    gt $I11, rx418_eos, rx418_fail
    sub $I11, rx418_pos, rx418_off
    substr $S10, rx418_tgt, $I11, 1
    ne $S10, ">", rx418_fail
    add rx418_pos, 1
  # rx pass
    rx418_cur."!cursor_pass"(rx418_pos, "")
    rx418_cur."!cursor_debug"("PASS  ", "", " at pos=", rx418_pos)
    .return (rx418_cur)
  rx418_fail:
    (rx418_rep, rx418_pos, $I10, $P10) = rx418_cur."!mark_fail"(0)
    lt rx418_pos, -1, rx418_done
    eq rx418_pos, -1, rx418_fail
    jump $I10
  rx418_done:
    rx418_cur."!cursor_fail"()
    rx418_cur."!cursor_debug"("FAIL  ", "")
    .return (rx418_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<method>"  :subid("133_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx421_tgt
    .local int rx421_pos
    .local int rx421_off
    .local int rx421_eos
    .local int rx421_rep
    .local pmc rx421_cur
    (rx421_cur, rx421_pos, rx421_tgt, $I10) = self."!cursor_start"()
    rx421_cur."!cursor_debug"("START ", "assertion:sym<method>")
    .lex unicode:"$\x{a2}", rx421_cur
    .local pmc match
    .lex "$/", match
    length rx421_eos, rx421_tgt
    set rx421_off, 0
    lt $I10, 2, rx421_start
    sub rx421_off, $I10, 1
    substr rx421_tgt, rx421_tgt, rx421_off
  rx421_start:
.annotate "line", 137
  # rx literal  "."
    add $I11, rx421_pos, 1
    gt $I11, rx421_eos, rx421_fail
    sub $I11, rx421_pos, rx421_off
    substr $S10, rx421_tgt, $I11, 1
    ne $S10, ".", rx421_fail
    add rx421_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx421_cur."!cursor_pos"(rx421_pos)
    $P10 = rx421_cur."assertion"()
    unless $P10, rx421_fail
    rx421_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx421_pos = $P10."pos"()
.annotate "line", 136
  # rx pass
    rx421_cur."!cursor_pass"(rx421_pos, "assertion:sym<method>")
    rx421_cur."!cursor_debug"("PASS  ", "assertion:sym<method>", " at pos=", rx421_pos)
    .return (rx421_cur)
  rx421_fail:
.annotate "line", 3
    (rx421_rep, rx421_pos, $I10, $P10) = rx421_cur."!mark_fail"(0)
    lt rx421_pos, -1, rx421_done
    eq rx421_pos, -1, rx421_fail
    jump $I10
  rx421_done:
    rx421_cur."!cursor_fail"()
    rx421_cur."!cursor_debug"("FAIL  ", "assertion:sym<method>")
    .return (rx421_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<method>"  :subid("134_1258208089.76063") :method
.annotate "line", 3
    $P423 = self."!PREFIX__!subrule"("assertion", ".")
    new $P424, "ResizablePMCArray"
    push $P424, $P423
    .return ($P424)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<name>"  :subid("135_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .const 'Sub' $P433 = "137_1258208089.76063"
    capture_lex $P433
    .local string rx426_tgt
    .local int rx426_pos
    .local int rx426_off
    .local int rx426_eos
    .local int rx426_rep
    .local pmc rx426_cur
    (rx426_cur, rx426_pos, rx426_tgt, $I10) = self."!cursor_start"()
    rx426_cur."!cursor_debug"("START ", "assertion:sym<name>")
    rx426_cur."!cursor_caparray"("arglist", "nibbler", "assertion")
    .lex unicode:"$\x{a2}", rx426_cur
    .local pmc match
    .lex "$/", match
    length rx426_eos, rx426_tgt
    set rx426_off, 0
    lt $I10, 2, rx426_start
    sub rx426_off, $I10, 1
    substr rx426_tgt, rx426_tgt, rx426_off
  rx426_start:
.annotate "line", 141
  # rx subcapture "longname"
    set_addr $I10, rxcap_429_fail
    rx426_cur."!mark_push"(0, rx426_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx426_pos, rx426_off
    find_not_cclass $I11, 8192, rx426_tgt, $I10, rx426_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx426_fail
    add rx426_pos, rx426_off, $I11
    set_addr $I10, rxcap_429_fail
    ($I12, $I11) = rx426_cur."!mark_peek"($I10)
    rx426_cur."!cursor_pos"($I11)
    ($P10) = rx426_cur."!cursor_start"()
    $P10."!cursor_pass"(rx426_pos, "")
    rx426_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    goto rxcap_429_done
  rxcap_429_fail:
    goto rx426_fail
  rxcap_429_done:
.annotate "line", 148
  # rx rxquantr430 ** 0..1
    set_addr $I436, rxquantr430_done
    rx426_cur."!mark_push"(0, rx426_pos, $I436)
  rxquantr430_loop:
  alt431_0:
.annotate "line", 142
    set_addr $I10, alt431_1
    rx426_cur."!mark_push"(0, rx426_pos, $I10)
.annotate "line", 143
  # rx subrule "before" subtype=zerowidth negate=
    rx426_cur."!cursor_pos"(rx426_pos)
    .const 'Sub' $P433 = "137_1258208089.76063"
    capture_lex $P433
    $P10 = rx426_cur."before"($P433)
    unless $P10, rx426_fail
    goto alt431_end
  alt431_1:
    set_addr $I10, alt431_2
    rx426_cur."!mark_push"(0, rx426_pos, $I10)
.annotate "line", 144
  # rx literal  "="
    add $I11, rx426_pos, 1
    gt $I11, rx426_eos, rx426_fail
    sub $I11, rx426_pos, rx426_off
    substr $S10, rx426_tgt, $I11, 1
    ne $S10, "=", rx426_fail
    add rx426_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx426_cur."!cursor_pos"(rx426_pos)
    $P10 = rx426_cur."assertion"()
    unless $P10, rx426_fail
    rx426_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx426_pos = $P10."pos"()
    goto alt431_end
  alt431_2:
    set_addr $I10, alt431_3
    rx426_cur."!mark_push"(0, rx426_pos, $I10)
.annotate "line", 145
  # rx literal  ":"
    add $I11, rx426_pos, 1
    gt $I11, rx426_eos, rx426_fail
    sub $I11, rx426_pos, rx426_off
    substr $S10, rx426_tgt, $I11, 1
    ne $S10, ":", rx426_fail
    add rx426_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx426_cur."!cursor_pos"(rx426_pos)
    $P10 = rx426_cur."arglist"()
    unless $P10, rx426_fail
    rx426_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx426_pos = $P10."pos"()
    goto alt431_end
  alt431_3:
    set_addr $I10, alt431_4
    rx426_cur."!mark_push"(0, rx426_pos, $I10)
.annotate "line", 146
  # rx literal  "("
    add $I11, rx426_pos, 1
    gt $I11, rx426_eos, rx426_fail
    sub $I11, rx426_pos, rx426_off
    substr $S10, rx426_tgt, $I11, 1
    ne $S10, "(", rx426_fail
    add rx426_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx426_cur."!cursor_pos"(rx426_pos)
    $P10 = rx426_cur."arglist"()
    unless $P10, rx426_fail
    rx426_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx426_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx426_pos, 1
    gt $I11, rx426_eos, rx426_fail
    sub $I11, rx426_pos, rx426_off
    substr $S10, rx426_tgt, $I11, 1
    ne $S10, ")", rx426_fail
    add rx426_pos, 1
    goto alt431_end
  alt431_4:
.annotate "line", 147
  # rx subrule "normspace" subtype=method negate=
    rx426_cur."!cursor_pos"(rx426_pos)
    $P10 = rx426_cur."normspace"()
    unless $P10, rx426_fail
    rx426_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx426_cur."!cursor_pos"(rx426_pos)
    $P10 = rx426_cur."nibbler"()
    unless $P10, rx426_fail
    rx426_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx426_pos = $P10."pos"()
  alt431_end:
.annotate "line", 148
    (rx426_rep) = rx426_cur."!mark_commit"($I436)
  rxquantr430_done:
.annotate "line", 140
  # rx pass
    rx426_cur."!cursor_pass"(rx426_pos, "assertion:sym<name>")
    rx426_cur."!cursor_debug"("PASS  ", "assertion:sym<name>", " at pos=", rx426_pos)
    .return (rx426_cur)
  rx426_fail:
.annotate "line", 3
    (rx426_rep, rx426_pos, $I10, $P10) = rx426_cur."!mark_fail"(0)
    lt rx426_pos, -1, rx426_done
    eq rx426_pos, -1, rx426_fail
    jump $I10
  rx426_done:
    rx426_cur."!cursor_fail"()
    rx426_cur."!cursor_debug"("FAIL  ", "assertion:sym<name>")
    .return (rx426_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<name>"  :subid("136_1258208089.76063") :method
.annotate "line", 3
    new $P428, "ResizablePMCArray"
    push $P428, ""
    .return ($P428)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block432"  :anon :subid("137_1258208089.76063") :method :outer("135_1258208089.76063")
.annotate "line", 143
    .local string rx434_tgt
    .local int rx434_pos
    .local int rx434_off
    .local int rx434_eos
    .local int rx434_rep
    .local pmc rx434_cur
    (rx434_cur, rx434_pos, rx434_tgt, $I10) = self."!cursor_start"()
    rx434_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx434_cur
    .local pmc match
    .lex "$/", match
    length rx434_eos, rx434_tgt
    set rx434_off, 0
    lt $I10, 2, rx434_start
    sub rx434_off, $I10, 1
    substr rx434_tgt, rx434_tgt, rx434_off
  rx434_start:
    ge rx434_pos, 0, rxscan435_done
  rxscan435_loop:
    ($P10) = rx434_cur."from"()
    inc $P10
    set rx434_pos, $P10
    ge rx434_pos, rx434_eos, rxscan435_done
    set_addr $I10, rxscan435_loop
    rx434_cur."!mark_push"(0, rx434_pos, $I10)
  rxscan435_done:
  # rx literal  ">"
    add $I11, rx434_pos, 1
    gt $I11, rx434_eos, rx434_fail
    sub $I11, rx434_pos, rx434_off
    substr $S10, rx434_tgt, $I11, 1
    ne $S10, ">", rx434_fail
    add rx434_pos, 1
  # rx pass
    rx434_cur."!cursor_pass"(rx434_pos, "")
    rx434_cur."!cursor_debug"("PASS  ", "", " at pos=", rx434_pos)
    .return (rx434_cur)
  rx434_fail:
    (rx434_rep, rx434_pos, $I10, $P10) = rx434_cur."!mark_fail"(0)
    lt rx434_pos, -1, rx434_done
    eq rx434_pos, -1, rx434_fail
    jump $I10
  rx434_done:
    rx434_cur."!cursor_fail"()
    rx434_cur."!cursor_debug"("FAIL  ", "")
    .return (rx434_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<[>"  :subid("138_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .const 'Sub' $P442 = "140_1258208089.76063"
    capture_lex $P442
    .local string rx438_tgt
    .local int rx438_pos
    .local int rx438_off
    .local int rx438_eos
    .local int rx438_rep
    .local pmc rx438_cur
    (rx438_cur, rx438_pos, rx438_tgt, $I10) = self."!cursor_start"()
    rx438_cur."!cursor_debug"("START ", "assertion:sym<[>")
    rx438_cur."!cursor_caparray"("cclass_elem")
    .lex unicode:"$\x{a2}", rx438_cur
    .local pmc match
    .lex "$/", match
    length rx438_eos, rx438_tgt
    set rx438_off, 0
    lt $I10, 2, rx438_start
    sub rx438_off, $I10, 1
    substr rx438_tgt, rx438_tgt, rx438_off
  rx438_start:
.annotate "line", 151
  # rx subrule "before" subtype=zerowidth negate=
    rx438_cur."!cursor_pos"(rx438_pos)
    .const 'Sub' $P442 = "140_1258208089.76063"
    capture_lex $P442
    $P10 = rx438_cur."before"($P442)
    unless $P10, rx438_fail
  # rx rxquantr446 ** 1..*
    set_addr $I447, rxquantr446_done
    rx438_cur."!mark_push"(0, -1, $I447)
  rxquantr446_loop:
  # rx subrule "cclass_elem" subtype=capture negate=
    rx438_cur."!cursor_pos"(rx438_pos)
    $P10 = rx438_cur."cclass_elem"()
    unless $P10, rx438_fail
    rx438_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cclass_elem")
    rx438_pos = $P10."pos"()
    (rx438_rep) = rx438_cur."!mark_commit"($I447)
    rx438_cur."!mark_push"(rx438_rep, rx438_pos, $I447)
    goto rxquantr446_loop
  rxquantr446_done:
  # rx pass
    rx438_cur."!cursor_pass"(rx438_pos, "assertion:sym<[>")
    rx438_cur."!cursor_debug"("PASS  ", "assertion:sym<[>", " at pos=", rx438_pos)
    .return (rx438_cur)
  rx438_fail:
.annotate "line", 3
    (rx438_rep, rx438_pos, $I10, $P10) = rx438_cur."!mark_fail"(0)
    lt rx438_pos, -1, rx438_done
    eq rx438_pos, -1, rx438_fail
    jump $I10
  rx438_done:
    rx438_cur."!cursor_fail"()
    rx438_cur."!cursor_debug"("FAIL  ", "assertion:sym<[>")
    .return (rx438_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<[>"  :subid("139_1258208089.76063") :method
.annotate "line", 3
    new $P440, "ResizablePMCArray"
    push $P440, ""
    .return ($P440)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block441"  :anon :subid("140_1258208089.76063") :method :outer("138_1258208089.76063")
.annotate "line", 151
    .local string rx443_tgt
    .local int rx443_pos
    .local int rx443_off
    .local int rx443_eos
    .local int rx443_rep
    .local pmc rx443_cur
    (rx443_cur, rx443_pos, rx443_tgt, $I10) = self."!cursor_start"()
    rx443_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx443_cur
    .local pmc match
    .lex "$/", match
    length rx443_eos, rx443_tgt
    set rx443_off, 0
    lt $I10, 2, rx443_start
    sub rx443_off, $I10, 1
    substr rx443_tgt, rx443_tgt, rx443_off
  rx443_start:
    ge rx443_pos, 0, rxscan444_done
  rxscan444_loop:
    ($P10) = rx443_cur."from"()
    inc $P10
    set rx443_pos, $P10
    ge rx443_pos, rx443_eos, rxscan444_done
    set_addr $I10, rxscan444_loop
    rx443_cur."!mark_push"(0, rx443_pos, $I10)
  rxscan444_done:
  alt445_0:
    set_addr $I10, alt445_1
    rx443_cur."!mark_push"(0, rx443_pos, $I10)
  # rx literal  "["
    add $I11, rx443_pos, 1
    gt $I11, rx443_eos, rx443_fail
    sub $I11, rx443_pos, rx443_off
    substr $S10, rx443_tgt, $I11, 1
    ne $S10, "[", rx443_fail
    add rx443_pos, 1
    goto alt445_end
  alt445_1:
    set_addr $I10, alt445_2
    rx443_cur."!mark_push"(0, rx443_pos, $I10)
  # rx literal  "+"
    add $I11, rx443_pos, 1
    gt $I11, rx443_eos, rx443_fail
    sub $I11, rx443_pos, rx443_off
    substr $S10, rx443_tgt, $I11, 1
    ne $S10, "+", rx443_fail
    add rx443_pos, 1
    goto alt445_end
  alt445_2:
  # rx literal  "-"
    add $I11, rx443_pos, 1
    gt $I11, rx443_eos, rx443_fail
    sub $I11, rx443_pos, rx443_off
    substr $S10, rx443_tgt, $I11, 1
    ne $S10, "-", rx443_fail
    add rx443_pos, 1
  alt445_end:
  # rx pass
    rx443_cur."!cursor_pass"(rx443_pos, "")
    rx443_cur."!cursor_debug"("PASS  ", "", " at pos=", rx443_pos)
    .return (rx443_cur)
  rx443_fail:
    (rx443_rep, rx443_pos, $I10, $P10) = rx443_cur."!mark_fail"(0)
    lt rx443_pos, -1, rx443_done
    eq rx443_pos, -1, rx443_fail
    jump $I10
  rx443_done:
    rx443_cur."!cursor_fail"()
    rx443_cur."!cursor_debug"("FAIL  ", "")
    .return (rx443_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "cclass_elem"  :subid("141_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .const 'Sub' $P459 = "143_1258208089.76063"
    capture_lex $P459
    .local string rx449_tgt
    .local int rx449_pos
    .local int rx449_off
    .local int rx449_eos
    .local int rx449_rep
    .local pmc rx449_cur
    (rx449_cur, rx449_pos, rx449_tgt, $I10) = self."!cursor_start"()
    rx449_cur."!cursor_debug"("START ", "cclass_elem")
    rx449_cur."!cursor_caparray"("charspec")
    .lex unicode:"$\x{a2}", rx449_cur
    .local pmc match
    .lex "$/", match
    length rx449_eos, rx449_tgt
    set rx449_off, 0
    lt $I10, 2, rx449_start
    sub rx449_off, $I10, 1
    substr rx449_tgt, rx449_tgt, rx449_off
  rx449_start:
.annotate "line", 154
  # rx subcapture "sign"
    set_addr $I10, rxcap_453_fail
    rx449_cur."!mark_push"(0, rx449_pos, $I10)
  alt452_0:
    set_addr $I10, alt452_1
    rx449_cur."!mark_push"(0, rx449_pos, $I10)
  # rx literal  "+"
    add $I11, rx449_pos, 1
    gt $I11, rx449_eos, rx449_fail
    sub $I11, rx449_pos, rx449_off
    substr $S10, rx449_tgt, $I11, 1
    ne $S10, "+", rx449_fail
    add rx449_pos, 1
    goto alt452_end
  alt452_1:
    set_addr $I10, alt452_2
    rx449_cur."!mark_push"(0, rx449_pos, $I10)
  # rx literal  "-"
    add $I11, rx449_pos, 1
    gt $I11, rx449_eos, rx449_fail
    sub $I11, rx449_pos, rx449_off
    substr $S10, rx449_tgt, $I11, 1
    ne $S10, "-", rx449_fail
    add rx449_pos, 1
    goto alt452_end
  alt452_2:
  alt452_end:
    set_addr $I10, rxcap_453_fail
    ($I12, $I11) = rx449_cur."!mark_peek"($I10)
    rx449_cur."!cursor_pos"($I11)
    ($P10) = rx449_cur."!cursor_start"()
    $P10."!cursor_pass"(rx449_pos, "")
    rx449_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sign")
    goto rxcap_453_done
  rxcap_453_fail:
    goto rx449_fail
  rxcap_453_done:
.annotate "line", 155
  # rx rxquantr454 ** 0..1
    set_addr $I455, rxquantr454_done
    rx449_cur."!mark_push"(0, rx449_pos, $I455)
  rxquantr454_loop:
  # rx subrule "normspace" subtype=method negate=
    rx449_cur."!cursor_pos"(rx449_pos)
    $P10 = rx449_cur."normspace"()
    unless $P10, rx449_fail
    rx449_pos = $P10."pos"()
    (rx449_rep) = rx449_cur."!mark_commit"($I455)
  rxquantr454_done:
  alt456_0:
.annotate "line", 156
    set_addr $I10, alt456_1
    rx449_cur."!mark_push"(0, rx449_pos, $I10)
.annotate "line", 157
  # rx literal  "["
    add $I11, rx449_pos, 1
    gt $I11, rx449_eos, rx449_fail
    sub $I11, rx449_pos, rx449_off
    substr $S10, rx449_tgt, $I11, 1
    ne $S10, "[", rx449_fail
    add rx449_pos, 1
.annotate "line", 160
  # rx rxquantr457 ** 0..*
    set_addr $I478, rxquantr457_done
    rx449_cur."!mark_push"(0, rx449_pos, $I478)
  rxquantr457_loop:
.annotate "line", 157
  # rx subrule $P459 subtype=capture negate=
    rx449_cur."!cursor_pos"(rx449_pos)
    .const 'Sub' $P459 = "143_1258208089.76063"
    capture_lex $P459
    $P10 = rx449_cur.$P459()
    unless $P10, rx449_fail
    rx449_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charspec")
    rx449_pos = $P10."pos"()
.annotate "line", 160
    (rx449_rep) = rx449_cur."!mark_commit"($I478)
    rx449_cur."!mark_push"(rx449_rep, rx449_pos, $I478)
    goto rxquantr457_loop
  rxquantr457_done:
.annotate "line", 161
  # rx charclass_q s r 0..-1
    sub $I10, rx449_pos, rx449_off
    find_not_cclass $I11, 32, rx449_tgt, $I10, rx449_eos
    add rx449_pos, rx449_off, $I11
  # rx literal  "]"
    add $I11, rx449_pos, 1
    gt $I11, rx449_eos, rx449_fail
    sub $I11, rx449_pos, rx449_off
    substr $S10, rx449_tgt, $I11, 1
    ne $S10, "]", rx449_fail
    add rx449_pos, 1
.annotate "line", 157
    goto alt456_end
  alt456_1:
.annotate "line", 162
  # rx subcapture "name"
    set_addr $I10, rxcap_479_fail
    rx449_cur."!mark_push"(0, rx449_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx449_pos, rx449_off
    find_not_cclass $I11, 8192, rx449_tgt, $I10, rx449_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx449_fail
    add rx449_pos, rx449_off, $I11
    set_addr $I10, rxcap_479_fail
    ($I12, $I11) = rx449_cur."!mark_peek"($I10)
    rx449_cur."!cursor_pos"($I11)
    ($P10) = rx449_cur."!cursor_start"()
    $P10."!cursor_pass"(rx449_pos, "")
    rx449_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_479_done
  rxcap_479_fail:
    goto rx449_fail
  rxcap_479_done:
  alt456_end:
.annotate "line", 164
  # rx rxquantr480 ** 0..1
    set_addr $I481, rxquantr480_done
    rx449_cur."!mark_push"(0, rx449_pos, $I481)
  rxquantr480_loop:
  # rx subrule "normspace" subtype=method negate=
    rx449_cur."!cursor_pos"(rx449_pos)
    $P10 = rx449_cur."normspace"()
    unless $P10, rx449_fail
    rx449_pos = $P10."pos"()
    (rx449_rep) = rx449_cur."!mark_commit"($I481)
  rxquantr480_done:
.annotate "line", 153
  # rx pass
    rx449_cur."!cursor_pass"(rx449_pos, "cclass_elem")
    rx449_cur."!cursor_debug"("PASS  ", "cclass_elem", " at pos=", rx449_pos)
    .return (rx449_cur)
  rx449_fail:
.annotate "line", 3
    (rx449_rep, rx449_pos, $I10, $P10) = rx449_cur."!mark_fail"(0)
    lt rx449_pos, -1, rx449_done
    eq rx449_pos, -1, rx449_fail
    jump $I10
  rx449_done:
    rx449_cur."!cursor_fail"()
    rx449_cur."!cursor_debug"("FAIL  ", "cclass_elem")
    .return (rx449_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__cclass_elem"  :subid("142_1258208089.76063") :method
.annotate "line", 3
    new $P451, "ResizablePMCArray"
    push $P451, ""
    push $P451, "-"
    push $P451, "+"
    .return ($P451)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block458"  :anon :subid("143_1258208089.76063") :method :outer("141_1258208089.76063")
.annotate "line", 157
    .const 'Sub' $P474 = "146_1258208089.76063"
    capture_lex $P474
    .const 'Sub' $P469 = "145_1258208089.76063"
    capture_lex $P469
    .const 'Sub' $P465 = "144_1258208089.76063"
    capture_lex $P465
    .local string rx460_tgt
    .local int rx460_pos
    .local int rx460_off
    .local int rx460_eos
    .local int rx460_rep
    .local pmc rx460_cur
    (rx460_cur, rx460_pos, rx460_tgt, $I10) = self."!cursor_start"()
    rx460_cur."!cursor_debug"("START ", "")
    rx460_cur."!cursor_caparray"("1")
    .lex unicode:"$\x{a2}", rx460_cur
    .local pmc match
    .lex "$/", match
    length rx460_eos, rx460_tgt
    set rx460_off, 0
    lt $I10, 2, rx460_start
    sub rx460_off, $I10, 1
    substr rx460_tgt, rx460_tgt, rx460_off
  rx460_start:
    ge rx460_pos, 0, rxscan461_done
  rxscan461_loop:
    ($P10) = rx460_cur."from"()
    inc $P10
    set rx460_pos, $P10
    ge rx460_pos, rx460_eos, rxscan461_done
    set_addr $I10, rxscan461_loop
    rx460_cur."!mark_push"(0, rx460_pos, $I10)
  rxscan461_done:
  alt462_0:
    set_addr $I10, alt462_1
    rx460_cur."!mark_push"(0, rx460_pos, $I10)
.annotate "line", 158
  # rx charclass_q s r 0..-1
    sub $I10, rx460_pos, rx460_off
    find_not_cclass $I11, 32, rx460_tgt, $I10, rx460_eos
    add rx460_pos, rx460_off, $I11
  # rx literal  "-"
    add $I11, rx460_pos, 1
    gt $I11, rx460_eos, rx460_fail
    sub $I11, rx460_pos, rx460_off
    substr $S10, rx460_tgt, $I11, 1
    ne $S10, "-", rx460_fail
    add rx460_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx460_cur."!cursor_pos"(rx460_pos)
    $P10 = rx460_cur."obs"("hyphen in enumerated character class", "..")
    unless $P10, rx460_fail
    rx460_pos = $P10."pos"()
    goto alt462_end
  alt462_1:
.annotate "line", 159
  # rx charclass_q s r 0..-1
    sub $I10, rx460_pos, rx460_off
    find_not_cclass $I11, 32, rx460_tgt, $I10, rx460_eos
    add rx460_pos, rx460_off, $I11
  alt463_0:
    set_addr $I10, alt463_1
    rx460_cur."!mark_push"(0, rx460_pos, $I10)
  # rx literal  "\\"
    add $I11, rx460_pos, 1
    gt $I11, rx460_eos, rx460_fail
    sub $I11, rx460_pos, rx460_off
    substr $S10, rx460_tgt, $I11, 1
    ne $S10, "\\", rx460_fail
    add rx460_pos, 1
  # rx subrule $P465 subtype=capture negate=
    rx460_cur."!cursor_pos"(rx460_pos)
    .const 'Sub' $P465 = "144_1258208089.76063"
    capture_lex $P465
    $P10 = rx460_cur.$P465()
    unless $P10, rx460_fail
    rx460_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"(0)
    rx460_pos = $P10."pos"()
    goto alt463_end
  alt463_1:
  # rx subrule $P469 subtype=capture negate=
    rx460_cur."!cursor_pos"(rx460_pos)
    .const 'Sub' $P469 = "145_1258208089.76063"
    capture_lex $P469
    $P10 = rx460_cur.$P469()
    unless $P10, rx460_fail
    rx460_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"(0)
    rx460_pos = $P10."pos"()
  alt463_end:
  # rx rxquantr472 ** 0..1
    set_addr $I477, rxquantr472_done
    rx460_cur."!mark_push"(0, rx460_pos, $I477)
  rxquantr472_loop:
  # rx charclass_q s r 0..-1
    sub $I10, rx460_pos, rx460_off
    find_not_cclass $I11, 32, rx460_tgt, $I10, rx460_eos
    add rx460_pos, rx460_off, $I11
  # rx literal  ".."
    add $I11, rx460_pos, 2
    gt $I11, rx460_eos, rx460_fail
    sub $I11, rx460_pos, rx460_off
    substr $S10, rx460_tgt, $I11, 2
    ne $S10, "..", rx460_fail
    add rx460_pos, 2
  # rx charclass_q s r 0..-1
    sub $I10, rx460_pos, rx460_off
    find_not_cclass $I11, 32, rx460_tgt, $I10, rx460_eos
    add rx460_pos, rx460_off, $I11
  # rx subrule $P474 subtype=capture negate=
    rx460_cur."!cursor_pos"(rx460_pos)
    .const 'Sub' $P474 = "146_1258208089.76063"
    capture_lex $P474
    $P10 = rx460_cur.$P474()
    unless $P10, rx460_fail
    rx460_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("1")
    rx460_pos = $P10."pos"()
    (rx460_rep) = rx460_cur."!mark_commit"($I477)
  rxquantr472_done:
  alt462_end:
.annotate "line", 157
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
.sub "_block464"  :anon :subid("144_1258208089.76063") :method :outer("143_1258208089.76063")
.annotate "line", 159
    .local string rx466_tgt
    .local int rx466_pos
    .local int rx466_off
    .local int rx466_eos
    .local int rx466_rep
    .local pmc rx466_cur
    (rx466_cur, rx466_pos, rx466_tgt, $I10) = self."!cursor_start"()
    rx466_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx466_cur
    .local pmc match
    .lex "$/", match
    length rx466_eos, rx466_tgt
    set rx466_off, 0
    lt $I10, 2, rx466_start
    sub rx466_off, $I10, 1
    substr rx466_tgt, rx466_tgt, rx466_off
  rx466_start:
    ge rx466_pos, 0, rxscan467_done
  rxscan467_loop:
    ($P10) = rx466_cur."from"()
    inc $P10
    set rx466_pos, $P10
    ge rx466_pos, rx466_eos, rxscan467_done
    set_addr $I10, rxscan467_loop
    rx466_cur."!mark_push"(0, rx466_pos, $I10)
  rxscan467_done:
  # rx charclass .
    ge rx466_pos, rx466_eos, rx466_fail
    inc rx466_pos
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
.sub "_block468"  :anon :subid("145_1258208089.76063") :method :outer("143_1258208089.76063")
.annotate "line", 159
    .local string rx470_tgt
    .local int rx470_pos
    .local int rx470_off
    .local int rx470_eos
    .local int rx470_rep
    .local pmc rx470_cur
    (rx470_cur, rx470_pos, rx470_tgt, $I10) = self."!cursor_start"()
    rx470_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx470_cur
    .local pmc match
    .lex "$/", match
    length rx470_eos, rx470_tgt
    set rx470_off, 0
    lt $I10, 2, rx470_start
    sub rx470_off, $I10, 1
    substr rx470_tgt, rx470_tgt, rx470_off
  rx470_start:
    ge rx470_pos, 0, rxscan471_done
  rxscan471_loop:
    ($P10) = rx470_cur."from"()
    inc $P10
    set rx470_pos, $P10
    ge rx470_pos, rx470_eos, rxscan471_done
    set_addr $I10, rxscan471_loop
    rx470_cur."!mark_push"(0, rx470_pos, $I10)
  rxscan471_done:
  # rx enumcharlist negate=1
    ge rx470_pos, rx470_eos, rx470_fail
    sub $I10, rx470_pos, rx470_off
    substr $S10, rx470_tgt, $I10, 1
    index $I11, "]\\", $S10
    ge $I11, 0, rx470_fail
    inc rx470_pos
  # rx pass
    rx470_cur."!cursor_pass"(rx470_pos, "")
    rx470_cur."!cursor_debug"("PASS  ", "", " at pos=", rx470_pos)
    .return (rx470_cur)
  rx470_fail:
    (rx470_rep, rx470_pos, $I10, $P10) = rx470_cur."!mark_fail"(0)
    lt rx470_pos, -1, rx470_done
    eq rx470_pos, -1, rx470_fail
    jump $I10
  rx470_done:
    rx470_cur."!cursor_fail"()
    rx470_cur."!cursor_debug"("FAIL  ", "")
    .return (rx470_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block473"  :anon :subid("146_1258208089.76063") :method :outer("143_1258208089.76063")
.annotate "line", 159
    .local string rx475_tgt
    .local int rx475_pos
    .local int rx475_off
    .local int rx475_eos
    .local int rx475_rep
    .local pmc rx475_cur
    (rx475_cur, rx475_pos, rx475_tgt, $I10) = self."!cursor_start"()
    rx475_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx475_cur
    .local pmc match
    .lex "$/", match
    length rx475_eos, rx475_tgt
    set rx475_off, 0
    lt $I10, 2, rx475_start
    sub rx475_off, $I10, 1
    substr rx475_tgt, rx475_tgt, rx475_off
  rx475_start:
    ge rx475_pos, 0, rxscan476_done
  rxscan476_loop:
    ($P10) = rx475_cur."from"()
    inc $P10
    set rx475_pos, $P10
    ge rx475_pos, rx475_eos, rxscan476_done
    set_addr $I10, rxscan476_loop
    rx475_cur."!mark_push"(0, rx475_pos, $I10)
  rxscan476_done:
  # rx charclass .
    ge rx475_pos, rx475_eos, rx475_fail
    inc rx475_pos
  # rx pass
    rx475_cur."!cursor_pass"(rx475_pos, "")
    rx475_cur."!cursor_debug"("PASS  ", "", " at pos=", rx475_pos)
    .return (rx475_cur)
  rx475_fail:
    (rx475_rep, rx475_pos, $I10, $P10) = rx475_cur."!mark_fail"(0)
    lt rx475_pos, -1, rx475_done
    eq rx475_pos, -1, rx475_fail
    jump $I10
  rx475_done:
    rx475_cur."!cursor_fail"()
    rx475_cur."!cursor_debug"("FAIL  ", "")
    .return (rx475_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_internal"  :subid("147_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .const 'Sub' $P490 = "149_1258208089.76063"
    capture_lex $P490
    .local string rx483_tgt
    .local int rx483_pos
    .local int rx483_off
    .local int rx483_eos
    .local int rx483_rep
    .local pmc rx483_cur
    (rx483_cur, rx483_pos, rx483_tgt, $I10) = self."!cursor_start"()
    rx483_cur."!cursor_debug"("START ", "mod_internal")
    rx483_cur."!cursor_caparray"("n")
    .lex unicode:"$\x{a2}", rx483_cur
    .local pmc match
    .lex "$/", match
    length rx483_eos, rx483_tgt
    set rx483_off, 0
    lt $I10, 2, rx483_start
    sub rx483_off, $I10, 1
    substr rx483_tgt, rx483_tgt, rx483_off
  rx483_start:
  alt487_0:
.annotate "line", 168
    set_addr $I10, alt487_1
    rx483_cur."!mark_push"(0, rx483_pos, $I10)
.annotate "line", 169
  # rx literal  ":"
    add $I11, rx483_pos, 1
    gt $I11, rx483_eos, rx483_fail
    sub $I11, rx483_pos, rx483_off
    substr $S10, rx483_tgt, $I11, 1
    ne $S10, ":", rx483_fail
    add rx483_pos, 1
  # rx rxquantr488 ** 1..1
    set_addr $I494, rxquantr488_done
    rx483_cur."!mark_push"(0, -1, $I494)
  rxquantr488_loop:
  # rx subrule $P490 subtype=capture negate=
    rx483_cur."!cursor_pos"(rx483_pos)
    .const 'Sub' $P490 = "149_1258208089.76063"
    capture_lex $P490
    $P10 = rx483_cur.$P490()
    unless $P10, rx483_fail
    rx483_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("n")
    rx483_pos = $P10."pos"()
    (rx483_rep) = rx483_cur."!mark_commit"($I494)
  rxquantr488_done:
  # rx subrule "mod_ident" subtype=capture negate=
    rx483_cur."!cursor_pos"(rx483_pos)
    $P10 = rx483_cur."mod_ident"()
    unless $P10, rx483_fail
    rx483_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_ident")
    rx483_pos = $P10."pos"()
  # rxanchor rwb
    le rx483_pos, 0, rx483_fail
    sub $I10, rx483_pos, rx483_off
    is_cclass $I11, 8192, rx483_tgt, $I10
    if $I11, rx483_fail
    dec $I10
    is_cclass $I11, 8192, rx483_tgt, $I10
    unless $I11, rx483_fail
    goto alt487_end
  alt487_1:
.annotate "line", 170
  # rx literal  ":"
    add $I11, rx483_pos, 1
    gt $I11, rx483_eos, rx483_fail
    sub $I11, rx483_pos, rx483_off
    substr $S10, rx483_tgt, $I11, 1
    ne $S10, ":", rx483_fail
    add rx483_pos, 1
  # rx subrule "mod_ident" subtype=capture negate=
    rx483_cur."!cursor_pos"(rx483_pos)
    $P10 = rx483_cur."mod_ident"()
    unless $P10, rx483_fail
    rx483_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_ident")
    rx483_pos = $P10."pos"()
  # rx rxquantr495 ** 0..1
    set_addr $I497, rxquantr495_done
    rx483_cur."!mark_push"(0, rx483_pos, $I497)
  rxquantr495_loop:
  # rx literal  "("
    add $I11, rx483_pos, 1
    gt $I11, rx483_eos, rx483_fail
    sub $I11, rx483_pos, rx483_off
    substr $S10, rx483_tgt, $I11, 1
    ne $S10, "(", rx483_fail
    add rx483_pos, 1
  # rx subcapture "n"
    set_addr $I10, rxcap_496_fail
    rx483_cur."!mark_push"(0, rx483_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx483_pos, rx483_off
    find_not_cclass $I11, 8, rx483_tgt, $I10, rx483_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx483_fail
    add rx483_pos, rx483_off, $I11
    set_addr $I10, rxcap_496_fail
    ($I12, $I11) = rx483_cur."!mark_peek"($I10)
    rx483_cur."!cursor_pos"($I11)
    ($P10) = rx483_cur."!cursor_start"()
    $P10."!cursor_pass"(rx483_pos, "")
    rx483_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("n")
    goto rxcap_496_done
  rxcap_496_fail:
    goto rx483_fail
  rxcap_496_done:
  # rx literal  ")"
    add $I11, rx483_pos, 1
    gt $I11, rx483_eos, rx483_fail
    sub $I11, rx483_pos, rx483_off
    substr $S10, rx483_tgt, $I11, 1
    ne $S10, ")", rx483_fail
    add rx483_pos, 1
    (rx483_rep) = rx483_cur."!mark_commit"($I497)
  rxquantr495_done:
  alt487_end:
.annotate "line", 167
  # rx pass
    rx483_cur."!cursor_pass"(rx483_pos, "mod_internal")
    rx483_cur."!cursor_debug"("PASS  ", "mod_internal", " at pos=", rx483_pos)
    .return (rx483_cur)
  rx483_fail:
.annotate "line", 3
    (rx483_rep, rx483_pos, $I10, $P10) = rx483_cur."!mark_fail"(0)
    lt rx483_pos, -1, rx483_done
    eq rx483_pos, -1, rx483_fail
    jump $I10
  rx483_done:
    rx483_cur."!cursor_fail"()
    rx483_cur."!cursor_debug"("FAIL  ", "mod_internal")
    .return (rx483_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_internal"  :subid("148_1258208089.76063") :method
.annotate "line", 3
    $P485 = self."!PREFIX__!subrule"("mod_ident", ":")
    new $P486, "ResizablePMCArray"
    push $P486, $P485
    push $P486, ":"
    .return ($P486)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block489"  :anon :subid("149_1258208089.76063") :method :outer("147_1258208089.76063")
.annotate "line", 169
    .local string rx491_tgt
    .local int rx491_pos
    .local int rx491_off
    .local int rx491_eos
    .local int rx491_rep
    .local pmc rx491_cur
    (rx491_cur, rx491_pos, rx491_tgt, $I10) = self."!cursor_start"()
    rx491_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx491_cur
    .local pmc match
    .lex "$/", match
    length rx491_eos, rx491_tgt
    set rx491_off, 0
    lt $I10, 2, rx491_start
    sub rx491_off, $I10, 1
    substr rx491_tgt, rx491_tgt, rx491_off
  rx491_start:
    ge rx491_pos, 0, rxscan492_done
  rxscan492_loop:
    ($P10) = rx491_cur."from"()
    inc $P10
    set rx491_pos, $P10
    ge rx491_pos, rx491_eos, rxscan492_done
    set_addr $I10, rxscan492_loop
    rx491_cur."!mark_push"(0, rx491_pos, $I10)
  rxscan492_done:
  alt493_0:
    set_addr $I10, alt493_1
    rx491_cur."!mark_push"(0, rx491_pos, $I10)
  # rx literal  "!"
    add $I11, rx491_pos, 1
    gt $I11, rx491_eos, rx491_fail
    sub $I11, rx491_pos, rx491_off
    substr $S10, rx491_tgt, $I11, 1
    ne $S10, "!", rx491_fail
    add rx491_pos, 1
    goto alt493_end
  alt493_1:
  # rx charclass_q d r 1..-1
    sub $I10, rx491_pos, rx491_off
    find_not_cclass $I11, 8, rx491_tgt, $I10, rx491_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx491_fail
    add rx491_pos, rx491_off, $I11
  alt493_end:
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
.sub "mod_ident"  :subid("150_1258208089.76063") :method
.annotate "line", 174
    $P499 = self."!protoregex"("mod_ident")
    .return ($P499)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident"  :subid("151_1258208089.76063") :method
.annotate "line", 174
    $P501 = self."!PREFIX__!protoregex"("mod_ident")
    .return ($P501)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ignorecase>"  :subid("152_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx503_tgt
    .local int rx503_pos
    .local int rx503_off
    .local int rx503_eos
    .local int rx503_rep
    .local pmc rx503_cur
    (rx503_cur, rx503_pos, rx503_tgt, $I10) = self."!cursor_start"()
    rx503_cur."!cursor_debug"("START ", "mod_ident:sym<ignorecase>")
    .lex unicode:"$\x{a2}", rx503_cur
    .local pmc match
    .lex "$/", match
    length rx503_eos, rx503_tgt
    set rx503_off, 0
    lt $I10, 2, rx503_start
    sub rx503_off, $I10, 1
    substr rx503_tgt, rx503_tgt, rx503_off
  rx503_start:
.annotate "line", 175
  # rx subcapture "sym"
    set_addr $I10, rxcap_506_fail
    rx503_cur."!mark_push"(0, rx503_pos, $I10)
  # rx literal  "i"
    add $I11, rx503_pos, 1
    gt $I11, rx503_eos, rx503_fail
    sub $I11, rx503_pos, rx503_off
    substr $S10, rx503_tgt, $I11, 1
    ne $S10, "i", rx503_fail
    add rx503_pos, 1
    set_addr $I10, rxcap_506_fail
    ($I12, $I11) = rx503_cur."!mark_peek"($I10)
    rx503_cur."!cursor_pos"($I11)
    ($P10) = rx503_cur."!cursor_start"()
    $P10."!cursor_pass"(rx503_pos, "")
    rx503_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_506_done
  rxcap_506_fail:
    goto rx503_fail
  rxcap_506_done:
  # rx rxquantr507 ** 0..1
    set_addr $I508, rxquantr507_done
    rx503_cur."!mark_push"(0, rx503_pos, $I508)
  rxquantr507_loop:
  # rx literal  "gnorecase"
    add $I11, rx503_pos, 9
    gt $I11, rx503_eos, rx503_fail
    sub $I11, rx503_pos, rx503_off
    substr $S10, rx503_tgt, $I11, 9
    ne $S10, "gnorecase", rx503_fail
    add rx503_pos, 9
    (rx503_rep) = rx503_cur."!mark_commit"($I508)
  rxquantr507_done:
  # rx pass
    rx503_cur."!cursor_pass"(rx503_pos, "mod_ident:sym<ignorecase>")
    rx503_cur."!cursor_debug"("PASS  ", "mod_ident:sym<ignorecase>", " at pos=", rx503_pos)
    .return (rx503_cur)
  rx503_fail:
.annotate "line", 3
    (rx503_rep, rx503_pos, $I10, $P10) = rx503_cur."!mark_fail"(0)
    lt rx503_pos, -1, rx503_done
    eq rx503_pos, -1, rx503_fail
    jump $I10
  rx503_done:
    rx503_cur."!cursor_fail"()
    rx503_cur."!cursor_debug"("FAIL  ", "mod_ident:sym<ignorecase>")
    .return (rx503_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident:sym<ignorecase>"  :subid("153_1258208089.76063") :method
.annotate "line", 3
    new $P505, "ResizablePMCArray"
    push $P505, "i"
    .return ($P505)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ratchet>"  :subid("154_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx510_tgt
    .local int rx510_pos
    .local int rx510_off
    .local int rx510_eos
    .local int rx510_rep
    .local pmc rx510_cur
    (rx510_cur, rx510_pos, rx510_tgt, $I10) = self."!cursor_start"()
    rx510_cur."!cursor_debug"("START ", "mod_ident:sym<ratchet>")
    .lex unicode:"$\x{a2}", rx510_cur
    .local pmc match
    .lex "$/", match
    length rx510_eos, rx510_tgt
    set rx510_off, 0
    lt $I10, 2, rx510_start
    sub rx510_off, $I10, 1
    substr rx510_tgt, rx510_tgt, rx510_off
  rx510_start:
.annotate "line", 176
  # rx subcapture "sym"
    set_addr $I10, rxcap_513_fail
    rx510_cur."!mark_push"(0, rx510_pos, $I10)
  # rx literal  "r"
    add $I11, rx510_pos, 1
    gt $I11, rx510_eos, rx510_fail
    sub $I11, rx510_pos, rx510_off
    substr $S10, rx510_tgt, $I11, 1
    ne $S10, "r", rx510_fail
    add rx510_pos, 1
    set_addr $I10, rxcap_513_fail
    ($I12, $I11) = rx510_cur."!mark_peek"($I10)
    rx510_cur."!cursor_pos"($I11)
    ($P10) = rx510_cur."!cursor_start"()
    $P10."!cursor_pass"(rx510_pos, "")
    rx510_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_513_done
  rxcap_513_fail:
    goto rx510_fail
  rxcap_513_done:
  # rx rxquantr514 ** 0..1
    set_addr $I515, rxquantr514_done
    rx510_cur."!mark_push"(0, rx510_pos, $I515)
  rxquantr514_loop:
  # rx literal  "atchet"
    add $I11, rx510_pos, 6
    gt $I11, rx510_eos, rx510_fail
    sub $I11, rx510_pos, rx510_off
    substr $S10, rx510_tgt, $I11, 6
    ne $S10, "atchet", rx510_fail
    add rx510_pos, 6
    (rx510_rep) = rx510_cur."!mark_commit"($I515)
  rxquantr514_done:
  # rx pass
    rx510_cur."!cursor_pass"(rx510_pos, "mod_ident:sym<ratchet>")
    rx510_cur."!cursor_debug"("PASS  ", "mod_ident:sym<ratchet>", " at pos=", rx510_pos)
    .return (rx510_cur)
  rx510_fail:
.annotate "line", 3
    (rx510_rep, rx510_pos, $I10, $P10) = rx510_cur."!mark_fail"(0)
    lt rx510_pos, -1, rx510_done
    eq rx510_pos, -1, rx510_fail
    jump $I10
  rx510_done:
    rx510_cur."!cursor_fail"()
    rx510_cur."!cursor_debug"("FAIL  ", "mod_ident:sym<ratchet>")
    .return (rx510_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident:sym<ratchet>"  :subid("155_1258208089.76063") :method
.annotate "line", 3
    new $P512, "ResizablePMCArray"
    push $P512, "r"
    .return ($P512)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<sigspace>"  :subid("156_1258208089.76063") :method :outer("11_1258208089.76063")
.annotate "line", 3
    .local string rx517_tgt
    .local int rx517_pos
    .local int rx517_off
    .local int rx517_eos
    .local int rx517_rep
    .local pmc rx517_cur
    (rx517_cur, rx517_pos, rx517_tgt, $I10) = self."!cursor_start"()
    rx517_cur."!cursor_debug"("START ", "mod_ident:sym<sigspace>")
    .lex unicode:"$\x{a2}", rx517_cur
    .local pmc match
    .lex "$/", match
    length rx517_eos, rx517_tgt
    set rx517_off, 0
    lt $I10, 2, rx517_start
    sub rx517_off, $I10, 1
    substr rx517_tgt, rx517_tgt, rx517_off
  rx517_start:
.annotate "line", 177
  # rx subcapture "sym"
    set_addr $I10, rxcap_520_fail
    rx517_cur."!mark_push"(0, rx517_pos, $I10)
  # rx literal  "s"
    add $I11, rx517_pos, 1
    gt $I11, rx517_eos, rx517_fail
    sub $I11, rx517_pos, rx517_off
    substr $S10, rx517_tgt, $I11, 1
    ne $S10, "s", rx517_fail
    add rx517_pos, 1
    set_addr $I10, rxcap_520_fail
    ($I12, $I11) = rx517_cur."!mark_peek"($I10)
    rx517_cur."!cursor_pos"($I11)
    ($P10) = rx517_cur."!cursor_start"()
    $P10."!cursor_pass"(rx517_pos, "")
    rx517_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_520_done
  rxcap_520_fail:
    goto rx517_fail
  rxcap_520_done:
  # rx rxquantr521 ** 0..1
    set_addr $I522, rxquantr521_done
    rx517_cur."!mark_push"(0, rx517_pos, $I522)
  rxquantr521_loop:
  # rx literal  "igspace"
    add $I11, rx517_pos, 7
    gt $I11, rx517_eos, rx517_fail
    sub $I11, rx517_pos, rx517_off
    substr $S10, rx517_tgt, $I11, 7
    ne $S10, "igspace", rx517_fail
    add rx517_pos, 7
    (rx517_rep) = rx517_cur."!mark_commit"($I522)
  rxquantr521_done:
  # rx pass
    rx517_cur."!cursor_pass"(rx517_pos, "mod_ident:sym<sigspace>")
    rx517_cur."!cursor_debug"("PASS  ", "mod_ident:sym<sigspace>", " at pos=", rx517_pos)
    .return (rx517_cur)
  rx517_fail:
.annotate "line", 3
    (rx517_rep, rx517_pos, $I10, $P10) = rx517_cur."!mark_fail"(0)
    lt rx517_pos, -1, rx517_done
    eq rx517_pos, -1, rx517_fail
    jump $I10
  rx517_done:
    rx517_cur."!cursor_fail"()
    rx517_cur."!cursor_debug"("FAIL  ", "mod_ident:sym<sigspace>")
    .return (rx517_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident:sym<sigspace>"  :subid("157_1258208089.76063") :method
.annotate "line", 3
    new $P519, "ResizablePMCArray"
    push $P519, "s"
    .return ($P519)
.end

### .include 'gen/p6regex-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1258208097.30665")
.annotate "line", 0
    get_hll_global $P14, ["Regex";"P6Regex";"Actions"], "_block13"
    capture_lex $P14
.annotate "line", 4
    get_hll_global $P14, ["Regex";"P6Regex";"Actions"], "_block13"
    capture_lex $P14
    $P1512 = $P14()
.annotate "line", 1
    .return ($P1512)
.end


.namespace []
.sub "" :load :init :subid("post88") :outer("10_1258208097.30665")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1258208097.30665"
    .local pmc block
    set block, $P12
    $P1513 = get_root_global ["parrot"], "P6metaclass"
    $P1513."new_class"("Regex::P6Regex::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block13"  :subid("11_1258208097.30665") :outer("10_1258208097.30665")
.annotate "line", 4
    .const 'Sub' $P1479 = "87_1258208097.30665"
    capture_lex $P1479
    .const 'Sub' $P1410 = "83_1258208097.30665"
    capture_lex $P1410
    .const 'Sub' $P1342 = "81_1258208097.30665"
    capture_lex $P1342
    .const 'Sub' $P1269 = "78_1258208097.30665"
    capture_lex $P1269
    .const 'Sub' $P1255 = "77_1258208097.30665"
    capture_lex $P1255
    .const 'Sub' $P1231 = "76_1258208097.30665"
    capture_lex $P1231
    .const 'Sub' $P1213 = "75_1258208097.30665"
    capture_lex $P1213
    .const 'Sub' $P1199 = "74_1258208097.30665"
    capture_lex $P1199
    .const 'Sub' $P1168 = "73_1258208097.30665"
    capture_lex $P1168
    .const 'Sub' $P1137 = "72_1258208097.30665"
    capture_lex $P1137
    .const 'Sub' $P1121 = "71_1258208097.30665"
    capture_lex $P1121
    .const 'Sub' $P1105 = "70_1258208097.30665"
    capture_lex $P1105
    .const 'Sub' $P1089 = "69_1258208097.30665"
    capture_lex $P1089
    .const 'Sub' $P1073 = "68_1258208097.30665"
    capture_lex $P1073
    .const 'Sub' $P1057 = "67_1258208097.30665"
    capture_lex $P1057
    .const 'Sub' $P1041 = "66_1258208097.30665"
    capture_lex $P1041
    .const 'Sub' $P1025 = "65_1258208097.30665"
    capture_lex $P1025
    .const 'Sub' $P1001 = "64_1258208097.30665"
    capture_lex $P1001
    .const 'Sub' $P986 = "63_1258208097.30665"
    capture_lex $P986
    .const 'Sub' $P930 = "62_1258208097.30665"
    capture_lex $P930
    .const 'Sub' $P909 = "61_1258208097.30665"
    capture_lex $P909
    .const 'Sub' $P887 = "60_1258208097.30665"
    capture_lex $P887
    .const 'Sub' $P877 = "59_1258208097.30665"
    capture_lex $P877
    .const 'Sub' $P867 = "58_1258208097.30665"
    capture_lex $P867
    .const 'Sub' $P857 = "57_1258208097.30665"
    capture_lex $P857
    .const 'Sub' $P845 = "56_1258208097.30665"
    capture_lex $P845
    .const 'Sub' $P833 = "55_1258208097.30665"
    capture_lex $P833
    .const 'Sub' $P821 = "54_1258208097.30665"
    capture_lex $P821
    .const 'Sub' $P809 = "53_1258208097.30665"
    capture_lex $P809
    .const 'Sub' $P797 = "52_1258208097.30665"
    capture_lex $P797
    .const 'Sub' $P785 = "51_1258208097.30665"
    capture_lex $P785
    .const 'Sub' $P773 = "50_1258208097.30665"
    capture_lex $P773
    .const 'Sub' $P761 = "49_1258208097.30665"
    capture_lex $P761
    .const 'Sub' $P745 = "48_1258208097.30665"
    capture_lex $P745
    .const 'Sub' $P727 = "47_1258208097.30665"
    capture_lex $P727
    .const 'Sub' $P717 = "46_1258208097.30665"
    capture_lex $P717
    .const 'Sub' $P699 = "45_1258208097.30665"
    capture_lex $P699
    .const 'Sub' $P652 = "44_1258208097.30665"
    capture_lex $P652
    .const 'Sub' $P635 = "43_1258208097.30665"
    capture_lex $P635
    .const 'Sub' $P620 = "42_1258208097.30665"
    capture_lex $P620
    .const 'Sub' $P605 = "41_1258208097.30665"
    capture_lex $P605
    .const 'Sub' $P579 = "40_1258208097.30665"
    capture_lex $P579
    .const 'Sub' $P529 = "38_1258208097.30665"
    capture_lex $P529
    .const 'Sub' $P474 = "36_1258208097.30665"
    capture_lex $P474
    .const 'Sub' $P417 = "33_1258208097.30665"
    capture_lex $P417
    .const 'Sub' $P402 = "32_1258208097.30665"
    capture_lex $P402
    .const 'Sub' $P376 = "30_1258208097.30665"
    capture_lex $P376
    .const 'Sub' $P358 = "29_1258208097.30665"
    capture_lex $P358
    .const 'Sub' $P336 = "28_1258208097.30665"
    capture_lex $P336
    .const 'Sub' $P304 = "27_1258208097.30665"
    capture_lex $P304
    .const 'Sub' $P42 = "14_1258208097.30665"
    capture_lex $P42
    .const 'Sub' $P21 = "13_1258208097.30665"
    capture_lex $P21
    .const 'Sub' $P16 = "12_1258208097.30665"
    capture_lex $P16
    get_global $P15, "@MODIFIERS"
    unless_null $P15, vivify_89
    new $P15, "ResizablePMCArray"
    set_global "@MODIFIERS", $P15
  vivify_89:
.annotate "line", 6
    .const 'Sub' $P16 = "12_1258208097.30665"
    capture_lex $P16
    .lex "INIT", $P16
.annotate "line", 462
    .const 'Sub' $P21 = "13_1258208097.30665"
    capture_lex $P21
    .lex "buildsub", $P21
.annotate "line", 475
    .const 'Sub' $P42 = "14_1258208097.30665"
    capture_lex $P42
    .lex "capnames", $P42
.annotate "line", 541
    .const 'Sub' $P304 = "27_1258208097.30665"
    capture_lex $P304
    .lex "backmod", $P304
.annotate "line", 548
    .const 'Sub' $P336 = "28_1258208097.30665"
    capture_lex $P336
    .lex "subrule_alias", $P336
.annotate "line", 4
    get_global $P356, "@MODIFIERS"
    find_lex $P357, "INIT"
.annotate "line", 455
    find_lex $P1508, "buildsub"
    find_lex $P1509, "capnames"
    find_lex $P1510, "backmod"
    find_lex $P1511, "subrule_alias"
.annotate "line", 4
    .return ($P1511)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "INIT"  :subid("12_1258208097.30665") :outer("11_1258208097.30665")
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
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "buildsub"  :subid("13_1258208097.30665") :outer("11_1258208097.30665")
    .param pmc param_24
.annotate "line", 462
    new $P23, 'ExceptionHandler'
    set_addr $P23, control_22
    $P23."handle_types"(58)
    push_eh $P23
    .lex "$rpast", param_24
.annotate "line", 463
    new $P25, "Hash"
    .lex "%capnames", $P25
    find_lex $P26, "$rpast"
    $P27 = "capnames"($P26, 0)
    store_lex "%capnames", $P27
.annotate "line", 464
    new $P28, "Integer"
    assign $P28, 0
    find_lex $P29, "%capnames"
    unless_null $P29, vivify_90
    new $P29, "Hash"
    store_lex "%capnames", $P29
  vivify_90:
    set $P29[""], $P28
.annotate "line", 465
    get_hll_global $P30, ["PAST"], "Regex"
.annotate "line", 466
    get_hll_global $P31, ["PAST"], "Regex"
    $P32 = $P31."new"("scan" :named("pasttype"))
    find_lex $P33, "$rpast"
.annotate "line", 468
    get_hll_global $P34, ["PAST"], "Regex"
    $P35 = $P34."new"("pass" :named("pasttype"))
    find_lex $P36, "%capnames"
    $P37 = $P30."new"($P32, $P33, $P35, "concat" :named("pasttype"), $P36 :named("capnames"))
.annotate "line", 465
    store_lex "$rpast", $P37
.annotate "line", 472
    get_hll_global $P38, ["PAST"], "Block"
    find_lex $P39, "$rpast"
    $P40 = $P38."new"($P39, "method" :named("blocktype"))
.annotate "line", 462
    .return ($P40)
  control_22:
    .local pmc exception
    .get_results (exception)
    getattribute $P41, exception, "payload"
    .return ($P41)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "capnames"  :subid("14_1258208097.30665") :outer("11_1258208097.30665")
    .param pmc param_45
    .param pmc param_46
.annotate "line", 475
    .const 'Sub' $P279 = "25_1258208097.30665"
    capture_lex $P279
    .const 'Sub' $P214 = "22_1258208097.30665"
    capture_lex $P214
    .const 'Sub' $P170 = "20_1258208097.30665"
    capture_lex $P170
    .const 'Sub' $P128 = "18_1258208097.30665"
    capture_lex $P128
    .const 'Sub' $P57 = "15_1258208097.30665"
    capture_lex $P57
    new $P44, 'ExceptionHandler'
    set_addr $P44, control_43
    $P44."handle_types"(58)
    push_eh $P44
    .lex "$ast", param_45
    .lex "$count", param_46
.annotate "line", 476
    new $P47, "Hash"
    .lex "%capnames", $P47
.annotate "line", 477
    new $P48, "Undef"
    .lex "$pasttype", $P48
.annotate "line", 475
    find_lex $P49, "%capnames"
.annotate "line", 477
    find_lex $P50, "$ast"
    $P51 = $P50."pasttype"()
    store_lex "$pasttype", $P51
.annotate "line", 478
    find_lex $P53, "$pasttype"
    set $S54, $P53
    iseq $I55, $S54, "alt"
    if $I55, if_52
.annotate "line", 491
    find_lex $P119, "$pasttype"
    set $S120, $P119
    iseq $I121, $S120, "concat"
    if $I121, if_118
.annotate "line", 500
    find_lex $P163, "$pasttype"
    set $S164, $P163
    iseq $I165, $S164, "subrule"
    if $I165, if_162
    new $P161, 'Integer'
    set $P161, $I165
    goto if_162_end
  if_162:
    find_lex $P166, "$ast"
    $S167 = $P166."subtype"()
    iseq $I168, $S167, "capture"
    new $P161, 'Integer'
    set $P161, $I168
  if_162_end:
    if $P161, if_160
.annotate "line", 513
    find_lex $P210, "$pasttype"
    set $S211, $P210
    iseq $I212, $S211, "subcapture"
    if $I212, if_209
.annotate "line", 530
    find_lex $P275, "$pasttype"
    set $S276, $P275
    iseq $I277, $S276, "quant"
    unless $I277, if_274_end
    .const 'Sub' $P279 = "25_1258208097.30665"
    capture_lex $P279
    $P279()
  if_274_end:
    goto if_209_end
  if_209:
.annotate "line", 513
    .const 'Sub' $P214 = "22_1258208097.30665"
    capture_lex $P214
    $P214()
  if_209_end:
    goto if_160_end
  if_160:
.annotate "line", 500
    .const 'Sub' $P170 = "20_1258208097.30665"
    capture_lex $P170
    $P170()
  if_160_end:
    goto if_118_end
  if_118:
.annotate "line", 492
    find_lex $P123, "$ast"
    $P124 = $P123."list"()
    defined $I125, $P124
    unless $I125, for_undef_111
    iter $P122, $P124
    new $P158, 'ExceptionHandler'
    set_addr $P158, loop157_handler
    $P158."handle_types"(65, 67, 66)
    push_eh $P158
  loop157_test:
    unless $P122, loop157_done
    shift $P126, $P122
  loop157_redo:
    .const 'Sub' $P128 = "18_1258208097.30665"
    capture_lex $P128
    $P128($P126)
  loop157_next:
    goto loop157_test
  loop157_handler:
    .local pmc exception
    .get_results (exception)
    getattribute $P159, exception, 'type'
    eq $P159, 65, loop157_next
    eq $P159, 67, loop157_redo
  loop157_done:
    pop_eh
  for_undef_111:
  if_118_end:
.annotate "line", 491
    goto if_52_end
  if_52:
.annotate "line", 478
    .const 'Sub' $P57 = "15_1258208097.30665"
    capture_lex $P57
    $P57()
  if_52_end:
.annotate "line", 537
    find_lex $P300, "$count"
    find_lex $P301, "%capnames"
    unless_null $P301, vivify_131
    new $P301, "Hash"
    store_lex "%capnames", $P301
  vivify_131:
    set $P301[""], $P300
    find_lex $P302, "%capnames"
.annotate "line", 475
    .return ($P302)
  control_43:
    .local pmc exception
    .get_results (exception)
    getattribute $P303, exception, "payload"
    .return ($P303)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block278"  :anon :subid("25_1258208097.30665") :outer("14_1258208097.30665")
.annotate "line", 530
    .const 'Sub' $P290 = "26_1258208097.30665"
    capture_lex $P290
.annotate "line", 531
    new $P280, "Hash"
    .lex "%astcap", $P280
    find_lex $P281, "$ast"
    unless_null $P281, vivify_91
    new $P281, "ResizablePMCArray"
  vivify_91:
    set $P282, $P281[0]
    unless_null $P282, vivify_92
    new $P282, "Undef"
  vivify_92:
    find_lex $P283, "$count"
    $P284 = "capnames"($P282, $P283)
    store_lex "%astcap", $P284
.annotate "line", 532
    find_lex $P286, "%astcap"
    defined $I287, $P286
    unless $I287, for_undef_93
    iter $P285, $P286
    new $P296, 'ExceptionHandler'
    set_addr $P296, loop295_handler
    $P296."handle_types"(65, 67, 66)
    push_eh $P296
  loop295_test:
    unless $P285, loop295_done
    shift $P288, $P285
  loop295_redo:
    .const 'Sub' $P290 = "26_1258208097.30665"
    capture_lex $P290
    $P290($P288)
  loop295_next:
    goto loop295_test
  loop295_handler:
    .local pmc exception
    .get_results (exception)
    getattribute $P297, exception, 'type'
    eq $P297, 65, loop295_next
    eq $P297, 67, loop295_redo
  loop295_done:
    pop_eh
  for_undef_93:
.annotate "line", 535
    find_lex $P298, "%astcap"
    unless_null $P298, vivify_95
    new $P298, "Hash"
  vivify_95:
    set $P299, $P298[""]
    unless_null $P299, vivify_96
    new $P299, "Undef"
  vivify_96:
    store_lex "$count", $P299
.annotate "line", 530
    .return ($P299)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block289"  :anon :subid("26_1258208097.30665") :outer("25_1258208097.30665")
    .param pmc param_291
.annotate "line", 532
    .lex "$_", param_291
.annotate "line", 533
    new $P292, "Integer"
    assign $P292, 2
    find_lex $P293, "$_"
    find_lex $P294, "%capnames"
    unless_null $P294, vivify_94
    new $P294, "Hash"
    store_lex "%capnames", $P294
  vivify_94:
    set $P294[$P293], $P292
.annotate "line", 532
    .return ($P292)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block213"  :anon :subid("22_1258208097.30665") :outer("14_1258208097.30665")
.annotate "line", 513
    .const 'Sub' $P256 = "24_1258208097.30665"
    capture_lex $P256
    .const 'Sub' $P226 = "23_1258208097.30665"
    capture_lex $P226
.annotate "line", 514
    new $P215, "Undef"
    .lex "$name", $P215
.annotate "line", 515
    new $P216, "ResizablePMCArray"
    .lex "@names", $P216
.annotate "line", 524
    new $P217, "Hash"
    .lex "%x", $P217
.annotate "line", 514
    find_lex $P218, "$ast"
    $P219 = $P218."name"()
    store_lex "$name", $P219
.annotate "line", 515

            $P0 = find_lex '$name'
            $S0 = $P0
            $P220 = split '=', $S0

    store_lex "@names", $P220
.annotate "line", 520
    find_lex $P222, "@names"
    defined $I223, $P222
    unless $I223, for_undef_97
    iter $P221, $P222
    new $P245, 'ExceptionHandler'
    set_addr $P245, loop244_handler
    $P245."handle_types"(65, 67, 66)
    push_eh $P245
  loop244_test:
    unless $P221, loop244_done
    shift $P224, $P221
  loop244_redo:
    .const 'Sub' $P226 = "23_1258208097.30665"
    capture_lex $P226
    $P226($P224)
  loop244_next:
    goto loop244_test
  loop244_handler:
    .local pmc exception
    .get_results (exception)
    getattribute $P246, exception, 'type'
    eq $P246, 65, loop244_next
    eq $P246, 67, loop244_redo
  loop244_done:
    pop_eh
  for_undef_97:
.annotate "line", 524
    find_lex $P247, "$ast"
    unless_null $P247, vivify_99
    new $P247, "ResizablePMCArray"
  vivify_99:
    set $P248, $P247[0]
    unless_null $P248, vivify_100
    new $P248, "Undef"
  vivify_100:
    find_lex $P249, "$count"
    $P250 = "capnames"($P248, $P249)
    store_lex "%x", $P250
.annotate "line", 525
    find_lex $P252, "%x"
    defined $I253, $P252
    unless $I253, for_undef_101
    iter $P251, $P252
    new $P270, 'ExceptionHandler'
    set_addr $P270, loop269_handler
    $P270."handle_types"(65, 67, 66)
    push_eh $P270
  loop269_test:
    unless $P251, loop269_done
    shift $P254, $P251
  loop269_redo:
    .const 'Sub' $P256 = "24_1258208097.30665"
    capture_lex $P256
    $P256($P254)
  loop269_next:
    goto loop269_test
  loop269_handler:
    .local pmc exception
    .get_results (exception)
    getattribute $P271, exception, 'type'
    eq $P271, 65, loop269_next
    eq $P271, 67, loop269_redo
  loop269_done:
    pop_eh
  for_undef_101:
.annotate "line", 528
    find_lex $P272, "%x"
    unless_null $P272, vivify_107
    new $P272, "Hash"
  vivify_107:
    set $P273, $P272[""]
    unless_null $P273, vivify_108
    new $P273, "Undef"
  vivify_108:
    store_lex "$count", $P273
.annotate "line", 513
    .return ($P273)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block225"  :anon :subid("23_1258208097.30665") :outer("22_1258208097.30665")
    .param pmc param_227
.annotate "line", 520
    .lex "$_", param_227
.annotate "line", 521
    find_lex $P231, "$_"
    set $S232, $P231
    iseq $I233, $S232, "0"
    unless $I233, unless_230
    new $P229, 'Integer'
    set $P229, $I233
    goto unless_230_end
  unless_230:
    find_lex $P234, "$_"
    set $N235, $P234
    new $P236, "Integer"
    assign $P236, 0
    set $N237, $P236
    isgt $I238, $N235, $N237
    new $P229, 'Integer'
    set $P229, $I238
  unless_230_end:
    unless $P229, if_228_end
    find_lex $P239, "$_"
    add $P240, $P239, 1
    store_lex "$count", $P240
  if_228_end:
.annotate "line", 522
    new $P241, "Integer"
    assign $P241, 1
    find_lex $P242, "$_"
    find_lex $P243, "%capnames"
    unless_null $P243, vivify_98
    new $P243, "Hash"
    store_lex "%capnames", $P243
  vivify_98:
    set $P243[$P242], $P241
.annotate "line", 520
    .return ($P241)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block255"  :anon :subid("24_1258208097.30665") :outer("22_1258208097.30665")
    .param pmc param_257
.annotate "line", 525
    .lex "$_", param_257
.annotate "line", 526
    find_lex $P258, "$_"
    find_lex $P259, "%capnames"
    unless_null $P259, vivify_102
    new $P259, "Hash"
  vivify_102:
    set $P260, $P259[$P258]
    unless_null $P260, vivify_103
    new $P260, "Undef"
  vivify_103:
    set $N261, $P260
    new $P262, 'Float'
    set $P262, $N261
    find_lex $P263, "$_"
    find_lex $P264, "%x"
    unless_null $P264, vivify_104
    new $P264, "Hash"
  vivify_104:
    set $P265, $P264[$P263]
    unless_null $P265, vivify_105
    new $P265, "Undef"
  vivify_105:
    add $P266, $P262, $P265
    find_lex $P267, "$_"
    find_lex $P268, "%capnames"
    unless_null $P268, vivify_106
    new $P268, "Hash"
    store_lex "%capnames", $P268
  vivify_106:
    set $P268[$P267], $P266
.annotate "line", 525
    .return ($P266)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block169"  :anon :subid("20_1258208097.30665") :outer("14_1258208097.30665")
.annotate "line", 500
    .const 'Sub' $P188 = "21_1258208097.30665"
    capture_lex $P188
.annotate "line", 501
    new $P171, "Undef"
    .lex "$name", $P171
.annotate "line", 503
    new $P172, "ResizablePMCArray"
    .lex "@names", $P172
.annotate "line", 501
    find_lex $P173, "$ast"
    $P174 = $P173."name"()
    store_lex "$name", $P174
.annotate "line", 502
    find_lex $P176, "$name"
    set $S177, $P176
    iseq $I178, $S177, ""
    unless $I178, if_175_end
    find_lex $P179, "$count"
    store_lex "$name", $P179
    find_lex $P180, "$ast"
    find_lex $P181, "$name"
    $P180."name"($P181)
  if_175_end:
.annotate "line", 503

            $P0 = find_lex '$name'
            $S0 = $P0
            $P182 = split '=', $S0

    store_lex "@names", $P182
.annotate "line", 508
    find_lex $P184, "@names"
    defined $I185, $P184
    unless $I185, for_undef_109
    iter $P183, $P184
    new $P207, 'ExceptionHandler'
    set_addr $P207, loop206_handler
    $P207."handle_types"(65, 67, 66)
    push_eh $P207
  loop206_test:
    unless $P183, loop206_done
    shift $P186, $P183
  loop206_redo:
    .const 'Sub' $P188 = "21_1258208097.30665"
    capture_lex $P188
    $P188($P186)
  loop206_next:
    goto loop206_test
  loop206_handler:
    .local pmc exception
    .get_results (exception)
    getattribute $P208, exception, 'type'
    eq $P208, 65, loop206_next
    eq $P208, 67, loop206_redo
  loop206_done:
    pop_eh
  for_undef_109:
.annotate "line", 500
    .return ($P183)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block187"  :anon :subid("21_1258208097.30665") :outer("20_1258208097.30665")
    .param pmc param_189
.annotate "line", 508
    .lex "$_", param_189
.annotate "line", 509
    find_lex $P193, "$_"
    set $S194, $P193
    iseq $I195, $S194, "0"
    unless $I195, unless_192
    new $P191, 'Integer'
    set $P191, $I195
    goto unless_192_end
  unless_192:
    find_lex $P196, "$_"
    set $N197, $P196
    new $P198, "Integer"
    assign $P198, 0
    set $N199, $P198
    isgt $I200, $N197, $N199
    new $P191, 'Integer'
    set $P191, $I200
  unless_192_end:
    unless $P191, if_190_end
    find_lex $P201, "$_"
    add $P202, $P201, 1
    store_lex "$count", $P202
  if_190_end:
.annotate "line", 510
    new $P203, "Integer"
    assign $P203, 1
    find_lex $P204, "$_"
    find_lex $P205, "%capnames"
    unless_null $P205, vivify_110
    new $P205, "Hash"
    store_lex "%capnames", $P205
  vivify_110:
    set $P205[$P204], $P203
.annotate "line", 508
    .return ($P203)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block127"  :anon :subid("18_1258208097.30665") :outer("14_1258208097.30665")
    .param pmc param_130
.annotate "line", 492
    .const 'Sub' $P139 = "19_1258208097.30665"
    capture_lex $P139
.annotate "line", 493
    new $P129, "Hash"
    .lex "%x", $P129
    .lex "$_", param_130
    find_lex $P131, "$_"
    find_lex $P132, "$count"
    $P133 = "capnames"($P131, $P132)
    store_lex "%x", $P133
.annotate "line", 494
    find_lex $P135, "%x"
    defined $I136, $P135
    unless $I136, for_undef_112
    iter $P134, $P135
    new $P153, 'ExceptionHandler'
    set_addr $P153, loop152_handler
    $P153."handle_types"(65, 67, 66)
    push_eh $P153
  loop152_test:
    unless $P134, loop152_done
    shift $P137, $P134
  loop152_redo:
    .const 'Sub' $P139 = "19_1258208097.30665"
    capture_lex $P139
    $P139($P137)
  loop152_next:
    goto loop152_test
  loop152_handler:
    .local pmc exception
    .get_results (exception)
    getattribute $P154, exception, 'type'
    eq $P154, 65, loop152_next
    eq $P154, 67, loop152_redo
  loop152_done:
    pop_eh
  for_undef_112:
.annotate "line", 497
    find_lex $P155, "%x"
    unless_null $P155, vivify_118
    new $P155, "Hash"
  vivify_118:
    set $P156, $P155[""]
    unless_null $P156, vivify_119
    new $P156, "Undef"
  vivify_119:
    store_lex "$count", $P156
.annotate "line", 492
    .return ($P156)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block138"  :anon :subid("19_1258208097.30665") :outer("18_1258208097.30665")
    .param pmc param_140
.annotate "line", 494
    .lex "$_", param_140
.annotate "line", 495
    find_lex $P141, "$_"
    find_lex $P142, "%capnames"
    unless_null $P142, vivify_113
    new $P142, "Hash"
  vivify_113:
    set $P143, $P142[$P141]
    unless_null $P143, vivify_114
    new $P143, "Undef"
  vivify_114:
    set $N144, $P143
    new $P145, 'Float'
    set $P145, $N144
    find_lex $P146, "$_"
    find_lex $P147, "%x"
    unless_null $P147, vivify_115
    new $P147, "Hash"
  vivify_115:
    set $P148, $P147[$P146]
    unless_null $P148, vivify_116
    new $P148, "Undef"
  vivify_116:
    add $P149, $P145, $P148
    find_lex $P150, "$_"
    find_lex $P151, "%capnames"
    unless_null $P151, vivify_117
    new $P151, "Hash"
    store_lex "%capnames", $P151
  vivify_117:
    set $P151[$P150], $P149
.annotate "line", 494
    .return ($P149)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block56"  :anon :subid("15_1258208097.30665") :outer("14_1258208097.30665")
.annotate "line", 478
    .const 'Sub' $P66 = "16_1258208097.30665"
    capture_lex $P66
.annotate "line", 479
    new $P58, "Undef"
    .lex "$max", $P58
    find_lex $P59, "$count"
    store_lex "$max", $P59
.annotate "line", 480
    find_lex $P61, "$ast"
    $P62 = $P61."list"()
    defined $I63, $P62
    unless $I63, for_undef_120
    iter $P60, $P62
    new $P115, 'ExceptionHandler'
    set_addr $P115, loop114_handler
    $P115."handle_types"(65, 67, 66)
    push_eh $P115
  loop114_test:
    unless $P60, loop114_done
    shift $P64, $P60
  loop114_redo:
    .const 'Sub' $P66 = "16_1258208097.30665"
    capture_lex $P66
    $P66($P64)
  loop114_next:
    goto loop114_test
  loop114_handler:
    .local pmc exception
    .get_results (exception)
    getattribute $P116, exception, 'type'
    eq $P116, 65, loop114_next
    eq $P116, 67, loop114_redo
  loop114_done:
    pop_eh
  for_undef_120:
.annotate "line", 489
    find_lex $P117, "$max"
    store_lex "$count", $P117
.annotate "line", 478
    .return ($P117)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block65"  :anon :subid("16_1258208097.30665") :outer("15_1258208097.30665")
    .param pmc param_68
.annotate "line", 480
    .const 'Sub' $P77 = "17_1258208097.30665"
    capture_lex $P77
.annotate "line", 481
    new $P67, "Hash"
    .lex "%x", $P67
    .lex "$_", param_68
    find_lex $P69, "$_"
    find_lex $P70, "$count"
    $P71 = "capnames"($P69, $P70)
    store_lex "%x", $P71
.annotate "line", 482
    find_lex $P73, "%x"
    defined $I74, $P73
    unless $I74, for_undef_121
    iter $P72, $P73
    new $P102, 'ExceptionHandler'
    set_addr $P102, loop101_handler
    $P102."handle_types"(65, 67, 66)
    push_eh $P102
  loop101_test:
    unless $P72, loop101_done
    shift $P75, $P72
  loop101_redo:
    .const 'Sub' $P77 = "17_1258208097.30665"
    capture_lex $P77
    $P77($P75)
  loop101_next:
    goto loop101_test
  loop101_handler:
    .local pmc exception
    .get_results (exception)
    getattribute $P103, exception, 'type'
    eq $P103, 65, loop101_next
    eq $P103, 67, loop101_redo
  loop101_done:
    pop_eh
  for_undef_121:
.annotate "line", 487
    find_lex $P106, "%x"
    unless_null $P106, vivify_127
    new $P106, "Hash"
  vivify_127:
    set $P107, $P106[""]
    unless_null $P107, vivify_128
    new $P107, "Undef"
  vivify_128:
    set $N108, $P107
    find_lex $P109, "$max"
    set $N110, $P109
    isgt $I111, $N108, $N110
    if $I111, if_105
    new $P104, 'Integer'
    set $P104, $I111
    goto if_105_end
  if_105:
    find_lex $P112, "%x"
    unless_null $P112, vivify_129
    new $P112, "Hash"
  vivify_129:
    set $P113, $P112[""]
    unless_null $P113, vivify_130
    new $P113, "Undef"
  vivify_130:
    store_lex "$max", $P113
    set $P104, $P113
  if_105_end:
.annotate "line", 480
    .return ($P104)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block76"  :anon :subid("17_1258208097.30665") :outer("16_1258208097.30665")
    .param pmc param_78
.annotate "line", 482
    .lex "$_", param_78
.annotate "line", 483
    find_lex $P83, "$_"
    find_lex $P84, "%capnames"
    unless_null $P84, vivify_122
    new $P84, "Hash"
  vivify_122:
    set $P85, $P84[$P83]
    unless_null $P85, vivify_123
    new $P85, "Undef"
  vivify_123:
    set $N86, $P85
    new $P87, "Integer"
    assign $P87, 2
    set $N88, $P87
    islt $I89, $N86, $N88
    if $I89, if_82
    new $P81, 'Integer'
    set $P81, $I89
    goto if_82_end
  if_82:
    find_lex $P90, "$_"
    find_lex $P91, "%x"
    unless_null $P91, vivify_124
    new $P91, "Hash"
  vivify_124:
    set $P92, $P91[$P90]
    unless_null $P92, vivify_125
    new $P92, "Undef"
  vivify_125:
    set $N93, $P92
    new $P94, "Integer"
    assign $P94, 1
    set $N95, $P94
    iseq $I96, $N93, $N95
    new $P81, 'Integer'
    set $P81, $I96
  if_82_end:
    if $P81, if_80
    new $P98, "Integer"
    assign $P98, 2
    set $P79, $P98
    goto if_80_end
  if_80:
    new $P97, "Integer"
    assign $P97, 1
    set $P79, $P97
  if_80_end:
.annotate "line", 484
    find_lex $P99, "$_"
    find_lex $P100, "%capnames"
    unless_null $P100, vivify_126
    new $P100, "Hash"
    store_lex "%capnames", $P100
  vivify_126:
    set $P100[$P99], $P79
.annotate "line", 482
    .return ($P79)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backmod"  :subid("27_1258208097.30665") :outer("11_1258208097.30665")
    .param pmc param_307
    .param pmc param_308
.annotate "line", 541
    new $P306, 'ExceptionHandler'
    set_addr $P306, control_305
    $P306."handle_types"(58)
    push_eh $P306
    .lex "$ast", param_307
    .lex "$backmod", param_308
.annotate "line", 542
    find_lex $P310, "$backmod"
    set $S311, $P310
    iseq $I312, $S311, ":"
    if $I312, if_309
.annotate "line", 543
    find_lex $P317, "$backmod"
    set $S318, $P317
    iseq $I319, $S318, ":?"
    unless $I319, unless_316
    new $P315, 'Integer'
    set $P315, $I319
    goto unless_316_end
  unless_316:
    find_lex $P320, "$backmod"
    set $S321, $P320
    iseq $I322, $S321, "?"
    new $P315, 'Integer'
    set $P315, $I322
  unless_316_end:
    if $P315, if_314
.annotate "line", 544
    find_lex $P327, "$backmod"
    set $S328, $P327
    iseq $I329, $S328, ":!"
    unless $I329, unless_326
    new $P325, 'Integer'
    set $P325, $I329
    goto unless_326_end
  unless_326:
    find_lex $P330, "$backmod"
    set $S331, $P330
    iseq $I332, $S331, "!"
    new $P325, 'Integer'
    set $P325, $I332
  unless_326_end:
    unless $P325, if_324_end
    find_lex $P333, "$ast"
    $P333."backtrack"("g")
  if_324_end:
    goto if_314_end
  if_314:
.annotate "line", 543
    find_lex $P323, "$ast"
    $P323."backtrack"("f")
  if_314_end:
    goto if_309_end
  if_309:
.annotate "line", 542
    find_lex $P313, "$ast"
    $P313."backtrack"("r")
  if_309_end:
    find_lex $P334, "$ast"
.annotate "line", 541
    .return ($P334)
  control_305:
    .local pmc exception
    .get_results (exception)
    getattribute $P335, exception, "payload"
    .return ($P335)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "subrule_alias"  :subid("28_1258208097.30665") :outer("11_1258208097.30665")
    .param pmc param_339
    .param pmc param_340
.annotate "line", 548
    new $P338, 'ExceptionHandler'
    set_addr $P338, control_337
    $P338."handle_types"(58)
    push_eh $P338
    .lex "$past", param_339
    .lex "$name", param_340
.annotate "line", 549
    find_lex $P342, "$past"
    $S343 = $P342."name"()
    isgt $I344, $S343, ""
    if $I344, if_341
.annotate "line", 550
    find_lex $P351, "$past"
    find_lex $P352, "$name"
    $P351."name"($P352)
    goto if_341_end
  if_341:
.annotate "line", 549
    find_lex $P345, "$past"
    find_lex $P346, "$name"
    concat $P347, $P346, "="
    find_lex $P348, "$past"
    $S349 = $P348."name"()
    concat $P350, $P347, $S349
    $P345."name"($P350)
  if_341_end:
.annotate "line", 551
    find_lex $P353, "$past"
    $P354 = $P353."subtype"("capture")
.annotate "line", 548
    .return ($P354)
  control_337:
    .local pmc exception
    .get_results (exception)
    getattribute $P355, exception, "payload"
    .return ($P355)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "arg"  :subid("29_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_361
.annotate "line", 14
    new $P360, 'ExceptionHandler'
    set_addr $P360, control_359
    $P360."handle_types"(58)
    push_eh $P360
    .lex "self", self
    .lex "$/", param_361
.annotate "line", 15
    find_lex $P362, "$/"
    find_lex $P365, "$/"
    unless_null $P365, vivify_132
    new $P365, "Hash"
  vivify_132:
    set $P366, $P365["quote"]
    unless_null $P366, vivify_133
    new $P366, "Undef"
  vivify_133:
    if $P366, if_364
    find_lex $P371, "$/"
    unless_null $P371, vivify_134
    new $P371, "Hash"
  vivify_134:
    set $P372, $P371["val"]
    unless_null $P372, vivify_135
    new $P372, "Undef"
  vivify_135:
    set $N373, $P372
    new $P363, 'Float'
    set $P363, $N373
    goto if_364_end
  if_364:
    find_lex $P367, "$/"
    unless_null $P367, vivify_136
    new $P367, "Hash"
  vivify_136:
    set $P368, $P367["quote"]
    unless_null $P368, vivify_137
    new $P368, "Hash"
  vivify_137:
    set $P369, $P368["val"]
    unless_null $P369, vivify_138
    new $P369, "Undef"
  vivify_138:
    set $S370, $P369
    new $P363, 'String'
    set $P363, $S370
  if_364_end:
    $P374 = $P362."!make"($P363)
.annotate "line", 14
    .return ($P374)
  control_359:
    .local pmc exception
    .get_results (exception)
    getattribute $P375, exception, "payload"
    .return ($P375)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "arglist"  :subid("30_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_379
.annotate "line", 18
    .const 'Sub' $P389 = "31_1258208097.30665"
    capture_lex $P389
    new $P378, 'ExceptionHandler'
    set_addr $P378, control_377
    $P378."handle_types"(58)
    push_eh $P378
    .lex "self", self
    .lex "$/", param_379
.annotate "line", 19
    new $P380, "Undef"
    .lex "$past", $P380
    get_hll_global $P381, ["PAST"], "Op"
    $P382 = $P381."new"("list" :named("pasttype"))
    store_lex "$past", $P382
.annotate "line", 20
    find_lex $P384, "$/"
    unless_null $P384, vivify_139
    new $P384, "Hash"
  vivify_139:
    set $P385, $P384["arg"]
    unless_null $P385, vivify_140
    new $P385, "Undef"
  vivify_140:
    defined $I386, $P385
    unless $I386, for_undef_141
    iter $P383, $P385
    new $P396, 'ExceptionHandler'
    set_addr $P396, loop395_handler
    $P396."handle_types"(65, 67, 66)
    push_eh $P396
  loop395_test:
    unless $P383, loop395_done
    shift $P387, $P383
  loop395_redo:
    .const 'Sub' $P389 = "31_1258208097.30665"
    capture_lex $P389
    $P389($P387)
  loop395_next:
    goto loop395_test
  loop395_handler:
    .local pmc exception
    .get_results (exception)
    getattribute $P397, exception, 'type'
    eq $P397, 65, loop395_next
    eq $P397, 67, loop395_redo
  loop395_done:
    pop_eh
  for_undef_141:
.annotate "line", 21
    find_lex $P398, "$/"
    find_lex $P399, "$past"
    $P400 = $P398."!make"($P399)
.annotate "line", 18
    .return ($P400)
  control_377:
    .local pmc exception
    .get_results (exception)
    getattribute $P401, exception, "payload"
    .return ($P401)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block388"  :anon :subid("31_1258208097.30665") :outer("30_1258208097.30665")
    .param pmc param_390
.annotate "line", 20
    .lex "$_", param_390
    find_lex $P391, "$past"
    find_lex $P392, "$_"
    $P393 = $P392."ast"()
    $P394 = $P391."push"($P393)
    .return ($P394)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "TOP"  :subid("32_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_405
.annotate "line", 24
    new $P404, 'ExceptionHandler'
    set_addr $P404, control_403
    $P404."handle_types"(58)
    push_eh $P404
    .lex "self", self
    .lex "$/", param_405
.annotate "line", 25
    new $P406, "Undef"
    .lex "$past", $P406
    find_lex $P407, "$/"
    unless_null $P407, vivify_142
    new $P407, "Hash"
  vivify_142:
    set $P408, $P407["nibbler"]
    unless_null $P408, vivify_143
    new $P408, "Undef"
  vivify_143:
    $P409 = $P408."ast"()
    $P410 = "buildsub"($P409)
    store_lex "$past", $P410
.annotate "line", 26
    find_lex $P411, "$past"
    find_lex $P412, "$/"
    $P411."node"($P412)
.annotate "line", 27
    find_lex $P413, "$/"
    find_lex $P414, "$past"
    $P415 = $P413."!make"($P414)
.annotate "line", 24
    .return ($P415)
  control_403:
    .local pmc exception
    .get_results (exception)
    getattribute $P416, exception, "payload"
    .return ($P416)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "nibbler"  :subid("33_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_420
    .param pmc param_421 :optional
    .param int has_param_421 :opt_flag
.annotate "line", 30
    .const 'Sub' $P457 = "35_1258208097.30665"
    capture_lex $P457
    .const 'Sub' $P429 = "34_1258208097.30665"
    capture_lex $P429
    new $P419, 'ExceptionHandler'
    set_addr $P419, control_418
    $P419."handle_types"(58)
    push_eh $P419
    .lex "self", self
    .lex "$/", param_420
    if has_param_421, optparam_144
    new $P422, "Undef"
    set param_421, $P422
  optparam_144:
    .lex "$key", param_421
.annotate "line", 42
    new $P423, "Undef"
    .lex "$past", $P423
.annotate "line", 31
    find_lex $P425, "$key"
    set $S426, $P425
    iseq $I427, $S426, "open"
    unless $I427, if_424_end
    .const 'Sub' $P429 = "34_1258208097.30665"
    capture_lex $P429
    $P429()
  if_424_end:
.annotate "line", 41
    get_global $P439, "@MODIFIERS"
    $P439."shift"()
    find_lex $P440, "$past"
.annotate "line", 43
    find_lex $P442, "$/"
    unless_null $P442, vivify_147
    new $P442, "Hash"
  vivify_147:
    set $P443, $P442["termish"]
    unless_null $P443, vivify_148
    new $P443, "Undef"
  vivify_148:
    set $N444, $P443
    new $P445, "Integer"
    assign $P445, 1
    set $N446, $P445
    isgt $I447, $N444, $N446
    if $I447, if_441
.annotate "line", 50
    find_lex $P466, "$/"
    unless_null $P466, vivify_149
    new $P466, "Hash"
  vivify_149:
    set $P467, $P466["termish"]
    unless_null $P467, vivify_150
    new $P467, "ResizablePMCArray"
  vivify_150:
    set $P468, $P467[0]
    unless_null $P468, vivify_151
    new $P468, "Undef"
  vivify_151:
    $P469 = $P468."ast"()
    store_lex "$past", $P469
.annotate "line", 49
    goto if_441_end
  if_441:
.annotate "line", 44
    get_hll_global $P448, ["PAST"], "Regex"
    find_lex $P449, "$/"
    $P450 = $P448."new"("alt" :named("pasttype"), $P449 :named("node"))
    store_lex "$past", $P450
.annotate "line", 45
    find_lex $P452, "$/"
    unless_null $P452, vivify_152
    new $P452, "Hash"
  vivify_152:
    set $P453, $P452["termish"]
    unless_null $P453, vivify_153
    new $P453, "Undef"
  vivify_153:
    defined $I454, $P453
    unless $I454, for_undef_154
    iter $P451, $P453
    new $P464, 'ExceptionHandler'
    set_addr $P464, loop463_handler
    $P464."handle_types"(65, 67, 66)
    push_eh $P464
  loop463_test:
    unless $P451, loop463_done
    shift $P455, $P451
  loop463_redo:
    .const 'Sub' $P457 = "35_1258208097.30665"
    capture_lex $P457
    $P457($P455)
  loop463_next:
    goto loop463_test
  loop463_handler:
    .local pmc exception
    .get_results (exception)
    getattribute $P465, exception, 'type'
    eq $P465, 65, loop463_next
    eq $P465, 67, loop463_redo
  loop463_done:
    pop_eh
  for_undef_154:
  if_441_end:
.annotate "line", 52
    find_lex $P470, "$/"
    find_lex $P471, "$past"
    $P472 = $P470."!make"($P471)
.annotate "line", 30
    .return ($P472)
  control_418:
    .local pmc exception
    .get_results (exception)
    getattribute $P473, exception, "payload"
    .return ($P473)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block428"  :anon :subid("34_1258208097.30665") :outer("33_1258208097.30665")
.annotate "line", 32
    new $P430, "Hash"
    .lex "%old", $P430
.annotate "line", 33
    new $P431, "Hash"
    .lex "%new", $P431
.annotate "line", 32
    get_global $P432, "@MODIFIERS"
    unless_null $P432, vivify_145
    new $P432, "ResizablePMCArray"
  vivify_145:
    set $P433, $P432[0]
    unless_null $P433, vivify_146
    new $P433, "Undef"
  vivify_146:
    store_lex "%old", $P433
.annotate "line", 33

                       $P0 = find_lex '%old'
                       $P434 = clone $P0

    store_lex "%new", $P434
.annotate "line", 37
    get_global $P435, "@MODIFIERS"
    find_lex $P436, "%new"
    $P435."unshift"($P436)
.annotate "line", 38
    new $P437, "Exception"
    set $P437['type'], 58
    new $P438, "Integer"
    assign $P438, 1
    setattribute $P437, 'payload', $P438
    throw $P437
.annotate "line", 31
    .return ()
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block456"  :anon :subid("35_1258208097.30665") :outer("33_1258208097.30665")
    .param pmc param_458
.annotate "line", 45
    .lex "$_", param_458
.annotate "line", 46
    find_lex $P459, "$past"
    find_lex $P460, "$_"
    $P461 = $P460."ast"()
    $P462 = $P459."push"($P461)
.annotate "line", 45
    .return ($P462)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "termish"  :subid("36_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_477
.annotate "line", 55
    .const 'Sub' $P490 = "37_1258208097.30665"
    capture_lex $P490
    new $P476, 'ExceptionHandler'
    set_addr $P476, control_475
    $P476."handle_types"(58)
    push_eh $P476
    .lex "self", self
    .lex "$/", param_477
.annotate "line", 56
    new $P478, "Undef"
    .lex "$past", $P478
.annotate "line", 57
    new $P479, "Undef"
    .lex "$lastlit", $P479
.annotate "line", 56
    get_hll_global $P480, ["PAST"], "Regex"
    find_lex $P481, "$/"
    $P482 = $P480."new"("concat" :named("pasttype"), $P481 :named("node"))
    store_lex "$past", $P482
.annotate "line", 57
    new $P483, "Integer"
    assign $P483, 0
    store_lex "$lastlit", $P483
.annotate "line", 58
    find_lex $P485, "$/"
    unless_null $P485, vivify_155
    new $P485, "Hash"
  vivify_155:
    set $P486, $P485["noun"]
    unless_null $P486, vivify_156
    new $P486, "Undef"
  vivify_156:
    defined $I487, $P486
    unless $I487, for_undef_157
    iter $P484, $P486
    new $P523, 'ExceptionHandler'
    set_addr $P523, loop522_handler
    $P523."handle_types"(65, 67, 66)
    push_eh $P523
  loop522_test:
    unless $P484, loop522_done
    shift $P488, $P484
  loop522_redo:
    .const 'Sub' $P490 = "37_1258208097.30665"
    capture_lex $P490
    $P490($P488)
  loop522_next:
    goto loop522_test
  loop522_handler:
    .local pmc exception
    .get_results (exception)
    getattribute $P524, exception, 'type'
    eq $P524, 65, loop522_next
    eq $P524, 67, loop522_redo
  loop522_done:
    pop_eh
  for_undef_157:
.annotate "line", 69
    find_lex $P525, "$/"
    find_lex $P526, "$past"
    $P527 = $P525."!make"($P526)
.annotate "line", 55
    .return ($P527)
  control_475:
    .local pmc exception
    .get_results (exception)
    getattribute $P528, exception, "payload"
    .return ($P528)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block489"  :anon :subid("37_1258208097.30665") :outer("36_1258208097.30665")
    .param pmc param_492
.annotate "line", 59
    new $P491, "Undef"
    .lex "$ast", $P491
    .lex "$_", param_492
    find_lex $P493, "$_"
    $P494 = $P493."ast"()
    store_lex "$ast", $P494
.annotate "line", 60
    find_lex $P497, "$ast"
    isfalse $I498, $P497
    if $I498, if_496
.annotate "line", 61
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
.annotate "line", 65
    find_lex $P513, "$past"
    find_lex $P514, "$ast"
    $P513."push"($P514)
.annotate "line", 66
    find_lex $P517, "$ast"
    $S518 = $P517."pasttype"()
    iseq $I519, $S518, "literal"
    if $I519, if_516
    new $P521, "Integer"
    assign $P521, 0
    set $P515, $P521
    goto if_516_end
  if_516:
    find_lex $P520, "$ast"
    set $P515, $P520
  if_516_end:
    store_lex "$lastlit", $P515
.annotate "line", 64
    set $P499, $P515
.annotate "line", 61
    goto if_500_end
  if_500:
.annotate "line", 62
    find_lex $P507, "$lastlit"
    unless_null $P507, vivify_158
    new $P507, "ResizablePMCArray"
  vivify_158:
    set $P508, $P507[0]
    unless_null $P508, vivify_159
    new $P508, "Undef"
  vivify_159:
    find_lex $P509, "$ast"
    unless_null $P509, vivify_160
    new $P509, "ResizablePMCArray"
  vivify_160:
    set $P510, $P509[0]
    unless_null $P510, vivify_161
    new $P510, "Undef"
  vivify_161:
    concat $P511, $P508, $P510
    find_lex $P512, "$lastlit"
    unless_null $P512, vivify_162
    new $P512, "ResizablePMCArray"
    store_lex "$lastlit", $P512
  vivify_162:
    set $P512[0], $P511
.annotate "line", 61
    set $P499, $P511
  if_500_end:
    set $P495, $P499
.annotate "line", 60
    goto if_496_end
  if_496:
  if_496_end:
.annotate "line", 58
    .return ($P495)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantified_atom"  :subid("38_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_532
.annotate "line", 72
    .const 'Sub' $P541 = "39_1258208097.30665"
    capture_lex $P541
    new $P531, 'ExceptionHandler'
    set_addr $P531, control_530
    $P531."handle_types"(58)
    push_eh $P531
    .lex "self", self
    .lex "$/", param_532
.annotate "line", 73
    new $P533, "Undef"
    .lex "$past", $P533
    find_lex $P534, "$/"
    unless_null $P534, vivify_163
    new $P534, "Hash"
  vivify_163:
    set $P535, $P534["atom"]
    unless_null $P535, vivify_164
    new $P535, "Undef"
  vivify_164:
    $P536 = $P535."ast"()
    store_lex "$past", $P536
.annotate "line", 74
    find_lex $P538, "$/"
    unless_null $P538, vivify_165
    new $P538, "Hash"
  vivify_165:
    set $P539, $P538["quantifier"]
    unless_null $P539, vivify_166
    new $P539, "Undef"
  vivify_166:
    if $P539, if_537
.annotate "line", 80
    find_lex $P555, "$/"
    unless_null $P555, vivify_167
    new $P555, "Hash"
  vivify_167:
    set $P556, $P555["backmod"]
    unless_null $P556, vivify_168
    new $P556, "ResizablePMCArray"
  vivify_168:
    set $P557, $P556[0]
    unless_null $P557, vivify_169
    new $P557, "Undef"
  vivify_169:
    unless $P557, if_554_end
    find_lex $P558, "$past"
    find_lex $P559, "$/"
    unless_null $P559, vivify_170
    new $P559, "Hash"
  vivify_170:
    set $P560, $P559["backmod"]
    unless_null $P560, vivify_171
    new $P560, "ResizablePMCArray"
  vivify_171:
    set $P561, $P560[0]
    unless_null $P561, vivify_172
    new $P561, "Undef"
  vivify_172:
    "backmod"($P558, $P561)
  if_554_end:
    goto if_537_end
  if_537:
.annotate "line", 74
    .const 'Sub' $P541 = "39_1258208097.30665"
    capture_lex $P541
    $P541()
  if_537_end:
.annotate "line", 81
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
    unless_null $P571, vivify_176
    new $P571, "ResizablePMCArray"
  vivify_176:
    set $P572, $P571[0]
    unless_null $P572, vivify_177
    new $P572, "Hash"
  vivify_177:
    set $P573, $P572["r"]
    unless_null $P573, vivify_178
    new $P573, "Undef"
  vivify_178:
    set $P563, $P573
  if_564_end:
    unless $P563, if_562_end
.annotate "line", 82
    find_lex $P574, "$past"
    $P574."backtrack"("r")
  if_562_end:
.annotate "line", 84
    find_lex $P575, "$/"
    find_lex $P576, "$past"
    $P577 = $P575."!make"($P576)
.annotate "line", 72
    .return ($P577)
  control_530:
    .local pmc exception
    .get_results (exception)
    getattribute $P578, exception, "payload"
    .return ($P578)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block540"  :anon :subid("39_1258208097.30665") :outer("38_1258208097.30665")
.annotate "line", 76
    new $P542, "Undef"
    .lex "$qast", $P542
.annotate "line", 75
    find_lex $P544, "$past"
    isfalse $I545, $P544
    unless $I545, if_543_end
    find_lex $P546, "$/"
    $P546."panic"("Can't quantify zero-width atom")
  if_543_end:
.annotate "line", 76
    find_lex $P547, "$/"
    unless_null $P547, vivify_173
    new $P547, "Hash"
  vivify_173:
    set $P548, $P547["quantifier"]
    unless_null $P548, vivify_174
    new $P548, "ResizablePMCArray"
  vivify_174:
    set $P549, $P548[0]
    unless_null $P549, vivify_175
    new $P549, "Undef"
  vivify_175:
    $P550 = $P549."ast"()
    store_lex "$qast", $P550
.annotate "line", 77
    find_lex $P551, "$qast"
    find_lex $P552, "$past"
    $P551."unshift"($P552)
.annotate "line", 78
    find_lex $P553, "$qast"
    store_lex "$past", $P553
.annotate "line", 74
    .return ($P553)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "atom"  :subid("40_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_582
.annotate "line", 87
    new $P581, 'ExceptionHandler'
    set_addr $P581, control_580
    $P581."handle_types"(58)
    push_eh $P581
    .lex "self", self
    .lex "$/", param_582
.annotate "line", 88
    new $P583, "Undef"
    .lex "$past", $P583
.annotate "line", 87
    find_lex $P584, "$past"
.annotate "line", 89
    find_lex $P586, "$/"
    unless_null $P586, vivify_179
    new $P586, "Hash"
  vivify_179:
    set $P587, $P586["metachar"]
    unless_null $P587, vivify_180
    new $P587, "Undef"
  vivify_180:
    if $P587, if_585
.annotate "line", 91
    get_hll_global $P591, ["PAST"], "Regex"
    find_lex $P592, "$/"
    set $S593, $P592
    find_lex $P594, "$/"
    $P595 = $P591."new"($S593, "literal" :named("pasttype"), $P594 :named("node"))
    store_lex "$past", $P595
.annotate "line", 92
    get_global $P597, "@MODIFIERS"
    unless_null $P597, vivify_181
    new $P597, "ResizablePMCArray"
  vivify_181:
    set $P598, $P597[0]
    unless_null $P598, vivify_182
    new $P598, "Hash"
  vivify_182:
    set $P599, $P598["i"]
    unless_null $P599, vivify_183
    new $P599, "Undef"
  vivify_183:
    unless $P599, if_596_end
    find_lex $P600, "$past"
    $P600."subtype"("ignorecase")
  if_596_end:
.annotate "line", 90
    goto if_585_end
  if_585:
.annotate "line", 89
    find_lex $P588, "$/"
    unless_null $P588, vivify_184
    new $P588, "Hash"
  vivify_184:
    set $P589, $P588["metachar"]
    unless_null $P589, vivify_185
    new $P589, "Undef"
  vivify_185:
    $P590 = $P589."ast"()
    store_lex "$past", $P590
  if_585_end:
.annotate "line", 94
    find_lex $P601, "$/"
    find_lex $P602, "$past"
    $P603 = $P601."!make"($P602)
.annotate "line", 87
    .return ($P603)
  control_580:
    .local pmc exception
    .get_results (exception)
    getattribute $P604, exception, "payload"
    .return ($P604)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<*>"  :subid("41_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_608
.annotate "line", 97
    new $P607, 'ExceptionHandler'
    set_addr $P607, control_606
    $P607."handle_types"(58)
    push_eh $P607
    .lex "self", self
    .lex "$/", param_608
.annotate "line", 98
    new $P609, "Undef"
    .lex "$past", $P609
    get_hll_global $P610, ["PAST"], "Regex"
    find_lex $P611, "$/"
    $P612 = $P610."new"("quant" :named("pasttype"), $P611 :named("node"))
    store_lex "$past", $P612
.annotate "line", 99
    find_lex $P613, "$/"
    find_lex $P614, "$past"
    find_lex $P615, "$/"
    unless_null $P615, vivify_186
    new $P615, "Hash"
  vivify_186:
    set $P616, $P615["backmod"]
    unless_null $P616, vivify_187
    new $P616, "Undef"
  vivify_187:
    $P617 = "backmod"($P614, $P616)
    $P618 = $P613."!make"($P617)
.annotate "line", 97
    .return ($P618)
  control_606:
    .local pmc exception
    .get_results (exception)
    getattribute $P619, exception, "payload"
    .return ($P619)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<+>"  :subid("42_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_623
.annotate "line", 102
    new $P622, 'ExceptionHandler'
    set_addr $P622, control_621
    $P622."handle_types"(58)
    push_eh $P622
    .lex "self", self
    .lex "$/", param_623
.annotate "line", 103
    new $P624, "Undef"
    .lex "$past", $P624
    get_hll_global $P625, ["PAST"], "Regex"
    find_lex $P626, "$/"
    $P627 = $P625."new"("quant" :named("pasttype"), 1 :named("min"), $P626 :named("node"))
    store_lex "$past", $P627
.annotate "line", 104
    find_lex $P628, "$/"
    find_lex $P629, "$past"
    find_lex $P630, "$/"
    unless_null $P630, vivify_188
    new $P630, "Hash"
  vivify_188:
    set $P631, $P630["backmod"]
    unless_null $P631, vivify_189
    new $P631, "Undef"
  vivify_189:
    $P632 = "backmod"($P629, $P631)
    $P633 = $P628."!make"($P632)
.annotate "line", 102
    .return ($P633)
  control_621:
    .local pmc exception
    .get_results (exception)
    getattribute $P634, exception, "payload"
    .return ($P634)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<?>"  :subid("43_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_638
.annotate "line", 107
    new $P637, 'ExceptionHandler'
    set_addr $P637, control_636
    $P637."handle_types"(58)
    push_eh $P637
    .lex "self", self
    .lex "$/", param_638
.annotate "line", 108
    new $P639, "Undef"
    .lex "$past", $P639
    get_hll_global $P640, ["PAST"], "Regex"
    find_lex $P641, "$/"
    $P642 = $P640."new"("quant" :named("pasttype"), 0 :named("min"), 1 :named("max"), $P641 :named("node"))
    store_lex "$past", $P642
.annotate "line", 109
    find_lex $P643, "$/"
    find_lex $P644, "$past"
    find_lex $P645, "$/"
    unless_null $P645, vivify_190
    new $P645, "Hash"
  vivify_190:
    set $P646, $P645["backmod"]
    unless_null $P646, vivify_191
    new $P646, "Undef"
  vivify_191:
    $P647 = "backmod"($P644, $P646)
    $P643."!make"($P647)
.annotate "line", 110
    find_lex $P648, "$/"
    find_lex $P649, "$past"
    $P650 = $P648."!make"($P649)
.annotate "line", 107
    .return ($P650)
  control_636:
    .local pmc exception
    .get_results (exception)
    getattribute $P651, exception, "payload"
    .return ($P651)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<**>"  :subid("44_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_655
.annotate "line", 113
    new $P654, 'ExceptionHandler'
    set_addr $P654, control_653
    $P654."handle_types"(58)
    push_eh $P654
    .lex "self", self
    .lex "$/", param_655
.annotate "line", 114
    new $P656, "Undef"
    .lex "$past", $P656
.annotate "line", 113
    find_lex $P657, "$past"
.annotate "line", 115
    find_lex $P659, "$/"
    unless_null $P659, vivify_192
    new $P659, "Hash"
  vivify_192:
    set $P660, $P659["quantified_atom"]
    unless_null $P660, vivify_193
    new $P660, "Undef"
  vivify_193:
    if $P660, if_658
.annotate "line", 120
    get_hll_global $P667, ["PAST"], "Regex"
    find_lex $P668, "$/"
    unless_null $P668, vivify_194
    new $P668, "Hash"
  vivify_194:
    set $P669, $P668["min"]
    unless_null $P669, vivify_195
    new $P669, "Undef"
  vivify_195:
    set $N670, $P669
    find_lex $P671, "$/"
    $P672 = $P667."new"("quant" :named("pasttype"), $N670 :named("min"), $P671 :named("node"))
    store_lex "$past", $P672
.annotate "line", 121
    find_lex $P674, "$/"
    unless_null $P674, vivify_196
    new $P674, "Hash"
  vivify_196:
    set $P675, $P674["max"]
    unless_null $P675, vivify_197
    new $P675, "Undef"
  vivify_197:
    isfalse $I676, $P675
    if $I676, if_673
.annotate "line", 122
    find_lex $P682, "$/"
    unless_null $P682, vivify_198
    new $P682, "Hash"
  vivify_198:
    set $P683, $P682["max"]
    unless_null $P683, vivify_199
    new $P683, "ResizablePMCArray"
  vivify_199:
    set $P684, $P683[0]
    unless_null $P684, vivify_200
    new $P684, "Undef"
  vivify_200:
    set $S685, $P684
    isne $I686, $S685, "*"
    unless $I686, if_681_end
    find_lex $P687, "$past"
    find_lex $P688, "$/"
    unless_null $P688, vivify_201
    new $P688, "Hash"
  vivify_201:
    set $P689, $P688["max"]
    unless_null $P689, vivify_202
    new $P689, "ResizablePMCArray"
  vivify_202:
    set $P690, $P689[0]
    unless_null $P690, vivify_203
    new $P690, "Undef"
  vivify_203:
    set $N691, $P690
    $P687."max"($N691)
  if_681_end:
    goto if_673_end
  if_673:
.annotate "line", 121
    find_lex $P677, "$past"
    find_lex $P678, "$/"
    unless_null $P678, vivify_204
    new $P678, "Hash"
  vivify_204:
    set $P679, $P678["min"]
    unless_null $P679, vivify_205
    new $P679, "Undef"
  vivify_205:
    set $N680, $P679
    $P677."max"($N680)
  if_673_end:
.annotate "line", 119
    goto if_658_end
  if_658:
.annotate "line", 116
    get_hll_global $P661, ["PAST"], "Regex"
.annotate "line", 117
    find_lex $P662, "$/"
    unless_null $P662, vivify_206
    new $P662, "Hash"
  vivify_206:
    set $P663, $P662["quantified_atom"]
    unless_null $P663, vivify_207
    new $P663, "Undef"
  vivify_207:
    $P664 = $P663."ast"()
    find_lex $P665, "$/"
    $P666 = $P661."new"("quant" :named("pasttype"), 1 :named("min"), $P664 :named("sep"), $P665 :named("node"))
.annotate "line", 116
    store_lex "$past", $P666
  if_658_end:
.annotate "line", 124
    find_lex $P692, "$/"
    find_lex $P693, "$past"
    find_lex $P694, "$/"
    unless_null $P694, vivify_208
    new $P694, "Hash"
  vivify_208:
    set $P695, $P694["backmod"]
    unless_null $P695, vivify_209
    new $P695, "Undef"
  vivify_209:
    $P696 = "backmod"($P693, $P695)
    $P697 = $P692."!make"($P696)
.annotate "line", 113
    .return ($P697)
  control_653:
    .local pmc exception
    .get_results (exception)
    getattribute $P698, exception, "payload"
    .return ($P698)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<ws>"  :subid("45_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_702
.annotate "line", 127
    new $P701, 'ExceptionHandler'
    set_addr $P701, control_700
    $P701."handle_types"(58)
    push_eh $P701
    .lex "self", self
    .lex "$/", param_702
.annotate "line", 128
    new $P703, "Undef"
    .lex "$past", $P703
.annotate "line", 129
    get_global $P706, "@MODIFIERS"
    unless_null $P706, vivify_210
    new $P706, "ResizablePMCArray"
  vivify_210:
    set $P707, $P706[0]
    unless_null $P707, vivify_211
    new $P707, "Hash"
  vivify_211:
    set $P708, $P707["s"]
    unless_null $P708, vivify_212
    new $P708, "Undef"
  vivify_212:
    if $P708, if_705
    new $P712, "Integer"
    assign $P712, 0
    set $P704, $P712
    goto if_705_end
  if_705:
    get_hll_global $P709, ["PAST"], "Regex"
    find_lex $P710, "$/"
    $P711 = $P709."new"("ws", "subrule" :named("pasttype"), "method" :named("subtype"), $P710 :named("node"))
    set $P704, $P711
  if_705_end:
    store_lex "$past", $P704
.annotate "line", 132
    find_lex $P713, "$/"
    find_lex $P714, "$past"
    $P715 = $P713."!make"($P714)
.annotate "line", 127
    .return ($P715)
  control_700:
    .local pmc exception
    .get_results (exception)
    getattribute $P716, exception, "payload"
    .return ($P716)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<[ ]>"  :subid("46_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_720
.annotate "line", 136
    new $P719, 'ExceptionHandler'
    set_addr $P719, control_718
    $P719."handle_types"(58)
    push_eh $P719
    .lex "self", self
    .lex "$/", param_720
.annotate "line", 137
    find_lex $P721, "$/"
    find_lex $P722, "$/"
    unless_null $P722, vivify_213
    new $P722, "Hash"
  vivify_213:
    set $P723, $P722["nibbler"]
    unless_null $P723, vivify_214
    new $P723, "Undef"
  vivify_214:
    $P724 = $P723."ast"()
    $P725 = $P721."!make"($P724)
.annotate "line", 136
    .return ($P725)
  control_718:
    .local pmc exception
    .get_results (exception)
    getattribute $P726, exception, "payload"
    .return ($P726)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<( )>"  :subid("47_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_730
.annotate "line", 140
    new $P729, 'ExceptionHandler'
    set_addr $P729, control_728
    $P729."handle_types"(58)
    push_eh $P729
    .lex "self", self
    .lex "$/", param_730
.annotate "line", 141
    new $P731, "Undef"
    .lex "$subpast", $P731
.annotate "line", 142
    new $P732, "Undef"
    .lex "$past", $P732
.annotate "line", 141
    find_lex $P733, "$/"
    unless_null $P733, vivify_215
    new $P733, "Hash"
  vivify_215:
    set $P734, $P733["nibbler"]
    unless_null $P734, vivify_216
    new $P734, "Undef"
  vivify_216:
    $P735 = $P734."ast"()
    $P736 = "buildsub"($P735)
    store_lex "$subpast", $P736
.annotate "line", 142
    get_hll_global $P737, ["PAST"], "Regex"
    find_lex $P738, "$subpast"
    find_lex $P739, "$/"
    $P740 = $P737."new"($P738, "subrule" :named("pasttype"), "capture" :named("subtype"), $P739 :named("node"))
    store_lex "$past", $P740
.annotate "line", 144
    find_lex $P741, "$/"
    find_lex $P742, "$past"
    $P743 = $P741."!make"($P742)
.annotate "line", 140
    .return ($P743)
  control_728:
    .local pmc exception
    .get_results (exception)
    getattribute $P744, exception, "payload"
    .return ($P744)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<'>"  :subid("48_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_748
.annotate "line", 147
    new $P747, 'ExceptionHandler'
    set_addr $P747, control_746
    $P747."handle_types"(58)
    push_eh $P747
    .lex "self", self
    .lex "$/", param_748
.annotate "line", 148
    new $P749, "Undef"
    .lex "$past", $P749
    get_hll_global $P750, ["PAST"], "Regex"
    find_lex $P751, "$/"
    unless_null $P751, vivify_217
    new $P751, "Hash"
  vivify_217:
    set $P752, $P751["quote"]
    unless_null $P752, vivify_218
    new $P752, "Hash"
  vivify_218:
    set $P753, $P752["val"]
    unless_null $P753, vivify_219
    new $P753, "Undef"
  vivify_219:
    set $S754, $P753
    find_lex $P755, "$/"
    $P756 = $P750."new"($S754, "literal" :named("pasttype"), $P755 :named("node"))
    store_lex "$past", $P756
.annotate "line", 149
    find_lex $P757, "$/"
    find_lex $P758, "$past"
    $P759 = $P757."!make"($P758)
.annotate "line", 147
    .return ($P759)
  control_746:
    .local pmc exception
    .get_results (exception)
    getattribute $P760, exception, "payload"
    .return ($P760)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<.>"  :subid("49_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_764
.annotate "line", 152
    new $P763, 'ExceptionHandler'
    set_addr $P763, control_762
    $P763."handle_types"(58)
    push_eh $P763
    .lex "self", self
    .lex "$/", param_764
.annotate "line", 153
    new $P765, "Undef"
    .lex "$past", $P765
    get_hll_global $P766, ["PAST"], "Regex"
    find_lex $P767, "$/"
    $P768 = $P766."new"("charclass" :named("pasttype"), "." :named("subtype"), $P767 :named("node"))
    store_lex "$past", $P768
.annotate "line", 154
    find_lex $P769, "$/"
    find_lex $P770, "$past"
    $P771 = $P769."!make"($P770)
.annotate "line", 152
    .return ($P771)
  control_762:
    .local pmc exception
    .get_results (exception)
    getattribute $P772, exception, "payload"
    .return ($P772)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<^>"  :subid("50_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_776
.annotate "line", 157
    new $P775, 'ExceptionHandler'
    set_addr $P775, control_774
    $P775."handle_types"(58)
    push_eh $P775
    .lex "self", self
    .lex "$/", param_776
.annotate "line", 158
    new $P777, "Undef"
    .lex "$past", $P777
    get_hll_global $P778, ["PAST"], "Regex"
    find_lex $P779, "$/"
    $P780 = $P778."new"("anchor" :named("pasttype"), "bos" :named("subtype"), $P779 :named("node"))
    store_lex "$past", $P780
.annotate "line", 159
    find_lex $P781, "$/"
    find_lex $P782, "$past"
    $P783 = $P781."!make"($P782)
.annotate "line", 157
    .return ($P783)
  control_774:
    .local pmc exception
    .get_results (exception)
    getattribute $P784, exception, "payload"
    .return ($P784)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<^^>"  :subid("51_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_788
.annotate "line", 162
    new $P787, 'ExceptionHandler'
    set_addr $P787, control_786
    $P787."handle_types"(58)
    push_eh $P787
    .lex "self", self
    .lex "$/", param_788
.annotate "line", 163
    new $P789, "Undef"
    .lex "$past", $P789
    get_hll_global $P790, ["PAST"], "Regex"
    find_lex $P791, "$/"
    $P792 = $P790."new"("anchor" :named("pasttype"), "bol" :named("subtype"), $P791 :named("node"))
    store_lex "$past", $P792
.annotate "line", 164
    find_lex $P793, "$/"
    find_lex $P794, "$past"
    $P795 = $P793."!make"($P794)
.annotate "line", 162
    .return ($P795)
  control_786:
    .local pmc exception
    .get_results (exception)
    getattribute $P796, exception, "payload"
    .return ($P796)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<$>"  :subid("52_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_800
.annotate "line", 167
    new $P799, 'ExceptionHandler'
    set_addr $P799, control_798
    $P799."handle_types"(58)
    push_eh $P799
    .lex "self", self
    .lex "$/", param_800
.annotate "line", 168
    new $P801, "Undef"
    .lex "$past", $P801
    get_hll_global $P802, ["PAST"], "Regex"
    find_lex $P803, "$/"
    $P804 = $P802."new"("anchor" :named("pasttype"), "eos" :named("subtype"), $P803 :named("node"))
    store_lex "$past", $P804
.annotate "line", 169
    find_lex $P805, "$/"
    find_lex $P806, "$past"
    $P807 = $P805."!make"($P806)
.annotate "line", 167
    .return ($P807)
  control_798:
    .local pmc exception
    .get_results (exception)
    getattribute $P808, exception, "payload"
    .return ($P808)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<$$>"  :subid("53_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_812
.annotate "line", 172
    new $P811, 'ExceptionHandler'
    set_addr $P811, control_810
    $P811."handle_types"(58)
    push_eh $P811
    .lex "self", self
    .lex "$/", param_812
.annotate "line", 173
    new $P813, "Undef"
    .lex "$past", $P813
    get_hll_global $P814, ["PAST"], "Regex"
    find_lex $P815, "$/"
    $P816 = $P814."new"("anchor" :named("pasttype"), "eol" :named("subtype"), $P815 :named("node"))
    store_lex "$past", $P816
.annotate "line", 174
    find_lex $P817, "$/"
    find_lex $P818, "$past"
    $P819 = $P817."!make"($P818)
.annotate "line", 172
    .return ($P819)
  control_810:
    .local pmc exception
    .get_results (exception)
    getattribute $P820, exception, "payload"
    .return ($P820)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<:::>"  :subid("54_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_824
.annotate "line", 177
    new $P823, 'ExceptionHandler'
    set_addr $P823, control_822
    $P823."handle_types"(58)
    push_eh $P823
    .lex "self", self
    .lex "$/", param_824
.annotate "line", 178
    new $P825, "Undef"
    .lex "$past", $P825
    get_hll_global $P826, ["PAST"], "Regex"
    find_lex $P827, "$/"
    $P828 = $P826."new"("cut" :named("pasttype"), $P827 :named("node"))
    store_lex "$past", $P828
.annotate "line", 179
    find_lex $P829, "$/"
    find_lex $P830, "$past"
    $P831 = $P829."!make"($P830)
.annotate "line", 177
    .return ($P831)
  control_822:
    .local pmc exception
    .get_results (exception)
    getattribute $P832, exception, "payload"
    .return ($P832)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<lwb>"  :subid("55_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_836
.annotate "line", 182
    new $P835, 'ExceptionHandler'
    set_addr $P835, control_834
    $P835."handle_types"(58)
    push_eh $P835
    .lex "self", self
    .lex "$/", param_836
.annotate "line", 183
    new $P837, "Undef"
    .lex "$past", $P837
    get_hll_global $P838, ["PAST"], "Regex"
    find_lex $P839, "$/"
    $P840 = $P838."new"("anchor" :named("pasttype"), "lwb" :named("subtype"), $P839 :named("node"))
    store_lex "$past", $P840
.annotate "line", 184
    find_lex $P841, "$/"
    find_lex $P842, "$past"
    $P843 = $P841."!make"($P842)
.annotate "line", 182
    .return ($P843)
  control_834:
    .local pmc exception
    .get_results (exception)
    getattribute $P844, exception, "payload"
    .return ($P844)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<rwb>"  :subid("56_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_848
.annotate "line", 187
    new $P847, 'ExceptionHandler'
    set_addr $P847, control_846
    $P847."handle_types"(58)
    push_eh $P847
    .lex "self", self
    .lex "$/", param_848
.annotate "line", 188
    new $P849, "Undef"
    .lex "$past", $P849
    get_hll_global $P850, ["PAST"], "Regex"
    find_lex $P851, "$/"
    $P852 = $P850."new"("anchor" :named("pasttype"), "rwb" :named("subtype"), $P851 :named("node"))
    store_lex "$past", $P852
.annotate "line", 189
    find_lex $P853, "$/"
    find_lex $P854, "$past"
    $P855 = $P853."!make"($P854)
.annotate "line", 187
    .return ($P855)
  control_846:
    .local pmc exception
    .get_results (exception)
    getattribute $P856, exception, "payload"
    .return ($P856)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<bs>"  :subid("57_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_860
.annotate "line", 192
    new $P859, 'ExceptionHandler'
    set_addr $P859, control_858
    $P859."handle_types"(58)
    push_eh $P859
    .lex "self", self
    .lex "$/", param_860
.annotate "line", 193
    find_lex $P861, "$/"
    find_lex $P862, "$/"
    unless_null $P862, vivify_220
    new $P862, "Hash"
  vivify_220:
    set $P863, $P862["backslash"]
    unless_null $P863, vivify_221
    new $P863, "Undef"
  vivify_221:
    $P864 = $P863."ast"()
    $P865 = $P861."!make"($P864)
.annotate "line", 192
    .return ($P865)
  control_858:
    .local pmc exception
    .get_results (exception)
    getattribute $P866, exception, "payload"
    .return ($P866)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<mod>"  :subid("58_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_870
.annotate "line", 196
    new $P869, 'ExceptionHandler'
    set_addr $P869, control_868
    $P869."handle_types"(58)
    push_eh $P869
    .lex "self", self
    .lex "$/", param_870
.annotate "line", 197
    find_lex $P871, "$/"
    find_lex $P872, "$/"
    unless_null $P872, vivify_222
    new $P872, "Hash"
  vivify_222:
    set $P873, $P872["mod_internal"]
    unless_null $P873, vivify_223
    new $P873, "Undef"
  vivify_223:
    $P874 = $P873."ast"()
    $P875 = $P871."!make"($P874)
.annotate "line", 196
    .return ($P875)
  control_868:
    .local pmc exception
    .get_results (exception)
    getattribute $P876, exception, "payload"
    .return ($P876)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<assert>"  :subid("59_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_880
.annotate "line", 200
    new $P879, 'ExceptionHandler'
    set_addr $P879, control_878
    $P879."handle_types"(58)
    push_eh $P879
    .lex "self", self
    .lex "$/", param_880
.annotate "line", 201
    find_lex $P881, "$/"
    find_lex $P882, "$/"
    unless_null $P882, vivify_224
    new $P882, "Hash"
  vivify_224:
    set $P883, $P882["assertion"]
    unless_null $P883, vivify_225
    new $P883, "Undef"
  vivify_225:
    $P884 = $P883."ast"()
    $P885 = $P881."!make"($P884)
.annotate "line", 200
    .return ($P885)
  control_878:
    .local pmc exception
    .get_results (exception)
    getattribute $P886, exception, "payload"
    .return ($P886)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<~>"  :subid("60_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_890
.annotate "line", 204
    new $P889, 'ExceptionHandler'
    set_addr $P889, control_888
    $P889."handle_types"(58)
    push_eh $P889
    .lex "self", self
    .lex "$/", param_890
.annotate "line", 205
    find_lex $P891, "$/"
    get_hll_global $P892, ["PAST"], "Regex"
.annotate "line", 206
    find_lex $P893, "$/"
    unless_null $P893, vivify_226
    new $P893, "Hash"
  vivify_226:
    set $P894, $P893["EXPR"]
    unless_null $P894, vivify_227
    new $P894, "Undef"
  vivify_227:
    $P895 = $P894."ast"()
.annotate "line", 207
    get_hll_global $P896, ["PAST"], "Regex"
.annotate "line", 208
    find_lex $P897, "$/"
    unless_null $P897, vivify_228
    new $P897, "Hash"
  vivify_228:
    set $P898, $P897["GOAL"]
    unless_null $P898, vivify_229
    new $P898, "Undef"
  vivify_229:
    $P899 = $P898."ast"()
.annotate "line", 209
    get_hll_global $P900, ["PAST"], "Regex"
    find_lex $P901, "$/"
    unless_null $P901, vivify_230
    new $P901, "Hash"
  vivify_230:
    set $P902, $P901["GOAL"]
    unless_null $P902, vivify_231
    new $P902, "Undef"
  vivify_231:
    set $S903, $P902
    $P904 = $P900."new"("FAILGOAL", $S903, "subrule" :named("pasttype"), "method" :named("subtype"))
    $P905 = $P896."new"($P899, $P904, "alt" :named("pasttype"))
.annotate "line", 207
    $P906 = $P892."new"($P895, $P905, "concat" :named("pasttype"))
.annotate "line", 205
    $P907 = $P891."!make"($P906)
.annotate "line", 204
    .return ($P907)
  control_888:
    .local pmc exception
    .get_results (exception)
    getattribute $P908, exception, "payload"
    .return ($P908)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<{*}>"  :subid("61_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_912
.annotate "line", 217
    new $P911, 'ExceptionHandler'
    set_addr $P911, control_910
    $P911."handle_types"(58)
    push_eh $P911
    .lex "self", self
    .lex "$/", param_912
.annotate "line", 218
    new $P913, "Undef"
    .lex "$past", $P913
.annotate "line", 219
    find_lex $P916, "$/"
    unless_null $P916, vivify_232
    new $P916, "Hash"
  vivify_232:
    set $P917, $P916["key"]
    unless_null $P917, vivify_233
    new $P917, "Undef"
  vivify_233:
    if $P917, if_915
    new $P925, "Integer"
    assign $P925, 0
    set $P914, $P925
    goto if_915_end
  if_915:
    get_hll_global $P918, ["PAST"], "Regex"
    find_lex $P919, "$/"
    unless_null $P919, vivify_234
    new $P919, "Hash"
  vivify_234:
    set $P920, $P919["key"]
    unless_null $P920, vivify_235
    new $P920, "ResizablePMCArray"
  vivify_235:
    set $P921, $P920[0]
    unless_null $P921, vivify_236
    new $P921, "Undef"
  vivify_236:
    set $S922, $P921
    find_lex $P923, "$/"
    $P924 = $P918."new"($S922, "reduce" :named("pasttype"), $P923 :named("node"))
    set $P914, $P924
  if_915_end:
    store_lex "$past", $P914
.annotate "line", 221
    find_lex $P926, "$/"
    find_lex $P927, "$past"
    $P928 = $P926."!make"($P927)
.annotate "line", 217
    .return ($P928)
  control_910:
    .local pmc exception
    .get_results (exception)
    getattribute $P929, exception, "payload"
    .return ($P929)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<var>"  :subid("62_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_933
.annotate "line", 224
    new $P932, 'ExceptionHandler'
    set_addr $P932, control_931
    $P932."handle_types"(58)
    push_eh $P932
    .lex "self", self
    .lex "$/", param_933
.annotate "line", 225
    new $P934, "Undef"
    .lex "$past", $P934
.annotate "line", 226
    new $P935, "Undef"
    .lex "$name", $P935
.annotate "line", 224
    find_lex $P936, "$past"
.annotate "line", 226
    find_lex $P939, "$/"
    unless_null $P939, vivify_237
    new $P939, "Hash"
  vivify_237:
    set $P940, $P939["pos"]
    unless_null $P940, vivify_238
    new $P940, "Undef"
  vivify_238:
    if $P940, if_938
    find_lex $P944, "$/"
    unless_null $P944, vivify_239
    new $P944, "Hash"
  vivify_239:
    set $P945, $P944["name"]
    unless_null $P945, vivify_240
    new $P945, "Undef"
  vivify_240:
    set $S946, $P945
    new $P937, 'String'
    set $P937, $S946
    goto if_938_end
  if_938:
    find_lex $P941, "$/"
    unless_null $P941, vivify_241
    new $P941, "Hash"
  vivify_241:
    set $P942, $P941["pos"]
    unless_null $P942, vivify_242
    new $P942, "Undef"
  vivify_242:
    set $N943, $P942
    new $P937, 'Float'
    set $P937, $N943
  if_938_end:
    store_lex "$name", $P937
.annotate "line", 227
    find_lex $P948, "$/"
    unless_null $P948, vivify_243
    new $P948, "Hash"
  vivify_243:
    set $P949, $P948["quantified_atom"]
    unless_null $P949, vivify_244
    new $P949, "Undef"
  vivify_244:
    if $P949, if_947
.annotate "line", 238
    get_hll_global $P978, ["PAST"], "Regex"
    find_lex $P979, "$name"
    find_lex $P980, "$/"
    $P981 = $P978."new"("!BACKREF", $P979, "subrule" :named("pasttype"), "method" :named("subtype"), $P980 :named("node"))
    store_lex "$past", $P981
.annotate "line", 237
    goto if_947_end
  if_947:
.annotate "line", 228
    find_lex $P950, "$/"
    unless_null $P950, vivify_245
    new $P950, "Hash"
  vivify_245:
    set $P951, $P950["quantified_atom"]
    unless_null $P951, vivify_246
    new $P951, "ResizablePMCArray"
  vivify_246:
    set $P952, $P951[0]
    unless_null $P952, vivify_247
    new $P952, "Undef"
  vivify_247:
    $P953 = $P952."ast"()
    store_lex "$past", $P953
.annotate "line", 229
    find_lex $P957, "$past"
    $S958 = $P957."pasttype"()
    iseq $I959, $S958, "quant"
    if $I959, if_956
    new $P955, 'Integer'
    set $P955, $I959
    goto if_956_end
  if_956:
    find_lex $P960, "$past"
    unless_null $P960, vivify_248
    new $P960, "ResizablePMCArray"
  vivify_248:
    set $P961, $P960[0]
    unless_null $P961, vivify_249
    new $P961, "Undef"
  vivify_249:
    $S962 = $P961."pasttype"()
    iseq $I963, $S962, "subrule"
    new $P955, 'Integer'
    set $P955, $I963
  if_956_end:
    if $P955, if_954
.annotate "line", 232
    find_lex $P968, "$past"
    $S969 = $P968."pasttype"()
    iseq $I970, $S969, "subrule"
    if $I970, if_967
.annotate "line", 234
    get_hll_global $P973, ["PAST"], "Regex"
    find_lex $P974, "$past"
    find_lex $P975, "$name"
    find_lex $P976, "$/"
    $P977 = $P973."new"($P974, $P975 :named("name"), "subcapture" :named("pasttype"), $P976 :named("node"))
    store_lex "$past", $P977
.annotate "line", 233
    goto if_967_end
  if_967:
.annotate "line", 232
    find_lex $P971, "$past"
    find_lex $P972, "$name"
    "subrule_alias"($P971, $P972)
  if_967_end:
    goto if_954_end
  if_954:
.annotate "line", 230
    find_lex $P964, "$past"
    unless_null $P964, vivify_250
    new $P964, "ResizablePMCArray"
  vivify_250:
    set $P965, $P964[0]
    unless_null $P965, vivify_251
    new $P965, "Undef"
  vivify_251:
    find_lex $P966, "$name"
    "subrule_alias"($P965, $P966)
  if_954_end:
  if_947_end:
.annotate "line", 241
    find_lex $P982, "$/"
    find_lex $P983, "$past"
    $P984 = $P982."!make"($P983)
.annotate "line", 224
    .return ($P984)
  control_931:
    .local pmc exception
    .get_results (exception)
    getattribute $P985, exception, "payload"
    .return ($P985)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<PIR>"  :subid("63_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_989
.annotate "line", 244
    new $P988, 'ExceptionHandler'
    set_addr $P988, control_987
    $P988."handle_types"(58)
    push_eh $P988
    .lex "self", self
    .lex "$/", param_989
.annotate "line", 245
    find_lex $P990, "$/"
    get_hll_global $P991, ["PAST"], "Regex"
.annotate "line", 246
    get_hll_global $P992, ["PAST"], "Op"
    find_lex $P993, "$/"
    unless_null $P993, vivify_252
    new $P993, "Hash"
  vivify_252:
    set $P994, $P993["pir"]
    unless_null $P994, vivify_253
    new $P994, "Undef"
  vivify_253:
    set $S995, $P994
    $P996 = $P992."new"($S995 :named("inline"), "inline" :named("pasttype"))
    find_lex $P997, "$/"
    $P998 = $P991."new"($P996, "pastnode" :named("pasttype"), $P997 :named("node"))
.annotate "line", 245
    $P999 = $P990."!make"($P998)
.annotate "line", 244
    .return ($P999)
  control_987:
    .local pmc exception
    .get_results (exception)
    getattribute $P1000, exception, "payload"
    .return ($P1000)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<w>"  :subid("64_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_1004
.annotate "line", 252
    new $P1003, 'ExceptionHandler'
    set_addr $P1003, control_1002
    $P1003."handle_types"(58)
    push_eh $P1003
    .lex "self", self
    .lex "$/", param_1004
.annotate "line", 253
    new $P1005, "Undef"
    .lex "$subtype", $P1005
.annotate "line", 254
    new $P1006, "Undef"
    .lex "$past", $P1006
.annotate "line", 253
    find_lex $P1009, "$/"
    unless_null $P1009, vivify_254
    new $P1009, "Hash"
  vivify_254:
    set $P1010, $P1009["sym"]
    unless_null $P1010, vivify_255
    new $P1010, "Undef"
  vivify_255:
    set $S1011, $P1010
    iseq $I1012, $S1011, "n"
    if $I1012, if_1008
    find_lex $P1014, "$/"
    unless_null $P1014, vivify_256
    new $P1014, "Hash"
  vivify_256:
    set $P1015, $P1014["sym"]
    unless_null $P1015, vivify_257
    new $P1015, "Undef"
  vivify_257:
    set $S1016, $P1015
    new $P1007, 'String'
    set $P1007, $S1016
    goto if_1008_end
  if_1008:
    new $P1013, "String"
    assign $P1013, "nl"
    set $P1007, $P1013
  if_1008_end:
    store_lex "$subtype", $P1007
.annotate "line", 254
    get_hll_global $P1017, ["PAST"], "Regex"
    find_lex $P1018, "$subtype"
    find_lex $P1019, "$/"
    $P1020 = $P1017."new"("charclass" :named("pasttype"), $P1018 :named("subtype"), $P1019 :named("node"))
    store_lex "$past", $P1020
.annotate "line", 255
    find_lex $P1021, "$/"
    find_lex $P1022, "$past"
    $P1023 = $P1021."!make"($P1022)
.annotate "line", 252
    .return ($P1023)
  control_1002:
    .local pmc exception
    .get_results (exception)
    getattribute $P1024, exception, "payload"
    .return ($P1024)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<b>"  :subid("65_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_1028
.annotate "line", 258
    new $P1027, 'ExceptionHandler'
    set_addr $P1027, control_1026
    $P1027."handle_types"(58)
    push_eh $P1027
    .lex "self", self
    .lex "$/", param_1028
.annotate "line", 259
    new $P1029, "Undef"
    .lex "$past", $P1029
    get_hll_global $P1030, ["PAST"], "Regex"
.annotate "line", 260
    find_lex $P1031, "$/"
    unless_null $P1031, vivify_258
    new $P1031, "Hash"
  vivify_258:
    set $P1032, $P1031["sym"]
    unless_null $P1032, vivify_259
    new $P1032, "Undef"
  vivify_259:
    set $S1033, $P1032
    iseq $I1034, $S1033, "B"
    find_lex $P1035, "$/"
    $P1036 = $P1030."new"("\b", "enumcharlist" :named("pasttype"), $I1034 :named("negate"), $P1035 :named("node"))
.annotate "line", 259
    store_lex "$past", $P1036
.annotate "line", 261
    find_lex $P1037, "$/"
    find_lex $P1038, "$past"
    $P1039 = $P1037."!make"($P1038)
.annotate "line", 258
    .return ($P1039)
  control_1026:
    .local pmc exception
    .get_results (exception)
    getattribute $P1040, exception, "payload"
    .return ($P1040)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<e>"  :subid("66_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_1044
.annotate "line", 264
    new $P1043, 'ExceptionHandler'
    set_addr $P1043, control_1042
    $P1043."handle_types"(58)
    push_eh $P1043
    .lex "self", self
    .lex "$/", param_1044
.annotate "line", 265
    new $P1045, "Undef"
    .lex "$past", $P1045
    get_hll_global $P1046, ["PAST"], "Regex"
.annotate "line", 266
    find_lex $P1047, "$/"
    unless_null $P1047, vivify_260
    new $P1047, "Hash"
  vivify_260:
    set $P1048, $P1047["sym"]
    unless_null $P1048, vivify_261
    new $P1048, "Undef"
  vivify_261:
    set $S1049, $P1048
    iseq $I1050, $S1049, "E"
    find_lex $P1051, "$/"
    $P1052 = $P1046."new"("\\e", "enumcharlist" :named("pasttype"), $I1050 :named("negate"), $P1051 :named("node"))
.annotate "line", 265
    store_lex "$past", $P1052
.annotate "line", 267
    find_lex $P1053, "$/"
    find_lex $P1054, "$past"
    $P1055 = $P1053."!make"($P1054)
.annotate "line", 264
    .return ($P1055)
  control_1042:
    .local pmc exception
    .get_results (exception)
    getattribute $P1056, exception, "payload"
    .return ($P1056)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<f>"  :subid("67_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_1060
.annotate "line", 270
    new $P1059, 'ExceptionHandler'
    set_addr $P1059, control_1058
    $P1059."handle_types"(58)
    push_eh $P1059
    .lex "self", self
    .lex "$/", param_1060
.annotate "line", 271
    new $P1061, "Undef"
    .lex "$past", $P1061
    get_hll_global $P1062, ["PAST"], "Regex"
.annotate "line", 272
    find_lex $P1063, "$/"
    unless_null $P1063, vivify_262
    new $P1063, "Hash"
  vivify_262:
    set $P1064, $P1063["sym"]
    unless_null $P1064, vivify_263
    new $P1064, "Undef"
  vivify_263:
    set $S1065, $P1064
    iseq $I1066, $S1065, "F"
    find_lex $P1067, "$/"
    $P1068 = $P1062."new"("\\f", "enumcharlist" :named("pasttype"), $I1066 :named("negate"), $P1067 :named("node"))
.annotate "line", 271
    store_lex "$past", $P1068
.annotate "line", 273
    find_lex $P1069, "$/"
    find_lex $P1070, "$past"
    $P1071 = $P1069."!make"($P1070)
.annotate "line", 270
    .return ($P1071)
  control_1058:
    .local pmc exception
    .get_results (exception)
    getattribute $P1072, exception, "payload"
    .return ($P1072)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<h>"  :subid("68_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_1076
.annotate "line", 276
    new $P1075, 'ExceptionHandler'
    set_addr $P1075, control_1074
    $P1075."handle_types"(58)
    push_eh $P1075
    .lex "self", self
    .lex "$/", param_1076
.annotate "line", 277
    new $P1077, "Undef"
    .lex "$past", $P1077
    get_hll_global $P1078, ["PAST"], "Regex"
.annotate "line", 278
    find_lex $P1079, "$/"
    unless_null $P1079, vivify_264
    new $P1079, "Hash"
  vivify_264:
    set $P1080, $P1079["sym"]
    unless_null $P1080, vivify_265
    new $P1080, "Undef"
  vivify_265:
    set $S1081, $P1080
    iseq $I1082, $S1081, "H"
    find_lex $P1083, "$/"
    $P1084 = $P1078."new"(unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", "enumcharlist" :named("pasttype"), $I1082 :named("negate"), $P1083 :named("node"))
.annotate "line", 277
    store_lex "$past", $P1084
.annotate "line", 279
    find_lex $P1085, "$/"
    find_lex $P1086, "$past"
    $P1087 = $P1085."!make"($P1086)
.annotate "line", 276
    .return ($P1087)
  control_1074:
    .local pmc exception
    .get_results (exception)
    getattribute $P1088, exception, "payload"
    .return ($P1088)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<r>"  :subid("69_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_1092
.annotate "line", 282
    new $P1091, 'ExceptionHandler'
    set_addr $P1091, control_1090
    $P1091."handle_types"(58)
    push_eh $P1091
    .lex "self", self
    .lex "$/", param_1092
.annotate "line", 283
    new $P1093, "Undef"
    .lex "$past", $P1093
    get_hll_global $P1094, ["PAST"], "Regex"
.annotate "line", 284
    find_lex $P1095, "$/"
    unless_null $P1095, vivify_266
    new $P1095, "Hash"
  vivify_266:
    set $P1096, $P1095["sym"]
    unless_null $P1096, vivify_267
    new $P1096, "Undef"
  vivify_267:
    set $S1097, $P1096
    iseq $I1098, $S1097, "R"
    find_lex $P1099, "$/"
    $P1100 = $P1094."new"("\r", "enumcharlist" :named("pasttype"), $I1098 :named("negate"), $P1099 :named("node"))
.annotate "line", 283
    store_lex "$past", $P1100
.annotate "line", 285
    find_lex $P1101, "$/"
    find_lex $P1102, "$past"
    $P1103 = $P1101."!make"($P1102)
.annotate "line", 282
    .return ($P1103)
  control_1090:
    .local pmc exception
    .get_results (exception)
    getattribute $P1104, exception, "payload"
    .return ($P1104)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<t>"  :subid("70_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_1108
.annotate "line", 288
    new $P1107, 'ExceptionHandler'
    set_addr $P1107, control_1106
    $P1107."handle_types"(58)
    push_eh $P1107
    .lex "self", self
    .lex "$/", param_1108
.annotate "line", 289
    new $P1109, "Undef"
    .lex "$past", $P1109
    get_hll_global $P1110, ["PAST"], "Regex"
.annotate "line", 290
    find_lex $P1111, "$/"
    unless_null $P1111, vivify_268
    new $P1111, "Hash"
  vivify_268:
    set $P1112, $P1111["sym"]
    unless_null $P1112, vivify_269
    new $P1112, "Undef"
  vivify_269:
    set $S1113, $P1112
    iseq $I1114, $S1113, "T"
    find_lex $P1115, "$/"
    $P1116 = $P1110."new"("\t", "enumcharlist" :named("pasttype"), $I1114 :named("negate"), $P1115 :named("node"))
.annotate "line", 289
    store_lex "$past", $P1116
.annotate "line", 291
    find_lex $P1117, "$/"
    find_lex $P1118, "$past"
    $P1119 = $P1117."!make"($P1118)
.annotate "line", 288
    .return ($P1119)
  control_1106:
    .local pmc exception
    .get_results (exception)
    getattribute $P1120, exception, "payload"
    .return ($P1120)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<v>"  :subid("71_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_1124
.annotate "line", 294
    new $P1123, 'ExceptionHandler'
    set_addr $P1123, control_1122
    $P1123."handle_types"(58)
    push_eh $P1123
    .lex "self", self
    .lex "$/", param_1124
.annotate "line", 295
    new $P1125, "Undef"
    .lex "$past", $P1125
    get_hll_global $P1126, ["PAST"], "Regex"
.annotate "line", 297
    find_lex $P1127, "$/"
    unless_null $P1127, vivify_270
    new $P1127, "Hash"
  vivify_270:
    set $P1128, $P1127["sym"]
    unless_null $P1128, vivify_271
    new $P1128, "Undef"
  vivify_271:
    set $S1129, $P1128
    iseq $I1130, $S1129, "V"
    find_lex $P1131, "$/"
    $P1132 = $P1126."new"(unicode:"\n\x{b}\f\r\x{85}\u2028\u2029", "enumcharlist" :named("pasttype"), $I1130 :named("negate"), $P1131 :named("node"))
.annotate "line", 295
    store_lex "$past", $P1132
.annotate "line", 298
    find_lex $P1133, "$/"
    find_lex $P1134, "$past"
    $P1135 = $P1133."!make"($P1134)
.annotate "line", 294
    .return ($P1135)
  control_1122:
    .local pmc exception
    .get_results (exception)
    getattribute $P1136, exception, "payload"
    .return ($P1136)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<o>"  :subid("72_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_1140
.annotate "line", 301
    new $P1139, 'ExceptionHandler'
    set_addr $P1139, control_1138
    $P1139."handle_types"(58)
    push_eh $P1139
    .lex "self", self
    .lex "$/", param_1140
.annotate "line", 302
    new $P1141, "Undef"
    .lex "$octlit", $P1141
.annotate "line", 303
    get_hll_global $P1142, ["HLL";"Actions"], "ints_to_string"
    find_lex $P1145, "$/"
    unless_null $P1145, vivify_272
    new $P1145, "Hash"
  vivify_272:
    set $P1146, $P1145["octint"]
    unless_null $P1146, vivify_273
    new $P1146, "Undef"
  vivify_273:
    unless $P1146, unless_1144
    set $P1143, $P1146
    goto unless_1144_end
  unless_1144:
    find_lex $P1147, "$/"
    unless_null $P1147, vivify_274
    new $P1147, "Hash"
  vivify_274:
    set $P1148, $P1147["octints"]
    unless_null $P1148, vivify_275
    new $P1148, "Hash"
  vivify_275:
    set $P1149, $P1148["octint"]
    unless_null $P1149, vivify_276
    new $P1149, "Undef"
  vivify_276:
    set $P1143, $P1149
  unless_1144_end:
    $P1150 = $P1142($P1143)
    store_lex "$octlit", $P1150
.annotate "line", 304
    find_lex $P1151, "$/"
    find_lex $P1154, "$/"
    unless_null $P1154, vivify_277
    new $P1154, "Hash"
  vivify_277:
    set $P1155, $P1154["sym"]
    unless_null $P1155, vivify_278
    new $P1155, "Undef"
  vivify_278:
    set $S1156, $P1155
    iseq $I1157, $S1156, "O"
    if $I1157, if_1153
.annotate "line", 307
    get_hll_global $P1162, ["PAST"], "Regex"
    find_lex $P1163, "$octlit"
    find_lex $P1164, "$/"
    $P1165 = $P1162."new"($P1163, "literal" :named("pasttype"), $P1164 :named("node"))
    set $P1152, $P1165
.annotate "line", 304
    goto if_1153_end
  if_1153:
.annotate "line", 305
    get_hll_global $P1158, ["PAST"], "Regex"
    find_lex $P1159, "$octlit"
    find_lex $P1160, "$/"
    $P1161 = $P1158."new"($P1159, "enumcharlist" :named("pasttype"), 1 :named("negate"), $P1160 :named("node"))
    set $P1152, $P1161
  if_1153_end:
    $P1166 = $P1151."!make"($P1152)
.annotate "line", 301
    .return ($P1166)
  control_1138:
    .local pmc exception
    .get_results (exception)
    getattribute $P1167, exception, "payload"
    .return ($P1167)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<x>"  :subid("73_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_1171
.annotate "line", 310
    new $P1170, 'ExceptionHandler'
    set_addr $P1170, control_1169
    $P1170."handle_types"(58)
    push_eh $P1170
    .lex "self", self
    .lex "$/", param_1171
.annotate "line", 311
    new $P1172, "Undef"
    .lex "$hexlit", $P1172
.annotate "line", 312
    get_hll_global $P1173, ["HLL";"Actions"], "ints_to_string"
    find_lex $P1176, "$/"
    unless_null $P1176, vivify_279
    new $P1176, "Hash"
  vivify_279:
    set $P1177, $P1176["hexint"]
    unless_null $P1177, vivify_280
    new $P1177, "Undef"
  vivify_280:
    unless $P1177, unless_1175
    set $P1174, $P1177
    goto unless_1175_end
  unless_1175:
    find_lex $P1178, "$/"
    unless_null $P1178, vivify_281
    new $P1178, "Hash"
  vivify_281:
    set $P1179, $P1178["hexints"]
    unless_null $P1179, vivify_282
    new $P1179, "Hash"
  vivify_282:
    set $P1180, $P1179["hexint"]
    unless_null $P1180, vivify_283
    new $P1180, "Undef"
  vivify_283:
    set $P1174, $P1180
  unless_1175_end:
    $P1181 = $P1173($P1174)
    store_lex "$hexlit", $P1181
.annotate "line", 313
    find_lex $P1182, "$/"
    find_lex $P1185, "$/"
    unless_null $P1185, vivify_284
    new $P1185, "Hash"
  vivify_284:
    set $P1186, $P1185["sym"]
    unless_null $P1186, vivify_285
    new $P1186, "Undef"
  vivify_285:
    set $S1187, $P1186
    iseq $I1188, $S1187, "X"
    if $I1188, if_1184
.annotate "line", 316
    get_hll_global $P1193, ["PAST"], "Regex"
    find_lex $P1194, "$hexlit"
    find_lex $P1195, "$/"
    $P1196 = $P1193."new"($P1194, "literal" :named("pasttype"), $P1195 :named("node"))
    set $P1183, $P1196
.annotate "line", 313
    goto if_1184_end
  if_1184:
.annotate "line", 314
    get_hll_global $P1189, ["PAST"], "Regex"
    find_lex $P1190, "$hexlit"
    find_lex $P1191, "$/"
    $P1192 = $P1189."new"($P1190, "enumcharlist" :named("pasttype"), 1 :named("negate"), $P1191 :named("node"))
    set $P1183, $P1192
  if_1184_end:
    $P1197 = $P1182."!make"($P1183)
.annotate "line", 310
    .return ($P1197)
  control_1169:
    .local pmc exception
    .get_results (exception)
    getattribute $P1198, exception, "payload"
    .return ($P1198)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<misc>"  :subid("74_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_1202
.annotate "line", 319
    new $P1201, 'ExceptionHandler'
    set_addr $P1201, control_1200
    $P1201."handle_types"(58)
    push_eh $P1201
    .lex "self", self
    .lex "$/", param_1202
.annotate "line", 320
    new $P1203, "Undef"
    .lex "$past", $P1203
    get_hll_global $P1204, ["PAST"], "Regex"
    find_lex $P1205, "$/"
    set $S1206, $P1205
    find_lex $P1207, "$/"
    $P1208 = $P1204."new"($S1206, "literal" :named("pasttype"), $P1207 :named("node"))
    store_lex "$past", $P1208
.annotate "line", 321
    find_lex $P1209, "$/"
    find_lex $P1210, "$past"
    $P1211 = $P1209."!make"($P1210)
.annotate "line", 319
    .return ($P1211)
  control_1200:
    .local pmc exception
    .get_results (exception)
    getattribute $P1212, exception, "payload"
    .return ($P1212)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<?>"  :subid("75_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_1216
.annotate "line", 325
    new $P1215, 'ExceptionHandler'
    set_addr $P1215, control_1214
    $P1215."handle_types"(58)
    push_eh $P1215
    .lex "self", self
    .lex "$/", param_1216
.annotate "line", 326
    new $P1217, "Undef"
    .lex "$past", $P1217
.annotate "line", 325
    find_lex $P1218, "$past"
.annotate "line", 327
    find_lex $P1220, "$/"
    unless_null $P1220, vivify_286
    new $P1220, "Hash"
  vivify_286:
    set $P1221, $P1220["assertion"]
    unless_null $P1221, vivify_287
    new $P1221, "Undef"
  vivify_287:
    if $P1221, if_1219
.annotate "line", 331
    new $P1226, "Integer"
    assign $P1226, 0
    store_lex "$past", $P1226
    goto if_1219_end
  if_1219:
.annotate "line", 328
    find_lex $P1222, "$/"
    unless_null $P1222, vivify_288
    new $P1222, "Hash"
  vivify_288:
    set $P1223, $P1222["assertion"]
    unless_null $P1223, vivify_289
    new $P1223, "Undef"
  vivify_289:
    $P1224 = $P1223."ast"()
    store_lex "$past", $P1224
.annotate "line", 329
    find_lex $P1225, "$past"
    $P1225."subtype"("zerowidth")
  if_1219_end:
.annotate "line", 332
    find_lex $P1227, "$/"
    find_lex $P1228, "$past"
    $P1229 = $P1227."!make"($P1228)
.annotate "line", 325
    .return ($P1229)
  control_1214:
    .local pmc exception
    .get_results (exception)
    getattribute $P1230, exception, "payload"
    .return ($P1230)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<!>"  :subid("76_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_1234
.annotate "line", 335
    new $P1233, 'ExceptionHandler'
    set_addr $P1233, control_1232
    $P1233."handle_types"(58)
    push_eh $P1233
    .lex "self", self
    .lex "$/", param_1234
.annotate "line", 336
    new $P1235, "Undef"
    .lex "$past", $P1235
.annotate "line", 335
    find_lex $P1236, "$past"
.annotate "line", 337
    find_lex $P1238, "$/"
    unless_null $P1238, vivify_290
    new $P1238, "Hash"
  vivify_290:
    set $P1239, $P1238["assertion"]
    unless_null $P1239, vivify_291
    new $P1239, "Undef"
  vivify_291:
    if $P1239, if_1237
.annotate "line", 343
    get_hll_global $P1248, ["PAST"], "Regex"
    find_lex $P1249, "$/"
    $P1250 = $P1248."new"("anchor" :named("pasttype"), "fail" :named("subtype"), $P1249 :named("node"))
    store_lex "$past", $P1250
.annotate "line", 342
    goto if_1237_end
  if_1237:
.annotate "line", 338
    find_lex $P1240, "$/"
    unless_null $P1240, vivify_292
    new $P1240, "Hash"
  vivify_292:
    set $P1241, $P1240["assertion"]
    unless_null $P1241, vivify_293
    new $P1241, "Undef"
  vivify_293:
    $P1242 = $P1241."ast"()
    store_lex "$past", $P1242
.annotate "line", 339
    find_lex $P1243, "$past"
    find_lex $P1244, "$past"
    $P1245 = $P1244."negate"()
    isfalse $I1246, $P1245
    $P1243."negate"($I1246)
.annotate "line", 340
    find_lex $P1247, "$past"
    $P1247."subtype"("zerowidth")
  if_1237_end:
.annotate "line", 345
    find_lex $P1251, "$/"
    find_lex $P1252, "$past"
    $P1253 = $P1251."!make"($P1252)
.annotate "line", 335
    .return ($P1253)
  control_1232:
    .local pmc exception
    .get_results (exception)
    getattribute $P1254, exception, "payload"
    .return ($P1254)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<method>"  :subid("77_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_1258
.annotate "line", 348
    new $P1257, 'ExceptionHandler'
    set_addr $P1257, control_1256
    $P1257."handle_types"(58)
    push_eh $P1257
    .lex "self", self
    .lex "$/", param_1258
.annotate "line", 349
    new $P1259, "Undef"
    .lex "$past", $P1259
    find_lex $P1260, "$/"
    unless_null $P1260, vivify_294
    new $P1260, "Hash"
  vivify_294:
    set $P1261, $P1260["assertion"]
    unless_null $P1261, vivify_295
    new $P1261, "Undef"
  vivify_295:
    $P1262 = $P1261."ast"()
    store_lex "$past", $P1262
.annotate "line", 350
    find_lex $P1263, "$past"
    $P1263."subtype"("method")
.annotate "line", 351
    find_lex $P1264, "$past"
    $P1264."name"("")
.annotate "line", 352
    find_lex $P1265, "$/"
    find_lex $P1266, "$past"
    $P1267 = $P1265."!make"($P1266)
.annotate "line", 348
    .return ($P1267)
  control_1256:
    .local pmc exception
    .get_results (exception)
    getattribute $P1268, exception, "payload"
    .return ($P1268)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<name>"  :subid("78_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_1272
.annotate "line", 355
    .const 'Sub' $P1330 = "80_1258208097.30665"
    capture_lex $P1330
    .const 'Sub' $P1294 = "79_1258208097.30665"
    capture_lex $P1294
    new $P1271, 'ExceptionHandler'
    set_addr $P1271, control_1270
    $P1271."handle_types"(58)
    push_eh $P1271
    .lex "self", self
    .lex "$/", param_1272
.annotate "line", 356
    new $P1273, "Undef"
    .lex "$name", $P1273
.annotate "line", 357
    new $P1274, "Undef"
    .lex "$past", $P1274
.annotate "line", 356
    find_lex $P1275, "$/"
    unless_null $P1275, vivify_296
    new $P1275, "Hash"
  vivify_296:
    set $P1276, $P1275["longname"]
    unless_null $P1276, vivify_297
    new $P1276, "Undef"
  vivify_297:
    set $S1277, $P1276
    new $P1278, 'String'
    set $P1278, $S1277
    store_lex "$name", $P1278
    find_lex $P1279, "$past"
.annotate "line", 358
    find_lex $P1281, "$/"
    unless_null $P1281, vivify_298
    new $P1281, "Hash"
  vivify_298:
    set $P1282, $P1281["assertion"]
    unless_null $P1282, vivify_299
    new $P1282, "Undef"
  vivify_299:
    if $P1282, if_1280
.annotate "line", 362
    find_lex $P1290, "$name"
    set $S1291, $P1290
    iseq $I1292, $S1291, "sym"
    if $I1292, if_1289
.annotate "line", 378
    get_hll_global $P1304, ["PAST"], "Regex"
    find_lex $P1305, "$name"
    find_lex $P1306, "$name"
    find_lex $P1307, "$/"
    $P1308 = $P1304."new"($P1305, $P1306 :named("name"), "subrule" :named("pasttype"), "capture" :named("subtype"), $P1307 :named("node"))
    store_lex "$past", $P1308
.annotate "line", 380
    find_lex $P1310, "$/"
    unless_null $P1310, vivify_300
    new $P1310, "Hash"
  vivify_300:
    set $P1311, $P1310["nibbler"]
    unless_null $P1311, vivify_301
    new $P1311, "Undef"
  vivify_301:
    if $P1311, if_1309
.annotate "line", 383
    find_lex $P1319, "$/"
    unless_null $P1319, vivify_302
    new $P1319, "Hash"
  vivify_302:
    set $P1320, $P1319["arglist"]
    unless_null $P1320, vivify_303
    new $P1320, "Undef"
  vivify_303:
    unless $P1320, if_1318_end
.annotate "line", 384
    find_lex $P1322, "$/"
    unless_null $P1322, vivify_304
    new $P1322, "Hash"
  vivify_304:
    set $P1323, $P1322["arglist"]
    unless_null $P1323, vivify_305
    new $P1323, "ResizablePMCArray"
  vivify_305:
    set $P1324, $P1323[0]
    unless_null $P1324, vivify_306
    new $P1324, "Undef"
  vivify_306:
    $P1325 = $P1324."ast"()
    $P1326 = $P1325."list"()
    defined $I1327, $P1326
    unless $I1327, for_undef_307
    iter $P1321, $P1326
    new $P1336, 'ExceptionHandler'
    set_addr $P1336, loop1335_handler
    $P1336."handle_types"(65, 67, 66)
    push_eh $P1336
  loop1335_test:
    unless $P1321, loop1335_done
    shift $P1328, $P1321
  loop1335_redo:
    .const 'Sub' $P1330 = "80_1258208097.30665"
    capture_lex $P1330
    $P1330($P1328)
  loop1335_next:
    goto loop1335_test
  loop1335_handler:
    .local pmc exception
    .get_results (exception)
    getattribute $P1337, exception, 'type'
    eq $P1337, 65, loop1335_next
    eq $P1337, 67, loop1335_redo
  loop1335_done:
    pop_eh
  for_undef_307:
  if_1318_end:
.annotate "line", 383
    goto if_1309_end
  if_1309:
.annotate "line", 381
    find_lex $P1312, "$past"
    find_lex $P1313, "$/"
    unless_null $P1313, vivify_308
    new $P1313, "Hash"
  vivify_308:
    set $P1314, $P1313["nibbler"]
    unless_null $P1314, vivify_309
    new $P1314, "ResizablePMCArray"
  vivify_309:
    set $P1315, $P1314[0]
    unless_null $P1315, vivify_310
    new $P1315, "Undef"
  vivify_310:
    $P1316 = $P1315."ast"()
    $P1317 = "buildsub"($P1316)
    $P1312."push"($P1317)
  if_1309_end:
.annotate "line", 377
    goto if_1289_end
  if_1289:
.annotate "line", 362
    .const 'Sub' $P1294 = "79_1258208097.30665"
    capture_lex $P1294
    $P1294()
  if_1289_end:
    goto if_1280_end
  if_1280:
.annotate "line", 359
    find_lex $P1283, "$/"
    unless_null $P1283, vivify_311
    new $P1283, "Hash"
  vivify_311:
    set $P1284, $P1283["assertion"]
    unless_null $P1284, vivify_312
    new $P1284, "ResizablePMCArray"
  vivify_312:
    set $P1285, $P1284[0]
    unless_null $P1285, vivify_313
    new $P1285, "Undef"
  vivify_313:
    $P1286 = $P1285."ast"()
    store_lex "$past", $P1286
.annotate "line", 360
    find_lex $P1287, "$past"
    find_lex $P1288, "$name"
    "subrule_alias"($P1287, $P1288)
  if_1280_end:
.annotate "line", 387
    find_lex $P1338, "$/"
    find_lex $P1339, "$past"
    $P1340 = $P1338."!make"($P1339)
.annotate "line", 355
    .return ($P1340)
  control_1270:
    .local pmc exception
    .get_results (exception)
    getattribute $P1341, exception, "payload"
    .return ($P1341)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1329"  :anon :subid("80_1258208097.30665") :outer("78_1258208097.30665")
    .param pmc param_1331
.annotate "line", 384
    .lex "$_", param_1331
    find_lex $P1332, "$past"
    find_lex $P1333, "$_"
    $P1334 = $P1332."push"($P1333)
    .return ($P1334)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1293"  :anon :subid("79_1258208097.30665") :outer("78_1258208097.30665")
.annotate "line", 363
    new $P1295, "Undef"
    .lex "$regexsym", $P1295

            $P0 = get_global '$REGEXNAME'
            $S0 = $P0
            $I0 = index $S0, ':sym<'
            add $I0, 5
            $S0 = substr $S0, $I0
            chopn $S0, 1
            $P1296 = box $S0

    store_lex "$regexsym", $P1296
.annotate "line", 372
    get_hll_global $P1297, ["PAST"], "Regex"
.annotate "line", 373
    get_hll_global $P1298, ["PAST"], "Regex"
    find_lex $P1299, "$regexsym"
    $P1300 = $P1298."new"($P1299, "literal" :named("pasttype"))
    find_lex $P1301, "$name"
    find_lex $P1302, "$/"
    $P1303 = $P1297."new"($P1300, $P1301 :named("name"), "subcapture" :named("pasttype"), $P1302 :named("node"))
.annotate "line", 372
    store_lex "$past", $P1303
.annotate "line", 362
    .return ($P1303)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<[>"  :subid("81_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_1345
.annotate "line", 390
    .const 'Sub' $P1380 = "82_1258208097.30665"
    capture_lex $P1380
    new $P1344, 'ExceptionHandler'
    set_addr $P1344, control_1343
    $P1344."handle_types"(58)
    push_eh $P1344
    .lex "self", self
    .lex "$/", param_1345
.annotate "line", 391
    new $P1346, "Undef"
    .lex "$clist", $P1346
.annotate "line", 392
    new $P1347, "Undef"
    .lex "$past", $P1347
.annotate "line", 401
    new $P1348, "Undef"
    .lex "$i", $P1348
.annotate "line", 402
    new $P1349, "Undef"
    .lex "$n", $P1349
.annotate "line", 391
    find_lex $P1350, "$/"
    unless_null $P1350, vivify_314
    new $P1350, "Hash"
  vivify_314:
    set $P1351, $P1350["cclass_elem"]
    unless_null $P1351, vivify_315
    new $P1351, "Undef"
  vivify_315:
    store_lex "$clist", $P1351
.annotate "line", 392
    find_lex $P1352, "$clist"
    unless_null $P1352, vivify_316
    new $P1352, "ResizablePMCArray"
  vivify_316:
    set $P1353, $P1352[0]
    unless_null $P1353, vivify_317
    new $P1353, "Undef"
  vivify_317:
    $P1354 = $P1353."ast"()
    store_lex "$past", $P1354
.annotate "line", 393
    find_lex $P1358, "$past"
    $P1359 = $P1358."negate"()
    if $P1359, if_1357
    set $P1356, $P1359
    goto if_1357_end
  if_1357:
    find_lex $P1360, "$past"
    $S1361 = $P1360."pasttype"()
    iseq $I1362, $S1361, "subrule"
    new $P1356, 'Integer'
    set $P1356, $I1362
  if_1357_end:
    unless $P1356, if_1355_end
.annotate "line", 394
    find_lex $P1363, "$past"
    $P1363."subtype"("zerowidth")
.annotate "line", 395
    get_hll_global $P1364, ["PAST"], "Regex"
    find_lex $P1365, "$past"
.annotate "line", 397
    get_hll_global $P1366, ["PAST"], "Regex"
    $P1367 = $P1366."new"("charclass" :named("pasttype"), "." :named("subtype"))
    find_lex $P1368, "$/"
    $P1369 = $P1364."new"($P1365, $P1367, $P1368 :named("node"))
.annotate "line", 395
    store_lex "$past", $P1369
  if_1355_end:
.annotate "line", 401
    new $P1370, "Integer"
    assign $P1370, 1
    store_lex "$i", $P1370
.annotate "line", 402
    find_lex $P1371, "$clist"
    set $N1372, $P1371
    new $P1373, 'Float'
    set $P1373, $N1372
    store_lex "$n", $P1373
.annotate "line", 403
    new $P1404, 'ExceptionHandler'
    set_addr $P1404, loop1403_handler
    $P1404."handle_types"(65, 67, 66)
    push_eh $P1404
  loop1403_test:
    find_lex $P1374, "$i"
    set $N1375, $P1374
    find_lex $P1376, "$n"
    set $N1377, $P1376
    islt $I1378, $N1375, $N1377
    unless $I1378, loop1403_done
  loop1403_redo:
    .const 'Sub' $P1380 = "82_1258208097.30665"
    capture_lex $P1380
    $P1380()
  loop1403_next:
    goto loop1403_test
  loop1403_handler:
    .local pmc exception
    .get_results (exception)
    getattribute $P1405, exception, 'type'
    eq $P1405, 65, loop1403_next
    eq $P1405, 67, loop1403_redo
  loop1403_done:
    pop_eh
.annotate "line", 414
    find_lex $P1406, "$/"
    find_lex $P1407, "$past"
    $P1408 = $P1406."!make"($P1407)
.annotate "line", 390
    .return ($P1408)
  control_1343:
    .local pmc exception
    .get_results (exception)
    getattribute $P1409, exception, "payload"
    .return ($P1409)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1379"  :anon :subid("82_1258208097.30665") :outer("81_1258208097.30665")
.annotate "line", 404
    new $P1381, "Undef"
    .lex "$ast", $P1381
    find_lex $P1382, "$i"
    set $I1383, $P1382
    find_lex $P1384, "$clist"
    unless_null $P1384, vivify_318
    new $P1384, "ResizablePMCArray"
  vivify_318:
    set $P1385, $P1384[$I1383]
    unless_null $P1385, vivify_319
    new $P1385, "Undef"
  vivify_319:
    $P1386 = $P1385."ast"()
    store_lex "$ast", $P1386
.annotate "line", 405
    find_lex $P1388, "$ast"
    $P1389 = $P1388."negate"()
    if $P1389, if_1387
.annotate "line", 410
    get_hll_global $P1396, ["PAST"], "Regex"
    find_lex $P1397, "$past"
    find_lex $P1398, "$ast"
    find_lex $P1399, "$/"
    $P1400 = $P1396."new"($P1397, $P1398, "alt" :named("pasttype"), $P1399 :named("node"))
    store_lex "$past", $P1400
.annotate "line", 409
    goto if_1387_end
  if_1387:
.annotate "line", 406
    find_lex $P1390, "$ast"
    $P1390."subtype"("zerowidth")
.annotate "line", 407
    get_hll_global $P1391, ["PAST"], "Regex"
    find_lex $P1392, "$ast"
    find_lex $P1393, "$past"
    find_lex $P1394, "$/"
    $P1395 = $P1391."new"($P1392, $P1393, "concat" :named("pasttype"), $P1394 :named("node"))
    store_lex "$past", $P1395
  if_1387_end:
.annotate "line", 412
    find_lex $P1401, "$i"
    add $P1402, $P1401, 1
    store_lex "$i", $P1402
.annotate "line", 403
    .return ($P1402)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "cclass_elem"  :subid("83_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_1413
.annotate "line", 417
    .const 'Sub' $P1438 = "85_1258208097.30665"
    capture_lex $P1438
    .const 'Sub' $P1422 = "84_1258208097.30665"
    capture_lex $P1422
    new $P1412, 'ExceptionHandler'
    set_addr $P1412, control_1411
    $P1412."handle_types"(58)
    push_eh $P1412
    .lex "self", self
    .lex "$/", param_1413
.annotate "line", 418
    new $P1414, "Undef"
    .lex "$str", $P1414
.annotate "line", 419
    new $P1415, "Undef"
    .lex "$past", $P1415
.annotate "line", 418
    new $P1416, "String"
    assign $P1416, ""
    store_lex "$str", $P1416
    find_lex $P1417, "$past"
.annotate "line", 420
    find_lex $P1419, "$/"
    unless_null $P1419, vivify_320
    new $P1419, "Hash"
  vivify_320:
    set $P1420, $P1419["name"]
    unless_null $P1420, vivify_321
    new $P1420, "Undef"
  vivify_321:
    if $P1420, if_1418
.annotate "line", 424
    find_lex $P1433, "$/"
    unless_null $P1433, vivify_322
    new $P1433, "Hash"
  vivify_322:
    set $P1434, $P1433["charspec"]
    unless_null $P1434, vivify_323
    new $P1434, "Undef"
  vivify_323:
    defined $I1435, $P1434
    unless $I1435, for_undef_324
    iter $P1432, $P1434
    new $P1464, 'ExceptionHandler'
    set_addr $P1464, loop1463_handler
    $P1464."handle_types"(65, 67, 66)
    push_eh $P1464
  loop1463_test:
    unless $P1432, loop1463_done
    shift $P1436, $P1432
  loop1463_redo:
    .const 'Sub' $P1438 = "85_1258208097.30665"
    capture_lex $P1438
    $P1438($P1436)
  loop1463_next:
    goto loop1463_test
  loop1463_handler:
    .local pmc exception
    .get_results (exception)
    getattribute $P1465, exception, 'type'
    eq $P1465, 65, loop1463_next
    eq $P1465, 67, loop1463_redo
  loop1463_done:
    pop_eh
  for_undef_324:
.annotate "line", 449
    get_hll_global $P1466, ["PAST"], "Regex"
    find_lex $P1467, "$str"
    find_lex $P1468, "$/"
    $P1469 = $P1466."new"($P1467, "enumcharlist" :named("pasttype"), $P1468 :named("node"))
    store_lex "$past", $P1469
.annotate "line", 423
    goto if_1418_end
  if_1418:
.annotate "line", 420
    .const 'Sub' $P1422 = "84_1258208097.30665"
    capture_lex $P1422
    $P1422()
  if_1418_end:
.annotate "line", 451
    find_lex $P1470, "$past"
    find_lex $P1471, "$/"
    unless_null $P1471, vivify_336
    new $P1471, "Hash"
  vivify_336:
    set $P1472, $P1471["sign"]
    unless_null $P1472, vivify_337
    new $P1472, "Undef"
  vivify_337:
    set $S1473, $P1472
    iseq $I1474, $S1473, "-"
    $P1470."negate"($I1474)
.annotate "line", 452
    find_lex $P1475, "$/"
    find_lex $P1476, "$past"
    $P1477 = $P1475."!make"($P1476)
.annotate "line", 417
    .return ($P1477)
  control_1411:
    .local pmc exception
    .get_results (exception)
    getattribute $P1478, exception, "payload"
    .return ($P1478)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1437"  :anon :subid("85_1258208097.30665") :outer("83_1258208097.30665")
    .param pmc param_1439
.annotate "line", 424
    .const 'Sub' $P1445 = "86_1258208097.30665"
    capture_lex $P1445
    .lex "$_", param_1439
.annotate "line", 425
    find_lex $P1442, "$_"
    unless_null $P1442, vivify_325
    new $P1442, "ResizablePMCArray"
  vivify_325:
    set $P1443, $P1442[1]
    unless_null $P1443, vivify_326
    new $P1443, "Undef"
  vivify_326:
    if $P1443, if_1441
.annotate "line", 447
    find_lex $P1459, "$str"
    find_lex $P1460, "$_"
    unless_null $P1460, vivify_327
    new $P1460, "ResizablePMCArray"
  vivify_327:
    set $P1461, $P1460[0]
    unless_null $P1461, vivify_328
    new $P1461, "Undef"
  vivify_328:
    concat $P1462, $P1459, $P1461
    store_lex "$str", $P1462
    set $P1440, $P1462
.annotate "line", 425
    goto if_1441_end
  if_1441:
    .const 'Sub' $P1445 = "86_1258208097.30665"
    capture_lex $P1445
    $P1458 = $P1445()
    set $P1440, $P1458
  if_1441_end:
.annotate "line", 424
    .return ($P1440)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1444"  :anon :subid("86_1258208097.30665") :outer("85_1258208097.30665")
.annotate "line", 426
    new $P1446, "Undef"
    .lex "$a", $P1446
.annotate "line", 427
    new $P1447, "Undef"
    .lex "$b", $P1447
.annotate "line", 428
    new $P1448, "Undef"
    .lex "$c", $P1448
.annotate "line", 426
    find_lex $P1449, "$_"
    unless_null $P1449, vivify_329
    new $P1449, "ResizablePMCArray"
  vivify_329:
    set $P1450, $P1449[0]
    unless_null $P1450, vivify_330
    new $P1450, "Undef"
  vivify_330:
    store_lex "$a", $P1450
.annotate "line", 427
    find_lex $P1451, "$_"
    unless_null $P1451, vivify_331
    new $P1451, "ResizablePMCArray"
  vivify_331:
    set $P1452, $P1451[1]
    unless_null $P1452, vivify_332
    new $P1452, "ResizablePMCArray"
  vivify_332:
    set $P1453, $P1452[0]
    unless_null $P1453, vivify_333
    new $P1453, "Undef"
  vivify_333:
    store_lex "$b", $P1453
.annotate "line", 428

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
                             $P1454 = box $S2

    store_lex "$c", $P1454
.annotate "line", 445
    find_lex $P1455, "$str"
    find_lex $P1456, "$c"
    concat $P1457, $P1455, $P1456
    store_lex "$str", $P1457
.annotate "line", 425
    .return ($P1457)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1421"  :anon :subid("84_1258208097.30665") :outer("83_1258208097.30665")
.annotate "line", 421
    new $P1423, "Undef"
    .lex "$name", $P1423
    find_lex $P1424, "$/"
    unless_null $P1424, vivify_334
    new $P1424, "Hash"
  vivify_334:
    set $P1425, $P1424["name"]
    unless_null $P1425, vivify_335
    new $P1425, "Undef"
  vivify_335:
    set $S1426, $P1425
    new $P1427, 'String'
    set $P1427, $S1426
    store_lex "$name", $P1427
.annotate "line", 422
    get_hll_global $P1428, ["PAST"], "Regex"
    find_lex $P1429, "$name"
    find_lex $P1430, "$/"
    $P1431 = $P1428."new"($P1429, "subrule" :named("pasttype"), "method" :named("subtype"), $P1430 :named("node"))
    store_lex "$past", $P1431
.annotate "line", 420
    .return ($P1431)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "mod_internal"  :subid("87_1258208097.30665") :method :outer("11_1258208097.30665")
    .param pmc param_1482
.annotate "line", 455
    new $P1481, 'ExceptionHandler'
    set_addr $P1481, control_1480
    $P1481."handle_types"(58)
    push_eh $P1481
    .lex "self", self
    .lex "$/", param_1482
.annotate "line", 456
    new $P1483, "Hash"
    .lex "%mods", $P1483
.annotate "line", 457
    new $P1484, "Undef"
    .lex "$n", $P1484
.annotate "line", 456
    get_global $P1485, "@MODIFIERS"
    unless_null $P1485, vivify_338
    new $P1485, "ResizablePMCArray"
  vivify_338:
    set $P1486, $P1485[0]
    unless_null $P1486, vivify_339
    new $P1486, "Undef"
  vivify_339:
    store_lex "%mods", $P1486
.annotate "line", 457
    find_lex $P1489, "$/"
    unless_null $P1489, vivify_340
    new $P1489, "Hash"
  vivify_340:
    set $P1490, $P1489["n"]
    unless_null $P1490, vivify_341
    new $P1490, "ResizablePMCArray"
  vivify_341:
    set $P1491, $P1490[0]
    unless_null $P1491, vivify_342
    new $P1491, "Undef"
  vivify_342:
    set $S1492, $P1491
    isgt $I1493, $S1492, ""
    if $I1493, if_1488
    new $P1498, "Integer"
    assign $P1498, 1
    set $P1487, $P1498
    goto if_1488_end
  if_1488:
    find_lex $P1494, "$/"
    unless_null $P1494, vivify_343
    new $P1494, "Hash"
  vivify_343:
    set $P1495, $P1494["n"]
    unless_null $P1495, vivify_344
    new $P1495, "ResizablePMCArray"
  vivify_344:
    set $P1496, $P1495[0]
    unless_null $P1496, vivify_345
    new $P1496, "Undef"
  vivify_345:
    set $N1497, $P1496
    new $P1487, 'Float'
    set $P1487, $N1497
  if_1488_end:
    store_lex "$n", $P1487
.annotate "line", 458
    find_lex $P1499, "$n"
    find_lex $P1500, "$/"
    unless_null $P1500, vivify_346
    new $P1500, "Hash"
  vivify_346:
    set $P1501, $P1500["mod_ident"]
    unless_null $P1501, vivify_347
    new $P1501, "Hash"
  vivify_347:
    set $P1502, $P1501["sym"]
    unless_null $P1502, vivify_348
    new $P1502, "Undef"
  vivify_348:
    set $S1503, $P1502
    find_lex $P1504, "%mods"
    unless_null $P1504, vivify_349
    new $P1504, "Hash"
    store_lex "%mods", $P1504
  vivify_349:
    set $P1504[$S1503], $P1499
.annotate "line", 459
    find_lex $P1505, "$/"
    $P1506 = $P1505."!make"(0)
.annotate "line", 455
    .return ($P1506)
  control_1480:
    .local pmc exception
    .get_results (exception)
    getattribute $P1507, exception, "payload"
    .return ($P1507)
    rethrow exception
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
