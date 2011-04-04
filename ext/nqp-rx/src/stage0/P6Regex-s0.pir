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
.sub "_block11"  :anon :subid("10_1297880735.27967")
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
    $P620 = $P14()
.annotate 'line', 1
    .return ($P620)
    .const 'Sub' $P622 = "174_1297880735.27967" 
    .return ($P622)
.end


.namespace []
.sub "" :load :init :subid("post175") :outer("10_1297880735.27967")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1297880735.27967" 
    .local pmc block
    set block, $P12
    $P625 = get_root_global ["parrot"], "P6metaclass"
    $P625."new_class"("Regex::P6Regex::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block13"  :subid("11_1297880735.27967") :outer("10_1297880735.27967")
.annotate 'line', 3
    .const 'Sub' $P609 = "171_1297880735.27967" 
    capture_lex $P609
    .const 'Sub' $P602 = "169_1297880735.27967" 
    capture_lex $P602
    .const 'Sub' $P595 = "167_1297880735.27967" 
    capture_lex $P595
    .const 'Sub' $P575 = "162_1297880735.27967" 
    capture_lex $P575
    .const 'Sub' $P541 = "156_1297880735.27967" 
    capture_lex $P541
    .const 'Sub' $P529 = "153_1297880735.27967" 
    capture_lex $P529
    .const 'Sub' $P517 = "150_1297880735.27967" 
    capture_lex $P517
    .const 'Sub' $P511 = "148_1297880735.27967" 
    capture_lex $P511
    .const 'Sub' $P500 = "145_1297880735.27967" 
    capture_lex $P500
    .const 'Sub' $P489 = "142_1297880735.27967" 
    capture_lex $P489
    .const 'Sub' $P480 = "138_1297880735.27967" 
    capture_lex $P480
    .const 'Sub' $P470 = "135_1297880735.27967" 
    capture_lex $P470
    .const 'Sub' $P464 = "133_1297880735.27967" 
    capture_lex $P464
    .const 'Sub' $P458 = "131_1297880735.27967" 
    capture_lex $P458
    .const 'Sub' $P452 = "129_1297880735.27967" 
    capture_lex $P452
    .const 'Sub' $P446 = "127_1297880735.27967" 
    capture_lex $P446
    .const 'Sub' $P438 = "125_1297880735.27967" 
    capture_lex $P438
    .const 'Sub' $P427 = "123_1297880735.27967" 
    capture_lex $P427
    .const 'Sub' $P416 = "121_1297880735.27967" 
    capture_lex $P416
    .const 'Sub' $P410 = "119_1297880735.27967" 
    capture_lex $P410
    .const 'Sub' $P404 = "117_1297880735.27967" 
    capture_lex $P404
    .const 'Sub' $P398 = "115_1297880735.27967" 
    capture_lex $P398
    .const 'Sub' $P392 = "113_1297880735.27967" 
    capture_lex $P392
    .const 'Sub' $P386 = "111_1297880735.27967" 
    capture_lex $P386
    .const 'Sub' $P380 = "109_1297880735.27967" 
    capture_lex $P380
    .const 'Sub' $P374 = "107_1297880735.27967" 
    capture_lex $P374
    .const 'Sub' $P368 = "105_1297880735.27967" 
    capture_lex $P368
    .const 'Sub' $P356 = "101_1297880735.27967" 
    capture_lex $P356
    .const 'Sub' $P346 = "99_1297880735.27967" 
    capture_lex $P346
    .const 'Sub' $P339 = "97_1297880735.27967" 
    capture_lex $P339
    .const 'Sub' $P327 = "95_1297880735.27967" 
    capture_lex $P327
    .const 'Sub' $P320 = "93_1297880735.27967" 
    capture_lex $P320
    .const 'Sub' $P314 = "91_1297880735.27967" 
    capture_lex $P314
    .const 'Sub' $P308 = "89_1297880735.27967" 
    capture_lex $P308
    .const 'Sub' $P302 = "87_1297880735.27967" 
    capture_lex $P302
    .const 'Sub' $P295 = "85_1297880735.27967" 
    capture_lex $P295
    .const 'Sub' $P288 = "83_1297880735.27967" 
    capture_lex $P288
    .const 'Sub' $P281 = "81_1297880735.27967" 
    capture_lex $P281
    .const 'Sub' $P274 = "79_1297880735.27967" 
    capture_lex $P274
    .const 'Sub' $P268 = "77_1297880735.27967" 
    capture_lex $P268
    .const 'Sub' $P262 = "75_1297880735.27967" 
    capture_lex $P262
    .const 'Sub' $P256 = "73_1297880735.27967" 
    capture_lex $P256
    .const 'Sub' $P250 = "71_1297880735.27967" 
    capture_lex $P250
    .const 'Sub' $P244 = "69_1297880735.27967" 
    capture_lex $P244
    .const 'Sub' $P239 = "67_1297880735.27967" 
    capture_lex $P239
    .const 'Sub' $P234 = "65_1297880735.27967" 
    capture_lex $P234
    .const 'Sub' $P228 = "63_1297880735.27967" 
    capture_lex $P228
    .const 'Sub' $P222 = "61_1297880735.27967" 
    capture_lex $P222
    .const 'Sub' $P216 = "59_1297880735.27967" 
    capture_lex $P216
    .const 'Sub' $P201 = "54_1297880735.27967" 
    capture_lex $P201
    .const 'Sub' $P186 = "52_1297880735.27967" 
    capture_lex $P186
    .const 'Sub' $P163 = "46_1297880735.27967" 
    capture_lex $P163
    .const 'Sub' $P156 = "44_1297880735.27967" 
    capture_lex $P156
    .const 'Sub' $P149 = "42_1297880735.27967" 
    capture_lex $P149
    .const 'Sub' $P142 = "40_1297880735.27967" 
    capture_lex $P142
    .const 'Sub' $P125 = "35_1297880735.27967" 
    capture_lex $P125
    .const 'Sub' $P113 = "32_1297880735.27967" 
    capture_lex $P113
    .const 'Sub' $P106 = "30_1297880735.27967" 
    capture_lex $P106
    .const 'Sub' $P97 = "28_1297880735.27967" 
    capture_lex $P97
    .const 'Sub' $P87 = "26_1297880735.27967" 
    capture_lex $P87
    .const 'Sub' $P80 = "24_1297880735.27967" 
    capture_lex $P80
    .const 'Sub' $P68 = "22_1297880735.27967" 
    capture_lex $P68
    .const 'Sub' $P61 = "20_1297880735.27967" 
    capture_lex $P61
    .const 'Sub' $P54 = "18_1297880735.27967" 
    capture_lex $P54
    .const 'Sub' $P44 = "15_1297880735.27967" 
    capture_lex $P44
    .const 'Sub' $P37 = "13_1297880735.27967" 
    capture_lex $P37
    .const 'Sub' $P15 = "12_1297880735.27967" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    .const 'Sub' $P609 = "171_1297880735.27967" 
    capture_lex $P609
    .return ($P609)
    .const 'Sub' $P617 = "173_1297880735.27967" 
    .return ($P617)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.include "except_types.pasm"
.sub "obs"  :subid("12_1297880735.27967") :method :outer("11_1297880735.27967")
    .param pmc param_18
    .param pmc param_19
    .param pmc param_20 :optional
    .param int has_param_20 :opt_flag
.annotate 'line', 3
    new $P17, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P17, control_16
    push_eh $P17
    .lex "self", self
    .lex "$old", param_18
    .lex "$new", param_19
    if has_param_20, optparam_176
    new $P21, "String"
    assign $P21, " in Perl 6"
    set param_20, $P21
  optparam_176:
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
.sub "ws"  :subid("13_1297880735.27967") :method :outer("11_1297880735.27967")
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
    if_null rx38_debug, debug_177
    rx38_cur."!cursor_debug"("START", "ws")
  debug_177:
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
    if_null rx38_debug, debug_178
    rx38_cur."!cursor_debug"("PASS", "ws", " at pos=", rx38_pos)
  debug_178:
    .return (rx38_cur)
  rx38_restart:
.annotate 'line', 3
    if_null rx38_debug, debug_179
    rx38_cur."!cursor_debug"("NEXT", "ws")
  debug_179:
  rx38_fail:
    (rx38_rep, rx38_pos, $I10, $P10) = rx38_cur."!mark_fail"(0)
    lt rx38_pos, -1, rx38_done
    eq rx38_pos, -1, rx38_fail
    jump $I10
  rx38_done:
    rx38_cur."!cursor_fail"()
    if_null rx38_debug, debug_180
    rx38_cur."!cursor_debug"("FAIL", "ws")
  debug_180:
    .return (rx38_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__ws"  :subid("14_1297880735.27967") :method
.annotate 'line', 3
    new $P40, "ResizablePMCArray"
    push $P40, ""
    .return ($P40)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "normspace"  :subid("15_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .const 'Sub' $P50 = "17_1297880735.27967" 
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
    if_null rx45_debug, debug_181
    rx45_cur."!cursor_debug"("START", "normspace")
  debug_181:
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
    .const 'Sub' $P50 = "17_1297880735.27967" 
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
    if_null rx45_debug, debug_186
    rx45_cur."!cursor_debug"("PASS", "normspace", " at pos=", rx45_pos)
  debug_186:
    .return (rx45_cur)
  rx45_restart:
.annotate 'line', 3
    if_null rx45_debug, debug_187
    rx45_cur."!cursor_debug"("NEXT", "normspace")
  debug_187:
  rx45_fail:
    (rx45_rep, rx45_pos, $I10, $P10) = rx45_cur."!mark_fail"(0)
    lt rx45_pos, -1, rx45_done
    eq rx45_pos, -1, rx45_fail
    jump $I10
  rx45_done:
    rx45_cur."!cursor_fail"()
    if_null rx45_debug, debug_188
    rx45_cur."!cursor_debug"("FAIL", "normspace")
  debug_188:
    .return (rx45_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__normspace"  :subid("16_1297880735.27967") :method
.annotate 'line', 3
    new $P47, "ResizablePMCArray"
    push $P47, ""
    .return ($P47)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block49"  :anon :subid("17_1297880735.27967") :method :outer("15_1297880735.27967")
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
    if_null rx51_debug, debug_182
    rx51_cur."!cursor_debug"("START", "")
  debug_182:
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
    if_null rx51_debug, debug_183
    rx51_cur."!cursor_debug"("PASS", "", " at pos=", rx51_pos)
  debug_183:
    .return (rx51_cur)
  rx51_restart:
    if_null rx51_debug, debug_184
    rx51_cur."!cursor_debug"("NEXT", "")
  debug_184:
  rx51_fail:
    (rx51_rep, rx51_pos, $I10, $P10) = rx51_cur."!mark_fail"(0)
    lt rx51_pos, -1, rx51_done
    eq rx51_pos, -1, rx51_fail
    jump $I10
  rx51_done:
    rx51_cur."!cursor_fail"()
    if_null rx51_debug, debug_185
    rx51_cur."!cursor_debug"("FAIL", "")
  debug_185:
    .return (rx51_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "identifier"  :subid("18_1297880735.27967") :method :outer("11_1297880735.27967")
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
    if_null rx55_debug, debug_189
    rx55_cur."!cursor_debug"("START", "identifier")
  debug_189:
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
    if_null rx55_debug, debug_190
    rx55_cur."!cursor_debug"("PASS", "identifier", " at pos=", rx55_pos)
  debug_190:
    .return (rx55_cur)
  rx55_restart:
.annotate 'line', 3
    if_null rx55_debug, debug_191
    rx55_cur."!cursor_debug"("NEXT", "identifier")
  debug_191:
  rx55_fail:
    (rx55_rep, rx55_pos, $I10, $P10) = rx55_cur."!mark_fail"(0)
    lt rx55_pos, -1, rx55_done
    eq rx55_pos, -1, rx55_fail
    jump $I10
  rx55_done:
    rx55_cur."!cursor_fail"()
    if_null rx55_debug, debug_192
    rx55_cur."!cursor_debug"("FAIL", "identifier")
  debug_192:
    .return (rx55_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__identifier"  :subid("19_1297880735.27967") :method
.annotate 'line', 3
    $P57 = self."!PREFIX__!subrule"("ident", "")
    new $P58, "ResizablePMCArray"
    push $P58, $P57
    .return ($P58)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "arg"  :subid("20_1297880735.27967") :method :outer("11_1297880735.27967")
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
    if_null rx62_debug, debug_193
    rx62_cur."!cursor_debug"("START", "arg")
  debug_193:
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
    if_null rx62_debug, debug_194
    rx62_cur."!cursor_debug"("PASS", "arg", " at pos=", rx62_pos)
  debug_194:
    .return (rx62_cur)
  rx62_restart:
.annotate 'line', 3
    if_null rx62_debug, debug_195
    rx62_cur."!cursor_debug"("NEXT", "arg")
  debug_195:
  rx62_fail:
    (rx62_rep, rx62_pos, $I10, $P10) = rx62_cur."!mark_fail"(0)
    lt rx62_pos, -1, rx62_done
    eq rx62_pos, -1, rx62_fail
    jump $I10
  rx62_done:
    rx62_cur."!cursor_fail"()
    if_null rx62_debug, debug_196
    rx62_cur."!cursor_debug"("FAIL", "arg")
  debug_196:
    .return (rx62_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__arg"  :subid("21_1297880735.27967") :method
.annotate 'line', 3
    new $P64, "ResizablePMCArray"
    push $P64, ""
    push $P64, "\""
    push $P64, "'"
    .return ($P64)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "arglist"  :subid("22_1297880735.27967") :method :outer("11_1297880735.27967")
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
    if_null rx69_debug, debug_197
    rx69_cur."!cursor_debug"("START", "arglist")
  debug_197:
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
    if_null rx69_debug, debug_198
    rx69_cur."!cursor_debug"("PASS", "arglist", " at pos=", rx69_pos)
  debug_198:
    .return (rx69_cur)
  rx69_restart:
.annotate 'line', 3
    if_null rx69_debug, debug_199
    rx69_cur."!cursor_debug"("NEXT", "arglist")
  debug_199:
  rx69_fail:
    (rx69_rep, rx69_pos, $I10, $P10) = rx69_cur."!mark_fail"(0)
    lt rx69_pos, -1, rx69_done
    eq rx69_pos, -1, rx69_fail
    jump $I10
  rx69_done:
    rx69_cur."!cursor_fail"()
    if_null rx69_debug, debug_200
    rx69_cur."!cursor_debug"("FAIL", "arglist")
  debug_200:
    .return (rx69_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__arglist"  :subid("23_1297880735.27967") :method
.annotate 'line', 3
    $P71 = self."!PREFIX__!subrule"("ws", "")
    new $P72, "ResizablePMCArray"
    push $P72, $P71
    .return ($P72)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "TOP"  :subid("24_1297880735.27967") :method :outer("11_1297880735.27967")
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
    if_null rx81_debug, debug_201
    rx81_cur."!cursor_debug"("START", "TOP")
  debug_201:
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
    if_null rx81_debug, debug_202
    rx81_cur."!cursor_debug"("PASS", "TOP", " at pos=", rx81_pos)
  debug_202:
    .return (rx81_cur)
  rx81_restart:
.annotate 'line', 3
    if_null rx81_debug, debug_203
    rx81_cur."!cursor_debug"("NEXT", "TOP")
  debug_203:
  rx81_fail:
    (rx81_rep, rx81_pos, $I10, $P10) = rx81_cur."!mark_fail"(0)
    lt rx81_pos, -1, rx81_done
    eq rx81_pos, -1, rx81_fail
    jump $I10
  rx81_done:
    rx81_cur."!cursor_fail"()
    if_null rx81_debug, debug_204
    rx81_cur."!cursor_debug"("FAIL", "TOP")
  debug_204:
    .return (rx81_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__TOP"  :subid("25_1297880735.27967") :method
.annotate 'line', 3
    $P83 = self."!PREFIX__!subrule"("nibbler", "")
    new $P84, "ResizablePMCArray"
    push $P84, $P83
    .return ($P84)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "nibbler"  :subid("26_1297880735.27967") :method :outer("11_1297880735.27967")
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
    if_null rx88_debug, debug_205
    rx88_cur."!cursor_debug"("START", "nibbler")
  debug_205:
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
    if_null rx88_debug, debug_206
    rx88_cur."!cursor_debug"("PASS", "nibbler", " at pos=", rx88_pos)
  debug_206:
    .return (rx88_cur)
  rx88_restart:
.annotate 'line', 3
    if_null rx88_debug, debug_207
    rx88_cur."!cursor_debug"("NEXT", "nibbler")
  debug_207:
  rx88_fail:
    (rx88_rep, rx88_pos, $I10, $P10) = rx88_cur."!mark_fail"(0)
    lt rx88_pos, -1, rx88_done
    eq rx88_pos, -1, rx88_fail
    jump $I10
  rx88_done:
    rx88_cur."!cursor_fail"()
    if_null rx88_debug, debug_208
    rx88_cur."!cursor_debug"("FAIL", "nibbler")
  debug_208:
    .return (rx88_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__nibbler"  :subid("27_1297880735.27967") :method
.annotate 'line', 3
    new $P90, "ResizablePMCArray"
    push $P90, ""
    .return ($P90)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "termconj"  :subid("28_1297880735.27967") :method :outer("11_1297880735.27967")
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
    if_null rx98_debug, debug_209
    rx98_cur."!cursor_debug"("START", "termconj")
  debug_209:
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
    if_null rx98_debug, debug_210
    rx98_cur."!cursor_debug"("PASS", "termconj", " at pos=", rx98_pos)
  debug_210:
    .return (rx98_cur)
  rx98_restart:
.annotate 'line', 3
    if_null rx98_debug, debug_211
    rx98_cur."!cursor_debug"("NEXT", "termconj")
  debug_211:
  rx98_fail:
    (rx98_rep, rx98_pos, $I10, $P10) = rx98_cur."!mark_fail"(0)
    lt rx98_pos, -1, rx98_done
    eq rx98_pos, -1, rx98_fail
    jump $I10
  rx98_done:
    rx98_cur."!cursor_fail"()
    if_null rx98_debug, debug_212
    rx98_cur."!cursor_debug"("FAIL", "termconj")
  debug_212:
    .return (rx98_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__termconj"  :subid("29_1297880735.27967") :method
.annotate 'line', 3
    $P100 = self."!PREFIX__!subrule"("termish", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "termish"  :subid("30_1297880735.27967") :method :outer("11_1297880735.27967")
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
    if_null rx107_debug, debug_213
    rx107_cur."!cursor_debug"("START", "termish")
  debug_213:
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
    if_null rx107_debug, debug_214
    rx107_cur."!cursor_debug"("PASS", "termish", " at pos=", rx107_pos)
  debug_214:
    .return (rx107_cur)
  rx107_restart:
.annotate 'line', 3
    if_null rx107_debug, debug_215
    rx107_cur."!cursor_debug"("NEXT", "termish")
  debug_215:
  rx107_fail:
    (rx107_rep, rx107_pos, $I10, $P10) = rx107_cur."!mark_fail"(0)
    lt rx107_pos, -1, rx107_done
    eq rx107_pos, -1, rx107_fail
    jump $I10
  rx107_done:
    rx107_cur."!cursor_fail"()
    if_null rx107_debug, debug_216
    rx107_cur."!cursor_debug"("FAIL", "termish")
  debug_216:
    .return (rx107_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__termish"  :subid("31_1297880735.27967") :method
.annotate 'line', 3
    new $P109, "ResizablePMCArray"
    push $P109, ""
    .return ($P109)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantified_atom"  :subid("32_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .const 'Sub' $P122 = "34_1297880735.27967" 
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
    if_null rx114_debug, debug_217
    rx114_cur."!cursor_debug"("START", "quantified_atom")
  debug_217:
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
    .const 'Sub' $P122 = "34_1297880735.27967" 
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
    if_null rx114_debug, debug_222
    rx114_cur."!cursor_debug"("PASS", "quantified_atom", " at pos=", rx114_pos)
  debug_222:
    .return (rx114_cur)
  rx114_restart:
.annotate 'line', 3
    if_null rx114_debug, debug_223
    rx114_cur."!cursor_debug"("NEXT", "quantified_atom")
  debug_223:
  rx114_fail:
    (rx114_rep, rx114_pos, $I10, $P10) = rx114_cur."!mark_fail"(0)
    lt rx114_pos, -1, rx114_done
    eq rx114_pos, -1, rx114_fail
    jump $I10
  rx114_done:
    rx114_cur."!cursor_fail"()
    if_null rx114_debug, debug_224
    rx114_cur."!cursor_debug"("FAIL", "quantified_atom")
  debug_224:
    .return (rx114_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantified_atom"  :subid("33_1297880735.27967") :method
.annotate 'line', 3
    $P116 = self."!PREFIX__!subrule"("atom", "")
    new $P117, "ResizablePMCArray"
    push $P117, $P116
    .return ($P117)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block121"  :anon :subid("34_1297880735.27967") :method :outer("32_1297880735.27967")
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
    if_null rx123_debug, debug_218
    rx123_cur."!cursor_debug"("START", "")
  debug_218:
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
    if_null rx123_debug, debug_219
    rx123_cur."!cursor_debug"("PASS", "", " at pos=", rx123_pos)
  debug_219:
    .return (rx123_cur)
  rx123_restart:
    if_null rx123_debug, debug_220
    rx123_cur."!cursor_debug"("NEXT", "")
  debug_220:
  rx123_fail:
    (rx123_rep, rx123_pos, $I10, $P10) = rx123_cur."!mark_fail"(0)
    lt rx123_pos, -1, rx123_done
    eq rx123_pos, -1, rx123_fail
    jump $I10
  rx123_done:
    rx123_cur."!cursor_fail"()
    if_null rx123_debug, debug_221
    rx123_cur."!cursor_debug"("FAIL", "")
  debug_221:
    .return (rx123_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "atom"  :subid("35_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .const 'Sub' $P135 = "37_1297880735.27967" 
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
    if_null rx126_debug, debug_225
    rx126_cur."!cursor_debug"("START", "atom")
  debug_225:
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
    .const 'Sub' $P135 = "37_1297880735.27967" 
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
    if_null rx126_debug, debug_230
    rx126_cur."!cursor_debug"("PASS", "atom", " at pos=", rx126_pos)
  debug_230:
    .return (rx126_cur)
  rx126_restart:
.annotate 'line', 3
    if_null rx126_debug, debug_231
    rx126_cur."!cursor_debug"("NEXT", "atom")
  debug_231:
  rx126_fail:
    (rx126_rep, rx126_pos, $I10, $P10) = rx126_cur."!mark_fail"(0)
    lt rx126_pos, -1, rx126_done
    eq rx126_pos, -1, rx126_fail
    jump $I10
  rx126_done:
    rx126_cur."!cursor_fail"()
    if_null rx126_debug, debug_232
    rx126_cur."!cursor_debug"("FAIL", "atom")
  debug_232:
    .return (rx126_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__atom"  :subid("36_1297880735.27967") :method
.annotate 'line', 3
    $P128 = self."!PREFIX__!subrule"("metachar", "")
    new $P129, "ResizablePMCArray"
    push $P129, $P128
    push $P129, ""
    .return ($P129)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block134"  :anon :subid("37_1297880735.27967") :method :outer("35_1297880735.27967")
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
    if_null rx136_debug, debug_226
    rx136_cur."!cursor_debug"("START", "")
  debug_226:
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
    if_null rx136_debug, debug_227
    rx136_cur."!cursor_debug"("PASS", "", " at pos=", rx136_pos)
  debug_227:
    .return (rx136_cur)
  rx136_restart:
    if_null rx136_debug, debug_228
    rx136_cur."!cursor_debug"("NEXT", "")
  debug_228:
  rx136_fail:
    (rx136_rep, rx136_pos, $I10, $P10) = rx136_cur."!mark_fail"(0)
    lt rx136_pos, -1, rx136_done
    eq rx136_pos, -1, rx136_fail
    jump $I10
  rx136_done:
    rx136_cur."!cursor_fail"()
    if_null rx136_debug, debug_229
    rx136_cur."!cursor_debug"("FAIL", "")
  debug_229:
    .return (rx136_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier"  :subid("38_1297880735.27967") :method
.annotate 'line', 61
    $P139 = self."!protoregex"("quantifier")
    .return ($P139)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier"  :subid("39_1297880735.27967") :method
.annotate 'line', 61
    $P141 = self."!PREFIX__!protoregex"("quantifier")
    .return ($P141)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<*>"  :subid("40_1297880735.27967") :method :outer("11_1297880735.27967")
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
    if_null rx143_debug, debug_233
    rx143_cur."!cursor_debug"("START", "quantifier:sym<*>")
  debug_233:
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
    if_null rx143_debug, debug_234
    rx143_cur."!cursor_debug"("PASS", "quantifier:sym<*>", " at pos=", rx143_pos)
  debug_234:
    .return (rx143_cur)
  rx143_restart:
.annotate 'line', 3
    if_null rx143_debug, debug_235
    rx143_cur."!cursor_debug"("NEXT", "quantifier:sym<*>")
  debug_235:
  rx143_fail:
    (rx143_rep, rx143_pos, $I10, $P10) = rx143_cur."!mark_fail"(0)
    lt rx143_pos, -1, rx143_done
    eq rx143_pos, -1, rx143_fail
    jump $I10
  rx143_done:
    rx143_cur."!cursor_fail"()
    if_null rx143_debug, debug_236
    rx143_cur."!cursor_debug"("FAIL", "quantifier:sym<*>")
  debug_236:
    .return (rx143_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<*>"  :subid("41_1297880735.27967") :method
.annotate 'line', 3
    $P145 = self."!PREFIX__!subrule"("backmod", "*")
    new $P146, "ResizablePMCArray"
    push $P146, $P145
    .return ($P146)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<+>"  :subid("42_1297880735.27967") :method :outer("11_1297880735.27967")
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
    if_null rx150_debug, debug_237
    rx150_cur."!cursor_debug"("START", "quantifier:sym<+>")
  debug_237:
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
    if_null rx150_debug, debug_238
    rx150_cur."!cursor_debug"("PASS", "quantifier:sym<+>", " at pos=", rx150_pos)
  debug_238:
    .return (rx150_cur)
  rx150_restart:
.annotate 'line', 3
    if_null rx150_debug, debug_239
    rx150_cur."!cursor_debug"("NEXT", "quantifier:sym<+>")
  debug_239:
  rx150_fail:
    (rx150_rep, rx150_pos, $I10, $P10) = rx150_cur."!mark_fail"(0)
    lt rx150_pos, -1, rx150_done
    eq rx150_pos, -1, rx150_fail
    jump $I10
  rx150_done:
    rx150_cur."!cursor_fail"()
    if_null rx150_debug, debug_240
    rx150_cur."!cursor_debug"("FAIL", "quantifier:sym<+>")
  debug_240:
    .return (rx150_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<+>"  :subid("43_1297880735.27967") :method
.annotate 'line', 3
    $P152 = self."!PREFIX__!subrule"("backmod", "+")
    new $P153, "ResizablePMCArray"
    push $P153, $P152
    .return ($P153)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<?>"  :subid("44_1297880735.27967") :method :outer("11_1297880735.27967")
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
    if_null rx157_debug, debug_241
    rx157_cur."!cursor_debug"("START", "quantifier:sym<?>")
  debug_241:
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
    if_null rx157_debug, debug_242
    rx157_cur."!cursor_debug"("PASS", "quantifier:sym<?>", " at pos=", rx157_pos)
  debug_242:
    .return (rx157_cur)
  rx157_restart:
.annotate 'line', 3
    if_null rx157_debug, debug_243
    rx157_cur."!cursor_debug"("NEXT", "quantifier:sym<?>")
  debug_243:
  rx157_fail:
    (rx157_rep, rx157_pos, $I10, $P10) = rx157_cur."!mark_fail"(0)
    lt rx157_pos, -1, rx157_done
    eq rx157_pos, -1, rx157_fail
    jump $I10
  rx157_done:
    rx157_cur."!cursor_fail"()
    if_null rx157_debug, debug_244
    rx157_cur."!cursor_debug"("FAIL", "quantifier:sym<?>")
  debug_244:
    .return (rx157_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<?>"  :subid("45_1297880735.27967") :method
.annotate 'line', 3
    $P159 = self."!PREFIX__!subrule"("backmod", "?")
    new $P160, "ResizablePMCArray"
    push $P160, $P159
    .return ($P160)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<{N,M}>"  :subid("46_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .const 'Sub' $P183 = "51_1297880735.27967" 
    capture_lex $P183
    .const 'Sub' $P178 = "50_1297880735.27967" 
    capture_lex $P178
    .const 'Sub' $P174 = "49_1297880735.27967" 
    capture_lex $P174
    .const 'Sub' $P171 = "48_1297880735.27967" 
    capture_lex $P171
    .local string rx164_tgt
    .local int rx164_pos
    .local int rx164_off
    .local int rx164_eos
    .local int rx164_rep
    .local pmc rx164_cur
    .local pmc rx164_debug
    (rx164_cur, rx164_pos, rx164_tgt, $I10) = self."!cursor_start"()
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
    if_null rx164_debug, debug_245
    rx164_cur."!cursor_debug"("START", "quantifier:sym<{N,M}>")
  debug_245:
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
.annotate 'line', 65
    rx164_cur."!cursor_pos"(rx164_pos)
    find_lex $P168, unicode:"$\x{a2}"
    $P169 = $P168."MATCH"()
    store_lex "$/", $P169
    .const 'Sub' $P171 = "48_1297880735.27967" 
    capture_lex $P171
    $P172 = $P171()
  # rx literal  "{"
    add $I11, rx164_pos, 1
    gt $I11, rx164_eos, rx164_fail
    sub $I11, rx164_pos, rx164_off
    ord $I11, rx164_tgt, $I11
    ne $I11, 123, rx164_fail
    add rx164_pos, 1
  # rx subrule $P174 subtype=capture negate=
    rx164_cur."!cursor_pos"(rx164_pos)
    .const 'Sub' $P174 = "49_1297880735.27967" 
    capture_lex $P174
    $P10 = rx164_cur.$P174()
    unless $P10, rx164_fail
    rx164_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"(0)
    rx164_pos = $P10."pos"()
  # rx subrule $P178 subtype=capture negate=
    rx164_cur."!cursor_pos"(rx164_pos)
    .const 'Sub' $P178 = "50_1297880735.27967" 
    capture_lex $P178
    $P10 = rx164_cur.$P178()
    unless $P10, rx164_fail
    rx164_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("1")
    rx164_pos = $P10."pos"()
  # rx subrule $P183 subtype=capture negate=
    rx164_cur."!cursor_pos"(rx164_pos)
    .const 'Sub' $P183 = "51_1297880735.27967" 
    capture_lex $P183
    $P10 = rx164_cur.$P183()
    unless $P10, rx164_fail
    rx164_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("2")
    rx164_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx164_pos, 1
    gt $I11, rx164_eos, rx164_fail
    sub $I11, rx164_pos, rx164_off
    ord $I11, rx164_tgt, $I11
    ne $I11, 125, rx164_fail
    add rx164_pos, 1
.annotate 'line', 66
  # rx subrule "obs" subtype=method negate=
    rx164_cur."!cursor_pos"(rx164_pos)
    $P10 = rx164_cur."obs"("{N,M} as general quantifier", "** N..M (or ** N..*)")
    unless $P10, rx164_fail
    rx164_pos = $P10."pos"()
.annotate 'line', 65
  # rx pass
    rx164_cur."!cursor_pass"(rx164_pos, "quantifier:sym<{N,M}>")
    if_null rx164_debug, debug_258
    rx164_cur."!cursor_debug"("PASS", "quantifier:sym<{N,M}>", " at pos=", rx164_pos)
  debug_258:
    .return (rx164_cur)
  rx164_restart:
.annotate 'line', 3
    if_null rx164_debug, debug_259
    rx164_cur."!cursor_debug"("NEXT", "quantifier:sym<{N,M}>")
  debug_259:
  rx164_fail:
    (rx164_rep, rx164_pos, $I10, $P10) = rx164_cur."!mark_fail"(0)
    lt rx164_pos, -1, rx164_done
    eq rx164_pos, -1, rx164_fail
    jump $I10
  rx164_done:
    rx164_cur."!cursor_fail"()
    if_null rx164_debug, debug_260
    rx164_cur."!cursor_debug"("FAIL", "quantifier:sym<{N,M}>")
  debug_260:
    .return (rx164_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<{N,M}>"  :subid("47_1297880735.27967") :method
.annotate 'line', 3
    new $P166, "ResizablePMCArray"
    push $P166, ""
    .return ($P166)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block170"  :anon :subid("48_1297880735.27967") :outer("46_1297880735.27967")
.annotate 'line', 65
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block173"  :anon :subid("49_1297880735.27967") :method :outer("46_1297880735.27967")
.annotate 'line', 65
    .local string rx175_tgt
    .local int rx175_pos
    .local int rx175_off
    .local int rx175_eos
    .local int rx175_rep
    .local pmc rx175_cur
    .local pmc rx175_debug
    (rx175_cur, rx175_pos, rx175_tgt, $I10) = self."!cursor_start"()
    getattribute rx175_debug, rx175_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx175_cur
    .local pmc match
    .lex "$/", match
    length rx175_eos, rx175_tgt
    gt rx175_pos, rx175_eos, rx175_done
    set rx175_off, 0
    lt rx175_pos, 2, rx175_start
    sub rx175_off, rx175_pos, 1
    substr rx175_tgt, rx175_tgt, rx175_off
  rx175_start:
    eq $I10, 1, rx175_restart
    if_null rx175_debug, debug_246
    rx175_cur."!cursor_debug"("START", "")
  debug_246:
    $I10 = self.'from'()
    ne $I10, -1, rxscan176_done
    goto rxscan176_scan
  rxscan176_loop:
    ($P10) = rx175_cur."from"()
    inc $P10
    set rx175_pos, $P10
    ge rx175_pos, rx175_eos, rxscan176_done
  rxscan176_scan:
    set_addr $I10, rxscan176_loop
    rx175_cur."!mark_push"(0, rx175_pos, $I10)
  rxscan176_done:
  # rx charclass_q d r 1..-1
    sub $I10, rx175_pos, rx175_off
    find_not_cclass $I11, 8, rx175_tgt, $I10, rx175_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx175_fail
    add rx175_pos, rx175_off, $I11
  # rx pass
    rx175_cur."!cursor_pass"(rx175_pos, "")
    if_null rx175_debug, debug_247
    rx175_cur."!cursor_debug"("PASS", "", " at pos=", rx175_pos)
  debug_247:
    .return (rx175_cur)
  rx175_restart:
    if_null rx175_debug, debug_248
    rx175_cur."!cursor_debug"("NEXT", "")
  debug_248:
  rx175_fail:
    (rx175_rep, rx175_pos, $I10, $P10) = rx175_cur."!mark_fail"(0)
    lt rx175_pos, -1, rx175_done
    eq rx175_pos, -1, rx175_fail
    jump $I10
  rx175_done:
    rx175_cur."!cursor_fail"()
    if_null rx175_debug, debug_249
    rx175_cur."!cursor_debug"("FAIL", "")
  debug_249:
    .return (rx175_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block177"  :anon :subid("50_1297880735.27967") :method :outer("46_1297880735.27967")
.annotate 'line', 65
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
    if_null rx179_debug, debug_250
    rx179_cur."!cursor_debug"("START", "")
  debug_250:
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
  # rx rxquantr181 ** 0..1
    set_addr $I10, rxquantr181_done
    rx179_cur."!mark_push"(0, rx179_pos, $I10)
  rxquantr181_loop:
  # rx literal  ","
    add $I11, rx179_pos, 1
    gt $I11, rx179_eos, rx179_fail
    sub $I11, rx179_pos, rx179_off
    ord $I11, rx179_tgt, $I11
    ne $I11, 44, rx179_fail
    add rx179_pos, 1
    set_addr $I10, rxquantr181_done
    (rx179_rep) = rx179_cur."!mark_commit"($I10)
  rxquantr181_done:
  # rx pass
    rx179_cur."!cursor_pass"(rx179_pos, "")
    if_null rx179_debug, debug_251
    rx179_cur."!cursor_debug"("PASS", "", " at pos=", rx179_pos)
  debug_251:
    .return (rx179_cur)
  rx179_restart:
    if_null rx179_debug, debug_252
    rx179_cur."!cursor_debug"("NEXT", "")
  debug_252:
  rx179_fail:
    (rx179_rep, rx179_pos, $I10, $P10) = rx179_cur."!mark_fail"(0)
    lt rx179_pos, -1, rx179_done
    eq rx179_pos, -1, rx179_fail
    jump $I10
  rx179_done:
    rx179_cur."!cursor_fail"()
    if_null rx179_debug, debug_253
    rx179_cur."!cursor_debug"("FAIL", "")
  debug_253:
    .return (rx179_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block182"  :anon :subid("51_1297880735.27967") :method :outer("46_1297880735.27967")
.annotate 'line', 65
    .local string rx184_tgt
    .local int rx184_pos
    .local int rx184_off
    .local int rx184_eos
    .local int rx184_rep
    .local pmc rx184_cur
    .local pmc rx184_debug
    (rx184_cur, rx184_pos, rx184_tgt, $I10) = self."!cursor_start"()
    getattribute rx184_debug, rx184_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx184_cur
    .local pmc match
    .lex "$/", match
    length rx184_eos, rx184_tgt
    gt rx184_pos, rx184_eos, rx184_done
    set rx184_off, 0
    lt rx184_pos, 2, rx184_start
    sub rx184_off, rx184_pos, 1
    substr rx184_tgt, rx184_tgt, rx184_off
  rx184_start:
    eq $I10, 1, rx184_restart
    if_null rx184_debug, debug_254
    rx184_cur."!cursor_debug"("START", "")
  debug_254:
    $I10 = self.'from'()
    ne $I10, -1, rxscan185_done
    goto rxscan185_scan
  rxscan185_loop:
    ($P10) = rx184_cur."from"()
    inc $P10
    set rx184_pos, $P10
    ge rx184_pos, rx184_eos, rxscan185_done
  rxscan185_scan:
    set_addr $I10, rxscan185_loop
    rx184_cur."!mark_push"(0, rx184_pos, $I10)
  rxscan185_done:
  # rx charclass_q d r 0..-1
    sub $I10, rx184_pos, rx184_off
    find_not_cclass $I11, 8, rx184_tgt, $I10, rx184_eos
    add rx184_pos, rx184_off, $I11
  # rx pass
    rx184_cur."!cursor_pass"(rx184_pos, "")
    if_null rx184_debug, debug_255
    rx184_cur."!cursor_debug"("PASS", "", " at pos=", rx184_pos)
  debug_255:
    .return (rx184_cur)
  rx184_restart:
    if_null rx184_debug, debug_256
    rx184_cur."!cursor_debug"("NEXT", "")
  debug_256:
  rx184_fail:
    (rx184_rep, rx184_pos, $I10, $P10) = rx184_cur."!mark_fail"(0)
    lt rx184_pos, -1, rx184_done
    eq rx184_pos, -1, rx184_fail
    jump $I10
  rx184_done:
    rx184_cur."!cursor_fail"()
    if_null rx184_debug, debug_257
    rx184_cur."!cursor_debug"("FAIL", "")
  debug_257:
    .return (rx184_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<**>"  :subid("52_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx187_tgt
    .local int rx187_pos
    .local int rx187_off
    .local int rx187_eos
    .local int rx187_rep
    .local pmc rx187_cur
    .local pmc rx187_debug
    (rx187_cur, rx187_pos, rx187_tgt, $I10) = self."!cursor_start"()
    rx187_cur."!cursor_caparray"("normspace", "max")
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
    if_null rx187_debug, debug_261
    rx187_cur."!cursor_debug"("START", "quantifier:sym<**>")
  debug_261:
    $I10 = self.'from'()
    ne $I10, -1, rxscan190_done
    goto rxscan190_scan
  rxscan190_loop:
    ($P10) = rx187_cur."from"()
    inc $P10
    set rx187_pos, $P10
    ge rx187_pos, rx187_eos, rxscan190_done
  rxscan190_scan:
    set_addr $I10, rxscan190_loop
    rx187_cur."!mark_push"(0, rx187_pos, $I10)
  rxscan190_done:
.annotate 'line', 69
  # rx subcapture "sym"
    set_addr $I10, rxcap_191_fail
    rx187_cur."!mark_push"(0, rx187_pos, $I10)
  # rx literal  "**"
    add $I11, rx187_pos, 2
    gt $I11, rx187_eos, rx187_fail
    sub $I11, rx187_pos, rx187_off
    substr $S10, rx187_tgt, $I11, 2
    ne $S10, "**", rx187_fail
    add rx187_pos, 2
    set_addr $I10, rxcap_191_fail
    ($I12, $I11) = rx187_cur."!mark_peek"($I10)
    rx187_cur."!cursor_pos"($I11)
    ($P10) = rx187_cur."!cursor_start"()
    $P10."!cursor_pass"(rx187_pos, "")
    rx187_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_191_done
  rxcap_191_fail:
    goto rx187_fail
  rxcap_191_done:
  # rx rxquantr192 ** 0..1
    set_addr $I10, rxquantr192_done
    rx187_cur."!mark_push"(0, rx187_pos, $I10)
  rxquantr192_loop:
  # rx subrule "normspace" subtype=capture negate=
    rx187_cur."!cursor_pos"(rx187_pos)
    $P10 = rx187_cur."normspace"()
    unless $P10, rx187_fail
    goto rxsubrule193_pass
  rxsubrule193_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx187_fail
  rxsubrule193_pass:
    set_addr $I10, rxsubrule193_back
    rx187_cur."!mark_push"(0, rx187_pos, $I10, $P10)
    $P10."!cursor_names"("normspace")
    rx187_pos = $P10."pos"()
    set_addr $I10, rxquantr192_done
    (rx187_rep) = rx187_cur."!mark_commit"($I10)
  rxquantr192_done:
  # rx subrule "backmod" subtype=capture negate=
    rx187_cur."!cursor_pos"(rx187_pos)
    $P10 = rx187_cur."backmod"()
    unless $P10, rx187_fail
    rx187_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx187_pos = $P10."pos"()
  # rx rxquantr194 ** 0..1
    set_addr $I10, rxquantr194_done
    rx187_cur."!mark_push"(0, rx187_pos, $I10)
  rxquantr194_loop:
  # rx subrule "normspace" subtype=capture negate=
    rx187_cur."!cursor_pos"(rx187_pos)
    $P10 = rx187_cur."normspace"()
    unless $P10, rx187_fail
    goto rxsubrule195_pass
  rxsubrule195_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx187_fail
  rxsubrule195_pass:
    set_addr $I10, rxsubrule195_back
    rx187_cur."!mark_push"(0, rx187_pos, $I10, $P10)
    $P10."!cursor_names"("normspace")
    rx187_pos = $P10."pos"()
    set_addr $I10, rxquantr194_done
    (rx187_rep) = rx187_cur."!mark_commit"($I10)
  rxquantr194_done:
  alt196_0:
.annotate 'line', 70
    set_addr $I10, alt196_1
    rx187_cur."!mark_push"(0, rx187_pos, $I10)
.annotate 'line', 71
  # rx subcapture "min"
    set_addr $I10, rxcap_197_fail
    rx187_cur."!mark_push"(0, rx187_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx187_pos, rx187_off
    find_not_cclass $I11, 8, rx187_tgt, $I10, rx187_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx187_fail
    add rx187_pos, rx187_off, $I11
    set_addr $I10, rxcap_197_fail
    ($I12, $I11) = rx187_cur."!mark_peek"($I10)
    rx187_cur."!cursor_pos"($I11)
    ($P10) = rx187_cur."!cursor_start"()
    $P10."!cursor_pass"(rx187_pos, "")
    rx187_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("min")
    goto rxcap_197_done
  rxcap_197_fail:
    goto rx187_fail
  rxcap_197_done:
.annotate 'line', 78
  # rx rxquantr198 ** 0..1
    set_addr $I10, rxquantr198_done
    rx187_cur."!mark_push"(0, rx187_pos, $I10)
  rxquantr198_loop:
.annotate 'line', 72
  # rx literal  ".."
    add $I11, rx187_pos, 2
    gt $I11, rx187_eos, rx187_fail
    sub $I11, rx187_pos, rx187_off
    substr $S10, rx187_tgt, $I11, 2
    ne $S10, "..", rx187_fail
    add rx187_pos, 2
.annotate 'line', 73
  # rx subcapture "max"
    set_addr $I10, rxcap_200_fail
    rx187_cur."!mark_push"(0, rx187_pos, $I10)
  alt199_0:
    set_addr $I10, alt199_1
    rx187_cur."!mark_push"(0, rx187_pos, $I10)
.annotate 'line', 74
  # rx charclass_q d r 1..-1
    sub $I10, rx187_pos, rx187_off
    find_not_cclass $I11, 8, rx187_tgt, $I10, rx187_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx187_fail
    add rx187_pos, rx187_off, $I11
    goto alt199_end
  alt199_1:
    set_addr $I10, alt199_2
    rx187_cur."!mark_push"(0, rx187_pos, $I10)
.annotate 'line', 75
  # rx literal  "*"
    add $I11, rx187_pos, 1
    gt $I11, rx187_eos, rx187_fail
    sub $I11, rx187_pos, rx187_off
    ord $I11, rx187_tgt, $I11
    ne $I11, 42, rx187_fail
    add rx187_pos, 1
    goto alt199_end
  alt199_2:
.annotate 'line', 76
  # rx subrule "panic" subtype=method negate=
    rx187_cur."!cursor_pos"(rx187_pos)
    $P10 = rx187_cur."panic"("Only integers or '*' allowed as range quantifier endpoint")
    unless $P10, rx187_fail
    rx187_pos = $P10."pos"()
  alt199_end:
.annotate 'line', 73
    set_addr $I10, rxcap_200_fail
    ($I12, $I11) = rx187_cur."!mark_peek"($I10)
    rx187_cur."!cursor_pos"($I11)
    ($P10) = rx187_cur."!cursor_start"()
    $P10."!cursor_pass"(rx187_pos, "")
    rx187_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("max")
    goto rxcap_200_done
  rxcap_200_fail:
    goto rx187_fail
  rxcap_200_done:
.annotate 'line', 78
    set_addr $I10, rxquantr198_done
    (rx187_rep) = rx187_cur."!mark_commit"($I10)
  rxquantr198_done:
.annotate 'line', 71
    goto alt196_end
  alt196_1:
.annotate 'line', 79
  # rx subrule "quantified_atom" subtype=capture negate=
    rx187_cur."!cursor_pos"(rx187_pos)
    $P10 = rx187_cur."quantified_atom"()
    unless $P10, rx187_fail
    rx187_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantified_atom")
    rx187_pos = $P10."pos"()
  alt196_end:
.annotate 'line', 68
  # rx pass
    rx187_cur."!cursor_pass"(rx187_pos, "quantifier:sym<**>")
    if_null rx187_debug, debug_262
    rx187_cur."!cursor_debug"("PASS", "quantifier:sym<**>", " at pos=", rx187_pos)
  debug_262:
    .return (rx187_cur)
  rx187_restart:
.annotate 'line', 3
    if_null rx187_debug, debug_263
    rx187_cur."!cursor_debug"("NEXT", "quantifier:sym<**>")
  debug_263:
  rx187_fail:
    (rx187_rep, rx187_pos, $I10, $P10) = rx187_cur."!mark_fail"(0)
    lt rx187_pos, -1, rx187_done
    eq rx187_pos, -1, rx187_fail
    jump $I10
  rx187_done:
    rx187_cur."!cursor_fail"()
    if_null rx187_debug, debug_264
    rx187_cur."!cursor_debug"("FAIL", "quantifier:sym<**>")
  debug_264:
    .return (rx187_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<**>"  :subid("53_1297880735.27967") :method
.annotate 'line', 3
    new $P189, "ResizablePMCArray"
    push $P189, "**"
    .return ($P189)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backmod"  :subid("54_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .const 'Sub' $P209 = "56_1297880735.27967" 
    capture_lex $P209
    .local string rx202_tgt
    .local int rx202_pos
    .local int rx202_off
    .local int rx202_eos
    .local int rx202_rep
    .local pmc rx202_cur
    .local pmc rx202_debug
    (rx202_cur, rx202_pos, rx202_tgt, $I10) = self."!cursor_start"()
    getattribute rx202_debug, rx202_cur, "$!debug"
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
    eq $I10, 1, rx202_restart
    if_null rx202_debug, debug_265
    rx202_cur."!cursor_debug"("START", "backmod")
  debug_265:
    $I10 = self.'from'()
    ne $I10, -1, rxscan205_done
    goto rxscan205_scan
  rxscan205_loop:
    ($P10) = rx202_cur."from"()
    inc $P10
    set rx202_pos, $P10
    ge rx202_pos, rx202_eos, rxscan205_done
  rxscan205_scan:
    set_addr $I10, rxscan205_loop
    rx202_cur."!mark_push"(0, rx202_pos, $I10)
  rxscan205_done:
.annotate 'line', 83
  # rx rxquantr206 ** 0..1
    set_addr $I10, rxquantr206_done
    rx202_cur."!mark_push"(0, rx202_pos, $I10)
  rxquantr206_loop:
  # rx literal  ":"
    add $I11, rx202_pos, 1
    gt $I11, rx202_eos, rx202_fail
    sub $I11, rx202_pos, rx202_off
    ord $I11, rx202_tgt, $I11
    ne $I11, 58, rx202_fail
    add rx202_pos, 1
    set_addr $I10, rxquantr206_done
    (rx202_rep) = rx202_cur."!mark_commit"($I10)
  rxquantr206_done:
  alt207_0:
    set_addr $I10, alt207_1
    rx202_cur."!mark_push"(0, rx202_pos, $I10)
  # rx literal  "?"
    add $I11, rx202_pos, 1
    gt $I11, rx202_eos, rx202_fail
    sub $I11, rx202_pos, rx202_off
    ord $I11, rx202_tgt, $I11
    ne $I11, 63, rx202_fail
    add rx202_pos, 1
    goto alt207_end
  alt207_1:
    set_addr $I10, alt207_2
    rx202_cur."!mark_push"(0, rx202_pos, $I10)
  # rx literal  "!"
    add $I11, rx202_pos, 1
    gt $I11, rx202_eos, rx202_fail
    sub $I11, rx202_pos, rx202_off
    ord $I11, rx202_tgt, $I11
    ne $I11, 33, rx202_fail
    add rx202_pos, 1
    goto alt207_end
  alt207_2:
  # rx subrule "before" subtype=zerowidth negate=1
    rx202_cur."!cursor_pos"(rx202_pos)
    .const 'Sub' $P209 = "56_1297880735.27967" 
    capture_lex $P209
    $P10 = rx202_cur."before"($P209)
    if $P10, rx202_fail
  alt207_end:
  # rx pass
    rx202_cur."!cursor_pass"(rx202_pos, "backmod")
    if_null rx202_debug, debug_270
    rx202_cur."!cursor_debug"("PASS", "backmod", " at pos=", rx202_pos)
  debug_270:
    .return (rx202_cur)
  rx202_restart:
.annotate 'line', 3
    if_null rx202_debug, debug_271
    rx202_cur."!cursor_debug"("NEXT", "backmod")
  debug_271:
  rx202_fail:
    (rx202_rep, rx202_pos, $I10, $P10) = rx202_cur."!mark_fail"(0)
    lt rx202_pos, -1, rx202_done
    eq rx202_pos, -1, rx202_fail
    jump $I10
  rx202_done:
    rx202_cur."!cursor_fail"()
    if_null rx202_debug, debug_272
    rx202_cur."!cursor_debug"("FAIL", "backmod")
  debug_272:
    .return (rx202_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backmod"  :subid("55_1297880735.27967") :method
.annotate 'line', 3
    new $P204, "ResizablePMCArray"
    push $P204, ""
    .return ($P204)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block208"  :anon :subid("56_1297880735.27967") :method :outer("54_1297880735.27967")
.annotate 'line', 83
    .local string rx210_tgt
    .local int rx210_pos
    .local int rx210_off
    .local int rx210_eos
    .local int rx210_rep
    .local pmc rx210_cur
    .local pmc rx210_debug
    (rx210_cur, rx210_pos, rx210_tgt, $I10) = self."!cursor_start"()
    getattribute rx210_debug, rx210_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx210_cur
    .local pmc match
    .lex "$/", match
    length rx210_eos, rx210_tgt
    gt rx210_pos, rx210_eos, rx210_done
    set rx210_off, 0
    lt rx210_pos, 2, rx210_start
    sub rx210_off, rx210_pos, 1
    substr rx210_tgt, rx210_tgt, rx210_off
  rx210_start:
    eq $I10, 1, rx210_restart
    if_null rx210_debug, debug_266
    rx210_cur."!cursor_debug"("START", "")
  debug_266:
    $I10 = self.'from'()
    ne $I10, -1, rxscan211_done
    goto rxscan211_scan
  rxscan211_loop:
    ($P10) = rx210_cur."from"()
    inc $P10
    set rx210_pos, $P10
    ge rx210_pos, rx210_eos, rxscan211_done
  rxscan211_scan:
    set_addr $I10, rxscan211_loop
    rx210_cur."!mark_push"(0, rx210_pos, $I10)
  rxscan211_done:
  # rx literal  ":"
    add $I11, rx210_pos, 1
    gt $I11, rx210_eos, rx210_fail
    sub $I11, rx210_pos, rx210_off
    ord $I11, rx210_tgt, $I11
    ne $I11, 58, rx210_fail
    add rx210_pos, 1
  # rx pass
    rx210_cur."!cursor_pass"(rx210_pos, "")
    if_null rx210_debug, debug_267
    rx210_cur."!cursor_debug"("PASS", "", " at pos=", rx210_pos)
  debug_267:
    .return (rx210_cur)
  rx210_restart:
    if_null rx210_debug, debug_268
    rx210_cur."!cursor_debug"("NEXT", "")
  debug_268:
  rx210_fail:
    (rx210_rep, rx210_pos, $I10, $P10) = rx210_cur."!mark_fail"(0)
    lt rx210_pos, -1, rx210_done
    eq rx210_pos, -1, rx210_fail
    jump $I10
  rx210_done:
    rx210_cur."!cursor_fail"()
    if_null rx210_debug, debug_269
    rx210_cur."!cursor_debug"("FAIL", "")
  debug_269:
    .return (rx210_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar"  :subid("57_1297880735.27967") :method
.annotate 'line', 85
    $P213 = self."!protoregex"("metachar")
    .return ($P213)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar"  :subid("58_1297880735.27967") :method
.annotate 'line', 85
    $P215 = self."!PREFIX__!protoregex"("metachar")
    .return ($P215)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<ws>"  :subid("59_1297880735.27967") :method :outer("11_1297880735.27967")
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
    if_null rx217_debug, debug_273
    rx217_cur."!cursor_debug"("START", "metachar:sym<ws>")
  debug_273:
    $I10 = self.'from'()
    ne $I10, -1, rxscan221_done
    goto rxscan221_scan
  rxscan221_loop:
    ($P10) = rx217_cur."from"()
    inc $P10
    set rx217_pos, $P10
    ge rx217_pos, rx217_eos, rxscan221_done
  rxscan221_scan:
    set_addr $I10, rxscan221_loop
    rx217_cur."!mark_push"(0, rx217_pos, $I10)
  rxscan221_done:
.annotate 'line', 86
  # rx subrule "normspace" subtype=method negate=
    rx217_cur."!cursor_pos"(rx217_pos)
    $P10 = rx217_cur."normspace"()
    unless $P10, rx217_fail
    rx217_pos = $P10."pos"()
  # rx pass
    rx217_cur."!cursor_pass"(rx217_pos, "metachar:sym<ws>")
    if_null rx217_debug, debug_274
    rx217_cur."!cursor_debug"("PASS", "metachar:sym<ws>", " at pos=", rx217_pos)
  debug_274:
    .return (rx217_cur)
  rx217_restart:
.annotate 'line', 3
    if_null rx217_debug, debug_275
    rx217_cur."!cursor_debug"("NEXT", "metachar:sym<ws>")
  debug_275:
  rx217_fail:
    (rx217_rep, rx217_pos, $I10, $P10) = rx217_cur."!mark_fail"(0)
    lt rx217_pos, -1, rx217_done
    eq rx217_pos, -1, rx217_fail
    jump $I10
  rx217_done:
    rx217_cur."!cursor_fail"()
    if_null rx217_debug, debug_276
    rx217_cur."!cursor_debug"("FAIL", "metachar:sym<ws>")
  debug_276:
    .return (rx217_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<ws>"  :subid("60_1297880735.27967") :method
.annotate 'line', 3
    $P219 = self."!PREFIX__!subrule"("normspace", "")
    new $P220, "ResizablePMCArray"
    push $P220, $P219
    .return ($P220)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<[ ]>"  :subid("61_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx223_tgt
    .local int rx223_pos
    .local int rx223_off
    .local int rx223_eos
    .local int rx223_rep
    .local pmc rx223_cur
    .local pmc rx223_debug
    (rx223_cur, rx223_pos, rx223_tgt, $I10) = self."!cursor_start"()
    getattribute rx223_debug, rx223_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx223_cur
    .local pmc match
    .lex "$/", match
    length rx223_eos, rx223_tgt
    gt rx223_pos, rx223_eos, rx223_done
    set rx223_off, 0
    lt rx223_pos, 2, rx223_start
    sub rx223_off, rx223_pos, 1
    substr rx223_tgt, rx223_tgt, rx223_off
  rx223_start:
    eq $I10, 1, rx223_restart
    if_null rx223_debug, debug_277
    rx223_cur."!cursor_debug"("START", "metachar:sym<[ ]>")
  debug_277:
    $I10 = self.'from'()
    ne $I10, -1, rxscan227_done
    goto rxscan227_scan
  rxscan227_loop:
    ($P10) = rx223_cur."from"()
    inc $P10
    set rx223_pos, $P10
    ge rx223_pos, rx223_eos, rxscan227_done
  rxscan227_scan:
    set_addr $I10, rxscan227_loop
    rx223_cur."!mark_push"(0, rx223_pos, $I10)
  rxscan227_done:
.annotate 'line', 87
  # rx literal  "["
    add $I11, rx223_pos, 1
    gt $I11, rx223_eos, rx223_fail
    sub $I11, rx223_pos, rx223_off
    ord $I11, rx223_tgt, $I11
    ne $I11, 91, rx223_fail
    add rx223_pos, 1
  # rx subrule "nibbler" subtype=capture negate=
    rx223_cur."!cursor_pos"(rx223_pos)
    $P10 = rx223_cur."nibbler"()
    unless $P10, rx223_fail
    rx223_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx223_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx223_pos, 1
    gt $I11, rx223_eos, rx223_fail
    sub $I11, rx223_pos, rx223_off
    ord $I11, rx223_tgt, $I11
    ne $I11, 93, rx223_fail
    add rx223_pos, 1
  # rx pass
    rx223_cur."!cursor_pass"(rx223_pos, "metachar:sym<[ ]>")
    if_null rx223_debug, debug_278
    rx223_cur."!cursor_debug"("PASS", "metachar:sym<[ ]>", " at pos=", rx223_pos)
  debug_278:
    .return (rx223_cur)
  rx223_restart:
.annotate 'line', 3
    if_null rx223_debug, debug_279
    rx223_cur."!cursor_debug"("NEXT", "metachar:sym<[ ]>")
  debug_279:
  rx223_fail:
    (rx223_rep, rx223_pos, $I10, $P10) = rx223_cur."!mark_fail"(0)
    lt rx223_pos, -1, rx223_done
    eq rx223_pos, -1, rx223_fail
    jump $I10
  rx223_done:
    rx223_cur."!cursor_fail"()
    if_null rx223_debug, debug_280
    rx223_cur."!cursor_debug"("FAIL", "metachar:sym<[ ]>")
  debug_280:
    .return (rx223_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<[ ]>"  :subid("62_1297880735.27967") :method
.annotate 'line', 3
    $P225 = self."!PREFIX__!subrule"("nibbler", "[")
    new $P226, "ResizablePMCArray"
    push $P226, $P225
    .return ($P226)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<( )>"  :subid("63_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx229_tgt
    .local int rx229_pos
    .local int rx229_off
    .local int rx229_eos
    .local int rx229_rep
    .local pmc rx229_cur
    .local pmc rx229_debug
    (rx229_cur, rx229_pos, rx229_tgt, $I10) = self."!cursor_start"()
    getattribute rx229_debug, rx229_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx229_cur
    .local pmc match
    .lex "$/", match
    length rx229_eos, rx229_tgt
    gt rx229_pos, rx229_eos, rx229_done
    set rx229_off, 0
    lt rx229_pos, 2, rx229_start
    sub rx229_off, rx229_pos, 1
    substr rx229_tgt, rx229_tgt, rx229_off
  rx229_start:
    eq $I10, 1, rx229_restart
    if_null rx229_debug, debug_281
    rx229_cur."!cursor_debug"("START", "metachar:sym<( )>")
  debug_281:
    $I10 = self.'from'()
    ne $I10, -1, rxscan233_done
    goto rxscan233_scan
  rxscan233_loop:
    ($P10) = rx229_cur."from"()
    inc $P10
    set rx229_pos, $P10
    ge rx229_pos, rx229_eos, rxscan233_done
  rxscan233_scan:
    set_addr $I10, rxscan233_loop
    rx229_cur."!mark_push"(0, rx229_pos, $I10)
  rxscan233_done:
.annotate 'line', 88
  # rx literal  "("
    add $I11, rx229_pos, 1
    gt $I11, rx229_eos, rx229_fail
    sub $I11, rx229_pos, rx229_off
    ord $I11, rx229_tgt, $I11
    ne $I11, 40, rx229_fail
    add rx229_pos, 1
  # rx subrule "nibbler" subtype=capture negate=
    rx229_cur."!cursor_pos"(rx229_pos)
    $P10 = rx229_cur."nibbler"()
    unless $P10, rx229_fail
    rx229_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx229_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx229_pos, 1
    gt $I11, rx229_eos, rx229_fail
    sub $I11, rx229_pos, rx229_off
    ord $I11, rx229_tgt, $I11
    ne $I11, 41, rx229_fail
    add rx229_pos, 1
  # rx pass
    rx229_cur."!cursor_pass"(rx229_pos, "metachar:sym<( )>")
    if_null rx229_debug, debug_282
    rx229_cur."!cursor_debug"("PASS", "metachar:sym<( )>", " at pos=", rx229_pos)
  debug_282:
    .return (rx229_cur)
  rx229_restart:
.annotate 'line', 3
    if_null rx229_debug, debug_283
    rx229_cur."!cursor_debug"("NEXT", "metachar:sym<( )>")
  debug_283:
  rx229_fail:
    (rx229_rep, rx229_pos, $I10, $P10) = rx229_cur."!mark_fail"(0)
    lt rx229_pos, -1, rx229_done
    eq rx229_pos, -1, rx229_fail
    jump $I10
  rx229_done:
    rx229_cur."!cursor_fail"()
    if_null rx229_debug, debug_284
    rx229_cur."!cursor_debug"("FAIL", "metachar:sym<( )>")
  debug_284:
    .return (rx229_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<( )>"  :subid("64_1297880735.27967") :method
.annotate 'line', 3
    $P231 = self."!PREFIX__!subrule"("nibbler", "(")
    new $P232, "ResizablePMCArray"
    push $P232, $P231
    .return ($P232)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<'>"  :subid("65_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx235_tgt
    .local int rx235_pos
    .local int rx235_off
    .local int rx235_eos
    .local int rx235_rep
    .local pmc rx235_cur
    .local pmc rx235_debug
    (rx235_cur, rx235_pos, rx235_tgt, $I10) = self."!cursor_start"()
    getattribute rx235_debug, rx235_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx235_cur
    .local pmc match
    .lex "$/", match
    length rx235_eos, rx235_tgt
    gt rx235_pos, rx235_eos, rx235_done
    set rx235_off, 0
    lt rx235_pos, 2, rx235_start
    sub rx235_off, rx235_pos, 1
    substr rx235_tgt, rx235_tgt, rx235_off
  rx235_start:
    eq $I10, 1, rx235_restart
    if_null rx235_debug, debug_285
    rx235_cur."!cursor_debug"("START", "metachar:sym<'>")
  debug_285:
    $I10 = self.'from'()
    ne $I10, -1, rxscan238_done
    goto rxscan238_scan
  rxscan238_loop:
    ($P10) = rx235_cur."from"()
    inc $P10
    set rx235_pos, $P10
    ge rx235_pos, rx235_eos, rxscan238_done
  rxscan238_scan:
    set_addr $I10, rxscan238_loop
    rx235_cur."!mark_push"(0, rx235_pos, $I10)
  rxscan238_done:
.annotate 'line', 89
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx235_pos, rx235_off
    substr $S10, rx235_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx235_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx235_cur."!cursor_pos"(rx235_pos)
    $P10 = rx235_cur."quote_EXPR"(":q")
    unless $P10, rx235_fail
    rx235_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx235_pos = $P10."pos"()
  # rx pass
    rx235_cur."!cursor_pass"(rx235_pos, "metachar:sym<'>")
    if_null rx235_debug, debug_286
    rx235_cur."!cursor_debug"("PASS", "metachar:sym<'>", " at pos=", rx235_pos)
  debug_286:
    .return (rx235_cur)
  rx235_restart:
.annotate 'line', 3
    if_null rx235_debug, debug_287
    rx235_cur."!cursor_debug"("NEXT", "metachar:sym<'>")
  debug_287:
  rx235_fail:
    (rx235_rep, rx235_pos, $I10, $P10) = rx235_cur."!mark_fail"(0)
    lt rx235_pos, -1, rx235_done
    eq rx235_pos, -1, rx235_fail
    jump $I10
  rx235_done:
    rx235_cur."!cursor_fail"()
    if_null rx235_debug, debug_288
    rx235_cur."!cursor_debug"("FAIL", "metachar:sym<'>")
  debug_288:
    .return (rx235_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<'>"  :subid("66_1297880735.27967") :method
.annotate 'line', 3
    new $P237, "ResizablePMCArray"
    push $P237, "'"
    .return ($P237)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<\">"  :subid("67_1297880735.27967") :method :outer("11_1297880735.27967")
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
    if_null rx240_debug, debug_289
    rx240_cur."!cursor_debug"("START", "metachar:sym<\">")
  debug_289:
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
.annotate 'line', 90
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx240_pos, rx240_off
    substr $S10, rx240_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx240_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx240_cur."!cursor_pos"(rx240_pos)
    $P10 = rx240_cur."quote_EXPR"(":qq")
    unless $P10, rx240_fail
    rx240_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx240_pos = $P10."pos"()
  # rx pass
    rx240_cur."!cursor_pass"(rx240_pos, "metachar:sym<\">")
    if_null rx240_debug, debug_290
    rx240_cur."!cursor_debug"("PASS", "metachar:sym<\">", " at pos=", rx240_pos)
  debug_290:
    .return (rx240_cur)
  rx240_restart:
.annotate 'line', 3
    if_null rx240_debug, debug_291
    rx240_cur."!cursor_debug"("NEXT", "metachar:sym<\">")
  debug_291:
  rx240_fail:
    (rx240_rep, rx240_pos, $I10, $P10) = rx240_cur."!mark_fail"(0)
    lt rx240_pos, -1, rx240_done
    eq rx240_pos, -1, rx240_fail
    jump $I10
  rx240_done:
    rx240_cur."!cursor_fail"()
    if_null rx240_debug, debug_292
    rx240_cur."!cursor_debug"("FAIL", "metachar:sym<\">")
  debug_292:
    .return (rx240_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<\">"  :subid("68_1297880735.27967") :method
.annotate 'line', 3
    new $P242, "ResizablePMCArray"
    push $P242, "\""
    .return ($P242)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<.>"  :subid("69_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx245_tgt
    .local int rx245_pos
    .local int rx245_off
    .local int rx245_eos
    .local int rx245_rep
    .local pmc rx245_cur
    .local pmc rx245_debug
    (rx245_cur, rx245_pos, rx245_tgt, $I10) = self."!cursor_start"()
    getattribute rx245_debug, rx245_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx245_cur
    .local pmc match
    .lex "$/", match
    length rx245_eos, rx245_tgt
    gt rx245_pos, rx245_eos, rx245_done
    set rx245_off, 0
    lt rx245_pos, 2, rx245_start
    sub rx245_off, rx245_pos, 1
    substr rx245_tgt, rx245_tgt, rx245_off
  rx245_start:
    eq $I10, 1, rx245_restart
    if_null rx245_debug, debug_293
    rx245_cur."!cursor_debug"("START", "metachar:sym<.>")
  debug_293:
    $I10 = self.'from'()
    ne $I10, -1, rxscan248_done
    goto rxscan248_scan
  rxscan248_loop:
    ($P10) = rx245_cur."from"()
    inc $P10
    set rx245_pos, $P10
    ge rx245_pos, rx245_eos, rxscan248_done
  rxscan248_scan:
    set_addr $I10, rxscan248_loop
    rx245_cur."!mark_push"(0, rx245_pos, $I10)
  rxscan248_done:
.annotate 'line', 91
  # rx subcapture "sym"
    set_addr $I10, rxcap_249_fail
    rx245_cur."!mark_push"(0, rx245_pos, $I10)
  # rx literal  "."
    add $I11, rx245_pos, 1
    gt $I11, rx245_eos, rx245_fail
    sub $I11, rx245_pos, rx245_off
    ord $I11, rx245_tgt, $I11
    ne $I11, 46, rx245_fail
    add rx245_pos, 1
    set_addr $I10, rxcap_249_fail
    ($I12, $I11) = rx245_cur."!mark_peek"($I10)
    rx245_cur."!cursor_pos"($I11)
    ($P10) = rx245_cur."!cursor_start"()
    $P10."!cursor_pass"(rx245_pos, "")
    rx245_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_249_done
  rxcap_249_fail:
    goto rx245_fail
  rxcap_249_done:
  # rx pass
    rx245_cur."!cursor_pass"(rx245_pos, "metachar:sym<.>")
    if_null rx245_debug, debug_294
    rx245_cur."!cursor_debug"("PASS", "metachar:sym<.>", " at pos=", rx245_pos)
  debug_294:
    .return (rx245_cur)
  rx245_restart:
.annotate 'line', 3
    if_null rx245_debug, debug_295
    rx245_cur."!cursor_debug"("NEXT", "metachar:sym<.>")
  debug_295:
  rx245_fail:
    (rx245_rep, rx245_pos, $I10, $P10) = rx245_cur."!mark_fail"(0)
    lt rx245_pos, -1, rx245_done
    eq rx245_pos, -1, rx245_fail
    jump $I10
  rx245_done:
    rx245_cur."!cursor_fail"()
    if_null rx245_debug, debug_296
    rx245_cur."!cursor_debug"("FAIL", "metachar:sym<.>")
  debug_296:
    .return (rx245_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<.>"  :subid("70_1297880735.27967") :method
.annotate 'line', 3
    new $P247, "ResizablePMCArray"
    push $P247, "."
    .return ($P247)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^>"  :subid("71_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx251_tgt
    .local int rx251_pos
    .local int rx251_off
    .local int rx251_eos
    .local int rx251_rep
    .local pmc rx251_cur
    .local pmc rx251_debug
    (rx251_cur, rx251_pos, rx251_tgt, $I10) = self."!cursor_start"()
    getattribute rx251_debug, rx251_cur, "$!debug"
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
    if_null rx251_debug, debug_297
    rx251_cur."!cursor_debug"("START", "metachar:sym<^>")
  debug_297:
    $I10 = self.'from'()
    ne $I10, -1, rxscan254_done
    goto rxscan254_scan
  rxscan254_loop:
    ($P10) = rx251_cur."from"()
    inc $P10
    set rx251_pos, $P10
    ge rx251_pos, rx251_eos, rxscan254_done
  rxscan254_scan:
    set_addr $I10, rxscan254_loop
    rx251_cur."!mark_push"(0, rx251_pos, $I10)
  rxscan254_done:
.annotate 'line', 92
  # rx subcapture "sym"
    set_addr $I10, rxcap_255_fail
    rx251_cur."!mark_push"(0, rx251_pos, $I10)
  # rx literal  "^"
    add $I11, rx251_pos, 1
    gt $I11, rx251_eos, rx251_fail
    sub $I11, rx251_pos, rx251_off
    ord $I11, rx251_tgt, $I11
    ne $I11, 94, rx251_fail
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
  # rx pass
    rx251_cur."!cursor_pass"(rx251_pos, "metachar:sym<^>")
    if_null rx251_debug, debug_298
    rx251_cur."!cursor_debug"("PASS", "metachar:sym<^>", " at pos=", rx251_pos)
  debug_298:
    .return (rx251_cur)
  rx251_restart:
.annotate 'line', 3
    if_null rx251_debug, debug_299
    rx251_cur."!cursor_debug"("NEXT", "metachar:sym<^>")
  debug_299:
  rx251_fail:
    (rx251_rep, rx251_pos, $I10, $P10) = rx251_cur."!mark_fail"(0)
    lt rx251_pos, -1, rx251_done
    eq rx251_pos, -1, rx251_fail
    jump $I10
  rx251_done:
    rx251_cur."!cursor_fail"()
    if_null rx251_debug, debug_300
    rx251_cur."!cursor_debug"("FAIL", "metachar:sym<^>")
  debug_300:
    .return (rx251_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<^>"  :subid("72_1297880735.27967") :method
.annotate 'line', 3
    new $P253, "ResizablePMCArray"
    push $P253, "^"
    .return ($P253)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^^>"  :subid("73_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx257_tgt
    .local int rx257_pos
    .local int rx257_off
    .local int rx257_eos
    .local int rx257_rep
    .local pmc rx257_cur
    .local pmc rx257_debug
    (rx257_cur, rx257_pos, rx257_tgt, $I10) = self."!cursor_start"()
    getattribute rx257_debug, rx257_cur, "$!debug"
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
    if_null rx257_debug, debug_301
    rx257_cur."!cursor_debug"("START", "metachar:sym<^^>")
  debug_301:
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
.annotate 'line', 93
  # rx subcapture "sym"
    set_addr $I10, rxcap_261_fail
    rx257_cur."!mark_push"(0, rx257_pos, $I10)
  # rx literal  "^^"
    add $I11, rx257_pos, 2
    gt $I11, rx257_eos, rx257_fail
    sub $I11, rx257_pos, rx257_off
    substr $S10, rx257_tgt, $I11, 2
    ne $S10, "^^", rx257_fail
    add rx257_pos, 2
    set_addr $I10, rxcap_261_fail
    ($I12, $I11) = rx257_cur."!mark_peek"($I10)
    rx257_cur."!cursor_pos"($I11)
    ($P10) = rx257_cur."!cursor_start"()
    $P10."!cursor_pass"(rx257_pos, "")
    rx257_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_261_done
  rxcap_261_fail:
    goto rx257_fail
  rxcap_261_done:
  # rx pass
    rx257_cur."!cursor_pass"(rx257_pos, "metachar:sym<^^>")
    if_null rx257_debug, debug_302
    rx257_cur."!cursor_debug"("PASS", "metachar:sym<^^>", " at pos=", rx257_pos)
  debug_302:
    .return (rx257_cur)
  rx257_restart:
.annotate 'line', 3
    if_null rx257_debug, debug_303
    rx257_cur."!cursor_debug"("NEXT", "metachar:sym<^^>")
  debug_303:
  rx257_fail:
    (rx257_rep, rx257_pos, $I10, $P10) = rx257_cur."!mark_fail"(0)
    lt rx257_pos, -1, rx257_done
    eq rx257_pos, -1, rx257_fail
    jump $I10
  rx257_done:
    rx257_cur."!cursor_fail"()
    if_null rx257_debug, debug_304
    rx257_cur."!cursor_debug"("FAIL", "metachar:sym<^^>")
  debug_304:
    .return (rx257_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<^^>"  :subid("74_1297880735.27967") :method
.annotate 'line', 3
    new $P259, "ResizablePMCArray"
    push $P259, "^^"
    .return ($P259)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$>"  :subid("75_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx263_tgt
    .local int rx263_pos
    .local int rx263_off
    .local int rx263_eos
    .local int rx263_rep
    .local pmc rx263_cur
    .local pmc rx263_debug
    (rx263_cur, rx263_pos, rx263_tgt, $I10) = self."!cursor_start"()
    getattribute rx263_debug, rx263_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx263_cur
    .local pmc match
    .lex "$/", match
    length rx263_eos, rx263_tgt
    gt rx263_pos, rx263_eos, rx263_done
    set rx263_off, 0
    lt rx263_pos, 2, rx263_start
    sub rx263_off, rx263_pos, 1
    substr rx263_tgt, rx263_tgt, rx263_off
  rx263_start:
    eq $I10, 1, rx263_restart
    if_null rx263_debug, debug_305
    rx263_cur."!cursor_debug"("START", "metachar:sym<$>")
  debug_305:
    $I10 = self.'from'()
    ne $I10, -1, rxscan266_done
    goto rxscan266_scan
  rxscan266_loop:
    ($P10) = rx263_cur."from"()
    inc $P10
    set rx263_pos, $P10
    ge rx263_pos, rx263_eos, rxscan266_done
  rxscan266_scan:
    set_addr $I10, rxscan266_loop
    rx263_cur."!mark_push"(0, rx263_pos, $I10)
  rxscan266_done:
.annotate 'line', 94
  # rx subcapture "sym"
    set_addr $I10, rxcap_267_fail
    rx263_cur."!mark_push"(0, rx263_pos, $I10)
  # rx literal  "$"
    add $I11, rx263_pos, 1
    gt $I11, rx263_eos, rx263_fail
    sub $I11, rx263_pos, rx263_off
    ord $I11, rx263_tgt, $I11
    ne $I11, 36, rx263_fail
    add rx263_pos, 1
    set_addr $I10, rxcap_267_fail
    ($I12, $I11) = rx263_cur."!mark_peek"($I10)
    rx263_cur."!cursor_pos"($I11)
    ($P10) = rx263_cur."!cursor_start"()
    $P10."!cursor_pass"(rx263_pos, "")
    rx263_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_267_done
  rxcap_267_fail:
    goto rx263_fail
  rxcap_267_done:
  # rx pass
    rx263_cur."!cursor_pass"(rx263_pos, "metachar:sym<$>")
    if_null rx263_debug, debug_306
    rx263_cur."!cursor_debug"("PASS", "metachar:sym<$>", " at pos=", rx263_pos)
  debug_306:
    .return (rx263_cur)
  rx263_restart:
.annotate 'line', 3
    if_null rx263_debug, debug_307
    rx263_cur."!cursor_debug"("NEXT", "metachar:sym<$>")
  debug_307:
  rx263_fail:
    (rx263_rep, rx263_pos, $I10, $P10) = rx263_cur."!mark_fail"(0)
    lt rx263_pos, -1, rx263_done
    eq rx263_pos, -1, rx263_fail
    jump $I10
  rx263_done:
    rx263_cur."!cursor_fail"()
    if_null rx263_debug, debug_308
    rx263_cur."!cursor_debug"("FAIL", "metachar:sym<$>")
  debug_308:
    .return (rx263_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<$>"  :subid("76_1297880735.27967") :method
.annotate 'line', 3
    new $P265, "ResizablePMCArray"
    push $P265, "$"
    .return ($P265)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$$>"  :subid("77_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx269_tgt
    .local int rx269_pos
    .local int rx269_off
    .local int rx269_eos
    .local int rx269_rep
    .local pmc rx269_cur
    .local pmc rx269_debug
    (rx269_cur, rx269_pos, rx269_tgt, $I10) = self."!cursor_start"()
    getattribute rx269_debug, rx269_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx269_cur
    .local pmc match
    .lex "$/", match
    length rx269_eos, rx269_tgt
    gt rx269_pos, rx269_eos, rx269_done
    set rx269_off, 0
    lt rx269_pos, 2, rx269_start
    sub rx269_off, rx269_pos, 1
    substr rx269_tgt, rx269_tgt, rx269_off
  rx269_start:
    eq $I10, 1, rx269_restart
    if_null rx269_debug, debug_309
    rx269_cur."!cursor_debug"("START", "metachar:sym<$$>")
  debug_309:
    $I10 = self.'from'()
    ne $I10, -1, rxscan272_done
    goto rxscan272_scan
  rxscan272_loop:
    ($P10) = rx269_cur."from"()
    inc $P10
    set rx269_pos, $P10
    ge rx269_pos, rx269_eos, rxscan272_done
  rxscan272_scan:
    set_addr $I10, rxscan272_loop
    rx269_cur."!mark_push"(0, rx269_pos, $I10)
  rxscan272_done:
.annotate 'line', 95
  # rx subcapture "sym"
    set_addr $I10, rxcap_273_fail
    rx269_cur."!mark_push"(0, rx269_pos, $I10)
  # rx literal  "$$"
    add $I11, rx269_pos, 2
    gt $I11, rx269_eos, rx269_fail
    sub $I11, rx269_pos, rx269_off
    substr $S10, rx269_tgt, $I11, 2
    ne $S10, "$$", rx269_fail
    add rx269_pos, 2
    set_addr $I10, rxcap_273_fail
    ($I12, $I11) = rx269_cur."!mark_peek"($I10)
    rx269_cur."!cursor_pos"($I11)
    ($P10) = rx269_cur."!cursor_start"()
    $P10."!cursor_pass"(rx269_pos, "")
    rx269_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_273_done
  rxcap_273_fail:
    goto rx269_fail
  rxcap_273_done:
  # rx pass
    rx269_cur."!cursor_pass"(rx269_pos, "metachar:sym<$$>")
    if_null rx269_debug, debug_310
    rx269_cur."!cursor_debug"("PASS", "metachar:sym<$$>", " at pos=", rx269_pos)
  debug_310:
    .return (rx269_cur)
  rx269_restart:
.annotate 'line', 3
    if_null rx269_debug, debug_311
    rx269_cur."!cursor_debug"("NEXT", "metachar:sym<$$>")
  debug_311:
  rx269_fail:
    (rx269_rep, rx269_pos, $I10, $P10) = rx269_cur."!mark_fail"(0)
    lt rx269_pos, -1, rx269_done
    eq rx269_pos, -1, rx269_fail
    jump $I10
  rx269_done:
    rx269_cur."!cursor_fail"()
    if_null rx269_debug, debug_312
    rx269_cur."!cursor_debug"("FAIL", "metachar:sym<$$>")
  debug_312:
    .return (rx269_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<$$>"  :subid("78_1297880735.27967") :method
.annotate 'line', 3
    new $P271, "ResizablePMCArray"
    push $P271, "$$"
    .return ($P271)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<:::>"  :subid("79_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx275_tgt
    .local int rx275_pos
    .local int rx275_off
    .local int rx275_eos
    .local int rx275_rep
    .local pmc rx275_cur
    .local pmc rx275_debug
    (rx275_cur, rx275_pos, rx275_tgt, $I10) = self."!cursor_start"()
    getattribute rx275_debug, rx275_cur, "$!debug"
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
    eq $I10, 1, rx275_restart
    if_null rx275_debug, debug_313
    rx275_cur."!cursor_debug"("START", "metachar:sym<:::>")
  debug_313:
    $I10 = self.'from'()
    ne $I10, -1, rxscan279_done
    goto rxscan279_scan
  rxscan279_loop:
    ($P10) = rx275_cur."from"()
    inc $P10
    set rx275_pos, $P10
    ge rx275_pos, rx275_eos, rxscan279_done
  rxscan279_scan:
    set_addr $I10, rxscan279_loop
    rx275_cur."!mark_push"(0, rx275_pos, $I10)
  rxscan279_done:
.annotate 'line', 96
  # rx subcapture "sym"
    set_addr $I10, rxcap_280_fail
    rx275_cur."!mark_push"(0, rx275_pos, $I10)
  # rx literal  ":::"
    add $I11, rx275_pos, 3
    gt $I11, rx275_eos, rx275_fail
    sub $I11, rx275_pos, rx275_off
    substr $S10, rx275_tgt, $I11, 3
    ne $S10, ":::", rx275_fail
    add rx275_pos, 3
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
  # rx subrule "panic" subtype=method negate=
    rx275_cur."!cursor_pos"(rx275_pos)
    $P10 = rx275_cur."panic"("::: not yet implemented")
    unless $P10, rx275_fail
    rx275_pos = $P10."pos"()
  # rx pass
    rx275_cur."!cursor_pass"(rx275_pos, "metachar:sym<:::>")
    if_null rx275_debug, debug_314
    rx275_cur."!cursor_debug"("PASS", "metachar:sym<:::>", " at pos=", rx275_pos)
  debug_314:
    .return (rx275_cur)
  rx275_restart:
.annotate 'line', 3
    if_null rx275_debug, debug_315
    rx275_cur."!cursor_debug"("NEXT", "metachar:sym<:::>")
  debug_315:
  rx275_fail:
    (rx275_rep, rx275_pos, $I10, $P10) = rx275_cur."!mark_fail"(0)
    lt rx275_pos, -1, rx275_done
    eq rx275_pos, -1, rx275_fail
    jump $I10
  rx275_done:
    rx275_cur."!cursor_fail"()
    if_null rx275_debug, debug_316
    rx275_cur."!cursor_debug"("FAIL", "metachar:sym<:::>")
  debug_316:
    .return (rx275_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<:::>"  :subid("80_1297880735.27967") :method
.annotate 'line', 3
    $P277 = self."!PREFIX__!subrule"("panic", ":::")
    new $P278, "ResizablePMCArray"
    push $P278, $P277
    .return ($P278)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<::>"  :subid("81_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx282_tgt
    .local int rx282_pos
    .local int rx282_off
    .local int rx282_eos
    .local int rx282_rep
    .local pmc rx282_cur
    .local pmc rx282_debug
    (rx282_cur, rx282_pos, rx282_tgt, $I10) = self."!cursor_start"()
    getattribute rx282_debug, rx282_cur, "$!debug"
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
    eq $I10, 1, rx282_restart
    if_null rx282_debug, debug_317
    rx282_cur."!cursor_debug"("START", "metachar:sym<::>")
  debug_317:
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
.annotate 'line', 97
  # rx subcapture "sym"
    set_addr $I10, rxcap_287_fail
    rx282_cur."!mark_push"(0, rx282_pos, $I10)
  # rx literal  "::"
    add $I11, rx282_pos, 2
    gt $I11, rx282_eos, rx282_fail
    sub $I11, rx282_pos, rx282_off
    substr $S10, rx282_tgt, $I11, 2
    ne $S10, "::", rx282_fail
    add rx282_pos, 2
    set_addr $I10, rxcap_287_fail
    ($I12, $I11) = rx282_cur."!mark_peek"($I10)
    rx282_cur."!cursor_pos"($I11)
    ($P10) = rx282_cur."!cursor_start"()
    $P10."!cursor_pass"(rx282_pos, "")
    rx282_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_287_done
  rxcap_287_fail:
    goto rx282_fail
  rxcap_287_done:
  # rx subrule "panic" subtype=method negate=
    rx282_cur."!cursor_pos"(rx282_pos)
    $P10 = rx282_cur."panic"(":: not yet implemented")
    unless $P10, rx282_fail
    rx282_pos = $P10."pos"()
  # rx pass
    rx282_cur."!cursor_pass"(rx282_pos, "metachar:sym<::>")
    if_null rx282_debug, debug_318
    rx282_cur."!cursor_debug"("PASS", "metachar:sym<::>", " at pos=", rx282_pos)
  debug_318:
    .return (rx282_cur)
  rx282_restart:
.annotate 'line', 3
    if_null rx282_debug, debug_319
    rx282_cur."!cursor_debug"("NEXT", "metachar:sym<::>")
  debug_319:
  rx282_fail:
    (rx282_rep, rx282_pos, $I10, $P10) = rx282_cur."!mark_fail"(0)
    lt rx282_pos, -1, rx282_done
    eq rx282_pos, -1, rx282_fail
    jump $I10
  rx282_done:
    rx282_cur."!cursor_fail"()
    if_null rx282_debug, debug_320
    rx282_cur."!cursor_debug"("FAIL", "metachar:sym<::>")
  debug_320:
    .return (rx282_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<::>"  :subid("82_1297880735.27967") :method
.annotate 'line', 3
    $P284 = self."!PREFIX__!subrule"("panic", "::")
    new $P285, "ResizablePMCArray"
    push $P285, $P284
    .return ($P285)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<lwb>"  :subid("83_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx289_tgt
    .local int rx289_pos
    .local int rx289_off
    .local int rx289_eos
    .local int rx289_rep
    .local pmc rx289_cur
    .local pmc rx289_debug
    (rx289_cur, rx289_pos, rx289_tgt, $I10) = self."!cursor_start"()
    getattribute rx289_debug, rx289_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx289_cur
    .local pmc match
    .lex "$/", match
    length rx289_eos, rx289_tgt
    gt rx289_pos, rx289_eos, rx289_done
    set rx289_off, 0
    lt rx289_pos, 2, rx289_start
    sub rx289_off, rx289_pos, 1
    substr rx289_tgt, rx289_tgt, rx289_off
  rx289_start:
    eq $I10, 1, rx289_restart
    if_null rx289_debug, debug_321
    rx289_cur."!cursor_debug"("START", "metachar:sym<lwb>")
  debug_321:
    $I10 = self.'from'()
    ne $I10, -1, rxscan292_done
    goto rxscan292_scan
  rxscan292_loop:
    ($P10) = rx289_cur."from"()
    inc $P10
    set rx289_pos, $P10
    ge rx289_pos, rx289_eos, rxscan292_done
  rxscan292_scan:
    set_addr $I10, rxscan292_loop
    rx289_cur."!mark_push"(0, rx289_pos, $I10)
  rxscan292_done:
.annotate 'line', 98
  # rx subcapture "sym"
    set_addr $I10, rxcap_294_fail
    rx289_cur."!mark_push"(0, rx289_pos, $I10)
  alt293_0:
    set_addr $I10, alt293_1
    rx289_cur."!mark_push"(0, rx289_pos, $I10)
  # rx literal  "<<"
    add $I11, rx289_pos, 2
    gt $I11, rx289_eos, rx289_fail
    sub $I11, rx289_pos, rx289_off
    substr $S10, rx289_tgt, $I11, 2
    ne $S10, "<<", rx289_fail
    add rx289_pos, 2
    goto alt293_end
  alt293_1:
  # rx literal  unicode:"\x{ab}"
    add $I11, rx289_pos, 1
    gt $I11, rx289_eos, rx289_fail
    sub $I11, rx289_pos, rx289_off
    ord $I11, rx289_tgt, $I11
    ne $I11, 171, rx289_fail
    add rx289_pos, 1
  alt293_end:
    set_addr $I10, rxcap_294_fail
    ($I12, $I11) = rx289_cur."!mark_peek"($I10)
    rx289_cur."!cursor_pos"($I11)
    ($P10) = rx289_cur."!cursor_start"()
    $P10."!cursor_pass"(rx289_pos, "")
    rx289_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_294_done
  rxcap_294_fail:
    goto rx289_fail
  rxcap_294_done:
  # rx pass
    rx289_cur."!cursor_pass"(rx289_pos, "metachar:sym<lwb>")
    if_null rx289_debug, debug_322
    rx289_cur."!cursor_debug"("PASS", "metachar:sym<lwb>", " at pos=", rx289_pos)
  debug_322:
    .return (rx289_cur)
  rx289_restart:
.annotate 'line', 3
    if_null rx289_debug, debug_323
    rx289_cur."!cursor_debug"("NEXT", "metachar:sym<lwb>")
  debug_323:
  rx289_fail:
    (rx289_rep, rx289_pos, $I10, $P10) = rx289_cur."!mark_fail"(0)
    lt rx289_pos, -1, rx289_done
    eq rx289_pos, -1, rx289_fail
    jump $I10
  rx289_done:
    rx289_cur."!cursor_fail"()
    if_null rx289_debug, debug_324
    rx289_cur."!cursor_debug"("FAIL", "metachar:sym<lwb>")
  debug_324:
    .return (rx289_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<lwb>"  :subid("84_1297880735.27967") :method
.annotate 'line', 3
    new $P291, "ResizablePMCArray"
    push $P291, unicode:"\x{ab}"
    push $P291, "<<"
    .return ($P291)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<rwb>"  :subid("85_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx296_tgt
    .local int rx296_pos
    .local int rx296_off
    .local int rx296_eos
    .local int rx296_rep
    .local pmc rx296_cur
    .local pmc rx296_debug
    (rx296_cur, rx296_pos, rx296_tgt, $I10) = self."!cursor_start"()
    getattribute rx296_debug, rx296_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx296_cur
    .local pmc match
    .lex "$/", match
    length rx296_eos, rx296_tgt
    gt rx296_pos, rx296_eos, rx296_done
    set rx296_off, 0
    lt rx296_pos, 2, rx296_start
    sub rx296_off, rx296_pos, 1
    substr rx296_tgt, rx296_tgt, rx296_off
  rx296_start:
    eq $I10, 1, rx296_restart
    if_null rx296_debug, debug_325
    rx296_cur."!cursor_debug"("START", "metachar:sym<rwb>")
  debug_325:
    $I10 = self.'from'()
    ne $I10, -1, rxscan299_done
    goto rxscan299_scan
  rxscan299_loop:
    ($P10) = rx296_cur."from"()
    inc $P10
    set rx296_pos, $P10
    ge rx296_pos, rx296_eos, rxscan299_done
  rxscan299_scan:
    set_addr $I10, rxscan299_loop
    rx296_cur."!mark_push"(0, rx296_pos, $I10)
  rxscan299_done:
.annotate 'line', 99
  # rx subcapture "sym"
    set_addr $I10, rxcap_301_fail
    rx296_cur."!mark_push"(0, rx296_pos, $I10)
  alt300_0:
    set_addr $I10, alt300_1
    rx296_cur."!mark_push"(0, rx296_pos, $I10)
  # rx literal  ">>"
    add $I11, rx296_pos, 2
    gt $I11, rx296_eos, rx296_fail
    sub $I11, rx296_pos, rx296_off
    substr $S10, rx296_tgt, $I11, 2
    ne $S10, ">>", rx296_fail
    add rx296_pos, 2
    goto alt300_end
  alt300_1:
  # rx literal  unicode:"\x{bb}"
    add $I11, rx296_pos, 1
    gt $I11, rx296_eos, rx296_fail
    sub $I11, rx296_pos, rx296_off
    ord $I11, rx296_tgt, $I11
    ne $I11, 187, rx296_fail
    add rx296_pos, 1
  alt300_end:
    set_addr $I10, rxcap_301_fail
    ($I12, $I11) = rx296_cur."!mark_peek"($I10)
    rx296_cur."!cursor_pos"($I11)
    ($P10) = rx296_cur."!cursor_start"()
    $P10."!cursor_pass"(rx296_pos, "")
    rx296_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_301_done
  rxcap_301_fail:
    goto rx296_fail
  rxcap_301_done:
  # rx pass
    rx296_cur."!cursor_pass"(rx296_pos, "metachar:sym<rwb>")
    if_null rx296_debug, debug_326
    rx296_cur."!cursor_debug"("PASS", "metachar:sym<rwb>", " at pos=", rx296_pos)
  debug_326:
    .return (rx296_cur)
  rx296_restart:
.annotate 'line', 3
    if_null rx296_debug, debug_327
    rx296_cur."!cursor_debug"("NEXT", "metachar:sym<rwb>")
  debug_327:
  rx296_fail:
    (rx296_rep, rx296_pos, $I10, $P10) = rx296_cur."!mark_fail"(0)
    lt rx296_pos, -1, rx296_done
    eq rx296_pos, -1, rx296_fail
    jump $I10
  rx296_done:
    rx296_cur."!cursor_fail"()
    if_null rx296_debug, debug_328
    rx296_cur."!cursor_debug"("FAIL", "metachar:sym<rwb>")
  debug_328:
    .return (rx296_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<rwb>"  :subid("86_1297880735.27967") :method
.annotate 'line', 3
    new $P298, "ResizablePMCArray"
    push $P298, unicode:"\x{bb}"
    push $P298, ">>"
    .return ($P298)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<bs>"  :subid("87_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx303_tgt
    .local int rx303_pos
    .local int rx303_off
    .local int rx303_eos
    .local int rx303_rep
    .local pmc rx303_cur
    .local pmc rx303_debug
    (rx303_cur, rx303_pos, rx303_tgt, $I10) = self."!cursor_start"()
    getattribute rx303_debug, rx303_cur, "$!debug"
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
    if_null rx303_debug, debug_329
    rx303_cur."!cursor_debug"("START", "metachar:sym<bs>")
  debug_329:
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
.annotate 'line', 100
  # rx literal  "\\"
    add $I11, rx303_pos, 1
    gt $I11, rx303_eos, rx303_fail
    sub $I11, rx303_pos, rx303_off
    ord $I11, rx303_tgt, $I11
    ne $I11, 92, rx303_fail
    add rx303_pos, 1
  # rx subrule "backslash" subtype=capture negate=
    rx303_cur."!cursor_pos"(rx303_pos)
    $P10 = rx303_cur."backslash"()
    unless $P10, rx303_fail
    rx303_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backslash")
    rx303_pos = $P10."pos"()
  # rx pass
    rx303_cur."!cursor_pass"(rx303_pos, "metachar:sym<bs>")
    if_null rx303_debug, debug_330
    rx303_cur."!cursor_debug"("PASS", "metachar:sym<bs>", " at pos=", rx303_pos)
  debug_330:
    .return (rx303_cur)
  rx303_restart:
.annotate 'line', 3
    if_null rx303_debug, debug_331
    rx303_cur."!cursor_debug"("NEXT", "metachar:sym<bs>")
  debug_331:
  rx303_fail:
    (rx303_rep, rx303_pos, $I10, $P10) = rx303_cur."!mark_fail"(0)
    lt rx303_pos, -1, rx303_done
    eq rx303_pos, -1, rx303_fail
    jump $I10
  rx303_done:
    rx303_cur."!cursor_fail"()
    if_null rx303_debug, debug_332
    rx303_cur."!cursor_debug"("FAIL", "metachar:sym<bs>")
  debug_332:
    .return (rx303_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<bs>"  :subid("88_1297880735.27967") :method
.annotate 'line', 3
    $P305 = self."!PREFIX__!subrule"("backslash", "\\")
    new $P306, "ResizablePMCArray"
    push $P306, $P305
    .return ($P306)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<mod>"  :subid("89_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx309_tgt
    .local int rx309_pos
    .local int rx309_off
    .local int rx309_eos
    .local int rx309_rep
    .local pmc rx309_cur
    .local pmc rx309_debug
    (rx309_cur, rx309_pos, rx309_tgt, $I10) = self."!cursor_start"()
    getattribute rx309_debug, rx309_cur, "$!debug"
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
    if_null rx309_debug, debug_333
    rx309_cur."!cursor_debug"("START", "metachar:sym<mod>")
  debug_333:
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
.annotate 'line', 101
  # rx subrule "mod_internal" subtype=capture negate=
    rx309_cur."!cursor_pos"(rx309_pos)
    $P10 = rx309_cur."mod_internal"()
    unless $P10, rx309_fail
    rx309_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_internal")
    rx309_pos = $P10."pos"()
  # rx pass
    rx309_cur."!cursor_pass"(rx309_pos, "metachar:sym<mod>")
    if_null rx309_debug, debug_334
    rx309_cur."!cursor_debug"("PASS", "metachar:sym<mod>", " at pos=", rx309_pos)
  debug_334:
    .return (rx309_cur)
  rx309_restart:
.annotate 'line', 3
    if_null rx309_debug, debug_335
    rx309_cur."!cursor_debug"("NEXT", "metachar:sym<mod>")
  debug_335:
  rx309_fail:
    (rx309_rep, rx309_pos, $I10, $P10) = rx309_cur."!mark_fail"(0)
    lt rx309_pos, -1, rx309_done
    eq rx309_pos, -1, rx309_fail
    jump $I10
  rx309_done:
    rx309_cur."!cursor_fail"()
    if_null rx309_debug, debug_336
    rx309_cur."!cursor_debug"("FAIL", "metachar:sym<mod>")
  debug_336:
    .return (rx309_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<mod>"  :subid("90_1297880735.27967") :method
.annotate 'line', 3
    $P311 = self."!PREFIX__!subrule"("mod_internal", "")
    new $P312, "ResizablePMCArray"
    push $P312, $P311
    .return ($P312)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<quantifier>"  :subid("91_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx315_tgt
    .local int rx315_pos
    .local int rx315_off
    .local int rx315_eos
    .local int rx315_rep
    .local pmc rx315_cur
    .local pmc rx315_debug
    (rx315_cur, rx315_pos, rx315_tgt, $I10) = self."!cursor_start"()
    getattribute rx315_debug, rx315_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx315_cur
    .local pmc match
    .lex "$/", match
    length rx315_eos, rx315_tgt
    gt rx315_pos, rx315_eos, rx315_done
    set rx315_off, 0
    lt rx315_pos, 2, rx315_start
    sub rx315_off, rx315_pos, 1
    substr rx315_tgt, rx315_tgt, rx315_off
  rx315_start:
    eq $I10, 1, rx315_restart
    if_null rx315_debug, debug_337
    rx315_cur."!cursor_debug"("START", "metachar:sym<quantifier>")
  debug_337:
    $I10 = self.'from'()
    ne $I10, -1, rxscan319_done
    goto rxscan319_scan
  rxscan319_loop:
    ($P10) = rx315_cur."from"()
    inc $P10
    set rx315_pos, $P10
    ge rx315_pos, rx315_eos, rxscan319_done
  rxscan319_scan:
    set_addr $I10, rxscan319_loop
    rx315_cur."!mark_push"(0, rx315_pos, $I10)
  rxscan319_done:
.annotate 'line', 103
  # rx subrule "quantifier" subtype=capture negate=
    rx315_cur."!cursor_pos"(rx315_pos)
    $P10 = rx315_cur."quantifier"()
    unless $P10, rx315_fail
    rx315_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantifier")
    rx315_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx315_cur."!cursor_pos"(rx315_pos)
    $P10 = rx315_cur."panic"("Quantifier quantifies nothing")
    unless $P10, rx315_fail
    rx315_pos = $P10."pos"()
.annotate 'line', 102
  # rx pass
    rx315_cur."!cursor_pass"(rx315_pos, "metachar:sym<quantifier>")
    if_null rx315_debug, debug_338
    rx315_cur."!cursor_debug"("PASS", "metachar:sym<quantifier>", " at pos=", rx315_pos)
  debug_338:
    .return (rx315_cur)
  rx315_restart:
.annotate 'line', 3
    if_null rx315_debug, debug_339
    rx315_cur."!cursor_debug"("NEXT", "metachar:sym<quantifier>")
  debug_339:
  rx315_fail:
    (rx315_rep, rx315_pos, $I10, $P10) = rx315_cur."!mark_fail"(0)
    lt rx315_pos, -1, rx315_done
    eq rx315_pos, -1, rx315_fail
    jump $I10
  rx315_done:
    rx315_cur."!cursor_fail"()
    if_null rx315_debug, debug_340
    rx315_cur."!cursor_debug"("FAIL", "metachar:sym<quantifier>")
  debug_340:
    .return (rx315_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<quantifier>"  :subid("92_1297880735.27967") :method
.annotate 'line', 3
    $P317 = self."!PREFIX__!subrule"("quantifier", "")
    new $P318, "ResizablePMCArray"
    push $P318, $P317
    .return ($P318)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<~>"  :subid("93_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx321_tgt
    .local int rx321_pos
    .local int rx321_off
    .local int rx321_eos
    .local int rx321_rep
    .local pmc rx321_cur
    .local pmc rx321_debug
    (rx321_cur, rx321_pos, rx321_tgt, $I10) = self."!cursor_start"()
    getattribute rx321_debug, rx321_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx321_cur
    .local pmc match
    .lex "$/", match
    length rx321_eos, rx321_tgt
    gt rx321_pos, rx321_eos, rx321_done
    set rx321_off, 0
    lt rx321_pos, 2, rx321_start
    sub rx321_off, rx321_pos, 1
    substr rx321_tgt, rx321_tgt, rx321_off
  rx321_start:
    eq $I10, 1, rx321_restart
    if_null rx321_debug, debug_341
    rx321_cur."!cursor_debug"("START", "metachar:sym<~>")
  debug_341:
    $I10 = self.'from'()
    ne $I10, -1, rxscan325_done
    goto rxscan325_scan
  rxscan325_loop:
    ($P10) = rx321_cur."from"()
    inc $P10
    set rx321_pos, $P10
    ge rx321_pos, rx321_eos, rxscan325_done
  rxscan325_scan:
    set_addr $I10, rxscan325_loop
    rx321_cur."!mark_push"(0, rx321_pos, $I10)
  rxscan325_done:
.annotate 'line', 108
  # rx subcapture "sym"
    set_addr $I10, rxcap_326_fail
    rx321_cur."!mark_push"(0, rx321_pos, $I10)
  # rx literal  "~"
    add $I11, rx321_pos, 1
    gt $I11, rx321_eos, rx321_fail
    sub $I11, rx321_pos, rx321_off
    ord $I11, rx321_tgt, $I11
    ne $I11, 126, rx321_fail
    add rx321_pos, 1
    set_addr $I10, rxcap_326_fail
    ($I12, $I11) = rx321_cur."!mark_peek"($I10)
    rx321_cur."!cursor_pos"($I11)
    ($P10) = rx321_cur."!cursor_start"()
    $P10."!cursor_pass"(rx321_pos, "")
    rx321_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_326_done
  rxcap_326_fail:
    goto rx321_fail
  rxcap_326_done:
.annotate 'line', 109
  # rx subrule "ws" subtype=method negate=
    rx321_cur."!cursor_pos"(rx321_pos)
    $P10 = rx321_cur."ws"()
    unless $P10, rx321_fail
    rx321_pos = $P10."pos"()
  # rx subrule "quantified_atom" subtype=capture negate=
    rx321_cur."!cursor_pos"(rx321_pos)
    $P10 = rx321_cur."quantified_atom"()
    unless $P10, rx321_fail
    rx321_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("GOAL")
    rx321_pos = $P10."pos"()
.annotate 'line', 110
  # rx subrule "ws" subtype=method negate=
    rx321_cur."!cursor_pos"(rx321_pos)
    $P10 = rx321_cur."ws"()
    unless $P10, rx321_fail
    rx321_pos = $P10."pos"()
  # rx subrule "quantified_atom" subtype=capture negate=
    rx321_cur."!cursor_pos"(rx321_pos)
    $P10 = rx321_cur."quantified_atom"()
    unless $P10, rx321_fail
    rx321_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx321_pos = $P10."pos"()
.annotate 'line', 107
  # rx pass
    rx321_cur."!cursor_pass"(rx321_pos, "metachar:sym<~>")
    if_null rx321_debug, debug_342
    rx321_cur."!cursor_debug"("PASS", "metachar:sym<~>", " at pos=", rx321_pos)
  debug_342:
    .return (rx321_cur)
  rx321_restart:
.annotate 'line', 3
    if_null rx321_debug, debug_343
    rx321_cur."!cursor_debug"("NEXT", "metachar:sym<~>")
  debug_343:
  rx321_fail:
    (rx321_rep, rx321_pos, $I10, $P10) = rx321_cur."!mark_fail"(0)
    lt rx321_pos, -1, rx321_done
    eq rx321_pos, -1, rx321_fail
    jump $I10
  rx321_done:
    rx321_cur."!cursor_fail"()
    if_null rx321_debug, debug_344
    rx321_cur."!cursor_debug"("FAIL", "metachar:sym<~>")
  debug_344:
    .return (rx321_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<~>"  :subid("94_1297880735.27967") :method
.annotate 'line', 3
    $P323 = self."!PREFIX__!subrule"("ws", "~")
    new $P324, "ResizablePMCArray"
    push $P324, $P323
    .return ($P324)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<{*}>"  :subid("95_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx328_tgt
    .local int rx328_pos
    .local int rx328_off
    .local int rx328_eos
    .local int rx328_rep
    .local pmc rx328_cur
    .local pmc rx328_debug
    (rx328_cur, rx328_pos, rx328_tgt, $I10) = self."!cursor_start"()
    rx328_cur."!cursor_caparray"("key")
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
    if_null rx328_debug, debug_345
    rx328_cur."!cursor_debug"("START", "metachar:sym<{*}>")
  debug_345:
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
.annotate 'line', 114
  # rx subcapture "sym"
    set_addr $I10, rxcap_332_fail
    rx328_cur."!mark_push"(0, rx328_pos, $I10)
  # rx literal  "{*}"
    add $I11, rx328_pos, 3
    gt $I11, rx328_eos, rx328_fail
    sub $I11, rx328_pos, rx328_off
    substr $S10, rx328_tgt, $I11, 3
    ne $S10, "{*}", rx328_fail
    add rx328_pos, 3
    set_addr $I10, rxcap_332_fail
    ($I12, $I11) = rx328_cur."!mark_peek"($I10)
    rx328_cur."!cursor_pos"($I11)
    ($P10) = rx328_cur."!cursor_start"()
    $P10."!cursor_pass"(rx328_pos, "")
    rx328_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_332_done
  rxcap_332_fail:
    goto rx328_fail
  rxcap_332_done:
.annotate 'line', 115
  # rx rxquantr333 ** 0..1
    set_addr $I10, rxquantr333_done
    rx328_cur."!mark_push"(0, rx328_pos, $I10)
  rxquantr333_loop:
  # rx enumcharlist_q negate=0  r 0..-1
    sub $I10, rx328_pos, rx328_off
    set rx328_rep, 0
    sub $I12, rx328_eos, rx328_pos
  rxenumcharlistq334_loop:
    le $I12, 0, rxenumcharlistq334_done
    substr $S10, rx328_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq334_done
    inc rx328_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq334_loop
  rxenumcharlistq334_done:
    add rx328_pos, rx328_pos, rx328_rep
  # rx literal  "#= "
    add $I11, rx328_pos, 3
    gt $I11, rx328_eos, rx328_fail
    sub $I11, rx328_pos, rx328_off
    substr $S10, rx328_tgt, $I11, 3
    ne $S10, "#= ", rx328_fail
    add rx328_pos, 3
  # rx enumcharlist_q negate=0  r 0..-1
    sub $I10, rx328_pos, rx328_off
    set rx328_rep, 0
    sub $I12, rx328_eos, rx328_pos
  rxenumcharlistq335_loop:
    le $I12, 0, rxenumcharlistq335_done
    substr $S10, rx328_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq335_done
    inc rx328_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq335_loop
  rxenumcharlistq335_done:
    add rx328_pos, rx328_pos, rx328_rep
  # rx subcapture "key"
    set_addr $I10, rxcap_338_fail
    rx328_cur."!mark_push"(0, rx328_pos, $I10)
  # rx charclass_q S r 1..-1
    sub $I10, rx328_pos, rx328_off
    find_cclass $I11, 32, rx328_tgt, $I10, rx328_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx328_fail
    add rx328_pos, rx328_off, $I11
  # rx rxquantr336 ** 0..*
    set_addr $I10, rxquantr336_done
    rx328_cur."!mark_push"(0, rx328_pos, $I10)
  rxquantr336_loop:
  # rx enumcharlist_q negate=0  r 1..-1
    sub $I10, rx328_pos, rx328_off
    set rx328_rep, 0
    sub $I12, rx328_eos, rx328_pos
  rxenumcharlistq337_loop:
    le $I12, 0, rxenumcharlistq337_done
    substr $S10, rx328_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq337_done
    inc rx328_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq337_loop
  rxenumcharlistq337_done:
    lt rx328_rep, 1, rx328_fail
    add rx328_pos, rx328_pos, rx328_rep
  # rx charclass_q S r 1..-1
    sub $I10, rx328_pos, rx328_off
    find_cclass $I11, 32, rx328_tgt, $I10, rx328_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx328_fail
    add rx328_pos, rx328_off, $I11
    set_addr $I10, rxquantr336_done
    (rx328_rep) = rx328_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr336_done
    rx328_cur."!mark_push"(rx328_rep, rx328_pos, $I10)
    goto rxquantr336_loop
  rxquantr336_done:
    set_addr $I10, rxcap_338_fail
    ($I12, $I11) = rx328_cur."!mark_peek"($I10)
    rx328_cur."!cursor_pos"($I11)
    ($P10) = rx328_cur."!cursor_start"()
    $P10."!cursor_pass"(rx328_pos, "")
    rx328_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("key")
    goto rxcap_338_done
  rxcap_338_fail:
    goto rx328_fail
  rxcap_338_done:
    set_addr $I10, rxquantr333_done
    (rx328_rep) = rx328_cur."!mark_commit"($I10)
  rxquantr333_done:
.annotate 'line', 113
  # rx pass
    rx328_cur."!cursor_pass"(rx328_pos, "metachar:sym<{*}>")
    if_null rx328_debug, debug_346
    rx328_cur."!cursor_debug"("PASS", "metachar:sym<{*}>", " at pos=", rx328_pos)
  debug_346:
    .return (rx328_cur)
  rx328_restart:
.annotate 'line', 3
    if_null rx328_debug, debug_347
    rx328_cur."!cursor_debug"("NEXT", "metachar:sym<{*}>")
  debug_347:
  rx328_fail:
    (rx328_rep, rx328_pos, $I10, $P10) = rx328_cur."!mark_fail"(0)
    lt rx328_pos, -1, rx328_done
    eq rx328_pos, -1, rx328_fail
    jump $I10
  rx328_done:
    rx328_cur."!cursor_fail"()
    if_null rx328_debug, debug_348
    rx328_cur."!cursor_debug"("FAIL", "metachar:sym<{*}>")
  debug_348:
    .return (rx328_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<{*}>"  :subid("96_1297880735.27967") :method
.annotate 'line', 3
    new $P330, "ResizablePMCArray"
    push $P330, "{*}"
    .return ($P330)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<assert>"  :subid("97_1297880735.27967") :method :outer("11_1297880735.27967")
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
    if_null rx340_debug, debug_349
    rx340_cur."!cursor_debug"("START", "metachar:sym<assert>")
  debug_349:
    $I10 = self.'from'()
    ne $I10, -1, rxscan344_done
    goto rxscan344_scan
  rxscan344_loop:
    ($P10) = rx340_cur."from"()
    inc $P10
    set rx340_pos, $P10
    ge rx340_pos, rx340_eos, rxscan344_done
  rxscan344_scan:
    set_addr $I10, rxscan344_loop
    rx340_cur."!mark_push"(0, rx340_pos, $I10)
  rxscan344_done:
.annotate 'line', 118
  # rx literal  "<"
    add $I11, rx340_pos, 1
    gt $I11, rx340_eos, rx340_fail
    sub $I11, rx340_pos, rx340_off
    ord $I11, rx340_tgt, $I11
    ne $I11, 60, rx340_fail
    add rx340_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx340_cur."!cursor_pos"(rx340_pos)
    $P10 = rx340_cur."assertion"()
    unless $P10, rx340_fail
    rx340_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx340_pos = $P10."pos"()
  alt345_0:
.annotate 'line', 119
    set_addr $I10, alt345_1
    rx340_cur."!mark_push"(0, rx340_pos, $I10)
  # rx literal  ">"
    add $I11, rx340_pos, 1
    gt $I11, rx340_eos, rx340_fail
    sub $I11, rx340_pos, rx340_off
    ord $I11, rx340_tgt, $I11
    ne $I11, 62, rx340_fail
    add rx340_pos, 1
    goto alt345_end
  alt345_1:
  # rx subrule "panic" subtype=method negate=
    rx340_cur."!cursor_pos"(rx340_pos)
    $P10 = rx340_cur."panic"("regex assertion not terminated by angle bracket")
    unless $P10, rx340_fail
    rx340_pos = $P10."pos"()
  alt345_end:
.annotate 'line', 117
  # rx pass
    rx340_cur."!cursor_pass"(rx340_pos, "metachar:sym<assert>")
    if_null rx340_debug, debug_350
    rx340_cur."!cursor_debug"("PASS", "metachar:sym<assert>", " at pos=", rx340_pos)
  debug_350:
    .return (rx340_cur)
  rx340_restart:
.annotate 'line', 3
    if_null rx340_debug, debug_351
    rx340_cur."!cursor_debug"("NEXT", "metachar:sym<assert>")
  debug_351:
  rx340_fail:
    (rx340_rep, rx340_pos, $I10, $P10) = rx340_cur."!mark_fail"(0)
    lt rx340_pos, -1, rx340_done
    eq rx340_pos, -1, rx340_fail
    jump $I10
  rx340_done:
    rx340_cur."!cursor_fail"()
    if_null rx340_debug, debug_352
    rx340_cur."!cursor_debug"("FAIL", "metachar:sym<assert>")
  debug_352:
    .return (rx340_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<assert>"  :subid("98_1297880735.27967") :method
.annotate 'line', 3
    $P342 = self."!PREFIX__!subrule"("assertion", "<")
    new $P343, "ResizablePMCArray"
    push $P343, $P342
    .return ($P343)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<var>"  :subid("99_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx347_tgt
    .local int rx347_pos
    .local int rx347_off
    .local int rx347_eos
    .local int rx347_rep
    .local pmc rx347_cur
    .local pmc rx347_debug
    (rx347_cur, rx347_pos, rx347_tgt, $I10) = self."!cursor_start"()
    rx347_cur."!cursor_caparray"("quantified_atom")
    getattribute rx347_debug, rx347_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx347_cur
    .local pmc match
    .lex "$/", match
    length rx347_eos, rx347_tgt
    gt rx347_pos, rx347_eos, rx347_done
    set rx347_off, 0
    lt rx347_pos, 2, rx347_start
    sub rx347_off, rx347_pos, 1
    substr rx347_tgt, rx347_tgt, rx347_off
  rx347_start:
    eq $I10, 1, rx347_restart
    if_null rx347_debug, debug_353
    rx347_cur."!cursor_debug"("START", "metachar:sym<var>")
  debug_353:
    $I10 = self.'from'()
    ne $I10, -1, rxscan350_done
    goto rxscan350_scan
  rxscan350_loop:
    ($P10) = rx347_cur."from"()
    inc $P10
    set rx347_pos, $P10
    ge rx347_pos, rx347_eos, rxscan350_done
  rxscan350_scan:
    set_addr $I10, rxscan350_loop
    rx347_cur."!mark_push"(0, rx347_pos, $I10)
  rxscan350_done:
  alt351_0:
.annotate 'line', 123
    set_addr $I10, alt351_1
    rx347_cur."!mark_push"(0, rx347_pos, $I10)
.annotate 'line', 124
  # rx literal  "$<"
    add $I11, rx347_pos, 2
    gt $I11, rx347_eos, rx347_fail
    sub $I11, rx347_pos, rx347_off
    substr $S10, rx347_tgt, $I11, 2
    ne $S10, "$<", rx347_fail
    add rx347_pos, 2
  # rx subcapture "name"
    set_addr $I10, rxcap_353_fail
    rx347_cur."!mark_push"(0, rx347_pos, $I10)
  # rx enumcharlist_q negate=1  r 1..-1
    sub $I10, rx347_pos, rx347_off
    set rx347_rep, 0
    sub $I12, rx347_eos, rx347_pos
  rxenumcharlistq352_loop:
    le $I12, 0, rxenumcharlistq352_done
    substr $S10, rx347_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rxenumcharlistq352_done
    inc rx347_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq352_loop
  rxenumcharlistq352_done:
    lt rx347_rep, 1, rx347_fail
    add rx347_pos, rx347_pos, rx347_rep
    set_addr $I10, rxcap_353_fail
    ($I12, $I11) = rx347_cur."!mark_peek"($I10)
    rx347_cur."!cursor_pos"($I11)
    ($P10) = rx347_cur."!cursor_start"()
    $P10."!cursor_pass"(rx347_pos, "")
    rx347_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_353_done
  rxcap_353_fail:
    goto rx347_fail
  rxcap_353_done:
  # rx literal  ">"
    add $I11, rx347_pos, 1
    gt $I11, rx347_eos, rx347_fail
    sub $I11, rx347_pos, rx347_off
    ord $I11, rx347_tgt, $I11
    ne $I11, 62, rx347_fail
    add rx347_pos, 1
    goto alt351_end
  alt351_1:
.annotate 'line', 125
  # rx literal  "$"
    add $I11, rx347_pos, 1
    gt $I11, rx347_eos, rx347_fail
    sub $I11, rx347_pos, rx347_off
    ord $I11, rx347_tgt, $I11
    ne $I11, 36, rx347_fail
    add rx347_pos, 1
  # rx subcapture "pos"
    set_addr $I10, rxcap_354_fail
    rx347_cur."!mark_push"(0, rx347_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx347_pos, rx347_off
    find_not_cclass $I11, 8, rx347_tgt, $I10, rx347_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx347_fail
    add rx347_pos, rx347_off, $I11
    set_addr $I10, rxcap_354_fail
    ($I12, $I11) = rx347_cur."!mark_peek"($I10)
    rx347_cur."!cursor_pos"($I11)
    ($P10) = rx347_cur."!cursor_start"()
    $P10."!cursor_pass"(rx347_pos, "")
    rx347_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pos")
    goto rxcap_354_done
  rxcap_354_fail:
    goto rx347_fail
  rxcap_354_done:
  alt351_end:
.annotate 'line', 128
  # rx rxquantr355 ** 0..1
    set_addr $I10, rxquantr355_done
    rx347_cur."!mark_push"(0, rx347_pos, $I10)
  rxquantr355_loop:
  # rx subrule "ws" subtype=method negate=
    rx347_cur."!cursor_pos"(rx347_pos)
    $P10 = rx347_cur."ws"()
    unless $P10, rx347_fail
    rx347_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx347_pos, 1
    gt $I11, rx347_eos, rx347_fail
    sub $I11, rx347_pos, rx347_off
    ord $I11, rx347_tgt, $I11
    ne $I11, 61, rx347_fail
    add rx347_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx347_cur."!cursor_pos"(rx347_pos)
    $P10 = rx347_cur."ws"()
    unless $P10, rx347_fail
    rx347_pos = $P10."pos"()
  # rx subrule "quantified_atom" subtype=capture negate=
    rx347_cur."!cursor_pos"(rx347_pos)
    $P10 = rx347_cur."quantified_atom"()
    unless $P10, rx347_fail
    rx347_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantified_atom")
    rx347_pos = $P10."pos"()
    set_addr $I10, rxquantr355_done
    (rx347_rep) = rx347_cur."!mark_commit"($I10)
  rxquantr355_done:
.annotate 'line', 122
  # rx pass
    rx347_cur."!cursor_pass"(rx347_pos, "metachar:sym<var>")
    if_null rx347_debug, debug_354
    rx347_cur."!cursor_debug"("PASS", "metachar:sym<var>", " at pos=", rx347_pos)
  debug_354:
    .return (rx347_cur)
  rx347_restart:
.annotate 'line', 3
    if_null rx347_debug, debug_355
    rx347_cur."!cursor_debug"("NEXT", "metachar:sym<var>")
  debug_355:
  rx347_fail:
    (rx347_rep, rx347_pos, $I10, $P10) = rx347_cur."!mark_fail"(0)
    lt rx347_pos, -1, rx347_done
    eq rx347_pos, -1, rx347_fail
    jump $I10
  rx347_done:
    rx347_cur."!cursor_fail"()
    if_null rx347_debug, debug_356
    rx347_cur."!cursor_debug"("FAIL", "metachar:sym<var>")
  debug_356:
    .return (rx347_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<var>"  :subid("100_1297880735.27967") :method
.annotate 'line', 3
    new $P349, "ResizablePMCArray"
    push $P349, "$"
    push $P349, "$<"
    .return ($P349)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<PIR>"  :subid("101_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx357_tgt
    .local int rx357_pos
    .local int rx357_off
    .local int rx357_eos
    .local int rx357_rep
    .local pmc rx357_cur
    .local pmc rx357_debug
    (rx357_cur, rx357_pos, rx357_tgt, $I10) = self."!cursor_start"()
    getattribute rx357_debug, rx357_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx357_cur
    .local pmc match
    .lex "$/", match
    length rx357_eos, rx357_tgt
    gt rx357_pos, rx357_eos, rx357_done
    set rx357_off, 0
    lt rx357_pos, 2, rx357_start
    sub rx357_off, rx357_pos, 1
    substr rx357_tgt, rx357_tgt, rx357_off
  rx357_start:
    eq $I10, 1, rx357_restart
    if_null rx357_debug, debug_357
    rx357_cur."!cursor_debug"("START", "metachar:sym<PIR>")
  debug_357:
    $I10 = self.'from'()
    ne $I10, -1, rxscan360_done
    goto rxscan360_scan
  rxscan360_loop:
    ($P10) = rx357_cur."from"()
    inc $P10
    set rx357_pos, $P10
    ge rx357_pos, rx357_eos, rxscan360_done
  rxscan360_scan:
    set_addr $I10, rxscan360_loop
    rx357_cur."!mark_push"(0, rx357_pos, $I10)
  rxscan360_done:
.annotate 'line', 132
  # rx literal  ":PIR{{"
    add $I11, rx357_pos, 6
    gt $I11, rx357_eos, rx357_fail
    sub $I11, rx357_pos, rx357_off
    substr $S10, rx357_tgt, $I11, 6
    ne $S10, ":PIR{{", rx357_fail
    add rx357_pos, 6
  # rx subcapture "pir"
    set_addr $I10, rxcap_363_fail
    rx357_cur."!mark_push"(0, rx357_pos, $I10)
  # rx rxquantf361 ** 0..*
    set_addr $I10, rxquantf361_loop
    rx357_cur."!mark_push"(0, rx357_pos, $I10)
    goto rxquantf361_done
  rxquantf361_loop:
  # rx charclass .
    ge rx357_pos, rx357_eos, rx357_fail
    inc rx357_pos
    set_addr $I10, rxquantf361_loop
    rx357_cur."!mark_push"(rx357_rep, rx357_pos, $I10)
  rxquantf361_done:
    set_addr $I10, rxcap_363_fail
    ($I12, $I11) = rx357_cur."!mark_peek"($I10)
    rx357_cur."!cursor_pos"($I11)
    ($P10) = rx357_cur."!cursor_start"()
    $P10."!cursor_pass"(rx357_pos, "")
    rx357_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pir")
    goto rxcap_363_done
  rxcap_363_fail:
    goto rx357_fail
  rxcap_363_done:
  # rx literal  "}}"
    add $I11, rx357_pos, 2
    gt $I11, rx357_eos, rx357_fail
    sub $I11, rx357_pos, rx357_off
    substr $S10, rx357_tgt, $I11, 2
    ne $S10, "}}", rx357_fail
    add rx357_pos, 2
.annotate 'line', 131
  # rx pass
    rx357_cur."!cursor_pass"(rx357_pos, "metachar:sym<PIR>")
    if_null rx357_debug, debug_358
    rx357_cur."!cursor_debug"("PASS", "metachar:sym<PIR>", " at pos=", rx357_pos)
  debug_358:
    .return (rx357_cur)
  rx357_restart:
.annotate 'line', 3
    if_null rx357_debug, debug_359
    rx357_cur."!cursor_debug"("NEXT", "metachar:sym<PIR>")
  debug_359:
  rx357_fail:
    (rx357_rep, rx357_pos, $I10, $P10) = rx357_cur."!mark_fail"(0)
    lt rx357_pos, -1, rx357_done
    eq rx357_pos, -1, rx357_fail
    jump $I10
  rx357_done:
    rx357_cur."!cursor_fail"()
    if_null rx357_debug, debug_360
    rx357_cur."!cursor_debug"("FAIL", "metachar:sym<PIR>")
  debug_360:
    .return (rx357_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<PIR>"  :subid("102_1297880735.27967") :method
.annotate 'line', 3
    new $P359, "ResizablePMCArray"
    push $P359, ":PIR{{"
    .return ($P359)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash"  :subid("103_1297880735.27967") :method
.annotate 'line', 135
    $P365 = self."!protoregex"("backslash")
    .return ($P365)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash"  :subid("104_1297880735.27967") :method
.annotate 'line', 135
    $P367 = self."!PREFIX__!protoregex"("backslash")
    .return ($P367)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<w>"  :subid("105_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx369_tgt
    .local int rx369_pos
    .local int rx369_off
    .local int rx369_eos
    .local int rx369_rep
    .local pmc rx369_cur
    .local pmc rx369_debug
    (rx369_cur, rx369_pos, rx369_tgt, $I10) = self."!cursor_start"()
    getattribute rx369_debug, rx369_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx369_cur
    .local pmc match
    .lex "$/", match
    length rx369_eos, rx369_tgt
    gt rx369_pos, rx369_eos, rx369_done
    set rx369_off, 0
    lt rx369_pos, 2, rx369_start
    sub rx369_off, rx369_pos, 1
    substr rx369_tgt, rx369_tgt, rx369_off
  rx369_start:
    eq $I10, 1, rx369_restart
    if_null rx369_debug, debug_361
    rx369_cur."!cursor_debug"("START", "backslash:sym<w>")
  debug_361:
    $I10 = self.'from'()
    ne $I10, -1, rxscan372_done
    goto rxscan372_scan
  rxscan372_loop:
    ($P10) = rx369_cur."from"()
    inc $P10
    set rx369_pos, $P10
    ge rx369_pos, rx369_eos, rxscan372_done
  rxscan372_scan:
    set_addr $I10, rxscan372_loop
    rx369_cur."!mark_push"(0, rx369_pos, $I10)
  rxscan372_done:
.annotate 'line', 136
  # rx subcapture "sym"
    set_addr $I10, rxcap_373_fail
    rx369_cur."!mark_push"(0, rx369_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx369_pos, rx369_eos, rx369_fail
    sub $I10, rx369_pos, rx369_off
    substr $S10, rx369_tgt, $I10, 1
    index $I11, "dswnDSWN", $S10
    lt $I11, 0, rx369_fail
    inc rx369_pos
    set_addr $I10, rxcap_373_fail
    ($I12, $I11) = rx369_cur."!mark_peek"($I10)
    rx369_cur."!cursor_pos"($I11)
    ($P10) = rx369_cur."!cursor_start"()
    $P10."!cursor_pass"(rx369_pos, "")
    rx369_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_373_done
  rxcap_373_fail:
    goto rx369_fail
  rxcap_373_done:
  # rx pass
    rx369_cur."!cursor_pass"(rx369_pos, "backslash:sym<w>")
    if_null rx369_debug, debug_362
    rx369_cur."!cursor_debug"("PASS", "backslash:sym<w>", " at pos=", rx369_pos)
  debug_362:
    .return (rx369_cur)
  rx369_restart:
.annotate 'line', 3
    if_null rx369_debug, debug_363
    rx369_cur."!cursor_debug"("NEXT", "backslash:sym<w>")
  debug_363:
  rx369_fail:
    (rx369_rep, rx369_pos, $I10, $P10) = rx369_cur."!mark_fail"(0)
    lt rx369_pos, -1, rx369_done
    eq rx369_pos, -1, rx369_fail
    jump $I10
  rx369_done:
    rx369_cur."!cursor_fail"()
    if_null rx369_debug, debug_364
    rx369_cur."!cursor_debug"("FAIL", "backslash:sym<w>")
  debug_364:
    .return (rx369_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<w>"  :subid("106_1297880735.27967") :method
.annotate 'line', 3
    new $P371, "ResizablePMCArray"
    push $P371, "N"
    push $P371, "W"
    push $P371, "S"
    push $P371, "D"
    push $P371, "n"
    push $P371, "w"
    push $P371, "s"
    push $P371, "d"
    .return ($P371)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<b>"  :subid("107_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx375_tgt
    .local int rx375_pos
    .local int rx375_off
    .local int rx375_eos
    .local int rx375_rep
    .local pmc rx375_cur
    .local pmc rx375_debug
    (rx375_cur, rx375_pos, rx375_tgt, $I10) = self."!cursor_start"()
    getattribute rx375_debug, rx375_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx375_cur
    .local pmc match
    .lex "$/", match
    length rx375_eos, rx375_tgt
    gt rx375_pos, rx375_eos, rx375_done
    set rx375_off, 0
    lt rx375_pos, 2, rx375_start
    sub rx375_off, rx375_pos, 1
    substr rx375_tgt, rx375_tgt, rx375_off
  rx375_start:
    eq $I10, 1, rx375_restart
    if_null rx375_debug, debug_365
    rx375_cur."!cursor_debug"("START", "backslash:sym<b>")
  debug_365:
    $I10 = self.'from'()
    ne $I10, -1, rxscan378_done
    goto rxscan378_scan
  rxscan378_loop:
    ($P10) = rx375_cur."from"()
    inc $P10
    set rx375_pos, $P10
    ge rx375_pos, rx375_eos, rxscan378_done
  rxscan378_scan:
    set_addr $I10, rxscan378_loop
    rx375_cur."!mark_push"(0, rx375_pos, $I10)
  rxscan378_done:
.annotate 'line', 137
  # rx subcapture "sym"
    set_addr $I10, rxcap_379_fail
    rx375_cur."!mark_push"(0, rx375_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx375_pos, rx375_eos, rx375_fail
    sub $I10, rx375_pos, rx375_off
    substr $S10, rx375_tgt, $I10, 1
    index $I11, "bB", $S10
    lt $I11, 0, rx375_fail
    inc rx375_pos
    set_addr $I10, rxcap_379_fail
    ($I12, $I11) = rx375_cur."!mark_peek"($I10)
    rx375_cur."!cursor_pos"($I11)
    ($P10) = rx375_cur."!cursor_start"()
    $P10."!cursor_pass"(rx375_pos, "")
    rx375_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_379_done
  rxcap_379_fail:
    goto rx375_fail
  rxcap_379_done:
  # rx pass
    rx375_cur."!cursor_pass"(rx375_pos, "backslash:sym<b>")
    if_null rx375_debug, debug_366
    rx375_cur."!cursor_debug"("PASS", "backslash:sym<b>", " at pos=", rx375_pos)
  debug_366:
    .return (rx375_cur)
  rx375_restart:
.annotate 'line', 3
    if_null rx375_debug, debug_367
    rx375_cur."!cursor_debug"("NEXT", "backslash:sym<b>")
  debug_367:
  rx375_fail:
    (rx375_rep, rx375_pos, $I10, $P10) = rx375_cur."!mark_fail"(0)
    lt rx375_pos, -1, rx375_done
    eq rx375_pos, -1, rx375_fail
    jump $I10
  rx375_done:
    rx375_cur."!cursor_fail"()
    if_null rx375_debug, debug_368
    rx375_cur."!cursor_debug"("FAIL", "backslash:sym<b>")
  debug_368:
    .return (rx375_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<b>"  :subid("108_1297880735.27967") :method
.annotate 'line', 3
    new $P377, "ResizablePMCArray"
    push $P377, "B"
    push $P377, "b"
    .return ($P377)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<e>"  :subid("109_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx381_tgt
    .local int rx381_pos
    .local int rx381_off
    .local int rx381_eos
    .local int rx381_rep
    .local pmc rx381_cur
    .local pmc rx381_debug
    (rx381_cur, rx381_pos, rx381_tgt, $I10) = self."!cursor_start"()
    getattribute rx381_debug, rx381_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx381_cur
    .local pmc match
    .lex "$/", match
    length rx381_eos, rx381_tgt
    gt rx381_pos, rx381_eos, rx381_done
    set rx381_off, 0
    lt rx381_pos, 2, rx381_start
    sub rx381_off, rx381_pos, 1
    substr rx381_tgt, rx381_tgt, rx381_off
  rx381_start:
    eq $I10, 1, rx381_restart
    if_null rx381_debug, debug_369
    rx381_cur."!cursor_debug"("START", "backslash:sym<e>")
  debug_369:
    $I10 = self.'from'()
    ne $I10, -1, rxscan384_done
    goto rxscan384_scan
  rxscan384_loop:
    ($P10) = rx381_cur."from"()
    inc $P10
    set rx381_pos, $P10
    ge rx381_pos, rx381_eos, rxscan384_done
  rxscan384_scan:
    set_addr $I10, rxscan384_loop
    rx381_cur."!mark_push"(0, rx381_pos, $I10)
  rxscan384_done:
.annotate 'line', 138
  # rx subcapture "sym"
    set_addr $I10, rxcap_385_fail
    rx381_cur."!mark_push"(0, rx381_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx381_pos, rx381_eos, rx381_fail
    sub $I10, rx381_pos, rx381_off
    substr $S10, rx381_tgt, $I10, 1
    index $I11, "eE", $S10
    lt $I11, 0, rx381_fail
    inc rx381_pos
    set_addr $I10, rxcap_385_fail
    ($I12, $I11) = rx381_cur."!mark_peek"($I10)
    rx381_cur."!cursor_pos"($I11)
    ($P10) = rx381_cur."!cursor_start"()
    $P10."!cursor_pass"(rx381_pos, "")
    rx381_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_385_done
  rxcap_385_fail:
    goto rx381_fail
  rxcap_385_done:
  # rx pass
    rx381_cur."!cursor_pass"(rx381_pos, "backslash:sym<e>")
    if_null rx381_debug, debug_370
    rx381_cur."!cursor_debug"("PASS", "backslash:sym<e>", " at pos=", rx381_pos)
  debug_370:
    .return (rx381_cur)
  rx381_restart:
.annotate 'line', 3
    if_null rx381_debug, debug_371
    rx381_cur."!cursor_debug"("NEXT", "backslash:sym<e>")
  debug_371:
  rx381_fail:
    (rx381_rep, rx381_pos, $I10, $P10) = rx381_cur."!mark_fail"(0)
    lt rx381_pos, -1, rx381_done
    eq rx381_pos, -1, rx381_fail
    jump $I10
  rx381_done:
    rx381_cur."!cursor_fail"()
    if_null rx381_debug, debug_372
    rx381_cur."!cursor_debug"("FAIL", "backslash:sym<e>")
  debug_372:
    .return (rx381_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<e>"  :subid("110_1297880735.27967") :method
.annotate 'line', 3
    new $P383, "ResizablePMCArray"
    push $P383, "E"
    push $P383, "e"
    .return ($P383)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<f>"  :subid("111_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx387_tgt
    .local int rx387_pos
    .local int rx387_off
    .local int rx387_eos
    .local int rx387_rep
    .local pmc rx387_cur
    .local pmc rx387_debug
    (rx387_cur, rx387_pos, rx387_tgt, $I10) = self."!cursor_start"()
    getattribute rx387_debug, rx387_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx387_cur
    .local pmc match
    .lex "$/", match
    length rx387_eos, rx387_tgt
    gt rx387_pos, rx387_eos, rx387_done
    set rx387_off, 0
    lt rx387_pos, 2, rx387_start
    sub rx387_off, rx387_pos, 1
    substr rx387_tgt, rx387_tgt, rx387_off
  rx387_start:
    eq $I10, 1, rx387_restart
    if_null rx387_debug, debug_373
    rx387_cur."!cursor_debug"("START", "backslash:sym<f>")
  debug_373:
    $I10 = self.'from'()
    ne $I10, -1, rxscan390_done
    goto rxscan390_scan
  rxscan390_loop:
    ($P10) = rx387_cur."from"()
    inc $P10
    set rx387_pos, $P10
    ge rx387_pos, rx387_eos, rxscan390_done
  rxscan390_scan:
    set_addr $I10, rxscan390_loop
    rx387_cur."!mark_push"(0, rx387_pos, $I10)
  rxscan390_done:
.annotate 'line', 139
  # rx subcapture "sym"
    set_addr $I10, rxcap_391_fail
    rx387_cur."!mark_push"(0, rx387_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx387_pos, rx387_eos, rx387_fail
    sub $I10, rx387_pos, rx387_off
    substr $S10, rx387_tgt, $I10, 1
    index $I11, "fF", $S10
    lt $I11, 0, rx387_fail
    inc rx387_pos
    set_addr $I10, rxcap_391_fail
    ($I12, $I11) = rx387_cur."!mark_peek"($I10)
    rx387_cur."!cursor_pos"($I11)
    ($P10) = rx387_cur."!cursor_start"()
    $P10."!cursor_pass"(rx387_pos, "")
    rx387_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_391_done
  rxcap_391_fail:
    goto rx387_fail
  rxcap_391_done:
  # rx pass
    rx387_cur."!cursor_pass"(rx387_pos, "backslash:sym<f>")
    if_null rx387_debug, debug_374
    rx387_cur."!cursor_debug"("PASS", "backslash:sym<f>", " at pos=", rx387_pos)
  debug_374:
    .return (rx387_cur)
  rx387_restart:
.annotate 'line', 3
    if_null rx387_debug, debug_375
    rx387_cur."!cursor_debug"("NEXT", "backslash:sym<f>")
  debug_375:
  rx387_fail:
    (rx387_rep, rx387_pos, $I10, $P10) = rx387_cur."!mark_fail"(0)
    lt rx387_pos, -1, rx387_done
    eq rx387_pos, -1, rx387_fail
    jump $I10
  rx387_done:
    rx387_cur."!cursor_fail"()
    if_null rx387_debug, debug_376
    rx387_cur."!cursor_debug"("FAIL", "backslash:sym<f>")
  debug_376:
    .return (rx387_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<f>"  :subid("112_1297880735.27967") :method
.annotate 'line', 3
    new $P389, "ResizablePMCArray"
    push $P389, "F"
    push $P389, "f"
    .return ($P389)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<h>"  :subid("113_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx393_tgt
    .local int rx393_pos
    .local int rx393_off
    .local int rx393_eos
    .local int rx393_rep
    .local pmc rx393_cur
    .local pmc rx393_debug
    (rx393_cur, rx393_pos, rx393_tgt, $I10) = self."!cursor_start"()
    getattribute rx393_debug, rx393_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx393_cur
    .local pmc match
    .lex "$/", match
    length rx393_eos, rx393_tgt
    gt rx393_pos, rx393_eos, rx393_done
    set rx393_off, 0
    lt rx393_pos, 2, rx393_start
    sub rx393_off, rx393_pos, 1
    substr rx393_tgt, rx393_tgt, rx393_off
  rx393_start:
    eq $I10, 1, rx393_restart
    if_null rx393_debug, debug_377
    rx393_cur."!cursor_debug"("START", "backslash:sym<h>")
  debug_377:
    $I10 = self.'from'()
    ne $I10, -1, rxscan396_done
    goto rxscan396_scan
  rxscan396_loop:
    ($P10) = rx393_cur."from"()
    inc $P10
    set rx393_pos, $P10
    ge rx393_pos, rx393_eos, rxscan396_done
  rxscan396_scan:
    set_addr $I10, rxscan396_loop
    rx393_cur."!mark_push"(0, rx393_pos, $I10)
  rxscan396_done:
.annotate 'line', 140
  # rx subcapture "sym"
    set_addr $I10, rxcap_397_fail
    rx393_cur."!mark_push"(0, rx393_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx393_pos, rx393_eos, rx393_fail
    sub $I10, rx393_pos, rx393_off
    substr $S10, rx393_tgt, $I10, 1
    index $I11, "hH", $S10
    lt $I11, 0, rx393_fail
    inc rx393_pos
    set_addr $I10, rxcap_397_fail
    ($I12, $I11) = rx393_cur."!mark_peek"($I10)
    rx393_cur."!cursor_pos"($I11)
    ($P10) = rx393_cur."!cursor_start"()
    $P10."!cursor_pass"(rx393_pos, "")
    rx393_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_397_done
  rxcap_397_fail:
    goto rx393_fail
  rxcap_397_done:
  # rx pass
    rx393_cur."!cursor_pass"(rx393_pos, "backslash:sym<h>")
    if_null rx393_debug, debug_378
    rx393_cur."!cursor_debug"("PASS", "backslash:sym<h>", " at pos=", rx393_pos)
  debug_378:
    .return (rx393_cur)
  rx393_restart:
.annotate 'line', 3
    if_null rx393_debug, debug_379
    rx393_cur."!cursor_debug"("NEXT", "backslash:sym<h>")
  debug_379:
  rx393_fail:
    (rx393_rep, rx393_pos, $I10, $P10) = rx393_cur."!mark_fail"(0)
    lt rx393_pos, -1, rx393_done
    eq rx393_pos, -1, rx393_fail
    jump $I10
  rx393_done:
    rx393_cur."!cursor_fail"()
    if_null rx393_debug, debug_380
    rx393_cur."!cursor_debug"("FAIL", "backslash:sym<h>")
  debug_380:
    .return (rx393_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<h>"  :subid("114_1297880735.27967") :method
.annotate 'line', 3
    new $P395, "ResizablePMCArray"
    push $P395, "H"
    push $P395, "h"
    .return ($P395)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<r>"  :subid("115_1297880735.27967") :method :outer("11_1297880735.27967")
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
    if_null rx399_debug, debug_381
    rx399_cur."!cursor_debug"("START", "backslash:sym<r>")
  debug_381:
    $I10 = self.'from'()
    ne $I10, -1, rxscan402_done
    goto rxscan402_scan
  rxscan402_loop:
    ($P10) = rx399_cur."from"()
    inc $P10
    set rx399_pos, $P10
    ge rx399_pos, rx399_eos, rxscan402_done
  rxscan402_scan:
    set_addr $I10, rxscan402_loop
    rx399_cur."!mark_push"(0, rx399_pos, $I10)
  rxscan402_done:
.annotate 'line', 141
  # rx subcapture "sym"
    set_addr $I10, rxcap_403_fail
    rx399_cur."!mark_push"(0, rx399_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx399_pos, rx399_eos, rx399_fail
    sub $I10, rx399_pos, rx399_off
    substr $S10, rx399_tgt, $I10, 1
    index $I11, "rR", $S10
    lt $I11, 0, rx399_fail
    inc rx399_pos
    set_addr $I10, rxcap_403_fail
    ($I12, $I11) = rx399_cur."!mark_peek"($I10)
    rx399_cur."!cursor_pos"($I11)
    ($P10) = rx399_cur."!cursor_start"()
    $P10."!cursor_pass"(rx399_pos, "")
    rx399_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_403_done
  rxcap_403_fail:
    goto rx399_fail
  rxcap_403_done:
  # rx pass
    rx399_cur."!cursor_pass"(rx399_pos, "backslash:sym<r>")
    if_null rx399_debug, debug_382
    rx399_cur."!cursor_debug"("PASS", "backslash:sym<r>", " at pos=", rx399_pos)
  debug_382:
    .return (rx399_cur)
  rx399_restart:
.annotate 'line', 3
    if_null rx399_debug, debug_383
    rx399_cur."!cursor_debug"("NEXT", "backslash:sym<r>")
  debug_383:
  rx399_fail:
    (rx399_rep, rx399_pos, $I10, $P10) = rx399_cur."!mark_fail"(0)
    lt rx399_pos, -1, rx399_done
    eq rx399_pos, -1, rx399_fail
    jump $I10
  rx399_done:
    rx399_cur."!cursor_fail"()
    if_null rx399_debug, debug_384
    rx399_cur."!cursor_debug"("FAIL", "backslash:sym<r>")
  debug_384:
    .return (rx399_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<r>"  :subid("116_1297880735.27967") :method
.annotate 'line', 3
    new $P401, "ResizablePMCArray"
    push $P401, "R"
    push $P401, "r"
    .return ($P401)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<t>"  :subid("117_1297880735.27967") :method :outer("11_1297880735.27967")
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
    if_null rx405_debug, debug_385
    rx405_cur."!cursor_debug"("START", "backslash:sym<t>")
  debug_385:
    $I10 = self.'from'()
    ne $I10, -1, rxscan408_done
    goto rxscan408_scan
  rxscan408_loop:
    ($P10) = rx405_cur."from"()
    inc $P10
    set rx405_pos, $P10
    ge rx405_pos, rx405_eos, rxscan408_done
  rxscan408_scan:
    set_addr $I10, rxscan408_loop
    rx405_cur."!mark_push"(0, rx405_pos, $I10)
  rxscan408_done:
.annotate 'line', 142
  # rx subcapture "sym"
    set_addr $I10, rxcap_409_fail
    rx405_cur."!mark_push"(0, rx405_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx405_pos, rx405_eos, rx405_fail
    sub $I10, rx405_pos, rx405_off
    substr $S10, rx405_tgt, $I10, 1
    index $I11, "tT", $S10
    lt $I11, 0, rx405_fail
    inc rx405_pos
    set_addr $I10, rxcap_409_fail
    ($I12, $I11) = rx405_cur."!mark_peek"($I10)
    rx405_cur."!cursor_pos"($I11)
    ($P10) = rx405_cur."!cursor_start"()
    $P10."!cursor_pass"(rx405_pos, "")
    rx405_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_409_done
  rxcap_409_fail:
    goto rx405_fail
  rxcap_409_done:
  # rx pass
    rx405_cur."!cursor_pass"(rx405_pos, "backslash:sym<t>")
    if_null rx405_debug, debug_386
    rx405_cur."!cursor_debug"("PASS", "backslash:sym<t>", " at pos=", rx405_pos)
  debug_386:
    .return (rx405_cur)
  rx405_restart:
.annotate 'line', 3
    if_null rx405_debug, debug_387
    rx405_cur."!cursor_debug"("NEXT", "backslash:sym<t>")
  debug_387:
  rx405_fail:
    (rx405_rep, rx405_pos, $I10, $P10) = rx405_cur."!mark_fail"(0)
    lt rx405_pos, -1, rx405_done
    eq rx405_pos, -1, rx405_fail
    jump $I10
  rx405_done:
    rx405_cur."!cursor_fail"()
    if_null rx405_debug, debug_388
    rx405_cur."!cursor_debug"("FAIL", "backslash:sym<t>")
  debug_388:
    .return (rx405_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<t>"  :subid("118_1297880735.27967") :method
.annotate 'line', 3
    new $P407, "ResizablePMCArray"
    push $P407, "T"
    push $P407, "t"
    .return ($P407)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<v>"  :subid("119_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx411_tgt
    .local int rx411_pos
    .local int rx411_off
    .local int rx411_eos
    .local int rx411_rep
    .local pmc rx411_cur
    .local pmc rx411_debug
    (rx411_cur, rx411_pos, rx411_tgt, $I10) = self."!cursor_start"()
    getattribute rx411_debug, rx411_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx411_cur
    .local pmc match
    .lex "$/", match
    length rx411_eos, rx411_tgt
    gt rx411_pos, rx411_eos, rx411_done
    set rx411_off, 0
    lt rx411_pos, 2, rx411_start
    sub rx411_off, rx411_pos, 1
    substr rx411_tgt, rx411_tgt, rx411_off
  rx411_start:
    eq $I10, 1, rx411_restart
    if_null rx411_debug, debug_389
    rx411_cur."!cursor_debug"("START", "backslash:sym<v>")
  debug_389:
    $I10 = self.'from'()
    ne $I10, -1, rxscan414_done
    goto rxscan414_scan
  rxscan414_loop:
    ($P10) = rx411_cur."from"()
    inc $P10
    set rx411_pos, $P10
    ge rx411_pos, rx411_eos, rxscan414_done
  rxscan414_scan:
    set_addr $I10, rxscan414_loop
    rx411_cur."!mark_push"(0, rx411_pos, $I10)
  rxscan414_done:
.annotate 'line', 143
  # rx subcapture "sym"
    set_addr $I10, rxcap_415_fail
    rx411_cur."!mark_push"(0, rx411_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx411_pos, rx411_eos, rx411_fail
    sub $I10, rx411_pos, rx411_off
    substr $S10, rx411_tgt, $I10, 1
    index $I11, "vV", $S10
    lt $I11, 0, rx411_fail
    inc rx411_pos
    set_addr $I10, rxcap_415_fail
    ($I12, $I11) = rx411_cur."!mark_peek"($I10)
    rx411_cur."!cursor_pos"($I11)
    ($P10) = rx411_cur."!cursor_start"()
    $P10."!cursor_pass"(rx411_pos, "")
    rx411_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_415_done
  rxcap_415_fail:
    goto rx411_fail
  rxcap_415_done:
  # rx pass
    rx411_cur."!cursor_pass"(rx411_pos, "backslash:sym<v>")
    if_null rx411_debug, debug_390
    rx411_cur."!cursor_debug"("PASS", "backslash:sym<v>", " at pos=", rx411_pos)
  debug_390:
    .return (rx411_cur)
  rx411_restart:
.annotate 'line', 3
    if_null rx411_debug, debug_391
    rx411_cur."!cursor_debug"("NEXT", "backslash:sym<v>")
  debug_391:
  rx411_fail:
    (rx411_rep, rx411_pos, $I10, $P10) = rx411_cur."!mark_fail"(0)
    lt rx411_pos, -1, rx411_done
    eq rx411_pos, -1, rx411_fail
    jump $I10
  rx411_done:
    rx411_cur."!cursor_fail"()
    if_null rx411_debug, debug_392
    rx411_cur."!cursor_debug"("FAIL", "backslash:sym<v>")
  debug_392:
    .return (rx411_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<v>"  :subid("120_1297880735.27967") :method
.annotate 'line', 3
    new $P413, "ResizablePMCArray"
    push $P413, "V"
    push $P413, "v"
    .return ($P413)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<o>"  :subid("121_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx417_tgt
    .local int rx417_pos
    .local int rx417_off
    .local int rx417_eos
    .local int rx417_rep
    .local pmc rx417_cur
    .local pmc rx417_debug
    (rx417_cur, rx417_pos, rx417_tgt, $I10) = self."!cursor_start"()
    getattribute rx417_debug, rx417_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx417_cur
    .local pmc match
    .lex "$/", match
    length rx417_eos, rx417_tgt
    gt rx417_pos, rx417_eos, rx417_done
    set rx417_off, 0
    lt rx417_pos, 2, rx417_start
    sub rx417_off, rx417_pos, 1
    substr rx417_tgt, rx417_tgt, rx417_off
  rx417_start:
    eq $I10, 1, rx417_restart
    if_null rx417_debug, debug_393
    rx417_cur."!cursor_debug"("START", "backslash:sym<o>")
  debug_393:
    $I10 = self.'from'()
    ne $I10, -1, rxscan424_done
    goto rxscan424_scan
  rxscan424_loop:
    ($P10) = rx417_cur."from"()
    inc $P10
    set rx417_pos, $P10
    ge rx417_pos, rx417_eos, rxscan424_done
  rxscan424_scan:
    set_addr $I10, rxscan424_loop
    rx417_cur."!mark_push"(0, rx417_pos, $I10)
  rxscan424_done:
.annotate 'line', 144
  # rx subcapture "sym"
    set_addr $I10, rxcap_425_fail
    rx417_cur."!mark_push"(0, rx417_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx417_pos, rx417_eos, rx417_fail
    sub $I10, rx417_pos, rx417_off
    substr $S10, rx417_tgt, $I10, 1
    index $I11, "oO", $S10
    lt $I11, 0, rx417_fail
    inc rx417_pos
    set_addr $I10, rxcap_425_fail
    ($I12, $I11) = rx417_cur."!mark_peek"($I10)
    rx417_cur."!cursor_pos"($I11)
    ($P10) = rx417_cur."!cursor_start"()
    $P10."!cursor_pass"(rx417_pos, "")
    rx417_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_425_done
  rxcap_425_fail:
    goto rx417_fail
  rxcap_425_done:
  alt426_0:
    set_addr $I10, alt426_1
    rx417_cur."!mark_push"(0, rx417_pos, $I10)
  # rx subrule "octint" subtype=capture negate=
    rx417_cur."!cursor_pos"(rx417_pos)
    $P10 = rx417_cur."octint"()
    unless $P10, rx417_fail
    rx417_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octint")
    rx417_pos = $P10."pos"()
    goto alt426_end
  alt426_1:
  # rx literal  "["
    add $I11, rx417_pos, 1
    gt $I11, rx417_eos, rx417_fail
    sub $I11, rx417_pos, rx417_off
    ord $I11, rx417_tgt, $I11
    ne $I11, 91, rx417_fail
    add rx417_pos, 1
  # rx subrule "octints" subtype=capture negate=
    rx417_cur."!cursor_pos"(rx417_pos)
    $P10 = rx417_cur."octints"()
    unless $P10, rx417_fail
    rx417_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octints")
    rx417_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx417_pos, 1
    gt $I11, rx417_eos, rx417_fail
    sub $I11, rx417_pos, rx417_off
    ord $I11, rx417_tgt, $I11
    ne $I11, 93, rx417_fail
    add rx417_pos, 1
  alt426_end:
  # rx pass
    rx417_cur."!cursor_pass"(rx417_pos, "backslash:sym<o>")
    if_null rx417_debug, debug_394
    rx417_cur."!cursor_debug"("PASS", "backslash:sym<o>", " at pos=", rx417_pos)
  debug_394:
    .return (rx417_cur)
  rx417_restart:
.annotate 'line', 3
    if_null rx417_debug, debug_395
    rx417_cur."!cursor_debug"("NEXT", "backslash:sym<o>")
  debug_395:
  rx417_fail:
    (rx417_rep, rx417_pos, $I10, $P10) = rx417_cur."!mark_fail"(0)
    lt rx417_pos, -1, rx417_done
    eq rx417_pos, -1, rx417_fail
    jump $I10
  rx417_done:
    rx417_cur."!cursor_fail"()
    if_null rx417_debug, debug_396
    rx417_cur."!cursor_debug"("FAIL", "backslash:sym<o>")
  debug_396:
    .return (rx417_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<o>"  :subid("122_1297880735.27967") :method
.annotate 'line', 3
    $P419 = self."!PREFIX__!subrule"("octints", "O[")
    $P420 = self."!PREFIX__!subrule"("octint", "O")
    $P421 = self."!PREFIX__!subrule"("octints", "o[")
    $P422 = self."!PREFIX__!subrule"("octint", "o")
    new $P423, "ResizablePMCArray"
    push $P423, $P419
    push $P423, $P420
    push $P423, $P421
    push $P423, $P422
    .return ($P423)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<x>"  :subid("123_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx428_tgt
    .local int rx428_pos
    .local int rx428_off
    .local int rx428_eos
    .local int rx428_rep
    .local pmc rx428_cur
    .local pmc rx428_debug
    (rx428_cur, rx428_pos, rx428_tgt, $I10) = self."!cursor_start"()
    getattribute rx428_debug, rx428_cur, "$!debug"
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
    if_null rx428_debug, debug_397
    rx428_cur."!cursor_debug"("START", "backslash:sym<x>")
  debug_397:
    $I10 = self.'from'()
    ne $I10, -1, rxscan435_done
    goto rxscan435_scan
  rxscan435_loop:
    ($P10) = rx428_cur."from"()
    inc $P10
    set rx428_pos, $P10
    ge rx428_pos, rx428_eos, rxscan435_done
  rxscan435_scan:
    set_addr $I10, rxscan435_loop
    rx428_cur."!mark_push"(0, rx428_pos, $I10)
  rxscan435_done:
.annotate 'line', 145
  # rx subcapture "sym"
    set_addr $I10, rxcap_436_fail
    rx428_cur."!mark_push"(0, rx428_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx428_pos, rx428_eos, rx428_fail
    sub $I10, rx428_pos, rx428_off
    substr $S10, rx428_tgt, $I10, 1
    index $I11, "xX", $S10
    lt $I11, 0, rx428_fail
    inc rx428_pos
    set_addr $I10, rxcap_436_fail
    ($I12, $I11) = rx428_cur."!mark_peek"($I10)
    rx428_cur."!cursor_pos"($I11)
    ($P10) = rx428_cur."!cursor_start"()
    $P10."!cursor_pass"(rx428_pos, "")
    rx428_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_436_done
  rxcap_436_fail:
    goto rx428_fail
  rxcap_436_done:
  alt437_0:
    set_addr $I10, alt437_1
    rx428_cur."!mark_push"(0, rx428_pos, $I10)
  # rx subrule "hexint" subtype=capture negate=
    rx428_cur."!cursor_pos"(rx428_pos)
    $P10 = rx428_cur."hexint"()
    unless $P10, rx428_fail
    rx428_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexint")
    rx428_pos = $P10."pos"()
    goto alt437_end
  alt437_1:
  # rx literal  "["
    add $I11, rx428_pos, 1
    gt $I11, rx428_eos, rx428_fail
    sub $I11, rx428_pos, rx428_off
    ord $I11, rx428_tgt, $I11
    ne $I11, 91, rx428_fail
    add rx428_pos, 1
  # rx subrule "hexints" subtype=capture negate=
    rx428_cur."!cursor_pos"(rx428_pos)
    $P10 = rx428_cur."hexints"()
    unless $P10, rx428_fail
    rx428_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexints")
    rx428_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx428_pos, 1
    gt $I11, rx428_eos, rx428_fail
    sub $I11, rx428_pos, rx428_off
    ord $I11, rx428_tgt, $I11
    ne $I11, 93, rx428_fail
    add rx428_pos, 1
  alt437_end:
  # rx pass
    rx428_cur."!cursor_pass"(rx428_pos, "backslash:sym<x>")
    if_null rx428_debug, debug_398
    rx428_cur."!cursor_debug"("PASS", "backslash:sym<x>", " at pos=", rx428_pos)
  debug_398:
    .return (rx428_cur)
  rx428_restart:
.annotate 'line', 3
    if_null rx428_debug, debug_399
    rx428_cur."!cursor_debug"("NEXT", "backslash:sym<x>")
  debug_399:
  rx428_fail:
    (rx428_rep, rx428_pos, $I10, $P10) = rx428_cur."!mark_fail"(0)
    lt rx428_pos, -1, rx428_done
    eq rx428_pos, -1, rx428_fail
    jump $I10
  rx428_done:
    rx428_cur."!cursor_fail"()
    if_null rx428_debug, debug_400
    rx428_cur."!cursor_debug"("FAIL", "backslash:sym<x>")
  debug_400:
    .return (rx428_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<x>"  :subid("124_1297880735.27967") :method
.annotate 'line', 3
    $P430 = self."!PREFIX__!subrule"("hexints", "X[")
    $P431 = self."!PREFIX__!subrule"("hexint", "X")
    $P432 = self."!PREFIX__!subrule"("hexints", "x[")
    $P433 = self."!PREFIX__!subrule"("hexint", "x")
    new $P434, "ResizablePMCArray"
    push $P434, $P430
    push $P434, $P431
    push $P434, $P432
    push $P434, $P433
    .return ($P434)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<c>"  :subid("125_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx439_tgt
    .local int rx439_pos
    .local int rx439_off
    .local int rx439_eos
    .local int rx439_rep
    .local pmc rx439_cur
    .local pmc rx439_debug
    (rx439_cur, rx439_pos, rx439_tgt, $I10) = self."!cursor_start"()
    getattribute rx439_debug, rx439_cur, "$!debug"
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
    eq $I10, 1, rx439_restart
    if_null rx439_debug, debug_401
    rx439_cur."!cursor_debug"("START", "backslash:sym<c>")
  debug_401:
    $I10 = self.'from'()
    ne $I10, -1, rxscan444_done
    goto rxscan444_scan
  rxscan444_loop:
    ($P10) = rx439_cur."from"()
    inc $P10
    set rx439_pos, $P10
    ge rx439_pos, rx439_eos, rxscan444_done
  rxscan444_scan:
    set_addr $I10, rxscan444_loop
    rx439_cur."!mark_push"(0, rx439_pos, $I10)
  rxscan444_done:
.annotate 'line', 146
  # rx subcapture "sym"
    set_addr $I10, rxcap_445_fail
    rx439_cur."!mark_push"(0, rx439_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx439_pos, rx439_eos, rx439_fail
    sub $I10, rx439_pos, rx439_off
    substr $S10, rx439_tgt, $I10, 1
    index $I11, "cC", $S10
    lt $I11, 0, rx439_fail
    inc rx439_pos
    set_addr $I10, rxcap_445_fail
    ($I12, $I11) = rx439_cur."!mark_peek"($I10)
    rx439_cur."!cursor_pos"($I11)
    ($P10) = rx439_cur."!cursor_start"()
    $P10."!cursor_pass"(rx439_pos, "")
    rx439_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_445_done
  rxcap_445_fail:
    goto rx439_fail
  rxcap_445_done:
  # rx subrule "charspec" subtype=capture negate=
    rx439_cur."!cursor_pos"(rx439_pos)
    $P10 = rx439_cur."charspec"()
    unless $P10, rx439_fail
    rx439_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charspec")
    rx439_pos = $P10."pos"()
  # rx pass
    rx439_cur."!cursor_pass"(rx439_pos, "backslash:sym<c>")
    if_null rx439_debug, debug_402
    rx439_cur."!cursor_debug"("PASS", "backslash:sym<c>", " at pos=", rx439_pos)
  debug_402:
    .return (rx439_cur)
  rx439_restart:
.annotate 'line', 3
    if_null rx439_debug, debug_403
    rx439_cur."!cursor_debug"("NEXT", "backslash:sym<c>")
  debug_403:
  rx439_fail:
    (rx439_rep, rx439_pos, $I10, $P10) = rx439_cur."!mark_fail"(0)
    lt rx439_pos, -1, rx439_done
    eq rx439_pos, -1, rx439_fail
    jump $I10
  rx439_done:
    rx439_cur."!cursor_fail"()
    if_null rx439_debug, debug_404
    rx439_cur."!cursor_debug"("FAIL", "backslash:sym<c>")
  debug_404:
    .return (rx439_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<c>"  :subid("126_1297880735.27967") :method
.annotate 'line', 3
    $P441 = self."!PREFIX__!subrule"("charspec", "C")
    $P442 = self."!PREFIX__!subrule"("charspec", "c")
    new $P443, "ResizablePMCArray"
    push $P443, $P441
    push $P443, $P442
    .return ($P443)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<A>"  :subid("127_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx447_tgt
    .local int rx447_pos
    .local int rx447_off
    .local int rx447_eos
    .local int rx447_rep
    .local pmc rx447_cur
    .local pmc rx447_debug
    (rx447_cur, rx447_pos, rx447_tgt, $I10) = self."!cursor_start"()
    getattribute rx447_debug, rx447_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx447_cur
    .local pmc match
    .lex "$/", match
    length rx447_eos, rx447_tgt
    gt rx447_pos, rx447_eos, rx447_done
    set rx447_off, 0
    lt rx447_pos, 2, rx447_start
    sub rx447_off, rx447_pos, 1
    substr rx447_tgt, rx447_tgt, rx447_off
  rx447_start:
    eq $I10, 1, rx447_restart
    if_null rx447_debug, debug_405
    rx447_cur."!cursor_debug"("START", "backslash:sym<A>")
  debug_405:
    $I10 = self.'from'()
    ne $I10, -1, rxscan451_done
    goto rxscan451_scan
  rxscan451_loop:
    ($P10) = rx447_cur."from"()
    inc $P10
    set rx447_pos, $P10
    ge rx447_pos, rx447_eos, rxscan451_done
  rxscan451_scan:
    set_addr $I10, rxscan451_loop
    rx447_cur."!mark_push"(0, rx447_pos, $I10)
  rxscan451_done:
.annotate 'line', 147
  # rx literal  "A"
    add $I11, rx447_pos, 1
    gt $I11, rx447_eos, rx447_fail
    sub $I11, rx447_pos, rx447_off
    ord $I11, rx447_tgt, $I11
    ne $I11, 65, rx447_fail
    add rx447_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx447_cur."!cursor_pos"(rx447_pos)
    $P10 = rx447_cur."obs"("\\A as beginning-of-string matcher", "^")
    unless $P10, rx447_fail
    rx447_pos = $P10."pos"()
  # rx pass
    rx447_cur."!cursor_pass"(rx447_pos, "backslash:sym<A>")
    if_null rx447_debug, debug_406
    rx447_cur."!cursor_debug"("PASS", "backslash:sym<A>", " at pos=", rx447_pos)
  debug_406:
    .return (rx447_cur)
  rx447_restart:
.annotate 'line', 3
    if_null rx447_debug, debug_407
    rx447_cur."!cursor_debug"("NEXT", "backslash:sym<A>")
  debug_407:
  rx447_fail:
    (rx447_rep, rx447_pos, $I10, $P10) = rx447_cur."!mark_fail"(0)
    lt rx447_pos, -1, rx447_done
    eq rx447_pos, -1, rx447_fail
    jump $I10
  rx447_done:
    rx447_cur."!cursor_fail"()
    if_null rx447_debug, debug_408
    rx447_cur."!cursor_debug"("FAIL", "backslash:sym<A>")
  debug_408:
    .return (rx447_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<A>"  :subid("128_1297880735.27967") :method
.annotate 'line', 3
    $P449 = self."!PREFIX__!subrule"("obs", "A")
    new $P450, "ResizablePMCArray"
    push $P450, $P449
    .return ($P450)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<z>"  :subid("129_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx453_tgt
    .local int rx453_pos
    .local int rx453_off
    .local int rx453_eos
    .local int rx453_rep
    .local pmc rx453_cur
    .local pmc rx453_debug
    (rx453_cur, rx453_pos, rx453_tgt, $I10) = self."!cursor_start"()
    getattribute rx453_debug, rx453_cur, "$!debug"
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
    if_null rx453_debug, debug_409
    rx453_cur."!cursor_debug"("START", "backslash:sym<z>")
  debug_409:
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
.annotate 'line', 148
  # rx literal  "z"
    add $I11, rx453_pos, 1
    gt $I11, rx453_eos, rx453_fail
    sub $I11, rx453_pos, rx453_off
    ord $I11, rx453_tgt, $I11
    ne $I11, 122, rx453_fail
    add rx453_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx453_cur."!cursor_pos"(rx453_pos)
    $P10 = rx453_cur."obs"("\\z as end-of-string matcher", "$")
    unless $P10, rx453_fail
    rx453_pos = $P10."pos"()
  # rx pass
    rx453_cur."!cursor_pass"(rx453_pos, "backslash:sym<z>")
    if_null rx453_debug, debug_410
    rx453_cur."!cursor_debug"("PASS", "backslash:sym<z>", " at pos=", rx453_pos)
  debug_410:
    .return (rx453_cur)
  rx453_restart:
.annotate 'line', 3
    if_null rx453_debug, debug_411
    rx453_cur."!cursor_debug"("NEXT", "backslash:sym<z>")
  debug_411:
  rx453_fail:
    (rx453_rep, rx453_pos, $I10, $P10) = rx453_cur."!mark_fail"(0)
    lt rx453_pos, -1, rx453_done
    eq rx453_pos, -1, rx453_fail
    jump $I10
  rx453_done:
    rx453_cur."!cursor_fail"()
    if_null rx453_debug, debug_412
    rx453_cur."!cursor_debug"("FAIL", "backslash:sym<z>")
  debug_412:
    .return (rx453_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<z>"  :subid("130_1297880735.27967") :method
.annotate 'line', 3
    $P455 = self."!PREFIX__!subrule"("obs", "z")
    new $P456, "ResizablePMCArray"
    push $P456, $P455
    .return ($P456)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Z>"  :subid("131_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
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
    if_null rx459_debug, debug_413
    rx459_cur."!cursor_debug"("START", "backslash:sym<Z>")
  debug_413:
    $I10 = self.'from'()
    ne $I10, -1, rxscan463_done
    goto rxscan463_scan
  rxscan463_loop:
    ($P10) = rx459_cur."from"()
    inc $P10
    set rx459_pos, $P10
    ge rx459_pos, rx459_eos, rxscan463_done
  rxscan463_scan:
    set_addr $I10, rxscan463_loop
    rx459_cur."!mark_push"(0, rx459_pos, $I10)
  rxscan463_done:
.annotate 'line', 149
  # rx literal  "Z"
    add $I11, rx459_pos, 1
    gt $I11, rx459_eos, rx459_fail
    sub $I11, rx459_pos, rx459_off
    ord $I11, rx459_tgt, $I11
    ne $I11, 90, rx459_fail
    add rx459_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx459_cur."!cursor_pos"(rx459_pos)
    $P10 = rx459_cur."obs"("\\Z as end-of-string matcher", "\\n?$")
    unless $P10, rx459_fail
    rx459_pos = $P10."pos"()
  # rx pass
    rx459_cur."!cursor_pass"(rx459_pos, "backslash:sym<Z>")
    if_null rx459_debug, debug_414
    rx459_cur."!cursor_debug"("PASS", "backslash:sym<Z>", " at pos=", rx459_pos)
  debug_414:
    .return (rx459_cur)
  rx459_restart:
.annotate 'line', 3
    if_null rx459_debug, debug_415
    rx459_cur."!cursor_debug"("NEXT", "backslash:sym<Z>")
  debug_415:
  rx459_fail:
    (rx459_rep, rx459_pos, $I10, $P10) = rx459_cur."!mark_fail"(0)
    lt rx459_pos, -1, rx459_done
    eq rx459_pos, -1, rx459_fail
    jump $I10
  rx459_done:
    rx459_cur."!cursor_fail"()
    if_null rx459_debug, debug_416
    rx459_cur."!cursor_debug"("FAIL", "backslash:sym<Z>")
  debug_416:
    .return (rx459_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<Z>"  :subid("132_1297880735.27967") :method
.annotate 'line', 3
    $P461 = self."!PREFIX__!subrule"("obs", "Z")
    new $P462, "ResizablePMCArray"
    push $P462, $P461
    .return ($P462)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Q>"  :subid("133_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx465_tgt
    .local int rx465_pos
    .local int rx465_off
    .local int rx465_eos
    .local int rx465_rep
    .local pmc rx465_cur
    .local pmc rx465_debug
    (rx465_cur, rx465_pos, rx465_tgt, $I10) = self."!cursor_start"()
    getattribute rx465_debug, rx465_cur, "$!debug"
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
    if_null rx465_debug, debug_417
    rx465_cur."!cursor_debug"("START", "backslash:sym<Q>")
  debug_417:
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
.annotate 'line', 150
  # rx literal  "Q"
    add $I11, rx465_pos, 1
    gt $I11, rx465_eos, rx465_fail
    sub $I11, rx465_pos, rx465_off
    ord $I11, rx465_tgt, $I11
    ne $I11, 81, rx465_fail
    add rx465_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx465_cur."!cursor_pos"(rx465_pos)
    $P10 = rx465_cur."obs"("\\Q as quotemeta", "quotes or literal variable match")
    unless $P10, rx465_fail
    rx465_pos = $P10."pos"()
  # rx pass
    rx465_cur."!cursor_pass"(rx465_pos, "backslash:sym<Q>")
    if_null rx465_debug, debug_418
    rx465_cur."!cursor_debug"("PASS", "backslash:sym<Q>", " at pos=", rx465_pos)
  debug_418:
    .return (rx465_cur)
  rx465_restart:
.annotate 'line', 3
    if_null rx465_debug, debug_419
    rx465_cur."!cursor_debug"("NEXT", "backslash:sym<Q>")
  debug_419:
  rx465_fail:
    (rx465_rep, rx465_pos, $I10, $P10) = rx465_cur."!mark_fail"(0)
    lt rx465_pos, -1, rx465_done
    eq rx465_pos, -1, rx465_fail
    jump $I10
  rx465_done:
    rx465_cur."!cursor_fail"()
    if_null rx465_debug, debug_420
    rx465_cur."!cursor_debug"("FAIL", "backslash:sym<Q>")
  debug_420:
    .return (rx465_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<Q>"  :subid("134_1297880735.27967") :method
.annotate 'line', 3
    $P467 = self."!PREFIX__!subrule"("obs", "Q")
    new $P468, "ResizablePMCArray"
    push $P468, $P467
    .return ($P468)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<unrec>"  :subid("135_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .const 'Sub' $P478 = "137_1297880735.27967" 
    capture_lex $P478
    .local string rx471_tgt
    .local int rx471_pos
    .local int rx471_off
    .local int rx471_eos
    .local int rx471_rep
    .local pmc rx471_cur
    .local pmc rx471_debug
    (rx471_cur, rx471_pos, rx471_tgt, $I10) = self."!cursor_start"()
    getattribute rx471_debug, rx471_cur, "$!debug"
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
    if_null rx471_debug, debug_421
    rx471_cur."!cursor_debug"("START", "backslash:sym<unrec>")
  debug_421:
    $I10 = self.'from'()
    ne $I10, -1, rxscan474_done
    goto rxscan474_scan
  rxscan474_loop:
    ($P10) = rx471_cur."from"()
    inc $P10
    set rx471_pos, $P10
    ge rx471_pos, rx471_eos, rxscan474_done
  rxscan474_scan:
    set_addr $I10, rxscan474_loop
    rx471_cur."!mark_push"(0, rx471_pos, $I10)
  rxscan474_done:
.annotate 'line', 151
    rx471_cur."!cursor_pos"(rx471_pos)
    find_lex $P475, unicode:"$\x{a2}"
    $P476 = $P475."MATCH"()
    store_lex "$/", $P476
    .const 'Sub' $P478 = "137_1297880735.27967" 
    capture_lex $P478
    $P479 = $P478()
  # rx charclass w
    ge rx471_pos, rx471_eos, rx471_fail
    sub $I10, rx471_pos, rx471_off
    is_cclass $I11, 8192, rx471_tgt, $I10
    unless $I11, rx471_fail
    inc rx471_pos
  # rx subrule "panic" subtype=method negate=
    rx471_cur."!cursor_pos"(rx471_pos)
    $P10 = rx471_cur."panic"("Unrecognized backslash sequence")
    unless $P10, rx471_fail
    rx471_pos = $P10."pos"()
  # rx pass
    rx471_cur."!cursor_pass"(rx471_pos, "backslash:sym<unrec>")
    if_null rx471_debug, debug_422
    rx471_cur."!cursor_debug"("PASS", "backslash:sym<unrec>", " at pos=", rx471_pos)
  debug_422:
    .return (rx471_cur)
  rx471_restart:
.annotate 'line', 3
    if_null rx471_debug, debug_423
    rx471_cur."!cursor_debug"("NEXT", "backslash:sym<unrec>")
  debug_423:
  rx471_fail:
    (rx471_rep, rx471_pos, $I10, $P10) = rx471_cur."!mark_fail"(0)
    lt rx471_pos, -1, rx471_done
    eq rx471_pos, -1, rx471_fail
    jump $I10
  rx471_done:
    rx471_cur."!cursor_fail"()
    if_null rx471_debug, debug_424
    rx471_cur."!cursor_debug"("FAIL", "backslash:sym<unrec>")
  debug_424:
    .return (rx471_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<unrec>"  :subid("136_1297880735.27967") :method
.annotate 'line', 3
    new $P473, "ResizablePMCArray"
    push $P473, ""
    .return ($P473)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block477"  :anon :subid("137_1297880735.27967") :outer("135_1297880735.27967")
.annotate 'line', 151
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<misc>"  :subid("138_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx481_tgt
    .local int rx481_pos
    .local int rx481_off
    .local int rx481_eos
    .local int rx481_rep
    .local pmc rx481_cur
    .local pmc rx481_debug
    (rx481_cur, rx481_pos, rx481_tgt, $I10) = self."!cursor_start"()
    getattribute rx481_debug, rx481_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx481_cur
    .local pmc match
    .lex "$/", match
    length rx481_eos, rx481_tgt
    gt rx481_pos, rx481_eos, rx481_done
    set rx481_off, 0
    lt rx481_pos, 2, rx481_start
    sub rx481_off, rx481_pos, 1
    substr rx481_tgt, rx481_tgt, rx481_off
  rx481_start:
    eq $I10, 1, rx481_restart
    if_null rx481_debug, debug_425
    rx481_cur."!cursor_debug"("START", "backslash:sym<misc>")
  debug_425:
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
.annotate 'line', 152
  # rx charclass W
    ge rx481_pos, rx481_eos, rx481_fail
    sub $I10, rx481_pos, rx481_off
    is_cclass $I11, 8192, rx481_tgt, $I10
    if $I11, rx481_fail
    inc rx481_pos
  # rx pass
    rx481_cur."!cursor_pass"(rx481_pos, "backslash:sym<misc>")
    if_null rx481_debug, debug_426
    rx481_cur."!cursor_debug"("PASS", "backslash:sym<misc>", " at pos=", rx481_pos)
  debug_426:
    .return (rx481_cur)
  rx481_restart:
.annotate 'line', 3
    if_null rx481_debug, debug_427
    rx481_cur."!cursor_debug"("NEXT", "backslash:sym<misc>")
  debug_427:
  rx481_fail:
    (rx481_rep, rx481_pos, $I10, $P10) = rx481_cur."!mark_fail"(0)
    lt rx481_pos, -1, rx481_done
    eq rx481_pos, -1, rx481_fail
    jump $I10
  rx481_done:
    rx481_cur."!cursor_fail"()
    if_null rx481_debug, debug_428
    rx481_cur."!cursor_debug"("FAIL", "backslash:sym<misc>")
  debug_428:
    .return (rx481_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<misc>"  :subid("139_1297880735.27967") :method
.annotate 'line', 3
    new $P483, "ResizablePMCArray"
    push $P483, ""
    .return ($P483)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion"  :subid("140_1297880735.27967") :method
.annotate 'line', 154
    $P486 = self."!protoregex"("assertion")
    .return ($P486)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion"  :subid("141_1297880735.27967") :method
.annotate 'line', 154
    $P488 = self."!PREFIX__!protoregex"("assertion")
    .return ($P488)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<?>"  :subid("142_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .const 'Sub' $P497 = "144_1297880735.27967" 
    capture_lex $P497
    .local string rx490_tgt
    .local int rx490_pos
    .local int rx490_off
    .local int rx490_eos
    .local int rx490_rep
    .local pmc rx490_cur
    .local pmc rx490_debug
    (rx490_cur, rx490_pos, rx490_tgt, $I10) = self."!cursor_start"()
    getattribute rx490_debug, rx490_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx490_cur
    .local pmc match
    .lex "$/", match
    length rx490_eos, rx490_tgt
    gt rx490_pos, rx490_eos, rx490_done
    set rx490_off, 0
    lt rx490_pos, 2, rx490_start
    sub rx490_off, rx490_pos, 1
    substr rx490_tgt, rx490_tgt, rx490_off
  rx490_start:
    eq $I10, 1, rx490_restart
    if_null rx490_debug, debug_429
    rx490_cur."!cursor_debug"("START", "assertion:sym<?>")
  debug_429:
    $I10 = self.'from'()
    ne $I10, -1, rxscan494_done
    goto rxscan494_scan
  rxscan494_loop:
    ($P10) = rx490_cur."from"()
    inc $P10
    set rx490_pos, $P10
    ge rx490_pos, rx490_eos, rxscan494_done
  rxscan494_scan:
    set_addr $I10, rxscan494_loop
    rx490_cur."!mark_push"(0, rx490_pos, $I10)
  rxscan494_done:
.annotate 'line', 156
  # rx literal  "?"
    add $I11, rx490_pos, 1
    gt $I11, rx490_eos, rx490_fail
    sub $I11, rx490_pos, rx490_off
    ord $I11, rx490_tgt, $I11
    ne $I11, 63, rx490_fail
    add rx490_pos, 1
  alt495_0:
    set_addr $I10, alt495_1
    rx490_cur."!mark_push"(0, rx490_pos, $I10)
  # rx subrule "before" subtype=zerowidth negate=
    rx490_cur."!cursor_pos"(rx490_pos)
    .const 'Sub' $P497 = "144_1297880735.27967" 
    capture_lex $P497
    $P10 = rx490_cur."before"($P497)
    unless $P10, rx490_fail
    goto alt495_end
  alt495_1:
  # rx subrule "assertion" subtype=capture negate=
    rx490_cur."!cursor_pos"(rx490_pos)
    $P10 = rx490_cur."assertion"()
    unless $P10, rx490_fail
    rx490_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx490_pos = $P10."pos"()
  alt495_end:
  # rx pass
    rx490_cur."!cursor_pass"(rx490_pos, "assertion:sym<?>")
    if_null rx490_debug, debug_434
    rx490_cur."!cursor_debug"("PASS", "assertion:sym<?>", " at pos=", rx490_pos)
  debug_434:
    .return (rx490_cur)
  rx490_restart:
.annotate 'line', 3
    if_null rx490_debug, debug_435
    rx490_cur."!cursor_debug"("NEXT", "assertion:sym<?>")
  debug_435:
  rx490_fail:
    (rx490_rep, rx490_pos, $I10, $P10) = rx490_cur."!mark_fail"(0)
    lt rx490_pos, -1, rx490_done
    eq rx490_pos, -1, rx490_fail
    jump $I10
  rx490_done:
    rx490_cur."!cursor_fail"()
    if_null rx490_debug, debug_436
    rx490_cur."!cursor_debug"("FAIL", "assertion:sym<?>")
  debug_436:
    .return (rx490_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<?>"  :subid("143_1297880735.27967") :method
.annotate 'line', 3
    $P492 = self."!PREFIX__!subrule"("assertion", "?")
    new $P493, "ResizablePMCArray"
    push $P493, $P492
    push $P493, "?"
    .return ($P493)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block496"  :anon :subid("144_1297880735.27967") :method :outer("142_1297880735.27967")
.annotate 'line', 156
    .local string rx498_tgt
    .local int rx498_pos
    .local int rx498_off
    .local int rx498_eos
    .local int rx498_rep
    .local pmc rx498_cur
    .local pmc rx498_debug
    (rx498_cur, rx498_pos, rx498_tgt, $I10) = self."!cursor_start"()
    getattribute rx498_debug, rx498_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx498_cur
    .local pmc match
    .lex "$/", match
    length rx498_eos, rx498_tgt
    gt rx498_pos, rx498_eos, rx498_done
    set rx498_off, 0
    lt rx498_pos, 2, rx498_start
    sub rx498_off, rx498_pos, 1
    substr rx498_tgt, rx498_tgt, rx498_off
  rx498_start:
    eq $I10, 1, rx498_restart
    if_null rx498_debug, debug_430
    rx498_cur."!cursor_debug"("START", "")
  debug_430:
    $I10 = self.'from'()
    ne $I10, -1, rxscan499_done
    goto rxscan499_scan
  rxscan499_loop:
    ($P10) = rx498_cur."from"()
    inc $P10
    set rx498_pos, $P10
    ge rx498_pos, rx498_eos, rxscan499_done
  rxscan499_scan:
    set_addr $I10, rxscan499_loop
    rx498_cur."!mark_push"(0, rx498_pos, $I10)
  rxscan499_done:
  # rx literal  ">"
    add $I11, rx498_pos, 1
    gt $I11, rx498_eos, rx498_fail
    sub $I11, rx498_pos, rx498_off
    ord $I11, rx498_tgt, $I11
    ne $I11, 62, rx498_fail
    add rx498_pos, 1
  # rx pass
    rx498_cur."!cursor_pass"(rx498_pos, "")
    if_null rx498_debug, debug_431
    rx498_cur."!cursor_debug"("PASS", "", " at pos=", rx498_pos)
  debug_431:
    .return (rx498_cur)
  rx498_restart:
    if_null rx498_debug, debug_432
    rx498_cur."!cursor_debug"("NEXT", "")
  debug_432:
  rx498_fail:
    (rx498_rep, rx498_pos, $I10, $P10) = rx498_cur."!mark_fail"(0)
    lt rx498_pos, -1, rx498_done
    eq rx498_pos, -1, rx498_fail
    jump $I10
  rx498_done:
    rx498_cur."!cursor_fail"()
    if_null rx498_debug, debug_433
    rx498_cur."!cursor_debug"("FAIL", "")
  debug_433:
    .return (rx498_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<!>"  :subid("145_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .const 'Sub' $P508 = "147_1297880735.27967" 
    capture_lex $P508
    .local string rx501_tgt
    .local int rx501_pos
    .local int rx501_off
    .local int rx501_eos
    .local int rx501_rep
    .local pmc rx501_cur
    .local pmc rx501_debug
    (rx501_cur, rx501_pos, rx501_tgt, $I10) = self."!cursor_start"()
    getattribute rx501_debug, rx501_cur, "$!debug"
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
    eq $I10, 1, rx501_restart
    if_null rx501_debug, debug_437
    rx501_cur."!cursor_debug"("START", "assertion:sym<!>")
  debug_437:
    $I10 = self.'from'()
    ne $I10, -1, rxscan505_done
    goto rxscan505_scan
  rxscan505_loop:
    ($P10) = rx501_cur."from"()
    inc $P10
    set rx501_pos, $P10
    ge rx501_pos, rx501_eos, rxscan505_done
  rxscan505_scan:
    set_addr $I10, rxscan505_loop
    rx501_cur."!mark_push"(0, rx501_pos, $I10)
  rxscan505_done:
.annotate 'line', 157
  # rx literal  "!"
    add $I11, rx501_pos, 1
    gt $I11, rx501_eos, rx501_fail
    sub $I11, rx501_pos, rx501_off
    ord $I11, rx501_tgt, $I11
    ne $I11, 33, rx501_fail
    add rx501_pos, 1
  alt506_0:
    set_addr $I10, alt506_1
    rx501_cur."!mark_push"(0, rx501_pos, $I10)
  # rx subrule "before" subtype=zerowidth negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    .const 'Sub' $P508 = "147_1297880735.27967" 
    capture_lex $P508
    $P10 = rx501_cur."before"($P508)
    unless $P10, rx501_fail
    goto alt506_end
  alt506_1:
  # rx subrule "assertion" subtype=capture negate=
    rx501_cur."!cursor_pos"(rx501_pos)
    $P10 = rx501_cur."assertion"()
    unless $P10, rx501_fail
    rx501_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx501_pos = $P10."pos"()
  alt506_end:
  # rx pass
    rx501_cur."!cursor_pass"(rx501_pos, "assertion:sym<!>")
    if_null rx501_debug, debug_442
    rx501_cur."!cursor_debug"("PASS", "assertion:sym<!>", " at pos=", rx501_pos)
  debug_442:
    .return (rx501_cur)
  rx501_restart:
.annotate 'line', 3
    if_null rx501_debug, debug_443
    rx501_cur."!cursor_debug"("NEXT", "assertion:sym<!>")
  debug_443:
  rx501_fail:
    (rx501_rep, rx501_pos, $I10, $P10) = rx501_cur."!mark_fail"(0)
    lt rx501_pos, -1, rx501_done
    eq rx501_pos, -1, rx501_fail
    jump $I10
  rx501_done:
    rx501_cur."!cursor_fail"()
    if_null rx501_debug, debug_444
    rx501_cur."!cursor_debug"("FAIL", "assertion:sym<!>")
  debug_444:
    .return (rx501_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<!>"  :subid("146_1297880735.27967") :method
.annotate 'line', 3
    $P503 = self."!PREFIX__!subrule"("assertion", "!")
    new $P504, "ResizablePMCArray"
    push $P504, $P503
    push $P504, "!"
    .return ($P504)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block507"  :anon :subid("147_1297880735.27967") :method :outer("145_1297880735.27967")
.annotate 'line', 157
    .local string rx509_tgt
    .local int rx509_pos
    .local int rx509_off
    .local int rx509_eos
    .local int rx509_rep
    .local pmc rx509_cur
    .local pmc rx509_debug
    (rx509_cur, rx509_pos, rx509_tgt, $I10) = self."!cursor_start"()
    getattribute rx509_debug, rx509_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx509_cur
    .local pmc match
    .lex "$/", match
    length rx509_eos, rx509_tgt
    gt rx509_pos, rx509_eos, rx509_done
    set rx509_off, 0
    lt rx509_pos, 2, rx509_start
    sub rx509_off, rx509_pos, 1
    substr rx509_tgt, rx509_tgt, rx509_off
  rx509_start:
    eq $I10, 1, rx509_restart
    if_null rx509_debug, debug_438
    rx509_cur."!cursor_debug"("START", "")
  debug_438:
    $I10 = self.'from'()
    ne $I10, -1, rxscan510_done
    goto rxscan510_scan
  rxscan510_loop:
    ($P10) = rx509_cur."from"()
    inc $P10
    set rx509_pos, $P10
    ge rx509_pos, rx509_eos, rxscan510_done
  rxscan510_scan:
    set_addr $I10, rxscan510_loop
    rx509_cur."!mark_push"(0, rx509_pos, $I10)
  rxscan510_done:
  # rx literal  ">"
    add $I11, rx509_pos, 1
    gt $I11, rx509_eos, rx509_fail
    sub $I11, rx509_pos, rx509_off
    ord $I11, rx509_tgt, $I11
    ne $I11, 62, rx509_fail
    add rx509_pos, 1
  # rx pass
    rx509_cur."!cursor_pass"(rx509_pos, "")
    if_null rx509_debug, debug_439
    rx509_cur."!cursor_debug"("PASS", "", " at pos=", rx509_pos)
  debug_439:
    .return (rx509_cur)
  rx509_restart:
    if_null rx509_debug, debug_440
    rx509_cur."!cursor_debug"("NEXT", "")
  debug_440:
  rx509_fail:
    (rx509_rep, rx509_pos, $I10, $P10) = rx509_cur."!mark_fail"(0)
    lt rx509_pos, -1, rx509_done
    eq rx509_pos, -1, rx509_fail
    jump $I10
  rx509_done:
    rx509_cur."!cursor_fail"()
    if_null rx509_debug, debug_441
    rx509_cur."!cursor_debug"("FAIL", "")
  debug_441:
    .return (rx509_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<method>"  :subid("148_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx512_tgt
    .local int rx512_pos
    .local int rx512_off
    .local int rx512_eos
    .local int rx512_rep
    .local pmc rx512_cur
    .local pmc rx512_debug
    (rx512_cur, rx512_pos, rx512_tgt, $I10) = self."!cursor_start"()
    getattribute rx512_debug, rx512_cur, "$!debug"
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
    if_null rx512_debug, debug_445
    rx512_cur."!cursor_debug"("START", "assertion:sym<method>")
  debug_445:
    $I10 = self.'from'()
    ne $I10, -1, rxscan516_done
    goto rxscan516_scan
  rxscan516_loop:
    ($P10) = rx512_cur."from"()
    inc $P10
    set rx512_pos, $P10
    ge rx512_pos, rx512_eos, rxscan516_done
  rxscan516_scan:
    set_addr $I10, rxscan516_loop
    rx512_cur."!mark_push"(0, rx512_pos, $I10)
  rxscan516_done:
.annotate 'line', 160
  # rx literal  "."
    add $I11, rx512_pos, 1
    gt $I11, rx512_eos, rx512_fail
    sub $I11, rx512_pos, rx512_off
    ord $I11, rx512_tgt, $I11
    ne $I11, 46, rx512_fail
    add rx512_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx512_cur."!cursor_pos"(rx512_pos)
    $P10 = rx512_cur."assertion"()
    unless $P10, rx512_fail
    rx512_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx512_pos = $P10."pos"()
.annotate 'line', 159
  # rx pass
    rx512_cur."!cursor_pass"(rx512_pos, "assertion:sym<method>")
    if_null rx512_debug, debug_446
    rx512_cur."!cursor_debug"("PASS", "assertion:sym<method>", " at pos=", rx512_pos)
  debug_446:
    .return (rx512_cur)
  rx512_restart:
.annotate 'line', 3
    if_null rx512_debug, debug_447
    rx512_cur."!cursor_debug"("NEXT", "assertion:sym<method>")
  debug_447:
  rx512_fail:
    (rx512_rep, rx512_pos, $I10, $P10) = rx512_cur."!mark_fail"(0)
    lt rx512_pos, -1, rx512_done
    eq rx512_pos, -1, rx512_fail
    jump $I10
  rx512_done:
    rx512_cur."!cursor_fail"()
    if_null rx512_debug, debug_448
    rx512_cur."!cursor_debug"("FAIL", "assertion:sym<method>")
  debug_448:
    .return (rx512_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<method>"  :subid("149_1297880735.27967") :method
.annotate 'line', 3
    $P514 = self."!PREFIX__!subrule"("assertion", ".")
    new $P515, "ResizablePMCArray"
    push $P515, $P514
    .return ($P515)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<name>"  :subid("150_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .const 'Sub' $P526 = "152_1297880735.27967" 
    capture_lex $P526
    .local string rx518_tgt
    .local int rx518_pos
    .local int rx518_off
    .local int rx518_eos
    .local int rx518_rep
    .local pmc rx518_cur
    .local pmc rx518_debug
    (rx518_cur, rx518_pos, rx518_tgt, $I10) = self."!cursor_start"()
    rx518_cur."!cursor_caparray"("assertion", "arglist", "nibbler")
    getattribute rx518_debug, rx518_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx518_cur
    .local pmc match
    .lex "$/", match
    length rx518_eos, rx518_tgt
    gt rx518_pos, rx518_eos, rx518_done
    set rx518_off, 0
    lt rx518_pos, 2, rx518_start
    sub rx518_off, rx518_pos, 1
    substr rx518_tgt, rx518_tgt, rx518_off
  rx518_start:
    eq $I10, 1, rx518_restart
    if_null rx518_debug, debug_449
    rx518_cur."!cursor_debug"("START", "assertion:sym<name>")
  debug_449:
    $I10 = self.'from'()
    ne $I10, -1, rxscan522_done
    goto rxscan522_scan
  rxscan522_loop:
    ($P10) = rx518_cur."from"()
    inc $P10
    set rx518_pos, $P10
    ge rx518_pos, rx518_eos, rxscan522_done
  rxscan522_scan:
    set_addr $I10, rxscan522_loop
    rx518_cur."!mark_push"(0, rx518_pos, $I10)
  rxscan522_done:
.annotate 'line', 164
  # rx subrule "identifier" subtype=capture negate=
    rx518_cur."!cursor_pos"(rx518_pos)
    $P10 = rx518_cur."identifier"()
    unless $P10, rx518_fail
    rx518_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    rx518_pos = $P10."pos"()
.annotate 'line', 171
  # rx rxquantr523 ** 0..1
    set_addr $I10, rxquantr523_done
    rx518_cur."!mark_push"(0, rx518_pos, $I10)
  rxquantr523_loop:
  alt524_0:
.annotate 'line', 165
    set_addr $I10, alt524_1
    rx518_cur."!mark_push"(0, rx518_pos, $I10)
.annotate 'line', 166
  # rx subrule "before" subtype=zerowidth negate=
    rx518_cur."!cursor_pos"(rx518_pos)
    .const 'Sub' $P526 = "152_1297880735.27967" 
    capture_lex $P526
    $P10 = rx518_cur."before"($P526)
    unless $P10, rx518_fail
    goto alt524_end
  alt524_1:
    set_addr $I10, alt524_2
    rx518_cur."!mark_push"(0, rx518_pos, $I10)
.annotate 'line', 167
  # rx literal  "="
    add $I11, rx518_pos, 1
    gt $I11, rx518_eos, rx518_fail
    sub $I11, rx518_pos, rx518_off
    ord $I11, rx518_tgt, $I11
    ne $I11, 61, rx518_fail
    add rx518_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx518_cur."!cursor_pos"(rx518_pos)
    $P10 = rx518_cur."assertion"()
    unless $P10, rx518_fail
    rx518_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx518_pos = $P10."pos"()
    goto alt524_end
  alt524_2:
    set_addr $I10, alt524_3
    rx518_cur."!mark_push"(0, rx518_pos, $I10)
.annotate 'line', 168
  # rx literal  ":"
    add $I11, rx518_pos, 1
    gt $I11, rx518_eos, rx518_fail
    sub $I11, rx518_pos, rx518_off
    ord $I11, rx518_tgt, $I11
    ne $I11, 58, rx518_fail
    add rx518_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx518_cur."!cursor_pos"(rx518_pos)
    $P10 = rx518_cur."arglist"()
    unless $P10, rx518_fail
    rx518_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx518_pos = $P10."pos"()
    goto alt524_end
  alt524_3:
    set_addr $I10, alt524_4
    rx518_cur."!mark_push"(0, rx518_pos, $I10)
.annotate 'line', 169
  # rx literal  "("
    add $I11, rx518_pos, 1
    gt $I11, rx518_eos, rx518_fail
    sub $I11, rx518_pos, rx518_off
    ord $I11, rx518_tgt, $I11
    ne $I11, 40, rx518_fail
    add rx518_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx518_cur."!cursor_pos"(rx518_pos)
    $P10 = rx518_cur."arglist"()
    unless $P10, rx518_fail
    rx518_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx518_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx518_pos, 1
    gt $I11, rx518_eos, rx518_fail
    sub $I11, rx518_pos, rx518_off
    ord $I11, rx518_tgt, $I11
    ne $I11, 41, rx518_fail
    add rx518_pos, 1
    goto alt524_end
  alt524_4:
.annotate 'line', 170
  # rx subrule "normspace" subtype=method negate=
    rx518_cur."!cursor_pos"(rx518_pos)
    $P10 = rx518_cur."normspace"()
    unless $P10, rx518_fail
    rx518_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx518_cur."!cursor_pos"(rx518_pos)
    $P10 = rx518_cur."nibbler"()
    unless $P10, rx518_fail
    rx518_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx518_pos = $P10."pos"()
  alt524_end:
.annotate 'line', 171
    set_addr $I10, rxquantr523_done
    (rx518_rep) = rx518_cur."!mark_commit"($I10)
  rxquantr523_done:
.annotate 'line', 163
  # rx pass
    rx518_cur."!cursor_pass"(rx518_pos, "assertion:sym<name>")
    if_null rx518_debug, debug_454
    rx518_cur."!cursor_debug"("PASS", "assertion:sym<name>", " at pos=", rx518_pos)
  debug_454:
    .return (rx518_cur)
  rx518_restart:
.annotate 'line', 3
    if_null rx518_debug, debug_455
    rx518_cur."!cursor_debug"("NEXT", "assertion:sym<name>")
  debug_455:
  rx518_fail:
    (rx518_rep, rx518_pos, $I10, $P10) = rx518_cur."!mark_fail"(0)
    lt rx518_pos, -1, rx518_done
    eq rx518_pos, -1, rx518_fail
    jump $I10
  rx518_done:
    rx518_cur."!cursor_fail"()
    if_null rx518_debug, debug_456
    rx518_cur."!cursor_debug"("FAIL", "assertion:sym<name>")
  debug_456:
    .return (rx518_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<name>"  :subid("151_1297880735.27967") :method
.annotate 'line', 3
    $P520 = self."!PREFIX__!subrule"("identifier", "")
    new $P521, "ResizablePMCArray"
    push $P521, $P520
    .return ($P521)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block525"  :anon :subid("152_1297880735.27967") :method :outer("150_1297880735.27967")
.annotate 'line', 166
    .local string rx527_tgt
    .local int rx527_pos
    .local int rx527_off
    .local int rx527_eos
    .local int rx527_rep
    .local pmc rx527_cur
    .local pmc rx527_debug
    (rx527_cur, rx527_pos, rx527_tgt, $I10) = self."!cursor_start"()
    getattribute rx527_debug, rx527_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx527_cur
    .local pmc match
    .lex "$/", match
    length rx527_eos, rx527_tgt
    gt rx527_pos, rx527_eos, rx527_done
    set rx527_off, 0
    lt rx527_pos, 2, rx527_start
    sub rx527_off, rx527_pos, 1
    substr rx527_tgt, rx527_tgt, rx527_off
  rx527_start:
    eq $I10, 1, rx527_restart
    if_null rx527_debug, debug_450
    rx527_cur."!cursor_debug"("START", "")
  debug_450:
    $I10 = self.'from'()
    ne $I10, -1, rxscan528_done
    goto rxscan528_scan
  rxscan528_loop:
    ($P10) = rx527_cur."from"()
    inc $P10
    set rx527_pos, $P10
    ge rx527_pos, rx527_eos, rxscan528_done
  rxscan528_scan:
    set_addr $I10, rxscan528_loop
    rx527_cur."!mark_push"(0, rx527_pos, $I10)
  rxscan528_done:
  # rx literal  ">"
    add $I11, rx527_pos, 1
    gt $I11, rx527_eos, rx527_fail
    sub $I11, rx527_pos, rx527_off
    ord $I11, rx527_tgt, $I11
    ne $I11, 62, rx527_fail
    add rx527_pos, 1
  # rx pass
    rx527_cur."!cursor_pass"(rx527_pos, "")
    if_null rx527_debug, debug_451
    rx527_cur."!cursor_debug"("PASS", "", " at pos=", rx527_pos)
  debug_451:
    .return (rx527_cur)
  rx527_restart:
    if_null rx527_debug, debug_452
    rx527_cur."!cursor_debug"("NEXT", "")
  debug_452:
  rx527_fail:
    (rx527_rep, rx527_pos, $I10, $P10) = rx527_cur."!mark_fail"(0)
    lt rx527_pos, -1, rx527_done
    eq rx527_pos, -1, rx527_fail
    jump $I10
  rx527_done:
    rx527_cur."!cursor_fail"()
    if_null rx527_debug, debug_453
    rx527_cur."!cursor_debug"("FAIL", "")
  debug_453:
    .return (rx527_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<[>"  :subid("153_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .const 'Sub' $P535 = "155_1297880735.27967" 
    capture_lex $P535
    .local string rx530_tgt
    .local int rx530_pos
    .local int rx530_off
    .local int rx530_eos
    .local int rx530_rep
    .local pmc rx530_cur
    .local pmc rx530_debug
    (rx530_cur, rx530_pos, rx530_tgt, $I10) = self."!cursor_start"()
    rx530_cur."!cursor_caparray"("cclass_elem")
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
    if_null rx530_debug, debug_457
    rx530_cur."!cursor_debug"("START", "assertion:sym<[>")
  debug_457:
    $I10 = self.'from'()
    ne $I10, -1, rxscan533_done
    goto rxscan533_scan
  rxscan533_loop:
    ($P10) = rx530_cur."from"()
    inc $P10
    set rx530_pos, $P10
    ge rx530_pos, rx530_eos, rxscan533_done
  rxscan533_scan:
    set_addr $I10, rxscan533_loop
    rx530_cur."!mark_push"(0, rx530_pos, $I10)
  rxscan533_done:
.annotate 'line', 174
  # rx subrule "before" subtype=zerowidth negate=
    rx530_cur."!cursor_pos"(rx530_pos)
    .const 'Sub' $P535 = "155_1297880735.27967" 
    capture_lex $P535
    $P10 = rx530_cur."before"($P535)
    unless $P10, rx530_fail
  # rx rxquantr539 ** 1..*
    set_addr $I10, rxquantr539_done
    rx530_cur."!mark_push"(0, -1, $I10)
  rxquantr539_loop:
  # rx subrule "cclass_elem" subtype=capture negate=
    rx530_cur."!cursor_pos"(rx530_pos)
    $P10 = rx530_cur."cclass_elem"()
    unless $P10, rx530_fail
    goto rxsubrule540_pass
  rxsubrule540_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx530_fail
  rxsubrule540_pass:
    set_addr $I10, rxsubrule540_back
    rx530_cur."!mark_push"(0, rx530_pos, $I10, $P10)
    $P10."!cursor_names"("cclass_elem")
    rx530_pos = $P10."pos"()
    set_addr $I10, rxquantr539_done
    (rx530_rep) = rx530_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr539_done
    rx530_cur."!mark_push"(rx530_rep, rx530_pos, $I10)
    goto rxquantr539_loop
  rxquantr539_done:
  # rx pass
    rx530_cur."!cursor_pass"(rx530_pos, "assertion:sym<[>")
    if_null rx530_debug, debug_462
    rx530_cur."!cursor_debug"("PASS", "assertion:sym<[>", " at pos=", rx530_pos)
  debug_462:
    .return (rx530_cur)
  rx530_restart:
.annotate 'line', 3
    if_null rx530_debug, debug_463
    rx530_cur."!cursor_debug"("NEXT", "assertion:sym<[>")
  debug_463:
  rx530_fail:
    (rx530_rep, rx530_pos, $I10, $P10) = rx530_cur."!mark_fail"(0)
    lt rx530_pos, -1, rx530_done
    eq rx530_pos, -1, rx530_fail
    jump $I10
  rx530_done:
    rx530_cur."!cursor_fail"()
    if_null rx530_debug, debug_464
    rx530_cur."!cursor_debug"("FAIL", "assertion:sym<[>")
  debug_464:
    .return (rx530_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<[>"  :subid("154_1297880735.27967") :method
.annotate 'line', 3
    new $P532, "ResizablePMCArray"
    push $P532, ""
    .return ($P532)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block534"  :anon :subid("155_1297880735.27967") :method :outer("153_1297880735.27967")
.annotate 'line', 174
    .local string rx536_tgt
    .local int rx536_pos
    .local int rx536_off
    .local int rx536_eos
    .local int rx536_rep
    .local pmc rx536_cur
    .local pmc rx536_debug
    (rx536_cur, rx536_pos, rx536_tgt, $I10) = self."!cursor_start"()
    getattribute rx536_debug, rx536_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx536_cur
    .local pmc match
    .lex "$/", match
    length rx536_eos, rx536_tgt
    gt rx536_pos, rx536_eos, rx536_done
    set rx536_off, 0
    lt rx536_pos, 2, rx536_start
    sub rx536_off, rx536_pos, 1
    substr rx536_tgt, rx536_tgt, rx536_off
  rx536_start:
    eq $I10, 1, rx536_restart
    if_null rx536_debug, debug_458
    rx536_cur."!cursor_debug"("START", "")
  debug_458:
    $I10 = self.'from'()
    ne $I10, -1, rxscan537_done
    goto rxscan537_scan
  rxscan537_loop:
    ($P10) = rx536_cur."from"()
    inc $P10
    set rx536_pos, $P10
    ge rx536_pos, rx536_eos, rxscan537_done
  rxscan537_scan:
    set_addr $I10, rxscan537_loop
    rx536_cur."!mark_push"(0, rx536_pos, $I10)
  rxscan537_done:
  alt538_0:
    set_addr $I10, alt538_1
    rx536_cur."!mark_push"(0, rx536_pos, $I10)
  # rx literal  "["
    add $I11, rx536_pos, 1
    gt $I11, rx536_eos, rx536_fail
    sub $I11, rx536_pos, rx536_off
    ord $I11, rx536_tgt, $I11
    ne $I11, 91, rx536_fail
    add rx536_pos, 1
    goto alt538_end
  alt538_1:
    set_addr $I10, alt538_2
    rx536_cur."!mark_push"(0, rx536_pos, $I10)
  # rx literal  "+"
    add $I11, rx536_pos, 1
    gt $I11, rx536_eos, rx536_fail
    sub $I11, rx536_pos, rx536_off
    ord $I11, rx536_tgt, $I11
    ne $I11, 43, rx536_fail
    add rx536_pos, 1
    goto alt538_end
  alt538_2:
  # rx literal  "-"
    add $I11, rx536_pos, 1
    gt $I11, rx536_eos, rx536_fail
    sub $I11, rx536_pos, rx536_off
    ord $I11, rx536_tgt, $I11
    ne $I11, 45, rx536_fail
    add rx536_pos, 1
  alt538_end:
  # rx pass
    rx536_cur."!cursor_pass"(rx536_pos, "")
    if_null rx536_debug, debug_459
    rx536_cur."!cursor_debug"("PASS", "", " at pos=", rx536_pos)
  debug_459:
    .return (rx536_cur)
  rx536_restart:
    if_null rx536_debug, debug_460
    rx536_cur."!cursor_debug"("NEXT", "")
  debug_460:
  rx536_fail:
    (rx536_rep, rx536_pos, $I10, $P10) = rx536_cur."!mark_fail"(0)
    lt rx536_pos, -1, rx536_done
    eq rx536_pos, -1, rx536_fail
    jump $I10
  rx536_done:
    rx536_cur."!cursor_fail"()
    if_null rx536_debug, debug_461
    rx536_cur."!cursor_debug"("FAIL", "")
  debug_461:
    .return (rx536_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "cclass_elem"  :subid("156_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .const 'Sub' $P553 = "158_1297880735.27967" 
    capture_lex $P553
    .local string rx542_tgt
    .local int rx542_pos
    .local int rx542_off
    .local int rx542_eos
    .local int rx542_rep
    .local pmc rx542_cur
    .local pmc rx542_debug
    (rx542_cur, rx542_pos, rx542_tgt, $I10) = self."!cursor_start"()
    rx542_cur."!cursor_caparray"("charspec")
    getattribute rx542_debug, rx542_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx542_cur
    .local pmc match
    .lex "$/", match
    length rx542_eos, rx542_tgt
    gt rx542_pos, rx542_eos, rx542_done
    set rx542_off, 0
    lt rx542_pos, 2, rx542_start
    sub rx542_off, rx542_pos, 1
    substr rx542_tgt, rx542_tgt, rx542_off
  rx542_start:
    eq $I10, 1, rx542_restart
    if_null rx542_debug, debug_465
    rx542_cur."!cursor_debug"("START", "cclass_elem")
  debug_465:
    $I10 = self.'from'()
    ne $I10, -1, rxscan545_done
    goto rxscan545_scan
  rxscan545_loop:
    ($P10) = rx542_cur."from"()
    inc $P10
    set rx542_pos, $P10
    ge rx542_pos, rx542_eos, rxscan545_done
  rxscan545_scan:
    set_addr $I10, rxscan545_loop
    rx542_cur."!mark_push"(0, rx542_pos, $I10)
  rxscan545_done:
.annotate 'line', 177
  # rx subcapture "sign"
    set_addr $I10, rxcap_547_fail
    rx542_cur."!mark_push"(0, rx542_pos, $I10)
  alt546_0:
    set_addr $I10, alt546_1
    rx542_cur."!mark_push"(0, rx542_pos, $I10)
  # rx literal  "+"
    add $I11, rx542_pos, 1
    gt $I11, rx542_eos, rx542_fail
    sub $I11, rx542_pos, rx542_off
    ord $I11, rx542_tgt, $I11
    ne $I11, 43, rx542_fail
    add rx542_pos, 1
    goto alt546_end
  alt546_1:
    set_addr $I10, alt546_2
    rx542_cur."!mark_push"(0, rx542_pos, $I10)
  # rx literal  "-"
    add $I11, rx542_pos, 1
    gt $I11, rx542_eos, rx542_fail
    sub $I11, rx542_pos, rx542_off
    ord $I11, rx542_tgt, $I11
    ne $I11, 45, rx542_fail
    add rx542_pos, 1
    goto alt546_end
  alt546_2:
  alt546_end:
    set_addr $I10, rxcap_547_fail
    ($I12, $I11) = rx542_cur."!mark_peek"($I10)
    rx542_cur."!cursor_pos"($I11)
    ($P10) = rx542_cur."!cursor_start"()
    $P10."!cursor_pass"(rx542_pos, "")
    rx542_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sign")
    goto rxcap_547_done
  rxcap_547_fail:
    goto rx542_fail
  rxcap_547_done:
.annotate 'line', 178
  # rx rxquantr548 ** 0..1
    set_addr $I10, rxquantr548_done
    rx542_cur."!mark_push"(0, rx542_pos, $I10)
  rxquantr548_loop:
  # rx subrule "normspace" subtype=method negate=
    rx542_cur."!cursor_pos"(rx542_pos)
    $P10 = rx542_cur."normspace"()
    unless $P10, rx542_fail
    goto rxsubrule549_pass
  rxsubrule549_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx542_fail
  rxsubrule549_pass:
    set_addr $I10, rxsubrule549_back
    rx542_cur."!mark_push"(0, rx542_pos, $I10, $P10)
    rx542_pos = $P10."pos"()
    set_addr $I10, rxquantr548_done
    (rx542_rep) = rx542_cur."!mark_commit"($I10)
  rxquantr548_done:
  alt550_0:
.annotate 'line', 179
    set_addr $I10, alt550_1
    rx542_cur."!mark_push"(0, rx542_pos, $I10)
.annotate 'line', 180
  # rx literal  "["
    add $I11, rx542_pos, 1
    gt $I11, rx542_eos, rx542_fail
    sub $I11, rx542_pos, rx542_off
    ord $I11, rx542_tgt, $I11
    ne $I11, 91, rx542_fail
    add rx542_pos, 1
.annotate 'line', 183
  # rx rxquantr551 ** 0..*
    set_addr $I10, rxquantr551_done
    rx542_cur."!mark_push"(0, rx542_pos, $I10)
  rxquantr551_loop:
.annotate 'line', 180
  # rx subrule $P553 subtype=capture negate=
    rx542_cur."!cursor_pos"(rx542_pos)
    .const 'Sub' $P553 = "158_1297880735.27967" 
    capture_lex $P553
    $P10 = rx542_cur.$P553()
    unless $P10, rx542_fail
    goto rxsubrule571_pass
  rxsubrule571_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx542_fail
  rxsubrule571_pass:
    set_addr $I10, rxsubrule571_back
    rx542_cur."!mark_push"(0, rx542_pos, $I10, $P10)
    $P10."!cursor_names"("charspec")
    rx542_pos = $P10."pos"()
.annotate 'line', 183
    set_addr $I10, rxquantr551_done
    (rx542_rep) = rx542_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr551_done
    rx542_cur."!mark_push"(rx542_rep, rx542_pos, $I10)
    goto rxquantr551_loop
  rxquantr551_done:
.annotate 'line', 184
  # rx charclass_q s r 0..-1
    sub $I10, rx542_pos, rx542_off
    find_not_cclass $I11, 32, rx542_tgt, $I10, rx542_eos
    add rx542_pos, rx542_off, $I11
  # rx literal  "]"
    add $I11, rx542_pos, 1
    gt $I11, rx542_eos, rx542_fail
    sub $I11, rx542_pos, rx542_off
    ord $I11, rx542_tgt, $I11
    ne $I11, 93, rx542_fail
    add rx542_pos, 1
.annotate 'line', 180
    goto alt550_end
  alt550_1:
.annotate 'line', 185
  # rx subcapture "name"
    set_addr $I10, rxcap_572_fail
    rx542_cur."!mark_push"(0, rx542_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx542_pos, rx542_off
    find_not_cclass $I11, 8192, rx542_tgt, $I10, rx542_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx542_fail
    add rx542_pos, rx542_off, $I11
    set_addr $I10, rxcap_572_fail
    ($I12, $I11) = rx542_cur."!mark_peek"($I10)
    rx542_cur."!cursor_pos"($I11)
    ($P10) = rx542_cur."!cursor_start"()
    $P10."!cursor_pass"(rx542_pos, "")
    rx542_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_572_done
  rxcap_572_fail:
    goto rx542_fail
  rxcap_572_done:
  alt550_end:
.annotate 'line', 187
  # rx rxquantr573 ** 0..1
    set_addr $I10, rxquantr573_done
    rx542_cur."!mark_push"(0, rx542_pos, $I10)
  rxquantr573_loop:
  # rx subrule "normspace" subtype=method negate=
    rx542_cur."!cursor_pos"(rx542_pos)
    $P10 = rx542_cur."normspace"()
    unless $P10, rx542_fail
    goto rxsubrule574_pass
  rxsubrule574_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx542_fail
  rxsubrule574_pass:
    set_addr $I10, rxsubrule574_back
    rx542_cur."!mark_push"(0, rx542_pos, $I10, $P10)
    rx542_pos = $P10."pos"()
    set_addr $I10, rxquantr573_done
    (rx542_rep) = rx542_cur."!mark_commit"($I10)
  rxquantr573_done:
.annotate 'line', 176
  # rx pass
    rx542_cur."!cursor_pass"(rx542_pos, "cclass_elem")
    if_null rx542_debug, debug_482
    rx542_cur."!cursor_debug"("PASS", "cclass_elem", " at pos=", rx542_pos)
  debug_482:
    .return (rx542_cur)
  rx542_restart:
.annotate 'line', 3
    if_null rx542_debug, debug_483
    rx542_cur."!cursor_debug"("NEXT", "cclass_elem")
  debug_483:
  rx542_fail:
    (rx542_rep, rx542_pos, $I10, $P10) = rx542_cur."!mark_fail"(0)
    lt rx542_pos, -1, rx542_done
    eq rx542_pos, -1, rx542_fail
    jump $I10
  rx542_done:
    rx542_cur."!cursor_fail"()
    if_null rx542_debug, debug_484
    rx542_cur."!cursor_debug"("FAIL", "cclass_elem")
  debug_484:
    .return (rx542_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__cclass_elem"  :subid("157_1297880735.27967") :method
.annotate 'line', 3
    new $P544, "ResizablePMCArray"
    push $P544, ""
    push $P544, "-"
    push $P544, "+"
    .return ($P544)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block552"  :anon :subid("158_1297880735.27967") :method :outer("156_1297880735.27967")
.annotate 'line', 180
    .const 'Sub' $P568 = "161_1297880735.27967" 
    capture_lex $P568
    .const 'Sub' $P563 = "160_1297880735.27967" 
    capture_lex $P563
    .const 'Sub' $P559 = "159_1297880735.27967" 
    capture_lex $P559
    .local string rx554_tgt
    .local int rx554_pos
    .local int rx554_off
    .local int rx554_eos
    .local int rx554_rep
    .local pmc rx554_cur
    .local pmc rx554_debug
    (rx554_cur, rx554_pos, rx554_tgt, $I10) = self."!cursor_start"()
    rx554_cur."!cursor_caparray"("1")
    getattribute rx554_debug, rx554_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx554_cur
    .local pmc match
    .lex "$/", match
    length rx554_eos, rx554_tgt
    gt rx554_pos, rx554_eos, rx554_done
    set rx554_off, 0
    lt rx554_pos, 2, rx554_start
    sub rx554_off, rx554_pos, 1
    substr rx554_tgt, rx554_tgt, rx554_off
  rx554_start:
    eq $I10, 1, rx554_restart
    if_null rx554_debug, debug_466
    rx554_cur."!cursor_debug"("START", "")
  debug_466:
    $I10 = self.'from'()
    ne $I10, -1, rxscan555_done
    goto rxscan555_scan
  rxscan555_loop:
    ($P10) = rx554_cur."from"()
    inc $P10
    set rx554_pos, $P10
    ge rx554_pos, rx554_eos, rxscan555_done
  rxscan555_scan:
    set_addr $I10, rxscan555_loop
    rx554_cur."!mark_push"(0, rx554_pos, $I10)
  rxscan555_done:
  alt556_0:
    set_addr $I10, alt556_1
    rx554_cur."!mark_push"(0, rx554_pos, $I10)
.annotate 'line', 181
  # rx charclass_q s r 0..-1
    sub $I10, rx554_pos, rx554_off
    find_not_cclass $I11, 32, rx554_tgt, $I10, rx554_eos
    add rx554_pos, rx554_off, $I11
  # rx literal  "-"
    add $I11, rx554_pos, 1
    gt $I11, rx554_eos, rx554_fail
    sub $I11, rx554_pos, rx554_off
    ord $I11, rx554_tgt, $I11
    ne $I11, 45, rx554_fail
    add rx554_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx554_cur."!cursor_pos"(rx554_pos)
    $P10 = rx554_cur."obs"("- as character range", "..")
    unless $P10, rx554_fail
    rx554_pos = $P10."pos"()
    goto alt556_end
  alt556_1:
.annotate 'line', 182
  # rx charclass_q s r 0..-1
    sub $I10, rx554_pos, rx554_off
    find_not_cclass $I11, 32, rx554_tgt, $I10, rx554_eos
    add rx554_pos, rx554_off, $I11
  alt557_0:
    set_addr $I10, alt557_1
    rx554_cur."!mark_push"(0, rx554_pos, $I10)
  # rx literal  "\\"
    add $I11, rx554_pos, 1
    gt $I11, rx554_eos, rx554_fail
    sub $I11, rx554_pos, rx554_off
    ord $I11, rx554_tgt, $I11
    ne $I11, 92, rx554_fail
    add rx554_pos, 1
  # rx subrule $P559 subtype=capture negate=
    rx554_cur."!cursor_pos"(rx554_pos)
    .const 'Sub' $P559 = "159_1297880735.27967" 
    capture_lex $P559
    $P10 = rx554_cur.$P559()
    unless $P10, rx554_fail
    rx554_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"(0)
    rx554_pos = $P10."pos"()
    goto alt557_end
  alt557_1:
  # rx subrule $P563 subtype=capture negate=
    rx554_cur."!cursor_pos"(rx554_pos)
    .const 'Sub' $P563 = "160_1297880735.27967" 
    capture_lex $P563
    $P10 = rx554_cur.$P563()
    unless $P10, rx554_fail
    rx554_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"(0)
    rx554_pos = $P10."pos"()
  alt557_end:
  # rx rxquantr566 ** 0..1
    set_addr $I10, rxquantr566_done
    rx554_cur."!mark_push"(0, rx554_pos, $I10)
  rxquantr566_loop:
  # rx charclass_q s r 0..-1
    sub $I10, rx554_pos, rx554_off
    find_not_cclass $I11, 32, rx554_tgt, $I10, rx554_eos
    add rx554_pos, rx554_off, $I11
  # rx literal  ".."
    add $I11, rx554_pos, 2
    gt $I11, rx554_eos, rx554_fail
    sub $I11, rx554_pos, rx554_off
    substr $S10, rx554_tgt, $I11, 2
    ne $S10, "..", rx554_fail
    add rx554_pos, 2
  # rx charclass_q s r 0..-1
    sub $I10, rx554_pos, rx554_off
    find_not_cclass $I11, 32, rx554_tgt, $I10, rx554_eos
    add rx554_pos, rx554_off, $I11
  # rx subrule $P568 subtype=capture negate=
    rx554_cur."!cursor_pos"(rx554_pos)
    .const 'Sub' $P568 = "161_1297880735.27967" 
    capture_lex $P568
    $P10 = rx554_cur.$P568()
    unless $P10, rx554_fail
    rx554_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("1")
    rx554_pos = $P10."pos"()
    set_addr $I10, rxquantr566_done
    (rx554_rep) = rx554_cur."!mark_commit"($I10)
  rxquantr566_done:
  alt556_end:
.annotate 'line', 180
  # rx pass
    rx554_cur."!cursor_pass"(rx554_pos, "")
    if_null rx554_debug, debug_479
    rx554_cur."!cursor_debug"("PASS", "", " at pos=", rx554_pos)
  debug_479:
    .return (rx554_cur)
  rx554_restart:
    if_null rx554_debug, debug_480
    rx554_cur."!cursor_debug"("NEXT", "")
  debug_480:
  rx554_fail:
    (rx554_rep, rx554_pos, $I10, $P10) = rx554_cur."!mark_fail"(0)
    lt rx554_pos, -1, rx554_done
    eq rx554_pos, -1, rx554_fail
    jump $I10
  rx554_done:
    rx554_cur."!cursor_fail"()
    if_null rx554_debug, debug_481
    rx554_cur."!cursor_debug"("FAIL", "")
  debug_481:
    .return (rx554_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block558"  :anon :subid("159_1297880735.27967") :method :outer("158_1297880735.27967")
.annotate 'line', 182
    .local string rx560_tgt
    .local int rx560_pos
    .local int rx560_off
    .local int rx560_eos
    .local int rx560_rep
    .local pmc rx560_cur
    .local pmc rx560_debug
    (rx560_cur, rx560_pos, rx560_tgt, $I10) = self."!cursor_start"()
    getattribute rx560_debug, rx560_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx560_cur
    .local pmc match
    .lex "$/", match
    length rx560_eos, rx560_tgt
    gt rx560_pos, rx560_eos, rx560_done
    set rx560_off, 0
    lt rx560_pos, 2, rx560_start
    sub rx560_off, rx560_pos, 1
    substr rx560_tgt, rx560_tgt, rx560_off
  rx560_start:
    eq $I10, 1, rx560_restart
    if_null rx560_debug, debug_467
    rx560_cur."!cursor_debug"("START", "")
  debug_467:
    $I10 = self.'from'()
    ne $I10, -1, rxscan561_done
    goto rxscan561_scan
  rxscan561_loop:
    ($P10) = rx560_cur."from"()
    inc $P10
    set rx560_pos, $P10
    ge rx560_pos, rx560_eos, rxscan561_done
  rxscan561_scan:
    set_addr $I10, rxscan561_loop
    rx560_cur."!mark_push"(0, rx560_pos, $I10)
  rxscan561_done:
  # rx charclass .
    ge rx560_pos, rx560_eos, rx560_fail
    inc rx560_pos
  # rx pass
    rx560_cur."!cursor_pass"(rx560_pos, "")
    if_null rx560_debug, debug_468
    rx560_cur."!cursor_debug"("PASS", "", " at pos=", rx560_pos)
  debug_468:
    .return (rx560_cur)
  rx560_restart:
    if_null rx560_debug, debug_469
    rx560_cur."!cursor_debug"("NEXT", "")
  debug_469:
  rx560_fail:
    (rx560_rep, rx560_pos, $I10, $P10) = rx560_cur."!mark_fail"(0)
    lt rx560_pos, -1, rx560_done
    eq rx560_pos, -1, rx560_fail
    jump $I10
  rx560_done:
    rx560_cur."!cursor_fail"()
    if_null rx560_debug, debug_470
    rx560_cur."!cursor_debug"("FAIL", "")
  debug_470:
    .return (rx560_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block562"  :anon :subid("160_1297880735.27967") :method :outer("158_1297880735.27967")
.annotate 'line', 182
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
    if_null rx564_debug, debug_471
    rx564_cur."!cursor_debug"("START", "")
  debug_471:
    $I10 = self.'from'()
    ne $I10, -1, rxscan565_done
    goto rxscan565_scan
  rxscan565_loop:
    ($P10) = rx564_cur."from"()
    inc $P10
    set rx564_pos, $P10
    ge rx564_pos, rx564_eos, rxscan565_done
  rxscan565_scan:
    set_addr $I10, rxscan565_loop
    rx564_cur."!mark_push"(0, rx564_pos, $I10)
  rxscan565_done:
  # rx enumcharlist negate=1 
    ge rx564_pos, rx564_eos, rx564_fail
    sub $I10, rx564_pos, rx564_off
    substr $S10, rx564_tgt, $I10, 1
    index $I11, "]\\", $S10
    ge $I11, 0, rx564_fail
    inc rx564_pos
  # rx pass
    rx564_cur."!cursor_pass"(rx564_pos, "")
    if_null rx564_debug, debug_472
    rx564_cur."!cursor_debug"("PASS", "", " at pos=", rx564_pos)
  debug_472:
    .return (rx564_cur)
  rx564_restart:
    if_null rx564_debug, debug_473
    rx564_cur."!cursor_debug"("NEXT", "")
  debug_473:
  rx564_fail:
    (rx564_rep, rx564_pos, $I10, $P10) = rx564_cur."!mark_fail"(0)
    lt rx564_pos, -1, rx564_done
    eq rx564_pos, -1, rx564_fail
    jump $I10
  rx564_done:
    rx564_cur."!cursor_fail"()
    if_null rx564_debug, debug_474
    rx564_cur."!cursor_debug"("FAIL", "")
  debug_474:
    .return (rx564_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block567"  :anon :subid("161_1297880735.27967") :method :outer("158_1297880735.27967")
.annotate 'line', 182
    .local string rx569_tgt
    .local int rx569_pos
    .local int rx569_off
    .local int rx569_eos
    .local int rx569_rep
    .local pmc rx569_cur
    .local pmc rx569_debug
    (rx569_cur, rx569_pos, rx569_tgt, $I10) = self."!cursor_start"()
    getattribute rx569_debug, rx569_cur, "$!debug"
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
    eq $I10, 1, rx569_restart
    if_null rx569_debug, debug_475
    rx569_cur."!cursor_debug"("START", "")
  debug_475:
    $I10 = self.'from'()
    ne $I10, -1, rxscan570_done
    goto rxscan570_scan
  rxscan570_loop:
    ($P10) = rx569_cur."from"()
    inc $P10
    set rx569_pos, $P10
    ge rx569_pos, rx569_eos, rxscan570_done
  rxscan570_scan:
    set_addr $I10, rxscan570_loop
    rx569_cur."!mark_push"(0, rx569_pos, $I10)
  rxscan570_done:
  # rx charclass .
    ge rx569_pos, rx569_eos, rx569_fail
    inc rx569_pos
  # rx pass
    rx569_cur."!cursor_pass"(rx569_pos, "")
    if_null rx569_debug, debug_476
    rx569_cur."!cursor_debug"("PASS", "", " at pos=", rx569_pos)
  debug_476:
    .return (rx569_cur)
  rx569_restart:
    if_null rx569_debug, debug_477
    rx569_cur."!cursor_debug"("NEXT", "")
  debug_477:
  rx569_fail:
    (rx569_rep, rx569_pos, $I10, $P10) = rx569_cur."!mark_fail"(0)
    lt rx569_pos, -1, rx569_done
    eq rx569_pos, -1, rx569_fail
    jump $I10
  rx569_done:
    rx569_cur."!cursor_fail"()
    if_null rx569_debug, debug_478
    rx569_cur."!cursor_debug"("FAIL", "")
  debug_478:
    .return (rx569_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_internal"  :subid("162_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .const 'Sub' $P584 = "164_1297880735.27967" 
    capture_lex $P584
    .local string rx576_tgt
    .local int rx576_pos
    .local int rx576_off
    .local int rx576_eos
    .local int rx576_rep
    .local pmc rx576_cur
    .local pmc rx576_debug
    (rx576_cur, rx576_pos, rx576_tgt, $I10) = self."!cursor_start"()
    rx576_cur."!cursor_caparray"("n")
    getattribute rx576_debug, rx576_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx576_cur
    .local pmc match
    .lex "$/", match
    length rx576_eos, rx576_tgt
    gt rx576_pos, rx576_eos, rx576_done
    set rx576_off, 0
    lt rx576_pos, 2, rx576_start
    sub rx576_off, rx576_pos, 1
    substr rx576_tgt, rx576_tgt, rx576_off
  rx576_start:
    eq $I10, 1, rx576_restart
    if_null rx576_debug, debug_485
    rx576_cur."!cursor_debug"("START", "mod_internal")
  debug_485:
    $I10 = self.'from'()
    ne $I10, -1, rxscan580_done
    goto rxscan580_scan
  rxscan580_loop:
    ($P10) = rx576_cur."from"()
    inc $P10
    set rx576_pos, $P10
    ge rx576_pos, rx576_eos, rxscan580_done
  rxscan580_scan:
    set_addr $I10, rxscan580_loop
    rx576_cur."!mark_push"(0, rx576_pos, $I10)
  rxscan580_done:
  alt581_0:
.annotate 'line', 191
    set_addr $I10, alt581_1
    rx576_cur."!mark_push"(0, rx576_pos, $I10)
.annotate 'line', 192
  # rx literal  ":"
    add $I11, rx576_pos, 1
    gt $I11, rx576_eos, rx576_fail
    sub $I11, rx576_pos, rx576_off
    ord $I11, rx576_tgt, $I11
    ne $I11, 58, rx576_fail
    add rx576_pos, 1
  # rx rxquantr582 ** 1..1
    set_addr $I10, rxquantr582_done
    rx576_cur."!mark_push"(0, -1, $I10)
  rxquantr582_loop:
  # rx subrule $P584 subtype=capture negate=
    rx576_cur."!cursor_pos"(rx576_pos)
    .const 'Sub' $P584 = "164_1297880735.27967" 
    capture_lex $P584
    $P10 = rx576_cur.$P584()
    unless $P10, rx576_fail
    goto rxsubrule588_pass
  rxsubrule588_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx576_fail
  rxsubrule588_pass:
    set_addr $I10, rxsubrule588_back
    rx576_cur."!mark_push"(0, rx576_pos, $I10, $P10)
    $P10."!cursor_names"("n")
    rx576_pos = $P10."pos"()
    set_addr $I10, rxquantr582_done
    (rx576_rep) = rx576_cur."!mark_commit"($I10)
  rxquantr582_done:
  # rx subrule "mod_ident" subtype=capture negate=
    rx576_cur."!cursor_pos"(rx576_pos)
    $P10 = rx576_cur."mod_ident"()
    unless $P10, rx576_fail
    rx576_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_ident")
    rx576_pos = $P10."pos"()
  # rxanchor rwb
    le rx576_pos, 0, rx576_fail
    sub $I10, rx576_pos, rx576_off
    is_cclass $I11, 8192, rx576_tgt, $I10
    if $I11, rx576_fail
    dec $I10
    is_cclass $I11, 8192, rx576_tgt, $I10
    unless $I11, rx576_fail
    goto alt581_end
  alt581_1:
.annotate 'line', 193
  # rx literal  ":"
    add $I11, rx576_pos, 1
    gt $I11, rx576_eos, rx576_fail
    sub $I11, rx576_pos, rx576_off
    ord $I11, rx576_tgt, $I11
    ne $I11, 58, rx576_fail
    add rx576_pos, 1
  # rx subrule "mod_ident" subtype=capture negate=
    rx576_cur."!cursor_pos"(rx576_pos)
    $P10 = rx576_cur."mod_ident"()
    unless $P10, rx576_fail
    rx576_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_ident")
    rx576_pos = $P10."pos"()
  # rx rxquantr589 ** 0..1
    set_addr $I10, rxquantr589_done
    rx576_cur."!mark_push"(0, rx576_pos, $I10)
  rxquantr589_loop:
  # rx literal  "("
    add $I11, rx576_pos, 1
    gt $I11, rx576_eos, rx576_fail
    sub $I11, rx576_pos, rx576_off
    ord $I11, rx576_tgt, $I11
    ne $I11, 40, rx576_fail
    add rx576_pos, 1
  # rx subcapture "n"
    set_addr $I10, rxcap_590_fail
    rx576_cur."!mark_push"(0, rx576_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx576_pos, rx576_off
    find_not_cclass $I11, 8, rx576_tgt, $I10, rx576_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx576_fail
    add rx576_pos, rx576_off, $I11
    set_addr $I10, rxcap_590_fail
    ($I12, $I11) = rx576_cur."!mark_peek"($I10)
    rx576_cur."!cursor_pos"($I11)
    ($P10) = rx576_cur."!cursor_start"()
    $P10."!cursor_pass"(rx576_pos, "")
    rx576_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("n")
    goto rxcap_590_done
  rxcap_590_fail:
    goto rx576_fail
  rxcap_590_done:
  # rx literal  ")"
    add $I11, rx576_pos, 1
    gt $I11, rx576_eos, rx576_fail
    sub $I11, rx576_pos, rx576_off
    ord $I11, rx576_tgt, $I11
    ne $I11, 41, rx576_fail
    add rx576_pos, 1
    set_addr $I10, rxquantr589_done
    (rx576_rep) = rx576_cur."!mark_commit"($I10)
  rxquantr589_done:
  alt581_end:
.annotate 'line', 190
  # rx pass
    rx576_cur."!cursor_pass"(rx576_pos, "mod_internal")
    if_null rx576_debug, debug_490
    rx576_cur."!cursor_debug"("PASS", "mod_internal", " at pos=", rx576_pos)
  debug_490:
    .return (rx576_cur)
  rx576_restart:
.annotate 'line', 3
    if_null rx576_debug, debug_491
    rx576_cur."!cursor_debug"("NEXT", "mod_internal")
  debug_491:
  rx576_fail:
    (rx576_rep, rx576_pos, $I10, $P10) = rx576_cur."!mark_fail"(0)
    lt rx576_pos, -1, rx576_done
    eq rx576_pos, -1, rx576_fail
    jump $I10
  rx576_done:
    rx576_cur."!cursor_fail"()
    if_null rx576_debug, debug_492
    rx576_cur."!cursor_debug"("FAIL", "mod_internal")
  debug_492:
    .return (rx576_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_internal"  :subid("163_1297880735.27967") :method
.annotate 'line', 3
    $P578 = self."!PREFIX__!subrule"("mod_ident", ":")
    new $P579, "ResizablePMCArray"
    push $P579, $P578
    push $P579, ":"
    .return ($P579)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block583"  :anon :subid("164_1297880735.27967") :method :outer("162_1297880735.27967")
.annotate 'line', 192
    .local string rx585_tgt
    .local int rx585_pos
    .local int rx585_off
    .local int rx585_eos
    .local int rx585_rep
    .local pmc rx585_cur
    .local pmc rx585_debug
    (rx585_cur, rx585_pos, rx585_tgt, $I10) = self."!cursor_start"()
    getattribute rx585_debug, rx585_cur, "$!debug"
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
    eq $I10, 1, rx585_restart
    if_null rx585_debug, debug_486
    rx585_cur."!cursor_debug"("START", "")
  debug_486:
    $I10 = self.'from'()
    ne $I10, -1, rxscan586_done
    goto rxscan586_scan
  rxscan586_loop:
    ($P10) = rx585_cur."from"()
    inc $P10
    set rx585_pos, $P10
    ge rx585_pos, rx585_eos, rxscan586_done
  rxscan586_scan:
    set_addr $I10, rxscan586_loop
    rx585_cur."!mark_push"(0, rx585_pos, $I10)
  rxscan586_done:
  alt587_0:
    set_addr $I10, alt587_1
    rx585_cur."!mark_push"(0, rx585_pos, $I10)
  # rx literal  "!"
    add $I11, rx585_pos, 1
    gt $I11, rx585_eos, rx585_fail
    sub $I11, rx585_pos, rx585_off
    ord $I11, rx585_tgt, $I11
    ne $I11, 33, rx585_fail
    add rx585_pos, 1
    goto alt587_end
  alt587_1:
  # rx charclass_q d r 1..-1
    sub $I10, rx585_pos, rx585_off
    find_not_cclass $I11, 8, rx585_tgt, $I10, rx585_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx585_fail
    add rx585_pos, rx585_off, $I11
  alt587_end:
  # rx pass
    rx585_cur."!cursor_pass"(rx585_pos, "")
    if_null rx585_debug, debug_487
    rx585_cur."!cursor_debug"("PASS", "", " at pos=", rx585_pos)
  debug_487:
    .return (rx585_cur)
  rx585_restart:
    if_null rx585_debug, debug_488
    rx585_cur."!cursor_debug"("NEXT", "")
  debug_488:
  rx585_fail:
    (rx585_rep, rx585_pos, $I10, $P10) = rx585_cur."!mark_fail"(0)
    lt rx585_pos, -1, rx585_done
    eq rx585_pos, -1, rx585_fail
    jump $I10
  rx585_done:
    rx585_cur."!cursor_fail"()
    if_null rx585_debug, debug_489
    rx585_cur."!cursor_debug"("FAIL", "")
  debug_489:
    .return (rx585_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident"  :subid("165_1297880735.27967") :method
.annotate 'line', 197
    $P592 = self."!protoregex"("mod_ident")
    .return ($P592)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident"  :subid("166_1297880735.27967") :method
.annotate 'line', 197
    $P594 = self."!PREFIX__!protoregex"("mod_ident")
    .return ($P594)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ignorecase>"  :subid("167_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx596_tgt
    .local int rx596_pos
    .local int rx596_off
    .local int rx596_eos
    .local int rx596_rep
    .local pmc rx596_cur
    .local pmc rx596_debug
    (rx596_cur, rx596_pos, rx596_tgt, $I10) = self."!cursor_start"()
    getattribute rx596_debug, rx596_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx596_cur
    .local pmc match
    .lex "$/", match
    length rx596_eos, rx596_tgt
    gt rx596_pos, rx596_eos, rx596_done
    set rx596_off, 0
    lt rx596_pos, 2, rx596_start
    sub rx596_off, rx596_pos, 1
    substr rx596_tgt, rx596_tgt, rx596_off
  rx596_start:
    eq $I10, 1, rx596_restart
    if_null rx596_debug, debug_493
    rx596_cur."!cursor_debug"("START", "mod_ident:sym<ignorecase>")
  debug_493:
    $I10 = self.'from'()
    ne $I10, -1, rxscan599_done
    goto rxscan599_scan
  rxscan599_loop:
    ($P10) = rx596_cur."from"()
    inc $P10
    set rx596_pos, $P10
    ge rx596_pos, rx596_eos, rxscan599_done
  rxscan599_scan:
    set_addr $I10, rxscan599_loop
    rx596_cur."!mark_push"(0, rx596_pos, $I10)
  rxscan599_done:
.annotate 'line', 198
  # rx subcapture "sym"
    set_addr $I10, rxcap_600_fail
    rx596_cur."!mark_push"(0, rx596_pos, $I10)
  # rx literal  "i"
    add $I11, rx596_pos, 1
    gt $I11, rx596_eos, rx596_fail
    sub $I11, rx596_pos, rx596_off
    ord $I11, rx596_tgt, $I11
    ne $I11, 105, rx596_fail
    add rx596_pos, 1
    set_addr $I10, rxcap_600_fail
    ($I12, $I11) = rx596_cur."!mark_peek"($I10)
    rx596_cur."!cursor_pos"($I11)
    ($P10) = rx596_cur."!cursor_start"()
    $P10."!cursor_pass"(rx596_pos, "")
    rx596_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_600_done
  rxcap_600_fail:
    goto rx596_fail
  rxcap_600_done:
  # rx rxquantr601 ** 0..1
    set_addr $I10, rxquantr601_done
    rx596_cur."!mark_push"(0, rx596_pos, $I10)
  rxquantr601_loop:
  # rx literal  "gnorecase"
    add $I11, rx596_pos, 9
    gt $I11, rx596_eos, rx596_fail
    sub $I11, rx596_pos, rx596_off
    substr $S10, rx596_tgt, $I11, 9
    ne $S10, "gnorecase", rx596_fail
    add rx596_pos, 9
    set_addr $I10, rxquantr601_done
    (rx596_rep) = rx596_cur."!mark_commit"($I10)
  rxquantr601_done:
  # rx pass
    rx596_cur."!cursor_pass"(rx596_pos, "mod_ident:sym<ignorecase>")
    if_null rx596_debug, debug_494
    rx596_cur."!cursor_debug"("PASS", "mod_ident:sym<ignorecase>", " at pos=", rx596_pos)
  debug_494:
    .return (rx596_cur)
  rx596_restart:
.annotate 'line', 3
    if_null rx596_debug, debug_495
    rx596_cur."!cursor_debug"("NEXT", "mod_ident:sym<ignorecase>")
  debug_495:
  rx596_fail:
    (rx596_rep, rx596_pos, $I10, $P10) = rx596_cur."!mark_fail"(0)
    lt rx596_pos, -1, rx596_done
    eq rx596_pos, -1, rx596_fail
    jump $I10
  rx596_done:
    rx596_cur."!cursor_fail"()
    if_null rx596_debug, debug_496
    rx596_cur."!cursor_debug"("FAIL", "mod_ident:sym<ignorecase>")
  debug_496:
    .return (rx596_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident:sym<ignorecase>"  :subid("168_1297880735.27967") :method
.annotate 'line', 3
    new $P598, "ResizablePMCArray"
    push $P598, "i"
    .return ($P598)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ratchet>"  :subid("169_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx603_tgt
    .local int rx603_pos
    .local int rx603_off
    .local int rx603_eos
    .local int rx603_rep
    .local pmc rx603_cur
    .local pmc rx603_debug
    (rx603_cur, rx603_pos, rx603_tgt, $I10) = self."!cursor_start"()
    getattribute rx603_debug, rx603_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx603_cur
    .local pmc match
    .lex "$/", match
    length rx603_eos, rx603_tgt
    gt rx603_pos, rx603_eos, rx603_done
    set rx603_off, 0
    lt rx603_pos, 2, rx603_start
    sub rx603_off, rx603_pos, 1
    substr rx603_tgt, rx603_tgt, rx603_off
  rx603_start:
    eq $I10, 1, rx603_restart
    if_null rx603_debug, debug_497
    rx603_cur."!cursor_debug"("START", "mod_ident:sym<ratchet>")
  debug_497:
    $I10 = self.'from'()
    ne $I10, -1, rxscan606_done
    goto rxscan606_scan
  rxscan606_loop:
    ($P10) = rx603_cur."from"()
    inc $P10
    set rx603_pos, $P10
    ge rx603_pos, rx603_eos, rxscan606_done
  rxscan606_scan:
    set_addr $I10, rxscan606_loop
    rx603_cur."!mark_push"(0, rx603_pos, $I10)
  rxscan606_done:
.annotate 'line', 199
  # rx subcapture "sym"
    set_addr $I10, rxcap_607_fail
    rx603_cur."!mark_push"(0, rx603_pos, $I10)
  # rx literal  "r"
    add $I11, rx603_pos, 1
    gt $I11, rx603_eos, rx603_fail
    sub $I11, rx603_pos, rx603_off
    ord $I11, rx603_tgt, $I11
    ne $I11, 114, rx603_fail
    add rx603_pos, 1
    set_addr $I10, rxcap_607_fail
    ($I12, $I11) = rx603_cur."!mark_peek"($I10)
    rx603_cur."!cursor_pos"($I11)
    ($P10) = rx603_cur."!cursor_start"()
    $P10."!cursor_pass"(rx603_pos, "")
    rx603_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_607_done
  rxcap_607_fail:
    goto rx603_fail
  rxcap_607_done:
  # rx rxquantr608 ** 0..1
    set_addr $I10, rxquantr608_done
    rx603_cur."!mark_push"(0, rx603_pos, $I10)
  rxquantr608_loop:
  # rx literal  "atchet"
    add $I11, rx603_pos, 6
    gt $I11, rx603_eos, rx603_fail
    sub $I11, rx603_pos, rx603_off
    substr $S10, rx603_tgt, $I11, 6
    ne $S10, "atchet", rx603_fail
    add rx603_pos, 6
    set_addr $I10, rxquantr608_done
    (rx603_rep) = rx603_cur."!mark_commit"($I10)
  rxquantr608_done:
  # rx pass
    rx603_cur."!cursor_pass"(rx603_pos, "mod_ident:sym<ratchet>")
    if_null rx603_debug, debug_498
    rx603_cur."!cursor_debug"("PASS", "mod_ident:sym<ratchet>", " at pos=", rx603_pos)
  debug_498:
    .return (rx603_cur)
  rx603_restart:
.annotate 'line', 3
    if_null rx603_debug, debug_499
    rx603_cur."!cursor_debug"("NEXT", "mod_ident:sym<ratchet>")
  debug_499:
  rx603_fail:
    (rx603_rep, rx603_pos, $I10, $P10) = rx603_cur."!mark_fail"(0)
    lt rx603_pos, -1, rx603_done
    eq rx603_pos, -1, rx603_fail
    jump $I10
  rx603_done:
    rx603_cur."!cursor_fail"()
    if_null rx603_debug, debug_500
    rx603_cur."!cursor_debug"("FAIL", "mod_ident:sym<ratchet>")
  debug_500:
    .return (rx603_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident:sym<ratchet>"  :subid("170_1297880735.27967") :method
.annotate 'line', 3
    new $P605, "ResizablePMCArray"
    push $P605, "r"
    .return ($P605)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<sigspace>"  :subid("171_1297880735.27967") :method :outer("11_1297880735.27967")
.annotate 'line', 3
    .local string rx610_tgt
    .local int rx610_pos
    .local int rx610_off
    .local int rx610_eos
    .local int rx610_rep
    .local pmc rx610_cur
    .local pmc rx610_debug
    (rx610_cur, rx610_pos, rx610_tgt, $I10) = self."!cursor_start"()
    getattribute rx610_debug, rx610_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx610_cur
    .local pmc match
    .lex "$/", match
    length rx610_eos, rx610_tgt
    gt rx610_pos, rx610_eos, rx610_done
    set rx610_off, 0
    lt rx610_pos, 2, rx610_start
    sub rx610_off, rx610_pos, 1
    substr rx610_tgt, rx610_tgt, rx610_off
  rx610_start:
    eq $I10, 1, rx610_restart
    if_null rx610_debug, debug_501
    rx610_cur."!cursor_debug"("START", "mod_ident:sym<sigspace>")
  debug_501:
    $I10 = self.'from'()
    ne $I10, -1, rxscan613_done
    goto rxscan613_scan
  rxscan613_loop:
    ($P10) = rx610_cur."from"()
    inc $P10
    set rx610_pos, $P10
    ge rx610_pos, rx610_eos, rxscan613_done
  rxscan613_scan:
    set_addr $I10, rxscan613_loop
    rx610_cur."!mark_push"(0, rx610_pos, $I10)
  rxscan613_done:
.annotate 'line', 200
  # rx subcapture "sym"
    set_addr $I10, rxcap_614_fail
    rx610_cur."!mark_push"(0, rx610_pos, $I10)
  # rx literal  "s"
    add $I11, rx610_pos, 1
    gt $I11, rx610_eos, rx610_fail
    sub $I11, rx610_pos, rx610_off
    ord $I11, rx610_tgt, $I11
    ne $I11, 115, rx610_fail
    add rx610_pos, 1
    set_addr $I10, rxcap_614_fail
    ($I12, $I11) = rx610_cur."!mark_peek"($I10)
    rx610_cur."!cursor_pos"($I11)
    ($P10) = rx610_cur."!cursor_start"()
    $P10."!cursor_pass"(rx610_pos, "")
    rx610_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_614_done
  rxcap_614_fail:
    goto rx610_fail
  rxcap_614_done:
  # rx rxquantr615 ** 0..1
    set_addr $I10, rxquantr615_done
    rx610_cur."!mark_push"(0, rx610_pos, $I10)
  rxquantr615_loop:
  # rx literal  "igspace"
    add $I11, rx610_pos, 7
    gt $I11, rx610_eos, rx610_fail
    sub $I11, rx610_pos, rx610_off
    substr $S10, rx610_tgt, $I11, 7
    ne $S10, "igspace", rx610_fail
    add rx610_pos, 7
    set_addr $I10, rxquantr615_done
    (rx610_rep) = rx610_cur."!mark_commit"($I10)
  rxquantr615_done:
  # rx pass
    rx610_cur."!cursor_pass"(rx610_pos, "mod_ident:sym<sigspace>")
    if_null rx610_debug, debug_502
    rx610_cur."!cursor_debug"("PASS", "mod_ident:sym<sigspace>", " at pos=", rx610_pos)
  debug_502:
    .return (rx610_cur)
  rx610_restart:
.annotate 'line', 3
    if_null rx610_debug, debug_503
    rx610_cur."!cursor_debug"("NEXT", "mod_ident:sym<sigspace>")
  debug_503:
  rx610_fail:
    (rx610_rep, rx610_pos, $I10, $P10) = rx610_cur."!mark_fail"(0)
    lt rx610_pos, -1, rx610_done
    eq rx610_pos, -1, rx610_fail
    jump $I10
  rx610_done:
    rx610_cur."!cursor_fail"()
    if_null rx610_debug, debug_504
    rx610_cur."!cursor_debug"("FAIL", "mod_ident:sym<sigspace>")
  debug_504:
    .return (rx610_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident:sym<sigspace>"  :subid("172_1297880735.27967") :method
.annotate 'line', 3
    new $P612, "ResizablePMCArray"
    push $P612, "s"
    .return ($P612)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block616" :load :anon :subid("173_1297880735.27967")
.annotate 'line', 3
    .const 'Sub' $P618 = "11_1297880735.27967" 
    $P619 = $P618()
    .return ($P619)
.end


.namespace []
.sub "_block621" :load :anon :subid("174_1297880735.27967")
.annotate 'line', 1
    .const 'Sub' $P623 = "10_1297880735.27967" 
    $P624 = $P623()
    .return ($P624)
.end

### .include 'gen/p6regex-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1297880742.05833")
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
    .const 'Sub' $P1673 = "94_1297880742.05833" 
    .return ($P1673)
.end


.namespace []
.sub "" :load :init :subid("post95") :outer("10_1297880742.05833")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1297880742.05833" 
    .local pmc block
    set block, $P12
    $P1676 = get_root_global ["parrot"], "P6metaclass"
    $P1676."new_class"("Regex::P6Regex::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block13"  :subid("11_1297880742.05833") :outer("10_1297880742.05833")
.annotate 'line', 4
    .const 'Sub' $P1648 = "92_1297880742.05833" 
    capture_lex $P1648
    .const 'Sub' $P1628 = "91_1297880742.05833" 
    capture_lex $P1628
    .const 'Sub' $P1596 = "90_1297880742.05833" 
    capture_lex $P1596
    .const 'Sub' $P1527 = "86_1297880742.05833" 
    capture_lex $P1527
    .const 'Sub' $P1459 = "84_1297880742.05833" 
    capture_lex $P1459
    .const 'Sub' $P1387 = "81_1297880742.05833" 
    capture_lex $P1387
    .const 'Sub' $P1373 = "80_1297880742.05833" 
    capture_lex $P1373
    .const 'Sub' $P1349 = "79_1297880742.05833" 
    capture_lex $P1349
    .const 'Sub' $P1331 = "78_1297880742.05833" 
    capture_lex $P1331
    .const 'Sub' $P1317 = "77_1297880742.05833" 
    capture_lex $P1317
    .const 'Sub' $P1304 = "76_1297880742.05833" 
    capture_lex $P1304
    .const 'Sub' $P1273 = "75_1297880742.05833" 
    capture_lex $P1273
    .const 'Sub' $P1242 = "74_1297880742.05833" 
    capture_lex $P1242
    .const 'Sub' $P1226 = "73_1297880742.05833" 
    capture_lex $P1226
    .const 'Sub' $P1210 = "72_1297880742.05833" 
    capture_lex $P1210
    .const 'Sub' $P1194 = "71_1297880742.05833" 
    capture_lex $P1194
    .const 'Sub' $P1178 = "70_1297880742.05833" 
    capture_lex $P1178
    .const 'Sub' $P1162 = "69_1297880742.05833" 
    capture_lex $P1162
    .const 'Sub' $P1146 = "68_1297880742.05833" 
    capture_lex $P1146
    .const 'Sub' $P1130 = "67_1297880742.05833" 
    capture_lex $P1130
    .const 'Sub' $P1106 = "66_1297880742.05833" 
    capture_lex $P1106
    .const 'Sub' $P1091 = "65_1297880742.05833" 
    capture_lex $P1091
    .const 'Sub' $P1033 = "64_1297880742.05833" 
    capture_lex $P1033
    .const 'Sub' $P1012 = "63_1297880742.05833" 
    capture_lex $P1012
    .const 'Sub' $P990 = "62_1297880742.05833" 
    capture_lex $P990
    .const 'Sub' $P980 = "61_1297880742.05833" 
    capture_lex $P980
    .const 'Sub' $P970 = "60_1297880742.05833" 
    capture_lex $P970
    .const 'Sub' $P960 = "59_1297880742.05833" 
    capture_lex $P960
    .const 'Sub' $P948 = "58_1297880742.05833" 
    capture_lex $P948
    .const 'Sub' $P936 = "57_1297880742.05833" 
    capture_lex $P936
    .const 'Sub' $P924 = "56_1297880742.05833" 
    capture_lex $P924
    .const 'Sub' $P912 = "55_1297880742.05833" 
    capture_lex $P912
    .const 'Sub' $P900 = "54_1297880742.05833" 
    capture_lex $P900
    .const 'Sub' $P888 = "53_1297880742.05833" 
    capture_lex $P888
    .const 'Sub' $P876 = "52_1297880742.05833" 
    capture_lex $P876
    .const 'Sub' $P864 = "51_1297880742.05833" 
    capture_lex $P864
    .const 'Sub' $P836 = "50_1297880742.05833" 
    capture_lex $P836
    .const 'Sub' $P808 = "49_1297880742.05833" 
    capture_lex $P808
    .const 'Sub' $P790 = "48_1297880742.05833" 
    capture_lex $P790
    .const 'Sub' $P780 = "47_1297880742.05833" 
    capture_lex $P780
    .const 'Sub' $P762 = "46_1297880742.05833" 
    capture_lex $P762
    .const 'Sub' $P689 = "44_1297880742.05833" 
    capture_lex $P689
    .const 'Sub' $P672 = "43_1297880742.05833" 
    capture_lex $P672
    .const 'Sub' $P657 = "42_1297880742.05833" 
    capture_lex $P657
    .const 'Sub' $P642 = "41_1297880742.05833" 
    capture_lex $P642
    .const 'Sub' $P616 = "40_1297880742.05833" 
    capture_lex $P616
    .const 'Sub' $P565 = "38_1297880742.05833" 
    capture_lex $P565
    .const 'Sub' $P497 = "36_1297880742.05833" 
    capture_lex $P497
    .const 'Sub' $P460 = "34_1297880742.05833" 
    capture_lex $P460
    .const 'Sub' $P404 = "31_1297880742.05833" 
    capture_lex $P404
    .const 'Sub' $P389 = "30_1297880742.05833" 
    capture_lex $P389
    .const 'Sub' $P363 = "28_1297880742.05833" 
    capture_lex $P363
    .const 'Sub' $P346 = "27_1297880742.05833" 
    capture_lex $P346
    .const 'Sub' $P312 = "26_1297880742.05833" 
    capture_lex $P312
    .const 'Sub' $P57 = "13_1297880742.05833" 
    capture_lex $P57
    .const 'Sub' $P16 = "12_1297880742.05833" 
    capture_lex $P16
    get_global $P15, "@MODIFIERS"
    unless_null $P15, vivify_97
    $P15 = root_new ['parrot';'ResizablePMCArray']
    set_global "@MODIFIERS", $P15
  vivify_97:
.annotate 'line', 506
    .const 'Sub' $P16 = "12_1297880742.05833" 
    newclosure $P56, $P16
    .lex "buildsub", $P56
.annotate 'line', 524
    .const 'Sub' $P57 = "13_1297880742.05833" 
    newclosure $P311, $P57
    .lex "capnames", $P311
.annotate 'line', 590
    .const 'Sub' $P312 = "26_1297880742.05833" 
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
    .const 'Sub' $P1648 = "92_1297880742.05833" 
    newclosure $P1665, $P1648
.annotate 'line', 4
    .return ($P1665)
    .const 'Sub' $P1667 = "93_1297880742.05833" 
    .return ($P1667)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "" :load :init :subid("post96") :outer("11_1297880742.05833")
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
.sub "buildsub"  :subid("12_1297880742.05833") :outer("11_1297880742.05833")
    .param pmc param_19
    .param pmc param_20 :optional
    .param int has_param_20 :opt_flag
.annotate 'line', 506
    new $P18, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P18, control_17
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
.sub "capnames"  :subid("13_1297880742.05833") :outer("11_1297880742.05833")
    .param pmc param_60
    .param pmc param_61
.annotate 'line', 524
    .const 'Sub' $P286 = "24_1297880742.05833" 
    capture_lex $P286
    .const 'Sub' $P223 = "21_1297880742.05833" 
    capture_lex $P223
    .const 'Sub' $P181 = "19_1297880742.05833" 
    capture_lex $P181
    .const 'Sub' $P139 = "17_1297880742.05833" 
    capture_lex $P139
    .const 'Sub' $P72 = "14_1297880742.05833" 
    capture_lex $P72
    new $P59, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P59, control_58
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
    .const 'Sub' $P286 = "24_1297880742.05833" 
    capture_lex $P286
    $P286()
  if_281_end:
    goto if_218_end
  if_218:
.annotate 'line', 562
    .const 'Sub' $P223 = "21_1297880742.05833" 
    capture_lex $P223
    $P223()
  if_218_end:
    goto if_171_end
  if_171:
.annotate 'line', 549
    .const 'Sub' $P181 = "19_1297880742.05833" 
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
    .const 'Sub' $P139 = "17_1297880742.05833" 
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
    .const 'Sub' $P72 = "14_1297880742.05833" 
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
.sub "_block285"  :anon :subid("24_1297880742.05833") :outer("13_1297880742.05833")
.annotate 'line', 579
    .const 'Sub' $P297 = "25_1297880742.05833" 
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
    .const 'Sub' $P297 = "25_1297880742.05833" 
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
.sub "_block296"  :anon :subid("25_1297880742.05833") :outer("24_1297880742.05833")
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
.sub "_block222"  :anon :subid("21_1297880742.05833") :outer("13_1297880742.05833")
.annotate 'line', 562
    .const 'Sub' $P263 = "23_1297880742.05833" 
    capture_lex $P263
    .const 'Sub' $P235 = "22_1297880742.05833" 
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
    .const 'Sub' $P235 = "22_1297880742.05833" 
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
    .const 'Sub' $P263 = "23_1297880742.05833" 
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
.sub "_block234"  :anon :subid("22_1297880742.05833") :outer("21_1297880742.05833")
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
.sub "_block262"  :anon :subid("23_1297880742.05833") :outer("21_1297880742.05833")
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
.sub "_block180"  :anon :subid("19_1297880742.05833") :outer("13_1297880742.05833")
.annotate 'line', 549
    .const 'Sub' $P199 = "20_1297880742.05833" 
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
    .const 'Sub' $P199 = "20_1297880742.05833" 
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
.sub "_block198"  :anon :subid("20_1297880742.05833") :outer("19_1297880742.05833")
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
.sub "_block138"  :anon :subid("17_1297880742.05833") :outer("13_1297880742.05833")
    .param pmc param_141
.annotate 'line', 541
    .const 'Sub' $P150 = "18_1297880742.05833" 
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
    .const 'Sub' $P150 = "18_1297880742.05833" 
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
.sub "_block149"  :anon :subid("18_1297880742.05833") :outer("17_1297880742.05833")
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
.sub "_block71"  :anon :subid("14_1297880742.05833") :outer("13_1297880742.05833")
.annotate 'line', 527
    .const 'Sub' $P81 = "15_1297880742.05833" 
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
    .const 'Sub' $P81 = "15_1297880742.05833" 
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
.sub "_block80"  :anon :subid("15_1297880742.05833") :outer("14_1297880742.05833")
    .param pmc param_83
.annotate 'line', 529
    .const 'Sub' $P92 = "16_1297880742.05833" 
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
    .const 'Sub' $P92 = "16_1297880742.05833" 
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
.sub "_block91"  :anon :subid("16_1297880742.05833") :outer("15_1297880742.05833")
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
.sub "backmod"  :subid("26_1297880742.05833") :outer("11_1297880742.05833")
    .param pmc param_315
    .param pmc param_316
.annotate 'line', 590
    new $P314, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P314, control_313
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
.sub "arg"  :subid("27_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_349
.annotate 'line', 14
    new $P348, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P348, control_347
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
.sub "arglist"  :subid("28_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_366
.annotate 'line', 18
    .const 'Sub' $P376 = "29_1297880742.05833" 
    capture_lex $P376
    new $P365, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P365, control_364
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
    .const 'Sub' $P376 = "29_1297880742.05833" 
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
.sub "_block375"  :anon :subid("29_1297880742.05833") :outer("28_1297880742.05833")
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
.sub "TOP"  :subid("30_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_392
.annotate 'line', 24
    new $P391, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P391, control_390
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
.sub "nibbler"  :subid("31_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_407
    .param pmc param_408 :optional
    .param int has_param_408 :opt_flag
.annotate 'line', 30
    .const 'Sub' $P443 = "33_1297880742.05833" 
    capture_lex $P443
    .const 'Sub' $P416 = "32_1297880742.05833" 
    capture_lex $P416
    new $P406, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P406, control_405
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
    .const 'Sub' $P416 = "32_1297880742.05833" 
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
    .const 'Sub' $P443 = "33_1297880742.05833" 
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
.sub "_block415"  :anon :subid("32_1297880742.05833") :outer("31_1297880742.05833")
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
.sub "_block442"  :anon :subid("33_1297880742.05833") :outer("31_1297880742.05833")
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
.sub "termconj"  :subid("34_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_463
.annotate 'line', 52
    .const 'Sub' $P480 = "35_1297880742.05833" 
    capture_lex $P480
    new $P462, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P462, control_461
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
    .const 'Sub' $P480 = "35_1297880742.05833" 
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
.sub "_block479"  :anon :subid("35_1297880742.05833") :outer("34_1297880742.05833")
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
.sub "termish"  :subid("36_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_500
.annotate 'line', 66
    .const 'Sub' $P513 = "37_1297880742.05833" 
    capture_lex $P513
    new $P499, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P499, control_498
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
    .const 'Sub' $P513 = "37_1297880742.05833" 
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
.sub "_block512"  :anon :subid("37_1297880742.05833") :outer("36_1297880742.05833")
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
.sub "quantified_atom"  :subid("38_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_568
.annotate 'line', 87
    .const 'Sub' $P577 = "39_1297880742.05833" 
    capture_lex $P577
    new $P567, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P567, control_566
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
    .const 'Sub' $P577 = "39_1297880742.05833" 
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
.sub "_block576"  :anon :subid("39_1297880742.05833") :outer("38_1297880742.05833")
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
.sub "atom"  :subid("40_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_619
.annotate 'line', 102
    new $P618, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P618, control_617
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
.sub "quantifier:sym<*>"  :subid("41_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_645
.annotate 'line', 112
    new $P644, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P644, control_643
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
.sub "quantifier:sym<+>"  :subid("42_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_660
.annotate 'line', 117
    new $P659, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P659, control_658
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
.sub "quantifier:sym<?>"  :subid("43_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_675
.annotate 'line', 122
    new $P674, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P674, control_673
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
.sub "quantifier:sym<**>"  :subid("44_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_692
.annotate 'line', 128
    .const 'Sub' $P707 = "45_1297880742.05833" 
    capture_lex $P707
    new $P691, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P691, control_690
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
    .const 'Sub' $P707 = "45_1297880742.05833" 
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
.sub "_block706"  :anon :subid("45_1297880742.05833") :outer("44_1297880742.05833")
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
.sub "metachar:sym<ws>"  :subid("46_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_765
.annotate 'line', 157
    new $P764, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P764, control_763
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
.sub "metachar:sym<[ ]>"  :subid("47_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_783
.annotate 'line', 166
    new $P782, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P782, control_781
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
.sub "metachar:sym<( )>"  :subid("48_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_793
.annotate 'line', 170
    new $P792, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P792, control_791
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
.sub "metachar:sym<'>"  :subid("49_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_811
.annotate 'line', 177
    new $P810, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P810, control_809
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
.sub "metachar:sym<\">"  :subid("50_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_839
.annotate 'line', 185
    new $P838, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P838, control_837
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
.sub "metachar:sym<.>"  :subid("51_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_867
.annotate 'line', 193
    new $P866, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P866, control_865
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
.sub "metachar:sym<^>"  :subid("52_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_879
.annotate 'line', 198
    new $P878, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P878, control_877
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
.sub "metachar:sym<^^>"  :subid("53_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_891
.annotate 'line', 203
    new $P890, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P890, control_889
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
.sub "metachar:sym<$>"  :subid("54_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_903
.annotate 'line', 208
    new $P902, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P902, control_901
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
.sub "metachar:sym<$$>"  :subid("55_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_915
.annotate 'line', 213
    new $P914, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P914, control_913
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
.sub "metachar:sym<:::>"  :subid("56_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_927
.annotate 'line', 218
    new $P926, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P926, control_925
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
.sub "metachar:sym<lwb>"  :subid("57_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_939
.annotate 'line', 223
    new $P938, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P938, control_937
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
.sub "metachar:sym<rwb>"  :subid("58_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_951
.annotate 'line', 228
    new $P950, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P950, control_949
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
.sub "metachar:sym<bs>"  :subid("59_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_963
.annotate 'line', 233
    new $P962, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P962, control_961
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
.sub "metachar:sym<mod>"  :subid("60_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_973
.annotate 'line', 237
    new $P972, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P972, control_971
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
.sub "metachar:sym<assert>"  :subid("61_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_983
.annotate 'line', 241
    new $P982, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P982, control_981
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
.sub "metachar:sym<~>"  :subid("62_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_993
.annotate 'line', 245
    new $P992, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P992, control_991
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
.sub "metachar:sym<{*}>"  :subid("63_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_1015
.annotate 'line', 258
    new $P1014, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1014, control_1013
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
.sub "metachar:sym<var>"  :subid("64_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_1036
.annotate 'line', 265
    new $P1035, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1035, control_1034
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
.sub "metachar:sym<PIR>"  :subid("65_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_1094
.annotate 'line', 285
    new $P1093, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1093, control_1092
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
.sub "backslash:sym<w>"  :subid("66_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_1109
.annotate 'line', 293
    new $P1108, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1108, control_1107
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
.sub "backslash:sym<b>"  :subid("67_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_1133
.annotate 'line', 299
    new $P1132, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1132, control_1131
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
.sub "backslash:sym<e>"  :subid("68_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_1149
.annotate 'line', 305
    new $P1148, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1148, control_1147
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
.sub "backslash:sym<f>"  :subid("69_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_1165
.annotate 'line', 311
    new $P1164, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1164, control_1163
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
.sub "backslash:sym<h>"  :subid("70_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_1181
.annotate 'line', 317
    new $P1180, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1180, control_1179
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
.sub "backslash:sym<r>"  :subid("71_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_1197
.annotate 'line', 323
    new $P1196, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1196, control_1195
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
.sub "backslash:sym<t>"  :subid("72_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_1213
.annotate 'line', 329
    new $P1212, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1212, control_1211
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
.sub "backslash:sym<v>"  :subid("73_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_1229
.annotate 'line', 335
    new $P1228, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1228, control_1227
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
.sub "backslash:sym<o>"  :subid("74_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_1245
.annotate 'line', 342
    new $P1244, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1244, control_1243
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
.sub "backslash:sym<x>"  :subid("75_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_1276
.annotate 'line', 351
    new $P1275, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1275, control_1274
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
.sub "backslash:sym<c>"  :subid("76_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_1307
.annotate 'line', 360
    new $P1306, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1306, control_1305
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
.sub "backslash:sym<misc>"  :subid("77_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_1320
.annotate 'line', 364
    new $P1319, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1319, control_1318
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
.sub "assertion:sym<?>"  :subid("78_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_1334
.annotate 'line', 370
    new $P1333, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1333, control_1332
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
.sub "assertion:sym<!>"  :subid("79_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_1352
.annotate 'line', 380
    new $P1351, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1351, control_1350
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
.sub "assertion:sym<method>"  :subid("80_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_1376
.annotate 'line', 393
    new $P1375, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1375, control_1374
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
.sub "assertion:sym<name>"  :subid("81_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_1390
.annotate 'line', 400
    .const 'Sub' $P1447 = "83_1297880742.05833" 
    capture_lex $P1447
    .const 'Sub' $P1413 = "82_1297880742.05833" 
    capture_lex $P1413
    new $P1389, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1389, control_1388
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
    .const 'Sub' $P1447 = "83_1297880742.05833" 
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
    .const 'Sub' $P1413 = "82_1297880742.05833" 
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
.sub "_block1446"  :anon :subid("83_1297880742.05833") :outer("81_1297880742.05833")
    .param pmc param_1448
.annotate 'line', 428
    .lex "$_", param_1448
    find_lex $P1449, "$past"
    find_lex $P1450, "$_"
    $P1451 = $P1449."push"($P1450)
    .return ($P1451)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1412"  :anon :subid("82_1297880742.05833") :outer("81_1297880742.05833")
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
.sub "assertion:sym<[>"  :subid("84_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_1462
.annotate 'line', 434
    .const 'Sub' $P1497 = "85_1297880742.05833" 
    capture_lex $P1497
    new $P1461, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1461, control_1460
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
    .const 'Sub' $P1497 = "85_1297880742.05833" 
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
.sub "_block1496"  :anon :subid("85_1297880742.05833") :outer("84_1297880742.05833")
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
.sub "cclass_elem"  :subid("86_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_1530
.annotate 'line', 461
    .const 'Sub' $P1555 = "88_1297880742.05833" 
    capture_lex $P1555
    .const 'Sub' $P1539 = "87_1297880742.05833" 
    capture_lex $P1539
    new $P1529, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1529, control_1528
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
    .const 'Sub' $P1555 = "88_1297880742.05833" 
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
    .const 'Sub' $P1539 = "87_1297880742.05833" 
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
.sub "_block1554"  :anon :subid("88_1297880742.05833") :outer("86_1297880742.05833")
    .param pmc param_1556
.annotate 'line', 468
    .const 'Sub' $P1562 = "89_1297880742.05833" 
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
    .const 'Sub' $P1562 = "89_1297880742.05833" 
    capture_lex $P1562
    $P1575 = $P1562()
    set $P1557, $P1575
  if_1558_end:
.annotate 'line', 468
    .return ($P1557)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1561"  :anon :subid("89_1297880742.05833") :outer("88_1297880742.05833")
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
.sub "_block1538"  :anon :subid("87_1297880742.05833") :outer("86_1297880742.05833")
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
.sub "mod_internal"  :subid("90_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_1599
.annotate 'line', 499
    new $P1598, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1598, control_1597
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
.sub "subrule_alias"  :subid("91_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_1631
    .param pmc param_1632
.annotate 'line', 597
    new $P1630, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1630, control_1629
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
.sub "named_assertion"  :subid("92_1297880742.05833") :method :outer("11_1297880742.05833")
    .param pmc param_1651
.annotate 'line', 603
    new $P1650, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1650, control_1649
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
.sub "_block1666" :load :anon :subid("93_1297880742.05833")
.annotate 'line', 4
    .const 'Sub' $P1668 = "11_1297880742.05833" 
    $P1669 = $P1668()
    .return ($P1669)
.end


.namespace []
.sub "_block1672" :load :anon :subid("94_1297880742.05833")
.annotate 'line', 1
    .const 'Sub' $P1674 = "10_1297880742.05833" 
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
