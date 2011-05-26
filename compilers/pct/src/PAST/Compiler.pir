
.namespace []
.sub "_block11"  :anon :subid("10_1306440677.9234")
.annotate 'line', 0
    .const 'Sub' $P14 = "11_1306440677.9234" 
    capture_lex $P14
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 41
    .const 'Sub' $P14 = "11_1306440677.9234" 
    capture_lex $P14
    $P596 = $P14()
.annotate 'line', 1
    .return ($P596)
    .const 'Sub' $P598 = "65_1306440677.9234" 
    .return ($P598)
.end


.namespace []
.sub "" :load :init :subid("post66") :outer("10_1306440677.9234")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1306440677.9234" 
    .local pmc block
    set block, $P12
.annotate 'line', 1
    load_bytecode "PCT/HLLCompiler.pbc"
    $P601 = get_root_global ["parrot"], "P6metaclass"
    new $P602, "ResizablePMCArray"
    push $P602, "%!symtable"
    $P601."new_class"("PAST::Compiler", "PCT::HLLCompiler" :named("parent"), $P602 :named("attr"))
.end


.namespace ["PAST";"Compiler"]
.sub "_block13"  :subid("11_1306440677.9234") :outer("10_1306440677.9234")
.annotate 'line', 41
    .const 'Sub' $P401 = "63_1306440677.9234" 
    capture_lex $P401
    .const 'Sub' $P395 = "62_1306440677.9234" 
    capture_lex $P395
    .const 'Sub' $P389 = "61_1306440677.9234" 
    capture_lex $P389
    .const 'Sub' $P383 = "60_1306440677.9234" 
    capture_lex $P383
    .const 'Sub' $P375 = "59_1306440677.9234" 
    capture_lex $P375
    .const 'Sub' $P369 = "58_1306440677.9234" 
    capture_lex $P369
    .const 'Sub' $P363 = "57_1306440677.9234" 
    capture_lex $P363
    .const 'Sub' $P357 = "56_1306440677.9234" 
    capture_lex $P357
    .const 'Sub' $P351 = "55_1306440677.9234" 
    capture_lex $P351
    .const 'Sub' $P343 = "54_1306440677.9234" 
    capture_lex $P343
    .const 'Sub' $P337 = "53_1306440677.9234" 
    capture_lex $P337
    .const 'Sub' $P285 = "52_1306440677.9234" 
    capture_lex $P285
    .const 'Sub' $P279 = "51_1306440677.9234" 
    capture_lex $P279
    .const 'Sub' $P273 = "50_1306440677.9234" 
    capture_lex $P273
    .const 'Sub' $P267 = "49_1306440677.9234" 
    capture_lex $P267
    .const 'Sub' $P261 = "48_1306440677.9234" 
    capture_lex $P261
    .const 'Sub' $P255 = "47_1306440677.9234" 
    capture_lex $P255
    .const 'Sub' $P249 = "46_1306440677.9234" 
    capture_lex $P249
    .const 'Sub' $P243 = "45_1306440677.9234" 
    capture_lex $P243
    .const 'Sub' $P237 = "44_1306440677.9234" 
    capture_lex $P237
    .const 'Sub' $P227 = "43_1306440677.9234" 
    capture_lex $P227
    .const 'Sub' $P221 = "42_1306440677.9234" 
    capture_lex $P221
    .const 'Sub' $P215 = "41_1306440677.9234" 
    capture_lex $P215
    .const 'Sub' $P209 = "40_1306440677.9234" 
    capture_lex $P209
    .const 'Sub' $P203 = "39_1306440677.9234" 
    capture_lex $P203
    .const 'Sub' $P197 = "38_1306440677.9234" 
    capture_lex $P197
    .const 'Sub' $P191 = "37_1306440677.9234" 
    capture_lex $P191
    .const 'Sub' $P186 = "36_1306440677.9234" 
    capture_lex $P186
    .const 'Sub' $P180 = "35_1306440677.9234" 
    capture_lex $P180
    .const 'Sub' $P174 = "34_1306440677.9234" 
    capture_lex $P174
    .const 'Sub' $P168 = "33_1306440677.9234" 
    capture_lex $P168
    .const 'Sub' $P162 = "32_1306440677.9234" 
    capture_lex $P162
    .const 'Sub' $P156 = "31_1306440677.9234" 
    capture_lex $P156
    .const 'Sub' $P150 = "30_1306440677.9234" 
    capture_lex $P150
    .const 'Sub' $P144 = "29_1306440677.9234" 
    capture_lex $P144
    .const 'Sub' $P137 = "28_1306440677.9234" 
    capture_lex $P137
    .const 'Sub' $P131 = "27_1306440677.9234" 
    capture_lex $P131
    .const 'Sub' $P125 = "26_1306440677.9234" 
    capture_lex $P125
    .const 'Sub' $P115 = "25_1306440677.9234" 
    capture_lex $P115
    .const 'Sub' $P105 = "24_1306440677.9234" 
    capture_lex $P105
    .const 'Sub' $P87 = "23_1306440677.9234" 
    capture_lex $P87
    .const 'Sub' $P81 = "22_1306440677.9234" 
    capture_lex $P81
    .const 'Sub' $P75 = "21_1306440677.9234" 
    capture_lex $P75
    .const 'Sub' $P69 = "20_1306440677.9234" 
    capture_lex $P69
    .const 'Sub' $P63 = "19_1306440677.9234" 
    capture_lex $P63
    .const 'Sub' $P57 = "18_1306440677.9234" 
    capture_lex $P57
    .const 'Sub' $P51 = "17_1306440677.9234" 
    capture_lex $P51
    .const 'Sub' $P45 = "16_1306440677.9234" 
    capture_lex $P45
    .const 'Sub' $P40 = "15_1306440677.9234" 
    capture_lex $P40
    .const 'Sub' $P34 = "14_1306440677.9234" 
    capture_lex $P34
    .const 'Sub' $P29 = "13_1306440677.9234" 
    capture_lex $P29
    .const 'Sub' $P23 = "12_1306440677.9234" 
    capture_lex $P23
.annotate 'line', 43
    get_global $P15, "%piropsig"
    unless_null $P15, vivify_158
    $P15 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P15
  vivify_158:
.annotate 'line', 44
    get_global $P16, "%valflags"
    unless_null $P16, vivify_159
    $P16 = root_new ['parrot';'Hash']
    set_global "%valflags", $P16
  vivify_159:
.annotate 'line', 45
    get_global $P17, "%controltypes"
    unless_null $P17, vivify_160
    $P17 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P17
  vivify_160:
.annotate 'line', 46
    get_global $P18, "$serno"
    unless_null $P18, vivify_161
    new $P18, "Undef"
    set_global "$serno", $P18
  vivify_161:
.annotate 'line', 41
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    get_global $P19, "%piropsig"
    get_global $P20, "%valflags"
    get_global $P21, "%controltypes"
    get_global $P22, "$serno"
.annotate 'line', 2531
    .const 'Sub' $P401 = "63_1306440677.9234" 
    newclosure $P407, $P401
.annotate 'line', 41
    .return ($P407)
    .const 'Sub' $P409 = "64_1306440677.9234" 
    .return ($P409)
.end


.namespace ["PAST";"Compiler"]
.sub "" :load :init :subid("post67") :outer("11_1306440677.9234")
.annotate 'line', 41
    .const 'Sub' $P14 = "11_1306440677.9234" 
    .local pmc block
    set block, $P14
.annotate 'line', 49
    get_hll_global $P412, ["PAST"], "Compiler"
    $P412."language"("PAST")
.annotate 'line', 50
    get_hll_global $P413, ["PAST"], "Compiler"
    new $P414, "ResizablePMCArray"
    push $P414, "post"
    push $P414, "pir"
    push $P414, "evalpmc"
    $P413."stages"($P414)
.annotate 'line', 53
    new $P415, "String"
    assign $P415, "PP+"
    get_global $P416, "%piropsig"
    unless_null $P416, vivify_68
    $P416 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P416
  vivify_68:
    set $P416["add"], $P415
.annotate 'line', 54
    new $P417, "String"
    assign $P417, "PPP"
    get_global $P418, "%piropsig"
    unless_null $P418, vivify_69
    $P418 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P418
  vivify_69:
    set $P418["band"], $P417
.annotate 'line', 55
    new $P419, "String"
    assign $P419, "PPP"
    get_global $P420, "%piropsig"
    unless_null $P420, vivify_70
    $P420 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P420
  vivify_70:
    set $P420["bxor"], $P419
.annotate 'line', 56
    new $P421, "String"
    assign $P421, "PP"
    get_global $P422, "%piropsig"
    unless_null $P422, vivify_71
    $P422 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P422
  vivify_71:
    set $P422["bnot"], $P421
.annotate 'line', 57
    new $P423, "String"
    assign $P423, "PPP"
    get_global $P424, "%piropsig"
    unless_null $P424, vivify_72
    $P424 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P424
  vivify_72:
    set $P424["bor"], $P423
.annotate 'line', 58
    new $P425, "String"
    assign $P425, "IPs"
    get_global $P426, "%piropsig"
    unless_null $P426, vivify_73
    $P426 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P426
  vivify_73:
    set $P426["can"], $P425
.annotate 'line', 59
    new $P427, "String"
    assign $P427, "Si"
    get_global $P428, "%piropsig"
    unless_null $P428, vivify_74
    $P428 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P428
  vivify_74:
    set $P428["chr"], $P427
.annotate 'line', 60
    new $P429, "String"
    assign $P429, "PP"
    get_global $P430, "%piropsig"
    unless_null $P430, vivify_75
    $P430 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P430
  vivify_75:
    set $P430["clone"], $P429
.annotate 'line', 61
    new $P431, "String"
    assign $P431, "PP~"
    get_global $P432, "%piropsig"
    unless_null $P432, vivify_76
    $P432 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P432
  vivify_76:
    set $P432["concat"], $P431
.annotate 'line', 62
    new $P433, "String"
    assign $P433, "0PP"
    get_global $P434, "%piropsig"
    unless_null $P434, vivify_77
    $P434 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P434
  vivify_77:
    set $P434["copy"], $P433
.annotate 'line', 63
    new $P435, "String"
    assign $P435, "IP"
    get_global $P436, "%piropsig"
    unless_null $P436, vivify_78
    $P436 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P436
  vivify_78:
    set $P436["defined"], $P435
.annotate 'line', 64
    new $P437, "String"
    assign $P437, "vQ*"
    get_global $P438, "%piropsig"
    unless_null $P438, vivify_79
    $P438 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P438
  vivify_79:
    set $P438["delete"], $P437
.annotate 'line', 65
    new $P439, "String"
    assign $P439, "v~"
    get_global $P440, "%piropsig"
    unless_null $P440, vivify_80
    $P440 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P440
  vivify_80:
    set $P440["die"], $P439
.annotate 'line', 66
    new $P441, "String"
    assign $P441, "PP+"
    get_global $P442, "%piropsig"
    unless_null $P442, vivify_81
    $P442 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P442
  vivify_81:
    set $P442["div"], $P441
.annotate 'line', 67
    new $P443, "String"
    assign $P443, "IPs"
    get_global $P444, "%piropsig"
    unless_null $P444, vivify_82
    $P444 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P444
  vivify_82:
    set $P444["does"], $P443
.annotate 'line', 68
    new $P445, "String"
    assign $P445, "Ss"
    get_global $P446, "%piropsig"
    unless_null $P446, vivify_83
    $P446 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P446
  vivify_83:
    set $P446["downcase"], $P445
.annotate 'line', 69
    new $P447, "String"
    assign $P447, "IP"
    get_global $P448, "%piropsig"
    unless_null $P448, vivify_84
    $P448 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P448
  vivify_84:
    set $P448["elements"], $P447
.annotate 'line', 70
    new $P449, "String"
    assign $P449, "IQ*"
    get_global $P450, "%piropsig"
    unless_null $P450, vivify_85
    $P450 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P450
  vivify_85:
    set $P450["exists"], $P449
.annotate 'line', 71
    new $P451, "String"
    assign $P451, "vi"
    get_global $P452, "%piropsig"
    unless_null $P452, vivify_86
    $P452 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P452
  vivify_86:
    set $P452["exit"], $P451
.annotate 'line', 72
    new $P453, "String"
    assign $P453, "PP+"
    get_global $P454, "%piropsig"
    unless_null $P454, vivify_87
    $P454 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P454
  vivify_87:
    set $P454["fdiv"], $P453
.annotate 'line', 73
    new $P455, "String"
    assign $P455, "Is"
    get_global $P456, "%piropsig"
    unless_null $P456, vivify_88
    $P456 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P456
  vivify_88:
    set $P456["find_codepoint"], $P455
.annotate 'line', 74
    new $P457, "String"
    assign $P457, "Ps"
    get_global $P458, "%piropsig"
    unless_null $P458, vivify_89
    $P458 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P458
  vivify_89:
    set $P458["find_dynamic_lex"], $P457
.annotate 'line', 75
    new $P459, "String"
    assign $P459, "Ps"
    get_global $P460, "%piropsig"
    unless_null $P460, vivify_90
    $P460 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P460
  vivify_90:
    set $P460["find_name"], $P459
.annotate 'line', 76
    new $P461, "String"
    assign $P461, "P"
    get_global $P462, "%piropsig"
    unless_null $P462, vivify_91
    $P462 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P462
  vivify_91:
    set $P462["getinterp"], $P461
.annotate 'line', 77
    new $P463, "String"
    assign $P463, "P~P"
    get_global $P464, "%piropsig"
    unless_null $P464, vivify_92
    $P464 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P464
  vivify_92:
    set $P464["getprop"], $P463
.annotate 'line', 78
    new $P465, "String"
    assign $P465, "P"
    get_global $P466, "%piropsig"
    unless_null $P466, vivify_93
    $P466 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P466
  vivify_93:
    set $P466["getstderr"], $P465
.annotate 'line', 79
    new $P467, "String"
    assign $P467, "P"
    get_global $P468, "%piropsig"
    unless_null $P468, vivify_94
    $P468 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P468
  vivify_94:
    set $P468["getstdin"], $P467
.annotate 'line', 80
    new $P469, "String"
    assign $P469, "P"
    get_global $P470, "%piropsig"
    unless_null $P470, vivify_95
    $P470 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P470
  vivify_95:
    set $P470["getstdout"], $P469
.annotate 'line', 81
    new $P471, "String"
    assign $P471, "Issi"
    get_global $P472, "%piropsig"
    unless_null $P472, vivify_96
    $P472 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P472
  vivify_96:
    set $P472["index"], $P471
.annotate 'line', 82
    new $P473, "String"
    assign $P473, "IP~"
    get_global $P474, "%piropsig"
    unless_null $P474, vivify_97
    $P474 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P474
  vivify_97:
    set $P474["isa"], $P473
.annotate 'line', 83
    new $P475, "String"
    assign $P475, "IP"
    get_global $P476, "%piropsig"
    unless_null $P476, vivify_98
    $P476 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P476
  vivify_98:
    set $P476["isfalse"], $P475
.annotate 'line', 84
    new $P477, "String"
    assign $P477, "IP"
    get_global $P478, "%piropsig"
    unless_null $P478, vivify_99
    $P478 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P478
  vivify_99:
    set $P478["isnull"], $P477
.annotate 'line', 85
    new $P479, "String"
    assign $P479, "IPP"
    get_global $P480, "%piropsig"
    unless_null $P480, vivify_100
    $P480 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P480
  vivify_100:
    set $P480["issame"], $P479
.annotate 'line', 86
    new $P481, "String"
    assign $P481, "IP"
    get_global $P482, "%piropsig"
    unless_null $P482, vivify_101
    $P482 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P482
  vivify_101:
    set $P482["istrue"], $P481
.annotate 'line', 87
    new $P483, "String"
    assign $P483, "SsP"
    get_global $P484, "%piropsig"
    unless_null $P484, vivify_102
    $P484 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P484
  vivify_102:
    set $P484["join"], $P483
.annotate 'line', 88
    new $P485, "String"
    assign $P485, "Is"
    get_global $P486, "%piropsig"
    unless_null $P486, vivify_103
    $P486 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P486
  vivify_103:
    set $P486["length"], $P485
.annotate 'line', 89
    new $P487, "String"
    assign $P487, "vs"
    get_global $P488, "%piropsig"
    unless_null $P488, vivify_104
    $P488 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P488
  vivify_104:
    set $P488["load_bytecode"], $P487
.annotate 'line', 90
    new $P489, "String"
    assign $P489, "vs"
    get_global $P490, "%piropsig"
    unless_null $P490, vivify_105
    $P490 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P490
  vivify_105:
    set $P490["load_language"], $P489
.annotate 'line', 91
    new $P491, "String"
    assign $P491, "P~"
    get_global $P492, "%piropsig"
    unless_null $P492, vivify_106
    $P492 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P492
  vivify_106:
    set $P492["loadlib"], $P491
.annotate 'line', 92
    new $P493, "String"
    assign $P493, "PP+"
    get_global $P494, "%piropsig"
    unless_null $P494, vivify_107
    $P494 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P494
  vivify_107:
    set $P494["mod"], $P493
.annotate 'line', 93
    new $P495, "String"
    assign $P495, "PP+"
    get_global $P496, "%piropsig"
    unless_null $P496, vivify_108
    $P496 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P496
  vivify_108:
    set $P496["mul"], $P495
.annotate 'line', 94
    new $P497, "String"
    assign $P497, "PP"
    get_global $P498, "%piropsig"
    unless_null $P498, vivify_109
    $P498 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P498
  vivify_109:
    set $P498["neg"], $P497
.annotate 'line', 95
    new $P499, "String"
    assign $P499, "P~"
    get_global $P500, "%piropsig"
    unless_null $P500, vivify_110
    $P500 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P500
  vivify_110:
    set $P500["new"], $P499
.annotate 'line', 96
    new $P501, "String"
    assign $P501, "PP"
    get_global $P502, "%piropsig"
    unless_null $P502, vivify_111
    $P502 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P502
  vivify_111:
    set $P502["newclosure"], $P501
.annotate 'line', 97
    new $P503, "String"
    assign $P503, "PP"
    get_global $P504, "%piropsig"
    unless_null $P504, vivify_112
    $P504 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P504
  vivify_112:
    set $P504["not"], $P503
.annotate 'line', 98
    new $P505, "String"
    assign $P505, "Isi"
    get_global $P506, "%piropsig"
    unless_null $P506, vivify_113
    $P506 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P506
  vivify_113:
    set $P506["ord"], $P505
.annotate 'line', 99
    new $P507, "String"
    assign $P507, "PP"
    get_global $P508, "%piropsig"
    unless_null $P508, vivify_114
    $P508 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P508
  vivify_114:
    set $P508["pop"], $P507
.annotate 'line', 100
    new $P509, "String"
    assign $P509, "NN+"
    get_global $P510, "%piropsig"
    unless_null $P510, vivify_115
    $P510 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P510
  vivify_115:
    set $P510["pow"], $P509
.annotate 'line', 101
    new $P511, "String"
    assign $P511, "v*"
    get_global $P512, "%piropsig"
    unless_null $P512, vivify_116
    $P512 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P512
  vivify_116:
    set $P512["print"], $P511
.annotate 'line', 102
    new $P513, "String"
    assign $P513, "v*"
    get_global $P514, "%piropsig"
    unless_null $P514, vivify_117
    $P514 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P514
  vivify_117:
    set $P514["printerr"], $P513
.annotate 'line', 103
    new $P515, "String"
    assign $P515, "0P*"
    get_global $P516, "%piropsig"
    unless_null $P516, vivify_118
    $P516 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P516
  vivify_118:
    set $P516["push"], $P515
.annotate 'line', 104
    new $P517, "String"
    assign $P517, "Ssi"
    get_global $P518, "%piropsig"
    unless_null $P518, vivify_119
    $P518 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P518
  vivify_119:
    set $P518["repeat"], $P517
.annotate 'line', 105
    new $P519, "String"
    assign $P519, "Ssiis"
    get_global $P520, "%piropsig"
    unless_null $P520, vivify_120
    $P520 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P520
  vivify_120:
    set $P520["replace"], $P519
.annotate 'line', 106
    new $P521, "String"
    assign $P521, "v*"
    get_global $P522, "%piropsig"
    unless_null $P522, vivify_121
    $P522 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P522
  vivify_121:
    set $P522["say"], $P521
.annotate 'line', 107
    new $P523, "String"
    assign $P523, "PP"
    get_global $P524, "%piropsig"
    unless_null $P524, vivify_122
    $P524 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P524
  vivify_122:
    set $P524["set"], $P523
.annotate 'line', 108
    new $P525, "String"
    assign $P525, "0P~P"
    get_global $P526, "%piropsig"
    unless_null $P526, vivify_123
    $P526 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P526
  vivify_123:
    set $P526["setprop"], $P525
.annotate 'line', 109
    new $P527, "String"
    assign $P527, "0P~P"
    get_global $P528, "%piropsig"
    unless_null $P528, vivify_124
    $P528 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P528
  vivify_124:
    set $P528["setattribute"], $P527
.annotate 'line', 110
    new $P529, "String"
    assign $P529, "PP"
    get_global $P530, "%piropsig"
    unless_null $P530, vivify_125
    $P530 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P530
  vivify_125:
    set $P530["shift"], $P529
.annotate 'line', 111
    new $P531, "String"
    assign $P531, "PP+"
    get_global $P532, "%piropsig"
    unless_null $P532, vivify_126
    $P532 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P532
  vivify_126:
    set $P532["shl"], $P531
.annotate 'line', 112
    new $P533, "String"
    assign $P533, "PP+"
    get_global $P534, "%piropsig"
    unless_null $P534, vivify_127
    $P534 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P534
  vivify_127:
    set $P534["shr"], $P533
.annotate 'line', 113
    new $P535, "String"
    assign $P535, "v+"
    get_global $P536, "%piropsig"
    unless_null $P536, vivify_128
    $P536 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P536
  vivify_128:
    set $P536["sleep"], $P535
.annotate 'line', 114
    new $P537, "String"
    assign $P537, "0PPii"
    get_global $P538, "%piropsig"
    unless_null $P538, vivify_129
    $P538 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P538
  vivify_129:
    set $P538["splice"], $P537
.annotate 'line', 115
    new $P539, "String"
    assign $P539, "Pss"
    get_global $P540, "%piropsig"
    unless_null $P540, vivify_130
    $P540 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P540
  vivify_130:
    set $P540["split"], $P539
.annotate 'line', 116
    new $P541, "String"
    assign $P541, "PP+"
    get_global $P542, "%piropsig"
    unless_null $P542, vivify_131
    $P542 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P542
  vivify_131:
    set $P542["sub"], $P541
.annotate 'line', 117
    new $P543, "String"
    assign $P543, "Ssii"
    get_global $P544, "%piropsig"
    unless_null $P544, vivify_132
    $P544 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P544
  vivify_132:
    set $P544["substr"], $P543
.annotate 'line', 118
    new $P545, "String"
    assign $P545, "Ss"
    get_global $P546, "%piropsig"
    unless_null $P546, vivify_133
    $P546 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P546
  vivify_133:
    set $P546["titlecase"], $P545
.annotate 'line', 119
    new $P547, "String"
    assign $P547, "vi"
    get_global $P548, "%piropsig"
    unless_null $P548, vivify_134
    $P548 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P548
  vivify_134:
    set $P548["trace"], $P547
.annotate 'line', 120
    new $P549, "String"
    assign $P549, "SP"
    get_global $P550, "%piropsig"
    unless_null $P550, vivify_135
    $P550 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P550
  vivify_135:
    set $P550["typeof"], $P549
.annotate 'line', 121
    new $P551, "String"
    assign $P551, "0P*"
    get_global $P552, "%piropsig"
    unless_null $P552, vivify_136
    $P552 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P552
  vivify_136:
    set $P552["unshift"], $P551
.annotate 'line', 122
    new $P553, "String"
    assign $P553, "Ss"
    get_global $P554, "%piropsig"
    unless_null $P554, vivify_137
    $P554 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P554
  vivify_137:
    set $P554["upcase"], $P553
.annotate 'line', 127
    new $P555, "String"
    assign $P555, "s~*:e"
    get_global $P556, "%valflags"
    unless_null $P556, vivify_138
    $P556 = root_new ['parrot';'Hash']
    set_global "%valflags", $P556
  vivify_138:
    set $P556["String"], $P555
.annotate 'line', 128
    new $P557, "String"
    assign $P557, "i+*:"
    get_global $P558, "%valflags"
    unless_null $P558, vivify_139
    $P558 = root_new ['parrot';'Hash']
    set_global "%valflags", $P558
  vivify_139:
    set $P558["Integer"], $P557
.annotate 'line', 129
    new $P559, "String"
    assign $P559, "n+*:"
    get_global $P560, "%valflags"
    unless_null $P560, vivify_140
    $P560 = root_new ['parrot';'Hash']
    set_global "%valflags", $P560
  vivify_140:
    set $P560["Float"], $P559
.annotate 'line', 130
    new $P561, "String"
    assign $P561, "i+*:c"
    get_global $P562, "%valflags"
    unless_null $P562, vivify_141
    $P562 = root_new ['parrot';'Hash']
    set_global "%valflags", $P562
  vivify_141:
    set $P562["!cconst"], $P561
.annotate 'line', 131
    new $P563, "String"
    assign $P563, "i+*:c"
    get_global $P564, "%valflags"
    unless_null $P564, vivify_142
    $P564 = root_new ['parrot';'Hash']
    set_global "%valflags", $P564
  vivify_142:
    set $P564["!except_severity"], $P563
.annotate 'line', 132
    new $P565, "String"
    assign $P565, "i+*:c"
    get_global $P566, "%valflags"
    unless_null $P566, vivify_143
    $P566 = root_new ['parrot';'Hash']
    set_global "%valflags", $P566
  vivify_143:
    set $P566["!except_types"], $P565
.annotate 'line', 133
    new $P567, "String"
    assign $P567, "i+*:c"
    get_global $P568, "%valflags"
    unless_null $P568, vivify_144
    $P568 = root_new ['parrot';'Hash']
    set_global "%valflags", $P568
  vivify_144:
    set $P568["!iterator"], $P567
.annotate 'line', 134
    new $P569, "String"
    assign $P569, "i+*:c"
    get_global $P570, "%valflags"
    unless_null $P570, vivify_145
    $P570 = root_new ['parrot';'Hash']
    set_global "%valflags", $P570
  vivify_145:
    set $P570["!socket"], $P569
.annotate 'line', 138
    new $P571, "String"
    assign $P571, ".CONTROL_RETURN, .CONTROL_OK, .CONTROL_BREAK, .CONTROL_CONTINUE, .CONTROL_TAKE, .CONTROL_LEAVE, .CONTROL_EXIT, .CONTROL_LOOP_NEXT, .CONTROL_LOOP_LAST, .CONTROL_LOOP_REDO"
    get_global $P572, "%controltypes"
    unless_null $P572, vivify_146
    $P572 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P572
  vivify_146:
    set $P572["CONTROL"], $P571
.annotate 'line', 139
    new $P573, "String"
    assign $P573, ".CONTROL_RETURN"
    get_global $P574, "%controltypes"
    unless_null $P574, vivify_147
    $P574 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P574
  vivify_147:
    set $P574["RETURN"], $P573
.annotate 'line', 140
    new $P575, "String"
    assign $P575, ".CONTROL_OK"
    get_global $P576, "%controltypes"
    unless_null $P576, vivify_148
    $P576 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P576
  vivify_148:
    set $P576["OK"], $P575
.annotate 'line', 141
    new $P577, "String"
    assign $P577, ".CONTROL_BREAK"
    get_global $P578, "%controltypes"
    unless_null $P578, vivify_149
    $P578 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P578
  vivify_149:
    set $P578["BREAK"], $P577
.annotate 'line', 142
    new $P579, "String"
    assign $P579, ".CONTROL_CONTINUE"
    get_global $P580, "%controltypes"
    unless_null $P580, vivify_150
    $P580 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P580
  vivify_150:
    set $P580["CONTINUE"], $P579
.annotate 'line', 143
    new $P581, "String"
    assign $P581, ".CONTROL_ERROR"
    get_global $P582, "%controltypes"
    unless_null $P582, vivify_151
    $P582 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P582
  vivify_151:
    set $P582["ERROR"], $P581
.annotate 'line', 144
    new $P583, "String"
    assign $P583, ".CONTROL_TAKE"
    get_global $P584, "%controltypes"
    unless_null $P584, vivify_152
    $P584 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P584
  vivify_152:
    set $P584["GATHER"], $P583
.annotate 'line', 145
    new $P585, "String"
    assign $P585, ".CONTROL_LEAVE"
    get_global $P586, "%controltypes"
    unless_null $P586, vivify_153
    $P586 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P586
  vivify_153:
    set $P586["LEAVE"], $P585
.annotate 'line', 146
    new $P587, "String"
    assign $P587, ".CONTROL_EXIT"
    get_global $P588, "%controltypes"
    unless_null $P588, vivify_154
    $P588 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P588
  vivify_154:
    set $P588["EXIT"], $P587
.annotate 'line', 147
    new $P589, "String"
    assign $P589, ".CONTROL_NEXT"
    get_global $P590, "%controltypes"
    unless_null $P590, vivify_155
    $P590 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P590
  vivify_155:
    set $P590["NEXT"], $P589
.annotate 'line', 148
    new $P591, "String"
    assign $P591, ".CONTROL_LAST"
    get_global $P592, "%controltypes"
    unless_null $P592, vivify_156
    $P592 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P592
  vivify_156:
    set $P592["LAST"], $P591
.annotate 'line', 149
    new $P593, "String"
    assign $P593, ".CONTROL_REDO"
    get_global $P594, "%controltypes"
    unless_null $P594, vivify_157
    $P594 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P594
  vivify_157:
    set $P594["REDO"], $P593
.annotate 'line', 151
    new $P595, "Integer"
    assign $P595, 11
    set_global "$serno", $P595
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "to_post"  :subid("12_1306440677.9234") :method :outer("11_1306440677.9234")
    .param pmc param_26
    .param pmc param_27 :slurpy :named
.annotate 'line', 159
    new $P25, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P25, control_24
    push_eh $P25
    .lex "self", self
    .lex "$past", param_26
    .lex "%options", param_27
.annotate 'line', 160

		.local pmc past
		past = find_lex '$past'
		.local pmc options
		options = find_lex '%options'

		.local pmc symtable
		symtable = new 'Hash'
		setattribute self, '%!symtable', symtable

		.local pmc blockpast
		blockpast = get_global '@?BLOCK'
		unless null blockpast goto have_blockpast
		blockpast = new 'ResizablePMCArray'
		set_global '@?BLOCK', blockpast
	  have_blockpast:
		.lex '@*BLOCKPAST', blockpast
		null $P99
		.lex '$*SUB', $P99
		$P1 = self.'as_post'(past, 'rtype'=>'v')
		.return ($P1)
	
.annotate 'line', 159
    .return ()
  control_24:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P28, exception, "payload"
    .return ($P28)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "escape"  :subid("13_1306440677.9234") :method :outer("11_1306440677.9234")
    .param pmc param_32
.annotate 'line', 187
    new $P31, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P31, control_30
    push_eh $P31
    .lex "self", self
    .lex "$str", param_32
.annotate 'line', 188

		.local pmc pstr
		.local string str
		pstr = find_lex '$str'
		str = pstr
		.local string estr
		estr = escape str
		$I0 = index estr, "\\x"
		if $I0 >= 0 goto unicode_prefix
		$I0 = index estr, "\\u"
		if $I0 >= 0 goto unicode_prefix
		estr = concat '"', estr
		goto done
	  unicode_prefix:
		estr = concat 'unicode:"', estr
	  done:
		estr = concat estr, '"'
		.return (estr)
	
.annotate 'line', 187
    .return ()
  control_30:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P33, exception, "payload"
    .return ($P33)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "unique"  :subid("14_1306440677.9234") :method :outer("11_1306440677.9234")
    .param pmc param_37 :optional
    .param int has_param_37 :opt_flag
.annotate 'line', 214
    new $P36, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P36, control_35
    push_eh $P36
    .lex "self", self
    if has_param_37, optparam_162
    new $P38, "Undef"
    set param_37, $P38
  optparam_162:
    .lex "$fmt", param_37
.annotate 'line', 215

		.local pmc pfmt
		.local string fmt
		pfmt = find_lex '$fmt'
		fmt = pfmt
		.local int has_fmt
		has_fmt = defined pfmt

		if has_fmt goto unique_1
		fmt = ''
	  unique_1:
		$P0 = get_global '$serno'
		$S0 = $P0
		$S0 = concat fmt, $S0
		inc $P0
		.return ($S0)
	
.annotate 'line', 214
    .return ()
  control_35:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P39, exception, "payload"
    .return ($P39)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "uniquereg"  :subid("15_1306440677.9234") :method :outer("11_1306440677.9234")
    .param pmc param_43
.annotate 'line', 238
    new $P42, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P42, control_41
    push_eh $P42
    .lex "self", self
    .lex "$rtype", param_43
.annotate 'line', 239

		.local pmc prtype
		.local string rtype
		prtype = find_lex '$rtype'
		rtype = prtype
		unless rtype goto err_nortype
		if rtype == 'v' goto reg_void
		.local string reg
		reg = 'P'
		$I0 = index 'Ss~Nn+Ii', rtype
		if $I0 < 0 goto reg_psin
		reg = substr 'SSSNNNII', $I0, 1
	  reg_psin:
		reg = concat '$', reg
		.tailcall self.'unique'(reg)
	  reg_void:
		.return ('')
	  err_nortype:
		self.'panic'('rtype not set')
	
.annotate 'line', 238
    .return ()
  control_41:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P44, exception, "payload"
    .return ($P44)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "coerce"  :subid("16_1306440677.9234") :method :outer("11_1306440677.9234")
    .param pmc param_48
    .param pmc param_49
.annotate 'line', 267
    new $P47, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P47, control_46
    push_eh $P47
    .lex "self", self
    .lex "$post", param_48
    .lex "$rtype", param_49
.annotate 'line', 268

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
		if $S0 == '.' goto source_int_or_num
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
	
.annotate 'line', 267
    .return ()
  control_46:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P50, exception, "payload"
    .return ($P50)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "post_children"  :subid("17_1306440677.9234") :method :outer("11_1306440677.9234")
    .param pmc param_54
    .param pmc param_55 :slurpy :named
.annotate 'line', 399
    new $P53, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P53, control_52
    push_eh $P53
    .lex "self", self
    .lex "$node", param_54
    .lex "%options", param_55
.annotate 'line', 400

		.local pmc node
		node = find_lex '$node'
		.local pmc options
		options = find_lex '%options'

		.local pmc ops
		$P0 = get_hll_global ['POST'], 'Ops'
		ops = $P0.'new'('node'=>node)

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
		ops.'push'(cpost)
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
		$S1 = npost
		ops.'push'(npost)
		$S0 = concat $S0, ' :named('
		$S0 = concat $S0, $S1
		$S0 = concat $S0, ')'
		goto named_done
	  flat_named:
		$S0 = concat $S0, ' :named :flat'
	  named_done:
		push namedargs, $S0
		goto iter_rtype
	  iter_pos:
		if isflat goto flat_pos
	  cpost_pos:
		push posargs, cpost
		goto iter_rtype
	  flat_pos:
		$S0 = cpost
		$S0 = concat $S0, ' :flat'
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
		ops.'push'(kpost)
		ops.'push'(cpost)
		# now construct the keyed PMC
		$S0 = cpost
		$S0 = concat $S0, '['
		$S1 = kpost
		$S0 = concat $S0, $S1
		$S0 = concat $S0, ']'
		push posargs, $S0
		goto iter_rtype
	  iter_end:
		.return (ops, posargs, namedargs)
	
.annotate 'line', 399
    .return ()
  control_52:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P56, exception, "payload"
    .return ($P56)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("18_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,_)
    .param pmc param_60
    .param pmc param_61 :slurpy :named
.annotate 'line', 525
    new $P59, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P59, control_58
    push_eh $P59
    .lex "self", self
    .lex "$node", param_60
    .lex "%options", param_61
.annotate 'line', 526

		.local pmc node
		node = find_lex '$node'
		.param pmc options
		options = find_lex '%options'
		unless null node goto not_null_node
		self.'panic'("PAST::Compiler can't compile a null node")
		not_null_node:

		$S0 = typeof node
		self.'panic'("PAST::Compiler can't compile node of type ", $S0)
	
.annotate 'line', 525
    .return ()
  control_58:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P62, exception, "payload"
    .return ($P62)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("19_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["Undef"])
    .param pmc param_66
    .param pmc param_67 :slurpy :named
.annotate 'line', 543
    new $P65, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P65, control_64
    push_eh $P65
    .lex "self", self
    .lex "$node", param_66
    .lex "%options", param_67
.annotate 'line', 544

		.local pmc node
		node = find_lex '$node'
		.local pmc options
		options = find_lex '%options'
		.local string result
		$P0 = get_hll_global ['POST'], 'Ops'
		result = self.'uniquereg'('P')
		.tailcall $P0.'new'('result'=>result)
	
.annotate 'line', 543
    .return ()
  control_64:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P68, exception, "payload"
    .return ($P68)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("20_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["Integer"])
    .param pmc param_72
    .param pmc param_73 :slurpy :named
.annotate 'line', 563
    new $P71, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P71, control_70
    push_eh $P71
    .lex "self", self
    .lex "$node", param_72
    .lex "%options", param_73
.annotate 'line', 564

		.local pmc node
		node = find_lex '$node'
		.local pmc options
		options = find_lex '%options'
		$P0 = get_hll_global ['POST'], 'Ops'
		$P0 = $P0.'new'( 'result'=>node )
		$S0 = options['rtype']
		.tailcall self.'coerce'($P0, $S0)
	
.annotate 'line', 563
    .return ()
  control_70:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P74, exception, "payload"
    .return ($P74)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("21_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["Float"])
    .param pmc param_78
    .param pmc param_79 :slurpy :named
.annotate 'line', 576
    new $P77, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P77, control_76
    push_eh $P77
    .lex "self", self
    .lex "$node", param_78
    .lex "%options", param_79
.annotate 'line', 577

		.local pmc node
		node = find_lex '$node'
		.param pmc options
		options = find_lex '%options'
		$P0 = get_hll_global ['POST'], 'Ops'
		$P0 = $P0.'new'( 'result'=>node )
		$S0 = options['rtype']
		.tailcall self.'coerce'($P0, $S0)
	
.annotate 'line', 576
    .return ()
  control_76:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P80, exception, "payload"
    .return ($P80)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("22_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["String"])
    .param pmc param_84
    .param pmc param_85 :slurpy :named
.annotate 'line', 589
    new $P83, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P83, control_82
    push_eh $P83
    .lex "self", self
    .lex "$node", param_84
    .lex "%options", param_85
.annotate 'line', 590

		.local pmc node
		node = find_lex '$node'
		.local pmc options
		options = find_lex '%options'
		.local string value
		value = self.'escape'(node)
		$P0 = get_hll_global ['POST'], 'Ops'
		$P0 = $P0.'new'( 'result'=>value )
		$S0 = options['rtype']
		.tailcall self.'coerce'($P0, $S0)
	
.annotate 'line', 589
    .return ()
  control_82:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P86, exception, "payload"
    .return ($P86)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_vivipost"  :subid("23_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["String"])
    .param pmc param_90
    .param pmc param_91 :slurpy :named
.annotate 'line', 610
    new $P89, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P89, control_88
    push_eh $P89
    .lex "self", self
    .lex "$node", param_90
    .lex "%options", param_91
.annotate 'line', 611
    new $P92, "Undef"
    .lex "$result", $P92
.annotate 'line', 612
    new $P93, "Undef"
    .lex "$s", $P93
.annotate 'line', 611
    find_lex $P94, "self"
    $P95 = $P94."uniquereg"("P")
    store_lex "$result", $P95
.annotate 'line', 612
    find_lex $P96, "self"
    find_lex $P97, "$node"
    $P98 = $P96."escape"($P97)
    store_lex "$s", $P98
.annotate 'line', 613
    get_hll_global $P99, ["POST"], "Op"
    find_lex $P100, "$result"
    find_lex $P101, "$s"
    find_lex $P102, "$result"
    $P103 = $P99."new"($P100, $P101, "new" :named("pirop"), $P102 :named("result"))
.annotate 'line', 610
    .return ($P103)
  control_88:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_vivipost"  :subid("24_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,_)
    .param pmc param_108
    .param pmc param_109 :slurpy :named
.annotate 'line', 618
    new $P107, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P107, control_106
    push_eh $P107
    .lex "self", self
    .lex "$node", param_108
    .lex "%options", param_109
.annotate 'line', 619
    find_lex $P110, "self"
    find_lex $P111, "$node"
    find_lex $P112, "%options"
    $P113 = $P110."as_post"($P111, $P112 :flat)
.annotate 'line', 618
    .return ($P113)
  control_106:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, "payload"
    .return ($P114)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("25_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["PAST";"Node"])
    .param pmc param_118
    .param pmc param_119 :slurpy :named
.annotate 'line', 634
    new $P117, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P117, control_116
    push_eh $P117
    .lex "self", self
    .lex "$node", param_118
    .lex "%options", param_119
.annotate 'line', 635
    find_lex $P120, "self"
    find_lex $P121, "$node"
    find_lex $P122, "%options"
    $P123 = $P120."node_as_post"($P121, $P122)
.annotate 'line', 634
    .return ($P123)
  control_116:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P124, exception, "payload"
    .return ($P124)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "node_as_post"  :subid("26_1306440677.9234") :method :outer("11_1306440677.9234")
    .param pmc param_128
    .param pmc param_129
.annotate 'line', 639
    new $P127, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P127, control_126
    push_eh $P127
    .lex "self", self
    .lex "$node", param_128
    .lex "%options", param_129
.annotate 'line', 640

		.local pmc node
		node = find_lex '$node'
		.local pmc options
		options = find_lex '%options'

		.local pmc ops
		.local string rtype
		rtype = options['rtype']
		$P0 = node.'list'()
		$I0 = elements $P0
		$S0 = repeat 'v', $I0
		$S0 = concat $S0, rtype
		ops = self.'post_children'(node, 'signature'=>$S0)
		$P0 = ops[-1]
		ops.'result'($P0)
		.local pmc eh
		eh = node.'handlers'()
		unless eh, no_eh
		ops = self.'wrap_handlers'(ops, eh, 'rtype'=>rtype)
	  no_eh:
		.return (ops)
	
.annotate 'line', 639
    .return ()
  control_126:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P130, exception, "payload"
    .return ($P130)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("27_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["PAST";"Control"])
    .param pmc param_134
    .param pmc param_135 :slurpy :named
.annotate 'line', 670
    new $P133, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P133, control_132
    push_eh $P133
    .lex "self", self
    .lex "$node", param_134
    .lex "%options", param_135
.annotate 'line', 671

		.local pmc node
		node = find_lex '$node'
		.local pmc options
		options = find_lex '%options'

		.local pmc ops, children, ishandled, nothandled
		.local string handled
		$P0 = get_hll_global ['POST'], 'Label'
		$S0 = self.'unique'('handled_')
		ishandled = $P0.'new'('result'=>$S0)
		$S0 = self.'unique'('nothandled_')
		nothandled = $P0.'new'('result'=>$S0)
		$P0 = get_hll_global ['POST'], 'Ops'
		ops = $P0.'new'('node'=>node)
		.local string rtype
		rtype = options['rtype']
		$P0 = node.'list'()
		$I0 = elements $P0
		$S0 = repeat 'v', $I0
		$S0 = concat $S0, rtype
		ops.'push_pirop'('.local pmc exception')
		ops.'push_pirop'('.get_results (exception)')
		children = self.'post_children'(node, 'signature'=>$S0)
		ops.'push'(children)
		handled = self.'uniquereg'('I')
		ops.'push_pirop'('set', handled, 'exception["handled"]')
		ops.'push_pirop'('ne', handled, 1, nothandled)
		ops.'push'(ishandled)
		ops.'push_pirop'('return', 'exception')
		ops.'push'(nothandled)
		ops.'push_pirop'('rethrow', 'exception')
		.return (ops)
	
.annotate 'line', 670
    .return ()
  control_132:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P136, exception, "payload"
    .return ($P136)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "wrap_handlers"  :subid("28_1306440677.9234") :method :outer("11_1306440677.9234")
    .param pmc param_140
    .param pmc param_141
    .param pmc param_142 :slurpy :named
.annotate 'line', 707
    new $P139, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P139, control_138
    push_eh $P139
    .lex "self", self
    .lex "$child", param_140
    .lex "$ehs", param_141
    .lex "%options", param_142
.annotate 'line', 708

		.local pmc child
		child = find_lex '$child'
		.local pmc ehs
		ehs = find_lex '$ehs'
		.local pmc options
		options = find_lex '%options'

		.local string rtype
		rtype = options['rtype']

		.local pmc it, node, ops, pops, tail, skip
		$P0 = get_hll_global ['POST'], 'Ops'
		ops = $P0.'new'('node'=>node)
		$P0 = get_hll_global ['POST'], 'Ops'
		pops = $P0.'new'('node'=>node)
		$P0 = get_hll_global ['POST'], 'Ops'
		tail = $P0.'new'('node'=>node)
		$P0 = get_hll_global ['POST'], 'Label'
		$S0 = self.'unique'('skip_handler_')
		skip = $P0.'new'('result'=>$S0)

		it = iter ehs
	  handler_loop:
		unless it, handler_loop_done
		node = shift it

		.local pmc ehpir, label, controltypes, subpost
		.local string ehreg, type
		$P0 = get_hll_global ['POST'], 'Label'
		$S0 = self.'unique'('control_')
		label = $P0.'new'('result'=>$S0)

		subpost = find_dynamic_lex '$*SUB'

		ehreg = self.'uniquereg'('P')
		ops.'push_pirop'('new', ehreg, "'ExceptionHandler'")
		ops.'push_pirop'('set_label', ehreg, label)
		controltypes = get_global '%controltypes'
		type = node.'handle_types'()
		unless type, handle_types_done
		type = controltypes[type]
		unless type, handle_types_done
		$P0 = split ',', type
		ops.'push_pirop'('callmethod', '"handle_types"', ehreg, $P0 :flat)
		subpost.'add_directive'('.include "except_types.pasm"')
	  handle_types_done:
		type = node.'handle_types_except'()
		unless type, handle_types_except_done
		type = controltypes[type]
		unless type, handle_types_except_done
		$P0 = split ',', type
		ops.'push_pirop'('callmethod', '"handle_types_except"', ehreg, $P0 :flat)
		subpost.'add_directive'('.include "except_types.pasm"')
	  handle_types_except_done:
		ops.'push_pirop'('push_eh', ehreg)

		# Add one pop_eh for every handler we push_eh
		pops.'push_pirop'('pop_eh')

		# Push the handler itself
		tail.'push'(label)
		ehpir = self.'as_post'(node, 'rtype'=>rtype)
		tail.'push'(ehpir)

		goto handler_loop
	  handler_loop_done:

		ops.'push'(child)


		ops.'push'(pops)
		ops.'push_pirop'('goto', skip)
		ops.'push'(tail)
		ops.'push'(skip)

		.return (ops)
	
.annotate 'line', 707
    .return ()
  control_138:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P143, exception, "payload"
    .return ($P143)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("29_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["PAST";"Block"])
    .param pmc param_147
    .param pmc param_148 :slurpy :named
.annotate 'line', 793
    new $P146, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P146, control_145
    push_eh $P146
    .lex "self", self
    .lex "$node", param_147
    .lex "%options", param_148
.annotate 'line', 794

		.local pmc node
		node = find_lex '$node'
		.local pmc options
		options = find_lex '%options'

		##  add current block node to @*BLOCKPAST
		.local pmc blockpast
		blockpast = find_dynamic_lex '@*BLOCKPAST'
		unshift blockpast, node

		.local string name, pirflags, blocktype
		.local pmc nsentry, subid, ns, hll, multi, loadlibs
		name = node.'name'()
		pirflags = node.'pirflags'()
		blocktype = node.'blocktype'()
		nsentry = node.'nsentry'()
		subid = node.'subid'()
		ns = node.'namespace'()
		hll = node.'hll'()
		multi = node.'multi'()
		loadlibs = node.'loadlibs'()

		##  handle nsentry attribute
		$I0 = defined nsentry
		unless $I0 goto nsentry_done
		unless nsentry goto nsentry_anon
		$S0 = self.'escape'(nsentry)
		pirflags = concat pirflags, ' :nsentry('
		pirflags = concat pirflags, $S0
		pirflags = concat pirflags, ')'
		goto nsentry_done
	  nsentry_anon:
		pirflags = concat pirflags, ' :anon'
	  nsentry_done:

		##  handle anonymous blocks
		if name goto have_name
		name = self.'unique'('_block')
		if ns goto have_name
		if nsentry goto have_name
		pirflags = concat pirflags, ' :anon'
	  have_name:

		##  create a POST::Sub node for this block
		.local pmc bpost
		$P0 = get_hll_global ['POST'], 'Sub'
		bpost = $P0.'new'('node'=>node, 'name'=>name, 'blocktype'=>blocktype, 'namespace'=>ns, 'hll'=>hll, 'subid'=>subid, 'multi'=>multi, 'loadlibs'=>loadlibs)
		unless pirflags goto pirflags_done
		bpost.'pirflags'(pirflags)
	  pirflags_done:

		##  pir-encode name and namespace
		.local string blockreg, blockref
		blockreg = self.'uniquereg'('P')
		blockref = concat ".const 'Sub' ", blockreg
		blockref = concat blockref, ' = '
		$P0 = bpost.'subid'()
		$S0 = self.'escape'($P0)
		blockref = concat blockref, $S0

		##  determine the outer POST::Sub for the new one
		.local pmc outerpost
		outerpost = find_dynamic_lex '$*SUB'
		.lex '$*SUB', bpost

		.local int islexical
		islexical = node.'lexical'()
		unless islexical goto outer_done
		bpost.'outer'(outerpost)

		##  add block setup code (cpost) to outer block if needed
		if null outerpost goto outer_done
		.local pmc cpost
		$P0 = get_hll_global ['POST'], 'Ops'
		cpost = $P0.'new'( 'result'=>blockreg )
		cpost.'push_pirop'(blockref)
		cpost.'push_pirop'('capture_lex', blockreg)
		outerpost.'unshift'(cpost)
	  outer_done:

		##  merge the node's symtable with the master
		.local pmc outersym, symtable
		outersym = getattribute self, '%!symtable'
		symtable = outersym
		##  if the Block doesn't have a symtable, re-use the existing one
		$P0 = node.'symtable'()
		unless $P0 goto have_symtable
		##  if the Block has a default ('') entry, use the Block's symtable as-is
		symtable = $P0
		$I0 = defined symtable['']
		if $I0 goto have_symtable
		##  merge the Block's symtable with outersym
		symtable = clone symtable
	  symtable_merge:
		.local pmc it
		it = iter outersym
	  symtable_merge_loop:
		unless it goto have_symtable
		$S0 = shift it
		$I0 = exists symtable[$S0]
		if $I0 goto symtable_merge_loop
		$P0 = it[$S0]
		symtable[$S0] = $P0
		goto symtable_merge_loop
	  have_symtable:
		setattribute self, '%!symtable', symtable

		.local pmc compiler
		compiler = node.'compiler'()
		if compiler goto children_compiler

		##  control exception handler
		.local pmc ctrlpast, ctrllabel
		ctrlpast = node.'control'()
		unless ctrlpast goto children_past
		$P0 = get_hll_global ['POST'], 'Label'
		$S0 = self.'unique'('control_')
		ctrllabel = $P0.'new'('result'=>$S0)
		$S0 = self.'uniquereg'('P')
		bpost.'push_pirop'('new', $S0, "['ExceptionHandler']", '.CONTROL_RETURN')
		bpost.'push_pirop'('set_label', $S0, ctrllabel)
		bpost.'push_pirop'('push_eh', $S0)
		bpost.'add_directive'('.include "except_types.pasm"')

	  children_past:
		##  all children but last are void context, last returns anything
		$P0 = node.'list'()
		$I0 = elements $P0
		$S0 = repeat 'v', $I0
		$S0 = concat $S0, '*'
		##  convert children to post
		.local pmc ops, retval
		ops = self.'post_children'(node, 'signature'=>$S0)
		##  wrap the child with appropriate exception handlers, if any
		.local pmc eh
		eh = node.'handlers'()
		unless eh, no_eh
		$S0 = options['rtype']
		retval = ops[-1]
		ops = self.'wrap_handlers'(ops, eh, 'rtype'=>$S0)
		goto had_eh
	  no_eh:
		##  result of last child is return from block
		retval = ops[-1]
	  had_eh:
		bpost.'push'(ops)
		bpost.'push_pirop'('return', retval)

		unless ctrlpast goto sub_done
		bpost.'push'(ctrllabel)
		bpost.'push_pirop'('.local pmc exception')
		bpost.'push_pirop'('.get_results (exception)')
		$I0 = isa ctrlpast, ['PAST';'Node']
		if $I0 goto control_past
		if ctrlpast == 'return_pir' goto control_return
		self.'panic'("Unrecognized control handler '", ctrlpast, "'")
	  control_return:
		##  handle 'return' exceptions
		$S0 = self.'uniquereg'('P')
		bpost.'push_pirop'('getattribute', $S0, 'exception', '"payload"')
		bpost.'push_pirop'('return', $S0)
		goto sub_done
	  control_past:
		$P0 = self.'as_post'(ctrlpast, 'rtype'=>'*')
		bpost.'push'($P0)
		goto sub_done

	  children_compiler:
		##  set the compiler to use for the POST::Sub node, pass on
		##  and compiler arguments and add this block's child to it.
		bpost.'compiler'(compiler)
		$P0 = node.'compiler_args'()
		bpost.'compiler_args'($P0)
		$P0 = node[0]
		bpost.'push'($P0)

	  sub_done:
		##  generate any loadinit code for the sub
		$I0 = exists node['loadinit']
		unless $I0 goto loadinit_done
		.local pmc lisub
		$P0 = get_hll_global ['POST'], 'Sub'
		lisub = $P0.'new'('outer'=>bpost, 'pirflags'=>':load :init')
		lisub.'push_pirop'(blockref)
		lisub.'push_pirop'('.local pmc', 'block')
		lisub.'push_pirop'('set', 'block', blockreg)
		.local pmc lipast, lipost
		lipast = node.'loadinit'()
		lipost = self.'as_post'(lipast, 'rtype'=>'v')
		lisub.'push'(lipost)
		bpost['loadinit'] = lisub
	  loadinit_done:

		##  restore previous outer scope and symtable
		setattribute self, '%!symtable', outersym

		##  return block or block result
		.local string rtype, result
		rtype = options['rtype']

		if blocktype == 'immediate' goto block_immediate
		if rtype == 'v' goto block_done
		$P0 = get_hll_global ['POST'], 'Ops'
		bpost = $P0.'new'( bpost, 'node'=>node, 'result'=>blockreg)
		bpost.'push_pirop'( blockref, 'result'=>blockreg )
		unless islexical goto block_done
		$I0 = node.'closure'()
		if $I0 goto block_closure
		bpost.'push_pirop'('capture_lex', blockreg)
		goto block_done

	  block_closure:
		##  return a reference to a clone of the block with captured outer context
		result = self.'uniquereg'('P')
		bpost.'push_pirop'('newclosure', result, blockreg)
		bpost.'result'(result)
		goto block_done

	  block_immediate:
		.local pmc arglist
		arglist = options['arglist']
		unless null arglist goto have_arglist
		arglist = new 'ResizablePMCArray'
	  have_arglist:
		result = self.'uniquereg'(rtype)
		$P0 = get_hll_global ['POST'], 'Ops'
		bpost = $P0.'new'(bpost, 'node'=>node, 'result'=>result)
		bpost.'push_pirop'(blockref)
		unless islexical goto block_immediate_capture_skip
		bpost.'push_pirop'('capture_lex', blockreg)
	  block_immediate_capture_skip:
		bpost.'push_pirop'('call', blockreg, arglist :flat, 'result'=>result)

	  block_done:
		##  remove current block from @*BLOCKPAST
		$P99 = shift blockpast
		.return (bpost)
	
.annotate 'line', 793
    .return ()
  control_145:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P149, exception, "payload"
    .return ($P149)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("30_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["PAST";"Op"])
    .param pmc param_153
    .param pmc param_154 :slurpy :named
.annotate 'line', 1043
    new $P152, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P152, control_151
    push_eh $P152
    .lex "self", self
    .lex "$node", param_153
    .lex "%options", param_154
.annotate 'line', 1044

		.local pmc node
		node = find_lex '$node'
		.local pmc options
		options = find_lex '%options'

		##  see if we set first child's lvalue
		$I0 = node.'lvalue'()
		unless $I0 goto have_lvalue
		$P0 = node[0]
		if null $P0 goto have_lvalue
		$I1 = exists $P0['lvalue']
		if $I1 goto have_lvalue
		$P0.'lvalue'($I0)
	  have_lvalue:

		.local string pasttype
		pasttype = node.'pasttype'()
		unless pasttype goto post_pirop
		$P0 = find_method self, pasttype
		.tailcall self.$P0(node, options :flat :named)

	  post_pirop:
		.local pmc pirop
		pirop = node.'pirop'()
		unless pirop goto post_inline
		.tailcall self.'pirop'(node, options :flat :named)

	  post_inline:
		.local pmc inline
		inline = node.'inline'()
		unless inline goto post_call
		.tailcall self.'inline'(node, options :flat :named)

	  post_call:
		.tailcall self.'call'(node, options :flat :named)
	
.annotate 'line', 1043
    .return ()
  control_151:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P155, exception, "payload"
    .return ($P155)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "pirop"  :subid("31_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["PAST";"Op"])
    .param pmc param_159
    .param pmc param_160 :slurpy :named
.annotate 'line', 1088
    new $P158, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P158, control_157
    push_eh $P158
    .lex "self", self
    .lex "$node", param_159
    .lex "%options", param_160
.annotate 'line', 1089

		.local pmc node
		node = find_lex '$node'
		.local pmc options
		options = find_lex '%options'

		.local string pirop, signature
		pirop = node.'pirop'()
		##  see if pirop is of form "pirop signature"
		$I0 = index pirop, ' '
		if $I0 < 0 goto pirop_0
		$I1 = $I0 + 1
		signature = substr pirop, $I1
		pirop = substr pirop, 0, $I0
		goto have_signature
	  pirop_0:
		##  see if pirop is of form "pirop__signature"
		$I0 = index pirop, '__'
		if $I0 < 0 goto pirop_1
		$I1 = $I0 + 2
		signature = substr pirop, $I1
		pirop = substr pirop, 0, $I0
		goto have_signature
	  pirop_1:
		$P0 = get_global '%piropsig'
		signature = $P0[pirop]
		if signature goto have_signature
		signature = 'vP'
	  have_signature:

		.local pmc ops, posargs
		(ops, posargs) = self.'post_children'(node, 'signature'=>signature)

		.local pmc arglist
		arglist = ops.'list'()

		$S0 = substr signature, 0, 1
		if $S0 == 'v' goto pirop_void
		$I0 = index '0123456789', $S0
		if $I0 < 0 goto pirop_reg
		$S0 = arglist[$I0]
		ops.'result'($S0)
		goto pirop_void
	  pirop_reg:
		.local string result
		result = self.'uniquereg'($S0)
		ops.'result'(result)
		ops.'push_pirop'(pirop, result, posargs :flat)
		.return (ops)
	  pirop_void:
		ops.'push_pirop'(pirop, posargs :flat)
		.return (ops)
	
.annotate 'line', 1088
    .return ()
  control_157:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P161, exception, "payload"
    .return ($P161)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "call"  :subid("32_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["PAST";"Op"])
    .param pmc param_165
    .param pmc param_166 :slurpy :named
.annotate 'line', 1149
    new $P164, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P164, control_163
    push_eh $P164
    .lex "self", self
    .lex "$node", param_165
    .lex "%options", param_166
.annotate 'line', 1150

		.local pmc node
		node = find_lex '$node'
		.local pmc options
		options = find_lex '%options'
		.local string pasttype
		pasttype = node.'pasttype'()
		if pasttype goto have_pasttype
		pasttype = 'call'
	  have_pasttype:

		.local string signature
		signature = 'v:'
		## for callmethod, the invocant (child) must be a PMC
		if pasttype != 'callmethod' goto have_signature
		signature = 'vP:'
	  have_signature:

		.local pmc name, ops, posargs, namedargs
		name = node.'name'()
		if name goto call_by_name
		##  our first child is the thing to be invoked, so make sure it's a PMC
		signature = replace signature, 1, 0, 'P'
		(ops, posargs, namedargs) = self.'post_children'(node, 'signature'=>signature)
		goto children_done
	  call_by_name:
		(ops, posargs, namedargs) = self.'post_children'(node, 'signature'=>signature)
		$I0 = isa name, ['PAST';'Node']
		if $I0 goto call_by_name_past
		$S0 = self.'escape'(name)
		unshift posargs, $S0
		goto children_done
	  call_by_name_past:
		.local pmc name_post
		name_post = self.'as_post'(name, 'rtype'=>'s')
		name_post = self.'coerce'(name_post, 's')
		ops.'push'(name_post)
		unshift posargs, name_post
	  children_done:

		##  generate the call itself
		.local string result, rtype
		rtype = options['rtype']
		result = self.'uniquereg'(rtype)
		ops.'push_pirop'(pasttype, posargs :flat, namedargs :flat, 'result'=>result)
		ops.'result'(result)
		.return (ops)
	
.annotate 'line', 1149
    .return ()
  control_163:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P167, exception, "payload"
    .return ($P167)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "callmethod"  :subid("33_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["PAST";"Op"])
    .param pmc param_171
    .param pmc param_172 :slurpy :named
.annotate 'line', 1205
    new $P170, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P170, control_169
    push_eh $P170
    .lex "self", self
    .lex "$node", param_171
    .lex "%options", param_172
.annotate 'line', 1206

		.local pmc node
		node = find_lex '$node'
		.local pmc options
		options = find_lex '%options'
		.tailcall self.'call'(node, options :flat :named)
	
.annotate 'line', 1205
    .return ()
  control_169:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P173, exception, "payload"
    .return ($P173)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "if"  :subid("34_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["PAST";"Op"])
    .param pmc param_177
    .param pmc param_178 :slurpy :named
.annotate 'line', 1221
    new $P176, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P176, control_175
    push_eh $P176
    .lex "self", self
    .lex "$node", param_177
    .lex "%options", param_178
.annotate 'line', 1222

		.local pmc node
		node = find_lex '$node'
		.local pmc options
		options = find_lex '%options'

		.local pmc opsclass, ops
		opsclass = get_hll_global ['POST'], 'Ops'
		ops = opsclass.'new'('node'=>node)

		.local string rtype, result
		rtype = options['rtype']
		result = self.'uniquereg'(rtype)
		ops.'result'(result)

		.local string pasttype
		pasttype = node.'pasttype'()

		.local pmc exprpast, thenpast, elsepast, childpast
		.local pmc exprpost, thenpost, elsepost, childpost
		exprpast = node[0]
		thenpast = node[1]
		elsepast = node[2]

		.local pmc thenlabel, endlabel
		$P0 = get_hll_global ['POST'], 'Label'
		$S0 = concat pasttype, '_'
		$S0 = self.'unique'($S0)
		thenlabel = $P0.'new'('result'=>$S0)
		$S0 = concat $S0, '_end'
		endlabel = $P0.'new'('result'=>$S0)

		.local string exprrtype, childrtype
		exprrtype = 'r'
		if rtype != 'v' goto have_exprrtype
		exprrtype = '*'
	  have_exprrtype:
		childrtype = rtype
		$I0 = index '*:', rtype
		if $I0 < 0 goto have_childrtype
		childrtype = 'P'
	  have_childrtype:

		exprpost = self.'as_post'(exprpast, 'rtype'=>exprrtype)

		.local pmc jmpstack
		jmpstack = new 'ResizableIntegerArray'
		childpast = thenpast
		local_branch jmpstack, make_childpost
		thenpost = childpost
		childpast = elsepast
		local_branch jmpstack, make_childpost
		elsepost = childpost

		if null elsepost goto no_elsepost

		ops.'push'(exprpost)
		ops.'push_pirop'(pasttype, exprpost, thenlabel)
		if null elsepost goto else_done
		ops.'push'(elsepost)
	  else_done:
		ops.'push_pirop'('goto', endlabel)
		ops.'push'(thenlabel)
		if null thenpost goto then_done
		ops.'push'(thenpost)
	  then_done:
		ops.'push'(endlabel)
		.return (ops)

	  no_elsepost:
		$S0 = 'if'
		unless pasttype == $S0 goto no_elsepost_1
		$S0 = 'unless'
	  no_elsepost_1:
		ops.'push'(exprpost)
		ops.'push_pirop'($S0, exprpost, endlabel)
		if null thenpost goto no_elsepost_2
		ops.'push'(thenpost)
	  no_elsepost_2:
		ops.'push'(endlabel)
		.return (ops)

	  make_childpost:
		null childpost
		$I0 = defined childpast
		unless $I0 goto no_childpast
		.local pmc arglist
		arglist = new 'ResizablePMCArray'
		$I0 = childpast.'arity'()
		unless $I0 > 0 goto have_arglist
		push arglist, exprpost
	  have_arglist:
		childpost = self.'as_post'(childpast, 'rtype'=>childrtype, 'arglist'=>arglist)
		goto childpost_coerce
	  no_childpast:
		if rtype == 'v' goto ret_childpost
		childpost = opsclass.'new'('result'=>exprpost)
	  childpost_coerce:
		unless result goto ret_childpost
		childpost = self.'coerce'(childpost, result)
	  ret_childpost:
		local_return jmpstack
	
.annotate 'line', 1221
    .return ()
  control_175:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P179, exception, "payload"
    .return ($P179)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "unless"  :subid("35_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["PAST";"Op"])
    .param pmc param_183
    .param pmc param_184 :slurpy :named
.annotate 'line', 1327
    new $P182, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P182, control_181
    push_eh $P182
    .lex "self", self
    .lex "$node", param_183
    .lex "%options", param_184
.annotate 'line', 1328

		.local pmc node
		node = find_lex '$node'
		.local pmc options
		options = find_lex '%options'
		.tailcall self.'if'(node, options :flat :named)
	
.annotate 'line', 1327
    .return ()
  control_181:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P185, exception, "payload"
    .return ($P185)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "loop_gen"  :subid("36_1306440677.9234") :method :outer("11_1306440677.9234")
    .param pmc param_189 :slurpy :named
.annotate 'line', 1341
    new $P188, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P188, control_187
    push_eh $P188
    .lex "self", self
    .lex "%options", param_189
.annotate 'line', 1342

		.local pmc options
		options = find_lex '%options'

		.local pmc testlabel, prelabel, redolabel, nextlabel, donelabel, handlabel
		$P0 = get_hll_global ['POST'], 'Label'
		.local string loopname
		loopname = self.'unique'('loop')
		$S0 = concat loopname, '_test'
		testlabel = $P0.'new'('result'=>$S0)
		$S0 = concat loopname, '_redo'
		redolabel = $P0.'new'('result'=>$S0)
		$S0 = concat loopname, '_next'
		nextlabel = $P0.'new'('result'=>$S0)
		$S0 = concat loopname, '_done'
		donelabel = $P0.'new'('result'=>$S0)
		$S0 = concat loopname, '_handler'
		handlabel = $P0.'new'('result'=>$S0)

		.local pmc testpost, prepost, bodypost, nextpost
		.local string testop
		.local int bodyfirst
		testop = options['testop']
		testpost = options['test']
		prepost  = options['pre']
		bodypost = options['body']
		nextpost = options['next']
		bodyfirst = options['bodyfirst']

		if testop goto have_testop
		testop = 'unless'
	  have_testop:

		.local pmc ops
		$P0 = get_hll_global ['POST'], 'Ops'
		ops = $P0.'new'()

		$P0 = find_dynamic_lex '$*SUB'
		$P0.'add_directive'('.include "except_types.pasm"')

		.local string handreg
		handreg = self.'uniquereg'('P')
		ops.'push_pirop'('new', handreg, "'ExceptionHandler'")
		ops.'push_pirop'('set_label', handreg, handlabel)
		ops.'push_pirop'('callmethod', '"handle_types"', handreg, '.CONTROL_LOOP_NEXT', '.CONTROL_LOOP_REDO', '.CONTROL_LOOP_LAST')
		ops.'push_pirop'('push_eh', handreg)

		unless bodyfirst goto bodyfirst_done
		ops.'push_pirop'('goto', redolabel)
	  bodyfirst_done:
		ops.'push'(testlabel)
		if null testpost goto test_done
		ops.'push'(testpost)
		ops.'push_pirop'(testop, testpost, donelabel)
	  test_done:
		if null prepost goto pre_done
		ops.'push'(prepost)
	  pre_done:
		ops.'push'(redolabel)
		if null bodypost goto body_done
		ops.'push'(bodypost)
	  body_done:
		ops.'push'(nextlabel)
		if null nextpost goto next_done
		ops.'push'(nextpost)
	  next_done:
		ops.'push_pirop'('goto', testlabel)
		ops.'push'(handlabel)
		ops.'push_pirop'('.local pmc exception')
		ops.'push_pirop'('.get_results (exception)')
		$S0 = self.'uniquereg'('P')
		ops.'push_pirop'('getattribute', $S0, 'exception', "'type'")
		ops.'push_pirop'('eq', $S0, '.CONTROL_LOOP_NEXT', nextlabel)
		ops.'push_pirop'('eq', $S0, '.CONTROL_LOOP_REDO', redolabel)
		ops.'push'(donelabel)
		ops.'push_pirop'('pop_eh')
		.return (ops)
	
.annotate 'line', 1341
    .return ()
  control_187:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P190, exception, "payload"
    .return ($P190)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "while"  :subid("37_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["PAST";"Op"])
    .param pmc param_194
    .param pmc param_195 :slurpy :named
.annotate 'line', 1429
    new $P193, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P193, control_192
    push_eh $P193
    .lex "self", self
    .lex "$node", param_194
    .lex "%options", param_195
.annotate 'line', 1430

		.local pmc node
		node = find_lex '$node'
		.local pmc options
		options = find_lex '%options'
		.local pmc exprpast, bodypast, nextpast
		exprpast = node[0]
		bodypast = node[1]
		nextpast = node[2]

		.local pmc exprpost, bodypost, nextpost
		exprpost = self.'as_post'(exprpast, 'rtype'=>'r')

		.local pmc arglist
		arglist = new 'ResizablePMCArray'
		$I0 = bodypast.'arity'()
		if $I0 < 1 goto have_arglist
		push arglist, exprpost
	  have_arglist:
		bodypost = self.'as_post'(bodypast, 'rtype'=>'v', 'arglist'=>arglist)

		null nextpost
		if null nextpast goto have_nextpost
		nextpost = self.'as_post'(nextpast, 'rtype'=>'v')
	  have_nextpost:

		.local string testop
		testop = options['testop']
		.local int bodyfirst
		bodyfirst = options['bodyfirst']

		.local pmc ops
		ops = self.'loop_gen'('testop'=>testop, 'test'=>exprpost, 'body'=>bodypost, 'bodyfirst'=>bodyfirst, 'next'=>nextpost)
		ops.'result'(exprpost)
		ops.'node'(node)
		.return (ops)
	
.annotate 'line', 1429
    .return ()
  control_192:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P196, exception, "payload"
    .return ($P196)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "until"  :subid("38_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["PAST";"Op"])
    .param pmc param_200
    .param pmc param_201 :slurpy :named
.annotate 'line', 1469
    new $P199, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P199, control_198
    push_eh $P199
    .lex "self", self
    .lex "$node", param_200
    .lex "%options", param_201
.annotate 'line', 1470

		.local pmc node
		node = find_lex '$node'
		.local pmc options
		options = find_lex '%options'
		.tailcall self.'while'(node, options :flat :named, 'testop'=>'if')
	
.annotate 'line', 1469
    .return ()
  control_198:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P202, exception, "payload"
    .return ($P202)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "repeat_while"  :subid("39_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["PAST";"Op"])
    .param pmc param_206
    .param pmc param_207 :slurpy :named
.annotate 'line', 1479
    new $P205, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P205, control_204
    push_eh $P205
    .lex "self", self
    .lex "$node", param_206
    .lex "%options", param_207
.annotate 'line', 1480

		.local pmc node
		node = find_lex '$node'
		.local pmc options
		options = find_lex '%options'
		.tailcall self.'while'(node, options :flat :named, 'bodyfirst'=>1)
	
.annotate 'line', 1479
    .return ()
  control_204:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P208, exception, "payload"
    .return ($P208)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "repeat_until"  :subid("40_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["PAST";"Op"])
    .param pmc param_212
    .param pmc param_213 :slurpy :named
.annotate 'line', 1489
    new $P211, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P211, control_210
    push_eh $P211
    .lex "self", self
    .lex "$node", param_212
    .lex "%options", param_213
.annotate 'line', 1490

		.local pmc node
		node = find_lex '$node'
		.local pmc options
		options = find_lex '%options'
		.tailcall self.'while'(node, options :flat :named, 'testop'=>'if', 'bodyfirst'=>1)
	
.annotate 'line', 1489
    .return ()
  control_210:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P214, exception, "payload"
    .return ($P214)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "for"  :subid("41_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["PAST";"Op"])
    .param pmc param_218
    .param pmc param_219 :slurpy :named
.annotate 'line', 1504
    new $P217, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P217, control_216
    push_eh $P217
    .lex "self", self
    .lex "$node", param_218
    .lex "%options", param_219
.annotate 'line', 1505

		.local pmc node
		node = find_lex '$node'
		.local pmc options
		options = find_lex '%options'

		.local pmc ops, prepost, testpost
		$P0 = get_hll_global ['POST'], 'Ops'
		ops      = $P0.'new'('node'=>node)
		prepost  = $P0.'new'()
		$S0      = self.'uniquereg'('P')
		testpost = $P0.'new'('result'=>$S0)

		.local pmc collpast, bodypast
		collpast = node[0]
		bodypast = node[1]

		.local pmc collpost
		collpost = self.'as_post'(collpast, 'rtype'=>'P')
		ops.'push'(collpost)

		##  don't try to iterate undefined values
		.local pmc undeflabel
		$P0 = get_hll_global ['POST'], 'Label'
		undeflabel = $P0.'new'('name'=>'for_undef_')
		$S0 = self.'uniquereg'('I')
		ops.'push_pirop'('defined', $S0, collpost)
		ops.'push_pirop'('unless', $S0, undeflabel)

		ops.'push_pirop'('iter', testpost, collpost)

		##  determine the arity of the loop.  We check arity of the 'for'
		##  node itself, and if not set we use the arity of the body.
		.local int arity
		arity = 1
		$P0 = node.'arity'()
		$I0 = defined $P0
		unless $I0 goto arity_child
		arity = $P0
		goto have_arity
	  arity_child:
		$P0 = bodypast.'arity'()
		$I0 = defined $P0
		unless $I0 goto have_arity
		arity = $P0
	  have_arity:

		##  build the argument list to pass to the body
		.local pmc arglist
		arglist = new 'ResizablePMCArray'
	  arity_loop:
		.local string nextarg
		nextarg = self.'uniquereg'('P')
		prepost.'push_pirop'('shift', nextarg, testpost)
		if arity < 1 goto arity_end
		push arglist, nextarg
		dec arity
		if arity > 0 goto arity_loop
	  arity_end:

		##  now build the body itself
		.local pmc bodypost
		bodypost = self.'as_post'(bodypast, 'rtype'=>'v', 'arglist'=>arglist)

		##  generate the loop and return
		$P0 = self.'loop_gen'('test'=>testpost, 'pre'=>prepost, 'body'=>bodypost)
		ops.'push'($P0)
		ops.'push'(undeflabel)
		ops.'result'(testpost)
		.return (ops)
	
.annotate 'line', 1504
    .return ()
  control_216:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P220, exception, "payload"
    .return ($P220)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "list"  :subid("42_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["PAST";"Op"])
    .param pmc param_224
    .param pmc param_225 :slurpy :named
.annotate 'line', 1584
    new $P223, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P223, control_222
    push_eh $P223
    .lex "self", self
    .lex "$node", param_224
    .lex "%options", param_225
.annotate 'line', 1585

		.local pmc node
		node = find_lex '$node'
		.local pmc options
		options = find_lex '%options'

		.local pmc ops, posargs
		(ops, posargs) = self.'post_children'(node, 'signature'=>'v*')

		.local pmc returns
		returns = node.'returns'()
		if returns goto have_returns
		returns = box 'ResizablePMCArray'
	  have_returns:

		.local pmc listpost, it
		listpost = self.'as_vivipost'(returns, 'rtype'=>'P')
		ops.'result'(listpost)
		ops.'push'(listpost)
		it = iter posargs
	  iter_loop:
		unless it goto iter_end
		$S0 = shift it
		ops.'push_pirop'('push', listpost, $S0)
		goto iter_loop
	  iter_end:
		.return (ops)
	
.annotate 'line', 1584
    .return ()
  control_222:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P226, exception, "payload"
    .return ($P226)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "stmts"  :subid("43_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["PAST";"Op"])
    .param pmc param_230
    .param pmc param_231 :slurpy :named
.annotate 'line', 1620
    new $P229, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P229, control_228
    push_eh $P229
    .lex "self", self
    .lex "$node", param_230
    .lex "%options", param_231
.annotate 'line', 1621
    find_lex $P232, "self"
    find_lex $P233, "$node"
    find_lex $P234, "%options"
    $P235 = $P232."node_as_post"($P233, $P234)
.annotate 'line', 1620
    .return ($P235)
  control_228:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P236, exception, "payload"
    .return ($P236)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "null"  :subid("44_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["PAST";"Op"])
    .param pmc param_240
    .param pmc param_241 :slurpy :named
.annotate 'line', 1631
    new $P239, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P239, control_238
    push_eh $P239
    .lex "self", self
    .lex "$node", param_240
    .lex "%options", param_241
.annotate 'line', 1632

		.local pmc node
		node = find_lex '$node'
		.local pmc options
		options = find_lex '%options'
		$P0 = get_hll_global ['POST'], 'Ops'
		.tailcall $P0.'new'('node'=>node)
	
.annotate 'line', 1631
    .return ()
  control_238:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P242, exception, "payload"
    .return ($P242)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "return"  :subid("45_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["PAST";"Op"])
    .param pmc param_246
    .param pmc param_247 :slurpy :named
.annotate 'line', 1647
    new $P245, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P245, control_244
    push_eh $P245
    .lex "self", self
    .lex "$node", param_246
    .lex "%options", param_247
.annotate 'line', 1648

		.local pmc node
		node = find_lex '$node'
		.local pmc options
		options = find_lex '%options'

		.local pmc ops
		$P0 = get_hll_global ['POST'], 'Ops'
		ops = $P0.'new'('node'=>node)

		.local string exreg, extype
		exreg = self.'uniquereg'('P')
		extype = concat exreg, "['type']"
		ops.'push_pirop'('new', exreg, '"Exception"')
		ops.'push_pirop'('set', extype, '.CONTROL_RETURN')
		$P0 = find_dynamic_lex '$*SUB'
		$P0.'add_directive'('.include "except_types.pasm"')

		.local pmc cpast, cpost
		cpast = node[0]
		unless cpast goto cpast_done
		cpost = self.'as_post'(cpast, 'rtype'=>'P')
		cpost = self.'coerce'(cpost, 'P')
		ops.'push'(cpost)
		ops.'push_pirop'('setattribute', exreg, "'payload'", cpost)
	  cpast_done:
		ops.'push_pirop'('throw', exreg)
		.return (ops)
	
.annotate 'line', 1647
    .return ()
  control_244:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P248, exception, "payload"
    .return ($P248)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "try"  :subid("46_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["PAST";"Op"])
    .param pmc param_252
    .param pmc param_253 :slurpy :named
.annotate 'line', 1687
    new $P251, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P251, control_250
    push_eh $P251
    .lex "self", self
    .lex "$node", param_252
    .lex "%options", param_253
.annotate 'line', 1688

		.local pmc node
		node = find_lex '$node'
		.local pmc options
		options = find_lex '%options'

		.local pmc ops
		$P0 = get_hll_global ['POST'], 'Ops'
		ops = $P0.'new'('node'=>node)

		.local pmc catchlabel, endlabel
		$P0 = get_hll_global ['POST'], 'Label'
		$S0 = self.'unique'('catch_')
		catchlabel = $P0.'new'('result'=>$S0)
		$S0 = concat $S0, '_end'
		endlabel = $P0.'new'('result'=>$S0)

		.local string rtype
		rtype = options['rtype']

		.local pmc trypast, trypost
		trypast = node[0]
		trypost = self.'as_post'(trypast, 'rtype'=>rtype)
		ops.'push_pirop'('push_eh', catchlabel)
		ops.'push'(trypost)
		ops.'push_pirop'('pop_eh')
		.local pmc elsepast, elsepost
		elsepast = node[2]
		if null elsepast goto else_done
		elsepost = self.'as_post'(elsepast, 'rtype'=>'v')
		ops.'push'(elsepost)
	  else_done:
		ops.'push_pirop'('goto', endlabel)
		ops.'push'(catchlabel)
		.local pmc catchpast, catchpost
		catchpast = node[1]
		if null catchpast goto catch_done
		catchpost = self.'as_post'(catchpast, 'rtype'=>'v')
		ops.'push'(catchpost)
		ops.'push_pirop'('pop_eh')         # FIXME: should be before catchpost
	  catch_done:
		ops.'push'(endlabel)
		ops.'result'(trypost)
		.return (ops)
	
.annotate 'line', 1687
    .return ()
  control_250:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P254, exception, "payload"
    .return ($P254)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "chain"  :subid("47_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["PAST";"Op"])
    .param pmc param_258
    .param pmc param_259 :slurpy :named
.annotate 'line', 1744
    new $P257, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P257, control_256
    push_eh $P257
    .lex "self", self
    .lex "$node", param_258
    .lex "%options", param_259
.annotate 'line', 1745

		.local pmc node
		node = find_lex '$node'
		.local pmc options
		options = find_lex '%options'
		.local pmc clist, cpast

		##  first, we build up the list of nodes in the chain
		clist = new 'ResizablePMCArray'
		cpast = node
	  chain_loop:
		$I0 = isa cpast, ['PAST';'Op']
		if $I0 == 0 goto chain_end
		.local string pasttype
		pasttype = cpast.'pasttype'()
		if pasttype != 'chain' goto chain_end
		push clist, cpast
		cpast = cpast[0]
		goto chain_loop
	  chain_end:

		.local pmc ops, endlabel
		$P0 = get_hll_global ['POST'], 'Ops'
		ops = $P0.'new'('node'=>node)
		$S0 = self.'unique'('$P')
		ops.'result'($S0)
		$P0 = get_hll_global ['POST'], 'Label'
		endlabel = $P0.'new'('name'=>'chain_end_')

		.local pmc apast, apost
		cpast = pop clist
		apast = cpast[0]
		apost = self.'as_post'(apast, 'rtype'=>'P')
		ops.'push'(apost)

	  clist_loop:
		.local pmc bpast, bpost
		bpast = cpast[1]
		bpost = self.'as_post'(bpast, 'rtype'=>'P')
		ops.'push'(bpost)
		.local string name
		name = cpast.'name'()
		name = self.'escape'(name)
		ops.'push_pirop'('call', name, apost, bpost, 'result'=>ops)
		unless clist goto clist_end
		ops.'push_pirop'('unless', ops, endlabel)
		cpast = pop clist
		apost = bpost
		goto clist_loop
	  clist_end:
		ops.'push'(endlabel)
		.return (ops)
	
.annotate 'line', 1744
    .return ()
  control_256:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P260, exception, "payload"
    .return ($P260)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "def_or"  :subid("48_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["PAST";"Op"])
    .param pmc param_264
    .param pmc param_265 :slurpy :named
.annotate 'line', 1807
    new $P263, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P263, control_262
    push_eh $P263
    .lex "self", self
    .lex "$node", param_264
    .lex "%options", param_265
.annotate 'line', 1808

		.local pmc node
		node = find_lex '$node'
		.local pmc options
		options = find_lex '%options'

		.local pmc ops
		$P0 = get_hll_global ['POST'], 'Ops'
		$S0 = self.'unique'('$P')
		ops = $P0.'new'('node'=>node, 'result'=>$S0)

		.local pmc lpast, lpost
		lpast = node[0]
		lpost = self.'as_post'(lpast, 'rtype'=>'P')
		ops.'push'(lpost)
		ops.'push_pirop'('set', ops, lpost)

		.local pmc endlabel
		$P0 = get_hll_global ['POST'], 'Label'
		$S0 = self.'unique'('default_')
		endlabel = $P0.'new'('result'=>$S0)

		$S0 = self.'unique'('$I')
		ops.'push_pirop'('defined', $S0, ops)
		ops.'push_pirop'('if', $S0, endlabel)
		.local pmc rpast, rpost
		rpast = node[1]
		rpost = self.'as_post'(rpast, 'rtype'=>'P')
		ops.'push'(rpost)
		ops.'push_pirop'('set', ops, rpost)
		ops.'push'(endlabel)
		.return (ops)
	
.annotate 'line', 1807
    .return ()
  control_262:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P266, exception, "payload"
    .return ($P266)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "xor"  :subid("49_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["PAST";"Op"])
    .param pmc param_270
    .param pmc param_271 :slurpy :named
.annotate 'line', 1850
    new $P269, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P269, control_268
    push_eh $P269
    .lex "self", self
    .lex "$node", param_270
    .lex "%options", param_271
.annotate 'line', 1851

		.local pmc node
		node = find_lex '$node'
		.local pmc options
		options = find_lex '%options'

		.local pmc ops
		$P0 = get_hll_global ['POST'], 'Ops'
		ops = $P0.'new'('node'=>node)
		$S0 = self.'unique'('$P')
		ops.'result'($S0)

		.local pmc labelproto, endlabel, falselabel
		labelproto = get_hll_global ['POST'], 'Label'
		falselabel = labelproto.'new'('name'=>'xor_false')
		endlabel = labelproto.'new'('name'=>'xor_end')

		.local pmc iter, apast, apost, i, t, u
		i = self.'unique'('$I')
		t = self.'unique'('$I')
		u = self.'unique'('$I')
		iter = node.'iterator'()
		apast = shift iter
		apost = self.'as_post'(apast, 'rtype'=>'P')
		ops.'push'(apost)
		ops.'push_pirop'('set', ops, apost)
		ops.'push_pirop'('istrue', t, apost)
	  middle_child:
		.local pmc bpast, bpost
		bpast = shift iter
		bpost = self.'as_post'(bpast, 'rtype'=>'P')
		ops.'push'(bpost)
		ops.'push_pirop'('istrue', u, bpost)
		ops.'push_pirop'('and', i, t, u)
		ops.'push_pirop'('if', i, falselabel)
		unless iter goto last_child
		.local pmc truelabel
		truelabel = labelproto.'new'('name'=>'xor_true')
		ops.'push_pirop'('if', t, truelabel)
		ops.'push_pirop'('set', ops, bpost)
		ops.'push_pirop'('set', t, u)
		ops.'push'(truelabel)
		goto middle_child
	  last_child:
		ops.'push_pirop'('if', t, endlabel)
		ops.'push_pirop'('set', ops, bpost)
		ops.'push_pirop'('goto', endlabel)
		ops.'push'(falselabel)
		ops.'push_pirop'('new', ops, '"Undef"')
		ops.'push'(endlabel)
		.return (ops)
	
.annotate 'line', 1850
    .return ()
  control_268:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P272, exception, "payload"
    .return ($P272)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "bind"  :subid("50_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["PAST";"Op"])
    .param pmc param_276
    .param pmc param_277 :slurpy :named
.annotate 'line', 1910
    new $P275, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P275, control_274
    push_eh $P275
    .lex "self", self
    .lex "$node", param_276
    .lex "%options", param_277
.annotate 'line', 1911

		.local pmc node
		node = find_lex '$node'
		.local pmc options
		options = find_lex '%options'

		.local pmc ops, lpast, rpast, lpost, rpost
		lpast = node[0]
		rpast = node[1]

		$P0 = get_hll_global ['POST'], 'Ops'
		ops = $P0.'new'('node'=>node)
		rpost = self.'as_post'(rpast, 'rtype'=>'P')
		rpost = self.'coerce'(rpost, 'P')
		ops.'push'(rpost)

		lpast.'lvalue'(1)
		lpost = self.'as_post'(lpast, 'bindpost'=>rpost)
		ops.'push'(lpost)
		ops.'result'(lpost)
		.return (ops)
	
.annotate 'line', 1910
    .return ()
  control_274:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P278, exception, "payload"
    .return ($P278)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "copy"  :subid("51_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["PAST";"Op"])
    .param pmc param_282
    .param pmc param_283 :slurpy :named
.annotate 'line', 1939
    new $P281, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P281, control_280
    push_eh $P281
    .lex "self", self
    .lex "$node", param_282
    .lex "%options", param_283
.annotate 'line', 1940

		.local pmc node
		node = find_lex '$node'
		.local pmc options
		options = find_lex '%options'
		.local pmc rpast, rpost, lpast, lpost
		rpast = node[1]
		lpast = node[0]
		rpost = self.'as_post'(rpast, 'rtype'=>'P')
		lpost = self.'as_post'(lpast, 'rtype'=>'P')
		.local pmc ops, alabel
		$P0 = get_hll_global ['POST'], 'Ops'
		ops = $P0.'new'(rpost, lpost, 'node'=>node, 'result'=>lpost)
		ops.'push_pirop'('copy', lpost, rpost)
		.return (ops)
	
.annotate 'line', 1939
    .return ()
  control_280:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P284, exception, "payload"
    .return ($P284)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "inline"  :subid("52_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["PAST";"Op"])
    .param pmc param_288
    .param pmc param_289 :slurpy :named
.annotate 'line', 1963
    new $P287, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P287, control_286
    push_eh $P287
    .lex "self", self
    .lex "$node", param_288
    .lex "%options", param_289
.annotate 'line', 1968
    new $P290, "Undef"
    .lex "$ops", $P290
.annotate 'line', 1969
    new $P291, "Undef"
    .lex "$inline", $P291
.annotate 'line', 1985
    new $P292, "Undef"
    .lex "$result", $P292
.annotate 'line', 1986
    new $P293, "Undef"
    .lex "$i", $P293
.annotate 'line', 1998
    $P294 = root_new ['parrot';'ResizablePMCArray']
    .lex "@arglist", $P294
.annotate 'line', 2000
    new $P295, "Undef"
    .lex "$s", $P295
.annotate 'line', 1968
    find_lex $P296, "self"
    find_lex $P297, "$node"
    $P298 = $P296."post_children"($P297, "vP" :named("signature"))
    store_lex "$ops", $P298
.annotate 'line', 1969

		.local pmc node
		node = find_lex '$node'
		.local pmc inline_pmc
		.local string inline
		inline_pmc = node.'inline'()
		$I0 = does inline_pmc, 'array'
		if $I0 goto inline_array
		$P299 = inline_pmc
		goto have_inline
	  inline_array:
		inline = join "\n", inline_pmc
		$P299 = box inline
	  have_inline:
	
    store_lex "$inline", $P299
.annotate 'line', 1985
    new $P300, "String"
    assign $P300, ""
    store_lex "$result", $P300
.annotate 'line', 1986
    find_lex $P301, "$inline"
    set $S302, $P301
    index $I303, $S302, "%t"
    new $P304, 'Integer'
    set $P304, $I303
    store_lex "$i", $P304
.annotate 'line', 1987
    find_lex $P306, "$i"
    set $N307, $P306
    isge $I308, $N307, 0.0
    if $I308, if_305
.annotate 'line', 1992
    find_lex $P315, "$inline"
    set $S316, $P315
    index $I317, $S316, "%r"
    new $P318, 'Integer'
    set $P318, $I317
    store_lex "$i", $P318
.annotate 'line', 1993
    find_lex $P320, "$i"
    set $N321, $P320
    isge $I322, $N321, 0.0
    unless $I322, if_319_end
.annotate 'line', 1994
    find_lex $P323, "self"
    $P324 = $P323."unique"("$P")
    store_lex "$result", $P324
.annotate 'line', 1995
    find_lex $P325, "$ops"
    find_lex $P326, "$result"
    $P325."result"($P326)
  if_319_end:
.annotate 'line', 1991
    goto if_305_end
  if_305:
.annotate 'line', 1988
    find_lex $P309, "self"
    $P310 = $P309."unique"("$P")
    store_lex "$result", $P310
.annotate 'line', 1989
    find_lex $P311, "$ops"
    find_lex $P312, "$result"
    $P311."push_pirop"("new", $P312, "'Undef'")
.annotate 'line', 1990
    find_lex $P313, "$ops"
    find_lex $P314, "$result"
    $P313."result"($P314)
  if_305_end:
.annotate 'line', 1998
    find_lex $P327, "$ops"
    $P328 = $P327."list"()
    store_lex "@arglist", $P328
.annotate 'line', 1999
    find_lex $P329, "$ops"
    find_lex $P330, "@arglist"
    find_lex $P331, "$inline"
    find_lex $P332, "$result"
    $P329."push_pirop"("inline", $P330 :flat, $P331 :named("inline"), $P332 :named("result"))
.annotate 'line', 2000
    find_lex $P333, "%options"
    unless_null $P333, vivify_163
    $P333 = root_new ['parrot';'Hash']
  vivify_163:
    set $P334, $P333["rtype"]
    unless_null $P334, vivify_164
    new $P334, "Undef"
  vivify_164:
    store_lex "$s", $P334
    find_lex $P335, "$ops"
.annotate 'line', 1963
    .return ($P335)
  control_286:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P336, exception, "payload"
    .return ($P336)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("53_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["PAST";"Var"])
    .param pmc param_340
    .param pmc param_341 :slurpy :named
.annotate 'line', 2012
    new $P339, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P339, control_338
    push_eh $P339
    .lex "self", self
    .lex "$node", param_340
    .lex "%options", param_341
.annotate 'line', 2013

		.local pmc node
		node = find_lex '$node'
		.local pmc options
		options = find_lex '%options'

		##  set 'bindpost'
		.local pmc bindpost
		bindpost = options['bindpost']
		unless null bindpost goto have_bindpost
		bindpost = new 'Undef'
	  have_bindpost:

		## determine the node's scope.  First, check the node itself
		.local string scope
		scope = node.'scope'()
		if scope goto have_scope
		## otherwise, check the current symbol table under the variable's name
		.local string name
		name = node.'name'()
		.local pmc symtable
		symtable = getattribute self, '%!symtable'
		$P0 = symtable[name]
		if null $P0 goto default_scope
		scope = $P0['scope']
		if scope goto have_scope
	  default_scope:
		##  see if an outer block has set a default scope
		$P0 = symtable['']
		if null $P0 goto scope_error
		scope = $P0['scope']
		unless scope goto scope_error
	  have_scope:
		push_eh scope_error_ex
		$P0 = find_method self, scope
		.tailcall self.$P0(node, bindpost)
	  scope_error_ex:
		pop_eh
	  scope_error:
		unless scope goto scope_error_1
		scope = concat " in '", scope
		scope = concat scope, "' scope"
	  scope_error_1:
		# Find the nearest named block
		.local string blockname
		blockname = ''
		.local pmc it
		$P0 = find_dynamic_lex '@*BLOCKPAST'
		it = iter $P0
	  scope_error_block_loop:
		unless it goto scope_error_2
		$P0 = shift it
		blockname = $P0.'name'()
		unless blockname goto scope_error_block_loop
	  scope_error_2:
		if blockname goto have_blockname
		blockname = '<anonymous>'
	  have_blockname:
		# Find the source location, if available
		.local string sourceline
		.local pmc source, pos, files
		sourceline = ''
		source = node['source']
		pos = node['pos']
		if null source goto scope_error_3
		files = find_caller_lex '$?FILES'
		if null files goto scope_error_3
		$S0 = files
		sourceline = concat ' (', $S0
		sourceline = concat sourceline, ':'
		$I0 = self.'lineof'(source, pos)
		inc $I0
		$S0 = $I0
		sourceline = concat sourceline, $S0
		sourceline = concat sourceline, ')'
	  scope_error_3:
		.tailcall self.'panic'("Symbol '", name, "' not predeclared", scope, " in ", blockname, sourceline)
	
.annotate 'line', 2012
    .return ()
  control_338:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P342, exception, "payload"
    .return ($P342)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "vivify"  :subid("54_1306440677.9234") :method :outer("11_1306440677.9234")
    .param pmc param_346
    .param pmc param_347
    .param pmc param_348
    .param pmc param_349
.annotate 'line', 2094
    new $P345, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P345, control_344
    push_eh $P345
    .lex "self", self
    .lex "$node", param_346
    .lex "$ops", param_347
    .lex "$fetchop", param_348
    .lex "$storeop", param_349
.annotate 'line', 2095

		.local pmc node
		node = find_lex '$node'
		.local pmc ops
		ops = find_lex '$ops'
		.local pmc fetchop
		fetchop = find_lex '$fetchop'
		.local pmc storeop
		storeop = find_lex '$storeop'

		.local pmc viviself, vivipost, vivilabel
		viviself = node.'viviself'()
		vivipost = self.'as_vivipost'(viviself, 'rtype'=>'P')
		$I0 = isa vivipost, 'String'
		.local string result
		result = vivipost.'result'()
		unless result == '' goto have_result
		result = self.'uniquereg'('P')
	  have_result:
		ops.'result'(result)
		ops.'push'(fetchop)
		unless viviself goto vivipost_done
		$P0 = get_hll_global ['POST'], 'Label'
		vivilabel = $P0.'new'('name'=>'vivify_')
		ops.'push_pirop'('unless_null', ops, vivilabel)
		ops.'push'(vivipost)
		$I0 = node.'lvalue'()
		unless $I0 goto vivipost_stored
		ops.'push'(storeop)
	  vivipost_stored:
		ops.'push'(vivilabel)
	  vivipost_done:
		.return (ops)
	
.annotate 'line', 2094
    .return ()
  control_344:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P350, exception, "payload"
    .return ($P350)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "parameter"  :subid("55_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["PAST";"Var"],_)
    .param pmc param_354
    .param pmc param_355
.annotate 'line', 2132
    new $P353, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P353, control_352
    push_eh $P353
    .lex "self", self
    .lex "$node", param_354
    .lex "$bindpost", param_355
.annotate 'line', 2133

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
	
.annotate 'line', 2132
    .return ()
  control_352:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P356, exception, "payload"
    .return ($P356)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "package"  :subid("56_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["PAST";"Var"],_)
    .param pmc param_360
    .param pmc param_361
.annotate 'line', 2187
    new $P359, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P359, control_358
    push_eh $P359
    .lex "self", self
    .lex "$node", param_360
    .lex "$bindpost", param_361
.annotate 'line', 2188

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
	
.annotate 'line', 2187
    .return ()
  control_358:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P362, exception, "payload"
    .return ($P362)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "lexical"  :subid("57_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["PAST";"Var"],_)
    .param pmc param_366
    .param pmc param_367
.annotate 'line', 2236
    new $P365, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P365, control_364
    push_eh $P365
    .lex "self", self
    .lex "$node", param_366
    .lex "$bindpost", param_367
.annotate 'line', 2237

		.local pmc node
		node = find_lex '$node'
		.local pmc bindpost
		bindpost = find_lex '$bindpost'

		.local string name
		$P0 = get_hll_global ['POST'], 'Ops'
		name = node.'name'()
		name = self.'escape'(name)

		.local int isdecl
		isdecl = node.'isdecl'()

		if bindpost goto lexical_bind

	  lexical_post:
		if isdecl goto lexical_decl
		.local pmc ops, fetchop, storeop
		ops = $P0.'new'('node'=>node)
		$P0 = get_hll_global ['POST'], 'Op'
		fetchop = $P0.'new'(ops, name, 'pirop'=>'find_lex')
		storeop = $P0.'new'(name, ops, 'pirop'=>'store_lex')
		.tailcall self.'vivify'(node, ops, fetchop, storeop)

	  lexical_decl:
		ops = $P0.'new'('node'=>node)
		.local pmc viviself, vivipost
		viviself = node.'viviself'()
		vivipost = self.'as_vivipost'(viviself, 'rtype'=>'P')
		ops.'push'(vivipost)
		ops.'push_pirop'('.lex', name, vivipost)
		ops.'result'(vivipost)
		.return (ops)

	  lexical_bind:
		$P0 = get_hll_global ['POST'], 'Op'
		if isdecl goto lexical_bind_decl
		.tailcall $P0.'new'(name, bindpost, 'pirop'=>'store_lex', 'result'=>bindpost)
	  lexical_bind_decl:
		.tailcall $P0.'new'(name, bindpost, 'pirop'=>'.lex', 'result'=>bindpost)
	
.annotate 'line', 2236
    .return ()
  control_364:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P368, exception, "payload"
    .return ($P368)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "contextual"  :subid("58_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["PAST";"Var"],_)
    .param pmc param_372
    .param pmc param_373
.annotate 'line', 2282
    new $P371, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P371, control_370
    push_eh $P371
    .lex "self", self
    .lex "$node", param_372
    .lex "$bindpost", param_373
.annotate 'line', 2283

		.local pmc node
		node = find_lex '$node'
		.local pmc bindpost
		bindpost = find_lex '$bindpost'
		# If we've requested a contextual in a block that
		# explicitly declares the variable as a different type,
		# treat it as that type.
		.local string name
		name = node.'name'()
		$P0 = find_dynamic_lex '@*BLOCKPAST'
		$P0 = $P0[0]
		$P0 = $P0.'symtable'()
		unless $P0 goto contextual
		$P0 = $P0[name]
		if null $P0 goto contextual
		$S0 = $P0['scope']
		unless $S0 goto contextual
		if $S0 == 'contextual' goto contextual
		.tailcall self.$S0(node, bindpost)

	  contextual:
		# If this is a declaration, treat it like a normal lexical
		.local int isdecl
		isdecl = node.'isdecl'()
		if isdecl goto contextual_lex

		name = self.'escape'(name)
		if bindpost goto contextual_bind

	  contextual_post:
		.local pmc ops, fetchop, storeop
		$P0 = get_hll_global ['POST'], 'Ops'
		ops = $P0.'new'('node'=>node)
		$P0 = get_hll_global ['POST'], 'Op'
		fetchop = $P0.'new'(ops, name, 'pirop'=>'find_dynamic_lex')
		storeop = $P0.'new'(name, ops, 'pirop'=>'store_dynamic_lex')
		.tailcall self.'vivify'(node, ops, fetchop, storeop)

	  contextual_bind:
		$P0 = get_hll_global ['POST'], 'Op'
		.tailcall $P0.'new'(name, bindpost, 'pirop'=>'store_dynamic_lex', 'result'=>bindpost)

	  contextual_lex:
		.tailcall self.'lexical'(node, bindpost)
	
.annotate 'line', 2282
    .return ()
  control_370:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P374, exception, "payload"
    .return ($P374)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "keyed"  :subid("59_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["PAST";"Var"],_)
    .param pmc param_378
    .param pmc param_379
    .param pmc param_380 :optional
    .param int has_param_380 :opt_flag
.annotate 'line', 2332
    new $P377, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P377, control_376
    push_eh $P377
    .lex "self", self
    .lex "$node", param_378
    .lex "$bindpost", param_379
    if has_param_380, optparam_165
    new $P381, "Undef"
    set param_380, $P381
  optparam_165:
    .lex "$keyrtype", param_380
.annotate 'line', 2333

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
	
.annotate 'line', 2332
    .return ()
  control_376:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P382, exception, "payload"
    .return ($P382)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "keyed_int"  :subid("60_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["PAST";"Var"],_)
    .param pmc param_386
    .param pmc param_387
.annotate 'line', 2401
    new $P385, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P385, control_384
    push_eh $P385
    .lex "self", self
    .lex "$node", param_386
    .lex "$bindpost", param_387
.annotate 'line', 2402

		.local pmc node
		node = find_lex '$node'
		.local pmc bindpost
		bindpost = find_lex '$bindpost'
		.tailcall self.'keyed'(node, bindpost, 'i')
	
.annotate 'line', 2401
    .return ()
  control_384:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P388, exception, "payload"
    .return ($P388)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "attribute"  :subid("61_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["PAST";"Var"],_)
    .param pmc param_392
    .param pmc param_393
.annotate 'line', 2412
    new $P391, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P391, control_390
    push_eh $P391
    .lex "self", self
    .lex "$node", param_392
    .lex "$bindpost", param_393
.annotate 'line', 2413

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
	
.annotate 'line', 2412
    .return ()
  control_390:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P394, exception, "payload"
    .return ($P394)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "register"  :subid("62_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["PAST";"Var"],_)
    .param pmc param_398
    .param pmc param_399
.annotate 'line', 2480
    new $P397, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P397, control_396
    push_eh $P397
    .lex "self", self
    .lex "$node", param_398
    .lex "$bindpost", param_399
.annotate 'line', 2481

		.local pmc node
		node = find_lex '$node'
		.local pmc bindpost
		bindpost = find_lex '$bindpost'

		.local string name
		name = node.'name'()
		if name goto have_name
		name = self.'uniquereg'('P')
		node.'name'(name)
	  have_name:

		.local pmc ops
		$P0 = get_hll_global ['POST'], 'Ops'
		ops = $P0.'new'('result'=>name, 'node'=>node)

		.local int isdecl
		isdecl = node.'isdecl'()
		unless isdecl goto decl_done
		ops.'push_pirop'('.local pmc', ops)
	  decl_done:

		if bindpost goto register_bind

		.local pmc viviself, vivipost
		viviself = node.'viviself'()
		unless viviself goto end
		vivipost = self.'as_vivipost'(viviself, 'rtype'=>'P')
		ops.'push'(vivipost)
		ops.'push_pirop'('set', ops, vivipost)
		goto end

	  register_bind:
		ops.'push_pirop'('set', ops, bindpost)

	  end:
		.return (ops)
	
.annotate 'line', 2480
    .return ()
  control_396:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P400, exception, "payload"
    .return ($P400)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("63_1306440677.9234") :method :outer("11_1306440677.9234") :multi(_,["PAST";"Val"])
    .param pmc param_404
    .param pmc param_405 :slurpy :named
.annotate 'line', 2531
    new $P403, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P403, control_402
    push_eh $P403
    .lex "self", self
    .lex "$node", param_404
    .lex "%options", param_405
.annotate 'line', 2532

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
		$S0 = replace $S0, 0, 1, '.include "'
		$S0 = concat $S0, '.pasm"'
		$P0 = find_dynamic_lex '$*SUB'
		$P0.'add_directive'($S0)
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
	
.annotate 'line', 2531
    .return ()
  control_402:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P406, exception, "payload"
    .return ($P406)
.end


.namespace ["PAST";"Compiler"]
.sub "_block408" :load :anon :subid("64_1306440677.9234")
.annotate 'line', 41
    .const 'Sub' $P410 = "11_1306440677.9234" 
    $P411 = $P410()
    .return ($P411)
.end


.namespace []
.sub "_block597" :load :anon :subid("65_1306440677.9234")
.annotate 'line', 1
    .const 'Sub' $P599 = "10_1306440677.9234" 
    $P600 = $P599()
    .return ($P600)
.end

