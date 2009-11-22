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
.sub "_block11"  :anon :subid("10_1258897726.59476")
.annotate "line", 0
    get_hll_global $P14, ["Regex";"P6Regex";"Grammar"], "_block13" 
    capture_lex $P14
.annotate "line", 3
    get_hll_global $P14, ["Regex";"P6Regex";"Grammar"], "_block13" 
    capture_lex $P14
    $P518 = $P14()
.annotate "line", 1
    .return ($P518)
.end


.namespace []
.sub "" :load :init :subid("post158") :outer("10_1258897726.59476")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1258897726.59476" 
    .local pmc block
    set block, $P12
    $P519 = get_root_global ["parrot"], "P6metaclass"
    $P519."new_class"("Regex::P6Regex::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block13"  :subid("11_1258897726.59476") :outer("10_1258897726.59476")
.annotate "line", 3
    .const 'Sub' $P511 = "156_1258897726.59476" 
    capture_lex $P511
    .const 'Sub' $P504 = "154_1258897726.59476" 
    capture_lex $P504
    .const 'Sub' $P497 = "152_1258897726.59476" 
    capture_lex $P497
    .const 'Sub' $P477 = "147_1258897726.59476" 
    capture_lex $P477
    .const 'Sub' $P443 = "141_1258897726.59476" 
    capture_lex $P443
    .const 'Sub' $P432 = "138_1258897726.59476" 
    capture_lex $P432
    .const 'Sub' $P420 = "135_1258897726.59476" 
    capture_lex $P420
    .const 'Sub' $P415 = "133_1258897726.59476" 
    capture_lex $P415
    .const 'Sub' $P405 = "130_1258897726.59476" 
    capture_lex $P405
    .const 'Sub' $P395 = "127_1258897726.59476" 
    capture_lex $P395
    .const 'Sub' $P387 = "123_1258897726.59476" 
    capture_lex $P387
    .const 'Sub' $P382 = "121_1258897726.59476" 
    capture_lex $P382
    .const 'Sub' $P377 = "119_1258897726.59476" 
    capture_lex $P377
    .const 'Sub' $P372 = "117_1258897726.59476" 
    capture_lex $P372
    .const 'Sub' $P367 = "115_1258897726.59476" 
    capture_lex $P367
    .const 'Sub' $P357 = "113_1258897726.59476" 
    capture_lex $P357
    .const 'Sub' $P347 = "111_1258897726.59476" 
    capture_lex $P347
    .const 'Sub' $P340 = "109_1258897726.59476" 
    capture_lex $P340
    .const 'Sub' $P335 = "107_1258897726.59476" 
    capture_lex $P335
    .const 'Sub' $P330 = "105_1258897726.59476" 
    capture_lex $P330
    .const 'Sub' $P325 = "103_1258897726.59476" 
    capture_lex $P325
    .const 'Sub' $P320 = "101_1258897726.59476" 
    capture_lex $P320
    .const 'Sub' $P315 = "99_1258897726.59476" 
    capture_lex $P315
    .const 'Sub' $P310 = "97_1258897726.59476" 
    capture_lex $P310
    .const 'Sub' $P305 = "95_1258897726.59476" 
    capture_lex $P305
    .const 'Sub' $P300 = "93_1258897726.59476" 
    capture_lex $P300
    .const 'Sub' $P289 = "89_1258897726.59476" 
    capture_lex $P289
    .const 'Sub' $P278 = "87_1258897726.59476" 
    capture_lex $P278
    .const 'Sub' $P272 = "85_1258897726.59476" 
    capture_lex $P272
    .const 'Sub' $P256 = "83_1258897726.59476" 
    capture_lex $P256
    .const 'Sub' $P250 = "81_1258897726.59476" 
    capture_lex $P250
    .const 'Sub' $P245 = "79_1258897726.59476" 
    capture_lex $P245
    .const 'Sub' $P240 = "77_1258897726.59476" 
    capture_lex $P240
    .const 'Sub' $P234 = "75_1258897726.59476" 
    capture_lex $P234
    .const 'Sub' $P228 = "73_1258897726.59476" 
    capture_lex $P228
    .const 'Sub' $P222 = "71_1258897726.59476" 
    capture_lex $P222
    .const 'Sub' $P216 = "69_1258897726.59476" 
    capture_lex $P216
    .const 'Sub' $P211 = "67_1258897726.59476" 
    capture_lex $P211
    .const 'Sub' $P206 = "65_1258897726.59476" 
    capture_lex $P206
    .const 'Sub' $P201 = "63_1258897726.59476" 
    capture_lex $P201
    .const 'Sub' $P196 = "61_1258897726.59476" 
    capture_lex $P196
    .const 'Sub' $P191 = "59_1258897726.59476" 
    capture_lex $P191
    .const 'Sub' $P187 = "57_1258897726.59476" 
    capture_lex $P187
    .const 'Sub' $P183 = "55_1258897726.59476" 
    capture_lex $P183
    .const 'Sub' $P178 = "53_1258897726.59476" 
    capture_lex $P178
    .const 'Sub' $P173 = "51_1258897726.59476" 
    capture_lex $P173
    .const 'Sub' $P168 = "49_1258897726.59476" 
    capture_lex $P168
    .const 'Sub' $P153 = "44_1258897726.59476" 
    capture_lex $P153
    .const 'Sub' $P142 = "42_1258897726.59476" 
    capture_lex $P142
    .const 'Sub' $P136 = "40_1258897726.59476" 
    capture_lex $P136
    .const 'Sub' $P130 = "38_1258897726.59476" 
    capture_lex $P130
    .const 'Sub' $P124 = "36_1258897726.59476" 
    capture_lex $P124
    .const 'Sub' $P106 = "31_1258897726.59476" 
    capture_lex $P106
    .const 'Sub' $P94 = "28_1258897726.59476" 
    capture_lex $P94
    .const 'Sub' $P88 = "26_1258897726.59476" 
    capture_lex $P88
    .const 'Sub' $P77 = "24_1258897726.59476" 
    capture_lex $P77
    .const 'Sub' $P71 = "22_1258897726.59476" 
    capture_lex $P71
    .const 'Sub' $P60 = "20_1258897726.59476" 
    capture_lex $P60
    .const 'Sub' $P54 = "18_1258897726.59476" 
    capture_lex $P54
    .const 'Sub' $P45 = "15_1258897726.59476" 
    capture_lex $P45
    .const 'Sub' $P38 = "13_1258897726.59476" 
    capture_lex $P38
    .const 'Sub' $P15 = "12_1258897726.59476" 
    capture_lex $P15
    .const 'Sub' $P511 = "156_1258897726.59476" 
    capture_lex $P511
    .return ($P511)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "obs"  :subid("12_1258897726.59476") :method :outer("11_1258897726.59476")
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
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "ws"  :subid("13_1258897726.59476") :method :outer("11_1258897726.59476")
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
.sub "!PREFIX__ws"  :subid("14_1258897726.59476") :method
.annotate "line", 3
    new $P41, "ResizablePMCArray"
    push $P41, ""
    .return ($P41)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "normspace"  :subid("15_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .const 'Sub' $P50 = "17_1258897726.59476" 
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
    .const 'Sub' $P50 = "17_1258897726.59476" 
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
.sub "!PREFIX__normspace"  :subid("16_1258897726.59476") :method
.annotate "line", 3
    new $P48, "ResizablePMCArray"
    push $P48, ""
    .return ($P48)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block49"  :anon :subid("17_1258897726.59476") :method :outer("15_1258897726.59476")
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
.sub "arg"  :subid("18_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx55_tgt
    .local int rx55_pos
    .local int rx55_off
    .local int rx55_eos
    .local int rx55_rep
    .local pmc rx55_cur
    (rx55_cur, rx55_pos, rx55_tgt, $I10) = self."!cursor_start"()
    rx55_cur."!cursor_debug"("START ", "arg")
    .lex unicode:"$\x{a2}", rx55_cur
    .local pmc match
    .lex "$/", match
    length rx55_eos, rx55_tgt
    set rx55_off, 0
    lt $I10, 2, rx55_start
    sub rx55_off, $I10, 1
    substr rx55_tgt, rx55_tgt, rx55_off
  rx55_start:
  alt58_0:
.annotate "line", 13
    set_addr $I10, alt58_1
    rx55_cur."!mark_push"(0, rx55_pos, $I10)
.annotate "line", 14
  # rx enumcharlist negate=0 zerowidth
    ge rx55_pos, rx55_eos, rx55_fail
    sub $I10, rx55_pos, rx55_off
    substr $S10, rx55_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx55_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx55_cur."!cursor_pos"(rx55_pos)
    $P10 = rx55_cur."quote_EXPR"(":q")
    unless $P10, rx55_fail
    rx55_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx55_pos = $P10."pos"()
    goto alt58_end
  alt58_1:
    set_addr $I10, alt58_2
    rx55_cur."!mark_push"(0, rx55_pos, $I10)
.annotate "line", 15
  # rx enumcharlist negate=0 zerowidth
    ge rx55_pos, rx55_eos, rx55_fail
    sub $I10, rx55_pos, rx55_off
    substr $S10, rx55_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx55_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx55_cur."!cursor_pos"(rx55_pos)
    $P10 = rx55_cur."quote_EXPR"(":qq")
    unless $P10, rx55_fail
    rx55_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx55_pos = $P10."pos"()
    goto alt58_end
  alt58_2:
.annotate "line", 16
  # rx subcapture "val"
    set_addr $I10, rxcap_59_fail
    rx55_cur."!mark_push"(0, rx55_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx55_pos, rx55_off
    find_not_cclass $I11, 8, rx55_tgt, $I10, rx55_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx55_fail
    add rx55_pos, rx55_off, $I11
    set_addr $I10, rxcap_59_fail
    ($I12, $I11) = rx55_cur."!mark_peek"($I10)
    rx55_cur."!cursor_pos"($I11)
    ($P10) = rx55_cur."!cursor_start"()
    $P10."!cursor_pass"(rx55_pos, "")
    rx55_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("val")
    goto rxcap_59_done
  rxcap_59_fail:
    goto rx55_fail
  rxcap_59_done:
  alt58_end:
.annotate "line", 12
  # rx pass
    rx55_cur."!cursor_pass"(rx55_pos, "arg")
    rx55_cur."!cursor_debug"("PASS  ", "arg", " at pos=", rx55_pos)
    .return (rx55_cur)
  rx55_fail:
.annotate "line", 3
    (rx55_rep, rx55_pos, $I10, $P10) = rx55_cur."!mark_fail"(0)
    lt rx55_pos, -1, rx55_done
    eq rx55_pos, -1, rx55_fail
    jump $I10
  rx55_done:
    rx55_cur."!cursor_fail"()
    rx55_cur."!cursor_debug"("FAIL  ", "arg")
    .return (rx55_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__arg"  :subid("19_1258897726.59476") :method
.annotate "line", 3
    new $P57, "ResizablePMCArray"
    push $P57, ""
    push $P57, "\""
    push $P57, "'"
    .return ($P57)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "arglist"  :subid("20_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx61_tgt
    .local int rx61_pos
    .local int rx61_off
    .local int rx61_eos
    .local int rx61_rep
    .local pmc rx61_cur
    (rx61_cur, rx61_pos, rx61_tgt, $I10) = self."!cursor_start"()
    rx61_cur."!cursor_debug"("START ", "arglist")
    rx61_cur."!cursor_caparray"("arg")
    .lex unicode:"$\x{a2}", rx61_cur
    .local pmc match
    .lex "$/", match
    length rx61_eos, rx61_tgt
    set rx61_off, 0
    lt $I10, 2, rx61_start
    sub rx61_off, $I10, 1
    substr rx61_tgt, rx61_tgt, rx61_off
  rx61_start:
.annotate "line", 20
  # rx subrule "ws" subtype=method negate=
    rx61_cur."!cursor_pos"(rx61_pos)
    $P10 = rx61_cur."ws"()
    unless $P10, rx61_fail
    rx61_pos = $P10."pos"()
  # rx subrule "arg" subtype=capture negate=
    rx61_cur."!cursor_pos"(rx61_pos)
    $P10 = rx61_cur."arg"()
    unless $P10, rx61_fail
    rx61_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arg")
    rx61_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx61_cur."!cursor_pos"(rx61_pos)
    $P10 = rx61_cur."ws"()
    unless $P10, rx61_fail
    rx61_pos = $P10."pos"()
  # rx rxquantr66 ** 0..*
    set_addr $I69, rxquantr66_done
    rx61_cur."!mark_push"(0, rx61_pos, $I69)
  rxquantr66_loop:
  # rx subrule "ws" subtype=method negate=
    rx61_cur."!cursor_pos"(rx61_pos)
    $P10 = rx61_cur."ws"()
    unless $P10, rx61_fail
    rx61_pos = $P10."pos"()
  # rx literal  ","
    add $I11, rx61_pos, 1
    gt $I11, rx61_eos, rx61_fail
    sub $I11, rx61_pos, rx61_off
    substr $S10, rx61_tgt, $I11, 1
    ne $S10, ",", rx61_fail
    add rx61_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx61_cur."!cursor_pos"(rx61_pos)
    $P10 = rx61_cur."ws"()
    unless $P10, rx61_fail
    rx61_pos = $P10."pos"()
  # rx subrule "arg" subtype=capture negate=
    rx61_cur."!cursor_pos"(rx61_pos)
    $P10 = rx61_cur."arg"()
    unless $P10, rx61_fail
    rx61_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arg")
    rx61_pos = $P10."pos"()
    (rx61_rep) = rx61_cur."!mark_commit"($I69)
    rx61_cur."!mark_push"(rx61_rep, rx61_pos, $I69)
    goto rxquantr66_loop
  rxquantr66_done:
  # rx subrule "ws" subtype=method negate=
    rx61_cur."!cursor_pos"(rx61_pos)
    $P10 = rx61_cur."ws"()
    unless $P10, rx61_fail
    rx61_pos = $P10."pos"()
  # rx pass
    rx61_cur."!cursor_pass"(rx61_pos, "arglist")
    rx61_cur."!cursor_debug"("PASS  ", "arglist", " at pos=", rx61_pos)
    .return (rx61_cur)
  rx61_fail:
.annotate "line", 3
    (rx61_rep, rx61_pos, $I10, $P10) = rx61_cur."!mark_fail"(0)
    lt rx61_pos, -1, rx61_done
    eq rx61_pos, -1, rx61_fail
    jump $I10
  rx61_done:
    rx61_cur."!cursor_fail"()
    rx61_cur."!cursor_debug"("FAIL  ", "arglist")
    .return (rx61_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__arglist"  :subid("21_1258897726.59476") :method
.annotate "line", 3
    new $P63, "ResizablePMCArray"
    push $P63, ""
    .return ($P63)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "TOP"  :subid("22_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx72_tgt
    .local int rx72_pos
    .local int rx72_off
    .local int rx72_eos
    .local int rx72_rep
    .local pmc rx72_cur
    (rx72_cur, rx72_pos, rx72_tgt, $I10) = self."!cursor_start"()
    rx72_cur."!cursor_debug"("START ", "TOP")
    .lex unicode:"$\x{a2}", rx72_cur
    .local pmc match
    .lex "$/", match
    length rx72_eos, rx72_tgt
    set rx72_off, 0
    lt $I10, 2, rx72_start
    sub rx72_off, $I10, 1
    substr rx72_tgt, rx72_tgt, rx72_off
  rx72_start:
.annotate "line", 23
  # rx subrule "nibbler" subtype=capture negate=
    rx72_cur."!cursor_pos"(rx72_pos)
    $P10 = rx72_cur."nibbler"()
    unless $P10, rx72_fail
    rx72_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx72_pos = $P10."pos"()
  alt76_0:
.annotate "line", 24
    set_addr $I10, alt76_1
    rx72_cur."!mark_push"(0, rx72_pos, $I10)
  # rxanchor eos
    ne rx72_pos, rx72_eos, rx72_fail
    goto alt76_end
  alt76_1:
  # rx subrule "panic" subtype=method negate=
    rx72_cur."!cursor_pos"(rx72_pos)
    $P10 = rx72_cur."panic"("Confused")
    unless $P10, rx72_fail
    rx72_pos = $P10."pos"()
  alt76_end:
.annotate "line", 22
  # rx pass
    rx72_cur."!cursor_pass"(rx72_pos, "TOP")
    rx72_cur."!cursor_debug"("PASS  ", "TOP", " at pos=", rx72_pos)
    .return (rx72_cur)
  rx72_fail:
.annotate "line", 3
    (rx72_rep, rx72_pos, $I10, $P10) = rx72_cur."!mark_fail"(0)
    lt rx72_pos, -1, rx72_done
    eq rx72_pos, -1, rx72_fail
    jump $I10
  rx72_done:
    rx72_cur."!cursor_fail"()
    rx72_cur."!cursor_debug"("FAIL  ", "TOP")
    .return (rx72_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__TOP"  :subid("23_1258897726.59476") :method
.annotate "line", 3
    $P74 = self."!PREFIX__!subrule"("nibbler", "")
    new $P75, "ResizablePMCArray"
    push $P75, $P74
    .return ($P75)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "nibbler"  :subid("24_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx78_tgt
    .local int rx78_pos
    .local int rx78_off
    .local int rx78_eos
    .local int rx78_rep
    .local pmc rx78_cur
    (rx78_cur, rx78_pos, rx78_tgt, $I10) = self."!cursor_start"()
    rx78_cur."!cursor_debug"("START ", "nibbler")
    rx78_cur."!cursor_caparray"("termish")
    .lex unicode:"$\x{a2}", rx78_cur
    .local pmc match
    .lex "$/", match
    length rx78_eos, rx78_tgt
    set rx78_off, 0
    lt $I10, 2, rx78_start
    sub rx78_off, $I10, 1
    substr rx78_tgt, rx78_tgt, rx78_off
  rx78_start:
.annotate "line", 28
  # rx reduce name="nibbler" key="open"
    rx78_cur."!cursor_pos"(rx78_pos)
    rx78_cur."!reduce"("nibbler", "open")
.annotate "line", 29
  # rx rxquantr81 ** 0..1
    set_addr $I83, rxquantr81_done
    rx78_cur."!mark_push"(0, rx78_pos, $I83)
  rxquantr81_loop:
  # rx subrule "ws" subtype=method negate=
    rx78_cur."!cursor_pos"(rx78_pos)
    $P10 = rx78_cur."ws"()
    unless $P10, rx78_fail
    rx78_pos = $P10."pos"()
  alt82_0:
    set_addr $I10, alt82_1
    rx78_cur."!mark_push"(0, rx78_pos, $I10)
  # rx literal  "||"
    add $I11, rx78_pos, 2
    gt $I11, rx78_eos, rx78_fail
    sub $I11, rx78_pos, rx78_off
    substr $S10, rx78_tgt, $I11, 2
    ne $S10, "||", rx78_fail
    add rx78_pos, 2
    goto alt82_end
  alt82_1:
    set_addr $I10, alt82_2
    rx78_cur."!mark_push"(0, rx78_pos, $I10)
  # rx literal  "|"
    add $I11, rx78_pos, 1
    gt $I11, rx78_eos, rx78_fail
    sub $I11, rx78_pos, rx78_off
    substr $S10, rx78_tgt, $I11, 1
    ne $S10, "|", rx78_fail
    add rx78_pos, 1
    goto alt82_end
  alt82_2:
    set_addr $I10, alt82_3
    rx78_cur."!mark_push"(0, rx78_pos, $I10)
  # rx literal  "&&"
    add $I11, rx78_pos, 2
    gt $I11, rx78_eos, rx78_fail
    sub $I11, rx78_pos, rx78_off
    substr $S10, rx78_tgt, $I11, 2
    ne $S10, "&&", rx78_fail
    add rx78_pos, 2
    goto alt82_end
  alt82_3:
  # rx literal  "&"
    add $I11, rx78_pos, 1
    gt $I11, rx78_eos, rx78_fail
    sub $I11, rx78_pos, rx78_off
    substr $S10, rx78_tgt, $I11, 1
    ne $S10, "&", rx78_fail
    add rx78_pos, 1
  alt82_end:
    (rx78_rep) = rx78_cur."!mark_commit"($I83)
  rxquantr81_done:
.annotate "line", 30
  # rx subrule "termish" subtype=capture negate=
    rx78_cur."!cursor_pos"(rx78_pos)
    $P10 = rx78_cur."termish"()
    unless $P10, rx78_fail
    rx78_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("termish")
    rx78_pos = $P10."pos"()
.annotate "line", 33
  # rx rxquantr84 ** 0..*
    set_addr $I87, rxquantr84_done
    rx78_cur."!mark_push"(0, rx78_pos, $I87)
  rxquantr84_loop:
  alt85_0:
.annotate "line", 31
    set_addr $I10, alt85_1
    rx78_cur."!mark_push"(0, rx78_pos, $I10)
  # rx literal  "||"
    add $I11, rx78_pos, 2
    gt $I11, rx78_eos, rx78_fail
    sub $I11, rx78_pos, rx78_off
    substr $S10, rx78_tgt, $I11, 2
    ne $S10, "||", rx78_fail
    add rx78_pos, 2
    goto alt85_end
  alt85_1:
  # rx literal  "|"
    add $I11, rx78_pos, 1
    gt $I11, rx78_eos, rx78_fail
    sub $I11, rx78_pos, rx78_off
    substr $S10, rx78_tgt, $I11, 1
    ne $S10, "|", rx78_fail
    add rx78_pos, 1
  alt85_end:
  alt86_0:
.annotate "line", 32
    set_addr $I10, alt86_1
    rx78_cur."!mark_push"(0, rx78_pos, $I10)
  # rx subrule "termish" subtype=capture negate=
    rx78_cur."!cursor_pos"(rx78_pos)
    $P10 = rx78_cur."termish"()
    unless $P10, rx78_fail
    rx78_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("termish")
    rx78_pos = $P10."pos"()
    goto alt86_end
  alt86_1:
  # rx subrule "panic" subtype=method negate=
    rx78_cur."!cursor_pos"(rx78_pos)
    $P10 = rx78_cur."panic"("Null pattern not allowed")
    unless $P10, rx78_fail
    rx78_pos = $P10."pos"()
  alt86_end:
.annotate "line", 33
    (rx78_rep) = rx78_cur."!mark_commit"($I87)
    rx78_cur."!mark_push"(rx78_rep, rx78_pos, $I87)
    goto rxquantr84_loop
  rxquantr84_done:
.annotate "line", 27
  # rx pass
    rx78_cur."!cursor_pass"(rx78_pos, "nibbler")
    rx78_cur."!cursor_debug"("PASS  ", "nibbler", " at pos=", rx78_pos)
    .return (rx78_cur)
  rx78_fail:
.annotate "line", 3
    (rx78_rep, rx78_pos, $I10, $P10) = rx78_cur."!mark_fail"(0)
    lt rx78_pos, -1, rx78_done
    eq rx78_pos, -1, rx78_fail
    jump $I10
  rx78_done:
    rx78_cur."!cursor_fail"()
    rx78_cur."!cursor_debug"("FAIL  ", "nibbler")
    .return (rx78_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__nibbler"  :subid("25_1258897726.59476") :method
.annotate "line", 3
    new $P80, "ResizablePMCArray"
    push $P80, ""
    .return ($P80)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "termish"  :subid("26_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx89_tgt
    .local int rx89_pos
    .local int rx89_off
    .local int rx89_eos
    .local int rx89_rep
    .local pmc rx89_cur
    (rx89_cur, rx89_pos, rx89_tgt, $I10) = self."!cursor_start"()
    rx89_cur."!cursor_debug"("START ", "termish")
    rx89_cur."!cursor_caparray"("noun")
    .lex unicode:"$\x{a2}", rx89_cur
    .local pmc match
    .lex "$/", match
    length rx89_eos, rx89_tgt
    set rx89_off, 0
    lt $I10, 2, rx89_start
    sub rx89_off, $I10, 1
    substr rx89_tgt, rx89_tgt, rx89_off
  rx89_start:
.annotate "line", 37
  # rx rxquantr92 ** 1..*
    set_addr $I93, rxquantr92_done
    rx89_cur."!mark_push"(0, -1, $I93)
  rxquantr92_loop:
  # rx subrule "quantified_atom" subtype=capture negate=
    rx89_cur."!cursor_pos"(rx89_pos)
    $P10 = rx89_cur."quantified_atom"()
    unless $P10, rx89_fail
    rx89_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("noun")
    rx89_pos = $P10."pos"()
    (rx89_rep) = rx89_cur."!mark_commit"($I93)
    rx89_cur."!mark_push"(rx89_rep, rx89_pos, $I93)
    goto rxquantr92_loop
  rxquantr92_done:
.annotate "line", 36
  # rx pass
    rx89_cur."!cursor_pass"(rx89_pos, "termish")
    rx89_cur."!cursor_debug"("PASS  ", "termish", " at pos=", rx89_pos)
    .return (rx89_cur)
  rx89_fail:
.annotate "line", 3
    (rx89_rep, rx89_pos, $I10, $P10) = rx89_cur."!mark_fail"(0)
    lt rx89_pos, -1, rx89_done
    eq rx89_pos, -1, rx89_fail
    jump $I10
  rx89_done:
    rx89_cur."!cursor_fail"()
    rx89_cur."!cursor_debug"("FAIL  ", "termish")
    .return (rx89_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__termish"  :subid("27_1258897726.59476") :method
.annotate "line", 3
    new $P91, "ResizablePMCArray"
    push $P91, ""
    .return ($P91)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantified_atom"  :subid("28_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .const 'Sub' $P102 = "30_1258897726.59476" 
    capture_lex $P102
    .local string rx95_tgt
    .local int rx95_pos
    .local int rx95_off
    .local int rx95_eos
    .local int rx95_rep
    .local pmc rx95_cur
    (rx95_cur, rx95_pos, rx95_tgt, $I10) = self."!cursor_start"()
    rx95_cur."!cursor_debug"("START ", "quantified_atom")
    rx95_cur."!cursor_caparray"("quantifier", "backmod")
    .lex unicode:"$\x{a2}", rx95_cur
    .local pmc match
    .lex "$/", match
    length rx95_eos, rx95_tgt
    set rx95_off, 0
    lt $I10, 2, rx95_start
    sub rx95_off, $I10, 1
    substr rx95_tgt, rx95_tgt, rx95_off
  rx95_start:
.annotate "line", 41
  # rx subrule "atom" subtype=capture negate=
    rx95_cur."!cursor_pos"(rx95_pos)
    $P10 = rx95_cur."atom"()
    unless $P10, rx95_fail
    rx95_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("atom")
    rx95_pos = $P10."pos"()
  # rx rxquantr99 ** 0..1
    set_addr $I105, rxquantr99_done
    rx95_cur."!mark_push"(0, rx95_pos, $I105)
  rxquantr99_loop:
  # rx subrule "ws" subtype=method negate=
    rx95_cur."!cursor_pos"(rx95_pos)
    $P10 = rx95_cur."ws"()
    unless $P10, rx95_fail
    rx95_pos = $P10."pos"()
  alt100_0:
    set_addr $I10, alt100_1
    rx95_cur."!mark_push"(0, rx95_pos, $I10)
  # rx subrule "quantifier" subtype=capture negate=
    rx95_cur."!cursor_pos"(rx95_pos)
    $P10 = rx95_cur."quantifier"()
    unless $P10, rx95_fail
    rx95_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantifier")
    rx95_pos = $P10."pos"()
    goto alt100_end
  alt100_1:
  # rx subrule "before" subtype=zerowidth negate=
    rx95_cur."!cursor_pos"(rx95_pos)
    .const 'Sub' $P102 = "30_1258897726.59476" 
    capture_lex $P102
    $P10 = rx95_cur."before"($P102)
    unless $P10, rx95_fail
  # rx subrule "backmod" subtype=capture negate=
    rx95_cur."!cursor_pos"(rx95_pos)
    $P10 = rx95_cur."backmod"()
    unless $P10, rx95_fail
    rx95_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx95_pos = $P10."pos"()
  # rx subrule "alpha" subtype=zerowidth negate=1
    rx95_cur."!cursor_pos"(rx95_pos)
    $P10 = rx95_cur."alpha"()
    if $P10, rx95_fail
  alt100_end:
    (rx95_rep) = rx95_cur."!mark_commit"($I105)
  rxquantr99_done:
.annotate "line", 40
  # rx pass
    rx95_cur."!cursor_pass"(rx95_pos, "quantified_atom")
    rx95_cur."!cursor_debug"("PASS  ", "quantified_atom", " at pos=", rx95_pos)
    .return (rx95_cur)
  rx95_fail:
.annotate "line", 3
    (rx95_rep, rx95_pos, $I10, $P10) = rx95_cur."!mark_fail"(0)
    lt rx95_pos, -1, rx95_done
    eq rx95_pos, -1, rx95_fail
    jump $I10
  rx95_done:
    rx95_cur."!cursor_fail"()
    rx95_cur."!cursor_debug"("FAIL  ", "quantified_atom")
    .return (rx95_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantified_atom"  :subid("29_1258897726.59476") :method
.annotate "line", 3
    $P97 = self."!PREFIX__!subrule"("atom", "")
    new $P98, "ResizablePMCArray"
    push $P98, $P97
    .return ($P98)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block101"  :anon :subid("30_1258897726.59476") :method :outer("28_1258897726.59476")
.annotate "line", 41
    .local string rx103_tgt
    .local int rx103_pos
    .local int rx103_off
    .local int rx103_eos
    .local int rx103_rep
    .local pmc rx103_cur
    (rx103_cur, rx103_pos, rx103_tgt, $I10) = self."!cursor_start"()
    rx103_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx103_cur
    .local pmc match
    .lex "$/", match
    length rx103_eos, rx103_tgt
    set rx103_off, 0
    lt $I10, 2, rx103_start
    sub rx103_off, $I10, 1
    substr rx103_tgt, rx103_tgt, rx103_off
  rx103_start:
    ge rx103_pos, 0, rxscan104_done
  rxscan104_loop:
    ($P10) = rx103_cur."from"()
    inc $P10
    set rx103_pos, $P10
    ge rx103_pos, rx103_eos, rxscan104_done
    set_addr $I10, rxscan104_loop
    rx103_cur."!mark_push"(0, rx103_pos, $I10)
  rxscan104_done:
  # rx literal  ":"
    add $I11, rx103_pos, 1
    gt $I11, rx103_eos, rx103_fail
    sub $I11, rx103_pos, rx103_off
    substr $S10, rx103_tgt, $I11, 1
    ne $S10, ":", rx103_fail
    add rx103_pos, 1
  # rx pass
    rx103_cur."!cursor_pass"(rx103_pos, "")
    rx103_cur."!cursor_debug"("PASS  ", "", " at pos=", rx103_pos)
    .return (rx103_cur)
  rx103_fail:
    (rx103_rep, rx103_pos, $I10, $P10) = rx103_cur."!mark_fail"(0)
    lt rx103_pos, -1, rx103_done
    eq rx103_pos, -1, rx103_fail
    jump $I10
  rx103_done:
    rx103_cur."!cursor_fail"()
    rx103_cur."!cursor_debug"("FAIL  ", "")
    .return (rx103_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "atom"  :subid("31_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .const 'Sub' $P116 = "33_1258897726.59476" 
    capture_lex $P116
    .local string rx107_tgt
    .local int rx107_pos
    .local int rx107_off
    .local int rx107_eos
    .local int rx107_rep
    .local pmc rx107_cur
    (rx107_cur, rx107_pos, rx107_tgt, $I10) = self."!cursor_start"()
    rx107_cur."!cursor_debug"("START ", "atom")
    .lex unicode:"$\x{a2}", rx107_cur
    .local pmc match
    .lex "$/", match
    length rx107_eos, rx107_tgt
    set rx107_off, 0
    lt $I10, 2, rx107_start
    sub rx107_off, $I10, 1
    substr rx107_tgt, rx107_tgt, rx107_off
  rx107_start:
  alt111_0:
.annotate "line", 46
    set_addr $I10, alt111_1
    rx107_cur."!mark_push"(0, rx107_pos, $I10)
.annotate "line", 47
  # rx charclass w
    ge rx107_pos, rx107_eos, rx107_fail
    sub $I10, rx107_pos, rx107_off
    is_cclass $I11, 8192, rx107_tgt, $I10
    unless $I11, rx107_fail
    inc rx107_pos
  # rx rxquantr112 ** 0..1
    set_addr $I119, rxquantr112_done
    rx107_cur."!mark_push"(0, rx107_pos, $I119)
  rxquantr112_loop:
  # rx rxquantg113 ** 1..*
    set_addr $I114, rxquantg113_done
  rxquantg113_loop:
  # rx charclass w
    ge rx107_pos, rx107_eos, rx107_fail
    sub $I10, rx107_pos, rx107_off
    is_cclass $I11, 8192, rx107_tgt, $I10
    unless $I11, rx107_fail
    inc rx107_pos
    rx107_cur."!mark_push"(rx107_rep, rx107_pos, $I114)
    goto rxquantg113_loop
  rxquantg113_done:
  # rx subrule "before" subtype=zerowidth negate=
    rx107_cur."!cursor_pos"(rx107_pos)
    .const 'Sub' $P116 = "33_1258897726.59476" 
    capture_lex $P116
    $P10 = rx107_cur."before"($P116)
    unless $P10, rx107_fail
    (rx107_rep) = rx107_cur."!mark_commit"($I119)
  rxquantr112_done:
    goto alt111_end
  alt111_1:
.annotate "line", 48
  # rx subrule "metachar" subtype=capture negate=
    rx107_cur."!cursor_pos"(rx107_pos)
    $P10 = rx107_cur."metachar"()
    unless $P10, rx107_fail
    rx107_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("metachar")
    rx107_pos = $P10."pos"()
  alt111_end:
.annotate "line", 44
  # rx pass
    rx107_cur."!cursor_pass"(rx107_pos, "atom")
    rx107_cur."!cursor_debug"("PASS  ", "atom", " at pos=", rx107_pos)
    .return (rx107_cur)
  rx107_fail:
.annotate "line", 3
    (rx107_rep, rx107_pos, $I10, $P10) = rx107_cur."!mark_fail"(0)
    lt rx107_pos, -1, rx107_done
    eq rx107_pos, -1, rx107_fail
    jump $I10
  rx107_done:
    rx107_cur."!cursor_fail"()
    rx107_cur."!cursor_debug"("FAIL  ", "atom")
    .return (rx107_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__atom"  :subid("32_1258897726.59476") :method
.annotate "line", 3
    $P109 = self."!PREFIX__!subrule"("metachar", "")
    new $P110, "ResizablePMCArray"
    push $P110, $P109
    push $P110, ""
    .return ($P110)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block115"  :anon :subid("33_1258897726.59476") :method :outer("31_1258897726.59476")
.annotate "line", 47
    .local string rx117_tgt
    .local int rx117_pos
    .local int rx117_off
    .local int rx117_eos
    .local int rx117_rep
    .local pmc rx117_cur
    (rx117_cur, rx117_pos, rx117_tgt, $I10) = self."!cursor_start"()
    rx117_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx117_cur
    .local pmc match
    .lex "$/", match
    length rx117_eos, rx117_tgt
    set rx117_off, 0
    lt $I10, 2, rx117_start
    sub rx117_off, $I10, 1
    substr rx117_tgt, rx117_tgt, rx117_off
  rx117_start:
    ge rx117_pos, 0, rxscan118_done
  rxscan118_loop:
    ($P10) = rx117_cur."from"()
    inc $P10
    set rx117_pos, $P10
    ge rx117_pos, rx117_eos, rxscan118_done
    set_addr $I10, rxscan118_loop
    rx117_cur."!mark_push"(0, rx117_pos, $I10)
  rxscan118_done:
  # rx charclass w
    ge rx117_pos, rx117_eos, rx117_fail
    sub $I10, rx117_pos, rx117_off
    is_cclass $I11, 8192, rx117_tgt, $I10
    unless $I11, rx117_fail
    inc rx117_pos
  # rx pass
    rx117_cur."!cursor_pass"(rx117_pos, "")
    rx117_cur."!cursor_debug"("PASS  ", "", " at pos=", rx117_pos)
    .return (rx117_cur)
  rx117_fail:
    (rx117_rep, rx117_pos, $I10, $P10) = rx117_cur."!mark_fail"(0)
    lt rx117_pos, -1, rx117_done
    eq rx117_pos, -1, rx117_fail
    jump $I10
  rx117_done:
    rx117_cur."!cursor_fail"()
    rx117_cur."!cursor_debug"("FAIL  ", "")
    .return (rx117_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier"  :subid("34_1258897726.59476") :method
.annotate "line", 52
    $P121 = self."!protoregex"("quantifier")
    .return ($P121)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier"  :subid("35_1258897726.59476") :method
.annotate "line", 52
    $P123 = self."!PREFIX__!protoregex"("quantifier")
    .return ($P123)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<*>"  :subid("36_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx125_tgt
    .local int rx125_pos
    .local int rx125_off
    .local int rx125_eos
    .local int rx125_rep
    .local pmc rx125_cur
    (rx125_cur, rx125_pos, rx125_tgt, $I10) = self."!cursor_start"()
    rx125_cur."!cursor_debug"("START ", "quantifier:sym<*>")
    .lex unicode:"$\x{a2}", rx125_cur
    .local pmc match
    .lex "$/", match
    length rx125_eos, rx125_tgt
    set rx125_off, 0
    lt $I10, 2, rx125_start
    sub rx125_off, $I10, 1
    substr rx125_tgt, rx125_tgt, rx125_off
  rx125_start:
.annotate "line", 53
  # rx subcapture "sym"
    set_addr $I10, rxcap_129_fail
    rx125_cur."!mark_push"(0, rx125_pos, $I10)
  # rx literal  "*"
    add $I11, rx125_pos, 1
    gt $I11, rx125_eos, rx125_fail
    sub $I11, rx125_pos, rx125_off
    substr $S10, rx125_tgt, $I11, 1
    ne $S10, "*", rx125_fail
    add rx125_pos, 1
    set_addr $I10, rxcap_129_fail
    ($I12, $I11) = rx125_cur."!mark_peek"($I10)
    rx125_cur."!cursor_pos"($I11)
    ($P10) = rx125_cur."!cursor_start"()
    $P10."!cursor_pass"(rx125_pos, "")
    rx125_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_129_done
  rxcap_129_fail:
    goto rx125_fail
  rxcap_129_done:
  # rx subrule "backmod" subtype=capture negate=
    rx125_cur."!cursor_pos"(rx125_pos)
    $P10 = rx125_cur."backmod"()
    unless $P10, rx125_fail
    rx125_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx125_pos = $P10."pos"()
  # rx pass
    rx125_cur."!cursor_pass"(rx125_pos, "quantifier:sym<*>")
    rx125_cur."!cursor_debug"("PASS  ", "quantifier:sym<*>", " at pos=", rx125_pos)
    .return (rx125_cur)
  rx125_fail:
.annotate "line", 3
    (rx125_rep, rx125_pos, $I10, $P10) = rx125_cur."!mark_fail"(0)
    lt rx125_pos, -1, rx125_done
    eq rx125_pos, -1, rx125_fail
    jump $I10
  rx125_done:
    rx125_cur."!cursor_fail"()
    rx125_cur."!cursor_debug"("FAIL  ", "quantifier:sym<*>")
    .return (rx125_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<*>"  :subid("37_1258897726.59476") :method
.annotate "line", 3
    $P127 = self."!PREFIX__!subrule"("backmod", "*")
    new $P128, "ResizablePMCArray"
    push $P128, $P127
    .return ($P128)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<+>"  :subid("38_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx131_tgt
    .local int rx131_pos
    .local int rx131_off
    .local int rx131_eos
    .local int rx131_rep
    .local pmc rx131_cur
    (rx131_cur, rx131_pos, rx131_tgt, $I10) = self."!cursor_start"()
    rx131_cur."!cursor_debug"("START ", "quantifier:sym<+>")
    .lex unicode:"$\x{a2}", rx131_cur
    .local pmc match
    .lex "$/", match
    length rx131_eos, rx131_tgt
    set rx131_off, 0
    lt $I10, 2, rx131_start
    sub rx131_off, $I10, 1
    substr rx131_tgt, rx131_tgt, rx131_off
  rx131_start:
.annotate "line", 54
  # rx subcapture "sym"
    set_addr $I10, rxcap_135_fail
    rx131_cur."!mark_push"(0, rx131_pos, $I10)
  # rx literal  "+"
    add $I11, rx131_pos, 1
    gt $I11, rx131_eos, rx131_fail
    sub $I11, rx131_pos, rx131_off
    substr $S10, rx131_tgt, $I11, 1
    ne $S10, "+", rx131_fail
    add rx131_pos, 1
    set_addr $I10, rxcap_135_fail
    ($I12, $I11) = rx131_cur."!mark_peek"($I10)
    rx131_cur."!cursor_pos"($I11)
    ($P10) = rx131_cur."!cursor_start"()
    $P10."!cursor_pass"(rx131_pos, "")
    rx131_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_135_done
  rxcap_135_fail:
    goto rx131_fail
  rxcap_135_done:
  # rx subrule "backmod" subtype=capture negate=
    rx131_cur."!cursor_pos"(rx131_pos)
    $P10 = rx131_cur."backmod"()
    unless $P10, rx131_fail
    rx131_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx131_pos = $P10."pos"()
  # rx pass
    rx131_cur."!cursor_pass"(rx131_pos, "quantifier:sym<+>")
    rx131_cur."!cursor_debug"("PASS  ", "quantifier:sym<+>", " at pos=", rx131_pos)
    .return (rx131_cur)
  rx131_fail:
.annotate "line", 3
    (rx131_rep, rx131_pos, $I10, $P10) = rx131_cur."!mark_fail"(0)
    lt rx131_pos, -1, rx131_done
    eq rx131_pos, -1, rx131_fail
    jump $I10
  rx131_done:
    rx131_cur."!cursor_fail"()
    rx131_cur."!cursor_debug"("FAIL  ", "quantifier:sym<+>")
    .return (rx131_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<+>"  :subid("39_1258897726.59476") :method
.annotate "line", 3
    $P133 = self."!PREFIX__!subrule"("backmod", "+")
    new $P134, "ResizablePMCArray"
    push $P134, $P133
    .return ($P134)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<?>"  :subid("40_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx137_tgt
    .local int rx137_pos
    .local int rx137_off
    .local int rx137_eos
    .local int rx137_rep
    .local pmc rx137_cur
    (rx137_cur, rx137_pos, rx137_tgt, $I10) = self."!cursor_start"()
    rx137_cur."!cursor_debug"("START ", "quantifier:sym<?>")
    .lex unicode:"$\x{a2}", rx137_cur
    .local pmc match
    .lex "$/", match
    length rx137_eos, rx137_tgt
    set rx137_off, 0
    lt $I10, 2, rx137_start
    sub rx137_off, $I10, 1
    substr rx137_tgt, rx137_tgt, rx137_off
  rx137_start:
.annotate "line", 55
  # rx subcapture "sym"
    set_addr $I10, rxcap_141_fail
    rx137_cur."!mark_push"(0, rx137_pos, $I10)
  # rx literal  "?"
    add $I11, rx137_pos, 1
    gt $I11, rx137_eos, rx137_fail
    sub $I11, rx137_pos, rx137_off
    substr $S10, rx137_tgt, $I11, 1
    ne $S10, "?", rx137_fail
    add rx137_pos, 1
    set_addr $I10, rxcap_141_fail
    ($I12, $I11) = rx137_cur."!mark_peek"($I10)
    rx137_cur."!cursor_pos"($I11)
    ($P10) = rx137_cur."!cursor_start"()
    $P10."!cursor_pass"(rx137_pos, "")
    rx137_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_141_done
  rxcap_141_fail:
    goto rx137_fail
  rxcap_141_done:
  # rx subrule "backmod" subtype=capture negate=
    rx137_cur."!cursor_pos"(rx137_pos)
    $P10 = rx137_cur."backmod"()
    unless $P10, rx137_fail
    rx137_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx137_pos = $P10."pos"()
  # rx pass
    rx137_cur."!cursor_pass"(rx137_pos, "quantifier:sym<?>")
    rx137_cur."!cursor_debug"("PASS  ", "quantifier:sym<?>", " at pos=", rx137_pos)
    .return (rx137_cur)
  rx137_fail:
.annotate "line", 3
    (rx137_rep, rx137_pos, $I10, $P10) = rx137_cur."!mark_fail"(0)
    lt rx137_pos, -1, rx137_done
    eq rx137_pos, -1, rx137_fail
    jump $I10
  rx137_done:
    rx137_cur."!cursor_fail"()
    rx137_cur."!cursor_debug"("FAIL  ", "quantifier:sym<?>")
    .return (rx137_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<?>"  :subid("41_1258897726.59476") :method
.annotate "line", 3
    $P139 = self."!PREFIX__!subrule"("backmod", "?")
    new $P140, "ResizablePMCArray"
    push $P140, $P139
    .return ($P140)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<**>"  :subid("42_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx143_tgt
    .local int rx143_pos
    .local int rx143_off
    .local int rx143_eos
    .local int rx143_rep
    .local pmc rx143_cur
    (rx143_cur, rx143_pos, rx143_tgt, $I10) = self."!cursor_start"()
    rx143_cur."!cursor_debug"("START ", "quantifier:sym<**>")
    rx143_cur."!cursor_caparray"("max")
    .lex unicode:"$\x{a2}", rx143_cur
    .local pmc match
    .lex "$/", match
    length rx143_eos, rx143_tgt
    set rx143_off, 0
    lt $I10, 2, rx143_start
    sub rx143_off, $I10, 1
    substr rx143_tgt, rx143_tgt, rx143_off
  rx143_start:
.annotate "line", 57
  # rx subcapture "sym"
    set_addr $I10, rxcap_146_fail
    rx143_cur."!mark_push"(0, rx143_pos, $I10)
  # rx literal  "**"
    add $I11, rx143_pos, 2
    gt $I11, rx143_eos, rx143_fail
    sub $I11, rx143_pos, rx143_off
    substr $S10, rx143_tgt, $I11, 2
    ne $S10, "**", rx143_fail
    add rx143_pos, 2
    set_addr $I10, rxcap_146_fail
    ($I12, $I11) = rx143_cur."!mark_peek"($I10)
    rx143_cur."!cursor_pos"($I11)
    ($P10) = rx143_cur."!cursor_start"()
    $P10."!cursor_pass"(rx143_pos, "")
    rx143_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_146_done
  rxcap_146_fail:
    goto rx143_fail
  rxcap_146_done:
  # rx charclass_q s r 0..-1
    sub $I10, rx143_pos, rx143_off
    find_not_cclass $I11, 32, rx143_tgt, $I10, rx143_eos
    add rx143_pos, rx143_off, $I11
  # rx subrule "backmod" subtype=capture negate=
    rx143_cur."!cursor_pos"(rx143_pos)
    $P10 = rx143_cur."backmod"()
    unless $P10, rx143_fail
    rx143_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx143_pos = $P10."pos"()
  # rx charclass_q s r 0..-1
    sub $I10, rx143_pos, rx143_off
    find_not_cclass $I11, 32, rx143_tgt, $I10, rx143_eos
    add rx143_pos, rx143_off, $I11
  alt147_0:
.annotate "line", 58
    set_addr $I10, alt147_1
    rx143_cur."!mark_push"(0, rx143_pos, $I10)
.annotate "line", 59
  # rx subcapture "min"
    set_addr $I10, rxcap_148_fail
    rx143_cur."!mark_push"(0, rx143_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx143_pos, rx143_off
    find_not_cclass $I11, 8, rx143_tgt, $I10, rx143_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx143_fail
    add rx143_pos, rx143_off, $I11
    set_addr $I10, rxcap_148_fail
    ($I12, $I11) = rx143_cur."!mark_peek"($I10)
    rx143_cur."!cursor_pos"($I11)
    ($P10) = rx143_cur."!cursor_start"()
    $P10."!cursor_pass"(rx143_pos, "")
    rx143_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("min")
    goto rxcap_148_done
  rxcap_148_fail:
    goto rx143_fail
  rxcap_148_done:
  # rx rxquantr149 ** 0..1
    set_addr $I152, rxquantr149_done
    rx143_cur."!mark_push"(0, rx143_pos, $I152)
  rxquantr149_loop:
  # rx literal  ".."
    add $I11, rx143_pos, 2
    gt $I11, rx143_eos, rx143_fail
    sub $I11, rx143_pos, rx143_off
    substr $S10, rx143_tgt, $I11, 2
    ne $S10, "..", rx143_fail
    add rx143_pos, 2
  # rx subcapture "max"
    set_addr $I10, rxcap_151_fail
    rx143_cur."!mark_push"(0, rx143_pos, $I10)
  alt150_0:
    set_addr $I10, alt150_1
    rx143_cur."!mark_push"(0, rx143_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx143_pos, rx143_off
    find_not_cclass $I11, 8, rx143_tgt, $I10, rx143_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx143_fail
    add rx143_pos, rx143_off, $I11
    goto alt150_end
  alt150_1:
  # rx literal  "*"
    add $I11, rx143_pos, 1
    gt $I11, rx143_eos, rx143_fail
    sub $I11, rx143_pos, rx143_off
    substr $S10, rx143_tgt, $I11, 1
    ne $S10, "*", rx143_fail
    add rx143_pos, 1
  alt150_end:
    set_addr $I10, rxcap_151_fail
    ($I12, $I11) = rx143_cur."!mark_peek"($I10)
    rx143_cur."!cursor_pos"($I11)
    ($P10) = rx143_cur."!cursor_start"()
    $P10."!cursor_pass"(rx143_pos, "")
    rx143_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("max")
    goto rxcap_151_done
  rxcap_151_fail:
    goto rx143_fail
  rxcap_151_done:
    (rx143_rep) = rx143_cur."!mark_commit"($I152)
  rxquantr149_done:
    goto alt147_end
  alt147_1:
.annotate "line", 60
  # rx subrule "quantified_atom" subtype=capture negate=
    rx143_cur."!cursor_pos"(rx143_pos)
    $P10 = rx143_cur."quantified_atom"()
    unless $P10, rx143_fail
    rx143_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantified_atom")
    rx143_pos = $P10."pos"()
  alt147_end:
.annotate "line", 56
  # rx pass
    rx143_cur."!cursor_pass"(rx143_pos, "quantifier:sym<**>")
    rx143_cur."!cursor_debug"("PASS  ", "quantifier:sym<**>", " at pos=", rx143_pos)
    .return (rx143_cur)
  rx143_fail:
.annotate "line", 3
    (rx143_rep, rx143_pos, $I10, $P10) = rx143_cur."!mark_fail"(0)
    lt rx143_pos, -1, rx143_done
    eq rx143_pos, -1, rx143_fail
    jump $I10
  rx143_done:
    rx143_cur."!cursor_fail"()
    rx143_cur."!cursor_debug"("FAIL  ", "quantifier:sym<**>")
    .return (rx143_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<**>"  :subid("43_1258897726.59476") :method
.annotate "line", 3
    new $P145, "ResizablePMCArray"
    push $P145, "**"
    .return ($P145)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backmod"  :subid("44_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .const 'Sub' $P161 = "46_1258897726.59476" 
    capture_lex $P161
    .local string rx154_tgt
    .local int rx154_pos
    .local int rx154_off
    .local int rx154_eos
    .local int rx154_rep
    .local pmc rx154_cur
    (rx154_cur, rx154_pos, rx154_tgt, $I10) = self."!cursor_start"()
    rx154_cur."!cursor_debug"("START ", "backmod")
    .lex unicode:"$\x{a2}", rx154_cur
    .local pmc match
    .lex "$/", match
    length rx154_eos, rx154_tgt
    set rx154_off, 0
    lt $I10, 2, rx154_start
    sub rx154_off, $I10, 1
    substr rx154_tgt, rx154_tgt, rx154_off
  rx154_start:
.annotate "line", 64
  # rx rxquantr157 ** 0..1
    set_addr $I158, rxquantr157_done
    rx154_cur."!mark_push"(0, rx154_pos, $I158)
  rxquantr157_loop:
  # rx literal  ":"
    add $I11, rx154_pos, 1
    gt $I11, rx154_eos, rx154_fail
    sub $I11, rx154_pos, rx154_off
    substr $S10, rx154_tgt, $I11, 1
    ne $S10, ":", rx154_fail
    add rx154_pos, 1
    (rx154_rep) = rx154_cur."!mark_commit"($I158)
  rxquantr157_done:
  alt159_0:
    set_addr $I10, alt159_1
    rx154_cur."!mark_push"(0, rx154_pos, $I10)
  # rx literal  "?"
    add $I11, rx154_pos, 1
    gt $I11, rx154_eos, rx154_fail
    sub $I11, rx154_pos, rx154_off
    substr $S10, rx154_tgt, $I11, 1
    ne $S10, "?", rx154_fail
    add rx154_pos, 1
    goto alt159_end
  alt159_1:
    set_addr $I10, alt159_2
    rx154_cur."!mark_push"(0, rx154_pos, $I10)
  # rx literal  "!"
    add $I11, rx154_pos, 1
    gt $I11, rx154_eos, rx154_fail
    sub $I11, rx154_pos, rx154_off
    substr $S10, rx154_tgt, $I11, 1
    ne $S10, "!", rx154_fail
    add rx154_pos, 1
    goto alt159_end
  alt159_2:
  # rx subrule "before" subtype=zerowidth negate=1
    rx154_cur."!cursor_pos"(rx154_pos)
    .const 'Sub' $P161 = "46_1258897726.59476" 
    capture_lex $P161
    $P10 = rx154_cur."before"($P161)
    if $P10, rx154_fail
  alt159_end:
  # rx pass
    rx154_cur."!cursor_pass"(rx154_pos, "backmod")
    rx154_cur."!cursor_debug"("PASS  ", "backmod", " at pos=", rx154_pos)
    .return (rx154_cur)
  rx154_fail:
.annotate "line", 3
    (rx154_rep, rx154_pos, $I10, $P10) = rx154_cur."!mark_fail"(0)
    lt rx154_pos, -1, rx154_done
    eq rx154_pos, -1, rx154_fail
    jump $I10
  rx154_done:
    rx154_cur."!cursor_fail"()
    rx154_cur."!cursor_debug"("FAIL  ", "backmod")
    .return (rx154_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backmod"  :subid("45_1258897726.59476") :method
.annotate "line", 3
    new $P156, "ResizablePMCArray"
    push $P156, ""
    .return ($P156)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block160"  :anon :subid("46_1258897726.59476") :method :outer("44_1258897726.59476")
.annotate "line", 64
    .local string rx162_tgt
    .local int rx162_pos
    .local int rx162_off
    .local int rx162_eos
    .local int rx162_rep
    .local pmc rx162_cur
    (rx162_cur, rx162_pos, rx162_tgt, $I10) = self."!cursor_start"()
    rx162_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx162_cur
    .local pmc match
    .lex "$/", match
    length rx162_eos, rx162_tgt
    set rx162_off, 0
    lt $I10, 2, rx162_start
    sub rx162_off, $I10, 1
    substr rx162_tgt, rx162_tgt, rx162_off
  rx162_start:
    ge rx162_pos, 0, rxscan163_done
  rxscan163_loop:
    ($P10) = rx162_cur."from"()
    inc $P10
    set rx162_pos, $P10
    ge rx162_pos, rx162_eos, rxscan163_done
    set_addr $I10, rxscan163_loop
    rx162_cur."!mark_push"(0, rx162_pos, $I10)
  rxscan163_done:
  # rx literal  ":"
    add $I11, rx162_pos, 1
    gt $I11, rx162_eos, rx162_fail
    sub $I11, rx162_pos, rx162_off
    substr $S10, rx162_tgt, $I11, 1
    ne $S10, ":", rx162_fail
    add rx162_pos, 1
  # rx pass
    rx162_cur."!cursor_pass"(rx162_pos, "")
    rx162_cur."!cursor_debug"("PASS  ", "", " at pos=", rx162_pos)
    .return (rx162_cur)
  rx162_fail:
    (rx162_rep, rx162_pos, $I10, $P10) = rx162_cur."!mark_fail"(0)
    lt rx162_pos, -1, rx162_done
    eq rx162_pos, -1, rx162_fail
    jump $I10
  rx162_done:
    rx162_cur."!cursor_fail"()
    rx162_cur."!cursor_debug"("FAIL  ", "")
    .return (rx162_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar"  :subid("47_1258897726.59476") :method
.annotate "line", 66
    $P165 = self."!protoregex"("metachar")
    .return ($P165)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar"  :subid("48_1258897726.59476") :method
.annotate "line", 66
    $P167 = self."!PREFIX__!protoregex"("metachar")
    .return ($P167)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<ws>"  :subid("49_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx169_tgt
    .local int rx169_pos
    .local int rx169_off
    .local int rx169_eos
    .local int rx169_rep
    .local pmc rx169_cur
    (rx169_cur, rx169_pos, rx169_tgt, $I10) = self."!cursor_start"()
    rx169_cur."!cursor_debug"("START ", "metachar:sym<ws>")
    .lex unicode:"$\x{a2}", rx169_cur
    .local pmc match
    .lex "$/", match
    length rx169_eos, rx169_tgt
    set rx169_off, 0
    lt $I10, 2, rx169_start
    sub rx169_off, $I10, 1
    substr rx169_tgt, rx169_tgt, rx169_off
  rx169_start:
.annotate "line", 67
  # rx subrule "normspace" subtype=method negate=
    rx169_cur."!cursor_pos"(rx169_pos)
    $P10 = rx169_cur."normspace"()
    unless $P10, rx169_fail
    rx169_pos = $P10."pos"()
  # rx pass
    rx169_cur."!cursor_pass"(rx169_pos, "metachar:sym<ws>")
    rx169_cur."!cursor_debug"("PASS  ", "metachar:sym<ws>", " at pos=", rx169_pos)
    .return (rx169_cur)
  rx169_fail:
.annotate "line", 3
    (rx169_rep, rx169_pos, $I10, $P10) = rx169_cur."!mark_fail"(0)
    lt rx169_pos, -1, rx169_done
    eq rx169_pos, -1, rx169_fail
    jump $I10
  rx169_done:
    rx169_cur."!cursor_fail"()
    rx169_cur."!cursor_debug"("FAIL  ", "metachar:sym<ws>")
    .return (rx169_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<ws>"  :subid("50_1258897726.59476") :method
.annotate "line", 3
    $P171 = self."!PREFIX__!subrule"("", "")
    new $P172, "ResizablePMCArray"
    push $P172, $P171
    .return ($P172)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<[ ]>"  :subid("51_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx174_tgt
    .local int rx174_pos
    .local int rx174_off
    .local int rx174_eos
    .local int rx174_rep
    .local pmc rx174_cur
    (rx174_cur, rx174_pos, rx174_tgt, $I10) = self."!cursor_start"()
    rx174_cur."!cursor_debug"("START ", "metachar:sym<[ ]>")
    .lex unicode:"$\x{a2}", rx174_cur
    .local pmc match
    .lex "$/", match
    length rx174_eos, rx174_tgt
    set rx174_off, 0
    lt $I10, 2, rx174_start
    sub rx174_off, $I10, 1
    substr rx174_tgt, rx174_tgt, rx174_off
  rx174_start:
.annotate "line", 68
  # rx literal  "["
    add $I11, rx174_pos, 1
    gt $I11, rx174_eos, rx174_fail
    sub $I11, rx174_pos, rx174_off
    substr $S10, rx174_tgt, $I11, 1
    ne $S10, "[", rx174_fail
    add rx174_pos, 1
  # rx subrule "nibbler" subtype=capture negate=
    rx174_cur."!cursor_pos"(rx174_pos)
    $P10 = rx174_cur."nibbler"()
    unless $P10, rx174_fail
    rx174_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx174_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx174_pos, 1
    gt $I11, rx174_eos, rx174_fail
    sub $I11, rx174_pos, rx174_off
    substr $S10, rx174_tgt, $I11, 1
    ne $S10, "]", rx174_fail
    add rx174_pos, 1
  # rx pass
    rx174_cur."!cursor_pass"(rx174_pos, "metachar:sym<[ ]>")
    rx174_cur."!cursor_debug"("PASS  ", "metachar:sym<[ ]>", " at pos=", rx174_pos)
    .return (rx174_cur)
  rx174_fail:
.annotate "line", 3
    (rx174_rep, rx174_pos, $I10, $P10) = rx174_cur."!mark_fail"(0)
    lt rx174_pos, -1, rx174_done
    eq rx174_pos, -1, rx174_fail
    jump $I10
  rx174_done:
    rx174_cur."!cursor_fail"()
    rx174_cur."!cursor_debug"("FAIL  ", "metachar:sym<[ ]>")
    .return (rx174_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<[ ]>"  :subid("52_1258897726.59476") :method
.annotate "line", 3
    $P176 = self."!PREFIX__!subrule"("nibbler", "[")
    new $P177, "ResizablePMCArray"
    push $P177, $P176
    .return ($P177)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<( )>"  :subid("53_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx179_tgt
    .local int rx179_pos
    .local int rx179_off
    .local int rx179_eos
    .local int rx179_rep
    .local pmc rx179_cur
    (rx179_cur, rx179_pos, rx179_tgt, $I10) = self."!cursor_start"()
    rx179_cur."!cursor_debug"("START ", "metachar:sym<( )>")
    .lex unicode:"$\x{a2}", rx179_cur
    .local pmc match
    .lex "$/", match
    length rx179_eos, rx179_tgt
    set rx179_off, 0
    lt $I10, 2, rx179_start
    sub rx179_off, $I10, 1
    substr rx179_tgt, rx179_tgt, rx179_off
  rx179_start:
.annotate "line", 69
  # rx literal  "("
    add $I11, rx179_pos, 1
    gt $I11, rx179_eos, rx179_fail
    sub $I11, rx179_pos, rx179_off
    substr $S10, rx179_tgt, $I11, 1
    ne $S10, "(", rx179_fail
    add rx179_pos, 1
  # rx subrule "nibbler" subtype=capture negate=
    rx179_cur."!cursor_pos"(rx179_pos)
    $P10 = rx179_cur."nibbler"()
    unless $P10, rx179_fail
    rx179_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx179_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx179_pos, 1
    gt $I11, rx179_eos, rx179_fail
    sub $I11, rx179_pos, rx179_off
    substr $S10, rx179_tgt, $I11, 1
    ne $S10, ")", rx179_fail
    add rx179_pos, 1
  # rx pass
    rx179_cur."!cursor_pass"(rx179_pos, "metachar:sym<( )>")
    rx179_cur."!cursor_debug"("PASS  ", "metachar:sym<( )>", " at pos=", rx179_pos)
    .return (rx179_cur)
  rx179_fail:
.annotate "line", 3
    (rx179_rep, rx179_pos, $I10, $P10) = rx179_cur."!mark_fail"(0)
    lt rx179_pos, -1, rx179_done
    eq rx179_pos, -1, rx179_fail
    jump $I10
  rx179_done:
    rx179_cur."!cursor_fail"()
    rx179_cur."!cursor_debug"("FAIL  ", "metachar:sym<( )>")
    .return (rx179_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<( )>"  :subid("54_1258897726.59476") :method
.annotate "line", 3
    $P181 = self."!PREFIX__!subrule"("nibbler", "(")
    new $P182, "ResizablePMCArray"
    push $P182, $P181
    .return ($P182)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<'>"  :subid("55_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx184_tgt
    .local int rx184_pos
    .local int rx184_off
    .local int rx184_eos
    .local int rx184_rep
    .local pmc rx184_cur
    (rx184_cur, rx184_pos, rx184_tgt, $I10) = self."!cursor_start"()
    rx184_cur."!cursor_debug"("START ", "metachar:sym<'>")
    .lex unicode:"$\x{a2}", rx184_cur
    .local pmc match
    .lex "$/", match
    length rx184_eos, rx184_tgt
    set rx184_off, 0
    lt $I10, 2, rx184_start
    sub rx184_off, $I10, 1
    substr rx184_tgt, rx184_tgt, rx184_off
  rx184_start:
.annotate "line", 70
  # rx enumcharlist negate=0 zerowidth
    ge rx184_pos, rx184_eos, rx184_fail
    sub $I10, rx184_pos, rx184_off
    substr $S10, rx184_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx184_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx184_cur."!cursor_pos"(rx184_pos)
    $P10 = rx184_cur."quote_EXPR"(":q")
    unless $P10, rx184_fail
    rx184_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx184_pos = $P10."pos"()
  # rx pass
    rx184_cur."!cursor_pass"(rx184_pos, "metachar:sym<'>")
    rx184_cur."!cursor_debug"("PASS  ", "metachar:sym<'>", " at pos=", rx184_pos)
    .return (rx184_cur)
  rx184_fail:
.annotate "line", 3
    (rx184_rep, rx184_pos, $I10, $P10) = rx184_cur."!mark_fail"(0)
    lt rx184_pos, -1, rx184_done
    eq rx184_pos, -1, rx184_fail
    jump $I10
  rx184_done:
    rx184_cur."!cursor_fail"()
    rx184_cur."!cursor_debug"("FAIL  ", "metachar:sym<'>")
    .return (rx184_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<'>"  :subid("56_1258897726.59476") :method
.annotate "line", 3
    new $P186, "ResizablePMCArray"
    push $P186, "'"
    .return ($P186)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<\">"  :subid("57_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx188_tgt
    .local int rx188_pos
    .local int rx188_off
    .local int rx188_eos
    .local int rx188_rep
    .local pmc rx188_cur
    (rx188_cur, rx188_pos, rx188_tgt, $I10) = self."!cursor_start"()
    rx188_cur."!cursor_debug"("START ", "metachar:sym<\">")
    .lex unicode:"$\x{a2}", rx188_cur
    .local pmc match
    .lex "$/", match
    length rx188_eos, rx188_tgt
    set rx188_off, 0
    lt $I10, 2, rx188_start
    sub rx188_off, $I10, 1
    substr rx188_tgt, rx188_tgt, rx188_off
  rx188_start:
.annotate "line", 71
  # rx enumcharlist negate=0 zerowidth
    ge rx188_pos, rx188_eos, rx188_fail
    sub $I10, rx188_pos, rx188_off
    substr $S10, rx188_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx188_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx188_cur."!cursor_pos"(rx188_pos)
    $P10 = rx188_cur."quote_EXPR"(":qq")
    unless $P10, rx188_fail
    rx188_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx188_pos = $P10."pos"()
  # rx pass
    rx188_cur."!cursor_pass"(rx188_pos, "metachar:sym<\">")
    rx188_cur."!cursor_debug"("PASS  ", "metachar:sym<\">", " at pos=", rx188_pos)
    .return (rx188_cur)
  rx188_fail:
.annotate "line", 3
    (rx188_rep, rx188_pos, $I10, $P10) = rx188_cur."!mark_fail"(0)
    lt rx188_pos, -1, rx188_done
    eq rx188_pos, -1, rx188_fail
    jump $I10
  rx188_done:
    rx188_cur."!cursor_fail"()
    rx188_cur."!cursor_debug"("FAIL  ", "metachar:sym<\">")
    .return (rx188_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<\">"  :subid("58_1258897726.59476") :method
.annotate "line", 3
    new $P190, "ResizablePMCArray"
    push $P190, "\""
    .return ($P190)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<.>"  :subid("59_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx192_tgt
    .local int rx192_pos
    .local int rx192_off
    .local int rx192_eos
    .local int rx192_rep
    .local pmc rx192_cur
    (rx192_cur, rx192_pos, rx192_tgt, $I10) = self."!cursor_start"()
    rx192_cur."!cursor_debug"("START ", "metachar:sym<.>")
    .lex unicode:"$\x{a2}", rx192_cur
    .local pmc match
    .lex "$/", match
    length rx192_eos, rx192_tgt
    set rx192_off, 0
    lt $I10, 2, rx192_start
    sub rx192_off, $I10, 1
    substr rx192_tgt, rx192_tgt, rx192_off
  rx192_start:
.annotate "line", 72
  # rx subcapture "sym"
    set_addr $I10, rxcap_195_fail
    rx192_cur."!mark_push"(0, rx192_pos, $I10)
  # rx literal  "."
    add $I11, rx192_pos, 1
    gt $I11, rx192_eos, rx192_fail
    sub $I11, rx192_pos, rx192_off
    substr $S10, rx192_tgt, $I11, 1
    ne $S10, ".", rx192_fail
    add rx192_pos, 1
    set_addr $I10, rxcap_195_fail
    ($I12, $I11) = rx192_cur."!mark_peek"($I10)
    rx192_cur."!cursor_pos"($I11)
    ($P10) = rx192_cur."!cursor_start"()
    $P10."!cursor_pass"(rx192_pos, "")
    rx192_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_195_done
  rxcap_195_fail:
    goto rx192_fail
  rxcap_195_done:
  # rx pass
    rx192_cur."!cursor_pass"(rx192_pos, "metachar:sym<.>")
    rx192_cur."!cursor_debug"("PASS  ", "metachar:sym<.>", " at pos=", rx192_pos)
    .return (rx192_cur)
  rx192_fail:
.annotate "line", 3
    (rx192_rep, rx192_pos, $I10, $P10) = rx192_cur."!mark_fail"(0)
    lt rx192_pos, -1, rx192_done
    eq rx192_pos, -1, rx192_fail
    jump $I10
  rx192_done:
    rx192_cur."!cursor_fail"()
    rx192_cur."!cursor_debug"("FAIL  ", "metachar:sym<.>")
    .return (rx192_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<.>"  :subid("60_1258897726.59476") :method
.annotate "line", 3
    new $P194, "ResizablePMCArray"
    push $P194, "."
    .return ($P194)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^>"  :subid("61_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx197_tgt
    .local int rx197_pos
    .local int rx197_off
    .local int rx197_eos
    .local int rx197_rep
    .local pmc rx197_cur
    (rx197_cur, rx197_pos, rx197_tgt, $I10) = self."!cursor_start"()
    rx197_cur."!cursor_debug"("START ", "metachar:sym<^>")
    .lex unicode:"$\x{a2}", rx197_cur
    .local pmc match
    .lex "$/", match
    length rx197_eos, rx197_tgt
    set rx197_off, 0
    lt $I10, 2, rx197_start
    sub rx197_off, $I10, 1
    substr rx197_tgt, rx197_tgt, rx197_off
  rx197_start:
.annotate "line", 73
  # rx subcapture "sym"
    set_addr $I10, rxcap_200_fail
    rx197_cur."!mark_push"(0, rx197_pos, $I10)
  # rx literal  "^"
    add $I11, rx197_pos, 1
    gt $I11, rx197_eos, rx197_fail
    sub $I11, rx197_pos, rx197_off
    substr $S10, rx197_tgt, $I11, 1
    ne $S10, "^", rx197_fail
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
    rx197_cur."!cursor_pass"(rx197_pos, "metachar:sym<^>")
    rx197_cur."!cursor_debug"("PASS  ", "metachar:sym<^>", " at pos=", rx197_pos)
    .return (rx197_cur)
  rx197_fail:
.annotate "line", 3
    (rx197_rep, rx197_pos, $I10, $P10) = rx197_cur."!mark_fail"(0)
    lt rx197_pos, -1, rx197_done
    eq rx197_pos, -1, rx197_fail
    jump $I10
  rx197_done:
    rx197_cur."!cursor_fail"()
    rx197_cur."!cursor_debug"("FAIL  ", "metachar:sym<^>")
    .return (rx197_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<^>"  :subid("62_1258897726.59476") :method
.annotate "line", 3
    new $P199, "ResizablePMCArray"
    push $P199, "^"
    .return ($P199)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^^>"  :subid("63_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx202_tgt
    .local int rx202_pos
    .local int rx202_off
    .local int rx202_eos
    .local int rx202_rep
    .local pmc rx202_cur
    (rx202_cur, rx202_pos, rx202_tgt, $I10) = self."!cursor_start"()
    rx202_cur."!cursor_debug"("START ", "metachar:sym<^^>")
    .lex unicode:"$\x{a2}", rx202_cur
    .local pmc match
    .lex "$/", match
    length rx202_eos, rx202_tgt
    set rx202_off, 0
    lt $I10, 2, rx202_start
    sub rx202_off, $I10, 1
    substr rx202_tgt, rx202_tgt, rx202_off
  rx202_start:
.annotate "line", 74
  # rx subcapture "sym"
    set_addr $I10, rxcap_205_fail
    rx202_cur."!mark_push"(0, rx202_pos, $I10)
  # rx literal  "^^"
    add $I11, rx202_pos, 2
    gt $I11, rx202_eos, rx202_fail
    sub $I11, rx202_pos, rx202_off
    substr $S10, rx202_tgt, $I11, 2
    ne $S10, "^^", rx202_fail
    add rx202_pos, 2
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
    rx202_cur."!cursor_pass"(rx202_pos, "metachar:sym<^^>")
    rx202_cur."!cursor_debug"("PASS  ", "metachar:sym<^^>", " at pos=", rx202_pos)
    .return (rx202_cur)
  rx202_fail:
.annotate "line", 3
    (rx202_rep, rx202_pos, $I10, $P10) = rx202_cur."!mark_fail"(0)
    lt rx202_pos, -1, rx202_done
    eq rx202_pos, -1, rx202_fail
    jump $I10
  rx202_done:
    rx202_cur."!cursor_fail"()
    rx202_cur."!cursor_debug"("FAIL  ", "metachar:sym<^^>")
    .return (rx202_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<^^>"  :subid("64_1258897726.59476") :method
.annotate "line", 3
    new $P204, "ResizablePMCArray"
    push $P204, "^^"
    .return ($P204)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$>"  :subid("65_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx207_tgt
    .local int rx207_pos
    .local int rx207_off
    .local int rx207_eos
    .local int rx207_rep
    .local pmc rx207_cur
    (rx207_cur, rx207_pos, rx207_tgt, $I10) = self."!cursor_start"()
    rx207_cur."!cursor_debug"("START ", "metachar:sym<$>")
    .lex unicode:"$\x{a2}", rx207_cur
    .local pmc match
    .lex "$/", match
    length rx207_eos, rx207_tgt
    set rx207_off, 0
    lt $I10, 2, rx207_start
    sub rx207_off, $I10, 1
    substr rx207_tgt, rx207_tgt, rx207_off
  rx207_start:
.annotate "line", 75
  # rx subcapture "sym"
    set_addr $I10, rxcap_210_fail
    rx207_cur."!mark_push"(0, rx207_pos, $I10)
  # rx literal  "$"
    add $I11, rx207_pos, 1
    gt $I11, rx207_eos, rx207_fail
    sub $I11, rx207_pos, rx207_off
    substr $S10, rx207_tgt, $I11, 1
    ne $S10, "$", rx207_fail
    add rx207_pos, 1
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
    rx207_cur."!cursor_pass"(rx207_pos, "metachar:sym<$>")
    rx207_cur."!cursor_debug"("PASS  ", "metachar:sym<$>", " at pos=", rx207_pos)
    .return (rx207_cur)
  rx207_fail:
.annotate "line", 3
    (rx207_rep, rx207_pos, $I10, $P10) = rx207_cur."!mark_fail"(0)
    lt rx207_pos, -1, rx207_done
    eq rx207_pos, -1, rx207_fail
    jump $I10
  rx207_done:
    rx207_cur."!cursor_fail"()
    rx207_cur."!cursor_debug"("FAIL  ", "metachar:sym<$>")
    .return (rx207_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<$>"  :subid("66_1258897726.59476") :method
.annotate "line", 3
    new $P209, "ResizablePMCArray"
    push $P209, "$"
    .return ($P209)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$$>"  :subid("67_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx212_tgt
    .local int rx212_pos
    .local int rx212_off
    .local int rx212_eos
    .local int rx212_rep
    .local pmc rx212_cur
    (rx212_cur, rx212_pos, rx212_tgt, $I10) = self."!cursor_start"()
    rx212_cur."!cursor_debug"("START ", "metachar:sym<$$>")
    .lex unicode:"$\x{a2}", rx212_cur
    .local pmc match
    .lex "$/", match
    length rx212_eos, rx212_tgt
    set rx212_off, 0
    lt $I10, 2, rx212_start
    sub rx212_off, $I10, 1
    substr rx212_tgt, rx212_tgt, rx212_off
  rx212_start:
.annotate "line", 76
  # rx subcapture "sym"
    set_addr $I10, rxcap_215_fail
    rx212_cur."!mark_push"(0, rx212_pos, $I10)
  # rx literal  "$$"
    add $I11, rx212_pos, 2
    gt $I11, rx212_eos, rx212_fail
    sub $I11, rx212_pos, rx212_off
    substr $S10, rx212_tgt, $I11, 2
    ne $S10, "$$", rx212_fail
    add rx212_pos, 2
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
    rx212_cur."!cursor_pass"(rx212_pos, "metachar:sym<$$>")
    rx212_cur."!cursor_debug"("PASS  ", "metachar:sym<$$>", " at pos=", rx212_pos)
    .return (rx212_cur)
  rx212_fail:
.annotate "line", 3
    (rx212_rep, rx212_pos, $I10, $P10) = rx212_cur."!mark_fail"(0)
    lt rx212_pos, -1, rx212_done
    eq rx212_pos, -1, rx212_fail
    jump $I10
  rx212_done:
    rx212_cur."!cursor_fail"()
    rx212_cur."!cursor_debug"("FAIL  ", "metachar:sym<$$>")
    .return (rx212_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<$$>"  :subid("68_1258897726.59476") :method
.annotate "line", 3
    new $P214, "ResizablePMCArray"
    push $P214, "$$"
    .return ($P214)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<:::>"  :subid("69_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx217_tgt
    .local int rx217_pos
    .local int rx217_off
    .local int rx217_eos
    .local int rx217_rep
    .local pmc rx217_cur
    (rx217_cur, rx217_pos, rx217_tgt, $I10) = self."!cursor_start"()
    rx217_cur."!cursor_debug"("START ", "metachar:sym<:::>")
    .lex unicode:"$\x{a2}", rx217_cur
    .local pmc match
    .lex "$/", match
    length rx217_eos, rx217_tgt
    set rx217_off, 0
    lt $I10, 2, rx217_start
    sub rx217_off, $I10, 1
    substr rx217_tgt, rx217_tgt, rx217_off
  rx217_start:
.annotate "line", 77
  # rx subcapture "sym"
    set_addr $I10, rxcap_221_fail
    rx217_cur."!mark_push"(0, rx217_pos, $I10)
  # rx literal  ":::"
    add $I11, rx217_pos, 3
    gt $I11, rx217_eos, rx217_fail
    sub $I11, rx217_pos, rx217_off
    substr $S10, rx217_tgt, $I11, 3
    ne $S10, ":::", rx217_fail
    add rx217_pos, 3
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
  # rx subrule "panic" subtype=method negate=
    rx217_cur."!cursor_pos"(rx217_pos)
    $P10 = rx217_cur."panic"("::: not yet implemented")
    unless $P10, rx217_fail
    rx217_pos = $P10."pos"()
  # rx pass
    rx217_cur."!cursor_pass"(rx217_pos, "metachar:sym<:::>")
    rx217_cur."!cursor_debug"("PASS  ", "metachar:sym<:::>", " at pos=", rx217_pos)
    .return (rx217_cur)
  rx217_fail:
.annotate "line", 3
    (rx217_rep, rx217_pos, $I10, $P10) = rx217_cur."!mark_fail"(0)
    lt rx217_pos, -1, rx217_done
    eq rx217_pos, -1, rx217_fail
    jump $I10
  rx217_done:
    rx217_cur."!cursor_fail"()
    rx217_cur."!cursor_debug"("FAIL  ", "metachar:sym<:::>")
    .return (rx217_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<:::>"  :subid("70_1258897726.59476") :method
.annotate "line", 3
    $P219 = self."!PREFIX__!subrule"("", ":::")
    new $P220, "ResizablePMCArray"
    push $P220, $P219
    .return ($P220)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<::>"  :subid("71_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx223_tgt
    .local int rx223_pos
    .local int rx223_off
    .local int rx223_eos
    .local int rx223_rep
    .local pmc rx223_cur
    (rx223_cur, rx223_pos, rx223_tgt, $I10) = self."!cursor_start"()
    rx223_cur."!cursor_debug"("START ", "metachar:sym<::>")
    .lex unicode:"$\x{a2}", rx223_cur
    .local pmc match
    .lex "$/", match
    length rx223_eos, rx223_tgt
    set rx223_off, 0
    lt $I10, 2, rx223_start
    sub rx223_off, $I10, 1
    substr rx223_tgt, rx223_tgt, rx223_off
  rx223_start:
.annotate "line", 78
  # rx subcapture "sym"
    set_addr $I10, rxcap_227_fail
    rx223_cur."!mark_push"(0, rx223_pos, $I10)
  # rx literal  "::"
    add $I11, rx223_pos, 2
    gt $I11, rx223_eos, rx223_fail
    sub $I11, rx223_pos, rx223_off
    substr $S10, rx223_tgt, $I11, 2
    ne $S10, "::", rx223_fail
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
  # rx subrule "panic" subtype=method negate=
    rx223_cur."!cursor_pos"(rx223_pos)
    $P10 = rx223_cur."panic"(":: not yet implemented")
    unless $P10, rx223_fail
    rx223_pos = $P10."pos"()
  # rx pass
    rx223_cur."!cursor_pass"(rx223_pos, "metachar:sym<::>")
    rx223_cur."!cursor_debug"("PASS  ", "metachar:sym<::>", " at pos=", rx223_pos)
    .return (rx223_cur)
  rx223_fail:
.annotate "line", 3
    (rx223_rep, rx223_pos, $I10, $P10) = rx223_cur."!mark_fail"(0)
    lt rx223_pos, -1, rx223_done
    eq rx223_pos, -1, rx223_fail
    jump $I10
  rx223_done:
    rx223_cur."!cursor_fail"()
    rx223_cur."!cursor_debug"("FAIL  ", "metachar:sym<::>")
    .return (rx223_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<::>"  :subid("72_1258897726.59476") :method
.annotate "line", 3
    $P225 = self."!PREFIX__!subrule"("", "::")
    new $P226, "ResizablePMCArray"
    push $P226, $P225
    .return ($P226)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<lwb>"  :subid("73_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx229_tgt
    .local int rx229_pos
    .local int rx229_off
    .local int rx229_eos
    .local int rx229_rep
    .local pmc rx229_cur
    (rx229_cur, rx229_pos, rx229_tgt, $I10) = self."!cursor_start"()
    rx229_cur."!cursor_debug"("START ", "metachar:sym<lwb>")
    .lex unicode:"$\x{a2}", rx229_cur
    .local pmc match
    .lex "$/", match
    length rx229_eos, rx229_tgt
    set rx229_off, 0
    lt $I10, 2, rx229_start
    sub rx229_off, $I10, 1
    substr rx229_tgt, rx229_tgt, rx229_off
  rx229_start:
.annotate "line", 79
  # rx subcapture "sym"
    set_addr $I10, rxcap_233_fail
    rx229_cur."!mark_push"(0, rx229_pos, $I10)
  alt232_0:
    set_addr $I10, alt232_1
    rx229_cur."!mark_push"(0, rx229_pos, $I10)
  # rx literal  "<<"
    add $I11, rx229_pos, 2
    gt $I11, rx229_eos, rx229_fail
    sub $I11, rx229_pos, rx229_off
    substr $S10, rx229_tgt, $I11, 2
    ne $S10, "<<", rx229_fail
    add rx229_pos, 2
    goto alt232_end
  alt232_1:
  # rx literal  unicode:"\x{ab}"
    add $I11, rx229_pos, 1
    gt $I11, rx229_eos, rx229_fail
    sub $I11, rx229_pos, rx229_off
    substr $S10, rx229_tgt, $I11, 1
    ne $S10, unicode:"\x{ab}", rx229_fail
    add rx229_pos, 1
  alt232_end:
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
    rx229_cur."!cursor_pass"(rx229_pos, "metachar:sym<lwb>")
    rx229_cur."!cursor_debug"("PASS  ", "metachar:sym<lwb>", " at pos=", rx229_pos)
    .return (rx229_cur)
  rx229_fail:
.annotate "line", 3
    (rx229_rep, rx229_pos, $I10, $P10) = rx229_cur."!mark_fail"(0)
    lt rx229_pos, -1, rx229_done
    eq rx229_pos, -1, rx229_fail
    jump $I10
  rx229_done:
    rx229_cur."!cursor_fail"()
    rx229_cur."!cursor_debug"("FAIL  ", "metachar:sym<lwb>")
    .return (rx229_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<lwb>"  :subid("74_1258897726.59476") :method
.annotate "line", 3
    new $P231, "ResizablePMCArray"
    push $P231, unicode:"\x{ab}"
    push $P231, "<<"
    .return ($P231)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<rwb>"  :subid("75_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx235_tgt
    .local int rx235_pos
    .local int rx235_off
    .local int rx235_eos
    .local int rx235_rep
    .local pmc rx235_cur
    (rx235_cur, rx235_pos, rx235_tgt, $I10) = self."!cursor_start"()
    rx235_cur."!cursor_debug"("START ", "metachar:sym<rwb>")
    .lex unicode:"$\x{a2}", rx235_cur
    .local pmc match
    .lex "$/", match
    length rx235_eos, rx235_tgt
    set rx235_off, 0
    lt $I10, 2, rx235_start
    sub rx235_off, $I10, 1
    substr rx235_tgt, rx235_tgt, rx235_off
  rx235_start:
.annotate "line", 80
  # rx subcapture "sym"
    set_addr $I10, rxcap_239_fail
    rx235_cur."!mark_push"(0, rx235_pos, $I10)
  alt238_0:
    set_addr $I10, alt238_1
    rx235_cur."!mark_push"(0, rx235_pos, $I10)
  # rx literal  ">>"
    add $I11, rx235_pos, 2
    gt $I11, rx235_eos, rx235_fail
    sub $I11, rx235_pos, rx235_off
    substr $S10, rx235_tgt, $I11, 2
    ne $S10, ">>", rx235_fail
    add rx235_pos, 2
    goto alt238_end
  alt238_1:
  # rx literal  unicode:"\x{bb}"
    add $I11, rx235_pos, 1
    gt $I11, rx235_eos, rx235_fail
    sub $I11, rx235_pos, rx235_off
    substr $S10, rx235_tgt, $I11, 1
    ne $S10, unicode:"\x{bb}", rx235_fail
    add rx235_pos, 1
  alt238_end:
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
    rx235_cur."!cursor_pass"(rx235_pos, "metachar:sym<rwb>")
    rx235_cur."!cursor_debug"("PASS  ", "metachar:sym<rwb>", " at pos=", rx235_pos)
    .return (rx235_cur)
  rx235_fail:
.annotate "line", 3
    (rx235_rep, rx235_pos, $I10, $P10) = rx235_cur."!mark_fail"(0)
    lt rx235_pos, -1, rx235_done
    eq rx235_pos, -1, rx235_fail
    jump $I10
  rx235_done:
    rx235_cur."!cursor_fail"()
    rx235_cur."!cursor_debug"("FAIL  ", "metachar:sym<rwb>")
    .return (rx235_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<rwb>"  :subid("76_1258897726.59476") :method
.annotate "line", 3
    new $P237, "ResizablePMCArray"
    push $P237, unicode:"\x{bb}"
    push $P237, ">>"
    .return ($P237)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<bs>"  :subid("77_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx241_tgt
    .local int rx241_pos
    .local int rx241_off
    .local int rx241_eos
    .local int rx241_rep
    .local pmc rx241_cur
    (rx241_cur, rx241_pos, rx241_tgt, $I10) = self."!cursor_start"()
    rx241_cur."!cursor_debug"("START ", "metachar:sym<bs>")
    .lex unicode:"$\x{a2}", rx241_cur
    .local pmc match
    .lex "$/", match
    length rx241_eos, rx241_tgt
    set rx241_off, 0
    lt $I10, 2, rx241_start
    sub rx241_off, $I10, 1
    substr rx241_tgt, rx241_tgt, rx241_off
  rx241_start:
.annotate "line", 81
  # rx literal  "\\"
    add $I11, rx241_pos, 1
    gt $I11, rx241_eos, rx241_fail
    sub $I11, rx241_pos, rx241_off
    substr $S10, rx241_tgt, $I11, 1
    ne $S10, "\\", rx241_fail
    add rx241_pos, 1
  # rx subrule "backslash" subtype=capture negate=
    rx241_cur."!cursor_pos"(rx241_pos)
    $P10 = rx241_cur."backslash"()
    unless $P10, rx241_fail
    rx241_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backslash")
    rx241_pos = $P10."pos"()
  # rx pass
    rx241_cur."!cursor_pass"(rx241_pos, "metachar:sym<bs>")
    rx241_cur."!cursor_debug"("PASS  ", "metachar:sym<bs>", " at pos=", rx241_pos)
    .return (rx241_cur)
  rx241_fail:
.annotate "line", 3
    (rx241_rep, rx241_pos, $I10, $P10) = rx241_cur."!mark_fail"(0)
    lt rx241_pos, -1, rx241_done
    eq rx241_pos, -1, rx241_fail
    jump $I10
  rx241_done:
    rx241_cur."!cursor_fail"()
    rx241_cur."!cursor_debug"("FAIL  ", "metachar:sym<bs>")
    .return (rx241_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<bs>"  :subid("78_1258897726.59476") :method
.annotate "line", 3
    $P243 = self."!PREFIX__!subrule"("backslash", "\\")
    new $P244, "ResizablePMCArray"
    push $P244, $P243
    .return ($P244)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<mod>"  :subid("79_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx246_tgt
    .local int rx246_pos
    .local int rx246_off
    .local int rx246_eos
    .local int rx246_rep
    .local pmc rx246_cur
    (rx246_cur, rx246_pos, rx246_tgt, $I10) = self."!cursor_start"()
    rx246_cur."!cursor_debug"("START ", "metachar:sym<mod>")
    .lex unicode:"$\x{a2}", rx246_cur
    .local pmc match
    .lex "$/", match
    length rx246_eos, rx246_tgt
    set rx246_off, 0
    lt $I10, 2, rx246_start
    sub rx246_off, $I10, 1
    substr rx246_tgt, rx246_tgt, rx246_off
  rx246_start:
.annotate "line", 82
  # rx subrule "mod_internal" subtype=capture negate=
    rx246_cur."!cursor_pos"(rx246_pos)
    $P10 = rx246_cur."mod_internal"()
    unless $P10, rx246_fail
    rx246_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_internal")
    rx246_pos = $P10."pos"()
  # rx pass
    rx246_cur."!cursor_pass"(rx246_pos, "metachar:sym<mod>")
    rx246_cur."!cursor_debug"("PASS  ", "metachar:sym<mod>", " at pos=", rx246_pos)
    .return (rx246_cur)
  rx246_fail:
.annotate "line", 3
    (rx246_rep, rx246_pos, $I10, $P10) = rx246_cur."!mark_fail"(0)
    lt rx246_pos, -1, rx246_done
    eq rx246_pos, -1, rx246_fail
    jump $I10
  rx246_done:
    rx246_cur."!cursor_fail"()
    rx246_cur."!cursor_debug"("FAIL  ", "metachar:sym<mod>")
    .return (rx246_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<mod>"  :subid("80_1258897726.59476") :method
.annotate "line", 3
    $P248 = self."!PREFIX__!subrule"("mod_internal", "")
    new $P249, "ResizablePMCArray"
    push $P249, $P248
    .return ($P249)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<~>"  :subid("81_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx251_tgt
    .local int rx251_pos
    .local int rx251_off
    .local int rx251_eos
    .local int rx251_rep
    .local pmc rx251_cur
    (rx251_cur, rx251_pos, rx251_tgt, $I10) = self."!cursor_start"()
    rx251_cur."!cursor_debug"("START ", "metachar:sym<~>")
    .lex unicode:"$\x{a2}", rx251_cur
    .local pmc match
    .lex "$/", match
    length rx251_eos, rx251_tgt
    set rx251_off, 0
    lt $I10, 2, rx251_start
    sub rx251_off, $I10, 1
    substr rx251_tgt, rx251_tgt, rx251_off
  rx251_start:
.annotate "line", 86
  # rx subcapture "sym"
    set_addr $I10, rxcap_255_fail
    rx251_cur."!mark_push"(0, rx251_pos, $I10)
  # rx literal  "~"
    add $I11, rx251_pos, 1
    gt $I11, rx251_eos, rx251_fail
    sub $I11, rx251_pos, rx251_off
    substr $S10, rx251_tgt, $I11, 1
    ne $S10, "~", rx251_fail
    add rx251_pos, 1
    set_addr $I10, rxcap_255_fail
    ($I12, $I11) = rx251_cur."!mark_peek"($I10)
    rx251_cur."!cursor_pos"($I11)
    ($P10) = rx251_cur."!cursor_start"()
    $P10."!cursor_pass"(rx251_pos, "")
    rx251_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_255_done
  rxcap_255_fail:
    goto rx251_fail
  rxcap_255_done:
.annotate "line", 87
  # rx subrule "ws" subtype=method negate=
    rx251_cur."!cursor_pos"(rx251_pos)
    $P10 = rx251_cur."ws"()
    unless $P10, rx251_fail
    rx251_pos = $P10."pos"()
  # rx subrule "quantified_atom" subtype=capture negate=
    rx251_cur."!cursor_pos"(rx251_pos)
    $P10 = rx251_cur."quantified_atom"()
    unless $P10, rx251_fail
    rx251_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("GOAL")
    rx251_pos = $P10."pos"()
.annotate "line", 88
  # rx subrule "ws" subtype=method negate=
    rx251_cur."!cursor_pos"(rx251_pos)
    $P10 = rx251_cur."ws"()
    unless $P10, rx251_fail
    rx251_pos = $P10."pos"()
  # rx subrule "quantified_atom" subtype=capture negate=
    rx251_cur."!cursor_pos"(rx251_pos)
    $P10 = rx251_cur."quantified_atom"()
    unless $P10, rx251_fail
    rx251_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx251_pos = $P10."pos"()
.annotate "line", 85
  # rx pass
    rx251_cur."!cursor_pass"(rx251_pos, "metachar:sym<~>")
    rx251_cur."!cursor_debug"("PASS  ", "metachar:sym<~>", " at pos=", rx251_pos)
    .return (rx251_cur)
  rx251_fail:
.annotate "line", 3
    (rx251_rep, rx251_pos, $I10, $P10) = rx251_cur."!mark_fail"(0)
    lt rx251_pos, -1, rx251_done
    eq rx251_pos, -1, rx251_fail
    jump $I10
  rx251_done:
    rx251_cur."!cursor_fail"()
    rx251_cur."!cursor_debug"("FAIL  ", "metachar:sym<~>")
    .return (rx251_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<~>"  :subid("82_1258897726.59476") :method
.annotate "line", 3
    $P253 = self."!PREFIX__!subrule"("", "~")
    new $P254, "ResizablePMCArray"
    push $P254, $P253
    .return ($P254)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<{*}>"  :subid("83_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx257_tgt
    .local int rx257_pos
    .local int rx257_off
    .local int rx257_eos
    .local int rx257_rep
    .local pmc rx257_cur
    (rx257_cur, rx257_pos, rx257_tgt, $I10) = self."!cursor_start"()
    rx257_cur."!cursor_debug"("START ", "metachar:sym<{*}>")
    rx257_cur."!cursor_caparray"("key")
    .lex unicode:"$\x{a2}", rx257_cur
    .local pmc match
    .lex "$/", match
    length rx257_eos, rx257_tgt
    set rx257_off, 0
    lt $I10, 2, rx257_start
    sub rx257_off, $I10, 1
    substr rx257_tgt, rx257_tgt, rx257_off
  rx257_start:
.annotate "line", 92
  # rx subcapture "sym"
    set_addr $I10, rxcap_260_fail
    rx257_cur."!mark_push"(0, rx257_pos, $I10)
  # rx literal  "{*}"
    add $I11, rx257_pos, 3
    gt $I11, rx257_eos, rx257_fail
    sub $I11, rx257_pos, rx257_off
    substr $S10, rx257_tgt, $I11, 3
    ne $S10, "{*}", rx257_fail
    add rx257_pos, 3
    set_addr $I10, rxcap_260_fail
    ($I12, $I11) = rx257_cur."!mark_peek"($I10)
    rx257_cur."!cursor_pos"($I11)
    ($P10) = rx257_cur."!cursor_start"()
    $P10."!cursor_pass"(rx257_pos, "")
    rx257_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_260_done
  rxcap_260_fail:
    goto rx257_fail
  rxcap_260_done:
.annotate "line", 93
  # rx rxquantr261 ** 0..1
    set_addr $I271, rxquantr261_done
    rx257_cur."!mark_push"(0, rx257_pos, $I271)
  rxquantr261_loop:
  # rx rxquantr262 ** 0..*
    set_addr $I263, rxquantr262_done
    rx257_cur."!mark_push"(0, rx257_pos, $I263)
  rxquantr262_loop:
  # rx enumcharlist negate=0 
    ge rx257_pos, rx257_eos, rx257_fail
    sub $I10, rx257_pos, rx257_off
    substr $S10, rx257_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx257_fail
    inc rx257_pos
    (rx257_rep) = rx257_cur."!mark_commit"($I263)
    rx257_cur."!mark_push"(rx257_rep, rx257_pos, $I263)
    goto rxquantr262_loop
  rxquantr262_done:
  # rx literal  "#= "
    add $I11, rx257_pos, 3
    gt $I11, rx257_eos, rx257_fail
    sub $I11, rx257_pos, rx257_off
    substr $S10, rx257_tgt, $I11, 3
    ne $S10, "#= ", rx257_fail
    add rx257_pos, 3
  # rx rxquantr264 ** 0..*
    set_addr $I265, rxquantr264_done
    rx257_cur."!mark_push"(0, rx257_pos, $I265)
  rxquantr264_loop:
  # rx enumcharlist negate=0 
    ge rx257_pos, rx257_eos, rx257_fail
    sub $I10, rx257_pos, rx257_off
    substr $S10, rx257_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx257_fail
    inc rx257_pos
    (rx257_rep) = rx257_cur."!mark_commit"($I265)
    rx257_cur."!mark_push"(rx257_rep, rx257_pos, $I265)
    goto rxquantr264_loop
  rxquantr264_done:
  # rx subcapture "key"
    set_addr $I10, rxcap_270_fail
    rx257_cur."!mark_push"(0, rx257_pos, $I10)
  # rx charclass_q S r 1..-1
    sub $I10, rx257_pos, rx257_off
    find_cclass $I11, 32, rx257_tgt, $I10, rx257_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx257_fail
    add rx257_pos, rx257_off, $I11
  # rx rxquantr266 ** 0..*
    set_addr $I269, rxquantr266_done
    rx257_cur."!mark_push"(0, rx257_pos, $I269)
  rxquantr266_loop:
  # rx rxquantr267 ** 1..*
    set_addr $I268, rxquantr267_done
    rx257_cur."!mark_push"(0, -1, $I268)
  rxquantr267_loop:
  # rx enumcharlist negate=0 
    ge rx257_pos, rx257_eos, rx257_fail
    sub $I10, rx257_pos, rx257_off
    substr $S10, rx257_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx257_fail
    inc rx257_pos
    (rx257_rep) = rx257_cur."!mark_commit"($I268)
    rx257_cur."!mark_push"(rx257_rep, rx257_pos, $I268)
    goto rxquantr267_loop
  rxquantr267_done:
  # rx charclass_q S r 1..-1
    sub $I10, rx257_pos, rx257_off
    find_cclass $I11, 32, rx257_tgt, $I10, rx257_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx257_fail
    add rx257_pos, rx257_off, $I11
    (rx257_rep) = rx257_cur."!mark_commit"($I269)
    rx257_cur."!mark_push"(rx257_rep, rx257_pos, $I269)
    goto rxquantr266_loop
  rxquantr266_done:
    set_addr $I10, rxcap_270_fail
    ($I12, $I11) = rx257_cur."!mark_peek"($I10)
    rx257_cur."!cursor_pos"($I11)
    ($P10) = rx257_cur."!cursor_start"()
    $P10."!cursor_pass"(rx257_pos, "")
    rx257_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("key")
    goto rxcap_270_done
  rxcap_270_fail:
    goto rx257_fail
  rxcap_270_done:
    (rx257_rep) = rx257_cur."!mark_commit"($I271)
  rxquantr261_done:
.annotate "line", 91
  # rx pass
    rx257_cur."!cursor_pass"(rx257_pos, "metachar:sym<{*}>")
    rx257_cur."!cursor_debug"("PASS  ", "metachar:sym<{*}>", " at pos=", rx257_pos)
    .return (rx257_cur)
  rx257_fail:
.annotate "line", 3
    (rx257_rep, rx257_pos, $I10, $P10) = rx257_cur."!mark_fail"(0)
    lt rx257_pos, -1, rx257_done
    eq rx257_pos, -1, rx257_fail
    jump $I10
  rx257_done:
    rx257_cur."!cursor_fail"()
    rx257_cur."!cursor_debug"("FAIL  ", "metachar:sym<{*}>")
    .return (rx257_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<{*}>"  :subid("84_1258897726.59476") :method
.annotate "line", 3
    new $P259, "ResizablePMCArray"
    push $P259, "{*}"
    .return ($P259)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<assert>"  :subid("85_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx273_tgt
    .local int rx273_pos
    .local int rx273_off
    .local int rx273_eos
    .local int rx273_rep
    .local pmc rx273_cur
    (rx273_cur, rx273_pos, rx273_tgt, $I10) = self."!cursor_start"()
    rx273_cur."!cursor_debug"("START ", "metachar:sym<assert>")
    .lex unicode:"$\x{a2}", rx273_cur
    .local pmc match
    .lex "$/", match
    length rx273_eos, rx273_tgt
    set rx273_off, 0
    lt $I10, 2, rx273_start
    sub rx273_off, $I10, 1
    substr rx273_tgt, rx273_tgt, rx273_off
  rx273_start:
.annotate "line", 96
  # rx literal  "<"
    add $I11, rx273_pos, 1
    gt $I11, rx273_eos, rx273_fail
    sub $I11, rx273_pos, rx273_off
    substr $S10, rx273_tgt, $I11, 1
    ne $S10, "<", rx273_fail
    add rx273_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx273_cur."!cursor_pos"(rx273_pos)
    $P10 = rx273_cur."assertion"()
    unless $P10, rx273_fail
    rx273_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx273_pos = $P10."pos"()
  alt277_0:
.annotate "line", 97
    set_addr $I10, alt277_1
    rx273_cur."!mark_push"(0, rx273_pos, $I10)
  # rx literal  ">"
    add $I11, rx273_pos, 1
    gt $I11, rx273_eos, rx273_fail
    sub $I11, rx273_pos, rx273_off
    substr $S10, rx273_tgt, $I11, 1
    ne $S10, ">", rx273_fail
    add rx273_pos, 1
    goto alt277_end
  alt277_1:
  # rx subrule "panic" subtype=method negate=
    rx273_cur."!cursor_pos"(rx273_pos)
    $P10 = rx273_cur."panic"("regex assertion not terminated by angle bracket")
    unless $P10, rx273_fail
    rx273_pos = $P10."pos"()
  alt277_end:
.annotate "line", 95
  # rx pass
    rx273_cur."!cursor_pass"(rx273_pos, "metachar:sym<assert>")
    rx273_cur."!cursor_debug"("PASS  ", "metachar:sym<assert>", " at pos=", rx273_pos)
    .return (rx273_cur)
  rx273_fail:
.annotate "line", 3
    (rx273_rep, rx273_pos, $I10, $P10) = rx273_cur."!mark_fail"(0)
    lt rx273_pos, -1, rx273_done
    eq rx273_pos, -1, rx273_fail
    jump $I10
  rx273_done:
    rx273_cur."!cursor_fail"()
    rx273_cur."!cursor_debug"("FAIL  ", "metachar:sym<assert>")
    .return (rx273_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<assert>"  :subid("86_1258897726.59476") :method
.annotate "line", 3
    $P275 = self."!PREFIX__!subrule"("assertion", "<")
    new $P276, "ResizablePMCArray"
    push $P276, $P275
    .return ($P276)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<var>"  :subid("87_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx279_tgt
    .local int rx279_pos
    .local int rx279_off
    .local int rx279_eos
    .local int rx279_rep
    .local pmc rx279_cur
    (rx279_cur, rx279_pos, rx279_tgt, $I10) = self."!cursor_start"()
    rx279_cur."!cursor_debug"("START ", "metachar:sym<var>")
    rx279_cur."!cursor_caparray"("quantified_atom")
    .lex unicode:"$\x{a2}", rx279_cur
    .local pmc match
    .lex "$/", match
    length rx279_eos, rx279_tgt
    set rx279_off, 0
    lt $I10, 2, rx279_start
    sub rx279_off, $I10, 1
    substr rx279_tgt, rx279_tgt, rx279_off
  rx279_start:
  alt282_0:
.annotate "line", 101
    set_addr $I10, alt282_1
    rx279_cur."!mark_push"(0, rx279_pos, $I10)
.annotate "line", 102
  # rx literal  "$<"
    add $I11, rx279_pos, 2
    gt $I11, rx279_eos, rx279_fail
    sub $I11, rx279_pos, rx279_off
    substr $S10, rx279_tgt, $I11, 2
    ne $S10, "$<", rx279_fail
    add rx279_pos, 2
  # rx subcapture "name"
    set_addr $I10, rxcap_285_fail
    rx279_cur."!mark_push"(0, rx279_pos, $I10)
  # rx rxquantr283 ** 1..*
    set_addr $I284, rxquantr283_done
    rx279_cur."!mark_push"(0, -1, $I284)
  rxquantr283_loop:
  # rx enumcharlist negate=1 
    ge rx279_pos, rx279_eos, rx279_fail
    sub $I10, rx279_pos, rx279_off
    substr $S10, rx279_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx279_fail
    inc rx279_pos
    (rx279_rep) = rx279_cur."!mark_commit"($I284)
    rx279_cur."!mark_push"(rx279_rep, rx279_pos, $I284)
    goto rxquantr283_loop
  rxquantr283_done:
    set_addr $I10, rxcap_285_fail
    ($I12, $I11) = rx279_cur."!mark_peek"($I10)
    rx279_cur."!cursor_pos"($I11)
    ($P10) = rx279_cur."!cursor_start"()
    $P10."!cursor_pass"(rx279_pos, "")
    rx279_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_285_done
  rxcap_285_fail:
    goto rx279_fail
  rxcap_285_done:
  # rx literal  ">"
    add $I11, rx279_pos, 1
    gt $I11, rx279_eos, rx279_fail
    sub $I11, rx279_pos, rx279_off
    substr $S10, rx279_tgt, $I11, 1
    ne $S10, ">", rx279_fail
    add rx279_pos, 1
    goto alt282_end
  alt282_1:
.annotate "line", 103
  # rx literal  "$"
    add $I11, rx279_pos, 1
    gt $I11, rx279_eos, rx279_fail
    sub $I11, rx279_pos, rx279_off
    substr $S10, rx279_tgt, $I11, 1
    ne $S10, "$", rx279_fail
    add rx279_pos, 1
  # rx subcapture "pos"
    set_addr $I10, rxcap_286_fail
    rx279_cur."!mark_push"(0, rx279_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx279_pos, rx279_off
    find_not_cclass $I11, 8, rx279_tgt, $I10, rx279_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx279_fail
    add rx279_pos, rx279_off, $I11
    set_addr $I10, rxcap_286_fail
    ($I12, $I11) = rx279_cur."!mark_peek"($I10)
    rx279_cur."!cursor_pos"($I11)
    ($P10) = rx279_cur."!cursor_start"()
    $P10."!cursor_pass"(rx279_pos, "")
    rx279_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pos")
    goto rxcap_286_done
  rxcap_286_fail:
    goto rx279_fail
  rxcap_286_done:
  alt282_end:
.annotate "line", 106
  # rx rxquantr287 ** 0..1
    set_addr $I288, rxquantr287_done
    rx279_cur."!mark_push"(0, rx279_pos, $I288)
  rxquantr287_loop:
  # rx subrule "ws" subtype=method negate=
    rx279_cur."!cursor_pos"(rx279_pos)
    $P10 = rx279_cur."ws"()
    unless $P10, rx279_fail
    rx279_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx279_pos, 1
    gt $I11, rx279_eos, rx279_fail
    sub $I11, rx279_pos, rx279_off
    substr $S10, rx279_tgt, $I11, 1
    ne $S10, "=", rx279_fail
    add rx279_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx279_cur."!cursor_pos"(rx279_pos)
    $P10 = rx279_cur."ws"()
    unless $P10, rx279_fail
    rx279_pos = $P10."pos"()
  # rx subrule "quantified_atom" subtype=capture negate=
    rx279_cur."!cursor_pos"(rx279_pos)
    $P10 = rx279_cur."quantified_atom"()
    unless $P10, rx279_fail
    rx279_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantified_atom")
    rx279_pos = $P10."pos"()
    (rx279_rep) = rx279_cur."!mark_commit"($I288)
  rxquantr287_done:
.annotate "line", 100
  # rx pass
    rx279_cur."!cursor_pass"(rx279_pos, "metachar:sym<var>")
    rx279_cur."!cursor_debug"("PASS  ", "metachar:sym<var>", " at pos=", rx279_pos)
    .return (rx279_cur)
  rx279_fail:
.annotate "line", 3
    (rx279_rep, rx279_pos, $I10, $P10) = rx279_cur."!mark_fail"(0)
    lt rx279_pos, -1, rx279_done
    eq rx279_pos, -1, rx279_fail
    jump $I10
  rx279_done:
    rx279_cur."!cursor_fail"()
    rx279_cur."!cursor_debug"("FAIL  ", "metachar:sym<var>")
    .return (rx279_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<var>"  :subid("88_1258897726.59476") :method
.annotate "line", 3
    new $P281, "ResizablePMCArray"
    push $P281, "$"
    push $P281, "$<"
    .return ($P281)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<PIR>"  :subid("89_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx290_tgt
    .local int rx290_pos
    .local int rx290_off
    .local int rx290_eos
    .local int rx290_rep
    .local pmc rx290_cur
    (rx290_cur, rx290_pos, rx290_tgt, $I10) = self."!cursor_start"()
    rx290_cur."!cursor_debug"("START ", "metachar:sym<PIR>")
    .lex unicode:"$\x{a2}", rx290_cur
    .local pmc match
    .lex "$/", match
    length rx290_eos, rx290_tgt
    set rx290_off, 0
    lt $I10, 2, rx290_start
    sub rx290_off, $I10, 1
    substr rx290_tgt, rx290_tgt, rx290_off
  rx290_start:
.annotate "line", 110
  # rx literal  ":PIR{{"
    add $I11, rx290_pos, 6
    gt $I11, rx290_eos, rx290_fail
    sub $I11, rx290_pos, rx290_off
    substr $S10, rx290_tgt, $I11, 6
    ne $S10, ":PIR{{", rx290_fail
    add rx290_pos, 6
  # rx subcapture "pir"
    set_addr $I10, rxcap_295_fail
    rx290_cur."!mark_push"(0, rx290_pos, $I10)
  # rx rxquantf293 ** 0..*
    set_addr $I10, rxquantf293_loop
    rx290_cur."!mark_push"(0, rx290_pos, $I10)
    goto rxquantf293_done
  rxquantf293_loop:
  # rx charclass .
    ge rx290_pos, rx290_eos, rx290_fail
    inc rx290_pos
    set_addr $I10, rxquantf293_loop
    rx290_cur."!mark_push"($I294, rx290_pos, $I10)
  rxquantf293_done:
    set_addr $I10, rxcap_295_fail
    ($I12, $I11) = rx290_cur."!mark_peek"($I10)
    rx290_cur."!cursor_pos"($I11)
    ($P10) = rx290_cur."!cursor_start"()
    $P10."!cursor_pass"(rx290_pos, "")
    rx290_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pir")
    goto rxcap_295_done
  rxcap_295_fail:
    goto rx290_fail
  rxcap_295_done:
  # rx literal  "}}"
    add $I11, rx290_pos, 2
    gt $I11, rx290_eos, rx290_fail
    sub $I11, rx290_pos, rx290_off
    substr $S10, rx290_tgt, $I11, 2
    ne $S10, "}}", rx290_fail
    add rx290_pos, 2
.annotate "line", 109
  # rx pass
    rx290_cur."!cursor_pass"(rx290_pos, "metachar:sym<PIR>")
    rx290_cur."!cursor_debug"("PASS  ", "metachar:sym<PIR>", " at pos=", rx290_pos)
    .return (rx290_cur)
  rx290_fail:
.annotate "line", 3
    (rx290_rep, rx290_pos, $I10, $P10) = rx290_cur."!mark_fail"(0)
    lt rx290_pos, -1, rx290_done
    eq rx290_pos, -1, rx290_fail
    jump $I10
  rx290_done:
    rx290_cur."!cursor_fail"()
    rx290_cur."!cursor_debug"("FAIL  ", "metachar:sym<PIR>")
    .return (rx290_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<PIR>"  :subid("90_1258897726.59476") :method
.annotate "line", 3
    new $P292, "ResizablePMCArray"
    push $P292, ":PIR{{"
    .return ($P292)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash"  :subid("91_1258897726.59476") :method
.annotate "line", 113
    $P297 = self."!protoregex"("backslash")
    .return ($P297)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash"  :subid("92_1258897726.59476") :method
.annotate "line", 113
    $P299 = self."!PREFIX__!protoregex"("backslash")
    .return ($P299)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<w>"  :subid("93_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx301_tgt
    .local int rx301_pos
    .local int rx301_off
    .local int rx301_eos
    .local int rx301_rep
    .local pmc rx301_cur
    (rx301_cur, rx301_pos, rx301_tgt, $I10) = self."!cursor_start"()
    rx301_cur."!cursor_debug"("START ", "backslash:sym<w>")
    .lex unicode:"$\x{a2}", rx301_cur
    .local pmc match
    .lex "$/", match
    length rx301_eos, rx301_tgt
    set rx301_off, 0
    lt $I10, 2, rx301_start
    sub rx301_off, $I10, 1
    substr rx301_tgt, rx301_tgt, rx301_off
  rx301_start:
.annotate "line", 114
  # rx subcapture "sym"
    set_addr $I10, rxcap_304_fail
    rx301_cur."!mark_push"(0, rx301_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx301_pos, rx301_eos, rx301_fail
    sub $I10, rx301_pos, rx301_off
    substr $S10, rx301_tgt, $I10, 1
    index $I11, "dswnDSWN", $S10
    lt $I11, 0, rx301_fail
    inc rx301_pos
    set_addr $I10, rxcap_304_fail
    ($I12, $I11) = rx301_cur."!mark_peek"($I10)
    rx301_cur."!cursor_pos"($I11)
    ($P10) = rx301_cur."!cursor_start"()
    $P10."!cursor_pass"(rx301_pos, "")
    rx301_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_304_done
  rxcap_304_fail:
    goto rx301_fail
  rxcap_304_done:
  # rx pass
    rx301_cur."!cursor_pass"(rx301_pos, "backslash:sym<w>")
    rx301_cur."!cursor_debug"("PASS  ", "backslash:sym<w>", " at pos=", rx301_pos)
    .return (rx301_cur)
  rx301_fail:
.annotate "line", 3
    (rx301_rep, rx301_pos, $I10, $P10) = rx301_cur."!mark_fail"(0)
    lt rx301_pos, -1, rx301_done
    eq rx301_pos, -1, rx301_fail
    jump $I10
  rx301_done:
    rx301_cur."!cursor_fail"()
    rx301_cur."!cursor_debug"("FAIL  ", "backslash:sym<w>")
    .return (rx301_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<w>"  :subid("94_1258897726.59476") :method
.annotate "line", 3
    new $P303, "ResizablePMCArray"
    push $P303, "N"
    push $P303, "W"
    push $P303, "S"
    push $P303, "D"
    push $P303, "n"
    push $P303, "w"
    push $P303, "s"
    push $P303, "d"
    .return ($P303)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<b>"  :subid("95_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx306_tgt
    .local int rx306_pos
    .local int rx306_off
    .local int rx306_eos
    .local int rx306_rep
    .local pmc rx306_cur
    (rx306_cur, rx306_pos, rx306_tgt, $I10) = self."!cursor_start"()
    rx306_cur."!cursor_debug"("START ", "backslash:sym<b>")
    .lex unicode:"$\x{a2}", rx306_cur
    .local pmc match
    .lex "$/", match
    length rx306_eos, rx306_tgt
    set rx306_off, 0
    lt $I10, 2, rx306_start
    sub rx306_off, $I10, 1
    substr rx306_tgt, rx306_tgt, rx306_off
  rx306_start:
.annotate "line", 115
  # rx subcapture "sym"
    set_addr $I10, rxcap_309_fail
    rx306_cur."!mark_push"(0, rx306_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx306_pos, rx306_eos, rx306_fail
    sub $I10, rx306_pos, rx306_off
    substr $S10, rx306_tgt, $I10, 1
    index $I11, "bB", $S10
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
    rx306_cur."!cursor_pass"(rx306_pos, "backslash:sym<b>")
    rx306_cur."!cursor_debug"("PASS  ", "backslash:sym<b>", " at pos=", rx306_pos)
    .return (rx306_cur)
  rx306_fail:
.annotate "line", 3
    (rx306_rep, rx306_pos, $I10, $P10) = rx306_cur."!mark_fail"(0)
    lt rx306_pos, -1, rx306_done
    eq rx306_pos, -1, rx306_fail
    jump $I10
  rx306_done:
    rx306_cur."!cursor_fail"()
    rx306_cur."!cursor_debug"("FAIL  ", "backslash:sym<b>")
    .return (rx306_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<b>"  :subid("96_1258897726.59476") :method
.annotate "line", 3
    new $P308, "ResizablePMCArray"
    push $P308, "B"
    push $P308, "b"
    .return ($P308)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<e>"  :subid("97_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx311_tgt
    .local int rx311_pos
    .local int rx311_off
    .local int rx311_eos
    .local int rx311_rep
    .local pmc rx311_cur
    (rx311_cur, rx311_pos, rx311_tgt, $I10) = self."!cursor_start"()
    rx311_cur."!cursor_debug"("START ", "backslash:sym<e>")
    .lex unicode:"$\x{a2}", rx311_cur
    .local pmc match
    .lex "$/", match
    length rx311_eos, rx311_tgt
    set rx311_off, 0
    lt $I10, 2, rx311_start
    sub rx311_off, $I10, 1
    substr rx311_tgt, rx311_tgt, rx311_off
  rx311_start:
.annotate "line", 116
  # rx subcapture "sym"
    set_addr $I10, rxcap_314_fail
    rx311_cur."!mark_push"(0, rx311_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx311_pos, rx311_eos, rx311_fail
    sub $I10, rx311_pos, rx311_off
    substr $S10, rx311_tgt, $I10, 1
    index $I11, "eE", $S10
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
    rx311_cur."!cursor_pass"(rx311_pos, "backslash:sym<e>")
    rx311_cur."!cursor_debug"("PASS  ", "backslash:sym<e>", " at pos=", rx311_pos)
    .return (rx311_cur)
  rx311_fail:
.annotate "line", 3
    (rx311_rep, rx311_pos, $I10, $P10) = rx311_cur."!mark_fail"(0)
    lt rx311_pos, -1, rx311_done
    eq rx311_pos, -1, rx311_fail
    jump $I10
  rx311_done:
    rx311_cur."!cursor_fail"()
    rx311_cur."!cursor_debug"("FAIL  ", "backslash:sym<e>")
    .return (rx311_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<e>"  :subid("98_1258897726.59476") :method
.annotate "line", 3
    new $P313, "ResizablePMCArray"
    push $P313, "E"
    push $P313, "e"
    .return ($P313)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<f>"  :subid("99_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx316_tgt
    .local int rx316_pos
    .local int rx316_off
    .local int rx316_eos
    .local int rx316_rep
    .local pmc rx316_cur
    (rx316_cur, rx316_pos, rx316_tgt, $I10) = self."!cursor_start"()
    rx316_cur."!cursor_debug"("START ", "backslash:sym<f>")
    .lex unicode:"$\x{a2}", rx316_cur
    .local pmc match
    .lex "$/", match
    length rx316_eos, rx316_tgt
    set rx316_off, 0
    lt $I10, 2, rx316_start
    sub rx316_off, $I10, 1
    substr rx316_tgt, rx316_tgt, rx316_off
  rx316_start:
.annotate "line", 117
  # rx subcapture "sym"
    set_addr $I10, rxcap_319_fail
    rx316_cur."!mark_push"(0, rx316_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx316_pos, rx316_eos, rx316_fail
    sub $I10, rx316_pos, rx316_off
    substr $S10, rx316_tgt, $I10, 1
    index $I11, "fF", $S10
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
    rx316_cur."!cursor_pass"(rx316_pos, "backslash:sym<f>")
    rx316_cur."!cursor_debug"("PASS  ", "backslash:sym<f>", " at pos=", rx316_pos)
    .return (rx316_cur)
  rx316_fail:
.annotate "line", 3
    (rx316_rep, rx316_pos, $I10, $P10) = rx316_cur."!mark_fail"(0)
    lt rx316_pos, -1, rx316_done
    eq rx316_pos, -1, rx316_fail
    jump $I10
  rx316_done:
    rx316_cur."!cursor_fail"()
    rx316_cur."!cursor_debug"("FAIL  ", "backslash:sym<f>")
    .return (rx316_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<f>"  :subid("100_1258897726.59476") :method
.annotate "line", 3
    new $P318, "ResizablePMCArray"
    push $P318, "F"
    push $P318, "f"
    .return ($P318)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<h>"  :subid("101_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx321_tgt
    .local int rx321_pos
    .local int rx321_off
    .local int rx321_eos
    .local int rx321_rep
    .local pmc rx321_cur
    (rx321_cur, rx321_pos, rx321_tgt, $I10) = self."!cursor_start"()
    rx321_cur."!cursor_debug"("START ", "backslash:sym<h>")
    .lex unicode:"$\x{a2}", rx321_cur
    .local pmc match
    .lex "$/", match
    length rx321_eos, rx321_tgt
    set rx321_off, 0
    lt $I10, 2, rx321_start
    sub rx321_off, $I10, 1
    substr rx321_tgt, rx321_tgt, rx321_off
  rx321_start:
.annotate "line", 118
  # rx subcapture "sym"
    set_addr $I10, rxcap_324_fail
    rx321_cur."!mark_push"(0, rx321_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx321_pos, rx321_eos, rx321_fail
    sub $I10, rx321_pos, rx321_off
    substr $S10, rx321_tgt, $I10, 1
    index $I11, "hH", $S10
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
    rx321_cur."!cursor_pass"(rx321_pos, "backslash:sym<h>")
    rx321_cur."!cursor_debug"("PASS  ", "backslash:sym<h>", " at pos=", rx321_pos)
    .return (rx321_cur)
  rx321_fail:
.annotate "line", 3
    (rx321_rep, rx321_pos, $I10, $P10) = rx321_cur."!mark_fail"(0)
    lt rx321_pos, -1, rx321_done
    eq rx321_pos, -1, rx321_fail
    jump $I10
  rx321_done:
    rx321_cur."!cursor_fail"()
    rx321_cur."!cursor_debug"("FAIL  ", "backslash:sym<h>")
    .return (rx321_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<h>"  :subid("102_1258897726.59476") :method
.annotate "line", 3
    new $P323, "ResizablePMCArray"
    push $P323, "H"
    push $P323, "h"
    .return ($P323)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<r>"  :subid("103_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx326_tgt
    .local int rx326_pos
    .local int rx326_off
    .local int rx326_eos
    .local int rx326_rep
    .local pmc rx326_cur
    (rx326_cur, rx326_pos, rx326_tgt, $I10) = self."!cursor_start"()
    rx326_cur."!cursor_debug"("START ", "backslash:sym<r>")
    .lex unicode:"$\x{a2}", rx326_cur
    .local pmc match
    .lex "$/", match
    length rx326_eos, rx326_tgt
    set rx326_off, 0
    lt $I10, 2, rx326_start
    sub rx326_off, $I10, 1
    substr rx326_tgt, rx326_tgt, rx326_off
  rx326_start:
.annotate "line", 119
  # rx subcapture "sym"
    set_addr $I10, rxcap_329_fail
    rx326_cur."!mark_push"(0, rx326_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx326_pos, rx326_eos, rx326_fail
    sub $I10, rx326_pos, rx326_off
    substr $S10, rx326_tgt, $I10, 1
    index $I11, "rR", $S10
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
    rx326_cur."!cursor_pass"(rx326_pos, "backslash:sym<r>")
    rx326_cur."!cursor_debug"("PASS  ", "backslash:sym<r>", " at pos=", rx326_pos)
    .return (rx326_cur)
  rx326_fail:
.annotate "line", 3
    (rx326_rep, rx326_pos, $I10, $P10) = rx326_cur."!mark_fail"(0)
    lt rx326_pos, -1, rx326_done
    eq rx326_pos, -1, rx326_fail
    jump $I10
  rx326_done:
    rx326_cur."!cursor_fail"()
    rx326_cur."!cursor_debug"("FAIL  ", "backslash:sym<r>")
    .return (rx326_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<r>"  :subid("104_1258897726.59476") :method
.annotate "line", 3
    new $P328, "ResizablePMCArray"
    push $P328, "R"
    push $P328, "r"
    .return ($P328)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<t>"  :subid("105_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx331_tgt
    .local int rx331_pos
    .local int rx331_off
    .local int rx331_eos
    .local int rx331_rep
    .local pmc rx331_cur
    (rx331_cur, rx331_pos, rx331_tgt, $I10) = self."!cursor_start"()
    rx331_cur."!cursor_debug"("START ", "backslash:sym<t>")
    .lex unicode:"$\x{a2}", rx331_cur
    .local pmc match
    .lex "$/", match
    length rx331_eos, rx331_tgt
    set rx331_off, 0
    lt $I10, 2, rx331_start
    sub rx331_off, $I10, 1
    substr rx331_tgt, rx331_tgt, rx331_off
  rx331_start:
.annotate "line", 120
  # rx subcapture "sym"
    set_addr $I10, rxcap_334_fail
    rx331_cur."!mark_push"(0, rx331_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx331_pos, rx331_eos, rx331_fail
    sub $I10, rx331_pos, rx331_off
    substr $S10, rx331_tgt, $I10, 1
    index $I11, "tT", $S10
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
    rx331_cur."!cursor_pass"(rx331_pos, "backslash:sym<t>")
    rx331_cur."!cursor_debug"("PASS  ", "backslash:sym<t>", " at pos=", rx331_pos)
    .return (rx331_cur)
  rx331_fail:
.annotate "line", 3
    (rx331_rep, rx331_pos, $I10, $P10) = rx331_cur."!mark_fail"(0)
    lt rx331_pos, -1, rx331_done
    eq rx331_pos, -1, rx331_fail
    jump $I10
  rx331_done:
    rx331_cur."!cursor_fail"()
    rx331_cur."!cursor_debug"("FAIL  ", "backslash:sym<t>")
    .return (rx331_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<t>"  :subid("106_1258897726.59476") :method
.annotate "line", 3
    new $P333, "ResizablePMCArray"
    push $P333, "T"
    push $P333, "t"
    .return ($P333)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<v>"  :subid("107_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx336_tgt
    .local int rx336_pos
    .local int rx336_off
    .local int rx336_eos
    .local int rx336_rep
    .local pmc rx336_cur
    (rx336_cur, rx336_pos, rx336_tgt, $I10) = self."!cursor_start"()
    rx336_cur."!cursor_debug"("START ", "backslash:sym<v>")
    .lex unicode:"$\x{a2}", rx336_cur
    .local pmc match
    .lex "$/", match
    length rx336_eos, rx336_tgt
    set rx336_off, 0
    lt $I10, 2, rx336_start
    sub rx336_off, $I10, 1
    substr rx336_tgt, rx336_tgt, rx336_off
  rx336_start:
.annotate "line", 121
  # rx subcapture "sym"
    set_addr $I10, rxcap_339_fail
    rx336_cur."!mark_push"(0, rx336_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx336_pos, rx336_eos, rx336_fail
    sub $I10, rx336_pos, rx336_off
    substr $S10, rx336_tgt, $I10, 1
    index $I11, "vV", $S10
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
    rx336_cur."!cursor_pass"(rx336_pos, "backslash:sym<v>")
    rx336_cur."!cursor_debug"("PASS  ", "backslash:sym<v>", " at pos=", rx336_pos)
    .return (rx336_cur)
  rx336_fail:
.annotate "line", 3
    (rx336_rep, rx336_pos, $I10, $P10) = rx336_cur."!mark_fail"(0)
    lt rx336_pos, -1, rx336_done
    eq rx336_pos, -1, rx336_fail
    jump $I10
  rx336_done:
    rx336_cur."!cursor_fail"()
    rx336_cur."!cursor_debug"("FAIL  ", "backslash:sym<v>")
    .return (rx336_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<v>"  :subid("108_1258897726.59476") :method
.annotate "line", 3
    new $P338, "ResizablePMCArray"
    push $P338, "V"
    push $P338, "v"
    .return ($P338)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<c>"  :subid("109_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx341_tgt
    .local int rx341_pos
    .local int rx341_off
    .local int rx341_eos
    .local int rx341_rep
    .local pmc rx341_cur
    (rx341_cur, rx341_pos, rx341_tgt, $I10) = self."!cursor_start"()
    rx341_cur."!cursor_debug"("START ", "backslash:sym<c>")
    .lex unicode:"$\x{a2}", rx341_cur
    .local pmc match
    .lex "$/", match
    length rx341_eos, rx341_tgt
    set rx341_off, 0
    lt $I10, 2, rx341_start
    sub rx341_off, $I10, 1
    substr rx341_tgt, rx341_tgt, rx341_off
  rx341_start:
.annotate "line", 122
  # rx subcapture "sym"
    set_addr $I10, rxcap_346_fail
    rx341_cur."!mark_push"(0, rx341_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx341_pos, rx341_eos, rx341_fail
    sub $I10, rx341_pos, rx341_off
    substr $S10, rx341_tgt, $I10, 1
    index $I11, "cC", $S10
    lt $I11, 0, rx341_fail
    inc rx341_pos
    set_addr $I10, rxcap_346_fail
    ($I12, $I11) = rx341_cur."!mark_peek"($I10)
    rx341_cur."!cursor_pos"($I11)
    ($P10) = rx341_cur."!cursor_start"()
    $P10."!cursor_pass"(rx341_pos, "")
    rx341_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_346_done
  rxcap_346_fail:
    goto rx341_fail
  rxcap_346_done:
  # rx subrule "charspec" subtype=capture negate=
    rx341_cur."!cursor_pos"(rx341_pos)
    $P10 = rx341_cur."charspec"()
    unless $P10, rx341_fail
    rx341_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charspec")
    rx341_pos = $P10."pos"()
  # rx pass
    rx341_cur."!cursor_pass"(rx341_pos, "backslash:sym<c>")
    rx341_cur."!cursor_debug"("PASS  ", "backslash:sym<c>", " at pos=", rx341_pos)
    .return (rx341_cur)
  rx341_fail:
.annotate "line", 3
    (rx341_rep, rx341_pos, $I10, $P10) = rx341_cur."!mark_fail"(0)
    lt rx341_pos, -1, rx341_done
    eq rx341_pos, -1, rx341_fail
    jump $I10
  rx341_done:
    rx341_cur."!cursor_fail"()
    rx341_cur."!cursor_debug"("FAIL  ", "backslash:sym<c>")
    .return (rx341_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<c>"  :subid("110_1258897726.59476") :method
.annotate "line", 3
    $P343 = self."!PREFIX__!subrule"("charspec", "C")
    $P344 = self."!PREFIX__!subrule"("charspec", "c")
    new $P345, "ResizablePMCArray"
    push $P345, $P343
    push $P345, $P344
    .return ($P345)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<o>"  :subid("111_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx348_tgt
    .local int rx348_pos
    .local int rx348_off
    .local int rx348_eos
    .local int rx348_rep
    .local pmc rx348_cur
    (rx348_cur, rx348_pos, rx348_tgt, $I10) = self."!cursor_start"()
    rx348_cur."!cursor_debug"("START ", "backslash:sym<o>")
    .lex unicode:"$\x{a2}", rx348_cur
    .local pmc match
    .lex "$/", match
    length rx348_eos, rx348_tgt
    set rx348_off, 0
    lt $I10, 2, rx348_start
    sub rx348_off, $I10, 1
    substr rx348_tgt, rx348_tgt, rx348_off
  rx348_start:
.annotate "line", 123
  # rx subcapture "sym"
    set_addr $I10, rxcap_355_fail
    rx348_cur."!mark_push"(0, rx348_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx348_pos, rx348_eos, rx348_fail
    sub $I10, rx348_pos, rx348_off
    substr $S10, rx348_tgt, $I10, 1
    index $I11, "oO", $S10
    lt $I11, 0, rx348_fail
    inc rx348_pos
    set_addr $I10, rxcap_355_fail
    ($I12, $I11) = rx348_cur."!mark_peek"($I10)
    rx348_cur."!cursor_pos"($I11)
    ($P10) = rx348_cur."!cursor_start"()
    $P10."!cursor_pass"(rx348_pos, "")
    rx348_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_355_done
  rxcap_355_fail:
    goto rx348_fail
  rxcap_355_done:
  alt356_0:
    set_addr $I10, alt356_1
    rx348_cur."!mark_push"(0, rx348_pos, $I10)
  # rx subrule "octint" subtype=capture negate=
    rx348_cur."!cursor_pos"(rx348_pos)
    $P10 = rx348_cur."octint"()
    unless $P10, rx348_fail
    rx348_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octint")
    rx348_pos = $P10."pos"()
    goto alt356_end
  alt356_1:
  # rx literal  "["
    add $I11, rx348_pos, 1
    gt $I11, rx348_eos, rx348_fail
    sub $I11, rx348_pos, rx348_off
    substr $S10, rx348_tgt, $I11, 1
    ne $S10, "[", rx348_fail
    add rx348_pos, 1
  # rx subrule "octints" subtype=capture negate=
    rx348_cur."!cursor_pos"(rx348_pos)
    $P10 = rx348_cur."octints"()
    unless $P10, rx348_fail
    rx348_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octints")
    rx348_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx348_pos, 1
    gt $I11, rx348_eos, rx348_fail
    sub $I11, rx348_pos, rx348_off
    substr $S10, rx348_tgt, $I11, 1
    ne $S10, "]", rx348_fail
    add rx348_pos, 1
  alt356_end:
  # rx pass
    rx348_cur."!cursor_pass"(rx348_pos, "backslash:sym<o>")
    rx348_cur."!cursor_debug"("PASS  ", "backslash:sym<o>", " at pos=", rx348_pos)
    .return (rx348_cur)
  rx348_fail:
.annotate "line", 3
    (rx348_rep, rx348_pos, $I10, $P10) = rx348_cur."!mark_fail"(0)
    lt rx348_pos, -1, rx348_done
    eq rx348_pos, -1, rx348_fail
    jump $I10
  rx348_done:
    rx348_cur."!cursor_fail"()
    rx348_cur."!cursor_debug"("FAIL  ", "backslash:sym<o>")
    .return (rx348_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<o>"  :subid("112_1258897726.59476") :method
.annotate "line", 3
    $P350 = self."!PREFIX__!subrule"("octints", "O[")
    $P351 = self."!PREFIX__!subrule"("octint", "O")
    $P352 = self."!PREFIX__!subrule"("octints", "o[")
    $P353 = self."!PREFIX__!subrule"("octint", "o")
    new $P354, "ResizablePMCArray"
    push $P354, $P350
    push $P354, $P351
    push $P354, $P352
    push $P354, $P353
    .return ($P354)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<x>"  :subid("113_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx358_tgt
    .local int rx358_pos
    .local int rx358_off
    .local int rx358_eos
    .local int rx358_rep
    .local pmc rx358_cur
    (rx358_cur, rx358_pos, rx358_tgt, $I10) = self."!cursor_start"()
    rx358_cur."!cursor_debug"("START ", "backslash:sym<x>")
    .lex unicode:"$\x{a2}", rx358_cur
    .local pmc match
    .lex "$/", match
    length rx358_eos, rx358_tgt
    set rx358_off, 0
    lt $I10, 2, rx358_start
    sub rx358_off, $I10, 1
    substr rx358_tgt, rx358_tgt, rx358_off
  rx358_start:
.annotate "line", 124
  # rx subcapture "sym"
    set_addr $I10, rxcap_365_fail
    rx358_cur."!mark_push"(0, rx358_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx358_pos, rx358_eos, rx358_fail
    sub $I10, rx358_pos, rx358_off
    substr $S10, rx358_tgt, $I10, 1
    index $I11, "xX", $S10
    lt $I11, 0, rx358_fail
    inc rx358_pos
    set_addr $I10, rxcap_365_fail
    ($I12, $I11) = rx358_cur."!mark_peek"($I10)
    rx358_cur."!cursor_pos"($I11)
    ($P10) = rx358_cur."!cursor_start"()
    $P10."!cursor_pass"(rx358_pos, "")
    rx358_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_365_done
  rxcap_365_fail:
    goto rx358_fail
  rxcap_365_done:
  alt366_0:
    set_addr $I10, alt366_1
    rx358_cur."!mark_push"(0, rx358_pos, $I10)
  # rx subrule "hexint" subtype=capture negate=
    rx358_cur."!cursor_pos"(rx358_pos)
    $P10 = rx358_cur."hexint"()
    unless $P10, rx358_fail
    rx358_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexint")
    rx358_pos = $P10."pos"()
    goto alt366_end
  alt366_1:
  # rx literal  "["
    add $I11, rx358_pos, 1
    gt $I11, rx358_eos, rx358_fail
    sub $I11, rx358_pos, rx358_off
    substr $S10, rx358_tgt, $I11, 1
    ne $S10, "[", rx358_fail
    add rx358_pos, 1
  # rx subrule "hexints" subtype=capture negate=
    rx358_cur."!cursor_pos"(rx358_pos)
    $P10 = rx358_cur."hexints"()
    unless $P10, rx358_fail
    rx358_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexints")
    rx358_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx358_pos, 1
    gt $I11, rx358_eos, rx358_fail
    sub $I11, rx358_pos, rx358_off
    substr $S10, rx358_tgt, $I11, 1
    ne $S10, "]", rx358_fail
    add rx358_pos, 1
  alt366_end:
  # rx pass
    rx358_cur."!cursor_pass"(rx358_pos, "backslash:sym<x>")
    rx358_cur."!cursor_debug"("PASS  ", "backslash:sym<x>", " at pos=", rx358_pos)
    .return (rx358_cur)
  rx358_fail:
.annotate "line", 3
    (rx358_rep, rx358_pos, $I10, $P10) = rx358_cur."!mark_fail"(0)
    lt rx358_pos, -1, rx358_done
    eq rx358_pos, -1, rx358_fail
    jump $I10
  rx358_done:
    rx358_cur."!cursor_fail"()
    rx358_cur."!cursor_debug"("FAIL  ", "backslash:sym<x>")
    .return (rx358_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<x>"  :subid("114_1258897726.59476") :method
.annotate "line", 3
    $P360 = self."!PREFIX__!subrule"("hexints", "X[")
    $P361 = self."!PREFIX__!subrule"("hexint", "X")
    $P362 = self."!PREFIX__!subrule"("hexints", "x[")
    $P363 = self."!PREFIX__!subrule"("hexint", "x")
    new $P364, "ResizablePMCArray"
    push $P364, $P360
    push $P364, $P361
    push $P364, $P362
    push $P364, $P363
    .return ($P364)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<A>"  :subid("115_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx368_tgt
    .local int rx368_pos
    .local int rx368_off
    .local int rx368_eos
    .local int rx368_rep
    .local pmc rx368_cur
    (rx368_cur, rx368_pos, rx368_tgt, $I10) = self."!cursor_start"()
    rx368_cur."!cursor_debug"("START ", "backslash:sym<A>")
    .lex unicode:"$\x{a2}", rx368_cur
    .local pmc match
    .lex "$/", match
    length rx368_eos, rx368_tgt
    set rx368_off, 0
    lt $I10, 2, rx368_start
    sub rx368_off, $I10, 1
    substr rx368_tgt, rx368_tgt, rx368_off
  rx368_start:
.annotate "line", 125
  # rx literal  "A"
    add $I11, rx368_pos, 1
    gt $I11, rx368_eos, rx368_fail
    sub $I11, rx368_pos, rx368_off
    substr $S10, rx368_tgt, $I11, 1
    ne $S10, "A", rx368_fail
    add rx368_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx368_cur."!cursor_pos"(rx368_pos)
    $P10 = rx368_cur."obs"("\\A as beginning-of-string matcher", "^")
    unless $P10, rx368_fail
    rx368_pos = $P10."pos"()
  # rx pass
    rx368_cur."!cursor_pass"(rx368_pos, "backslash:sym<A>")
    rx368_cur."!cursor_debug"("PASS  ", "backslash:sym<A>", " at pos=", rx368_pos)
    .return (rx368_cur)
  rx368_fail:
.annotate "line", 3
    (rx368_rep, rx368_pos, $I10, $P10) = rx368_cur."!mark_fail"(0)
    lt rx368_pos, -1, rx368_done
    eq rx368_pos, -1, rx368_fail
    jump $I10
  rx368_done:
    rx368_cur."!cursor_fail"()
    rx368_cur."!cursor_debug"("FAIL  ", "backslash:sym<A>")
    .return (rx368_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<A>"  :subid("116_1258897726.59476") :method
.annotate "line", 3
    $P370 = self."!PREFIX__!subrule"("", "A")
    new $P371, "ResizablePMCArray"
    push $P371, $P370
    .return ($P371)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<z>"  :subid("117_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx373_tgt
    .local int rx373_pos
    .local int rx373_off
    .local int rx373_eos
    .local int rx373_rep
    .local pmc rx373_cur
    (rx373_cur, rx373_pos, rx373_tgt, $I10) = self."!cursor_start"()
    rx373_cur."!cursor_debug"("START ", "backslash:sym<z>")
    .lex unicode:"$\x{a2}", rx373_cur
    .local pmc match
    .lex "$/", match
    length rx373_eos, rx373_tgt
    set rx373_off, 0
    lt $I10, 2, rx373_start
    sub rx373_off, $I10, 1
    substr rx373_tgt, rx373_tgt, rx373_off
  rx373_start:
.annotate "line", 126
  # rx literal  "z"
    add $I11, rx373_pos, 1
    gt $I11, rx373_eos, rx373_fail
    sub $I11, rx373_pos, rx373_off
    substr $S10, rx373_tgt, $I11, 1
    ne $S10, "z", rx373_fail
    add rx373_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx373_cur."!cursor_pos"(rx373_pos)
    $P10 = rx373_cur."obs"("\\z as end-of-string matcher", "$")
    unless $P10, rx373_fail
    rx373_pos = $P10."pos"()
  # rx pass
    rx373_cur."!cursor_pass"(rx373_pos, "backslash:sym<z>")
    rx373_cur."!cursor_debug"("PASS  ", "backslash:sym<z>", " at pos=", rx373_pos)
    .return (rx373_cur)
  rx373_fail:
.annotate "line", 3
    (rx373_rep, rx373_pos, $I10, $P10) = rx373_cur."!mark_fail"(0)
    lt rx373_pos, -1, rx373_done
    eq rx373_pos, -1, rx373_fail
    jump $I10
  rx373_done:
    rx373_cur."!cursor_fail"()
    rx373_cur."!cursor_debug"("FAIL  ", "backslash:sym<z>")
    .return (rx373_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<z>"  :subid("118_1258897726.59476") :method
.annotate "line", 3
    $P375 = self."!PREFIX__!subrule"("", "z")
    new $P376, "ResizablePMCArray"
    push $P376, $P375
    .return ($P376)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Z>"  :subid("119_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx378_tgt
    .local int rx378_pos
    .local int rx378_off
    .local int rx378_eos
    .local int rx378_rep
    .local pmc rx378_cur
    (rx378_cur, rx378_pos, rx378_tgt, $I10) = self."!cursor_start"()
    rx378_cur."!cursor_debug"("START ", "backslash:sym<Z>")
    .lex unicode:"$\x{a2}", rx378_cur
    .local pmc match
    .lex "$/", match
    length rx378_eos, rx378_tgt
    set rx378_off, 0
    lt $I10, 2, rx378_start
    sub rx378_off, $I10, 1
    substr rx378_tgt, rx378_tgt, rx378_off
  rx378_start:
.annotate "line", 127
  # rx literal  "Z"
    add $I11, rx378_pos, 1
    gt $I11, rx378_eos, rx378_fail
    sub $I11, rx378_pos, rx378_off
    substr $S10, rx378_tgt, $I11, 1
    ne $S10, "Z", rx378_fail
    add rx378_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx378_cur."!cursor_pos"(rx378_pos)
    $P10 = rx378_cur."obs"("\\Z as end-of-string matcher", "\\n?$")
    unless $P10, rx378_fail
    rx378_pos = $P10."pos"()
  # rx pass
    rx378_cur."!cursor_pass"(rx378_pos, "backslash:sym<Z>")
    rx378_cur."!cursor_debug"("PASS  ", "backslash:sym<Z>", " at pos=", rx378_pos)
    .return (rx378_cur)
  rx378_fail:
.annotate "line", 3
    (rx378_rep, rx378_pos, $I10, $P10) = rx378_cur."!mark_fail"(0)
    lt rx378_pos, -1, rx378_done
    eq rx378_pos, -1, rx378_fail
    jump $I10
  rx378_done:
    rx378_cur."!cursor_fail"()
    rx378_cur."!cursor_debug"("FAIL  ", "backslash:sym<Z>")
    .return (rx378_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<Z>"  :subid("120_1258897726.59476") :method
.annotate "line", 3
    $P380 = self."!PREFIX__!subrule"("", "Z")
    new $P381, "ResizablePMCArray"
    push $P381, $P380
    .return ($P381)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Q>"  :subid("121_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx383_tgt
    .local int rx383_pos
    .local int rx383_off
    .local int rx383_eos
    .local int rx383_rep
    .local pmc rx383_cur
    (rx383_cur, rx383_pos, rx383_tgt, $I10) = self."!cursor_start"()
    rx383_cur."!cursor_debug"("START ", "backslash:sym<Q>")
    .lex unicode:"$\x{a2}", rx383_cur
    .local pmc match
    .lex "$/", match
    length rx383_eos, rx383_tgt
    set rx383_off, 0
    lt $I10, 2, rx383_start
    sub rx383_off, $I10, 1
    substr rx383_tgt, rx383_tgt, rx383_off
  rx383_start:
.annotate "line", 128
  # rx literal  "Q"
    add $I11, rx383_pos, 1
    gt $I11, rx383_eos, rx383_fail
    sub $I11, rx383_pos, rx383_off
    substr $S10, rx383_tgt, $I11, 1
    ne $S10, "Q", rx383_fail
    add rx383_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx383_cur."!cursor_pos"(rx383_pos)
    $P10 = rx383_cur."obs"("\\Q as quotemeta", "quotes or literal variable match")
    unless $P10, rx383_fail
    rx383_pos = $P10."pos"()
  # rx pass
    rx383_cur."!cursor_pass"(rx383_pos, "backslash:sym<Q>")
    rx383_cur."!cursor_debug"("PASS  ", "backslash:sym<Q>", " at pos=", rx383_pos)
    .return (rx383_cur)
  rx383_fail:
.annotate "line", 3
    (rx383_rep, rx383_pos, $I10, $P10) = rx383_cur."!mark_fail"(0)
    lt rx383_pos, -1, rx383_done
    eq rx383_pos, -1, rx383_fail
    jump $I10
  rx383_done:
    rx383_cur."!cursor_fail"()
    rx383_cur."!cursor_debug"("FAIL  ", "backslash:sym<Q>")
    .return (rx383_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<Q>"  :subid("122_1258897726.59476") :method
.annotate "line", 3
    $P385 = self."!PREFIX__!subrule"("", "Q")
    new $P386, "ResizablePMCArray"
    push $P386, $P385
    .return ($P386)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<misc>"  :subid("123_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx388_tgt
    .local int rx388_pos
    .local int rx388_off
    .local int rx388_eos
    .local int rx388_rep
    .local pmc rx388_cur
    (rx388_cur, rx388_pos, rx388_tgt, $I10) = self."!cursor_start"()
    rx388_cur."!cursor_debug"("START ", "backslash:sym<misc>")
    .lex unicode:"$\x{a2}", rx388_cur
    .local pmc match
    .lex "$/", match
    length rx388_eos, rx388_tgt
    set rx388_off, 0
    lt $I10, 2, rx388_start
    sub rx388_off, $I10, 1
    substr rx388_tgt, rx388_tgt, rx388_off
  rx388_start:
.annotate "line", 129
  # rx charclass W
    ge rx388_pos, rx388_eos, rx388_fail
    sub $I10, rx388_pos, rx388_off
    is_cclass $I11, 8192, rx388_tgt, $I10
    if $I11, rx388_fail
    inc rx388_pos
  # rx pass
    rx388_cur."!cursor_pass"(rx388_pos, "backslash:sym<misc>")
    rx388_cur."!cursor_debug"("PASS  ", "backslash:sym<misc>", " at pos=", rx388_pos)
    .return (rx388_cur)
  rx388_fail:
.annotate "line", 3
    (rx388_rep, rx388_pos, $I10, $P10) = rx388_cur."!mark_fail"(0)
    lt rx388_pos, -1, rx388_done
    eq rx388_pos, -1, rx388_fail
    jump $I10
  rx388_done:
    rx388_cur."!cursor_fail"()
    rx388_cur."!cursor_debug"("FAIL  ", "backslash:sym<misc>")
    .return (rx388_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<misc>"  :subid("124_1258897726.59476") :method
.annotate "line", 3
    new $P390, "ResizablePMCArray"
    push $P390, ""
    .return ($P390)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion"  :subid("125_1258897726.59476") :method
.annotate "line", 131
    $P392 = self."!protoregex"("assertion")
    .return ($P392)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion"  :subid("126_1258897726.59476") :method
.annotate "line", 131
    $P394 = self."!PREFIX__!protoregex"("assertion")
    .return ($P394)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<?>"  :subid("127_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .const 'Sub' $P402 = "129_1258897726.59476" 
    capture_lex $P402
    .local string rx396_tgt
    .local int rx396_pos
    .local int rx396_off
    .local int rx396_eos
    .local int rx396_rep
    .local pmc rx396_cur
    (rx396_cur, rx396_pos, rx396_tgt, $I10) = self."!cursor_start"()
    rx396_cur."!cursor_debug"("START ", "assertion:sym<?>")
    .lex unicode:"$\x{a2}", rx396_cur
    .local pmc match
    .lex "$/", match
    length rx396_eos, rx396_tgt
    set rx396_off, 0
    lt $I10, 2, rx396_start
    sub rx396_off, $I10, 1
    substr rx396_tgt, rx396_tgt, rx396_off
  rx396_start:
.annotate "line", 133
  # rx literal  "?"
    add $I11, rx396_pos, 1
    gt $I11, rx396_eos, rx396_fail
    sub $I11, rx396_pos, rx396_off
    substr $S10, rx396_tgt, $I11, 1
    ne $S10, "?", rx396_fail
    add rx396_pos, 1
  alt400_0:
    set_addr $I10, alt400_1
    rx396_cur."!mark_push"(0, rx396_pos, $I10)
  # rx subrule "before" subtype=zerowidth negate=
    rx396_cur."!cursor_pos"(rx396_pos)
    .const 'Sub' $P402 = "129_1258897726.59476" 
    capture_lex $P402
    $P10 = rx396_cur."before"($P402)
    unless $P10, rx396_fail
    goto alt400_end
  alt400_1:
  # rx subrule "assertion" subtype=capture negate=
    rx396_cur."!cursor_pos"(rx396_pos)
    $P10 = rx396_cur."assertion"()
    unless $P10, rx396_fail
    rx396_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx396_pos = $P10."pos"()
  alt400_end:
  # rx pass
    rx396_cur."!cursor_pass"(rx396_pos, "assertion:sym<?>")
    rx396_cur."!cursor_debug"("PASS  ", "assertion:sym<?>", " at pos=", rx396_pos)
    .return (rx396_cur)
  rx396_fail:
.annotate "line", 3
    (rx396_rep, rx396_pos, $I10, $P10) = rx396_cur."!mark_fail"(0)
    lt rx396_pos, -1, rx396_done
    eq rx396_pos, -1, rx396_fail
    jump $I10
  rx396_done:
    rx396_cur."!cursor_fail"()
    rx396_cur."!cursor_debug"("FAIL  ", "assertion:sym<?>")
    .return (rx396_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<?>"  :subid("128_1258897726.59476") :method
.annotate "line", 3
    $P398 = self."!PREFIX__!subrule"("assertion", "?")
    new $P399, "ResizablePMCArray"
    push $P399, $P398
    push $P399, "?"
    .return ($P399)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block401"  :anon :subid("129_1258897726.59476") :method :outer("127_1258897726.59476")
.annotate "line", 133
    .local string rx403_tgt
    .local int rx403_pos
    .local int rx403_off
    .local int rx403_eos
    .local int rx403_rep
    .local pmc rx403_cur
    (rx403_cur, rx403_pos, rx403_tgt, $I10) = self."!cursor_start"()
    rx403_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx403_cur
    .local pmc match
    .lex "$/", match
    length rx403_eos, rx403_tgt
    set rx403_off, 0
    lt $I10, 2, rx403_start
    sub rx403_off, $I10, 1
    substr rx403_tgt, rx403_tgt, rx403_off
  rx403_start:
    ge rx403_pos, 0, rxscan404_done
  rxscan404_loop:
    ($P10) = rx403_cur."from"()
    inc $P10
    set rx403_pos, $P10
    ge rx403_pos, rx403_eos, rxscan404_done
    set_addr $I10, rxscan404_loop
    rx403_cur."!mark_push"(0, rx403_pos, $I10)
  rxscan404_done:
  # rx literal  ">"
    add $I11, rx403_pos, 1
    gt $I11, rx403_eos, rx403_fail
    sub $I11, rx403_pos, rx403_off
    substr $S10, rx403_tgt, $I11, 1
    ne $S10, ">", rx403_fail
    add rx403_pos, 1
  # rx pass
    rx403_cur."!cursor_pass"(rx403_pos, "")
    rx403_cur."!cursor_debug"("PASS  ", "", " at pos=", rx403_pos)
    .return (rx403_cur)
  rx403_fail:
    (rx403_rep, rx403_pos, $I10, $P10) = rx403_cur."!mark_fail"(0)
    lt rx403_pos, -1, rx403_done
    eq rx403_pos, -1, rx403_fail
    jump $I10
  rx403_done:
    rx403_cur."!cursor_fail"()
    rx403_cur."!cursor_debug"("FAIL  ", "")
    .return (rx403_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<!>"  :subid("130_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .const 'Sub' $P412 = "132_1258897726.59476" 
    capture_lex $P412
    .local string rx406_tgt
    .local int rx406_pos
    .local int rx406_off
    .local int rx406_eos
    .local int rx406_rep
    .local pmc rx406_cur
    (rx406_cur, rx406_pos, rx406_tgt, $I10) = self."!cursor_start"()
    rx406_cur."!cursor_debug"("START ", "assertion:sym<!>")
    .lex unicode:"$\x{a2}", rx406_cur
    .local pmc match
    .lex "$/", match
    length rx406_eos, rx406_tgt
    set rx406_off, 0
    lt $I10, 2, rx406_start
    sub rx406_off, $I10, 1
    substr rx406_tgt, rx406_tgt, rx406_off
  rx406_start:
.annotate "line", 134
  # rx literal  "!"
    add $I11, rx406_pos, 1
    gt $I11, rx406_eos, rx406_fail
    sub $I11, rx406_pos, rx406_off
    substr $S10, rx406_tgt, $I11, 1
    ne $S10, "!", rx406_fail
    add rx406_pos, 1
  alt410_0:
    set_addr $I10, alt410_1
    rx406_cur."!mark_push"(0, rx406_pos, $I10)
  # rx subrule "before" subtype=zerowidth negate=
    rx406_cur."!cursor_pos"(rx406_pos)
    .const 'Sub' $P412 = "132_1258897726.59476" 
    capture_lex $P412
    $P10 = rx406_cur."before"($P412)
    unless $P10, rx406_fail
    goto alt410_end
  alt410_1:
  # rx subrule "assertion" subtype=capture negate=
    rx406_cur."!cursor_pos"(rx406_pos)
    $P10 = rx406_cur."assertion"()
    unless $P10, rx406_fail
    rx406_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx406_pos = $P10."pos"()
  alt410_end:
  # rx pass
    rx406_cur."!cursor_pass"(rx406_pos, "assertion:sym<!>")
    rx406_cur."!cursor_debug"("PASS  ", "assertion:sym<!>", " at pos=", rx406_pos)
    .return (rx406_cur)
  rx406_fail:
.annotate "line", 3
    (rx406_rep, rx406_pos, $I10, $P10) = rx406_cur."!mark_fail"(0)
    lt rx406_pos, -1, rx406_done
    eq rx406_pos, -1, rx406_fail
    jump $I10
  rx406_done:
    rx406_cur."!cursor_fail"()
    rx406_cur."!cursor_debug"("FAIL  ", "assertion:sym<!>")
    .return (rx406_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<!>"  :subid("131_1258897726.59476") :method
.annotate "line", 3
    $P408 = self."!PREFIX__!subrule"("assertion", "!")
    new $P409, "ResizablePMCArray"
    push $P409, $P408
    push $P409, "!"
    .return ($P409)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block411"  :anon :subid("132_1258897726.59476") :method :outer("130_1258897726.59476")
.annotate "line", 134
    .local string rx413_tgt
    .local int rx413_pos
    .local int rx413_off
    .local int rx413_eos
    .local int rx413_rep
    .local pmc rx413_cur
    (rx413_cur, rx413_pos, rx413_tgt, $I10) = self."!cursor_start"()
    rx413_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx413_cur
    .local pmc match
    .lex "$/", match
    length rx413_eos, rx413_tgt
    set rx413_off, 0
    lt $I10, 2, rx413_start
    sub rx413_off, $I10, 1
    substr rx413_tgt, rx413_tgt, rx413_off
  rx413_start:
    ge rx413_pos, 0, rxscan414_done
  rxscan414_loop:
    ($P10) = rx413_cur."from"()
    inc $P10
    set rx413_pos, $P10
    ge rx413_pos, rx413_eos, rxscan414_done
    set_addr $I10, rxscan414_loop
    rx413_cur."!mark_push"(0, rx413_pos, $I10)
  rxscan414_done:
  # rx literal  ">"
    add $I11, rx413_pos, 1
    gt $I11, rx413_eos, rx413_fail
    sub $I11, rx413_pos, rx413_off
    substr $S10, rx413_tgt, $I11, 1
    ne $S10, ">", rx413_fail
    add rx413_pos, 1
  # rx pass
    rx413_cur."!cursor_pass"(rx413_pos, "")
    rx413_cur."!cursor_debug"("PASS  ", "", " at pos=", rx413_pos)
    .return (rx413_cur)
  rx413_fail:
    (rx413_rep, rx413_pos, $I10, $P10) = rx413_cur."!mark_fail"(0)
    lt rx413_pos, -1, rx413_done
    eq rx413_pos, -1, rx413_fail
    jump $I10
  rx413_done:
    rx413_cur."!cursor_fail"()
    rx413_cur."!cursor_debug"("FAIL  ", "")
    .return (rx413_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<method>"  :subid("133_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx416_tgt
    .local int rx416_pos
    .local int rx416_off
    .local int rx416_eos
    .local int rx416_rep
    .local pmc rx416_cur
    (rx416_cur, rx416_pos, rx416_tgt, $I10) = self."!cursor_start"()
    rx416_cur."!cursor_debug"("START ", "assertion:sym<method>")
    .lex unicode:"$\x{a2}", rx416_cur
    .local pmc match
    .lex "$/", match
    length rx416_eos, rx416_tgt
    set rx416_off, 0
    lt $I10, 2, rx416_start
    sub rx416_off, $I10, 1
    substr rx416_tgt, rx416_tgt, rx416_off
  rx416_start:
.annotate "line", 137
  # rx literal  "."
    add $I11, rx416_pos, 1
    gt $I11, rx416_eos, rx416_fail
    sub $I11, rx416_pos, rx416_off
    substr $S10, rx416_tgt, $I11, 1
    ne $S10, ".", rx416_fail
    add rx416_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx416_cur."!cursor_pos"(rx416_pos)
    $P10 = rx416_cur."assertion"()
    unless $P10, rx416_fail
    rx416_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx416_pos = $P10."pos"()
.annotate "line", 136
  # rx pass
    rx416_cur."!cursor_pass"(rx416_pos, "assertion:sym<method>")
    rx416_cur."!cursor_debug"("PASS  ", "assertion:sym<method>", " at pos=", rx416_pos)
    .return (rx416_cur)
  rx416_fail:
.annotate "line", 3
    (rx416_rep, rx416_pos, $I10, $P10) = rx416_cur."!mark_fail"(0)
    lt rx416_pos, -1, rx416_done
    eq rx416_pos, -1, rx416_fail
    jump $I10
  rx416_done:
    rx416_cur."!cursor_fail"()
    rx416_cur."!cursor_debug"("FAIL  ", "assertion:sym<method>")
    .return (rx416_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<method>"  :subid("134_1258897726.59476") :method
.annotate "line", 3
    $P418 = self."!PREFIX__!subrule"("assertion", ".")
    new $P419, "ResizablePMCArray"
    push $P419, $P418
    .return ($P419)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<name>"  :subid("135_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .const 'Sub' $P428 = "137_1258897726.59476" 
    capture_lex $P428
    .local string rx421_tgt
    .local int rx421_pos
    .local int rx421_off
    .local int rx421_eos
    .local int rx421_rep
    .local pmc rx421_cur
    (rx421_cur, rx421_pos, rx421_tgt, $I10) = self."!cursor_start"()
    rx421_cur."!cursor_debug"("START ", "assertion:sym<name>")
    rx421_cur."!cursor_caparray"("assertion", "nibbler", "arglist")
    .lex unicode:"$\x{a2}", rx421_cur
    .local pmc match
    .lex "$/", match
    length rx421_eos, rx421_tgt
    set rx421_off, 0
    lt $I10, 2, rx421_start
    sub rx421_off, $I10, 1
    substr rx421_tgt, rx421_tgt, rx421_off
  rx421_start:
.annotate "line", 141
  # rx subcapture "longname"
    set_addr $I10, rxcap_424_fail
    rx421_cur."!mark_push"(0, rx421_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx421_pos, rx421_off
    find_not_cclass $I11, 8192, rx421_tgt, $I10, rx421_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx421_fail
    add rx421_pos, rx421_off, $I11
    set_addr $I10, rxcap_424_fail
    ($I12, $I11) = rx421_cur."!mark_peek"($I10)
    rx421_cur."!cursor_pos"($I11)
    ($P10) = rx421_cur."!cursor_start"()
    $P10."!cursor_pass"(rx421_pos, "")
    rx421_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    goto rxcap_424_done
  rxcap_424_fail:
    goto rx421_fail
  rxcap_424_done:
.annotate "line", 148
  # rx rxquantr425 ** 0..1
    set_addr $I431, rxquantr425_done
    rx421_cur."!mark_push"(0, rx421_pos, $I431)
  rxquantr425_loop:
  alt426_0:
.annotate "line", 142
    set_addr $I10, alt426_1
    rx421_cur."!mark_push"(0, rx421_pos, $I10)
.annotate "line", 143
  # rx subrule "before" subtype=zerowidth negate=
    rx421_cur."!cursor_pos"(rx421_pos)
    .const 'Sub' $P428 = "137_1258897726.59476" 
    capture_lex $P428
    $P10 = rx421_cur."before"($P428)
    unless $P10, rx421_fail
    goto alt426_end
  alt426_1:
    set_addr $I10, alt426_2
    rx421_cur."!mark_push"(0, rx421_pos, $I10)
.annotate "line", 144
  # rx literal  "="
    add $I11, rx421_pos, 1
    gt $I11, rx421_eos, rx421_fail
    sub $I11, rx421_pos, rx421_off
    substr $S10, rx421_tgt, $I11, 1
    ne $S10, "=", rx421_fail
    add rx421_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx421_cur."!cursor_pos"(rx421_pos)
    $P10 = rx421_cur."assertion"()
    unless $P10, rx421_fail
    rx421_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx421_pos = $P10."pos"()
    goto alt426_end
  alt426_2:
    set_addr $I10, alt426_3
    rx421_cur."!mark_push"(0, rx421_pos, $I10)
.annotate "line", 145
  # rx literal  ":"
    add $I11, rx421_pos, 1
    gt $I11, rx421_eos, rx421_fail
    sub $I11, rx421_pos, rx421_off
    substr $S10, rx421_tgt, $I11, 1
    ne $S10, ":", rx421_fail
    add rx421_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx421_cur."!cursor_pos"(rx421_pos)
    $P10 = rx421_cur."arglist"()
    unless $P10, rx421_fail
    rx421_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx421_pos = $P10."pos"()
    goto alt426_end
  alt426_3:
    set_addr $I10, alt426_4
    rx421_cur."!mark_push"(0, rx421_pos, $I10)
.annotate "line", 146
  # rx literal  "("
    add $I11, rx421_pos, 1
    gt $I11, rx421_eos, rx421_fail
    sub $I11, rx421_pos, rx421_off
    substr $S10, rx421_tgt, $I11, 1
    ne $S10, "(", rx421_fail
    add rx421_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx421_cur."!cursor_pos"(rx421_pos)
    $P10 = rx421_cur."arglist"()
    unless $P10, rx421_fail
    rx421_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx421_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx421_pos, 1
    gt $I11, rx421_eos, rx421_fail
    sub $I11, rx421_pos, rx421_off
    substr $S10, rx421_tgt, $I11, 1
    ne $S10, ")", rx421_fail
    add rx421_pos, 1
    goto alt426_end
  alt426_4:
.annotate "line", 147
  # rx subrule "normspace" subtype=method negate=
    rx421_cur."!cursor_pos"(rx421_pos)
    $P10 = rx421_cur."normspace"()
    unless $P10, rx421_fail
    rx421_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx421_cur."!cursor_pos"(rx421_pos)
    $P10 = rx421_cur."nibbler"()
    unless $P10, rx421_fail
    rx421_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx421_pos = $P10."pos"()
  alt426_end:
.annotate "line", 148
    (rx421_rep) = rx421_cur."!mark_commit"($I431)
  rxquantr425_done:
.annotate "line", 140
  # rx pass
    rx421_cur."!cursor_pass"(rx421_pos, "assertion:sym<name>")
    rx421_cur."!cursor_debug"("PASS  ", "assertion:sym<name>", " at pos=", rx421_pos)
    .return (rx421_cur)
  rx421_fail:
.annotate "line", 3
    (rx421_rep, rx421_pos, $I10, $P10) = rx421_cur."!mark_fail"(0)
    lt rx421_pos, -1, rx421_done
    eq rx421_pos, -1, rx421_fail
    jump $I10
  rx421_done:
    rx421_cur."!cursor_fail"()
    rx421_cur."!cursor_debug"("FAIL  ", "assertion:sym<name>")
    .return (rx421_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<name>"  :subid("136_1258897726.59476") :method
.annotate "line", 3
    new $P423, "ResizablePMCArray"
    push $P423, ""
    .return ($P423)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block427"  :anon :subid("137_1258897726.59476") :method :outer("135_1258897726.59476")
.annotate "line", 143
    .local string rx429_tgt
    .local int rx429_pos
    .local int rx429_off
    .local int rx429_eos
    .local int rx429_rep
    .local pmc rx429_cur
    (rx429_cur, rx429_pos, rx429_tgt, $I10) = self."!cursor_start"()
    rx429_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx429_cur
    .local pmc match
    .lex "$/", match
    length rx429_eos, rx429_tgt
    set rx429_off, 0
    lt $I10, 2, rx429_start
    sub rx429_off, $I10, 1
    substr rx429_tgt, rx429_tgt, rx429_off
  rx429_start:
    ge rx429_pos, 0, rxscan430_done
  rxscan430_loop:
    ($P10) = rx429_cur."from"()
    inc $P10
    set rx429_pos, $P10
    ge rx429_pos, rx429_eos, rxscan430_done
    set_addr $I10, rxscan430_loop
    rx429_cur."!mark_push"(0, rx429_pos, $I10)
  rxscan430_done:
  # rx literal  ">"
    add $I11, rx429_pos, 1
    gt $I11, rx429_eos, rx429_fail
    sub $I11, rx429_pos, rx429_off
    substr $S10, rx429_tgt, $I11, 1
    ne $S10, ">", rx429_fail
    add rx429_pos, 1
  # rx pass
    rx429_cur."!cursor_pass"(rx429_pos, "")
    rx429_cur."!cursor_debug"("PASS  ", "", " at pos=", rx429_pos)
    .return (rx429_cur)
  rx429_fail:
    (rx429_rep, rx429_pos, $I10, $P10) = rx429_cur."!mark_fail"(0)
    lt rx429_pos, -1, rx429_done
    eq rx429_pos, -1, rx429_fail
    jump $I10
  rx429_done:
    rx429_cur."!cursor_fail"()
    rx429_cur."!cursor_debug"("FAIL  ", "")
    .return (rx429_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<[>"  :subid("138_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .const 'Sub' $P437 = "140_1258897726.59476" 
    capture_lex $P437
    .local string rx433_tgt
    .local int rx433_pos
    .local int rx433_off
    .local int rx433_eos
    .local int rx433_rep
    .local pmc rx433_cur
    (rx433_cur, rx433_pos, rx433_tgt, $I10) = self."!cursor_start"()
    rx433_cur."!cursor_debug"("START ", "assertion:sym<[>")
    rx433_cur."!cursor_caparray"("cclass_elem")
    .lex unicode:"$\x{a2}", rx433_cur
    .local pmc match
    .lex "$/", match
    length rx433_eos, rx433_tgt
    set rx433_off, 0
    lt $I10, 2, rx433_start
    sub rx433_off, $I10, 1
    substr rx433_tgt, rx433_tgt, rx433_off
  rx433_start:
.annotate "line", 151
  # rx subrule "before" subtype=zerowidth negate=
    rx433_cur."!cursor_pos"(rx433_pos)
    .const 'Sub' $P437 = "140_1258897726.59476" 
    capture_lex $P437
    $P10 = rx433_cur."before"($P437)
    unless $P10, rx433_fail
  # rx rxquantr441 ** 1..*
    set_addr $I442, rxquantr441_done
    rx433_cur."!mark_push"(0, -1, $I442)
  rxquantr441_loop:
  # rx subrule "cclass_elem" subtype=capture negate=
    rx433_cur."!cursor_pos"(rx433_pos)
    $P10 = rx433_cur."cclass_elem"()
    unless $P10, rx433_fail
    rx433_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cclass_elem")
    rx433_pos = $P10."pos"()
    (rx433_rep) = rx433_cur."!mark_commit"($I442)
    rx433_cur."!mark_push"(rx433_rep, rx433_pos, $I442)
    goto rxquantr441_loop
  rxquantr441_done:
  # rx pass
    rx433_cur."!cursor_pass"(rx433_pos, "assertion:sym<[>")
    rx433_cur."!cursor_debug"("PASS  ", "assertion:sym<[>", " at pos=", rx433_pos)
    .return (rx433_cur)
  rx433_fail:
.annotate "line", 3
    (rx433_rep, rx433_pos, $I10, $P10) = rx433_cur."!mark_fail"(0)
    lt rx433_pos, -1, rx433_done
    eq rx433_pos, -1, rx433_fail
    jump $I10
  rx433_done:
    rx433_cur."!cursor_fail"()
    rx433_cur."!cursor_debug"("FAIL  ", "assertion:sym<[>")
    .return (rx433_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<[>"  :subid("139_1258897726.59476") :method
.annotate "line", 3
    new $P435, "ResizablePMCArray"
    push $P435, ""
    .return ($P435)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block436"  :anon :subid("140_1258897726.59476") :method :outer("138_1258897726.59476")
.annotate "line", 151
    .local string rx438_tgt
    .local int rx438_pos
    .local int rx438_off
    .local int rx438_eos
    .local int rx438_rep
    .local pmc rx438_cur
    (rx438_cur, rx438_pos, rx438_tgt, $I10) = self."!cursor_start"()
    rx438_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx438_cur
    .local pmc match
    .lex "$/", match
    length rx438_eos, rx438_tgt
    set rx438_off, 0
    lt $I10, 2, rx438_start
    sub rx438_off, $I10, 1
    substr rx438_tgt, rx438_tgt, rx438_off
  rx438_start:
    ge rx438_pos, 0, rxscan439_done
  rxscan439_loop:
    ($P10) = rx438_cur."from"()
    inc $P10
    set rx438_pos, $P10
    ge rx438_pos, rx438_eos, rxscan439_done
    set_addr $I10, rxscan439_loop
    rx438_cur."!mark_push"(0, rx438_pos, $I10)
  rxscan439_done:
  alt440_0:
    set_addr $I10, alt440_1
    rx438_cur."!mark_push"(0, rx438_pos, $I10)
  # rx literal  "["
    add $I11, rx438_pos, 1
    gt $I11, rx438_eos, rx438_fail
    sub $I11, rx438_pos, rx438_off
    substr $S10, rx438_tgt, $I11, 1
    ne $S10, "[", rx438_fail
    add rx438_pos, 1
    goto alt440_end
  alt440_1:
    set_addr $I10, alt440_2
    rx438_cur."!mark_push"(0, rx438_pos, $I10)
  # rx literal  "+"
    add $I11, rx438_pos, 1
    gt $I11, rx438_eos, rx438_fail
    sub $I11, rx438_pos, rx438_off
    substr $S10, rx438_tgt, $I11, 1
    ne $S10, "+", rx438_fail
    add rx438_pos, 1
    goto alt440_end
  alt440_2:
  # rx literal  "-"
    add $I11, rx438_pos, 1
    gt $I11, rx438_eos, rx438_fail
    sub $I11, rx438_pos, rx438_off
    substr $S10, rx438_tgt, $I11, 1
    ne $S10, "-", rx438_fail
    add rx438_pos, 1
  alt440_end:
  # rx pass
    rx438_cur."!cursor_pass"(rx438_pos, "")
    rx438_cur."!cursor_debug"("PASS  ", "", " at pos=", rx438_pos)
    .return (rx438_cur)
  rx438_fail:
    (rx438_rep, rx438_pos, $I10, $P10) = rx438_cur."!mark_fail"(0)
    lt rx438_pos, -1, rx438_done
    eq rx438_pos, -1, rx438_fail
    jump $I10
  rx438_done:
    rx438_cur."!cursor_fail"()
    rx438_cur."!cursor_debug"("FAIL  ", "")
    .return (rx438_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "cclass_elem"  :subid("141_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .const 'Sub' $P454 = "143_1258897726.59476" 
    capture_lex $P454
    .local string rx444_tgt
    .local int rx444_pos
    .local int rx444_off
    .local int rx444_eos
    .local int rx444_rep
    .local pmc rx444_cur
    (rx444_cur, rx444_pos, rx444_tgt, $I10) = self."!cursor_start"()
    rx444_cur."!cursor_debug"("START ", "cclass_elem")
    rx444_cur."!cursor_caparray"("charspec")
    .lex unicode:"$\x{a2}", rx444_cur
    .local pmc match
    .lex "$/", match
    length rx444_eos, rx444_tgt
    set rx444_off, 0
    lt $I10, 2, rx444_start
    sub rx444_off, $I10, 1
    substr rx444_tgt, rx444_tgt, rx444_off
  rx444_start:
.annotate "line", 154
  # rx subcapture "sign"
    set_addr $I10, rxcap_448_fail
    rx444_cur."!mark_push"(0, rx444_pos, $I10)
  alt447_0:
    set_addr $I10, alt447_1
    rx444_cur."!mark_push"(0, rx444_pos, $I10)
  # rx literal  "+"
    add $I11, rx444_pos, 1
    gt $I11, rx444_eos, rx444_fail
    sub $I11, rx444_pos, rx444_off
    substr $S10, rx444_tgt, $I11, 1
    ne $S10, "+", rx444_fail
    add rx444_pos, 1
    goto alt447_end
  alt447_1:
    set_addr $I10, alt447_2
    rx444_cur."!mark_push"(0, rx444_pos, $I10)
  # rx literal  "-"
    add $I11, rx444_pos, 1
    gt $I11, rx444_eos, rx444_fail
    sub $I11, rx444_pos, rx444_off
    substr $S10, rx444_tgt, $I11, 1
    ne $S10, "-", rx444_fail
    add rx444_pos, 1
    goto alt447_end
  alt447_2:
  alt447_end:
    set_addr $I10, rxcap_448_fail
    ($I12, $I11) = rx444_cur."!mark_peek"($I10)
    rx444_cur."!cursor_pos"($I11)
    ($P10) = rx444_cur."!cursor_start"()
    $P10."!cursor_pass"(rx444_pos, "")
    rx444_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sign")
    goto rxcap_448_done
  rxcap_448_fail:
    goto rx444_fail
  rxcap_448_done:
.annotate "line", 155
  # rx rxquantr449 ** 0..1
    set_addr $I450, rxquantr449_done
    rx444_cur."!mark_push"(0, rx444_pos, $I450)
  rxquantr449_loop:
  # rx subrule "normspace" subtype=method negate=
    rx444_cur."!cursor_pos"(rx444_pos)
    $P10 = rx444_cur."normspace"()
    unless $P10, rx444_fail
    rx444_pos = $P10."pos"()
    (rx444_rep) = rx444_cur."!mark_commit"($I450)
  rxquantr449_done:
  alt451_0:
.annotate "line", 156
    set_addr $I10, alt451_1
    rx444_cur."!mark_push"(0, rx444_pos, $I10)
.annotate "line", 157
  # rx literal  "["
    add $I11, rx444_pos, 1
    gt $I11, rx444_eos, rx444_fail
    sub $I11, rx444_pos, rx444_off
    substr $S10, rx444_tgt, $I11, 1
    ne $S10, "[", rx444_fail
    add rx444_pos, 1
.annotate "line", 160
  # rx rxquantr452 ** 0..*
    set_addr $I473, rxquantr452_done
    rx444_cur."!mark_push"(0, rx444_pos, $I473)
  rxquantr452_loop:
.annotate "line", 157
  # rx subrule $P454 subtype=capture negate=
    rx444_cur."!cursor_pos"(rx444_pos)
    .const 'Sub' $P454 = "143_1258897726.59476" 
    capture_lex $P454
    $P10 = rx444_cur.$P454()
    unless $P10, rx444_fail
    rx444_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charspec")
    rx444_pos = $P10."pos"()
.annotate "line", 160
    (rx444_rep) = rx444_cur."!mark_commit"($I473)
    rx444_cur."!mark_push"(rx444_rep, rx444_pos, $I473)
    goto rxquantr452_loop
  rxquantr452_done:
.annotate "line", 161
  # rx charclass_q s r 0..-1
    sub $I10, rx444_pos, rx444_off
    find_not_cclass $I11, 32, rx444_tgt, $I10, rx444_eos
    add rx444_pos, rx444_off, $I11
  # rx literal  "]"
    add $I11, rx444_pos, 1
    gt $I11, rx444_eos, rx444_fail
    sub $I11, rx444_pos, rx444_off
    substr $S10, rx444_tgt, $I11, 1
    ne $S10, "]", rx444_fail
    add rx444_pos, 1
.annotate "line", 157
    goto alt451_end
  alt451_1:
.annotate "line", 162
  # rx subcapture "name"
    set_addr $I10, rxcap_474_fail
    rx444_cur."!mark_push"(0, rx444_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx444_pos, rx444_off
    find_not_cclass $I11, 8192, rx444_tgt, $I10, rx444_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx444_fail
    add rx444_pos, rx444_off, $I11
    set_addr $I10, rxcap_474_fail
    ($I12, $I11) = rx444_cur."!mark_peek"($I10)
    rx444_cur."!cursor_pos"($I11)
    ($P10) = rx444_cur."!cursor_start"()
    $P10."!cursor_pass"(rx444_pos, "")
    rx444_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_474_done
  rxcap_474_fail:
    goto rx444_fail
  rxcap_474_done:
  alt451_end:
.annotate "line", 164
  # rx rxquantr475 ** 0..1
    set_addr $I476, rxquantr475_done
    rx444_cur."!mark_push"(0, rx444_pos, $I476)
  rxquantr475_loop:
  # rx subrule "normspace" subtype=method negate=
    rx444_cur."!cursor_pos"(rx444_pos)
    $P10 = rx444_cur."normspace"()
    unless $P10, rx444_fail
    rx444_pos = $P10."pos"()
    (rx444_rep) = rx444_cur."!mark_commit"($I476)
  rxquantr475_done:
.annotate "line", 153
  # rx pass
    rx444_cur."!cursor_pass"(rx444_pos, "cclass_elem")
    rx444_cur."!cursor_debug"("PASS  ", "cclass_elem", " at pos=", rx444_pos)
    .return (rx444_cur)
  rx444_fail:
.annotate "line", 3
    (rx444_rep, rx444_pos, $I10, $P10) = rx444_cur."!mark_fail"(0)
    lt rx444_pos, -1, rx444_done
    eq rx444_pos, -1, rx444_fail
    jump $I10
  rx444_done:
    rx444_cur."!cursor_fail"()
    rx444_cur."!cursor_debug"("FAIL  ", "cclass_elem")
    .return (rx444_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__cclass_elem"  :subid("142_1258897726.59476") :method
.annotate "line", 3
    new $P446, "ResizablePMCArray"
    push $P446, ""
    push $P446, "-"
    push $P446, "+"
    .return ($P446)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block453"  :anon :subid("143_1258897726.59476") :method :outer("141_1258897726.59476")
.annotate "line", 157
    .const 'Sub' $P469 = "146_1258897726.59476" 
    capture_lex $P469
    .const 'Sub' $P464 = "145_1258897726.59476" 
    capture_lex $P464
    .const 'Sub' $P460 = "144_1258897726.59476" 
    capture_lex $P460
    .local string rx455_tgt
    .local int rx455_pos
    .local int rx455_off
    .local int rx455_eos
    .local int rx455_rep
    .local pmc rx455_cur
    (rx455_cur, rx455_pos, rx455_tgt, $I10) = self."!cursor_start"()
    rx455_cur."!cursor_debug"("START ", "")
    rx455_cur."!cursor_caparray"("1")
    .lex unicode:"$\x{a2}", rx455_cur
    .local pmc match
    .lex "$/", match
    length rx455_eos, rx455_tgt
    set rx455_off, 0
    lt $I10, 2, rx455_start
    sub rx455_off, $I10, 1
    substr rx455_tgt, rx455_tgt, rx455_off
  rx455_start:
    ge rx455_pos, 0, rxscan456_done
  rxscan456_loop:
    ($P10) = rx455_cur."from"()
    inc $P10
    set rx455_pos, $P10
    ge rx455_pos, rx455_eos, rxscan456_done
    set_addr $I10, rxscan456_loop
    rx455_cur."!mark_push"(0, rx455_pos, $I10)
  rxscan456_done:
  alt457_0:
    set_addr $I10, alt457_1
    rx455_cur."!mark_push"(0, rx455_pos, $I10)
.annotate "line", 158
  # rx charclass_q s r 0..-1
    sub $I10, rx455_pos, rx455_off
    find_not_cclass $I11, 32, rx455_tgt, $I10, rx455_eos
    add rx455_pos, rx455_off, $I11
  # rx literal  "-"
    add $I11, rx455_pos, 1
    gt $I11, rx455_eos, rx455_fail
    sub $I11, rx455_pos, rx455_off
    substr $S10, rx455_tgt, $I11, 1
    ne $S10, "-", rx455_fail
    add rx455_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx455_cur."!cursor_pos"(rx455_pos)
    $P10 = rx455_cur."obs"("hyphen in enumerated character class", "..")
    unless $P10, rx455_fail
    rx455_pos = $P10."pos"()
    goto alt457_end
  alt457_1:
.annotate "line", 159
  # rx charclass_q s r 0..-1
    sub $I10, rx455_pos, rx455_off
    find_not_cclass $I11, 32, rx455_tgt, $I10, rx455_eos
    add rx455_pos, rx455_off, $I11
  alt458_0:
    set_addr $I10, alt458_1
    rx455_cur."!mark_push"(0, rx455_pos, $I10)
  # rx literal  "\\"
    add $I11, rx455_pos, 1
    gt $I11, rx455_eos, rx455_fail
    sub $I11, rx455_pos, rx455_off
    substr $S10, rx455_tgt, $I11, 1
    ne $S10, "\\", rx455_fail
    add rx455_pos, 1
  # rx subrule $P460 subtype=capture negate=
    rx455_cur."!cursor_pos"(rx455_pos)
    .const 'Sub' $P460 = "144_1258897726.59476" 
    capture_lex $P460
    $P10 = rx455_cur.$P460()
    unless $P10, rx455_fail
    rx455_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"(0)
    rx455_pos = $P10."pos"()
    goto alt458_end
  alt458_1:
  # rx subrule $P464 subtype=capture negate=
    rx455_cur."!cursor_pos"(rx455_pos)
    .const 'Sub' $P464 = "145_1258897726.59476" 
    capture_lex $P464
    $P10 = rx455_cur.$P464()
    unless $P10, rx455_fail
    rx455_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"(0)
    rx455_pos = $P10."pos"()
  alt458_end:
  # rx rxquantr467 ** 0..1
    set_addr $I472, rxquantr467_done
    rx455_cur."!mark_push"(0, rx455_pos, $I472)
  rxquantr467_loop:
  # rx charclass_q s r 0..-1
    sub $I10, rx455_pos, rx455_off
    find_not_cclass $I11, 32, rx455_tgt, $I10, rx455_eos
    add rx455_pos, rx455_off, $I11
  # rx literal  ".."
    add $I11, rx455_pos, 2
    gt $I11, rx455_eos, rx455_fail
    sub $I11, rx455_pos, rx455_off
    substr $S10, rx455_tgt, $I11, 2
    ne $S10, "..", rx455_fail
    add rx455_pos, 2
  # rx charclass_q s r 0..-1
    sub $I10, rx455_pos, rx455_off
    find_not_cclass $I11, 32, rx455_tgt, $I10, rx455_eos
    add rx455_pos, rx455_off, $I11
  # rx subrule $P469 subtype=capture negate=
    rx455_cur."!cursor_pos"(rx455_pos)
    .const 'Sub' $P469 = "146_1258897726.59476" 
    capture_lex $P469
    $P10 = rx455_cur.$P469()
    unless $P10, rx455_fail
    rx455_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("1")
    rx455_pos = $P10."pos"()
    (rx455_rep) = rx455_cur."!mark_commit"($I472)
  rxquantr467_done:
  alt457_end:
.annotate "line", 157
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
.sub "_block459"  :anon :subid("144_1258897726.59476") :method :outer("143_1258897726.59476")
.annotate "line", 159
    .local string rx461_tgt
    .local int rx461_pos
    .local int rx461_off
    .local int rx461_eos
    .local int rx461_rep
    .local pmc rx461_cur
    (rx461_cur, rx461_pos, rx461_tgt, $I10) = self."!cursor_start"()
    rx461_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx461_cur
    .local pmc match
    .lex "$/", match
    length rx461_eos, rx461_tgt
    set rx461_off, 0
    lt $I10, 2, rx461_start
    sub rx461_off, $I10, 1
    substr rx461_tgt, rx461_tgt, rx461_off
  rx461_start:
    ge rx461_pos, 0, rxscan462_done
  rxscan462_loop:
    ($P10) = rx461_cur."from"()
    inc $P10
    set rx461_pos, $P10
    ge rx461_pos, rx461_eos, rxscan462_done
    set_addr $I10, rxscan462_loop
    rx461_cur."!mark_push"(0, rx461_pos, $I10)
  rxscan462_done:
  # rx charclass .
    ge rx461_pos, rx461_eos, rx461_fail
    inc rx461_pos
  # rx pass
    rx461_cur."!cursor_pass"(rx461_pos, "")
    rx461_cur."!cursor_debug"("PASS  ", "", " at pos=", rx461_pos)
    .return (rx461_cur)
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
.sub "_block463"  :anon :subid("145_1258897726.59476") :method :outer("143_1258897726.59476")
.annotate "line", 159
    .local string rx465_tgt
    .local int rx465_pos
    .local int rx465_off
    .local int rx465_eos
    .local int rx465_rep
    .local pmc rx465_cur
    (rx465_cur, rx465_pos, rx465_tgt, $I10) = self."!cursor_start"()
    rx465_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx465_cur
    .local pmc match
    .lex "$/", match
    length rx465_eos, rx465_tgt
    set rx465_off, 0
    lt $I10, 2, rx465_start
    sub rx465_off, $I10, 1
    substr rx465_tgt, rx465_tgt, rx465_off
  rx465_start:
    ge rx465_pos, 0, rxscan466_done
  rxscan466_loop:
    ($P10) = rx465_cur."from"()
    inc $P10
    set rx465_pos, $P10
    ge rx465_pos, rx465_eos, rxscan466_done
    set_addr $I10, rxscan466_loop
    rx465_cur."!mark_push"(0, rx465_pos, $I10)
  rxscan466_done:
  # rx enumcharlist negate=1 
    ge rx465_pos, rx465_eos, rx465_fail
    sub $I10, rx465_pos, rx465_off
    substr $S10, rx465_tgt, $I10, 1
    index $I11, "]\\", $S10
    ge $I11, 0, rx465_fail
    inc rx465_pos
  # rx pass
    rx465_cur."!cursor_pass"(rx465_pos, "")
    rx465_cur."!cursor_debug"("PASS  ", "", " at pos=", rx465_pos)
    .return (rx465_cur)
  rx465_fail:
    (rx465_rep, rx465_pos, $I10, $P10) = rx465_cur."!mark_fail"(0)
    lt rx465_pos, -1, rx465_done
    eq rx465_pos, -1, rx465_fail
    jump $I10
  rx465_done:
    rx465_cur."!cursor_fail"()
    rx465_cur."!cursor_debug"("FAIL  ", "")
    .return (rx465_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block468"  :anon :subid("146_1258897726.59476") :method :outer("143_1258897726.59476")
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
  # rx charclass .
    ge rx470_pos, rx470_eos, rx470_fail
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
.sub "mod_internal"  :subid("147_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .const 'Sub' $P485 = "149_1258897726.59476" 
    capture_lex $P485
    .local string rx478_tgt
    .local int rx478_pos
    .local int rx478_off
    .local int rx478_eos
    .local int rx478_rep
    .local pmc rx478_cur
    (rx478_cur, rx478_pos, rx478_tgt, $I10) = self."!cursor_start"()
    rx478_cur."!cursor_debug"("START ", "mod_internal")
    rx478_cur."!cursor_caparray"("n")
    .lex unicode:"$\x{a2}", rx478_cur
    .local pmc match
    .lex "$/", match
    length rx478_eos, rx478_tgt
    set rx478_off, 0
    lt $I10, 2, rx478_start
    sub rx478_off, $I10, 1
    substr rx478_tgt, rx478_tgt, rx478_off
  rx478_start:
  alt482_0:
.annotate "line", 168
    set_addr $I10, alt482_1
    rx478_cur."!mark_push"(0, rx478_pos, $I10)
.annotate "line", 169
  # rx literal  ":"
    add $I11, rx478_pos, 1
    gt $I11, rx478_eos, rx478_fail
    sub $I11, rx478_pos, rx478_off
    substr $S10, rx478_tgt, $I11, 1
    ne $S10, ":", rx478_fail
    add rx478_pos, 1
  # rx rxquantr483 ** 1..1
    set_addr $I489, rxquantr483_done
    rx478_cur."!mark_push"(0, -1, $I489)
  rxquantr483_loop:
  # rx subrule $P485 subtype=capture negate=
    rx478_cur."!cursor_pos"(rx478_pos)
    .const 'Sub' $P485 = "149_1258897726.59476" 
    capture_lex $P485
    $P10 = rx478_cur.$P485()
    unless $P10, rx478_fail
    rx478_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("n")
    rx478_pos = $P10."pos"()
    (rx478_rep) = rx478_cur."!mark_commit"($I489)
  rxquantr483_done:
  # rx subrule "mod_ident" subtype=capture negate=
    rx478_cur."!cursor_pos"(rx478_pos)
    $P10 = rx478_cur."mod_ident"()
    unless $P10, rx478_fail
    rx478_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_ident")
    rx478_pos = $P10."pos"()
  # rxanchor rwb
    le rx478_pos, 0, rx478_fail
    sub $I10, rx478_pos, rx478_off
    is_cclass $I11, 8192, rx478_tgt, $I10
    if $I11, rx478_fail
    dec $I10
    is_cclass $I11, 8192, rx478_tgt, $I10
    unless $I11, rx478_fail
    goto alt482_end
  alt482_1:
.annotate "line", 170
  # rx literal  ":"
    add $I11, rx478_pos, 1
    gt $I11, rx478_eos, rx478_fail
    sub $I11, rx478_pos, rx478_off
    substr $S10, rx478_tgt, $I11, 1
    ne $S10, ":", rx478_fail
    add rx478_pos, 1
  # rx subrule "mod_ident" subtype=capture negate=
    rx478_cur."!cursor_pos"(rx478_pos)
    $P10 = rx478_cur."mod_ident"()
    unless $P10, rx478_fail
    rx478_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_ident")
    rx478_pos = $P10."pos"()
  # rx rxquantr490 ** 0..1
    set_addr $I492, rxquantr490_done
    rx478_cur."!mark_push"(0, rx478_pos, $I492)
  rxquantr490_loop:
  # rx literal  "("
    add $I11, rx478_pos, 1
    gt $I11, rx478_eos, rx478_fail
    sub $I11, rx478_pos, rx478_off
    substr $S10, rx478_tgt, $I11, 1
    ne $S10, "(", rx478_fail
    add rx478_pos, 1
  # rx subcapture "n"
    set_addr $I10, rxcap_491_fail
    rx478_cur."!mark_push"(0, rx478_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx478_pos, rx478_off
    find_not_cclass $I11, 8, rx478_tgt, $I10, rx478_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx478_fail
    add rx478_pos, rx478_off, $I11
    set_addr $I10, rxcap_491_fail
    ($I12, $I11) = rx478_cur."!mark_peek"($I10)
    rx478_cur."!cursor_pos"($I11)
    ($P10) = rx478_cur."!cursor_start"()
    $P10."!cursor_pass"(rx478_pos, "")
    rx478_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("n")
    goto rxcap_491_done
  rxcap_491_fail:
    goto rx478_fail
  rxcap_491_done:
  # rx literal  ")"
    add $I11, rx478_pos, 1
    gt $I11, rx478_eos, rx478_fail
    sub $I11, rx478_pos, rx478_off
    substr $S10, rx478_tgt, $I11, 1
    ne $S10, ")", rx478_fail
    add rx478_pos, 1
    (rx478_rep) = rx478_cur."!mark_commit"($I492)
  rxquantr490_done:
  alt482_end:
.annotate "line", 167
  # rx pass
    rx478_cur."!cursor_pass"(rx478_pos, "mod_internal")
    rx478_cur."!cursor_debug"("PASS  ", "mod_internal", " at pos=", rx478_pos)
    .return (rx478_cur)
  rx478_fail:
.annotate "line", 3
    (rx478_rep, rx478_pos, $I10, $P10) = rx478_cur."!mark_fail"(0)
    lt rx478_pos, -1, rx478_done
    eq rx478_pos, -1, rx478_fail
    jump $I10
  rx478_done:
    rx478_cur."!cursor_fail"()
    rx478_cur."!cursor_debug"("FAIL  ", "mod_internal")
    .return (rx478_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_internal"  :subid("148_1258897726.59476") :method
.annotate "line", 3
    $P480 = self."!PREFIX__!subrule"("mod_ident", ":")
    new $P481, "ResizablePMCArray"
    push $P481, $P480
    push $P481, ":"
    .return ($P481)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block484"  :anon :subid("149_1258897726.59476") :method :outer("147_1258897726.59476")
.annotate "line", 169
    .local string rx486_tgt
    .local int rx486_pos
    .local int rx486_off
    .local int rx486_eos
    .local int rx486_rep
    .local pmc rx486_cur
    (rx486_cur, rx486_pos, rx486_tgt, $I10) = self."!cursor_start"()
    rx486_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx486_cur
    .local pmc match
    .lex "$/", match
    length rx486_eos, rx486_tgt
    set rx486_off, 0
    lt $I10, 2, rx486_start
    sub rx486_off, $I10, 1
    substr rx486_tgt, rx486_tgt, rx486_off
  rx486_start:
    ge rx486_pos, 0, rxscan487_done
  rxscan487_loop:
    ($P10) = rx486_cur."from"()
    inc $P10
    set rx486_pos, $P10
    ge rx486_pos, rx486_eos, rxscan487_done
    set_addr $I10, rxscan487_loop
    rx486_cur."!mark_push"(0, rx486_pos, $I10)
  rxscan487_done:
  alt488_0:
    set_addr $I10, alt488_1
    rx486_cur."!mark_push"(0, rx486_pos, $I10)
  # rx literal  "!"
    add $I11, rx486_pos, 1
    gt $I11, rx486_eos, rx486_fail
    sub $I11, rx486_pos, rx486_off
    substr $S10, rx486_tgt, $I11, 1
    ne $S10, "!", rx486_fail
    add rx486_pos, 1
    goto alt488_end
  alt488_1:
  # rx charclass_q d r 1..-1
    sub $I10, rx486_pos, rx486_off
    find_not_cclass $I11, 8, rx486_tgt, $I10, rx486_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx486_fail
    add rx486_pos, rx486_off, $I11
  alt488_end:
  # rx pass
    rx486_cur."!cursor_pass"(rx486_pos, "")
    rx486_cur."!cursor_debug"("PASS  ", "", " at pos=", rx486_pos)
    .return (rx486_cur)
  rx486_fail:
    (rx486_rep, rx486_pos, $I10, $P10) = rx486_cur."!mark_fail"(0)
    lt rx486_pos, -1, rx486_done
    eq rx486_pos, -1, rx486_fail
    jump $I10
  rx486_done:
    rx486_cur."!cursor_fail"()
    rx486_cur."!cursor_debug"("FAIL  ", "")
    .return (rx486_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident"  :subid("150_1258897726.59476") :method
.annotate "line", 174
    $P494 = self."!protoregex"("mod_ident")
    .return ($P494)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident"  :subid("151_1258897726.59476") :method
.annotate "line", 174
    $P496 = self."!PREFIX__!protoregex"("mod_ident")
    .return ($P496)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ignorecase>"  :subid("152_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx498_tgt
    .local int rx498_pos
    .local int rx498_off
    .local int rx498_eos
    .local int rx498_rep
    .local pmc rx498_cur
    (rx498_cur, rx498_pos, rx498_tgt, $I10) = self."!cursor_start"()
    rx498_cur."!cursor_debug"("START ", "mod_ident:sym<ignorecase>")
    .lex unicode:"$\x{a2}", rx498_cur
    .local pmc match
    .lex "$/", match
    length rx498_eos, rx498_tgt
    set rx498_off, 0
    lt $I10, 2, rx498_start
    sub rx498_off, $I10, 1
    substr rx498_tgt, rx498_tgt, rx498_off
  rx498_start:
.annotate "line", 175
  # rx subcapture "sym"
    set_addr $I10, rxcap_501_fail
    rx498_cur."!mark_push"(0, rx498_pos, $I10)
  # rx literal  "i"
    add $I11, rx498_pos, 1
    gt $I11, rx498_eos, rx498_fail
    sub $I11, rx498_pos, rx498_off
    substr $S10, rx498_tgt, $I11, 1
    ne $S10, "i", rx498_fail
    add rx498_pos, 1
    set_addr $I10, rxcap_501_fail
    ($I12, $I11) = rx498_cur."!mark_peek"($I10)
    rx498_cur."!cursor_pos"($I11)
    ($P10) = rx498_cur."!cursor_start"()
    $P10."!cursor_pass"(rx498_pos, "")
    rx498_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_501_done
  rxcap_501_fail:
    goto rx498_fail
  rxcap_501_done:
  # rx rxquantr502 ** 0..1
    set_addr $I503, rxquantr502_done
    rx498_cur."!mark_push"(0, rx498_pos, $I503)
  rxquantr502_loop:
  # rx literal  "gnorecase"
    add $I11, rx498_pos, 9
    gt $I11, rx498_eos, rx498_fail
    sub $I11, rx498_pos, rx498_off
    substr $S10, rx498_tgt, $I11, 9
    ne $S10, "gnorecase", rx498_fail
    add rx498_pos, 9
    (rx498_rep) = rx498_cur."!mark_commit"($I503)
  rxquantr502_done:
  # rx pass
    rx498_cur."!cursor_pass"(rx498_pos, "mod_ident:sym<ignorecase>")
    rx498_cur."!cursor_debug"("PASS  ", "mod_ident:sym<ignorecase>", " at pos=", rx498_pos)
    .return (rx498_cur)
  rx498_fail:
.annotate "line", 3
    (rx498_rep, rx498_pos, $I10, $P10) = rx498_cur."!mark_fail"(0)
    lt rx498_pos, -1, rx498_done
    eq rx498_pos, -1, rx498_fail
    jump $I10
  rx498_done:
    rx498_cur."!cursor_fail"()
    rx498_cur."!cursor_debug"("FAIL  ", "mod_ident:sym<ignorecase>")
    .return (rx498_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident:sym<ignorecase>"  :subid("153_1258897726.59476") :method
.annotate "line", 3
    new $P500, "ResizablePMCArray"
    push $P500, "i"
    .return ($P500)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ratchet>"  :subid("154_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx505_tgt
    .local int rx505_pos
    .local int rx505_off
    .local int rx505_eos
    .local int rx505_rep
    .local pmc rx505_cur
    (rx505_cur, rx505_pos, rx505_tgt, $I10) = self."!cursor_start"()
    rx505_cur."!cursor_debug"("START ", "mod_ident:sym<ratchet>")
    .lex unicode:"$\x{a2}", rx505_cur
    .local pmc match
    .lex "$/", match
    length rx505_eos, rx505_tgt
    set rx505_off, 0
    lt $I10, 2, rx505_start
    sub rx505_off, $I10, 1
    substr rx505_tgt, rx505_tgt, rx505_off
  rx505_start:
.annotate "line", 176
  # rx subcapture "sym"
    set_addr $I10, rxcap_508_fail
    rx505_cur."!mark_push"(0, rx505_pos, $I10)
  # rx literal  "r"
    add $I11, rx505_pos, 1
    gt $I11, rx505_eos, rx505_fail
    sub $I11, rx505_pos, rx505_off
    substr $S10, rx505_tgt, $I11, 1
    ne $S10, "r", rx505_fail
    add rx505_pos, 1
    set_addr $I10, rxcap_508_fail
    ($I12, $I11) = rx505_cur."!mark_peek"($I10)
    rx505_cur."!cursor_pos"($I11)
    ($P10) = rx505_cur."!cursor_start"()
    $P10."!cursor_pass"(rx505_pos, "")
    rx505_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_508_done
  rxcap_508_fail:
    goto rx505_fail
  rxcap_508_done:
  # rx rxquantr509 ** 0..1
    set_addr $I510, rxquantr509_done
    rx505_cur."!mark_push"(0, rx505_pos, $I510)
  rxquantr509_loop:
  # rx literal  "atchet"
    add $I11, rx505_pos, 6
    gt $I11, rx505_eos, rx505_fail
    sub $I11, rx505_pos, rx505_off
    substr $S10, rx505_tgt, $I11, 6
    ne $S10, "atchet", rx505_fail
    add rx505_pos, 6
    (rx505_rep) = rx505_cur."!mark_commit"($I510)
  rxquantr509_done:
  # rx pass
    rx505_cur."!cursor_pass"(rx505_pos, "mod_ident:sym<ratchet>")
    rx505_cur."!cursor_debug"("PASS  ", "mod_ident:sym<ratchet>", " at pos=", rx505_pos)
    .return (rx505_cur)
  rx505_fail:
.annotate "line", 3
    (rx505_rep, rx505_pos, $I10, $P10) = rx505_cur."!mark_fail"(0)
    lt rx505_pos, -1, rx505_done
    eq rx505_pos, -1, rx505_fail
    jump $I10
  rx505_done:
    rx505_cur."!cursor_fail"()
    rx505_cur."!cursor_debug"("FAIL  ", "mod_ident:sym<ratchet>")
    .return (rx505_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident:sym<ratchet>"  :subid("155_1258897726.59476") :method
.annotate "line", 3
    new $P507, "ResizablePMCArray"
    push $P507, "r"
    .return ($P507)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<sigspace>"  :subid("156_1258897726.59476") :method :outer("11_1258897726.59476")
.annotate "line", 3
    .local string rx512_tgt
    .local int rx512_pos
    .local int rx512_off
    .local int rx512_eos
    .local int rx512_rep
    .local pmc rx512_cur
    (rx512_cur, rx512_pos, rx512_tgt, $I10) = self."!cursor_start"()
    rx512_cur."!cursor_debug"("START ", "mod_ident:sym<sigspace>")
    .lex unicode:"$\x{a2}", rx512_cur
    .local pmc match
    .lex "$/", match
    length rx512_eos, rx512_tgt
    set rx512_off, 0
    lt $I10, 2, rx512_start
    sub rx512_off, $I10, 1
    substr rx512_tgt, rx512_tgt, rx512_off
  rx512_start:
.annotate "line", 177
  # rx subcapture "sym"
    set_addr $I10, rxcap_515_fail
    rx512_cur."!mark_push"(0, rx512_pos, $I10)
  # rx literal  "s"
    add $I11, rx512_pos, 1
    gt $I11, rx512_eos, rx512_fail
    sub $I11, rx512_pos, rx512_off
    substr $S10, rx512_tgt, $I11, 1
    ne $S10, "s", rx512_fail
    add rx512_pos, 1
    set_addr $I10, rxcap_515_fail
    ($I12, $I11) = rx512_cur."!mark_peek"($I10)
    rx512_cur."!cursor_pos"($I11)
    ($P10) = rx512_cur."!cursor_start"()
    $P10."!cursor_pass"(rx512_pos, "")
    rx512_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_515_done
  rxcap_515_fail:
    goto rx512_fail
  rxcap_515_done:
  # rx rxquantr516 ** 0..1
    set_addr $I517, rxquantr516_done
    rx512_cur."!mark_push"(0, rx512_pos, $I517)
  rxquantr516_loop:
  # rx literal  "igspace"
    add $I11, rx512_pos, 7
    gt $I11, rx512_eos, rx512_fail
    sub $I11, rx512_pos, rx512_off
    substr $S10, rx512_tgt, $I11, 7
    ne $S10, "igspace", rx512_fail
    add rx512_pos, 7
    (rx512_rep) = rx512_cur."!mark_commit"($I517)
  rxquantr516_done:
  # rx pass
    rx512_cur."!cursor_pass"(rx512_pos, "mod_ident:sym<sigspace>")
    rx512_cur."!cursor_debug"("PASS  ", "mod_ident:sym<sigspace>", " at pos=", rx512_pos)
    .return (rx512_cur)
  rx512_fail:
.annotate "line", 3
    (rx512_rep, rx512_pos, $I10, $P10) = rx512_cur."!mark_fail"(0)
    lt rx512_pos, -1, rx512_done
    eq rx512_pos, -1, rx512_fail
    jump $I10
  rx512_done:
    rx512_cur."!cursor_fail"()
    rx512_cur."!cursor_debug"("FAIL  ", "mod_ident:sym<sigspace>")
    .return (rx512_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident:sym<sigspace>"  :subid("157_1258897726.59476") :method
.annotate "line", 3
    new $P514, "ResizablePMCArray"
    push $P514, "s"
    .return ($P514)
.end

### .include 'gen/p6regex-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1258897733.2844")
.annotate "line", 0
    get_hll_global $P14, ["Regex";"P6Regex";"Actions"], "_block13" 
    capture_lex $P14
.annotate "line", 4
    get_hll_global $P14, ["Regex";"P6Regex";"Actions"], "_block13" 
    capture_lex $P14
    $P1554 = $P14()
.annotate "line", 1
    .return ($P1554)
.end


.namespace []
.sub "" :load :init :subid("post89") :outer("10_1258897733.2844")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1258897733.2844" 
    .local pmc block
    set block, $P12
    $P1555 = get_root_global ["parrot"], "P6metaclass"
    $P1555."new_class"("Regex::P6Regex::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block13"  :subid("11_1258897733.2844") :outer("10_1258897733.2844")
.annotate "line", 4
    .const 'Sub' $P1521 = "88_1258897733.2844" 
    capture_lex $P1521
    .const 'Sub' $P1452 = "84_1258897733.2844" 
    capture_lex $P1452
    .const 'Sub' $P1384 = "82_1258897733.2844" 
    capture_lex $P1384
    .const 'Sub' $P1311 = "79_1258897733.2844" 
    capture_lex $P1311
    .const 'Sub' $P1297 = "78_1258897733.2844" 
    capture_lex $P1297
    .const 'Sub' $P1273 = "77_1258897733.2844" 
    capture_lex $P1273
    .const 'Sub' $P1255 = "76_1258897733.2844" 
    capture_lex $P1255
    .const 'Sub' $P1241 = "75_1258897733.2844" 
    capture_lex $P1241
    .const 'Sub' $P1210 = "74_1258897733.2844" 
    capture_lex $P1210
    .const 'Sub' $P1179 = "73_1258897733.2844" 
    capture_lex $P1179
    .const 'Sub' $P1163 = "72_1258897733.2844" 
    capture_lex $P1163
    .const 'Sub' $P1147 = "71_1258897733.2844" 
    capture_lex $P1147
    .const 'Sub' $P1131 = "70_1258897733.2844" 
    capture_lex $P1131
    .const 'Sub' $P1115 = "69_1258897733.2844" 
    capture_lex $P1115
    .const 'Sub' $P1099 = "68_1258897733.2844" 
    capture_lex $P1099
    .const 'Sub' $P1083 = "67_1258897733.2844" 
    capture_lex $P1083
    .const 'Sub' $P1067 = "66_1258897733.2844" 
    capture_lex $P1067
    .const 'Sub' $P1043 = "65_1258897733.2844" 
    capture_lex $P1043
    .const 'Sub' $P1028 = "64_1258897733.2844" 
    capture_lex $P1028
    .const 'Sub' $P972 = "63_1258897733.2844" 
    capture_lex $P972
    .const 'Sub' $P951 = "62_1258897733.2844" 
    capture_lex $P951
    .const 'Sub' $P929 = "61_1258897733.2844" 
    capture_lex $P929
    .const 'Sub' $P919 = "60_1258897733.2844" 
    capture_lex $P919
    .const 'Sub' $P909 = "59_1258897733.2844" 
    capture_lex $P909
    .const 'Sub' $P899 = "58_1258897733.2844" 
    capture_lex $P899
    .const 'Sub' $P887 = "57_1258897733.2844" 
    capture_lex $P887
    .const 'Sub' $P875 = "56_1258897733.2844" 
    capture_lex $P875
    .const 'Sub' $P863 = "55_1258897733.2844" 
    capture_lex $P863
    .const 'Sub' $P851 = "54_1258897733.2844" 
    capture_lex $P851
    .const 'Sub' $P839 = "53_1258897733.2844" 
    capture_lex $P839
    .const 'Sub' $P827 = "52_1258897733.2844" 
    capture_lex $P827
    .const 'Sub' $P815 = "51_1258897733.2844" 
    capture_lex $P815
    .const 'Sub' $P803 = "50_1258897733.2844" 
    capture_lex $P803
    .const 'Sub' $P780 = "49_1258897733.2844" 
    capture_lex $P780
    .const 'Sub' $P757 = "48_1258897733.2844" 
    capture_lex $P757
    .const 'Sub' $P739 = "47_1258897733.2844" 
    capture_lex $P739
    .const 'Sub' $P729 = "46_1258897733.2844" 
    capture_lex $P729
    .const 'Sub' $P711 = "45_1258897733.2844" 
    capture_lex $P711
    .const 'Sub' $P664 = "44_1258897733.2844" 
    capture_lex $P664
    .const 'Sub' $P647 = "43_1258897733.2844" 
    capture_lex $P647
    .const 'Sub' $P632 = "42_1258897733.2844" 
    capture_lex $P632
    .const 'Sub' $P617 = "41_1258897733.2844" 
    capture_lex $P617
    .const 'Sub' $P591 = "40_1258897733.2844" 
    capture_lex $P591
    .const 'Sub' $P541 = "38_1258897733.2844" 
    capture_lex $P541
    .const 'Sub' $P473 = "36_1258897733.2844" 
    capture_lex $P473
    .const 'Sub' $P416 = "33_1258897733.2844" 
    capture_lex $P416
    .const 'Sub' $P401 = "32_1258897733.2844" 
    capture_lex $P401
    .const 'Sub' $P375 = "30_1258897733.2844" 
    capture_lex $P375
    .const 'Sub' $P358 = "29_1258897733.2844" 
    capture_lex $P358
    .const 'Sub' $P336 = "28_1258897733.2844" 
    capture_lex $P336
    .const 'Sub' $P304 = "27_1258897733.2844" 
    capture_lex $P304
    .const 'Sub' $P42 = "14_1258897733.2844" 
    capture_lex $P42
    .const 'Sub' $P21 = "13_1258897733.2844" 
    capture_lex $P21
    .const 'Sub' $P16 = "12_1258897733.2844" 
    capture_lex $P16
    get_global $P15, "@MODIFIERS"
    unless_null $P15, vivify_90
    new $P15, "ResizablePMCArray"
    set_global "@MODIFIERS", $P15
  vivify_90:
.annotate "line", 6
    .const 'Sub' $P16 = "12_1258897733.2844" 
    capture_lex $P16
    .lex "INIT", $P16
.annotate "line", 475
    .const 'Sub' $P21 = "13_1258897733.2844" 
    capture_lex $P21
    .lex "buildsub", $P21
.annotate "line", 488
    .const 'Sub' $P42 = "14_1258897733.2844" 
    capture_lex $P42
    .lex "capnames", $P42
.annotate "line", 554
    .const 'Sub' $P304 = "27_1258897733.2844" 
    capture_lex $P304
    .lex "backmod", $P304
.annotate "line", 561
    .const 'Sub' $P336 = "28_1258897733.2844" 
    capture_lex $P336
    .lex "subrule_alias", $P336
.annotate "line", 4
    get_global $P356, "@MODIFIERS"
    find_lex $P357, "INIT"
.annotate "line", 468
    find_lex $P1550, "buildsub"
    find_lex $P1551, "capnames"
    find_lex $P1552, "backmod"
    find_lex $P1553, "subrule_alias"
.annotate "line", 4
    .return ($P1553)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "INIT"  :subid("12_1258897733.2844") :outer("11_1258897733.2844")
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
.sub "buildsub"  :subid("13_1258897733.2844") :outer("11_1258897733.2844")
    .param pmc param_24
.annotate "line", 475
    new $P23, 'ExceptionHandler'
    set_addr $P23, control_22
    $P23."handle_types"(58)
    push_eh $P23
    .lex "$rpast", param_24
.annotate "line", 476
    new $P25, "Hash"
    .lex "%capnames", $P25
    find_lex $P26, "$rpast"
    $P27 = "capnames"($P26, 0)
    store_lex "%capnames", $P27
.annotate "line", 477
    new $P28, "Integer"
    assign $P28, 0
    find_lex $P29, "%capnames"
    unless_null $P29, vivify_91
    new $P29, "Hash"
    store_lex "%capnames", $P29
  vivify_91:
    set $P29[""], $P28
.annotate "line", 478
    get_hll_global $P30, ["PAST"], "Regex"
.annotate "line", 479
    get_hll_global $P31, ["PAST"], "Regex"
    $P32 = $P31."new"("scan" :named("pasttype"))
    find_lex $P33, "$rpast"
.annotate "line", 481
    get_hll_global $P34, ["PAST"], "Regex"
    $P35 = $P34."new"("pass" :named("pasttype"))
    find_lex $P36, "%capnames"
    $P37 = $P30."new"($P32, $P33, $P35, "concat" :named("pasttype"), $P36 :named("capnames"))
.annotate "line", 478
    store_lex "$rpast", $P37
.annotate "line", 485
    get_hll_global $P38, ["PAST"], "Block"
    find_lex $P39, "$rpast"
    $P40 = $P38."new"($P39, "method" :named("blocktype"))
.annotate "line", 475
    .return ($P40)
  control_22:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P41, exception, "payload"
    .return ($P41)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "capnames"  :subid("14_1258897733.2844") :outer("11_1258897733.2844")
    .param pmc param_45
    .param pmc param_46
.annotate "line", 488
    .const 'Sub' $P279 = "25_1258897733.2844" 
    capture_lex $P279
    .const 'Sub' $P214 = "22_1258897733.2844" 
    capture_lex $P214
    .const 'Sub' $P170 = "20_1258897733.2844" 
    capture_lex $P170
    .const 'Sub' $P128 = "18_1258897733.2844" 
    capture_lex $P128
    .const 'Sub' $P57 = "15_1258897733.2844" 
    capture_lex $P57
    new $P44, 'ExceptionHandler'
    set_addr $P44, control_43
    $P44."handle_types"(58)
    push_eh $P44
    .lex "$ast", param_45
    .lex "$count", param_46
.annotate "line", 489
    new $P47, "Hash"
    .lex "%capnames", $P47
.annotate "line", 490
    new $P48, "Undef"
    .lex "$pasttype", $P48
.annotate "line", 488
    find_lex $P49, "%capnames"
.annotate "line", 490
    find_lex $P50, "$ast"
    $P51 = $P50."pasttype"()
    store_lex "$pasttype", $P51
.annotate "line", 491
    find_lex $P53, "$pasttype"
    set $S54, $P53
    iseq $I55, $S54, "alt"
    if $I55, if_52
.annotate "line", 504
    find_lex $P119, "$pasttype"
    set $S120, $P119
    iseq $I121, $S120, "concat"
    if $I121, if_118
.annotate "line", 513
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
.annotate "line", 526
    find_lex $P210, "$pasttype"
    set $S211, $P210
    iseq $I212, $S211, "subcapture"
    if $I212, if_209
.annotate "line", 543
    find_lex $P275, "$pasttype"
    set $S276, $P275
    iseq $I277, $S276, "quant"
    unless $I277, if_274_end
    .const 'Sub' $P279 = "25_1258897733.2844" 
    capture_lex $P279
    $P279()
  if_274_end:
    goto if_209_end
  if_209:
.annotate "line", 526
    .const 'Sub' $P214 = "22_1258897733.2844" 
    capture_lex $P214
    $P214()
  if_209_end:
    goto if_160_end
  if_160:
.annotate "line", 513
    .const 'Sub' $P170 = "20_1258897733.2844" 
    capture_lex $P170
    $P170()
  if_160_end:
    goto if_118_end
  if_118:
.annotate "line", 505
    find_lex $P123, "$ast"
    $P124 = $P123."list"()
    defined $I125, $P124
    unless $I125, for_undef_112
    iter $P122, $P124
    new $P158, 'ExceptionHandler'
    set_addr $P158, loop157_handler
    $P158."handle_types"(65, 67, 66)
    push_eh $P158
  loop157_test:
    unless $P122, loop157_done
    shift $P126, $P122
  loop157_redo:
    .const 'Sub' $P128 = "18_1258897733.2844" 
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
  for_undef_112:
  if_118_end:
.annotate "line", 504
    goto if_52_end
  if_52:
.annotate "line", 491
    .const 'Sub' $P57 = "15_1258897733.2844" 
    capture_lex $P57
    $P57()
  if_52_end:
.annotate "line", 550
    find_lex $P300, "$count"
    find_lex $P301, "%capnames"
    unless_null $P301, vivify_132
    new $P301, "Hash"
    store_lex "%capnames", $P301
  vivify_132:
    set $P301[""], $P300
    find_lex $P302, "%capnames"
.annotate "line", 488
    .return ($P302)
  control_43:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P303, exception, "payload"
    .return ($P303)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block278"  :anon :subid("25_1258897733.2844") :outer("14_1258897733.2844")
.annotate "line", 543
    .const 'Sub' $P290 = "26_1258897733.2844" 
    capture_lex $P290
.annotate "line", 544
    new $P280, "Hash"
    .lex "%astcap", $P280
    find_lex $P281, "$ast"
    unless_null $P281, vivify_92
    new $P281, "ResizablePMCArray"
  vivify_92:
    set $P282, $P281[0]
    unless_null $P282, vivify_93
    new $P282, "Undef"
  vivify_93:
    find_lex $P283, "$count"
    $P284 = "capnames"($P282, $P283)
    store_lex "%astcap", $P284
.annotate "line", 545
    find_lex $P286, "%astcap"
    defined $I287, $P286
    unless $I287, for_undef_94
    iter $P285, $P286
    new $P296, 'ExceptionHandler'
    set_addr $P296, loop295_handler
    $P296."handle_types"(65, 67, 66)
    push_eh $P296
  loop295_test:
    unless $P285, loop295_done
    shift $P288, $P285
  loop295_redo:
    .const 'Sub' $P290 = "26_1258897733.2844" 
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
  for_undef_94:
.annotate "line", 548
    find_lex $P298, "%astcap"
    unless_null $P298, vivify_96
    new $P298, "Hash"
  vivify_96:
    set $P299, $P298[""]
    unless_null $P299, vivify_97
    new $P299, "Undef"
  vivify_97:
    store_lex "$count", $P299
.annotate "line", 543
    .return ($P299)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block289"  :anon :subid("26_1258897733.2844") :outer("25_1258897733.2844")
    .param pmc param_291
.annotate "line", 545
    .lex "$_", param_291
.annotate "line", 546
    new $P292, "Integer"
    assign $P292, 2
    find_lex $P293, "$_"
    find_lex $P294, "%capnames"
    unless_null $P294, vivify_95
    new $P294, "Hash"
    store_lex "%capnames", $P294
  vivify_95:
    set $P294[$P293], $P292
.annotate "line", 545
    .return ($P292)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block213"  :anon :subid("22_1258897733.2844") :outer("14_1258897733.2844")
.annotate "line", 526
    .const 'Sub' $P256 = "24_1258897733.2844" 
    capture_lex $P256
    .const 'Sub' $P226 = "23_1258897733.2844" 
    capture_lex $P226
.annotate "line", 527
    new $P215, "Undef"
    .lex "$name", $P215
.annotate "line", 528
    new $P216, "ResizablePMCArray"
    .lex "@names", $P216
.annotate "line", 537
    new $P217, "Hash"
    .lex "%x", $P217
.annotate "line", 527
    find_lex $P218, "$ast"
    $P219 = $P218."name"()
    store_lex "$name", $P219
.annotate "line", 528

            $P0 = find_lex '$name'
            $S0 = $P0
            $P220 = split '=', $S0
        
    store_lex "@names", $P220
.annotate "line", 533
    find_lex $P222, "@names"
    defined $I223, $P222
    unless $I223, for_undef_98
    iter $P221, $P222
    new $P245, 'ExceptionHandler'
    set_addr $P245, loop244_handler
    $P245."handle_types"(65, 67, 66)
    push_eh $P245
  loop244_test:
    unless $P221, loop244_done
    shift $P224, $P221
  loop244_redo:
    .const 'Sub' $P226 = "23_1258897733.2844" 
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
  for_undef_98:
.annotate "line", 537
    find_lex $P247, "$ast"
    unless_null $P247, vivify_100
    new $P247, "ResizablePMCArray"
  vivify_100:
    set $P248, $P247[0]
    unless_null $P248, vivify_101
    new $P248, "Undef"
  vivify_101:
    find_lex $P249, "$count"
    $P250 = "capnames"($P248, $P249)
    store_lex "%x", $P250
.annotate "line", 538
    find_lex $P252, "%x"
    defined $I253, $P252
    unless $I253, for_undef_102
    iter $P251, $P252
    new $P270, 'ExceptionHandler'
    set_addr $P270, loop269_handler
    $P270."handle_types"(65, 67, 66)
    push_eh $P270
  loop269_test:
    unless $P251, loop269_done
    shift $P254, $P251
  loop269_redo:
    .const 'Sub' $P256 = "24_1258897733.2844" 
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
  for_undef_102:
.annotate "line", 541
    find_lex $P272, "%x"
    unless_null $P272, vivify_108
    new $P272, "Hash"
  vivify_108:
    set $P273, $P272[""]
    unless_null $P273, vivify_109
    new $P273, "Undef"
  vivify_109:
    store_lex "$count", $P273
.annotate "line", 526
    .return ($P273)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block225"  :anon :subid("23_1258897733.2844") :outer("22_1258897733.2844")
    .param pmc param_227
.annotate "line", 533
    .lex "$_", param_227
.annotate "line", 534
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
.annotate "line", 535
    new $P241, "Integer"
    assign $P241, 1
    find_lex $P242, "$_"
    find_lex $P243, "%capnames"
    unless_null $P243, vivify_99
    new $P243, "Hash"
    store_lex "%capnames", $P243
  vivify_99:
    set $P243[$P242], $P241
.annotate "line", 533
    .return ($P241)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block255"  :anon :subid("24_1258897733.2844") :outer("22_1258897733.2844")
    .param pmc param_257
.annotate "line", 538
    .lex "$_", param_257
.annotate "line", 539
    find_lex $P258, "$_"
    find_lex $P259, "%capnames"
    unless_null $P259, vivify_103
    new $P259, "Hash"
  vivify_103:
    set $P260, $P259[$P258]
    unless_null $P260, vivify_104
    new $P260, "Undef"
  vivify_104:
    set $N261, $P260
    new $P262, 'Float'
    set $P262, $N261
    find_lex $P263, "$_"
    find_lex $P264, "%x"
    unless_null $P264, vivify_105
    new $P264, "Hash"
  vivify_105:
    set $P265, $P264[$P263]
    unless_null $P265, vivify_106
    new $P265, "Undef"
  vivify_106:
    add $P266, $P262, $P265
    find_lex $P267, "$_"
    find_lex $P268, "%capnames"
    unless_null $P268, vivify_107
    new $P268, "Hash"
    store_lex "%capnames", $P268
  vivify_107:
    set $P268[$P267], $P266
.annotate "line", 538
    .return ($P266)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block169"  :anon :subid("20_1258897733.2844") :outer("14_1258897733.2844")
.annotate "line", 513
    .const 'Sub' $P188 = "21_1258897733.2844" 
    capture_lex $P188
.annotate "line", 514
    new $P171, "Undef"
    .lex "$name", $P171
.annotate "line", 516
    new $P172, "ResizablePMCArray"
    .lex "@names", $P172
.annotate "line", 514
    find_lex $P173, "$ast"
    $P174 = $P173."name"()
    store_lex "$name", $P174
.annotate "line", 515
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
.annotate "line", 516

            $P0 = find_lex '$name'
            $S0 = $P0
            $P182 = split '=', $S0
        
    store_lex "@names", $P182
.annotate "line", 521
    find_lex $P184, "@names"
    defined $I185, $P184
    unless $I185, for_undef_110
    iter $P183, $P184
    new $P207, 'ExceptionHandler'
    set_addr $P207, loop206_handler
    $P207."handle_types"(65, 67, 66)
    push_eh $P207
  loop206_test:
    unless $P183, loop206_done
    shift $P186, $P183
  loop206_redo:
    .const 'Sub' $P188 = "21_1258897733.2844" 
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
  for_undef_110:
.annotate "line", 513
    .return ($P183)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block187"  :anon :subid("21_1258897733.2844") :outer("20_1258897733.2844")
    .param pmc param_189
.annotate "line", 521
    .lex "$_", param_189
.annotate "line", 522
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
.annotate "line", 523
    new $P203, "Integer"
    assign $P203, 1
    find_lex $P204, "$_"
    find_lex $P205, "%capnames"
    unless_null $P205, vivify_111
    new $P205, "Hash"
    store_lex "%capnames", $P205
  vivify_111:
    set $P205[$P204], $P203
.annotate "line", 521
    .return ($P203)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block127"  :anon :subid("18_1258897733.2844") :outer("14_1258897733.2844")
    .param pmc param_130
.annotate "line", 505
    .const 'Sub' $P139 = "19_1258897733.2844" 
    capture_lex $P139
.annotate "line", 506
    new $P129, "Hash"
    .lex "%x", $P129
    .lex "$_", param_130
    find_lex $P131, "$_"
    find_lex $P132, "$count"
    $P133 = "capnames"($P131, $P132)
    store_lex "%x", $P133
.annotate "line", 507
    find_lex $P135, "%x"
    defined $I136, $P135
    unless $I136, for_undef_113
    iter $P134, $P135
    new $P153, 'ExceptionHandler'
    set_addr $P153, loop152_handler
    $P153."handle_types"(65, 67, 66)
    push_eh $P153
  loop152_test:
    unless $P134, loop152_done
    shift $P137, $P134
  loop152_redo:
    .const 'Sub' $P139 = "19_1258897733.2844" 
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
  for_undef_113:
.annotate "line", 510
    find_lex $P155, "%x"
    unless_null $P155, vivify_119
    new $P155, "Hash"
  vivify_119:
    set $P156, $P155[""]
    unless_null $P156, vivify_120
    new $P156, "Undef"
  vivify_120:
    store_lex "$count", $P156
.annotate "line", 505
    .return ($P156)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block138"  :anon :subid("19_1258897733.2844") :outer("18_1258897733.2844")
    .param pmc param_140
.annotate "line", 507
    .lex "$_", param_140
.annotate "line", 508
    find_lex $P141, "$_"
    find_lex $P142, "%capnames"
    unless_null $P142, vivify_114
    new $P142, "Hash"
  vivify_114:
    set $P143, $P142[$P141]
    unless_null $P143, vivify_115
    new $P143, "Undef"
  vivify_115:
    set $N144, $P143
    new $P145, 'Float'
    set $P145, $N144
    find_lex $P146, "$_"
    find_lex $P147, "%x"
    unless_null $P147, vivify_116
    new $P147, "Hash"
  vivify_116:
    set $P148, $P147[$P146]
    unless_null $P148, vivify_117
    new $P148, "Undef"
  vivify_117:
    add $P149, $P145, $P148
    find_lex $P150, "$_"
    find_lex $P151, "%capnames"
    unless_null $P151, vivify_118
    new $P151, "Hash"
    store_lex "%capnames", $P151
  vivify_118:
    set $P151[$P150], $P149
.annotate "line", 507
    .return ($P149)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block56"  :anon :subid("15_1258897733.2844") :outer("14_1258897733.2844")
.annotate "line", 491
    .const 'Sub' $P66 = "16_1258897733.2844" 
    capture_lex $P66
.annotate "line", 492
    new $P58, "Undef"
    .lex "$max", $P58
    find_lex $P59, "$count"
    store_lex "$max", $P59
.annotate "line", 493
    find_lex $P61, "$ast"
    $P62 = $P61."list"()
    defined $I63, $P62
    unless $I63, for_undef_121
    iter $P60, $P62
    new $P115, 'ExceptionHandler'
    set_addr $P115, loop114_handler
    $P115."handle_types"(65, 67, 66)
    push_eh $P115
  loop114_test:
    unless $P60, loop114_done
    shift $P64, $P60
  loop114_redo:
    .const 'Sub' $P66 = "16_1258897733.2844" 
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
  for_undef_121:
.annotate "line", 502
    find_lex $P117, "$max"
    store_lex "$count", $P117
.annotate "line", 491
    .return ($P117)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block65"  :anon :subid("16_1258897733.2844") :outer("15_1258897733.2844")
    .param pmc param_68
.annotate "line", 493
    .const 'Sub' $P77 = "17_1258897733.2844" 
    capture_lex $P77
.annotate "line", 494
    new $P67, "Hash"
    .lex "%x", $P67
    .lex "$_", param_68
    find_lex $P69, "$_"
    find_lex $P70, "$count"
    $P71 = "capnames"($P69, $P70)
    store_lex "%x", $P71
.annotate "line", 495
    find_lex $P73, "%x"
    defined $I74, $P73
    unless $I74, for_undef_122
    iter $P72, $P73
    new $P102, 'ExceptionHandler'
    set_addr $P102, loop101_handler
    $P102."handle_types"(65, 67, 66)
    push_eh $P102
  loop101_test:
    unless $P72, loop101_done
    shift $P75, $P72
  loop101_redo:
    .const 'Sub' $P77 = "17_1258897733.2844" 
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
  for_undef_122:
.annotate "line", 500
    find_lex $P106, "%x"
    unless_null $P106, vivify_128
    new $P106, "Hash"
  vivify_128:
    set $P107, $P106[""]
    unless_null $P107, vivify_129
    new $P107, "Undef"
  vivify_129:
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
    unless_null $P112, vivify_130
    new $P112, "Hash"
  vivify_130:
    set $P113, $P112[""]
    unless_null $P113, vivify_131
    new $P113, "Undef"
  vivify_131:
    store_lex "$max", $P113
    set $P104, $P113
  if_105_end:
.annotate "line", 493
    .return ($P104)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block76"  :anon :subid("17_1258897733.2844") :outer("16_1258897733.2844")
    .param pmc param_78
.annotate "line", 495
    .lex "$_", param_78
.annotate "line", 496
    find_lex $P83, "$_"
    find_lex $P84, "%capnames"
    unless_null $P84, vivify_123
    new $P84, "Hash"
  vivify_123:
    set $P85, $P84[$P83]
    unless_null $P85, vivify_124
    new $P85, "Undef"
  vivify_124:
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
    unless_null $P91, vivify_125
    new $P91, "Hash"
  vivify_125:
    set $P92, $P91[$P90]
    unless_null $P92, vivify_126
    new $P92, "Undef"
  vivify_126:
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
.annotate "line", 497
    find_lex $P99, "$_"
    find_lex $P100, "%capnames"
    unless_null $P100, vivify_127
    new $P100, "Hash"
    store_lex "%capnames", $P100
  vivify_127:
    set $P100[$P99], $P79
.annotate "line", 495
    .return ($P79)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backmod"  :subid("27_1258897733.2844") :outer("11_1258897733.2844")
    .param pmc param_307
    .param pmc param_308
.annotate "line", 554
    new $P306, 'ExceptionHandler'
    set_addr $P306, control_305
    $P306."handle_types"(58)
    push_eh $P306
    .lex "$ast", param_307
    .lex "$backmod", param_308
.annotate "line", 555
    find_lex $P310, "$backmod"
    set $S311, $P310
    iseq $I312, $S311, ":"
    if $I312, if_309
.annotate "line", 556
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
.annotate "line", 557
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
.annotate "line", 556
    find_lex $P323, "$ast"
    $P323."backtrack"("f")
  if_314_end:
    goto if_309_end
  if_309:
.annotate "line", 555
    find_lex $P313, "$ast"
    $P313."backtrack"("r")
  if_309_end:
    find_lex $P334, "$ast"
.annotate "line", 554
    .return ($P334)
  control_305:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P335, exception, "payload"
    .return ($P335)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "subrule_alias"  :subid("28_1258897733.2844") :outer("11_1258897733.2844")
    .param pmc param_339
    .param pmc param_340
.annotate "line", 561
    new $P338, 'ExceptionHandler'
    set_addr $P338, control_337
    $P338."handle_types"(58)
    push_eh $P338
    .lex "$past", param_339
    .lex "$name", param_340
.annotate "line", 562
    find_lex $P342, "$past"
    $S343 = $P342."name"()
    isgt $I344, $S343, ""
    if $I344, if_341
.annotate "line", 563
    find_lex $P351, "$past"
    find_lex $P352, "$name"
    $P351."name"($P352)
    goto if_341_end
  if_341:
.annotate "line", 562
    find_lex $P345, "$past"
    find_lex $P346, "$name"
    concat $P347, $P346, "="
    find_lex $P348, "$past"
    $S349 = $P348."name"()
    concat $P350, $P347, $S349
    $P345."name"($P350)
  if_341_end:
.annotate "line", 564
    find_lex $P353, "$past"
    $P354 = $P353."subtype"("capture")
.annotate "line", 561
    .return ($P354)
  control_337:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P355, exception, "payload"
    .return ($P355)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "arg"  :subid("29_1258897733.2844") :method :outer("11_1258897733.2844")
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
    unless_null $P365, vivify_133
    new $P365, "Hash"
  vivify_133:
    set $P366, $P365["quote_EXPR"]
    unless_null $P366, vivify_134
    new $P366, "Undef"
  vivify_134:
    if $P366, if_364
    find_lex $P370, "$/"
    unless_null $P370, vivify_135
    new $P370, "Hash"
  vivify_135:
    set $P371, $P370["val"]
    unless_null $P371, vivify_136
    new $P371, "Undef"
  vivify_136:
    set $N372, $P371
    new $P363, 'Float'
    set $P363, $N372
    goto if_364_end
  if_364:
    find_lex $P367, "$/"
    unless_null $P367, vivify_137
    new $P367, "Hash"
  vivify_137:
    set $P368, $P367["quote_EXPR"]
    unless_null $P368, vivify_138
    new $P368, "Undef"
  vivify_138:
    $P369 = $P368."ast"()
    set $P363, $P369
  if_364_end:
    $P373 = $P362."!make"($P363)
.annotate "line", 14
    .return ($P373)
  control_359:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P374, exception, "payload"
    .return ($P374)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "arglist"  :subid("30_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_378
.annotate "line", 18
    .const 'Sub' $P388 = "31_1258897733.2844" 
    capture_lex $P388
    new $P377, 'ExceptionHandler'
    set_addr $P377, control_376
    $P377."handle_types"(58)
    push_eh $P377
    .lex "self", self
    .lex "$/", param_378
.annotate "line", 19
    new $P379, "Undef"
    .lex "$past", $P379
    get_hll_global $P380, ["PAST"], "Op"
    $P381 = $P380."new"("list" :named("pasttype"))
    store_lex "$past", $P381
.annotate "line", 20
    find_lex $P383, "$/"
    unless_null $P383, vivify_139
    new $P383, "Hash"
  vivify_139:
    set $P384, $P383["arg"]
    unless_null $P384, vivify_140
    new $P384, "Undef"
  vivify_140:
    defined $I385, $P384
    unless $I385, for_undef_141
    iter $P382, $P384
    new $P395, 'ExceptionHandler'
    set_addr $P395, loop394_handler
    $P395."handle_types"(65, 67, 66)
    push_eh $P395
  loop394_test:
    unless $P382, loop394_done
    shift $P386, $P382
  loop394_redo:
    .const 'Sub' $P388 = "31_1258897733.2844" 
    capture_lex $P388
    $P388($P386)
  loop394_next:
    goto loop394_test
  loop394_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P396, exception, 'type'
    eq $P396, 65, loop394_next
    eq $P396, 67, loop394_redo
  loop394_done:
    pop_eh 
  for_undef_141:
.annotate "line", 21
    find_lex $P397, "$/"
    find_lex $P398, "$past"
    $P399 = $P397."!make"($P398)
.annotate "line", 18
    .return ($P399)
  control_376:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P400, exception, "payload"
    .return ($P400)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block387"  :anon :subid("31_1258897733.2844") :outer("30_1258897733.2844")
    .param pmc param_389
.annotate "line", 20
    .lex "$_", param_389
    find_lex $P390, "$past"
    find_lex $P391, "$_"
    $P392 = $P391."ast"()
    $P393 = $P390."push"($P392)
    .return ($P393)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "TOP"  :subid("32_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_404
.annotate "line", 24
    new $P403, 'ExceptionHandler'
    set_addr $P403, control_402
    $P403."handle_types"(58)
    push_eh $P403
    .lex "self", self
    .lex "$/", param_404
.annotate "line", 25
    new $P405, "Undef"
    .lex "$past", $P405
    find_lex $P406, "$/"
    unless_null $P406, vivify_142
    new $P406, "Hash"
  vivify_142:
    set $P407, $P406["nibbler"]
    unless_null $P407, vivify_143
    new $P407, "Undef"
  vivify_143:
    $P408 = $P407."ast"()
    $P409 = "buildsub"($P408)
    store_lex "$past", $P409
.annotate "line", 26
    find_lex $P410, "$past"
    find_lex $P411, "$/"
    $P410."node"($P411)
.annotate "line", 27
    find_lex $P412, "$/"
    find_lex $P413, "$past"
    $P414 = $P412."!make"($P413)
.annotate "line", 24
    .return ($P414)
  control_402:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P415, exception, "payload"
    .return ($P415)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "nibbler"  :subid("33_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_419
    .param pmc param_420 :optional
    .param int has_param_420 :opt_flag
.annotate "line", 30
    .const 'Sub' $P456 = "35_1258897733.2844" 
    capture_lex $P456
    .const 'Sub' $P428 = "34_1258897733.2844" 
    capture_lex $P428
    new $P418, 'ExceptionHandler'
    set_addr $P418, control_417
    $P418."handle_types"(58)
    push_eh $P418
    .lex "self", self
    .lex "$/", param_419
    if has_param_420, optparam_144
    new $P421, "Undef"
    set param_420, $P421
  optparam_144:
    .lex "$key", param_420
.annotate "line", 42
    new $P422, "Undef"
    .lex "$past", $P422
.annotate "line", 31
    find_lex $P424, "$key"
    set $S425, $P424
    iseq $I426, $S425, "open"
    unless $I426, if_423_end
    .const 'Sub' $P428 = "34_1258897733.2844" 
    capture_lex $P428
    $P428()
  if_423_end:
.annotate "line", 41
    get_global $P438, "@MODIFIERS"
    $P438."shift"()
    find_lex $P439, "$past"
.annotate "line", 43
    find_lex $P441, "$/"
    unless_null $P441, vivify_147
    new $P441, "Hash"
  vivify_147:
    set $P442, $P441["termish"]
    unless_null $P442, vivify_148
    new $P442, "Undef"
  vivify_148:
    set $N443, $P442
    new $P444, "Integer"
    assign $P444, 1
    set $N445, $P444
    isgt $I446, $N443, $N445
    if $I446, if_440
.annotate "line", 50
    find_lex $P465, "$/"
    unless_null $P465, vivify_149
    new $P465, "Hash"
  vivify_149:
    set $P466, $P465["termish"]
    unless_null $P466, vivify_150
    new $P466, "ResizablePMCArray"
  vivify_150:
    set $P467, $P466[0]
    unless_null $P467, vivify_151
    new $P467, "Undef"
  vivify_151:
    $P468 = $P467."ast"()
    store_lex "$past", $P468
.annotate "line", 49
    goto if_440_end
  if_440:
.annotate "line", 44
    get_hll_global $P447, ["PAST"], "Regex"
    find_lex $P448, "$/"
    $P449 = $P447."new"("alt" :named("pasttype"), $P448 :named("node"))
    store_lex "$past", $P449
.annotate "line", 45
    find_lex $P451, "$/"
    unless_null $P451, vivify_152
    new $P451, "Hash"
  vivify_152:
    set $P452, $P451["termish"]
    unless_null $P452, vivify_153
    new $P452, "Undef"
  vivify_153:
    defined $I453, $P452
    unless $I453, for_undef_154
    iter $P450, $P452
    new $P463, 'ExceptionHandler'
    set_addr $P463, loop462_handler
    $P463."handle_types"(65, 67, 66)
    push_eh $P463
  loop462_test:
    unless $P450, loop462_done
    shift $P454, $P450
  loop462_redo:
    .const 'Sub' $P456 = "35_1258897733.2844" 
    capture_lex $P456
    $P456($P454)
  loop462_next:
    goto loop462_test
  loop462_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P464, exception, 'type'
    eq $P464, 65, loop462_next
    eq $P464, 67, loop462_redo
  loop462_done:
    pop_eh 
  for_undef_154:
  if_440_end:
.annotate "line", 52
    find_lex $P469, "$/"
    find_lex $P470, "$past"
    $P471 = $P469."!make"($P470)
.annotate "line", 30
    .return ($P471)
  control_417:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P472, exception, "payload"
    .return ($P472)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block427"  :anon :subid("34_1258897733.2844") :outer("33_1258897733.2844")
.annotate "line", 32
    new $P429, "Hash"
    .lex "%old", $P429
.annotate "line", 33
    new $P430, "Hash"
    .lex "%new", $P430
.annotate "line", 32
    get_global $P431, "@MODIFIERS"
    unless_null $P431, vivify_145
    new $P431, "ResizablePMCArray"
  vivify_145:
    set $P432, $P431[0]
    unless_null $P432, vivify_146
    new $P432, "Undef"
  vivify_146:
    store_lex "%old", $P432
.annotate "line", 33

                       $P0 = find_lex '%old'
                       $P433 = clone $P0
                   
    store_lex "%new", $P433
.annotate "line", 37
    get_global $P434, "@MODIFIERS"
    find_lex $P435, "%new"
    $P434."unshift"($P435)
.annotate "line", 38
    new $P436, "Exception"
    set $P436['type'], 58
    new $P437, "Integer"
    assign $P437, 1
    setattribute $P436, 'payload', $P437
    throw $P436
.annotate "line", 31
    .return ()
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block455"  :anon :subid("35_1258897733.2844") :outer("33_1258897733.2844")
    .param pmc param_457
.annotate "line", 45
    .lex "$_", param_457
.annotate "line", 46
    find_lex $P458, "$past"
    find_lex $P459, "$_"
    $P460 = $P459."ast"()
    $P461 = $P458."push"($P460)
.annotate "line", 45
    .return ($P461)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "termish"  :subid("36_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_476
.annotate "line", 55
    .const 'Sub' $P489 = "37_1258897733.2844" 
    capture_lex $P489
    new $P475, 'ExceptionHandler'
    set_addr $P475, control_474
    $P475."handle_types"(58)
    push_eh $P475
    .lex "self", self
    .lex "$/", param_476
.annotate "line", 56
    new $P477, "Undef"
    .lex "$past", $P477
.annotate "line", 57
    new $P478, "Undef"
    .lex "$lastlit", $P478
.annotate "line", 56
    get_hll_global $P479, ["PAST"], "Regex"
    find_lex $P480, "$/"
    $P481 = $P479."new"("concat" :named("pasttype"), $P480 :named("node"))
    store_lex "$past", $P481
.annotate "line", 57
    new $P482, "Integer"
    assign $P482, 0
    store_lex "$lastlit", $P482
.annotate "line", 58
    find_lex $P484, "$/"
    unless_null $P484, vivify_155
    new $P484, "Hash"
  vivify_155:
    set $P485, $P484["noun"]
    unless_null $P485, vivify_156
    new $P485, "Undef"
  vivify_156:
    defined $I486, $P485
    unless $I486, for_undef_157
    iter $P483, $P485
    new $P535, 'ExceptionHandler'
    set_addr $P535, loop534_handler
    $P535."handle_types"(65, 67, 66)
    push_eh $P535
  loop534_test:
    unless $P483, loop534_done
    shift $P487, $P483
  loop534_redo:
    .const 'Sub' $P489 = "37_1258897733.2844" 
    capture_lex $P489
    $P489($P487)
  loop534_next:
    goto loop534_test
  loop534_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P536, exception, 'type'
    eq $P536, 65, loop534_next
    eq $P536, 67, loop534_redo
  loop534_done:
    pop_eh 
  for_undef_157:
.annotate "line", 73
    find_lex $P537, "$/"
    find_lex $P538, "$past"
    $P539 = $P537."!make"($P538)
.annotate "line", 55
    .return ($P539)
  control_474:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P540, exception, "payload"
    .return ($P540)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block488"  :anon :subid("37_1258897733.2844") :outer("36_1258897733.2844")
    .param pmc param_491
.annotate "line", 59
    new $P490, "Undef"
    .lex "$ast", $P490
    .lex "$_", param_491
    find_lex $P492, "$_"
    $P493 = $P492."ast"()
    store_lex "$ast", $P493
.annotate "line", 60
    find_lex $P496, "$ast"
    if $P496, if_495
    set $P494, $P496
    goto if_495_end
  if_495:
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
    set $P499, $P501
    goto if_500_end
  if_500:
.annotate "line", 62
    get_hll_global $P507, ["PAST"], "Node"
    find_lex $P508, "$ast"
    unless_null $P508, vivify_158
    new $P508, "ResizablePMCArray"
  vivify_158:
    set $P509, $P508[0]
    unless_null $P509, vivify_159
    new $P509, "Undef"
  vivify_159:
    $P510 = $P507."ACCEPTS"($P509)
    isfalse $I511, $P510
    new $P499, 'Integer'
    set $P499, $I511
  if_500_end:
    if $P499, if_498
.annotate "line", 66
    find_lex $P518, "$past"
    find_lex $P519, "$ast"
    $P518."push"($P519)
.annotate "line", 67
    find_lex $P524, "$ast"
    $S525 = $P524."pasttype"()
    iseq $I526, $S525, "literal"
    if $I526, if_523
    new $P522, 'Integer'
    set $P522, $I526
    goto if_523_end
  if_523:
.annotate "line", 68
    get_hll_global $P527, ["PAST"], "Node"
    find_lex $P528, "$ast"
    unless_null $P528, vivify_160
    new $P528, "ResizablePMCArray"
  vivify_160:
    set $P529, $P528[0]
    unless_null $P529, vivify_161
    new $P529, "Undef"
  vivify_161:
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
.annotate "line", 69
    store_lex "$lastlit", $P520
.annotate "line", 65
    set $P497, $P520
.annotate "line", 62
    goto if_498_end
  if_498:
.annotate "line", 63
    find_lex $P512, "$lastlit"
    unless_null $P512, vivify_162
    new $P512, "ResizablePMCArray"
  vivify_162:
    set $P513, $P512[0]
    unless_null $P513, vivify_163
    new $P513, "Undef"
  vivify_163:
    find_lex $P514, "$ast"
    unless_null $P514, vivify_164
    new $P514, "ResizablePMCArray"
  vivify_164:
    set $P515, $P514[0]
    unless_null $P515, vivify_165
    new $P515, "Undef"
  vivify_165:
    concat $P516, $P513, $P515
    find_lex $P517, "$lastlit"
    unless_null $P517, vivify_166
    new $P517, "ResizablePMCArray"
    store_lex "$lastlit", $P517
  vivify_166:
    set $P517[0], $P516
.annotate "line", 62
    set $P497, $P516
  if_498_end:
.annotate "line", 60
    set $P494, $P497
  if_495_end:
.annotate "line", 58
    .return ($P494)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantified_atom"  :subid("38_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_544
.annotate "line", 76
    .const 'Sub' $P553 = "39_1258897733.2844" 
    capture_lex $P553
    new $P543, 'ExceptionHandler'
    set_addr $P543, control_542
    $P543."handle_types"(58)
    push_eh $P543
    .lex "self", self
    .lex "$/", param_544
.annotate "line", 77
    new $P545, "Undef"
    .lex "$past", $P545
    find_lex $P546, "$/"
    unless_null $P546, vivify_167
    new $P546, "Hash"
  vivify_167:
    set $P547, $P546["atom"]
    unless_null $P547, vivify_168
    new $P547, "Undef"
  vivify_168:
    $P548 = $P547."ast"()
    store_lex "$past", $P548
.annotate "line", 78
    find_lex $P550, "$/"
    unless_null $P550, vivify_169
    new $P550, "Hash"
  vivify_169:
    set $P551, $P550["quantifier"]
    unless_null $P551, vivify_170
    new $P551, "Undef"
  vivify_170:
    if $P551, if_549
.annotate "line", 84
    find_lex $P567, "$/"
    unless_null $P567, vivify_171
    new $P567, "Hash"
  vivify_171:
    set $P568, $P567["backmod"]
    unless_null $P568, vivify_172
    new $P568, "ResizablePMCArray"
  vivify_172:
    set $P569, $P568[0]
    unless_null $P569, vivify_173
    new $P569, "Undef"
  vivify_173:
    unless $P569, if_566_end
    find_lex $P570, "$past"
    find_lex $P571, "$/"
    unless_null $P571, vivify_174
    new $P571, "Hash"
  vivify_174:
    set $P572, $P571["backmod"]
    unless_null $P572, vivify_175
    new $P572, "ResizablePMCArray"
  vivify_175:
    set $P573, $P572[0]
    unless_null $P573, vivify_176
    new $P573, "Undef"
  vivify_176:
    "backmod"($P570, $P573)
  if_566_end:
    goto if_549_end
  if_549:
.annotate "line", 78
    .const 'Sub' $P553 = "39_1258897733.2844" 
    capture_lex $P553
    $P553()
  if_549_end:
.annotate "line", 85
    find_lex $P579, "$past"
    if $P579, if_578
    set $P577, $P579
    goto if_578_end
  if_578:
    find_lex $P580, "$past"
    $P581 = $P580."backtrack"()
    isfalse $I582, $P581
    new $P577, 'Integer'
    set $P577, $I582
  if_578_end:
    if $P577, if_576
    set $P575, $P577
    goto if_576_end
  if_576:
    get_global $P583, "@MODIFIERS"
    unless_null $P583, vivify_180
    new $P583, "ResizablePMCArray"
  vivify_180:
    set $P584, $P583[0]
    unless_null $P584, vivify_181
    new $P584, "Hash"
  vivify_181:
    set $P585, $P584["r"]
    unless_null $P585, vivify_182
    new $P585, "Undef"
  vivify_182:
    set $P575, $P585
  if_576_end:
    unless $P575, if_574_end
.annotate "line", 86
    find_lex $P586, "$past"
    $P586."backtrack"("r")
  if_574_end:
.annotate "line", 88
    find_lex $P587, "$/"
    find_lex $P588, "$past"
    $P589 = $P587."!make"($P588)
.annotate "line", 76
    .return ($P589)
  control_542:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P590, exception, "payload"
    .return ($P590)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block552"  :anon :subid("39_1258897733.2844") :outer("38_1258897733.2844")
.annotate "line", 80
    new $P554, "Undef"
    .lex "$qast", $P554
.annotate "line", 79
    find_lex $P556, "$past"
    isfalse $I557, $P556
    unless $I557, if_555_end
    find_lex $P558, "$/"
    $P558."panic"("Can't quantify zero-width atom")
  if_555_end:
.annotate "line", 80
    find_lex $P559, "$/"
    unless_null $P559, vivify_177
    new $P559, "Hash"
  vivify_177:
    set $P560, $P559["quantifier"]
    unless_null $P560, vivify_178
    new $P560, "ResizablePMCArray"
  vivify_178:
    set $P561, $P560[0]
    unless_null $P561, vivify_179
    new $P561, "Undef"
  vivify_179:
    $P562 = $P561."ast"()
    store_lex "$qast", $P562
.annotate "line", 81
    find_lex $P563, "$qast"
    find_lex $P564, "$past"
    $P563."unshift"($P564)
.annotate "line", 82
    find_lex $P565, "$qast"
    store_lex "$past", $P565
.annotate "line", 78
    .return ($P565)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "atom"  :subid("40_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_594
.annotate "line", 91
    new $P593, 'ExceptionHandler'
    set_addr $P593, control_592
    $P593."handle_types"(58)
    push_eh $P593
    .lex "self", self
    .lex "$/", param_594
.annotate "line", 92
    new $P595, "Undef"
    .lex "$past", $P595
.annotate "line", 91
    find_lex $P596, "$past"
.annotate "line", 93
    find_lex $P598, "$/"
    unless_null $P598, vivify_183
    new $P598, "Hash"
  vivify_183:
    set $P599, $P598["metachar"]
    unless_null $P599, vivify_184
    new $P599, "Undef"
  vivify_184:
    if $P599, if_597
.annotate "line", 95
    get_hll_global $P603, ["PAST"], "Regex"
    find_lex $P604, "$/"
    set $S605, $P604
    find_lex $P606, "$/"
    $P607 = $P603."new"($S605, "literal" :named("pasttype"), $P606 :named("node"))
    store_lex "$past", $P607
.annotate "line", 96
    get_global $P609, "@MODIFIERS"
    unless_null $P609, vivify_185
    new $P609, "ResizablePMCArray"
  vivify_185:
    set $P610, $P609[0]
    unless_null $P610, vivify_186
    new $P610, "Hash"
  vivify_186:
    set $P611, $P610["i"]
    unless_null $P611, vivify_187
    new $P611, "Undef"
  vivify_187:
    unless $P611, if_608_end
    find_lex $P612, "$past"
    $P612."subtype"("ignorecase")
  if_608_end:
.annotate "line", 94
    goto if_597_end
  if_597:
.annotate "line", 93
    find_lex $P600, "$/"
    unless_null $P600, vivify_188
    new $P600, "Hash"
  vivify_188:
    set $P601, $P600["metachar"]
    unless_null $P601, vivify_189
    new $P601, "Undef"
  vivify_189:
    $P602 = $P601."ast"()
    store_lex "$past", $P602
  if_597_end:
.annotate "line", 98
    find_lex $P613, "$/"
    find_lex $P614, "$past"
    $P615 = $P613."!make"($P614)
.annotate "line", 91
    .return ($P615)
  control_592:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P616, exception, "payload"
    .return ($P616)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<*>"  :subid("41_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_620
.annotate "line", 101
    new $P619, 'ExceptionHandler'
    set_addr $P619, control_618
    $P619."handle_types"(58)
    push_eh $P619
    .lex "self", self
    .lex "$/", param_620
.annotate "line", 102
    new $P621, "Undef"
    .lex "$past", $P621
    get_hll_global $P622, ["PAST"], "Regex"
    find_lex $P623, "$/"
    $P624 = $P622."new"("quant" :named("pasttype"), $P623 :named("node"))
    store_lex "$past", $P624
.annotate "line", 103
    find_lex $P625, "$/"
    find_lex $P626, "$past"
    find_lex $P627, "$/"
    unless_null $P627, vivify_190
    new $P627, "Hash"
  vivify_190:
    set $P628, $P627["backmod"]
    unless_null $P628, vivify_191
    new $P628, "Undef"
  vivify_191:
    $P629 = "backmod"($P626, $P628)
    $P630 = $P625."!make"($P629)
.annotate "line", 101
    .return ($P630)
  control_618:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P631, exception, "payload"
    .return ($P631)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<+>"  :subid("42_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_635
.annotate "line", 106
    new $P634, 'ExceptionHandler'
    set_addr $P634, control_633
    $P634."handle_types"(58)
    push_eh $P634
    .lex "self", self
    .lex "$/", param_635
.annotate "line", 107
    new $P636, "Undef"
    .lex "$past", $P636
    get_hll_global $P637, ["PAST"], "Regex"
    find_lex $P638, "$/"
    $P639 = $P637."new"("quant" :named("pasttype"), 1 :named("min"), $P638 :named("node"))
    store_lex "$past", $P639
.annotate "line", 108
    find_lex $P640, "$/"
    find_lex $P641, "$past"
    find_lex $P642, "$/"
    unless_null $P642, vivify_192
    new $P642, "Hash"
  vivify_192:
    set $P643, $P642["backmod"]
    unless_null $P643, vivify_193
    new $P643, "Undef"
  vivify_193:
    $P644 = "backmod"($P641, $P643)
    $P645 = $P640."!make"($P644)
.annotate "line", 106
    .return ($P645)
  control_633:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P646, exception, "payload"
    .return ($P646)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<?>"  :subid("43_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_650
.annotate "line", 111
    new $P649, 'ExceptionHandler'
    set_addr $P649, control_648
    $P649."handle_types"(58)
    push_eh $P649
    .lex "self", self
    .lex "$/", param_650
.annotate "line", 112
    new $P651, "Undef"
    .lex "$past", $P651
    get_hll_global $P652, ["PAST"], "Regex"
    find_lex $P653, "$/"
    $P654 = $P652."new"("quant" :named("pasttype"), 0 :named("min"), 1 :named("max"), $P653 :named("node"))
    store_lex "$past", $P654
.annotate "line", 113
    find_lex $P655, "$/"
    find_lex $P656, "$past"
    find_lex $P657, "$/"
    unless_null $P657, vivify_194
    new $P657, "Hash"
  vivify_194:
    set $P658, $P657["backmod"]
    unless_null $P658, vivify_195
    new $P658, "Undef"
  vivify_195:
    $P659 = "backmod"($P656, $P658)
    $P655."!make"($P659)
.annotate "line", 114
    find_lex $P660, "$/"
    find_lex $P661, "$past"
    $P662 = $P660."!make"($P661)
.annotate "line", 111
    .return ($P662)
  control_648:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P663, exception, "payload"
    .return ($P663)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "quantifier:sym<**>"  :subid("44_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_667
.annotate "line", 117
    new $P666, 'ExceptionHandler'
    set_addr $P666, control_665
    $P666."handle_types"(58)
    push_eh $P666
    .lex "self", self
    .lex "$/", param_667
.annotate "line", 118
    new $P668, "Undef"
    .lex "$past", $P668
.annotate "line", 117
    find_lex $P669, "$past"
.annotate "line", 119
    find_lex $P671, "$/"
    unless_null $P671, vivify_196
    new $P671, "Hash"
  vivify_196:
    set $P672, $P671["quantified_atom"]
    unless_null $P672, vivify_197
    new $P672, "Undef"
  vivify_197:
    if $P672, if_670
.annotate "line", 124
    get_hll_global $P679, ["PAST"], "Regex"
    find_lex $P680, "$/"
    unless_null $P680, vivify_198
    new $P680, "Hash"
  vivify_198:
    set $P681, $P680["min"]
    unless_null $P681, vivify_199
    new $P681, "Undef"
  vivify_199:
    set $N682, $P681
    find_lex $P683, "$/"
    $P684 = $P679."new"("quant" :named("pasttype"), $N682 :named("min"), $P683 :named("node"))
    store_lex "$past", $P684
.annotate "line", 125
    find_lex $P686, "$/"
    unless_null $P686, vivify_200
    new $P686, "Hash"
  vivify_200:
    set $P687, $P686["max"]
    unless_null $P687, vivify_201
    new $P687, "Undef"
  vivify_201:
    isfalse $I688, $P687
    if $I688, if_685
.annotate "line", 126
    find_lex $P694, "$/"
    unless_null $P694, vivify_202
    new $P694, "Hash"
  vivify_202:
    set $P695, $P694["max"]
    unless_null $P695, vivify_203
    new $P695, "ResizablePMCArray"
  vivify_203:
    set $P696, $P695[0]
    unless_null $P696, vivify_204
    new $P696, "Undef"
  vivify_204:
    set $S697, $P696
    isne $I698, $S697, "*"
    unless $I698, if_693_end
    find_lex $P699, "$past"
    find_lex $P700, "$/"
    unless_null $P700, vivify_205
    new $P700, "Hash"
  vivify_205:
    set $P701, $P700["max"]
    unless_null $P701, vivify_206
    new $P701, "ResizablePMCArray"
  vivify_206:
    set $P702, $P701[0]
    unless_null $P702, vivify_207
    new $P702, "Undef"
  vivify_207:
    set $N703, $P702
    $P699."max"($N703)
  if_693_end:
    goto if_685_end
  if_685:
.annotate "line", 125
    find_lex $P689, "$past"
    find_lex $P690, "$/"
    unless_null $P690, vivify_208
    new $P690, "Hash"
  vivify_208:
    set $P691, $P690["min"]
    unless_null $P691, vivify_209
    new $P691, "Undef"
  vivify_209:
    set $N692, $P691
    $P689."max"($N692)
  if_685_end:
.annotate "line", 123
    goto if_670_end
  if_670:
.annotate "line", 120
    get_hll_global $P673, ["PAST"], "Regex"
.annotate "line", 121
    find_lex $P674, "$/"
    unless_null $P674, vivify_210
    new $P674, "Hash"
  vivify_210:
    set $P675, $P674["quantified_atom"]
    unless_null $P675, vivify_211
    new $P675, "Undef"
  vivify_211:
    $P676 = $P675."ast"()
    find_lex $P677, "$/"
    $P678 = $P673."new"("quant" :named("pasttype"), 1 :named("min"), $P676 :named("sep"), $P677 :named("node"))
.annotate "line", 120
    store_lex "$past", $P678
  if_670_end:
.annotate "line", 128
    find_lex $P704, "$/"
    find_lex $P705, "$past"
    find_lex $P706, "$/"
    unless_null $P706, vivify_212
    new $P706, "Hash"
  vivify_212:
    set $P707, $P706["backmod"]
    unless_null $P707, vivify_213
    new $P707, "Undef"
  vivify_213:
    $P708 = "backmod"($P705, $P707)
    $P709 = $P704."!make"($P708)
.annotate "line", 117
    .return ($P709)
  control_665:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P710, exception, "payload"
    .return ($P710)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<ws>"  :subid("45_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_714
.annotate "line", 131
    new $P713, 'ExceptionHandler'
    set_addr $P713, control_712
    $P713."handle_types"(58)
    push_eh $P713
    .lex "self", self
    .lex "$/", param_714
.annotate "line", 132
    new $P715, "Undef"
    .lex "$past", $P715
.annotate "line", 133
    get_global $P718, "@MODIFIERS"
    unless_null $P718, vivify_214
    new $P718, "ResizablePMCArray"
  vivify_214:
    set $P719, $P718[0]
    unless_null $P719, vivify_215
    new $P719, "Hash"
  vivify_215:
    set $P720, $P719["s"]
    unless_null $P720, vivify_216
    new $P720, "Undef"
  vivify_216:
    if $P720, if_717
    new $P724, "Integer"
    assign $P724, 0
    set $P716, $P724
    goto if_717_end
  if_717:
    get_hll_global $P721, ["PAST"], "Regex"
    find_lex $P722, "$/"
    $P723 = $P721."new"("ws", "subrule" :named("pasttype"), "method" :named("subtype"), $P722 :named("node"))
    set $P716, $P723
  if_717_end:
    store_lex "$past", $P716
.annotate "line", 136
    find_lex $P725, "$/"
    find_lex $P726, "$past"
    $P727 = $P725."!make"($P726)
.annotate "line", 131
    .return ($P727)
  control_712:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P728, exception, "payload"
    .return ($P728)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<[ ]>"  :subid("46_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_732
.annotate "line", 140
    new $P731, 'ExceptionHandler'
    set_addr $P731, control_730
    $P731."handle_types"(58)
    push_eh $P731
    .lex "self", self
    .lex "$/", param_732
.annotate "line", 141
    find_lex $P733, "$/"
    find_lex $P734, "$/"
    unless_null $P734, vivify_217
    new $P734, "Hash"
  vivify_217:
    set $P735, $P734["nibbler"]
    unless_null $P735, vivify_218
    new $P735, "Undef"
  vivify_218:
    $P736 = $P735."ast"()
    $P737 = $P733."!make"($P736)
.annotate "line", 140
    .return ($P737)
  control_730:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P738, exception, "payload"
    .return ($P738)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<( )>"  :subid("47_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_742
.annotate "line", 144
    new $P741, 'ExceptionHandler'
    set_addr $P741, control_740
    $P741."handle_types"(58)
    push_eh $P741
    .lex "self", self
    .lex "$/", param_742
.annotate "line", 145
    new $P743, "Undef"
    .lex "$subpast", $P743
.annotate "line", 146
    new $P744, "Undef"
    .lex "$past", $P744
.annotate "line", 145
    find_lex $P745, "$/"
    unless_null $P745, vivify_219
    new $P745, "Hash"
  vivify_219:
    set $P746, $P745["nibbler"]
    unless_null $P746, vivify_220
    new $P746, "Undef"
  vivify_220:
    $P747 = $P746."ast"()
    $P748 = "buildsub"($P747)
    store_lex "$subpast", $P748
.annotate "line", 146
    get_hll_global $P749, ["PAST"], "Regex"
    find_lex $P750, "$subpast"
    find_lex $P751, "$/"
    $P752 = $P749."new"($P750, "subrule" :named("pasttype"), "capture" :named("subtype"), $P751 :named("node"))
    store_lex "$past", $P752
.annotate "line", 148
    find_lex $P753, "$/"
    find_lex $P754, "$past"
    $P755 = $P753."!make"($P754)
.annotate "line", 144
    .return ($P755)
  control_740:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P756, exception, "payload"
    .return ($P756)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<'>"  :subid("48_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_760
.annotate "line", 151
    new $P759, 'ExceptionHandler'
    set_addr $P759, control_758
    $P759."handle_types"(58)
    push_eh $P759
    .lex "self", self
    .lex "$/", param_760
.annotate "line", 152
    new $P761, "Undef"
    .lex "$quote", $P761
.annotate "line", 154
    new $P762, "Undef"
    .lex "$past", $P762
.annotate "line", 152
    find_lex $P763, "$/"
    unless_null $P763, vivify_221
    new $P763, "Hash"
  vivify_221:
    set $P764, $P763["quote_EXPR"]
    unless_null $P764, vivify_222
    new $P764, "Undef"
  vivify_222:
    $P765 = $P764."ast"()
    store_lex "$quote", $P765
.annotate "line", 153
    get_hll_global $P767, ["PAST"], "Val"
    find_lex $P768, "$quote"
    $P769 = $P767."ACCEPTS"($P768)
    unless $P769, if_766_end
    find_lex $P770, "$quote"
    $P771 = $P770."value"()
    store_lex "$quote", $P771
  if_766_end:
.annotate "line", 154
    get_hll_global $P772, ["PAST"], "Regex"
    find_lex $P773, "$quote"
    find_lex $P774, "$/"
    $P775 = $P772."new"($P773, "literal" :named("pasttype"), $P774 :named("node"))
    store_lex "$past", $P775
.annotate "line", 155
    find_lex $P776, "$/"
    find_lex $P777, "$past"
    $P778 = $P776."!make"($P777)
.annotate "line", 151
    .return ($P778)
  control_758:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P779, exception, "payload"
    .return ($P779)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<\">"  :subid("49_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_783
.annotate "line", 158
    new $P782, 'ExceptionHandler'
    set_addr $P782, control_781
    $P782."handle_types"(58)
    push_eh $P782
    .lex "self", self
    .lex "$/", param_783
.annotate "line", 159
    new $P784, "Undef"
    .lex "$quote", $P784
.annotate "line", 161
    new $P785, "Undef"
    .lex "$past", $P785
.annotate "line", 159
    find_lex $P786, "$/"
    unless_null $P786, vivify_223
    new $P786, "Hash"
  vivify_223:
    set $P787, $P786["quote_EXPR"]
    unless_null $P787, vivify_224
    new $P787, "Undef"
  vivify_224:
    $P788 = $P787."ast"()
    store_lex "$quote", $P788
.annotate "line", 160
    get_hll_global $P790, ["PAST"], "Val"
    find_lex $P791, "$quote"
    $P792 = $P790."ACCEPTS"($P791)
    unless $P792, if_789_end
    find_lex $P793, "$quote"
    $P794 = $P793."value"()
    store_lex "$quote", $P794
  if_789_end:
.annotate "line", 161
    get_hll_global $P795, ["PAST"], "Regex"
    find_lex $P796, "$quote"
    find_lex $P797, "$/"
    $P798 = $P795."new"($P796, "literal" :named("pasttype"), $P797 :named("node"))
    store_lex "$past", $P798
.annotate "line", 162
    find_lex $P799, "$/"
    find_lex $P800, "$past"
    $P801 = $P799."!make"($P800)
.annotate "line", 158
    .return ($P801)
  control_781:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P802, exception, "payload"
    .return ($P802)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<.>"  :subid("50_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_806
.annotate "line", 165
    new $P805, 'ExceptionHandler'
    set_addr $P805, control_804
    $P805."handle_types"(58)
    push_eh $P805
    .lex "self", self
    .lex "$/", param_806
.annotate "line", 166
    new $P807, "Undef"
    .lex "$past", $P807
    get_hll_global $P808, ["PAST"], "Regex"
    find_lex $P809, "$/"
    $P810 = $P808."new"("charclass" :named("pasttype"), "." :named("subtype"), $P809 :named("node"))
    store_lex "$past", $P810
.annotate "line", 167
    find_lex $P811, "$/"
    find_lex $P812, "$past"
    $P813 = $P811."!make"($P812)
.annotate "line", 165
    .return ($P813)
  control_804:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P814, exception, "payload"
    .return ($P814)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<^>"  :subid("51_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_818
.annotate "line", 170
    new $P817, 'ExceptionHandler'
    set_addr $P817, control_816
    $P817."handle_types"(58)
    push_eh $P817
    .lex "self", self
    .lex "$/", param_818
.annotate "line", 171
    new $P819, "Undef"
    .lex "$past", $P819
    get_hll_global $P820, ["PAST"], "Regex"
    find_lex $P821, "$/"
    $P822 = $P820."new"("anchor" :named("pasttype"), "bos" :named("subtype"), $P821 :named("node"))
    store_lex "$past", $P822
.annotate "line", 172
    find_lex $P823, "$/"
    find_lex $P824, "$past"
    $P825 = $P823."!make"($P824)
.annotate "line", 170
    .return ($P825)
  control_816:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P826, exception, "payload"
    .return ($P826)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<^^>"  :subid("52_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_830
.annotate "line", 175
    new $P829, 'ExceptionHandler'
    set_addr $P829, control_828
    $P829."handle_types"(58)
    push_eh $P829
    .lex "self", self
    .lex "$/", param_830
.annotate "line", 176
    new $P831, "Undef"
    .lex "$past", $P831
    get_hll_global $P832, ["PAST"], "Regex"
    find_lex $P833, "$/"
    $P834 = $P832."new"("anchor" :named("pasttype"), "bol" :named("subtype"), $P833 :named("node"))
    store_lex "$past", $P834
.annotate "line", 177
    find_lex $P835, "$/"
    find_lex $P836, "$past"
    $P837 = $P835."!make"($P836)
.annotate "line", 175
    .return ($P837)
  control_828:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P838, exception, "payload"
    .return ($P838)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<$>"  :subid("53_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_842
.annotate "line", 180
    new $P841, 'ExceptionHandler'
    set_addr $P841, control_840
    $P841."handle_types"(58)
    push_eh $P841
    .lex "self", self
    .lex "$/", param_842
.annotate "line", 181
    new $P843, "Undef"
    .lex "$past", $P843
    get_hll_global $P844, ["PAST"], "Regex"
    find_lex $P845, "$/"
    $P846 = $P844."new"("anchor" :named("pasttype"), "eos" :named("subtype"), $P845 :named("node"))
    store_lex "$past", $P846
.annotate "line", 182
    find_lex $P847, "$/"
    find_lex $P848, "$past"
    $P849 = $P847."!make"($P848)
.annotate "line", 180
    .return ($P849)
  control_840:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P850, exception, "payload"
    .return ($P850)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<$$>"  :subid("54_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_854
.annotate "line", 185
    new $P853, 'ExceptionHandler'
    set_addr $P853, control_852
    $P853."handle_types"(58)
    push_eh $P853
    .lex "self", self
    .lex "$/", param_854
.annotate "line", 186
    new $P855, "Undef"
    .lex "$past", $P855
    get_hll_global $P856, ["PAST"], "Regex"
    find_lex $P857, "$/"
    $P858 = $P856."new"("anchor" :named("pasttype"), "eol" :named("subtype"), $P857 :named("node"))
    store_lex "$past", $P858
.annotate "line", 187
    find_lex $P859, "$/"
    find_lex $P860, "$past"
    $P861 = $P859."!make"($P860)
.annotate "line", 185
    .return ($P861)
  control_852:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P862, exception, "payload"
    .return ($P862)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<:::>"  :subid("55_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_866
.annotate "line", 190
    new $P865, 'ExceptionHandler'
    set_addr $P865, control_864
    $P865."handle_types"(58)
    push_eh $P865
    .lex "self", self
    .lex "$/", param_866
.annotate "line", 191
    new $P867, "Undef"
    .lex "$past", $P867
    get_hll_global $P868, ["PAST"], "Regex"
    find_lex $P869, "$/"
    $P870 = $P868."new"("cut" :named("pasttype"), $P869 :named("node"))
    store_lex "$past", $P870
.annotate "line", 192
    find_lex $P871, "$/"
    find_lex $P872, "$past"
    $P873 = $P871."!make"($P872)
.annotate "line", 190
    .return ($P873)
  control_864:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P874, exception, "payload"
    .return ($P874)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<lwb>"  :subid("56_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_878
.annotate "line", 195
    new $P877, 'ExceptionHandler'
    set_addr $P877, control_876
    $P877."handle_types"(58)
    push_eh $P877
    .lex "self", self
    .lex "$/", param_878
.annotate "line", 196
    new $P879, "Undef"
    .lex "$past", $P879
    get_hll_global $P880, ["PAST"], "Regex"
    find_lex $P881, "$/"
    $P882 = $P880."new"("anchor" :named("pasttype"), "lwb" :named("subtype"), $P881 :named("node"))
    store_lex "$past", $P882
.annotate "line", 197
    find_lex $P883, "$/"
    find_lex $P884, "$past"
    $P885 = $P883."!make"($P884)
.annotate "line", 195
    .return ($P885)
  control_876:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P886, exception, "payload"
    .return ($P886)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<rwb>"  :subid("57_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_890
.annotate "line", 200
    new $P889, 'ExceptionHandler'
    set_addr $P889, control_888
    $P889."handle_types"(58)
    push_eh $P889
    .lex "self", self
    .lex "$/", param_890
.annotate "line", 201
    new $P891, "Undef"
    .lex "$past", $P891
    get_hll_global $P892, ["PAST"], "Regex"
    find_lex $P893, "$/"
    $P894 = $P892."new"("anchor" :named("pasttype"), "rwb" :named("subtype"), $P893 :named("node"))
    store_lex "$past", $P894
.annotate "line", 202
    find_lex $P895, "$/"
    find_lex $P896, "$past"
    $P897 = $P895."!make"($P896)
.annotate "line", 200
    .return ($P897)
  control_888:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P898, exception, "payload"
    .return ($P898)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<bs>"  :subid("58_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_902
.annotate "line", 205
    new $P901, 'ExceptionHandler'
    set_addr $P901, control_900
    $P901."handle_types"(58)
    push_eh $P901
    .lex "self", self
    .lex "$/", param_902
.annotate "line", 206
    find_lex $P903, "$/"
    find_lex $P904, "$/"
    unless_null $P904, vivify_225
    new $P904, "Hash"
  vivify_225:
    set $P905, $P904["backslash"]
    unless_null $P905, vivify_226
    new $P905, "Undef"
  vivify_226:
    $P906 = $P905."ast"()
    $P907 = $P903."!make"($P906)
.annotate "line", 205
    .return ($P907)
  control_900:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P908, exception, "payload"
    .return ($P908)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<mod>"  :subid("59_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_912
.annotate "line", 209
    new $P911, 'ExceptionHandler'
    set_addr $P911, control_910
    $P911."handle_types"(58)
    push_eh $P911
    .lex "self", self
    .lex "$/", param_912
.annotate "line", 210
    find_lex $P913, "$/"
    find_lex $P914, "$/"
    unless_null $P914, vivify_227
    new $P914, "Hash"
  vivify_227:
    set $P915, $P914["mod_internal"]
    unless_null $P915, vivify_228
    new $P915, "Undef"
  vivify_228:
    $P916 = $P915."ast"()
    $P917 = $P913."!make"($P916)
.annotate "line", 209
    .return ($P917)
  control_910:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P918, exception, "payload"
    .return ($P918)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<assert>"  :subid("60_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_922
.annotate "line", 213
    new $P921, 'ExceptionHandler'
    set_addr $P921, control_920
    $P921."handle_types"(58)
    push_eh $P921
    .lex "self", self
    .lex "$/", param_922
.annotate "line", 214
    find_lex $P923, "$/"
    find_lex $P924, "$/"
    unless_null $P924, vivify_229
    new $P924, "Hash"
  vivify_229:
    set $P925, $P924["assertion"]
    unless_null $P925, vivify_230
    new $P925, "Undef"
  vivify_230:
    $P926 = $P925."ast"()
    $P927 = $P923."!make"($P926)
.annotate "line", 213
    .return ($P927)
  control_920:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P928, exception, "payload"
    .return ($P928)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<~>"  :subid("61_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_932
.annotate "line", 217
    new $P931, 'ExceptionHandler'
    set_addr $P931, control_930
    $P931."handle_types"(58)
    push_eh $P931
    .lex "self", self
    .lex "$/", param_932
.annotate "line", 218
    find_lex $P933, "$/"
    get_hll_global $P934, ["PAST"], "Regex"
.annotate "line", 219
    find_lex $P935, "$/"
    unless_null $P935, vivify_231
    new $P935, "Hash"
  vivify_231:
    set $P936, $P935["EXPR"]
    unless_null $P936, vivify_232
    new $P936, "Undef"
  vivify_232:
    $P937 = $P936."ast"()
.annotate "line", 220
    get_hll_global $P938, ["PAST"], "Regex"
.annotate "line", 221
    find_lex $P939, "$/"
    unless_null $P939, vivify_233
    new $P939, "Hash"
  vivify_233:
    set $P940, $P939["GOAL"]
    unless_null $P940, vivify_234
    new $P940, "Undef"
  vivify_234:
    $P941 = $P940."ast"()
.annotate "line", 222
    get_hll_global $P942, ["PAST"], "Regex"
    find_lex $P943, "$/"
    unless_null $P943, vivify_235
    new $P943, "Hash"
  vivify_235:
    set $P944, $P943["GOAL"]
    unless_null $P944, vivify_236
    new $P944, "Undef"
  vivify_236:
    set $S945, $P944
    $P946 = $P942."new"("FAILGOAL", $S945, "subrule" :named("pasttype"), "method" :named("subtype"))
    $P947 = $P938."new"($P941, $P946, "alt" :named("pasttype"))
.annotate "line", 220
    $P948 = $P934."new"($P937, $P947, "concat" :named("pasttype"))
.annotate "line", 218
    $P949 = $P933."!make"($P948)
.annotate "line", 217
    .return ($P949)
  control_930:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P950, exception, "payload"
    .return ($P950)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<{*}>"  :subid("62_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_954
.annotate "line", 230
    new $P953, 'ExceptionHandler'
    set_addr $P953, control_952
    $P953."handle_types"(58)
    push_eh $P953
    .lex "self", self
    .lex "$/", param_954
.annotate "line", 231
    new $P955, "Undef"
    .lex "$past", $P955
.annotate "line", 232
    find_lex $P958, "$/"
    unless_null $P958, vivify_237
    new $P958, "Hash"
  vivify_237:
    set $P959, $P958["key"]
    unless_null $P959, vivify_238
    new $P959, "Undef"
  vivify_238:
    if $P959, if_957
    new $P967, "Integer"
    assign $P967, 0
    set $P956, $P967
    goto if_957_end
  if_957:
    get_hll_global $P960, ["PAST"], "Regex"
    find_lex $P961, "$/"
    unless_null $P961, vivify_239
    new $P961, "Hash"
  vivify_239:
    set $P962, $P961["key"]
    unless_null $P962, vivify_240
    new $P962, "ResizablePMCArray"
  vivify_240:
    set $P963, $P962[0]
    unless_null $P963, vivify_241
    new $P963, "Undef"
  vivify_241:
    set $S964, $P963
    find_lex $P965, "$/"
    $P966 = $P960."new"($S964, "reduce" :named("pasttype"), $P965 :named("node"))
    set $P956, $P966
  if_957_end:
    store_lex "$past", $P956
.annotate "line", 234
    find_lex $P968, "$/"
    find_lex $P969, "$past"
    $P970 = $P968."!make"($P969)
.annotate "line", 230
    .return ($P970)
  control_952:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P971, exception, "payload"
    .return ($P971)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<var>"  :subid("63_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_975
.annotate "line", 237
    new $P974, 'ExceptionHandler'
    set_addr $P974, control_973
    $P974."handle_types"(58)
    push_eh $P974
    .lex "self", self
    .lex "$/", param_975
.annotate "line", 238
    new $P976, "Undef"
    .lex "$past", $P976
.annotate "line", 239
    new $P977, "Undef"
    .lex "$name", $P977
.annotate "line", 237
    find_lex $P978, "$past"
.annotate "line", 239
    find_lex $P981, "$/"
    unless_null $P981, vivify_242
    new $P981, "Hash"
  vivify_242:
    set $P982, $P981["pos"]
    unless_null $P982, vivify_243
    new $P982, "Undef"
  vivify_243:
    if $P982, if_980
    find_lex $P986, "$/"
    unless_null $P986, vivify_244
    new $P986, "Hash"
  vivify_244:
    set $P987, $P986["name"]
    unless_null $P987, vivify_245
    new $P987, "Undef"
  vivify_245:
    set $S988, $P987
    new $P979, 'String'
    set $P979, $S988
    goto if_980_end
  if_980:
    find_lex $P983, "$/"
    unless_null $P983, vivify_246
    new $P983, "Hash"
  vivify_246:
    set $P984, $P983["pos"]
    unless_null $P984, vivify_247
    new $P984, "Undef"
  vivify_247:
    set $N985, $P984
    new $P979, 'Float'
    set $P979, $N985
  if_980_end:
    store_lex "$name", $P979
.annotate "line", 240
    find_lex $P990, "$/"
    unless_null $P990, vivify_248
    new $P990, "Hash"
  vivify_248:
    set $P991, $P990["quantified_atom"]
    unless_null $P991, vivify_249
    new $P991, "Undef"
  vivify_249:
    if $P991, if_989
.annotate "line", 251
    get_hll_global $P1020, ["PAST"], "Regex"
    find_lex $P1021, "$name"
    find_lex $P1022, "$/"
    $P1023 = $P1020."new"("!BACKREF", $P1021, "subrule" :named("pasttype"), "method" :named("subtype"), $P1022 :named("node"))
    store_lex "$past", $P1023
.annotate "line", 250
    goto if_989_end
  if_989:
.annotate "line", 241
    find_lex $P992, "$/"
    unless_null $P992, vivify_250
    new $P992, "Hash"
  vivify_250:
    set $P993, $P992["quantified_atom"]
    unless_null $P993, vivify_251
    new $P993, "ResizablePMCArray"
  vivify_251:
    set $P994, $P993[0]
    unless_null $P994, vivify_252
    new $P994, "Undef"
  vivify_252:
    $P995 = $P994."ast"()
    store_lex "$past", $P995
.annotate "line", 242
    find_lex $P999, "$past"
    $S1000 = $P999."pasttype"()
    iseq $I1001, $S1000, "quant"
    if $I1001, if_998
    new $P997, 'Integer'
    set $P997, $I1001
    goto if_998_end
  if_998:
    find_lex $P1002, "$past"
    unless_null $P1002, vivify_253
    new $P1002, "ResizablePMCArray"
  vivify_253:
    set $P1003, $P1002[0]
    unless_null $P1003, vivify_254
    new $P1003, "Undef"
  vivify_254:
    $S1004 = $P1003."pasttype"()
    iseq $I1005, $S1004, "subrule"
    new $P997, 'Integer'
    set $P997, $I1005
  if_998_end:
    if $P997, if_996
.annotate "line", 245
    find_lex $P1010, "$past"
    $S1011 = $P1010."pasttype"()
    iseq $I1012, $S1011, "subrule"
    if $I1012, if_1009
.annotate "line", 247
    get_hll_global $P1015, ["PAST"], "Regex"
    find_lex $P1016, "$past"
    find_lex $P1017, "$name"
    find_lex $P1018, "$/"
    $P1019 = $P1015."new"($P1016, $P1017 :named("name"), "subcapture" :named("pasttype"), $P1018 :named("node"))
    store_lex "$past", $P1019
.annotate "line", 246
    goto if_1009_end
  if_1009:
.annotate "line", 245
    find_lex $P1013, "$past"
    find_lex $P1014, "$name"
    "subrule_alias"($P1013, $P1014)
  if_1009_end:
    goto if_996_end
  if_996:
.annotate "line", 243
    find_lex $P1006, "$past"
    unless_null $P1006, vivify_255
    new $P1006, "ResizablePMCArray"
  vivify_255:
    set $P1007, $P1006[0]
    unless_null $P1007, vivify_256
    new $P1007, "Undef"
  vivify_256:
    find_lex $P1008, "$name"
    "subrule_alias"($P1007, $P1008)
  if_996_end:
  if_989_end:
.annotate "line", 254
    find_lex $P1024, "$/"
    find_lex $P1025, "$past"
    $P1026 = $P1024."!make"($P1025)
.annotate "line", 237
    .return ($P1026)
  control_973:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1027, exception, "payload"
    .return ($P1027)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "metachar:sym<PIR>"  :subid("64_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_1031
.annotate "line", 257
    new $P1030, 'ExceptionHandler'
    set_addr $P1030, control_1029
    $P1030."handle_types"(58)
    push_eh $P1030
    .lex "self", self
    .lex "$/", param_1031
.annotate "line", 258
    find_lex $P1032, "$/"
    get_hll_global $P1033, ["PAST"], "Regex"
.annotate "line", 259
    get_hll_global $P1034, ["PAST"], "Op"
    find_lex $P1035, "$/"
    unless_null $P1035, vivify_257
    new $P1035, "Hash"
  vivify_257:
    set $P1036, $P1035["pir"]
    unless_null $P1036, vivify_258
    new $P1036, "Undef"
  vivify_258:
    set $S1037, $P1036
    $P1038 = $P1034."new"($S1037 :named("inline"), "inline" :named("pasttype"))
    find_lex $P1039, "$/"
    $P1040 = $P1033."new"($P1038, "pastnode" :named("pasttype"), $P1039 :named("node"))
.annotate "line", 258
    $P1041 = $P1032."!make"($P1040)
.annotate "line", 257
    .return ($P1041)
  control_1029:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1042, exception, "payload"
    .return ($P1042)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<w>"  :subid("65_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_1046
.annotate "line", 265
    new $P1045, 'ExceptionHandler'
    set_addr $P1045, control_1044
    $P1045."handle_types"(58)
    push_eh $P1045
    .lex "self", self
    .lex "$/", param_1046
.annotate "line", 266
    new $P1047, "Undef"
    .lex "$subtype", $P1047
.annotate "line", 267
    new $P1048, "Undef"
    .lex "$past", $P1048
.annotate "line", 266
    find_lex $P1051, "$/"
    unless_null $P1051, vivify_259
    new $P1051, "Hash"
  vivify_259:
    set $P1052, $P1051["sym"]
    unless_null $P1052, vivify_260
    new $P1052, "Undef"
  vivify_260:
    set $S1053, $P1052
    iseq $I1054, $S1053, "n"
    if $I1054, if_1050
    find_lex $P1056, "$/"
    unless_null $P1056, vivify_261
    new $P1056, "Hash"
  vivify_261:
    set $P1057, $P1056["sym"]
    unless_null $P1057, vivify_262
    new $P1057, "Undef"
  vivify_262:
    set $S1058, $P1057
    new $P1049, 'String'
    set $P1049, $S1058
    goto if_1050_end
  if_1050:
    new $P1055, "String"
    assign $P1055, "nl"
    set $P1049, $P1055
  if_1050_end:
    store_lex "$subtype", $P1049
.annotate "line", 267
    get_hll_global $P1059, ["PAST"], "Regex"
    find_lex $P1060, "$subtype"
    find_lex $P1061, "$/"
    $P1062 = $P1059."new"("charclass" :named("pasttype"), $P1060 :named("subtype"), $P1061 :named("node"))
    store_lex "$past", $P1062
.annotate "line", 268
    find_lex $P1063, "$/"
    find_lex $P1064, "$past"
    $P1065 = $P1063."!make"($P1064)
.annotate "line", 265
    .return ($P1065)
  control_1044:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1066, exception, "payload"
    .return ($P1066)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<b>"  :subid("66_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_1070
.annotate "line", 271
    new $P1069, 'ExceptionHandler'
    set_addr $P1069, control_1068
    $P1069."handle_types"(58)
    push_eh $P1069
    .lex "self", self
    .lex "$/", param_1070
.annotate "line", 272
    new $P1071, "Undef"
    .lex "$past", $P1071
    get_hll_global $P1072, ["PAST"], "Regex"
.annotate "line", 273
    find_lex $P1073, "$/"
    unless_null $P1073, vivify_263
    new $P1073, "Hash"
  vivify_263:
    set $P1074, $P1073["sym"]
    unless_null $P1074, vivify_264
    new $P1074, "Undef"
  vivify_264:
    set $S1075, $P1074
    iseq $I1076, $S1075, "B"
    find_lex $P1077, "$/"
    $P1078 = $P1072."new"("\b", "enumcharlist" :named("pasttype"), $I1076 :named("negate"), $P1077 :named("node"))
.annotate "line", 272
    store_lex "$past", $P1078
.annotate "line", 274
    find_lex $P1079, "$/"
    find_lex $P1080, "$past"
    $P1081 = $P1079."!make"($P1080)
.annotate "line", 271
    .return ($P1081)
  control_1068:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1082, exception, "payload"
    .return ($P1082)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<e>"  :subid("67_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_1086
.annotate "line", 277
    new $P1085, 'ExceptionHandler'
    set_addr $P1085, control_1084
    $P1085."handle_types"(58)
    push_eh $P1085
    .lex "self", self
    .lex "$/", param_1086
.annotate "line", 278
    new $P1087, "Undef"
    .lex "$past", $P1087
    get_hll_global $P1088, ["PAST"], "Regex"
.annotate "line", 279
    find_lex $P1089, "$/"
    unless_null $P1089, vivify_265
    new $P1089, "Hash"
  vivify_265:
    set $P1090, $P1089["sym"]
    unless_null $P1090, vivify_266
    new $P1090, "Undef"
  vivify_266:
    set $S1091, $P1090
    iseq $I1092, $S1091, "E"
    find_lex $P1093, "$/"
    $P1094 = $P1088."new"("\\e", "enumcharlist" :named("pasttype"), $I1092 :named("negate"), $P1093 :named("node"))
.annotate "line", 278
    store_lex "$past", $P1094
.annotate "line", 280
    find_lex $P1095, "$/"
    find_lex $P1096, "$past"
    $P1097 = $P1095."!make"($P1096)
.annotate "line", 277
    .return ($P1097)
  control_1084:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1098, exception, "payload"
    .return ($P1098)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<f>"  :subid("68_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_1102
.annotate "line", 283
    new $P1101, 'ExceptionHandler'
    set_addr $P1101, control_1100
    $P1101."handle_types"(58)
    push_eh $P1101
    .lex "self", self
    .lex "$/", param_1102
.annotate "line", 284
    new $P1103, "Undef"
    .lex "$past", $P1103
    get_hll_global $P1104, ["PAST"], "Regex"
.annotate "line", 285
    find_lex $P1105, "$/"
    unless_null $P1105, vivify_267
    new $P1105, "Hash"
  vivify_267:
    set $P1106, $P1105["sym"]
    unless_null $P1106, vivify_268
    new $P1106, "Undef"
  vivify_268:
    set $S1107, $P1106
    iseq $I1108, $S1107, "F"
    find_lex $P1109, "$/"
    $P1110 = $P1104."new"("\\f", "enumcharlist" :named("pasttype"), $I1108 :named("negate"), $P1109 :named("node"))
.annotate "line", 284
    store_lex "$past", $P1110
.annotate "line", 286
    find_lex $P1111, "$/"
    find_lex $P1112, "$past"
    $P1113 = $P1111."!make"($P1112)
.annotate "line", 283
    .return ($P1113)
  control_1100:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1114, exception, "payload"
    .return ($P1114)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<h>"  :subid("69_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_1118
.annotate "line", 289
    new $P1117, 'ExceptionHandler'
    set_addr $P1117, control_1116
    $P1117."handle_types"(58)
    push_eh $P1117
    .lex "self", self
    .lex "$/", param_1118
.annotate "line", 290
    new $P1119, "Undef"
    .lex "$past", $P1119
    get_hll_global $P1120, ["PAST"], "Regex"
.annotate "line", 291
    find_lex $P1121, "$/"
    unless_null $P1121, vivify_269
    new $P1121, "Hash"
  vivify_269:
    set $P1122, $P1121["sym"]
    unless_null $P1122, vivify_270
    new $P1122, "Undef"
  vivify_270:
    set $S1123, $P1122
    iseq $I1124, $S1123, "H"
    find_lex $P1125, "$/"
    $P1126 = $P1120."new"(unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", "enumcharlist" :named("pasttype"), $I1124 :named("negate"), $P1125 :named("node"))
.annotate "line", 290
    store_lex "$past", $P1126
.annotate "line", 292
    find_lex $P1127, "$/"
    find_lex $P1128, "$past"
    $P1129 = $P1127."!make"($P1128)
.annotate "line", 289
    .return ($P1129)
  control_1116:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1130, exception, "payload"
    .return ($P1130)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<r>"  :subid("70_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_1134
.annotate "line", 295
    new $P1133, 'ExceptionHandler'
    set_addr $P1133, control_1132
    $P1133."handle_types"(58)
    push_eh $P1133
    .lex "self", self
    .lex "$/", param_1134
.annotate "line", 296
    new $P1135, "Undef"
    .lex "$past", $P1135
    get_hll_global $P1136, ["PAST"], "Regex"
.annotate "line", 297
    find_lex $P1137, "$/"
    unless_null $P1137, vivify_271
    new $P1137, "Hash"
  vivify_271:
    set $P1138, $P1137["sym"]
    unless_null $P1138, vivify_272
    new $P1138, "Undef"
  vivify_272:
    set $S1139, $P1138
    iseq $I1140, $S1139, "R"
    find_lex $P1141, "$/"
    $P1142 = $P1136."new"("\r", "enumcharlist" :named("pasttype"), $I1140 :named("negate"), $P1141 :named("node"))
.annotate "line", 296
    store_lex "$past", $P1142
.annotate "line", 298
    find_lex $P1143, "$/"
    find_lex $P1144, "$past"
    $P1145 = $P1143."!make"($P1144)
.annotate "line", 295
    .return ($P1145)
  control_1132:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1146, exception, "payload"
    .return ($P1146)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<t>"  :subid("71_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_1150
.annotate "line", 301
    new $P1149, 'ExceptionHandler'
    set_addr $P1149, control_1148
    $P1149."handle_types"(58)
    push_eh $P1149
    .lex "self", self
    .lex "$/", param_1150
.annotate "line", 302
    new $P1151, "Undef"
    .lex "$past", $P1151
    get_hll_global $P1152, ["PAST"], "Regex"
.annotate "line", 303
    find_lex $P1153, "$/"
    unless_null $P1153, vivify_273
    new $P1153, "Hash"
  vivify_273:
    set $P1154, $P1153["sym"]
    unless_null $P1154, vivify_274
    new $P1154, "Undef"
  vivify_274:
    set $S1155, $P1154
    iseq $I1156, $S1155, "T"
    find_lex $P1157, "$/"
    $P1158 = $P1152."new"("\t", "enumcharlist" :named("pasttype"), $I1156 :named("negate"), $P1157 :named("node"))
.annotate "line", 302
    store_lex "$past", $P1158
.annotate "line", 304
    find_lex $P1159, "$/"
    find_lex $P1160, "$past"
    $P1161 = $P1159."!make"($P1160)
.annotate "line", 301
    .return ($P1161)
  control_1148:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1162, exception, "payload"
    .return ($P1162)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<v>"  :subid("72_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_1166
.annotate "line", 307
    new $P1165, 'ExceptionHandler'
    set_addr $P1165, control_1164
    $P1165."handle_types"(58)
    push_eh $P1165
    .lex "self", self
    .lex "$/", param_1166
.annotate "line", 308
    new $P1167, "Undef"
    .lex "$past", $P1167
    get_hll_global $P1168, ["PAST"], "Regex"
.annotate "line", 310
    find_lex $P1169, "$/"
    unless_null $P1169, vivify_275
    new $P1169, "Hash"
  vivify_275:
    set $P1170, $P1169["sym"]
    unless_null $P1170, vivify_276
    new $P1170, "Undef"
  vivify_276:
    set $S1171, $P1170
    iseq $I1172, $S1171, "V"
    find_lex $P1173, "$/"
    $P1174 = $P1168."new"(unicode:"\n\x{b}\f\r\x{85}\u2028\u2029", "enumcharlist" :named("pasttype"), $I1172 :named("negate"), $P1173 :named("node"))
.annotate "line", 308
    store_lex "$past", $P1174
.annotate "line", 311
    find_lex $P1175, "$/"
    find_lex $P1176, "$past"
    $P1177 = $P1175."!make"($P1176)
.annotate "line", 307
    .return ($P1177)
  control_1164:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1178, exception, "payload"
    .return ($P1178)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<o>"  :subid("73_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_1182
.annotate "line", 314
    new $P1181, 'ExceptionHandler'
    set_addr $P1181, control_1180
    $P1181."handle_types"(58)
    push_eh $P1181
    .lex "self", self
    .lex "$/", param_1182
.annotate "line", 315
    new $P1183, "Undef"
    .lex "$octlit", $P1183
.annotate "line", 316
    get_hll_global $P1184, ["HLL";"Actions"], "ints_to_string"
    find_lex $P1187, "$/"
    unless_null $P1187, vivify_277
    new $P1187, "Hash"
  vivify_277:
    set $P1188, $P1187["octint"]
    unless_null $P1188, vivify_278
    new $P1188, "Undef"
  vivify_278:
    unless $P1188, unless_1186
    set $P1185, $P1188
    goto unless_1186_end
  unless_1186:
    find_lex $P1189, "$/"
    unless_null $P1189, vivify_279
    new $P1189, "Hash"
  vivify_279:
    set $P1190, $P1189["octints"]
    unless_null $P1190, vivify_280
    new $P1190, "Hash"
  vivify_280:
    set $P1191, $P1190["octint"]
    unless_null $P1191, vivify_281
    new $P1191, "Undef"
  vivify_281:
    set $P1185, $P1191
  unless_1186_end:
    $P1192 = $P1184($P1185)
    store_lex "$octlit", $P1192
.annotate "line", 317
    find_lex $P1193, "$/"
    find_lex $P1196, "$/"
    unless_null $P1196, vivify_282
    new $P1196, "Hash"
  vivify_282:
    set $P1197, $P1196["sym"]
    unless_null $P1197, vivify_283
    new $P1197, "Undef"
  vivify_283:
    set $S1198, $P1197
    iseq $I1199, $S1198, "O"
    if $I1199, if_1195
.annotate "line", 320
    get_hll_global $P1204, ["PAST"], "Regex"
    find_lex $P1205, "$octlit"
    find_lex $P1206, "$/"
    $P1207 = $P1204."new"($P1205, "literal" :named("pasttype"), $P1206 :named("node"))
    set $P1194, $P1207
.annotate "line", 317
    goto if_1195_end
  if_1195:
.annotate "line", 318
    get_hll_global $P1200, ["PAST"], "Regex"
    find_lex $P1201, "$octlit"
    find_lex $P1202, "$/"
    $P1203 = $P1200."new"($P1201, "enumcharlist" :named("pasttype"), 1 :named("negate"), $P1202 :named("node"))
    set $P1194, $P1203
  if_1195_end:
    $P1208 = $P1193."!make"($P1194)
.annotate "line", 314
    .return ($P1208)
  control_1180:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1209, exception, "payload"
    .return ($P1209)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<x>"  :subid("74_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_1213
.annotate "line", 323
    new $P1212, 'ExceptionHandler'
    set_addr $P1212, control_1211
    $P1212."handle_types"(58)
    push_eh $P1212
    .lex "self", self
    .lex "$/", param_1213
.annotate "line", 324
    new $P1214, "Undef"
    .lex "$hexlit", $P1214
.annotate "line", 325
    get_hll_global $P1215, ["HLL";"Actions"], "ints_to_string"
    find_lex $P1218, "$/"
    unless_null $P1218, vivify_284
    new $P1218, "Hash"
  vivify_284:
    set $P1219, $P1218["hexint"]
    unless_null $P1219, vivify_285
    new $P1219, "Undef"
  vivify_285:
    unless $P1219, unless_1217
    set $P1216, $P1219
    goto unless_1217_end
  unless_1217:
    find_lex $P1220, "$/"
    unless_null $P1220, vivify_286
    new $P1220, "Hash"
  vivify_286:
    set $P1221, $P1220["hexints"]
    unless_null $P1221, vivify_287
    new $P1221, "Hash"
  vivify_287:
    set $P1222, $P1221["hexint"]
    unless_null $P1222, vivify_288
    new $P1222, "Undef"
  vivify_288:
    set $P1216, $P1222
  unless_1217_end:
    $P1223 = $P1215($P1216)
    store_lex "$hexlit", $P1223
.annotate "line", 326
    find_lex $P1224, "$/"
    find_lex $P1227, "$/"
    unless_null $P1227, vivify_289
    new $P1227, "Hash"
  vivify_289:
    set $P1228, $P1227["sym"]
    unless_null $P1228, vivify_290
    new $P1228, "Undef"
  vivify_290:
    set $S1229, $P1228
    iseq $I1230, $S1229, "X"
    if $I1230, if_1226
.annotate "line", 329
    get_hll_global $P1235, ["PAST"], "Regex"
    find_lex $P1236, "$hexlit"
    find_lex $P1237, "$/"
    $P1238 = $P1235."new"($P1236, "literal" :named("pasttype"), $P1237 :named("node"))
    set $P1225, $P1238
.annotate "line", 326
    goto if_1226_end
  if_1226:
.annotate "line", 327
    get_hll_global $P1231, ["PAST"], "Regex"
    find_lex $P1232, "$hexlit"
    find_lex $P1233, "$/"
    $P1234 = $P1231."new"($P1232, "enumcharlist" :named("pasttype"), 1 :named("negate"), $P1233 :named("node"))
    set $P1225, $P1234
  if_1226_end:
    $P1239 = $P1224."!make"($P1225)
.annotate "line", 323
    .return ($P1239)
  control_1211:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1240, exception, "payload"
    .return ($P1240)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "backslash:sym<misc>"  :subid("75_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_1244
.annotate "line", 332
    new $P1243, 'ExceptionHandler'
    set_addr $P1243, control_1242
    $P1243."handle_types"(58)
    push_eh $P1243
    .lex "self", self
    .lex "$/", param_1244
.annotate "line", 333
    new $P1245, "Undef"
    .lex "$past", $P1245
    get_hll_global $P1246, ["PAST"], "Regex"
    find_lex $P1247, "$/"
    set $S1248, $P1247
    find_lex $P1249, "$/"
    $P1250 = $P1246."new"($S1248, "literal" :named("pasttype"), $P1249 :named("node"))
    store_lex "$past", $P1250
.annotate "line", 334
    find_lex $P1251, "$/"
    find_lex $P1252, "$past"
    $P1253 = $P1251."!make"($P1252)
.annotate "line", 332
    .return ($P1253)
  control_1242:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1254, exception, "payload"
    .return ($P1254)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<?>"  :subid("76_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_1258
.annotate "line", 338
    new $P1257, 'ExceptionHandler'
    set_addr $P1257, control_1256
    $P1257."handle_types"(58)
    push_eh $P1257
    .lex "self", self
    .lex "$/", param_1258
.annotate "line", 339
    new $P1259, "Undef"
    .lex "$past", $P1259
.annotate "line", 338
    find_lex $P1260, "$past"
.annotate "line", 340
    find_lex $P1262, "$/"
    unless_null $P1262, vivify_291
    new $P1262, "Hash"
  vivify_291:
    set $P1263, $P1262["assertion"]
    unless_null $P1263, vivify_292
    new $P1263, "Undef"
  vivify_292:
    if $P1263, if_1261
.annotate "line", 344
    new $P1268, "Integer"
    assign $P1268, 0
    store_lex "$past", $P1268
    goto if_1261_end
  if_1261:
.annotate "line", 341
    find_lex $P1264, "$/"
    unless_null $P1264, vivify_293
    new $P1264, "Hash"
  vivify_293:
    set $P1265, $P1264["assertion"]
    unless_null $P1265, vivify_294
    new $P1265, "Undef"
  vivify_294:
    $P1266 = $P1265."ast"()
    store_lex "$past", $P1266
.annotate "line", 342
    find_lex $P1267, "$past"
    $P1267."subtype"("zerowidth")
  if_1261_end:
.annotate "line", 345
    find_lex $P1269, "$/"
    find_lex $P1270, "$past"
    $P1271 = $P1269."!make"($P1270)
.annotate "line", 338
    .return ($P1271)
  control_1256:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1272, exception, "payload"
    .return ($P1272)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<!>"  :subid("77_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_1276
.annotate "line", 348
    new $P1275, 'ExceptionHandler'
    set_addr $P1275, control_1274
    $P1275."handle_types"(58)
    push_eh $P1275
    .lex "self", self
    .lex "$/", param_1276
.annotate "line", 349
    new $P1277, "Undef"
    .lex "$past", $P1277
.annotate "line", 348
    find_lex $P1278, "$past"
.annotate "line", 350
    find_lex $P1280, "$/"
    unless_null $P1280, vivify_295
    new $P1280, "Hash"
  vivify_295:
    set $P1281, $P1280["assertion"]
    unless_null $P1281, vivify_296
    new $P1281, "Undef"
  vivify_296:
    if $P1281, if_1279
.annotate "line", 356
    get_hll_global $P1290, ["PAST"], "Regex"
    find_lex $P1291, "$/"
    $P1292 = $P1290."new"("anchor" :named("pasttype"), "fail" :named("subtype"), $P1291 :named("node"))
    store_lex "$past", $P1292
.annotate "line", 355
    goto if_1279_end
  if_1279:
.annotate "line", 351
    find_lex $P1282, "$/"
    unless_null $P1282, vivify_297
    new $P1282, "Hash"
  vivify_297:
    set $P1283, $P1282["assertion"]
    unless_null $P1283, vivify_298
    new $P1283, "Undef"
  vivify_298:
    $P1284 = $P1283."ast"()
    store_lex "$past", $P1284
.annotate "line", 352
    find_lex $P1285, "$past"
    find_lex $P1286, "$past"
    $P1287 = $P1286."negate"()
    isfalse $I1288, $P1287
    $P1285."negate"($I1288)
.annotate "line", 353
    find_lex $P1289, "$past"
    $P1289."subtype"("zerowidth")
  if_1279_end:
.annotate "line", 358
    find_lex $P1293, "$/"
    find_lex $P1294, "$past"
    $P1295 = $P1293."!make"($P1294)
.annotate "line", 348
    .return ($P1295)
  control_1274:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1296, exception, "payload"
    .return ($P1296)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<method>"  :subid("78_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_1300
.annotate "line", 361
    new $P1299, 'ExceptionHandler'
    set_addr $P1299, control_1298
    $P1299."handle_types"(58)
    push_eh $P1299
    .lex "self", self
    .lex "$/", param_1300
.annotate "line", 362
    new $P1301, "Undef"
    .lex "$past", $P1301
    find_lex $P1302, "$/"
    unless_null $P1302, vivify_299
    new $P1302, "Hash"
  vivify_299:
    set $P1303, $P1302["assertion"]
    unless_null $P1303, vivify_300
    new $P1303, "Undef"
  vivify_300:
    $P1304 = $P1303."ast"()
    store_lex "$past", $P1304
.annotate "line", 363
    find_lex $P1305, "$past"
    $P1305."subtype"("method")
.annotate "line", 364
    find_lex $P1306, "$past"
    $P1306."name"("")
.annotate "line", 365
    find_lex $P1307, "$/"
    find_lex $P1308, "$past"
    $P1309 = $P1307."!make"($P1308)
.annotate "line", 361
    .return ($P1309)
  control_1298:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1310, exception, "payload"
    .return ($P1310)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<name>"  :subid("79_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_1314
.annotate "line", 368
    .const 'Sub' $P1372 = "81_1258897733.2844" 
    capture_lex $P1372
    .const 'Sub' $P1336 = "80_1258897733.2844" 
    capture_lex $P1336
    new $P1313, 'ExceptionHandler'
    set_addr $P1313, control_1312
    $P1313."handle_types"(58)
    push_eh $P1313
    .lex "self", self
    .lex "$/", param_1314
.annotate "line", 369
    new $P1315, "Undef"
    .lex "$name", $P1315
.annotate "line", 370
    new $P1316, "Undef"
    .lex "$past", $P1316
.annotate "line", 369
    find_lex $P1317, "$/"
    unless_null $P1317, vivify_301
    new $P1317, "Hash"
  vivify_301:
    set $P1318, $P1317["longname"]
    unless_null $P1318, vivify_302
    new $P1318, "Undef"
  vivify_302:
    set $S1319, $P1318
    new $P1320, 'String'
    set $P1320, $S1319
    store_lex "$name", $P1320
    find_lex $P1321, "$past"
.annotate "line", 371
    find_lex $P1323, "$/"
    unless_null $P1323, vivify_303
    new $P1323, "Hash"
  vivify_303:
    set $P1324, $P1323["assertion"]
    unless_null $P1324, vivify_304
    new $P1324, "Undef"
  vivify_304:
    if $P1324, if_1322
.annotate "line", 375
    find_lex $P1332, "$name"
    set $S1333, $P1332
    iseq $I1334, $S1333, "sym"
    if $I1334, if_1331
.annotate "line", 391
    get_hll_global $P1346, ["PAST"], "Regex"
    find_lex $P1347, "$name"
    find_lex $P1348, "$name"
    find_lex $P1349, "$/"
    $P1350 = $P1346."new"($P1347, $P1348 :named("name"), "subrule" :named("pasttype"), "capture" :named("subtype"), $P1349 :named("node"))
    store_lex "$past", $P1350
.annotate "line", 393
    find_lex $P1352, "$/"
    unless_null $P1352, vivify_305
    new $P1352, "Hash"
  vivify_305:
    set $P1353, $P1352["nibbler"]
    unless_null $P1353, vivify_306
    new $P1353, "Undef"
  vivify_306:
    if $P1353, if_1351
.annotate "line", 396
    find_lex $P1361, "$/"
    unless_null $P1361, vivify_307
    new $P1361, "Hash"
  vivify_307:
    set $P1362, $P1361["arglist"]
    unless_null $P1362, vivify_308
    new $P1362, "Undef"
  vivify_308:
    unless $P1362, if_1360_end
.annotate "line", 397
    find_lex $P1364, "$/"
    unless_null $P1364, vivify_309
    new $P1364, "Hash"
  vivify_309:
    set $P1365, $P1364["arglist"]
    unless_null $P1365, vivify_310
    new $P1365, "ResizablePMCArray"
  vivify_310:
    set $P1366, $P1365[0]
    unless_null $P1366, vivify_311
    new $P1366, "Undef"
  vivify_311:
    $P1367 = $P1366."ast"()
    $P1368 = $P1367."list"()
    defined $I1369, $P1368
    unless $I1369, for_undef_312
    iter $P1363, $P1368
    new $P1378, 'ExceptionHandler'
    set_addr $P1378, loop1377_handler
    $P1378."handle_types"(65, 67, 66)
    push_eh $P1378
  loop1377_test:
    unless $P1363, loop1377_done
    shift $P1370, $P1363
  loop1377_redo:
    .const 'Sub' $P1372 = "81_1258897733.2844" 
    capture_lex $P1372
    $P1372($P1370)
  loop1377_next:
    goto loop1377_test
  loop1377_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1379, exception, 'type'
    eq $P1379, 65, loop1377_next
    eq $P1379, 67, loop1377_redo
  loop1377_done:
    pop_eh 
  for_undef_312:
  if_1360_end:
.annotate "line", 396
    goto if_1351_end
  if_1351:
.annotate "line", 394
    find_lex $P1354, "$past"
    find_lex $P1355, "$/"
    unless_null $P1355, vivify_313
    new $P1355, "Hash"
  vivify_313:
    set $P1356, $P1355["nibbler"]
    unless_null $P1356, vivify_314
    new $P1356, "ResizablePMCArray"
  vivify_314:
    set $P1357, $P1356[0]
    unless_null $P1357, vivify_315
    new $P1357, "Undef"
  vivify_315:
    $P1358 = $P1357."ast"()
    $P1359 = "buildsub"($P1358)
    $P1354."push"($P1359)
  if_1351_end:
.annotate "line", 390
    goto if_1331_end
  if_1331:
.annotate "line", 375
    .const 'Sub' $P1336 = "80_1258897733.2844" 
    capture_lex $P1336
    $P1336()
  if_1331_end:
    goto if_1322_end
  if_1322:
.annotate "line", 372
    find_lex $P1325, "$/"
    unless_null $P1325, vivify_316
    new $P1325, "Hash"
  vivify_316:
    set $P1326, $P1325["assertion"]
    unless_null $P1326, vivify_317
    new $P1326, "ResizablePMCArray"
  vivify_317:
    set $P1327, $P1326[0]
    unless_null $P1327, vivify_318
    new $P1327, "Undef"
  vivify_318:
    $P1328 = $P1327."ast"()
    store_lex "$past", $P1328
.annotate "line", 373
    find_lex $P1329, "$past"
    find_lex $P1330, "$name"
    "subrule_alias"($P1329, $P1330)
  if_1322_end:
.annotate "line", 400
    find_lex $P1380, "$/"
    find_lex $P1381, "$past"
    $P1382 = $P1380."!make"($P1381)
.annotate "line", 368
    .return ($P1382)
  control_1312:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1383, exception, "payload"
    .return ($P1383)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1371"  :anon :subid("81_1258897733.2844") :outer("79_1258897733.2844")
    .param pmc param_1373
.annotate "line", 397
    .lex "$_", param_1373
    find_lex $P1374, "$past"
    find_lex $P1375, "$_"
    $P1376 = $P1374."push"($P1375)
    .return ($P1376)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1335"  :anon :subid("80_1258897733.2844") :outer("79_1258897733.2844")
.annotate "line", 376
    new $P1337, "Undef"
    .lex "$regexsym", $P1337

            $P0 = get_global '$REGEXNAME'
            $S0 = $P0
            $I0 = index $S0, ':sym<'
            add $I0, 5
            $S0 = substr $S0, $I0
            chopn $S0, 1
            $P1338 = box $S0
        
    store_lex "$regexsym", $P1338
.annotate "line", 385
    get_hll_global $P1339, ["PAST"], "Regex"
.annotate "line", 386
    get_hll_global $P1340, ["PAST"], "Regex"
    find_lex $P1341, "$regexsym"
    $P1342 = $P1340."new"($P1341, "literal" :named("pasttype"))
    find_lex $P1343, "$name"
    find_lex $P1344, "$/"
    $P1345 = $P1339."new"($P1342, $P1343 :named("name"), "subcapture" :named("pasttype"), $P1344 :named("node"))
.annotate "line", 385
    store_lex "$past", $P1345
.annotate "line", 375
    .return ($P1345)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "assertion:sym<[>"  :subid("82_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_1387
.annotate "line", 403
    .const 'Sub' $P1422 = "83_1258897733.2844" 
    capture_lex $P1422
    new $P1386, 'ExceptionHandler'
    set_addr $P1386, control_1385
    $P1386."handle_types"(58)
    push_eh $P1386
    .lex "self", self
    .lex "$/", param_1387
.annotate "line", 404
    new $P1388, "Undef"
    .lex "$clist", $P1388
.annotate "line", 405
    new $P1389, "Undef"
    .lex "$past", $P1389
.annotate "line", 414
    new $P1390, "Undef"
    .lex "$i", $P1390
.annotate "line", 415
    new $P1391, "Undef"
    .lex "$n", $P1391
.annotate "line", 404
    find_lex $P1392, "$/"
    unless_null $P1392, vivify_319
    new $P1392, "Hash"
  vivify_319:
    set $P1393, $P1392["cclass_elem"]
    unless_null $P1393, vivify_320
    new $P1393, "Undef"
  vivify_320:
    store_lex "$clist", $P1393
.annotate "line", 405
    find_lex $P1394, "$clist"
    unless_null $P1394, vivify_321
    new $P1394, "ResizablePMCArray"
  vivify_321:
    set $P1395, $P1394[0]
    unless_null $P1395, vivify_322
    new $P1395, "Undef"
  vivify_322:
    $P1396 = $P1395."ast"()
    store_lex "$past", $P1396
.annotate "line", 406
    find_lex $P1400, "$past"
    $P1401 = $P1400."negate"()
    if $P1401, if_1399
    set $P1398, $P1401
    goto if_1399_end
  if_1399:
    find_lex $P1402, "$past"
    $S1403 = $P1402."pasttype"()
    iseq $I1404, $S1403, "subrule"
    new $P1398, 'Integer'
    set $P1398, $I1404
  if_1399_end:
    unless $P1398, if_1397_end
.annotate "line", 407
    find_lex $P1405, "$past"
    $P1405."subtype"("zerowidth")
.annotate "line", 408
    get_hll_global $P1406, ["PAST"], "Regex"
    find_lex $P1407, "$past"
.annotate "line", 410
    get_hll_global $P1408, ["PAST"], "Regex"
    $P1409 = $P1408."new"("charclass" :named("pasttype"), "." :named("subtype"))
    find_lex $P1410, "$/"
    $P1411 = $P1406."new"($P1407, $P1409, $P1410 :named("node"))
.annotate "line", 408
    store_lex "$past", $P1411
  if_1397_end:
.annotate "line", 414
    new $P1412, "Integer"
    assign $P1412, 1
    store_lex "$i", $P1412
.annotate "line", 415
    find_lex $P1413, "$clist"
    set $N1414, $P1413
    new $P1415, 'Float'
    set $P1415, $N1414
    store_lex "$n", $P1415
.annotate "line", 416
    new $P1446, 'ExceptionHandler'
    set_addr $P1446, loop1445_handler
    $P1446."handle_types"(65, 67, 66)
    push_eh $P1446
  loop1445_test:
    find_lex $P1416, "$i"
    set $N1417, $P1416
    find_lex $P1418, "$n"
    set $N1419, $P1418
    islt $I1420, $N1417, $N1419
    unless $I1420, loop1445_done
  loop1445_redo:
    .const 'Sub' $P1422 = "83_1258897733.2844" 
    capture_lex $P1422
    $P1422()
  loop1445_next:
    goto loop1445_test
  loop1445_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1447, exception, 'type'
    eq $P1447, 65, loop1445_next
    eq $P1447, 67, loop1445_redo
  loop1445_done:
    pop_eh 
.annotate "line", 427
    find_lex $P1448, "$/"
    find_lex $P1449, "$past"
    $P1450 = $P1448."!make"($P1449)
.annotate "line", 403
    .return ($P1450)
  control_1385:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1451, exception, "payload"
    .return ($P1451)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1421"  :anon :subid("83_1258897733.2844") :outer("82_1258897733.2844")
.annotate "line", 417
    new $P1423, "Undef"
    .lex "$ast", $P1423
    find_lex $P1424, "$i"
    set $I1425, $P1424
    find_lex $P1426, "$clist"
    unless_null $P1426, vivify_323
    new $P1426, "ResizablePMCArray"
  vivify_323:
    set $P1427, $P1426[$I1425]
    unless_null $P1427, vivify_324
    new $P1427, "Undef"
  vivify_324:
    $P1428 = $P1427."ast"()
    store_lex "$ast", $P1428
.annotate "line", 418
    find_lex $P1430, "$ast"
    $P1431 = $P1430."negate"()
    if $P1431, if_1429
.annotate "line", 423
    get_hll_global $P1438, ["PAST"], "Regex"
    find_lex $P1439, "$past"
    find_lex $P1440, "$ast"
    find_lex $P1441, "$/"
    $P1442 = $P1438."new"($P1439, $P1440, "alt" :named("pasttype"), $P1441 :named("node"))
    store_lex "$past", $P1442
.annotate "line", 422
    goto if_1429_end
  if_1429:
.annotate "line", 419
    find_lex $P1432, "$ast"
    $P1432."subtype"("zerowidth")
.annotate "line", 420
    get_hll_global $P1433, ["PAST"], "Regex"
    find_lex $P1434, "$ast"
    find_lex $P1435, "$past"
    find_lex $P1436, "$/"
    $P1437 = $P1433."new"($P1434, $P1435, "concat" :named("pasttype"), $P1436 :named("node"))
    store_lex "$past", $P1437
  if_1429_end:
.annotate "line", 425
    find_lex $P1443, "$i"
    add $P1444, $P1443, 1
    store_lex "$i", $P1444
.annotate "line", 416
    .return ($P1444)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "cclass_elem"  :subid("84_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_1455
.annotate "line", 430
    .const 'Sub' $P1480 = "86_1258897733.2844" 
    capture_lex $P1480
    .const 'Sub' $P1464 = "85_1258897733.2844" 
    capture_lex $P1464
    new $P1454, 'ExceptionHandler'
    set_addr $P1454, control_1453
    $P1454."handle_types"(58)
    push_eh $P1454
    .lex "self", self
    .lex "$/", param_1455
.annotate "line", 431
    new $P1456, "Undef"
    .lex "$str", $P1456
.annotate "line", 432
    new $P1457, "Undef"
    .lex "$past", $P1457
.annotate "line", 431
    new $P1458, "String"
    assign $P1458, ""
    store_lex "$str", $P1458
    find_lex $P1459, "$past"
.annotate "line", 433
    find_lex $P1461, "$/"
    unless_null $P1461, vivify_325
    new $P1461, "Hash"
  vivify_325:
    set $P1462, $P1461["name"]
    unless_null $P1462, vivify_326
    new $P1462, "Undef"
  vivify_326:
    if $P1462, if_1460
.annotate "line", 437
    find_lex $P1475, "$/"
    unless_null $P1475, vivify_327
    new $P1475, "Hash"
  vivify_327:
    set $P1476, $P1475["charspec"]
    unless_null $P1476, vivify_328
    new $P1476, "Undef"
  vivify_328:
    defined $I1477, $P1476
    unless $I1477, for_undef_329
    iter $P1474, $P1476
    new $P1506, 'ExceptionHandler'
    set_addr $P1506, loop1505_handler
    $P1506."handle_types"(65, 67, 66)
    push_eh $P1506
  loop1505_test:
    unless $P1474, loop1505_done
    shift $P1478, $P1474
  loop1505_redo:
    .const 'Sub' $P1480 = "86_1258897733.2844" 
    capture_lex $P1480
    $P1480($P1478)
  loop1505_next:
    goto loop1505_test
  loop1505_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1507, exception, 'type'
    eq $P1507, 65, loop1505_next
    eq $P1507, 67, loop1505_redo
  loop1505_done:
    pop_eh 
  for_undef_329:
.annotate "line", 462
    get_hll_global $P1508, ["PAST"], "Regex"
    find_lex $P1509, "$str"
    find_lex $P1510, "$/"
    $P1511 = $P1508."new"($P1509, "enumcharlist" :named("pasttype"), $P1510 :named("node"))
    store_lex "$past", $P1511
.annotate "line", 436
    goto if_1460_end
  if_1460:
.annotate "line", 433
    .const 'Sub' $P1464 = "85_1258897733.2844" 
    capture_lex $P1464
    $P1464()
  if_1460_end:
.annotate "line", 464
    find_lex $P1512, "$past"
    find_lex $P1513, "$/"
    unless_null $P1513, vivify_341
    new $P1513, "Hash"
  vivify_341:
    set $P1514, $P1513["sign"]
    unless_null $P1514, vivify_342
    new $P1514, "Undef"
  vivify_342:
    set $S1515, $P1514
    iseq $I1516, $S1515, "-"
    $P1512."negate"($I1516)
.annotate "line", 465
    find_lex $P1517, "$/"
    find_lex $P1518, "$past"
    $P1519 = $P1517."!make"($P1518)
.annotate "line", 430
    .return ($P1519)
  control_1453:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1520, exception, "payload"
    .return ($P1520)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1479"  :anon :subid("86_1258897733.2844") :outer("84_1258897733.2844")
    .param pmc param_1481
.annotate "line", 437
    .const 'Sub' $P1487 = "87_1258897733.2844" 
    capture_lex $P1487
    .lex "$_", param_1481
.annotate "line", 438
    find_lex $P1484, "$_"
    unless_null $P1484, vivify_330
    new $P1484, "ResizablePMCArray"
  vivify_330:
    set $P1485, $P1484[1]
    unless_null $P1485, vivify_331
    new $P1485, "Undef"
  vivify_331:
    if $P1485, if_1483
.annotate "line", 460
    find_lex $P1501, "$str"
    find_lex $P1502, "$_"
    unless_null $P1502, vivify_332
    new $P1502, "ResizablePMCArray"
  vivify_332:
    set $P1503, $P1502[0]
    unless_null $P1503, vivify_333
    new $P1503, "Undef"
  vivify_333:
    concat $P1504, $P1501, $P1503
    store_lex "$str", $P1504
    set $P1482, $P1504
.annotate "line", 438
    goto if_1483_end
  if_1483:
    .const 'Sub' $P1487 = "87_1258897733.2844" 
    capture_lex $P1487
    $P1500 = $P1487()
    set $P1482, $P1500
  if_1483_end:
.annotate "line", 437
    .return ($P1482)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1486"  :anon :subid("87_1258897733.2844") :outer("86_1258897733.2844")
.annotate "line", 439
    new $P1488, "Undef"
    .lex "$a", $P1488
.annotate "line", 440
    new $P1489, "Undef"
    .lex "$b", $P1489
.annotate "line", 441
    new $P1490, "Undef"
    .lex "$c", $P1490
.annotate "line", 439
    find_lex $P1491, "$_"
    unless_null $P1491, vivify_334
    new $P1491, "ResizablePMCArray"
  vivify_334:
    set $P1492, $P1491[0]
    unless_null $P1492, vivify_335
    new $P1492, "Undef"
  vivify_335:
    store_lex "$a", $P1492
.annotate "line", 440
    find_lex $P1493, "$_"
    unless_null $P1493, vivify_336
    new $P1493, "ResizablePMCArray"
  vivify_336:
    set $P1494, $P1493[1]
    unless_null $P1494, vivify_337
    new $P1494, "ResizablePMCArray"
  vivify_337:
    set $P1495, $P1494[0]
    unless_null $P1495, vivify_338
    new $P1495, "Undef"
  vivify_338:
    store_lex "$b", $P1495
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
                             $P1496 = box $S2
                         
    store_lex "$c", $P1496
.annotate "line", 458
    find_lex $P1497, "$str"
    find_lex $P1498, "$c"
    concat $P1499, $P1497, $P1498
    store_lex "$str", $P1499
.annotate "line", 438
    .return ($P1499)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1463"  :anon :subid("85_1258897733.2844") :outer("84_1258897733.2844")
.annotate "line", 434
    new $P1465, "Undef"
    .lex "$name", $P1465
    find_lex $P1466, "$/"
    unless_null $P1466, vivify_339
    new $P1466, "Hash"
  vivify_339:
    set $P1467, $P1466["name"]
    unless_null $P1467, vivify_340
    new $P1467, "Undef"
  vivify_340:
    set $S1468, $P1467
    new $P1469, 'String'
    set $P1469, $S1468
    store_lex "$name", $P1469
.annotate "line", 435
    get_hll_global $P1470, ["PAST"], "Regex"
    find_lex $P1471, "$name"
    find_lex $P1472, "$/"
    $P1473 = $P1470."new"($P1471, "subrule" :named("pasttype"), "method" :named("subtype"), $P1472 :named("node"))
    store_lex "$past", $P1473
.annotate "line", 433
    .return ($P1473)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "mod_internal"  :subid("88_1258897733.2844") :method :outer("11_1258897733.2844")
    .param pmc param_1524
.annotate "line", 468
    new $P1523, 'ExceptionHandler'
    set_addr $P1523, control_1522
    $P1523."handle_types"(58)
    push_eh $P1523
    .lex "self", self
    .lex "$/", param_1524
.annotate "line", 469
    new $P1525, "Hash"
    .lex "%mods", $P1525
.annotate "line", 470
    new $P1526, "Undef"
    .lex "$n", $P1526
.annotate "line", 469
    get_global $P1527, "@MODIFIERS"
    unless_null $P1527, vivify_343
    new $P1527, "ResizablePMCArray"
  vivify_343:
    set $P1528, $P1527[0]
    unless_null $P1528, vivify_344
    new $P1528, "Undef"
  vivify_344:
    store_lex "%mods", $P1528
.annotate "line", 470
    find_lex $P1531, "$/"
    unless_null $P1531, vivify_345
    new $P1531, "Hash"
  vivify_345:
    set $P1532, $P1531["n"]
    unless_null $P1532, vivify_346
    new $P1532, "ResizablePMCArray"
  vivify_346:
    set $P1533, $P1532[0]
    unless_null $P1533, vivify_347
    new $P1533, "Undef"
  vivify_347:
    set $S1534, $P1533
    isgt $I1535, $S1534, ""
    if $I1535, if_1530
    new $P1540, "Integer"
    assign $P1540, 1
    set $P1529, $P1540
    goto if_1530_end
  if_1530:
    find_lex $P1536, "$/"
    unless_null $P1536, vivify_348
    new $P1536, "Hash"
  vivify_348:
    set $P1537, $P1536["n"]
    unless_null $P1537, vivify_349
    new $P1537, "ResizablePMCArray"
  vivify_349:
    set $P1538, $P1537[0]
    unless_null $P1538, vivify_350
    new $P1538, "Undef"
  vivify_350:
    set $N1539, $P1538
    new $P1529, 'Float'
    set $P1529, $N1539
  if_1530_end:
    store_lex "$n", $P1529
.annotate "line", 471
    find_lex $P1541, "$n"
    find_lex $P1542, "$/"
    unless_null $P1542, vivify_351
    new $P1542, "Hash"
  vivify_351:
    set $P1543, $P1542["mod_ident"]
    unless_null $P1543, vivify_352
    new $P1543, "Hash"
  vivify_352:
    set $P1544, $P1543["sym"]
    unless_null $P1544, vivify_353
    new $P1544, "Undef"
  vivify_353:
    set $S1545, $P1544
    find_lex $P1546, "%mods"
    unless_null $P1546, vivify_354
    new $P1546, "Hash"
    store_lex "%mods", $P1546
  vivify_354:
    set $P1546[$S1545], $P1541
.annotate "line", 472
    find_lex $P1547, "$/"
    $P1548 = $P1547."!make"(0)
.annotate "line", 468
    .return ($P1548)
  control_1522:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1549, exception, "payload"
    .return ($P1549)
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
