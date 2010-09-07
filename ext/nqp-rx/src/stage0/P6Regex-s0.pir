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
.sub "_block11"  :anon :subid("10_1283874333.85778")
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
    $P597 = $P14()
.annotate 'line', 1
    .return ($P597)
    .const 'Sub' $P599 = "168_1283874333.85778" 
    .return ($P599)
.end


.namespace []
.sub "" :load :init :subid("post169") :outer("10_1283874333.85778")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1283874333.85778" 
    .local pmc block
    set block, $P12
    $P602 = get_root_global ["parrot"], "P6metaclass"
    $P602."new_class"("Regex::P6Regex::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block13"  :subid("11_1283874333.85778") :outer("10_1283874333.85778")
.annotate 'line', 3
    .const 'Sub' $P586 = "165_1283874333.85778" 
    capture_lex $P586
    .const 'Sub' $P579 = "163_1283874333.85778" 
    capture_lex $P579
    .const 'Sub' $P572 = "161_1283874333.85778" 
    capture_lex $P572
    .const 'Sub' $P552 = "156_1283874333.85778" 
    capture_lex $P552
    .const 'Sub' $P518 = "150_1283874333.85778" 
    capture_lex $P518
    .const 'Sub' $P506 = "147_1283874333.85778" 
    capture_lex $P506
    .const 'Sub' $P494 = "144_1283874333.85778" 
    capture_lex $P494
    .const 'Sub' $P488 = "142_1283874333.85778" 
    capture_lex $P488
    .const 'Sub' $P477 = "139_1283874333.85778" 
    capture_lex $P477
    .const 'Sub' $P466 = "136_1283874333.85778" 
    capture_lex $P466
    .const 'Sub' $P457 = "132_1283874333.85778" 
    capture_lex $P457
    .const 'Sub' $P447 = "129_1283874333.85778" 
    capture_lex $P447
    .const 'Sub' $P441 = "127_1283874333.85778" 
    capture_lex $P441
    .const 'Sub' $P435 = "125_1283874333.85778" 
    capture_lex $P435
    .const 'Sub' $P429 = "123_1283874333.85778" 
    capture_lex $P429
    .const 'Sub' $P423 = "121_1283874333.85778" 
    capture_lex $P423
    .const 'Sub' $P415 = "119_1283874333.85778" 
    capture_lex $P415
    .const 'Sub' $P404 = "117_1283874333.85778" 
    capture_lex $P404
    .const 'Sub' $P393 = "115_1283874333.85778" 
    capture_lex $P393
    .const 'Sub' $P387 = "113_1283874333.85778" 
    capture_lex $P387
    .const 'Sub' $P381 = "111_1283874333.85778" 
    capture_lex $P381
    .const 'Sub' $P375 = "109_1283874333.85778" 
    capture_lex $P375
    .const 'Sub' $P369 = "107_1283874333.85778" 
    capture_lex $P369
    .const 'Sub' $P363 = "105_1283874333.85778" 
    capture_lex $P363
    .const 'Sub' $P357 = "103_1283874333.85778" 
    capture_lex $P357
    .const 'Sub' $P351 = "101_1283874333.85778" 
    capture_lex $P351
    .const 'Sub' $P345 = "99_1283874333.85778" 
    capture_lex $P345
    .const 'Sub' $P333 = "95_1283874333.85778" 
    capture_lex $P333
    .const 'Sub' $P323 = "93_1283874333.85778" 
    capture_lex $P323
    .const 'Sub' $P316 = "91_1283874333.85778" 
    capture_lex $P316
    .const 'Sub' $P304 = "89_1283874333.85778" 
    capture_lex $P304
    .const 'Sub' $P297 = "87_1283874333.85778" 
    capture_lex $P297
    .const 'Sub' $P291 = "85_1283874333.85778" 
    capture_lex $P291
    .const 'Sub' $P285 = "83_1283874333.85778" 
    capture_lex $P285
    .const 'Sub' $P279 = "81_1283874333.85778" 
    capture_lex $P279
    .const 'Sub' $P272 = "79_1283874333.85778" 
    capture_lex $P272
    .const 'Sub' $P265 = "77_1283874333.85778" 
    capture_lex $P265
    .const 'Sub' $P258 = "75_1283874333.85778" 
    capture_lex $P258
    .const 'Sub' $P251 = "73_1283874333.85778" 
    capture_lex $P251
    .const 'Sub' $P245 = "71_1283874333.85778" 
    capture_lex $P245
    .const 'Sub' $P239 = "69_1283874333.85778" 
    capture_lex $P239
    .const 'Sub' $P233 = "67_1283874333.85778" 
    capture_lex $P233
    .const 'Sub' $P227 = "65_1283874333.85778" 
    capture_lex $P227
    .const 'Sub' $P221 = "63_1283874333.85778" 
    capture_lex $P221
    .const 'Sub' $P216 = "61_1283874333.85778" 
    capture_lex $P216
    .const 'Sub' $P211 = "59_1283874333.85778" 
    capture_lex $P211
    .const 'Sub' $P205 = "57_1283874333.85778" 
    capture_lex $P205
    .const 'Sub' $P199 = "55_1283874333.85778" 
    capture_lex $P199
    .const 'Sub' $P193 = "53_1283874333.85778" 
    capture_lex $P193
    .const 'Sub' $P178 = "48_1283874333.85778" 
    capture_lex $P178
    .const 'Sub' $P163 = "46_1283874333.85778" 
    capture_lex $P163
    .const 'Sub' $P156 = "44_1283874333.85778" 
    capture_lex $P156
    .const 'Sub' $P149 = "42_1283874333.85778" 
    capture_lex $P149
    .const 'Sub' $P142 = "40_1283874333.85778" 
    capture_lex $P142
    .const 'Sub' $P125 = "35_1283874333.85778" 
    capture_lex $P125
    .const 'Sub' $P113 = "32_1283874333.85778" 
    capture_lex $P113
    .const 'Sub' $P106 = "30_1283874333.85778" 
    capture_lex $P106
    .const 'Sub' $P97 = "28_1283874333.85778" 
    capture_lex $P97
    .const 'Sub' $P87 = "26_1283874333.85778" 
    capture_lex $P87
    .const 'Sub' $P80 = "24_1283874333.85778" 
    capture_lex $P80
    .const 'Sub' $P68 = "22_1283874333.85778" 
    capture_lex $P68
    .const 'Sub' $P61 = "20_1283874333.85778" 
    capture_lex $P61
    .const 'Sub' $P54 = "18_1283874333.85778" 
    capture_lex $P54
    .const 'Sub' $P44 = "15_1283874333.85778" 
    capture_lex $P44
    .const 'Sub' $P37 = "13_1283874333.85778" 
    capture_lex $P37
    .const 'Sub' $P15 = "12_1283874333.85778" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    .const 'Sub' $P586 = "165_1283874333.85778" 
    capture_lex $P586
    .return ($P586)
    .const 'Sub' $P594 = "167_1283874333.85778" 
    .return ($P594)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.include "except_types.pasm"
.sub "obs"  :subid("12_1283874333.85778") :method :outer("11_1283874333.85778")
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
    if has_param_20, optparam_170
    new $P21, "String"
    assign $P21, "in Perl 6"
    set param_20, $P21
  optparam_170:
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
.sub "ws"  :subid("13_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx38_tgt
    .local int rx38_pos
    .local int rx38_off
    .local int rx38_eos
    .local int rx38_rep
    .local pmc rx38_cur
    .local pmc rx38_debug
    (rx38_cur, rx38_pos, rx38_tgt, $I10) = self."!cursor_start"()
    getattribute rx38_debug, rx38_cur, "$!debug"
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
    if_null rx38_debug, debug_171
    rx38_cur."!cursor_debug"("START", "ws")
  debug_171:
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
    ord $I11, rx38_tgt, $I11
    ne $I11, 35, rx38_fail
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
    if_null rx38_debug, debug_172
    rx38_cur."!cursor_debug"("PASS", "ws", " at pos=", rx38_pos)
  debug_172:
    .return (rx38_cur)
  rx38_restart:
.annotate 'line', 3
    if_null rx38_debug, debug_173
    rx38_cur."!cursor_debug"("NEXT", "ws")
  debug_173:
  rx38_fail:
    (rx38_rep, rx38_pos, $I10, $P10) = rx38_cur."!mark_fail"(0)
    lt rx38_pos, -1, rx38_done
    eq rx38_pos, -1, rx38_fail
    jump $I10
  rx38_done:
    rx38_cur."!cursor_fail"()
    if_null rx38_debug, debug_174
    rx38_cur."!cursor_debug"("FAIL", "ws")
  debug_174:
    .return (rx38_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__ws"  :subid("14_1283874333.85778") :method
.annotate 'line', 3
    new $P40, "ResizablePMCArray"
    push $P40, ""
    .return ($P40)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "normspace"  :subid("15_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .const 'Sub' $P50 = "17_1283874333.85778" 
    capture_lex $P50
    .local string rx45_tgt
    .local int rx45_pos
    .local int rx45_off
    .local int rx45_eos
    .local int rx45_rep
    .local pmc rx45_cur
    .local pmc rx45_debug
    (rx45_cur, rx45_pos, rx45_tgt, $I10) = self."!cursor_start"()
    getattribute rx45_debug, rx45_cur, "$!debug"
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
    if_null rx45_debug, debug_175
    rx45_cur."!cursor_debug"("START", "normspace")
  debug_175:
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
    .const 'Sub' $P50 = "17_1283874333.85778" 
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
    if_null rx45_debug, debug_180
    rx45_cur."!cursor_debug"("PASS", "normspace", " at pos=", rx45_pos)
  debug_180:
    .return (rx45_cur)
  rx45_restart:
.annotate 'line', 3
    if_null rx45_debug, debug_181
    rx45_cur."!cursor_debug"("NEXT", "normspace")
  debug_181:
  rx45_fail:
    (rx45_rep, rx45_pos, $I10, $P10) = rx45_cur."!mark_fail"(0)
    lt rx45_pos, -1, rx45_done
    eq rx45_pos, -1, rx45_fail
    jump $I10
  rx45_done:
    rx45_cur."!cursor_fail"()
    if_null rx45_debug, debug_182
    rx45_cur."!cursor_debug"("FAIL", "normspace")
  debug_182:
    .return (rx45_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__normspace"  :subid("16_1283874333.85778") :method
.annotate 'line', 3
    new $P47, "ResizablePMCArray"
    push $P47, ""
    .return ($P47)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block49"  :anon :subid("17_1283874333.85778") :method :outer("15_1283874333.85778")
.annotate 'line', 10
    .local string rx51_tgt
    .local int rx51_pos
    .local int rx51_off
    .local int rx51_eos
    .local int rx51_rep
    .local pmc rx51_cur
    .local pmc rx51_debug
    (rx51_cur, rx51_pos, rx51_tgt, $I10) = self."!cursor_start"()
    getattribute rx51_debug, rx51_cur, "$!debug"
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
    if_null rx51_debug, debug_176
    rx51_cur."!cursor_debug"("START", "")
  debug_176:
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
    ord $I11, rx51_tgt, $I11
    ne $I11, 35, rx51_fail
    add rx51_pos, 1
  alt53_end:
  # rx pass
    rx51_cur."!cursor_pass"(rx51_pos, "")
    if_null rx51_debug, debug_177
    rx51_cur."!cursor_debug"("PASS", "", " at pos=", rx51_pos)
  debug_177:
    .return (rx51_cur)
  rx51_restart:
    if_null rx51_debug, debug_178
    rx51_cur."!cursor_debug"("NEXT", "")
  debug_178:
  rx51_fail:
    (rx51_rep, rx51_pos, $I10, $P10) = rx51_cur."!mark_fail"(0)
    lt rx51_pos, -1, rx51_done
    eq rx51_pos, -1, rx51_fail
    jump $I10
  rx51_done:
    rx51_cur."!cursor_fail"()
    if_null rx51_debug, debug_179
    rx51_cur."!cursor_debug"("FAIL", "")
  debug_179:
    .return (rx51_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "identifier"  :subid("18_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx55_tgt
    .local int rx55_pos
    .local int rx55_off
    .local int rx55_eos
    .local int rx55_rep
    .local pmc rx55_cur
    .local pmc rx55_debug
    (rx55_cur, rx55_pos, rx55_tgt, $I10) = self."!cursor_start"()
    getattribute rx55_debug, rx55_cur, "$!debug"
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
    if_null rx55_debug, debug_183
    rx55_cur."!cursor_debug"("START", "identifier")
  debug_183:
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
    if_null rx55_debug, debug_184
    rx55_cur."!cursor_debug"("PASS", "identifier", " at pos=", rx55_pos)
  debug_184:
    .return (rx55_cur)
  rx55_restart:
.annotate 'line', 3
    if_null rx55_debug, debug_185
    rx55_cur."!cursor_debug"("NEXT", "identifier")
  debug_185:
  rx55_fail:
    (rx55_rep, rx55_pos, $I10, $P10) = rx55_cur."!mark_fail"(0)
    lt rx55_pos, -1, rx55_done
    eq rx55_pos, -1, rx55_fail
    jump $I10
  rx55_done:
    rx55_cur."!cursor_fail"()
    if_null rx55_debug, debug_186
    rx55_cur."!cursor_debug"("FAIL", "identifier")
  debug_186:
    .return (rx55_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__identifier"  :subid("19_1283874333.85778") :method
.annotate 'line', 3
    $P57 = self."!PREFIX__!subrule"("ident", "")
    new $P58, "ResizablePMCArray"
    push $P58, $P57
    .return ($P58)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "arg"  :subid("20_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx62_tgt
    .local int rx62_pos
    .local int rx62_off
    .local int rx62_eos
    .local int rx62_rep
    .local pmc rx62_cur
    .local pmc rx62_debug
    (rx62_cur, rx62_pos, rx62_tgt, $I10) = self."!cursor_start"()
    getattribute rx62_debug, rx62_cur, "$!debug"
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
    if_null rx62_debug, debug_187
    rx62_cur."!cursor_debug"("START", "arg")
  debug_187:
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
    if_null rx62_debug, debug_188
    rx62_cur."!cursor_debug"("PASS", "arg", " at pos=", rx62_pos)
  debug_188:
    .return (rx62_cur)
  rx62_restart:
.annotate 'line', 3
    if_null rx62_debug, debug_189
    rx62_cur."!cursor_debug"("NEXT", "arg")
  debug_189:
  rx62_fail:
    (rx62_rep, rx62_pos, $I10, $P10) = rx62_cur."!mark_fail"(0)
    lt rx62_pos, -1, rx62_done
    eq rx62_pos, -1, rx62_fail
    jump $I10
  rx62_done:
    rx62_cur."!cursor_fail"()
    if_null rx62_debug, debug_190
    rx62_cur."!cursor_debug"("FAIL", "arg")
  debug_190:
    .return (rx62_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__arg"  :subid("21_1283874333.85778") :method
.annotate 'line', 3
    new $P64, "ResizablePMCArray"
    push $P64, ""
    push $P64, "\""
    push $P64, "'"
    .return ($P64)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "arglist"  :subid("22_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx69_tgt
    .local int rx69_pos
    .local int rx69_off
    .local int rx69_eos
    .local int rx69_rep
    .local pmc rx69_cur
    .local pmc rx69_debug
    (rx69_cur, rx69_pos, rx69_tgt, $I10) = self."!cursor_start"()
    rx69_cur."!cursor_caparray"("arg")
    getattribute rx69_debug, rx69_cur, "$!debug"
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
    if_null rx69_debug, debug_191
    rx69_cur."!cursor_debug"("START", "arglist")
  debug_191:
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
    ord $I11, rx69_tgt, $I11
    ne $I11, 44, rx69_fail
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
    if_null rx69_debug, debug_192
    rx69_cur."!cursor_debug"("PASS", "arglist", " at pos=", rx69_pos)
  debug_192:
    .return (rx69_cur)
  rx69_restart:
.annotate 'line', 3
    if_null rx69_debug, debug_193
    rx69_cur."!cursor_debug"("NEXT", "arglist")
  debug_193:
  rx69_fail:
    (rx69_rep, rx69_pos, $I10, $P10) = rx69_cur."!mark_fail"(0)
    lt rx69_pos, -1, rx69_done
    eq rx69_pos, -1, rx69_fail
    jump $I10
  rx69_done:
    rx69_cur."!cursor_fail"()
    if_null rx69_debug, debug_194
    rx69_cur."!cursor_debug"("FAIL", "arglist")
  debug_194:
    .return (rx69_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__arglist"  :subid("23_1283874333.85778") :method
.annotate 'line', 3
    $P71 = self."!PREFIX__!subrule"("ws", "")
    new $P72, "ResizablePMCArray"
    push $P72, $P71
    .return ($P72)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "TOP"  :subid("24_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx81_tgt
    .local int rx81_pos
    .local int rx81_off
    .local int rx81_eos
    .local int rx81_rep
    .local pmc rx81_cur
    .local pmc rx81_debug
    (rx81_cur, rx81_pos, rx81_tgt, $I10) = self."!cursor_start"()
    getattribute rx81_debug, rx81_cur, "$!debug"
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
    if_null rx81_debug, debug_195
    rx81_cur."!cursor_debug"("START", "TOP")
  debug_195:
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
    if_null rx81_debug, debug_196
    rx81_cur."!cursor_debug"("PASS", "TOP", " at pos=", rx81_pos)
  debug_196:
    .return (rx81_cur)
  rx81_restart:
.annotate 'line', 3
    if_null rx81_debug, debug_197
    rx81_cur."!cursor_debug"("NEXT", "TOP")
  debug_197:
  rx81_fail:
    (rx81_rep, rx81_pos, $I10, $P10) = rx81_cur."!mark_fail"(0)
    lt rx81_pos, -1, rx81_done
    eq rx81_pos, -1, rx81_fail
    jump $I10
  rx81_done:
    rx81_cur."!cursor_fail"()
    if_null rx81_debug, debug_198
    rx81_cur."!cursor_debug"("FAIL", "TOP")
  debug_198:
    .return (rx81_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__TOP"  :subid("25_1283874333.85778") :method
.annotate 'line', 3
    $P83 = self."!PREFIX__!subrule"("nibbler", "")
    new $P84, "ResizablePMCArray"
    push $P84, $P83
    .return ($P84)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "nibbler"  :subid("26_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx88_tgt
    .local int rx88_pos
    .local int rx88_off
    .local int rx88_eos
    .local int rx88_rep
    .local pmc rx88_cur
    .local pmc rx88_debug
    (rx88_cur, rx88_pos, rx88_tgt, $I10) = self."!cursor_start"()
    rx88_cur."!cursor_caparray"("termconj")
    getattribute rx88_debug, rx88_cur, "$!debug"
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
    if_null rx88_debug, debug_199
    rx88_cur."!cursor_debug"("START", "nibbler")
  debug_199:
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
    ord $I11, rx88_tgt, $I11
    ne $I11, 124, rx88_fail
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
    ord $I11, rx88_tgt, $I11
    ne $I11, 38, rx88_fail
    add rx88_pos, 1
  alt93_end:
    set_addr $I10, rxquantr92_done
    (rx88_rep) = rx88_cur."!mark_commit"($I10)
  rxquantr92_done:
.annotate 'line', 32
  # rx subrule "termconj" subtype=capture negate=
    rx88_cur."!cursor_pos"(rx88_pos)
    $P10 = rx88_cur."termconj"()
    unless $P10, rx88_fail
    rx88_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("termconj")
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
    ord $I11, rx88_tgt, $I11
    ne $I11, 124, rx88_fail
    add rx88_pos, 1
  alt95_end:
  alt96_0:
.annotate 'line', 34
    set_addr $I10, alt96_1
    rx88_cur."!mark_push"(0, rx88_pos, $I10)
  # rx subrule "termconj" subtype=capture negate=
    rx88_cur."!cursor_pos"(rx88_pos)
    $P10 = rx88_cur."termconj"()
    unless $P10, rx88_fail
    rx88_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("termconj")
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
    if_null rx88_debug, debug_200
    rx88_cur."!cursor_debug"("PASS", "nibbler", " at pos=", rx88_pos)
  debug_200:
    .return (rx88_cur)
  rx88_restart:
.annotate 'line', 3
    if_null rx88_debug, debug_201
    rx88_cur."!cursor_debug"("NEXT", "nibbler")
  debug_201:
  rx88_fail:
    (rx88_rep, rx88_pos, $I10, $P10) = rx88_cur."!mark_fail"(0)
    lt rx88_pos, -1, rx88_done
    eq rx88_pos, -1, rx88_fail
    jump $I10
  rx88_done:
    rx88_cur."!cursor_fail"()
    if_null rx88_debug, debug_202
    rx88_cur."!cursor_debug"("FAIL", "nibbler")
  debug_202:
    .return (rx88_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__nibbler"  :subid("27_1283874333.85778") :method
.annotate 'line', 3
    new $P90, "ResizablePMCArray"
    push $P90, ""
    .return ($P90)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "termconj"  :subid("28_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx98_tgt
    .local int rx98_pos
    .local int rx98_off
    .local int rx98_eos
    .local int rx98_rep
    .local pmc rx98_cur
    .local pmc rx98_debug
    (rx98_cur, rx98_pos, rx98_tgt, $I10) = self."!cursor_start"()
    rx98_cur."!cursor_caparray"("termish")
    getattribute rx98_debug, rx98_cur, "$!debug"
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
    if_null rx98_debug, debug_203
    rx98_cur."!cursor_debug"("START", "termconj")
  debug_203:
    $I10 = self.'from'()
    ne $I10, -1, rxscan102_done
    goto rxscan102_scan
  rxscan102_loop:
    ($P10) = rx98_cur."from"()
    inc $P10
    set rx98_pos, $P10
    ge rx98_pos, rx98_eos, rxscan102_done
  rxscan102_scan:
    set_addr $I10, rxscan102_loop
    rx98_cur."!mark_push"(0, rx98_pos, $I10)
  rxscan102_done:
.annotate 'line', 39
  # rx subrule "termish" subtype=capture negate=
    rx98_cur."!cursor_pos"(rx98_pos)
    $P10 = rx98_cur."termish"()
    unless $P10, rx98_fail
    rx98_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("termish")
    rx98_pos = $P10."pos"()
.annotate 'line', 42
  # rx rxquantr103 ** 0..*
    set_addr $I10, rxquantr103_done
    rx98_cur."!mark_push"(0, rx98_pos, $I10)
  rxquantr103_loop:
  alt104_0:
.annotate 'line', 40
    set_addr $I10, alt104_1
    rx98_cur."!mark_push"(0, rx98_pos, $I10)
  # rx literal  "&&"
    add $I11, rx98_pos, 2
    gt $I11, rx98_eos, rx98_fail
    sub $I11, rx98_pos, rx98_off
    substr $S10, rx98_tgt, $I11, 2
    ne $S10, "&&", rx98_fail
    add rx98_pos, 2
    goto alt104_end
  alt104_1:
  # rx literal  "&"
    add $I11, rx98_pos, 1
    gt $I11, rx98_eos, rx98_fail
    sub $I11, rx98_pos, rx98_off
    ord $I11, rx98_tgt, $I11
    ne $I11, 38, rx98_fail
    add rx98_pos, 1
  alt104_end:
  alt105_0:
.annotate 'line', 41
    set_addr $I10, alt105_1
    rx98_cur."!mark_push"(0, rx98_pos, $I10)
  # rx subrule "termish" subtype=capture negate=
    rx98_cur."!cursor_pos"(rx98_pos)
    $P10 = rx98_cur."termish"()
    unless $P10, rx98_fail
    rx98_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("termish")
    rx98_pos = $P10."pos"()
    goto alt105_end
  alt105_1:
  # rx subrule "panic" subtype=method negate=
    rx98_cur."!cursor_pos"(rx98_pos)
    $P10 = rx98_cur."panic"("Null pattern not allowed")
    unless $P10, rx98_fail
    rx98_pos = $P10."pos"()
  alt105_end:
.annotate 'line', 42
    set_addr $I10, rxquantr103_done
    (rx98_rep) = rx98_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr103_done
    rx98_cur."!mark_push"(rx98_rep, rx98_pos, $I10)
    goto rxquantr103_loop
  rxquantr103_done:
.annotate 'line', 38
  # rx pass
    rx98_cur."!cursor_pass"(rx98_pos, "termconj")
    if_null rx98_debug, debug_204
    rx98_cur."!cursor_debug"("PASS", "termconj", " at pos=", rx98_pos)
  debug_204:
    .return (rx98_cur)
  rx98_restart:
.annotate 'line', 3
    if_null rx98_debug, debug_205
    rx98_cur."!cursor_debug"("NEXT", "termconj")
  debug_205:
  rx98_fail:
    (rx98_rep, rx98_pos, $I10, $P10) = rx98_cur."!mark_fail"(0)
    lt rx98_pos, -1, rx98_done
    eq rx98_pos, -1, rx98_fail
    jump $I10
  rx98_done:
    rx98_cur."!cursor_fail"()
    if_null rx98_debug, debug_206
    rx98_cur."!cursor_debug"("FAIL", "termconj")
  debug_206:
    .return (rx98_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__termconj"  :subid("29_1283874333.85778") :method
.annotate 'line', 3
    $P100 = self."!PREFIX__!subrule"("termish", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "termish"  :subid("30_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx107_tgt
    .local int rx107_pos
    .local int rx107_off
    .local int rx107_eos
    .local int rx107_rep
    .local pmc rx107_cur
    .local pmc rx107_debug
    (rx107_cur, rx107_pos, rx107_tgt, $I10) = self."!cursor_start"()
    rx107_cur."!cursor_caparray"("noun")
    getattribute rx107_debug, rx107_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx107_cur
    .local pmc match
    .lex "$/", match
    length rx107_eos, rx107_tgt
    gt rx107_pos, rx107_eos, rx107_done
    set rx107_off, 0
    lt rx107_pos, 2, rx107_start
    sub rx107_off, rx107_pos, 1
    substr rx107_tgt, rx107_tgt, rx107_off
  rx107_start:
    eq $I10, 1, rx107_restart
    if_null rx107_debug, debug_207
    rx107_cur."!cursor_debug"("START", "termish")
  debug_207:
    $I10 = self.'from'()
    ne $I10, -1, rxscan110_done
    goto rxscan110_scan
  rxscan110_loop:
    ($P10) = rx107_cur."from"()
    inc $P10
    set rx107_pos, $P10
    ge rx107_pos, rx107_eos, rxscan110_done
  rxscan110_scan:
    set_addr $I10, rxscan110_loop
    rx107_cur."!mark_push"(0, rx107_pos, $I10)
  rxscan110_done:
.annotate 'line', 46
  # rx rxquantr111 ** 1..*
    set_addr $I10, rxquantr111_done
    rx107_cur."!mark_push"(0, -1, $I10)
  rxquantr111_loop:
  # rx subrule "quantified_atom" subtype=capture negate=
    rx107_cur."!cursor_pos"(rx107_pos)
    $P10 = rx107_cur."quantified_atom"()
    unless $P10, rx107_fail
    goto rxsubrule112_pass
  rxsubrule112_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx107_fail
  rxsubrule112_pass:
    set_addr $I10, rxsubrule112_back
    rx107_cur."!mark_push"(0, rx107_pos, $I10, $P10)
    $P10."!cursor_names"("noun")
    rx107_pos = $P10."pos"()
    set_addr $I10, rxquantr111_done
    (rx107_rep) = rx107_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr111_done
    rx107_cur."!mark_push"(rx107_rep, rx107_pos, $I10)
    goto rxquantr111_loop
  rxquantr111_done:
.annotate 'line', 45
  # rx pass
    rx107_cur."!cursor_pass"(rx107_pos, "termish")
    if_null rx107_debug, debug_208
    rx107_cur."!cursor_debug"("PASS", "termish", " at pos=", rx107_pos)
  debug_208:
    .return (rx107_cur)
  rx107_restart:
.annotate 'line', 3
    if_null rx107_debug, debug_209
    rx107_cur."!cursor_debug"("NEXT", "termish")
  debug_209:
  rx107_fail:
    (rx107_rep, rx107_pos, $I10, $P10) = rx107_cur."!mark_fail"(0)
    lt rx107_pos, -1, rx107_done
    eq rx107_pos, -1, rx107_fail
    jump $I10
  rx107_done:
    rx107_cur."!cursor_fail"()
    if_null rx107_debug, debug_210
    rx107_cur."!cursor_debug"("FAIL", "termish")
  debug_210:
    .return (rx107_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__termish"  :subid("31_1283874333.85778") :method
.annotate 'line', 3
    new $P109, "ResizablePMCArray"
    push $P109, ""
    .return ($P109)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantified_atom"  :subid("32_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .const 'Sub' $P122 = "34_1283874333.85778" 
    capture_lex $P122
    .local string rx114_tgt
    .local int rx114_pos
    .local int rx114_off
    .local int rx114_eos
    .local int rx114_rep
    .local pmc rx114_cur
    .local pmc rx114_debug
    (rx114_cur, rx114_pos, rx114_tgt, $I10) = self."!cursor_start"()
    rx114_cur."!cursor_caparray"("quantifier", "backmod")
    getattribute rx114_debug, rx114_cur, "$!debug"
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
    if_null rx114_debug, debug_211
    rx114_cur."!cursor_debug"("START", "quantified_atom")
  debug_211:
    $I10 = self.'from'()
    ne $I10, -1, rxscan118_done
    goto rxscan118_scan
  rxscan118_loop:
    ($P10) = rx114_cur."from"()
    inc $P10
    set rx114_pos, $P10
    ge rx114_pos, rx114_eos, rxscan118_done
  rxscan118_scan:
    set_addr $I10, rxscan118_loop
    rx114_cur."!mark_push"(0, rx114_pos, $I10)
  rxscan118_done:
.annotate 'line', 50
  # rx subrule "atom" subtype=capture negate=
    rx114_cur."!cursor_pos"(rx114_pos)
    $P10 = rx114_cur."atom"()
    unless $P10, rx114_fail
    rx114_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("atom")
    rx114_pos = $P10."pos"()
  # rx rxquantr119 ** 0..1
    set_addr $I10, rxquantr119_done
    rx114_cur."!mark_push"(0, rx114_pos, $I10)
  rxquantr119_loop:
  # rx subrule "ws" subtype=method negate=
    rx114_cur."!cursor_pos"(rx114_pos)
    $P10 = rx114_cur."ws"()
    unless $P10, rx114_fail
    rx114_pos = $P10."pos"()
  alt120_0:
    set_addr $I10, alt120_1
    rx114_cur."!mark_push"(0, rx114_pos, $I10)
  # rx subrule "quantifier" subtype=capture negate=
    rx114_cur."!cursor_pos"(rx114_pos)
    $P10 = rx114_cur."quantifier"()
    unless $P10, rx114_fail
    rx114_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantifier")
    rx114_pos = $P10."pos"()
    goto alt120_end
  alt120_1:
  # rx subrule "before" subtype=zerowidth negate=
    rx114_cur."!cursor_pos"(rx114_pos)
    .const 'Sub' $P122 = "34_1283874333.85778" 
    capture_lex $P122
    $P10 = rx114_cur."before"($P122)
    unless $P10, rx114_fail
  # rx subrule "backmod" subtype=capture negate=
    rx114_cur."!cursor_pos"(rx114_pos)
    $P10 = rx114_cur."backmod"()
    unless $P10, rx114_fail
    rx114_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx114_pos = $P10."pos"()
  # rx subrule "alpha" subtype=zerowidth negate=1
    rx114_cur."!cursor_pos"(rx114_pos)
    $P10 = rx114_cur."alpha"()
    if $P10, rx114_fail
  alt120_end:
    set_addr $I10, rxquantr119_done
    (rx114_rep) = rx114_cur."!mark_commit"($I10)
  rxquantr119_done:
.annotate 'line', 49
  # rx pass
    rx114_cur."!cursor_pass"(rx114_pos, "quantified_atom")
    if_null rx114_debug, debug_216
    rx114_cur."!cursor_debug"("PASS", "quantified_atom", " at pos=", rx114_pos)
  debug_216:
    .return (rx114_cur)
  rx114_restart:
.annotate 'line', 3
    if_null rx114_debug, debug_217
    rx114_cur."!cursor_debug"("NEXT", "quantified_atom")
  debug_217:
  rx114_fail:
    (rx114_rep, rx114_pos, $I10, $P10) = rx114_cur."!mark_fail"(0)
    lt rx114_pos, -1, rx114_done
    eq rx114_pos, -1, rx114_fail
    jump $I10
  rx114_done:
    rx114_cur."!cursor_fail"()
    if_null rx114_debug, debug_218
    rx114_cur."!cursor_debug"("FAIL", "quantified_atom")
  debug_218:
    .return (rx114_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantified_atom"  :subid("33_1283874333.85778") :method
.annotate 'line', 3
    $P116 = self."!PREFIX__!subrule"("atom", "")
    new $P117, "ResizablePMCArray"
    push $P117, $P116
    .return ($P117)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block121"  :anon :subid("34_1283874333.85778") :method :outer("32_1283874333.85778")
.annotate 'line', 50
    .local string rx123_tgt
    .local int rx123_pos
    .local int rx123_off
    .local int rx123_eos
    .local int rx123_rep
    .local pmc rx123_cur
    .local pmc rx123_debug
    (rx123_cur, rx123_pos, rx123_tgt, $I10) = self."!cursor_start"()
    getattribute rx123_debug, rx123_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx123_cur
    .local pmc match
    .lex "$/", match
    length rx123_eos, rx123_tgt
    gt rx123_pos, rx123_eos, rx123_done
    set rx123_off, 0
    lt rx123_pos, 2, rx123_start
    sub rx123_off, rx123_pos, 1
    substr rx123_tgt, rx123_tgt, rx123_off
  rx123_start:
    eq $I10, 1, rx123_restart
    if_null rx123_debug, debug_212
    rx123_cur."!cursor_debug"("START", "")
  debug_212:
    $I10 = self.'from'()
    ne $I10, -1, rxscan124_done
    goto rxscan124_scan
  rxscan124_loop:
    ($P10) = rx123_cur."from"()
    inc $P10
    set rx123_pos, $P10
    ge rx123_pos, rx123_eos, rxscan124_done
  rxscan124_scan:
    set_addr $I10, rxscan124_loop
    rx123_cur."!mark_push"(0, rx123_pos, $I10)
  rxscan124_done:
  # rx literal  ":"
    add $I11, rx123_pos, 1
    gt $I11, rx123_eos, rx123_fail
    sub $I11, rx123_pos, rx123_off
    ord $I11, rx123_tgt, $I11
    ne $I11, 58, rx123_fail
    add rx123_pos, 1
  # rx pass
    rx123_cur."!cursor_pass"(rx123_pos, "")
    if_null rx123_debug, debug_213
    rx123_cur."!cursor_debug"("PASS", "", " at pos=", rx123_pos)
  debug_213:
    .return (rx123_cur)
  rx123_restart:
    if_null rx123_debug, debug_214
    rx123_cur."!cursor_debug"("NEXT", "")
  debug_214:
  rx123_fail:
    (rx123_rep, rx123_pos, $I10, $P10) = rx123_cur."!mark_fail"(0)
    lt rx123_pos, -1, rx123_done
    eq rx123_pos, -1, rx123_fail
    jump $I10
  rx123_done:
    rx123_cur."!cursor_fail"()
    if_null rx123_debug, debug_215
    rx123_cur."!cursor_debug"("FAIL", "")
  debug_215:
    .return (rx123_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "atom"  :subid("35_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .const 'Sub' $P135 = "37_1283874333.85778" 
    capture_lex $P135
    .local string rx126_tgt
    .local int rx126_pos
    .local int rx126_off
    .local int rx126_eos
    .local int rx126_rep
    .local pmc rx126_cur
    .local pmc rx126_debug
    (rx126_cur, rx126_pos, rx126_tgt, $I10) = self."!cursor_start"()
    getattribute rx126_debug, rx126_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx126_cur
    .local pmc match
    .lex "$/", match
    length rx126_eos, rx126_tgt
    gt rx126_pos, rx126_eos, rx126_done
    set rx126_off, 0
    lt rx126_pos, 2, rx126_start
    sub rx126_off, rx126_pos, 1
    substr rx126_tgt, rx126_tgt, rx126_off
  rx126_start:
    eq $I10, 1, rx126_restart
    if_null rx126_debug, debug_219
    rx126_cur."!cursor_debug"("START", "atom")
  debug_219:
    $I10 = self.'from'()
    ne $I10, -1, rxscan130_done
    goto rxscan130_scan
  rxscan130_loop:
    ($P10) = rx126_cur."from"()
    inc $P10
    set rx126_pos, $P10
    ge rx126_pos, rx126_eos, rxscan130_done
  rxscan130_scan:
    set_addr $I10, rxscan130_loop
    rx126_cur."!mark_push"(0, rx126_pos, $I10)
  rxscan130_done:
  alt131_0:
.annotate 'line', 55
    set_addr $I10, alt131_1
    rx126_cur."!mark_push"(0, rx126_pos, $I10)
.annotate 'line', 56
  # rx charclass w
    ge rx126_pos, rx126_eos, rx126_fail
    sub $I10, rx126_pos, rx126_off
    is_cclass $I11, 8192, rx126_tgt, $I10
    unless $I11, rx126_fail
    inc rx126_pos
  # rx rxquantr132 ** 0..1
    set_addr $I10, rxquantr132_done
    rx126_cur."!mark_push"(0, rx126_pos, $I10)
  rxquantr132_loop:
  # rx rxquantg133 ** 1..*
  rxquantg133_loop:
  # rx charclass w
    ge rx126_pos, rx126_eos, rx126_fail
    sub $I10, rx126_pos, rx126_off
    is_cclass $I11, 8192, rx126_tgt, $I10
    unless $I11, rx126_fail
    inc rx126_pos
    set_addr $I10, rxquantg133_done
    rx126_cur."!mark_push"(rx126_rep, rx126_pos, $I10)
    goto rxquantg133_loop
  rxquantg133_done:
  # rx subrule "before" subtype=zerowidth negate=
    rx126_cur."!cursor_pos"(rx126_pos)
    .const 'Sub' $P135 = "37_1283874333.85778" 
    capture_lex $P135
    $P10 = rx126_cur."before"($P135)
    unless $P10, rx126_fail
    set_addr $I10, rxquantr132_done
    (rx126_rep) = rx126_cur."!mark_commit"($I10)
  rxquantr132_done:
    goto alt131_end
  alt131_1:
.annotate 'line', 57
  # rx subrule "metachar" subtype=capture negate=
    rx126_cur."!cursor_pos"(rx126_pos)
    $P10 = rx126_cur."metachar"()
    unless $P10, rx126_fail
    rx126_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("metachar")
    rx126_pos = $P10."pos"()
  alt131_end:
.annotate 'line', 53
  # rx pass
    rx126_cur."!cursor_pass"(rx126_pos, "atom")
    if_null rx126_debug, debug_224
    rx126_cur."!cursor_debug"("PASS", "atom", " at pos=", rx126_pos)
  debug_224:
    .return (rx126_cur)
  rx126_restart:
.annotate 'line', 3
    if_null rx126_debug, debug_225
    rx126_cur."!cursor_debug"("NEXT", "atom")
  debug_225:
  rx126_fail:
    (rx126_rep, rx126_pos, $I10, $P10) = rx126_cur."!mark_fail"(0)
    lt rx126_pos, -1, rx126_done
    eq rx126_pos, -1, rx126_fail
    jump $I10
  rx126_done:
    rx126_cur."!cursor_fail"()
    if_null rx126_debug, debug_226
    rx126_cur."!cursor_debug"("FAIL", "atom")
  debug_226:
    .return (rx126_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__atom"  :subid("36_1283874333.85778") :method
.annotate 'line', 3
    $P128 = self."!PREFIX__!subrule"("metachar", "")
    new $P129, "ResizablePMCArray"
    push $P129, $P128
    push $P129, ""
    .return ($P129)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block134"  :anon :subid("37_1283874333.85778") :method :outer("35_1283874333.85778")
.annotate 'line', 56
    .local string rx136_tgt
    .local int rx136_pos
    .local int rx136_off
    .local int rx136_eos
    .local int rx136_rep
    .local pmc rx136_cur
    .local pmc rx136_debug
    (rx136_cur, rx136_pos, rx136_tgt, $I10) = self."!cursor_start"()
    getattribute rx136_debug, rx136_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx136_cur
    .local pmc match
    .lex "$/", match
    length rx136_eos, rx136_tgt
    gt rx136_pos, rx136_eos, rx136_done
    set rx136_off, 0
    lt rx136_pos, 2, rx136_start
    sub rx136_off, rx136_pos, 1
    substr rx136_tgt, rx136_tgt, rx136_off
  rx136_start:
    eq $I10, 1, rx136_restart
    if_null rx136_debug, debug_220
    rx136_cur."!cursor_debug"("START", "")
  debug_220:
    $I10 = self.'from'()
    ne $I10, -1, rxscan137_done
    goto rxscan137_scan
  rxscan137_loop:
    ($P10) = rx136_cur."from"()
    inc $P10
    set rx136_pos, $P10
    ge rx136_pos, rx136_eos, rxscan137_done
  rxscan137_scan:
    set_addr $I10, rxscan137_loop
    rx136_cur."!mark_push"(0, rx136_pos, $I10)
  rxscan137_done:
  # rx charclass w
    ge rx136_pos, rx136_eos, rx136_fail
    sub $I10, rx136_pos, rx136_off
    is_cclass $I11, 8192, rx136_tgt, $I10
    unless $I11, rx136_fail
    inc rx136_pos
  # rx pass
    rx136_cur."!cursor_pass"(rx136_pos, "")
    if_null rx136_debug, debug_221
    rx136_cur."!cursor_debug"("PASS", "", " at pos=", rx136_pos)
  debug_221:
    .return (rx136_cur)
  rx136_restart:
    if_null rx136_debug, debug_222
    rx136_cur."!cursor_debug"("NEXT", "")
  debug_222:
  rx136_fail:
    (rx136_rep, rx136_pos, $I10, $P10) = rx136_cur."!mark_fail"(0)
    lt rx136_pos, -1, rx136_done
    eq rx136_pos, -1, rx136_fail
    jump $I10
  rx136_done:
    rx136_cur."!cursor_fail"()
    if_null rx136_debug, debug_223
    rx136_cur."!cursor_debug"("FAIL", "")
  debug_223:
    .return (rx136_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier"  :subid("38_1283874333.85778") :method
.annotate 'line', 61
    $P139 = self."!protoregex"("quantifier")
    .return ($P139)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier"  :subid("39_1283874333.85778") :method
.annotate 'line', 61
    $P141 = self."!PREFIX__!protoregex"("quantifier")
    .return ($P141)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<*>"  :subid("40_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx143_tgt
    .local int rx143_pos
    .local int rx143_off
    .local int rx143_eos
    .local int rx143_rep
    .local pmc rx143_cur
    .local pmc rx143_debug
    (rx143_cur, rx143_pos, rx143_tgt, $I10) = self."!cursor_start"()
    getattribute rx143_debug, rx143_cur, "$!debug"
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
    eq $I10, 1, rx143_restart
    if_null rx143_debug, debug_227
    rx143_cur."!cursor_debug"("START", "quantifier:sym<*>")
  debug_227:
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
.annotate 'line', 62
  # rx subcapture "sym"
    set_addr $I10, rxcap_148_fail
    rx143_cur."!mark_push"(0, rx143_pos, $I10)
  # rx literal  "*"
    add $I11, rx143_pos, 1
    gt $I11, rx143_eos, rx143_fail
    sub $I11, rx143_pos, rx143_off
    ord $I11, rx143_tgt, $I11
    ne $I11, 42, rx143_fail
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
    if_null rx143_debug, debug_228
    rx143_cur."!cursor_debug"("PASS", "quantifier:sym<*>", " at pos=", rx143_pos)
  debug_228:
    .return (rx143_cur)
  rx143_restart:
.annotate 'line', 3
    if_null rx143_debug, debug_229
    rx143_cur."!cursor_debug"("NEXT", "quantifier:sym<*>")
  debug_229:
  rx143_fail:
    (rx143_rep, rx143_pos, $I10, $P10) = rx143_cur."!mark_fail"(0)
    lt rx143_pos, -1, rx143_done
    eq rx143_pos, -1, rx143_fail
    jump $I10
  rx143_done:
    rx143_cur."!cursor_fail"()
    if_null rx143_debug, debug_230
    rx143_cur."!cursor_debug"("FAIL", "quantifier:sym<*>")
  debug_230:
    .return (rx143_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<*>"  :subid("41_1283874333.85778") :method
.annotate 'line', 3
    $P145 = self."!PREFIX__!subrule"("backmod", "*")
    new $P146, "ResizablePMCArray"
    push $P146, $P145
    .return ($P146)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<+>"  :subid("42_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx150_tgt
    .local int rx150_pos
    .local int rx150_off
    .local int rx150_eos
    .local int rx150_rep
    .local pmc rx150_cur
    .local pmc rx150_debug
    (rx150_cur, rx150_pos, rx150_tgt, $I10) = self."!cursor_start"()
    getattribute rx150_debug, rx150_cur, "$!debug"
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
    eq $I10, 1, rx150_restart
    if_null rx150_debug, debug_231
    rx150_cur."!cursor_debug"("START", "quantifier:sym<+>")
  debug_231:
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
.annotate 'line', 63
  # rx subcapture "sym"
    set_addr $I10, rxcap_155_fail
    rx150_cur."!mark_push"(0, rx150_pos, $I10)
  # rx literal  "+"
    add $I11, rx150_pos, 1
    gt $I11, rx150_eos, rx150_fail
    sub $I11, rx150_pos, rx150_off
    ord $I11, rx150_tgt, $I11
    ne $I11, 43, rx150_fail
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
    if_null rx150_debug, debug_232
    rx150_cur."!cursor_debug"("PASS", "quantifier:sym<+>", " at pos=", rx150_pos)
  debug_232:
    .return (rx150_cur)
  rx150_restart:
.annotate 'line', 3
    if_null rx150_debug, debug_233
    rx150_cur."!cursor_debug"("NEXT", "quantifier:sym<+>")
  debug_233:
  rx150_fail:
    (rx150_rep, rx150_pos, $I10, $P10) = rx150_cur."!mark_fail"(0)
    lt rx150_pos, -1, rx150_done
    eq rx150_pos, -1, rx150_fail
    jump $I10
  rx150_done:
    rx150_cur."!cursor_fail"()
    if_null rx150_debug, debug_234
    rx150_cur."!cursor_debug"("FAIL", "quantifier:sym<+>")
  debug_234:
    .return (rx150_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<+>"  :subid("43_1283874333.85778") :method
.annotate 'line', 3
    $P152 = self."!PREFIX__!subrule"("backmod", "+")
    new $P153, "ResizablePMCArray"
    push $P153, $P152
    .return ($P153)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<?>"  :subid("44_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx157_tgt
    .local int rx157_pos
    .local int rx157_off
    .local int rx157_eos
    .local int rx157_rep
    .local pmc rx157_cur
    .local pmc rx157_debug
    (rx157_cur, rx157_pos, rx157_tgt, $I10) = self."!cursor_start"()
    getattribute rx157_debug, rx157_cur, "$!debug"
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
    eq $I10, 1, rx157_restart
    if_null rx157_debug, debug_235
    rx157_cur."!cursor_debug"("START", "quantifier:sym<?>")
  debug_235:
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
.annotate 'line', 64
  # rx subcapture "sym"
    set_addr $I10, rxcap_162_fail
    rx157_cur."!mark_push"(0, rx157_pos, $I10)
  # rx literal  "?"
    add $I11, rx157_pos, 1
    gt $I11, rx157_eos, rx157_fail
    sub $I11, rx157_pos, rx157_off
    ord $I11, rx157_tgt, $I11
    ne $I11, 63, rx157_fail
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
    if_null rx157_debug, debug_236
    rx157_cur."!cursor_debug"("PASS", "quantifier:sym<?>", " at pos=", rx157_pos)
  debug_236:
    .return (rx157_cur)
  rx157_restart:
.annotate 'line', 3
    if_null rx157_debug, debug_237
    rx157_cur."!cursor_debug"("NEXT", "quantifier:sym<?>")
  debug_237:
  rx157_fail:
    (rx157_rep, rx157_pos, $I10, $P10) = rx157_cur."!mark_fail"(0)
    lt rx157_pos, -1, rx157_done
    eq rx157_pos, -1, rx157_fail
    jump $I10
  rx157_done:
    rx157_cur."!cursor_fail"()
    if_null rx157_debug, debug_238
    rx157_cur."!cursor_debug"("FAIL", "quantifier:sym<?>")
  debug_238:
    .return (rx157_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<?>"  :subid("45_1283874333.85778") :method
.annotate 'line', 3
    $P159 = self."!PREFIX__!subrule"("backmod", "?")
    new $P160, "ResizablePMCArray"
    push $P160, $P159
    .return ($P160)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<**>"  :subid("46_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx164_tgt
    .local int rx164_pos
    .local int rx164_off
    .local int rx164_eos
    .local int rx164_rep
    .local pmc rx164_cur
    .local pmc rx164_debug
    (rx164_cur, rx164_pos, rx164_tgt, $I10) = self."!cursor_start"()
    rx164_cur."!cursor_caparray"("normspace", "max")
    getattribute rx164_debug, rx164_cur, "$!debug"
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
    eq $I10, 1, rx164_restart
    if_null rx164_debug, debug_239
    rx164_cur."!cursor_debug"("START", "quantifier:sym<**>")
  debug_239:
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
.annotate 'line', 66
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
    set_addr $I10, rxquantr169_done
    rx164_cur."!mark_push"(0, rx164_pos, $I10)
  rxquantr169_loop:
  # rx subrule "normspace" subtype=capture negate=
    rx164_cur."!cursor_pos"(rx164_pos)
    $P10 = rx164_cur."normspace"()
    unless $P10, rx164_fail
    goto rxsubrule170_pass
  rxsubrule170_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx164_fail
  rxsubrule170_pass:
    set_addr $I10, rxsubrule170_back
    rx164_cur."!mark_push"(0, rx164_pos, $I10, $P10)
    $P10."!cursor_names"("normspace")
    rx164_pos = $P10."pos"()
    set_addr $I10, rxquantr169_done
    (rx164_rep) = rx164_cur."!mark_commit"($I10)
  rxquantr169_done:
  # rx subrule "backmod" subtype=capture negate=
    rx164_cur."!cursor_pos"(rx164_pos)
    $P10 = rx164_cur."backmod"()
    unless $P10, rx164_fail
    rx164_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx164_pos = $P10."pos"()
  # rx rxquantr171 ** 0..1
    set_addr $I10, rxquantr171_done
    rx164_cur."!mark_push"(0, rx164_pos, $I10)
  rxquantr171_loop:
  # rx subrule "normspace" subtype=capture negate=
    rx164_cur."!cursor_pos"(rx164_pos)
    $P10 = rx164_cur."normspace"()
    unless $P10, rx164_fail
    goto rxsubrule172_pass
  rxsubrule172_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx164_fail
  rxsubrule172_pass:
    set_addr $I10, rxsubrule172_back
    rx164_cur."!mark_push"(0, rx164_pos, $I10, $P10)
    $P10."!cursor_names"("normspace")
    rx164_pos = $P10."pos"()
    set_addr $I10, rxquantr171_done
    (rx164_rep) = rx164_cur."!mark_commit"($I10)
  rxquantr171_done:
  alt173_0:
.annotate 'line', 67
    set_addr $I10, alt173_1
    rx164_cur."!mark_push"(0, rx164_pos, $I10)
.annotate 'line', 68
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
.annotate 'line', 75
  # rx rxquantr175 ** 0..1
    set_addr $I10, rxquantr175_done
    rx164_cur."!mark_push"(0, rx164_pos, $I10)
  rxquantr175_loop:
.annotate 'line', 69
  # rx literal  ".."
    add $I11, rx164_pos, 2
    gt $I11, rx164_eos, rx164_fail
    sub $I11, rx164_pos, rx164_off
    substr $S10, rx164_tgt, $I11, 2
    ne $S10, "..", rx164_fail
    add rx164_pos, 2
.annotate 'line', 70
  # rx subcapture "max"
    set_addr $I10, rxcap_177_fail
    rx164_cur."!mark_push"(0, rx164_pos, $I10)
  alt176_0:
    set_addr $I10, alt176_1
    rx164_cur."!mark_push"(0, rx164_pos, $I10)
.annotate 'line', 71
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
.annotate 'line', 72
  # rx literal  "*"
    add $I11, rx164_pos, 1
    gt $I11, rx164_eos, rx164_fail
    sub $I11, rx164_pos, rx164_off
    ord $I11, rx164_tgt, $I11
    ne $I11, 42, rx164_fail
    add rx164_pos, 1
    goto alt176_end
  alt176_2:
.annotate 'line', 73
  # rx subrule "panic" subtype=method negate=
    rx164_cur."!cursor_pos"(rx164_pos)
    $P10 = rx164_cur."panic"("Only integers or '*' allowed as range quantifier endpoint")
    unless $P10, rx164_fail
    rx164_pos = $P10."pos"()
  alt176_end:
.annotate 'line', 70
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
.annotate 'line', 75
    set_addr $I10, rxquantr175_done
    (rx164_rep) = rx164_cur."!mark_commit"($I10)
  rxquantr175_done:
.annotate 'line', 68
    goto alt173_end
  alt173_1:
.annotate 'line', 76
  # rx subrule "quantified_atom" subtype=capture negate=
    rx164_cur."!cursor_pos"(rx164_pos)
    $P10 = rx164_cur."quantified_atom"()
    unless $P10, rx164_fail
    rx164_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantified_atom")
    rx164_pos = $P10."pos"()
  alt173_end:
.annotate 'line', 65
  # rx pass
    rx164_cur."!cursor_pass"(rx164_pos, "quantifier:sym<**>")
    if_null rx164_debug, debug_240
    rx164_cur."!cursor_debug"("PASS", "quantifier:sym<**>", " at pos=", rx164_pos)
  debug_240:
    .return (rx164_cur)
  rx164_restart:
.annotate 'line', 3
    if_null rx164_debug, debug_241
    rx164_cur."!cursor_debug"("NEXT", "quantifier:sym<**>")
  debug_241:
  rx164_fail:
    (rx164_rep, rx164_pos, $I10, $P10) = rx164_cur."!mark_fail"(0)
    lt rx164_pos, -1, rx164_done
    eq rx164_pos, -1, rx164_fail
    jump $I10
  rx164_done:
    rx164_cur."!cursor_fail"()
    if_null rx164_debug, debug_242
    rx164_cur."!cursor_debug"("FAIL", "quantifier:sym<**>")
  debug_242:
    .return (rx164_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<**>"  :subid("47_1283874333.85778") :method
.annotate 'line', 3
    new $P166, "ResizablePMCArray"
    push $P166, "**"
    .return ($P166)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backmod"  :subid("48_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .const 'Sub' $P186 = "50_1283874333.85778" 
    capture_lex $P186
    .local string rx179_tgt
    .local int rx179_pos
    .local int rx179_off
    .local int rx179_eos
    .local int rx179_rep
    .local pmc rx179_cur
    .local pmc rx179_debug
    (rx179_cur, rx179_pos, rx179_tgt, $I10) = self."!cursor_start"()
    getattribute rx179_debug, rx179_cur, "$!debug"
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
    if_null rx179_debug, debug_243
    rx179_cur."!cursor_debug"("START", "backmod")
  debug_243:
    $I10 = self.'from'()
    ne $I10, -1, rxscan182_done
    goto rxscan182_scan
  rxscan182_loop:
    ($P10) = rx179_cur."from"()
    inc $P10
    set rx179_pos, $P10
    ge rx179_pos, rx179_eos, rxscan182_done
  rxscan182_scan:
    set_addr $I10, rxscan182_loop
    rx179_cur."!mark_push"(0, rx179_pos, $I10)
  rxscan182_done:
.annotate 'line', 80
  # rx rxquantr183 ** 0..1
    set_addr $I10, rxquantr183_done
    rx179_cur."!mark_push"(0, rx179_pos, $I10)
  rxquantr183_loop:
  # rx literal  ":"
    add $I11, rx179_pos, 1
    gt $I11, rx179_eos, rx179_fail
    sub $I11, rx179_pos, rx179_off
    ord $I11, rx179_tgt, $I11
    ne $I11, 58, rx179_fail
    add rx179_pos, 1
    set_addr $I10, rxquantr183_done
    (rx179_rep) = rx179_cur."!mark_commit"($I10)
  rxquantr183_done:
  alt184_0:
    set_addr $I10, alt184_1
    rx179_cur."!mark_push"(0, rx179_pos, $I10)
  # rx literal  "?"
    add $I11, rx179_pos, 1
    gt $I11, rx179_eos, rx179_fail
    sub $I11, rx179_pos, rx179_off
    ord $I11, rx179_tgt, $I11
    ne $I11, 63, rx179_fail
    add rx179_pos, 1
    goto alt184_end
  alt184_1:
    set_addr $I10, alt184_2
    rx179_cur."!mark_push"(0, rx179_pos, $I10)
  # rx literal  "!"
    add $I11, rx179_pos, 1
    gt $I11, rx179_eos, rx179_fail
    sub $I11, rx179_pos, rx179_off
    ord $I11, rx179_tgt, $I11
    ne $I11, 33, rx179_fail
    add rx179_pos, 1
    goto alt184_end
  alt184_2:
  # rx subrule "before" subtype=zerowidth negate=1
    rx179_cur."!cursor_pos"(rx179_pos)
    .const 'Sub' $P186 = "50_1283874333.85778" 
    capture_lex $P186
    $P10 = rx179_cur."before"($P186)
    if $P10, rx179_fail
  alt184_end:
  # rx pass
    rx179_cur."!cursor_pass"(rx179_pos, "backmod")
    if_null rx179_debug, debug_248
    rx179_cur."!cursor_debug"("PASS", "backmod", " at pos=", rx179_pos)
  debug_248:
    .return (rx179_cur)
  rx179_restart:
.annotate 'line', 3
    if_null rx179_debug, debug_249
    rx179_cur."!cursor_debug"("NEXT", "backmod")
  debug_249:
  rx179_fail:
    (rx179_rep, rx179_pos, $I10, $P10) = rx179_cur."!mark_fail"(0)
    lt rx179_pos, -1, rx179_done
    eq rx179_pos, -1, rx179_fail
    jump $I10
  rx179_done:
    rx179_cur."!cursor_fail"()
    if_null rx179_debug, debug_250
    rx179_cur."!cursor_debug"("FAIL", "backmod")
  debug_250:
    .return (rx179_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backmod"  :subid("49_1283874333.85778") :method
.annotate 'line', 3
    new $P181, "ResizablePMCArray"
    push $P181, ""
    .return ($P181)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block185"  :anon :subid("50_1283874333.85778") :method :outer("48_1283874333.85778")
.annotate 'line', 80
    .local string rx187_tgt
    .local int rx187_pos
    .local int rx187_off
    .local int rx187_eos
    .local int rx187_rep
    .local pmc rx187_cur
    .local pmc rx187_debug
    (rx187_cur, rx187_pos, rx187_tgt, $I10) = self."!cursor_start"()
    getattribute rx187_debug, rx187_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx187_cur
    .local pmc match
    .lex "$/", match
    length rx187_eos, rx187_tgt
    gt rx187_pos, rx187_eos, rx187_done
    set rx187_off, 0
    lt rx187_pos, 2, rx187_start
    sub rx187_off, rx187_pos, 1
    substr rx187_tgt, rx187_tgt, rx187_off
  rx187_start:
    eq $I10, 1, rx187_restart
    if_null rx187_debug, debug_244
    rx187_cur."!cursor_debug"("START", "")
  debug_244:
    $I10 = self.'from'()
    ne $I10, -1, rxscan188_done
    goto rxscan188_scan
  rxscan188_loop:
    ($P10) = rx187_cur."from"()
    inc $P10
    set rx187_pos, $P10
    ge rx187_pos, rx187_eos, rxscan188_done
  rxscan188_scan:
    set_addr $I10, rxscan188_loop
    rx187_cur."!mark_push"(0, rx187_pos, $I10)
  rxscan188_done:
  # rx literal  ":"
    add $I11, rx187_pos, 1
    gt $I11, rx187_eos, rx187_fail
    sub $I11, rx187_pos, rx187_off
    ord $I11, rx187_tgt, $I11
    ne $I11, 58, rx187_fail
    add rx187_pos, 1
  # rx pass
    rx187_cur."!cursor_pass"(rx187_pos, "")
    if_null rx187_debug, debug_245
    rx187_cur."!cursor_debug"("PASS", "", " at pos=", rx187_pos)
  debug_245:
    .return (rx187_cur)
  rx187_restart:
    if_null rx187_debug, debug_246
    rx187_cur."!cursor_debug"("NEXT", "")
  debug_246:
  rx187_fail:
    (rx187_rep, rx187_pos, $I10, $P10) = rx187_cur."!mark_fail"(0)
    lt rx187_pos, -1, rx187_done
    eq rx187_pos, -1, rx187_fail
    jump $I10
  rx187_done:
    rx187_cur."!cursor_fail"()
    if_null rx187_debug, debug_247
    rx187_cur."!cursor_debug"("FAIL", "")
  debug_247:
    .return (rx187_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar"  :subid("51_1283874333.85778") :method
.annotate 'line', 82
    $P190 = self."!protoregex"("metachar")
    .return ($P190)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar"  :subid("52_1283874333.85778") :method
.annotate 'line', 82
    $P192 = self."!PREFIX__!protoregex"("metachar")
    .return ($P192)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<ws>"  :subid("53_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx194_tgt
    .local int rx194_pos
    .local int rx194_off
    .local int rx194_eos
    .local int rx194_rep
    .local pmc rx194_cur
    .local pmc rx194_debug
    (rx194_cur, rx194_pos, rx194_tgt, $I10) = self."!cursor_start"()
    getattribute rx194_debug, rx194_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx194_cur
    .local pmc match
    .lex "$/", match
    length rx194_eos, rx194_tgt
    gt rx194_pos, rx194_eos, rx194_done
    set rx194_off, 0
    lt rx194_pos, 2, rx194_start
    sub rx194_off, rx194_pos, 1
    substr rx194_tgt, rx194_tgt, rx194_off
  rx194_start:
    eq $I10, 1, rx194_restart
    if_null rx194_debug, debug_251
    rx194_cur."!cursor_debug"("START", "metachar:sym<ws>")
  debug_251:
    $I10 = self.'from'()
    ne $I10, -1, rxscan198_done
    goto rxscan198_scan
  rxscan198_loop:
    ($P10) = rx194_cur."from"()
    inc $P10
    set rx194_pos, $P10
    ge rx194_pos, rx194_eos, rxscan198_done
  rxscan198_scan:
    set_addr $I10, rxscan198_loop
    rx194_cur."!mark_push"(0, rx194_pos, $I10)
  rxscan198_done:
.annotate 'line', 83
  # rx subrule "normspace" subtype=method negate=
    rx194_cur."!cursor_pos"(rx194_pos)
    $P10 = rx194_cur."normspace"()
    unless $P10, rx194_fail
    rx194_pos = $P10."pos"()
  # rx pass
    rx194_cur."!cursor_pass"(rx194_pos, "metachar:sym<ws>")
    if_null rx194_debug, debug_252
    rx194_cur."!cursor_debug"("PASS", "metachar:sym<ws>", " at pos=", rx194_pos)
  debug_252:
    .return (rx194_cur)
  rx194_restart:
.annotate 'line', 3
    if_null rx194_debug, debug_253
    rx194_cur."!cursor_debug"("NEXT", "metachar:sym<ws>")
  debug_253:
  rx194_fail:
    (rx194_rep, rx194_pos, $I10, $P10) = rx194_cur."!mark_fail"(0)
    lt rx194_pos, -1, rx194_done
    eq rx194_pos, -1, rx194_fail
    jump $I10
  rx194_done:
    rx194_cur."!cursor_fail"()
    if_null rx194_debug, debug_254
    rx194_cur."!cursor_debug"("FAIL", "metachar:sym<ws>")
  debug_254:
    .return (rx194_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<ws>"  :subid("54_1283874333.85778") :method
.annotate 'line', 3
    $P196 = self."!PREFIX__!subrule"("normspace", "")
    new $P197, "ResizablePMCArray"
    push $P197, $P196
    .return ($P197)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<[ ]>"  :subid("55_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx200_tgt
    .local int rx200_pos
    .local int rx200_off
    .local int rx200_eos
    .local int rx200_rep
    .local pmc rx200_cur
    .local pmc rx200_debug
    (rx200_cur, rx200_pos, rx200_tgt, $I10) = self."!cursor_start"()
    getattribute rx200_debug, rx200_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx200_cur
    .local pmc match
    .lex "$/", match
    length rx200_eos, rx200_tgt
    gt rx200_pos, rx200_eos, rx200_done
    set rx200_off, 0
    lt rx200_pos, 2, rx200_start
    sub rx200_off, rx200_pos, 1
    substr rx200_tgt, rx200_tgt, rx200_off
  rx200_start:
    eq $I10, 1, rx200_restart
    if_null rx200_debug, debug_255
    rx200_cur."!cursor_debug"("START", "metachar:sym<[ ]>")
  debug_255:
    $I10 = self.'from'()
    ne $I10, -1, rxscan204_done
    goto rxscan204_scan
  rxscan204_loop:
    ($P10) = rx200_cur."from"()
    inc $P10
    set rx200_pos, $P10
    ge rx200_pos, rx200_eos, rxscan204_done
  rxscan204_scan:
    set_addr $I10, rxscan204_loop
    rx200_cur."!mark_push"(0, rx200_pos, $I10)
  rxscan204_done:
.annotate 'line', 84
  # rx literal  "["
    add $I11, rx200_pos, 1
    gt $I11, rx200_eos, rx200_fail
    sub $I11, rx200_pos, rx200_off
    ord $I11, rx200_tgt, $I11
    ne $I11, 91, rx200_fail
    add rx200_pos, 1
  # rx subrule "nibbler" subtype=capture negate=
    rx200_cur."!cursor_pos"(rx200_pos)
    $P10 = rx200_cur."nibbler"()
    unless $P10, rx200_fail
    rx200_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx200_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx200_pos, 1
    gt $I11, rx200_eos, rx200_fail
    sub $I11, rx200_pos, rx200_off
    ord $I11, rx200_tgt, $I11
    ne $I11, 93, rx200_fail
    add rx200_pos, 1
  # rx pass
    rx200_cur."!cursor_pass"(rx200_pos, "metachar:sym<[ ]>")
    if_null rx200_debug, debug_256
    rx200_cur."!cursor_debug"("PASS", "metachar:sym<[ ]>", " at pos=", rx200_pos)
  debug_256:
    .return (rx200_cur)
  rx200_restart:
.annotate 'line', 3
    if_null rx200_debug, debug_257
    rx200_cur."!cursor_debug"("NEXT", "metachar:sym<[ ]>")
  debug_257:
  rx200_fail:
    (rx200_rep, rx200_pos, $I10, $P10) = rx200_cur."!mark_fail"(0)
    lt rx200_pos, -1, rx200_done
    eq rx200_pos, -1, rx200_fail
    jump $I10
  rx200_done:
    rx200_cur."!cursor_fail"()
    if_null rx200_debug, debug_258
    rx200_cur."!cursor_debug"("FAIL", "metachar:sym<[ ]>")
  debug_258:
    .return (rx200_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<[ ]>"  :subid("56_1283874333.85778") :method
.annotate 'line', 3
    $P202 = self."!PREFIX__!subrule"("nibbler", "[")
    new $P203, "ResizablePMCArray"
    push $P203, $P202
    .return ($P203)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<( )>"  :subid("57_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx206_tgt
    .local int rx206_pos
    .local int rx206_off
    .local int rx206_eos
    .local int rx206_rep
    .local pmc rx206_cur
    .local pmc rx206_debug
    (rx206_cur, rx206_pos, rx206_tgt, $I10) = self."!cursor_start"()
    getattribute rx206_debug, rx206_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx206_cur
    .local pmc match
    .lex "$/", match
    length rx206_eos, rx206_tgt
    gt rx206_pos, rx206_eos, rx206_done
    set rx206_off, 0
    lt rx206_pos, 2, rx206_start
    sub rx206_off, rx206_pos, 1
    substr rx206_tgt, rx206_tgt, rx206_off
  rx206_start:
    eq $I10, 1, rx206_restart
    if_null rx206_debug, debug_259
    rx206_cur."!cursor_debug"("START", "metachar:sym<( )>")
  debug_259:
    $I10 = self.'from'()
    ne $I10, -1, rxscan210_done
    goto rxscan210_scan
  rxscan210_loop:
    ($P10) = rx206_cur."from"()
    inc $P10
    set rx206_pos, $P10
    ge rx206_pos, rx206_eos, rxscan210_done
  rxscan210_scan:
    set_addr $I10, rxscan210_loop
    rx206_cur."!mark_push"(0, rx206_pos, $I10)
  rxscan210_done:
.annotate 'line', 85
  # rx literal  "("
    add $I11, rx206_pos, 1
    gt $I11, rx206_eos, rx206_fail
    sub $I11, rx206_pos, rx206_off
    ord $I11, rx206_tgt, $I11
    ne $I11, 40, rx206_fail
    add rx206_pos, 1
  # rx subrule "nibbler" subtype=capture negate=
    rx206_cur."!cursor_pos"(rx206_pos)
    $P10 = rx206_cur."nibbler"()
    unless $P10, rx206_fail
    rx206_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx206_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx206_pos, 1
    gt $I11, rx206_eos, rx206_fail
    sub $I11, rx206_pos, rx206_off
    ord $I11, rx206_tgt, $I11
    ne $I11, 41, rx206_fail
    add rx206_pos, 1
  # rx pass
    rx206_cur."!cursor_pass"(rx206_pos, "metachar:sym<( )>")
    if_null rx206_debug, debug_260
    rx206_cur."!cursor_debug"("PASS", "metachar:sym<( )>", " at pos=", rx206_pos)
  debug_260:
    .return (rx206_cur)
  rx206_restart:
.annotate 'line', 3
    if_null rx206_debug, debug_261
    rx206_cur."!cursor_debug"("NEXT", "metachar:sym<( )>")
  debug_261:
  rx206_fail:
    (rx206_rep, rx206_pos, $I10, $P10) = rx206_cur."!mark_fail"(0)
    lt rx206_pos, -1, rx206_done
    eq rx206_pos, -1, rx206_fail
    jump $I10
  rx206_done:
    rx206_cur."!cursor_fail"()
    if_null rx206_debug, debug_262
    rx206_cur."!cursor_debug"("FAIL", "metachar:sym<( )>")
  debug_262:
    .return (rx206_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<( )>"  :subid("58_1283874333.85778") :method
.annotate 'line', 3
    $P208 = self."!PREFIX__!subrule"("nibbler", "(")
    new $P209, "ResizablePMCArray"
    push $P209, $P208
    .return ($P209)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<'>"  :subid("59_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx212_tgt
    .local int rx212_pos
    .local int rx212_off
    .local int rx212_eos
    .local int rx212_rep
    .local pmc rx212_cur
    .local pmc rx212_debug
    (rx212_cur, rx212_pos, rx212_tgt, $I10) = self."!cursor_start"()
    getattribute rx212_debug, rx212_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx212_cur
    .local pmc match
    .lex "$/", match
    length rx212_eos, rx212_tgt
    gt rx212_pos, rx212_eos, rx212_done
    set rx212_off, 0
    lt rx212_pos, 2, rx212_start
    sub rx212_off, rx212_pos, 1
    substr rx212_tgt, rx212_tgt, rx212_off
  rx212_start:
    eq $I10, 1, rx212_restart
    if_null rx212_debug, debug_263
    rx212_cur."!cursor_debug"("START", "metachar:sym<'>")
  debug_263:
    $I10 = self.'from'()
    ne $I10, -1, rxscan215_done
    goto rxscan215_scan
  rxscan215_loop:
    ($P10) = rx212_cur."from"()
    inc $P10
    set rx212_pos, $P10
    ge rx212_pos, rx212_eos, rxscan215_done
  rxscan215_scan:
    set_addr $I10, rxscan215_loop
    rx212_cur."!mark_push"(0, rx212_pos, $I10)
  rxscan215_done:
.annotate 'line', 86
  # rx enumcharlist negate=0 zerowidth
    ge rx212_pos, rx212_eos, rx212_fail
    sub $I10, rx212_pos, rx212_off
    substr $S10, rx212_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx212_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx212_cur."!cursor_pos"(rx212_pos)
    $P10 = rx212_cur."quote_EXPR"(":q")
    unless $P10, rx212_fail
    rx212_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx212_pos = $P10."pos"()
  # rx pass
    rx212_cur."!cursor_pass"(rx212_pos, "metachar:sym<'>")
    if_null rx212_debug, debug_264
    rx212_cur."!cursor_debug"("PASS", "metachar:sym<'>", " at pos=", rx212_pos)
  debug_264:
    .return (rx212_cur)
  rx212_restart:
.annotate 'line', 3
    if_null rx212_debug, debug_265
    rx212_cur."!cursor_debug"("NEXT", "metachar:sym<'>")
  debug_265:
  rx212_fail:
    (rx212_rep, rx212_pos, $I10, $P10) = rx212_cur."!mark_fail"(0)
    lt rx212_pos, -1, rx212_done
    eq rx212_pos, -1, rx212_fail
    jump $I10
  rx212_done:
    rx212_cur."!cursor_fail"()
    if_null rx212_debug, debug_266
    rx212_cur."!cursor_debug"("FAIL", "metachar:sym<'>")
  debug_266:
    .return (rx212_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<'>"  :subid("60_1283874333.85778") :method
.annotate 'line', 3
    new $P214, "ResizablePMCArray"
    push $P214, "'"
    .return ($P214)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<\">"  :subid("61_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx217_tgt
    .local int rx217_pos
    .local int rx217_off
    .local int rx217_eos
    .local int rx217_rep
    .local pmc rx217_cur
    .local pmc rx217_debug
    (rx217_cur, rx217_pos, rx217_tgt, $I10) = self."!cursor_start"()
    getattribute rx217_debug, rx217_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx217_cur
    .local pmc match
    .lex "$/", match
    length rx217_eos, rx217_tgt
    gt rx217_pos, rx217_eos, rx217_done
    set rx217_off, 0
    lt rx217_pos, 2, rx217_start
    sub rx217_off, rx217_pos, 1
    substr rx217_tgt, rx217_tgt, rx217_off
  rx217_start:
    eq $I10, 1, rx217_restart
    if_null rx217_debug, debug_267
    rx217_cur."!cursor_debug"("START", "metachar:sym<\">")
  debug_267:
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
.annotate 'line', 87
  # rx enumcharlist negate=0 zerowidth
    ge rx217_pos, rx217_eos, rx217_fail
    sub $I10, rx217_pos, rx217_off
    substr $S10, rx217_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx217_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx217_cur."!cursor_pos"(rx217_pos)
    $P10 = rx217_cur."quote_EXPR"(":qq")
    unless $P10, rx217_fail
    rx217_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx217_pos = $P10."pos"()
  # rx pass
    rx217_cur."!cursor_pass"(rx217_pos, "metachar:sym<\">")
    if_null rx217_debug, debug_268
    rx217_cur."!cursor_debug"("PASS", "metachar:sym<\">", " at pos=", rx217_pos)
  debug_268:
    .return (rx217_cur)
  rx217_restart:
.annotate 'line', 3
    if_null rx217_debug, debug_269
    rx217_cur."!cursor_debug"("NEXT", "metachar:sym<\">")
  debug_269:
  rx217_fail:
    (rx217_rep, rx217_pos, $I10, $P10) = rx217_cur."!mark_fail"(0)
    lt rx217_pos, -1, rx217_done
    eq rx217_pos, -1, rx217_fail
    jump $I10
  rx217_done:
    rx217_cur."!cursor_fail"()
    if_null rx217_debug, debug_270
    rx217_cur."!cursor_debug"("FAIL", "metachar:sym<\">")
  debug_270:
    .return (rx217_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<\">"  :subid("62_1283874333.85778") :method
.annotate 'line', 3
    new $P219, "ResizablePMCArray"
    push $P219, "\""
    .return ($P219)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<.>"  :subid("63_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx222_tgt
    .local int rx222_pos
    .local int rx222_off
    .local int rx222_eos
    .local int rx222_rep
    .local pmc rx222_cur
    .local pmc rx222_debug
    (rx222_cur, rx222_pos, rx222_tgt, $I10) = self."!cursor_start"()
    getattribute rx222_debug, rx222_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx222_cur
    .local pmc match
    .lex "$/", match
    length rx222_eos, rx222_tgt
    gt rx222_pos, rx222_eos, rx222_done
    set rx222_off, 0
    lt rx222_pos, 2, rx222_start
    sub rx222_off, rx222_pos, 1
    substr rx222_tgt, rx222_tgt, rx222_off
  rx222_start:
    eq $I10, 1, rx222_restart
    if_null rx222_debug, debug_271
    rx222_cur."!cursor_debug"("START", "metachar:sym<.>")
  debug_271:
    $I10 = self.'from'()
    ne $I10, -1, rxscan225_done
    goto rxscan225_scan
  rxscan225_loop:
    ($P10) = rx222_cur."from"()
    inc $P10
    set rx222_pos, $P10
    ge rx222_pos, rx222_eos, rxscan225_done
  rxscan225_scan:
    set_addr $I10, rxscan225_loop
    rx222_cur."!mark_push"(0, rx222_pos, $I10)
  rxscan225_done:
.annotate 'line', 88
  # rx subcapture "sym"
    set_addr $I10, rxcap_226_fail
    rx222_cur."!mark_push"(0, rx222_pos, $I10)
  # rx literal  "."
    add $I11, rx222_pos, 1
    gt $I11, rx222_eos, rx222_fail
    sub $I11, rx222_pos, rx222_off
    ord $I11, rx222_tgt, $I11
    ne $I11, 46, rx222_fail
    add rx222_pos, 1
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
  # rx pass
    rx222_cur."!cursor_pass"(rx222_pos, "metachar:sym<.>")
    if_null rx222_debug, debug_272
    rx222_cur."!cursor_debug"("PASS", "metachar:sym<.>", " at pos=", rx222_pos)
  debug_272:
    .return (rx222_cur)
  rx222_restart:
.annotate 'line', 3
    if_null rx222_debug, debug_273
    rx222_cur."!cursor_debug"("NEXT", "metachar:sym<.>")
  debug_273:
  rx222_fail:
    (rx222_rep, rx222_pos, $I10, $P10) = rx222_cur."!mark_fail"(0)
    lt rx222_pos, -1, rx222_done
    eq rx222_pos, -1, rx222_fail
    jump $I10
  rx222_done:
    rx222_cur."!cursor_fail"()
    if_null rx222_debug, debug_274
    rx222_cur."!cursor_debug"("FAIL", "metachar:sym<.>")
  debug_274:
    .return (rx222_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<.>"  :subid("64_1283874333.85778") :method
.annotate 'line', 3
    new $P224, "ResizablePMCArray"
    push $P224, "."
    .return ($P224)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^>"  :subid("65_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx228_tgt
    .local int rx228_pos
    .local int rx228_off
    .local int rx228_eos
    .local int rx228_rep
    .local pmc rx228_cur
    .local pmc rx228_debug
    (rx228_cur, rx228_pos, rx228_tgt, $I10) = self."!cursor_start"()
    getattribute rx228_debug, rx228_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx228_cur
    .local pmc match
    .lex "$/", match
    length rx228_eos, rx228_tgt
    gt rx228_pos, rx228_eos, rx228_done
    set rx228_off, 0
    lt rx228_pos, 2, rx228_start
    sub rx228_off, rx228_pos, 1
    substr rx228_tgt, rx228_tgt, rx228_off
  rx228_start:
    eq $I10, 1, rx228_restart
    if_null rx228_debug, debug_275
    rx228_cur."!cursor_debug"("START", "metachar:sym<^>")
  debug_275:
    $I10 = self.'from'()
    ne $I10, -1, rxscan231_done
    goto rxscan231_scan
  rxscan231_loop:
    ($P10) = rx228_cur."from"()
    inc $P10
    set rx228_pos, $P10
    ge rx228_pos, rx228_eos, rxscan231_done
  rxscan231_scan:
    set_addr $I10, rxscan231_loop
    rx228_cur."!mark_push"(0, rx228_pos, $I10)
  rxscan231_done:
.annotate 'line', 89
  # rx subcapture "sym"
    set_addr $I10, rxcap_232_fail
    rx228_cur."!mark_push"(0, rx228_pos, $I10)
  # rx literal  "^"
    add $I11, rx228_pos, 1
    gt $I11, rx228_eos, rx228_fail
    sub $I11, rx228_pos, rx228_off
    ord $I11, rx228_tgt, $I11
    ne $I11, 94, rx228_fail
    add rx228_pos, 1
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
  # rx pass
    rx228_cur."!cursor_pass"(rx228_pos, "metachar:sym<^>")
    if_null rx228_debug, debug_276
    rx228_cur."!cursor_debug"("PASS", "metachar:sym<^>", " at pos=", rx228_pos)
  debug_276:
    .return (rx228_cur)
  rx228_restart:
.annotate 'line', 3
    if_null rx228_debug, debug_277
    rx228_cur."!cursor_debug"("NEXT", "metachar:sym<^>")
  debug_277:
  rx228_fail:
    (rx228_rep, rx228_pos, $I10, $P10) = rx228_cur."!mark_fail"(0)
    lt rx228_pos, -1, rx228_done
    eq rx228_pos, -1, rx228_fail
    jump $I10
  rx228_done:
    rx228_cur."!cursor_fail"()
    if_null rx228_debug, debug_278
    rx228_cur."!cursor_debug"("FAIL", "metachar:sym<^>")
  debug_278:
    .return (rx228_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<^>"  :subid("66_1283874333.85778") :method
.annotate 'line', 3
    new $P230, "ResizablePMCArray"
    push $P230, "^"
    .return ($P230)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^^>"  :subid("67_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx234_tgt
    .local int rx234_pos
    .local int rx234_off
    .local int rx234_eos
    .local int rx234_rep
    .local pmc rx234_cur
    .local pmc rx234_debug
    (rx234_cur, rx234_pos, rx234_tgt, $I10) = self."!cursor_start"()
    getattribute rx234_debug, rx234_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx234_cur
    .local pmc match
    .lex "$/", match
    length rx234_eos, rx234_tgt
    gt rx234_pos, rx234_eos, rx234_done
    set rx234_off, 0
    lt rx234_pos, 2, rx234_start
    sub rx234_off, rx234_pos, 1
    substr rx234_tgt, rx234_tgt, rx234_off
  rx234_start:
    eq $I10, 1, rx234_restart
    if_null rx234_debug, debug_279
    rx234_cur."!cursor_debug"("START", "metachar:sym<^^>")
  debug_279:
    $I10 = self.'from'()
    ne $I10, -1, rxscan237_done
    goto rxscan237_scan
  rxscan237_loop:
    ($P10) = rx234_cur."from"()
    inc $P10
    set rx234_pos, $P10
    ge rx234_pos, rx234_eos, rxscan237_done
  rxscan237_scan:
    set_addr $I10, rxscan237_loop
    rx234_cur."!mark_push"(0, rx234_pos, $I10)
  rxscan237_done:
.annotate 'line', 90
  # rx subcapture "sym"
    set_addr $I10, rxcap_238_fail
    rx234_cur."!mark_push"(0, rx234_pos, $I10)
  # rx literal  "^^"
    add $I11, rx234_pos, 2
    gt $I11, rx234_eos, rx234_fail
    sub $I11, rx234_pos, rx234_off
    substr $S10, rx234_tgt, $I11, 2
    ne $S10, "^^", rx234_fail
    add rx234_pos, 2
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
    rx234_cur."!cursor_pass"(rx234_pos, "metachar:sym<^^>")
    if_null rx234_debug, debug_280
    rx234_cur."!cursor_debug"("PASS", "metachar:sym<^^>", " at pos=", rx234_pos)
  debug_280:
    .return (rx234_cur)
  rx234_restart:
.annotate 'line', 3
    if_null rx234_debug, debug_281
    rx234_cur."!cursor_debug"("NEXT", "metachar:sym<^^>")
  debug_281:
  rx234_fail:
    (rx234_rep, rx234_pos, $I10, $P10) = rx234_cur."!mark_fail"(0)
    lt rx234_pos, -1, rx234_done
    eq rx234_pos, -1, rx234_fail
    jump $I10
  rx234_done:
    rx234_cur."!cursor_fail"()
    if_null rx234_debug, debug_282
    rx234_cur."!cursor_debug"("FAIL", "metachar:sym<^^>")
  debug_282:
    .return (rx234_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<^^>"  :subid("68_1283874333.85778") :method
.annotate 'line', 3
    new $P236, "ResizablePMCArray"
    push $P236, "^^"
    .return ($P236)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$>"  :subid("69_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx240_tgt
    .local int rx240_pos
    .local int rx240_off
    .local int rx240_eos
    .local int rx240_rep
    .local pmc rx240_cur
    .local pmc rx240_debug
    (rx240_cur, rx240_pos, rx240_tgt, $I10) = self."!cursor_start"()
    getattribute rx240_debug, rx240_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx240_cur
    .local pmc match
    .lex "$/", match
    length rx240_eos, rx240_tgt
    gt rx240_pos, rx240_eos, rx240_done
    set rx240_off, 0
    lt rx240_pos, 2, rx240_start
    sub rx240_off, rx240_pos, 1
    substr rx240_tgt, rx240_tgt, rx240_off
  rx240_start:
    eq $I10, 1, rx240_restart
    if_null rx240_debug, debug_283
    rx240_cur."!cursor_debug"("START", "metachar:sym<$>")
  debug_283:
    $I10 = self.'from'()
    ne $I10, -1, rxscan243_done
    goto rxscan243_scan
  rxscan243_loop:
    ($P10) = rx240_cur."from"()
    inc $P10
    set rx240_pos, $P10
    ge rx240_pos, rx240_eos, rxscan243_done
  rxscan243_scan:
    set_addr $I10, rxscan243_loop
    rx240_cur."!mark_push"(0, rx240_pos, $I10)
  rxscan243_done:
.annotate 'line', 91
  # rx subcapture "sym"
    set_addr $I10, rxcap_244_fail
    rx240_cur."!mark_push"(0, rx240_pos, $I10)
  # rx literal  "$"
    add $I11, rx240_pos, 1
    gt $I11, rx240_eos, rx240_fail
    sub $I11, rx240_pos, rx240_off
    ord $I11, rx240_tgt, $I11
    ne $I11, 36, rx240_fail
    add rx240_pos, 1
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
    rx240_cur."!cursor_pass"(rx240_pos, "metachar:sym<$>")
    if_null rx240_debug, debug_284
    rx240_cur."!cursor_debug"("PASS", "metachar:sym<$>", " at pos=", rx240_pos)
  debug_284:
    .return (rx240_cur)
  rx240_restart:
.annotate 'line', 3
    if_null rx240_debug, debug_285
    rx240_cur."!cursor_debug"("NEXT", "metachar:sym<$>")
  debug_285:
  rx240_fail:
    (rx240_rep, rx240_pos, $I10, $P10) = rx240_cur."!mark_fail"(0)
    lt rx240_pos, -1, rx240_done
    eq rx240_pos, -1, rx240_fail
    jump $I10
  rx240_done:
    rx240_cur."!cursor_fail"()
    if_null rx240_debug, debug_286
    rx240_cur."!cursor_debug"("FAIL", "metachar:sym<$>")
  debug_286:
    .return (rx240_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<$>"  :subid("70_1283874333.85778") :method
.annotate 'line', 3
    new $P242, "ResizablePMCArray"
    push $P242, "$"
    .return ($P242)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$$>"  :subid("71_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx246_tgt
    .local int rx246_pos
    .local int rx246_off
    .local int rx246_eos
    .local int rx246_rep
    .local pmc rx246_cur
    .local pmc rx246_debug
    (rx246_cur, rx246_pos, rx246_tgt, $I10) = self."!cursor_start"()
    getattribute rx246_debug, rx246_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx246_cur
    .local pmc match
    .lex "$/", match
    length rx246_eos, rx246_tgt
    gt rx246_pos, rx246_eos, rx246_done
    set rx246_off, 0
    lt rx246_pos, 2, rx246_start
    sub rx246_off, rx246_pos, 1
    substr rx246_tgt, rx246_tgt, rx246_off
  rx246_start:
    eq $I10, 1, rx246_restart
    if_null rx246_debug, debug_287
    rx246_cur."!cursor_debug"("START", "metachar:sym<$$>")
  debug_287:
    $I10 = self.'from'()
    ne $I10, -1, rxscan249_done
    goto rxscan249_scan
  rxscan249_loop:
    ($P10) = rx246_cur."from"()
    inc $P10
    set rx246_pos, $P10
    ge rx246_pos, rx246_eos, rxscan249_done
  rxscan249_scan:
    set_addr $I10, rxscan249_loop
    rx246_cur."!mark_push"(0, rx246_pos, $I10)
  rxscan249_done:
.annotate 'line', 92
  # rx subcapture "sym"
    set_addr $I10, rxcap_250_fail
    rx246_cur."!mark_push"(0, rx246_pos, $I10)
  # rx literal  "$$"
    add $I11, rx246_pos, 2
    gt $I11, rx246_eos, rx246_fail
    sub $I11, rx246_pos, rx246_off
    substr $S10, rx246_tgt, $I11, 2
    ne $S10, "$$", rx246_fail
    add rx246_pos, 2
    set_addr $I10, rxcap_250_fail
    ($I12, $I11) = rx246_cur."!mark_peek"($I10)
    rx246_cur."!cursor_pos"($I11)
    ($P10) = rx246_cur."!cursor_start"()
    $P10."!cursor_pass"(rx246_pos, "")
    rx246_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_250_done
  rxcap_250_fail:
    goto rx246_fail
  rxcap_250_done:
  # rx pass
    rx246_cur."!cursor_pass"(rx246_pos, "metachar:sym<$$>")
    if_null rx246_debug, debug_288
    rx246_cur."!cursor_debug"("PASS", "metachar:sym<$$>", " at pos=", rx246_pos)
  debug_288:
    .return (rx246_cur)
  rx246_restart:
.annotate 'line', 3
    if_null rx246_debug, debug_289
    rx246_cur."!cursor_debug"("NEXT", "metachar:sym<$$>")
  debug_289:
  rx246_fail:
    (rx246_rep, rx246_pos, $I10, $P10) = rx246_cur."!mark_fail"(0)
    lt rx246_pos, -1, rx246_done
    eq rx246_pos, -1, rx246_fail
    jump $I10
  rx246_done:
    rx246_cur."!cursor_fail"()
    if_null rx246_debug, debug_290
    rx246_cur."!cursor_debug"("FAIL", "metachar:sym<$$>")
  debug_290:
    .return (rx246_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<$$>"  :subid("72_1283874333.85778") :method
.annotate 'line', 3
    new $P248, "ResizablePMCArray"
    push $P248, "$$"
    .return ($P248)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<:::>"  :subid("73_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx252_tgt
    .local int rx252_pos
    .local int rx252_off
    .local int rx252_eos
    .local int rx252_rep
    .local pmc rx252_cur
    .local pmc rx252_debug
    (rx252_cur, rx252_pos, rx252_tgt, $I10) = self."!cursor_start"()
    getattribute rx252_debug, rx252_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx252_cur
    .local pmc match
    .lex "$/", match
    length rx252_eos, rx252_tgt
    gt rx252_pos, rx252_eos, rx252_done
    set rx252_off, 0
    lt rx252_pos, 2, rx252_start
    sub rx252_off, rx252_pos, 1
    substr rx252_tgt, rx252_tgt, rx252_off
  rx252_start:
    eq $I10, 1, rx252_restart
    if_null rx252_debug, debug_291
    rx252_cur."!cursor_debug"("START", "metachar:sym<:::>")
  debug_291:
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
.annotate 'line', 93
  # rx subcapture "sym"
    set_addr $I10, rxcap_257_fail
    rx252_cur."!mark_push"(0, rx252_pos, $I10)
  # rx literal  ":::"
    add $I11, rx252_pos, 3
    gt $I11, rx252_eos, rx252_fail
    sub $I11, rx252_pos, rx252_off
    substr $S10, rx252_tgt, $I11, 3
    ne $S10, ":::", rx252_fail
    add rx252_pos, 3
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
    $P10 = rx252_cur."panic"("::: not yet implemented")
    unless $P10, rx252_fail
    rx252_pos = $P10."pos"()
  # rx pass
    rx252_cur."!cursor_pass"(rx252_pos, "metachar:sym<:::>")
    if_null rx252_debug, debug_292
    rx252_cur."!cursor_debug"("PASS", "metachar:sym<:::>", " at pos=", rx252_pos)
  debug_292:
    .return (rx252_cur)
  rx252_restart:
.annotate 'line', 3
    if_null rx252_debug, debug_293
    rx252_cur."!cursor_debug"("NEXT", "metachar:sym<:::>")
  debug_293:
  rx252_fail:
    (rx252_rep, rx252_pos, $I10, $P10) = rx252_cur."!mark_fail"(0)
    lt rx252_pos, -1, rx252_done
    eq rx252_pos, -1, rx252_fail
    jump $I10
  rx252_done:
    rx252_cur."!cursor_fail"()
    if_null rx252_debug, debug_294
    rx252_cur."!cursor_debug"("FAIL", "metachar:sym<:::>")
  debug_294:
    .return (rx252_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<:::>"  :subid("74_1283874333.85778") :method
.annotate 'line', 3
    $P254 = self."!PREFIX__!subrule"("panic", ":::")
    new $P255, "ResizablePMCArray"
    push $P255, $P254
    .return ($P255)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<::>"  :subid("75_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx259_tgt
    .local int rx259_pos
    .local int rx259_off
    .local int rx259_eos
    .local int rx259_rep
    .local pmc rx259_cur
    .local pmc rx259_debug
    (rx259_cur, rx259_pos, rx259_tgt, $I10) = self."!cursor_start"()
    getattribute rx259_debug, rx259_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx259_cur
    .local pmc match
    .lex "$/", match
    length rx259_eos, rx259_tgt
    gt rx259_pos, rx259_eos, rx259_done
    set rx259_off, 0
    lt rx259_pos, 2, rx259_start
    sub rx259_off, rx259_pos, 1
    substr rx259_tgt, rx259_tgt, rx259_off
  rx259_start:
    eq $I10, 1, rx259_restart
    if_null rx259_debug, debug_295
    rx259_cur."!cursor_debug"("START", "metachar:sym<::>")
  debug_295:
    $I10 = self.'from'()
    ne $I10, -1, rxscan263_done
    goto rxscan263_scan
  rxscan263_loop:
    ($P10) = rx259_cur."from"()
    inc $P10
    set rx259_pos, $P10
    ge rx259_pos, rx259_eos, rxscan263_done
  rxscan263_scan:
    set_addr $I10, rxscan263_loop
    rx259_cur."!mark_push"(0, rx259_pos, $I10)
  rxscan263_done:
.annotate 'line', 94
  # rx subcapture "sym"
    set_addr $I10, rxcap_264_fail
    rx259_cur."!mark_push"(0, rx259_pos, $I10)
  # rx literal  "::"
    add $I11, rx259_pos, 2
    gt $I11, rx259_eos, rx259_fail
    sub $I11, rx259_pos, rx259_off
    substr $S10, rx259_tgt, $I11, 2
    ne $S10, "::", rx259_fail
    add rx259_pos, 2
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
  # rx subrule "panic" subtype=method negate=
    rx259_cur."!cursor_pos"(rx259_pos)
    $P10 = rx259_cur."panic"(":: not yet implemented")
    unless $P10, rx259_fail
    rx259_pos = $P10."pos"()
  # rx pass
    rx259_cur."!cursor_pass"(rx259_pos, "metachar:sym<::>")
    if_null rx259_debug, debug_296
    rx259_cur."!cursor_debug"("PASS", "metachar:sym<::>", " at pos=", rx259_pos)
  debug_296:
    .return (rx259_cur)
  rx259_restart:
.annotate 'line', 3
    if_null rx259_debug, debug_297
    rx259_cur."!cursor_debug"("NEXT", "metachar:sym<::>")
  debug_297:
  rx259_fail:
    (rx259_rep, rx259_pos, $I10, $P10) = rx259_cur."!mark_fail"(0)
    lt rx259_pos, -1, rx259_done
    eq rx259_pos, -1, rx259_fail
    jump $I10
  rx259_done:
    rx259_cur."!cursor_fail"()
    if_null rx259_debug, debug_298
    rx259_cur."!cursor_debug"("FAIL", "metachar:sym<::>")
  debug_298:
    .return (rx259_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<::>"  :subid("76_1283874333.85778") :method
.annotate 'line', 3
    $P261 = self."!PREFIX__!subrule"("panic", "::")
    new $P262, "ResizablePMCArray"
    push $P262, $P261
    .return ($P262)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<lwb>"  :subid("77_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx266_tgt
    .local int rx266_pos
    .local int rx266_off
    .local int rx266_eos
    .local int rx266_rep
    .local pmc rx266_cur
    .local pmc rx266_debug
    (rx266_cur, rx266_pos, rx266_tgt, $I10) = self."!cursor_start"()
    getattribute rx266_debug, rx266_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx266_cur
    .local pmc match
    .lex "$/", match
    length rx266_eos, rx266_tgt
    gt rx266_pos, rx266_eos, rx266_done
    set rx266_off, 0
    lt rx266_pos, 2, rx266_start
    sub rx266_off, rx266_pos, 1
    substr rx266_tgt, rx266_tgt, rx266_off
  rx266_start:
    eq $I10, 1, rx266_restart
    if_null rx266_debug, debug_299
    rx266_cur."!cursor_debug"("START", "metachar:sym<lwb>")
  debug_299:
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
.annotate 'line', 95
  # rx subcapture "sym"
    set_addr $I10, rxcap_271_fail
    rx266_cur."!mark_push"(0, rx266_pos, $I10)
  alt270_0:
    set_addr $I10, alt270_1
    rx266_cur."!mark_push"(0, rx266_pos, $I10)
  # rx literal  "<<"
    add $I11, rx266_pos, 2
    gt $I11, rx266_eos, rx266_fail
    sub $I11, rx266_pos, rx266_off
    substr $S10, rx266_tgt, $I11, 2
    ne $S10, "<<", rx266_fail
    add rx266_pos, 2
    goto alt270_end
  alt270_1:
  # rx literal  unicode:"\x{ab}"
    add $I11, rx266_pos, 1
    gt $I11, rx266_eos, rx266_fail
    sub $I11, rx266_pos, rx266_off
    ord $I11, rx266_tgt, $I11
    ne $I11, 171, rx266_fail
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
    rx266_cur."!cursor_pass"(rx266_pos, "metachar:sym<lwb>")
    if_null rx266_debug, debug_300
    rx266_cur."!cursor_debug"("PASS", "metachar:sym<lwb>", " at pos=", rx266_pos)
  debug_300:
    .return (rx266_cur)
  rx266_restart:
.annotate 'line', 3
    if_null rx266_debug, debug_301
    rx266_cur."!cursor_debug"("NEXT", "metachar:sym<lwb>")
  debug_301:
  rx266_fail:
    (rx266_rep, rx266_pos, $I10, $P10) = rx266_cur."!mark_fail"(0)
    lt rx266_pos, -1, rx266_done
    eq rx266_pos, -1, rx266_fail
    jump $I10
  rx266_done:
    rx266_cur."!cursor_fail"()
    if_null rx266_debug, debug_302
    rx266_cur."!cursor_debug"("FAIL", "metachar:sym<lwb>")
  debug_302:
    .return (rx266_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<lwb>"  :subid("78_1283874333.85778") :method
.annotate 'line', 3
    new $P268, "ResizablePMCArray"
    push $P268, unicode:"\x{ab}"
    push $P268, "<<"
    .return ($P268)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<rwb>"  :subid("79_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx273_tgt
    .local int rx273_pos
    .local int rx273_off
    .local int rx273_eos
    .local int rx273_rep
    .local pmc rx273_cur
    .local pmc rx273_debug
    (rx273_cur, rx273_pos, rx273_tgt, $I10) = self."!cursor_start"()
    getattribute rx273_debug, rx273_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx273_cur
    .local pmc match
    .lex "$/", match
    length rx273_eos, rx273_tgt
    gt rx273_pos, rx273_eos, rx273_done
    set rx273_off, 0
    lt rx273_pos, 2, rx273_start
    sub rx273_off, rx273_pos, 1
    substr rx273_tgt, rx273_tgt, rx273_off
  rx273_start:
    eq $I10, 1, rx273_restart
    if_null rx273_debug, debug_303
    rx273_cur."!cursor_debug"("START", "metachar:sym<rwb>")
  debug_303:
    $I10 = self.'from'()
    ne $I10, -1, rxscan276_done
    goto rxscan276_scan
  rxscan276_loop:
    ($P10) = rx273_cur."from"()
    inc $P10
    set rx273_pos, $P10
    ge rx273_pos, rx273_eos, rxscan276_done
  rxscan276_scan:
    set_addr $I10, rxscan276_loop
    rx273_cur."!mark_push"(0, rx273_pos, $I10)
  rxscan276_done:
.annotate 'line', 96
  # rx subcapture "sym"
    set_addr $I10, rxcap_278_fail
    rx273_cur."!mark_push"(0, rx273_pos, $I10)
  alt277_0:
    set_addr $I10, alt277_1
    rx273_cur."!mark_push"(0, rx273_pos, $I10)
  # rx literal  ">>"
    add $I11, rx273_pos, 2
    gt $I11, rx273_eos, rx273_fail
    sub $I11, rx273_pos, rx273_off
    substr $S10, rx273_tgt, $I11, 2
    ne $S10, ">>", rx273_fail
    add rx273_pos, 2
    goto alt277_end
  alt277_1:
  # rx literal  unicode:"\x{bb}"
    add $I11, rx273_pos, 1
    gt $I11, rx273_eos, rx273_fail
    sub $I11, rx273_pos, rx273_off
    ord $I11, rx273_tgt, $I11
    ne $I11, 187, rx273_fail
    add rx273_pos, 1
  alt277_end:
    set_addr $I10, rxcap_278_fail
    ($I12, $I11) = rx273_cur."!mark_peek"($I10)
    rx273_cur."!cursor_pos"($I11)
    ($P10) = rx273_cur."!cursor_start"()
    $P10."!cursor_pass"(rx273_pos, "")
    rx273_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_278_done
  rxcap_278_fail:
    goto rx273_fail
  rxcap_278_done:
  # rx pass
    rx273_cur."!cursor_pass"(rx273_pos, "metachar:sym<rwb>")
    if_null rx273_debug, debug_304
    rx273_cur."!cursor_debug"("PASS", "metachar:sym<rwb>", " at pos=", rx273_pos)
  debug_304:
    .return (rx273_cur)
  rx273_restart:
.annotate 'line', 3
    if_null rx273_debug, debug_305
    rx273_cur."!cursor_debug"("NEXT", "metachar:sym<rwb>")
  debug_305:
  rx273_fail:
    (rx273_rep, rx273_pos, $I10, $P10) = rx273_cur."!mark_fail"(0)
    lt rx273_pos, -1, rx273_done
    eq rx273_pos, -1, rx273_fail
    jump $I10
  rx273_done:
    rx273_cur."!cursor_fail"()
    if_null rx273_debug, debug_306
    rx273_cur."!cursor_debug"("FAIL", "metachar:sym<rwb>")
  debug_306:
    .return (rx273_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<rwb>"  :subid("80_1283874333.85778") :method
.annotate 'line', 3
    new $P275, "ResizablePMCArray"
    push $P275, unicode:"\x{bb}"
    push $P275, ">>"
    .return ($P275)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<bs>"  :subid("81_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx280_tgt
    .local int rx280_pos
    .local int rx280_off
    .local int rx280_eos
    .local int rx280_rep
    .local pmc rx280_cur
    .local pmc rx280_debug
    (rx280_cur, rx280_pos, rx280_tgt, $I10) = self."!cursor_start"()
    getattribute rx280_debug, rx280_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx280_cur
    .local pmc match
    .lex "$/", match
    length rx280_eos, rx280_tgt
    gt rx280_pos, rx280_eos, rx280_done
    set rx280_off, 0
    lt rx280_pos, 2, rx280_start
    sub rx280_off, rx280_pos, 1
    substr rx280_tgt, rx280_tgt, rx280_off
  rx280_start:
    eq $I10, 1, rx280_restart
    if_null rx280_debug, debug_307
    rx280_cur."!cursor_debug"("START", "metachar:sym<bs>")
  debug_307:
    $I10 = self.'from'()
    ne $I10, -1, rxscan284_done
    goto rxscan284_scan
  rxscan284_loop:
    ($P10) = rx280_cur."from"()
    inc $P10
    set rx280_pos, $P10
    ge rx280_pos, rx280_eos, rxscan284_done
  rxscan284_scan:
    set_addr $I10, rxscan284_loop
    rx280_cur."!mark_push"(0, rx280_pos, $I10)
  rxscan284_done:
.annotate 'line', 97
  # rx literal  "\\"
    add $I11, rx280_pos, 1
    gt $I11, rx280_eos, rx280_fail
    sub $I11, rx280_pos, rx280_off
    ord $I11, rx280_tgt, $I11
    ne $I11, 92, rx280_fail
    add rx280_pos, 1
  # rx subrule "backslash" subtype=capture negate=
    rx280_cur."!cursor_pos"(rx280_pos)
    $P10 = rx280_cur."backslash"()
    unless $P10, rx280_fail
    rx280_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backslash")
    rx280_pos = $P10."pos"()
  # rx pass
    rx280_cur."!cursor_pass"(rx280_pos, "metachar:sym<bs>")
    if_null rx280_debug, debug_308
    rx280_cur."!cursor_debug"("PASS", "metachar:sym<bs>", " at pos=", rx280_pos)
  debug_308:
    .return (rx280_cur)
  rx280_restart:
.annotate 'line', 3
    if_null rx280_debug, debug_309
    rx280_cur."!cursor_debug"("NEXT", "metachar:sym<bs>")
  debug_309:
  rx280_fail:
    (rx280_rep, rx280_pos, $I10, $P10) = rx280_cur."!mark_fail"(0)
    lt rx280_pos, -1, rx280_done
    eq rx280_pos, -1, rx280_fail
    jump $I10
  rx280_done:
    rx280_cur."!cursor_fail"()
    if_null rx280_debug, debug_310
    rx280_cur."!cursor_debug"("FAIL", "metachar:sym<bs>")
  debug_310:
    .return (rx280_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<bs>"  :subid("82_1283874333.85778") :method
.annotate 'line', 3
    $P282 = self."!PREFIX__!subrule"("backslash", "\\")
    new $P283, "ResizablePMCArray"
    push $P283, $P282
    .return ($P283)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<mod>"  :subid("83_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx286_tgt
    .local int rx286_pos
    .local int rx286_off
    .local int rx286_eos
    .local int rx286_rep
    .local pmc rx286_cur
    .local pmc rx286_debug
    (rx286_cur, rx286_pos, rx286_tgt, $I10) = self."!cursor_start"()
    getattribute rx286_debug, rx286_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx286_cur
    .local pmc match
    .lex "$/", match
    length rx286_eos, rx286_tgt
    gt rx286_pos, rx286_eos, rx286_done
    set rx286_off, 0
    lt rx286_pos, 2, rx286_start
    sub rx286_off, rx286_pos, 1
    substr rx286_tgt, rx286_tgt, rx286_off
  rx286_start:
    eq $I10, 1, rx286_restart
    if_null rx286_debug, debug_311
    rx286_cur."!cursor_debug"("START", "metachar:sym<mod>")
  debug_311:
    $I10 = self.'from'()
    ne $I10, -1, rxscan290_done
    goto rxscan290_scan
  rxscan290_loop:
    ($P10) = rx286_cur."from"()
    inc $P10
    set rx286_pos, $P10
    ge rx286_pos, rx286_eos, rxscan290_done
  rxscan290_scan:
    set_addr $I10, rxscan290_loop
    rx286_cur."!mark_push"(0, rx286_pos, $I10)
  rxscan290_done:
.annotate 'line', 98
  # rx subrule "mod_internal" subtype=capture negate=
    rx286_cur."!cursor_pos"(rx286_pos)
    $P10 = rx286_cur."mod_internal"()
    unless $P10, rx286_fail
    rx286_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_internal")
    rx286_pos = $P10."pos"()
  # rx pass
    rx286_cur."!cursor_pass"(rx286_pos, "metachar:sym<mod>")
    if_null rx286_debug, debug_312
    rx286_cur."!cursor_debug"("PASS", "metachar:sym<mod>", " at pos=", rx286_pos)
  debug_312:
    .return (rx286_cur)
  rx286_restart:
.annotate 'line', 3
    if_null rx286_debug, debug_313
    rx286_cur."!cursor_debug"("NEXT", "metachar:sym<mod>")
  debug_313:
  rx286_fail:
    (rx286_rep, rx286_pos, $I10, $P10) = rx286_cur."!mark_fail"(0)
    lt rx286_pos, -1, rx286_done
    eq rx286_pos, -1, rx286_fail
    jump $I10
  rx286_done:
    rx286_cur."!cursor_fail"()
    if_null rx286_debug, debug_314
    rx286_cur."!cursor_debug"("FAIL", "metachar:sym<mod>")
  debug_314:
    .return (rx286_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<mod>"  :subid("84_1283874333.85778") :method
.annotate 'line', 3
    $P288 = self."!PREFIX__!subrule"("mod_internal", "")
    new $P289, "ResizablePMCArray"
    push $P289, $P288
    .return ($P289)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<quantifier>"  :subid("85_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx292_tgt
    .local int rx292_pos
    .local int rx292_off
    .local int rx292_eos
    .local int rx292_rep
    .local pmc rx292_cur
    .local pmc rx292_debug
    (rx292_cur, rx292_pos, rx292_tgt, $I10) = self."!cursor_start"()
    getattribute rx292_debug, rx292_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx292_cur
    .local pmc match
    .lex "$/", match
    length rx292_eos, rx292_tgt
    gt rx292_pos, rx292_eos, rx292_done
    set rx292_off, 0
    lt rx292_pos, 2, rx292_start
    sub rx292_off, rx292_pos, 1
    substr rx292_tgt, rx292_tgt, rx292_off
  rx292_start:
    eq $I10, 1, rx292_restart
    if_null rx292_debug, debug_315
    rx292_cur."!cursor_debug"("START", "metachar:sym<quantifier>")
  debug_315:
    $I10 = self.'from'()
    ne $I10, -1, rxscan296_done
    goto rxscan296_scan
  rxscan296_loop:
    ($P10) = rx292_cur."from"()
    inc $P10
    set rx292_pos, $P10
    ge rx292_pos, rx292_eos, rxscan296_done
  rxscan296_scan:
    set_addr $I10, rxscan296_loop
    rx292_cur."!mark_push"(0, rx292_pos, $I10)
  rxscan296_done:
.annotate 'line', 100
  # rx subrule "quantifier" subtype=capture negate=
    rx292_cur."!cursor_pos"(rx292_pos)
    $P10 = rx292_cur."quantifier"()
    unless $P10, rx292_fail
    rx292_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantifier")
    rx292_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx292_cur."!cursor_pos"(rx292_pos)
    $P10 = rx292_cur."panic"("Quantifier quantifies nothing")
    unless $P10, rx292_fail
    rx292_pos = $P10."pos"()
.annotate 'line', 99
  # rx pass
    rx292_cur."!cursor_pass"(rx292_pos, "metachar:sym<quantifier>")
    if_null rx292_debug, debug_316
    rx292_cur."!cursor_debug"("PASS", "metachar:sym<quantifier>", " at pos=", rx292_pos)
  debug_316:
    .return (rx292_cur)
  rx292_restart:
.annotate 'line', 3
    if_null rx292_debug, debug_317
    rx292_cur."!cursor_debug"("NEXT", "metachar:sym<quantifier>")
  debug_317:
  rx292_fail:
    (rx292_rep, rx292_pos, $I10, $P10) = rx292_cur."!mark_fail"(0)
    lt rx292_pos, -1, rx292_done
    eq rx292_pos, -1, rx292_fail
    jump $I10
  rx292_done:
    rx292_cur."!cursor_fail"()
    if_null rx292_debug, debug_318
    rx292_cur."!cursor_debug"("FAIL", "metachar:sym<quantifier>")
  debug_318:
    .return (rx292_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<quantifier>"  :subid("86_1283874333.85778") :method
.annotate 'line', 3
    $P294 = self."!PREFIX__!subrule"("quantifier", "")
    new $P295, "ResizablePMCArray"
    push $P295, $P294
    .return ($P295)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<~>"  :subid("87_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx298_tgt
    .local int rx298_pos
    .local int rx298_off
    .local int rx298_eos
    .local int rx298_rep
    .local pmc rx298_cur
    .local pmc rx298_debug
    (rx298_cur, rx298_pos, rx298_tgt, $I10) = self."!cursor_start"()
    getattribute rx298_debug, rx298_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx298_cur
    .local pmc match
    .lex "$/", match
    length rx298_eos, rx298_tgt
    gt rx298_pos, rx298_eos, rx298_done
    set rx298_off, 0
    lt rx298_pos, 2, rx298_start
    sub rx298_off, rx298_pos, 1
    substr rx298_tgt, rx298_tgt, rx298_off
  rx298_start:
    eq $I10, 1, rx298_restart
    if_null rx298_debug, debug_319
    rx298_cur."!cursor_debug"("START", "metachar:sym<~>")
  debug_319:
    $I10 = self.'from'()
    ne $I10, -1, rxscan302_done
    goto rxscan302_scan
  rxscan302_loop:
    ($P10) = rx298_cur."from"()
    inc $P10
    set rx298_pos, $P10
    ge rx298_pos, rx298_eos, rxscan302_done
  rxscan302_scan:
    set_addr $I10, rxscan302_loop
    rx298_cur."!mark_push"(0, rx298_pos, $I10)
  rxscan302_done:
.annotate 'line', 105
  # rx subcapture "sym"
    set_addr $I10, rxcap_303_fail
    rx298_cur."!mark_push"(0, rx298_pos, $I10)
  # rx literal  "~"
    add $I11, rx298_pos, 1
    gt $I11, rx298_eos, rx298_fail
    sub $I11, rx298_pos, rx298_off
    ord $I11, rx298_tgt, $I11
    ne $I11, 126, rx298_fail
    add rx298_pos, 1
    set_addr $I10, rxcap_303_fail
    ($I12, $I11) = rx298_cur."!mark_peek"($I10)
    rx298_cur."!cursor_pos"($I11)
    ($P10) = rx298_cur."!cursor_start"()
    $P10."!cursor_pass"(rx298_pos, "")
    rx298_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_303_done
  rxcap_303_fail:
    goto rx298_fail
  rxcap_303_done:
.annotate 'line', 106
  # rx subrule "ws" subtype=method negate=
    rx298_cur."!cursor_pos"(rx298_pos)
    $P10 = rx298_cur."ws"()
    unless $P10, rx298_fail
    rx298_pos = $P10."pos"()
  # rx subrule "quantified_atom" subtype=capture negate=
    rx298_cur."!cursor_pos"(rx298_pos)
    $P10 = rx298_cur."quantified_atom"()
    unless $P10, rx298_fail
    rx298_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("GOAL")
    rx298_pos = $P10."pos"()
.annotate 'line', 107
  # rx subrule "ws" subtype=method negate=
    rx298_cur."!cursor_pos"(rx298_pos)
    $P10 = rx298_cur."ws"()
    unless $P10, rx298_fail
    rx298_pos = $P10."pos"()
  # rx subrule "quantified_atom" subtype=capture negate=
    rx298_cur."!cursor_pos"(rx298_pos)
    $P10 = rx298_cur."quantified_atom"()
    unless $P10, rx298_fail
    rx298_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx298_pos = $P10."pos"()
.annotate 'line', 104
  # rx pass
    rx298_cur."!cursor_pass"(rx298_pos, "metachar:sym<~>")
    if_null rx298_debug, debug_320
    rx298_cur."!cursor_debug"("PASS", "metachar:sym<~>", " at pos=", rx298_pos)
  debug_320:
    .return (rx298_cur)
  rx298_restart:
.annotate 'line', 3
    if_null rx298_debug, debug_321
    rx298_cur."!cursor_debug"("NEXT", "metachar:sym<~>")
  debug_321:
  rx298_fail:
    (rx298_rep, rx298_pos, $I10, $P10) = rx298_cur."!mark_fail"(0)
    lt rx298_pos, -1, rx298_done
    eq rx298_pos, -1, rx298_fail
    jump $I10
  rx298_done:
    rx298_cur."!cursor_fail"()
    if_null rx298_debug, debug_322
    rx298_cur."!cursor_debug"("FAIL", "metachar:sym<~>")
  debug_322:
    .return (rx298_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<~>"  :subid("88_1283874333.85778") :method
.annotate 'line', 3
    $P300 = self."!PREFIX__!subrule"("ws", "~")
    new $P301, "ResizablePMCArray"
    push $P301, $P300
    .return ($P301)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<{*}>"  :subid("89_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx305_tgt
    .local int rx305_pos
    .local int rx305_off
    .local int rx305_eos
    .local int rx305_rep
    .local pmc rx305_cur
    .local pmc rx305_debug
    (rx305_cur, rx305_pos, rx305_tgt, $I10) = self."!cursor_start"()
    rx305_cur."!cursor_caparray"("key")
    getattribute rx305_debug, rx305_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx305_cur
    .local pmc match
    .lex "$/", match
    length rx305_eos, rx305_tgt
    gt rx305_pos, rx305_eos, rx305_done
    set rx305_off, 0
    lt rx305_pos, 2, rx305_start
    sub rx305_off, rx305_pos, 1
    substr rx305_tgt, rx305_tgt, rx305_off
  rx305_start:
    eq $I10, 1, rx305_restart
    if_null rx305_debug, debug_323
    rx305_cur."!cursor_debug"("START", "metachar:sym<{*}>")
  debug_323:
    $I10 = self.'from'()
    ne $I10, -1, rxscan308_done
    goto rxscan308_scan
  rxscan308_loop:
    ($P10) = rx305_cur."from"()
    inc $P10
    set rx305_pos, $P10
    ge rx305_pos, rx305_eos, rxscan308_done
  rxscan308_scan:
    set_addr $I10, rxscan308_loop
    rx305_cur."!mark_push"(0, rx305_pos, $I10)
  rxscan308_done:
.annotate 'line', 111
  # rx subcapture "sym"
    set_addr $I10, rxcap_309_fail
    rx305_cur."!mark_push"(0, rx305_pos, $I10)
  # rx literal  "{*}"
    add $I11, rx305_pos, 3
    gt $I11, rx305_eos, rx305_fail
    sub $I11, rx305_pos, rx305_off
    substr $S10, rx305_tgt, $I11, 3
    ne $S10, "{*}", rx305_fail
    add rx305_pos, 3
    set_addr $I10, rxcap_309_fail
    ($I12, $I11) = rx305_cur."!mark_peek"($I10)
    rx305_cur."!cursor_pos"($I11)
    ($P10) = rx305_cur."!cursor_start"()
    $P10."!cursor_pass"(rx305_pos, "")
    rx305_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_309_done
  rxcap_309_fail:
    goto rx305_fail
  rxcap_309_done:
.annotate 'line', 112
  # rx rxquantr310 ** 0..1
    set_addr $I10, rxquantr310_done
    rx305_cur."!mark_push"(0, rx305_pos, $I10)
  rxquantr310_loop:
  # rx enumcharlist_q negate=0  r 0..-1
    sub $I10, rx305_pos, rx305_off
    set rx305_rep, 0
    sub $I12, rx305_eos, rx305_pos
  rxenumcharlistq311_loop:
    le $I12, 0, rxenumcharlistq311_done
    substr $S10, rx305_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq311_done
    inc rx305_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq311_loop
  rxenumcharlistq311_done:
    add rx305_pos, rx305_pos, rx305_rep
  # rx literal  "#= "
    add $I11, rx305_pos, 3
    gt $I11, rx305_eos, rx305_fail
    sub $I11, rx305_pos, rx305_off
    substr $S10, rx305_tgt, $I11, 3
    ne $S10, "#= ", rx305_fail
    add rx305_pos, 3
  # rx enumcharlist_q negate=0  r 0..-1
    sub $I10, rx305_pos, rx305_off
    set rx305_rep, 0
    sub $I12, rx305_eos, rx305_pos
  rxenumcharlistq312_loop:
    le $I12, 0, rxenumcharlistq312_done
    substr $S10, rx305_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq312_done
    inc rx305_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq312_loop
  rxenumcharlistq312_done:
    add rx305_pos, rx305_pos, rx305_rep
  # rx subcapture "key"
    set_addr $I10, rxcap_315_fail
    rx305_cur."!mark_push"(0, rx305_pos, $I10)
  # rx charclass_q S r 1..-1
    sub $I10, rx305_pos, rx305_off
    find_cclass $I11, 32, rx305_tgt, $I10, rx305_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx305_fail
    add rx305_pos, rx305_off, $I11
  # rx rxquantr313 ** 0..*
    set_addr $I10, rxquantr313_done
    rx305_cur."!mark_push"(0, rx305_pos, $I10)
  rxquantr313_loop:
  # rx enumcharlist_q negate=0  r 1..-1
    sub $I10, rx305_pos, rx305_off
    set rx305_rep, 0
    sub $I12, rx305_eos, rx305_pos
  rxenumcharlistq314_loop:
    le $I12, 0, rxenumcharlistq314_done
    substr $S10, rx305_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq314_done
    inc rx305_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq314_loop
  rxenumcharlistq314_done:
    lt rx305_rep, 1, rx305_fail
    add rx305_pos, rx305_pos, rx305_rep
  # rx charclass_q S r 1..-1
    sub $I10, rx305_pos, rx305_off
    find_cclass $I11, 32, rx305_tgt, $I10, rx305_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx305_fail
    add rx305_pos, rx305_off, $I11
    set_addr $I10, rxquantr313_done
    (rx305_rep) = rx305_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr313_done
    rx305_cur."!mark_push"(rx305_rep, rx305_pos, $I10)
    goto rxquantr313_loop
  rxquantr313_done:
    set_addr $I10, rxcap_315_fail
    ($I12, $I11) = rx305_cur."!mark_peek"($I10)
    rx305_cur."!cursor_pos"($I11)
    ($P10) = rx305_cur."!cursor_start"()
    $P10."!cursor_pass"(rx305_pos, "")
    rx305_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("key")
    goto rxcap_315_done
  rxcap_315_fail:
    goto rx305_fail
  rxcap_315_done:
    set_addr $I10, rxquantr310_done
    (rx305_rep) = rx305_cur."!mark_commit"($I10)
  rxquantr310_done:
.annotate 'line', 110
  # rx pass
    rx305_cur."!cursor_pass"(rx305_pos, "metachar:sym<{*}>")
    if_null rx305_debug, debug_324
    rx305_cur."!cursor_debug"("PASS", "metachar:sym<{*}>", " at pos=", rx305_pos)
  debug_324:
    .return (rx305_cur)
  rx305_restart:
.annotate 'line', 3
    if_null rx305_debug, debug_325
    rx305_cur."!cursor_debug"("NEXT", "metachar:sym<{*}>")
  debug_325:
  rx305_fail:
    (rx305_rep, rx305_pos, $I10, $P10) = rx305_cur."!mark_fail"(0)
    lt rx305_pos, -1, rx305_done
    eq rx305_pos, -1, rx305_fail
    jump $I10
  rx305_done:
    rx305_cur."!cursor_fail"()
    if_null rx305_debug, debug_326
    rx305_cur."!cursor_debug"("FAIL", "metachar:sym<{*}>")
  debug_326:
    .return (rx305_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<{*}>"  :subid("90_1283874333.85778") :method
.annotate 'line', 3
    new $P307, "ResizablePMCArray"
    push $P307, "{*}"
    .return ($P307)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<assert>"  :subid("91_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx317_tgt
    .local int rx317_pos
    .local int rx317_off
    .local int rx317_eos
    .local int rx317_rep
    .local pmc rx317_cur
    .local pmc rx317_debug
    (rx317_cur, rx317_pos, rx317_tgt, $I10) = self."!cursor_start"()
    getattribute rx317_debug, rx317_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx317_cur
    .local pmc match
    .lex "$/", match
    length rx317_eos, rx317_tgt
    gt rx317_pos, rx317_eos, rx317_done
    set rx317_off, 0
    lt rx317_pos, 2, rx317_start
    sub rx317_off, rx317_pos, 1
    substr rx317_tgt, rx317_tgt, rx317_off
  rx317_start:
    eq $I10, 1, rx317_restart
    if_null rx317_debug, debug_327
    rx317_cur."!cursor_debug"("START", "metachar:sym<assert>")
  debug_327:
    $I10 = self.'from'()
    ne $I10, -1, rxscan321_done
    goto rxscan321_scan
  rxscan321_loop:
    ($P10) = rx317_cur."from"()
    inc $P10
    set rx317_pos, $P10
    ge rx317_pos, rx317_eos, rxscan321_done
  rxscan321_scan:
    set_addr $I10, rxscan321_loop
    rx317_cur."!mark_push"(0, rx317_pos, $I10)
  rxscan321_done:
.annotate 'line', 115
  # rx literal  "<"
    add $I11, rx317_pos, 1
    gt $I11, rx317_eos, rx317_fail
    sub $I11, rx317_pos, rx317_off
    ord $I11, rx317_tgt, $I11
    ne $I11, 60, rx317_fail
    add rx317_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx317_cur."!cursor_pos"(rx317_pos)
    $P10 = rx317_cur."assertion"()
    unless $P10, rx317_fail
    rx317_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx317_pos = $P10."pos"()
  alt322_0:
.annotate 'line', 116
    set_addr $I10, alt322_1
    rx317_cur."!mark_push"(0, rx317_pos, $I10)
  # rx literal  ">"
    add $I11, rx317_pos, 1
    gt $I11, rx317_eos, rx317_fail
    sub $I11, rx317_pos, rx317_off
    ord $I11, rx317_tgt, $I11
    ne $I11, 62, rx317_fail
    add rx317_pos, 1
    goto alt322_end
  alt322_1:
  # rx subrule "panic" subtype=method negate=
    rx317_cur."!cursor_pos"(rx317_pos)
    $P10 = rx317_cur."panic"("regex assertion not terminated by angle bracket")
    unless $P10, rx317_fail
    rx317_pos = $P10."pos"()
  alt322_end:
.annotate 'line', 114
  # rx pass
    rx317_cur."!cursor_pass"(rx317_pos, "metachar:sym<assert>")
    if_null rx317_debug, debug_328
    rx317_cur."!cursor_debug"("PASS", "metachar:sym<assert>", " at pos=", rx317_pos)
  debug_328:
    .return (rx317_cur)
  rx317_restart:
.annotate 'line', 3
    if_null rx317_debug, debug_329
    rx317_cur."!cursor_debug"("NEXT", "metachar:sym<assert>")
  debug_329:
  rx317_fail:
    (rx317_rep, rx317_pos, $I10, $P10) = rx317_cur."!mark_fail"(0)
    lt rx317_pos, -1, rx317_done
    eq rx317_pos, -1, rx317_fail
    jump $I10
  rx317_done:
    rx317_cur."!cursor_fail"()
    if_null rx317_debug, debug_330
    rx317_cur."!cursor_debug"("FAIL", "metachar:sym<assert>")
  debug_330:
    .return (rx317_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<assert>"  :subid("92_1283874333.85778") :method
.annotate 'line', 3
    $P319 = self."!PREFIX__!subrule"("assertion", "<")
    new $P320, "ResizablePMCArray"
    push $P320, $P319
    .return ($P320)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<var>"  :subid("93_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx324_tgt
    .local int rx324_pos
    .local int rx324_off
    .local int rx324_eos
    .local int rx324_rep
    .local pmc rx324_cur
    .local pmc rx324_debug
    (rx324_cur, rx324_pos, rx324_tgt, $I10) = self."!cursor_start"()
    rx324_cur."!cursor_caparray"("quantified_atom")
    getattribute rx324_debug, rx324_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx324_cur
    .local pmc match
    .lex "$/", match
    length rx324_eos, rx324_tgt
    gt rx324_pos, rx324_eos, rx324_done
    set rx324_off, 0
    lt rx324_pos, 2, rx324_start
    sub rx324_off, rx324_pos, 1
    substr rx324_tgt, rx324_tgt, rx324_off
  rx324_start:
    eq $I10, 1, rx324_restart
    if_null rx324_debug, debug_331
    rx324_cur."!cursor_debug"("START", "metachar:sym<var>")
  debug_331:
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
  alt328_0:
.annotate 'line', 120
    set_addr $I10, alt328_1
    rx324_cur."!mark_push"(0, rx324_pos, $I10)
.annotate 'line', 121
  # rx literal  "$<"
    add $I11, rx324_pos, 2
    gt $I11, rx324_eos, rx324_fail
    sub $I11, rx324_pos, rx324_off
    substr $S10, rx324_tgt, $I11, 2
    ne $S10, "$<", rx324_fail
    add rx324_pos, 2
  # rx subcapture "name"
    set_addr $I10, rxcap_330_fail
    rx324_cur."!mark_push"(0, rx324_pos, $I10)
  # rx enumcharlist_q negate=1  r 1..-1
    sub $I10, rx324_pos, rx324_off
    set rx324_rep, 0
    sub $I12, rx324_eos, rx324_pos
  rxenumcharlistq329_loop:
    le $I12, 0, rxenumcharlistq329_done
    substr $S10, rx324_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rxenumcharlistq329_done
    inc rx324_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq329_loop
  rxenumcharlistq329_done:
    lt rx324_rep, 1, rx324_fail
    add rx324_pos, rx324_pos, rx324_rep
    set_addr $I10, rxcap_330_fail
    ($I12, $I11) = rx324_cur."!mark_peek"($I10)
    rx324_cur."!cursor_pos"($I11)
    ($P10) = rx324_cur."!cursor_start"()
    $P10."!cursor_pass"(rx324_pos, "")
    rx324_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_330_done
  rxcap_330_fail:
    goto rx324_fail
  rxcap_330_done:
  # rx literal  ">"
    add $I11, rx324_pos, 1
    gt $I11, rx324_eos, rx324_fail
    sub $I11, rx324_pos, rx324_off
    ord $I11, rx324_tgt, $I11
    ne $I11, 62, rx324_fail
    add rx324_pos, 1
    goto alt328_end
  alt328_1:
.annotate 'line', 122
  # rx literal  "$"
    add $I11, rx324_pos, 1
    gt $I11, rx324_eos, rx324_fail
    sub $I11, rx324_pos, rx324_off
    ord $I11, rx324_tgt, $I11
    ne $I11, 36, rx324_fail
    add rx324_pos, 1
  # rx subcapture "pos"
    set_addr $I10, rxcap_331_fail
    rx324_cur."!mark_push"(0, rx324_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx324_pos, rx324_off
    find_not_cclass $I11, 8, rx324_tgt, $I10, rx324_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx324_fail
    add rx324_pos, rx324_off, $I11
    set_addr $I10, rxcap_331_fail
    ($I12, $I11) = rx324_cur."!mark_peek"($I10)
    rx324_cur."!cursor_pos"($I11)
    ($P10) = rx324_cur."!cursor_start"()
    $P10."!cursor_pass"(rx324_pos, "")
    rx324_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pos")
    goto rxcap_331_done
  rxcap_331_fail:
    goto rx324_fail
  rxcap_331_done:
  alt328_end:
.annotate 'line', 125
  # rx rxquantr332 ** 0..1
    set_addr $I10, rxquantr332_done
    rx324_cur."!mark_push"(0, rx324_pos, $I10)
  rxquantr332_loop:
  # rx subrule "ws" subtype=method negate=
    rx324_cur."!cursor_pos"(rx324_pos)
    $P10 = rx324_cur."ws"()
    unless $P10, rx324_fail
    rx324_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx324_pos, 1
    gt $I11, rx324_eos, rx324_fail
    sub $I11, rx324_pos, rx324_off
    ord $I11, rx324_tgt, $I11
    ne $I11, 61, rx324_fail
    add rx324_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx324_cur."!cursor_pos"(rx324_pos)
    $P10 = rx324_cur."ws"()
    unless $P10, rx324_fail
    rx324_pos = $P10."pos"()
  # rx subrule "quantified_atom" subtype=capture negate=
    rx324_cur."!cursor_pos"(rx324_pos)
    $P10 = rx324_cur."quantified_atom"()
    unless $P10, rx324_fail
    rx324_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantified_atom")
    rx324_pos = $P10."pos"()
    set_addr $I10, rxquantr332_done
    (rx324_rep) = rx324_cur."!mark_commit"($I10)
  rxquantr332_done:
.annotate 'line', 119
  # rx pass
    rx324_cur."!cursor_pass"(rx324_pos, "metachar:sym<var>")
    if_null rx324_debug, debug_332
    rx324_cur."!cursor_debug"("PASS", "metachar:sym<var>", " at pos=", rx324_pos)
  debug_332:
    .return (rx324_cur)
  rx324_restart:
.annotate 'line', 3
    if_null rx324_debug, debug_333
    rx324_cur."!cursor_debug"("NEXT", "metachar:sym<var>")
  debug_333:
  rx324_fail:
    (rx324_rep, rx324_pos, $I10, $P10) = rx324_cur."!mark_fail"(0)
    lt rx324_pos, -1, rx324_done
    eq rx324_pos, -1, rx324_fail
    jump $I10
  rx324_done:
    rx324_cur."!cursor_fail"()
    if_null rx324_debug, debug_334
    rx324_cur."!cursor_debug"("FAIL", "metachar:sym<var>")
  debug_334:
    .return (rx324_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<var>"  :subid("94_1283874333.85778") :method
.annotate 'line', 3
    new $P326, "ResizablePMCArray"
    push $P326, "$"
    push $P326, "$<"
    .return ($P326)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<PIR>"  :subid("95_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx334_tgt
    .local int rx334_pos
    .local int rx334_off
    .local int rx334_eos
    .local int rx334_rep
    .local pmc rx334_cur
    .local pmc rx334_debug
    (rx334_cur, rx334_pos, rx334_tgt, $I10) = self."!cursor_start"()
    getattribute rx334_debug, rx334_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx334_cur
    .local pmc match
    .lex "$/", match
    length rx334_eos, rx334_tgt
    gt rx334_pos, rx334_eos, rx334_done
    set rx334_off, 0
    lt rx334_pos, 2, rx334_start
    sub rx334_off, rx334_pos, 1
    substr rx334_tgt, rx334_tgt, rx334_off
  rx334_start:
    eq $I10, 1, rx334_restart
    if_null rx334_debug, debug_335
    rx334_cur."!cursor_debug"("START", "metachar:sym<PIR>")
  debug_335:
    $I10 = self.'from'()
    ne $I10, -1, rxscan337_done
    goto rxscan337_scan
  rxscan337_loop:
    ($P10) = rx334_cur."from"()
    inc $P10
    set rx334_pos, $P10
    ge rx334_pos, rx334_eos, rxscan337_done
  rxscan337_scan:
    set_addr $I10, rxscan337_loop
    rx334_cur."!mark_push"(0, rx334_pos, $I10)
  rxscan337_done:
.annotate 'line', 129
  # rx literal  ":PIR{{"
    add $I11, rx334_pos, 6
    gt $I11, rx334_eos, rx334_fail
    sub $I11, rx334_pos, rx334_off
    substr $S10, rx334_tgt, $I11, 6
    ne $S10, ":PIR{{", rx334_fail
    add rx334_pos, 6
  # rx subcapture "pir"
    set_addr $I10, rxcap_340_fail
    rx334_cur."!mark_push"(0, rx334_pos, $I10)
  # rx rxquantf338 ** 0..*
    set_addr $I10, rxquantf338_loop
    rx334_cur."!mark_push"(0, rx334_pos, $I10)
    goto rxquantf338_done
  rxquantf338_loop:
  # rx charclass .
    ge rx334_pos, rx334_eos, rx334_fail
    inc rx334_pos
    set_addr $I10, rxquantf338_loop
    rx334_cur."!mark_push"(rx334_rep, rx334_pos, $I10)
  rxquantf338_done:
    set_addr $I10, rxcap_340_fail
    ($I12, $I11) = rx334_cur."!mark_peek"($I10)
    rx334_cur."!cursor_pos"($I11)
    ($P10) = rx334_cur."!cursor_start"()
    $P10."!cursor_pass"(rx334_pos, "")
    rx334_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pir")
    goto rxcap_340_done
  rxcap_340_fail:
    goto rx334_fail
  rxcap_340_done:
  # rx literal  "}}"
    add $I11, rx334_pos, 2
    gt $I11, rx334_eos, rx334_fail
    sub $I11, rx334_pos, rx334_off
    substr $S10, rx334_tgt, $I11, 2
    ne $S10, "}}", rx334_fail
    add rx334_pos, 2
.annotate 'line', 128
  # rx pass
    rx334_cur."!cursor_pass"(rx334_pos, "metachar:sym<PIR>")
    if_null rx334_debug, debug_336
    rx334_cur."!cursor_debug"("PASS", "metachar:sym<PIR>", " at pos=", rx334_pos)
  debug_336:
    .return (rx334_cur)
  rx334_restart:
.annotate 'line', 3
    if_null rx334_debug, debug_337
    rx334_cur."!cursor_debug"("NEXT", "metachar:sym<PIR>")
  debug_337:
  rx334_fail:
    (rx334_rep, rx334_pos, $I10, $P10) = rx334_cur."!mark_fail"(0)
    lt rx334_pos, -1, rx334_done
    eq rx334_pos, -1, rx334_fail
    jump $I10
  rx334_done:
    rx334_cur."!cursor_fail"()
    if_null rx334_debug, debug_338
    rx334_cur."!cursor_debug"("FAIL", "metachar:sym<PIR>")
  debug_338:
    .return (rx334_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<PIR>"  :subid("96_1283874333.85778") :method
.annotate 'line', 3
    new $P336, "ResizablePMCArray"
    push $P336, ":PIR{{"
    .return ($P336)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash"  :subid("97_1283874333.85778") :method
.annotate 'line', 132
    $P342 = self."!protoregex"("backslash")
    .return ($P342)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash"  :subid("98_1283874333.85778") :method
.annotate 'line', 132
    $P344 = self."!PREFIX__!protoregex"("backslash")
    .return ($P344)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<w>"  :subid("99_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx346_tgt
    .local int rx346_pos
    .local int rx346_off
    .local int rx346_eos
    .local int rx346_rep
    .local pmc rx346_cur
    .local pmc rx346_debug
    (rx346_cur, rx346_pos, rx346_tgt, $I10) = self."!cursor_start"()
    getattribute rx346_debug, rx346_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx346_cur
    .local pmc match
    .lex "$/", match
    length rx346_eos, rx346_tgt
    gt rx346_pos, rx346_eos, rx346_done
    set rx346_off, 0
    lt rx346_pos, 2, rx346_start
    sub rx346_off, rx346_pos, 1
    substr rx346_tgt, rx346_tgt, rx346_off
  rx346_start:
    eq $I10, 1, rx346_restart
    if_null rx346_debug, debug_339
    rx346_cur."!cursor_debug"("START", "backslash:sym<w>")
  debug_339:
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
.annotate 'line', 133
  # rx subcapture "sym"
    set_addr $I10, rxcap_350_fail
    rx346_cur."!mark_push"(0, rx346_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx346_pos, rx346_eos, rx346_fail
    sub $I10, rx346_pos, rx346_off
    substr $S10, rx346_tgt, $I10, 1
    index $I11, "dswnDSWN", $S10
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
    rx346_cur."!cursor_pass"(rx346_pos, "backslash:sym<w>")
    if_null rx346_debug, debug_340
    rx346_cur."!cursor_debug"("PASS", "backslash:sym<w>", " at pos=", rx346_pos)
  debug_340:
    .return (rx346_cur)
  rx346_restart:
.annotate 'line', 3
    if_null rx346_debug, debug_341
    rx346_cur."!cursor_debug"("NEXT", "backslash:sym<w>")
  debug_341:
  rx346_fail:
    (rx346_rep, rx346_pos, $I10, $P10) = rx346_cur."!mark_fail"(0)
    lt rx346_pos, -1, rx346_done
    eq rx346_pos, -1, rx346_fail
    jump $I10
  rx346_done:
    rx346_cur."!cursor_fail"()
    if_null rx346_debug, debug_342
    rx346_cur."!cursor_debug"("FAIL", "backslash:sym<w>")
  debug_342:
    .return (rx346_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<w>"  :subid("100_1283874333.85778") :method
.annotate 'line', 3
    new $P348, "ResizablePMCArray"
    push $P348, "N"
    push $P348, "W"
    push $P348, "S"
    push $P348, "D"
    push $P348, "n"
    push $P348, "w"
    push $P348, "s"
    push $P348, "d"
    .return ($P348)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<b>"  :subid("101_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx352_tgt
    .local int rx352_pos
    .local int rx352_off
    .local int rx352_eos
    .local int rx352_rep
    .local pmc rx352_cur
    .local pmc rx352_debug
    (rx352_cur, rx352_pos, rx352_tgt, $I10) = self."!cursor_start"()
    getattribute rx352_debug, rx352_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx352_cur
    .local pmc match
    .lex "$/", match
    length rx352_eos, rx352_tgt
    gt rx352_pos, rx352_eos, rx352_done
    set rx352_off, 0
    lt rx352_pos, 2, rx352_start
    sub rx352_off, rx352_pos, 1
    substr rx352_tgt, rx352_tgt, rx352_off
  rx352_start:
    eq $I10, 1, rx352_restart
    if_null rx352_debug, debug_343
    rx352_cur."!cursor_debug"("START", "backslash:sym<b>")
  debug_343:
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
.annotate 'line', 134
  # rx subcapture "sym"
    set_addr $I10, rxcap_356_fail
    rx352_cur."!mark_push"(0, rx352_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx352_pos, rx352_eos, rx352_fail
    sub $I10, rx352_pos, rx352_off
    substr $S10, rx352_tgt, $I10, 1
    index $I11, "bB", $S10
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
    rx352_cur."!cursor_pass"(rx352_pos, "backslash:sym<b>")
    if_null rx352_debug, debug_344
    rx352_cur."!cursor_debug"("PASS", "backslash:sym<b>", " at pos=", rx352_pos)
  debug_344:
    .return (rx352_cur)
  rx352_restart:
.annotate 'line', 3
    if_null rx352_debug, debug_345
    rx352_cur."!cursor_debug"("NEXT", "backslash:sym<b>")
  debug_345:
  rx352_fail:
    (rx352_rep, rx352_pos, $I10, $P10) = rx352_cur."!mark_fail"(0)
    lt rx352_pos, -1, rx352_done
    eq rx352_pos, -1, rx352_fail
    jump $I10
  rx352_done:
    rx352_cur."!cursor_fail"()
    if_null rx352_debug, debug_346
    rx352_cur."!cursor_debug"("FAIL", "backslash:sym<b>")
  debug_346:
    .return (rx352_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<b>"  :subid("102_1283874333.85778") :method
.annotate 'line', 3
    new $P354, "ResizablePMCArray"
    push $P354, "B"
    push $P354, "b"
    .return ($P354)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<e>"  :subid("103_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx358_tgt
    .local int rx358_pos
    .local int rx358_off
    .local int rx358_eos
    .local int rx358_rep
    .local pmc rx358_cur
    .local pmc rx358_debug
    (rx358_cur, rx358_pos, rx358_tgt, $I10) = self."!cursor_start"()
    getattribute rx358_debug, rx358_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx358_cur
    .local pmc match
    .lex "$/", match
    length rx358_eos, rx358_tgt
    gt rx358_pos, rx358_eos, rx358_done
    set rx358_off, 0
    lt rx358_pos, 2, rx358_start
    sub rx358_off, rx358_pos, 1
    substr rx358_tgt, rx358_tgt, rx358_off
  rx358_start:
    eq $I10, 1, rx358_restart
    if_null rx358_debug, debug_347
    rx358_cur."!cursor_debug"("START", "backslash:sym<e>")
  debug_347:
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
.annotate 'line', 135
  # rx subcapture "sym"
    set_addr $I10, rxcap_362_fail
    rx358_cur."!mark_push"(0, rx358_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx358_pos, rx358_eos, rx358_fail
    sub $I10, rx358_pos, rx358_off
    substr $S10, rx358_tgt, $I10, 1
    index $I11, "eE", $S10
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
    rx358_cur."!cursor_pass"(rx358_pos, "backslash:sym<e>")
    if_null rx358_debug, debug_348
    rx358_cur."!cursor_debug"("PASS", "backslash:sym<e>", " at pos=", rx358_pos)
  debug_348:
    .return (rx358_cur)
  rx358_restart:
.annotate 'line', 3
    if_null rx358_debug, debug_349
    rx358_cur."!cursor_debug"("NEXT", "backslash:sym<e>")
  debug_349:
  rx358_fail:
    (rx358_rep, rx358_pos, $I10, $P10) = rx358_cur."!mark_fail"(0)
    lt rx358_pos, -1, rx358_done
    eq rx358_pos, -1, rx358_fail
    jump $I10
  rx358_done:
    rx358_cur."!cursor_fail"()
    if_null rx358_debug, debug_350
    rx358_cur."!cursor_debug"("FAIL", "backslash:sym<e>")
  debug_350:
    .return (rx358_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<e>"  :subid("104_1283874333.85778") :method
.annotate 'line', 3
    new $P360, "ResizablePMCArray"
    push $P360, "E"
    push $P360, "e"
    .return ($P360)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<f>"  :subid("105_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx364_tgt
    .local int rx364_pos
    .local int rx364_off
    .local int rx364_eos
    .local int rx364_rep
    .local pmc rx364_cur
    .local pmc rx364_debug
    (rx364_cur, rx364_pos, rx364_tgt, $I10) = self."!cursor_start"()
    getattribute rx364_debug, rx364_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx364_cur
    .local pmc match
    .lex "$/", match
    length rx364_eos, rx364_tgt
    gt rx364_pos, rx364_eos, rx364_done
    set rx364_off, 0
    lt rx364_pos, 2, rx364_start
    sub rx364_off, rx364_pos, 1
    substr rx364_tgt, rx364_tgt, rx364_off
  rx364_start:
    eq $I10, 1, rx364_restart
    if_null rx364_debug, debug_351
    rx364_cur."!cursor_debug"("START", "backslash:sym<f>")
  debug_351:
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
.annotate 'line', 136
  # rx subcapture "sym"
    set_addr $I10, rxcap_368_fail
    rx364_cur."!mark_push"(0, rx364_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx364_pos, rx364_eos, rx364_fail
    sub $I10, rx364_pos, rx364_off
    substr $S10, rx364_tgt, $I10, 1
    index $I11, "fF", $S10
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
    rx364_cur."!cursor_pass"(rx364_pos, "backslash:sym<f>")
    if_null rx364_debug, debug_352
    rx364_cur."!cursor_debug"("PASS", "backslash:sym<f>", " at pos=", rx364_pos)
  debug_352:
    .return (rx364_cur)
  rx364_restart:
.annotate 'line', 3
    if_null rx364_debug, debug_353
    rx364_cur."!cursor_debug"("NEXT", "backslash:sym<f>")
  debug_353:
  rx364_fail:
    (rx364_rep, rx364_pos, $I10, $P10) = rx364_cur."!mark_fail"(0)
    lt rx364_pos, -1, rx364_done
    eq rx364_pos, -1, rx364_fail
    jump $I10
  rx364_done:
    rx364_cur."!cursor_fail"()
    if_null rx364_debug, debug_354
    rx364_cur."!cursor_debug"("FAIL", "backslash:sym<f>")
  debug_354:
    .return (rx364_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<f>"  :subid("106_1283874333.85778") :method
.annotate 'line', 3
    new $P366, "ResizablePMCArray"
    push $P366, "F"
    push $P366, "f"
    .return ($P366)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<h>"  :subid("107_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx370_tgt
    .local int rx370_pos
    .local int rx370_off
    .local int rx370_eos
    .local int rx370_rep
    .local pmc rx370_cur
    .local pmc rx370_debug
    (rx370_cur, rx370_pos, rx370_tgt, $I10) = self."!cursor_start"()
    getattribute rx370_debug, rx370_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx370_cur
    .local pmc match
    .lex "$/", match
    length rx370_eos, rx370_tgt
    gt rx370_pos, rx370_eos, rx370_done
    set rx370_off, 0
    lt rx370_pos, 2, rx370_start
    sub rx370_off, rx370_pos, 1
    substr rx370_tgt, rx370_tgt, rx370_off
  rx370_start:
    eq $I10, 1, rx370_restart
    if_null rx370_debug, debug_355
    rx370_cur."!cursor_debug"("START", "backslash:sym<h>")
  debug_355:
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
.annotate 'line', 137
  # rx subcapture "sym"
    set_addr $I10, rxcap_374_fail
    rx370_cur."!mark_push"(0, rx370_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx370_pos, rx370_eos, rx370_fail
    sub $I10, rx370_pos, rx370_off
    substr $S10, rx370_tgt, $I10, 1
    index $I11, "hH", $S10
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
    rx370_cur."!cursor_pass"(rx370_pos, "backslash:sym<h>")
    if_null rx370_debug, debug_356
    rx370_cur."!cursor_debug"("PASS", "backslash:sym<h>", " at pos=", rx370_pos)
  debug_356:
    .return (rx370_cur)
  rx370_restart:
.annotate 'line', 3
    if_null rx370_debug, debug_357
    rx370_cur."!cursor_debug"("NEXT", "backslash:sym<h>")
  debug_357:
  rx370_fail:
    (rx370_rep, rx370_pos, $I10, $P10) = rx370_cur."!mark_fail"(0)
    lt rx370_pos, -1, rx370_done
    eq rx370_pos, -1, rx370_fail
    jump $I10
  rx370_done:
    rx370_cur."!cursor_fail"()
    if_null rx370_debug, debug_358
    rx370_cur."!cursor_debug"("FAIL", "backslash:sym<h>")
  debug_358:
    .return (rx370_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<h>"  :subid("108_1283874333.85778") :method
.annotate 'line', 3
    new $P372, "ResizablePMCArray"
    push $P372, "H"
    push $P372, "h"
    .return ($P372)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<r>"  :subid("109_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx376_tgt
    .local int rx376_pos
    .local int rx376_off
    .local int rx376_eos
    .local int rx376_rep
    .local pmc rx376_cur
    .local pmc rx376_debug
    (rx376_cur, rx376_pos, rx376_tgt, $I10) = self."!cursor_start"()
    getattribute rx376_debug, rx376_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx376_cur
    .local pmc match
    .lex "$/", match
    length rx376_eos, rx376_tgt
    gt rx376_pos, rx376_eos, rx376_done
    set rx376_off, 0
    lt rx376_pos, 2, rx376_start
    sub rx376_off, rx376_pos, 1
    substr rx376_tgt, rx376_tgt, rx376_off
  rx376_start:
    eq $I10, 1, rx376_restart
    if_null rx376_debug, debug_359
    rx376_cur."!cursor_debug"("START", "backslash:sym<r>")
  debug_359:
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
.annotate 'line', 138
  # rx subcapture "sym"
    set_addr $I10, rxcap_380_fail
    rx376_cur."!mark_push"(0, rx376_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx376_pos, rx376_eos, rx376_fail
    sub $I10, rx376_pos, rx376_off
    substr $S10, rx376_tgt, $I10, 1
    index $I11, "rR", $S10
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
    rx376_cur."!cursor_pass"(rx376_pos, "backslash:sym<r>")
    if_null rx376_debug, debug_360
    rx376_cur."!cursor_debug"("PASS", "backslash:sym<r>", " at pos=", rx376_pos)
  debug_360:
    .return (rx376_cur)
  rx376_restart:
.annotate 'line', 3
    if_null rx376_debug, debug_361
    rx376_cur."!cursor_debug"("NEXT", "backslash:sym<r>")
  debug_361:
  rx376_fail:
    (rx376_rep, rx376_pos, $I10, $P10) = rx376_cur."!mark_fail"(0)
    lt rx376_pos, -1, rx376_done
    eq rx376_pos, -1, rx376_fail
    jump $I10
  rx376_done:
    rx376_cur."!cursor_fail"()
    if_null rx376_debug, debug_362
    rx376_cur."!cursor_debug"("FAIL", "backslash:sym<r>")
  debug_362:
    .return (rx376_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<r>"  :subid("110_1283874333.85778") :method
.annotate 'line', 3
    new $P378, "ResizablePMCArray"
    push $P378, "R"
    push $P378, "r"
    .return ($P378)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<t>"  :subid("111_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx382_tgt
    .local int rx382_pos
    .local int rx382_off
    .local int rx382_eos
    .local int rx382_rep
    .local pmc rx382_cur
    .local pmc rx382_debug
    (rx382_cur, rx382_pos, rx382_tgt, $I10) = self."!cursor_start"()
    getattribute rx382_debug, rx382_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx382_cur
    .local pmc match
    .lex "$/", match
    length rx382_eos, rx382_tgt
    gt rx382_pos, rx382_eos, rx382_done
    set rx382_off, 0
    lt rx382_pos, 2, rx382_start
    sub rx382_off, rx382_pos, 1
    substr rx382_tgt, rx382_tgt, rx382_off
  rx382_start:
    eq $I10, 1, rx382_restart
    if_null rx382_debug, debug_363
    rx382_cur."!cursor_debug"("START", "backslash:sym<t>")
  debug_363:
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
.annotate 'line', 139
  # rx subcapture "sym"
    set_addr $I10, rxcap_386_fail
    rx382_cur."!mark_push"(0, rx382_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx382_pos, rx382_eos, rx382_fail
    sub $I10, rx382_pos, rx382_off
    substr $S10, rx382_tgt, $I10, 1
    index $I11, "tT", $S10
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
    rx382_cur."!cursor_pass"(rx382_pos, "backslash:sym<t>")
    if_null rx382_debug, debug_364
    rx382_cur."!cursor_debug"("PASS", "backslash:sym<t>", " at pos=", rx382_pos)
  debug_364:
    .return (rx382_cur)
  rx382_restart:
.annotate 'line', 3
    if_null rx382_debug, debug_365
    rx382_cur."!cursor_debug"("NEXT", "backslash:sym<t>")
  debug_365:
  rx382_fail:
    (rx382_rep, rx382_pos, $I10, $P10) = rx382_cur."!mark_fail"(0)
    lt rx382_pos, -1, rx382_done
    eq rx382_pos, -1, rx382_fail
    jump $I10
  rx382_done:
    rx382_cur."!cursor_fail"()
    if_null rx382_debug, debug_366
    rx382_cur."!cursor_debug"("FAIL", "backslash:sym<t>")
  debug_366:
    .return (rx382_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<t>"  :subid("112_1283874333.85778") :method
.annotate 'line', 3
    new $P384, "ResizablePMCArray"
    push $P384, "T"
    push $P384, "t"
    .return ($P384)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<v>"  :subid("113_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx388_tgt
    .local int rx388_pos
    .local int rx388_off
    .local int rx388_eos
    .local int rx388_rep
    .local pmc rx388_cur
    .local pmc rx388_debug
    (rx388_cur, rx388_pos, rx388_tgt, $I10) = self."!cursor_start"()
    getattribute rx388_debug, rx388_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx388_cur
    .local pmc match
    .lex "$/", match
    length rx388_eos, rx388_tgt
    gt rx388_pos, rx388_eos, rx388_done
    set rx388_off, 0
    lt rx388_pos, 2, rx388_start
    sub rx388_off, rx388_pos, 1
    substr rx388_tgt, rx388_tgt, rx388_off
  rx388_start:
    eq $I10, 1, rx388_restart
    if_null rx388_debug, debug_367
    rx388_cur."!cursor_debug"("START", "backslash:sym<v>")
  debug_367:
    $I10 = self.'from'()
    ne $I10, -1, rxscan391_done
    goto rxscan391_scan
  rxscan391_loop:
    ($P10) = rx388_cur."from"()
    inc $P10
    set rx388_pos, $P10
    ge rx388_pos, rx388_eos, rxscan391_done
  rxscan391_scan:
    set_addr $I10, rxscan391_loop
    rx388_cur."!mark_push"(0, rx388_pos, $I10)
  rxscan391_done:
.annotate 'line', 140
  # rx subcapture "sym"
    set_addr $I10, rxcap_392_fail
    rx388_cur."!mark_push"(0, rx388_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx388_pos, rx388_eos, rx388_fail
    sub $I10, rx388_pos, rx388_off
    substr $S10, rx388_tgt, $I10, 1
    index $I11, "vV", $S10
    lt $I11, 0, rx388_fail
    inc rx388_pos
    set_addr $I10, rxcap_392_fail
    ($I12, $I11) = rx388_cur."!mark_peek"($I10)
    rx388_cur."!cursor_pos"($I11)
    ($P10) = rx388_cur."!cursor_start"()
    $P10."!cursor_pass"(rx388_pos, "")
    rx388_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_392_done
  rxcap_392_fail:
    goto rx388_fail
  rxcap_392_done:
  # rx pass
    rx388_cur."!cursor_pass"(rx388_pos, "backslash:sym<v>")
    if_null rx388_debug, debug_368
    rx388_cur."!cursor_debug"("PASS", "backslash:sym<v>", " at pos=", rx388_pos)
  debug_368:
    .return (rx388_cur)
  rx388_restart:
.annotate 'line', 3
    if_null rx388_debug, debug_369
    rx388_cur."!cursor_debug"("NEXT", "backslash:sym<v>")
  debug_369:
  rx388_fail:
    (rx388_rep, rx388_pos, $I10, $P10) = rx388_cur."!mark_fail"(0)
    lt rx388_pos, -1, rx388_done
    eq rx388_pos, -1, rx388_fail
    jump $I10
  rx388_done:
    rx388_cur."!cursor_fail"()
    if_null rx388_debug, debug_370
    rx388_cur."!cursor_debug"("FAIL", "backslash:sym<v>")
  debug_370:
    .return (rx388_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<v>"  :subid("114_1283874333.85778") :method
.annotate 'line', 3
    new $P390, "ResizablePMCArray"
    push $P390, "V"
    push $P390, "v"
    .return ($P390)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<o>"  :subid("115_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx394_tgt
    .local int rx394_pos
    .local int rx394_off
    .local int rx394_eos
    .local int rx394_rep
    .local pmc rx394_cur
    .local pmc rx394_debug
    (rx394_cur, rx394_pos, rx394_tgt, $I10) = self."!cursor_start"()
    getattribute rx394_debug, rx394_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx394_cur
    .local pmc match
    .lex "$/", match
    length rx394_eos, rx394_tgt
    gt rx394_pos, rx394_eos, rx394_done
    set rx394_off, 0
    lt rx394_pos, 2, rx394_start
    sub rx394_off, rx394_pos, 1
    substr rx394_tgt, rx394_tgt, rx394_off
  rx394_start:
    eq $I10, 1, rx394_restart
    if_null rx394_debug, debug_371
    rx394_cur."!cursor_debug"("START", "backslash:sym<o>")
  debug_371:
    $I10 = self.'from'()
    ne $I10, -1, rxscan401_done
    goto rxscan401_scan
  rxscan401_loop:
    ($P10) = rx394_cur."from"()
    inc $P10
    set rx394_pos, $P10
    ge rx394_pos, rx394_eos, rxscan401_done
  rxscan401_scan:
    set_addr $I10, rxscan401_loop
    rx394_cur."!mark_push"(0, rx394_pos, $I10)
  rxscan401_done:
.annotate 'line', 141
  # rx subcapture "sym"
    set_addr $I10, rxcap_402_fail
    rx394_cur."!mark_push"(0, rx394_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx394_pos, rx394_eos, rx394_fail
    sub $I10, rx394_pos, rx394_off
    substr $S10, rx394_tgt, $I10, 1
    index $I11, "oO", $S10
    lt $I11, 0, rx394_fail
    inc rx394_pos
    set_addr $I10, rxcap_402_fail
    ($I12, $I11) = rx394_cur."!mark_peek"($I10)
    rx394_cur."!cursor_pos"($I11)
    ($P10) = rx394_cur."!cursor_start"()
    $P10."!cursor_pass"(rx394_pos, "")
    rx394_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_402_done
  rxcap_402_fail:
    goto rx394_fail
  rxcap_402_done:
  alt403_0:
    set_addr $I10, alt403_1
    rx394_cur."!mark_push"(0, rx394_pos, $I10)
  # rx subrule "octint" subtype=capture negate=
    rx394_cur."!cursor_pos"(rx394_pos)
    $P10 = rx394_cur."octint"()
    unless $P10, rx394_fail
    rx394_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octint")
    rx394_pos = $P10."pos"()
    goto alt403_end
  alt403_1:
  # rx literal  "["
    add $I11, rx394_pos, 1
    gt $I11, rx394_eos, rx394_fail
    sub $I11, rx394_pos, rx394_off
    ord $I11, rx394_tgt, $I11
    ne $I11, 91, rx394_fail
    add rx394_pos, 1
  # rx subrule "octints" subtype=capture negate=
    rx394_cur."!cursor_pos"(rx394_pos)
    $P10 = rx394_cur."octints"()
    unless $P10, rx394_fail
    rx394_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octints")
    rx394_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx394_pos, 1
    gt $I11, rx394_eos, rx394_fail
    sub $I11, rx394_pos, rx394_off
    ord $I11, rx394_tgt, $I11
    ne $I11, 93, rx394_fail
    add rx394_pos, 1
  alt403_end:
  # rx pass
    rx394_cur."!cursor_pass"(rx394_pos, "backslash:sym<o>")
    if_null rx394_debug, debug_372
    rx394_cur."!cursor_debug"("PASS", "backslash:sym<o>", " at pos=", rx394_pos)
  debug_372:
    .return (rx394_cur)
  rx394_restart:
.annotate 'line', 3
    if_null rx394_debug, debug_373
    rx394_cur."!cursor_debug"("NEXT", "backslash:sym<o>")
  debug_373:
  rx394_fail:
    (rx394_rep, rx394_pos, $I10, $P10) = rx394_cur."!mark_fail"(0)
    lt rx394_pos, -1, rx394_done
    eq rx394_pos, -1, rx394_fail
    jump $I10
  rx394_done:
    rx394_cur."!cursor_fail"()
    if_null rx394_debug, debug_374
    rx394_cur."!cursor_debug"("FAIL", "backslash:sym<o>")
  debug_374:
    .return (rx394_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<o>"  :subid("116_1283874333.85778") :method
.annotate 'line', 3
    $P396 = self."!PREFIX__!subrule"("octints", "O[")
    $P397 = self."!PREFIX__!subrule"("octint", "O")
    $P398 = self."!PREFIX__!subrule"("octints", "o[")
    $P399 = self."!PREFIX__!subrule"("octint", "o")
    new $P400, "ResizablePMCArray"
    push $P400, $P396
    push $P400, $P397
    push $P400, $P398
    push $P400, $P399
    .return ($P400)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<x>"  :subid("117_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx405_tgt
    .local int rx405_pos
    .local int rx405_off
    .local int rx405_eos
    .local int rx405_rep
    .local pmc rx405_cur
    .local pmc rx405_debug
    (rx405_cur, rx405_pos, rx405_tgt, $I10) = self."!cursor_start"()
    getattribute rx405_debug, rx405_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx405_cur
    .local pmc match
    .lex "$/", match
    length rx405_eos, rx405_tgt
    gt rx405_pos, rx405_eos, rx405_done
    set rx405_off, 0
    lt rx405_pos, 2, rx405_start
    sub rx405_off, rx405_pos, 1
    substr rx405_tgt, rx405_tgt, rx405_off
  rx405_start:
    eq $I10, 1, rx405_restart
    if_null rx405_debug, debug_375
    rx405_cur."!cursor_debug"("START", "backslash:sym<x>")
  debug_375:
    $I10 = self.'from'()
    ne $I10, -1, rxscan412_done
    goto rxscan412_scan
  rxscan412_loop:
    ($P10) = rx405_cur."from"()
    inc $P10
    set rx405_pos, $P10
    ge rx405_pos, rx405_eos, rxscan412_done
  rxscan412_scan:
    set_addr $I10, rxscan412_loop
    rx405_cur."!mark_push"(0, rx405_pos, $I10)
  rxscan412_done:
.annotate 'line', 142
  # rx subcapture "sym"
    set_addr $I10, rxcap_413_fail
    rx405_cur."!mark_push"(0, rx405_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx405_pos, rx405_eos, rx405_fail
    sub $I10, rx405_pos, rx405_off
    substr $S10, rx405_tgt, $I10, 1
    index $I11, "xX", $S10
    lt $I11, 0, rx405_fail
    inc rx405_pos
    set_addr $I10, rxcap_413_fail
    ($I12, $I11) = rx405_cur."!mark_peek"($I10)
    rx405_cur."!cursor_pos"($I11)
    ($P10) = rx405_cur."!cursor_start"()
    $P10."!cursor_pass"(rx405_pos, "")
    rx405_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_413_done
  rxcap_413_fail:
    goto rx405_fail
  rxcap_413_done:
  alt414_0:
    set_addr $I10, alt414_1
    rx405_cur."!mark_push"(0, rx405_pos, $I10)
  # rx subrule "hexint" subtype=capture negate=
    rx405_cur."!cursor_pos"(rx405_pos)
    $P10 = rx405_cur."hexint"()
    unless $P10, rx405_fail
    rx405_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexint")
    rx405_pos = $P10."pos"()
    goto alt414_end
  alt414_1:
  # rx literal  "["
    add $I11, rx405_pos, 1
    gt $I11, rx405_eos, rx405_fail
    sub $I11, rx405_pos, rx405_off
    ord $I11, rx405_tgt, $I11
    ne $I11, 91, rx405_fail
    add rx405_pos, 1
  # rx subrule "hexints" subtype=capture negate=
    rx405_cur."!cursor_pos"(rx405_pos)
    $P10 = rx405_cur."hexints"()
    unless $P10, rx405_fail
    rx405_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexints")
    rx405_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx405_pos, 1
    gt $I11, rx405_eos, rx405_fail
    sub $I11, rx405_pos, rx405_off
    ord $I11, rx405_tgt, $I11
    ne $I11, 93, rx405_fail
    add rx405_pos, 1
  alt414_end:
  # rx pass
    rx405_cur."!cursor_pass"(rx405_pos, "backslash:sym<x>")
    if_null rx405_debug, debug_376
    rx405_cur."!cursor_debug"("PASS", "backslash:sym<x>", " at pos=", rx405_pos)
  debug_376:
    .return (rx405_cur)
  rx405_restart:
.annotate 'line', 3
    if_null rx405_debug, debug_377
    rx405_cur."!cursor_debug"("NEXT", "backslash:sym<x>")
  debug_377:
  rx405_fail:
    (rx405_rep, rx405_pos, $I10, $P10) = rx405_cur."!mark_fail"(0)
    lt rx405_pos, -1, rx405_done
    eq rx405_pos, -1, rx405_fail
    jump $I10
  rx405_done:
    rx405_cur."!cursor_fail"()
    if_null rx405_debug, debug_378
    rx405_cur."!cursor_debug"("FAIL", "backslash:sym<x>")
  debug_378:
    .return (rx405_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<x>"  :subid("118_1283874333.85778") :method
.annotate 'line', 3
    $P407 = self."!PREFIX__!subrule"("hexints", "X[")
    $P408 = self."!PREFIX__!subrule"("hexint", "X")
    $P409 = self."!PREFIX__!subrule"("hexints", "x[")
    $P410 = self."!PREFIX__!subrule"("hexint", "x")
    new $P411, "ResizablePMCArray"
    push $P411, $P407
    push $P411, $P408
    push $P411, $P409
    push $P411, $P410
    .return ($P411)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<c>"  :subid("119_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx416_tgt
    .local int rx416_pos
    .local int rx416_off
    .local int rx416_eos
    .local int rx416_rep
    .local pmc rx416_cur
    .local pmc rx416_debug
    (rx416_cur, rx416_pos, rx416_tgt, $I10) = self."!cursor_start"()
    getattribute rx416_debug, rx416_cur, "$!debug"
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
    if_null rx416_debug, debug_379
    rx416_cur."!cursor_debug"("START", "backslash:sym<c>")
  debug_379:
    $I10 = self.'from'()
    ne $I10, -1, rxscan421_done
    goto rxscan421_scan
  rxscan421_loop:
    ($P10) = rx416_cur."from"()
    inc $P10
    set rx416_pos, $P10
    ge rx416_pos, rx416_eos, rxscan421_done
  rxscan421_scan:
    set_addr $I10, rxscan421_loop
    rx416_cur."!mark_push"(0, rx416_pos, $I10)
  rxscan421_done:
.annotate 'line', 143
  # rx subcapture "sym"
    set_addr $I10, rxcap_422_fail
    rx416_cur."!mark_push"(0, rx416_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx416_pos, rx416_eos, rx416_fail
    sub $I10, rx416_pos, rx416_off
    substr $S10, rx416_tgt, $I10, 1
    index $I11, "cC", $S10
    lt $I11, 0, rx416_fail
    inc rx416_pos
    set_addr $I10, rxcap_422_fail
    ($I12, $I11) = rx416_cur."!mark_peek"($I10)
    rx416_cur."!cursor_pos"($I11)
    ($P10) = rx416_cur."!cursor_start"()
    $P10."!cursor_pass"(rx416_pos, "")
    rx416_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_422_done
  rxcap_422_fail:
    goto rx416_fail
  rxcap_422_done:
  # rx subrule "charspec" subtype=capture negate=
    rx416_cur."!cursor_pos"(rx416_pos)
    $P10 = rx416_cur."charspec"()
    unless $P10, rx416_fail
    rx416_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charspec")
    rx416_pos = $P10."pos"()
  # rx pass
    rx416_cur."!cursor_pass"(rx416_pos, "backslash:sym<c>")
    if_null rx416_debug, debug_380
    rx416_cur."!cursor_debug"("PASS", "backslash:sym<c>", " at pos=", rx416_pos)
  debug_380:
    .return (rx416_cur)
  rx416_restart:
.annotate 'line', 3
    if_null rx416_debug, debug_381
    rx416_cur."!cursor_debug"("NEXT", "backslash:sym<c>")
  debug_381:
  rx416_fail:
    (rx416_rep, rx416_pos, $I10, $P10) = rx416_cur."!mark_fail"(0)
    lt rx416_pos, -1, rx416_done
    eq rx416_pos, -1, rx416_fail
    jump $I10
  rx416_done:
    rx416_cur."!cursor_fail"()
    if_null rx416_debug, debug_382
    rx416_cur."!cursor_debug"("FAIL", "backslash:sym<c>")
  debug_382:
    .return (rx416_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<c>"  :subid("120_1283874333.85778") :method
.annotate 'line', 3
    $P418 = self."!PREFIX__!subrule"("charspec", "C")
    $P419 = self."!PREFIX__!subrule"("charspec", "c")
    new $P420, "ResizablePMCArray"
    push $P420, $P418
    push $P420, $P419
    .return ($P420)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<A>"  :subid("121_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx424_tgt
    .local int rx424_pos
    .local int rx424_off
    .local int rx424_eos
    .local int rx424_rep
    .local pmc rx424_cur
    .local pmc rx424_debug
    (rx424_cur, rx424_pos, rx424_tgt, $I10) = self."!cursor_start"()
    getattribute rx424_debug, rx424_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx424_cur
    .local pmc match
    .lex "$/", match
    length rx424_eos, rx424_tgt
    gt rx424_pos, rx424_eos, rx424_done
    set rx424_off, 0
    lt rx424_pos, 2, rx424_start
    sub rx424_off, rx424_pos, 1
    substr rx424_tgt, rx424_tgt, rx424_off
  rx424_start:
    eq $I10, 1, rx424_restart
    if_null rx424_debug, debug_383
    rx424_cur."!cursor_debug"("START", "backslash:sym<A>")
  debug_383:
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
.annotate 'line', 144
  # rx literal  "A"
    add $I11, rx424_pos, 1
    gt $I11, rx424_eos, rx424_fail
    sub $I11, rx424_pos, rx424_off
    ord $I11, rx424_tgt, $I11
    ne $I11, 65, rx424_fail
    add rx424_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx424_cur."!cursor_pos"(rx424_pos)
    $P10 = rx424_cur."obs"("\\A as beginning-of-string matcher", "^")
    unless $P10, rx424_fail
    rx424_pos = $P10."pos"()
  # rx pass
    rx424_cur."!cursor_pass"(rx424_pos, "backslash:sym<A>")
    if_null rx424_debug, debug_384
    rx424_cur."!cursor_debug"("PASS", "backslash:sym<A>", " at pos=", rx424_pos)
  debug_384:
    .return (rx424_cur)
  rx424_restart:
.annotate 'line', 3
    if_null rx424_debug, debug_385
    rx424_cur."!cursor_debug"("NEXT", "backslash:sym<A>")
  debug_385:
  rx424_fail:
    (rx424_rep, rx424_pos, $I10, $P10) = rx424_cur."!mark_fail"(0)
    lt rx424_pos, -1, rx424_done
    eq rx424_pos, -1, rx424_fail
    jump $I10
  rx424_done:
    rx424_cur."!cursor_fail"()
    if_null rx424_debug, debug_386
    rx424_cur."!cursor_debug"("FAIL", "backslash:sym<A>")
  debug_386:
    .return (rx424_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<A>"  :subid("122_1283874333.85778") :method
.annotate 'line', 3
    $P426 = self."!PREFIX__!subrule"("obs", "A")
    new $P427, "ResizablePMCArray"
    push $P427, $P426
    .return ($P427)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<z>"  :subid("123_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx430_tgt
    .local int rx430_pos
    .local int rx430_off
    .local int rx430_eos
    .local int rx430_rep
    .local pmc rx430_cur
    .local pmc rx430_debug
    (rx430_cur, rx430_pos, rx430_tgt, $I10) = self."!cursor_start"()
    getattribute rx430_debug, rx430_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx430_cur
    .local pmc match
    .lex "$/", match
    length rx430_eos, rx430_tgt
    gt rx430_pos, rx430_eos, rx430_done
    set rx430_off, 0
    lt rx430_pos, 2, rx430_start
    sub rx430_off, rx430_pos, 1
    substr rx430_tgt, rx430_tgt, rx430_off
  rx430_start:
    eq $I10, 1, rx430_restart
    if_null rx430_debug, debug_387
    rx430_cur."!cursor_debug"("START", "backslash:sym<z>")
  debug_387:
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
.annotate 'line', 145
  # rx literal  "z"
    add $I11, rx430_pos, 1
    gt $I11, rx430_eos, rx430_fail
    sub $I11, rx430_pos, rx430_off
    ord $I11, rx430_tgt, $I11
    ne $I11, 122, rx430_fail
    add rx430_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx430_cur."!cursor_pos"(rx430_pos)
    $P10 = rx430_cur."obs"("\\z as end-of-string matcher", "$")
    unless $P10, rx430_fail
    rx430_pos = $P10."pos"()
  # rx pass
    rx430_cur."!cursor_pass"(rx430_pos, "backslash:sym<z>")
    if_null rx430_debug, debug_388
    rx430_cur."!cursor_debug"("PASS", "backslash:sym<z>", " at pos=", rx430_pos)
  debug_388:
    .return (rx430_cur)
  rx430_restart:
.annotate 'line', 3
    if_null rx430_debug, debug_389
    rx430_cur."!cursor_debug"("NEXT", "backslash:sym<z>")
  debug_389:
  rx430_fail:
    (rx430_rep, rx430_pos, $I10, $P10) = rx430_cur."!mark_fail"(0)
    lt rx430_pos, -1, rx430_done
    eq rx430_pos, -1, rx430_fail
    jump $I10
  rx430_done:
    rx430_cur."!cursor_fail"()
    if_null rx430_debug, debug_390
    rx430_cur."!cursor_debug"("FAIL", "backslash:sym<z>")
  debug_390:
    .return (rx430_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<z>"  :subid("124_1283874333.85778") :method
.annotate 'line', 3
    $P432 = self."!PREFIX__!subrule"("obs", "z")
    new $P433, "ResizablePMCArray"
    push $P433, $P432
    .return ($P433)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Z>"  :subid("125_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx436_tgt
    .local int rx436_pos
    .local int rx436_off
    .local int rx436_eos
    .local int rx436_rep
    .local pmc rx436_cur
    .local pmc rx436_debug
    (rx436_cur, rx436_pos, rx436_tgt, $I10) = self."!cursor_start"()
    getattribute rx436_debug, rx436_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx436_cur
    .local pmc match
    .lex "$/", match
    length rx436_eos, rx436_tgt
    gt rx436_pos, rx436_eos, rx436_done
    set rx436_off, 0
    lt rx436_pos, 2, rx436_start
    sub rx436_off, rx436_pos, 1
    substr rx436_tgt, rx436_tgt, rx436_off
  rx436_start:
    eq $I10, 1, rx436_restart
    if_null rx436_debug, debug_391
    rx436_cur."!cursor_debug"("START", "backslash:sym<Z>")
  debug_391:
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
.annotate 'line', 146
  # rx literal  "Z"
    add $I11, rx436_pos, 1
    gt $I11, rx436_eos, rx436_fail
    sub $I11, rx436_pos, rx436_off
    ord $I11, rx436_tgt, $I11
    ne $I11, 90, rx436_fail
    add rx436_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx436_cur."!cursor_pos"(rx436_pos)
    $P10 = rx436_cur."obs"("\\Z as end-of-string matcher", "\\n?$")
    unless $P10, rx436_fail
    rx436_pos = $P10."pos"()
  # rx pass
    rx436_cur."!cursor_pass"(rx436_pos, "backslash:sym<Z>")
    if_null rx436_debug, debug_392
    rx436_cur."!cursor_debug"("PASS", "backslash:sym<Z>", " at pos=", rx436_pos)
  debug_392:
    .return (rx436_cur)
  rx436_restart:
.annotate 'line', 3
    if_null rx436_debug, debug_393
    rx436_cur."!cursor_debug"("NEXT", "backslash:sym<Z>")
  debug_393:
  rx436_fail:
    (rx436_rep, rx436_pos, $I10, $P10) = rx436_cur."!mark_fail"(0)
    lt rx436_pos, -1, rx436_done
    eq rx436_pos, -1, rx436_fail
    jump $I10
  rx436_done:
    rx436_cur."!cursor_fail"()
    if_null rx436_debug, debug_394
    rx436_cur."!cursor_debug"("FAIL", "backslash:sym<Z>")
  debug_394:
    .return (rx436_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<Z>"  :subid("126_1283874333.85778") :method
.annotate 'line', 3
    $P438 = self."!PREFIX__!subrule"("obs", "Z")
    new $P439, "ResizablePMCArray"
    push $P439, $P438
    .return ($P439)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Q>"  :subid("127_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx442_tgt
    .local int rx442_pos
    .local int rx442_off
    .local int rx442_eos
    .local int rx442_rep
    .local pmc rx442_cur
    .local pmc rx442_debug
    (rx442_cur, rx442_pos, rx442_tgt, $I10) = self."!cursor_start"()
    getattribute rx442_debug, rx442_cur, "$!debug"
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
    if_null rx442_debug, debug_395
    rx442_cur."!cursor_debug"("START", "backslash:sym<Q>")
  debug_395:
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
.annotate 'line', 147
  # rx literal  "Q"
    add $I11, rx442_pos, 1
    gt $I11, rx442_eos, rx442_fail
    sub $I11, rx442_pos, rx442_off
    ord $I11, rx442_tgt, $I11
    ne $I11, 81, rx442_fail
    add rx442_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx442_cur."!cursor_pos"(rx442_pos)
    $P10 = rx442_cur."obs"("\\Q as quotemeta", "quotes or literal variable match")
    unless $P10, rx442_fail
    rx442_pos = $P10."pos"()
  # rx pass
    rx442_cur."!cursor_pass"(rx442_pos, "backslash:sym<Q>")
    if_null rx442_debug, debug_396
    rx442_cur."!cursor_debug"("PASS", "backslash:sym<Q>", " at pos=", rx442_pos)
  debug_396:
    .return (rx442_cur)
  rx442_restart:
.annotate 'line', 3
    if_null rx442_debug, debug_397
    rx442_cur."!cursor_debug"("NEXT", "backslash:sym<Q>")
  debug_397:
  rx442_fail:
    (rx442_rep, rx442_pos, $I10, $P10) = rx442_cur."!mark_fail"(0)
    lt rx442_pos, -1, rx442_done
    eq rx442_pos, -1, rx442_fail
    jump $I10
  rx442_done:
    rx442_cur."!cursor_fail"()
    if_null rx442_debug, debug_398
    rx442_cur."!cursor_debug"("FAIL", "backslash:sym<Q>")
  debug_398:
    .return (rx442_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<Q>"  :subid("128_1283874333.85778") :method
.annotate 'line', 3
    $P444 = self."!PREFIX__!subrule"("obs", "Q")
    new $P445, "ResizablePMCArray"
    push $P445, $P444
    .return ($P445)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<unrec>"  :subid("129_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .const 'Sub' $P455 = "131_1283874333.85778" 
    capture_lex $P455
    .local string rx448_tgt
    .local int rx448_pos
    .local int rx448_off
    .local int rx448_eos
    .local int rx448_rep
    .local pmc rx448_cur
    .local pmc rx448_debug
    (rx448_cur, rx448_pos, rx448_tgt, $I10) = self."!cursor_start"()
    getattribute rx448_debug, rx448_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx448_cur
    .local pmc match
    .lex "$/", match
    length rx448_eos, rx448_tgt
    gt rx448_pos, rx448_eos, rx448_done
    set rx448_off, 0
    lt rx448_pos, 2, rx448_start
    sub rx448_off, rx448_pos, 1
    substr rx448_tgt, rx448_tgt, rx448_off
  rx448_start:
    eq $I10, 1, rx448_restart
    if_null rx448_debug, debug_399
    rx448_cur."!cursor_debug"("START", "backslash:sym<unrec>")
  debug_399:
    $I10 = self.'from'()
    ne $I10, -1, rxscan451_done
    goto rxscan451_scan
  rxscan451_loop:
    ($P10) = rx448_cur."from"()
    inc $P10
    set rx448_pos, $P10
    ge rx448_pos, rx448_eos, rxscan451_done
  rxscan451_scan:
    set_addr $I10, rxscan451_loop
    rx448_cur."!mark_push"(0, rx448_pos, $I10)
  rxscan451_done:
.annotate 'line', 148
    rx448_cur."!cursor_pos"(rx448_pos)
    find_lex $P452, unicode:"$\x{a2}"
    $P453 = $P452."MATCH"()
    store_lex "$/", $P453
    .const 'Sub' $P455 = "131_1283874333.85778" 
    capture_lex $P455
    $P456 = $P455()
  # rx charclass w
    ge rx448_pos, rx448_eos, rx448_fail
    sub $I10, rx448_pos, rx448_off
    is_cclass $I11, 8192, rx448_tgt, $I10
    unless $I11, rx448_fail
    inc rx448_pos
  # rx subrule "panic" subtype=method negate=
    rx448_cur."!cursor_pos"(rx448_pos)
    $P10 = rx448_cur."panic"("Unrecognized backslash sequence")
    unless $P10, rx448_fail
    rx448_pos = $P10."pos"()
  # rx pass
    rx448_cur."!cursor_pass"(rx448_pos, "backslash:sym<unrec>")
    if_null rx448_debug, debug_400
    rx448_cur."!cursor_debug"("PASS", "backslash:sym<unrec>", " at pos=", rx448_pos)
  debug_400:
    .return (rx448_cur)
  rx448_restart:
.annotate 'line', 3
    if_null rx448_debug, debug_401
    rx448_cur."!cursor_debug"("NEXT", "backslash:sym<unrec>")
  debug_401:
  rx448_fail:
    (rx448_rep, rx448_pos, $I10, $P10) = rx448_cur."!mark_fail"(0)
    lt rx448_pos, -1, rx448_done
    eq rx448_pos, -1, rx448_fail
    jump $I10
  rx448_done:
    rx448_cur."!cursor_fail"()
    if_null rx448_debug, debug_402
    rx448_cur."!cursor_debug"("FAIL", "backslash:sym<unrec>")
  debug_402:
    .return (rx448_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<unrec>"  :subid("130_1283874333.85778") :method
.annotate 'line', 3
    new $P450, "ResizablePMCArray"
    push $P450, ""
    .return ($P450)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block454"  :anon :subid("131_1283874333.85778") :outer("129_1283874333.85778")
.annotate 'line', 148
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<misc>"  :subid("132_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx458_tgt
    .local int rx458_pos
    .local int rx458_off
    .local int rx458_eos
    .local int rx458_rep
    .local pmc rx458_cur
    .local pmc rx458_debug
    (rx458_cur, rx458_pos, rx458_tgt, $I10) = self."!cursor_start"()
    getattribute rx458_debug, rx458_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx458_cur
    .local pmc match
    .lex "$/", match
    length rx458_eos, rx458_tgt
    gt rx458_pos, rx458_eos, rx458_done
    set rx458_off, 0
    lt rx458_pos, 2, rx458_start
    sub rx458_off, rx458_pos, 1
    substr rx458_tgt, rx458_tgt, rx458_off
  rx458_start:
    eq $I10, 1, rx458_restart
    if_null rx458_debug, debug_403
    rx458_cur."!cursor_debug"("START", "backslash:sym<misc>")
  debug_403:
    $I10 = self.'from'()
    ne $I10, -1, rxscan461_done
    goto rxscan461_scan
  rxscan461_loop:
    ($P10) = rx458_cur."from"()
    inc $P10
    set rx458_pos, $P10
    ge rx458_pos, rx458_eos, rxscan461_done
  rxscan461_scan:
    set_addr $I10, rxscan461_loop
    rx458_cur."!mark_push"(0, rx458_pos, $I10)
  rxscan461_done:
.annotate 'line', 149
  # rx charclass W
    ge rx458_pos, rx458_eos, rx458_fail
    sub $I10, rx458_pos, rx458_off
    is_cclass $I11, 8192, rx458_tgt, $I10
    if $I11, rx458_fail
    inc rx458_pos
  # rx pass
    rx458_cur."!cursor_pass"(rx458_pos, "backslash:sym<misc>")
    if_null rx458_debug, debug_404
    rx458_cur."!cursor_debug"("PASS", "backslash:sym<misc>", " at pos=", rx458_pos)
  debug_404:
    .return (rx458_cur)
  rx458_restart:
.annotate 'line', 3
    if_null rx458_debug, debug_405
    rx458_cur."!cursor_debug"("NEXT", "backslash:sym<misc>")
  debug_405:
  rx458_fail:
    (rx458_rep, rx458_pos, $I10, $P10) = rx458_cur."!mark_fail"(0)
    lt rx458_pos, -1, rx458_done
    eq rx458_pos, -1, rx458_fail
    jump $I10
  rx458_done:
    rx458_cur."!cursor_fail"()
    if_null rx458_debug, debug_406
    rx458_cur."!cursor_debug"("FAIL", "backslash:sym<misc>")
  debug_406:
    .return (rx458_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<misc>"  :subid("133_1283874333.85778") :method
.annotate 'line', 3
    new $P460, "ResizablePMCArray"
    push $P460, ""
    .return ($P460)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion"  :subid("134_1283874333.85778") :method
.annotate 'line', 151
    $P463 = self."!protoregex"("assertion")
    .return ($P463)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion"  :subid("135_1283874333.85778") :method
.annotate 'line', 151
    $P465 = self."!PREFIX__!protoregex"("assertion")
    .return ($P465)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<?>"  :subid("136_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .const 'Sub' $P474 = "138_1283874333.85778" 
    capture_lex $P474
    .local string rx467_tgt
    .local int rx467_pos
    .local int rx467_off
    .local int rx467_eos
    .local int rx467_rep
    .local pmc rx467_cur
    .local pmc rx467_debug
    (rx467_cur, rx467_pos, rx467_tgt, $I10) = self."!cursor_start"()
    getattribute rx467_debug, rx467_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx467_cur
    .local pmc match
    .lex "$/", match
    length rx467_eos, rx467_tgt
    gt rx467_pos, rx467_eos, rx467_done
    set rx467_off, 0
    lt rx467_pos, 2, rx467_start
    sub rx467_off, rx467_pos, 1
    substr rx467_tgt, rx467_tgt, rx467_off
  rx467_start:
    eq $I10, 1, rx467_restart
    if_null rx467_debug, debug_407
    rx467_cur."!cursor_debug"("START", "assertion:sym<?>")
  debug_407:
    $I10 = self.'from'()
    ne $I10, -1, rxscan471_done
    goto rxscan471_scan
  rxscan471_loop:
    ($P10) = rx467_cur."from"()
    inc $P10
    set rx467_pos, $P10
    ge rx467_pos, rx467_eos, rxscan471_done
  rxscan471_scan:
    set_addr $I10, rxscan471_loop
    rx467_cur."!mark_push"(0, rx467_pos, $I10)
  rxscan471_done:
.annotate 'line', 153
  # rx literal  "?"
    add $I11, rx467_pos, 1
    gt $I11, rx467_eos, rx467_fail
    sub $I11, rx467_pos, rx467_off
    ord $I11, rx467_tgt, $I11
    ne $I11, 63, rx467_fail
    add rx467_pos, 1
  alt472_0:
    set_addr $I10, alt472_1
    rx467_cur."!mark_push"(0, rx467_pos, $I10)
  # rx subrule "before" subtype=zerowidth negate=
    rx467_cur."!cursor_pos"(rx467_pos)
    .const 'Sub' $P474 = "138_1283874333.85778" 
    capture_lex $P474
    $P10 = rx467_cur."before"($P474)
    unless $P10, rx467_fail
    goto alt472_end
  alt472_1:
  # rx subrule "assertion" subtype=capture negate=
    rx467_cur."!cursor_pos"(rx467_pos)
    $P10 = rx467_cur."assertion"()
    unless $P10, rx467_fail
    rx467_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx467_pos = $P10."pos"()
  alt472_end:
  # rx pass
    rx467_cur."!cursor_pass"(rx467_pos, "assertion:sym<?>")
    if_null rx467_debug, debug_412
    rx467_cur."!cursor_debug"("PASS", "assertion:sym<?>", " at pos=", rx467_pos)
  debug_412:
    .return (rx467_cur)
  rx467_restart:
.annotate 'line', 3
    if_null rx467_debug, debug_413
    rx467_cur."!cursor_debug"("NEXT", "assertion:sym<?>")
  debug_413:
  rx467_fail:
    (rx467_rep, rx467_pos, $I10, $P10) = rx467_cur."!mark_fail"(0)
    lt rx467_pos, -1, rx467_done
    eq rx467_pos, -1, rx467_fail
    jump $I10
  rx467_done:
    rx467_cur."!cursor_fail"()
    if_null rx467_debug, debug_414
    rx467_cur."!cursor_debug"("FAIL", "assertion:sym<?>")
  debug_414:
    .return (rx467_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<?>"  :subid("137_1283874333.85778") :method
.annotate 'line', 3
    $P469 = self."!PREFIX__!subrule"("assertion", "?")
    new $P470, "ResizablePMCArray"
    push $P470, $P469
    push $P470, "?"
    .return ($P470)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block473"  :anon :subid("138_1283874333.85778") :method :outer("136_1283874333.85778")
.annotate 'line', 153
    .local string rx475_tgt
    .local int rx475_pos
    .local int rx475_off
    .local int rx475_eos
    .local int rx475_rep
    .local pmc rx475_cur
    .local pmc rx475_debug
    (rx475_cur, rx475_pos, rx475_tgt, $I10) = self."!cursor_start"()
    getattribute rx475_debug, rx475_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx475_cur
    .local pmc match
    .lex "$/", match
    length rx475_eos, rx475_tgt
    gt rx475_pos, rx475_eos, rx475_done
    set rx475_off, 0
    lt rx475_pos, 2, rx475_start
    sub rx475_off, rx475_pos, 1
    substr rx475_tgt, rx475_tgt, rx475_off
  rx475_start:
    eq $I10, 1, rx475_restart
    if_null rx475_debug, debug_408
    rx475_cur."!cursor_debug"("START", "")
  debug_408:
    $I10 = self.'from'()
    ne $I10, -1, rxscan476_done
    goto rxscan476_scan
  rxscan476_loop:
    ($P10) = rx475_cur."from"()
    inc $P10
    set rx475_pos, $P10
    ge rx475_pos, rx475_eos, rxscan476_done
  rxscan476_scan:
    set_addr $I10, rxscan476_loop
    rx475_cur."!mark_push"(0, rx475_pos, $I10)
  rxscan476_done:
  # rx literal  ">"
    add $I11, rx475_pos, 1
    gt $I11, rx475_eos, rx475_fail
    sub $I11, rx475_pos, rx475_off
    ord $I11, rx475_tgt, $I11
    ne $I11, 62, rx475_fail
    add rx475_pos, 1
  # rx pass
    rx475_cur."!cursor_pass"(rx475_pos, "")
    if_null rx475_debug, debug_409
    rx475_cur."!cursor_debug"("PASS", "", " at pos=", rx475_pos)
  debug_409:
    .return (rx475_cur)
  rx475_restart:
    if_null rx475_debug, debug_410
    rx475_cur."!cursor_debug"("NEXT", "")
  debug_410:
  rx475_fail:
    (rx475_rep, rx475_pos, $I10, $P10) = rx475_cur."!mark_fail"(0)
    lt rx475_pos, -1, rx475_done
    eq rx475_pos, -1, rx475_fail
    jump $I10
  rx475_done:
    rx475_cur."!cursor_fail"()
    if_null rx475_debug, debug_411
    rx475_cur."!cursor_debug"("FAIL", "")
  debug_411:
    .return (rx475_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<!>"  :subid("139_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .const 'Sub' $P485 = "141_1283874333.85778" 
    capture_lex $P485
    .local string rx478_tgt
    .local int rx478_pos
    .local int rx478_off
    .local int rx478_eos
    .local int rx478_rep
    .local pmc rx478_cur
    .local pmc rx478_debug
    (rx478_cur, rx478_pos, rx478_tgt, $I10) = self."!cursor_start"()
    getattribute rx478_debug, rx478_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx478_cur
    .local pmc match
    .lex "$/", match
    length rx478_eos, rx478_tgt
    gt rx478_pos, rx478_eos, rx478_done
    set rx478_off, 0
    lt rx478_pos, 2, rx478_start
    sub rx478_off, rx478_pos, 1
    substr rx478_tgt, rx478_tgt, rx478_off
  rx478_start:
    eq $I10, 1, rx478_restart
    if_null rx478_debug, debug_415
    rx478_cur."!cursor_debug"("START", "assertion:sym<!>")
  debug_415:
    $I10 = self.'from'()
    ne $I10, -1, rxscan482_done
    goto rxscan482_scan
  rxscan482_loop:
    ($P10) = rx478_cur."from"()
    inc $P10
    set rx478_pos, $P10
    ge rx478_pos, rx478_eos, rxscan482_done
  rxscan482_scan:
    set_addr $I10, rxscan482_loop
    rx478_cur."!mark_push"(0, rx478_pos, $I10)
  rxscan482_done:
.annotate 'line', 154
  # rx literal  "!"
    add $I11, rx478_pos, 1
    gt $I11, rx478_eos, rx478_fail
    sub $I11, rx478_pos, rx478_off
    ord $I11, rx478_tgt, $I11
    ne $I11, 33, rx478_fail
    add rx478_pos, 1
  alt483_0:
    set_addr $I10, alt483_1
    rx478_cur."!mark_push"(0, rx478_pos, $I10)
  # rx subrule "before" subtype=zerowidth negate=
    rx478_cur."!cursor_pos"(rx478_pos)
    .const 'Sub' $P485 = "141_1283874333.85778" 
    capture_lex $P485
    $P10 = rx478_cur."before"($P485)
    unless $P10, rx478_fail
    goto alt483_end
  alt483_1:
  # rx subrule "assertion" subtype=capture negate=
    rx478_cur."!cursor_pos"(rx478_pos)
    $P10 = rx478_cur."assertion"()
    unless $P10, rx478_fail
    rx478_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx478_pos = $P10."pos"()
  alt483_end:
  # rx pass
    rx478_cur."!cursor_pass"(rx478_pos, "assertion:sym<!>")
    if_null rx478_debug, debug_420
    rx478_cur."!cursor_debug"("PASS", "assertion:sym<!>", " at pos=", rx478_pos)
  debug_420:
    .return (rx478_cur)
  rx478_restart:
.annotate 'line', 3
    if_null rx478_debug, debug_421
    rx478_cur."!cursor_debug"("NEXT", "assertion:sym<!>")
  debug_421:
  rx478_fail:
    (rx478_rep, rx478_pos, $I10, $P10) = rx478_cur."!mark_fail"(0)
    lt rx478_pos, -1, rx478_done
    eq rx478_pos, -1, rx478_fail
    jump $I10
  rx478_done:
    rx478_cur."!cursor_fail"()
    if_null rx478_debug, debug_422
    rx478_cur."!cursor_debug"("FAIL", "assertion:sym<!>")
  debug_422:
    .return (rx478_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<!>"  :subid("140_1283874333.85778") :method
.annotate 'line', 3
    $P480 = self."!PREFIX__!subrule"("assertion", "!")
    new $P481, "ResizablePMCArray"
    push $P481, $P480
    push $P481, "!"
    .return ($P481)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block484"  :anon :subid("141_1283874333.85778") :method :outer("139_1283874333.85778")
.annotate 'line', 154
    .local string rx486_tgt
    .local int rx486_pos
    .local int rx486_off
    .local int rx486_eos
    .local int rx486_rep
    .local pmc rx486_cur
    .local pmc rx486_debug
    (rx486_cur, rx486_pos, rx486_tgt, $I10) = self."!cursor_start"()
    getattribute rx486_debug, rx486_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx486_cur
    .local pmc match
    .lex "$/", match
    length rx486_eos, rx486_tgt
    gt rx486_pos, rx486_eos, rx486_done
    set rx486_off, 0
    lt rx486_pos, 2, rx486_start
    sub rx486_off, rx486_pos, 1
    substr rx486_tgt, rx486_tgt, rx486_off
  rx486_start:
    eq $I10, 1, rx486_restart
    if_null rx486_debug, debug_416
    rx486_cur."!cursor_debug"("START", "")
  debug_416:
    $I10 = self.'from'()
    ne $I10, -1, rxscan487_done
    goto rxscan487_scan
  rxscan487_loop:
    ($P10) = rx486_cur."from"()
    inc $P10
    set rx486_pos, $P10
    ge rx486_pos, rx486_eos, rxscan487_done
  rxscan487_scan:
    set_addr $I10, rxscan487_loop
    rx486_cur."!mark_push"(0, rx486_pos, $I10)
  rxscan487_done:
  # rx literal  ">"
    add $I11, rx486_pos, 1
    gt $I11, rx486_eos, rx486_fail
    sub $I11, rx486_pos, rx486_off
    ord $I11, rx486_tgt, $I11
    ne $I11, 62, rx486_fail
    add rx486_pos, 1
  # rx pass
    rx486_cur."!cursor_pass"(rx486_pos, "")
    if_null rx486_debug, debug_417
    rx486_cur."!cursor_debug"("PASS", "", " at pos=", rx486_pos)
  debug_417:
    .return (rx486_cur)
  rx486_restart:
    if_null rx486_debug, debug_418
    rx486_cur."!cursor_debug"("NEXT", "")
  debug_418:
  rx486_fail:
    (rx486_rep, rx486_pos, $I10, $P10) = rx486_cur."!mark_fail"(0)
    lt rx486_pos, -1, rx486_done
    eq rx486_pos, -1, rx486_fail
    jump $I10
  rx486_done:
    rx486_cur."!cursor_fail"()
    if_null rx486_debug, debug_419
    rx486_cur."!cursor_debug"("FAIL", "")
  debug_419:
    .return (rx486_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<method>"  :subid("142_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx489_tgt
    .local int rx489_pos
    .local int rx489_off
    .local int rx489_eos
    .local int rx489_rep
    .local pmc rx489_cur
    .local pmc rx489_debug
    (rx489_cur, rx489_pos, rx489_tgt, $I10) = self."!cursor_start"()
    getattribute rx489_debug, rx489_cur, "$!debug"
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
    if_null rx489_debug, debug_423
    rx489_cur."!cursor_debug"("START", "assertion:sym<method>")
  debug_423:
    $I10 = self.'from'()
    ne $I10, -1, rxscan493_done
    goto rxscan493_scan
  rxscan493_loop:
    ($P10) = rx489_cur."from"()
    inc $P10
    set rx489_pos, $P10
    ge rx489_pos, rx489_eos, rxscan493_done
  rxscan493_scan:
    set_addr $I10, rxscan493_loop
    rx489_cur."!mark_push"(0, rx489_pos, $I10)
  rxscan493_done:
.annotate 'line', 157
  # rx literal  "."
    add $I11, rx489_pos, 1
    gt $I11, rx489_eos, rx489_fail
    sub $I11, rx489_pos, rx489_off
    ord $I11, rx489_tgt, $I11
    ne $I11, 46, rx489_fail
    add rx489_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx489_cur."!cursor_pos"(rx489_pos)
    $P10 = rx489_cur."assertion"()
    unless $P10, rx489_fail
    rx489_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx489_pos = $P10."pos"()
.annotate 'line', 156
  # rx pass
    rx489_cur."!cursor_pass"(rx489_pos, "assertion:sym<method>")
    if_null rx489_debug, debug_424
    rx489_cur."!cursor_debug"("PASS", "assertion:sym<method>", " at pos=", rx489_pos)
  debug_424:
    .return (rx489_cur)
  rx489_restart:
.annotate 'line', 3
    if_null rx489_debug, debug_425
    rx489_cur."!cursor_debug"("NEXT", "assertion:sym<method>")
  debug_425:
  rx489_fail:
    (rx489_rep, rx489_pos, $I10, $P10) = rx489_cur."!mark_fail"(0)
    lt rx489_pos, -1, rx489_done
    eq rx489_pos, -1, rx489_fail
    jump $I10
  rx489_done:
    rx489_cur."!cursor_fail"()
    if_null rx489_debug, debug_426
    rx489_cur."!cursor_debug"("FAIL", "assertion:sym<method>")
  debug_426:
    .return (rx489_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<method>"  :subid("143_1283874333.85778") :method
.annotate 'line', 3
    $P491 = self."!PREFIX__!subrule"("assertion", ".")
    new $P492, "ResizablePMCArray"
    push $P492, $P491
    .return ($P492)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<name>"  :subid("144_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .const 'Sub' $P503 = "146_1283874333.85778" 
    capture_lex $P503
    .local string rx495_tgt
    .local int rx495_pos
    .local int rx495_off
    .local int rx495_eos
    .local int rx495_rep
    .local pmc rx495_cur
    .local pmc rx495_debug
    (rx495_cur, rx495_pos, rx495_tgt, $I10) = self."!cursor_start"()
    rx495_cur."!cursor_caparray"("assertion", "nibbler", "arglist")
    getattribute rx495_debug, rx495_cur, "$!debug"
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
    if_null rx495_debug, debug_427
    rx495_cur."!cursor_debug"("START", "assertion:sym<name>")
  debug_427:
    $I10 = self.'from'()
    ne $I10, -1, rxscan499_done
    goto rxscan499_scan
  rxscan499_loop:
    ($P10) = rx495_cur."from"()
    inc $P10
    set rx495_pos, $P10
    ge rx495_pos, rx495_eos, rxscan499_done
  rxscan499_scan:
    set_addr $I10, rxscan499_loop
    rx495_cur."!mark_push"(0, rx495_pos, $I10)
  rxscan499_done:
.annotate 'line', 161
  # rx subrule "identifier" subtype=capture negate=
    rx495_cur."!cursor_pos"(rx495_pos)
    $P10 = rx495_cur."identifier"()
    unless $P10, rx495_fail
    rx495_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    rx495_pos = $P10."pos"()
.annotate 'line', 168
  # rx rxquantr500 ** 0..1
    set_addr $I10, rxquantr500_done
    rx495_cur."!mark_push"(0, rx495_pos, $I10)
  rxquantr500_loop:
  alt501_0:
.annotate 'line', 162
    set_addr $I10, alt501_1
    rx495_cur."!mark_push"(0, rx495_pos, $I10)
.annotate 'line', 163
  # rx subrule "before" subtype=zerowidth negate=
    rx495_cur."!cursor_pos"(rx495_pos)
    .const 'Sub' $P503 = "146_1283874333.85778" 
    capture_lex $P503
    $P10 = rx495_cur."before"($P503)
    unless $P10, rx495_fail
    goto alt501_end
  alt501_1:
    set_addr $I10, alt501_2
    rx495_cur."!mark_push"(0, rx495_pos, $I10)
.annotate 'line', 164
  # rx literal  "="
    add $I11, rx495_pos, 1
    gt $I11, rx495_eos, rx495_fail
    sub $I11, rx495_pos, rx495_off
    ord $I11, rx495_tgt, $I11
    ne $I11, 61, rx495_fail
    add rx495_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx495_cur."!cursor_pos"(rx495_pos)
    $P10 = rx495_cur."assertion"()
    unless $P10, rx495_fail
    rx495_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx495_pos = $P10."pos"()
    goto alt501_end
  alt501_2:
    set_addr $I10, alt501_3
    rx495_cur."!mark_push"(0, rx495_pos, $I10)
.annotate 'line', 165
  # rx literal  ":"
    add $I11, rx495_pos, 1
    gt $I11, rx495_eos, rx495_fail
    sub $I11, rx495_pos, rx495_off
    ord $I11, rx495_tgt, $I11
    ne $I11, 58, rx495_fail
    add rx495_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx495_cur."!cursor_pos"(rx495_pos)
    $P10 = rx495_cur."arglist"()
    unless $P10, rx495_fail
    rx495_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx495_pos = $P10."pos"()
    goto alt501_end
  alt501_3:
    set_addr $I10, alt501_4
    rx495_cur."!mark_push"(0, rx495_pos, $I10)
.annotate 'line', 166
  # rx literal  "("
    add $I11, rx495_pos, 1
    gt $I11, rx495_eos, rx495_fail
    sub $I11, rx495_pos, rx495_off
    ord $I11, rx495_tgt, $I11
    ne $I11, 40, rx495_fail
    add rx495_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx495_cur."!cursor_pos"(rx495_pos)
    $P10 = rx495_cur."arglist"()
    unless $P10, rx495_fail
    rx495_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx495_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx495_pos, 1
    gt $I11, rx495_eos, rx495_fail
    sub $I11, rx495_pos, rx495_off
    ord $I11, rx495_tgt, $I11
    ne $I11, 41, rx495_fail
    add rx495_pos, 1
    goto alt501_end
  alt501_4:
.annotate 'line', 167
  # rx subrule "normspace" subtype=method negate=
    rx495_cur."!cursor_pos"(rx495_pos)
    $P10 = rx495_cur."normspace"()
    unless $P10, rx495_fail
    rx495_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx495_cur."!cursor_pos"(rx495_pos)
    $P10 = rx495_cur."nibbler"()
    unless $P10, rx495_fail
    rx495_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx495_pos = $P10."pos"()
  alt501_end:
.annotate 'line', 168
    set_addr $I10, rxquantr500_done
    (rx495_rep) = rx495_cur."!mark_commit"($I10)
  rxquantr500_done:
.annotate 'line', 160
  # rx pass
    rx495_cur."!cursor_pass"(rx495_pos, "assertion:sym<name>")
    if_null rx495_debug, debug_432
    rx495_cur."!cursor_debug"("PASS", "assertion:sym<name>", " at pos=", rx495_pos)
  debug_432:
    .return (rx495_cur)
  rx495_restart:
.annotate 'line', 3
    if_null rx495_debug, debug_433
    rx495_cur."!cursor_debug"("NEXT", "assertion:sym<name>")
  debug_433:
  rx495_fail:
    (rx495_rep, rx495_pos, $I10, $P10) = rx495_cur."!mark_fail"(0)
    lt rx495_pos, -1, rx495_done
    eq rx495_pos, -1, rx495_fail
    jump $I10
  rx495_done:
    rx495_cur."!cursor_fail"()
    if_null rx495_debug, debug_434
    rx495_cur."!cursor_debug"("FAIL", "assertion:sym<name>")
  debug_434:
    .return (rx495_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<name>"  :subid("145_1283874333.85778") :method
.annotate 'line', 3
    $P497 = self."!PREFIX__!subrule"("identifier", "")
    new $P498, "ResizablePMCArray"
    push $P498, $P497
    .return ($P498)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block502"  :anon :subid("146_1283874333.85778") :method :outer("144_1283874333.85778")
.annotate 'line', 163
    .local string rx504_tgt
    .local int rx504_pos
    .local int rx504_off
    .local int rx504_eos
    .local int rx504_rep
    .local pmc rx504_cur
    .local pmc rx504_debug
    (rx504_cur, rx504_pos, rx504_tgt, $I10) = self."!cursor_start"()
    getattribute rx504_debug, rx504_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx504_cur
    .local pmc match
    .lex "$/", match
    length rx504_eos, rx504_tgt
    gt rx504_pos, rx504_eos, rx504_done
    set rx504_off, 0
    lt rx504_pos, 2, rx504_start
    sub rx504_off, rx504_pos, 1
    substr rx504_tgt, rx504_tgt, rx504_off
  rx504_start:
    eq $I10, 1, rx504_restart
    if_null rx504_debug, debug_428
    rx504_cur."!cursor_debug"("START", "")
  debug_428:
    $I10 = self.'from'()
    ne $I10, -1, rxscan505_done
    goto rxscan505_scan
  rxscan505_loop:
    ($P10) = rx504_cur."from"()
    inc $P10
    set rx504_pos, $P10
    ge rx504_pos, rx504_eos, rxscan505_done
  rxscan505_scan:
    set_addr $I10, rxscan505_loop
    rx504_cur."!mark_push"(0, rx504_pos, $I10)
  rxscan505_done:
  # rx literal  ">"
    add $I11, rx504_pos, 1
    gt $I11, rx504_eos, rx504_fail
    sub $I11, rx504_pos, rx504_off
    ord $I11, rx504_tgt, $I11
    ne $I11, 62, rx504_fail
    add rx504_pos, 1
  # rx pass
    rx504_cur."!cursor_pass"(rx504_pos, "")
    if_null rx504_debug, debug_429
    rx504_cur."!cursor_debug"("PASS", "", " at pos=", rx504_pos)
  debug_429:
    .return (rx504_cur)
  rx504_restart:
    if_null rx504_debug, debug_430
    rx504_cur."!cursor_debug"("NEXT", "")
  debug_430:
  rx504_fail:
    (rx504_rep, rx504_pos, $I10, $P10) = rx504_cur."!mark_fail"(0)
    lt rx504_pos, -1, rx504_done
    eq rx504_pos, -1, rx504_fail
    jump $I10
  rx504_done:
    rx504_cur."!cursor_fail"()
    if_null rx504_debug, debug_431
    rx504_cur."!cursor_debug"("FAIL", "")
  debug_431:
    .return (rx504_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<[>"  :subid("147_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .const 'Sub' $P512 = "149_1283874333.85778" 
    capture_lex $P512
    .local string rx507_tgt
    .local int rx507_pos
    .local int rx507_off
    .local int rx507_eos
    .local int rx507_rep
    .local pmc rx507_cur
    .local pmc rx507_debug
    (rx507_cur, rx507_pos, rx507_tgt, $I10) = self."!cursor_start"()
    rx507_cur."!cursor_caparray"("cclass_elem")
    getattribute rx507_debug, rx507_cur, "$!debug"
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
    if_null rx507_debug, debug_435
    rx507_cur."!cursor_debug"("START", "assertion:sym<[>")
  debug_435:
    $I10 = self.'from'()
    ne $I10, -1, rxscan510_done
    goto rxscan510_scan
  rxscan510_loop:
    ($P10) = rx507_cur."from"()
    inc $P10
    set rx507_pos, $P10
    ge rx507_pos, rx507_eos, rxscan510_done
  rxscan510_scan:
    set_addr $I10, rxscan510_loop
    rx507_cur."!mark_push"(0, rx507_pos, $I10)
  rxscan510_done:
.annotate 'line', 171
  # rx subrule "before" subtype=zerowidth negate=
    rx507_cur."!cursor_pos"(rx507_pos)
    .const 'Sub' $P512 = "149_1283874333.85778" 
    capture_lex $P512
    $P10 = rx507_cur."before"($P512)
    unless $P10, rx507_fail
  # rx rxquantr516 ** 1..*
    set_addr $I10, rxquantr516_done
    rx507_cur."!mark_push"(0, -1, $I10)
  rxquantr516_loop:
  # rx subrule "cclass_elem" subtype=capture negate=
    rx507_cur."!cursor_pos"(rx507_pos)
    $P10 = rx507_cur."cclass_elem"()
    unless $P10, rx507_fail
    goto rxsubrule517_pass
  rxsubrule517_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx507_fail
  rxsubrule517_pass:
    set_addr $I10, rxsubrule517_back
    rx507_cur."!mark_push"(0, rx507_pos, $I10, $P10)
    $P10."!cursor_names"("cclass_elem")
    rx507_pos = $P10."pos"()
    set_addr $I10, rxquantr516_done
    (rx507_rep) = rx507_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr516_done
    rx507_cur."!mark_push"(rx507_rep, rx507_pos, $I10)
    goto rxquantr516_loop
  rxquantr516_done:
  # rx pass
    rx507_cur."!cursor_pass"(rx507_pos, "assertion:sym<[>")
    if_null rx507_debug, debug_440
    rx507_cur."!cursor_debug"("PASS", "assertion:sym<[>", " at pos=", rx507_pos)
  debug_440:
    .return (rx507_cur)
  rx507_restart:
.annotate 'line', 3
    if_null rx507_debug, debug_441
    rx507_cur."!cursor_debug"("NEXT", "assertion:sym<[>")
  debug_441:
  rx507_fail:
    (rx507_rep, rx507_pos, $I10, $P10) = rx507_cur."!mark_fail"(0)
    lt rx507_pos, -1, rx507_done
    eq rx507_pos, -1, rx507_fail
    jump $I10
  rx507_done:
    rx507_cur."!cursor_fail"()
    if_null rx507_debug, debug_442
    rx507_cur."!cursor_debug"("FAIL", "assertion:sym<[>")
  debug_442:
    .return (rx507_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<[>"  :subid("148_1283874333.85778") :method
.annotate 'line', 3
    new $P509, "ResizablePMCArray"
    push $P509, ""
    .return ($P509)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block511"  :anon :subid("149_1283874333.85778") :method :outer("147_1283874333.85778")
.annotate 'line', 171
    .local string rx513_tgt
    .local int rx513_pos
    .local int rx513_off
    .local int rx513_eos
    .local int rx513_rep
    .local pmc rx513_cur
    .local pmc rx513_debug
    (rx513_cur, rx513_pos, rx513_tgt, $I10) = self."!cursor_start"()
    getattribute rx513_debug, rx513_cur, "$!debug"
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
    if_null rx513_debug, debug_436
    rx513_cur."!cursor_debug"("START", "")
  debug_436:
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
  alt515_0:
    set_addr $I10, alt515_1
    rx513_cur."!mark_push"(0, rx513_pos, $I10)
  # rx literal  "["
    add $I11, rx513_pos, 1
    gt $I11, rx513_eos, rx513_fail
    sub $I11, rx513_pos, rx513_off
    ord $I11, rx513_tgt, $I11
    ne $I11, 91, rx513_fail
    add rx513_pos, 1
    goto alt515_end
  alt515_1:
    set_addr $I10, alt515_2
    rx513_cur."!mark_push"(0, rx513_pos, $I10)
  # rx literal  "+"
    add $I11, rx513_pos, 1
    gt $I11, rx513_eos, rx513_fail
    sub $I11, rx513_pos, rx513_off
    ord $I11, rx513_tgt, $I11
    ne $I11, 43, rx513_fail
    add rx513_pos, 1
    goto alt515_end
  alt515_2:
  # rx literal  "-"
    add $I11, rx513_pos, 1
    gt $I11, rx513_eos, rx513_fail
    sub $I11, rx513_pos, rx513_off
    ord $I11, rx513_tgt, $I11
    ne $I11, 45, rx513_fail
    add rx513_pos, 1
  alt515_end:
  # rx pass
    rx513_cur."!cursor_pass"(rx513_pos, "")
    if_null rx513_debug, debug_437
    rx513_cur."!cursor_debug"("PASS", "", " at pos=", rx513_pos)
  debug_437:
    .return (rx513_cur)
  rx513_restart:
    if_null rx513_debug, debug_438
    rx513_cur."!cursor_debug"("NEXT", "")
  debug_438:
  rx513_fail:
    (rx513_rep, rx513_pos, $I10, $P10) = rx513_cur."!mark_fail"(0)
    lt rx513_pos, -1, rx513_done
    eq rx513_pos, -1, rx513_fail
    jump $I10
  rx513_done:
    rx513_cur."!cursor_fail"()
    if_null rx513_debug, debug_439
    rx513_cur."!cursor_debug"("FAIL", "")
  debug_439:
    .return (rx513_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "cclass_elem"  :subid("150_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .const 'Sub' $P530 = "152_1283874333.85778" 
    capture_lex $P530
    .local string rx519_tgt
    .local int rx519_pos
    .local int rx519_off
    .local int rx519_eos
    .local int rx519_rep
    .local pmc rx519_cur
    .local pmc rx519_debug
    (rx519_cur, rx519_pos, rx519_tgt, $I10) = self."!cursor_start"()
    rx519_cur."!cursor_caparray"("charspec")
    getattribute rx519_debug, rx519_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx519_cur
    .local pmc match
    .lex "$/", match
    length rx519_eos, rx519_tgt
    gt rx519_pos, rx519_eos, rx519_done
    set rx519_off, 0
    lt rx519_pos, 2, rx519_start
    sub rx519_off, rx519_pos, 1
    substr rx519_tgt, rx519_tgt, rx519_off
  rx519_start:
    eq $I10, 1, rx519_restart
    if_null rx519_debug, debug_443
    rx519_cur."!cursor_debug"("START", "cclass_elem")
  debug_443:
    $I10 = self.'from'()
    ne $I10, -1, rxscan522_done
    goto rxscan522_scan
  rxscan522_loop:
    ($P10) = rx519_cur."from"()
    inc $P10
    set rx519_pos, $P10
    ge rx519_pos, rx519_eos, rxscan522_done
  rxscan522_scan:
    set_addr $I10, rxscan522_loop
    rx519_cur."!mark_push"(0, rx519_pos, $I10)
  rxscan522_done:
.annotate 'line', 174
  # rx subcapture "sign"
    set_addr $I10, rxcap_524_fail
    rx519_cur."!mark_push"(0, rx519_pos, $I10)
  alt523_0:
    set_addr $I10, alt523_1
    rx519_cur."!mark_push"(0, rx519_pos, $I10)
  # rx literal  "+"
    add $I11, rx519_pos, 1
    gt $I11, rx519_eos, rx519_fail
    sub $I11, rx519_pos, rx519_off
    ord $I11, rx519_tgt, $I11
    ne $I11, 43, rx519_fail
    add rx519_pos, 1
    goto alt523_end
  alt523_1:
    set_addr $I10, alt523_2
    rx519_cur."!mark_push"(0, rx519_pos, $I10)
  # rx literal  "-"
    add $I11, rx519_pos, 1
    gt $I11, rx519_eos, rx519_fail
    sub $I11, rx519_pos, rx519_off
    ord $I11, rx519_tgt, $I11
    ne $I11, 45, rx519_fail
    add rx519_pos, 1
    goto alt523_end
  alt523_2:
  alt523_end:
    set_addr $I10, rxcap_524_fail
    ($I12, $I11) = rx519_cur."!mark_peek"($I10)
    rx519_cur."!cursor_pos"($I11)
    ($P10) = rx519_cur."!cursor_start"()
    $P10."!cursor_pass"(rx519_pos, "")
    rx519_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sign")
    goto rxcap_524_done
  rxcap_524_fail:
    goto rx519_fail
  rxcap_524_done:
.annotate 'line', 175
  # rx rxquantr525 ** 0..1
    set_addr $I10, rxquantr525_done
    rx519_cur."!mark_push"(0, rx519_pos, $I10)
  rxquantr525_loop:
  # rx subrule "normspace" subtype=method negate=
    rx519_cur."!cursor_pos"(rx519_pos)
    $P10 = rx519_cur."normspace"()
    unless $P10, rx519_fail
    goto rxsubrule526_pass
  rxsubrule526_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx519_fail
  rxsubrule526_pass:
    set_addr $I10, rxsubrule526_back
    rx519_cur."!mark_push"(0, rx519_pos, $I10, $P10)
    rx519_pos = $P10."pos"()
    set_addr $I10, rxquantr525_done
    (rx519_rep) = rx519_cur."!mark_commit"($I10)
  rxquantr525_done:
  alt527_0:
.annotate 'line', 176
    set_addr $I10, alt527_1
    rx519_cur."!mark_push"(0, rx519_pos, $I10)
.annotate 'line', 177
  # rx literal  "["
    add $I11, rx519_pos, 1
    gt $I11, rx519_eos, rx519_fail
    sub $I11, rx519_pos, rx519_off
    ord $I11, rx519_tgt, $I11
    ne $I11, 91, rx519_fail
    add rx519_pos, 1
.annotate 'line', 180
  # rx rxquantr528 ** 0..*
    set_addr $I10, rxquantr528_done
    rx519_cur."!mark_push"(0, rx519_pos, $I10)
  rxquantr528_loop:
.annotate 'line', 177
  # rx subrule $P530 subtype=capture negate=
    rx519_cur."!cursor_pos"(rx519_pos)
    .const 'Sub' $P530 = "152_1283874333.85778" 
    capture_lex $P530
    $P10 = rx519_cur.$P530()
    unless $P10, rx519_fail
    goto rxsubrule548_pass
  rxsubrule548_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx519_fail
  rxsubrule548_pass:
    set_addr $I10, rxsubrule548_back
    rx519_cur."!mark_push"(0, rx519_pos, $I10, $P10)
    $P10."!cursor_names"("charspec")
    rx519_pos = $P10."pos"()
.annotate 'line', 180
    set_addr $I10, rxquantr528_done
    (rx519_rep) = rx519_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr528_done
    rx519_cur."!mark_push"(rx519_rep, rx519_pos, $I10)
    goto rxquantr528_loop
  rxquantr528_done:
.annotate 'line', 181
  # rx charclass_q s r 0..-1
    sub $I10, rx519_pos, rx519_off
    find_not_cclass $I11, 32, rx519_tgt, $I10, rx519_eos
    add rx519_pos, rx519_off, $I11
  # rx literal  "]"
    add $I11, rx519_pos, 1
    gt $I11, rx519_eos, rx519_fail
    sub $I11, rx519_pos, rx519_off
    ord $I11, rx519_tgt, $I11
    ne $I11, 93, rx519_fail
    add rx519_pos, 1
.annotate 'line', 177
    goto alt527_end
  alt527_1:
.annotate 'line', 182
  # rx subcapture "name"
    set_addr $I10, rxcap_549_fail
    rx519_cur."!mark_push"(0, rx519_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx519_pos, rx519_off
    find_not_cclass $I11, 8192, rx519_tgt, $I10, rx519_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx519_fail
    add rx519_pos, rx519_off, $I11
    set_addr $I10, rxcap_549_fail
    ($I12, $I11) = rx519_cur."!mark_peek"($I10)
    rx519_cur."!cursor_pos"($I11)
    ($P10) = rx519_cur."!cursor_start"()
    $P10."!cursor_pass"(rx519_pos, "")
    rx519_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_549_done
  rxcap_549_fail:
    goto rx519_fail
  rxcap_549_done:
  alt527_end:
.annotate 'line', 184
  # rx rxquantr550 ** 0..1
    set_addr $I10, rxquantr550_done
    rx519_cur."!mark_push"(0, rx519_pos, $I10)
  rxquantr550_loop:
  # rx subrule "normspace" subtype=method negate=
    rx519_cur."!cursor_pos"(rx519_pos)
    $P10 = rx519_cur."normspace"()
    unless $P10, rx519_fail
    goto rxsubrule551_pass
  rxsubrule551_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx519_fail
  rxsubrule551_pass:
    set_addr $I10, rxsubrule551_back
    rx519_cur."!mark_push"(0, rx519_pos, $I10, $P10)
    rx519_pos = $P10."pos"()
    set_addr $I10, rxquantr550_done
    (rx519_rep) = rx519_cur."!mark_commit"($I10)
  rxquantr550_done:
.annotate 'line', 173
  # rx pass
    rx519_cur."!cursor_pass"(rx519_pos, "cclass_elem")
    if_null rx519_debug, debug_460
    rx519_cur."!cursor_debug"("PASS", "cclass_elem", " at pos=", rx519_pos)
  debug_460:
    .return (rx519_cur)
  rx519_restart:
.annotate 'line', 3
    if_null rx519_debug, debug_461
    rx519_cur."!cursor_debug"("NEXT", "cclass_elem")
  debug_461:
  rx519_fail:
    (rx519_rep, rx519_pos, $I10, $P10) = rx519_cur."!mark_fail"(0)
    lt rx519_pos, -1, rx519_done
    eq rx519_pos, -1, rx519_fail
    jump $I10
  rx519_done:
    rx519_cur."!cursor_fail"()
    if_null rx519_debug, debug_462
    rx519_cur."!cursor_debug"("FAIL", "cclass_elem")
  debug_462:
    .return (rx519_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__cclass_elem"  :subid("151_1283874333.85778") :method
.annotate 'line', 3
    new $P521, "ResizablePMCArray"
    push $P521, ""
    push $P521, "-"
    push $P521, "+"
    .return ($P521)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block529"  :anon :subid("152_1283874333.85778") :method :outer("150_1283874333.85778")
.annotate 'line', 177
    .const 'Sub' $P545 = "155_1283874333.85778" 
    capture_lex $P545
    .const 'Sub' $P540 = "154_1283874333.85778" 
    capture_lex $P540
    .const 'Sub' $P536 = "153_1283874333.85778" 
    capture_lex $P536
    .local string rx531_tgt
    .local int rx531_pos
    .local int rx531_off
    .local int rx531_eos
    .local int rx531_rep
    .local pmc rx531_cur
    .local pmc rx531_debug
    (rx531_cur, rx531_pos, rx531_tgt, $I10) = self."!cursor_start"()
    rx531_cur."!cursor_caparray"("1")
    getattribute rx531_debug, rx531_cur, "$!debug"
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
    eq $I10, 1, rx531_restart
    if_null rx531_debug, debug_444
    rx531_cur."!cursor_debug"("START", "")
  debug_444:
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
  alt533_0:
    set_addr $I10, alt533_1
    rx531_cur."!mark_push"(0, rx531_pos, $I10)
.annotate 'line', 178
  # rx charclass_q s r 0..-1
    sub $I10, rx531_pos, rx531_off
    find_not_cclass $I11, 32, rx531_tgt, $I10, rx531_eos
    add rx531_pos, rx531_off, $I11
  # rx literal  "-"
    add $I11, rx531_pos, 1
    gt $I11, rx531_eos, rx531_fail
    sub $I11, rx531_pos, rx531_off
    ord $I11, rx531_tgt, $I11
    ne $I11, 45, rx531_fail
    add rx531_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx531_cur."!cursor_pos"(rx531_pos)
    $P10 = rx531_cur."obs"("- as character range", "..")
    unless $P10, rx531_fail
    rx531_pos = $P10."pos"()
    goto alt533_end
  alt533_1:
.annotate 'line', 179
  # rx charclass_q s r 0..-1
    sub $I10, rx531_pos, rx531_off
    find_not_cclass $I11, 32, rx531_tgt, $I10, rx531_eos
    add rx531_pos, rx531_off, $I11
  alt534_0:
    set_addr $I10, alt534_1
    rx531_cur."!mark_push"(0, rx531_pos, $I10)
  # rx literal  "\\"
    add $I11, rx531_pos, 1
    gt $I11, rx531_eos, rx531_fail
    sub $I11, rx531_pos, rx531_off
    ord $I11, rx531_tgt, $I11
    ne $I11, 92, rx531_fail
    add rx531_pos, 1
  # rx subrule $P536 subtype=capture negate=
    rx531_cur."!cursor_pos"(rx531_pos)
    .const 'Sub' $P536 = "153_1283874333.85778" 
    capture_lex $P536
    $P10 = rx531_cur.$P536()
    unless $P10, rx531_fail
    rx531_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"(0)
    rx531_pos = $P10."pos"()
    goto alt534_end
  alt534_1:
  # rx subrule $P540 subtype=capture negate=
    rx531_cur."!cursor_pos"(rx531_pos)
    .const 'Sub' $P540 = "154_1283874333.85778" 
    capture_lex $P540
    $P10 = rx531_cur.$P540()
    unless $P10, rx531_fail
    rx531_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"(0)
    rx531_pos = $P10."pos"()
  alt534_end:
  # rx rxquantr543 ** 0..1
    set_addr $I10, rxquantr543_done
    rx531_cur."!mark_push"(0, rx531_pos, $I10)
  rxquantr543_loop:
  # rx charclass_q s r 0..-1
    sub $I10, rx531_pos, rx531_off
    find_not_cclass $I11, 32, rx531_tgt, $I10, rx531_eos
    add rx531_pos, rx531_off, $I11
  # rx literal  ".."
    add $I11, rx531_pos, 2
    gt $I11, rx531_eos, rx531_fail
    sub $I11, rx531_pos, rx531_off
    substr $S10, rx531_tgt, $I11, 2
    ne $S10, "..", rx531_fail
    add rx531_pos, 2
  # rx charclass_q s r 0..-1
    sub $I10, rx531_pos, rx531_off
    find_not_cclass $I11, 32, rx531_tgt, $I10, rx531_eos
    add rx531_pos, rx531_off, $I11
  # rx subrule $P545 subtype=capture negate=
    rx531_cur."!cursor_pos"(rx531_pos)
    .const 'Sub' $P545 = "155_1283874333.85778" 
    capture_lex $P545
    $P10 = rx531_cur.$P545()
    unless $P10, rx531_fail
    rx531_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("1")
    rx531_pos = $P10."pos"()
    set_addr $I10, rxquantr543_done
    (rx531_rep) = rx531_cur."!mark_commit"($I10)
  rxquantr543_done:
  alt533_end:
.annotate 'line', 177
  # rx pass
    rx531_cur."!cursor_pass"(rx531_pos, "")
    if_null rx531_debug, debug_457
    rx531_cur."!cursor_debug"("PASS", "", " at pos=", rx531_pos)
  debug_457:
    .return (rx531_cur)
  rx531_restart:
    if_null rx531_debug, debug_458
    rx531_cur."!cursor_debug"("NEXT", "")
  debug_458:
  rx531_fail:
    (rx531_rep, rx531_pos, $I10, $P10) = rx531_cur."!mark_fail"(0)
    lt rx531_pos, -1, rx531_done
    eq rx531_pos, -1, rx531_fail
    jump $I10
  rx531_done:
    rx531_cur."!cursor_fail"()
    if_null rx531_debug, debug_459
    rx531_cur."!cursor_debug"("FAIL", "")
  debug_459:
    .return (rx531_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block535"  :anon :subid("153_1283874333.85778") :method :outer("152_1283874333.85778")
.annotate 'line', 179
    .local string rx537_tgt
    .local int rx537_pos
    .local int rx537_off
    .local int rx537_eos
    .local int rx537_rep
    .local pmc rx537_cur
    .local pmc rx537_debug
    (rx537_cur, rx537_pos, rx537_tgt, $I10) = self."!cursor_start"()
    getattribute rx537_debug, rx537_cur, "$!debug"
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
    if_null rx537_debug, debug_445
    rx537_cur."!cursor_debug"("START", "")
  debug_445:
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
  # rx charclass .
    ge rx537_pos, rx537_eos, rx537_fail
    inc rx537_pos
  # rx pass
    rx537_cur."!cursor_pass"(rx537_pos, "")
    if_null rx537_debug, debug_446
    rx537_cur."!cursor_debug"("PASS", "", " at pos=", rx537_pos)
  debug_446:
    .return (rx537_cur)
  rx537_restart:
    if_null rx537_debug, debug_447
    rx537_cur."!cursor_debug"("NEXT", "")
  debug_447:
  rx537_fail:
    (rx537_rep, rx537_pos, $I10, $P10) = rx537_cur."!mark_fail"(0)
    lt rx537_pos, -1, rx537_done
    eq rx537_pos, -1, rx537_fail
    jump $I10
  rx537_done:
    rx537_cur."!cursor_fail"()
    if_null rx537_debug, debug_448
    rx537_cur."!cursor_debug"("FAIL", "")
  debug_448:
    .return (rx537_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block539"  :anon :subid("154_1283874333.85778") :method :outer("152_1283874333.85778")
.annotate 'line', 179
    .local string rx541_tgt
    .local int rx541_pos
    .local int rx541_off
    .local int rx541_eos
    .local int rx541_rep
    .local pmc rx541_cur
    .local pmc rx541_debug
    (rx541_cur, rx541_pos, rx541_tgt, $I10) = self."!cursor_start"()
    getattribute rx541_debug, rx541_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx541_cur
    .local pmc match
    .lex "$/", match
    length rx541_eos, rx541_tgt
    gt rx541_pos, rx541_eos, rx541_done
    set rx541_off, 0
    lt rx541_pos, 2, rx541_start
    sub rx541_off, rx541_pos, 1
    substr rx541_tgt, rx541_tgt, rx541_off
  rx541_start:
    eq $I10, 1, rx541_restart
    if_null rx541_debug, debug_449
    rx541_cur."!cursor_debug"("START", "")
  debug_449:
    $I10 = self.'from'()
    ne $I10, -1, rxscan542_done
    goto rxscan542_scan
  rxscan542_loop:
    ($P10) = rx541_cur."from"()
    inc $P10
    set rx541_pos, $P10
    ge rx541_pos, rx541_eos, rxscan542_done
  rxscan542_scan:
    set_addr $I10, rxscan542_loop
    rx541_cur."!mark_push"(0, rx541_pos, $I10)
  rxscan542_done:
  # rx enumcharlist negate=1 
    ge rx541_pos, rx541_eos, rx541_fail
    sub $I10, rx541_pos, rx541_off
    substr $S10, rx541_tgt, $I10, 1
    index $I11, "]\\", $S10
    ge $I11, 0, rx541_fail
    inc rx541_pos
  # rx pass
    rx541_cur."!cursor_pass"(rx541_pos, "")
    if_null rx541_debug, debug_450
    rx541_cur."!cursor_debug"("PASS", "", " at pos=", rx541_pos)
  debug_450:
    .return (rx541_cur)
  rx541_restart:
    if_null rx541_debug, debug_451
    rx541_cur."!cursor_debug"("NEXT", "")
  debug_451:
  rx541_fail:
    (rx541_rep, rx541_pos, $I10, $P10) = rx541_cur."!mark_fail"(0)
    lt rx541_pos, -1, rx541_done
    eq rx541_pos, -1, rx541_fail
    jump $I10
  rx541_done:
    rx541_cur."!cursor_fail"()
    if_null rx541_debug, debug_452
    rx541_cur."!cursor_debug"("FAIL", "")
  debug_452:
    .return (rx541_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block544"  :anon :subid("155_1283874333.85778") :method :outer("152_1283874333.85778")
.annotate 'line', 179
    .local string rx546_tgt
    .local int rx546_pos
    .local int rx546_off
    .local int rx546_eos
    .local int rx546_rep
    .local pmc rx546_cur
    .local pmc rx546_debug
    (rx546_cur, rx546_pos, rx546_tgt, $I10) = self."!cursor_start"()
    getattribute rx546_debug, rx546_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx546_cur
    .local pmc match
    .lex "$/", match
    length rx546_eos, rx546_tgt
    gt rx546_pos, rx546_eos, rx546_done
    set rx546_off, 0
    lt rx546_pos, 2, rx546_start
    sub rx546_off, rx546_pos, 1
    substr rx546_tgt, rx546_tgt, rx546_off
  rx546_start:
    eq $I10, 1, rx546_restart
    if_null rx546_debug, debug_453
    rx546_cur."!cursor_debug"("START", "")
  debug_453:
    $I10 = self.'from'()
    ne $I10, -1, rxscan547_done
    goto rxscan547_scan
  rxscan547_loop:
    ($P10) = rx546_cur."from"()
    inc $P10
    set rx546_pos, $P10
    ge rx546_pos, rx546_eos, rxscan547_done
  rxscan547_scan:
    set_addr $I10, rxscan547_loop
    rx546_cur."!mark_push"(0, rx546_pos, $I10)
  rxscan547_done:
  # rx charclass .
    ge rx546_pos, rx546_eos, rx546_fail
    inc rx546_pos
  # rx pass
    rx546_cur."!cursor_pass"(rx546_pos, "")
    if_null rx546_debug, debug_454
    rx546_cur."!cursor_debug"("PASS", "", " at pos=", rx546_pos)
  debug_454:
    .return (rx546_cur)
  rx546_restart:
    if_null rx546_debug, debug_455
    rx546_cur."!cursor_debug"("NEXT", "")
  debug_455:
  rx546_fail:
    (rx546_rep, rx546_pos, $I10, $P10) = rx546_cur."!mark_fail"(0)
    lt rx546_pos, -1, rx546_done
    eq rx546_pos, -1, rx546_fail
    jump $I10
  rx546_done:
    rx546_cur."!cursor_fail"()
    if_null rx546_debug, debug_456
    rx546_cur."!cursor_debug"("FAIL", "")
  debug_456:
    .return (rx546_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_internal"  :subid("156_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .const 'Sub' $P561 = "158_1283874333.85778" 
    capture_lex $P561
    .local string rx553_tgt
    .local int rx553_pos
    .local int rx553_off
    .local int rx553_eos
    .local int rx553_rep
    .local pmc rx553_cur
    .local pmc rx553_debug
    (rx553_cur, rx553_pos, rx553_tgt, $I10) = self."!cursor_start"()
    rx553_cur."!cursor_caparray"("n")
    getattribute rx553_debug, rx553_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx553_cur
    .local pmc match
    .lex "$/", match
    length rx553_eos, rx553_tgt
    gt rx553_pos, rx553_eos, rx553_done
    set rx553_off, 0
    lt rx553_pos, 2, rx553_start
    sub rx553_off, rx553_pos, 1
    substr rx553_tgt, rx553_tgt, rx553_off
  rx553_start:
    eq $I10, 1, rx553_restart
    if_null rx553_debug, debug_463
    rx553_cur."!cursor_debug"("START", "mod_internal")
  debug_463:
    $I10 = self.'from'()
    ne $I10, -1, rxscan557_done
    goto rxscan557_scan
  rxscan557_loop:
    ($P10) = rx553_cur."from"()
    inc $P10
    set rx553_pos, $P10
    ge rx553_pos, rx553_eos, rxscan557_done
  rxscan557_scan:
    set_addr $I10, rxscan557_loop
    rx553_cur."!mark_push"(0, rx553_pos, $I10)
  rxscan557_done:
  alt558_0:
.annotate 'line', 188
    set_addr $I10, alt558_1
    rx553_cur."!mark_push"(0, rx553_pos, $I10)
.annotate 'line', 189
  # rx literal  ":"
    add $I11, rx553_pos, 1
    gt $I11, rx553_eos, rx553_fail
    sub $I11, rx553_pos, rx553_off
    ord $I11, rx553_tgt, $I11
    ne $I11, 58, rx553_fail
    add rx553_pos, 1
  # rx rxquantr559 ** 1..1
    set_addr $I10, rxquantr559_done
    rx553_cur."!mark_push"(0, -1, $I10)
  rxquantr559_loop:
  # rx subrule $P561 subtype=capture negate=
    rx553_cur."!cursor_pos"(rx553_pos)
    .const 'Sub' $P561 = "158_1283874333.85778" 
    capture_lex $P561
    $P10 = rx553_cur.$P561()
    unless $P10, rx553_fail
    goto rxsubrule565_pass
  rxsubrule565_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx553_fail
  rxsubrule565_pass:
    set_addr $I10, rxsubrule565_back
    rx553_cur."!mark_push"(0, rx553_pos, $I10, $P10)
    $P10."!cursor_names"("n")
    rx553_pos = $P10."pos"()
    set_addr $I10, rxquantr559_done
    (rx553_rep) = rx553_cur."!mark_commit"($I10)
  rxquantr559_done:
  # rx subrule "mod_ident" subtype=capture negate=
    rx553_cur."!cursor_pos"(rx553_pos)
    $P10 = rx553_cur."mod_ident"()
    unless $P10, rx553_fail
    rx553_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_ident")
    rx553_pos = $P10."pos"()
  # rxanchor rwb
    le rx553_pos, 0, rx553_fail
    sub $I10, rx553_pos, rx553_off
    is_cclass $I11, 8192, rx553_tgt, $I10
    if $I11, rx553_fail
    dec $I10
    is_cclass $I11, 8192, rx553_tgt, $I10
    unless $I11, rx553_fail
    goto alt558_end
  alt558_1:
.annotate 'line', 190
  # rx literal  ":"
    add $I11, rx553_pos, 1
    gt $I11, rx553_eos, rx553_fail
    sub $I11, rx553_pos, rx553_off
    ord $I11, rx553_tgt, $I11
    ne $I11, 58, rx553_fail
    add rx553_pos, 1
  # rx subrule "mod_ident" subtype=capture negate=
    rx553_cur."!cursor_pos"(rx553_pos)
    $P10 = rx553_cur."mod_ident"()
    unless $P10, rx553_fail
    rx553_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_ident")
    rx553_pos = $P10."pos"()
  # rx rxquantr566 ** 0..1
    set_addr $I10, rxquantr566_done
    rx553_cur."!mark_push"(0, rx553_pos, $I10)
  rxquantr566_loop:
  # rx literal  "("
    add $I11, rx553_pos, 1
    gt $I11, rx553_eos, rx553_fail
    sub $I11, rx553_pos, rx553_off
    ord $I11, rx553_tgt, $I11
    ne $I11, 40, rx553_fail
    add rx553_pos, 1
  # rx subcapture "n"
    set_addr $I10, rxcap_567_fail
    rx553_cur."!mark_push"(0, rx553_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx553_pos, rx553_off
    find_not_cclass $I11, 8, rx553_tgt, $I10, rx553_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx553_fail
    add rx553_pos, rx553_off, $I11
    set_addr $I10, rxcap_567_fail
    ($I12, $I11) = rx553_cur."!mark_peek"($I10)
    rx553_cur."!cursor_pos"($I11)
    ($P10) = rx553_cur."!cursor_start"()
    $P10."!cursor_pass"(rx553_pos, "")
    rx553_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("n")
    goto rxcap_567_done
  rxcap_567_fail:
    goto rx553_fail
  rxcap_567_done:
  # rx literal  ")"
    add $I11, rx553_pos, 1
    gt $I11, rx553_eos, rx553_fail
    sub $I11, rx553_pos, rx553_off
    ord $I11, rx553_tgt, $I11
    ne $I11, 41, rx553_fail
    add rx553_pos, 1
    set_addr $I10, rxquantr566_done
    (rx553_rep) = rx553_cur."!mark_commit"($I10)
  rxquantr566_done:
  alt558_end:
.annotate 'line', 187
  # rx pass
    rx553_cur."!cursor_pass"(rx553_pos, "mod_internal")
    if_null rx553_debug, debug_468
    rx553_cur."!cursor_debug"("PASS", "mod_internal", " at pos=", rx553_pos)
  debug_468:
    .return (rx553_cur)
  rx553_restart:
.annotate 'line', 3
    if_null rx553_debug, debug_469
    rx553_cur."!cursor_debug"("NEXT", "mod_internal")
  debug_469:
  rx553_fail:
    (rx553_rep, rx553_pos, $I10, $P10) = rx553_cur."!mark_fail"(0)
    lt rx553_pos, -1, rx553_done
    eq rx553_pos, -1, rx553_fail
    jump $I10
  rx553_done:
    rx553_cur."!cursor_fail"()
    if_null rx553_debug, debug_470
    rx553_cur."!cursor_debug"("FAIL", "mod_internal")
  debug_470:
    .return (rx553_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_internal"  :subid("157_1283874333.85778") :method
.annotate 'line', 3
    $P555 = self."!PREFIX__!subrule"("mod_ident", ":")
    new $P556, "ResizablePMCArray"
    push $P556, $P555
    push $P556, ":"
    .return ($P556)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block560"  :anon :subid("158_1283874333.85778") :method :outer("156_1283874333.85778")
.annotate 'line', 189
    .local string rx562_tgt
    .local int rx562_pos
    .local int rx562_off
    .local int rx562_eos
    .local int rx562_rep
    .local pmc rx562_cur
    .local pmc rx562_debug
    (rx562_cur, rx562_pos, rx562_tgt, $I10) = self."!cursor_start"()
    getattribute rx562_debug, rx562_cur, "$!debug"
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
    if_null rx562_debug, debug_464
    rx562_cur."!cursor_debug"("START", "")
  debug_464:
    $I10 = self.'from'()
    ne $I10, -1, rxscan563_done
    goto rxscan563_scan
  rxscan563_loop:
    ($P10) = rx562_cur."from"()
    inc $P10
    set rx562_pos, $P10
    ge rx562_pos, rx562_eos, rxscan563_done
  rxscan563_scan:
    set_addr $I10, rxscan563_loop
    rx562_cur."!mark_push"(0, rx562_pos, $I10)
  rxscan563_done:
  alt564_0:
    set_addr $I10, alt564_1
    rx562_cur."!mark_push"(0, rx562_pos, $I10)
  # rx literal  "!"
    add $I11, rx562_pos, 1
    gt $I11, rx562_eos, rx562_fail
    sub $I11, rx562_pos, rx562_off
    ord $I11, rx562_tgt, $I11
    ne $I11, 33, rx562_fail
    add rx562_pos, 1
    goto alt564_end
  alt564_1:
  # rx charclass_q d r 1..-1
    sub $I10, rx562_pos, rx562_off
    find_not_cclass $I11, 8, rx562_tgt, $I10, rx562_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx562_fail
    add rx562_pos, rx562_off, $I11
  alt564_end:
  # rx pass
    rx562_cur."!cursor_pass"(rx562_pos, "")
    if_null rx562_debug, debug_465
    rx562_cur."!cursor_debug"("PASS", "", " at pos=", rx562_pos)
  debug_465:
    .return (rx562_cur)
  rx562_restart:
    if_null rx562_debug, debug_466
    rx562_cur."!cursor_debug"("NEXT", "")
  debug_466:
  rx562_fail:
    (rx562_rep, rx562_pos, $I10, $P10) = rx562_cur."!mark_fail"(0)
    lt rx562_pos, -1, rx562_done
    eq rx562_pos, -1, rx562_fail
    jump $I10
  rx562_done:
    rx562_cur."!cursor_fail"()
    if_null rx562_debug, debug_467
    rx562_cur."!cursor_debug"("FAIL", "")
  debug_467:
    .return (rx562_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident"  :subid("159_1283874333.85778") :method
.annotate 'line', 194
    $P569 = self."!protoregex"("mod_ident")
    .return ($P569)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident"  :subid("160_1283874333.85778") :method
.annotate 'line', 194
    $P571 = self."!PREFIX__!protoregex"("mod_ident")
    .return ($P571)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ignorecase>"  :subid("161_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx573_tgt
    .local int rx573_pos
    .local int rx573_off
    .local int rx573_eos
    .local int rx573_rep
    .local pmc rx573_cur
    .local pmc rx573_debug
    (rx573_cur, rx573_pos, rx573_tgt, $I10) = self."!cursor_start"()
    getattribute rx573_debug, rx573_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx573_cur
    .local pmc match
    .lex "$/", match
    length rx573_eos, rx573_tgt
    gt rx573_pos, rx573_eos, rx573_done
    set rx573_off, 0
    lt rx573_pos, 2, rx573_start
    sub rx573_off, rx573_pos, 1
    substr rx573_tgt, rx573_tgt, rx573_off
  rx573_start:
    eq $I10, 1, rx573_restart
    if_null rx573_debug, debug_471
    rx573_cur."!cursor_debug"("START", "mod_ident:sym<ignorecase>")
  debug_471:
    $I10 = self.'from'()
    ne $I10, -1, rxscan576_done
    goto rxscan576_scan
  rxscan576_loop:
    ($P10) = rx573_cur."from"()
    inc $P10
    set rx573_pos, $P10
    ge rx573_pos, rx573_eos, rxscan576_done
  rxscan576_scan:
    set_addr $I10, rxscan576_loop
    rx573_cur."!mark_push"(0, rx573_pos, $I10)
  rxscan576_done:
.annotate 'line', 195
  # rx subcapture "sym"
    set_addr $I10, rxcap_577_fail
    rx573_cur."!mark_push"(0, rx573_pos, $I10)
  # rx literal  "i"
    add $I11, rx573_pos, 1
    gt $I11, rx573_eos, rx573_fail
    sub $I11, rx573_pos, rx573_off
    ord $I11, rx573_tgt, $I11
    ne $I11, 105, rx573_fail
    add rx573_pos, 1
    set_addr $I10, rxcap_577_fail
    ($I12, $I11) = rx573_cur."!mark_peek"($I10)
    rx573_cur."!cursor_pos"($I11)
    ($P10) = rx573_cur."!cursor_start"()
    $P10."!cursor_pass"(rx573_pos, "")
    rx573_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_577_done
  rxcap_577_fail:
    goto rx573_fail
  rxcap_577_done:
  # rx rxquantr578 ** 0..1
    set_addr $I10, rxquantr578_done
    rx573_cur."!mark_push"(0, rx573_pos, $I10)
  rxquantr578_loop:
  # rx literal  "gnorecase"
    add $I11, rx573_pos, 9
    gt $I11, rx573_eos, rx573_fail
    sub $I11, rx573_pos, rx573_off
    substr $S10, rx573_tgt, $I11, 9
    ne $S10, "gnorecase", rx573_fail
    add rx573_pos, 9
    set_addr $I10, rxquantr578_done
    (rx573_rep) = rx573_cur."!mark_commit"($I10)
  rxquantr578_done:
  # rx pass
    rx573_cur."!cursor_pass"(rx573_pos, "mod_ident:sym<ignorecase>")
    if_null rx573_debug, debug_472
    rx573_cur."!cursor_debug"("PASS", "mod_ident:sym<ignorecase>", " at pos=", rx573_pos)
  debug_472:
    .return (rx573_cur)
  rx573_restart:
.annotate 'line', 3
    if_null rx573_debug, debug_473
    rx573_cur."!cursor_debug"("NEXT", "mod_ident:sym<ignorecase>")
  debug_473:
  rx573_fail:
    (rx573_rep, rx573_pos, $I10, $P10) = rx573_cur."!mark_fail"(0)
    lt rx573_pos, -1, rx573_done
    eq rx573_pos, -1, rx573_fail
    jump $I10
  rx573_done:
    rx573_cur."!cursor_fail"()
    if_null rx573_debug, debug_474
    rx573_cur."!cursor_debug"("FAIL", "mod_ident:sym<ignorecase>")
  debug_474:
    .return (rx573_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident:sym<ignorecase>"  :subid("162_1283874333.85778") :method
.annotate 'line', 3
    new $P575, "ResizablePMCArray"
    push $P575, "i"
    .return ($P575)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ratchet>"  :subid("163_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx580_tgt
    .local int rx580_pos
    .local int rx580_off
    .local int rx580_eos
    .local int rx580_rep
    .local pmc rx580_cur
    .local pmc rx580_debug
    (rx580_cur, rx580_pos, rx580_tgt, $I10) = self."!cursor_start"()
    getattribute rx580_debug, rx580_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx580_cur
    .local pmc match
    .lex "$/", match
    length rx580_eos, rx580_tgt
    gt rx580_pos, rx580_eos, rx580_done
    set rx580_off, 0
    lt rx580_pos, 2, rx580_start
    sub rx580_off, rx580_pos, 1
    substr rx580_tgt, rx580_tgt, rx580_off
  rx580_start:
    eq $I10, 1, rx580_restart
    if_null rx580_debug, debug_475
    rx580_cur."!cursor_debug"("START", "mod_ident:sym<ratchet>")
  debug_475:
    $I10 = self.'from'()
    ne $I10, -1, rxscan583_done
    goto rxscan583_scan
  rxscan583_loop:
    ($P10) = rx580_cur."from"()
    inc $P10
    set rx580_pos, $P10
    ge rx580_pos, rx580_eos, rxscan583_done
  rxscan583_scan:
    set_addr $I10, rxscan583_loop
    rx580_cur."!mark_push"(0, rx580_pos, $I10)
  rxscan583_done:
.annotate 'line', 196
  # rx subcapture "sym"
    set_addr $I10, rxcap_584_fail
    rx580_cur."!mark_push"(0, rx580_pos, $I10)
  # rx literal  "r"
    add $I11, rx580_pos, 1
    gt $I11, rx580_eos, rx580_fail
    sub $I11, rx580_pos, rx580_off
    ord $I11, rx580_tgt, $I11
    ne $I11, 114, rx580_fail
    add rx580_pos, 1
    set_addr $I10, rxcap_584_fail
    ($I12, $I11) = rx580_cur."!mark_peek"($I10)
    rx580_cur."!cursor_pos"($I11)
    ($P10) = rx580_cur."!cursor_start"()
    $P10."!cursor_pass"(rx580_pos, "")
    rx580_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_584_done
  rxcap_584_fail:
    goto rx580_fail
  rxcap_584_done:
  # rx rxquantr585 ** 0..1
    set_addr $I10, rxquantr585_done
    rx580_cur."!mark_push"(0, rx580_pos, $I10)
  rxquantr585_loop:
  # rx literal  "atchet"
    add $I11, rx580_pos, 6
    gt $I11, rx580_eos, rx580_fail
    sub $I11, rx580_pos, rx580_off
    substr $S10, rx580_tgt, $I11, 6
    ne $S10, "atchet", rx580_fail
    add rx580_pos, 6
    set_addr $I10, rxquantr585_done
    (rx580_rep) = rx580_cur."!mark_commit"($I10)
  rxquantr585_done:
  # rx pass
    rx580_cur."!cursor_pass"(rx580_pos, "mod_ident:sym<ratchet>")
    if_null rx580_debug, debug_476
    rx580_cur."!cursor_debug"("PASS", "mod_ident:sym<ratchet>", " at pos=", rx580_pos)
  debug_476:
    .return (rx580_cur)
  rx580_restart:
.annotate 'line', 3
    if_null rx580_debug, debug_477
    rx580_cur."!cursor_debug"("NEXT", "mod_ident:sym<ratchet>")
  debug_477:
  rx580_fail:
    (rx580_rep, rx580_pos, $I10, $P10) = rx580_cur."!mark_fail"(0)
    lt rx580_pos, -1, rx580_done
    eq rx580_pos, -1, rx580_fail
    jump $I10
  rx580_done:
    rx580_cur."!cursor_fail"()
    if_null rx580_debug, debug_478
    rx580_cur."!cursor_debug"("FAIL", "mod_ident:sym<ratchet>")
  debug_478:
    .return (rx580_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident:sym<ratchet>"  :subid("164_1283874333.85778") :method
.annotate 'line', 3
    new $P582, "ResizablePMCArray"
    push $P582, "r"
    .return ($P582)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<sigspace>"  :subid("165_1283874333.85778") :method :outer("11_1283874333.85778")
.annotate 'line', 3
    .local string rx587_tgt
    .local int rx587_pos
    .local int rx587_off
    .local int rx587_eos
    .local int rx587_rep
    .local pmc rx587_cur
    .local pmc rx587_debug
    (rx587_cur, rx587_pos, rx587_tgt, $I10) = self."!cursor_start"()
    getattribute rx587_debug, rx587_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx587_cur
    .local pmc match
    .lex "$/", match
    length rx587_eos, rx587_tgt
    gt rx587_pos, rx587_eos, rx587_done
    set rx587_off, 0
    lt rx587_pos, 2, rx587_start
    sub rx587_off, rx587_pos, 1
    substr rx587_tgt, rx587_tgt, rx587_off
  rx587_start:
    eq $I10, 1, rx587_restart
    if_null rx587_debug, debug_479
    rx587_cur."!cursor_debug"("START", "mod_ident:sym<sigspace>")
  debug_479:
    $I10 = self.'from'()
    ne $I10, -1, rxscan590_done
    goto rxscan590_scan
  rxscan590_loop:
    ($P10) = rx587_cur."from"()
    inc $P10
    set rx587_pos, $P10
    ge rx587_pos, rx587_eos, rxscan590_done
  rxscan590_scan:
    set_addr $I10, rxscan590_loop
    rx587_cur."!mark_push"(0, rx587_pos, $I10)
  rxscan590_done:
.annotate 'line', 197
  # rx subcapture "sym"
    set_addr $I10, rxcap_591_fail
    rx587_cur."!mark_push"(0, rx587_pos, $I10)
  # rx literal  "s"
    add $I11, rx587_pos, 1
    gt $I11, rx587_eos, rx587_fail
    sub $I11, rx587_pos, rx587_off
    ord $I11, rx587_tgt, $I11
    ne $I11, 115, rx587_fail
    add rx587_pos, 1
    set_addr $I10, rxcap_591_fail
    ($I12, $I11) = rx587_cur."!mark_peek"($I10)
    rx587_cur."!cursor_pos"($I11)
    ($P10) = rx587_cur."!cursor_start"()
    $P10."!cursor_pass"(rx587_pos, "")
    rx587_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_591_done
  rxcap_591_fail:
    goto rx587_fail
  rxcap_591_done:
  # rx rxquantr592 ** 0..1
    set_addr $I10, rxquantr592_done
    rx587_cur."!mark_push"(0, rx587_pos, $I10)
  rxquantr592_loop:
  # rx literal  "igspace"
    add $I11, rx587_pos, 7
    gt $I11, rx587_eos, rx587_fail
    sub $I11, rx587_pos, rx587_off
    substr $S10, rx587_tgt, $I11, 7
    ne $S10, "igspace", rx587_fail
    add rx587_pos, 7
    set_addr $I10, rxquantr592_done
    (rx587_rep) = rx587_cur."!mark_commit"($I10)
  rxquantr592_done:
  # rx pass
    rx587_cur."!cursor_pass"(rx587_pos, "mod_ident:sym<sigspace>")
    if_null rx587_debug, debug_480
    rx587_cur."!cursor_debug"("PASS", "mod_ident:sym<sigspace>", " at pos=", rx587_pos)
  debug_480:
    .return (rx587_cur)
  rx587_restart:
.annotate 'line', 3
    if_null rx587_debug, debug_481
    rx587_cur."!cursor_debug"("NEXT", "mod_ident:sym<sigspace>")
  debug_481:
  rx587_fail:
    (rx587_rep, rx587_pos, $I10, $P10) = rx587_cur."!mark_fail"(0)
    lt rx587_pos, -1, rx587_done
    eq rx587_pos, -1, rx587_fail
    jump $I10
  rx587_done:
    rx587_cur."!cursor_fail"()
    if_null rx587_debug, debug_482
    rx587_cur."!cursor_debug"("FAIL", "mod_ident:sym<sigspace>")
  debug_482:
    .return (rx587_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident:sym<sigspace>"  :subid("166_1283874333.85778") :method
.annotate 'line', 3
    new $P589, "ResizablePMCArray"
    push $P589, "s"
    .return ($P589)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block593" :load :anon :subid("167_1283874333.85778")
.annotate 'line', 3
    .const 'Sub' $P595 = "11_1283874333.85778" 
    $P596 = $P595()
    .return ($P596)
.end


.namespace []
.sub "_block598" :load :anon :subid("168_1283874333.85778")
.annotate 'line', 1
    .const 'Sub' $P600 = "10_1283874333.85778" 
    $P601 = $P600()
    .return ($P601)
.end

### .include 'gen/p6regex-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1283874338.99425")
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
    $P1671 = $P14()
.annotate 'line', 1
    .return ($P1671)
    .const 'Sub' $P1673 = "94_1283874338.99425" 
    .return ($P1673)
.end


.namespace []
.sub "" :load :init :subid("post95") :outer("10_1283874338.99425")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1283874338.99425" 
    .local pmc block
    set block, $P12
    $P1676 = get_root_global ["parrot"], "P6metaclass"
    $P1676."new_class"("Regex::P6Regex::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block13"  :subid("11_1283874338.99425") :outer("10_1283874338.99425")
.annotate 'line', 4
    .const 'Sub' $P1648 = "92_1283874338.99425" 
    capture_lex $P1648
    .const 'Sub' $P1628 = "91_1283874338.99425" 
    capture_lex $P1628
    .const 'Sub' $P1596 = "90_1283874338.99425" 
    capture_lex $P1596
    .const 'Sub' $P1527 = "86_1283874338.99425" 
    capture_lex $P1527
    .const 'Sub' $P1459 = "84_1283874338.99425" 
    capture_lex $P1459
    .const 'Sub' $P1387 = "81_1283874338.99425" 
    capture_lex $P1387
    .const 'Sub' $P1373 = "80_1283874338.99425" 
    capture_lex $P1373
    .const 'Sub' $P1349 = "79_1283874338.99425" 
    capture_lex $P1349
    .const 'Sub' $P1331 = "78_1283874338.99425" 
    capture_lex $P1331
    .const 'Sub' $P1317 = "77_1283874338.99425" 
    capture_lex $P1317
    .const 'Sub' $P1304 = "76_1283874338.99425" 
    capture_lex $P1304
    .const 'Sub' $P1273 = "75_1283874338.99425" 
    capture_lex $P1273
    .const 'Sub' $P1242 = "74_1283874338.99425" 
    capture_lex $P1242
    .const 'Sub' $P1226 = "73_1283874338.99425" 
    capture_lex $P1226
    .const 'Sub' $P1210 = "72_1283874338.99425" 
    capture_lex $P1210
    .const 'Sub' $P1194 = "71_1283874338.99425" 
    capture_lex $P1194
    .const 'Sub' $P1178 = "70_1283874338.99425" 
    capture_lex $P1178
    .const 'Sub' $P1162 = "69_1283874338.99425" 
    capture_lex $P1162
    .const 'Sub' $P1146 = "68_1283874338.99425" 
    capture_lex $P1146
    .const 'Sub' $P1130 = "67_1283874338.99425" 
    capture_lex $P1130
    .const 'Sub' $P1106 = "66_1283874338.99425" 
    capture_lex $P1106
    .const 'Sub' $P1091 = "65_1283874338.99425" 
    capture_lex $P1091
    .const 'Sub' $P1033 = "64_1283874338.99425" 
    capture_lex $P1033
    .const 'Sub' $P1012 = "63_1283874338.99425" 
    capture_lex $P1012
    .const 'Sub' $P990 = "62_1283874338.99425" 
    capture_lex $P990
    .const 'Sub' $P980 = "61_1283874338.99425" 
    capture_lex $P980
    .const 'Sub' $P970 = "60_1283874338.99425" 
    capture_lex $P970
    .const 'Sub' $P960 = "59_1283874338.99425" 
    capture_lex $P960
    .const 'Sub' $P948 = "58_1283874338.99425" 
    capture_lex $P948
    .const 'Sub' $P936 = "57_1283874338.99425" 
    capture_lex $P936
    .const 'Sub' $P924 = "56_1283874338.99425" 
    capture_lex $P924
    .const 'Sub' $P912 = "55_1283874338.99425" 
    capture_lex $P912
    .const 'Sub' $P900 = "54_1283874338.99425" 
    capture_lex $P900
    .const 'Sub' $P888 = "53_1283874338.99425" 
    capture_lex $P888
    .const 'Sub' $P876 = "52_1283874338.99425" 
    capture_lex $P876
    .const 'Sub' $P864 = "51_1283874338.99425" 
    capture_lex $P864
    .const 'Sub' $P836 = "50_1283874338.99425" 
    capture_lex $P836
    .const 'Sub' $P808 = "49_1283874338.99425" 
    capture_lex $P808
    .const 'Sub' $P790 = "48_1283874338.99425" 
    capture_lex $P790
    .const 'Sub' $P780 = "47_1283874338.99425" 
    capture_lex $P780
    .const 'Sub' $P762 = "46_1283874338.99425" 
    capture_lex $P762
    .const 'Sub' $P689 = "44_1283874338.99425" 
    capture_lex $P689
    .const 'Sub' $P672 = "43_1283874338.99425" 
    capture_lex $P672
    .const 'Sub' $P657 = "42_1283874338.99425" 
    capture_lex $P657
    .const 'Sub' $P642 = "41_1283874338.99425" 
    capture_lex $P642
    .const 'Sub' $P616 = "40_1283874338.99425" 
    capture_lex $P616
    .const 'Sub' $P565 = "38_1283874338.99425" 
    capture_lex $P565
    .const 'Sub' $P497 = "36_1283874338.99425" 
    capture_lex $P497
    .const 'Sub' $P460 = "34_1283874338.99425" 
    capture_lex $P460
    .const 'Sub' $P404 = "31_1283874338.99425" 
    capture_lex $P404
    .const 'Sub' $P389 = "30_1283874338.99425" 
    capture_lex $P389
    .const 'Sub' $P363 = "28_1283874338.99425" 
    capture_lex $P363
    .const 'Sub' $P346 = "27_1283874338.99425" 
    capture_lex $P346
    .const 'Sub' $P312 = "26_1283874338.99425" 
    capture_lex $P312
    .const 'Sub' $P57 = "13_1283874338.99425" 
    capture_lex $P57
    .const 'Sub' $P16 = "12_1283874338.99425" 
    capture_lex $P16
    get_global $P15, "@MODIFIERS"
    unless_null $P15, vivify_97
    $P15 = root_new ['parrot';'ResizablePMCArray']
    set_global "@MODIFIERS", $P15
  vivify_97:
.annotate 'line', 506
    .const 'Sub' $P16 = "12_1283874338.99425" 
    newclosure $P56, $P16
    .lex "buildsub", $P56
.annotate 'line', 524
    .const 'Sub' $P57 = "13_1283874338.99425" 
    newclosure $P311, $P57
    .lex "capnames", $P311
.annotate 'line', 590
    .const 'Sub' $P312 = "26_1283874338.99425" 
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
.annotate 'line', 499
    find_lex $P1625, "buildsub"
    find_lex $P1626, "capnames"
    find_lex $P1627, "backmod"
.annotate 'line', 603
    .const 'Sub' $P1648 = "92_1283874338.99425" 
    newclosure $P1665, $P1648
.annotate 'line', 4
    .return ($P1665)
    .const 'Sub' $P1667 = "93_1283874338.99425" 
    .return ($P1667)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "" :load :init :subid("post96") :outer("11_1283874338.99425")
.annotate 'line', 4
    get_hll_global $P14, ["Regex";"P6Regex";"Actions"], "_block13" 
    .local pmc block
    set block, $P14
.annotate 'line', 7

        $P1670 = new ['ResizablePMCArray']
        $P0 = new ['Hash']
        push $P1670, $P0
    
    set_global "@MODIFIERS", $P1670
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "buildsub"  :subid("12_1283874338.99425") :outer("11_1283874338.99425")
    .param pmc param_19
    .param pmc param_20 :optional
    .param int has_param_20 :opt_flag
.annotate 'line', 506
    new $P18, 'ExceptionHandler'
    set_addr $P18, control_17
    $P18."handle_types"(.CONTROL_RETURN)
    push_eh $P18
    .lex "$rpast", param_19
    if has_param_20, optparam_98
    get_hll_global $P21, ["PAST"], "Block"
    $P22 = $P21."new"()
    set param_20, $P22
  optparam_98:
    .lex "$block", param_20
.annotate 'line', 507
    $P23 = root_new ['parrot';'Hash']
    .lex "%capnames", $P23
    find_lex $P24, "$rpast"
    $P25 = "capnames"($P24, 0)
    store_lex "%capnames", $P25
.annotate 'line', 508
    new $P26, "Integer"
    assign $P26, 0
    find_lex $P27, "%capnames"
    unless_null $P27, vivify_99
    $P27 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P27
  vivify_99:
    set $P27[""], $P26
.annotate 'line', 509
    get_hll_global $P28, ["PAST"], "Regex"
.annotate 'line', 510
    get_hll_global $P29, ["PAST"], "Regex"
    $P30 = $P29."new"("scan" :named("pasttype"))
    find_lex $P31, "$rpast"
.annotate 'line', 512
    get_hll_global $P32, ["PAST"], "Regex"
.annotate 'line', 513
    get_global $P35, "@MODIFIERS"
    unless_null $P35, vivify_100
    $P35 = root_new ['parrot';'ResizablePMCArray']
  vivify_100:
    set $P36, $P35[0]
    unless_null $P36, vivify_101
    $P36 = root_new ['parrot';'Hash']
  vivify_101:
    set $P37, $P36["r"]
    unless_null $P37, vivify_102
    new $P37, "Undef"
  vivify_102:
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
.annotate 'line', 512
    find_lex $P41, "%capnames"
    $P42 = $P28."new"($P30, $P31, $P40, "concat" :named("pasttype"), $P41 :named("capnames"))
.annotate 'line', 509
    store_lex "$rpast", $P42
.annotate 'line', 517
    find_lex $P44, "$block"
    $P45 = $P44."symbol"(unicode:"$\x{a2}")
    if $P45, unless_43_end
    find_lex $P46, "$block"
    $P46."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
  unless_43_end:
.annotate 'line', 518
    find_lex $P48, "$block"
    $P49 = $P48."symbol"("$/")
    if $P49, unless_47_end
    find_lex $P50, "$block"
    $P50."symbol"("$/", "lexical" :named("scope"))
  unless_47_end:
.annotate 'line', 519
    find_lex $P51, "$block"
    find_lex $P52, "$rpast"
    $P51."push"($P52)
.annotate 'line', 520
    find_lex $P53, "$block"
    $P53."blocktype"("method")
    find_lex $P54, "$block"
.annotate 'line', 506
    .return ($P54)
  control_17:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P55, exception, "payload"
    .return ($P55)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "capnames"  :subid("13_1283874338.99425") :outer("11_1283874338.99425")
    .param pmc param_60
    .param pmc param_61
.annotate 'line', 524
    .const 'Sub' $P286 = "24_1283874338.99425" 
    capture_lex $P286
    .const 'Sub' $P223 = "21_1283874338.99425" 
    capture_lex $P223
    .const 'Sub' $P181 = "19_1283874338.99425" 
    capture_lex $P181
    .const 'Sub' $P139 = "17_1283874338.99425" 
    capture_lex $P139
    .const 'Sub' $P72 = "14_1283874338.99425" 
    capture_lex $P72
    new $P59, 'ExceptionHandler'
    set_addr $P59, control_58
    $P59."handle_types"(.CONTROL_RETURN)
    push_eh $P59
    .lex "$ast", param_60
    .lex "$count", param_61
.annotate 'line', 525
    $P62 = root_new ['parrot';'Hash']
    .lex "%capnames", $P62
.annotate 'line', 526
    new $P63, "Undef"
    .lex "$pasttype", $P63
.annotate 'line', 524
    find_lex $P64, "%capnames"
.annotate 'line', 526
    find_lex $P65, "$ast"
    $P66 = $P65."pasttype"()
    store_lex "$pasttype", $P66
.annotate 'line', 527
    find_lex $P68, "$pasttype"
    set $S69, $P68
    iseq $I70, $S69, "alt"
    if $I70, if_67
.annotate 'line', 540
    find_lex $P130, "$pasttype"
    set $S131, $P130
    iseq $I132, $S131, "concat"
    if $I132, if_129
.annotate 'line', 549
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
.annotate 'line', 562
    find_lex $P219, "$pasttype"
    set $S220, $P219
    iseq $I221, $S220, "subcapture"
    if $I221, if_218
.annotate 'line', 579
    find_lex $P282, "$pasttype"
    set $S283, $P282
    iseq $I284, $S283, "quant"
    unless $I284, if_281_end
    .const 'Sub' $P286 = "24_1283874338.99425" 
    capture_lex $P286
    $P286()
  if_281_end:
    goto if_218_end
  if_218:
.annotate 'line', 562
    .const 'Sub' $P223 = "21_1283874338.99425" 
    capture_lex $P223
    $P223()
  if_218_end:
    goto if_171_end
  if_171:
.annotate 'line', 549
    .const 'Sub' $P181 = "19_1283874338.99425" 
    capture_lex $P181
    $P181()
  if_171_end:
    goto if_129_end
  if_129:
.annotate 'line', 541
    find_lex $P134, "$ast"
    $P135 = $P134."list"()
    defined $I136, $P135
    unless $I136, for_undef_123
    iter $P133, $P135
    new $P169, 'ExceptionHandler'
    set_addr $P169, loop168_handler
    $P169."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P169
  loop168_test:
    unless $P133, loop168_done
    shift $P137, $P133
  loop168_redo:
    .const 'Sub' $P139 = "17_1283874338.99425" 
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
  for_undef_123:
  if_129_end:
.annotate 'line', 540
    goto if_67_end
  if_67:
.annotate 'line', 527
    .const 'Sub' $P72 = "14_1283874338.99425" 
    capture_lex $P72
    $P72()
  if_67_end:
.annotate 'line', 586
    find_lex $P307, "$count"
    find_lex $P308, "%capnames"
    unless_null $P308, vivify_143
    $P308 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P308
  vivify_143:
    set $P308[""], $P307
    find_lex $P309, "%capnames"
.annotate 'line', 524
    .return ($P309)
  control_58:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P310, exception, "payload"
    .return ($P310)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "_block285"  :anon :subid("24_1283874338.99425") :outer("13_1283874338.99425")
.annotate 'line', 579
    .const 'Sub' $P297 = "25_1283874338.99425" 
    capture_lex $P297
.annotate 'line', 580
    $P287 = root_new ['parrot';'Hash']
    .lex "%astcap", $P287
    find_lex $P288, "$ast"
    unless_null $P288, vivify_103
    $P288 = root_new ['parrot';'ResizablePMCArray']
  vivify_103:
    set $P289, $P288[0]
    unless_null $P289, vivify_104
    new $P289, "Undef"
  vivify_104:
    find_lex $P290, "$count"
    $P291 = "capnames"($P289, $P290)
    store_lex "%astcap", $P291
.annotate 'line', 581
    find_lex $P293, "%astcap"
    defined $I294, $P293
    unless $I294, for_undef_105
    iter $P292, $P293
    new $P303, 'ExceptionHandler'
    set_addr $P303, loop302_handler
    $P303."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P303
  loop302_test:
    unless $P292, loop302_done
    shift $P295, $P292
  loop302_redo:
    .const 'Sub' $P297 = "25_1283874338.99425" 
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
  for_undef_105:
.annotate 'line', 584
    find_lex $P305, "%astcap"
    unless_null $P305, vivify_107
    $P305 = root_new ['parrot';'Hash']
  vivify_107:
    set $P306, $P305[""]
    unless_null $P306, vivify_108
    new $P306, "Undef"
  vivify_108:
    store_lex "$count", $P306
.annotate 'line', 579
    .return ($P306)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block296"  :anon :subid("25_1283874338.99425") :outer("24_1283874338.99425")
    .param pmc param_298
.annotate 'line', 581
    .lex "$_", param_298
.annotate 'line', 582
    new $P299, "Integer"
    assign $P299, 2
    find_lex $P300, "$_"
    find_lex $P301, "%capnames"
    unless_null $P301, vivify_106
    $P301 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P301
  vivify_106:
    set $P301[$P300], $P299
.annotate 'line', 581
    .return ($P299)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "_block222"  :anon :subid("21_1283874338.99425") :outer("13_1283874338.99425")
.annotate 'line', 562
    .const 'Sub' $P263 = "23_1283874338.99425" 
    capture_lex $P263
    .const 'Sub' $P235 = "22_1283874338.99425" 
    capture_lex $P235
.annotate 'line', 563
    new $P224, "Undef"
    .lex "$name", $P224
.annotate 'line', 564
    $P225 = root_new ['parrot';'ResizablePMCArray']
    .lex "@names", $P225
.annotate 'line', 573
    $P226 = root_new ['parrot';'Hash']
    .lex "%x", $P226
.annotate 'line', 563
    find_lex $P227, "$ast"
    $P228 = $P227."name"()
    store_lex "$name", $P228
.annotate 'line', 564

            $P0 = find_lex '$name'
            $S0 = $P0
            $P229 = split '=', $S0
        
    store_lex "@names", $P229
.annotate 'line', 569
    find_lex $P231, "@names"
    defined $I232, $P231
    unless $I232, for_undef_109
    iter $P230, $P231
    new $P252, 'ExceptionHandler'
    set_addr $P252, loop251_handler
    $P252."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P252
  loop251_test:
    unless $P230, loop251_done
    shift $P233, $P230
  loop251_redo:
    .const 'Sub' $P235 = "22_1283874338.99425" 
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
  for_undef_109:
.annotate 'line', 573
    find_lex $P254, "$ast"
    unless_null $P254, vivify_111
    $P254 = root_new ['parrot';'ResizablePMCArray']
  vivify_111:
    set $P255, $P254[0]
    unless_null $P255, vivify_112
    new $P255, "Undef"
  vivify_112:
    find_lex $P256, "$count"
    $P257 = "capnames"($P255, $P256)
    store_lex "%x", $P257
.annotate 'line', 574
    find_lex $P259, "%x"
    defined $I260, $P259
    unless $I260, for_undef_113
    iter $P258, $P259
    new $P277, 'ExceptionHandler'
    set_addr $P277, loop276_handler
    $P277."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P277
  loop276_test:
    unless $P258, loop276_done
    shift $P261, $P258
  loop276_redo:
    .const 'Sub' $P263 = "23_1283874338.99425" 
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
  for_undef_113:
.annotate 'line', 577
    find_lex $P279, "%x"
    unless_null $P279, vivify_119
    $P279 = root_new ['parrot';'Hash']
  vivify_119:
    set $P280, $P279[""]
    unless_null $P280, vivify_120
    new $P280, "Undef"
  vivify_120:
    store_lex "$count", $P280
.annotate 'line', 562
    .return ($P280)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block234"  :anon :subid("22_1283874338.99425") :outer("21_1283874338.99425")
    .param pmc param_236
.annotate 'line', 569
    .lex "$_", param_236
.annotate 'line', 570
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
.annotate 'line', 571
    new $P248, "Integer"
    assign $P248, 1
    find_lex $P249, "$_"
    find_lex $P250, "%capnames"
    unless_null $P250, vivify_110
    $P250 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P250
  vivify_110:
    set $P250[$P249], $P248
.annotate 'line', 569
    .return ($P248)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block262"  :anon :subid("23_1283874338.99425") :outer("21_1283874338.99425")
    .param pmc param_264
.annotate 'line', 574
    .lex "$_", param_264
.annotate 'line', 575
    find_lex $P265, "$_"
    find_lex $P266, "%capnames"
    unless_null $P266, vivify_114
    $P266 = root_new ['parrot';'Hash']
  vivify_114:
    set $P267, $P266[$P265]
    unless_null $P267, vivify_115
    new $P267, "Undef"
  vivify_115:
    set $N268, $P267
    new $P269, 'Float'
    set $P269, $N268
    find_lex $P270, "$_"
    find_lex $P271, "%x"
    unless_null $P271, vivify_116
    $P271 = root_new ['parrot';'Hash']
  vivify_116:
    set $P272, $P271[$P270]
    unless_null $P272, vivify_117
    new $P272, "Undef"
  vivify_117:
    add $P273, $P269, $P272
    find_lex $P274, "$_"
    find_lex $P275, "%capnames"
    unless_null $P275, vivify_118
    $P275 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P275
  vivify_118:
    set $P275[$P274], $P273
.annotate 'line', 574
    .return ($P273)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "_block180"  :anon :subid("19_1283874338.99425") :outer("13_1283874338.99425")
.annotate 'line', 549
    .const 'Sub' $P199 = "20_1283874338.99425" 
    capture_lex $P199
.annotate 'line', 550
    new $P182, "Undef"
    .lex "$name", $P182
.annotate 'line', 552
    $P183 = root_new ['parrot';'ResizablePMCArray']
    .lex "@names", $P183
.annotate 'line', 550
    find_lex $P184, "$ast"
    $P185 = $P184."name"()
    store_lex "$name", $P185
.annotate 'line', 551
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
.annotate 'line', 552

            $P0 = find_lex '$name'
            $S0 = $P0
            $P193 = split '=', $S0
        
    store_lex "@names", $P193
.annotate 'line', 557
    find_lex $P195, "@names"
    defined $I196, $P195
    unless $I196, for_undef_121
    iter $P194, $P195
    new $P216, 'ExceptionHandler'
    set_addr $P216, loop215_handler
    $P216."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P216
  loop215_test:
    unless $P194, loop215_done
    shift $P197, $P194
  loop215_redo:
    .const 'Sub' $P199 = "20_1283874338.99425" 
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
  for_undef_121:
.annotate 'line', 549
    .return ($P194)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block198"  :anon :subid("20_1283874338.99425") :outer("19_1283874338.99425")
    .param pmc param_200
.annotate 'line', 557
    .lex "$_", param_200
.annotate 'line', 558
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
.annotate 'line', 559
    new $P212, "Integer"
    assign $P212, 1
    find_lex $P213, "$_"
    find_lex $P214, "%capnames"
    unless_null $P214, vivify_122
    $P214 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P214
  vivify_122:
    set $P214[$P213], $P212
.annotate 'line', 557
    .return ($P212)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "_block138"  :anon :subid("17_1283874338.99425") :outer("13_1283874338.99425")
    .param pmc param_141
.annotate 'line', 541
    .const 'Sub' $P150 = "18_1283874338.99425" 
    capture_lex $P150
.annotate 'line', 542
    $P140 = root_new ['parrot';'Hash']
    .lex "%x", $P140
    .lex "$_", param_141
    find_lex $P142, "$_"
    find_lex $P143, "$count"
    $P144 = "capnames"($P142, $P143)
    store_lex "%x", $P144
.annotate 'line', 543
    find_lex $P146, "%x"
    defined $I147, $P146
    unless $I147, for_undef_124
    iter $P145, $P146
    new $P164, 'ExceptionHandler'
    set_addr $P164, loop163_handler
    $P164."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P164
  loop163_test:
    unless $P145, loop163_done
    shift $P148, $P145
  loop163_redo:
    .const 'Sub' $P150 = "18_1283874338.99425" 
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
  for_undef_124:
.annotate 'line', 546
    find_lex $P166, "%x"
    unless_null $P166, vivify_130
    $P166 = root_new ['parrot';'Hash']
  vivify_130:
    set $P167, $P166[""]
    unless_null $P167, vivify_131
    new $P167, "Undef"
  vivify_131:
    store_lex "$count", $P167
.annotate 'line', 541
    .return ($P167)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block149"  :anon :subid("18_1283874338.99425") :outer("17_1283874338.99425")
    .param pmc param_151
.annotate 'line', 543
    .lex "$_", param_151
.annotate 'line', 544
    find_lex $P152, "$_"
    find_lex $P153, "%capnames"
    unless_null $P153, vivify_125
    $P153 = root_new ['parrot';'Hash']
  vivify_125:
    set $P154, $P153[$P152]
    unless_null $P154, vivify_126
    new $P154, "Undef"
  vivify_126:
    set $N155, $P154
    new $P156, 'Float'
    set $P156, $N155
    find_lex $P157, "$_"
    find_lex $P158, "%x"
    unless_null $P158, vivify_127
    $P158 = root_new ['parrot';'Hash']
  vivify_127:
    set $P159, $P158[$P157]
    unless_null $P159, vivify_128
    new $P159, "Undef"
  vivify_128:
    add $P160, $P156, $P159
    find_lex $P161, "$_"
    find_lex $P162, "%capnames"
    unless_null $P162, vivify_129
    $P162 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P162
  vivify_129:
    set $P162[$P161], $P160
.annotate 'line', 543
    .return ($P160)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "_block71"  :anon :subid("14_1283874338.99425") :outer("13_1283874338.99425")
.annotate 'line', 527
    .const 'Sub' $P81 = "15_1283874338.99425" 
    capture_lex $P81
.annotate 'line', 528
    new $P73, "Undef"
    .lex "$max", $P73
    find_lex $P74, "$count"
    store_lex "$max", $P74
.annotate 'line', 529
    find_lex $P76, "$ast"
    $P77 = $P76."list"()
    defined $I78, $P77
    unless $I78, for_undef_132
    iter $P75, $P77
    new $P126, 'ExceptionHandler'
    set_addr $P126, loop125_handler
    $P126."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P126
  loop125_test:
    unless $P75, loop125_done
    shift $P79, $P75
  loop125_redo:
    .const 'Sub' $P81 = "15_1283874338.99425" 
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
  for_undef_132:
.annotate 'line', 538
    find_lex $P128, "$max"
    store_lex "$count", $P128
.annotate 'line', 527
    .return ($P128)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "_block80"  :anon :subid("15_1283874338.99425") :outer("14_1283874338.99425")
    .param pmc param_83
.annotate 'line', 529
    .const 'Sub' $P92 = "16_1283874338.99425" 
    capture_lex $P92
.annotate 'line', 530
    $P82 = root_new ['parrot';'Hash']
    .lex "%x", $P82
    .lex "$_", param_83
    find_lex $P84, "$_"
    find_lex $P85, "$count"
    $P86 = "capnames"($P84, $P85)
    store_lex "%x", $P86
.annotate 'line', 531
    find_lex $P88, "%x"
    defined $I89, $P88
    unless $I89, for_undef_133
    iter $P87, $P88
    new $P113, 'ExceptionHandler'
    set_addr $P113, loop112_handler
    $P113."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P113
  loop112_test:
    unless $P87, loop112_done
    shift $P90, $P87
  loop112_redo:
    .const 'Sub' $P92 = "16_1283874338.99425" 
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
  for_undef_133:
.annotate 'line', 536
    find_lex $P117, "%x"
    unless_null $P117, vivify_139
    $P117 = root_new ['parrot';'Hash']
  vivify_139:
    set $P118, $P117[""]
    unless_null $P118, vivify_140
    new $P118, "Undef"
  vivify_140:
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
    unless_null $P123, vivify_141
    $P123 = root_new ['parrot';'Hash']
  vivify_141:
    set $P124, $P123[""]
    unless_null $P124, vivify_142
    new $P124, "Undef"
  vivify_142:
    store_lex "$max", $P124
    set $P115, $P124
  if_116_end:
.annotate 'line', 529
    .return ($P115)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block91"  :anon :subid("16_1283874338.99425") :outer("15_1283874338.99425")
    .param pmc param_93
.annotate 'line', 531
    .lex "$_", param_93
.annotate 'line', 532
    find_lex $P98, "$_"
    find_lex $P99, "%capnames"
    unless_null $P99, vivify_134
    $P99 = root_new ['parrot';'Hash']
  vivify_134:
    set $P100, $P99[$P98]
    unless_null $P100, vivify_135
    new $P100, "Undef"
  vivify_135:
    set $N101, $P100
    islt $I102, $N101, 2.0
    if $I102, if_97
    new $P96, 'Integer'
    set $P96, $I102
    goto if_97_end
  if_97:
    find_lex $P103, "$_"
    find_lex $P104, "%x"
    unless_null $P104, vivify_136
    $P104 = root_new ['parrot';'Hash']
  vivify_136:
    set $P105, $P104[$P103]
    unless_null $P105, vivify_137
    new $P105, "Undef"
  vivify_137:
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
.annotate 'line', 533
    find_lex $P110, "$_"
    find_lex $P111, "%capnames"
    unless_null $P111, vivify_138
    $P111 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P111
  vivify_138:
    set $P111[$P110], $P94
.annotate 'line', 531
    .return ($P94)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backmod"  :subid("26_1283874338.99425") :outer("11_1283874338.99425")
    .param pmc param_315
    .param pmc param_316
.annotate 'line', 590
    new $P314, 'ExceptionHandler'
    set_addr $P314, control_313
    $P314."handle_types"(.CONTROL_RETURN)
    push_eh $P314
    .lex "$ast", param_315
    .lex "$backmod", param_316
.annotate 'line', 591
    find_lex $P318, "$backmod"
    set $S319, $P318
    iseq $I320, $S319, ":"
    if $I320, if_317
.annotate 'line', 592
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
.annotate 'line', 593
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
.annotate 'line', 592
    find_lex $P331, "$ast"
    $P331."backtrack"("f")
  if_322_end:
    goto if_317_end
  if_317:
.annotate 'line', 591
    find_lex $P321, "$ast"
    $P321."backtrack"("r")
  if_317_end:
    find_lex $P342, "$ast"
.annotate 'line', 590
    .return ($P342)
  control_313:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P343, exception, "payload"
    .return ($P343)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "arg"  :subid("27_1283874338.99425") :method :outer("11_1283874338.99425")
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
    unless_null $P353, vivify_144
    $P353 = root_new ['parrot';'Hash']
  vivify_144:
    set $P354, $P353["quote_EXPR"]
    unless_null $P354, vivify_145
    new $P354, "Undef"
  vivify_145:
    if $P354, if_352
    find_lex $P358, "$/"
    unless_null $P358, vivify_146
    $P358 = root_new ['parrot';'Hash']
  vivify_146:
    set $P359, $P358["val"]
    unless_null $P359, vivify_147
    new $P359, "Undef"
  vivify_147:
    set $N360, $P359
    new $P351, 'Float'
    set $P351, $N360
    goto if_352_end
  if_352:
    find_lex $P355, "$/"
    unless_null $P355, vivify_148
    $P355 = root_new ['parrot';'Hash']
  vivify_148:
    set $P356, $P355["quote_EXPR"]
    unless_null $P356, vivify_149
    new $P356, "Undef"
  vivify_149:
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
.sub "arglist"  :subid("28_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_366
.annotate 'line', 18
    .const 'Sub' $P376 = "29_1283874338.99425" 
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
    unless_null $P371, vivify_150
    $P371 = root_new ['parrot';'Hash']
  vivify_150:
    set $P372, $P371["arg"]
    unless_null $P372, vivify_151
    new $P372, "Undef"
  vivify_151:
    defined $I373, $P372
    unless $I373, for_undef_152
    iter $P370, $P372
    new $P383, 'ExceptionHandler'
    set_addr $P383, loop382_handler
    $P383."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P383
  loop382_test:
    unless $P370, loop382_done
    shift $P374, $P370
  loop382_redo:
    .const 'Sub' $P376 = "29_1283874338.99425" 
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
  for_undef_152:
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
.sub "_block375"  :anon :subid("29_1283874338.99425") :outer("28_1283874338.99425")
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
.sub "TOP"  :subid("30_1283874338.99425") :method :outer("11_1283874338.99425")
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
    unless_null $P394, vivify_153
    $P394 = root_new ['parrot';'Hash']
  vivify_153:
    set $P395, $P394["nibbler"]
    unless_null $P395, vivify_154
    new $P395, "Undef"
  vivify_154:
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
.sub "nibbler"  :subid("31_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_407
    .param pmc param_408 :optional
    .param int has_param_408 :opt_flag
.annotate 'line', 30
    .const 'Sub' $P443 = "33_1283874338.99425" 
    capture_lex $P443
    .const 'Sub' $P416 = "32_1283874338.99425" 
    capture_lex $P416
    new $P406, 'ExceptionHandler'
    set_addr $P406, control_405
    $P406."handle_types"(.CONTROL_RETURN)
    push_eh $P406
    .lex "self", self
    .lex "$/", param_407
    if has_param_408, optparam_155
    new $P409, "Undef"
    set param_408, $P409
  optparam_155:
    .lex "$key", param_408
.annotate 'line', 39
    new $P410, "Undef"
    .lex "$past", $P410
.annotate 'line', 31
    find_lex $P412, "$key"
    set $S413, $P412
    iseq $I414, $S413, "open"
    unless $I414, if_411_end
    .const 'Sub' $P416 = "32_1283874338.99425" 
    capture_lex $P416
    $P416()
  if_411_end:
.annotate 'line', 38
    get_global $P427, "@MODIFIERS"
    $P427."shift"()
    find_lex $P428, "$past"
.annotate 'line', 40
    find_lex $P430, "$/"
    unless_null $P430, vivify_158
    $P430 = root_new ['parrot';'Hash']
  vivify_158:
    set $P431, $P430["termconj"]
    unless_null $P431, vivify_159
    new $P431, "Undef"
  vivify_159:
    set $N432, $P431
    isgt $I433, $N432, 1.0
    if $I433, if_429
.annotate 'line', 47
    find_lex $P452, "$/"
    unless_null $P452, vivify_160
    $P452 = root_new ['parrot';'Hash']
  vivify_160:
    set $P453, $P452["termconj"]
    unless_null $P453, vivify_161
    $P453 = root_new ['parrot';'ResizablePMCArray']
  vivify_161:
    set $P454, $P453[0]
    unless_null $P454, vivify_162
    new $P454, "Undef"
  vivify_162:
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
    unless_null $P438, vivify_163
    $P438 = root_new ['parrot';'Hash']
  vivify_163:
    set $P439, $P438["termconj"]
    unless_null $P439, vivify_164
    new $P439, "Undef"
  vivify_164:
    defined $I440, $P439
    unless $I440, for_undef_165
    iter $P437, $P439
    new $P450, 'ExceptionHandler'
    set_addr $P450, loop449_handler
    $P450."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P450
  loop449_test:
    unless $P437, loop449_done
    shift $P441, $P437
  loop449_redo:
    .const 'Sub' $P443 = "33_1283874338.99425" 
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
  for_undef_165:
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
.sub "_block415"  :anon :subid("32_1283874338.99425") :outer("31_1283874338.99425")
.annotate 'line', 32
    $P417 = root_new ['parrot';'Hash']
    .lex "%old", $P417
.annotate 'line', 33
    $P418 = root_new ['parrot';'Hash']
    .lex "%new", $P418
.annotate 'line', 32
    get_global $P419, "@MODIFIERS"
    unless_null $P419, vivify_156
    $P419 = root_new ['parrot';'ResizablePMCArray']
  vivify_156:
    set $P420, $P419[0]
    unless_null $P420, vivify_157
    new $P420, "Undef"
  vivify_157:
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
.sub "_block442"  :anon :subid("33_1283874338.99425") :outer("31_1283874338.99425")
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
.sub "termconj"  :subid("34_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_463
.annotate 'line', 52
    .const 'Sub' $P480 = "35_1283874338.99425" 
    capture_lex $P480
    new $P462, 'ExceptionHandler'
    set_addr $P462, control_461
    $P462."handle_types"(.CONTROL_RETURN)
    push_eh $P462
    .lex "self", self
    .lex "$/", param_463
.annotate 'line', 53
    new $P464, "Undef"
    .lex "$past", $P464
.annotate 'line', 52
    find_lex $P465, "$past"
.annotate 'line', 54
    find_lex $P467, "$/"
    unless_null $P467, vivify_166
    $P467 = root_new ['parrot';'Hash']
  vivify_166:
    set $P468, $P467["termish"]
    unless_null $P468, vivify_167
    new $P468, "Undef"
  vivify_167:
    set $N469, $P468
    isgt $I470, $N469, 1.0
    if $I470, if_466
.annotate 'line', 61
    find_lex $P489, "$/"
    unless_null $P489, vivify_168
    $P489 = root_new ['parrot';'Hash']
  vivify_168:
    set $P490, $P489["termish"]
    unless_null $P490, vivify_169
    $P490 = root_new ['parrot';'ResizablePMCArray']
  vivify_169:
    set $P491, $P490[0]
    unless_null $P491, vivify_170
    new $P491, "Undef"
  vivify_170:
    $P492 = $P491."ast"()
    store_lex "$past", $P492
.annotate 'line', 60
    goto if_466_end
  if_466:
.annotate 'line', 55
    get_hll_global $P471, ["PAST"], "Regex"
    find_lex $P472, "$/"
    $P473 = $P471."new"("conj" :named("pasttype"), $P472 :named("node"))
    store_lex "$past", $P473
.annotate 'line', 56
    find_lex $P475, "$/"
    unless_null $P475, vivify_171
    $P475 = root_new ['parrot';'Hash']
  vivify_171:
    set $P476, $P475["termish"]
    unless_null $P476, vivify_172
    new $P476, "Undef"
  vivify_172:
    defined $I477, $P476
    unless $I477, for_undef_173
    iter $P474, $P476
    new $P487, 'ExceptionHandler'
    set_addr $P487, loop486_handler
    $P487."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P487
  loop486_test:
    unless $P474, loop486_done
    shift $P478, $P474
  loop486_redo:
    .const 'Sub' $P480 = "35_1283874338.99425" 
    capture_lex $P480
    $P480($P478)
  loop486_next:
    goto loop486_test
  loop486_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P488, exception, 'type'
    eq $P488, .CONTROL_LOOP_NEXT, loop486_next
    eq $P488, .CONTROL_LOOP_REDO, loop486_redo
  loop486_done:
    pop_eh 
  for_undef_173:
  if_466_end:
.annotate 'line', 63
    find_lex $P493, "$/"
    find_lex $P494, "$past"
    $P495 = $P493."!make"($P494)
.annotate 'line', 52
    .return ($P495)
  control_461:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P496, exception, "payload"
    .return ($P496)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block479"  :anon :subid("35_1283874338.99425") :outer("34_1283874338.99425")
    .param pmc param_481
.annotate 'line', 56
    .lex "$_", param_481
.annotate 'line', 57
    find_lex $P482, "$past"
    find_lex $P483, "$_"
    $P484 = $P483."ast"()
    $P485 = $P482."push"($P484)
.annotate 'line', 56
    .return ($P485)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "termish"  :subid("36_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_500
.annotate 'line', 66
    .const 'Sub' $P513 = "37_1283874338.99425" 
    capture_lex $P513
    new $P499, 'ExceptionHandler'
    set_addr $P499, control_498
    $P499."handle_types"(.CONTROL_RETURN)
    push_eh $P499
    .lex "self", self
    .lex "$/", param_500
.annotate 'line', 67
    new $P501, "Undef"
    .lex "$past", $P501
.annotate 'line', 68
    new $P502, "Undef"
    .lex "$lastlit", $P502
.annotate 'line', 67
    get_hll_global $P503, ["PAST"], "Regex"
    find_lex $P504, "$/"
    $P505 = $P503."new"("concat" :named("pasttype"), $P504 :named("node"))
    store_lex "$past", $P505
.annotate 'line', 68
    new $P506, "Integer"
    assign $P506, 0
    store_lex "$lastlit", $P506
.annotate 'line', 69
    find_lex $P508, "$/"
    unless_null $P508, vivify_174
    $P508 = root_new ['parrot';'Hash']
  vivify_174:
    set $P509, $P508["noun"]
    unless_null $P509, vivify_175
    new $P509, "Undef"
  vivify_175:
    defined $I510, $P509
    unless $I510, for_undef_176
    iter $P507, $P509
    new $P559, 'ExceptionHandler'
    set_addr $P559, loop558_handler
    $P559."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P559
  loop558_test:
    unless $P507, loop558_done
    shift $P511, $P507
  loop558_redo:
    .const 'Sub' $P513 = "37_1283874338.99425" 
    capture_lex $P513
    $P513($P511)
  loop558_next:
    goto loop558_test
  loop558_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P560, exception, 'type'
    eq $P560, .CONTROL_LOOP_NEXT, loop558_next
    eq $P560, .CONTROL_LOOP_REDO, loop558_redo
  loop558_done:
    pop_eh 
  for_undef_176:
.annotate 'line', 84
    find_lex $P561, "$/"
    find_lex $P562, "$past"
    $P563 = $P561."!make"($P562)
.annotate 'line', 66
    .return ($P563)
  control_498:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P564, exception, "payload"
    .return ($P564)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block512"  :anon :subid("37_1283874338.99425") :outer("36_1283874338.99425")
    .param pmc param_515
.annotate 'line', 70
    new $P514, "Undef"
    .lex "$ast", $P514
    .lex "$_", param_515
    find_lex $P516, "$_"
    $P517 = $P516."ast"()
    store_lex "$ast", $P517
.annotate 'line', 71
    find_lex $P520, "$ast"
    if $P520, if_519
    set $P518, $P520
    goto if_519_end
  if_519:
.annotate 'line', 72
    find_lex $P527, "$lastlit"
    if $P527, if_526
    set $P525, $P527
    goto if_526_end
  if_526:
    find_lex $P528, "$ast"
    $S529 = $P528."pasttype"()
    iseq $I530, $S529, "literal"
    new $P525, 'Integer'
    set $P525, $I530
  if_526_end:
    if $P525, if_524
    set $P523, $P525
    goto if_524_end
  if_524:
.annotate 'line', 73
    get_hll_global $P531, ["PAST"], "Node"
    find_lex $P532, "$ast"
    unless_null $P532, vivify_177
    $P532 = root_new ['parrot';'ResizablePMCArray']
  vivify_177:
    set $P533, $P532[0]
    unless_null $P533, vivify_178
    new $P533, "Undef"
  vivify_178:
    $P534 = $P531."ACCEPTS"($P533)
    isfalse $I535, $P534
    new $P523, 'Integer'
    set $P523, $I535
  if_524_end:
    if $P523, if_522
.annotate 'line', 77
    find_lex $P542, "$past"
    find_lex $P543, "$ast"
    $P542."push"($P543)
.annotate 'line', 78
    find_lex $P548, "$ast"
    $S549 = $P548."pasttype"()
    iseq $I550, $S549, "literal"
    if $I550, if_547
    new $P546, 'Integer'
    set $P546, $I550
    goto if_547_end
  if_547:
.annotate 'line', 79
    get_hll_global $P551, ["PAST"], "Node"
    find_lex $P552, "$ast"
    unless_null $P552, vivify_179
    $P552 = root_new ['parrot';'ResizablePMCArray']
  vivify_179:
    set $P553, $P552[0]
    unless_null $P553, vivify_180
    new $P553, "Undef"
  vivify_180:
    $P554 = $P551."ACCEPTS"($P553)
    isfalse $I555, $P554
    new $P546, 'Integer'
    set $P546, $I555
  if_547_end:
    if $P546, if_545
    new $P557, "Integer"
    assign $P557, 0
    set $P544, $P557
    goto if_545_end
  if_545:
    find_lex $P556, "$ast"
    set $P544, $P556
  if_545_end:
.annotate 'line', 80
    store_lex "$lastlit", $P544
.annotate 'line', 76
    set $P521, $P544
.annotate 'line', 73
    goto if_522_end
  if_522:
.annotate 'line', 74
    find_lex $P536, "$lastlit"
    unless_null $P536, vivify_181
    $P536 = root_new ['parrot';'ResizablePMCArray']
  vivify_181:
    set $P537, $P536[0]
    unless_null $P537, vivify_182
    new $P537, "Undef"
  vivify_182:
    find_lex $P538, "$ast"
    unless_null $P538, vivify_183
    $P538 = root_new ['parrot';'ResizablePMCArray']
  vivify_183:
    set $P539, $P538[0]
    unless_null $P539, vivify_184
    new $P539, "Undef"
  vivify_184:
    concat $P540, $P537, $P539
    find_lex $P541, "$lastlit"
    unless_null $P541, vivify_185
    $P541 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$lastlit", $P541
  vivify_185:
    set $P541[0], $P540
.annotate 'line', 73
    set $P521, $P540
  if_522_end:
.annotate 'line', 71
    set $P518, $P521
  if_519_end:
.annotate 'line', 69
    .return ($P518)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "quantified_atom"  :subid("38_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_568
.annotate 'line', 87
    .const 'Sub' $P577 = "39_1283874338.99425" 
    capture_lex $P577
    new $P567, 'ExceptionHandler'
    set_addr $P567, control_566
    $P567."handle_types"(.CONTROL_RETURN)
    push_eh $P567
    .lex "self", self
    .lex "$/", param_568
.annotate 'line', 88
    new $P569, "Undef"
    .lex "$past", $P569
    find_lex $P570, "$/"
    unless_null $P570, vivify_186
    $P570 = root_new ['parrot';'Hash']
  vivify_186:
    set $P571, $P570["atom"]
    unless_null $P571, vivify_187
    new $P571, "Undef"
  vivify_187:
    $P572 = $P571."ast"()
    store_lex "$past", $P572
.annotate 'line', 89
    find_lex $P574, "$/"
    unless_null $P574, vivify_188
    $P574 = root_new ['parrot';'Hash']
  vivify_188:
    set $P575, $P574["quantifier"]
    unless_null $P575, vivify_189
    new $P575, "Undef"
  vivify_189:
    if $P575, if_573
.annotate 'line', 95
    find_lex $P592, "$/"
    unless_null $P592, vivify_190
    $P592 = root_new ['parrot';'Hash']
  vivify_190:
    set $P593, $P592["backmod"]
    unless_null $P593, vivify_191
    $P593 = root_new ['parrot';'ResizablePMCArray']
  vivify_191:
    set $P594, $P593[0]
    unless_null $P594, vivify_192
    new $P594, "Undef"
  vivify_192:
    unless $P594, if_591_end
    find_lex $P595, "$past"
    find_lex $P596, "$/"
    unless_null $P596, vivify_193
    $P596 = root_new ['parrot';'Hash']
  vivify_193:
    set $P597, $P596["backmod"]
    unless_null $P597, vivify_194
    $P597 = root_new ['parrot';'ResizablePMCArray']
  vivify_194:
    set $P598, $P597[0]
    unless_null $P598, vivify_195
    new $P598, "Undef"
  vivify_195:
    "backmod"($P595, $P598)
  if_591_end:
    goto if_573_end
  if_573:
.annotate 'line', 89
    .const 'Sub' $P577 = "39_1283874338.99425" 
    capture_lex $P577
    $P577()
  if_573_end:
.annotate 'line', 96
    find_lex $P604, "$past"
    if $P604, if_603
    set $P602, $P604
    goto if_603_end
  if_603:
    find_lex $P605, "$past"
    $P606 = $P605."backtrack"()
    isfalse $I607, $P606
    new $P602, 'Integer'
    set $P602, $I607
  if_603_end:
    if $P602, if_601
    set $P600, $P602
    goto if_601_end
  if_601:
    get_global $P608, "@MODIFIERS"
    unless_null $P608, vivify_199
    $P608 = root_new ['parrot';'ResizablePMCArray']
  vivify_199:
    set $P609, $P608[0]
    unless_null $P609, vivify_200
    $P609 = root_new ['parrot';'Hash']
  vivify_200:
    set $P610, $P609["r"]
    unless_null $P610, vivify_201
    new $P610, "Undef"
  vivify_201:
    set $P600, $P610
  if_601_end:
    unless $P600, if_599_end
.annotate 'line', 97
    find_lex $P611, "$past"
    $P611."backtrack"("r")
  if_599_end:
.annotate 'line', 99
    find_lex $P612, "$/"
    find_lex $P613, "$past"
    $P614 = $P612."!make"($P613)
.annotate 'line', 87
    .return ($P614)
  control_566:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P615, exception, "payload"
    .return ($P615)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block576"  :anon :subid("39_1283874338.99425") :outer("38_1283874338.99425")
.annotate 'line', 91
    new $P578, "Undef"
    .lex "$qast", $P578
.annotate 'line', 90
    find_lex $P580, "$past"
    isfalse $I581, $P580
    unless $I581, if_579_end
    find_lex $P582, "$/"
    $P583 = $P582."CURSOR"()
    $P583."panic"("Quantifier follows nothing")
  if_579_end:
.annotate 'line', 91
    find_lex $P584, "$/"
    unless_null $P584, vivify_196
    $P584 = root_new ['parrot';'Hash']
  vivify_196:
    set $P585, $P584["quantifier"]
    unless_null $P585, vivify_197
    $P585 = root_new ['parrot';'ResizablePMCArray']
  vivify_197:
    set $P586, $P585[0]
    unless_null $P586, vivify_198
    new $P586, "Undef"
  vivify_198:
    $P587 = $P586."ast"()
    store_lex "$qast", $P587
.annotate 'line', 92
    find_lex $P588, "$qast"
    find_lex $P589, "$past"
    $P588."unshift"($P589)
.annotate 'line', 93
    find_lex $P590, "$qast"
    store_lex "$past", $P590
.annotate 'line', 89
    .return ($P590)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "atom"  :subid("40_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_619
.annotate 'line', 102
    new $P618, 'ExceptionHandler'
    set_addr $P618, control_617
    $P618."handle_types"(.CONTROL_RETURN)
    push_eh $P618
    .lex "self", self
    .lex "$/", param_619
.annotate 'line', 103
    new $P620, "Undef"
    .lex "$past", $P620
.annotate 'line', 102
    find_lex $P621, "$past"
.annotate 'line', 104
    find_lex $P623, "$/"
    unless_null $P623, vivify_202
    $P623 = root_new ['parrot';'Hash']
  vivify_202:
    set $P624, $P623["metachar"]
    unless_null $P624, vivify_203
    new $P624, "Undef"
  vivify_203:
    if $P624, if_622
.annotate 'line', 106
    get_hll_global $P628, ["PAST"], "Regex"
    find_lex $P629, "$/"
    set $S630, $P629
    find_lex $P631, "$/"
    $P632 = $P628."new"($S630, "literal" :named("pasttype"), $P631 :named("node"))
    store_lex "$past", $P632
.annotate 'line', 107
    get_global $P634, "@MODIFIERS"
    unless_null $P634, vivify_204
    $P634 = root_new ['parrot';'ResizablePMCArray']
  vivify_204:
    set $P635, $P634[0]
    unless_null $P635, vivify_205
    $P635 = root_new ['parrot';'Hash']
  vivify_205:
    set $P636, $P635["i"]
    unless_null $P636, vivify_206
    new $P636, "Undef"
  vivify_206:
    unless $P636, if_633_end
    find_lex $P637, "$past"
    $P637."subtype"("ignorecase")
  if_633_end:
.annotate 'line', 105
    goto if_622_end
  if_622:
.annotate 'line', 104
    find_lex $P625, "$/"
    unless_null $P625, vivify_207
    $P625 = root_new ['parrot';'Hash']
  vivify_207:
    set $P626, $P625["metachar"]
    unless_null $P626, vivify_208
    new $P626, "Undef"
  vivify_208:
    $P627 = $P626."ast"()
    store_lex "$past", $P627
  if_622_end:
.annotate 'line', 109
    find_lex $P638, "$/"
    find_lex $P639, "$past"
    $P640 = $P638."!make"($P639)
.annotate 'line', 102
    .return ($P640)
  control_617:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P641, exception, "payload"
    .return ($P641)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "quantifier:sym<*>"  :subid("41_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_645
.annotate 'line', 112
    new $P644, 'ExceptionHandler'
    set_addr $P644, control_643
    $P644."handle_types"(.CONTROL_RETURN)
    push_eh $P644
    .lex "self", self
    .lex "$/", param_645
.annotate 'line', 113
    new $P646, "Undef"
    .lex "$past", $P646
    get_hll_global $P647, ["PAST"], "Regex"
    find_lex $P648, "$/"
    $P649 = $P647."new"("quant" :named("pasttype"), $P648 :named("node"))
    store_lex "$past", $P649
.annotate 'line', 114
    find_lex $P650, "$/"
    find_lex $P651, "$past"
    find_lex $P652, "$/"
    unless_null $P652, vivify_209
    $P652 = root_new ['parrot';'Hash']
  vivify_209:
    set $P653, $P652["backmod"]
    unless_null $P653, vivify_210
    new $P653, "Undef"
  vivify_210:
    $P654 = "backmod"($P651, $P653)
    $P655 = $P650."!make"($P654)
.annotate 'line', 112
    .return ($P655)
  control_643:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P656, exception, "payload"
    .return ($P656)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "quantifier:sym<+>"  :subid("42_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_660
.annotate 'line', 117
    new $P659, 'ExceptionHandler'
    set_addr $P659, control_658
    $P659."handle_types"(.CONTROL_RETURN)
    push_eh $P659
    .lex "self", self
    .lex "$/", param_660
.annotate 'line', 118
    new $P661, "Undef"
    .lex "$past", $P661
    get_hll_global $P662, ["PAST"], "Regex"
    find_lex $P663, "$/"
    $P664 = $P662."new"("quant" :named("pasttype"), 1 :named("min"), $P663 :named("node"))
    store_lex "$past", $P664
.annotate 'line', 119
    find_lex $P665, "$/"
    find_lex $P666, "$past"
    find_lex $P667, "$/"
    unless_null $P667, vivify_211
    $P667 = root_new ['parrot';'Hash']
  vivify_211:
    set $P668, $P667["backmod"]
    unless_null $P668, vivify_212
    new $P668, "Undef"
  vivify_212:
    $P669 = "backmod"($P666, $P668)
    $P670 = $P665."!make"($P669)
.annotate 'line', 117
    .return ($P670)
  control_658:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P671, exception, "payload"
    .return ($P671)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "quantifier:sym<?>"  :subid("43_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_675
.annotate 'line', 122
    new $P674, 'ExceptionHandler'
    set_addr $P674, control_673
    $P674."handle_types"(.CONTROL_RETURN)
    push_eh $P674
    .lex "self", self
    .lex "$/", param_675
.annotate 'line', 123
    new $P676, "Undef"
    .lex "$past", $P676
    get_hll_global $P677, ["PAST"], "Regex"
    find_lex $P678, "$/"
    $P679 = $P677."new"("quant" :named("pasttype"), 0 :named("min"), 1 :named("max"), $P678 :named("node"))
    store_lex "$past", $P679
.annotate 'line', 124
    find_lex $P680, "$/"
    find_lex $P681, "$past"
    find_lex $P682, "$/"
    unless_null $P682, vivify_213
    $P682 = root_new ['parrot';'Hash']
  vivify_213:
    set $P683, $P682["backmod"]
    unless_null $P683, vivify_214
    new $P683, "Undef"
  vivify_214:
    $P684 = "backmod"($P681, $P683)
    $P680."!make"($P684)
.annotate 'line', 125
    find_lex $P685, "$/"
    find_lex $P686, "$past"
    $P687 = $P685."!make"($P686)
.annotate 'line', 122
    .return ($P687)
  control_673:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P688, exception, "payload"
    .return ($P688)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "quantifier:sym<**>"  :subid("44_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_692
.annotate 'line', 128
    .const 'Sub' $P707 = "45_1283874338.99425" 
    capture_lex $P707
    new $P691, 'ExceptionHandler'
    set_addr $P691, control_690
    $P691."handle_types"(.CONTROL_RETURN)
    push_eh $P691
    .lex "self", self
    .lex "$/", param_692
.annotate 'line', 129
    new $P693, "Undef"
    .lex "$past", $P693
.annotate 'line', 130
    new $P694, "Undef"
    .lex "$ws", $P694
.annotate 'line', 128
    find_lex $P695, "$past"
.annotate 'line', 130
    find_lex $P698, "$/"
    unless_null $P698, vivify_215
    $P698 = root_new ['parrot';'Hash']
  vivify_215:
    set $P699, $P698["normspace"]
    unless_null $P699, vivify_216
    new $P699, "Undef"
  vivify_216:
    if $P699, if_697
    set $P696, $P699
    goto if_697_end
  if_697:
    get_global $P700, "@MODIFIERS"
    unless_null $P700, vivify_217
    $P700 = root_new ['parrot';'ResizablePMCArray']
  vivify_217:
    set $P701, $P700[0]
    unless_null $P701, vivify_218
    $P701 = root_new ['parrot';'Hash']
  vivify_218:
    set $P702, $P701["s"]
    unless_null $P702, vivify_219
    new $P702, "Undef"
  vivify_219:
    set $P696, $P702
  if_697_end:
    store_lex "$ws", $P696
.annotate 'line', 131
    find_lex $P704, "$/"
    unless_null $P704, vivify_220
    $P704 = root_new ['parrot';'Hash']
  vivify_220:
    set $P705, $P704["quantified_atom"]
    unless_null $P705, vivify_221
    new $P705, "Undef"
  vivify_221:
    if $P705, if_703
.annotate 'line', 147
    get_hll_global $P725, ["PAST"], "Regex"
    find_lex $P726, "$/"
    unless_null $P726, vivify_222
    $P726 = root_new ['parrot';'Hash']
  vivify_222:
    set $P727, $P726["min"]
    unless_null $P727, vivify_223
    new $P727, "Undef"
  vivify_223:
    set $N728, $P727
    find_lex $P729, "$/"
    $P730 = $P725."new"("quant" :named("pasttype"), $N728 :named("min"), $P729 :named("node"))
    store_lex "$past", $P730
.annotate 'line', 148
    find_lex $P732, "$/"
    unless_null $P732, vivify_224
    $P732 = root_new ['parrot';'Hash']
  vivify_224:
    set $P733, $P732["max"]
    unless_null $P733, vivify_225
    new $P733, "Undef"
  vivify_225:
    isfalse $I734, $P733
    if $I734, if_731
.annotate 'line', 149
    find_lex $P740, "$/"
    unless_null $P740, vivify_226
    $P740 = root_new ['parrot';'Hash']
  vivify_226:
    set $P741, $P740["max"]
    unless_null $P741, vivify_227
    $P741 = root_new ['parrot';'ResizablePMCArray']
  vivify_227:
    set $P742, $P741[0]
    unless_null $P742, vivify_228
    new $P742, "Undef"
  vivify_228:
    set $S743, $P742
    isne $I744, $S743, "*"
    unless $I744, if_739_end
    find_lex $P745, "$past"
    find_lex $P746, "$/"
    unless_null $P746, vivify_229
    $P746 = root_new ['parrot';'Hash']
  vivify_229:
    set $P747, $P746["max"]
    unless_null $P747, vivify_230
    $P747 = root_new ['parrot';'ResizablePMCArray']
  vivify_230:
    set $P748, $P747[0]
    unless_null $P748, vivify_231
    new $P748, "Undef"
  vivify_231:
    set $N749, $P748
    $P745."max"($N749)
  if_739_end:
    goto if_731_end
  if_731:
.annotate 'line', 148
    find_lex $P735, "$past"
    find_lex $P736, "$/"
    unless_null $P736, vivify_232
    $P736 = root_new ['parrot';'Hash']
  vivify_232:
    set $P737, $P736["min"]
    unless_null $P737, vivify_233
    new $P737, "Undef"
  vivify_233:
    set $N738, $P737
    $P735."max"($N738)
  if_731_end:
.annotate 'line', 150
    find_lex $P751, "$ws"
    unless $P751, if_750_end
    find_lex $P752, "$past"
    get_hll_global $P753, ["PAST"], "Regex"
    $P754 = $P753."new"("ws", "subrule" :named("pasttype"), "method" :named("subtype"))
    $P752."sep"($P754)
  if_750_end:
.annotate 'line', 146
    goto if_703_end
  if_703:
.annotate 'line', 131
    .const 'Sub' $P707 = "45_1283874338.99425" 
    capture_lex $P707
    $P707()
  if_703_end:
.annotate 'line', 154
    find_lex $P755, "$/"
    find_lex $P756, "$past"
    find_lex $P757, "$/"
    unless_null $P757, vivify_236
    $P757 = root_new ['parrot';'Hash']
  vivify_236:
    set $P758, $P757["backmod"]
    unless_null $P758, vivify_237
    new $P758, "Undef"
  vivify_237:
    $P759 = "backmod"($P756, $P758)
    $P760 = $P755."!make"($P759)
.annotate 'line', 128
    .return ($P760)
  control_690:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P761, exception, "payload"
    .return ($P761)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block706"  :anon :subid("45_1283874338.99425") :outer("44_1283874338.99425")
.annotate 'line', 132
    new $P708, "Undef"
    .lex "$ast", $P708
    find_lex $P709, "$/"
    unless_null $P709, vivify_234
    $P709 = root_new ['parrot';'Hash']
  vivify_234:
    set $P710, $P709["quantified_atom"]
    unless_null $P710, vivify_235
    new $P710, "Undef"
  vivify_235:
    $P711 = $P710."ast"()
    store_lex "$ast", $P711
.annotate 'line', 133
    find_lex $P713, "$ws"
    unless $P713, if_712_end
.annotate 'line', 134
    get_hll_global $P714, ["PAST"], "Regex"
.annotate 'line', 136
    get_hll_global $P715, ["PAST"], "Regex"
    $P716 = $P715."new"("ws", "subrule" :named("pasttype"), "method" :named("subtype"))
    find_lex $P717, "$ast"
.annotate 'line', 139
    get_hll_global $P718, ["PAST"], "Regex"
    $P719 = $P718."new"("ws", "subrule" :named("pasttype"), "method" :named("subtype"))
    $P720 = $P714."new"($P716, $P717, $P719, "concat" :named("pasttype"))
.annotate 'line', 134
    store_lex "$ast", $P720
  if_712_end:
.annotate 'line', 143
    get_hll_global $P721, ["PAST"], "Regex"
    find_lex $P722, "$ast"
    find_lex $P723, "$/"
    $P724 = $P721."new"("quant" :named("pasttype"), 1 :named("min"), $P722 :named("sep"), $P723 :named("node"))
    store_lex "$past", $P724
.annotate 'line', 131
    .return ($P724)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<ws>"  :subid("46_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_765
.annotate 'line', 157
    new $P764, 'ExceptionHandler'
    set_addr $P764, control_763
    $P764."handle_types"(.CONTROL_RETURN)
    push_eh $P764
    .lex "self", self
    .lex "$/", param_765
.annotate 'line', 158
    new $P766, "Undef"
    .lex "$past", $P766
.annotate 'line', 159
    get_global $P769, "@MODIFIERS"
    unless_null $P769, vivify_238
    $P769 = root_new ['parrot';'ResizablePMCArray']
  vivify_238:
    set $P770, $P769[0]
    unless_null $P770, vivify_239
    $P770 = root_new ['parrot';'Hash']
  vivify_239:
    set $P771, $P770["s"]
    unless_null $P771, vivify_240
    new $P771, "Undef"
  vivify_240:
    if $P771, if_768
    new $P775, "Integer"
    assign $P775, 0
    set $P767, $P775
    goto if_768_end
  if_768:
    get_hll_global $P772, ["PAST"], "Regex"
    find_lex $P773, "$/"
    $P774 = $P772."new"("ws", "subrule" :named("pasttype"), "method" :named("subtype"), $P773 :named("node"))
    set $P767, $P774
  if_768_end:
    store_lex "$past", $P767
.annotate 'line', 162
    find_lex $P776, "$/"
    find_lex $P777, "$past"
    $P778 = $P776."!make"($P777)
.annotate 'line', 157
    .return ($P778)
  control_763:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P779, exception, "payload"
    .return ($P779)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<[ ]>"  :subid("47_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_783
.annotate 'line', 166
    new $P782, 'ExceptionHandler'
    set_addr $P782, control_781
    $P782."handle_types"(.CONTROL_RETURN)
    push_eh $P782
    .lex "self", self
    .lex "$/", param_783
.annotate 'line', 167
    find_lex $P784, "$/"
    find_lex $P785, "$/"
    unless_null $P785, vivify_241
    $P785 = root_new ['parrot';'Hash']
  vivify_241:
    set $P786, $P785["nibbler"]
    unless_null $P786, vivify_242
    new $P786, "Undef"
  vivify_242:
    $P787 = $P786."ast"()
    $P788 = $P784."!make"($P787)
.annotate 'line', 166
    .return ($P788)
  control_781:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P789, exception, "payload"
    .return ($P789)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<( )>"  :subid("48_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_793
.annotate 'line', 170
    new $P792, 'ExceptionHandler'
    set_addr $P792, control_791
    $P792."handle_types"(.CONTROL_RETURN)
    push_eh $P792
    .lex "self", self
    .lex "$/", param_793
.annotate 'line', 171
    new $P794, "Undef"
    .lex "$subpast", $P794
.annotate 'line', 172
    new $P795, "Undef"
    .lex "$past", $P795
.annotate 'line', 171
    find_lex $P796, "$/"
    unless_null $P796, vivify_243
    $P796 = root_new ['parrot';'Hash']
  vivify_243:
    set $P797, $P796["nibbler"]
    unless_null $P797, vivify_244
    new $P797, "Undef"
  vivify_244:
    $P798 = $P797."ast"()
    $P799 = "buildsub"($P798)
    store_lex "$subpast", $P799
.annotate 'line', 172
    get_hll_global $P800, ["PAST"], "Regex"
    find_lex $P801, "$subpast"
    find_lex $P802, "$/"
    $P803 = $P800."new"($P801, "subrule" :named("pasttype"), "capture" :named("subtype"), $P802 :named("node"))
    store_lex "$past", $P803
.annotate 'line', 174
    find_lex $P804, "$/"
    find_lex $P805, "$past"
    $P806 = $P804."!make"($P805)
.annotate 'line', 170
    .return ($P806)
  control_791:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P807, exception, "payload"
    .return ($P807)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<'>"  :subid("49_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_811
.annotate 'line', 177
    new $P810, 'ExceptionHandler'
    set_addr $P810, control_809
    $P810."handle_types"(.CONTROL_RETURN)
    push_eh $P810
    .lex "self", self
    .lex "$/", param_811
.annotate 'line', 178
    new $P812, "Undef"
    .lex "$quote", $P812
.annotate 'line', 180
    new $P813, "Undef"
    .lex "$past", $P813
.annotate 'line', 178
    find_lex $P814, "$/"
    unless_null $P814, vivify_245
    $P814 = root_new ['parrot';'Hash']
  vivify_245:
    set $P815, $P814["quote_EXPR"]
    unless_null $P815, vivify_246
    new $P815, "Undef"
  vivify_246:
    $P816 = $P815."ast"()
    store_lex "$quote", $P816
.annotate 'line', 179
    get_hll_global $P818, ["PAST"], "Val"
    find_lex $P819, "$quote"
    $P820 = $P818."ACCEPTS"($P819)
    unless $P820, if_817_end
    find_lex $P821, "$quote"
    $P822 = $P821."value"()
    store_lex "$quote", $P822
  if_817_end:
.annotate 'line', 180
    get_hll_global $P823, ["PAST"], "Regex"
    find_lex $P824, "$quote"
    find_lex $P825, "$/"
    $P826 = $P823."new"($P824, "literal" :named("pasttype"), $P825 :named("node"))
    store_lex "$past", $P826
.annotate 'line', 181
    get_global $P828, "@MODIFIERS"
    unless_null $P828, vivify_247
    $P828 = root_new ['parrot';'ResizablePMCArray']
  vivify_247:
    set $P829, $P828[0]
    unless_null $P829, vivify_248
    $P829 = root_new ['parrot';'Hash']
  vivify_248:
    set $P830, $P829["i"]
    unless_null $P830, vivify_249
    new $P830, "Undef"
  vivify_249:
    unless $P830, if_827_end
    find_lex $P831, "$past"
    $P831."subtype"("ignorecase")
  if_827_end:
.annotate 'line', 182
    find_lex $P832, "$/"
    find_lex $P833, "$past"
    $P834 = $P832."!make"($P833)
.annotate 'line', 177
    .return ($P834)
  control_809:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P835, exception, "payload"
    .return ($P835)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<\">"  :subid("50_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_839
.annotate 'line', 185
    new $P838, 'ExceptionHandler'
    set_addr $P838, control_837
    $P838."handle_types"(.CONTROL_RETURN)
    push_eh $P838
    .lex "self", self
    .lex "$/", param_839
.annotate 'line', 186
    new $P840, "Undef"
    .lex "$quote", $P840
.annotate 'line', 188
    new $P841, "Undef"
    .lex "$past", $P841
.annotate 'line', 186
    find_lex $P842, "$/"
    unless_null $P842, vivify_250
    $P842 = root_new ['parrot';'Hash']
  vivify_250:
    set $P843, $P842["quote_EXPR"]
    unless_null $P843, vivify_251
    new $P843, "Undef"
  vivify_251:
    $P844 = $P843."ast"()
    store_lex "$quote", $P844
.annotate 'line', 187
    get_hll_global $P846, ["PAST"], "Val"
    find_lex $P847, "$quote"
    $P848 = $P846."ACCEPTS"($P847)
    unless $P848, if_845_end
    find_lex $P849, "$quote"
    $P850 = $P849."value"()
    store_lex "$quote", $P850
  if_845_end:
.annotate 'line', 188
    get_hll_global $P851, ["PAST"], "Regex"
    find_lex $P852, "$quote"
    find_lex $P853, "$/"
    $P854 = $P851."new"($P852, "literal" :named("pasttype"), $P853 :named("node"))
    store_lex "$past", $P854
.annotate 'line', 189
    get_global $P856, "@MODIFIERS"
    unless_null $P856, vivify_252
    $P856 = root_new ['parrot';'ResizablePMCArray']
  vivify_252:
    set $P857, $P856[0]
    unless_null $P857, vivify_253
    $P857 = root_new ['parrot';'Hash']
  vivify_253:
    set $P858, $P857["i"]
    unless_null $P858, vivify_254
    new $P858, "Undef"
  vivify_254:
    unless $P858, if_855_end
    find_lex $P859, "$past"
    $P859."subtype"("ignorecase")
  if_855_end:
.annotate 'line', 190
    find_lex $P860, "$/"
    find_lex $P861, "$past"
    $P862 = $P860."!make"($P861)
.annotate 'line', 185
    .return ($P862)
  control_837:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P863, exception, "payload"
    .return ($P863)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<.>"  :subid("51_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_867
.annotate 'line', 193
    new $P866, 'ExceptionHandler'
    set_addr $P866, control_865
    $P866."handle_types"(.CONTROL_RETURN)
    push_eh $P866
    .lex "self", self
    .lex "$/", param_867
.annotate 'line', 194
    new $P868, "Undef"
    .lex "$past", $P868
    get_hll_global $P869, ["PAST"], "Regex"
    find_lex $P870, "$/"
    $P871 = $P869."new"("charclass" :named("pasttype"), "." :named("subtype"), $P870 :named("node"))
    store_lex "$past", $P871
.annotate 'line', 195
    find_lex $P872, "$/"
    find_lex $P873, "$past"
    $P874 = $P872."!make"($P873)
.annotate 'line', 193
    .return ($P874)
  control_865:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P875, exception, "payload"
    .return ($P875)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<^>"  :subid("52_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_879
.annotate 'line', 198
    new $P878, 'ExceptionHandler'
    set_addr $P878, control_877
    $P878."handle_types"(.CONTROL_RETURN)
    push_eh $P878
    .lex "self", self
    .lex "$/", param_879
.annotate 'line', 199
    new $P880, "Undef"
    .lex "$past", $P880
    get_hll_global $P881, ["PAST"], "Regex"
    find_lex $P882, "$/"
    $P883 = $P881."new"("anchor" :named("pasttype"), "bos" :named("subtype"), $P882 :named("node"))
    store_lex "$past", $P883
.annotate 'line', 200
    find_lex $P884, "$/"
    find_lex $P885, "$past"
    $P886 = $P884."!make"($P885)
.annotate 'line', 198
    .return ($P886)
  control_877:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P887, exception, "payload"
    .return ($P887)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<^^>"  :subid("53_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_891
.annotate 'line', 203
    new $P890, 'ExceptionHandler'
    set_addr $P890, control_889
    $P890."handle_types"(.CONTROL_RETURN)
    push_eh $P890
    .lex "self", self
    .lex "$/", param_891
.annotate 'line', 204
    new $P892, "Undef"
    .lex "$past", $P892
    get_hll_global $P893, ["PAST"], "Regex"
    find_lex $P894, "$/"
    $P895 = $P893."new"("anchor" :named("pasttype"), "bol" :named("subtype"), $P894 :named("node"))
    store_lex "$past", $P895
.annotate 'line', 205
    find_lex $P896, "$/"
    find_lex $P897, "$past"
    $P898 = $P896."!make"($P897)
.annotate 'line', 203
    .return ($P898)
  control_889:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P899, exception, "payload"
    .return ($P899)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<$>"  :subid("54_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_903
.annotate 'line', 208
    new $P902, 'ExceptionHandler'
    set_addr $P902, control_901
    $P902."handle_types"(.CONTROL_RETURN)
    push_eh $P902
    .lex "self", self
    .lex "$/", param_903
.annotate 'line', 209
    new $P904, "Undef"
    .lex "$past", $P904
    get_hll_global $P905, ["PAST"], "Regex"
    find_lex $P906, "$/"
    $P907 = $P905."new"("anchor" :named("pasttype"), "eos" :named("subtype"), $P906 :named("node"))
    store_lex "$past", $P907
.annotate 'line', 210
    find_lex $P908, "$/"
    find_lex $P909, "$past"
    $P910 = $P908."!make"($P909)
.annotate 'line', 208
    .return ($P910)
  control_901:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P911, exception, "payload"
    .return ($P911)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<$$>"  :subid("55_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_915
.annotate 'line', 213
    new $P914, 'ExceptionHandler'
    set_addr $P914, control_913
    $P914."handle_types"(.CONTROL_RETURN)
    push_eh $P914
    .lex "self", self
    .lex "$/", param_915
.annotate 'line', 214
    new $P916, "Undef"
    .lex "$past", $P916
    get_hll_global $P917, ["PAST"], "Regex"
    find_lex $P918, "$/"
    $P919 = $P917."new"("anchor" :named("pasttype"), "eol" :named("subtype"), $P918 :named("node"))
    store_lex "$past", $P919
.annotate 'line', 215
    find_lex $P920, "$/"
    find_lex $P921, "$past"
    $P922 = $P920."!make"($P921)
.annotate 'line', 213
    .return ($P922)
  control_913:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P923, exception, "payload"
    .return ($P923)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<:::>"  :subid("56_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_927
.annotate 'line', 218
    new $P926, 'ExceptionHandler'
    set_addr $P926, control_925
    $P926."handle_types"(.CONTROL_RETURN)
    push_eh $P926
    .lex "self", self
    .lex "$/", param_927
.annotate 'line', 219
    new $P928, "Undef"
    .lex "$past", $P928
    get_hll_global $P929, ["PAST"], "Regex"
    find_lex $P930, "$/"
    $P931 = $P929."new"("cut" :named("pasttype"), $P930 :named("node"))
    store_lex "$past", $P931
.annotate 'line', 220
    find_lex $P932, "$/"
    find_lex $P933, "$past"
    $P934 = $P932."!make"($P933)
.annotate 'line', 218
    .return ($P934)
  control_925:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P935, exception, "payload"
    .return ($P935)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<lwb>"  :subid("57_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_939
.annotate 'line', 223
    new $P938, 'ExceptionHandler'
    set_addr $P938, control_937
    $P938."handle_types"(.CONTROL_RETURN)
    push_eh $P938
    .lex "self", self
    .lex "$/", param_939
.annotate 'line', 224
    new $P940, "Undef"
    .lex "$past", $P940
    get_hll_global $P941, ["PAST"], "Regex"
    find_lex $P942, "$/"
    $P943 = $P941."new"("anchor" :named("pasttype"), "lwb" :named("subtype"), $P942 :named("node"))
    store_lex "$past", $P943
.annotate 'line', 225
    find_lex $P944, "$/"
    find_lex $P945, "$past"
    $P946 = $P944."!make"($P945)
.annotate 'line', 223
    .return ($P946)
  control_937:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P947, exception, "payload"
    .return ($P947)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<rwb>"  :subid("58_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_951
.annotate 'line', 228
    new $P950, 'ExceptionHandler'
    set_addr $P950, control_949
    $P950."handle_types"(.CONTROL_RETURN)
    push_eh $P950
    .lex "self", self
    .lex "$/", param_951
.annotate 'line', 229
    new $P952, "Undef"
    .lex "$past", $P952
    get_hll_global $P953, ["PAST"], "Regex"
    find_lex $P954, "$/"
    $P955 = $P953."new"("anchor" :named("pasttype"), "rwb" :named("subtype"), $P954 :named("node"))
    store_lex "$past", $P955
.annotate 'line', 230
    find_lex $P956, "$/"
    find_lex $P957, "$past"
    $P958 = $P956."!make"($P957)
.annotate 'line', 228
    .return ($P958)
  control_949:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P959, exception, "payload"
    .return ($P959)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<bs>"  :subid("59_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_963
.annotate 'line', 233
    new $P962, 'ExceptionHandler'
    set_addr $P962, control_961
    $P962."handle_types"(.CONTROL_RETURN)
    push_eh $P962
    .lex "self", self
    .lex "$/", param_963
.annotate 'line', 234
    find_lex $P964, "$/"
    find_lex $P965, "$/"
    unless_null $P965, vivify_255
    $P965 = root_new ['parrot';'Hash']
  vivify_255:
    set $P966, $P965["backslash"]
    unless_null $P966, vivify_256
    new $P966, "Undef"
  vivify_256:
    $P967 = $P966."ast"()
    $P968 = $P964."!make"($P967)
.annotate 'line', 233
    .return ($P968)
  control_961:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P969, exception, "payload"
    .return ($P969)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<mod>"  :subid("60_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_973
.annotate 'line', 237
    new $P972, 'ExceptionHandler'
    set_addr $P972, control_971
    $P972."handle_types"(.CONTROL_RETURN)
    push_eh $P972
    .lex "self", self
    .lex "$/", param_973
.annotate 'line', 238
    find_lex $P974, "$/"
    find_lex $P975, "$/"
    unless_null $P975, vivify_257
    $P975 = root_new ['parrot';'Hash']
  vivify_257:
    set $P976, $P975["mod_internal"]
    unless_null $P976, vivify_258
    new $P976, "Undef"
  vivify_258:
    $P977 = $P976."ast"()
    $P978 = $P974."!make"($P977)
.annotate 'line', 237
    .return ($P978)
  control_971:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P979, exception, "payload"
    .return ($P979)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<assert>"  :subid("61_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_983
.annotate 'line', 241
    new $P982, 'ExceptionHandler'
    set_addr $P982, control_981
    $P982."handle_types"(.CONTROL_RETURN)
    push_eh $P982
    .lex "self", self
    .lex "$/", param_983
.annotate 'line', 242
    find_lex $P984, "$/"
    find_lex $P985, "$/"
    unless_null $P985, vivify_259
    $P985 = root_new ['parrot';'Hash']
  vivify_259:
    set $P986, $P985["assertion"]
    unless_null $P986, vivify_260
    new $P986, "Undef"
  vivify_260:
    $P987 = $P986."ast"()
    $P988 = $P984."!make"($P987)
.annotate 'line', 241
    .return ($P988)
  control_981:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P989, exception, "payload"
    .return ($P989)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<~>"  :subid("62_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_993
.annotate 'line', 245
    new $P992, 'ExceptionHandler'
    set_addr $P992, control_991
    $P992."handle_types"(.CONTROL_RETURN)
    push_eh $P992
    .lex "self", self
    .lex "$/", param_993
.annotate 'line', 246
    find_lex $P994, "$/"
    get_hll_global $P995, ["PAST"], "Regex"
.annotate 'line', 247
    find_lex $P996, "$/"
    unless_null $P996, vivify_261
    $P996 = root_new ['parrot';'Hash']
  vivify_261:
    set $P997, $P996["EXPR"]
    unless_null $P997, vivify_262
    new $P997, "Undef"
  vivify_262:
    $P998 = $P997."ast"()
.annotate 'line', 248
    get_hll_global $P999, ["PAST"], "Regex"
.annotate 'line', 249
    find_lex $P1000, "$/"
    unless_null $P1000, vivify_263
    $P1000 = root_new ['parrot';'Hash']
  vivify_263:
    set $P1001, $P1000["GOAL"]
    unless_null $P1001, vivify_264
    new $P1001, "Undef"
  vivify_264:
    $P1002 = $P1001."ast"()
.annotate 'line', 250
    get_hll_global $P1003, ["PAST"], "Regex"
    find_lex $P1004, "$/"
    unless_null $P1004, vivify_265
    $P1004 = root_new ['parrot';'Hash']
  vivify_265:
    set $P1005, $P1004["GOAL"]
    unless_null $P1005, vivify_266
    new $P1005, "Undef"
  vivify_266:
    set $S1006, $P1005
    $P1007 = $P1003."new"("FAILGOAL", $S1006, "subrule" :named("pasttype"), "method" :named("subtype"))
    $P1008 = $P999."new"($P1002, $P1007, "alt" :named("pasttype"))
.annotate 'line', 248
    $P1009 = $P995."new"($P998, $P1008, "concat" :named("pasttype"))
.annotate 'line', 246
    $P1010 = $P994."!make"($P1009)
.annotate 'line', 245
    .return ($P1010)
  control_991:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1011, exception, "payload"
    .return ($P1011)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<{*}>"  :subid("63_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_1015
.annotate 'line', 258
    new $P1014, 'ExceptionHandler'
    set_addr $P1014, control_1013
    $P1014."handle_types"(.CONTROL_RETURN)
    push_eh $P1014
    .lex "self", self
    .lex "$/", param_1015
.annotate 'line', 259
    new $P1016, "Undef"
    .lex "$past", $P1016
.annotate 'line', 260
    find_lex $P1019, "$/"
    unless_null $P1019, vivify_267
    $P1019 = root_new ['parrot';'Hash']
  vivify_267:
    set $P1020, $P1019["key"]
    unless_null $P1020, vivify_268
    new $P1020, "Undef"
  vivify_268:
    if $P1020, if_1018
    new $P1028, "Integer"
    assign $P1028, 0
    set $P1017, $P1028
    goto if_1018_end
  if_1018:
    get_hll_global $P1021, ["PAST"], "Regex"
    find_lex $P1022, "$/"
    unless_null $P1022, vivify_269
    $P1022 = root_new ['parrot';'Hash']
  vivify_269:
    set $P1023, $P1022["key"]
    unless_null $P1023, vivify_270
    $P1023 = root_new ['parrot';'ResizablePMCArray']
  vivify_270:
    set $P1024, $P1023[0]
    unless_null $P1024, vivify_271
    new $P1024, "Undef"
  vivify_271:
    set $S1025, $P1024
    find_lex $P1026, "$/"
    $P1027 = $P1021."new"($S1025, "reduce" :named("pasttype"), $P1026 :named("node"))
    set $P1017, $P1027
  if_1018_end:
    store_lex "$past", $P1017
.annotate 'line', 262
    find_lex $P1029, "$/"
    find_lex $P1030, "$past"
    $P1031 = $P1029."!make"($P1030)
.annotate 'line', 258
    .return ($P1031)
  control_1013:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1032, exception, "payload"
    .return ($P1032)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<var>"  :subid("64_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_1036
.annotate 'line', 265
    new $P1035, 'ExceptionHandler'
    set_addr $P1035, control_1034
    $P1035."handle_types"(.CONTROL_RETURN)
    push_eh $P1035
    .lex "self", self
    .lex "$/", param_1036
.annotate 'line', 266
    new $P1037, "Undef"
    .lex "$past", $P1037
.annotate 'line', 267
    new $P1038, "Undef"
    .lex "$name", $P1038
.annotate 'line', 265
    find_lex $P1039, "$past"
.annotate 'line', 267
    find_lex $P1042, "$/"
    unless_null $P1042, vivify_272
    $P1042 = root_new ['parrot';'Hash']
  vivify_272:
    set $P1043, $P1042["pos"]
    unless_null $P1043, vivify_273
    new $P1043, "Undef"
  vivify_273:
    if $P1043, if_1041
    find_lex $P1047, "$/"
    unless_null $P1047, vivify_274
    $P1047 = root_new ['parrot';'Hash']
  vivify_274:
    set $P1048, $P1047["name"]
    unless_null $P1048, vivify_275
    new $P1048, "Undef"
  vivify_275:
    set $S1049, $P1048
    new $P1040, 'String'
    set $P1040, $S1049
    goto if_1041_end
  if_1041:
    find_lex $P1044, "$/"
    unless_null $P1044, vivify_276
    $P1044 = root_new ['parrot';'Hash']
  vivify_276:
    set $P1045, $P1044["pos"]
    unless_null $P1045, vivify_277
    new $P1045, "Undef"
  vivify_277:
    set $N1046, $P1045
    new $P1040, 'Float'
    set $P1040, $N1046
  if_1041_end:
    store_lex "$name", $P1040
.annotate 'line', 268
    find_lex $P1051, "$/"
    unless_null $P1051, vivify_278
    $P1051 = root_new ['parrot';'Hash']
  vivify_278:
    set $P1052, $P1051["quantified_atom"]
    unless_null $P1052, vivify_279
    new $P1052, "Undef"
  vivify_279:
    if $P1052, if_1050
.annotate 'line', 279
    get_hll_global $P1083, ["PAST"], "Regex"
    find_lex $P1084, "$name"
    find_lex $P1085, "$/"
    $P1086 = $P1083."new"("!BACKREF", $P1084, "subrule" :named("pasttype"), "method" :named("subtype"), $P1085 :named("node"))
    store_lex "$past", $P1086
.annotate 'line', 278
    goto if_1050_end
  if_1050:
.annotate 'line', 269
    find_lex $P1053, "$/"
    unless_null $P1053, vivify_280
    $P1053 = root_new ['parrot';'Hash']
  vivify_280:
    set $P1054, $P1053["quantified_atom"]
    unless_null $P1054, vivify_281
    $P1054 = root_new ['parrot';'ResizablePMCArray']
  vivify_281:
    set $P1055, $P1054[0]
    unless_null $P1055, vivify_282
    new $P1055, "Undef"
  vivify_282:
    $P1056 = $P1055."ast"()
    store_lex "$past", $P1056
.annotate 'line', 270
    find_lex $P1060, "$past"
    $S1061 = $P1060."pasttype"()
    iseq $I1062, $S1061, "quant"
    if $I1062, if_1059
    new $P1058, 'Integer'
    set $P1058, $I1062
    goto if_1059_end
  if_1059:
    find_lex $P1063, "$past"
    unless_null $P1063, vivify_283
    $P1063 = root_new ['parrot';'ResizablePMCArray']
  vivify_283:
    set $P1064, $P1063[0]
    unless_null $P1064, vivify_284
    new $P1064, "Undef"
  vivify_284:
    $S1065 = $P1064."pasttype"()
    iseq $I1066, $S1065, "subrule"
    new $P1058, 'Integer'
    set $P1058, $I1066
  if_1059_end:
    if $P1058, if_1057
.annotate 'line', 273
    find_lex $P1072, "$past"
    $S1073 = $P1072."pasttype"()
    iseq $I1074, $S1073, "subrule"
    if $I1074, if_1071
.annotate 'line', 275
    get_hll_global $P1078, ["PAST"], "Regex"
    find_lex $P1079, "$past"
    find_lex $P1080, "$name"
    find_lex $P1081, "$/"
    $P1082 = $P1078."new"($P1079, $P1080 :named("name"), "subcapture" :named("pasttype"), $P1081 :named("node"))
    store_lex "$past", $P1082
.annotate 'line', 274
    goto if_1071_end
  if_1071:
.annotate 'line', 273
    find_lex $P1075, "self"
    find_lex $P1076, "$past"
    find_lex $P1077, "$name"
    $P1075."subrule_alias"($P1076, $P1077)
  if_1071_end:
    goto if_1057_end
  if_1057:
.annotate 'line', 271
    find_lex $P1067, "self"
    find_lex $P1068, "$past"
    unless_null $P1068, vivify_285
    $P1068 = root_new ['parrot';'ResizablePMCArray']
  vivify_285:
    set $P1069, $P1068[0]
    unless_null $P1069, vivify_286
    new $P1069, "Undef"
  vivify_286:
    find_lex $P1070, "$name"
    $P1067."subrule_alias"($P1069, $P1070)
  if_1057_end:
  if_1050_end:
.annotate 'line', 282
    find_lex $P1087, "$/"
    find_lex $P1088, "$past"
    $P1089 = $P1087."!make"($P1088)
.annotate 'line', 265
    .return ($P1089)
  control_1034:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1090, exception, "payload"
    .return ($P1090)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<PIR>"  :subid("65_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_1094
.annotate 'line', 285
    new $P1093, 'ExceptionHandler'
    set_addr $P1093, control_1092
    $P1093."handle_types"(.CONTROL_RETURN)
    push_eh $P1093
    .lex "self", self
    .lex "$/", param_1094
.annotate 'line', 286
    find_lex $P1095, "$/"
    get_hll_global $P1096, ["PAST"], "Regex"
.annotate 'line', 287
    get_hll_global $P1097, ["PAST"], "Op"
    find_lex $P1098, "$/"
    unless_null $P1098, vivify_287
    $P1098 = root_new ['parrot';'Hash']
  vivify_287:
    set $P1099, $P1098["pir"]
    unless_null $P1099, vivify_288
    new $P1099, "Undef"
  vivify_288:
    set $S1100, $P1099
    $P1101 = $P1097."new"($S1100 :named("inline"), "inline" :named("pasttype"))
    find_lex $P1102, "$/"
    $P1103 = $P1096."new"($P1101, "pastnode" :named("pasttype"), $P1102 :named("node"))
.annotate 'line', 286
    $P1104 = $P1095."!make"($P1103)
.annotate 'line', 285
    .return ($P1104)
  control_1092:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1105, exception, "payload"
    .return ($P1105)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<w>"  :subid("66_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_1109
.annotate 'line', 293
    new $P1108, 'ExceptionHandler'
    set_addr $P1108, control_1107
    $P1108."handle_types"(.CONTROL_RETURN)
    push_eh $P1108
    .lex "self", self
    .lex "$/", param_1109
.annotate 'line', 294
    new $P1110, "Undef"
    .lex "$subtype", $P1110
.annotate 'line', 295
    new $P1111, "Undef"
    .lex "$past", $P1111
.annotate 'line', 294
    find_lex $P1114, "$/"
    unless_null $P1114, vivify_289
    $P1114 = root_new ['parrot';'Hash']
  vivify_289:
    set $P1115, $P1114["sym"]
    unless_null $P1115, vivify_290
    new $P1115, "Undef"
  vivify_290:
    set $S1116, $P1115
    iseq $I1117, $S1116, "n"
    if $I1117, if_1113
    find_lex $P1119, "$/"
    unless_null $P1119, vivify_291
    $P1119 = root_new ['parrot';'Hash']
  vivify_291:
    set $P1120, $P1119["sym"]
    unless_null $P1120, vivify_292
    new $P1120, "Undef"
  vivify_292:
    set $S1121, $P1120
    new $P1112, 'String'
    set $P1112, $S1121
    goto if_1113_end
  if_1113:
    new $P1118, "String"
    assign $P1118, "nl"
    set $P1112, $P1118
  if_1113_end:
    store_lex "$subtype", $P1112
.annotate 'line', 295
    get_hll_global $P1122, ["PAST"], "Regex"
    find_lex $P1123, "$subtype"
    find_lex $P1124, "$/"
    $P1125 = $P1122."new"("charclass" :named("pasttype"), $P1123 :named("subtype"), $P1124 :named("node"))
    store_lex "$past", $P1125
.annotate 'line', 296
    find_lex $P1126, "$/"
    find_lex $P1127, "$past"
    $P1128 = $P1126."!make"($P1127)
.annotate 'line', 293
    .return ($P1128)
  control_1107:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1129, exception, "payload"
    .return ($P1129)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<b>"  :subid("67_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_1133
.annotate 'line', 299
    new $P1132, 'ExceptionHandler'
    set_addr $P1132, control_1131
    $P1132."handle_types"(.CONTROL_RETURN)
    push_eh $P1132
    .lex "self", self
    .lex "$/", param_1133
.annotate 'line', 300
    new $P1134, "Undef"
    .lex "$past", $P1134
    get_hll_global $P1135, ["PAST"], "Regex"
.annotate 'line', 301
    find_lex $P1136, "$/"
    unless_null $P1136, vivify_293
    $P1136 = root_new ['parrot';'Hash']
  vivify_293:
    set $P1137, $P1136["sym"]
    unless_null $P1137, vivify_294
    new $P1137, "Undef"
  vivify_294:
    set $S1138, $P1137
    iseq $I1139, $S1138, "B"
    find_lex $P1140, "$/"
    $P1141 = $P1135."new"("\b", "enumcharlist" :named("pasttype"), $I1139 :named("negate"), $P1140 :named("node"))
.annotate 'line', 300
    store_lex "$past", $P1141
.annotate 'line', 302
    find_lex $P1142, "$/"
    find_lex $P1143, "$past"
    $P1144 = $P1142."!make"($P1143)
.annotate 'line', 299
    .return ($P1144)
  control_1131:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1145, exception, "payload"
    .return ($P1145)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<e>"  :subid("68_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_1149
.annotate 'line', 305
    new $P1148, 'ExceptionHandler'
    set_addr $P1148, control_1147
    $P1148."handle_types"(.CONTROL_RETURN)
    push_eh $P1148
    .lex "self", self
    .lex "$/", param_1149
.annotate 'line', 306
    new $P1150, "Undef"
    .lex "$past", $P1150
    get_hll_global $P1151, ["PAST"], "Regex"
.annotate 'line', 307
    find_lex $P1152, "$/"
    unless_null $P1152, vivify_295
    $P1152 = root_new ['parrot';'Hash']
  vivify_295:
    set $P1153, $P1152["sym"]
    unless_null $P1153, vivify_296
    new $P1153, "Undef"
  vivify_296:
    set $S1154, $P1153
    iseq $I1155, $S1154, "E"
    find_lex $P1156, "$/"
    $P1157 = $P1151."new"("\e", "enumcharlist" :named("pasttype"), $I1155 :named("negate"), $P1156 :named("node"))
.annotate 'line', 306
    store_lex "$past", $P1157
.annotate 'line', 308
    find_lex $P1158, "$/"
    find_lex $P1159, "$past"
    $P1160 = $P1158."!make"($P1159)
.annotate 'line', 305
    .return ($P1160)
  control_1147:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1161, exception, "payload"
    .return ($P1161)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<f>"  :subid("69_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_1165
.annotate 'line', 311
    new $P1164, 'ExceptionHandler'
    set_addr $P1164, control_1163
    $P1164."handle_types"(.CONTROL_RETURN)
    push_eh $P1164
    .lex "self", self
    .lex "$/", param_1165
.annotate 'line', 312
    new $P1166, "Undef"
    .lex "$past", $P1166
    get_hll_global $P1167, ["PAST"], "Regex"
.annotate 'line', 313
    find_lex $P1168, "$/"
    unless_null $P1168, vivify_297
    $P1168 = root_new ['parrot';'Hash']
  vivify_297:
    set $P1169, $P1168["sym"]
    unless_null $P1169, vivify_298
    new $P1169, "Undef"
  vivify_298:
    set $S1170, $P1169
    iseq $I1171, $S1170, "F"
    find_lex $P1172, "$/"
    $P1173 = $P1167."new"("\f", "enumcharlist" :named("pasttype"), $I1171 :named("negate"), $P1172 :named("node"))
.annotate 'line', 312
    store_lex "$past", $P1173
.annotate 'line', 314
    find_lex $P1174, "$/"
    find_lex $P1175, "$past"
    $P1176 = $P1174."!make"($P1175)
.annotate 'line', 311
    .return ($P1176)
  control_1163:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1177, exception, "payload"
    .return ($P1177)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<h>"  :subid("70_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_1181
.annotate 'line', 317
    new $P1180, 'ExceptionHandler'
    set_addr $P1180, control_1179
    $P1180."handle_types"(.CONTROL_RETURN)
    push_eh $P1180
    .lex "self", self
    .lex "$/", param_1181
.annotate 'line', 318
    new $P1182, "Undef"
    .lex "$past", $P1182
    get_hll_global $P1183, ["PAST"], "Regex"
.annotate 'line', 319
    find_lex $P1184, "$/"
    unless_null $P1184, vivify_299
    $P1184 = root_new ['parrot';'Hash']
  vivify_299:
    set $P1185, $P1184["sym"]
    unless_null $P1185, vivify_300
    new $P1185, "Undef"
  vivify_300:
    set $S1186, $P1185
    iseq $I1187, $S1186, "H"
    find_lex $P1188, "$/"
    $P1189 = $P1183."new"(unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", "enumcharlist" :named("pasttype"), $I1187 :named("negate"), $P1188 :named("node"))
.annotate 'line', 318
    store_lex "$past", $P1189
.annotate 'line', 320
    find_lex $P1190, "$/"
    find_lex $P1191, "$past"
    $P1192 = $P1190."!make"($P1191)
.annotate 'line', 317
    .return ($P1192)
  control_1179:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1193, exception, "payload"
    .return ($P1193)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<r>"  :subid("71_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_1197
.annotate 'line', 323
    new $P1196, 'ExceptionHandler'
    set_addr $P1196, control_1195
    $P1196."handle_types"(.CONTROL_RETURN)
    push_eh $P1196
    .lex "self", self
    .lex "$/", param_1197
.annotate 'line', 324
    new $P1198, "Undef"
    .lex "$past", $P1198
    get_hll_global $P1199, ["PAST"], "Regex"
.annotate 'line', 325
    find_lex $P1200, "$/"
    unless_null $P1200, vivify_301
    $P1200 = root_new ['parrot';'Hash']
  vivify_301:
    set $P1201, $P1200["sym"]
    unless_null $P1201, vivify_302
    new $P1201, "Undef"
  vivify_302:
    set $S1202, $P1201
    iseq $I1203, $S1202, "R"
    find_lex $P1204, "$/"
    $P1205 = $P1199."new"("\r", "enumcharlist" :named("pasttype"), $I1203 :named("negate"), $P1204 :named("node"))
.annotate 'line', 324
    store_lex "$past", $P1205
.annotate 'line', 326
    find_lex $P1206, "$/"
    find_lex $P1207, "$past"
    $P1208 = $P1206."!make"($P1207)
.annotate 'line', 323
    .return ($P1208)
  control_1195:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1209, exception, "payload"
    .return ($P1209)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<t>"  :subid("72_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_1213
.annotate 'line', 329
    new $P1212, 'ExceptionHandler'
    set_addr $P1212, control_1211
    $P1212."handle_types"(.CONTROL_RETURN)
    push_eh $P1212
    .lex "self", self
    .lex "$/", param_1213
.annotate 'line', 330
    new $P1214, "Undef"
    .lex "$past", $P1214
    get_hll_global $P1215, ["PAST"], "Regex"
.annotate 'line', 331
    find_lex $P1216, "$/"
    unless_null $P1216, vivify_303
    $P1216 = root_new ['parrot';'Hash']
  vivify_303:
    set $P1217, $P1216["sym"]
    unless_null $P1217, vivify_304
    new $P1217, "Undef"
  vivify_304:
    set $S1218, $P1217
    iseq $I1219, $S1218, "T"
    find_lex $P1220, "$/"
    $P1221 = $P1215."new"("\t", "enumcharlist" :named("pasttype"), $I1219 :named("negate"), $P1220 :named("node"))
.annotate 'line', 330
    store_lex "$past", $P1221
.annotate 'line', 332
    find_lex $P1222, "$/"
    find_lex $P1223, "$past"
    $P1224 = $P1222."!make"($P1223)
.annotate 'line', 329
    .return ($P1224)
  control_1211:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1225, exception, "payload"
    .return ($P1225)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<v>"  :subid("73_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_1229
.annotate 'line', 335
    new $P1228, 'ExceptionHandler'
    set_addr $P1228, control_1227
    $P1228."handle_types"(.CONTROL_RETURN)
    push_eh $P1228
    .lex "self", self
    .lex "$/", param_1229
.annotate 'line', 336
    new $P1230, "Undef"
    .lex "$past", $P1230
    get_hll_global $P1231, ["PAST"], "Regex"
.annotate 'line', 338
    find_lex $P1232, "$/"
    unless_null $P1232, vivify_305
    $P1232 = root_new ['parrot';'Hash']
  vivify_305:
    set $P1233, $P1232["sym"]
    unless_null $P1233, vivify_306
    new $P1233, "Undef"
  vivify_306:
    set $S1234, $P1233
    iseq $I1235, $S1234, "V"
    find_lex $P1236, "$/"
    $P1237 = $P1231."new"(unicode:"\n\x{b}\f\r\x{85}\u2028\u2029", "enumcharlist" :named("pasttype"), $I1235 :named("negate"), $P1236 :named("node"))
.annotate 'line', 336
    store_lex "$past", $P1237
.annotate 'line', 339
    find_lex $P1238, "$/"
    find_lex $P1239, "$past"
    $P1240 = $P1238."!make"($P1239)
.annotate 'line', 335
    .return ($P1240)
  control_1227:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1241, exception, "payload"
    .return ($P1241)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<o>"  :subid("74_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_1245
.annotate 'line', 342
    new $P1244, 'ExceptionHandler'
    set_addr $P1244, control_1243
    $P1244."handle_types"(.CONTROL_RETURN)
    push_eh $P1244
    .lex "self", self
    .lex "$/", param_1245
.annotate 'line', 343
    new $P1246, "Undef"
    .lex "$octlit", $P1246
.annotate 'line', 344
    get_hll_global $P1247, ["HLL";"Actions"], "ints_to_string"
    find_lex $P1250, "$/"
    unless_null $P1250, vivify_307
    $P1250 = root_new ['parrot';'Hash']
  vivify_307:
    set $P1251, $P1250["octint"]
    unless_null $P1251, vivify_308
    new $P1251, "Undef"
  vivify_308:
    unless $P1251, unless_1249
    set $P1248, $P1251
    goto unless_1249_end
  unless_1249:
    find_lex $P1252, "$/"
    unless_null $P1252, vivify_309
    $P1252 = root_new ['parrot';'Hash']
  vivify_309:
    set $P1253, $P1252["octints"]
    unless_null $P1253, vivify_310
    $P1253 = root_new ['parrot';'Hash']
  vivify_310:
    set $P1254, $P1253["octint"]
    unless_null $P1254, vivify_311
    new $P1254, "Undef"
  vivify_311:
    set $P1248, $P1254
  unless_1249_end:
    $P1255 = $P1247($P1248)
    store_lex "$octlit", $P1255
.annotate 'line', 345
    find_lex $P1256, "$/"
    find_lex $P1259, "$/"
    unless_null $P1259, vivify_312
    $P1259 = root_new ['parrot';'Hash']
  vivify_312:
    set $P1260, $P1259["sym"]
    unless_null $P1260, vivify_313
    new $P1260, "Undef"
  vivify_313:
    set $S1261, $P1260
    iseq $I1262, $S1261, "O"
    if $I1262, if_1258
.annotate 'line', 348
    get_hll_global $P1267, ["PAST"], "Regex"
    find_lex $P1268, "$octlit"
    find_lex $P1269, "$/"
    $P1270 = $P1267."new"($P1268, "literal" :named("pasttype"), $P1269 :named("node"))
    set $P1257, $P1270
.annotate 'line', 345
    goto if_1258_end
  if_1258:
.annotate 'line', 346
    get_hll_global $P1263, ["PAST"], "Regex"
    find_lex $P1264, "$octlit"
    find_lex $P1265, "$/"
    $P1266 = $P1263."new"($P1264, "enumcharlist" :named("pasttype"), 1 :named("negate"), $P1265 :named("node"))
    set $P1257, $P1266
  if_1258_end:
    $P1271 = $P1256."!make"($P1257)
.annotate 'line', 342
    .return ($P1271)
  control_1243:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1272, exception, "payload"
    .return ($P1272)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<x>"  :subid("75_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_1276
.annotate 'line', 351
    new $P1275, 'ExceptionHandler'
    set_addr $P1275, control_1274
    $P1275."handle_types"(.CONTROL_RETURN)
    push_eh $P1275
    .lex "self", self
    .lex "$/", param_1276
.annotate 'line', 352
    new $P1277, "Undef"
    .lex "$hexlit", $P1277
.annotate 'line', 353
    get_hll_global $P1278, ["HLL";"Actions"], "ints_to_string"
    find_lex $P1281, "$/"
    unless_null $P1281, vivify_314
    $P1281 = root_new ['parrot';'Hash']
  vivify_314:
    set $P1282, $P1281["hexint"]
    unless_null $P1282, vivify_315
    new $P1282, "Undef"
  vivify_315:
    unless $P1282, unless_1280
    set $P1279, $P1282
    goto unless_1280_end
  unless_1280:
    find_lex $P1283, "$/"
    unless_null $P1283, vivify_316
    $P1283 = root_new ['parrot';'Hash']
  vivify_316:
    set $P1284, $P1283["hexints"]
    unless_null $P1284, vivify_317
    $P1284 = root_new ['parrot';'Hash']
  vivify_317:
    set $P1285, $P1284["hexint"]
    unless_null $P1285, vivify_318
    new $P1285, "Undef"
  vivify_318:
    set $P1279, $P1285
  unless_1280_end:
    $P1286 = $P1278($P1279)
    store_lex "$hexlit", $P1286
.annotate 'line', 354
    find_lex $P1287, "$/"
    find_lex $P1290, "$/"
    unless_null $P1290, vivify_319
    $P1290 = root_new ['parrot';'Hash']
  vivify_319:
    set $P1291, $P1290["sym"]
    unless_null $P1291, vivify_320
    new $P1291, "Undef"
  vivify_320:
    set $S1292, $P1291
    iseq $I1293, $S1292, "X"
    if $I1293, if_1289
.annotate 'line', 357
    get_hll_global $P1298, ["PAST"], "Regex"
    find_lex $P1299, "$hexlit"
    find_lex $P1300, "$/"
    $P1301 = $P1298."new"($P1299, "literal" :named("pasttype"), $P1300 :named("node"))
    set $P1288, $P1301
.annotate 'line', 354
    goto if_1289_end
  if_1289:
.annotate 'line', 355
    get_hll_global $P1294, ["PAST"], "Regex"
    find_lex $P1295, "$hexlit"
    find_lex $P1296, "$/"
    $P1297 = $P1294."new"($P1295, "enumcharlist" :named("pasttype"), 1 :named("negate"), $P1296 :named("node"))
    set $P1288, $P1297
  if_1289_end:
    $P1302 = $P1287."!make"($P1288)
.annotate 'line', 351
    .return ($P1302)
  control_1274:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1303, exception, "payload"
    .return ($P1303)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<c>"  :subid("76_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_1307
.annotate 'line', 360
    new $P1306, 'ExceptionHandler'
    set_addr $P1306, control_1305
    $P1306."handle_types"(.CONTROL_RETURN)
    push_eh $P1306
    .lex "self", self
    .lex "$/", param_1307
.annotate 'line', 361
    find_lex $P1308, "$/"
    get_hll_global $P1309, ["PAST"], "Regex"
    find_lex $P1310, "$/"
    unless_null $P1310, vivify_321
    $P1310 = root_new ['parrot';'Hash']
  vivify_321:
    set $P1311, $P1310["charspec"]
    unless_null $P1311, vivify_322
    new $P1311, "Undef"
  vivify_322:
    $P1312 = $P1311."ast"()
    find_lex $P1313, "$/"
    $P1314 = $P1309."new"($P1312, "literal" :named("pasttype"), $P1313 :named("node"))
    $P1315 = $P1308."!make"($P1314)
.annotate 'line', 360
    .return ($P1315)
  control_1305:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1316, exception, "payload"
    .return ($P1316)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<misc>"  :subid("77_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_1320
.annotate 'line', 364
    new $P1319, 'ExceptionHandler'
    set_addr $P1319, control_1318
    $P1319."handle_types"(.CONTROL_RETURN)
    push_eh $P1319
    .lex "self", self
    .lex "$/", param_1320
.annotate 'line', 365
    new $P1321, "Undef"
    .lex "$past", $P1321
    get_hll_global $P1322, ["PAST"], "Regex"
    find_lex $P1323, "$/"
    set $S1324, $P1323
    find_lex $P1325, "$/"
    $P1326 = $P1322."new"($S1324, "literal" :named("pasttype"), $P1325 :named("node"))
    store_lex "$past", $P1326
.annotate 'line', 366
    find_lex $P1327, "$/"
    find_lex $P1328, "$past"
    $P1329 = $P1327."!make"($P1328)
.annotate 'line', 364
    .return ($P1329)
  control_1318:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1330, exception, "payload"
    .return ($P1330)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "assertion:sym<?>"  :subid("78_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_1334
.annotate 'line', 370
    new $P1333, 'ExceptionHandler'
    set_addr $P1333, control_1332
    $P1333."handle_types"(.CONTROL_RETURN)
    push_eh $P1333
    .lex "self", self
    .lex "$/", param_1334
.annotate 'line', 371
    new $P1335, "Undef"
    .lex "$past", $P1335
.annotate 'line', 370
    find_lex $P1336, "$past"
.annotate 'line', 372
    find_lex $P1338, "$/"
    unless_null $P1338, vivify_323
    $P1338 = root_new ['parrot';'Hash']
  vivify_323:
    set $P1339, $P1338["assertion"]
    unless_null $P1339, vivify_324
    new $P1339, "Undef"
  vivify_324:
    if $P1339, if_1337
.annotate 'line', 376
    new $P1344, "Integer"
    assign $P1344, 0
    store_lex "$past", $P1344
    goto if_1337_end
  if_1337:
.annotate 'line', 373
    find_lex $P1340, "$/"
    unless_null $P1340, vivify_325
    $P1340 = root_new ['parrot';'Hash']
  vivify_325:
    set $P1341, $P1340["assertion"]
    unless_null $P1341, vivify_326
    new $P1341, "Undef"
  vivify_326:
    $P1342 = $P1341."ast"()
    store_lex "$past", $P1342
.annotate 'line', 374
    find_lex $P1343, "$past"
    $P1343."subtype"("zerowidth")
  if_1337_end:
.annotate 'line', 377
    find_lex $P1345, "$/"
    find_lex $P1346, "$past"
    $P1347 = $P1345."!make"($P1346)
.annotate 'line', 370
    .return ($P1347)
  control_1332:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1348, exception, "payload"
    .return ($P1348)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "assertion:sym<!>"  :subid("79_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_1352
.annotate 'line', 380
    new $P1351, 'ExceptionHandler'
    set_addr $P1351, control_1350
    $P1351."handle_types"(.CONTROL_RETURN)
    push_eh $P1351
    .lex "self", self
    .lex "$/", param_1352
.annotate 'line', 381
    new $P1353, "Undef"
    .lex "$past", $P1353
.annotate 'line', 380
    find_lex $P1354, "$past"
.annotate 'line', 382
    find_lex $P1356, "$/"
    unless_null $P1356, vivify_327
    $P1356 = root_new ['parrot';'Hash']
  vivify_327:
    set $P1357, $P1356["assertion"]
    unless_null $P1357, vivify_328
    new $P1357, "Undef"
  vivify_328:
    if $P1357, if_1355
.annotate 'line', 388
    get_hll_global $P1366, ["PAST"], "Regex"
    find_lex $P1367, "$/"
    $P1368 = $P1366."new"("anchor" :named("pasttype"), "fail" :named("subtype"), $P1367 :named("node"))
    store_lex "$past", $P1368
.annotate 'line', 387
    goto if_1355_end
  if_1355:
.annotate 'line', 383
    find_lex $P1358, "$/"
    unless_null $P1358, vivify_329
    $P1358 = root_new ['parrot';'Hash']
  vivify_329:
    set $P1359, $P1358["assertion"]
    unless_null $P1359, vivify_330
    new $P1359, "Undef"
  vivify_330:
    $P1360 = $P1359."ast"()
    store_lex "$past", $P1360
.annotate 'line', 384
    find_lex $P1361, "$past"
    find_lex $P1362, "$past"
    $P1363 = $P1362."negate"()
    isfalse $I1364, $P1363
    $P1361."negate"($I1364)
.annotate 'line', 385
    find_lex $P1365, "$past"
    $P1365."subtype"("zerowidth")
  if_1355_end:
.annotate 'line', 390
    find_lex $P1369, "$/"
    find_lex $P1370, "$past"
    $P1371 = $P1369."!make"($P1370)
.annotate 'line', 380
    .return ($P1371)
  control_1350:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1372, exception, "payload"
    .return ($P1372)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "assertion:sym<method>"  :subid("80_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_1376
.annotate 'line', 393
    new $P1375, 'ExceptionHandler'
    set_addr $P1375, control_1374
    $P1375."handle_types"(.CONTROL_RETURN)
    push_eh $P1375
    .lex "self", self
    .lex "$/", param_1376
.annotate 'line', 394
    new $P1377, "Undef"
    .lex "$past", $P1377
    find_lex $P1378, "$/"
    unless_null $P1378, vivify_331
    $P1378 = root_new ['parrot';'Hash']
  vivify_331:
    set $P1379, $P1378["assertion"]
    unless_null $P1379, vivify_332
    new $P1379, "Undef"
  vivify_332:
    $P1380 = $P1379."ast"()
    store_lex "$past", $P1380
.annotate 'line', 395
    find_lex $P1381, "$past"
    $P1381."subtype"("method")
.annotate 'line', 396
    find_lex $P1382, "$past"
    $P1382."name"("")
.annotate 'line', 397
    find_lex $P1383, "$/"
    find_lex $P1384, "$past"
    $P1385 = $P1383."!make"($P1384)
.annotate 'line', 393
    .return ($P1385)
  control_1374:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1386, exception, "payload"
    .return ($P1386)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "assertion:sym<name>"  :subid("81_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_1390
.annotate 'line', 400
    .const 'Sub' $P1447 = "83_1283874338.99425" 
    capture_lex $P1447
    .const 'Sub' $P1413 = "82_1283874338.99425" 
    capture_lex $P1413
    new $P1389, 'ExceptionHandler'
    set_addr $P1389, control_1388
    $P1389."handle_types"(.CONTROL_RETURN)
    push_eh $P1389
    .lex "self", self
    .lex "$/", param_1390
.annotate 'line', 401
    new $P1391, "Undef"
    .lex "$name", $P1391
.annotate 'line', 402
    new $P1392, "Undef"
    .lex "$past", $P1392
.annotate 'line', 401
    find_lex $P1393, "$/"
    unless_null $P1393, vivify_333
    $P1393 = root_new ['parrot';'Hash']
  vivify_333:
    set $P1394, $P1393["longname"]
    unless_null $P1394, vivify_334
    new $P1394, "Undef"
  vivify_334:
    set $S1395, $P1394
    new $P1396, 'String'
    set $P1396, $S1395
    store_lex "$name", $P1396
    find_lex $P1397, "$past"
.annotate 'line', 403
    find_lex $P1399, "$/"
    unless_null $P1399, vivify_335
    $P1399 = root_new ['parrot';'Hash']
  vivify_335:
    set $P1400, $P1399["assertion"]
    unless_null $P1400, vivify_336
    new $P1400, "Undef"
  vivify_336:
    if $P1400, if_1398
.annotate 'line', 407
    find_lex $P1409, "$name"
    set $S1410, $P1409
    iseq $I1411, $S1410, "sym"
    if $I1411, if_1408
.annotate 'line', 423
    find_lex $P1423, "self"
    find_lex $P1424, "$/"
    $P1425 = $P1423."named_assertion"($P1424)
    store_lex "$past", $P1425
.annotate 'line', 424
    find_lex $P1427, "$/"
    unless_null $P1427, vivify_337
    $P1427 = root_new ['parrot';'Hash']
  vivify_337:
    set $P1428, $P1427["nibbler"]
    unless_null $P1428, vivify_338
    new $P1428, "Undef"
  vivify_338:
    if $P1428, if_1426
.annotate 'line', 427
    find_lex $P1436, "$/"
    unless_null $P1436, vivify_339
    $P1436 = root_new ['parrot';'Hash']
  vivify_339:
    set $P1437, $P1436["arglist"]
    unless_null $P1437, vivify_340
    new $P1437, "Undef"
  vivify_340:
    unless $P1437, if_1435_end
.annotate 'line', 428
    find_lex $P1439, "$/"
    unless_null $P1439, vivify_341
    $P1439 = root_new ['parrot';'Hash']
  vivify_341:
    set $P1440, $P1439["arglist"]
    unless_null $P1440, vivify_342
    $P1440 = root_new ['parrot';'ResizablePMCArray']
  vivify_342:
    set $P1441, $P1440[0]
    unless_null $P1441, vivify_343
    new $P1441, "Undef"
  vivify_343:
    $P1442 = $P1441."ast"()
    $P1443 = $P1442."list"()
    defined $I1444, $P1443
    unless $I1444, for_undef_344
    iter $P1438, $P1443
    new $P1453, 'ExceptionHandler'
    set_addr $P1453, loop1452_handler
    $P1453."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1453
  loop1452_test:
    unless $P1438, loop1452_done
    shift $P1445, $P1438
  loop1452_redo:
    .const 'Sub' $P1447 = "83_1283874338.99425" 
    capture_lex $P1447
    $P1447($P1445)
  loop1452_next:
    goto loop1452_test
  loop1452_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1454, exception, 'type'
    eq $P1454, .CONTROL_LOOP_NEXT, loop1452_next
    eq $P1454, .CONTROL_LOOP_REDO, loop1452_redo
  loop1452_done:
    pop_eh 
  for_undef_344:
  if_1435_end:
.annotate 'line', 427
    goto if_1426_end
  if_1426:
.annotate 'line', 425
    find_lex $P1429, "$past"
    find_lex $P1430, "$/"
    unless_null $P1430, vivify_345
    $P1430 = root_new ['parrot';'Hash']
  vivify_345:
    set $P1431, $P1430["nibbler"]
    unless_null $P1431, vivify_346
    $P1431 = root_new ['parrot';'ResizablePMCArray']
  vivify_346:
    set $P1432, $P1431[0]
    unless_null $P1432, vivify_347
    new $P1432, "Undef"
  vivify_347:
    $P1433 = $P1432."ast"()
    $P1434 = "buildsub"($P1433)
    $P1429."push"($P1434)
  if_1426_end:
.annotate 'line', 422
    goto if_1408_end
  if_1408:
.annotate 'line', 407
    .const 'Sub' $P1413 = "82_1283874338.99425" 
    capture_lex $P1413
    $P1413()
  if_1408_end:
    goto if_1398_end
  if_1398:
.annotate 'line', 404
    find_lex $P1401, "$/"
    unless_null $P1401, vivify_348
    $P1401 = root_new ['parrot';'Hash']
  vivify_348:
    set $P1402, $P1401["assertion"]
    unless_null $P1402, vivify_349
    $P1402 = root_new ['parrot';'ResizablePMCArray']
  vivify_349:
    set $P1403, $P1402[0]
    unless_null $P1403, vivify_350
    new $P1403, "Undef"
  vivify_350:
    $P1404 = $P1403."ast"()
    store_lex "$past", $P1404
.annotate 'line', 405
    find_lex $P1405, "self"
    find_lex $P1406, "$past"
    find_lex $P1407, "$name"
    $P1405."subrule_alias"($P1406, $P1407)
  if_1398_end:
.annotate 'line', 431
    find_lex $P1455, "$/"
    find_lex $P1456, "$past"
    $P1457 = $P1455."!make"($P1456)
.annotate 'line', 400
    .return ($P1457)
  control_1388:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1458, exception, "payload"
    .return ($P1458)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1446"  :anon :subid("83_1283874338.99425") :outer("81_1283874338.99425")
    .param pmc param_1448
.annotate 'line', 428
    .lex "$_", param_1448
    find_lex $P1449, "$past"
    find_lex $P1450, "$_"
    $P1451 = $P1449."push"($P1450)
    .return ($P1451)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1412"  :anon :subid("82_1283874338.99425") :outer("81_1283874338.99425")
.annotate 'line', 408
    new $P1414, "Undef"
    .lex "$regexsym", $P1414

            $P0 = get_global '$REGEXNAME'
            $S0 = $P0
            $I0 = index $S0, ':sym<'
            add $I0, 5
            $S0 = substr $S0, $I0
            $S0 = chopn $S0, 1
            $P1415 = box $S0
        
    store_lex "$regexsym", $P1415
.annotate 'line', 417
    get_hll_global $P1416, ["PAST"], "Regex"
.annotate 'line', 418
    get_hll_global $P1417, ["PAST"], "Regex"
    find_lex $P1418, "$regexsym"
    $P1419 = $P1417."new"($P1418, "literal" :named("pasttype"))
    find_lex $P1420, "$name"
    find_lex $P1421, "$/"
    $P1422 = $P1416."new"($P1419, $P1420 :named("name"), "subcapture" :named("pasttype"), $P1421 :named("node"))
.annotate 'line', 417
    store_lex "$past", $P1422
.annotate 'line', 407
    .return ($P1422)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "assertion:sym<[>"  :subid("84_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_1462
.annotate 'line', 434
    .const 'Sub' $P1497 = "85_1283874338.99425" 
    capture_lex $P1497
    new $P1461, 'ExceptionHandler'
    set_addr $P1461, control_1460
    $P1461."handle_types"(.CONTROL_RETURN)
    push_eh $P1461
    .lex "self", self
    .lex "$/", param_1462
.annotate 'line', 435
    new $P1463, "Undef"
    .lex "$clist", $P1463
.annotate 'line', 436
    new $P1464, "Undef"
    .lex "$past", $P1464
.annotate 'line', 445
    new $P1465, "Undef"
    .lex "$i", $P1465
.annotate 'line', 446
    new $P1466, "Undef"
    .lex "$n", $P1466
.annotate 'line', 435
    find_lex $P1467, "$/"
    unless_null $P1467, vivify_351
    $P1467 = root_new ['parrot';'Hash']
  vivify_351:
    set $P1468, $P1467["cclass_elem"]
    unless_null $P1468, vivify_352
    new $P1468, "Undef"
  vivify_352:
    store_lex "$clist", $P1468
.annotate 'line', 436
    find_lex $P1469, "$clist"
    unless_null $P1469, vivify_353
    $P1469 = root_new ['parrot';'ResizablePMCArray']
  vivify_353:
    set $P1470, $P1469[0]
    unless_null $P1470, vivify_354
    new $P1470, "Undef"
  vivify_354:
    $P1471 = $P1470."ast"()
    store_lex "$past", $P1471
.annotate 'line', 437
    find_lex $P1475, "$past"
    $P1476 = $P1475."negate"()
    if $P1476, if_1474
    set $P1473, $P1476
    goto if_1474_end
  if_1474:
    find_lex $P1477, "$past"
    $S1478 = $P1477."pasttype"()
    iseq $I1479, $S1478, "subrule"
    new $P1473, 'Integer'
    set $P1473, $I1479
  if_1474_end:
    unless $P1473, if_1472_end
.annotate 'line', 438
    find_lex $P1480, "$past"
    $P1480."subtype"("zerowidth")
.annotate 'line', 439
    get_hll_global $P1481, ["PAST"], "Regex"
    find_lex $P1482, "$past"
.annotate 'line', 441
    get_hll_global $P1483, ["PAST"], "Regex"
    $P1484 = $P1483."new"("charclass" :named("pasttype"), "." :named("subtype"))
    find_lex $P1485, "$/"
    $P1486 = $P1481."new"($P1482, $P1484, $P1485 :named("node"))
.annotate 'line', 439
    store_lex "$past", $P1486
  if_1472_end:
.annotate 'line', 445
    new $P1487, "Integer"
    assign $P1487, 1
    store_lex "$i", $P1487
.annotate 'line', 446
    find_lex $P1488, "$clist"
    set $N1489, $P1488
    new $P1490, 'Float'
    set $P1490, $N1489
    store_lex "$n", $P1490
.annotate 'line', 447
    new $P1521, 'ExceptionHandler'
    set_addr $P1521, loop1520_handler
    $P1521."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1521
  loop1520_test:
    find_lex $P1491, "$i"
    set $N1492, $P1491
    find_lex $P1493, "$n"
    set $N1494, $P1493
    islt $I1495, $N1492, $N1494
    unless $I1495, loop1520_done
  loop1520_redo:
    .const 'Sub' $P1497 = "85_1283874338.99425" 
    capture_lex $P1497
    $P1497()
  loop1520_next:
    goto loop1520_test
  loop1520_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1522, exception, 'type'
    eq $P1522, .CONTROL_LOOP_NEXT, loop1520_next
    eq $P1522, .CONTROL_LOOP_REDO, loop1520_redo
  loop1520_done:
    pop_eh 
.annotate 'line', 458
    find_lex $P1523, "$/"
    find_lex $P1524, "$past"
    $P1525 = $P1523."!make"($P1524)
.annotate 'line', 434
    .return ($P1525)
  control_1460:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1526, exception, "payload"
    .return ($P1526)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1496"  :anon :subid("85_1283874338.99425") :outer("84_1283874338.99425")
.annotate 'line', 448
    new $P1498, "Undef"
    .lex "$ast", $P1498
    find_lex $P1499, "$i"
    set $I1500, $P1499
    find_lex $P1501, "$clist"
    unless_null $P1501, vivify_355
    $P1501 = root_new ['parrot';'ResizablePMCArray']
  vivify_355:
    set $P1502, $P1501[$I1500]
    unless_null $P1502, vivify_356
    new $P1502, "Undef"
  vivify_356:
    $P1503 = $P1502."ast"()
    store_lex "$ast", $P1503
.annotate 'line', 449
    find_lex $P1505, "$ast"
    $P1506 = $P1505."negate"()
    if $P1506, if_1504
.annotate 'line', 454
    get_hll_global $P1513, ["PAST"], "Regex"
    find_lex $P1514, "$past"
    find_lex $P1515, "$ast"
    find_lex $P1516, "$/"
    $P1517 = $P1513."new"($P1514, $P1515, "alt" :named("pasttype"), $P1516 :named("node"))
    store_lex "$past", $P1517
.annotate 'line', 453
    goto if_1504_end
  if_1504:
.annotate 'line', 450
    find_lex $P1507, "$ast"
    $P1507."subtype"("zerowidth")
.annotate 'line', 451
    get_hll_global $P1508, ["PAST"], "Regex"
    find_lex $P1509, "$ast"
    find_lex $P1510, "$past"
    find_lex $P1511, "$/"
    $P1512 = $P1508."new"($P1509, $P1510, "concat" :named("pasttype"), $P1511 :named("node"))
    store_lex "$past", $P1512
  if_1504_end:
.annotate 'line', 456
    find_lex $P1518, "$i"
    add $P1519, $P1518, 1
    store_lex "$i", $P1519
.annotate 'line', 447
    .return ($P1519)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "cclass_elem"  :subid("86_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_1530
.annotate 'line', 461
    .const 'Sub' $P1555 = "88_1283874338.99425" 
    capture_lex $P1555
    .const 'Sub' $P1539 = "87_1283874338.99425" 
    capture_lex $P1539
    new $P1529, 'ExceptionHandler'
    set_addr $P1529, control_1528
    $P1529."handle_types"(.CONTROL_RETURN)
    push_eh $P1529
    .lex "self", self
    .lex "$/", param_1530
.annotate 'line', 462
    new $P1531, "Undef"
    .lex "$str", $P1531
.annotate 'line', 463
    new $P1532, "Undef"
    .lex "$past", $P1532
.annotate 'line', 462
    new $P1533, "String"
    assign $P1533, ""
    store_lex "$str", $P1533
    find_lex $P1534, "$past"
.annotate 'line', 464
    find_lex $P1536, "$/"
    unless_null $P1536, vivify_357
    $P1536 = root_new ['parrot';'Hash']
  vivify_357:
    set $P1537, $P1536["name"]
    unless_null $P1537, vivify_358
    new $P1537, "Undef"
  vivify_358:
    if $P1537, if_1535
.annotate 'line', 468
    find_lex $P1550, "$/"
    unless_null $P1550, vivify_359
    $P1550 = root_new ['parrot';'Hash']
  vivify_359:
    set $P1551, $P1550["charspec"]
    unless_null $P1551, vivify_360
    new $P1551, "Undef"
  vivify_360:
    defined $I1552, $P1551
    unless $I1552, for_undef_361
    iter $P1549, $P1551
    new $P1581, 'ExceptionHandler'
    set_addr $P1581, loop1580_handler
    $P1581."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1581
  loop1580_test:
    unless $P1549, loop1580_done
    shift $P1553, $P1549
  loop1580_redo:
    .const 'Sub' $P1555 = "88_1283874338.99425" 
    capture_lex $P1555
    $P1555($P1553)
  loop1580_next:
    goto loop1580_test
  loop1580_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1582, exception, 'type'
    eq $P1582, .CONTROL_LOOP_NEXT, loop1580_next
    eq $P1582, .CONTROL_LOOP_REDO, loop1580_redo
  loop1580_done:
    pop_eh 
  for_undef_361:
.annotate 'line', 493
    get_hll_global $P1583, ["PAST"], "Regex"
    find_lex $P1584, "$str"
    find_lex $P1585, "$/"
    $P1586 = $P1583."new"($P1584, "enumcharlist" :named("pasttype"), $P1585 :named("node"))
    store_lex "$past", $P1586
.annotate 'line', 467
    goto if_1535_end
  if_1535:
.annotate 'line', 464
    .const 'Sub' $P1539 = "87_1283874338.99425" 
    capture_lex $P1539
    $P1539()
  if_1535_end:
.annotate 'line', 495
    find_lex $P1587, "$past"
    find_lex $P1588, "$/"
    unless_null $P1588, vivify_373
    $P1588 = root_new ['parrot';'Hash']
  vivify_373:
    set $P1589, $P1588["sign"]
    unless_null $P1589, vivify_374
    new $P1589, "Undef"
  vivify_374:
    set $S1590, $P1589
    iseq $I1591, $S1590, "-"
    $P1587."negate"($I1591)
.annotate 'line', 496
    find_lex $P1592, "$/"
    find_lex $P1593, "$past"
    $P1594 = $P1592."!make"($P1593)
.annotate 'line', 461
    .return ($P1594)
  control_1528:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1595, exception, "payload"
    .return ($P1595)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1554"  :anon :subid("88_1283874338.99425") :outer("86_1283874338.99425")
    .param pmc param_1556
.annotate 'line', 468
    .const 'Sub' $P1562 = "89_1283874338.99425" 
    capture_lex $P1562
    .lex "$_", param_1556
.annotate 'line', 469
    find_lex $P1559, "$_"
    unless_null $P1559, vivify_362
    $P1559 = root_new ['parrot';'ResizablePMCArray']
  vivify_362:
    set $P1560, $P1559[1]
    unless_null $P1560, vivify_363
    new $P1560, "Undef"
  vivify_363:
    if $P1560, if_1558
.annotate 'line', 491
    find_lex $P1576, "$str"
    find_lex $P1577, "$_"
    unless_null $P1577, vivify_364
    $P1577 = root_new ['parrot';'ResizablePMCArray']
  vivify_364:
    set $P1578, $P1577[0]
    unless_null $P1578, vivify_365
    new $P1578, "Undef"
  vivify_365:
    concat $P1579, $P1576, $P1578
    store_lex "$str", $P1579
    set $P1557, $P1579
.annotate 'line', 469
    goto if_1558_end
  if_1558:
    .const 'Sub' $P1562 = "89_1283874338.99425" 
    capture_lex $P1562
    $P1575 = $P1562()
    set $P1557, $P1575
  if_1558_end:
.annotate 'line', 468
    .return ($P1557)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1561"  :anon :subid("89_1283874338.99425") :outer("88_1283874338.99425")
.annotate 'line', 470
    new $P1563, "Undef"
    .lex "$a", $P1563
.annotate 'line', 471
    new $P1564, "Undef"
    .lex "$b", $P1564
.annotate 'line', 472
    new $P1565, "Undef"
    .lex "$c", $P1565
.annotate 'line', 470
    find_lex $P1566, "$_"
    unless_null $P1566, vivify_366
    $P1566 = root_new ['parrot';'ResizablePMCArray']
  vivify_366:
    set $P1567, $P1566[0]
    unless_null $P1567, vivify_367
    new $P1567, "Undef"
  vivify_367:
    store_lex "$a", $P1567
.annotate 'line', 471
    find_lex $P1568, "$_"
    unless_null $P1568, vivify_368
    $P1568 = root_new ['parrot';'ResizablePMCArray']
  vivify_368:
    set $P1569, $P1568[1]
    unless_null $P1569, vivify_369
    $P1569 = root_new ['parrot';'ResizablePMCArray']
  vivify_369:
    set $P1570, $P1569[0]
    unless_null $P1570, vivify_370
    new $P1570, "Undef"
  vivify_370:
    store_lex "$b", $P1570
.annotate 'line', 472

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
                             $P1571 = box $S2
                         
    store_lex "$c", $P1571
.annotate 'line', 489
    find_lex $P1572, "$str"
    find_lex $P1573, "$c"
    concat $P1574, $P1572, $P1573
    store_lex "$str", $P1574
.annotate 'line', 469
    .return ($P1574)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1538"  :anon :subid("87_1283874338.99425") :outer("86_1283874338.99425")
.annotate 'line', 465
    new $P1540, "Undef"
    .lex "$name", $P1540
    find_lex $P1541, "$/"
    unless_null $P1541, vivify_371
    $P1541 = root_new ['parrot';'Hash']
  vivify_371:
    set $P1542, $P1541["name"]
    unless_null $P1542, vivify_372
    new $P1542, "Undef"
  vivify_372:
    set $S1543, $P1542
    new $P1544, 'String'
    set $P1544, $S1543
    store_lex "$name", $P1544
.annotate 'line', 466
    get_hll_global $P1545, ["PAST"], "Regex"
    find_lex $P1546, "$name"
    find_lex $P1547, "$/"
    $P1548 = $P1545."new"($P1546, "subrule" :named("pasttype"), "method" :named("subtype"), $P1547 :named("node"))
    store_lex "$past", $P1548
.annotate 'line', 464
    .return ($P1548)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "mod_internal"  :subid("90_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_1599
.annotate 'line', 499
    new $P1598, 'ExceptionHandler'
    set_addr $P1598, control_1597
    $P1598."handle_types"(.CONTROL_RETURN)
    push_eh $P1598
    .lex "self", self
    .lex "$/", param_1599
.annotate 'line', 500
    $P1600 = root_new ['parrot';'Hash']
    .lex "%mods", $P1600
.annotate 'line', 501
    new $P1601, "Undef"
    .lex "$n", $P1601
.annotate 'line', 500
    get_global $P1602, "@MODIFIERS"
    unless_null $P1602, vivify_375
    $P1602 = root_new ['parrot';'ResizablePMCArray']
  vivify_375:
    set $P1603, $P1602[0]
    unless_null $P1603, vivify_376
    new $P1603, "Undef"
  vivify_376:
    store_lex "%mods", $P1603
.annotate 'line', 501
    find_lex $P1606, "$/"
    unless_null $P1606, vivify_377
    $P1606 = root_new ['parrot';'Hash']
  vivify_377:
    set $P1607, $P1606["n"]
    unless_null $P1607, vivify_378
    $P1607 = root_new ['parrot';'ResizablePMCArray']
  vivify_378:
    set $P1608, $P1607[0]
    unless_null $P1608, vivify_379
    new $P1608, "Undef"
  vivify_379:
    set $S1609, $P1608
    isgt $I1610, $S1609, ""
    if $I1610, if_1605
    new $P1615, "Integer"
    assign $P1615, 1
    set $P1604, $P1615
    goto if_1605_end
  if_1605:
    find_lex $P1611, "$/"
    unless_null $P1611, vivify_380
    $P1611 = root_new ['parrot';'Hash']
  vivify_380:
    set $P1612, $P1611["n"]
    unless_null $P1612, vivify_381
    $P1612 = root_new ['parrot';'ResizablePMCArray']
  vivify_381:
    set $P1613, $P1612[0]
    unless_null $P1613, vivify_382
    new $P1613, "Undef"
  vivify_382:
    set $N1614, $P1613
    new $P1604, 'Float'
    set $P1604, $N1614
  if_1605_end:
    store_lex "$n", $P1604
.annotate 'line', 502
    find_lex $P1616, "$n"
    find_lex $P1617, "$/"
    unless_null $P1617, vivify_383
    $P1617 = root_new ['parrot';'Hash']
  vivify_383:
    set $P1618, $P1617["mod_ident"]
    unless_null $P1618, vivify_384
    $P1618 = root_new ['parrot';'Hash']
  vivify_384:
    set $P1619, $P1618["sym"]
    unless_null $P1619, vivify_385
    new $P1619, "Undef"
  vivify_385:
    set $S1620, $P1619
    find_lex $P1621, "%mods"
    unless_null $P1621, vivify_386
    $P1621 = root_new ['parrot';'Hash']
    store_lex "%mods", $P1621
  vivify_386:
    set $P1621[$S1620], $P1616
.annotate 'line', 503
    find_lex $P1622, "$/"
    $P1623 = $P1622."!make"(0)
.annotate 'line', 499
    .return ($P1623)
  control_1597:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1624, exception, "payload"
    .return ($P1624)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "subrule_alias"  :subid("91_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_1631
    .param pmc param_1632
.annotate 'line', 597
    new $P1630, 'ExceptionHandler'
    set_addr $P1630, control_1629
    $P1630."handle_types"(.CONTROL_RETURN)
    push_eh $P1630
    .lex "self", self
    .lex "$past", param_1631
    .lex "$name", param_1632
.annotate 'line', 598
    find_lex $P1634, "$past"
    $S1635 = $P1634."name"()
    isgt $I1636, $S1635, ""
    if $I1636, if_1633
.annotate 'line', 599
    find_lex $P1643, "$past"
    find_lex $P1644, "$name"
    $P1643."name"($P1644)
    goto if_1633_end
  if_1633:
.annotate 'line', 598
    find_lex $P1637, "$past"
    find_lex $P1638, "$name"
    concat $P1639, $P1638, "="
    find_lex $P1640, "$past"
    $S1641 = $P1640."name"()
    concat $P1642, $P1639, $S1641
    $P1637."name"($P1642)
  if_1633_end:
.annotate 'line', 600
    find_lex $P1645, "$past"
    $P1646 = $P1645."subtype"("capture")
.annotate 'line', 597
    .return ($P1646)
  control_1629:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1647, exception, "payload"
    .return ($P1647)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "named_assertion"  :subid("92_1283874338.99425") :method :outer("11_1283874338.99425")
    .param pmc param_1651
.annotate 'line', 603
    new $P1650, 'ExceptionHandler'
    set_addr $P1650, control_1649
    $P1650."handle_types"(.CONTROL_RETURN)
    push_eh $P1650
    .lex "self", self
    .lex "$/", param_1651
.annotate 'line', 604
    new $P1652, "Undef"
    .lex "$name", $P1652
.annotate 'line', 605
    new $P1653, "Undef"
    .lex "$past", $P1653
.annotate 'line', 604
    find_lex $P1654, "$/"
    unless_null $P1654, vivify_387
    $P1654 = root_new ['parrot';'Hash']
  vivify_387:
    set $P1655, $P1654["longname"]
    unless_null $P1655, vivify_388
    new $P1655, "Undef"
  vivify_388:
    set $S1656, $P1655
    new $P1657, 'String'
    set $P1657, $S1656
    store_lex "$name", $P1657
.annotate 'line', 605
    get_hll_global $P1658, ["PAST"], "Regex"
    find_lex $P1659, "$name"
    find_lex $P1660, "$name"
    find_lex $P1661, "$/"
    $P1662 = $P1658."new"($P1659, $P1660 :named("name"), "subrule" :named("pasttype"), "capture" :named("subtype"), $P1661 :named("node"))
    store_lex "$past", $P1662
    find_lex $P1663, "$past"
.annotate 'line', 603
    .return ($P1663)
  control_1649:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1664, exception, "payload"
    .return ($P1664)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1666" :load :anon :subid("93_1283874338.99425")
.annotate 'line', 4
    .const 'Sub' $P1668 = "11_1283874338.99425" 
    $P1669 = $P1668()
    .return ($P1669)
.end


.namespace []
.sub "_block1672" :load :anon :subid("94_1283874338.99425")
.annotate 'line', 1
    .const 'Sub' $P1674 = "10_1283874338.99425" 
    $P1675 = $P1674()
    .return ($P1675)
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
