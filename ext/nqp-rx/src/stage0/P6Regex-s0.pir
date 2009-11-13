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
.sub "_block11"  :anon :subid("10_1258128993.11955")
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
.sub "" :load :init :subid("post158") :outer("10_1258128993.11955")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1258128993.11955" 
    .local pmc block
    set block, $P12
    $P524 = get_root_global ["parrot"], "P6metaclass"
    $P524."new_class"("Regex::P6Regex::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block13"  :subid("11_1258128993.11955") :outer("10_1258128993.11955")
.annotate "line", 3
    .const 'Sub' $P516 = "156_1258128993.11955" 
    capture_lex $P516
    .const 'Sub' $P509 = "154_1258128993.11955" 
    capture_lex $P509
    .const 'Sub' $P502 = "152_1258128993.11955" 
    capture_lex $P502
    .const 'Sub' $P482 = "147_1258128993.11955" 
    capture_lex $P482
    .const 'Sub' $P448 = "141_1258128993.11955" 
    capture_lex $P448
    .const 'Sub' $P437 = "138_1258128993.11955" 
    capture_lex $P437
    .const 'Sub' $P425 = "135_1258128993.11955" 
    capture_lex $P425
    .const 'Sub' $P420 = "133_1258128993.11955" 
    capture_lex $P420
    .const 'Sub' $P410 = "130_1258128993.11955" 
    capture_lex $P410
    .const 'Sub' $P400 = "127_1258128993.11955" 
    capture_lex $P400
    .const 'Sub' $P392 = "123_1258128993.11955" 
    capture_lex $P392
    .const 'Sub' $P387 = "121_1258128993.11955" 
    capture_lex $P387
    .const 'Sub' $P382 = "119_1258128993.11955" 
    capture_lex $P382
    .const 'Sub' $P377 = "117_1258128993.11955" 
    capture_lex $P377
    .const 'Sub' $P372 = "115_1258128993.11955" 
    capture_lex $P372
    .const 'Sub' $P362 = "113_1258128993.11955" 
    capture_lex $P362
    .const 'Sub' $P352 = "111_1258128993.11955" 
    capture_lex $P352
    .const 'Sub' $P345 = "109_1258128993.11955" 
    capture_lex $P345
    .const 'Sub' $P340 = "107_1258128993.11955" 
    capture_lex $P340
    .const 'Sub' $P335 = "105_1258128993.11955" 
    capture_lex $P335
    .const 'Sub' $P330 = "103_1258128993.11955" 
    capture_lex $P330
    .const 'Sub' $P325 = "101_1258128993.11955" 
    capture_lex $P325
    .const 'Sub' $P320 = "99_1258128993.11955" 
    capture_lex $P320
    .const 'Sub' $P315 = "97_1258128993.11955" 
    capture_lex $P315
    .const 'Sub' $P310 = "95_1258128993.11955" 
    capture_lex $P310
    .const 'Sub' $P305 = "93_1258128993.11955" 
    capture_lex $P305
    .const 'Sub' $P294 = "89_1258128993.11955" 
    capture_lex $P294
    .const 'Sub' $P283 = "87_1258128993.11955" 
    capture_lex $P283
    .const 'Sub' $P277 = "85_1258128993.11955" 
    capture_lex $P277
    .const 'Sub' $P261 = "83_1258128993.11955" 
    capture_lex $P261
    .const 'Sub' $P255 = "81_1258128993.11955" 
    capture_lex $P255
    .const 'Sub' $P250 = "79_1258128993.11955" 
    capture_lex $P250
    .const 'Sub' $P245 = "77_1258128993.11955" 
    capture_lex $P245
    .const 'Sub' $P239 = "75_1258128993.11955" 
    capture_lex $P239
    .const 'Sub' $P233 = "73_1258128993.11955" 
    capture_lex $P233
    .const 'Sub' $P227 = "71_1258128993.11955" 
    capture_lex $P227
    .const 'Sub' $P221 = "69_1258128993.11955" 
    capture_lex $P221
    .const 'Sub' $P216 = "67_1258128993.11955" 
    capture_lex $P216
    .const 'Sub' $P211 = "65_1258128993.11955" 
    capture_lex $P211
    .const 'Sub' $P206 = "63_1258128993.11955" 
    capture_lex $P206
    .const 'Sub' $P201 = "61_1258128993.11955" 
    capture_lex $P201
    .const 'Sub' $P196 = "59_1258128993.11955" 
    capture_lex $P196
    .const 'Sub' $P191 = "57_1258128993.11955" 
    capture_lex $P191
    .const 'Sub' $P186 = "55_1258128993.11955" 
    capture_lex $P186
    .const 'Sub' $P181 = "53_1258128993.11955" 
    capture_lex $P181
    .const 'Sub' $P176 = "51_1258128993.11955" 
    capture_lex $P176
    .const 'Sub' $P161 = "46_1258128993.11955" 
    capture_lex $P161
    .const 'Sub' $P150 = "44_1258128993.11955" 
    capture_lex $P150
    .const 'Sub' $P144 = "42_1258128993.11955" 
    capture_lex $P144
    .const 'Sub' $P138 = "40_1258128993.11955" 
    capture_lex $P138
    .const 'Sub' $P132 = "38_1258128993.11955" 
    capture_lex $P132
    .const 'Sub' $P114 = "33_1258128993.11955" 
    capture_lex $P114
    .const 'Sub' $P102 = "30_1258128993.11955" 
    capture_lex $P102
    .const 'Sub' $P96 = "28_1258128993.11955" 
    capture_lex $P96
    .const 'Sub' $P85 = "26_1258128993.11955" 
    capture_lex $P85
    .const 'Sub' $P79 = "24_1258128993.11955" 
    capture_lex $P79
    .const 'Sub' $P68 = "22_1258128993.11955" 
    capture_lex $P68
    .const 'Sub' $P61 = "20_1258128993.11955" 
    capture_lex $P61
    .const 'Sub' $P54 = "18_1258128993.11955" 
    capture_lex $P54
    .const 'Sub' $P45 = "15_1258128993.11955" 
    capture_lex $P45
    .const 'Sub' $P38 = "13_1258128993.11955" 
    capture_lex $P38
    .const 'Sub' $P15 = "12_1258128993.11955" 
    capture_lex $P15
    .const 'Sub' $P516 = "156_1258128993.11955" 
    capture_lex $P516
    .return ($P516)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "obs"  :subid("12_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "ws"  :subid("13_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__ws"  :subid("14_1258128993.11955") :method
.annotate "line", 3
    new $P41, "ResizablePMCArray"
    push $P41, ""
    .return ($P41)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "normspace"  :subid("15_1258128993.11955") :method :outer("11_1258128993.11955")
.annotate "line", 3
    .const 'Sub' $P50 = "17_1258128993.11955" 
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
    .const 'Sub' $P50 = "17_1258128993.11955" 
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
.sub "!PREFIX__normspace"  :subid("16_1258128993.11955") :method
.annotate "line", 3
    new $P48, "ResizablePMCArray"
    push $P48, ""
    .return ($P48)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block49"  :anon :subid("17_1258128993.11955") :method :outer("15_1258128993.11955")
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
.sub "quote"  :subid("18_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__quote"  :subid("19_1258128993.11955") :method
.annotate "line", 3
    new $P57, "ResizablePMCArray"
    push $P57, "'"
    .return ($P57)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "arg"  :subid("20_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__arg"  :subid("21_1258128993.11955") :method
.annotate "line", 3
    $P64 = self."!PREFIX__!subrule"("quote", "")
    new $P65, "ResizablePMCArray"
    push $P65, ""
    push $P65, $P64
    .return ($P65)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "arglist"  :subid("22_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__arglist"  :subid("23_1258128993.11955") :method
.annotate "line", 3
    new $P71, "ResizablePMCArray"
    push $P71, ""
    .return ($P71)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "TOP"  :subid("24_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__TOP"  :subid("25_1258128993.11955") :method
.annotate "line", 3
    $P82 = self."!PREFIX__!subrule"("nibbler", "")
    new $P83, "ResizablePMCArray"
    push $P83, $P82
    .return ($P83)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "nibbler"  :subid("26_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__nibbler"  :subid("27_1258128993.11955") :method
.annotate "line", 3
    new $P88, "ResizablePMCArray"
    push $P88, ""
    .return ($P88)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "termish"  :subid("28_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__termish"  :subid("29_1258128993.11955") :method
.annotate "line", 3
    new $P99, "ResizablePMCArray"
    push $P99, ""
    .return ($P99)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantified_atom"  :subid("30_1258128993.11955") :method :outer("11_1258128993.11955")
.annotate "line", 3
    .const 'Sub' $P110 = "32_1258128993.11955" 
    capture_lex $P110
    .local string rx103_tgt
    .local int rx103_pos
    .local int rx103_off
    .local int rx103_eos
    .local int rx103_rep
    .local pmc rx103_cur
    (rx103_cur, rx103_pos, rx103_tgt, $I10) = self."!cursor_start"()
    rx103_cur."!cursor_debug"("START ", "quantified_atom")
    rx103_cur."!cursor_caparray"("quantifier", "backmod")
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
    .const 'Sub' $P110 = "32_1258128993.11955" 
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
.sub "!PREFIX__quantified_atom"  :subid("31_1258128993.11955") :method
.annotate "line", 3
    $P105 = self."!PREFIX__!subrule"("atom", "")
    new $P106, "ResizablePMCArray"
    push $P106, $P105
    .return ($P106)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block109"  :anon :subid("32_1258128993.11955") :method :outer("30_1258128993.11955")
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
.sub "atom"  :subid("33_1258128993.11955") :method :outer("11_1258128993.11955")
.annotate "line", 3
    .const 'Sub' $P124 = "35_1258128993.11955" 
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
    .const 'Sub' $P124 = "35_1258128993.11955" 
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
.sub "!PREFIX__atom"  :subid("34_1258128993.11955") :method
.annotate "line", 3
    $P117 = self."!PREFIX__!subrule"("metachar", "")
    new $P118, "ResizablePMCArray"
    push $P118, $P117
    push $P118, ""
    .return ($P118)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block123"  :anon :subid("35_1258128993.11955") :method :outer("33_1258128993.11955")
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
.sub "quantifier"  :subid("36_1258128993.11955") :method
.annotate "line", 53
    $P129 = self."!protoregex"("quantifier")
    .return ($P129)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier"  :subid("37_1258128993.11955") :method
.annotate "line", 53
    $P131 = self."!PREFIX__!protoregex"("quantifier")
    .return ($P131)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<*>"  :subid("38_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__quantifier:sym<*>"  :subid("39_1258128993.11955") :method
.annotate "line", 3
    $P135 = self."!PREFIX__!subrule"("backmod", "*")
    new $P136, "ResizablePMCArray"
    push $P136, $P135
    .return ($P136)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<+>"  :subid("40_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__quantifier:sym<+>"  :subid("41_1258128993.11955") :method
.annotate "line", 3
    $P141 = self."!PREFIX__!subrule"("backmod", "+")
    new $P142, "ResizablePMCArray"
    push $P142, $P141
    .return ($P142)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<?>"  :subid("42_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__quantifier:sym<?>"  :subid("43_1258128993.11955") :method
.annotate "line", 3
    $P147 = self."!PREFIX__!subrule"("backmod", "?")
    new $P148, "ResizablePMCArray"
    push $P148, $P147
    .return ($P148)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<**>"  :subid("44_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__quantifier:sym<**>"  :subid("45_1258128993.11955") :method
.annotate "line", 3
    new $P153, "ResizablePMCArray"
    push $P153, "**"
    .return ($P153)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backmod"  :subid("46_1258128993.11955") :method :outer("11_1258128993.11955")
.annotate "line", 3
    .const 'Sub' $P169 = "48_1258128993.11955" 
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
    .const 'Sub' $P169 = "48_1258128993.11955" 
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
.sub "!PREFIX__backmod"  :subid("47_1258128993.11955") :method
.annotate "line", 3
    new $P164, "ResizablePMCArray"
    push $P164, ""
    .return ($P164)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block168"  :anon :subid("48_1258128993.11955") :method :outer("46_1258128993.11955")
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
.sub "metachar"  :subid("49_1258128993.11955") :method
.annotate "line", 67
    $P173 = self."!protoregex"("metachar")
    .return ($P173)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar"  :subid("50_1258128993.11955") :method
.annotate "line", 67
    $P175 = self."!PREFIX__!protoregex"("metachar")
    .return ($P175)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<ws>"  :subid("51_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__metachar:sym<ws>"  :subid("52_1258128993.11955") :method
.annotate "line", 3
    $P179 = self."!PREFIX__!subrule"("normspace", "")
    new $P180, "ResizablePMCArray"
    push $P180, $P179
    .return ($P180)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<[ ]>"  :subid("53_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__metachar:sym<[ ]>"  :subid("54_1258128993.11955") :method
.annotate "line", 3
    $P184 = self."!PREFIX__!subrule"("nibbler", "[")
    new $P185, "ResizablePMCArray"
    push $P185, $P184
    .return ($P185)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<( )>"  :subid("55_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__metachar:sym<( )>"  :subid("56_1258128993.11955") :method
.annotate "line", 3
    $P189 = self."!PREFIX__!subrule"("nibbler", "(")
    new $P190, "ResizablePMCArray"
    push $P190, $P189
    .return ($P190)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<'>"  :subid("57_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__metachar:sym<'>"  :subid("58_1258128993.11955") :method
.annotate "line", 3
    $P194 = self."!PREFIX__!subrule"("quote", "")
    new $P195, "ResizablePMCArray"
    push $P195, $P194
    .return ($P195)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<.>"  :subid("59_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__metachar:sym<.>"  :subid("60_1258128993.11955") :method
.annotate "line", 3
    new $P199, "ResizablePMCArray"
    push $P199, "."
    .return ($P199)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^>"  :subid("61_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__metachar:sym<^>"  :subid("62_1258128993.11955") :method
.annotate "line", 3
    new $P204, "ResizablePMCArray"
    push $P204, "^"
    .return ($P204)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^^>"  :subid("63_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__metachar:sym<^^>"  :subid("64_1258128993.11955") :method
.annotate "line", 3
    new $P209, "ResizablePMCArray"
    push $P209, "^^"
    .return ($P209)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$>"  :subid("65_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__metachar:sym<$>"  :subid("66_1258128993.11955") :method
.annotate "line", 3
    new $P214, "ResizablePMCArray"
    push $P214, "$"
    .return ($P214)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$$>"  :subid("67_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__metachar:sym<$$>"  :subid("68_1258128993.11955") :method
.annotate "line", 3
    new $P219, "ResizablePMCArray"
    push $P219, "$$"
    .return ($P219)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<:::>"  :subid("69_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__metachar:sym<:::>"  :subid("70_1258128993.11955") :method
.annotate "line", 3
    $P224 = self."!PREFIX__!subrule"("panic", ":::")
    new $P225, "ResizablePMCArray"
    push $P225, $P224
    .return ($P225)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<::>"  :subid("71_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__metachar:sym<::>"  :subid("72_1258128993.11955") :method
.annotate "line", 3
    $P230 = self."!PREFIX__!subrule"("panic", "::")
    new $P231, "ResizablePMCArray"
    push $P231, $P230
    .return ($P231)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<lwb>"  :subid("73_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__metachar:sym<lwb>"  :subid("74_1258128993.11955") :method
.annotate "line", 3
    new $P236, "ResizablePMCArray"
    push $P236, unicode:"\x{ab}"
    push $P236, "<<"
    .return ($P236)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<rwb>"  :subid("75_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__metachar:sym<rwb>"  :subid("76_1258128993.11955") :method
.annotate "line", 3
    new $P242, "ResizablePMCArray"
    push $P242, unicode:"\x{bb}"
    push $P242, ">>"
    .return ($P242)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<bs>"  :subid("77_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__metachar:sym<bs>"  :subid("78_1258128993.11955") :method
.annotate "line", 3
    $P248 = self."!PREFIX__!subrule"("backslash", "\\")
    new $P249, "ResizablePMCArray"
    push $P249, $P248
    .return ($P249)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<mod>"  :subid("79_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__metachar:sym<mod>"  :subid("80_1258128993.11955") :method
.annotate "line", 3
    $P253 = self."!PREFIX__!subrule"("mod_internal", "")
    new $P254, "ResizablePMCArray"
    push $P254, $P253
    .return ($P254)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<~>"  :subid("81_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__metachar:sym<~>"  :subid("82_1258128993.11955") :method
.annotate "line", 3
    $P258 = self."!PREFIX__!subrule"("ws", "~")
    new $P259, "ResizablePMCArray"
    push $P259, $P258
    .return ($P259)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<{*}>"  :subid("83_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__metachar:sym<{*}>"  :subid("84_1258128993.11955") :method
.annotate "line", 3
    new $P264, "ResizablePMCArray"
    push $P264, "{*}"
    .return ($P264)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<assert>"  :subid("85_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__metachar:sym<assert>"  :subid("86_1258128993.11955") :method
.annotate "line", 3
    $P280 = self."!PREFIX__!subrule"("assertion", "<")
    new $P281, "ResizablePMCArray"
    push $P281, $P280
    .return ($P281)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<var>"  :subid("87_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__metachar:sym<var>"  :subid("88_1258128993.11955") :method
.annotate "line", 3
    new $P286, "ResizablePMCArray"
    push $P286, "$"
    push $P286, "$<"
    .return ($P286)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<PIR>"  :subid("89_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__metachar:sym<PIR>"  :subid("90_1258128993.11955") :method
.annotate "line", 3
    new $P297, "ResizablePMCArray"
    push $P297, ":PIR{{"
    .return ($P297)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash"  :subid("91_1258128993.11955") :method
.annotate "line", 113
    $P302 = self."!protoregex"("backslash")
    .return ($P302)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash"  :subid("92_1258128993.11955") :method
.annotate "line", 113
    $P304 = self."!PREFIX__!protoregex"("backslash")
    .return ($P304)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<w>"  :subid("93_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__backslash:sym<w>"  :subid("94_1258128993.11955") :method
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
.sub "backslash:sym<b>"  :subid("95_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__backslash:sym<b>"  :subid("96_1258128993.11955") :method
.annotate "line", 3
    new $P313, "ResizablePMCArray"
    push $P313, "B"
    push $P313, "b"
    .return ($P313)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<e>"  :subid("97_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__backslash:sym<e>"  :subid("98_1258128993.11955") :method
.annotate "line", 3
    new $P318, "ResizablePMCArray"
    push $P318, "E"
    push $P318, "e"
    .return ($P318)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<f>"  :subid("99_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__backslash:sym<f>"  :subid("100_1258128993.11955") :method
.annotate "line", 3
    new $P323, "ResizablePMCArray"
    push $P323, "F"
    push $P323, "f"
    .return ($P323)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<h>"  :subid("101_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__backslash:sym<h>"  :subid("102_1258128993.11955") :method
.annotate "line", 3
    new $P328, "ResizablePMCArray"
    push $P328, "H"
    push $P328, "h"
    .return ($P328)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<r>"  :subid("103_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__backslash:sym<r>"  :subid("104_1258128993.11955") :method
.annotate "line", 3
    new $P333, "ResizablePMCArray"
    push $P333, "R"
    push $P333, "r"
    .return ($P333)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<t>"  :subid("105_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__backslash:sym<t>"  :subid("106_1258128993.11955") :method
.annotate "line", 3
    new $P338, "ResizablePMCArray"
    push $P338, "T"
    push $P338, "t"
    .return ($P338)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<v>"  :subid("107_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__backslash:sym<v>"  :subid("108_1258128993.11955") :method
.annotate "line", 3
    new $P343, "ResizablePMCArray"
    push $P343, "V"
    push $P343, "v"
    .return ($P343)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<c>"  :subid("109_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__backslash:sym<c>"  :subid("110_1258128993.11955") :method
.annotate "line", 3
    $P348 = self."!PREFIX__!subrule"("charspec", "C")
    $P349 = self."!PREFIX__!subrule"("charspec", "c")
    new $P350, "ResizablePMCArray"
    push $P350, $P348
    push $P350, $P349
    .return ($P350)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<o>"  :subid("111_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__backslash:sym<o>"  :subid("112_1258128993.11955") :method
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
.sub "backslash:sym<x>"  :subid("113_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__backslash:sym<x>"  :subid("114_1258128993.11955") :method
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
.sub "backslash:sym<A>"  :subid("115_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__backslash:sym<A>"  :subid("116_1258128993.11955") :method
.annotate "line", 3
    $P375 = self."!PREFIX__!subrule"("obs", "A")
    new $P376, "ResizablePMCArray"
    push $P376, $P375
    .return ($P376)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<z>"  :subid("117_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__backslash:sym<z>"  :subid("118_1258128993.11955") :method
.annotate "line", 3
    $P380 = self."!PREFIX__!subrule"("obs", "z")
    new $P381, "ResizablePMCArray"
    push $P381, $P380
    .return ($P381)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Z>"  :subid("119_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__backslash:sym<Z>"  :subid("120_1258128993.11955") :method
.annotate "line", 3
    $P385 = self."!PREFIX__!subrule"("obs", "Z")
    new $P386, "ResizablePMCArray"
    push $P386, $P385
    .return ($P386)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Q>"  :subid("121_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__backslash:sym<Q>"  :subid("122_1258128993.11955") :method
.annotate "line", 3
    $P390 = self."!PREFIX__!subrule"("obs", "Q")
    new $P391, "ResizablePMCArray"
    push $P391, $P390
    .return ($P391)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<misc>"  :subid("123_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__backslash:sym<misc>"  :subid("124_1258128993.11955") :method
.annotate "line", 3
    new $P395, "ResizablePMCArray"
    push $P395, ""
    .return ($P395)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion"  :subid("125_1258128993.11955") :method
.annotate "line", 131
    $P397 = self."!protoregex"("assertion")
    .return ($P397)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion"  :subid("126_1258128993.11955") :method
.annotate "line", 131
    $P399 = self."!PREFIX__!protoregex"("assertion")
    .return ($P399)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<?>"  :subid("127_1258128993.11955") :method :outer("11_1258128993.11955")
.annotate "line", 3
    .const 'Sub' $P407 = "129_1258128993.11955" 
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
    .const 'Sub' $P407 = "129_1258128993.11955" 
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
.sub "!PREFIX__assertion:sym<?>"  :subid("128_1258128993.11955") :method
.annotate "line", 3
    $P403 = self."!PREFIX__!subrule"("assertion", "?")
    new $P404, "ResizablePMCArray"
    push $P404, $P403
    push $P404, "?"
    .return ($P404)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block406"  :anon :subid("129_1258128993.11955") :method :outer("127_1258128993.11955")
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
.sub "assertion:sym<!>"  :subid("130_1258128993.11955") :method :outer("11_1258128993.11955")
.annotate "line", 3
    .const 'Sub' $P417 = "132_1258128993.11955" 
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
    .const 'Sub' $P417 = "132_1258128993.11955" 
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
.sub "!PREFIX__assertion:sym<!>"  :subid("131_1258128993.11955") :method
.annotate "line", 3
    $P413 = self."!PREFIX__!subrule"("assertion", "!")
    new $P414, "ResizablePMCArray"
    push $P414, $P413
    push $P414, "!"
    .return ($P414)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block416"  :anon :subid("132_1258128993.11955") :method :outer("130_1258128993.11955")
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
.sub "assertion:sym<method>"  :subid("133_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__assertion:sym<method>"  :subid("134_1258128993.11955") :method
.annotate "line", 3
    $P423 = self."!PREFIX__!subrule"("assertion", ".")
    new $P424, "ResizablePMCArray"
    push $P424, $P423
    .return ($P424)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<name>"  :subid("135_1258128993.11955") :method :outer("11_1258128993.11955")
.annotate "line", 3
    .const 'Sub' $P433 = "137_1258128993.11955" 
    capture_lex $P433
    .local string rx426_tgt
    .local int rx426_pos
    .local int rx426_off
    .local int rx426_eos
    .local int rx426_rep
    .local pmc rx426_cur
    (rx426_cur, rx426_pos, rx426_tgt, $I10) = self."!cursor_start"()
    rx426_cur."!cursor_debug"("START ", "assertion:sym<name>")
    rx426_cur."!cursor_caparray"("nibbler", "arglist", "assertion")
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
    .const 'Sub' $P433 = "137_1258128993.11955" 
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
.sub "!PREFIX__assertion:sym<name>"  :subid("136_1258128993.11955") :method
.annotate "line", 3
    new $P428, "ResizablePMCArray"
    push $P428, ""
    .return ($P428)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block432"  :anon :subid("137_1258128993.11955") :method :outer("135_1258128993.11955")
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
.sub "assertion:sym<[>"  :subid("138_1258128993.11955") :method :outer("11_1258128993.11955")
.annotate "line", 3
    .const 'Sub' $P442 = "140_1258128993.11955" 
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
    .const 'Sub' $P442 = "140_1258128993.11955" 
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
.sub "!PREFIX__assertion:sym<[>"  :subid("139_1258128993.11955") :method
.annotate "line", 3
    new $P440, "ResizablePMCArray"
    push $P440, ""
    .return ($P440)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block441"  :anon :subid("140_1258128993.11955") :method :outer("138_1258128993.11955")
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
.sub "cclass_elem"  :subid("141_1258128993.11955") :method :outer("11_1258128993.11955")
.annotate "line", 3
    .const 'Sub' $P459 = "143_1258128993.11955" 
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
    .const 'Sub' $P459 = "143_1258128993.11955" 
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
.sub "!PREFIX__cclass_elem"  :subid("142_1258128993.11955") :method
.annotate "line", 3
    new $P451, "ResizablePMCArray"
    push $P451, ""
    push $P451, "-"
    push $P451, "+"
    .return ($P451)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block458"  :anon :subid("143_1258128993.11955") :method :outer("141_1258128993.11955")
.annotate "line", 157
    .const 'Sub' $P474 = "146_1258128993.11955" 
    capture_lex $P474
    .const 'Sub' $P469 = "145_1258128993.11955" 
    capture_lex $P469
    .const 'Sub' $P465 = "144_1258128993.11955" 
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
    .const 'Sub' $P465 = "144_1258128993.11955" 
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
    .const 'Sub' $P469 = "145_1258128993.11955" 
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
    .const 'Sub' $P474 = "146_1258128993.11955" 
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
.sub "_block464"  :anon :subid("144_1258128993.11955") :method :outer("143_1258128993.11955")
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
.sub "_block468"  :anon :subid("145_1258128993.11955") :method :outer("143_1258128993.11955")
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
.sub "_block473"  :anon :subid("146_1258128993.11955") :method :outer("143_1258128993.11955")
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
.sub "mod_internal"  :subid("147_1258128993.11955") :method :outer("11_1258128993.11955")
.annotate "line", 3
    .const 'Sub' $P490 = "149_1258128993.11955" 
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
    .const 'Sub' $P490 = "149_1258128993.11955" 
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
.sub "!PREFIX__mod_internal"  :subid("148_1258128993.11955") :method
.annotate "line", 3
    $P485 = self."!PREFIX__!subrule"("mod_ident", ":")
    new $P486, "ResizablePMCArray"
    push $P486, $P485
    push $P486, ":"
    .return ($P486)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block489"  :anon :subid("149_1258128993.11955") :method :outer("147_1258128993.11955")
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
.sub "mod_ident"  :subid("150_1258128993.11955") :method
.annotate "line", 174
    $P499 = self."!protoregex"("mod_ident")
    .return ($P499)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident"  :subid("151_1258128993.11955") :method
.annotate "line", 174
    $P501 = self."!PREFIX__!protoregex"("mod_ident")
    .return ($P501)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ignorecase>"  :subid("152_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__mod_ident:sym<ignorecase>"  :subid("153_1258128993.11955") :method
.annotate "line", 3
    new $P505, "ResizablePMCArray"
    push $P505, "i"
    .return ($P505)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ratchet>"  :subid("154_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__mod_ident:sym<ratchet>"  :subid("155_1258128993.11955") :method
.annotate "line", 3
    new $P512, "ResizablePMCArray"
    push $P512, "r"
    .return ($P512)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<sigspace>"  :subid("156_1258128993.11955") :method :outer("11_1258128993.11955")
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
.sub "!PREFIX__mod_ident:sym<sigspace>"  :subid("157_1258128993.11955") :method
.annotate "line", 3
    new $P519, "ResizablePMCArray"
    push $P519, "s"
    .return ($P519)
.end

### .include 'gen/p6regex-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1258129000.66298")
.annotate "line", 0
    get_hll_global $P14, ["Regex";"P6Regex";"Actions"], "_block13" 
    capture_lex $P14
.annotate "line", 4
    get_hll_global $P14, ["Regex";"P6Regex";"Actions"], "_block13" 
    capture_lex $P14
    $P1509 = $P14()
.annotate "line", 1
    .return ($P1509)
.end


.namespace []
.sub "" :load :init :subid("post88") :outer("10_1258129000.66298")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1258129000.66298" 
    .local pmc block
    set block, $P12
    $P1510 = get_root_global ["parrot"], "P6metaclass"
    $P1510."new_class"("Regex::P6Regex::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block13"  :subid("11_1258129000.66298") :outer("10_1258129000.66298")
.annotate "line", 4
    .const 'Sub' $P1476 = "87_1258129000.66298" 
    capture_lex $P1476
    .const 'Sub' $P1407 = "83_1258129000.66298" 
    capture_lex $P1407
    .const 'Sub' $P1339 = "81_1258129000.66298" 
    capture_lex $P1339
    .const 'Sub' $P1266 = "78_1258129000.66298" 
    capture_lex $P1266
    .const 'Sub' $P1253 = "77_1258129000.66298" 
    capture_lex $P1253
    .const 'Sub' $P1229 = "76_1258129000.66298" 
    capture_lex $P1229
    .const 'Sub' $P1211 = "75_1258129000.66298" 
    capture_lex $P1211
    .const 'Sub' $P1197 = "74_1258129000.66298" 
    capture_lex $P1197
    .const 'Sub' $P1166 = "73_1258129000.66298" 
    capture_lex $P1166
    .const 'Sub' $P1135 = "72_1258129000.66298" 
    capture_lex $P1135
    .const 'Sub' $P1119 = "71_1258129000.66298" 
    capture_lex $P1119
    .const 'Sub' $P1103 = "70_1258129000.66298" 
    capture_lex $P1103
    .const 'Sub' $P1087 = "69_1258129000.66298" 
    capture_lex $P1087
    .const 'Sub' $P1071 = "68_1258129000.66298" 
    capture_lex $P1071
    .const 'Sub' $P1055 = "67_1258129000.66298" 
    capture_lex $P1055
    .const 'Sub' $P1039 = "66_1258129000.66298" 
    capture_lex $P1039
    .const 'Sub' $P1023 = "65_1258129000.66298" 
    capture_lex $P1023
    .const 'Sub' $P999 = "64_1258129000.66298" 
    capture_lex $P999
    .const 'Sub' $P984 = "63_1258129000.66298" 
    capture_lex $P984
    .const 'Sub' $P928 = "62_1258129000.66298" 
    capture_lex $P928
    .const 'Sub' $P907 = "61_1258129000.66298" 
    capture_lex $P907
    .const 'Sub' $P885 = "60_1258129000.66298" 
    capture_lex $P885
    .const 'Sub' $P875 = "59_1258129000.66298" 
    capture_lex $P875
    .const 'Sub' $P865 = "58_1258129000.66298" 
    capture_lex $P865
    .const 'Sub' $P855 = "57_1258129000.66298" 
    capture_lex $P855
    .const 'Sub' $P843 = "56_1258129000.66298" 
    capture_lex $P843
    .const 'Sub' $P831 = "55_1258129000.66298" 
    capture_lex $P831
    .const 'Sub' $P819 = "54_1258129000.66298" 
    capture_lex $P819
    .const 'Sub' $P807 = "53_1258129000.66298" 
    capture_lex $P807
    .const 'Sub' $P795 = "52_1258129000.66298" 
    capture_lex $P795
    .const 'Sub' $P783 = "51_1258129000.66298" 
    capture_lex $P783
    .const 'Sub' $P771 = "50_1258129000.66298" 
    capture_lex $P771
    .const 'Sub' $P759 = "49_1258129000.66298" 
    capture_lex $P759
    .const 'Sub' $P743 = "48_1258129000.66298" 
    capture_lex $P743
    .const 'Sub' $P725 = "47_1258129000.66298" 
    capture_lex $P725
    .const 'Sub' $P715 = "46_1258129000.66298" 
    capture_lex $P715
    .const 'Sub' $P697 = "45_1258129000.66298" 
    capture_lex $P697
    .const 'Sub' $P650 = "44_1258129000.66298" 
    capture_lex $P650
    .const 'Sub' $P633 = "43_1258129000.66298" 
    capture_lex $P633
    .const 'Sub' $P618 = "42_1258129000.66298" 
    capture_lex $P618
    .const 'Sub' $P603 = "41_1258129000.66298" 
    capture_lex $P603
    .const 'Sub' $P577 = "40_1258129000.66298" 
    capture_lex $P577
    .const 'Sub' $P527 = "38_1258129000.66298" 
    capture_lex $P527
    .const 'Sub' $P472 = "36_1258129000.66298" 
    capture_lex $P472
    .const 'Sub' $P415 = "33_1258129000.66298" 
    capture_lex $P415
    .const 'Sub' $P400 = "32_1258129000.66298" 
    capture_lex $P400
    .const 'Sub' $P374 = "30_1258129000.66298" 
    capture_lex $P374
    .const 'Sub' $P356 = "29_1258129000.66298" 
    capture_lex $P356
    .const 'Sub' $P336 = "28_1258129000.66298" 
    capture_lex $P336
    .const 'Sub' $P304 = "27_1258129000.66298" 
    capture_lex $P304
    .const 'Sub' $P42 = "14_1258129000.66298" 
    capture_lex $P42
    .const 'Sub' $P21 = "13_1258129000.66298" 
    capture_lex $P21
    .const 'Sub' $P16 = "12_1258129000.66298" 
    capture_lex $P16
    get_global $P15, "@MODIFIERS"
    unless_null $P15, vivify_89
    new $P15, "ResizablePMCArray"
    set_global "@MODIFIERS", $P15
  vivify_89:
.annotate "line", 6
    .const 'Sub' $P16 = "12_1258129000.66298" 
    capture_lex $P16
    .lex "INIT", $P16
.annotate "line", 461
    .const 'Sub' $P21 = "13_1258129000.66298" 
    capture_lex $P21
    .lex "buildsub", $P21
.annotate "line", 474
    .const 'Sub' $P42 = "14_1258129000.66298" 
    capture_lex $P42
    .lex "capnames", $P42
.annotate "line", 540
    .const 'Sub' $P304 = "27_1258129000.66298" 
    capture_lex $P304
    .lex "backmod", $P304
.annotate "line", 547
    .const 'Sub' $P336 = "28_1258129000.66298" 
    capture_lex $P336
    .lex "subrule_alias", $P336
.annotate "line", 4
    get_global $P354, "@MODIFIERS"
    find_lex $P355, "INIT"
.annotate "line", 454
    find_lex $P1505, "buildsub"
    find_lex $P1506, "capnames"
    find_lex $P1507, "backmod"
    find_lex $P1508, "subrule_alias"
.annotate "line", 4
    .return ($P1508)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "INIT"  :subid("12_1258129000.66298") :outer("11_1258129000.66298")
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
.sub "buildsub"  :subid("13_1258129000.66298") :outer("11_1258129000.66298")
    .param pmc param_24
.annotate "line", 461
    new $P23, 'ExceptionHandler'
    set_addr $P23, control_22
    $P23."handle_types"(58)
    push_eh $P23
    .lex "$rpast", param_24
.annotate "line", 462
    new $P25, "Hash"
    .lex "%capnames", $P25
    find_lex $P26, "$rpast"
    $P27 = "capnames"($P26, 0)
    store_lex "%capnames", $P27
.annotate "line", 463
    new $P28, "Integer"
    assign $P28, 0
    find_lex $P29, "%capnames"
    unless_null $P29, vivify_90
    new $P29, "Hash"
    store_lex "%capnames", $P29
  vivify_90:
    set $P29[""], $P28
.annotate "line", 464
    get_hll_global $P30, ["PAST"], "Regex"
.annotate "line", 465
    get_hll_global $P31, ["PAST"], "Regex"
    $P32 = $P31."new"("scan" :named("pasttype"))
    find_lex $P33, "$rpast"
.annotate "line", 467
    get_hll_global $P34, ["PAST"], "Regex"
    $P35 = $P34."new"("pass" :named("pasttype"))
    find_lex $P36, "%capnames"
    $P37 = $P30."new"($P32, $P33, $P35, "concat" :named("pasttype"), $P36 :named("capnames"))
.annotate "line", 464
    store_lex "$rpast", $P37
.annotate "line", 471
    get_hll_global $P38, ["PAST"], "Block"
    find_lex $P39, "$rpast"
    $P40 = $P38."new"($P39, "method" :named("blocktype"))
.annotate "line", 461
    .return ($P40)
  control_22:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P41, exception, "payload"
    .return ($P41)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "capnames"  :subid("14_1258129000.66298") :outer("11_1258129000.66298")
    .param pmc param_45
    .param pmc param_46
.annotate "line", 474
    .const 'Sub' $P279 = "25_1258129000.66298" 
    capture_lex $P279
    .const 'Sub' $P214 = "22_1258129000.66298" 
    capture_lex $P214
    .const 'Sub' $P170 = "20_1258129000.66298" 
    capture_lex $P170
    .const 'Sub' $P128 = "18_1258129000.66298" 
    capture_lex $P128
    .const 'Sub' $P57 = "15_1258129000.66298" 
    capture_lex $P57
    new $P44, 'ExceptionHandler'
    set_addr $P44, control_43
    $P44."handle_types"(58)
    push_eh $P44
    .lex "$ast", param_45
    .lex "$count", param_46
.annotate "line", 475
    new $P47, "Hash"
    .lex "%capnames", $P47
.annotate "line", 476
    new $P48, "Undef"
    .lex "$pasttype", $P48
.annotate "line", 474
    find_lex $P49, "%capnames"
.annotate "line", 476
    find_lex $P50, "$ast"
    $P51 = $P50."pasttype"()
    store_lex "$pasttype", $P51
.annotate "line", 477
    find_lex $P53, "$pasttype"
    set $S54, $P53
    iseq $I55, $S54, "alt"
    if $I55, if_52
.annotate "line", 490
    find_lex $P119, "$pasttype"
    set $S120, $P119
    iseq $I121, $S120, "concat"
    if $I121, if_118
.annotate "line", 499
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
.annotate "line", 512
    find_lex $P210, "$pasttype"
    set $S211, $P210
    iseq $I212, $S211, "subcapture"
    if $I212, if_209
.annotate "line", 529
    find_lex $P275, "$pasttype"
    set $S276, $P275
    iseq $I277, $S276, "quant"
    unless $I277, if_274_end
    .const 'Sub' $P279 = "25_1258129000.66298" 
    capture_lex $P279
    $P279()
  if_274_end:
    goto if_209_end
  if_209:
.annotate "line", 512
    .const 'Sub' $P214 = "22_1258129000.66298" 
    capture_lex $P214
    $P214()
  if_209_end:
    goto if_160_end
  if_160:
.annotate "line", 499
    .const 'Sub' $P170 = "20_1258129000.66298" 
    capture_lex $P170
    $P170()
  if_160_end:
    goto if_118_end
  if_118:
.annotate "line", 491
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
    .const 'Sub' $P128 = "18_1258129000.66298" 
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
.annotate "line", 490
    goto if_52_end
  if_52:
.annotate "line", 477
    .const 'Sub' $P57 = "15_1258129000.66298" 
    capture_lex $P57
    $P57()
  if_52_end:
.annotate "line", 536
    find_lex $P300, "$count"
    find_lex $P301, "%capnames"
    unless_null $P301, vivify_131
    new $P301, "Hash"
    store_lex "%capnames", $P301
  vivify_131:
    set $P301[""], $P300
    find_lex $P302, "%capnames"
.annotate "line", 474
    .return ($P302)
  control_43:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P303, exception, "payload"
    .return ($P303)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block278"  :anon :subid("25_1258129000.66298") :outer("14_1258129000.66298")
.annotate "line", 529
    .const 'Sub' $P290 = "26_1258129000.66298" 
    capture_lex $P290
.annotate "line", 530
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
.annotate "line", 531
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
    .const 'Sub' $P290 = "26_1258129000.66298" 
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
.annotate "line", 534
    find_lex $P298, "%astcap"
    unless_null $P298, vivify_95
    new $P298, "Hash"
  vivify_95:
    set $P299, $P298[""]
    unless_null $P299, vivify_96
    new $P299, "Undef"
  vivify_96:
    store_lex "$count", $P299
.annotate "line", 529
    .return ($P299)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block289"  :anon :subid("26_1258129000.66298") :outer("25_1258129000.66298")
    .param pmc param_291
.annotate "line", 531
    .lex "$_", param_291
.annotate "line", 532
    new $P292, "Integer"
    assign $P292, 2
    find_lex $P293, "$_"
    find_lex $P294, "%capnames"
    unless_null $P294, vivify_94
    new $P294, "Hash"
    store_lex "%capnames", $P294
  vivify_94:
    set $P294[$P293], $P292
.annotate "line", 531
    .return ($P292)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block213"  :anon :subid("22_1258129000.66298") :outer("14_1258129000.66298")
.annotate "line", 512
    .const 'Sub' $P256 = "24_1258129000.66298" 
    capture_lex $P256
    .const 'Sub' $P226 = "23_1258129000.66298" 
    capture_lex $P226
.annotate "line", 513
    new $P215, "Undef"
    .lex "$name", $P215
.annotate "line", 514
    new $P216, "ResizablePMCArray"
    .lex "@names", $P216
.annotate "line", 523
    new $P217, "Hash"
    .lex "%x", $P217
.annotate "line", 513
    find_lex $P218, "$ast"
    $P219 = $P218."name"()
    store_lex "$name", $P219
.annotate "line", 514

            $P0 = find_lex '$name'
            $S0 = $P0
            $P220 = split '=', $S0
        
    store_lex "@names", $P220
.annotate "line", 519
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
    .const 'Sub' $P226 = "23_1258129000.66298" 
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
.annotate "line", 523
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
.annotate "line", 524
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
    .const 'Sub' $P256 = "24_1258129000.66298" 
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
.annotate "line", 527
    find_lex $P272, "%x"
    unless_null $P272, vivify_107
    new $P272, "Hash"
  vivify_107:
    set $P273, $P272[""]
    unless_null $P273, vivify_108
    new $P273, "Undef"
  vivify_108:
    store_lex "$count", $P273
.annotate "line", 512
    .return ($P273)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block225"  :anon :subid("23_1258129000.66298") :outer("22_1258129000.66298")
    .param pmc param_227
.annotate "line", 519
    .lex "$_", param_227
.annotate "line", 520
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
.annotate "line", 521
    new $P241, "Integer"
    assign $P241, 1
    find_lex $P242, "$_"
    find_lex $P243, "%capnames"
    unless_null $P243, vivify_98
    new $P243, "Hash"
    store_lex "%capnames", $P243
  vivify_98:
    set $P243[$P242], $P241
.annotate "line", 519
    .return ($P241)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block255"  :anon :subid("24_1258129000.66298") :outer("22_1258129000.66298")
    .param pmc param_257
.annotate "line", 524
    .lex "$_", param_257
.annotate "line", 525
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
.annotate "line", 524
    .return ($P266)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block169"  :anon :subid("20_1258129000.66298") :outer("14_1258129000.66298")
.annotate "line", 499
    .const 'Sub' $P188 = "21_1258129000.66298" 
    capture_lex $P188
.annotate "line", 500
    new $P171, "Undef"
    .lex "$name", $P171
.annotate "line", 502
    new $P172, "ResizablePMCArray"
    .lex "@names", $P172
.annotate "line", 500
    find_lex $P173, "$ast"
    $P174 = $P173."name"()
    store_lex "$name", $P174
.annotate "line", 501
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
.annotate "line", 502

            $P0 = find_lex '$name'
            $S0 = $P0
            $P182 = split '=', $S0
        
    store_lex "@names", $P182
.annotate "line", 507
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
    .const 'Sub' $P188 = "21_1258129000.66298" 
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
.annotate "line", 499
    .return ($P183)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block187"  :anon :subid("21_1258129000.66298") :outer("20_1258129000.66298")
    .param pmc param_189
.annotate "line", 507
    .lex "$_", param_189
.annotate "line", 508
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
.annotate "line", 509
    new $P203, "Integer"
    assign $P203, 1
    find_lex $P204, "$_"
    find_lex $P205, "%capnames"
    unless_null $P205, vivify_110
    new $P205, "Hash"
    store_lex "%capnames", $P205
  vivify_110:
    set $P205[$P204], $P203
.annotate "line", 507
    .return ($P203)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block127"  :anon :subid("18_1258129000.66298") :outer("14_1258129000.66298")
    .param pmc param_130
.annotate "line", 491
    .const 'Sub' $P139 = "19_1258129000.66298" 
    capture_lex $P139
.annotate "line", 492
    new $P129, "Hash"
    .lex "%x", $P129
    .lex "$_", param_130
    find_lex $P131, "$_"
    find_lex $P132, "$count"
    $P133 = "capnames"($P131, $P132)
    store_lex "%x", $P133
.annotate "line", 493
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
    .const 'Sub' $P139 = "19_1258129000.66298" 
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
.annotate "line", 496
    find_lex $P155, "%x"
    unless_null $P155, vivify_118
    new $P155, "Hash"
  vivify_118:
    set $P156, $P155[""]
    unless_null $P156, vivify_119
    new $P156, "Undef"
  vivify_119:
    store_lex "$count", $P156
.annotate "line", 491
    .return ($P156)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block138"  :anon :subid("19_1258129000.66298") :outer("18_1258129000.66298")
    .param pmc param_140
.annotate "line", 493
    .lex "$_", param_140
.annotate "line", 494
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
.annotate "line", 493
    .return ($P149)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block56"  :anon :subid("15_1258129000.66298") :outer("14_1258129000.66298")
.annotate "line", 477
    .const 'Sub' $P66 = "16_1258129000.66298" 
    capture_lex $P66
.annotate "line", 478
    new $P58, "Undef"
    .lex "$max", $P58
    find_lex $P59, "$count"
    store_lex "$max", $P59
.annotate "line", 479
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
    .const 'Sub' $P66 = "16_1258129000.66298" 
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
.annotate "line", 488
    find_lex $P117, "$max"
    store_lex "$count", $P117
.annotate "line", 477
    .return ($P117)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block65"  :anon :subid("16_1258129000.66298") :outer("15_1258129000.66298")
    .param pmc param_68
.annotate "line", 479
    .const 'Sub' $P77 = "17_1258129000.66298" 
    capture_lex $P77
.annotate "line", 480
    new $P67, "Hash"
    .lex "%x", $P67
    .lex "$_", param_68
    find_lex $P69, "$_"
    find_lex $P70, "$count"
    $P71 = "capnames"($P69, $P70)
    store_lex "%x", $P71
.annotate "line", 481
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
    .const 'Sub' $P77 = "17_1258129000.66298" 
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
.annotate "line", 486
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
.annotate "line", 479
    .return ($P104)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block76"  :anon :subid("17_1258129000.66298") :outer("16_1258129000.66298")
    .param pmc param_78
.annotate "line", 481
    .lex "$_", param_78
.annotate "line", 482
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
.annotate "line", 483
    find_lex $P99, "$_"
    find_lex $P100, "%capnames"
    unless_null $P100, vivify_126
    new $P100, "Hash"
    store_lex "%capnames", $P100
  vivify_126:
    set $P100[$P99], $P79
.annotate "line", 481
    .return ($P79)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backmod"  :subid("27_1258129000.66298") :outer("11_1258129000.66298")
    .param pmc param_307
    .param pmc param_308
.annotate "line", 540
    new $P306, 'ExceptionHandler'
    set_addr $P306, control_305
    $P306."handle_types"(58)
    push_eh $P306
    .lex "$ast", param_307
    .lex "$backmod", param_308
.annotate "line", 541
    find_lex $P310, "$backmod"
    set $S311, $P310
    iseq $I312, $S311, ":"
    if $I312, if_309
.annotate "line", 542
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
.annotate "line", 543
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
.annotate "line", 542
    find_lex $P323, "$ast"
    $P323."backtrack"("f")
  if_314_end:
    goto if_309_end
  if_309:
.annotate "line", 541
    find_lex $P313, "$ast"
    $P313."backtrack"("r")
  if_309_end:
    find_lex $P334, "$ast"
.annotate "line", 540
    .return ($P334)
  control_305:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P335, exception, "payload"
    .return ($P335)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "subrule_alias"  :subid("28_1258129000.66298") :outer("11_1258129000.66298")
    .param pmc param_339
    .param pmc param_340
.annotate "line", 547
    new $P338, 'ExceptionHandler'
    set_addr $P338, control_337
    $P338."handle_types"(58)
    push_eh $P338
    .lex "$past", param_339
    .lex "$name", param_340
.annotate "line", 548
    find_lex $P342, "$past"
    unless_null $P342, vivify_132
    new $P342, "Hash"
  vivify_132:
    set $P343, $P342["aliased"]
    unless_null $P343, vivify_133
    new $P343, "Undef"
  vivify_133:
    unless $P343, if_341_end
    find_lex $P344, "$name"
    concat $P345, $P344, "="
    find_lex $P346, "$past"
    $S347 = $P346."name"()
    concat $P348, $P345, $S347
    store_lex "$name", $P348
  if_341_end:
.annotate "line", 549
    find_lex $P349, "$past"
    find_lex $P350, "$name"
    $P349."name"($P350)
.annotate "line", 550
    new $P351, "Integer"
    assign $P351, 1
    find_lex $P352, "$past"
    unless_null $P352, vivify_134
    new $P352, "Hash"
    store_lex "$past", $P352
  vivify_134:
    set $P352["aliased"], $P351
.annotate "line", 547
    .return ($P351)
  control_337:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P353, exception, "payload"
    .return ($P353)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "arg"  :subid("29_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_359
.annotate "line", 14
    new $P358, 'ExceptionHandler'
    set_addr $P358, control_357
    $P358."handle_types"(58)
    push_eh $P358
    .lex "self", self
    .lex "$/", param_359
.annotate "line", 15
    find_lex $P360, "$/"
    find_lex $P363, "$/"
    unless_null $P363, vivify_135
    new $P363, "Hash"
  vivify_135:
    set $P364, $P363["quote"]
    unless_null $P364, vivify_136
    new $P364, "Undef"
  vivify_136:
    if $P364, if_362
    find_lex $P369, "$/"
    unless_null $P369, vivify_137
    new $P369, "Hash"
  vivify_137:
    set $P370, $P369["val"]
    unless_null $P370, vivify_138
    new $P370, "Undef"
  vivify_138:
    set $N371, $P370
    new $P361, 'Float'
    set $P361, $N371
    goto if_362_end
  if_362:
    find_lex $P365, "$/"
    unless_null $P365, vivify_139
    new $P365, "Hash"
  vivify_139:
    set $P366, $P365["quote"]
    unless_null $P366, vivify_140
    new $P366, "Hash"
  vivify_140:
    set $P367, $P366["val"]
    unless_null $P367, vivify_141
    new $P367, "Undef"
  vivify_141:
    set $S368, $P367
    new $P361, 'String'
    set $P361, $S368
  if_362_end:
    $P372 = $P360."!make"($P361)
.annotate "line", 14
    .return ($P372)
  control_357:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P373, exception, "payload"
    .return ($P373)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "arglist"  :subid("30_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_377
.annotate "line", 18
    .const 'Sub' $P387 = "31_1258129000.66298" 
    capture_lex $P387
    new $P376, 'ExceptionHandler'
    set_addr $P376, control_375
    $P376."handle_types"(58)
    push_eh $P376
    .lex "self", self
    .lex "$/", param_377
.annotate "line", 19
    new $P378, "Undef"
    .lex "$past", $P378
    get_hll_global $P379, ["PAST"], "Op"
    $P380 = $P379."new"("list" :named("pasttype"))
    store_lex "$past", $P380
.annotate "line", 20
    find_lex $P382, "$/"
    unless_null $P382, vivify_142
    new $P382, "Hash"
  vivify_142:
    set $P383, $P382["arg"]
    unless_null $P383, vivify_143
    new $P383, "Undef"
  vivify_143:
    defined $I384, $P383
    unless $I384, for_undef_144
    iter $P381, $P383
    new $P394, 'ExceptionHandler'
    set_addr $P394, loop393_handler
    $P394."handle_types"(65, 67, 66)
    push_eh $P394
  loop393_test:
    unless $P381, loop393_done
    shift $P385, $P381
  loop393_redo:
    .const 'Sub' $P387 = "31_1258129000.66298" 
    capture_lex $P387
    $P387($P385)
  loop393_next:
    goto loop393_test
  loop393_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P395, exception, 'type'
    eq $P395, 65, loop393_next
    eq $P395, 67, loop393_redo
  loop393_done:
    pop_eh 
  for_undef_144:
.annotate "line", 21
    find_lex $P396, "$/"
    find_lex $P397, "$past"
    $P398 = $P396."!make"($P397)
.annotate "line", 18
    .return ($P398)
  control_375:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P399, exception, "payload"
    .return ($P399)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block386"  :anon :subid("31_1258129000.66298") :outer("30_1258129000.66298")
    .param pmc param_388
.annotate "line", 20
    .lex "$_", param_388
    find_lex $P389, "$past"
    find_lex $P390, "$_"
    $P391 = $P390."ast"()
    $P392 = $P389."push"($P391)
    .return ($P392)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "TOP"  :subid("32_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_403
.annotate "line", 24
    new $P402, 'ExceptionHandler'
    set_addr $P402, control_401
    $P402."handle_types"(58)
    push_eh $P402
    .lex "self", self
    .lex "$/", param_403
.annotate "line", 25
    new $P404, "Undef"
    .lex "$past", $P404
    find_lex $P405, "$/"
    unless_null $P405, vivify_145
    new $P405, "Hash"
  vivify_145:
    set $P406, $P405["nibbler"]
    unless_null $P406, vivify_146
    new $P406, "Undef"
  vivify_146:
    $P407 = $P406."ast"()
    $P408 = "buildsub"($P407)
    store_lex "$past", $P408
.annotate "line", 26
    find_lex $P409, "$past"
    find_lex $P410, "$/"
    $P409."node"($P410)
.annotate "line", 27
    find_lex $P411, "$/"
    find_lex $P412, "$past"
    $P413 = $P411."!make"($P412)
.annotate "line", 24
    .return ($P413)
  control_401:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P414, exception, "payload"
    .return ($P414)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "nibbler"  :subid("33_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_418
    .param pmc param_419 :optional
    .param int has_param_419 :opt_flag
.annotate "line", 30
    .const 'Sub' $P455 = "35_1258129000.66298" 
    capture_lex $P455
    .const 'Sub' $P427 = "34_1258129000.66298" 
    capture_lex $P427
    new $P417, 'ExceptionHandler'
    set_addr $P417, control_416
    $P417."handle_types"(58)
    push_eh $P417
    .lex "self", self
    .lex "$/", param_418
    if has_param_419, optparam_147
    new $P420, "Undef"
    set param_419, $P420
  optparam_147:
    .lex "$key", param_419
.annotate "line", 42
    new $P421, "Undef"
    .lex "$past", $P421
.annotate "line", 31
    find_lex $P423, "$key"
    set $S424, $P423
    iseq $I425, $S424, "open"
    unless $I425, if_422_end
    .const 'Sub' $P427 = "34_1258129000.66298" 
    capture_lex $P427
    $P427()
  if_422_end:
.annotate "line", 41
    get_global $P437, "@MODIFIERS"
    $P437."shift"()
    find_lex $P438, "$past"
.annotate "line", 43
    find_lex $P440, "$/"
    unless_null $P440, vivify_150
    new $P440, "Hash"
  vivify_150:
    set $P441, $P440["termish"]
    unless_null $P441, vivify_151
    new $P441, "Undef"
  vivify_151:
    set $N442, $P441
    new $P443, "Integer"
    assign $P443, 1
    set $N444, $P443
    isgt $I445, $N442, $N444
    if $I445, if_439
.annotate "line", 50
    find_lex $P464, "$/"
    unless_null $P464, vivify_152
    new $P464, "Hash"
  vivify_152:
    set $P465, $P464["termish"]
    unless_null $P465, vivify_153
    new $P465, "ResizablePMCArray"
  vivify_153:
    set $P466, $P465[0]
    unless_null $P466, vivify_154
    new $P466, "Undef"
  vivify_154:
    $P467 = $P466."ast"()
    store_lex "$past", $P467
.annotate "line", 49
    goto if_439_end
  if_439:
.annotate "line", 44
    get_hll_global $P446, ["PAST"], "Regex"
    find_lex $P447, "$/"
    $P448 = $P446."new"("alt" :named("pasttype"), $P447 :named("node"))
    store_lex "$past", $P448
.annotate "line", 45
    find_lex $P450, "$/"
    unless_null $P450, vivify_155
    new $P450, "Hash"
  vivify_155:
    set $P451, $P450["termish"]
    unless_null $P451, vivify_156
    new $P451, "Undef"
  vivify_156:
    defined $I452, $P451
    unless $I452, for_undef_157
    iter $P449, $P451
    new $P462, 'ExceptionHandler'
    set_addr $P462, loop461_handler
    $P462."handle_types"(65, 67, 66)
    push_eh $P462
  loop461_test:
    unless $P449, loop461_done
    shift $P453, $P449
  loop461_redo:
    .const 'Sub' $P455 = "35_1258129000.66298" 
    capture_lex $P455
    $P455($P453)
  loop461_next:
    goto loop461_test
  loop461_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P463, exception, 'type'
    eq $P463, 65, loop461_next
    eq $P463, 67, loop461_redo
  loop461_done:
    pop_eh 
  for_undef_157:
  if_439_end:
.annotate "line", 52
    find_lex $P468, "$/"
    find_lex $P469, "$past"
    $P470 = $P468."!make"($P469)
.annotate "line", 30
    .return ($P470)
  control_416:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P471, exception, "payload"
    .return ($P471)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block426"  :anon :subid("34_1258129000.66298") :outer("33_1258129000.66298")
.annotate "line", 32
    new $P428, "Hash"
    .lex "%old", $P428
.annotate "line", 33
    new $P429, "Hash"
    .lex "%new", $P429
.annotate "line", 32
    get_global $P430, "@MODIFIERS"
    unless_null $P430, vivify_148
    new $P430, "ResizablePMCArray"
  vivify_148:
    set $P431, $P430[0]
    unless_null $P431, vivify_149
    new $P431, "Undef"
  vivify_149:
    store_lex "%old", $P431
.annotate "line", 33

                       $P0 = find_lex '%old'
                       $P432 = clone $P0
                   
    store_lex "%new", $P432
.annotate "line", 37
    get_global $P433, "@MODIFIERS"
    find_lex $P434, "%new"
    $P433."unshift"($P434)
.annotate "line", 38
    new $P435, "Exception"
    set $P435['type'], 58
    new $P436, "Integer"
    assign $P436, 1
    setattribute $P435, 'payload', $P436
    throw $P435
.annotate "line", 31
    .return ()
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block454"  :anon :subid("35_1258129000.66298") :outer("33_1258129000.66298")
    .param pmc param_456
.annotate "line", 45
    .lex "$_", param_456
.annotate "line", 46
    find_lex $P457, "$past"
    find_lex $P458, "$_"
    $P459 = $P458."ast"()
    $P460 = $P457."push"($P459)
.annotate "line", 45
    .return ($P460)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "termish"  :subid("36_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_475
.annotate "line", 55
    .const 'Sub' $P488 = "37_1258129000.66298" 
    capture_lex $P488
    new $P474, 'ExceptionHandler'
    set_addr $P474, control_473
    $P474."handle_types"(58)
    push_eh $P474
    .lex "self", self
    .lex "$/", param_475
.annotate "line", 56
    new $P476, "Undef"
    .lex "$past", $P476
.annotate "line", 57
    new $P477, "Undef"
    .lex "$lastlit", $P477
.annotate "line", 56
    get_hll_global $P478, ["PAST"], "Regex"
    find_lex $P479, "$/"
    $P480 = $P478."new"("concat" :named("pasttype"), $P479 :named("node"))
    store_lex "$past", $P480
.annotate "line", 57
    new $P481, "Integer"
    assign $P481, 0
    store_lex "$lastlit", $P481
.annotate "line", 58
    find_lex $P483, "$/"
    unless_null $P483, vivify_158
    new $P483, "Hash"
  vivify_158:
    set $P484, $P483["noun"]
    unless_null $P484, vivify_159
    new $P484, "Undef"
  vivify_159:
    defined $I485, $P484
    unless $I485, for_undef_160
    iter $P482, $P484
    new $P521, 'ExceptionHandler'
    set_addr $P521, loop520_handler
    $P521."handle_types"(65, 67, 66)
    push_eh $P521
  loop520_test:
    unless $P482, loop520_done
    shift $P486, $P482
  loop520_redo:
    .const 'Sub' $P488 = "37_1258129000.66298" 
    capture_lex $P488
    $P488($P486)
  loop520_next:
    goto loop520_test
  loop520_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P522, exception, 'type'
    eq $P522, 65, loop520_next
    eq $P522, 67, loop520_redo
  loop520_done:
    pop_eh 
  for_undef_160:
.annotate "line", 69
    find_lex $P523, "$/"
    find_lex $P524, "$past"
    $P525 = $P523."!make"($P524)
.annotate "line", 55
    .return ($P525)
  control_473:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P526, exception, "payload"
    .return ($P526)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block487"  :anon :subid("37_1258129000.66298") :outer("36_1258129000.66298")
    .param pmc param_490
.annotate "line", 59
    new $P489, "Undef"
    .lex "$ast", $P489
    .lex "$_", param_490
    find_lex $P491, "$_"
    $P492 = $P491."ast"()
    store_lex "$ast", $P492
.annotate "line", 60
    find_lex $P495, "$ast"
    isfalse $I496, $P495
    if $I496, if_494
.annotate "line", 61
    find_lex $P501, "$lastlit"
    if $P501, if_500
    set $P499, $P501
    goto if_500_end
  if_500:
    find_lex $P502, "$ast"
    $S503 = $P502."pasttype"()
    iseq $I504, $S503, "literal"
    new $P499, 'Integer'
    set $P499, $I504
  if_500_end:
    if $P499, if_498
.annotate "line", 65
    find_lex $P511, "$past"
    find_lex $P512, "$ast"
    $P511."push"($P512)
.annotate "line", 66
    find_lex $P515, "$ast"
    $S516 = $P515."pasttype"()
    iseq $I517, $S516, "literal"
    if $I517, if_514
    new $P519, "Integer"
    assign $P519, 0
    set $P513, $P519
    goto if_514_end
  if_514:
    find_lex $P518, "$ast"
    set $P513, $P518
  if_514_end:
    store_lex "$lastlit", $P513
.annotate "line", 64
    set $P497, $P513
.annotate "line", 61
    goto if_498_end
  if_498:
.annotate "line", 62
    find_lex $P505, "$lastlit"
    unless_null $P505, vivify_161
    new $P505, "ResizablePMCArray"
  vivify_161:
    set $P506, $P505[0]
    unless_null $P506, vivify_162
    new $P506, "Undef"
  vivify_162:
    find_lex $P507, "$ast"
    unless_null $P507, vivify_163
    new $P507, "ResizablePMCArray"
  vivify_163:
    set $P508, $P507[0]
    unless_null $P508, vivify_164
    new $P508, "Undef"
  vivify_164:
    concat $P509, $P506, $P508
    find_lex $P510, "$lastlit"
    unless_null $P510, vivify_165
    new $P510, "ResizablePMCArray"
    store_lex "$lastlit", $P510
  vivify_165:
    set $P510[0], $P509
.annotate "line", 61
    set $P497, $P509
  if_498_end:
    set $P493, $P497
.annotate "line", 60
    goto if_494_end
  if_494:
  if_494_end:
.annotate "line", 58
    .return ($P493)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantified_atom"  :subid("38_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_530
.annotate "line", 72
    .const 'Sub' $P539 = "39_1258129000.66298" 
    capture_lex $P539
    new $P529, 'ExceptionHandler'
    set_addr $P529, control_528
    $P529."handle_types"(58)
    push_eh $P529
    .lex "self", self
    .lex "$/", param_530
.annotate "line", 73
    new $P531, "Undef"
    .lex "$past", $P531
    find_lex $P532, "$/"
    unless_null $P532, vivify_166
    new $P532, "Hash"
  vivify_166:
    set $P533, $P532["atom"]
    unless_null $P533, vivify_167
    new $P533, "Undef"
  vivify_167:
    $P534 = $P533."ast"()
    store_lex "$past", $P534
.annotate "line", 74
    find_lex $P536, "$/"
    unless_null $P536, vivify_168
    new $P536, "Hash"
  vivify_168:
    set $P537, $P536["quantifier"]
    unless_null $P537, vivify_169
    new $P537, "Undef"
  vivify_169:
    if $P537, if_535
.annotate "line", 80
    find_lex $P553, "$/"
    unless_null $P553, vivify_170
    new $P553, "Hash"
  vivify_170:
    set $P554, $P553["backmod"]
    unless_null $P554, vivify_171
    new $P554, "ResizablePMCArray"
  vivify_171:
    set $P555, $P554[0]
    unless_null $P555, vivify_172
    new $P555, "Undef"
  vivify_172:
    unless $P555, if_552_end
    find_lex $P556, "$past"
    find_lex $P557, "$/"
    unless_null $P557, vivify_173
    new $P557, "Hash"
  vivify_173:
    set $P558, $P557["backmod"]
    unless_null $P558, vivify_174
    new $P558, "ResizablePMCArray"
  vivify_174:
    set $P559, $P558[0]
    unless_null $P559, vivify_175
    new $P559, "Undef"
  vivify_175:
    "backmod"($P556, $P559)
  if_552_end:
    goto if_535_end
  if_535:
.annotate "line", 74
    .const 'Sub' $P539 = "39_1258129000.66298" 
    capture_lex $P539
    $P539()
  if_535_end:
.annotate "line", 81
    find_lex $P565, "$past"
    if $P565, if_564
    set $P563, $P565
    goto if_564_end
  if_564:
    find_lex $P566, "$past"
    $P567 = $P566."backtrack"()
    isfalse $I568, $P567
    new $P563, 'Integer'
    set $P563, $I568
  if_564_end:
    if $P563, if_562
    set $P561, $P563
    goto if_562_end
  if_562:
    get_global $P569, "@MODIFIERS"
    unless_null $P569, vivify_179
    new $P569, "ResizablePMCArray"
  vivify_179:
    set $P570, $P569[0]
    unless_null $P570, vivify_180
    new $P570, "Hash"
  vivify_180:
    set $P571, $P570["r"]
    unless_null $P571, vivify_181
    new $P571, "Undef"
  vivify_181:
    set $P561, $P571
  if_562_end:
    unless $P561, if_560_end
.annotate "line", 82
    find_lex $P572, "$past"
    $P572."backtrack"("r")
  if_560_end:
.annotate "line", 84
    find_lex $P573, "$/"
    find_lex $P574, "$past"
    $P575 = $P573."!make"($P574)
.annotate "line", 72
    .return ($P575)
  control_528:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P576, exception, "payload"
    .return ($P576)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block538"  :anon :subid("39_1258129000.66298") :outer("38_1258129000.66298")
.annotate "line", 76
    new $P540, "Undef"
    .lex "$qast", $P540
.annotate "line", 75
    find_lex $P542, "$past"
    isfalse $I543, $P542
    unless $I543, if_541_end
    find_lex $P544, "$/"
    $P544."panic"("Can't quantify zero-width atom")
  if_541_end:
.annotate "line", 76
    find_lex $P545, "$/"
    unless_null $P545, vivify_176
    new $P545, "Hash"
  vivify_176:
    set $P546, $P545["quantifier"]
    unless_null $P546, vivify_177
    new $P546, "ResizablePMCArray"
  vivify_177:
    set $P547, $P546[0]
    unless_null $P547, vivify_178
    new $P547, "Undef"
  vivify_178:
    $P548 = $P547."ast"()
    store_lex "$qast", $P548
.annotate "line", 77
    find_lex $P549, "$qast"
    find_lex $P550, "$past"
    $P549."unshift"($P550)
.annotate "line", 78
    find_lex $P551, "$qast"
    store_lex "$past", $P551
.annotate "line", 74
    .return ($P551)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "atom"  :subid("40_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_580
.annotate "line", 87
    new $P579, 'ExceptionHandler'
    set_addr $P579, control_578
    $P579."handle_types"(58)
    push_eh $P579
    .lex "self", self
    .lex "$/", param_580
.annotate "line", 88
    new $P581, "Undef"
    .lex "$past", $P581
.annotate "line", 87
    find_lex $P582, "$past"
.annotate "line", 89
    find_lex $P584, "$/"
    unless_null $P584, vivify_182
    new $P584, "Hash"
  vivify_182:
    set $P585, $P584["metachar"]
    unless_null $P585, vivify_183
    new $P585, "Undef"
  vivify_183:
    if $P585, if_583
.annotate "line", 91
    get_hll_global $P589, ["PAST"], "Regex"
    find_lex $P590, "$/"
    set $S591, $P590
    find_lex $P592, "$/"
    $P593 = $P589."new"($S591, "literal" :named("pasttype"), $P592 :named("node"))
    store_lex "$past", $P593
.annotate "line", 92
    get_global $P595, "@MODIFIERS"
    unless_null $P595, vivify_184
    new $P595, "ResizablePMCArray"
  vivify_184:
    set $P596, $P595[0]
    unless_null $P596, vivify_185
    new $P596, "Hash"
  vivify_185:
    set $P597, $P596["i"]
    unless_null $P597, vivify_186
    new $P597, "Undef"
  vivify_186:
    unless $P597, if_594_end
    find_lex $P598, "$past"
    $P598."subtype"("ignorecase")
  if_594_end:
.annotate "line", 90
    goto if_583_end
  if_583:
.annotate "line", 89
    find_lex $P586, "$/"
    unless_null $P586, vivify_187
    new $P586, "Hash"
  vivify_187:
    set $P587, $P586["metachar"]
    unless_null $P587, vivify_188
    new $P587, "Undef"
  vivify_188:
    $P588 = $P587."ast"()
    store_lex "$past", $P588
  if_583_end:
.annotate "line", 94
    find_lex $P599, "$/"
    find_lex $P600, "$past"
    $P601 = $P599."!make"($P600)
.annotate "line", 87
    .return ($P601)
  control_578:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P602, exception, "payload"
    .return ($P602)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<*>"  :subid("41_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_606
.annotate "line", 97
    new $P605, 'ExceptionHandler'
    set_addr $P605, control_604
    $P605."handle_types"(58)
    push_eh $P605
    .lex "self", self
    .lex "$/", param_606
.annotate "line", 98
    new $P607, "Undef"
    .lex "$past", $P607
    get_hll_global $P608, ["PAST"], "Regex"
    find_lex $P609, "$/"
    $P610 = $P608."new"("quant" :named("pasttype"), $P609 :named("node"))
    store_lex "$past", $P610
.annotate "line", 99
    find_lex $P611, "$/"
    find_lex $P612, "$past"
    find_lex $P613, "$/"
    unless_null $P613, vivify_189
    new $P613, "Hash"
  vivify_189:
    set $P614, $P613["backmod"]
    unless_null $P614, vivify_190
    new $P614, "Undef"
  vivify_190:
    $P615 = "backmod"($P612, $P614)
    $P616 = $P611."!make"($P615)
.annotate "line", 97
    .return ($P616)
  control_604:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P617, exception, "payload"
    .return ($P617)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<+>"  :subid("42_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_621
.annotate "line", 102
    new $P620, 'ExceptionHandler'
    set_addr $P620, control_619
    $P620."handle_types"(58)
    push_eh $P620
    .lex "self", self
    .lex "$/", param_621
.annotate "line", 103
    new $P622, "Undef"
    .lex "$past", $P622
    get_hll_global $P623, ["PAST"], "Regex"
    find_lex $P624, "$/"
    $P625 = $P623."new"("quant" :named("pasttype"), 1 :named("min"), $P624 :named("node"))
    store_lex "$past", $P625
.annotate "line", 104
    find_lex $P626, "$/"
    find_lex $P627, "$past"
    find_lex $P628, "$/"
    unless_null $P628, vivify_191
    new $P628, "Hash"
  vivify_191:
    set $P629, $P628["backmod"]
    unless_null $P629, vivify_192
    new $P629, "Undef"
  vivify_192:
    $P630 = "backmod"($P627, $P629)
    $P631 = $P626."!make"($P630)
.annotate "line", 102
    .return ($P631)
  control_619:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P632, exception, "payload"
    .return ($P632)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<?>"  :subid("43_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_636
.annotate "line", 107
    new $P635, 'ExceptionHandler'
    set_addr $P635, control_634
    $P635."handle_types"(58)
    push_eh $P635
    .lex "self", self
    .lex "$/", param_636
.annotate "line", 108
    new $P637, "Undef"
    .lex "$past", $P637
    get_hll_global $P638, ["PAST"], "Regex"
    find_lex $P639, "$/"
    $P640 = $P638."new"("quant" :named("pasttype"), 0 :named("min"), 1 :named("max"), $P639 :named("node"))
    store_lex "$past", $P640
.annotate "line", 109
    find_lex $P641, "$/"
    find_lex $P642, "$past"
    find_lex $P643, "$/"
    unless_null $P643, vivify_193
    new $P643, "Hash"
  vivify_193:
    set $P644, $P643["backmod"]
    unless_null $P644, vivify_194
    new $P644, "Undef"
  vivify_194:
    $P645 = "backmod"($P642, $P644)
    $P641."!make"($P645)
.annotate "line", 110
    find_lex $P646, "$/"
    find_lex $P647, "$past"
    $P648 = $P646."!make"($P647)
.annotate "line", 107
    .return ($P648)
  control_634:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P649, exception, "payload"
    .return ($P649)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<**>"  :subid("44_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_653
.annotate "line", 113
    new $P652, 'ExceptionHandler'
    set_addr $P652, control_651
    $P652."handle_types"(58)
    push_eh $P652
    .lex "self", self
    .lex "$/", param_653
.annotate "line", 114
    new $P654, "Undef"
    .lex "$past", $P654
.annotate "line", 113
    find_lex $P655, "$past"
.annotate "line", 115
    find_lex $P657, "$/"
    unless_null $P657, vivify_195
    new $P657, "Hash"
  vivify_195:
    set $P658, $P657["quantified_atom"]
    unless_null $P658, vivify_196
    new $P658, "Undef"
  vivify_196:
    if $P658, if_656
.annotate "line", 120
    get_hll_global $P665, ["PAST"], "Regex"
    find_lex $P666, "$/"
    unless_null $P666, vivify_197
    new $P666, "Hash"
  vivify_197:
    set $P667, $P666["min"]
    unless_null $P667, vivify_198
    new $P667, "Undef"
  vivify_198:
    set $N668, $P667
    find_lex $P669, "$/"
    $P670 = $P665."new"("quant" :named("pasttype"), $N668 :named("min"), $P669 :named("node"))
    store_lex "$past", $P670
.annotate "line", 121
    find_lex $P672, "$/"
    unless_null $P672, vivify_199
    new $P672, "Hash"
  vivify_199:
    set $P673, $P672["max"]
    unless_null $P673, vivify_200
    new $P673, "Undef"
  vivify_200:
    isfalse $I674, $P673
    if $I674, if_671
.annotate "line", 122
    find_lex $P680, "$/"
    unless_null $P680, vivify_201
    new $P680, "Hash"
  vivify_201:
    set $P681, $P680["max"]
    unless_null $P681, vivify_202
    new $P681, "ResizablePMCArray"
  vivify_202:
    set $P682, $P681[0]
    unless_null $P682, vivify_203
    new $P682, "Undef"
  vivify_203:
    set $S683, $P682
    isne $I684, $S683, "*"
    unless $I684, if_679_end
    find_lex $P685, "$past"
    find_lex $P686, "$/"
    unless_null $P686, vivify_204
    new $P686, "Hash"
  vivify_204:
    set $P687, $P686["max"]
    unless_null $P687, vivify_205
    new $P687, "ResizablePMCArray"
  vivify_205:
    set $P688, $P687[0]
    unless_null $P688, vivify_206
    new $P688, "Undef"
  vivify_206:
    set $N689, $P688
    $P685."max"($N689)
  if_679_end:
    goto if_671_end
  if_671:
.annotate "line", 121
    find_lex $P675, "$past"
    find_lex $P676, "$/"
    unless_null $P676, vivify_207
    new $P676, "Hash"
  vivify_207:
    set $P677, $P676["min"]
    unless_null $P677, vivify_208
    new $P677, "Undef"
  vivify_208:
    set $N678, $P677
    $P675."max"($N678)
  if_671_end:
.annotate "line", 119
    goto if_656_end
  if_656:
.annotate "line", 116
    get_hll_global $P659, ["PAST"], "Regex"
.annotate "line", 117
    find_lex $P660, "$/"
    unless_null $P660, vivify_209
    new $P660, "Hash"
  vivify_209:
    set $P661, $P660["quantified_atom"]
    unless_null $P661, vivify_210
    new $P661, "Undef"
  vivify_210:
    $P662 = $P661."ast"()
    find_lex $P663, "$/"
    $P664 = $P659."new"("quant" :named("pasttype"), 1 :named("min"), $P662 :named("sep"), $P663 :named("node"))
.annotate "line", 116
    store_lex "$past", $P664
  if_656_end:
.annotate "line", 124
    find_lex $P690, "$/"
    find_lex $P691, "$past"
    find_lex $P692, "$/"
    unless_null $P692, vivify_211
    new $P692, "Hash"
  vivify_211:
    set $P693, $P692["backmod"]
    unless_null $P693, vivify_212
    new $P693, "Undef"
  vivify_212:
    $P694 = "backmod"($P691, $P693)
    $P695 = $P690."!make"($P694)
.annotate "line", 113
    .return ($P695)
  control_651:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P696, exception, "payload"
    .return ($P696)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<ws>"  :subid("45_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_700
.annotate "line", 127
    new $P699, 'ExceptionHandler'
    set_addr $P699, control_698
    $P699."handle_types"(58)
    push_eh $P699
    .lex "self", self
    .lex "$/", param_700
.annotate "line", 128
    new $P701, "Undef"
    .lex "$past", $P701
.annotate "line", 129
    get_global $P704, "@MODIFIERS"
    unless_null $P704, vivify_213
    new $P704, "ResizablePMCArray"
  vivify_213:
    set $P705, $P704[0]
    unless_null $P705, vivify_214
    new $P705, "Hash"
  vivify_214:
    set $P706, $P705["s"]
    unless_null $P706, vivify_215
    new $P706, "Undef"
  vivify_215:
    if $P706, if_703
    new $P710, "Integer"
    assign $P710, 0
    set $P702, $P710
    goto if_703_end
  if_703:
    get_hll_global $P707, ["PAST"], "Regex"
    find_lex $P708, "$/"
    $P709 = $P707."new"("ws", "subrule" :named("pasttype"), "method" :named("subtype"), $P708 :named("node"))
    set $P702, $P709
  if_703_end:
    store_lex "$past", $P702
.annotate "line", 132
    find_lex $P711, "$/"
    find_lex $P712, "$past"
    $P713 = $P711."!make"($P712)
.annotate "line", 127
    .return ($P713)
  control_698:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P714, exception, "payload"
    .return ($P714)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<[ ]>"  :subid("46_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_718
.annotate "line", 136
    new $P717, 'ExceptionHandler'
    set_addr $P717, control_716
    $P717."handle_types"(58)
    push_eh $P717
    .lex "self", self
    .lex "$/", param_718
.annotate "line", 137
    find_lex $P719, "$/"
    find_lex $P720, "$/"
    unless_null $P720, vivify_216
    new $P720, "Hash"
  vivify_216:
    set $P721, $P720["nibbler"]
    unless_null $P721, vivify_217
    new $P721, "Undef"
  vivify_217:
    $P722 = $P721."ast"()
    $P723 = $P719."!make"($P722)
.annotate "line", 136
    .return ($P723)
  control_716:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P724, exception, "payload"
    .return ($P724)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<( )>"  :subid("47_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_728
.annotate "line", 140
    new $P727, 'ExceptionHandler'
    set_addr $P727, control_726
    $P727."handle_types"(58)
    push_eh $P727
    .lex "self", self
    .lex "$/", param_728
.annotate "line", 141
    new $P729, "Undef"
    .lex "$subpast", $P729
.annotate "line", 142
    new $P730, "Undef"
    .lex "$past", $P730
.annotate "line", 141
    find_lex $P731, "$/"
    unless_null $P731, vivify_218
    new $P731, "Hash"
  vivify_218:
    set $P732, $P731["nibbler"]
    unless_null $P732, vivify_219
    new $P732, "Undef"
  vivify_219:
    $P733 = $P732."ast"()
    $P734 = "buildsub"($P733)
    store_lex "$subpast", $P734
.annotate "line", 142
    get_hll_global $P735, ["PAST"], "Regex"
    find_lex $P736, "$subpast"
    find_lex $P737, "$/"
    $P738 = $P735."new"($P736, "subrule" :named("pasttype"), "capture" :named("subtype"), $P737 :named("node"))
    store_lex "$past", $P738
.annotate "line", 144
    find_lex $P739, "$/"
    find_lex $P740, "$past"
    $P741 = $P739."!make"($P740)
.annotate "line", 140
    .return ($P741)
  control_726:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P742, exception, "payload"
    .return ($P742)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<'>"  :subid("48_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_746
.annotate "line", 147
    new $P745, 'ExceptionHandler'
    set_addr $P745, control_744
    $P745."handle_types"(58)
    push_eh $P745
    .lex "self", self
    .lex "$/", param_746
.annotate "line", 148
    new $P747, "Undef"
    .lex "$past", $P747
    get_hll_global $P748, ["PAST"], "Regex"
    find_lex $P749, "$/"
    unless_null $P749, vivify_220
    new $P749, "Hash"
  vivify_220:
    set $P750, $P749["quote"]
    unless_null $P750, vivify_221
    new $P750, "Hash"
  vivify_221:
    set $P751, $P750["val"]
    unless_null $P751, vivify_222
    new $P751, "Undef"
  vivify_222:
    set $S752, $P751
    find_lex $P753, "$/"
    $P754 = $P748."new"($S752, "literal" :named("pasttype"), $P753 :named("node"))
    store_lex "$past", $P754
.annotate "line", 149
    find_lex $P755, "$/"
    find_lex $P756, "$past"
    $P757 = $P755."!make"($P756)
.annotate "line", 147
    .return ($P757)
  control_744:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P758, exception, "payload"
    .return ($P758)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<.>"  :subid("49_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_762
.annotate "line", 152
    new $P761, 'ExceptionHandler'
    set_addr $P761, control_760
    $P761."handle_types"(58)
    push_eh $P761
    .lex "self", self
    .lex "$/", param_762
.annotate "line", 153
    new $P763, "Undef"
    .lex "$past", $P763
    get_hll_global $P764, ["PAST"], "Regex"
    find_lex $P765, "$/"
    $P766 = $P764."new"("charclass" :named("pasttype"), "." :named("subtype"), $P765 :named("node"))
    store_lex "$past", $P766
.annotate "line", 154
    find_lex $P767, "$/"
    find_lex $P768, "$past"
    $P769 = $P767."!make"($P768)
.annotate "line", 152
    .return ($P769)
  control_760:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P770, exception, "payload"
    .return ($P770)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<^>"  :subid("50_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_774
.annotate "line", 157
    new $P773, 'ExceptionHandler'
    set_addr $P773, control_772
    $P773."handle_types"(58)
    push_eh $P773
    .lex "self", self
    .lex "$/", param_774
.annotate "line", 158
    new $P775, "Undef"
    .lex "$past", $P775
    get_hll_global $P776, ["PAST"], "Regex"
    find_lex $P777, "$/"
    $P778 = $P776."new"("anchor" :named("pasttype"), "bos" :named("subtype"), $P777 :named("node"))
    store_lex "$past", $P778
.annotate "line", 159
    find_lex $P779, "$/"
    find_lex $P780, "$past"
    $P781 = $P779."!make"($P780)
.annotate "line", 157
    .return ($P781)
  control_772:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P782, exception, "payload"
    .return ($P782)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<^^>"  :subid("51_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_786
.annotate "line", 162
    new $P785, 'ExceptionHandler'
    set_addr $P785, control_784
    $P785."handle_types"(58)
    push_eh $P785
    .lex "self", self
    .lex "$/", param_786
.annotate "line", 163
    new $P787, "Undef"
    .lex "$past", $P787
    get_hll_global $P788, ["PAST"], "Regex"
    find_lex $P789, "$/"
    $P790 = $P788."new"("anchor" :named("pasttype"), "bol" :named("subtype"), $P789 :named("node"))
    store_lex "$past", $P790
.annotate "line", 164
    find_lex $P791, "$/"
    find_lex $P792, "$past"
    $P793 = $P791."!make"($P792)
.annotate "line", 162
    .return ($P793)
  control_784:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P794, exception, "payload"
    .return ($P794)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<$>"  :subid("52_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_798
.annotate "line", 167
    new $P797, 'ExceptionHandler'
    set_addr $P797, control_796
    $P797."handle_types"(58)
    push_eh $P797
    .lex "self", self
    .lex "$/", param_798
.annotate "line", 168
    new $P799, "Undef"
    .lex "$past", $P799
    get_hll_global $P800, ["PAST"], "Regex"
    find_lex $P801, "$/"
    $P802 = $P800."new"("anchor" :named("pasttype"), "eos" :named("subtype"), $P801 :named("node"))
    store_lex "$past", $P802
.annotate "line", 169
    find_lex $P803, "$/"
    find_lex $P804, "$past"
    $P805 = $P803."!make"($P804)
.annotate "line", 167
    .return ($P805)
  control_796:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P806, exception, "payload"
    .return ($P806)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<$$>"  :subid("53_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_810
.annotate "line", 172
    new $P809, 'ExceptionHandler'
    set_addr $P809, control_808
    $P809."handle_types"(58)
    push_eh $P809
    .lex "self", self
    .lex "$/", param_810
.annotate "line", 173
    new $P811, "Undef"
    .lex "$past", $P811
    get_hll_global $P812, ["PAST"], "Regex"
    find_lex $P813, "$/"
    $P814 = $P812."new"("anchor" :named("pasttype"), "eol" :named("subtype"), $P813 :named("node"))
    store_lex "$past", $P814
.annotate "line", 174
    find_lex $P815, "$/"
    find_lex $P816, "$past"
    $P817 = $P815."!make"($P816)
.annotate "line", 172
    .return ($P817)
  control_808:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P818, exception, "payload"
    .return ($P818)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<:::>"  :subid("54_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_822
.annotate "line", 177
    new $P821, 'ExceptionHandler'
    set_addr $P821, control_820
    $P821."handle_types"(58)
    push_eh $P821
    .lex "self", self
    .lex "$/", param_822
.annotate "line", 178
    new $P823, "Undef"
    .lex "$past", $P823
    get_hll_global $P824, ["PAST"], "Regex"
    find_lex $P825, "$/"
    $P826 = $P824."new"("cut" :named("pasttype"), $P825 :named("node"))
    store_lex "$past", $P826
.annotate "line", 179
    find_lex $P827, "$/"
    find_lex $P828, "$past"
    $P829 = $P827."!make"($P828)
.annotate "line", 177
    .return ($P829)
  control_820:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P830, exception, "payload"
    .return ($P830)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<lwb>"  :subid("55_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_834
.annotate "line", 182
    new $P833, 'ExceptionHandler'
    set_addr $P833, control_832
    $P833."handle_types"(58)
    push_eh $P833
    .lex "self", self
    .lex "$/", param_834
.annotate "line", 183
    new $P835, "Undef"
    .lex "$past", $P835
    get_hll_global $P836, ["PAST"], "Regex"
    find_lex $P837, "$/"
    $P838 = $P836."new"("anchor" :named("pasttype"), "lwb" :named("subtype"), $P837 :named("node"))
    store_lex "$past", $P838
.annotate "line", 184
    find_lex $P839, "$/"
    find_lex $P840, "$past"
    $P841 = $P839."!make"($P840)
.annotate "line", 182
    .return ($P841)
  control_832:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P842, exception, "payload"
    .return ($P842)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<rwb>"  :subid("56_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_846
.annotate "line", 187
    new $P845, 'ExceptionHandler'
    set_addr $P845, control_844
    $P845."handle_types"(58)
    push_eh $P845
    .lex "self", self
    .lex "$/", param_846
.annotate "line", 188
    new $P847, "Undef"
    .lex "$past", $P847
    get_hll_global $P848, ["PAST"], "Regex"
    find_lex $P849, "$/"
    $P850 = $P848."new"("anchor" :named("pasttype"), "rwb" :named("subtype"), $P849 :named("node"))
    store_lex "$past", $P850
.annotate "line", 189
    find_lex $P851, "$/"
    find_lex $P852, "$past"
    $P853 = $P851."!make"($P852)
.annotate "line", 187
    .return ($P853)
  control_844:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P854, exception, "payload"
    .return ($P854)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<bs>"  :subid("57_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_858
.annotate "line", 192
    new $P857, 'ExceptionHandler'
    set_addr $P857, control_856
    $P857."handle_types"(58)
    push_eh $P857
    .lex "self", self
    .lex "$/", param_858
.annotate "line", 193
    find_lex $P859, "$/"
    find_lex $P860, "$/"
    unless_null $P860, vivify_223
    new $P860, "Hash"
  vivify_223:
    set $P861, $P860["backslash"]
    unless_null $P861, vivify_224
    new $P861, "Undef"
  vivify_224:
    $P862 = $P861."ast"()
    $P863 = $P859."!make"($P862)
.annotate "line", 192
    .return ($P863)
  control_856:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P864, exception, "payload"
    .return ($P864)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<mod>"  :subid("58_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_868
.annotate "line", 196
    new $P867, 'ExceptionHandler'
    set_addr $P867, control_866
    $P867."handle_types"(58)
    push_eh $P867
    .lex "self", self
    .lex "$/", param_868
.annotate "line", 197
    find_lex $P869, "$/"
    find_lex $P870, "$/"
    unless_null $P870, vivify_225
    new $P870, "Hash"
  vivify_225:
    set $P871, $P870["mod_internal"]
    unless_null $P871, vivify_226
    new $P871, "Undef"
  vivify_226:
    $P872 = $P871."ast"()
    $P873 = $P869."!make"($P872)
.annotate "line", 196
    .return ($P873)
  control_866:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P874, exception, "payload"
    .return ($P874)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<assert>"  :subid("59_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_878
.annotate "line", 200
    new $P877, 'ExceptionHandler'
    set_addr $P877, control_876
    $P877."handle_types"(58)
    push_eh $P877
    .lex "self", self
    .lex "$/", param_878
.annotate "line", 201
    find_lex $P879, "$/"
    find_lex $P880, "$/"
    unless_null $P880, vivify_227
    new $P880, "Hash"
  vivify_227:
    set $P881, $P880["assertion"]
    unless_null $P881, vivify_228
    new $P881, "Undef"
  vivify_228:
    $P882 = $P881."ast"()
    $P883 = $P879."!make"($P882)
.annotate "line", 200
    .return ($P883)
  control_876:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P884, exception, "payload"
    .return ($P884)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<~>"  :subid("60_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_888
.annotate "line", 204
    new $P887, 'ExceptionHandler'
    set_addr $P887, control_886
    $P887."handle_types"(58)
    push_eh $P887
    .lex "self", self
    .lex "$/", param_888
.annotate "line", 205
    find_lex $P889, "$/"
    get_hll_global $P890, ["PAST"], "Regex"
.annotate "line", 206
    find_lex $P891, "$/"
    unless_null $P891, vivify_229
    new $P891, "Hash"
  vivify_229:
    set $P892, $P891["EXPR"]
    unless_null $P892, vivify_230
    new $P892, "Undef"
  vivify_230:
    $P893 = $P892."ast"()
.annotate "line", 207
    get_hll_global $P894, ["PAST"], "Regex"
.annotate "line", 208
    find_lex $P895, "$/"
    unless_null $P895, vivify_231
    new $P895, "Hash"
  vivify_231:
    set $P896, $P895["GOAL"]
    unless_null $P896, vivify_232
    new $P896, "Undef"
  vivify_232:
    $P897 = $P896."ast"()
.annotate "line", 209
    get_hll_global $P898, ["PAST"], "Regex"
    find_lex $P899, "$/"
    unless_null $P899, vivify_233
    new $P899, "Hash"
  vivify_233:
    set $P900, $P899["GOAL"]
    unless_null $P900, vivify_234
    new $P900, "Undef"
  vivify_234:
    set $S901, $P900
    $P902 = $P898."new"("FAILGOAL", $S901, "subrule" :named("pasttype"), "method" :named("subtype"))
    $P903 = $P894."new"($P897, $P902, "alt" :named("pasttype"))
.annotate "line", 207
    $P904 = $P890."new"($P893, $P903, "concat" :named("pasttype"))
.annotate "line", 205
    $P905 = $P889."!make"($P904)
.annotate "line", 204
    .return ($P905)
  control_886:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P906, exception, "payload"
    .return ($P906)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<{*}>"  :subid("61_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_910
.annotate "line", 217
    new $P909, 'ExceptionHandler'
    set_addr $P909, control_908
    $P909."handle_types"(58)
    push_eh $P909
    .lex "self", self
    .lex "$/", param_910
.annotate "line", 218
    new $P911, "Undef"
    .lex "$past", $P911
.annotate "line", 219
    find_lex $P914, "$/"
    unless_null $P914, vivify_235
    new $P914, "Hash"
  vivify_235:
    set $P915, $P914["key"]
    unless_null $P915, vivify_236
    new $P915, "Undef"
  vivify_236:
    if $P915, if_913
    new $P923, "Integer"
    assign $P923, 0
    set $P912, $P923
    goto if_913_end
  if_913:
    get_hll_global $P916, ["PAST"], "Regex"
    find_lex $P917, "$/"
    unless_null $P917, vivify_237
    new $P917, "Hash"
  vivify_237:
    set $P918, $P917["key"]
    unless_null $P918, vivify_238
    new $P918, "ResizablePMCArray"
  vivify_238:
    set $P919, $P918[0]
    unless_null $P919, vivify_239
    new $P919, "Undef"
  vivify_239:
    set $S920, $P919
    find_lex $P921, "$/"
    $P922 = $P916."new"($S920, "reduce" :named("pasttype"), $P921 :named("node"))
    set $P912, $P922
  if_913_end:
    store_lex "$past", $P912
.annotate "line", 221
    find_lex $P924, "$/"
    find_lex $P925, "$past"
    $P926 = $P924."!make"($P925)
.annotate "line", 217
    .return ($P926)
  control_908:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P927, exception, "payload"
    .return ($P927)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<var>"  :subid("62_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_931
.annotate "line", 224
    new $P930, 'ExceptionHandler'
    set_addr $P930, control_929
    $P930."handle_types"(58)
    push_eh $P930
    .lex "self", self
    .lex "$/", param_931
.annotate "line", 225
    new $P932, "Undef"
    .lex "$past", $P932
.annotate "line", 226
    new $P933, "Undef"
    .lex "$name", $P933
.annotate "line", 224
    find_lex $P934, "$past"
.annotate "line", 226
    find_lex $P937, "$/"
    unless_null $P937, vivify_240
    new $P937, "Hash"
  vivify_240:
    set $P938, $P937["pos"]
    unless_null $P938, vivify_241
    new $P938, "Undef"
  vivify_241:
    if $P938, if_936
    find_lex $P942, "$/"
    unless_null $P942, vivify_242
    new $P942, "Hash"
  vivify_242:
    set $P943, $P942["name"]
    unless_null $P943, vivify_243
    new $P943, "Undef"
  vivify_243:
    set $S944, $P943
    new $P935, 'String'
    set $P935, $S944
    goto if_936_end
  if_936:
    find_lex $P939, "$/"
    unless_null $P939, vivify_244
    new $P939, "Hash"
  vivify_244:
    set $P940, $P939["pos"]
    unless_null $P940, vivify_245
    new $P940, "Undef"
  vivify_245:
    set $N941, $P940
    new $P935, 'Float'
    set $P935, $N941
  if_936_end:
    store_lex "$name", $P935
.annotate "line", 227
    find_lex $P946, "$/"
    unless_null $P946, vivify_246
    new $P946, "Hash"
  vivify_246:
    set $P947, $P946["quantified_atom"]
    unless_null $P947, vivify_247
    new $P947, "Undef"
  vivify_247:
    if $P947, if_945
.annotate "line", 238
    get_hll_global $P976, ["PAST"], "Regex"
    find_lex $P977, "$name"
    find_lex $P978, "$/"
    $P979 = $P976."new"("!BACKREF", $P977, "subrule" :named("pasttype"), "method" :named("subtype"), $P978 :named("node"))
    store_lex "$past", $P979
.annotate "line", 237
    goto if_945_end
  if_945:
.annotate "line", 228
    find_lex $P948, "$/"
    unless_null $P948, vivify_248
    new $P948, "Hash"
  vivify_248:
    set $P949, $P948["quantified_atom"]
    unless_null $P949, vivify_249
    new $P949, "ResizablePMCArray"
  vivify_249:
    set $P950, $P949[0]
    unless_null $P950, vivify_250
    new $P950, "Undef"
  vivify_250:
    $P951 = $P950."ast"()
    store_lex "$past", $P951
.annotate "line", 229
    find_lex $P955, "$past"
    $S956 = $P955."pasttype"()
    iseq $I957, $S956, "quant"
    if $I957, if_954
    new $P953, 'Integer'
    set $P953, $I957
    goto if_954_end
  if_954:
    find_lex $P958, "$past"
    unless_null $P958, vivify_251
    new $P958, "ResizablePMCArray"
  vivify_251:
    set $P959, $P958[0]
    unless_null $P959, vivify_252
    new $P959, "Undef"
  vivify_252:
    $S960 = $P959."pasttype"()
    iseq $I961, $S960, "subrule"
    new $P953, 'Integer'
    set $P953, $I961
  if_954_end:
    if $P953, if_952
.annotate "line", 232
    find_lex $P966, "$past"
    $S967 = $P966."pasttype"()
    iseq $I968, $S967, "subrule"
    if $I968, if_965
.annotate "line", 234
    get_hll_global $P971, ["PAST"], "Regex"
    find_lex $P972, "$past"
    find_lex $P973, "$name"
    find_lex $P974, "$/"
    $P975 = $P971."new"($P972, $P973 :named("name"), "subcapture" :named("pasttype"), $P974 :named("node"))
    store_lex "$past", $P975
.annotate "line", 233
    goto if_965_end
  if_965:
.annotate "line", 232
    find_lex $P969, "$past"
    find_lex $P970, "$name"
    "subrule_alias"($P969, $P970)
  if_965_end:
    goto if_952_end
  if_952:
.annotate "line", 230
    find_lex $P962, "$past"
    unless_null $P962, vivify_253
    new $P962, "ResizablePMCArray"
  vivify_253:
    set $P963, $P962[0]
    unless_null $P963, vivify_254
    new $P963, "Undef"
  vivify_254:
    find_lex $P964, "$name"
    "subrule_alias"($P963, $P964)
  if_952_end:
  if_945_end:
.annotate "line", 241
    find_lex $P980, "$/"
    find_lex $P981, "$past"
    $P982 = $P980."!make"($P981)
.annotate "line", 224
    .return ($P982)
  control_929:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P983, exception, "payload"
    .return ($P983)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<PIR>"  :subid("63_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_987
.annotate "line", 244
    new $P986, 'ExceptionHandler'
    set_addr $P986, control_985
    $P986."handle_types"(58)
    push_eh $P986
    .lex "self", self
    .lex "$/", param_987
.annotate "line", 245
    find_lex $P988, "$/"
    get_hll_global $P989, ["PAST"], "Regex"
.annotate "line", 246
    get_hll_global $P990, ["PAST"], "Op"
    find_lex $P991, "$/"
    unless_null $P991, vivify_255
    new $P991, "Hash"
  vivify_255:
    set $P992, $P991["pir"]
    unless_null $P992, vivify_256
    new $P992, "Undef"
  vivify_256:
    set $S993, $P992
    $P994 = $P990."new"($S993 :named("inline"), "inline" :named("pasttype"))
    find_lex $P995, "$/"
    $P996 = $P989."new"($P994, "pastnode" :named("pasttype"), $P995 :named("node"))
.annotate "line", 245
    $P997 = $P988."!make"($P996)
.annotate "line", 244
    .return ($P997)
  control_985:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P998, exception, "payload"
    .return ($P998)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<w>"  :subid("64_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_1002
.annotate "line", 252
    new $P1001, 'ExceptionHandler'
    set_addr $P1001, control_1000
    $P1001."handle_types"(58)
    push_eh $P1001
    .lex "self", self
    .lex "$/", param_1002
.annotate "line", 253
    new $P1003, "Undef"
    .lex "$subtype", $P1003
.annotate "line", 254
    new $P1004, "Undef"
    .lex "$past", $P1004
.annotate "line", 253
    find_lex $P1007, "$/"
    unless_null $P1007, vivify_257
    new $P1007, "Hash"
  vivify_257:
    set $P1008, $P1007["sym"]
    unless_null $P1008, vivify_258
    new $P1008, "Undef"
  vivify_258:
    set $S1009, $P1008
    iseq $I1010, $S1009, "n"
    if $I1010, if_1006
    find_lex $P1012, "$/"
    unless_null $P1012, vivify_259
    new $P1012, "Hash"
  vivify_259:
    set $P1013, $P1012["sym"]
    unless_null $P1013, vivify_260
    new $P1013, "Undef"
  vivify_260:
    set $S1014, $P1013
    new $P1005, 'String'
    set $P1005, $S1014
    goto if_1006_end
  if_1006:
    new $P1011, "String"
    assign $P1011, "nl"
    set $P1005, $P1011
  if_1006_end:
    store_lex "$subtype", $P1005
.annotate "line", 254
    get_hll_global $P1015, ["PAST"], "Regex"
    find_lex $P1016, "$subtype"
    find_lex $P1017, "$/"
    $P1018 = $P1015."new"("charclass" :named("pasttype"), $P1016 :named("subtype"), $P1017 :named("node"))
    store_lex "$past", $P1018
.annotate "line", 255
    find_lex $P1019, "$/"
    find_lex $P1020, "$past"
    $P1021 = $P1019."!make"($P1020)
.annotate "line", 252
    .return ($P1021)
  control_1000:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1022, exception, "payload"
    .return ($P1022)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<b>"  :subid("65_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_1026
.annotate "line", 258
    new $P1025, 'ExceptionHandler'
    set_addr $P1025, control_1024
    $P1025."handle_types"(58)
    push_eh $P1025
    .lex "self", self
    .lex "$/", param_1026
.annotate "line", 259
    new $P1027, "Undef"
    .lex "$past", $P1027
    get_hll_global $P1028, ["PAST"], "Regex"
.annotate "line", 260
    find_lex $P1029, "$/"
    unless_null $P1029, vivify_261
    new $P1029, "Hash"
  vivify_261:
    set $P1030, $P1029["sym"]
    unless_null $P1030, vivify_262
    new $P1030, "Undef"
  vivify_262:
    set $S1031, $P1030
    iseq $I1032, $S1031, "B"
    find_lex $P1033, "$/"
    $P1034 = $P1028."new"("\b", "enumcharlist" :named("pasttype"), $I1032 :named("negate"), $P1033 :named("node"))
.annotate "line", 259
    store_lex "$past", $P1034
.annotate "line", 261
    find_lex $P1035, "$/"
    find_lex $P1036, "$past"
    $P1037 = $P1035."!make"($P1036)
.annotate "line", 258
    .return ($P1037)
  control_1024:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1038, exception, "payload"
    .return ($P1038)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<e>"  :subid("66_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_1042
.annotate "line", 264
    new $P1041, 'ExceptionHandler'
    set_addr $P1041, control_1040
    $P1041."handle_types"(58)
    push_eh $P1041
    .lex "self", self
    .lex "$/", param_1042
.annotate "line", 265
    new $P1043, "Undef"
    .lex "$past", $P1043
    get_hll_global $P1044, ["PAST"], "Regex"
.annotate "line", 266
    find_lex $P1045, "$/"
    unless_null $P1045, vivify_263
    new $P1045, "Hash"
  vivify_263:
    set $P1046, $P1045["sym"]
    unless_null $P1046, vivify_264
    new $P1046, "Undef"
  vivify_264:
    set $S1047, $P1046
    iseq $I1048, $S1047, "E"
    find_lex $P1049, "$/"
    $P1050 = $P1044."new"("\\e", "enumcharlist" :named("pasttype"), $I1048 :named("negate"), $P1049 :named("node"))
.annotate "line", 265
    store_lex "$past", $P1050
.annotate "line", 267
    find_lex $P1051, "$/"
    find_lex $P1052, "$past"
    $P1053 = $P1051."!make"($P1052)
.annotate "line", 264
    .return ($P1053)
  control_1040:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1054, exception, "payload"
    .return ($P1054)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<f>"  :subid("67_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_1058
.annotate "line", 270
    new $P1057, 'ExceptionHandler'
    set_addr $P1057, control_1056
    $P1057."handle_types"(58)
    push_eh $P1057
    .lex "self", self
    .lex "$/", param_1058
.annotate "line", 271
    new $P1059, "Undef"
    .lex "$past", $P1059
    get_hll_global $P1060, ["PAST"], "Regex"
.annotate "line", 272
    find_lex $P1061, "$/"
    unless_null $P1061, vivify_265
    new $P1061, "Hash"
  vivify_265:
    set $P1062, $P1061["sym"]
    unless_null $P1062, vivify_266
    new $P1062, "Undef"
  vivify_266:
    set $S1063, $P1062
    iseq $I1064, $S1063, "F"
    find_lex $P1065, "$/"
    $P1066 = $P1060."new"("\\f", "enumcharlist" :named("pasttype"), $I1064 :named("negate"), $P1065 :named("node"))
.annotate "line", 271
    store_lex "$past", $P1066
.annotate "line", 273
    find_lex $P1067, "$/"
    find_lex $P1068, "$past"
    $P1069 = $P1067."!make"($P1068)
.annotate "line", 270
    .return ($P1069)
  control_1056:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1070, exception, "payload"
    .return ($P1070)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<h>"  :subid("68_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_1074
.annotate "line", 276
    new $P1073, 'ExceptionHandler'
    set_addr $P1073, control_1072
    $P1073."handle_types"(58)
    push_eh $P1073
    .lex "self", self
    .lex "$/", param_1074
.annotate "line", 277
    new $P1075, "Undef"
    .lex "$past", $P1075
    get_hll_global $P1076, ["PAST"], "Regex"
.annotate "line", 278
    find_lex $P1077, "$/"
    unless_null $P1077, vivify_267
    new $P1077, "Hash"
  vivify_267:
    set $P1078, $P1077["sym"]
    unless_null $P1078, vivify_268
    new $P1078, "Undef"
  vivify_268:
    set $S1079, $P1078
    iseq $I1080, $S1079, "H"
    find_lex $P1081, "$/"
    $P1082 = $P1076."new"(unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", "enumcharlist" :named("pasttype"), $I1080 :named("negate"), $P1081 :named("node"))
.annotate "line", 277
    store_lex "$past", $P1082
.annotate "line", 279
    find_lex $P1083, "$/"
    find_lex $P1084, "$past"
    $P1085 = $P1083."!make"($P1084)
.annotate "line", 276
    .return ($P1085)
  control_1072:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1086, exception, "payload"
    .return ($P1086)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<r>"  :subid("69_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_1090
.annotate "line", 282
    new $P1089, 'ExceptionHandler'
    set_addr $P1089, control_1088
    $P1089."handle_types"(58)
    push_eh $P1089
    .lex "self", self
    .lex "$/", param_1090
.annotate "line", 283
    new $P1091, "Undef"
    .lex "$past", $P1091
    get_hll_global $P1092, ["PAST"], "Regex"
.annotate "line", 284
    find_lex $P1093, "$/"
    unless_null $P1093, vivify_269
    new $P1093, "Hash"
  vivify_269:
    set $P1094, $P1093["sym"]
    unless_null $P1094, vivify_270
    new $P1094, "Undef"
  vivify_270:
    set $S1095, $P1094
    iseq $I1096, $S1095, "R"
    find_lex $P1097, "$/"
    $P1098 = $P1092."new"("\r", "enumcharlist" :named("pasttype"), $I1096 :named("negate"), $P1097 :named("node"))
.annotate "line", 283
    store_lex "$past", $P1098
.annotate "line", 285
    find_lex $P1099, "$/"
    find_lex $P1100, "$past"
    $P1101 = $P1099."!make"($P1100)
.annotate "line", 282
    .return ($P1101)
  control_1088:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1102, exception, "payload"
    .return ($P1102)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<t>"  :subid("70_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_1106
.annotate "line", 288
    new $P1105, 'ExceptionHandler'
    set_addr $P1105, control_1104
    $P1105."handle_types"(58)
    push_eh $P1105
    .lex "self", self
    .lex "$/", param_1106
.annotate "line", 289
    new $P1107, "Undef"
    .lex "$past", $P1107
    get_hll_global $P1108, ["PAST"], "Regex"
.annotate "line", 290
    find_lex $P1109, "$/"
    unless_null $P1109, vivify_271
    new $P1109, "Hash"
  vivify_271:
    set $P1110, $P1109["sym"]
    unless_null $P1110, vivify_272
    new $P1110, "Undef"
  vivify_272:
    set $S1111, $P1110
    iseq $I1112, $S1111, "T"
    find_lex $P1113, "$/"
    $P1114 = $P1108."new"("\t", "enumcharlist" :named("pasttype"), $I1112 :named("negate"), $P1113 :named("node"))
.annotate "line", 289
    store_lex "$past", $P1114
.annotate "line", 291
    find_lex $P1115, "$/"
    find_lex $P1116, "$past"
    $P1117 = $P1115."!make"($P1116)
.annotate "line", 288
    .return ($P1117)
  control_1104:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1118, exception, "payload"
    .return ($P1118)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<v>"  :subid("71_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_1122
.annotate "line", 294
    new $P1121, 'ExceptionHandler'
    set_addr $P1121, control_1120
    $P1121."handle_types"(58)
    push_eh $P1121
    .lex "self", self
    .lex "$/", param_1122
.annotate "line", 295
    new $P1123, "Undef"
    .lex "$past", $P1123
    get_hll_global $P1124, ["PAST"], "Regex"
.annotate "line", 297
    find_lex $P1125, "$/"
    unless_null $P1125, vivify_273
    new $P1125, "Hash"
  vivify_273:
    set $P1126, $P1125["sym"]
    unless_null $P1126, vivify_274
    new $P1126, "Undef"
  vivify_274:
    set $S1127, $P1126
    iseq $I1128, $S1127, "V"
    find_lex $P1129, "$/"
    $P1130 = $P1124."new"(unicode:"\n\x{b}\f\r\x{85}\u2028\u2029", "enumcharlist" :named("pasttype"), $I1128 :named("negate"), $P1129 :named("node"))
.annotate "line", 295
    store_lex "$past", $P1130
.annotate "line", 298
    find_lex $P1131, "$/"
    find_lex $P1132, "$past"
    $P1133 = $P1131."!make"($P1132)
.annotate "line", 294
    .return ($P1133)
  control_1120:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1134, exception, "payload"
    .return ($P1134)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<o>"  :subid("72_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_1138
.annotate "line", 301
    new $P1137, 'ExceptionHandler'
    set_addr $P1137, control_1136
    $P1137."handle_types"(58)
    push_eh $P1137
    .lex "self", self
    .lex "$/", param_1138
.annotate "line", 302
    new $P1139, "Undef"
    .lex "$octlit", $P1139
.annotate "line", 303
    get_hll_global $P1140, ["HLL";"Actions"], "ints_to_string"
    find_lex $P1143, "$/"
    unless_null $P1143, vivify_275
    new $P1143, "Hash"
  vivify_275:
    set $P1144, $P1143["octint"]
    unless_null $P1144, vivify_276
    new $P1144, "Undef"
  vivify_276:
    unless $P1144, unless_1142
    set $P1141, $P1144
    goto unless_1142_end
  unless_1142:
    find_lex $P1145, "$/"
    unless_null $P1145, vivify_277
    new $P1145, "Hash"
  vivify_277:
    set $P1146, $P1145["octints"]
    unless_null $P1146, vivify_278
    new $P1146, "Hash"
  vivify_278:
    set $P1147, $P1146["octint"]
    unless_null $P1147, vivify_279
    new $P1147, "Undef"
  vivify_279:
    set $P1141, $P1147
  unless_1142_end:
    $P1148 = $P1140($P1141)
    store_lex "$octlit", $P1148
.annotate "line", 304
    find_lex $P1149, "$/"
    find_lex $P1152, "$/"
    unless_null $P1152, vivify_280
    new $P1152, "Hash"
  vivify_280:
    set $P1153, $P1152["sym"]
    unless_null $P1153, vivify_281
    new $P1153, "Undef"
  vivify_281:
    set $S1154, $P1153
    iseq $I1155, $S1154, "O"
    if $I1155, if_1151
.annotate "line", 307
    get_hll_global $P1160, ["PAST"], "Regex"
    find_lex $P1161, "$octlit"
    find_lex $P1162, "$/"
    $P1163 = $P1160."new"($P1161, "literal" :named("pasttype"), $P1162 :named("node"))
    set $P1150, $P1163
.annotate "line", 304
    goto if_1151_end
  if_1151:
.annotate "line", 305
    get_hll_global $P1156, ["PAST"], "Regex"
    find_lex $P1157, "$octlit"
    find_lex $P1158, "$/"
    $P1159 = $P1156."new"($P1157, "enumcharlist" :named("pasttype"), 1 :named("negate"), $P1158 :named("node"))
    set $P1150, $P1159
  if_1151_end:
    $P1164 = $P1149."!make"($P1150)
.annotate "line", 301
    .return ($P1164)
  control_1136:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1165, exception, "payload"
    .return ($P1165)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<x>"  :subid("73_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_1169
.annotate "line", 310
    new $P1168, 'ExceptionHandler'
    set_addr $P1168, control_1167
    $P1168."handle_types"(58)
    push_eh $P1168
    .lex "self", self
    .lex "$/", param_1169
.annotate "line", 311
    new $P1170, "Undef"
    .lex "$hexlit", $P1170
.annotate "line", 312
    get_hll_global $P1171, ["HLL";"Actions"], "ints_to_string"
    find_lex $P1174, "$/"
    unless_null $P1174, vivify_282
    new $P1174, "Hash"
  vivify_282:
    set $P1175, $P1174["hexint"]
    unless_null $P1175, vivify_283
    new $P1175, "Undef"
  vivify_283:
    unless $P1175, unless_1173
    set $P1172, $P1175
    goto unless_1173_end
  unless_1173:
    find_lex $P1176, "$/"
    unless_null $P1176, vivify_284
    new $P1176, "Hash"
  vivify_284:
    set $P1177, $P1176["hexints"]
    unless_null $P1177, vivify_285
    new $P1177, "Hash"
  vivify_285:
    set $P1178, $P1177["hexint"]
    unless_null $P1178, vivify_286
    new $P1178, "Undef"
  vivify_286:
    set $P1172, $P1178
  unless_1173_end:
    $P1179 = $P1171($P1172)
    store_lex "$hexlit", $P1179
.annotate "line", 313
    find_lex $P1180, "$/"
    find_lex $P1183, "$/"
    unless_null $P1183, vivify_287
    new $P1183, "Hash"
  vivify_287:
    set $P1184, $P1183["sym"]
    unless_null $P1184, vivify_288
    new $P1184, "Undef"
  vivify_288:
    set $S1185, $P1184
    iseq $I1186, $S1185, "X"
    if $I1186, if_1182
.annotate "line", 316
    get_hll_global $P1191, ["PAST"], "Regex"
    find_lex $P1192, "$hexlit"
    find_lex $P1193, "$/"
    $P1194 = $P1191."new"($P1192, "literal" :named("pasttype"), $P1193 :named("node"))
    set $P1181, $P1194
.annotate "line", 313
    goto if_1182_end
  if_1182:
.annotate "line", 314
    get_hll_global $P1187, ["PAST"], "Regex"
    find_lex $P1188, "$hexlit"
    find_lex $P1189, "$/"
    $P1190 = $P1187."new"($P1188, "enumcharlist" :named("pasttype"), 1 :named("negate"), $P1189 :named("node"))
    set $P1181, $P1190
  if_1182_end:
    $P1195 = $P1180."!make"($P1181)
.annotate "line", 310
    .return ($P1195)
  control_1167:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1196, exception, "payload"
    .return ($P1196)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<misc>"  :subid("74_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_1200
.annotate "line", 319
    new $P1199, 'ExceptionHandler'
    set_addr $P1199, control_1198
    $P1199."handle_types"(58)
    push_eh $P1199
    .lex "self", self
    .lex "$/", param_1200
.annotate "line", 320
    new $P1201, "Undef"
    .lex "$past", $P1201
    get_hll_global $P1202, ["PAST"], "Regex"
    find_lex $P1203, "$/"
    set $S1204, $P1203
    find_lex $P1205, "$/"
    $P1206 = $P1202."new"($S1204, "literal" :named("pasttype"), $P1205 :named("node"))
    store_lex "$past", $P1206
.annotate "line", 321
    find_lex $P1207, "$/"
    find_lex $P1208, "$past"
    $P1209 = $P1207."!make"($P1208)
.annotate "line", 319
    .return ($P1209)
  control_1198:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1210, exception, "payload"
    .return ($P1210)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<?>"  :subid("75_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_1214
.annotate "line", 325
    new $P1213, 'ExceptionHandler'
    set_addr $P1213, control_1212
    $P1213."handle_types"(58)
    push_eh $P1213
    .lex "self", self
    .lex "$/", param_1214
.annotate "line", 326
    new $P1215, "Undef"
    .lex "$past", $P1215
.annotate "line", 325
    find_lex $P1216, "$past"
.annotate "line", 327
    find_lex $P1218, "$/"
    unless_null $P1218, vivify_289
    new $P1218, "Hash"
  vivify_289:
    set $P1219, $P1218["assertion"]
    unless_null $P1219, vivify_290
    new $P1219, "Undef"
  vivify_290:
    if $P1219, if_1217
.annotate "line", 331
    new $P1224, "Integer"
    assign $P1224, 0
    store_lex "$past", $P1224
    goto if_1217_end
  if_1217:
.annotate "line", 328
    find_lex $P1220, "$/"
    unless_null $P1220, vivify_291
    new $P1220, "Hash"
  vivify_291:
    set $P1221, $P1220["assertion"]
    unless_null $P1221, vivify_292
    new $P1221, "Undef"
  vivify_292:
    $P1222 = $P1221."ast"()
    store_lex "$past", $P1222
.annotate "line", 329
    find_lex $P1223, "$past"
    $P1223."subtype"("zerowidth")
  if_1217_end:
.annotate "line", 332
    find_lex $P1225, "$/"
    find_lex $P1226, "$past"
    $P1227 = $P1225."!make"($P1226)
.annotate "line", 325
    .return ($P1227)
  control_1212:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1228, exception, "payload"
    .return ($P1228)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<!>"  :subid("76_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_1232
.annotate "line", 335
    new $P1231, 'ExceptionHandler'
    set_addr $P1231, control_1230
    $P1231."handle_types"(58)
    push_eh $P1231
    .lex "self", self
    .lex "$/", param_1232
.annotate "line", 336
    new $P1233, "Undef"
    .lex "$past", $P1233
.annotate "line", 335
    find_lex $P1234, "$past"
.annotate "line", 337
    find_lex $P1236, "$/"
    unless_null $P1236, vivify_293
    new $P1236, "Hash"
  vivify_293:
    set $P1237, $P1236["assertion"]
    unless_null $P1237, vivify_294
    new $P1237, "Undef"
  vivify_294:
    if $P1237, if_1235
.annotate "line", 343
    get_hll_global $P1246, ["PAST"], "Regex"
    find_lex $P1247, "$/"
    $P1248 = $P1246."new"("anchor" :named("pasttype"), "fail" :named("subtype"), $P1247 :named("node"))
    store_lex "$past", $P1248
.annotate "line", 342
    goto if_1235_end
  if_1235:
.annotate "line", 338
    find_lex $P1238, "$/"
    unless_null $P1238, vivify_295
    new $P1238, "Hash"
  vivify_295:
    set $P1239, $P1238["assertion"]
    unless_null $P1239, vivify_296
    new $P1239, "Undef"
  vivify_296:
    $P1240 = $P1239."ast"()
    store_lex "$past", $P1240
.annotate "line", 339
    find_lex $P1241, "$past"
    find_lex $P1242, "$past"
    $P1243 = $P1242."negate"()
    isfalse $I1244, $P1243
    $P1241."negate"($I1244)
.annotate "line", 340
    find_lex $P1245, "$past"
    $P1245."subtype"("zerowidth")
  if_1235_end:
.annotate "line", 345
    find_lex $P1249, "$/"
    find_lex $P1250, "$past"
    $P1251 = $P1249."!make"($P1250)
.annotate "line", 335
    .return ($P1251)
  control_1230:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1252, exception, "payload"
    .return ($P1252)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<method>"  :subid("77_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_1256
.annotate "line", 348
    new $P1255, 'ExceptionHandler'
    set_addr $P1255, control_1254
    $P1255."handle_types"(58)
    push_eh $P1255
    .lex "self", self
    .lex "$/", param_1256
.annotate "line", 349
    new $P1257, "Undef"
    .lex "$past", $P1257
    find_lex $P1258, "$/"
    unless_null $P1258, vivify_297
    new $P1258, "Hash"
  vivify_297:
    set $P1259, $P1258["assertion"]
    unless_null $P1259, vivify_298
    new $P1259, "Undef"
  vivify_298:
    $P1260 = $P1259."ast"()
    store_lex "$past", $P1260
.annotate "line", 350
    find_lex $P1261, "$past"
    $P1261."subtype"("method")
.annotate "line", 351
    find_lex $P1262, "$/"
    find_lex $P1263, "$past"
    $P1264 = $P1262."!make"($P1263)
.annotate "line", 348
    .return ($P1264)
  control_1254:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1265, exception, "payload"
    .return ($P1265)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<name>"  :subid("78_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_1269
.annotate "line", 354
    .const 'Sub' $P1327 = "80_1258129000.66298" 
    capture_lex $P1327
    .const 'Sub' $P1291 = "79_1258129000.66298" 
    capture_lex $P1291
    new $P1268, 'ExceptionHandler'
    set_addr $P1268, control_1267
    $P1268."handle_types"(58)
    push_eh $P1268
    .lex "self", self
    .lex "$/", param_1269
.annotate "line", 355
    new $P1270, "Undef"
    .lex "$name", $P1270
.annotate "line", 356
    new $P1271, "Undef"
    .lex "$past", $P1271
.annotate "line", 355
    find_lex $P1272, "$/"
    unless_null $P1272, vivify_299
    new $P1272, "Hash"
  vivify_299:
    set $P1273, $P1272["longname"]
    unless_null $P1273, vivify_300
    new $P1273, "Undef"
  vivify_300:
    set $S1274, $P1273
    new $P1275, 'String'
    set $P1275, $S1274
    store_lex "$name", $P1275
    find_lex $P1276, "$past"
.annotate "line", 357
    find_lex $P1278, "$/"
    unless_null $P1278, vivify_301
    new $P1278, "Hash"
  vivify_301:
    set $P1279, $P1278["assertion"]
    unless_null $P1279, vivify_302
    new $P1279, "Undef"
  vivify_302:
    if $P1279, if_1277
.annotate "line", 361
    find_lex $P1287, "$name"
    set $S1288, $P1287
    iseq $I1289, $S1288, "sym"
    if $I1289, if_1286
.annotate "line", 377
    get_hll_global $P1301, ["PAST"], "Regex"
    find_lex $P1302, "$name"
    find_lex $P1303, "$name"
    find_lex $P1304, "$/"
    $P1305 = $P1301."new"($P1302, $P1303 :named("name"), "subrule" :named("pasttype"), "capture" :named("subtype"), $P1304 :named("node"))
    store_lex "$past", $P1305
.annotate "line", 379
    find_lex $P1307, "$/"
    unless_null $P1307, vivify_303
    new $P1307, "Hash"
  vivify_303:
    set $P1308, $P1307["nibbler"]
    unless_null $P1308, vivify_304
    new $P1308, "Undef"
  vivify_304:
    if $P1308, if_1306
.annotate "line", 382
    find_lex $P1316, "$/"
    unless_null $P1316, vivify_305
    new $P1316, "Hash"
  vivify_305:
    set $P1317, $P1316["arglist"]
    unless_null $P1317, vivify_306
    new $P1317, "Undef"
  vivify_306:
    unless $P1317, if_1315_end
.annotate "line", 383
    find_lex $P1319, "$/"
    unless_null $P1319, vivify_307
    new $P1319, "Hash"
  vivify_307:
    set $P1320, $P1319["arglist"]
    unless_null $P1320, vivify_308
    new $P1320, "ResizablePMCArray"
  vivify_308:
    set $P1321, $P1320[0]
    unless_null $P1321, vivify_309
    new $P1321, "Undef"
  vivify_309:
    $P1322 = $P1321."ast"()
    $P1323 = $P1322."list"()
    defined $I1324, $P1323
    unless $I1324, for_undef_310
    iter $P1318, $P1323
    new $P1333, 'ExceptionHandler'
    set_addr $P1333, loop1332_handler
    $P1333."handle_types"(65, 67, 66)
    push_eh $P1333
  loop1332_test:
    unless $P1318, loop1332_done
    shift $P1325, $P1318
  loop1332_redo:
    .const 'Sub' $P1327 = "80_1258129000.66298" 
    capture_lex $P1327
    $P1327($P1325)
  loop1332_next:
    goto loop1332_test
  loop1332_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1334, exception, 'type'
    eq $P1334, 65, loop1332_next
    eq $P1334, 67, loop1332_redo
  loop1332_done:
    pop_eh 
  for_undef_310:
  if_1315_end:
.annotate "line", 382
    goto if_1306_end
  if_1306:
.annotate "line", 380
    find_lex $P1309, "$past"
    find_lex $P1310, "$/"
    unless_null $P1310, vivify_311
    new $P1310, "Hash"
  vivify_311:
    set $P1311, $P1310["nibbler"]
    unless_null $P1311, vivify_312
    new $P1311, "ResizablePMCArray"
  vivify_312:
    set $P1312, $P1311[0]
    unless_null $P1312, vivify_313
    new $P1312, "Undef"
  vivify_313:
    $P1313 = $P1312."ast"()
    $P1314 = "buildsub"($P1313)
    $P1309."push"($P1314)
  if_1306_end:
.annotate "line", 376
    goto if_1286_end
  if_1286:
.annotate "line", 361
    .const 'Sub' $P1291 = "79_1258129000.66298" 
    capture_lex $P1291
    $P1291()
  if_1286_end:
    goto if_1277_end
  if_1277:
.annotate "line", 358
    find_lex $P1280, "$/"
    unless_null $P1280, vivify_314
    new $P1280, "Hash"
  vivify_314:
    set $P1281, $P1280["assertion"]
    unless_null $P1281, vivify_315
    new $P1281, "ResizablePMCArray"
  vivify_315:
    set $P1282, $P1281[0]
    unless_null $P1282, vivify_316
    new $P1282, "Undef"
  vivify_316:
    $P1283 = $P1282."ast"()
    store_lex "$past", $P1283
.annotate "line", 359
    find_lex $P1284, "$past"
    find_lex $P1285, "$name"
    "subrule_alias"($P1284, $P1285)
  if_1277_end:
.annotate "line", 386
    find_lex $P1335, "$/"
    find_lex $P1336, "$past"
    $P1337 = $P1335."!make"($P1336)
.annotate "line", 354
    .return ($P1337)
  control_1267:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1338, exception, "payload"
    .return ($P1338)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1326"  :anon :subid("80_1258129000.66298") :outer("78_1258129000.66298")
    .param pmc param_1328
.annotate "line", 383
    .lex "$_", param_1328
    find_lex $P1329, "$past"
    find_lex $P1330, "$_"
    $P1331 = $P1329."push"($P1330)
    .return ($P1331)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1290"  :anon :subid("79_1258129000.66298") :outer("78_1258129000.66298")
.annotate "line", 362
    new $P1292, "Undef"
    .lex "$regexsym", $P1292

            $P0 = get_global '$REGEXNAME'
            $S0 = $P0
            $I0 = index $S0, ':sym<'
            add $I0, 5
            $S0 = substr $S0, $I0
            chopn $S0, 1
            $P1293 = box $S0
        
    store_lex "$regexsym", $P1293
.annotate "line", 371
    get_hll_global $P1294, ["PAST"], "Regex"
.annotate "line", 372
    get_hll_global $P1295, ["PAST"], "Regex"
    find_lex $P1296, "$regexsym"
    $P1297 = $P1295."new"($P1296, "literal" :named("pasttype"))
    find_lex $P1298, "$name"
    find_lex $P1299, "$/"
    $P1300 = $P1294."new"($P1297, $P1298 :named("name"), "subcapture" :named("pasttype"), $P1299 :named("node"))
.annotate "line", 371
    store_lex "$past", $P1300
.annotate "line", 361
    .return ($P1300)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<[>"  :subid("81_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_1342
.annotate "line", 389
    .const 'Sub' $P1377 = "82_1258129000.66298" 
    capture_lex $P1377
    new $P1341, 'ExceptionHandler'
    set_addr $P1341, control_1340
    $P1341."handle_types"(58)
    push_eh $P1341
    .lex "self", self
    .lex "$/", param_1342
.annotate "line", 390
    new $P1343, "Undef"
    .lex "$clist", $P1343
.annotate "line", 391
    new $P1344, "Undef"
    .lex "$past", $P1344
.annotate "line", 400
    new $P1345, "Undef"
    .lex "$i", $P1345
.annotate "line", 401
    new $P1346, "Undef"
    .lex "$n", $P1346
.annotate "line", 390
    find_lex $P1347, "$/"
    unless_null $P1347, vivify_317
    new $P1347, "Hash"
  vivify_317:
    set $P1348, $P1347["cclass_elem"]
    unless_null $P1348, vivify_318
    new $P1348, "Undef"
  vivify_318:
    store_lex "$clist", $P1348
.annotate "line", 391
    find_lex $P1349, "$clist"
    unless_null $P1349, vivify_319
    new $P1349, "ResizablePMCArray"
  vivify_319:
    set $P1350, $P1349[0]
    unless_null $P1350, vivify_320
    new $P1350, "Undef"
  vivify_320:
    $P1351 = $P1350."ast"()
    store_lex "$past", $P1351
.annotate "line", 392
    find_lex $P1355, "$past"
    $P1356 = $P1355."negate"()
    if $P1356, if_1354
    set $P1353, $P1356
    goto if_1354_end
  if_1354:
    find_lex $P1357, "$past"
    $S1358 = $P1357."pasttype"()
    iseq $I1359, $S1358, "subrule"
    new $P1353, 'Integer'
    set $P1353, $I1359
  if_1354_end:
    unless $P1353, if_1352_end
.annotate "line", 393
    find_lex $P1360, "$past"
    $P1360."subtype"("zerowidth")
.annotate "line", 394
    get_hll_global $P1361, ["PAST"], "Regex"
    find_lex $P1362, "$past"
.annotate "line", 396
    get_hll_global $P1363, ["PAST"], "Regex"
    $P1364 = $P1363."new"("charclass" :named("pasttype"), "." :named("subtype"))
    find_lex $P1365, "$/"
    $P1366 = $P1361."new"($P1362, $P1364, $P1365 :named("node"))
.annotate "line", 394
    store_lex "$past", $P1366
  if_1352_end:
.annotate "line", 400
    new $P1367, "Integer"
    assign $P1367, 1
    store_lex "$i", $P1367
.annotate "line", 401
    find_lex $P1368, "$clist"
    set $N1369, $P1368
    new $P1370, 'Float'
    set $P1370, $N1369
    store_lex "$n", $P1370
.annotate "line", 402
    new $P1401, 'ExceptionHandler'
    set_addr $P1401, loop1400_handler
    $P1401."handle_types"(65, 67, 66)
    push_eh $P1401
  loop1400_test:
    find_lex $P1371, "$i"
    set $N1372, $P1371
    find_lex $P1373, "$n"
    set $N1374, $P1373
    islt $I1375, $N1372, $N1374
    unless $I1375, loop1400_done
  loop1400_redo:
    .const 'Sub' $P1377 = "82_1258129000.66298" 
    capture_lex $P1377
    $P1377()
  loop1400_next:
    goto loop1400_test
  loop1400_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1402, exception, 'type'
    eq $P1402, 65, loop1400_next
    eq $P1402, 67, loop1400_redo
  loop1400_done:
    pop_eh 
.annotate "line", 413
    find_lex $P1403, "$/"
    find_lex $P1404, "$past"
    $P1405 = $P1403."!make"($P1404)
.annotate "line", 389
    .return ($P1405)
  control_1340:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1406, exception, "payload"
    .return ($P1406)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1376"  :anon :subid("82_1258129000.66298") :outer("81_1258129000.66298")
.annotate "line", 403
    new $P1378, "Undef"
    .lex "$ast", $P1378
    find_lex $P1379, "$i"
    set $I1380, $P1379
    find_lex $P1381, "$clist"
    unless_null $P1381, vivify_321
    new $P1381, "ResizablePMCArray"
  vivify_321:
    set $P1382, $P1381[$I1380]
    unless_null $P1382, vivify_322
    new $P1382, "Undef"
  vivify_322:
    $P1383 = $P1382."ast"()
    store_lex "$ast", $P1383
.annotate "line", 404
    find_lex $P1385, "$ast"
    $P1386 = $P1385."negate"()
    if $P1386, if_1384
.annotate "line", 409
    get_hll_global $P1393, ["PAST"], "Regex"
    find_lex $P1394, "$past"
    find_lex $P1395, "$ast"
    find_lex $P1396, "$/"
    $P1397 = $P1393."new"($P1394, $P1395, "alt" :named("pasttype"), $P1396 :named("node"))
    store_lex "$past", $P1397
.annotate "line", 408
    goto if_1384_end
  if_1384:
.annotate "line", 405
    find_lex $P1387, "$ast"
    $P1387."subtype"("zerowidth")
.annotate "line", 406
    get_hll_global $P1388, ["PAST"], "Regex"
    find_lex $P1389, "$ast"
    find_lex $P1390, "$past"
    find_lex $P1391, "$/"
    $P1392 = $P1388."new"($P1389, $P1390, "concat" :named("pasttype"), $P1391 :named("node"))
    store_lex "$past", $P1392
  if_1384_end:
.annotate "line", 411
    find_lex $P1398, "$i"
    add $P1399, $P1398, 1
    store_lex "$i", $P1399
.annotate "line", 402
    .return ($P1399)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "cclass_elem"  :subid("83_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_1410
.annotate "line", 416
    .const 'Sub' $P1435 = "85_1258129000.66298" 
    capture_lex $P1435
    .const 'Sub' $P1419 = "84_1258129000.66298" 
    capture_lex $P1419
    new $P1409, 'ExceptionHandler'
    set_addr $P1409, control_1408
    $P1409."handle_types"(58)
    push_eh $P1409
    .lex "self", self
    .lex "$/", param_1410
.annotate "line", 417
    new $P1411, "Undef"
    .lex "$str", $P1411
.annotate "line", 418
    new $P1412, "Undef"
    .lex "$past", $P1412
.annotate "line", 417
    new $P1413, "String"
    assign $P1413, ""
    store_lex "$str", $P1413
    find_lex $P1414, "$past"
.annotate "line", 419
    find_lex $P1416, "$/"
    unless_null $P1416, vivify_323
    new $P1416, "Hash"
  vivify_323:
    set $P1417, $P1416["name"]
    unless_null $P1417, vivify_324
    new $P1417, "Undef"
  vivify_324:
    if $P1417, if_1415
.annotate "line", 423
    find_lex $P1430, "$/"
    unless_null $P1430, vivify_325
    new $P1430, "Hash"
  vivify_325:
    set $P1431, $P1430["charspec"]
    unless_null $P1431, vivify_326
    new $P1431, "Undef"
  vivify_326:
    defined $I1432, $P1431
    unless $I1432, for_undef_327
    iter $P1429, $P1431
    new $P1461, 'ExceptionHandler'
    set_addr $P1461, loop1460_handler
    $P1461."handle_types"(65, 67, 66)
    push_eh $P1461
  loop1460_test:
    unless $P1429, loop1460_done
    shift $P1433, $P1429
  loop1460_redo:
    .const 'Sub' $P1435 = "85_1258129000.66298" 
    capture_lex $P1435
    $P1435($P1433)
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
  for_undef_327:
.annotate "line", 448
    get_hll_global $P1463, ["PAST"], "Regex"
    find_lex $P1464, "$str"
    find_lex $P1465, "$/"
    $P1466 = $P1463."new"($P1464, "enumcharlist" :named("pasttype"), $P1465 :named("node"))
    store_lex "$past", $P1466
.annotate "line", 422
    goto if_1415_end
  if_1415:
.annotate "line", 419
    .const 'Sub' $P1419 = "84_1258129000.66298" 
    capture_lex $P1419
    $P1419()
  if_1415_end:
.annotate "line", 450
    find_lex $P1467, "$past"
    find_lex $P1468, "$/"
    unless_null $P1468, vivify_339
    new $P1468, "Hash"
  vivify_339:
    set $P1469, $P1468["sign"]
    unless_null $P1469, vivify_340
    new $P1469, "Undef"
  vivify_340:
    set $S1470, $P1469
    iseq $I1471, $S1470, "-"
    $P1467."negate"($I1471)
.annotate "line", 451
    find_lex $P1472, "$/"
    find_lex $P1473, "$past"
    $P1474 = $P1472."!make"($P1473)
.annotate "line", 416
    .return ($P1474)
  control_1408:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1475, exception, "payload"
    .return ($P1475)
    rethrow exception
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1434"  :anon :subid("85_1258129000.66298") :outer("83_1258129000.66298")
    .param pmc param_1436
.annotate "line", 423
    .const 'Sub' $P1442 = "86_1258129000.66298" 
    capture_lex $P1442
    .lex "$_", param_1436
.annotate "line", 424
    find_lex $P1439, "$_"
    unless_null $P1439, vivify_328
    new $P1439, "ResizablePMCArray"
  vivify_328:
    set $P1440, $P1439[1]
    unless_null $P1440, vivify_329
    new $P1440, "Undef"
  vivify_329:
    if $P1440, if_1438
.annotate "line", 446
    find_lex $P1456, "$str"
    find_lex $P1457, "$_"
    unless_null $P1457, vivify_330
    new $P1457, "ResizablePMCArray"
  vivify_330:
    set $P1458, $P1457[0]
    unless_null $P1458, vivify_331
    new $P1458, "Undef"
  vivify_331:
    concat $P1459, $P1456, $P1458
    store_lex "$str", $P1459
    set $P1437, $P1459
.annotate "line", 424
    goto if_1438_end
  if_1438:
    .const 'Sub' $P1442 = "86_1258129000.66298" 
    capture_lex $P1442
    $P1455 = $P1442()
    set $P1437, $P1455
  if_1438_end:
.annotate "line", 423
    .return ($P1437)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1441"  :anon :subid("86_1258129000.66298") :outer("85_1258129000.66298")
.annotate "line", 425
    new $P1443, "Undef"
    .lex "$a", $P1443
.annotate "line", 426
    new $P1444, "Undef"
    .lex "$b", $P1444
.annotate "line", 427
    new $P1445, "Undef"
    .lex "$c", $P1445
.annotate "line", 425
    find_lex $P1446, "$_"
    unless_null $P1446, vivify_332
    new $P1446, "ResizablePMCArray"
  vivify_332:
    set $P1447, $P1446[0]
    unless_null $P1447, vivify_333
    new $P1447, "Undef"
  vivify_333:
    store_lex "$a", $P1447
.annotate "line", 426
    find_lex $P1448, "$_"
    unless_null $P1448, vivify_334
    new $P1448, "ResizablePMCArray"
  vivify_334:
    set $P1449, $P1448[1]
    unless_null $P1449, vivify_335
    new $P1449, "ResizablePMCArray"
  vivify_335:
    set $P1450, $P1449[0]
    unless_null $P1450, vivify_336
    new $P1450, "Undef"
  vivify_336:
    store_lex "$b", $P1450
.annotate "line", 427

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
                             $P1451 = box $S2
                         
    store_lex "$c", $P1451
.annotate "line", 444
    find_lex $P1452, "$str"
    find_lex $P1453, "$c"
    concat $P1454, $P1452, $P1453
    store_lex "$str", $P1454
.annotate "line", 424
    .return ($P1454)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1418"  :anon :subid("84_1258129000.66298") :outer("83_1258129000.66298")
.annotate "line", 420
    new $P1420, "Undef"
    .lex "$name", $P1420
    find_lex $P1421, "$/"
    unless_null $P1421, vivify_337
    new $P1421, "Hash"
  vivify_337:
    set $P1422, $P1421["name"]
    unless_null $P1422, vivify_338
    new $P1422, "Undef"
  vivify_338:
    set $S1423, $P1422
    new $P1424, 'String'
    set $P1424, $S1423
    store_lex "$name", $P1424
.annotate "line", 421
    get_hll_global $P1425, ["PAST"], "Regex"
    find_lex $P1426, "$name"
    find_lex $P1427, "$/"
    $P1428 = $P1425."new"($P1426, "subrule" :named("pasttype"), "method" :named("subtype"), $P1427 :named("node"))
    store_lex "$past", $P1428
.annotate "line", 419
    .return ($P1428)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "mod_internal"  :subid("87_1258129000.66298") :method :outer("11_1258129000.66298")
    .param pmc param_1479
.annotate "line", 454
    new $P1478, 'ExceptionHandler'
    set_addr $P1478, control_1477
    $P1478."handle_types"(58)
    push_eh $P1478
    .lex "self", self
    .lex "$/", param_1479
.annotate "line", 455
    new $P1480, "Hash"
    .lex "%mods", $P1480
.annotate "line", 456
    new $P1481, "Undef"
    .lex "$n", $P1481
.annotate "line", 455
    get_global $P1482, "@MODIFIERS"
    unless_null $P1482, vivify_341
    new $P1482, "ResizablePMCArray"
  vivify_341:
    set $P1483, $P1482[0]
    unless_null $P1483, vivify_342
    new $P1483, "Undef"
  vivify_342:
    store_lex "%mods", $P1483
.annotate "line", 456
    find_lex $P1486, "$/"
    unless_null $P1486, vivify_343
    new $P1486, "Hash"
  vivify_343:
    set $P1487, $P1486["n"]
    unless_null $P1487, vivify_344
    new $P1487, "ResizablePMCArray"
  vivify_344:
    set $P1488, $P1487[0]
    unless_null $P1488, vivify_345
    new $P1488, "Undef"
  vivify_345:
    set $S1489, $P1488
    isgt $I1490, $S1489, ""
    if $I1490, if_1485
    new $P1495, "Integer"
    assign $P1495, 1
    set $P1484, $P1495
    goto if_1485_end
  if_1485:
    find_lex $P1491, "$/"
    unless_null $P1491, vivify_346
    new $P1491, "Hash"
  vivify_346:
    set $P1492, $P1491["n"]
    unless_null $P1492, vivify_347
    new $P1492, "ResizablePMCArray"
  vivify_347:
    set $P1493, $P1492[0]
    unless_null $P1493, vivify_348
    new $P1493, "Undef"
  vivify_348:
    set $N1494, $P1493
    new $P1484, 'Float'
    set $P1484, $N1494
  if_1485_end:
    store_lex "$n", $P1484
.annotate "line", 457
    find_lex $P1496, "$n"
    find_lex $P1497, "$/"
    unless_null $P1497, vivify_349
    new $P1497, "Hash"
  vivify_349:
    set $P1498, $P1497["mod_ident"]
    unless_null $P1498, vivify_350
    new $P1498, "Hash"
  vivify_350:
    set $P1499, $P1498["sym"]
    unless_null $P1499, vivify_351
    new $P1499, "Undef"
  vivify_351:
    set $S1500, $P1499
    find_lex $P1501, "%mods"
    unless_null $P1501, vivify_352
    new $P1501, "Hash"
    store_lex "%mods", $P1501
  vivify_352:
    set $P1501[$S1500], $P1496
.annotate "line", 458
    find_lex $P1502, "$/"
    $P1503 = $P1502."!make"(0)
.annotate "line", 454
    .return ($P1503)
  control_1477:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1504, exception, "payload"
    .return ($P1504)
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


=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
