# Copyright (C) 2009, The Perl Foundation.
# 

=head1 NAME

Regex::P6Regex - Parser/compiler for Perl 6 regexes

=head1 DESCRIPTION

=cut

.sub '' :anon :load :init
    load_bytecode 'HLL.pbc'
.end

### .include 'gen/p6regex-grammar.pir'

.namespace []
.sub "_block1000"  :anon :subid("10_1309998843.21663")
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1309998843.21663" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 3
    .const 'Sub' $P1003 = "11_1309998843.21663" 
    capture_lex $P1003
    $P101 = $P1003()
.annotate 'line', 1
    .return ($P101)
    .const 'Sub' $P1468 = "174_1309998843.21663" 
    .return ($P1468)
.end


.namespace []
.sub "" :load :init :subid("post175") :outer("10_1309998843.21663")
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1309998843.21663" 
    .local pmc block
    set block, $P1001
    $P1470 = get_root_global ["parrot"], "P6metaclass"
    $P1470."new_class"("Regex::P6Regex::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block1002"  :subid("11_1309998843.21663") :outer("10_1309998843.21663")
.annotate 'line', 3
    .const 'Sub' $P1458 = "171_1309998843.21663" 
    capture_lex $P1458
    .const 'Sub' $P1452 = "169_1309998843.21663" 
    capture_lex $P1452
    .const 'Sub' $P1446 = "167_1309998843.21663" 
    capture_lex $P1446
    .const 'Sub' $P1430 = "162_1309998843.21663" 
    capture_lex $P1430
    .const 'Sub' $P1397 = "156_1309998843.21663" 
    capture_lex $P1397
    .const 'Sub' $P1386 = "153_1309998843.21663" 
    capture_lex $P1386
    .const 'Sub' $P1376 = "150_1309998843.21663" 
    capture_lex $P1376
    .const 'Sub' $P1372 = "148_1309998843.21663" 
    capture_lex $P1372
    .const 'Sub' $P1363 = "145_1309998843.21663" 
    capture_lex $P1363
    .const 'Sub' $P1354 = "142_1309998843.21663" 
    capture_lex $P1354
    .const 'Sub' $P1348 = "138_1309998843.21663" 
    capture_lex $P1348
    .const 'Sub' $P1342 = "135_1309998843.21663" 
    capture_lex $P1342
    .const 'Sub' $P1338 = "133_1309998843.21663" 
    capture_lex $P1338
    .const 'Sub' $P1334 = "131_1309998843.21663" 
    capture_lex $P1334
    .const 'Sub' $P1330 = "129_1309998843.21663" 
    capture_lex $P1330
    .const 'Sub' $P1326 = "127_1309998843.21663" 
    capture_lex $P1326
    .const 'Sub' $P1321 = "125_1309998843.21663" 
    capture_lex $P1321
    .const 'Sub' $P1315 = "123_1309998843.21663" 
    capture_lex $P1315
    .const 'Sub' $P1309 = "121_1309998843.21663" 
    capture_lex $P1309
    .const 'Sub' $P1304 = "119_1309998843.21663" 
    capture_lex $P1304
    .const 'Sub' $P1299 = "117_1309998843.21663" 
    capture_lex $P1299
    .const 'Sub' $P1294 = "115_1309998843.21663" 
    capture_lex $P1294
    .const 'Sub' $P1289 = "113_1309998843.21663" 
    capture_lex $P1289
    .const 'Sub' $P1284 = "111_1309998843.21663" 
    capture_lex $P1284
    .const 'Sub' $P1279 = "109_1309998843.21663" 
    capture_lex $P1279
    .const 'Sub' $P1274 = "107_1309998843.21663" 
    capture_lex $P1274
    .const 'Sub' $P1269 = "105_1309998843.21663" 
    capture_lex $P1269
    .const 'Sub' $P1260 = "101_1309998843.21663" 
    capture_lex $P1260
    .const 'Sub' $P1251 = "99_1309998843.21663" 
    capture_lex $P1251
    .const 'Sub' $P1246 = "97_1309998843.21663" 
    capture_lex $P1246
    .const 'Sub' $P1235 = "95_1309998843.21663" 
    capture_lex $P1235
    .const 'Sub' $P1230 = "93_1309998843.21663" 
    capture_lex $P1230
    .const 'Sub' $P1226 = "91_1309998843.21663" 
    capture_lex $P1226
    .const 'Sub' $P1222 = "89_1309998843.21663" 
    capture_lex $P1222
    .const 'Sub' $P1218 = "87_1309998843.21663" 
    capture_lex $P1218
    .const 'Sub' $P1212 = "85_1309998843.21663" 
    capture_lex $P1212
    .const 'Sub' $P1206 = "83_1309998843.21663" 
    capture_lex $P1206
    .const 'Sub' $P1201 = "81_1309998843.21663" 
    capture_lex $P1201
    .const 'Sub' $P1196 = "79_1309998843.21663" 
    capture_lex $P1196
    .const 'Sub' $P1191 = "77_1309998843.21663" 
    capture_lex $P1191
    .const 'Sub' $P1186 = "75_1309998843.21663" 
    capture_lex $P1186
    .const 'Sub' $P1181 = "73_1309998843.21663" 
    capture_lex $P1181
    .const 'Sub' $P1176 = "71_1309998843.21663" 
    capture_lex $P1176
    .const 'Sub' $P1171 = "69_1309998843.21663" 
    capture_lex $P1171
    .const 'Sub' $P1167 = "67_1309998843.21663" 
    capture_lex $P1167
    .const 'Sub' $P1163 = "65_1309998843.21663" 
    capture_lex $P1163
    .const 'Sub' $P1159 = "63_1309998843.21663" 
    capture_lex $P1159
    .const 'Sub' $P1155 = "61_1309998843.21663" 
    capture_lex $P1155
    .const 'Sub' $P1151 = "59_1309998843.21663" 
    capture_lex $P1151
    .const 'Sub' $P1139 = "54_1309998843.21663" 
    capture_lex $P1139
    .const 'Sub' $P1125 = "52_1309998843.21663" 
    capture_lex $P1125
    .const 'Sub' $P1106 = "46_1309998843.21663" 
    capture_lex $P1106
    .const 'Sub' $P1101 = "44_1309998843.21663" 
    capture_lex $P1101
    .const 'Sub' $P1096 = "42_1309998843.21663" 
    capture_lex $P1096
    .const 'Sub' $P1091 = "40_1309998843.21663" 
    capture_lex $P1091
    .const 'Sub' $P1078 = "35_1309998843.21663" 
    capture_lex $P1078
    .const 'Sub' $P1068 = "32_1309998843.21663" 
    capture_lex $P1068
    .const 'Sub' $P1062 = "30_1309998843.21663" 
    capture_lex $P1062
    .const 'Sub' $P1055 = "28_1309998843.21663" 
    capture_lex $P1055
    .const 'Sub' $P1046 = "26_1309998843.21663" 
    capture_lex $P1046
    .const 'Sub' $P1041 = "24_1309998843.21663" 
    capture_lex $P1041
    .const 'Sub' $P1036 = "22_1309998843.21663" 
    capture_lex $P1036
    .const 'Sub' $P1030 = "20_1309998843.21663" 
    capture_lex $P1030
    .const 'Sub' $P1025 = "18_1309998843.21663" 
    capture_lex $P1025
    .const 'Sub' $P1016 = "15_1309998843.21663" 
    capture_lex $P1016
    .const 'Sub' $P1010 = "13_1309998843.21663" 
    capture_lex $P1010
    .const 'Sub' $P1004 = "12_1309998843.21663" 
    capture_lex $P1004
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    .const 'Sub' $P1458 = "171_1309998843.21663" 
    capture_lex $P1458
    .return ($P1458)
    .const 'Sub' $P1465 = "173_1309998843.21663" 
    .return ($P1465)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.include "except_types.pasm"
.sub "obs"  :subid("12_1309998843.21663") :method :outer("11_1309998843.21663")
    .param pmc param_1007
    .param pmc param_1008
    .param pmc param_1009 :optional
    .param int has_param_1009 :opt_flag
.annotate 'line', 3
    new $P1006, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1006, control_1005
    push_eh $P1006
    .lex "self", self
    .lex "$old", param_1007
    .lex "$new", param_1008
    if has_param_1009, optparam_176
    new $P100, "String"
    assign $P100, " in Perl 6"
    set param_1009, $P100
  optparam_176:
    .lex "$when", param_1009
.annotate 'line', 4
    find_lex $P101, "self"
    new $P102, "String"
    assign $P102, "Unsupported use of "
    find_lex $P103, "$old"
    set $S100, $P103
    concat $P104, $P102, $S100
    concat $P105, $P104, ";"
.annotate 'line', 5
    find_lex $P106, "$when"
    set $S101, $P106
    concat $P107, $P105, $S101
    concat $P108, $P107, " please use "
    find_lex $P109, "$new"
    set $S102, $P109
    concat $P110, $P108, $S102
    $P111 = $P101."panic"($P110)
.annotate 'line', 3
    .return ($P111)
  control_1005:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "ws"  :subid("13_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1011_tgt
    .local int rx1011_pos
    .local int rx1011_off
    .local int rx1011_eos
    .local int rx1011_rep
    .local pmc rx1011_cur
    .local pmc rx1011_debug
    (rx1011_cur, rx1011_pos, rx1011_tgt, $I10) = self."!cursor_start"()
    getattribute rx1011_debug, rx1011_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1011_cur
    .local pmc match
    .lex "$/", match
    length rx1011_eos, rx1011_tgt
    gt rx1011_pos, rx1011_eos, rx1011_done
    set rx1011_off, 0
    lt rx1011_pos, 2, rx1011_start
    sub rx1011_off, rx1011_pos, 1
    substr rx1011_tgt, rx1011_tgt, rx1011_off
  rx1011_start:
    eq $I10, 1, rx1011_restart
    if_null rx1011_debug, debug_177
    rx1011_cur."!cursor_debug"("START", "ws")
  debug_177:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1013_done
    goto rxscan1013_scan
  rxscan1013_loop:
    ($P10) = rx1011_cur."from"()
    inc $P10
    set rx1011_pos, $P10
    ge rx1011_pos, rx1011_eos, rxscan1013_done
  rxscan1013_scan:
    set_addr $I10, rxscan1013_loop
    rx1011_cur."!mark_push"(0, rx1011_pos, $I10)
  rxscan1013_done:
.annotate 'line', 8
  # rx rxquantr1014 ** 0..*
    set_addr $I10, rxquantr1014_done
    rx1011_cur."!mark_push"(0, rx1011_pos, $I10)
  rxquantr1014_loop:
  alt1015_0:
    set_addr $I10, alt1015_1
    rx1011_cur."!mark_push"(0, rx1011_pos, $I10)
  # rx charclass_q s r 1..-1
    sub $I10, rx1011_pos, rx1011_off
    find_not_cclass $I11, 32, rx1011_tgt, $I10, rx1011_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1011_fail
    add rx1011_pos, rx1011_off, $I11
    goto alt1015_end
  alt1015_1:
  # rx literal  "#"
    add $I11, rx1011_pos, 1
    gt $I11, rx1011_eos, rx1011_fail
    sub $I11, rx1011_pos, rx1011_off
    ord $I11, rx1011_tgt, $I11
    ne $I11, 35, rx1011_fail
    add rx1011_pos, 1
  # rx charclass_q N r 0..-1
    sub $I10, rx1011_pos, rx1011_off
    find_cclass $I11, 4096, rx1011_tgt, $I10, rx1011_eos
    add rx1011_pos, rx1011_off, $I11
  alt1015_end:
    set_addr $I10, rxquantr1014_done
    (rx1011_rep) = rx1011_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr1014_done
    rx1011_cur."!mark_push"(rx1011_rep, rx1011_pos, $I10)
    goto rxquantr1014_loop
  rxquantr1014_done:
  # rx pass
    rx1011_cur."!cursor_pass"(rx1011_pos, "ws")
    if_null rx1011_debug, debug_178
    rx1011_cur."!cursor_debug"("PASS", "ws", " at pos=", rx1011_pos)
  debug_178:
    .return (rx1011_cur)
  rx1011_restart:
.annotate 'line', 3
    if_null rx1011_debug, debug_179
    rx1011_cur."!cursor_debug"("NEXT", "ws")
  debug_179:
  rx1011_fail:
    (rx1011_rep, rx1011_pos, $I10, $P10) = rx1011_cur."!mark_fail"(0)
    lt rx1011_pos, -1, rx1011_done
    eq rx1011_pos, -1, rx1011_fail
    jump $I10
  rx1011_done:
    rx1011_cur."!cursor_fail"()
    if_null rx1011_debug, debug_180
    rx1011_cur."!cursor_debug"("FAIL", "ws")
  debug_180:
    .return (rx1011_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__ws"  :subid("14_1309998843.21663") :method
.annotate 'line', 3
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "normspace"  :subid("15_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .const 'Sub' $P1021 = "17_1309998843.21663" 
    capture_lex $P1021
    .local string rx1017_tgt
    .local int rx1017_pos
    .local int rx1017_off
    .local int rx1017_eos
    .local int rx1017_rep
    .local pmc rx1017_cur
    .local pmc rx1017_debug
    (rx1017_cur, rx1017_pos, rx1017_tgt, $I10) = self."!cursor_start"()
    getattribute rx1017_debug, rx1017_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1017_cur
    .local pmc match
    .lex "$/", match
    length rx1017_eos, rx1017_tgt
    gt rx1017_pos, rx1017_eos, rx1017_done
    set rx1017_off, 0
    lt rx1017_pos, 2, rx1017_start
    sub rx1017_off, rx1017_pos, 1
    substr rx1017_tgt, rx1017_tgt, rx1017_off
  rx1017_start:
    eq $I10, 1, rx1017_restart
    if_null rx1017_debug, debug_181
    rx1017_cur."!cursor_debug"("START", "normspace")
  debug_181:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1019_done
    goto rxscan1019_scan
  rxscan1019_loop:
    ($P10) = rx1017_cur."from"()
    inc $P10
    set rx1017_pos, $P10
    ge rx1017_pos, rx1017_eos, rxscan1019_done
  rxscan1019_scan:
    set_addr $I10, rxscan1019_loop
    rx1017_cur."!mark_push"(0, rx1017_pos, $I10)
  rxscan1019_done:
.annotate 'line', 10
  # rx subrule "before" subtype=zerowidth negate=
    rx1017_cur."!cursor_pos"(rx1017_pos)
    .const 'Sub' $P1021 = "17_1309998843.21663" 
    capture_lex $P1021
    $P10 = rx1017_cur."before"($P1021)
    unless $P10, rx1017_fail
  # rx subrule "ws" subtype=method negate=
    rx1017_cur."!cursor_pos"(rx1017_pos)
    $P10 = rx1017_cur."ws"()
    unless $P10, rx1017_fail
    rx1017_pos = $P10."pos"()
  # rx pass
    rx1017_cur."!cursor_pass"(rx1017_pos, "normspace")
    if_null rx1017_debug, debug_186
    rx1017_cur."!cursor_debug"("PASS", "normspace", " at pos=", rx1017_pos)
  debug_186:
    .return (rx1017_cur)
  rx1017_restart:
.annotate 'line', 3
    if_null rx1017_debug, debug_187
    rx1017_cur."!cursor_debug"("NEXT", "normspace")
  debug_187:
  rx1017_fail:
    (rx1017_rep, rx1017_pos, $I10, $P10) = rx1017_cur."!mark_fail"(0)
    lt rx1017_pos, -1, rx1017_done
    eq rx1017_pos, -1, rx1017_fail
    jump $I10
  rx1017_done:
    rx1017_cur."!cursor_fail"()
    if_null rx1017_debug, debug_188
    rx1017_cur."!cursor_debug"("FAIL", "normspace")
  debug_188:
    .return (rx1017_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__normspace"  :subid("16_1309998843.21663") :method
.annotate 'line', 3
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block1020"  :anon :subid("17_1309998843.21663") :method :outer("15_1309998843.21663")
.annotate 'line', 10
    .local string rx1022_tgt
    .local int rx1022_pos
    .local int rx1022_off
    .local int rx1022_eos
    .local int rx1022_rep
    .local pmc rx1022_cur
    .local pmc rx1022_debug
    (rx1022_cur, rx1022_pos, rx1022_tgt, $I10) = self."!cursor_start"()
    getattribute rx1022_debug, rx1022_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1022_cur
    .local pmc match
    .lex "$/", match
    length rx1022_eos, rx1022_tgt
    gt rx1022_pos, rx1022_eos, rx1022_done
    set rx1022_off, 0
    lt rx1022_pos, 2, rx1022_start
    sub rx1022_off, rx1022_pos, 1
    substr rx1022_tgt, rx1022_tgt, rx1022_off
  rx1022_start:
    eq $I10, 1, rx1022_restart
    if_null rx1022_debug, debug_182
    rx1022_cur."!cursor_debug"("START", "")
  debug_182:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1023_done
    goto rxscan1023_scan
  rxscan1023_loop:
    ($P10) = rx1022_cur."from"()
    inc $P10
    set rx1022_pos, $P10
    ge rx1022_pos, rx1022_eos, rxscan1023_done
  rxscan1023_scan:
    set_addr $I10, rxscan1023_loop
    rx1022_cur."!mark_push"(0, rx1022_pos, $I10)
  rxscan1023_done:
  alt1024_0:
    set_addr $I10, alt1024_1
    rx1022_cur."!mark_push"(0, rx1022_pos, $I10)
  # rx charclass s
    ge rx1022_pos, rx1022_eos, rx1022_fail
    sub $I10, rx1022_pos, rx1022_off
    is_cclass $I11, 32, rx1022_tgt, $I10
    unless $I11, rx1022_fail
    inc rx1022_pos
    goto alt1024_end
  alt1024_1:
  # rx literal  "#"
    add $I11, rx1022_pos, 1
    gt $I11, rx1022_eos, rx1022_fail
    sub $I11, rx1022_pos, rx1022_off
    ord $I11, rx1022_tgt, $I11
    ne $I11, 35, rx1022_fail
    add rx1022_pos, 1
  alt1024_end:
  # rx pass
    rx1022_cur."!cursor_pass"(rx1022_pos, "")
    if_null rx1022_debug, debug_183
    rx1022_cur."!cursor_debug"("PASS", "", " at pos=", rx1022_pos)
  debug_183:
    .return (rx1022_cur)
  rx1022_restart:
    if_null rx1022_debug, debug_184
    rx1022_cur."!cursor_debug"("NEXT", "")
  debug_184:
  rx1022_fail:
    (rx1022_rep, rx1022_pos, $I10, $P10) = rx1022_cur."!mark_fail"(0)
    lt rx1022_pos, -1, rx1022_done
    eq rx1022_pos, -1, rx1022_fail
    jump $I10
  rx1022_done:
    rx1022_cur."!cursor_fail"()
    if_null rx1022_debug, debug_185
    rx1022_cur."!cursor_debug"("FAIL", "")
  debug_185:
    .return (rx1022_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "identifier"  :subid("18_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1026_tgt
    .local int rx1026_pos
    .local int rx1026_off
    .local int rx1026_eos
    .local int rx1026_rep
    .local pmc rx1026_cur
    .local pmc rx1026_debug
    (rx1026_cur, rx1026_pos, rx1026_tgt, $I10) = self."!cursor_start"()
    getattribute rx1026_debug, rx1026_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1026_cur
    .local pmc match
    .lex "$/", match
    length rx1026_eos, rx1026_tgt
    gt rx1026_pos, rx1026_eos, rx1026_done
    set rx1026_off, 0
    lt rx1026_pos, 2, rx1026_start
    sub rx1026_off, rx1026_pos, 1
    substr rx1026_tgt, rx1026_tgt, rx1026_off
  rx1026_start:
    eq $I10, 1, rx1026_restart
    if_null rx1026_debug, debug_189
    rx1026_cur."!cursor_debug"("START", "identifier")
  debug_189:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1028_done
    goto rxscan1028_scan
  rxscan1028_loop:
    ($P10) = rx1026_cur."from"()
    inc $P10
    set rx1026_pos, $P10
    ge rx1026_pos, rx1026_eos, rxscan1028_done
  rxscan1028_scan:
    set_addr $I10, rxscan1028_loop
    rx1026_cur."!mark_push"(0, rx1026_pos, $I10)
  rxscan1028_done:
.annotate 'line', 12
  # rx subrule "ident" subtype=method negate=
    rx1026_cur."!cursor_pos"(rx1026_pos)
    $P10 = rx1026_cur."ident"()
    unless $P10, rx1026_fail
    rx1026_pos = $P10."pos"()
  # rx rxquantr1029 ** 0..*
    set_addr $I10, rxquantr1029_done
    rx1026_cur."!mark_push"(0, rx1026_pos, $I10)
  rxquantr1029_loop:
  # rx enumcharlist negate=0 
    ge rx1026_pos, rx1026_eos, rx1026_fail
    sub $I10, rx1026_pos, rx1026_off
    substr $S10, rx1026_tgt, $I10, 1
    index $I11, "-'", $S10
    lt $I11, 0, rx1026_fail
    inc rx1026_pos
  # rx subrule "ident" subtype=method negate=
    rx1026_cur."!cursor_pos"(rx1026_pos)
    $P10 = rx1026_cur."ident"()
    unless $P10, rx1026_fail
    rx1026_pos = $P10."pos"()
    set_addr $I10, rxquantr1029_done
    (rx1026_rep) = rx1026_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr1029_done
    rx1026_cur."!mark_push"(rx1026_rep, rx1026_pos, $I10)
    goto rxquantr1029_loop
  rxquantr1029_done:
  # rx pass
    rx1026_cur."!cursor_pass"(rx1026_pos, "identifier")
    if_null rx1026_debug, debug_190
    rx1026_cur."!cursor_debug"("PASS", "identifier", " at pos=", rx1026_pos)
  debug_190:
    .return (rx1026_cur)
  rx1026_restart:
.annotate 'line', 3
    if_null rx1026_debug, debug_191
    rx1026_cur."!cursor_debug"("NEXT", "identifier")
  debug_191:
  rx1026_fail:
    (rx1026_rep, rx1026_pos, $I10, $P10) = rx1026_cur."!mark_fail"(0)
    lt rx1026_pos, -1, rx1026_done
    eq rx1026_pos, -1, rx1026_fail
    jump $I10
  rx1026_done:
    rx1026_cur."!cursor_fail"()
    if_null rx1026_debug, debug_192
    rx1026_cur."!cursor_debug"("FAIL", "identifier")
  debug_192:
    .return (rx1026_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__identifier"  :subid("19_1309998843.21663") :method
.annotate 'line', 3
    $P100 = self."!PREFIX__!subrule"("ident", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "arg"  :subid("20_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1031_tgt
    .local int rx1031_pos
    .local int rx1031_off
    .local int rx1031_eos
    .local int rx1031_rep
    .local pmc rx1031_cur
    .local pmc rx1031_debug
    (rx1031_cur, rx1031_pos, rx1031_tgt, $I10) = self."!cursor_start"()
    getattribute rx1031_debug, rx1031_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1031_cur
    .local pmc match
    .lex "$/", match
    length rx1031_eos, rx1031_tgt
    gt rx1031_pos, rx1031_eos, rx1031_done
    set rx1031_off, 0
    lt rx1031_pos, 2, rx1031_start
    sub rx1031_off, rx1031_pos, 1
    substr rx1031_tgt, rx1031_tgt, rx1031_off
  rx1031_start:
    eq $I10, 1, rx1031_restart
    if_null rx1031_debug, debug_193
    rx1031_cur."!cursor_debug"("START", "arg")
  debug_193:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1033_done
    goto rxscan1033_scan
  rxscan1033_loop:
    ($P10) = rx1031_cur."from"()
    inc $P10
    set rx1031_pos, $P10
    ge rx1031_pos, rx1031_eos, rxscan1033_done
  rxscan1033_scan:
    set_addr $I10, rxscan1033_loop
    rx1031_cur."!mark_push"(0, rx1031_pos, $I10)
  rxscan1033_done:
  alt1034_0:
.annotate 'line', 15
    set_addr $I10, alt1034_1
    rx1031_cur."!mark_push"(0, rx1031_pos, $I10)
.annotate 'line', 16
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1031_pos, rx1031_off
    substr $S10, rx1031_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx1031_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx1031_cur."!cursor_pos"(rx1031_pos)
    $P10 = rx1031_cur."quote_EXPR"(":q")
    unless $P10, rx1031_fail
    rx1031_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx1031_pos = $P10."pos"()
    goto alt1034_end
  alt1034_1:
    set_addr $I10, alt1034_2
    rx1031_cur."!mark_push"(0, rx1031_pos, $I10)
.annotate 'line', 17
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1031_pos, rx1031_off
    substr $S10, rx1031_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx1031_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx1031_cur."!cursor_pos"(rx1031_pos)
    $P10 = rx1031_cur."quote_EXPR"(":qq")
    unless $P10, rx1031_fail
    rx1031_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx1031_pos = $P10."pos"()
    goto alt1034_end
  alt1034_2:
.annotate 'line', 18
  # rx subcapture "val"
    set_addr $I10, rxcap_1035_fail
    rx1031_cur."!mark_push"(0, rx1031_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx1031_pos, rx1031_off
    find_not_cclass $I11, 8, rx1031_tgt, $I10, rx1031_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1031_fail
    add rx1031_pos, rx1031_off, $I11
    set_addr $I10, rxcap_1035_fail
    ($I12, $I11) = rx1031_cur."!mark_peek"($I10)
    rx1031_cur."!cursor_pos"($I11)
    ($P10) = rx1031_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1031_pos, "")
    rx1031_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("val")
    goto rxcap_1035_done
  rxcap_1035_fail:
    goto rx1031_fail
  rxcap_1035_done:
  alt1034_end:
.annotate 'line', 14
  # rx pass
    rx1031_cur."!cursor_pass"(rx1031_pos, "arg")
    if_null rx1031_debug, debug_194
    rx1031_cur."!cursor_debug"("PASS", "arg", " at pos=", rx1031_pos)
  debug_194:
    .return (rx1031_cur)
  rx1031_restart:
.annotate 'line', 3
    if_null rx1031_debug, debug_195
    rx1031_cur."!cursor_debug"("NEXT", "arg")
  debug_195:
  rx1031_fail:
    (rx1031_rep, rx1031_pos, $I10, $P10) = rx1031_cur."!mark_fail"(0)
    lt rx1031_pos, -1, rx1031_done
    eq rx1031_pos, -1, rx1031_fail
    jump $I10
  rx1031_done:
    rx1031_cur."!cursor_fail"()
    if_null rx1031_debug, debug_196
    rx1031_cur."!cursor_debug"("FAIL", "arg")
  debug_196:
    .return (rx1031_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__arg"  :subid("21_1309998843.21663") :method
.annotate 'line', 3
    new $P100, "ResizablePMCArray"
    push $P100, ""
    push $P100, "\""
    push $P100, "'"
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "arglist"  :subid("22_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1037_tgt
    .local int rx1037_pos
    .local int rx1037_off
    .local int rx1037_eos
    .local int rx1037_rep
    .local pmc rx1037_cur
    .local pmc rx1037_debug
    (rx1037_cur, rx1037_pos, rx1037_tgt, $I10) = self."!cursor_start"()
    rx1037_cur."!cursor_caparray"("arg")
    getattribute rx1037_debug, rx1037_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1037_cur
    .local pmc match
    .lex "$/", match
    length rx1037_eos, rx1037_tgt
    gt rx1037_pos, rx1037_eos, rx1037_done
    set rx1037_off, 0
    lt rx1037_pos, 2, rx1037_start
    sub rx1037_off, rx1037_pos, 1
    substr rx1037_tgt, rx1037_tgt, rx1037_off
  rx1037_start:
    eq $I10, 1, rx1037_restart
    if_null rx1037_debug, debug_197
    rx1037_cur."!cursor_debug"("START", "arglist")
  debug_197:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1039_done
    goto rxscan1039_scan
  rxscan1039_loop:
    ($P10) = rx1037_cur."from"()
    inc $P10
    set rx1037_pos, $P10
    ge rx1037_pos, rx1037_eos, rxscan1039_done
  rxscan1039_scan:
    set_addr $I10, rxscan1039_loop
    rx1037_cur."!mark_push"(0, rx1037_pos, $I10)
  rxscan1039_done:
.annotate 'line', 22
  # rx subrule "ws" subtype=method negate=
    rx1037_cur."!cursor_pos"(rx1037_pos)
    $P10 = rx1037_cur."ws"()
    unless $P10, rx1037_fail
    rx1037_pos = $P10."pos"()
  # rx subrule "arg" subtype=capture negate=
    rx1037_cur."!cursor_pos"(rx1037_pos)
    $P10 = rx1037_cur."arg"()
    unless $P10, rx1037_fail
    rx1037_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arg")
    rx1037_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1037_cur."!cursor_pos"(rx1037_pos)
    $P10 = rx1037_cur."ws"()
    unless $P10, rx1037_fail
    rx1037_pos = $P10."pos"()
  # rx rxquantr1040 ** 0..*
    set_addr $I10, rxquantr1040_done
    rx1037_cur."!mark_push"(0, rx1037_pos, $I10)
  rxquantr1040_loop:
  # rx subrule "ws" subtype=method negate=
    rx1037_cur."!cursor_pos"(rx1037_pos)
    $P10 = rx1037_cur."ws"()
    unless $P10, rx1037_fail
    rx1037_pos = $P10."pos"()
  # rx literal  ","
    add $I11, rx1037_pos, 1
    gt $I11, rx1037_eos, rx1037_fail
    sub $I11, rx1037_pos, rx1037_off
    ord $I11, rx1037_tgt, $I11
    ne $I11, 44, rx1037_fail
    add rx1037_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx1037_cur."!cursor_pos"(rx1037_pos)
    $P10 = rx1037_cur."ws"()
    unless $P10, rx1037_fail
    rx1037_pos = $P10."pos"()
  # rx subrule "arg" subtype=capture negate=
    rx1037_cur."!cursor_pos"(rx1037_pos)
    $P10 = rx1037_cur."arg"()
    unless $P10, rx1037_fail
    rx1037_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arg")
    rx1037_pos = $P10."pos"()
    set_addr $I10, rxquantr1040_done
    (rx1037_rep) = rx1037_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr1040_done
    rx1037_cur."!mark_push"(rx1037_rep, rx1037_pos, $I10)
    goto rxquantr1040_loop
  rxquantr1040_done:
  # rx subrule "ws" subtype=method negate=
    rx1037_cur."!cursor_pos"(rx1037_pos)
    $P10 = rx1037_cur."ws"()
    unless $P10, rx1037_fail
    rx1037_pos = $P10."pos"()
  # rx pass
    rx1037_cur."!cursor_pass"(rx1037_pos, "arglist")
    if_null rx1037_debug, debug_198
    rx1037_cur."!cursor_debug"("PASS", "arglist", " at pos=", rx1037_pos)
  debug_198:
    .return (rx1037_cur)
  rx1037_restart:
.annotate 'line', 3
    if_null rx1037_debug, debug_199
    rx1037_cur."!cursor_debug"("NEXT", "arglist")
  debug_199:
  rx1037_fail:
    (rx1037_rep, rx1037_pos, $I10, $P10) = rx1037_cur."!mark_fail"(0)
    lt rx1037_pos, -1, rx1037_done
    eq rx1037_pos, -1, rx1037_fail
    jump $I10
  rx1037_done:
    rx1037_cur."!cursor_fail"()
    if_null rx1037_debug, debug_200
    rx1037_cur."!cursor_debug"("FAIL", "arglist")
  debug_200:
    .return (rx1037_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__arglist"  :subid("23_1309998843.21663") :method
.annotate 'line', 3
    $P100 = self."!PREFIX__!subrule"("ws", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "TOP"  :subid("24_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1042_tgt
    .local int rx1042_pos
    .local int rx1042_off
    .local int rx1042_eos
    .local int rx1042_rep
    .local pmc rx1042_cur
    .local pmc rx1042_debug
    (rx1042_cur, rx1042_pos, rx1042_tgt, $I10) = self."!cursor_start"()
    getattribute rx1042_debug, rx1042_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1042_cur
    .local pmc match
    .lex "$/", match
    length rx1042_eos, rx1042_tgt
    gt rx1042_pos, rx1042_eos, rx1042_done
    set rx1042_off, 0
    lt rx1042_pos, 2, rx1042_start
    sub rx1042_off, rx1042_pos, 1
    substr rx1042_tgt, rx1042_tgt, rx1042_off
  rx1042_start:
    eq $I10, 1, rx1042_restart
    if_null rx1042_debug, debug_201
    rx1042_cur."!cursor_debug"("START", "TOP")
  debug_201:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1044_done
    goto rxscan1044_scan
  rxscan1044_loop:
    ($P10) = rx1042_cur."from"()
    inc $P10
    set rx1042_pos, $P10
    ge rx1042_pos, rx1042_eos, rxscan1044_done
  rxscan1044_scan:
    set_addr $I10, rxscan1044_loop
    rx1042_cur."!mark_push"(0, rx1042_pos, $I10)
  rxscan1044_done:
.annotate 'line', 25
  # rx subrule "nibbler" subtype=capture negate=
    rx1042_cur."!cursor_pos"(rx1042_pos)
    $P10 = rx1042_cur."nibbler"()
    unless $P10, rx1042_fail
    rx1042_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx1042_pos = $P10."pos"()
  alt1045_0:
.annotate 'line', 26
    set_addr $I10, alt1045_1
    rx1042_cur."!mark_push"(0, rx1042_pos, $I10)
  # rxanchor eos
    ne rx1042_pos, rx1042_eos, rx1042_fail
    goto alt1045_end
  alt1045_1:
  # rx subrule "panic" subtype=method negate=
    rx1042_cur."!cursor_pos"(rx1042_pos)
    $P10 = rx1042_cur."panic"("Confused")
    unless $P10, rx1042_fail
    rx1042_pos = $P10."pos"()
  alt1045_end:
.annotate 'line', 24
  # rx pass
    rx1042_cur."!cursor_pass"(rx1042_pos, "TOP")
    if_null rx1042_debug, debug_202
    rx1042_cur."!cursor_debug"("PASS", "TOP", " at pos=", rx1042_pos)
  debug_202:
    .return (rx1042_cur)
  rx1042_restart:
.annotate 'line', 3
    if_null rx1042_debug, debug_203
    rx1042_cur."!cursor_debug"("NEXT", "TOP")
  debug_203:
  rx1042_fail:
    (rx1042_rep, rx1042_pos, $I10, $P10) = rx1042_cur."!mark_fail"(0)
    lt rx1042_pos, -1, rx1042_done
    eq rx1042_pos, -1, rx1042_fail
    jump $I10
  rx1042_done:
    rx1042_cur."!cursor_fail"()
    if_null rx1042_debug, debug_204
    rx1042_cur."!cursor_debug"("FAIL", "TOP")
  debug_204:
    .return (rx1042_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__TOP"  :subid("25_1309998843.21663") :method
.annotate 'line', 3
    $P100 = self."!PREFIX__!subrule"("nibbler", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "nibbler"  :subid("26_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1047_tgt
    .local int rx1047_pos
    .local int rx1047_off
    .local int rx1047_eos
    .local int rx1047_rep
    .local pmc rx1047_cur
    .local pmc rx1047_debug
    (rx1047_cur, rx1047_pos, rx1047_tgt, $I10) = self."!cursor_start"()
    rx1047_cur."!cursor_caparray"("termconj")
    getattribute rx1047_debug, rx1047_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1047_cur
    .local pmc match
    .lex "$/", match
    length rx1047_eos, rx1047_tgt
    gt rx1047_pos, rx1047_eos, rx1047_done
    set rx1047_off, 0
    lt rx1047_pos, 2, rx1047_start
    sub rx1047_off, rx1047_pos, 1
    substr rx1047_tgt, rx1047_tgt, rx1047_off
  rx1047_start:
    eq $I10, 1, rx1047_restart
    if_null rx1047_debug, debug_205
    rx1047_cur."!cursor_debug"("START", "nibbler")
  debug_205:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1049_done
    goto rxscan1049_scan
  rxscan1049_loop:
    ($P10) = rx1047_cur."from"()
    inc $P10
    set rx1047_pos, $P10
    ge rx1047_pos, rx1047_eos, rxscan1049_done
  rxscan1049_scan:
    set_addr $I10, rxscan1049_loop
    rx1047_cur."!mark_push"(0, rx1047_pos, $I10)
  rxscan1049_done:
.annotate 'line', 30
  # rx reduce name="nibbler" key="open"
    rx1047_cur."!cursor_pos"(rx1047_pos)
    rx1047_cur."!reduce"("nibbler", "open")
.annotate 'line', 31
  # rx rxquantr1050 ** 0..1
    set_addr $I10, rxquantr1050_done
    rx1047_cur."!mark_push"(0, rx1047_pos, $I10)
  rxquantr1050_loop:
  # rx subrule "ws" subtype=method negate=
    rx1047_cur."!cursor_pos"(rx1047_pos)
    $P10 = rx1047_cur."ws"()
    unless $P10, rx1047_fail
    rx1047_pos = $P10."pos"()
  alt1051_0:
    set_addr $I10, alt1051_1
    rx1047_cur."!mark_push"(0, rx1047_pos, $I10)
  # rx literal  "||"
    add $I11, rx1047_pos, 2
    gt $I11, rx1047_eos, rx1047_fail
    sub $I11, rx1047_pos, rx1047_off
    substr $S10, rx1047_tgt, $I11, 2
    ne $S10, "||", rx1047_fail
    add rx1047_pos, 2
    goto alt1051_end
  alt1051_1:
    set_addr $I10, alt1051_2
    rx1047_cur."!mark_push"(0, rx1047_pos, $I10)
  # rx literal  "|"
    add $I11, rx1047_pos, 1
    gt $I11, rx1047_eos, rx1047_fail
    sub $I11, rx1047_pos, rx1047_off
    ord $I11, rx1047_tgt, $I11
    ne $I11, 124, rx1047_fail
    add rx1047_pos, 1
    goto alt1051_end
  alt1051_2:
    set_addr $I10, alt1051_3
    rx1047_cur."!mark_push"(0, rx1047_pos, $I10)
  # rx literal  "&&"
    add $I11, rx1047_pos, 2
    gt $I11, rx1047_eos, rx1047_fail
    sub $I11, rx1047_pos, rx1047_off
    substr $S10, rx1047_tgt, $I11, 2
    ne $S10, "&&", rx1047_fail
    add rx1047_pos, 2
    goto alt1051_end
  alt1051_3:
  # rx literal  "&"
    add $I11, rx1047_pos, 1
    gt $I11, rx1047_eos, rx1047_fail
    sub $I11, rx1047_pos, rx1047_off
    ord $I11, rx1047_tgt, $I11
    ne $I11, 38, rx1047_fail
    add rx1047_pos, 1
  alt1051_end:
    set_addr $I10, rxquantr1050_done
    (rx1047_rep) = rx1047_cur."!mark_commit"($I10)
  rxquantr1050_done:
.annotate 'line', 32
  # rx subrule "termconj" subtype=capture negate=
    rx1047_cur."!cursor_pos"(rx1047_pos)
    $P10 = rx1047_cur."termconj"()
    unless $P10, rx1047_fail
    rx1047_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("termconj")
    rx1047_pos = $P10."pos"()
.annotate 'line', 35
  # rx rxquantr1052 ** 0..*
    set_addr $I10, rxquantr1052_done
    rx1047_cur."!mark_push"(0, rx1047_pos, $I10)
  rxquantr1052_loop:
  alt1053_0:
.annotate 'line', 33
    set_addr $I10, alt1053_1
    rx1047_cur."!mark_push"(0, rx1047_pos, $I10)
  # rx literal  "||"
    add $I11, rx1047_pos, 2
    gt $I11, rx1047_eos, rx1047_fail
    sub $I11, rx1047_pos, rx1047_off
    substr $S10, rx1047_tgt, $I11, 2
    ne $S10, "||", rx1047_fail
    add rx1047_pos, 2
    goto alt1053_end
  alt1053_1:
  # rx literal  "|"
    add $I11, rx1047_pos, 1
    gt $I11, rx1047_eos, rx1047_fail
    sub $I11, rx1047_pos, rx1047_off
    ord $I11, rx1047_tgt, $I11
    ne $I11, 124, rx1047_fail
    add rx1047_pos, 1
  alt1053_end:
  alt1054_0:
.annotate 'line', 34
    set_addr $I10, alt1054_1
    rx1047_cur."!mark_push"(0, rx1047_pos, $I10)
  # rx subrule "termconj" subtype=capture negate=
    rx1047_cur."!cursor_pos"(rx1047_pos)
    $P10 = rx1047_cur."termconj"()
    unless $P10, rx1047_fail
    rx1047_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("termconj")
    rx1047_pos = $P10."pos"()
    goto alt1054_end
  alt1054_1:
  # rx subrule "panic" subtype=method negate=
    rx1047_cur."!cursor_pos"(rx1047_pos)
    $P10 = rx1047_cur."panic"("Null pattern not allowed")
    unless $P10, rx1047_fail
    rx1047_pos = $P10."pos"()
  alt1054_end:
.annotate 'line', 35
    set_addr $I10, rxquantr1052_done
    (rx1047_rep) = rx1047_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr1052_done
    rx1047_cur."!mark_push"(rx1047_rep, rx1047_pos, $I10)
    goto rxquantr1052_loop
  rxquantr1052_done:
.annotate 'line', 29
  # rx pass
    rx1047_cur."!cursor_pass"(rx1047_pos, "nibbler")
    if_null rx1047_debug, debug_206
    rx1047_cur."!cursor_debug"("PASS", "nibbler", " at pos=", rx1047_pos)
  debug_206:
    .return (rx1047_cur)
  rx1047_restart:
.annotate 'line', 3
    if_null rx1047_debug, debug_207
    rx1047_cur."!cursor_debug"("NEXT", "nibbler")
  debug_207:
  rx1047_fail:
    (rx1047_rep, rx1047_pos, $I10, $P10) = rx1047_cur."!mark_fail"(0)
    lt rx1047_pos, -1, rx1047_done
    eq rx1047_pos, -1, rx1047_fail
    jump $I10
  rx1047_done:
    rx1047_cur."!cursor_fail"()
    if_null rx1047_debug, debug_208
    rx1047_cur."!cursor_debug"("FAIL", "nibbler")
  debug_208:
    .return (rx1047_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__nibbler"  :subid("27_1309998843.21663") :method
.annotate 'line', 3
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "termconj"  :subid("28_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1056_tgt
    .local int rx1056_pos
    .local int rx1056_off
    .local int rx1056_eos
    .local int rx1056_rep
    .local pmc rx1056_cur
    .local pmc rx1056_debug
    (rx1056_cur, rx1056_pos, rx1056_tgt, $I10) = self."!cursor_start"()
    rx1056_cur."!cursor_caparray"("termish")
    getattribute rx1056_debug, rx1056_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1056_cur
    .local pmc match
    .lex "$/", match
    length rx1056_eos, rx1056_tgt
    gt rx1056_pos, rx1056_eos, rx1056_done
    set rx1056_off, 0
    lt rx1056_pos, 2, rx1056_start
    sub rx1056_off, rx1056_pos, 1
    substr rx1056_tgt, rx1056_tgt, rx1056_off
  rx1056_start:
    eq $I10, 1, rx1056_restart
    if_null rx1056_debug, debug_209
    rx1056_cur."!cursor_debug"("START", "termconj")
  debug_209:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1058_done
    goto rxscan1058_scan
  rxscan1058_loop:
    ($P10) = rx1056_cur."from"()
    inc $P10
    set rx1056_pos, $P10
    ge rx1056_pos, rx1056_eos, rxscan1058_done
  rxscan1058_scan:
    set_addr $I10, rxscan1058_loop
    rx1056_cur."!mark_push"(0, rx1056_pos, $I10)
  rxscan1058_done:
.annotate 'line', 39
  # rx subrule "termish" subtype=capture negate=
    rx1056_cur."!cursor_pos"(rx1056_pos)
    $P10 = rx1056_cur."termish"()
    unless $P10, rx1056_fail
    rx1056_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("termish")
    rx1056_pos = $P10."pos"()
.annotate 'line', 42
  # rx rxquantr1059 ** 0..*
    set_addr $I10, rxquantr1059_done
    rx1056_cur."!mark_push"(0, rx1056_pos, $I10)
  rxquantr1059_loop:
  alt1060_0:
.annotate 'line', 40
    set_addr $I10, alt1060_1
    rx1056_cur."!mark_push"(0, rx1056_pos, $I10)
  # rx literal  "&&"
    add $I11, rx1056_pos, 2
    gt $I11, rx1056_eos, rx1056_fail
    sub $I11, rx1056_pos, rx1056_off
    substr $S10, rx1056_tgt, $I11, 2
    ne $S10, "&&", rx1056_fail
    add rx1056_pos, 2
    goto alt1060_end
  alt1060_1:
  # rx literal  "&"
    add $I11, rx1056_pos, 1
    gt $I11, rx1056_eos, rx1056_fail
    sub $I11, rx1056_pos, rx1056_off
    ord $I11, rx1056_tgt, $I11
    ne $I11, 38, rx1056_fail
    add rx1056_pos, 1
  alt1060_end:
  alt1061_0:
.annotate 'line', 41
    set_addr $I10, alt1061_1
    rx1056_cur."!mark_push"(0, rx1056_pos, $I10)
  # rx subrule "termish" subtype=capture negate=
    rx1056_cur."!cursor_pos"(rx1056_pos)
    $P10 = rx1056_cur."termish"()
    unless $P10, rx1056_fail
    rx1056_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("termish")
    rx1056_pos = $P10."pos"()
    goto alt1061_end
  alt1061_1:
  # rx subrule "panic" subtype=method negate=
    rx1056_cur."!cursor_pos"(rx1056_pos)
    $P10 = rx1056_cur."panic"("Null pattern not allowed")
    unless $P10, rx1056_fail
    rx1056_pos = $P10."pos"()
  alt1061_end:
.annotate 'line', 42
    set_addr $I10, rxquantr1059_done
    (rx1056_rep) = rx1056_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr1059_done
    rx1056_cur."!mark_push"(rx1056_rep, rx1056_pos, $I10)
    goto rxquantr1059_loop
  rxquantr1059_done:
.annotate 'line', 38
  # rx pass
    rx1056_cur."!cursor_pass"(rx1056_pos, "termconj")
    if_null rx1056_debug, debug_210
    rx1056_cur."!cursor_debug"("PASS", "termconj", " at pos=", rx1056_pos)
  debug_210:
    .return (rx1056_cur)
  rx1056_restart:
.annotate 'line', 3
    if_null rx1056_debug, debug_211
    rx1056_cur."!cursor_debug"("NEXT", "termconj")
  debug_211:
  rx1056_fail:
    (rx1056_rep, rx1056_pos, $I10, $P10) = rx1056_cur."!mark_fail"(0)
    lt rx1056_pos, -1, rx1056_done
    eq rx1056_pos, -1, rx1056_fail
    jump $I10
  rx1056_done:
    rx1056_cur."!cursor_fail"()
    if_null rx1056_debug, debug_212
    rx1056_cur."!cursor_debug"("FAIL", "termconj")
  debug_212:
    .return (rx1056_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__termconj"  :subid("29_1309998843.21663") :method
.annotate 'line', 3
    $P100 = self."!PREFIX__!subrule"("termish", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "termish"  :subid("30_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1063_tgt
    .local int rx1063_pos
    .local int rx1063_off
    .local int rx1063_eos
    .local int rx1063_rep
    .local pmc rx1063_cur
    .local pmc rx1063_debug
    (rx1063_cur, rx1063_pos, rx1063_tgt, $I10) = self."!cursor_start"()
    rx1063_cur."!cursor_caparray"("noun")
    getattribute rx1063_debug, rx1063_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1063_cur
    .local pmc match
    .lex "$/", match
    length rx1063_eos, rx1063_tgt
    gt rx1063_pos, rx1063_eos, rx1063_done
    set rx1063_off, 0
    lt rx1063_pos, 2, rx1063_start
    sub rx1063_off, rx1063_pos, 1
    substr rx1063_tgt, rx1063_tgt, rx1063_off
  rx1063_start:
    eq $I10, 1, rx1063_restart
    if_null rx1063_debug, debug_213
    rx1063_cur."!cursor_debug"("START", "termish")
  debug_213:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1065_done
    goto rxscan1065_scan
  rxscan1065_loop:
    ($P10) = rx1063_cur."from"()
    inc $P10
    set rx1063_pos, $P10
    ge rx1063_pos, rx1063_eos, rxscan1065_done
  rxscan1065_scan:
    set_addr $I10, rxscan1065_loop
    rx1063_cur."!mark_push"(0, rx1063_pos, $I10)
  rxscan1065_done:
.annotate 'line', 46
  # rx rxquantr1066 ** 1..*
    set_addr $I10, rxquantr1066_done
    rx1063_cur."!mark_push"(0, -1, $I10)
  rxquantr1066_loop:
  # rx subrule "quantified_atom" subtype=capture negate=
    rx1063_cur."!cursor_pos"(rx1063_pos)
    $P10 = rx1063_cur."quantified_atom"()
    unless $P10, rx1063_fail
    goto rxsubrule1067_pass
  rxsubrule1067_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx1063_fail
  rxsubrule1067_pass:
    set_addr $I10, rxsubrule1067_back
    rx1063_cur."!mark_push"(0, rx1063_pos, $I10, $P10)
    $P10."!cursor_names"("noun")
    rx1063_pos = $P10."pos"()
    set_addr $I10, rxquantr1066_done
    (rx1063_rep) = rx1063_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr1066_done
    rx1063_cur."!mark_push"(rx1063_rep, rx1063_pos, $I10)
    goto rxquantr1066_loop
  rxquantr1066_done:
.annotate 'line', 45
  # rx pass
    rx1063_cur."!cursor_pass"(rx1063_pos, "termish")
    if_null rx1063_debug, debug_214
    rx1063_cur."!cursor_debug"("PASS", "termish", " at pos=", rx1063_pos)
  debug_214:
    .return (rx1063_cur)
  rx1063_restart:
.annotate 'line', 3
    if_null rx1063_debug, debug_215
    rx1063_cur."!cursor_debug"("NEXT", "termish")
  debug_215:
  rx1063_fail:
    (rx1063_rep, rx1063_pos, $I10, $P10) = rx1063_cur."!mark_fail"(0)
    lt rx1063_pos, -1, rx1063_done
    eq rx1063_pos, -1, rx1063_fail
    jump $I10
  rx1063_done:
    rx1063_cur."!cursor_fail"()
    if_null rx1063_debug, debug_216
    rx1063_cur."!cursor_debug"("FAIL", "termish")
  debug_216:
    .return (rx1063_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__termish"  :subid("31_1309998843.21663") :method
.annotate 'line', 3
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantified_atom"  :subid("32_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .const 'Sub' $P1075 = "34_1309998843.21663" 
    capture_lex $P1075
    .local string rx1069_tgt
    .local int rx1069_pos
    .local int rx1069_off
    .local int rx1069_eos
    .local int rx1069_rep
    .local pmc rx1069_cur
    .local pmc rx1069_debug
    (rx1069_cur, rx1069_pos, rx1069_tgt, $I10) = self."!cursor_start"()
    rx1069_cur."!cursor_caparray"("quantifier", "backmod")
    getattribute rx1069_debug, rx1069_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1069_cur
    .local pmc match
    .lex "$/", match
    length rx1069_eos, rx1069_tgt
    gt rx1069_pos, rx1069_eos, rx1069_done
    set rx1069_off, 0
    lt rx1069_pos, 2, rx1069_start
    sub rx1069_off, rx1069_pos, 1
    substr rx1069_tgt, rx1069_tgt, rx1069_off
  rx1069_start:
    eq $I10, 1, rx1069_restart
    if_null rx1069_debug, debug_217
    rx1069_cur."!cursor_debug"("START", "quantified_atom")
  debug_217:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1071_done
    goto rxscan1071_scan
  rxscan1071_loop:
    ($P10) = rx1069_cur."from"()
    inc $P10
    set rx1069_pos, $P10
    ge rx1069_pos, rx1069_eos, rxscan1071_done
  rxscan1071_scan:
    set_addr $I10, rxscan1071_loop
    rx1069_cur."!mark_push"(0, rx1069_pos, $I10)
  rxscan1071_done:
.annotate 'line', 50
  # rx subrule "atom" subtype=capture negate=
    rx1069_cur."!cursor_pos"(rx1069_pos)
    $P10 = rx1069_cur."atom"()
    unless $P10, rx1069_fail
    rx1069_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("atom")
    rx1069_pos = $P10."pos"()
  # rx rxquantr1072 ** 0..1
    set_addr $I10, rxquantr1072_done
    rx1069_cur."!mark_push"(0, rx1069_pos, $I10)
  rxquantr1072_loop:
  # rx subrule "ws" subtype=method negate=
    rx1069_cur."!cursor_pos"(rx1069_pos)
    $P10 = rx1069_cur."ws"()
    unless $P10, rx1069_fail
    rx1069_pos = $P10."pos"()
  alt1073_0:
    set_addr $I10, alt1073_1
    rx1069_cur."!mark_push"(0, rx1069_pos, $I10)
  # rx subrule "quantifier" subtype=capture negate=
    rx1069_cur."!cursor_pos"(rx1069_pos)
    $P10 = rx1069_cur."quantifier"()
    unless $P10, rx1069_fail
    rx1069_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantifier")
    rx1069_pos = $P10."pos"()
    goto alt1073_end
  alt1073_1:
  # rx subrule "before" subtype=zerowidth negate=
    rx1069_cur."!cursor_pos"(rx1069_pos)
    .const 'Sub' $P1075 = "34_1309998843.21663" 
    capture_lex $P1075
    $P10 = rx1069_cur."before"($P1075)
    unless $P10, rx1069_fail
  # rx subrule "backmod" subtype=capture negate=
    rx1069_cur."!cursor_pos"(rx1069_pos)
    $P10 = rx1069_cur."backmod"()
    unless $P10, rx1069_fail
    rx1069_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx1069_pos = $P10."pos"()
  # rx subrule "alpha" subtype=zerowidth negate=1
    rx1069_cur."!cursor_pos"(rx1069_pos)
    $P10 = rx1069_cur."alpha"()
    if $P10, rx1069_fail
  alt1073_end:
    set_addr $I10, rxquantr1072_done
    (rx1069_rep) = rx1069_cur."!mark_commit"($I10)
  rxquantr1072_done:
.annotate 'line', 49
  # rx pass
    rx1069_cur."!cursor_pass"(rx1069_pos, "quantified_atom")
    if_null rx1069_debug, debug_222
    rx1069_cur."!cursor_debug"("PASS", "quantified_atom", " at pos=", rx1069_pos)
  debug_222:
    .return (rx1069_cur)
  rx1069_restart:
.annotate 'line', 3
    if_null rx1069_debug, debug_223
    rx1069_cur."!cursor_debug"("NEXT", "quantified_atom")
  debug_223:
  rx1069_fail:
    (rx1069_rep, rx1069_pos, $I10, $P10) = rx1069_cur."!mark_fail"(0)
    lt rx1069_pos, -1, rx1069_done
    eq rx1069_pos, -1, rx1069_fail
    jump $I10
  rx1069_done:
    rx1069_cur."!cursor_fail"()
    if_null rx1069_debug, debug_224
    rx1069_cur."!cursor_debug"("FAIL", "quantified_atom")
  debug_224:
    .return (rx1069_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantified_atom"  :subid("33_1309998843.21663") :method
.annotate 'line', 3
    $P100 = self."!PREFIX__!subrule"("atom", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block1074"  :anon :subid("34_1309998843.21663") :method :outer("32_1309998843.21663")
.annotate 'line', 50
    .local string rx1076_tgt
    .local int rx1076_pos
    .local int rx1076_off
    .local int rx1076_eos
    .local int rx1076_rep
    .local pmc rx1076_cur
    .local pmc rx1076_debug
    (rx1076_cur, rx1076_pos, rx1076_tgt, $I10) = self."!cursor_start"()
    getattribute rx1076_debug, rx1076_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1076_cur
    .local pmc match
    .lex "$/", match
    length rx1076_eos, rx1076_tgt
    gt rx1076_pos, rx1076_eos, rx1076_done
    set rx1076_off, 0
    lt rx1076_pos, 2, rx1076_start
    sub rx1076_off, rx1076_pos, 1
    substr rx1076_tgt, rx1076_tgt, rx1076_off
  rx1076_start:
    eq $I10, 1, rx1076_restart
    if_null rx1076_debug, debug_218
    rx1076_cur."!cursor_debug"("START", "")
  debug_218:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1077_done
    goto rxscan1077_scan
  rxscan1077_loop:
    ($P10) = rx1076_cur."from"()
    inc $P10
    set rx1076_pos, $P10
    ge rx1076_pos, rx1076_eos, rxscan1077_done
  rxscan1077_scan:
    set_addr $I10, rxscan1077_loop
    rx1076_cur."!mark_push"(0, rx1076_pos, $I10)
  rxscan1077_done:
  # rx literal  ":"
    add $I11, rx1076_pos, 1
    gt $I11, rx1076_eos, rx1076_fail
    sub $I11, rx1076_pos, rx1076_off
    ord $I11, rx1076_tgt, $I11
    ne $I11, 58, rx1076_fail
    add rx1076_pos, 1
  # rx pass
    rx1076_cur."!cursor_pass"(rx1076_pos, "")
    if_null rx1076_debug, debug_219
    rx1076_cur."!cursor_debug"("PASS", "", " at pos=", rx1076_pos)
  debug_219:
    .return (rx1076_cur)
  rx1076_restart:
    if_null rx1076_debug, debug_220
    rx1076_cur."!cursor_debug"("NEXT", "")
  debug_220:
  rx1076_fail:
    (rx1076_rep, rx1076_pos, $I10, $P10) = rx1076_cur."!mark_fail"(0)
    lt rx1076_pos, -1, rx1076_done
    eq rx1076_pos, -1, rx1076_fail
    jump $I10
  rx1076_done:
    rx1076_cur."!cursor_fail"()
    if_null rx1076_debug, debug_221
    rx1076_cur."!cursor_debug"("FAIL", "")
  debug_221:
    .return (rx1076_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "atom"  :subid("35_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .const 'Sub' $P1086 = "37_1309998843.21663" 
    capture_lex $P1086
    .local string rx1079_tgt
    .local int rx1079_pos
    .local int rx1079_off
    .local int rx1079_eos
    .local int rx1079_rep
    .local pmc rx1079_cur
    .local pmc rx1079_debug
    (rx1079_cur, rx1079_pos, rx1079_tgt, $I10) = self."!cursor_start"()
    getattribute rx1079_debug, rx1079_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1079_cur
    .local pmc match
    .lex "$/", match
    length rx1079_eos, rx1079_tgt
    gt rx1079_pos, rx1079_eos, rx1079_done
    set rx1079_off, 0
    lt rx1079_pos, 2, rx1079_start
    sub rx1079_off, rx1079_pos, 1
    substr rx1079_tgt, rx1079_tgt, rx1079_off
  rx1079_start:
    eq $I10, 1, rx1079_restart
    if_null rx1079_debug, debug_225
    rx1079_cur."!cursor_debug"("START", "atom")
  debug_225:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1081_done
    goto rxscan1081_scan
  rxscan1081_loop:
    ($P10) = rx1079_cur."from"()
    inc $P10
    set rx1079_pos, $P10
    ge rx1079_pos, rx1079_eos, rxscan1081_done
  rxscan1081_scan:
    set_addr $I10, rxscan1081_loop
    rx1079_cur."!mark_push"(0, rx1079_pos, $I10)
  rxscan1081_done:
  alt1082_0:
.annotate 'line', 55
    set_addr $I10, alt1082_1
    rx1079_cur."!mark_push"(0, rx1079_pos, $I10)
.annotate 'line', 56
  # rx charclass w
    ge rx1079_pos, rx1079_eos, rx1079_fail
    sub $I10, rx1079_pos, rx1079_off
    is_cclass $I11, 8192, rx1079_tgt, $I10
    unless $I11, rx1079_fail
    inc rx1079_pos
  # rx rxquantr1083 ** 0..1
    set_addr $I10, rxquantr1083_done
    rx1079_cur."!mark_push"(0, rx1079_pos, $I10)
  rxquantr1083_loop:
  # rx rxquantg1084 ** 1..*
  rxquantg1084_loop:
  # rx charclass w
    ge rx1079_pos, rx1079_eos, rx1079_fail
    sub $I10, rx1079_pos, rx1079_off
    is_cclass $I11, 8192, rx1079_tgt, $I10
    unless $I11, rx1079_fail
    inc rx1079_pos
    set_addr $I10, rxquantg1084_done
    rx1079_cur."!mark_push"(rx1079_rep, rx1079_pos, $I10)
    goto rxquantg1084_loop
  rxquantg1084_done:
  # rx subrule "before" subtype=zerowidth negate=
    rx1079_cur."!cursor_pos"(rx1079_pos)
    .const 'Sub' $P1086 = "37_1309998843.21663" 
    capture_lex $P1086
    $P10 = rx1079_cur."before"($P1086)
    unless $P10, rx1079_fail
    set_addr $I10, rxquantr1083_done
    (rx1079_rep) = rx1079_cur."!mark_commit"($I10)
  rxquantr1083_done:
    goto alt1082_end
  alt1082_1:
.annotate 'line', 57
  # rx subrule "metachar" subtype=capture negate=
    rx1079_cur."!cursor_pos"(rx1079_pos)
    $P10 = rx1079_cur."metachar"()
    unless $P10, rx1079_fail
    rx1079_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("metachar")
    rx1079_pos = $P10."pos"()
  alt1082_end:
.annotate 'line', 53
  # rx pass
    rx1079_cur."!cursor_pass"(rx1079_pos, "atom")
    if_null rx1079_debug, debug_230
    rx1079_cur."!cursor_debug"("PASS", "atom", " at pos=", rx1079_pos)
  debug_230:
    .return (rx1079_cur)
  rx1079_restart:
.annotate 'line', 3
    if_null rx1079_debug, debug_231
    rx1079_cur."!cursor_debug"("NEXT", "atom")
  debug_231:
  rx1079_fail:
    (rx1079_rep, rx1079_pos, $I10, $P10) = rx1079_cur."!mark_fail"(0)
    lt rx1079_pos, -1, rx1079_done
    eq rx1079_pos, -1, rx1079_fail
    jump $I10
  rx1079_done:
    rx1079_cur."!cursor_fail"()
    if_null rx1079_debug, debug_232
    rx1079_cur."!cursor_debug"("FAIL", "atom")
  debug_232:
    .return (rx1079_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__atom"  :subid("36_1309998843.21663") :method
.annotate 'line', 3
    $P100 = self."!PREFIX__!subrule"("metachar", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    push $P101, ""
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block1085"  :anon :subid("37_1309998843.21663") :method :outer("35_1309998843.21663")
.annotate 'line', 56
    .local string rx1087_tgt
    .local int rx1087_pos
    .local int rx1087_off
    .local int rx1087_eos
    .local int rx1087_rep
    .local pmc rx1087_cur
    .local pmc rx1087_debug
    (rx1087_cur, rx1087_pos, rx1087_tgt, $I10) = self."!cursor_start"()
    getattribute rx1087_debug, rx1087_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1087_cur
    .local pmc match
    .lex "$/", match
    length rx1087_eos, rx1087_tgt
    gt rx1087_pos, rx1087_eos, rx1087_done
    set rx1087_off, 0
    lt rx1087_pos, 2, rx1087_start
    sub rx1087_off, rx1087_pos, 1
    substr rx1087_tgt, rx1087_tgt, rx1087_off
  rx1087_start:
    eq $I10, 1, rx1087_restart
    if_null rx1087_debug, debug_226
    rx1087_cur."!cursor_debug"("START", "")
  debug_226:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1088_done
    goto rxscan1088_scan
  rxscan1088_loop:
    ($P10) = rx1087_cur."from"()
    inc $P10
    set rx1087_pos, $P10
    ge rx1087_pos, rx1087_eos, rxscan1088_done
  rxscan1088_scan:
    set_addr $I10, rxscan1088_loop
    rx1087_cur."!mark_push"(0, rx1087_pos, $I10)
  rxscan1088_done:
  # rx charclass w
    ge rx1087_pos, rx1087_eos, rx1087_fail
    sub $I10, rx1087_pos, rx1087_off
    is_cclass $I11, 8192, rx1087_tgt, $I10
    unless $I11, rx1087_fail
    inc rx1087_pos
  # rx pass
    rx1087_cur."!cursor_pass"(rx1087_pos, "")
    if_null rx1087_debug, debug_227
    rx1087_cur."!cursor_debug"("PASS", "", " at pos=", rx1087_pos)
  debug_227:
    .return (rx1087_cur)
  rx1087_restart:
    if_null rx1087_debug, debug_228
    rx1087_cur."!cursor_debug"("NEXT", "")
  debug_228:
  rx1087_fail:
    (rx1087_rep, rx1087_pos, $I10, $P10) = rx1087_cur."!mark_fail"(0)
    lt rx1087_pos, -1, rx1087_done
    eq rx1087_pos, -1, rx1087_fail
    jump $I10
  rx1087_done:
    rx1087_cur."!cursor_fail"()
    if_null rx1087_debug, debug_229
    rx1087_cur."!cursor_debug"("FAIL", "")
  debug_229:
    .return (rx1087_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier"  :subid("38_1309998843.21663") :method
.annotate 'line', 61
    $P100 = self."!protoregex"("quantifier")
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier"  :subid("39_1309998843.21663") :method
.annotate 'line', 61
    $P101 = self."!PREFIX__!protoregex"("quantifier")
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<*>"  :subid("40_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1092_tgt
    .local int rx1092_pos
    .local int rx1092_off
    .local int rx1092_eos
    .local int rx1092_rep
    .local pmc rx1092_cur
    .local pmc rx1092_debug
    (rx1092_cur, rx1092_pos, rx1092_tgt, $I10) = self."!cursor_start"()
    getattribute rx1092_debug, rx1092_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1092_cur
    .local pmc match
    .lex "$/", match
    length rx1092_eos, rx1092_tgt
    gt rx1092_pos, rx1092_eos, rx1092_done
    set rx1092_off, 0
    lt rx1092_pos, 2, rx1092_start
    sub rx1092_off, rx1092_pos, 1
    substr rx1092_tgt, rx1092_tgt, rx1092_off
  rx1092_start:
    eq $I10, 1, rx1092_restart
    if_null rx1092_debug, debug_233
    rx1092_cur."!cursor_debug"("START", "quantifier:sym<*>")
  debug_233:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1094_done
    goto rxscan1094_scan
  rxscan1094_loop:
    ($P10) = rx1092_cur."from"()
    inc $P10
    set rx1092_pos, $P10
    ge rx1092_pos, rx1092_eos, rxscan1094_done
  rxscan1094_scan:
    set_addr $I10, rxscan1094_loop
    rx1092_cur."!mark_push"(0, rx1092_pos, $I10)
  rxscan1094_done:
.annotate 'line', 62
  # rx subcapture "sym"
    set_addr $I10, rxcap_1095_fail
    rx1092_cur."!mark_push"(0, rx1092_pos, $I10)
  # rx literal  "*"
    add $I11, rx1092_pos, 1
    gt $I11, rx1092_eos, rx1092_fail
    sub $I11, rx1092_pos, rx1092_off
    ord $I11, rx1092_tgt, $I11
    ne $I11, 42, rx1092_fail
    add rx1092_pos, 1
    set_addr $I10, rxcap_1095_fail
    ($I12, $I11) = rx1092_cur."!mark_peek"($I10)
    rx1092_cur."!cursor_pos"($I11)
    ($P10) = rx1092_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1092_pos, "")
    rx1092_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1095_done
  rxcap_1095_fail:
    goto rx1092_fail
  rxcap_1095_done:
  # rx subrule "backmod" subtype=capture negate=
    rx1092_cur."!cursor_pos"(rx1092_pos)
    $P10 = rx1092_cur."backmod"()
    unless $P10, rx1092_fail
    rx1092_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx1092_pos = $P10."pos"()
  # rx pass
    rx1092_cur."!cursor_pass"(rx1092_pos, "quantifier:sym<*>")
    if_null rx1092_debug, debug_234
    rx1092_cur."!cursor_debug"("PASS", "quantifier:sym<*>", " at pos=", rx1092_pos)
  debug_234:
    .return (rx1092_cur)
  rx1092_restart:
.annotate 'line', 3
    if_null rx1092_debug, debug_235
    rx1092_cur."!cursor_debug"("NEXT", "quantifier:sym<*>")
  debug_235:
  rx1092_fail:
    (rx1092_rep, rx1092_pos, $I10, $P10) = rx1092_cur."!mark_fail"(0)
    lt rx1092_pos, -1, rx1092_done
    eq rx1092_pos, -1, rx1092_fail
    jump $I10
  rx1092_done:
    rx1092_cur."!cursor_fail"()
    if_null rx1092_debug, debug_236
    rx1092_cur."!cursor_debug"("FAIL", "quantifier:sym<*>")
  debug_236:
    .return (rx1092_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<*>"  :subid("41_1309998843.21663") :method
.annotate 'line', 3
    $P100 = self."!PREFIX__!subrule"("backmod", "*")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<+>"  :subid("42_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1097_tgt
    .local int rx1097_pos
    .local int rx1097_off
    .local int rx1097_eos
    .local int rx1097_rep
    .local pmc rx1097_cur
    .local pmc rx1097_debug
    (rx1097_cur, rx1097_pos, rx1097_tgt, $I10) = self."!cursor_start"()
    getattribute rx1097_debug, rx1097_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1097_cur
    .local pmc match
    .lex "$/", match
    length rx1097_eos, rx1097_tgt
    gt rx1097_pos, rx1097_eos, rx1097_done
    set rx1097_off, 0
    lt rx1097_pos, 2, rx1097_start
    sub rx1097_off, rx1097_pos, 1
    substr rx1097_tgt, rx1097_tgt, rx1097_off
  rx1097_start:
    eq $I10, 1, rx1097_restart
    if_null rx1097_debug, debug_237
    rx1097_cur."!cursor_debug"("START", "quantifier:sym<+>")
  debug_237:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1099_done
    goto rxscan1099_scan
  rxscan1099_loop:
    ($P10) = rx1097_cur."from"()
    inc $P10
    set rx1097_pos, $P10
    ge rx1097_pos, rx1097_eos, rxscan1099_done
  rxscan1099_scan:
    set_addr $I10, rxscan1099_loop
    rx1097_cur."!mark_push"(0, rx1097_pos, $I10)
  rxscan1099_done:
.annotate 'line', 63
  # rx subcapture "sym"
    set_addr $I10, rxcap_1100_fail
    rx1097_cur."!mark_push"(0, rx1097_pos, $I10)
  # rx literal  "+"
    add $I11, rx1097_pos, 1
    gt $I11, rx1097_eos, rx1097_fail
    sub $I11, rx1097_pos, rx1097_off
    ord $I11, rx1097_tgt, $I11
    ne $I11, 43, rx1097_fail
    add rx1097_pos, 1
    set_addr $I10, rxcap_1100_fail
    ($I12, $I11) = rx1097_cur."!mark_peek"($I10)
    rx1097_cur."!cursor_pos"($I11)
    ($P10) = rx1097_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1097_pos, "")
    rx1097_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1100_done
  rxcap_1100_fail:
    goto rx1097_fail
  rxcap_1100_done:
  # rx subrule "backmod" subtype=capture negate=
    rx1097_cur."!cursor_pos"(rx1097_pos)
    $P10 = rx1097_cur."backmod"()
    unless $P10, rx1097_fail
    rx1097_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx1097_pos = $P10."pos"()
  # rx pass
    rx1097_cur."!cursor_pass"(rx1097_pos, "quantifier:sym<+>")
    if_null rx1097_debug, debug_238
    rx1097_cur."!cursor_debug"("PASS", "quantifier:sym<+>", " at pos=", rx1097_pos)
  debug_238:
    .return (rx1097_cur)
  rx1097_restart:
.annotate 'line', 3
    if_null rx1097_debug, debug_239
    rx1097_cur."!cursor_debug"("NEXT", "quantifier:sym<+>")
  debug_239:
  rx1097_fail:
    (rx1097_rep, rx1097_pos, $I10, $P10) = rx1097_cur."!mark_fail"(0)
    lt rx1097_pos, -1, rx1097_done
    eq rx1097_pos, -1, rx1097_fail
    jump $I10
  rx1097_done:
    rx1097_cur."!cursor_fail"()
    if_null rx1097_debug, debug_240
    rx1097_cur."!cursor_debug"("FAIL", "quantifier:sym<+>")
  debug_240:
    .return (rx1097_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<+>"  :subid("43_1309998843.21663") :method
.annotate 'line', 3
    $P100 = self."!PREFIX__!subrule"("backmod", "+")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<?>"  :subid("44_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1102_tgt
    .local int rx1102_pos
    .local int rx1102_off
    .local int rx1102_eos
    .local int rx1102_rep
    .local pmc rx1102_cur
    .local pmc rx1102_debug
    (rx1102_cur, rx1102_pos, rx1102_tgt, $I10) = self."!cursor_start"()
    getattribute rx1102_debug, rx1102_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1102_cur
    .local pmc match
    .lex "$/", match
    length rx1102_eos, rx1102_tgt
    gt rx1102_pos, rx1102_eos, rx1102_done
    set rx1102_off, 0
    lt rx1102_pos, 2, rx1102_start
    sub rx1102_off, rx1102_pos, 1
    substr rx1102_tgt, rx1102_tgt, rx1102_off
  rx1102_start:
    eq $I10, 1, rx1102_restart
    if_null rx1102_debug, debug_241
    rx1102_cur."!cursor_debug"("START", "quantifier:sym<?>")
  debug_241:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1104_done
    goto rxscan1104_scan
  rxscan1104_loop:
    ($P10) = rx1102_cur."from"()
    inc $P10
    set rx1102_pos, $P10
    ge rx1102_pos, rx1102_eos, rxscan1104_done
  rxscan1104_scan:
    set_addr $I10, rxscan1104_loop
    rx1102_cur."!mark_push"(0, rx1102_pos, $I10)
  rxscan1104_done:
.annotate 'line', 64
  # rx subcapture "sym"
    set_addr $I10, rxcap_1105_fail
    rx1102_cur."!mark_push"(0, rx1102_pos, $I10)
  # rx literal  "?"
    add $I11, rx1102_pos, 1
    gt $I11, rx1102_eos, rx1102_fail
    sub $I11, rx1102_pos, rx1102_off
    ord $I11, rx1102_tgt, $I11
    ne $I11, 63, rx1102_fail
    add rx1102_pos, 1
    set_addr $I10, rxcap_1105_fail
    ($I12, $I11) = rx1102_cur."!mark_peek"($I10)
    rx1102_cur."!cursor_pos"($I11)
    ($P10) = rx1102_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1102_pos, "")
    rx1102_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1105_done
  rxcap_1105_fail:
    goto rx1102_fail
  rxcap_1105_done:
  # rx subrule "backmod" subtype=capture negate=
    rx1102_cur."!cursor_pos"(rx1102_pos)
    $P10 = rx1102_cur."backmod"()
    unless $P10, rx1102_fail
    rx1102_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx1102_pos = $P10."pos"()
  # rx pass
    rx1102_cur."!cursor_pass"(rx1102_pos, "quantifier:sym<?>")
    if_null rx1102_debug, debug_242
    rx1102_cur."!cursor_debug"("PASS", "quantifier:sym<?>", " at pos=", rx1102_pos)
  debug_242:
    .return (rx1102_cur)
  rx1102_restart:
.annotate 'line', 3
    if_null rx1102_debug, debug_243
    rx1102_cur."!cursor_debug"("NEXT", "quantifier:sym<?>")
  debug_243:
  rx1102_fail:
    (rx1102_rep, rx1102_pos, $I10, $P10) = rx1102_cur."!mark_fail"(0)
    lt rx1102_pos, -1, rx1102_done
    eq rx1102_pos, -1, rx1102_fail
    jump $I10
  rx1102_done:
    rx1102_cur."!cursor_fail"()
    if_null rx1102_debug, debug_244
    rx1102_cur."!cursor_debug"("FAIL", "quantifier:sym<?>")
  debug_244:
    .return (rx1102_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<?>"  :subid("45_1309998843.21663") :method
.annotate 'line', 3
    $P100 = self."!PREFIX__!subrule"("backmod", "?")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<{N,M}>"  :subid("46_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .const 'Sub' $P1122 = "51_1309998843.21663" 
    capture_lex $P1122
    .const 'Sub' $P1117 = "50_1309998843.21663" 
    capture_lex $P1117
    .const 'Sub' $P1113 = "49_1309998843.21663" 
    capture_lex $P1113
    .const 'Sub' $P1111 = "48_1309998843.21663" 
    capture_lex $P1111
    .local string rx1107_tgt
    .local int rx1107_pos
    .local int rx1107_off
    .local int rx1107_eos
    .local int rx1107_rep
    .local pmc rx1107_cur
    .local pmc rx1107_debug
    (rx1107_cur, rx1107_pos, rx1107_tgt, $I10) = self."!cursor_start"()
    getattribute rx1107_debug, rx1107_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1107_cur
    .local pmc match
    .lex "$/", match
    length rx1107_eos, rx1107_tgt
    gt rx1107_pos, rx1107_eos, rx1107_done
    set rx1107_off, 0
    lt rx1107_pos, 2, rx1107_start
    sub rx1107_off, rx1107_pos, 1
    substr rx1107_tgt, rx1107_tgt, rx1107_off
  rx1107_start:
    eq $I10, 1, rx1107_restart
    if_null rx1107_debug, debug_245
    rx1107_cur."!cursor_debug"("START", "quantifier:sym<{N,M}>")
  debug_245:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1109_done
    goto rxscan1109_scan
  rxscan1109_loop:
    ($P10) = rx1107_cur."from"()
    inc $P10
    set rx1107_pos, $P10
    ge rx1107_pos, rx1107_eos, rxscan1109_done
  rxscan1109_scan:
    set_addr $I10, rxscan1109_loop
    rx1107_cur."!mark_push"(0, rx1107_pos, $I10)
  rxscan1109_done:
.annotate 'line', 65
    rx1107_cur."!cursor_pos"(rx1107_pos)
    find_lex $P101, unicode:"$\x{a2}"
    $P102 = $P101."MATCH"()
    store_lex "$/", $P102
    .const 'Sub' $P1111 = "48_1309998843.21663" 
    capture_lex $P1111
    $P103 = $P1111()
  # rx literal  "{"
    add $I11, rx1107_pos, 1
    gt $I11, rx1107_eos, rx1107_fail
    sub $I11, rx1107_pos, rx1107_off
    ord $I11, rx1107_tgt, $I11
    ne $I11, 123, rx1107_fail
    add rx1107_pos, 1
  # rx subrule $P1113 subtype=capture negate=
    rx1107_cur."!cursor_pos"(rx1107_pos)
    .const 'Sub' $P1113 = "49_1309998843.21663" 
    capture_lex $P1113
    $P10 = rx1107_cur.$P1113()
    unless $P10, rx1107_fail
    rx1107_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"(0)
    rx1107_pos = $P10."pos"()
  # rx subrule $P1117 subtype=capture negate=
    rx1107_cur."!cursor_pos"(rx1107_pos)
    .const 'Sub' $P1117 = "50_1309998843.21663" 
    capture_lex $P1117
    $P10 = rx1107_cur.$P1117()
    unless $P10, rx1107_fail
    rx1107_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("1")
    rx1107_pos = $P10."pos"()
  # rx subrule $P1122 subtype=capture negate=
    rx1107_cur."!cursor_pos"(rx1107_pos)
    .const 'Sub' $P1122 = "51_1309998843.21663" 
    capture_lex $P1122
    $P10 = rx1107_cur.$P1122()
    unless $P10, rx1107_fail
    rx1107_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("2")
    rx1107_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx1107_pos, 1
    gt $I11, rx1107_eos, rx1107_fail
    sub $I11, rx1107_pos, rx1107_off
    ord $I11, rx1107_tgt, $I11
    ne $I11, 125, rx1107_fail
    add rx1107_pos, 1
.annotate 'line', 66
  # rx subrule "obs" subtype=method negate=
    rx1107_cur."!cursor_pos"(rx1107_pos)
    $P10 = rx1107_cur."obs"("{N,M} as general quantifier", "** N..M (or ** N..*)")
    unless $P10, rx1107_fail
    rx1107_pos = $P10."pos"()
.annotate 'line', 65
  # rx pass
    rx1107_cur."!cursor_pass"(rx1107_pos, "quantifier:sym<{N,M}>")
    if_null rx1107_debug, debug_258
    rx1107_cur."!cursor_debug"("PASS", "quantifier:sym<{N,M}>", " at pos=", rx1107_pos)
  debug_258:
    .return (rx1107_cur)
  rx1107_restart:
.annotate 'line', 3
    if_null rx1107_debug, debug_259
    rx1107_cur."!cursor_debug"("NEXT", "quantifier:sym<{N,M}>")
  debug_259:
  rx1107_fail:
    (rx1107_rep, rx1107_pos, $I10, $P10) = rx1107_cur."!mark_fail"(0)
    lt rx1107_pos, -1, rx1107_done
    eq rx1107_pos, -1, rx1107_fail
    jump $I10
  rx1107_done:
    rx1107_cur."!cursor_fail"()
    if_null rx1107_debug, debug_260
    rx1107_cur."!cursor_debug"("FAIL", "quantifier:sym<{N,M}>")
  debug_260:
    .return (rx1107_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<{N,M}>"  :subid("47_1309998843.21663") :method
.annotate 'line', 3
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block1110"  :anon :subid("48_1309998843.21663") :outer("46_1309998843.21663")
.annotate 'line', 65
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block1112"  :anon :subid("49_1309998843.21663") :method :outer("46_1309998843.21663")
.annotate 'line', 65
    .local string rx1114_tgt
    .local int rx1114_pos
    .local int rx1114_off
    .local int rx1114_eos
    .local int rx1114_rep
    .local pmc rx1114_cur
    .local pmc rx1114_debug
    (rx1114_cur, rx1114_pos, rx1114_tgt, $I10) = self."!cursor_start"()
    getattribute rx1114_debug, rx1114_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1114_cur
    .local pmc match
    .lex "$/", match
    length rx1114_eos, rx1114_tgt
    gt rx1114_pos, rx1114_eos, rx1114_done
    set rx1114_off, 0
    lt rx1114_pos, 2, rx1114_start
    sub rx1114_off, rx1114_pos, 1
    substr rx1114_tgt, rx1114_tgt, rx1114_off
  rx1114_start:
    eq $I10, 1, rx1114_restart
    if_null rx1114_debug, debug_246
    rx1114_cur."!cursor_debug"("START", "")
  debug_246:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1115_done
    goto rxscan1115_scan
  rxscan1115_loop:
    ($P10) = rx1114_cur."from"()
    inc $P10
    set rx1114_pos, $P10
    ge rx1114_pos, rx1114_eos, rxscan1115_done
  rxscan1115_scan:
    set_addr $I10, rxscan1115_loop
    rx1114_cur."!mark_push"(0, rx1114_pos, $I10)
  rxscan1115_done:
  # rx charclass_q d r 1..-1
    sub $I10, rx1114_pos, rx1114_off
    find_not_cclass $I11, 8, rx1114_tgt, $I10, rx1114_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1114_fail
    add rx1114_pos, rx1114_off, $I11
  # rx pass
    rx1114_cur."!cursor_pass"(rx1114_pos, "")
    if_null rx1114_debug, debug_247
    rx1114_cur."!cursor_debug"("PASS", "", " at pos=", rx1114_pos)
  debug_247:
    .return (rx1114_cur)
  rx1114_restart:
    if_null rx1114_debug, debug_248
    rx1114_cur."!cursor_debug"("NEXT", "")
  debug_248:
  rx1114_fail:
    (rx1114_rep, rx1114_pos, $I10, $P10) = rx1114_cur."!mark_fail"(0)
    lt rx1114_pos, -1, rx1114_done
    eq rx1114_pos, -1, rx1114_fail
    jump $I10
  rx1114_done:
    rx1114_cur."!cursor_fail"()
    if_null rx1114_debug, debug_249
    rx1114_cur."!cursor_debug"("FAIL", "")
  debug_249:
    .return (rx1114_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block1116"  :anon :subid("50_1309998843.21663") :method :outer("46_1309998843.21663")
.annotate 'line', 65
    .local string rx1118_tgt
    .local int rx1118_pos
    .local int rx1118_off
    .local int rx1118_eos
    .local int rx1118_rep
    .local pmc rx1118_cur
    .local pmc rx1118_debug
    (rx1118_cur, rx1118_pos, rx1118_tgt, $I10) = self."!cursor_start"()
    getattribute rx1118_debug, rx1118_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1118_cur
    .local pmc match
    .lex "$/", match
    length rx1118_eos, rx1118_tgt
    gt rx1118_pos, rx1118_eos, rx1118_done
    set rx1118_off, 0
    lt rx1118_pos, 2, rx1118_start
    sub rx1118_off, rx1118_pos, 1
    substr rx1118_tgt, rx1118_tgt, rx1118_off
  rx1118_start:
    eq $I10, 1, rx1118_restart
    if_null rx1118_debug, debug_250
    rx1118_cur."!cursor_debug"("START", "")
  debug_250:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1119_done
    goto rxscan1119_scan
  rxscan1119_loop:
    ($P10) = rx1118_cur."from"()
    inc $P10
    set rx1118_pos, $P10
    ge rx1118_pos, rx1118_eos, rxscan1119_done
  rxscan1119_scan:
    set_addr $I10, rxscan1119_loop
    rx1118_cur."!mark_push"(0, rx1118_pos, $I10)
  rxscan1119_done:
  # rx rxquantr1120 ** 0..1
    set_addr $I10, rxquantr1120_done
    rx1118_cur."!mark_push"(0, rx1118_pos, $I10)
  rxquantr1120_loop:
  # rx literal  ","
    add $I11, rx1118_pos, 1
    gt $I11, rx1118_eos, rx1118_fail
    sub $I11, rx1118_pos, rx1118_off
    ord $I11, rx1118_tgt, $I11
    ne $I11, 44, rx1118_fail
    add rx1118_pos, 1
    set_addr $I10, rxquantr1120_done
    (rx1118_rep) = rx1118_cur."!mark_commit"($I10)
  rxquantr1120_done:
  # rx pass
    rx1118_cur."!cursor_pass"(rx1118_pos, "")
    if_null rx1118_debug, debug_251
    rx1118_cur."!cursor_debug"("PASS", "", " at pos=", rx1118_pos)
  debug_251:
    .return (rx1118_cur)
  rx1118_restart:
    if_null rx1118_debug, debug_252
    rx1118_cur."!cursor_debug"("NEXT", "")
  debug_252:
  rx1118_fail:
    (rx1118_rep, rx1118_pos, $I10, $P10) = rx1118_cur."!mark_fail"(0)
    lt rx1118_pos, -1, rx1118_done
    eq rx1118_pos, -1, rx1118_fail
    jump $I10
  rx1118_done:
    rx1118_cur."!cursor_fail"()
    if_null rx1118_debug, debug_253
    rx1118_cur."!cursor_debug"("FAIL", "")
  debug_253:
    .return (rx1118_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block1121"  :anon :subid("51_1309998843.21663") :method :outer("46_1309998843.21663")
.annotate 'line', 65
    .local string rx1123_tgt
    .local int rx1123_pos
    .local int rx1123_off
    .local int rx1123_eos
    .local int rx1123_rep
    .local pmc rx1123_cur
    .local pmc rx1123_debug
    (rx1123_cur, rx1123_pos, rx1123_tgt, $I10) = self."!cursor_start"()
    getattribute rx1123_debug, rx1123_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1123_cur
    .local pmc match
    .lex "$/", match
    length rx1123_eos, rx1123_tgt
    gt rx1123_pos, rx1123_eos, rx1123_done
    set rx1123_off, 0
    lt rx1123_pos, 2, rx1123_start
    sub rx1123_off, rx1123_pos, 1
    substr rx1123_tgt, rx1123_tgt, rx1123_off
  rx1123_start:
    eq $I10, 1, rx1123_restart
    if_null rx1123_debug, debug_254
    rx1123_cur."!cursor_debug"("START", "")
  debug_254:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1124_done
    goto rxscan1124_scan
  rxscan1124_loop:
    ($P10) = rx1123_cur."from"()
    inc $P10
    set rx1123_pos, $P10
    ge rx1123_pos, rx1123_eos, rxscan1124_done
  rxscan1124_scan:
    set_addr $I10, rxscan1124_loop
    rx1123_cur."!mark_push"(0, rx1123_pos, $I10)
  rxscan1124_done:
  # rx charclass_q d r 0..-1
    sub $I10, rx1123_pos, rx1123_off
    find_not_cclass $I11, 8, rx1123_tgt, $I10, rx1123_eos
    add rx1123_pos, rx1123_off, $I11
  # rx pass
    rx1123_cur."!cursor_pass"(rx1123_pos, "")
    if_null rx1123_debug, debug_255
    rx1123_cur."!cursor_debug"("PASS", "", " at pos=", rx1123_pos)
  debug_255:
    .return (rx1123_cur)
  rx1123_restart:
    if_null rx1123_debug, debug_256
    rx1123_cur."!cursor_debug"("NEXT", "")
  debug_256:
  rx1123_fail:
    (rx1123_rep, rx1123_pos, $I10, $P10) = rx1123_cur."!mark_fail"(0)
    lt rx1123_pos, -1, rx1123_done
    eq rx1123_pos, -1, rx1123_fail
    jump $I10
  rx1123_done:
    rx1123_cur."!cursor_fail"()
    if_null rx1123_debug, debug_257
    rx1123_cur."!cursor_debug"("FAIL", "")
  debug_257:
    .return (rx1123_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "quantifier:sym<**>"  :subid("52_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1126_tgt
    .local int rx1126_pos
    .local int rx1126_off
    .local int rx1126_eos
    .local int rx1126_rep
    .local pmc rx1126_cur
    .local pmc rx1126_debug
    (rx1126_cur, rx1126_pos, rx1126_tgt, $I10) = self."!cursor_start"()
    rx1126_cur."!cursor_caparray"("normspace", "max")
    getattribute rx1126_debug, rx1126_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1126_cur
    .local pmc match
    .lex "$/", match
    length rx1126_eos, rx1126_tgt
    gt rx1126_pos, rx1126_eos, rx1126_done
    set rx1126_off, 0
    lt rx1126_pos, 2, rx1126_start
    sub rx1126_off, rx1126_pos, 1
    substr rx1126_tgt, rx1126_tgt, rx1126_off
  rx1126_start:
    eq $I10, 1, rx1126_restart
    if_null rx1126_debug, debug_261
    rx1126_cur."!cursor_debug"("START", "quantifier:sym<**>")
  debug_261:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1128_done
    goto rxscan1128_scan
  rxscan1128_loop:
    ($P10) = rx1126_cur."from"()
    inc $P10
    set rx1126_pos, $P10
    ge rx1126_pos, rx1126_eos, rxscan1128_done
  rxscan1128_scan:
    set_addr $I10, rxscan1128_loop
    rx1126_cur."!mark_push"(0, rx1126_pos, $I10)
  rxscan1128_done:
.annotate 'line', 69
  # rx subcapture "sym"
    set_addr $I10, rxcap_1129_fail
    rx1126_cur."!mark_push"(0, rx1126_pos, $I10)
  # rx literal  "**"
    add $I11, rx1126_pos, 2
    gt $I11, rx1126_eos, rx1126_fail
    sub $I11, rx1126_pos, rx1126_off
    substr $S10, rx1126_tgt, $I11, 2
    ne $S10, "**", rx1126_fail
    add rx1126_pos, 2
    set_addr $I10, rxcap_1129_fail
    ($I12, $I11) = rx1126_cur."!mark_peek"($I10)
    rx1126_cur."!cursor_pos"($I11)
    ($P10) = rx1126_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1126_pos, "")
    rx1126_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1129_done
  rxcap_1129_fail:
    goto rx1126_fail
  rxcap_1129_done:
  # rx rxquantr1130 ** 0..1
    set_addr $I10, rxquantr1130_done
    rx1126_cur."!mark_push"(0, rx1126_pos, $I10)
  rxquantr1130_loop:
  # rx subrule "normspace" subtype=capture negate=
    rx1126_cur."!cursor_pos"(rx1126_pos)
    $P10 = rx1126_cur."normspace"()
    unless $P10, rx1126_fail
    goto rxsubrule1131_pass
  rxsubrule1131_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx1126_fail
  rxsubrule1131_pass:
    set_addr $I10, rxsubrule1131_back
    rx1126_cur."!mark_push"(0, rx1126_pos, $I10, $P10)
    $P10."!cursor_names"("normspace")
    rx1126_pos = $P10."pos"()
    set_addr $I10, rxquantr1130_done
    (rx1126_rep) = rx1126_cur."!mark_commit"($I10)
  rxquantr1130_done:
  # rx subrule "backmod" subtype=capture negate=
    rx1126_cur."!cursor_pos"(rx1126_pos)
    $P10 = rx1126_cur."backmod"()
    unless $P10, rx1126_fail
    rx1126_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backmod")
    rx1126_pos = $P10."pos"()
  # rx rxquantr1132 ** 0..1
    set_addr $I10, rxquantr1132_done
    rx1126_cur."!mark_push"(0, rx1126_pos, $I10)
  rxquantr1132_loop:
  # rx subrule "normspace" subtype=capture negate=
    rx1126_cur."!cursor_pos"(rx1126_pos)
    $P10 = rx1126_cur."normspace"()
    unless $P10, rx1126_fail
    goto rxsubrule1133_pass
  rxsubrule1133_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx1126_fail
  rxsubrule1133_pass:
    set_addr $I10, rxsubrule1133_back
    rx1126_cur."!mark_push"(0, rx1126_pos, $I10, $P10)
    $P10."!cursor_names"("normspace")
    rx1126_pos = $P10."pos"()
    set_addr $I10, rxquantr1132_done
    (rx1126_rep) = rx1126_cur."!mark_commit"($I10)
  rxquantr1132_done:
  alt1134_0:
.annotate 'line', 70
    set_addr $I10, alt1134_1
    rx1126_cur."!mark_push"(0, rx1126_pos, $I10)
.annotate 'line', 71
  # rx subcapture "min"
    set_addr $I10, rxcap_1135_fail
    rx1126_cur."!mark_push"(0, rx1126_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx1126_pos, rx1126_off
    find_not_cclass $I11, 8, rx1126_tgt, $I10, rx1126_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1126_fail
    add rx1126_pos, rx1126_off, $I11
    set_addr $I10, rxcap_1135_fail
    ($I12, $I11) = rx1126_cur."!mark_peek"($I10)
    rx1126_cur."!cursor_pos"($I11)
    ($P10) = rx1126_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1126_pos, "")
    rx1126_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("min")
    goto rxcap_1135_done
  rxcap_1135_fail:
    goto rx1126_fail
  rxcap_1135_done:
.annotate 'line', 78
  # rx rxquantr1136 ** 0..1
    set_addr $I10, rxquantr1136_done
    rx1126_cur."!mark_push"(0, rx1126_pos, $I10)
  rxquantr1136_loop:
.annotate 'line', 72
  # rx literal  ".."
    add $I11, rx1126_pos, 2
    gt $I11, rx1126_eos, rx1126_fail
    sub $I11, rx1126_pos, rx1126_off
    substr $S10, rx1126_tgt, $I11, 2
    ne $S10, "..", rx1126_fail
    add rx1126_pos, 2
.annotate 'line', 73
  # rx subcapture "max"
    set_addr $I10, rxcap_1138_fail
    rx1126_cur."!mark_push"(0, rx1126_pos, $I10)
  alt1137_0:
    set_addr $I10, alt1137_1
    rx1126_cur."!mark_push"(0, rx1126_pos, $I10)
.annotate 'line', 74
  # rx charclass_q d r 1..-1
    sub $I10, rx1126_pos, rx1126_off
    find_not_cclass $I11, 8, rx1126_tgt, $I10, rx1126_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1126_fail
    add rx1126_pos, rx1126_off, $I11
    goto alt1137_end
  alt1137_1:
    set_addr $I10, alt1137_2
    rx1126_cur."!mark_push"(0, rx1126_pos, $I10)
.annotate 'line', 75
  # rx literal  "*"
    add $I11, rx1126_pos, 1
    gt $I11, rx1126_eos, rx1126_fail
    sub $I11, rx1126_pos, rx1126_off
    ord $I11, rx1126_tgt, $I11
    ne $I11, 42, rx1126_fail
    add rx1126_pos, 1
    goto alt1137_end
  alt1137_2:
.annotate 'line', 76
  # rx subrule "panic" subtype=method negate=
    rx1126_cur."!cursor_pos"(rx1126_pos)
    $P10 = rx1126_cur."panic"("Only integers or '*' allowed as range quantifier endpoint")
    unless $P10, rx1126_fail
    rx1126_pos = $P10."pos"()
  alt1137_end:
.annotate 'line', 73
    set_addr $I10, rxcap_1138_fail
    ($I12, $I11) = rx1126_cur."!mark_peek"($I10)
    rx1126_cur."!cursor_pos"($I11)
    ($P10) = rx1126_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1126_pos, "")
    rx1126_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("max")
    goto rxcap_1138_done
  rxcap_1138_fail:
    goto rx1126_fail
  rxcap_1138_done:
.annotate 'line', 78
    set_addr $I10, rxquantr1136_done
    (rx1126_rep) = rx1126_cur."!mark_commit"($I10)
  rxquantr1136_done:
.annotate 'line', 71
    goto alt1134_end
  alt1134_1:
.annotate 'line', 79
  # rx subrule "quantified_atom" subtype=capture negate=
    rx1126_cur."!cursor_pos"(rx1126_pos)
    $P10 = rx1126_cur."quantified_atom"()
    unless $P10, rx1126_fail
    rx1126_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantified_atom")
    rx1126_pos = $P10."pos"()
  alt1134_end:
.annotate 'line', 68
  # rx pass
    rx1126_cur."!cursor_pass"(rx1126_pos, "quantifier:sym<**>")
    if_null rx1126_debug, debug_262
    rx1126_cur."!cursor_debug"("PASS", "quantifier:sym<**>", " at pos=", rx1126_pos)
  debug_262:
    .return (rx1126_cur)
  rx1126_restart:
.annotate 'line', 3
    if_null rx1126_debug, debug_263
    rx1126_cur."!cursor_debug"("NEXT", "quantifier:sym<**>")
  debug_263:
  rx1126_fail:
    (rx1126_rep, rx1126_pos, $I10, $P10) = rx1126_cur."!mark_fail"(0)
    lt rx1126_pos, -1, rx1126_done
    eq rx1126_pos, -1, rx1126_fail
    jump $I10
  rx1126_done:
    rx1126_cur."!cursor_fail"()
    if_null rx1126_debug, debug_264
    rx1126_cur."!cursor_debug"("FAIL", "quantifier:sym<**>")
  debug_264:
    .return (rx1126_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__quantifier:sym<**>"  :subid("53_1309998843.21663") :method
.annotate 'line', 3
    new $P100, "ResizablePMCArray"
    push $P100, "**"
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backmod"  :subid("54_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .const 'Sub' $P1146 = "56_1309998843.21663" 
    capture_lex $P1146
    .local string rx1140_tgt
    .local int rx1140_pos
    .local int rx1140_off
    .local int rx1140_eos
    .local int rx1140_rep
    .local pmc rx1140_cur
    .local pmc rx1140_debug
    (rx1140_cur, rx1140_pos, rx1140_tgt, $I10) = self."!cursor_start"()
    getattribute rx1140_debug, rx1140_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1140_cur
    .local pmc match
    .lex "$/", match
    length rx1140_eos, rx1140_tgt
    gt rx1140_pos, rx1140_eos, rx1140_done
    set rx1140_off, 0
    lt rx1140_pos, 2, rx1140_start
    sub rx1140_off, rx1140_pos, 1
    substr rx1140_tgt, rx1140_tgt, rx1140_off
  rx1140_start:
    eq $I10, 1, rx1140_restart
    if_null rx1140_debug, debug_265
    rx1140_cur."!cursor_debug"("START", "backmod")
  debug_265:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1142_done
    goto rxscan1142_scan
  rxscan1142_loop:
    ($P10) = rx1140_cur."from"()
    inc $P10
    set rx1140_pos, $P10
    ge rx1140_pos, rx1140_eos, rxscan1142_done
  rxscan1142_scan:
    set_addr $I10, rxscan1142_loop
    rx1140_cur."!mark_push"(0, rx1140_pos, $I10)
  rxscan1142_done:
.annotate 'line', 83
  # rx rxquantr1143 ** 0..1
    set_addr $I10, rxquantr1143_done
    rx1140_cur."!mark_push"(0, rx1140_pos, $I10)
  rxquantr1143_loop:
  # rx literal  ":"
    add $I11, rx1140_pos, 1
    gt $I11, rx1140_eos, rx1140_fail
    sub $I11, rx1140_pos, rx1140_off
    ord $I11, rx1140_tgt, $I11
    ne $I11, 58, rx1140_fail
    add rx1140_pos, 1
    set_addr $I10, rxquantr1143_done
    (rx1140_rep) = rx1140_cur."!mark_commit"($I10)
  rxquantr1143_done:
  alt1144_0:
    set_addr $I10, alt1144_1
    rx1140_cur."!mark_push"(0, rx1140_pos, $I10)
  # rx literal  "?"
    add $I11, rx1140_pos, 1
    gt $I11, rx1140_eos, rx1140_fail
    sub $I11, rx1140_pos, rx1140_off
    ord $I11, rx1140_tgt, $I11
    ne $I11, 63, rx1140_fail
    add rx1140_pos, 1
    goto alt1144_end
  alt1144_1:
    set_addr $I10, alt1144_2
    rx1140_cur."!mark_push"(0, rx1140_pos, $I10)
  # rx literal  "!"
    add $I11, rx1140_pos, 1
    gt $I11, rx1140_eos, rx1140_fail
    sub $I11, rx1140_pos, rx1140_off
    ord $I11, rx1140_tgt, $I11
    ne $I11, 33, rx1140_fail
    add rx1140_pos, 1
    goto alt1144_end
  alt1144_2:
  # rx subrule "before" subtype=zerowidth negate=1
    rx1140_cur."!cursor_pos"(rx1140_pos)
    .const 'Sub' $P1146 = "56_1309998843.21663" 
    capture_lex $P1146
    $P10 = rx1140_cur."before"($P1146)
    if $P10, rx1140_fail
  alt1144_end:
  # rx pass
    rx1140_cur."!cursor_pass"(rx1140_pos, "backmod")
    if_null rx1140_debug, debug_270
    rx1140_cur."!cursor_debug"("PASS", "backmod", " at pos=", rx1140_pos)
  debug_270:
    .return (rx1140_cur)
  rx1140_restart:
.annotate 'line', 3
    if_null rx1140_debug, debug_271
    rx1140_cur."!cursor_debug"("NEXT", "backmod")
  debug_271:
  rx1140_fail:
    (rx1140_rep, rx1140_pos, $I10, $P10) = rx1140_cur."!mark_fail"(0)
    lt rx1140_pos, -1, rx1140_done
    eq rx1140_pos, -1, rx1140_fail
    jump $I10
  rx1140_done:
    rx1140_cur."!cursor_fail"()
    if_null rx1140_debug, debug_272
    rx1140_cur."!cursor_debug"("FAIL", "backmod")
  debug_272:
    .return (rx1140_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backmod"  :subid("55_1309998843.21663") :method
.annotate 'line', 3
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block1145"  :anon :subid("56_1309998843.21663") :method :outer("54_1309998843.21663")
.annotate 'line', 83
    .local string rx1147_tgt
    .local int rx1147_pos
    .local int rx1147_off
    .local int rx1147_eos
    .local int rx1147_rep
    .local pmc rx1147_cur
    .local pmc rx1147_debug
    (rx1147_cur, rx1147_pos, rx1147_tgt, $I10) = self."!cursor_start"()
    getattribute rx1147_debug, rx1147_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1147_cur
    .local pmc match
    .lex "$/", match
    length rx1147_eos, rx1147_tgt
    gt rx1147_pos, rx1147_eos, rx1147_done
    set rx1147_off, 0
    lt rx1147_pos, 2, rx1147_start
    sub rx1147_off, rx1147_pos, 1
    substr rx1147_tgt, rx1147_tgt, rx1147_off
  rx1147_start:
    eq $I10, 1, rx1147_restart
    if_null rx1147_debug, debug_266
    rx1147_cur."!cursor_debug"("START", "")
  debug_266:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1148_done
    goto rxscan1148_scan
  rxscan1148_loop:
    ($P10) = rx1147_cur."from"()
    inc $P10
    set rx1147_pos, $P10
    ge rx1147_pos, rx1147_eos, rxscan1148_done
  rxscan1148_scan:
    set_addr $I10, rxscan1148_loop
    rx1147_cur."!mark_push"(0, rx1147_pos, $I10)
  rxscan1148_done:
  # rx literal  ":"
    add $I11, rx1147_pos, 1
    gt $I11, rx1147_eos, rx1147_fail
    sub $I11, rx1147_pos, rx1147_off
    ord $I11, rx1147_tgt, $I11
    ne $I11, 58, rx1147_fail
    add rx1147_pos, 1
  # rx pass
    rx1147_cur."!cursor_pass"(rx1147_pos, "")
    if_null rx1147_debug, debug_267
    rx1147_cur."!cursor_debug"("PASS", "", " at pos=", rx1147_pos)
  debug_267:
    .return (rx1147_cur)
  rx1147_restart:
    if_null rx1147_debug, debug_268
    rx1147_cur."!cursor_debug"("NEXT", "")
  debug_268:
  rx1147_fail:
    (rx1147_rep, rx1147_pos, $I10, $P10) = rx1147_cur."!mark_fail"(0)
    lt rx1147_pos, -1, rx1147_done
    eq rx1147_pos, -1, rx1147_fail
    jump $I10
  rx1147_done:
    rx1147_cur."!cursor_fail"()
    if_null rx1147_debug, debug_269
    rx1147_cur."!cursor_debug"("FAIL", "")
  debug_269:
    .return (rx1147_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar"  :subid("57_1309998843.21663") :method
.annotate 'line', 85
    $P100 = self."!protoregex"("metachar")
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar"  :subid("58_1309998843.21663") :method
.annotate 'line', 85
    $P101 = self."!PREFIX__!protoregex"("metachar")
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<ws>"  :subid("59_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1152_tgt
    .local int rx1152_pos
    .local int rx1152_off
    .local int rx1152_eos
    .local int rx1152_rep
    .local pmc rx1152_cur
    .local pmc rx1152_debug
    (rx1152_cur, rx1152_pos, rx1152_tgt, $I10) = self."!cursor_start"()
    getattribute rx1152_debug, rx1152_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1152_cur
    .local pmc match
    .lex "$/", match
    length rx1152_eos, rx1152_tgt
    gt rx1152_pos, rx1152_eos, rx1152_done
    set rx1152_off, 0
    lt rx1152_pos, 2, rx1152_start
    sub rx1152_off, rx1152_pos, 1
    substr rx1152_tgt, rx1152_tgt, rx1152_off
  rx1152_start:
    eq $I10, 1, rx1152_restart
    if_null rx1152_debug, debug_273
    rx1152_cur."!cursor_debug"("START", "metachar:sym<ws>")
  debug_273:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1154_done
    goto rxscan1154_scan
  rxscan1154_loop:
    ($P10) = rx1152_cur."from"()
    inc $P10
    set rx1152_pos, $P10
    ge rx1152_pos, rx1152_eos, rxscan1154_done
  rxscan1154_scan:
    set_addr $I10, rxscan1154_loop
    rx1152_cur."!mark_push"(0, rx1152_pos, $I10)
  rxscan1154_done:
.annotate 'line', 86
  # rx subrule "normspace" subtype=method negate=
    rx1152_cur."!cursor_pos"(rx1152_pos)
    $P10 = rx1152_cur."normspace"()
    unless $P10, rx1152_fail
    rx1152_pos = $P10."pos"()
  # rx pass
    rx1152_cur."!cursor_pass"(rx1152_pos, "metachar:sym<ws>")
    if_null rx1152_debug, debug_274
    rx1152_cur."!cursor_debug"("PASS", "metachar:sym<ws>", " at pos=", rx1152_pos)
  debug_274:
    .return (rx1152_cur)
  rx1152_restart:
.annotate 'line', 3
    if_null rx1152_debug, debug_275
    rx1152_cur."!cursor_debug"("NEXT", "metachar:sym<ws>")
  debug_275:
  rx1152_fail:
    (rx1152_rep, rx1152_pos, $I10, $P10) = rx1152_cur."!mark_fail"(0)
    lt rx1152_pos, -1, rx1152_done
    eq rx1152_pos, -1, rx1152_fail
    jump $I10
  rx1152_done:
    rx1152_cur."!cursor_fail"()
    if_null rx1152_debug, debug_276
    rx1152_cur."!cursor_debug"("FAIL", "metachar:sym<ws>")
  debug_276:
    .return (rx1152_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<ws>"  :subid("60_1309998843.21663") :method
.annotate 'line', 3
    $P100 = self."!PREFIX__!subrule"("normspace", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<[ ]>"  :subid("61_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1156_tgt
    .local int rx1156_pos
    .local int rx1156_off
    .local int rx1156_eos
    .local int rx1156_rep
    .local pmc rx1156_cur
    .local pmc rx1156_debug
    (rx1156_cur, rx1156_pos, rx1156_tgt, $I10) = self."!cursor_start"()
    getattribute rx1156_debug, rx1156_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1156_cur
    .local pmc match
    .lex "$/", match
    length rx1156_eos, rx1156_tgt
    gt rx1156_pos, rx1156_eos, rx1156_done
    set rx1156_off, 0
    lt rx1156_pos, 2, rx1156_start
    sub rx1156_off, rx1156_pos, 1
    substr rx1156_tgt, rx1156_tgt, rx1156_off
  rx1156_start:
    eq $I10, 1, rx1156_restart
    if_null rx1156_debug, debug_277
    rx1156_cur."!cursor_debug"("START", "metachar:sym<[ ]>")
  debug_277:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1158_done
    goto rxscan1158_scan
  rxscan1158_loop:
    ($P10) = rx1156_cur."from"()
    inc $P10
    set rx1156_pos, $P10
    ge rx1156_pos, rx1156_eos, rxscan1158_done
  rxscan1158_scan:
    set_addr $I10, rxscan1158_loop
    rx1156_cur."!mark_push"(0, rx1156_pos, $I10)
  rxscan1158_done:
.annotate 'line', 87
  # rx literal  "["
    add $I11, rx1156_pos, 1
    gt $I11, rx1156_eos, rx1156_fail
    sub $I11, rx1156_pos, rx1156_off
    ord $I11, rx1156_tgt, $I11
    ne $I11, 91, rx1156_fail
    add rx1156_pos, 1
  # rx subrule "nibbler" subtype=capture negate=
    rx1156_cur."!cursor_pos"(rx1156_pos)
    $P10 = rx1156_cur."nibbler"()
    unless $P10, rx1156_fail
    rx1156_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx1156_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx1156_pos, 1
    gt $I11, rx1156_eos, rx1156_fail
    sub $I11, rx1156_pos, rx1156_off
    ord $I11, rx1156_tgt, $I11
    ne $I11, 93, rx1156_fail
    add rx1156_pos, 1
  # rx pass
    rx1156_cur."!cursor_pass"(rx1156_pos, "metachar:sym<[ ]>")
    if_null rx1156_debug, debug_278
    rx1156_cur."!cursor_debug"("PASS", "metachar:sym<[ ]>", " at pos=", rx1156_pos)
  debug_278:
    .return (rx1156_cur)
  rx1156_restart:
.annotate 'line', 3
    if_null rx1156_debug, debug_279
    rx1156_cur."!cursor_debug"("NEXT", "metachar:sym<[ ]>")
  debug_279:
  rx1156_fail:
    (rx1156_rep, rx1156_pos, $I10, $P10) = rx1156_cur."!mark_fail"(0)
    lt rx1156_pos, -1, rx1156_done
    eq rx1156_pos, -1, rx1156_fail
    jump $I10
  rx1156_done:
    rx1156_cur."!cursor_fail"()
    if_null rx1156_debug, debug_280
    rx1156_cur."!cursor_debug"("FAIL", "metachar:sym<[ ]>")
  debug_280:
    .return (rx1156_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<[ ]>"  :subid("62_1309998843.21663") :method
.annotate 'line', 3
    $P100 = self."!PREFIX__!subrule"("nibbler", "[")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<( )>"  :subid("63_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1160_tgt
    .local int rx1160_pos
    .local int rx1160_off
    .local int rx1160_eos
    .local int rx1160_rep
    .local pmc rx1160_cur
    .local pmc rx1160_debug
    (rx1160_cur, rx1160_pos, rx1160_tgt, $I10) = self."!cursor_start"()
    getattribute rx1160_debug, rx1160_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1160_cur
    .local pmc match
    .lex "$/", match
    length rx1160_eos, rx1160_tgt
    gt rx1160_pos, rx1160_eos, rx1160_done
    set rx1160_off, 0
    lt rx1160_pos, 2, rx1160_start
    sub rx1160_off, rx1160_pos, 1
    substr rx1160_tgt, rx1160_tgt, rx1160_off
  rx1160_start:
    eq $I10, 1, rx1160_restart
    if_null rx1160_debug, debug_281
    rx1160_cur."!cursor_debug"("START", "metachar:sym<( )>")
  debug_281:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1162_done
    goto rxscan1162_scan
  rxscan1162_loop:
    ($P10) = rx1160_cur."from"()
    inc $P10
    set rx1160_pos, $P10
    ge rx1160_pos, rx1160_eos, rxscan1162_done
  rxscan1162_scan:
    set_addr $I10, rxscan1162_loop
    rx1160_cur."!mark_push"(0, rx1160_pos, $I10)
  rxscan1162_done:
.annotate 'line', 88
  # rx literal  "("
    add $I11, rx1160_pos, 1
    gt $I11, rx1160_eos, rx1160_fail
    sub $I11, rx1160_pos, rx1160_off
    ord $I11, rx1160_tgt, $I11
    ne $I11, 40, rx1160_fail
    add rx1160_pos, 1
  # rx subrule "nibbler" subtype=capture negate=
    rx1160_cur."!cursor_pos"(rx1160_pos)
    $P10 = rx1160_cur."nibbler"()
    unless $P10, rx1160_fail
    rx1160_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx1160_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1160_pos, 1
    gt $I11, rx1160_eos, rx1160_fail
    sub $I11, rx1160_pos, rx1160_off
    ord $I11, rx1160_tgt, $I11
    ne $I11, 41, rx1160_fail
    add rx1160_pos, 1
  # rx pass
    rx1160_cur."!cursor_pass"(rx1160_pos, "metachar:sym<( )>")
    if_null rx1160_debug, debug_282
    rx1160_cur."!cursor_debug"("PASS", "metachar:sym<( )>", " at pos=", rx1160_pos)
  debug_282:
    .return (rx1160_cur)
  rx1160_restart:
.annotate 'line', 3
    if_null rx1160_debug, debug_283
    rx1160_cur."!cursor_debug"("NEXT", "metachar:sym<( )>")
  debug_283:
  rx1160_fail:
    (rx1160_rep, rx1160_pos, $I10, $P10) = rx1160_cur."!mark_fail"(0)
    lt rx1160_pos, -1, rx1160_done
    eq rx1160_pos, -1, rx1160_fail
    jump $I10
  rx1160_done:
    rx1160_cur."!cursor_fail"()
    if_null rx1160_debug, debug_284
    rx1160_cur."!cursor_debug"("FAIL", "metachar:sym<( )>")
  debug_284:
    .return (rx1160_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<( )>"  :subid("64_1309998843.21663") :method
.annotate 'line', 3
    $P100 = self."!PREFIX__!subrule"("nibbler", "(")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<'>"  :subid("65_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1164_tgt
    .local int rx1164_pos
    .local int rx1164_off
    .local int rx1164_eos
    .local int rx1164_rep
    .local pmc rx1164_cur
    .local pmc rx1164_debug
    (rx1164_cur, rx1164_pos, rx1164_tgt, $I10) = self."!cursor_start"()
    getattribute rx1164_debug, rx1164_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1164_cur
    .local pmc match
    .lex "$/", match
    length rx1164_eos, rx1164_tgt
    gt rx1164_pos, rx1164_eos, rx1164_done
    set rx1164_off, 0
    lt rx1164_pos, 2, rx1164_start
    sub rx1164_off, rx1164_pos, 1
    substr rx1164_tgt, rx1164_tgt, rx1164_off
  rx1164_start:
    eq $I10, 1, rx1164_restart
    if_null rx1164_debug, debug_285
    rx1164_cur."!cursor_debug"("START", "metachar:sym<'>")
  debug_285:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1166_done
    goto rxscan1166_scan
  rxscan1166_loop:
    ($P10) = rx1164_cur."from"()
    inc $P10
    set rx1164_pos, $P10
    ge rx1164_pos, rx1164_eos, rxscan1166_done
  rxscan1166_scan:
    set_addr $I10, rxscan1166_loop
    rx1164_cur."!mark_push"(0, rx1164_pos, $I10)
  rxscan1166_done:
.annotate 'line', 89
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1164_pos, rx1164_off
    substr $S10, rx1164_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx1164_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx1164_cur."!cursor_pos"(rx1164_pos)
    $P10 = rx1164_cur."quote_EXPR"(":q")
    unless $P10, rx1164_fail
    rx1164_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx1164_pos = $P10."pos"()
  # rx pass
    rx1164_cur."!cursor_pass"(rx1164_pos, "metachar:sym<'>")
    if_null rx1164_debug, debug_286
    rx1164_cur."!cursor_debug"("PASS", "metachar:sym<'>", " at pos=", rx1164_pos)
  debug_286:
    .return (rx1164_cur)
  rx1164_restart:
.annotate 'line', 3
    if_null rx1164_debug, debug_287
    rx1164_cur."!cursor_debug"("NEXT", "metachar:sym<'>")
  debug_287:
  rx1164_fail:
    (rx1164_rep, rx1164_pos, $I10, $P10) = rx1164_cur."!mark_fail"(0)
    lt rx1164_pos, -1, rx1164_done
    eq rx1164_pos, -1, rx1164_fail
    jump $I10
  rx1164_done:
    rx1164_cur."!cursor_fail"()
    if_null rx1164_debug, debug_288
    rx1164_cur."!cursor_debug"("FAIL", "metachar:sym<'>")
  debug_288:
    .return (rx1164_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<'>"  :subid("66_1309998843.21663") :method
.annotate 'line', 3
    new $P100, "ResizablePMCArray"
    push $P100, "'"
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<\">"  :subid("67_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1168_tgt
    .local int rx1168_pos
    .local int rx1168_off
    .local int rx1168_eos
    .local int rx1168_rep
    .local pmc rx1168_cur
    .local pmc rx1168_debug
    (rx1168_cur, rx1168_pos, rx1168_tgt, $I10) = self."!cursor_start"()
    getattribute rx1168_debug, rx1168_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1168_cur
    .local pmc match
    .lex "$/", match
    length rx1168_eos, rx1168_tgt
    gt rx1168_pos, rx1168_eos, rx1168_done
    set rx1168_off, 0
    lt rx1168_pos, 2, rx1168_start
    sub rx1168_off, rx1168_pos, 1
    substr rx1168_tgt, rx1168_tgt, rx1168_off
  rx1168_start:
    eq $I10, 1, rx1168_restart
    if_null rx1168_debug, debug_289
    rx1168_cur."!cursor_debug"("START", "metachar:sym<\">")
  debug_289:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1170_done
    goto rxscan1170_scan
  rxscan1170_loop:
    ($P10) = rx1168_cur."from"()
    inc $P10
    set rx1168_pos, $P10
    ge rx1168_pos, rx1168_eos, rxscan1170_done
  rxscan1170_scan:
    set_addr $I10, rxscan1170_loop
    rx1168_cur."!mark_push"(0, rx1168_pos, $I10)
  rxscan1170_done:
.annotate 'line', 90
  # rx enumcharlist negate=0 zerowidth
    sub $I10, rx1168_pos, rx1168_off
    substr $S10, rx1168_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx1168_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx1168_cur."!cursor_pos"(rx1168_pos)
    $P10 = rx1168_cur."quote_EXPR"(":qq")
    unless $P10, rx1168_fail
    rx1168_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx1168_pos = $P10."pos"()
  # rx pass
    rx1168_cur."!cursor_pass"(rx1168_pos, "metachar:sym<\">")
    if_null rx1168_debug, debug_290
    rx1168_cur."!cursor_debug"("PASS", "metachar:sym<\">", " at pos=", rx1168_pos)
  debug_290:
    .return (rx1168_cur)
  rx1168_restart:
.annotate 'line', 3
    if_null rx1168_debug, debug_291
    rx1168_cur."!cursor_debug"("NEXT", "metachar:sym<\">")
  debug_291:
  rx1168_fail:
    (rx1168_rep, rx1168_pos, $I10, $P10) = rx1168_cur."!mark_fail"(0)
    lt rx1168_pos, -1, rx1168_done
    eq rx1168_pos, -1, rx1168_fail
    jump $I10
  rx1168_done:
    rx1168_cur."!cursor_fail"()
    if_null rx1168_debug, debug_292
    rx1168_cur."!cursor_debug"("FAIL", "metachar:sym<\">")
  debug_292:
    .return (rx1168_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<\">"  :subid("68_1309998843.21663") :method
.annotate 'line', 3
    new $P100, "ResizablePMCArray"
    push $P100, "\""
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<.>"  :subid("69_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1172_tgt
    .local int rx1172_pos
    .local int rx1172_off
    .local int rx1172_eos
    .local int rx1172_rep
    .local pmc rx1172_cur
    .local pmc rx1172_debug
    (rx1172_cur, rx1172_pos, rx1172_tgt, $I10) = self."!cursor_start"()
    getattribute rx1172_debug, rx1172_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1172_cur
    .local pmc match
    .lex "$/", match
    length rx1172_eos, rx1172_tgt
    gt rx1172_pos, rx1172_eos, rx1172_done
    set rx1172_off, 0
    lt rx1172_pos, 2, rx1172_start
    sub rx1172_off, rx1172_pos, 1
    substr rx1172_tgt, rx1172_tgt, rx1172_off
  rx1172_start:
    eq $I10, 1, rx1172_restart
    if_null rx1172_debug, debug_293
    rx1172_cur."!cursor_debug"("START", "metachar:sym<.>")
  debug_293:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1174_done
    goto rxscan1174_scan
  rxscan1174_loop:
    ($P10) = rx1172_cur."from"()
    inc $P10
    set rx1172_pos, $P10
    ge rx1172_pos, rx1172_eos, rxscan1174_done
  rxscan1174_scan:
    set_addr $I10, rxscan1174_loop
    rx1172_cur."!mark_push"(0, rx1172_pos, $I10)
  rxscan1174_done:
.annotate 'line', 91
  # rx subcapture "sym"
    set_addr $I10, rxcap_1175_fail
    rx1172_cur."!mark_push"(0, rx1172_pos, $I10)
  # rx literal  "."
    add $I11, rx1172_pos, 1
    gt $I11, rx1172_eos, rx1172_fail
    sub $I11, rx1172_pos, rx1172_off
    ord $I11, rx1172_tgt, $I11
    ne $I11, 46, rx1172_fail
    add rx1172_pos, 1
    set_addr $I10, rxcap_1175_fail
    ($I12, $I11) = rx1172_cur."!mark_peek"($I10)
    rx1172_cur."!cursor_pos"($I11)
    ($P10) = rx1172_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1172_pos, "")
    rx1172_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1175_done
  rxcap_1175_fail:
    goto rx1172_fail
  rxcap_1175_done:
  # rx pass
    rx1172_cur."!cursor_pass"(rx1172_pos, "metachar:sym<.>")
    if_null rx1172_debug, debug_294
    rx1172_cur."!cursor_debug"("PASS", "metachar:sym<.>", " at pos=", rx1172_pos)
  debug_294:
    .return (rx1172_cur)
  rx1172_restart:
.annotate 'line', 3
    if_null rx1172_debug, debug_295
    rx1172_cur."!cursor_debug"("NEXT", "metachar:sym<.>")
  debug_295:
  rx1172_fail:
    (rx1172_rep, rx1172_pos, $I10, $P10) = rx1172_cur."!mark_fail"(0)
    lt rx1172_pos, -1, rx1172_done
    eq rx1172_pos, -1, rx1172_fail
    jump $I10
  rx1172_done:
    rx1172_cur."!cursor_fail"()
    if_null rx1172_debug, debug_296
    rx1172_cur."!cursor_debug"("FAIL", "metachar:sym<.>")
  debug_296:
    .return (rx1172_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<.>"  :subid("70_1309998843.21663") :method
.annotate 'line', 3
    new $P100, "ResizablePMCArray"
    push $P100, "."
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^>"  :subid("71_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1177_tgt
    .local int rx1177_pos
    .local int rx1177_off
    .local int rx1177_eos
    .local int rx1177_rep
    .local pmc rx1177_cur
    .local pmc rx1177_debug
    (rx1177_cur, rx1177_pos, rx1177_tgt, $I10) = self."!cursor_start"()
    getattribute rx1177_debug, rx1177_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1177_cur
    .local pmc match
    .lex "$/", match
    length rx1177_eos, rx1177_tgt
    gt rx1177_pos, rx1177_eos, rx1177_done
    set rx1177_off, 0
    lt rx1177_pos, 2, rx1177_start
    sub rx1177_off, rx1177_pos, 1
    substr rx1177_tgt, rx1177_tgt, rx1177_off
  rx1177_start:
    eq $I10, 1, rx1177_restart
    if_null rx1177_debug, debug_297
    rx1177_cur."!cursor_debug"("START", "metachar:sym<^>")
  debug_297:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1179_done
    goto rxscan1179_scan
  rxscan1179_loop:
    ($P10) = rx1177_cur."from"()
    inc $P10
    set rx1177_pos, $P10
    ge rx1177_pos, rx1177_eos, rxscan1179_done
  rxscan1179_scan:
    set_addr $I10, rxscan1179_loop
    rx1177_cur."!mark_push"(0, rx1177_pos, $I10)
  rxscan1179_done:
.annotate 'line', 92
  # rx subcapture "sym"
    set_addr $I10, rxcap_1180_fail
    rx1177_cur."!mark_push"(0, rx1177_pos, $I10)
  # rx literal  "^"
    add $I11, rx1177_pos, 1
    gt $I11, rx1177_eos, rx1177_fail
    sub $I11, rx1177_pos, rx1177_off
    ord $I11, rx1177_tgt, $I11
    ne $I11, 94, rx1177_fail
    add rx1177_pos, 1
    set_addr $I10, rxcap_1180_fail
    ($I12, $I11) = rx1177_cur."!mark_peek"($I10)
    rx1177_cur."!cursor_pos"($I11)
    ($P10) = rx1177_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1177_pos, "")
    rx1177_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1180_done
  rxcap_1180_fail:
    goto rx1177_fail
  rxcap_1180_done:
  # rx pass
    rx1177_cur."!cursor_pass"(rx1177_pos, "metachar:sym<^>")
    if_null rx1177_debug, debug_298
    rx1177_cur."!cursor_debug"("PASS", "metachar:sym<^>", " at pos=", rx1177_pos)
  debug_298:
    .return (rx1177_cur)
  rx1177_restart:
.annotate 'line', 3
    if_null rx1177_debug, debug_299
    rx1177_cur."!cursor_debug"("NEXT", "metachar:sym<^>")
  debug_299:
  rx1177_fail:
    (rx1177_rep, rx1177_pos, $I10, $P10) = rx1177_cur."!mark_fail"(0)
    lt rx1177_pos, -1, rx1177_done
    eq rx1177_pos, -1, rx1177_fail
    jump $I10
  rx1177_done:
    rx1177_cur."!cursor_fail"()
    if_null rx1177_debug, debug_300
    rx1177_cur."!cursor_debug"("FAIL", "metachar:sym<^>")
  debug_300:
    .return (rx1177_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<^>"  :subid("72_1309998843.21663") :method
.annotate 'line', 3
    new $P100, "ResizablePMCArray"
    push $P100, "^"
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<^^>"  :subid("73_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1182_tgt
    .local int rx1182_pos
    .local int rx1182_off
    .local int rx1182_eos
    .local int rx1182_rep
    .local pmc rx1182_cur
    .local pmc rx1182_debug
    (rx1182_cur, rx1182_pos, rx1182_tgt, $I10) = self."!cursor_start"()
    getattribute rx1182_debug, rx1182_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1182_cur
    .local pmc match
    .lex "$/", match
    length rx1182_eos, rx1182_tgt
    gt rx1182_pos, rx1182_eos, rx1182_done
    set rx1182_off, 0
    lt rx1182_pos, 2, rx1182_start
    sub rx1182_off, rx1182_pos, 1
    substr rx1182_tgt, rx1182_tgt, rx1182_off
  rx1182_start:
    eq $I10, 1, rx1182_restart
    if_null rx1182_debug, debug_301
    rx1182_cur."!cursor_debug"("START", "metachar:sym<^^>")
  debug_301:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1184_done
    goto rxscan1184_scan
  rxscan1184_loop:
    ($P10) = rx1182_cur."from"()
    inc $P10
    set rx1182_pos, $P10
    ge rx1182_pos, rx1182_eos, rxscan1184_done
  rxscan1184_scan:
    set_addr $I10, rxscan1184_loop
    rx1182_cur."!mark_push"(0, rx1182_pos, $I10)
  rxscan1184_done:
.annotate 'line', 93
  # rx subcapture "sym"
    set_addr $I10, rxcap_1185_fail
    rx1182_cur."!mark_push"(0, rx1182_pos, $I10)
  # rx literal  "^^"
    add $I11, rx1182_pos, 2
    gt $I11, rx1182_eos, rx1182_fail
    sub $I11, rx1182_pos, rx1182_off
    substr $S10, rx1182_tgt, $I11, 2
    ne $S10, "^^", rx1182_fail
    add rx1182_pos, 2
    set_addr $I10, rxcap_1185_fail
    ($I12, $I11) = rx1182_cur."!mark_peek"($I10)
    rx1182_cur."!cursor_pos"($I11)
    ($P10) = rx1182_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1182_pos, "")
    rx1182_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1185_done
  rxcap_1185_fail:
    goto rx1182_fail
  rxcap_1185_done:
  # rx pass
    rx1182_cur."!cursor_pass"(rx1182_pos, "metachar:sym<^^>")
    if_null rx1182_debug, debug_302
    rx1182_cur."!cursor_debug"("PASS", "metachar:sym<^^>", " at pos=", rx1182_pos)
  debug_302:
    .return (rx1182_cur)
  rx1182_restart:
.annotate 'line', 3
    if_null rx1182_debug, debug_303
    rx1182_cur."!cursor_debug"("NEXT", "metachar:sym<^^>")
  debug_303:
  rx1182_fail:
    (rx1182_rep, rx1182_pos, $I10, $P10) = rx1182_cur."!mark_fail"(0)
    lt rx1182_pos, -1, rx1182_done
    eq rx1182_pos, -1, rx1182_fail
    jump $I10
  rx1182_done:
    rx1182_cur."!cursor_fail"()
    if_null rx1182_debug, debug_304
    rx1182_cur."!cursor_debug"("FAIL", "metachar:sym<^^>")
  debug_304:
    .return (rx1182_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<^^>"  :subid("74_1309998843.21663") :method
.annotate 'line', 3
    new $P100, "ResizablePMCArray"
    push $P100, "^^"
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$>"  :subid("75_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1187_tgt
    .local int rx1187_pos
    .local int rx1187_off
    .local int rx1187_eos
    .local int rx1187_rep
    .local pmc rx1187_cur
    .local pmc rx1187_debug
    (rx1187_cur, rx1187_pos, rx1187_tgt, $I10) = self."!cursor_start"()
    getattribute rx1187_debug, rx1187_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1187_cur
    .local pmc match
    .lex "$/", match
    length rx1187_eos, rx1187_tgt
    gt rx1187_pos, rx1187_eos, rx1187_done
    set rx1187_off, 0
    lt rx1187_pos, 2, rx1187_start
    sub rx1187_off, rx1187_pos, 1
    substr rx1187_tgt, rx1187_tgt, rx1187_off
  rx1187_start:
    eq $I10, 1, rx1187_restart
    if_null rx1187_debug, debug_305
    rx1187_cur."!cursor_debug"("START", "metachar:sym<$>")
  debug_305:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1189_done
    goto rxscan1189_scan
  rxscan1189_loop:
    ($P10) = rx1187_cur."from"()
    inc $P10
    set rx1187_pos, $P10
    ge rx1187_pos, rx1187_eos, rxscan1189_done
  rxscan1189_scan:
    set_addr $I10, rxscan1189_loop
    rx1187_cur."!mark_push"(0, rx1187_pos, $I10)
  rxscan1189_done:
.annotate 'line', 94
  # rx subcapture "sym"
    set_addr $I10, rxcap_1190_fail
    rx1187_cur."!mark_push"(0, rx1187_pos, $I10)
  # rx literal  "$"
    add $I11, rx1187_pos, 1
    gt $I11, rx1187_eos, rx1187_fail
    sub $I11, rx1187_pos, rx1187_off
    ord $I11, rx1187_tgt, $I11
    ne $I11, 36, rx1187_fail
    add rx1187_pos, 1
    set_addr $I10, rxcap_1190_fail
    ($I12, $I11) = rx1187_cur."!mark_peek"($I10)
    rx1187_cur."!cursor_pos"($I11)
    ($P10) = rx1187_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1187_pos, "")
    rx1187_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1190_done
  rxcap_1190_fail:
    goto rx1187_fail
  rxcap_1190_done:
  # rx pass
    rx1187_cur."!cursor_pass"(rx1187_pos, "metachar:sym<$>")
    if_null rx1187_debug, debug_306
    rx1187_cur."!cursor_debug"("PASS", "metachar:sym<$>", " at pos=", rx1187_pos)
  debug_306:
    .return (rx1187_cur)
  rx1187_restart:
.annotate 'line', 3
    if_null rx1187_debug, debug_307
    rx1187_cur."!cursor_debug"("NEXT", "metachar:sym<$>")
  debug_307:
  rx1187_fail:
    (rx1187_rep, rx1187_pos, $I10, $P10) = rx1187_cur."!mark_fail"(0)
    lt rx1187_pos, -1, rx1187_done
    eq rx1187_pos, -1, rx1187_fail
    jump $I10
  rx1187_done:
    rx1187_cur."!cursor_fail"()
    if_null rx1187_debug, debug_308
    rx1187_cur."!cursor_debug"("FAIL", "metachar:sym<$>")
  debug_308:
    .return (rx1187_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<$>"  :subid("76_1309998843.21663") :method
.annotate 'line', 3
    new $P100, "ResizablePMCArray"
    push $P100, "$"
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<$$>"  :subid("77_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1192_tgt
    .local int rx1192_pos
    .local int rx1192_off
    .local int rx1192_eos
    .local int rx1192_rep
    .local pmc rx1192_cur
    .local pmc rx1192_debug
    (rx1192_cur, rx1192_pos, rx1192_tgt, $I10) = self."!cursor_start"()
    getattribute rx1192_debug, rx1192_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1192_cur
    .local pmc match
    .lex "$/", match
    length rx1192_eos, rx1192_tgt
    gt rx1192_pos, rx1192_eos, rx1192_done
    set rx1192_off, 0
    lt rx1192_pos, 2, rx1192_start
    sub rx1192_off, rx1192_pos, 1
    substr rx1192_tgt, rx1192_tgt, rx1192_off
  rx1192_start:
    eq $I10, 1, rx1192_restart
    if_null rx1192_debug, debug_309
    rx1192_cur."!cursor_debug"("START", "metachar:sym<$$>")
  debug_309:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1194_done
    goto rxscan1194_scan
  rxscan1194_loop:
    ($P10) = rx1192_cur."from"()
    inc $P10
    set rx1192_pos, $P10
    ge rx1192_pos, rx1192_eos, rxscan1194_done
  rxscan1194_scan:
    set_addr $I10, rxscan1194_loop
    rx1192_cur."!mark_push"(0, rx1192_pos, $I10)
  rxscan1194_done:
.annotate 'line', 95
  # rx subcapture "sym"
    set_addr $I10, rxcap_1195_fail
    rx1192_cur."!mark_push"(0, rx1192_pos, $I10)
  # rx literal  "$$"
    add $I11, rx1192_pos, 2
    gt $I11, rx1192_eos, rx1192_fail
    sub $I11, rx1192_pos, rx1192_off
    substr $S10, rx1192_tgt, $I11, 2
    ne $S10, "$$", rx1192_fail
    add rx1192_pos, 2
    set_addr $I10, rxcap_1195_fail
    ($I12, $I11) = rx1192_cur."!mark_peek"($I10)
    rx1192_cur."!cursor_pos"($I11)
    ($P10) = rx1192_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1192_pos, "")
    rx1192_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1195_done
  rxcap_1195_fail:
    goto rx1192_fail
  rxcap_1195_done:
  # rx pass
    rx1192_cur."!cursor_pass"(rx1192_pos, "metachar:sym<$$>")
    if_null rx1192_debug, debug_310
    rx1192_cur."!cursor_debug"("PASS", "metachar:sym<$$>", " at pos=", rx1192_pos)
  debug_310:
    .return (rx1192_cur)
  rx1192_restart:
.annotate 'line', 3
    if_null rx1192_debug, debug_311
    rx1192_cur."!cursor_debug"("NEXT", "metachar:sym<$$>")
  debug_311:
  rx1192_fail:
    (rx1192_rep, rx1192_pos, $I10, $P10) = rx1192_cur."!mark_fail"(0)
    lt rx1192_pos, -1, rx1192_done
    eq rx1192_pos, -1, rx1192_fail
    jump $I10
  rx1192_done:
    rx1192_cur."!cursor_fail"()
    if_null rx1192_debug, debug_312
    rx1192_cur."!cursor_debug"("FAIL", "metachar:sym<$$>")
  debug_312:
    .return (rx1192_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<$$>"  :subid("78_1309998843.21663") :method
.annotate 'line', 3
    new $P100, "ResizablePMCArray"
    push $P100, "$$"
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<:::>"  :subid("79_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1197_tgt
    .local int rx1197_pos
    .local int rx1197_off
    .local int rx1197_eos
    .local int rx1197_rep
    .local pmc rx1197_cur
    .local pmc rx1197_debug
    (rx1197_cur, rx1197_pos, rx1197_tgt, $I10) = self."!cursor_start"()
    getattribute rx1197_debug, rx1197_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1197_cur
    .local pmc match
    .lex "$/", match
    length rx1197_eos, rx1197_tgt
    gt rx1197_pos, rx1197_eos, rx1197_done
    set rx1197_off, 0
    lt rx1197_pos, 2, rx1197_start
    sub rx1197_off, rx1197_pos, 1
    substr rx1197_tgt, rx1197_tgt, rx1197_off
  rx1197_start:
    eq $I10, 1, rx1197_restart
    if_null rx1197_debug, debug_313
    rx1197_cur."!cursor_debug"("START", "metachar:sym<:::>")
  debug_313:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1199_done
    goto rxscan1199_scan
  rxscan1199_loop:
    ($P10) = rx1197_cur."from"()
    inc $P10
    set rx1197_pos, $P10
    ge rx1197_pos, rx1197_eos, rxscan1199_done
  rxscan1199_scan:
    set_addr $I10, rxscan1199_loop
    rx1197_cur."!mark_push"(0, rx1197_pos, $I10)
  rxscan1199_done:
.annotate 'line', 96
  # rx subcapture "sym"
    set_addr $I10, rxcap_1200_fail
    rx1197_cur."!mark_push"(0, rx1197_pos, $I10)
  # rx literal  ":::"
    add $I11, rx1197_pos, 3
    gt $I11, rx1197_eos, rx1197_fail
    sub $I11, rx1197_pos, rx1197_off
    substr $S10, rx1197_tgt, $I11, 3
    ne $S10, ":::", rx1197_fail
    add rx1197_pos, 3
    set_addr $I10, rxcap_1200_fail
    ($I12, $I11) = rx1197_cur."!mark_peek"($I10)
    rx1197_cur."!cursor_pos"($I11)
    ($P10) = rx1197_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1197_pos, "")
    rx1197_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1200_done
  rxcap_1200_fail:
    goto rx1197_fail
  rxcap_1200_done:
  # rx subrule "panic" subtype=method negate=
    rx1197_cur."!cursor_pos"(rx1197_pos)
    $P10 = rx1197_cur."panic"("::: not yet implemented")
    unless $P10, rx1197_fail
    rx1197_pos = $P10."pos"()
  # rx pass
    rx1197_cur."!cursor_pass"(rx1197_pos, "metachar:sym<:::>")
    if_null rx1197_debug, debug_314
    rx1197_cur."!cursor_debug"("PASS", "metachar:sym<:::>", " at pos=", rx1197_pos)
  debug_314:
    .return (rx1197_cur)
  rx1197_restart:
.annotate 'line', 3
    if_null rx1197_debug, debug_315
    rx1197_cur."!cursor_debug"("NEXT", "metachar:sym<:::>")
  debug_315:
  rx1197_fail:
    (rx1197_rep, rx1197_pos, $I10, $P10) = rx1197_cur."!mark_fail"(0)
    lt rx1197_pos, -1, rx1197_done
    eq rx1197_pos, -1, rx1197_fail
    jump $I10
  rx1197_done:
    rx1197_cur."!cursor_fail"()
    if_null rx1197_debug, debug_316
    rx1197_cur."!cursor_debug"("FAIL", "metachar:sym<:::>")
  debug_316:
    .return (rx1197_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<:::>"  :subid("80_1309998843.21663") :method
.annotate 'line', 3
    $P100 = self."!PREFIX__!subrule"("panic", ":::")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<::>"  :subid("81_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1202_tgt
    .local int rx1202_pos
    .local int rx1202_off
    .local int rx1202_eos
    .local int rx1202_rep
    .local pmc rx1202_cur
    .local pmc rx1202_debug
    (rx1202_cur, rx1202_pos, rx1202_tgt, $I10) = self."!cursor_start"()
    getattribute rx1202_debug, rx1202_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1202_cur
    .local pmc match
    .lex "$/", match
    length rx1202_eos, rx1202_tgt
    gt rx1202_pos, rx1202_eos, rx1202_done
    set rx1202_off, 0
    lt rx1202_pos, 2, rx1202_start
    sub rx1202_off, rx1202_pos, 1
    substr rx1202_tgt, rx1202_tgt, rx1202_off
  rx1202_start:
    eq $I10, 1, rx1202_restart
    if_null rx1202_debug, debug_317
    rx1202_cur."!cursor_debug"("START", "metachar:sym<::>")
  debug_317:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1204_done
    goto rxscan1204_scan
  rxscan1204_loop:
    ($P10) = rx1202_cur."from"()
    inc $P10
    set rx1202_pos, $P10
    ge rx1202_pos, rx1202_eos, rxscan1204_done
  rxscan1204_scan:
    set_addr $I10, rxscan1204_loop
    rx1202_cur."!mark_push"(0, rx1202_pos, $I10)
  rxscan1204_done:
.annotate 'line', 97
  # rx subcapture "sym"
    set_addr $I10, rxcap_1205_fail
    rx1202_cur."!mark_push"(0, rx1202_pos, $I10)
  # rx literal  "::"
    add $I11, rx1202_pos, 2
    gt $I11, rx1202_eos, rx1202_fail
    sub $I11, rx1202_pos, rx1202_off
    substr $S10, rx1202_tgt, $I11, 2
    ne $S10, "::", rx1202_fail
    add rx1202_pos, 2
    set_addr $I10, rxcap_1205_fail
    ($I12, $I11) = rx1202_cur."!mark_peek"($I10)
    rx1202_cur."!cursor_pos"($I11)
    ($P10) = rx1202_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1202_pos, "")
    rx1202_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1205_done
  rxcap_1205_fail:
    goto rx1202_fail
  rxcap_1205_done:
  # rx subrule "panic" subtype=method negate=
    rx1202_cur."!cursor_pos"(rx1202_pos)
    $P10 = rx1202_cur."panic"(":: not yet implemented")
    unless $P10, rx1202_fail
    rx1202_pos = $P10."pos"()
  # rx pass
    rx1202_cur."!cursor_pass"(rx1202_pos, "metachar:sym<::>")
    if_null rx1202_debug, debug_318
    rx1202_cur."!cursor_debug"("PASS", "metachar:sym<::>", " at pos=", rx1202_pos)
  debug_318:
    .return (rx1202_cur)
  rx1202_restart:
.annotate 'line', 3
    if_null rx1202_debug, debug_319
    rx1202_cur."!cursor_debug"("NEXT", "metachar:sym<::>")
  debug_319:
  rx1202_fail:
    (rx1202_rep, rx1202_pos, $I10, $P10) = rx1202_cur."!mark_fail"(0)
    lt rx1202_pos, -1, rx1202_done
    eq rx1202_pos, -1, rx1202_fail
    jump $I10
  rx1202_done:
    rx1202_cur."!cursor_fail"()
    if_null rx1202_debug, debug_320
    rx1202_cur."!cursor_debug"("FAIL", "metachar:sym<::>")
  debug_320:
    .return (rx1202_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<::>"  :subid("82_1309998843.21663") :method
.annotate 'line', 3
    $P100 = self."!PREFIX__!subrule"("panic", "::")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<lwb>"  :subid("83_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1207_tgt
    .local int rx1207_pos
    .local int rx1207_off
    .local int rx1207_eos
    .local int rx1207_rep
    .local pmc rx1207_cur
    .local pmc rx1207_debug
    (rx1207_cur, rx1207_pos, rx1207_tgt, $I10) = self."!cursor_start"()
    getattribute rx1207_debug, rx1207_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1207_cur
    .local pmc match
    .lex "$/", match
    length rx1207_eos, rx1207_tgt
    gt rx1207_pos, rx1207_eos, rx1207_done
    set rx1207_off, 0
    lt rx1207_pos, 2, rx1207_start
    sub rx1207_off, rx1207_pos, 1
    substr rx1207_tgt, rx1207_tgt, rx1207_off
  rx1207_start:
    eq $I10, 1, rx1207_restart
    if_null rx1207_debug, debug_321
    rx1207_cur."!cursor_debug"("START", "metachar:sym<lwb>")
  debug_321:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1209_done
    goto rxscan1209_scan
  rxscan1209_loop:
    ($P10) = rx1207_cur."from"()
    inc $P10
    set rx1207_pos, $P10
    ge rx1207_pos, rx1207_eos, rxscan1209_done
  rxscan1209_scan:
    set_addr $I10, rxscan1209_loop
    rx1207_cur."!mark_push"(0, rx1207_pos, $I10)
  rxscan1209_done:
.annotate 'line', 98
  # rx subcapture "sym"
    set_addr $I10, rxcap_1211_fail
    rx1207_cur."!mark_push"(0, rx1207_pos, $I10)
  alt1210_0:
    set_addr $I10, alt1210_1
    rx1207_cur."!mark_push"(0, rx1207_pos, $I10)
  # rx literal  "<<"
    add $I11, rx1207_pos, 2
    gt $I11, rx1207_eos, rx1207_fail
    sub $I11, rx1207_pos, rx1207_off
    substr $S10, rx1207_tgt, $I11, 2
    ne $S10, "<<", rx1207_fail
    add rx1207_pos, 2
    goto alt1210_end
  alt1210_1:
  # rx literal  unicode:"\x{ab}"
    add $I11, rx1207_pos, 1
    gt $I11, rx1207_eos, rx1207_fail
    sub $I11, rx1207_pos, rx1207_off
    ord $I11, rx1207_tgt, $I11
    ne $I11, 171, rx1207_fail
    add rx1207_pos, 1
  alt1210_end:
    set_addr $I10, rxcap_1211_fail
    ($I12, $I11) = rx1207_cur."!mark_peek"($I10)
    rx1207_cur."!cursor_pos"($I11)
    ($P10) = rx1207_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1207_pos, "")
    rx1207_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1211_done
  rxcap_1211_fail:
    goto rx1207_fail
  rxcap_1211_done:
  # rx pass
    rx1207_cur."!cursor_pass"(rx1207_pos, "metachar:sym<lwb>")
    if_null rx1207_debug, debug_322
    rx1207_cur."!cursor_debug"("PASS", "metachar:sym<lwb>", " at pos=", rx1207_pos)
  debug_322:
    .return (rx1207_cur)
  rx1207_restart:
.annotate 'line', 3
    if_null rx1207_debug, debug_323
    rx1207_cur."!cursor_debug"("NEXT", "metachar:sym<lwb>")
  debug_323:
  rx1207_fail:
    (rx1207_rep, rx1207_pos, $I10, $P10) = rx1207_cur."!mark_fail"(0)
    lt rx1207_pos, -1, rx1207_done
    eq rx1207_pos, -1, rx1207_fail
    jump $I10
  rx1207_done:
    rx1207_cur."!cursor_fail"()
    if_null rx1207_debug, debug_324
    rx1207_cur."!cursor_debug"("FAIL", "metachar:sym<lwb>")
  debug_324:
    .return (rx1207_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<lwb>"  :subid("84_1309998843.21663") :method
.annotate 'line', 3
    new $P100, "ResizablePMCArray"
    push $P100, unicode:"\x{ab}"
    push $P100, "<<"
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<rwb>"  :subid("85_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1213_tgt
    .local int rx1213_pos
    .local int rx1213_off
    .local int rx1213_eos
    .local int rx1213_rep
    .local pmc rx1213_cur
    .local pmc rx1213_debug
    (rx1213_cur, rx1213_pos, rx1213_tgt, $I10) = self."!cursor_start"()
    getattribute rx1213_debug, rx1213_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1213_cur
    .local pmc match
    .lex "$/", match
    length rx1213_eos, rx1213_tgt
    gt rx1213_pos, rx1213_eos, rx1213_done
    set rx1213_off, 0
    lt rx1213_pos, 2, rx1213_start
    sub rx1213_off, rx1213_pos, 1
    substr rx1213_tgt, rx1213_tgt, rx1213_off
  rx1213_start:
    eq $I10, 1, rx1213_restart
    if_null rx1213_debug, debug_325
    rx1213_cur."!cursor_debug"("START", "metachar:sym<rwb>")
  debug_325:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1215_done
    goto rxscan1215_scan
  rxscan1215_loop:
    ($P10) = rx1213_cur."from"()
    inc $P10
    set rx1213_pos, $P10
    ge rx1213_pos, rx1213_eos, rxscan1215_done
  rxscan1215_scan:
    set_addr $I10, rxscan1215_loop
    rx1213_cur."!mark_push"(0, rx1213_pos, $I10)
  rxscan1215_done:
.annotate 'line', 99
  # rx subcapture "sym"
    set_addr $I10, rxcap_1217_fail
    rx1213_cur."!mark_push"(0, rx1213_pos, $I10)
  alt1216_0:
    set_addr $I10, alt1216_1
    rx1213_cur."!mark_push"(0, rx1213_pos, $I10)
  # rx literal  ">>"
    add $I11, rx1213_pos, 2
    gt $I11, rx1213_eos, rx1213_fail
    sub $I11, rx1213_pos, rx1213_off
    substr $S10, rx1213_tgt, $I11, 2
    ne $S10, ">>", rx1213_fail
    add rx1213_pos, 2
    goto alt1216_end
  alt1216_1:
  # rx literal  unicode:"\x{bb}"
    add $I11, rx1213_pos, 1
    gt $I11, rx1213_eos, rx1213_fail
    sub $I11, rx1213_pos, rx1213_off
    ord $I11, rx1213_tgt, $I11
    ne $I11, 187, rx1213_fail
    add rx1213_pos, 1
  alt1216_end:
    set_addr $I10, rxcap_1217_fail
    ($I12, $I11) = rx1213_cur."!mark_peek"($I10)
    rx1213_cur."!cursor_pos"($I11)
    ($P10) = rx1213_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1213_pos, "")
    rx1213_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1217_done
  rxcap_1217_fail:
    goto rx1213_fail
  rxcap_1217_done:
  # rx pass
    rx1213_cur."!cursor_pass"(rx1213_pos, "metachar:sym<rwb>")
    if_null rx1213_debug, debug_326
    rx1213_cur."!cursor_debug"("PASS", "metachar:sym<rwb>", " at pos=", rx1213_pos)
  debug_326:
    .return (rx1213_cur)
  rx1213_restart:
.annotate 'line', 3
    if_null rx1213_debug, debug_327
    rx1213_cur."!cursor_debug"("NEXT", "metachar:sym<rwb>")
  debug_327:
  rx1213_fail:
    (rx1213_rep, rx1213_pos, $I10, $P10) = rx1213_cur."!mark_fail"(0)
    lt rx1213_pos, -1, rx1213_done
    eq rx1213_pos, -1, rx1213_fail
    jump $I10
  rx1213_done:
    rx1213_cur."!cursor_fail"()
    if_null rx1213_debug, debug_328
    rx1213_cur."!cursor_debug"("FAIL", "metachar:sym<rwb>")
  debug_328:
    .return (rx1213_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<rwb>"  :subid("86_1309998843.21663") :method
.annotate 'line', 3
    new $P100, "ResizablePMCArray"
    push $P100, unicode:"\x{bb}"
    push $P100, ">>"
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<bs>"  :subid("87_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1219_tgt
    .local int rx1219_pos
    .local int rx1219_off
    .local int rx1219_eos
    .local int rx1219_rep
    .local pmc rx1219_cur
    .local pmc rx1219_debug
    (rx1219_cur, rx1219_pos, rx1219_tgt, $I10) = self."!cursor_start"()
    getattribute rx1219_debug, rx1219_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1219_cur
    .local pmc match
    .lex "$/", match
    length rx1219_eos, rx1219_tgt
    gt rx1219_pos, rx1219_eos, rx1219_done
    set rx1219_off, 0
    lt rx1219_pos, 2, rx1219_start
    sub rx1219_off, rx1219_pos, 1
    substr rx1219_tgt, rx1219_tgt, rx1219_off
  rx1219_start:
    eq $I10, 1, rx1219_restart
    if_null rx1219_debug, debug_329
    rx1219_cur."!cursor_debug"("START", "metachar:sym<bs>")
  debug_329:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1221_done
    goto rxscan1221_scan
  rxscan1221_loop:
    ($P10) = rx1219_cur."from"()
    inc $P10
    set rx1219_pos, $P10
    ge rx1219_pos, rx1219_eos, rxscan1221_done
  rxscan1221_scan:
    set_addr $I10, rxscan1221_loop
    rx1219_cur."!mark_push"(0, rx1219_pos, $I10)
  rxscan1221_done:
.annotate 'line', 100
  # rx literal  "\\"
    add $I11, rx1219_pos, 1
    gt $I11, rx1219_eos, rx1219_fail
    sub $I11, rx1219_pos, rx1219_off
    ord $I11, rx1219_tgt, $I11
    ne $I11, 92, rx1219_fail
    add rx1219_pos, 1
  # rx subrule "backslash" subtype=capture negate=
    rx1219_cur."!cursor_pos"(rx1219_pos)
    $P10 = rx1219_cur."backslash"()
    unless $P10, rx1219_fail
    rx1219_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("backslash")
    rx1219_pos = $P10."pos"()
  # rx pass
    rx1219_cur."!cursor_pass"(rx1219_pos, "metachar:sym<bs>")
    if_null rx1219_debug, debug_330
    rx1219_cur."!cursor_debug"("PASS", "metachar:sym<bs>", " at pos=", rx1219_pos)
  debug_330:
    .return (rx1219_cur)
  rx1219_restart:
.annotate 'line', 3
    if_null rx1219_debug, debug_331
    rx1219_cur."!cursor_debug"("NEXT", "metachar:sym<bs>")
  debug_331:
  rx1219_fail:
    (rx1219_rep, rx1219_pos, $I10, $P10) = rx1219_cur."!mark_fail"(0)
    lt rx1219_pos, -1, rx1219_done
    eq rx1219_pos, -1, rx1219_fail
    jump $I10
  rx1219_done:
    rx1219_cur."!cursor_fail"()
    if_null rx1219_debug, debug_332
    rx1219_cur."!cursor_debug"("FAIL", "metachar:sym<bs>")
  debug_332:
    .return (rx1219_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<bs>"  :subid("88_1309998843.21663") :method
.annotate 'line', 3
    $P100 = self."!PREFIX__!subrule"("backslash", "\\")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<mod>"  :subid("89_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1223_tgt
    .local int rx1223_pos
    .local int rx1223_off
    .local int rx1223_eos
    .local int rx1223_rep
    .local pmc rx1223_cur
    .local pmc rx1223_debug
    (rx1223_cur, rx1223_pos, rx1223_tgt, $I10) = self."!cursor_start"()
    getattribute rx1223_debug, rx1223_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1223_cur
    .local pmc match
    .lex "$/", match
    length rx1223_eos, rx1223_tgt
    gt rx1223_pos, rx1223_eos, rx1223_done
    set rx1223_off, 0
    lt rx1223_pos, 2, rx1223_start
    sub rx1223_off, rx1223_pos, 1
    substr rx1223_tgt, rx1223_tgt, rx1223_off
  rx1223_start:
    eq $I10, 1, rx1223_restart
    if_null rx1223_debug, debug_333
    rx1223_cur."!cursor_debug"("START", "metachar:sym<mod>")
  debug_333:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1225_done
    goto rxscan1225_scan
  rxscan1225_loop:
    ($P10) = rx1223_cur."from"()
    inc $P10
    set rx1223_pos, $P10
    ge rx1223_pos, rx1223_eos, rxscan1225_done
  rxscan1225_scan:
    set_addr $I10, rxscan1225_loop
    rx1223_cur."!mark_push"(0, rx1223_pos, $I10)
  rxscan1225_done:
.annotate 'line', 101
  # rx subrule "mod_internal" subtype=capture negate=
    rx1223_cur."!cursor_pos"(rx1223_pos)
    $P10 = rx1223_cur."mod_internal"()
    unless $P10, rx1223_fail
    rx1223_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_internal")
    rx1223_pos = $P10."pos"()
  # rx pass
    rx1223_cur."!cursor_pass"(rx1223_pos, "metachar:sym<mod>")
    if_null rx1223_debug, debug_334
    rx1223_cur."!cursor_debug"("PASS", "metachar:sym<mod>", " at pos=", rx1223_pos)
  debug_334:
    .return (rx1223_cur)
  rx1223_restart:
.annotate 'line', 3
    if_null rx1223_debug, debug_335
    rx1223_cur."!cursor_debug"("NEXT", "metachar:sym<mod>")
  debug_335:
  rx1223_fail:
    (rx1223_rep, rx1223_pos, $I10, $P10) = rx1223_cur."!mark_fail"(0)
    lt rx1223_pos, -1, rx1223_done
    eq rx1223_pos, -1, rx1223_fail
    jump $I10
  rx1223_done:
    rx1223_cur."!cursor_fail"()
    if_null rx1223_debug, debug_336
    rx1223_cur."!cursor_debug"("FAIL", "metachar:sym<mod>")
  debug_336:
    .return (rx1223_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<mod>"  :subid("90_1309998843.21663") :method
.annotate 'line', 3
    $P100 = self."!PREFIX__!subrule"("mod_internal", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<quantifier>"  :subid("91_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1227_tgt
    .local int rx1227_pos
    .local int rx1227_off
    .local int rx1227_eos
    .local int rx1227_rep
    .local pmc rx1227_cur
    .local pmc rx1227_debug
    (rx1227_cur, rx1227_pos, rx1227_tgt, $I10) = self."!cursor_start"()
    getattribute rx1227_debug, rx1227_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1227_cur
    .local pmc match
    .lex "$/", match
    length rx1227_eos, rx1227_tgt
    gt rx1227_pos, rx1227_eos, rx1227_done
    set rx1227_off, 0
    lt rx1227_pos, 2, rx1227_start
    sub rx1227_off, rx1227_pos, 1
    substr rx1227_tgt, rx1227_tgt, rx1227_off
  rx1227_start:
    eq $I10, 1, rx1227_restart
    if_null rx1227_debug, debug_337
    rx1227_cur."!cursor_debug"("START", "metachar:sym<quantifier>")
  debug_337:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1229_done
    goto rxscan1229_scan
  rxscan1229_loop:
    ($P10) = rx1227_cur."from"()
    inc $P10
    set rx1227_pos, $P10
    ge rx1227_pos, rx1227_eos, rxscan1229_done
  rxscan1229_scan:
    set_addr $I10, rxscan1229_loop
    rx1227_cur."!mark_push"(0, rx1227_pos, $I10)
  rxscan1229_done:
.annotate 'line', 103
  # rx subrule "quantifier" subtype=capture negate=
    rx1227_cur."!cursor_pos"(rx1227_pos)
    $P10 = rx1227_cur."quantifier"()
    unless $P10, rx1227_fail
    rx1227_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantifier")
    rx1227_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx1227_cur."!cursor_pos"(rx1227_pos)
    $P10 = rx1227_cur."panic"("Quantifier quantifies nothing")
    unless $P10, rx1227_fail
    rx1227_pos = $P10."pos"()
.annotate 'line', 102
  # rx pass
    rx1227_cur."!cursor_pass"(rx1227_pos, "metachar:sym<quantifier>")
    if_null rx1227_debug, debug_338
    rx1227_cur."!cursor_debug"("PASS", "metachar:sym<quantifier>", " at pos=", rx1227_pos)
  debug_338:
    .return (rx1227_cur)
  rx1227_restart:
.annotate 'line', 3
    if_null rx1227_debug, debug_339
    rx1227_cur."!cursor_debug"("NEXT", "metachar:sym<quantifier>")
  debug_339:
  rx1227_fail:
    (rx1227_rep, rx1227_pos, $I10, $P10) = rx1227_cur."!mark_fail"(0)
    lt rx1227_pos, -1, rx1227_done
    eq rx1227_pos, -1, rx1227_fail
    jump $I10
  rx1227_done:
    rx1227_cur."!cursor_fail"()
    if_null rx1227_debug, debug_340
    rx1227_cur."!cursor_debug"("FAIL", "metachar:sym<quantifier>")
  debug_340:
    .return (rx1227_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<quantifier>"  :subid("92_1309998843.21663") :method
.annotate 'line', 3
    $P100 = self."!PREFIX__!subrule"("quantifier", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<~>"  :subid("93_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1231_tgt
    .local int rx1231_pos
    .local int rx1231_off
    .local int rx1231_eos
    .local int rx1231_rep
    .local pmc rx1231_cur
    .local pmc rx1231_debug
    (rx1231_cur, rx1231_pos, rx1231_tgt, $I10) = self."!cursor_start"()
    getattribute rx1231_debug, rx1231_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1231_cur
    .local pmc match
    .lex "$/", match
    length rx1231_eos, rx1231_tgt
    gt rx1231_pos, rx1231_eos, rx1231_done
    set rx1231_off, 0
    lt rx1231_pos, 2, rx1231_start
    sub rx1231_off, rx1231_pos, 1
    substr rx1231_tgt, rx1231_tgt, rx1231_off
  rx1231_start:
    eq $I10, 1, rx1231_restart
    if_null rx1231_debug, debug_341
    rx1231_cur."!cursor_debug"("START", "metachar:sym<~>")
  debug_341:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1233_done
    goto rxscan1233_scan
  rxscan1233_loop:
    ($P10) = rx1231_cur."from"()
    inc $P10
    set rx1231_pos, $P10
    ge rx1231_pos, rx1231_eos, rxscan1233_done
  rxscan1233_scan:
    set_addr $I10, rxscan1233_loop
    rx1231_cur."!mark_push"(0, rx1231_pos, $I10)
  rxscan1233_done:
.annotate 'line', 108
  # rx subcapture "sym"
    set_addr $I10, rxcap_1234_fail
    rx1231_cur."!mark_push"(0, rx1231_pos, $I10)
  # rx literal  "~"
    add $I11, rx1231_pos, 1
    gt $I11, rx1231_eos, rx1231_fail
    sub $I11, rx1231_pos, rx1231_off
    ord $I11, rx1231_tgt, $I11
    ne $I11, 126, rx1231_fail
    add rx1231_pos, 1
    set_addr $I10, rxcap_1234_fail
    ($I12, $I11) = rx1231_cur."!mark_peek"($I10)
    rx1231_cur."!cursor_pos"($I11)
    ($P10) = rx1231_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1231_pos, "")
    rx1231_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1234_done
  rxcap_1234_fail:
    goto rx1231_fail
  rxcap_1234_done:
.annotate 'line', 109
  # rx subrule "ws" subtype=method negate=
    rx1231_cur."!cursor_pos"(rx1231_pos)
    $P10 = rx1231_cur."ws"()
    unless $P10, rx1231_fail
    rx1231_pos = $P10."pos"()
  # rx subrule "quantified_atom" subtype=capture negate=
    rx1231_cur."!cursor_pos"(rx1231_pos)
    $P10 = rx1231_cur."quantified_atom"()
    unless $P10, rx1231_fail
    rx1231_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("GOAL")
    rx1231_pos = $P10."pos"()
.annotate 'line', 110
  # rx subrule "ws" subtype=method negate=
    rx1231_cur."!cursor_pos"(rx1231_pos)
    $P10 = rx1231_cur."ws"()
    unless $P10, rx1231_fail
    rx1231_pos = $P10."pos"()
  # rx subrule "quantified_atom" subtype=capture negate=
    rx1231_cur."!cursor_pos"(rx1231_pos)
    $P10 = rx1231_cur."quantified_atom"()
    unless $P10, rx1231_fail
    rx1231_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx1231_pos = $P10."pos"()
.annotate 'line', 107
  # rx pass
    rx1231_cur."!cursor_pass"(rx1231_pos, "metachar:sym<~>")
    if_null rx1231_debug, debug_342
    rx1231_cur."!cursor_debug"("PASS", "metachar:sym<~>", " at pos=", rx1231_pos)
  debug_342:
    .return (rx1231_cur)
  rx1231_restart:
.annotate 'line', 3
    if_null rx1231_debug, debug_343
    rx1231_cur."!cursor_debug"("NEXT", "metachar:sym<~>")
  debug_343:
  rx1231_fail:
    (rx1231_rep, rx1231_pos, $I10, $P10) = rx1231_cur."!mark_fail"(0)
    lt rx1231_pos, -1, rx1231_done
    eq rx1231_pos, -1, rx1231_fail
    jump $I10
  rx1231_done:
    rx1231_cur."!cursor_fail"()
    if_null rx1231_debug, debug_344
    rx1231_cur."!cursor_debug"("FAIL", "metachar:sym<~>")
  debug_344:
    .return (rx1231_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<~>"  :subid("94_1309998843.21663") :method
.annotate 'line', 3
    $P100 = self."!PREFIX__!subrule"("ws", "~")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<{*}>"  :subid("95_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1236_tgt
    .local int rx1236_pos
    .local int rx1236_off
    .local int rx1236_eos
    .local int rx1236_rep
    .local pmc rx1236_cur
    .local pmc rx1236_debug
    (rx1236_cur, rx1236_pos, rx1236_tgt, $I10) = self."!cursor_start"()
    rx1236_cur."!cursor_caparray"("key")
    getattribute rx1236_debug, rx1236_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1236_cur
    .local pmc match
    .lex "$/", match
    length rx1236_eos, rx1236_tgt
    gt rx1236_pos, rx1236_eos, rx1236_done
    set rx1236_off, 0
    lt rx1236_pos, 2, rx1236_start
    sub rx1236_off, rx1236_pos, 1
    substr rx1236_tgt, rx1236_tgt, rx1236_off
  rx1236_start:
    eq $I10, 1, rx1236_restart
    if_null rx1236_debug, debug_345
    rx1236_cur."!cursor_debug"("START", "metachar:sym<{*}>")
  debug_345:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1238_done
    goto rxscan1238_scan
  rxscan1238_loop:
    ($P10) = rx1236_cur."from"()
    inc $P10
    set rx1236_pos, $P10
    ge rx1236_pos, rx1236_eos, rxscan1238_done
  rxscan1238_scan:
    set_addr $I10, rxscan1238_loop
    rx1236_cur."!mark_push"(0, rx1236_pos, $I10)
  rxscan1238_done:
.annotate 'line', 114
  # rx subcapture "sym"
    set_addr $I10, rxcap_1239_fail
    rx1236_cur."!mark_push"(0, rx1236_pos, $I10)
  # rx literal  "{*}"
    add $I11, rx1236_pos, 3
    gt $I11, rx1236_eos, rx1236_fail
    sub $I11, rx1236_pos, rx1236_off
    substr $S10, rx1236_tgt, $I11, 3
    ne $S10, "{*}", rx1236_fail
    add rx1236_pos, 3
    set_addr $I10, rxcap_1239_fail
    ($I12, $I11) = rx1236_cur."!mark_peek"($I10)
    rx1236_cur."!cursor_pos"($I11)
    ($P10) = rx1236_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1236_pos, "")
    rx1236_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1239_done
  rxcap_1239_fail:
    goto rx1236_fail
  rxcap_1239_done:
.annotate 'line', 115
  # rx rxquantr1240 ** 0..1
    set_addr $I10, rxquantr1240_done
    rx1236_cur."!mark_push"(0, rx1236_pos, $I10)
  rxquantr1240_loop:
  # rx enumcharlist_q negate=0  r 0..-1
    sub $I10, rx1236_pos, rx1236_off
    set rx1236_rep, 0
    sub $I12, rx1236_eos, rx1236_pos
  rxenumcharlistq1241_loop:
    le $I12, 0, rxenumcharlistq1241_done
    substr $S10, rx1236_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq1241_done
    inc rx1236_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq1241_loop
  rxenumcharlistq1241_done:
    add rx1236_pos, rx1236_pos, rx1236_rep
  # rx literal  "#= "
    add $I11, rx1236_pos, 3
    gt $I11, rx1236_eos, rx1236_fail
    sub $I11, rx1236_pos, rx1236_off
    substr $S10, rx1236_tgt, $I11, 3
    ne $S10, "#= ", rx1236_fail
    add rx1236_pos, 3
  # rx enumcharlist_q negate=0  r 0..-1
    sub $I10, rx1236_pos, rx1236_off
    set rx1236_rep, 0
    sub $I12, rx1236_eos, rx1236_pos
  rxenumcharlistq1242_loop:
    le $I12, 0, rxenumcharlistq1242_done
    substr $S10, rx1236_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq1242_done
    inc rx1236_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq1242_loop
  rxenumcharlistq1242_done:
    add rx1236_pos, rx1236_pos, rx1236_rep
  # rx subcapture "key"
    set_addr $I10, rxcap_1245_fail
    rx1236_cur."!mark_push"(0, rx1236_pos, $I10)
  # rx charclass_q S r 1..-1
    sub $I10, rx1236_pos, rx1236_off
    find_cclass $I11, 32, rx1236_tgt, $I10, rx1236_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1236_fail
    add rx1236_pos, rx1236_off, $I11
  # rx rxquantr1243 ** 0..*
    set_addr $I10, rxquantr1243_done
    rx1236_cur."!mark_push"(0, rx1236_pos, $I10)
  rxquantr1243_loop:
  # rx enumcharlist_q negate=0  r 1..-1
    sub $I10, rx1236_pos, rx1236_off
    set rx1236_rep, 0
    sub $I12, rx1236_eos, rx1236_pos
  rxenumcharlistq1244_loop:
    le $I12, 0, rxenumcharlistq1244_done
    substr $S10, rx1236_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rxenumcharlistq1244_done
    inc rx1236_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq1244_loop
  rxenumcharlistq1244_done:
    lt rx1236_rep, 1, rx1236_fail
    add rx1236_pos, rx1236_pos, rx1236_rep
  # rx charclass_q S r 1..-1
    sub $I10, rx1236_pos, rx1236_off
    find_cclass $I11, 32, rx1236_tgt, $I10, rx1236_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1236_fail
    add rx1236_pos, rx1236_off, $I11
    set_addr $I10, rxquantr1243_done
    (rx1236_rep) = rx1236_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr1243_done
    rx1236_cur."!mark_push"(rx1236_rep, rx1236_pos, $I10)
    goto rxquantr1243_loop
  rxquantr1243_done:
    set_addr $I10, rxcap_1245_fail
    ($I12, $I11) = rx1236_cur."!mark_peek"($I10)
    rx1236_cur."!cursor_pos"($I11)
    ($P10) = rx1236_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1236_pos, "")
    rx1236_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("key")
    goto rxcap_1245_done
  rxcap_1245_fail:
    goto rx1236_fail
  rxcap_1245_done:
    set_addr $I10, rxquantr1240_done
    (rx1236_rep) = rx1236_cur."!mark_commit"($I10)
  rxquantr1240_done:
.annotate 'line', 113
  # rx pass
    rx1236_cur."!cursor_pass"(rx1236_pos, "metachar:sym<{*}>")
    if_null rx1236_debug, debug_346
    rx1236_cur."!cursor_debug"("PASS", "metachar:sym<{*}>", " at pos=", rx1236_pos)
  debug_346:
    .return (rx1236_cur)
  rx1236_restart:
.annotate 'line', 3
    if_null rx1236_debug, debug_347
    rx1236_cur."!cursor_debug"("NEXT", "metachar:sym<{*}>")
  debug_347:
  rx1236_fail:
    (rx1236_rep, rx1236_pos, $I10, $P10) = rx1236_cur."!mark_fail"(0)
    lt rx1236_pos, -1, rx1236_done
    eq rx1236_pos, -1, rx1236_fail
    jump $I10
  rx1236_done:
    rx1236_cur."!cursor_fail"()
    if_null rx1236_debug, debug_348
    rx1236_cur."!cursor_debug"("FAIL", "metachar:sym<{*}>")
  debug_348:
    .return (rx1236_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<{*}>"  :subid("96_1309998843.21663") :method
.annotate 'line', 3
    new $P100, "ResizablePMCArray"
    push $P100, "{*}"
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<assert>"  :subid("97_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1247_tgt
    .local int rx1247_pos
    .local int rx1247_off
    .local int rx1247_eos
    .local int rx1247_rep
    .local pmc rx1247_cur
    .local pmc rx1247_debug
    (rx1247_cur, rx1247_pos, rx1247_tgt, $I10) = self."!cursor_start"()
    getattribute rx1247_debug, rx1247_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1247_cur
    .local pmc match
    .lex "$/", match
    length rx1247_eos, rx1247_tgt
    gt rx1247_pos, rx1247_eos, rx1247_done
    set rx1247_off, 0
    lt rx1247_pos, 2, rx1247_start
    sub rx1247_off, rx1247_pos, 1
    substr rx1247_tgt, rx1247_tgt, rx1247_off
  rx1247_start:
    eq $I10, 1, rx1247_restart
    if_null rx1247_debug, debug_349
    rx1247_cur."!cursor_debug"("START", "metachar:sym<assert>")
  debug_349:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1249_done
    goto rxscan1249_scan
  rxscan1249_loop:
    ($P10) = rx1247_cur."from"()
    inc $P10
    set rx1247_pos, $P10
    ge rx1247_pos, rx1247_eos, rxscan1249_done
  rxscan1249_scan:
    set_addr $I10, rxscan1249_loop
    rx1247_cur."!mark_push"(0, rx1247_pos, $I10)
  rxscan1249_done:
.annotate 'line', 118
  # rx literal  "<"
    add $I11, rx1247_pos, 1
    gt $I11, rx1247_eos, rx1247_fail
    sub $I11, rx1247_pos, rx1247_off
    ord $I11, rx1247_tgt, $I11
    ne $I11, 60, rx1247_fail
    add rx1247_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx1247_cur."!cursor_pos"(rx1247_pos)
    $P10 = rx1247_cur."assertion"()
    unless $P10, rx1247_fail
    rx1247_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx1247_pos = $P10."pos"()
  alt1250_0:
.annotate 'line', 119
    set_addr $I10, alt1250_1
    rx1247_cur."!mark_push"(0, rx1247_pos, $I10)
  # rx literal  ">"
    add $I11, rx1247_pos, 1
    gt $I11, rx1247_eos, rx1247_fail
    sub $I11, rx1247_pos, rx1247_off
    ord $I11, rx1247_tgt, $I11
    ne $I11, 62, rx1247_fail
    add rx1247_pos, 1
    goto alt1250_end
  alt1250_1:
  # rx subrule "panic" subtype=method negate=
    rx1247_cur."!cursor_pos"(rx1247_pos)
    $P10 = rx1247_cur."panic"("regex assertion not terminated by angle bracket")
    unless $P10, rx1247_fail
    rx1247_pos = $P10."pos"()
  alt1250_end:
.annotate 'line', 117
  # rx pass
    rx1247_cur."!cursor_pass"(rx1247_pos, "metachar:sym<assert>")
    if_null rx1247_debug, debug_350
    rx1247_cur."!cursor_debug"("PASS", "metachar:sym<assert>", " at pos=", rx1247_pos)
  debug_350:
    .return (rx1247_cur)
  rx1247_restart:
.annotate 'line', 3
    if_null rx1247_debug, debug_351
    rx1247_cur."!cursor_debug"("NEXT", "metachar:sym<assert>")
  debug_351:
  rx1247_fail:
    (rx1247_rep, rx1247_pos, $I10, $P10) = rx1247_cur."!mark_fail"(0)
    lt rx1247_pos, -1, rx1247_done
    eq rx1247_pos, -1, rx1247_fail
    jump $I10
  rx1247_done:
    rx1247_cur."!cursor_fail"()
    if_null rx1247_debug, debug_352
    rx1247_cur."!cursor_debug"("FAIL", "metachar:sym<assert>")
  debug_352:
    .return (rx1247_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<assert>"  :subid("98_1309998843.21663") :method
.annotate 'line', 3
    $P100 = self."!PREFIX__!subrule"("assertion", "<")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<var>"  :subid("99_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1252_tgt
    .local int rx1252_pos
    .local int rx1252_off
    .local int rx1252_eos
    .local int rx1252_rep
    .local pmc rx1252_cur
    .local pmc rx1252_debug
    (rx1252_cur, rx1252_pos, rx1252_tgt, $I10) = self."!cursor_start"()
    rx1252_cur."!cursor_caparray"("quantified_atom")
    getattribute rx1252_debug, rx1252_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1252_cur
    .local pmc match
    .lex "$/", match
    length rx1252_eos, rx1252_tgt
    gt rx1252_pos, rx1252_eos, rx1252_done
    set rx1252_off, 0
    lt rx1252_pos, 2, rx1252_start
    sub rx1252_off, rx1252_pos, 1
    substr rx1252_tgt, rx1252_tgt, rx1252_off
  rx1252_start:
    eq $I10, 1, rx1252_restart
    if_null rx1252_debug, debug_353
    rx1252_cur."!cursor_debug"("START", "metachar:sym<var>")
  debug_353:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1254_done
    goto rxscan1254_scan
  rxscan1254_loop:
    ($P10) = rx1252_cur."from"()
    inc $P10
    set rx1252_pos, $P10
    ge rx1252_pos, rx1252_eos, rxscan1254_done
  rxscan1254_scan:
    set_addr $I10, rxscan1254_loop
    rx1252_cur."!mark_push"(0, rx1252_pos, $I10)
  rxscan1254_done:
  alt1255_0:
.annotate 'line', 123
    set_addr $I10, alt1255_1
    rx1252_cur."!mark_push"(0, rx1252_pos, $I10)
.annotate 'line', 124
  # rx literal  "$<"
    add $I11, rx1252_pos, 2
    gt $I11, rx1252_eos, rx1252_fail
    sub $I11, rx1252_pos, rx1252_off
    substr $S10, rx1252_tgt, $I11, 2
    ne $S10, "$<", rx1252_fail
    add rx1252_pos, 2
  # rx subcapture "name"
    set_addr $I10, rxcap_1257_fail
    rx1252_cur."!mark_push"(0, rx1252_pos, $I10)
  # rx enumcharlist_q negate=1  r 1..-1
    sub $I10, rx1252_pos, rx1252_off
    set rx1252_rep, 0
    sub $I12, rx1252_eos, rx1252_pos
  rxenumcharlistq1256_loop:
    le $I12, 0, rxenumcharlistq1256_done
    substr $S10, rx1252_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rxenumcharlistq1256_done
    inc rx1252_rep
    inc $I10
    dec $I12
    goto rxenumcharlistq1256_loop
  rxenumcharlistq1256_done:
    lt rx1252_rep, 1, rx1252_fail
    add rx1252_pos, rx1252_pos, rx1252_rep
    set_addr $I10, rxcap_1257_fail
    ($I12, $I11) = rx1252_cur."!mark_peek"($I10)
    rx1252_cur."!cursor_pos"($I11)
    ($P10) = rx1252_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1252_pos, "")
    rx1252_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_1257_done
  rxcap_1257_fail:
    goto rx1252_fail
  rxcap_1257_done:
  # rx literal  ">"
    add $I11, rx1252_pos, 1
    gt $I11, rx1252_eos, rx1252_fail
    sub $I11, rx1252_pos, rx1252_off
    ord $I11, rx1252_tgt, $I11
    ne $I11, 62, rx1252_fail
    add rx1252_pos, 1
    goto alt1255_end
  alt1255_1:
.annotate 'line', 125
  # rx literal  "$"
    add $I11, rx1252_pos, 1
    gt $I11, rx1252_eos, rx1252_fail
    sub $I11, rx1252_pos, rx1252_off
    ord $I11, rx1252_tgt, $I11
    ne $I11, 36, rx1252_fail
    add rx1252_pos, 1
  # rx subcapture "pos"
    set_addr $I10, rxcap_1258_fail
    rx1252_cur."!mark_push"(0, rx1252_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx1252_pos, rx1252_off
    find_not_cclass $I11, 8, rx1252_tgt, $I10, rx1252_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1252_fail
    add rx1252_pos, rx1252_off, $I11
    set_addr $I10, rxcap_1258_fail
    ($I12, $I11) = rx1252_cur."!mark_peek"($I10)
    rx1252_cur."!cursor_pos"($I11)
    ($P10) = rx1252_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1252_pos, "")
    rx1252_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pos")
    goto rxcap_1258_done
  rxcap_1258_fail:
    goto rx1252_fail
  rxcap_1258_done:
  alt1255_end:
.annotate 'line', 128
  # rx rxquantr1259 ** 0..1
    set_addr $I10, rxquantr1259_done
    rx1252_cur."!mark_push"(0, rx1252_pos, $I10)
  rxquantr1259_loop:
  # rx subrule "ws" subtype=method negate=
    rx1252_cur."!cursor_pos"(rx1252_pos)
    $P10 = rx1252_cur."ws"()
    unless $P10, rx1252_fail
    rx1252_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx1252_pos, 1
    gt $I11, rx1252_eos, rx1252_fail
    sub $I11, rx1252_pos, rx1252_off
    ord $I11, rx1252_tgt, $I11
    ne $I11, 61, rx1252_fail
    add rx1252_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx1252_cur."!cursor_pos"(rx1252_pos)
    $P10 = rx1252_cur."ws"()
    unless $P10, rx1252_fail
    rx1252_pos = $P10."pos"()
  # rx subrule "quantified_atom" subtype=capture negate=
    rx1252_cur."!cursor_pos"(rx1252_pos)
    $P10 = rx1252_cur."quantified_atom"()
    unless $P10, rx1252_fail
    rx1252_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quantified_atom")
    rx1252_pos = $P10."pos"()
    set_addr $I10, rxquantr1259_done
    (rx1252_rep) = rx1252_cur."!mark_commit"($I10)
  rxquantr1259_done:
.annotate 'line', 122
  # rx pass
    rx1252_cur."!cursor_pass"(rx1252_pos, "metachar:sym<var>")
    if_null rx1252_debug, debug_354
    rx1252_cur."!cursor_debug"("PASS", "metachar:sym<var>", " at pos=", rx1252_pos)
  debug_354:
    .return (rx1252_cur)
  rx1252_restart:
.annotate 'line', 3
    if_null rx1252_debug, debug_355
    rx1252_cur."!cursor_debug"("NEXT", "metachar:sym<var>")
  debug_355:
  rx1252_fail:
    (rx1252_rep, rx1252_pos, $I10, $P10) = rx1252_cur."!mark_fail"(0)
    lt rx1252_pos, -1, rx1252_done
    eq rx1252_pos, -1, rx1252_fail
    jump $I10
  rx1252_done:
    rx1252_cur."!cursor_fail"()
    if_null rx1252_debug, debug_356
    rx1252_cur."!cursor_debug"("FAIL", "metachar:sym<var>")
  debug_356:
    .return (rx1252_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<var>"  :subid("100_1309998843.21663") :method
.annotate 'line', 3
    new $P100, "ResizablePMCArray"
    push $P100, "$"
    push $P100, "$<"
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "metachar:sym<PIR>"  :subid("101_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1261_tgt
    .local int rx1261_pos
    .local int rx1261_off
    .local int rx1261_eos
    .local int rx1261_rep
    .local pmc rx1261_cur
    .local pmc rx1261_debug
    (rx1261_cur, rx1261_pos, rx1261_tgt, $I10) = self."!cursor_start"()
    getattribute rx1261_debug, rx1261_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1261_cur
    .local pmc match
    .lex "$/", match
    length rx1261_eos, rx1261_tgt
    gt rx1261_pos, rx1261_eos, rx1261_done
    set rx1261_off, 0
    lt rx1261_pos, 2, rx1261_start
    sub rx1261_off, rx1261_pos, 1
    substr rx1261_tgt, rx1261_tgt, rx1261_off
  rx1261_start:
    eq $I10, 1, rx1261_restart
    if_null rx1261_debug, debug_357
    rx1261_cur."!cursor_debug"("START", "metachar:sym<PIR>")
  debug_357:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1263_done
    goto rxscan1263_scan
  rxscan1263_loop:
    ($P10) = rx1261_cur."from"()
    inc $P10
    set rx1261_pos, $P10
    ge rx1261_pos, rx1261_eos, rxscan1263_done
  rxscan1263_scan:
    set_addr $I10, rxscan1263_loop
    rx1261_cur."!mark_push"(0, rx1261_pos, $I10)
  rxscan1263_done:
.annotate 'line', 132
  # rx literal  ":PIR{{"
    add $I11, rx1261_pos, 6
    gt $I11, rx1261_eos, rx1261_fail
    sub $I11, rx1261_pos, rx1261_off
    substr $S10, rx1261_tgt, $I11, 6
    ne $S10, ":PIR{{", rx1261_fail
    add rx1261_pos, 6
  # rx subcapture "pir"
    set_addr $I10, rxcap_1266_fail
    rx1261_cur."!mark_push"(0, rx1261_pos, $I10)
  # rx rxquantf1264 ** 0..*
    set_addr $I10, rxquantf1264_loop
    rx1261_cur."!mark_push"(0, rx1261_pos, $I10)
    goto rxquantf1264_done
  rxquantf1264_loop:
  # rx charclass .
    ge rx1261_pos, rx1261_eos, rx1261_fail
    inc rx1261_pos
    set_addr $I10, rxquantf1264_loop
    rx1261_cur."!mark_push"(rx1261_rep, rx1261_pos, $I10)
  rxquantf1264_done:
    set_addr $I10, rxcap_1266_fail
    ($I12, $I11) = rx1261_cur."!mark_peek"($I10)
    rx1261_cur."!cursor_pos"($I11)
    ($P10) = rx1261_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1261_pos, "")
    rx1261_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pir")
    goto rxcap_1266_done
  rxcap_1266_fail:
    goto rx1261_fail
  rxcap_1266_done:
  # rx literal  "}}"
    add $I11, rx1261_pos, 2
    gt $I11, rx1261_eos, rx1261_fail
    sub $I11, rx1261_pos, rx1261_off
    substr $S10, rx1261_tgt, $I11, 2
    ne $S10, "}}", rx1261_fail
    add rx1261_pos, 2
.annotate 'line', 131
  # rx pass
    rx1261_cur."!cursor_pass"(rx1261_pos, "metachar:sym<PIR>")
    if_null rx1261_debug, debug_358
    rx1261_cur."!cursor_debug"("PASS", "metachar:sym<PIR>", " at pos=", rx1261_pos)
  debug_358:
    .return (rx1261_cur)
  rx1261_restart:
.annotate 'line', 3
    if_null rx1261_debug, debug_359
    rx1261_cur."!cursor_debug"("NEXT", "metachar:sym<PIR>")
  debug_359:
  rx1261_fail:
    (rx1261_rep, rx1261_pos, $I10, $P10) = rx1261_cur."!mark_fail"(0)
    lt rx1261_pos, -1, rx1261_done
    eq rx1261_pos, -1, rx1261_fail
    jump $I10
  rx1261_done:
    rx1261_cur."!cursor_fail"()
    if_null rx1261_debug, debug_360
    rx1261_cur."!cursor_debug"("FAIL", "metachar:sym<PIR>")
  debug_360:
    .return (rx1261_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__metachar:sym<PIR>"  :subid("102_1309998843.21663") :method
.annotate 'line', 3
    new $P100, "ResizablePMCArray"
    push $P100, ":PIR{{"
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash"  :subid("103_1309998843.21663") :method
.annotate 'line', 135
    $P100 = self."!protoregex"("backslash")
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash"  :subid("104_1309998843.21663") :method
.annotate 'line', 135
    $P101 = self."!PREFIX__!protoregex"("backslash")
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<w>"  :subid("105_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1270_tgt
    .local int rx1270_pos
    .local int rx1270_off
    .local int rx1270_eos
    .local int rx1270_rep
    .local pmc rx1270_cur
    .local pmc rx1270_debug
    (rx1270_cur, rx1270_pos, rx1270_tgt, $I10) = self."!cursor_start"()
    getattribute rx1270_debug, rx1270_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1270_cur
    .local pmc match
    .lex "$/", match
    length rx1270_eos, rx1270_tgt
    gt rx1270_pos, rx1270_eos, rx1270_done
    set rx1270_off, 0
    lt rx1270_pos, 2, rx1270_start
    sub rx1270_off, rx1270_pos, 1
    substr rx1270_tgt, rx1270_tgt, rx1270_off
  rx1270_start:
    eq $I10, 1, rx1270_restart
    if_null rx1270_debug, debug_361
    rx1270_cur."!cursor_debug"("START", "backslash:sym<w>")
  debug_361:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1272_done
    goto rxscan1272_scan
  rxscan1272_loop:
    ($P10) = rx1270_cur."from"()
    inc $P10
    set rx1270_pos, $P10
    ge rx1270_pos, rx1270_eos, rxscan1272_done
  rxscan1272_scan:
    set_addr $I10, rxscan1272_loop
    rx1270_cur."!mark_push"(0, rx1270_pos, $I10)
  rxscan1272_done:
.annotate 'line', 136
  # rx subcapture "sym"
    set_addr $I10, rxcap_1273_fail
    rx1270_cur."!mark_push"(0, rx1270_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx1270_pos, rx1270_eos, rx1270_fail
    sub $I10, rx1270_pos, rx1270_off
    substr $S10, rx1270_tgt, $I10, 1
    index $I11, "dswnDSWN", $S10
    lt $I11, 0, rx1270_fail
    inc rx1270_pos
    set_addr $I10, rxcap_1273_fail
    ($I12, $I11) = rx1270_cur."!mark_peek"($I10)
    rx1270_cur."!cursor_pos"($I11)
    ($P10) = rx1270_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1270_pos, "")
    rx1270_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1273_done
  rxcap_1273_fail:
    goto rx1270_fail
  rxcap_1273_done:
  # rx pass
    rx1270_cur."!cursor_pass"(rx1270_pos, "backslash:sym<w>")
    if_null rx1270_debug, debug_362
    rx1270_cur."!cursor_debug"("PASS", "backslash:sym<w>", " at pos=", rx1270_pos)
  debug_362:
    .return (rx1270_cur)
  rx1270_restart:
.annotate 'line', 3
    if_null rx1270_debug, debug_363
    rx1270_cur."!cursor_debug"("NEXT", "backslash:sym<w>")
  debug_363:
  rx1270_fail:
    (rx1270_rep, rx1270_pos, $I10, $P10) = rx1270_cur."!mark_fail"(0)
    lt rx1270_pos, -1, rx1270_done
    eq rx1270_pos, -1, rx1270_fail
    jump $I10
  rx1270_done:
    rx1270_cur."!cursor_fail"()
    if_null rx1270_debug, debug_364
    rx1270_cur."!cursor_debug"("FAIL", "backslash:sym<w>")
  debug_364:
    .return (rx1270_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<w>"  :subid("106_1309998843.21663") :method
.annotate 'line', 3
    new $P100, "ResizablePMCArray"
    push $P100, "N"
    push $P100, "W"
    push $P100, "S"
    push $P100, "D"
    push $P100, "n"
    push $P100, "w"
    push $P100, "s"
    push $P100, "d"
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<b>"  :subid("107_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1275_tgt
    .local int rx1275_pos
    .local int rx1275_off
    .local int rx1275_eos
    .local int rx1275_rep
    .local pmc rx1275_cur
    .local pmc rx1275_debug
    (rx1275_cur, rx1275_pos, rx1275_tgt, $I10) = self."!cursor_start"()
    getattribute rx1275_debug, rx1275_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1275_cur
    .local pmc match
    .lex "$/", match
    length rx1275_eos, rx1275_tgt
    gt rx1275_pos, rx1275_eos, rx1275_done
    set rx1275_off, 0
    lt rx1275_pos, 2, rx1275_start
    sub rx1275_off, rx1275_pos, 1
    substr rx1275_tgt, rx1275_tgt, rx1275_off
  rx1275_start:
    eq $I10, 1, rx1275_restart
    if_null rx1275_debug, debug_365
    rx1275_cur."!cursor_debug"("START", "backslash:sym<b>")
  debug_365:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1277_done
    goto rxscan1277_scan
  rxscan1277_loop:
    ($P10) = rx1275_cur."from"()
    inc $P10
    set rx1275_pos, $P10
    ge rx1275_pos, rx1275_eos, rxscan1277_done
  rxscan1277_scan:
    set_addr $I10, rxscan1277_loop
    rx1275_cur."!mark_push"(0, rx1275_pos, $I10)
  rxscan1277_done:
.annotate 'line', 137
  # rx subcapture "sym"
    set_addr $I10, rxcap_1278_fail
    rx1275_cur."!mark_push"(0, rx1275_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx1275_pos, rx1275_eos, rx1275_fail
    sub $I10, rx1275_pos, rx1275_off
    substr $S10, rx1275_tgt, $I10, 1
    index $I11, "bB", $S10
    lt $I11, 0, rx1275_fail
    inc rx1275_pos
    set_addr $I10, rxcap_1278_fail
    ($I12, $I11) = rx1275_cur."!mark_peek"($I10)
    rx1275_cur."!cursor_pos"($I11)
    ($P10) = rx1275_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1275_pos, "")
    rx1275_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1278_done
  rxcap_1278_fail:
    goto rx1275_fail
  rxcap_1278_done:
  # rx pass
    rx1275_cur."!cursor_pass"(rx1275_pos, "backslash:sym<b>")
    if_null rx1275_debug, debug_366
    rx1275_cur."!cursor_debug"("PASS", "backslash:sym<b>", " at pos=", rx1275_pos)
  debug_366:
    .return (rx1275_cur)
  rx1275_restart:
.annotate 'line', 3
    if_null rx1275_debug, debug_367
    rx1275_cur."!cursor_debug"("NEXT", "backslash:sym<b>")
  debug_367:
  rx1275_fail:
    (rx1275_rep, rx1275_pos, $I10, $P10) = rx1275_cur."!mark_fail"(0)
    lt rx1275_pos, -1, rx1275_done
    eq rx1275_pos, -1, rx1275_fail
    jump $I10
  rx1275_done:
    rx1275_cur."!cursor_fail"()
    if_null rx1275_debug, debug_368
    rx1275_cur."!cursor_debug"("FAIL", "backslash:sym<b>")
  debug_368:
    .return (rx1275_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<b>"  :subid("108_1309998843.21663") :method
.annotate 'line', 3
    new $P100, "ResizablePMCArray"
    push $P100, "B"
    push $P100, "b"
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<e>"  :subid("109_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1280_tgt
    .local int rx1280_pos
    .local int rx1280_off
    .local int rx1280_eos
    .local int rx1280_rep
    .local pmc rx1280_cur
    .local pmc rx1280_debug
    (rx1280_cur, rx1280_pos, rx1280_tgt, $I10) = self."!cursor_start"()
    getattribute rx1280_debug, rx1280_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1280_cur
    .local pmc match
    .lex "$/", match
    length rx1280_eos, rx1280_tgt
    gt rx1280_pos, rx1280_eos, rx1280_done
    set rx1280_off, 0
    lt rx1280_pos, 2, rx1280_start
    sub rx1280_off, rx1280_pos, 1
    substr rx1280_tgt, rx1280_tgt, rx1280_off
  rx1280_start:
    eq $I10, 1, rx1280_restart
    if_null rx1280_debug, debug_369
    rx1280_cur."!cursor_debug"("START", "backslash:sym<e>")
  debug_369:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1282_done
    goto rxscan1282_scan
  rxscan1282_loop:
    ($P10) = rx1280_cur."from"()
    inc $P10
    set rx1280_pos, $P10
    ge rx1280_pos, rx1280_eos, rxscan1282_done
  rxscan1282_scan:
    set_addr $I10, rxscan1282_loop
    rx1280_cur."!mark_push"(0, rx1280_pos, $I10)
  rxscan1282_done:
.annotate 'line', 138
  # rx subcapture "sym"
    set_addr $I10, rxcap_1283_fail
    rx1280_cur."!mark_push"(0, rx1280_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx1280_pos, rx1280_eos, rx1280_fail
    sub $I10, rx1280_pos, rx1280_off
    substr $S10, rx1280_tgt, $I10, 1
    index $I11, "eE", $S10
    lt $I11, 0, rx1280_fail
    inc rx1280_pos
    set_addr $I10, rxcap_1283_fail
    ($I12, $I11) = rx1280_cur."!mark_peek"($I10)
    rx1280_cur."!cursor_pos"($I11)
    ($P10) = rx1280_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1280_pos, "")
    rx1280_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1283_done
  rxcap_1283_fail:
    goto rx1280_fail
  rxcap_1283_done:
  # rx pass
    rx1280_cur."!cursor_pass"(rx1280_pos, "backslash:sym<e>")
    if_null rx1280_debug, debug_370
    rx1280_cur."!cursor_debug"("PASS", "backslash:sym<e>", " at pos=", rx1280_pos)
  debug_370:
    .return (rx1280_cur)
  rx1280_restart:
.annotate 'line', 3
    if_null rx1280_debug, debug_371
    rx1280_cur."!cursor_debug"("NEXT", "backslash:sym<e>")
  debug_371:
  rx1280_fail:
    (rx1280_rep, rx1280_pos, $I10, $P10) = rx1280_cur."!mark_fail"(0)
    lt rx1280_pos, -1, rx1280_done
    eq rx1280_pos, -1, rx1280_fail
    jump $I10
  rx1280_done:
    rx1280_cur."!cursor_fail"()
    if_null rx1280_debug, debug_372
    rx1280_cur."!cursor_debug"("FAIL", "backslash:sym<e>")
  debug_372:
    .return (rx1280_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<e>"  :subid("110_1309998843.21663") :method
.annotate 'line', 3
    new $P100, "ResizablePMCArray"
    push $P100, "E"
    push $P100, "e"
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<f>"  :subid("111_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1285_tgt
    .local int rx1285_pos
    .local int rx1285_off
    .local int rx1285_eos
    .local int rx1285_rep
    .local pmc rx1285_cur
    .local pmc rx1285_debug
    (rx1285_cur, rx1285_pos, rx1285_tgt, $I10) = self."!cursor_start"()
    getattribute rx1285_debug, rx1285_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1285_cur
    .local pmc match
    .lex "$/", match
    length rx1285_eos, rx1285_tgt
    gt rx1285_pos, rx1285_eos, rx1285_done
    set rx1285_off, 0
    lt rx1285_pos, 2, rx1285_start
    sub rx1285_off, rx1285_pos, 1
    substr rx1285_tgt, rx1285_tgt, rx1285_off
  rx1285_start:
    eq $I10, 1, rx1285_restart
    if_null rx1285_debug, debug_373
    rx1285_cur."!cursor_debug"("START", "backslash:sym<f>")
  debug_373:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1287_done
    goto rxscan1287_scan
  rxscan1287_loop:
    ($P10) = rx1285_cur."from"()
    inc $P10
    set rx1285_pos, $P10
    ge rx1285_pos, rx1285_eos, rxscan1287_done
  rxscan1287_scan:
    set_addr $I10, rxscan1287_loop
    rx1285_cur."!mark_push"(0, rx1285_pos, $I10)
  rxscan1287_done:
.annotate 'line', 139
  # rx subcapture "sym"
    set_addr $I10, rxcap_1288_fail
    rx1285_cur."!mark_push"(0, rx1285_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx1285_pos, rx1285_eos, rx1285_fail
    sub $I10, rx1285_pos, rx1285_off
    substr $S10, rx1285_tgt, $I10, 1
    index $I11, "fF", $S10
    lt $I11, 0, rx1285_fail
    inc rx1285_pos
    set_addr $I10, rxcap_1288_fail
    ($I12, $I11) = rx1285_cur."!mark_peek"($I10)
    rx1285_cur."!cursor_pos"($I11)
    ($P10) = rx1285_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1285_pos, "")
    rx1285_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1288_done
  rxcap_1288_fail:
    goto rx1285_fail
  rxcap_1288_done:
  # rx pass
    rx1285_cur."!cursor_pass"(rx1285_pos, "backslash:sym<f>")
    if_null rx1285_debug, debug_374
    rx1285_cur."!cursor_debug"("PASS", "backslash:sym<f>", " at pos=", rx1285_pos)
  debug_374:
    .return (rx1285_cur)
  rx1285_restart:
.annotate 'line', 3
    if_null rx1285_debug, debug_375
    rx1285_cur."!cursor_debug"("NEXT", "backslash:sym<f>")
  debug_375:
  rx1285_fail:
    (rx1285_rep, rx1285_pos, $I10, $P10) = rx1285_cur."!mark_fail"(0)
    lt rx1285_pos, -1, rx1285_done
    eq rx1285_pos, -1, rx1285_fail
    jump $I10
  rx1285_done:
    rx1285_cur."!cursor_fail"()
    if_null rx1285_debug, debug_376
    rx1285_cur."!cursor_debug"("FAIL", "backslash:sym<f>")
  debug_376:
    .return (rx1285_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<f>"  :subid("112_1309998843.21663") :method
.annotate 'line', 3
    new $P100, "ResizablePMCArray"
    push $P100, "F"
    push $P100, "f"
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<h>"  :subid("113_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1290_tgt
    .local int rx1290_pos
    .local int rx1290_off
    .local int rx1290_eos
    .local int rx1290_rep
    .local pmc rx1290_cur
    .local pmc rx1290_debug
    (rx1290_cur, rx1290_pos, rx1290_tgt, $I10) = self."!cursor_start"()
    getattribute rx1290_debug, rx1290_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1290_cur
    .local pmc match
    .lex "$/", match
    length rx1290_eos, rx1290_tgt
    gt rx1290_pos, rx1290_eos, rx1290_done
    set rx1290_off, 0
    lt rx1290_pos, 2, rx1290_start
    sub rx1290_off, rx1290_pos, 1
    substr rx1290_tgt, rx1290_tgt, rx1290_off
  rx1290_start:
    eq $I10, 1, rx1290_restart
    if_null rx1290_debug, debug_377
    rx1290_cur."!cursor_debug"("START", "backslash:sym<h>")
  debug_377:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1292_done
    goto rxscan1292_scan
  rxscan1292_loop:
    ($P10) = rx1290_cur."from"()
    inc $P10
    set rx1290_pos, $P10
    ge rx1290_pos, rx1290_eos, rxscan1292_done
  rxscan1292_scan:
    set_addr $I10, rxscan1292_loop
    rx1290_cur."!mark_push"(0, rx1290_pos, $I10)
  rxscan1292_done:
.annotate 'line', 140
  # rx subcapture "sym"
    set_addr $I10, rxcap_1293_fail
    rx1290_cur."!mark_push"(0, rx1290_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx1290_pos, rx1290_eos, rx1290_fail
    sub $I10, rx1290_pos, rx1290_off
    substr $S10, rx1290_tgt, $I10, 1
    index $I11, "hH", $S10
    lt $I11, 0, rx1290_fail
    inc rx1290_pos
    set_addr $I10, rxcap_1293_fail
    ($I12, $I11) = rx1290_cur."!mark_peek"($I10)
    rx1290_cur."!cursor_pos"($I11)
    ($P10) = rx1290_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1290_pos, "")
    rx1290_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1293_done
  rxcap_1293_fail:
    goto rx1290_fail
  rxcap_1293_done:
  # rx pass
    rx1290_cur."!cursor_pass"(rx1290_pos, "backslash:sym<h>")
    if_null rx1290_debug, debug_378
    rx1290_cur."!cursor_debug"("PASS", "backslash:sym<h>", " at pos=", rx1290_pos)
  debug_378:
    .return (rx1290_cur)
  rx1290_restart:
.annotate 'line', 3
    if_null rx1290_debug, debug_379
    rx1290_cur."!cursor_debug"("NEXT", "backslash:sym<h>")
  debug_379:
  rx1290_fail:
    (rx1290_rep, rx1290_pos, $I10, $P10) = rx1290_cur."!mark_fail"(0)
    lt rx1290_pos, -1, rx1290_done
    eq rx1290_pos, -1, rx1290_fail
    jump $I10
  rx1290_done:
    rx1290_cur."!cursor_fail"()
    if_null rx1290_debug, debug_380
    rx1290_cur."!cursor_debug"("FAIL", "backslash:sym<h>")
  debug_380:
    .return (rx1290_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<h>"  :subid("114_1309998843.21663") :method
.annotate 'line', 3
    new $P100, "ResizablePMCArray"
    push $P100, "H"
    push $P100, "h"
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<r>"  :subid("115_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1295_tgt
    .local int rx1295_pos
    .local int rx1295_off
    .local int rx1295_eos
    .local int rx1295_rep
    .local pmc rx1295_cur
    .local pmc rx1295_debug
    (rx1295_cur, rx1295_pos, rx1295_tgt, $I10) = self."!cursor_start"()
    getattribute rx1295_debug, rx1295_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1295_cur
    .local pmc match
    .lex "$/", match
    length rx1295_eos, rx1295_tgt
    gt rx1295_pos, rx1295_eos, rx1295_done
    set rx1295_off, 0
    lt rx1295_pos, 2, rx1295_start
    sub rx1295_off, rx1295_pos, 1
    substr rx1295_tgt, rx1295_tgt, rx1295_off
  rx1295_start:
    eq $I10, 1, rx1295_restart
    if_null rx1295_debug, debug_381
    rx1295_cur."!cursor_debug"("START", "backslash:sym<r>")
  debug_381:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1297_done
    goto rxscan1297_scan
  rxscan1297_loop:
    ($P10) = rx1295_cur."from"()
    inc $P10
    set rx1295_pos, $P10
    ge rx1295_pos, rx1295_eos, rxscan1297_done
  rxscan1297_scan:
    set_addr $I10, rxscan1297_loop
    rx1295_cur."!mark_push"(0, rx1295_pos, $I10)
  rxscan1297_done:
.annotate 'line', 141
  # rx subcapture "sym"
    set_addr $I10, rxcap_1298_fail
    rx1295_cur."!mark_push"(0, rx1295_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx1295_pos, rx1295_eos, rx1295_fail
    sub $I10, rx1295_pos, rx1295_off
    substr $S10, rx1295_tgt, $I10, 1
    index $I11, "rR", $S10
    lt $I11, 0, rx1295_fail
    inc rx1295_pos
    set_addr $I10, rxcap_1298_fail
    ($I12, $I11) = rx1295_cur."!mark_peek"($I10)
    rx1295_cur."!cursor_pos"($I11)
    ($P10) = rx1295_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1295_pos, "")
    rx1295_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1298_done
  rxcap_1298_fail:
    goto rx1295_fail
  rxcap_1298_done:
  # rx pass
    rx1295_cur."!cursor_pass"(rx1295_pos, "backslash:sym<r>")
    if_null rx1295_debug, debug_382
    rx1295_cur."!cursor_debug"("PASS", "backslash:sym<r>", " at pos=", rx1295_pos)
  debug_382:
    .return (rx1295_cur)
  rx1295_restart:
.annotate 'line', 3
    if_null rx1295_debug, debug_383
    rx1295_cur."!cursor_debug"("NEXT", "backslash:sym<r>")
  debug_383:
  rx1295_fail:
    (rx1295_rep, rx1295_pos, $I10, $P10) = rx1295_cur."!mark_fail"(0)
    lt rx1295_pos, -1, rx1295_done
    eq rx1295_pos, -1, rx1295_fail
    jump $I10
  rx1295_done:
    rx1295_cur."!cursor_fail"()
    if_null rx1295_debug, debug_384
    rx1295_cur."!cursor_debug"("FAIL", "backslash:sym<r>")
  debug_384:
    .return (rx1295_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<r>"  :subid("116_1309998843.21663") :method
.annotate 'line', 3
    new $P100, "ResizablePMCArray"
    push $P100, "R"
    push $P100, "r"
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<t>"  :subid("117_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1300_tgt
    .local int rx1300_pos
    .local int rx1300_off
    .local int rx1300_eos
    .local int rx1300_rep
    .local pmc rx1300_cur
    .local pmc rx1300_debug
    (rx1300_cur, rx1300_pos, rx1300_tgt, $I10) = self."!cursor_start"()
    getattribute rx1300_debug, rx1300_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1300_cur
    .local pmc match
    .lex "$/", match
    length rx1300_eos, rx1300_tgt
    gt rx1300_pos, rx1300_eos, rx1300_done
    set rx1300_off, 0
    lt rx1300_pos, 2, rx1300_start
    sub rx1300_off, rx1300_pos, 1
    substr rx1300_tgt, rx1300_tgt, rx1300_off
  rx1300_start:
    eq $I10, 1, rx1300_restart
    if_null rx1300_debug, debug_385
    rx1300_cur."!cursor_debug"("START", "backslash:sym<t>")
  debug_385:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1302_done
    goto rxscan1302_scan
  rxscan1302_loop:
    ($P10) = rx1300_cur."from"()
    inc $P10
    set rx1300_pos, $P10
    ge rx1300_pos, rx1300_eos, rxscan1302_done
  rxscan1302_scan:
    set_addr $I10, rxscan1302_loop
    rx1300_cur."!mark_push"(0, rx1300_pos, $I10)
  rxscan1302_done:
.annotate 'line', 142
  # rx subcapture "sym"
    set_addr $I10, rxcap_1303_fail
    rx1300_cur."!mark_push"(0, rx1300_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx1300_pos, rx1300_eos, rx1300_fail
    sub $I10, rx1300_pos, rx1300_off
    substr $S10, rx1300_tgt, $I10, 1
    index $I11, "tT", $S10
    lt $I11, 0, rx1300_fail
    inc rx1300_pos
    set_addr $I10, rxcap_1303_fail
    ($I12, $I11) = rx1300_cur."!mark_peek"($I10)
    rx1300_cur."!cursor_pos"($I11)
    ($P10) = rx1300_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1300_pos, "")
    rx1300_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1303_done
  rxcap_1303_fail:
    goto rx1300_fail
  rxcap_1303_done:
  # rx pass
    rx1300_cur."!cursor_pass"(rx1300_pos, "backslash:sym<t>")
    if_null rx1300_debug, debug_386
    rx1300_cur."!cursor_debug"("PASS", "backslash:sym<t>", " at pos=", rx1300_pos)
  debug_386:
    .return (rx1300_cur)
  rx1300_restart:
.annotate 'line', 3
    if_null rx1300_debug, debug_387
    rx1300_cur."!cursor_debug"("NEXT", "backslash:sym<t>")
  debug_387:
  rx1300_fail:
    (rx1300_rep, rx1300_pos, $I10, $P10) = rx1300_cur."!mark_fail"(0)
    lt rx1300_pos, -1, rx1300_done
    eq rx1300_pos, -1, rx1300_fail
    jump $I10
  rx1300_done:
    rx1300_cur."!cursor_fail"()
    if_null rx1300_debug, debug_388
    rx1300_cur."!cursor_debug"("FAIL", "backslash:sym<t>")
  debug_388:
    .return (rx1300_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<t>"  :subid("118_1309998843.21663") :method
.annotate 'line', 3
    new $P100, "ResizablePMCArray"
    push $P100, "T"
    push $P100, "t"
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<v>"  :subid("119_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1305_tgt
    .local int rx1305_pos
    .local int rx1305_off
    .local int rx1305_eos
    .local int rx1305_rep
    .local pmc rx1305_cur
    .local pmc rx1305_debug
    (rx1305_cur, rx1305_pos, rx1305_tgt, $I10) = self."!cursor_start"()
    getattribute rx1305_debug, rx1305_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1305_cur
    .local pmc match
    .lex "$/", match
    length rx1305_eos, rx1305_tgt
    gt rx1305_pos, rx1305_eos, rx1305_done
    set rx1305_off, 0
    lt rx1305_pos, 2, rx1305_start
    sub rx1305_off, rx1305_pos, 1
    substr rx1305_tgt, rx1305_tgt, rx1305_off
  rx1305_start:
    eq $I10, 1, rx1305_restart
    if_null rx1305_debug, debug_389
    rx1305_cur."!cursor_debug"("START", "backslash:sym<v>")
  debug_389:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1307_done
    goto rxscan1307_scan
  rxscan1307_loop:
    ($P10) = rx1305_cur."from"()
    inc $P10
    set rx1305_pos, $P10
    ge rx1305_pos, rx1305_eos, rxscan1307_done
  rxscan1307_scan:
    set_addr $I10, rxscan1307_loop
    rx1305_cur."!mark_push"(0, rx1305_pos, $I10)
  rxscan1307_done:
.annotate 'line', 143
  # rx subcapture "sym"
    set_addr $I10, rxcap_1308_fail
    rx1305_cur."!mark_push"(0, rx1305_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx1305_pos, rx1305_eos, rx1305_fail
    sub $I10, rx1305_pos, rx1305_off
    substr $S10, rx1305_tgt, $I10, 1
    index $I11, "vV", $S10
    lt $I11, 0, rx1305_fail
    inc rx1305_pos
    set_addr $I10, rxcap_1308_fail
    ($I12, $I11) = rx1305_cur."!mark_peek"($I10)
    rx1305_cur."!cursor_pos"($I11)
    ($P10) = rx1305_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1305_pos, "")
    rx1305_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1308_done
  rxcap_1308_fail:
    goto rx1305_fail
  rxcap_1308_done:
  # rx pass
    rx1305_cur."!cursor_pass"(rx1305_pos, "backslash:sym<v>")
    if_null rx1305_debug, debug_390
    rx1305_cur."!cursor_debug"("PASS", "backslash:sym<v>", " at pos=", rx1305_pos)
  debug_390:
    .return (rx1305_cur)
  rx1305_restart:
.annotate 'line', 3
    if_null rx1305_debug, debug_391
    rx1305_cur."!cursor_debug"("NEXT", "backslash:sym<v>")
  debug_391:
  rx1305_fail:
    (rx1305_rep, rx1305_pos, $I10, $P10) = rx1305_cur."!mark_fail"(0)
    lt rx1305_pos, -1, rx1305_done
    eq rx1305_pos, -1, rx1305_fail
    jump $I10
  rx1305_done:
    rx1305_cur."!cursor_fail"()
    if_null rx1305_debug, debug_392
    rx1305_cur."!cursor_debug"("FAIL", "backslash:sym<v>")
  debug_392:
    .return (rx1305_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<v>"  :subid("120_1309998843.21663") :method
.annotate 'line', 3
    new $P100, "ResizablePMCArray"
    push $P100, "V"
    push $P100, "v"
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<o>"  :subid("121_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1310_tgt
    .local int rx1310_pos
    .local int rx1310_off
    .local int rx1310_eos
    .local int rx1310_rep
    .local pmc rx1310_cur
    .local pmc rx1310_debug
    (rx1310_cur, rx1310_pos, rx1310_tgt, $I10) = self."!cursor_start"()
    getattribute rx1310_debug, rx1310_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1310_cur
    .local pmc match
    .lex "$/", match
    length rx1310_eos, rx1310_tgt
    gt rx1310_pos, rx1310_eos, rx1310_done
    set rx1310_off, 0
    lt rx1310_pos, 2, rx1310_start
    sub rx1310_off, rx1310_pos, 1
    substr rx1310_tgt, rx1310_tgt, rx1310_off
  rx1310_start:
    eq $I10, 1, rx1310_restart
    if_null rx1310_debug, debug_393
    rx1310_cur."!cursor_debug"("START", "backslash:sym<o>")
  debug_393:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1312_done
    goto rxscan1312_scan
  rxscan1312_loop:
    ($P10) = rx1310_cur."from"()
    inc $P10
    set rx1310_pos, $P10
    ge rx1310_pos, rx1310_eos, rxscan1312_done
  rxscan1312_scan:
    set_addr $I10, rxscan1312_loop
    rx1310_cur."!mark_push"(0, rx1310_pos, $I10)
  rxscan1312_done:
.annotate 'line', 144
  # rx subcapture "sym"
    set_addr $I10, rxcap_1313_fail
    rx1310_cur."!mark_push"(0, rx1310_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx1310_pos, rx1310_eos, rx1310_fail
    sub $I10, rx1310_pos, rx1310_off
    substr $S10, rx1310_tgt, $I10, 1
    index $I11, "oO", $S10
    lt $I11, 0, rx1310_fail
    inc rx1310_pos
    set_addr $I10, rxcap_1313_fail
    ($I12, $I11) = rx1310_cur."!mark_peek"($I10)
    rx1310_cur."!cursor_pos"($I11)
    ($P10) = rx1310_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1310_pos, "")
    rx1310_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1313_done
  rxcap_1313_fail:
    goto rx1310_fail
  rxcap_1313_done:
  alt1314_0:
    set_addr $I10, alt1314_1
    rx1310_cur."!mark_push"(0, rx1310_pos, $I10)
  # rx subrule "octint" subtype=capture negate=
    rx1310_cur."!cursor_pos"(rx1310_pos)
    $P10 = rx1310_cur."octint"()
    unless $P10, rx1310_fail
    rx1310_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octint")
    rx1310_pos = $P10."pos"()
    goto alt1314_end
  alt1314_1:
  # rx literal  "["
    add $I11, rx1310_pos, 1
    gt $I11, rx1310_eos, rx1310_fail
    sub $I11, rx1310_pos, rx1310_off
    ord $I11, rx1310_tgt, $I11
    ne $I11, 91, rx1310_fail
    add rx1310_pos, 1
  # rx subrule "octints" subtype=capture negate=
    rx1310_cur."!cursor_pos"(rx1310_pos)
    $P10 = rx1310_cur."octints"()
    unless $P10, rx1310_fail
    rx1310_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("octints")
    rx1310_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx1310_pos, 1
    gt $I11, rx1310_eos, rx1310_fail
    sub $I11, rx1310_pos, rx1310_off
    ord $I11, rx1310_tgt, $I11
    ne $I11, 93, rx1310_fail
    add rx1310_pos, 1
  alt1314_end:
  # rx pass
    rx1310_cur."!cursor_pass"(rx1310_pos, "backslash:sym<o>")
    if_null rx1310_debug, debug_394
    rx1310_cur."!cursor_debug"("PASS", "backslash:sym<o>", " at pos=", rx1310_pos)
  debug_394:
    .return (rx1310_cur)
  rx1310_restart:
.annotate 'line', 3
    if_null rx1310_debug, debug_395
    rx1310_cur."!cursor_debug"("NEXT", "backslash:sym<o>")
  debug_395:
  rx1310_fail:
    (rx1310_rep, rx1310_pos, $I10, $P10) = rx1310_cur."!mark_fail"(0)
    lt rx1310_pos, -1, rx1310_done
    eq rx1310_pos, -1, rx1310_fail
    jump $I10
  rx1310_done:
    rx1310_cur."!cursor_fail"()
    if_null rx1310_debug, debug_396
    rx1310_cur."!cursor_debug"("FAIL", "backslash:sym<o>")
  debug_396:
    .return (rx1310_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<o>"  :subid("122_1309998843.21663") :method
.annotate 'line', 3
    $P100 = self."!PREFIX__!subrule"("octints", "O[")
    $P101 = self."!PREFIX__!subrule"("octint", "O")
    $P102 = self."!PREFIX__!subrule"("octints", "o[")
    $P103 = self."!PREFIX__!subrule"("octint", "o")
    new $P104, "ResizablePMCArray"
    push $P104, $P100
    push $P104, $P101
    push $P104, $P102
    push $P104, $P103
    .return ($P104)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<x>"  :subid("123_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1316_tgt
    .local int rx1316_pos
    .local int rx1316_off
    .local int rx1316_eos
    .local int rx1316_rep
    .local pmc rx1316_cur
    .local pmc rx1316_debug
    (rx1316_cur, rx1316_pos, rx1316_tgt, $I10) = self."!cursor_start"()
    getattribute rx1316_debug, rx1316_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1316_cur
    .local pmc match
    .lex "$/", match
    length rx1316_eos, rx1316_tgt
    gt rx1316_pos, rx1316_eos, rx1316_done
    set rx1316_off, 0
    lt rx1316_pos, 2, rx1316_start
    sub rx1316_off, rx1316_pos, 1
    substr rx1316_tgt, rx1316_tgt, rx1316_off
  rx1316_start:
    eq $I10, 1, rx1316_restart
    if_null rx1316_debug, debug_397
    rx1316_cur."!cursor_debug"("START", "backslash:sym<x>")
  debug_397:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1318_done
    goto rxscan1318_scan
  rxscan1318_loop:
    ($P10) = rx1316_cur."from"()
    inc $P10
    set rx1316_pos, $P10
    ge rx1316_pos, rx1316_eos, rxscan1318_done
  rxscan1318_scan:
    set_addr $I10, rxscan1318_loop
    rx1316_cur."!mark_push"(0, rx1316_pos, $I10)
  rxscan1318_done:
.annotate 'line', 145
  # rx subcapture "sym"
    set_addr $I10, rxcap_1319_fail
    rx1316_cur."!mark_push"(0, rx1316_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx1316_pos, rx1316_eos, rx1316_fail
    sub $I10, rx1316_pos, rx1316_off
    substr $S10, rx1316_tgt, $I10, 1
    index $I11, "xX", $S10
    lt $I11, 0, rx1316_fail
    inc rx1316_pos
    set_addr $I10, rxcap_1319_fail
    ($I12, $I11) = rx1316_cur."!mark_peek"($I10)
    rx1316_cur."!cursor_pos"($I11)
    ($P10) = rx1316_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1316_pos, "")
    rx1316_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1319_done
  rxcap_1319_fail:
    goto rx1316_fail
  rxcap_1319_done:
  alt1320_0:
    set_addr $I10, alt1320_1
    rx1316_cur."!mark_push"(0, rx1316_pos, $I10)
  # rx subrule "hexint" subtype=capture negate=
    rx1316_cur."!cursor_pos"(rx1316_pos)
    $P10 = rx1316_cur."hexint"()
    unless $P10, rx1316_fail
    rx1316_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexint")
    rx1316_pos = $P10."pos"()
    goto alt1320_end
  alt1320_1:
  # rx literal  "["
    add $I11, rx1316_pos, 1
    gt $I11, rx1316_eos, rx1316_fail
    sub $I11, rx1316_pos, rx1316_off
    ord $I11, rx1316_tgt, $I11
    ne $I11, 91, rx1316_fail
    add rx1316_pos, 1
  # rx subrule "hexints" subtype=capture negate=
    rx1316_cur."!cursor_pos"(rx1316_pos)
    $P10 = rx1316_cur."hexints"()
    unless $P10, rx1316_fail
    rx1316_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("hexints")
    rx1316_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx1316_pos, 1
    gt $I11, rx1316_eos, rx1316_fail
    sub $I11, rx1316_pos, rx1316_off
    ord $I11, rx1316_tgt, $I11
    ne $I11, 93, rx1316_fail
    add rx1316_pos, 1
  alt1320_end:
  # rx pass
    rx1316_cur."!cursor_pass"(rx1316_pos, "backslash:sym<x>")
    if_null rx1316_debug, debug_398
    rx1316_cur."!cursor_debug"("PASS", "backslash:sym<x>", " at pos=", rx1316_pos)
  debug_398:
    .return (rx1316_cur)
  rx1316_restart:
.annotate 'line', 3
    if_null rx1316_debug, debug_399
    rx1316_cur."!cursor_debug"("NEXT", "backslash:sym<x>")
  debug_399:
  rx1316_fail:
    (rx1316_rep, rx1316_pos, $I10, $P10) = rx1316_cur."!mark_fail"(0)
    lt rx1316_pos, -1, rx1316_done
    eq rx1316_pos, -1, rx1316_fail
    jump $I10
  rx1316_done:
    rx1316_cur."!cursor_fail"()
    if_null rx1316_debug, debug_400
    rx1316_cur."!cursor_debug"("FAIL", "backslash:sym<x>")
  debug_400:
    .return (rx1316_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<x>"  :subid("124_1309998843.21663") :method
.annotate 'line', 3
    $P100 = self."!PREFIX__!subrule"("hexints", "X[")
    $P101 = self."!PREFIX__!subrule"("hexint", "X")
    $P102 = self."!PREFIX__!subrule"("hexints", "x[")
    $P103 = self."!PREFIX__!subrule"("hexint", "x")
    new $P104, "ResizablePMCArray"
    push $P104, $P100
    push $P104, $P101
    push $P104, $P102
    push $P104, $P103
    .return ($P104)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<c>"  :subid("125_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1322_tgt
    .local int rx1322_pos
    .local int rx1322_off
    .local int rx1322_eos
    .local int rx1322_rep
    .local pmc rx1322_cur
    .local pmc rx1322_debug
    (rx1322_cur, rx1322_pos, rx1322_tgt, $I10) = self."!cursor_start"()
    getattribute rx1322_debug, rx1322_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1322_cur
    .local pmc match
    .lex "$/", match
    length rx1322_eos, rx1322_tgt
    gt rx1322_pos, rx1322_eos, rx1322_done
    set rx1322_off, 0
    lt rx1322_pos, 2, rx1322_start
    sub rx1322_off, rx1322_pos, 1
    substr rx1322_tgt, rx1322_tgt, rx1322_off
  rx1322_start:
    eq $I10, 1, rx1322_restart
    if_null rx1322_debug, debug_401
    rx1322_cur."!cursor_debug"("START", "backslash:sym<c>")
  debug_401:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1324_done
    goto rxscan1324_scan
  rxscan1324_loop:
    ($P10) = rx1322_cur."from"()
    inc $P10
    set rx1322_pos, $P10
    ge rx1322_pos, rx1322_eos, rxscan1324_done
  rxscan1324_scan:
    set_addr $I10, rxscan1324_loop
    rx1322_cur."!mark_push"(0, rx1322_pos, $I10)
  rxscan1324_done:
.annotate 'line', 146
  # rx subcapture "sym"
    set_addr $I10, rxcap_1325_fail
    rx1322_cur."!mark_push"(0, rx1322_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx1322_pos, rx1322_eos, rx1322_fail
    sub $I10, rx1322_pos, rx1322_off
    substr $S10, rx1322_tgt, $I10, 1
    index $I11, "cC", $S10
    lt $I11, 0, rx1322_fail
    inc rx1322_pos
    set_addr $I10, rxcap_1325_fail
    ($I12, $I11) = rx1322_cur."!mark_peek"($I10)
    rx1322_cur."!cursor_pos"($I11)
    ($P10) = rx1322_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1322_pos, "")
    rx1322_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1325_done
  rxcap_1325_fail:
    goto rx1322_fail
  rxcap_1325_done:
  # rx subrule "charspec" subtype=capture negate=
    rx1322_cur."!cursor_pos"(rx1322_pos)
    $P10 = rx1322_cur."charspec"()
    unless $P10, rx1322_fail
    rx1322_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("charspec")
    rx1322_pos = $P10."pos"()
  # rx pass
    rx1322_cur."!cursor_pass"(rx1322_pos, "backslash:sym<c>")
    if_null rx1322_debug, debug_402
    rx1322_cur."!cursor_debug"("PASS", "backslash:sym<c>", " at pos=", rx1322_pos)
  debug_402:
    .return (rx1322_cur)
  rx1322_restart:
.annotate 'line', 3
    if_null rx1322_debug, debug_403
    rx1322_cur."!cursor_debug"("NEXT", "backslash:sym<c>")
  debug_403:
  rx1322_fail:
    (rx1322_rep, rx1322_pos, $I10, $P10) = rx1322_cur."!mark_fail"(0)
    lt rx1322_pos, -1, rx1322_done
    eq rx1322_pos, -1, rx1322_fail
    jump $I10
  rx1322_done:
    rx1322_cur."!cursor_fail"()
    if_null rx1322_debug, debug_404
    rx1322_cur."!cursor_debug"("FAIL", "backslash:sym<c>")
  debug_404:
    .return (rx1322_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<c>"  :subid("126_1309998843.21663") :method
.annotate 'line', 3
    $P100 = self."!PREFIX__!subrule"("charspec", "C")
    $P101 = self."!PREFIX__!subrule"("charspec", "c")
    new $P102, "ResizablePMCArray"
    push $P102, $P100
    push $P102, $P101
    .return ($P102)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<A>"  :subid("127_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1327_tgt
    .local int rx1327_pos
    .local int rx1327_off
    .local int rx1327_eos
    .local int rx1327_rep
    .local pmc rx1327_cur
    .local pmc rx1327_debug
    (rx1327_cur, rx1327_pos, rx1327_tgt, $I10) = self."!cursor_start"()
    getattribute rx1327_debug, rx1327_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1327_cur
    .local pmc match
    .lex "$/", match
    length rx1327_eos, rx1327_tgt
    gt rx1327_pos, rx1327_eos, rx1327_done
    set rx1327_off, 0
    lt rx1327_pos, 2, rx1327_start
    sub rx1327_off, rx1327_pos, 1
    substr rx1327_tgt, rx1327_tgt, rx1327_off
  rx1327_start:
    eq $I10, 1, rx1327_restart
    if_null rx1327_debug, debug_405
    rx1327_cur."!cursor_debug"("START", "backslash:sym<A>")
  debug_405:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1329_done
    goto rxscan1329_scan
  rxscan1329_loop:
    ($P10) = rx1327_cur."from"()
    inc $P10
    set rx1327_pos, $P10
    ge rx1327_pos, rx1327_eos, rxscan1329_done
  rxscan1329_scan:
    set_addr $I10, rxscan1329_loop
    rx1327_cur."!mark_push"(0, rx1327_pos, $I10)
  rxscan1329_done:
.annotate 'line', 147
  # rx literal  "A"
    add $I11, rx1327_pos, 1
    gt $I11, rx1327_eos, rx1327_fail
    sub $I11, rx1327_pos, rx1327_off
    ord $I11, rx1327_tgt, $I11
    ne $I11, 65, rx1327_fail
    add rx1327_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx1327_cur."!cursor_pos"(rx1327_pos)
    $P10 = rx1327_cur."obs"("\\A as beginning-of-string matcher", "^")
    unless $P10, rx1327_fail
    rx1327_pos = $P10."pos"()
  # rx pass
    rx1327_cur."!cursor_pass"(rx1327_pos, "backslash:sym<A>")
    if_null rx1327_debug, debug_406
    rx1327_cur."!cursor_debug"("PASS", "backslash:sym<A>", " at pos=", rx1327_pos)
  debug_406:
    .return (rx1327_cur)
  rx1327_restart:
.annotate 'line', 3
    if_null rx1327_debug, debug_407
    rx1327_cur."!cursor_debug"("NEXT", "backslash:sym<A>")
  debug_407:
  rx1327_fail:
    (rx1327_rep, rx1327_pos, $I10, $P10) = rx1327_cur."!mark_fail"(0)
    lt rx1327_pos, -1, rx1327_done
    eq rx1327_pos, -1, rx1327_fail
    jump $I10
  rx1327_done:
    rx1327_cur."!cursor_fail"()
    if_null rx1327_debug, debug_408
    rx1327_cur."!cursor_debug"("FAIL", "backslash:sym<A>")
  debug_408:
    .return (rx1327_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<A>"  :subid("128_1309998843.21663") :method
.annotate 'line', 3
    $P100 = self."!PREFIX__!subrule"("obs", "A")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<z>"  :subid("129_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1331_tgt
    .local int rx1331_pos
    .local int rx1331_off
    .local int rx1331_eos
    .local int rx1331_rep
    .local pmc rx1331_cur
    .local pmc rx1331_debug
    (rx1331_cur, rx1331_pos, rx1331_tgt, $I10) = self."!cursor_start"()
    getattribute rx1331_debug, rx1331_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1331_cur
    .local pmc match
    .lex "$/", match
    length rx1331_eos, rx1331_tgt
    gt rx1331_pos, rx1331_eos, rx1331_done
    set rx1331_off, 0
    lt rx1331_pos, 2, rx1331_start
    sub rx1331_off, rx1331_pos, 1
    substr rx1331_tgt, rx1331_tgt, rx1331_off
  rx1331_start:
    eq $I10, 1, rx1331_restart
    if_null rx1331_debug, debug_409
    rx1331_cur."!cursor_debug"("START", "backslash:sym<z>")
  debug_409:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1333_done
    goto rxscan1333_scan
  rxscan1333_loop:
    ($P10) = rx1331_cur."from"()
    inc $P10
    set rx1331_pos, $P10
    ge rx1331_pos, rx1331_eos, rxscan1333_done
  rxscan1333_scan:
    set_addr $I10, rxscan1333_loop
    rx1331_cur."!mark_push"(0, rx1331_pos, $I10)
  rxscan1333_done:
.annotate 'line', 148
  # rx literal  "z"
    add $I11, rx1331_pos, 1
    gt $I11, rx1331_eos, rx1331_fail
    sub $I11, rx1331_pos, rx1331_off
    ord $I11, rx1331_tgt, $I11
    ne $I11, 122, rx1331_fail
    add rx1331_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx1331_cur."!cursor_pos"(rx1331_pos)
    $P10 = rx1331_cur."obs"("\\z as end-of-string matcher", "$")
    unless $P10, rx1331_fail
    rx1331_pos = $P10."pos"()
  # rx pass
    rx1331_cur."!cursor_pass"(rx1331_pos, "backslash:sym<z>")
    if_null rx1331_debug, debug_410
    rx1331_cur."!cursor_debug"("PASS", "backslash:sym<z>", " at pos=", rx1331_pos)
  debug_410:
    .return (rx1331_cur)
  rx1331_restart:
.annotate 'line', 3
    if_null rx1331_debug, debug_411
    rx1331_cur."!cursor_debug"("NEXT", "backslash:sym<z>")
  debug_411:
  rx1331_fail:
    (rx1331_rep, rx1331_pos, $I10, $P10) = rx1331_cur."!mark_fail"(0)
    lt rx1331_pos, -1, rx1331_done
    eq rx1331_pos, -1, rx1331_fail
    jump $I10
  rx1331_done:
    rx1331_cur."!cursor_fail"()
    if_null rx1331_debug, debug_412
    rx1331_cur."!cursor_debug"("FAIL", "backslash:sym<z>")
  debug_412:
    .return (rx1331_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<z>"  :subid("130_1309998843.21663") :method
.annotate 'line', 3
    $P100 = self."!PREFIX__!subrule"("obs", "z")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Z>"  :subid("131_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1335_tgt
    .local int rx1335_pos
    .local int rx1335_off
    .local int rx1335_eos
    .local int rx1335_rep
    .local pmc rx1335_cur
    .local pmc rx1335_debug
    (rx1335_cur, rx1335_pos, rx1335_tgt, $I10) = self."!cursor_start"()
    getattribute rx1335_debug, rx1335_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1335_cur
    .local pmc match
    .lex "$/", match
    length rx1335_eos, rx1335_tgt
    gt rx1335_pos, rx1335_eos, rx1335_done
    set rx1335_off, 0
    lt rx1335_pos, 2, rx1335_start
    sub rx1335_off, rx1335_pos, 1
    substr rx1335_tgt, rx1335_tgt, rx1335_off
  rx1335_start:
    eq $I10, 1, rx1335_restart
    if_null rx1335_debug, debug_413
    rx1335_cur."!cursor_debug"("START", "backslash:sym<Z>")
  debug_413:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1337_done
    goto rxscan1337_scan
  rxscan1337_loop:
    ($P10) = rx1335_cur."from"()
    inc $P10
    set rx1335_pos, $P10
    ge rx1335_pos, rx1335_eos, rxscan1337_done
  rxscan1337_scan:
    set_addr $I10, rxscan1337_loop
    rx1335_cur."!mark_push"(0, rx1335_pos, $I10)
  rxscan1337_done:
.annotate 'line', 149
  # rx literal  "Z"
    add $I11, rx1335_pos, 1
    gt $I11, rx1335_eos, rx1335_fail
    sub $I11, rx1335_pos, rx1335_off
    ord $I11, rx1335_tgt, $I11
    ne $I11, 90, rx1335_fail
    add rx1335_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx1335_cur."!cursor_pos"(rx1335_pos)
    $P10 = rx1335_cur."obs"("\\Z as end-of-string matcher", "\\n?$")
    unless $P10, rx1335_fail
    rx1335_pos = $P10."pos"()
  # rx pass
    rx1335_cur."!cursor_pass"(rx1335_pos, "backslash:sym<Z>")
    if_null rx1335_debug, debug_414
    rx1335_cur."!cursor_debug"("PASS", "backslash:sym<Z>", " at pos=", rx1335_pos)
  debug_414:
    .return (rx1335_cur)
  rx1335_restart:
.annotate 'line', 3
    if_null rx1335_debug, debug_415
    rx1335_cur."!cursor_debug"("NEXT", "backslash:sym<Z>")
  debug_415:
  rx1335_fail:
    (rx1335_rep, rx1335_pos, $I10, $P10) = rx1335_cur."!mark_fail"(0)
    lt rx1335_pos, -1, rx1335_done
    eq rx1335_pos, -1, rx1335_fail
    jump $I10
  rx1335_done:
    rx1335_cur."!cursor_fail"()
    if_null rx1335_debug, debug_416
    rx1335_cur."!cursor_debug"("FAIL", "backslash:sym<Z>")
  debug_416:
    .return (rx1335_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<Z>"  :subid("132_1309998843.21663") :method
.annotate 'line', 3
    $P100 = self."!PREFIX__!subrule"("obs", "Z")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<Q>"  :subid("133_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1339_tgt
    .local int rx1339_pos
    .local int rx1339_off
    .local int rx1339_eos
    .local int rx1339_rep
    .local pmc rx1339_cur
    .local pmc rx1339_debug
    (rx1339_cur, rx1339_pos, rx1339_tgt, $I10) = self."!cursor_start"()
    getattribute rx1339_debug, rx1339_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1339_cur
    .local pmc match
    .lex "$/", match
    length rx1339_eos, rx1339_tgt
    gt rx1339_pos, rx1339_eos, rx1339_done
    set rx1339_off, 0
    lt rx1339_pos, 2, rx1339_start
    sub rx1339_off, rx1339_pos, 1
    substr rx1339_tgt, rx1339_tgt, rx1339_off
  rx1339_start:
    eq $I10, 1, rx1339_restart
    if_null rx1339_debug, debug_417
    rx1339_cur."!cursor_debug"("START", "backslash:sym<Q>")
  debug_417:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1341_done
    goto rxscan1341_scan
  rxscan1341_loop:
    ($P10) = rx1339_cur."from"()
    inc $P10
    set rx1339_pos, $P10
    ge rx1339_pos, rx1339_eos, rxscan1341_done
  rxscan1341_scan:
    set_addr $I10, rxscan1341_loop
    rx1339_cur."!mark_push"(0, rx1339_pos, $I10)
  rxscan1341_done:
.annotate 'line', 150
  # rx literal  "Q"
    add $I11, rx1339_pos, 1
    gt $I11, rx1339_eos, rx1339_fail
    sub $I11, rx1339_pos, rx1339_off
    ord $I11, rx1339_tgt, $I11
    ne $I11, 81, rx1339_fail
    add rx1339_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx1339_cur."!cursor_pos"(rx1339_pos)
    $P10 = rx1339_cur."obs"("\\Q as quotemeta", "quotes or literal variable match")
    unless $P10, rx1339_fail
    rx1339_pos = $P10."pos"()
  # rx pass
    rx1339_cur."!cursor_pass"(rx1339_pos, "backslash:sym<Q>")
    if_null rx1339_debug, debug_418
    rx1339_cur."!cursor_debug"("PASS", "backslash:sym<Q>", " at pos=", rx1339_pos)
  debug_418:
    .return (rx1339_cur)
  rx1339_restart:
.annotate 'line', 3
    if_null rx1339_debug, debug_419
    rx1339_cur."!cursor_debug"("NEXT", "backslash:sym<Q>")
  debug_419:
  rx1339_fail:
    (rx1339_rep, rx1339_pos, $I10, $P10) = rx1339_cur."!mark_fail"(0)
    lt rx1339_pos, -1, rx1339_done
    eq rx1339_pos, -1, rx1339_fail
    jump $I10
  rx1339_done:
    rx1339_cur."!cursor_fail"()
    if_null rx1339_debug, debug_420
    rx1339_cur."!cursor_debug"("FAIL", "backslash:sym<Q>")
  debug_420:
    .return (rx1339_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<Q>"  :subid("134_1309998843.21663") :method
.annotate 'line', 3
    $P100 = self."!PREFIX__!subrule"("obs", "Q")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<unrec>"  :subid("135_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .const 'Sub' $P1347 = "137_1309998843.21663" 
    capture_lex $P1347
    .local string rx1343_tgt
    .local int rx1343_pos
    .local int rx1343_off
    .local int rx1343_eos
    .local int rx1343_rep
    .local pmc rx1343_cur
    .local pmc rx1343_debug
    (rx1343_cur, rx1343_pos, rx1343_tgt, $I10) = self."!cursor_start"()
    getattribute rx1343_debug, rx1343_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1343_cur
    .local pmc match
    .lex "$/", match
    length rx1343_eos, rx1343_tgt
    gt rx1343_pos, rx1343_eos, rx1343_done
    set rx1343_off, 0
    lt rx1343_pos, 2, rx1343_start
    sub rx1343_off, rx1343_pos, 1
    substr rx1343_tgt, rx1343_tgt, rx1343_off
  rx1343_start:
    eq $I10, 1, rx1343_restart
    if_null rx1343_debug, debug_421
    rx1343_cur."!cursor_debug"("START", "backslash:sym<unrec>")
  debug_421:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1345_done
    goto rxscan1345_scan
  rxscan1345_loop:
    ($P10) = rx1343_cur."from"()
    inc $P10
    set rx1343_pos, $P10
    ge rx1343_pos, rx1343_eos, rxscan1345_done
  rxscan1345_scan:
    set_addr $I10, rxscan1345_loop
    rx1343_cur."!mark_push"(0, rx1343_pos, $I10)
  rxscan1345_done:
.annotate 'line', 151
    rx1343_cur."!cursor_pos"(rx1343_pos)
    find_lex $P101, unicode:"$\x{a2}"
    $P102 = $P101."MATCH"()
    store_lex "$/", $P102
    .const 'Sub' $P1347 = "137_1309998843.21663" 
    capture_lex $P1347
    $P103 = $P1347()
  # rx charclass w
    ge rx1343_pos, rx1343_eos, rx1343_fail
    sub $I10, rx1343_pos, rx1343_off
    is_cclass $I11, 8192, rx1343_tgt, $I10
    unless $I11, rx1343_fail
    inc rx1343_pos
  # rx subrule "panic" subtype=method negate=
    rx1343_cur."!cursor_pos"(rx1343_pos)
    $P10 = rx1343_cur."panic"("Unrecognized backslash sequence")
    unless $P10, rx1343_fail
    rx1343_pos = $P10."pos"()
  # rx pass
    rx1343_cur."!cursor_pass"(rx1343_pos, "backslash:sym<unrec>")
    if_null rx1343_debug, debug_422
    rx1343_cur."!cursor_debug"("PASS", "backslash:sym<unrec>", " at pos=", rx1343_pos)
  debug_422:
    .return (rx1343_cur)
  rx1343_restart:
.annotate 'line', 3
    if_null rx1343_debug, debug_423
    rx1343_cur."!cursor_debug"("NEXT", "backslash:sym<unrec>")
  debug_423:
  rx1343_fail:
    (rx1343_rep, rx1343_pos, $I10, $P10) = rx1343_cur."!mark_fail"(0)
    lt rx1343_pos, -1, rx1343_done
    eq rx1343_pos, -1, rx1343_fail
    jump $I10
  rx1343_done:
    rx1343_cur."!cursor_fail"()
    if_null rx1343_debug, debug_424
    rx1343_cur."!cursor_debug"("FAIL", "backslash:sym<unrec>")
  debug_424:
    .return (rx1343_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<unrec>"  :subid("136_1309998843.21663") :method
.annotate 'line', 3
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block1346"  :anon :subid("137_1309998843.21663") :outer("135_1309998843.21663")
.annotate 'line', 151
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "backslash:sym<misc>"  :subid("138_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1349_tgt
    .local int rx1349_pos
    .local int rx1349_off
    .local int rx1349_eos
    .local int rx1349_rep
    .local pmc rx1349_cur
    .local pmc rx1349_debug
    (rx1349_cur, rx1349_pos, rx1349_tgt, $I10) = self."!cursor_start"()
    getattribute rx1349_debug, rx1349_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1349_cur
    .local pmc match
    .lex "$/", match
    length rx1349_eos, rx1349_tgt
    gt rx1349_pos, rx1349_eos, rx1349_done
    set rx1349_off, 0
    lt rx1349_pos, 2, rx1349_start
    sub rx1349_off, rx1349_pos, 1
    substr rx1349_tgt, rx1349_tgt, rx1349_off
  rx1349_start:
    eq $I10, 1, rx1349_restart
    if_null rx1349_debug, debug_425
    rx1349_cur."!cursor_debug"("START", "backslash:sym<misc>")
  debug_425:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1351_done
    goto rxscan1351_scan
  rxscan1351_loop:
    ($P10) = rx1349_cur."from"()
    inc $P10
    set rx1349_pos, $P10
    ge rx1349_pos, rx1349_eos, rxscan1351_done
  rxscan1351_scan:
    set_addr $I10, rxscan1351_loop
    rx1349_cur."!mark_push"(0, rx1349_pos, $I10)
  rxscan1351_done:
.annotate 'line', 152
  # rx charclass W
    ge rx1349_pos, rx1349_eos, rx1349_fail
    sub $I10, rx1349_pos, rx1349_off
    is_cclass $I11, 8192, rx1349_tgt, $I10
    if $I11, rx1349_fail
    inc rx1349_pos
  # rx pass
    rx1349_cur."!cursor_pass"(rx1349_pos, "backslash:sym<misc>")
    if_null rx1349_debug, debug_426
    rx1349_cur."!cursor_debug"("PASS", "backslash:sym<misc>", " at pos=", rx1349_pos)
  debug_426:
    .return (rx1349_cur)
  rx1349_restart:
.annotate 'line', 3
    if_null rx1349_debug, debug_427
    rx1349_cur."!cursor_debug"("NEXT", "backslash:sym<misc>")
  debug_427:
  rx1349_fail:
    (rx1349_rep, rx1349_pos, $I10, $P10) = rx1349_cur."!mark_fail"(0)
    lt rx1349_pos, -1, rx1349_done
    eq rx1349_pos, -1, rx1349_fail
    jump $I10
  rx1349_done:
    rx1349_cur."!cursor_fail"()
    if_null rx1349_debug, debug_428
    rx1349_cur."!cursor_debug"("FAIL", "backslash:sym<misc>")
  debug_428:
    .return (rx1349_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__backslash:sym<misc>"  :subid("139_1309998843.21663") :method
.annotate 'line', 3
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion"  :subid("140_1309998843.21663") :method
.annotate 'line', 154
    $P100 = self."!protoregex"("assertion")
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion"  :subid("141_1309998843.21663") :method
.annotate 'line', 154
    $P101 = self."!PREFIX__!protoregex"("assertion")
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<?>"  :subid("142_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .const 'Sub' $P1360 = "144_1309998843.21663" 
    capture_lex $P1360
    .local string rx1355_tgt
    .local int rx1355_pos
    .local int rx1355_off
    .local int rx1355_eos
    .local int rx1355_rep
    .local pmc rx1355_cur
    .local pmc rx1355_debug
    (rx1355_cur, rx1355_pos, rx1355_tgt, $I10) = self."!cursor_start"()
    getattribute rx1355_debug, rx1355_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1355_cur
    .local pmc match
    .lex "$/", match
    length rx1355_eos, rx1355_tgt
    gt rx1355_pos, rx1355_eos, rx1355_done
    set rx1355_off, 0
    lt rx1355_pos, 2, rx1355_start
    sub rx1355_off, rx1355_pos, 1
    substr rx1355_tgt, rx1355_tgt, rx1355_off
  rx1355_start:
    eq $I10, 1, rx1355_restart
    if_null rx1355_debug, debug_429
    rx1355_cur."!cursor_debug"("START", "assertion:sym<?>")
  debug_429:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1357_done
    goto rxscan1357_scan
  rxscan1357_loop:
    ($P10) = rx1355_cur."from"()
    inc $P10
    set rx1355_pos, $P10
    ge rx1355_pos, rx1355_eos, rxscan1357_done
  rxscan1357_scan:
    set_addr $I10, rxscan1357_loop
    rx1355_cur."!mark_push"(0, rx1355_pos, $I10)
  rxscan1357_done:
.annotate 'line', 156
  # rx literal  "?"
    add $I11, rx1355_pos, 1
    gt $I11, rx1355_eos, rx1355_fail
    sub $I11, rx1355_pos, rx1355_off
    ord $I11, rx1355_tgt, $I11
    ne $I11, 63, rx1355_fail
    add rx1355_pos, 1
  alt1358_0:
    set_addr $I10, alt1358_1
    rx1355_cur."!mark_push"(0, rx1355_pos, $I10)
  # rx subrule "before" subtype=zerowidth negate=
    rx1355_cur."!cursor_pos"(rx1355_pos)
    .const 'Sub' $P1360 = "144_1309998843.21663" 
    capture_lex $P1360
    $P10 = rx1355_cur."before"($P1360)
    unless $P10, rx1355_fail
    goto alt1358_end
  alt1358_1:
  # rx subrule "assertion" subtype=capture negate=
    rx1355_cur."!cursor_pos"(rx1355_pos)
    $P10 = rx1355_cur."assertion"()
    unless $P10, rx1355_fail
    rx1355_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx1355_pos = $P10."pos"()
  alt1358_end:
  # rx pass
    rx1355_cur."!cursor_pass"(rx1355_pos, "assertion:sym<?>")
    if_null rx1355_debug, debug_434
    rx1355_cur."!cursor_debug"("PASS", "assertion:sym<?>", " at pos=", rx1355_pos)
  debug_434:
    .return (rx1355_cur)
  rx1355_restart:
.annotate 'line', 3
    if_null rx1355_debug, debug_435
    rx1355_cur."!cursor_debug"("NEXT", "assertion:sym<?>")
  debug_435:
  rx1355_fail:
    (rx1355_rep, rx1355_pos, $I10, $P10) = rx1355_cur."!mark_fail"(0)
    lt rx1355_pos, -1, rx1355_done
    eq rx1355_pos, -1, rx1355_fail
    jump $I10
  rx1355_done:
    rx1355_cur."!cursor_fail"()
    if_null rx1355_debug, debug_436
    rx1355_cur."!cursor_debug"("FAIL", "assertion:sym<?>")
  debug_436:
    .return (rx1355_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<?>"  :subid("143_1309998843.21663") :method
.annotate 'line', 3
    $P100 = self."!PREFIX__!subrule"("assertion", "?")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    push $P101, "?"
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block1359"  :anon :subid("144_1309998843.21663") :method :outer("142_1309998843.21663")
.annotate 'line', 156
    .local string rx1361_tgt
    .local int rx1361_pos
    .local int rx1361_off
    .local int rx1361_eos
    .local int rx1361_rep
    .local pmc rx1361_cur
    .local pmc rx1361_debug
    (rx1361_cur, rx1361_pos, rx1361_tgt, $I10) = self."!cursor_start"()
    getattribute rx1361_debug, rx1361_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1361_cur
    .local pmc match
    .lex "$/", match
    length rx1361_eos, rx1361_tgt
    gt rx1361_pos, rx1361_eos, rx1361_done
    set rx1361_off, 0
    lt rx1361_pos, 2, rx1361_start
    sub rx1361_off, rx1361_pos, 1
    substr rx1361_tgt, rx1361_tgt, rx1361_off
  rx1361_start:
    eq $I10, 1, rx1361_restart
    if_null rx1361_debug, debug_430
    rx1361_cur."!cursor_debug"("START", "")
  debug_430:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1362_done
    goto rxscan1362_scan
  rxscan1362_loop:
    ($P10) = rx1361_cur."from"()
    inc $P10
    set rx1361_pos, $P10
    ge rx1361_pos, rx1361_eos, rxscan1362_done
  rxscan1362_scan:
    set_addr $I10, rxscan1362_loop
    rx1361_cur."!mark_push"(0, rx1361_pos, $I10)
  rxscan1362_done:
  # rx literal  ">"
    add $I11, rx1361_pos, 1
    gt $I11, rx1361_eos, rx1361_fail
    sub $I11, rx1361_pos, rx1361_off
    ord $I11, rx1361_tgt, $I11
    ne $I11, 62, rx1361_fail
    add rx1361_pos, 1
  # rx pass
    rx1361_cur."!cursor_pass"(rx1361_pos, "")
    if_null rx1361_debug, debug_431
    rx1361_cur."!cursor_debug"("PASS", "", " at pos=", rx1361_pos)
  debug_431:
    .return (rx1361_cur)
  rx1361_restart:
    if_null rx1361_debug, debug_432
    rx1361_cur."!cursor_debug"("NEXT", "")
  debug_432:
  rx1361_fail:
    (rx1361_rep, rx1361_pos, $I10, $P10) = rx1361_cur."!mark_fail"(0)
    lt rx1361_pos, -1, rx1361_done
    eq rx1361_pos, -1, rx1361_fail
    jump $I10
  rx1361_done:
    rx1361_cur."!cursor_fail"()
    if_null rx1361_debug, debug_433
    rx1361_cur."!cursor_debug"("FAIL", "")
  debug_433:
    .return (rx1361_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<!>"  :subid("145_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .const 'Sub' $P1369 = "147_1309998843.21663" 
    capture_lex $P1369
    .local string rx1364_tgt
    .local int rx1364_pos
    .local int rx1364_off
    .local int rx1364_eos
    .local int rx1364_rep
    .local pmc rx1364_cur
    .local pmc rx1364_debug
    (rx1364_cur, rx1364_pos, rx1364_tgt, $I10) = self."!cursor_start"()
    getattribute rx1364_debug, rx1364_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1364_cur
    .local pmc match
    .lex "$/", match
    length rx1364_eos, rx1364_tgt
    gt rx1364_pos, rx1364_eos, rx1364_done
    set rx1364_off, 0
    lt rx1364_pos, 2, rx1364_start
    sub rx1364_off, rx1364_pos, 1
    substr rx1364_tgt, rx1364_tgt, rx1364_off
  rx1364_start:
    eq $I10, 1, rx1364_restart
    if_null rx1364_debug, debug_437
    rx1364_cur."!cursor_debug"("START", "assertion:sym<!>")
  debug_437:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1366_done
    goto rxscan1366_scan
  rxscan1366_loop:
    ($P10) = rx1364_cur."from"()
    inc $P10
    set rx1364_pos, $P10
    ge rx1364_pos, rx1364_eos, rxscan1366_done
  rxscan1366_scan:
    set_addr $I10, rxscan1366_loop
    rx1364_cur."!mark_push"(0, rx1364_pos, $I10)
  rxscan1366_done:
.annotate 'line', 157
  # rx literal  "!"
    add $I11, rx1364_pos, 1
    gt $I11, rx1364_eos, rx1364_fail
    sub $I11, rx1364_pos, rx1364_off
    ord $I11, rx1364_tgt, $I11
    ne $I11, 33, rx1364_fail
    add rx1364_pos, 1
  alt1367_0:
    set_addr $I10, alt1367_1
    rx1364_cur."!mark_push"(0, rx1364_pos, $I10)
  # rx subrule "before" subtype=zerowidth negate=
    rx1364_cur."!cursor_pos"(rx1364_pos)
    .const 'Sub' $P1369 = "147_1309998843.21663" 
    capture_lex $P1369
    $P10 = rx1364_cur."before"($P1369)
    unless $P10, rx1364_fail
    goto alt1367_end
  alt1367_1:
  # rx subrule "assertion" subtype=capture negate=
    rx1364_cur."!cursor_pos"(rx1364_pos)
    $P10 = rx1364_cur."assertion"()
    unless $P10, rx1364_fail
    rx1364_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx1364_pos = $P10."pos"()
  alt1367_end:
  # rx pass
    rx1364_cur."!cursor_pass"(rx1364_pos, "assertion:sym<!>")
    if_null rx1364_debug, debug_442
    rx1364_cur."!cursor_debug"("PASS", "assertion:sym<!>", " at pos=", rx1364_pos)
  debug_442:
    .return (rx1364_cur)
  rx1364_restart:
.annotate 'line', 3
    if_null rx1364_debug, debug_443
    rx1364_cur."!cursor_debug"("NEXT", "assertion:sym<!>")
  debug_443:
  rx1364_fail:
    (rx1364_rep, rx1364_pos, $I10, $P10) = rx1364_cur."!mark_fail"(0)
    lt rx1364_pos, -1, rx1364_done
    eq rx1364_pos, -1, rx1364_fail
    jump $I10
  rx1364_done:
    rx1364_cur."!cursor_fail"()
    if_null rx1364_debug, debug_444
    rx1364_cur."!cursor_debug"("FAIL", "assertion:sym<!>")
  debug_444:
    .return (rx1364_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<!>"  :subid("146_1309998843.21663") :method
.annotate 'line', 3
    $P100 = self."!PREFIX__!subrule"("assertion", "!")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    push $P101, "!"
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block1368"  :anon :subid("147_1309998843.21663") :method :outer("145_1309998843.21663")
.annotate 'line', 157
    .local string rx1370_tgt
    .local int rx1370_pos
    .local int rx1370_off
    .local int rx1370_eos
    .local int rx1370_rep
    .local pmc rx1370_cur
    .local pmc rx1370_debug
    (rx1370_cur, rx1370_pos, rx1370_tgt, $I10) = self."!cursor_start"()
    getattribute rx1370_debug, rx1370_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1370_cur
    .local pmc match
    .lex "$/", match
    length rx1370_eos, rx1370_tgt
    gt rx1370_pos, rx1370_eos, rx1370_done
    set rx1370_off, 0
    lt rx1370_pos, 2, rx1370_start
    sub rx1370_off, rx1370_pos, 1
    substr rx1370_tgt, rx1370_tgt, rx1370_off
  rx1370_start:
    eq $I10, 1, rx1370_restart
    if_null rx1370_debug, debug_438
    rx1370_cur."!cursor_debug"("START", "")
  debug_438:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1371_done
    goto rxscan1371_scan
  rxscan1371_loop:
    ($P10) = rx1370_cur."from"()
    inc $P10
    set rx1370_pos, $P10
    ge rx1370_pos, rx1370_eos, rxscan1371_done
  rxscan1371_scan:
    set_addr $I10, rxscan1371_loop
    rx1370_cur."!mark_push"(0, rx1370_pos, $I10)
  rxscan1371_done:
  # rx literal  ">"
    add $I11, rx1370_pos, 1
    gt $I11, rx1370_eos, rx1370_fail
    sub $I11, rx1370_pos, rx1370_off
    ord $I11, rx1370_tgt, $I11
    ne $I11, 62, rx1370_fail
    add rx1370_pos, 1
  # rx pass
    rx1370_cur."!cursor_pass"(rx1370_pos, "")
    if_null rx1370_debug, debug_439
    rx1370_cur."!cursor_debug"("PASS", "", " at pos=", rx1370_pos)
  debug_439:
    .return (rx1370_cur)
  rx1370_restart:
    if_null rx1370_debug, debug_440
    rx1370_cur."!cursor_debug"("NEXT", "")
  debug_440:
  rx1370_fail:
    (rx1370_rep, rx1370_pos, $I10, $P10) = rx1370_cur."!mark_fail"(0)
    lt rx1370_pos, -1, rx1370_done
    eq rx1370_pos, -1, rx1370_fail
    jump $I10
  rx1370_done:
    rx1370_cur."!cursor_fail"()
    if_null rx1370_debug, debug_441
    rx1370_cur."!cursor_debug"("FAIL", "")
  debug_441:
    .return (rx1370_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<method>"  :subid("148_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1373_tgt
    .local int rx1373_pos
    .local int rx1373_off
    .local int rx1373_eos
    .local int rx1373_rep
    .local pmc rx1373_cur
    .local pmc rx1373_debug
    (rx1373_cur, rx1373_pos, rx1373_tgt, $I10) = self."!cursor_start"()
    getattribute rx1373_debug, rx1373_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1373_cur
    .local pmc match
    .lex "$/", match
    length rx1373_eos, rx1373_tgt
    gt rx1373_pos, rx1373_eos, rx1373_done
    set rx1373_off, 0
    lt rx1373_pos, 2, rx1373_start
    sub rx1373_off, rx1373_pos, 1
    substr rx1373_tgt, rx1373_tgt, rx1373_off
  rx1373_start:
    eq $I10, 1, rx1373_restart
    if_null rx1373_debug, debug_445
    rx1373_cur."!cursor_debug"("START", "assertion:sym<method>")
  debug_445:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1375_done
    goto rxscan1375_scan
  rxscan1375_loop:
    ($P10) = rx1373_cur."from"()
    inc $P10
    set rx1373_pos, $P10
    ge rx1373_pos, rx1373_eos, rxscan1375_done
  rxscan1375_scan:
    set_addr $I10, rxscan1375_loop
    rx1373_cur."!mark_push"(0, rx1373_pos, $I10)
  rxscan1375_done:
.annotate 'line', 160
  # rx literal  "."
    add $I11, rx1373_pos, 1
    gt $I11, rx1373_eos, rx1373_fail
    sub $I11, rx1373_pos, rx1373_off
    ord $I11, rx1373_tgt, $I11
    ne $I11, 46, rx1373_fail
    add rx1373_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx1373_cur."!cursor_pos"(rx1373_pos)
    $P10 = rx1373_cur."assertion"()
    unless $P10, rx1373_fail
    rx1373_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx1373_pos = $P10."pos"()
.annotate 'line', 159
  # rx pass
    rx1373_cur."!cursor_pass"(rx1373_pos, "assertion:sym<method>")
    if_null rx1373_debug, debug_446
    rx1373_cur."!cursor_debug"("PASS", "assertion:sym<method>", " at pos=", rx1373_pos)
  debug_446:
    .return (rx1373_cur)
  rx1373_restart:
.annotate 'line', 3
    if_null rx1373_debug, debug_447
    rx1373_cur."!cursor_debug"("NEXT", "assertion:sym<method>")
  debug_447:
  rx1373_fail:
    (rx1373_rep, rx1373_pos, $I10, $P10) = rx1373_cur."!mark_fail"(0)
    lt rx1373_pos, -1, rx1373_done
    eq rx1373_pos, -1, rx1373_fail
    jump $I10
  rx1373_done:
    rx1373_cur."!cursor_fail"()
    if_null rx1373_debug, debug_448
    rx1373_cur."!cursor_debug"("FAIL", "assertion:sym<method>")
  debug_448:
    .return (rx1373_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<method>"  :subid("149_1309998843.21663") :method
.annotate 'line', 3
    $P100 = self."!PREFIX__!subrule"("assertion", ".")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<name>"  :subid("150_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .const 'Sub' $P1383 = "152_1309998843.21663" 
    capture_lex $P1383
    .local string rx1377_tgt
    .local int rx1377_pos
    .local int rx1377_off
    .local int rx1377_eos
    .local int rx1377_rep
    .local pmc rx1377_cur
    .local pmc rx1377_debug
    (rx1377_cur, rx1377_pos, rx1377_tgt, $I10) = self."!cursor_start"()
    rx1377_cur."!cursor_caparray"("assertion", "arglist", "nibbler")
    getattribute rx1377_debug, rx1377_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1377_cur
    .local pmc match
    .lex "$/", match
    length rx1377_eos, rx1377_tgt
    gt rx1377_pos, rx1377_eos, rx1377_done
    set rx1377_off, 0
    lt rx1377_pos, 2, rx1377_start
    sub rx1377_off, rx1377_pos, 1
    substr rx1377_tgt, rx1377_tgt, rx1377_off
  rx1377_start:
    eq $I10, 1, rx1377_restart
    if_null rx1377_debug, debug_449
    rx1377_cur."!cursor_debug"("START", "assertion:sym<name>")
  debug_449:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1379_done
    goto rxscan1379_scan
  rxscan1379_loop:
    ($P10) = rx1377_cur."from"()
    inc $P10
    set rx1377_pos, $P10
    ge rx1377_pos, rx1377_eos, rxscan1379_done
  rxscan1379_scan:
    set_addr $I10, rxscan1379_loop
    rx1377_cur."!mark_push"(0, rx1377_pos, $I10)
  rxscan1379_done:
.annotate 'line', 164
  # rx subrule "identifier" subtype=capture negate=
    rx1377_cur."!cursor_pos"(rx1377_pos)
    $P10 = rx1377_cur."identifier"()
    unless $P10, rx1377_fail
    rx1377_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    rx1377_pos = $P10."pos"()
.annotate 'line', 171
  # rx rxquantr1380 ** 0..1
    set_addr $I10, rxquantr1380_done
    rx1377_cur."!mark_push"(0, rx1377_pos, $I10)
  rxquantr1380_loop:
  alt1381_0:
.annotate 'line', 165
    set_addr $I10, alt1381_1
    rx1377_cur."!mark_push"(0, rx1377_pos, $I10)
.annotate 'line', 166
  # rx subrule "before" subtype=zerowidth negate=
    rx1377_cur."!cursor_pos"(rx1377_pos)
    .const 'Sub' $P1383 = "152_1309998843.21663" 
    capture_lex $P1383
    $P10 = rx1377_cur."before"($P1383)
    unless $P10, rx1377_fail
    goto alt1381_end
  alt1381_1:
    set_addr $I10, alt1381_2
    rx1377_cur."!mark_push"(0, rx1377_pos, $I10)
.annotate 'line', 167
  # rx literal  "="
    add $I11, rx1377_pos, 1
    gt $I11, rx1377_eos, rx1377_fail
    sub $I11, rx1377_pos, rx1377_off
    ord $I11, rx1377_tgt, $I11
    ne $I11, 61, rx1377_fail
    add rx1377_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx1377_cur."!cursor_pos"(rx1377_pos)
    $P10 = rx1377_cur."assertion"()
    unless $P10, rx1377_fail
    rx1377_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx1377_pos = $P10."pos"()
    goto alt1381_end
  alt1381_2:
    set_addr $I10, alt1381_3
    rx1377_cur."!mark_push"(0, rx1377_pos, $I10)
.annotate 'line', 168
  # rx literal  ":"
    add $I11, rx1377_pos, 1
    gt $I11, rx1377_eos, rx1377_fail
    sub $I11, rx1377_pos, rx1377_off
    ord $I11, rx1377_tgt, $I11
    ne $I11, 58, rx1377_fail
    add rx1377_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx1377_cur."!cursor_pos"(rx1377_pos)
    $P10 = rx1377_cur."arglist"()
    unless $P10, rx1377_fail
    rx1377_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1377_pos = $P10."pos"()
    goto alt1381_end
  alt1381_3:
    set_addr $I10, alt1381_4
    rx1377_cur."!mark_push"(0, rx1377_pos, $I10)
.annotate 'line', 169
  # rx literal  "("
    add $I11, rx1377_pos, 1
    gt $I11, rx1377_eos, rx1377_fail
    sub $I11, rx1377_pos, rx1377_off
    ord $I11, rx1377_tgt, $I11
    ne $I11, 40, rx1377_fail
    add rx1377_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx1377_cur."!cursor_pos"(rx1377_pos)
    $P10 = rx1377_cur."arglist"()
    unless $P10, rx1377_fail
    rx1377_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1377_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1377_pos, 1
    gt $I11, rx1377_eos, rx1377_fail
    sub $I11, rx1377_pos, rx1377_off
    ord $I11, rx1377_tgt, $I11
    ne $I11, 41, rx1377_fail
    add rx1377_pos, 1
    goto alt1381_end
  alt1381_4:
.annotate 'line', 170
  # rx subrule "normspace" subtype=method negate=
    rx1377_cur."!cursor_pos"(rx1377_pos)
    $P10 = rx1377_cur."normspace"()
    unless $P10, rx1377_fail
    rx1377_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx1377_cur."!cursor_pos"(rx1377_pos)
    $P10 = rx1377_cur."nibbler"()
    unless $P10, rx1377_fail
    rx1377_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx1377_pos = $P10."pos"()
  alt1381_end:
.annotate 'line', 171
    set_addr $I10, rxquantr1380_done
    (rx1377_rep) = rx1377_cur."!mark_commit"($I10)
  rxquantr1380_done:
.annotate 'line', 163
  # rx pass
    rx1377_cur."!cursor_pass"(rx1377_pos, "assertion:sym<name>")
    if_null rx1377_debug, debug_454
    rx1377_cur."!cursor_debug"("PASS", "assertion:sym<name>", " at pos=", rx1377_pos)
  debug_454:
    .return (rx1377_cur)
  rx1377_restart:
.annotate 'line', 3
    if_null rx1377_debug, debug_455
    rx1377_cur."!cursor_debug"("NEXT", "assertion:sym<name>")
  debug_455:
  rx1377_fail:
    (rx1377_rep, rx1377_pos, $I10, $P10) = rx1377_cur."!mark_fail"(0)
    lt rx1377_pos, -1, rx1377_done
    eq rx1377_pos, -1, rx1377_fail
    jump $I10
  rx1377_done:
    rx1377_cur."!cursor_fail"()
    if_null rx1377_debug, debug_456
    rx1377_cur."!cursor_debug"("FAIL", "assertion:sym<name>")
  debug_456:
    .return (rx1377_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<name>"  :subid("151_1309998843.21663") :method
.annotate 'line', 3
    $P100 = self."!PREFIX__!subrule"("identifier", "")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block1382"  :anon :subid("152_1309998843.21663") :method :outer("150_1309998843.21663")
.annotate 'line', 166
    .local string rx1384_tgt
    .local int rx1384_pos
    .local int rx1384_off
    .local int rx1384_eos
    .local int rx1384_rep
    .local pmc rx1384_cur
    .local pmc rx1384_debug
    (rx1384_cur, rx1384_pos, rx1384_tgt, $I10) = self."!cursor_start"()
    getattribute rx1384_debug, rx1384_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1384_cur
    .local pmc match
    .lex "$/", match
    length rx1384_eos, rx1384_tgt
    gt rx1384_pos, rx1384_eos, rx1384_done
    set rx1384_off, 0
    lt rx1384_pos, 2, rx1384_start
    sub rx1384_off, rx1384_pos, 1
    substr rx1384_tgt, rx1384_tgt, rx1384_off
  rx1384_start:
    eq $I10, 1, rx1384_restart
    if_null rx1384_debug, debug_450
    rx1384_cur."!cursor_debug"("START", "")
  debug_450:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1385_done
    goto rxscan1385_scan
  rxscan1385_loop:
    ($P10) = rx1384_cur."from"()
    inc $P10
    set rx1384_pos, $P10
    ge rx1384_pos, rx1384_eos, rxscan1385_done
  rxscan1385_scan:
    set_addr $I10, rxscan1385_loop
    rx1384_cur."!mark_push"(0, rx1384_pos, $I10)
  rxscan1385_done:
  # rx literal  ">"
    add $I11, rx1384_pos, 1
    gt $I11, rx1384_eos, rx1384_fail
    sub $I11, rx1384_pos, rx1384_off
    ord $I11, rx1384_tgt, $I11
    ne $I11, 62, rx1384_fail
    add rx1384_pos, 1
  # rx pass
    rx1384_cur."!cursor_pass"(rx1384_pos, "")
    if_null rx1384_debug, debug_451
    rx1384_cur."!cursor_debug"("PASS", "", " at pos=", rx1384_pos)
  debug_451:
    .return (rx1384_cur)
  rx1384_restart:
    if_null rx1384_debug, debug_452
    rx1384_cur."!cursor_debug"("NEXT", "")
  debug_452:
  rx1384_fail:
    (rx1384_rep, rx1384_pos, $I10, $P10) = rx1384_cur."!mark_fail"(0)
    lt rx1384_pos, -1, rx1384_done
    eq rx1384_pos, -1, rx1384_fail
    jump $I10
  rx1384_done:
    rx1384_cur."!cursor_fail"()
    if_null rx1384_debug, debug_453
    rx1384_cur."!cursor_debug"("FAIL", "")
  debug_453:
    .return (rx1384_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "assertion:sym<[>"  :subid("153_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .const 'Sub' $P1391 = "155_1309998843.21663" 
    capture_lex $P1391
    .local string rx1387_tgt
    .local int rx1387_pos
    .local int rx1387_off
    .local int rx1387_eos
    .local int rx1387_rep
    .local pmc rx1387_cur
    .local pmc rx1387_debug
    (rx1387_cur, rx1387_pos, rx1387_tgt, $I10) = self."!cursor_start"()
    rx1387_cur."!cursor_caparray"("cclass_elem")
    getattribute rx1387_debug, rx1387_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1387_cur
    .local pmc match
    .lex "$/", match
    length rx1387_eos, rx1387_tgt
    gt rx1387_pos, rx1387_eos, rx1387_done
    set rx1387_off, 0
    lt rx1387_pos, 2, rx1387_start
    sub rx1387_off, rx1387_pos, 1
    substr rx1387_tgt, rx1387_tgt, rx1387_off
  rx1387_start:
    eq $I10, 1, rx1387_restart
    if_null rx1387_debug, debug_457
    rx1387_cur."!cursor_debug"("START", "assertion:sym<[>")
  debug_457:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1389_done
    goto rxscan1389_scan
  rxscan1389_loop:
    ($P10) = rx1387_cur."from"()
    inc $P10
    set rx1387_pos, $P10
    ge rx1387_pos, rx1387_eos, rxscan1389_done
  rxscan1389_scan:
    set_addr $I10, rxscan1389_loop
    rx1387_cur."!mark_push"(0, rx1387_pos, $I10)
  rxscan1389_done:
.annotate 'line', 174
  # rx subrule "before" subtype=zerowidth negate=
    rx1387_cur."!cursor_pos"(rx1387_pos)
    .const 'Sub' $P1391 = "155_1309998843.21663" 
    capture_lex $P1391
    $P10 = rx1387_cur."before"($P1391)
    unless $P10, rx1387_fail
  # rx rxquantr1395 ** 1..*
    set_addr $I10, rxquantr1395_done
    rx1387_cur."!mark_push"(0, -1, $I10)
  rxquantr1395_loop:
  # rx subrule "cclass_elem" subtype=capture negate=
    rx1387_cur."!cursor_pos"(rx1387_pos)
    $P10 = rx1387_cur."cclass_elem"()
    unless $P10, rx1387_fail
    goto rxsubrule1396_pass
  rxsubrule1396_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx1387_fail
  rxsubrule1396_pass:
    set_addr $I10, rxsubrule1396_back
    rx1387_cur."!mark_push"(0, rx1387_pos, $I10, $P10)
    $P10."!cursor_names"("cclass_elem")
    rx1387_pos = $P10."pos"()
    set_addr $I10, rxquantr1395_done
    (rx1387_rep) = rx1387_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr1395_done
    rx1387_cur."!mark_push"(rx1387_rep, rx1387_pos, $I10)
    goto rxquantr1395_loop
  rxquantr1395_done:
  # rx pass
    rx1387_cur."!cursor_pass"(rx1387_pos, "assertion:sym<[>")
    if_null rx1387_debug, debug_462
    rx1387_cur."!cursor_debug"("PASS", "assertion:sym<[>", " at pos=", rx1387_pos)
  debug_462:
    .return (rx1387_cur)
  rx1387_restart:
.annotate 'line', 3
    if_null rx1387_debug, debug_463
    rx1387_cur."!cursor_debug"("NEXT", "assertion:sym<[>")
  debug_463:
  rx1387_fail:
    (rx1387_rep, rx1387_pos, $I10, $P10) = rx1387_cur."!mark_fail"(0)
    lt rx1387_pos, -1, rx1387_done
    eq rx1387_pos, -1, rx1387_fail
    jump $I10
  rx1387_done:
    rx1387_cur."!cursor_fail"()
    if_null rx1387_debug, debug_464
    rx1387_cur."!cursor_debug"("FAIL", "assertion:sym<[>")
  debug_464:
    .return (rx1387_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__assertion:sym<[>"  :subid("154_1309998843.21663") :method
.annotate 'line', 3
    new $P100, "ResizablePMCArray"
    push $P100, ""
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block1390"  :anon :subid("155_1309998843.21663") :method :outer("153_1309998843.21663")
.annotate 'line', 174
    .local string rx1392_tgt
    .local int rx1392_pos
    .local int rx1392_off
    .local int rx1392_eos
    .local int rx1392_rep
    .local pmc rx1392_cur
    .local pmc rx1392_debug
    (rx1392_cur, rx1392_pos, rx1392_tgt, $I10) = self."!cursor_start"()
    getattribute rx1392_debug, rx1392_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1392_cur
    .local pmc match
    .lex "$/", match
    length rx1392_eos, rx1392_tgt
    gt rx1392_pos, rx1392_eos, rx1392_done
    set rx1392_off, 0
    lt rx1392_pos, 2, rx1392_start
    sub rx1392_off, rx1392_pos, 1
    substr rx1392_tgt, rx1392_tgt, rx1392_off
  rx1392_start:
    eq $I10, 1, rx1392_restart
    if_null rx1392_debug, debug_458
    rx1392_cur."!cursor_debug"("START", "")
  debug_458:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1393_done
    goto rxscan1393_scan
  rxscan1393_loop:
    ($P10) = rx1392_cur."from"()
    inc $P10
    set rx1392_pos, $P10
    ge rx1392_pos, rx1392_eos, rxscan1393_done
  rxscan1393_scan:
    set_addr $I10, rxscan1393_loop
    rx1392_cur."!mark_push"(0, rx1392_pos, $I10)
  rxscan1393_done:
  alt1394_0:
    set_addr $I10, alt1394_1
    rx1392_cur."!mark_push"(0, rx1392_pos, $I10)
  # rx literal  "["
    add $I11, rx1392_pos, 1
    gt $I11, rx1392_eos, rx1392_fail
    sub $I11, rx1392_pos, rx1392_off
    ord $I11, rx1392_tgt, $I11
    ne $I11, 91, rx1392_fail
    add rx1392_pos, 1
    goto alt1394_end
  alt1394_1:
    set_addr $I10, alt1394_2
    rx1392_cur."!mark_push"(0, rx1392_pos, $I10)
  # rx literal  "+"
    add $I11, rx1392_pos, 1
    gt $I11, rx1392_eos, rx1392_fail
    sub $I11, rx1392_pos, rx1392_off
    ord $I11, rx1392_tgt, $I11
    ne $I11, 43, rx1392_fail
    add rx1392_pos, 1
    goto alt1394_end
  alt1394_2:
  # rx literal  "-"
    add $I11, rx1392_pos, 1
    gt $I11, rx1392_eos, rx1392_fail
    sub $I11, rx1392_pos, rx1392_off
    ord $I11, rx1392_tgt, $I11
    ne $I11, 45, rx1392_fail
    add rx1392_pos, 1
  alt1394_end:
  # rx pass
    rx1392_cur."!cursor_pass"(rx1392_pos, "")
    if_null rx1392_debug, debug_459
    rx1392_cur."!cursor_debug"("PASS", "", " at pos=", rx1392_pos)
  debug_459:
    .return (rx1392_cur)
  rx1392_restart:
    if_null rx1392_debug, debug_460
    rx1392_cur."!cursor_debug"("NEXT", "")
  debug_460:
  rx1392_fail:
    (rx1392_rep, rx1392_pos, $I10, $P10) = rx1392_cur."!mark_fail"(0)
    lt rx1392_pos, -1, rx1392_done
    eq rx1392_pos, -1, rx1392_fail
    jump $I10
  rx1392_done:
    rx1392_cur."!cursor_fail"()
    if_null rx1392_debug, debug_461
    rx1392_cur."!cursor_debug"("FAIL", "")
  debug_461:
    .return (rx1392_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "cclass_elem"  :subid("156_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .const 'Sub' $P1408 = "158_1309998843.21663" 
    capture_lex $P1408
    .local string rx1398_tgt
    .local int rx1398_pos
    .local int rx1398_off
    .local int rx1398_eos
    .local int rx1398_rep
    .local pmc rx1398_cur
    .local pmc rx1398_debug
    (rx1398_cur, rx1398_pos, rx1398_tgt, $I10) = self."!cursor_start"()
    rx1398_cur."!cursor_caparray"("charspec")
    getattribute rx1398_debug, rx1398_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1398_cur
    .local pmc match
    .lex "$/", match
    length rx1398_eos, rx1398_tgt
    gt rx1398_pos, rx1398_eos, rx1398_done
    set rx1398_off, 0
    lt rx1398_pos, 2, rx1398_start
    sub rx1398_off, rx1398_pos, 1
    substr rx1398_tgt, rx1398_tgt, rx1398_off
  rx1398_start:
    eq $I10, 1, rx1398_restart
    if_null rx1398_debug, debug_465
    rx1398_cur."!cursor_debug"("START", "cclass_elem")
  debug_465:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1400_done
    goto rxscan1400_scan
  rxscan1400_loop:
    ($P10) = rx1398_cur."from"()
    inc $P10
    set rx1398_pos, $P10
    ge rx1398_pos, rx1398_eos, rxscan1400_done
  rxscan1400_scan:
    set_addr $I10, rxscan1400_loop
    rx1398_cur."!mark_push"(0, rx1398_pos, $I10)
  rxscan1400_done:
.annotate 'line', 177
  # rx subcapture "sign"
    set_addr $I10, rxcap_1402_fail
    rx1398_cur."!mark_push"(0, rx1398_pos, $I10)
  alt1401_0:
    set_addr $I10, alt1401_1
    rx1398_cur."!mark_push"(0, rx1398_pos, $I10)
  # rx literal  "+"
    add $I11, rx1398_pos, 1
    gt $I11, rx1398_eos, rx1398_fail
    sub $I11, rx1398_pos, rx1398_off
    ord $I11, rx1398_tgt, $I11
    ne $I11, 43, rx1398_fail
    add rx1398_pos, 1
    goto alt1401_end
  alt1401_1:
    set_addr $I10, alt1401_2
    rx1398_cur."!mark_push"(0, rx1398_pos, $I10)
  # rx literal  "-"
    add $I11, rx1398_pos, 1
    gt $I11, rx1398_eos, rx1398_fail
    sub $I11, rx1398_pos, rx1398_off
    ord $I11, rx1398_tgt, $I11
    ne $I11, 45, rx1398_fail
    add rx1398_pos, 1
    goto alt1401_end
  alt1401_2:
  alt1401_end:
    set_addr $I10, rxcap_1402_fail
    ($I12, $I11) = rx1398_cur."!mark_peek"($I10)
    rx1398_cur."!cursor_pos"($I11)
    ($P10) = rx1398_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1398_pos, "")
    rx1398_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sign")
    goto rxcap_1402_done
  rxcap_1402_fail:
    goto rx1398_fail
  rxcap_1402_done:
.annotate 'line', 178
  # rx rxquantr1403 ** 0..1
    set_addr $I10, rxquantr1403_done
    rx1398_cur."!mark_push"(0, rx1398_pos, $I10)
  rxquantr1403_loop:
  # rx subrule "normspace" subtype=method negate=
    rx1398_cur."!cursor_pos"(rx1398_pos)
    $P10 = rx1398_cur."normspace"()
    unless $P10, rx1398_fail
    goto rxsubrule1404_pass
  rxsubrule1404_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx1398_fail
  rxsubrule1404_pass:
    set_addr $I10, rxsubrule1404_back
    rx1398_cur."!mark_push"(0, rx1398_pos, $I10, $P10)
    rx1398_pos = $P10."pos"()
    set_addr $I10, rxquantr1403_done
    (rx1398_rep) = rx1398_cur."!mark_commit"($I10)
  rxquantr1403_done:
  alt1405_0:
.annotate 'line', 179
    set_addr $I10, alt1405_1
    rx1398_cur."!mark_push"(0, rx1398_pos, $I10)
.annotate 'line', 180
  # rx literal  "["
    add $I11, rx1398_pos, 1
    gt $I11, rx1398_eos, rx1398_fail
    sub $I11, rx1398_pos, rx1398_off
    ord $I11, rx1398_tgt, $I11
    ne $I11, 91, rx1398_fail
    add rx1398_pos, 1
.annotate 'line', 183
  # rx rxquantr1406 ** 0..*
    set_addr $I10, rxquantr1406_done
    rx1398_cur."!mark_push"(0, rx1398_pos, $I10)
  rxquantr1406_loop:
.annotate 'line', 180
  # rx subrule $P1408 subtype=capture negate=
    rx1398_cur."!cursor_pos"(rx1398_pos)
    .const 'Sub' $P1408 = "158_1309998843.21663" 
    capture_lex $P1408
    $P10 = rx1398_cur.$P1408()
    unless $P10, rx1398_fail
    goto rxsubrule1426_pass
  rxsubrule1426_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx1398_fail
  rxsubrule1426_pass:
    set_addr $I10, rxsubrule1426_back
    rx1398_cur."!mark_push"(0, rx1398_pos, $I10, $P10)
    $P10."!cursor_names"("charspec")
    rx1398_pos = $P10."pos"()
.annotate 'line', 183
    set_addr $I10, rxquantr1406_done
    (rx1398_rep) = rx1398_cur."!mark_commit"($I10)
    set_addr $I10, rxquantr1406_done
    rx1398_cur."!mark_push"(rx1398_rep, rx1398_pos, $I10)
    goto rxquantr1406_loop
  rxquantr1406_done:
.annotate 'line', 184
  # rx charclass_q s r 0..-1
    sub $I10, rx1398_pos, rx1398_off
    find_not_cclass $I11, 32, rx1398_tgt, $I10, rx1398_eos
    add rx1398_pos, rx1398_off, $I11
  # rx literal  "]"
    add $I11, rx1398_pos, 1
    gt $I11, rx1398_eos, rx1398_fail
    sub $I11, rx1398_pos, rx1398_off
    ord $I11, rx1398_tgt, $I11
    ne $I11, 93, rx1398_fail
    add rx1398_pos, 1
.annotate 'line', 180
    goto alt1405_end
  alt1405_1:
.annotate 'line', 185
  # rx subcapture "name"
    set_addr $I10, rxcap_1427_fail
    rx1398_cur."!mark_push"(0, rx1398_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx1398_pos, rx1398_off
    find_not_cclass $I11, 8192, rx1398_tgt, $I10, rx1398_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1398_fail
    add rx1398_pos, rx1398_off, $I11
    set_addr $I10, rxcap_1427_fail
    ($I12, $I11) = rx1398_cur."!mark_peek"($I10)
    rx1398_cur."!cursor_pos"($I11)
    ($P10) = rx1398_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1398_pos, "")
    rx1398_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_1427_done
  rxcap_1427_fail:
    goto rx1398_fail
  rxcap_1427_done:
  alt1405_end:
.annotate 'line', 187
  # rx rxquantr1428 ** 0..1
    set_addr $I10, rxquantr1428_done
    rx1398_cur."!mark_push"(0, rx1398_pos, $I10)
  rxquantr1428_loop:
  # rx subrule "normspace" subtype=method negate=
    rx1398_cur."!cursor_pos"(rx1398_pos)
    $P10 = rx1398_cur."normspace"()
    unless $P10, rx1398_fail
    goto rxsubrule1429_pass
  rxsubrule1429_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx1398_fail
  rxsubrule1429_pass:
    set_addr $I10, rxsubrule1429_back
    rx1398_cur."!mark_push"(0, rx1398_pos, $I10, $P10)
    rx1398_pos = $P10."pos"()
    set_addr $I10, rxquantr1428_done
    (rx1398_rep) = rx1398_cur."!mark_commit"($I10)
  rxquantr1428_done:
.annotate 'line', 176
  # rx pass
    rx1398_cur."!cursor_pass"(rx1398_pos, "cclass_elem")
    if_null rx1398_debug, debug_482
    rx1398_cur."!cursor_debug"("PASS", "cclass_elem", " at pos=", rx1398_pos)
  debug_482:
    .return (rx1398_cur)
  rx1398_restart:
.annotate 'line', 3
    if_null rx1398_debug, debug_483
    rx1398_cur."!cursor_debug"("NEXT", "cclass_elem")
  debug_483:
  rx1398_fail:
    (rx1398_rep, rx1398_pos, $I10, $P10) = rx1398_cur."!mark_fail"(0)
    lt rx1398_pos, -1, rx1398_done
    eq rx1398_pos, -1, rx1398_fail
    jump $I10
  rx1398_done:
    rx1398_cur."!cursor_fail"()
    if_null rx1398_debug, debug_484
    rx1398_cur."!cursor_debug"("FAIL", "cclass_elem")
  debug_484:
    .return (rx1398_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__cclass_elem"  :subid("157_1309998843.21663") :method
.annotate 'line', 3
    new $P100, "ResizablePMCArray"
    push $P100, ""
    push $P100, "-"
    push $P100, "+"
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block1407"  :anon :subid("158_1309998843.21663") :method :outer("156_1309998843.21663")
.annotate 'line', 180
    .const 'Sub' $P1423 = "161_1309998843.21663" 
    capture_lex $P1423
    .const 'Sub' $P1418 = "160_1309998843.21663" 
    capture_lex $P1418
    .const 'Sub' $P1414 = "159_1309998843.21663" 
    capture_lex $P1414
    .local string rx1409_tgt
    .local int rx1409_pos
    .local int rx1409_off
    .local int rx1409_eos
    .local int rx1409_rep
    .local pmc rx1409_cur
    .local pmc rx1409_debug
    (rx1409_cur, rx1409_pos, rx1409_tgt, $I10) = self."!cursor_start"()
    rx1409_cur."!cursor_caparray"("1")
    getattribute rx1409_debug, rx1409_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1409_cur
    .local pmc match
    .lex "$/", match
    length rx1409_eos, rx1409_tgt
    gt rx1409_pos, rx1409_eos, rx1409_done
    set rx1409_off, 0
    lt rx1409_pos, 2, rx1409_start
    sub rx1409_off, rx1409_pos, 1
    substr rx1409_tgt, rx1409_tgt, rx1409_off
  rx1409_start:
    eq $I10, 1, rx1409_restart
    if_null rx1409_debug, debug_466
    rx1409_cur."!cursor_debug"("START", "")
  debug_466:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1410_done
    goto rxscan1410_scan
  rxscan1410_loop:
    ($P10) = rx1409_cur."from"()
    inc $P10
    set rx1409_pos, $P10
    ge rx1409_pos, rx1409_eos, rxscan1410_done
  rxscan1410_scan:
    set_addr $I10, rxscan1410_loop
    rx1409_cur."!mark_push"(0, rx1409_pos, $I10)
  rxscan1410_done:
  alt1411_0:
    set_addr $I10, alt1411_1
    rx1409_cur."!mark_push"(0, rx1409_pos, $I10)
.annotate 'line', 181
  # rx charclass_q s r 0..-1
    sub $I10, rx1409_pos, rx1409_off
    find_not_cclass $I11, 32, rx1409_tgt, $I10, rx1409_eos
    add rx1409_pos, rx1409_off, $I11
  # rx literal  "-"
    add $I11, rx1409_pos, 1
    gt $I11, rx1409_eos, rx1409_fail
    sub $I11, rx1409_pos, rx1409_off
    ord $I11, rx1409_tgt, $I11
    ne $I11, 45, rx1409_fail
    add rx1409_pos, 1
  # rx subrule "obs" subtype=method negate=
    rx1409_cur."!cursor_pos"(rx1409_pos)
    $P10 = rx1409_cur."obs"("- as character range", "..")
    unless $P10, rx1409_fail
    rx1409_pos = $P10."pos"()
    goto alt1411_end
  alt1411_1:
.annotate 'line', 182
  # rx charclass_q s r 0..-1
    sub $I10, rx1409_pos, rx1409_off
    find_not_cclass $I11, 32, rx1409_tgt, $I10, rx1409_eos
    add rx1409_pos, rx1409_off, $I11
  alt1412_0:
    set_addr $I10, alt1412_1
    rx1409_cur."!mark_push"(0, rx1409_pos, $I10)
  # rx literal  "\\"
    add $I11, rx1409_pos, 1
    gt $I11, rx1409_eos, rx1409_fail
    sub $I11, rx1409_pos, rx1409_off
    ord $I11, rx1409_tgt, $I11
    ne $I11, 92, rx1409_fail
    add rx1409_pos, 1
  # rx subrule $P1414 subtype=capture negate=
    rx1409_cur."!cursor_pos"(rx1409_pos)
    .const 'Sub' $P1414 = "159_1309998843.21663" 
    capture_lex $P1414
    $P10 = rx1409_cur.$P1414()
    unless $P10, rx1409_fail
    rx1409_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"(0)
    rx1409_pos = $P10."pos"()
    goto alt1412_end
  alt1412_1:
  # rx subrule $P1418 subtype=capture negate=
    rx1409_cur."!cursor_pos"(rx1409_pos)
    .const 'Sub' $P1418 = "160_1309998843.21663" 
    capture_lex $P1418
    $P10 = rx1409_cur.$P1418()
    unless $P10, rx1409_fail
    rx1409_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"(0)
    rx1409_pos = $P10."pos"()
  alt1412_end:
  # rx rxquantr1421 ** 0..1
    set_addr $I10, rxquantr1421_done
    rx1409_cur."!mark_push"(0, rx1409_pos, $I10)
  rxquantr1421_loop:
  # rx charclass_q s r 0..-1
    sub $I10, rx1409_pos, rx1409_off
    find_not_cclass $I11, 32, rx1409_tgt, $I10, rx1409_eos
    add rx1409_pos, rx1409_off, $I11
  # rx literal  ".."
    add $I11, rx1409_pos, 2
    gt $I11, rx1409_eos, rx1409_fail
    sub $I11, rx1409_pos, rx1409_off
    substr $S10, rx1409_tgt, $I11, 2
    ne $S10, "..", rx1409_fail
    add rx1409_pos, 2
  # rx charclass_q s r 0..-1
    sub $I10, rx1409_pos, rx1409_off
    find_not_cclass $I11, 32, rx1409_tgt, $I10, rx1409_eos
    add rx1409_pos, rx1409_off, $I11
  # rx subrule $P1423 subtype=capture negate=
    rx1409_cur."!cursor_pos"(rx1409_pos)
    .const 'Sub' $P1423 = "161_1309998843.21663" 
    capture_lex $P1423
    $P10 = rx1409_cur.$P1423()
    unless $P10, rx1409_fail
    rx1409_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("1")
    rx1409_pos = $P10."pos"()
    set_addr $I10, rxquantr1421_done
    (rx1409_rep) = rx1409_cur."!mark_commit"($I10)
  rxquantr1421_done:
  alt1411_end:
.annotate 'line', 180
  # rx pass
    rx1409_cur."!cursor_pass"(rx1409_pos, "")
    if_null rx1409_debug, debug_479
    rx1409_cur."!cursor_debug"("PASS", "", " at pos=", rx1409_pos)
  debug_479:
    .return (rx1409_cur)
  rx1409_restart:
    if_null rx1409_debug, debug_480
    rx1409_cur."!cursor_debug"("NEXT", "")
  debug_480:
  rx1409_fail:
    (rx1409_rep, rx1409_pos, $I10, $P10) = rx1409_cur."!mark_fail"(0)
    lt rx1409_pos, -1, rx1409_done
    eq rx1409_pos, -1, rx1409_fail
    jump $I10
  rx1409_done:
    rx1409_cur."!cursor_fail"()
    if_null rx1409_debug, debug_481
    rx1409_cur."!cursor_debug"("FAIL", "")
  debug_481:
    .return (rx1409_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block1413"  :anon :subid("159_1309998843.21663") :method :outer("158_1309998843.21663")
.annotate 'line', 182
    .local string rx1415_tgt
    .local int rx1415_pos
    .local int rx1415_off
    .local int rx1415_eos
    .local int rx1415_rep
    .local pmc rx1415_cur
    .local pmc rx1415_debug
    (rx1415_cur, rx1415_pos, rx1415_tgt, $I10) = self."!cursor_start"()
    getattribute rx1415_debug, rx1415_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1415_cur
    .local pmc match
    .lex "$/", match
    length rx1415_eos, rx1415_tgt
    gt rx1415_pos, rx1415_eos, rx1415_done
    set rx1415_off, 0
    lt rx1415_pos, 2, rx1415_start
    sub rx1415_off, rx1415_pos, 1
    substr rx1415_tgt, rx1415_tgt, rx1415_off
  rx1415_start:
    eq $I10, 1, rx1415_restart
    if_null rx1415_debug, debug_467
    rx1415_cur."!cursor_debug"("START", "")
  debug_467:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1416_done
    goto rxscan1416_scan
  rxscan1416_loop:
    ($P10) = rx1415_cur."from"()
    inc $P10
    set rx1415_pos, $P10
    ge rx1415_pos, rx1415_eos, rxscan1416_done
  rxscan1416_scan:
    set_addr $I10, rxscan1416_loop
    rx1415_cur."!mark_push"(0, rx1415_pos, $I10)
  rxscan1416_done:
  # rx charclass .
    ge rx1415_pos, rx1415_eos, rx1415_fail
    inc rx1415_pos
  # rx pass
    rx1415_cur."!cursor_pass"(rx1415_pos, "")
    if_null rx1415_debug, debug_468
    rx1415_cur."!cursor_debug"("PASS", "", " at pos=", rx1415_pos)
  debug_468:
    .return (rx1415_cur)
  rx1415_restart:
    if_null rx1415_debug, debug_469
    rx1415_cur."!cursor_debug"("NEXT", "")
  debug_469:
  rx1415_fail:
    (rx1415_rep, rx1415_pos, $I10, $P10) = rx1415_cur."!mark_fail"(0)
    lt rx1415_pos, -1, rx1415_done
    eq rx1415_pos, -1, rx1415_fail
    jump $I10
  rx1415_done:
    rx1415_cur."!cursor_fail"()
    if_null rx1415_debug, debug_470
    rx1415_cur."!cursor_debug"("FAIL", "")
  debug_470:
    .return (rx1415_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block1417"  :anon :subid("160_1309998843.21663") :method :outer("158_1309998843.21663")
.annotate 'line', 182
    .local string rx1419_tgt
    .local int rx1419_pos
    .local int rx1419_off
    .local int rx1419_eos
    .local int rx1419_rep
    .local pmc rx1419_cur
    .local pmc rx1419_debug
    (rx1419_cur, rx1419_pos, rx1419_tgt, $I10) = self."!cursor_start"()
    getattribute rx1419_debug, rx1419_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1419_cur
    .local pmc match
    .lex "$/", match
    length rx1419_eos, rx1419_tgt
    gt rx1419_pos, rx1419_eos, rx1419_done
    set rx1419_off, 0
    lt rx1419_pos, 2, rx1419_start
    sub rx1419_off, rx1419_pos, 1
    substr rx1419_tgt, rx1419_tgt, rx1419_off
  rx1419_start:
    eq $I10, 1, rx1419_restart
    if_null rx1419_debug, debug_471
    rx1419_cur."!cursor_debug"("START", "")
  debug_471:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1420_done
    goto rxscan1420_scan
  rxscan1420_loop:
    ($P10) = rx1419_cur."from"()
    inc $P10
    set rx1419_pos, $P10
    ge rx1419_pos, rx1419_eos, rxscan1420_done
  rxscan1420_scan:
    set_addr $I10, rxscan1420_loop
    rx1419_cur."!mark_push"(0, rx1419_pos, $I10)
  rxscan1420_done:
  # rx enumcharlist negate=1 
    ge rx1419_pos, rx1419_eos, rx1419_fail
    sub $I10, rx1419_pos, rx1419_off
    substr $S10, rx1419_tgt, $I10, 1
    index $I11, "]\\", $S10
    ge $I11, 0, rx1419_fail
    inc rx1419_pos
  # rx pass
    rx1419_cur."!cursor_pass"(rx1419_pos, "")
    if_null rx1419_debug, debug_472
    rx1419_cur."!cursor_debug"("PASS", "", " at pos=", rx1419_pos)
  debug_472:
    .return (rx1419_cur)
  rx1419_restart:
    if_null rx1419_debug, debug_473
    rx1419_cur."!cursor_debug"("NEXT", "")
  debug_473:
  rx1419_fail:
    (rx1419_rep, rx1419_pos, $I10, $P10) = rx1419_cur."!mark_fail"(0)
    lt rx1419_pos, -1, rx1419_done
    eq rx1419_pos, -1, rx1419_fail
    jump $I10
  rx1419_done:
    rx1419_cur."!cursor_fail"()
    if_null rx1419_debug, debug_474
    rx1419_cur."!cursor_debug"("FAIL", "")
  debug_474:
    .return (rx1419_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block1422"  :anon :subid("161_1309998843.21663") :method :outer("158_1309998843.21663")
.annotate 'line', 182
    .local string rx1424_tgt
    .local int rx1424_pos
    .local int rx1424_off
    .local int rx1424_eos
    .local int rx1424_rep
    .local pmc rx1424_cur
    .local pmc rx1424_debug
    (rx1424_cur, rx1424_pos, rx1424_tgt, $I10) = self."!cursor_start"()
    getattribute rx1424_debug, rx1424_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1424_cur
    .local pmc match
    .lex "$/", match
    length rx1424_eos, rx1424_tgt
    gt rx1424_pos, rx1424_eos, rx1424_done
    set rx1424_off, 0
    lt rx1424_pos, 2, rx1424_start
    sub rx1424_off, rx1424_pos, 1
    substr rx1424_tgt, rx1424_tgt, rx1424_off
  rx1424_start:
    eq $I10, 1, rx1424_restart
    if_null rx1424_debug, debug_475
    rx1424_cur."!cursor_debug"("START", "")
  debug_475:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1425_done
    goto rxscan1425_scan
  rxscan1425_loop:
    ($P10) = rx1424_cur."from"()
    inc $P10
    set rx1424_pos, $P10
    ge rx1424_pos, rx1424_eos, rxscan1425_done
  rxscan1425_scan:
    set_addr $I10, rxscan1425_loop
    rx1424_cur."!mark_push"(0, rx1424_pos, $I10)
  rxscan1425_done:
  # rx charclass .
    ge rx1424_pos, rx1424_eos, rx1424_fail
    inc rx1424_pos
  # rx pass
    rx1424_cur."!cursor_pass"(rx1424_pos, "")
    if_null rx1424_debug, debug_476
    rx1424_cur."!cursor_debug"("PASS", "", " at pos=", rx1424_pos)
  debug_476:
    .return (rx1424_cur)
  rx1424_restart:
    if_null rx1424_debug, debug_477
    rx1424_cur."!cursor_debug"("NEXT", "")
  debug_477:
  rx1424_fail:
    (rx1424_rep, rx1424_pos, $I10, $P10) = rx1424_cur."!mark_fail"(0)
    lt rx1424_pos, -1, rx1424_done
    eq rx1424_pos, -1, rx1424_fail
    jump $I10
  rx1424_done:
    rx1424_cur."!cursor_fail"()
    if_null rx1424_debug, debug_478
    rx1424_cur."!cursor_debug"("FAIL", "")
  debug_478:
    .return (rx1424_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_internal"  :subid("162_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .const 'Sub' $P1437 = "164_1309998843.21663" 
    capture_lex $P1437
    .local string rx1431_tgt
    .local int rx1431_pos
    .local int rx1431_off
    .local int rx1431_eos
    .local int rx1431_rep
    .local pmc rx1431_cur
    .local pmc rx1431_debug
    (rx1431_cur, rx1431_pos, rx1431_tgt, $I10) = self."!cursor_start"()
    rx1431_cur."!cursor_caparray"("n")
    getattribute rx1431_debug, rx1431_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1431_cur
    .local pmc match
    .lex "$/", match
    length rx1431_eos, rx1431_tgt
    gt rx1431_pos, rx1431_eos, rx1431_done
    set rx1431_off, 0
    lt rx1431_pos, 2, rx1431_start
    sub rx1431_off, rx1431_pos, 1
    substr rx1431_tgt, rx1431_tgt, rx1431_off
  rx1431_start:
    eq $I10, 1, rx1431_restart
    if_null rx1431_debug, debug_485
    rx1431_cur."!cursor_debug"("START", "mod_internal")
  debug_485:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1433_done
    goto rxscan1433_scan
  rxscan1433_loop:
    ($P10) = rx1431_cur."from"()
    inc $P10
    set rx1431_pos, $P10
    ge rx1431_pos, rx1431_eos, rxscan1433_done
  rxscan1433_scan:
    set_addr $I10, rxscan1433_loop
    rx1431_cur."!mark_push"(0, rx1431_pos, $I10)
  rxscan1433_done:
  alt1434_0:
.annotate 'line', 191
    set_addr $I10, alt1434_1
    rx1431_cur."!mark_push"(0, rx1431_pos, $I10)
.annotate 'line', 192
  # rx literal  ":"
    add $I11, rx1431_pos, 1
    gt $I11, rx1431_eos, rx1431_fail
    sub $I11, rx1431_pos, rx1431_off
    ord $I11, rx1431_tgt, $I11
    ne $I11, 58, rx1431_fail
    add rx1431_pos, 1
  # rx rxquantr1435 ** 1..1
    set_addr $I10, rxquantr1435_done
    rx1431_cur."!mark_push"(0, -1, $I10)
  rxquantr1435_loop:
  # rx subrule $P1437 subtype=capture negate=
    rx1431_cur."!cursor_pos"(rx1431_pos)
    .const 'Sub' $P1437 = "164_1309998843.21663" 
    capture_lex $P1437
    $P10 = rx1431_cur.$P1437()
    unless $P10, rx1431_fail
    goto rxsubrule1441_pass
  rxsubrule1441_back:
    $P10 = $P10."!cursor_next"()
    unless $P10, rx1431_fail
  rxsubrule1441_pass:
    set_addr $I10, rxsubrule1441_back
    rx1431_cur."!mark_push"(0, rx1431_pos, $I10, $P10)
    $P10."!cursor_names"("n")
    rx1431_pos = $P10."pos"()
    set_addr $I10, rxquantr1435_done
    (rx1431_rep) = rx1431_cur."!mark_commit"($I10)
  rxquantr1435_done:
  # rx subrule "mod_ident" subtype=capture negate=
    rx1431_cur."!cursor_pos"(rx1431_pos)
    $P10 = rx1431_cur."mod_ident"()
    unless $P10, rx1431_fail
    rx1431_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_ident")
    rx1431_pos = $P10."pos"()
  # rxanchor rwb
    le rx1431_pos, 0, rx1431_fail
    sub $I10, rx1431_pos, rx1431_off
    is_cclass $I11, 8192, rx1431_tgt, $I10
    if $I11, rx1431_fail
    dec $I10
    is_cclass $I11, 8192, rx1431_tgt, $I10
    unless $I11, rx1431_fail
    goto alt1434_end
  alt1434_1:
.annotate 'line', 193
  # rx literal  ":"
    add $I11, rx1431_pos, 1
    gt $I11, rx1431_eos, rx1431_fail
    sub $I11, rx1431_pos, rx1431_off
    ord $I11, rx1431_tgt, $I11
    ne $I11, 58, rx1431_fail
    add rx1431_pos, 1
  # rx subrule "mod_ident" subtype=capture negate=
    rx1431_cur."!cursor_pos"(rx1431_pos)
    $P10 = rx1431_cur."mod_ident"()
    unless $P10, rx1431_fail
    rx1431_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("mod_ident")
    rx1431_pos = $P10."pos"()
  # rx rxquantr1442 ** 0..1
    set_addr $I10, rxquantr1442_done
    rx1431_cur."!mark_push"(0, rx1431_pos, $I10)
  rxquantr1442_loop:
  # rx literal  "("
    add $I11, rx1431_pos, 1
    gt $I11, rx1431_eos, rx1431_fail
    sub $I11, rx1431_pos, rx1431_off
    ord $I11, rx1431_tgt, $I11
    ne $I11, 40, rx1431_fail
    add rx1431_pos, 1
  # rx subcapture "n"
    set_addr $I10, rxcap_1443_fail
    rx1431_cur."!mark_push"(0, rx1431_pos, $I10)
  # rx charclass_q d r 1..-1
    sub $I10, rx1431_pos, rx1431_off
    find_not_cclass $I11, 8, rx1431_tgt, $I10, rx1431_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1431_fail
    add rx1431_pos, rx1431_off, $I11
    set_addr $I10, rxcap_1443_fail
    ($I12, $I11) = rx1431_cur."!mark_peek"($I10)
    rx1431_cur."!cursor_pos"($I11)
    ($P10) = rx1431_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1431_pos, "")
    rx1431_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("n")
    goto rxcap_1443_done
  rxcap_1443_fail:
    goto rx1431_fail
  rxcap_1443_done:
  # rx literal  ")"
    add $I11, rx1431_pos, 1
    gt $I11, rx1431_eos, rx1431_fail
    sub $I11, rx1431_pos, rx1431_off
    ord $I11, rx1431_tgt, $I11
    ne $I11, 41, rx1431_fail
    add rx1431_pos, 1
    set_addr $I10, rxquantr1442_done
    (rx1431_rep) = rx1431_cur."!mark_commit"($I10)
  rxquantr1442_done:
  alt1434_end:
.annotate 'line', 190
  # rx pass
    rx1431_cur."!cursor_pass"(rx1431_pos, "mod_internal")
    if_null rx1431_debug, debug_490
    rx1431_cur."!cursor_debug"("PASS", "mod_internal", " at pos=", rx1431_pos)
  debug_490:
    .return (rx1431_cur)
  rx1431_restart:
.annotate 'line', 3
    if_null rx1431_debug, debug_491
    rx1431_cur."!cursor_debug"("NEXT", "mod_internal")
  debug_491:
  rx1431_fail:
    (rx1431_rep, rx1431_pos, $I10, $P10) = rx1431_cur."!mark_fail"(0)
    lt rx1431_pos, -1, rx1431_done
    eq rx1431_pos, -1, rx1431_fail
    jump $I10
  rx1431_done:
    rx1431_cur."!cursor_fail"()
    if_null rx1431_debug, debug_492
    rx1431_cur."!cursor_debug"("FAIL", "mod_internal")
  debug_492:
    .return (rx1431_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_internal"  :subid("163_1309998843.21663") :method
.annotate 'line', 3
    $P100 = self."!PREFIX__!subrule"("mod_ident", ":")
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    push $P101, ":"
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block1436"  :anon :subid("164_1309998843.21663") :method :outer("162_1309998843.21663")
.annotate 'line', 192
    .local string rx1438_tgt
    .local int rx1438_pos
    .local int rx1438_off
    .local int rx1438_eos
    .local int rx1438_rep
    .local pmc rx1438_cur
    .local pmc rx1438_debug
    (rx1438_cur, rx1438_pos, rx1438_tgt, $I10) = self."!cursor_start"()
    getattribute rx1438_debug, rx1438_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1438_cur
    .local pmc match
    .lex "$/", match
    length rx1438_eos, rx1438_tgt
    gt rx1438_pos, rx1438_eos, rx1438_done
    set rx1438_off, 0
    lt rx1438_pos, 2, rx1438_start
    sub rx1438_off, rx1438_pos, 1
    substr rx1438_tgt, rx1438_tgt, rx1438_off
  rx1438_start:
    eq $I10, 1, rx1438_restart
    if_null rx1438_debug, debug_486
    rx1438_cur."!cursor_debug"("START", "")
  debug_486:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1439_done
    goto rxscan1439_scan
  rxscan1439_loop:
    ($P10) = rx1438_cur."from"()
    inc $P10
    set rx1438_pos, $P10
    ge rx1438_pos, rx1438_eos, rxscan1439_done
  rxscan1439_scan:
    set_addr $I10, rxscan1439_loop
    rx1438_cur."!mark_push"(0, rx1438_pos, $I10)
  rxscan1439_done:
  alt1440_0:
    set_addr $I10, alt1440_1
    rx1438_cur."!mark_push"(0, rx1438_pos, $I10)
  # rx literal  "!"
    add $I11, rx1438_pos, 1
    gt $I11, rx1438_eos, rx1438_fail
    sub $I11, rx1438_pos, rx1438_off
    ord $I11, rx1438_tgt, $I11
    ne $I11, 33, rx1438_fail
    add rx1438_pos, 1
    goto alt1440_end
  alt1440_1:
  # rx charclass_q d r 1..-1
    sub $I10, rx1438_pos, rx1438_off
    find_not_cclass $I11, 8, rx1438_tgt, $I10, rx1438_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1438_fail
    add rx1438_pos, rx1438_off, $I11
  alt1440_end:
  # rx pass
    rx1438_cur."!cursor_pass"(rx1438_pos, "")
    if_null rx1438_debug, debug_487
    rx1438_cur."!cursor_debug"("PASS", "", " at pos=", rx1438_pos)
  debug_487:
    .return (rx1438_cur)
  rx1438_restart:
    if_null rx1438_debug, debug_488
    rx1438_cur."!cursor_debug"("NEXT", "")
  debug_488:
  rx1438_fail:
    (rx1438_rep, rx1438_pos, $I10, $P10) = rx1438_cur."!mark_fail"(0)
    lt rx1438_pos, -1, rx1438_done
    eq rx1438_pos, -1, rx1438_fail
    jump $I10
  rx1438_done:
    rx1438_cur."!cursor_fail"()
    if_null rx1438_debug, debug_489
    rx1438_cur."!cursor_debug"("FAIL", "")
  debug_489:
    .return (rx1438_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident"  :subid("165_1309998843.21663") :method
.annotate 'line', 197
    $P100 = self."!protoregex"("mod_ident")
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident"  :subid("166_1309998843.21663") :method
.annotate 'line', 197
    $P101 = self."!PREFIX__!protoregex"("mod_ident")
    .return ($P101)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ignorecase>"  :subid("167_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1447_tgt
    .local int rx1447_pos
    .local int rx1447_off
    .local int rx1447_eos
    .local int rx1447_rep
    .local pmc rx1447_cur
    .local pmc rx1447_debug
    (rx1447_cur, rx1447_pos, rx1447_tgt, $I10) = self."!cursor_start"()
    getattribute rx1447_debug, rx1447_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1447_cur
    .local pmc match
    .lex "$/", match
    length rx1447_eos, rx1447_tgt
    gt rx1447_pos, rx1447_eos, rx1447_done
    set rx1447_off, 0
    lt rx1447_pos, 2, rx1447_start
    sub rx1447_off, rx1447_pos, 1
    substr rx1447_tgt, rx1447_tgt, rx1447_off
  rx1447_start:
    eq $I10, 1, rx1447_restart
    if_null rx1447_debug, debug_493
    rx1447_cur."!cursor_debug"("START", "mod_ident:sym<ignorecase>")
  debug_493:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1449_done
    goto rxscan1449_scan
  rxscan1449_loop:
    ($P10) = rx1447_cur."from"()
    inc $P10
    set rx1447_pos, $P10
    ge rx1447_pos, rx1447_eos, rxscan1449_done
  rxscan1449_scan:
    set_addr $I10, rxscan1449_loop
    rx1447_cur."!mark_push"(0, rx1447_pos, $I10)
  rxscan1449_done:
.annotate 'line', 198
  # rx subcapture "sym"
    set_addr $I10, rxcap_1450_fail
    rx1447_cur."!mark_push"(0, rx1447_pos, $I10)
  # rx literal  "i"
    add $I11, rx1447_pos, 1
    gt $I11, rx1447_eos, rx1447_fail
    sub $I11, rx1447_pos, rx1447_off
    ord $I11, rx1447_tgt, $I11
    ne $I11, 105, rx1447_fail
    add rx1447_pos, 1
    set_addr $I10, rxcap_1450_fail
    ($I12, $I11) = rx1447_cur."!mark_peek"($I10)
    rx1447_cur."!cursor_pos"($I11)
    ($P10) = rx1447_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1447_pos, "")
    rx1447_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1450_done
  rxcap_1450_fail:
    goto rx1447_fail
  rxcap_1450_done:
  # rx rxquantr1451 ** 0..1
    set_addr $I10, rxquantr1451_done
    rx1447_cur."!mark_push"(0, rx1447_pos, $I10)
  rxquantr1451_loop:
  # rx literal  "gnorecase"
    add $I11, rx1447_pos, 9
    gt $I11, rx1447_eos, rx1447_fail
    sub $I11, rx1447_pos, rx1447_off
    substr $S10, rx1447_tgt, $I11, 9
    ne $S10, "gnorecase", rx1447_fail
    add rx1447_pos, 9
    set_addr $I10, rxquantr1451_done
    (rx1447_rep) = rx1447_cur."!mark_commit"($I10)
  rxquantr1451_done:
  # rx pass
    rx1447_cur."!cursor_pass"(rx1447_pos, "mod_ident:sym<ignorecase>")
    if_null rx1447_debug, debug_494
    rx1447_cur."!cursor_debug"("PASS", "mod_ident:sym<ignorecase>", " at pos=", rx1447_pos)
  debug_494:
    .return (rx1447_cur)
  rx1447_restart:
.annotate 'line', 3
    if_null rx1447_debug, debug_495
    rx1447_cur."!cursor_debug"("NEXT", "mod_ident:sym<ignorecase>")
  debug_495:
  rx1447_fail:
    (rx1447_rep, rx1447_pos, $I10, $P10) = rx1447_cur."!mark_fail"(0)
    lt rx1447_pos, -1, rx1447_done
    eq rx1447_pos, -1, rx1447_fail
    jump $I10
  rx1447_done:
    rx1447_cur."!cursor_fail"()
    if_null rx1447_debug, debug_496
    rx1447_cur."!cursor_debug"("FAIL", "mod_ident:sym<ignorecase>")
  debug_496:
    .return (rx1447_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident:sym<ignorecase>"  :subid("168_1309998843.21663") :method
.annotate 'line', 3
    new $P100, "ResizablePMCArray"
    push $P100, "i"
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<ratchet>"  :subid("169_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1453_tgt
    .local int rx1453_pos
    .local int rx1453_off
    .local int rx1453_eos
    .local int rx1453_rep
    .local pmc rx1453_cur
    .local pmc rx1453_debug
    (rx1453_cur, rx1453_pos, rx1453_tgt, $I10) = self."!cursor_start"()
    getattribute rx1453_debug, rx1453_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1453_cur
    .local pmc match
    .lex "$/", match
    length rx1453_eos, rx1453_tgt
    gt rx1453_pos, rx1453_eos, rx1453_done
    set rx1453_off, 0
    lt rx1453_pos, 2, rx1453_start
    sub rx1453_off, rx1453_pos, 1
    substr rx1453_tgt, rx1453_tgt, rx1453_off
  rx1453_start:
    eq $I10, 1, rx1453_restart
    if_null rx1453_debug, debug_497
    rx1453_cur."!cursor_debug"("START", "mod_ident:sym<ratchet>")
  debug_497:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1455_done
    goto rxscan1455_scan
  rxscan1455_loop:
    ($P10) = rx1453_cur."from"()
    inc $P10
    set rx1453_pos, $P10
    ge rx1453_pos, rx1453_eos, rxscan1455_done
  rxscan1455_scan:
    set_addr $I10, rxscan1455_loop
    rx1453_cur."!mark_push"(0, rx1453_pos, $I10)
  rxscan1455_done:
.annotate 'line', 199
  # rx subcapture "sym"
    set_addr $I10, rxcap_1456_fail
    rx1453_cur."!mark_push"(0, rx1453_pos, $I10)
  # rx literal  "r"
    add $I11, rx1453_pos, 1
    gt $I11, rx1453_eos, rx1453_fail
    sub $I11, rx1453_pos, rx1453_off
    ord $I11, rx1453_tgt, $I11
    ne $I11, 114, rx1453_fail
    add rx1453_pos, 1
    set_addr $I10, rxcap_1456_fail
    ($I12, $I11) = rx1453_cur."!mark_peek"($I10)
    rx1453_cur."!cursor_pos"($I11)
    ($P10) = rx1453_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1453_pos, "")
    rx1453_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1456_done
  rxcap_1456_fail:
    goto rx1453_fail
  rxcap_1456_done:
  # rx rxquantr1457 ** 0..1
    set_addr $I10, rxquantr1457_done
    rx1453_cur."!mark_push"(0, rx1453_pos, $I10)
  rxquantr1457_loop:
  # rx literal  "atchet"
    add $I11, rx1453_pos, 6
    gt $I11, rx1453_eos, rx1453_fail
    sub $I11, rx1453_pos, rx1453_off
    substr $S10, rx1453_tgt, $I11, 6
    ne $S10, "atchet", rx1453_fail
    add rx1453_pos, 6
    set_addr $I10, rxquantr1457_done
    (rx1453_rep) = rx1453_cur."!mark_commit"($I10)
  rxquantr1457_done:
  # rx pass
    rx1453_cur."!cursor_pass"(rx1453_pos, "mod_ident:sym<ratchet>")
    if_null rx1453_debug, debug_498
    rx1453_cur."!cursor_debug"("PASS", "mod_ident:sym<ratchet>", " at pos=", rx1453_pos)
  debug_498:
    .return (rx1453_cur)
  rx1453_restart:
.annotate 'line', 3
    if_null rx1453_debug, debug_499
    rx1453_cur."!cursor_debug"("NEXT", "mod_ident:sym<ratchet>")
  debug_499:
  rx1453_fail:
    (rx1453_rep, rx1453_pos, $I10, $P10) = rx1453_cur."!mark_fail"(0)
    lt rx1453_pos, -1, rx1453_done
    eq rx1453_pos, -1, rx1453_fail
    jump $I10
  rx1453_done:
    rx1453_cur."!cursor_fail"()
    if_null rx1453_debug, debug_500
    rx1453_cur."!cursor_debug"("FAIL", "mod_ident:sym<ratchet>")
  debug_500:
    .return (rx1453_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident:sym<ratchet>"  :subid("170_1309998843.21663") :method
.annotate 'line', 3
    new $P100, "ResizablePMCArray"
    push $P100, "r"
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "mod_ident:sym<sigspace>"  :subid("171_1309998843.21663") :method :outer("11_1309998843.21663")
.annotate 'line', 3
    .local string rx1459_tgt
    .local int rx1459_pos
    .local int rx1459_off
    .local int rx1459_eos
    .local int rx1459_rep
    .local pmc rx1459_cur
    .local pmc rx1459_debug
    (rx1459_cur, rx1459_pos, rx1459_tgt, $I10) = self."!cursor_start"()
    getattribute rx1459_debug, rx1459_cur, "$!debug"
    .lex unicode:"$\x{a2}", rx1459_cur
    .local pmc match
    .lex "$/", match
    length rx1459_eos, rx1459_tgt
    gt rx1459_pos, rx1459_eos, rx1459_done
    set rx1459_off, 0
    lt rx1459_pos, 2, rx1459_start
    sub rx1459_off, rx1459_pos, 1
    substr rx1459_tgt, rx1459_tgt, rx1459_off
  rx1459_start:
    eq $I10, 1, rx1459_restart
    if_null rx1459_debug, debug_501
    rx1459_cur."!cursor_debug"("START", "mod_ident:sym<sigspace>")
  debug_501:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1461_done
    goto rxscan1461_scan
  rxscan1461_loop:
    ($P10) = rx1459_cur."from"()
    inc $P10
    set rx1459_pos, $P10
    ge rx1459_pos, rx1459_eos, rxscan1461_done
  rxscan1461_scan:
    set_addr $I10, rxscan1461_loop
    rx1459_cur."!mark_push"(0, rx1459_pos, $I10)
  rxscan1461_done:
.annotate 'line', 200
  # rx subcapture "sym"
    set_addr $I10, rxcap_1462_fail
    rx1459_cur."!mark_push"(0, rx1459_pos, $I10)
  # rx literal  "s"
    add $I11, rx1459_pos, 1
    gt $I11, rx1459_eos, rx1459_fail
    sub $I11, rx1459_pos, rx1459_off
    ord $I11, rx1459_tgt, $I11
    ne $I11, 115, rx1459_fail
    add rx1459_pos, 1
    set_addr $I10, rxcap_1462_fail
    ($I12, $I11) = rx1459_cur."!mark_peek"($I10)
    rx1459_cur."!cursor_pos"($I11)
    ($P10) = rx1459_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1459_pos, "")
    rx1459_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1462_done
  rxcap_1462_fail:
    goto rx1459_fail
  rxcap_1462_done:
  # rx rxquantr1463 ** 0..1
    set_addr $I10, rxquantr1463_done
    rx1459_cur."!mark_push"(0, rx1459_pos, $I10)
  rxquantr1463_loop:
  # rx literal  "igspace"
    add $I11, rx1459_pos, 7
    gt $I11, rx1459_eos, rx1459_fail
    sub $I11, rx1459_pos, rx1459_off
    substr $S10, rx1459_tgt, $I11, 7
    ne $S10, "igspace", rx1459_fail
    add rx1459_pos, 7
    set_addr $I10, rxquantr1463_done
    (rx1459_rep) = rx1459_cur."!mark_commit"($I10)
  rxquantr1463_done:
  # rx pass
    rx1459_cur."!cursor_pass"(rx1459_pos, "mod_ident:sym<sigspace>")
    if_null rx1459_debug, debug_502
    rx1459_cur."!cursor_debug"("PASS", "mod_ident:sym<sigspace>", " at pos=", rx1459_pos)
  debug_502:
    .return (rx1459_cur)
  rx1459_restart:
.annotate 'line', 3
    if_null rx1459_debug, debug_503
    rx1459_cur."!cursor_debug"("NEXT", "mod_ident:sym<sigspace>")
  debug_503:
  rx1459_fail:
    (rx1459_rep, rx1459_pos, $I10, $P10) = rx1459_cur."!mark_fail"(0)
    lt rx1459_pos, -1, rx1459_done
    eq rx1459_pos, -1, rx1459_fail
    jump $I10
  rx1459_done:
    rx1459_cur."!cursor_fail"()
    if_null rx1459_debug, debug_504
    rx1459_cur."!cursor_debug"("FAIL", "mod_ident:sym<sigspace>")
  debug_504:
    .return (rx1459_cur)
    .return ()
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "!PREFIX__mod_ident:sym<sigspace>"  :subid("172_1309998843.21663") :method
.annotate 'line', 3
    new $P100, "ResizablePMCArray"
    push $P100, "s"
    .return ($P100)
.end


.namespace ["Regex";"P6Regex";"Grammar"]
.sub "_block1464" :load :anon :subid("173_1309998843.21663")
.annotate 'line', 3
    .const 'Sub' $P1466 = "11_1309998843.21663" 
    $P100 = $P1466()
    .return ($P100)
.end


.namespace []
.sub "_block1467" :load :anon :subid("174_1309998843.21663")
.annotate 'line', 1
    .const 'Sub' $P1469 = "10_1309998843.21663" 
    $P100 = $P1469()
    .return ($P100)
.end

### .include 'gen/p6regex-actions.pir'

.namespace []
.sub "_block1000"  :anon :subid("10_1309998845.12722")
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1309998845.12722" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 4
    .const 'Sub' $P1003 = "11_1309998845.12722" 
    capture_lex $P1003
    $P110 = $P1003()
.annotate 'line', 1
    .return ($P110)
    .const 'Sub' $P1651 = "94_1309998845.12722" 
    .return ($P1651)
.end


.namespace []
.sub "" :load :init :subid("post95") :outer("10_1309998845.12722")
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1309998845.12722" 
    .local pmc block
    set block, $P1001
    $P1653 = get_root_global ["parrot"], "P6metaclass"
    $P1653."new_class"("Regex::P6Regex::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1002"  :subid("11_1309998845.12722") :outer("10_1309998845.12722")
.annotate 'line', 4
    .const 'Sub' $P1638 = "92_1309998845.12722" 
    capture_lex $P1638
    .const 'Sub' $P1632 = "91_1309998845.12722" 
    capture_lex $P1632
    .const 'Sub' $P1616 = "90_1309998845.12722" 
    capture_lex $P1616
    .const 'Sub' $P1586 = "86_1309998845.12722" 
    capture_lex $P1586
    .const 'Sub' $P1568 = "84_1309998845.12722" 
    capture_lex $P1568
    .const 'Sub' $P1540 = "81_1309998845.12722" 
    capture_lex $P1540
    .const 'Sub' $P1534 = "80_1309998845.12722" 
    capture_lex $P1534
    .const 'Sub' $P1526 = "79_1309998845.12722" 
    capture_lex $P1526
    .const 'Sub' $P1518 = "78_1309998845.12722" 
    capture_lex $P1518
    .const 'Sub' $P1513 = "77_1309998845.12722" 
    capture_lex $P1513
    .const 'Sub' $P1508 = "76_1309998845.12722" 
    capture_lex $P1508
    .const 'Sub' $P1497 = "75_1309998845.12722" 
    capture_lex $P1497
    .const 'Sub' $P1486 = "74_1309998845.12722" 
    capture_lex $P1486
    .const 'Sub' $P1480 = "73_1309998845.12722" 
    capture_lex $P1480
    .const 'Sub' $P1474 = "72_1309998845.12722" 
    capture_lex $P1474
    .const 'Sub' $P1468 = "71_1309998845.12722" 
    capture_lex $P1468
    .const 'Sub' $P1462 = "70_1309998845.12722" 
    capture_lex $P1462
    .const 'Sub' $P1456 = "69_1309998845.12722" 
    capture_lex $P1456
    .const 'Sub' $P1450 = "68_1309998845.12722" 
    capture_lex $P1450
    .const 'Sub' $P1444 = "67_1309998845.12722" 
    capture_lex $P1444
    .const 'Sub' $P1435 = "66_1309998845.12722" 
    capture_lex $P1435
    .const 'Sub' $P1430 = "65_1309998845.12722" 
    capture_lex $P1430
    .const 'Sub' $P1411 = "64_1309998845.12722" 
    capture_lex $P1411
    .const 'Sub' $P1402 = "63_1309998845.12722" 
    capture_lex $P1402
    .const 'Sub' $P1395 = "62_1309998845.12722" 
    capture_lex $P1395
    .const 'Sub' $P1390 = "61_1309998845.12722" 
    capture_lex $P1390
    .const 'Sub' $P1385 = "60_1309998845.12722" 
    capture_lex $P1385
    .const 'Sub' $P1380 = "59_1309998845.12722" 
    capture_lex $P1380
    .const 'Sub' $P1375 = "58_1309998845.12722" 
    capture_lex $P1375
    .const 'Sub' $P1370 = "57_1309998845.12722" 
    capture_lex $P1370
    .const 'Sub' $P1365 = "56_1309998845.12722" 
    capture_lex $P1365
    .const 'Sub' $P1360 = "55_1309998845.12722" 
    capture_lex $P1360
    .const 'Sub' $P1355 = "54_1309998845.12722" 
    capture_lex $P1355
    .const 'Sub' $P1350 = "53_1309998845.12722" 
    capture_lex $P1350
    .const 'Sub' $P1345 = "52_1309998845.12722" 
    capture_lex $P1345
    .const 'Sub' $P1340 = "51_1309998845.12722" 
    capture_lex $P1340
    .const 'Sub' $P1329 = "50_1309998845.12722" 
    capture_lex $P1329
    .const 'Sub' $P1318 = "49_1309998845.12722" 
    capture_lex $P1318
    .const 'Sub' $P1311 = "48_1309998845.12722" 
    capture_lex $P1311
    .const 'Sub' $P1306 = "47_1309998845.12722" 
    capture_lex $P1306
    .const 'Sub' $P1298 = "46_1309998845.12722" 
    capture_lex $P1298
    .const 'Sub' $P1270 = "44_1309998845.12722" 
    capture_lex $P1270
    .const 'Sub' $P1264 = "43_1309998845.12722" 
    capture_lex $P1264
    .const 'Sub' $P1258 = "42_1309998845.12722" 
    capture_lex $P1258
    .const 'Sub' $P1252 = "41_1309998845.12722" 
    capture_lex $P1252
    .const 'Sub' $P1241 = "40_1309998845.12722" 
    capture_lex $P1241
    .const 'Sub' $P1217 = "38_1309998845.12722" 
    capture_lex $P1217
    .const 'Sub' $P1194 = "36_1309998845.12722" 
    capture_lex $P1194
    .const 'Sub' $P1180 = "34_1309998845.12722" 
    capture_lex $P1180
    .const 'Sub' $P1157 = "31_1309998845.12722" 
    capture_lex $P1157
    .const 'Sub' $P1151 = "30_1309998845.12722" 
    capture_lex $P1151
    .const 'Sub' $P1141 = "28_1309998845.12722" 
    capture_lex $P1141
    .const 'Sub' $P1133 = "27_1309998845.12722" 
    capture_lex $P1133
    .const 'Sub' $P1122 = "26_1309998845.12722" 
    capture_lex $P1122
    .const 'Sub' $P1021 = "13_1309998845.12722" 
    capture_lex $P1021
    .const 'Sub' $P1006 = "12_1309998845.12722" 
    capture_lex $P1006
    get_global $P1004, "@MODIFIERS"
    unless_null $P1004, vivify_97
    $P1004 = root_new ['parrot';'ResizablePMCArray']
    set_global "@MODIFIERS", $P1004
  vivify_97:
.annotate 'line', 506
    .const 'Sub' $P1006 = "12_1309998845.12722" 
    newclosure $P1019, $P1006
    set $P1005, $P1019
    .lex "buildsub", $P1005
.annotate 'line', 524
    .const 'Sub' $P1021 = "13_1309998845.12722" 
    newclosure $P1120, $P1021
    set $P1020, $P1120
    .lex "capnames", $P1020
.annotate 'line', 590
    .const 'Sub' $P1122 = "26_1309998845.12722" 
    newclosure $P1132, $P1122
    set $P1121, $P1132
    .lex "backmod", $P1121
.annotate 'line', 4
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    get_global $P109, "@MODIFIERS"
    find_lex $P109, "buildsub"
    find_lex $P109, "capnames"
    find_lex $P109, "backmod"
.annotate 'line', 603
    .const 'Sub' $P1638 = "92_1309998845.12722" 
    newclosure $P1645, $P1638
.annotate 'line', 4
    .return ($P1645)
    .const 'Sub' $P1647 = "93_1309998845.12722" 
    .return ($P1647)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "" :load :init :subid("post96") :outer("11_1309998845.12722")
.annotate 'line', 4
    .const 'Sub' $P1003 = "11_1309998845.12722" 
    .local pmc block
    set block, $P1003
.annotate 'line', 7

        $P1649 = new ['ResizablePMCArray']
        $P0 = new ['Hash']
        push $P1649, $P0
    
    set_global "@MODIFIERS", $P1649
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "buildsub"  :subid("12_1309998845.12722") :outer("11_1309998845.12722")
    .param pmc param_1009
    .param pmc param_1010 :optional
    .param int has_param_1010 :opt_flag
.annotate 'line', 506
    new $P1008, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1008, control_1007
    push_eh $P1008
    .lex "$rpast", param_1009
    if has_param_1010, optparam_98
    get_hll_global $P100, ["PAST"], "Block"
    $P101 = $P100."new"()
    set param_1010, $P101
  optparam_98:
    .lex "$block", param_1010
.annotate 'line', 507
    $P1012 = root_new ['parrot';'Hash']
    set $P1011, $P1012
    .lex "%capnames", $P1011
    find_lex $P102, "$rpast"
    $P103 = "capnames"($P102, 0)
    store_lex "%capnames", $P103
.annotate 'line', 508
    new $P102, "Integer"
    assign $P102, 0
    find_lex $P1013, "%capnames"
    unless_null $P1013, vivify_99
    $P1013 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P1013
  vivify_99:
    set $P1013[""], $P102
.annotate 'line', 509
    get_hll_global $P102, ["PAST"], "Regex"
.annotate 'line', 510
    get_hll_global $P103, ["PAST"], "Regex"
    $P104 = $P103."new"("scan" :named("pasttype"))
    find_lex $P105, "$rpast"
.annotate 'line', 512
    get_hll_global $P106, ["PAST"], "Regex"
.annotate 'line', 513
    get_global $P1015, "@MODIFIERS"
    unless_null $P1015, vivify_100
    $P1015 = root_new ['parrot';'ResizablePMCArray']
  vivify_100:
    set $P1016, $P1015[0]
    unless_null $P1016, vivify_101
    $P1016 = root_new ['parrot';'Hash']
  vivify_101:
    set $P108, $P1016["r"]
    unless_null $P108, vivify_102
    new $P108, "Undef"
  vivify_102:
    if $P108, if_1014
    new $P110, "String"
    assign $P110, "g"
    set $P107, $P110
    goto if_1014_end
  if_1014:
    new $P109, "String"
    assign $P109, "r"
    set $P107, $P109
  if_1014_end:
.annotate 'line', 512
    $P111 = $P106."new"("pass" :named("pasttype"), $P107 :named("backtrack"))
    find_lex $P112, "%capnames"
    $P113 = $P102."new"($P104, $P105, $P111, "concat" :named("pasttype"), $P112 :named("capnames"))
.annotate 'line', 509
    store_lex "$rpast", $P113
.annotate 'line', 517
    find_lex $P102, "$block"
    $P103 = $P102."symbol"(unicode:"$\x{a2}")
    if $P103, unless_1017_end
    find_lex $P104, "$block"
    $P104."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
  unless_1017_end:
.annotate 'line', 518
    find_lex $P102, "$block"
    $P103 = $P102."symbol"("$/")
    if $P103, unless_1018_end
    find_lex $P104, "$block"
    $P104."symbol"("$/", "lexical" :named("scope"))
  unless_1018_end:
.annotate 'line', 519
    find_lex $P102, "$block"
    find_lex $P103, "$rpast"
    $P102."push"($P103)
.annotate 'line', 520
    find_lex $P102, "$block"
    $P102."blocktype"("method")
.annotate 'line', 506
    find_lex $P102, "$block"
    .return ($P102)
  control_1007:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "capnames"  :subid("13_1309998845.12722") :outer("11_1309998845.12722")
    .param pmc param_1024
    .param pmc param_1025
.annotate 'line', 524
    .const 'Sub' $P1109 = "24_1309998845.12722" 
    capture_lex $P1109
    .const 'Sub' $P1084 = "21_1309998845.12722" 
    capture_lex $P1084
    .const 'Sub' $P1069 = "19_1309998845.12722" 
    capture_lex $P1069
    .const 'Sub' $P1053 = "17_1309998845.12722" 
    capture_lex $P1053
    .const 'Sub' $P1031 = "14_1309998845.12722" 
    capture_lex $P1031
    new $P1023, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1023, control_1022
    push_eh $P1023
    .lex "$ast", param_1024
    .lex "$count", param_1025
.annotate 'line', 525
    $P1027 = root_new ['parrot';'Hash']
    set $P1026, $P1027
    .lex "%capnames", $P1026
.annotate 'line', 526
    new $P104, "Undef"
    set $P1028, $P104
    .lex "$pasttype", $P1028
.annotate 'line', 524
    find_lex $P105, "%capnames"
.annotate 'line', 526
    find_lex $P105, "$ast"
    $P106 = $P105."pasttype"()
    store_lex "$pasttype", $P106
.annotate 'line', 527
    find_lex $P105, "$pasttype"
    set $S100, $P105
    iseq $I100, $S100, "alt"
    if $I100, if_1029
.annotate 'line', 540
    find_lex $P108, "$pasttype"
    set $S101, $P108
    iseq $I101, $S101, "concat"
    if $I101, if_1051
.annotate 'line', 549
    find_lex $P110, "$pasttype"
    set $S102, $P110
    iseq $I102, $S102, "subrule"
    if $I102, if_1067
    new $P109, 'Integer'
    set $P109, $I102
    goto if_1067_end
  if_1067:
    find_lex $P111, "$ast"
    $S103 = $P111."subtype"()
    iseq $I103, $S103, "capture"
    new $P109, 'Integer'
    set $P109, $I103
  if_1067_end:
    if $P109, if_1066
.annotate 'line', 562
    find_lex $P114, "$pasttype"
    set $S104, $P114
    iseq $I104, $S104, "subcapture"
    if $I104, if_1082
.annotate 'line', 579
    find_lex $P117, "$pasttype"
    set $S105, $P117
    iseq $I105, $S105, "quant"
    unless $I105, if_1107_end
    .const 'Sub' $P1109 = "24_1309998845.12722" 
    capture_lex $P1109
    $P1109()
  if_1107_end:
    goto if_1082_end
  if_1082:
.annotate 'line', 562
    .const 'Sub' $P1084 = "21_1309998845.12722" 
    capture_lex $P1084
    $P1084()
  if_1082_end:
    goto if_1066_end
  if_1066:
.annotate 'line', 549
    .const 'Sub' $P1069 = "19_1309998845.12722" 
    capture_lex $P1069
    $P1069()
  if_1066_end:
    goto if_1051_end
  if_1051:
.annotate 'line', 541
    find_lex $P110, "$ast"
    $P111 = $P110."list"()
    defined $I102, $P111
    unless $I102, for_undef_123
    iter $P109, $P111
    new $P114, 'ExceptionHandler'
    set_label $P114, loop1065_handler
    $P114."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P114
  loop1065_test:
    unless $P109, loop1065_done
    shift $P112, $P109
  loop1065_redo:
    .const 'Sub' $P1053 = "17_1309998845.12722" 
    capture_lex $P1053
    $P1053($P112)
  loop1065_next:
    goto loop1065_test
  loop1065_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, 'type'
    eq $P115, .CONTROL_LOOP_NEXT, loop1065_next
    eq $P115, .CONTROL_LOOP_REDO, loop1065_redo
  loop1065_done:
    pop_eh 
  for_undef_123:
  if_1051_end:
.annotate 'line', 540
    goto if_1029_end
  if_1029:
.annotate 'line', 527
    .const 'Sub' $P1031 = "14_1309998845.12722" 
    capture_lex $P1031
    $P1031()
  if_1029_end:
.annotate 'line', 586
    find_lex $P105, "$count"
    find_lex $P1119, "%capnames"
    unless_null $P1119, vivify_143
    $P1119 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P1119
  vivify_143:
    set $P1119[""], $P105
.annotate 'line', 524
    find_lex $P105, "%capnames"
    .return ($P105)
  control_1022:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "_block1108"  :anon :subid("24_1309998845.12722") :outer("13_1309998845.12722")
.annotate 'line', 579
    .const 'Sub' $P1114 = "25_1309998845.12722" 
    capture_lex $P1114
.annotate 'line', 580
    $P1111 = root_new ['parrot';'Hash']
    set $P1110, $P1111
    .lex "%astcap", $P1110
    find_lex $P1112, "$ast"
    unless_null $P1112, vivify_103
    $P1112 = root_new ['parrot';'ResizablePMCArray']
  vivify_103:
    set $P118, $P1112[0]
    unless_null $P118, vivify_104
    new $P118, "Undef"
  vivify_104:
    find_lex $P119, "$count"
    $P120 = "capnames"($P118, $P119)
    store_lex "%astcap", $P120
.annotate 'line', 581
    find_lex $P119, "%astcap"
    defined $I106, $P119
    unless $I106, for_undef_105
    iter $P118, $P119
    new $P122, 'ExceptionHandler'
    set_label $P122, loop1117_handler
    $P122."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P122
  loop1117_test:
    unless $P118, loop1117_done
    shift $P120, $P118
  loop1117_redo:
    .const 'Sub' $P1114 = "25_1309998845.12722" 
    capture_lex $P1114
    $P1114($P120)
  loop1117_next:
    goto loop1117_test
  loop1117_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P123, exception, 'type'
    eq $P123, .CONTROL_LOOP_NEXT, loop1117_next
    eq $P123, .CONTROL_LOOP_REDO, loop1117_redo
  loop1117_done:
    pop_eh 
  for_undef_105:
.annotate 'line', 584
    find_lex $P1118, "%astcap"
    unless_null $P1118, vivify_107
    $P1118 = root_new ['parrot';'Hash']
  vivify_107:
    set $P118, $P1118[""]
    unless_null $P118, vivify_108
    new $P118, "Undef"
  vivify_108:
    store_lex "$count", $P118
.annotate 'line', 579
    .return ($P118)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1113"  :anon :subid("25_1309998845.12722") :outer("24_1309998845.12722")
    .param pmc param_1115
.annotate 'line', 581
    .lex "$_", param_1115
.annotate 'line', 582
    new $P121, "Integer"
    assign $P121, 2
    find_lex $P122, "$_"
    find_lex $P1116, "%capnames"
    unless_null $P1116, vivify_106
    $P1116 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P1116
  vivify_106:
    set $P1116[$P122], $P121
.annotate 'line', 581
    .return ($P121)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "_block1083"  :anon :subid("21_1309998845.12722") :outer("13_1309998845.12722")
.annotate 'line', 562
    .const 'Sub' $P1100 = "23_1309998845.12722" 
    capture_lex $P1100
    .const 'Sub' $P1092 = "22_1309998845.12722" 
    capture_lex $P1092
.annotate 'line', 563
    new $P115, "Undef"
    set $P1085, $P115
    .lex "$name", $P1085
.annotate 'line', 564
    $P1087 = root_new ['parrot';'ResizablePMCArray']
    set $P1086, $P1087
    .lex "@names", $P1086
.annotate 'line', 573
    $P1089 = root_new ['parrot';'Hash']
    set $P1088, $P1089
    .lex "%x", $P1088
.annotate 'line', 563
    find_lex $P116, "$ast"
    $P117 = $P116."name"()
    store_lex "$name", $P117
.annotate 'line', 564

            $P0 = find_lex '$name'
            $S0 = $P0
            $P1090 = split '=', $S0
        
    store_lex "@names", $P1090
.annotate 'line', 569
    find_lex $P117, "@names"
    defined $I105, $P117
    unless $I105, for_undef_109
    iter $P116, $P117
    new $P120, 'ExceptionHandler'
    set_label $P120, loop1097_handler
    $P120."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P120
  loop1097_test:
    unless $P116, loop1097_done
    shift $P118, $P116
  loop1097_redo:
    .const 'Sub' $P1092 = "22_1309998845.12722" 
    capture_lex $P1092
    $P1092($P118)
  loop1097_next:
    goto loop1097_test
  loop1097_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P121, exception, 'type'
    eq $P121, .CONTROL_LOOP_NEXT, loop1097_next
    eq $P121, .CONTROL_LOOP_REDO, loop1097_redo
  loop1097_done:
    pop_eh 
  for_undef_109:
.annotate 'line', 573
    find_lex $P1098, "$ast"
    unless_null $P1098, vivify_111
    $P1098 = root_new ['parrot';'ResizablePMCArray']
  vivify_111:
    set $P116, $P1098[0]
    unless_null $P116, vivify_112
    new $P116, "Undef"
  vivify_112:
    find_lex $P117, "$count"
    $P118 = "capnames"($P116, $P117)
    store_lex "%x", $P118
.annotate 'line', 574
    find_lex $P117, "%x"
    defined $I105, $P117
    unless $I105, for_undef_113
    iter $P116, $P117
    new $P119, 'ExceptionHandler'
    set_label $P119, loop1105_handler
    $P119."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P119
  loop1105_test:
    unless $P116, loop1105_done
    shift $P118, $P116
  loop1105_redo:
    .const 'Sub' $P1100 = "23_1309998845.12722" 
    capture_lex $P1100
    $P1100($P118)
  loop1105_next:
    goto loop1105_test
  loop1105_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P120, exception, 'type'
    eq $P120, .CONTROL_LOOP_NEXT, loop1105_next
    eq $P120, .CONTROL_LOOP_REDO, loop1105_redo
  loop1105_done:
    pop_eh 
  for_undef_113:
.annotate 'line', 577
    find_lex $P1106, "%x"
    unless_null $P1106, vivify_119
    $P1106 = root_new ['parrot';'Hash']
  vivify_119:
    set $P116, $P1106[""]
    unless_null $P116, vivify_120
    new $P116, "Undef"
  vivify_120:
    store_lex "$count", $P116
.annotate 'line', 562
    .return ($P116)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1091"  :anon :subid("22_1309998845.12722") :outer("21_1309998845.12722")
    .param pmc param_1093
.annotate 'line', 569
    .lex "$_", param_1093
.annotate 'line', 570
    find_lex $P120, "$_"
    set $S105, $P120
    iseq $I106, $S105, "0"
    unless $I106, unless_1095
    new $P119, 'Integer'
    set $P119, $I106
    goto unless_1095_end
  unless_1095:
    find_lex $P121, "$_"
    set $N100, $P121
    isgt $I107, $N100, 0.0
    new $P119, 'Integer'
    set $P119, $I107
  unless_1095_end:
    unless $P119, if_1094_end
    find_lex $P122, "$_"
    add $P123, $P122, 1
    store_lex "$count", $P123
  if_1094_end:
.annotate 'line', 571
    new $P119, "Integer"
    assign $P119, 1
    find_lex $P120, "$_"
    find_lex $P1096, "%capnames"
    unless_null $P1096, vivify_110
    $P1096 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P1096
  vivify_110:
    set $P1096[$P120], $P119
.annotate 'line', 569
    .return ($P119)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1099"  :anon :subid("23_1309998845.12722") :outer("21_1309998845.12722")
    .param pmc param_1101
.annotate 'line', 574
    .lex "$_", param_1101
.annotate 'line', 575
    find_lex $P119, "$_"
    find_lex $P1102, "%capnames"
    unless_null $P1102, vivify_114
    $P1102 = root_new ['parrot';'Hash']
  vivify_114:
    set $P120, $P1102[$P119]
    unless_null $P120, vivify_115
    new $P120, "Undef"
  vivify_115:
    set $N100, $P120
    new $P121, 'Float'
    set $P121, $N100
    find_lex $P122, "$_"
    find_lex $P1103, "%x"
    unless_null $P1103, vivify_116
    $P1103 = root_new ['parrot';'Hash']
  vivify_116:
    set $P123, $P1103[$P122]
    unless_null $P123, vivify_117
    new $P123, "Undef"
  vivify_117:
    add $P124, $P121, $P123
    find_lex $P125, "$_"
    find_lex $P1104, "%capnames"
    unless_null $P1104, vivify_118
    $P1104 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P1104
  vivify_118:
    set $P1104[$P125], $P124
.annotate 'line', 574
    .return ($P124)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "_block1068"  :anon :subid("19_1309998845.12722") :outer("13_1309998845.12722")
.annotate 'line', 549
    .const 'Sub' $P1076 = "20_1309998845.12722" 
    capture_lex $P1076
.annotate 'line', 550
    new $P112, "Undef"
    set $P1070, $P112
    .lex "$name", $P1070
.annotate 'line', 552
    $P1072 = root_new ['parrot';'ResizablePMCArray']
    set $P1071, $P1072
    .lex "@names", $P1071
.annotate 'line', 550
    find_lex $P113, "$ast"
    $P114 = $P113."name"()
    store_lex "$name", $P114
.annotate 'line', 551
    find_lex $P113, "$name"
    set $S104, $P113
    iseq $I104, $S104, ""
    unless $I104, if_1073_end
    find_lex $P114, "$count"
    store_lex "$name", $P114
    find_lex $P114, "$ast"
    find_lex $P115, "$name"
    $P114."name"($P115)
  if_1073_end:
.annotate 'line', 552

            $P0 = find_lex '$name'
            $S0 = $P0
            $P1074 = split '=', $S0
        
    store_lex "@names", $P1074
.annotate 'line', 557
    find_lex $P114, "@names"
    defined $I104, $P114
    unless $I104, for_undef_121
    iter $P113, $P114
    new $P117, 'ExceptionHandler'
    set_label $P117, loop1081_handler
    $P117."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P117
  loop1081_test:
    unless $P113, loop1081_done
    shift $P115, $P113
  loop1081_redo:
    .const 'Sub' $P1076 = "20_1309998845.12722" 
    capture_lex $P1076
    $P1076($P115)
  loop1081_next:
    goto loop1081_test
  loop1081_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P118, exception, 'type'
    eq $P118, .CONTROL_LOOP_NEXT, loop1081_next
    eq $P118, .CONTROL_LOOP_REDO, loop1081_redo
  loop1081_done:
    pop_eh 
  for_undef_121:
.annotate 'line', 549
    .return ($P113)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1075"  :anon :subid("20_1309998845.12722") :outer("19_1309998845.12722")
    .param pmc param_1077
.annotate 'line', 557
    .lex "$_", param_1077
.annotate 'line', 558
    find_lex $P117, "$_"
    set $S104, $P117
    iseq $I105, $S104, "0"
    unless $I105, unless_1079
    new $P116, 'Integer'
    set $P116, $I105
    goto unless_1079_end
  unless_1079:
    find_lex $P118, "$_"
    set $N100, $P118
    isgt $I106, $N100, 0.0
    new $P116, 'Integer'
    set $P116, $I106
  unless_1079_end:
    unless $P116, if_1078_end
    find_lex $P119, "$_"
    add $P120, $P119, 1
    store_lex "$count", $P120
  if_1078_end:
.annotate 'line', 559
    new $P116, "Integer"
    assign $P116, 1
    find_lex $P117, "$_"
    find_lex $P1080, "%capnames"
    unless_null $P1080, vivify_122
    $P1080 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P1080
  vivify_122:
    set $P1080[$P117], $P116
.annotate 'line', 557
    .return ($P116)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "_block1052"  :anon :subid("17_1309998845.12722") :outer("13_1309998845.12722")
    .param pmc param_1056
.annotate 'line', 541
    .const 'Sub' $P1058 = "18_1309998845.12722" 
    capture_lex $P1058
.annotate 'line', 542
    $P1055 = root_new ['parrot';'Hash']
    set $P1054, $P1055
    .lex "%x", $P1054
    .lex "$_", param_1056
    find_lex $P113, "$_"
    find_lex $P114, "$count"
    $P115 = "capnames"($P113, $P114)
    store_lex "%x", $P115
.annotate 'line', 543
    find_lex $P114, "%x"
    defined $I103, $P114
    unless $I103, for_undef_124
    iter $P113, $P114
    new $P116, 'ExceptionHandler'
    set_label $P116, loop1063_handler
    $P116."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P116
  loop1063_test:
    unless $P113, loop1063_done
    shift $P115, $P113
  loop1063_redo:
    .const 'Sub' $P1058 = "18_1309998845.12722" 
    capture_lex $P1058
    $P1058($P115)
  loop1063_next:
    goto loop1063_test
  loop1063_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P117, exception, 'type'
    eq $P117, .CONTROL_LOOP_NEXT, loop1063_next
    eq $P117, .CONTROL_LOOP_REDO, loop1063_redo
  loop1063_done:
    pop_eh 
  for_undef_124:
.annotate 'line', 546
    find_lex $P1064, "%x"
    unless_null $P1064, vivify_130
    $P1064 = root_new ['parrot';'Hash']
  vivify_130:
    set $P113, $P1064[""]
    unless_null $P113, vivify_131
    new $P113, "Undef"
  vivify_131:
    store_lex "$count", $P113
.annotate 'line', 541
    .return ($P113)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1057"  :anon :subid("18_1309998845.12722") :outer("17_1309998845.12722")
    .param pmc param_1059
.annotate 'line', 543
    .lex "$_", param_1059
.annotate 'line', 544
    find_lex $P116, "$_"
    find_lex $P1060, "%capnames"
    unless_null $P1060, vivify_125
    $P1060 = root_new ['parrot';'Hash']
  vivify_125:
    set $P117, $P1060[$P116]
    unless_null $P117, vivify_126
    new $P117, "Undef"
  vivify_126:
    set $N100, $P117
    new $P118, 'Float'
    set $P118, $N100
    find_lex $P119, "$_"
    find_lex $P1061, "%x"
    unless_null $P1061, vivify_127
    $P1061 = root_new ['parrot';'Hash']
  vivify_127:
    set $P120, $P1061[$P119]
    unless_null $P120, vivify_128
    new $P120, "Undef"
  vivify_128:
    add $P121, $P118, $P120
    find_lex $P122, "$_"
    find_lex $P1062, "%capnames"
    unless_null $P1062, vivify_129
    $P1062 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P1062
  vivify_129:
    set $P1062[$P122], $P121
.annotate 'line', 543
    .return ($P121)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "_block1030"  :anon :subid("14_1309998845.12722") :outer("13_1309998845.12722")
.annotate 'line', 527
    .const 'Sub' $P1034 = "15_1309998845.12722" 
    capture_lex $P1034
.annotate 'line', 528
    new $P106, "Undef"
    set $P1032, $P106
    .lex "$max", $P1032
    find_lex $P107, "$count"
    store_lex "$max", $P107
.annotate 'line', 529
    find_lex $P108, "$ast"
    $P109 = $P108."list"()
    defined $I101, $P109
    unless $I101, for_undef_132
    iter $P107, $P109
    new $P112, 'ExceptionHandler'
    set_label $P112, loop1050_handler
    $P112."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P112
  loop1050_test:
    unless $P107, loop1050_done
    shift $P110, $P107
  loop1050_redo:
    .const 'Sub' $P1034 = "15_1309998845.12722" 
    capture_lex $P1034
    $P1034($P110)
  loop1050_next:
    goto loop1050_test
  loop1050_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P113, exception, 'type'
    eq $P113, .CONTROL_LOOP_NEXT, loop1050_next
    eq $P113, .CONTROL_LOOP_REDO, loop1050_redo
  loop1050_done:
    pop_eh 
  for_undef_132:
.annotate 'line', 538
    find_lex $P107, "$max"
    store_lex "$count", $P107
.annotate 'line', 527
    .return ($P107)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "_block1033"  :anon :subid("15_1309998845.12722") :outer("14_1309998845.12722")
    .param pmc param_1037
.annotate 'line', 529
    .const 'Sub' $P1039 = "16_1309998845.12722" 
    capture_lex $P1039
.annotate 'line', 530
    $P1036 = root_new ['parrot';'Hash']
    set $P1035, $P1036
    .lex "%x", $P1035
    .lex "$_", param_1037
    find_lex $P111, "$_"
    find_lex $P112, "$count"
    $P113 = "capnames"($P111, $P112)
    store_lex "%x", $P113
.annotate 'line', 531
    find_lex $P112, "%x"
    defined $I102, $P112
    unless $I102, for_undef_133
    iter $P111, $P112
    new $P115, 'ExceptionHandler'
    set_label $P115, loop1046_handler
    $P115."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P115
  loop1046_test:
    unless $P111, loop1046_done
    shift $P113, $P111
  loop1046_redo:
    .const 'Sub' $P1039 = "16_1309998845.12722" 
    capture_lex $P1039
    $P1039($P113)
  loop1046_next:
    goto loop1046_test
  loop1046_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P116, exception, 'type'
    eq $P116, .CONTROL_LOOP_NEXT, loop1046_next
    eq $P116, .CONTROL_LOOP_REDO, loop1046_redo
  loop1046_done:
    pop_eh 
  for_undef_133:
.annotate 'line', 536
    find_lex $P1048, "%x"
    unless_null $P1048, vivify_139
    $P1048 = root_new ['parrot';'Hash']
  vivify_139:
    set $P112, $P1048[""]
    unless_null $P112, vivify_140
    new $P112, "Undef"
  vivify_140:
    set $N100, $P112
    find_lex $P113, "$max"
    set $N101, $P113
    isgt $I102, $N100, $N101
    if $I102, if_1047
    new $P111, 'Integer'
    set $P111, $I102
    goto if_1047_end
  if_1047:
    find_lex $P1049, "%x"
    unless_null $P1049, vivify_141
    $P1049 = root_new ['parrot';'Hash']
  vivify_141:
    set $P114, $P1049[""]
    unless_null $P114, vivify_142
    new $P114, "Undef"
  vivify_142:
    store_lex "$max", $P114
    set $P111, $P114
  if_1047_end:
.annotate 'line', 529
    .return ($P111)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1038"  :anon :subid("16_1309998845.12722") :outer("15_1309998845.12722")
    .param pmc param_1040
.annotate 'line', 531
    .lex "$_", param_1040
.annotate 'line', 532
    find_lex $P116, "$_"
    find_lex $P1043, "%capnames"
    unless_null $P1043, vivify_134
    $P1043 = root_new ['parrot';'Hash']
  vivify_134:
    set $P117, $P1043[$P116]
    unless_null $P117, vivify_135
    new $P117, "Undef"
  vivify_135:
    set $N100, $P117
    islt $I103, $N100, 2.0
    if $I103, if_1042
    new $P115, 'Integer'
    set $P115, $I103
    goto if_1042_end
  if_1042:
    find_lex $P118, "$_"
    find_lex $P1044, "%x"
    unless_null $P1044, vivify_136
    $P1044 = root_new ['parrot';'Hash']
  vivify_136:
    set $P119, $P1044[$P118]
    unless_null $P119, vivify_137
    new $P119, "Undef"
  vivify_137:
    set $N101, $P119
    iseq $I104, $N101, 1.0
    new $P115, 'Integer'
    set $P115, $I104
  if_1042_end:
    if $P115, if_1041
    new $P121, "Integer"
    assign $P121, 2
    set $P114, $P121
    goto if_1041_end
  if_1041:
    new $P120, "Integer"
    assign $P120, 1
    set $P114, $P120
  if_1041_end:
.annotate 'line', 533
    find_lex $P122, "$_"
    find_lex $P1045, "%capnames"
    unless_null $P1045, vivify_138
    $P1045 = root_new ['parrot';'Hash']
    store_lex "%capnames", $P1045
  vivify_138:
    set $P1045[$P122], $P114
.annotate 'line', 531
    .return ($P114)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backmod"  :subid("26_1309998845.12722") :outer("11_1309998845.12722")
    .param pmc param_1125
    .param pmc param_1126
.annotate 'line', 590
    new $P1124, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1124, control_1123
    push_eh $P1124
    .lex "$ast", param_1125
    .lex "$backmod", param_1126
.annotate 'line', 591
    find_lex $P107, "$backmod"
    set $S100, $P107
    iseq $I100, $S100, ":"
    if $I100, if_1127
.annotate 'line', 592
    find_lex $P109, "$backmod"
    set $S101, $P109
    iseq $I101, $S101, ":?"
    unless $I101, unless_1129
    new $P108, 'Integer'
    set $P108, $I101
    goto unless_1129_end
  unless_1129:
    find_lex $P110, "$backmod"
    set $S102, $P110
    iseq $I102, $S102, "?"
    new $P108, 'Integer'
    set $P108, $I102
  unless_1129_end:
    if $P108, if_1128
.annotate 'line', 593
    find_lex $P112, "$backmod"
    set $S103, $P112
    iseq $I103, $S103, ":!"
    unless $I103, unless_1131
    new $P111, 'Integer'
    set $P111, $I103
    goto unless_1131_end
  unless_1131:
    find_lex $P113, "$backmod"
    set $S104, $P113
    iseq $I104, $S104, "!"
    new $P111, 'Integer'
    set $P111, $I104
  unless_1131_end:
    unless $P111, if_1130_end
    find_lex $P114, "$ast"
    $P114."backtrack"("g")
  if_1130_end:
    goto if_1128_end
  if_1128:
.annotate 'line', 592
    find_lex $P111, "$ast"
    $P111."backtrack"("f")
  if_1128_end:
    goto if_1127_end
  if_1127:
.annotate 'line', 591
    find_lex $P108, "$ast"
    $P108."backtrack"("r")
  if_1127_end:
.annotate 'line', 590
    find_lex $P107, "$ast"
    .return ($P107)
  control_1123:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "arg"  :subid("27_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1136
.annotate 'line', 14
    new $P1135, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1135, control_1134
    push_eh $P1135
    .lex "self", self
    .lex "$/", param_1136
.annotate 'line', 15
    find_lex $P109, "$/"
    find_lex $P1138, "$/"
    unless_null $P1138, vivify_144
    $P1138 = root_new ['parrot';'Hash']
  vivify_144:
    set $P111, $P1138["quote_EXPR"]
    unless_null $P111, vivify_145
    new $P111, "Undef"
  vivify_145:
    if $P111, if_1137
    find_lex $P1140, "$/"
    unless_null $P1140, vivify_146
    $P1140 = root_new ['parrot';'Hash']
  vivify_146:
    set $P114, $P1140["val"]
    unless_null $P114, vivify_147
    new $P114, "Undef"
  vivify_147:
    set $N100, $P114
    new $P110, 'Float'
    set $P110, $N100
    goto if_1137_end
  if_1137:
    find_lex $P1139, "$/"
    unless_null $P1139, vivify_148
    $P1139 = root_new ['parrot';'Hash']
  vivify_148:
    set $P112, $P1139["quote_EXPR"]
    unless_null $P112, vivify_149
    new $P112, "Undef"
  vivify_149:
    $P113 = $P112."ast"()
    set $P110, $P113
  if_1137_end:
    $P115 = $P109."!make"($P110)
.annotate 'line', 14
    .return ($P115)
  control_1134:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "arglist"  :subid("28_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1144
.annotate 'line', 18
    .const 'Sub' $P1148 = "29_1309998845.12722" 
    capture_lex $P1148
    new $P1143, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1143, control_1142
    push_eh $P1143
    .lex "self", self
    .lex "$/", param_1144
.annotate 'line', 19
    new $P109, "Undef"
    set $P1145, $P109
    .lex "$past", $P1145
    get_hll_global $P110, ["PAST"], "Op"
    $P111 = $P110."new"("list" :named("pasttype"))
    store_lex "$past", $P111
.annotate 'line', 20
    find_lex $P1146, "$/"
    unless_null $P1146, vivify_150
    $P1146 = root_new ['parrot';'Hash']
  vivify_150:
    set $P111, $P1146["arg"]
    unless_null $P111, vivify_151
    new $P111, "Undef"
  vivify_151:
    defined $I100, $P111
    unless $I100, for_undef_152
    iter $P110, $P111
    new $P113, 'ExceptionHandler'
    set_label $P113, loop1150_handler
    $P113."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P113
  loop1150_test:
    unless $P110, loop1150_done
    shift $P112, $P110
  loop1150_redo:
    .const 'Sub' $P1148 = "29_1309998845.12722" 
    capture_lex $P1148
    $P1148($P112)
  loop1150_next:
    goto loop1150_test
  loop1150_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, 'type'
    eq $P114, .CONTROL_LOOP_NEXT, loop1150_next
    eq $P114, .CONTROL_LOOP_REDO, loop1150_redo
  loop1150_done:
    pop_eh 
  for_undef_152:
.annotate 'line', 21
    find_lex $P110, "$/"
    find_lex $P111, "$past"
    $P112 = $P110."!make"($P111)
.annotate 'line', 18
    .return ($P112)
  control_1142:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1147"  :anon :subid("29_1309998845.12722") :outer("28_1309998845.12722")
    .param pmc param_1149
.annotate 'line', 20
    .lex "$_", param_1149
    find_lex $P113, "$past"
    find_lex $P114, "$_"
    $P115 = $P114."ast"()
    $P116 = $P113."push"($P115)
    .return ($P116)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "TOP"  :subid("30_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1154
.annotate 'line', 24
    new $P1153, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1153, control_1152
    push_eh $P1153
    .lex "self", self
    .lex "$/", param_1154
.annotate 'line', 25
    new $P109, "Undef"
    set $P1155, $P109
    .lex "$past", $P1155
    find_lex $P1156, "$/"
    unless_null $P1156, vivify_153
    $P1156 = root_new ['parrot';'Hash']
  vivify_153:
    set $P110, $P1156["nibbler"]
    unless_null $P110, vivify_154
    new $P110, "Undef"
  vivify_154:
    $P111 = $P110."ast"()
    $P112 = "buildsub"($P111)
    store_lex "$past", $P112
.annotate 'line', 26
    find_lex $P110, "$past"
    find_lex $P111, "$/"
    $P110."node"($P111)
.annotate 'line', 27
    find_lex $P110, "$/"
    find_lex $P111, "$past"
    $P112 = $P110."!make"($P111)
.annotate 'line', 24
    .return ($P112)
  control_1152:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "nibbler"  :subid("31_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1160
    .param pmc param_1161 :optional
    .param int has_param_1161 :opt_flag
.annotate 'line', 30
    .const 'Sub' $P1175 = "33_1309998845.12722" 
    capture_lex $P1175
    .const 'Sub' $P1165 = "32_1309998845.12722" 
    capture_lex $P1165
    new $P1159, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1159, control_1158
    push_eh $P1159
    .lex "self", self
    .lex "$/", param_1160
    if has_param_1161, optparam_155
    new $P109, "Undef"
    set param_1161, $P109
  optparam_155:
    .lex "$key", param_1161
.annotate 'line', 39
    new $P110, "Undef"
    set $P1162, $P110
    .lex "$past", $P1162
.annotate 'line', 31
    find_lex $P111, "$key"
    set $S100, $P111
    iseq $I100, $S100, "open"
    unless $I100, if_1163_end
    .const 'Sub' $P1165 = "32_1309998845.12722" 
    capture_lex $P1165
    $P1165()
  if_1163_end:
.annotate 'line', 38
    get_global $P111, "@MODIFIERS"
    $P111."shift"()
.annotate 'line', 30
    find_lex $P111, "$past"
.annotate 'line', 40
    find_lex $P1172, "$/"
    unless_null $P1172, vivify_158
    $P1172 = root_new ['parrot';'Hash']
  vivify_158:
    set $P111, $P1172["termconj"]
    unless_null $P111, vivify_159
    new $P111, "Undef"
  vivify_159:
    set $N100, $P111
    isgt $I100, $N100, 1.0
    if $I100, if_1171
.annotate 'line', 47
    find_lex $P1178, "$/"
    unless_null $P1178, vivify_160
    $P1178 = root_new ['parrot';'Hash']
  vivify_160:
    set $P1179, $P1178["termconj"]
    unless_null $P1179, vivify_161
    $P1179 = root_new ['parrot';'ResizablePMCArray']
  vivify_161:
    set $P112, $P1179[0]
    unless_null $P112, vivify_162
    new $P112, "Undef"
  vivify_162:
    $P113 = $P112."ast"()
    store_lex "$past", $P113
.annotate 'line', 46
    goto if_1171_end
  if_1171:
.annotate 'line', 41
    get_hll_global $P112, ["PAST"], "Regex"
    find_lex $P113, "$/"
    $P114 = $P112."new"("alt" :named("pasttype"), $P113 :named("node"))
    store_lex "$past", $P114
.annotate 'line', 42
    find_lex $P1173, "$/"
    unless_null $P1173, vivify_163
    $P1173 = root_new ['parrot';'Hash']
  vivify_163:
    set $P113, $P1173["termconj"]
    unless_null $P113, vivify_164
    new $P113, "Undef"
  vivify_164:
    defined $I101, $P113
    unless $I101, for_undef_165
    iter $P112, $P113
    new $P115, 'ExceptionHandler'
    set_label $P115, loop1177_handler
    $P115."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P115
  loop1177_test:
    unless $P112, loop1177_done
    shift $P114, $P112
  loop1177_redo:
    .const 'Sub' $P1175 = "33_1309998845.12722" 
    capture_lex $P1175
    $P1175($P114)
  loop1177_next:
    goto loop1177_test
  loop1177_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P116, exception, 'type'
    eq $P116, .CONTROL_LOOP_NEXT, loop1177_next
    eq $P116, .CONTROL_LOOP_REDO, loop1177_redo
  loop1177_done:
    pop_eh 
  for_undef_165:
  if_1171_end:
.annotate 'line', 49
    find_lex $P111, "$/"
    find_lex $P112, "$past"
    $P113 = $P111."!make"($P112)
.annotate 'line', 30
    .return ($P113)
  control_1158:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "_block1164"  :anon :subid("32_1309998845.12722") :outer("31_1309998845.12722")
.annotate 'line', 32
    $P1167 = root_new ['parrot';'Hash']
    set $P1166, $P1167
    .lex "%old", $P1166
.annotate 'line', 33
    $P1169 = root_new ['parrot';'Hash']
    set $P1168, $P1169
    .lex "%new", $P1168
.annotate 'line', 32
    get_global $P1170, "@MODIFIERS"
    unless_null $P1170, vivify_156
    $P1170 = root_new ['parrot';'ResizablePMCArray']
  vivify_156:
    set $P112, $P1170[0]
    unless_null $P112, vivify_157
    new $P112, "Undef"
  vivify_157:
    store_lex "%old", $P112
.annotate 'line', 33
    find_lex $P112, "%old"
    clone $P113, $P112
    store_lex "%new", $P113
.annotate 'line', 34
    get_global $P112, "@MODIFIERS"
    find_lex $P113, "%new"
    $P112."unshift"($P113)
.annotate 'line', 35
    new $P112, "Exception"
    set $P112['type'], .CONTROL_RETURN
    new $P113, "Integer"
    assign $P113, 1
    setattribute $P112, 'payload', $P113
    throw $P112
.annotate 'line', 31
    .return ()
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1174"  :anon :subid("33_1309998845.12722") :outer("31_1309998845.12722")
    .param pmc param_1176
.annotate 'line', 42
    .lex "$_", param_1176
.annotate 'line', 43
    find_lex $P115, "$past"
    find_lex $P116, "$_"
    $P117 = $P116."ast"()
    $P118 = $P115."push"($P117)
.annotate 'line', 42
    .return ($P118)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "termconj"  :subid("34_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1183
.annotate 'line', 52
    .const 'Sub' $P1189 = "35_1309998845.12722" 
    capture_lex $P1189
    new $P1182, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1182, control_1181
    push_eh $P1182
    .lex "self", self
    .lex "$/", param_1183
.annotate 'line', 53
    new $P109, "Undef"
    set $P1184, $P109
    .lex "$past", $P1184
.annotate 'line', 52
    find_lex $P110, "$past"
.annotate 'line', 54
    find_lex $P1186, "$/"
    unless_null $P1186, vivify_166
    $P1186 = root_new ['parrot';'Hash']
  vivify_166:
    set $P110, $P1186["termish"]
    unless_null $P110, vivify_167
    new $P110, "Undef"
  vivify_167:
    set $N100, $P110
    isgt $I100, $N100, 1.0
    if $I100, if_1185
.annotate 'line', 61
    find_lex $P1192, "$/"
    unless_null $P1192, vivify_168
    $P1192 = root_new ['parrot';'Hash']
  vivify_168:
    set $P1193, $P1192["termish"]
    unless_null $P1193, vivify_169
    $P1193 = root_new ['parrot';'ResizablePMCArray']
  vivify_169:
    set $P111, $P1193[0]
    unless_null $P111, vivify_170
    new $P111, "Undef"
  vivify_170:
    $P112 = $P111."ast"()
    store_lex "$past", $P112
.annotate 'line', 60
    goto if_1185_end
  if_1185:
.annotate 'line', 55
    get_hll_global $P111, ["PAST"], "Regex"
    find_lex $P112, "$/"
    $P113 = $P111."new"("conj" :named("pasttype"), $P112 :named("node"))
    store_lex "$past", $P113
.annotate 'line', 56
    find_lex $P1187, "$/"
    unless_null $P1187, vivify_171
    $P1187 = root_new ['parrot';'Hash']
  vivify_171:
    set $P112, $P1187["termish"]
    unless_null $P112, vivify_172
    new $P112, "Undef"
  vivify_172:
    defined $I101, $P112
    unless $I101, for_undef_173
    iter $P111, $P112
    new $P114, 'ExceptionHandler'
    set_label $P114, loop1191_handler
    $P114."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P114
  loop1191_test:
    unless $P111, loop1191_done
    shift $P113, $P111
  loop1191_redo:
    .const 'Sub' $P1189 = "35_1309998845.12722" 
    capture_lex $P1189
    $P1189($P113)
  loop1191_next:
    goto loop1191_test
  loop1191_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, 'type'
    eq $P115, .CONTROL_LOOP_NEXT, loop1191_next
    eq $P115, .CONTROL_LOOP_REDO, loop1191_redo
  loop1191_done:
    pop_eh 
  for_undef_173:
  if_1185_end:
.annotate 'line', 63
    find_lex $P110, "$/"
    find_lex $P111, "$past"
    $P112 = $P110."!make"($P111)
.annotate 'line', 52
    .return ($P112)
  control_1181:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1188"  :anon :subid("35_1309998845.12722") :outer("34_1309998845.12722")
    .param pmc param_1190
.annotate 'line', 56
    .lex "$_", param_1190
.annotate 'line', 57
    find_lex $P114, "$past"
    find_lex $P115, "$_"
    $P116 = $P115."ast"()
    $P117 = $P114."push"($P116)
.annotate 'line', 56
    .return ($P117)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "termish"  :subid("36_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1197
.annotate 'line', 66
    .const 'Sub' $P1202 = "37_1309998845.12722" 
    capture_lex $P1202
    new $P1196, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1196, control_1195
    push_eh $P1196
    .lex "self", self
    .lex "$/", param_1197
.annotate 'line', 67
    new $P109, "Undef"
    set $P1198, $P109
    .lex "$past", $P1198
.annotate 'line', 68
    new $P110, "Undef"
    set $P1199, $P110
    .lex "$lastlit", $P1199
.annotate 'line', 67
    get_hll_global $P111, ["PAST"], "Regex"
    find_lex $P112, "$/"
    $P113 = $P111."new"("concat" :named("pasttype"), $P112 :named("node"))
    store_lex "$past", $P113
.annotate 'line', 68
    new $P111, "Integer"
    assign $P111, 0
    store_lex "$lastlit", $P111
.annotate 'line', 69
    find_lex $P1200, "$/"
    unless_null $P1200, vivify_174
    $P1200 = root_new ['parrot';'Hash']
  vivify_174:
    set $P112, $P1200["noun"]
    unless_null $P112, vivify_175
    new $P112, "Undef"
  vivify_175:
    defined $I100, $P112
    unless $I100, for_undef_176
    iter $P111, $P112
    new $P116, 'ExceptionHandler'
    set_label $P116, loop1216_handler
    $P116."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P116
  loop1216_test:
    unless $P111, loop1216_done
    shift $P113, $P111
  loop1216_redo:
    .const 'Sub' $P1202 = "37_1309998845.12722" 
    capture_lex $P1202
    $P1202($P113)
  loop1216_next:
    goto loop1216_test
  loop1216_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P117, exception, 'type'
    eq $P117, .CONTROL_LOOP_NEXT, loop1216_next
    eq $P117, .CONTROL_LOOP_REDO, loop1216_redo
  loop1216_done:
    pop_eh 
  for_undef_176:
.annotate 'line', 84
    find_lex $P111, "$/"
    find_lex $P112, "$past"
    $P113 = $P111."!make"($P112)
.annotate 'line', 66
    .return ($P113)
  control_1195:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1201"  :anon :subid("37_1309998845.12722") :outer("36_1309998845.12722")
    .param pmc param_1204
.annotate 'line', 70
    new $P114, "Undef"
    set $P1203, $P114
    .lex "$ast", $P1203
    .lex "$_", param_1204
    find_lex $P115, "$_"
    $P116 = $P115."ast"()
    store_lex "$ast", $P116
.annotate 'line', 71
    find_lex $P116, "$ast"
    if $P116, if_1205
    set $P115, $P116
    goto if_1205_end
  if_1205:
.annotate 'line', 72
    find_lex $P120, "$lastlit"
    if $P120, if_1208
    set $P119, $P120
    goto if_1208_end
  if_1208:
    find_lex $P121, "$ast"
    $S100 = $P121."pasttype"()
    iseq $I101, $S100, "literal"
    new $P119, 'Integer'
    set $P119, $I101
  if_1208_end:
    if $P119, if_1207
    set $P118, $P119
    goto if_1207_end
  if_1207:
.annotate 'line', 73
    get_hll_global $P122, ["PAST"], "Node"
    find_lex $P1209, "$ast"
    unless_null $P1209, vivify_177
    $P1209 = root_new ['parrot';'ResizablePMCArray']
  vivify_177:
    set $P123, $P1209[0]
    unless_null $P123, vivify_178
    new $P123, "Undef"
  vivify_178:
    $P124 = $P122."ACCEPTS"($P123)
    isfalse $I102, $P124
    new $P118, 'Integer'
    set $P118, $I102
  if_1207_end:
    if $P118, if_1206
.annotate 'line', 77
    find_lex $P125, "$past"
    find_lex $P126, "$ast"
    $P125."push"($P126)
.annotate 'line', 78
    find_lex $P128, "$ast"
    $S101 = $P128."pasttype"()
    iseq $I103, $S101, "literal"
    if $I103, if_1214
    new $P126, 'Integer'
    set $P126, $I103
    goto if_1214_end
  if_1214:
.annotate 'line', 79
    get_hll_global $P129, ["PAST"], "Node"
    find_lex $P1215, "$ast"
    unless_null $P1215, vivify_179
    $P1215 = root_new ['parrot';'ResizablePMCArray']
  vivify_179:
    set $P130, $P1215[0]
    unless_null $P130, vivify_180
    new $P130, "Undef"
  vivify_180:
    $P131 = $P129."ACCEPTS"($P130)
    isfalse $I104, $P131
    new $P126, 'Integer'
    set $P126, $I104
  if_1214_end:
    if $P126, if_1213
    new $P133, "Integer"
    assign $P133, 0
    set $P125, $P133
    goto if_1213_end
  if_1213:
    find_lex $P132, "$ast"
    set $P125, $P132
  if_1213_end:
.annotate 'line', 80
    store_lex "$lastlit", $P125
.annotate 'line', 76
    set $P117, $P125
.annotate 'line', 73
    goto if_1206_end
  if_1206:
.annotate 'line', 74
    find_lex $P1210, "$lastlit"
    unless_null $P1210, vivify_181
    $P1210 = root_new ['parrot';'ResizablePMCArray']
  vivify_181:
    set $P125, $P1210[0]
    unless_null $P125, vivify_182
    new $P125, "Undef"
  vivify_182:
    find_lex $P1211, "$ast"
    unless_null $P1211, vivify_183
    $P1211 = root_new ['parrot';'ResizablePMCArray']
  vivify_183:
    set $P126, $P1211[0]
    unless_null $P126, vivify_184
    new $P126, "Undef"
  vivify_184:
    concat $P127, $P125, $P126
    find_lex $P1212, "$lastlit"
    unless_null $P1212, vivify_185
    $P1212 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$lastlit", $P1212
  vivify_185:
    set $P1212[0], $P127
.annotate 'line', 73
    set $P117, $P127
  if_1206_end:
.annotate 'line', 71
    set $P115, $P117
  if_1205_end:
.annotate 'line', 69
    .return ($P115)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "quantified_atom"  :subid("38_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1220
.annotate 'line', 87
    .const 'Sub' $P1226 = "39_1309998845.12722" 
    capture_lex $P1226
    new $P1219, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1219, control_1218
    push_eh $P1219
    .lex "self", self
    .lex "$/", param_1220
.annotate 'line', 88
    new $P109, "Undef"
    set $P1221, $P109
    .lex "$past", $P1221
    find_lex $P1222, "$/"
    unless_null $P1222, vivify_186
    $P1222 = root_new ['parrot';'Hash']
  vivify_186:
    set $P110, $P1222["atom"]
    unless_null $P110, vivify_187
    new $P110, "Undef"
  vivify_187:
    $P111 = $P110."ast"()
    store_lex "$past", $P111
.annotate 'line', 89
    find_lex $P1224, "$/"
    unless_null $P1224, vivify_188
    $P1224 = root_new ['parrot';'Hash']
  vivify_188:
    set $P110, $P1224["quantifier"]
    unless_null $P110, vivify_189
    new $P110, "Undef"
  vivify_189:
    if $P110, if_1223
.annotate 'line', 95
    find_lex $P1232, "$/"
    unless_null $P1232, vivify_190
    $P1232 = root_new ['parrot';'Hash']
  vivify_190:
    set $P1233, $P1232["backmod"]
    unless_null $P1233, vivify_191
    $P1233 = root_new ['parrot';'ResizablePMCArray']
  vivify_191:
    set $P113, $P1233[0]
    unless_null $P113, vivify_192
    new $P113, "Undef"
  vivify_192:
    unless $P113, if_1231_end
    find_lex $P114, "$past"
    find_lex $P1234, "$/"
    unless_null $P1234, vivify_193
    $P1234 = root_new ['parrot';'Hash']
  vivify_193:
    set $P1235, $P1234["backmod"]
    unless_null $P1235, vivify_194
    $P1235 = root_new ['parrot';'ResizablePMCArray']
  vivify_194:
    set $P115, $P1235[0]
    unless_null $P115, vivify_195
    new $P115, "Undef"
  vivify_195:
    "backmod"($P114, $P115)
  if_1231_end:
    goto if_1223_end
  if_1223:
.annotate 'line', 89
    .const 'Sub' $P1226 = "39_1309998845.12722" 
    capture_lex $P1226
    $P1226()
  if_1223_end:
.annotate 'line', 96
    find_lex $P112, "$past"
    if $P112, if_1238
    set $P111, $P112
    goto if_1238_end
  if_1238:
    find_lex $P113, "$past"
    $P114 = $P113."backtrack"()
    isfalse $I100, $P114
    new $P111, 'Integer'
    set $P111, $I100
  if_1238_end:
    if $P111, if_1237
    set $P110, $P111
    goto if_1237_end
  if_1237:
    get_global $P1239, "@MODIFIERS"
    unless_null $P1239, vivify_199
    $P1239 = root_new ['parrot';'ResizablePMCArray']
  vivify_199:
    set $P1240, $P1239[0]
    unless_null $P1240, vivify_200
    $P1240 = root_new ['parrot';'Hash']
  vivify_200:
    set $P115, $P1240["r"]
    unless_null $P115, vivify_201
    new $P115, "Undef"
  vivify_201:
    set $P110, $P115
  if_1237_end:
    unless $P110, if_1236_end
.annotate 'line', 97
    find_lex $P116, "$past"
    $P116."backtrack"("r")
  if_1236_end:
.annotate 'line', 99
    find_lex $P110, "$/"
    find_lex $P111, "$past"
    $P112 = $P110."!make"($P111)
.annotate 'line', 87
    .return ($P112)
  control_1218:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1225"  :anon :subid("39_1309998845.12722") :outer("38_1309998845.12722")
.annotate 'line', 91
    new $P111, "Undef"
    set $P1227, $P111
    .lex "$qast", $P1227
.annotate 'line', 90
    find_lex $P112, "$past"
    isfalse $I100, $P112
    unless $I100, if_1228_end
    find_lex $P113, "$/"
    $P114 = $P113."CURSOR"()
    $P114."panic"("Quantifier follows nothing")
  if_1228_end:
.annotate 'line', 91
    find_lex $P1229, "$/"
    unless_null $P1229, vivify_196
    $P1229 = root_new ['parrot';'Hash']
  vivify_196:
    set $P1230, $P1229["quantifier"]
    unless_null $P1230, vivify_197
    $P1230 = root_new ['parrot';'ResizablePMCArray']
  vivify_197:
    set $P112, $P1230[0]
    unless_null $P112, vivify_198
    new $P112, "Undef"
  vivify_198:
    $P113 = $P112."ast"()
    store_lex "$qast", $P113
.annotate 'line', 92
    find_lex $P112, "$qast"
    find_lex $P113, "$past"
    $P112."unshift"($P113)
.annotate 'line', 93
    find_lex $P112, "$qast"
    store_lex "$past", $P112
.annotate 'line', 89
    .return ($P112)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "atom"  :subid("40_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1244
.annotate 'line', 102
    new $P1243, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1243, control_1242
    push_eh $P1243
    .lex "self", self
    .lex "$/", param_1244
.annotate 'line', 103
    new $P109, "Undef"
    set $P1245, $P109
    .lex "$past", $P1245
.annotate 'line', 102
    find_lex $P110, "$past"
.annotate 'line', 104
    find_lex $P1247, "$/"
    unless_null $P1247, vivify_202
    $P1247 = root_new ['parrot';'Hash']
  vivify_202:
    set $P110, $P1247["metachar"]
    unless_null $P110, vivify_203
    new $P110, "Undef"
  vivify_203:
    if $P110, if_1246
.annotate 'line', 106
    get_hll_global $P111, ["PAST"], "Regex"
    find_lex $P112, "$/"
    set $S100, $P112
    find_lex $P113, "$/"
    $P114 = $P111."new"($S100, "literal" :named("pasttype"), $P113 :named("node"))
    store_lex "$past", $P114
.annotate 'line', 107
    get_global $P1250, "@MODIFIERS"
    unless_null $P1250, vivify_204
    $P1250 = root_new ['parrot';'ResizablePMCArray']
  vivify_204:
    set $P1251, $P1250[0]
    unless_null $P1251, vivify_205
    $P1251 = root_new ['parrot';'Hash']
  vivify_205:
    set $P111, $P1251["i"]
    unless_null $P111, vivify_206
    new $P111, "Undef"
  vivify_206:
    unless $P111, if_1249_end
    find_lex $P112, "$past"
    $P112."subtype"("ignorecase")
  if_1249_end:
.annotate 'line', 105
    goto if_1246_end
  if_1246:
.annotate 'line', 104
    find_lex $P1248, "$/"
    unless_null $P1248, vivify_207
    $P1248 = root_new ['parrot';'Hash']
  vivify_207:
    set $P111, $P1248["metachar"]
    unless_null $P111, vivify_208
    new $P111, "Undef"
  vivify_208:
    $P112 = $P111."ast"()
    store_lex "$past", $P112
  if_1246_end:
.annotate 'line', 109
    find_lex $P110, "$/"
    find_lex $P111, "$past"
    $P112 = $P110."!make"($P111)
.annotate 'line', 102
    .return ($P112)
  control_1242:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "quantifier:sym<*>"  :subid("41_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1255
.annotate 'line', 112
    new $P1254, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1254, control_1253
    push_eh $P1254
    .lex "self", self
    .lex "$/", param_1255
.annotate 'line', 113
    new $P109, "Undef"
    set $P1256, $P109
    .lex "$past", $P1256
    get_hll_global $P110, ["PAST"], "Regex"
    find_lex $P111, "$/"
    $P112 = $P110."new"("quant" :named("pasttype"), $P111 :named("node"))
    store_lex "$past", $P112
.annotate 'line', 114
    find_lex $P110, "$/"
    find_lex $P111, "$past"
    find_lex $P1257, "$/"
    unless_null $P1257, vivify_209
    $P1257 = root_new ['parrot';'Hash']
  vivify_209:
    set $P112, $P1257["backmod"]
    unless_null $P112, vivify_210
    new $P112, "Undef"
  vivify_210:
    $P113 = "backmod"($P111, $P112)
    $P114 = $P110."!make"($P113)
.annotate 'line', 112
    .return ($P114)
  control_1253:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "quantifier:sym<+>"  :subid("42_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1261
.annotate 'line', 117
    new $P1260, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1260, control_1259
    push_eh $P1260
    .lex "self", self
    .lex "$/", param_1261
.annotate 'line', 118
    new $P109, "Undef"
    set $P1262, $P109
    .lex "$past", $P1262
    get_hll_global $P110, ["PAST"], "Regex"
    find_lex $P111, "$/"
    $P112 = $P110."new"("quant" :named("pasttype"), 1 :named("min"), $P111 :named("node"))
    store_lex "$past", $P112
.annotate 'line', 119
    find_lex $P110, "$/"
    find_lex $P111, "$past"
    find_lex $P1263, "$/"
    unless_null $P1263, vivify_211
    $P1263 = root_new ['parrot';'Hash']
  vivify_211:
    set $P112, $P1263["backmod"]
    unless_null $P112, vivify_212
    new $P112, "Undef"
  vivify_212:
    $P113 = "backmod"($P111, $P112)
    $P114 = $P110."!make"($P113)
.annotate 'line', 117
    .return ($P114)
  control_1259:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "quantifier:sym<?>"  :subid("43_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1267
.annotate 'line', 122
    new $P1266, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1266, control_1265
    push_eh $P1266
    .lex "self", self
    .lex "$/", param_1267
.annotate 'line', 123
    new $P109, "Undef"
    set $P1268, $P109
    .lex "$past", $P1268
    get_hll_global $P110, ["PAST"], "Regex"
    find_lex $P111, "$/"
    $P112 = $P110."new"("quant" :named("pasttype"), 0 :named("min"), 1 :named("max"), $P111 :named("node"))
    store_lex "$past", $P112
.annotate 'line', 124
    find_lex $P110, "$/"
    find_lex $P111, "$past"
    find_lex $P1269, "$/"
    unless_null $P1269, vivify_213
    $P1269 = root_new ['parrot';'Hash']
  vivify_213:
    set $P112, $P1269["backmod"]
    unless_null $P112, vivify_214
    new $P112, "Undef"
  vivify_214:
    $P113 = "backmod"($P111, $P112)
    $P110."!make"($P113)
.annotate 'line', 125
    find_lex $P110, "$/"
    find_lex $P111, "$past"
    $P112 = $P110."!make"($P111)
.annotate 'line', 122
    .return ($P112)
  control_1265:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "quantifier:sym<**>"  :subid("44_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1273
.annotate 'line', 128
    .const 'Sub' $P1283 = "45_1309998845.12722" 
    capture_lex $P1283
    new $P1272, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1272, control_1271
    push_eh $P1272
    .lex "self", self
    .lex "$/", param_1273
.annotate 'line', 129
    new $P109, "Undef"
    set $P1274, $P109
    .lex "$past", $P1274
.annotate 'line', 130
    new $P110, "Undef"
    set $P1275, $P110
    .lex "$ws", $P1275
.annotate 'line', 128
    find_lex $P111, "$past"
.annotate 'line', 130
    find_lex $P1277, "$/"
    unless_null $P1277, vivify_215
    $P1277 = root_new ['parrot';'Hash']
  vivify_215:
    set $P112, $P1277["normspace"]
    unless_null $P112, vivify_216
    new $P112, "Undef"
  vivify_216:
    if $P112, if_1276
    set $P111, $P112
    goto if_1276_end
  if_1276:
    get_global $P1278, "@MODIFIERS"
    unless_null $P1278, vivify_217
    $P1278 = root_new ['parrot';'ResizablePMCArray']
  vivify_217:
    set $P1279, $P1278[0]
    unless_null $P1279, vivify_218
    $P1279 = root_new ['parrot';'Hash']
  vivify_218:
    set $P113, $P1279["s"]
    unless_null $P113, vivify_219
    new $P113, "Undef"
  vivify_219:
    set $P111, $P113
  if_1276_end:
    store_lex "$ws", $P111
.annotate 'line', 131
    find_lex $P1281, "$/"
    unless_null $P1281, vivify_220
    $P1281 = root_new ['parrot';'Hash']
  vivify_220:
    set $P111, $P1281["quantified_atom"]
    unless_null $P111, vivify_221
    new $P111, "Undef"
  vivify_221:
    if $P111, if_1280
.annotate 'line', 147
    get_hll_global $P113, ["PAST"], "Regex"
    find_lex $P1287, "$/"
    unless_null $P1287, vivify_222
    $P1287 = root_new ['parrot';'Hash']
  vivify_222:
    set $P114, $P1287["min"]
    unless_null $P114, vivify_223
    new $P114, "Undef"
  vivify_223:
    set $N100, $P114
    find_lex $P115, "$/"
    $P117 = $P113."new"("quant" :named("pasttype"), $N100 :named("min"), $P115 :named("node"))
    store_lex "$past", $P117
.annotate 'line', 148
    find_lex $P1289, "$/"
    unless_null $P1289, vivify_224
    $P1289 = root_new ['parrot';'Hash']
  vivify_224:
    set $P113, $P1289["max"]
    unless_null $P113, vivify_225
    new $P113, "Undef"
  vivify_225:
    isfalse $I100, $P113
    if $I100, if_1288
.annotate 'line', 149
    find_lex $P1292, "$/"
    unless_null $P1292, vivify_226
    $P1292 = root_new ['parrot';'Hash']
  vivify_226:
    set $P1293, $P1292["max"]
    unless_null $P1293, vivify_227
    $P1293 = root_new ['parrot';'ResizablePMCArray']
  vivify_227:
    set $P114, $P1293[0]
    unless_null $P114, vivify_228
    new $P114, "Undef"
  vivify_228:
    set $S100, $P114
    isne $I101, $S100, "*"
    unless $I101, if_1291_end
    find_lex $P115, "$past"
    find_lex $P1294, "$/"
    unless_null $P1294, vivify_229
    $P1294 = root_new ['parrot';'Hash']
  vivify_229:
    set $P1295, $P1294["max"]
    unless_null $P1295, vivify_230
    $P1295 = root_new ['parrot';'ResizablePMCArray']
  vivify_230:
    set $P117, $P1295[0]
    unless_null $P117, vivify_231
    new $P117, "Undef"
  vivify_231:
    set $N100, $P117
    $P115."max"($N100)
  if_1291_end:
    goto if_1288_end
  if_1288:
.annotate 'line', 148
    find_lex $P114, "$past"
    find_lex $P1290, "$/"
    unless_null $P1290, vivify_232
    $P1290 = root_new ['parrot';'Hash']
  vivify_232:
    set $P115, $P1290["min"]
    unless_null $P115, vivify_233
    new $P115, "Undef"
  vivify_233:
    set $N100, $P115
    $P114."max"($N100)
  if_1288_end:
.annotate 'line', 150
    find_lex $P113, "$ws"
    unless $P113, if_1296_end
    find_lex $P114, "$past"
    get_hll_global $P115, ["PAST"], "Regex"
    $P117 = $P115."new"("ws", "subrule" :named("pasttype"), "method" :named("subtype"))
    $P114."sep"($P117)
  if_1296_end:
.annotate 'line', 146
    goto if_1280_end
  if_1280:
.annotate 'line', 131
    .const 'Sub' $P1283 = "45_1309998845.12722" 
    capture_lex $P1283
    $P1283()
  if_1280_end:
.annotate 'line', 154
    find_lex $P111, "$/"
    find_lex $P112, "$past"
    find_lex $P1297, "$/"
    unless_null $P1297, vivify_236
    $P1297 = root_new ['parrot';'Hash']
  vivify_236:
    set $P113, $P1297["backmod"]
    unless_null $P113, vivify_237
    new $P113, "Undef"
  vivify_237:
    $P114 = "backmod"($P112, $P113)
    $P115 = $P111."!make"($P114)
.annotate 'line', 128
    .return ($P115)
  control_1271:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1282"  :anon :subid("45_1309998845.12722") :outer("44_1309998845.12722")
.annotate 'line', 132
    new $P112, "Undef"
    set $P1284, $P112
    .lex "$ast", $P1284
    find_lex $P1285, "$/"
    unless_null $P1285, vivify_234
    $P1285 = root_new ['parrot';'Hash']
  vivify_234:
    set $P113, $P1285["quantified_atom"]
    unless_null $P113, vivify_235
    new $P113, "Undef"
  vivify_235:
    $P114 = $P113."ast"()
    store_lex "$ast", $P114
.annotate 'line', 133
    find_lex $P113, "$ws"
    unless $P113, if_1286_end
.annotate 'line', 134
    get_hll_global $P114, ["PAST"], "Regex"
.annotate 'line', 136
    get_hll_global $P115, ["PAST"], "Regex"
    $P116 = $P115."new"("ws", "subrule" :named("pasttype"), "method" :named("subtype"))
    find_lex $P117, "$ast"
.annotate 'line', 139
    get_hll_global $P118, ["PAST"], "Regex"
    $P119 = $P118."new"("ws", "subrule" :named("pasttype"), "method" :named("subtype"))
    $P120 = $P114."new"($P116, $P117, $P119, "concat" :named("pasttype"))
.annotate 'line', 134
    store_lex "$ast", $P120
  if_1286_end:
.annotate 'line', 143
    get_hll_global $P113, ["PAST"], "Regex"
    find_lex $P114, "$ast"
    find_lex $P115, "$/"
    $P116 = $P113."new"("quant" :named("pasttype"), 1 :named("min"), $P114 :named("sep"), $P115 :named("node"))
    store_lex "$past", $P116
.annotate 'line', 131
    .return ($P116)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<ws>"  :subid("46_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1301
.annotate 'line', 157
    new $P1300, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1300, control_1299
    push_eh $P1300
    .lex "self", self
    .lex "$/", param_1301
.annotate 'line', 158
    new $P109, "Undef"
    set $P1302, $P109
    .lex "$past", $P1302
.annotate 'line', 159
    get_global $P1304, "@MODIFIERS"
    unless_null $P1304, vivify_238
    $P1304 = root_new ['parrot';'ResizablePMCArray']
  vivify_238:
    set $P1305, $P1304[0]
    unless_null $P1305, vivify_239
    $P1305 = root_new ['parrot';'Hash']
  vivify_239:
    set $P111, $P1305["s"]
    unless_null $P111, vivify_240
    new $P111, "Undef"
  vivify_240:
    if $P111, if_1303
    new $P115, "Integer"
    assign $P115, 0
    set $P110, $P115
    goto if_1303_end
  if_1303:
    get_hll_global $P112, ["PAST"], "Regex"
    find_lex $P113, "$/"
    $P114 = $P112."new"("ws", "subrule" :named("pasttype"), "method" :named("subtype"), $P113 :named("node"))
    set $P110, $P114
  if_1303_end:
    store_lex "$past", $P110
.annotate 'line', 162
    find_lex $P110, "$/"
    find_lex $P111, "$past"
    $P112 = $P110."!make"($P111)
.annotate 'line', 157
    .return ($P112)
  control_1299:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<[ ]>"  :subid("47_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1309
.annotate 'line', 166
    new $P1308, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1308, control_1307
    push_eh $P1308
    .lex "self", self
    .lex "$/", param_1309
.annotate 'line', 167
    find_lex $P109, "$/"
    find_lex $P1310, "$/"
    unless_null $P1310, vivify_241
    $P1310 = root_new ['parrot';'Hash']
  vivify_241:
    set $P110, $P1310["nibbler"]
    unless_null $P110, vivify_242
    new $P110, "Undef"
  vivify_242:
    $P111 = $P110."ast"()
    $P112 = $P109."!make"($P111)
.annotate 'line', 166
    .return ($P112)
  control_1307:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<( )>"  :subid("48_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1314
.annotate 'line', 170
    new $P1313, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1313, control_1312
    push_eh $P1313
    .lex "self", self
    .lex "$/", param_1314
.annotate 'line', 171
    new $P109, "Undef"
    set $P1315, $P109
    .lex "$subpast", $P1315
.annotate 'line', 172
    new $P110, "Undef"
    set $P1316, $P110
    .lex "$past", $P1316
.annotate 'line', 171
    find_lex $P1317, "$/"
    unless_null $P1317, vivify_243
    $P1317 = root_new ['parrot';'Hash']
  vivify_243:
    set $P111, $P1317["nibbler"]
    unless_null $P111, vivify_244
    new $P111, "Undef"
  vivify_244:
    $P112 = $P111."ast"()
    $P113 = "buildsub"($P112)
    store_lex "$subpast", $P113
.annotate 'line', 172
    get_hll_global $P111, ["PAST"], "Regex"
    find_lex $P112, "$subpast"
    find_lex $P113, "$/"
    $P114 = $P111."new"($P112, "subrule" :named("pasttype"), "capture" :named("subtype"), $P113 :named("node"))
    store_lex "$past", $P114
.annotate 'line', 174
    find_lex $P111, "$/"
    find_lex $P112, "$past"
    $P113 = $P111."!make"($P112)
.annotate 'line', 170
    .return ($P113)
  control_1312:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<'>"  :subid("49_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1321
.annotate 'line', 177
    new $P1320, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1320, control_1319
    push_eh $P1320
    .lex "self", self
    .lex "$/", param_1321
.annotate 'line', 178
    new $P109, "Undef"
    set $P1322, $P109
    .lex "$quote", $P1322
.annotate 'line', 180
    new $P110, "Undef"
    set $P1323, $P110
    .lex "$past", $P1323
.annotate 'line', 178
    find_lex $P1324, "$/"
    unless_null $P1324, vivify_245
    $P1324 = root_new ['parrot';'Hash']
  vivify_245:
    set $P111, $P1324["quote_EXPR"]
    unless_null $P111, vivify_246
    new $P111, "Undef"
  vivify_246:
    $P112 = $P111."ast"()
    store_lex "$quote", $P112
.annotate 'line', 179
    get_hll_global $P111, ["PAST"], "Val"
    find_lex $P112, "$quote"
    $P113 = $P111."ACCEPTS"($P112)
    unless $P113, if_1325_end
    find_lex $P114, "$quote"
    $P115 = $P114."value"()
    store_lex "$quote", $P115
  if_1325_end:
.annotate 'line', 180
    get_hll_global $P111, ["PAST"], "Regex"
    find_lex $P112, "$quote"
    find_lex $P113, "$/"
    $P114 = $P111."new"($P112, "literal" :named("pasttype"), $P113 :named("node"))
    store_lex "$past", $P114
.annotate 'line', 181
    get_global $P1327, "@MODIFIERS"
    unless_null $P1327, vivify_247
    $P1327 = root_new ['parrot';'ResizablePMCArray']
  vivify_247:
    set $P1328, $P1327[0]
    unless_null $P1328, vivify_248
    $P1328 = root_new ['parrot';'Hash']
  vivify_248:
    set $P111, $P1328["i"]
    unless_null $P111, vivify_249
    new $P111, "Undef"
  vivify_249:
    unless $P111, if_1326_end
    find_lex $P112, "$past"
    $P112."subtype"("ignorecase")
  if_1326_end:
.annotate 'line', 182
    find_lex $P111, "$/"
    find_lex $P112, "$past"
    $P113 = $P111."!make"($P112)
.annotate 'line', 177
    .return ($P113)
  control_1319:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<\">"  :subid("50_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1332
.annotate 'line', 185
    new $P1331, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1331, control_1330
    push_eh $P1331
    .lex "self", self
    .lex "$/", param_1332
.annotate 'line', 186
    new $P109, "Undef"
    set $P1333, $P109
    .lex "$quote", $P1333
.annotate 'line', 188
    new $P110, "Undef"
    set $P1334, $P110
    .lex "$past", $P1334
.annotate 'line', 186
    find_lex $P1335, "$/"
    unless_null $P1335, vivify_250
    $P1335 = root_new ['parrot';'Hash']
  vivify_250:
    set $P111, $P1335["quote_EXPR"]
    unless_null $P111, vivify_251
    new $P111, "Undef"
  vivify_251:
    $P112 = $P111."ast"()
    store_lex "$quote", $P112
.annotate 'line', 187
    get_hll_global $P111, ["PAST"], "Val"
    find_lex $P112, "$quote"
    $P113 = $P111."ACCEPTS"($P112)
    unless $P113, if_1336_end
    find_lex $P114, "$quote"
    $P115 = $P114."value"()
    store_lex "$quote", $P115
  if_1336_end:
.annotate 'line', 188
    get_hll_global $P111, ["PAST"], "Regex"
    find_lex $P112, "$quote"
    find_lex $P113, "$/"
    $P114 = $P111."new"($P112, "literal" :named("pasttype"), $P113 :named("node"))
    store_lex "$past", $P114
.annotate 'line', 189
    get_global $P1338, "@MODIFIERS"
    unless_null $P1338, vivify_252
    $P1338 = root_new ['parrot';'ResizablePMCArray']
  vivify_252:
    set $P1339, $P1338[0]
    unless_null $P1339, vivify_253
    $P1339 = root_new ['parrot';'Hash']
  vivify_253:
    set $P111, $P1339["i"]
    unless_null $P111, vivify_254
    new $P111, "Undef"
  vivify_254:
    unless $P111, if_1337_end
    find_lex $P112, "$past"
    $P112."subtype"("ignorecase")
  if_1337_end:
.annotate 'line', 190
    find_lex $P111, "$/"
    find_lex $P112, "$past"
    $P113 = $P111."!make"($P112)
.annotate 'line', 185
    .return ($P113)
  control_1330:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<.>"  :subid("51_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1343
.annotate 'line', 193
    new $P1342, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1342, control_1341
    push_eh $P1342
    .lex "self", self
    .lex "$/", param_1343
.annotate 'line', 194
    new $P109, "Undef"
    set $P1344, $P109
    .lex "$past", $P1344
    get_hll_global $P110, ["PAST"], "Regex"
    find_lex $P111, "$/"
    $P112 = $P110."new"("charclass" :named("pasttype"), "." :named("subtype"), $P111 :named("node"))
    store_lex "$past", $P112
.annotate 'line', 195
    find_lex $P110, "$/"
    find_lex $P111, "$past"
    $P112 = $P110."!make"($P111)
.annotate 'line', 193
    .return ($P112)
  control_1341:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<^>"  :subid("52_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1348
.annotate 'line', 198
    new $P1347, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1347, control_1346
    push_eh $P1347
    .lex "self", self
    .lex "$/", param_1348
.annotate 'line', 199
    new $P109, "Undef"
    set $P1349, $P109
    .lex "$past", $P1349
    get_hll_global $P110, ["PAST"], "Regex"
    find_lex $P111, "$/"
    $P112 = $P110."new"("anchor" :named("pasttype"), "bos" :named("subtype"), $P111 :named("node"))
    store_lex "$past", $P112
.annotate 'line', 200
    find_lex $P110, "$/"
    find_lex $P111, "$past"
    $P112 = $P110."!make"($P111)
.annotate 'line', 198
    .return ($P112)
  control_1346:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<^^>"  :subid("53_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1353
.annotate 'line', 203
    new $P1352, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1352, control_1351
    push_eh $P1352
    .lex "self", self
    .lex "$/", param_1353
.annotate 'line', 204
    new $P109, "Undef"
    set $P1354, $P109
    .lex "$past", $P1354
    get_hll_global $P110, ["PAST"], "Regex"
    find_lex $P111, "$/"
    $P112 = $P110."new"("anchor" :named("pasttype"), "bol" :named("subtype"), $P111 :named("node"))
    store_lex "$past", $P112
.annotate 'line', 205
    find_lex $P110, "$/"
    find_lex $P111, "$past"
    $P112 = $P110."!make"($P111)
.annotate 'line', 203
    .return ($P112)
  control_1351:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<$>"  :subid("54_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1358
.annotate 'line', 208
    new $P1357, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1357, control_1356
    push_eh $P1357
    .lex "self", self
    .lex "$/", param_1358
.annotate 'line', 209
    new $P109, "Undef"
    set $P1359, $P109
    .lex "$past", $P1359
    get_hll_global $P110, ["PAST"], "Regex"
    find_lex $P111, "$/"
    $P112 = $P110."new"("anchor" :named("pasttype"), "eos" :named("subtype"), $P111 :named("node"))
    store_lex "$past", $P112
.annotate 'line', 210
    find_lex $P110, "$/"
    find_lex $P111, "$past"
    $P112 = $P110."!make"($P111)
.annotate 'line', 208
    .return ($P112)
  control_1356:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<$$>"  :subid("55_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1363
.annotate 'line', 213
    new $P1362, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1362, control_1361
    push_eh $P1362
    .lex "self", self
    .lex "$/", param_1363
.annotate 'line', 214
    new $P109, "Undef"
    set $P1364, $P109
    .lex "$past", $P1364
    get_hll_global $P110, ["PAST"], "Regex"
    find_lex $P111, "$/"
    $P112 = $P110."new"("anchor" :named("pasttype"), "eol" :named("subtype"), $P111 :named("node"))
    store_lex "$past", $P112
.annotate 'line', 215
    find_lex $P110, "$/"
    find_lex $P111, "$past"
    $P112 = $P110."!make"($P111)
.annotate 'line', 213
    .return ($P112)
  control_1361:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<:::>"  :subid("56_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1368
.annotate 'line', 218
    new $P1367, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1367, control_1366
    push_eh $P1367
    .lex "self", self
    .lex "$/", param_1368
.annotate 'line', 219
    new $P109, "Undef"
    set $P1369, $P109
    .lex "$past", $P1369
    get_hll_global $P110, ["PAST"], "Regex"
    find_lex $P111, "$/"
    $P112 = $P110."new"("cut" :named("pasttype"), $P111 :named("node"))
    store_lex "$past", $P112
.annotate 'line', 220
    find_lex $P110, "$/"
    find_lex $P111, "$past"
    $P112 = $P110."!make"($P111)
.annotate 'line', 218
    .return ($P112)
  control_1366:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<lwb>"  :subid("57_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1373
.annotate 'line', 223
    new $P1372, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1372, control_1371
    push_eh $P1372
    .lex "self", self
    .lex "$/", param_1373
.annotate 'line', 224
    new $P109, "Undef"
    set $P1374, $P109
    .lex "$past", $P1374
    get_hll_global $P110, ["PAST"], "Regex"
    find_lex $P111, "$/"
    $P112 = $P110."new"("anchor" :named("pasttype"), "lwb" :named("subtype"), $P111 :named("node"))
    store_lex "$past", $P112
.annotate 'line', 225
    find_lex $P110, "$/"
    find_lex $P111, "$past"
    $P112 = $P110."!make"($P111)
.annotate 'line', 223
    .return ($P112)
  control_1371:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<rwb>"  :subid("58_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1378
.annotate 'line', 228
    new $P1377, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1377, control_1376
    push_eh $P1377
    .lex "self", self
    .lex "$/", param_1378
.annotate 'line', 229
    new $P109, "Undef"
    set $P1379, $P109
    .lex "$past", $P1379
    get_hll_global $P110, ["PAST"], "Regex"
    find_lex $P111, "$/"
    $P112 = $P110."new"("anchor" :named("pasttype"), "rwb" :named("subtype"), $P111 :named("node"))
    store_lex "$past", $P112
.annotate 'line', 230
    find_lex $P110, "$/"
    find_lex $P111, "$past"
    $P112 = $P110."!make"($P111)
.annotate 'line', 228
    .return ($P112)
  control_1376:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<bs>"  :subid("59_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1383
.annotate 'line', 233
    new $P1382, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1382, control_1381
    push_eh $P1382
    .lex "self", self
    .lex "$/", param_1383
.annotate 'line', 234
    find_lex $P109, "$/"
    find_lex $P1384, "$/"
    unless_null $P1384, vivify_255
    $P1384 = root_new ['parrot';'Hash']
  vivify_255:
    set $P110, $P1384["backslash"]
    unless_null $P110, vivify_256
    new $P110, "Undef"
  vivify_256:
    $P111 = $P110."ast"()
    $P112 = $P109."!make"($P111)
.annotate 'line', 233
    .return ($P112)
  control_1381:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<mod>"  :subid("60_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1388
.annotate 'line', 237
    new $P1387, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1387, control_1386
    push_eh $P1387
    .lex "self", self
    .lex "$/", param_1388
.annotate 'line', 238
    find_lex $P109, "$/"
    find_lex $P1389, "$/"
    unless_null $P1389, vivify_257
    $P1389 = root_new ['parrot';'Hash']
  vivify_257:
    set $P110, $P1389["mod_internal"]
    unless_null $P110, vivify_258
    new $P110, "Undef"
  vivify_258:
    $P111 = $P110."ast"()
    $P112 = $P109."!make"($P111)
.annotate 'line', 237
    .return ($P112)
  control_1386:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<assert>"  :subid("61_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1393
.annotate 'line', 241
    new $P1392, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1392, control_1391
    push_eh $P1392
    .lex "self", self
    .lex "$/", param_1393
.annotate 'line', 242
    find_lex $P109, "$/"
    find_lex $P1394, "$/"
    unless_null $P1394, vivify_259
    $P1394 = root_new ['parrot';'Hash']
  vivify_259:
    set $P110, $P1394["assertion"]
    unless_null $P110, vivify_260
    new $P110, "Undef"
  vivify_260:
    $P111 = $P110."ast"()
    $P112 = $P109."!make"($P111)
.annotate 'line', 241
    .return ($P112)
  control_1391:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<~>"  :subid("62_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1398
.annotate 'line', 245
    new $P1397, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1397, control_1396
    push_eh $P1397
    .lex "self", self
    .lex "$/", param_1398
.annotate 'line', 246
    find_lex $P109, "$/"
    get_hll_global $P110, ["PAST"], "Regex"
.annotate 'line', 247
    find_lex $P1399, "$/"
    unless_null $P1399, vivify_261
    $P1399 = root_new ['parrot';'Hash']
  vivify_261:
    set $P111, $P1399["EXPR"]
    unless_null $P111, vivify_262
    new $P111, "Undef"
  vivify_262:
    $P112 = $P111."ast"()
.annotate 'line', 248
    get_hll_global $P113, ["PAST"], "Regex"
.annotate 'line', 249
    find_lex $P1400, "$/"
    unless_null $P1400, vivify_263
    $P1400 = root_new ['parrot';'Hash']
  vivify_263:
    set $P114, $P1400["GOAL"]
    unless_null $P114, vivify_264
    new $P114, "Undef"
  vivify_264:
    $P115 = $P114."ast"()
.annotate 'line', 250
    get_hll_global $P116, ["PAST"], "Regex"
    find_lex $P1401, "$/"
    unless_null $P1401, vivify_265
    $P1401 = root_new ['parrot';'Hash']
  vivify_265:
    set $P117, $P1401["GOAL"]
    unless_null $P117, vivify_266
    new $P117, "Undef"
  vivify_266:
    set $S100, $P117
    $P118 = $P116."new"("FAILGOAL", $S100, "subrule" :named("pasttype"), "method" :named("subtype"))
    $P119 = $P113."new"($P115, $P118, "alt" :named("pasttype"))
.annotate 'line', 248
    $P120 = $P110."new"($P112, $P119, "concat" :named("pasttype"))
.annotate 'line', 246
    $P121 = $P109."!make"($P120)
.annotate 'line', 245
    .return ($P121)
  control_1396:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<{*}>"  :subid("63_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1405
.annotate 'line', 258
    new $P1404, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1404, control_1403
    push_eh $P1404
    .lex "self", self
    .lex "$/", param_1405
.annotate 'line', 259
    new $P109, "Undef"
    set $P1406, $P109
    .lex "$past", $P1406
.annotate 'line', 260
    find_lex $P1408, "$/"
    unless_null $P1408, vivify_267
    $P1408 = root_new ['parrot';'Hash']
  vivify_267:
    set $P111, $P1408["key"]
    unless_null $P111, vivify_268
    new $P111, "Undef"
  vivify_268:
    if $P111, if_1407
    new $P116, "Integer"
    assign $P116, 0
    set $P110, $P116
    goto if_1407_end
  if_1407:
    get_hll_global $P112, ["PAST"], "Regex"
    find_lex $P1409, "$/"
    unless_null $P1409, vivify_269
    $P1409 = root_new ['parrot';'Hash']
  vivify_269:
    set $P1410, $P1409["key"]
    unless_null $P1410, vivify_270
    $P1410 = root_new ['parrot';'ResizablePMCArray']
  vivify_270:
    set $P113, $P1410[0]
    unless_null $P113, vivify_271
    new $P113, "Undef"
  vivify_271:
    set $S100, $P113
    find_lex $P114, "$/"
    $P115 = $P112."new"($S100, "reduce" :named("pasttype"), $P114 :named("node"))
    set $P110, $P115
  if_1407_end:
    store_lex "$past", $P110
.annotate 'line', 262
    find_lex $P110, "$/"
    find_lex $P111, "$past"
    $P112 = $P110."!make"($P111)
.annotate 'line', 258
    .return ($P112)
  control_1403:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<var>"  :subid("64_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1414
.annotate 'line', 265
    new $P1413, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1413, control_1412
    push_eh $P1413
    .lex "self", self
    .lex "$/", param_1414
.annotate 'line', 266
    new $P109, "Undef"
    set $P1415, $P109
    .lex "$past", $P1415
.annotate 'line', 267
    new $P110, "Undef"
    set $P1416, $P110
    .lex "$name", $P1416
.annotate 'line', 265
    find_lex $P111, "$past"
.annotate 'line', 267
    find_lex $P1418, "$/"
    unless_null $P1418, vivify_272
    $P1418 = root_new ['parrot';'Hash']
  vivify_272:
    set $P112, $P1418["pos"]
    unless_null $P112, vivify_273
    new $P112, "Undef"
  vivify_273:
    if $P112, if_1417
    find_lex $P1420, "$/"
    unless_null $P1420, vivify_274
    $P1420 = root_new ['parrot';'Hash']
  vivify_274:
    set $P114, $P1420["name"]
    unless_null $P114, vivify_275
    new $P114, "Undef"
  vivify_275:
    set $S100, $P114
    new $P111, 'String'
    set $P111, $S100
    goto if_1417_end
  if_1417:
    find_lex $P1419, "$/"
    unless_null $P1419, vivify_276
    $P1419 = root_new ['parrot';'Hash']
  vivify_276:
    set $P113, $P1419["pos"]
    unless_null $P113, vivify_277
    new $P113, "Undef"
  vivify_277:
    set $N100, $P113
    new $P111, 'Float'
    set $P111, $N100
  if_1417_end:
    store_lex "$name", $P111
.annotate 'line', 268
    find_lex $P1422, "$/"
    unless_null $P1422, vivify_278
    $P1422 = root_new ['parrot';'Hash']
  vivify_278:
    set $P111, $P1422["quantified_atom"]
    unless_null $P111, vivify_279
    new $P111, "Undef"
  vivify_279:
    if $P111, if_1421
.annotate 'line', 279
    get_hll_global $P112, ["PAST"], "Regex"
    find_lex $P113, "$name"
    find_lex $P114, "$/"
    $P115 = $P112."new"("!BACKREF", $P113, "subrule" :named("pasttype"), "method" :named("subtype"), $P114 :named("node"))
    store_lex "$past", $P115
.annotate 'line', 278
    goto if_1421_end
  if_1421:
.annotate 'line', 269
    find_lex $P1423, "$/"
    unless_null $P1423, vivify_280
    $P1423 = root_new ['parrot';'Hash']
  vivify_280:
    set $P1424, $P1423["quantified_atom"]
    unless_null $P1424, vivify_281
    $P1424 = root_new ['parrot';'ResizablePMCArray']
  vivify_281:
    set $P112, $P1424[0]
    unless_null $P112, vivify_282
    new $P112, "Undef"
  vivify_282:
    $P113 = $P112."ast"()
    store_lex "$past", $P113
.annotate 'line', 270
    find_lex $P113, "$past"
    $S100 = $P113."pasttype"()
    iseq $I100, $S100, "quant"
    if $I100, if_1426
    new $P112, 'Integer'
    set $P112, $I100
    goto if_1426_end
  if_1426:
    find_lex $P1427, "$past"
    unless_null $P1427, vivify_283
    $P1427 = root_new ['parrot';'ResizablePMCArray']
  vivify_283:
    set $P114, $P1427[0]
    unless_null $P114, vivify_284
    new $P114, "Undef"
  vivify_284:
    $S101 = $P114."pasttype"()
    iseq $I101, $S101, "subrule"
    new $P112, 'Integer'
    set $P112, $I101
  if_1426_end:
    if $P112, if_1425
.annotate 'line', 273
    find_lex $P115, "$past"
    $S102 = $P115."pasttype"()
    iseq $I102, $S102, "subrule"
    if $I102, if_1429
.annotate 'line', 275
    get_hll_global $P116, ["PAST"], "Regex"
    find_lex $P117, "$past"
    find_lex $P118, "$name"
    find_lex $P119, "$/"
    $P120 = $P116."new"($P117, $P118 :named("name"), "subcapture" :named("pasttype"), $P119 :named("node"))
    store_lex "$past", $P120
.annotate 'line', 274
    goto if_1429_end
  if_1429:
.annotate 'line', 273
    find_lex $P116, "self"
    find_lex $P117, "$past"
    find_lex $P118, "$name"
    $P116."subrule_alias"($P117, $P118)
  if_1429_end:
    goto if_1425_end
  if_1425:
.annotate 'line', 271
    find_lex $P115, "self"
    find_lex $P1428, "$past"
    unless_null $P1428, vivify_285
    $P1428 = root_new ['parrot';'ResizablePMCArray']
  vivify_285:
    set $P116, $P1428[0]
    unless_null $P116, vivify_286
    new $P116, "Undef"
  vivify_286:
    find_lex $P117, "$name"
    $P115."subrule_alias"($P116, $P117)
  if_1425_end:
  if_1421_end:
.annotate 'line', 282
    find_lex $P111, "$/"
    find_lex $P112, "$past"
    $P113 = $P111."!make"($P112)
.annotate 'line', 265
    .return ($P113)
  control_1412:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "metachar:sym<PIR>"  :subid("65_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1433
.annotate 'line', 285
    new $P1432, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1432, control_1431
    push_eh $P1432
    .lex "self", self
    .lex "$/", param_1433
.annotate 'line', 286
    find_lex $P109, "$/"
    get_hll_global $P110, ["PAST"], "Regex"
.annotate 'line', 287
    get_hll_global $P111, ["PAST"], "Op"
    find_lex $P1434, "$/"
    unless_null $P1434, vivify_287
    $P1434 = root_new ['parrot';'Hash']
  vivify_287:
    set $P112, $P1434["pir"]
    unless_null $P112, vivify_288
    new $P112, "Undef"
  vivify_288:
    set $S100, $P112
    $P113 = $P111."new"($S100 :named("inline"), "inline" :named("pasttype"))
    find_lex $P114, "$/"
    $P115 = $P110."new"($P113, "pastnode" :named("pasttype"), $P114 :named("node"))
.annotate 'line', 286
    $P116 = $P109."!make"($P115)
.annotate 'line', 285
    .return ($P116)
  control_1431:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<w>"  :subid("66_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1438
.annotate 'line', 293
    new $P1437, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1437, control_1436
    push_eh $P1437
    .lex "self", self
    .lex "$/", param_1438
.annotate 'line', 294
    new $P109, "Undef"
    set $P1439, $P109
    .lex "$subtype", $P1439
.annotate 'line', 295
    new $P110, "Undef"
    set $P1440, $P110
    .lex "$past", $P1440
.annotate 'line', 294
    find_lex $P1442, "$/"
    unless_null $P1442, vivify_289
    $P1442 = root_new ['parrot';'Hash']
  vivify_289:
    set $P112, $P1442["sym"]
    unless_null $P112, vivify_290
    new $P112, "Undef"
  vivify_290:
    set $S100, $P112
    iseq $I100, $S100, "n"
    if $I100, if_1441
    find_lex $P1443, "$/"
    unless_null $P1443, vivify_291
    $P1443 = root_new ['parrot';'Hash']
  vivify_291:
    set $P114, $P1443["sym"]
    unless_null $P114, vivify_292
    new $P114, "Undef"
  vivify_292:
    set $S101, $P114
    new $P111, 'String'
    set $P111, $S101
    goto if_1441_end
  if_1441:
    new $P113, "String"
    assign $P113, "nl"
    set $P111, $P113
  if_1441_end:
    store_lex "$subtype", $P111
.annotate 'line', 295
    get_hll_global $P111, ["PAST"], "Regex"
    find_lex $P112, "$subtype"
    find_lex $P113, "$/"
    $P114 = $P111."new"("charclass" :named("pasttype"), $P112 :named("subtype"), $P113 :named("node"))
    store_lex "$past", $P114
.annotate 'line', 296
    find_lex $P111, "$/"
    find_lex $P112, "$past"
    $P113 = $P111."!make"($P112)
.annotate 'line', 293
    .return ($P113)
  control_1436:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<b>"  :subid("67_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1447
.annotate 'line', 299
    new $P1446, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1446, control_1445
    push_eh $P1446
    .lex "self", self
    .lex "$/", param_1447
.annotate 'line', 300
    new $P109, "Undef"
    set $P1448, $P109
    .lex "$past", $P1448
    get_hll_global $P110, ["PAST"], "Regex"
.annotate 'line', 301
    find_lex $P1449, "$/"
    unless_null $P1449, vivify_293
    $P1449 = root_new ['parrot';'Hash']
  vivify_293:
    set $P111, $P1449["sym"]
    unless_null $P111, vivify_294
    new $P111, "Undef"
  vivify_294:
    set $S100, $P111
    iseq $I100, $S100, "B"
.annotate 'line', 300
    find_lex $P112, "$/"
    $P113 = $P110."new"("\b", "enumcharlist" :named("pasttype"), $I100 :named("negate"), $P112 :named("node"))
    store_lex "$past", $P113
.annotate 'line', 302
    find_lex $P110, "$/"
    find_lex $P111, "$past"
    $P112 = $P110."!make"($P111)
.annotate 'line', 299
    .return ($P112)
  control_1445:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<e>"  :subid("68_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1453
.annotate 'line', 305
    new $P1452, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1452, control_1451
    push_eh $P1452
    .lex "self", self
    .lex "$/", param_1453
.annotate 'line', 306
    new $P109, "Undef"
    set $P1454, $P109
    .lex "$past", $P1454
    get_hll_global $P110, ["PAST"], "Regex"
.annotate 'line', 307
    find_lex $P1455, "$/"
    unless_null $P1455, vivify_295
    $P1455 = root_new ['parrot';'Hash']
  vivify_295:
    set $P111, $P1455["sym"]
    unless_null $P111, vivify_296
    new $P111, "Undef"
  vivify_296:
    set $S100, $P111
    iseq $I100, $S100, "E"
.annotate 'line', 306
    find_lex $P112, "$/"
    $P113 = $P110."new"("\e", "enumcharlist" :named("pasttype"), $I100 :named("negate"), $P112 :named("node"))
    store_lex "$past", $P113
.annotate 'line', 308
    find_lex $P110, "$/"
    find_lex $P111, "$past"
    $P112 = $P110."!make"($P111)
.annotate 'line', 305
    .return ($P112)
  control_1451:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<f>"  :subid("69_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1459
.annotate 'line', 311
    new $P1458, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1458, control_1457
    push_eh $P1458
    .lex "self", self
    .lex "$/", param_1459
.annotate 'line', 312
    new $P109, "Undef"
    set $P1460, $P109
    .lex "$past", $P1460
    get_hll_global $P110, ["PAST"], "Regex"
.annotate 'line', 313
    find_lex $P1461, "$/"
    unless_null $P1461, vivify_297
    $P1461 = root_new ['parrot';'Hash']
  vivify_297:
    set $P111, $P1461["sym"]
    unless_null $P111, vivify_298
    new $P111, "Undef"
  vivify_298:
    set $S100, $P111
    iseq $I100, $S100, "F"
.annotate 'line', 312
    find_lex $P112, "$/"
    $P113 = $P110."new"("\f", "enumcharlist" :named("pasttype"), $I100 :named("negate"), $P112 :named("node"))
    store_lex "$past", $P113
.annotate 'line', 314
    find_lex $P110, "$/"
    find_lex $P111, "$past"
    $P112 = $P110."!make"($P111)
.annotate 'line', 311
    .return ($P112)
  control_1457:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<h>"  :subid("70_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1465
.annotate 'line', 317
    new $P1464, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1464, control_1463
    push_eh $P1464
    .lex "self", self
    .lex "$/", param_1465
.annotate 'line', 318
    new $P109, "Undef"
    set $P1466, $P109
    .lex "$past", $P1466
    get_hll_global $P110, ["PAST"], "Regex"
.annotate 'line', 319
    find_lex $P1467, "$/"
    unless_null $P1467, vivify_299
    $P1467 = root_new ['parrot';'Hash']
  vivify_299:
    set $P111, $P1467["sym"]
    unless_null $P111, vivify_300
    new $P111, "Undef"
  vivify_300:
    set $S100, $P111
    iseq $I100, $S100, "H"
.annotate 'line', 318
    find_lex $P112, "$/"
    $P113 = $P110."new"(unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", "enumcharlist" :named("pasttype"), $I100 :named("negate"), $P112 :named("node"))
    store_lex "$past", $P113
.annotate 'line', 320
    find_lex $P110, "$/"
    find_lex $P111, "$past"
    $P112 = $P110."!make"($P111)
.annotate 'line', 317
    .return ($P112)
  control_1463:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<r>"  :subid("71_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1471
.annotate 'line', 323
    new $P1470, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1470, control_1469
    push_eh $P1470
    .lex "self", self
    .lex "$/", param_1471
.annotate 'line', 324
    new $P109, "Undef"
    set $P1472, $P109
    .lex "$past", $P1472
    get_hll_global $P110, ["PAST"], "Regex"
.annotate 'line', 325
    find_lex $P1473, "$/"
    unless_null $P1473, vivify_301
    $P1473 = root_new ['parrot';'Hash']
  vivify_301:
    set $P111, $P1473["sym"]
    unless_null $P111, vivify_302
    new $P111, "Undef"
  vivify_302:
    set $S100, $P111
    iseq $I100, $S100, "R"
.annotate 'line', 324
    find_lex $P112, "$/"
    $P113 = $P110."new"("\r", "enumcharlist" :named("pasttype"), $I100 :named("negate"), $P112 :named("node"))
    store_lex "$past", $P113
.annotate 'line', 326
    find_lex $P110, "$/"
    find_lex $P111, "$past"
    $P112 = $P110."!make"($P111)
.annotate 'line', 323
    .return ($P112)
  control_1469:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<t>"  :subid("72_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1477
.annotate 'line', 329
    new $P1476, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1476, control_1475
    push_eh $P1476
    .lex "self", self
    .lex "$/", param_1477
.annotate 'line', 330
    new $P109, "Undef"
    set $P1478, $P109
    .lex "$past", $P1478
    get_hll_global $P110, ["PAST"], "Regex"
.annotate 'line', 331
    find_lex $P1479, "$/"
    unless_null $P1479, vivify_303
    $P1479 = root_new ['parrot';'Hash']
  vivify_303:
    set $P111, $P1479["sym"]
    unless_null $P111, vivify_304
    new $P111, "Undef"
  vivify_304:
    set $S100, $P111
    iseq $I100, $S100, "T"
.annotate 'line', 330
    find_lex $P112, "$/"
    $P113 = $P110."new"("\t", "enumcharlist" :named("pasttype"), $I100 :named("negate"), $P112 :named("node"))
    store_lex "$past", $P113
.annotate 'line', 332
    find_lex $P110, "$/"
    find_lex $P111, "$past"
    $P112 = $P110."!make"($P111)
.annotate 'line', 329
    .return ($P112)
  control_1475:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<v>"  :subid("73_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1483
.annotate 'line', 335
    new $P1482, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1482, control_1481
    push_eh $P1482
    .lex "self", self
    .lex "$/", param_1483
.annotate 'line', 336
    new $P109, "Undef"
    set $P1484, $P109
    .lex "$past", $P1484
    get_hll_global $P110, ["PAST"], "Regex"
.annotate 'line', 338
    find_lex $P1485, "$/"
    unless_null $P1485, vivify_305
    $P1485 = root_new ['parrot';'Hash']
  vivify_305:
    set $P111, $P1485["sym"]
    unless_null $P111, vivify_306
    new $P111, "Undef"
  vivify_306:
    set $S100, $P111
    iseq $I100, $S100, "V"
.annotate 'line', 336
    find_lex $P112, "$/"
    $P113 = $P110."new"(unicode:"\n\x{b}\f\r\x{85}\u2028\u2029", "enumcharlist" :named("pasttype"), $I100 :named("negate"), $P112 :named("node"))
    store_lex "$past", $P113
.annotate 'line', 339
    find_lex $P110, "$/"
    find_lex $P111, "$past"
    $P112 = $P110."!make"($P111)
.annotate 'line', 335
    .return ($P112)
  control_1481:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<o>"  :subid("74_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1489
.annotate 'line', 342
    new $P1488, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1488, control_1487
    push_eh $P1488
    .lex "self", self
    .lex "$/", param_1489
.annotate 'line', 343
    new $P109, "Undef"
    set $P1490, $P109
    .lex "$octlit", $P1490
.annotate 'line', 344
    get_hll_global $P110, ["HLL";"Actions"], "ints_to_string"
    find_lex $P1492, "$/"
    unless_null $P1492, vivify_307
    $P1492 = root_new ['parrot';'Hash']
  vivify_307:
    set $P112, $P1492["octint"]
    unless_null $P112, vivify_308
    new $P112, "Undef"
  vivify_308:
    unless $P112, unless_1491
    set $P111, $P112
    goto unless_1491_end
  unless_1491:
    find_lex $P1493, "$/"
    unless_null $P1493, vivify_309
    $P1493 = root_new ['parrot';'Hash']
  vivify_309:
    set $P1494, $P1493["octints"]
    unless_null $P1494, vivify_310
    $P1494 = root_new ['parrot';'Hash']
  vivify_310:
    set $P113, $P1494["octint"]
    unless_null $P113, vivify_311
    new $P113, "Undef"
  vivify_311:
    set $P111, $P113
  unless_1491_end:
    $P114 = $P110($P111)
    store_lex "$octlit", $P114
.annotate 'line', 345
    find_lex $P110, "$/"
    find_lex $P1496, "$/"
    unless_null $P1496, vivify_312
    $P1496 = root_new ['parrot';'Hash']
  vivify_312:
    set $P112, $P1496["sym"]
    unless_null $P112, vivify_313
    new $P112, "Undef"
  vivify_313:
    set $S100, $P112
    iseq $I100, $S100, "O"
    if $I100, if_1495
.annotate 'line', 348
    get_hll_global $P117, ["PAST"], "Regex"
    find_lex $P118, "$octlit"
    find_lex $P119, "$/"
    $P120 = $P117."new"($P118, "literal" :named("pasttype"), $P119 :named("node"))
    set $P111, $P120
.annotate 'line', 345
    goto if_1495_end
  if_1495:
.annotate 'line', 346
    get_hll_global $P113, ["PAST"], "Regex"
    find_lex $P114, "$octlit"
    find_lex $P115, "$/"
    $P116 = $P113."new"($P114, "enumcharlist" :named("pasttype"), 1 :named("negate"), $P115 :named("node"))
    set $P111, $P116
  if_1495_end:
    $P121 = $P110."!make"($P111)
.annotate 'line', 342
    .return ($P121)
  control_1487:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<x>"  :subid("75_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1500
.annotate 'line', 351
    new $P1499, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1499, control_1498
    push_eh $P1499
    .lex "self", self
    .lex "$/", param_1500
.annotate 'line', 352
    new $P109, "Undef"
    set $P1501, $P109
    .lex "$hexlit", $P1501
.annotate 'line', 353
    get_hll_global $P110, ["HLL";"Actions"], "ints_to_string"
    find_lex $P1503, "$/"
    unless_null $P1503, vivify_314
    $P1503 = root_new ['parrot';'Hash']
  vivify_314:
    set $P112, $P1503["hexint"]
    unless_null $P112, vivify_315
    new $P112, "Undef"
  vivify_315:
    unless $P112, unless_1502
    set $P111, $P112
    goto unless_1502_end
  unless_1502:
    find_lex $P1504, "$/"
    unless_null $P1504, vivify_316
    $P1504 = root_new ['parrot';'Hash']
  vivify_316:
    set $P1505, $P1504["hexints"]
    unless_null $P1505, vivify_317
    $P1505 = root_new ['parrot';'Hash']
  vivify_317:
    set $P113, $P1505["hexint"]
    unless_null $P113, vivify_318
    new $P113, "Undef"
  vivify_318:
    set $P111, $P113
  unless_1502_end:
    $P114 = $P110($P111)
    store_lex "$hexlit", $P114
.annotate 'line', 354
    find_lex $P110, "$/"
    find_lex $P1507, "$/"
    unless_null $P1507, vivify_319
    $P1507 = root_new ['parrot';'Hash']
  vivify_319:
    set $P112, $P1507["sym"]
    unless_null $P112, vivify_320
    new $P112, "Undef"
  vivify_320:
    set $S100, $P112
    iseq $I100, $S100, "X"
    if $I100, if_1506
.annotate 'line', 357
    get_hll_global $P117, ["PAST"], "Regex"
    find_lex $P118, "$hexlit"
    find_lex $P119, "$/"
    $P120 = $P117."new"($P118, "literal" :named("pasttype"), $P119 :named("node"))
    set $P111, $P120
.annotate 'line', 354
    goto if_1506_end
  if_1506:
.annotate 'line', 355
    get_hll_global $P113, ["PAST"], "Regex"
    find_lex $P114, "$hexlit"
    find_lex $P115, "$/"
    $P116 = $P113."new"($P114, "enumcharlist" :named("pasttype"), 1 :named("negate"), $P115 :named("node"))
    set $P111, $P116
  if_1506_end:
    $P121 = $P110."!make"($P111)
.annotate 'line', 351
    .return ($P121)
  control_1498:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<c>"  :subid("76_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1511
.annotate 'line', 360
    new $P1510, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1510, control_1509
    push_eh $P1510
    .lex "self", self
    .lex "$/", param_1511
.annotate 'line', 361
    find_lex $P109, "$/"
    get_hll_global $P110, ["PAST"], "Regex"
    find_lex $P1512, "$/"
    unless_null $P1512, vivify_321
    $P1512 = root_new ['parrot';'Hash']
  vivify_321:
    set $P111, $P1512["charspec"]
    unless_null $P111, vivify_322
    new $P111, "Undef"
  vivify_322:
    $P112 = $P111."ast"()
    find_lex $P113, "$/"
    $P114 = $P110."new"($P112, "literal" :named("pasttype"), $P113 :named("node"))
    $P115 = $P109."!make"($P114)
.annotate 'line', 360
    .return ($P115)
  control_1509:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "backslash:sym<misc>"  :subid("77_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1516
.annotate 'line', 364
    new $P1515, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1515, control_1514
    push_eh $P1515
    .lex "self", self
    .lex "$/", param_1516
.annotate 'line', 365
    new $P109, "Undef"
    set $P1517, $P109
    .lex "$past", $P1517
    get_hll_global $P110, ["PAST"], "Regex"
    find_lex $P111, "$/"
    set $S100, $P111
    find_lex $P112, "$/"
    $P113 = $P110."new"($S100, "literal" :named("pasttype"), $P112 :named("node"))
    store_lex "$past", $P113
.annotate 'line', 366
    find_lex $P110, "$/"
    find_lex $P111, "$past"
    $P112 = $P110."!make"($P111)
.annotate 'line', 364
    .return ($P112)
  control_1514:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "assertion:sym<?>"  :subid("78_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1521
.annotate 'line', 370
    new $P1520, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1520, control_1519
    push_eh $P1520
    .lex "self", self
    .lex "$/", param_1521
.annotate 'line', 371
    new $P109, "Undef"
    set $P1522, $P109
    .lex "$past", $P1522
.annotate 'line', 370
    find_lex $P110, "$past"
.annotate 'line', 372
    find_lex $P1524, "$/"
    unless_null $P1524, vivify_323
    $P1524 = root_new ['parrot';'Hash']
  vivify_323:
    set $P110, $P1524["assertion"]
    unless_null $P110, vivify_324
    new $P110, "Undef"
  vivify_324:
    if $P110, if_1523
.annotate 'line', 376
    new $P111, "Integer"
    assign $P111, 0
    store_lex "$past", $P111
    goto if_1523_end
  if_1523:
.annotate 'line', 373
    find_lex $P1525, "$/"
    unless_null $P1525, vivify_325
    $P1525 = root_new ['parrot';'Hash']
  vivify_325:
    set $P111, $P1525["assertion"]
    unless_null $P111, vivify_326
    new $P111, "Undef"
  vivify_326:
    $P112 = $P111."ast"()
    store_lex "$past", $P112
.annotate 'line', 374
    find_lex $P111, "$past"
    $P111."subtype"("zerowidth")
  if_1523_end:
.annotate 'line', 377
    find_lex $P110, "$/"
    find_lex $P111, "$past"
    $P112 = $P110."!make"($P111)
.annotate 'line', 370
    .return ($P112)
  control_1519:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "assertion:sym<!>"  :subid("79_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1529
.annotate 'line', 380
    new $P1528, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1528, control_1527
    push_eh $P1528
    .lex "self", self
    .lex "$/", param_1529
.annotate 'line', 381
    new $P109, "Undef"
    set $P1530, $P109
    .lex "$past", $P1530
.annotate 'line', 380
    find_lex $P110, "$past"
.annotate 'line', 382
    find_lex $P1532, "$/"
    unless_null $P1532, vivify_327
    $P1532 = root_new ['parrot';'Hash']
  vivify_327:
    set $P110, $P1532["assertion"]
    unless_null $P110, vivify_328
    new $P110, "Undef"
  vivify_328:
    if $P110, if_1531
.annotate 'line', 388
    get_hll_global $P111, ["PAST"], "Regex"
    find_lex $P112, "$/"
    $P113 = $P111."new"("anchor" :named("pasttype"), "fail" :named("subtype"), $P112 :named("node"))
    store_lex "$past", $P113
.annotate 'line', 387
    goto if_1531_end
  if_1531:
.annotate 'line', 383
    find_lex $P1533, "$/"
    unless_null $P1533, vivify_329
    $P1533 = root_new ['parrot';'Hash']
  vivify_329:
    set $P111, $P1533["assertion"]
    unless_null $P111, vivify_330
    new $P111, "Undef"
  vivify_330:
    $P112 = $P111."ast"()
    store_lex "$past", $P112
.annotate 'line', 384
    find_lex $P111, "$past"
    find_lex $P112, "$past"
    $P113 = $P112."negate"()
    isfalse $I100, $P113
    $P111."negate"($I100)
.annotate 'line', 385
    find_lex $P111, "$past"
    $P111."subtype"("zerowidth")
  if_1531_end:
.annotate 'line', 390
    find_lex $P110, "$/"
    find_lex $P111, "$past"
    $P112 = $P110."!make"($P111)
.annotate 'line', 380
    .return ($P112)
  control_1527:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "assertion:sym<method>"  :subid("80_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1537
.annotate 'line', 393
    new $P1536, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1536, control_1535
    push_eh $P1536
    .lex "self", self
    .lex "$/", param_1537
.annotate 'line', 394
    new $P109, "Undef"
    set $P1538, $P109
    .lex "$past", $P1538
    find_lex $P1539, "$/"
    unless_null $P1539, vivify_331
    $P1539 = root_new ['parrot';'Hash']
  vivify_331:
    set $P110, $P1539["assertion"]
    unless_null $P110, vivify_332
    new $P110, "Undef"
  vivify_332:
    $P111 = $P110."ast"()
    store_lex "$past", $P111
.annotate 'line', 395
    find_lex $P110, "$past"
    $P110."subtype"("method")
.annotate 'line', 396
    find_lex $P110, "$past"
    $P110."name"("")
.annotate 'line', 397
    find_lex $P110, "$/"
    find_lex $P111, "$past"
    $P112 = $P110."!make"($P111)
.annotate 'line', 393
    .return ($P112)
  control_1535:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "assertion:sym<name>"  :subid("81_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1543
.annotate 'line', 400
    .const 'Sub' $P1565 = "83_1309998845.12722" 
    capture_lex $P1565
    .const 'Sub' $P1553 = "82_1309998845.12722" 
    capture_lex $P1553
    new $P1542, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1542, control_1541
    push_eh $P1542
    .lex "self", self
    .lex "$/", param_1543
.annotate 'line', 401
    new $P109, "Undef"
    set $P1544, $P109
    .lex "$name", $P1544
.annotate 'line', 402
    new $P110, "Undef"
    set $P1545, $P110
    .lex "$past", $P1545
.annotate 'line', 401
    find_lex $P1546, "$/"
    unless_null $P1546, vivify_333
    $P1546 = root_new ['parrot';'Hash']
  vivify_333:
    set $P111, $P1546["longname"]
    unless_null $P111, vivify_334
    new $P111, "Undef"
  vivify_334:
    set $S100, $P111
    new $P112, 'String'
    set $P112, $S100
    store_lex "$name", $P112
.annotate 'line', 400
    find_lex $P111, "$past"
.annotate 'line', 403
    find_lex $P1548, "$/"
    unless_null $P1548, vivify_335
    $P1548 = root_new ['parrot';'Hash']
  vivify_335:
    set $P111, $P1548["assertion"]
    unless_null $P111, vivify_336
    new $P111, "Undef"
  vivify_336:
    if $P111, if_1547
.annotate 'line', 407
    find_lex $P112, "$name"
    set $S100, $P112
    iseq $I100, $S100, "sym"
    if $I100, if_1551
.annotate 'line', 423
    find_lex $P114, "self"
    find_lex $P115, "$/"
    $P116 = $P114."named_assertion"($P115)
    store_lex "$past", $P116
.annotate 'line', 424
    find_lex $P1557, "$/"
    unless_null $P1557, vivify_337
    $P1557 = root_new ['parrot';'Hash']
  vivify_337:
    set $P114, $P1557["nibbler"]
    unless_null $P114, vivify_338
    new $P114, "Undef"
  vivify_338:
    if $P114, if_1556
.annotate 'line', 427
    find_lex $P1561, "$/"
    unless_null $P1561, vivify_339
    $P1561 = root_new ['parrot';'Hash']
  vivify_339:
    set $P115, $P1561["arglist"]
    unless_null $P115, vivify_340
    new $P115, "Undef"
  vivify_340:
    unless $P115, if_1560_end
.annotate 'line', 428
    find_lex $P1562, "$/"
    unless_null $P1562, vivify_341
    $P1562 = root_new ['parrot';'Hash']
  vivify_341:
    set $P1563, $P1562["arglist"]
    unless_null $P1563, vivify_342
    $P1563 = root_new ['parrot';'ResizablePMCArray']
  vivify_342:
    set $P117, $P1563[0]
    unless_null $P117, vivify_343
    new $P117, "Undef"
  vivify_343:
    $P118 = $P117."ast"()
    $P119 = $P118."list"()
    defined $I101, $P119
    unless $I101, for_undef_344
    iter $P116, $P119
    new $P122, 'ExceptionHandler'
    set_label $P122, loop1567_handler
    $P122."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P122
  loop1567_test:
    unless $P116, loop1567_done
    shift $P121, $P116
  loop1567_redo:
    .const 'Sub' $P1565 = "83_1309998845.12722" 
    capture_lex $P1565
    $P1565($P121)
  loop1567_next:
    goto loop1567_test
  loop1567_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P123, exception, 'type'
    eq $P123, .CONTROL_LOOP_NEXT, loop1567_next
    eq $P123, .CONTROL_LOOP_REDO, loop1567_redo
  loop1567_done:
    pop_eh 
  for_undef_344:
  if_1560_end:
.annotate 'line', 427
    goto if_1556_end
  if_1556:
.annotate 'line', 425
    find_lex $P115, "$past"
    find_lex $P1558, "$/"
    unless_null $P1558, vivify_345
    $P1558 = root_new ['parrot';'Hash']
  vivify_345:
    set $P1559, $P1558["nibbler"]
    unless_null $P1559, vivify_346
    $P1559 = root_new ['parrot';'ResizablePMCArray']
  vivify_346:
    set $P116, $P1559[0]
    unless_null $P116, vivify_347
    new $P116, "Undef"
  vivify_347:
    $P117 = $P116."ast"()
    $P118 = "buildsub"($P117)
    $P115."push"($P118)
  if_1556_end:
.annotate 'line', 422
    goto if_1551_end
  if_1551:
.annotate 'line', 407
    .const 'Sub' $P1553 = "82_1309998845.12722" 
    capture_lex $P1553
    $P1553()
  if_1551_end:
    goto if_1547_end
  if_1547:
.annotate 'line', 404
    find_lex $P1549, "$/"
    unless_null $P1549, vivify_348
    $P1549 = root_new ['parrot';'Hash']
  vivify_348:
    set $P1550, $P1549["assertion"]
    unless_null $P1550, vivify_349
    $P1550 = root_new ['parrot';'ResizablePMCArray']
  vivify_349:
    set $P112, $P1550[0]
    unless_null $P112, vivify_350
    new $P112, "Undef"
  vivify_350:
    $P113 = $P112."ast"()
    store_lex "$past", $P113
.annotate 'line', 405
    find_lex $P112, "self"
    find_lex $P113, "$past"
    find_lex $P114, "$name"
    $P112."subrule_alias"($P113, $P114)
  if_1547_end:
.annotate 'line', 431
    find_lex $P111, "$/"
    find_lex $P112, "$past"
    $P113 = $P111."!make"($P112)
.annotate 'line', 400
    .return ($P113)
  control_1541:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1564"  :anon :subid("83_1309998845.12722") :outer("81_1309998845.12722")
    .param pmc param_1566
.annotate 'line', 428
    .lex "$_", param_1566
    find_lex $P122, "$past"
    find_lex $P123, "$_"
    $P124 = $P122."push"($P123)
    .return ($P124)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1552"  :anon :subid("82_1309998845.12722") :outer("81_1309998845.12722")
.annotate 'line', 408
    new $P113, "Undef"
    set $P1554, $P113
    .lex "$regexsym", $P1554

            $P0 = get_global '$REGEXNAME'
            $S0 = $P0
            $I0 = index $S0, ':sym<'
            add $I0, 5
            $S0 = substr $S0, $I0
            $S0 = chopn $S0, 1
            $P1555 = box $S0
        
    store_lex "$regexsym", $P1555
.annotate 'line', 417
    get_hll_global $P114, ["PAST"], "Regex"
.annotate 'line', 418
    get_hll_global $P115, ["PAST"], "Regex"
    find_lex $P116, "$regexsym"
    $P117 = $P115."new"($P116, "literal" :named("pasttype"))
    find_lex $P118, "$name"
    find_lex $P119, "$/"
    $P120 = $P114."new"($P117, $P118 :named("name"), "subcapture" :named("pasttype"), $P119 :named("node"))
.annotate 'line', 417
    store_lex "$past", $P120
.annotate 'line', 407
    .return ($P120)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "assertion:sym<[>"  :subid("84_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1571
.annotate 'line', 434
    .const 'Sub' $P1581 = "85_1309998845.12722" 
    capture_lex $P1581
    new $P1570, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1570, control_1569
    push_eh $P1570
    .lex "self", self
    .lex "$/", param_1571
.annotate 'line', 435
    new $P109, "Undef"
    set $P1572, $P109
    .lex "$clist", $P1572
.annotate 'line', 436
    new $P110, "Undef"
    set $P1573, $P110
    .lex "$past", $P1573
.annotate 'line', 445
    new $P111, "Undef"
    set $P1574, $P111
    .lex "$i", $P1574
.annotate 'line', 446
    new $P112, "Undef"
    set $P1575, $P112
    .lex "$n", $P1575
.annotate 'line', 435
    find_lex $P1576, "$/"
    unless_null $P1576, vivify_351
    $P1576 = root_new ['parrot';'Hash']
  vivify_351:
    set $P113, $P1576["cclass_elem"]
    unless_null $P113, vivify_352
    new $P113, "Undef"
  vivify_352:
    store_lex "$clist", $P113
.annotate 'line', 436
    find_lex $P1577, "$clist"
    unless_null $P1577, vivify_353
    $P1577 = root_new ['parrot';'ResizablePMCArray']
  vivify_353:
    set $P113, $P1577[0]
    unless_null $P113, vivify_354
    new $P113, "Undef"
  vivify_354:
    $P114 = $P113."ast"()
    store_lex "$past", $P114
.annotate 'line', 437
    find_lex $P114, "$past"
    $P115 = $P114."negate"()
    if $P115, if_1579
    set $P113, $P115
    goto if_1579_end
  if_1579:
    find_lex $P116, "$past"
    $S100 = $P116."pasttype"()
    iseq $I100, $S100, "subrule"
    new $P113, 'Integer'
    set $P113, $I100
  if_1579_end:
    unless $P113, if_1578_end
.annotate 'line', 438
    find_lex $P117, "$past"
    $P117."subtype"("zerowidth")
.annotate 'line', 439
    get_hll_global $P117, ["PAST"], "Regex"
    find_lex $P118, "$past"
.annotate 'line', 441
    get_hll_global $P119, ["PAST"], "Regex"
    $P120 = $P119."new"("charclass" :named("pasttype"), "." :named("subtype"))
    find_lex $P121, "$/"
    $P122 = $P117."new"($P118, $P120, $P121 :named("node"))
.annotate 'line', 439
    store_lex "$past", $P122
  if_1578_end:
.annotate 'line', 445
    new $P113, "Integer"
    assign $P113, 1
    store_lex "$i", $P113
.annotate 'line', 446
    find_lex $P113, "$clist"
    set $N100, $P113
    new $P114, 'Float'
    set $P114, $N100
    store_lex "$n", $P114
.annotate 'line', 447
    new $P116, 'ExceptionHandler'
    set_label $P116, loop1585_handler
    $P116."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P116
  loop1585_test:
    find_lex $P113, "$i"
    set $N100, $P113
    find_lex $P114, "$n"
    set $N101, $P114
    islt $I100, $N100, $N101
    unless $I100, loop1585_done
  loop1585_redo:
    .const 'Sub' $P1581 = "85_1309998845.12722" 
    capture_lex $P1581
    $P1581()
  loop1585_next:
    goto loop1585_test
  loop1585_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P118, exception, 'type'
    eq $P118, .CONTROL_LOOP_NEXT, loop1585_next
    eq $P118, .CONTROL_LOOP_REDO, loop1585_redo
  loop1585_done:
    pop_eh 
.annotate 'line', 458
    find_lex $P113, "$/"
    find_lex $P114, "$past"
    $P115 = $P113."!make"($P114)
.annotate 'line', 434
    .return ($P115)
  control_1569:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P113, exception, "payload"
    .return ($P113)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1580"  :anon :subid("85_1309998845.12722") :outer("84_1309998845.12722")
.annotate 'line', 448
    new $P115, "Undef"
    set $P1582, $P115
    .lex "$ast", $P1582
    find_lex $P116, "$i"
    set $I101, $P116
    find_lex $P1583, "$clist"
    unless_null $P1583, vivify_355
    $P1583 = root_new ['parrot';'ResizablePMCArray']
  vivify_355:
    set $P117, $P1583[$I101]
    unless_null $P117, vivify_356
    new $P117, "Undef"
  vivify_356:
    $P118 = $P117."ast"()
    store_lex "$ast", $P118
.annotate 'line', 449
    find_lex $P116, "$ast"
    $P117 = $P116."negate"()
    if $P117, if_1584
.annotate 'line', 454
    get_hll_global $P118, ["PAST"], "Regex"
    find_lex $P119, "$past"
    find_lex $P120, "$ast"
    find_lex $P121, "$/"
    $P122 = $P118."new"($P119, $P120, "alt" :named("pasttype"), $P121 :named("node"))
    store_lex "$past", $P122
.annotate 'line', 453
    goto if_1584_end
  if_1584:
.annotate 'line', 450
    find_lex $P118, "$ast"
    $P118."subtype"("zerowidth")
.annotate 'line', 451
    get_hll_global $P118, ["PAST"], "Regex"
    find_lex $P119, "$ast"
    find_lex $P120, "$past"
    find_lex $P121, "$/"
    $P122 = $P118."new"($P119, $P120, "concat" :named("pasttype"), $P121 :named("node"))
    store_lex "$past", $P122
  if_1584_end:
.annotate 'line', 456
    find_lex $P116, "$i"
    add $P117, $P116, 1
    store_lex "$i", $P117
.annotate 'line', 447
    .return ($P117)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "cclass_elem"  :subid("86_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1589
.annotate 'line', 461
    .const 'Sub' $P1600 = "88_1309998845.12722" 
    capture_lex $P1600
    .const 'Sub' $P1595 = "87_1309998845.12722" 
    capture_lex $P1595
    new $P1588, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1588, control_1587
    push_eh $P1588
    .lex "self", self
    .lex "$/", param_1589
.annotate 'line', 462
    new $P109, "Undef"
    set $P1590, $P109
    .lex "$str", $P1590
.annotate 'line', 463
    new $P110, "Undef"
    set $P1591, $P110
    .lex "$past", $P1591
.annotate 'line', 462
    new $P111, "String"
    assign $P111, ""
    store_lex "$str", $P111
.annotate 'line', 461
    find_lex $P111, "$past"
.annotate 'line', 464
    find_lex $P1593, "$/"
    unless_null $P1593, vivify_357
    $P1593 = root_new ['parrot';'Hash']
  vivify_357:
    set $P111, $P1593["name"]
    unless_null $P111, vivify_358
    new $P111, "Undef"
  vivify_358:
    if $P111, if_1592
.annotate 'line', 468
    find_lex $P1598, "$/"
    unless_null $P1598, vivify_359
    $P1598 = root_new ['parrot';'Hash']
  vivify_359:
    set $P114, $P1598["charspec"]
    unless_null $P114, vivify_360
    new $P114, "Undef"
  vivify_360:
    defined $I100, $P114
    unless $I100, for_undef_361
    iter $P113, $P114
    new $P118, 'ExceptionHandler'
    set_label $P118, loop1614_handler
    $P118."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P118
  loop1614_test:
    unless $P113, loop1614_done
    shift $P115, $P113
  loop1614_redo:
    .const 'Sub' $P1600 = "88_1309998845.12722" 
    capture_lex $P1600
    $P1600($P115)
  loop1614_next:
    goto loop1614_test
  loop1614_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P119, exception, 'type'
    eq $P119, .CONTROL_LOOP_NEXT, loop1614_next
    eq $P119, .CONTROL_LOOP_REDO, loop1614_redo
  loop1614_done:
    pop_eh 
  for_undef_361:
.annotate 'line', 493
    get_hll_global $P113, ["PAST"], "Regex"
    find_lex $P114, "$str"
    find_lex $P115, "$/"
    $P117 = $P113."new"($P114, "enumcharlist" :named("pasttype"), $P115 :named("node"))
    store_lex "$past", $P117
.annotate 'line', 467
    goto if_1592_end
  if_1592:
.annotate 'line', 464
    .const 'Sub' $P1595 = "87_1309998845.12722" 
    capture_lex $P1595
    $P1595()
  if_1592_end:
.annotate 'line', 495
    find_lex $P111, "$past"
    find_lex $P1615, "$/"
    unless_null $P1615, vivify_373
    $P1615 = root_new ['parrot';'Hash']
  vivify_373:
    set $P112, $P1615["sign"]
    unless_null $P112, vivify_374
    new $P112, "Undef"
  vivify_374:
    set $S100, $P112
    iseq $I100, $S100, "-"
    $P111."negate"($I100)
.annotate 'line', 496
    find_lex $P111, "$/"
    find_lex $P112, "$past"
    $P113 = $P111."!make"($P112)
.annotate 'line', 461
    .return ($P113)
  control_1587:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1599"  :anon :subid("88_1309998845.12722") :outer("86_1309998845.12722")
    .param pmc param_1601
.annotate 'line', 468
    .const 'Sub' $P1605 = "89_1309998845.12722" 
    capture_lex $P1605
    .lex "$_", param_1601
.annotate 'line', 469
    find_lex $P1603, "$_"
    unless_null $P1603, vivify_362
    $P1603 = root_new ['parrot';'ResizablePMCArray']
  vivify_362:
    set $P118, $P1603[1]
    unless_null $P118, vivify_363
    new $P118, "Undef"
  vivify_363:
    if $P118, if_1602
.annotate 'line', 491
    find_lex $P123, "$str"
    find_lex $P1613, "$_"
    unless_null $P1613, vivify_364
    $P1613 = root_new ['parrot';'ResizablePMCArray']
  vivify_364:
    set $P125, $P1613[0]
    unless_null $P125, vivify_365
    new $P125, "Undef"
  vivify_365:
    concat $P126, $P123, $P125
    store_lex "$str", $P126
    set $P117, $P126
.annotate 'line', 469
    goto if_1602_end
  if_1602:
    .const 'Sub' $P1605 = "89_1309998845.12722" 
    capture_lex $P1605
    $P122 = $P1605()
    set $P117, $P122
  if_1602_end:
.annotate 'line', 468
    .return ($P117)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1604"  :anon :subid("89_1309998845.12722") :outer("88_1309998845.12722")
.annotate 'line', 470
    new $P119, "Undef"
    set $P1606, $P119
    .lex "$a", $P1606
.annotate 'line', 471
    new $P120, "Undef"
    set $P1607, $P120
    .lex "$b", $P1607
.annotate 'line', 472
    new $P121, "Undef"
    set $P1608, $P121
    .lex "$c", $P1608
.annotate 'line', 470
    find_lex $P1609, "$_"
    unless_null $P1609, vivify_366
    $P1609 = root_new ['parrot';'ResizablePMCArray']
  vivify_366:
    set $P122, $P1609[0]
    unless_null $P122, vivify_367
    new $P122, "Undef"
  vivify_367:
    store_lex "$a", $P122
.annotate 'line', 471
    find_lex $P1610, "$_"
    unless_null $P1610, vivify_368
    $P1610 = root_new ['parrot';'ResizablePMCArray']
  vivify_368:
    set $P1611, $P1610[1]
    unless_null $P1611, vivify_369
    $P1611 = root_new ['parrot';'ResizablePMCArray']
  vivify_369:
    set $P122, $P1611[0]
    unless_null $P122, vivify_370
    new $P122, "Undef"
  vivify_370:
    store_lex "$b", $P122
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
                             $P1612 = box $S2
                         
    store_lex "$c", $P1612
.annotate 'line', 489
    find_lex $P122, "$str"
    find_lex $P123, "$c"
    concat $P124, $P122, $P123
    store_lex "$str", $P124
.annotate 'line', 469
    .return ($P124)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1594"  :anon :subid("87_1309998845.12722") :outer("86_1309998845.12722")
.annotate 'line', 465
    new $P112, "Undef"
    set $P1596, $P112
    .lex "$name", $P1596
    find_lex $P1597, "$/"
    unless_null $P1597, vivify_371
    $P1597 = root_new ['parrot';'Hash']
  vivify_371:
    set $P113, $P1597["name"]
    unless_null $P113, vivify_372
    new $P113, "Undef"
  vivify_372:
    set $S100, $P113
    new $P114, 'String'
    set $P114, $S100
    store_lex "$name", $P114
.annotate 'line', 466
    get_hll_global $P113, ["PAST"], "Regex"
    find_lex $P114, "$name"
    find_lex $P115, "$/"
    $P116 = $P113."new"($P114, "subrule" :named("pasttype"), "method" :named("subtype"), $P115 :named("node"))
    store_lex "$past", $P116
.annotate 'line', 464
    .return ($P116)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "mod_internal"  :subid("90_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1619
.annotate 'line', 499
    new $P1618, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1618, control_1617
    push_eh $P1618
    .lex "self", self
    .lex "$/", param_1619
.annotate 'line', 500
    $P1621 = root_new ['parrot';'Hash']
    set $P1620, $P1621
    .lex "%mods", $P1620
.annotate 'line', 501
    new $P109, "Undef"
    set $P1622, $P109
    .lex "$n", $P1622
.annotate 'line', 500
    get_global $P1623, "@MODIFIERS"
    unless_null $P1623, vivify_375
    $P1623 = root_new ['parrot';'ResizablePMCArray']
  vivify_375:
    set $P110, $P1623[0]
    unless_null $P110, vivify_376
    new $P110, "Undef"
  vivify_376:
    store_lex "%mods", $P110
.annotate 'line', 501
    find_lex $P1625, "$/"
    unless_null $P1625, vivify_377
    $P1625 = root_new ['parrot';'Hash']
  vivify_377:
    set $P1626, $P1625["n"]
    unless_null $P1626, vivify_378
    $P1626 = root_new ['parrot';'ResizablePMCArray']
  vivify_378:
    set $P111, $P1626[0]
    unless_null $P111, vivify_379
    new $P111, "Undef"
  vivify_379:
    set $S100, $P111
    isgt $I100, $S100, ""
    if $I100, if_1624
    new $P113, "Integer"
    assign $P113, 1
    set $P110, $P113
    goto if_1624_end
  if_1624:
    find_lex $P1627, "$/"
    unless_null $P1627, vivify_380
    $P1627 = root_new ['parrot';'Hash']
  vivify_380:
    set $P1628, $P1627["n"]
    unless_null $P1628, vivify_381
    $P1628 = root_new ['parrot';'ResizablePMCArray']
  vivify_381:
    set $P112, $P1628[0]
    unless_null $P112, vivify_382
    new $P112, "Undef"
  vivify_382:
    set $N100, $P112
    new $P110, 'Float'
    set $P110, $N100
  if_1624_end:
    store_lex "$n", $P110
.annotate 'line', 502
    find_lex $P110, "$n"
    find_lex $P1629, "$/"
    unless_null $P1629, vivify_383
    $P1629 = root_new ['parrot';'Hash']
  vivify_383:
    set $P1630, $P1629["mod_ident"]
    unless_null $P1630, vivify_384
    $P1630 = root_new ['parrot';'Hash']
  vivify_384:
    set $P111, $P1630["sym"]
    unless_null $P111, vivify_385
    new $P111, "Undef"
  vivify_385:
    set $S100, $P111
    find_lex $P1631, "%mods"
    unless_null $P1631, vivify_386
    $P1631 = root_new ['parrot';'Hash']
    store_lex "%mods", $P1631
  vivify_386:
    set $P1631[$S100], $P110
.annotate 'line', 503
    find_lex $P110, "$/"
    $P111 = $P110."!make"(0)
.annotate 'line', 499
    .return ($P111)
  control_1617:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "subrule_alias"  :subid("91_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1635
    .param pmc param_1636
.annotate 'line', 597
    new $P1634, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1634, control_1633
    push_eh $P1634
    .lex "self", self
    .lex "$past", param_1635
    .lex "$name", param_1636
.annotate 'line', 598
    find_lex $P109, "$past"
    $S100 = $P109."name"()
    isgt $I100, $S100, ""
    if $I100, if_1637
.annotate 'line', 599
    find_lex $P110, "$past"
    find_lex $P111, "$name"
    $P110."name"($P111)
    goto if_1637_end
  if_1637:
.annotate 'line', 598
    find_lex $P110, "$past"
    find_lex $P111, "$name"
    concat $P112, $P111, "="
    find_lex $P113, "$past"
    $S101 = $P113."name"()
    concat $P114, $P112, $S101
    $P110."name"($P114)
  if_1637_end:
.annotate 'line', 600
    find_lex $P109, "$past"
    $P110 = $P109."subtype"("capture")
.annotate 'line', 597
    .return ($P110)
  control_1633:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.include "except_types.pasm"
.sub "named_assertion"  :subid("92_1309998845.12722") :method :outer("11_1309998845.12722")
    .param pmc param_1641
.annotate 'line', 603
    new $P1640, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1640, control_1639
    push_eh $P1640
    .lex "self", self
    .lex "$/", param_1641
.annotate 'line', 604
    new $P109, "Undef"
    set $P1642, $P109
    .lex "$name", $P1642
.annotate 'line', 605
    new $P110, "Undef"
    set $P1643, $P110
    .lex "$past", $P1643
.annotate 'line', 604
    find_lex $P1644, "$/"
    unless_null $P1644, vivify_387
    $P1644 = root_new ['parrot';'Hash']
  vivify_387:
    set $P111, $P1644["longname"]
    unless_null $P111, vivify_388
    new $P111, "Undef"
  vivify_388:
    set $S100, $P111
    new $P112, 'String'
    set $P112, $S100
    store_lex "$name", $P112
.annotate 'line', 605
    get_hll_global $P111, ["PAST"], "Regex"
    find_lex $P112, "$name"
    find_lex $P113, "$name"
    find_lex $P114, "$/"
    $P115 = $P111."new"($P112, $P113 :named("name"), "subrule" :named("pasttype"), "capture" :named("subtype"), $P114 :named("node"))
    store_lex "$past", $P115
.annotate 'line', 603
    find_lex $P111, "$past"
    .return ($P111)
  control_1639:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["Regex";"P6Regex";"Actions"]
.sub "_block1646" :load :anon :subid("93_1309998845.12722")
.annotate 'line', 4
    .const 'Sub' $P1648 = "11_1309998845.12722" 
    $P109 = $P1648()
    .return ($P109)
.end


.namespace []
.sub "_block1650" :load :anon :subid("94_1309998845.12722")
.annotate 'line', 1
    .const 'Sub' $P1652 = "10_1309998845.12722" 
    $P100 = $P1652()
    .return ($P100)
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


.sub 'make_regex' :method
    .param string regex
    .local pmc regexeval, regexsub, regexobj
    # compile the regex
    regexeval = self.'compile'(regex)
    # extract the Sub itself
    regexsub = regexeval[0]
    # wrap it in a Regex object
    $P0 = get_hll_global ['Regex'], 'Regex'
    regexobj = $P0.'new'(regexsub)
    .return (regexobj)
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
