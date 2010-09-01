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
.sub "_block11"  :anon :subid("10_1283368197.39621")
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
    $P581 = $P14()
.annotate 'line', 1
    .return ($P581)
    .const 'Sub' $P583 = "163_1283368197.39621" 
    .return ($P583)
.end


.namespace []
.sub "" :load :init :subid("post164") :outer("10_1283368197.39621")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1283368197.39621" 
    .local pmc block
    set block, $P12
    $P586 = get_root_global ["parrot"], "P6metaclass"
    $P586."new_class"("Regex::P6Regex::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block13"  :subid("11_1283368197.39621") :outer("10_1283368197.39621")
.annotate 'line', 3
    .const 'Sub' $P570 = "160_1283368197.39621" 
    capture_lex $P570
    .const 'Sub' $P563 = "158_1283368197.39621" 
    capture_lex $P563
    .const 'Sub' $P556 = "156_1283368197.39621" 
    capture_lex $P556
    .const 'Sub' $P536 = "151_1283368197.39621" 
    capture_lex $P536
    .const 'Sub' $P502 = "145_1283368197.39621" 
    capture_lex $P502
    .const 'Sub' $P490 = "142_1283368197.39621" 
    capture_lex $P490
    .const 'Sub' $P478 = "139_1283368197.39621" 
    capture_lex $P478
    .const 'Sub' $P472 = "137_1283368197.39621" 
    capture_lex $P472
    .const 'Sub' $P461 = "134_1283368197.39621" 
    capture_lex $P461
    .const 'Sub' $P450 = "131_1283368197.39621" 
    capture_lex $P450
    .const 'Sub' $P441 = "127_1283368197.39621" 
    capture_lex $P441
    .const 'Sub' $P435 = "125_1283368197.39621" 
    capture_lex $P435
    .const 'Sub' $P429 = "123_1283368197.39621" 
    capture_lex $P429
    .const 'Sub' $P423 = "121_1283368197.39621" 
    capture_lex $P423
    .const 'Sub' $P417 = "119_1283368197.39621" 
    capture_lex $P417
    .const 'Sub' $P409 = "117_1283368197.39621" 
    capture_lex $P409
    .const 'Sub' $P398 = "115_1283368197.39621" 
    capture_lex $P398
    .const 'Sub' $P387 = "113_1283368197.39621" 
    capture_lex $P387
    .const 'Sub' $P381 = "111_1283368197.39621" 
    capture_lex $P381
    .const 'Sub' $P375 = "109_1283368197.39621" 
    capture_lex $P375
    .const 'Sub' $P369 = "107_1283368197.39621" 
    capture_lex $P369
    .const 'Sub' $P363 = "105_1283368197.39621" 
    capture_lex $P363
    .const 'Sub' $P357 = "103_1283368197.39621" 
    capture_lex $P357
    .const 'Sub' $P351 = "101_1283368197.39621" 
    capture_lex $P351
    .const 'Sub' $P345 = "99_1283368197.39621" 
    capture_lex $P345
    .const 'Sub' $P339 = "97_1283368197.39621" 
    capture_lex $P339
    .const 'Sub' $P327 = "93_1283368197.39621" 
    capture_lex $P327
    .const 'Sub' $P317 = "91_1283368197.39621" 
    capture_lex $P317
    .const 'Sub' $P310 = "89_1283368197.39621" 
    capture_lex $P310
    .const 'Sub' $P298 = "87_1283368197.39621" 
    capture_lex $P298
    .const 'Sub' $P291 = "85_1283368197.39621" 
    capture_lex $P291
    .const 'Sub' $P285 = "83_1283368197.39621" 
    capture_lex $P285
    .const 'Sub' $P279 = "81_1283368197.39621" 
    capture_lex $P279
    .const 'Sub' $P272 = "79_1283368197.39621" 
    capture_lex $P272
    .const 'Sub' $P265 = "77_1283368197.39621" 
    capture_lex $P265
    .const 'Sub' $P258 = "75_1283368197.39621" 
    capture_lex $P258
    .const 'Sub' $P251 = "73_1283368197.39621" 
    capture_lex $P251
    .const 'Sub' $P245 = "71_1283368197.39621" 
    capture_lex $P245
    .const 'Sub' $P239 = "69_1283368197.39621" 
    capture_lex $P239
    .const 'Sub' $P233 = "67_1283368197.39621" 
    capture_lex $P233
    .const 'Sub' $P227 = "65_1283368197.39621" 
    capture_lex $P227
    .const 'Sub' $P221 = "63_1283368197.39621" 
    capture_lex $P221
    .const 'Sub' $P216 = "61_1283368197.39621" 
    capture_lex $P216
    .const 'Sub' $P211 = "59_1283368197.39621" 
    capture_lex $P211
    .const 'Sub' $P205 = "57_1283368197.39621" 
    capture_lex $P205
    .const 'Sub' $P199 = "55_1283368197.39621" 
    capture_lex $P199
    .const 'Sub' $P193 = "53_1283368197.39621" 
    capture_lex $P193
    .const 'Sub' $P178 = "48_1283368197.39621" 
    capture_lex $P178
    .const 'Sub' $P163 = "46_1283368197.39621" 
    capture_lex $P163
    .const 'Sub' $P156 = "44_1283368197.39621" 
    capture_lex $P156
    .const 'Sub' $P149 = "42_1283368197.39621" 
    capture_lex $P149
    .const 'Sub' $P142 = "40_1283368197.39621" 
    capture_lex $P142
    .const 'Sub' $P125 = "35_1283368197.39621" 
    capture_lex $P125
    .const 'Sub' $P113 = "32_1283368197.39621" 
    capture_lex $P113
    .const 'Sub' $P106 = "30_1283368197.39621" 
    capture_lex $P106
    .const 'Sub' $P97 = "28_1283368197.39621" 
    capture_lex $P97
    .const 'Sub' $P87 = "26_1283368197.39621" 
    capture_lex $P87
    .const 'Sub' $P80 = "24_1283368197.39621" 
    capture_lex $P80
    .const 'Sub' $P68 = "22_1283368197.39621" 
    capture_lex $P68
    .const 'Sub' $P61 = "20_1283368197.39621" 
    capture_lex $P61
    .const 'Sub' $P54 = "18_1283368197.39621" 
    capture_lex $P54
    .const 'Sub' $P44 = "15_1283368197.39621" 
    capture_lex $P44
    .const 'Sub' $P37 = "13_1283368197.39621" 
    capture_lex $P37
    .const 'Sub' $P15 = "12_1283368197.39621" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    .const 'Sub' $P570 = "160_1283368197.39621" 
    capture_lex $P570
    .return ($P570)
    .const 'Sub' $P578 = "162_1283368197.39621" 
    .return ($P578)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.include "except_types.pasm"
.sub "obs"  :subid("12_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if has_param_20, optparam_165
    new $P21, "String"
    assign $P21, "in Perl 6"
    set param_20, $P21
  optparam_165:
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
.sub "ws"  :subid("13_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx38_debug, debug_166
    rx38_cur."!cursor_debug"("START", "ws")
  debug_166:
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
    if_null rx38_debug, debug_167
    rx38_cur."!cursor_debug"("PASS", "ws", " at pos=", rx38_pos)
  debug_167:
    .return (rx38_cur)
  rx38_restart:
.annotate 'line', 3
    if_null rx38_debug, debug_168
    rx38_cur."!cursor_debug"("NEXT", "ws")
  debug_168:
  rx38_fail:
    (rx38_rep, rx38_pos, $I10, $P10) = rx38_cur."!mark_fail"(0)
    lt rx38_pos, -1, rx38_done
    eq rx38_pos, -1, rx38_fail
    jump $I10
  rx38_done:
    rx38_cur."!cursor_fail"()
    if_null rx38_debug, debug_169
    rx38_cur."!cursor_debug"("FAIL", "ws")
  debug_169:
    .return (rx38_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__ws"  :subid("14_1283368197.39621") :method
.annotate 'line', 3
    new $P40, "ResizablePMCArray"
    push $P40, ""
    .return ($P40)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "normspace"  :subid("15_1283368197.39621") :method :outer("11_1283368197.39621")
.annotate 'line', 3
    .const 'Sub' $P50 = "17_1283368197.39621" 
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
    if_null rx45_debug, debug_170
    rx45_cur."!cursor_debug"("START", "normspace")
  debug_170:
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
    .const 'Sub' $P50 = "17_1283368197.39621" 
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
    if_null rx45_debug, debug_175
    rx45_cur."!cursor_debug"("PASS", "normspace", " at pos=", rx45_pos)
  debug_175:
    .return (rx45_cur)
  rx45_restart:
.annotate 'line', 3
    if_null rx45_debug, debug_176
    rx45_cur."!cursor_debug"("NEXT", "normspace")
  debug_176:
  rx45_fail:
    (rx45_rep, rx45_pos, $I10, $P10) = rx45_cur."!mark_fail"(0)
    lt rx45_pos, -1, rx45_done
    eq rx45_pos, -1, rx45_fail
    jump $I10
  rx45_done:
    rx45_cur."!cursor_fail"()
    if_null rx45_debug, debug_177
    rx45_cur."!cursor_debug"("FAIL", "normspace")
  debug_177:
    .return (rx45_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__normspace"  :subid("16_1283368197.39621") :method
.annotate 'line', 3
    new $P47, "ResizablePMCArray"
    push $P47, ""
    .return ($P47)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block49"  :anon :subid("17_1283368197.39621") :method :outer("15_1283368197.39621")
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
    if_null rx51_debug, debug_171
    rx51_cur."!cursor_debug"("START", "")
  debug_171:
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
    if_null rx51_debug, debug_172
    rx51_cur."!cursor_debug"("PASS", "", " at pos=", rx51_pos)
  debug_172:
    .return (rx51_cur)
  rx51_restart:
    if_null rx51_debug, debug_173
    rx51_cur."!cursor_debug"("NEXT", "")
  debug_173:
  rx51_fail:
    (rx51_rep, rx51_pos, $I10, $P10) = rx51_cur."!mark_fail"(0)
    lt rx51_pos, -1, rx51_done
    eq rx51_pos, -1, rx51_fail
    jump $I10
  rx51_done:
    rx51_cur."!cursor_fail"()
    if_null rx51_debug, debug_174
    rx51_cur."!cursor_debug"("FAIL", "")
  debug_174:
    .return (rx51_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "identifier"  :subid("18_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx55_debug, debug_178
    rx55_cur."!cursor_debug"("START", "identifier")
  debug_178:
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
    if_null rx55_debug, debug_179
    rx55_cur."!cursor_debug"("PASS", "identifier", " at pos=", rx55_pos)
  debug_179:
    .return (rx55_cur)
  rx55_restart:
.annotate 'line', 3
    if_null rx55_debug, debug_180
    rx55_cur."!cursor_debug"("NEXT", "identifier")
  debug_180:
  rx55_fail:
    (rx55_rep, rx55_pos, $I10, $P10) = rx55_cur."!mark_fail"(0)
    lt rx55_pos, -1, rx55_done
    eq rx55_pos, -1, rx55_fail
    jump $I10
  rx55_done:
    rx55_cur."!cursor_fail"()
    if_null rx55_debug, debug_181
    rx55_cur."!cursor_debug"("FAIL", "identifier")
  debug_181:
    .return (rx55_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__identifier"  :subid("19_1283368197.39621") :method
.annotate 'line', 3
    $P57 = self."!PREFIX__!subrule"("ident", "")
    new $P58, "ResizablePMCArray"
    push $P58, $P57
    .return ($P58)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "arg"  :subid("20_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx62_debug, debug_182
    rx62_cur."!cursor_debug"("START", "arg")
  debug_182:
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
    if_null rx62_debug, debug_183
    rx62_cur."!cursor_debug"("PASS", "arg", " at pos=", rx62_pos)
  debug_183:
    .return (rx62_cur)
  rx62_restart:
.annotate 'line', 3
    if_null rx62_debug, debug_184
    rx62_cur."!cursor_debug"("NEXT", "arg")
  debug_184:
  rx62_fail:
    (rx62_rep, rx62_pos, $I10, $P10) = rx62_cur."!mark_fail"(0)
    lt rx62_pos, -1, rx62_done
    eq rx62_pos, -1, rx62_fail
    jump $I10
  rx62_done:
    rx62_cur."!cursor_fail"()
    if_null rx62_debug, debug_185
    rx62_cur."!cursor_debug"("FAIL", "arg")
  debug_185:
    .return (rx62_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__arg"  :subid("21_1283368197.39621") :method
.annotate 'line', 3
    new $P64, "ResizablePMCArray"
    push $P64, ""
    push $P64, "\""
    push $P64, "'"
    .return ($P64)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "arglist"  :subid("22_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx69_debug, debug_186
    rx69_cur."!cursor_debug"("START", "arglist")
  debug_186:
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
    if_null rx69_debug, debug_187
    rx69_cur."!cursor_debug"("PASS", "arglist", " at pos=", rx69_pos)
  debug_187:
    .return (rx69_cur)
  rx69_restart:
.annotate 'line', 3
    if_null rx69_debug, debug_188
    rx69_cur."!cursor_debug"("NEXT", "arglist")
  debug_188:
  rx69_fail:
    (rx69_rep, rx69_pos, $I10, $P10) = rx69_cur."!mark_fail"(0)
    lt rx69_pos, -1, rx69_done
    eq rx69_pos, -1, rx69_fail
    jump $I10
  rx69_done:
    rx69_cur."!cursor_fail"()
    if_null rx69_debug, debug_189
    rx69_cur."!cursor_debug"("FAIL", "arglist")
  debug_189:
    .return (rx69_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__arglist"  :subid("23_1283368197.39621") :method
.annotate 'line', 3
    $P71 = self."!PREFIX__!subrule"("ws", "")
    new $P72, "ResizablePMCArray"
    push $P72, $P71
    .return ($P72)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "TOP"  :subid("24_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx81_debug, debug_190
    rx81_cur."!cursor_debug"("START", "TOP")
  debug_190:
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
    if_null rx81_debug, debug_191
    rx81_cur."!cursor_debug"("PASS", "TOP", " at pos=", rx81_pos)
  debug_191:
    .return (rx81_cur)
  rx81_restart:
.annotate 'line', 3
    if_null rx81_debug, debug_192
    rx81_cur."!cursor_debug"("NEXT", "TOP")
  debug_192:
  rx81_fail:
    (rx81_rep, rx81_pos, $I10, $P10) = rx81_cur."!mark_fail"(0)
    lt rx81_pos, -1, rx81_done
    eq rx81_pos, -1, rx81_fail
    jump $I10
  rx81_done:
    rx81_cur."!cursor_fail"()
    if_null rx81_debug, debug_193
    rx81_cur."!cursor_debug"("FAIL", "TOP")
  debug_193:
    .return (rx81_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__TOP"  :subid("25_1283368197.39621") :method
.annotate 'line', 3
    $P83 = self."!PREFIX__!subrule"("nibbler", "")
    new $P84, "ResizablePMCArray"
    push $P84, $P83
    .return ($P84)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "nibbler"  :subid("26_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx88_debug, debug_194
    rx88_cur."!cursor_debug"("START", "nibbler")
  debug_194:
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
    if_null rx88_debug, debug_195
    rx88_cur."!cursor_debug"("PASS", "nibbler", " at pos=", rx88_pos)
  debug_195:
    .return (rx88_cur)
  rx88_restart:
.annotate 'line', 3
    if_null rx88_debug, debug_196
    rx88_cur."!cursor_debug"("NEXT", "nibbler")
  debug_196:
  rx88_fail:
    (rx88_rep, rx88_pos, $I10, $P10) = rx88_cur."!mark_fail"(0)
    lt rx88_pos, -1, rx88_done
    eq rx88_pos, -1, rx88_fail
    jump $I10
  rx88_done:
    rx88_cur."!cursor_fail"()
    if_null rx88_debug, debug_197
    rx88_cur."!cursor_debug"("FAIL", "nibbler")
  debug_197:
    .return (rx88_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__nibbler"  :subid("27_1283368197.39621") :method
.annotate 'line', 3
    new $P90, "ResizablePMCArray"
    push $P90, ""
    .return ($P90)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "termconj"  :subid("28_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx98_debug, debug_198
    rx98_cur."!cursor_debug"("START", "termconj")
  debug_198:
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
    if_null rx98_debug, debug_199
    rx98_cur."!cursor_debug"("PASS", "termconj", " at pos=", rx98_pos)
  debug_199:
    .return (rx98_cur)
  rx98_restart:
.annotate 'line', 3
    if_null rx98_debug, debug_200
    rx98_cur."!cursor_debug"("NEXT", "termconj")
  debug_200:
  rx98_fail:
    (rx98_rep, rx98_pos, $I10, $P10) = rx98_cur."!mark_fail"(0)
    lt rx98_pos, -1, rx98_done
    eq rx98_pos, -1, rx98_fail
    jump $I10
  rx98_done:
    rx98_cur."!cursor_fail"()
    if_null rx98_debug, debug_201
    rx98_cur."!cursor_debug"("FAIL", "termconj")
  debug_201:
    .return (rx98_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__termconj"  :subid("29_1283368197.39621") :method
.annotate 'line', 3
    $P100 = self."!PREFIX__!subrule"("termish", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "termish"  :subid("30_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx107_debug, debug_202
    rx107_cur."!cursor_debug"("START", "termish")
  debug_202:
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
    if_null rx107_debug, debug_203
    rx107_cur."!cursor_debug"("PASS", "termish", " at pos=", rx107_pos)
  debug_203:
    .return (rx107_cur)
  rx107_restart:
.annotate 'line', 3
    if_null rx107_debug, debug_204
    rx107_cur."!cursor_debug"("NEXT", "termish")
  debug_204:
  rx107_fail:
    (rx107_rep, rx107_pos, $I10, $P10) = rx107_cur."!mark_fail"(0)
    lt rx107_pos, -1, rx107_done
    eq rx107_pos, -1, rx107_fail
    jump $I10
  rx107_done:
    rx107_cur."!cursor_fail"()
    if_null rx107_debug, debug_205
    rx107_cur."!cursor_debug"("FAIL", "termish")
  debug_205:
    .return (rx107_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__termish"  :subid("31_1283368197.39621") :method
.annotate 'line', 3
    new $P109, "ResizablePMCArray"
    push $P109, ""
    .return ($P109)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantified_atom"  :subid("32_1283368197.39621") :method :outer("11_1283368197.39621")
.annotate 'line', 3
    .const 'Sub' $P122 = "34_1283368197.39621" 
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
    if_null rx114_debug, debug_206
    rx114_cur."!cursor_debug"("START", "quantified_atom")
  debug_206:
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
    .const 'Sub' $P122 = "34_1283368197.39621" 
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
    if_null rx114_debug, debug_211
    rx114_cur."!cursor_debug"("PASS", "quantified_atom", " at pos=", rx114_pos)
  debug_211:
    .return (rx114_cur)
  rx114_restart:
.annotate 'line', 3
    if_null rx114_debug, debug_212
    rx114_cur."!cursor_debug"("NEXT", "quantified_atom")
  debug_212:
  rx114_fail:
    (rx114_rep, rx114_pos, $I10, $P10) = rx114_cur."!mark_fail"(0)
    lt rx114_pos, -1, rx114_done
    eq rx114_pos, -1, rx114_fail
    jump $I10
  rx114_done:
    rx114_cur."!cursor_fail"()
    if_null rx114_debug, debug_213
    rx114_cur."!cursor_debug"("FAIL", "quantified_atom")
  debug_213:
    .return (rx114_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantified_atom"  :subid("33_1283368197.39621") :method
.annotate 'line', 3
    $P116 = self."!PREFIX__!subrule"("atom", "")
    new $P117, "ResizablePMCArray"
    push $P117, $P116
    .return ($P117)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block121"  :anon :subid("34_1283368197.39621") :method :outer("32_1283368197.39621")
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
    if_null rx123_debug, debug_207
    rx123_cur."!cursor_debug"("START", "")
  debug_207:
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
    if_null rx123_debug, debug_208
    rx123_cur."!cursor_debug"("PASS", "", " at pos=", rx123_pos)
  debug_208:
    .return (rx123_cur)
  rx123_restart:
    if_null rx123_debug, debug_209
    rx123_cur."!cursor_debug"("NEXT", "")
  debug_209:
  rx123_fail:
    (rx123_rep, rx123_pos, $I10, $P10) = rx123_cur."!mark_fail"(0)
    lt rx123_pos, -1, rx123_done
    eq rx123_pos, -1, rx123_fail
    jump $I10
  rx123_done:
    rx123_cur."!cursor_fail"()
    if_null rx123_debug, debug_210
    rx123_cur."!cursor_debug"("FAIL", "")
  debug_210:
    .return (rx123_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "atom"  :subid("35_1283368197.39621") :method :outer("11_1283368197.39621")
.annotate 'line', 3
    .const 'Sub' $P135 = "37_1283368197.39621" 
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
    if_null rx126_debug, debug_214
    rx126_cur."!cursor_debug"("START", "atom")
  debug_214:
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
    .const 'Sub' $P135 = "37_1283368197.39621" 
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
    if_null rx126_debug, debug_219
    rx126_cur."!cursor_debug"("PASS", "atom", " at pos=", rx126_pos)
  debug_219:
    .return (rx126_cur)
  rx126_restart:
.annotate 'line', 3
    if_null rx126_debug, debug_220
    rx126_cur."!cursor_debug"("NEXT", "atom")
  debug_220:
  rx126_fail:
    (rx126_rep, rx126_pos, $I10, $P10) = rx126_cur."!mark_fail"(0)
    lt rx126_pos, -1, rx126_done
    eq rx126_pos, -1, rx126_fail
    jump $I10
  rx126_done:
    rx126_cur."!cursor_fail"()
    if_null rx126_debug, debug_221
    rx126_cur."!cursor_debug"("FAIL", "atom")
  debug_221:
    .return (rx126_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__atom"  :subid("36_1283368197.39621") :method
.annotate 'line', 3
    $P128 = self."!PREFIX__!subrule"("metachar", "")
    new $P129, "ResizablePMCArray"
    push $P129, $P128
    push $P129, ""
    .return ($P129)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block134"  :anon :subid("37_1283368197.39621") :method :outer("35_1283368197.39621")
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
    if_null rx136_debug, debug_215
    rx136_cur."!cursor_debug"("START", "")
  debug_215:
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
    if_null rx136_debug, debug_216
    rx136_cur."!cursor_debug"("PASS", "", " at pos=", rx136_pos)
  debug_216:
    .return (rx136_cur)
  rx136_restart:
    if_null rx136_debug, debug_217
    rx136_cur."!cursor_debug"("NEXT", "")
  debug_217:
  rx136_fail:
    (rx136_rep, rx136_pos, $I10, $P10) = rx136_cur."!mark_fail"(0)
    lt rx136_pos, -1, rx136_done
    eq rx136_pos, -1, rx136_fail
    jump $I10
  rx136_done:
    rx136_cur."!cursor_fail"()
    if_null rx136_debug, debug_218
    rx136_cur."!cursor_debug"("FAIL", "")
  debug_218:
    .return (rx136_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier"  :subid("38_1283368197.39621") :method
.annotate 'line', 61
    $P139 = self."!protoregex"("quantifier")
    .return ($P139)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier"  :subid("39_1283368197.39621") :method
.annotate 'line', 61
    $P141 = self."!PREFIX__!protoregex"("quantifier")
    .return ($P141)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<*>"  :subid("40_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx143_debug, debug_222
    rx143_cur."!cursor_debug"("START", "quantifier:sym<*>")
  debug_222:
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
    if_null rx143_debug, debug_223
    rx143_cur."!cursor_debug"("PASS", "quantifier:sym<*>", " at pos=", rx143_pos)
  debug_223:
    .return (rx143_cur)
  rx143_restart:
.annotate 'line', 3
    if_null rx143_debug, debug_224
    rx143_cur."!cursor_debug"("NEXT", "quantifier:sym<*>")
  debug_224:
  rx143_fail:
    (rx143_rep, rx143_pos, $I10, $P10) = rx143_cur."!mark_fail"(0)
    lt rx143_pos, -1, rx143_done
    eq rx143_pos, -1, rx143_fail
    jump $I10
  rx143_done:
    rx143_cur."!cursor_fail"()
    if_null rx143_debug, debug_225
    rx143_cur."!cursor_debug"("FAIL", "quantifier:sym<*>")
  debug_225:
    .return (rx143_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<*>"  :subid("41_1283368197.39621") :method
.annotate 'line', 3
    $P145 = self."!PREFIX__!subrule"("backmod", "*")
    new $P146, "ResizablePMCArray"
    push $P146, $P145
    .return ($P146)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<+>"  :subid("42_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx150_debug, debug_226
    rx150_cur."!cursor_debug"("START", "quantifier:sym<+>")
  debug_226:
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
    if_null rx150_debug, debug_227
    rx150_cur."!cursor_debug"("PASS", "quantifier:sym<+>", " at pos=", rx150_pos)
  debug_227:
    .return (rx150_cur)
  rx150_restart:
.annotate 'line', 3
    if_null rx150_debug, debug_228
    rx150_cur."!cursor_debug"("NEXT", "quantifier:sym<+>")
  debug_228:
  rx150_fail:
    (rx150_rep, rx150_pos, $I10, $P10) = rx150_cur."!mark_fail"(0)
    lt rx150_pos, -1, rx150_done
    eq rx150_pos, -1, rx150_fail
    jump $I10
  rx150_done:
    rx150_cur."!cursor_fail"()
    if_null rx150_debug, debug_229
    rx150_cur."!cursor_debug"("FAIL", "quantifier:sym<+>")
  debug_229:
    .return (rx150_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<+>"  :subid("43_1283368197.39621") :method
.annotate 'line', 3
    $P152 = self."!PREFIX__!subrule"("backmod", "+")
    new $P153, "ResizablePMCArray"
    push $P153, $P152
    .return ($P153)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<?>"  :subid("44_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx157_debug, debug_230
    rx157_cur."!cursor_debug"("START", "quantifier:sym<?>")
  debug_230:
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
    if_null rx157_debug, debug_231
    rx157_cur."!cursor_debug"("PASS", "quantifier:sym<?>", " at pos=", rx157_pos)
  debug_231:
    .return (rx157_cur)
  rx157_restart:
.annotate 'line', 3
    if_null rx157_debug, debug_232
    rx157_cur."!cursor_debug"("NEXT", "quantifier:sym<?>")
  debug_232:
  rx157_fail:
    (rx157_rep, rx157_pos, $I10, $P10) = rx157_cur."!mark_fail"(0)
    lt rx157_pos, -1, rx157_done
    eq rx157_pos, -1, rx157_fail
    jump $I10
  rx157_done:
    rx157_cur."!cursor_fail"()
    if_null rx157_debug, debug_233
    rx157_cur."!cursor_debug"("FAIL", "quantifier:sym<?>")
  debug_233:
    .return (rx157_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<?>"  :subid("45_1283368197.39621") :method
.annotate 'line', 3
    $P159 = self."!PREFIX__!subrule"("backmod", "?")
    new $P160, "ResizablePMCArray"
    push $P160, $P159
    .return ($P160)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<**>"  :subid("46_1283368197.39621") :method :outer("11_1283368197.39621")
.annotate 'line', 3
    .local string rx164_tgt
    .local int rx164_pos
    .local int rx164_off
    .local int rx164_eos
    .local int rx164_rep
    .local pmc rx164_cur
    .local pmc rx164_debug
    (rx164_cur, rx164_pos, rx164_tgt, $I10) = self."!cursor_start"()
    rx164_cur."!cursor_caparray"("max", "normspace")
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
    if_null rx164_debug, debug_234
    rx164_cur."!cursor_debug"("START", "quantifier:sym<**>")
  debug_234:
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
    if_null rx164_debug, debug_235
    rx164_cur."!cursor_debug"("PASS", "quantifier:sym<**>", " at pos=", rx164_pos)
  debug_235:
    .return (rx164_cur)
  rx164_restart:
.annotate 'line', 3
    if_null rx164_debug, debug_236
    rx164_cur."!cursor_debug"("NEXT", "quantifier:sym<**>")
  debug_236:
  rx164_fail:
    (rx164_rep, rx164_pos, $I10, $P10) = rx164_cur."!mark_fail"(0)
    lt rx164_pos, -1, rx164_done
    eq rx164_pos, -1, rx164_fail
    jump $I10
  rx164_done:
    rx164_cur."!cursor_fail"()
    if_null rx164_debug, debug_237
    rx164_cur."!cursor_debug"("FAIL", "quantifier:sym<**>")
  debug_237:
    .return (rx164_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<**>"  :subid("47_1283368197.39621") :method
.annotate 'line', 3
    new $P166, "ResizablePMCArray"
    push $P166, "**"
    .return ($P166)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backmod"  :subid("48_1283368197.39621") :method :outer("11_1283368197.39621")
.annotate 'line', 3
    .const 'Sub' $P186 = "50_1283368197.39621" 
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
    if_null rx179_debug, debug_238
    rx179_cur."!cursor_debug"("START", "backmod")
  debug_238:
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
    .const 'Sub' $P186 = "50_1283368197.39621" 
    capture_lex $P186
    $P10 = rx179_cur."before"($P186)
    if $P10, rx179_fail
  alt184_end:
  # rx pass
    rx179_cur."!cursor_pass"(rx179_pos, "backmod")
    if_null rx179_debug, debug_243
    rx179_cur."!cursor_debug"("PASS", "backmod", " at pos=", rx179_pos)
  debug_243:
    .return (rx179_cur)
  rx179_restart:
.annotate 'line', 3
    if_null rx179_debug, debug_244
    rx179_cur."!cursor_debug"("NEXT", "backmod")
  debug_244:
  rx179_fail:
    (rx179_rep, rx179_pos, $I10, $P10) = rx179_cur."!mark_fail"(0)
    lt rx179_pos, -1, rx179_done
    eq rx179_pos, -1, rx179_fail
    jump $I10
  rx179_done:
    rx179_cur."!cursor_fail"()
    if_null rx179_debug, debug_245
    rx179_cur."!cursor_debug"("FAIL", "backmod")
  debug_245:
    .return (rx179_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backmod"  :subid("49_1283368197.39621") :method
.annotate 'line', 3
    new $P181, "ResizablePMCArray"
    push $P181, ""
    .return ($P181)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block185"  :anon :subid("50_1283368197.39621") :method :outer("48_1283368197.39621")
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
    if_null rx187_debug, debug_239
    rx187_cur."!cursor_debug"("START", "")
  debug_239:
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
    if_null rx187_debug, debug_240
    rx187_cur."!cursor_debug"("PASS", "", " at pos=", rx187_pos)
  debug_240:
    .return (rx187_cur)
  rx187_restart:
    if_null rx187_debug, debug_241
    rx187_cur."!cursor_debug"("NEXT", "")
  debug_241:
  rx187_fail:
    (rx187_rep, rx187_pos, $I10, $P10) = rx187_cur."!mark_fail"(0)
    lt rx187_pos, -1, rx187_done
    eq rx187_pos, -1, rx187_fail
    jump $I10
  rx187_done:
    rx187_cur."!cursor_fail"()
    if_null rx187_debug, debug_242
    rx187_cur."!cursor_debug"("FAIL", "")
  debug_242:
    .return (rx187_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar"  :subid("51_1283368197.39621") :method
.annotate 'line', 82
    $P190 = self."!protoregex"("metachar")
    .return ($P190)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar"  :subid("52_1283368197.39621") :method
.annotate 'line', 82
    $P192 = self."!PREFIX__!protoregex"("metachar")
    .return ($P192)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<ws>"  :subid("53_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx194_debug, debug_246
    rx194_cur."!cursor_debug"("START", "metachar:sym<ws>")
  debug_246:
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
    if_null rx194_debug, debug_247
    rx194_cur."!cursor_debug"("PASS", "metachar:sym<ws>", " at pos=", rx194_pos)
  debug_247:
    .return (rx194_cur)
  rx194_restart:
.annotate 'line', 3
    if_null rx194_debug, debug_248
    rx194_cur."!cursor_debug"("NEXT", "metachar:sym<ws>")
  debug_248:
  rx194_fail:
    (rx194_rep, rx194_pos, $I10, $P10) = rx194_cur."!mark_fail"(0)
    lt rx194_pos, -1, rx194_done
    eq rx194_pos, -1, rx194_fail
    jump $I10
  rx194_done:
    rx194_cur."!cursor_fail"()
    if_null rx194_debug, debug_249
    rx194_cur."!cursor_debug"("FAIL", "metachar:sym<ws>")
  debug_249:
    .return (rx194_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<ws>"  :subid("54_1283368197.39621") :method
.annotate 'line', 3
    $P196 = self."!PREFIX__!subrule"("normspace", "")
    new $P197, "ResizablePMCArray"
    push $P197, $P196
    .return ($P197)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<[ ]>"  :subid("55_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx200_debug, debug_250
    rx200_cur."!cursor_debug"("START", "metachar:sym<[ ]>")
  debug_250:
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
    if_null rx200_debug, debug_251
    rx200_cur."!cursor_debug"("PASS", "metachar:sym<[ ]>", " at pos=", rx200_pos)
  debug_251:
    .return (rx200_cur)
  rx200_restart:
.annotate 'line', 3
    if_null rx200_debug, debug_252
    rx200_cur."!cursor_debug"("NEXT", "metachar:sym<[ ]>")
  debug_252:
  rx200_fail:
    (rx200_rep, rx200_pos, $I10, $P10) = rx200_cur."!mark_fail"(0)
    lt rx200_pos, -1, rx200_done
    eq rx200_pos, -1, rx200_fail
    jump $I10
  rx200_done:
    rx200_cur."!cursor_fail"()
    if_null rx200_debug, debug_253
    rx200_cur."!cursor_debug"("FAIL", "metachar:sym<[ ]>")
  debug_253:
    .return (rx200_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<[ ]>"  :subid("56_1283368197.39621") :method
.annotate 'line', 3
    $P202 = self."!PREFIX__!subrule"("nibbler", "[")
    new $P203, "ResizablePMCArray"
    push $P203, $P202
    .return ($P203)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<( )>"  :subid("57_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx206_debug, debug_254
    rx206_cur."!cursor_debug"("START", "metachar:sym<( )>")
  debug_254:
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
    if_null rx206_debug, debug_255
    rx206_cur."!cursor_debug"("PASS", "metachar:sym<( )>", " at pos=", rx206_pos)
  debug_255:
    .return (rx206_cur)
  rx206_restart:
.annotate 'line', 3
    if_null rx206_debug, debug_256
    rx206_cur."!cursor_debug"("NEXT", "metachar:sym<( )>")
  debug_256:
  rx206_fail:
    (rx206_rep, rx206_pos, $I10, $P10) = rx206_cur."!mark_fail"(0)
    lt rx206_pos, -1, rx206_done
    eq rx206_pos, -1, rx206_fail
    jump $I10
  rx206_done:
    rx206_cur."!cursor_fail"()
    if_null rx206_debug, debug_257
    rx206_cur."!cursor_debug"("FAIL", "metachar:sym<( )>")
  debug_257:
    .return (rx206_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<( )>"  :subid("58_1283368197.39621") :method
.annotate 'line', 3
    $P208 = self."!PREFIX__!subrule"("nibbler", "(")
    new $P209, "ResizablePMCArray"
    push $P209, $P208
    .return ($P209)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<'>"  :subid("59_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx212_debug, debug_258
    rx212_cur."!cursor_debug"("START", "metachar:sym<'>")
  debug_258:
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
    if_null rx212_debug, debug_259
    rx212_cur."!cursor_debug"("PASS", "metachar:sym<'>", " at pos=", rx212_pos)
  debug_259:
    .return (rx212_cur)
  rx212_restart:
.annotate 'line', 3
    if_null rx212_debug, debug_260
    rx212_cur."!cursor_debug"("NEXT", "metachar:sym<'>")
  debug_260:
  rx212_fail:
    (rx212_rep, rx212_pos, $I10, $P10) = rx212_cur."!mark_fail"(0)
    lt rx212_pos, -1, rx212_done
    eq rx212_pos, -1, rx212_fail
    jump $I10
  rx212_done:
    rx212_cur."!cursor_fail"()
    if_null rx212_debug, debug_261
    rx212_cur."!cursor_debug"("FAIL", "metachar:sym<'>")
  debug_261:
    .return (rx212_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<'>"  :subid("60_1283368197.39621") :method
.annotate 'line', 3
    new $P214, "ResizablePMCArray"
    push $P214, "'"
    .return ($P214)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<\">"  :subid("61_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx217_debug, debug_262
    rx217_cur."!cursor_debug"("START", "metachar:sym<\">")
  debug_262:
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
    if_null rx217_debug, debug_263
    rx217_cur."!cursor_debug"("PASS", "metachar:sym<\">", " at pos=", rx217_pos)
  debug_263:
    .return (rx217_cur)
  rx217_restart:
.annotate 'line', 3
    if_null rx217_debug, debug_264
    rx217_cur."!cursor_debug"("NEXT", "metachar:sym<\">")
  debug_264:
  rx217_fail:
    (rx217_rep, rx217_pos, $I10, $P10) = rx217_cur."!mark_fail"(0)
    lt rx217_pos, -1, rx217_done
    eq rx217_pos, -1, rx217_fail
    jump $I10
  rx217_done:
    rx217_cur."!cursor_fail"()
    if_null rx217_debug, debug_265
    rx217_cur."!cursor_debug"("FAIL", "metachar:sym<\">")
  debug_265:
    .return (rx217_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<\">"  :subid("62_1283368197.39621") :method
.annotate 'line', 3
    new $P219, "ResizablePMCArray"
    push $P219, "\""
    .return ($P219)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<.>"  :subid("63_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx222_debug, debug_266
    rx222_cur."!cursor_debug"("START", "metachar:sym<.>")
  debug_266:
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
    if_null rx222_debug, debug_267
    rx222_cur."!cursor_debug"("PASS", "metachar:sym<.>", " at pos=", rx222_pos)
  debug_267:
    .return (rx222_cur)
  rx222_restart:
.annotate 'line', 3
    if_null rx222_debug, debug_268
    rx222_cur."!cursor_debug"("NEXT", "metachar:sym<.>")
  debug_268:
  rx222_fail:
    (rx222_rep, rx222_pos, $I10, $P10) = rx222_cur."!mark_fail"(0)
    lt rx222_pos, -1, rx222_done
    eq rx222_pos, -1, rx222_fail
    jump $I10
  rx222_done:
    rx222_cur."!cursor_fail"()
    if_null rx222_debug, debug_269
    rx222_cur."!cursor_debug"("FAIL", "metachar:sym<.>")
  debug_269:
    .return (rx222_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<.>"  :subid("64_1283368197.39621") :method
.annotate 'line', 3
    new $P224, "ResizablePMCArray"
    push $P224, "."
    .return ($P224)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^>"  :subid("65_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx228_debug, debug_270
    rx228_cur."!cursor_debug"("START", "metachar:sym<^>")
  debug_270:
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
    if_null rx228_debug, debug_271
    rx228_cur."!cursor_debug"("PASS", "metachar:sym<^>", " at pos=", rx228_pos)
  debug_271:
    .return (rx228_cur)
  rx228_restart:
.annotate 'line', 3
    if_null rx228_debug, debug_272
    rx228_cur."!cursor_debug"("NEXT", "metachar:sym<^>")
  debug_272:
  rx228_fail:
    (rx228_rep, rx228_pos, $I10, $P10) = rx228_cur."!mark_fail"(0)
    lt rx228_pos, -1, rx228_done
    eq rx228_pos, -1, rx228_fail
    jump $I10
  rx228_done:
    rx228_cur."!cursor_fail"()
    if_null rx228_debug, debug_273
    rx228_cur."!cursor_debug"("FAIL", "metachar:sym<^>")
  debug_273:
    .return (rx228_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<^>"  :subid("66_1283368197.39621") :method
.annotate 'line', 3
    new $P230, "ResizablePMCArray"
    push $P230, "^"
    .return ($P230)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^^>"  :subid("67_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx234_debug, debug_274
    rx234_cur."!cursor_debug"("START", "metachar:sym<^^>")
  debug_274:
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
    if_null rx234_debug, debug_275
    rx234_cur."!cursor_debug"("PASS", "metachar:sym<^^>", " at pos=", rx234_pos)
  debug_275:
    .return (rx234_cur)
  rx234_restart:
.annotate 'line', 3
    if_null rx234_debug, debug_276
    rx234_cur."!cursor_debug"("NEXT", "metachar:sym<^^>")
  debug_276:
  rx234_fail:
    (rx234_rep, rx234_pos, $I10, $P10) = rx234_cur."!mark_fail"(0)
    lt rx234_pos, -1, rx234_done
    eq rx234_pos, -1, rx234_fail
    jump $I10
  rx234_done:
    rx234_cur."!cursor_fail"()
    if_null rx234_debug, debug_277
    rx234_cur."!cursor_debug"("FAIL", "metachar:sym<^^>")
  debug_277:
    .return (rx234_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<^^>"  :subid("68_1283368197.39621") :method
.annotate 'line', 3
    new $P236, "ResizablePMCArray"
    push $P236, "^^"
    .return ($P236)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$>"  :subid("69_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx240_debug, debug_278
    rx240_cur."!cursor_debug"("START", "metachar:sym<$>")
  debug_278:
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
    if_null rx240_debug, debug_279
    rx240_cur."!cursor_debug"("PASS", "metachar:sym<$>", " at pos=", rx240_pos)
  debug_279:
    .return (rx240_cur)
  rx240_restart:
.annotate 'line', 3
    if_null rx240_debug, debug_280
    rx240_cur."!cursor_debug"("NEXT", "metachar:sym<$>")
  debug_280:
  rx240_fail:
    (rx240_rep, rx240_pos, $I10, $P10) = rx240_cur."!mark_fail"(0)
    lt rx240_pos, -1, rx240_done
    eq rx240_pos, -1, rx240_fail
    jump $I10
  rx240_done:
    rx240_cur."!cursor_fail"()
    if_null rx240_debug, debug_281
    rx240_cur."!cursor_debug"("FAIL", "metachar:sym<$>")
  debug_281:
    .return (rx240_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<$>"  :subid("70_1283368197.39621") :method
.annotate 'line', 3
    new $P242, "ResizablePMCArray"
    push $P242, "$"
    .return ($P242)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$$>"  :subid("71_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx246_debug, debug_282
    rx246_cur."!cursor_debug"("START", "metachar:sym<$$>")
  debug_282:
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
    if_null rx246_debug, debug_283
    rx246_cur."!cursor_debug"("PASS", "metachar:sym<$$>", " at pos=", rx246_pos)
  debug_283:
    .return (rx246_cur)
  rx246_restart:
.annotate 'line', 3
    if_null rx246_debug, debug_284
    rx246_cur."!cursor_debug"("NEXT", "metachar:sym<$$>")
  debug_284:
  rx246_fail:
    (rx246_rep, rx246_pos, $I10, $P10) = rx246_cur."!mark_fail"(0)
    lt rx246_pos, -1, rx246_done
    eq rx246_pos, -1, rx246_fail
    jump $I10
  rx246_done:
    rx246_cur."!cursor_fail"()
    if_null rx246_debug, debug_285
    rx246_cur."!cursor_debug"("FAIL", "metachar:sym<$$>")
  debug_285:
    .return (rx246_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<$$>"  :subid("72_1283368197.39621") :method
.annotate 'line', 3
    new $P248, "ResizablePMCArray"
    push $P248, "$$"
    .return ($P248)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<:::>"  :subid("73_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx252_debug, debug_286
    rx252_cur."!cursor_debug"("START", "metachar:sym<:::>")
  debug_286:
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
    if_null rx252_debug, debug_287
    rx252_cur."!cursor_debug"("PASS", "metachar:sym<:::>", " at pos=", rx252_pos)
  debug_287:
    .return (rx252_cur)
  rx252_restart:
.annotate 'line', 3
    if_null rx252_debug, debug_288
    rx252_cur."!cursor_debug"("NEXT", "metachar:sym<:::>")
  debug_288:
  rx252_fail:
    (rx252_rep, rx252_pos, $I10, $P10) = rx252_cur."!mark_fail"(0)
    lt rx252_pos, -1, rx252_done
    eq rx252_pos, -1, rx252_fail
    jump $I10
  rx252_done:
    rx252_cur."!cursor_fail"()
    if_null rx252_debug, debug_289
    rx252_cur."!cursor_debug"("FAIL", "metachar:sym<:::>")
  debug_289:
    .return (rx252_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<:::>"  :subid("74_1283368197.39621") :method
.annotate 'line', 3
    $P254 = self."!PREFIX__!subrule"("panic", ":::")
    new $P255, "ResizablePMCArray"
    push $P255, $P254
    .return ($P255)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<::>"  :subid("75_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx259_debug, debug_290
    rx259_cur."!cursor_debug"("START", "metachar:sym<::>")
  debug_290:
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
    if_null rx259_debug, debug_291
    rx259_cur."!cursor_debug"("PASS", "metachar:sym<::>", " at pos=", rx259_pos)
  debug_291:
    .return (rx259_cur)
  rx259_restart:
.annotate 'line', 3
    if_null rx259_debug, debug_292
    rx259_cur."!cursor_debug"("NEXT", "metachar:sym<::>")
  debug_292:
  rx259_fail:
    (rx259_rep, rx259_pos, $I10, $P10) = rx259_cur."!mark_fail"(0)
    lt rx259_pos, -1, rx259_done
    eq rx259_pos, -1, rx259_fail
    jump $I10
  rx259_done:
    rx259_cur."!cursor_fail"()
    if_null rx259_debug, debug_293
    rx259_cur."!cursor_debug"("FAIL", "metachar:sym<::>")
  debug_293:
    .return (rx259_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<::>"  :subid("76_1283368197.39621") :method
.annotate 'line', 3
    $P261 = self."!PREFIX__!subrule"("panic", "::")
    new $P262, "ResizablePMCArray"
    push $P262, $P261
    .return ($P262)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<lwb>"  :subid("77_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx266_debug, debug_294
    rx266_cur."!cursor_debug"("START", "metachar:sym<lwb>")
  debug_294:
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
    if_null rx266_debug, debug_295
    rx266_cur."!cursor_debug"("PASS", "metachar:sym<lwb>", " at pos=", rx266_pos)
  debug_295:
    .return (rx266_cur)
  rx266_restart:
.annotate 'line', 3
    if_null rx266_debug, debug_296
    rx266_cur."!cursor_debug"("NEXT", "metachar:sym<lwb>")
  debug_296:
  rx266_fail:
    (rx266_rep, rx266_pos, $I10, $P10) = rx266_cur."!mark_fail"(0)
    lt rx266_pos, -1, rx266_done
    eq rx266_pos, -1, rx266_fail
    jump $I10
  rx266_done:
    rx266_cur."!cursor_fail"()
    if_null rx266_debug, debug_297
    rx266_cur."!cursor_debug"("FAIL", "metachar:sym<lwb>")
  debug_297:
    .return (rx266_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<lwb>"  :subid("78_1283368197.39621") :method
.annotate 'line', 3
    new $P268, "ResizablePMCArray"
    push $P268, unicode:"\x{ab}"
    push $P268, "<<"
    .return ($P268)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<rwb>"  :subid("79_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx273_debug, debug_298
    rx273_cur."!cursor_debug"("START", "metachar:sym<rwb>")
  debug_298:
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
    if_null rx273_debug, debug_299
    rx273_cur."!cursor_debug"("PASS", "metachar:sym<rwb>", " at pos=", rx273_pos)
  debug_299:
    .return (rx273_cur)
  rx273_restart:
.annotate 'line', 3
    if_null rx273_debug, debug_300
    rx273_cur."!cursor_debug"("NEXT", "metachar:sym<rwb>")
  debug_300:
  rx273_fail:
    (rx273_rep, rx273_pos, $I10, $P10) = rx273_cur."!mark_fail"(0)
    lt rx273_pos, -1, rx273_done
    eq rx273_pos, -1, rx273_fail
    jump $I10
  rx273_done:
    rx273_cur."!cursor_fail"()
    if_null rx273_debug, debug_301
    rx273_cur."!cursor_debug"("FAIL", "metachar:sym<rwb>")
  debug_301:
    .return (rx273_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<rwb>"  :subid("80_1283368197.39621") :method
.annotate 'line', 3
    new $P275, "ResizablePMCArray"
    push $P275, unicode:"\x{bb}"
    push $P275, ">>"
    .return ($P275)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<bs>"  :subid("81_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx280_debug, debug_302
    rx280_cur."!cursor_debug"("START", "metachar:sym<bs>")
  debug_302:
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
    if_null rx280_debug, debug_303
    rx280_cur."!cursor_debug"("PASS", "metachar:sym<bs>", " at pos=", rx280_pos)
  debug_303:
    .return (rx280_cur)
  rx280_restart:
.annotate 'line', 3
    if_null rx280_debug, debug_304
    rx280_cur."!cursor_debug"("NEXT", "metachar:sym<bs>")
  debug_304:
  rx280_fail:
    (rx280_rep, rx280_pos, $I10, $P10) = rx280_cur."!mark_fail"(0)
    lt rx280_pos, -1, rx280_done
    eq rx280_pos, -1, rx280_fail
    jump $I10
  rx280_done:
    rx280_cur."!cursor_fail"()
    if_null rx280_debug, debug_305
    rx280_cur."!cursor_debug"("FAIL", "metachar:sym<bs>")
  debug_305:
    .return (rx280_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<bs>"  :subid("82_1283368197.39621") :method
.annotate 'line', 3
    $P282 = self."!PREFIX__!subrule"("backslash", "\\")
    new $P283, "ResizablePMCArray"
    push $P283, $P282
    .return ($P283)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<mod>"  :subid("83_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx286_debug, debug_306
    rx286_cur."!cursor_debug"("START", "metachar:sym<mod>")
  debug_306:
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
    if_null rx286_debug, debug_307
    rx286_cur."!cursor_debug"("PASS", "metachar:sym<mod>", " at pos=", rx286_pos)
  debug_307:
    .return (rx286_cur)
  rx286_restart:
.annotate 'line', 3
    if_null rx286_debug, debug_308
    rx286_cur."!cursor_debug"("NEXT", "metachar:sym<mod>")
  debug_308:
  rx286_fail:
    (rx286_rep, rx286_pos, $I10, $P10) = rx286_cur."!mark_fail"(0)
    lt rx286_pos, -1, rx286_done
    eq rx286_pos, -1, rx286_fail
    jump $I10
  rx286_done:
    rx286_cur."!cursor_fail"()
    if_null rx286_debug, debug_309
    rx286_cur."!cursor_debug"("FAIL", "metachar:sym<mod>")
  debug_309:
    .return (rx286_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<mod>"  :subid("84_1283368197.39621") :method
.annotate 'line', 3
    $P288 = self."!PREFIX__!subrule"("mod_internal", "")
    new $P289, "ResizablePMCArray"
    push $P289, $P288
    .return ($P289)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<~>"  :subid("85_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx292_debug, debug_310
    rx292_cur."!cursor_debug"("START", "metachar:sym<~>")
  debug_310:
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
.annotate 'line', 102
  # rx subcapture "sym"
    set_addr $I10, rxcap_297_fail
    rx292_cur."!mark_push"(0, rx292_pos, $I10)
  # rx literal  "~"
    add $I11, rx292_pos, 1
    gt $I11, rx292_eos, rx292_fail
    sub $I11, rx292_pos, rx292_off
    ord $I11, rx292_tgt, $I11
    ne $I11, 126, rx292_fail
    add rx292_pos, 1
    set_addr $I10, rxcap_297_fail
    ($I12, $I11) = rx292_cur."!mark_peek"($I10)
    rx292_cur."!cursor_pos"($I11)
    ($P10) = rx292_cur."!cursor_start"()
    $P10."!cursor_pass"(rx292_pos, "")
    rx292_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_297_done
  rxcap_297_fail:
    goto rx292_fail
  rxcap_297_done:
.annotate 'line', 103
  # rx subrule "ws" subtype=method negate=
    rx292_cur."!cursor_pos"(rx292_pos)
    $P10 = rx292_cur."ws"()
    unless $P10, rx292_fail
    rx292_pos = $P10."pos"()
  # rx subrule "quantified_atom" subtype=capture negate=
    rx292_cur."!cursor_pos"(rx292_pos)
    $P10 = rx292_cur."quantified_atom"()
    unless $P10, rx292_fail
    rx292_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("GOAL")
    rx292_pos = $P10."pos"()
.annotate 'line', 104
  # rx subrule "ws" subtype=method negate=
    rx292_cur."!cursor_pos"(rx292_pos)
    $P10 = rx292_cur."ws"()
    unless $P10, rx292_fail
    rx292_pos = $P10."pos"()
  # rx subrule "quantified_atom" subtype=capture negate=
    rx292_cur."!cursor_pos"(rx292_pos)
    $P10 = rx292_cur."quantified_atom"()
    unless $P10, rx292_fail
    rx292_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx292_pos = $P10."pos"()
.annotate 'line', 101
  # rx pass
    rx292_cur."!cursor_pass"(rx292_pos, "metachar:sym<~>")
    if_null rx292_debug, debug_311
    rx292_cur."!cursor_debug"("PASS", "metachar:sym<~>", " at pos=", rx292_pos)
  debug_311:
    .return (rx292_cur)
  rx292_restart:
.annotate 'line', 3
    if_null rx292_debug, debug_312
    rx292_cur."!cursor_debug"("NEXT", "metachar:sym<~>")
  debug_312:
  rx292_fail:
    (rx292_rep, rx292_pos, $I10, $P10) = rx292_cur."!mark_fail"(0)
    lt rx292_pos, -1, rx292_done
    eq rx292_pos, -1, rx292_fail
    jump $I10
  rx292_done:
    rx292_cur."!cursor_fail"()
    if_null rx292_debug, debug_313
    rx292_cur."!cursor_debug"("FAIL", "metachar:sym<~>")
  debug_313:
    .return (rx292_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<~>"  :subid("86_1283368197.39621") :method
.annotate 'line', 3
    $P294 = self."!PREFIX__!subrule"("ws", "~")
    new $P295, "ResizablePMCArray"
    push $P295, $P294
    .return ($P295)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<{*}>"  :subid("87_1283368197.39621") :method :outer("11_1283368197.39621")
.annotate 'line', 3
    .local string rx299_tgt
    .local int rx299_pos
    .local int rx299_off
    .local int rx299_eos
    .local int rx299_rep
    .local pmc rx299_cur
    .local pmc rx299_debug
    (rx299_cur, rx299_pos, rx299_tgt, $I10) = self."!cursor_start"()
    rx299_cur."!cursor_caparray"("key")
    getattribute rx299_debug, rx299_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx299_cur
    .local pmc match
    .lex "$/", match
    length rx299_eos, rx299_tgt
    gt rx299_pos, rx299_eos, rx299_done
    set rx299_off, 0
    lt rx299_pos, 2, rx299_start
    sub rx299_off, rx299_pos, 1
    substr rx299_tgt, rx299_tgt, rx299_off
  rx299_start:
    eq $I10, 1, rx299_restart
    if_null rx299_debug, debug_314
    rx299_cur."!cursor_debug"("START", "metachar:sym<{*}>")
  debug_314:
    $I10 = self.'from'()
    ne $I10, -1, rxscan302_done
    goto rxscan302_scan
  rxscan302_loop:
    ($P10) = rx299_cur."from"()
    inc $P10
    set rx299_pos, $P10
    ge rx299_pos, rx299_eos, rxscan302_done
  rxscan302_scan:
    set_addr $I10, rxscan302_loop
    rx299_cur."!mark_push"(0, rx299_pos, $I10)
  rxscan302_done:
.annotate 'line', 108
  # rx subcapture "sym"
    set_addr $I10, rxcap_303_fail
    rx299_cur."!mark_push"(0, rx299_pos, $I10)
  # rx literal  "{*}"
    add $I11, rx299_pos, 3
    gt $I11, rx299_eos, rx299_fail
    sub $I11, rx299_pos, rx299_off
    substr $S10, rx299_tgt, $I11, 3
    ne $S10, "{*}", rx299_fail
    add rx299_pos, 3
    set_addr $I10, rxcap_303_fail
    ($I12, $I11) = rx299_cur."!mark_peek"($I10)
    rx299_cur."!cursor_pos"($I11)
    ($P10) = rx299_cur."!cursor_start"()
    $P10."!cursor_pass"(rx299_pos, "")
    rx299_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_303_done
  rxcap_303_fail:
    goto rx299_fail
  rxcap_303_done:
.annotate 'line', 109
  # rx rxquantr304 ** 0..1
    set_addr $I10, rxquantr304_done
    rx299_cur."!mark_push"(0, rx299_pos, $I10)
  rxquantr304_loop:
  # rx enumcharlist_q negate=0  r 0..-1
    sub $I10, rx299_pos, rx299_off
    set rx299_rep, 0
    sub $I12, rx299_eos, rx299_pos
  rxenumcharlistq305_loop:
    le $I12, 0, rxenumcharlistq305_done
    substr $S10, rx299_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq305_done
    inc rx299_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq305_loop
  rxenumcharlistq305_done:
    add rx299_pos, rx299_pos, rx299_rep
  # rx literal  "#= "
    add $I11, rx299_pos, 3
    gt $I11, rx299_eos, rx299_fail
    sub $I11, rx299_pos, rx299_off
    substr $S10, rx299_tgt, $I11, 3
    ne $S10, "#= ", rx299_fail
    add rx299_pos, 3
  # rx enumcharlist_q negate=0  r 0..-1
    sub $I10, rx299_pos, rx299_off
    set rx299_rep, 0
    sub $I12, rx299_eos, rx299_pos
  rxenumcharlistq306_loop:
    le $I12, 0, rxenumcharlistq306_done
    substr $S10, rx299_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq306_done
    inc rx299_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq306_loop
  rxenumcharlistq306_done:
    add rx299_pos, rx299_pos, rx299_rep
  # rx subcapture "key"
    set_addr $I10, rxcap_309_fail
    rx299_cur."!mark_push"(0, rx299_pos, $I10)
  # rx charclass_q S r 1..-1
    sub $I10, rx299_pos, rx299_off
    find_cclass $I11, 32, rx299_tgt, $I10, rx299_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx299_fail
    add rx299_pos, rx299_off, $I11
  # rx rxquantr307 ** 0..*
    set_addr $I10, rxquantr307_done
    rx299_cur."!mark_push"(0, rx299_pos, $I10)
  rxquantr307_loop:
  # rx enumcharlist_q negate=0  r 1..-1
    sub $I10, rx299_pos, rx299_off
    set rx299_rep, 0
    sub $I12, rx299_eos, rx299_pos
  rxenumcharlistq308_loop:
    le $I12, 0, rxenumcharlistq308_done
    substr $S10, rx299_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq308_done
    inc rx299_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq308_loop
  rxenumcharlistq308_done:
    lt rx299_rep, 1, rx299_fail
    add rx299_pos, rx299_pos, rx299_rep
  # rx charclass_q S r 1..-1
    sub $I10, rx299_pos, rx299_off
    find_cclass $I11, 32, rx299_tgt, $I10, rx299_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx299_fail
    add rx299_pos, rx299_off, $I11
    set_addr $I10, rxquantr307_done
    (rx299_rep) = rx299_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr307_done
    rx299_cur."!mark_push"(rx299_rep, rx299_pos, $I10)
    goto rxquantr307_loop
  rxquantr307_done:
    set_addr $I10, rxcap_309_fail
    ($I12, $I11) = rx299_cur."!mark_peek"($I10)
    rx299_cur."!cursor_pos"($I11)
    ($P10) = rx299_cur."!cursor_start"()
    $P10."!cursor_pass"(rx299_pos, "")
    rx299_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("key")
    goto rxcap_309_done
  rxcap_309_fail:
    goto rx299_fail
  rxcap_309_done:
    set_addr $I10, rxquantr304_done
    (rx299_rep) = rx299_cur."!mark_commit"($I10)
  rxquantr304_done:
.annotate 'line', 107
  # rx pass
    rx299_cur."!cursor_pass"(rx299_pos, "metachar:sym<{*}>")
    if_null rx299_debug, debug_315
    rx299_cur."!cursor_debug"("PASS", "metachar:sym<{*}>", " at pos=", rx299_pos)
  debug_315:
    .return (rx299_cur)
  rx299_restart:
.annotate 'line', 3
    if_null rx299_debug, debug_316
    rx299_cur."!cursor_debug"("NEXT", "metachar:sym<{*}>")
  debug_316:
  rx299_fail:
    (rx299_rep, rx299_pos, $I10, $P10) = rx299_cur."!mark_fail"(0)
    lt rx299_pos, -1, rx299_done
    eq rx299_pos, -1, rx299_fail
    jump $I10
  rx299_done:
    rx299_cur."!cursor_fail"()
    if_null rx299_debug, debug_317
    rx299_cur."!cursor_debug"("FAIL", "metachar:sym<{*}>")
  debug_317:
    .return (rx299_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<{*}>"  :subid("88_1283368197.39621") :method
.annotate 'line', 3
    new $P301, "ResizablePMCArray"
    push $P301, "{*}"
    .return ($P301)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<assert>"  :subid("89_1283368197.39621") :method :outer("11_1283368197.39621")
.annotate 'line', 3
    .local string rx311_tgt
    .local int rx311_pos
    .local int rx311_off
    .local int rx311_eos
    .local int rx311_rep
    .local pmc rx311_cur
    .local pmc rx311_debug
    (rx311_cur, rx311_pos, rx311_tgt, $I10) = self."!cursor_start"()
    getattribute rx311_debug, rx311_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx311_cur
    .local pmc match
    .lex "$/", match
    length rx311_eos, rx311_tgt
    gt rx311_pos, rx311_eos, rx311_done
    set rx311_off, 0
    lt rx311_pos, 2, rx311_start
    sub rx311_off, rx311_pos, 1
    substr rx311_tgt, rx311_tgt, rx311_off
  rx311_start:
    eq $I10, 1, rx311_restart
    if_null rx311_debug, debug_318
    rx311_cur."!cursor_debug"("START", "metachar:sym<assert>")
  debug_318:
    $I10 = self.'from'()
    ne $I10, -1, rxscan315_done
    goto rxscan315_scan
  rxscan315_loop:
    ($P10) = rx311_cur."from"()
    inc $P10
    set rx311_pos, $P10
    ge rx311_pos, rx311_eos, rxscan315_done
  rxscan315_scan:
    set_addr $I10, rxscan315_loop
    rx311_cur."!mark_push"(0, rx311_pos, $I10)
  rxscan315_done:
.annotate 'line', 112
  # rx literal  "<"
    add $I11, rx311_pos, 1
    gt $I11, rx311_eos, rx311_fail
    sub $I11, rx311_pos, rx311_off
    ord $I11, rx311_tgt, $I11
    ne $I11, 60, rx311_fail
    add rx311_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx311_cur."!cursor_pos"(rx311_pos)
    $P10 = rx311_cur."assertion"()
    unless $P10, rx311_fail
    rx311_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx311_pos = $P10."pos"()
  alt316_0:
.annotate 'line', 113
    set_addr $I10, alt316_1
    rx311_cur."!mark_push"(0, rx311_pos, $I10)
  # rx literal  ">"
    add $I11, rx311_pos, 1
    gt $I11, rx311_eos, rx311_fail
    sub $I11, rx311_pos, rx311_off
    ord $I11, rx311_tgt, $I11
    ne $I11, 62, rx311_fail
    add rx311_pos, 1
    goto alt316_end
  alt316_1:
  # rx subrule "panic" subtype=method negate=
    rx311_cur."!cursor_pos"(rx311_pos)
    $P10 = rx311_cur."panic"("regex assertion not terminated by angle bracket")
    unless $P10, rx311_fail
    rx311_pos = $P10."pos"()
  alt316_end:
.annotate 'line', 111
  # rx pass
    rx311_cur."!cursor_pass"(rx311_pos, "metachar:sym<assert>")
    if_null rx311_debug, debug_319
    rx311_cur."!cursor_debug"("PASS", "metachar:sym<assert>", " at pos=", rx311_pos)
  debug_319:
    .return (rx311_cur)
  rx311_restart:
.annotate 'line', 3
    if_null rx311_debug, debug_320
    rx311_cur."!cursor_debug"("NEXT", "metachar:sym<assert>")
  debug_320:
  rx311_fail:
    (rx311_rep, rx311_pos, $I10, $P10) = rx311_cur."!mark_fail"(0)
    lt rx311_pos, -1, rx311_done
    eq rx311_pos, -1, rx311_fail
    jump $I10
  rx311_done:
    rx311_cur."!cursor_fail"()
    if_null rx311_debug, debug_321
    rx311_cur."!cursor_debug"("FAIL", "metachar:sym<assert>")
  debug_321:
    .return (rx311_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<assert>"  :subid("90_1283368197.39621") :method
.annotate 'line', 3
    $P313 = self."!PREFIX__!subrule"("assertion", "<")
    new $P314, "ResizablePMCArray"
    push $P314, $P313
    .return ($P314)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<var>"  :subid("91_1283368197.39621") :method :outer("11_1283368197.39621")
.annotate 'line', 3
    .local string rx318_tgt
    .local int rx318_pos
    .local int rx318_off
    .local int rx318_eos
    .local int rx318_rep
    .local pmc rx318_cur
    .local pmc rx318_debug
    (rx318_cur, rx318_pos, rx318_tgt, $I10) = self."!cursor_start"()
    rx318_cur."!cursor_caparray"("quantified_atom")
    getattribute rx318_debug, rx318_cur, "$!debug"
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
    eq $I10, 1, rx318_restart
    if_null rx318_debug, debug_322
    rx318_cur."!cursor_debug"("START", "metachar:sym<var>")
  debug_322:
    $I10 = self.'from'()
    ne $I10, -1, rxscan321_done
    goto rxscan321_scan
  rxscan321_loop:
    ($P10) = rx318_cur."from"()
    inc $P10
    set rx318_pos, $P10
    ge rx318_pos, rx318_eos, rxscan321_done
  rxscan321_scan:
    set_addr $I10, rxscan321_loop
    rx318_cur."!mark_push"(0, rx318_pos, $I10)
  rxscan321_done:
  alt322_0:
.annotate 'line', 117
    set_addr $I10, alt322_1
    rx318_cur."!mark_push"(0, rx318_pos, $I10)
.annotate 'line', 118
  # rx literal  "$<"
    add $I11, rx318_pos, 2
    gt $I11, rx318_eos, rx318_fail
    sub $I11, rx318_pos, rx318_off
    substr $S10, rx318_tgt, $I11, 2
    ne $S10, "$<", rx318_fail
    add rx318_pos, 2
  # rx subcapture "name"
    set_addr $I10, rxcap_324_fail
    rx318_cur."!mark_push"(0, rx318_pos, $I10)
  # rx enumcharlist_q negate=1  r 1..-1
    sub $I10, rx318_pos, rx318_off
    set rx318_rep, 0
    sub $I12, rx318_eos, rx318_pos
  rxenumcharlistq323_loop:
    le $I12, 0, rxenumcharlistq323_done
    substr $S10, rx318_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rxenumcharlistq323_done
    inc rx318_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq323_loop
  rxenumcharlistq323_done:
    lt rx318_rep, 1, rx318_fail
    add rx318_pos, rx318_pos, rx318_rep
    set_addr $I10, rxcap_324_fail
    ($I12, $I11) = rx318_cur."!mark_peek"($I10)
    rx318_cur."!cursor_pos"($I11)
    ($P10) = rx318_cur."!cursor_start"()
    $P10."!cursor_pass"(rx318_pos, "")
    rx318_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_324_done
  rxcap_324_fail:
    goto rx318_fail
  rxcap_324_done:
  # rx literal  ">"
    add $I11, rx318_pos, 1
    gt $I11, rx318_eos, rx318_fail
    sub $I11, rx318_pos, rx318_off
    ord $I11, rx318_tgt, $I11
    ne $I11, 62, rx318_fail
    add rx318_pos, 1
    goto alt322_end
  alt322_1:
.annotate 'line', 119
  # rx literal  "$"
    add $I11, rx318_pos, 1
    gt $I11, rx318_eos, rx318_fail
    sub $I11, rx318_pos, rx318_off
    ord $I11, rx318_tgt, $I11
    ne $I11, 36, rx318_fail
    add rx318_pos, 1
  # rx subcapture "pos"
    set_addr $I10, rxcap_325_fail
    rx318_cur."!mark_push"(0, rx318_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx318_pos, rx318_off
    find_not_cclass $I11, 8, rx318_tgt, $I10, rx318_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx318_fail
    add rx318_pos, rx318_off, $I11
    set_addr $I10, rxcap_325_fail
    ($I12, $I11) = rx318_cur."!mark_peek"($I10)
    rx318_cur."!cursor_pos"($I11)
    ($P10) = rx318_cur."!cursor_start"()
    $P10."!cursor_pass"(rx318_pos, "")
    rx318_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pos")
    goto rxcap_325_done
  rxcap_325_fail:
    goto rx318_fail
  rxcap_325_done:
  alt322_end:
.annotate 'line', 122
  # rx rxquantr326 ** 0..1
    set_addr $I10, rxquantr326_done
    rx318_cur."!mark_push"(0, rx318_pos, $I10)
  rxquantr326_loop:
  # rx subrule "ws" subtype=method negate=
    rx318_cur."!cursor_pos"(rx318_pos)
    $P10 = rx318_cur."ws"()
    unless $P10, rx318_fail
    rx318_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx318_pos, 1
    gt $I11, rx318_eos, rx318_fail
    sub $I11, rx318_pos, rx318_off
    ord $I11, rx318_tgt, $I11
    ne $I11, 61, rx318_fail
    add rx318_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx318_cur."!cursor_pos"(rx318_pos)
    $P10 = rx318_cur."ws"()
    unless $P10, rx318_fail
    rx318_pos = $P10."pos"()
  # rx subrule "quantified_atom" subtype=capture negate=
    rx318_cur."!cursor_pos"(rx318_pos)
    $P10 = rx318_cur."quantified_atom"()
    unless $P10, rx318_fail
    rx318_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantified_atom")
    rx318_pos = $P10."pos"()
    set_addr $I10, rxquantr326_done
    (rx318_rep) = rx318_cur."!mark_commit"($I10)
  rxquantr326_done:
.annotate 'line', 116
  # rx pass
    rx318_cur."!cursor_pass"(rx318_pos, "metachar:sym<var>")
    if_null rx318_debug, debug_323
    rx318_cur."!cursor_debug"("PASS", "metachar:sym<var>", " at pos=", rx318_pos)
  debug_323:
    .return (rx318_cur)
  rx318_restart:
.annotate 'line', 3
    if_null rx318_debug, debug_324
    rx318_cur."!cursor_debug"("NEXT", "metachar:sym<var>")
  debug_324:
  rx318_fail:
    (rx318_rep, rx318_pos, $I10, $P10) = rx318_cur."!mark_fail"(0)
    lt rx318_pos, -1, rx318_done
    eq rx318_pos, -1, rx318_fail
    jump $I10
  rx318_done:
    rx318_cur."!cursor_fail"()
    if_null rx318_debug, debug_325
    rx318_cur."!cursor_debug"("FAIL", "metachar:sym<var>")
  debug_325:
    .return (rx318_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<var>"  :subid("92_1283368197.39621") :method
.annotate 'line', 3
    new $P320, "ResizablePMCArray"
    push $P320, "$"
    push $P320, "$<"
    .return ($P320)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<PIR>"  :subid("93_1283368197.39621") :method :outer("11_1283368197.39621")
.annotate 'line', 3
    .local string rx328_tgt
    .local int rx328_pos
    .local int rx328_off
    .local int rx328_eos
    .local int rx328_rep
    .local pmc rx328_cur
    .local pmc rx328_debug
    (rx328_cur, rx328_pos, rx328_tgt, $I10) = self."!cursor_start"()
    getattribute rx328_debug, rx328_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx328_cur
    .local pmc match
    .lex "$/", match
    length rx328_eos, rx328_tgt
    gt rx328_pos, rx328_eos, rx328_done
    set rx328_off, 0
    lt rx328_pos, 2, rx328_start
    sub rx328_off, rx328_pos, 1
    substr rx328_tgt, rx328_tgt, rx328_off
  rx328_start:
    eq $I10, 1, rx328_restart
    if_null rx328_debug, debug_326
    rx328_cur."!cursor_debug"("START", "metachar:sym<PIR>")
  debug_326:
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
.annotate 'line', 126
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
    rx328_cur."!mark_push"(rx328_rep, rx328_pos, $I10)
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
.annotate 'line', 125
  # rx pass
    rx328_cur."!cursor_pass"(rx328_pos, "metachar:sym<PIR>")
    if_null rx328_debug, debug_327
    rx328_cur."!cursor_debug"("PASS", "metachar:sym<PIR>", " at pos=", rx328_pos)
  debug_327:
    .return (rx328_cur)
  rx328_restart:
.annotate 'line', 3
    if_null rx328_debug, debug_328
    rx328_cur."!cursor_debug"("NEXT", "metachar:sym<PIR>")
  debug_328:
  rx328_fail:
    (rx328_rep, rx328_pos, $I10, $P10) = rx328_cur."!mark_fail"(0)
    lt rx328_pos, -1, rx328_done
    eq rx328_pos, -1, rx328_fail
    jump $I10
  rx328_done:
    rx328_cur."!cursor_fail"()
    if_null rx328_debug, debug_329
    rx328_cur."!cursor_debug"("FAIL", "metachar:sym<PIR>")
  debug_329:
    .return (rx328_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<PIR>"  :subid("94_1283368197.39621") :method
.annotate 'line', 3
    new $P330, "ResizablePMCArray"
    push $P330, ":PIR{{"
    .return ($P330)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash"  :subid("95_1283368197.39621") :method
.annotate 'line', 129
    $P336 = self."!protoregex"("backslash")
    .return ($P336)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash"  :subid("96_1283368197.39621") :method
.annotate 'line', 129
    $P338 = self."!PREFIX__!protoregex"("backslash")
    .return ($P338)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<w>"  :subid("97_1283368197.39621") :method :outer("11_1283368197.39621")
.annotate 'line', 3
    .local string rx340_tgt
    .local int rx340_pos
    .local int rx340_off
    .local int rx340_eos
    .local int rx340_rep
    .local pmc rx340_cur
    .local pmc rx340_debug
    (rx340_cur, rx340_pos, rx340_tgt, $I10) = self."!cursor_start"()
    getattribute rx340_debug, rx340_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx340_cur
    .local pmc match
    .lex "$/", match
    length rx340_eos, rx340_tgt
    gt rx340_pos, rx340_eos, rx340_done
    set rx340_off, 0
    lt rx340_pos, 2, rx340_start
    sub rx340_off, rx340_pos, 1
    substr rx340_tgt, rx340_tgt, rx340_off
  rx340_start:
    eq $I10, 1, rx340_restart
    if_null rx340_debug, debug_330
    rx340_cur."!cursor_debug"("START", "backslash:sym<w>")
  debug_330:
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
.annotate 'line', 130
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
    if_null rx340_debug, debug_331
    rx340_cur."!cursor_debug"("PASS", "backslash:sym<w>", " at pos=", rx340_pos)
  debug_331:
    .return (rx340_cur)
  rx340_restart:
.annotate 'line', 3
    if_null rx340_debug, debug_332
    rx340_cur."!cursor_debug"("NEXT", "backslash:sym<w>")
  debug_332:
  rx340_fail:
    (rx340_rep, rx340_pos, $I10, $P10) = rx340_cur."!mark_fail"(0)
    lt rx340_pos, -1, rx340_done
    eq rx340_pos, -1, rx340_fail
    jump $I10
  rx340_done:
    rx340_cur."!cursor_fail"()
    if_null rx340_debug, debug_333
    rx340_cur."!cursor_debug"("FAIL", "backslash:sym<w>")
  debug_333:
    .return (rx340_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<w>"  :subid("98_1283368197.39621") :method
.annotate 'line', 3
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
.sub "backslash:sym<b>"  :subid("99_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx346_debug, debug_334
    rx346_cur."!cursor_debug"("START", "backslash:sym<b>")
  debug_334:
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
.annotate 'line', 131
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
    if_null rx346_debug, debug_335
    rx346_cur."!cursor_debug"("PASS", "backslash:sym<b>", " at pos=", rx346_pos)
  debug_335:
    .return (rx346_cur)
  rx346_restart:
.annotate 'line', 3
    if_null rx346_debug, debug_336
    rx346_cur."!cursor_debug"("NEXT", "backslash:sym<b>")
  debug_336:
  rx346_fail:
    (rx346_rep, rx346_pos, $I10, $P10) = rx346_cur."!mark_fail"(0)
    lt rx346_pos, -1, rx346_done
    eq rx346_pos, -1, rx346_fail
    jump $I10
  rx346_done:
    rx346_cur."!cursor_fail"()
    if_null rx346_debug, debug_337
    rx346_cur."!cursor_debug"("FAIL", "backslash:sym<b>")
  debug_337:
    .return (rx346_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<b>"  :subid("100_1283368197.39621") :method
.annotate 'line', 3
    new $P348, "ResizablePMCArray"
    push $P348, "B"
    push $P348, "b"
    .return ($P348)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<e>"  :subid("101_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx352_debug, debug_338
    rx352_cur."!cursor_debug"("START", "backslash:sym<e>")
  debug_338:
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
.annotate 'line', 132
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
    if_null rx352_debug, debug_339
    rx352_cur."!cursor_debug"("PASS", "backslash:sym<e>", " at pos=", rx352_pos)
  debug_339:
    .return (rx352_cur)
  rx352_restart:
.annotate 'line', 3
    if_null rx352_debug, debug_340
    rx352_cur."!cursor_debug"("NEXT", "backslash:sym<e>")
  debug_340:
  rx352_fail:
    (rx352_rep, rx352_pos, $I10, $P10) = rx352_cur."!mark_fail"(0)
    lt rx352_pos, -1, rx352_done
    eq rx352_pos, -1, rx352_fail
    jump $I10
  rx352_done:
    rx352_cur."!cursor_fail"()
    if_null rx352_debug, debug_341
    rx352_cur."!cursor_debug"("FAIL", "backslash:sym<e>")
  debug_341:
    .return (rx352_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<e>"  :subid("102_1283368197.39621") :method
.annotate 'line', 3
    new $P354, "ResizablePMCArray"
    push $P354, "E"
    push $P354, "e"
    .return ($P354)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<f>"  :subid("103_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx358_debug, debug_342
    rx358_cur."!cursor_debug"("START", "backslash:sym<f>")
  debug_342:
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
.annotate 'line', 133
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
    if_null rx358_debug, debug_343
    rx358_cur."!cursor_debug"("PASS", "backslash:sym<f>", " at pos=", rx358_pos)
  debug_343:
    .return (rx358_cur)
  rx358_restart:
.annotate 'line', 3
    if_null rx358_debug, debug_344
    rx358_cur."!cursor_debug"("NEXT", "backslash:sym<f>")
  debug_344:
  rx358_fail:
    (rx358_rep, rx358_pos, $I10, $P10) = rx358_cur."!mark_fail"(0)
    lt rx358_pos, -1, rx358_done
    eq rx358_pos, -1, rx358_fail
    jump $I10
  rx358_done:
    rx358_cur."!cursor_fail"()
    if_null rx358_debug, debug_345
    rx358_cur."!cursor_debug"("FAIL", "backslash:sym<f>")
  debug_345:
    .return (rx358_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<f>"  :subid("104_1283368197.39621") :method
.annotate 'line', 3
    new $P360, "ResizablePMCArray"
    push $P360, "F"
    push $P360, "f"
    .return ($P360)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<h>"  :subid("105_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx364_debug, debug_346
    rx364_cur."!cursor_debug"("START", "backslash:sym<h>")
  debug_346:
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
.annotate 'line', 134
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
    if_null rx364_debug, debug_347
    rx364_cur."!cursor_debug"("PASS", "backslash:sym<h>", " at pos=", rx364_pos)
  debug_347:
    .return (rx364_cur)
  rx364_restart:
.annotate 'line', 3
    if_null rx364_debug, debug_348
    rx364_cur."!cursor_debug"("NEXT", "backslash:sym<h>")
  debug_348:
  rx364_fail:
    (rx364_rep, rx364_pos, $I10, $P10) = rx364_cur."!mark_fail"(0)
    lt rx364_pos, -1, rx364_done
    eq rx364_pos, -1, rx364_fail
    jump $I10
  rx364_done:
    rx364_cur."!cursor_fail"()
    if_null rx364_debug, debug_349
    rx364_cur."!cursor_debug"("FAIL", "backslash:sym<h>")
  debug_349:
    .return (rx364_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<h>"  :subid("106_1283368197.39621") :method
.annotate 'line', 3
    new $P366, "ResizablePMCArray"
    push $P366, "H"
    push $P366, "h"
    .return ($P366)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<r>"  :subid("107_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx370_debug, debug_350
    rx370_cur."!cursor_debug"("START", "backslash:sym<r>")
  debug_350:
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
.annotate 'line', 135
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
    if_null rx370_debug, debug_351
    rx370_cur."!cursor_debug"("PASS", "backslash:sym<r>", " at pos=", rx370_pos)
  debug_351:
    .return (rx370_cur)
  rx370_restart:
.annotate 'line', 3
    if_null rx370_debug, debug_352
    rx370_cur."!cursor_debug"("NEXT", "backslash:sym<r>")
  debug_352:
  rx370_fail:
    (rx370_rep, rx370_pos, $I10, $P10) = rx370_cur."!mark_fail"(0)
    lt rx370_pos, -1, rx370_done
    eq rx370_pos, -1, rx370_fail
    jump $I10
  rx370_done:
    rx370_cur."!cursor_fail"()
    if_null rx370_debug, debug_353
    rx370_cur."!cursor_debug"("FAIL", "backslash:sym<r>")
  debug_353:
    .return (rx370_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<r>"  :subid("108_1283368197.39621") :method
.annotate 'line', 3
    new $P372, "ResizablePMCArray"
    push $P372, "R"
    push $P372, "r"
    .return ($P372)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<t>"  :subid("109_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx376_debug, debug_354
    rx376_cur."!cursor_debug"("START", "backslash:sym<t>")
  debug_354:
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
.annotate 'line', 136
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
    if_null rx376_debug, debug_355
    rx376_cur."!cursor_debug"("PASS", "backslash:sym<t>", " at pos=", rx376_pos)
  debug_355:
    .return (rx376_cur)
  rx376_restart:
.annotate 'line', 3
    if_null rx376_debug, debug_356
    rx376_cur."!cursor_debug"("NEXT", "backslash:sym<t>")
  debug_356:
  rx376_fail:
    (rx376_rep, rx376_pos, $I10, $P10) = rx376_cur."!mark_fail"(0)
    lt rx376_pos, -1, rx376_done
    eq rx376_pos, -1, rx376_fail
    jump $I10
  rx376_done:
    rx376_cur."!cursor_fail"()
    if_null rx376_debug, debug_357
    rx376_cur."!cursor_debug"("FAIL", "backslash:sym<t>")
  debug_357:
    .return (rx376_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<t>"  :subid("110_1283368197.39621") :method
.annotate 'line', 3
    new $P378, "ResizablePMCArray"
    push $P378, "T"
    push $P378, "t"
    .return ($P378)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<v>"  :subid("111_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx382_debug, debug_358
    rx382_cur."!cursor_debug"("START", "backslash:sym<v>")
  debug_358:
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
.annotate 'line', 137
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
    if_null rx382_debug, debug_359
    rx382_cur."!cursor_debug"("PASS", "backslash:sym<v>", " at pos=", rx382_pos)
  debug_359:
    .return (rx382_cur)
  rx382_restart:
.annotate 'line', 3
    if_null rx382_debug, debug_360
    rx382_cur."!cursor_debug"("NEXT", "backslash:sym<v>")
  debug_360:
  rx382_fail:
    (rx382_rep, rx382_pos, $I10, $P10) = rx382_cur."!mark_fail"(0)
    lt rx382_pos, -1, rx382_done
    eq rx382_pos, -1, rx382_fail
    jump $I10
  rx382_done:
    rx382_cur."!cursor_fail"()
    if_null rx382_debug, debug_361
    rx382_cur."!cursor_debug"("FAIL", "backslash:sym<v>")
  debug_361:
    .return (rx382_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<v>"  :subid("112_1283368197.39621") :method
.annotate 'line', 3
    new $P384, "ResizablePMCArray"
    push $P384, "V"
    push $P384, "v"
    .return ($P384)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<o>"  :subid("113_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx388_debug, debug_362
    rx388_cur."!cursor_debug"("START", "backslash:sym<o>")
  debug_362:
    $I10 = self.'from'()
    ne $I10, -1, rxscan395_done
    goto rxscan395_scan
  rxscan395_loop:
    ($P10) = rx388_cur."from"()
    inc $P10
    set rx388_pos, $P10
    ge rx388_pos, rx388_eos, rxscan395_done
  rxscan395_scan:
    set_addr $I10, rxscan395_loop
    rx388_cur."!mark_push"(0, rx388_pos, $I10)
  rxscan395_done:
.annotate 'line', 138
  # rx subcapture "sym"
    set_addr $I10, rxcap_396_fail
    rx388_cur."!mark_push"(0, rx388_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx388_pos, rx388_eos, rx388_fail
    sub $I10, rx388_pos, rx388_off
    substr $S10, rx388_tgt, $I10, 1
    index $I11, "oO", $S10
    lt $I11, 0, rx388_fail
    inc rx388_pos
    set_addr $I10, rxcap_396_fail
    ($I12, $I11) = rx388_cur."!mark_peek"($I10)
    rx388_cur."!cursor_pos"($I11)
    ($P10) = rx388_cur."!cursor_start"()
    $P10."!cursor_pass"(rx388_pos, "")
    rx388_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_396_done
  rxcap_396_fail:
    goto rx388_fail
  rxcap_396_done:
  alt397_0:
    set_addr $I10, alt397_1
    rx388_cur."!mark_push"(0, rx388_pos, $I10)
  # rx subrule "octint" subtype=capture negate=
    rx388_cur."!cursor_pos"(rx388_pos)
    $P10 = rx388_cur."octint"()
    unless $P10, rx388_fail
    rx388_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octint")
    rx388_pos = $P10."pos"()
    goto alt397_end
  alt397_1:
  # rx literal  "["
    add $I11, rx388_pos, 1
    gt $I11, rx388_eos, rx388_fail
    sub $I11, rx388_pos, rx388_off
    ord $I11, rx388_tgt, $I11
    ne $I11, 91, rx388_fail
    add rx388_pos, 1
  # rx subrule "octints" subtype=capture negate=
    rx388_cur."!cursor_pos"(rx388_pos)
    $P10 = rx388_cur."octints"()
    unless $P10, rx388_fail
    rx388_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octints")
    rx388_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx388_pos, 1
    gt $I11, rx388_eos, rx388_fail
    sub $I11, rx388_pos, rx388_off
    ord $I11, rx388_tgt, $I11
    ne $I11, 93, rx388_fail
    add rx388_pos, 1
  alt397_end:
  # rx pass
    rx388_cur."!cursor_pass"(rx388_pos, "backslash:sym<o>")
    if_null rx388_debug, debug_363
    rx388_cur."!cursor_debug"("PASS", "backslash:sym<o>", " at pos=", rx388_pos)
  debug_363:
    .return (rx388_cur)
  rx388_restart:
.annotate 'line', 3
    if_null rx388_debug, debug_364
    rx388_cur."!cursor_debug"("NEXT", "backslash:sym<o>")
  debug_364:
  rx388_fail:
    (rx388_rep, rx388_pos, $I10, $P10) = rx388_cur."!mark_fail"(0)
    lt rx388_pos, -1, rx388_done
    eq rx388_pos, -1, rx388_fail
    jump $I10
  rx388_done:
    rx388_cur."!cursor_fail"()
    if_null rx388_debug, debug_365
    rx388_cur."!cursor_debug"("FAIL", "backslash:sym<o>")
  debug_365:
    .return (rx388_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<o>"  :subid("114_1283368197.39621") :method
.annotate 'line', 3
    $P390 = self."!PREFIX__!subrule"("octints", "O[")
    $P391 = self."!PREFIX__!subrule"("octint", "O")
    $P392 = self."!PREFIX__!subrule"("octints", "o[")
    $P393 = self."!PREFIX__!subrule"("octint", "o")
    new $P394, "ResizablePMCArray"
    push $P394, $P390
    push $P394, $P391
    push $P394, $P392
    push $P394, $P393
    .return ($P394)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<x>"  :subid("115_1283368197.39621") :method :outer("11_1283368197.39621")
.annotate 'line', 3
    .local string rx399_tgt
    .local int rx399_pos
    .local int rx399_off
    .local int rx399_eos
    .local int rx399_rep
    .local pmc rx399_cur
    .local pmc rx399_debug
    (rx399_cur, rx399_pos, rx399_tgt, $I10) = self."!cursor_start"()
    getattribute rx399_debug, rx399_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx399_cur
    .local pmc match
    .lex "$/", match
    length rx399_eos, rx399_tgt
    gt rx399_pos, rx399_eos, rx399_done
    set rx399_off, 0
    lt rx399_pos, 2, rx399_start
    sub rx399_off, rx399_pos, 1
    substr rx399_tgt, rx399_tgt, rx399_off
  rx399_start:
    eq $I10, 1, rx399_restart
    if_null rx399_debug, debug_366
    rx399_cur."!cursor_debug"("START", "backslash:sym<x>")
  debug_366:
    $I10 = self.'from'()
    ne $I10, -1, rxscan406_done
    goto rxscan406_scan
  rxscan406_loop:
    ($P10) = rx399_cur."from"()
    inc $P10
    set rx399_pos, $P10
    ge rx399_pos, rx399_eos, rxscan406_done
  rxscan406_scan:
    set_addr $I10, rxscan406_loop
    rx399_cur."!mark_push"(0, rx399_pos, $I10)
  rxscan406_done:
.annotate 'line', 139
  # rx subcapture "sym"
    set_addr $I10, rxcap_407_fail
    rx399_cur."!mark_push"(0, rx399_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx399_pos, rx399_eos, rx399_fail
    sub $I10, rx399_pos, rx399_off
    substr $S10, rx399_tgt, $I10, 1
    index $I11, "xX", $S10
    lt $I11, 0, rx399_fail
    inc rx399_pos
    set_addr $I10, rxcap_407_fail
    ($I12, $I11) = rx399_cur."!mark_peek"($I10)
    rx399_cur."!cursor_pos"($I11)
    ($P10) = rx399_cur."!cursor_start"()
    $P10."!cursor_pass"(rx399_pos, "")
    rx399_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_407_done
  rxcap_407_fail:
    goto rx399_fail
  rxcap_407_done:
  alt408_0:
    set_addr $I10, alt408_1
    rx399_cur."!mark_push"(0, rx399_pos, $I10)
  # rx subrule "hexint" subtype=capture negate=
    rx399_cur."!cursor_pos"(rx399_pos)
    $P10 = rx399_cur."hexint"()
    unless $P10, rx399_fail
    rx399_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexint")
    rx399_pos = $P10."pos"()
    goto alt408_end
  alt408_1:
  # rx literal  "["
    add $I11, rx399_pos, 1
    gt $I11, rx399_eos, rx399_fail
    sub $I11, rx399_pos, rx399_off
    ord $I11, rx399_tgt, $I11
    ne $I11, 91, rx399_fail
    add rx399_pos, 1
  # rx subrule "hexints" subtype=capture negate=
    rx399_cur."!cursor_pos"(rx399_pos)
    $P10 = rx399_cur."hexints"()
    unless $P10, rx399_fail
    rx399_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexints")
    rx399_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx399_pos, 1
    gt $I11, rx399_eos, rx399_fail
    sub $I11, rx399_pos, rx399_off
    ord $I11, rx399_tgt, $I11
    ne $I11, 93, rx399_fail
    add rx399_pos, 1
  alt408_end:
  # rx pass
    rx399_cur."!cursor_pass"(rx399_pos, "backslash:sym<x>")
    if_null rx399_debug, debug_367
    rx399_cur."!cursor_debug"("PASS", "backslash:sym<x>", " at pos=", rx399_pos)
  debug_367:
    .return (rx399_cur)
  rx399_restart:
.annotate 'line', 3
    if_null rx399_debug, debug_368
    rx399_cur."!cursor_debug"("NEXT", "backslash:sym<x>")
  debug_368:
  rx399_fail:
    (rx399_rep, rx399_pos, $I10, $P10) = rx399_cur."!mark_fail"(0)
    lt rx399_pos, -1, rx399_done
    eq rx399_pos, -1, rx399_fail
    jump $I10
  rx399_done:
    rx399_cur."!cursor_fail"()
    if_null rx399_debug, debug_369
    rx399_cur."!cursor_debug"("FAIL", "backslash:sym<x>")
  debug_369:
    .return (rx399_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<x>"  :subid("116_1283368197.39621") :method
.annotate 'line', 3
    $P401 = self."!PREFIX__!subrule"("hexints", "X[")
    $P402 = self."!PREFIX__!subrule"("hexint", "X")
    $P403 = self."!PREFIX__!subrule"("hexints", "x[")
    $P404 = self."!PREFIX__!subrule"("hexint", "x")
    new $P405, "ResizablePMCArray"
    push $P405, $P401
    push $P405, $P402
    push $P405, $P403
    push $P405, $P404
    .return ($P405)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<c>"  :subid("117_1283368197.39621") :method :outer("11_1283368197.39621")
.annotate 'line', 3
    .local string rx410_tgt
    .local int rx410_pos
    .local int rx410_off
    .local int rx410_eos
    .local int rx410_rep
    .local pmc rx410_cur
    .local pmc rx410_debug
    (rx410_cur, rx410_pos, rx410_tgt, $I10) = self."!cursor_start"()
    getattribute rx410_debug, rx410_cur, "$!debug"
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
    if_null rx410_debug, debug_370
    rx410_cur."!cursor_debug"("START", "backslash:sym<c>")
  debug_370:
    $I10 = self.'from'()
    ne $I10, -1, rxscan415_done
    goto rxscan415_scan
  rxscan415_loop:
    ($P10) = rx410_cur."from"()
    inc $P10
    set rx410_pos, $P10
    ge rx410_pos, rx410_eos, rxscan415_done
  rxscan415_scan:
    set_addr $I10, rxscan415_loop
    rx410_cur."!mark_push"(0, rx410_pos, $I10)
  rxscan415_done:
.annotate 'line', 140
  # rx subcapture "sym"
    set_addr $I10, rxcap_416_fail
    rx410_cur."!mark_push"(0, rx410_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx410_pos, rx410_eos, rx410_fail
    sub $I10, rx410_pos, rx410_off
    substr $S10, rx410_tgt, $I10, 1
    index $I11, "cC", $S10
    lt $I11, 0, rx410_fail
    inc rx410_pos
    set_addr $I10, rxcap_416_fail
    ($I12, $I11) = rx410_cur."!mark_peek"($I10)
    rx410_cur."!cursor_pos"($I11)
    ($P10) = rx410_cur."!cursor_start"()
    $P10."!cursor_pass"(rx410_pos, "")
    rx410_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_416_done
  rxcap_416_fail:
    goto rx410_fail
  rxcap_416_done:
  # rx subrule "charspec" subtype=capture negate=
    rx410_cur."!cursor_pos"(rx410_pos)
    $P10 = rx410_cur."charspec"()
    unless $P10, rx410_fail
    rx410_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charspec")
    rx410_pos = $P10."pos"()
  # rx pass
    rx410_cur."!cursor_pass"(rx410_pos, "backslash:sym<c>")
    if_null rx410_debug, debug_371
    rx410_cur."!cursor_debug"("PASS", "backslash:sym<c>", " at pos=", rx410_pos)
  debug_371:
    .return (rx410_cur)
  rx410_restart:
.annotate 'line', 3
    if_null rx410_debug, debug_372
    rx410_cur."!cursor_debug"("NEXT", "backslash:sym<c>")
  debug_372:
  rx410_fail:
    (rx410_rep, rx410_pos, $I10, $P10) = rx410_cur."!mark_fail"(0)
    lt rx410_pos, -1, rx410_done
    eq rx410_pos, -1, rx410_fail
    jump $I10
  rx410_done:
    rx410_cur."!cursor_fail"()
    if_null rx410_debug, debug_373
    rx410_cur."!cursor_debug"("FAIL", "backslash:sym<c>")
  debug_373:
    .return (rx410_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<c>"  :subid("118_1283368197.39621") :method
.annotate 'line', 3
    $P412 = self."!PREFIX__!subrule"("charspec", "C")
    $P413 = self."!PREFIX__!subrule"("charspec", "c")
    new $P414, "ResizablePMCArray"
    push $P414, $P412
    push $P414, $P413
    .return ($P414)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<A>"  :subid("119_1283368197.39621") :method :outer("11_1283368197.39621")
.annotate 'line', 3
    .local string rx418_tgt
    .local int rx418_pos
    .local int rx418_off
    .local int rx418_eos
    .local int rx418_rep
    .local pmc rx418_cur
    .local pmc rx418_debug
    (rx418_cur, rx418_pos, rx418_tgt, $I10) = self."!cursor_start"()
    getattribute rx418_debug, rx418_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx418_cur
    .local pmc match
    .lex "$/", match
    length rx418_eos, rx418_tgt
    gt rx418_pos, rx418_eos, rx418_done
    set rx418_off, 0
    lt rx418_pos, 2, rx418_start
    sub rx418_off, rx418_pos, 1
    substr rx418_tgt, rx418_tgt, rx418_off
  rx418_start:
    eq $I10, 1, rx418_restart
    if_null rx418_debug, debug_374
    rx418_cur."!cursor_debug"("START", "backslash:sym<A>")
  debug_374:
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
.annotate 'line', 141
  # rx literal  "A"
    add $I11, rx418_pos, 1
    gt $I11, rx418_eos, rx418_fail
    sub $I11, rx418_pos, rx418_off
    ord $I11, rx418_tgt, $I11
    ne $I11, 65, rx418_fail
    add rx418_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx418_cur."!cursor_pos"(rx418_pos)
    $P10 = rx418_cur."obs"("\\A as beginning-of-string matcher", "^")
    unless $P10, rx418_fail
    rx418_pos = $P10."pos"()
  # rx pass
    rx418_cur."!cursor_pass"(rx418_pos, "backslash:sym<A>")
    if_null rx418_debug, debug_375
    rx418_cur."!cursor_debug"("PASS", "backslash:sym<A>", " at pos=", rx418_pos)
  debug_375:
    .return (rx418_cur)
  rx418_restart:
.annotate 'line', 3
    if_null rx418_debug, debug_376
    rx418_cur."!cursor_debug"("NEXT", "backslash:sym<A>")
  debug_376:
  rx418_fail:
    (rx418_rep, rx418_pos, $I10, $P10) = rx418_cur."!mark_fail"(0)
    lt rx418_pos, -1, rx418_done
    eq rx418_pos, -1, rx418_fail
    jump $I10
  rx418_done:
    rx418_cur."!cursor_fail"()
    if_null rx418_debug, debug_377
    rx418_cur."!cursor_debug"("FAIL", "backslash:sym<A>")
  debug_377:
    .return (rx418_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<A>"  :subid("120_1283368197.39621") :method
.annotate 'line', 3
    $P420 = self."!PREFIX__!subrule"("obs", "A")
    new $P421, "ResizablePMCArray"
    push $P421, $P420
    .return ($P421)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<z>"  :subid("121_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx424_debug, debug_378
    rx424_cur."!cursor_debug"("START", "backslash:sym<z>")
  debug_378:
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
.annotate 'line', 142
  # rx literal  "z"
    add $I11, rx424_pos, 1
    gt $I11, rx424_eos, rx424_fail
    sub $I11, rx424_pos, rx424_off
    ord $I11, rx424_tgt, $I11
    ne $I11, 122, rx424_fail
    add rx424_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx424_cur."!cursor_pos"(rx424_pos)
    $P10 = rx424_cur."obs"("\\z as end-of-string matcher", "$")
    unless $P10, rx424_fail
    rx424_pos = $P10."pos"()
  # rx pass
    rx424_cur."!cursor_pass"(rx424_pos, "backslash:sym<z>")
    if_null rx424_debug, debug_379
    rx424_cur."!cursor_debug"("PASS", "backslash:sym<z>", " at pos=", rx424_pos)
  debug_379:
    .return (rx424_cur)
  rx424_restart:
.annotate 'line', 3
    if_null rx424_debug, debug_380
    rx424_cur."!cursor_debug"("NEXT", "backslash:sym<z>")
  debug_380:
  rx424_fail:
    (rx424_rep, rx424_pos, $I10, $P10) = rx424_cur."!mark_fail"(0)
    lt rx424_pos, -1, rx424_done
    eq rx424_pos, -1, rx424_fail
    jump $I10
  rx424_done:
    rx424_cur."!cursor_fail"()
    if_null rx424_debug, debug_381
    rx424_cur."!cursor_debug"("FAIL", "backslash:sym<z>")
  debug_381:
    .return (rx424_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<z>"  :subid("122_1283368197.39621") :method
.annotate 'line', 3
    $P426 = self."!PREFIX__!subrule"("obs", "z")
    new $P427, "ResizablePMCArray"
    push $P427, $P426
    .return ($P427)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Z>"  :subid("123_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx430_debug, debug_382
    rx430_cur."!cursor_debug"("START", "backslash:sym<Z>")
  debug_382:
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
.annotate 'line', 143
  # rx literal  "Z"
    add $I11, rx430_pos, 1
    gt $I11, rx430_eos, rx430_fail
    sub $I11, rx430_pos, rx430_off
    ord $I11, rx430_tgt, $I11
    ne $I11, 90, rx430_fail
    add rx430_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx430_cur."!cursor_pos"(rx430_pos)
    $P10 = rx430_cur."obs"("\\Z as end-of-string matcher", "\\n?$")
    unless $P10, rx430_fail
    rx430_pos = $P10."pos"()
  # rx pass
    rx430_cur."!cursor_pass"(rx430_pos, "backslash:sym<Z>")
    if_null rx430_debug, debug_383
    rx430_cur."!cursor_debug"("PASS", "backslash:sym<Z>", " at pos=", rx430_pos)
  debug_383:
    .return (rx430_cur)
  rx430_restart:
.annotate 'line', 3
    if_null rx430_debug, debug_384
    rx430_cur."!cursor_debug"("NEXT", "backslash:sym<Z>")
  debug_384:
  rx430_fail:
    (rx430_rep, rx430_pos, $I10, $P10) = rx430_cur."!mark_fail"(0)
    lt rx430_pos, -1, rx430_done
    eq rx430_pos, -1, rx430_fail
    jump $I10
  rx430_done:
    rx430_cur."!cursor_fail"()
    if_null rx430_debug, debug_385
    rx430_cur."!cursor_debug"("FAIL", "backslash:sym<Z>")
  debug_385:
    .return (rx430_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<Z>"  :subid("124_1283368197.39621") :method
.annotate 'line', 3
    $P432 = self."!PREFIX__!subrule"("obs", "Z")
    new $P433, "ResizablePMCArray"
    push $P433, $P432
    .return ($P433)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Q>"  :subid("125_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx436_debug, debug_386
    rx436_cur."!cursor_debug"("START", "backslash:sym<Q>")
  debug_386:
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
.annotate 'line', 144
  # rx literal  "Q"
    add $I11, rx436_pos, 1
    gt $I11, rx436_eos, rx436_fail
    sub $I11, rx436_pos, rx436_off
    ord $I11, rx436_tgt, $I11
    ne $I11, 81, rx436_fail
    add rx436_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx436_cur."!cursor_pos"(rx436_pos)
    $P10 = rx436_cur."obs"("\\Q as quotemeta", "quotes or literal variable match")
    unless $P10, rx436_fail
    rx436_pos = $P10."pos"()
  # rx pass
    rx436_cur."!cursor_pass"(rx436_pos, "backslash:sym<Q>")
    if_null rx436_debug, debug_387
    rx436_cur."!cursor_debug"("PASS", "backslash:sym<Q>", " at pos=", rx436_pos)
  debug_387:
    .return (rx436_cur)
  rx436_restart:
.annotate 'line', 3
    if_null rx436_debug, debug_388
    rx436_cur."!cursor_debug"("NEXT", "backslash:sym<Q>")
  debug_388:
  rx436_fail:
    (rx436_rep, rx436_pos, $I10, $P10) = rx436_cur."!mark_fail"(0)
    lt rx436_pos, -1, rx436_done
    eq rx436_pos, -1, rx436_fail
    jump $I10
  rx436_done:
    rx436_cur."!cursor_fail"()
    if_null rx436_debug, debug_389
    rx436_cur."!cursor_debug"("FAIL", "backslash:sym<Q>")
  debug_389:
    .return (rx436_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<Q>"  :subid("126_1283368197.39621") :method
.annotate 'line', 3
    $P438 = self."!PREFIX__!subrule"("obs", "Q")
    new $P439, "ResizablePMCArray"
    push $P439, $P438
    .return ($P439)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<misc>"  :subid("127_1283368197.39621") :method :outer("11_1283368197.39621")
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
    if_null rx442_debug, debug_390
    rx442_cur."!cursor_debug"("START", "backslash:sym<misc>")
  debug_390:
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
.annotate 'line', 145
  # rx charclass W
    ge rx442_pos, rx442_eos, rx442_fail
    sub $I10, rx442_pos, rx442_off
    is_cclass $I11, 8192, rx442_tgt, $I10
    if $I11, rx442_fail
    inc rx442_pos
  # rx pass
    rx442_cur."!cursor_pass"(rx442_pos, "backslash:sym<misc>")
    if_null rx442_debug, debug_391
    rx442_cur."!cursor_debug"("PASS", "backslash:sym<misc>", " at pos=", rx442_pos)
  debug_391:
    .return (rx442_cur)
  rx442_restart:
.annotate 'line', 3
    if_null rx442_debug, debug_392
    rx442_cur."!cursor_debug"("NEXT", "backslash:sym<misc>")
  debug_392:
  rx442_fail:
    (rx442_rep, rx442_pos, $I10, $P10) = rx442_cur."!mark_fail"(0)
    lt rx442_pos, -1, rx442_done
    eq rx442_pos, -1, rx442_fail
    jump $I10
  rx442_done:
    rx442_cur."!cursor_fail"()
    if_null rx442_debug, debug_393
    rx442_cur."!cursor_debug"("FAIL", "backslash:sym<misc>")
  debug_393:
    .return (rx442_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<misc>"  :subid("128_1283368197.39621") :method
.annotate 'line', 3
    new $P444, "ResizablePMCArray"
    push $P444, ""
    .return ($P444)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion"  :subid("129_1283368197.39621") :method
.annotate 'line', 147
    $P447 = self."!protoregex"("assertion")
    .return ($P447)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion"  :subid("130_1283368197.39621") :method
.annotate 'line', 147
    $P449 = self."!PREFIX__!protoregex"("assertion")
    .return ($P449)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<?>"  :subid("131_1283368197.39621") :method :outer("11_1283368197.39621")
.annotate 'line', 3
    .const 'Sub' $P458 = "133_1283368197.39621" 
    capture_lex $P458
    .local string rx451_tgt
    .local int rx451_pos
    .local int rx451_off
    .local int rx451_eos
    .local int rx451_rep
    .local pmc rx451_cur
    .local pmc rx451_debug
    (rx451_cur, rx451_pos, rx451_tgt, $I10) = self."!cursor_start"()
    getattribute rx451_debug, rx451_cur, "$!debug"
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
    if_null rx451_debug, debug_394
    rx451_cur."!cursor_debug"("START", "assertion:sym<?>")
  debug_394:
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
.annotate 'line', 149
  # rx literal  "?"
    add $I11, rx451_pos, 1
    gt $I11, rx451_eos, rx451_fail
    sub $I11, rx451_pos, rx451_off
    ord $I11, rx451_tgt, $I11
    ne $I11, 63, rx451_fail
    add rx451_pos, 1
  alt456_0:
    set_addr $I10, alt456_1
    rx451_cur."!mark_push"(0, rx451_pos, $I10)
  # rx subrule "before" subtype=zerowidth negate=
    rx451_cur."!cursor_pos"(rx451_pos)
    .const 'Sub' $P458 = "133_1283368197.39621" 
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
    if_null rx451_debug, debug_399
    rx451_cur."!cursor_debug"("PASS", "assertion:sym<?>", " at pos=", rx451_pos)
  debug_399:
    .return (rx451_cur)
  rx451_restart:
.annotate 'line', 3
    if_null rx451_debug, debug_400
    rx451_cur."!cursor_debug"("NEXT", "assertion:sym<?>")
  debug_400:
  rx451_fail:
    (rx451_rep, rx451_pos, $I10, $P10) = rx451_cur."!mark_fail"(0)
    lt rx451_pos, -1, rx451_done
    eq rx451_pos, -1, rx451_fail
    jump $I10
  rx451_done:
    rx451_cur."!cursor_fail"()
    if_null rx451_debug, debug_401
    rx451_cur."!cursor_debug"("FAIL", "assertion:sym<?>")
  debug_401:
    .return (rx451_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<?>"  :subid("132_1283368197.39621") :method
.annotate 'line', 3
    $P453 = self."!PREFIX__!subrule"("assertion", "?")
    new $P454, "ResizablePMCArray"
    push $P454, $P453
    push $P454, "?"
    .return ($P454)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block457"  :anon :subid("133_1283368197.39621") :method :outer("131_1283368197.39621")
.annotate 'line', 149
    .local string rx459_tgt
    .local int rx459_pos
    .local int rx459_off
    .local int rx459_eos
    .local int rx459_rep
    .local pmc rx459_cur
    .local pmc rx459_debug
    (rx459_cur, rx459_pos, rx459_tgt, $I10) = self."!cursor_start"()
    getattribute rx459_debug, rx459_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx459_cur
    .local pmc match
    .lex "$/", match
    length rx459_eos, rx459_tgt
    gt rx459_pos, rx459_eos, rx459_done
    set rx459_off, 0
    lt rx459_pos, 2, rx459_start
    sub rx459_off, rx459_pos, 1
    substr rx459_tgt, rx459_tgt, rx459_off
  rx459_start:
    eq $I10, 1, rx459_restart
    if_null rx459_debug, debug_395
    rx459_cur."!cursor_debug"("START", "")
  debug_395:
    $I10 = self.'from'()
    ne $I10, -1, rxscan460_done
    goto rxscan460_scan
  rxscan460_loop:
    ($P10) = rx459_cur."from"()
    inc $P10
    set rx459_pos, $P10
    ge rx459_pos, rx459_eos, rxscan460_done
  rxscan460_scan:
    set_addr $I10, rxscan460_loop
    rx459_cur."!mark_push"(0, rx459_pos, $I10)
  rxscan460_done:
  # rx literal  ">"
    add $I11, rx459_pos, 1
    gt $I11, rx459_eos, rx459_fail
    sub $I11, rx459_pos, rx459_off
    ord $I11, rx459_tgt, $I11
    ne $I11, 62, rx459_fail
    add rx459_pos, 1
  # rx pass
    rx459_cur."!cursor_pass"(rx459_pos, "")
    if_null rx459_debug, debug_396
    rx459_cur."!cursor_debug"("PASS", "", " at pos=", rx459_pos)
  debug_396:
    .return (rx459_cur)
  rx459_restart:
    if_null rx459_debug, debug_397
    rx459_cur."!cursor_debug"("NEXT", "")
  debug_397:
  rx459_fail:
    (rx459_rep, rx459_pos, $I10, $P10) = rx459_cur."!mark_fail"(0)
    lt rx459_pos, -1, rx459_done
    eq rx459_pos, -1, rx459_fail
    jump $I10
  rx459_done:
    rx459_cur."!cursor_fail"()
    if_null rx459_debug, debug_398
    rx459_cur."!cursor_debug"("FAIL", "")
  debug_398:
    .return (rx459_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<!>"  :subid("134_1283368197.39621") :method :outer("11_1283368197.39621")
.annotate 'line', 3
    .const 'Sub' $P469 = "136_1283368197.39621" 
    capture_lex $P469
    .local string rx462_tgt
    .local int rx462_pos
    .local int rx462_off
    .local int rx462_eos
    .local int rx462_rep
    .local pmc rx462_cur
    .local pmc rx462_debug
    (rx462_cur, rx462_pos, rx462_tgt, $I10) = self."!cursor_start"()
    getattribute rx462_debug, rx462_cur, "$!debug"
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
    if_null rx462_debug, debug_402
    rx462_cur."!cursor_debug"("START", "assertion:sym<!>")
  debug_402:
    $I10 = self.'from'()
    ne $I10, -1, rxscan466_done
    goto rxscan466_scan
  rxscan466_loop:
    ($P10) = rx462_cur."from"()
    inc $P10
    set rx462_pos, $P10
    ge rx462_pos, rx462_eos, rxscan466_done
  rxscan466_scan:
    set_addr $I10, rxscan466_loop
    rx462_cur."!mark_push"(0, rx462_pos, $I10)
  rxscan466_done:
.annotate 'line', 150
  # rx literal  "!"
    add $I11, rx462_pos, 1
    gt $I11, rx462_eos, rx462_fail
    sub $I11, rx462_pos, rx462_off
    ord $I11, rx462_tgt, $I11
    ne $I11, 33, rx462_fail
    add rx462_pos, 1
  alt467_0:
    set_addr $I10, alt467_1
    rx462_cur."!mark_push"(0, rx462_pos, $I10)
  # rx subrule "before" subtype=zerowidth negate=
    rx462_cur."!cursor_pos"(rx462_pos)
    .const 'Sub' $P469 = "136_1283368197.39621" 
    capture_lex $P469
    $P10 = rx462_cur."before"($P469)
    unless $P10, rx462_fail
    goto alt467_end
  alt467_1:
  # rx subrule "assertion" subtype=capture negate=
    rx462_cur."!cursor_pos"(rx462_pos)
    $P10 = rx462_cur."assertion"()
    unless $P10, rx462_fail
    rx462_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx462_pos = $P10."pos"()
  alt467_end:
  # rx pass
    rx462_cur."!cursor_pass"(rx462_pos, "assertion:sym<!>")
    if_null rx462_debug, debug_407
    rx462_cur."!cursor_debug"("PASS", "assertion:sym<!>", " at pos=", rx462_pos)
  debug_407:
    .return (rx462_cur)
  rx462_restart:
.annotate 'line', 3
    if_null rx462_debug, debug_408
    rx462_cur."!cursor_debug"("NEXT", "assertion:sym<!>")
  debug_408:
  rx462_fail:
    (rx462_rep, rx462_pos, $I10, $P10) = rx462_cur."!mark_fail"(0)
    lt rx462_pos, -1, rx462_done
    eq rx462_pos, -1, rx462_fail
    jump $I10
  rx462_done:
    rx462_cur."!cursor_fail"()
    if_null rx462_debug, debug_409
    rx462_cur."!cursor_debug"("FAIL", "assertion:sym<!>")
  debug_409:
    .return (rx462_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<!>"  :subid("135_1283368197.39621") :method
.annotate 'line', 3
    $P464 = self."!PREFIX__!subrule"("assertion", "!")
    new $P465, "ResizablePMCArray"
    push $P465, $P464
    push $P465, "!"
    .return ($P465)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block468"  :anon :subid("136_1283368197.39621") :method :outer("134_1283368197.39621")
.annotate 'line', 150
    .local string rx470_tgt
    .local int rx470_pos
    .local int rx470_off
    .local int rx470_eos
    .local int rx470_rep
    .local pmc rx470_cur
    .local pmc rx470_debug
    (rx470_cur, rx470_pos, rx470_tgt, $I10) = self."!cursor_start"()
    getattribute rx470_debug, rx470_cur, "$!debug"
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
    if_null rx470_debug, debug_403
    rx470_cur."!cursor_debug"("START", "")
  debug_403:
    $I10 = self.'from'()
    ne $I10, -1, rxscan471_done
    goto rxscan471_scan
  rxscan471_loop:
    ($P10) = rx470_cur."from"()
    inc $P10
    set rx470_pos, $P10
    ge rx470_pos, rx470_eos, rxscan471_done
  rxscan471_scan:
    set_addr $I10, rxscan471_loop
    rx470_cur."!mark_push"(0, rx470_pos, $I10)
  rxscan471_done:
  # rx literal  ">"
    add $I11, rx470_pos, 1
    gt $I11, rx470_eos, rx470_fail
    sub $I11, rx470_pos, rx470_off
    ord $I11, rx470_tgt, $I11
    ne $I11, 62, rx470_fail
    add rx470_pos, 1
  # rx pass
    rx470_cur."!cursor_pass"(rx470_pos, "")
    if_null rx470_debug, debug_404
    rx470_cur."!cursor_debug"("PASS", "", " at pos=", rx470_pos)
  debug_404:
    .return (rx470_cur)
  rx470_restart:
    if_null rx470_debug, debug_405
    rx470_cur."!cursor_debug"("NEXT", "")
  debug_405:
  rx470_fail:
    (rx470_rep, rx470_pos, $I10, $P10) = rx470_cur."!mark_fail"(0)
    lt rx470_pos, -1, rx470_done
    eq rx470_pos, -1, rx470_fail
    jump $I10
  rx470_done:
    rx470_cur."!cursor_fail"()
    if_null rx470_debug, debug_406
    rx470_cur."!cursor_debug"("FAIL", "")
  debug_406:
    .return (rx470_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<method>"  :subid("137_1283368197.39621") :method :outer("11_1283368197.39621")
.annotate 'line', 3
    .local string rx473_tgt
    .local int rx473_pos
    .local int rx473_off
    .local int rx473_eos
    .local int rx473_rep
    .local pmc rx473_cur
    .local pmc rx473_debug
    (rx473_cur, rx473_pos, rx473_tgt, $I10) = self."!cursor_start"()
    getattribute rx473_debug, rx473_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx473_cur
    .local pmc match
    .lex "$/", match
    length rx473_eos, rx473_tgt
    gt rx473_pos, rx473_eos, rx473_done
    set rx473_off, 0
    lt rx473_pos, 2, rx473_start
    sub rx473_off, rx473_pos, 1
    substr rx473_tgt, rx473_tgt, rx473_off
  rx473_start:
    eq $I10, 1, rx473_restart
    if_null rx473_debug, debug_410
    rx473_cur."!cursor_debug"("START", "assertion:sym<method>")
  debug_410:
    $I10 = self.'from'()
    ne $I10, -1, rxscan477_done
    goto rxscan477_scan
  rxscan477_loop:
    ($P10) = rx473_cur."from"()
    inc $P10
    set rx473_pos, $P10
    ge rx473_pos, rx473_eos, rxscan477_done
  rxscan477_scan:
    set_addr $I10, rxscan477_loop
    rx473_cur."!mark_push"(0, rx473_pos, $I10)
  rxscan477_done:
.annotate 'line', 153
  # rx literal  "."
    add $I11, rx473_pos, 1
    gt $I11, rx473_eos, rx473_fail
    sub $I11, rx473_pos, rx473_off
    ord $I11, rx473_tgt, $I11
    ne $I11, 46, rx473_fail
    add rx473_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx473_cur."!cursor_pos"(rx473_pos)
    $P10 = rx473_cur."assertion"()
    unless $P10, rx473_fail
    rx473_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx473_pos = $P10."pos"()
.annotate 'line', 152
  # rx pass
    rx473_cur."!cursor_pass"(rx473_pos, "assertion:sym<method>")
    if_null rx473_debug, debug_411
    rx473_cur."!cursor_debug"("PASS", "assertion:sym<method>", " at pos=", rx473_pos)
  debug_411:
    .return (rx473_cur)
  rx473_restart:
.annotate 'line', 3
    if_null rx473_debug, debug_412
    rx473_cur."!cursor_debug"("NEXT", "assertion:sym<method>")
  debug_412:
  rx473_fail:
    (rx473_rep, rx473_pos, $I10, $P10) = rx473_cur."!mark_fail"(0)
    lt rx473_pos, -1, rx473_done
    eq rx473_pos, -1, rx473_fail
    jump $I10
  rx473_done:
    rx473_cur."!cursor_fail"()
    if_null rx473_debug, debug_413
    rx473_cur."!cursor_debug"("FAIL", "assertion:sym<method>")
  debug_413:
    .return (rx473_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<method>"  :subid("138_1283368197.39621") :method
.annotate 'line', 3
    $P475 = self."!PREFIX__!subrule"("assertion", ".")
    new $P476, "ResizablePMCArray"
    push $P476, $P475
    .return ($P476)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<name>"  :subid("139_1283368197.39621") :method :outer("11_1283368197.39621")
.annotate 'line', 3
    .const 'Sub' $P487 = "141_1283368197.39621" 
    capture_lex $P487
    .local string rx479_tgt
    .local int rx479_pos
    .local int rx479_off
    .local int rx479_eos
    .local int rx479_rep
    .local pmc rx479_cur
    .local pmc rx479_debug
    (rx479_cur, rx479_pos, rx479_tgt, $I10) = self."!cursor_start"()
    rx479_cur."!cursor_caparray"("nibbler", "arglist", "assertion")
    getattribute rx479_debug, rx479_cur, "$!debug"
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
    if_null rx479_debug, debug_414
    rx479_cur."!cursor_debug"("START", "assertion:sym<name>")
  debug_414:
    $I10 = self.'from'()
    ne $I10, -1, rxscan483_done
    goto rxscan483_scan
  rxscan483_loop:
    ($P10) = rx479_cur."from"()
    inc $P10
    set rx479_pos, $P10
    ge rx479_pos, rx479_eos, rxscan483_done
  rxscan483_scan:
    set_addr $I10, rxscan483_loop
    rx479_cur."!mark_push"(0, rx479_pos, $I10)
  rxscan483_done:
.annotate 'line', 157
  # rx subrule "identifier" subtype=capture negate=
    rx479_cur."!cursor_pos"(rx479_pos)
    $P10 = rx479_cur."identifier"()
    unless $P10, rx479_fail
    rx479_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    rx479_pos = $P10."pos"()
.annotate 'line', 164
  # rx rxquantr484 ** 0..1
    set_addr $I10, rxquantr484_done
    rx479_cur."!mark_push"(0, rx479_pos, $I10)
  rxquantr484_loop:
  alt485_0:
.annotate 'line', 158
    set_addr $I10, alt485_1
    rx479_cur."!mark_push"(0, rx479_pos, $I10)
.annotate 'line', 159
  # rx subrule "before" subtype=zerowidth negate=
    rx479_cur."!cursor_pos"(rx479_pos)
    .const 'Sub' $P487 = "141_1283368197.39621" 
    capture_lex $P487
    $P10 = rx479_cur."before"($P487)
    unless $P10, rx479_fail
    goto alt485_end
  alt485_1:
    set_addr $I10, alt485_2
    rx479_cur."!mark_push"(0, rx479_pos, $I10)
.annotate 'line', 160
  # rx literal  "="
    add $I11, rx479_pos, 1
    gt $I11, rx479_eos, rx479_fail
    sub $I11, rx479_pos, rx479_off
    ord $I11, rx479_tgt, $I11
    ne $I11, 61, rx479_fail
    add rx479_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx479_cur."!cursor_pos"(rx479_pos)
    $P10 = rx479_cur."assertion"()
    unless $P10, rx479_fail
    rx479_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx479_pos = $P10."pos"()
    goto alt485_end
  alt485_2:
    set_addr $I10, alt485_3
    rx479_cur."!mark_push"(0, rx479_pos, $I10)
.annotate 'line', 161
  # rx literal  ":"
    add $I11, rx479_pos, 1
    gt $I11, rx479_eos, rx479_fail
    sub $I11, rx479_pos, rx479_off
    ord $I11, rx479_tgt, $I11
    ne $I11, 58, rx479_fail
    add rx479_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx479_cur."!cursor_pos"(rx479_pos)
    $P10 = rx479_cur."arglist"()
    unless $P10, rx479_fail
    rx479_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx479_pos = $P10."pos"()
    goto alt485_end
  alt485_3:
    set_addr $I10, alt485_4
    rx479_cur."!mark_push"(0, rx479_pos, $I10)
.annotate 'line', 162
  # rx literal  "("
    add $I11, rx479_pos, 1
    gt $I11, rx479_eos, rx479_fail
    sub $I11, rx479_pos, rx479_off
    ord $I11, rx479_tgt, $I11
    ne $I11, 40, rx479_fail
    add rx479_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx479_cur."!cursor_pos"(rx479_pos)
    $P10 = rx479_cur."arglist"()
    unless $P10, rx479_fail
    rx479_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx479_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx479_pos, 1
    gt $I11, rx479_eos, rx479_fail
    sub $I11, rx479_pos, rx479_off
    ord $I11, rx479_tgt, $I11
    ne $I11, 41, rx479_fail
    add rx479_pos, 1
    goto alt485_end
  alt485_4:
.annotate 'line', 163
  # rx subrule "normspace" subtype=method negate=
    rx479_cur."!cursor_pos"(rx479_pos)
    $P10 = rx479_cur."normspace"()
    unless $P10, rx479_fail
    rx479_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx479_cur."!cursor_pos"(rx479_pos)
    $P10 = rx479_cur."nibbler"()
    unless $P10, rx479_fail
    rx479_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx479_pos = $P10."pos"()
  alt485_end:
.annotate 'line', 164
    set_addr $I10, rxquantr484_done
    (rx479_rep) = rx479_cur."!mark_commit"($I10)
  rxquantr484_done:
.annotate 'line', 156
  # rx pass
    rx479_cur."!cursor_pass"(rx479_pos, "assertion:sym<name>")
    if_null rx479_debug, debug_419
    rx479_cur."!cursor_debug"("PASS", "assertion:sym<name>", " at pos=", rx479_pos)
  debug_419:
    .return (rx479_cur)
  rx479_restart:
.annotate 'line', 3
    if_null rx479_debug, debug_420
    rx479_cur."!cursor_debug"("NEXT", "assertion:sym<name>")
  debug_420:
  rx479_fail:
    (rx479_rep, rx479_pos, $I10, $P10) = rx479_cur."!mark_fail"(0)
    lt rx479_pos, -1, rx479_done
    eq rx479_pos, -1, rx479_fail
    jump $I10
  rx479_done:
    rx479_cur."!cursor_fail"()
    if_null rx479_debug, debug_421
    rx479_cur."!cursor_debug"("FAIL", "assertion:sym<name>")
  debug_421:
    .return (rx479_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<name>"  :subid("140_1283368197.39621") :method
.annotate 'line', 3
    $P481 = self."!PREFIX__!subrule"("identifier", "")
    new $P482, "ResizablePMCArray"
    push $P482, $P481
    .return ($P482)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block486"  :anon :subid("141_1283368197.39621") :method :outer("139_1283368197.39621")
.annotate 'line', 159
    .local string rx488_tgt
    .local int rx488_pos
    .local int rx488_off
    .local int rx488_eos
    .local int rx488_rep
    .local pmc rx488_cur
    .local pmc rx488_debug
    (rx488_cur, rx488_pos, rx488_tgt, $I10) = self."!cursor_start"()
    getattribute rx488_debug, rx488_cur, "$!debug"
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
    if_null rx488_debug, debug_415
    rx488_cur."!cursor_debug"("START", "")
  debug_415:
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
  # rx literal  ">"
    add $I11, rx488_pos, 1
    gt $I11, rx488_eos, rx488_fail
    sub $I11, rx488_pos, rx488_off
    ord $I11, rx488_tgt, $I11
    ne $I11, 62, rx488_fail
    add rx488_pos, 1
  # rx pass
    rx488_cur."!cursor_pass"(rx488_pos, "")
    if_null rx488_debug, debug_416
    rx488_cur."!cursor_debug"("PASS", "", " at pos=", rx488_pos)
  debug_416:
    .return (rx488_cur)
  rx488_restart:
    if_null rx488_debug, debug_417
    rx488_cur."!cursor_debug"("NEXT", "")
  debug_417:
  rx488_fail:
    (rx488_rep, rx488_pos, $I10, $P10) = rx488_cur."!mark_fail"(0)
    lt rx488_pos, -1, rx488_done
    eq rx488_pos, -1, rx488_fail
    jump $I10
  rx488_done:
    rx488_cur."!cursor_fail"()
    if_null rx488_debug, debug_418
    rx488_cur."!cursor_debug"("FAIL", "")
  debug_418:
    .return (rx488_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<[>"  :subid("142_1283368197.39621") :method :outer("11_1283368197.39621")
.annotate 'line', 3
    .const 'Sub' $P496 = "144_1283368197.39621" 
    capture_lex $P496
    .local string rx491_tgt
    .local int rx491_pos
    .local int rx491_off
    .local int rx491_eos
    .local int rx491_rep
    .local pmc rx491_cur
    .local pmc rx491_debug
    (rx491_cur, rx491_pos, rx491_tgt, $I10) = self."!cursor_start"()
    rx491_cur."!cursor_caparray"("cclass_elem")
    getattribute rx491_debug, rx491_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx491_cur
    .local pmc match
    .lex "$/", match
    length rx491_eos, rx491_tgt
    gt rx491_pos, rx491_eos, rx491_done
    set rx491_off, 0
    lt rx491_pos, 2, rx491_start
    sub rx491_off, rx491_pos, 1
    substr rx491_tgt, rx491_tgt, rx491_off
  rx491_start:
    eq $I10, 1, rx491_restart
    if_null rx491_debug, debug_422
    rx491_cur."!cursor_debug"("START", "assertion:sym<[>")
  debug_422:
    $I10 = self.'from'()
    ne $I10, -1, rxscan494_done
    goto rxscan494_scan
  rxscan494_loop:
    ($P10) = rx491_cur."from"()
    inc $P10
    set rx491_pos, $P10
    ge rx491_pos, rx491_eos, rxscan494_done
  rxscan494_scan:
    set_addr $I10, rxscan494_loop
    rx491_cur."!mark_push"(0, rx491_pos, $I10)
  rxscan494_done:
.annotate 'line', 167
  # rx subrule "before" subtype=zerowidth negate=
    rx491_cur."!cursor_pos"(rx491_pos)
    .const 'Sub' $P496 = "144_1283368197.39621" 
    capture_lex $P496
    $P10 = rx491_cur."before"($P496)
    unless $P10, rx491_fail
  # rx rxquantr500 ** 1..*
    set_addr $I10, rxquantr500_done
    rx491_cur."!mark_push"(0, -1, $I10)
  rxquantr500_loop:
  # rx subrule "cclass_elem" subtype=capture negate=
    rx491_cur."!cursor_pos"(rx491_pos)
    $P10 = rx491_cur."cclass_elem"()
    unless $P10, rx491_fail
    goto rxsubrule501_pass
  rxsubrule501_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx491_fail
  rxsubrule501_pass:
    set_addr $I10, rxsubrule501_back
    rx491_cur."!mark_push"(0, rx491_pos, $I10, $P10)
    $P10."!cursor_names"("cclass_elem")
    rx491_pos = $P10."pos"()
    set_addr $I10, rxquantr500_done
    (rx491_rep) = rx491_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr500_done
    rx491_cur."!mark_push"(rx491_rep, rx491_pos, $I10)
    goto rxquantr500_loop
  rxquantr500_done:
  # rx pass
    rx491_cur."!cursor_pass"(rx491_pos, "assertion:sym<[>")
    if_null rx491_debug, debug_427
    rx491_cur."!cursor_debug"("PASS", "assertion:sym<[>", " at pos=", rx491_pos)
  debug_427:
    .return (rx491_cur)
  rx491_restart:
.annotate 'line', 3
    if_null rx491_debug, debug_428
    rx491_cur."!cursor_debug"("NEXT", "assertion:sym<[>")
  debug_428:
  rx491_fail:
    (rx491_rep, rx491_pos, $I10, $P10) = rx491_cur."!mark_fail"(0)
    lt rx491_pos, -1, rx491_done
    eq rx491_pos, -1, rx491_fail
    jump $I10
  rx491_done:
    rx491_cur."!cursor_fail"()
    if_null rx491_debug, debug_429
    rx491_cur."!cursor_debug"("FAIL", "assertion:sym<[>")
  debug_429:
    .return (rx491_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<[>"  :subid("143_1283368197.39621") :method
.annotate 'line', 3
    new $P493, "ResizablePMCArray"
    push $P493, ""
    .return ($P493)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block495"  :anon :subid("144_1283368197.39621") :method :outer("142_1283368197.39621")
.annotate 'line', 167
    .local string rx497_tgt
    .local int rx497_pos
    .local int rx497_off
    .local int rx497_eos
    .local int rx497_rep
    .local pmc rx497_cur
    .local pmc rx497_debug
    (rx497_cur, rx497_pos, rx497_tgt, $I10) = self."!cursor_start"()
    getattribute rx497_debug, rx497_cur, "$!debug"
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
    eq $I10, 1, rx497_restart
    if_null rx497_debug, debug_423
    rx497_cur."!cursor_debug"("START", "")
  debug_423:
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
  alt499_0:
    set_addr $I10, alt499_1
    rx497_cur."!mark_push"(0, rx497_pos, $I10)
  # rx literal  "["
    add $I11, rx497_pos, 1
    gt $I11, rx497_eos, rx497_fail
    sub $I11, rx497_pos, rx497_off
    ord $I11, rx497_tgt, $I11
    ne $I11, 91, rx497_fail
    add rx497_pos, 1
    goto alt499_end
  alt499_1:
    set_addr $I10, alt499_2
    rx497_cur."!mark_push"(0, rx497_pos, $I10)
  # rx literal  "+"
    add $I11, rx497_pos, 1
    gt $I11, rx497_eos, rx497_fail
    sub $I11, rx497_pos, rx497_off
    ord $I11, rx497_tgt, $I11
    ne $I11, 43, rx497_fail
    add rx497_pos, 1
    goto alt499_end
  alt499_2:
  # rx literal  "-"
    add $I11, rx497_pos, 1
    gt $I11, rx497_eos, rx497_fail
    sub $I11, rx497_pos, rx497_off
    ord $I11, rx497_tgt, $I11
    ne $I11, 45, rx497_fail
    add rx497_pos, 1
  alt499_end:
  # rx pass
    rx497_cur."!cursor_pass"(rx497_pos, "")
    if_null rx497_debug, debug_424
    rx497_cur."!cursor_debug"("PASS", "", " at pos=", rx497_pos)
  debug_424:
    .return (rx497_cur)
  rx497_restart:
    if_null rx497_debug, debug_425
    rx497_cur."!cursor_debug"("NEXT", "")
  debug_425:
  rx497_fail:
    (rx497_rep, rx497_pos, $I10, $P10) = rx497_cur."!mark_fail"(0)
    lt rx497_pos, -1, rx497_done
    eq rx497_pos, -1, rx497_fail
    jump $I10
  rx497_done:
    rx497_cur."!cursor_fail"()
    if_null rx497_debug, debug_426
    rx497_cur."!cursor_debug"("FAIL", "")
  debug_426:
    .return (rx497_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "cclass_elem"  :subid("145_1283368197.39621") :method :outer("11_1283368197.39621")
.annotate 'line', 3
    .const 'Sub' $P514 = "147_1283368197.39621" 
    capture_lex $P514
    .local string rx503_tgt
    .local int rx503_pos
    .local int rx503_off
    .local int rx503_eos
    .local int rx503_rep
    .local pmc rx503_cur
    .local pmc rx503_debug
    (rx503_cur, rx503_pos, rx503_tgt, $I10) = self."!cursor_start"()
    rx503_cur."!cursor_caparray"("charspec")
    getattribute rx503_debug, rx503_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx503_cur
    .local pmc match
    .lex "$/", match
    length rx503_eos, rx503_tgt
    gt rx503_pos, rx503_eos, rx503_done
    set rx503_off, 0
    lt rx503_pos, 2, rx503_start
    sub rx503_off, rx503_pos, 1
    substr rx503_tgt, rx503_tgt, rx503_off
  rx503_start:
    eq $I10, 1, rx503_restart
    if_null rx503_debug, debug_430
    rx503_cur."!cursor_debug"("START", "cclass_elem")
  debug_430:
    $I10 = self.'from'()
    ne $I10, -1, rxscan506_done
    goto rxscan506_scan
  rxscan506_loop:
    ($P10) = rx503_cur."from"()
    inc $P10
    set rx503_pos, $P10
    ge rx503_pos, rx503_eos, rxscan506_done
  rxscan506_scan:
    set_addr $I10, rxscan506_loop
    rx503_cur."!mark_push"(0, rx503_pos, $I10)
  rxscan506_done:
.annotate 'line', 170
  # rx subcapture "sign"
    set_addr $I10, rxcap_508_fail
    rx503_cur."!mark_push"(0, rx503_pos, $I10)
  alt507_0:
    set_addr $I10, alt507_1
    rx503_cur."!mark_push"(0, rx503_pos, $I10)
  # rx literal  "+"
    add $I11, rx503_pos, 1
    gt $I11, rx503_eos, rx503_fail
    sub $I11, rx503_pos, rx503_off
    ord $I11, rx503_tgt, $I11
    ne $I11, 43, rx503_fail
    add rx503_pos, 1
    goto alt507_end
  alt507_1:
    set_addr $I10, alt507_2
    rx503_cur."!mark_push"(0, rx503_pos, $I10)
  # rx literal  "-"
    add $I11, rx503_pos, 1
    gt $I11, rx503_eos, rx503_fail
    sub $I11, rx503_pos, rx503_off
    ord $I11, rx503_tgt, $I11
    ne $I11, 45, rx503_fail
    add rx503_pos, 1
    goto alt507_end
  alt507_2:
  alt507_end:
    set_addr $I10, rxcap_508_fail
    ($I12, $I11) = rx503_cur."!mark_peek"($I10)
    rx503_cur."!cursor_pos"($I11)
    ($P10) = rx503_cur."!cursor_start"()
    $P10."!cursor_pass"(rx503_pos, "")
    rx503_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sign")
    goto rxcap_508_done
  rxcap_508_fail:
    goto rx503_fail
  rxcap_508_done:
.annotate 'line', 171
  # rx rxquantr509 ** 0..1
    set_addr $I10, rxquantr509_done
    rx503_cur."!mark_push"(0, rx503_pos, $I10)
  rxquantr509_loop:
  # rx subrule "normspace" subtype=method negate=
    rx503_cur."!cursor_pos"(rx503_pos)
    $P10 = rx503_cur."normspace"()
    unless $P10, rx503_fail
    goto rxsubrule510_pass
  rxsubrule510_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx503_fail
  rxsubrule510_pass:
    set_addr $I10, rxsubrule510_back
    rx503_cur."!mark_push"(0, rx503_pos, $I10, $P10)
    rx503_pos = $P10."pos"()
    set_addr $I10, rxquantr509_done
    (rx503_rep) = rx503_cur."!mark_commit"($I10)
  rxquantr509_done:
  alt511_0:
.annotate 'line', 172
    set_addr $I10, alt511_1
    rx503_cur."!mark_push"(0, rx503_pos, $I10)
.annotate 'line', 173
  # rx literal  "["
    add $I11, rx503_pos, 1
    gt $I11, rx503_eos, rx503_fail
    sub $I11, rx503_pos, rx503_off
    ord $I11, rx503_tgt, $I11
    ne $I11, 91, rx503_fail
    add rx503_pos, 1
.annotate 'line', 176
  # rx rxquantr512 ** 0..*
    set_addr $I10, rxquantr512_done
    rx503_cur."!mark_push"(0, rx503_pos, $I10)
  rxquantr512_loop:
.annotate 'line', 173
  # rx subrule $P514 subtype=capture negate=
    rx503_cur."!cursor_pos"(rx503_pos)
    .const 'Sub' $P514 = "147_1283368197.39621" 
    capture_lex $P514
    $P10 = rx503_cur.$P514()
    unless $P10, rx503_fail
    goto rxsubrule532_pass
  rxsubrule532_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx503_fail
  rxsubrule532_pass:
    set_addr $I10, rxsubrule532_back
    rx503_cur."!mark_push"(0, rx503_pos, $I10, $P10)
    $P10."!cursor_names"("charspec")
    rx503_pos = $P10."pos"()
.annotate 'line', 176
    set_addr $I10, rxquantr512_done
    (rx503_rep) = rx503_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr512_done
    rx503_cur."!mark_push"(rx503_rep, rx503_pos, $I10)
    goto rxquantr512_loop
  rxquantr512_done:
.annotate 'line', 177
  # rx charclass_q s r 0..-1
    sub $I10, rx503_pos, rx503_off
    find_not_cclass $I11, 32, rx503_tgt, $I10, rx503_eos
    add rx503_pos, rx503_off, $I11
  # rx literal  "]"
    add $I11, rx503_pos, 1
    gt $I11, rx503_eos, rx503_fail
    sub $I11, rx503_pos, rx503_off
    ord $I11, rx503_tgt, $I11
    ne $I11, 93, rx503_fail
    add rx503_pos, 1
.annotate 'line', 173
    goto alt511_end
  alt511_1:
.annotate 'line', 178
  # rx subcapture "name"
    set_addr $I10, rxcap_533_fail
    rx503_cur."!mark_push"(0, rx503_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx503_pos, rx503_off
    find_not_cclass $I11, 8192, rx503_tgt, $I10, rx503_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx503_fail
    add rx503_pos, rx503_off, $I11
    set_addr $I10, rxcap_533_fail
    ($I12, $I11) = rx503_cur."!mark_peek"($I10)
    rx503_cur."!cursor_pos"($I11)
    ($P10) = rx503_cur."!cursor_start"()
    $P10."!cursor_pass"(rx503_pos, "")
    rx503_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_533_done
  rxcap_533_fail:
    goto rx503_fail
  rxcap_533_done:
  alt511_end:
.annotate 'line', 180
  # rx rxquantr534 ** 0..1
    set_addr $I10, rxquantr534_done
    rx503_cur."!mark_push"(0, rx503_pos, $I10)
  rxquantr534_loop:
  # rx subrule "normspace" subtype=method negate=
    rx503_cur."!cursor_pos"(rx503_pos)
    $P10 = rx503_cur."normspace"()
    unless $P10, rx503_fail
    goto rxsubrule535_pass
  rxsubrule535_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx503_fail
  rxsubrule535_pass:
    set_addr $I10, rxsubrule535_back
    rx503_cur."!mark_push"(0, rx503_pos, $I10, $P10)
    rx503_pos = $P10."pos"()
    set_addr $I10, rxquantr534_done
    (rx503_rep) = rx503_cur."!mark_commit"($I10)
  rxquantr534_done:
.annotate 'line', 169
  # rx pass
    rx503_cur."!cursor_pass"(rx503_pos, "cclass_elem")
    if_null rx503_debug, debug_447
    rx503_cur."!cursor_debug"("PASS", "cclass_elem", " at pos=", rx503_pos)
  debug_447:
    .return (rx503_cur)
  rx503_restart:
.annotate 'line', 3
    if_null rx503_debug, debug_448
    rx503_cur."!cursor_debug"("NEXT", "cclass_elem")
  debug_448:
  rx503_fail:
    (rx503_rep, rx503_pos, $I10, $P10) = rx503_cur."!mark_fail"(0)
    lt rx503_pos, -1, rx503_done
    eq rx503_pos, -1, rx503_fail
    jump $I10
  rx503_done:
    rx503_cur."!cursor_fail"()
    if_null rx503_debug, debug_449
    rx503_cur."!cursor_debug"("FAIL", "cclass_elem")
  debug_449:
    .return (rx503_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__cclass_elem"  :subid("146_1283368197.39621") :method
.annotate 'line', 3
    new $P505, "ResizablePMCArray"
    push $P505, ""
    push $P505, "-"
    push $P505, "+"
    .return ($P505)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block513"  :anon :subid("147_1283368197.39621") :method :outer("145_1283368197.39621")
.annotate 'line', 173
    .const 'Sub' $P529 = "150_1283368197.39621" 
    capture_lex $P529
    .const 'Sub' $P524 = "149_1283368197.39621" 
    capture_lex $P524
    .const 'Sub' $P520 = "148_1283368197.39621" 
    capture_lex $P520
    .local string rx515_tgt
    .local int rx515_pos
    .local int rx515_off
    .local int rx515_eos
    .local int rx515_rep
    .local pmc rx515_cur
    .local pmc rx515_debug
    (rx515_cur, rx515_pos, rx515_tgt, $I10) = self."!cursor_start"()
    rx515_cur."!cursor_caparray"("1")
    getattribute rx515_debug, rx515_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx515_cur
    .local pmc match
    .lex "$/", match
    length rx515_eos, rx515_tgt
    gt rx515_pos, rx515_eos, rx515_done
    set rx515_off, 0
    lt rx515_pos, 2, rx515_start
    sub rx515_off, rx515_pos, 1
    substr rx515_tgt, rx515_tgt, rx515_off
  rx515_start:
    eq $I10, 1, rx515_restart
    if_null rx515_debug, debug_431
    rx515_cur."!cursor_debug"("START", "")
  debug_431:
    $I10 = self.'from'()
    ne $I10, -1, rxscan516_done
    goto rxscan516_scan
  rxscan516_loop:
    ($P10) = rx515_cur."from"()
    inc $P10
    set rx515_pos, $P10
    ge rx515_pos, rx515_eos, rxscan516_done
  rxscan516_scan:
    set_addr $I10, rxscan516_loop
    rx515_cur."!mark_push"(0, rx515_pos, $I10)
  rxscan516_done:
  alt517_0:
    set_addr $I10, alt517_1
    rx515_cur."!mark_push"(0, rx515_pos, $I10)
.annotate 'line', 174
  # rx charclass_q s r 0..-1
    sub $I10, rx515_pos, rx515_off
    find_not_cclass $I11, 32, rx515_tgt, $I10, rx515_eos
    add rx515_pos, rx515_off, $I11
  # rx literal  "-"
    add $I11, rx515_pos, 1
    gt $I11, rx515_eos, rx515_fail
    sub $I11, rx515_pos, rx515_off
    ord $I11, rx515_tgt, $I11
    ne $I11, 45, rx515_fail
    add rx515_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."obs"("- as character range", "..")
    unless $P10, rx515_fail
    rx515_pos = $P10."pos"()
    goto alt517_end
  alt517_1:
.annotate 'line', 175
  # rx charclass_q s r 0..-1
    sub $I10, rx515_pos, rx515_off
    find_not_cclass $I11, 32, rx515_tgt, $I10, rx515_eos
    add rx515_pos, rx515_off, $I11
  alt518_0:
    set_addr $I10, alt518_1
    rx515_cur."!mark_push"(0, rx515_pos, $I10)
  # rx literal  "\\"
    add $I11, rx515_pos, 1
    gt $I11, rx515_eos, rx515_fail
    sub $I11, rx515_pos, rx515_off
    ord $I11, rx515_tgt, $I11
    ne $I11, 92, rx515_fail
    add rx515_pos, 1
  # rx subrule $P520 subtype=capture negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    .const 'Sub' $P520 = "148_1283368197.39621" 
    capture_lex $P520
    $P10 = rx515_cur.$P520()
    unless $P10, rx515_fail
    rx515_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"(0)
    rx515_pos = $P10."pos"()
    goto alt518_end
  alt518_1:
  # rx subrule $P524 subtype=capture negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    .const 'Sub' $P524 = "149_1283368197.39621" 
    capture_lex $P524
    $P10 = rx515_cur.$P524()
    unless $P10, rx515_fail
    rx515_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"(0)
    rx515_pos = $P10."pos"()
  alt518_end:
  # rx rxquantr527 ** 0..1
    set_addr $I10, rxquantr527_done
    rx515_cur."!mark_push"(0, rx515_pos, $I10)
  rxquantr527_loop:
  # rx charclass_q s r 0..-1
    sub $I10, rx515_pos, rx515_off
    find_not_cclass $I11, 32, rx515_tgt, $I10, rx515_eos
    add rx515_pos, rx515_off, $I11
  # rx literal  ".."
    add $I11, rx515_pos, 2
    gt $I11, rx515_eos, rx515_fail
    sub $I11, rx515_pos, rx515_off
    substr $S10, rx515_tgt, $I11, 2
    ne $S10, "..", rx515_fail
    add rx515_pos, 2
  # rx charclass_q s r 0..-1
    sub $I10, rx515_pos, rx515_off
    find_not_cclass $I11, 32, rx515_tgt, $I10, rx515_eos
    add rx515_pos, rx515_off, $I11
  # rx subrule $P529 subtype=capture negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    .const 'Sub' $P529 = "150_1283368197.39621" 
    capture_lex $P529
    $P10 = rx515_cur.$P529()
    unless $P10, rx515_fail
    rx515_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("1")
    rx515_pos = $P10."pos"()
    set_addr $I10, rxquantr527_done
    (rx515_rep) = rx515_cur."!mark_commit"($I10)
  rxquantr527_done:
  alt517_end:
.annotate 'line', 173
  # rx pass
    rx515_cur."!cursor_pass"(rx515_pos, "")
    if_null rx515_debug, debug_444
    rx515_cur."!cursor_debug"("PASS", "", " at pos=", rx515_pos)
  debug_444:
    .return (rx515_cur)
  rx515_restart:
    if_null rx515_debug, debug_445
    rx515_cur."!cursor_debug"("NEXT", "")
  debug_445:
  rx515_fail:
    (rx515_rep, rx515_pos, $I10, $P10) = rx515_cur."!mark_fail"(0)
    lt rx515_pos, -1, rx515_done
    eq rx515_pos, -1, rx515_fail
    jump $I10
  rx515_done:
    rx515_cur."!cursor_fail"()
    if_null rx515_debug, debug_446
    rx515_cur."!cursor_debug"("FAIL", "")
  debug_446:
    .return (rx515_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block519"  :anon :subid("148_1283368197.39621") :method :outer("147_1283368197.39621")
.annotate 'line', 175
    .local string rx521_tgt
    .local int rx521_pos
    .local int rx521_off
    .local int rx521_eos
    .local int rx521_rep
    .local pmc rx521_cur
    .local pmc rx521_debug
    (rx521_cur, rx521_pos, rx521_tgt, $I10) = self."!cursor_start"()
    getattribute rx521_debug, rx521_cur, "$!debug"
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
    if_null rx521_debug, debug_432
    rx521_cur."!cursor_debug"("START", "")
  debug_432:
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
    if_null rx521_debug, debug_433
    rx521_cur."!cursor_debug"("PASS", "", " at pos=", rx521_pos)
  debug_433:
    .return (rx521_cur)
  rx521_restart:
    if_null rx521_debug, debug_434
    rx521_cur."!cursor_debug"("NEXT", "")
  debug_434:
  rx521_fail:
    (rx521_rep, rx521_pos, $I10, $P10) = rx521_cur."!mark_fail"(0)
    lt rx521_pos, -1, rx521_done
    eq rx521_pos, -1, rx521_fail
    jump $I10
  rx521_done:
    rx521_cur."!cursor_fail"()
    if_null rx521_debug, debug_435
    rx521_cur."!cursor_debug"("FAIL", "")
  debug_435:
    .return (rx521_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block523"  :anon :subid("149_1283368197.39621") :method :outer("147_1283368197.39621")
.annotate 'line', 175
    .local string rx525_tgt
    .local int rx525_pos
    .local int rx525_off
    .local int rx525_eos
    .local int rx525_rep
    .local pmc rx525_cur
    .local pmc rx525_debug
    (rx525_cur, rx525_pos, rx525_tgt, $I10) = self."!cursor_start"()
    getattribute rx525_debug, rx525_cur, "$!debug"
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
    eq $I10, 1, rx525_restart
    if_null rx525_debug, debug_436
    rx525_cur."!cursor_debug"("START", "")
  debug_436:
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
  # rx enumcharlist negate=1 
    ge rx525_pos, rx525_eos, rx525_fail
    sub $I10, rx525_pos, rx525_off
    substr $S10, rx525_tgt, $I10, 1
    index $I11, "]\\", $S10
    ge $I11, 0, rx525_fail
    inc rx525_pos
  # rx pass
    rx525_cur."!cursor_pass"(rx525_pos, "")
    if_null rx525_debug, debug_437
    rx525_cur."!cursor_debug"("PASS", "", " at pos=", rx525_pos)
  debug_437:
    .return (rx525_cur)
  rx525_restart:
    if_null rx525_debug, debug_438
    rx525_cur."!cursor_debug"("NEXT", "")
  debug_438:
  rx525_fail:
    (rx525_rep, rx525_pos, $I10, $P10) = rx525_cur."!mark_fail"(0)
    lt rx525_pos, -1, rx525_done
    eq rx525_pos, -1, rx525_fail
    jump $I10
  rx525_done:
    rx525_cur."!cursor_fail"()
    if_null rx525_debug, debug_439
    rx525_cur."!cursor_debug"("FAIL", "")
  debug_439:
    .return (rx525_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block528"  :anon :subid("150_1283368197.39621") :method :outer("147_1283368197.39621")
.annotate 'line', 175
    .local string rx530_tgt
    .local int rx530_pos
    .local int rx530_off
    .local int rx530_eos
    .local int rx530_rep
    .local pmc rx530_cur
    .local pmc rx530_debug
    (rx530_cur, rx530_pos, rx530_tgt, $I10) = self."!cursor_start"()
    getattribute rx530_debug, rx530_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx530_cur
    .local pmc match
    .lex "$/", match
    length rx530_eos, rx530_tgt
    gt rx530_pos, rx530_eos, rx530_done
    set rx530_off, 0
    lt rx530_pos, 2, rx530_start
    sub rx530_off, rx530_pos, 1
    substr rx530_tgt, rx530_tgt, rx530_off
  rx530_start:
    eq $I10, 1, rx530_restart
    if_null rx530_debug, debug_440
    rx530_cur."!cursor_debug"("START", "")
  debug_440:
    $I10 = self.'from'()
    ne $I10, -1, rxscan531_done
    goto rxscan531_scan
  rxscan531_loop:
    ($P10) = rx530_cur."from"()
    inc $P10
    set rx530_pos, $P10
    ge rx530_pos, rx530_eos, rxscan531_done
  rxscan531_scan:
    set_addr $I10, rxscan531_loop
    rx530_cur."!mark_push"(0, rx530_pos, $I10)
  rxscan531_done:
  # rx charclass .
    ge rx530_pos, rx530_eos, rx530_fail
    inc rx530_pos
  # rx pass
    rx530_cur."!cursor_pass"(rx530_pos, "")
    if_null rx530_debug, debug_441
    rx530_cur."!cursor_debug"("PASS", "", " at pos=", rx530_pos)
  debug_441:
    .return (rx530_cur)
  rx530_restart:
    if_null rx530_debug, debug_442
    rx530_cur."!cursor_debug"("NEXT", "")
  debug_442:
  rx530_fail:
    (rx530_rep, rx530_pos, $I10, $P10) = rx530_cur."!mark_fail"(0)
    lt rx530_pos, -1, rx530_done
    eq rx530_pos, -1, rx530_fail
    jump $I10
  rx530_done:
    rx530_cur."!cursor_fail"()
    if_null rx530_debug, debug_443
    rx530_cur."!cursor_debug"("FAIL", "")
  debug_443:
    .return (rx530_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_internal"  :subid("151_1283368197.39621") :method :outer("11_1283368197.39621")
.annotate 'line', 3
    .const 'Sub' $P545 = "153_1283368197.39621" 
    capture_lex $P545
    .local string rx537_tgt
    .local int rx537_pos
    .local int rx537_off
    .local int rx537_eos
    .local int rx537_rep
    .local pmc rx537_cur
    .local pmc rx537_debug
    (rx537_cur, rx537_pos, rx537_tgt, $I10) = self."!cursor_start"()
    rx537_cur."!cursor_caparray"("n")
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
    if_null rx537_debug, debug_450
    rx537_cur."!cursor_debug"("START", "mod_internal")
  debug_450:
    $I10 = self.'from'()
    ne $I10, -1, rxscan541_done
    goto rxscan541_scan
  rxscan541_loop:
    ($P10) = rx537_cur."from"()
    inc $P10
    set rx537_pos, $P10
    ge rx537_pos, rx537_eos, rxscan541_done
  rxscan541_scan:
    set_addr $I10, rxscan541_loop
    rx537_cur."!mark_push"(0, rx537_pos, $I10)
  rxscan541_done:
  alt542_0:
.annotate 'line', 184
    set_addr $I10, alt542_1
    rx537_cur."!mark_push"(0, rx537_pos, $I10)
.annotate 'line', 185
  # rx literal  ":"
    add $I11, rx537_pos, 1
    gt $I11, rx537_eos, rx537_fail
    sub $I11, rx537_pos, rx537_off
    ord $I11, rx537_tgt, $I11
    ne $I11, 58, rx537_fail
    add rx537_pos, 1
  # rx rxquantr543 ** 1..1
    set_addr $I10, rxquantr543_done
    rx537_cur."!mark_push"(0, -1, $I10)
  rxquantr543_loop:
  # rx subrule $P545 subtype=capture negate=
    rx537_cur."!cursor_pos"(rx537_pos)
    .const 'Sub' $P545 = "153_1283368197.39621" 
    capture_lex $P545
    $P10 = rx537_cur.$P545()
    unless $P10, rx537_fail
    goto rxsubrule549_pass
  rxsubrule549_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx537_fail
  rxsubrule549_pass:
    set_addr $I10, rxsubrule549_back
    rx537_cur."!mark_push"(0, rx537_pos, $I10, $P10)
    $P10."!cursor_names"("n")
    rx537_pos = $P10."pos"()
    set_addr $I10, rxquantr543_done
    (rx537_rep) = rx537_cur."!mark_commit"($I10)
  rxquantr543_done:
  # rx subrule "mod_ident" subtype=capture negate=
    rx537_cur."!cursor_pos"(rx537_pos)
    $P10 = rx537_cur."mod_ident"()
    unless $P10, rx537_fail
    rx537_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_ident")
    rx537_pos = $P10."pos"()
  # rxanchor rwb
    le rx537_pos, 0, rx537_fail
    sub $I10, rx537_pos, rx537_off
    is_cclass $I11, 8192, rx537_tgt, $I10
    if $I11, rx537_fail
    dec $I10
    is_cclass $I11, 8192, rx537_tgt, $I10
    unless $I11, rx537_fail
    goto alt542_end
  alt542_1:
.annotate 'line', 186
  # rx literal  ":"
    add $I11, rx537_pos, 1
    gt $I11, rx537_eos, rx537_fail
    sub $I11, rx537_pos, rx537_off
    ord $I11, rx537_tgt, $I11
    ne $I11, 58, rx537_fail
    add rx537_pos, 1
  # rx subrule "mod_ident" subtype=capture negate=
    rx537_cur."!cursor_pos"(rx537_pos)
    $P10 = rx537_cur."mod_ident"()
    unless $P10, rx537_fail
    rx537_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_ident")
    rx537_pos = $P10."pos"()
  # rx rxquantr550 ** 0..1
    set_addr $I10, rxquantr550_done
    rx537_cur."!mark_push"(0, rx537_pos, $I10)
  rxquantr550_loop:
  # rx literal  "("
    add $I11, rx537_pos, 1
    gt $I11, rx537_eos, rx537_fail
    sub $I11, rx537_pos, rx537_off
    ord $I11, rx537_tgt, $I11
    ne $I11, 40, rx537_fail
    add rx537_pos, 1
  # rx subcapture "n"
    set_addr $I10, rxcap_551_fail
    rx537_cur."!mark_push"(0, rx537_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx537_pos, rx537_off
    find_not_cclass $I11, 8, rx537_tgt, $I10, rx537_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx537_fail
    add rx537_pos, rx537_off, $I11
    set_addr $I10, rxcap_551_fail
    ($I12, $I11) = rx537_cur."!mark_peek"($I10)
    rx537_cur."!cursor_pos"($I11)
    ($P10) = rx537_cur."!cursor_start"()
    $P10."!cursor_pass"(rx537_pos, "")
    rx537_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("n")
    goto rxcap_551_done
  rxcap_551_fail:
    goto rx537_fail
  rxcap_551_done:
  # rx literal  ")"
    add $I11, rx537_pos, 1
    gt $I11, rx537_eos, rx537_fail
    sub $I11, rx537_pos, rx537_off
    ord $I11, rx537_tgt, $I11
    ne $I11, 41, rx537_fail
    add rx537_pos, 1
    set_addr $I10, rxquantr550_done
    (rx537_rep) = rx537_cur."!mark_commit"($I10)
  rxquantr550_done:
  alt542_end:
.annotate 'line', 183
  # rx pass
    rx537_cur."!cursor_pass"(rx537_pos, "mod_internal")
    if_null rx537_debug, debug_455
    rx537_cur."!cursor_debug"("PASS", "mod_internal", " at pos=", rx537_pos)
  debug_455:
    .return (rx537_cur)
  rx537_restart:
.annotate 'line', 3
    if_null rx537_debug, debug_456
    rx537_cur."!cursor_debug"("NEXT", "mod_internal")
  debug_456:
  rx537_fail:
    (rx537_rep, rx537_pos, $I10, $P10) = rx537_cur."!mark_fail"(0)
    lt rx537_pos, -1, rx537_done
    eq rx537_pos, -1, rx537_fail
    jump $I10
  rx537_done:
    rx537_cur."!cursor_fail"()
    if_null rx537_debug, debug_457
    rx537_cur."!cursor_debug"("FAIL", "mod_internal")
  debug_457:
    .return (rx537_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_internal"  :subid("152_1283368197.39621") :method
.annotate 'line', 3
    $P539 = self."!PREFIX__!subrule"("mod_ident", ":")
    new $P540, "ResizablePMCArray"
    push $P540, $P539
    push $P540, ":"
    .return ($P540)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block544"  :anon :subid("153_1283368197.39621") :method :outer("151_1283368197.39621")
.annotate 'line', 185
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
    if_null rx546_debug, debug_451
    rx546_cur."!cursor_debug"("START", "")
  debug_451:
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
  alt548_0:
    set_addr $I10, alt548_1
    rx546_cur."!mark_push"(0, rx546_pos, $I10)
  # rx literal  "!"
    add $I11, rx546_pos, 1
    gt $I11, rx546_eos, rx546_fail
    sub $I11, rx546_pos, rx546_off
    ord $I11, rx546_tgt, $I11
    ne $I11, 33, rx546_fail
    add rx546_pos, 1
    goto alt548_end
  alt548_1:
  # rx charclass_q d r 1..-1
    sub $I10, rx546_pos, rx546_off
    find_not_cclass $I11, 8, rx546_tgt, $I10, rx546_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx546_fail
    add rx546_pos, rx546_off, $I11
  alt548_end:
  # rx pass
    rx546_cur."!cursor_pass"(rx546_pos, "")
    if_null rx546_debug, debug_452
    rx546_cur."!cursor_debug"("PASS", "", " at pos=", rx546_pos)
  debug_452:
    .return (rx546_cur)
  rx546_restart:
    if_null rx546_debug, debug_453
    rx546_cur."!cursor_debug"("NEXT", "")
  debug_453:
  rx546_fail:
    (rx546_rep, rx546_pos, $I10, $P10) = rx546_cur."!mark_fail"(0)
    lt rx546_pos, -1, rx546_done
    eq rx546_pos, -1, rx546_fail
    jump $I10
  rx546_done:
    rx546_cur."!cursor_fail"()
    if_null rx546_debug, debug_454
    rx546_cur."!cursor_debug"("FAIL", "")
  debug_454:
    .return (rx546_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident"  :subid("154_1283368197.39621") :method
.annotate 'line', 190
    $P553 = self."!protoregex"("mod_ident")
    .return ($P553)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident"  :subid("155_1283368197.39621") :method
.annotate 'line', 190
    $P555 = self."!PREFIX__!protoregex"("mod_ident")
    .return ($P555)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ignorecase>"  :subid("156_1283368197.39621") :method :outer("11_1283368197.39621")
.annotate 'line', 3
    .local string rx557_tgt
    .local int rx557_pos
    .local int rx557_off
    .local int rx557_eos
    .local int rx557_rep
    .local pmc rx557_cur
    .local pmc rx557_debug
    (rx557_cur, rx557_pos, rx557_tgt, $I10) = self."!cursor_start"()
    getattribute rx557_debug, rx557_cur, "$!debug"
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
    eq $I10, 1, rx557_restart
    if_null rx557_debug, debug_458
    rx557_cur."!cursor_debug"("START", "mod_ident:sym<ignorecase>")
  debug_458:
    $I10 = self.'from'()
    ne $I10, -1, rxscan560_done
    goto rxscan560_scan
  rxscan560_loop:
    ($P10) = rx557_cur."from"()
    inc $P10
    set rx557_pos, $P10
    ge rx557_pos, rx557_eos, rxscan560_done
  rxscan560_scan:
    set_addr $I10, rxscan560_loop
    rx557_cur."!mark_push"(0, rx557_pos, $I10)
  rxscan560_done:
.annotate 'line', 191
  # rx subcapture "sym"
    set_addr $I10, rxcap_561_fail
    rx557_cur."!mark_push"(0, rx557_pos, $I10)
  # rx literal  "i"
    add $I11, rx557_pos, 1
    gt $I11, rx557_eos, rx557_fail
    sub $I11, rx557_pos, rx557_off
    ord $I11, rx557_tgt, $I11
    ne $I11, 105, rx557_fail
    add rx557_pos, 1
    set_addr $I10, rxcap_561_fail
    ($I12, $I11) = rx557_cur."!mark_peek"($I10)
    rx557_cur."!cursor_pos"($I11)
    ($P10) = rx557_cur."!cursor_start"()
    $P10."!cursor_pass"(rx557_pos, "")
    rx557_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_561_done
  rxcap_561_fail:
    goto rx557_fail
  rxcap_561_done:
  # rx rxquantr562 ** 0..1
    set_addr $I10, rxquantr562_done
    rx557_cur."!mark_push"(0, rx557_pos, $I10)
  rxquantr562_loop:
  # rx literal  "gnorecase"
    add $I11, rx557_pos, 9
    gt $I11, rx557_eos, rx557_fail
    sub $I11, rx557_pos, rx557_off
    substr $S10, rx557_tgt, $I11, 9
    ne $S10, "gnorecase", rx557_fail
    add rx557_pos, 9
    set_addr $I10, rxquantr562_done
    (rx557_rep) = rx557_cur."!mark_commit"($I10)
  rxquantr562_done:
  # rx pass
    rx557_cur."!cursor_pass"(rx557_pos, "mod_ident:sym<ignorecase>")
    if_null rx557_debug, debug_459
    rx557_cur."!cursor_debug"("PASS", "mod_ident:sym<ignorecase>", " at pos=", rx557_pos)
  debug_459:
    .return (rx557_cur)
  rx557_restart:
.annotate 'line', 3
    if_null rx557_debug, debug_460
    rx557_cur."!cursor_debug"("NEXT", "mod_ident:sym<ignorecase>")
  debug_460:
  rx557_fail:
    (rx557_rep, rx557_pos, $I10, $P10) = rx557_cur."!mark_fail"(0)
    lt rx557_pos, -1, rx557_done
    eq rx557_pos, -1, rx557_fail
    jump $I10
  rx557_done:
    rx557_cur."!cursor_fail"()
    if_null rx557_debug, debug_461
    rx557_cur."!cursor_debug"("FAIL", "mod_ident:sym<ignorecase>")
  debug_461:
    .return (rx557_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident:sym<ignorecase>"  :subid("157_1283368197.39621") :method
.annotate 'line', 3
    new $P559, "ResizablePMCArray"
    push $P559, "i"
    .return ($P559)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ratchet>"  :subid("158_1283368197.39621") :method :outer("11_1283368197.39621")
.annotate 'line', 3
    .local string rx564_tgt
    .local int rx564_pos
    .local int rx564_off
    .local int rx564_eos
    .local int rx564_rep
    .local pmc rx564_cur
    .local pmc rx564_debug
    (rx564_cur, rx564_pos, rx564_tgt, $I10) = self."!cursor_start"()
    getattribute rx564_debug, rx564_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx564_cur
    .local pmc match
    .lex "$/", match
    length rx564_eos, rx564_tgt
    gt rx564_pos, rx564_eos, rx564_done
    set rx564_off, 0
    lt rx564_pos, 2, rx564_start
    sub rx564_off, rx564_pos, 1
    substr rx564_tgt, rx564_tgt, rx564_off
  rx564_start:
    eq $I10, 1, rx564_restart
    if_null rx564_debug, debug_462
    rx564_cur."!cursor_debug"("START", "mod_ident:sym<ratchet>")
  debug_462:
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
.annotate 'line', 192
  # rx subcapture "sym"
    set_addr $I10, rxcap_568_fail
    rx564_cur."!mark_push"(0, rx564_pos, $I10)
  # rx literal  "r"
    add $I11, rx564_pos, 1
    gt $I11, rx564_eos, rx564_fail
    sub $I11, rx564_pos, rx564_off
    ord $I11, rx564_tgt, $I11
    ne $I11, 114, rx564_fail
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
    set_addr $I10, rxquantr569_done
    rx564_cur."!mark_push"(0, rx564_pos, $I10)
  rxquantr569_loop:
  # rx literal  "atchet"
    add $I11, rx564_pos, 6
    gt $I11, rx564_eos, rx564_fail
    sub $I11, rx564_pos, rx564_off
    substr $S10, rx564_tgt, $I11, 6
    ne $S10, "atchet", rx564_fail
    add rx564_pos, 6
    set_addr $I10, rxquantr569_done
    (rx564_rep) = rx564_cur."!mark_commit"($I10)
  rxquantr569_done:
  # rx pass
    rx564_cur."!cursor_pass"(rx564_pos, "mod_ident:sym<ratchet>")
    if_null rx564_debug, debug_463
    rx564_cur."!cursor_debug"("PASS", "mod_ident:sym<ratchet>", " at pos=", rx564_pos)
  debug_463:
    .return (rx564_cur)
  rx564_restart:
.annotate 'line', 3
    if_null rx564_debug, debug_464
    rx564_cur."!cursor_debug"("NEXT", "mod_ident:sym<ratchet>")
  debug_464:
  rx564_fail:
    (rx564_rep, rx564_pos, $I10, $P10) = rx564_cur."!mark_fail"(0)
    lt rx564_pos, -1, rx564_done
    eq rx564_pos, -1, rx564_fail
    jump $I10
  rx564_done:
    rx564_cur."!cursor_fail"()
    if_null rx564_debug, debug_465
    rx564_cur."!cursor_debug"("FAIL", "mod_ident:sym<ratchet>")
  debug_465:
    .return (rx564_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident:sym<ratchet>"  :subid("159_1283368197.39621") :method
.annotate 'line', 3
    new $P566, "ResizablePMCArray"
    push $P566, "r"
    .return ($P566)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<sigspace>"  :subid("160_1283368197.39621") :method :outer("11_1283368197.39621")
.annotate 'line', 3
    .local string rx571_tgt
    .local int rx571_pos
    .local int rx571_off
    .local int rx571_eos
    .local int rx571_rep
    .local pmc rx571_cur
    .local pmc rx571_debug
    (rx571_cur, rx571_pos, rx571_tgt, $I10) = self."!cursor_start"()
    getattribute rx571_debug, rx571_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx571_cur
    .local pmc match
    .lex "$/", match
    length rx571_eos, rx571_tgt
    gt rx571_pos, rx571_eos, rx571_done
    set rx571_off, 0
    lt rx571_pos, 2, rx571_start
    sub rx571_off, rx571_pos, 1
    substr rx571_tgt, rx571_tgt, rx571_off
  rx571_start:
    eq $I10, 1, rx571_restart
    if_null rx571_debug, debug_466
    rx571_cur."!cursor_debug"("START", "mod_ident:sym<sigspace>")
  debug_466:
    $I10 = self.'from'()
    ne $I10, -1, rxscan574_done
    goto rxscan574_scan
  rxscan574_loop:
    ($P10) = rx571_cur."from"()
    inc $P10
    set rx571_pos, $P10
    ge rx571_pos, rx571_eos, rxscan574_done
  rxscan574_scan:
    set_addr $I10, rxscan574_loop
    rx571_cur."!mark_push"(0, rx571_pos, $I10)
  rxscan574_done:
.annotate 'line', 193
  # rx subcapture "sym"
    set_addr $I10, rxcap_575_fail
    rx571_cur."!mark_push"(0, rx571_pos, $I10)
  # rx literal  "s"
    add $I11, rx571_pos, 1
    gt $I11, rx571_eos, rx571_fail
    sub $I11, rx571_pos, rx571_off
    ord $I11, rx571_tgt, $I11
    ne $I11, 115, rx571_fail
    add rx571_pos, 1
    set_addr $I10, rxcap_575_fail
    ($I12, $I11) = rx571_cur."!mark_peek"($I10)
    rx571_cur."!cursor_pos"($I11)
    ($P10) = rx571_cur."!cursor_start"()
    $P10."!cursor_pass"(rx571_pos, "")
    rx571_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_575_done
  rxcap_575_fail:
    goto rx571_fail
  rxcap_575_done:
  # rx rxquantr576 ** 0..1
    set_addr $I10, rxquantr576_done
    rx571_cur."!mark_push"(0, rx571_pos, $I10)
  rxquantr576_loop:
  # rx literal  "igspace"
    add $I11, rx571_pos, 7
    gt $I11, rx571_eos, rx571_fail
    sub $I11, rx571_pos, rx571_off
    substr $S10, rx571_tgt, $I11, 7
    ne $S10, "igspace", rx571_fail
    add rx571_pos, 7
    set_addr $I10, rxquantr576_done
    (rx571_rep) = rx571_cur."!mark_commit"($I10)
  rxquantr576_done:
  # rx pass
    rx571_cur."!cursor_pass"(rx571_pos, "mod_ident:sym<sigspace>")
    if_null rx571_debug, debug_467
    rx571_cur."!cursor_debug"("PASS", "mod_ident:sym<sigspace>", " at pos=", rx571_pos)
  debug_467:
    .return (rx571_cur)
  rx571_restart:
.annotate 'line', 3
    if_null rx571_debug, debug_468
    rx571_cur."!cursor_debug"("NEXT", "mod_ident:sym<sigspace>")
  debug_468:
  rx571_fail:
    (rx571_rep, rx571_pos, $I10, $P10) = rx571_cur."!mark_fail"(0)
    lt rx571_pos, -1, rx571_done
    eq rx571_pos, -1, rx571_fail
    jump $I10
  rx571_done:
    rx571_cur."!cursor_fail"()
    if_null rx571_debug, debug_469
    rx571_cur."!cursor_debug"("FAIL", "mod_ident:sym<sigspace>")
  debug_469:
    .return (rx571_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident:sym<sigspace>"  :subid("161_1283368197.39621") :method
.annotate 'line', 3
    new $P573, "ResizablePMCArray"
    push $P573, "s"
    .return ($P573)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block577" :load :anon :subid("162_1283368197.39621")
.annotate 'line', 3
    .const 'Sub' $P579 = "11_1283368197.39621" 
    $P580 = $P579()
    .return ($P580)
.end


.namespace []
.sub "_block582" :load :anon :subid("163_1283368197.39621")
.annotate 'line', 1
    .const 'Sub' $P584 = "10_1283368197.39621" 
    $P585 = $P584()
    .return ($P585)
.end

### .include 'gen/p6regex-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1283368202.55748")
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
    .const 'Sub' $P1673 = "94_1283368202.55748" 
    .return ($P1673)
.end


.namespace []
.sub "" :load :init :subid("post95") :outer("10_1283368202.55748")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1283368202.55748" 
    .local pmc block
    set block, $P12
    $P1676 = get_root_global ["parrot"], "P6metaclass"
    $P1676."new_class"("Regex::P6Regex::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block13"  :subid("11_1283368202.55748") :outer("10_1283368202.55748")
.annotate 'line', 4
    .const 'Sub' $P1648 = "92_1283368202.55748" 
    capture_lex $P1648
    .const 'Sub' $P1628 = "91_1283368202.55748" 
    capture_lex $P1628
    .const 'Sub' $P1596 = "90_1283368202.55748" 
    capture_lex $P1596
    .const 'Sub' $P1527 = "86_1283368202.55748" 
    capture_lex $P1527
    .const 'Sub' $P1459 = "84_1283368202.55748" 
    capture_lex $P1459
    .const 'Sub' $P1387 = "81_1283368202.55748" 
    capture_lex $P1387
    .const 'Sub' $P1373 = "80_1283368202.55748" 
    capture_lex $P1373
    .const 'Sub' $P1349 = "79_1283368202.55748" 
    capture_lex $P1349
    .const 'Sub' $P1331 = "78_1283368202.55748" 
    capture_lex $P1331
    .const 'Sub' $P1317 = "77_1283368202.55748" 
    capture_lex $P1317
    .const 'Sub' $P1304 = "76_1283368202.55748" 
    capture_lex $P1304
    .const 'Sub' $P1273 = "75_1283368202.55748" 
    capture_lex $P1273
    .const 'Sub' $P1242 = "74_1283368202.55748" 
    capture_lex $P1242
    .const 'Sub' $P1226 = "73_1283368202.55748" 
    capture_lex $P1226
    .const 'Sub' $P1210 = "72_1283368202.55748" 
    capture_lex $P1210
    .const 'Sub' $P1194 = "71_1283368202.55748" 
    capture_lex $P1194
    .const 'Sub' $P1178 = "70_1283368202.55748" 
    capture_lex $P1178
    .const 'Sub' $P1162 = "69_1283368202.55748" 
    capture_lex $P1162
    .const 'Sub' $P1146 = "68_1283368202.55748" 
    capture_lex $P1146
    .const 'Sub' $P1130 = "67_1283368202.55748" 
    capture_lex $P1130
    .const 'Sub' $P1106 = "66_1283368202.55748" 
    capture_lex $P1106
    .const 'Sub' $P1091 = "65_1283368202.55748" 
    capture_lex $P1091
    .const 'Sub' $P1033 = "64_1283368202.55748" 
    capture_lex $P1033
    .const 'Sub' $P1012 = "63_1283368202.55748" 
    capture_lex $P1012
    .const 'Sub' $P990 = "62_1283368202.55748" 
    capture_lex $P990
    .const 'Sub' $P980 = "61_1283368202.55748" 
    capture_lex $P980
    .const 'Sub' $P970 = "60_1283368202.55748" 
    capture_lex $P970
    .const 'Sub' $P960 = "59_1283368202.55748" 
    capture_lex $P960
    .const 'Sub' $P948 = "58_1283368202.55748" 
    capture_lex $P948
    .const 'Sub' $P936 = "57_1283368202.55748" 
    capture_lex $P936
    .const 'Sub' $P924 = "56_1283368202.55748" 
    capture_lex $P924
    .const 'Sub' $P912 = "55_1283368202.55748" 
    capture_lex $P912
    .const 'Sub' $P900 = "54_1283368202.55748" 
    capture_lex $P900
    .const 'Sub' $P888 = "53_1283368202.55748" 
    capture_lex $P888
    .const 'Sub' $P876 = "52_1283368202.55748" 
    capture_lex $P876
    .const 'Sub' $P864 = "51_1283368202.55748" 
    capture_lex $P864
    .const 'Sub' $P836 = "50_1283368202.55748" 
    capture_lex $P836
    .const 'Sub' $P808 = "49_1283368202.55748" 
    capture_lex $P808
    .const 'Sub' $P790 = "48_1283368202.55748" 
    capture_lex $P790
    .const 'Sub' $P780 = "47_1283368202.55748" 
    capture_lex $P780
    .const 'Sub' $P762 = "46_1283368202.55748" 
    capture_lex $P762
    .const 'Sub' $P689 = "44_1283368202.55748" 
    capture_lex $P689
    .const 'Sub' $P672 = "43_1283368202.55748" 
    capture_lex $P672
    .const 'Sub' $P657 = "42_1283368202.55748" 
    capture_lex $P657
    .const 'Sub' $P642 = "41_1283368202.55748" 
    capture_lex $P642
    .const 'Sub' $P616 = "40_1283368202.55748" 
    capture_lex $P616
    .const 'Sub' $P565 = "38_1283368202.55748" 
    capture_lex $P565
    .const 'Sub' $P497 = "36_1283368202.55748" 
    capture_lex $P497
    .const 'Sub' $P460 = "34_1283368202.55748" 
    capture_lex $P460
    .const 'Sub' $P404 = "31_1283368202.55748" 
    capture_lex $P404
    .const 'Sub' $P389 = "30_1283368202.55748" 
    capture_lex $P389
    .const 'Sub' $P363 = "28_1283368202.55748" 
    capture_lex $P363
    .const 'Sub' $P346 = "27_1283368202.55748" 
    capture_lex $P346
    .const 'Sub' $P312 = "26_1283368202.55748" 
    capture_lex $P312
    .const 'Sub' $P57 = "13_1283368202.55748" 
    capture_lex $P57
    .const 'Sub' $P16 = "12_1283368202.55748" 
    capture_lex $P16
    get_global $P15, "@MODIFIERS"
    unless_null $P15, vivify_97
    $P15 = root_new ['parrot';'ResizablePMCArray']
    set_global "@MODIFIERS", $P15
  vivify_97:
.annotate 'line', 506
    .const 'Sub' $P16 = "12_1283368202.55748" 
    newclosure $P56, $P16
    .lex "buildsub", $P56
.annotate 'line', 524
    .const 'Sub' $P57 = "13_1283368202.55748" 
    newclosure $P311, $P57
    .lex "capnames", $P311
.annotate 'line', 590
    .const 'Sub' $P312 = "26_1283368202.55748" 
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
    .const 'Sub' $P1648 = "92_1283368202.55748" 
    newclosure $P1665, $P1648
.annotate 'line', 4
    .return ($P1665)
    .const 'Sub' $P1667 = "93_1283368202.55748" 
    .return ($P1667)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "" :load :init :subid("post96") :outer("11_1283368202.55748")
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
.sub "buildsub"  :subid("12_1283368202.55748") :outer("11_1283368202.55748")
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
.sub "capnames"  :subid("13_1283368202.55748") :outer("11_1283368202.55748")
    .param pmc param_60
    .param pmc param_61
.annotate 'line', 524
    .const 'Sub' $P286 = "24_1283368202.55748" 
    capture_lex $P286
    .const 'Sub' $P223 = "21_1283368202.55748" 
    capture_lex $P223
    .const 'Sub' $P181 = "19_1283368202.55748" 
    capture_lex $P181
    .const 'Sub' $P139 = "17_1283368202.55748" 
    capture_lex $P139
    .const 'Sub' $P72 = "14_1283368202.55748" 
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
    .const 'Sub' $P286 = "24_1283368202.55748" 
    capture_lex $P286
    $P286()
  if_281_end:
    goto if_218_end
  if_218:
.annotate 'line', 562
    .const 'Sub' $P223 = "21_1283368202.55748" 
    capture_lex $P223
    $P223()
  if_218_end:
    goto if_171_end
  if_171:
.annotate 'line', 549
    .const 'Sub' $P181 = "19_1283368202.55748" 
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
    .const 'Sub' $P139 = "17_1283368202.55748" 
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
    .const 'Sub' $P72 = "14_1283368202.55748" 
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
.sub "_block285"  :anon :subid("24_1283368202.55748") :outer("13_1283368202.55748")
.annotate 'line', 579
    .const 'Sub' $P297 = "25_1283368202.55748" 
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
    .const 'Sub' $P297 = "25_1283368202.55748" 
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
.sub "_block296"  :anon :subid("25_1283368202.55748") :outer("24_1283368202.55748")
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
.sub "_block222"  :anon :subid("21_1283368202.55748") :outer("13_1283368202.55748")
.annotate 'line', 562
    .const 'Sub' $P263 = "23_1283368202.55748" 
    capture_lex $P263
    .const 'Sub' $P235 = "22_1283368202.55748" 
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
    .const 'Sub' $P235 = "22_1283368202.55748" 
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
    .const 'Sub' $P263 = "23_1283368202.55748" 
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
.sub "_block234"  :anon :subid("22_1283368202.55748") :outer("21_1283368202.55748")
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
.sub "_block262"  :anon :subid("23_1283368202.55748") :outer("21_1283368202.55748")
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
.sub "_block180"  :anon :subid("19_1283368202.55748") :outer("13_1283368202.55748")
.annotate 'line', 549
    .const 'Sub' $P199 = "20_1283368202.55748" 
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
    .const 'Sub' $P199 = "20_1283368202.55748" 
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
.sub "_block198"  :anon :subid("20_1283368202.55748") :outer("19_1283368202.55748")
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
.sub "_block138"  :anon :subid("17_1283368202.55748") :outer("13_1283368202.55748")
    .param pmc param_141
.annotate 'line', 541
    .const 'Sub' $P150 = "18_1283368202.55748" 
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
    .const 'Sub' $P150 = "18_1283368202.55748" 
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
.sub "_block149"  :anon :subid("18_1283368202.55748") :outer("17_1283368202.55748")
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
.sub "_block71"  :anon :subid("14_1283368202.55748") :outer("13_1283368202.55748")
.annotate 'line', 527
    .const 'Sub' $P81 = "15_1283368202.55748" 
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
    .const 'Sub' $P81 = "15_1283368202.55748" 
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
.sub "_block80"  :anon :subid("15_1283368202.55748") :outer("14_1283368202.55748")
    .param pmc param_83
.annotate 'line', 529
    .const 'Sub' $P92 = "16_1283368202.55748" 
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
    .const 'Sub' $P92 = "16_1283368202.55748" 
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
.sub "_block91"  :anon :subid("16_1283368202.55748") :outer("15_1283368202.55748")
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
.sub "backmod"  :subid("26_1283368202.55748") :outer("11_1283368202.55748")
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
.sub "arg"  :subid("27_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "arglist"  :subid("28_1283368202.55748") :method :outer("11_1283368202.55748")
    .param pmc param_366
.annotate 'line', 18
    .const 'Sub' $P376 = "29_1283368202.55748" 
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
    .const 'Sub' $P376 = "29_1283368202.55748" 
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
.sub "_block375"  :anon :subid("29_1283368202.55748") :outer("28_1283368202.55748")
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
.sub "TOP"  :subid("30_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "nibbler"  :subid("31_1283368202.55748") :method :outer("11_1283368202.55748")
    .param pmc param_407
    .param pmc param_408 :optional
    .param int has_param_408 :opt_flag
.annotate 'line', 30
    .const 'Sub' $P443 = "33_1283368202.55748" 
    capture_lex $P443
    .const 'Sub' $P416 = "32_1283368202.55748" 
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
    .const 'Sub' $P416 = "32_1283368202.55748" 
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
    .const 'Sub' $P443 = "33_1283368202.55748" 
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
.sub "_block415"  :anon :subid("32_1283368202.55748") :outer("31_1283368202.55748")
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
.sub "_block442"  :anon :subid("33_1283368202.55748") :outer("31_1283368202.55748")
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
.sub "termconj"  :subid("34_1283368202.55748") :method :outer("11_1283368202.55748")
    .param pmc param_463
.annotate 'line', 52
    .const 'Sub' $P480 = "35_1283368202.55748" 
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
    .const 'Sub' $P480 = "35_1283368202.55748" 
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
.sub "_block479"  :anon :subid("35_1283368202.55748") :outer("34_1283368202.55748")
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
.sub "termish"  :subid("36_1283368202.55748") :method :outer("11_1283368202.55748")
    .param pmc param_500
.annotate 'line', 66
    .const 'Sub' $P513 = "37_1283368202.55748" 
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
    .const 'Sub' $P513 = "37_1283368202.55748" 
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
.sub "_block512"  :anon :subid("37_1283368202.55748") :outer("36_1283368202.55748")
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
.sub "quantified_atom"  :subid("38_1283368202.55748") :method :outer("11_1283368202.55748")
    .param pmc param_568
.annotate 'line', 87
    .const 'Sub' $P577 = "39_1283368202.55748" 
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
    .const 'Sub' $P577 = "39_1283368202.55748" 
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
.sub "_block576"  :anon :subid("39_1283368202.55748") :outer("38_1283368202.55748")
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
.sub "atom"  :subid("40_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "quantifier:sym<*>"  :subid("41_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "quantifier:sym<+>"  :subid("42_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "quantifier:sym<?>"  :subid("43_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "quantifier:sym<**>"  :subid("44_1283368202.55748") :method :outer("11_1283368202.55748")
    .param pmc param_692
.annotate 'line', 128
    .const 'Sub' $P707 = "45_1283368202.55748" 
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
    .const 'Sub' $P707 = "45_1283368202.55748" 
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
.sub "_block706"  :anon :subid("45_1283368202.55748") :outer("44_1283368202.55748")
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
.sub "metachar:sym<ws>"  :subid("46_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "metachar:sym<[ ]>"  :subid("47_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "metachar:sym<( )>"  :subid("48_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "metachar:sym<'>"  :subid("49_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "metachar:sym<\">"  :subid("50_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "metachar:sym<.>"  :subid("51_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "metachar:sym<^>"  :subid("52_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "metachar:sym<^^>"  :subid("53_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "metachar:sym<$>"  :subid("54_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "metachar:sym<$$>"  :subid("55_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "metachar:sym<:::>"  :subid("56_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "metachar:sym<lwb>"  :subid("57_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "metachar:sym<rwb>"  :subid("58_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "metachar:sym<bs>"  :subid("59_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "metachar:sym<mod>"  :subid("60_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "metachar:sym<assert>"  :subid("61_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "metachar:sym<~>"  :subid("62_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "metachar:sym<{*}>"  :subid("63_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "metachar:sym<var>"  :subid("64_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "metachar:sym<PIR>"  :subid("65_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "backslash:sym<w>"  :subid("66_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "backslash:sym<b>"  :subid("67_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "backslash:sym<e>"  :subid("68_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "backslash:sym<f>"  :subid("69_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "backslash:sym<h>"  :subid("70_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "backslash:sym<r>"  :subid("71_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "backslash:sym<t>"  :subid("72_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "backslash:sym<v>"  :subid("73_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "backslash:sym<o>"  :subid("74_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "backslash:sym<x>"  :subid("75_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "backslash:sym<c>"  :subid("76_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "backslash:sym<misc>"  :subid("77_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "assertion:sym<?>"  :subid("78_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "assertion:sym<!>"  :subid("79_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "assertion:sym<method>"  :subid("80_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "assertion:sym<name>"  :subid("81_1283368202.55748") :method :outer("11_1283368202.55748")
    .param pmc param_1390
.annotate 'line', 400
    .const 'Sub' $P1447 = "83_1283368202.55748" 
    capture_lex $P1447
    .const 'Sub' $P1413 = "82_1283368202.55748" 
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
    .const 'Sub' $P1447 = "83_1283368202.55748" 
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
    .const 'Sub' $P1413 = "82_1283368202.55748" 
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
.sub "_block1446"  :anon :subid("83_1283368202.55748") :outer("81_1283368202.55748")
    .param pmc param_1448
.annotate 'line', 428
    .lex "$_", param_1448
    find_lex $P1449, "$past"
    find_lex $P1450, "$_"
    $P1451 = $P1449."push"($P1450)
    .return ($P1451)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1412"  :anon :subid("82_1283368202.55748") :outer("81_1283368202.55748")
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
.sub "assertion:sym<[>"  :subid("84_1283368202.55748") :method :outer("11_1283368202.55748")
    .param pmc param_1462
.annotate 'line', 434
    .const 'Sub' $P1497 = "85_1283368202.55748" 
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
    .const 'Sub' $P1497 = "85_1283368202.55748" 
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
.sub "_block1496"  :anon :subid("85_1283368202.55748") :outer("84_1283368202.55748")
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
.sub "cclass_elem"  :subid("86_1283368202.55748") :method :outer("11_1283368202.55748")
    .param pmc param_1530
.annotate 'line', 461
    .const 'Sub' $P1555 = "88_1283368202.55748" 
    capture_lex $P1555
    .const 'Sub' $P1539 = "87_1283368202.55748" 
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
    .const 'Sub' $P1555 = "88_1283368202.55748" 
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
    .const 'Sub' $P1539 = "87_1283368202.55748" 
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
.sub "_block1554"  :anon :subid("88_1283368202.55748") :outer("86_1283368202.55748")
    .param pmc param_1556
.annotate 'line', 468
    .const 'Sub' $P1562 = "89_1283368202.55748" 
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
    .const 'Sub' $P1562 = "89_1283368202.55748" 
    capture_lex $P1562
    $P1575 = $P1562()
    set $P1557, $P1575
  if_1558_end:
.annotate 'line', 468
    .return ($P1557)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1561"  :anon :subid("89_1283368202.55748") :outer("88_1283368202.55748")
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
.sub "_block1538"  :anon :subid("87_1283368202.55748") :outer("86_1283368202.55748")
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
.sub "mod_internal"  :subid("90_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "subrule_alias"  :subid("91_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "named_assertion"  :subid("92_1283368202.55748") :method :outer("11_1283368202.55748")
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
.sub "_block1666" :load :anon :subid("93_1283368202.55748")
.annotate 'line', 4
    .const 'Sub' $P1668 = "11_1283368202.55748" 
    $P1669 = $P1668()
    .return ($P1669)
.end


.namespace []
.sub "_block1672" :load :anon :subid("94_1283368202.55748")
.annotate 'line', 1
    .const 'Sub' $P1674 = "10_1283368202.55748" 
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
