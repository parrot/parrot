
.namespace []
.sub "_block1000"  :anon :subid("10_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1313886916.84408" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 41
    .const 'Sub' $P1003 = "11_1313886916.84408" 
    capture_lex $P1003
    $P106 = $P1003()
.annotate 'line', 1
    .return ($P106)
    .const 'Sub' $P2078 = "115_1313886916.84408" 
    .return ($P2078)
.end


.namespace []
.sub "" :load :init :subid("post116") :outer("10_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1313886916.84408" 
    .local pmc block
    set block, $P1001
.annotate 'line', 1
    load_bytecode "PCT/HLLCompiler.pbc"
    $P2080 = get_root_global ["parrot"], "P6metaclass"
    new $P101, "ResizablePMCArray"
    push $P101, "%!symtable"
    $P2080."new_class"("PAST::Compiler", "PCT::HLLCompiler" :named("parent"), $P101 :named("attr"))
.end


.namespace ["PAST";"Compiler"]
.sub "_block1002"  :subid("11_1313886916.84408") :outer("10_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 41
    .const 'Sub' $P1953 = "112_1313886916.84408" 
    capture_lex $P1953
    .const 'Sub' $P1936 = "109_1313886916.84408" 
    capture_lex $P1936
    .const 'Sub' $P1915 = "107_1313886916.84408" 
    capture_lex $P1915
    .const 'Sub' $P1910 = "106_1313886916.84408" 
    capture_lex $P1910
    .const 'Sub' $P1904 = "105_1313886916.84408" 
    capture_lex $P1904
    .const 'Sub' $P1882 = "103_1313886916.84408" 
    capture_lex $P1882
    .const 'Sub' $P1860 = "100_1313886916.84408" 
    capture_lex $P1860
    .const 'Sub' $P1845 = "99_1313886916.84408" 
    capture_lex $P1845
    .const 'Sub' $P1829 = "97_1313886916.84408" 
    capture_lex $P1829
    .const 'Sub' $P1813 = "95_1313886916.84408" 
    capture_lex $P1813
    .const 'Sub' $P1754 = "89_1313886916.84408" 
    capture_lex $P1754
    .const 'Sub' $P1738 = "88_1313886916.84408" 
    capture_lex $P1738
    .const 'Sub' $P1728 = "87_1313886916.84408" 
    capture_lex $P1728
    .const 'Sub' $P1716 = "86_1313886916.84408" 
    capture_lex $P1716
    .const 'Sub' $P1697 = "84_1313886916.84408" 
    capture_lex $P1697
    .const 'Sub' $P1685 = "83_1313886916.84408" 
    capture_lex $P1685
    .const 'Sub' $P1660 = "80_1313886916.84408" 
    capture_lex $P1660
    .const 'Sub' $P1641 = "79_1313886916.84408" 
    capture_lex $P1641
    .const 'Sub' $P1627 = "77_1313886916.84408" 
    capture_lex $P1627
    .const 'Sub' $P1622 = "76_1313886916.84408" 
    capture_lex $P1622
    .const 'Sub' $P1617 = "75_1313886916.84408" 
    capture_lex $P1617
    .const 'Sub' $P1602 = "73_1313886916.84408" 
    capture_lex $P1602
    .const 'Sub' $P1575 = "71_1313886916.84408" 
    capture_lex $P1575
    .const 'Sub' $P1570 = "70_1313886916.84408" 
    capture_lex $P1570
    .const 'Sub' $P1565 = "69_1313886916.84408" 
    capture_lex $P1565
    .const 'Sub' $P1560 = "68_1313886916.84408" 
    capture_lex $P1560
    .const 'Sub' $P1537 = "67_1313886916.84408" 
    capture_lex $P1537
    .const 'Sub' $P1506 = "66_1313886916.84408" 
    capture_lex $P1506
    .const 'Sub' $P1501 = "65_1313886916.84408" 
    capture_lex $P1501
    .const 'Sub' $P1452 = "61_1313886916.84408" 
    capture_lex $P1452
    .const 'Sub' $P1447 = "60_1313886916.84408" 
    capture_lex $P1447
    .const 'Sub' $P1422 = "58_1313886916.84408" 
    capture_lex $P1422
    .const 'Sub' $P1400 = "57_1313886916.84408" 
    capture_lex $P1400
    .const 'Sub' $P1383 = "56_1313886916.84408" 
    capture_lex $P1383
    .const 'Sub' $P1280 = "46_1313886916.84408" 
    capture_lex $P1280
    .const 'Sub' $P1244 = "42_1313886916.84408" 
    capture_lex $P1244
    .const 'Sub' $P1230 = "41_1313886916.84408" 
    capture_lex $P1230
    .const 'Sub' $P1211 = "39_1313886916.84408" 
    capture_lex $P1211
    .const 'Sub' $P1193 = "38_1313886916.84408" 
    capture_lex $P1193
    .const 'Sub' $P1188 = "37_1313886916.84408" 
    capture_lex $P1188
    .const 'Sub' $P1183 = "36_1313886916.84408" 
    capture_lex $P1183
    .const 'Sub' $P1176 = "35_1313886916.84408" 
    capture_lex $P1176
    .const 'Sub' $P1169 = "34_1313886916.84408" 
    capture_lex $P1169
    .const 'Sub' $P1163 = "33_1313886916.84408" 
    capture_lex $P1163
    .const 'Sub' $P1157 = "32_1313886916.84408" 
    capture_lex $P1157
    .const 'Sub' $P1152 = "31_1313886916.84408" 
    capture_lex $P1152
    .const 'Sub' $P1145 = "30_1313886916.84408" 
    capture_lex $P1145
    .const 'Sub' $P1091 = "23_1313886916.84408" 
    capture_lex $P1091
    .const 'Sub' $P1086 = "22_1313886916.84408" 
    capture_lex $P1086
    .const 'Sub' $P1069 = "20_1313886916.84408" 
    capture_lex $P1069
    .const 'Sub' $P1060 = "19_1313886916.84408" 
    capture_lex $P1060
    .const 'Sub' $P1052 = "18_1313886916.84408" 
    capture_lex $P1052
    .const 'Sub' $P1046 = "17_1313886916.84408" 
    capture_lex $P1046
    .const 'Sub' $P1039 = "16_1313886916.84408" 
    capture_lex $P1039
    .const 'Sub' $P1022 = "14_1313886916.84408" 
    capture_lex $P1022
    .const 'Sub' $P1009 = "12_1313886916.84408" 
    capture_lex $P1009
.annotate 'line', 43
    get_global $P1004, "%piropsig"
    unless_null $P1004, vivify_209
    $P1004 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1004
  vivify_209:
.annotate 'line', 44
    get_global $P1005, "%valflags"
    unless_null $P1005, vivify_210
    $P1005 = root_new ['parrot';'Hash']
    set_global "%valflags", $P1005
  vivify_210:
.annotate 'line', 45
    get_global $P1006, "%controltypes"
    unless_null $P1006, vivify_211
    $P1006 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P1006
  vivify_211:
.annotate 'line', 46
    get_global $P100, "$serno"
    unless_null $P100, vivify_212
    new $P100, "Undef"
    set_global "$serno", $P100
  vivify_212:
.annotate 'line', 49
    get_global $P101, "$TEMPREG_BASE"
    unless_null $P101, vivify_213
    new $P101, "Undef"
    set_global "$TEMPREG_BASE", $P101
  vivify_213:
.annotate 'line', 50
    get_global $P102, "$UNIQUE_BASE"
    unless_null $P102, vivify_214
    new $P102, "Undef"
    set_global "$UNIQUE_BASE", $P102
  vivify_214:
.annotate 'line', 172
    get_global $P1007, "@?BLOCK"
    unless_null $P1007, vivify_215
    $P1007 = root_new ['parrot';'ResizablePMCArray']
    set_global "@?BLOCK", $P1007
  vivify_215:
.annotate 'line', 978
    .const 'Sub' $P1009 = "12_1313886916.84408" 
    newclosure $P1021, $P1009
    set $P1008, $P1021
    .lex "shallow_clone_hash", $P1008
.annotate 'line', 41
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    get_global $P105, "%piropsig"
    get_global $P105, "%valflags"
    get_global $P105, "%controltypes"
    get_global $P105, "$serno"
    get_global $P105, "$TEMPREG_BASE"
    get_global $P105, "$UNIQUE_BASE"
    get_global $P105, "@?BLOCK"
    find_lex $P105, "shallow_clone_hash"
.annotate 'line', 2009
    .const 'Sub' $P1953 = "112_1313886916.84408" 
    newclosure $P1982, $P1953
.annotate 'line', 41
    .return ($P1982)
    .const 'Sub' $P1984 = "114_1313886916.84408" 
    .return ($P1984)
.end


.namespace ["PAST";"Compiler"]
.sub "" :load :init :subid("post117") :outer("11_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 41
    .const 'Sub' $P1003 = "11_1313886916.84408" 
    .local pmc block
    set block, $P1003
.annotate 'line', 54
    get_hll_global $P106, ["PAST"], "Compiler"
    $P106."language"("PAST")
.annotate 'line', 55
    get_hll_global $P106, ["PAST"], "Compiler"
    new $P107, "ResizablePMCArray"
    push $P107, "post"
    push $P107, "pir"
    push $P107, "evalpmc"
    $P106."stages"($P107)
.annotate 'line', 58
    new $P106, "String"
    assign $P106, "PP+"
    get_global $P1986, "%piropsig"
    unless_null $P1986, vivify_118
    $P1986 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1986
  vivify_118:
    set $P1986["add"], $P106
.annotate 'line', 59
    new $P106, "String"
    assign $P106, "PPP"
    get_global $P1987, "%piropsig"
    unless_null $P1987, vivify_119
    $P1987 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1987
  vivify_119:
    set $P1987["band"], $P106
.annotate 'line', 60
    new $P106, "String"
    assign $P106, "PPP"
    get_global $P1988, "%piropsig"
    unless_null $P1988, vivify_120
    $P1988 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1988
  vivify_120:
    set $P1988["bxor"], $P106
.annotate 'line', 61
    new $P106, "String"
    assign $P106, "PP"
    get_global $P1989, "%piropsig"
    unless_null $P1989, vivify_121
    $P1989 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1989
  vivify_121:
    set $P1989["bnot"], $P106
.annotate 'line', 62
    new $P106, "String"
    assign $P106, "PPP"
    get_global $P1990, "%piropsig"
    unless_null $P1990, vivify_122
    $P1990 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1990
  vivify_122:
    set $P1990["bor"], $P106
.annotate 'line', 63
    new $P106, "String"
    assign $P106, "IPs"
    get_global $P1991, "%piropsig"
    unless_null $P1991, vivify_123
    $P1991 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1991
  vivify_123:
    set $P1991["can"], $P106
.annotate 'line', 64
    new $P106, "String"
    assign $P106, "Si"
    get_global $P1992, "%piropsig"
    unless_null $P1992, vivify_124
    $P1992 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1992
  vivify_124:
    set $P1992["chr"], $P106
.annotate 'line', 65
    new $P106, "String"
    assign $P106, "PP"
    get_global $P1993, "%piropsig"
    unless_null $P1993, vivify_125
    $P1993 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1993
  vivify_125:
    set $P1993["clone"], $P106
.annotate 'line', 66
    new $P106, "String"
    assign $P106, "PP~"
    get_global $P1994, "%piropsig"
    unless_null $P1994, vivify_126
    $P1994 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1994
  vivify_126:
    set $P1994["concat"], $P106
.annotate 'line', 67
    new $P106, "String"
    assign $P106, "0PP"
    get_global $P1995, "%piropsig"
    unless_null $P1995, vivify_127
    $P1995 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1995
  vivify_127:
    set $P1995["copy"], $P106
.annotate 'line', 68
    new $P106, "String"
    assign $P106, "IP"
    get_global $P1996, "%piropsig"
    unless_null $P1996, vivify_128
    $P1996 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1996
  vivify_128:
    set $P1996["defined"], $P106
.annotate 'line', 69
    new $P106, "String"
    assign $P106, "vQ*"
    get_global $P1997, "%piropsig"
    unless_null $P1997, vivify_129
    $P1997 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1997
  vivify_129:
    set $P1997["delete"], $P106
.annotate 'line', 70
    new $P106, "String"
    assign $P106, "v~"
    get_global $P1998, "%piropsig"
    unless_null $P1998, vivify_130
    $P1998 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1998
  vivify_130:
    set $P1998["die"], $P106
.annotate 'line', 71
    new $P106, "String"
    assign $P106, "PP+"
    get_global $P1999, "%piropsig"
    unless_null $P1999, vivify_131
    $P1999 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1999
  vivify_131:
    set $P1999["div"], $P106
.annotate 'line', 72
    new $P106, "String"
    assign $P106, "IPs"
    get_global $P2000, "%piropsig"
    unless_null $P2000, vivify_132
    $P2000 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2000
  vivify_132:
    set $P2000["does"], $P106
.annotate 'line', 73
    new $P106, "String"
    assign $P106, "Ss"
    get_global $P2001, "%piropsig"
    unless_null $P2001, vivify_133
    $P2001 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2001
  vivify_133:
    set $P2001["downcase"], $P106
.annotate 'line', 74
    new $P106, "String"
    assign $P106, "IP"
    get_global $P2002, "%piropsig"
    unless_null $P2002, vivify_134
    $P2002 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2002
  vivify_134:
    set $P2002["elements"], $P106
.annotate 'line', 75
    new $P106, "String"
    assign $P106, "IQ*"
    get_global $P2003, "%piropsig"
    unless_null $P2003, vivify_135
    $P2003 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2003
  vivify_135:
    set $P2003["exists"], $P106
.annotate 'line', 76
    new $P106, "String"
    assign $P106, "vi"
    get_global $P2004, "%piropsig"
    unless_null $P2004, vivify_136
    $P2004 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2004
  vivify_136:
    set $P2004["exit"], $P106
.annotate 'line', 77
    new $P106, "String"
    assign $P106, "PP+"
    get_global $P2005, "%piropsig"
    unless_null $P2005, vivify_137
    $P2005 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2005
  vivify_137:
    set $P2005["fdiv"], $P106
.annotate 'line', 78
    new $P106, "String"
    assign $P106, "Is"
    get_global $P2006, "%piropsig"
    unless_null $P2006, vivify_138
    $P2006 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2006
  vivify_138:
    set $P2006["find_codepoint"], $P106
.annotate 'line', 79
    new $P106, "String"
    assign $P106, "Ps"
    get_global $P2007, "%piropsig"
    unless_null $P2007, vivify_139
    $P2007 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2007
  vivify_139:
    set $P2007["find_dynamic_lex"], $P106
.annotate 'line', 80
    new $P106, "String"
    assign $P106, "Ps"
    get_global $P2008, "%piropsig"
    unless_null $P2008, vivify_140
    $P2008 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2008
  vivify_140:
    set $P2008["find_name"], $P106
.annotate 'line', 81
    new $P106, "String"
    assign $P106, "P"
    get_global $P2009, "%piropsig"
    unless_null $P2009, vivify_141
    $P2009 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2009
  vivify_141:
    set $P2009["getinterp"], $P106
.annotate 'line', 82
    new $P106, "String"
    assign $P106, "P~P"
    get_global $P2010, "%piropsig"
    unless_null $P2010, vivify_142
    $P2010 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2010
  vivify_142:
    set $P2010["getprop"], $P106
.annotate 'line', 83
    new $P106, "String"
    assign $P106, "P"
    get_global $P2011, "%piropsig"
    unless_null $P2011, vivify_143
    $P2011 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2011
  vivify_143:
    set $P2011["getstderr"], $P106
.annotate 'line', 84
    new $P106, "String"
    assign $P106, "P"
    get_global $P2012, "%piropsig"
    unless_null $P2012, vivify_144
    $P2012 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2012
  vivify_144:
    set $P2012["getstdin"], $P106
.annotate 'line', 85
    new $P106, "String"
    assign $P106, "P"
    get_global $P2013, "%piropsig"
    unless_null $P2013, vivify_145
    $P2013 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2013
  vivify_145:
    set $P2013["getstdout"], $P106
.annotate 'line', 86
    new $P106, "String"
    assign $P106, "Issi"
    get_global $P2014, "%piropsig"
    unless_null $P2014, vivify_146
    $P2014 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2014
  vivify_146:
    set $P2014["index"], $P106
.annotate 'line', 87
    new $P106, "String"
    assign $P106, "IP~"
    get_global $P2015, "%piropsig"
    unless_null $P2015, vivify_147
    $P2015 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2015
  vivify_147:
    set $P2015["isa"], $P106
.annotate 'line', 88
    new $P106, "String"
    assign $P106, "IP"
    get_global $P2016, "%piropsig"
    unless_null $P2016, vivify_148
    $P2016 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2016
  vivify_148:
    set $P2016["isfalse"], $P106
.annotate 'line', 89
    new $P106, "String"
    assign $P106, "IP"
    get_global $P2017, "%piropsig"
    unless_null $P2017, vivify_149
    $P2017 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2017
  vivify_149:
    set $P2017["isnull"], $P106
.annotate 'line', 90
    new $P106, "String"
    assign $P106, "IPP"
    get_global $P2018, "%piropsig"
    unless_null $P2018, vivify_150
    $P2018 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2018
  vivify_150:
    set $P2018["issame"], $P106
.annotate 'line', 91
    new $P106, "String"
    assign $P106, "IP"
    get_global $P2019, "%piropsig"
    unless_null $P2019, vivify_151
    $P2019 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2019
  vivify_151:
    set $P2019["istrue"], $P106
.annotate 'line', 92
    new $P106, "String"
    assign $P106, "SsP"
    get_global $P2020, "%piropsig"
    unless_null $P2020, vivify_152
    $P2020 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2020
  vivify_152:
    set $P2020["join"], $P106
.annotate 'line', 93
    new $P106, "String"
    assign $P106, "Is"
    get_global $P2021, "%piropsig"
    unless_null $P2021, vivify_153
    $P2021 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2021
  vivify_153:
    set $P2021["length"], $P106
.annotate 'line', 94
    new $P106, "String"
    assign $P106, "vs"
    get_global $P2022, "%piropsig"
    unless_null $P2022, vivify_154
    $P2022 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2022
  vivify_154:
    set $P2022["load_bytecode"], $P106
.annotate 'line', 95
    new $P106, "String"
    assign $P106, "vs"
    get_global $P2023, "%piropsig"
    unless_null $P2023, vivify_155
    $P2023 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2023
  vivify_155:
    set $P2023["load_language"], $P106
.annotate 'line', 96
    new $P106, "String"
    assign $P106, "P~"
    get_global $P2024, "%piropsig"
    unless_null $P2024, vivify_156
    $P2024 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2024
  vivify_156:
    set $P2024["loadlib"], $P106
.annotate 'line', 97
    new $P106, "String"
    assign $P106, "PP+"
    get_global $P2025, "%piropsig"
    unless_null $P2025, vivify_157
    $P2025 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2025
  vivify_157:
    set $P2025["mod"], $P106
.annotate 'line', 98
    new $P106, "String"
    assign $P106, "PP+"
    get_global $P2026, "%piropsig"
    unless_null $P2026, vivify_158
    $P2026 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2026
  vivify_158:
    set $P2026["mul"], $P106
.annotate 'line', 99
    new $P106, "String"
    assign $P106, "PP"
    get_global $P2027, "%piropsig"
    unless_null $P2027, vivify_159
    $P2027 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2027
  vivify_159:
    set $P2027["neg"], $P106
.annotate 'line', 100
    new $P106, "String"
    assign $P106, "P~"
    get_global $P2028, "%piropsig"
    unless_null $P2028, vivify_160
    $P2028 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2028
  vivify_160:
    set $P2028["new"], $P106
.annotate 'line', 101
    new $P106, "String"
    assign $P106, "PP"
    get_global $P2029, "%piropsig"
    unless_null $P2029, vivify_161
    $P2029 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2029
  vivify_161:
    set $P2029["newclosure"], $P106
.annotate 'line', 102
    new $P106, "String"
    assign $P106, "PP"
    get_global $P2030, "%piropsig"
    unless_null $P2030, vivify_162
    $P2030 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2030
  vivify_162:
    set $P2030["not"], $P106
.annotate 'line', 103
    new $P106, "String"
    assign $P106, "Isi"
    get_global $P2031, "%piropsig"
    unless_null $P2031, vivify_163
    $P2031 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2031
  vivify_163:
    set $P2031["ord"], $P106
.annotate 'line', 104
    new $P106, "String"
    assign $P106, "PP"
    get_global $P2032, "%piropsig"
    unless_null $P2032, vivify_164
    $P2032 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2032
  vivify_164:
    set $P2032["pop"], $P106
.annotate 'line', 105
    new $P106, "String"
    assign $P106, "NN+"
    get_global $P2033, "%piropsig"
    unless_null $P2033, vivify_165
    $P2033 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2033
  vivify_165:
    set $P2033["pow"], $P106
.annotate 'line', 106
    new $P106, "String"
    assign $P106, "v*"
    get_global $P2034, "%piropsig"
    unless_null $P2034, vivify_166
    $P2034 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2034
  vivify_166:
    set $P2034["print"], $P106
.annotate 'line', 107
    new $P106, "String"
    assign $P106, "v*"
    get_global $P2035, "%piropsig"
    unless_null $P2035, vivify_167
    $P2035 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2035
  vivify_167:
    set $P2035["printerr"], $P106
.annotate 'line', 108
    new $P106, "String"
    assign $P106, "0P*"
    get_global $P2036, "%piropsig"
    unless_null $P2036, vivify_168
    $P2036 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2036
  vivify_168:
    set $P2036["push"], $P106
.annotate 'line', 109
    new $P106, "String"
    assign $P106, "Ssi"
    get_global $P2037, "%piropsig"
    unless_null $P2037, vivify_169
    $P2037 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2037
  vivify_169:
    set $P2037["repeat"], $P106
.annotate 'line', 110
    new $P106, "String"
    assign $P106, "Ssiis"
    get_global $P2038, "%piropsig"
    unless_null $P2038, vivify_170
    $P2038 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2038
  vivify_170:
    set $P2038["replace"], $P106
.annotate 'line', 111
    new $P106, "String"
    assign $P106, "v*"
    get_global $P2039, "%piropsig"
    unless_null $P2039, vivify_171
    $P2039 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2039
  vivify_171:
    set $P2039["say"], $P106
.annotate 'line', 112
    new $P106, "String"
    assign $P106, "PP"
    get_global $P2040, "%piropsig"
    unless_null $P2040, vivify_172
    $P2040 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2040
  vivify_172:
    set $P2040["set"], $P106
.annotate 'line', 113
    new $P106, "String"
    assign $P106, "0P~P"
    get_global $P2041, "%piropsig"
    unless_null $P2041, vivify_173
    $P2041 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2041
  vivify_173:
    set $P2041["setprop"], $P106
.annotate 'line', 114
    new $P106, "String"
    assign $P106, "0P~P"
    get_global $P2042, "%piropsig"
    unless_null $P2042, vivify_174
    $P2042 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2042
  vivify_174:
    set $P2042["setattribute"], $P106
.annotate 'line', 115
    new $P106, "String"
    assign $P106, "PP"
    get_global $P2043, "%piropsig"
    unless_null $P2043, vivify_175
    $P2043 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2043
  vivify_175:
    set $P2043["shift"], $P106
.annotate 'line', 116
    new $P106, "String"
    assign $P106, "PP+"
    get_global $P2044, "%piropsig"
    unless_null $P2044, vivify_176
    $P2044 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2044
  vivify_176:
    set $P2044["shl"], $P106
.annotate 'line', 117
    new $P106, "String"
    assign $P106, "PP+"
    get_global $P2045, "%piropsig"
    unless_null $P2045, vivify_177
    $P2045 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2045
  vivify_177:
    set $P2045["shr"], $P106
.annotate 'line', 118
    new $P106, "String"
    assign $P106, "v+"
    get_global $P2046, "%piropsig"
    unless_null $P2046, vivify_178
    $P2046 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2046
  vivify_178:
    set $P2046["sleep"], $P106
.annotate 'line', 119
    new $P106, "String"
    assign $P106, "0PPii"
    get_global $P2047, "%piropsig"
    unless_null $P2047, vivify_179
    $P2047 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2047
  vivify_179:
    set $P2047["splice"], $P106
.annotate 'line', 120
    new $P106, "String"
    assign $P106, "Pss"
    get_global $P2048, "%piropsig"
    unless_null $P2048, vivify_180
    $P2048 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2048
  vivify_180:
    set $P2048["split"], $P106
.annotate 'line', 121
    new $P106, "String"
    assign $P106, "PP+"
    get_global $P2049, "%piropsig"
    unless_null $P2049, vivify_181
    $P2049 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2049
  vivify_181:
    set $P2049["sub"], $P106
.annotate 'line', 122
    new $P106, "String"
    assign $P106, "Ssii"
    get_global $P2050, "%piropsig"
    unless_null $P2050, vivify_182
    $P2050 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2050
  vivify_182:
    set $P2050["substr"], $P106
.annotate 'line', 123
    new $P106, "String"
    assign $P106, "Ss"
    get_global $P2051, "%piropsig"
    unless_null $P2051, vivify_183
    $P2051 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2051
  vivify_183:
    set $P2051["titlecase"], $P106
.annotate 'line', 124
    new $P106, "String"
    assign $P106, "vi"
    get_global $P2052, "%piropsig"
    unless_null $P2052, vivify_184
    $P2052 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2052
  vivify_184:
    set $P2052["trace"], $P106
.annotate 'line', 125
    new $P106, "String"
    assign $P106, "SP"
    get_global $P2053, "%piropsig"
    unless_null $P2053, vivify_185
    $P2053 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2053
  vivify_185:
    set $P2053["typeof"], $P106
.annotate 'line', 126
    new $P106, "String"
    assign $P106, "0P*"
    get_global $P2054, "%piropsig"
    unless_null $P2054, vivify_186
    $P2054 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2054
  vivify_186:
    set $P2054["unshift"], $P106
.annotate 'line', 127
    new $P106, "String"
    assign $P106, "Ss"
    get_global $P2055, "%piropsig"
    unless_null $P2055, vivify_187
    $P2055 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2055
  vivify_187:
    set $P2055["upcase"], $P106
.annotate 'line', 132
    new $P106, "String"
    assign $P106, "s~*:e"
    get_global $P2056, "%valflags"
    unless_null $P2056, vivify_188
    $P2056 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2056
  vivify_188:
    set $P2056["String"], $P106
.annotate 'line', 133
    new $P106, "String"
    assign $P106, "i+*:"
    get_global $P2057, "%valflags"
    unless_null $P2057, vivify_189
    $P2057 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2057
  vivify_189:
    set $P2057["Integer"], $P106
.annotate 'line', 134
    new $P106, "String"
    assign $P106, "n+*:"
    get_global $P2058, "%valflags"
    unless_null $P2058, vivify_190
    $P2058 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2058
  vivify_190:
    set $P2058["Float"], $P106
.annotate 'line', 135
    new $P106, "String"
    assign $P106, "i+*:c"
    get_global $P2059, "%valflags"
    unless_null $P2059, vivify_191
    $P2059 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2059
  vivify_191:
    set $P2059["!macro_const"], $P106
.annotate 'line', 136
    new $P106, "String"
    assign $P106, "i+*:c"
    get_global $P2060, "%valflags"
    unless_null $P2060, vivify_192
    $P2060 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2060
  vivify_192:
    set $P2060["!cclass"], $P106
.annotate 'line', 137
    new $P106, "String"
    assign $P106, "i+*:c"
    get_global $P2061, "%valflags"
    unless_null $P2061, vivify_193
    $P2061 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2061
  vivify_193:
    set $P2061["!except_severity"], $P106
.annotate 'line', 138
    new $P106, "String"
    assign $P106, "i+*:c"
    get_global $P2062, "%valflags"
    unless_null $P2062, vivify_194
    $P2062 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2062
  vivify_194:
    set $P2062["!except_types"], $P106
.annotate 'line', 139
    new $P106, "String"
    assign $P106, "i+*:c"
    get_global $P2063, "%valflags"
    unless_null $P2063, vivify_195
    $P2063 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2063
  vivify_195:
    set $P2063["!iterator"], $P106
.annotate 'line', 140
    new $P106, "String"
    assign $P106, "i+*:c"
    get_global $P2064, "%valflags"
    unless_null $P2064, vivify_196
    $P2064 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2064
  vivify_196:
    set $P2064["!socket"], $P106
.annotate 'line', 144
    new $P106, "String"
    assign $P106, ".CONTROL_RETURN, .CONTROL_OK, .CONTROL_BREAK, .CONTROL_CONTINUE, .CONTROL_TAKE, .CONTROL_LEAVE, .CONTROL_EXIT, .CONTROL_LOOP_NEXT, .CONTROL_LOOP_LAST, .CONTROL_LOOP_REDO"
    get_global $P2065, "%controltypes"
    unless_null $P2065, vivify_197
    $P2065 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2065
  vivify_197:
    set $P2065["CONTROL"], $P106
.annotate 'line', 145
    new $P106, "String"
    assign $P106, ".CONTROL_RETURN"
    get_global $P2066, "%controltypes"
    unless_null $P2066, vivify_198
    $P2066 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2066
  vivify_198:
    set $P2066["RETURN"], $P106
.annotate 'line', 146
    new $P106, "String"
    assign $P106, ".CONTROL_OK"
    get_global $P2067, "%controltypes"
    unless_null $P2067, vivify_199
    $P2067 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2067
  vivify_199:
    set $P2067["OK"], $P106
.annotate 'line', 147
    new $P106, "String"
    assign $P106, ".CONTROL_BREAK"
    get_global $P2068, "%controltypes"
    unless_null $P2068, vivify_200
    $P2068 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2068
  vivify_200:
    set $P2068["BREAK"], $P106
.annotate 'line', 148
    new $P106, "String"
    assign $P106, ".CONTROL_CONTINUE"
    get_global $P2069, "%controltypes"
    unless_null $P2069, vivify_201
    $P2069 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2069
  vivify_201:
    set $P2069["CONTINUE"], $P106
.annotate 'line', 149
    new $P106, "String"
    assign $P106, ".CONTROL_ERROR"
    get_global $P2070, "%controltypes"
    unless_null $P2070, vivify_202
    $P2070 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2070
  vivify_202:
    set $P2070["ERROR"], $P106
.annotate 'line', 150
    new $P106, "String"
    assign $P106, ".CONTROL_TAKE"
    get_global $P2071, "%controltypes"
    unless_null $P2071, vivify_203
    $P2071 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2071
  vivify_203:
    set $P2071["GATHER"], $P106
.annotate 'line', 151
    new $P106, "String"
    assign $P106, ".CONTROL_LEAVE"
    get_global $P2072, "%controltypes"
    unless_null $P2072, vivify_204
    $P2072 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2072
  vivify_204:
    set $P2072["LEAVE"], $P106
.annotate 'line', 152
    new $P106, "String"
    assign $P106, ".CONTROL_EXIT"
    get_global $P2073, "%controltypes"
    unless_null $P2073, vivify_205
    $P2073 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2073
  vivify_205:
    set $P2073["EXIT"], $P106
.annotate 'line', 153
    new $P106, "String"
    assign $P106, ".CONTROL_NEXT"
    get_global $P2074, "%controltypes"
    unless_null $P2074, vivify_206
    $P2074 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2074
  vivify_206:
    set $P2074["NEXT"], $P106
.annotate 'line', 154
    new $P106, "String"
    assign $P106, ".CONTROL_LAST"
    get_global $P2075, "%controltypes"
    unless_null $P2075, vivify_207
    $P2075 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2075
  vivify_207:
    set $P2075["LAST"], $P106
.annotate 'line', 155
    new $P106, "String"
    assign $P106, ".CONTROL_REDO"
    get_global $P2076, "%controltypes"
    unless_null $P2076, vivify_208
    $P2076 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2076
  vivify_208:
    set $P2076["REDO"], $P106
.annotate 'line', 160
    new $P106, "Integer"
    assign $P106, 100
    set_global "$TEMPREG_BASE", $P106
.annotate 'line', 161
    new $P106, "Integer"
    assign $P106, 1000
    set_global "$UNIQUE_BASE", $P106
.annotate 'line', 164
    get_global $P106, "$UNIQUE_BASE"
    clone $P107, $P106
    set_global "$serno", $P107
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "shallow_clone_hash"  :subid("12_1313886916.84408") :outer("11_1313886916.84408")
    .param pmc param_1012
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 978
    .const 'Sub' $P1016 = "13_1313886916.84408" 
    capture_lex $P1016
    new $P1011, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1011, control_1010
    push_eh $P1011
    .lex "%to_clone", param_1012
.annotate 'line', 979
    $P1014 = root_new ['parrot';'Hash']
    set $P1013, $P1014
    .lex "%ret", $P1013
.annotate 'line', 978
    find_lex $P103, "%ret"
.annotate 'line', 980
    find_lex $P104, "%to_clone"
    defined $I100, $P104
    unless $I100, for_undef_216
    iter $P103, $P104
    new $P106, 'ExceptionHandler'
    set_label $P106, loop1020_handler
    $P106."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P106
  loop1020_test:
    unless $P103, loop1020_done
    shift $P105, $P103
  loop1020_redo:
    .const 'Sub' $P1016 = "13_1313886916.84408" 
    capture_lex $P1016
    $P1016($P105)
  loop1020_next:
    goto loop1020_test
  loop1020_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, 'type'
    eq $P108, .CONTROL_LOOP_NEXT, loop1020_next
    eq $P108, .CONTROL_LOOP_REDO, loop1020_redo
  loop1020_done:
    pop_eh 
  for_undef_216:
.annotate 'line', 978
    find_lex $P103, "%ret"
    .return ($P103)
  control_1010:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1015"  :anon :subid("13_1313886916.84408") :outer("12_1313886916.84408")
    .param pmc param_1017
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 980
    .lex "$_", param_1017
.annotate 'line', 981
    find_lex $P106, "$_"
    find_lex $P1018, "%to_clone"
    unless_null $P1018, vivify_217
    $P1018 = root_new ['parrot';'Hash']
  vivify_217:
    set $P107, $P1018[$P106]
    unless_null $P107, vivify_218
    new $P107, "Undef"
  vivify_218:
    find_lex $P108, "$_"
    find_lex $P1019, "%ret"
    unless_null $P1019, vivify_219
    $P1019 = root_new ['parrot';'Hash']
    store_lex "%ret", $P1019
  vivify_219:
    set $P1019[$P108], $P107
.annotate 'line', 980
    .return ($P107)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "to_post"  :subid("14_1313886916.84408") :method :outer("11_1313886916.84408")
    .param pmc param_1025
    .param pmc param_1026 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 174
    .const 'Sub' $P1035 = "15_1313886916.84408" 
    capture_lex $P1035
    new $P1024, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1024, control_1023
    push_eh $P1024
    .lex "self", self
    .lex "$past", param_1025
    .lex "%options", param_1026
.annotate 'line', 181
    $P1028 = root_new ['parrot';'ResizablePMCArray']
    set $P1027, $P1028
    .lex "@*BLOCKPAST", $P1027
.annotate 'line', 182
    new $P105, "Undef"
    set $P1029, $P105
    .lex "$*SUB", $P1029
.annotate 'line', 183
    $P1031 = root_new ['parrot';'Hash']
    set $P1030, $P1031
    .lex "%tempregs", $P1030
.annotate 'line', 175
    $P1032 = root_new ['parrot';'Hash']
    find_lex $P106, "self"
    setattribute $P106, "%!symtable", $P1032
.annotate 'line', 177
    get_global $P106, "@?BLOCK"
    defined $I100, $P106
    if $I100, unless_1033_end
.annotate 'line', 178
    new $P107, "ResizablePMCArray"
    set_global "@?BLOCK", $P107
  unless_1033_end:
.annotate 'line', 181
    get_global $P106, "@?BLOCK"
    store_lex "@*BLOCKPAST", $P106
.annotate 'line', 174
    find_lex $P106, "$*SUB"
    unless_null $P106, vivify_220
    get_hll_global $P106, "$SUB"
    unless_null $P106, vivify_221
    die "Contextual $*SUB not found"
  vivify_221:
  vivify_220:
.annotate 'line', 183
    find_dynamic_lex $P106, "%*TEMPREGS"
    store_lex "%tempregs", $P106
.annotate 'line', 185
    .const 'Sub' $P1035 = "15_1313886916.84408" 
    capture_lex $P1035
    $P106 = $P1035()
.annotate 'line', 174
    .return ($P106)
  control_1023:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1034"  :anon :subid("15_1313886916.84408") :outer("14_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 186
    $P1037 = root_new ['parrot';'Hash']
    set $P1036, $P1037
    .lex "%*TEMPREGS", $P1036
.annotate 'line', 185
    find_lex $P106, "%*TEMPREGS"
    unless_null $P106, vivify_222
    get_hll_global $P106, "%TEMPREGS"
    unless_null $P106, vivify_223
    die "Contextual %*TEMPREGS not found"
  vivify_223:
  vivify_222:
.annotate 'line', 187
    find_lex $P106, "%tempregs"
    defined $I100, $P106
    if $I100, if_1038
.annotate 'line', 191
    find_lex $P107, "self"
    $P108 = $P107."tempreg_frame"()
    store_lex "%*TEMPREGS", $P108
.annotate 'line', 190
    goto if_1038_end
  if_1038:
.annotate 'line', 188
    find_lex $P107, "%tempregs"
    store_lex "%*TEMPREGS", $P107
  if_1038_end:
.annotate 'line', 194
    find_lex $P106, "self"
    find_lex $P107, "$past"
    $P108 = $P106."as_post"($P107, "v" :named("rtype"))
.annotate 'line', 185
    .return ($P108)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "escape"  :subid("16_1313886916.84408") :method :outer("11_1313886916.84408")
    .param pmc param_1042
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 201
    new $P1041, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1041, control_1040
    push_eh $P1041
    .lex "self", self
    .lex "$str", param_1042
.annotate 'line', 202
    new $P105, "Undef"
    set $P1043, $P105
    .lex "$estr", $P1043
    find_lex $P106, "$str"
    set $S100, $P106
    escape $S101, $S100
    new $P107, 'String'
    set $P107, $S101
    store_lex "$estr", $P107
.annotate 'line', 203
    find_lex $P107, "$estr"
    set $S100, $P107
    index $I100, $S100, unicode:"\\x"
    set $N100, $I100
    isge $I101, $N100, 0.0
    unless $I101, unless_1045
    new $P106, 'Integer'
    set $P106, $I101
    goto unless_1045_end
  unless_1045:
    find_lex $P108, "$estr"
    set $S101, $P108
    index $I102, $S101, unicode:"\\u"
    set $N101, $I102
    isge $I103, $N101, 0.0
    new $P106, 'Integer'
    set $P106, $I103
  unless_1045_end:
    if $P106, if_1044
.annotate 'line', 207
    new $P109, "String"
    assign $P109, "\""
    find_lex $P110, "$estr"
    concat $P111, $P109, $P110
    store_lex "$estr", $P111
.annotate 'line', 206
    goto if_1044_end
  if_1044:
.annotate 'line', 204
    new $P109, "String"
    assign $P109, "unicode:\""
    find_lex $P110, "$estr"
    concat $P111, $P109, $P110
    store_lex "$estr", $P111
  if_1044_end:
.annotate 'line', 209
    find_lex $P106, "$estr"
    concat $P107, $P106, "\""
    store_lex "$estr", $P107
.annotate 'line', 201
    .return ($P107)
  control_1040:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "unique"  :subid("17_1313886916.84408") :method :outer("11_1313886916.84408")
    .param pmc param_1049 :optional
    .param int has_param_1049 :opt_flag
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 217
    new $P1048, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1048, control_1047
    push_eh $P1048
    .lex "self", self
    if has_param_1049, optparam_224
    new $P105, "Undef"
    set param_1049, $P105
  optparam_224:
    .lex "$fmt", param_1049
.annotate 'line', 218
    find_lex $P106, "$fmt"
    defined $I100, $P106
    if $I100, unless_1050_end
    new $P107, "String"
    assign $P107, ""
    store_lex "$fmt", $P107
  unless_1050_end:
.annotate 'line', 219
    find_lex $P106, "$fmt"
    get_global $P107, "$serno"
    clone $P1051, $P107
    inc $P107
    concat $P108, $P106, $P1051
    store_lex "$fmt", $P108
.annotate 'line', 217
    .return ($P108)
  control_1047:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "uniquereg"  :subid("18_1313886916.84408") :method :outer("11_1313886916.84408")
    .param pmc param_1055
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 226
    new $P1054, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1054, control_1053
    push_eh $P1054
    .lex "self", self
    .lex "$rtype", param_1055
.annotate 'line', 231
    new $P105, "Undef"
    set $P1056, $P105
    .lex "$i", $P1056
.annotate 'line', 227
    find_lex $P106, "$rtype"
    if $P106, unless_1057_end
    find_lex $P107, "self"
    $P107."panic"("rtype not set")
  unless_1057_end:
.annotate 'line', 229
    find_lex $P106, "$rtype"
    set $S100, $P106
    iseq $I100, $S100, "v"
    unless $I100, if_1058_end
    new $P107, "Exception"
    set $P107['type'], .CONTROL_RETURN
    new $P108, "String"
    assign $P108, ""
    setattribute $P107, 'payload', $P108
    throw $P107
  if_1058_end:
.annotate 'line', 231
    find_lex $P106, "$rtype"
    set $S100, $P106
    index $I100, "Ss~Nn+Ii", $S100
    new $P107, 'Integer'
    set $P107, $I100
    store_lex "$i", $P107
.annotate 'line', 232
    new $P106, "String"
    assign $P106, "P"
    store_lex "$rtype", $P106
.annotate 'line', 233
    find_lex $P106, "$i"
    set $N100, $P106
    islt $I100, $N100, 0.0
    if $I100, unless_1059_end
    find_lex $P107, "$i"
    set $I101, $P107
    substr $S100, "SSSNNNII", $I101, 1
    new $P108, 'String'
    set $P108, $S100
    store_lex "$rtype", $P108
  unless_1059_end:
.annotate 'line', 234
    new $P106, "String"
    assign $P106, "$"
    find_lex $P107, "$rtype"
    concat $P108, $P106, $P107
    store_lex "$rtype", $P108
.annotate 'line', 236
    find_lex $P106, "self"
    find_lex $P107, "$rtype"
    $P108 = $P106."unique"($P107)
.annotate 'line', 226
    .return ($P108)
  control_1053:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "tempreg_frame"  :subid("19_1313886916.84408") :method :outer("11_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 243
    new $P1062, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1062, control_1061
    push_eh $P1062
    .lex "self", self
.annotate 'line', 244
    $P1064 = root_new ['parrot';'Hash']
    set $P1063, $P1064
    .lex "%tempregs", $P1063
.annotate 'line', 243
    find_lex $P105, "%tempregs"
.annotate 'line', 246
    get_global $P105, "$TEMPREG_BASE"
    clone $P106, $P105
    find_lex $P1065, "%tempregs"
    unless_null $P1065, vivify_225
    $P1065 = root_new ['parrot';'Hash']
    store_lex "%tempregs", $P1065
  vivify_225:
    set $P1065["I"], $P106
.annotate 'line', 247
    get_global $P105, "$TEMPREG_BASE"
    clone $P106, $P105
    find_lex $P1066, "%tempregs"
    unless_null $P1066, vivify_226
    $P1066 = root_new ['parrot';'Hash']
    store_lex "%tempregs", $P1066
  vivify_226:
    set $P1066["N"], $P106
.annotate 'line', 248
    get_global $P105, "$TEMPREG_BASE"
    clone $P106, $P105
    find_lex $P1067, "%tempregs"
    unless_null $P1067, vivify_227
    $P1067 = root_new ['parrot';'Hash']
    store_lex "%tempregs", $P1067
  vivify_227:
    set $P1067["S"], $P106
.annotate 'line', 249
    get_global $P105, "$TEMPREG_BASE"
    clone $P106, $P105
    find_lex $P1068, "%tempregs"
    unless_null $P1068, vivify_228
    $P1068 = root_new ['parrot';'Hash']
    store_lex "%tempregs", $P1068
  vivify_228:
    set $P1068["P"], $P106
.annotate 'line', 243
    find_lex $P105, "%tempregs"
    .return ($P105)
  control_1061:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "tempreg"  :subid("20_1313886916.84408") :method :outer("11_1313886916.84408")
    .param pmc param_1072
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 268
    .const 'Sub' $P1081 = "21_1313886916.84408" 
    capture_lex $P1081
    new $P1071, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1071, control_1070
    push_eh $P1071
    .lex "self", self
    .lex "$rtype", param_1072
.annotate 'line', 273
    new $P105, "Undef"
    set $P1073, $P105
    .lex "$I0", $P1073
.annotate 'line', 280
    new $P106, "Undef"
    set $P1074, $P106
    .lex "$reg", $P1074
.annotate 'line', 281
    new $P107, "Undef"
    set $P1075, $P107
    .lex "$rnum", $P1075
.annotate 'line', 269
    find_lex $P108, "$rtype"
    if $P108, unless_1076_end
    find_lex $P109, "self"
    $P109."panic"("rtype not set")
  unless_1076_end:
.annotate 'line', 271
    find_lex $P108, "$rtype"
    set $S100, $P108
    iseq $I100, $S100, "v"
    unless $I100, if_1077_end
    new $P109, "Exception"
    set $P109['type'], .CONTROL_RETURN
    new $P110, "String"
    assign $P110, ""
    setattribute $P109, 'payload', $P110
    throw $P109
  if_1077_end:
.annotate 'line', 273
    find_lex $P108, "$rtype"
    set $S100, $P108
    index $I100, "Ss~Nn+Ii", $S100
    new $P109, 'Integer'
    set $P109, $I100
    store_lex "$I0", $P109
.annotate 'line', 274
    new $P108, "String"
    assign $P108, "P"
    store_lex "$rtype", $P108
.annotate 'line', 275
    find_lex $P108, "$I0"
    set $N100, $P108
    islt $I100, $N100, 0.0
    if $I100, unless_1078_end
    find_lex $P109, "$I0"
    set $I101, $P109
    substr $S100, "SSSNNNII", $I101, 1
    new $P110, 'String'
    set $P110, $S100
    store_lex "$rtype", $P110
  unless_1078_end:
.annotate 'line', 278
    find_dynamic_lex $P108, "%*TEMPREGS"
    unless_null $P108, vivify_229
    get_hll_global $P108, "%TEMPREGS"
    unless_null $P108, vivify_230
    die "Contextual %*TEMPREGS not found"
  vivify_230:
  vivify_229:
    if $P108, unless_1079_end
    new $P109, "Exception"
    set $P109['type'], .CONTROL_RETURN
    find_lex $P110, "self"
    new $P111, "String"
    assign $P111, "$"
    find_lex $P112, "$rtype"
    concat $P113, $P111, $P112
    $P114 = $P110."unique"($P113)
    setattribute $P109, 'payload', $P114
    throw $P109
  unless_1079_end:
.annotate 'line', 268
    find_lex $P108, "$reg"
.annotate 'line', 281
    find_lex $P108, "$rtype"
    find_dynamic_lex $P109, "%*TEMPREGS"
    unless_null $P109, vivify_231
    get_hll_global $P109, "%TEMPREGS"
    unless_null $P109, vivify_232
    die "Contextual %*TEMPREGS not found"
  vivify_232:
  vivify_231:
    set $P110, $P109[$P108]
    unless_null $P110, vivify_233
    new $P110, "Undef"
  vivify_233:
    store_lex "$rnum", $P110
.annotate 'line', 282
    new $P112, 'ExceptionHandler'
    set_label $P112, loop1085_handler
    $P112."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P112
    goto loop1085_redo
  loop1085_test:
    find_lex $P108, "$reg"
    find_dynamic_lex $P109, "%*TEMPREGS"
    unless_null $P109, vivify_234
    get_hll_global $P109, "%TEMPREGS"
    unless_null $P109, vivify_235
    die "Contextual %*TEMPREGS not found"
  vivify_235:
  vivify_234:
    set $P110, $P109[$P108]
    unless_null $P110, vivify_236
    new $P110, "Undef"
  vivify_236:
    unless $P110, loop1085_done
  loop1085_redo:
    .const 'Sub' $P1081 = "21_1313886916.84408" 
    capture_lex $P1081
    $P1081()
  loop1085_next:
    goto loop1085_test
  loop1085_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P113, exception, 'type'
    eq $P113, .CONTROL_LOOP_NEXT, loop1085_next
    eq $P113, .CONTROL_LOOP_REDO, loop1085_redo
  loop1085_done:
    pop_eh 
.annotate 'line', 268
    find_lex $P108, "$reg"
    .return ($P108)
  control_1070:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1080"  :anon :subid("21_1313886916.84408") :outer("20_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 286
    new $P111, "Undef"
    set $P1082, $P111
    .lex "$S0", $P1082
.annotate 'line', 284
    find_lex $P112, "$rnum"
    set $N100, $P112
    get_global $P113, "$UNIQUE_BASE"
    set $N101, $P113
    isge $I100, $N100, $N101
    unless $I100, if_1083_end
    new $P114, "Exception"
    set $P114['type'], .CONTROL_RETURN
    find_lex $P115, "self"
    new $P116, "String"
    assign $P116, "$"
    find_lex $P117, "$rtype"
    concat $P118, $P116, $P117
    $P119 = $P115."unique"($P118)
    setattribute $P114, 'payload', $P119
    throw $P114
  if_1083_end:
.annotate 'line', 286
    find_lex $P112, "$rnum"
    set $S100, $P112
    new $P113, 'String'
    set $P113, $S100
    store_lex "$S0", $P113
.annotate 'line', 282
    find_lex $P112, "$rnum"
    clone $P1084, $P112
    inc $P112
.annotate 'line', 288
    find_lex $P112, "$rnum"
    find_lex $P113, "$rtype"
    find_dynamic_lex $P114, "%*TEMPREGS"
    unless_null $P114, vivify_237
    get_hll_global $P114, "%TEMPREGS"
    unless_null $P114, vivify_238
    die "Contextual %*TEMPREGS not found"
  vivify_238:
    store_dynamic_lex "%*TEMPREGS", $P114
  vivify_237:
    set $P114[$P113], $P112
.annotate 'line', 289
    new $P112, "String"
    assign $P112, "$"
    find_lex $P113, "$rtype"
    concat $P114, $P112, $P113
    find_lex $P115, "$S0"
    concat $P116, $P114, $P115
    store_lex "$reg", $P116
.annotate 'line', 282
    .return ($P116)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "coerce"  :subid("22_1313886916.84408") :method :outer("11_1313886916.84408")
    .param pmc param_1089
    .param pmc param_1090
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 301
    new $P1088, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1088, control_1087
    push_eh $P1088
    .lex "self", self
    .lex "$post", param_1089
    .lex "$rtype", param_1090
.annotate 'line', 302

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
        result = self.'tempreg'(rrtype)
      coerce_reg_1:
        ##  if we haven't set the result target yet, then generate one
        ##  based on rtype.  (The case of rtype == 'r' was handled above.)
        if result goto coerce_reg_2
        result = self.'tempreg'(rtype)
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
    
.annotate 'line', 301
    .return ()
  control_1087:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "post_children"  :subid("23_1313886916.84408") :method :outer("11_1313886916.84408")
    .param pmc param_1094
    .param pmc param_1095 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 441
    .const 'Sub' $P1132 = "28_1313886916.84408" 
    capture_lex $P1132
    .const 'Sub' $P1112 = "24_1313886916.84408" 
    capture_lex $P1112
    new $P1093, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1093, control_1092
    push_eh $P1093
    .lex "self", self
    .lex "$node", param_1094
    .lex "%options", param_1095
.annotate 'line', 442
    new $P105, "Undef"
    set $P1096, $P105
    .lex "$ops", $P1096
.annotate 'line', 444
    new $P106, "Undef"
    set $P1097, $P106
    .lex "$pushop", $P1097
.annotate 'line', 447
    new $P107, "Undef"
    set $P1098, $P107
    .lex "$signature", $P1098
.annotate 'line', 448
    new $P108, "Undef"
    set $P1099, $P108
    .lex "$sigmax", $P1099
.annotate 'line', 452
    $P1101 = root_new ['parrot';'ResizablePMCArray']
    set $P1100, $P1101
    .lex "@posargs", $P1100
.annotate 'line', 453
    $P1103 = root_new ['parrot';'ResizablePMCArray']
    set $P1102, $P1103
    .lex "@namedargs", $P1102
.annotate 'line', 455
    new $P109, "Undef"
    set $P1104, $P109
    .lex "$sigidx", $P1104
.annotate 'line', 456
    new $P110, "Undef"
    set $P1105, $P110
    .lex "$rtype", $P1105
.annotate 'line', 457
    new $P111, "Undef"
    set $P1106, $P111
    .lex "$iter", $P1106
.annotate 'line', 442
    get_hll_global $P112, ["POST"], "Ops"
    find_lex $P113, "$node"
    $P114 = $P112."new"($P113 :named("node"))
    store_lex "$ops", $P114
.annotate 'line', 444
    find_lex $P113, "$node"
    $S100 = $P113."childorder"()
    iseq $I100, $S100, "right"
    if $I100, if_1107
    new $P115, "String"
    assign $P115, "push"
    set $P112, $P115
    goto if_1107_end
  if_1107:
    new $P114, "String"
    assign $P114, "unshift"
    set $P112, $P114
  if_1107_end:
    store_lex "$pushop", $P112
.annotate 'line', 447
    find_lex $P1109, "%options"
    unless_null $P1109, vivify_239
    $P1109 = root_new ['parrot';'Hash']
  vivify_239:
    set $P113, $P1109["signature"]
    unless_null $P113, vivify_240
    new $P113, "Undef"
  vivify_240:
    unless $P113, unless_1108
    set $P112, $P113
    goto unless_1108_end
  unless_1108:
    new $P114, "String"
    assign $P114, "**"
    set $P112, $P114
  unless_1108_end:
    store_lex "$signature", $P112
.annotate 'line', 448
    find_lex $P112, "$signature"
    set $S100, $P112
    length $I100, $S100
    new $P113, 'Integer'
    set $P113, $I100
    sub $P114, $P113, 1
    store_lex "$sigmax", $P114
.annotate 'line', 441
    find_lex $P112, "@posargs"
    find_lex $P112, "@namedargs"
.annotate 'line', 455
    new $P112, "Integer"
    assign $P112, 1
    store_lex "$sigidx", $P112
.annotate 'line', 456
    find_lex $P112, "$signature"
    set $S100, $P112
    find_lex $P113, "$sigidx"
    set $I100, $P113
    substr $S101, $S100, $I100, 1
    new $P114, 'String'
    set $P114, $S101
    store_lex "$rtype", $P114
.annotate 'line', 457
    find_lex $P112, "$node"
    $P113 = $P112."iterator"()
    store_lex "$iter", $P113
.annotate 'line', 458
    new $P113, 'ExceptionHandler'
    set_label $P113, loop1144_handler
    $P113."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P113
  loop1144_test:
    find_lex $P112, "$iter"
    unless $P112, loop1144_done
  loop1144_redo:
.annotate 'line', 459
    find_lex $P113, "$rtype"
    set $S100, $P113
    isne $I100, $S100, "Q"
    if $I100, if_1110
.annotate 'line', 499
    .const 'Sub' $P1132 = "28_1313886916.84408" 
    capture_lex $P1132
    $P1132()
    goto if_1110_end
  if_1110:
.annotate 'line', 459
    .const 'Sub' $P1112 = "24_1313886916.84408" 
    capture_lex $P1112
    $P1112()
  if_1110_end:
.annotate 'line', 520
    find_lex $P113, "$sigidx"
    set $N100, $P113
    find_lex $P114, "$sigmax"
    set $N101, $P114
    islt $I100, $N100, $N101
    unless $I100, if_1142_end
    find_lex $P115, "$sigidx"
    clone $P1143, $P115
    inc $P115
.annotate 'line', 522
    find_lex $P115, "$signature"
    set $S100, $P115
    find_lex $P116, "$sigidx"
    set $I101, $P116
    substr $S101, $S100, $I101, 1
    new $P117, 'String'
    set $P117, $S101
    store_lex "$rtype", $P117
  if_1142_end:
  loop1144_next:
.annotate 'line', 458
    goto loop1144_test
  loop1144_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, 'type'
    eq $P114, .CONTROL_LOOP_NEXT, loop1144_next
    eq $P114, .CONTROL_LOOP_REDO, loop1144_redo
  loop1144_done:
    pop_eh 
.annotate 'line', 526

        .local pmc ops, posargs, namedargs
        ops = find_lex '$ops'
        posargs = find_lex '@posargs'
        namedargs = find_lex '@namedargs'

        .return (ops, posargs, namedargs)
    
.annotate 'line', 441
    .return ()
  control_1092:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1131"  :anon :subid("28_1313886916.84408") :outer("23_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 499
    .const 'Sub' $P1137 = "29_1313886916.84408" 
    capture_lex $P1137
.annotate 'line', 502
    new $P117, "Undef"
    set $P1133, $P117
    .lex "$cpast", $P1133
.annotate 'line', 503
    new $P118, "Undef"
    set $P1134, $P118
    .lex "$cpost", $P1134
.annotate 'line', 502
    find_lex $P119, "$iter"
    shift $P120, $P119
    store_lex "$cpast", $P120
.annotate 'line', 503
    find_lex $P119, "self"
    find_lex $P120, "$cpast"
    $P121 = $P119."as_post"($P120, "P" :named("rtype"))
    store_lex "$cpost", $P121
.annotate 'line', 504
    find_lex $P119, "self"
    find_lex $P120, "$cpost"
    $P121 = $P119."coerce"($P120, "P")
    store_lex "$cpost", $P121
.annotate 'line', 506
    find_lex $P120, "$iter"
    if $P120, if_1135
    set $P119, $P120
    goto if_1135_end
  if_1135:
    .const 'Sub' $P1137 = "29_1313886916.84408" 
    capture_lex $P1137
    $P124 = $P1137()
    set $P119, $P124
  if_1135_end:
.annotate 'line', 499
    .return ($P119)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1136"  :anon :subid("29_1313886916.84408") :outer("28_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 507
    new $P121, "Undef"
    set $P1138, $P121
    .lex "$kpast", $P1138
.annotate 'line', 510
    new $P122, "Undef"
    set $P1139, $P122
    .lex "$kpost", $P1139
.annotate 'line', 513
    new $P123, "Undef"
    set $P1140, $P123
    .lex "$S0", $P1140
.annotate 'line', 507
    find_lex $P124, "$iter"
    shift $P125, $P124
    store_lex "$kpast", $P125
.annotate 'line', 506
    find_lex $P124, "$sigidx"
    clone $P1141, $P124
    inc $P124
.annotate 'line', 509
    find_lex $P124, "$signature"
    set $S101, $P124
    find_lex $P125, "$sigidx"
    set $I101, $P125
    substr $S102, $S101, $I101, 1
    new $P126, 'String'
    set $P126, $S102
    store_lex "$rtype", $P126
.annotate 'line', 510
    find_lex $P124, "self"
    find_lex $P125, "$kpast"
    find_lex $P126, "$rtype"
    $P127 = $P124."as_post"($P125, $P126 :named("rtype"))
    store_lex "$kpost", $P127
.annotate 'line', 511
    find_lex $P124, "self"
    find_lex $P125, "$kpost"
    find_lex $P126, "$rtype"
    $P127 = $P124."coerce"($P125, $P126)
    store_lex "$kpost", $P127
.annotate 'line', 513
    find_lex $P124, "$cpost"
    set $S101, $P124
    new $P125, 'String'
    set $P125, $S101
    concat $P126, $P125, "["
    find_lex $P127, "$kpost"
    set $S102, $P127
    concat $P128, $P126, $S102
    concat $P129, $P128, "]"
    store_lex "$S0", $P129
.annotate 'line', 514
    find_lex $P124, "$ops"
    find_lex $P125, "$kpost"
    $P126 = $P124."new"($P125)
    store_lex "$kpost", $P126
.annotate 'line', 515
    find_lex $P124, "$kpost"
    find_lex $P125, "$cpost"
    $P124."push"($P125)
.annotate 'line', 516
    find_lex $P124, "$ops"
    find_lex $P125, "$kpost"
    find_lex $P126, "$pushop"
    set $S101, $P126
    $P124.$S101($P125)
.annotate 'line', 517
    find_lex $P124, "@posargs"
    find_lex $P125, "$S0"
    $P126 = $P124."push"($P125)
.annotate 'line', 506
    .return ($P126)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1111"  :anon :subid("24_1313886916.84408") :outer("23_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 459
    .const 'Sub' $P1117 = "25_1313886916.84408" 
    capture_lex $P1117
.annotate 'line', 460
    new $P114, "Undef"
    set $P1113, $P114
    .lex "$cpast", $P1113
.annotate 'line', 461
    new $P115, "Undef"
    set $P1114, $P115
    .lex "$cpost", $P1114
.annotate 'line', 460
    find_lex $P116, "$iter"
    shift $P117, $P116
    store_lex "$cpast", $P117
.annotate 'line', 461
    find_lex $P116, "self"
    find_lex $P117, "$cpast"
    find_lex $P118, "$rtype"
    $P119 = $P116."as_post"($P117, $P118 :named("rtype"))
    store_lex "$cpost", $P119
.annotate 'line', 462
    find_lex $P116, "self"
    find_lex $P117, "$cpost"
    find_lex $P118, "$rtype"
    $P119 = $P116."coerce"($P117, $P118)
    store_lex "$cpost", $P119
.annotate 'line', 464
    get_hll_global $P117, ["PAST"], "Node"
    find_lex $P118, "$cpast"
    $P119 = $P117."ACCEPTS"($P118)
    if $P119, if_1115
.annotate 'line', 495
    find_lex $P125, "$ops"
    find_lex $P126, "$cpost"
    find_lex $P127, "$pushop"
    set $S101, $P127
    $P125.$S101($P126)
.annotate 'line', 496
    find_lex $P125, "@posargs"
    find_lex $P126, "$cpost"
    $P127 = $P125."push"($P126)
.annotate 'line', 494
    set $P116, $P127
.annotate 'line', 464
    goto if_1115_end
  if_1115:
    .const 'Sub' $P1117 = "25_1313886916.84408" 
    capture_lex $P1117
    $P124 = $P1117()
    set $P116, $P124
  if_1115_end:
.annotate 'line', 459
    .return ($P116)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1116"  :anon :subid("25_1313886916.84408") :outer("24_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 464
    .const 'Sub' $P1124 = "26_1313886916.84408" 
    capture_lex $P1124
.annotate 'line', 465
    new $P120, "Undef"
    set $P1118, $P120
    .lex "$isflat", $P1118
.annotate 'line', 466
    new $P121, "Undef"
    set $P1119, $P121
    .lex "$npast", $P1119
.annotate 'line', 467
    new $P122, "Undef"
    set $P1120, $P122
    .lex "$npost", $P1120
.annotate 'line', 465
    find_lex $P123, "$cpast"
    $P124 = $P123."flat"()
    store_lex "$isflat", $P124
.annotate 'line', 466
    find_lex $P123, "$cpast"
    $P124 = $P123."named"()
    store_lex "$npast", $P124
.annotate 'line', 464
    find_lex $P123, "$npost"
.annotate 'line', 468
    find_lex $P125, "$rtype"
    set $S101, $P125
    iseq $I101, $S101, ":"
    if $I101, if_1122
    new $P124, 'Integer'
    set $P124, $I101
    goto if_1122_end
  if_1122:
    find_lex $P126, "$npast"
    set $P124, $P126
  if_1122_end:
    if $P124, if_1121
.annotate 'line', 484
    find_lex $P131, "$isflat"
    if $P131, if_1130
.annotate 'line', 489
    find_lex $P132, "$ops"
    find_lex $P133, "$cpost"
    find_lex $P134, "$pushop"
    set $S102, $P134
    $P132.$S102($P133)
.annotate 'line', 490
    find_lex $P132, "@posargs"
    find_lex $P133, "$cpost"
    $P134 = $P132."push"($P133)
.annotate 'line', 488
    set $P129, $P134
.annotate 'line', 484
    goto if_1130_end
  if_1130:
.annotate 'line', 485
    find_lex $P132, "$ops"
    find_lex $P133, "$cpost"
    find_lex $P134, "$pushop"
    set $S102, $P134
    $P132.$S102($P133)
.annotate 'line', 486
    find_lex $P132, "@posargs"
    find_lex $P133, "$cpost"
    set $S102, $P133
    new $P134, 'String'
    set $P134, $S102
    concat $P135, $P134, " :flat"
    $P136 = $P132."push"($P135)
.annotate 'line', 484
    set $P129, $P136
  if_1130_end:
.annotate 'line', 483
    set $P123, $P129
.annotate 'line', 468
    goto if_1121_end
  if_1121:
    .const 'Sub' $P1124 = "26_1313886916.84408" 
    capture_lex $P1124
    $P128 = $P1124()
    set $P123, $P128
  if_1121_end:
.annotate 'line', 464
    .return ($P123)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1123"  :anon :subid("26_1313886916.84408") :outer("25_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 468
    .const 'Sub' $P1128 = "27_1313886916.84408" 
    capture_lex $P1128
.annotate 'line', 469
    new $P127, "Undef"
    set $P1125, $P127
    .lex "$S0", $P1125
    find_lex $P128, "$cpost"
    set $S102, $P128
    new $P129, 'String'
    set $P129, $S102
    store_lex "$S0", $P129
.annotate 'line', 470
    find_lex $P128, "$isflat"
    if $P128, if_1126
.annotate 'line', 473
    .const 'Sub' $P1128 = "27_1313886916.84408" 
    capture_lex $P1128
    $P1128()
    goto if_1126_end
  if_1126:
.annotate 'line', 471
    find_lex $P129, "$S0"
    concat $P130, $P129, " :named :flat"
    store_lex "$S0", $P130
  if_1126_end:
.annotate 'line', 480
    find_lex $P128, "$ops"
    find_lex $P129, "$cpost"
    find_lex $P130, "$pushop"
    set $S102, $P130
    $P128.$S102($P129)
.annotate 'line', 481
    find_lex $P128, "@namedargs"
    find_lex $P129, "$S0"
    $P130 = $P128."push"($P129)
.annotate 'line', 468
    .return ($P130)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1127"  :anon :subid("27_1313886916.84408") :outer("26_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 477
    new $P129, "Undef"
    set $P1129, $P129
    .lex "$S1", $P1129
.annotate 'line', 474
    find_lex $P130, "self"
    find_lex $P131, "$npast"
    $P132 = $P130."as_post"($P131, "~" :named("rtype"))
    store_lex "$npost", $P132
.annotate 'line', 475
    find_lex $P130, "$ops"
    find_lex $P131, "$cpost"
    $P132 = $P130."new"($P131)
    store_lex "$cpost", $P132
.annotate 'line', 476
    find_lex $P130, "$cpost"
    find_lex $P131, "$npost"
    $P130."push"($P131)
.annotate 'line', 477
    find_lex $P130, "$npost"
    set $S102, $P130
    new $P131, 'String'
    set $P131, $S102
    store_lex "$S1", $P131
.annotate 'line', 478
    find_lex $P130, "$S0"
    concat $P131, $P130, " :named("
    find_lex $P132, "$S1"
    concat $P133, $P131, $P132
    concat $P134, $P133, ")"
    store_lex "$S0", $P134
.annotate 'line', 473
    .return ($P134)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("30_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,_)
    .param pmc param_1148
    .param pmc param_1149 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 552
    new $P1147, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1147, control_1146
    push_eh $P1147
    .lex "self", self
    .lex "$node", param_1148
    .lex "%options", param_1149
.annotate 'line', 553
    new $P105, "Undef"
    set $P1150, $P105
    .lex "$what", $P1150
.annotate 'line', 552
    find_lex $P106, "$what"
.annotate 'line', 555
    find_lex $P106, "$node"
    isnull $I100, $P106
    if $I100, if_1151
.annotate 'line', 559
    new $P107, "String"
    assign $P107, "node of type "
    find_lex $P108, "$node"
    typeof $S100, $P108
    concat $P109, $P107, $S100
    store_lex "$what", $P109
.annotate 'line', 558
    goto if_1151_end
  if_1151:
.annotate 'line', 556
    new $P107, "String"
    assign $P107, "a null node"
    store_lex "$what", $P107
  if_1151_end:
.annotate 'line', 562
    find_lex $P106, "self"
    new $P107, "String"
    assign $P107, "PAST::Compiler can't compile "
    find_lex $P108, "$what"
    concat $P109, $P107, $P108
    $P110 = $P106."panic"($P109)
.annotate 'line', 552
    .return ($P110)
  control_1146:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("31_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["Undef"])
    .param pmc param_1155
    .param pmc param_1156 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 568
    new $P1154, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1154, control_1153
    push_eh $P1154
    .lex "self", self
    .lex "$node", param_1155
    .lex "%options", param_1156
.annotate 'line', 569
    get_hll_global $P105, ["POST"], "Ops"
    find_lex $P106, "self"
    $P107 = $P106."tempreg"("P")
    $P108 = $P105."new"($P107 :named("result"))
.annotate 'line', 568
    .return ($P108)
  control_1153:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("32_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["Integer"])
    .param pmc param_1160
    .param pmc param_1161 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 579
    new $P1159, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1159, control_1158
    push_eh $P1159
    .lex "self", self
    .lex "$node", param_1160
    .lex "%options", param_1161
.annotate 'line', 580
    find_lex $P105, "self"
    get_hll_global $P106, ["POST"], "Ops"
    find_lex $P107, "$node"
    $P108 = $P106."new"($P107 :named("result"))
    find_lex $P1162, "%options"
    unless_null $P1162, vivify_241
    $P1162 = root_new ['parrot';'Hash']
  vivify_241:
    set $P109, $P1162["rtype"]
    unless_null $P109, vivify_242
    new $P109, "Undef"
  vivify_242:
    $P110 = $P105."coerce"($P108, $P109)
.annotate 'line', 579
    .return ($P110)
  control_1158:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("33_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["Float"])
    .param pmc param_1166
    .param pmc param_1167 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 583
    new $P1165, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1165, control_1164
    push_eh $P1165
    .lex "self", self
    .lex "$node", param_1166
    .lex "%options", param_1167
.annotate 'line', 584
    find_lex $P105, "self"
    get_hll_global $P106, ["POST"], "Ops"
    find_lex $P107, "$node"
    $P108 = $P106."new"($P107 :named("result"))
    find_lex $P1168, "%options"
    unless_null $P1168, vivify_243
    $P1168 = root_new ['parrot';'Hash']
  vivify_243:
    set $P109, $P1168["rtype"]
    unless_null $P109, vivify_244
    new $P109, "Undef"
  vivify_244:
    $P110 = $P105."coerce"($P108, $P109)
.annotate 'line', 583
    .return ($P110)
  control_1164:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("34_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["String"])
    .param pmc param_1172
    .param pmc param_1173 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 587
    new $P1171, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1171, control_1170
    push_eh $P1171
    .lex "self", self
    .lex "$node", param_1172
    .lex "%options", param_1173
.annotate 'line', 588
    new $P105, "Undef"
    set $P1174, $P105
    .lex "$value", $P1174
    find_lex $P106, "self"
    find_lex $P107, "$node"
    $P108 = $P106."escape"($P107)
    store_lex "$value", $P108
.annotate 'line', 589
    find_lex $P106, "self"
    get_hll_global $P107, ["POST"], "Ops"
    find_lex $P108, "$value"
    $P109 = $P107."new"($P108 :named("result"))
    find_lex $P1175, "%options"
    unless_null $P1175, vivify_245
    $P1175 = root_new ['parrot';'Hash']
  vivify_245:
    set $P110, $P1175["rtype"]
    unless_null $P110, vivify_246
    new $P110, "Undef"
  vivify_246:
    $P111 = $P106."coerce"($P109, $P110)
.annotate 'line', 587
    .return ($P111)
  control_1170:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_vivipost"  :subid("35_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["String"])
    .param pmc param_1179
    .param pmc param_1180 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 598
    new $P1178, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1178, control_1177
    push_eh $P1178
    .lex "self", self
    .lex "$node", param_1179
    .lex "%options", param_1180
.annotate 'line', 599
    new $P105, "Undef"
    set $P1181, $P105
    .lex "$result", $P1181
.annotate 'line', 600
    new $P106, "Undef"
    set $P1182, $P106
    .lex "$s", $P1182
.annotate 'line', 599
    find_lex $P107, "self"
    $P108 = $P107."tempreg"("P")
    store_lex "$result", $P108
.annotate 'line', 600
    find_lex $P107, "self"
    find_lex $P108, "$node"
    $P109 = $P107."escape"($P108)
    store_lex "$s", $P109
.annotate 'line', 601
    get_hll_global $P107, ["POST"], "Op"
    find_lex $P108, "$result"
    find_lex $P109, "$s"
    find_lex $P110, "$result"
    $P111 = $P107."new"($P108, $P109, "new" :named("pirop"), $P110 :named("result"))
.annotate 'line', 598
    .return ($P111)
  control_1177:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_vivipost"  :subid("36_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,_)
    .param pmc param_1186
    .param pmc param_1187 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 606
    new $P1185, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1185, control_1184
    push_eh $P1185
    .lex "self", self
    .lex "$node", param_1186
    .lex "%options", param_1187
.annotate 'line', 607
    find_lex $P105, "self"
    find_lex $P106, "$node"
    find_lex $P107, "%options"
    $P108 = $P105."as_post"($P106, $P107 :flat)
.annotate 'line', 606
    .return ($P108)
  control_1184:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("37_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["PAST";"Node"])
    .param pmc param_1191
    .param pmc param_1192 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 622
    new $P1190, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1190, control_1189
    push_eh $P1190
    .lex "self", self
    .lex "$node", param_1191
    .lex "%options", param_1192
.annotate 'line', 623
    find_lex $P105, "self"
    find_lex $P106, "$node"
    find_lex $P107, "%options"
    $P108 = $P105."node_as_post"($P106, $P107)
.annotate 'line', 622
    .return ($P108)
  control_1189:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "node_as_post"  :subid("38_1313886916.84408") :method :outer("11_1313886916.84408")
    .param pmc param_1196
    .param pmc param_1197
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 627
    new $P1195, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1195, control_1194
    push_eh $P1195
    .lex "self", self
    .lex "$node", param_1196
    .lex "%options", param_1197
.annotate 'line', 628
    new $P105, "Undef"
    set $P1198, $P105
    .lex "$rtype", $P1198
.annotate 'line', 630
    new $P106, "Undef"
    set $P1199, $P106
    .lex "$signature", $P1199
.annotate 'line', 636
    new $P107, "Undef"
    set $P1200, $P107
    .lex "$ops", $P1200
.annotate 'line', 637
    new $P108, "Undef"
    set $P1201, $P108
    .lex "$result", $P1201
.annotate 'line', 638
    new $P109, "Undef"
    set $P1202, $P109
    .lex "$I0", $P1202
.annotate 'line', 644
    new $P110, "Undef"
    set $P1203, $P110
    .lex "$eh", $P1203
.annotate 'line', 628
    find_lex $P1204, "%options"
    unless_null $P1204, vivify_247
    $P1204 = root_new ['parrot';'Hash']
  vivify_247:
    set $P111, $P1204["rtype"]
    unless_null $P111, vivify_248
    new $P111, "Undef"
  vivify_248:
    store_lex "$rtype", $P111
.annotate 'line', 630
    find_lex $P111, "$node"
    $P112 = $P111."signature"()
    store_lex "$signature", $P112
.annotate 'line', 631
    find_lex $P111, "$signature"
    if $P111, unless_1205_end
.annotate 'line', 632
    find_lex $P112, "$node"
    $P113 = $P112."list"()
    set $N100, $P113
    set $I100, $N100
    repeat $S100, "v", $I100
    new $P114, 'String'
    set $P114, $S100
    store_lex "$signature", $P114
.annotate 'line', 633
    find_lex $P112, "$signature"
    find_lex $P113, "$rtype"
    concat $P114, $P112, $P113
    store_lex "$signature", $P114
  unless_1205_end:
.annotate 'line', 636
    find_lex $P111, "self"
    find_lex $P112, "$node"
    find_lex $P113, "$signature"
    $P114 = $P111."post_children"($P112, $P113 :named("signature"))
    store_lex "$ops", $P114
.annotate 'line', 637
    find_lex $P1206, "$ops"
    unless_null $P1206, vivify_249
    $P1206 = root_new ['parrot';'ResizablePMCArray']
  vivify_249:
    set $P111, $P1206[-1]
    unless_null $P111, vivify_250
    new $P111, "Undef"
  vivify_250:
    store_lex "$result", $P111
.annotate 'line', 638
    find_lex $P111, "$signature"
    set $S100, $P111
    substr $S101, $S100, 0, 1
    index $I100, "0123456789", $S101
    new $P112, 'Integer'
    set $P112, $I100
    store_lex "$I0", $P112
.annotate 'line', 639
    find_lex $P111, "$I0"
    set $N100, $P111
    isge $I100, $N100, 0.0
    unless $I100, if_1207_end
    find_lex $P112, "$I0"
    set $I101, $P112
    find_lex $P1208, "$ops"
    unless_null $P1208, vivify_251
    $P1208 = root_new ['parrot';'ResizablePMCArray']
  vivify_251:
    set $P113, $P1208[$I101]
    unless_null $P113, vivify_252
    new $P113, "Undef"
  vivify_252:
    store_lex "$result", $P113
  if_1207_end:
.annotate 'line', 640
    find_lex $P111, "$ops"
    find_lex $P112, "$result"
    $P111."result"($P112)
.annotate 'line', 642
    find_lex $P111, "$rtype"
    unless $P111, if_1209_end
    find_lex $P112, "self"
    find_lex $P113, "$ops"
    find_lex $P114, "$rtype"
    $P115 = $P112."coerce"($P113, $P114)
    store_lex "$ops", $P115
  if_1209_end:
.annotate 'line', 644
    find_lex $P111, "$node"
    $P112 = $P111."handlers"()
    store_lex "$eh", $P112
.annotate 'line', 645
    find_lex $P111, "$eh"
    unless $P111, if_1210_end
    find_lex $P112, "self"
    find_lex $P113, "$ops"
    find_lex $P114, "$eh"
    find_lex $P115, "$rtype"
    $P116 = $P112."wrap_handlers"($P113, $P114, $P115 :named("rtype"))
    store_lex "$ops", $P116
  if_1210_end:
.annotate 'line', 627
    find_lex $P111, "$ops"
    .return ($P111)
  control_1194:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("39_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["PAST";"Stmt"])
    .param pmc param_1214
    .param pmc param_1215 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 657
    .const 'Sub' $P1221 = "40_1313886916.84408" 
    capture_lex $P1221
    new $P1213, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1213, control_1212
    push_eh $P1213
    .lex "self", self
    .lex "$node", param_1214
    .lex "%options", param_1215
.annotate 'line', 658
    $P1217 = root_new ['parrot';'Hash']
    set $P1216, $P1217
    .lex "%outerregs", $P1216
.annotate 'line', 659
    new $P105, "Undef"
    set $P1218, $P105
    .lex "$post", $P1218
.annotate 'line', 667
    new $P106, "Undef"
    set $P1219, $P106
    .lex "$result", $P1219
.annotate 'line', 658
    find_dynamic_lex $P107, "%*TEMPREGS"
    unless_null $P107, vivify_253
    get_hll_global $P107, "%TEMPREGS"
    unless_null $P107, vivify_254
    die "Contextual %*TEMPREGS not found"
  vivify_254:
  vivify_253:
    store_lex "%outerregs", $P107
.annotate 'line', 657
    find_lex $P107, "$post"
.annotate 'line', 661
    .const 'Sub' $P1221 = "40_1313886916.84408" 
    capture_lex $P1221
    $P1221()
.annotate 'line', 667
    find_lex $P107, "$post"
    $P108 = $P107."result"()
    store_lex "$result", $P108
.annotate 'line', 669
    find_lex $P109, "%outerregs"
    if $P109, if_1227
    set $P108, $P109
    goto if_1227_end
  if_1227:
    find_lex $P1228, "%options"
    unless_null $P1228, vivify_257
    $P1228 = root_new ['parrot';'Hash']
  vivify_257:
    set $P110, $P1228["rtype"]
    unless_null $P110, vivify_258
    new $P110, "Undef"
  vivify_258:
    set $S100, $P110
    isne $I100, $S100, "v"
    new $P108, 'Integer'
    set $P108, $I100
  if_1227_end:
    if $P108, if_1226
    set $P107, $P108
    goto if_1226_end
  if_1226:
.annotate 'line', 670
    find_lex $P111, "$result"
    set $S101, $P111
    substr $S102, $S101, 0, 1
    iseq $I101, $S102, "$"
    new $P107, 'Integer'
    set $P107, $I101
  if_1226_end:
    unless $P107, if_1225_end
.annotate 'line', 672
    new $P112, "Integer"
    assign $P112, 1
    find_lex $P113, "$result"
    find_lex $P1229, "%outerregs"
    unless_null $P1229, vivify_259
    $P1229 = root_new ['parrot';'Hash']
    store_lex "%outerregs", $P1229
  vivify_259:
    set $P1229[$P113], $P112
  if_1225_end:
.annotate 'line', 657
    find_lex $P107, "$post"
    .return ($P107)
  control_1212:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1220"  :anon :subid("40_1313886916.84408") :outer("39_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 662
    $P1223 = root_new ['parrot';'Hash']
    set $P1222, $P1223
    .lex "%*TEMPREGS", $P1222
.annotate 'line', 661
    find_lex $P107, "%*TEMPREGS"
    unless_null $P107, vivify_255
    get_hll_global $P107, "%TEMPREGS"
    unless_null $P107, vivify_256
    die "Contextual %*TEMPREGS not found"
  vivify_256:
  vivify_255:
.annotate 'line', 663
    find_lex $P107, "%outerregs"
    unless $P107, if_1224_end
    find_lex $P108, "%outerregs"
    clone $P109, $P108
    store_lex "%*TEMPREGS", $P109
  if_1224_end:
.annotate 'line', 664
    find_lex $P107, "self"
    find_lex $P108, "$node"
    find_lex $P109, "%options"
    $P110 = $P107."node_as_post"($P108, $P109)
    store_lex "$post", $P110
.annotate 'line', 661
    .return ($P110)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("41_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["PAST";"Control"])
    .param pmc param_1233
    .param pmc param_1234 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 684
    new $P1232, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1232, control_1231
    push_eh $P1232
    .lex "self", self
    .lex "$node", param_1233
    .lex "%options", param_1234
.annotate 'line', 686
    $P1236 = root_new ['parrot';'Hash']
    set $P1235, $P1236
    .lex "%*TEMPREGS", $P1235
.annotate 'line', 688
    new $P105, "Undef"
    set $P1237, $P105
    .lex "$ishandled", $P1237
.annotate 'line', 689
    new $P106, "Undef"
    set $P1238, $P106
    .lex "$nothandled", $P1238
.annotate 'line', 691
    new $P107, "Undef"
    set $P1239, $P107
    .lex "$ops", $P1239
.annotate 'line', 693
    new $P108, "Undef"
    set $P1240, $P108
    .lex "$signature", $P1240
.annotate 'line', 698
    new $P109, "Undef"
    set $P1241, $P109
    .lex "$children", $P1241
.annotate 'line', 700
    new $P110, "Undef"
    set $P1242, $P110
    .lex "$handled", $P1242
.annotate 'line', 684
    find_lex $P111, "%*TEMPREGS"
    unless_null $P111, vivify_260
    get_hll_global $P111, "%TEMPREGS"
    unless_null $P111, vivify_261
    die "Contextual %*TEMPREGS not found"
  vivify_261:
  vivify_260:
.annotate 'line', 688
    get_hll_global $P111, ["POST"], "Label"
    find_lex $P112, "self"
    $P113 = $P112."unique"("handled_")
    $P114 = $P111."new"($P113 :named("result"))
    store_lex "$ishandled", $P114
.annotate 'line', 689
    get_hll_global $P111, ["POST"], "Label"
    find_lex $P112, "self"
    $P113 = $P112."unique"("nothandled_")
    $P114 = $P111."new"($P113 :named("result"))
    store_lex "$nothandled", $P114
.annotate 'line', 691
    get_hll_global $P111, ["POST"], "Ops"
    find_lex $P112, "$node"
    $P113 = $P111."new"($P112 :named("node"))
    store_lex "$ops", $P113
.annotate 'line', 693
    find_lex $P111, "$node"
    $P112 = $P111."list"()
    set $N100, $P112
    set $I100, $N100
    repeat $S100, "v", $I100
    new $P113, 'String'
    set $P113, $S100
    store_lex "$signature", $P113
.annotate 'line', 694
    find_lex $P111, "$signature"
    find_lex $P1243, "%options"
    unless_null $P1243, vivify_262
    $P1243 = root_new ['parrot';'Hash']
  vivify_262:
    set $P112, $P1243["rtype"]
    unless_null $P112, vivify_263
    new $P112, "Undef"
  vivify_263:
    concat $P113, $P111, $P112
    store_lex "$signature", $P113
.annotate 'line', 696
    find_lex $P111, "$ops"
    $P111."push_pirop"(".local pmc exception")
.annotate 'line', 697
    find_lex $P111, "$ops"
    $P111."push_pirop"(".get_results (exception)")
.annotate 'line', 698
    find_lex $P111, "self"
    find_lex $P112, "$node"
    find_lex $P113, "$signature"
    $P114 = $P111."post_children"($P112, $P113 :named("signature"))
    store_lex "$children", $P114
.annotate 'line', 699
    find_lex $P111, "$ops"
    find_lex $P112, "$children"
    $P111."push"($P112)
.annotate 'line', 700
    find_lex $P111, "self"
    $P112 = $P111."uniquereg"("I")
    store_lex "$handled", $P112
.annotate 'line', 702
    find_lex $P111, "$ops"
    find_lex $P112, "$handled"
    $P111."push_pirop"("set", $P112, "exception[\"handled\"]")
.annotate 'line', 703
    find_lex $P111, "$ops"
    find_lex $P112, "$handled"
    find_lex $P113, "$nothandled"
    $P111."push_pirop"("ne", $P112, 1, $P113)
.annotate 'line', 704
    find_lex $P111, "$ops"
    find_lex $P112, "$ishandled"
    $P111."push"($P112)
.annotate 'line', 705
    find_lex $P111, "$ops"
    $P111."push_pirop"("return", "exception")
.annotate 'line', 706
    find_lex $P111, "$ops"
    find_lex $P112, "$nothandled"
    $P111."push"($P112)
.annotate 'line', 707
    find_lex $P111, "$ops"
    $P111."push_pirop"("rethrow", "exception")
.annotate 'line', 684
    find_lex $P111, "$ops"
    .return ($P111)
  control_1231:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "wrap_handlers"  :subid("42_1313886916.84408") :method :outer("11_1313886916.84408")
    .param pmc param_1247
    .param pmc param_1248
    .param pmc param_1249 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 711
    .const 'Sub' $P1259 = "43_1313886916.84408" 
    capture_lex $P1259
    new $P1246, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1246, control_1245
    push_eh $P1246
    .lex "self", self
    .lex "$child", param_1247
    .lex "$ehs", param_1248
    .lex "%options", param_1249
.annotate 'line', 712
    new $P105, "Undef"
    set $P1250, $P105
    .lex "$rtype", $P1250
.annotate 'line', 715
    $P1252 = root_new ['parrot';'Hash']
    set $P1251, $P1252
    .lex "%*TEMPREGS", $P1251
.annotate 'line', 717
    new $P106, "Undef"
    set $P1253, $P106
    .lex "$ops", $P1253
.annotate 'line', 718
    new $P107, "Undef"
    set $P1254, $P107
    .lex "$pops", $P1254
.annotate 'line', 719
    new $P108, "Undef"
    set $P1255, $P108
    .lex "$tail", $P1255
.annotate 'line', 720
    new $P109, "Undef"
    set $P1256, $P109
    .lex "$skip", $P1256
.annotate 'line', 712
    find_lex $P1257, "%options"
    unless_null $P1257, vivify_264
    $P1257 = root_new ['parrot';'Hash']
  vivify_264:
    set $P110, $P1257["rtype"]
    unless_null $P110, vivify_265
    new $P110, "Undef"
  vivify_265:
    store_lex "$rtype", $P110
.annotate 'line', 711
    find_lex $P110, "%*TEMPREGS"
    unless_null $P110, vivify_266
    get_hll_global $P110, "%TEMPREGS"
    unless_null $P110, vivify_267
    die "Contextual %*TEMPREGS not found"
  vivify_267:
  vivify_266:
.annotate 'line', 717
    get_hll_global $P110, ["POST"], "Ops"
    $P111 = $P110."new"()
    store_lex "$ops", $P111
.annotate 'line', 718
    get_hll_global $P110, ["POST"], "Ops"
    $P111 = $P110."new"()
    store_lex "$pops", $P111
.annotate 'line', 719
    get_hll_global $P110, ["POST"], "Ops"
    $P111 = $P110."new"()
    store_lex "$tail", $P111
.annotate 'line', 720
    get_hll_global $P110, ["POST"], "Label"
    find_lex $P111, "self"
    $P112 = $P111."unique"("skip_handler_")
    $P113 = $P110."new"($P112 :named("result"))
    store_lex "$skip", $P113
.annotate 'line', 722
    find_lex $P111, "$ehs"
    defined $I100, $P111
    unless $I100, for_undef_268
    iter $P110, $P111
    new $P117, 'ExceptionHandler'
    set_label $P117, loop1279_handler
    $P117."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P117
  loop1279_test:
    unless $P110, loop1279_done
    shift $P112, $P110
  loop1279_redo:
    .const 'Sub' $P1259 = "43_1313886916.84408" 
    capture_lex $P1259
    $P1259($P112)
  loop1279_next:
    goto loop1279_test
  loop1279_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P118, exception, 'type'
    eq $P118, .CONTROL_LOOP_NEXT, loop1279_next
    eq $P118, .CONTROL_LOOP_REDO, loop1279_redo
  loop1279_done:
    pop_eh 
  for_undef_268:
.annotate 'line', 755
    find_lex $P110, "$ops"
    find_lex $P111, "$child"
    $P110."push"($P111)
.annotate 'line', 757
    find_lex $P110, "$ops"
    find_lex $P111, "$pops"
    $P110."push"($P111)
.annotate 'line', 758
    find_lex $P110, "$ops"
    find_lex $P111, "$skip"
    $P110."push_pirop"("goto", $P111)
.annotate 'line', 759
    find_lex $P110, "$ops"
    find_lex $P111, "$tail"
    $P110."push"($P111)
.annotate 'line', 760
    find_lex $P110, "$ops"
    find_lex $P111, "$skip"
    $P110."push"($P111)
.annotate 'line', 711
    find_lex $P110, "$ops"
    .return ($P110)
  control_1245:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1258"  :anon :subid("43_1313886916.84408") :outer("42_1313886916.84408")
    .param pmc param_1264
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 722
    .const 'Sub' $P1276 = "45_1313886916.84408" 
    capture_lex $P1276
    .const 'Sub' $P1269 = "44_1313886916.84408" 
    capture_lex $P1269
.annotate 'line', 723
    new $P113, "Undef"
    set $P1260, $P113
    .lex "$node", $P1260
.annotate 'line', 724
    new $P114, "Undef"
    set $P1261, $P114
    .lex "$label", $P1261
.annotate 'line', 725
    new $P115, "Undef"
    set $P1262, $P115
    .lex "$ehreg", $P1262
.annotate 'line', 730
    new $P116, "Undef"
    set $P1263, $P116
    .lex "$type", $P1263
    .lex "$_", param_1264
.annotate 'line', 723
    find_lex $P117, "$_"
    store_lex "$node", $P117
.annotate 'line', 724
    get_hll_global $P117, ["POST"], "Label"
    find_lex $P118, "self"
    $P119 = $P118."unique"("control_")
    $P120 = $P117."new"($P119 :named("result"))
    store_lex "$label", $P120
.annotate 'line', 725
    find_lex $P117, "self"
    $P118 = $P117."uniquereg"("P")
    store_lex "$ehreg", $P118
.annotate 'line', 727
    find_lex $P117, "$ops"
    find_lex $P118, "$ehreg"
    $P117."push_pirop"("new", $P118, "'ExceptionHandler'")
.annotate 'line', 728
    find_lex $P117, "$ops"
    find_lex $P118, "$ehreg"
    find_lex $P119, "$label"
    $P117."push_pirop"("set_label", $P118, $P119)
.annotate 'line', 730
    find_lex $P117, "$node"
    $P118 = $P117."handle_types"()
    store_lex "$type", $P118
.annotate 'line', 731
    find_lex $P118, "$type"
    if $P118, if_1266
    set $P117, $P118
    goto if_1266_end
  if_1266:
    find_lex $P119, "$type"
    get_global $P1267, "%controltypes"
    unless_null $P1267, vivify_269
    $P1267 = root_new ['parrot';'Hash']
  vivify_269:
    set $P120, $P1267[$P119]
    unless_null $P120, vivify_270
    new $P120, "Undef"
  vivify_270:
    store_lex "$type", $P120
    set $P117, $P120
  if_1266_end:
    unless $P117, if_1265_end
    .const 'Sub' $P1269 = "44_1313886916.84408" 
    capture_lex $P1269
    $P1269()
  if_1265_end:
.annotate 'line', 737
    find_lex $P117, "$node"
    $P118 = $P117."handle_types_except"()
    store_lex "$type", $P118
.annotate 'line', 738
    find_lex $P118, "$type"
    if $P118, if_1273
    set $P117, $P118
    goto if_1273_end
  if_1273:
    find_lex $P119, "$type"
    get_global $P1274, "%controltypes"
    unless_null $P1274, vivify_273
    $P1274 = root_new ['parrot';'Hash']
  vivify_273:
    set $P120, $P1274[$P119]
    unless_null $P120, vivify_274
    new $P120, "Undef"
  vivify_274:
    store_lex "$type", $P120
    set $P117, $P120
  if_1273_end:
    unless $P117, if_1272_end
    .const 'Sub' $P1276 = "45_1313886916.84408" 
    capture_lex $P1276
    $P1276()
  if_1272_end:
.annotate 'line', 745
    find_lex $P117, "$ops"
    find_lex $P118, "$ehreg"
    $P117."push_pirop"("push_eh", $P118)
.annotate 'line', 748
    find_lex $P117, "$pops"
    $P117."push_pirop"("pop_eh")
.annotate 'line', 751
    find_lex $P117, "$tail"
    find_lex $P118, "$label"
    $P117."push"($P118)
.annotate 'line', 752
    find_lex $P117, "$tail"
    find_lex $P118, "self"
    find_lex $P119, "$node"
    find_lex $P120, "$rtype"
    $P121 = $P118."as_post"($P119, $P120 :named("rtype"))
    $P122 = $P117."push"($P121)
.annotate 'line', 722
    .return ($P122)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1268"  :anon :subid("44_1313886916.84408") :outer("43_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 732
    $P1271 = root_new ['parrot';'ResizablePMCArray']
    set $P1270, $P1271
    .lex "@types", $P1270
    find_lex $P121, "$type"
    set $S100, $P121
    split $P122, ",", $S100
    store_lex "@types", $P122
.annotate 'line', 733
    find_lex $P121, "$ops"
    find_lex $P122, "$ehreg"
    find_lex $P123, "@types"
    $P121."push_pirop"("callmethod", "\"handle_types\"", $P122, $P123 :flat)
.annotate 'line', 734
    find_dynamic_lex $P121, "$*SUB"
    unless_null $P121, vivify_271
    get_hll_global $P121, "$SUB"
    unless_null $P121, vivify_272
    die "Contextual $*SUB not found"
  vivify_272:
  vivify_271:
    $P122 = $P121."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 731
    .return ($P122)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1275"  :anon :subid("45_1313886916.84408") :outer("43_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 739
    $P1278 = root_new ['parrot';'ResizablePMCArray']
    set $P1277, $P1278
    .lex "@types", $P1277
    find_lex $P121, "$type"
    set $S100, $P121
    split $P122, ",", $S100
    store_lex "@types", $P122
.annotate 'line', 740
    find_lex $P121, "$ops"
    find_lex $P122, "$ehreg"
    find_lex $P123, "@types"
    $P121."push_pirop"("callmethod", "\"handle_types_except\"", $P122, $P123 :flat)
.annotate 'line', 742
    find_dynamic_lex $P121, "$*SUB"
    unless_null $P121, vivify_275
    get_hll_global $P121, "$SUB"
    unless_null $P121, vivify_276
    die "Contextual $*SUB not found"
  vivify_276:
  vivify_275:
    $P122 = $P121."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 738
    .return ($P122)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("46_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["PAST";"Block"])
    .param pmc param_1283
    .param pmc param_1284 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 770
    .const 'Sub' $P1308 = "47_1313886916.84408" 
    capture_lex $P1308
    new $P1282, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1282, control_1281
    push_eh $P1282
    .lex "self", self
    .lex "$node", param_1283
    .lex "%options", param_1284
.annotate 'line', 774
    new $P105, "Undef"
    set $P1285, $P105
    .lex "$name", $P1285
.annotate 'line', 775
    new $P106, "Undef"
    set $P1286, $P106
    .lex "$pirflags", $P1286
.annotate 'line', 776
    new $P107, "Undef"
    set $P1287, $P107
    .lex "$blocktype", $P1287
.annotate 'line', 777
    new $P108, "Undef"
    set $P1288, $P108
    .lex "$nsentry", $P1288
.annotate 'line', 778
    new $P109, "Undef"
    set $P1289, $P109
    .lex "$subid", $P1289
.annotate 'line', 779
    new $P110, "Undef"
    set $P1290, $P110
    .lex "$ns", $P1290
.annotate 'line', 780
    new $P111, "Undef"
    set $P1291, $P111
    .lex "$hll", $P1291
.annotate 'line', 781
    new $P112, "Undef"
    set $P1292, $P112
    .lex "$multi", $P1292
.annotate 'line', 782
    new $P113, "Undef"
    set $P1293, $P113
    .lex "$loadlibs", $P1293
.annotate 'line', 807
    new $P114, "Undef"
    set $P1294, $P114
    .lex "$bpost", $P1294
.annotate 'line', 815
    new $P115, "Undef"
    set $P1295, $P115
    .lex "$blockreg", $P1295
.annotate 'line', 816
    new $P116, "Undef"
    set $P1296, $P116
    .lex "$blockref", $P1296
.annotate 'line', 821
    new $P117, "Undef"
    set $P1297, $P117
    .lex "$outerpost", $P1297
.annotate 'line', 772
    find_dynamic_lex $P118, "@*BLOCKPAST"
    unless_null $P118, vivify_277
    get_hll_global $P118, "@BLOCKPAST"
    unless_null $P118, vivify_278
    die "Contextual @*BLOCKPAST not found"
  vivify_278:
  vivify_277:
    find_lex $P119, "$node"
    unshift $P118, $P119
.annotate 'line', 774
    find_lex $P118, "$node"
    $P119 = $P118."name"()
    store_lex "$name", $P119
.annotate 'line', 775
    find_lex $P118, "$node"
    $P119 = $P118."pirflags"()
    store_lex "$pirflags", $P119
.annotate 'line', 776
    find_lex $P118, "$node"
    $P119 = $P118."blocktype"()
    store_lex "$blocktype", $P119
.annotate 'line', 777
    find_lex $P118, "$node"
    $P119 = $P118."nsentry"()
    store_lex "$nsentry", $P119
.annotate 'line', 778
    find_lex $P118, "$node"
    $P119 = $P118."subid"()
    store_lex "$subid", $P119
.annotate 'line', 779
    find_lex $P118, "$node"
    $P119 = $P118."namespace"()
    store_lex "$ns", $P119
.annotate 'line', 780
    find_lex $P118, "$node"
    $P119 = $P118."hll"()
    store_lex "$hll", $P119
.annotate 'line', 781
    find_lex $P118, "$node"
    $P119 = $P118."multi"()
    store_lex "$multi", $P119
.annotate 'line', 782
    find_lex $P118, "$node"
    $P119 = $P118."loadlibs"()
    store_lex "$loadlibs", $P119
.annotate 'line', 785
    find_lex $P118, "$name"
    defined $I100, $P118
    if $I100, unless_1298_end
    new $P119, "String"
    assign $P119, ""
    store_lex "$name", $P119
  unless_1298_end:
.annotate 'line', 786
    find_lex $P118, "$pirflags"
    defined $I100, $P118
    if $I100, unless_1299_end
    new $P119, "String"
    assign $P119, ""
    store_lex "$pirflags", $P119
  unless_1299_end:
.annotate 'line', 787
    find_lex $P118, "$blocktype"
    defined $I100, $P118
    if $I100, unless_1300_end
    new $P119, "String"
    assign $P119, ""
    store_lex "$blocktype", $P119
  unless_1300_end:
.annotate 'line', 790
    find_lex $P118, "$nsentry"
    defined $I100, $P118
    unless $I100, if_1301_end
.annotate 'line', 791
    find_lex $P119, "$nsentry"
    if $P119, if_1302
.annotate 'line', 796
    find_lex $P120, "$pirflags"
    concat $P121, $P120, " :anon"
    store_lex "$pirflags", $P121
.annotate 'line', 795
    goto if_1302_end
  if_1302:
.annotate 'line', 793
    find_lex $P120, "$pirflags"
    concat $P121, $P120, " :nsentry("
    find_lex $P122, "self"
    find_lex $P123, "$nsentry"
    $S100 = $P122."escape"($P123)
    concat $P124, $P121, $S100
    concat $P125, $P124, ")"
    store_lex "$pirflags", $P125
  if_1302_end:
  if_1301_end:
.annotate 'line', 801
    find_lex $P118, "$name"
    if $P118, unless_1303_end
.annotate 'line', 802
    find_lex $P119, "self"
    $P120 = $P119."unique"("_block")
    store_lex "$name", $P120
.annotate 'line', 803
    find_lex $P120, "$ns"
    unless $P120, unless_1305
    set $P119, $P120
    goto unless_1305_end
  unless_1305:
    find_lex $P121, "$nsentry"
    set $P119, $P121
  unless_1305_end:
    if $P119, unless_1304_end
    find_lex $P122, "$pirflags"
    concat $P123, $P122, " :anon"
    store_lex "$pirflags", $P123
  unless_1304_end:
  unless_1303_end:
.annotate 'line', 807
    get_hll_global $P118, ["POST"], "Sub"
    find_lex $P119, "$node"
    find_lex $P120, "$name"
    find_lex $P121, "$blocktype"
    find_lex $P122, "$ns"
    find_lex $P123, "$hll"
    find_lex $P124, "$subid"
    find_lex $P125, "$multi"
    find_lex $P126, "$loadlibs"
    $P127 = $P118."new"($P119 :named("node"), $P120 :named("name"), $P121 :named("blocktype"), $P122 :named("namespace"), $P123 :named("hll"), $P124 :named("subid"), $P125 :named("multi"), $P126 :named("loadlibs"))
    store_lex "$bpost", $P127
.annotate 'line', 812
    find_lex $P118, "$pirflags"
    unless $P118, if_1306_end
    find_lex $P119, "$bpost"
    find_lex $P120, "$pirflags"
    $P119."pirflags"($P120)
  if_1306_end:
.annotate 'line', 815
    find_lex $P118, "self"
    $P119 = $P118."uniquereg"("P")
    store_lex "$blockreg", $P119
.annotate 'line', 816
    new $P118, 'String'
    set $P118, ".const 'Sub' "
    find_lex $P119, "$blockreg"
    concat $P120, $P118, $P119
    concat $P121, $P120, " = "
    find_lex $P122, "self"
    find_lex $P123, "$bpost"
    $P124 = $P123."subid"()
    $S100 = $P122."escape"($P124)
    concat $P125, $P121, $S100
    store_lex "$blockref", $P125
.annotate 'line', 821
    find_dynamic_lex $P118, "$*SUB"
    unless_null $P118, vivify_279
    get_hll_global $P118, "$SUB"
    unless_null $P118, vivify_280
    die "Contextual $*SUB not found"
  vivify_280:
  vivify_279:
    store_lex "$outerpost", $P118
.annotate 'line', 822
    .const 'Sub' $P1308 = "47_1313886916.84408" 
    capture_lex $P1308
    $P1308()
.annotate 'line', 974
    find_dynamic_lex $P118, "@*BLOCKPAST"
    unless_null $P118, vivify_303
    get_hll_global $P118, "@BLOCKPAST"
    unless_null $P118, vivify_304
    die "Contextual @*BLOCKPAST not found"
  vivify_304:
  vivify_303:
    shift $P119, $P118
.annotate 'line', 770
    find_lex $P118, "$bpost"
    .return ($P118)
  control_1281:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P119, exception, "payload"
    .return ($P119)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1307"  :anon :subid("47_1313886916.84408") :outer("46_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 822
    .const 'Sub' $P1381 = "55_1313886916.84408" 
    capture_lex $P1381
    .const 'Sub' $P1370 = "54_1313886916.84408" 
    capture_lex $P1370
    .const 'Sub' $P1364 = "53_1313886916.84408" 
    capture_lex $P1364
    .const 'Sub' $P1338 = "50_1313886916.84408" 
    capture_lex $P1338
    .const 'Sub' $P1329 = "49_1313886916.84408" 
    capture_lex $P1329
    .const 'Sub' $P1322 = "48_1313886916.84408" 
    capture_lex $P1322
.annotate 'line', 823
    new $P118, "Undef"
    set $P1309, $P118
    .lex "$*SUB", $P1309
.annotate 'line', 825
    new $P119, "Undef"
    set $P1310, $P119
    .lex "$islexical", $P1310
.annotate 'line', 839
    $P1312 = root_new ['parrot';'Hash']
    set $P1311, $P1312
    .lex "%outersym", $P1311
.annotate 'line', 840
    $P1314 = root_new ['parrot';'Hash']
    set $P1313, $P1314
    .lex "%symtable", $P1313
.annotate 'line', 858
    $P1316 = root_new ['parrot';'Hash']
    set $P1315, $P1316
    .lex "%outerregs", $P1315
.annotate 'line', 860
    new $P120, "Undef"
    set $P1317, $P120
    .lex "$compiler", $P1317
.annotate 'line', 944
    new $P121, "Undef"
    set $P1318, $P121
    .lex "$rtype", $P1318
.annotate 'line', 823
    find_lex $P122, "$bpost"
    store_lex "$*SUB", $P122
.annotate 'line', 825
    find_lex $P122, "$node"
    $P123 = $P122."lexical"()
    store_lex "$islexical", $P123
.annotate 'line', 826
    find_lex $P122, "$islexical"
    unless $P122, if_1319_end
.annotate 'line', 827
    find_lex $P123, "$bpost"
    find_lex $P124, "$outerpost"
    $P123."outer"($P124)
.annotate 'line', 830
    find_lex $P123, "$outerpost"
    defined $I100, $P123
    unless $I100, if_1320_end
    .const 'Sub' $P1322 = "48_1313886916.84408" 
    capture_lex $P1322
    $P1322()
  if_1320_end:
  if_1319_end:
.annotate 'line', 839
    find_lex $P122, "self"
    getattribute $P1324, $P122, "%!symtable"
    unless_null $P1324, vivify_281
    $P1324 = root_new ['parrot';'Hash']
  vivify_281:
    store_lex "%outersym", $P1324
.annotate 'line', 840
    find_lex $P122, "%outersym"
    store_lex "%symtable", $P122
.annotate 'line', 842
    find_lex $P122, "$node"
    $P123 = $P122."symtable"()
    unless $P123, if_1325_end
.annotate 'line', 845
    find_lex $P124, "$node"
    $P125 = $P124."symtable"()
    store_lex "%symtable", $P125
.annotate 'line', 846
    find_lex $P1327, "%symtable"
    unless_null $P1327, vivify_282
    $P1327 = root_new ['parrot';'Hash']
  vivify_282:
    set $P124, $P1327[""]
    unless_null $P124, vivify_283
    new $P124, "Undef"
  vivify_283:
    defined $I100, $P124
    if $I100, unless_1326_end
.annotate 'line', 848
    find_lex $P125, "%symtable"
    $P126 = "shallow_clone_hash"($P125)
    store_lex "%symtable", $P126
.annotate 'line', 849
    find_lex $P126, "%outersym"
    defined $I101, $P126
    unless $I101, for_undef_284
    iter $P125, $P126
    new $P128, 'ExceptionHandler'
    set_label $P128, loop1334_handler
    $P128."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P128
  loop1334_test:
    unless $P125, loop1334_done
    shift $P127, $P125
  loop1334_redo:
    .const 'Sub' $P1329 = "49_1313886916.84408" 
    capture_lex $P1329
    $P1329($P127)
  loop1334_next:
    goto loop1334_test
  loop1334_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P130, exception, 'type'
    eq $P130, .CONTROL_LOOP_NEXT, loop1334_next
    eq $P130, .CONTROL_LOOP_REDO, loop1334_redo
  loop1334_done:
    pop_eh 
  for_undef_284:
  unless_1326_end:
  if_1325_end:
.annotate 'line', 855
    find_lex $P122, "%symtable"
    find_lex $P123, "self"
    setattribute $P123, "%!symtable", $P122
.annotate 'line', 858
    find_dynamic_lex $P122, "%*TEMPREGS"
    unless_null $P122, vivify_288
    get_hll_global $P122, "%TEMPREGS"
    unless_null $P122, vivify_289
    die "Contextual %*TEMPREGS not found"
  vivify_289:
  vivify_288:
    store_lex "%outerregs", $P122
.annotate 'line', 860
    find_lex $P122, "$node"
    $P123 = $P122."compiler"()
    store_lex "$compiler", $P123
.annotate 'line', 861
    find_lex $P122, "$compiler"
    if $P122, if_1335
.annotate 'line', 868
    .const 'Sub' $P1338 = "50_1313886916.84408" 
    capture_lex $P1338
    $P1338()
    goto if_1335_end
  if_1335:
.annotate 'line', 864
    find_lex $P123, "$bpost"
    find_lex $P124, "$compiler"
    $P123."compiler"($P124)
.annotate 'line', 865
    find_lex $P123, "$bpost"
    find_lex $P124, "$node"
    $P125 = $P124."compiler_args"()
    $P123."compiler_args"($P125)
.annotate 'line', 866
    find_lex $P123, "$bpost"
    find_lex $P1336, "$node"
    unless_null $P1336, vivify_296
    $P1336 = root_new ['parrot';'ResizablePMCArray']
  vivify_296:
    set $P124, $P1336[0]
    unless_null $P124, vivify_297
    new $P124, "Undef"
  vivify_297:
    $P123."push"($P124)
  if_1335_end:
.annotate 'line', 931
    find_lex $P122, "$node"
    exists $I100, $P122["loadinit"]
    unless $I100, if_1362_end
    .const 'Sub' $P1364 = "53_1313886916.84408" 
    capture_lex $P1364
    $P1364()
  if_1362_end:
.annotate 'line', 941
    find_lex $P122, "%outersym"
    find_lex $P123, "self"
    setattribute $P123, "%!symtable", $P122
.annotate 'line', 944
    find_lex $P1367, "%options"
    unless_null $P1367, vivify_299
    $P1367 = root_new ['parrot';'Hash']
  vivify_299:
    set $P122, $P1367["rtype"]
    unless_null $P122, vivify_300
    new $P122, "Undef"
  vivify_300:
    store_lex "$rtype", $P122
.annotate 'line', 946
    find_lex $P123, "$blocktype"
    set $S100, $P123
    iseq $I100, $S100, "immediate"
    if $I100, if_1368
.annotate 'line', 955
    find_lex $P127, "$rtype"
    set $S101, $P127
    isne $I101, $S101, "v"
    if $I101, if_1377
    new $P126, 'Integer'
    set $P126, $I101
    goto if_1377_end
  if_1377:
.annotate 'line', 956
    get_hll_global $P128, ["POST"], "Ops"
    find_lex $P130, "$bpost"
    find_lex $P131, "$node"
    find_lex $P132, "$blockreg"
    $P133 = $P128."new"($P130, $P131 :named("node"), $P132 :named("result"))
    store_lex "$bpost", $P133
.annotate 'line', 957
    find_lex $P128, "$bpost"
    find_lex $P130, "$blockref"
    find_lex $P131, "$blockreg"
    $P128."push_pirop"($P130, $P131 :named("result"))
.annotate 'line', 958
    find_lex $P130, "$islexical"
    if $P130, if_1378
    set $P128, $P130
    goto if_1378_end
  if_1378:
.annotate 'line', 959
    find_lex $P132, "$node"
    $P133 = $P132."closure"()
    if $P133, if_1379
.annotate 'line', 967
    find_lex $P136, "$bpost"
    find_lex $P138, "$blockreg"
    $P139 = $P136."push_pirop"("capture_lex", $P138)
.annotate 'line', 966
    set $P131, $P139
.annotate 'line', 959
    goto if_1379_end
  if_1379:
    .const 'Sub' $P1381 = "55_1313886916.84408" 
    capture_lex $P1381
    $P135 = $P1381()
    set $P131, $P135
  if_1379_end:
.annotate 'line', 958
    set $P128, $P131
  if_1378_end:
.annotate 'line', 955
    set $P126, $P128
  if_1377_end:
    set $P122, $P126
.annotate 'line', 946
    goto if_1368_end
  if_1368:
    .const 'Sub' $P1370 = "54_1313886916.84408" 
    capture_lex $P1370
    $P125 = $P1370()
    set $P122, $P125
  if_1368_end:
.annotate 'line', 822
    .return ($P122)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1321"  :anon :subid("48_1313886916.84408") :outer("47_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 831
    new $P124, "Undef"
    set $P1323, $P124
    .lex "$cpost", $P1323
    get_hll_global $P125, ["POST"], "Ops"
    find_lex $P126, "$blockreg"
    $P127 = $P125."new"($P126 :named("result"))
    store_lex "$cpost", $P127
.annotate 'line', 832
    find_lex $P125, "$cpost"
    find_lex $P126, "$blockref"
    $P125."push_pirop"($P126)
.annotate 'line', 833
    find_lex $P125, "$cpost"
    find_lex $P126, "$blockreg"
    $P125."push_pirop"("capture_lex", $P126)
.annotate 'line', 834
    find_lex $P125, "$outerpost"
    find_lex $P126, "$cpost"
    $P127 = $P125."unshift"($P126)
.annotate 'line', 830
    .return ($P127)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1328"  :anon :subid("49_1313886916.84408") :outer("47_1313886916.84408")
    .param pmc param_1330
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 849
    .lex "$_", param_1330
.annotate 'line', 850
    find_lex $P129, "$_"
    find_lex $P128, "%symtable"
    exists $I102, $P128[$P129]
    unless $I102, if_1331_end
    die 0, .CONTROL_LOOP_NEXT
  if_1331_end:
.annotate 'line', 851
    find_lex $P128, "$_"
    find_lex $P1332, "%outersym"
    unless_null $P1332, vivify_285
    $P1332 = root_new ['parrot';'Hash']
  vivify_285:
    set $P129, $P1332[$P128]
    unless_null $P129, vivify_286
    new $P129, "Undef"
  vivify_286:
    find_lex $P130, "$_"
    find_lex $P1333, "%symtable"
    unless_null $P1333, vivify_287
    $P1333 = root_new ['parrot';'Hash']
    store_lex "%symtable", $P1333
  vivify_287:
    set $P1333[$P130], $P129
.annotate 'line', 849
    .return ($P129)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1337"  :anon :subid("50_1313886916.84408") :outer("47_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 868
    .const 'Sub' $P1359 = "52_1313886916.84408" 
    capture_lex $P1359
    .const 'Sub' $P1350 = "51_1313886916.84408" 
    capture_lex $P1350
.annotate 'line', 871
    $P1340 = root_new ['parrot';'Hash']
    set $P1339, $P1340
    .lex "%*TEMPREGS", $P1339
.annotate 'line', 880
    new $P123, "Undef"
    set $P1341, $P123
    .lex "$ctrlpast", $P1341
.annotate 'line', 881
    new $P124, "Undef"
    set $P1342, $P124
    .lex "$ctrllabel", $P1342
.annotate 'line', 894
    new $P125, "Undef"
    set $P1343, $P125
    .lex "$sig", $P1343
.annotate 'line', 896
    new $P126, "Undef"
    set $P1344, $P126
    .lex "$ops", $P1344
.annotate 'line', 898
    new $P127, "Undef"
    set $P1345, $P127
    .lex "$retval", $P1345
.annotate 'line', 900
    new $P128, "Undef"
    set $P1346, $P128
    .lex "$eh", $P1346
.annotate 'line', 868
    find_lex $P129, "%*TEMPREGS"
    unless_null $P129, vivify_290
    get_hll_global $P129, "%TEMPREGS"
    unless_null $P129, vivify_291
    die "Contextual %*TEMPREGS not found"
  vivify_291:
  vivify_290:
.annotate 'line', 872
    find_lex $P129, "$node"
    $P130 = $P129."tempregs"()
    if $P130, if_1347
.annotate 'line', 876
    find_lex $P131, "%outerregs"
    store_lex "%*TEMPREGS", $P131
.annotate 'line', 875
    goto if_1347_end
  if_1347:
.annotate 'line', 873
    find_lex $P131, "self"
    $P132 = $P131."tempreg_frame"()
    store_lex "%*TEMPREGS", $P132
  if_1347_end:
.annotate 'line', 880
    find_lex $P129, "$node"
    $P130 = $P129."control"()
    store_lex "$ctrlpast", $P130
.annotate 'line', 868
    find_lex $P129, "$ctrllabel"
.annotate 'line', 883
    find_lex $P129, "$ctrlpast"
    unless $P129, if_1348_end
    .const 'Sub' $P1350 = "51_1313886916.84408" 
    capture_lex $P1350
    $P1350()
  if_1348_end:
.annotate 'line', 894
    find_lex $P129, "$node"
    $P130 = $P129."list"()
    elements $I100, $P130
    repeat $S100, "v", $I100
    new $P131, 'String'
    set $P131, $S100
    concat $P132, $P131, "*"
    store_lex "$sig", $P132
.annotate 'line', 896
    find_lex $P129, "self"
    find_lex $P130, "$node"
    find_lex $P131, "$sig"
    $P132 = $P129."post_children"($P130, $P131 :named("signature"))
    store_lex "$ops", $P132
.annotate 'line', 898
    find_lex $P1352, "$ops"
    unless_null $P1352, vivify_292
    $P1352 = root_new ['parrot';'ResizablePMCArray']
  vivify_292:
    set $P129, $P1352[-1]
    unless_null $P129, vivify_293
    new $P129, "Undef"
  vivify_293:
    store_lex "$retval", $P129
.annotate 'line', 900
    find_lex $P129, "$node"
    $P130 = $P129."handlers"()
    store_lex "$eh", $P130
.annotate 'line', 901
    find_lex $P129, "$eh"
    unless $P129, if_1353_end
.annotate 'line', 902
    find_lex $P130, "self"
    find_lex $P131, "$ops"
    find_lex $P132, "$eh"
    find_lex $P1354, "%options"
    unless_null $P1354, vivify_294
    $P1354 = root_new ['parrot';'Hash']
  vivify_294:
    set $P133, $P1354["rtype"]
    unless_null $P133, vivify_295
    new $P133, "Undef"
  vivify_295:
    $P134 = $P130."wrap_handlers"($P131, $P132, $P133 :named("rtype"))
    store_lex "$ops", $P134
  if_1353_end:
.annotate 'line', 904
    find_lex $P129, "$bpost"
    find_lex $P130, "$ops"
    $P129."push"($P130)
.annotate 'line', 905
    find_lex $P129, "$ops"
    $P130 = $P129."list"()
    set $N100, $P130
    isgt $I100, $N100, 0.0
    unless $I100, if_1355_end
.annotate 'line', 907
    find_lex $P131, "$bpost"
    find_lex $P132, "$retval"
    $P131."push_pirop"("return", $P132)
  if_1355_end:
.annotate 'line', 910
    find_lex $P130, "$ctrlpast"
    if $P130, if_1356
    set $P129, $P130
    goto if_1356_end
  if_1356:
.annotate 'line', 911
    find_lex $P131, "$bpost"
    find_lex $P132, "$ctrllabel"
    $P131."push"($P132)
.annotate 'line', 912
    find_lex $P131, "$bpost"
    $P131."push_pirop"(".local pmc exception")
.annotate 'line', 913
    find_lex $P131, "$bpost"
    $P131."push_pirop"(".get_results (exception)")
.annotate 'line', 914
    find_lex $P132, "$ctrlpast"
    set $S100, $P132
    iseq $I100, $S100, "return_pir"
    if $I100, if_1357
.annotate 'line', 921
    find_lex $P137, "$ctrlpast"
    get_hll_global $P138, ["PAST"], "Node"
    $P139 = $P137."isa"($P138)
    if $P139, if_1361
.annotate 'line', 925
    find_lex $P140, "self"
    new $P141, 'String'
    set $P141, "Unrecognized control handler '"
    find_lex $P142, "$ctrlpast"
    concat $P143, $P141, $P142
    concat $P145, $P143, "'"
    $P146 = $P140."panic"($P145)
.annotate 'line', 924
    set $P135, $P146
.annotate 'line', 921
    goto if_1361_end
  if_1361:
.annotate 'line', 922
    find_lex $P140, "$bpost"
    find_lex $P141, "self"
    find_lex $P142, "$ctrlpast"
    $P143 = $P141."as_post"($P142, "*" :named("rtype"))
    $P144 = $P140."push"($P143)
.annotate 'line', 921
    set $P135, $P144
  if_1361_end:
    set $P131, $P135
.annotate 'line', 914
    goto if_1357_end
  if_1357:
    .const 'Sub' $P1359 = "52_1313886916.84408" 
    capture_lex $P1359
    $P134 = $P1359()
    set $P131, $P134
  if_1357_end:
.annotate 'line', 910
    set $P129, $P131
  if_1356_end:
.annotate 'line', 868
    .return ($P129)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1349"  :anon :subid("51_1313886916.84408") :outer("50_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 885
    new $P130, "Undef"
    set $P1351, $P130
    .lex "$reg", $P1351
.annotate 'line', 884
    get_hll_global $P131, ["POST"], "Label"
    find_lex $P132, "self"
    $P133 = $P132."unique"("control_")
    $P134 = $P131."new"($P133 :named("result"))
    store_lex "$ctrllabel", $P134
.annotate 'line', 885
    find_lex $P131, "self"
    $P132 = $P131."uniquereg"("P")
    store_lex "$reg", $P132
.annotate 'line', 886
    find_lex $P131, "$bpost"
    find_lex $P132, "$reg"
    $P131."push_pirop"("new", $P132, "['ExceptionHandler']", ".CONTROL_RETURN")
.annotate 'line', 888
    find_lex $P131, "$bpost"
    find_lex $P132, "$reg"
    find_lex $P133, "$ctrllabel"
    $P131."push_pirop"("set_label", $P132, $P133)
.annotate 'line', 889
    find_lex $P131, "$bpost"
    find_lex $P132, "$reg"
    $P131."push_pirop"("push_eh", $P132)
.annotate 'line', 890
    find_lex $P131, "$bpost"
    $P132 = $P131."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 883
    .return ($P132)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1358"  :anon :subid("52_1313886916.84408") :outer("50_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 916
    new $P133, "Undef"
    set $P1360, $P133
    .lex "$reg", $P1360
    find_lex $P134, "self"
    $P135 = $P134."tempreg"("P")
    store_lex "$reg", $P135
.annotate 'line', 917
    find_lex $P134, "$bpost"
    find_lex $P135, "$reg"
    $P134."push_pirop"("getattribute", $P135, "exception", "\"payload\"")
.annotate 'line', 919
    find_lex $P134, "$bpost"
    find_lex $P135, "$reg"
    $P136 = $P134."push_pirop"("return", $P135)
.annotate 'line', 914
    .return ($P136)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1363"  :anon :subid("53_1313886916.84408") :outer("47_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 932
    new $P123, "Undef"
    set $P1365, $P123
    .lex "$lisub", $P1365
    get_hll_global $P124, ["POST"], "Sub"
    find_lex $P125, "$bpost"
    $P126 = $P124."new"($P125 :named("outer"), ":load :init" :named("pirflags"))
    store_lex "$lisub", $P126
.annotate 'line', 933
    find_lex $P124, "$lisub"
    find_lex $P125, "$blockref"
    $P124."push_pirop"($P125)
.annotate 'line', 934
    find_lex $P124, "$lisub"
    $P124."push_pirop"(".local pmc", "block")
.annotate 'line', 935
    find_lex $P124, "$lisub"
    find_lex $P125, "$blockreg"
    $P124."push_pirop"("set", "block", $P125)
.annotate 'line', 936
    find_lex $P124, "$lisub"
    find_lex $P125, "self"
    find_lex $P126, "$node"
    $P127 = $P126."loadinit"()
    $P128 = $P125."as_post"($P127, "v" :named("rtype"))
    $P124."push"($P128)
.annotate 'line', 937
    find_lex $P124, "$lisub"
    find_lex $P1366, "$bpost"
    unless_null $P1366, vivify_298
    $P1366 = root_new ['parrot';'Hash']
    store_lex "$bpost", $P1366
  vivify_298:
    set $P1366["loadinit"], $P124
.annotate 'line', 931
    .return ($P124)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1380"  :anon :subid("55_1313886916.84408") :outer("47_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 962
    new $P134, "Undef"
    set $P1382, $P134
    .lex "$result", $P1382
    find_lex $P135, "self"
    $P136 = $P135."uniquereg"("P")
    store_lex "$result", $P136
.annotate 'line', 963
    find_lex $P135, "$bpost"
    find_lex $P136, "$result"
    find_lex $P137, "$blockreg"
    $P135."push_pirop"("newclosure", $P136, $P137)
.annotate 'line', 964
    find_lex $P135, "$bpost"
    find_lex $P136, "$result"
    $P137 = $P135."result"($P136)
.annotate 'line', 959
    .return ($P137)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1369"  :anon :subid("54_1313886916.84408") :outer("47_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 947
    $P1372 = root_new ['parrot';'ResizablePMCArray']
    set $P1371, $P1372
    .lex "@arglist", $P1371
.annotate 'line', 949
    new $P124, "Undef"
    set $P1373, $P124
    .lex "$result", $P1373
.annotate 'line', 947
    find_lex $P1374, "%options"
    unless_null $P1374, vivify_301
    $P1374 = root_new ['parrot';'Hash']
  vivify_301:
    set $P125, $P1374["arglist"]
    unless_null $P125, vivify_302
    new $P125, "Undef"
  vivify_302:
    store_lex "@arglist", $P125
.annotate 'line', 948
    find_lex $P125, "@arglist"
    defined $I101, $P125
    if $I101, unless_1375_end
    new $P126, "ResizablePMCArray"
    store_lex "@arglist", $P126
  unless_1375_end:
.annotate 'line', 949
    find_lex $P125, "self"
    find_lex $P126, "$rtype"
    $P127 = $P125."tempreg"($P126)
    store_lex "$result", $P127
.annotate 'line', 950
    get_hll_global $P125, ["POST"], "Ops"
    find_lex $P126, "$bpost"
    find_lex $P127, "$node"
    find_lex $P128, "$result"
    $P129 = $P125."new"($P126, $P127 :named("node"), $P128 :named("result"))
    store_lex "$bpost", $P129
.annotate 'line', 951
    find_lex $P125, "$bpost"
    find_lex $P126, "$blockref"
    $P125."push_pirop"($P126)
.annotate 'line', 952
    find_lex $P125, "$islexical"
    unless $P125, if_1376_end
    find_lex $P126, "$bpost"
    find_lex $P127, "$blockreg"
    $P126."push_pirop"("capture_lex", $P127)
  if_1376_end:
.annotate 'line', 953
    find_lex $P125, "$bpost"
    find_lex $P126, "$blockreg"
    find_lex $P127, "@arglist"
    find_lex $P128, "$result"
    $P129 = $P125."push_pirop"("call", $P126, $P127 :flat, $P128 :named("result"))
.annotate 'line', 946
    .return ($P129)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("56_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["PAST";"Op"])
    .param pmc param_1386
    .param pmc param_1387 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 995
    new $P1385, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1385, control_1384
    push_eh $P1385
    .lex "self", self
    .lex "$node", param_1386
    .lex "%options", param_1387
.annotate 'line', 997
    new $P105, "Undef"
    set $P1388, $P105
    .lex "$lvalue", $P1388
.annotate 'line', 998
    new $P106, "Undef"
    set $P1389, $P106
    .lex "$child", $P1389
.annotate 'line', 1003
    new $P107, "Undef"
    set $P1390, $P107
    .lex "$pasttype", $P1390
.annotate 'line', 1008
    new $P108, "Undef"
    set $P1391, $P108
    .lex "$pirop", $P1391
.annotate 'line', 1013
    new $P109, "Undef"
    set $P1392, $P109
    .lex "$inline", $P1392
.annotate 'line', 997
    find_lex $P110, "$node"
    $P111 = $P110."lvalue"()
    store_lex "$lvalue", $P111
.annotate 'line', 998
    find_lex $P1393, "$node"
    unless_null $P1393, vivify_305
    $P1393 = root_new ['parrot';'ResizablePMCArray']
  vivify_305:
    set $P110, $P1393[0]
    unless_null $P110, vivify_306
    new $P110, "Undef"
  vivify_306:
    store_lex "$child", $P110
.annotate 'line', 999
    find_lex $P112, "$lvalue"
    if $P112, if_1396
    set $P111, $P112
    goto if_1396_end
  if_1396:
    find_lex $P113, "$child"
    defined $I100, $P113
    new $P111, 'Integer'
    set $P111, $I100
  if_1396_end:
    if $P111, if_1395
    set $P110, $P111
    goto if_1395_end
  if_1395:
    find_lex $P114, "$child"
    exists $I101, $P114["lvalue"]
    new $P115, 'Integer'
    set $P115, $I101
    isfalse $I102, $P115
    new $P110, 'Integer'
    set $P110, $I102
  if_1395_end:
    unless $P110, if_1394_end
.annotate 'line', 1000
    find_lex $P116, "$child"
    find_lex $P117, "$lvalue"
    $P116."lvalue"($P117)
  if_1394_end:
.annotate 'line', 1003
    find_lex $P110, "$node"
    $P111 = $P110."pasttype"()
    store_lex "$pasttype", $P111
.annotate 'line', 1004
    find_lex $P110, "$pasttype"
    unless $P110, if_1397_end
.annotate 'line', 1005
    new $P111, "Exception"
    set $P111['type'], .CONTROL_RETURN
    find_lex $P112, "self"
    find_lex $P113, "$node"
    find_lex $P114, "%options"
    find_lex $P115, "$pasttype"
    set $S100, $P115
    $P116 = $P112.$S100($P113, $P114 :flat)
    setattribute $P111, 'payload', $P116
    throw $P111
  if_1397_end:
.annotate 'line', 1008
    find_lex $P110, "$node"
    $P111 = $P110."pirop"()
    store_lex "$pirop", $P111
.annotate 'line', 1009
    find_lex $P110, "$pirop"
    unless $P110, if_1398_end
.annotate 'line', 1010
    new $P111, "Exception"
    set $P111['type'], .CONTROL_RETURN
    find_lex $P112, "self"
    find_lex $P113, "$node"
    find_lex $P114, "%options"
    $P115 = $P112."pirop"($P113, $P114 :flat)
    setattribute $P111, 'payload', $P115
    throw $P111
  if_1398_end:
.annotate 'line', 1013
    find_lex $P110, "$node"
    $P111 = $P110."inline"()
    store_lex "$inline", $P111
.annotate 'line', 1014
    find_lex $P110, "$inline"
    unless $P110, if_1399_end
.annotate 'line', 1015
    new $P111, "Exception"
    set $P111['type'], .CONTROL_RETURN
    find_lex $P112, "self"
    find_lex $P113, "$node"
    find_lex $P114, "%options"
    $P115 = $P112."inline"($P113, $P114 :flat)
    setattribute $P111, 'payload', $P115
    throw $P111
  if_1399_end:
.annotate 'line', 1018
    find_lex $P110, "self"
    find_lex $P111, "$node"
    find_lex $P112, "%options"
    $P113 = $P110."call"($P111, $P112 :flat)
.annotate 'line', 995
    .return ($P113)
  control_1384:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "pirop"  :subid("57_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["PAST";"Op"])
    .param pmc param_1403
    .param pmc param_1404 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1026
    new $P1402, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1402, control_1401
    push_eh $P1402
    .lex "self", self
    .lex "$node", param_1403
    .lex "%options", param_1404
.annotate 'line', 1027
    new $P105, "Undef"
    set $P1405, $P105
    .lex "$pirop", $P1405
.annotate 'line', 1028
    new $P106, "Undef"
    set $P1406, $P106
    .lex "$signature", $P1406
.annotate 'line', 1029
    new $P107, "Undef"
    set $P1407, $P107
    .lex "$I0", $P1407
.annotate 'line', 1045
    new $P108, "Undef"
    set $P1408, $P108
    .lex "$ops", $P1408
.annotate 'line', 1046
    $P1410 = root_new ['parrot';'ResizablePMCArray']
    set $P1409, $P1410
    .lex "@posargs", $P1409
.annotate 'line', 1056
    $P1412 = root_new ['parrot';'ResizablePMCArray']
    set $P1411, $P1412
    .lex "@arglist", $P1411
.annotate 'line', 1058
    new $P109, "Undef"
    set $P1413, $P109
    .lex "$S0", $P1413
.annotate 'line', 1069
    new $P110, "Undef"
    set $P1414, $P110
    .lex "$result", $P1414
.annotate 'line', 1027
    find_lex $P111, "$node"
    $P112 = $P111."pirop"()
    store_lex "$pirop", $P112
.annotate 'line', 1026
    find_lex $P111, "$signature"
    find_lex $P111, "$I0"
.annotate 'line', 1030
    find_lex $P111, "$pirop"
    set $S100, $P111
    index $I100, $S100, " "
    new $P112, 'Integer'
    set $P112, $I100
    store_lex "$I0", $P112
    set $N100, $P112
    isge $I101, $N100, 0.0
    if $I101, if_1415
.annotate 'line', 1035
    find_lex $P113, "$pirop"
    set $S101, $P113
    index $I102, $S101, "__"
    new $P114, 'Integer'
    set $P114, $I102
    store_lex "$I0", $P114
    set $N101, $P114
    isge $I103, $N101, 0.0
    if $I103, if_1416
.annotate 'line', 1041
    find_lex $P115, "$pirop"
    get_global $P1417, "%piropsig"
    unless_null $P1417, vivify_307
    $P1417 = root_new ['parrot';'Hash']
  vivify_307:
    set $P116, $P1417[$P115]
    unless_null $P116, vivify_308
    new $P116, "Undef"
  vivify_308:
    store_lex "$signature", $P116
.annotate 'line', 1042
    find_lex $P115, "$signature"
    if $P115, unless_1418_end
    new $P116, "String"
    assign $P116, "vP"
    store_lex "$signature", $P116
  unless_1418_end:
.annotate 'line', 1040
    goto if_1416_end
  if_1416:
.annotate 'line', 1037
    find_lex $P115, "$pirop"
    set $S102, $P115
    find_lex $P116, "$I0"
    add $P117, $P116, 2
    set $I104, $P117
    substr $S103, $S102, $I104
    new $P118, 'String'
    set $P118, $S103
    store_lex "$signature", $P118
.annotate 'line', 1038
    find_lex $P115, "$pirop"
    set $S102, $P115
    find_lex $P116, "$I0"
    set $I104, $P116
    substr $S103, $S102, 0, $I104
    new $P117, 'String'
    set $P117, $S103
    store_lex "$pirop", $P117
  if_1416_end:
.annotate 'line', 1035
    goto if_1415_end
  if_1415:
.annotate 'line', 1032
    find_lex $P113, "$pirop"
    set $S101, $P113
    find_lex $P114, "$I0"
    add $P115, $P114, 1
    set $I102, $P115
    substr $S102, $S101, $I102
    new $P116, 'String'
    set $P116, $S102
    store_lex "$signature", $P116
.annotate 'line', 1033
    find_lex $P113, "$pirop"
    set $S101, $P113
    find_lex $P114, "$I0"
    set $I102, $P114
    substr $S102, $S101, 0, $I102
    new $P115, 'String'
    set $P115, $S102
    store_lex "$pirop", $P115
  if_1415_end:
.annotate 'line', 1026
    find_lex $P111, "$ops"
    find_lex $P111, "@posargs"
.annotate 'line', 1048

        $P0 = find_lex '$node'
        $P1 = find_lex '$signature'
        ($P0, $P1) = self.'post_children'($P0, 'signature' => $P1)
        store_lex '$ops', $P0
        store_lex '@posargs', $P1
    
.annotate 'line', 1056
    find_lex $P111, "$ops"
    $P112 = $P111."list"()
    store_lex "@arglist", $P112
.annotate 'line', 1058
    find_lex $P111, "$signature"
    set $S100, $P111
    substr $S101, $S100, 0, 1
    new $P112, 'String'
    set $P112, $S101
    store_lex "$S0", $P112
.annotate 'line', 1059
    find_lex $P111, "$S0"
    set $S100, $P111
    iseq $I100, $S100, "v"
    unless $I100, if_1419_end
.annotate 'line', 1060
    find_lex $P112, "$ops"
    find_lex $P113, "$pirop"
    find_lex $P114, "@posargs"
    $P112."push_pirop"($P113, $P114 :flat)
.annotate 'line', 1061
    new $P112, "Exception"
    set $P112['type'], .CONTROL_RETURN
    find_lex $P113, "$ops"
    setattribute $P112, 'payload', $P113
    throw $P112
  if_1419_end:
.annotate 'line', 1063
    find_lex $P111, "$S0"
    set $S100, $P111
    index $I100, "0123456789", $S100
    new $P112, 'Integer'
    set $P112, $I100
    store_lex "$I0", $P112
.annotate 'line', 1064
    find_lex $P111, "$I0"
    set $N100, $P111
    isge $I100, $N100, 0.0
    unless $I100, if_1420_end
.annotate 'line', 1065
    find_lex $P112, "$ops"
    find_lex $P113, "$I0"
    set $I101, $P113
    find_lex $P1421, "@arglist"
    unless_null $P1421, vivify_309
    $P1421 = root_new ['parrot';'ResizablePMCArray']
  vivify_309:
    set $P114, $P1421[$I101]
    unless_null $P114, vivify_310
    new $P114, "Undef"
  vivify_310:
    $P112."result"($P114)
.annotate 'line', 1066
    find_lex $P112, "$ops"
    find_lex $P113, "$pirop"
    find_lex $P114, "@posargs"
    $P112."push_pirop"($P113, $P114 :flat)
.annotate 'line', 1067
    new $P112, "Exception"
    set $P112['type'], .CONTROL_RETURN
    find_lex $P113, "$ops"
    setattribute $P112, 'payload', $P113
    throw $P112
  if_1420_end:
.annotate 'line', 1069
    find_lex $P111, "self"
    find_lex $P112, "$S0"
    $P113 = $P111."tempreg"($P112)
    store_lex "$result", $P113
.annotate 'line', 1070
    find_lex $P111, "$ops"
    find_lex $P112, "$result"
    $P111."result"($P112)
.annotate 'line', 1071
    find_lex $P111, "$ops"
    find_lex $P112, "$pirop"
    find_lex $P113, "$result"
    find_lex $P114, "@posargs"
    $P111."push_pirop"($P112, $P113, $P114 :flat)
.annotate 'line', 1072
    new $P111, "Exception"
    set $P111['type'], .CONTROL_RETURN
    find_lex $P112, "$ops"
    setattribute $P111, 'payload', $P112
    throw $P111
.annotate 'line', 1026
    .return ()
  control_1401:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "call"  :subid("58_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["PAST";"Op"])
    .param pmc param_1425
    .param pmc param_1426 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1080
    .const 'Sub' $P1444 = "59_1313886916.84408" 
    capture_lex $P1444
    new $P1424, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1424, control_1423
    push_eh $P1424
    .lex "self", self
    .lex "$node", param_1425
    .lex "%options", param_1426
.annotate 'line', 1081
    new $P105, "Undef"
    set $P1427, $P105
    .lex "$pasttype", $P1427
.annotate 'line', 1084
    new $P106, "Undef"
    set $P1428, $P106
    .lex "$signature", $P1428
.annotate 'line', 1088
    new $P107, "Undef"
    set $P1429, $P107
    .lex "$name", $P1429
.annotate 'line', 1089
    new $P108, "Undef"
    set $P1430, $P108
    .lex "$ops", $P1430
.annotate 'line', 1090
    $P1432 = root_new ['parrot';'ResizablePMCArray']
    set $P1431, $P1432
    .lex "@posargs", $P1431
.annotate 'line', 1091
    $P1434 = root_new ['parrot';'Hash']
    set $P1433, $P1434
    .lex "%namedargs", $P1433
.annotate 'line', 1116
    new $P109, "Undef"
    set $P1435, $P109
    .lex "$rtype", $P1435
.annotate 'line', 1117
    new $P110, "Undef"
    set $P1436, $P110
    .lex "$result", $P1436
.annotate 'line', 1081
    find_lex $P111, "$node"
    $P112 = $P111."pasttype"()
    store_lex "$pasttype", $P112
.annotate 'line', 1082
    find_lex $P111, "$pasttype"
    if $P111, unless_1437_end
    new $P112, "String"
    assign $P112, "call"
    store_lex "$pasttype", $P112
  unless_1437_end:
.annotate 'line', 1084
    new $P111, "String"
    assign $P111, "v:"
    store_lex "$signature", $P111
.annotate 'line', 1086
    find_lex $P111, "$pasttype"
    set $S100, $P111
    iseq $I100, $S100, "callmethod"
    unless $I100, if_1438_end
    new $P112, "String"
    assign $P112, "vP:"
    store_lex "$signature", $P112
  if_1438_end:
.annotate 'line', 1088
    find_lex $P111, "$node"
    $P112 = $P111."name"()
    store_lex "$name", $P112
.annotate 'line', 1080
    find_lex $P111, "$ops"
    find_lex $P111, "@posargs"
    find_lex $P111, "%namedargs"
.annotate 'line', 1093
    find_lex $P111, "$name"
    if $P111, unless_1439_end
    find_lex $P112, "$signature"
    set $S100, $P112
    replace $S101, $S100, 1, 0, "P"
    new $P113, 'String'
    set $P113, $S101
    store_lex "$signature", $P113
  unless_1439_end:
.annotate 'line', 1095

        $P0 = find_lex '$node'
        $P1 = find_lex '$signature'
        ($P0, $P1, $P2) = self.'post_children'($P0, 'signature'=>$P1)
        store_lex '$ops', $P0
        store_lex '@posargs', $P1
        store_lex '%namedargs', $P2
    
.annotate 'line', 1103
    find_lex $P111, "$name"
    unless $P111, if_1440_end
.annotate 'line', 1104
    find_lex $P113, "$name"
    isa $I100, $P113, "P6object"
    if $I100, if_1442
    new $P112, 'Integer'
    set $P112, $I100
    goto if_1442_end
  if_1442:
    find_lex $P114, "$name"
    get_hll_global $P115, ["PAST"], "Node"
    $P116 = $P114."isa"($P115)
    set $P112, $P116
  if_1442_end:
    if $P112, if_1441
.annotate 'line', 1111
    find_lex $P119, "@posargs"
    find_lex $P120, "self"
    find_lex $P121, "$name"
    $P122 = $P120."escape"($P121)
    unshift $P119, $P122
.annotate 'line', 1110
    goto if_1441_end
  if_1441:
.annotate 'line', 1104
    .const 'Sub' $P1444 = "59_1313886916.84408" 
    capture_lex $P1444
    $P1444()
  if_1441_end:
  if_1440_end:
.annotate 'line', 1116
    find_lex $P1446, "%options"
    unless_null $P1446, vivify_311
    $P1446 = root_new ['parrot';'Hash']
  vivify_311:
    set $P111, $P1446["rtype"]
    unless_null $P111, vivify_312
    new $P111, "Undef"
  vivify_312:
    store_lex "$rtype", $P111
.annotate 'line', 1117
    find_lex $P111, "self"
    find_lex $P112, "$rtype"
    $P113 = $P111."tempreg"($P112)
    store_lex "$result", $P113
.annotate 'line', 1118
    find_lex $P111, "$ops"
    find_lex $P112, "$pasttype"
    find_lex $P113, "@posargs"
    find_lex $P114, "%namedargs"
    find_lex $P115, "$result"
    $P111."push_pirop"($P112, $P113 :flat, $P114 :flat, $P115 :named("result"))
.annotate 'line', 1119
    find_lex $P111, "$ops"
    find_lex $P112, "$result"
    $P111."result"($P112)
.annotate 'line', 1080
    find_lex $P111, "$ops"
    .return ($P111)
  control_1423:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1443"  :anon :subid("59_1313886916.84408") :outer("58_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1105
    new $P117, "Undef"
    set $P1445, $P117
    .lex "$name_post", $P1445
    find_lex $P118, "self"
    find_lex $P119, "$name"
    $P120 = $P118."as_post"($P119, "s" :named("rtype"))
    store_lex "$name_post", $P120
.annotate 'line', 1106
    find_lex $P118, "self"
    find_lex $P119, "$name_post"
    $P120 = $P118."coerce"($P119, "s")
    store_lex "$name_post", $P120
.annotate 'line', 1107
    find_lex $P118, "$ops"
    find_lex $P119, "$name_post"
    $P118."push"($P119)
.annotate 'line', 1108
    find_lex $P118, "@posargs"
    find_lex $P119, "$name_post"
    unshift $P118, $P119
.annotate 'line', 1104
    .return ($P118)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "callmethod"  :subid("60_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["PAST";"Op"])
    .param pmc param_1450
    .param pmc param_1451 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1128
    new $P1449, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1449, control_1448
    push_eh $P1449
    .lex "self", self
    .lex "$node", param_1450
    .lex "%options", param_1451
.annotate 'line', 1129
    find_lex $P105, "self"
    find_lex $P106, "$node"
    find_lex $P107, "%options"
    $P108 = $P105."call"($P106, $P107 :flat)
.annotate 'line', 1128
    .return ($P108)
  control_1448:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "if"  :subid("61_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["PAST";"Op"])
    .param pmc param_1455
    .param pmc param_1456 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1138
    .const 'Sub' $P1497 = "64_1313886916.84408" 
    capture_lex $P1497
    .const 'Sub' $P1473 = "62_1313886916.84408" 
    capture_lex $P1473
    new $P1454, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1454, control_1453
    push_eh $P1454
    .lex "self", self
    .lex "$node", param_1455
    .lex "%options", param_1456
.annotate 'line', 1139
    new $P105, "Undef"
    set $P1457, $P105
    .lex "$ops", $P1457
.annotate 'line', 1141
    new $P106, "Undef"
    set $P1458, $P106
    .lex "$rtype", $P1458
.annotate 'line', 1142
    new $P107, "Undef"
    set $P1459, $P107
    .lex "$result", $P1459
.annotate 'line', 1145
    new $P108, "Undef"
    set $P1460, $P108
    .lex "$pasttype", $P1460
.annotate 'line', 1147
    new $P109, "Undef"
    set $P1461, $P109
    .lex "$exprpast", $P1461
.annotate 'line', 1148
    new $P110, "Undef"
    set $P1462, $P110
    .lex "$thenpast", $P1462
.annotate 'line', 1149
    new $P111, "Undef"
    set $P1463, $P111
    .lex "$elsepast", $P1463
.annotate 'line', 1151
    new $P112, "Undef"
    set $P1464, $P112
    .lex "$S0", $P1464
.annotate 'line', 1152
    new $P113, "Undef"
    set $P1465, $P113
    .lex "$thenlabel", $P1465
.annotate 'line', 1153
    new $P114, "Undef"
    set $P1466, $P114
    .lex "$endlabel", $P1466
.annotate 'line', 1155
    new $P115, "Undef"
    set $P1467, $P115
    .lex "$exprrtype", $P1467
.annotate 'line', 1157
    new $P116, "Undef"
    set $P1468, $P116
    .lex "$childrtype", $P1468
.annotate 'line', 1160
    new $P117, "Undef"
    set $P1469, $P117
    .lex "$exprpost", $P1469
.annotate 'line', 1162
    new $P118, "Undef"
    set $P1470, $P118
    .lex "$thenpost", $P1470
.annotate 'line', 1163
    new $P119, "Undef"
    set $P1471, $P119
    .lex "$elsepost", $P1471
.annotate 'line', 1185
    .const 'Sub' $P1473 = "62_1313886916.84408" 
    newclosure $P1486, $P1473
    set $P1472, $P1486
    .lex "make_childpost", $P1472
.annotate 'line', 1139
    get_hll_global $P124, ["POST"], "Ops"
    find_lex $P125, "$node"
    $P126 = $P124."new"($P125 :named("node"))
    store_lex "$ops", $P126
.annotate 'line', 1141
    find_lex $P1487, "%options"
    unless_null $P1487, vivify_314
    $P1487 = root_new ['parrot';'Hash']
  vivify_314:
    set $P124, $P1487["rtype"]
    unless_null $P124, vivify_315
    new $P124, "Undef"
  vivify_315:
    store_lex "$rtype", $P124
.annotate 'line', 1142
    find_lex $P124, "self"
    find_lex $P125, "$rtype"
    $P126 = $P124."tempreg"($P125)
    store_lex "$result", $P126
.annotate 'line', 1143
    find_lex $P124, "$ops"
    find_lex $P125, "$result"
    $P124."result"($P125)
.annotate 'line', 1145
    find_lex $P124, "$node"
    $P125 = $P124."pasttype"()
    store_lex "$pasttype", $P125
.annotate 'line', 1147
    find_lex $P1488, "$node"
    unless_null $P1488, vivify_316
    $P1488 = root_new ['parrot';'ResizablePMCArray']
  vivify_316:
    set $P124, $P1488[0]
    unless_null $P124, vivify_317
    new $P124, "Undef"
  vivify_317:
    store_lex "$exprpast", $P124
.annotate 'line', 1148
    find_lex $P1489, "$node"
    unless_null $P1489, vivify_318
    $P1489 = root_new ['parrot';'ResizablePMCArray']
  vivify_318:
    set $P124, $P1489[1]
    unless_null $P124, vivify_319
    new $P124, "Undef"
  vivify_319:
    store_lex "$thenpast", $P124
.annotate 'line', 1149
    find_lex $P1490, "$node"
    unless_null $P1490, vivify_320
    $P1490 = root_new ['parrot';'ResizablePMCArray']
  vivify_320:
    set $P124, $P1490[2]
    unless_null $P124, vivify_321
    new $P124, "Undef"
  vivify_321:
    store_lex "$elsepast", $P124
.annotate 'line', 1151
    find_lex $P124, "self"
    find_lex $P125, "$pasttype"
    concat $P126, $P125, "_"
    $P127 = $P124."unique"($P126)
    store_lex "$S0", $P127
.annotate 'line', 1152
    get_hll_global $P124, ["POST"], "Label"
    find_lex $P125, "$S0"
    $P126 = $P124."new"($P125 :named("result"))
    store_lex "$thenlabel", $P126
.annotate 'line', 1153
    get_hll_global $P124, ["POST"], "Label"
    find_lex $P125, "$S0"
    concat $P126, $P125, "_end"
    $P127 = $P124."new"($P126 :named("result"))
    store_lex "$endlabel", $P127
.annotate 'line', 1155
    new $P124, "String"
    assign $P124, "r"
    store_lex "$exprrtype", $P124
.annotate 'line', 1156
    find_lex $P124, "$rtype"
    set $S100, $P124
    iseq $I100, $S100, "v"
    unless $I100, if_1491_end
    new $P125, "String"
    assign $P125, "*"
    store_lex "$exprrtype", $P125
  if_1491_end:
.annotate 'line', 1157
    find_lex $P124, "$rtype"
    store_lex "$childrtype", $P124
.annotate 'line', 1158
    find_lex $P124, "$rtype"
    set $S100, $P124
    index $I100, "*:", $S100
    set $N100, $I100
    isge $I101, $N100, 0.0
    unless $I101, if_1492_end
    new $P125, "String"
    assign $P125, "P"
    store_lex "$childrtype", $P125
  if_1492_end:
.annotate 'line', 1160
    find_lex $P124, "self"
    find_lex $P125, "$exprpast"
    find_lex $P126, "$exprrtype"
    $P127 = $P124."as_post"($P125, $P126 :named("rtype"))
    store_lex "$exprpost", $P127
.annotate 'line', 1162
    find_lex $P124, "$thenpast"
    $P125 = "make_childpost"($P124)
    store_lex "$thenpost", $P125
.annotate 'line', 1163
    find_lex $P124, "$elsepast"
    $P125 = "make_childpost"($P124)
    store_lex "$elsepost", $P125
.annotate 'line', 1165
    find_lex $P124, "$elsepost"
    defined $I100, $P124
    if $I100, if_1493
.annotate 'line', 1175
    .const 'Sub' $P1497 = "64_1313886916.84408" 
    capture_lex $P1497
    $P1497()
    goto if_1493_end
  if_1493:
.annotate 'line', 1166
    find_lex $P125, "$ops"
    find_lex $P126, "$exprpost"
    $P125."push"($P126)
.annotate 'line', 1167
    find_lex $P125, "$ops"
    find_lex $P126, "$pasttype"
    find_lex $P127, "$exprpost"
    find_lex $P128, "$thenlabel"
    $P125."push_pirop"($P126, $P127, $P128)
.annotate 'line', 1168
    find_lex $P125, "$elsepost"
    defined $I101, $P125
    unless $I101, if_1494_end
    find_lex $P126, "$ops"
    find_lex $P127, "$elsepost"
    $P126."push"($P127)
  if_1494_end:
.annotate 'line', 1169
    find_lex $P125, "$ops"
    find_lex $P126, "$endlabel"
    $P125."push_pirop"("goto", $P126)
.annotate 'line', 1170
    find_lex $P125, "$ops"
    find_lex $P126, "$thenlabel"
    $P125."push"($P126)
.annotate 'line', 1171
    find_lex $P125, "$thenpost"
    defined $I101, $P125
    unless $I101, if_1495_end
    find_lex $P126, "$ops"
    find_lex $P127, "$thenpost"
    $P126."push"($P127)
  if_1495_end:
.annotate 'line', 1172
    find_lex $P125, "$ops"
    find_lex $P126, "$endlabel"
    $P125."push"($P126)
.annotate 'line', 1173
    new $P125, "Exception"
    set $P125['type'], .CONTROL_RETURN
    find_lex $P126, "$ops"
    setattribute $P125, 'payload', $P126
    throw $P125
  if_1493_end:
.annotate 'line', 1138
    find_lex $P124, "make_childpost"
    .return ($P124)
  control_1453:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P125, exception, "payload"
    .return ($P125)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "make_childpost"  :subid("62_1313886916.84408") :outer("61_1313886916.84408")
    .param pmc param_1476 :optional
    .param int has_param_1476 :opt_flag
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1185
    .const 'Sub' $P1480 = "63_1313886916.84408" 
    capture_lex $P1480
    new $P1475, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1475, control_1474
    push_eh $P1475
    if has_param_1476, optparam_313
    new $P120, "Undef"
    set param_1476, $P120
  optparam_313:
    .lex "$childpast", param_1476
.annotate 'line', 1186
    new $P121, "Undef"
    set $P1477, $P121
    .lex "$childpost", $P1477
.annotate 'line', 1185
    find_lex $P122, "$childpost"
.annotate 'line', 1187
    find_lex $P122, "$childpast"
    defined $I100, $P122
    if $I100, if_1478
.annotate 'line', 1194
    find_lex $P123, "$rtype"
    set $S100, $P123
    iseq $I101, $S100, "v"
    unless $I101, if_1484_end
    new $P124, "Exception"
    set $P124['type'], .CONTROL_RETURN
    find_lex $P125, "$childpost"
    setattribute $P124, 'payload', $P125
    throw $P124
  if_1484_end:
.annotate 'line', 1195
    get_hll_global $P123, ["POST"], "Ops"
    find_lex $P124, "$exprpost"
    $P125 = $P123."new"($P124 :named("result"))
    store_lex "$childpost", $P125
.annotate 'line', 1193
    goto if_1478_end
  if_1478:
.annotate 'line', 1187
    .const 'Sub' $P1480 = "63_1313886916.84408" 
    capture_lex $P1480
    $P1480()
  if_1478_end:
.annotate 'line', 1197
    find_lex $P122, "$result"
    unless $P122, if_1485_end
    find_lex $P123, "self"
    find_lex $P124, "$childpost"
    find_lex $P125, "$result"
    $P126 = $P123."coerce"($P124, $P125)
    store_lex "$childpost", $P126
  if_1485_end:
.annotate 'line', 1185
    find_lex $P122, "$childpost"
    .return ($P122)
  control_1474:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P123, exception, "payload"
    .return ($P123)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1479"  :anon :subid("63_1313886916.84408") :outer("62_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1188
    $P1482 = root_new ['parrot';'ResizablePMCArray']
    set $P1481, $P1482
    .lex "@arglist", $P1481
    new $P123, "ResizablePMCArray"
    store_lex "@arglist", $P123
.annotate 'line', 1189
    find_lex $P123, "$childpast"
    $N100 = $P123."arity"()
    isgt $I101, $N100, 0.0
    unless $I101, if_1483_end
    find_lex $P124, "@arglist"
    find_lex $P125, "$exprpost"
    push $P124, $P125
  if_1483_end:
.annotate 'line', 1190
    find_lex $P123, "self"
    find_lex $P124, "$childpast"
    find_lex $P125, "$childrtype"
    find_lex $P126, "@arglist"
    $P127 = $P123."as_post"($P124, $P125 :named("rtype"), $P126 :named("arglist"))
    store_lex "$childpost", $P127
.annotate 'line', 1187
    .return ($P127)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1496"  :anon :subid("64_1313886916.84408") :outer("61_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1176
    new $P125, "Undef"
    set $P1498, $P125
    .lex "$S0", $P1498
    new $P126, "String"
    assign $P126, "if"
    store_lex "$S0", $P126
.annotate 'line', 1177
    find_lex $P126, "$pasttype"
    set $S100, $P126
    find_lex $P127, "$S0"
    set $S101, $P127
    iseq $I101, $S100, $S101
    unless $I101, if_1499_end
    new $P128, "String"
    assign $P128, "unless"
    store_lex "$S0", $P128
  if_1499_end:
.annotate 'line', 1178
    find_lex $P126, "$ops"
    find_lex $P127, "$exprpost"
    $P126."push"($P127)
.annotate 'line', 1179
    find_lex $P126, "$ops"
    find_lex $P127, "$S0"
    find_lex $P128, "$exprpost"
    find_lex $P129, "$endlabel"
    $P126."push_pirop"($P127, $P128, $P129)
.annotate 'line', 1180
    find_lex $P126, "$thenpost"
    defined $I101, $P126
    unless $I101, if_1500_end
    find_lex $P127, "$ops"
    find_lex $P128, "$thenpost"
    $P127."push"($P128)
  if_1500_end:
.annotate 'line', 1181
    find_lex $P126, "$ops"
    find_lex $P127, "$endlabel"
    $P126."push"($P127)
.annotate 'line', 1182
    new $P126, "Exception"
    set $P126['type'], .CONTROL_RETURN
    find_lex $P127, "$ops"
    setattribute $P126, 'payload', $P127
    throw $P126
.annotate 'line', 1175
    .return ()
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "unless"  :subid("65_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["PAST";"Op"])
    .param pmc param_1504
    .param pmc param_1505 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1202
    new $P1503, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1503, control_1502
    push_eh $P1503
    .lex "self", self
    .lex "$node", param_1504
    .lex "%options", param_1505
.annotate 'line', 1203
    find_lex $P105, "self"
    find_lex $P106, "$node"
    find_lex $P107, "%options"
    $P108 = $P105."if"($P106, $P107 :flat)
.annotate 'line', 1202
    .return ($P108)
  control_1502:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "loop_gen"  :subid("66_1313886916.84408") :method :outer("11_1313886916.84408")
    .param pmc param_1509 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1210
    new $P1508, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1508, control_1507
    push_eh $P1508
    .lex "self", self
    .lex "%options", param_1509
.annotate 'line', 1211
    new $P105, "Undef"
    set $P1510, $P105
    .lex "$loopname", $P1510
.annotate 'line', 1212
    new $P106, "Undef"
    set $P1511, $P106
    .lex "$testlabel", $P1511
.annotate 'line', 1213
    new $P107, "Undef"
    set $P1512, $P107
    .lex "$redolabel", $P1512
.annotate 'line', 1214
    new $P108, "Undef"
    set $P1513, $P108
    .lex "$nextlabel", $P1513
.annotate 'line', 1215
    new $P109, "Undef"
    set $P1514, $P109
    .lex "$donelabel", $P1514
.annotate 'line', 1216
    new $P110, "Undef"
    set $P1515, $P110
    .lex "$handlabel", $P1515
.annotate 'line', 1218
    new $P111, "Undef"
    set $P1516, $P111
    .lex "$testop", $P1516
.annotate 'line', 1219
    new $P112, "Undef"
    set $P1517, $P112
    .lex "$testpost", $P1517
.annotate 'line', 1220
    new $P113, "Undef"
    set $P1518, $P113
    .lex "$prepost", $P1518
.annotate 'line', 1221
    new $P114, "Undef"
    set $P1519, $P114
    .lex "$bodypost", $P1519
.annotate 'line', 1222
    new $P115, "Undef"
    set $P1520, $P115
    .lex "$nextpost", $P1520
.annotate 'line', 1223
    new $P116, "Undef"
    set $P1521, $P116
    .lex "$bodyfirst", $P1521
.annotate 'line', 1227
    new $P117, "Undef"
    set $P1522, $P117
    .lex "$ops", $P1522
.annotate 'line', 1231
    new $P118, "Undef"
    set $P1523, $P118
    .lex "$handreg", $P1523
.annotate 'line', 1253
    new $P119, "Undef"
    set $P1524, $P119
    .lex "$S0", $P1524
.annotate 'line', 1211
    find_lex $P120, "self"
    $P121 = $P120."unique"("loop")
    store_lex "$loopname", $P121
.annotate 'line', 1212
    get_hll_global $P120, ["POST"], "Label"
    find_lex $P121, "$loopname"
    concat $P122, $P121, "_test"
    $P123 = $P120."new"($P122 :named("result"))
    store_lex "$testlabel", $P123
.annotate 'line', 1213
    get_hll_global $P120, ["POST"], "Label"
    find_lex $P121, "$loopname"
    concat $P122, $P121, "_redo"
    $P123 = $P120."new"($P122 :named("result"))
    store_lex "$redolabel", $P123
.annotate 'line', 1214
    get_hll_global $P120, ["POST"], "Label"
    find_lex $P121, "$loopname"
    concat $P122, $P121, "_next"
    $P123 = $P120."new"($P122 :named("result"))
    store_lex "$nextlabel", $P123
.annotate 'line', 1215
    get_hll_global $P120, ["POST"], "Label"
    find_lex $P121, "$loopname"
    concat $P122, $P121, "_done"
    $P123 = $P120."new"($P122 :named("result"))
    store_lex "$donelabel", $P123
.annotate 'line', 1216
    get_hll_global $P120, ["POST"], "Label"
    find_lex $P121, "$loopname"
    concat $P122, $P121, "_handler"
    $P123 = $P120."new"($P122 :named("result"))
    store_lex "$handlabel", $P123
.annotate 'line', 1218
    find_lex $P1525, "%options"
    unless_null $P1525, vivify_322
    $P1525 = root_new ['parrot';'Hash']
  vivify_322:
    set $P120, $P1525["testop"]
    unless_null $P120, vivify_323
    new $P120, "Undef"
  vivify_323:
    store_lex "$testop", $P120
.annotate 'line', 1219
    find_lex $P1526, "%options"
    unless_null $P1526, vivify_324
    $P1526 = root_new ['parrot';'Hash']
  vivify_324:
    set $P120, $P1526["test"]
    unless_null $P120, vivify_325
    new $P120, "Undef"
  vivify_325:
    store_lex "$testpost", $P120
.annotate 'line', 1220
    find_lex $P1527, "%options"
    unless_null $P1527, vivify_326
    $P1527 = root_new ['parrot';'Hash']
  vivify_326:
    set $P120, $P1527["pre"]
    unless_null $P120, vivify_327
    new $P120, "Undef"
  vivify_327:
    store_lex "$prepost", $P120
.annotate 'line', 1221
    find_lex $P1528, "%options"
    unless_null $P1528, vivify_328
    $P1528 = root_new ['parrot';'Hash']
  vivify_328:
    set $P120, $P1528["body"]
    unless_null $P120, vivify_329
    new $P120, "Undef"
  vivify_329:
    store_lex "$bodypost", $P120
.annotate 'line', 1222
    find_lex $P1529, "%options"
    unless_null $P1529, vivify_330
    $P1529 = root_new ['parrot';'Hash']
  vivify_330:
    set $P120, $P1529["next"]
    unless_null $P120, vivify_331
    new $P120, "Undef"
  vivify_331:
    store_lex "$nextpost", $P120
.annotate 'line', 1223
    find_lex $P1530, "%options"
    unless_null $P1530, vivify_332
    $P1530 = root_new ['parrot';'Hash']
  vivify_332:
    set $P120, $P1530["bodyfirst"]
    unless_null $P120, vivify_333
    new $P120, "Undef"
  vivify_333:
    store_lex "$bodyfirst", $P120
.annotate 'line', 1225
    find_lex $P120, "$testop"
    if $P120, unless_1531_end
    new $P121, "String"
    assign $P121, "unless"
    store_lex "$testop", $P121
  unless_1531_end:
.annotate 'line', 1227
    get_hll_global $P120, ["POST"], "Ops"
    $P121 = $P120."new"()
    store_lex "$ops", $P121
.annotate 'line', 1229
    find_dynamic_lex $P120, "$*SUB"
    unless_null $P120, vivify_334
    get_hll_global $P120, "$SUB"
    unless_null $P120, vivify_335
    die "Contextual $*SUB not found"
  vivify_335:
  vivify_334:
    $P120."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 1231
    find_lex $P120, "self"
    $P121 = $P120."tempreg"("P")
    store_lex "$handreg", $P121
.annotate 'line', 1232
    find_lex $P120, "$ops"
    find_lex $P121, "$handreg"
    $P120."push_pirop"("new", $P121, "'ExceptionHandler'")
.annotate 'line', 1233
    find_lex $P120, "$ops"
    find_lex $P121, "$handreg"
    find_lex $P122, "$handlabel"
    $P120."push_pirop"("set_label", $P121, $P122)
.annotate 'line', 1234
    find_lex $P120, "$ops"
    find_lex $P121, "$handreg"
    $P120."push_pirop"("callmethod", "\"handle_types\"", $P121, ".CONTROL_LOOP_NEXT", ".CONTROL_LOOP_REDO", ".CONTROL_LOOP_LAST")
.annotate 'line', 1236
    find_lex $P120, "$ops"
    find_lex $P121, "$handreg"
    $P120."push_pirop"("push_eh", $P121)
.annotate 'line', 1238
    find_lex $P120, "$bodyfirst"
    unless $P120, if_1532_end
    find_lex $P121, "$ops"
    find_lex $P122, "$redolabel"
    $P121."push_pirop"("goto", $P122)
  if_1532_end:
.annotate 'line', 1239
    find_lex $P120, "$ops"
    find_lex $P121, "$testlabel"
    $P120."push"($P121)
.annotate 'line', 1240
    find_lex $P120, "$testpost"
    unless $P120, if_1533_end
.annotate 'line', 1241
    find_lex $P121, "$ops"
    find_lex $P122, "$testpost"
    $P121."push"($P122)
.annotate 'line', 1242
    find_lex $P121, "$ops"
    find_lex $P122, "$testop"
    find_lex $P123, "$testpost"
    find_lex $P124, "$donelabel"
    $P121."push_pirop"($P122, $P123, $P124)
  if_1533_end:
.annotate 'line', 1244
    find_lex $P120, "$prepost"
    unless $P120, if_1534_end
    find_lex $P121, "$ops"
    find_lex $P122, "$prepost"
    $P121."push"($P122)
  if_1534_end:
.annotate 'line', 1245
    find_lex $P120, "$ops"
    find_lex $P121, "$redolabel"
    $P120."push"($P121)
.annotate 'line', 1246
    find_lex $P120, "$bodypost"
    unless $P120, if_1535_end
    find_lex $P121, "$ops"
    find_lex $P122, "$bodypost"
    $P121."push"($P122)
  if_1535_end:
.annotate 'line', 1247
    find_lex $P120, "$ops"
    find_lex $P121, "$nextlabel"
    $P120."push"($P121)
.annotate 'line', 1248
    find_lex $P120, "$nextpost"
    unless $P120, if_1536_end
    find_lex $P121, "$ops"
    find_lex $P122, "$nextpost"
    $P121."push"($P122)
  if_1536_end:
.annotate 'line', 1249
    find_lex $P120, "$ops"
    find_lex $P121, "$testlabel"
    $P120."push_pirop"("goto", $P121)
.annotate 'line', 1250
    find_lex $P120, "$ops"
    find_lex $P121, "$handlabel"
    $P120."push"($P121)
.annotate 'line', 1251
    find_lex $P120, "$ops"
    $P120."push_pirop"(".local pmc exception")
.annotate 'line', 1252
    find_lex $P120, "$ops"
    $P120."push_pirop"(".get_results (exception)")
.annotate 'line', 1253
    find_lex $P120, "self"
    $P121 = $P120."tempreg"("P")
    store_lex "$S0", $P121
.annotate 'line', 1254
    find_lex $P120, "$ops"
    find_lex $P121, "$S0"
    $P120."push_pirop"("getattribute", $P121, "exception", "'type'")
.annotate 'line', 1255
    find_lex $P120, "$ops"
    find_lex $P121, "$S0"
    find_lex $P122, "$nextlabel"
    $P120."push_pirop"("eq", $P121, ".CONTROL_LOOP_NEXT", $P122)
.annotate 'line', 1256
    find_lex $P120, "$ops"
    find_lex $P121, "$S0"
    find_lex $P122, "$redolabel"
    $P120."push_pirop"("eq", $P121, ".CONTROL_LOOP_REDO", $P122)
.annotate 'line', 1257
    find_lex $P120, "$ops"
    find_lex $P121, "$donelabel"
    $P120."push"($P121)
.annotate 'line', 1258
    find_lex $P120, "$ops"
    $P120."push_pirop"("pop_eh")
.annotate 'line', 1210
    find_lex $P120, "$ops"
    .return ($P120)
  control_1507:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P121, exception, "payload"
    .return ($P121)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "while"  :subid("67_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["PAST";"Op"])
    .param pmc param_1540
    .param pmc param_1541 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1269
    new $P1539, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1539, control_1538
    push_eh $P1539
    .lex "self", self
    .lex "$node", param_1540
    .lex "%options", param_1541
.annotate 'line', 1270
    new $P105, "Undef"
    set $P1542, $P105
    .lex "$exprpast", $P1542
.annotate 'line', 1271
    new $P106, "Undef"
    set $P1543, $P106
    .lex "$bodypast", $P1543
.annotate 'line', 1272
    new $P107, "Undef"
    set $P1544, $P107
    .lex "$nextpast", $P1544
.annotate 'line', 1274
    new $P108, "Undef"
    set $P1545, $P108
    .lex "$exprpost", $P1545
.annotate 'line', 1276
    $P1547 = root_new ['parrot';'ResizablePMCArray']
    set $P1546, $P1547
    .lex "@arglist", $P1546
.annotate 'line', 1278
    new $P109, "Undef"
    set $P1548, $P109
    .lex "$bodypost", $P1548
.annotate 'line', 1280
    new $P110, "Undef"
    set $P1549, $P110
    .lex "$nextpost", $P1549
.annotate 'line', 1283
    new $P111, "Undef"
    set $P1550, $P111
    .lex "$testop", $P1550
.annotate 'line', 1284
    new $P112, "Undef"
    set $P1551, $P112
    .lex "$bodyfirst", $P1551
.annotate 'line', 1286
    new $P113, "Undef"
    set $P1552, $P113
    .lex "$ops", $P1552
.annotate 'line', 1270
    find_lex $P1553, "$node"
    unless_null $P1553, vivify_336
    $P1553 = root_new ['parrot';'ResizablePMCArray']
  vivify_336:
    set $P114, $P1553[0]
    unless_null $P114, vivify_337
    new $P114, "Undef"
  vivify_337:
    store_lex "$exprpast", $P114
.annotate 'line', 1271
    find_lex $P1554, "$node"
    unless_null $P1554, vivify_338
    $P1554 = root_new ['parrot';'ResizablePMCArray']
  vivify_338:
    set $P114, $P1554[1]
    unless_null $P114, vivify_339
    new $P114, "Undef"
  vivify_339:
    store_lex "$bodypast", $P114
.annotate 'line', 1272
    find_lex $P1555, "$node"
    unless_null $P1555, vivify_340
    $P1555 = root_new ['parrot';'ResizablePMCArray']
  vivify_340:
    set $P114, $P1555[2]
    unless_null $P114, vivify_341
    new $P114, "Undef"
  vivify_341:
    store_lex "$nextpast", $P114
.annotate 'line', 1274
    find_lex $P114, "self"
    find_lex $P115, "$exprpast"
    $P116 = $P114."as_post"($P115, "r" :named("rtype"))
    store_lex "$exprpost", $P116
.annotate 'line', 1276
    new $P114, "ResizablePMCArray"
    store_lex "@arglist", $P114
.annotate 'line', 1277
    find_lex $P114, "$bodypast"
    $N100 = $P114."arity"()
    islt $I100, $N100, 1.0
    if $I100, unless_1556_end
    find_lex $P115, "@arglist"
    find_lex $P116, "$exprpost"
    push $P115, $P116
  unless_1556_end:
.annotate 'line', 1278
    find_lex $P114, "self"
    find_lex $P115, "$bodypast"
    find_lex $P116, "@arglist"
    $P117 = $P114."as_post"($P115, "v" :named("rtype"), $P116 :named("arglist"))
    store_lex "$bodypost", $P117
.annotate 'line', 1280
    get_hll_global $P114, "null__P"
    store_lex "$nextpost", $P114
.annotate 'line', 1281
    find_lex $P114, "$nextpast"
    unless $P114, if_1557_end
    find_lex $P115, "self"
    find_lex $P116, "$nextpast"
    $P117 = $P115."as_post"($P116, "v" :named("rtype"))
    store_lex "$nextpost", $P117
  if_1557_end:
.annotate 'line', 1283
    find_lex $P1558, "%options"
    unless_null $P1558, vivify_342
    $P1558 = root_new ['parrot';'Hash']
  vivify_342:
    set $P114, $P1558["testop"]
    unless_null $P114, vivify_343
    new $P114, "Undef"
  vivify_343:
    store_lex "$testop", $P114
.annotate 'line', 1284
    find_lex $P1559, "%options"
    unless_null $P1559, vivify_344
    $P1559 = root_new ['parrot';'Hash']
  vivify_344:
    set $P114, $P1559["bodyfirst"]
    unless_null $P114, vivify_345
    new $P114, "Undef"
  vivify_345:
    store_lex "$bodyfirst", $P114
.annotate 'line', 1286
    find_lex $P114, "self"
    find_lex $P115, "$testop"
    find_lex $P116, "$exprpost"
    find_lex $P117, "$bodypost"
    find_lex $P118, "$bodyfirst"
    find_lex $P119, "$nextpost"
    $P120 = $P114."loop_gen"($P115 :named("testop"), $P116 :named("test"), $P117 :named("body"), $P118 :named("bodyfirst"), $P119 :named("next"))
    store_lex "$ops", $P120
.annotate 'line', 1288
    find_lex $P114, "$ops"
    find_lex $P115, "$exprpost"
    $P114."result"($P115)
.annotate 'line', 1289
    find_lex $P114, "$ops"
    find_lex $P115, "$node"
    $P114."node"($P115)
.annotate 'line', 1269
    find_lex $P114, "$ops"
    .return ($P114)
  control_1538:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, "payload"
    .return ($P115)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "until"  :subid("68_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["PAST";"Op"])
    .param pmc param_1563
    .param pmc param_1564 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1293
    new $P1562, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1562, control_1561
    push_eh $P1562
    .lex "self", self
    .lex "$node", param_1563
    .lex "%options", param_1564
.annotate 'line', 1294
    find_lex $P105, "self"
    find_lex $P106, "$node"
    find_lex $P107, "%options"
    $P108 = $P105."while"($P106, $P107 :flat, "if" :named("testop"))
.annotate 'line', 1293
    .return ($P108)
  control_1561:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "repeat_while"  :subid("69_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["PAST";"Op"])
    .param pmc param_1568
    .param pmc param_1569 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1297
    new $P1567, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1567, control_1566
    push_eh $P1567
    .lex "self", self
    .lex "$node", param_1568
    .lex "%options", param_1569
.annotate 'line', 1298
    find_lex $P105, "self"
    find_lex $P106, "$node"
    find_lex $P107, "%options"
    $P108 = $P105."while"($P106, $P107 :flat, 1 :named("bodyfirst"))
.annotate 'line', 1297
    .return ($P108)
  control_1566:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "repeat_until"  :subid("70_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["PAST";"Op"])
    .param pmc param_1573
    .param pmc param_1574 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1301
    new $P1572, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1572, control_1571
    push_eh $P1572
    .lex "self", self
    .lex "$node", param_1573
    .lex "%options", param_1574
.annotate 'line', 1302
    find_lex $P105, "self"
    find_lex $P106, "$node"
    find_lex $P107, "%options"
    $P108 = $P105."while"($P106, $P107 :flat, "if" :named("testop"), 1 :named("bodyfirst"))
.annotate 'line', 1301
    .return ($P108)
  control_1571:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "for"  :subid("71_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["PAST";"Op"])
    .param pmc param_1578
    .param pmc param_1579 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1310
    .const 'Sub' $P1597 = "72_1313886916.84408" 
    capture_lex $P1597
    new $P1577, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1577, control_1576
    push_eh $P1577
    .lex "self", self
    .lex "$node", param_1578
    .lex "%options", param_1579
.annotate 'line', 1311
    new $P105, "Undef"
    set $P1580, $P105
    .lex "$ops", $P1580
.annotate 'line', 1312
    new $P106, "Undef"
    set $P1581, $P106
    .lex "$prepost", $P1581
.annotate 'line', 1313
    new $P107, "Undef"
    set $P1582, $P107
    .lex "$testpost", $P1582
.annotate 'line', 1315
    new $P108, "Undef"
    set $P1583, $P108
    .lex "$collpast", $P1583
.annotate 'line', 1316
    new $P109, "Undef"
    set $P1584, $P109
    .lex "$bodypast", $P1584
.annotate 'line', 1318
    new $P110, "Undef"
    set $P1585, $P110
    .lex "$collpost", $P1585
.annotate 'line', 1322
    new $P111, "Undef"
    set $P1586, $P111
    .lex "$undeflabel", $P1586
.annotate 'line', 1323
    new $P112, "Undef"
    set $P1587, $P112
    .lex "$S0", $P1587
.annotate 'line', 1331
    new $P113, "Undef"
    set $P1588, $P113
    .lex "$arity", $P1588
.annotate 'line', 1340
    $P1590 = root_new ['parrot';'ResizablePMCArray']
    set $P1589, $P1590
    .lex "@arglist", $P1589
.annotate 'line', 1350
    new $P114, "Undef"
    set $P1591, $P114
    .lex "$bodypost", $P1591
.annotate 'line', 1311
    get_hll_global $P115, ["POST"], "Ops"
    find_lex $P116, "$node"
    $P117 = $P115."new"($P116 :named("node"))
    store_lex "$ops", $P117
.annotate 'line', 1312
    get_hll_global $P115, ["POST"], "Ops"
    $P116 = $P115."new"()
    store_lex "$prepost", $P116
.annotate 'line', 1313
    get_hll_global $P115, ["POST"], "Ops"
    find_lex $P116, "self"
    $P117 = $P116."tempreg"("P")
    $P118 = $P115."new"($P117 :named("result"))
    store_lex "$testpost", $P118
.annotate 'line', 1315
    find_lex $P1592, "$node"
    unless_null $P1592, vivify_346
    $P1592 = root_new ['parrot';'ResizablePMCArray']
  vivify_346:
    set $P115, $P1592[0]
    unless_null $P115, vivify_347
    new $P115, "Undef"
  vivify_347:
    store_lex "$collpast", $P115
.annotate 'line', 1316
    find_lex $P1593, "$node"
    unless_null $P1593, vivify_348
    $P1593 = root_new ['parrot';'ResizablePMCArray']
  vivify_348:
    set $P115, $P1593[1]
    unless_null $P115, vivify_349
    new $P115, "Undef"
  vivify_349:
    store_lex "$bodypast", $P115
.annotate 'line', 1318
    find_lex $P115, "self"
    find_lex $P116, "$collpast"
    $P117 = $P115."as_post"($P116, "P" :named("rtype"))
    store_lex "$collpost", $P117
.annotate 'line', 1319
    find_lex $P115, "$ops"
    find_lex $P116, "$collpost"
    $P115."push"($P116)
.annotate 'line', 1322
    get_hll_global $P115, ["POST"], "Label"
    $P116 = $P115."new"("for_undef_" :named("name"))
    store_lex "$undeflabel", $P116
.annotate 'line', 1323
    find_lex $P115, "self"
    $P116 = $P115."tempreg"("I")
    store_lex "$S0", $P116
.annotate 'line', 1324
    find_lex $P115, "$ops"
    find_lex $P116, "$S0"
    find_lex $P117, "$collpost"
    $P115."push_pirop"("defined", $P116, $P117)
.annotate 'line', 1325
    find_lex $P115, "$ops"
    find_lex $P116, "$S0"
    find_lex $P117, "$undeflabel"
    $P115."push_pirop"("unless", $P116, $P117)
.annotate 'line', 1327
    find_lex $P115, "$ops"
    find_lex $P116, "$testpost"
    find_lex $P117, "$collpost"
    $P115."push_pirop"("iter", $P116, $P117)
.annotate 'line', 1331
    new $P115, "Integer"
    assign $P115, 1
    store_lex "$arity", $P115
.annotate 'line', 1332
    find_lex $P115, "$node"
    $P116 = $P115."arity"()
    defined $I100, $P116
    if $I100, if_1594
.annotate 'line', 1335
    find_lex $P117, "$bodypast"
    $P118 = $P117."arity"()
    defined $I101, $P118
    unless $I101, if_1595_end
.annotate 'line', 1336
    find_lex $P119, "$bodypast"
    $P120 = $P119."arity"()
    store_lex "$arity", $P120
  if_1595_end:
.annotate 'line', 1335
    goto if_1594_end
  if_1594:
.annotate 'line', 1333
    find_lex $P117, "$node"
    $P118 = $P117."arity"()
    store_lex "$arity", $P118
  if_1594_end:
.annotate 'line', 1340
    new $P115, "ResizablePMCArray"
    store_lex "@arglist", $P115
.annotate 'line', 1341
    new $P117, 'ExceptionHandler'
    set_label $P117, loop1601_handler
    $P117."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P117
    goto loop1601_redo
  loop1601_test:
    find_lex $P115, "$arity"
    set $N100, $P115
    isgt $I100, $N100, 0.0
    unless $I100, loop1601_done
  loop1601_redo:
    .const 'Sub' $P1597 = "72_1313886916.84408" 
    capture_lex $P1597
    $P1597()
  loop1601_next:
    goto loop1601_test
  loop1601_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P118, exception, 'type'
    eq $P118, .CONTROL_LOOP_NEXT, loop1601_next
    eq $P118, .CONTROL_LOOP_REDO, loop1601_redo
  loop1601_done:
    pop_eh 
.annotate 'line', 1350
    find_lex $P115, "self"
    find_lex $P116, "$bodypast"
    find_lex $P117, "@arglist"
    $P118 = $P115."as_post"($P116, "v" :named("rtype"), $P117 :named("arglist"))
    store_lex "$bodypost", $P118
.annotate 'line', 1353
    find_lex $P115, "$ops"
    find_lex $P116, "self"
    find_lex $P117, "$testpost"
    find_lex $P118, "$prepost"
    find_lex $P119, "$bodypost"
    $P120 = $P116."loop_gen"($P117 :named("test"), $P118 :named("pre"), $P119 :named("body"))
    $P115."push"($P120)
.annotate 'line', 1355
    find_lex $P115, "$ops"
    find_lex $P116, "$undeflabel"
    $P115."push"($P116)
.annotate 'line', 1356
    find_lex $P115, "$ops"
    find_lex $P116, "$testpost"
    $P115."result"($P116)
.annotate 'line', 1310
    find_lex $P115, "$ops"
    .return ($P115)
  control_1576:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P116, exception, "payload"
    .return ($P116)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1596"  :anon :subid("72_1313886916.84408") :outer("71_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1342
    new $P116, "Undef"
    set $P1598, $P116
    .lex "$nextarg", $P1598
    find_lex $P117, "self"
    $P118 = $P117."tempreg"("P")
    store_lex "$nextarg", $P118
.annotate 'line', 1343
    find_lex $P117, "$prepost"
    find_lex $P118, "$nextarg"
    find_lex $P119, "$testpost"
    $P117."push_pirop"("shift", $P118, $P119)
.annotate 'line', 1344
    find_lex $P117, "$arity"
    set $N101, $P117
    islt $I101, $N101, 1.0
    unless $I101, if_1599_end
    die 0, .CONTROL_LOOP_LAST
  if_1599_end:
.annotate 'line', 1345
    find_lex $P117, "@arglist"
    find_lex $P118, "$nextarg"
    push $P117, $P118
.annotate 'line', 1341
    find_lex $P117, "$arity"
    clone $P1600, $P117
    dec $P117
    .return ($P1600)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "list"  :subid("73_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["PAST";"Op"])
    .param pmc param_1605
    .param pmc param_1606 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1366
    .const 'Sub' $P1614 = "74_1313886916.84408" 
    capture_lex $P1614
    new $P1604, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1604, control_1603
    push_eh $P1604
    .lex "self", self
    .lex "$node", param_1605
    .lex "%options", param_1606
.annotate 'line', 1368
    new $P105, "Undef"
    set $P1607, $P105
    .lex "$ops", $P1607
.annotate 'line', 1369
    $P1609 = root_new ['parrot';'ResizablePMCArray']
    set $P1608, $P1609
    .lex "@posargs", $P1608
.annotate 'line', 1377
    new $P106, "Undef"
    set $P1610, $P106
    .lex "$returns", $P1610
.annotate 'line', 1380
    new $P107, "Undef"
    set $P1611, $P107
    .lex "$listpost", $P1611
.annotate 'line', 1366
    find_lex $P108, "$ops"
    find_lex $P108, "@posargs"
.annotate 'line', 1370

        $P0 = find_lex '$node'
        ($P0, $P1) = self.'post_children'($P0, 'signature'=>'v*')
        store_lex '$ops', $P0
        store_lex '@posargs', $P1
    
.annotate 'line', 1377
    find_lex $P108, "$node"
    $P109 = $P108."returns"()
    store_lex "$returns", $P109
.annotate 'line', 1378
    find_lex $P108, "$returns"
    if $P108, unless_1612_end
    new $P109, "String"
    assign $P109, "ResizablePMCArray"
    store_lex "$returns", $P109
  unless_1612_end:
.annotate 'line', 1380
    find_lex $P108, "self"
    find_lex $P109, "$returns"
    $P110 = $P108."as_vivipost"($P109, "P" :named("rtype"))
    store_lex "$listpost", $P110
.annotate 'line', 1381
    find_lex $P108, "$ops"
    find_lex $P109, "$listpost"
    $P108."result"($P109)
.annotate 'line', 1382
    find_lex $P108, "$ops"
    find_lex $P109, "$listpost"
    $P108."push"($P109)
.annotate 'line', 1383
    find_lex $P109, "@posargs"
    defined $I100, $P109
    unless $I100, for_undef_350
    iter $P108, $P109
    new $P115, 'ExceptionHandler'
    set_label $P115, loop1616_handler
    $P115."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P115
  loop1616_test:
    unless $P108, loop1616_done
    shift $P110, $P108
  loop1616_redo:
    .const 'Sub' $P1614 = "74_1313886916.84408" 
    capture_lex $P1614
    $P1614($P110)
  loop1616_next:
    goto loop1616_test
  loop1616_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P116, exception, 'type'
    eq $P116, .CONTROL_LOOP_NEXT, loop1616_next
    eq $P116, .CONTROL_LOOP_REDO, loop1616_redo
  loop1616_done:
    pop_eh 
  for_undef_350:
.annotate 'line', 1366
    find_lex $P108, "$ops"
    .return ($P108)
  control_1603:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1613"  :anon :subid("74_1313886916.84408") :outer("73_1313886916.84408")
    .param pmc param_1615
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1383
    .lex "$_", param_1615
    find_lex $P111, "$ops"
    find_lex $P112, "$listpost"
    find_lex $P113, "$_"
    $P114 = $P111."push_pirop"("push", $P112, $P113)
    .return ($P114)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "stmts"  :subid("75_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["PAST";"Op"])
    .param pmc param_1620
    .param pmc param_1621 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1392
    new $P1619, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1619, control_1618
    push_eh $P1619
    .lex "self", self
    .lex "$node", param_1620
    .lex "%options", param_1621
.annotate 'line', 1393
    find_lex $P105, "self"
    find_lex $P106, "$node"
    find_lex $P107, "%options"
    $P108 = $P105."node_as_post"($P106, $P107)
.annotate 'line', 1392
    .return ($P108)
  control_1618:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "null"  :subid("76_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["PAST";"Op"])
    .param pmc param_1625
    .param pmc param_1626 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1403
    new $P1624, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1624, control_1623
    push_eh $P1624
    .lex "self", self
    .lex "$node", param_1625
    .lex "%options", param_1626
.annotate 'line', 1404
    get_hll_global $P105, ["POST"], "Ops"
    find_lex $P106, "$node"
    $P107 = $P105."new"($P106 :named("node"))
.annotate 'line', 1403
    .return ($P107)
  control_1623:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "return"  :subid("77_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["PAST";"Op"])
    .param pmc param_1630
    .param pmc param_1631 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1412
    .const 'Sub' $P1639 = "78_1313886916.84408" 
    capture_lex $P1639
    new $P1629, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1629, control_1628
    push_eh $P1629
    .lex "self", self
    .lex "$node", param_1630
    .lex "%options", param_1631
.annotate 'line', 1413
    new $P105, "Undef"
    set $P1632, $P105
    .lex "$ops", $P1632
.annotate 'line', 1415
    new $P106, "Undef"
    set $P1633, $P106
    .lex "$exreg", $P1633
.annotate 'line', 1416
    new $P107, "Undef"
    set $P1634, $P107
    .lex "$extype", $P1634
.annotate 'line', 1421
    new $P108, "Undef"
    set $P1635, $P108
    .lex "$cpast", $P1635
.annotate 'line', 1413
    get_hll_global $P109, ["POST"], "Ops"
    find_lex $P110, "$node"
    $P111 = $P109."new"($P110 :named("node"))
    store_lex "$ops", $P111
.annotate 'line', 1415
    find_lex $P109, "self"
    $P110 = $P109."tempreg"("P")
    store_lex "$exreg", $P110
.annotate 'line', 1416
    find_lex $P109, "$exreg"
    concat $P110, $P109, "['type']"
    store_lex "$extype", $P110
.annotate 'line', 1417
    find_lex $P109, "$ops"
    find_lex $P110, "$exreg"
    $P109."push_pirop"("new", $P110, "\"Exception\"")
.annotate 'line', 1418
    find_lex $P109, "$ops"
    find_lex $P110, "$extype"
    $P109."push_pirop"("set", $P110, ".CONTROL_RETURN")
.annotate 'line', 1419
    find_dynamic_lex $P109, "$*SUB"
    unless_null $P109, vivify_351
    get_hll_global $P109, "$SUB"
    unless_null $P109, vivify_352
    die "Contextual $*SUB not found"
  vivify_352:
  vivify_351:
    $P109."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 1421
    find_lex $P1636, "$node"
    unless_null $P1636, vivify_353
    $P1636 = root_new ['parrot';'ResizablePMCArray']
  vivify_353:
    set $P109, $P1636[0]
    unless_null $P109, vivify_354
    new $P109, "Undef"
  vivify_354:
    store_lex "$cpast", $P109
.annotate 'line', 1422
    find_lex $P109, "$cpast"
    unless $P109, if_1637_end
    .const 'Sub' $P1639 = "78_1313886916.84408" 
    capture_lex $P1639
    $P1639()
  if_1637_end:
.annotate 'line', 1428
    find_lex $P109, "$ops"
    find_lex $P110, "$exreg"
    $P109."push_pirop"("throw", $P110)
.annotate 'line', 1412
    find_lex $P109, "$ops"
    .return ($P109)
  control_1628:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1638"  :anon :subid("78_1313886916.84408") :outer("77_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1423
    new $P110, "Undef"
    set $P1640, $P110
    .lex "$cpost", $P1640
    find_lex $P111, "self"
    find_lex $P112, "$cpast"
    $P113 = $P111."as_post"($P112, "P" :named("rtype"))
    store_lex "$cpost", $P113
.annotate 'line', 1424
    find_lex $P111, "self"
    find_lex $P112, "$cpost"
    $P113 = $P111."coerce"($P112, "P")
    store_lex "$cpost", $P113
.annotate 'line', 1425
    find_lex $P111, "$ops"
    find_lex $P112, "$cpost"
    $P111."push"($P112)
.annotate 'line', 1426
    find_lex $P111, "$ops"
    find_lex $P112, "$exreg"
    find_lex $P113, "$cpost"
    $P114 = $P111."push_pirop"("setattribute", $P112, "'payload'", $P113)
.annotate 'line', 1422
    .return ($P114)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "try"  :subid("79_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["PAST";"Op"])
    .param pmc param_1644
    .param pmc param_1645 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1440
    new $P1643, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1643, control_1642
    push_eh $P1643
    .lex "self", self
    .lex "$node", param_1644
    .lex "%options", param_1645
.annotate 'line', 1441
    new $P105, "Undef"
    set $P1646, $P105
    .lex "$ops", $P1646
.annotate 'line', 1443
    new $P106, "Undef"
    set $P1647, $P106
    .lex "$S0", $P1647
.annotate 'line', 1444
    new $P107, "Undef"
    set $P1648, $P107
    .lex "$catchlabel", $P1648
.annotate 'line', 1445
    new $P108, "Undef"
    set $P1649, $P108
    .lex "$endlabel", $P1649
.annotate 'line', 1447
    new $P109, "Undef"
    set $P1650, $P109
    .lex "$rtype", $P1650
.annotate 'line', 1449
    new $P110, "Undef"
    set $P1651, $P110
    .lex "$trypost", $P1651
.annotate 'line', 1453
    new $P111, "Undef"
    set $P1652, $P111
    .lex "$elsepast", $P1652
.annotate 'line', 1459
    new $P112, "Undef"
    set $P1653, $P112
    .lex "$catchpast", $P1653
.annotate 'line', 1441
    get_hll_global $P113, ["POST"], "Ops"
    find_lex $P114, "$node"
    $P115 = $P113."new"($P114 :named("node"))
    store_lex "$ops", $P115
.annotate 'line', 1443
    find_lex $P113, "self"
    $P114 = $P113."unique"("catch_")
    store_lex "$S0", $P114
.annotate 'line', 1444
    get_hll_global $P113, ["POST"], "Label"
    find_lex $P114, "$S0"
    $P115 = $P113."new"($P114 :named("result"))
    store_lex "$catchlabel", $P115
.annotate 'line', 1445
    get_hll_global $P113, ["POST"], "Lable"
    find_lex $P114, "$S0"
    concat $P115, $P114, "_end"
    $P116 = $P113."new"($P115 :named("result"))
    store_lex "$endlabel", $P116
.annotate 'line', 1447
    find_lex $P1654, "%options"
    unless_null $P1654, vivify_355
    $P1654 = root_new ['parrot';'Hash']
  vivify_355:
    set $P113, $P1654["rtype"]
    unless_null $P113, vivify_356
    new $P113, "Undef"
  vivify_356:
    store_lex "$rtype", $P113
.annotate 'line', 1449
    find_lex $P113, "self"
    find_lex $P1655, "$node"
    unless_null $P1655, vivify_357
    $P1655 = root_new ['parrot';'ResizablePMCArray']
  vivify_357:
    set $P114, $P1655[0]
    unless_null $P114, vivify_358
    new $P114, "Undef"
  vivify_358:
    find_lex $P115, "$rtype"
    $P116 = $P113."as_post"($P114, $P115 :named("rtype"))
    store_lex "$trypost", $P116
.annotate 'line', 1450
    find_lex $P113, "$ops"
    find_lex $P114, "$catchlabel"
    $P113."push_pirop"("push_eh", $P114)
.annotate 'line', 1451
    find_lex $P113, "$ops"
    find_lex $P114, "$trypost"
    $P113."push"($P114)
.annotate 'line', 1452
    find_lex $P113, "$ops"
    $P113."push_pirop"("pop_eh")
.annotate 'line', 1453
    find_lex $P1656, "$node"
    unless_null $P1656, vivify_359
    $P1656 = root_new ['parrot';'ResizablePMCArray']
  vivify_359:
    set $P113, $P1656[2]
    unless_null $P113, vivify_360
    new $P113, "Undef"
  vivify_360:
    store_lex "$elsepast", $P113
.annotate 'line', 1454
    find_lex $P113, "$elsepast"
    unless $P113, if_1657_end
.annotate 'line', 1455
    find_lex $P114, "$ops"
    find_lex $P115, "self"
    find_lex $P116, "$elsepast"
    $P117 = $P115."as_post"($P116, "v" :named("rtype"))
    $P114."push"($P117)
  if_1657_end:
.annotate 'line', 1457
    find_lex $P113, "$ops"
    find_lex $P114, "$endlabel"
    $P113."push_pirop"("goto", $P114)
.annotate 'line', 1458
    find_lex $P113, "$ops"
    find_lex $P114, "$catchlabel"
    $P113."push"($P114)
.annotate 'line', 1459
    find_lex $P1658, "$node"
    unless_null $P1658, vivify_361
    $P1658 = root_new ['parrot';'ResizablePMCArray']
  vivify_361:
    set $P113, $P1658[1]
    unless_null $P113, vivify_362
    new $P113, "Undef"
  vivify_362:
    store_lex "$catchpast", $P113
.annotate 'line', 1460
    find_lex $P113, "$catchpast"
    unless $P113, if_1659_end
.annotate 'line', 1461
    find_lex $P114, "$ops"
    find_lex $P115, "self"
    find_lex $P116, "$catchpast"
    $P117 = $P115."as_post"($P116, "v" :named("rtype"))
    $P114."push"($P117)
.annotate 'line', 1462
    find_lex $P114, "$ops"
    $P114."push_pirop"("pop_eh")
  if_1659_end:
.annotate 'line', 1464
    find_lex $P113, "$ops"
    find_lex $P114, "$endlabel"
    $P113."push"($P114)
.annotate 'line', 1465
    find_lex $P113, "$ops"
    find_lex $P114, "$trypost"
    $P113."result"($P114)
.annotate 'line', 1440
    find_lex $P113, "$ops"
    .return ($P113)
  control_1642:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, "payload"
    .return ($P114)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "chain"  :subid("80_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["PAST";"Op"])
    .param pmc param_1663
    .param pmc param_1664 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1478
    .const 'Sub' $P1679 = "82_1313886916.84408" 
    capture_lex $P1679
    .const 'Sub' $P1672 = "81_1313886916.84408" 
    capture_lex $P1672
    new $P1662, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1662, control_1661
    push_eh $P1662
    .lex "self", self
    .lex "$node", param_1663
    .lex "%options", param_1664
.annotate 'line', 1480
    $P1666 = root_new ['parrot';'ResizablePMCArray']
    set $P1665, $P1666
    .lex "@clist", $P1665
.annotate 'line', 1481
    new $P105, "Undef"
    set $P1667, $P105
    .lex "$cpast", $P1667
.annotate 'line', 1489
    new $P106, "Undef"
    set $P1668, $P106
    .lex "$ops", $P1668
.annotate 'line', 1491
    new $P107, "Undef"
    set $P1669, $P107
    .lex "$endlabel", $P1669
.annotate 'line', 1494
    new $P108, "Undef"
    set $P1670, $P108
    .lex "$apost", $P1670
.annotate 'line', 1480
    new $P109, "ResizablePMCArray"
    store_lex "@clist", $P109
.annotate 'line', 1481
    find_lex $P109, "$node"
    store_lex "$cpast", $P109
.annotate 'line', 1482
    new $P114, 'ExceptionHandler'
    set_label $P114, loop1676_handler
    $P114."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P114
  loop1676_test:
    find_lex $P109, "$cpast"
    get_hll_global $P110, ["PAST"], "Op"
    $P111 = $P109."isa"($P110)
    unless $P111, loop1676_done
  loop1676_redo:
    .const 'Sub' $P1672 = "81_1313886916.84408" 
    capture_lex $P1672
    $P1672()
  loop1676_next:
    goto loop1676_test
  loop1676_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, 'type'
    eq $P115, .CONTROL_LOOP_NEXT, loop1676_next
    eq $P115, .CONTROL_LOOP_REDO, loop1676_redo
  loop1676_done:
    pop_eh 
.annotate 'line', 1489
    get_hll_global $P109, ["POST"], "Ops"
    find_lex $P110, "$node"
    $P111 = $P109."new"($P110 :named("node"))
    store_lex "$ops", $P111
.annotate 'line', 1490
    find_lex $P109, "$ops"
    find_lex $P110, "self"
    $P111 = $P110."unique"("$P")
    $P109."result"($P111)
.annotate 'line', 1491
    get_hll_global $P109, ["POST"], "Label"
    $P110 = $P109."new"("chain_end_" :named("name"))
    store_lex "$endlabel", $P110
.annotate 'line', 1493
    find_lex $P109, "@clist"
    pop $P110, $P109
    store_lex "$cpast", $P110
.annotate 'line', 1494
    find_lex $P109, "self"
    find_lex $P1677, "$cpast"
    unless_null $P1677, vivify_365
    $P1677 = root_new ['parrot';'ResizablePMCArray']
  vivify_365:
    set $P110, $P1677[0]
    unless_null $P110, vivify_366
    new $P110, "Undef"
  vivify_366:
    $P111 = $P109."as_post"($P110, "P" :named("rtype"))
    store_lex "$apost", $P111
.annotate 'line', 1495
    find_lex $P109, "$ops"
    find_lex $P110, "$apost"
    $P109."push"($P110)
.annotate 'line', 1497
    new $P113, 'ExceptionHandler'
    set_label $P113, loop1684_handler
    $P113."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P113
  loop1684_test:
    new $P109, "Integer"
    assign $P109, 1
    unless $P109, loop1684_done
  loop1684_redo:
    .const 'Sub' $P1679 = "82_1313886916.84408" 
    capture_lex $P1679
    $P1679()
  loop1684_next:
    goto loop1684_test
  loop1684_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, 'type'
    eq $P114, .CONTROL_LOOP_NEXT, loop1684_next
    eq $P114, .CONTROL_LOOP_REDO, loop1684_redo
  loop1684_done:
    pop_eh 
.annotate 'line', 1507
    find_lex $P109, "$ops"
    find_lex $P110, "$endlabel"
    $P109."push"($P110)
.annotate 'line', 1478
    find_lex $P109, "$ops"
    .return ($P109)
  control_1661:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1671"  :anon :subid("81_1313886916.84408") :outer("80_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1483
    new $P112, "Undef"
    set $P1673, $P112
    .lex "$pasttype", $P1673
    find_lex $P113, "$cpast"
    $P114 = $P113."pasttype"()
    store_lex "$pasttype", $P114
.annotate 'line', 1484
    find_lex $P113, "$pasttype"
    set $S100, $P113
    isne $I100, $S100, "chain"
    unless $I100, if_1674_end
    die 0, .CONTROL_LOOP_LAST
  if_1674_end:
.annotate 'line', 1485
    find_lex $P113, "@clist"
    find_lex $P114, "$cpast"
    push $P113, $P114
.annotate 'line', 1486
    find_lex $P1675, "$cpast"
    unless_null $P1675, vivify_363
    $P1675 = root_new ['parrot';'ResizablePMCArray']
  vivify_363:
    set $P113, $P1675[0]
    unless_null $P113, vivify_364
    new $P113, "Undef"
  vivify_364:
    store_lex "$cpast", $P113
.annotate 'line', 1482
    .return ($P113)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1678"  :anon :subid("82_1313886916.84408") :outer("80_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1498
    new $P110, "Undef"
    set $P1680, $P110
    .lex "$bpost", $P1680
.annotate 'line', 1500
    new $P111, "Undef"
    set $P1681, $P111
    .lex "$name", $P1681
.annotate 'line', 1498
    find_lex $P112, "self"
    find_lex $P1682, "$cpast"
    unless_null $P1682, vivify_367
    $P1682 = root_new ['parrot';'ResizablePMCArray']
  vivify_367:
    set $P113, $P1682[1]
    unless_null $P113, vivify_368
    new $P113, "Undef"
  vivify_368:
    $P114 = $P112."as_post"($P113, "P" :named("rtype"))
    store_lex "$bpost", $P114
.annotate 'line', 1499
    find_lex $P112, "$ops"
    find_lex $P113, "$bpost"
    $P112."push"($P113)
.annotate 'line', 1500
    find_lex $P112, "self"
    find_lex $P113, "$cpast"
    $P114 = $P113."name"()
    $P115 = $P112."escape"($P114)
    store_lex "$name", $P115
.annotate 'line', 1501
    find_lex $P112, "$ops"
    find_lex $P113, "$name"
    find_lex $P114, "$apost"
    find_lex $P115, "$bpost"
    find_lex $P116, "$ops"
    $P112."push_pirop"("call", $P113, $P114, $P115, $P116 :named("result"))
.annotate 'line', 1502
    find_lex $P112, "@clist"
    if $P112, unless_1683_end
    die 0, .CONTROL_LOOP_LAST
  unless_1683_end:
.annotate 'line', 1503
    find_lex $P112, "$ops"
    find_lex $P113, "$ops"
    find_lex $P114, "$endlabel"
    $P112."push_pirop"("unless", $P113, $P114)
.annotate 'line', 1504
    find_lex $P112, "@clist"
    pop $P113, $P112
    store_lex "$cpast", $P113
.annotate 'line', 1505
    find_lex $P112, "$bpost"
    store_lex "$apost", $P112
.annotate 'line', 1497
    .return ($P112)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "def_or"  :subid("83_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["PAST";"Op"])
    .param pmc param_1688
    .param pmc param_1689 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1518
    new $P1687, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1687, control_1686
    push_eh $P1687
    .lex "self", self
    .lex "$node", param_1688
    .lex "%options", param_1689
.annotate 'line', 1519
    new $P105, "Undef"
    set $P1690, $P105
    .lex "$ops", $P1690
.annotate 'line', 1521
    new $P106, "Undef"
    set $P1691, $P106
    .lex "$lpost", $P1691
.annotate 'line', 1525
    new $P107, "Undef"
    set $P1692, $P107
    .lex "$endlabel", $P1692
.annotate 'line', 1527
    new $P108, "Undef"
    set $P1693, $P108
    .lex "$reg", $P1693
.annotate 'line', 1530
    new $P109, "Undef"
    set $P1694, $P109
    .lex "$rpost", $P1694
.annotate 'line', 1519
    get_hll_global $P110, ["POST"], "Ops"
    find_lex $P111, "$node"
    find_lex $P112, "self"
    $P113 = $P112."unique"("$P")
    $P114 = $P110."new"($P111 :named("node"), $P113 :named("result"))
    store_lex "$ops", $P114
.annotate 'line', 1521
    find_lex $P110, "self"
    find_lex $P1695, "$node"
    unless_null $P1695, vivify_369
    $P1695 = root_new ['parrot';'ResizablePMCArray']
  vivify_369:
    set $P111, $P1695[0]
    unless_null $P111, vivify_370
    new $P111, "Undef"
  vivify_370:
    $P112 = $P110."as_post"($P111, "P" :named("rtype"))
    store_lex "$lpost", $P112
.annotate 'line', 1522
    find_lex $P110, "$ops"
    find_lex $P111, "$lpost"
    $P110."push"($P111)
.annotate 'line', 1523
    find_lex $P110, "$ops"
    find_lex $P111, "$ops"
    find_lex $P112, "$lpost"
    $P110."push_pirop"("set", $P111, $P112)
.annotate 'line', 1525
    get_hll_global $P110, ["POST"], "Label"
    find_lex $P111, "self"
    $P112 = $P111."unique"("default_")
    $P113 = $P110."new"($P112 :named("result"))
    store_lex "$endlabel", $P113
.annotate 'line', 1527
    find_lex $P110, "self"
    $P111 = $P110."unique"("$I")
    store_lex "$reg", $P111
.annotate 'line', 1528
    find_lex $P110, "$ops"
    find_lex $P111, "$reg"
    find_lex $P112, "$ops"
    $P110."push_pirop"("defined", $P111, $P112)
.annotate 'line', 1529
    find_lex $P110, "$ops"
    find_lex $P111, "$reg"
    find_lex $P112, "$endlabel"
    $P110."push_pirop"("if", $P111, $P112)
.annotate 'line', 1530
    find_lex $P110, "self"
    find_lex $P1696, "$node"
    unless_null $P1696, vivify_371
    $P1696 = root_new ['parrot';'ResizablePMCArray']
  vivify_371:
    set $P111, $P1696[1]
    unless_null $P111, vivify_372
    new $P111, "Undef"
  vivify_372:
    $P112 = $P110."as_post"($P111, "P" :named("rtype"))
    store_lex "$rpost", $P112
.annotate 'line', 1531
    find_lex $P110, "$ops"
    find_lex $P111, "$rpost"
    $P110."push"($P111)
.annotate 'line', 1532
    find_lex $P110, "$ops"
    find_lex $P111, "$ops"
    find_lex $P112, "$rpost"
    $P110."push_pirop"("set", $P111, $P112)
.annotate 'line', 1533
    find_lex $P110, "$ops"
    find_lex $P111, "$endlabel"
    $P110."push"($P111)
.annotate 'line', 1518
    find_lex $P110, "$ops"
    .return ($P110)
  control_1686:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "xor"  :subid("84_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["PAST";"Op"])
    .param pmc param_1700
    .param pmc param_1701 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1544
    .const 'Sub' $P1712 = "85_1313886916.84408" 
    capture_lex $P1712
    new $P1699, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1699, control_1698
    push_eh $P1699
    .lex "self", self
    .lex "$node", param_1700
    .lex "%options", param_1701
.annotate 'line', 1545
    new $P105, "Undef"
    set $P1702, $P105
    .lex "$ops", $P1702
.annotate 'line', 1548
    new $P106, "Undef"
    set $P1703, $P106
    .lex "$falselabel", $P1703
.annotate 'line', 1549
    new $P107, "Undef"
    set $P1704, $P107
    .lex "$endlabel", $P1704
.annotate 'line', 1551
    new $P108, "Undef"
    set $P1705, $P108
    .lex "$i", $P1705
.annotate 'line', 1552
    new $P109, "Undef"
    set $P1706, $P109
    .lex "$t", $P1706
.annotate 'line', 1553
    new $P110, "Undef"
    set $P1707, $P110
    .lex "$u", $P1707
.annotate 'line', 1554
    new $P111, "Undef"
    set $P1708, $P111
    .lex "$iter", $P1708
.annotate 'line', 1555
    new $P112, "Undef"
    set $P1709, $P112
    .lex "$apost", $P1709
.annotate 'line', 1556
    new $P113, "Undef"
    set $P1710, $P113
    .lex "$bpost", $P1710
.annotate 'line', 1545
    get_hll_global $P114, ["POST"], "Ops"
    find_lex $P115, "$node"
    $P116 = $P114."new"($P115 :named("node"))
    store_lex "$ops", $P116
.annotate 'line', 1546
    find_lex $P114, "$ops"
    find_lex $P115, "self"
    $P116 = $P115."unique"("$P")
    $P114."result"($P116)
.annotate 'line', 1548
    get_hll_global $P114, ["POST"], "Label"
    $P115 = $P114."new"("xor_false" :named("name"))
    store_lex "$falselabel", $P115
.annotate 'line', 1549
    get_hll_global $P114, ["POST"], "Label"
    $P115 = $P114."new"("xor_end" :named("name"))
    store_lex "$endlabel", $P115
.annotate 'line', 1551
    find_lex $P114, "self"
    $P115 = $P114."unique"("$I")
    store_lex "$i", $P115
.annotate 'line', 1552
    find_lex $P114, "self"
    $P115 = $P114."unique"("$i")
    store_lex "$t", $P115
.annotate 'line', 1553
    find_lex $P114, "self"
    $P115 = $P114."unique"("$i")
    store_lex "$u", $P115
.annotate 'line', 1554
    get_hll_global $P114, "node"
    $P115 = $P114."iterator"()
    store_lex "$iter", $P115
.annotate 'line', 1555
    find_lex $P114, "self"
    find_lex $P115, "$iter"
    shift $P116, $P115
    $P117 = $P114."as_post"($P116, "P" :named("rtype"))
    store_lex "$apost", $P117
.annotate 'line', 1544
    find_lex $P114, "$bpost"
.annotate 'line', 1557
    find_lex $P114, "$ops"
    find_lex $P115, "$apost"
    $P114."push"($P115)
.annotate 'line', 1558
    find_lex $P114, "$ops"
    find_lex $P115, "$ops"
    find_lex $P116, "$apost"
    $P114."push_pirop"("set", $P115, $P116)
.annotate 'line', 1559
    find_lex $P114, "$ops"
    find_lex $P115, "$t"
    find_lex $P116, "$apost"
    $P114."push_pirop"("istrue", $P115, $P116)
.annotate 'line', 1560
    new $P116, 'ExceptionHandler'
    set_label $P116, loop1715_handler
    $P116."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P116
  loop1715_test:
    new $P114, "Integer"
    assign $P114, 1
    unless $P114, loop1715_done
  loop1715_redo:
    .const 'Sub' $P1712 = "85_1313886916.84408" 
    capture_lex $P1712
    $P1712()
  loop1715_next:
    goto loop1715_test
  loop1715_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P117, exception, 'type'
    eq $P117, .CONTROL_LOOP_NEXT, loop1715_next
    eq $P117, .CONTROL_LOOP_REDO, loop1715_redo
  loop1715_done:
    pop_eh 
.annotate 'line', 1573
    find_lex $P114, "$ops"
    find_lex $P115, "$t"
    find_lex $P116, "$endlabel"
    $P114."push_pirop"("if", $P115, $P116)
.annotate 'line', 1574
    find_lex $P114, "$ops"
    find_lex $P115, "$ops"
    find_lex $P116, "$bpost"
    $P114."push_pirop"("set", $P115, $P116)
.annotate 'line', 1575
    find_lex $P114, "$ops"
    find_lex $P115, "$endlabel"
    $P114."push_pirop"("goto", $P115)
.annotate 'line', 1576
    find_lex $P114, "$ops"
    find_lex $P115, "$falselabel"
    $P114."push"($P115)
.annotate 'line', 1577
    find_lex $P114, "$ops"
    find_lex $P115, "$ops"
    $P114."push_pirop"("new", $P115, "\"Undef\"")
.annotate 'line', 1578
    find_lex $P114, "$ops"
    find_lex $P115, "$endlabel"
    $P114."push"($P115)
.annotate 'line', 1544
    find_lex $P114, "$ops"
    .return ($P114)
  control_1698:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, "payload"
    .return ($P115)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1711"  :anon :subid("85_1313886916.84408") :outer("84_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1567
    new $P115, "Undef"
    set $P1713, $P115
    .lex "$truelabel", $P1713
.annotate 'line', 1561
    find_lex $P116, "self"
    find_lex $P117, "$iter"
    shift $P118, $P117
    $P119 = $P116."as_post"($P118, "P" :named("rtype"))
    store_lex "$bpost", $P119
.annotate 'line', 1562
    find_lex $P116, "$ops"
    find_lex $P117, "$bpost"
    $P116."push"($P117)
.annotate 'line', 1563
    find_lex $P116, "$ops"
    find_lex $P117, "$u"
    find_lex $P118, "$bpost"
    $P116."push_pirop"("istrue", $P117, $P118)
.annotate 'line', 1564
    find_lex $P116, "$ops"
    find_lex $P117, "$i"
    find_lex $P118, "$t"
    find_lex $P119, "$u"
    $P116."push_pirop"("and", $P117, $P118, $P119)
.annotate 'line', 1565
    find_lex $P116, "$ops"
    find_lex $P117, "$i"
    find_lex $P118, "$falselabel"
    $P116."push_pirop"("if", $P117, $P118)
.annotate 'line', 1566
    find_lex $P116, "$iter"
    if $P116, unless_1714_end
    die 0, .CONTROL_LOOP_LAST
  unless_1714_end:
.annotate 'line', 1567
    get_hll_global $P116, ["POST"], "Label"
    $P117 = $P116."new"("xor_true" :named("name"))
    store_lex "$truelabel", $P117
.annotate 'line', 1568
    find_lex $P116, "$ops"
    find_lex $P117, "$t"
    find_lex $P118, "$truelabel"
    $P116."push_pirop"("if", $P117, $P118)
.annotate 'line', 1569
    find_lex $P116, "$ops"
    find_lex $P117, "$ops"
    find_lex $P118, "$bpost"
    $P116."push_pirop"("set", $P117, $P118)
.annotate 'line', 1570
    find_lex $P116, "$ops"
    find_lex $P117, "$t"
    find_lex $P118, "$u"
    $P116."push_pirop"("set", $P117, $P118)
.annotate 'line', 1571
    find_lex $P116, "$ops"
    find_lex $P117, "$truelabel"
    $P118 = $P116."push"($P117)
.annotate 'line', 1560
    .return ($P118)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "bind"  :subid("86_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["PAST";"Op"])
    .param pmc param_1719
    .param pmc param_1720 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1587
    new $P1718, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1718, control_1717
    push_eh $P1718
    .lex "self", self
    .lex "$node", param_1719
    .lex "%options", param_1720
.annotate 'line', 1588
    new $P105, "Undef"
    set $P1721, $P105
    .lex "$lpast", $P1721
.annotate 'line', 1589
    new $P106, "Undef"
    set $P1722, $P106
    .lex "$rpast", $P1722
.annotate 'line', 1591
    new $P107, "Undef"
    set $P1723, $P107
    .lex "$ops", $P1723
.annotate 'line', 1592
    new $P108, "Undef"
    set $P1724, $P108
    .lex "$rpost", $P1724
.annotate 'line', 1597
    new $P109, "Undef"
    set $P1725, $P109
    .lex "$lpost", $P1725
.annotate 'line', 1588
    find_lex $P1726, "$node"
    unless_null $P1726, vivify_373
    $P1726 = root_new ['parrot';'ResizablePMCArray']
  vivify_373:
    set $P110, $P1726[0]
    unless_null $P110, vivify_374
    new $P110, "Undef"
  vivify_374:
    store_lex "$lpast", $P110
.annotate 'line', 1589
    find_lex $P1727, "$node"
    unless_null $P1727, vivify_375
    $P1727 = root_new ['parrot';'ResizablePMCArray']
  vivify_375:
    set $P110, $P1727[1]
    unless_null $P110, vivify_376
    new $P110, "Undef"
  vivify_376:
    store_lex "$rpast", $P110
.annotate 'line', 1591
    get_hll_global $P110, ["POST"], "Ops"
    find_lex $P111, "$node"
    $P112 = $P110."new"($P111 :named("node"))
    store_lex "$ops", $P112
.annotate 'line', 1592
    find_lex $P110, "self"
    find_lex $P111, "$rpast"
    $P112 = $P110."as_post"($P111, "P" :named("rtype"))
    store_lex "$rpost", $P112
.annotate 'line', 1593
    find_lex $P110, "self"
    find_lex $P111, "$rpost"
    $P112 = $P110."coerce"($P111, "P")
    store_lex "$rpost", $P112
.annotate 'line', 1594
    find_lex $P110, "$ops"
    find_lex $P111, "$rpost"
    $P110."push"($P111)
.annotate 'line', 1596
    find_lex $P110, "$lpast"
    $P110."lvalue"(1)
.annotate 'line', 1597
    find_lex $P110, "self"
    find_lex $P111, "$lpast"
    find_lex $P112, "$rpost"
    $P113 = $P110."as_post"($P111, $P112 :named("bindpost"))
    store_lex "$lpost", $P113
.annotate 'line', 1598
    find_lex $P110, "$ops"
    find_lex $P111, "$lpost"
    $P110."push"($P111)
.annotate 'line', 1599
    find_lex $P110, "$ops"
    find_lex $P111, "$lpost"
    $P110."result"($P111)
.annotate 'line', 1587
    find_lex $P110, "$ops"
    .return ($P110)
  control_1717:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "copy"  :subid("87_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["PAST";"Op"])
    .param pmc param_1731
    .param pmc param_1732 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1607
    new $P1730, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1730, control_1729
    push_eh $P1730
    .lex "self", self
    .lex "$node", param_1731
    .lex "%options", param_1732
.annotate 'line', 1608
    new $P105, "Undef"
    set $P1733, $P105
    .lex "$rpost", $P1733
.annotate 'line', 1609
    new $P106, "Undef"
    set $P1734, $P106
    .lex "$lpost", $P1734
.annotate 'line', 1610
    new $P107, "Undef"
    set $P1735, $P107
    .lex "$ops", $P1735
.annotate 'line', 1608
    find_lex $P108, "self"
    find_lex $P1736, "$node"
    unless_null $P1736, vivify_377
    $P1736 = root_new ['parrot';'ResizablePMCArray']
  vivify_377:
    set $P109, $P1736[1]
    unless_null $P109, vivify_378
    new $P109, "Undef"
  vivify_378:
    $P110 = $P108."as_post"($P109, "P" :named("rtype"))
    store_lex "$rpost", $P110
.annotate 'line', 1609
    find_lex $P108, "self"
    find_lex $P1737, "$node"
    unless_null $P1737, vivify_379
    $P1737 = root_new ['parrot';'ResizablePMCArray']
  vivify_379:
    set $P109, $P1737[0]
    unless_null $P109, vivify_380
    new $P109, "Undef"
  vivify_380:
    $P110 = $P108."as_post"($P109, "P" :named("rtype"))
    store_lex "$lpost", $P110
.annotate 'line', 1610
    get_hll_global $P108, ["POST"], "Ops"
    find_lex $P109, "$rpost"
    find_lex $P110, "$lpost"
    find_lex $P111, "$node"
    find_lex $P112, "$lpost"
    $P113 = $P108."new"($P109, $P110, $P111 :named("node"), $P112 :named("result"))
    store_lex "$ops", $P113
.annotate 'line', 1612
    find_lex $P108, "$ops"
    find_lex $P109, "$lpost"
    find_lex $P110, "$rpost"
    $P108."push_pirop"("copy", $P109, $P110)
.annotate 'line', 1607
    find_lex $P108, "$ops"
    .return ($P108)
  control_1729:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "inline"  :subid("88_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["PAST";"Op"])
    .param pmc param_1741
    .param pmc param_1742 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1621
    new $P1740, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1740, control_1739
    push_eh $P1740
    .lex "self", self
    .lex "$node", param_1741
    .lex "%options", param_1742
.annotate 'line', 1626
    new $P105, "Undef"
    set $P1743, $P105
    .lex "$ops", $P1743
.annotate 'line', 1627
    new $P106, "Undef"
    set $P1744, $P106
    .lex "$inline", $P1744
.annotate 'line', 1630
    new $P107, "Undef"
    set $P1745, $P107
    .lex "$result", $P1745
.annotate 'line', 1631
    new $P108, "Undef"
    set $P1746, $P108
    .lex "$i", $P1746
.annotate 'line', 1644
    $P1748 = root_new ['parrot';'ResizablePMCArray']
    set $P1747, $P1748
    .lex "@arglist", $P1747
.annotate 'line', 1646
    new $P109, "Undef"
    set $P1749, $P109
    .lex "$s", $P1749
.annotate 'line', 1626
    find_lex $P110, "self"
    find_lex $P111, "$node"
    $P112 = $P110."post_children"($P111, "vP" :named("signature"))
    store_lex "$ops", $P112
.annotate 'line', 1627
    find_lex $P110, "$node"
    $P111 = $P110."inline"()
    store_lex "$inline", $P111
.annotate 'line', 1628
    find_lex $P110, "$inline"
    does $I100, $P110, "array"
    unless $I100, if_1750_end
    find_lex $P111, "$inline"
    join $S100, "\n", $P111
    new $P112, 'String'
    set $P112, $S100
    store_lex "$inline", $P112
  if_1750_end:
.annotate 'line', 1630
    new $P110, "String"
    assign $P110, ""
    store_lex "$result", $P110
.annotate 'line', 1631
    find_lex $P110, "$inline"
    set $S100, $P110
    index $I100, $S100, "%t"
    new $P111, 'Integer'
    set $P111, $I100
    store_lex "$i", $P111
.annotate 'line', 1632
    find_lex $P110, "$i"
    set $N100, $P110
    isge $I100, $N100, 0.0
    if $I100, if_1751
.annotate 'line', 1638
    find_lex $P111, "$inline"
    set $S100, $P111
    index $I101, $S100, "%r"
    new $P112, 'Integer'
    set $P112, $I101
    store_lex "$i", $P112
.annotate 'line', 1639
    find_lex $P111, "$i"
    set $N101, $P111
    isge $I101, $N101, 0.0
    unless $I101, if_1752_end
.annotate 'line', 1640
    find_lex $P112, "self"
    $P113 = $P112."unique"("$P")
    store_lex "$result", $P113
.annotate 'line', 1641
    find_lex $P112, "$ops"
    find_lex $P113, "$result"
    $P112."result"($P113)
  if_1752_end:
.annotate 'line', 1637
    goto if_1751_end
  if_1751:
.annotate 'line', 1633
    find_lex $P111, "self"
    $P112 = $P111."unique"("$P")
    store_lex "$result", $P112
.annotate 'line', 1634
    find_lex $P111, "$ops"
    find_lex $P112, "$result"
    $P111."push_pirop"("new", $P112, "'Undef'")
.annotate 'line', 1635
    find_lex $P111, "$ops"
    find_lex $P112, "$result"
    $P111."result"($P112)
  if_1751_end:
.annotate 'line', 1644
    find_lex $P110, "$ops"
    $P111 = $P110."list"()
    store_lex "@arglist", $P111
.annotate 'line', 1645
    find_lex $P110, "$ops"
    find_lex $P111, "@arglist"
    find_lex $P112, "$inline"
    find_lex $P113, "$result"
    $P110."push_pirop"("inline", $P111 :flat, $P112 :named("inline"), $P113 :named("result"))
.annotate 'line', 1646
    find_lex $P1753, "%options"
    unless_null $P1753, vivify_381
    $P1753 = root_new ['parrot';'Hash']
  vivify_381:
    set $P110, $P1753["rtype"]
    unless_null $P110, vivify_382
    new $P110, "Undef"
  vivify_382:
    store_lex "$s", $P110
.annotate 'line', 1621
    find_lex $P110, "$ops"
    .return ($P110)
  control_1739:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("89_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["PAST";"Var"])
    .param pmc param_1757
    .param pmc param_1758 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1658
    .const 'Sub' $P1798 = "93_1313886916.84408" 
    capture_lex $P1798
    .const 'Sub' $P1787 = "92_1313886916.84408" 
    capture_lex $P1787
    .const 'Sub' $P1763 = "90_1313886916.84408" 
    capture_lex $P1763
    new $P1756, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1756, control_1755
    push_eh $P1756
    .lex "self", self
    .lex "$node", param_1757
    .lex "%options", param_1758
.annotate 'line', 1660
    new $P105, "Undef"
    set $P1759, $P105
    .lex "$bindpost", $P1759
.annotate 'line', 1664
    new $P106, "Undef"
    set $P1760, $P106
    .lex "$scope", $P1760
.annotate 'line', 1665
    new $P107, "Undef"
    set $P1761, $P107
    .lex "$name", $P1761
.annotate 'line', 1684
    .const 'Sub' $P1763 = "90_1313886916.84408" 
    newclosure $P1782, $P1763
    set $P1762, $P1782
    .lex "scope_error", $P1762
.annotate 'line', 1660
    find_lex $P1783, "%options"
    unless_null $P1783, vivify_390
    $P1783 = root_new ['parrot';'Hash']
  vivify_390:
    set $P114, $P1783["bindpost"]
    unless_null $P114, vivify_391
    new $P114, "Undef"
  vivify_391:
    store_lex "$bindpost", $P114
.annotate 'line', 1661
    find_lex $P114, "$bindpost"
    if $P114, unless_1784_end
    new $P115, "Undef"
    store_lex "$bindpost", $P115
  unless_1784_end:
.annotate 'line', 1664
    find_lex $P114, "$node"
    $P115 = $P114."scope"()
    store_lex "$scope", $P115
.annotate 'line', 1665
    find_lex $P114, "$node"
    $P115 = $P114."name"()
    store_lex "$name", $P115
.annotate 'line', 1666
    find_lex $P114, "$scope"
    if $P114, unless_1785_end
    .const 'Sub' $P1787 = "92_1313886916.84408" 
    capture_lex $P1787
    $P1787()
  unless_1785_end:
.annotate 'line', 1679
    .const 'Sub' $P1798 = "93_1313886916.84408" 
    capture_lex $P1798
    $P1798()
.annotate 'line', 1658
    find_lex $P114, "scope_error"
    .return ($P114)
  control_1755:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, "payload"
    .return ($P115)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "scope_error"  :subid("90_1313886916.84408") :outer("89_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1684
    .const 'Sub' $P1773 = "91_1313886916.84408" 
    capture_lex $P1773
    new $P1765, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1765, control_1764
    push_eh $P1765
.annotate 'line', 1686
    new $P108, "Undef"
    set $P1766, $P108
    .lex "$blockname", $P1766
.annotate 'line', 1693
    new $P109, "Undef"
    set $P1767, $P109
    .lex "$sourceline", $P1767
.annotate 'line', 1694
    new $P110, "Undef"
    set $P1768, $P110
    .lex "$source", $P1768
.annotate 'line', 1695
    new $P111, "Undef"
    set $P1769, $P111
    .lex "$pos", $P1769
.annotate 'line', 1696
    new $P112, "Undef"
    set $P1770, $P112
    .lex "$files", $P1770
.annotate 'line', 1685
    find_lex $P113, "$scope"
    unless $P113, if_1771_end
    new $P114, 'String'
    set $P114, " in '"
    find_lex $P115, "$scope"
    concat $P116, $P114, $P115
    concat $P117, $P116, "' scope"
    store_lex "$scope", $P117
  if_1771_end:
.annotate 'line', 1686
    new $P113, "String"
    assign $P113, ""
    store_lex "$blockname", $P113
.annotate 'line', 1687
    find_dynamic_lex $P114, "@*BLOCKPAST"
    unless_null $P114, vivify_383
    get_hll_global $P114, "@BLOCKPAST"
    unless_null $P114, vivify_384
    die "Contextual @*BLOCKPAST not found"
  vivify_384:
  vivify_383:
    defined $I100, $P114
    unless $I100, for_undef_385
    iter $P113, $P114
    new $P117, 'ExceptionHandler'
    set_label $P117, loop1776_handler
    $P117."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P117
  loop1776_test:
    unless $P113, loop1776_done
    shift $P115, $P113
  loop1776_redo:
    .const 'Sub' $P1773 = "91_1313886916.84408" 
    capture_lex $P1773
    $P1773($P115)
  loop1776_next:
    goto loop1776_test
  loop1776_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P118, exception, 'type'
    eq $P118, .CONTROL_LOOP_NEXT, loop1776_next
    eq $P118, .CONTROL_LOOP_REDO, loop1776_redo
  loop1776_done:
    pop_eh 
  for_undef_385:
.annotate 'line', 1691
    find_lex $P113, "$blockname"
    if $P113, unless_1777_end
    new $P114, "String"
    assign $P114, "<anonymous>"
    store_lex "$blockname", $P114
  unless_1777_end:
.annotate 'line', 1693
    new $P113, "String"
    assign $P113, ""
    store_lex "$sourceline", $P113
.annotate 'line', 1694
    find_lex $P1778, "$node"
    unless_null $P1778, vivify_386
    $P1778 = root_new ['parrot';'Hash']
  vivify_386:
    set $P113, $P1778["source"]
    unless_null $P113, vivify_387
    new $P113, "Undef"
  vivify_387:
    store_lex "$source", $P113
.annotate 'line', 1695
    find_lex $P1779, "$node"
    unless_null $P1779, vivify_388
    $P1779 = root_new ['parrot';'Hash']
  vivify_388:
    set $P113, $P1779["pos"]
    unless_null $P113, vivify_389
    new $P113, "Undef"
  vivify_389:
    store_lex "$pos", $P113
.annotate 'line', 1696
    find_caller_lex $P113, "$?FILES"
    store_lex "$files", $P113
.annotate 'line', 1697
    find_lex $P114, "$source"
    if $P114, if_1781
    set $P113, $P114
    goto if_1781_end
  if_1781:
    find_lex $P115, "$files"
    set $P113, $P115
  if_1781_end:
    if $P113, unless_1780_end
.annotate 'line', 1698
    new $P116, "String"
    assign $P116, " ("
    find_lex $P117, "$files"
    concat $P118, $P116, $P117
    concat $P119, $P118, ":"
.annotate 'line', 1699
    find_lex $P120, "self"
    find_lex $P121, "$source"
    find_lex $P122, "$pos"
    $P123 = $P120."lineof"($P121, $P122)
    add $P124, $P123, 1
    concat $P125, $P119, $P124
.annotate 'line', 1698
    concat $P126, $P125, ")"
.annotate 'line', 1699
    store_lex "$sourceline", $P126
  unless_1780_end:
.annotate 'line', 1701
    find_lex $P113, "self"
    new $P114, 'String'
    set $P114, "Symbol '"
    find_lex $P115, "$name"
    concat $P116, $P114, $P115
    concat $P117, $P116, "' not predeclared"
    find_lex $P118, "$scope"
    find_lex $P119, "$blockname"
    find_lex $P120, "$sourceline"
    $P121 = $P113."panic"($P117, $P118, " in ", $P119, $P120)
.annotate 'line', 1684
    .return ($P121)
  control_1764:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P113, exception, "payload"
    .return ($P113)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1772"  :anon :subid("91_1313886916.84408") :outer("90_1313886916.84408")
    .param pmc param_1774
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1687
    .lex "$_", param_1774
.annotate 'line', 1688
    find_lex $P116, "$_"
    $P117 = $P116."name"()
    store_lex "$blockname", $P117
.annotate 'line', 1689
    find_lex $P117, "$blockname"
    if $P117, if_1775
    set $P116, $P117
    goto if_1775_end
  if_1775:
    die 0, .CONTROL_LOOP_LAST
  if_1775_end:
.annotate 'line', 1687
    .return ($P116)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1786"  :anon :subid("92_1313886916.84408") :outer("89_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1668
    new $P115, "Undef"
    set $P1788, $P115
    .lex "$P0", $P1788
    find_lex $P116, "$name"
    find_lex $P117, "self"
    getattribute $P1789, $P117, "%!symtable"
    unless_null $P1789, vivify_392
    $P1789 = root_new ['parrot';'Hash']
  vivify_392:
    set $P118, $P1789[$P116]
    unless_null $P118, vivify_393
    new $P118, "Undef"
  vivify_393:
    store_lex "$P0", $P118
.annotate 'line', 1669
    find_lex $P116, "$P0"
    unless $P116, if_1790_end
    find_lex $P1791, "$P0"
    unless_null $P1791, vivify_394
    $P1791 = root_new ['parrot';'Hash']
  vivify_394:
    set $P117, $P1791["scope"]
    unless_null $P117, vivify_395
    new $P117, "Undef"
  vivify_395:
    store_lex "$scope", $P117
  if_1790_end:
.annotate 'line', 1670
    find_lex $P117, "$scope"
    unless $P117, unless_1792
    set $P116, $P117
    goto unless_1792_end
  unless_1792:
.annotate 'line', 1672
    find_lex $P118, "self"
    getattribute $P1793, $P118, "%!symtable"
    unless_null $P1793, vivify_396
    $P1793 = root_new ['parrot';'Hash']
  vivify_396:
    set $P119, $P1793[""]
    unless_null $P119, vivify_397
    new $P119, "Undef"
  vivify_397:
    store_lex "$P0", $P119
.annotate 'line', 1673
    find_lex $P118, "$P0"
    if $P118, unless_1794_end
    "scope_error"()
  unless_1794_end:
.annotate 'line', 1674
    find_lex $P1795, "$P0"
    unless_null $P1795, vivify_398
    $P1795 = root_new ['parrot';'Hash']
  vivify_398:
    set $P118, $P1795["scope"]
    unless_null $P118, vivify_399
    new $P118, "Undef"
  vivify_399:
    store_lex "$scope", $P118
.annotate 'line', 1675
    find_lex $P119, "$scope"
    unless $P119, unless_1796
    set $P118, $P119
    goto unless_1796_end
  unless_1796:
    $P120 = "scope_error"()
    set $P118, $P120
  unless_1796_end:
.annotate 'line', 1670
    set $P116, $P118
  unless_1792_end:
.annotate 'line', 1666
    .return ($P116)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1797"  :anon :subid("93_1313886916.84408") :outer("89_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1679
    .const 'Sub' $P1805 = "94_1313886916.84408" 
    capture_lex $P1805
    new $P1801, 'ExceptionHandler'
    set_label $P1801, control_1800
    $P1801."handle_types_except"(.CONTROL_RETURN,  .CONTROL_OK,  .CONTROL_BREAK,  .CONTROL_CONTINUE,  .CONTROL_TAKE,  .CONTROL_LEAVE,  .CONTROL_EXIT,  .CONTROL_LOOP_NEXT,  .CONTROL_LOOP_LAST,  .CONTROL_LOOP_REDO)
    push_eh $P1801
.annotate 'line', 1680
    new $P114, "Exception"
    set $P114['type'], .CONTROL_RETURN
    find_lex $P115, "self"
    find_lex $P116, "$node"
    find_lex $P117, "$bindpost"
    find_lex $P118, "$scope"
    set $S100, $P118
    $P119 = $P115.$S100($P116, $P117)
    setattribute $P114, 'payload', $P119
    throw $P114
.annotate 'line', 1679
    pop_eh 
    goto skip_handler_1799
  control_1800:
.annotate 'line', 1681
    .local pmc exception 
    .get_results (exception) 
    .const 'Sub' $P1805 = "94_1313886916.84408" 
    newclosure $P1810, $P1805
    $P1810(exception)
    new $P1811, 'Integer'
    set $P1811, 1
    set exception["handled"], $P1811
    set $I1812, exception["handled"]
    ne $I1812, 1, nothandled_1803
  handled_1802:
    .return (exception)
  nothandled_1803:
    rethrow exception
  skip_handler_1799:
.annotate 'line', 1679
    .return ()
.end


.namespace ["PAST";"Compiler"]
.sub "_block1804"  :anon :subid("94_1313886916.84408") :outer("93_1313886916.84408")
    .param pmc param_1806
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1681
    .lex "$_", param_1806
    find_lex $P1807, "$_"
    set $P1808, $P1807
    .lex "$!", $P1808
    $P1809 = "scope_error"()
    .return ($P1809)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "vivify"  :subid("95_1313886916.84408") :method :outer("11_1313886916.84408")
    .param pmc param_1816
    .param pmc param_1817
    .param pmc param_1818
    .param pmc param_1819
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1707
    .const 'Sub' $P1826 = "96_1313886916.84408" 
    capture_lex $P1826
    new $P1815, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1815, control_1814
    push_eh $P1815
    .lex "self", self
    .lex "$node", param_1816
    .lex "$ops", param_1817
    .lex "$fetchop", param_1818
    .lex "$storeop", param_1819
.annotate 'line', 1708
    new $P105, "Undef"
    set $P1820, $P105
    .lex "$viviself", $P1820
.annotate 'line', 1709
    new $P106, "Undef"
    set $P1821, $P106
    .lex "$vivipost", $P1821
.annotate 'line', 1710
    new $P107, "Undef"
    set $P1822, $P107
    .lex "$result", $P1822
.annotate 'line', 1708
    find_lex $P108, "$node"
    $P109 = $P108."viviself"()
    store_lex "$viviself", $P109
.annotate 'line', 1709
    find_lex $P108, "self"
    find_lex $P109, "$viviself"
    $P110 = $P108."as_vivipost"($P109, "P" :named("rtype"))
    store_lex "$vivipost", $P110
.annotate 'line', 1710
    find_lex $P108, "$vivipost"
    $P109 = $P108."result"()
    store_lex "$result", $P109
.annotate 'line', 1711
    find_lex $P108, "$result"
    set $S100, $P108
    iseq $I100, $S100, ""
    unless $I100, if_1823_end
    find_lex $P109, "self"
    $P110 = $P109."tempreg"("P")
    store_lex "$result", $P110
  if_1823_end:
.annotate 'line', 1713
    find_lex $P108, "$ops"
    find_lex $P109, "$result"
    $P108."result"($P109)
.annotate 'line', 1714
    find_lex $P108, "$ops"
    find_lex $P109, "$fetchop"
    $P108."push"($P109)
.annotate 'line', 1715
    find_lex $P108, "$viviself"
    unless $P108, if_1824_end
    .const 'Sub' $P1826 = "96_1313886916.84408" 
    capture_lex $P1826
    $P1826()
  if_1824_end:
.annotate 'line', 1707
    find_lex $P108, "$ops"
    .return ($P108)
  control_1814:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1825"  :anon :subid("96_1313886916.84408") :outer("95_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1716
    new $P109, "Undef"
    set $P1827, $P109
    .lex "$vivilabel", $P1827
    get_hll_global $P110, ["POST"], "Label"
    $P111 = $P110."new"("vivify_" :named("name"))
    store_lex "$vivilabel", $P111
.annotate 'line', 1717
    find_lex $P110, "$ops"
    find_lex $P111, "$ops"
    find_lex $P112, "$vivilabel"
    $P110."push_pirop"("unless_null", $P111, $P112)
.annotate 'line', 1718
    find_lex $P110, "$ops"
    find_lex $P111, "$vivipost"
    $P110."push"($P111)
.annotate 'line', 1719
    find_lex $P110, "$node"
    $P111 = $P110."lvalue"()
    unless $P111, if_1828_end
    find_lex $P112, "$ops"
    find_lex $P113, "$storeop"
    $P112."push"($P113)
  if_1828_end:
.annotate 'line', 1720
    find_lex $P110, "$ops"
    find_lex $P111, "$vivilabel"
    $P112 = $P110."push"($P111)
.annotate 'line', 1715
    .return ($P112)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "parameter"  :subid("97_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["PAST";"Var"],_)
    .param pmc param_1832
    .param pmc param_1833
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1726
    .const 'Sub' $P1841 = "98_1313886916.84408" 
    capture_lex $P1841
    new $P1831, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1831, control_1830
    push_eh $P1831
    .lex "self", self
    .lex "$node", param_1832
    .lex "$bindpost", param_1833
.annotate 'line', 1728
    new $P105, "Undef"
    set $P1834, $P105
    .lex "$name", $P1834
.annotate 'line', 1729
    new $P106, "Undef"
    set $P1835, $P106
    .lex "$named", $P1835
.annotate 'line', 1730
    new $P107, "Undef"
    set $P1836, $P107
    .lex "$pname", $P1836
.annotate 'line', 1733
    new $P108, "Undef"
    set $P1837, $P108
    .lex "$ops", $P1837
.annotate 'line', 1735
    new $P109, "Undef"
    set $P1838, $P109
    .lex "$viviself", $P1838
.annotate 'line', 1728
    find_lex $P110, "$node"
    $P111 = $P110."name"()
    store_lex "$name", $P111
.annotate 'line', 1729
    find_lex $P110, "$node"
    $P111 = $P110."named"()
    store_lex "$named", $P111
.annotate 'line', 1730
    find_lex $P110, "self"
    $P111 = $P110."unique"("param_")
    store_lex "$pname", $P111
.annotate 'line', 1733
    get_hll_global $P110, ["POST"], "Ops"
    find_lex $P111, "$node"
    find_lex $P112, "$pname"
    $P113 = $P110."new"($P111 :named("node"), $P112 :named("result"))
    store_lex "$ops", $P113
.annotate 'line', 1735
    find_lex $P110, "$node"
    $P111 = $P110."viviself"()
    store_lex "$viviself", $P111
.annotate 'line', 1736
    find_lex $P110, "$viviself"
    if $P110, if_1839
.annotate 'line', 1747
    find_dynamic_lex $P113, "$*SUB"
    unless_null $P113, vivify_400
    get_hll_global $P113, "$SUB"
    unless_null $P113, vivify_401
    die "Contextual $*SUB not found"
  vivify_401:
  vivify_400:
    find_lex $P114, "$pname"
    find_lex $P116, "$named"
.annotate 'line', 1748
    find_lex $P117, "$node"
    $P118 = $P117."slurpy"()
    find_lex $P119, "$node"
    $P120 = $P119."call_sig"()
.annotate 'line', 1747
    $P113."add_param"($P114, $P116 :named("named"), $P118 :named("slurpy"), $P120 :named("call_sig"))
.annotate 'line', 1746
    goto if_1839_end
  if_1839:
.annotate 'line', 1736
    .const 'Sub' $P1841 = "98_1313886916.84408" 
    capture_lex $P1841
    $P1841()
  if_1839_end:
.annotate 'line', 1751
    find_lex $P110, "$name"
    defined $I100, $P110
    unless $I100, if_1844_end
.annotate 'line', 1752
    find_lex $P111, "$ops"
    find_lex $P112, "self"
    find_lex $P113, "$name"
    $P114 = $P112."escape"($P113)
    find_lex $P115, "$ops"
    $P111."push_pirop"(".lex", $P114, $P115)
  if_1844_end:
.annotate 'line', 1726
    find_lex $P110, "$ops"
    .return ($P110)
  control_1830:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1840"  :anon :subid("98_1313886916.84408") :outer("97_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1738
    new $P111, "Undef"
    set $P1842, $P111
    .lex "$vivipost", $P1842
.annotate 'line', 1739
    new $P112, "Undef"
    set $P1843, $P112
    .lex "$vivilabel", $P1843
.annotate 'line', 1738
    find_lex $P113, "self"
    find_lex $P114, "$viviself"
    $P115 = $P113."as_vivipost"($P114, "P" :named("rtype"))
    store_lex "$vivipost", $P115
.annotate 'line', 1739
    get_hll_global $P113, ["POST"], "Label"
    $P114 = $P113."new"("optparam_" :named("name"))
    store_lex "$vivilabel", $P114
.annotate 'line', 1740
    find_dynamic_lex $P113, "$*SUB"
    unless_null $P113, vivify_402
    get_hll_global $P113, "$SUB"
    unless_null $P113, vivify_403
    die "Contextual $*SUB not found"
  vivify_403:
  vivify_402:
    find_lex $P114, "$pname"
    find_lex $P115, "$named"
    $P113."add_param"($P114, $P115 :named("named"), 1 :named("optional"))
.annotate 'line', 1741
    find_lex $P113, "$ops"
    new $P114, 'String'
    set $P114, "has_"
    find_lex $P115, "$pname"
    concat $P116, $P114, $P115
    find_lex $P117, "$vivilabel"
    $P113."push_pirop"("if", $P116, $P117)
.annotate 'line', 1742
    find_lex $P113, "$ops"
    find_lex $P114, "$vivipost"
    $P113."push"($P114)
.annotate 'line', 1743
    find_lex $P113, "$ops"
    find_lex $P114, "$ops"
    find_lex $P115, "$vivipost"
    $P113."push_pirop"("set", $P114, $P115)
.annotate 'line', 1744
    find_lex $P113, "$ops"
    find_lex $P114, "$vivilabel"
    $P115 = $P113."push"($P114)
.annotate 'line', 1736
    .return ($P115)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "package"  :subid("99_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["PAST";"Var"],_)
    .param pmc param_1848
    .param pmc param_1849
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1759
    new $P1847, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1847, control_1846
    push_eh $P1847
    .lex "self", self
    .lex "$node", param_1848
    .lex "$bindpost", param_1849
.annotate 'line', 1760
    new $P105, "Undef"
    set $P1850, $P105
    .lex "$ops", $P1850
.annotate 'line', 1761
    new $P106, "Undef"
    set $P1851, $P106
    .lex "$name", $P1851
.annotate 'line', 1762
    new $P107, "Undef"
    set $P1852, $P107
    .lex "$ns", $P1852
.annotate 'line', 1764
    new $P108, "Undef"
    set $P1853, $P108
    .lex "$fetchop", $P1853
.annotate 'line', 1765
    new $P109, "Undef"
    set $P1854, $P109
    .lex "$storeop", $P1854
.annotate 'line', 1766
    $P1856 = root_new ['parrot';'ResizablePMCArray']
    set $P1855, $P1856
    .lex "@name", $P1855
.annotate 'line', 1760
    get_hll_global $P110, ["POST"], "Ops"
    find_lex $P111, "$node"
    $P112 = $P110."new"($P111 :named("node"))
    store_lex "$ops", $P112
.annotate 'line', 1761
    find_lex $P110, "self"
    find_lex $P111, "$node"
    $P112 = $P111."name"()
    $P113 = $P110."escape"($P112)
    store_lex "$name", $P113
.annotate 'line', 1762
    find_lex $P110, "$node"
    $P111 = $P110."namespace"()
    store_lex "$ns", $P111
.annotate 'line', 1764
    new $P110, "String"
    assign $P110, "get_global"
    store_lex "$fetchop", $P110
.annotate 'line', 1765
    new $P110, "String"
    assign $P110, "set_global"
    store_lex "$storeop", $P110
.annotate 'line', 1766
    find_lex $P110, "$name"
    new $P111, "ResizablePMCArray"
    push $P111, $P110
    store_lex "@name", $P111
.annotate 'line', 1768
    find_lex $P110, "$ns"
    defined $I100, $P110
    unless $I100, if_1857_end
.annotate 'line', 1769
    new $P111, "String"
    assign $P111, "get_hll_global"
    store_lex "$fetchop", $P111
.annotate 'line', 1770
    new $P111, "String"
    assign $P111, "set_hll_global"
    store_lex "$storeop", $P111
.annotate 'line', 1772
    find_lex $P111, "$ns"
    unless $P111, if_1858_end
.annotate 'line', 1773
    get_hll_global $P112, ["POST"], "Compiler"
    find_lex $P113, "$ns"
    $P114 = $P112."key_pir"($P113)
    store_lex "$ns", $P114
.annotate 'line', 1774
    find_lex $P112, "@name"
    find_lex $P113, "$ns"
    $P112."unshift"($P113)
  if_1858_end:
  if_1857_end:
.annotate 'line', 1778
    find_lex $P110, "$bindpost"
    unless $P110, if_1859_end
.annotate 'line', 1779
    new $P111, "Exception"
    set $P111['type'], .CONTROL_RETURN
    get_hll_global $P112, ["POST"], "Op"
    find_lex $P113, "@name"
    find_lex $P114, "$bindpost"
    find_lex $P115, "$storeop"
    find_lex $P116, "$bindpost"
    $P117 = $P112."new"($P113 :flat, $P114, $P115 :named("pirop"), $P116 :named("result"))
    setattribute $P111, 'payload', $P117
    throw $P111
  if_1859_end:
.annotate 'line', 1783
    get_hll_global $P110, ["POST"], "Op"
    find_lex $P111, "$ops"
    find_lex $P112, "@name"
    find_lex $P113, "$fetchop"
    $P114 = $P110."new"($P111, $P112 :flat, $P113 :named("pirop"))
    store_lex "$fetchop", $P114
.annotate 'line', 1784
    get_hll_global $P110, ["POST"], "Op"
    find_lex $P111, "@name"
    find_lex $P112, "$ops"
    find_lex $P113, "$storeop"
    $P114 = $P110."new"($P111 :flat, $P112, $P113 :named("pirop"))
    store_lex "$storeop", $P114
.annotate 'line', 1785
    new $P110, "Exception"
    set $P110['type'], .CONTROL_RETURN
    find_lex $P111, "self"
    find_lex $P112, "$node"
    find_lex $P113, "$ops"
    find_lex $P114, "$fetchop"
    find_lex $P115, "$storeop"
    $P116 = $P111."vivify"($P112, $P113, $P114, $P115)
    setattribute $P110, 'payload', $P116
    throw $P110
.annotate 'line', 1759
    .return ()
  control_1846:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "lexical"  :subid("100_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["PAST";"Var"],_)
    .param pmc param_1863
    .param pmc param_1864
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1789
    .const 'Sub' $P1877 = "102_1313886916.84408" 
    capture_lex $P1877
    .const 'Sub' $P1869 = "101_1313886916.84408" 
    capture_lex $P1869
    new $P1862, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1862, control_1861
    push_eh $P1862
    .lex "self", self
    .lex "$node", param_1863
    .lex "$bindpost", param_1864
.annotate 'line', 1790
    new $P105, "Undef"
    set $P1865, $P105
    .lex "$name", $P1865
.annotate 'line', 1791
    new $P106, "Undef"
    set $P1866, $P106
    .lex "$isdecl", $P1866
.annotate 'line', 1790
    find_lex $P107, "self"
    find_lex $P108, "$node"
    $P109 = $P108."name"()
    $P110 = $P107."escape"($P109)
    store_lex "$name", $P110
.annotate 'line', 1791
    find_lex $P107, "$node"
    $P108 = $P107."isdecl"()
    store_lex "$isdecl", $P108
.annotate 'line', 1793
    find_lex $P108, "$isdecl"
    if $P108, if_1867
.annotate 'line', 1810
    .const 'Sub' $P1877 = "102_1313886916.84408" 
    capture_lex $P1877
    $P116 = $P1877()
    set $P107, $P116
.annotate 'line', 1793
    goto if_1867_end
  if_1867:
    .const 'Sub' $P1869 = "101_1313886916.84408" 
    capture_lex $P1869
    $P112 = $P1869()
    set $P107, $P112
  if_1867_end:
.annotate 'line', 1789
    .return ($P107)
  control_1861:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1876"  :anon :subid("102_1313886916.84408") :outer("100_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1816
    new $P113, "Undef"
    set $P1878, $P113
    .lex "$ops", $P1878
.annotate 'line', 1817
    new $P114, "Undef"
    set $P1879, $P114
    .lex "$fetchop", $P1879
.annotate 'line', 1818
    new $P115, "Undef"
    set $P1880, $P115
    .lex "$storeop", $P1880
.annotate 'line', 1811
    find_lex $P116, "$bindpost"
    unless $P116, if_1881_end
.annotate 'line', 1812
    new $P117, "Exception"
    set $P117['type'], .CONTROL_RETURN
    get_hll_global $P118, ["POST"], "Op"
    find_lex $P119, "$name"
    find_lex $P120, "$bindpost"
    find_lex $P121, "$bindpost"
    $P122 = $P118."new"($P119, $P120, "store_lex" :named("pirop"), $P121 :named("result"))
    setattribute $P117, 'payload', $P122
    throw $P117
  if_1881_end:
.annotate 'line', 1816
    get_hll_global $P116, ["POST"], "Ops"
    find_lex $P117, "$node"
    $P118 = $P116."new"($P117 :named("node"))
    store_lex "$ops", $P118
.annotate 'line', 1817
    get_hll_global $P116, ["POST"], "Op"
    find_lex $P117, "$ops"
    find_lex $P118, "$name"
    $P119 = $P116."new"($P117, $P118, "find_lex" :named("pirop"))
    store_lex "$fetchop", $P119
.annotate 'line', 1818
    get_hll_global $P116, ["POST"], "Op"
    find_lex $P117, "$name"
    find_lex $P118, "$ops"
    $P119 = $P116."new"($P117, $P118, "store_lex" :named("pirop"))
    store_lex "$storeop", $P119
.annotate 'line', 1819
    new $P116, "Exception"
    set $P116['type'], .CONTROL_RETURN
    find_lex $P117, "self"
    find_lex $P118, "$node"
    find_lex $P119, "$ops"
    find_lex $P120, "$fetchop"
    find_lex $P121, "$storeop"
    $P122 = $P117."vivify"($P118, $P119, $P120, $P121)
    setattribute $P116, 'payload', $P122
    throw $P116
.annotate 'line', 1810
    .return ()
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1868"  :anon :subid("101_1313886916.84408") :outer("100_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1795
    new $P109, "Undef"
    set $P1870, $P109
    .lex "$lexreg", $P1870
.annotate 'line', 1796
    new $P110, "Undef"
    set $P1871, $P110
    .lex "$ops", $P1871
.annotate 'line', 1797
    new $P111, "Undef"
    set $P1872, $P111
    .lex "$viviself", $P1872
.annotate 'line', 1795
    find_lex $P112, "self"
    $P113 = $P112."uniquereg"("P")
    store_lex "$lexreg", $P113
.annotate 'line', 1796
    get_hll_global $P112, ["POST"], "Ops"
    find_lex $P113, "$node"
    $P114 = $P112."new"($P113 :named("node"))
    store_lex "$ops", $P114
.annotate 'line', 1797
    find_lex $P112, "$node"
    $P113 = $P112."viviself"()
    store_lex "$viviself", $P113
.annotate 'line', 1799
    find_lex $P113, "$bindpost"
    isfalse $I100, $P113
    if $I100, if_1874
    new $P112, 'Integer'
    set $P112, $I100
    goto if_1874_end
  if_1874:
    find_lex $P114, "$viviself"
    set $P112, $P114
  if_1874_end:
    unless $P112, if_1873_end
.annotate 'line', 1800
    find_lex $P115, "self"
    find_lex $P116, "$viviself"
    $P117 = $P115."as_vivipost"($P116, "P" :named("rtype"))
    store_lex "$bindpost", $P117
.annotate 'line', 1801
    find_lex $P115, "$ops"
    find_lex $P116, "$bindpost"
    $P115."push"($P116)
  if_1873_end:
.annotate 'line', 1804
    find_lex $P112, "$bindpost"
    unless $P112, if_1875_end
    find_lex $P113, "$ops"
    find_lex $P114, "$lexreg"
    find_lex $P115, "$bindpost"
    $P113."push_pirop"("set", $P114, $P115)
  if_1875_end:
.annotate 'line', 1806
    find_lex $P112, "$ops"
    find_lex $P113, "$name"
    find_lex $P114, "$lexreg"
    $P112."push_pirop"(".lex", $P113, $P114)
.annotate 'line', 1807
    find_lex $P112, "$ops"
    find_lex $P113, "$lexreg"
    $P112."result"($P113)
.annotate 'line', 1808
    new $P112, "Exception"
    set $P112['type'], .CONTROL_RETURN
    find_lex $P113, "$ops"
    setattribute $P112, 'payload', $P113
    throw $P112
.annotate 'line', 1793
    .return ()
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "contextual"  :subid("103_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["PAST";"Var"],_)
    .param pmc param_1885
    .param pmc param_1886
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1824
    .const 'Sub' $P1897 = "104_1313886916.84408" 
    capture_lex $P1897
    new $P1884, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1884, control_1883
    push_eh $P1884
    .lex "self", self
    .lex "$node", param_1885
    .lex "$bindpost", param_1886
.annotate 'line', 1829
    new $P105, "Undef"
    set $P1887, $P105
    .lex "$name", $P1887
.annotate 'line', 1831
    $P1889 = root_new ['parrot';'Hash']
    set $P1888, $P1889
    .lex "%symtable", $P1888
.annotate 'line', 1853
    new $P106, "Undef"
    set $P1890, $P106
    .lex "$ops", $P1890
.annotate 'line', 1854
    new $P107, "Undef"
    set $P1891, $P107
    .lex "$fetchop", $P1891
.annotate 'line', 1855
    new $P108, "Undef"
    set $P1892, $P108
    .lex "$storeop", $P1892
.annotate 'line', 1829
    find_lex $P109, "$node"
    $P110 = $P109."name"()
    store_lex "$name", $P110
.annotate 'line', 1831
    find_dynamic_lex $P109, "@*BLOCKPAST"
    unless_null $P109, vivify_404
    get_hll_global $P109, "@BLOCKPAST"
    unless_null $P109, vivify_405
    die "Contextual @*BLOCKPAST not found"
  vivify_405:
  vivify_404:
    set $P110, $P109[0]
    unless_null $P110, vivify_406
    new $P110, "Undef"
  vivify_406:
    $P111 = $P110."symtable"()
    store_lex "%symtable", $P111
.annotate 'line', 1832
    find_lex $P109, "%symtable"
    defined $I100, $P109
    unless $I100, if_1893_end
.annotate 'line', 1833
    find_lex $P110, "$name"
    find_lex $P1894, "%symtable"
    unless_null $P1894, vivify_407
    $P1894 = root_new ['parrot';'Hash']
  vivify_407:
    set $P111, $P1894[$P110]
    unless_null $P111, vivify_408
    new $P111, "Undef"
  vivify_408:
    store_lex "%symtable", $P111
.annotate 'line', 1834
    find_lex $P110, "%symtable"
    defined $I101, $P110
    unless $I101, if_1895_end
    .const 'Sub' $P1897 = "104_1313886916.84408" 
    capture_lex $P1897
    $P1897()
  if_1895_end:
  if_1893_end:
.annotate 'line', 1843
    find_lex $P109, "$node"
    $P110 = $P109."isdecl"()
    unless $P110, if_1902_end
    new $P111, "Exception"
    set $P111['type'], .CONTROL_RETURN
    find_lex $P112, "self"
    find_lex $P113, "$node"
    find_lex $P114, "$bindpost"
    $P115 = $P112."lexical"($P113, $P114)
    setattribute $P111, 'payload', $P115
    throw $P111
  if_1902_end:
.annotate 'line', 1845
    find_lex $P109, "self"
    find_lex $P110, "$name"
    $P111 = $P109."escape"($P110)
    store_lex "$name", $P111
.annotate 'line', 1847
    find_lex $P109, "$bindpost"
    unless $P109, if_1903_end
.annotate 'line', 1848
    new $P110, "Exception"
    set $P110['type'], .CONTROL_RETURN
    get_hll_global $P111, ["POST"], "Op"
    find_lex $P112, "$name"
    find_lex $P113, "$bindpost"
    find_lex $P114, "$bindpost"
    $P115 = $P111."new"($P112, $P113, "store_dynamic_lex" :named("pirop"), $P114 :named("result"))
    setattribute $P110, 'payload', $P115
    throw $P110
  if_1903_end:
.annotate 'line', 1853
    get_hll_global $P109, ["POST"], "Ops"
    find_lex $P110, "$node"
    $P111 = $P109."new"($P110 :named("node"))
    store_lex "$ops", $P111
.annotate 'line', 1854
    get_hll_global $P109, ["POST"], "Op"
    find_lex $P110, "$ops"
    find_lex $P111, "$name"
    $P112 = $P109."new"($P110, $P111, "find_dynamic_lex" :named("pirop"))
    store_lex "$fetchop", $P112
.annotate 'line', 1855
    get_hll_global $P109, ["POST"], "Op"
    find_lex $P110, "$name"
    find_lex $P111, "$ops"
    $P112 = $P109."new"($P110, $P111, "store_dynamic_lex" :named("pirop"))
    store_lex "$storeop", $P112
.annotate 'line', 1856
    find_lex $P109, "self"
    find_lex $P110, "$node"
    find_lex $P111, "$ops"
    find_lex $P112, "$fetchop"
    find_lex $P113, "$storeop"
    $P114 = $P109."vivify"($P110, $P111, $P112, $P113)
.annotate 'line', 1824
    .return ($P114)
  control_1883:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1896"  :anon :subid("104_1313886916.84408") :outer("103_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1835
    new $P111, "Undef"
    set $P1898, $P111
    .lex "$scope", $P1898
    find_lex $P1899, "%symtable"
    unless_null $P1899, vivify_409
    $P1899 = root_new ['parrot';'Hash']
  vivify_409:
    set $P112, $P1899["scope"]
    unless_null $P112, vivify_410
    new $P112, "Undef"
  vivify_410:
    store_lex "$scope", $P112
.annotate 'line', 1836
    find_lex $P114, "$scope"
    if $P114, if_1901
    set $P113, $P114
    goto if_1901_end
  if_1901:
    find_lex $P115, "$scope"
    set $S100, $P115
    isne $I102, $S100, "contextual"
    new $P113, 'Integer'
    set $P113, $I102
  if_1901_end:
    if $P113, if_1900
    set $P112, $P113
    goto if_1900_end
  if_1900:
.annotate 'line', 1837
    new $P116, "Exception"
    set $P116['type'], .CONTROL_RETURN
    find_lex $P117, "self"
    find_lex $P118, "$node"
    find_lex $P119, "$bindpost"
    find_lex $P120, "$scope"
    set $S101, $P120
    $P121 = $P117.$S101($P118, $P119)
    setattribute $P116, 'payload', $P121
    throw $P116
  if_1900_end:
.annotate 'line', 1834
    .return ($P112)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "keyed"  :subid("105_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["PAST";"Var"],_)
    .param pmc param_1907
    .param pmc param_1908
    .param pmc param_1909 :optional
    .param int has_param_1909 :opt_flag
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1860
    new $P1906, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1906, control_1905
    push_eh $P1906
    .lex "self", self
    .lex "$node", param_1907
    .lex "$bindpost", param_1908
    if has_param_1909, optparam_411
    new $P105, "Undef"
    set param_1909, $P105
  optparam_411:
    .lex "$keyrtype", param_1909
.annotate 'line', 1861

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
    
.annotate 'line', 1860
    .return ()
  control_1905:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "keyed_int"  :subid("106_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["PAST";"Var"],_)
    .param pmc param_1913
    .param pmc param_1914
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1929
    new $P1912, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1912, control_1911
    push_eh $P1912
    .lex "self", self
    .lex "$node", param_1913
    .lex "$bindpost", param_1914
.annotate 'line', 1930
    find_lex $P105, "self"
    find_lex $P106, "$node"
    find_lex $P107, "$bindpost"
    $P108 = $P105."keyed"($P106, $P107, "i")
.annotate 'line', 1929
    .return ($P108)
  control_1911:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "attribute"  :subid("107_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["PAST";"Var"],_)
    .param pmc param_1918
    .param pmc param_1919
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1934
    .const 'Sub' $P1932 = "108_1313886916.84408" 
    capture_lex $P1932
    new $P1917, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1917, control_1916
    push_eh $P1917
    .lex "self", self
    .lex "$node", param_1918
    .lex "$bindpost", param_1919
.annotate 'line', 1935
    new $P105, "Undef"
    set $P1920, $P105
    .lex "$ops", $P1920
.annotate 'line', 1936
    new $P106, "Undef"
    set $P1921, $P106
    .lex "$name", $P1921
.annotate 'line', 1944
    new $P107, "Undef"
    set $P1922, $P107
    .lex "$call_on", $P1922
.annotate 'line', 1945
    $P1924 = root_new ['parrot';'ResizablePMCArray']
    set $P1923, $P1924
    .lex "@attribute", $P1923
.annotate 'line', 1946
    new $P108, "Undef"
    set $P1925, $P108
    .lex "$elements", $P1925
.annotate 'line', 1967
    new $P109, "Undef"
    set $P1926, $P109
    .lex "$fetchop", $P1926
.annotate 'line', 1968
    new $P110, "Undef"
    set $P1927, $P110
    .lex "$storeop", $P1927
.annotate 'line', 1935
    get_hll_global $P111, ["POST"], "Ops"
    find_lex $P112, "$node"
    $P113 = $P111."new"($P112 :named("node"))
    store_lex "$ops", $P113
.annotate 'line', 1936
    find_lex $P111, "self"
    find_lex $P112, "$node"
    $P113 = $P112."name"()
    $P114 = $P111."escape"($P113)
    store_lex "$name", $P114
.annotate 'line', 1934
    find_lex $P111, "$call_on"
.annotate 'line', 1945
    find_lex $P111, "$name"
    new $P112, "ResizablePMCArray"
    push $P112, $P111
    store_lex "@attribute", $P112
.annotate 'line', 1946
    find_lex $P111, "$node"
    elements $I100, $P111
    new $P112, 'Integer'
    set $P112, $I100
    store_lex "$elements", $P112
.annotate 'line', 1947
    find_lex $P111, "$elements"
    set $N100, $P111
    iseq $I100, $N100, 0.0
    if $I100, if_1928
.annotate 'line', 1951
    find_lex $P112, "self"
    find_lex $P1929, "$node"
    unless_null $P1929, vivify_412
    $P1929 = root_new ['parrot';'ResizablePMCArray']
  vivify_412:
    set $P113, $P1929[0]
    unless_null $P113, vivify_413
    new $P113, "Undef"
  vivify_413:
    $P114 = $P112."as_post"($P113, "P" :named("rtype"))
    store_lex "$call_on", $P114
.annotate 'line', 1952
    find_lex $P112, "$ops"
    find_lex $P113, "$call_on"
    $P112."push"($P113)
.annotate 'line', 1953
    find_lex $P112, "$elements"
    set $N101, $P112
    iseq $I101, $N101, 2.0
    unless $I101, if_1930_end
    .const 'Sub' $P1932 = "108_1313886916.84408" 
    capture_lex $P1932
    $P1932()
  if_1930_end:
.annotate 'line', 1950
    goto if_1928_end
  if_1928:
.annotate 'line', 1948
    new $P112, "String"
    assign $P112, "self"
    store_lex "$call_on", $P112
  if_1928_end:
.annotate 'line', 1959
    find_lex $P111, "@attribute"
    find_lex $P112, "$call_on"
    $P111."unshift"($P112)
.annotate 'line', 1961
    find_lex $P111, "$bindpost"
    unless $P111, if_1935_end
.annotate 'line', 1962
    find_lex $P112, "$ops"
    find_lex $P113, "@attribute"
    find_lex $P114, "$bindpost"
    $P112."push_pirop"("setattribute", $P113 :flat, $P114)
.annotate 'line', 1963
    find_lex $P112, "$ops"
    find_lex $P113, "$bindpost"
    $P112."result"($P113)
.annotate 'line', 1964
    new $P112, "Exception"
    set $P112['type'], .CONTROL_RETURN
    find_lex $P113, "$ops"
    setattribute $P112, 'payload', $P113
    throw $P112
  if_1935_end:
.annotate 'line', 1967
    get_hll_global $P111, ["POST"], "Op"
    find_lex $P112, "$ops"
    find_lex $P113, "@attribute"
    $P114 = $P111."new"($P112, $P113 :flat, "getattribute" :named("pirop"))
    store_lex "$fetchop", $P114
.annotate 'line', 1968
    get_hll_global $P111, ["POST"], "Op"
    find_lex $P112, "@attribute"
    find_lex $P113, "$ops"
    $P114 = $P111."new"($P112 :flat, $P113, "setattribute" :named("pirop"))
    store_lex "$storeop", $P114
.annotate 'line', 1969
    find_lex $P111, "self"
    find_lex $P112, "$node"
    find_lex $P113, "$ops"
    find_lex $P114, "$fetchop"
    find_lex $P115, "$storeop"
    $P116 = $P111."vivify"($P112, $P113, $P114, $P115)
.annotate 'line', 1934
    .return ($P116)
  control_1916:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1931"  :anon :subid("108_1313886916.84408") :outer("107_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1954
    new $P113, "Undef"
    set $P1933, $P113
    .lex "$handle", $P1933
    find_lex $P114, "self"
    find_lex $P1934, "$node"
    unless_null $P1934, vivify_414
    $P1934 = root_new ['parrot';'ResizablePMCArray']
  vivify_414:
    set $P115, $P1934[1]
    unless_null $P115, vivify_415
    new $P115, "Undef"
  vivify_415:
    $P116 = $P114."as_post"($P115, "P" :named("rtype"))
    store_lex "$handle", $P116
.annotate 'line', 1955
    find_lex $P114, "$ops"
    find_lex $P115, "$handle"
    $P114."push"($P115)
.annotate 'line', 1956
    find_lex $P114, "@attribute"
    find_lex $P115, "$handle"
    $P116 = $P114."unshift"($P115)
.annotate 'line', 1953
    .return ($P116)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "register"  :subid("109_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["PAST";"Var"],_)
    .param pmc param_1939
    .param pmc param_1940
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1973
    .const 'Sub' $P1947 = "110_1313886916.84408" 
    capture_lex $P1947
    new $P1938, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1938, control_1937
    push_eh $P1938
    .lex "self", self
    .lex "$node", param_1939
    .lex "$bindpost", param_1940
.annotate 'line', 1974
    new $P105, "Undef"
    set $P1941, $P105
    .lex "$name", $P1941
.annotate 'line', 1981
    new $P106, "Undef"
    set $P1942, $P106
    .lex "$ops", $P1942
.annotate 'line', 1974
    find_lex $P107, "$node"
    $P108 = $P107."name"()
    store_lex "$name", $P108
.annotate 'line', 1976
    find_lex $P107, "$name"
    if $P107, unless_1943_end
.annotate 'line', 1977
    find_lex $P108, "self"
    $P109 = $P108."uniquereg"("P")
    store_lex "$name", $P109
.annotate 'line', 1978
    find_lex $P108, "$node"
    find_lex $P109, "$name"
    $P108."name"($P109)
  unless_1943_end:
.annotate 'line', 1981
    get_hll_global $P107, ["POST"], "Ops"
    find_lex $P108, "$name"
    find_lex $P109, "$node"
    $P110 = $P107."new"($P108 :named("result"), $P109 :named("node"))
    store_lex "$ops", $P110
.annotate 'line', 1983
    find_lex $P107, "$node"
    $P108 = $P107."isdecl"()
    unless $P108, if_1944_end
    find_lex $P109, "$ops"
    find_lex $P110, "$ops"
    $P109."push_pirop"(".local pmc", $P110)
  if_1944_end:
.annotate 'line', 1985
    find_lex $P107, "$bindpost"
    if $P107, if_1945
.annotate 'line', 1988
    .const 'Sub' $P1947 = "110_1313886916.84408" 
    capture_lex $P1947
    $P1947()
    goto if_1945_end
  if_1945:
.annotate 'line', 1986
    find_lex $P108, "$ops"
    find_lex $P109, "$ops"
    find_lex $P110, "$bindpost"
    $P108."push_pirop"("set", $P109, $P110)
  if_1945_end:
.annotate 'line', 1973
    find_lex $P107, "$ops"
    .return ($P107)
  control_1937:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1946"  :anon :subid("110_1313886916.84408") :outer("109_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1988
    .const 'Sub' $P1951 = "111_1313886916.84408" 
    capture_lex $P1951
.annotate 'line', 1989
    new $P108, "Undef"
    set $P1948, $P108
    .lex "$viviself", $P1948
    find_lex $P109, "$node"
    $P110 = $P109."viviself"()
    store_lex "$viviself", $P110
.annotate 'line', 1990
    find_lex $P110, "$viviself"
    if $P110, if_1949
    set $P109, $P110
    goto if_1949_end
  if_1949:
    .const 'Sub' $P1951 = "111_1313886916.84408" 
    capture_lex $P1951
    $P112 = $P1951()
    set $P109, $P112
  if_1949_end:
.annotate 'line', 1988
    .return ($P109)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1950"  :anon :subid("111_1313886916.84408") :outer("110_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1991
    new $P111, "Undef"
    set $P1952, $P111
    .lex "$vivipost", $P1952
    find_lex $P112, "self"
    find_lex $P113, "$viviself"
    $P114 = $P112."as_vivipost"($P113, "P" :named("rtype"))
    store_lex "$vivipost", $P114
.annotate 'line', 1992
    find_lex $P112, "$ops"
    find_lex $P113, "$vivipost"
    $P112."push"($P113)
.annotate 'line', 1993
    find_lex $P112, "$ops"
    find_lex $P113, "$ops"
    find_lex $P114, "$vivipost"
    $P115 = $P112."push_pirop"("set", $P113, $P114)
.annotate 'line', 1990
    .return ($P115)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("112_1313886916.84408") :method :outer("11_1313886916.84408") :multi(_,["PAST";"Val"])
    .param pmc param_1956
    .param pmc param_1957 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 2009
    .const 'Sub' $P1968 = "113_1313886916.84408" 
    capture_lex $P1968
    new $P1955, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1955, control_1954
    push_eh $P1955
    .lex "self", self
    .lex "$node", param_1956
    .lex "%options", param_1957
.annotate 'line', 2010
    new $P105, "Undef"
    set $P1958, $P105
    .lex "$ops", $P1958
.annotate 'line', 2012
    new $P106, "Undef"
    set $P1959, $P106
    .lex "$value", $P1959
.annotate 'line', 2025
    new $P107, "Undef"
    set $P1960, $P107
    .lex "$returns", $P1960
.annotate 'line', 2028
    new $P108, "Undef"
    set $P1961, $P108
    .lex "$valflags", $P1961
.annotate 'line', 2043
    new $P109, "Undef"
    set $P1962, $P109
    .lex "$rtype", $P1962
.annotate 'line', 2056
    new $P110, "Undef"
    set $P1963, $P110
    .lex "$result", $P1963
.annotate 'line', 2010
    get_hll_global $P111, ["POST"], "Ops"
    find_lex $P112, "$node"
    $P113 = $P111."new"($P112 :named("node"))
    store_lex "$ops", $P113
.annotate 'line', 2012
    find_lex $P1964, "$node"
    unless_null $P1964, vivify_416
    $P1964 = root_new ['parrot';'Hash']
  vivify_416:
    set $P111, $P1964["value"]
    unless_null $P111, vivify_417
    new $P111, "Undef"
  vivify_417:
    store_lex "$value", $P111
.annotate 'line', 2013
    find_lex $P111, "$value"
    defined $I100, $P111
    if $I100, unless_1965_end
.annotate 'line', 2014
    find_lex $P112, "self"
    $P112."panic"("PAST::Val node missing :value attribute")
  unless_1965_end:
.annotate 'line', 2016
    get_hll_global $P111, ["PAST"], "Block"
    find_lex $P112, "$value"
    $P113 = $P111."ACCEPTS"($P112)
    unless $P113, if_1966_end
    .const 'Sub' $P1968 = "113_1313886916.84408" 
    capture_lex $P1968
    $P1968()
  if_1966_end:
.annotate 'line', 2025
    find_lex $P1971, "$node"
    unless_null $P1971, vivify_418
    $P1971 = root_new ['parrot';'Hash']
  vivify_418:
    set $P111, $P1971["returns"]
    unless_null $P111, vivify_419
    new $P111, "Undef"
  vivify_419:
    store_lex "$returns", $P111
.annotate 'line', 2026
    find_lex $P111, "$returns"
    if $P111, unless_1972_end
    find_lex $P112, "$value"
    typeof $S100, $P112
    new $P113, 'String'
    set $P113, $S100
    store_lex "$returns", $P113
  unless_1972_end:
.annotate 'line', 2028
    find_lex $P111, "$returns"
    get_global $P1973, "%valflags"
    unless_null $P1973, vivify_420
    $P1973 = root_new ['parrot';'Hash']
  vivify_420:
    set $P112, $P1973[$P111]
    unless_null $P112, vivify_421
    new $P112, "Undef"
  vivify_421:
    store_lex "$valflags", $P112
.annotate 'line', 2029
    find_lex $P111, "$valflags"
    set $S100, $P111
    index $I100, $S100, "e"
    set $N100, $I100
    isge $I101, $N100, 0.0
    unless $I101, if_1974_end
    find_lex $P112, "self"
    find_lex $P113, "$value"
    $P114 = $P112."escape"($P113)
    store_lex "$value", $P114
  if_1974_end:
.annotate 'line', 2032
    find_lex $P111, "$valflags"
    set $S100, $P111
    index $I100, $S100, "c"
    set $N100, $I100
    isge $I101, $N100, 0.0
    unless $I101, if_1975_end
.annotate 'line', 2034
    find_lex $P112, "$returns"
    set $S101, $P112
    isne $I102, $S101, "!macro_const"
    unless $I102, if_1976_end
.annotate 'line', 2035
    find_dynamic_lex $P113, "$*SUB"
    unless_null $P113, vivify_422
    get_hll_global $P113, "$SUB"
    unless_null $P113, vivify_423
    die "Contextual $*SUB not found"
  vivify_423:
  vivify_422:
.annotate 'line', 2036
    find_lex $P114, "$returns"
    set $S102, $P114
    replace $S103, $S102, 0, 1, ".include \""
    new $P115, 'String'
    set $P115, $S103
    concat $P116, $P115, ".pasm\""
    $P113."add_directive"($P116)
  if_1976_end:
.annotate 'line', 2040
    find_lex $P112, "$value"
    set $S101, $P112
    substr $S102, $S101, 0, 1
    iseq $I102, $S102, "."
    if $I102, unless_1977_end
    new $P113, "String"
    assign $P113, "."
    find_lex $P114, "$value"
    concat $P115, $P113, $P114
    store_lex "$value", $P115
  unless_1977_end:
  if_1975_end:
.annotate 'line', 2043
    find_lex $P1978, "%options"
    unless_null $P1978, vivify_424
    $P1978 = root_new ['parrot';'Hash']
  vivify_424:
    set $P111, $P1978["rtype"]
    unless_null $P111, vivify_425
    new $P111, "Undef"
  vivify_425:
    store_lex "$rtype", $P111
.annotate 'line', 2044
    find_lex $P111, "$valflags"
    set $S100, $P111
    find_lex $P112, "$rtype"
    set $S101, $P112
    index $I100, $S100, $S101
    set $N100, $I100
    isge $I101, $N100, 0.0
    unless $I101, if_1979_end
.annotate 'line', 2045
    find_lex $P113, "$ops"
    find_lex $P114, "$value"
    $P113."result"($P114)
.annotate 'line', 2046
    new $P113, "Exception"
    set $P113['type'], .CONTROL_RETURN
    find_lex $P114, "$ops"
    setattribute $P113, 'payload', $P114
    throw $P113
  if_1979_end:
.annotate 'line', 2050
    find_lex $P112, "$rtype"
    set $S100, $P112
    iseq $I100, $S100, "n"
    if $I100, if_1981
    new $P111, 'Integer'
    set $P111, $I100
    goto if_1981_end
  if_1981:
    find_lex $P113, "$valflags"
    set $S101, $P113
    index $I101, $S101, "i"
    set $N100, $I101
    isge $I102, $N100, 0.0
    new $P111, 'Integer'
    set $P111, $I102
  if_1981_end:
    unless $P111, if_1980_end
.annotate 'line', 2051
    find_lex $P114, "$value"
    concat $P115, $P114, ".0"
    store_lex "$value", $P115
.annotate 'line', 2052
    find_lex $P114, "$ops"
    find_lex $P115, "$value"
    $P114."result"($P115)
.annotate 'line', 2053
    new $P114, "Exception"
    set $P114['type'], .CONTROL_RETURN
    find_lex $P115, "$ops"
    setattribute $P114, 'payload', $P115
    throw $P114
  if_1980_end:
.annotate 'line', 2056
    find_lex $P111, "self"
    $P112 = $P111."tempreg"("P")
    store_lex "$result", $P112
.annotate 'line', 2057
    find_lex $P111, "self"
    find_lex $P112, "$returns"
    $P113 = $P111."escape"($P112)
    store_lex "$returns", $P113
.annotate 'line', 2058
    find_lex $P111, "$ops"
    find_lex $P112, "$result"
    find_lex $P113, "$returns"
    $P111."push_pirop"("new", $P112, $P113)
.annotate 'line', 2059
    find_lex $P111, "$ops"
    find_lex $P112, "$result"
    find_lex $P113, "$value"
    $P111."push_pirop"("assign", $P112, $P113)
.annotate 'line', 2060
    find_lex $P111, "$ops"
    find_lex $P112, "$result"
    $P111."result"($P112)
.annotate 'line', 2009
    find_lex $P111, "$ops"
    .return ($P111)
  control_1954:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1967"  :anon :subid("113_1313886916.84408") :outer("112_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 2017
    new $P114, "Undef"
    set $P1969, $P114
    .lex "$blockreg", $P1969
.annotate 'line', 2018
    new $P115, "Undef"
    set $P1970, $P115
    .lex "$blockref", $P1970
.annotate 'line', 2017
    find_lex $P116, "self"
    $P117 = $P116."uniquereg"("P")
    store_lex "$blockreg", $P117
.annotate 'line', 2018
    new $P116, 'String'
    set $P116, ".const 'Sub' "
    find_lex $P117, "$blockreg"
    concat $P118, $P116, $P117
    concat $P119, $P118, " = "
    store_lex "$blockref", $P119
.annotate 'line', 2019
    find_lex $P116, "$blockref"
    find_lex $P117, "self"
    find_lex $P118, "$value"
    $P119 = $P118."subid"()
    set $S100, $P119
    $S101 = $P117."escape"($S100)
    concat $P120, $P116, $S101
    store_lex "$blockref", $P120
.annotate 'line', 2020
    find_lex $P116, "$ops"
    find_lex $P117, "$blockref"
    $P116."push_pirop"($P117)
.annotate 'line', 2021
    find_lex $P116, "$ops"
    find_lex $P117, "$blockreg"
    $P116."result"($P117)
.annotate 'line', 2022
    new $P116, "Exception"
    set $P116['type'], .CONTROL_RETURN
    find_lex $P117, "$ops"
    setattribute $P116, 'payload', $P117
    throw $P116
.annotate 'line', 2016
    .return ()
.end


.namespace ["PAST";"Compiler"]
.sub "_block1983" :load :anon :subid("114_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 41
    .const 'Sub' $P1985 = "11_1313886916.84408" 
    $P105 = $P1985()
    .return ($P105)
.end


.namespace []
.sub "_block2077" :load :anon :subid("115_1313886916.84408")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1
    .const 'Sub' $P2079 = "10_1313886916.84408" 
    $P100 = $P2079()
    .return ($P100)
.end

