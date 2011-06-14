
.namespace []
.sub "_block11"  :anon :subid("10_1308074680.10378")
.annotate 'line', 0
    .const 'Sub' $P14 = "11_1308074680.10378" 
    capture_lex $P14
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 41
    .const 'Sub' $P14 = "11_1308074680.10378" 
    capture_lex $P14
    $P2717 = $P14()
.annotate 'line', 1
    .return ($P2717)
    .const 'Sub' $P2719 = "99_1308074680.10378" 
    .return ($P2719)
.end


.namespace []
.sub "" :load :init :subid("post100") :outer("10_1308074680.10378")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1308074680.10378" 
    .local pmc block
    set block, $P12
.annotate 'line', 1
    load_bytecode "PCT/HLLCompiler.pbc"
    $P2722 = get_root_global ["parrot"], "P6metaclass"
    new $P2723, "ResizablePMCArray"
    push $P2723, "%!symtable"
    $P2722."new_class"("PAST::Compiler", "PCT::HLLCompiler" :named("parent"), $P2723 :named("attr"))
.end


.namespace ["PAST";"Compiler"]
.sub "_block13"  :subid("11_1308074680.10378") :outer("10_1308074680.10378")
.annotate 'line', 41
    .const 'Sub' $P2520 = "97_1308074680.10378" 
    capture_lex $P2520
    .const 'Sub' $P2468 = "94_1308074680.10378" 
    capture_lex $P2468
    .const 'Sub' $P2462 = "93_1308074680.10378" 
    capture_lex $P2462
    .const 'Sub' $P2452 = "92_1308074680.10378" 
    capture_lex $P2452
    .const 'Sub' $P2444 = "91_1308074680.10378" 
    capture_lex $P2444
    .const 'Sub' $P2363 = "89_1308074680.10378" 
    capture_lex $P2363
    .const 'Sub' $P2286 = "85_1308074680.10378" 
    capture_lex $P2286
    .const 'Sub' $P2280 = "84_1308074680.10378" 
    capture_lex $P2280
    .const 'Sub' $P2274 = "83_1308074680.10378" 
    capture_lex $P2274
    .const 'Sub' $P2225 = "81_1308074680.10378" 
    capture_lex $P2225
    .const 'Sub' $P2091 = "75_1308074680.10378" 
    capture_lex $P2091
    .const 'Sub' $P2032 = "74_1308074680.10378" 
    capture_lex $P2032
    .const 'Sub' $P2005 = "73_1308074680.10378" 
    capture_lex $P2005
    .const 'Sub' $P1969 = "72_1308074680.10378" 
    capture_lex $P1969
    .const 'Sub' $P1869 = "70_1308074680.10378" 
    capture_lex $P1869
    .const 'Sub' $P1820 = "69_1308074680.10378" 
    capture_lex $P1820
    .const 'Sub' $P1738 = "66_1308074680.10378" 
    capture_lex $P1738
    .const 'Sub' $P1674 = "65_1308074680.10378" 
    capture_lex $P1674
    .const 'Sub' $P1630 = "63_1308074680.10378" 
    capture_lex $P1630
    .const 'Sub' $P1621 = "62_1308074680.10378" 
    capture_lex $P1621
    .const 'Sub' $P1611 = "61_1308074680.10378" 
    capture_lex $P1611
    .const 'Sub' $P1572 = "59_1308074680.10378" 
    capture_lex $P1572
    .const 'Sub' $P1473 = "57_1308074680.10378" 
    capture_lex $P1473
    .const 'Sub' $P1463 = "56_1308074680.10378" 
    capture_lex $P1463
    .const 'Sub' $P1453 = "55_1308074680.10378" 
    capture_lex $P1453
    .const 'Sub' $P1443 = "54_1308074680.10378" 
    capture_lex $P1443
    .const 'Sub' $P1385 = "53_1308074680.10378" 
    capture_lex $P1385
    .const 'Sub' $P1264 = "52_1308074680.10378" 
    capture_lex $P1264
    .const 'Sub' $P1254 = "51_1308074680.10378" 
    capture_lex $P1254
    .const 'Sub' $P1085 = "47_1308074680.10378" 
    capture_lex $P1085
    .const 'Sub' $P1075 = "46_1308074680.10378" 
    capture_lex $P1075
    .const 'Sub' $P999 = "44_1308074680.10378" 
    capture_lex $P999
    .const 'Sub' $P889 = "43_1308074680.10378" 
    capture_lex $P889
    .const 'Sub' $P827 = "42_1308074680.10378" 
    capture_lex $P827
    .const 'Sub' $P453 = "32_1308074680.10378" 
    capture_lex $P453
    .const 'Sub' $P341 = "28_1308074680.10378" 
    capture_lex $P341
    .const 'Sub' $P286 = "27_1308074680.10378" 
    capture_lex $P286
    .const 'Sub' $P248 = "26_1308074680.10378" 
    capture_lex $P248
    .const 'Sub' $P238 = "25_1308074680.10378" 
    capture_lex $P238
    .const 'Sub' $P228 = "24_1308074680.10378" 
    capture_lex $P228
    .const 'Sub' $P210 = "23_1308074680.10378" 
    capture_lex $P210
    .const 'Sub' $P193 = "22_1308074680.10378" 
    capture_lex $P193
    .const 'Sub' $P180 = "21_1308074680.10378" 
    capture_lex $P180
    .const 'Sub' $P167 = "20_1308074680.10378" 
    capture_lex $P167
    .const 'Sub' $P157 = "19_1308074680.10378" 
    capture_lex $P157
    .const 'Sub' $P136 = "18_1308074680.10378" 
    capture_lex $P136
    .const 'Sub' $P130 = "17_1308074680.10378" 
    capture_lex $P130
    .const 'Sub' $P124 = "16_1308074680.10378" 
    capture_lex $P124
    .const 'Sub' $P89 = "15_1308074680.10378" 
    capture_lex $P89
    .const 'Sub' $P75 = "14_1308074680.10378" 
    capture_lex $P75
    .const 'Sub' $P44 = "13_1308074680.10378" 
    capture_lex $P44
    .const 'Sub' $P25 = "12_1308074680.10378" 
    capture_lex $P25
.annotate 'line', 43
    get_global $P15, "%piropsig"
    unless_null $P15, vivify_193
    $P15 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P15
  vivify_193:
.annotate 'line', 44
    get_global $P16, "%valflags"
    unless_null $P16, vivify_194
    $P16 = root_new ['parrot';'Hash']
    set_global "%valflags", $P16
  vivify_194:
.annotate 'line', 45
    get_global $P17, "%controltypes"
    unless_null $P17, vivify_195
    $P17 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P17
  vivify_195:
.annotate 'line', 46
    get_global $P18, "$serno"
    unless_null $P18, vivify_196
    new $P18, "Undef"
    set_global "$serno", $P18
  vivify_196:
.annotate 'line', 160
    get_global $P19, "@?BLOCK"
    unless_null $P19, vivify_197
    $P19 = root_new ['parrot';'ResizablePMCArray']
    set_global "@?BLOCK", $P19
  vivify_197:
.annotate 'line', 41
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    get_global $P20, "%piropsig"
    get_global $P21, "%valflags"
    get_global $P22, "%controltypes"
    get_global $P23, "$serno"
.annotate 'line', 48
    get_global $P24, "@?BLOCK"
.annotate 'line', 1950
    .const 'Sub' $P2520 = "97_1308074680.10378" 
    newclosure $P2526, $P2520
.annotate 'line', 41
    .return ($P2526)
    .const 'Sub' $P2528 = "98_1308074680.10378" 
    .return ($P2528)
.end


.namespace ["PAST";"Compiler"]
.sub "" :load :init :subid("post101") :outer("11_1308074680.10378")
.annotate 'line', 41
    .const 'Sub' $P14 = "11_1308074680.10378" 
    .local pmc block
    set block, $P14
.annotate 'line', 49
    get_hll_global $P2531, ["PAST"], "Compiler"
    $P2531."language"("PAST")
.annotate 'line', 50
    get_hll_global $P2532, ["PAST"], "Compiler"
    new $P2533, "ResizablePMCArray"
    push $P2533, "post"
    push $P2533, "pir"
    push $P2533, "evalpmc"
    $P2532."stages"($P2533)
.annotate 'line', 53
    new $P2534, "String"
    assign $P2534, "PP+"
    get_global $P2535, "%piropsig"
    unless_null $P2535, vivify_102
    $P2535 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2535
  vivify_102:
    set $P2535["add"], $P2534
.annotate 'line', 54
    new $P2536, "String"
    assign $P2536, "PPP"
    get_global $P2537, "%piropsig"
    unless_null $P2537, vivify_103
    $P2537 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2537
  vivify_103:
    set $P2537["band"], $P2536
.annotate 'line', 55
    new $P2538, "String"
    assign $P2538, "PPP"
    get_global $P2539, "%piropsig"
    unless_null $P2539, vivify_104
    $P2539 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2539
  vivify_104:
    set $P2539["bxor"], $P2538
.annotate 'line', 56
    new $P2540, "String"
    assign $P2540, "PP"
    get_global $P2541, "%piropsig"
    unless_null $P2541, vivify_105
    $P2541 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2541
  vivify_105:
    set $P2541["bnot"], $P2540
.annotate 'line', 57
    new $P2542, "String"
    assign $P2542, "PPP"
    get_global $P2543, "%piropsig"
    unless_null $P2543, vivify_106
    $P2543 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2543
  vivify_106:
    set $P2543["bor"], $P2542
.annotate 'line', 58
    new $P2544, "String"
    assign $P2544, "IPs"
    get_global $P2545, "%piropsig"
    unless_null $P2545, vivify_107
    $P2545 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2545
  vivify_107:
    set $P2545["can"], $P2544
.annotate 'line', 59
    new $P2546, "String"
    assign $P2546, "Si"
    get_global $P2547, "%piropsig"
    unless_null $P2547, vivify_108
    $P2547 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2547
  vivify_108:
    set $P2547["chr"], $P2546
.annotate 'line', 60
    new $P2548, "String"
    assign $P2548, "PP"
    get_global $P2549, "%piropsig"
    unless_null $P2549, vivify_109
    $P2549 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2549
  vivify_109:
    set $P2549["clone"], $P2548
.annotate 'line', 61
    new $P2550, "String"
    assign $P2550, "PP~"
    get_global $P2551, "%piropsig"
    unless_null $P2551, vivify_110
    $P2551 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2551
  vivify_110:
    set $P2551["concat"], $P2550
.annotate 'line', 62
    new $P2552, "String"
    assign $P2552, "0PP"
    get_global $P2553, "%piropsig"
    unless_null $P2553, vivify_111
    $P2553 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2553
  vivify_111:
    set $P2553["copy"], $P2552
.annotate 'line', 63
    new $P2554, "String"
    assign $P2554, "IP"
    get_global $P2555, "%piropsig"
    unless_null $P2555, vivify_112
    $P2555 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2555
  vivify_112:
    set $P2555["defined"], $P2554
.annotate 'line', 64
    new $P2556, "String"
    assign $P2556, "vQ*"
    get_global $P2557, "%piropsig"
    unless_null $P2557, vivify_113
    $P2557 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2557
  vivify_113:
    set $P2557["delete"], $P2556
.annotate 'line', 65
    new $P2558, "String"
    assign $P2558, "v~"
    get_global $P2559, "%piropsig"
    unless_null $P2559, vivify_114
    $P2559 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2559
  vivify_114:
    set $P2559["die"], $P2558
.annotate 'line', 66
    new $P2560, "String"
    assign $P2560, "PP+"
    get_global $P2561, "%piropsig"
    unless_null $P2561, vivify_115
    $P2561 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2561
  vivify_115:
    set $P2561["div"], $P2560
.annotate 'line', 67
    new $P2562, "String"
    assign $P2562, "IPs"
    get_global $P2563, "%piropsig"
    unless_null $P2563, vivify_116
    $P2563 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2563
  vivify_116:
    set $P2563["does"], $P2562
.annotate 'line', 68
    new $P2564, "String"
    assign $P2564, "Ss"
    get_global $P2565, "%piropsig"
    unless_null $P2565, vivify_117
    $P2565 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2565
  vivify_117:
    set $P2565["downcase"], $P2564
.annotate 'line', 69
    new $P2566, "String"
    assign $P2566, "IP"
    get_global $P2567, "%piropsig"
    unless_null $P2567, vivify_118
    $P2567 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2567
  vivify_118:
    set $P2567["elements"], $P2566
.annotate 'line', 70
    new $P2568, "String"
    assign $P2568, "IQ*"
    get_global $P2569, "%piropsig"
    unless_null $P2569, vivify_119
    $P2569 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2569
  vivify_119:
    set $P2569["exists"], $P2568
.annotate 'line', 71
    new $P2570, "String"
    assign $P2570, "vi"
    get_global $P2571, "%piropsig"
    unless_null $P2571, vivify_120
    $P2571 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2571
  vivify_120:
    set $P2571["exit"], $P2570
.annotate 'line', 72
    new $P2572, "String"
    assign $P2572, "PP+"
    get_global $P2573, "%piropsig"
    unless_null $P2573, vivify_121
    $P2573 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2573
  vivify_121:
    set $P2573["fdiv"], $P2572
.annotate 'line', 73
    new $P2574, "String"
    assign $P2574, "Is"
    get_global $P2575, "%piropsig"
    unless_null $P2575, vivify_122
    $P2575 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2575
  vivify_122:
    set $P2575["find_codepoint"], $P2574
.annotate 'line', 74
    new $P2576, "String"
    assign $P2576, "Ps"
    get_global $P2577, "%piropsig"
    unless_null $P2577, vivify_123
    $P2577 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2577
  vivify_123:
    set $P2577["find_dynamic_lex"], $P2576
.annotate 'line', 75
    new $P2578, "String"
    assign $P2578, "Ps"
    get_global $P2579, "%piropsig"
    unless_null $P2579, vivify_124
    $P2579 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2579
  vivify_124:
    set $P2579["find_name"], $P2578
.annotate 'line', 76
    new $P2580, "String"
    assign $P2580, "P"
    get_global $P2581, "%piropsig"
    unless_null $P2581, vivify_125
    $P2581 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2581
  vivify_125:
    set $P2581["getinterp"], $P2580
.annotate 'line', 77
    new $P2582, "String"
    assign $P2582, "P~P"
    get_global $P2583, "%piropsig"
    unless_null $P2583, vivify_126
    $P2583 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2583
  vivify_126:
    set $P2583["getprop"], $P2582
.annotate 'line', 78
    new $P2584, "String"
    assign $P2584, "P"
    get_global $P2585, "%piropsig"
    unless_null $P2585, vivify_127
    $P2585 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2585
  vivify_127:
    set $P2585["getstderr"], $P2584
.annotate 'line', 79
    new $P2586, "String"
    assign $P2586, "P"
    get_global $P2587, "%piropsig"
    unless_null $P2587, vivify_128
    $P2587 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2587
  vivify_128:
    set $P2587["getstdin"], $P2586
.annotate 'line', 80
    new $P2588, "String"
    assign $P2588, "P"
    get_global $P2589, "%piropsig"
    unless_null $P2589, vivify_129
    $P2589 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2589
  vivify_129:
    set $P2589["getstdout"], $P2588
.annotate 'line', 81
    new $P2590, "String"
    assign $P2590, "Issi"
    get_global $P2591, "%piropsig"
    unless_null $P2591, vivify_130
    $P2591 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2591
  vivify_130:
    set $P2591["index"], $P2590
.annotate 'line', 82
    new $P2592, "String"
    assign $P2592, "IP~"
    get_global $P2593, "%piropsig"
    unless_null $P2593, vivify_131
    $P2593 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2593
  vivify_131:
    set $P2593["isa"], $P2592
.annotate 'line', 83
    new $P2594, "String"
    assign $P2594, "IP"
    get_global $P2595, "%piropsig"
    unless_null $P2595, vivify_132
    $P2595 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2595
  vivify_132:
    set $P2595["isfalse"], $P2594
.annotate 'line', 84
    new $P2596, "String"
    assign $P2596, "IP"
    get_global $P2597, "%piropsig"
    unless_null $P2597, vivify_133
    $P2597 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2597
  vivify_133:
    set $P2597["isnull"], $P2596
.annotate 'line', 85
    new $P2598, "String"
    assign $P2598, "IPP"
    get_global $P2599, "%piropsig"
    unless_null $P2599, vivify_134
    $P2599 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2599
  vivify_134:
    set $P2599["issame"], $P2598
.annotate 'line', 86
    new $P2600, "String"
    assign $P2600, "IP"
    get_global $P2601, "%piropsig"
    unless_null $P2601, vivify_135
    $P2601 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2601
  vivify_135:
    set $P2601["istrue"], $P2600
.annotate 'line', 87
    new $P2602, "String"
    assign $P2602, "SsP"
    get_global $P2603, "%piropsig"
    unless_null $P2603, vivify_136
    $P2603 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2603
  vivify_136:
    set $P2603["join"], $P2602
.annotate 'line', 88
    new $P2604, "String"
    assign $P2604, "Is"
    get_global $P2605, "%piropsig"
    unless_null $P2605, vivify_137
    $P2605 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2605
  vivify_137:
    set $P2605["length"], $P2604
.annotate 'line', 89
    new $P2606, "String"
    assign $P2606, "vs"
    get_global $P2607, "%piropsig"
    unless_null $P2607, vivify_138
    $P2607 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2607
  vivify_138:
    set $P2607["load_bytecode"], $P2606
.annotate 'line', 90
    new $P2608, "String"
    assign $P2608, "vs"
    get_global $P2609, "%piropsig"
    unless_null $P2609, vivify_139
    $P2609 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2609
  vivify_139:
    set $P2609["load_language"], $P2608
.annotate 'line', 91
    new $P2610, "String"
    assign $P2610, "P~"
    get_global $P2611, "%piropsig"
    unless_null $P2611, vivify_140
    $P2611 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2611
  vivify_140:
    set $P2611["loadlib"], $P2610
.annotate 'line', 92
    new $P2612, "String"
    assign $P2612, "PP+"
    get_global $P2613, "%piropsig"
    unless_null $P2613, vivify_141
    $P2613 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2613
  vivify_141:
    set $P2613["mod"], $P2612
.annotate 'line', 93
    new $P2614, "String"
    assign $P2614, "PP+"
    get_global $P2615, "%piropsig"
    unless_null $P2615, vivify_142
    $P2615 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2615
  vivify_142:
    set $P2615["mul"], $P2614
.annotate 'line', 94
    new $P2616, "String"
    assign $P2616, "PP"
    get_global $P2617, "%piropsig"
    unless_null $P2617, vivify_143
    $P2617 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2617
  vivify_143:
    set $P2617["neg"], $P2616
.annotate 'line', 95
    new $P2618, "String"
    assign $P2618, "P~"
    get_global $P2619, "%piropsig"
    unless_null $P2619, vivify_144
    $P2619 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2619
  vivify_144:
    set $P2619["new"], $P2618
.annotate 'line', 96
    new $P2620, "String"
    assign $P2620, "PP"
    get_global $P2621, "%piropsig"
    unless_null $P2621, vivify_145
    $P2621 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2621
  vivify_145:
    set $P2621["newclosure"], $P2620
.annotate 'line', 97
    new $P2622, "String"
    assign $P2622, "PP"
    get_global $P2623, "%piropsig"
    unless_null $P2623, vivify_146
    $P2623 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2623
  vivify_146:
    set $P2623["not"], $P2622
.annotate 'line', 98
    new $P2624, "String"
    assign $P2624, "Isi"
    get_global $P2625, "%piropsig"
    unless_null $P2625, vivify_147
    $P2625 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2625
  vivify_147:
    set $P2625["ord"], $P2624
.annotate 'line', 99
    new $P2626, "String"
    assign $P2626, "PP"
    get_global $P2627, "%piropsig"
    unless_null $P2627, vivify_148
    $P2627 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2627
  vivify_148:
    set $P2627["pop"], $P2626
.annotate 'line', 100
    new $P2628, "String"
    assign $P2628, "NN+"
    get_global $P2629, "%piropsig"
    unless_null $P2629, vivify_149
    $P2629 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2629
  vivify_149:
    set $P2629["pow"], $P2628
.annotate 'line', 101
    new $P2630, "String"
    assign $P2630, "v*"
    get_global $P2631, "%piropsig"
    unless_null $P2631, vivify_150
    $P2631 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2631
  vivify_150:
    set $P2631["print"], $P2630
.annotate 'line', 102
    new $P2632, "String"
    assign $P2632, "v*"
    get_global $P2633, "%piropsig"
    unless_null $P2633, vivify_151
    $P2633 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2633
  vivify_151:
    set $P2633["printerr"], $P2632
.annotate 'line', 103
    new $P2634, "String"
    assign $P2634, "0P*"
    get_global $P2635, "%piropsig"
    unless_null $P2635, vivify_152
    $P2635 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2635
  vivify_152:
    set $P2635["push"], $P2634
.annotate 'line', 104
    new $P2636, "String"
    assign $P2636, "Ssi"
    get_global $P2637, "%piropsig"
    unless_null $P2637, vivify_153
    $P2637 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2637
  vivify_153:
    set $P2637["repeat"], $P2636
.annotate 'line', 105
    new $P2638, "String"
    assign $P2638, "Ssiis"
    get_global $P2639, "%piropsig"
    unless_null $P2639, vivify_154
    $P2639 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2639
  vivify_154:
    set $P2639["replace"], $P2638
.annotate 'line', 106
    new $P2640, "String"
    assign $P2640, "v*"
    get_global $P2641, "%piropsig"
    unless_null $P2641, vivify_155
    $P2641 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2641
  vivify_155:
    set $P2641["say"], $P2640
.annotate 'line', 107
    new $P2642, "String"
    assign $P2642, "PP"
    get_global $P2643, "%piropsig"
    unless_null $P2643, vivify_156
    $P2643 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2643
  vivify_156:
    set $P2643["set"], $P2642
.annotate 'line', 108
    new $P2644, "String"
    assign $P2644, "0P~P"
    get_global $P2645, "%piropsig"
    unless_null $P2645, vivify_157
    $P2645 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2645
  vivify_157:
    set $P2645["setprop"], $P2644
.annotate 'line', 109
    new $P2646, "String"
    assign $P2646, "0P~P"
    get_global $P2647, "%piropsig"
    unless_null $P2647, vivify_158
    $P2647 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2647
  vivify_158:
    set $P2647["setattribute"], $P2646
.annotate 'line', 110
    new $P2648, "String"
    assign $P2648, "PP"
    get_global $P2649, "%piropsig"
    unless_null $P2649, vivify_159
    $P2649 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2649
  vivify_159:
    set $P2649["shift"], $P2648
.annotate 'line', 111
    new $P2650, "String"
    assign $P2650, "PP+"
    get_global $P2651, "%piropsig"
    unless_null $P2651, vivify_160
    $P2651 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2651
  vivify_160:
    set $P2651["shl"], $P2650
.annotate 'line', 112
    new $P2652, "String"
    assign $P2652, "PP+"
    get_global $P2653, "%piropsig"
    unless_null $P2653, vivify_161
    $P2653 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2653
  vivify_161:
    set $P2653["shr"], $P2652
.annotate 'line', 113
    new $P2654, "String"
    assign $P2654, "v+"
    get_global $P2655, "%piropsig"
    unless_null $P2655, vivify_162
    $P2655 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2655
  vivify_162:
    set $P2655["sleep"], $P2654
.annotate 'line', 114
    new $P2656, "String"
    assign $P2656, "0PPii"
    get_global $P2657, "%piropsig"
    unless_null $P2657, vivify_163
    $P2657 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2657
  vivify_163:
    set $P2657["splice"], $P2656
.annotate 'line', 115
    new $P2658, "String"
    assign $P2658, "Pss"
    get_global $P2659, "%piropsig"
    unless_null $P2659, vivify_164
    $P2659 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2659
  vivify_164:
    set $P2659["split"], $P2658
.annotate 'line', 116
    new $P2660, "String"
    assign $P2660, "PP+"
    get_global $P2661, "%piropsig"
    unless_null $P2661, vivify_165
    $P2661 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2661
  vivify_165:
    set $P2661["sub"], $P2660
.annotate 'line', 117
    new $P2662, "String"
    assign $P2662, "Ssii"
    get_global $P2663, "%piropsig"
    unless_null $P2663, vivify_166
    $P2663 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2663
  vivify_166:
    set $P2663["substr"], $P2662
.annotate 'line', 118
    new $P2664, "String"
    assign $P2664, "Ss"
    get_global $P2665, "%piropsig"
    unless_null $P2665, vivify_167
    $P2665 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2665
  vivify_167:
    set $P2665["titlecase"], $P2664
.annotate 'line', 119
    new $P2666, "String"
    assign $P2666, "vi"
    get_global $P2667, "%piropsig"
    unless_null $P2667, vivify_168
    $P2667 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2667
  vivify_168:
    set $P2667["trace"], $P2666
.annotate 'line', 120
    new $P2668, "String"
    assign $P2668, "SP"
    get_global $P2669, "%piropsig"
    unless_null $P2669, vivify_169
    $P2669 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2669
  vivify_169:
    set $P2669["typeof"], $P2668
.annotate 'line', 121
    new $P2670, "String"
    assign $P2670, "0P*"
    get_global $P2671, "%piropsig"
    unless_null $P2671, vivify_170
    $P2671 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2671
  vivify_170:
    set $P2671["unshift"], $P2670
.annotate 'line', 122
    new $P2672, "String"
    assign $P2672, "Ss"
    get_global $P2673, "%piropsig"
    unless_null $P2673, vivify_171
    $P2673 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2673
  vivify_171:
    set $P2673["upcase"], $P2672
.annotate 'line', 127
    new $P2674, "String"
    assign $P2674, "s~*:e"
    get_global $P2675, "%valflags"
    unless_null $P2675, vivify_172
    $P2675 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2675
  vivify_172:
    set $P2675["String"], $P2674
.annotate 'line', 128
    new $P2676, "String"
    assign $P2676, "i+*:"
    get_global $P2677, "%valflags"
    unless_null $P2677, vivify_173
    $P2677 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2677
  vivify_173:
    set $P2677["Integer"], $P2676
.annotate 'line', 129
    new $P2678, "String"
    assign $P2678, "n+*:"
    get_global $P2679, "%valflags"
    unless_null $P2679, vivify_174
    $P2679 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2679
  vivify_174:
    set $P2679["Float"], $P2678
.annotate 'line', 130
    new $P2680, "String"
    assign $P2680, "i+*:c"
    get_global $P2681, "%valflags"
    unless_null $P2681, vivify_175
    $P2681 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2681
  vivify_175:
    set $P2681["!macro_const"], $P2680
.annotate 'line', 131
    new $P2682, "String"
    assign $P2682, "i+*:c"
    get_global $P2683, "%valflags"
    unless_null $P2683, vivify_176
    $P2683 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2683
  vivify_176:
    set $P2683["!cclass"], $P2682
.annotate 'line', 132
    new $P2684, "String"
    assign $P2684, "i+*:c"
    get_global $P2685, "%valflags"
    unless_null $P2685, vivify_177
    $P2685 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2685
  vivify_177:
    set $P2685["!except_severity"], $P2684
.annotate 'line', 133
    new $P2686, "String"
    assign $P2686, "i+*:c"
    get_global $P2687, "%valflags"
    unless_null $P2687, vivify_178
    $P2687 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2687
  vivify_178:
    set $P2687["!except_types"], $P2686
.annotate 'line', 134
    new $P2688, "String"
    assign $P2688, "i+*:c"
    get_global $P2689, "%valflags"
    unless_null $P2689, vivify_179
    $P2689 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2689
  vivify_179:
    set $P2689["!iterator"], $P2688
.annotate 'line', 135
    new $P2690, "String"
    assign $P2690, "i+*:c"
    get_global $P2691, "%valflags"
    unless_null $P2691, vivify_180
    $P2691 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2691
  vivify_180:
    set $P2691["!socket"], $P2690
.annotate 'line', 139
    new $P2692, "String"
    assign $P2692, ".CONTROL_RETURN, .CONTROL_OK, .CONTROL_BREAK, .CONTROL_CONTINUE, .CONTROL_TAKE, .CONTROL_LEAVE, .CONTROL_EXIT, .CONTROL_LOOP_NEXT, .CONTROL_LOOP_LAST, .CONTROL_LOOP_REDO"
    get_global $P2693, "%controltypes"
    unless_null $P2693, vivify_181
    $P2693 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2693
  vivify_181:
    set $P2693["CONTROL"], $P2692
.annotate 'line', 140
    new $P2694, "String"
    assign $P2694, ".CONTROL_RETURN"
    get_global $P2695, "%controltypes"
    unless_null $P2695, vivify_182
    $P2695 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2695
  vivify_182:
    set $P2695["RETURN"], $P2694
.annotate 'line', 141
    new $P2696, "String"
    assign $P2696, ".CONTROL_OK"
    get_global $P2697, "%controltypes"
    unless_null $P2697, vivify_183
    $P2697 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2697
  vivify_183:
    set $P2697["OK"], $P2696
.annotate 'line', 142
    new $P2698, "String"
    assign $P2698, ".CONTROL_BREAK"
    get_global $P2699, "%controltypes"
    unless_null $P2699, vivify_184
    $P2699 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2699
  vivify_184:
    set $P2699["BREAK"], $P2698
.annotate 'line', 143
    new $P2700, "String"
    assign $P2700, ".CONTROL_CONTINUE"
    get_global $P2701, "%controltypes"
    unless_null $P2701, vivify_185
    $P2701 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2701
  vivify_185:
    set $P2701["CONTINUE"], $P2700
.annotate 'line', 144
    new $P2702, "String"
    assign $P2702, ".CONTROL_ERROR"
    get_global $P2703, "%controltypes"
    unless_null $P2703, vivify_186
    $P2703 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2703
  vivify_186:
    set $P2703["ERROR"], $P2702
.annotate 'line', 145
    new $P2704, "String"
    assign $P2704, ".CONTROL_TAKE"
    get_global $P2705, "%controltypes"
    unless_null $P2705, vivify_187
    $P2705 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2705
  vivify_187:
    set $P2705["GATHER"], $P2704
.annotate 'line', 146
    new $P2706, "String"
    assign $P2706, ".CONTROL_LEAVE"
    get_global $P2707, "%controltypes"
    unless_null $P2707, vivify_188
    $P2707 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2707
  vivify_188:
    set $P2707["LEAVE"], $P2706
.annotate 'line', 147
    new $P2708, "String"
    assign $P2708, ".CONTROL_EXIT"
    get_global $P2709, "%controltypes"
    unless_null $P2709, vivify_189
    $P2709 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2709
  vivify_189:
    set $P2709["EXIT"], $P2708
.annotate 'line', 148
    new $P2710, "String"
    assign $P2710, ".CONTROL_NEXT"
    get_global $P2711, "%controltypes"
    unless_null $P2711, vivify_190
    $P2711 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2711
  vivify_190:
    set $P2711["NEXT"], $P2710
.annotate 'line', 149
    new $P2712, "String"
    assign $P2712, ".CONTROL_LAST"
    get_global $P2713, "%controltypes"
    unless_null $P2713, vivify_191
    $P2713 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2713
  vivify_191:
    set $P2713["LAST"], $P2712
.annotate 'line', 150
    new $P2714, "String"
    assign $P2714, ".CONTROL_REDO"
    get_global $P2715, "%controltypes"
    unless_null $P2715, vivify_192
    $P2715 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2715
  vivify_192:
    set $P2715["REDO"], $P2714
.annotate 'line', 152
    new $P2716, "Integer"
    assign $P2716, 11
    set_global "$serno", $P2716
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "to_post"  :subid("12_1308074680.10378") :method :outer("11_1308074680.10378")
    .param pmc param_28
    .param pmc param_29 :slurpy :named
.annotate 'line', 162
    new $P27, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P27, control_26
    push_eh $P27
    .lex "self", self
    .lex "$past", param_28
    .lex "%options", param_29
.annotate 'line', 169
    $P30 = root_new ['parrot';'ResizablePMCArray']
    .lex "@*BLOCKPAST", $P30
.annotate 'line', 170
    new $P31, "Undef"
    .lex "$*SUB", $P31
.annotate 'line', 163
    $P32 = root_new ['parrot';'Hash']
    find_lex $P33, "self"
    setattribute $P33, "%!symtable", $P32
.annotate 'line', 165
    get_global $P35, "@?BLOCK"
    defined $I36, $P35
    if $I36, unless_34_end
.annotate 'line', 166
    new $P37, "ResizablePMCArray"
    set_global "@?BLOCK", $P37
  unless_34_end:
.annotate 'line', 169
    get_global $P38, "@?BLOCK"
    store_lex "@*BLOCKPAST", $P38
    find_lex $P39, "$*SUB"
    unless_null $P39, vivify_198
    get_hll_global $P39, "$SUB"
    unless_null $P39, vivify_199
    die "Contextual $*SUB not found"
  vivify_199:
  vivify_198:
.annotate 'line', 172
    find_lex $P40, "self"
    find_lex $P41, "$past"
    $P42 = $P40."as_post"($P41, "v" :named("rtype"))
.annotate 'line', 162
    .return ($P42)
  control_26:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P43, exception, "payload"
    .return ($P43)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "escape"  :subid("13_1308074680.10378") :method :outer("11_1308074680.10378")
    .param pmc param_47
.annotate 'line', 178
    new $P46, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P46, control_45
    push_eh $P46
    .lex "self", self
    .lex "$str", param_47
.annotate 'line', 179
    new $P48, "Undef"
    .lex "$estr", $P48
    find_lex $P49, "$str"
    set $S50, $P49
    escape $S51, $S50
    new $P52, 'String'
    set $P52, $S51
    store_lex "$estr", $P52
.annotate 'line', 180
    find_lex $P56, "$estr"
    set $S57, $P56
    index $I58, $S57, unicode:"\\x"
    set $N59, $I58
    isge $I60, $N59, 0.0
    unless $I60, unless_55
    new $P54, 'Integer'
    set $P54, $I60
    goto unless_55_end
  unless_55:
    find_lex $P61, "$estr"
    set $S62, $P61
    index $I63, $S62, unicode:"\\u"
    set $N64, $I63
    isgt $I65, $N64, 0.0
    new $P54, 'Integer'
    set $P54, $I65
  unless_55_end:
    if $P54, if_53
.annotate 'line', 184
    new $P69, "String"
    assign $P69, "\""
    find_lex $P70, "$estr"
    concat $P71, $P69, $P70
    store_lex "$estr", $P71
.annotate 'line', 183
    goto if_53_end
  if_53:
.annotate 'line', 181
    new $P66, "String"
    assign $P66, "unicode:\""
    find_lex $P67, "$estr"
    concat $P68, $P66, $P67
    store_lex "$estr", $P68
  if_53_end:
.annotate 'line', 186
    find_lex $P72, "$estr"
    concat $P73, $P72, "\""
    store_lex "$estr", $P73
.annotate 'line', 178
    .return ($P73)
  control_45:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P74, exception, "payload"
    .return ($P74)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "unique"  :subid("14_1308074680.10378") :method :outer("11_1308074680.10378")
    .param pmc param_78 :optional
    .param int has_param_78 :opt_flag
.annotate 'line', 194
    new $P77, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P77, control_76
    push_eh $P77
    .lex "self", self
    if has_param_78, optparam_200
    new $P79, "Undef"
    set param_78, $P79
  optparam_200:
    .lex "$fmt", param_78
.annotate 'line', 195
    find_lex $P81, "$fmt"
    defined $I82, $P81
    if $I82, unless_80_end
    new $P83, "String"
    assign $P83, ""
    store_lex "$fmt", $P83
  unless_80_end:
.annotate 'line', 196
    find_lex $P84, "$fmt"
    get_global $P85, "$serno"
    clone $P86, $P85
    inc $P85
    concat $P87, $P84, $P86
    store_lex "$fmt", $P87
.annotate 'line', 194
    .return ($P87)
  control_76:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P88, exception, "payload"
    .return ($P88)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "uniquereg"  :subid("15_1308074680.10378") :method :outer("11_1308074680.10378")
    .param pmc param_92
.annotate 'line', 203
    new $P91, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P91, control_90
    push_eh $P91
    .lex "self", self
    .lex "$rtype", param_92
.annotate 'line', 208
    new $P93, "Undef"
    .lex "$reg", $P93
.annotate 'line', 209
    new $P94, "Undef"
    .lex "$i", $P94
.annotate 'line', 204
    find_lex $P96, "$rtype"
    if $P96, unless_95_end
    find_lex $P97, "self"
    $P97."panic"("rtype not set")
  unless_95_end:
.annotate 'line', 206
    find_lex $P99, "$rtype"
    set $S100, $P99
    iseq $I101, $S100, "v"
    unless $I101, if_98_end
    new $P102, "Exception"
    set $P102['type'], .CONTROL_RETURN
    new $P103, "String"
    assign $P103, ""
    setattribute $P102, 'payload', $P103
    throw $P102
  if_98_end:
.annotate 'line', 208
    new $P104, "String"
    assign $P104, "P"
    store_lex "$reg", $P104
.annotate 'line', 209
    find_lex $P105, "$rtype"
    set $S106, $P105
    index $I107, "Ss~Nn+Ii", $S106
    new $P108, 'Integer'
    set $P108, $I107
    store_lex "$i", $P108
.annotate 'line', 210
    find_lex $P110, "$i"
    set $N111, $P110
    islt $I112, $N111, 0.0
    if $I112, unless_109_end
    find_lex $P113, "$i"
    set $I114, $P113
    substr $S115, "SSSNNNII", $I114, 1
    new $P116, 'String'
    set $P116, $S115
    store_lex "$reg", $P116
  unless_109_end:
.annotate 'line', 211
    new $P117, "String"
    assign $P117, "$"
    find_lex $P118, "$reg"
    concat $P119, $P117, $P118
    store_lex "$reg", $P119
.annotate 'line', 212
    find_lex $P120, "self"
    find_lex $P121, "$reg"
    $P122 = $P120."unique"($P121)
.annotate 'line', 203
    .return ($P122)
  control_90:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P123, exception, "payload"
    .return ($P123)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "coerce"  :subid("16_1308074680.10378") :method :outer("11_1308074680.10378")
    .param pmc param_127
    .param pmc param_128
.annotate 'line', 221
    new $P126, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P126, control_125
    push_eh $P126
    .lex "self", self
    .lex "$post", param_127
    .lex "$rtype", param_128
.annotate 'line', 222

        .local pmc post
        post = find_lex '$post'
        .local pmc prtype
        .local string rtype
        prtype = find_lex '$rtype'
        rtype = prtype

        unless rtype goto err_nortype

        .local string pmctype, result, rrtype
        null pmctype
        null result

        ##  if rtype is a register, then set result and use the register
        ##  type as rtype
        $S0 = substr rtype, 0, 1
        unless $S0 == '$' goto have_rtype
        result = rtype
        rtype = substr result, 1, 1
      have_rtype:

        ##  these rtypes allow any return value, so no coercion needed.
        $I0 = index 'v*:', rtype
        if $I0 >= 0 goto end

        ##  figure out what type of result we already have
        .local string source
        source = post.'result'()
        $S0 = substr source, 0, 1
        if $S0 == '$' goto source_reg
        if $S0 == '"' goto source_str
        if $S0 == '.' goto source_int_num_or_const
        if $S0 == '-' goto source_int_or_num
        $I0 = is_cclass 8, source, 0 # 8 = CCLASS_NUMERIC
        if $I0 goto source_int_or_num
        $S0 = substr source, 0, 8
        if $S0 == 'unicode:' goto source_str
        ##  assume that whatever is left acts like a PMC
        goto source_pmc

      source_reg:
        ##  source is some sort of register
        ##  if a register is all we need, we're done
        if rtype == 'r' goto end
        $S0 = substr source, 1, 1
        ##  if we have the correct register type already, we're done
        if $S0 != rtype goto source_reg_1
        unless result goto end
        goto coerce_reg
      source_reg_1:
        $S0 = downcase $S0
        if $S0 == rtype goto end
        ##  figure it out based on the register type
        if $S0 == 's' goto source_str
        if rtype == '+' goto end
        if $S0 == 'i' goto source_int
        if $S0 == 'n' goto source_num
      source_pmc:
        $I0 = index 'SINsin', rtype
        if $I0 < 0 goto end
        goto coerce_reg

      source_str:
        if rtype == '~' goto end
        if rtype == 's' goto end
        rrtype = 'S'
        pmctype = "'String'"
        goto coerce_reg

      source_int_num_or_const:
        $I0 = is_cclass 4, source, 1 # 4 = CCLASS_ALPHABETIC
        unless $I0 goto source_int_or_num
        $I0 = index 'ins+~', rtype
        if $I0 >= 0 goto end
        rrtype = 'P'
        goto coerce_reg

      source_int_or_num:
        if rtype == '+' goto end
        ##  existence of an 'e' or '.' implies num
        $I0 = index source, '.'
        if $I0 >= 0 goto source_num
        $I0 = index source, 'E'
        if $I0 >= 0 goto source_num

      source_int:
        if rtype == 'i' goto end
        rrtype = 'I'
        pmctype = "'Integer'"
        goto coerce_reg

      source_num:
        if rtype == 'n' goto end
        rrtype = 'N'
        pmctype = "'Float'"

      coerce_reg:
        ##  okay, we know we have to do a coercion.
        ##  If we just need the value in a register (rtype == 'r'),
        ##  then create result based on the preferred register type (rrtype).
        if rtype != 'r' goto coerce_reg_1
        result = self.'uniquereg'(rrtype)
      coerce_reg_1:
        ##  if we haven't set the result target yet, then generate one
        ##  based on rtype.  (The case of rtype == 'r' was handled above.)
        if result goto coerce_reg_2
        result = self.'uniquereg'(rtype)
      coerce_reg_2:
        ##  create a new ops node to hold the coercion, put C<post> in it.
        $P0 = get_hll_global ['POST'], 'Ops'
        post = $P0.'new'(post, 'result'=>result)
        ##  if we need a new pmc (rtype == 'P' && pmctype defined), create it
        if rtype != 'P' goto have_result
        unless pmctype goto have_result
        post.'push_pirop'('new', result, pmctype)
      have_result:
        ##  store the value into the target register
        post.'push_pirop'('set', result, source)

      end:
        .return (post)

      err_nortype:
        self.'panic'('rtype not set')
    
.annotate 'line', 221
    .return ()
  control_125:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P129, exception, "payload"
    .return ($P129)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "post_children"  :subid("17_1308074680.10378") :method :outer("11_1308074680.10378")
    .param pmc param_133
    .param pmc param_134 :slurpy :named
.annotate 'line', 361
    new $P132, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P132, control_131
    push_eh $P132
    .lex "self", self
    .lex "$node", param_133
    .lex "%options", param_134
.annotate 'line', 362

        .local pmc node
        node = find_lex '$node'
        .local pmc options
        options = find_lex '%options'

        .local pmc ops
        $P0 = get_hll_global ['POST'], 'Ops'
        ops = $P0.'new'('node'=>node)

        .local string pushop
        pushop = 'push'
        $S0 = node.'childorder'()
        if $S0 != 'right' goto have_pushop
        pushop = 'unshift'
      have_pushop:

        ##  get any conversion types
        .local string signature
        signature = options['signature']
        if signature goto have_signature
        signature = '**'
      have_signature:
        .local int sigmax, sigidx
        sigmax = length signature
        dec sigmax

        ##  if the signature contains a ':', then we're doing
        ##  flagged arguments (:flat, :named)
        .local pmc posargs, namedargs
        posargs = new 'ResizableStringArray'
        null namedargs
        $I0 = index signature, ':'
        if $I0 < 0 goto nocolon
        namedargs = new 'ResizableStringArray'
      nocolon:

        .local pmc iter
        .local string rtype
        iter = node.'iterator'()
        sigidx = 1
        rtype = substr signature, sigidx, 1
      iter_loop:
        if rtype == 'Q' goto keyed_pos
        unless iter goto iter_end
        .local pmc cpast, cpost
        cpast = shift iter
        cpost = self.'as_post'(cpast, 'rtype'=>rtype)
        cpost = self.'coerce'(cpost, rtype)
        $I0 = isa cpast, ['PAST';'Node']
        unless $I0 goto cpost_pos
        .local pmc isflat
        isflat = cpast.'flat'()
        if rtype != ':' goto iter_pos
        .local pmc npast, npost
        npast = cpast.'named'()
        unless npast goto iter_pos
        $S0 = cpost
        if isflat goto flat_named
        npost = self.'as_post'(npast, 'rtype'=>'~')
        cpost = ops.'new'(cpost)
        cpost.'push'(npost)
        $S1 = npost
        $S0 = concat $S0, ' :named('
        $S0 = concat $S0, $S1
        $S0 = concat $S0, ')'
        goto named_done
      flat_named:
        $S0 = concat $S0, ' :named :flat'
      named_done:
        ops.pushop(cpost)
        push namedargs, $S0
        goto iter_rtype
      iter_pos:
        if isflat goto flat_pos
      cpost_pos:
        ops.pushop(cpost)
        push posargs, cpost
        goto iter_rtype
      flat_pos:
        $S0 = cpost
        $S0 = concat $S0, ' :flat'
        ops.pushop(cpost)
        push posargs, $S0
      iter_rtype:
        unless sigidx < sigmax goto iter_loop
        inc sigidx
        rtype = substr signature, sigidx, 1
        goto iter_loop
      keyed_pos:
        # rtype is 'Q', so construct a keyed pmc argument
        # first, get the base PMC
        unless iter goto iter_end
        cpast = shift iter
        cpost = self.'as_post'(cpast, 'rtype'=>'P')
        cpost = self.'coerce'(cpost, 'P')
        # now process the key arg
        unless iter goto iter_end
        .local pmc kpast, kpost
        kpast = shift iter
        inc sigidx
        rtype = substr signature, sigidx, 1
        kpost = self.'as_post'(kpast, 'rtype'=>rtype)
        kpost = self.'coerce'(kpost, rtype)
        # now construct the keyed PMC
        $S0 = cpost
        $S0 = concat $S0, '['
        $S1 = kpost
        $S0 = concat $S0, $S1
        $S0 = concat $S0, ']'
        kpost = ops.'new'(kpost)
        kpost.'push'(cpost)
        ops.pushop(kpost)
        push posargs, $S0
        goto iter_rtype
      iter_end:
        .return (ops, posargs, namedargs)
    
.annotate 'line', 361
    .return ()
  control_131:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P135, exception, "payload"
    .return ($P135)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("18_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,_)
    .param pmc param_139
    .param pmc param_140 :slurpy :named
.annotate 'line', 498
    new $P138, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P138, control_137
    push_eh $P138
    .lex "self", self
    .lex "$node", param_139
    .lex "%options", param_140
.annotate 'line', 499
    new $P141, "Undef"
    .lex "$what", $P141
.annotate 'line', 498
    find_lex $P142, "$what"
.annotate 'line', 501
    find_lex $P144, "$node"
    isnull $I145, $P144
    if $I145, if_143
.annotate 'line', 505
    new $P147, "String"
    assign $P147, "node of type "
    find_lex $P148, "$node"
    typeof $S149, $P148
    concat $P150, $P147, $S149
    store_lex "$what", $P150
.annotate 'line', 504
    goto if_143_end
  if_143:
.annotate 'line', 502
    new $P146, "String"
    assign $P146, "a null node"
    store_lex "$what", $P146
  if_143_end:
.annotate 'line', 508
    find_lex $P151, "self"
    new $P152, "String"
    assign $P152, "PAST::Compiler can't compile "
    find_lex $P153, "$what"
    concat $P154, $P152, $P153
    $P155 = $P151."panic"($P154)
.annotate 'line', 498
    .return ($P155)
  control_137:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P156, exception, "payload"
    .return ($P156)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("19_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["Undef"])
    .param pmc param_160
    .param pmc param_161 :slurpy :named
.annotate 'line', 514
    new $P159, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P159, control_158
    push_eh $P159
    .lex "self", self
    .lex "$node", param_160
    .lex "%options", param_161
.annotate 'line', 515
    get_hll_global $P162, ["POST"], "Ops"
    find_lex $P163, "self"
    $P164 = $P163."uniquereg"("P")
    $P165 = $P162."new"($P164 :named("result"))
.annotate 'line', 514
    .return ($P165)
  control_158:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P166, exception, "payload"
    .return ($P166)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("20_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["Integer"])
    .param pmc param_170
    .param pmc param_171 :slurpy :named
.annotate 'line', 525
    new $P169, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P169, control_168
    push_eh $P169
    .lex "self", self
    .lex "$node", param_170
    .lex "%options", param_171
.annotate 'line', 526
    find_lex $P172, "self"
    get_hll_global $P173, ["POST"], "Ops"
    find_lex $P174, "$node"
    $P175 = $P173."new"($P174 :named("result"))
    find_lex $P176, "%options"
    unless_null $P176, vivify_201
    $P176 = root_new ['parrot';'Hash']
  vivify_201:
    set $P177, $P176["rtype"]
    unless_null $P177, vivify_202
    new $P177, "Undef"
  vivify_202:
    $P178 = $P172."coerce"($P175, $P177)
.annotate 'line', 525
    .return ($P178)
  control_168:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P179, exception, "payload"
    .return ($P179)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("21_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["Float"])
    .param pmc param_183
    .param pmc param_184 :slurpy :named
.annotate 'line', 529
    new $P182, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P182, control_181
    push_eh $P182
    .lex "self", self
    .lex "$node", param_183
    .lex "%options", param_184
.annotate 'line', 530
    find_lex $P185, "self"
    get_hll_global $P186, ["POST"], "Ops"
    find_lex $P187, "$node"
    $P188 = $P186."new"($P187 :named("result"))
    find_lex $P189, "%options"
    unless_null $P189, vivify_203
    $P189 = root_new ['parrot';'Hash']
  vivify_203:
    set $P190, $P189["rtype"]
    unless_null $P190, vivify_204
    new $P190, "Undef"
  vivify_204:
    $P191 = $P185."coerce"($P188, $P190)
.annotate 'line', 529
    .return ($P191)
  control_181:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P192, exception, "payload"
    .return ($P192)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("22_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["String"])
    .param pmc param_196
    .param pmc param_197 :slurpy :named
.annotate 'line', 533
    new $P195, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P195, control_194
    push_eh $P195
    .lex "self", self
    .lex "$node", param_196
    .lex "%options", param_197
.annotate 'line', 534
    new $P198, "Undef"
    .lex "$value", $P198
    find_lex $P199, "self"
    find_lex $P200, "$node"
    $P201 = $P199."escape"($P200)
    store_lex "$value", $P201
.annotate 'line', 535
    find_lex $P202, "self"
    get_hll_global $P203, ["POST"], "Ops"
    find_lex $P204, "$value"
    $P205 = $P203."new"($P204 :named("result"))
    find_lex $P206, "%options"
    unless_null $P206, vivify_205
    $P206 = root_new ['parrot';'Hash']
  vivify_205:
    set $P207, $P206["rtype"]
    unless_null $P207, vivify_206
    new $P207, "Undef"
  vivify_206:
    $P208 = $P202."coerce"($P205, $P207)
.annotate 'line', 533
    .return ($P208)
  control_194:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P209, exception, "payload"
    .return ($P209)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_vivipost"  :subid("23_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["String"])
    .param pmc param_213
    .param pmc param_214 :slurpy :named
.annotate 'line', 544
    new $P212, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P212, control_211
    push_eh $P212
    .lex "self", self
    .lex "$node", param_213
    .lex "%options", param_214
.annotate 'line', 545
    new $P215, "Undef"
    .lex "$result", $P215
.annotate 'line', 546
    new $P216, "Undef"
    .lex "$s", $P216
.annotate 'line', 545
    find_lex $P217, "self"
    $P218 = $P217."uniquereg"("P")
    store_lex "$result", $P218
.annotate 'line', 546
    find_lex $P219, "self"
    find_lex $P220, "$node"
    $P221 = $P219."escape"($P220)
    store_lex "$s", $P221
.annotate 'line', 547
    get_hll_global $P222, ["POST"], "Op"
    find_lex $P223, "$result"
    find_lex $P224, "$s"
    find_lex $P225, "$result"
    $P226 = $P222."new"($P223, $P224, "new" :named("pirop"), $P225 :named("result"))
.annotate 'line', 544
    .return ($P226)
  control_211:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P227, exception, "payload"
    .return ($P227)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_vivipost"  :subid("24_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,_)
    .param pmc param_231
    .param pmc param_232 :slurpy :named
.annotate 'line', 552
    new $P230, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P230, control_229
    push_eh $P230
    .lex "self", self
    .lex "$node", param_231
    .lex "%options", param_232
.annotate 'line', 553
    find_lex $P233, "self"
    find_lex $P234, "$node"
    find_lex $P235, "%options"
    $P236 = $P233."as_post"($P234, $P235 :flat)
.annotate 'line', 552
    .return ($P236)
  control_229:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P237, exception, "payload"
    .return ($P237)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("25_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["PAST";"Node"])
    .param pmc param_241
    .param pmc param_242 :slurpy :named
.annotate 'line', 568
    new $P240, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P240, control_239
    push_eh $P240
    .lex "self", self
    .lex "$node", param_241
    .lex "%options", param_242
.annotate 'line', 569
    find_lex $P243, "self"
    find_lex $P244, "$node"
    find_lex $P245, "%options"
    $P246 = $P243."node_as_post"($P244, $P245)
.annotate 'line', 568
    .return ($P246)
  control_239:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P247, exception, "payload"
    .return ($P247)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "node_as_post"  :subid("26_1308074680.10378") :method :outer("11_1308074680.10378")
    .param pmc param_251
    .param pmc param_252
.annotate 'line', 573
    new $P250, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P250, control_249
    push_eh $P250
    .lex "self", self
    .lex "$node", param_251
    .lex "%options", param_252
.annotate 'line', 574
    new $P253, "Undef"
    .lex "$rtype", $P253
.annotate 'line', 576
    new $P254, "Undef"
    .lex "$signature", $P254
.annotate 'line', 579
    new $P255, "Undef"
    .lex "$ops", $P255
.annotate 'line', 582
    new $P256, "Undef"
    .lex "$eh", $P256
.annotate 'line', 574
    find_lex $P257, "%options"
    unless_null $P257, vivify_207
    $P257 = root_new ['parrot';'Hash']
  vivify_207:
    set $P258, $P257["rtype"]
    unless_null $P258, vivify_208
    new $P258, "Undef"
  vivify_208:
    store_lex "$rtype", $P258
.annotate 'line', 576
    find_lex $P259, "$node"
    $P260 = $P259."list"()
    set $N261, $P260
    set $I262, $N261
    repeat $S263, "v", $I262
    new $P264, 'String'
    set $P264, $S263
    store_lex "$signature", $P264
.annotate 'line', 577
    find_lex $P265, "$signature"
    find_lex $P266, "$rtype"
    concat $P267, $P265, $P266
    store_lex "$signature", $P267
.annotate 'line', 579
    find_lex $P268, "self"
    find_lex $P269, "$node"
    find_lex $P270, "$signature"
    $P271 = $P268."post_children"($P269, $P270 :named("signature"))
    store_lex "$ops", $P271
.annotate 'line', 580
    find_lex $P272, "$ops"
    find_lex $P273, "$ops"
    unless_null $P273, vivify_209
    $P273 = root_new ['parrot';'ResizablePMCArray']
  vivify_209:
    set $P274, $P273[-1]
    unless_null $P274, vivify_210
    new $P274, "Undef"
  vivify_210:
    $P272."result"($P274)
.annotate 'line', 582
    find_lex $P275, "$node"
    $P276 = $P275."handlers"()
    store_lex "$eh", $P276
.annotate 'line', 583
    find_lex $P278, "$eh"
    unless $P278, if_277_end
    find_lex $P279, "self"
    find_lex $P280, "$ops"
    find_lex $P281, "$eh"
    find_lex $P282, "$rtype"
    $P283 = $P279."wrap_handlers"($P280, $P281, $P282 :named("rtype"))
    store_lex "$ops", $P283
  if_277_end:
    find_lex $P284, "$ops"
.annotate 'line', 573
    .return ($P284)
  control_249:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P285, exception, "payload"
    .return ($P285)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("27_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["PAST";"Control"])
    .param pmc param_289
    .param pmc param_290 :slurpy :named
.annotate 'line', 593
    new $P288, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P288, control_287
    push_eh $P288
    .lex "self", self
    .lex "$node", param_289
    .lex "%options", param_290
.annotate 'line', 594
    new $P291, "Undef"
    .lex "$ishandled", $P291
.annotate 'line', 595
    new $P292, "Undef"
    .lex "$nothandled", $P292
.annotate 'line', 597
    new $P293, "Undef"
    .lex "$ops", $P293
.annotate 'line', 599
    new $P294, "Undef"
    .lex "$signature", $P294
.annotate 'line', 604
    new $P295, "Undef"
    .lex "$children", $P295
.annotate 'line', 606
    new $P296, "Undef"
    .lex "$handled", $P296
.annotate 'line', 594
    get_hll_global $P297, ["POST"], "Label"
    find_lex $P298, "self"
    $P299 = $P298."unique"("handled_")
    $P300 = $P297."new"($P299 :named("result"))
    store_lex "$ishandled", $P300
.annotate 'line', 595
    get_hll_global $P301, ["POST"], "Label"
    find_lex $P302, "self"
    $P303 = $P302."unique"("nothandled_")
    $P304 = $P301."new"($P303 :named("result"))
    store_lex "$nothandled", $P304
.annotate 'line', 597
    get_hll_global $P305, ["POST"], "Ops"
    find_lex $P306, "$node"
    $P307 = $P305."new"($P306 :named("node"))
    store_lex "$ops", $P307
.annotate 'line', 599
    find_lex $P308, "$node"
    $P309 = $P308."list"()
    set $N310, $P309
    set $I311, $N310
    repeat $S312, "v", $I311
    new $P313, 'String'
    set $P313, $S312
    store_lex "$signature", $P313
.annotate 'line', 600
    find_lex $P314, "$signature"
    find_lex $P315, "%options"
    unless_null $P315, vivify_211
    $P315 = root_new ['parrot';'Hash']
  vivify_211:
    set $P316, $P315["rtype"]
    unless_null $P316, vivify_212
    new $P316, "Undef"
  vivify_212:
    concat $P317, $P314, $P316
    store_lex "$signature", $P317
.annotate 'line', 602
    find_lex $P318, "$ops"
    $P318."push_pirop"(".local pmc exception")
.annotate 'line', 603
    find_lex $P319, "$ops"
    $P319."push_pirop"(".get_results (exception)")
.annotate 'line', 604
    find_lex $P320, "self"
    find_lex $P321, "$node"
    find_lex $P322, "$signature"
    $P323 = $P320."post_children"($P321, $P322 :named("signature"))
    store_lex "$children", $P323
.annotate 'line', 605
    find_lex $P324, "$ops"
    find_lex $P325, "$children"
    $P324."push"($P325)
.annotate 'line', 606
    find_lex $P326, "self"
    $P327 = $P326."uniquereg"("I")
    store_lex "$handled", $P327
.annotate 'line', 608
    find_lex $P328, "$ops"
    find_lex $P329, "$handled"
    $P328."push_pirop"("set", $P329, "exception[\"handled\"]")
.annotate 'line', 609
    find_lex $P330, "$ops"
    find_lex $P331, "$handled"
    find_lex $P332, "$nothandled"
    $P330."push_pirop"("ne", $P331, 1, $P332)
.annotate 'line', 610
    find_lex $P333, "$ops"
    find_lex $P334, "$ishandled"
    $P333."push"($P334)
.annotate 'line', 611
    find_lex $P335, "$ops"
    $P335."push_pirop"("return", "exception")
.annotate 'line', 612
    find_lex $P336, "$ops"
    find_lex $P337, "$nothandled"
    $P336."push"($P337)
.annotate 'line', 613
    find_lex $P338, "$ops"
    $P338."push_pirop"("rethrow", "exception")
    find_lex $P339, "$ops"
.annotate 'line', 593
    .return ($P339)
  control_287:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P340, exception, "payload"
    .return ($P340)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "wrap_handlers"  :subid("28_1308074680.10378") :method :outer("11_1308074680.10378")
    .param pmc param_344
    .param pmc param_345
    .param pmc param_346 :slurpy :named
.annotate 'line', 617
    .const 'Sub' $P369 = "29_1308074680.10378" 
    capture_lex $P369
    new $P343, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P343, control_342
    push_eh $P343
    .lex "self", self
    .lex "$child", param_344
    .lex "$ehs", param_345
    .lex "%options", param_346
.annotate 'line', 618
    new $P347, "Undef"
    .lex "$rtype", $P347
.annotate 'line', 620
    new $P348, "Undef"
    .lex "$ops", $P348
.annotate 'line', 621
    new $P349, "Undef"
    .lex "$pops", $P349
.annotate 'line', 622
    new $P350, "Undef"
    .lex "$tail", $P350
.annotate 'line', 623
    new $P351, "Undef"
    .lex "$skip", $P351
.annotate 'line', 618
    find_lex $P352, "%options"
    unless_null $P352, vivify_213
    $P352 = root_new ['parrot';'Hash']
  vivify_213:
    set $P353, $P352["rtype"]
    unless_null $P353, vivify_214
    new $P353, "Undef"
  vivify_214:
    store_lex "$rtype", $P353
.annotate 'line', 620
    get_hll_global $P354, ["POST"], "Ops"
    $P355 = $P354."new"()
    store_lex "$ops", $P355
.annotate 'line', 621
    get_hll_global $P356, ["POST"], "Ops"
    $P357 = $P356."new"()
    store_lex "$pops", $P357
.annotate 'line', 622
    get_hll_global $P358, ["POST"], "Ops"
    $P359 = $P358."new"()
    store_lex "$tail", $P359
.annotate 'line', 623
    get_hll_global $P360, ["POST"], "Label"
    find_lex $P361, "self"
    $P362 = $P361."unique"("skip_handler_")
    $P363 = $P360."new"($P362 :named("result"))
    store_lex "$skip", $P363
.annotate 'line', 625
    find_lex $P365, "$ehs"
    defined $I366, $P365
    unless $I366, for_undef_215
    iter $P364, $P365
    new $P439, 'ExceptionHandler'
    set_label $P439, loop438_handler
    $P439."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P439
  loop438_test:
    unless $P364, loop438_done
    shift $P367, $P364
  loop438_redo:
    .const 'Sub' $P369 = "29_1308074680.10378" 
    capture_lex $P369
    $P369($P367)
  loop438_next:
    goto loop438_test
  loop438_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P440, exception, 'type'
    eq $P440, .CONTROL_LOOP_NEXT, loop438_next
    eq $P440, .CONTROL_LOOP_REDO, loop438_redo
  loop438_done:
    pop_eh 
  for_undef_215:
.annotate 'line', 658
    find_lex $P441, "$ops"
    find_lex $P442, "$child"
    $P441."push"($P442)
.annotate 'line', 660
    find_lex $P443, "$ops"
    find_lex $P444, "$pops"
    $P443."push"($P444)
.annotate 'line', 661
    find_lex $P445, "$ops"
    find_lex $P446, "$skip"
    $P445."push_pirop"("goto", $P446)
.annotate 'line', 662
    find_lex $P447, "$ops"
    find_lex $P448, "$tail"
    $P447."push"($P448)
.annotate 'line', 663
    find_lex $P449, "$ops"
    find_lex $P450, "$skip"
    $P449."push"($P450)
    find_lex $P451, "$ops"
.annotate 'line', 617
    .return ($P451)
  control_342:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P452, exception, "payload"
    .return ($P452)
.end


.namespace ["PAST";"Compiler"]
.sub "_block368"  :anon :subid("29_1308074680.10378") :outer("28_1308074680.10378")
    .param pmc param_374
.annotate 'line', 625
    .const 'Sub' $P417 = "31_1308074680.10378" 
    capture_lex $P417
    .const 'Sub' $P397 = "30_1308074680.10378" 
    capture_lex $P397
.annotate 'line', 626
    new $P370, "Undef"
    .lex "$node", $P370
.annotate 'line', 627
    new $P371, "Undef"
    .lex "$label", $P371
.annotate 'line', 628
    new $P372, "Undef"
    .lex "$ehreg", $P372
.annotate 'line', 633
    new $P373, "Undef"
    .lex "$type", $P373
    .lex "$_", param_374
.annotate 'line', 626
    find_lex $P375, "$_"
    store_lex "$node", $P375
.annotate 'line', 627
    get_hll_global $P376, ["POST"], "Label"
    find_lex $P377, "self"
    $P378 = $P377."unique"("control_")
    $P379 = $P376."new"($P378 :named("result"))
    store_lex "$label", $P379
.annotate 'line', 628
    find_lex $P380, "self"
    $P381 = $P380."uniquereg"("P")
    store_lex "$ehreg", $P381
.annotate 'line', 630
    find_lex $P382, "$ops"
    find_lex $P383, "$ehreg"
    $P382."push_pirop"("new", $P383, "'ExceptionHandler'")
.annotate 'line', 631
    find_lex $P384, "$ops"
    find_lex $P385, "$ehreg"
    find_lex $P386, "$label"
    $P384."push_pirop"("set_label", $P385, $P386)
.annotate 'line', 633
    find_lex $P387, "$node"
    $P388 = $P387."handle_types"()
    store_lex "$type", $P388
.annotate 'line', 634
    find_lex $P392, "$type"
    if $P392, if_391
    set $P390, $P392
    goto if_391_end
  if_391:
    find_lex $P393, "$type"
    get_global $P394, "%controltypes"
    unless_null $P394, vivify_216
    $P394 = root_new ['parrot';'Hash']
  vivify_216:
    set $P395, $P394[$P393]
    unless_null $P395, vivify_217
    new $P395, "Undef"
  vivify_217:
    store_lex "$type", $P395
    set $P390, $P395
  if_391_end:
    unless $P390, if_389_end
    .const 'Sub' $P397 = "30_1308074680.10378" 
    capture_lex $P397
    $P397()
  if_389_end:
.annotate 'line', 640
    find_lex $P407, "$node"
    $P408 = $P407."handle_types_except"()
    store_lex "$type", $P408
.annotate 'line', 641
    find_lex $P412, "$type"
    if $P412, if_411
    set $P410, $P412
    goto if_411_end
  if_411:
    find_lex $P413, "$type"
    get_global $P414, "%controltypes"
    unless_null $P414, vivify_220
    $P414 = root_new ['parrot';'Hash']
  vivify_220:
    set $P415, $P414[$P413]
    unless_null $P415, vivify_221
    new $P415, "Undef"
  vivify_221:
    store_lex "$type", $P415
    set $P410, $P415
  if_411_end:
    unless $P410, if_409_end
    .const 'Sub' $P417 = "31_1308074680.10378" 
    capture_lex $P417
    $P417()
  if_409_end:
.annotate 'line', 648
    find_lex $P427, "$ops"
    find_lex $P428, "$ehreg"
    $P427."push_pirop"("push_eh", $P428)
.annotate 'line', 651
    find_lex $P429, "$pops"
    $P429."push_pirop"("pop_eh")
.annotate 'line', 654
    find_lex $P430, "$tail"
    find_lex $P431, "$label"
    $P430."push"($P431)
.annotate 'line', 655
    find_lex $P432, "$tail"
    find_lex $P433, "self"
    find_lex $P434, "$node"
    find_lex $P435, "$rtype"
    $P436 = $P433."as_post"($P434, $P435 :named("rtype"))
    $P437 = $P432."push"($P436)
.annotate 'line', 625
    .return ($P437)
.end


.namespace ["PAST";"Compiler"]
.sub "_block396"  :anon :subid("30_1308074680.10378") :outer("29_1308074680.10378")
.annotate 'line', 635
    $P398 = root_new ['parrot';'ResizablePMCArray']
    .lex "@types", $P398
    find_lex $P399, "$type"
    set $S400, $P399
    split $P401, ",", $S400
    store_lex "@types", $P401
.annotate 'line', 636
    find_lex $P402, "$ops"
    find_lex $P403, "$ehreg"
    find_lex $P404, "@types"
    $P402."push_pirop"("callmethod", "\"handle_types\"", $P403, $P404 :flat)
.annotate 'line', 637
    find_dynamic_lex $P405, "$*SUB"
    unless_null $P405, vivify_218
    get_hll_global $P405, "$SUB"
    unless_null $P405, vivify_219
    die "Contextual $*SUB not found"
  vivify_219:
  vivify_218:
    $P406 = $P405."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 634
    .return ($P406)
.end


.namespace ["PAST";"Compiler"]
.sub "_block416"  :anon :subid("31_1308074680.10378") :outer("29_1308074680.10378")
.annotate 'line', 642
    $P418 = root_new ['parrot';'ResizablePMCArray']
    .lex "@types", $P418
    find_lex $P419, "$type"
    set $S420, $P419
    split $P421, ",", $S420
    store_lex "@types", $P421
.annotate 'line', 643
    find_lex $P422, "$ops"
    find_lex $P423, "$ehreg"
    find_lex $P424, "@types"
    $P422."push_pirop"("callmethod", "\"handle_types_except\"", $P423, $P424 :flat)
.annotate 'line', 645
    find_dynamic_lex $P425, "$*SUB"
    unless_null $P425, vivify_222
    get_hll_global $P425, "$SUB"
    unless_null $P425, vivify_223
    die "Contextual $*SUB not found"
  vivify_223:
  vivify_222:
    $P426 = $P425."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 641
    .return ($P426)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("32_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["PAST";"Block"])
    .param pmc param_456
    .param pmc param_457 :slurpy :named
.annotate 'line', 673
    .const 'Sub' $P555 = "33_1308074680.10378" 
    capture_lex $P555
    new $P455, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P455, control_454
    push_eh $P455
    .lex "self", self
    .lex "$node", param_456
    .lex "%options", param_457
.annotate 'line', 677
    new $P458, "Undef"
    .lex "$name", $P458
.annotate 'line', 678
    new $P459, "Undef"
    .lex "$pirflags", $P459
.annotate 'line', 679
    new $P460, "Undef"
    .lex "$blocktype", $P460
.annotate 'line', 680
    new $P461, "Undef"
    .lex "$nsentry", $P461
.annotate 'line', 681
    new $P462, "Undef"
    .lex "$subid", $P462
.annotate 'line', 682
    new $P463, "Undef"
    .lex "$ns", $P463
.annotate 'line', 683
    new $P464, "Undef"
    .lex "$hll", $P464
.annotate 'line', 684
    new $P465, "Undef"
    .lex "$multi", $P465
.annotate 'line', 685
    new $P466, "Undef"
    .lex "$loadlibs", $P466
.annotate 'line', 710
    new $P467, "Undef"
    .lex "$bpost", $P467
.annotate 'line', 718
    new $P468, "Undef"
    .lex "$blockreg", $P468
.annotate 'line', 719
    new $P469, "Undef"
    .lex "$blockref", $P469
.annotate 'line', 724
    new $P470, "Undef"
    .lex "$outerpost", $P470
.annotate 'line', 675
    find_dynamic_lex $P471, "@*BLOCKPAST"
    unless_null $P471, vivify_224
    get_hll_global $P471, "@BLOCKPAST"
    unless_null $P471, vivify_225
    die "Contextual @*BLOCKPAST not found"
  vivify_225:
  vivify_224:
    find_lex $P472, "$node"
    unshift $P471, $P472
.annotate 'line', 677
    find_lex $P473, "$node"
    $P474 = $P473."name"()
    store_lex "$name", $P474
.annotate 'line', 678
    find_lex $P475, "$node"
    $P476 = $P475."pirflags"()
    store_lex "$pirflags", $P476
.annotate 'line', 679
    find_lex $P477, "$node"
    $P478 = $P477."blocktype"()
    store_lex "$blocktype", $P478
.annotate 'line', 680
    find_lex $P479, "$node"
    $P480 = $P479."nsentry"()
    store_lex "$nsentry", $P480
.annotate 'line', 681
    find_lex $P481, "$node"
    $P482 = $P481."subid"()
    store_lex "$subid", $P482
.annotate 'line', 682
    find_lex $P483, "$node"
    $P484 = $P483."namespace"()
    store_lex "$ns", $P484
.annotate 'line', 683
    find_lex $P485, "$node"
    $P486 = $P485."hll"()
    store_lex "$hll", $P486
.annotate 'line', 684
    find_lex $P487, "$node"
    $P488 = $P487."multi"()
    store_lex "$multi", $P488
.annotate 'line', 685
    find_lex $P489, "$node"
    $P490 = $P489."loadlibs"()
    store_lex "$loadlibs", $P490
.annotate 'line', 688
    find_lex $P492, "$name"
    defined $I493, $P492
    if $I493, unless_491_end
    new $P494, "String"
    assign $P494, ""
    store_lex "$name", $P494
  unless_491_end:
.annotate 'line', 689
    find_lex $P496, "$pirflags"
    defined $I497, $P496
    if $I497, unless_495_end
    new $P498, "String"
    assign $P498, ""
    store_lex "$pirflags", $P498
  unless_495_end:
.annotate 'line', 690
    find_lex $P500, "$blocktype"
    defined $I501, $P500
    if $I501, unless_499_end
    new $P502, "String"
    assign $P502, ""
    store_lex "$blocktype", $P502
  unless_499_end:
.annotate 'line', 693
    find_lex $P504, "$nsentry"
    defined $I505, $P504
    unless $I505, if_503_end
.annotate 'line', 694
    find_lex $P507, "$nsentry"
    if $P507, if_506
.annotate 'line', 699
    find_lex $P515, "$pirflags"
    concat $P516, $P515, " :anon"
    store_lex "$pirflags", $P516
.annotate 'line', 698
    goto if_506_end
  if_506:
.annotate 'line', 696
    find_lex $P508, "$pirflags"
    concat $P509, $P508, " :nsentry("
    find_lex $P510, "self"
    find_lex $P511, "$nsentry"
    $S512 = $P510."escape"($P511)
    concat $P513, $P509, $S512
    concat $P514, $P513, ")"
    store_lex "$pirflags", $P514
  if_506_end:
  if_503_end:
.annotate 'line', 704
    find_lex $P518, "$name"
    if $P518, unless_517_end
.annotate 'line', 705
    find_lex $P519, "self"
    $P520 = $P519."unique"("_block")
    store_lex "$name", $P520
.annotate 'line', 706
    find_lex $P524, "$ns"
    unless $P524, unless_523
    set $P522, $P524
    goto unless_523_end
  unless_523:
    find_lex $P525, "$nsentry"
    set $P522, $P525
  unless_523_end:
    if $P522, unless_521_end
    find_lex $P526, "$pirflags"
    concat $P527, $P526, " :anon"
    store_lex "$pirflags", $P527
  unless_521_end:
  unless_517_end:
.annotate 'line', 710
    get_hll_global $P528, ["POST"], "Sub"
    find_lex $P529, "$node"
    find_lex $P530, "$name"
    find_lex $P531, "$blocktype"
    find_lex $P532, "$ns"
    find_lex $P533, "$hll"
    find_lex $P534, "$subid"
    find_lex $P535, "$multi"
    find_lex $P536, "$loadlibs"
    $P537 = $P528."new"($P529 :named("node"), $P530 :named("name"), $P531 :named("blocktype"), $P532 :named("namespace"), $P533 :named("hll"), $P534 :named("subid"), $P535 :named("multi"), $P536 :named("loadlibs"))
    store_lex "$bpost", $P537
.annotate 'line', 715
    find_lex $P539, "$pirflags"
    unless $P539, if_538_end
    find_lex $P540, "$bpost"
    find_lex $P541, "$pirflags"
    $P540."pirflags"($P541)
  if_538_end:
.annotate 'line', 718
    find_lex $P542, "self"
    $P543 = $P542."uniquereg"("P")
    store_lex "$blockreg", $P543
.annotate 'line', 719
    new $P544, 'String'
    set $P544, ".const 'Sub' "
    find_lex $P545, "$blockreg"
    concat $P546, $P544, $P545
    concat $P547, $P546, " = "
    find_lex $P548, "self"
    find_lex $P549, "$bpost"
    $P550 = $P549."subid"()
    $S551 = $P548."escape"($P550)
    concat $P552, $P547, $S551
    store_lex "$blockref", $P552
.annotate 'line', 724
    find_dynamic_lex $P553, "$*SUB"
    unless_null $P553, vivify_226
    get_hll_global $P553, "$SUB"
    unless_null $P553, vivify_227
    die "Contextual $*SUB not found"
  vivify_227:
  vivify_226:
    store_lex "$outerpost", $P553
.annotate 'line', 725
    .const 'Sub' $P555 = "33_1308074680.10378" 
    capture_lex $P555
    $P555()
.annotate 'line', 861
    find_dynamic_lex $P823, "@*BLOCKPAST"
    unless_null $P823, vivify_246
    get_hll_global $P823, "@BLOCKPAST"
    unless_null $P823, vivify_247
    die "Contextual @*BLOCKPAST not found"
  vivify_247:
  vivify_246:
    shift $P824, $P823
    find_lex $P825, "$bpost"
.annotate 'line', 673
    .return ($P825)
  control_454:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P826, exception, "payload"
    .return ($P826)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block554"  :anon :subid("33_1308074680.10378") :outer("32_1308074680.10378")
.annotate 'line', 725
    .const 'Sub' $P809 = "41_1308074680.10378" 
    capture_lex $P809
    .const 'Sub' $P759 = "40_1308074680.10378" 
    capture_lex $P759
    .const 'Sub' $P732 = "39_1308074680.10378" 
    capture_lex $P732
    .const 'Sub' $P633 = "36_1308074680.10378" 
    capture_lex $P633
    .const 'Sub' $P604 = "35_1308074680.10378" 
    capture_lex $P604
    .const 'Sub' $P573 = "34_1308074680.10378" 
    capture_lex $P573
.annotate 'line', 726
    new $P556, "Undef"
    .lex "$*SUB", $P556
.annotate 'line', 728
    new $P557, "Undef"
    .lex "$islexical", $P557
.annotate 'line', 742
    $P558 = root_new ['parrot';'Hash']
    .lex "%outersym", $P558
.annotate 'line', 743
    $P559 = root_new ['parrot';'Hash']
    .lex "%symtable", $P559
.annotate 'line', 760
    new $P560, "Undef"
    .lex "$compiler", $P560
.annotate 'line', 831
    new $P561, "Undef"
    .lex "$rtype", $P561
.annotate 'line', 726
    find_lex $P562, "$bpost"
    store_lex "$*SUB", $P562
.annotate 'line', 728
    find_lex $P563, "$node"
    $P564 = $P563."lexical"()
    store_lex "$islexical", $P564
.annotate 'line', 729
    find_lex $P566, "$islexical"
    unless $P566, if_565_end
.annotate 'line', 730
    find_lex $P567, "$bpost"
    find_lex $P568, "$outerpost"
    $P567."outer"($P568)
.annotate 'line', 733
    find_lex $P570, "$outerpost"
    defined $I571, $P570
    unless $I571, if_569_end
    .const 'Sub' $P573 = "34_1308074680.10378" 
    capture_lex $P573
    $P573()
  if_569_end:
  if_565_end:
.annotate 'line', 742
    find_lex $P585, "self"
    getattribute $P586, $P585, "%!symtable"
    unless_null $P586, vivify_228
    $P586 = root_new ['parrot';'Hash']
  vivify_228:
    store_lex "%outersym", $P586
.annotate 'line', 743
    find_lex $P587, "%outersym"
    store_lex "%symtable", $P587
.annotate 'line', 745
    find_lex $P589, "$node"
    $P590 = $P589."symtable"()
    unless $P590, if_588_end
.annotate 'line', 748
    find_lex $P591, "$node"
    $P592 = $P591."symtable"()
    store_lex "%symtable", $P592
.annotate 'line', 749
    find_lex $P594, "%symtable"
    unless_null $P594, vivify_229
    $P594 = root_new ['parrot';'Hash']
  vivify_229:
    set $P595, $P594[""]
    unless_null $P595, vivify_230
    new $P595, "Undef"
  vivify_230:
    defined $I596, $P595
    if $I596, unless_593_end
.annotate 'line', 751
    find_lex $P597, "%symtable"
    clone $P598, $P597
    store_lex "%symtable", $P598
.annotate 'line', 752
    find_lex $P600, "%outersym"
    defined $I601, $P600
    unless $I601, for_undef_231
    iter $P599, $P600
    new $P616, 'ExceptionHandler'
    set_label $P616, loop615_handler
    $P616."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P616
  loop615_test:
    unless $P599, loop615_done
    shift $P602, $P599
  loop615_redo:
    .const 'Sub' $P604 = "35_1308074680.10378" 
    capture_lex $P604
    $P604($P602)
  loop615_next:
    goto loop615_test
  loop615_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P617, exception, 'type'
    eq $P617, .CONTROL_LOOP_NEXT, loop615_next
    eq $P617, .CONTROL_LOOP_REDO, loop615_redo
  loop615_done:
    pop_eh 
  for_undef_231:
  unless_593_end:
  if_588_end:
.annotate 'line', 758
    find_lex $P618, "%symtable"
    find_lex $P619, "self"
    setattribute $P619, "%!symtable", $P618
.annotate 'line', 760
    find_lex $P620, "$node"
    $P621 = $P620."compiler"()
    store_lex "$compiler", $P621
.annotate 'line', 761
    find_lex $P623, "$compiler"
    if $P623, if_622
.annotate 'line', 768
    .const 'Sub' $P633 = "36_1308074680.10378" 
    capture_lex $P633
    $P633()
    goto if_622_end
  if_622:
.annotate 'line', 764
    find_lex $P624, "$bpost"
    find_lex $P625, "$compiler"
    $P624."compiler"($P625)
.annotate 'line', 765
    find_lex $P626, "$bpost"
    find_lex $P627, "$node"
    $P628 = $P627."compiler_args"()
    $P626."compiler_args"($P628)
.annotate 'line', 766
    find_lex $P629, "$bpost"
    find_lex $P630, "$node"
    unless_null $P630, vivify_239
    $P630 = root_new ['parrot';'ResizablePMCArray']
  vivify_239:
    set $P631, $P630[0]
    unless_null $P631, vivify_240
    new $P631, "Undef"
  vivify_240:
    $P629."push"($P631)
  if_622_end:
.annotate 'line', 818
    find_lex $P729, "$node"
    exists $I730, $P729["loadinit"]
    unless $I730, if_728_end
    .const 'Sub' $P732 = "39_1308074680.10378" 
    capture_lex $P732
    $P732()
  if_728_end:
.annotate 'line', 828
    find_lex $P749, "%outersym"
    find_lex $P750, "self"
    setattribute $P750, "%!symtable", $P749
.annotate 'line', 831
    find_lex $P751, "%options"
    unless_null $P751, vivify_242
    $P751 = root_new ['parrot';'Hash']
  vivify_242:
    set $P752, $P751["rtype"]
    unless_null $P752, vivify_243
    new $P752, "Undef"
  vivify_243:
    store_lex "$rtype", $P752
.annotate 'line', 833
    find_lex $P755, "$blocktype"
    set $S756, $P755
    iseq $I757, $S756, "immediate"
    if $I757, if_754
.annotate 'line', 842
    find_lex $P790, "$rtype"
    set $S791, $P790
    isne $I792, $S791, "v"
    if $I792, if_789
    new $P788, 'Integer'
    set $P788, $I792
    goto if_789_end
  if_789:
.annotate 'line', 843
    get_hll_global $P793, ["POST"], "Ops"
    find_lex $P794, "$bpost"
    find_lex $P795, "$node"
    find_lex $P796, "$blockreg"
    $P797 = $P793."new"($P794, $P795 :named("node"), $P796 :named("result"))
    store_lex "$bpost", $P797
.annotate 'line', 844
    find_lex $P798, "$bpost"
    find_lex $P799, "$blockref"
    find_lex $P800, "$blockreg"
    $P798."push_pirop"($P799, $P800 :named("result"))
.annotate 'line', 845
    find_lex $P803, "$islexical"
    if $P803, if_802
    set $P801, $P803
    goto if_802_end
  if_802:
.annotate 'line', 846
    find_lex $P806, "$node"
    $P807 = $P806."closure"()
    if $P807, if_805
.annotate 'line', 854
    find_lex $P820, "$bpost"
    find_lex $P821, "$blockreg"
    $P822 = $P820."push_pirop"("capture_lex", $P821)
.annotate 'line', 853
    set $P804, $P822
.annotate 'line', 846
    goto if_805_end
  if_805:
    .const 'Sub' $P809 = "41_1308074680.10378" 
    capture_lex $P809
    $P819 = $P809()
    set $P804, $P819
  if_805_end:
.annotate 'line', 845
    set $P801, $P804
  if_802_end:
.annotate 'line', 842
    set $P788, $P801
  if_789_end:
    set $P753, $P788
.annotate 'line', 833
    goto if_754_end
  if_754:
    .const 'Sub' $P759 = "40_1308074680.10378" 
    capture_lex $P759
    $P787 = $P759()
    set $P753, $P787
  if_754_end:
.annotate 'line', 725
    .return ($P753)
.end


.namespace ["PAST";"Compiler"]
.sub "_block572"  :anon :subid("34_1308074680.10378") :outer("33_1308074680.10378")
.annotate 'line', 734
    new $P574, "Undef"
    .lex "$cpost", $P574
    get_hll_global $P575, ["POST"], "Ops"
    find_lex $P576, "$blockreg"
    $P577 = $P575."new"($P576 :named("result"))
    store_lex "$cpost", $P577
.annotate 'line', 735
    find_lex $P578, "$cpost"
    find_lex $P579, "$blockref"
    $P578."push_pirop"($P579)
.annotate 'line', 736
    find_lex $P580, "$cpost"
    find_lex $P581, "$blockreg"
    $P580."push_pirop"("capture_lex", $P581)
.annotate 'line', 737
    find_lex $P582, "$outerpost"
    find_lex $P583, "$cpost"
    $P584 = $P582."unshift"($P583)
.annotate 'line', 733
    .return ($P584)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block603"  :anon :subid("35_1308074680.10378") :outer("33_1308074680.10378")
    .param pmc param_605
.annotate 'line', 752
    .lex "$_", param_605
.annotate 'line', 753
    find_lex $P608, "$_"
    find_lex $P607, "%symtable"
    exists $I609, $P607[$P608]
    unless $I609, if_606_end
    die 0, .CONTROL_LOOP_NEXT
  if_606_end:
.annotate 'line', 754
    find_lex $P610, "$_"
    find_lex $P611, "%outersym"
    unless_null $P611, vivify_232
    $P611 = root_new ['parrot';'Hash']
  vivify_232:
    set $P612, $P611[$P610]
    unless_null $P612, vivify_233
    new $P612, "Undef"
  vivify_233:
    find_lex $P613, "$_"
    find_lex $P614, "%symtable"
    unless_null $P614, vivify_234
    $P614 = root_new ['parrot';'Hash']
    store_lex "%symtable", $P614
  vivify_234:
    set $P614[$P613], $P612
.annotate 'line', 752
    .return ($P612)
.end


.namespace ["PAST";"Compiler"]
.sub "_block632"  :anon :subid("36_1308074680.10378") :outer("33_1308074680.10378")
.annotate 'line', 768
    .const 'Sub' $P702 = "38_1308074680.10378" 
    capture_lex $P702
    .const 'Sub' $P646 = "37_1308074680.10378" 
    capture_lex $P646
.annotate 'line', 770
    new $P634, "Undef"
    .lex "$ctrlpast", $P634
.annotate 'line', 771
    new $P635, "Undef"
    .lex "$ctrllabel", $P635
.annotate 'line', 784
    new $P636, "Undef"
    .lex "$sig", $P636
.annotate 'line', 786
    new $P637, "Undef"
    .lex "$ops", $P637
.annotate 'line', 788
    new $P638, "Undef"
    .lex "$retval", $P638
.annotate 'line', 790
    new $P639, "Undef"
    .lex "$eh", $P639
.annotate 'line', 770
    find_lex $P640, "$node"
    $P641 = $P640."control"()
    store_lex "$ctrlpast", $P641
    find_lex $P642, "$ctrllabel"
.annotate 'line', 773
    find_lex $P644, "$ctrlpast"
    unless $P644, if_643_end
    .const 'Sub' $P646 = "37_1308074680.10378" 
    capture_lex $P646
    $P646()
  if_643_end:
.annotate 'line', 784
    find_lex $P663, "$node"
    $P664 = $P663."list"()
    elements $I665, $P664
    repeat $S666, "v", $I665
    new $P667, 'String'
    set $P667, $S666
    concat $P668, $P667, "*"
    store_lex "$sig", $P668
.annotate 'line', 786
    find_lex $P669, "self"
    find_lex $P670, "$node"
    find_lex $P671, "$sig"
    $P672 = $P669."post_children"($P670, $P671 :named("signature"))
    store_lex "$ops", $P672
.annotate 'line', 788
    find_lex $P673, "$ops"
    unless_null $P673, vivify_235
    $P673 = root_new ['parrot';'ResizablePMCArray']
  vivify_235:
    set $P674, $P673[-1]
    unless_null $P674, vivify_236
    new $P674, "Undef"
  vivify_236:
    store_lex "$retval", $P674
.annotate 'line', 790
    find_lex $P675, "$node"
    $P676 = $P675."handlers"()
    store_lex "$eh", $P676
.annotate 'line', 791
    find_lex $P678, "$eh"
    unless $P678, if_677_end
.annotate 'line', 792
    find_lex $P679, "self"
    find_lex $P680, "$ops"
    find_lex $P681, "$eh"
    find_lex $P682, "%options"
    unless_null $P682, vivify_237
    $P682 = root_new ['parrot';'Hash']
  vivify_237:
    set $P683, $P682["rtype"]
    unless_null $P683, vivify_238
    new $P683, "Undef"
  vivify_238:
    $P684 = $P679."wrap_handlers"($P680, $P681, $P683 :named("rtype"))
    store_lex "$ops", $P684
  if_677_end:
.annotate 'line', 794
    find_lex $P685, "$bpost"
    find_lex $P686, "$ops"
    $P685."push"($P686)
.annotate 'line', 795
    find_lex $P687, "$bpost"
    find_lex $P688, "$retval"
    $P687."push_pirop"("return", $P688)
.annotate 'line', 797
    find_lex $P691, "$ctrlpast"
    if $P691, if_690
    set $P689, $P691
    goto if_690_end
  if_690:
.annotate 'line', 798
    find_lex $P692, "$bpost"
    find_lex $P693, "$ctrllabel"
    $P692."push"($P693)
.annotate 'line', 799
    find_lex $P694, "$bpost"
    $P694."push_pirop"(".local pmc exception")
.annotate 'line', 800
    find_lex $P695, "$bpost"
    $P695."push_pirop"(".get_results (exception)")
.annotate 'line', 801
    find_lex $P698, "$ctrlpast"
    set $S699, $P698
    iseq $I700, $S699, "return_pir"
    if $I700, if_697
.annotate 'line', 808
    find_lex $P714, "$ctrlpast"
    get_hll_global $P715, ["PAST"], "Node"
    $P716 = $P714."isa"($P715)
    if $P716, if_713
.annotate 'line', 812
    find_lex $P722, "self"
    new $P723, 'String'
    set $P723, "Unrecognized control handler '"
    find_lex $P724, "$ctrlpast"
    concat $P725, $P723, $P724
    concat $P726, $P725, "'"
    $P727 = $P722."panic"($P726)
.annotate 'line', 811
    set $P712, $P727
.annotate 'line', 808
    goto if_713_end
  if_713:
.annotate 'line', 809
    find_lex $P717, "$bpost"
    find_lex $P718, "self"
    find_lex $P719, "$ctrlpast"
    $P720 = $P718."as_post"($P719, "*" :named("rtype"))
    $P721 = $P717."push"($P720)
.annotate 'line', 808
    set $P712, $P721
  if_713_end:
    set $P696, $P712
.annotate 'line', 801
    goto if_697_end
  if_697:
    .const 'Sub' $P702 = "38_1308074680.10378" 
    capture_lex $P702
    $P711 = $P702()
    set $P696, $P711
  if_697_end:
.annotate 'line', 797
    set $P689, $P696
  if_690_end:
.annotate 'line', 768
    .return ($P689)
.end


.namespace ["PAST";"Compiler"]
.sub "_block645"  :anon :subid("37_1308074680.10378") :outer("36_1308074680.10378")
.annotate 'line', 775
    new $P647, "Undef"
    .lex "$reg", $P647
.annotate 'line', 774
    get_hll_global $P648, ["POST"], "Label"
    find_lex $P649, "self"
    $P650 = $P649."unique"("control_")
    $P651 = $P648."new"($P650 :named("result"))
    store_lex "$ctrllabel", $P651
.annotate 'line', 775
    find_lex $P652, "self"
    $P653 = $P652."uniquereg"("P")
    store_lex "$reg", $P653
.annotate 'line', 776
    find_lex $P654, "$bpost"
    find_lex $P655, "$reg"
    $P654."push_pirop"("new", $P655, "['ExceptionHandler']", ".CONTROL_RETURN")
.annotate 'line', 778
    find_lex $P656, "$bpost"
    find_lex $P657, "$reg"
    find_lex $P658, "$ctrllabel"
    $P656."push_pirop"("set_label", $P657, $P658)
.annotate 'line', 779
    find_lex $P659, "$bpost"
    find_lex $P660, "$reg"
    $P659."push_pirop"("push_eh", $P660)
.annotate 'line', 780
    find_lex $P661, "$bpost"
    $P662 = $P661."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 773
    .return ($P662)
.end


.namespace ["PAST";"Compiler"]
.sub "_block701"  :anon :subid("38_1308074680.10378") :outer("36_1308074680.10378")
.annotate 'line', 803
    new $P703, "Undef"
    .lex "$reg", $P703
    find_lex $P704, "self"
    $P705 = $P704."uniquereg"("P")
    store_lex "$reg", $P705
.annotate 'line', 804
    find_lex $P706, "$bpost"
    find_lex $P707, "$reg"
    $P706."push_pirop"("getattribute", $P707, "exception", "\"payload\"")
.annotate 'line', 806
    find_lex $P708, "$bpost"
    find_lex $P709, "$reg"
    $P710 = $P708."push_pirop"("return", $P709)
.annotate 'line', 801
    .return ($P710)
.end


.namespace ["PAST";"Compiler"]
.sub "_block731"  :anon :subid("39_1308074680.10378") :outer("33_1308074680.10378")
.annotate 'line', 819
    new $P733, "Undef"
    .lex "$lisub", $P733
    get_hll_global $P734, ["POST"], "Sub"
    find_lex $P735, "$bpost"
    $P736 = $P734."new"($P735 :named("outer"), ":load :init" :named("pirflags"))
    store_lex "$lisub", $P736
.annotate 'line', 820
    find_lex $P737, "$lisub"
    find_lex $P738, "$blockref"
    $P737."push_pirop"($P738)
.annotate 'line', 821
    find_lex $P739, "$lisub"
    $P739."push_pirop"(".local pmc", "block")
.annotate 'line', 822
    find_lex $P740, "$lisub"
    find_lex $P741, "$blockreg"
    $P740."push_pirop"("set", "block", $P741)
.annotate 'line', 823
    find_lex $P742, "$lisub"
    find_lex $P743, "self"
    find_lex $P744, "$node"
    $P745 = $P744."loadinit"()
    $P746 = $P743."as_post"($P745, "v" :named("rtype"))
    $P742."push"($P746)
.annotate 'line', 824
    find_lex $P747, "$lisub"
    find_lex $P748, "$bpost"
    unless_null $P748, vivify_241
    $P748 = root_new ['parrot';'Hash']
    store_lex "$bpost", $P748
  vivify_241:
    set $P748["loadinit"], $P747
.annotate 'line', 818
    .return ($P747)
.end


.namespace ["PAST";"Compiler"]
.sub "_block808"  :anon :subid("41_1308074680.10378") :outer("33_1308074680.10378")
.annotate 'line', 849
    new $P810, "Undef"
    .lex "$result", $P810
    find_lex $P811, "self"
    $P812 = $P811."uniquereg"("P")
    store_lex "$result", $P812
.annotate 'line', 850
    find_lex $P813, "$bpost"
    find_lex $P814, "$result"
    find_lex $P815, "$blockreg"
    $P813."push_pirop"("newclosure", $P814, $P815)
.annotate 'line', 851
    find_lex $P816, "$bpost"
    find_lex $P817, "$result"
    $P818 = $P816."result"($P817)
.annotate 'line', 846
    .return ($P818)
.end


.namespace ["PAST";"Compiler"]
.sub "_block758"  :anon :subid("40_1308074680.10378") :outer("33_1308074680.10378")
.annotate 'line', 834
    $P760 = root_new ['parrot';'ResizablePMCArray']
    .lex "@arglist", $P760
.annotate 'line', 836
    new $P761, "Undef"
    .lex "$result", $P761
.annotate 'line', 834
    find_lex $P762, "%options"
    unless_null $P762, vivify_244
    $P762 = root_new ['parrot';'Hash']
  vivify_244:
    set $P763, $P762["arglist"]
    unless_null $P763, vivify_245
    new $P763, "Undef"
  vivify_245:
    store_lex "@arglist", $P763
.annotate 'line', 835
    find_lex $P765, "@arglist"
    defined $I766, $P765
    if $I766, unless_764_end
    new $P767, "ResizablePMCArray"
    store_lex "@arglist", $P767
  unless_764_end:
.annotate 'line', 836
    find_lex $P768, "self"
    find_lex $P769, "$rtype"
    $P770 = $P768."uniquereg"($P769)
    store_lex "$result", $P770
.annotate 'line', 837
    get_hll_global $P771, ["POST"], "Ops"
    find_lex $P772, "$bpost"
    find_lex $P773, "$node"
    find_lex $P774, "$result"
    $P775 = $P771."new"($P772, $P773 :named("node"), $P774 :named("result"))
    store_lex "$bpost", $P775
.annotate 'line', 838
    find_lex $P776, "$bpost"
    find_lex $P777, "$blockref"
    $P776."push_pirop"($P777)
.annotate 'line', 839
    find_lex $P779, "$islexical"
    unless $P779, if_778_end
    find_lex $P780, "$bpost"
    find_lex $P781, "$blockreg"
    $P780."push_pirop"("capture_lex", $P781)
  if_778_end:
.annotate 'line', 840
    find_lex $P782, "$bpost"
    find_lex $P783, "$blockreg"
    find_lex $P784, "@arglist"
    find_lex $P785, "$result"
    $P786 = $P782."push_pirop"("call", $P783, $P784 :flat, $P785 :named("result"))
.annotate 'line', 833
    .return ($P786)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("42_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["PAST";"Op"])
    .param pmc param_830
    .param pmc param_831 :slurpy :named
.annotate 'line', 873
    new $P829, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P829, control_828
    push_eh $P829
    .lex "self", self
    .lex "$node", param_830
    .lex "%options", param_831
.annotate 'line', 875
    new $P832, "Undef"
    .lex "$lvalue", $P832
.annotate 'line', 876
    new $P833, "Undef"
    .lex "$child", $P833
.annotate 'line', 881
    new $P834, "Undef"
    .lex "$pasttype", $P834
.annotate 'line', 886
    new $P835, "Undef"
    .lex "$pirop", $P835
.annotate 'line', 891
    new $P836, "Undef"
    .lex "$inline", $P836
.annotate 'line', 875
    find_lex $P837, "$node"
    $P838 = $P837."lvalue"()
    store_lex "$lvalue", $P838
.annotate 'line', 876
    find_lex $P839, "$node"
    unless_null $P839, vivify_248
    $P839 = root_new ['parrot';'ResizablePMCArray']
  vivify_248:
    set $P840, $P839[0]
    unless_null $P840, vivify_249
    new $P840, "Undef"
  vivify_249:
    store_lex "$child", $P840
.annotate 'line', 877
    find_lex $P846, "$lvalue"
    if $P846, if_845
    set $P844, $P846
    goto if_845_end
  if_845:
    find_lex $P847, "$child"
    defined $I848, $P847
    new $P844, 'Integer'
    set $P844, $I848
  if_845_end:
    if $P844, if_843
    set $P842, $P844
    goto if_843_end
  if_843:
    find_lex $P849, "$child"
    exists $I850, $P849["lvalue"]
    new $P851, 'Integer'
    set $P851, $I850
    isfalse $I852, $P851
    new $P842, 'Integer'
    set $P842, $I852
  if_843_end:
    unless $P842, if_841_end
.annotate 'line', 878
    find_lex $P853, "$child"
    find_lex $P854, "$lvalue"
    $P853."lvalue"($P854)
  if_841_end:
.annotate 'line', 881
    find_lex $P855, "$node"
    $P856 = $P855."pasttype"()
    store_lex "$pasttype", $P856
.annotate 'line', 882
    find_lex $P858, "$pasttype"
    unless $P858, if_857_end
.annotate 'line', 883
    new $P859, "Exception"
    set $P859['type'], .CONTROL_RETURN
    find_lex $P860, "self"
    find_lex $P861, "$node"
    find_lex $P862, "%options"
    find_lex $P863, "$pasttype"
    set $S864, $P863
    $P865 = $P860.$S864($P861, $P862 :flat)
    setattribute $P859, 'payload', $P865
    throw $P859
  if_857_end:
.annotate 'line', 886
    find_lex $P866, "$node"
    $P867 = $P866."pirop"()
    store_lex "$pirop", $P867
.annotate 'line', 887
    find_lex $P869, "$pirop"
    unless $P869, if_868_end
.annotate 'line', 888
    new $P870, "Exception"
    set $P870['type'], .CONTROL_RETURN
    find_lex $P871, "self"
    find_lex $P872, "$node"
    find_lex $P873, "%options"
    $P874 = $P871."pirop"($P872, $P873 :flat)
    setattribute $P870, 'payload', $P874
    throw $P870
  if_868_end:
.annotate 'line', 891
    find_lex $P875, "$node"
    $P876 = $P875."inline"()
    store_lex "$inline", $P876
.annotate 'line', 892
    find_lex $P878, "$inline"
    unless $P878, if_877_end
.annotate 'line', 893
    new $P879, "Exception"
    set $P879['type'], .CONTROL_RETURN
    find_lex $P880, "self"
    find_lex $P881, "$node"
    find_lex $P882, "%options"
    $P883 = $P880."inline"($P881, $P882 :flat)
    setattribute $P879, 'payload', $P883
    throw $P879
  if_877_end:
.annotate 'line', 896
    find_lex $P884, "self"
    find_lex $P885, "$node"
    find_lex $P886, "%options"
    $P887 = $P884."call"($P885, $P886 :flat)
.annotate 'line', 873
    .return ($P887)
  control_828:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P888, exception, "payload"
    .return ($P888)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "pirop"  :subid("43_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["PAST";"Op"])
    .param pmc param_892
    .param pmc param_893 :slurpy :named
.annotate 'line', 904
    new $P891, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P891, control_890
    push_eh $P891
    .lex "self", self
    .lex "$node", param_892
    .lex "%options", param_893
.annotate 'line', 905
    new $P894, "Undef"
    .lex "$pirop", $P894
.annotate 'line', 906
    new $P895, "Undef"
    .lex "$signature", $P895
.annotate 'line', 907
    new $P896, "Undef"
    .lex "$I0", $P896
.annotate 'line', 923
    new $P897, "Undef"
    .lex "$ops", $P897
.annotate 'line', 924
    $P898 = root_new ['parrot';'ResizablePMCArray']
    .lex "@posargs", $P898
.annotate 'line', 934
    $P899 = root_new ['parrot';'ResizablePMCArray']
    .lex "@arglist", $P899
.annotate 'line', 936
    new $P900, "Undef"
    .lex "$S0", $P900
.annotate 'line', 947
    new $P901, "Undef"
    .lex "$result", $P901
.annotate 'line', 905
    find_lex $P902, "$node"
    $P903 = $P902."pirop"()
    store_lex "$pirop", $P903
    find_lex $P904, "$signature"
    find_lex $P905, "$I0"
.annotate 'line', 908
    find_lex $P907, "$pirop"
    set $S908, $P907
    index $I909, $S908, " "
    new $P910, 'Integer'
    set $P910, $I909
    store_lex "$I0", $P910
    set $N911, $P910
    isge $I912, $N911, 0.0
    if $I912, if_906
.annotate 'line', 913
    find_lex $P927, "$pirop"
    set $S928, $P927
    index $I929, $S928, "__"
    new $P930, 'Integer'
    set $P930, $I929
    store_lex "$I0", $P930
    set $N931, $P930
    isge $I932, $N931, 0.0
    if $I932, if_926
.annotate 'line', 919
    find_lex $P946, "$pirop"
    get_global $P947, "%piropsig"
    unless_null $P947, vivify_250
    $P947 = root_new ['parrot';'Hash']
  vivify_250:
    set $P948, $P947[$P946]
    unless_null $P948, vivify_251
    new $P948, "Undef"
  vivify_251:
    store_lex "$signature", $P948
.annotate 'line', 920
    find_lex $P950, "$signature"
    if $P950, unless_949_end
    new $P951, "String"
    assign $P951, "vP"
    store_lex "$signature", $P951
  unless_949_end:
.annotate 'line', 918
    goto if_926_end
  if_926:
.annotate 'line', 915
    find_lex $P933, "$pirop"
    set $S934, $P933
    find_lex $P935, "$I0"
    add $P936, $P935, 2
    set $I937, $P936
    substr $S938, $S934, $I937
    new $P939, 'String'
    set $P939, $S938
    store_lex "$signature", $P939
.annotate 'line', 916
    find_lex $P940, "$pirop"
    set $S941, $P940
    find_lex $P942, "$I0"
    set $I943, $P942
    substr $S944, $S941, 0, $I943
    new $P945, 'String'
    set $P945, $S944
    store_lex "$pirop", $P945
  if_926_end:
.annotate 'line', 913
    goto if_906_end
  if_906:
.annotate 'line', 910
    find_lex $P913, "$pirop"
    set $S914, $P913
    find_lex $P915, "$I0"
    add $P916, $P915, 1
    set $I917, $P916
    substr $S918, $S914, $I917
    new $P919, 'String'
    set $P919, $S918
    store_lex "$signature", $P919
.annotate 'line', 911
    find_lex $P920, "$pirop"
    set $S921, $P920
    find_lex $P922, "$I0"
    set $I923, $P922
    substr $S924, $S921, 0, $I923
    new $P925, 'String'
    set $P925, $S924
    store_lex "$pirop", $P925
  if_906_end:
.annotate 'line', 908
    find_lex $P952, "$ops"
    find_lex $P953, "@posargs"
.annotate 'line', 926

        $P0 = find_lex '$node'
        $P1 = find_lex '$signature'
        ($P0, $P1) = self.'post_children'($P0, 'signature' => $P1)
        store_lex '$ops', $P0
        store_lex '@posargs', $P1
    
.annotate 'line', 934
    find_lex $P954, "$ops"
    $P955 = $P954."list"()
    store_lex "@arglist", $P955
.annotate 'line', 936
    find_lex $P956, "$signature"
    set $S957, $P956
    substr $S958, $S957, 0, 1
    new $P959, 'String'
    set $P959, $S958
    store_lex "$S0", $P959
.annotate 'line', 937
    find_lex $P961, "$S0"
    set $S962, $P961
    iseq $I963, $S962, "v"
    unless $I963, if_960_end
.annotate 'line', 938
    find_lex $P964, "$ops"
    find_lex $P965, "$pirop"
    find_lex $P966, "@posargs"
    $P964."push_pirop"($P965, $P966 :flat)
.annotate 'line', 939
    new $P967, "Exception"
    set $P967['type'], .CONTROL_RETURN
    find_lex $P968, "$ops"
    setattribute $P967, 'payload', $P968
    throw $P967
  if_960_end:
.annotate 'line', 941
    find_lex $P969, "$S0"
    set $S970, $P969
    index $I971, "0123456789", $S970
    new $P972, 'Integer'
    set $P972, $I971
    store_lex "$I0", $P972
.annotate 'line', 942
    find_lex $P974, "$I0"
    set $N975, $P974
    isge $I976, $N975, 0.0
    unless $I976, if_973_end
.annotate 'line', 943
    find_lex $P977, "$ops"
    find_lex $P978, "$I0"
    set $I979, $P978
    find_lex $P980, "@arglist"
    unless_null $P980, vivify_252
    $P980 = root_new ['parrot';'ResizablePMCArray']
  vivify_252:
    set $P981, $P980[$I979]
    unless_null $P981, vivify_253
    new $P981, "Undef"
  vivify_253:
    $P977."result"($P981)
.annotate 'line', 944
    find_lex $P982, "$ops"
    find_lex $P983, "$pirop"
    find_lex $P984, "@posargs"
    $P982."push_pirop"($P983, $P984 :flat)
.annotate 'line', 945
    new $P985, "Exception"
    set $P985['type'], .CONTROL_RETURN
    find_lex $P986, "$ops"
    setattribute $P985, 'payload', $P986
    throw $P985
  if_973_end:
.annotate 'line', 947
    find_lex $P987, "self"
    find_lex $P988, "$S0"
    $P989 = $P987."uniquereg"($P988)
    store_lex "$result", $P989
.annotate 'line', 948
    find_lex $P990, "$ops"
    find_lex $P991, "$result"
    $P990."result"($P991)
.annotate 'line', 949
    find_lex $P992, "$ops"
    find_lex $P993, "$pirop"
    find_lex $P994, "$result"
    find_lex $P995, "@posargs"
    $P992."push_pirop"($P993, $P994, $P995 :flat)
.annotate 'line', 950
    new $P996, "Exception"
    set $P996['type'], .CONTROL_RETURN
    find_lex $P997, "$ops"
    setattribute $P996, 'payload', $P997
    throw $P996
.annotate 'line', 904
    .return ()
  control_890:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P998, exception, "payload"
    .return ($P998)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "call"  :subid("44_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["PAST";"Op"])
    .param pmc param_1002
    .param pmc param_1003 :slurpy :named
.annotate 'line', 958
    .const 'Sub' $P1045 = "45_1308074680.10378" 
    capture_lex $P1045
    new $P1001, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1001, control_1000
    push_eh $P1001
    .lex "self", self
    .lex "$node", param_1002
    .lex "%options", param_1003
.annotate 'line', 959
    new $P1004, "Undef"
    .lex "$pasttype", $P1004
.annotate 'line', 962
    new $P1005, "Undef"
    .lex "$signature", $P1005
.annotate 'line', 966
    new $P1006, "Undef"
    .lex "$name", $P1006
.annotate 'line', 967
    new $P1007, "Undef"
    .lex "$ops", $P1007
.annotate 'line', 968
    $P1008 = root_new ['parrot';'ResizablePMCArray']
    .lex "@posargs", $P1008
.annotate 'line', 969
    $P1009 = root_new ['parrot';'Hash']
    .lex "%namedargs", $P1009
.annotate 'line', 994
    new $P1010, "Undef"
    .lex "$rtype", $P1010
.annotate 'line', 995
    new $P1011, "Undef"
    .lex "$result", $P1011
.annotate 'line', 959
    find_lex $P1012, "$node"
    $P1013 = $P1012."pasttype"()
    store_lex "$pasttype", $P1013
.annotate 'line', 960
    find_lex $P1015, "$pasttype"
    if $P1015, unless_1014_end
    new $P1016, "String"
    assign $P1016, "call"
    store_lex "$pasttype", $P1016
  unless_1014_end:
.annotate 'line', 962
    new $P1017, "String"
    assign $P1017, "v:"
    store_lex "$signature", $P1017
.annotate 'line', 964
    find_lex $P1019, "$pasttype"
    set $S1020, $P1019
    iseq $I1021, $S1020, "callmethod"
    unless $I1021, if_1018_end
    new $P1022, "String"
    assign $P1022, "vP:"
    store_lex "$signature", $P1022
  if_1018_end:
.annotate 'line', 966
    find_lex $P1023, "$node"
    $P1024 = $P1023."name"()
    store_lex "$name", $P1024
    find_lex $P1025, "$ops"
    find_lex $P1026, "@posargs"
    find_lex $P1027, "%namedargs"
.annotate 'line', 971
    find_lex $P1029, "$name"
    if $P1029, unless_1028_end
    find_lex $P1030, "$signature"
    set $S1031, $P1030
    replace $S1032, $S1031, 1, 0, "P"
    new $P1033, 'String'
    set $P1033, $S1032
    store_lex "$signature", $P1033
  unless_1028_end:
.annotate 'line', 973

        $P0 = find_lex '$node'
        $P1 = find_lex '$signature'
        ($P0, $P1, $P2) = self.'post_children'($P0, 'signature'=>$P1)
        store_lex '$ops', $P0
        store_lex '@posargs', $P1
        store_lex '%namedargs', $P2
    
.annotate 'line', 981
    find_lex $P1035, "$name"
    unless $P1035, if_1034_end
.annotate 'line', 982
    find_lex $P1039, "$name"
    isa $I1040, $P1039, "P6object"
    if $I1040, if_1038
    new $P1037, 'Integer'
    set $P1037, $I1040
    goto if_1038_end
  if_1038:
    find_lex $P1041, "$name"
    get_hll_global $P1042, ["PAST"], "Node"
    $P1043 = $P1041."isa"($P1042)
    set $P1037, $P1043
  if_1038_end:
    if $P1037, if_1036
.annotate 'line', 989
    find_lex $P1057, "@posargs"
    find_lex $P1058, "self"
    find_lex $P1059, "$name"
    $P1060 = $P1058."escape"($P1059)
    unshift $P1057, $P1060
.annotate 'line', 988
    goto if_1036_end
  if_1036:
.annotate 'line', 982
    .const 'Sub' $P1045 = "45_1308074680.10378" 
    capture_lex $P1045
    $P1045()
  if_1036_end:
  if_1034_end:
.annotate 'line', 994
    find_lex $P1061, "%options"
    unless_null $P1061, vivify_254
    $P1061 = root_new ['parrot';'Hash']
  vivify_254:
    set $P1062, $P1061["rtype"]
    unless_null $P1062, vivify_255
    new $P1062, "Undef"
  vivify_255:
    store_lex "$rtype", $P1062
.annotate 'line', 995
    find_lex $P1063, "self"
    find_lex $P1064, "$rtype"
    $P1065 = $P1063."uniquereg"($P1064)
    store_lex "$result", $P1065
.annotate 'line', 996
    find_lex $P1066, "$ops"
    find_lex $P1067, "$pasttype"
    find_lex $P1068, "@posargs"
    find_lex $P1069, "%namedargs"
    find_lex $P1070, "$result"
    $P1066."push_pirop"($P1067, $P1068 :flat, $P1069 :flat, $P1070 :named("result"))
.annotate 'line', 997
    find_lex $P1071, "$ops"
    find_lex $P1072, "$result"
    $P1071."result"($P1072)
    find_lex $P1073, "$ops"
.annotate 'line', 958
    .return ($P1073)
  control_1000:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1074, exception, "payload"
    .return ($P1074)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1044"  :anon :subid("45_1308074680.10378") :outer("44_1308074680.10378")
.annotate 'line', 983
    new $P1046, "Undef"
    .lex "$name_post", $P1046
    find_lex $P1047, "self"
    find_lex $P1048, "$name"
    $P1049 = $P1047."as_post"($P1048, "s" :named("rtype"))
    store_lex "$name_post", $P1049
.annotate 'line', 984
    find_lex $P1050, "self"
    find_lex $P1051, "$name_post"
    $P1052 = $P1050."coerce"($P1051, "s")
    store_lex "$name_post", $P1052
.annotate 'line', 985
    find_lex $P1053, "$ops"
    find_lex $P1054, "$name_post"
    $P1053."push"($P1054)
.annotate 'line', 986
    find_lex $P1055, "@posargs"
    find_lex $P1056, "$name_post"
    unshift $P1055, $P1056
.annotate 'line', 982
    .return ($P1055)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "callmethod"  :subid("46_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["PAST";"Op"])
    .param pmc param_1078
    .param pmc param_1079 :slurpy :named
.annotate 'line', 1006
    new $P1077, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1077, control_1076
    push_eh $P1077
    .lex "self", self
    .lex "$node", param_1078
    .lex "%options", param_1079
.annotate 'line', 1007
    find_lex $P1080, "self"
    find_lex $P1081, "$node"
    find_lex $P1082, "%options"
    $P1083 = $P1080."call"($P1081, $P1082 :flat)
.annotate 'line', 1006
    .return ($P1083)
  control_1076:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1084, exception, "payload"
    .return ($P1084)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "if"  :subid("47_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["PAST";"Op"])
    .param pmc param_1088
    .param pmc param_1089 :slurpy :named
.annotate 'line', 1016
    .const 'Sub' $P1227 = "50_1308074680.10378" 
    capture_lex $P1227
    .const 'Sub' $P1105 = "48_1308074680.10378" 
    capture_lex $P1105
    new $P1087, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1087, control_1086
    push_eh $P1087
    .lex "self", self
    .lex "$node", param_1088
    .lex "%options", param_1089
.annotate 'line', 1017
    new $P1090, "Undef"
    .lex "$ops", $P1090
.annotate 'line', 1019
    new $P1091, "Undef"
    .lex "$rtype", $P1091
.annotate 'line', 1020
    new $P1092, "Undef"
    .lex "$result", $P1092
.annotate 'line', 1023
    new $P1093, "Undef"
    .lex "$pasttype", $P1093
.annotate 'line', 1025
    new $P1094, "Undef"
    .lex "$exprpast", $P1094
.annotate 'line', 1026
    new $P1095, "Undef"
    .lex "$thenpast", $P1095
.annotate 'line', 1027
    new $P1096, "Undef"
    .lex "$elsepast", $P1096
.annotate 'line', 1029
    new $P1097, "Undef"
    .lex "$S0", $P1097
.annotate 'line', 1030
    new $P1098, "Undef"
    .lex "$thenlabel", $P1098
.annotate 'line', 1031
    new $P1099, "Undef"
    .lex "$endlabel", $P1099
.annotate 'line', 1033
    new $P1100, "Undef"
    .lex "$exprrtype", $P1100
.annotate 'line', 1035
    new $P1101, "Undef"
    .lex "$childrtype", $P1101
.annotate 'line', 1038
    new $P1102, "Undef"
    .lex "$exprpost", $P1102
.annotate 'line', 1040
    new $P1103, "Undef"
    .lex "$thenpost", $P1103
.annotate 'line', 1041
    new $P1104, "Undef"
    .lex "$elsepost", $P1104
.annotate 'line', 1063
    .const 'Sub' $P1105 = "48_1308074680.10378" 
    newclosure $P1147, $P1105
    .lex "make_childpost", $P1147
.annotate 'line', 1017
    get_hll_global $P1148, ["POST"], "Ops"
    find_lex $P1149, "$node"
    $P1150 = $P1148."new"($P1149 :named("node"))
    store_lex "$ops", $P1150
.annotate 'line', 1019
    find_lex $P1151, "%options"
    unless_null $P1151, vivify_257
    $P1151 = root_new ['parrot';'Hash']
  vivify_257:
    set $P1152, $P1151["rtype"]
    unless_null $P1152, vivify_258
    new $P1152, "Undef"
  vivify_258:
    store_lex "$rtype", $P1152
.annotate 'line', 1020
    find_lex $P1153, "self"
    find_lex $P1154, "$rtype"
    $P1155 = $P1153."uniquereg"($P1154)
    store_lex "$result", $P1155
.annotate 'line', 1021
    find_lex $P1156, "$ops"
    find_lex $P1157, "$result"
    $P1156."result"($P1157)
.annotate 'line', 1023
    find_lex $P1158, "$node"
    $P1159 = $P1158."pasttype"()
    store_lex "$pasttype", $P1159
.annotate 'line', 1025
    find_lex $P1160, "$node"
    unless_null $P1160, vivify_259
    $P1160 = root_new ['parrot';'ResizablePMCArray']
  vivify_259:
    set $P1161, $P1160[0]
    unless_null $P1161, vivify_260
    new $P1161, "Undef"
  vivify_260:
    store_lex "$exprpast", $P1161
.annotate 'line', 1026
    find_lex $P1162, "$node"
    unless_null $P1162, vivify_261
    $P1162 = root_new ['parrot';'ResizablePMCArray']
  vivify_261:
    set $P1163, $P1162[1]
    unless_null $P1163, vivify_262
    new $P1163, "Undef"
  vivify_262:
    store_lex "$thenpast", $P1163
.annotate 'line', 1027
    find_lex $P1164, "$node"
    unless_null $P1164, vivify_263
    $P1164 = root_new ['parrot';'ResizablePMCArray']
  vivify_263:
    set $P1165, $P1164[2]
    unless_null $P1165, vivify_264
    new $P1165, "Undef"
  vivify_264:
    store_lex "$elsepast", $P1165
.annotate 'line', 1029
    find_lex $P1166, "self"
    find_lex $P1167, "$pasttype"
    concat $P1168, $P1167, "_"
    $P1169 = $P1166."unique"($P1168)
    store_lex "$S0", $P1169
.annotate 'line', 1030
    get_hll_global $P1170, ["POST"], "Label"
    find_lex $P1171, "$S0"
    $P1172 = $P1170."new"($P1171 :named("result"))
    store_lex "$thenlabel", $P1172
.annotate 'line', 1031
    get_hll_global $P1173, ["POST"], "Label"
    find_lex $P1174, "$S0"
    concat $P1175, $P1174, "_end"
    $P1176 = $P1173."new"($P1175 :named("result"))
    store_lex "$endlabel", $P1176
.annotate 'line', 1033
    new $P1177, "String"
    assign $P1177, "r"
    store_lex "$exprrtype", $P1177
.annotate 'line', 1034
    find_lex $P1179, "$rtype"
    set $S1180, $P1179
    iseq $I1181, $S1180, "v"
    unless $I1181, if_1178_end
    new $P1182, "String"
    assign $P1182, "*"
    store_lex "$exprrtype", $P1182
  if_1178_end:
.annotate 'line', 1035
    find_lex $P1183, "$rtype"
    store_lex "$childrtype", $P1183
.annotate 'line', 1036
    find_lex $P1185, "$rtype"
    set $S1186, $P1185
    index $I1187, "*:", $S1186
    set $N1188, $I1187
    isge $I1189, $N1188, 0.0
    unless $I1189, if_1184_end
    new $P1190, "String"
    assign $P1190, "P"
    store_lex "$childrtype", $P1190
  if_1184_end:
.annotate 'line', 1038
    find_lex $P1191, "self"
    find_lex $P1192, "$exprpast"
    find_lex $P1193, "$exprrtype"
    $P1194 = $P1191."as_post"($P1192, $P1193 :named("rtype"))
    store_lex "$exprpost", $P1194
.annotate 'line', 1040
    find_lex $P1195, "$thenpast"
    $P1196 = "make_childpost"($P1195)
    store_lex "$thenpost", $P1196
.annotate 'line', 1041
    find_lex $P1197, "$elsepast"
    $P1198 = "make_childpost"($P1197)
    store_lex "$elsepost", $P1198
.annotate 'line', 1043
    find_lex $P1200, "$elsepost"
    defined $I1201, $P1200
    if $I1201, if_1199
.annotate 'line', 1053
    .const 'Sub' $P1227 = "50_1308074680.10378" 
    capture_lex $P1227
    $P1227()
    goto if_1199_end
  if_1199:
.annotate 'line', 1044
    find_lex $P1202, "$ops"
    find_lex $P1203, "$exprpost"
    $P1202."push"($P1203)
.annotate 'line', 1045
    find_lex $P1204, "$ops"
    find_lex $P1205, "$pasttype"
    find_lex $P1206, "$exprpost"
    find_lex $P1207, "$thenlabel"
    $P1204."push_pirop"($P1205, $P1206, $P1207)
.annotate 'line', 1046
    find_lex $P1209, "$elsepost"
    defined $I1210, $P1209
    unless $I1210, if_1208_end
    find_lex $P1211, "$ops"
    find_lex $P1212, "$elsepost"
    $P1211."push"($P1212)
  if_1208_end:
.annotate 'line', 1047
    find_lex $P1213, "$ops"
    find_lex $P1214, "$endlabel"
    $P1213."push_pirop"("goto", $P1214)
.annotate 'line', 1048
    find_lex $P1215, "$ops"
    find_lex $P1216, "$thenlabel"
    $P1215."push"($P1216)
.annotate 'line', 1049
    find_lex $P1218, "$thenpost"
    defined $I1219, $P1218
    unless $I1219, if_1217_end
    find_lex $P1220, "$ops"
    find_lex $P1221, "$thenpost"
    $P1220."push"($P1221)
  if_1217_end:
.annotate 'line', 1050
    find_lex $P1222, "$ops"
    find_lex $P1223, "$endlabel"
    $P1222."push"($P1223)
.annotate 'line', 1051
    new $P1224, "Exception"
    set $P1224['type'], .CONTROL_RETURN
    find_lex $P1225, "$ops"
    setattribute $P1224, 'payload', $P1225
    throw $P1224
  if_1199_end:
.annotate 'line', 1043
    find_lex $P1252, "make_childpost"
.annotate 'line', 1016
    .return ($P1252)
  control_1086:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1253, exception, "payload"
    .return ($P1253)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "make_childpost"  :subid("48_1308074680.10378") :outer("47_1308074680.10378")
    .param pmc param_1108 :optional
    .param int has_param_1108 :opt_flag
.annotate 'line', 1063
    .const 'Sub' $P1116 = "49_1308074680.10378" 
    capture_lex $P1116
    new $P1107, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1107, control_1106
    push_eh $P1107
    if has_param_1108, optparam_256
    new $P1109, "Undef"
    set param_1108, $P1109
  optparam_256:
    .lex "$childpast", param_1108
.annotate 'line', 1064
    new $P1110, "Undef"
    .lex "$childpost", $P1110
.annotate 'line', 1063
    find_lex $P1111, "$childpost"
.annotate 'line', 1065
    find_lex $P1113, "$childpast"
    defined $I1114, $P1113
    if $I1114, if_1112
.annotate 'line', 1072
    find_lex $P1131, "$rtype"
    set $S1132, $P1131
    iseq $I1133, $S1132, "v"
    unless $I1133, if_1130_end
    new $P1134, "Exception"
    set $P1134['type'], .CONTROL_RETURN
    find_lex $P1135, "$childpost"
    setattribute $P1134, 'payload', $P1135
    throw $P1134
  if_1130_end:
.annotate 'line', 1073
    get_hll_global $P1136, ["POST"], "Ops"
    find_lex $P1137, "$exprpost"
    $P1138 = $P1136."new"($P1137 :named("result"))
    store_lex "$childpost", $P1138
.annotate 'line', 1071
    goto if_1112_end
  if_1112:
.annotate 'line', 1065
    .const 'Sub' $P1116 = "49_1308074680.10378" 
    capture_lex $P1116
    $P1116()
  if_1112_end:
.annotate 'line', 1075
    find_lex $P1140, "$result"
    unless $P1140, if_1139_end
    find_lex $P1141, "self"
    find_lex $P1142, "$childpost"
    find_lex $P1143, "$result"
    $P1144 = $P1141."coerce"($P1142, $P1143)
    store_lex "$childpost", $P1144
  if_1139_end:
    find_lex $P1145, "$childpost"
.annotate 'line', 1063
    .return ($P1145)
  control_1106:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1146, exception, "payload"
    .return ($P1146)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1115"  :anon :subid("49_1308074680.10378") :outer("48_1308074680.10378")
.annotate 'line', 1066
    $P1117 = root_new ['parrot';'ResizablePMCArray']
    .lex "@arglist", $P1117
    new $P1118, "ResizablePMCArray"
    store_lex "@arglist", $P1118
.annotate 'line', 1067
    find_lex $P1120, "$childpast"
    $N1121 = $P1120."arity"()
    isgt $I1122, $N1121, 0.0
    unless $I1122, if_1119_end
    find_lex $P1123, "@arglist"
    find_lex $P1124, "$exprpost"
    push $P1123, $P1124
  if_1119_end:
.annotate 'line', 1068
    find_lex $P1125, "self"
    find_lex $P1126, "$childpast"
    find_lex $P1127, "$childrtype"
    find_lex $P1128, "@arglist"
    $P1129 = $P1125."as_post"($P1126, $P1127 :named("rtype"), $P1128 :named("arglist"))
    store_lex "$childpost", $P1129
.annotate 'line', 1065
    .return ($P1129)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1226"  :anon :subid("50_1308074680.10378") :outer("47_1308074680.10378")
.annotate 'line', 1054
    new $P1228, "Undef"
    .lex "$S0", $P1228
    new $P1229, "String"
    assign $P1229, "if"
    store_lex "$S0", $P1229
.annotate 'line', 1055
    find_lex $P1231, "$pasttype"
    set $S1232, $P1231
    find_lex $P1233, "$S0"
    set $S1234, $P1233
    iseq $I1235, $S1232, $S1234
    unless $I1235, if_1230_end
    new $P1236, "String"
    assign $P1236, "unless"
    store_lex "$S0", $P1236
  if_1230_end:
.annotate 'line', 1056
    find_lex $P1237, "$ops"
    find_lex $P1238, "$exprpost"
    $P1237."push"($P1238)
.annotate 'line', 1057
    find_lex $P1239, "$ops"
    find_lex $P1240, "$S0"
    find_lex $P1241, "$exprpost"
    find_lex $P1242, "$endlabel"
    $P1239."push_pirop"($P1240, $P1241, $P1242)
.annotate 'line', 1058
    find_lex $P1244, "$thenpost"
    defined $I1245, $P1244
    unless $I1245, if_1243_end
    find_lex $P1246, "$ops"
    find_lex $P1247, "$thenpost"
    $P1246."push"($P1247)
  if_1243_end:
.annotate 'line', 1059
    find_lex $P1248, "$ops"
    find_lex $P1249, "$endlabel"
    $P1248."push"($P1249)
.annotate 'line', 1060
    new $P1250, "Exception"
    set $P1250['type'], .CONTROL_RETURN
    find_lex $P1251, "$ops"
    setattribute $P1250, 'payload', $P1251
    throw $P1250
.annotate 'line', 1053
    .return ()
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "unless"  :subid("51_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["PAST";"Op"])
    .param pmc param_1257
    .param pmc param_1258 :slurpy :named
.annotate 'line', 1080
    new $P1256, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1256, control_1255
    push_eh $P1256
    .lex "self", self
    .lex "$node", param_1257
    .lex "%options", param_1258
.annotate 'line', 1081
    find_lex $P1259, "self"
    find_lex $P1260, "$node"
    find_lex $P1261, "%options"
    $P1262 = $P1259."if"($P1260, $P1261 :flat)
.annotate 'line', 1080
    .return ($P1262)
  control_1255:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1263, exception, "payload"
    .return ($P1263)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "loop_gen"  :subid("52_1308074680.10378") :method :outer("11_1308074680.10378")
    .param pmc param_1267 :slurpy :named
.annotate 'line', 1088
    new $P1266, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1266, control_1265
    push_eh $P1266
    .lex "self", self
    .lex "%options", param_1267
.annotate 'line', 1089
    new $P1268, "Undef"
    .lex "$loopname", $P1268
.annotate 'line', 1090
    new $P1269, "Undef"
    .lex "$testlabel", $P1269
.annotate 'line', 1091
    new $P1270, "Undef"
    .lex "$redolabel", $P1270
.annotate 'line', 1092
    new $P1271, "Undef"
    .lex "$nextlabel", $P1271
.annotate 'line', 1093
    new $P1272, "Undef"
    .lex "$donelabel", $P1272
.annotate 'line', 1094
    new $P1273, "Undef"
    .lex "$handlabel", $P1273
.annotate 'line', 1096
    new $P1274, "Undef"
    .lex "$testop", $P1274
.annotate 'line', 1097
    new $P1275, "Undef"
    .lex "$testpost", $P1275
.annotate 'line', 1098
    new $P1276, "Undef"
    .lex "$prepost", $P1276
.annotate 'line', 1099
    new $P1277, "Undef"
    .lex "$bodypost", $P1277
.annotate 'line', 1100
    new $P1278, "Undef"
    .lex "$nextpost", $P1278
.annotate 'line', 1101
    new $P1279, "Undef"
    .lex "$bodyfirst", $P1279
.annotate 'line', 1105
    new $P1280, "Undef"
    .lex "$ops", $P1280
.annotate 'line', 1109
    new $P1281, "Undef"
    .lex "$handreg", $P1281
.annotate 'line', 1131
    new $P1282, "Undef"
    .lex "$S0", $P1282
.annotate 'line', 1089
    find_lex $P1283, "self"
    $P1284 = $P1283."unique"("loop")
    store_lex "$loopname", $P1284
.annotate 'line', 1090
    get_hll_global $P1285, ["POST"], "Label"
    find_lex $P1286, "$loopname"
    concat $P1287, $P1286, "_test"
    $P1288 = $P1285."new"($P1287 :named("result"))
    store_lex "$testlabel", $P1288
.annotate 'line', 1091
    get_hll_global $P1289, ["POST"], "Label"
    find_lex $P1290, "$loopname"
    concat $P1291, $P1290, "_redo"
    $P1292 = $P1289."new"($P1291 :named("result"))
    store_lex "$redolabel", $P1292
.annotate 'line', 1092
    get_hll_global $P1293, ["POST"], "Label"
    find_lex $P1294, "$loopname"
    concat $P1295, $P1294, "_next"
    $P1296 = $P1293."new"($P1295 :named("result"))
    store_lex "$nextlabel", $P1296
.annotate 'line', 1093
    get_hll_global $P1297, ["POST"], "Label"
    find_lex $P1298, "$loopname"
    concat $P1299, $P1298, "_done"
    $P1300 = $P1297."new"($P1299 :named("result"))
    store_lex "$donelabel", $P1300
.annotate 'line', 1094
    get_hll_global $P1301, ["POST"], "Label"
    find_lex $P1302, "$loopname"
    concat $P1303, $P1302, "_handler"
    $P1304 = $P1301."new"($P1303 :named("result"))
    store_lex "$handlabel", $P1304
.annotate 'line', 1096
    find_lex $P1305, "%options"
    unless_null $P1305, vivify_265
    $P1305 = root_new ['parrot';'Hash']
  vivify_265:
    set $P1306, $P1305["testop"]
    unless_null $P1306, vivify_266
    new $P1306, "Undef"
  vivify_266:
    store_lex "$testop", $P1306
.annotate 'line', 1097
    find_lex $P1307, "%options"
    unless_null $P1307, vivify_267
    $P1307 = root_new ['parrot';'Hash']
  vivify_267:
    set $P1308, $P1307["test"]
    unless_null $P1308, vivify_268
    new $P1308, "Undef"
  vivify_268:
    store_lex "$testpost", $P1308
.annotate 'line', 1098
    find_lex $P1309, "%options"
    unless_null $P1309, vivify_269
    $P1309 = root_new ['parrot';'Hash']
  vivify_269:
    set $P1310, $P1309["pre"]
    unless_null $P1310, vivify_270
    new $P1310, "Undef"
  vivify_270:
    store_lex "$prepost", $P1310
.annotate 'line', 1099
    find_lex $P1311, "%options"
    unless_null $P1311, vivify_271
    $P1311 = root_new ['parrot';'Hash']
  vivify_271:
    set $P1312, $P1311["body"]
    unless_null $P1312, vivify_272
    new $P1312, "Undef"
  vivify_272:
    store_lex "$bodypost", $P1312
.annotate 'line', 1100
    find_lex $P1313, "%options"
    unless_null $P1313, vivify_273
    $P1313 = root_new ['parrot';'Hash']
  vivify_273:
    set $P1314, $P1313["next"]
    unless_null $P1314, vivify_274
    new $P1314, "Undef"
  vivify_274:
    store_lex "$nextpost", $P1314
.annotate 'line', 1101
    find_lex $P1315, "%options"
    unless_null $P1315, vivify_275
    $P1315 = root_new ['parrot';'Hash']
  vivify_275:
    set $P1316, $P1315["bodyfirst"]
    unless_null $P1316, vivify_276
    new $P1316, "Undef"
  vivify_276:
    store_lex "$bodyfirst", $P1316
.annotate 'line', 1103
    find_lex $P1318, "$testop"
    if $P1318, unless_1317_end
    new $P1319, "String"
    assign $P1319, "unless"
    store_lex "$testop", $P1319
  unless_1317_end:
.annotate 'line', 1105
    get_hll_global $P1320, ["POST"], "Ops"
    $P1321 = $P1320."new"()
    store_lex "$ops", $P1321
.annotate 'line', 1107
    find_dynamic_lex $P1322, "$*SUB"
    unless_null $P1322, vivify_277
    get_hll_global $P1322, "$SUB"
    unless_null $P1322, vivify_278
    die "Contextual $*SUB not found"
  vivify_278:
  vivify_277:
    $P1322."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 1109
    find_lex $P1323, "self"
    $P1324 = $P1323."uniquereg"("P")
    store_lex "$handreg", $P1324
.annotate 'line', 1110
    find_lex $P1325, "$ops"
    find_lex $P1326, "$handreg"
    $P1325."push_pirop"("new", $P1326, "'ExceptionHandler'")
.annotate 'line', 1111
    find_lex $P1327, "$ops"
    find_lex $P1328, "$handreg"
    find_lex $P1329, "$handlabel"
    $P1327."push_pirop"("set_label", $P1328, $P1329)
.annotate 'line', 1112
    find_lex $P1330, "$ops"
    find_lex $P1331, "$handreg"
    $P1330."push_pirop"("callmethod", "\"handle_types\"", $P1331, ".CONTROL_LOOP_NEXT", ".CONTROL_LOOP_REDO", ".CONTROL_LOOP_LAST")
.annotate 'line', 1114
    find_lex $P1332, "$ops"
    find_lex $P1333, "$handreg"
    $P1332."push_pirop"("push_eh", $P1333)
.annotate 'line', 1116
    find_lex $P1335, "$bodyfirst"
    unless $P1335, if_1334_end
    find_lex $P1336, "$ops"
    find_lex $P1337, "$redolabel"
    $P1336."push_pirop"("goto", $P1337)
  if_1334_end:
.annotate 'line', 1117
    find_lex $P1338, "$ops"
    find_lex $P1339, "$testlabel"
    $P1338."push"($P1339)
.annotate 'line', 1118
    find_lex $P1341, "$testpost"
    unless $P1341, if_1340_end
.annotate 'line', 1119
    find_lex $P1342, "$ops"
    find_lex $P1343, "$testpost"
    $P1342."push"($P1343)
.annotate 'line', 1120
    find_lex $P1344, "$ops"
    find_lex $P1345, "$testop"
    find_lex $P1346, "$testpost"
    find_lex $P1347, "$donelabel"
    $P1344."push_pirop"($P1345, $P1346, $P1347)
  if_1340_end:
.annotate 'line', 1122
    find_lex $P1349, "$prepost"
    unless $P1349, if_1348_end
    find_lex $P1350, "$ops"
    find_lex $P1351, "$prepost"
    $P1350."push"($P1351)
  if_1348_end:
.annotate 'line', 1123
    find_lex $P1352, "$ops"
    find_lex $P1353, "$redolabel"
    $P1352."push"($P1353)
.annotate 'line', 1124
    find_lex $P1355, "$bodypost"
    unless $P1355, if_1354_end
    find_lex $P1356, "$ops"
    find_lex $P1357, "$bodypost"
    $P1356."push"($P1357)
  if_1354_end:
.annotate 'line', 1125
    find_lex $P1358, "$ops"
    find_lex $P1359, "$nextlabel"
    $P1358."push"($P1359)
.annotate 'line', 1126
    find_lex $P1361, "$nextpost"
    unless $P1361, if_1360_end
    find_lex $P1362, "$ops"
    find_lex $P1363, "$nextpost"
    $P1362."push"($P1363)
  if_1360_end:
.annotate 'line', 1127
    find_lex $P1364, "$ops"
    find_lex $P1365, "$testlabel"
    $P1364."push_pirop"("goto", $P1365)
.annotate 'line', 1128
    find_lex $P1366, "$ops"
    find_lex $P1367, "$handlabel"
    $P1366."push"($P1367)
.annotate 'line', 1129
    find_lex $P1368, "$ops"
    $P1368."push_pirop"(".local pmc exception")
.annotate 'line', 1130
    find_lex $P1369, "$ops"
    $P1369."push_pirop"(".get_results (exception)")
.annotate 'line', 1131
    find_lex $P1370, "self"
    $P1371 = $P1370."uniquereg"("P")
    store_lex "$S0", $P1371
.annotate 'line', 1132
    find_lex $P1372, "$ops"
    find_lex $P1373, "$S0"
    $P1372."push_pirop"("getattribute", $P1373, "exception", "'type'")
.annotate 'line', 1133
    find_lex $P1374, "$ops"
    find_lex $P1375, "$S0"
    find_lex $P1376, "$nextlabel"
    $P1374."push_pirop"("eq", $P1375, ".CONTROL_LOOP_NEXT", $P1376)
.annotate 'line', 1134
    find_lex $P1377, "$ops"
    find_lex $P1378, "$S0"
    find_lex $P1379, "$redolabel"
    $P1377."push_pirop"("eq", $P1378, ".CONTROL_LOOP_REDO", $P1379)
.annotate 'line', 1135
    find_lex $P1380, "$ops"
    find_lex $P1381, "$donelabel"
    $P1380."push"($P1381)
.annotate 'line', 1136
    find_lex $P1382, "$ops"
    $P1382."push_pirop"("pop_eh")
    find_lex $P1383, "$ops"
.annotate 'line', 1088
    .return ($P1383)
  control_1265:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1384, exception, "payload"
    .return ($P1384)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "while"  :subid("53_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["PAST";"Op"])
    .param pmc param_1388
    .param pmc param_1389 :slurpy :named
.annotate 'line', 1147
    new $P1387, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1387, control_1386
    push_eh $P1387
    .lex "self", self
    .lex "$node", param_1388
    .lex "%options", param_1389
.annotate 'line', 1148
    new $P1390, "Undef"
    .lex "$exprpast", $P1390
.annotate 'line', 1149
    new $P1391, "Undef"
    .lex "$bodypast", $P1391
.annotate 'line', 1150
    new $P1392, "Undef"
    .lex "$nextpast", $P1392
.annotate 'line', 1152
    new $P1393, "Undef"
    .lex "$exprpost", $P1393
.annotate 'line', 1154
    $P1394 = root_new ['parrot';'ResizablePMCArray']
    .lex "@arglist", $P1394
.annotate 'line', 1156
    new $P1395, "Undef"
    .lex "$bodypost", $P1395
.annotate 'line', 1158
    new $P1396, "Undef"
    .lex "$nextpost", $P1396
.annotate 'line', 1161
    new $P1397, "Undef"
    .lex "$testop", $P1397
.annotate 'line', 1162
    new $P1398, "Undef"
    .lex "$bodyfirst", $P1398
.annotate 'line', 1164
    new $P1399, "Undef"
    .lex "$ops", $P1399
.annotate 'line', 1148
    find_lex $P1400, "$node"
    unless_null $P1400, vivify_279
    $P1400 = root_new ['parrot';'ResizablePMCArray']
  vivify_279:
    set $P1401, $P1400[0]
    unless_null $P1401, vivify_280
    new $P1401, "Undef"
  vivify_280:
    store_lex "$exprpast", $P1401
.annotate 'line', 1149
    find_lex $P1402, "$node"
    unless_null $P1402, vivify_281
    $P1402 = root_new ['parrot';'ResizablePMCArray']
  vivify_281:
    set $P1403, $P1402[1]
    unless_null $P1403, vivify_282
    new $P1403, "Undef"
  vivify_282:
    store_lex "$bodypast", $P1403
.annotate 'line', 1150
    find_lex $P1404, "$node"
    unless_null $P1404, vivify_283
    $P1404 = root_new ['parrot';'ResizablePMCArray']
  vivify_283:
    set $P1405, $P1404[2]
    unless_null $P1405, vivify_284
    new $P1405, "Undef"
  vivify_284:
    store_lex "$nextpast", $P1405
.annotate 'line', 1152
    find_lex $P1406, "self"
    find_lex $P1407, "$exprpast"
    $P1408 = $P1406."as_post"($P1407, "r" :named("rtype"))
    store_lex "$exprpost", $P1408
.annotate 'line', 1154
    new $P1409, "ResizablePMCArray"
    store_lex "@arglist", $P1409
.annotate 'line', 1155
    find_lex $P1411, "$bodypast"
    $N1412 = $P1411."arity"()
    islt $I1413, $N1412, 1.0
    if $I1413, unless_1410_end
    find_lex $P1414, "@arglist"
    find_lex $P1415, "$exprpost"
    push $P1414, $P1415
  unless_1410_end:
.annotate 'line', 1156
    find_lex $P1416, "self"
    find_lex $P1417, "$bodypast"
    find_lex $P1418, "@arglist"
    $P1419 = $P1416."as_post"($P1417, "v" :named("rtype"), $P1418 :named("arglist"))
    store_lex "$bodypost", $P1419
.annotate 'line', 1158
    get_hll_global $P1420, "null__P"
    store_lex "$nextpost", $P1420
.annotate 'line', 1159
    find_lex $P1422, "$nextpast"
    unless $P1422, if_1421_end
    find_lex $P1423, "self"
    find_lex $P1424, "$nextpast"
    $P1425 = $P1423."as_post"($P1424, "v" :named("rtype"))
    store_lex "$nextpost", $P1425
  if_1421_end:
.annotate 'line', 1161
    find_lex $P1426, "%options"
    unless_null $P1426, vivify_285
    $P1426 = root_new ['parrot';'Hash']
  vivify_285:
    set $P1427, $P1426["testop"]
    unless_null $P1427, vivify_286
    new $P1427, "Undef"
  vivify_286:
    store_lex "$testop", $P1427
.annotate 'line', 1162
    find_lex $P1428, "%options"
    unless_null $P1428, vivify_287
    $P1428 = root_new ['parrot';'Hash']
  vivify_287:
    set $P1429, $P1428["bodyfirst"]
    unless_null $P1429, vivify_288
    new $P1429, "Undef"
  vivify_288:
    store_lex "$bodyfirst", $P1429
.annotate 'line', 1164
    find_lex $P1430, "self"
    find_lex $P1431, "$testop"
    find_lex $P1432, "$exprpost"
    find_lex $P1433, "$bodypost"
    find_lex $P1434, "$bodyfirst"
    find_lex $P1435, "$nextpost"
    $P1436 = $P1430."loop_gen"($P1431 :named("testop"), $P1432 :named("test"), $P1433 :named("body"), $P1434 :named("bodyfirst"), $P1435 :named("next"))
    store_lex "$ops", $P1436
.annotate 'line', 1166
    find_lex $P1437, "$ops"
    find_lex $P1438, "$exprpost"
    $P1437."result"($P1438)
.annotate 'line', 1167
    find_lex $P1439, "$ops"
    find_lex $P1440, "$node"
    $P1439."node"($P1440)
    find_lex $P1441, "$ops"
.annotate 'line', 1147
    .return ($P1441)
  control_1386:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1442, exception, "payload"
    .return ($P1442)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "until"  :subid("54_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["PAST";"Op"])
    .param pmc param_1446
    .param pmc param_1447 :slurpy :named
.annotate 'line', 1171
    new $P1445, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1445, control_1444
    push_eh $P1445
    .lex "self", self
    .lex "$node", param_1446
    .lex "%options", param_1447
.annotate 'line', 1172
    find_lex $P1448, "self"
    find_lex $P1449, "$node"
    find_lex $P1450, "%options"
    $P1451 = $P1448."while"($P1449, $P1450 :flat, "if" :named("testop"))
.annotate 'line', 1171
    .return ($P1451)
  control_1444:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1452, exception, "payload"
    .return ($P1452)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "repeat_while"  :subid("55_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["PAST";"Op"])
    .param pmc param_1456
    .param pmc param_1457 :slurpy :named
.annotate 'line', 1175
    new $P1455, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1455, control_1454
    push_eh $P1455
    .lex "self", self
    .lex "$node", param_1456
    .lex "%options", param_1457
.annotate 'line', 1176
    find_lex $P1458, "self"
    find_lex $P1459, "$node"
    find_lex $P1460, "%options"
    $P1461 = $P1458."while"($P1459, $P1460 :flat, 1 :named("bodyfirst"))
.annotate 'line', 1175
    .return ($P1461)
  control_1454:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1462, exception, "payload"
    .return ($P1462)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "repeat_until"  :subid("56_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["PAST";"Op"])
    .param pmc param_1466
    .param pmc param_1467 :slurpy :named
.annotate 'line', 1179
    new $P1465, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1465, control_1464
    push_eh $P1465
    .lex "self", self
    .lex "$node", param_1466
    .lex "%options", param_1467
.annotate 'line', 1180
    find_lex $P1468, "self"
    find_lex $P1469, "$node"
    find_lex $P1470, "%options"
    $P1471 = $P1468."while"($P1469, $P1470 :flat, "if" :named("testop"), 1 :named("bodyfirst"))
.annotate 'line', 1179
    .return ($P1471)
  control_1464:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1472, exception, "payload"
    .return ($P1472)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "for"  :subid("57_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["PAST";"Op"])
    .param pmc param_1476
    .param pmc param_1477 :slurpy :named
.annotate 'line', 1188
    .const 'Sub' $P1538 = "58_1308074680.10378" 
    capture_lex $P1538
    new $P1475, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1475, control_1474
    push_eh $P1475
    .lex "self", self
    .lex "$node", param_1476
    .lex "%options", param_1477
.annotate 'line', 1189
    new $P1478, "Undef"
    .lex "$ops", $P1478
.annotate 'line', 1190
    new $P1479, "Undef"
    .lex "$prepost", $P1479
.annotate 'line', 1191
    new $P1480, "Undef"
    .lex "$testpost", $P1480
.annotate 'line', 1193
    new $P1481, "Undef"
    .lex "$collpast", $P1481
.annotate 'line', 1194
    new $P1482, "Undef"
    .lex "$bodypast", $P1482
.annotate 'line', 1196
    new $P1483, "Undef"
    .lex "$collpost", $P1483
.annotate 'line', 1200
    new $P1484, "Undef"
    .lex "$undeflabel", $P1484
.annotate 'line', 1201
    new $P1485, "Undef"
    .lex "$S0", $P1485
.annotate 'line', 1209
    new $P1486, "Undef"
    .lex "$arity", $P1486
.annotate 'line', 1218
    $P1487 = root_new ['parrot';'ResizablePMCArray']
    .lex "@arglist", $P1487
.annotate 'line', 1228
    new $P1488, "Undef"
    .lex "$bodypost", $P1488
.annotate 'line', 1189
    get_hll_global $P1489, ["POST"], "Ops"
    find_lex $P1490, "$node"
    $P1491 = $P1489."new"($P1490 :named("node"))
    store_lex "$ops", $P1491
.annotate 'line', 1190
    get_hll_global $P1492, ["POST"], "Ops"
    $P1493 = $P1492."new"()
    store_lex "$prepost", $P1493
.annotate 'line', 1191
    get_hll_global $P1494, ["POST"], "Ops"
    find_lex $P1495, "self"
    $P1496 = $P1495."uniquereg"("P")
    $P1497 = $P1494."new"($P1496 :named("result"))
    store_lex "$testpost", $P1497
.annotate 'line', 1193
    find_lex $P1498, "$node"
    unless_null $P1498, vivify_289
    $P1498 = root_new ['parrot';'ResizablePMCArray']
  vivify_289:
    set $P1499, $P1498[0]
    unless_null $P1499, vivify_290
    new $P1499, "Undef"
  vivify_290:
    store_lex "$collpast", $P1499
.annotate 'line', 1194
    find_lex $P1500, "$node"
    unless_null $P1500, vivify_291
    $P1500 = root_new ['parrot';'ResizablePMCArray']
  vivify_291:
    set $P1501, $P1500[1]
    unless_null $P1501, vivify_292
    new $P1501, "Undef"
  vivify_292:
    store_lex "$bodypast", $P1501
.annotate 'line', 1196
    find_lex $P1502, "self"
    find_lex $P1503, "$collpast"
    $P1504 = $P1502."as_post"($P1503, "P" :named("rtype"))
    store_lex "$collpost", $P1504
.annotate 'line', 1197
    find_lex $P1505, "$ops"
    find_lex $P1506, "$collpost"
    $P1505."push"($P1506)
.annotate 'line', 1200
    get_hll_global $P1507, ["POST"], "Label"
    $P1508 = $P1507."new"("for_undef_" :named("name"))
    store_lex "$undeflabel", $P1508
.annotate 'line', 1201
    find_lex $P1509, "self"
    $P1510 = $P1509."uniquereg"("I")
    store_lex "$S0", $P1510
.annotate 'line', 1202
    find_lex $P1511, "$ops"
    find_lex $P1512, "$S0"
    find_lex $P1513, "$collpost"
    $P1511."push_pirop"("defined", $P1512, $P1513)
.annotate 'line', 1203
    find_lex $P1514, "$ops"
    find_lex $P1515, "$S0"
    find_lex $P1516, "$undeflabel"
    $P1514."push_pirop"("unless", $P1515, $P1516)
.annotate 'line', 1205
    find_lex $P1517, "$ops"
    find_lex $P1518, "$testpost"
    find_lex $P1519, "$collpost"
    $P1517."push_pirop"("iter", $P1518, $P1519)
.annotate 'line', 1209
    new $P1520, "Integer"
    assign $P1520, 1
    store_lex "$arity", $P1520
.annotate 'line', 1210
    find_lex $P1522, "$node"
    $P1523 = $P1522."arity"()
    defined $I1524, $P1523
    if $I1524, if_1521
.annotate 'line', 1213
    find_lex $P1528, "$bodypast"
    $P1529 = $P1528."arity"()
    defined $I1530, $P1529
    unless $I1530, if_1527_end
.annotate 'line', 1214
    find_lex $P1531, "$bodypast"
    $P1532 = $P1531."arity"()
    store_lex "$arity", $P1532
  if_1527_end:
.annotate 'line', 1213
    goto if_1521_end
  if_1521:
.annotate 'line', 1211
    find_lex $P1525, "$node"
    $P1526 = $P1525."arity"()
    store_lex "$arity", $P1526
  if_1521_end:
.annotate 'line', 1218
    new $P1533, "ResizablePMCArray"
    store_lex "@arglist", $P1533
.annotate 'line', 1219
    new $P1554, 'ExceptionHandler'
    set_label $P1554, loop1553_handler
    $P1554."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1554
    goto loop1553_redo
  loop1553_test:
    find_lex $P1534, "$arity"
    set $N1535, $P1534
    isgt $I1536, $N1535, 0.0
    unless $I1536, loop1553_done
  loop1553_redo:
    .const 'Sub' $P1538 = "58_1308074680.10378" 
    capture_lex $P1538
    $P1538()
  loop1553_next:
    goto loop1553_test
  loop1553_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1555, exception, 'type'
    eq $P1555, .CONTROL_LOOP_NEXT, loop1553_next
    eq $P1555, .CONTROL_LOOP_REDO, loop1553_redo
  loop1553_done:
    pop_eh 
.annotate 'line', 1228
    find_lex $P1556, "self"
    find_lex $P1557, "$bodypast"
    find_lex $P1558, "@arglist"
    $P1559 = $P1556."as_post"($P1557, "v" :named("rtype"), $P1558 :named("arglist"))
    store_lex "$bodypost", $P1559
.annotate 'line', 1231
    find_lex $P1560, "$ops"
    find_lex $P1561, "self"
    find_lex $P1562, "$testpost"
    find_lex $P1563, "$prepost"
    find_lex $P1564, "$bodypost"
    $P1565 = $P1561."loop_gen"($P1562 :named("test"), $P1563 :named("pre"), $P1564 :named("body"))
    $P1560."push"($P1565)
.annotate 'line', 1233
    find_lex $P1566, "$ops"
    find_lex $P1567, "$undeflabel"
    $P1566."push"($P1567)
.annotate 'line', 1234
    find_lex $P1568, "$ops"
    find_lex $P1569, "$testpost"
    $P1568."result"($P1569)
    find_lex $P1570, "$ops"
.annotate 'line', 1188
    .return ($P1570)
  control_1474:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1571, exception, "payload"
    .return ($P1571)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1537"  :anon :subid("58_1308074680.10378") :outer("57_1308074680.10378")
.annotate 'line', 1220
    new $P1539, "Undef"
    .lex "$nextarg", $P1539
    find_lex $P1540, "self"
    $P1541 = $P1540."uniquereg"("P")
    store_lex "$nextarg", $P1541
.annotate 'line', 1221
    find_lex $P1542, "$prepost"
    find_lex $P1543, "$nextarg"
    find_lex $P1544, "$testpost"
    $P1542."push_pirop"("shift", $P1543, $P1544)
.annotate 'line', 1222
    find_lex $P1546, "$arity"
    set $N1547, $P1546
    islt $I1548, $N1547, 1.0
    unless $I1548, if_1545_end
    die 0, .CONTROL_LOOP_LAST
  if_1545_end:
.annotate 'line', 1223
    find_lex $P1549, "@arglist"
    find_lex $P1550, "$nextarg"
    push $P1549, $P1550
    find_lex $P1551, "$arity"
    clone $P1552, $P1551
    dec $P1551
.annotate 'line', 1219
    .return ($P1552)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "list"  :subid("59_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["PAST";"Op"])
    .param pmc param_1575
    .param pmc param_1576 :slurpy :named
.annotate 'line', 1244
    .const 'Sub' $P1600 = "60_1308074680.10378" 
    capture_lex $P1600
    new $P1574, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1574, control_1573
    push_eh $P1574
    .lex "self", self
    .lex "$node", param_1575
    .lex "%options", param_1576
.annotate 'line', 1246
    new $P1577, "Undef"
    .lex "$ops", $P1577
.annotate 'line', 1247
    $P1578 = root_new ['parrot';'ResizablePMCArray']
    .lex "@posargs", $P1578
.annotate 'line', 1255
    new $P1579, "Undef"
    .lex "$returns", $P1579
.annotate 'line', 1258
    new $P1580, "Undef"
    .lex "$listpost", $P1580
.annotate 'line', 1244
    find_lex $P1581, "$ops"
    find_lex $P1582, "@posargs"
.annotate 'line', 1248

        $P0 = find_lex '$node'
        ($P0, $P1) = self.'post_children'($P0, 'signature'=>'v*')
        store_lex '$ops', $P0
        store_lex '@posargs', $P1
    
.annotate 'line', 1255
    find_lex $P1583, "$node"
    $P1584 = $P1583."returns"()
    store_lex "$returns", $P1584
.annotate 'line', 1256
    find_lex $P1586, "$returns"
    if $P1586, unless_1585_end
    new $P1587, "String"
    assign $P1587, "ResizablePMCArray"
    store_lex "$returns", $P1587
  unless_1585_end:
.annotate 'line', 1258
    find_lex $P1588, "self"
    find_lex $P1589, "$returns"
    $P1590 = $P1588."as_vivipost"($P1589, "P" :named("rtype"))
    store_lex "$listpost", $P1590
.annotate 'line', 1259
    find_lex $P1591, "$ops"
    find_lex $P1592, "$listpost"
    $P1591."result"($P1592)
.annotate 'line', 1260
    find_lex $P1593, "$ops"
    find_lex $P1594, "$listpost"
    $P1593."push"($P1594)
.annotate 'line', 1261
    find_lex $P1596, "@posargs"
    defined $I1597, $P1596
    unless $I1597, for_undef_293
    iter $P1595, $P1596
    new $P1607, 'ExceptionHandler'
    set_label $P1607, loop1606_handler
    $P1607."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1607
  loop1606_test:
    unless $P1595, loop1606_done
    shift $P1598, $P1595
  loop1606_redo:
    .const 'Sub' $P1600 = "60_1308074680.10378" 
    capture_lex $P1600
    $P1600($P1598)
  loop1606_next:
    goto loop1606_test
  loop1606_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1608, exception, 'type'
    eq $P1608, .CONTROL_LOOP_NEXT, loop1606_next
    eq $P1608, .CONTROL_LOOP_REDO, loop1606_redo
  loop1606_done:
    pop_eh 
  for_undef_293:
    find_lex $P1609, "$ops"
.annotate 'line', 1244
    .return ($P1609)
  control_1573:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1610, exception, "payload"
    .return ($P1610)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1599"  :anon :subid("60_1308074680.10378") :outer("59_1308074680.10378")
    .param pmc param_1601
.annotate 'line', 1261
    .lex "$_", param_1601
    find_lex $P1602, "$ops"
    find_lex $P1603, "$listpost"
    find_lex $P1604, "$_"
    $P1605 = $P1602."push_pirop"("push", $P1603, $P1604)
    .return ($P1605)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "stmts"  :subid("61_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["PAST";"Op"])
    .param pmc param_1614
    .param pmc param_1615 :slurpy :named
.annotate 'line', 1270
    new $P1613, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1613, control_1612
    push_eh $P1613
    .lex "self", self
    .lex "$node", param_1614
    .lex "%options", param_1615
.annotate 'line', 1271
    find_lex $P1616, "self"
    find_lex $P1617, "$node"
    find_lex $P1618, "%options"
    $P1619 = $P1616."node_as_post"($P1617, $P1618)
.annotate 'line', 1270
    .return ($P1619)
  control_1612:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1620, exception, "payload"
    .return ($P1620)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "null"  :subid("62_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["PAST";"Op"])
    .param pmc param_1624
    .param pmc param_1625 :slurpy :named
.annotate 'line', 1281
    new $P1623, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1623, control_1622
    push_eh $P1623
    .lex "self", self
    .lex "$node", param_1624
    .lex "%options", param_1625
.annotate 'line', 1282
    get_hll_global $P1626, ["POST"], "Ops"
    find_lex $P1627, "$node"
    $P1628 = $P1626."new"($P1627 :named("node"))
.annotate 'line', 1281
    .return ($P1628)
  control_1622:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1629, exception, "payload"
    .return ($P1629)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "return"  :subid("63_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["PAST";"Op"])
    .param pmc param_1633
    .param pmc param_1634 :slurpy :named
.annotate 'line', 1290
    .const 'Sub' $P1656 = "64_1308074680.10378" 
    capture_lex $P1656
    new $P1632, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1632, control_1631
    push_eh $P1632
    .lex "self", self
    .lex "$node", param_1633
    .lex "%options", param_1634
.annotate 'line', 1291
    new $P1635, "Undef"
    .lex "$ops", $P1635
.annotate 'line', 1293
    new $P1636, "Undef"
    .lex "$exreg", $P1636
.annotate 'line', 1294
    new $P1637, "Undef"
    .lex "$extype", $P1637
.annotate 'line', 1299
    new $P1638, "Undef"
    .lex "$cpast", $P1638
.annotate 'line', 1291
    get_hll_global $P1639, ["POST"], "Ops"
    find_lex $P1640, "$node"
    $P1641 = $P1639."new"($P1640 :named("node"))
    store_lex "$ops", $P1641
.annotate 'line', 1293
    find_lex $P1642, "self"
    $P1643 = $P1642."uniquereg"("P")
    store_lex "$exreg", $P1643
.annotate 'line', 1294
    find_lex $P1644, "$exreg"
    concat $P1645, $P1644, "['type']"
    store_lex "$extype", $P1645
.annotate 'line', 1295
    find_lex $P1646, "$ops"
    find_lex $P1647, "$exreg"
    $P1646."push_pirop"("new", $P1647, "\"Exception\"")
.annotate 'line', 1296
    find_lex $P1648, "$ops"
    find_lex $P1649, "$extype"
    $P1648."push_pirop"("set", $P1649, ".CONTROL_RETURN")
.annotate 'line', 1297
    find_dynamic_lex $P1650, "$*SUB"
    unless_null $P1650, vivify_294
    get_hll_global $P1650, "$SUB"
    unless_null $P1650, vivify_295
    die "Contextual $*SUB not found"
  vivify_295:
  vivify_294:
    $P1650."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 1299
    find_lex $P1651, "$node"
    unless_null $P1651, vivify_296
    $P1651 = root_new ['parrot';'ResizablePMCArray']
  vivify_296:
    set $P1652, $P1651[0]
    unless_null $P1652, vivify_297
    new $P1652, "Undef"
  vivify_297:
    store_lex "$cpast", $P1652
.annotate 'line', 1300
    find_lex $P1654, "$cpast"
    unless $P1654, if_1653_end
    .const 'Sub' $P1656 = "64_1308074680.10378" 
    capture_lex $P1656
    $P1656()
  if_1653_end:
.annotate 'line', 1306
    find_lex $P1670, "$ops"
    find_lex $P1671, "$exreg"
    $P1670."push_pirop"("throw", $P1671)
    find_lex $P1672, "$ops"
.annotate 'line', 1290
    .return ($P1672)
  control_1631:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1673, exception, "payload"
    .return ($P1673)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1655"  :anon :subid("64_1308074680.10378") :outer("63_1308074680.10378")
.annotate 'line', 1301
    new $P1657, "Undef"
    .lex "$cpost", $P1657
    find_lex $P1658, "self"
    find_lex $P1659, "$cpast"
    $P1660 = $P1658."as_post"($P1659, "P" :named("rtype"))
    store_lex "$cpost", $P1660
.annotate 'line', 1302
    find_lex $P1661, "self"
    find_lex $P1662, "$cpost"
    $P1663 = $P1661."coerce"($P1662, "P")
    store_lex "$cpost", $P1663
.annotate 'line', 1303
    find_lex $P1664, "$ops"
    find_lex $P1665, "$cpost"
    $P1664."push"($P1665)
.annotate 'line', 1304
    find_lex $P1666, "$ops"
    find_lex $P1667, "$exreg"
    find_lex $P1668, "$cpost"
    $P1669 = $P1666."push_pirop"("setattribute", $P1667, "'payload'", $P1668)
.annotate 'line', 1300
    .return ($P1669)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "try"  :subid("65_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["PAST";"Op"])
    .param pmc param_1677
    .param pmc param_1678 :slurpy :named
.annotate 'line', 1318
    new $P1676, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1676, control_1675
    push_eh $P1676
    .lex "self", self
    .lex "$node", param_1677
    .lex "%options", param_1678
.annotate 'line', 1319
    new $P1679, "Undef"
    .lex "$ops", $P1679
.annotate 'line', 1321
    new $P1680, "Undef"
    .lex "$S0", $P1680
.annotate 'line', 1322
    new $P1681, "Undef"
    .lex "$catchlabel", $P1681
.annotate 'line', 1323
    new $P1682, "Undef"
    .lex "$endlabel", $P1682
.annotate 'line', 1325
    new $P1683, "Undef"
    .lex "$rtype", $P1683
.annotate 'line', 1327
    new $P1684, "Undef"
    .lex "$trypost", $P1684
.annotate 'line', 1331
    new $P1685, "Undef"
    .lex "$elsepast", $P1685
.annotate 'line', 1337
    new $P1686, "Undef"
    .lex "$catchpast", $P1686
.annotate 'line', 1319
    get_hll_global $P1687, ["POST"], "Ops"
    find_lex $P1688, "$node"
    $P1689 = $P1687."new"($P1688 :named("node"))
    store_lex "$ops", $P1689
.annotate 'line', 1321
    find_lex $P1690, "self"
    $P1691 = $P1690."unique"("catch_")
    store_lex "$S0", $P1691
.annotate 'line', 1322
    get_hll_global $P1692, ["POST"], "Label"
    find_lex $P1693, "$S0"
    $P1694 = $P1692."new"($P1693 :named("result"))
    store_lex "$catchlabel", $P1694
.annotate 'line', 1323
    get_hll_global $P1695, ["POST"], "Lable"
    find_lex $P1696, "$S0"
    concat $P1697, $P1696, "_end"
    $P1698 = $P1695."new"($P1697 :named("result"))
    store_lex "$endlabel", $P1698
.annotate 'line', 1325
    find_lex $P1699, "%options"
    unless_null $P1699, vivify_298
    $P1699 = root_new ['parrot';'Hash']
  vivify_298:
    set $P1700, $P1699["rtype"]
    unless_null $P1700, vivify_299
    new $P1700, "Undef"
  vivify_299:
    store_lex "$rtype", $P1700
.annotate 'line', 1327
    find_lex $P1701, "self"
    find_lex $P1702, "$node"
    unless_null $P1702, vivify_300
    $P1702 = root_new ['parrot';'ResizablePMCArray']
  vivify_300:
    set $P1703, $P1702[0]
    unless_null $P1703, vivify_301
    new $P1703, "Undef"
  vivify_301:
    find_lex $P1704, "$rtype"
    $P1705 = $P1701."as_post"($P1703, $P1704 :named("rtype"))
    store_lex "$trypost", $P1705
.annotate 'line', 1328
    find_lex $P1706, "$ops"
    find_lex $P1707, "$catchlabel"
    $P1706."push_pirop"("push_eh", $P1707)
.annotate 'line', 1329
    find_lex $P1708, "$ops"
    find_lex $P1709, "$trypost"
    $P1708."push"($P1709)
.annotate 'line', 1330
    find_lex $P1710, "$ops"
    $P1710."push_pirop"("pop_eh")
.annotate 'line', 1331
    find_lex $P1711, "$node"
    unless_null $P1711, vivify_302
    $P1711 = root_new ['parrot';'ResizablePMCArray']
  vivify_302:
    set $P1712, $P1711[2]
    unless_null $P1712, vivify_303
    new $P1712, "Undef"
  vivify_303:
    store_lex "$elsepast", $P1712
.annotate 'line', 1332
    find_lex $P1714, "$elsepast"
    unless $P1714, if_1713_end
.annotate 'line', 1333
    find_lex $P1715, "$ops"
    find_lex $P1716, "self"
    find_lex $P1717, "$elsepast"
    $P1718 = $P1716."as_post"($P1717, "v" :named("rtype"))
    $P1715."push"($P1718)
  if_1713_end:
.annotate 'line', 1335
    find_lex $P1719, "$ops"
    find_lex $P1720, "$endlabel"
    $P1719."push_pirop"("goto", $P1720)
.annotate 'line', 1336
    find_lex $P1721, "$ops"
    find_lex $P1722, "$catchlabel"
    $P1721."push"($P1722)
.annotate 'line', 1337
    find_lex $P1723, "$node"
    unless_null $P1723, vivify_304
    $P1723 = root_new ['parrot';'ResizablePMCArray']
  vivify_304:
    set $P1724, $P1723[1]
    unless_null $P1724, vivify_305
    new $P1724, "Undef"
  vivify_305:
    store_lex "$catchpast", $P1724
.annotate 'line', 1338
    find_lex $P1726, "$catchpast"
    unless $P1726, if_1725_end
.annotate 'line', 1339
    find_lex $P1727, "$ops"
    find_lex $P1728, "self"
    find_lex $P1729, "$catchpast"
    $P1730 = $P1728."as_post"($P1729, "v" :named("rtype"))
    $P1727."push"($P1730)
.annotate 'line', 1340
    find_lex $P1731, "$ops"
    $P1731."push_pirop"("pop_eh")
  if_1725_end:
.annotate 'line', 1342
    find_lex $P1732, "$ops"
    find_lex $P1733, "$endlabel"
    $P1732."push"($P1733)
.annotate 'line', 1343
    find_lex $P1734, "$ops"
    find_lex $P1735, "$trypost"
    $P1734."result"($P1735)
    find_lex $P1736, "$ops"
.annotate 'line', 1318
    .return ($P1736)
  control_1675:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1737, exception, "payload"
    .return ($P1737)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "chain"  :subid("66_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["PAST";"Op"])
    .param pmc param_1741
    .param pmc param_1742 :slurpy :named
.annotate 'line', 1356
    .const 'Sub' $P1787 = "68_1308074680.10378" 
    capture_lex $P1787
    .const 'Sub' $P1754 = "67_1308074680.10378" 
    capture_lex $P1754
    new $P1740, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1740, control_1739
    push_eh $P1740
    .lex "self", self
    .lex "$node", param_1741
    .lex "%options", param_1742
.annotate 'line', 1358
    $P1743 = root_new ['parrot';'ResizablePMCArray']
    .lex "@clist", $P1743
.annotate 'line', 1359
    new $P1744, "Undef"
    .lex "$cpast", $P1744
.annotate 'line', 1367
    new $P1745, "Undef"
    .lex "$ops", $P1745
.annotate 'line', 1369
    new $P1746, "Undef"
    .lex "$endlabel", $P1746
.annotate 'line', 1372
    new $P1747, "Undef"
    .lex "$apost", $P1747
.annotate 'line', 1358
    new $P1748, "ResizablePMCArray"
    store_lex "@clist", $P1748
.annotate 'line', 1359
    find_lex $P1749, "$node"
    store_lex "$cpast", $P1749
.annotate 'line', 1360
    new $P1767, 'ExceptionHandler'
    set_label $P1767, loop1766_handler
    $P1767."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1767
  loop1766_test:
    find_lex $P1750, "$cpast"
    get_hll_global $P1751, ["PAST"], "Op"
    $P1752 = $P1750."isa"($P1751)
    unless $P1752, loop1766_done
  loop1766_redo:
    .const 'Sub' $P1754 = "67_1308074680.10378" 
    capture_lex $P1754
    $P1754()
  loop1766_next:
    goto loop1766_test
  loop1766_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1768, exception, 'type'
    eq $P1768, .CONTROL_LOOP_NEXT, loop1766_next
    eq $P1768, .CONTROL_LOOP_REDO, loop1766_redo
  loop1766_done:
    pop_eh 
.annotate 'line', 1367
    get_hll_global $P1769, ["POST"], "Ops"
    find_lex $P1770, "$node"
    $P1771 = $P1769."new"($P1770 :named("node"))
    store_lex "$ops", $P1771
.annotate 'line', 1368
    find_lex $P1772, "$ops"
    find_lex $P1773, "self"
    $P1774 = $P1773."unique"("$P")
    $P1772."result"($P1774)
.annotate 'line', 1369
    get_hll_global $P1775, ["POST"], "Label"
    $P1776 = $P1775("chain_end_" :named("name"))
    store_lex "$endlabel", $P1776
.annotate 'line', 1371
    find_lex $P1777, "@clist"
    pop $P1778, $P1777
    store_lex "$cpast", $P1778
.annotate 'line', 1372
    find_lex $P1779, "self"
    find_lex $P1780, "$cpast"
    unless_null $P1780, vivify_308
    $P1780 = root_new ['parrot';'ResizablePMCArray']
  vivify_308:
    set $P1781, $P1780[0]
    unless_null $P1781, vivify_309
    new $P1781, "Undef"
  vivify_309:
    $P1782 = $P1779."as_post"($P1781, "P" :named("rtype"))
    store_lex "$apost", $P1782
.annotate 'line', 1373
    find_lex $P1783, "$ops"
    find_lex $P1784, "$apost"
    $P1783."push"($P1784)
.annotate 'line', 1375
    new $P1814, 'ExceptionHandler'
    set_label $P1814, loop1813_handler
    $P1814."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1814
  loop1813_test:
    new $P1785, "Integer"
    assign $P1785, 1
    unless $P1785, loop1813_done
  loop1813_redo:
    .const 'Sub' $P1787 = "68_1308074680.10378" 
    capture_lex $P1787
    $P1787()
  loop1813_next:
    goto loop1813_test
  loop1813_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1815, exception, 'type'
    eq $P1815, .CONTROL_LOOP_NEXT, loop1813_next
    eq $P1815, .CONTROL_LOOP_REDO, loop1813_redo
  loop1813_done:
    pop_eh 
.annotate 'line', 1385
    find_lex $P1816, "$ops"
    find_lex $P1817, "$endlabel"
    $P1816."push"($P1817)
    find_lex $P1818, "$ops"
.annotate 'line', 1356
    .return ($P1818)
  control_1739:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1819, exception, "payload"
    .return ($P1819)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1753"  :anon :subid("67_1308074680.10378") :outer("66_1308074680.10378")
.annotate 'line', 1361
    new $P1755, "Undef"
    .lex "$pasttype", $P1755
    find_lex $P1756, "$cpast"
    $P1757 = $P1756."pasttype"()
    store_lex "$pasttype", $P1757
.annotate 'line', 1362
    find_lex $P1759, "$pasttype"
    set $S1760, $P1759
    isne $I1761, $S1760, "chain"
    unless $I1761, if_1758_end
    die 0, .CONTROL_LOOP_LAST
  if_1758_end:
.annotate 'line', 1363
    find_lex $P1762, "@clist"
    find_lex $P1763, "$cpast"
    push $P1762, $P1763
.annotate 'line', 1364
    find_lex $P1764, "$cpast"
    unless_null $P1764, vivify_306
    $P1764 = root_new ['parrot';'ResizablePMCArray']
  vivify_306:
    set $P1765, $P1764[0]
    unless_null $P1765, vivify_307
    new $P1765, "Undef"
  vivify_307:
    store_lex "$cpast", $P1765
.annotate 'line', 1360
    .return ($P1765)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1786"  :anon :subid("68_1308074680.10378") :outer("66_1308074680.10378")
.annotate 'line', 1376
    new $P1788, "Undef"
    .lex "$bpost", $P1788
.annotate 'line', 1378
    new $P1789, "Undef"
    .lex "$name", $P1789
.annotate 'line', 1376
    find_lex $P1790, "self"
    find_lex $P1791, "$cpast"
    unless_null $P1791, vivify_310
    $P1791 = root_new ['parrot';'ResizablePMCArray']
  vivify_310:
    set $P1792, $P1791[1]
    unless_null $P1792, vivify_311
    new $P1792, "Undef"
  vivify_311:
    $P1793 = $P1790."as_post"($P1792, "P" :named("rtype"))
    store_lex "$bpost", $P1793
.annotate 'line', 1377
    find_lex $P1794, "$ops"
    find_lex $P1795, "$bpost"
    $P1794."push"($P1795)
.annotate 'line', 1378
    find_lex $P1796, "self"
    find_lex $P1797, "$cpast"
    $P1798 = $P1797."name"()
    $P1799 = $P1796."escape"($P1798)
    store_lex "$name", $P1799
.annotate 'line', 1379
    find_lex $P1800, "$ops"
    find_lex $P1801, "$name"
    find_lex $P1802, "$apost"
    find_lex $P1803, "$bpost"
    find_lex $P1804, "$ops"
    $P1800."push_pirop"("call", $P1801, $P1802, $P1803, $P1804 :named("result"))
.annotate 'line', 1380
    find_lex $P1806, "@clist"
    if $P1806, unless_1805_end
    die 0, .CONTROL_LOOP_LAST
  unless_1805_end:
.annotate 'line', 1381
    find_lex $P1807, "$ops"
    find_lex $P1808, "$ops"
    find_lex $P1809, "$endlabel"
    $P1807."push_pirop"("unless", $P1808, $P1809)
.annotate 'line', 1382
    find_lex $P1810, "@clist"
    pop $P1811, $P1810
    store_lex "$cpast", $P1811
.annotate 'line', 1383
    find_lex $P1812, "$bpost"
    store_lex "$apost", $P1812
.annotate 'line', 1375
    .return ($P1812)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "def_or"  :subid("69_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["PAST";"Op"])
    .param pmc param_1823
    .param pmc param_1824 :slurpy :named
.annotate 'line', 1396
    new $P1822, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1822, control_1821
    push_eh $P1822
    .lex "self", self
    .lex "$node", param_1823
    .lex "%options", param_1824
.annotate 'line', 1397
    new $P1825, "Undef"
    .lex "$ops", $P1825
.annotate 'line', 1399
    new $P1826, "Undef"
    .lex "$lpost", $P1826
.annotate 'line', 1403
    new $P1827, "Undef"
    .lex "$endlabel", $P1827
.annotate 'line', 1405
    new $P1828, "Undef"
    .lex "$reg", $P1828
.annotate 'line', 1408
    new $P1829, "Undef"
    .lex "$rpost", $P1829
.annotate 'line', 1397
    get_hll_global $P1830, ["POST"], "Ops"
    find_lex $P1831, "$node"
    find_lex $P1832, "self"
    $P1833 = $P1832."unique"("$P")
    $P1834 = $P1830."new"($P1831 :named("node"), $P1833 :named("result"))
    store_lex "$ops", $P1834
.annotate 'line', 1399
    find_lex $P1835, "self"
    find_lex $P1836, "$node"
    unless_null $P1836, vivify_312
    $P1836 = root_new ['parrot';'ResizablePMCArray']
  vivify_312:
    set $P1837, $P1836[0]
    unless_null $P1837, vivify_313
    new $P1837, "Undef"
  vivify_313:
    $P1838 = $P1835."as_post"($P1837, "P" :named("rtype"))
    store_lex "$lpost", $P1838
.annotate 'line', 1400
    find_lex $P1839, "$ops"
    find_lex $P1840, "$lpost"
    $P1839."push"($P1840)
.annotate 'line', 1401
    find_lex $P1841, "$ops"
    find_lex $P1842, "$ops"
    find_lex $P1843, "$lpost"
    $P1841."push_pirop"("set", $P1842, $P1843)
.annotate 'line', 1403
    get_hll_global $P1844, ["POST"], "Label"
    find_lex $P1845, "self"
    $P1846 = $P1845."unique"("default_")
    $P1847 = $P1844."new"($P1846 :named("result"))
    store_lex "$endlabel", $P1847
.annotate 'line', 1405
    find_lex $P1848, "self"
    $P1849 = $P1848."unique"("$I")
    store_lex "$reg", $P1849
.annotate 'line', 1406
    find_lex $P1850, "$ops"
    find_lex $P1851, "$reg"
    find_lex $P1852, "$ops"
    $P1850."push_pirop"("defined", $P1851, $P1852)
.annotate 'line', 1407
    find_lex $P1853, "$ops"
    find_lex $P1854, "$reg"
    find_lex $P1855, "$endlabel"
    $P1853."push_pirop"("if", $P1854, $P1855)
.annotate 'line', 1408
    find_lex $P1856, "self"
    find_lex $P1857, "$node"
    unless_null $P1857, vivify_314
    $P1857 = root_new ['parrot';'ResizablePMCArray']
  vivify_314:
    set $P1858, $P1857[1]
    unless_null $P1858, vivify_315
    new $P1858, "Undef"
  vivify_315:
    $P1859 = $P1856."as_post"($P1858, "P" :named("rtype"))
    store_lex "$rpost", $P1859
.annotate 'line', 1409
    find_lex $P1860, "$ops"
    find_lex $P1861, "$rpost"
    $P1860."push"($P1861)
.annotate 'line', 1410
    find_lex $P1862, "$ops"
    find_lex $P1863, "$ops"
    find_lex $P1864, "$rpost"
    $P1862."push_pirop"("set", $P1863, $P1864)
.annotate 'line', 1411
    find_lex $P1865, "$ops"
    find_lex $P1866, "$endlabel"
    $P1865."push"($P1866)
    find_lex $P1867, "$ops"
.annotate 'line', 1396
    .return ($P1867)
  control_1821:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1868, exception, "payload"
    .return ($P1868)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "xor"  :subid("70_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["PAST";"Op"])
    .param pmc param_1872
    .param pmc param_1873 :slurpy :named
.annotate 'line', 1422
    .const 'Sub' $P1916 = "71_1308074680.10378" 
    capture_lex $P1916
    new $P1871, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1871, control_1870
    push_eh $P1871
    .lex "self", self
    .lex "$node", param_1872
    .lex "%options", param_1873
.annotate 'line', 1423
    new $P1874, "Undef"
    .lex "$ops", $P1874
.annotate 'line', 1426
    new $P1875, "Undef"
    .lex "$falselabel", $P1875
.annotate 'line', 1427
    new $P1876, "Undef"
    .lex "$endlabel", $P1876
.annotate 'line', 1429
    new $P1877, "Undef"
    .lex "$i", $P1877
.annotate 'line', 1430
    new $P1878, "Undef"
    .lex "$t", $P1878
.annotate 'line', 1431
    new $P1879, "Undef"
    .lex "$u", $P1879
.annotate 'line', 1432
    new $P1880, "Undef"
    .lex "$iter", $P1880
.annotate 'line', 1433
    new $P1881, "Undef"
    .lex "$apost", $P1881
.annotate 'line', 1434
    new $P1882, "Undef"
    .lex "$bpost", $P1882
.annotate 'line', 1423
    get_hll_global $P1883, ["POST"], "Ops"
    find_lex $P1884, "$node"
    $P1885 = $P1883."new"($P1884 :named("node"))
    store_lex "$ops", $P1885
.annotate 'line', 1424
    find_lex $P1886, "$ops"
    find_lex $P1887, "self"
    $P1888 = $P1887."unique"("$P")
    $P1886."result"($P1888)
.annotate 'line', 1426
    get_hll_global $P1889, ["POST"], "Label"
    $P1890 = $P1889."new"("xor_false" :named("name"))
    store_lex "$falselabel", $P1890
.annotate 'line', 1427
    get_hll_global $P1891, ["POST"], "Label"
    $P1892 = $P1891."new"("xor_end" :named("name"))
    store_lex "$endlabel", $P1892
.annotate 'line', 1429
    find_lex $P1893, "self"
    $P1894 = $P1893."unique"("$I")
    store_lex "$i", $P1894
.annotate 'line', 1430
    find_lex $P1895, "self"
    $P1896 = $P1895."unique"("$i")
    store_lex "$t", $P1896
.annotate 'line', 1431
    find_lex $P1897, "self"
    $P1898 = $P1897."unique"("$i")
    store_lex "$u", $P1898
.annotate 'line', 1432
    get_hll_global $P1899, "node"
    $P1900 = $P1899."iterator"()
    store_lex "$iter", $P1900
.annotate 'line', 1433
    find_lex $P1901, "self"
    find_lex $P1902, "$iter"
    shift $P1903, $P1902
    $P1904 = $P1901."as_post"($P1903, "P" :named("rtype"))
    store_lex "$apost", $P1904
    find_lex $P1905, "$bpost"
.annotate 'line', 1435
    find_lex $P1906, "$ops"
    find_lex $P1907, "$apost"
    $P1906."push"($P1907)
.annotate 'line', 1436
    find_lex $P1908, "$ops"
    find_lex $P1909, "$ops"
    find_lex $P1910, "$apost"
    $P1908."push_pirop"("set", $P1909, $P1910)
.annotate 'line', 1437
    find_lex $P1911, "$ops"
    find_lex $P1912, "$t"
    find_lex $P1913, "$apost"
    $P1911."push_pirop"("istrue", $P1912, $P1913)
.annotate 'line', 1438
    new $P1951, 'ExceptionHandler'
    set_label $P1951, loop1950_handler
    $P1951."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1951
  loop1950_test:
    new $P1914, "Integer"
    assign $P1914, 1
    unless $P1914, loop1950_done
  loop1950_redo:
    .const 'Sub' $P1916 = "71_1308074680.10378" 
    capture_lex $P1916
    $P1916()
  loop1950_next:
    goto loop1950_test
  loop1950_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1952, exception, 'type'
    eq $P1952, .CONTROL_LOOP_NEXT, loop1950_next
    eq $P1952, .CONTROL_LOOP_REDO, loop1950_redo
  loop1950_done:
    pop_eh 
.annotate 'line', 1451
    find_lex $P1953, "$ops"
    find_lex $P1954, "$t"
    find_lex $P1955, "$endlabel"
    $P1953."push_pirop"("if", $P1954, $P1955)
.annotate 'line', 1452
    find_lex $P1956, "$ops"
    find_lex $P1957, "$ops"
    find_lex $P1958, "$bpost"
    $P1956."push_pirop"("set", $P1957, $P1958)
.annotate 'line', 1453
    find_lex $P1959, "$ops"
    find_lex $P1960, "$endlabel"
    $P1959."push_pirop"("goto", $P1960)
.annotate 'line', 1454
    find_lex $P1961, "$ops"
    find_lex $P1962, "$falselabel"
    $P1961."push"($P1962)
.annotate 'line', 1455
    find_lex $P1963, "$ops"
    find_lex $P1964, "$ops"
    $P1963."push_pirop"("new", $P1964, "\"Undef\"")
.annotate 'line', 1456
    find_lex $P1965, "$ops"
    find_lex $P1966, "$endlabel"
    $P1965."push"($P1966)
    find_lex $P1967, "$ops"
.annotate 'line', 1422
    .return ($P1967)
  control_1870:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1968, exception, "payload"
    .return ($P1968)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1915"  :anon :subid("71_1308074680.10378") :outer("70_1308074680.10378")
.annotate 'line', 1445
    new $P1917, "Undef"
    .lex "$truelabel", $P1917
.annotate 'line', 1439
    find_lex $P1918, "self"
    find_lex $P1919, "$iter"
    shift $P1920, $P1919
    $P1921 = $P1918."as_post"($P1920, "P" :named("rtype"))
    store_lex "$bpost", $P1921
.annotate 'line', 1440
    find_lex $P1922, "$ops"
    find_lex $P1923, "$bpost"
    $P1922."push"($P1923)
.annotate 'line', 1441
    find_lex $P1924, "$ops"
    find_lex $P1925, "$u"
    find_lex $P1926, "$bpost"
    $P1924."push_pirop"("istrue", $P1925, $P1926)
.annotate 'line', 1442
    find_lex $P1927, "$ops"
    find_lex $P1928, "$i"
    find_lex $P1929, "$t"
    find_lex $P1930, "$u"
    $P1927."push_pirop"("and", $P1928, $P1929, $P1930)
.annotate 'line', 1443
    find_lex $P1931, "$ops"
    find_lex $P1932, "$i"
    find_lex $P1933, "$falselabel"
    $P1931."push_pirop"("if", $P1932, $P1933)
.annotate 'line', 1444
    find_lex $P1935, "$iter"
    if $P1935, unless_1934_end
    die 0, .CONTROL_LOOP_LAST
  unless_1934_end:
.annotate 'line', 1445
    get_hll_global $P1936, ["POST"], "Label"
    $P1937 = $P1936."new"("xor_true" :named("name"))
    store_lex "$truelabel", $P1937
.annotate 'line', 1446
    find_lex $P1938, "$ops"
    find_lex $P1939, "$t"
    find_lex $P1940, "$truelabel"
    $P1938."push_pirop"("if", $P1939, $P1940)
.annotate 'line', 1447
    find_lex $P1941, "$ops"
    find_lex $P1942, "$ops"
    find_lex $P1943, "$bpost"
    $P1941."push_pirop"("set", $P1942, $P1943)
.annotate 'line', 1448
    find_lex $P1944, "$ops"
    find_lex $P1945, "$t"
    find_lex $P1946, "$u"
    $P1944."push_pirop"("set", $P1945, $P1946)
.annotate 'line', 1449
    find_lex $P1947, "$ops"
    find_lex $P1948, "$truelabel"
    $P1949 = $P1947."push"($P1948)
.annotate 'line', 1438
    .return ($P1949)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "bind"  :subid("72_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["PAST";"Op"])
    .param pmc param_1972
    .param pmc param_1973 :slurpy :named
.annotate 'line', 1465
    new $P1971, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1971, control_1970
    push_eh $P1971
    .lex "self", self
    .lex "$node", param_1972
    .lex "%options", param_1973
.annotate 'line', 1466
    new $P1974, "Undef"
    .lex "$lpast", $P1974
.annotate 'line', 1467
    new $P1975, "Undef"
    .lex "$rpast", $P1975
.annotate 'line', 1469
    new $P1976, "Undef"
    .lex "$ops", $P1976
.annotate 'line', 1470
    new $P1977, "Undef"
    .lex "$rpost", $P1977
.annotate 'line', 1475
    new $P1978, "Undef"
    .lex "$lpost", $P1978
.annotate 'line', 1466
    find_lex $P1979, "$node"
    unless_null $P1979, vivify_316
    $P1979 = root_new ['parrot';'ResizablePMCArray']
  vivify_316:
    set $P1980, $P1979[0]
    unless_null $P1980, vivify_317
    new $P1980, "Undef"
  vivify_317:
    store_lex "$lpast", $P1980
.annotate 'line', 1467
    find_lex $P1981, "$node"
    unless_null $P1981, vivify_318
    $P1981 = root_new ['parrot';'ResizablePMCArray']
  vivify_318:
    set $P1982, $P1981[1]
    unless_null $P1982, vivify_319
    new $P1982, "Undef"
  vivify_319:
    store_lex "$rpast", $P1982
.annotate 'line', 1469
    get_hll_global $P1983, ["POST"], "Ops"
    find_lex $P1984, "$node"
    $P1985 = $P1983."new"($P1984 :named("node"))
    store_lex "$ops", $P1985
.annotate 'line', 1470
    find_lex $P1986, "self"
    find_lex $P1987, "$rpast"
    $P1988 = $P1986."as_post"($P1987, "P" :named("rtype"))
    store_lex "$rpost", $P1988
.annotate 'line', 1471
    find_lex $P1989, "self"
    find_lex $P1990, "$rpost"
    $P1991 = $P1989."coerce"($P1990, "P")
    store_lex "$rpost", $P1991
.annotate 'line', 1472
    find_lex $P1992, "$ops"
    find_lex $P1993, "$rpost"
    $P1992."push"($P1993)
.annotate 'line', 1474
    find_lex $P1994, "$lpast"
    $P1994."lvalue"(1)
.annotate 'line', 1475
    find_lex $P1995, "self"
    find_lex $P1996, "$lpast"
    find_lex $P1997, "$rpost"
    $P1998 = $P1995."as_post"($P1996, $P1997 :named("bindpost"))
    store_lex "$lpost", $P1998
.annotate 'line', 1476
    find_lex $P1999, "$ops"
    find_lex $P2000, "$lpost"
    $P1999."push"($P2000)
.annotate 'line', 1477
    find_lex $P2001, "$ops"
    find_lex $P2002, "$lpost"
    $P2001."result"($P2002)
    find_lex $P2003, "$ops"
.annotate 'line', 1465
    .return ($P2003)
  control_1970:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2004, exception, "payload"
    .return ($P2004)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "copy"  :subid("73_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["PAST";"Op"])
    .param pmc param_2008
    .param pmc param_2009 :slurpy :named
.annotate 'line', 1485
    new $P2007, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P2007, control_2006
    push_eh $P2007
    .lex "self", self
    .lex "$node", param_2008
    .lex "%options", param_2009
.annotate 'line', 1486
    new $P2010, "Undef"
    .lex "$rpost", $P2010
.annotate 'line', 1487
    new $P2011, "Undef"
    .lex "$lpost", $P2011
.annotate 'line', 1488
    new $P2012, "Undef"
    .lex "$ops", $P2012
.annotate 'line', 1486
    find_lex $P2013, "self"
    find_lex $P2014, "$node"
    unless_null $P2014, vivify_320
    $P2014 = root_new ['parrot';'ResizablePMCArray']
  vivify_320:
    set $P2015, $P2014[1]
    unless_null $P2015, vivify_321
    new $P2015, "Undef"
  vivify_321:
    $P2016 = $P2013."as_post"($P2015, "P" :named("rtype"))
    store_lex "$rpost", $P2016
.annotate 'line', 1487
    find_lex $P2017, "self"
    find_lex $P2018, "$node"
    unless_null $P2018, vivify_322
    $P2018 = root_new ['parrot';'ResizablePMCArray']
  vivify_322:
    set $P2019, $P2018[0]
    unless_null $P2019, vivify_323
    new $P2019, "Undef"
  vivify_323:
    $P2020 = $P2017."as_post"($P2019, "P" :named("rtype"))
    store_lex "$lpost", $P2020
.annotate 'line', 1488
    get_hll_global $P2021, ["POST"], "Ops"
    find_lex $P2022, "$rpost"
    find_lex $P2023, "$lpost"
    find_lex $P2024, "$node"
    find_lex $P2025, "$lpost"
    $P2026 = $P2021."new"($P2022, $P2023, $P2024 :named("node"), $P2025 :named("result"))
    store_lex "$ops", $P2026
.annotate 'line', 1490
    find_lex $P2027, "$ops"
    find_lex $P2028, "$lpost"
    find_lex $P2029, "$rpost"
    $P2027."push_pirop"("copy", $P2028, $P2029)
    find_lex $P2030, "$ops"
.annotate 'line', 1485
    .return ($P2030)
  control_2006:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2031, exception, "payload"
    .return ($P2031)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "inline"  :subid("74_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["PAST";"Op"])
    .param pmc param_2035
    .param pmc param_2036 :slurpy :named
.annotate 'line', 1499
    new $P2034, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P2034, control_2033
    push_eh $P2034
    .lex "self", self
    .lex "$node", param_2035
    .lex "%options", param_2036
.annotate 'line', 1504
    new $P2037, "Undef"
    .lex "$ops", $P2037
.annotate 'line', 1505
    new $P2038, "Undef"
    .lex "$inline", $P2038
.annotate 'line', 1508
    new $P2039, "Undef"
    .lex "$result", $P2039
.annotate 'line', 1509
    new $P2040, "Undef"
    .lex "$i", $P2040
.annotate 'line', 1522
    $P2041 = root_new ['parrot';'ResizablePMCArray']
    .lex "@arglist", $P2041
.annotate 'line', 1524
    new $P2042, "Undef"
    .lex "$s", $P2042
.annotate 'line', 1504
    find_lex $P2043, "self"
    find_lex $P2044, "$node"
    $P2045 = $P2043."post_children"($P2044, "vP" :named("signature"))
    store_lex "$ops", $P2045
.annotate 'line', 1505
    find_lex $P2046, "$node"
    $P2047 = $P2046."inline"()
    store_lex "$inline", $P2047
.annotate 'line', 1506
    find_lex $P2049, "$inline"
    does $I2050, $P2049, "array"
    unless $I2050, if_2048_end
    find_lex $P2051, "$inline"
    join $S2052, "\n", $P2051
    new $P2053, 'String'
    set $P2053, $S2052
    store_lex "$inline", $P2053
  if_2048_end:
.annotate 'line', 1508
    new $P2054, "String"
    assign $P2054, ""
    store_lex "$result", $P2054
.annotate 'line', 1509
    find_lex $P2055, "$inline"
    set $S2056, $P2055
    index $I2057, $S2056, "%t"
    new $P2058, 'Integer'
    set $P2058, $I2057
    store_lex "$i", $P2058
.annotate 'line', 1510
    find_lex $P2060, "$i"
    set $N2061, $P2060
    isge $I2062, $N2061, 0.0
    if $I2062, if_2059
.annotate 'line', 1516
    find_lex $P2069, "$inline"
    set $S2070, $P2069
    index $I2071, $S2070, "%r"
    new $P2072, 'Integer'
    set $P2072, $I2071
    store_lex "$i", $P2072
.annotate 'line', 1517
    find_lex $P2074, "$i"
    set $N2075, $P2074
    isge $I2076, $N2075, 0.0
    unless $I2076, if_2073_end
.annotate 'line', 1518
    find_lex $P2077, "self"
    $P2078 = $P2077."unique"("$P")
    store_lex "$result", $P2078
.annotate 'line', 1519
    find_lex $P2079, "$ops"
    find_lex $P2080, "$result"
    $P2079."result"($P2080)
  if_2073_end:
.annotate 'line', 1515
    goto if_2059_end
  if_2059:
.annotate 'line', 1511
    find_lex $P2063, "self"
    $P2064 = $P2063."unique"("$P")
    store_lex "$result", $P2064
.annotate 'line', 1512
    find_lex $P2065, "$ops"
    find_lex $P2066, "$result"
    $P2065."push_pirop"("new", $P2066, "'Undef'")
.annotate 'line', 1513
    find_lex $P2067, "$ops"
    find_lex $P2068, "$result"
    $P2067."result"($P2068)
  if_2059_end:
.annotate 'line', 1522
    find_lex $P2081, "$ops"
    $P2082 = $P2081."list"()
    store_lex "@arglist", $P2082
.annotate 'line', 1523
    find_lex $P2083, "$ops"
    find_lex $P2084, "@arglist"
    find_lex $P2085, "$inline"
    find_lex $P2086, "$result"
    $P2083."push_pirop"("inline", $P2084 :flat, $P2085 :named("inline"), $P2086 :named("result"))
.annotate 'line', 1524
    find_lex $P2087, "%options"
    unless_null $P2087, vivify_324
    $P2087 = root_new ['parrot';'Hash']
  vivify_324:
    set $P2088, $P2087["rtype"]
    unless_null $P2088, vivify_325
    new $P2088, "Undef"
  vivify_325:
    store_lex "$s", $P2088
    find_lex $P2089, "$ops"
.annotate 'line', 1499
    .return ($P2089)
  control_2033:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2090, exception, "payload"
    .return ($P2090)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("75_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["PAST";"Var"])
    .param pmc param_2094
    .param pmc param_2095 :slurpy :named
.annotate 'line', 1536
    .const 'Sub' $P2202 = "79_1308074680.10378" 
    capture_lex $P2202
    .const 'Sub' $P2177 = "78_1308074680.10378" 
    capture_lex $P2177
    .const 'Sub' $P2099 = "76_1308074680.10378" 
    capture_lex $P2099
    new $P2093, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P2093, control_2092
    push_eh $P2093
    .lex "self", self
    .lex "$node", param_2094
    .lex "%options", param_2095
.annotate 'line', 1538
    new $P2096, "Undef"
    .lex "$bindpost", $P2096
.annotate 'line', 1542
    new $P2097, "Undef"
    .lex "$scope", $P2097
.annotate 'line', 1543
    new $P2098, "Undef"
    .lex "$name", $P2098
.annotate 'line', 1562
    .const 'Sub' $P2099 = "76_1308074680.10378" 
    newclosure $P2164, $P2099
    .lex "scope_error", $P2164
.annotate 'line', 1538
    find_lex $P2165, "%options"
    unless_null $P2165, vivify_333
    $P2165 = root_new ['parrot';'Hash']
  vivify_333:
    set $P2166, $P2165["bindpost"]
    unless_null $P2166, vivify_334
    new $P2166, "Undef"
  vivify_334:
    store_lex "$bindpost", $P2166
.annotate 'line', 1539
    find_lex $P2168, "$bindpost"
    if $P2168, unless_2167_end
    new $P2169, "Undef"
    store_lex "$bindpost", $P2169
  unless_2167_end:
.annotate 'line', 1542
    find_lex $P2170, "$node"
    $P2171 = $P2170."scope"()
    store_lex "$scope", $P2171
.annotate 'line', 1543
    find_lex $P2172, "$node"
    $P2173 = $P2172."name"()
    store_lex "$name", $P2173
.annotate 'line', 1544
    find_lex $P2175, "$scope"
    if $P2175, unless_2174_end
    .const 'Sub' $P2177 = "78_1308074680.10378" 
    capture_lex $P2177
    $P2177()
  unless_2174_end:
.annotate 'line', 1557
    .const 'Sub' $P2202 = "79_1308074680.10378" 
    capture_lex $P2202
    $P2202()
    find_lex $P2223, "scope_error"
.annotate 'line', 1536
    .return ($P2223)
  control_2092:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2224, exception, "payload"
    .return ($P2224)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "scope_error"  :subid("76_1308074680.10378") :outer("75_1308074680.10378")
.annotate 'line', 1562
    .const 'Sub' $P2119 = "77_1308074680.10378" 
    capture_lex $P2119
    new $P2101, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P2101, control_2100
    push_eh $P2101
.annotate 'line', 1564
    new $P2102, "Undef"
    .lex "$blockname", $P2102
.annotate 'line', 1571
    new $P2103, "Undef"
    .lex "$sourceline", $P2103
.annotate 'line', 1572
    new $P2104, "Undef"
    .lex "$source", $P2104
.annotate 'line', 1573
    new $P2105, "Undef"
    .lex "$pos", $P2105
.annotate 'line', 1574
    new $P2106, "Undef"
    .lex "$files", $P2106
.annotate 'line', 1563
    find_lex $P2108, "$scope"
    unless $P2108, if_2107_end
    new $P2109, 'String'
    set $P2109, " in '"
    find_lex $P2110, "$scope"
    concat $P2111, $P2109, $P2110
    concat $P2112, $P2111, "' scope"
    store_lex "$scope", $P2112
  if_2107_end:
.annotate 'line', 1564
    new $P2113, "String"
    assign $P2113, ""
    store_lex "$blockname", $P2113
.annotate 'line', 1565
    find_dynamic_lex $P2115, "@*BLOCKPAST"
    unless_null $P2115, vivify_326
    get_hll_global $P2115, "@BLOCKPAST"
    unless_null $P2115, vivify_327
    die "Contextual @*BLOCKPAST not found"
  vivify_327:
  vivify_326:
    defined $I2116, $P2115
    unless $I2116, for_undef_328
    iter $P2114, $P2115
    new $P2127, 'ExceptionHandler'
    set_label $P2127, loop2126_handler
    $P2127."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P2127
  loop2126_test:
    unless $P2114, loop2126_done
    shift $P2117, $P2114
  loop2126_redo:
    .const 'Sub' $P2119 = "77_1308074680.10378" 
    capture_lex $P2119
    $P2119($P2117)
  loop2126_next:
    goto loop2126_test
  loop2126_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2128, exception, 'type'
    eq $P2128, .CONTROL_LOOP_NEXT, loop2126_next
    eq $P2128, .CONTROL_LOOP_REDO, loop2126_redo
  loop2126_done:
    pop_eh 
  for_undef_328:
.annotate 'line', 1569
    find_lex $P2130, "$blockname"
    if $P2130, unless_2129_end
    new $P2131, "String"
    assign $P2131, "<anonymous>"
    store_lex "$blockname", $P2131
  unless_2129_end:
.annotate 'line', 1571
    new $P2132, "String"
    assign $P2132, ""
    store_lex "$sourceline", $P2132
.annotate 'line', 1572
    find_lex $P2133, "$node"
    unless_null $P2133, vivify_329
    $P2133 = root_new ['parrot';'Hash']
  vivify_329:
    set $P2134, $P2133["source"]
    unless_null $P2134, vivify_330
    new $P2134, "Undef"
  vivify_330:
    store_lex "$source", $P2134
.annotate 'line', 1573
    find_lex $P2135, "$node"
    unless_null $P2135, vivify_331
    $P2135 = root_new ['parrot';'Hash']
  vivify_331:
    set $P2136, $P2135["pos"]
    unless_null $P2136, vivify_332
    new $P2136, "Undef"
  vivify_332:
    store_lex "$pos", $P2136
.annotate 'line', 1574
    find_caller_lex $P2137, "$?FILES"
    store_lex "$files", $P2137
.annotate 'line', 1575
    find_lex $P2141, "$source"
    if $P2141, if_2140
    set $P2139, $P2141
    goto if_2140_end
  if_2140:
    find_lex $P2142, "$files"
    set $P2139, $P2142
  if_2140_end:
    if $P2139, unless_2138_end
.annotate 'line', 1576
    new $P2143, "String"
    assign $P2143, " ("
    find_lex $P2144, "$files"
    concat $P2145, $P2143, $P2144
    concat $P2146, $P2145, ":"
.annotate 'line', 1577
    find_lex $P2147, "self"
    find_lex $P2148, "$source"
    find_lex $P2149, "$pos"
    $P2150 = $P2147."lineof"($P2148, $P2149)
    add $P2151, $P2150, 1
    concat $P2152, $P2146, $P2151
.annotate 'line', 1576
    concat $P2153, $P2152, ")"
.annotate 'line', 1577
    store_lex "$sourceline", $P2153
  unless_2138_end:
.annotate 'line', 1579
    find_lex $P2154, "self"
    new $P2155, 'String'
    set $P2155, "Symbol '"
    find_lex $P2156, "$name"
    concat $P2157, $P2155, $P2156
    concat $P2158, $P2157, "' not predeclared"
    find_lex $P2159, "$scope"
    find_lex $P2160, "$blockname"
    find_lex $P2161, "$sourceline"
    $P2162 = $P2154."panic"($P2158, $P2159, " in ", $P2160, $P2161)
.annotate 'line', 1562
    .return ($P2162)
  control_2100:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2163, exception, "payload"
    .return ($P2163)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block2118"  :anon :subid("77_1308074680.10378") :outer("76_1308074680.10378")
    .param pmc param_2120
.annotate 'line', 1565
    .lex "$_", param_2120
.annotate 'line', 1566
    find_lex $P2121, "$_"
    $P2122 = $P2121."name"()
    store_lex "$blockname", $P2122
.annotate 'line', 1567
    find_lex $P2125, "$blockname"
    if $P2125, if_2124
    set $P2123, $P2125
    goto if_2124_end
  if_2124:
    die 0, .CONTROL_LOOP_LAST
  if_2124_end:
.annotate 'line', 1565
    .return ($P2123)
.end


.namespace ["PAST";"Compiler"]
.sub "_block2176"  :anon :subid("78_1308074680.10378") :outer("75_1308074680.10378")
.annotate 'line', 1546
    new $P2178, "Undef"
    .lex "$P0", $P2178
    find_lex $P2179, "$name"
    find_lex $P2180, "self"
    getattribute $P2181, $P2180, "%!symtable"
    unless_null $P2181, vivify_335
    $P2181 = root_new ['parrot';'Hash']
  vivify_335:
    set $P2182, $P2181[$P2179]
    unless_null $P2182, vivify_336
    new $P2182, "Undef"
  vivify_336:
    store_lex "$P0", $P2182
.annotate 'line', 1547
    find_lex $P2184, "$P0"
    unless $P2184, if_2183_end
    find_lex $P2185, "$P0"
    unless_null $P2185, vivify_337
    $P2185 = root_new ['parrot';'Hash']
  vivify_337:
    set $P2186, $P2185["scope"]
    unless_null $P2186, vivify_338
    new $P2186, "Undef"
  vivify_338:
    store_lex "$scope", $P2186
  if_2183_end:
.annotate 'line', 1548
    find_lex $P2189, "$scope"
    unless $P2189, unless_2188
    set $P2187, $P2189
    goto unless_2188_end
  unless_2188:
.annotate 'line', 1550
    find_lex $P2190, "self"
    getattribute $P2191, $P2190, "%!symtable"
    unless_null $P2191, vivify_339
    $P2191 = root_new ['parrot';'Hash']
  vivify_339:
    set $P2192, $P2191[""]
    unless_null $P2192, vivify_340
    new $P2192, "Undef"
  vivify_340:
    store_lex "$P0", $P2192
.annotate 'line', 1551
    find_lex $P2194, "$P0"
    if $P2194, unless_2193_end
    "scope_error"()
  unless_2193_end:
.annotate 'line', 1552
    find_lex $P2195, "$P0"
    unless_null $P2195, vivify_341
    $P2195 = root_new ['parrot';'Hash']
  vivify_341:
    set $P2196, $P2195["scope"]
    unless_null $P2196, vivify_342
    new $P2196, "Undef"
  vivify_342:
    store_lex "$scope", $P2196
.annotate 'line', 1553
    find_lex $P2199, "$scope"
    unless $P2199, unless_2198
    set $P2197, $P2199
    goto unless_2198_end
  unless_2198:
    $P2200 = "scope_error"()
    set $P2197, $P2200
  unless_2198_end:
.annotate 'line', 1548
    set $P2187, $P2197
  unless_2188_end:
.annotate 'line', 1544
    .return ($P2187)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block2201"  :anon :subid("79_1308074680.10378") :outer("75_1308074680.10378")
.annotate 'line', 1557
    .const 'Sub' $P2216 = "80_1308074680.10378" 
    capture_lex $P2216
    new $P2212, 'ExceptionHandler'
    set_label $P2212, control_2211
    $P2212."handle_types_except"(.CONTROL_RETURN,  .CONTROL_OK,  .CONTROL_BREAK,  .CONTROL_CONTINUE,  .CONTROL_TAKE,  .CONTROL_LEAVE,  .CONTROL_EXIT,  .CONTROL_LOOP_NEXT,  .CONTROL_LOOP_LAST,  .CONTROL_LOOP_REDO)
    push_eh $P2212
.annotate 'line', 1558
    new $P2203, "Exception"
    set $P2203['type'], .CONTROL_RETURN
    find_lex $P2204, "self"
    find_lex $P2205, "$node"
    find_lex $P2206, "$bindpost"
    find_lex $P2207, "$scope"
    set $S2208, $P2207
    $P2209 = $P2204.$S2208($P2205, $P2206)
    setattribute $P2203, 'payload', $P2209
    throw $P2203
.annotate 'line', 1557
    pop_eh 
    goto skip_handler_2210
  control_2211:
.annotate 'line', 1559
    .local pmc exception 
    .get_results (exception) 
    .const 'Sub' $P2216 = "80_1308074680.10378" 
    newclosure $P2220, $P2216
    $P2220(exception)
    new $P2221, 'Integer'
    set $P2221, 1
    set exception["handled"], $P2221
    set $I2222, exception["handled"]
    ne $I2222, 1, nothandled_2214
  handled_2213:
    .return (exception)
  nothandled_2214:
    rethrow exception
  skip_handler_2210:
.annotate 'line', 1557
    .return ()
.end


.namespace ["PAST";"Compiler"]
.sub "_block2215"  :anon :subid("80_1308074680.10378") :outer("79_1308074680.10378")
    .param pmc param_2217
.annotate 'line', 1559
    .lex "$_", param_2217
    find_lex $P2218, "$_"
    .lex "$!", $P2218
    $P2219 = "scope_error"()
    .return ($P2219)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "vivify"  :subid("81_1308074680.10378") :method :outer("11_1308074680.10378")
    .param pmc param_2228
    .param pmc param_2229
    .param pmc param_2230
    .param pmc param_2231
.annotate 'line', 1585
    .const 'Sub' $P2255 = "82_1308074680.10378" 
    capture_lex $P2255
    new $P2227, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P2227, control_2226
    push_eh $P2227
    .lex "self", self
    .lex "$node", param_2228
    .lex "$ops", param_2229
    .lex "$fetchop", param_2230
    .lex "$storeop", param_2231
.annotate 'line', 1586
    new $P2232, "Undef"
    .lex "$viviself", $P2232
.annotate 'line', 1587
    new $P2233, "Undef"
    .lex "$vivipost", $P2233
.annotate 'line', 1588
    new $P2234, "Undef"
    .lex "$result", $P2234
.annotate 'line', 1586
    find_lex $P2235, "$node"
    $P2236 = $P2235."viviself"()
    store_lex "$viviself", $P2236
.annotate 'line', 1587
    find_lex $P2237, "self"
    find_lex $P2238, "$viviself"
    $P2239 = $P2237."as_vivipost"($P2238, "P" :named("rtype"))
    store_lex "$vivipost", $P2239
.annotate 'line', 1588
    find_lex $P2240, "$vivipost"
    $P2241 = $P2240."result"()
    store_lex "$result", $P2241
.annotate 'line', 1589
    find_lex $P2243, "$result"
    set $S2244, $P2243
    iseq $I2245, $S2244, ""
    unless $I2245, if_2242_end
    find_lex $P2246, "self"
    $P2247 = $P2246."uniquereg"("P")
    store_lex "$result", $P2247
  if_2242_end:
.annotate 'line', 1591
    find_lex $P2248, "$ops"
    find_lex $P2249, "$result"
    $P2248."result"($P2249)
.annotate 'line', 1592
    find_lex $P2250, "$ops"
    find_lex $P2251, "$fetchop"
    $P2250."push"($P2251)
.annotate 'line', 1593
    find_lex $P2253, "$viviself"
    unless $P2253, if_2252_end
    .const 'Sub' $P2255 = "82_1308074680.10378" 
    capture_lex $P2255
    $P2255()
  if_2252_end:
    find_lex $P2272, "$ops"
.annotate 'line', 1585
    .return ($P2272)
  control_2226:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2273, exception, "payload"
    .return ($P2273)
.end


.namespace ["PAST";"Compiler"]
.sub "_block2254"  :anon :subid("82_1308074680.10378") :outer("81_1308074680.10378")
.annotate 'line', 1594
    new $P2256, "Undef"
    .lex "$vivilabel", $P2256
    get_hll_global $P2257, ["POST"], "Label"
    $P2258 = $P2257."new"("vivify_" :named("name"))
    store_lex "$vivilabel", $P2258
.annotate 'line', 1595
    find_lex $P2259, "$ops"
    find_lex $P2260, "$ops"
    find_lex $P2261, "$vivilabel"
    $P2259."push_pirop"("unless_null", $P2260, $P2261)
.annotate 'line', 1596
    find_lex $P2262, "$ops"
    find_lex $P2263, "$vivipost"
    $P2262."push"($P2263)
.annotate 'line', 1597
    find_lex $P2265, "$node"
    $P2266 = $P2265."lvalue"()
    unless $P2266, if_2264_end
    find_lex $P2267, "$ops"
    find_lex $P2268, "$storeop"
    $P2267."push"($P2268)
  if_2264_end:
.annotate 'line', 1598
    find_lex $P2269, "$ops"
    find_lex $P2270, "$vivilabel"
    $P2271 = $P2269."push"($P2270)
.annotate 'line', 1593
    .return ($P2271)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "parameter"  :subid("83_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["PAST";"Var"],_)
    .param pmc param_2277
    .param pmc param_2278
.annotate 'line', 1604
    new $P2276, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P2276, control_2275
    push_eh $P2276
    .lex "self", self
    .lex "$node", param_2277
    .lex "$bindpost", param_2278
.annotate 'line', 1605

        .local pmc node
        node = find_lex '$node'
        .local pmc bindpost
        bindpost = find_lex '$bindpost'

        ##  get the current sub
        .local pmc subpost
        subpost = find_dynamic_lex '$*SUB'

        ##  determine lexical, register, and parameter names
        .local string named, pname, has_pname
        .local pmc name
        name = node.'name'()
        named = node.'named'()
        pname = self.'unique'('param_')
        has_pname = concat 'has_', pname

        ##  returned post node
        .local pmc ops
        $P0 = get_hll_global ['POST'], 'Ops'
        ops = $P0.'new'('node'=>node, 'result'=>pname)

        ##  handle optional params
        .local pmc viviself, vivipost, vivilabel
        viviself = node.'viviself'()
        unless viviself goto param_required
        vivipost = self.'as_vivipost'(viviself, 'rtype'=>'P')
        $P0 = get_hll_global ['POST'], 'Label'
        vivilabel = $P0.'new'('name'=>'optparam_')
        subpost.'add_param'(pname, 'named'=>named, 'optional'=>1)
        ops.'push_pirop'('if', has_pname, vivilabel)
        ops.'push'(vivipost)
        ops.'push_pirop'('set', ops, vivipost)
        ops.'push'(vivilabel)
        goto param_done

      param_required:
        .local int call_sig, slurpy
        call_sig = node.'call_sig'()
        slurpy = node.'slurpy'()
        subpost.'add_param'(pname, 'named'=>named, 'slurpy'=>slurpy, 'call_sig'=>call_sig)

      param_done:
        $I0 = defined name
        unless $I0 goto param_lex_done
        name = self.'escape'(name)
        ops.'push_pirop'('.lex', name, ops)
      param_lex_done:
        .return (ops)
    
.annotate 'line', 1604
    .return ()
  control_2275:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2279, exception, "payload"
    .return ($P2279)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "package"  :subid("84_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["PAST";"Var"],_)
    .param pmc param_2283
    .param pmc param_2284
.annotate 'line', 1659
    new $P2282, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P2282, control_2281
    push_eh $P2282
    .lex "self", self
    .lex "$node", param_2283
    .lex "$bindpost", param_2284
.annotate 'line', 1660

        .local pmc node
        node = find_lex '$node'
        .local pmc bindpost
        bindpost = find_lex '$bindpost'

        .local pmc ops, fetchop, storeop
        $P0 = get_hll_global ['POST'], 'Ops'
        ops = $P0.'new'('node'=>node)

        .local string name
        name = node.'name'()
        name = self.'escape'(name)

        $P0 = get_hll_global ['POST'], 'Op'
        .local pmc ns
        ns = node.'namespace'()
        $I0 = defined ns
        if $I0 goto package_hll
        if bindpost goto package_bind
        fetchop = $P0.'new'(ops, name, 'pirop'=>'get_global')
        storeop = $P0.'new'(name, ops, 'pirop'=>'set_global')
        .tailcall self.'vivify'(node, ops, fetchop, storeop)
      package_bind:
        .tailcall $P0.'new'(name, bindpost, 'pirop'=>'set_global', 'result'=>bindpost)

      package_hll:
        if ns goto package_ns
        if bindpost goto package_hll_bind
        fetchop = $P0.'new'(ops, name, 'pirop'=>'get_hll_global')
        storeop = $P0.'new'(name, ops, 'pirop'=>'set_hll_global')
        .tailcall self.'vivify'(node, ops, fetchop, storeop)
      package_hll_bind:
        .tailcall $P0.'new'(name, bindpost, 'pirop'=>'set_hll_global', 'result'=>bindpost)

      package_ns:
        $P1 = get_hll_global ['POST'], 'Compiler'
        ns = $P1.'key_pir'(ns)
        if bindpost goto package_ns_bind
        fetchop = $P0.'new'(ops, ns, name, 'pirop'=>'get_hll_global')
        storeop = $P0.'new'(ns, name, ops, 'pirop'=>'set_hll_global')
        .tailcall self.'vivify'(node, ops, fetchop, storeop)
      package_ns_bind:
        .tailcall $P0.'new'(ns, name, bindpost, 'pirop'=>'set_hll_global', 'result'=>bindpost)
    
.annotate 'line', 1659
    .return ()
  control_2281:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2285, exception, "payload"
    .return ($P2285)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "lexical"  :subid("85_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["PAST";"Var"],_)
    .param pmc param_2289
    .param pmc param_2290
.annotate 'line', 1708
    .const 'Sub' $P2343 = "88_1308074680.10378" 
    capture_lex $P2343
    .const 'Sub' $P2324 = "87_1308074680.10378" 
    capture_lex $P2324
    .const 'Sub' $P2303 = "86_1308074680.10378" 
    capture_lex $P2303
    new $P2288, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P2288, control_2287
    push_eh $P2288
    .lex "self", self
    .lex "$node", param_2289
    .lex "$bindpost", param_2290
.annotate 'line', 1709
    new $P2291, "Undef"
    .lex "$name", $P2291
.annotate 'line', 1710
    new $P2292, "Undef"
    .lex "$isdecl", $P2292
.annotate 'line', 1718
    new $P2293, "Undef"
    .lex "$ops", $P2293
.annotate 'line', 1709
    find_lex $P2294, "self"
    find_lex $P2295, "$node"
    $P2296 = $P2295."name"()
    $P2297 = $P2294."escape"($P2296)
    store_lex "$name", $P2297
.annotate 'line', 1710
    find_lex $P2298, "$node"
    $P2299 = $P2298."isdecl"()
    store_lex "$isdecl", $P2299
.annotate 'line', 1712
    find_lex $P2301, "$bindpost"
    unless $P2301, if_2300_end
    .const 'Sub' $P2303 = "86_1308074680.10378" 
    capture_lex $P2303
    $P2303()
  if_2300_end:
.annotate 'line', 1718
    get_hll_global $P2317, ["POST"], "Ops"
    find_lex $P2318, "$node"
    $P2319 = $P2317."new"($P2318 :named("node"))
    store_lex "$ops", $P2319
.annotate 'line', 1720
    find_lex $P2322, "$isdecl"
    if $P2322, if_2321
.annotate 'line', 1728
    .const 'Sub' $P2343 = "88_1308074680.10378" 
    capture_lex $P2343
    $P2361 = $P2343()
    set $P2320, $P2361
.annotate 'line', 1720
    goto if_2321_end
  if_2321:
    .const 'Sub' $P2324 = "87_1308074680.10378" 
    capture_lex $P2324
    $P2341 = $P2324()
    set $P2320, $P2341
  if_2321_end:
.annotate 'line', 1708
    .return ($P2320)
  control_2287:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2362, exception, "payload"
    .return ($P2362)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block2302"  :anon :subid("86_1308074680.10378") :outer("85_1308074680.10378")
.annotate 'line', 1713
    new $P2304, "Undef"
    .lex "$pirop", $P2304
    find_lex $P2307, "$isdecl"
    if $P2307, if_2306
    new $P2309, "String"
    assign $P2309, "store_lex"
    set $P2305, $P2309
    goto if_2306_end
  if_2306:
    new $P2308, "String"
    assign $P2308, ".lex"
    set $P2305, $P2308
  if_2306_end:
    store_lex "$pirop", $P2305
.annotate 'line', 1714
    new $P2310, "Exception"
    set $P2310['type'], .CONTROL_RETURN
    get_hll_global $P2311, ["POST"], "Op"
    find_lex $P2312, "$name"
    find_lex $P2313, "$bindpost"
    find_lex $P2314, "$pirop"
    find_lex $P2315, "$bindpost"
    $P2316 = $P2311."new"($P2312, $P2313, $P2314 :named("pirop"), $P2315 :named("result"))
    setattribute $P2310, 'payload', $P2316
    throw $P2310
.annotate 'line', 1712
    .return ()
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block2342"  :anon :subid("88_1308074680.10378") :outer("85_1308074680.10378")
.annotate 'line', 1729
    new $P2344, "Undef"
    .lex "$fetchop", $P2344
.annotate 'line', 1730
    new $P2345, "Undef"
    .lex "$storeop", $P2345
.annotate 'line', 1729
    get_hll_global $P2346, ["POST"], "Op"
    find_lex $P2347, "$ops"
    find_lex $P2348, "$name"
    $P2349 = $P2346."new"($P2347, $P2348, "find_lex" :named("pirop"))
    store_lex "$fetchop", $P2349
.annotate 'line', 1730
    get_hll_global $P2350, ["POST"], "Op"
    find_lex $P2351, "$name"
    find_lex $P2352, "$ops"
    $P2353 = $P2350."new"($P2351, $P2352, "store_lex" :named("pirop"))
    store_lex "$storeop", $P2353
.annotate 'line', 1731
    new $P2354, "Exception"
    set $P2354['type'], .CONTROL_RETURN
    find_lex $P2355, "self"
    find_lex $P2356, "$node"
    find_lex $P2357, "$ops"
    find_lex $P2358, "$fetchop"
    find_lex $P2359, "$storeop"
    $P2360 = $P2355."vivify"($P2356, $P2357, $P2358, $P2359)
    setattribute $P2354, 'payload', $P2360
    throw $P2354
.annotate 'line', 1728
    .return ()
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block2323"  :anon :subid("87_1308074680.10378") :outer("85_1308074680.10378")
.annotate 'line', 1721
    new $P2325, "Undef"
    .lex "$viviself", $P2325
.annotate 'line', 1722
    new $P2326, "Undef"
    .lex "$vivipost", $P2326
.annotate 'line', 1721
    find_lex $P2327, "$node"
    $P2328 = $P2327."viviself"()
    store_lex "$viviself", $P2328
.annotate 'line', 1722
    find_lex $P2329, "self"
    find_lex $P2330, "$viviself"
    $P2331 = $P2329."as_vivipost"($P2330, "P" :named("rtype"))
    store_lex "$vivipost", $P2331
.annotate 'line', 1723
    find_lex $P2332, "$ops"
    find_lex $P2333, "$vivipost"
    $P2332."push"($P2333)
.annotate 'line', 1724
    find_lex $P2334, "$ops"
    find_lex $P2335, "$name"
    find_lex $P2336, "$vivipost"
    $P2334."push_pirop"(".lex", $P2335, $P2336)
.annotate 'line', 1725
    find_lex $P2337, "$ops"
    find_lex $P2338, "$vivipost"
    $P2337."result"($P2338)
.annotate 'line', 1726
    new $P2339, "Exception"
    set $P2339['type'], .CONTROL_RETURN
    find_lex $P2340, "$ops"
    setattribute $P2339, 'payload', $P2340
    throw $P2339
.annotate 'line', 1720
    .return ()
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "contextual"  :subid("89_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["PAST";"Var"],_)
    .param pmc param_2366
    .param pmc param_2367
.annotate 'line', 1736
    .const 'Sub' $P2388 = "90_1308074680.10378" 
    capture_lex $P2388
    new $P2365, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P2365, control_2364
    push_eh $P2365
    .lex "self", self
    .lex "$node", param_2366
    .lex "$bindpost", param_2367
.annotate 'line', 1741
    new $P2368, "Undef"
    .lex "$name", $P2368
.annotate 'line', 1743
    $P2369 = root_new ['parrot';'Hash']
    .lex "%symtable", $P2369
.annotate 'line', 1765
    new $P2370, "Undef"
    .lex "$ops", $P2370
.annotate 'line', 1766
    new $P2371, "Undef"
    .lex "$fetchop", $P2371
.annotate 'line', 1767
    new $P2372, "Undef"
    .lex "$storeop", $P2372
.annotate 'line', 1741
    find_lex $P2373, "$node"
    $P2374 = $P2373."name"()
    store_lex "$name", $P2374
.annotate 'line', 1743
    find_dynamic_lex $P2375, "@*BLOCKPAST"
    unless_null $P2375, vivify_343
    get_hll_global $P2375, "@BLOCKPAST"
    unless_null $P2375, vivify_344
    die "Contextual @*BLOCKPAST not found"
  vivify_344:
  vivify_343:
    set $P2376, $P2375[0]
    unless_null $P2376, vivify_345
    new $P2376, "Undef"
  vivify_345:
    $P2377 = $P2376."symtable"()
    store_lex "%symtable", $P2377
.annotate 'line', 1744
    find_lex $P2379, "%symtable"
    defined $I2380, $P2379
    unless $I2380, if_2378_end
.annotate 'line', 1745
    find_lex $P2381, "$name"
    find_lex $P2382, "%symtable"
    unless_null $P2382, vivify_346
    $P2382 = root_new ['parrot';'Hash']
  vivify_346:
    set $P2383, $P2382[$P2381]
    unless_null $P2383, vivify_347
    new $P2383, "Undef"
  vivify_347:
    store_lex "%symtable", $P2383
.annotate 'line', 1746
    find_lex $P2385, "%symtable"
    defined $I2386, $P2385
    unless $I2386, if_2384_end
    .const 'Sub' $P2388 = "90_1308074680.10378" 
    capture_lex $P2388
    $P2388()
  if_2384_end:
  if_2378_end:
.annotate 'line', 1755
    find_lex $P2408, "$node"
    $P2409 = $P2408."isdecl"()
    unless $P2409, if_2407_end
    new $P2410, "Exception"
    set $P2410['type'], .CONTROL_RETURN
    find_lex $P2411, "self"
    find_lex $P2412, "$node"
    find_lex $P2413, "$bindpost"
    $P2414 = $P2411."lexical"($P2412, $P2413)
    setattribute $P2410, 'payload', $P2414
    throw $P2410
  if_2407_end:
.annotate 'line', 1757
    find_lex $P2415, "self"
    find_lex $P2416, "$name"
    $P2417 = $P2415."escape"($P2416)
    store_lex "$name", $P2417
.annotate 'line', 1759
    find_lex $P2419, "$bindpost"
    unless $P2419, if_2418_end
.annotate 'line', 1760
    new $P2420, "Exception"
    set $P2420['type'], .CONTROL_RETURN
    get_hll_global $P2421, ["POST"], "Op"
    find_lex $P2422, "$name"
    find_lex $P2423, "$bindpost"
    find_lex $P2424, "$bindpost"
    $P2425 = $P2421."new"($P2422, $P2423, "store_dynamic_lex" :named("pirop"), $P2424 :named("result"))
    setattribute $P2420, 'payload', $P2425
    throw $P2420
  if_2418_end:
.annotate 'line', 1765
    get_hll_global $P2426, ["POST"], "Ops"
    find_lex $P2427, "$node"
    $P2428 = $P2426."new"($P2427 :named("node"))
    store_lex "$ops", $P2428
.annotate 'line', 1766
    get_hll_global $P2429, ["POST"], "Op"
    find_lex $P2430, "$ops"
    find_lex $P2431, "$name"
    $P2432 = $P2429."new"($P2430, $P2431, "find_dynamic_lex" :named("pirop"))
    store_lex "$fetchop", $P2432
.annotate 'line', 1767
    get_hll_global $P2433, ["POST"], "Op"
    find_lex $P2434, "$name"
    find_lex $P2435, "$ops"
    $P2436 = $P2433."new"($P2434, $P2435, "store_dynamic_lex" :named("pirop"))
    store_lex "$storeop", $P2436
.annotate 'line', 1768
    find_lex $P2437, "self"
    find_lex $P2438, "$node"
    find_lex $P2439, "$ops"
    find_lex $P2440, "$fetchop"
    find_lex $P2441, "$storeop"
    $P2442 = $P2437."vivify"($P2438, $P2439, $P2440, $P2441)
.annotate 'line', 1736
    .return ($P2442)
  control_2364:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2443, exception, "payload"
    .return ($P2443)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block2387"  :anon :subid("90_1308074680.10378") :outer("89_1308074680.10378")
.annotate 'line', 1747
    new $P2389, "Undef"
    .lex "$scope", $P2389
    find_lex $P2390, "%symtable"
    unless_null $P2390, vivify_348
    $P2390 = root_new ['parrot';'Hash']
  vivify_348:
    set $P2391, $P2390["scope"]
    unless_null $P2391, vivify_349
    new $P2391, "Undef"
  vivify_349:
    store_lex "$scope", $P2391
.annotate 'line', 1748
    find_lex $P2396, "$scope"
    if $P2396, if_2395
    set $P2394, $P2396
    goto if_2395_end
  if_2395:
    find_lex $P2397, "$scope"
    set $S2398, $P2397
    isne $I2399, $S2398, "contextual"
    new $P2394, 'Integer'
    set $P2394, $I2399
  if_2395_end:
    if $P2394, if_2393
    set $P2392, $P2394
    goto if_2393_end
  if_2393:
.annotate 'line', 1749
    new $P2400, "Exception"
    set $P2400['type'], .CONTROL_RETURN
    find_lex $P2401, "self"
    find_lex $P2402, "$node"
    find_lex $P2403, "$bindpost"
    find_lex $P2404, "$scope"
    set $S2405, $P2404
    $P2406 = $P2401.$S2405($P2402, $P2403)
    setattribute $P2400, 'payload', $P2406
    throw $P2400
  if_2393_end:
.annotate 'line', 1746
    .return ($P2392)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "keyed"  :subid("91_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["PAST";"Var"],_)
    .param pmc param_2447
    .param pmc param_2448
    .param pmc param_2449 :optional
    .param int has_param_2449 :opt_flag
.annotate 'line', 1772
    new $P2446, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P2446, control_2445
    push_eh $P2446
    .lex "self", self
    .lex "$node", param_2447
    .lex "$bindpost", param_2448
    if has_param_2449, optparam_350
    new $P2450, "Undef"
    set param_2449, $P2450
  optparam_350:
    .lex "$keyrtype", param_2449
.annotate 'line', 1773

        .local pmc node
        node = find_lex '$node'
        .local pmc bindpost
        bindpost = find_lex '$bindpost'
        .local pmc pkeyrtype
        .local string keyrtype
        pkeyrtype = find_lex '$keyrtype'
        keyrtype = pkeyrtype
        .local int has_keyrtype
        has_keyrtype = defined pkeyrtype

        .local pmc ops
        $P0 = get_hll_global ['POST'], 'Ops'
        ops = $P0.'new'('node'=>node)

        if has_keyrtype goto have_keyrtype
        keyrtype = '*'
      have_keyrtype:

        .local pmc keypast, keypost
        keypast = node[1]
        keypost = self.'as_post'(keypast, 'rtype'=>keyrtype)
        keypost = self.'coerce'(keypost, keyrtype)
        ops.'push'(keypost)

        .local pmc basepast, basepost
        basepast = node[0]

        $P0 = node.'vivibase'()
        unless $P0 goto have_vivibase
        $I0 = can basepast, 'viviself'
        unless $I0 goto have_vivibase
        $P1 = basepast.'viviself'()
        unless $P1 goto vivibase_1
        if $P1 != 'Undef' goto have_vivibase
      vivibase_1:
        basepast.'viviself'($P0)
      have_vivibase:

        #  if the keyed node is an lvalue, its base is an lvalue also
        $I0 = node.'lvalue'()
        unless $I0 goto have_lvalue
        basepast.'lvalue'($I0)
      have_lvalue:

        basepost = self.'as_post'(basepast, 'rtype'=>'P')
        ops.'push'(basepost)
        .local string name
        $S0 = basepost.'result'()
        name = concat $S0, '['
        $S0 = keypost.'result'()
        name = concat name, $S0
        name = concat name, ']'
        .local pmc fetchop, storeop
        $P0 = get_hll_global ['POST'], 'Op'
        if bindpost goto keyed_bind
        fetchop = $P0.'new'(ops, name, 'pirop'=>'set')
        storeop = $P0.'new'(name, ops, 'pirop'=>'set')
        .tailcall self.'vivify'(node, ops, fetchop, storeop)
      keyed_bind:
        ops.'result'(bindpost)
        ops.'push_pirop'('set', name, ops)
        .return (ops)
    
.annotate 'line', 1772
    .return ()
  control_2445:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2451, exception, "payload"
    .return ($P2451)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "keyed_int"  :subid("92_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["PAST";"Var"],_)
    .param pmc param_2455
    .param pmc param_2456
.annotate 'line', 1841
    new $P2454, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P2454, control_2453
    push_eh $P2454
    .lex "self", self
    .lex "$node", param_2455
    .lex "$bindpost", param_2456
.annotate 'line', 1842
    find_lex $P2457, "self"
    find_lex $P2458, "$node"
    find_lex $P2459, "$bindpost"
    $P2460 = $P2457."keyed"($P2458, $P2459, "i")
.annotate 'line', 1841
    .return ($P2460)
  control_2453:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2461, exception, "payload"
    .return ($P2461)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "attribute"  :subid("93_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["PAST";"Var"],_)
    .param pmc param_2465
    .param pmc param_2466
.annotate 'line', 1846
    new $P2464, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P2464, control_2463
    push_eh $P2464
    .lex "self", self
    .lex "$node", param_2465
    .lex "$bindpost", param_2466
.annotate 'line', 1847

        .local pmc node
        node = find_lex '$node'
        .local pmc bindpost
        bindpost = find_lex '$bindpost'

        .local pmc ops
        $P0 = get_hll_global ['POST'], 'Ops'
        ops = $P0.'new'('node'=>node)
        .local string name
        name = node.'name'()
        name = self.'escape'(name)

        # We have three cases here.
        #   0 children = use self
        #   1 child    = object to look up on
        #   2 children = object to look up on + class handle
        # In the last case, we need to generate a different form of the op that
        # has the extra argument.
        .local pmc call_on
        $I0 = elements node
        if $I0 == 0 goto use_self
        call_on = node[0]
        call_on = self.'as_post'(call_on, 'rtype'=>'P')
        ops.'push'(call_on)
        if $I0 == 2 goto have_class_handle
        goto invocant_done
      use_self:
        call_on = box 'self'
      invocant_done:

        if bindpost goto attribute_bind

      attribute_post:
        .local pmc fetchop, storeop
        $P0 = get_hll_global ['POST'], 'Op'
        fetchop = $P0.'new'(ops, call_on, name, 'pirop'=>'getattribute')
        storeop = $P0.'new'(call_on, name, ops, 'pirop'=>'setattribute')
        .tailcall self.'vivify'(node, ops, fetchop, storeop)

      attribute_bind:
        ops.'push_pirop'('setattribute', call_on, name, bindpost)
        ops.'result'(bindpost)
        .return (ops)

      have_class_handle:
        .local pmc handle
        handle = node[1]
        handle = self.'as_post'(handle, 'rtype'=>'P')
        ops.'push'(handle)

        if bindpost goto attribute_bind_handle

        .local pmc fetchop, storeop
        $P0 = get_hll_global ['POST'], 'Op'
        fetchop = $P0.'new'(ops, call_on, handle, name, 'pirop'=>'getattribute')
        storeop = $P0.'new'(call_on, handle, name, ops, 'pirop'=>'setattribute')
        .tailcall self.'vivify'(node, ops, fetchop, storeop)

      attribute_bind_handle:
        ops.'push_pirop'('setattribute', call_on, handle, name, bindpost)
        ops.'result'(bindpost)
        .return (ops)
    
.annotate 'line', 1846
    .return ()
  control_2463:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2467, exception, "payload"
    .return ($P2467)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "register"  :subid("94_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["PAST";"Var"],_)
    .param pmc param_2471
    .param pmc param_2472
.annotate 'line', 1914
    .const 'Sub' $P2498 = "95_1308074680.10378" 
    capture_lex $P2498
    new $P2470, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P2470, control_2469
    push_eh $P2470
    .lex "self", self
    .lex "$node", param_2471
    .lex "$bindpost", param_2472
.annotate 'line', 1915
    new $P2473, "Undef"
    .lex "$name", $P2473
.annotate 'line', 1922
    new $P2474, "Undef"
    .lex "$ops", $P2474
.annotate 'line', 1915
    find_lex $P2475, "$node"
    $P2476 = $P2475."name"()
    store_lex "$name", $P2476
.annotate 'line', 1917
    find_lex $P2478, "$name"
    if $P2478, unless_2477_end
.annotate 'line', 1918
    find_lex $P2479, "self"
    $P2480 = $P2479."uniquereg"("P")
    store_lex "$name", $P2480
.annotate 'line', 1919
    find_lex $P2481, "$node"
    find_lex $P2482, "$name"
    $P2481."name"($P2482)
  unless_2477_end:
.annotate 'line', 1922
    get_hll_global $P2483, ["POST"], "Ops"
    find_lex $P2484, "$name"
    find_lex $P2485, "$node"
    $P2486 = $P2483."new"($P2484 :named("result"), $P2485 :named("node"))
    store_lex "$ops", $P2486
.annotate 'line', 1924
    find_lex $P2488, "$node"
    $P2489 = $P2488."isdecl"()
    unless $P2489, if_2487_end
    find_lex $P2490, "$ops"
    find_lex $P2491, "$ops"
    $P2490."push_pirop"(".local pmc", $P2491)
  if_2487_end:
.annotate 'line', 1926
    find_lex $P2493, "$bindpost"
    if $P2493, if_2492
.annotate 'line', 1929
    .const 'Sub' $P2498 = "95_1308074680.10378" 
    capture_lex $P2498
    $P2498()
    goto if_2492_end
  if_2492:
.annotate 'line', 1927
    find_lex $P2494, "$ops"
    find_lex $P2495, "$ops"
    find_lex $P2496, "$bindpost"
    $P2494."push_pirop"("set", $P2495, $P2496)
  if_2492_end:
.annotate 'line', 1926
    find_lex $P2518, "$ops"
.annotate 'line', 1914
    .return ($P2518)
  control_2469:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2519, exception, "payload"
    .return ($P2519)
.end


.namespace ["PAST";"Compiler"]
.sub "_block2497"  :anon :subid("95_1308074680.10378") :outer("94_1308074680.10378")
.annotate 'line', 1929
    .const 'Sub' $P2506 = "96_1308074680.10378" 
    capture_lex $P2506
.annotate 'line', 1930
    new $P2499, "Undef"
    .lex "$viviself", $P2499
    find_lex $P2500, "$node"
    $P2501 = $P2500."viviself"()
    store_lex "$viviself", $P2501
.annotate 'line', 1931
    find_lex $P2504, "$viviself"
    if $P2504, if_2503
    set $P2502, $P2504
    goto if_2503_end
  if_2503:
    .const 'Sub' $P2506 = "96_1308074680.10378" 
    capture_lex $P2506
    $P2517 = $P2506()
    set $P2502, $P2517
  if_2503_end:
.annotate 'line', 1929
    .return ($P2502)
.end


.namespace ["PAST";"Compiler"]
.sub "_block2505"  :anon :subid("96_1308074680.10378") :outer("95_1308074680.10378")
.annotate 'line', 1932
    new $P2507, "Undef"
    .lex "$vivipost", $P2507
    find_lex $P2508, "self"
    find_lex $P2509, "$viviself"
    $P2510 = $P2508."as_vivipost"($P2509, "P" :named("rtype"))
    store_lex "$vivipost", $P2510
.annotate 'line', 1933
    find_lex $P2511, "$ops"
    find_lex $P2512, "$vivipost"
    $P2511."push"($P2512)
.annotate 'line', 1934
    find_lex $P2513, "$ops"
    find_lex $P2514, "$ops"
    find_lex $P2515, "$vivipost"
    $P2516 = $P2513."push_pirop"("set", $P2514, $P2515)
.annotate 'line', 1931
    .return ($P2516)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("97_1308074680.10378") :method :outer("11_1308074680.10378") :multi(_,["PAST";"Val"])
    .param pmc param_2523
    .param pmc param_2524 :slurpy :named
.annotate 'line', 1950
    new $P2522, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P2522, control_2521
    push_eh $P2522
    .lex "self", self
    .lex "$node", param_2523
    .lex "%options", param_2524
.annotate 'line', 1951

        .local pmc node
        node = find_lex '$node'
        .local pmc options
        options = find_lex '%options'

        .local pmc ops
        $P0 = get_hll_global ['POST'], 'Ops'
        ops = $P0.'new'('node'=>node)

        .local pmc value, returns
        value = node['value']
        if null value goto err_novalue
        $I0 = isa value, ['PAST';'Block']
        if $I0 goto value_block
        returns = node.'returns'()
        if returns goto have_returns
        $S0 = typeof value
        returns = $S0
      have_returns:

        .local string valflags
        $P0 = get_global '%valflags'
        valflags = $P0[returns]

        $I0 = index valflags, 'e'
        if $I0 < 0 goto escape_done
        value = self.'escape'(value)
      escape_done:

        # See if this is a pasm constant type
        $I0 = index valflags, 'c'
        if $I0 < 0 goto const_done
        # Add the directive for the appropriate .include statement.
        $S0 = returns
        if $S0 == '!macro_const' goto include_done
        $S0 = replace $S0, 0, 1, '.include "'
        $S0 = concat $S0, '.pasm"'
        $P0 = find_dynamic_lex '$*SUB'
        $P0.'add_directive'($S0)
      include_done:
        # Add a leading dot to the value if one isn't already there.
        $S0 = substr value, 0, 1
        if $S0 == '.' goto const_done
        $P0 = box '.'
        value = concat $P0, value
      const_done:

        .local string rtype
        rtype = options['rtype']
        $I0 = index valflags, rtype
        if $I0 < 0 goto result_convert
        ops.'result'(value)
        .return (ops)

      result_convert:
        # handle int-to-num conversion here
        if rtype != 'n' goto result_pmc
        $I0 = index valflags, 'i'
        if $I0 < 0 goto result_pmc
        value = concat value, '.0'
        ops.'result'(value)
        .return (ops)

      result_pmc:
        .local string result
        result = self.'uniquereg'('P')
        returns = self.'escape'(returns)
        ops.'push_pirop'('new', result, returns)
        ops.'push_pirop'('assign', result, value)
        ops.'result'(result)
        .return (ops)

      value_block:
        .local string blockreg, blockref
        blockreg = self.'uniquereg'('P')
        blockref = concat ".const 'Sub' ", blockreg
        blockref = concat blockref, ' = '
        $P0 = value.'subid'()
        $S0 = self.'escape'($P0)
        blockref = concat blockref, $S0
        ops.'push_pirop'(blockref)
        ops.'result'(blockreg)
        .return (ops)

      err_novalue:
        self.'panic'('PAST::Val node missing :value attribute')
    
.annotate 'line', 1950
    .return ()
  control_2521:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2525, exception, "payload"
    .return ($P2525)
.end


.namespace ["PAST";"Compiler"]
.sub "_block2527" :load :anon :subid("98_1308074680.10378")
.annotate 'line', 41
    .const 'Sub' $P2529 = "11_1308074680.10378" 
    $P2530 = $P2529()
    .return ($P2530)
.end


.namespace []
.sub "_block2718" :load :anon :subid("99_1308074680.10378")
.annotate 'line', 1
    .const 'Sub' $P2720 = "10_1308074680.10378" 
    $P2721 = $P2720()
    .return ($P2721)
.end

