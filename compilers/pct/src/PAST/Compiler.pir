
.namespace []
.sub "_block1000"  :anon :subid("10_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1313881544.08239" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 41
    .const 'Sub' $P1003 = "11_1313881544.08239" 
    capture_lex $P1003
    $P107 = $P1003()
.annotate 'line', 1
    .return ($P107)
    .const 'Sub' $P2072 = "115_1313881544.08239" 
    .return ($P2072)
.end


.namespace []
.sub "" :load :init :subid("post116") :outer("10_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1313881544.08239" 
    .local pmc block
    set block, $P1001
.annotate 'line', 1
    load_bytecode "PCT/HLLCompiler.pbc"
    $P2074 = get_root_global ["parrot"], "P6metaclass"
    new $P102, "ResizablePMCArray"
    push $P102, "%!symtable"
    $P2074."new_class"("PAST::Compiler", "PCT::HLLCompiler" :named("parent"), $P102 :named("attr"))
.end


.namespace ["PAST";"Compiler"]
.sub "_block1002"  :subid("11_1313881544.08239") :outer("10_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 41
    .const 'Sub' $P1947 = "112_1313881544.08239" 
    capture_lex $P1947
    .const 'Sub' $P1930 = "109_1313881544.08239" 
    capture_lex $P1930
    .const 'Sub' $P1909 = "107_1313881544.08239" 
    capture_lex $P1909
    .const 'Sub' $P1904 = "106_1313881544.08239" 
    capture_lex $P1904
    .const 'Sub' $P1898 = "105_1313881544.08239" 
    capture_lex $P1898
    .const 'Sub' $P1876 = "103_1313881544.08239" 
    capture_lex $P1876
    .const 'Sub' $P1854 = "100_1313881544.08239" 
    capture_lex $P1854
    .const 'Sub' $P1839 = "99_1313881544.08239" 
    capture_lex $P1839
    .const 'Sub' $P1823 = "97_1313881544.08239" 
    capture_lex $P1823
    .const 'Sub' $P1807 = "95_1313881544.08239" 
    capture_lex $P1807
    .const 'Sub' $P1748 = "89_1313881544.08239" 
    capture_lex $P1748
    .const 'Sub' $P1732 = "88_1313881544.08239" 
    capture_lex $P1732
    .const 'Sub' $P1722 = "87_1313881544.08239" 
    capture_lex $P1722
    .const 'Sub' $P1710 = "86_1313881544.08239" 
    capture_lex $P1710
    .const 'Sub' $P1691 = "84_1313881544.08239" 
    capture_lex $P1691
    .const 'Sub' $P1679 = "83_1313881544.08239" 
    capture_lex $P1679
    .const 'Sub' $P1654 = "80_1313881544.08239" 
    capture_lex $P1654
    .const 'Sub' $P1635 = "79_1313881544.08239" 
    capture_lex $P1635
    .const 'Sub' $P1621 = "77_1313881544.08239" 
    capture_lex $P1621
    .const 'Sub' $P1616 = "76_1313881544.08239" 
    capture_lex $P1616
    .const 'Sub' $P1611 = "75_1313881544.08239" 
    capture_lex $P1611
    .const 'Sub' $P1596 = "73_1313881544.08239" 
    capture_lex $P1596
    .const 'Sub' $P1569 = "71_1313881544.08239" 
    capture_lex $P1569
    .const 'Sub' $P1564 = "70_1313881544.08239" 
    capture_lex $P1564
    .const 'Sub' $P1559 = "69_1313881544.08239" 
    capture_lex $P1559
    .const 'Sub' $P1554 = "68_1313881544.08239" 
    capture_lex $P1554
    .const 'Sub' $P1531 = "67_1313881544.08239" 
    capture_lex $P1531
    .const 'Sub' $P1500 = "66_1313881544.08239" 
    capture_lex $P1500
    .const 'Sub' $P1495 = "65_1313881544.08239" 
    capture_lex $P1495
    .const 'Sub' $P1446 = "61_1313881544.08239" 
    capture_lex $P1446
    .const 'Sub' $P1441 = "60_1313881544.08239" 
    capture_lex $P1441
    .const 'Sub' $P1416 = "58_1313881544.08239" 
    capture_lex $P1416
    .const 'Sub' $P1394 = "57_1313881544.08239" 
    capture_lex $P1394
    .const 'Sub' $P1377 = "56_1313881544.08239" 
    capture_lex $P1377
    .const 'Sub' $P1274 = "46_1313881544.08239" 
    capture_lex $P1274
    .const 'Sub' $P1238 = "42_1313881544.08239" 
    capture_lex $P1238
    .const 'Sub' $P1224 = "41_1313881544.08239" 
    capture_lex $P1224
    .const 'Sub' $P1205 = "39_1313881544.08239" 
    capture_lex $P1205
    .const 'Sub' $P1193 = "38_1313881544.08239" 
    capture_lex $P1193
    .const 'Sub' $P1188 = "37_1313881544.08239" 
    capture_lex $P1188
    .const 'Sub' $P1183 = "36_1313881544.08239" 
    capture_lex $P1183
    .const 'Sub' $P1176 = "35_1313881544.08239" 
    capture_lex $P1176
    .const 'Sub' $P1169 = "34_1313881544.08239" 
    capture_lex $P1169
    .const 'Sub' $P1163 = "33_1313881544.08239" 
    capture_lex $P1163
    .const 'Sub' $P1157 = "32_1313881544.08239" 
    capture_lex $P1157
    .const 'Sub' $P1152 = "31_1313881544.08239" 
    capture_lex $P1152
    .const 'Sub' $P1145 = "30_1313881544.08239" 
    capture_lex $P1145
    .const 'Sub' $P1091 = "23_1313881544.08239" 
    capture_lex $P1091
    .const 'Sub' $P1086 = "22_1313881544.08239" 
    capture_lex $P1086
    .const 'Sub' $P1069 = "20_1313881544.08239" 
    capture_lex $P1069
    .const 'Sub' $P1060 = "19_1313881544.08239" 
    capture_lex $P1060
    .const 'Sub' $P1052 = "18_1313881544.08239" 
    capture_lex $P1052
    .const 'Sub' $P1046 = "17_1313881544.08239" 
    capture_lex $P1046
    .const 'Sub' $P1039 = "16_1313881544.08239" 
    capture_lex $P1039
    .const 'Sub' $P1022 = "14_1313881544.08239" 
    capture_lex $P1022
    .const 'Sub' $P1009 = "12_1313881544.08239" 
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
    get_global $P101, "$serno"
    unless_null $P101, vivify_212
    new $P101, "Undef"
    set_global "$serno", $P101
  vivify_212:
.annotate 'line', 49
    get_global $P102, "$TEMPREG_BASE"
    unless_null $P102, vivify_213
    new $P102, "Undef"
    set_global "$TEMPREG_BASE", $P102
  vivify_213:
.annotate 'line', 50
    get_global $P103, "$UNIQUE_BASE"
    unless_null $P103, vivify_214
    new $P103, "Undef"
    set_global "$UNIQUE_BASE", $P103
  vivify_214:
.annotate 'line', 172
    get_global $P1007, "@?BLOCK"
    unless_null $P1007, vivify_215
    $P1007 = root_new ['parrot';'ResizablePMCArray']
    set_global "@?BLOCK", $P1007
  vivify_215:
.annotate 'line', 970
    .const 'Sub' $P1009 = "12_1313881544.08239" 
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
    get_global $P106, "%piropsig"
    get_global $P106, "%valflags"
    get_global $P106, "%controltypes"
    get_global $P106, "$serno"
    get_global $P106, "$TEMPREG_BASE"
    get_global $P106, "$UNIQUE_BASE"
    get_global $P106, "@?BLOCK"
    find_lex $P106, "shallow_clone_hash"
.annotate 'line', 2001
    .const 'Sub' $P1947 = "112_1313881544.08239" 
    newclosure $P1976, $P1947
.annotate 'line', 41
    .return ($P1976)
    .const 'Sub' $P1978 = "114_1313881544.08239" 
    .return ($P1978)
.end


.namespace ["PAST";"Compiler"]
.sub "" :load :init :subid("post117") :outer("11_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 41
    .const 'Sub' $P1003 = "11_1313881544.08239" 
    .local pmc block
    set block, $P1003
.annotate 'line', 54
    get_hll_global $P107, ["PAST"], "Compiler"
    $P107."language"("PAST")
.annotate 'line', 55
    get_hll_global $P107, ["PAST"], "Compiler"
    new $P108, "ResizablePMCArray"
    push $P108, "post"
    push $P108, "pir"
    push $P108, "evalpmc"
    $P107."stages"($P108)
.annotate 'line', 58
    new $P107, "String"
    assign $P107, "PP+"
    get_global $P1980, "%piropsig"
    unless_null $P1980, vivify_118
    $P1980 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1980
  vivify_118:
    set $P1980["add"], $P107
.annotate 'line', 59
    new $P107, "String"
    assign $P107, "PPP"
    get_global $P1981, "%piropsig"
    unless_null $P1981, vivify_119
    $P1981 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1981
  vivify_119:
    set $P1981["band"], $P107
.annotate 'line', 60
    new $P107, "String"
    assign $P107, "PPP"
    get_global $P1982, "%piropsig"
    unless_null $P1982, vivify_120
    $P1982 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1982
  vivify_120:
    set $P1982["bxor"], $P107
.annotate 'line', 61
    new $P107, "String"
    assign $P107, "PP"
    get_global $P1983, "%piropsig"
    unless_null $P1983, vivify_121
    $P1983 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1983
  vivify_121:
    set $P1983["bnot"], $P107
.annotate 'line', 62
    new $P107, "String"
    assign $P107, "PPP"
    get_global $P1984, "%piropsig"
    unless_null $P1984, vivify_122
    $P1984 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1984
  vivify_122:
    set $P1984["bor"], $P107
.annotate 'line', 63
    new $P107, "String"
    assign $P107, "IPs"
    get_global $P1985, "%piropsig"
    unless_null $P1985, vivify_123
    $P1985 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1985
  vivify_123:
    set $P1985["can"], $P107
.annotate 'line', 64
    new $P107, "String"
    assign $P107, "Si"
    get_global $P1986, "%piropsig"
    unless_null $P1986, vivify_124
    $P1986 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1986
  vivify_124:
    set $P1986["chr"], $P107
.annotate 'line', 65
    new $P107, "String"
    assign $P107, "PP"
    get_global $P1987, "%piropsig"
    unless_null $P1987, vivify_125
    $P1987 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1987
  vivify_125:
    set $P1987["clone"], $P107
.annotate 'line', 66
    new $P107, "String"
    assign $P107, "PP~"
    get_global $P1988, "%piropsig"
    unless_null $P1988, vivify_126
    $P1988 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1988
  vivify_126:
    set $P1988["concat"], $P107
.annotate 'line', 67
    new $P107, "String"
    assign $P107, "0PP"
    get_global $P1989, "%piropsig"
    unless_null $P1989, vivify_127
    $P1989 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1989
  vivify_127:
    set $P1989["copy"], $P107
.annotate 'line', 68
    new $P107, "String"
    assign $P107, "IP"
    get_global $P1990, "%piropsig"
    unless_null $P1990, vivify_128
    $P1990 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1990
  vivify_128:
    set $P1990["defined"], $P107
.annotate 'line', 69
    new $P107, "String"
    assign $P107, "vQ*"
    get_global $P1991, "%piropsig"
    unless_null $P1991, vivify_129
    $P1991 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1991
  vivify_129:
    set $P1991["delete"], $P107
.annotate 'line', 70
    new $P107, "String"
    assign $P107, "v~"
    get_global $P1992, "%piropsig"
    unless_null $P1992, vivify_130
    $P1992 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1992
  vivify_130:
    set $P1992["die"], $P107
.annotate 'line', 71
    new $P107, "String"
    assign $P107, "PP+"
    get_global $P1993, "%piropsig"
    unless_null $P1993, vivify_131
    $P1993 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1993
  vivify_131:
    set $P1993["div"], $P107
.annotate 'line', 72
    new $P107, "String"
    assign $P107, "IPs"
    get_global $P1994, "%piropsig"
    unless_null $P1994, vivify_132
    $P1994 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1994
  vivify_132:
    set $P1994["does"], $P107
.annotate 'line', 73
    new $P107, "String"
    assign $P107, "Ss"
    get_global $P1995, "%piropsig"
    unless_null $P1995, vivify_133
    $P1995 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1995
  vivify_133:
    set $P1995["downcase"], $P107
.annotate 'line', 74
    new $P107, "String"
    assign $P107, "IP"
    get_global $P1996, "%piropsig"
    unless_null $P1996, vivify_134
    $P1996 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1996
  vivify_134:
    set $P1996["elements"], $P107
.annotate 'line', 75
    new $P107, "String"
    assign $P107, "IQ*"
    get_global $P1997, "%piropsig"
    unless_null $P1997, vivify_135
    $P1997 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1997
  vivify_135:
    set $P1997["exists"], $P107
.annotate 'line', 76
    new $P107, "String"
    assign $P107, "vi"
    get_global $P1998, "%piropsig"
    unless_null $P1998, vivify_136
    $P1998 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1998
  vivify_136:
    set $P1998["exit"], $P107
.annotate 'line', 77
    new $P107, "String"
    assign $P107, "PP+"
    get_global $P1999, "%piropsig"
    unless_null $P1999, vivify_137
    $P1999 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1999
  vivify_137:
    set $P1999["fdiv"], $P107
.annotate 'line', 78
    new $P107, "String"
    assign $P107, "Is"
    get_global $P2000, "%piropsig"
    unless_null $P2000, vivify_138
    $P2000 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2000
  vivify_138:
    set $P2000["find_codepoint"], $P107
.annotate 'line', 79
    new $P107, "String"
    assign $P107, "Ps"
    get_global $P2001, "%piropsig"
    unless_null $P2001, vivify_139
    $P2001 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2001
  vivify_139:
    set $P2001["find_dynamic_lex"], $P107
.annotate 'line', 80
    new $P107, "String"
    assign $P107, "Ps"
    get_global $P2002, "%piropsig"
    unless_null $P2002, vivify_140
    $P2002 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2002
  vivify_140:
    set $P2002["find_name"], $P107
.annotate 'line', 81
    new $P107, "String"
    assign $P107, "P"
    get_global $P2003, "%piropsig"
    unless_null $P2003, vivify_141
    $P2003 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2003
  vivify_141:
    set $P2003["getinterp"], $P107
.annotate 'line', 82
    new $P107, "String"
    assign $P107, "P~P"
    get_global $P2004, "%piropsig"
    unless_null $P2004, vivify_142
    $P2004 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2004
  vivify_142:
    set $P2004["getprop"], $P107
.annotate 'line', 83
    new $P107, "String"
    assign $P107, "P"
    get_global $P2005, "%piropsig"
    unless_null $P2005, vivify_143
    $P2005 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2005
  vivify_143:
    set $P2005["getstderr"], $P107
.annotate 'line', 84
    new $P107, "String"
    assign $P107, "P"
    get_global $P2006, "%piropsig"
    unless_null $P2006, vivify_144
    $P2006 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2006
  vivify_144:
    set $P2006["getstdin"], $P107
.annotate 'line', 85
    new $P107, "String"
    assign $P107, "P"
    get_global $P2007, "%piropsig"
    unless_null $P2007, vivify_145
    $P2007 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2007
  vivify_145:
    set $P2007["getstdout"], $P107
.annotate 'line', 86
    new $P107, "String"
    assign $P107, "Issi"
    get_global $P2008, "%piropsig"
    unless_null $P2008, vivify_146
    $P2008 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2008
  vivify_146:
    set $P2008["index"], $P107
.annotate 'line', 87
    new $P107, "String"
    assign $P107, "IP~"
    get_global $P2009, "%piropsig"
    unless_null $P2009, vivify_147
    $P2009 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2009
  vivify_147:
    set $P2009["isa"], $P107
.annotate 'line', 88
    new $P107, "String"
    assign $P107, "IP"
    get_global $P2010, "%piropsig"
    unless_null $P2010, vivify_148
    $P2010 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2010
  vivify_148:
    set $P2010["isfalse"], $P107
.annotate 'line', 89
    new $P107, "String"
    assign $P107, "IP"
    get_global $P2011, "%piropsig"
    unless_null $P2011, vivify_149
    $P2011 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2011
  vivify_149:
    set $P2011["isnull"], $P107
.annotate 'line', 90
    new $P107, "String"
    assign $P107, "IPP"
    get_global $P2012, "%piropsig"
    unless_null $P2012, vivify_150
    $P2012 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2012
  vivify_150:
    set $P2012["issame"], $P107
.annotate 'line', 91
    new $P107, "String"
    assign $P107, "IP"
    get_global $P2013, "%piropsig"
    unless_null $P2013, vivify_151
    $P2013 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2013
  vivify_151:
    set $P2013["istrue"], $P107
.annotate 'line', 92
    new $P107, "String"
    assign $P107, "SsP"
    get_global $P2014, "%piropsig"
    unless_null $P2014, vivify_152
    $P2014 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2014
  vivify_152:
    set $P2014["join"], $P107
.annotate 'line', 93
    new $P107, "String"
    assign $P107, "Is"
    get_global $P2015, "%piropsig"
    unless_null $P2015, vivify_153
    $P2015 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2015
  vivify_153:
    set $P2015["length"], $P107
.annotate 'line', 94
    new $P107, "String"
    assign $P107, "vs"
    get_global $P2016, "%piropsig"
    unless_null $P2016, vivify_154
    $P2016 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2016
  vivify_154:
    set $P2016["load_bytecode"], $P107
.annotate 'line', 95
    new $P107, "String"
    assign $P107, "vs"
    get_global $P2017, "%piropsig"
    unless_null $P2017, vivify_155
    $P2017 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2017
  vivify_155:
    set $P2017["load_language"], $P107
.annotate 'line', 96
    new $P107, "String"
    assign $P107, "P~"
    get_global $P2018, "%piropsig"
    unless_null $P2018, vivify_156
    $P2018 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2018
  vivify_156:
    set $P2018["loadlib"], $P107
.annotate 'line', 97
    new $P107, "String"
    assign $P107, "PP+"
    get_global $P2019, "%piropsig"
    unless_null $P2019, vivify_157
    $P2019 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2019
  vivify_157:
    set $P2019["mod"], $P107
.annotate 'line', 98
    new $P107, "String"
    assign $P107, "PP+"
    get_global $P2020, "%piropsig"
    unless_null $P2020, vivify_158
    $P2020 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2020
  vivify_158:
    set $P2020["mul"], $P107
.annotate 'line', 99
    new $P107, "String"
    assign $P107, "PP"
    get_global $P2021, "%piropsig"
    unless_null $P2021, vivify_159
    $P2021 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2021
  vivify_159:
    set $P2021["neg"], $P107
.annotate 'line', 100
    new $P107, "String"
    assign $P107, "P~"
    get_global $P2022, "%piropsig"
    unless_null $P2022, vivify_160
    $P2022 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2022
  vivify_160:
    set $P2022["new"], $P107
.annotate 'line', 101
    new $P107, "String"
    assign $P107, "PP"
    get_global $P2023, "%piropsig"
    unless_null $P2023, vivify_161
    $P2023 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2023
  vivify_161:
    set $P2023["newclosure"], $P107
.annotate 'line', 102
    new $P107, "String"
    assign $P107, "PP"
    get_global $P2024, "%piropsig"
    unless_null $P2024, vivify_162
    $P2024 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2024
  vivify_162:
    set $P2024["not"], $P107
.annotate 'line', 103
    new $P107, "String"
    assign $P107, "Isi"
    get_global $P2025, "%piropsig"
    unless_null $P2025, vivify_163
    $P2025 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2025
  vivify_163:
    set $P2025["ord"], $P107
.annotate 'line', 104
    new $P107, "String"
    assign $P107, "PP"
    get_global $P2026, "%piropsig"
    unless_null $P2026, vivify_164
    $P2026 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2026
  vivify_164:
    set $P2026["pop"], $P107
.annotate 'line', 105
    new $P107, "String"
    assign $P107, "NN+"
    get_global $P2027, "%piropsig"
    unless_null $P2027, vivify_165
    $P2027 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2027
  vivify_165:
    set $P2027["pow"], $P107
.annotate 'line', 106
    new $P107, "String"
    assign $P107, "v*"
    get_global $P2028, "%piropsig"
    unless_null $P2028, vivify_166
    $P2028 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2028
  vivify_166:
    set $P2028["print"], $P107
.annotate 'line', 107
    new $P107, "String"
    assign $P107, "v*"
    get_global $P2029, "%piropsig"
    unless_null $P2029, vivify_167
    $P2029 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2029
  vivify_167:
    set $P2029["printerr"], $P107
.annotate 'line', 108
    new $P107, "String"
    assign $P107, "0P*"
    get_global $P2030, "%piropsig"
    unless_null $P2030, vivify_168
    $P2030 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2030
  vivify_168:
    set $P2030["push"], $P107
.annotate 'line', 109
    new $P107, "String"
    assign $P107, "Ssi"
    get_global $P2031, "%piropsig"
    unless_null $P2031, vivify_169
    $P2031 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2031
  vivify_169:
    set $P2031["repeat"], $P107
.annotate 'line', 110
    new $P107, "String"
    assign $P107, "Ssiis"
    get_global $P2032, "%piropsig"
    unless_null $P2032, vivify_170
    $P2032 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2032
  vivify_170:
    set $P2032["replace"], $P107
.annotate 'line', 111
    new $P107, "String"
    assign $P107, "v*"
    get_global $P2033, "%piropsig"
    unless_null $P2033, vivify_171
    $P2033 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2033
  vivify_171:
    set $P2033["say"], $P107
.annotate 'line', 112
    new $P107, "String"
    assign $P107, "PP"
    get_global $P2034, "%piropsig"
    unless_null $P2034, vivify_172
    $P2034 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2034
  vivify_172:
    set $P2034["set"], $P107
.annotate 'line', 113
    new $P107, "String"
    assign $P107, "0P~P"
    get_global $P2035, "%piropsig"
    unless_null $P2035, vivify_173
    $P2035 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2035
  vivify_173:
    set $P2035["setprop"], $P107
.annotate 'line', 114
    new $P107, "String"
    assign $P107, "0P~P"
    get_global $P2036, "%piropsig"
    unless_null $P2036, vivify_174
    $P2036 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2036
  vivify_174:
    set $P2036["setattribute"], $P107
.annotate 'line', 115
    new $P107, "String"
    assign $P107, "PP"
    get_global $P2037, "%piropsig"
    unless_null $P2037, vivify_175
    $P2037 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2037
  vivify_175:
    set $P2037["shift"], $P107
.annotate 'line', 116
    new $P107, "String"
    assign $P107, "PP+"
    get_global $P2038, "%piropsig"
    unless_null $P2038, vivify_176
    $P2038 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2038
  vivify_176:
    set $P2038["shl"], $P107
.annotate 'line', 117
    new $P107, "String"
    assign $P107, "PP+"
    get_global $P2039, "%piropsig"
    unless_null $P2039, vivify_177
    $P2039 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2039
  vivify_177:
    set $P2039["shr"], $P107
.annotate 'line', 118
    new $P107, "String"
    assign $P107, "v+"
    get_global $P2040, "%piropsig"
    unless_null $P2040, vivify_178
    $P2040 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2040
  vivify_178:
    set $P2040["sleep"], $P107
.annotate 'line', 119
    new $P107, "String"
    assign $P107, "0PPii"
    get_global $P2041, "%piropsig"
    unless_null $P2041, vivify_179
    $P2041 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2041
  vivify_179:
    set $P2041["splice"], $P107
.annotate 'line', 120
    new $P107, "String"
    assign $P107, "Pss"
    get_global $P2042, "%piropsig"
    unless_null $P2042, vivify_180
    $P2042 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2042
  vivify_180:
    set $P2042["split"], $P107
.annotate 'line', 121
    new $P107, "String"
    assign $P107, "PP+"
    get_global $P2043, "%piropsig"
    unless_null $P2043, vivify_181
    $P2043 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2043
  vivify_181:
    set $P2043["sub"], $P107
.annotate 'line', 122
    new $P107, "String"
    assign $P107, "Ssii"
    get_global $P2044, "%piropsig"
    unless_null $P2044, vivify_182
    $P2044 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2044
  vivify_182:
    set $P2044["substr"], $P107
.annotate 'line', 123
    new $P107, "String"
    assign $P107, "Ss"
    get_global $P2045, "%piropsig"
    unless_null $P2045, vivify_183
    $P2045 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2045
  vivify_183:
    set $P2045["titlecase"], $P107
.annotate 'line', 124
    new $P107, "String"
    assign $P107, "vi"
    get_global $P2046, "%piropsig"
    unless_null $P2046, vivify_184
    $P2046 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2046
  vivify_184:
    set $P2046["trace"], $P107
.annotate 'line', 125
    new $P107, "String"
    assign $P107, "SP"
    get_global $P2047, "%piropsig"
    unless_null $P2047, vivify_185
    $P2047 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2047
  vivify_185:
    set $P2047["typeof"], $P107
.annotate 'line', 126
    new $P107, "String"
    assign $P107, "0P*"
    get_global $P2048, "%piropsig"
    unless_null $P2048, vivify_186
    $P2048 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2048
  vivify_186:
    set $P2048["unshift"], $P107
.annotate 'line', 127
    new $P107, "String"
    assign $P107, "Ss"
    get_global $P2049, "%piropsig"
    unless_null $P2049, vivify_187
    $P2049 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2049
  vivify_187:
    set $P2049["upcase"], $P107
.annotate 'line', 132
    new $P107, "String"
    assign $P107, "s~*:e"
    get_global $P2050, "%valflags"
    unless_null $P2050, vivify_188
    $P2050 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2050
  vivify_188:
    set $P2050["String"], $P107
.annotate 'line', 133
    new $P107, "String"
    assign $P107, "i+*:"
    get_global $P2051, "%valflags"
    unless_null $P2051, vivify_189
    $P2051 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2051
  vivify_189:
    set $P2051["Integer"], $P107
.annotate 'line', 134
    new $P107, "String"
    assign $P107, "n+*:"
    get_global $P2052, "%valflags"
    unless_null $P2052, vivify_190
    $P2052 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2052
  vivify_190:
    set $P2052["Float"], $P107
.annotate 'line', 135
    new $P107, "String"
    assign $P107, "i+*:c"
    get_global $P2053, "%valflags"
    unless_null $P2053, vivify_191
    $P2053 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2053
  vivify_191:
    set $P2053["!macro_const"], $P107
.annotate 'line', 136
    new $P107, "String"
    assign $P107, "i+*:c"
    get_global $P2054, "%valflags"
    unless_null $P2054, vivify_192
    $P2054 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2054
  vivify_192:
    set $P2054["!cclass"], $P107
.annotate 'line', 137
    new $P107, "String"
    assign $P107, "i+*:c"
    get_global $P2055, "%valflags"
    unless_null $P2055, vivify_193
    $P2055 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2055
  vivify_193:
    set $P2055["!except_severity"], $P107
.annotate 'line', 138
    new $P107, "String"
    assign $P107, "i+*:c"
    get_global $P2056, "%valflags"
    unless_null $P2056, vivify_194
    $P2056 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2056
  vivify_194:
    set $P2056["!except_types"], $P107
.annotate 'line', 139
    new $P107, "String"
    assign $P107, "i+*:c"
    get_global $P2057, "%valflags"
    unless_null $P2057, vivify_195
    $P2057 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2057
  vivify_195:
    set $P2057["!iterator"], $P107
.annotate 'line', 140
    new $P107, "String"
    assign $P107, "i+*:c"
    get_global $P2058, "%valflags"
    unless_null $P2058, vivify_196
    $P2058 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2058
  vivify_196:
    set $P2058["!socket"], $P107
.annotate 'line', 144
    new $P107, "String"
    assign $P107, ".CONTROL_RETURN, .CONTROL_OK, .CONTROL_BREAK, .CONTROL_CONTINUE, .CONTROL_TAKE, .CONTROL_LEAVE, .CONTROL_EXIT, .CONTROL_LOOP_NEXT, .CONTROL_LOOP_LAST, .CONTROL_LOOP_REDO"
    get_global $P2059, "%controltypes"
    unless_null $P2059, vivify_197
    $P2059 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2059
  vivify_197:
    set $P2059["CONTROL"], $P107
.annotate 'line', 145
    new $P107, "String"
    assign $P107, ".CONTROL_RETURN"
    get_global $P2060, "%controltypes"
    unless_null $P2060, vivify_198
    $P2060 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2060
  vivify_198:
    set $P2060["RETURN"], $P107
.annotate 'line', 146
    new $P107, "String"
    assign $P107, ".CONTROL_OK"
    get_global $P2061, "%controltypes"
    unless_null $P2061, vivify_199
    $P2061 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2061
  vivify_199:
    set $P2061["OK"], $P107
.annotate 'line', 147
    new $P107, "String"
    assign $P107, ".CONTROL_BREAK"
    get_global $P2062, "%controltypes"
    unless_null $P2062, vivify_200
    $P2062 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2062
  vivify_200:
    set $P2062["BREAK"], $P107
.annotate 'line', 148
    new $P107, "String"
    assign $P107, ".CONTROL_CONTINUE"
    get_global $P2063, "%controltypes"
    unless_null $P2063, vivify_201
    $P2063 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2063
  vivify_201:
    set $P2063["CONTINUE"], $P107
.annotate 'line', 149
    new $P107, "String"
    assign $P107, ".CONTROL_ERROR"
    get_global $P2064, "%controltypes"
    unless_null $P2064, vivify_202
    $P2064 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2064
  vivify_202:
    set $P2064["ERROR"], $P107
.annotate 'line', 150
    new $P107, "String"
    assign $P107, ".CONTROL_TAKE"
    get_global $P2065, "%controltypes"
    unless_null $P2065, vivify_203
    $P2065 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2065
  vivify_203:
    set $P2065["GATHER"], $P107
.annotate 'line', 151
    new $P107, "String"
    assign $P107, ".CONTROL_LEAVE"
    get_global $P2066, "%controltypes"
    unless_null $P2066, vivify_204
    $P2066 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2066
  vivify_204:
    set $P2066["LEAVE"], $P107
.annotate 'line', 152
    new $P107, "String"
    assign $P107, ".CONTROL_EXIT"
    get_global $P2067, "%controltypes"
    unless_null $P2067, vivify_205
    $P2067 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2067
  vivify_205:
    set $P2067["EXIT"], $P107
.annotate 'line', 153
    new $P107, "String"
    assign $P107, ".CONTROL_NEXT"
    get_global $P2068, "%controltypes"
    unless_null $P2068, vivify_206
    $P2068 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2068
  vivify_206:
    set $P2068["NEXT"], $P107
.annotate 'line', 154
    new $P107, "String"
    assign $P107, ".CONTROL_LAST"
    get_global $P2069, "%controltypes"
    unless_null $P2069, vivify_207
    $P2069 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2069
  vivify_207:
    set $P2069["LAST"], $P107
.annotate 'line', 155
    new $P107, "String"
    assign $P107, ".CONTROL_REDO"
    get_global $P2070, "%controltypes"
    unless_null $P2070, vivify_208
    $P2070 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2070
  vivify_208:
    set $P2070["REDO"], $P107
.annotate 'line', 160
    new $P107, "Integer"
    assign $P107, 100
    set_global "$TEMPREG_BASE", $P107
.annotate 'line', 161
    new $P107, "Integer"
    assign $P107, 1000
    set_global "$UNIQUE_BASE", $P107
.annotate 'line', 164
    get_global $P107, "$UNIQUE_BASE"
    clone $P108, $P107
    set_global "$serno", $P108
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "shallow_clone_hash"  :subid("12_1313881544.08239") :outer("11_1313881544.08239")
    .param pmc param_1012
.annotate 'file', ''
.annotate 'line', 970
    .const 'Sub' $P1016 = "13_1313881544.08239" 
    capture_lex $P1016
    new $P1011, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1011, control_1010
    push_eh $P1011
    .lex "%to_clone", param_1012
.annotate 'line', 971
    $P1014 = root_new ['parrot';'Hash']
    set $P1013, $P1014
    .lex "%ret", $P1013
.annotate 'line', 970
    find_lex $P104, "%ret"
.annotate 'line', 972
    find_lex $P105, "%to_clone"
    defined $I101, $P105
    unless $I101, for_undef_216
    iter $P104, $P105
    new $P107, 'ExceptionHandler'
    set_label $P107, loop1020_handler
    $P107."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P107
  loop1020_test:
    unless $P104, loop1020_done
    shift $P106, $P104
  loop1020_redo:
    .const 'Sub' $P1016 = "13_1313881544.08239" 
    capture_lex $P1016
    $P1016($P106)
  loop1020_next:
    goto loop1020_test
  loop1020_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, 'type'
    eq $P109, .CONTROL_LOOP_NEXT, loop1020_next
    eq $P109, .CONTROL_LOOP_REDO, loop1020_redo
  loop1020_done:
    pop_eh 
  for_undef_216:
.annotate 'line', 970
    find_lex $P104, "%ret"
    .return ($P104)
  control_1010:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1015"  :anon :subid("13_1313881544.08239") :outer("12_1313881544.08239")
    .param pmc param_1017
.annotate 'file', ''
.annotate 'line', 972
    .lex "$_", param_1017
.annotate 'line', 973
    find_lex $P107, "$_"
    find_lex $P1018, "%to_clone"
    unless_null $P1018, vivify_217
    $P1018 = root_new ['parrot';'Hash']
  vivify_217:
    set $P108, $P1018[$P107]
    unless_null $P108, vivify_218
    new $P108, "Undef"
  vivify_218:
    find_lex $P109, "$_"
    find_lex $P1019, "%ret"
    unless_null $P1019, vivify_219
    $P1019 = root_new ['parrot';'Hash']
    store_lex "%ret", $P1019
  vivify_219:
    set $P1019[$P109], $P108
.annotate 'line', 972
    .return ($P108)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "to_post"  :subid("14_1313881544.08239") :method :outer("11_1313881544.08239")
    .param pmc param_1025
    .param pmc param_1026 :slurpy :named
.annotate 'file', ''
.annotate 'line', 174
    .const 'Sub' $P1035 = "15_1313881544.08239" 
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
    new $P106, "Undef"
    set $P1029, $P106
    .lex "$*SUB", $P1029
.annotate 'line', 183
    $P1031 = root_new ['parrot';'Hash']
    set $P1030, $P1031
    .lex "%tempregs", $P1030
.annotate 'line', 175
    $P1032 = root_new ['parrot';'Hash']
    find_lex $P107, "self"
    setattribute $P107, "%!symtable", $P1032
.annotate 'line', 177
    get_global $P107, "@?BLOCK"
    defined $I101, $P107
    if $I101, unless_1033_end
.annotate 'line', 178
    new $P108, "ResizablePMCArray"
    set_global "@?BLOCK", $P108
  unless_1033_end:
.annotate 'line', 181
    get_global $P107, "@?BLOCK"
    store_lex "@*BLOCKPAST", $P107
.annotate 'line', 174
    find_lex $P107, "$*SUB"
    unless_null $P107, vivify_220
    get_hll_global $P107, "$SUB"
    unless_null $P107, vivify_221
    die "Contextual $*SUB not found"
  vivify_221:
  vivify_220:
.annotate 'line', 183
    find_dynamic_lex $P107, "%*TEMPREGS"
    store_lex "%tempregs", $P107
.annotate 'line', 185
    .const 'Sub' $P1035 = "15_1313881544.08239" 
    capture_lex $P1035
    $P107 = $P1035()
.annotate 'line', 174
    .return ($P107)
  control_1023:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1034"  :anon :subid("15_1313881544.08239") :outer("14_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 186
    $P1037 = root_new ['parrot';'Hash']
    set $P1036, $P1037
    .lex "%*TEMPREGS", $P1036
.annotate 'line', 185
    find_lex $P107, "%*TEMPREGS"
    unless_null $P107, vivify_222
    get_hll_global $P107, "%TEMPREGS"
    unless_null $P107, vivify_223
    die "Contextual %*TEMPREGS not found"
  vivify_223:
  vivify_222:
.annotate 'line', 187
    find_lex $P107, "%tempregs"
    defined $I101, $P107
    if $I101, if_1038
.annotate 'line', 191
    find_lex $P108, "self"
    $P109 = $P108."tempreg_frame"()
    store_lex "%*TEMPREGS", $P109
.annotate 'line', 190
    goto if_1038_end
  if_1038:
.annotate 'line', 188
    find_lex $P108, "%tempregs"
    store_lex "%*TEMPREGS", $P108
  if_1038_end:
.annotate 'line', 194
    find_lex $P107, "self"
    find_lex $P108, "$past"
    $P109 = $P107."as_post"($P108, "v" :named("rtype"))
.annotate 'line', 185
    .return ($P109)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "escape"  :subid("16_1313881544.08239") :method :outer("11_1313881544.08239")
    .param pmc param_1042
.annotate 'file', ''
.annotate 'line', 201
    new $P1041, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1041, control_1040
    push_eh $P1041
    .lex "self", self
    .lex "$str", param_1042
.annotate 'line', 202
    new $P106, "Undef"
    set $P1043, $P106
    .lex "$estr", $P1043
    find_lex $P107, "$str"
    set $S101, $P107
    escape $S102, $S101
    new $P108, 'String'
    set $P108, $S102
    store_lex "$estr", $P108
.annotate 'line', 203
    find_lex $P108, "$estr"
    set $S101, $P108
    index $I101, $S101, unicode:"\\x"
    set $N101, $I101
    isge $I102, $N101, 0.0
    unless $I102, unless_1045
    new $P107, 'Integer'
    set $P107, $I102
    goto unless_1045_end
  unless_1045:
    find_lex $P109, "$estr"
    set $S102, $P109
    index $I103, $S102, unicode:"\\u"
    set $N102, $I103
    isgt $I104, $N102, 0.0
    new $P107, 'Integer'
    set $P107, $I104
  unless_1045_end:
    if $P107, if_1044
.annotate 'line', 207
    new $P110, "String"
    assign $P110, "\""
    find_lex $P111, "$estr"
    concat $P112, $P110, $P111
    store_lex "$estr", $P112
.annotate 'line', 206
    goto if_1044_end
  if_1044:
.annotate 'line', 204
    new $P110, "String"
    assign $P110, "unicode:\""
    find_lex $P111, "$estr"
    concat $P112, $P110, $P111
    store_lex "$estr", $P112
  if_1044_end:
.annotate 'line', 209
    find_lex $P107, "$estr"
    concat $P108, $P107, "\""
    store_lex "$estr", $P108
.annotate 'line', 201
    .return ($P108)
  control_1040:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "unique"  :subid("17_1313881544.08239") :method :outer("11_1313881544.08239")
    .param pmc param_1049 :optional
    .param int has_param_1049 :opt_flag
.annotate 'file', ''
.annotate 'line', 217
    new $P1048, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1048, control_1047
    push_eh $P1048
    .lex "self", self
    if has_param_1049, optparam_224
    new $P106, "Undef"
    set param_1049, $P106
  optparam_224:
    .lex "$fmt", param_1049
.annotate 'line', 218
    find_lex $P107, "$fmt"
    defined $I101, $P107
    if $I101, unless_1050_end
    new $P108, "String"
    assign $P108, ""
    store_lex "$fmt", $P108
  unless_1050_end:
.annotate 'line', 219
    find_lex $P107, "$fmt"
    get_global $P108, "$serno"
    clone $P1051, $P108
    inc $P108
    concat $P109, $P107, $P1051
    store_lex "$fmt", $P109
.annotate 'line', 217
    .return ($P109)
  control_1047:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "uniquereg"  :subid("18_1313881544.08239") :method :outer("11_1313881544.08239")
    .param pmc param_1055
.annotate 'file', ''
.annotate 'line', 226
    new $P1054, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1054, control_1053
    push_eh $P1054
    .lex "self", self
    .lex "$rtype", param_1055
.annotate 'line', 231
    new $P106, "Undef"
    set $P1056, $P106
    .lex "$i", $P1056
.annotate 'line', 227
    find_lex $P107, "$rtype"
    if $P107, unless_1057_end
    find_lex $P108, "self"
    $P108."panic"("rtype not set")
  unless_1057_end:
.annotate 'line', 229
    find_lex $P107, "$rtype"
    set $S101, $P107
    iseq $I101, $S101, "v"
    unless $I101, if_1058_end
    new $P108, "Exception"
    set $P108['type'], .CONTROL_RETURN
    new $P109, "String"
    assign $P109, ""
    setattribute $P108, 'payload', $P109
    throw $P108
  if_1058_end:
.annotate 'line', 231
    find_lex $P107, "$rtype"
    set $S101, $P107
    index $I101, "Ss~Nn+Ii", $S101
    new $P108, 'Integer'
    set $P108, $I101
    store_lex "$i", $P108
.annotate 'line', 232
    new $P107, "String"
    assign $P107, "P"
    store_lex "$rtype", $P107
.annotate 'line', 233
    find_lex $P107, "$i"
    set $N101, $P107
    islt $I101, $N101, 0.0
    if $I101, unless_1059_end
    find_lex $P108, "$i"
    set $I102, $P108
    substr $S101, "SSSNNNII", $I102, 1
    new $P109, 'String'
    set $P109, $S101
    store_lex "$rtype", $P109
  unless_1059_end:
.annotate 'line', 234
    new $P107, "String"
    assign $P107, "$"
    find_lex $P108, "$rtype"
    concat $P109, $P107, $P108
    store_lex "$rtype", $P109
.annotate 'line', 236
    find_lex $P107, "self"
    find_lex $P108, "$rtype"
    $P109 = $P107."unique"($P108)
.annotate 'line', 226
    .return ($P109)
  control_1053:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "tempreg_frame"  :subid("19_1313881544.08239") :method :outer("11_1313881544.08239")
.annotate 'file', ''
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
    find_lex $P106, "%tempregs"
.annotate 'line', 246
    get_global $P106, "$TEMPREG_BASE"
    clone $P107, $P106
    find_lex $P1065, "%tempregs"
    unless_null $P1065, vivify_225
    $P1065 = root_new ['parrot';'Hash']
    store_lex "%tempregs", $P1065
  vivify_225:
    set $P1065["I"], $P107
.annotate 'line', 247
    get_global $P106, "$TEMPREG_BASE"
    clone $P107, $P106
    find_lex $P1066, "%tempregs"
    unless_null $P1066, vivify_226
    $P1066 = root_new ['parrot';'Hash']
    store_lex "%tempregs", $P1066
  vivify_226:
    set $P1066["N"], $P107
.annotate 'line', 248
    get_global $P106, "$TEMPREG_BASE"
    clone $P107, $P106
    find_lex $P1067, "%tempregs"
    unless_null $P1067, vivify_227
    $P1067 = root_new ['parrot';'Hash']
    store_lex "%tempregs", $P1067
  vivify_227:
    set $P1067["S"], $P107
.annotate 'line', 249
    get_global $P106, "$TEMPREG_BASE"
    clone $P107, $P106
    find_lex $P1068, "%tempregs"
    unless_null $P1068, vivify_228
    $P1068 = root_new ['parrot';'Hash']
    store_lex "%tempregs", $P1068
  vivify_228:
    set $P1068["P"], $P107
.annotate 'line', 243
    find_lex $P106, "%tempregs"
    .return ($P106)
  control_1061:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "tempreg"  :subid("20_1313881544.08239") :method :outer("11_1313881544.08239")
    .param pmc param_1072
.annotate 'file', ''
.annotate 'line', 268
    .const 'Sub' $P1081 = "21_1313881544.08239" 
    capture_lex $P1081
    new $P1071, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1071, control_1070
    push_eh $P1071
    .lex "self", self
    .lex "$rtype", param_1072
.annotate 'line', 273
    new $P106, "Undef"
    set $P1073, $P106
    .lex "$I0", $P1073
.annotate 'line', 280
    new $P107, "Undef"
    set $P1074, $P107
    .lex "$reg", $P1074
.annotate 'line', 281
    new $P108, "Undef"
    set $P1075, $P108
    .lex "$rnum", $P1075
.annotate 'line', 269
    find_lex $P109, "$rtype"
    if $P109, unless_1076_end
    find_lex $P110, "self"
    $P110."panic"("rtype not set")
  unless_1076_end:
.annotate 'line', 271
    find_lex $P109, "$rtype"
    set $S101, $P109
    iseq $I101, $S101, "v"
    unless $I101, if_1077_end
    new $P110, "Exception"
    set $P110['type'], .CONTROL_RETURN
    new $P111, "String"
    assign $P111, ""
    setattribute $P110, 'payload', $P111
    throw $P110
  if_1077_end:
.annotate 'line', 273
    find_lex $P109, "$rtype"
    set $S101, $P109
    index $I101, "Ss~Nn+Ii", $S101
    new $P110, 'Integer'
    set $P110, $I101
    store_lex "$I0", $P110
.annotate 'line', 274
    new $P109, "String"
    assign $P109, "P"
    store_lex "$rtype", $P109
.annotate 'line', 275
    find_lex $P109, "$I0"
    set $N101, $P109
    islt $I101, $N101, 0.0
    if $I101, unless_1078_end
    find_lex $P110, "$I0"
    set $I102, $P110
    substr $S101, "SSSNNNII", $I102, 1
    new $P111, 'String'
    set $P111, $S101
    store_lex "$rtype", $P111
  unless_1078_end:
.annotate 'line', 278
    find_dynamic_lex $P109, "%*TEMPREGS"
    unless_null $P109, vivify_229
    get_hll_global $P109, "%TEMPREGS"
    unless_null $P109, vivify_230
    die "Contextual %*TEMPREGS not found"
  vivify_230:
  vivify_229:
    if $P109, unless_1079_end
    new $P110, "Exception"
    set $P110['type'], .CONTROL_RETURN
    find_lex $P111, "self"
    new $P112, "String"
    assign $P112, "$"
    find_lex $P113, "$rtype"
    concat $P114, $P112, $P113
    $P115 = $P111."unique"($P114)
    setattribute $P110, 'payload', $P115
    throw $P110
  unless_1079_end:
.annotate 'line', 268
    find_lex $P109, "$reg"
.annotate 'line', 281
    find_lex $P109, "$rtype"
    find_dynamic_lex $P110, "%*TEMPREGS"
    unless_null $P110, vivify_231
    get_hll_global $P110, "%TEMPREGS"
    unless_null $P110, vivify_232
    die "Contextual %*TEMPREGS not found"
  vivify_232:
  vivify_231:
    set $P111, $P110[$P109]
    unless_null $P111, vivify_233
    new $P111, "Undef"
  vivify_233:
    store_lex "$rnum", $P111
.annotate 'line', 282
    new $P113, 'ExceptionHandler'
    set_label $P113, loop1085_handler
    $P113."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P113
    goto loop1085_redo
  loop1085_test:
    find_lex $P109, "$reg"
    find_dynamic_lex $P110, "%*TEMPREGS"
    unless_null $P110, vivify_234
    get_hll_global $P110, "%TEMPREGS"
    unless_null $P110, vivify_235
    die "Contextual %*TEMPREGS not found"
  vivify_235:
  vivify_234:
    set $P111, $P110[$P109]
    unless_null $P111, vivify_236
    new $P111, "Undef"
  vivify_236:
    unless $P111, loop1085_done
  loop1085_redo:
    .const 'Sub' $P1081 = "21_1313881544.08239" 
    capture_lex $P1081
    $P1081()
  loop1085_next:
    goto loop1085_test
  loop1085_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, 'type'
    eq $P114, .CONTROL_LOOP_NEXT, loop1085_next
    eq $P114, .CONTROL_LOOP_REDO, loop1085_redo
  loop1085_done:
    pop_eh 
.annotate 'line', 268
    find_lex $P109, "$reg"
    .return ($P109)
  control_1070:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1080"  :anon :subid("21_1313881544.08239") :outer("20_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 286
    new $P112, "Undef"
    set $P1082, $P112
    .lex "$S0", $P1082
.annotate 'line', 284
    find_lex $P113, "$rnum"
    set $N101, $P113
    get_global $P114, "$UNIQUE_BASE"
    set $N102, $P114
    isge $I101, $N101, $N102
    unless $I101, if_1083_end
    new $P115, "Exception"
    set $P115['type'], .CONTROL_RETURN
    find_lex $P116, "self"
    new $P117, "String"
    assign $P117, "$"
    find_lex $P118, "$rtype"
    concat $P119, $P117, $P118
    $P120 = $P116."unique"($P119)
    setattribute $P115, 'payload', $P120
    throw $P115
  if_1083_end:
.annotate 'line', 286
    find_lex $P113, "$rnum"
    set $S101, $P113
    new $P114, 'String'
    set $P114, $S101
    store_lex "$S0", $P114
.annotate 'line', 282
    find_lex $P113, "$rnum"
    clone $P1084, $P113
    inc $P113
.annotate 'line', 288
    find_lex $P113, "$rnum"
    find_lex $P114, "$rtype"
    find_dynamic_lex $P115, "%*TEMPREGS"
    unless_null $P115, vivify_237
    get_hll_global $P115, "%TEMPREGS"
    unless_null $P115, vivify_238
    die "Contextual %*TEMPREGS not found"
  vivify_238:
    store_dynamic_lex "%*TEMPREGS", $P115
  vivify_237:
    set $P115[$P114], $P113
.annotate 'line', 289
    new $P113, "String"
    assign $P113, "$"
    find_lex $P114, "$rtype"
    concat $P115, $P113, $P114
    find_lex $P116, "$S0"
    concat $P117, $P115, $P116
    store_lex "$reg", $P117
.annotate 'line', 282
    .return ($P117)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "coerce"  :subid("22_1313881544.08239") :method :outer("11_1313881544.08239")
    .param pmc param_1089
    .param pmc param_1090
.annotate 'file', ''
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
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "post_children"  :subid("23_1313881544.08239") :method :outer("11_1313881544.08239")
    .param pmc param_1094
    .param pmc param_1095 :slurpy :named
.annotate 'file', ''
.annotate 'line', 441
    .const 'Sub' $P1132 = "28_1313881544.08239" 
    capture_lex $P1132
    .const 'Sub' $P1112 = "24_1313881544.08239" 
    capture_lex $P1112
    new $P1093, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1093, control_1092
    push_eh $P1093
    .lex "self", self
    .lex "$node", param_1094
    .lex "%options", param_1095
.annotate 'line', 442
    new $P106, "Undef"
    set $P1096, $P106
    .lex "$ops", $P1096
.annotate 'line', 444
    new $P107, "Undef"
    set $P1097, $P107
    .lex "$pushop", $P1097
.annotate 'line', 447
    new $P108, "Undef"
    set $P1098, $P108
    .lex "$signature", $P1098
.annotate 'line', 448
    new $P109, "Undef"
    set $P1099, $P109
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
    new $P110, "Undef"
    set $P1104, $P110
    .lex "$sigidx", $P1104
.annotate 'line', 456
    new $P111, "Undef"
    set $P1105, $P111
    .lex "$rtype", $P1105
.annotate 'line', 457
    new $P112, "Undef"
    set $P1106, $P112
    .lex "$iter", $P1106
.annotate 'line', 442
    get_hll_global $P113, ["POST"], "Ops"
    find_lex $P114, "$node"
    $P115 = $P113."new"($P114 :named("node"))
    store_lex "$ops", $P115
.annotate 'line', 444
    find_lex $P114, "$node"
    $S101 = $P114."childorder"()
    iseq $I101, $S101, "right"
    if $I101, if_1107
    new $P116, "String"
    assign $P116, "push"
    set $P113, $P116
    goto if_1107_end
  if_1107:
    new $P115, "String"
    assign $P115, "unshift"
    set $P113, $P115
  if_1107_end:
    store_lex "$pushop", $P113
.annotate 'line', 447
    find_lex $P1109, "%options"
    unless_null $P1109, vivify_239
    $P1109 = root_new ['parrot';'Hash']
  vivify_239:
    set $P114, $P1109["signature"]
    unless_null $P114, vivify_240
    new $P114, "Undef"
  vivify_240:
    unless $P114, unless_1108
    set $P113, $P114
    goto unless_1108_end
  unless_1108:
    new $P115, "String"
    assign $P115, "**"
    set $P113, $P115
  unless_1108_end:
    store_lex "$signature", $P113
.annotate 'line', 448
    find_lex $P113, "$signature"
    set $S101, $P113
    length $I101, $S101
    new $P114, 'Integer'
    set $P114, $I101
    sub $P115, $P114, 1
    store_lex "$sigmax", $P115
.annotate 'line', 441
    find_lex $P113, "@posargs"
    find_lex $P113, "@namedargs"
.annotate 'line', 455
    new $P113, "Integer"
    assign $P113, 1
    store_lex "$sigidx", $P113
.annotate 'line', 456
    find_lex $P113, "$signature"
    set $S101, $P113
    find_lex $P114, "$sigidx"
    set $I101, $P114
    substr $S102, $S101, $I101, 1
    new $P115, 'String'
    set $P115, $S102
    store_lex "$rtype", $P115
.annotate 'line', 457
    find_lex $P113, "$node"
    $P114 = $P113."iterator"()
    store_lex "$iter", $P114
.annotate 'line', 458
    new $P114, 'ExceptionHandler'
    set_label $P114, loop1144_handler
    $P114."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P114
  loop1144_test:
    find_lex $P113, "$iter"
    unless $P113, loop1144_done
  loop1144_redo:
.annotate 'line', 459
    find_lex $P114, "$rtype"
    set $S101, $P114
    isne $I101, $S101, "Q"
    if $I101, if_1110
.annotate 'line', 499
    .const 'Sub' $P1132 = "28_1313881544.08239" 
    capture_lex $P1132
    $P1132()
    goto if_1110_end
  if_1110:
.annotate 'line', 459
    .const 'Sub' $P1112 = "24_1313881544.08239" 
    capture_lex $P1112
    $P1112()
  if_1110_end:
.annotate 'line', 520
    find_lex $P114, "$sigidx"
    set $N101, $P114
    find_lex $P115, "$sigmax"
    set $N102, $P115
    islt $I101, $N101, $N102
    unless $I101, if_1142_end
    find_lex $P116, "$sigidx"
    clone $P1143, $P116
    inc $P116
.annotate 'line', 522
    find_lex $P116, "$signature"
    set $S101, $P116
    find_lex $P117, "$sigidx"
    set $I102, $P117
    substr $S102, $S101, $I102, 1
    new $P118, 'String'
    set $P118, $S102
    store_lex "$rtype", $P118
  if_1142_end:
  loop1144_next:
.annotate 'line', 458
    goto loop1144_test
  loop1144_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, 'type'
    eq $P115, .CONTROL_LOOP_NEXT, loop1144_next
    eq $P115, .CONTROL_LOOP_REDO, loop1144_redo
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
    getattribute $P113, exception, "payload"
    .return ($P113)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1131"  :anon :subid("28_1313881544.08239") :outer("23_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 499
    .const 'Sub' $P1137 = "29_1313881544.08239" 
    capture_lex $P1137
.annotate 'line', 502
    new $P118, "Undef"
    set $P1133, $P118
    .lex "$cpast", $P1133
.annotate 'line', 503
    new $P119, "Undef"
    set $P1134, $P119
    .lex "$cpost", $P1134
.annotate 'line', 502
    find_lex $P120, "$iter"
    shift $P121, $P120
    store_lex "$cpast", $P121
.annotate 'line', 503
    find_lex $P120, "self"
    find_lex $P121, "$cpast"
    $P122 = $P120."as_post"($P121, "P" :named("rtype"))
    store_lex "$cpost", $P122
.annotate 'line', 504
    find_lex $P120, "self"
    find_lex $P121, "$cpost"
    $P122 = $P120."coerce"($P121, "P")
    store_lex "$cpost", $P122
.annotate 'line', 506
    find_lex $P121, "$iter"
    if $P121, if_1135
    set $P120, $P121
    goto if_1135_end
  if_1135:
    .const 'Sub' $P1137 = "29_1313881544.08239" 
    capture_lex $P1137
    $P125 = $P1137()
    set $P120, $P125
  if_1135_end:
.annotate 'line', 499
    .return ($P120)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1136"  :anon :subid("29_1313881544.08239") :outer("28_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 507
    new $P122, "Undef"
    set $P1138, $P122
    .lex "$kpast", $P1138
.annotate 'line', 510
    new $P123, "Undef"
    set $P1139, $P123
    .lex "$kpost", $P1139
.annotate 'line', 513
    new $P124, "Undef"
    set $P1140, $P124
    .lex "$S0", $P1140
.annotate 'line', 507
    find_lex $P125, "$iter"
    shift $P126, $P125
    store_lex "$kpast", $P126
.annotate 'line', 506
    find_lex $P125, "$sigidx"
    clone $P1141, $P125
    inc $P125
.annotate 'line', 509
    find_lex $P125, "$signature"
    set $S102, $P125
    find_lex $P126, "$sigidx"
    set $I102, $P126
    substr $S103, $S102, $I102, 1
    new $P127, 'String'
    set $P127, $S103
    store_lex "$rtype", $P127
.annotate 'line', 510
    find_lex $P125, "self"
    find_lex $P126, "$kpast"
    find_lex $P127, "$rtype"
    $P128 = $P125."as_post"($P126, $P127 :named("rtype"))
    store_lex "$kpost", $P128
.annotate 'line', 511
    find_lex $P125, "self"
    find_lex $P126, "$kpost"
    find_lex $P127, "$rtype"
    $P128 = $P125."coerce"($P126, $P127)
    store_lex "$kpost", $P128
.annotate 'line', 513
    find_lex $P125, "$cpost"
    set $S102, $P125
    new $P126, 'String'
    set $P126, $S102
    concat $P127, $P126, "["
    find_lex $P128, "$kpost"
    set $S103, $P128
    concat $P129, $P127, $S103
    concat $P130, $P129, "]"
    store_lex "$S0", $P130
.annotate 'line', 514
    find_lex $P125, "$ops"
    find_lex $P126, "$kpost"
    $P127 = $P125."new"($P126)
    store_lex "$kpost", $P127
.annotate 'line', 515
    find_lex $P125, "$kpost"
    find_lex $P126, "$cpost"
    $P125."push"($P126)
.annotate 'line', 516
    find_lex $P125, "$ops"
    find_lex $P126, "$kpost"
    find_lex $P127, "$pushop"
    set $S102, $P127
    $P125.$S102($P126)
.annotate 'line', 517
    find_lex $P125, "@posargs"
    find_lex $P126, "$S0"
    $P127 = $P125."push"($P126)
.annotate 'line', 506
    .return ($P127)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1111"  :anon :subid("24_1313881544.08239") :outer("23_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 459
    .const 'Sub' $P1117 = "25_1313881544.08239" 
    capture_lex $P1117
.annotate 'line', 460
    new $P115, "Undef"
    set $P1113, $P115
    .lex "$cpast", $P1113
.annotate 'line', 461
    new $P116, "Undef"
    set $P1114, $P116
    .lex "$cpost", $P1114
.annotate 'line', 460
    find_lex $P117, "$iter"
    shift $P118, $P117
    store_lex "$cpast", $P118
.annotate 'line', 461
    find_lex $P117, "self"
    find_lex $P118, "$cpast"
    find_lex $P119, "$rtype"
    $P120 = $P117."as_post"($P118, $P119 :named("rtype"))
    store_lex "$cpost", $P120
.annotate 'line', 462
    find_lex $P117, "self"
    find_lex $P118, "$cpost"
    find_lex $P119, "$rtype"
    $P120 = $P117."coerce"($P118, $P119)
    store_lex "$cpost", $P120
.annotate 'line', 464
    get_hll_global $P118, ["PAST"], "Node"
    find_lex $P119, "$cpast"
    $P120 = $P118."ACCEPTS"($P119)
    if $P120, if_1115
.annotate 'line', 495
    find_lex $P126, "$ops"
    find_lex $P127, "$cpost"
    find_lex $P128, "$pushop"
    set $S102, $P128
    $P126.$S102($P127)
.annotate 'line', 496
    find_lex $P126, "@posargs"
    find_lex $P127, "$cpost"
    $P128 = $P126."push"($P127)
.annotate 'line', 494
    set $P117, $P128
.annotate 'line', 464
    goto if_1115_end
  if_1115:
    .const 'Sub' $P1117 = "25_1313881544.08239" 
    capture_lex $P1117
    $P125 = $P1117()
    set $P117, $P125
  if_1115_end:
.annotate 'line', 459
    .return ($P117)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1116"  :anon :subid("25_1313881544.08239") :outer("24_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 464
    .const 'Sub' $P1124 = "26_1313881544.08239" 
    capture_lex $P1124
.annotate 'line', 465
    new $P121, "Undef"
    set $P1118, $P121
    .lex "$isflat", $P1118
.annotate 'line', 466
    new $P122, "Undef"
    set $P1119, $P122
    .lex "$npast", $P1119
.annotate 'line', 467
    new $P123, "Undef"
    set $P1120, $P123
    .lex "$npost", $P1120
.annotate 'line', 465
    find_lex $P124, "$cpast"
    $P125 = $P124."flat"()
    store_lex "$isflat", $P125
.annotate 'line', 466
    find_lex $P124, "$cpast"
    $P125 = $P124."named"()
    store_lex "$npast", $P125
.annotate 'line', 464
    find_lex $P124, "$npost"
.annotate 'line', 468
    find_lex $P126, "$rtype"
    set $S102, $P126
    iseq $I102, $S102, ":"
    if $I102, if_1122
    new $P125, 'Integer'
    set $P125, $I102
    goto if_1122_end
  if_1122:
    find_lex $P127, "$npast"
    set $P125, $P127
  if_1122_end:
    if $P125, if_1121
.annotate 'line', 484
    find_lex $P132, "$isflat"
    if $P132, if_1130
.annotate 'line', 489
    find_lex $P133, "$ops"
    find_lex $P134, "$cpost"
    find_lex $P135, "$pushop"
    set $S103, $P135
    $P133.$S103($P134)
.annotate 'line', 490
    find_lex $P133, "@posargs"
    find_lex $P134, "$cpost"
    $P135 = $P133."push"($P134)
.annotate 'line', 488
    set $P130, $P135
.annotate 'line', 484
    goto if_1130_end
  if_1130:
.annotate 'line', 485
    find_lex $P133, "$ops"
    find_lex $P134, "$cpost"
    find_lex $P135, "$pushop"
    set $S103, $P135
    $P133.$S103($P134)
.annotate 'line', 486
    find_lex $P133, "@posargs"
    find_lex $P134, "$cpost"
    set $S103, $P134
    new $P135, 'String'
    set $P135, $S103
    concat $P136, $P135, " :flat"
    $P137 = $P133."push"($P136)
.annotate 'line', 484
    set $P130, $P137
  if_1130_end:
.annotate 'line', 483
    set $P124, $P130
.annotate 'line', 468
    goto if_1121_end
  if_1121:
    .const 'Sub' $P1124 = "26_1313881544.08239" 
    capture_lex $P1124
    $P129 = $P1124()
    set $P124, $P129
  if_1121_end:
.annotate 'line', 464
    .return ($P124)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1123"  :anon :subid("26_1313881544.08239") :outer("25_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 468
    .const 'Sub' $P1128 = "27_1313881544.08239" 
    capture_lex $P1128
.annotate 'line', 469
    new $P128, "Undef"
    set $P1125, $P128
    .lex "$S0", $P1125
    find_lex $P129, "$cpost"
    set $S103, $P129
    new $P130, 'String'
    set $P130, $S103
    store_lex "$S0", $P130
.annotate 'line', 470
    find_lex $P129, "$isflat"
    if $P129, if_1126
.annotate 'line', 473
    .const 'Sub' $P1128 = "27_1313881544.08239" 
    capture_lex $P1128
    $P1128()
    goto if_1126_end
  if_1126:
.annotate 'line', 471
    find_lex $P130, "$S0"
    concat $P131, $P130, " :named :flat"
    store_lex "$S0", $P131
  if_1126_end:
.annotate 'line', 480
    find_lex $P129, "$ops"
    find_lex $P130, "$cpost"
    find_lex $P131, "$pushop"
    set $S103, $P131
    $P129.$S103($P130)
.annotate 'line', 481
    find_lex $P129, "@namedargs"
    find_lex $P130, "$S0"
    $P131 = $P129."push"($P130)
.annotate 'line', 468
    .return ($P131)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1127"  :anon :subid("27_1313881544.08239") :outer("26_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 477
    new $P130, "Undef"
    set $P1129, $P130
    .lex "$S1", $P1129
.annotate 'line', 474
    find_lex $P131, "self"
    find_lex $P132, "$npast"
    $P133 = $P131."as_post"($P132, "~" :named("rtype"))
    store_lex "$npost", $P133
.annotate 'line', 475
    find_lex $P131, "$ops"
    find_lex $P132, "$cpost"
    $P133 = $P131."new"($P132)
    store_lex "$cpost", $P133
.annotate 'line', 476
    find_lex $P131, "$cpost"
    find_lex $P132, "$npost"
    $P131."push"($P132)
.annotate 'line', 477
    find_lex $P131, "$npost"
    set $S103, $P131
    new $P132, 'String'
    set $P132, $S103
    store_lex "$S1", $P132
.annotate 'line', 478
    find_lex $P131, "$S0"
    concat $P132, $P131, " :named("
    find_lex $P133, "$S1"
    concat $P134, $P132, $P133
    concat $P135, $P134, ")"
    store_lex "$S0", $P135
.annotate 'line', 473
    .return ($P135)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("30_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,_)
    .param pmc param_1148
    .param pmc param_1149 :slurpy :named
.annotate 'file', ''
.annotate 'line', 552
    new $P1147, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1147, control_1146
    push_eh $P1147
    .lex "self", self
    .lex "$node", param_1148
    .lex "%options", param_1149
.annotate 'line', 553
    new $P106, "Undef"
    set $P1150, $P106
    .lex "$what", $P1150
.annotate 'line', 552
    find_lex $P107, "$what"
.annotate 'line', 555
    find_lex $P107, "$node"
    isnull $I101, $P107
    if $I101, if_1151
.annotate 'line', 559
    new $P108, "String"
    assign $P108, "node of type "
    find_lex $P109, "$node"
    typeof $S101, $P109
    concat $P110, $P108, $S101
    store_lex "$what", $P110
.annotate 'line', 558
    goto if_1151_end
  if_1151:
.annotate 'line', 556
    new $P108, "String"
    assign $P108, "a null node"
    store_lex "$what", $P108
  if_1151_end:
.annotate 'line', 562
    find_lex $P107, "self"
    new $P108, "String"
    assign $P108, "PAST::Compiler can't compile "
    find_lex $P109, "$what"
    concat $P110, $P108, $P109
    $P111 = $P107."panic"($P110)
.annotate 'line', 552
    .return ($P111)
  control_1146:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("31_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["Undef"])
    .param pmc param_1155
    .param pmc param_1156 :slurpy :named
.annotate 'file', ''
.annotate 'line', 568
    new $P1154, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1154, control_1153
    push_eh $P1154
    .lex "self", self
    .lex "$node", param_1155
    .lex "%options", param_1156
.annotate 'line', 569
    get_hll_global $P106, ["POST"], "Ops"
    find_lex $P107, "self"
    $P108 = $P107."tempreg"("P")
    $P109 = $P106."new"($P108 :named("result"))
.annotate 'line', 568
    .return ($P109)
  control_1153:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("32_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["Integer"])
    .param pmc param_1160
    .param pmc param_1161 :slurpy :named
.annotate 'file', ''
.annotate 'line', 579
    new $P1159, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1159, control_1158
    push_eh $P1159
    .lex "self", self
    .lex "$node", param_1160
    .lex "%options", param_1161
.annotate 'line', 580
    find_lex $P106, "self"
    get_hll_global $P107, ["POST"], "Ops"
    find_lex $P108, "$node"
    $P109 = $P107."new"($P108 :named("result"))
    find_lex $P1162, "%options"
    unless_null $P1162, vivify_241
    $P1162 = root_new ['parrot';'Hash']
  vivify_241:
    set $P110, $P1162["rtype"]
    unless_null $P110, vivify_242
    new $P110, "Undef"
  vivify_242:
    $P111 = $P106."coerce"($P109, $P110)
.annotate 'line', 579
    .return ($P111)
  control_1158:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("33_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["Float"])
    .param pmc param_1166
    .param pmc param_1167 :slurpy :named
.annotate 'file', ''
.annotate 'line', 583
    new $P1165, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1165, control_1164
    push_eh $P1165
    .lex "self", self
    .lex "$node", param_1166
    .lex "%options", param_1167
.annotate 'line', 584
    find_lex $P106, "self"
    get_hll_global $P107, ["POST"], "Ops"
    find_lex $P108, "$node"
    $P109 = $P107."new"($P108 :named("result"))
    find_lex $P1168, "%options"
    unless_null $P1168, vivify_243
    $P1168 = root_new ['parrot';'Hash']
  vivify_243:
    set $P110, $P1168["rtype"]
    unless_null $P110, vivify_244
    new $P110, "Undef"
  vivify_244:
    $P111 = $P106."coerce"($P109, $P110)
.annotate 'line', 583
    .return ($P111)
  control_1164:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("34_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["String"])
    .param pmc param_1172
    .param pmc param_1173 :slurpy :named
.annotate 'file', ''
.annotate 'line', 587
    new $P1171, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1171, control_1170
    push_eh $P1171
    .lex "self", self
    .lex "$node", param_1172
    .lex "%options", param_1173
.annotate 'line', 588
    new $P106, "Undef"
    set $P1174, $P106
    .lex "$value", $P1174
    find_lex $P107, "self"
    find_lex $P108, "$node"
    $P109 = $P107."escape"($P108)
    store_lex "$value", $P109
.annotate 'line', 589
    find_lex $P107, "self"
    get_hll_global $P108, ["POST"], "Ops"
    find_lex $P109, "$value"
    $P110 = $P108."new"($P109 :named("result"))
    find_lex $P1175, "%options"
    unless_null $P1175, vivify_245
    $P1175 = root_new ['parrot';'Hash']
  vivify_245:
    set $P111, $P1175["rtype"]
    unless_null $P111, vivify_246
    new $P111, "Undef"
  vivify_246:
    $P112 = $P107."coerce"($P110, $P111)
.annotate 'line', 587
    .return ($P112)
  control_1170:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_vivipost"  :subid("35_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["String"])
    .param pmc param_1179
    .param pmc param_1180 :slurpy :named
.annotate 'file', ''
.annotate 'line', 598
    new $P1178, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1178, control_1177
    push_eh $P1178
    .lex "self", self
    .lex "$node", param_1179
    .lex "%options", param_1180
.annotate 'line', 599
    new $P106, "Undef"
    set $P1181, $P106
    .lex "$result", $P1181
.annotate 'line', 600
    new $P107, "Undef"
    set $P1182, $P107
    .lex "$s", $P1182
.annotate 'line', 599
    find_lex $P108, "self"
    $P109 = $P108."tempreg"("P")
    store_lex "$result", $P109
.annotate 'line', 600
    find_lex $P108, "self"
    find_lex $P109, "$node"
    $P110 = $P108."escape"($P109)
    store_lex "$s", $P110
.annotate 'line', 601
    get_hll_global $P108, ["POST"], "Op"
    find_lex $P109, "$result"
    find_lex $P110, "$s"
    find_lex $P111, "$result"
    $P112 = $P108."new"($P109, $P110, "new" :named("pirop"), $P111 :named("result"))
.annotate 'line', 598
    .return ($P112)
  control_1177:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_vivipost"  :subid("36_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,_)
    .param pmc param_1186
    .param pmc param_1187 :slurpy :named
.annotate 'file', ''
.annotate 'line', 606
    new $P1185, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1185, control_1184
    push_eh $P1185
    .lex "self", self
    .lex "$node", param_1186
    .lex "%options", param_1187
.annotate 'line', 607
    find_lex $P106, "self"
    find_lex $P107, "$node"
    find_lex $P108, "%options"
    $P109 = $P106."as_post"($P107, $P108 :flat)
.annotate 'line', 606
    .return ($P109)
  control_1184:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("37_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["PAST";"Node"])
    .param pmc param_1191
    .param pmc param_1192 :slurpy :named
.annotate 'file', ''
.annotate 'line', 622
    new $P1190, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1190, control_1189
    push_eh $P1190
    .lex "self", self
    .lex "$node", param_1191
    .lex "%options", param_1192
.annotate 'line', 623
    find_lex $P106, "self"
    find_lex $P107, "$node"
    find_lex $P108, "%options"
    $P109 = $P106."node_as_post"($P107, $P108)
.annotate 'line', 622
    .return ($P109)
  control_1189:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "node_as_post"  :subid("38_1313881544.08239") :method :outer("11_1313881544.08239")
    .param pmc param_1196
    .param pmc param_1197
.annotate 'file', ''
.annotate 'line', 627
    new $P1195, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1195, control_1194
    push_eh $P1195
    .lex "self", self
    .lex "$node", param_1196
    .lex "%options", param_1197
.annotate 'line', 628
    new $P106, "Undef"
    set $P1198, $P106
    .lex "$rtype", $P1198
.annotate 'line', 630
    new $P107, "Undef"
    set $P1199, $P107
    .lex "$signature", $P1199
.annotate 'line', 633
    new $P108, "Undef"
    set $P1200, $P108
    .lex "$ops", $P1200
.annotate 'line', 636
    new $P109, "Undef"
    set $P1201, $P109
    .lex "$eh", $P1201
.annotate 'line', 628
    find_lex $P1202, "%options"
    unless_null $P1202, vivify_247
    $P1202 = root_new ['parrot';'Hash']
  vivify_247:
    set $P110, $P1202["rtype"]
    unless_null $P110, vivify_248
    new $P110, "Undef"
  vivify_248:
    store_lex "$rtype", $P110
.annotate 'line', 630
    find_lex $P110, "$node"
    $P111 = $P110."list"()
    set $N101, $P111
    set $I101, $N101
    repeat $S101, "v", $I101
    new $P112, 'String'
    set $P112, $S101
    store_lex "$signature", $P112
.annotate 'line', 631
    find_lex $P110, "$signature"
    find_lex $P111, "$rtype"
    concat $P112, $P110, $P111
    store_lex "$signature", $P112
.annotate 'line', 633
    find_lex $P110, "self"
    find_lex $P111, "$node"
    find_lex $P112, "$signature"
    $P113 = $P110."post_children"($P111, $P112 :named("signature"))
    store_lex "$ops", $P113
.annotate 'line', 634
    find_lex $P110, "$ops"
    find_lex $P1203, "$ops"
    unless_null $P1203, vivify_249
    $P1203 = root_new ['parrot';'ResizablePMCArray']
  vivify_249:
    set $P111, $P1203[-1]
    unless_null $P111, vivify_250
    new $P111, "Undef"
  vivify_250:
    $P110."result"($P111)
.annotate 'line', 636
    find_lex $P110, "$node"
    $P111 = $P110."handlers"()
    store_lex "$eh", $P111
.annotate 'line', 637
    find_lex $P110, "$eh"
    unless $P110, if_1204_end
    find_lex $P111, "self"
    find_lex $P112, "$ops"
    find_lex $P113, "$eh"
    find_lex $P114, "$rtype"
    $P115 = $P111."wrap_handlers"($P112, $P113, $P114 :named("rtype"))
    store_lex "$ops", $P115
  if_1204_end:
.annotate 'line', 627
    find_lex $P110, "$ops"
    .return ($P110)
  control_1194:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("39_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["PAST";"Stmt"])
    .param pmc param_1208
    .param pmc param_1209 :slurpy :named
.annotate 'file', ''
.annotate 'line', 649
    .const 'Sub' $P1215 = "40_1313881544.08239" 
    capture_lex $P1215
    new $P1207, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1207, control_1206
    push_eh $P1207
    .lex "self", self
    .lex "$node", param_1208
    .lex "%options", param_1209
.annotate 'line', 650
    $P1211 = root_new ['parrot';'Hash']
    set $P1210, $P1211
    .lex "%outerregs", $P1210
.annotate 'line', 651
    new $P106, "Undef"
    set $P1212, $P106
    .lex "$post", $P1212
.annotate 'line', 659
    new $P107, "Undef"
    set $P1213, $P107
    .lex "$result", $P1213
.annotate 'line', 650
    find_dynamic_lex $P108, "%*TEMPREGS"
    unless_null $P108, vivify_251
    get_hll_global $P108, "%TEMPREGS"
    unless_null $P108, vivify_252
    die "Contextual %*TEMPREGS not found"
  vivify_252:
  vivify_251:
    store_lex "%outerregs", $P108
.annotate 'line', 649
    find_lex $P108, "$post"
.annotate 'line', 653
    .const 'Sub' $P1215 = "40_1313881544.08239" 
    capture_lex $P1215
    $P1215()
.annotate 'line', 659
    find_lex $P108, "$post"
    $P109 = $P108."result"()
    store_lex "$result", $P109
.annotate 'line', 661
    find_lex $P110, "%outerregs"
    if $P110, if_1221
    set $P109, $P110
    goto if_1221_end
  if_1221:
    find_lex $P1222, "%options"
    unless_null $P1222, vivify_255
    $P1222 = root_new ['parrot';'Hash']
  vivify_255:
    set $P111, $P1222["rtype"]
    unless_null $P111, vivify_256
    new $P111, "Undef"
  vivify_256:
    set $S101, $P111
    isne $I101, $S101, "v"
    new $P109, 'Integer'
    set $P109, $I101
  if_1221_end:
    if $P109, if_1220
    set $P108, $P109
    goto if_1220_end
  if_1220:
.annotate 'line', 662
    find_lex $P112, "$result"
    set $S102, $P112
    substr $S103, $S102, 0, 1
    iseq $I102, $S103, "$"
    new $P108, 'Integer'
    set $P108, $I102
  if_1220_end:
    unless $P108, if_1219_end
.annotate 'line', 664
    new $P113, "Integer"
    assign $P113, 1
    find_lex $P114, "$result"
    find_lex $P1223, "%outerregs"
    unless_null $P1223, vivify_257
    $P1223 = root_new ['parrot';'Hash']
    store_lex "%outerregs", $P1223
  vivify_257:
    set $P1223[$P114], $P113
  if_1219_end:
.annotate 'line', 649
    find_lex $P108, "$post"
    .return ($P108)
  control_1206:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1214"  :anon :subid("40_1313881544.08239") :outer("39_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 654
    $P1217 = root_new ['parrot';'Hash']
    set $P1216, $P1217
    .lex "%*TEMPREGS", $P1216
.annotate 'line', 653
    find_lex $P108, "%*TEMPREGS"
    unless_null $P108, vivify_253
    get_hll_global $P108, "%TEMPREGS"
    unless_null $P108, vivify_254
    die "Contextual %*TEMPREGS not found"
  vivify_254:
  vivify_253:
.annotate 'line', 655
    find_lex $P108, "%outerregs"
    unless $P108, if_1218_end
    find_lex $P109, "%outerregs"
    clone $P110, $P109
    store_lex "%*TEMPREGS", $P110
  if_1218_end:
.annotate 'line', 656
    find_lex $P108, "self"
    find_lex $P109, "$node"
    find_lex $P110, "%options"
    $P111 = $P108."node_as_post"($P109, $P110)
    store_lex "$post", $P111
.annotate 'line', 653
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("41_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["PAST";"Control"])
    .param pmc param_1227
    .param pmc param_1228 :slurpy :named
.annotate 'file', ''
.annotate 'line', 676
    new $P1226, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1226, control_1225
    push_eh $P1226
    .lex "self", self
    .lex "$node", param_1227
    .lex "%options", param_1228
.annotate 'line', 678
    $P1230 = root_new ['parrot';'Hash']
    set $P1229, $P1230
    .lex "%*TEMPREGS", $P1229
.annotate 'line', 680
    new $P106, "Undef"
    set $P1231, $P106
    .lex "$ishandled", $P1231
.annotate 'line', 681
    new $P107, "Undef"
    set $P1232, $P107
    .lex "$nothandled", $P1232
.annotate 'line', 683
    new $P108, "Undef"
    set $P1233, $P108
    .lex "$ops", $P1233
.annotate 'line', 685
    new $P109, "Undef"
    set $P1234, $P109
    .lex "$signature", $P1234
.annotate 'line', 690
    new $P110, "Undef"
    set $P1235, $P110
    .lex "$children", $P1235
.annotate 'line', 692
    new $P111, "Undef"
    set $P1236, $P111
    .lex "$handled", $P1236
.annotate 'line', 676
    find_lex $P112, "%*TEMPREGS"
    unless_null $P112, vivify_258
    get_hll_global $P112, "%TEMPREGS"
    unless_null $P112, vivify_259
    die "Contextual %*TEMPREGS not found"
  vivify_259:
  vivify_258:
.annotate 'line', 680
    get_hll_global $P112, ["POST"], "Label"
    find_lex $P113, "self"
    $P114 = $P113."unique"("handled_")
    $P115 = $P112."new"($P114 :named("result"))
    store_lex "$ishandled", $P115
.annotate 'line', 681
    get_hll_global $P112, ["POST"], "Label"
    find_lex $P113, "self"
    $P114 = $P113."unique"("nothandled_")
    $P115 = $P112."new"($P114 :named("result"))
    store_lex "$nothandled", $P115
.annotate 'line', 683
    get_hll_global $P112, ["POST"], "Ops"
    find_lex $P113, "$node"
    $P114 = $P112."new"($P113 :named("node"))
    store_lex "$ops", $P114
.annotate 'line', 685
    find_lex $P112, "$node"
    $P113 = $P112."list"()
    set $N101, $P113
    set $I101, $N101
    repeat $S101, "v", $I101
    new $P114, 'String'
    set $P114, $S101
    store_lex "$signature", $P114
.annotate 'line', 686
    find_lex $P112, "$signature"
    find_lex $P1237, "%options"
    unless_null $P1237, vivify_260
    $P1237 = root_new ['parrot';'Hash']
  vivify_260:
    set $P113, $P1237["rtype"]
    unless_null $P113, vivify_261
    new $P113, "Undef"
  vivify_261:
    concat $P114, $P112, $P113
    store_lex "$signature", $P114
.annotate 'line', 688
    find_lex $P112, "$ops"
    $P112."push_pirop"(".local pmc exception")
.annotate 'line', 689
    find_lex $P112, "$ops"
    $P112."push_pirop"(".get_results (exception)")
.annotate 'line', 690
    find_lex $P112, "self"
    find_lex $P113, "$node"
    find_lex $P114, "$signature"
    $P115 = $P112."post_children"($P113, $P114 :named("signature"))
    store_lex "$children", $P115
.annotate 'line', 691
    find_lex $P112, "$ops"
    find_lex $P113, "$children"
    $P112."push"($P113)
.annotate 'line', 692
    find_lex $P112, "self"
    $P113 = $P112."uniquereg"("I")
    store_lex "$handled", $P113
.annotate 'line', 694
    find_lex $P112, "$ops"
    find_lex $P113, "$handled"
    $P112."push_pirop"("set", $P113, "exception[\"handled\"]")
.annotate 'line', 695
    find_lex $P112, "$ops"
    find_lex $P113, "$handled"
    find_lex $P114, "$nothandled"
    $P112."push_pirop"("ne", $P113, 1, $P114)
.annotate 'line', 696
    find_lex $P112, "$ops"
    find_lex $P113, "$ishandled"
    $P112."push"($P113)
.annotate 'line', 697
    find_lex $P112, "$ops"
    $P112."push_pirop"("return", "exception")
.annotate 'line', 698
    find_lex $P112, "$ops"
    find_lex $P113, "$nothandled"
    $P112."push"($P113)
.annotate 'line', 699
    find_lex $P112, "$ops"
    $P112."push_pirop"("rethrow", "exception")
.annotate 'line', 676
    find_lex $P112, "$ops"
    .return ($P112)
  control_1225:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P113, exception, "payload"
    .return ($P113)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "wrap_handlers"  :subid("42_1313881544.08239") :method :outer("11_1313881544.08239")
    .param pmc param_1241
    .param pmc param_1242
    .param pmc param_1243 :slurpy :named
.annotate 'file', ''
.annotate 'line', 703
    .const 'Sub' $P1253 = "43_1313881544.08239" 
    capture_lex $P1253
    new $P1240, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1240, control_1239
    push_eh $P1240
    .lex "self", self
    .lex "$child", param_1241
    .lex "$ehs", param_1242
    .lex "%options", param_1243
.annotate 'line', 704
    new $P106, "Undef"
    set $P1244, $P106
    .lex "$rtype", $P1244
.annotate 'line', 707
    $P1246 = root_new ['parrot';'Hash']
    set $P1245, $P1246
    .lex "%*TEMPREGS", $P1245
.annotate 'line', 709
    new $P107, "Undef"
    set $P1247, $P107
    .lex "$ops", $P1247
.annotate 'line', 710
    new $P108, "Undef"
    set $P1248, $P108
    .lex "$pops", $P1248
.annotate 'line', 711
    new $P109, "Undef"
    set $P1249, $P109
    .lex "$tail", $P1249
.annotate 'line', 712
    new $P110, "Undef"
    set $P1250, $P110
    .lex "$skip", $P1250
.annotate 'line', 704
    find_lex $P1251, "%options"
    unless_null $P1251, vivify_262
    $P1251 = root_new ['parrot';'Hash']
  vivify_262:
    set $P111, $P1251["rtype"]
    unless_null $P111, vivify_263
    new $P111, "Undef"
  vivify_263:
    store_lex "$rtype", $P111
.annotate 'line', 703
    find_lex $P111, "%*TEMPREGS"
    unless_null $P111, vivify_264
    get_hll_global $P111, "%TEMPREGS"
    unless_null $P111, vivify_265
    die "Contextual %*TEMPREGS not found"
  vivify_265:
  vivify_264:
.annotate 'line', 709
    get_hll_global $P111, ["POST"], "Ops"
    $P112 = $P111."new"()
    store_lex "$ops", $P112
.annotate 'line', 710
    get_hll_global $P111, ["POST"], "Ops"
    $P112 = $P111."new"()
    store_lex "$pops", $P112
.annotate 'line', 711
    get_hll_global $P111, ["POST"], "Ops"
    $P112 = $P111."new"()
    store_lex "$tail", $P112
.annotate 'line', 712
    get_hll_global $P111, ["POST"], "Label"
    find_lex $P112, "self"
    $P113 = $P112."unique"("skip_handler_")
    $P114 = $P111."new"($P113 :named("result"))
    store_lex "$skip", $P114
.annotate 'line', 714
    find_lex $P112, "$ehs"
    defined $I101, $P112
    unless $I101, for_undef_266
    iter $P111, $P112
    new $P118, 'ExceptionHandler'
    set_label $P118, loop1273_handler
    $P118."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P118
  loop1273_test:
    unless $P111, loop1273_done
    shift $P113, $P111
  loop1273_redo:
    .const 'Sub' $P1253 = "43_1313881544.08239" 
    capture_lex $P1253
    $P1253($P113)
  loop1273_next:
    goto loop1273_test
  loop1273_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P119, exception, 'type'
    eq $P119, .CONTROL_LOOP_NEXT, loop1273_next
    eq $P119, .CONTROL_LOOP_REDO, loop1273_redo
  loop1273_done:
    pop_eh 
  for_undef_266:
.annotate 'line', 747
    find_lex $P111, "$ops"
    find_lex $P112, "$child"
    $P111."push"($P112)
.annotate 'line', 749
    find_lex $P111, "$ops"
    find_lex $P112, "$pops"
    $P111."push"($P112)
.annotate 'line', 750
    find_lex $P111, "$ops"
    find_lex $P112, "$skip"
    $P111."push_pirop"("goto", $P112)
.annotate 'line', 751
    find_lex $P111, "$ops"
    find_lex $P112, "$tail"
    $P111."push"($P112)
.annotate 'line', 752
    find_lex $P111, "$ops"
    find_lex $P112, "$skip"
    $P111."push"($P112)
.annotate 'line', 703
    find_lex $P111, "$ops"
    .return ($P111)
  control_1239:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1252"  :anon :subid("43_1313881544.08239") :outer("42_1313881544.08239")
    .param pmc param_1258
.annotate 'file', ''
.annotate 'line', 714
    .const 'Sub' $P1270 = "45_1313881544.08239" 
    capture_lex $P1270
    .const 'Sub' $P1263 = "44_1313881544.08239" 
    capture_lex $P1263
.annotate 'line', 715
    new $P114, "Undef"
    set $P1254, $P114
    .lex "$node", $P1254
.annotate 'line', 716
    new $P115, "Undef"
    set $P1255, $P115
    .lex "$label", $P1255
.annotate 'line', 717
    new $P116, "Undef"
    set $P1256, $P116
    .lex "$ehreg", $P1256
.annotate 'line', 722
    new $P117, "Undef"
    set $P1257, $P117
    .lex "$type", $P1257
    .lex "$_", param_1258
.annotate 'line', 715
    find_lex $P118, "$_"
    store_lex "$node", $P118
.annotate 'line', 716
    get_hll_global $P118, ["POST"], "Label"
    find_lex $P119, "self"
    $P120 = $P119."unique"("control_")
    $P121 = $P118."new"($P120 :named("result"))
    store_lex "$label", $P121
.annotate 'line', 717
    find_lex $P118, "self"
    $P119 = $P118."uniquereg"("P")
    store_lex "$ehreg", $P119
.annotate 'line', 719
    find_lex $P118, "$ops"
    find_lex $P119, "$ehreg"
    $P118."push_pirop"("new", $P119, "'ExceptionHandler'")
.annotate 'line', 720
    find_lex $P118, "$ops"
    find_lex $P119, "$ehreg"
    find_lex $P120, "$label"
    $P118."push_pirop"("set_label", $P119, $P120)
.annotate 'line', 722
    find_lex $P118, "$node"
    $P119 = $P118."handle_types"()
    store_lex "$type", $P119
.annotate 'line', 723
    find_lex $P119, "$type"
    if $P119, if_1260
    set $P118, $P119
    goto if_1260_end
  if_1260:
    find_lex $P120, "$type"
    get_global $P1261, "%controltypes"
    unless_null $P1261, vivify_267
    $P1261 = root_new ['parrot';'Hash']
  vivify_267:
    set $P121, $P1261[$P120]
    unless_null $P121, vivify_268
    new $P121, "Undef"
  vivify_268:
    store_lex "$type", $P121
    set $P118, $P121
  if_1260_end:
    unless $P118, if_1259_end
    .const 'Sub' $P1263 = "44_1313881544.08239" 
    capture_lex $P1263
    $P1263()
  if_1259_end:
.annotate 'line', 729
    find_lex $P118, "$node"
    $P119 = $P118."handle_types_except"()
    store_lex "$type", $P119
.annotate 'line', 730
    find_lex $P119, "$type"
    if $P119, if_1267
    set $P118, $P119
    goto if_1267_end
  if_1267:
    find_lex $P120, "$type"
    get_global $P1268, "%controltypes"
    unless_null $P1268, vivify_271
    $P1268 = root_new ['parrot';'Hash']
  vivify_271:
    set $P121, $P1268[$P120]
    unless_null $P121, vivify_272
    new $P121, "Undef"
  vivify_272:
    store_lex "$type", $P121
    set $P118, $P121
  if_1267_end:
    unless $P118, if_1266_end
    .const 'Sub' $P1270 = "45_1313881544.08239" 
    capture_lex $P1270
    $P1270()
  if_1266_end:
.annotate 'line', 737
    find_lex $P118, "$ops"
    find_lex $P119, "$ehreg"
    $P118."push_pirop"("push_eh", $P119)
.annotate 'line', 740
    find_lex $P118, "$pops"
    $P118."push_pirop"("pop_eh")
.annotate 'line', 743
    find_lex $P118, "$tail"
    find_lex $P119, "$label"
    $P118."push"($P119)
.annotate 'line', 744
    find_lex $P118, "$tail"
    find_lex $P119, "self"
    find_lex $P120, "$node"
    find_lex $P121, "$rtype"
    $P122 = $P119."as_post"($P120, $P121 :named("rtype"))
    $P123 = $P118."push"($P122)
.annotate 'line', 714
    .return ($P123)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1262"  :anon :subid("44_1313881544.08239") :outer("43_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 724
    $P1265 = root_new ['parrot';'ResizablePMCArray']
    set $P1264, $P1265
    .lex "@types", $P1264
    find_lex $P122, "$type"
    set $S101, $P122
    split $P123, ",", $S101
    store_lex "@types", $P123
.annotate 'line', 725
    find_lex $P122, "$ops"
    find_lex $P123, "$ehreg"
    find_lex $P124, "@types"
    $P122."push_pirop"("callmethod", "\"handle_types\"", $P123, $P124 :flat)
.annotate 'line', 726
    find_dynamic_lex $P122, "$*SUB"
    unless_null $P122, vivify_269
    get_hll_global $P122, "$SUB"
    unless_null $P122, vivify_270
    die "Contextual $*SUB not found"
  vivify_270:
  vivify_269:
    $P123 = $P122."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 723
    .return ($P123)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1269"  :anon :subid("45_1313881544.08239") :outer("43_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 731
    $P1272 = root_new ['parrot';'ResizablePMCArray']
    set $P1271, $P1272
    .lex "@types", $P1271
    find_lex $P122, "$type"
    set $S101, $P122
    split $P123, ",", $S101
    store_lex "@types", $P123
.annotate 'line', 732
    find_lex $P122, "$ops"
    find_lex $P123, "$ehreg"
    find_lex $P124, "@types"
    $P122."push_pirop"("callmethod", "\"handle_types_except\"", $P123, $P124 :flat)
.annotate 'line', 734
    find_dynamic_lex $P122, "$*SUB"
    unless_null $P122, vivify_273
    get_hll_global $P122, "$SUB"
    unless_null $P122, vivify_274
    die "Contextual $*SUB not found"
  vivify_274:
  vivify_273:
    $P123 = $P122."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 730
    .return ($P123)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("46_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["PAST";"Block"])
    .param pmc param_1277
    .param pmc param_1278 :slurpy :named
.annotate 'file', ''
.annotate 'line', 762
    .const 'Sub' $P1302 = "47_1313881544.08239" 
    capture_lex $P1302
    new $P1276, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1276, control_1275
    push_eh $P1276
    .lex "self", self
    .lex "$node", param_1277
    .lex "%options", param_1278
.annotate 'line', 766
    new $P106, "Undef"
    set $P1279, $P106
    .lex "$name", $P1279
.annotate 'line', 767
    new $P107, "Undef"
    set $P1280, $P107
    .lex "$pirflags", $P1280
.annotate 'line', 768
    new $P108, "Undef"
    set $P1281, $P108
    .lex "$blocktype", $P1281
.annotate 'line', 769
    new $P109, "Undef"
    set $P1282, $P109
    .lex "$nsentry", $P1282
.annotate 'line', 770
    new $P110, "Undef"
    set $P1283, $P110
    .lex "$subid", $P1283
.annotate 'line', 771
    new $P111, "Undef"
    set $P1284, $P111
    .lex "$ns", $P1284
.annotate 'line', 772
    new $P112, "Undef"
    set $P1285, $P112
    .lex "$hll", $P1285
.annotate 'line', 773
    new $P113, "Undef"
    set $P1286, $P113
    .lex "$multi", $P1286
.annotate 'line', 774
    new $P114, "Undef"
    set $P1287, $P114
    .lex "$loadlibs", $P1287
.annotate 'line', 799
    new $P115, "Undef"
    set $P1288, $P115
    .lex "$bpost", $P1288
.annotate 'line', 807
    new $P116, "Undef"
    set $P1289, $P116
    .lex "$blockreg", $P1289
.annotate 'line', 808
    new $P117, "Undef"
    set $P1290, $P117
    .lex "$blockref", $P1290
.annotate 'line', 813
    new $P118, "Undef"
    set $P1291, $P118
    .lex "$outerpost", $P1291
.annotate 'line', 764
    find_dynamic_lex $P119, "@*BLOCKPAST"
    unless_null $P119, vivify_275
    get_hll_global $P119, "@BLOCKPAST"
    unless_null $P119, vivify_276
    die "Contextual @*BLOCKPAST not found"
  vivify_276:
  vivify_275:
    find_lex $P120, "$node"
    unshift $P119, $P120
.annotate 'line', 766
    find_lex $P119, "$node"
    $P120 = $P119."name"()
    store_lex "$name", $P120
.annotate 'line', 767
    find_lex $P119, "$node"
    $P120 = $P119."pirflags"()
    store_lex "$pirflags", $P120
.annotate 'line', 768
    find_lex $P119, "$node"
    $P120 = $P119."blocktype"()
    store_lex "$blocktype", $P120
.annotate 'line', 769
    find_lex $P119, "$node"
    $P120 = $P119."nsentry"()
    store_lex "$nsentry", $P120
.annotate 'line', 770
    find_lex $P119, "$node"
    $P120 = $P119."subid"()
    store_lex "$subid", $P120
.annotate 'line', 771
    find_lex $P119, "$node"
    $P120 = $P119."namespace"()
    store_lex "$ns", $P120
.annotate 'line', 772
    find_lex $P119, "$node"
    $P120 = $P119."hll"()
    store_lex "$hll", $P120
.annotate 'line', 773
    find_lex $P119, "$node"
    $P120 = $P119."multi"()
    store_lex "$multi", $P120
.annotate 'line', 774
    find_lex $P119, "$node"
    $P120 = $P119."loadlibs"()
    store_lex "$loadlibs", $P120
.annotate 'line', 777
    find_lex $P119, "$name"
    defined $I101, $P119
    if $I101, unless_1292_end
    new $P120, "String"
    assign $P120, ""
    store_lex "$name", $P120
  unless_1292_end:
.annotate 'line', 778
    find_lex $P119, "$pirflags"
    defined $I101, $P119
    if $I101, unless_1293_end
    new $P120, "String"
    assign $P120, ""
    store_lex "$pirflags", $P120
  unless_1293_end:
.annotate 'line', 779
    find_lex $P119, "$blocktype"
    defined $I101, $P119
    if $I101, unless_1294_end
    new $P120, "String"
    assign $P120, ""
    store_lex "$blocktype", $P120
  unless_1294_end:
.annotate 'line', 782
    find_lex $P119, "$nsentry"
    defined $I101, $P119
    unless $I101, if_1295_end
.annotate 'line', 783
    find_lex $P120, "$nsentry"
    if $P120, if_1296
.annotate 'line', 788
    find_lex $P121, "$pirflags"
    concat $P122, $P121, " :anon"
    store_lex "$pirflags", $P122
.annotate 'line', 787
    goto if_1296_end
  if_1296:
.annotate 'line', 785
    find_lex $P121, "$pirflags"
    concat $P122, $P121, " :nsentry("
    find_lex $P123, "self"
    find_lex $P124, "$nsentry"
    $S101 = $P123."escape"($P124)
    concat $P125, $P122, $S101
    concat $P126, $P125, ")"
    store_lex "$pirflags", $P126
  if_1296_end:
  if_1295_end:
.annotate 'line', 793
    find_lex $P119, "$name"
    if $P119, unless_1297_end
.annotate 'line', 794
    find_lex $P120, "self"
    $P121 = $P120."unique"("_block")
    store_lex "$name", $P121
.annotate 'line', 795
    find_lex $P121, "$ns"
    unless $P121, unless_1299
    set $P120, $P121
    goto unless_1299_end
  unless_1299:
    find_lex $P122, "$nsentry"
    set $P120, $P122
  unless_1299_end:
    if $P120, unless_1298_end
    find_lex $P123, "$pirflags"
    concat $P124, $P123, " :anon"
    store_lex "$pirflags", $P124
  unless_1298_end:
  unless_1297_end:
.annotate 'line', 799
    get_hll_global $P119, ["POST"], "Sub"
    find_lex $P120, "$node"
    find_lex $P121, "$name"
    find_lex $P122, "$blocktype"
    find_lex $P123, "$ns"
    find_lex $P124, "$hll"
    find_lex $P125, "$subid"
    find_lex $P126, "$multi"
    find_lex $P127, "$loadlibs"
    $P128 = $P119."new"($P120 :named("node"), $P121 :named("name"), $P122 :named("blocktype"), $P123 :named("namespace"), $P124 :named("hll"), $P125 :named("subid"), $P126 :named("multi"), $P127 :named("loadlibs"))
    store_lex "$bpost", $P128
.annotate 'line', 804
    find_lex $P119, "$pirflags"
    unless $P119, if_1300_end
    find_lex $P120, "$bpost"
    find_lex $P121, "$pirflags"
    $P120."pirflags"($P121)
  if_1300_end:
.annotate 'line', 807
    find_lex $P119, "self"
    $P120 = $P119."uniquereg"("P")
    store_lex "$blockreg", $P120
.annotate 'line', 808
    new $P119, 'String'
    set $P119, ".const 'Sub' "
    find_lex $P120, "$blockreg"
    concat $P121, $P119, $P120
    concat $P122, $P121, " = "
    find_lex $P123, "self"
    find_lex $P124, "$bpost"
    $P125 = $P124."subid"()
    $S101 = $P123."escape"($P125)
    concat $P126, $P122, $S101
    store_lex "$blockref", $P126
.annotate 'line', 813
    find_dynamic_lex $P119, "$*SUB"
    unless_null $P119, vivify_277
    get_hll_global $P119, "$SUB"
    unless_null $P119, vivify_278
    die "Contextual $*SUB not found"
  vivify_278:
  vivify_277:
    store_lex "$outerpost", $P119
.annotate 'line', 814
    .const 'Sub' $P1302 = "47_1313881544.08239" 
    capture_lex $P1302
    $P1302()
.annotate 'line', 966
    find_dynamic_lex $P119, "@*BLOCKPAST"
    unless_null $P119, vivify_301
    get_hll_global $P119, "@BLOCKPAST"
    unless_null $P119, vivify_302
    die "Contextual @*BLOCKPAST not found"
  vivify_302:
  vivify_301:
    shift $P120, $P119
.annotate 'line', 762
    find_lex $P119, "$bpost"
    .return ($P119)
  control_1275:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P120, exception, "payload"
    .return ($P120)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1301"  :anon :subid("47_1313881544.08239") :outer("46_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 814
    .const 'Sub' $P1375 = "55_1313881544.08239" 
    capture_lex $P1375
    .const 'Sub' $P1364 = "54_1313881544.08239" 
    capture_lex $P1364
    .const 'Sub' $P1358 = "53_1313881544.08239" 
    capture_lex $P1358
    .const 'Sub' $P1332 = "50_1313881544.08239" 
    capture_lex $P1332
    .const 'Sub' $P1323 = "49_1313881544.08239" 
    capture_lex $P1323
    .const 'Sub' $P1316 = "48_1313881544.08239" 
    capture_lex $P1316
.annotate 'line', 815
    new $P119, "Undef"
    set $P1303, $P119
    .lex "$*SUB", $P1303
.annotate 'line', 817
    new $P120, "Undef"
    set $P1304, $P120
    .lex "$islexical", $P1304
.annotate 'line', 831
    $P1306 = root_new ['parrot';'Hash']
    set $P1305, $P1306
    .lex "%outersym", $P1305
.annotate 'line', 832
    $P1308 = root_new ['parrot';'Hash']
    set $P1307, $P1308
    .lex "%symtable", $P1307
.annotate 'line', 850
    $P1310 = root_new ['parrot';'Hash']
    set $P1309, $P1310
    .lex "%outerregs", $P1309
.annotate 'line', 852
    new $P121, "Undef"
    set $P1311, $P121
    .lex "$compiler", $P1311
.annotate 'line', 936
    new $P122, "Undef"
    set $P1312, $P122
    .lex "$rtype", $P1312
.annotate 'line', 815
    find_lex $P123, "$bpost"
    store_lex "$*SUB", $P123
.annotate 'line', 817
    find_lex $P123, "$node"
    $P124 = $P123."lexical"()
    store_lex "$islexical", $P124
.annotate 'line', 818
    find_lex $P123, "$islexical"
    unless $P123, if_1313_end
.annotate 'line', 819
    find_lex $P124, "$bpost"
    find_lex $P125, "$outerpost"
    $P124."outer"($P125)
.annotate 'line', 822
    find_lex $P124, "$outerpost"
    defined $I101, $P124
    unless $I101, if_1314_end
    .const 'Sub' $P1316 = "48_1313881544.08239" 
    capture_lex $P1316
    $P1316()
  if_1314_end:
  if_1313_end:
.annotate 'line', 831
    find_lex $P123, "self"
    getattribute $P1318, $P123, "%!symtable"
    unless_null $P1318, vivify_279
    $P1318 = root_new ['parrot';'Hash']
  vivify_279:
    store_lex "%outersym", $P1318
.annotate 'line', 832
    find_lex $P123, "%outersym"
    store_lex "%symtable", $P123
.annotate 'line', 834
    find_lex $P123, "$node"
    $P124 = $P123."symtable"()
    unless $P124, if_1319_end
.annotate 'line', 837
    find_lex $P125, "$node"
    $P126 = $P125."symtable"()
    store_lex "%symtable", $P126
.annotate 'line', 838
    find_lex $P1321, "%symtable"
    unless_null $P1321, vivify_280
    $P1321 = root_new ['parrot';'Hash']
  vivify_280:
    set $P125, $P1321[""]
    unless_null $P125, vivify_281
    new $P125, "Undef"
  vivify_281:
    defined $I101, $P125
    if $I101, unless_1320_end
.annotate 'line', 840
    find_lex $P126, "%symtable"
    $P127 = "shallow_clone_hash"($P126)
    store_lex "%symtable", $P127
.annotate 'line', 841
    find_lex $P127, "%outersym"
    defined $I102, $P127
    unless $I102, for_undef_282
    iter $P126, $P127
    new $P129, 'ExceptionHandler'
    set_label $P129, loop1328_handler
    $P129."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P129
  loop1328_test:
    unless $P126, loop1328_done
    shift $P128, $P126
  loop1328_redo:
    .const 'Sub' $P1323 = "49_1313881544.08239" 
    capture_lex $P1323
    $P1323($P128)
  loop1328_next:
    goto loop1328_test
  loop1328_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P131, exception, 'type'
    eq $P131, .CONTROL_LOOP_NEXT, loop1328_next
    eq $P131, .CONTROL_LOOP_REDO, loop1328_redo
  loop1328_done:
    pop_eh 
  for_undef_282:
  unless_1320_end:
  if_1319_end:
.annotate 'line', 847
    find_lex $P123, "%symtable"
    find_lex $P124, "self"
    setattribute $P124, "%!symtable", $P123
.annotate 'line', 850
    find_dynamic_lex $P123, "%*TEMPREGS"
    unless_null $P123, vivify_286
    get_hll_global $P123, "%TEMPREGS"
    unless_null $P123, vivify_287
    die "Contextual %*TEMPREGS not found"
  vivify_287:
  vivify_286:
    store_lex "%outerregs", $P123
.annotate 'line', 852
    find_lex $P123, "$node"
    $P124 = $P123."compiler"()
    store_lex "$compiler", $P124
.annotate 'line', 853
    find_lex $P123, "$compiler"
    if $P123, if_1329
.annotate 'line', 860
    .const 'Sub' $P1332 = "50_1313881544.08239" 
    capture_lex $P1332
    $P1332()
    goto if_1329_end
  if_1329:
.annotate 'line', 856
    find_lex $P124, "$bpost"
    find_lex $P125, "$compiler"
    $P124."compiler"($P125)
.annotate 'line', 857
    find_lex $P124, "$bpost"
    find_lex $P125, "$node"
    $P126 = $P125."compiler_args"()
    $P124."compiler_args"($P126)
.annotate 'line', 858
    find_lex $P124, "$bpost"
    find_lex $P1330, "$node"
    unless_null $P1330, vivify_294
    $P1330 = root_new ['parrot';'ResizablePMCArray']
  vivify_294:
    set $P125, $P1330[0]
    unless_null $P125, vivify_295
    new $P125, "Undef"
  vivify_295:
    $P124."push"($P125)
  if_1329_end:
.annotate 'line', 923
    find_lex $P123, "$node"
    exists $I101, $P123["loadinit"]
    unless $I101, if_1356_end
    .const 'Sub' $P1358 = "53_1313881544.08239" 
    capture_lex $P1358
    $P1358()
  if_1356_end:
.annotate 'line', 933
    find_lex $P123, "%outersym"
    find_lex $P124, "self"
    setattribute $P124, "%!symtable", $P123
.annotate 'line', 936
    find_lex $P1361, "%options"
    unless_null $P1361, vivify_297
    $P1361 = root_new ['parrot';'Hash']
  vivify_297:
    set $P123, $P1361["rtype"]
    unless_null $P123, vivify_298
    new $P123, "Undef"
  vivify_298:
    store_lex "$rtype", $P123
.annotate 'line', 938
    find_lex $P124, "$blocktype"
    set $S101, $P124
    iseq $I101, $S101, "immediate"
    if $I101, if_1362
.annotate 'line', 947
    find_lex $P128, "$rtype"
    set $S102, $P128
    isne $I102, $S102, "v"
    if $I102, if_1371
    new $P127, 'Integer'
    set $P127, $I102
    goto if_1371_end
  if_1371:
.annotate 'line', 948
    get_hll_global $P129, ["POST"], "Ops"
    find_lex $P131, "$bpost"
    find_lex $P132, "$node"
    find_lex $P133, "$blockreg"
    $P134 = $P129."new"($P131, $P132 :named("node"), $P133 :named("result"))
    store_lex "$bpost", $P134
.annotate 'line', 949
    find_lex $P129, "$bpost"
    find_lex $P131, "$blockref"
    find_lex $P132, "$blockreg"
    $P129."push_pirop"($P131, $P132 :named("result"))
.annotate 'line', 950
    find_lex $P131, "$islexical"
    if $P131, if_1372
    set $P129, $P131
    goto if_1372_end
  if_1372:
.annotate 'line', 951
    find_lex $P133, "$node"
    $P134 = $P133."closure"()
    if $P134, if_1373
.annotate 'line', 959
    find_lex $P137, "$bpost"
    find_lex $P139, "$blockreg"
    $P140 = $P137."push_pirop"("capture_lex", $P139)
.annotate 'line', 958
    set $P132, $P140
.annotate 'line', 951
    goto if_1373_end
  if_1373:
    .const 'Sub' $P1375 = "55_1313881544.08239" 
    capture_lex $P1375
    $P136 = $P1375()
    set $P132, $P136
  if_1373_end:
.annotate 'line', 950
    set $P129, $P132
  if_1372_end:
.annotate 'line', 947
    set $P127, $P129
  if_1371_end:
    set $P123, $P127
.annotate 'line', 938
    goto if_1362_end
  if_1362:
    .const 'Sub' $P1364 = "54_1313881544.08239" 
    capture_lex $P1364
    $P126 = $P1364()
    set $P123, $P126
  if_1362_end:
.annotate 'line', 814
    .return ($P123)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1315"  :anon :subid("48_1313881544.08239") :outer("47_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 823
    new $P125, "Undef"
    set $P1317, $P125
    .lex "$cpost", $P1317
    get_hll_global $P126, ["POST"], "Ops"
    find_lex $P127, "$blockreg"
    $P128 = $P126."new"($P127 :named("result"))
    store_lex "$cpost", $P128
.annotate 'line', 824
    find_lex $P126, "$cpost"
    find_lex $P127, "$blockref"
    $P126."push_pirop"($P127)
.annotate 'line', 825
    find_lex $P126, "$cpost"
    find_lex $P127, "$blockreg"
    $P126."push_pirop"("capture_lex", $P127)
.annotate 'line', 826
    find_lex $P126, "$outerpost"
    find_lex $P127, "$cpost"
    $P128 = $P126."unshift"($P127)
.annotate 'line', 822
    .return ($P128)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1322"  :anon :subid("49_1313881544.08239") :outer("47_1313881544.08239")
    .param pmc param_1324
.annotate 'file', ''
.annotate 'line', 841
    .lex "$_", param_1324
.annotate 'line', 842
    find_lex $P130, "$_"
    find_lex $P129, "%symtable"
    exists $I103, $P129[$P130]
    unless $I103, if_1325_end
    die 0, .CONTROL_LOOP_NEXT
  if_1325_end:
.annotate 'line', 843
    find_lex $P129, "$_"
    find_lex $P1326, "%outersym"
    unless_null $P1326, vivify_283
    $P1326 = root_new ['parrot';'Hash']
  vivify_283:
    set $P130, $P1326[$P129]
    unless_null $P130, vivify_284
    new $P130, "Undef"
  vivify_284:
    find_lex $P131, "$_"
    find_lex $P1327, "%symtable"
    unless_null $P1327, vivify_285
    $P1327 = root_new ['parrot';'Hash']
    store_lex "%symtable", $P1327
  vivify_285:
    set $P1327[$P131], $P130
.annotate 'line', 841
    .return ($P130)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1331"  :anon :subid("50_1313881544.08239") :outer("47_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 860
    .const 'Sub' $P1353 = "52_1313881544.08239" 
    capture_lex $P1353
    .const 'Sub' $P1344 = "51_1313881544.08239" 
    capture_lex $P1344
.annotate 'line', 863
    $P1334 = root_new ['parrot';'Hash']
    set $P1333, $P1334
    .lex "%*TEMPREGS", $P1333
.annotate 'line', 872
    new $P124, "Undef"
    set $P1335, $P124
    .lex "$ctrlpast", $P1335
.annotate 'line', 873
    new $P125, "Undef"
    set $P1336, $P125
    .lex "$ctrllabel", $P1336
.annotate 'line', 886
    new $P126, "Undef"
    set $P1337, $P126
    .lex "$sig", $P1337
.annotate 'line', 888
    new $P127, "Undef"
    set $P1338, $P127
    .lex "$ops", $P1338
.annotate 'line', 890
    new $P128, "Undef"
    set $P1339, $P128
    .lex "$retval", $P1339
.annotate 'line', 892
    new $P129, "Undef"
    set $P1340, $P129
    .lex "$eh", $P1340
.annotate 'line', 860
    find_lex $P130, "%*TEMPREGS"
    unless_null $P130, vivify_288
    get_hll_global $P130, "%TEMPREGS"
    unless_null $P130, vivify_289
    die "Contextual %*TEMPREGS not found"
  vivify_289:
  vivify_288:
.annotate 'line', 864
    find_lex $P130, "$node"
    $P131 = $P130."tempregs"()
    if $P131, if_1341
.annotate 'line', 868
    find_lex $P132, "%outerregs"
    store_lex "%*TEMPREGS", $P132
.annotate 'line', 867
    goto if_1341_end
  if_1341:
.annotate 'line', 865
    find_lex $P132, "self"
    $P133 = $P132."tempreg_frame"()
    store_lex "%*TEMPREGS", $P133
  if_1341_end:
.annotate 'line', 872
    find_lex $P130, "$node"
    $P131 = $P130."control"()
    store_lex "$ctrlpast", $P131
.annotate 'line', 860
    find_lex $P130, "$ctrllabel"
.annotate 'line', 875
    find_lex $P130, "$ctrlpast"
    unless $P130, if_1342_end
    .const 'Sub' $P1344 = "51_1313881544.08239" 
    capture_lex $P1344
    $P1344()
  if_1342_end:
.annotate 'line', 886
    find_lex $P130, "$node"
    $P131 = $P130."list"()
    elements $I101, $P131
    repeat $S101, "v", $I101
    new $P132, 'String'
    set $P132, $S101
    concat $P133, $P132, "*"
    store_lex "$sig", $P133
.annotate 'line', 888
    find_lex $P130, "self"
    find_lex $P131, "$node"
    find_lex $P132, "$sig"
    $P133 = $P130."post_children"($P131, $P132 :named("signature"))
    store_lex "$ops", $P133
.annotate 'line', 890
    find_lex $P1346, "$ops"
    unless_null $P1346, vivify_290
    $P1346 = root_new ['parrot';'ResizablePMCArray']
  vivify_290:
    set $P130, $P1346[-1]
    unless_null $P130, vivify_291
    new $P130, "Undef"
  vivify_291:
    store_lex "$retval", $P130
.annotate 'line', 892
    find_lex $P130, "$node"
    $P131 = $P130."handlers"()
    store_lex "$eh", $P131
.annotate 'line', 893
    find_lex $P130, "$eh"
    unless $P130, if_1347_end
.annotate 'line', 894
    find_lex $P131, "self"
    find_lex $P132, "$ops"
    find_lex $P133, "$eh"
    find_lex $P1348, "%options"
    unless_null $P1348, vivify_292
    $P1348 = root_new ['parrot';'Hash']
  vivify_292:
    set $P134, $P1348["rtype"]
    unless_null $P134, vivify_293
    new $P134, "Undef"
  vivify_293:
    $P135 = $P131."wrap_handlers"($P132, $P133, $P134 :named("rtype"))
    store_lex "$ops", $P135
  if_1347_end:
.annotate 'line', 896
    find_lex $P130, "$bpost"
    find_lex $P131, "$ops"
    $P130."push"($P131)
.annotate 'line', 897
    find_lex $P130, "$ops"
    $P131 = $P130."list"()
    set $N101, $P131
    isgt $I101, $N101, 0.0
    unless $I101, if_1349_end
.annotate 'line', 899
    find_lex $P132, "$bpost"
    find_lex $P133, "$retval"
    $P132."push_pirop"("return", $P133)
  if_1349_end:
.annotate 'line', 902
    find_lex $P131, "$ctrlpast"
    if $P131, if_1350
    set $P130, $P131
    goto if_1350_end
  if_1350:
.annotate 'line', 903
    find_lex $P132, "$bpost"
    find_lex $P133, "$ctrllabel"
    $P132."push"($P133)
.annotate 'line', 904
    find_lex $P132, "$bpost"
    $P132."push_pirop"(".local pmc exception")
.annotate 'line', 905
    find_lex $P132, "$bpost"
    $P132."push_pirop"(".get_results (exception)")
.annotate 'line', 906
    find_lex $P133, "$ctrlpast"
    set $S101, $P133
    iseq $I101, $S101, "return_pir"
    if $I101, if_1351
.annotate 'line', 913
    find_lex $P138, "$ctrlpast"
    get_hll_global $P139, ["PAST"], "Node"
    $P140 = $P138."isa"($P139)
    if $P140, if_1355
.annotate 'line', 917
    find_lex $P141, "self"
    new $P142, 'String'
    set $P142, "Unrecognized control handler '"
    find_lex $P143, "$ctrlpast"
    concat $P144, $P142, $P143
    concat $P146, $P144, "'"
    $P147 = $P141."panic"($P146)
.annotate 'line', 916
    set $P136, $P147
.annotate 'line', 913
    goto if_1355_end
  if_1355:
.annotate 'line', 914
    find_lex $P141, "$bpost"
    find_lex $P142, "self"
    find_lex $P143, "$ctrlpast"
    $P144 = $P142."as_post"($P143, "*" :named("rtype"))
    $P145 = $P141."push"($P144)
.annotate 'line', 913
    set $P136, $P145
  if_1355_end:
    set $P132, $P136
.annotate 'line', 906
    goto if_1351_end
  if_1351:
    .const 'Sub' $P1353 = "52_1313881544.08239" 
    capture_lex $P1353
    $P135 = $P1353()
    set $P132, $P135
  if_1351_end:
.annotate 'line', 902
    set $P130, $P132
  if_1350_end:
.annotate 'line', 860
    .return ($P130)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1343"  :anon :subid("51_1313881544.08239") :outer("50_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 877
    new $P131, "Undef"
    set $P1345, $P131
    .lex "$reg", $P1345
.annotate 'line', 876
    get_hll_global $P132, ["POST"], "Label"
    find_lex $P133, "self"
    $P134 = $P133."unique"("control_")
    $P135 = $P132."new"($P134 :named("result"))
    store_lex "$ctrllabel", $P135
.annotate 'line', 877
    find_lex $P132, "self"
    $P133 = $P132."uniquereg"("P")
    store_lex "$reg", $P133
.annotate 'line', 878
    find_lex $P132, "$bpost"
    find_lex $P133, "$reg"
    $P132."push_pirop"("new", $P133, "['ExceptionHandler']", ".CONTROL_RETURN")
.annotate 'line', 880
    find_lex $P132, "$bpost"
    find_lex $P133, "$reg"
    find_lex $P134, "$ctrllabel"
    $P132."push_pirop"("set_label", $P133, $P134)
.annotate 'line', 881
    find_lex $P132, "$bpost"
    find_lex $P133, "$reg"
    $P132."push_pirop"("push_eh", $P133)
.annotate 'line', 882
    find_lex $P132, "$bpost"
    $P133 = $P132."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 875
    .return ($P133)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1352"  :anon :subid("52_1313881544.08239") :outer("50_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 908
    new $P134, "Undef"
    set $P1354, $P134
    .lex "$reg", $P1354
    find_lex $P135, "self"
    $P136 = $P135."tempreg"("P")
    store_lex "$reg", $P136
.annotate 'line', 909
    find_lex $P135, "$bpost"
    find_lex $P136, "$reg"
    $P135."push_pirop"("getattribute", $P136, "exception", "\"payload\"")
.annotate 'line', 911
    find_lex $P135, "$bpost"
    find_lex $P136, "$reg"
    $P137 = $P135."push_pirop"("return", $P136)
.annotate 'line', 906
    .return ($P137)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1357"  :anon :subid("53_1313881544.08239") :outer("47_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 924
    new $P124, "Undef"
    set $P1359, $P124
    .lex "$lisub", $P1359
    get_hll_global $P125, ["POST"], "Sub"
    find_lex $P126, "$bpost"
    $P127 = $P125."new"($P126 :named("outer"), ":load :init" :named("pirflags"))
    store_lex "$lisub", $P127
.annotate 'line', 925
    find_lex $P125, "$lisub"
    find_lex $P126, "$blockref"
    $P125."push_pirop"($P126)
.annotate 'line', 926
    find_lex $P125, "$lisub"
    $P125."push_pirop"(".local pmc", "block")
.annotate 'line', 927
    find_lex $P125, "$lisub"
    find_lex $P126, "$blockreg"
    $P125."push_pirop"("set", "block", $P126)
.annotate 'line', 928
    find_lex $P125, "$lisub"
    find_lex $P126, "self"
    find_lex $P127, "$node"
    $P128 = $P127."loadinit"()
    $P129 = $P126."as_post"($P128, "v" :named("rtype"))
    $P125."push"($P129)
.annotate 'line', 929
    find_lex $P125, "$lisub"
    find_lex $P1360, "$bpost"
    unless_null $P1360, vivify_296
    $P1360 = root_new ['parrot';'Hash']
    store_lex "$bpost", $P1360
  vivify_296:
    set $P1360["loadinit"], $P125
.annotate 'line', 923
    .return ($P125)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1374"  :anon :subid("55_1313881544.08239") :outer("47_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 954
    new $P135, "Undef"
    set $P1376, $P135
    .lex "$result", $P1376
    find_lex $P136, "self"
    $P137 = $P136."uniquereg"("P")
    store_lex "$result", $P137
.annotate 'line', 955
    find_lex $P136, "$bpost"
    find_lex $P137, "$result"
    find_lex $P138, "$blockreg"
    $P136."push_pirop"("newclosure", $P137, $P138)
.annotate 'line', 956
    find_lex $P136, "$bpost"
    find_lex $P137, "$result"
    $P138 = $P136."result"($P137)
.annotate 'line', 951
    .return ($P138)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1363"  :anon :subid("54_1313881544.08239") :outer("47_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 939
    $P1366 = root_new ['parrot';'ResizablePMCArray']
    set $P1365, $P1366
    .lex "@arglist", $P1365
.annotate 'line', 941
    new $P125, "Undef"
    set $P1367, $P125
    .lex "$result", $P1367
.annotate 'line', 939
    find_lex $P1368, "%options"
    unless_null $P1368, vivify_299
    $P1368 = root_new ['parrot';'Hash']
  vivify_299:
    set $P126, $P1368["arglist"]
    unless_null $P126, vivify_300
    new $P126, "Undef"
  vivify_300:
    store_lex "@arglist", $P126
.annotate 'line', 940
    find_lex $P126, "@arglist"
    defined $I102, $P126
    if $I102, unless_1369_end
    new $P127, "ResizablePMCArray"
    store_lex "@arglist", $P127
  unless_1369_end:
.annotate 'line', 941
    find_lex $P126, "self"
    find_lex $P127, "$rtype"
    $P128 = $P126."tempreg"($P127)
    store_lex "$result", $P128
.annotate 'line', 942
    get_hll_global $P126, ["POST"], "Ops"
    find_lex $P127, "$bpost"
    find_lex $P128, "$node"
    find_lex $P129, "$result"
    $P130 = $P126."new"($P127, $P128 :named("node"), $P129 :named("result"))
    store_lex "$bpost", $P130
.annotate 'line', 943
    find_lex $P126, "$bpost"
    find_lex $P127, "$blockref"
    $P126."push_pirop"($P127)
.annotate 'line', 944
    find_lex $P126, "$islexical"
    unless $P126, if_1370_end
    find_lex $P127, "$bpost"
    find_lex $P128, "$blockreg"
    $P127."push_pirop"("capture_lex", $P128)
  if_1370_end:
.annotate 'line', 945
    find_lex $P126, "$bpost"
    find_lex $P127, "$blockreg"
    find_lex $P128, "@arglist"
    find_lex $P129, "$result"
    $P130 = $P126."push_pirop"("call", $P127, $P128 :flat, $P129 :named("result"))
.annotate 'line', 938
    .return ($P130)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("56_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["PAST";"Op"])
    .param pmc param_1380
    .param pmc param_1381 :slurpy :named
.annotate 'file', ''
.annotate 'line', 987
    new $P1379, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1379, control_1378
    push_eh $P1379
    .lex "self", self
    .lex "$node", param_1380
    .lex "%options", param_1381
.annotate 'line', 989
    new $P106, "Undef"
    set $P1382, $P106
    .lex "$lvalue", $P1382
.annotate 'line', 990
    new $P107, "Undef"
    set $P1383, $P107
    .lex "$child", $P1383
.annotate 'line', 995
    new $P108, "Undef"
    set $P1384, $P108
    .lex "$pasttype", $P1384
.annotate 'line', 1000
    new $P109, "Undef"
    set $P1385, $P109
    .lex "$pirop", $P1385
.annotate 'line', 1005
    new $P110, "Undef"
    set $P1386, $P110
    .lex "$inline", $P1386
.annotate 'line', 989
    find_lex $P111, "$node"
    $P112 = $P111."lvalue"()
    store_lex "$lvalue", $P112
.annotate 'line', 990
    find_lex $P1387, "$node"
    unless_null $P1387, vivify_303
    $P1387 = root_new ['parrot';'ResizablePMCArray']
  vivify_303:
    set $P111, $P1387[0]
    unless_null $P111, vivify_304
    new $P111, "Undef"
  vivify_304:
    store_lex "$child", $P111
.annotate 'line', 991
    find_lex $P113, "$lvalue"
    if $P113, if_1390
    set $P112, $P113
    goto if_1390_end
  if_1390:
    find_lex $P114, "$child"
    defined $I101, $P114
    new $P112, 'Integer'
    set $P112, $I101
  if_1390_end:
    if $P112, if_1389
    set $P111, $P112
    goto if_1389_end
  if_1389:
    find_lex $P115, "$child"
    exists $I102, $P115["lvalue"]
    new $P116, 'Integer'
    set $P116, $I102
    isfalse $I103, $P116
    new $P111, 'Integer'
    set $P111, $I103
  if_1389_end:
    unless $P111, if_1388_end
.annotate 'line', 992
    find_lex $P117, "$child"
    find_lex $P118, "$lvalue"
    $P117."lvalue"($P118)
  if_1388_end:
.annotate 'line', 995
    find_lex $P111, "$node"
    $P112 = $P111."pasttype"()
    store_lex "$pasttype", $P112
.annotate 'line', 996
    find_lex $P111, "$pasttype"
    unless $P111, if_1391_end
.annotate 'line', 997
    new $P112, "Exception"
    set $P112['type'], .CONTROL_RETURN
    find_lex $P113, "self"
    find_lex $P114, "$node"
    find_lex $P115, "%options"
    find_lex $P116, "$pasttype"
    set $S101, $P116
    $P117 = $P113.$S101($P114, $P115 :flat)
    setattribute $P112, 'payload', $P117
    throw $P112
  if_1391_end:
.annotate 'line', 1000
    find_lex $P111, "$node"
    $P112 = $P111."pirop"()
    store_lex "$pirop", $P112
.annotate 'line', 1001
    find_lex $P111, "$pirop"
    unless $P111, if_1392_end
.annotate 'line', 1002
    new $P112, "Exception"
    set $P112['type'], .CONTROL_RETURN
    find_lex $P113, "self"
    find_lex $P114, "$node"
    find_lex $P115, "%options"
    $P116 = $P113."pirop"($P114, $P115 :flat)
    setattribute $P112, 'payload', $P116
    throw $P112
  if_1392_end:
.annotate 'line', 1005
    find_lex $P111, "$node"
    $P112 = $P111."inline"()
    store_lex "$inline", $P112
.annotate 'line', 1006
    find_lex $P111, "$inline"
    unless $P111, if_1393_end
.annotate 'line', 1007
    new $P112, "Exception"
    set $P112['type'], .CONTROL_RETURN
    find_lex $P113, "self"
    find_lex $P114, "$node"
    find_lex $P115, "%options"
    $P116 = $P113."inline"($P114, $P115 :flat)
    setattribute $P112, 'payload', $P116
    throw $P112
  if_1393_end:
.annotate 'line', 1010
    find_lex $P111, "self"
    find_lex $P112, "$node"
    find_lex $P113, "%options"
    $P114 = $P111."call"($P112, $P113 :flat)
.annotate 'line', 987
    .return ($P114)
  control_1378:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "pirop"  :subid("57_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["PAST";"Op"])
    .param pmc param_1397
    .param pmc param_1398 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1018
    new $P1396, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1396, control_1395
    push_eh $P1396
    .lex "self", self
    .lex "$node", param_1397
    .lex "%options", param_1398
.annotate 'line', 1019
    new $P106, "Undef"
    set $P1399, $P106
    .lex "$pirop", $P1399
.annotate 'line', 1020
    new $P107, "Undef"
    set $P1400, $P107
    .lex "$signature", $P1400
.annotate 'line', 1021
    new $P108, "Undef"
    set $P1401, $P108
    .lex "$I0", $P1401
.annotate 'line', 1037
    new $P109, "Undef"
    set $P1402, $P109
    .lex "$ops", $P1402
.annotate 'line', 1038
    $P1404 = root_new ['parrot';'ResizablePMCArray']
    set $P1403, $P1404
    .lex "@posargs", $P1403
.annotate 'line', 1048
    $P1406 = root_new ['parrot';'ResizablePMCArray']
    set $P1405, $P1406
    .lex "@arglist", $P1405
.annotate 'line', 1050
    new $P110, "Undef"
    set $P1407, $P110
    .lex "$S0", $P1407
.annotate 'line', 1061
    new $P111, "Undef"
    set $P1408, $P111
    .lex "$result", $P1408
.annotate 'line', 1019
    find_lex $P112, "$node"
    $P113 = $P112."pirop"()
    store_lex "$pirop", $P113
.annotate 'line', 1018
    find_lex $P112, "$signature"
    find_lex $P112, "$I0"
.annotate 'line', 1022
    find_lex $P112, "$pirop"
    set $S101, $P112
    index $I101, $S101, " "
    new $P113, 'Integer'
    set $P113, $I101
    store_lex "$I0", $P113
    set $N101, $P113
    isge $I102, $N101, 0.0
    if $I102, if_1409
.annotate 'line', 1027
    find_lex $P114, "$pirop"
    set $S102, $P114
    index $I103, $S102, "__"
    new $P115, 'Integer'
    set $P115, $I103
    store_lex "$I0", $P115
    set $N102, $P115
    isge $I104, $N102, 0.0
    if $I104, if_1410
.annotate 'line', 1033
    find_lex $P116, "$pirop"
    get_global $P1411, "%piropsig"
    unless_null $P1411, vivify_305
    $P1411 = root_new ['parrot';'Hash']
  vivify_305:
    set $P117, $P1411[$P116]
    unless_null $P117, vivify_306
    new $P117, "Undef"
  vivify_306:
    store_lex "$signature", $P117
.annotate 'line', 1034
    find_lex $P116, "$signature"
    if $P116, unless_1412_end
    new $P117, "String"
    assign $P117, "vP"
    store_lex "$signature", $P117
  unless_1412_end:
.annotate 'line', 1032
    goto if_1410_end
  if_1410:
.annotate 'line', 1029
    find_lex $P116, "$pirop"
    set $S103, $P116
    find_lex $P117, "$I0"
    add $P118, $P117, 2
    set $I105, $P118
    substr $S104, $S103, $I105
    new $P119, 'String'
    set $P119, $S104
    store_lex "$signature", $P119
.annotate 'line', 1030
    find_lex $P116, "$pirop"
    set $S103, $P116
    find_lex $P117, "$I0"
    set $I105, $P117
    substr $S104, $S103, 0, $I105
    new $P118, 'String'
    set $P118, $S104
    store_lex "$pirop", $P118
  if_1410_end:
.annotate 'line', 1027
    goto if_1409_end
  if_1409:
.annotate 'line', 1024
    find_lex $P114, "$pirop"
    set $S102, $P114
    find_lex $P115, "$I0"
    add $P116, $P115, 1
    set $I103, $P116
    substr $S103, $S102, $I103
    new $P117, 'String'
    set $P117, $S103
    store_lex "$signature", $P117
.annotate 'line', 1025
    find_lex $P114, "$pirop"
    set $S102, $P114
    find_lex $P115, "$I0"
    set $I103, $P115
    substr $S103, $S102, 0, $I103
    new $P116, 'String'
    set $P116, $S103
    store_lex "$pirop", $P116
  if_1409_end:
.annotate 'line', 1018
    find_lex $P112, "$ops"
    find_lex $P112, "@posargs"
.annotate 'line', 1040

        $P0 = find_lex '$node'
        $P1 = find_lex '$signature'
        ($P0, $P1) = self.'post_children'($P0, 'signature' => $P1)
        store_lex '$ops', $P0
        store_lex '@posargs', $P1
    
.annotate 'line', 1048
    find_lex $P112, "$ops"
    $P113 = $P112."list"()
    store_lex "@arglist", $P113
.annotate 'line', 1050
    find_lex $P112, "$signature"
    set $S101, $P112
    substr $S102, $S101, 0, 1
    new $P113, 'String'
    set $P113, $S102
    store_lex "$S0", $P113
.annotate 'line', 1051
    find_lex $P112, "$S0"
    set $S101, $P112
    iseq $I101, $S101, "v"
    unless $I101, if_1413_end
.annotate 'line', 1052
    find_lex $P113, "$ops"
    find_lex $P114, "$pirop"
    find_lex $P115, "@posargs"
    $P113."push_pirop"($P114, $P115 :flat)
.annotate 'line', 1053
    new $P113, "Exception"
    set $P113['type'], .CONTROL_RETURN
    find_lex $P114, "$ops"
    setattribute $P113, 'payload', $P114
    throw $P113
  if_1413_end:
.annotate 'line', 1055
    find_lex $P112, "$S0"
    set $S101, $P112
    index $I101, "0123456789", $S101
    new $P113, 'Integer'
    set $P113, $I101
    store_lex "$I0", $P113
.annotate 'line', 1056
    find_lex $P112, "$I0"
    set $N101, $P112
    isge $I101, $N101, 0.0
    unless $I101, if_1414_end
.annotate 'line', 1057
    find_lex $P113, "$ops"
    find_lex $P114, "$I0"
    set $I102, $P114
    find_lex $P1415, "@arglist"
    unless_null $P1415, vivify_307
    $P1415 = root_new ['parrot';'ResizablePMCArray']
  vivify_307:
    set $P115, $P1415[$I102]
    unless_null $P115, vivify_308
    new $P115, "Undef"
  vivify_308:
    $P113."result"($P115)
.annotate 'line', 1058
    find_lex $P113, "$ops"
    find_lex $P114, "$pirop"
    find_lex $P115, "@posargs"
    $P113."push_pirop"($P114, $P115 :flat)
.annotate 'line', 1059
    new $P113, "Exception"
    set $P113['type'], .CONTROL_RETURN
    find_lex $P114, "$ops"
    setattribute $P113, 'payload', $P114
    throw $P113
  if_1414_end:
.annotate 'line', 1061
    find_lex $P112, "self"
    find_lex $P113, "$S0"
    $P114 = $P112."tempreg"($P113)
    store_lex "$result", $P114
.annotate 'line', 1062
    find_lex $P112, "$ops"
    find_lex $P113, "$result"
    $P112."result"($P113)
.annotate 'line', 1063
    find_lex $P112, "$ops"
    find_lex $P113, "$pirop"
    find_lex $P114, "$result"
    find_lex $P115, "@posargs"
    $P112."push_pirop"($P113, $P114, $P115 :flat)
.annotate 'line', 1064
    new $P112, "Exception"
    set $P112['type'], .CONTROL_RETURN
    find_lex $P113, "$ops"
    setattribute $P112, 'payload', $P113
    throw $P112
.annotate 'line', 1018
    .return ()
  control_1395:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "call"  :subid("58_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["PAST";"Op"])
    .param pmc param_1419
    .param pmc param_1420 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1072
    .const 'Sub' $P1438 = "59_1313881544.08239" 
    capture_lex $P1438
    new $P1418, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1418, control_1417
    push_eh $P1418
    .lex "self", self
    .lex "$node", param_1419
    .lex "%options", param_1420
.annotate 'line', 1073
    new $P106, "Undef"
    set $P1421, $P106
    .lex "$pasttype", $P1421
.annotate 'line', 1076
    new $P107, "Undef"
    set $P1422, $P107
    .lex "$signature", $P1422
.annotate 'line', 1080
    new $P108, "Undef"
    set $P1423, $P108
    .lex "$name", $P1423
.annotate 'line', 1081
    new $P109, "Undef"
    set $P1424, $P109
    .lex "$ops", $P1424
.annotate 'line', 1082
    $P1426 = root_new ['parrot';'ResizablePMCArray']
    set $P1425, $P1426
    .lex "@posargs", $P1425
.annotate 'line', 1083
    $P1428 = root_new ['parrot';'Hash']
    set $P1427, $P1428
    .lex "%namedargs", $P1427
.annotate 'line', 1108
    new $P110, "Undef"
    set $P1429, $P110
    .lex "$rtype", $P1429
.annotate 'line', 1109
    new $P111, "Undef"
    set $P1430, $P111
    .lex "$result", $P1430
.annotate 'line', 1073
    find_lex $P112, "$node"
    $P113 = $P112."pasttype"()
    store_lex "$pasttype", $P113
.annotate 'line', 1074
    find_lex $P112, "$pasttype"
    if $P112, unless_1431_end
    new $P113, "String"
    assign $P113, "call"
    store_lex "$pasttype", $P113
  unless_1431_end:
.annotate 'line', 1076
    new $P112, "String"
    assign $P112, "v:"
    store_lex "$signature", $P112
.annotate 'line', 1078
    find_lex $P112, "$pasttype"
    set $S101, $P112
    iseq $I101, $S101, "callmethod"
    unless $I101, if_1432_end
    new $P113, "String"
    assign $P113, "vP:"
    store_lex "$signature", $P113
  if_1432_end:
.annotate 'line', 1080
    find_lex $P112, "$node"
    $P113 = $P112."name"()
    store_lex "$name", $P113
.annotate 'line', 1072
    find_lex $P112, "$ops"
    find_lex $P112, "@posargs"
    find_lex $P112, "%namedargs"
.annotate 'line', 1085
    find_lex $P112, "$name"
    if $P112, unless_1433_end
    find_lex $P113, "$signature"
    set $S101, $P113
    replace $S102, $S101, 1, 0, "P"
    new $P114, 'String'
    set $P114, $S102
    store_lex "$signature", $P114
  unless_1433_end:
.annotate 'line', 1087

        $P0 = find_lex '$node'
        $P1 = find_lex '$signature'
        ($P0, $P1, $P2) = self.'post_children'($P0, 'signature'=>$P1)
        store_lex '$ops', $P0
        store_lex '@posargs', $P1
        store_lex '%namedargs', $P2
    
.annotate 'line', 1095
    find_lex $P112, "$name"
    unless $P112, if_1434_end
.annotate 'line', 1096
    find_lex $P114, "$name"
    isa $I101, $P114, "P6object"
    if $I101, if_1436
    new $P113, 'Integer'
    set $P113, $I101
    goto if_1436_end
  if_1436:
    find_lex $P115, "$name"
    get_hll_global $P116, ["PAST"], "Node"
    $P117 = $P115."isa"($P116)
    set $P113, $P117
  if_1436_end:
    if $P113, if_1435
.annotate 'line', 1103
    find_lex $P120, "@posargs"
    find_lex $P121, "self"
    find_lex $P122, "$name"
    $P123 = $P121."escape"($P122)
    unshift $P120, $P123
.annotate 'line', 1102
    goto if_1435_end
  if_1435:
.annotate 'line', 1096
    .const 'Sub' $P1438 = "59_1313881544.08239" 
    capture_lex $P1438
    $P1438()
  if_1435_end:
  if_1434_end:
.annotate 'line', 1108
    find_lex $P1440, "%options"
    unless_null $P1440, vivify_309
    $P1440 = root_new ['parrot';'Hash']
  vivify_309:
    set $P112, $P1440["rtype"]
    unless_null $P112, vivify_310
    new $P112, "Undef"
  vivify_310:
    store_lex "$rtype", $P112
.annotate 'line', 1109
    find_lex $P112, "self"
    find_lex $P113, "$rtype"
    $P114 = $P112."tempreg"($P113)
    store_lex "$result", $P114
.annotate 'line', 1110
    find_lex $P112, "$ops"
    find_lex $P113, "$pasttype"
    find_lex $P114, "@posargs"
    find_lex $P115, "%namedargs"
    find_lex $P116, "$result"
    $P112."push_pirop"($P113, $P114 :flat, $P115 :flat, $P116 :named("result"))
.annotate 'line', 1111
    find_lex $P112, "$ops"
    find_lex $P113, "$result"
    $P112."result"($P113)
.annotate 'line', 1072
    find_lex $P112, "$ops"
    .return ($P112)
  control_1417:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P113, exception, "payload"
    .return ($P113)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1437"  :anon :subid("59_1313881544.08239") :outer("58_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 1097
    new $P118, "Undef"
    set $P1439, $P118
    .lex "$name_post", $P1439
    find_lex $P119, "self"
    find_lex $P120, "$name"
    $P121 = $P119."as_post"($P120, "s" :named("rtype"))
    store_lex "$name_post", $P121
.annotate 'line', 1098
    find_lex $P119, "self"
    find_lex $P120, "$name_post"
    $P121 = $P119."coerce"($P120, "s")
    store_lex "$name_post", $P121
.annotate 'line', 1099
    find_lex $P119, "$ops"
    find_lex $P120, "$name_post"
    $P119."push"($P120)
.annotate 'line', 1100
    find_lex $P119, "@posargs"
    find_lex $P120, "$name_post"
    unshift $P119, $P120
.annotate 'line', 1096
    .return ($P119)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "callmethod"  :subid("60_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["PAST";"Op"])
    .param pmc param_1444
    .param pmc param_1445 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1120
    new $P1443, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1443, control_1442
    push_eh $P1443
    .lex "self", self
    .lex "$node", param_1444
    .lex "%options", param_1445
.annotate 'line', 1121
    find_lex $P106, "self"
    find_lex $P107, "$node"
    find_lex $P108, "%options"
    $P109 = $P106."call"($P107, $P108 :flat)
.annotate 'line', 1120
    .return ($P109)
  control_1442:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "if"  :subid("61_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["PAST";"Op"])
    .param pmc param_1449
    .param pmc param_1450 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1130
    .const 'Sub' $P1491 = "64_1313881544.08239" 
    capture_lex $P1491
    .const 'Sub' $P1467 = "62_1313881544.08239" 
    capture_lex $P1467
    new $P1448, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1448, control_1447
    push_eh $P1448
    .lex "self", self
    .lex "$node", param_1449
    .lex "%options", param_1450
.annotate 'line', 1131
    new $P106, "Undef"
    set $P1451, $P106
    .lex "$ops", $P1451
.annotate 'line', 1133
    new $P107, "Undef"
    set $P1452, $P107
    .lex "$rtype", $P1452
.annotate 'line', 1134
    new $P108, "Undef"
    set $P1453, $P108
    .lex "$result", $P1453
.annotate 'line', 1137
    new $P109, "Undef"
    set $P1454, $P109
    .lex "$pasttype", $P1454
.annotate 'line', 1139
    new $P110, "Undef"
    set $P1455, $P110
    .lex "$exprpast", $P1455
.annotate 'line', 1140
    new $P111, "Undef"
    set $P1456, $P111
    .lex "$thenpast", $P1456
.annotate 'line', 1141
    new $P112, "Undef"
    set $P1457, $P112
    .lex "$elsepast", $P1457
.annotate 'line', 1143
    new $P113, "Undef"
    set $P1458, $P113
    .lex "$S0", $P1458
.annotate 'line', 1144
    new $P114, "Undef"
    set $P1459, $P114
    .lex "$thenlabel", $P1459
.annotate 'line', 1145
    new $P115, "Undef"
    set $P1460, $P115
    .lex "$endlabel", $P1460
.annotate 'line', 1147
    new $P116, "Undef"
    set $P1461, $P116
    .lex "$exprrtype", $P1461
.annotate 'line', 1149
    new $P117, "Undef"
    set $P1462, $P117
    .lex "$childrtype", $P1462
.annotate 'line', 1152
    new $P118, "Undef"
    set $P1463, $P118
    .lex "$exprpost", $P1463
.annotate 'line', 1154
    new $P119, "Undef"
    set $P1464, $P119
    .lex "$thenpost", $P1464
.annotate 'line', 1155
    new $P120, "Undef"
    set $P1465, $P120
    .lex "$elsepost", $P1465
.annotate 'line', 1177
    .const 'Sub' $P1467 = "62_1313881544.08239" 
    newclosure $P1480, $P1467
    set $P1466, $P1480
    .lex "make_childpost", $P1466
.annotate 'line', 1131
    get_hll_global $P125, ["POST"], "Ops"
    find_lex $P126, "$node"
    $P127 = $P125."new"($P126 :named("node"))
    store_lex "$ops", $P127
.annotate 'line', 1133
    find_lex $P1481, "%options"
    unless_null $P1481, vivify_312
    $P1481 = root_new ['parrot';'Hash']
  vivify_312:
    set $P125, $P1481["rtype"]
    unless_null $P125, vivify_313
    new $P125, "Undef"
  vivify_313:
    store_lex "$rtype", $P125
.annotate 'line', 1134
    find_lex $P125, "self"
    find_lex $P126, "$rtype"
    $P127 = $P125."tempreg"($P126)
    store_lex "$result", $P127
.annotate 'line', 1135
    find_lex $P125, "$ops"
    find_lex $P126, "$result"
    $P125."result"($P126)
.annotate 'line', 1137
    find_lex $P125, "$node"
    $P126 = $P125."pasttype"()
    store_lex "$pasttype", $P126
.annotate 'line', 1139
    find_lex $P1482, "$node"
    unless_null $P1482, vivify_314
    $P1482 = root_new ['parrot';'ResizablePMCArray']
  vivify_314:
    set $P125, $P1482[0]
    unless_null $P125, vivify_315
    new $P125, "Undef"
  vivify_315:
    store_lex "$exprpast", $P125
.annotate 'line', 1140
    find_lex $P1483, "$node"
    unless_null $P1483, vivify_316
    $P1483 = root_new ['parrot';'ResizablePMCArray']
  vivify_316:
    set $P125, $P1483[1]
    unless_null $P125, vivify_317
    new $P125, "Undef"
  vivify_317:
    store_lex "$thenpast", $P125
.annotate 'line', 1141
    find_lex $P1484, "$node"
    unless_null $P1484, vivify_318
    $P1484 = root_new ['parrot';'ResizablePMCArray']
  vivify_318:
    set $P125, $P1484[2]
    unless_null $P125, vivify_319
    new $P125, "Undef"
  vivify_319:
    store_lex "$elsepast", $P125
.annotate 'line', 1143
    find_lex $P125, "self"
    find_lex $P126, "$pasttype"
    concat $P127, $P126, "_"
    $P128 = $P125."unique"($P127)
    store_lex "$S0", $P128
.annotate 'line', 1144
    get_hll_global $P125, ["POST"], "Label"
    find_lex $P126, "$S0"
    $P127 = $P125."new"($P126 :named("result"))
    store_lex "$thenlabel", $P127
.annotate 'line', 1145
    get_hll_global $P125, ["POST"], "Label"
    find_lex $P126, "$S0"
    concat $P127, $P126, "_end"
    $P128 = $P125."new"($P127 :named("result"))
    store_lex "$endlabel", $P128
.annotate 'line', 1147
    new $P125, "String"
    assign $P125, "r"
    store_lex "$exprrtype", $P125
.annotate 'line', 1148
    find_lex $P125, "$rtype"
    set $S101, $P125
    iseq $I101, $S101, "v"
    unless $I101, if_1485_end
    new $P126, "String"
    assign $P126, "*"
    store_lex "$exprrtype", $P126
  if_1485_end:
.annotate 'line', 1149
    find_lex $P125, "$rtype"
    store_lex "$childrtype", $P125
.annotate 'line', 1150
    find_lex $P125, "$rtype"
    set $S101, $P125
    index $I101, "*:", $S101
    set $N101, $I101
    isge $I102, $N101, 0.0
    unless $I102, if_1486_end
    new $P126, "String"
    assign $P126, "P"
    store_lex "$childrtype", $P126
  if_1486_end:
.annotate 'line', 1152
    find_lex $P125, "self"
    find_lex $P126, "$exprpast"
    find_lex $P127, "$exprrtype"
    $P128 = $P125."as_post"($P126, $P127 :named("rtype"))
    store_lex "$exprpost", $P128
.annotate 'line', 1154
    find_lex $P125, "$thenpast"
    $P126 = "make_childpost"($P125)
    store_lex "$thenpost", $P126
.annotate 'line', 1155
    find_lex $P125, "$elsepast"
    $P126 = "make_childpost"($P125)
    store_lex "$elsepost", $P126
.annotate 'line', 1157
    find_lex $P125, "$elsepost"
    defined $I101, $P125
    if $I101, if_1487
.annotate 'line', 1167
    .const 'Sub' $P1491 = "64_1313881544.08239" 
    capture_lex $P1491
    $P1491()
    goto if_1487_end
  if_1487:
.annotate 'line', 1158
    find_lex $P126, "$ops"
    find_lex $P127, "$exprpost"
    $P126."push"($P127)
.annotate 'line', 1159
    find_lex $P126, "$ops"
    find_lex $P127, "$pasttype"
    find_lex $P128, "$exprpost"
    find_lex $P129, "$thenlabel"
    $P126."push_pirop"($P127, $P128, $P129)
.annotate 'line', 1160
    find_lex $P126, "$elsepost"
    defined $I102, $P126
    unless $I102, if_1488_end
    find_lex $P127, "$ops"
    find_lex $P128, "$elsepost"
    $P127."push"($P128)
  if_1488_end:
.annotate 'line', 1161
    find_lex $P126, "$ops"
    find_lex $P127, "$endlabel"
    $P126."push_pirop"("goto", $P127)
.annotate 'line', 1162
    find_lex $P126, "$ops"
    find_lex $P127, "$thenlabel"
    $P126."push"($P127)
.annotate 'line', 1163
    find_lex $P126, "$thenpost"
    defined $I102, $P126
    unless $I102, if_1489_end
    find_lex $P127, "$ops"
    find_lex $P128, "$thenpost"
    $P127."push"($P128)
  if_1489_end:
.annotate 'line', 1164
    find_lex $P126, "$ops"
    find_lex $P127, "$endlabel"
    $P126."push"($P127)
.annotate 'line', 1165
    new $P126, "Exception"
    set $P126['type'], .CONTROL_RETURN
    find_lex $P127, "$ops"
    setattribute $P126, 'payload', $P127
    throw $P126
  if_1487_end:
.annotate 'line', 1130
    find_lex $P125, "make_childpost"
    .return ($P125)
  control_1447:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P126, exception, "payload"
    .return ($P126)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "make_childpost"  :subid("62_1313881544.08239") :outer("61_1313881544.08239")
    .param pmc param_1470 :optional
    .param int has_param_1470 :opt_flag
.annotate 'file', ''
.annotate 'line', 1177
    .const 'Sub' $P1474 = "63_1313881544.08239" 
    capture_lex $P1474
    new $P1469, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1469, control_1468
    push_eh $P1469
    if has_param_1470, optparam_311
    new $P121, "Undef"
    set param_1470, $P121
  optparam_311:
    .lex "$childpast", param_1470
.annotate 'line', 1178
    new $P122, "Undef"
    set $P1471, $P122
    .lex "$childpost", $P1471
.annotate 'line', 1177
    find_lex $P123, "$childpost"
.annotate 'line', 1179
    find_lex $P123, "$childpast"
    defined $I101, $P123
    if $I101, if_1472
.annotate 'line', 1186
    find_lex $P124, "$rtype"
    set $S101, $P124
    iseq $I102, $S101, "v"
    unless $I102, if_1478_end
    new $P125, "Exception"
    set $P125['type'], .CONTROL_RETURN
    find_lex $P126, "$childpost"
    setattribute $P125, 'payload', $P126
    throw $P125
  if_1478_end:
.annotate 'line', 1187
    get_hll_global $P124, ["POST"], "Ops"
    find_lex $P125, "$exprpost"
    $P126 = $P124."new"($P125 :named("result"))
    store_lex "$childpost", $P126
.annotate 'line', 1185
    goto if_1472_end
  if_1472:
.annotate 'line', 1179
    .const 'Sub' $P1474 = "63_1313881544.08239" 
    capture_lex $P1474
    $P1474()
  if_1472_end:
.annotate 'line', 1189
    find_lex $P123, "$result"
    unless $P123, if_1479_end
    find_lex $P124, "self"
    find_lex $P125, "$childpost"
    find_lex $P126, "$result"
    $P127 = $P124."coerce"($P125, $P126)
    store_lex "$childpost", $P127
  if_1479_end:
.annotate 'line', 1177
    find_lex $P123, "$childpost"
    .return ($P123)
  control_1468:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P124, exception, "payload"
    .return ($P124)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1473"  :anon :subid("63_1313881544.08239") :outer("62_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 1180
    $P1476 = root_new ['parrot';'ResizablePMCArray']
    set $P1475, $P1476
    .lex "@arglist", $P1475
    new $P124, "ResizablePMCArray"
    store_lex "@arglist", $P124
.annotate 'line', 1181
    find_lex $P124, "$childpast"
    $N101 = $P124."arity"()
    isgt $I102, $N101, 0.0
    unless $I102, if_1477_end
    find_lex $P125, "@arglist"
    find_lex $P126, "$exprpost"
    push $P125, $P126
  if_1477_end:
.annotate 'line', 1182
    find_lex $P124, "self"
    find_lex $P125, "$childpast"
    find_lex $P126, "$childrtype"
    find_lex $P127, "@arglist"
    $P128 = $P124."as_post"($P125, $P126 :named("rtype"), $P127 :named("arglist"))
    store_lex "$childpost", $P128
.annotate 'line', 1179
    .return ($P128)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1490"  :anon :subid("64_1313881544.08239") :outer("61_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 1168
    new $P126, "Undef"
    set $P1492, $P126
    .lex "$S0", $P1492
    new $P127, "String"
    assign $P127, "if"
    store_lex "$S0", $P127
.annotate 'line', 1169
    find_lex $P127, "$pasttype"
    set $S101, $P127
    find_lex $P128, "$S0"
    set $S102, $P128
    iseq $I102, $S101, $S102
    unless $I102, if_1493_end
    new $P129, "String"
    assign $P129, "unless"
    store_lex "$S0", $P129
  if_1493_end:
.annotate 'line', 1170
    find_lex $P127, "$ops"
    find_lex $P128, "$exprpost"
    $P127."push"($P128)
.annotate 'line', 1171
    find_lex $P127, "$ops"
    find_lex $P128, "$S0"
    find_lex $P129, "$exprpost"
    find_lex $P130, "$endlabel"
    $P127."push_pirop"($P128, $P129, $P130)
.annotate 'line', 1172
    find_lex $P127, "$thenpost"
    defined $I102, $P127
    unless $I102, if_1494_end
    find_lex $P128, "$ops"
    find_lex $P129, "$thenpost"
    $P128."push"($P129)
  if_1494_end:
.annotate 'line', 1173
    find_lex $P127, "$ops"
    find_lex $P128, "$endlabel"
    $P127."push"($P128)
.annotate 'line', 1174
    new $P127, "Exception"
    set $P127['type'], .CONTROL_RETURN
    find_lex $P128, "$ops"
    setattribute $P127, 'payload', $P128
    throw $P127
.annotate 'line', 1167
    .return ()
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "unless"  :subid("65_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["PAST";"Op"])
    .param pmc param_1498
    .param pmc param_1499 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1194
    new $P1497, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1497, control_1496
    push_eh $P1497
    .lex "self", self
    .lex "$node", param_1498
    .lex "%options", param_1499
.annotate 'line', 1195
    find_lex $P106, "self"
    find_lex $P107, "$node"
    find_lex $P108, "%options"
    $P109 = $P106."if"($P107, $P108 :flat)
.annotate 'line', 1194
    .return ($P109)
  control_1496:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "loop_gen"  :subid("66_1313881544.08239") :method :outer("11_1313881544.08239")
    .param pmc param_1503 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1202
    new $P1502, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1502, control_1501
    push_eh $P1502
    .lex "self", self
    .lex "%options", param_1503
.annotate 'line', 1203
    new $P106, "Undef"
    set $P1504, $P106
    .lex "$loopname", $P1504
.annotate 'line', 1204
    new $P107, "Undef"
    set $P1505, $P107
    .lex "$testlabel", $P1505
.annotate 'line', 1205
    new $P108, "Undef"
    set $P1506, $P108
    .lex "$redolabel", $P1506
.annotate 'line', 1206
    new $P109, "Undef"
    set $P1507, $P109
    .lex "$nextlabel", $P1507
.annotate 'line', 1207
    new $P110, "Undef"
    set $P1508, $P110
    .lex "$donelabel", $P1508
.annotate 'line', 1208
    new $P111, "Undef"
    set $P1509, $P111
    .lex "$handlabel", $P1509
.annotate 'line', 1210
    new $P112, "Undef"
    set $P1510, $P112
    .lex "$testop", $P1510
.annotate 'line', 1211
    new $P113, "Undef"
    set $P1511, $P113
    .lex "$testpost", $P1511
.annotate 'line', 1212
    new $P114, "Undef"
    set $P1512, $P114
    .lex "$prepost", $P1512
.annotate 'line', 1213
    new $P115, "Undef"
    set $P1513, $P115
    .lex "$bodypost", $P1513
.annotate 'line', 1214
    new $P116, "Undef"
    set $P1514, $P116
    .lex "$nextpost", $P1514
.annotate 'line', 1215
    new $P117, "Undef"
    set $P1515, $P117
    .lex "$bodyfirst", $P1515
.annotate 'line', 1219
    new $P118, "Undef"
    set $P1516, $P118
    .lex "$ops", $P1516
.annotate 'line', 1223
    new $P119, "Undef"
    set $P1517, $P119
    .lex "$handreg", $P1517
.annotate 'line', 1245
    new $P120, "Undef"
    set $P1518, $P120
    .lex "$S0", $P1518
.annotate 'line', 1203
    find_lex $P121, "self"
    $P122 = $P121."unique"("loop")
    store_lex "$loopname", $P122
.annotate 'line', 1204
    get_hll_global $P121, ["POST"], "Label"
    find_lex $P122, "$loopname"
    concat $P123, $P122, "_test"
    $P124 = $P121."new"($P123 :named("result"))
    store_lex "$testlabel", $P124
.annotate 'line', 1205
    get_hll_global $P121, ["POST"], "Label"
    find_lex $P122, "$loopname"
    concat $P123, $P122, "_redo"
    $P124 = $P121."new"($P123 :named("result"))
    store_lex "$redolabel", $P124
.annotate 'line', 1206
    get_hll_global $P121, ["POST"], "Label"
    find_lex $P122, "$loopname"
    concat $P123, $P122, "_next"
    $P124 = $P121."new"($P123 :named("result"))
    store_lex "$nextlabel", $P124
.annotate 'line', 1207
    get_hll_global $P121, ["POST"], "Label"
    find_lex $P122, "$loopname"
    concat $P123, $P122, "_done"
    $P124 = $P121."new"($P123 :named("result"))
    store_lex "$donelabel", $P124
.annotate 'line', 1208
    get_hll_global $P121, ["POST"], "Label"
    find_lex $P122, "$loopname"
    concat $P123, $P122, "_handler"
    $P124 = $P121."new"($P123 :named("result"))
    store_lex "$handlabel", $P124
.annotate 'line', 1210
    find_lex $P1519, "%options"
    unless_null $P1519, vivify_320
    $P1519 = root_new ['parrot';'Hash']
  vivify_320:
    set $P121, $P1519["testop"]
    unless_null $P121, vivify_321
    new $P121, "Undef"
  vivify_321:
    store_lex "$testop", $P121
.annotate 'line', 1211
    find_lex $P1520, "%options"
    unless_null $P1520, vivify_322
    $P1520 = root_new ['parrot';'Hash']
  vivify_322:
    set $P121, $P1520["test"]
    unless_null $P121, vivify_323
    new $P121, "Undef"
  vivify_323:
    store_lex "$testpost", $P121
.annotate 'line', 1212
    find_lex $P1521, "%options"
    unless_null $P1521, vivify_324
    $P1521 = root_new ['parrot';'Hash']
  vivify_324:
    set $P121, $P1521["pre"]
    unless_null $P121, vivify_325
    new $P121, "Undef"
  vivify_325:
    store_lex "$prepost", $P121
.annotate 'line', 1213
    find_lex $P1522, "%options"
    unless_null $P1522, vivify_326
    $P1522 = root_new ['parrot';'Hash']
  vivify_326:
    set $P121, $P1522["body"]
    unless_null $P121, vivify_327
    new $P121, "Undef"
  vivify_327:
    store_lex "$bodypost", $P121
.annotate 'line', 1214
    find_lex $P1523, "%options"
    unless_null $P1523, vivify_328
    $P1523 = root_new ['parrot';'Hash']
  vivify_328:
    set $P121, $P1523["next"]
    unless_null $P121, vivify_329
    new $P121, "Undef"
  vivify_329:
    store_lex "$nextpost", $P121
.annotate 'line', 1215
    find_lex $P1524, "%options"
    unless_null $P1524, vivify_330
    $P1524 = root_new ['parrot';'Hash']
  vivify_330:
    set $P121, $P1524["bodyfirst"]
    unless_null $P121, vivify_331
    new $P121, "Undef"
  vivify_331:
    store_lex "$bodyfirst", $P121
.annotate 'line', 1217
    find_lex $P121, "$testop"
    if $P121, unless_1525_end
    new $P122, "String"
    assign $P122, "unless"
    store_lex "$testop", $P122
  unless_1525_end:
.annotate 'line', 1219
    get_hll_global $P121, ["POST"], "Ops"
    $P122 = $P121."new"()
    store_lex "$ops", $P122
.annotate 'line', 1221
    find_dynamic_lex $P121, "$*SUB"
    unless_null $P121, vivify_332
    get_hll_global $P121, "$SUB"
    unless_null $P121, vivify_333
    die "Contextual $*SUB not found"
  vivify_333:
  vivify_332:
    $P121."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 1223
    find_lex $P121, "self"
    $P122 = $P121."tempreg"("P")
    store_lex "$handreg", $P122
.annotate 'line', 1224
    find_lex $P121, "$ops"
    find_lex $P122, "$handreg"
    $P121."push_pirop"("new", $P122, "'ExceptionHandler'")
.annotate 'line', 1225
    find_lex $P121, "$ops"
    find_lex $P122, "$handreg"
    find_lex $P123, "$handlabel"
    $P121."push_pirop"("set_label", $P122, $P123)
.annotate 'line', 1226
    find_lex $P121, "$ops"
    find_lex $P122, "$handreg"
    $P121."push_pirop"("callmethod", "\"handle_types\"", $P122, ".CONTROL_LOOP_NEXT", ".CONTROL_LOOP_REDO", ".CONTROL_LOOP_LAST")
.annotate 'line', 1228
    find_lex $P121, "$ops"
    find_lex $P122, "$handreg"
    $P121."push_pirop"("push_eh", $P122)
.annotate 'line', 1230
    find_lex $P121, "$bodyfirst"
    unless $P121, if_1526_end
    find_lex $P122, "$ops"
    find_lex $P123, "$redolabel"
    $P122."push_pirop"("goto", $P123)
  if_1526_end:
.annotate 'line', 1231
    find_lex $P121, "$ops"
    find_lex $P122, "$testlabel"
    $P121."push"($P122)
.annotate 'line', 1232
    find_lex $P121, "$testpost"
    unless $P121, if_1527_end
.annotate 'line', 1233
    find_lex $P122, "$ops"
    find_lex $P123, "$testpost"
    $P122."push"($P123)
.annotate 'line', 1234
    find_lex $P122, "$ops"
    find_lex $P123, "$testop"
    find_lex $P124, "$testpost"
    find_lex $P125, "$donelabel"
    $P122."push_pirop"($P123, $P124, $P125)
  if_1527_end:
.annotate 'line', 1236
    find_lex $P121, "$prepost"
    unless $P121, if_1528_end
    find_lex $P122, "$ops"
    find_lex $P123, "$prepost"
    $P122."push"($P123)
  if_1528_end:
.annotate 'line', 1237
    find_lex $P121, "$ops"
    find_lex $P122, "$redolabel"
    $P121."push"($P122)
.annotate 'line', 1238
    find_lex $P121, "$bodypost"
    unless $P121, if_1529_end
    find_lex $P122, "$ops"
    find_lex $P123, "$bodypost"
    $P122."push"($P123)
  if_1529_end:
.annotate 'line', 1239
    find_lex $P121, "$ops"
    find_lex $P122, "$nextlabel"
    $P121."push"($P122)
.annotate 'line', 1240
    find_lex $P121, "$nextpost"
    unless $P121, if_1530_end
    find_lex $P122, "$ops"
    find_lex $P123, "$nextpost"
    $P122."push"($P123)
  if_1530_end:
.annotate 'line', 1241
    find_lex $P121, "$ops"
    find_lex $P122, "$testlabel"
    $P121."push_pirop"("goto", $P122)
.annotate 'line', 1242
    find_lex $P121, "$ops"
    find_lex $P122, "$handlabel"
    $P121."push"($P122)
.annotate 'line', 1243
    find_lex $P121, "$ops"
    $P121."push_pirop"(".local pmc exception")
.annotate 'line', 1244
    find_lex $P121, "$ops"
    $P121."push_pirop"(".get_results (exception)")
.annotate 'line', 1245
    find_lex $P121, "self"
    $P122 = $P121."tempreg"("P")
    store_lex "$S0", $P122
.annotate 'line', 1246
    find_lex $P121, "$ops"
    find_lex $P122, "$S0"
    $P121."push_pirop"("getattribute", $P122, "exception", "'type'")
.annotate 'line', 1247
    find_lex $P121, "$ops"
    find_lex $P122, "$S0"
    find_lex $P123, "$nextlabel"
    $P121."push_pirop"("eq", $P122, ".CONTROL_LOOP_NEXT", $P123)
.annotate 'line', 1248
    find_lex $P121, "$ops"
    find_lex $P122, "$S0"
    find_lex $P123, "$redolabel"
    $P121."push_pirop"("eq", $P122, ".CONTROL_LOOP_REDO", $P123)
.annotate 'line', 1249
    find_lex $P121, "$ops"
    find_lex $P122, "$donelabel"
    $P121."push"($P122)
.annotate 'line', 1250
    find_lex $P121, "$ops"
    $P121."push_pirop"("pop_eh")
.annotate 'line', 1202
    find_lex $P121, "$ops"
    .return ($P121)
  control_1501:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P122, exception, "payload"
    .return ($P122)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "while"  :subid("67_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["PAST";"Op"])
    .param pmc param_1534
    .param pmc param_1535 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1261
    new $P1533, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1533, control_1532
    push_eh $P1533
    .lex "self", self
    .lex "$node", param_1534
    .lex "%options", param_1535
.annotate 'line', 1262
    new $P106, "Undef"
    set $P1536, $P106
    .lex "$exprpast", $P1536
.annotate 'line', 1263
    new $P107, "Undef"
    set $P1537, $P107
    .lex "$bodypast", $P1537
.annotate 'line', 1264
    new $P108, "Undef"
    set $P1538, $P108
    .lex "$nextpast", $P1538
.annotate 'line', 1266
    new $P109, "Undef"
    set $P1539, $P109
    .lex "$exprpost", $P1539
.annotate 'line', 1268
    $P1541 = root_new ['parrot';'ResizablePMCArray']
    set $P1540, $P1541
    .lex "@arglist", $P1540
.annotate 'line', 1270
    new $P110, "Undef"
    set $P1542, $P110
    .lex "$bodypost", $P1542
.annotate 'line', 1272
    new $P111, "Undef"
    set $P1543, $P111
    .lex "$nextpost", $P1543
.annotate 'line', 1275
    new $P112, "Undef"
    set $P1544, $P112
    .lex "$testop", $P1544
.annotate 'line', 1276
    new $P113, "Undef"
    set $P1545, $P113
    .lex "$bodyfirst", $P1545
.annotate 'line', 1278
    new $P114, "Undef"
    set $P1546, $P114
    .lex "$ops", $P1546
.annotate 'line', 1262
    find_lex $P1547, "$node"
    unless_null $P1547, vivify_334
    $P1547 = root_new ['parrot';'ResizablePMCArray']
  vivify_334:
    set $P115, $P1547[0]
    unless_null $P115, vivify_335
    new $P115, "Undef"
  vivify_335:
    store_lex "$exprpast", $P115
.annotate 'line', 1263
    find_lex $P1548, "$node"
    unless_null $P1548, vivify_336
    $P1548 = root_new ['parrot';'ResizablePMCArray']
  vivify_336:
    set $P115, $P1548[1]
    unless_null $P115, vivify_337
    new $P115, "Undef"
  vivify_337:
    store_lex "$bodypast", $P115
.annotate 'line', 1264
    find_lex $P1549, "$node"
    unless_null $P1549, vivify_338
    $P1549 = root_new ['parrot';'ResizablePMCArray']
  vivify_338:
    set $P115, $P1549[2]
    unless_null $P115, vivify_339
    new $P115, "Undef"
  vivify_339:
    store_lex "$nextpast", $P115
.annotate 'line', 1266
    find_lex $P115, "self"
    find_lex $P116, "$exprpast"
    $P117 = $P115."as_post"($P116, "r" :named("rtype"))
    store_lex "$exprpost", $P117
.annotate 'line', 1268
    new $P115, "ResizablePMCArray"
    store_lex "@arglist", $P115
.annotate 'line', 1269
    find_lex $P115, "$bodypast"
    $N101 = $P115."arity"()
    islt $I101, $N101, 1.0
    if $I101, unless_1550_end
    find_lex $P116, "@arglist"
    find_lex $P117, "$exprpost"
    push $P116, $P117
  unless_1550_end:
.annotate 'line', 1270
    find_lex $P115, "self"
    find_lex $P116, "$bodypast"
    find_lex $P117, "@arglist"
    $P118 = $P115."as_post"($P116, "v" :named("rtype"), $P117 :named("arglist"))
    store_lex "$bodypost", $P118
.annotate 'line', 1272
    get_hll_global $P115, "null__P"
    store_lex "$nextpost", $P115
.annotate 'line', 1273
    find_lex $P115, "$nextpast"
    unless $P115, if_1551_end
    find_lex $P116, "self"
    find_lex $P117, "$nextpast"
    $P118 = $P116."as_post"($P117, "v" :named("rtype"))
    store_lex "$nextpost", $P118
  if_1551_end:
.annotate 'line', 1275
    find_lex $P1552, "%options"
    unless_null $P1552, vivify_340
    $P1552 = root_new ['parrot';'Hash']
  vivify_340:
    set $P115, $P1552["testop"]
    unless_null $P115, vivify_341
    new $P115, "Undef"
  vivify_341:
    store_lex "$testop", $P115
.annotate 'line', 1276
    find_lex $P1553, "%options"
    unless_null $P1553, vivify_342
    $P1553 = root_new ['parrot';'Hash']
  vivify_342:
    set $P115, $P1553["bodyfirst"]
    unless_null $P115, vivify_343
    new $P115, "Undef"
  vivify_343:
    store_lex "$bodyfirst", $P115
.annotate 'line', 1278
    find_lex $P115, "self"
    find_lex $P116, "$testop"
    find_lex $P117, "$exprpost"
    find_lex $P118, "$bodypost"
    find_lex $P119, "$bodyfirst"
    find_lex $P120, "$nextpost"
    $P121 = $P115."loop_gen"($P116 :named("testop"), $P117 :named("test"), $P118 :named("body"), $P119 :named("bodyfirst"), $P120 :named("next"))
    store_lex "$ops", $P121
.annotate 'line', 1280
    find_lex $P115, "$ops"
    find_lex $P116, "$exprpost"
    $P115."result"($P116)
.annotate 'line', 1281
    find_lex $P115, "$ops"
    find_lex $P116, "$node"
    $P115."node"($P116)
.annotate 'line', 1261
    find_lex $P115, "$ops"
    .return ($P115)
  control_1532:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P116, exception, "payload"
    .return ($P116)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "until"  :subid("68_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["PAST";"Op"])
    .param pmc param_1557
    .param pmc param_1558 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1285
    new $P1556, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1556, control_1555
    push_eh $P1556
    .lex "self", self
    .lex "$node", param_1557
    .lex "%options", param_1558
.annotate 'line', 1286
    find_lex $P106, "self"
    find_lex $P107, "$node"
    find_lex $P108, "%options"
    $P109 = $P106."while"($P107, $P108 :flat, "if" :named("testop"))
.annotate 'line', 1285
    .return ($P109)
  control_1555:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "repeat_while"  :subid("69_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["PAST";"Op"])
    .param pmc param_1562
    .param pmc param_1563 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1289
    new $P1561, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1561, control_1560
    push_eh $P1561
    .lex "self", self
    .lex "$node", param_1562
    .lex "%options", param_1563
.annotate 'line', 1290
    find_lex $P106, "self"
    find_lex $P107, "$node"
    find_lex $P108, "%options"
    $P109 = $P106."while"($P107, $P108 :flat, 1 :named("bodyfirst"))
.annotate 'line', 1289
    .return ($P109)
  control_1560:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "repeat_until"  :subid("70_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["PAST";"Op"])
    .param pmc param_1567
    .param pmc param_1568 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1293
    new $P1566, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1566, control_1565
    push_eh $P1566
    .lex "self", self
    .lex "$node", param_1567
    .lex "%options", param_1568
.annotate 'line', 1294
    find_lex $P106, "self"
    find_lex $P107, "$node"
    find_lex $P108, "%options"
    $P109 = $P106."while"($P107, $P108 :flat, "if" :named("testop"), 1 :named("bodyfirst"))
.annotate 'line', 1293
    .return ($P109)
  control_1565:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "for"  :subid("71_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["PAST";"Op"])
    .param pmc param_1572
    .param pmc param_1573 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1302
    .const 'Sub' $P1591 = "72_1313881544.08239" 
    capture_lex $P1591
    new $P1571, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1571, control_1570
    push_eh $P1571
    .lex "self", self
    .lex "$node", param_1572
    .lex "%options", param_1573
.annotate 'line', 1303
    new $P106, "Undef"
    set $P1574, $P106
    .lex "$ops", $P1574
.annotate 'line', 1304
    new $P107, "Undef"
    set $P1575, $P107
    .lex "$prepost", $P1575
.annotate 'line', 1305
    new $P108, "Undef"
    set $P1576, $P108
    .lex "$testpost", $P1576
.annotate 'line', 1307
    new $P109, "Undef"
    set $P1577, $P109
    .lex "$collpast", $P1577
.annotate 'line', 1308
    new $P110, "Undef"
    set $P1578, $P110
    .lex "$bodypast", $P1578
.annotate 'line', 1310
    new $P111, "Undef"
    set $P1579, $P111
    .lex "$collpost", $P1579
.annotate 'line', 1314
    new $P112, "Undef"
    set $P1580, $P112
    .lex "$undeflabel", $P1580
.annotate 'line', 1315
    new $P113, "Undef"
    set $P1581, $P113
    .lex "$S0", $P1581
.annotate 'line', 1323
    new $P114, "Undef"
    set $P1582, $P114
    .lex "$arity", $P1582
.annotate 'line', 1332
    $P1584 = root_new ['parrot';'ResizablePMCArray']
    set $P1583, $P1584
    .lex "@arglist", $P1583
.annotate 'line', 1342
    new $P115, "Undef"
    set $P1585, $P115
    .lex "$bodypost", $P1585
.annotate 'line', 1303
    get_hll_global $P116, ["POST"], "Ops"
    find_lex $P117, "$node"
    $P118 = $P116."new"($P117 :named("node"))
    store_lex "$ops", $P118
.annotate 'line', 1304
    get_hll_global $P116, ["POST"], "Ops"
    $P117 = $P116."new"()
    store_lex "$prepost", $P117
.annotate 'line', 1305
    get_hll_global $P116, ["POST"], "Ops"
    find_lex $P117, "self"
    $P118 = $P117."tempreg"("P")
    $P119 = $P116."new"($P118 :named("result"))
    store_lex "$testpost", $P119
.annotate 'line', 1307
    find_lex $P1586, "$node"
    unless_null $P1586, vivify_344
    $P1586 = root_new ['parrot';'ResizablePMCArray']
  vivify_344:
    set $P116, $P1586[0]
    unless_null $P116, vivify_345
    new $P116, "Undef"
  vivify_345:
    store_lex "$collpast", $P116
.annotate 'line', 1308
    find_lex $P1587, "$node"
    unless_null $P1587, vivify_346
    $P1587 = root_new ['parrot';'ResizablePMCArray']
  vivify_346:
    set $P116, $P1587[1]
    unless_null $P116, vivify_347
    new $P116, "Undef"
  vivify_347:
    store_lex "$bodypast", $P116
.annotate 'line', 1310
    find_lex $P116, "self"
    find_lex $P117, "$collpast"
    $P118 = $P116."as_post"($P117, "P" :named("rtype"))
    store_lex "$collpost", $P118
.annotate 'line', 1311
    find_lex $P116, "$ops"
    find_lex $P117, "$collpost"
    $P116."push"($P117)
.annotate 'line', 1314
    get_hll_global $P116, ["POST"], "Label"
    $P117 = $P116."new"("for_undef_" :named("name"))
    store_lex "$undeflabel", $P117
.annotate 'line', 1315
    find_lex $P116, "self"
    $P117 = $P116."tempreg"("I")
    store_lex "$S0", $P117
.annotate 'line', 1316
    find_lex $P116, "$ops"
    find_lex $P117, "$S0"
    find_lex $P118, "$collpost"
    $P116."push_pirop"("defined", $P117, $P118)
.annotate 'line', 1317
    find_lex $P116, "$ops"
    find_lex $P117, "$S0"
    find_lex $P118, "$undeflabel"
    $P116."push_pirop"("unless", $P117, $P118)
.annotate 'line', 1319
    find_lex $P116, "$ops"
    find_lex $P117, "$testpost"
    find_lex $P118, "$collpost"
    $P116."push_pirop"("iter", $P117, $P118)
.annotate 'line', 1323
    new $P116, "Integer"
    assign $P116, 1
    store_lex "$arity", $P116
.annotate 'line', 1324
    find_lex $P116, "$node"
    $P117 = $P116."arity"()
    defined $I101, $P117
    if $I101, if_1588
.annotate 'line', 1327
    find_lex $P118, "$bodypast"
    $P119 = $P118."arity"()
    defined $I102, $P119
    unless $I102, if_1589_end
.annotate 'line', 1328
    find_lex $P120, "$bodypast"
    $P121 = $P120."arity"()
    store_lex "$arity", $P121
  if_1589_end:
.annotate 'line', 1327
    goto if_1588_end
  if_1588:
.annotate 'line', 1325
    find_lex $P118, "$node"
    $P119 = $P118."arity"()
    store_lex "$arity", $P119
  if_1588_end:
.annotate 'line', 1332
    new $P116, "ResizablePMCArray"
    store_lex "@arglist", $P116
.annotate 'line', 1333
    new $P118, 'ExceptionHandler'
    set_label $P118, loop1595_handler
    $P118."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P118
    goto loop1595_redo
  loop1595_test:
    find_lex $P116, "$arity"
    set $N101, $P116
    isgt $I101, $N101, 0.0
    unless $I101, loop1595_done
  loop1595_redo:
    .const 'Sub' $P1591 = "72_1313881544.08239" 
    capture_lex $P1591
    $P1591()
  loop1595_next:
    goto loop1595_test
  loop1595_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P119, exception, 'type'
    eq $P119, .CONTROL_LOOP_NEXT, loop1595_next
    eq $P119, .CONTROL_LOOP_REDO, loop1595_redo
  loop1595_done:
    pop_eh 
.annotate 'line', 1342
    find_lex $P116, "self"
    find_lex $P117, "$bodypast"
    find_lex $P118, "@arglist"
    $P119 = $P116."as_post"($P117, "v" :named("rtype"), $P118 :named("arglist"))
    store_lex "$bodypost", $P119
.annotate 'line', 1345
    find_lex $P116, "$ops"
    find_lex $P117, "self"
    find_lex $P118, "$testpost"
    find_lex $P119, "$prepost"
    find_lex $P120, "$bodypost"
    $P121 = $P117."loop_gen"($P118 :named("test"), $P119 :named("pre"), $P120 :named("body"))
    $P116."push"($P121)
.annotate 'line', 1347
    find_lex $P116, "$ops"
    find_lex $P117, "$undeflabel"
    $P116."push"($P117)
.annotate 'line', 1348
    find_lex $P116, "$ops"
    find_lex $P117, "$testpost"
    $P116."result"($P117)
.annotate 'line', 1302
    find_lex $P116, "$ops"
    .return ($P116)
  control_1570:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P117, exception, "payload"
    .return ($P117)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1590"  :anon :subid("72_1313881544.08239") :outer("71_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 1334
    new $P117, "Undef"
    set $P1592, $P117
    .lex "$nextarg", $P1592
    find_lex $P118, "self"
    $P119 = $P118."tempreg"("P")
    store_lex "$nextarg", $P119
.annotate 'line', 1335
    find_lex $P118, "$prepost"
    find_lex $P119, "$nextarg"
    find_lex $P120, "$testpost"
    $P118."push_pirop"("shift", $P119, $P120)
.annotate 'line', 1336
    find_lex $P118, "$arity"
    set $N102, $P118
    islt $I102, $N102, 1.0
    unless $I102, if_1593_end
    die 0, .CONTROL_LOOP_LAST
  if_1593_end:
.annotate 'line', 1337
    find_lex $P118, "@arglist"
    find_lex $P119, "$nextarg"
    push $P118, $P119
.annotate 'line', 1333
    find_lex $P118, "$arity"
    clone $P1594, $P118
    dec $P118
    .return ($P1594)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "list"  :subid("73_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["PAST";"Op"])
    .param pmc param_1599
    .param pmc param_1600 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1358
    .const 'Sub' $P1608 = "74_1313881544.08239" 
    capture_lex $P1608
    new $P1598, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1598, control_1597
    push_eh $P1598
    .lex "self", self
    .lex "$node", param_1599
    .lex "%options", param_1600
.annotate 'line', 1360
    new $P106, "Undef"
    set $P1601, $P106
    .lex "$ops", $P1601
.annotate 'line', 1361
    $P1603 = root_new ['parrot';'ResizablePMCArray']
    set $P1602, $P1603
    .lex "@posargs", $P1602
.annotate 'line', 1369
    new $P107, "Undef"
    set $P1604, $P107
    .lex "$returns", $P1604
.annotate 'line', 1372
    new $P108, "Undef"
    set $P1605, $P108
    .lex "$listpost", $P1605
.annotate 'line', 1358
    find_lex $P109, "$ops"
    find_lex $P109, "@posargs"
.annotate 'line', 1362

        $P0 = find_lex '$node'
        ($P0, $P1) = self.'post_children'($P0, 'signature'=>'v*')
        store_lex '$ops', $P0
        store_lex '@posargs', $P1
    
.annotate 'line', 1369
    find_lex $P109, "$node"
    $P110 = $P109."returns"()
    store_lex "$returns", $P110
.annotate 'line', 1370
    find_lex $P109, "$returns"
    if $P109, unless_1606_end
    new $P110, "String"
    assign $P110, "ResizablePMCArray"
    store_lex "$returns", $P110
  unless_1606_end:
.annotate 'line', 1372
    find_lex $P109, "self"
    find_lex $P110, "$returns"
    $P111 = $P109."as_vivipost"($P110, "P" :named("rtype"))
    store_lex "$listpost", $P111
.annotate 'line', 1373
    find_lex $P109, "$ops"
    find_lex $P110, "$listpost"
    $P109."result"($P110)
.annotate 'line', 1374
    find_lex $P109, "$ops"
    find_lex $P110, "$listpost"
    $P109."push"($P110)
.annotate 'line', 1375
    find_lex $P110, "@posargs"
    defined $I101, $P110
    unless $I101, for_undef_348
    iter $P109, $P110
    new $P116, 'ExceptionHandler'
    set_label $P116, loop1610_handler
    $P116."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P116
  loop1610_test:
    unless $P109, loop1610_done
    shift $P111, $P109
  loop1610_redo:
    .const 'Sub' $P1608 = "74_1313881544.08239" 
    capture_lex $P1608
    $P1608($P111)
  loop1610_next:
    goto loop1610_test
  loop1610_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P117, exception, 'type'
    eq $P117, .CONTROL_LOOP_NEXT, loop1610_next
    eq $P117, .CONTROL_LOOP_REDO, loop1610_redo
  loop1610_done:
    pop_eh 
  for_undef_348:
.annotate 'line', 1358
    find_lex $P109, "$ops"
    .return ($P109)
  control_1597:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1607"  :anon :subid("74_1313881544.08239") :outer("73_1313881544.08239")
    .param pmc param_1609
.annotate 'file', ''
.annotate 'line', 1375
    .lex "$_", param_1609
    find_lex $P112, "$ops"
    find_lex $P113, "$listpost"
    find_lex $P114, "$_"
    $P115 = $P112."push_pirop"("push", $P113, $P114)
    .return ($P115)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "stmts"  :subid("75_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["PAST";"Op"])
    .param pmc param_1614
    .param pmc param_1615 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1384
    new $P1613, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1613, control_1612
    push_eh $P1613
    .lex "self", self
    .lex "$node", param_1614
    .lex "%options", param_1615
.annotate 'line', 1385
    find_lex $P106, "self"
    find_lex $P107, "$node"
    find_lex $P108, "%options"
    $P109 = $P106."node_as_post"($P107, $P108)
.annotate 'line', 1384
    .return ($P109)
  control_1612:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "null"  :subid("76_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["PAST";"Op"])
    .param pmc param_1619
    .param pmc param_1620 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1395
    new $P1618, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1618, control_1617
    push_eh $P1618
    .lex "self", self
    .lex "$node", param_1619
    .lex "%options", param_1620
.annotate 'line', 1396
    get_hll_global $P106, ["POST"], "Ops"
    find_lex $P107, "$node"
    $P108 = $P106."new"($P107 :named("node"))
.annotate 'line', 1395
    .return ($P108)
  control_1617:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "return"  :subid("77_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["PAST";"Op"])
    .param pmc param_1624
    .param pmc param_1625 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1404
    .const 'Sub' $P1633 = "78_1313881544.08239" 
    capture_lex $P1633
    new $P1623, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1623, control_1622
    push_eh $P1623
    .lex "self", self
    .lex "$node", param_1624
    .lex "%options", param_1625
.annotate 'line', 1405
    new $P106, "Undef"
    set $P1626, $P106
    .lex "$ops", $P1626
.annotate 'line', 1407
    new $P107, "Undef"
    set $P1627, $P107
    .lex "$exreg", $P1627
.annotate 'line', 1408
    new $P108, "Undef"
    set $P1628, $P108
    .lex "$extype", $P1628
.annotate 'line', 1413
    new $P109, "Undef"
    set $P1629, $P109
    .lex "$cpast", $P1629
.annotate 'line', 1405
    get_hll_global $P110, ["POST"], "Ops"
    find_lex $P111, "$node"
    $P112 = $P110."new"($P111 :named("node"))
    store_lex "$ops", $P112
.annotate 'line', 1407
    find_lex $P110, "self"
    $P111 = $P110."tempreg"("P")
    store_lex "$exreg", $P111
.annotate 'line', 1408
    find_lex $P110, "$exreg"
    concat $P111, $P110, "['type']"
    store_lex "$extype", $P111
.annotate 'line', 1409
    find_lex $P110, "$ops"
    find_lex $P111, "$exreg"
    $P110."push_pirop"("new", $P111, "\"Exception\"")
.annotate 'line', 1410
    find_lex $P110, "$ops"
    find_lex $P111, "$extype"
    $P110."push_pirop"("set", $P111, ".CONTROL_RETURN")
.annotate 'line', 1411
    find_dynamic_lex $P110, "$*SUB"
    unless_null $P110, vivify_349
    get_hll_global $P110, "$SUB"
    unless_null $P110, vivify_350
    die "Contextual $*SUB not found"
  vivify_350:
  vivify_349:
    $P110."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 1413
    find_lex $P1630, "$node"
    unless_null $P1630, vivify_351
    $P1630 = root_new ['parrot';'ResizablePMCArray']
  vivify_351:
    set $P110, $P1630[0]
    unless_null $P110, vivify_352
    new $P110, "Undef"
  vivify_352:
    store_lex "$cpast", $P110
.annotate 'line', 1414
    find_lex $P110, "$cpast"
    unless $P110, if_1631_end
    .const 'Sub' $P1633 = "78_1313881544.08239" 
    capture_lex $P1633
    $P1633()
  if_1631_end:
.annotate 'line', 1420
    find_lex $P110, "$ops"
    find_lex $P111, "$exreg"
    $P110."push_pirop"("throw", $P111)
.annotate 'line', 1404
    find_lex $P110, "$ops"
    .return ($P110)
  control_1622:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1632"  :anon :subid("78_1313881544.08239") :outer("77_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 1415
    new $P111, "Undef"
    set $P1634, $P111
    .lex "$cpost", $P1634
    find_lex $P112, "self"
    find_lex $P113, "$cpast"
    $P114 = $P112."as_post"($P113, "P" :named("rtype"))
    store_lex "$cpost", $P114
.annotate 'line', 1416
    find_lex $P112, "self"
    find_lex $P113, "$cpost"
    $P114 = $P112."coerce"($P113, "P")
    store_lex "$cpost", $P114
.annotate 'line', 1417
    find_lex $P112, "$ops"
    find_lex $P113, "$cpost"
    $P112."push"($P113)
.annotate 'line', 1418
    find_lex $P112, "$ops"
    find_lex $P113, "$exreg"
    find_lex $P114, "$cpost"
    $P115 = $P112."push_pirop"("setattribute", $P113, "'payload'", $P114)
.annotate 'line', 1414
    .return ($P115)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "try"  :subid("79_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["PAST";"Op"])
    .param pmc param_1638
    .param pmc param_1639 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1432
    new $P1637, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1637, control_1636
    push_eh $P1637
    .lex "self", self
    .lex "$node", param_1638
    .lex "%options", param_1639
.annotate 'line', 1433
    new $P106, "Undef"
    set $P1640, $P106
    .lex "$ops", $P1640
.annotate 'line', 1435
    new $P107, "Undef"
    set $P1641, $P107
    .lex "$S0", $P1641
.annotate 'line', 1436
    new $P108, "Undef"
    set $P1642, $P108
    .lex "$catchlabel", $P1642
.annotate 'line', 1437
    new $P109, "Undef"
    set $P1643, $P109
    .lex "$endlabel", $P1643
.annotate 'line', 1439
    new $P110, "Undef"
    set $P1644, $P110
    .lex "$rtype", $P1644
.annotate 'line', 1441
    new $P111, "Undef"
    set $P1645, $P111
    .lex "$trypost", $P1645
.annotate 'line', 1445
    new $P112, "Undef"
    set $P1646, $P112
    .lex "$elsepast", $P1646
.annotate 'line', 1451
    new $P113, "Undef"
    set $P1647, $P113
    .lex "$catchpast", $P1647
.annotate 'line', 1433
    get_hll_global $P114, ["POST"], "Ops"
    find_lex $P115, "$node"
    $P116 = $P114."new"($P115 :named("node"))
    store_lex "$ops", $P116
.annotate 'line', 1435
    find_lex $P114, "self"
    $P115 = $P114."unique"("catch_")
    store_lex "$S0", $P115
.annotate 'line', 1436
    get_hll_global $P114, ["POST"], "Label"
    find_lex $P115, "$S0"
    $P116 = $P114."new"($P115 :named("result"))
    store_lex "$catchlabel", $P116
.annotate 'line', 1437
    get_hll_global $P114, ["POST"], "Lable"
    find_lex $P115, "$S0"
    concat $P116, $P115, "_end"
    $P117 = $P114."new"($P116 :named("result"))
    store_lex "$endlabel", $P117
.annotate 'line', 1439
    find_lex $P1648, "%options"
    unless_null $P1648, vivify_353
    $P1648 = root_new ['parrot';'Hash']
  vivify_353:
    set $P114, $P1648["rtype"]
    unless_null $P114, vivify_354
    new $P114, "Undef"
  vivify_354:
    store_lex "$rtype", $P114
.annotate 'line', 1441
    find_lex $P114, "self"
    find_lex $P1649, "$node"
    unless_null $P1649, vivify_355
    $P1649 = root_new ['parrot';'ResizablePMCArray']
  vivify_355:
    set $P115, $P1649[0]
    unless_null $P115, vivify_356
    new $P115, "Undef"
  vivify_356:
    find_lex $P116, "$rtype"
    $P117 = $P114."as_post"($P115, $P116 :named("rtype"))
    store_lex "$trypost", $P117
.annotate 'line', 1442
    find_lex $P114, "$ops"
    find_lex $P115, "$catchlabel"
    $P114."push_pirop"("push_eh", $P115)
.annotate 'line', 1443
    find_lex $P114, "$ops"
    find_lex $P115, "$trypost"
    $P114."push"($P115)
.annotate 'line', 1444
    find_lex $P114, "$ops"
    $P114."push_pirop"("pop_eh")
.annotate 'line', 1445
    find_lex $P1650, "$node"
    unless_null $P1650, vivify_357
    $P1650 = root_new ['parrot';'ResizablePMCArray']
  vivify_357:
    set $P114, $P1650[2]
    unless_null $P114, vivify_358
    new $P114, "Undef"
  vivify_358:
    store_lex "$elsepast", $P114
.annotate 'line', 1446
    find_lex $P114, "$elsepast"
    unless $P114, if_1651_end
.annotate 'line', 1447
    find_lex $P115, "$ops"
    find_lex $P116, "self"
    find_lex $P117, "$elsepast"
    $P118 = $P116."as_post"($P117, "v" :named("rtype"))
    $P115."push"($P118)
  if_1651_end:
.annotate 'line', 1449
    find_lex $P114, "$ops"
    find_lex $P115, "$endlabel"
    $P114."push_pirop"("goto", $P115)
.annotate 'line', 1450
    find_lex $P114, "$ops"
    find_lex $P115, "$catchlabel"
    $P114."push"($P115)
.annotate 'line', 1451
    find_lex $P1652, "$node"
    unless_null $P1652, vivify_359
    $P1652 = root_new ['parrot';'ResizablePMCArray']
  vivify_359:
    set $P114, $P1652[1]
    unless_null $P114, vivify_360
    new $P114, "Undef"
  vivify_360:
    store_lex "$catchpast", $P114
.annotate 'line', 1452
    find_lex $P114, "$catchpast"
    unless $P114, if_1653_end
.annotate 'line', 1453
    find_lex $P115, "$ops"
    find_lex $P116, "self"
    find_lex $P117, "$catchpast"
    $P118 = $P116."as_post"($P117, "v" :named("rtype"))
    $P115."push"($P118)
.annotate 'line', 1454
    find_lex $P115, "$ops"
    $P115."push_pirop"("pop_eh")
  if_1653_end:
.annotate 'line', 1456
    find_lex $P114, "$ops"
    find_lex $P115, "$endlabel"
    $P114."push"($P115)
.annotate 'line', 1457
    find_lex $P114, "$ops"
    find_lex $P115, "$trypost"
    $P114."result"($P115)
.annotate 'line', 1432
    find_lex $P114, "$ops"
    .return ($P114)
  control_1636:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, "payload"
    .return ($P115)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "chain"  :subid("80_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["PAST";"Op"])
    .param pmc param_1657
    .param pmc param_1658 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1470
    .const 'Sub' $P1673 = "82_1313881544.08239" 
    capture_lex $P1673
    .const 'Sub' $P1666 = "81_1313881544.08239" 
    capture_lex $P1666
    new $P1656, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1656, control_1655
    push_eh $P1656
    .lex "self", self
    .lex "$node", param_1657
    .lex "%options", param_1658
.annotate 'line', 1472
    $P1660 = root_new ['parrot';'ResizablePMCArray']
    set $P1659, $P1660
    .lex "@clist", $P1659
.annotate 'line', 1473
    new $P106, "Undef"
    set $P1661, $P106
    .lex "$cpast", $P1661
.annotate 'line', 1481
    new $P107, "Undef"
    set $P1662, $P107
    .lex "$ops", $P1662
.annotate 'line', 1483
    new $P108, "Undef"
    set $P1663, $P108
    .lex "$endlabel", $P1663
.annotate 'line', 1486
    new $P109, "Undef"
    set $P1664, $P109
    .lex "$apost", $P1664
.annotate 'line', 1472
    new $P110, "ResizablePMCArray"
    store_lex "@clist", $P110
.annotate 'line', 1473
    find_lex $P110, "$node"
    store_lex "$cpast", $P110
.annotate 'line', 1474
    new $P115, 'ExceptionHandler'
    set_label $P115, loop1670_handler
    $P115."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P115
  loop1670_test:
    find_lex $P110, "$cpast"
    get_hll_global $P111, ["PAST"], "Op"
    $P112 = $P110."isa"($P111)
    unless $P112, loop1670_done
  loop1670_redo:
    .const 'Sub' $P1666 = "81_1313881544.08239" 
    capture_lex $P1666
    $P1666()
  loop1670_next:
    goto loop1670_test
  loop1670_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P116, exception, 'type'
    eq $P116, .CONTROL_LOOP_NEXT, loop1670_next
    eq $P116, .CONTROL_LOOP_REDO, loop1670_redo
  loop1670_done:
    pop_eh 
.annotate 'line', 1481
    get_hll_global $P110, ["POST"], "Ops"
    find_lex $P111, "$node"
    $P112 = $P110."new"($P111 :named("node"))
    store_lex "$ops", $P112
.annotate 'line', 1482
    find_lex $P110, "$ops"
    find_lex $P111, "self"
    $P112 = $P111."unique"("$P")
    $P110."result"($P112)
.annotate 'line', 1483
    get_hll_global $P110, ["POST"], "Label"
    $P111 = $P110("chain_end_" :named("name"))
    store_lex "$endlabel", $P111
.annotate 'line', 1485
    find_lex $P110, "@clist"
    pop $P111, $P110
    store_lex "$cpast", $P111
.annotate 'line', 1486
    find_lex $P110, "self"
    find_lex $P1671, "$cpast"
    unless_null $P1671, vivify_363
    $P1671 = root_new ['parrot';'ResizablePMCArray']
  vivify_363:
    set $P111, $P1671[0]
    unless_null $P111, vivify_364
    new $P111, "Undef"
  vivify_364:
    $P112 = $P110."as_post"($P111, "P" :named("rtype"))
    store_lex "$apost", $P112
.annotate 'line', 1487
    find_lex $P110, "$ops"
    find_lex $P111, "$apost"
    $P110."push"($P111)
.annotate 'line', 1489
    new $P114, 'ExceptionHandler'
    set_label $P114, loop1678_handler
    $P114."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P114
  loop1678_test:
    new $P110, "Integer"
    assign $P110, 1
    unless $P110, loop1678_done
  loop1678_redo:
    .const 'Sub' $P1673 = "82_1313881544.08239" 
    capture_lex $P1673
    $P1673()
  loop1678_next:
    goto loop1678_test
  loop1678_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, 'type'
    eq $P115, .CONTROL_LOOP_NEXT, loop1678_next
    eq $P115, .CONTROL_LOOP_REDO, loop1678_redo
  loop1678_done:
    pop_eh 
.annotate 'line', 1499
    find_lex $P110, "$ops"
    find_lex $P111, "$endlabel"
    $P110."push"($P111)
.annotate 'line', 1470
    find_lex $P110, "$ops"
    .return ($P110)
  control_1655:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1665"  :anon :subid("81_1313881544.08239") :outer("80_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 1475
    new $P113, "Undef"
    set $P1667, $P113
    .lex "$pasttype", $P1667
    find_lex $P114, "$cpast"
    $P115 = $P114."pasttype"()
    store_lex "$pasttype", $P115
.annotate 'line', 1476
    find_lex $P114, "$pasttype"
    set $S101, $P114
    isne $I101, $S101, "chain"
    unless $I101, if_1668_end
    die 0, .CONTROL_LOOP_LAST
  if_1668_end:
.annotate 'line', 1477
    find_lex $P114, "@clist"
    find_lex $P115, "$cpast"
    push $P114, $P115
.annotate 'line', 1478
    find_lex $P1669, "$cpast"
    unless_null $P1669, vivify_361
    $P1669 = root_new ['parrot';'ResizablePMCArray']
  vivify_361:
    set $P114, $P1669[0]
    unless_null $P114, vivify_362
    new $P114, "Undef"
  vivify_362:
    store_lex "$cpast", $P114
.annotate 'line', 1474
    .return ($P114)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1672"  :anon :subid("82_1313881544.08239") :outer("80_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 1490
    new $P111, "Undef"
    set $P1674, $P111
    .lex "$bpost", $P1674
.annotate 'line', 1492
    new $P112, "Undef"
    set $P1675, $P112
    .lex "$name", $P1675
.annotate 'line', 1490
    find_lex $P113, "self"
    find_lex $P1676, "$cpast"
    unless_null $P1676, vivify_365
    $P1676 = root_new ['parrot';'ResizablePMCArray']
  vivify_365:
    set $P114, $P1676[1]
    unless_null $P114, vivify_366
    new $P114, "Undef"
  vivify_366:
    $P115 = $P113."as_post"($P114, "P" :named("rtype"))
    store_lex "$bpost", $P115
.annotate 'line', 1491
    find_lex $P113, "$ops"
    find_lex $P114, "$bpost"
    $P113."push"($P114)
.annotate 'line', 1492
    find_lex $P113, "self"
    find_lex $P114, "$cpast"
    $P115 = $P114."name"()
    $P116 = $P113."escape"($P115)
    store_lex "$name", $P116
.annotate 'line', 1493
    find_lex $P113, "$ops"
    find_lex $P114, "$name"
    find_lex $P115, "$apost"
    find_lex $P116, "$bpost"
    find_lex $P117, "$ops"
    $P113."push_pirop"("call", $P114, $P115, $P116, $P117 :named("result"))
.annotate 'line', 1494
    find_lex $P113, "@clist"
    if $P113, unless_1677_end
    die 0, .CONTROL_LOOP_LAST
  unless_1677_end:
.annotate 'line', 1495
    find_lex $P113, "$ops"
    find_lex $P114, "$ops"
    find_lex $P115, "$endlabel"
    $P113."push_pirop"("unless", $P114, $P115)
.annotate 'line', 1496
    find_lex $P113, "@clist"
    pop $P114, $P113
    store_lex "$cpast", $P114
.annotate 'line', 1497
    find_lex $P113, "$bpost"
    store_lex "$apost", $P113
.annotate 'line', 1489
    .return ($P113)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "def_or"  :subid("83_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["PAST";"Op"])
    .param pmc param_1682
    .param pmc param_1683 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1510
    new $P1681, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1681, control_1680
    push_eh $P1681
    .lex "self", self
    .lex "$node", param_1682
    .lex "%options", param_1683
.annotate 'line', 1511
    new $P106, "Undef"
    set $P1684, $P106
    .lex "$ops", $P1684
.annotate 'line', 1513
    new $P107, "Undef"
    set $P1685, $P107
    .lex "$lpost", $P1685
.annotate 'line', 1517
    new $P108, "Undef"
    set $P1686, $P108
    .lex "$endlabel", $P1686
.annotate 'line', 1519
    new $P109, "Undef"
    set $P1687, $P109
    .lex "$reg", $P1687
.annotate 'line', 1522
    new $P110, "Undef"
    set $P1688, $P110
    .lex "$rpost", $P1688
.annotate 'line', 1511
    get_hll_global $P111, ["POST"], "Ops"
    find_lex $P112, "$node"
    find_lex $P113, "self"
    $P114 = $P113."unique"("$P")
    $P115 = $P111."new"($P112 :named("node"), $P114 :named("result"))
    store_lex "$ops", $P115
.annotate 'line', 1513
    find_lex $P111, "self"
    find_lex $P1689, "$node"
    unless_null $P1689, vivify_367
    $P1689 = root_new ['parrot';'ResizablePMCArray']
  vivify_367:
    set $P112, $P1689[0]
    unless_null $P112, vivify_368
    new $P112, "Undef"
  vivify_368:
    $P113 = $P111."as_post"($P112, "P" :named("rtype"))
    store_lex "$lpost", $P113
.annotate 'line', 1514
    find_lex $P111, "$ops"
    find_lex $P112, "$lpost"
    $P111."push"($P112)
.annotate 'line', 1515
    find_lex $P111, "$ops"
    find_lex $P112, "$ops"
    find_lex $P113, "$lpost"
    $P111."push_pirop"("set", $P112, $P113)
.annotate 'line', 1517
    get_hll_global $P111, ["POST"], "Label"
    find_lex $P112, "self"
    $P113 = $P112."unique"("default_")
    $P114 = $P111."new"($P113 :named("result"))
    store_lex "$endlabel", $P114
.annotate 'line', 1519
    find_lex $P111, "self"
    $P112 = $P111."unique"("$I")
    store_lex "$reg", $P112
.annotate 'line', 1520
    find_lex $P111, "$ops"
    find_lex $P112, "$reg"
    find_lex $P113, "$ops"
    $P111."push_pirop"("defined", $P112, $P113)
.annotate 'line', 1521
    find_lex $P111, "$ops"
    find_lex $P112, "$reg"
    find_lex $P113, "$endlabel"
    $P111."push_pirop"("if", $P112, $P113)
.annotate 'line', 1522
    find_lex $P111, "self"
    find_lex $P1690, "$node"
    unless_null $P1690, vivify_369
    $P1690 = root_new ['parrot';'ResizablePMCArray']
  vivify_369:
    set $P112, $P1690[1]
    unless_null $P112, vivify_370
    new $P112, "Undef"
  vivify_370:
    $P113 = $P111."as_post"($P112, "P" :named("rtype"))
    store_lex "$rpost", $P113
.annotate 'line', 1523
    find_lex $P111, "$ops"
    find_lex $P112, "$rpost"
    $P111."push"($P112)
.annotate 'line', 1524
    find_lex $P111, "$ops"
    find_lex $P112, "$ops"
    find_lex $P113, "$rpost"
    $P111."push_pirop"("set", $P112, $P113)
.annotate 'line', 1525
    find_lex $P111, "$ops"
    find_lex $P112, "$endlabel"
    $P111."push"($P112)
.annotate 'line', 1510
    find_lex $P111, "$ops"
    .return ($P111)
  control_1680:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "xor"  :subid("84_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["PAST";"Op"])
    .param pmc param_1694
    .param pmc param_1695 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1536
    .const 'Sub' $P1706 = "85_1313881544.08239" 
    capture_lex $P1706
    new $P1693, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1693, control_1692
    push_eh $P1693
    .lex "self", self
    .lex "$node", param_1694
    .lex "%options", param_1695
.annotate 'line', 1537
    new $P106, "Undef"
    set $P1696, $P106
    .lex "$ops", $P1696
.annotate 'line', 1540
    new $P107, "Undef"
    set $P1697, $P107
    .lex "$falselabel", $P1697
.annotate 'line', 1541
    new $P108, "Undef"
    set $P1698, $P108
    .lex "$endlabel", $P1698
.annotate 'line', 1543
    new $P109, "Undef"
    set $P1699, $P109
    .lex "$i", $P1699
.annotate 'line', 1544
    new $P110, "Undef"
    set $P1700, $P110
    .lex "$t", $P1700
.annotate 'line', 1545
    new $P111, "Undef"
    set $P1701, $P111
    .lex "$u", $P1701
.annotate 'line', 1546
    new $P112, "Undef"
    set $P1702, $P112
    .lex "$iter", $P1702
.annotate 'line', 1547
    new $P113, "Undef"
    set $P1703, $P113
    .lex "$apost", $P1703
.annotate 'line', 1548
    new $P114, "Undef"
    set $P1704, $P114
    .lex "$bpost", $P1704
.annotate 'line', 1537
    get_hll_global $P115, ["POST"], "Ops"
    find_lex $P116, "$node"
    $P117 = $P115."new"($P116 :named("node"))
    store_lex "$ops", $P117
.annotate 'line', 1538
    find_lex $P115, "$ops"
    find_lex $P116, "self"
    $P117 = $P116."unique"("$P")
    $P115."result"($P117)
.annotate 'line', 1540
    get_hll_global $P115, ["POST"], "Label"
    $P116 = $P115."new"("xor_false" :named("name"))
    store_lex "$falselabel", $P116
.annotate 'line', 1541
    get_hll_global $P115, ["POST"], "Label"
    $P116 = $P115."new"("xor_end" :named("name"))
    store_lex "$endlabel", $P116
.annotate 'line', 1543
    find_lex $P115, "self"
    $P116 = $P115."unique"("$I")
    store_lex "$i", $P116
.annotate 'line', 1544
    find_lex $P115, "self"
    $P116 = $P115."unique"("$i")
    store_lex "$t", $P116
.annotate 'line', 1545
    find_lex $P115, "self"
    $P116 = $P115."unique"("$i")
    store_lex "$u", $P116
.annotate 'line', 1546
    get_hll_global $P115, "node"
    $P116 = $P115."iterator"()
    store_lex "$iter", $P116
.annotate 'line', 1547
    find_lex $P115, "self"
    find_lex $P116, "$iter"
    shift $P117, $P116
    $P118 = $P115."as_post"($P117, "P" :named("rtype"))
    store_lex "$apost", $P118
.annotate 'line', 1536
    find_lex $P115, "$bpost"
.annotate 'line', 1549
    find_lex $P115, "$ops"
    find_lex $P116, "$apost"
    $P115."push"($P116)
.annotate 'line', 1550
    find_lex $P115, "$ops"
    find_lex $P116, "$ops"
    find_lex $P117, "$apost"
    $P115."push_pirop"("set", $P116, $P117)
.annotate 'line', 1551
    find_lex $P115, "$ops"
    find_lex $P116, "$t"
    find_lex $P117, "$apost"
    $P115."push_pirop"("istrue", $P116, $P117)
.annotate 'line', 1552
    new $P117, 'ExceptionHandler'
    set_label $P117, loop1709_handler
    $P117."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P117
  loop1709_test:
    new $P115, "Integer"
    assign $P115, 1
    unless $P115, loop1709_done
  loop1709_redo:
    .const 'Sub' $P1706 = "85_1313881544.08239" 
    capture_lex $P1706
    $P1706()
  loop1709_next:
    goto loop1709_test
  loop1709_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P118, exception, 'type'
    eq $P118, .CONTROL_LOOP_NEXT, loop1709_next
    eq $P118, .CONTROL_LOOP_REDO, loop1709_redo
  loop1709_done:
    pop_eh 
.annotate 'line', 1565
    find_lex $P115, "$ops"
    find_lex $P116, "$t"
    find_lex $P117, "$endlabel"
    $P115."push_pirop"("if", $P116, $P117)
.annotate 'line', 1566
    find_lex $P115, "$ops"
    find_lex $P116, "$ops"
    find_lex $P117, "$bpost"
    $P115."push_pirop"("set", $P116, $P117)
.annotate 'line', 1567
    find_lex $P115, "$ops"
    find_lex $P116, "$endlabel"
    $P115."push_pirop"("goto", $P116)
.annotate 'line', 1568
    find_lex $P115, "$ops"
    find_lex $P116, "$falselabel"
    $P115."push"($P116)
.annotate 'line', 1569
    find_lex $P115, "$ops"
    find_lex $P116, "$ops"
    $P115."push_pirop"("new", $P116, "\"Undef\"")
.annotate 'line', 1570
    find_lex $P115, "$ops"
    find_lex $P116, "$endlabel"
    $P115."push"($P116)
.annotate 'line', 1536
    find_lex $P115, "$ops"
    .return ($P115)
  control_1692:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P116, exception, "payload"
    .return ($P116)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1705"  :anon :subid("85_1313881544.08239") :outer("84_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 1559
    new $P116, "Undef"
    set $P1707, $P116
    .lex "$truelabel", $P1707
.annotate 'line', 1553
    find_lex $P117, "self"
    find_lex $P118, "$iter"
    shift $P119, $P118
    $P120 = $P117."as_post"($P119, "P" :named("rtype"))
    store_lex "$bpost", $P120
.annotate 'line', 1554
    find_lex $P117, "$ops"
    find_lex $P118, "$bpost"
    $P117."push"($P118)
.annotate 'line', 1555
    find_lex $P117, "$ops"
    find_lex $P118, "$u"
    find_lex $P119, "$bpost"
    $P117."push_pirop"("istrue", $P118, $P119)
.annotate 'line', 1556
    find_lex $P117, "$ops"
    find_lex $P118, "$i"
    find_lex $P119, "$t"
    find_lex $P120, "$u"
    $P117."push_pirop"("and", $P118, $P119, $P120)
.annotate 'line', 1557
    find_lex $P117, "$ops"
    find_lex $P118, "$i"
    find_lex $P119, "$falselabel"
    $P117."push_pirop"("if", $P118, $P119)
.annotate 'line', 1558
    find_lex $P117, "$iter"
    if $P117, unless_1708_end
    die 0, .CONTROL_LOOP_LAST
  unless_1708_end:
.annotate 'line', 1559
    get_hll_global $P117, ["POST"], "Label"
    $P118 = $P117."new"("xor_true" :named("name"))
    store_lex "$truelabel", $P118
.annotate 'line', 1560
    find_lex $P117, "$ops"
    find_lex $P118, "$t"
    find_lex $P119, "$truelabel"
    $P117."push_pirop"("if", $P118, $P119)
.annotate 'line', 1561
    find_lex $P117, "$ops"
    find_lex $P118, "$ops"
    find_lex $P119, "$bpost"
    $P117."push_pirop"("set", $P118, $P119)
.annotate 'line', 1562
    find_lex $P117, "$ops"
    find_lex $P118, "$t"
    find_lex $P119, "$u"
    $P117."push_pirop"("set", $P118, $P119)
.annotate 'line', 1563
    find_lex $P117, "$ops"
    find_lex $P118, "$truelabel"
    $P119 = $P117."push"($P118)
.annotate 'line', 1552
    .return ($P119)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "bind"  :subid("86_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["PAST";"Op"])
    .param pmc param_1713
    .param pmc param_1714 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1579
    new $P1712, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1712, control_1711
    push_eh $P1712
    .lex "self", self
    .lex "$node", param_1713
    .lex "%options", param_1714
.annotate 'line', 1580
    new $P106, "Undef"
    set $P1715, $P106
    .lex "$lpast", $P1715
.annotate 'line', 1581
    new $P107, "Undef"
    set $P1716, $P107
    .lex "$rpast", $P1716
.annotate 'line', 1583
    new $P108, "Undef"
    set $P1717, $P108
    .lex "$ops", $P1717
.annotate 'line', 1584
    new $P109, "Undef"
    set $P1718, $P109
    .lex "$rpost", $P1718
.annotate 'line', 1589
    new $P110, "Undef"
    set $P1719, $P110
    .lex "$lpost", $P1719
.annotate 'line', 1580
    find_lex $P1720, "$node"
    unless_null $P1720, vivify_371
    $P1720 = root_new ['parrot';'ResizablePMCArray']
  vivify_371:
    set $P111, $P1720[0]
    unless_null $P111, vivify_372
    new $P111, "Undef"
  vivify_372:
    store_lex "$lpast", $P111
.annotate 'line', 1581
    find_lex $P1721, "$node"
    unless_null $P1721, vivify_373
    $P1721 = root_new ['parrot';'ResizablePMCArray']
  vivify_373:
    set $P111, $P1721[1]
    unless_null $P111, vivify_374
    new $P111, "Undef"
  vivify_374:
    store_lex "$rpast", $P111
.annotate 'line', 1583
    get_hll_global $P111, ["POST"], "Ops"
    find_lex $P112, "$node"
    $P113 = $P111."new"($P112 :named("node"))
    store_lex "$ops", $P113
.annotate 'line', 1584
    find_lex $P111, "self"
    find_lex $P112, "$rpast"
    $P113 = $P111."as_post"($P112, "P" :named("rtype"))
    store_lex "$rpost", $P113
.annotate 'line', 1585
    find_lex $P111, "self"
    find_lex $P112, "$rpost"
    $P113 = $P111."coerce"($P112, "P")
    store_lex "$rpost", $P113
.annotate 'line', 1586
    find_lex $P111, "$ops"
    find_lex $P112, "$rpost"
    $P111."push"($P112)
.annotate 'line', 1588
    find_lex $P111, "$lpast"
    $P111."lvalue"(1)
.annotate 'line', 1589
    find_lex $P111, "self"
    find_lex $P112, "$lpast"
    find_lex $P113, "$rpost"
    $P114 = $P111."as_post"($P112, $P113 :named("bindpost"))
    store_lex "$lpost", $P114
.annotate 'line', 1590
    find_lex $P111, "$ops"
    find_lex $P112, "$lpost"
    $P111."push"($P112)
.annotate 'line', 1591
    find_lex $P111, "$ops"
    find_lex $P112, "$lpost"
    $P111."result"($P112)
.annotate 'line', 1579
    find_lex $P111, "$ops"
    .return ($P111)
  control_1711:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "copy"  :subid("87_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["PAST";"Op"])
    .param pmc param_1725
    .param pmc param_1726 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1599
    new $P1724, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1724, control_1723
    push_eh $P1724
    .lex "self", self
    .lex "$node", param_1725
    .lex "%options", param_1726
.annotate 'line', 1600
    new $P106, "Undef"
    set $P1727, $P106
    .lex "$rpost", $P1727
.annotate 'line', 1601
    new $P107, "Undef"
    set $P1728, $P107
    .lex "$lpost", $P1728
.annotate 'line', 1602
    new $P108, "Undef"
    set $P1729, $P108
    .lex "$ops", $P1729
.annotate 'line', 1600
    find_lex $P109, "self"
    find_lex $P1730, "$node"
    unless_null $P1730, vivify_375
    $P1730 = root_new ['parrot';'ResizablePMCArray']
  vivify_375:
    set $P110, $P1730[1]
    unless_null $P110, vivify_376
    new $P110, "Undef"
  vivify_376:
    $P111 = $P109."as_post"($P110, "P" :named("rtype"))
    store_lex "$rpost", $P111
.annotate 'line', 1601
    find_lex $P109, "self"
    find_lex $P1731, "$node"
    unless_null $P1731, vivify_377
    $P1731 = root_new ['parrot';'ResizablePMCArray']
  vivify_377:
    set $P110, $P1731[0]
    unless_null $P110, vivify_378
    new $P110, "Undef"
  vivify_378:
    $P111 = $P109."as_post"($P110, "P" :named("rtype"))
    store_lex "$lpost", $P111
.annotate 'line', 1602
    get_hll_global $P109, ["POST"], "Ops"
    find_lex $P110, "$rpost"
    find_lex $P111, "$lpost"
    find_lex $P112, "$node"
    find_lex $P113, "$lpost"
    $P114 = $P109."new"($P110, $P111, $P112 :named("node"), $P113 :named("result"))
    store_lex "$ops", $P114
.annotate 'line', 1604
    find_lex $P109, "$ops"
    find_lex $P110, "$lpost"
    find_lex $P111, "$rpost"
    $P109."push_pirop"("copy", $P110, $P111)
.annotate 'line', 1599
    find_lex $P109, "$ops"
    .return ($P109)
  control_1723:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "inline"  :subid("88_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["PAST";"Op"])
    .param pmc param_1735
    .param pmc param_1736 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1613
    new $P1734, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1734, control_1733
    push_eh $P1734
    .lex "self", self
    .lex "$node", param_1735
    .lex "%options", param_1736
.annotate 'line', 1618
    new $P106, "Undef"
    set $P1737, $P106
    .lex "$ops", $P1737
.annotate 'line', 1619
    new $P107, "Undef"
    set $P1738, $P107
    .lex "$inline", $P1738
.annotate 'line', 1622
    new $P108, "Undef"
    set $P1739, $P108
    .lex "$result", $P1739
.annotate 'line', 1623
    new $P109, "Undef"
    set $P1740, $P109
    .lex "$i", $P1740
.annotate 'line', 1636
    $P1742 = root_new ['parrot';'ResizablePMCArray']
    set $P1741, $P1742
    .lex "@arglist", $P1741
.annotate 'line', 1638
    new $P110, "Undef"
    set $P1743, $P110
    .lex "$s", $P1743
.annotate 'line', 1618
    find_lex $P111, "self"
    find_lex $P112, "$node"
    $P113 = $P111."post_children"($P112, "vP" :named("signature"))
    store_lex "$ops", $P113
.annotate 'line', 1619
    find_lex $P111, "$node"
    $P112 = $P111."inline"()
    store_lex "$inline", $P112
.annotate 'line', 1620
    find_lex $P111, "$inline"
    does $I101, $P111, "array"
    unless $I101, if_1744_end
    find_lex $P112, "$inline"
    join $S101, "\n", $P112
    new $P113, 'String'
    set $P113, $S101
    store_lex "$inline", $P113
  if_1744_end:
.annotate 'line', 1622
    new $P111, "String"
    assign $P111, ""
    store_lex "$result", $P111
.annotate 'line', 1623
    find_lex $P111, "$inline"
    set $S101, $P111
    index $I101, $S101, "%t"
    new $P112, 'Integer'
    set $P112, $I101
    store_lex "$i", $P112
.annotate 'line', 1624
    find_lex $P111, "$i"
    set $N101, $P111
    isge $I101, $N101, 0.0
    if $I101, if_1745
.annotate 'line', 1630
    find_lex $P112, "$inline"
    set $S101, $P112
    index $I102, $S101, "%r"
    new $P113, 'Integer'
    set $P113, $I102
    store_lex "$i", $P113
.annotate 'line', 1631
    find_lex $P112, "$i"
    set $N102, $P112
    isge $I102, $N102, 0.0
    unless $I102, if_1746_end
.annotate 'line', 1632
    find_lex $P113, "self"
    $P114 = $P113."unique"("$P")
    store_lex "$result", $P114
.annotate 'line', 1633
    find_lex $P113, "$ops"
    find_lex $P114, "$result"
    $P113."result"($P114)
  if_1746_end:
.annotate 'line', 1629
    goto if_1745_end
  if_1745:
.annotate 'line', 1625
    find_lex $P112, "self"
    $P113 = $P112."unique"("$P")
    store_lex "$result", $P113
.annotate 'line', 1626
    find_lex $P112, "$ops"
    find_lex $P113, "$result"
    $P112."push_pirop"("new", $P113, "'Undef'")
.annotate 'line', 1627
    find_lex $P112, "$ops"
    find_lex $P113, "$result"
    $P112."result"($P113)
  if_1745_end:
.annotate 'line', 1636
    find_lex $P111, "$ops"
    $P112 = $P111."list"()
    store_lex "@arglist", $P112
.annotate 'line', 1637
    find_lex $P111, "$ops"
    find_lex $P112, "@arglist"
    find_lex $P113, "$inline"
    find_lex $P114, "$result"
    $P111."push_pirop"("inline", $P112 :flat, $P113 :named("inline"), $P114 :named("result"))
.annotate 'line', 1638
    find_lex $P1747, "%options"
    unless_null $P1747, vivify_379
    $P1747 = root_new ['parrot';'Hash']
  vivify_379:
    set $P111, $P1747["rtype"]
    unless_null $P111, vivify_380
    new $P111, "Undef"
  vivify_380:
    store_lex "$s", $P111
.annotate 'line', 1613
    find_lex $P111, "$ops"
    .return ($P111)
  control_1733:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("89_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["PAST";"Var"])
    .param pmc param_1751
    .param pmc param_1752 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1650
    .const 'Sub' $P1792 = "93_1313881544.08239" 
    capture_lex $P1792
    .const 'Sub' $P1781 = "92_1313881544.08239" 
    capture_lex $P1781
    .const 'Sub' $P1757 = "90_1313881544.08239" 
    capture_lex $P1757
    new $P1750, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1750, control_1749
    push_eh $P1750
    .lex "self", self
    .lex "$node", param_1751
    .lex "%options", param_1752
.annotate 'line', 1652
    new $P106, "Undef"
    set $P1753, $P106
    .lex "$bindpost", $P1753
.annotate 'line', 1656
    new $P107, "Undef"
    set $P1754, $P107
    .lex "$scope", $P1754
.annotate 'line', 1657
    new $P108, "Undef"
    set $P1755, $P108
    .lex "$name", $P1755
.annotate 'line', 1676
    .const 'Sub' $P1757 = "90_1313881544.08239" 
    newclosure $P1776, $P1757
    set $P1756, $P1776
    .lex "scope_error", $P1756
.annotate 'line', 1652
    find_lex $P1777, "%options"
    unless_null $P1777, vivify_388
    $P1777 = root_new ['parrot';'Hash']
  vivify_388:
    set $P115, $P1777["bindpost"]
    unless_null $P115, vivify_389
    new $P115, "Undef"
  vivify_389:
    store_lex "$bindpost", $P115
.annotate 'line', 1653
    find_lex $P115, "$bindpost"
    if $P115, unless_1778_end
    new $P116, "Undef"
    store_lex "$bindpost", $P116
  unless_1778_end:
.annotate 'line', 1656
    find_lex $P115, "$node"
    $P116 = $P115."scope"()
    store_lex "$scope", $P116
.annotate 'line', 1657
    find_lex $P115, "$node"
    $P116 = $P115."name"()
    store_lex "$name", $P116
.annotate 'line', 1658
    find_lex $P115, "$scope"
    if $P115, unless_1779_end
    .const 'Sub' $P1781 = "92_1313881544.08239" 
    capture_lex $P1781
    $P1781()
  unless_1779_end:
.annotate 'line', 1671
    .const 'Sub' $P1792 = "93_1313881544.08239" 
    capture_lex $P1792
    $P1792()
.annotate 'line', 1650
    find_lex $P115, "scope_error"
    .return ($P115)
  control_1749:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P116, exception, "payload"
    .return ($P116)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "scope_error"  :subid("90_1313881544.08239") :outer("89_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 1676
    .const 'Sub' $P1767 = "91_1313881544.08239" 
    capture_lex $P1767
    new $P1759, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1759, control_1758
    push_eh $P1759
.annotate 'line', 1678
    new $P109, "Undef"
    set $P1760, $P109
    .lex "$blockname", $P1760
.annotate 'line', 1685
    new $P110, "Undef"
    set $P1761, $P110
    .lex "$sourceline", $P1761
.annotate 'line', 1686
    new $P111, "Undef"
    set $P1762, $P111
    .lex "$source", $P1762
.annotate 'line', 1687
    new $P112, "Undef"
    set $P1763, $P112
    .lex "$pos", $P1763
.annotate 'line', 1688
    new $P113, "Undef"
    set $P1764, $P113
    .lex "$files", $P1764
.annotate 'line', 1677
    find_lex $P114, "$scope"
    unless $P114, if_1765_end
    new $P115, 'String'
    set $P115, " in '"
    find_lex $P116, "$scope"
    concat $P117, $P115, $P116
    concat $P118, $P117, "' scope"
    store_lex "$scope", $P118
  if_1765_end:
.annotate 'line', 1678
    new $P114, "String"
    assign $P114, ""
    store_lex "$blockname", $P114
.annotate 'line', 1679
    find_dynamic_lex $P115, "@*BLOCKPAST"
    unless_null $P115, vivify_381
    get_hll_global $P115, "@BLOCKPAST"
    unless_null $P115, vivify_382
    die "Contextual @*BLOCKPAST not found"
  vivify_382:
  vivify_381:
    defined $I101, $P115
    unless $I101, for_undef_383
    iter $P114, $P115
    new $P118, 'ExceptionHandler'
    set_label $P118, loop1770_handler
    $P118."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P118
  loop1770_test:
    unless $P114, loop1770_done
    shift $P116, $P114
  loop1770_redo:
    .const 'Sub' $P1767 = "91_1313881544.08239" 
    capture_lex $P1767
    $P1767($P116)
  loop1770_next:
    goto loop1770_test
  loop1770_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P119, exception, 'type'
    eq $P119, .CONTROL_LOOP_NEXT, loop1770_next
    eq $P119, .CONTROL_LOOP_REDO, loop1770_redo
  loop1770_done:
    pop_eh 
  for_undef_383:
.annotate 'line', 1683
    find_lex $P114, "$blockname"
    if $P114, unless_1771_end
    new $P115, "String"
    assign $P115, "<anonymous>"
    store_lex "$blockname", $P115
  unless_1771_end:
.annotate 'line', 1685
    new $P114, "String"
    assign $P114, ""
    store_lex "$sourceline", $P114
.annotate 'line', 1686
    find_lex $P1772, "$node"
    unless_null $P1772, vivify_384
    $P1772 = root_new ['parrot';'Hash']
  vivify_384:
    set $P114, $P1772["source"]
    unless_null $P114, vivify_385
    new $P114, "Undef"
  vivify_385:
    store_lex "$source", $P114
.annotate 'line', 1687
    find_lex $P1773, "$node"
    unless_null $P1773, vivify_386
    $P1773 = root_new ['parrot';'Hash']
  vivify_386:
    set $P114, $P1773["pos"]
    unless_null $P114, vivify_387
    new $P114, "Undef"
  vivify_387:
    store_lex "$pos", $P114
.annotate 'line', 1688
    find_caller_lex $P114, "$?FILES"
    store_lex "$files", $P114
.annotate 'line', 1689
    find_lex $P115, "$source"
    if $P115, if_1775
    set $P114, $P115
    goto if_1775_end
  if_1775:
    find_lex $P116, "$files"
    set $P114, $P116
  if_1775_end:
    if $P114, unless_1774_end
.annotate 'line', 1690
    new $P117, "String"
    assign $P117, " ("
    find_lex $P118, "$files"
    concat $P119, $P117, $P118
    concat $P120, $P119, ":"
.annotate 'line', 1691
    find_lex $P121, "self"
    find_lex $P122, "$source"
    find_lex $P123, "$pos"
    $P124 = $P121."lineof"($P122, $P123)
    add $P125, $P124, 1
    concat $P126, $P120, $P125
.annotate 'line', 1690
    concat $P127, $P126, ")"
.annotate 'line', 1691
    store_lex "$sourceline", $P127
  unless_1774_end:
.annotate 'line', 1693
    find_lex $P114, "self"
    new $P115, 'String'
    set $P115, "Symbol '"
    find_lex $P116, "$name"
    concat $P117, $P115, $P116
    concat $P118, $P117, "' not predeclared"
    find_lex $P119, "$scope"
    find_lex $P120, "$blockname"
    find_lex $P121, "$sourceline"
    $P122 = $P114."panic"($P118, $P119, " in ", $P120, $P121)
.annotate 'line', 1676
    .return ($P122)
  control_1758:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, "payload"
    .return ($P114)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1766"  :anon :subid("91_1313881544.08239") :outer("90_1313881544.08239")
    .param pmc param_1768
.annotate 'file', ''
.annotate 'line', 1679
    .lex "$_", param_1768
.annotate 'line', 1680
    find_lex $P117, "$_"
    $P118 = $P117."name"()
    store_lex "$blockname", $P118
.annotate 'line', 1681
    find_lex $P118, "$blockname"
    if $P118, if_1769
    set $P117, $P118
    goto if_1769_end
  if_1769:
    die 0, .CONTROL_LOOP_LAST
  if_1769_end:
.annotate 'line', 1679
    .return ($P117)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1780"  :anon :subid("92_1313881544.08239") :outer("89_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 1660
    new $P116, "Undef"
    set $P1782, $P116
    .lex "$P0", $P1782
    find_lex $P117, "$name"
    find_lex $P118, "self"
    getattribute $P1783, $P118, "%!symtable"
    unless_null $P1783, vivify_390
    $P1783 = root_new ['parrot';'Hash']
  vivify_390:
    set $P119, $P1783[$P117]
    unless_null $P119, vivify_391
    new $P119, "Undef"
  vivify_391:
    store_lex "$P0", $P119
.annotate 'line', 1661
    find_lex $P117, "$P0"
    unless $P117, if_1784_end
    find_lex $P1785, "$P0"
    unless_null $P1785, vivify_392
    $P1785 = root_new ['parrot';'Hash']
  vivify_392:
    set $P118, $P1785["scope"]
    unless_null $P118, vivify_393
    new $P118, "Undef"
  vivify_393:
    store_lex "$scope", $P118
  if_1784_end:
.annotate 'line', 1662
    find_lex $P118, "$scope"
    unless $P118, unless_1786
    set $P117, $P118
    goto unless_1786_end
  unless_1786:
.annotate 'line', 1664
    find_lex $P119, "self"
    getattribute $P1787, $P119, "%!symtable"
    unless_null $P1787, vivify_394
    $P1787 = root_new ['parrot';'Hash']
  vivify_394:
    set $P120, $P1787[""]
    unless_null $P120, vivify_395
    new $P120, "Undef"
  vivify_395:
    store_lex "$P0", $P120
.annotate 'line', 1665
    find_lex $P119, "$P0"
    if $P119, unless_1788_end
    "scope_error"()
  unless_1788_end:
.annotate 'line', 1666
    find_lex $P1789, "$P0"
    unless_null $P1789, vivify_396
    $P1789 = root_new ['parrot';'Hash']
  vivify_396:
    set $P119, $P1789["scope"]
    unless_null $P119, vivify_397
    new $P119, "Undef"
  vivify_397:
    store_lex "$scope", $P119
.annotate 'line', 1667
    find_lex $P120, "$scope"
    unless $P120, unless_1790
    set $P119, $P120
    goto unless_1790_end
  unless_1790:
    $P121 = "scope_error"()
    set $P119, $P121
  unless_1790_end:
.annotate 'line', 1662
    set $P117, $P119
  unless_1786_end:
.annotate 'line', 1658
    .return ($P117)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1791"  :anon :subid("93_1313881544.08239") :outer("89_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 1671
    .const 'Sub' $P1799 = "94_1313881544.08239" 
    capture_lex $P1799
    new $P1795, 'ExceptionHandler'
    set_label $P1795, control_1794
    $P1795."handle_types_except"(.CONTROL_RETURN,  .CONTROL_OK,  .CONTROL_BREAK,  .CONTROL_CONTINUE,  .CONTROL_TAKE,  .CONTROL_LEAVE,  .CONTROL_EXIT,  .CONTROL_LOOP_NEXT,  .CONTROL_LOOP_LAST,  .CONTROL_LOOP_REDO)
    push_eh $P1795
.annotate 'line', 1672
    new $P115, "Exception"
    set $P115['type'], .CONTROL_RETURN
    find_lex $P116, "self"
    find_lex $P117, "$node"
    find_lex $P118, "$bindpost"
    find_lex $P119, "$scope"
    set $S101, $P119
    $P120 = $P116.$S101($P117, $P118)
    setattribute $P115, 'payload', $P120
    throw $P115
.annotate 'line', 1671
    pop_eh 
    goto skip_handler_1793
  control_1794:
.annotate 'line', 1673
    .local pmc exception 
    .get_results (exception) 
    .const 'Sub' $P1799 = "94_1313881544.08239" 
    newclosure $P1804, $P1799
    $P1804(exception)
    new $P1805, 'Integer'
    set $P1805, 1
    set exception["handled"], $P1805
    set $I1806, exception["handled"]
    ne $I1806, 1, nothandled_1797
  handled_1796:
    .return (exception)
  nothandled_1797:
    rethrow exception
  skip_handler_1793:
.annotate 'line', 1671
    .return ()
.end


.namespace ["PAST";"Compiler"]
.sub "_block1798"  :anon :subid("94_1313881544.08239") :outer("93_1313881544.08239")
    .param pmc param_1800
.annotate 'file', ''
.annotate 'line', 1673
    .lex "$_", param_1800
    find_lex $P1801, "$_"
    set $P1802, $P1801
    .lex "$!", $P1802
    $P1803 = "scope_error"()
    .return ($P1803)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "vivify"  :subid("95_1313881544.08239") :method :outer("11_1313881544.08239")
    .param pmc param_1810
    .param pmc param_1811
    .param pmc param_1812
    .param pmc param_1813
.annotate 'file', ''
.annotate 'line', 1699
    .const 'Sub' $P1820 = "96_1313881544.08239" 
    capture_lex $P1820
    new $P1809, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1809, control_1808
    push_eh $P1809
    .lex "self", self
    .lex "$node", param_1810
    .lex "$ops", param_1811
    .lex "$fetchop", param_1812
    .lex "$storeop", param_1813
.annotate 'line', 1700
    new $P106, "Undef"
    set $P1814, $P106
    .lex "$viviself", $P1814
.annotate 'line', 1701
    new $P107, "Undef"
    set $P1815, $P107
    .lex "$vivipost", $P1815
.annotate 'line', 1702
    new $P108, "Undef"
    set $P1816, $P108
    .lex "$result", $P1816
.annotate 'line', 1700
    find_lex $P109, "$node"
    $P110 = $P109."viviself"()
    store_lex "$viviself", $P110
.annotate 'line', 1701
    find_lex $P109, "self"
    find_lex $P110, "$viviself"
    $P111 = $P109."as_vivipost"($P110, "P" :named("rtype"))
    store_lex "$vivipost", $P111
.annotate 'line', 1702
    find_lex $P109, "$vivipost"
    $P110 = $P109."result"()
    store_lex "$result", $P110
.annotate 'line', 1703
    find_lex $P109, "$result"
    set $S101, $P109
    iseq $I101, $S101, ""
    unless $I101, if_1817_end
    find_lex $P110, "self"
    $P111 = $P110."tempreg"("P")
    store_lex "$result", $P111
  if_1817_end:
.annotate 'line', 1705
    find_lex $P109, "$ops"
    find_lex $P110, "$result"
    $P109."result"($P110)
.annotate 'line', 1706
    find_lex $P109, "$ops"
    find_lex $P110, "$fetchop"
    $P109."push"($P110)
.annotate 'line', 1707
    find_lex $P109, "$viviself"
    unless $P109, if_1818_end
    .const 'Sub' $P1820 = "96_1313881544.08239" 
    capture_lex $P1820
    $P1820()
  if_1818_end:
.annotate 'line', 1699
    find_lex $P109, "$ops"
    .return ($P109)
  control_1808:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1819"  :anon :subid("96_1313881544.08239") :outer("95_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 1708
    new $P110, "Undef"
    set $P1821, $P110
    .lex "$vivilabel", $P1821
    get_hll_global $P111, ["POST"], "Label"
    $P112 = $P111."new"("vivify_" :named("name"))
    store_lex "$vivilabel", $P112
.annotate 'line', 1709
    find_lex $P111, "$ops"
    find_lex $P112, "$ops"
    find_lex $P113, "$vivilabel"
    $P111."push_pirop"("unless_null", $P112, $P113)
.annotate 'line', 1710
    find_lex $P111, "$ops"
    find_lex $P112, "$vivipost"
    $P111."push"($P112)
.annotate 'line', 1711
    find_lex $P111, "$node"
    $P112 = $P111."lvalue"()
    unless $P112, if_1822_end
    find_lex $P113, "$ops"
    find_lex $P114, "$storeop"
    $P113."push"($P114)
  if_1822_end:
.annotate 'line', 1712
    find_lex $P111, "$ops"
    find_lex $P112, "$vivilabel"
    $P113 = $P111."push"($P112)
.annotate 'line', 1707
    .return ($P113)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "parameter"  :subid("97_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["PAST";"Var"],_)
    .param pmc param_1826
    .param pmc param_1827
.annotate 'file', ''
.annotate 'line', 1718
    .const 'Sub' $P1835 = "98_1313881544.08239" 
    capture_lex $P1835
    new $P1825, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1825, control_1824
    push_eh $P1825
    .lex "self", self
    .lex "$node", param_1826
    .lex "$bindpost", param_1827
.annotate 'line', 1720
    new $P106, "Undef"
    set $P1828, $P106
    .lex "$name", $P1828
.annotate 'line', 1721
    new $P107, "Undef"
    set $P1829, $P107
    .lex "$named", $P1829
.annotate 'line', 1722
    new $P108, "Undef"
    set $P1830, $P108
    .lex "$pname", $P1830
.annotate 'line', 1725
    new $P109, "Undef"
    set $P1831, $P109
    .lex "$ops", $P1831
.annotate 'line', 1727
    new $P110, "Undef"
    set $P1832, $P110
    .lex "$viviself", $P1832
.annotate 'line', 1720
    find_lex $P111, "$node"
    $P112 = $P111."name"()
    store_lex "$name", $P112
.annotate 'line', 1721
    find_lex $P111, "$node"
    $P112 = $P111."named"()
    store_lex "$named", $P112
.annotate 'line', 1722
    find_lex $P111, "self"
    $P112 = $P111."unique"("param_")
    store_lex "$pname", $P112
.annotate 'line', 1725
    get_hll_global $P111, ["POST"], "Ops"
    find_lex $P112, "$node"
    find_lex $P113, "$pname"
    $P114 = $P111."new"($P112 :named("node"), $P113 :named("result"))
    store_lex "$ops", $P114
.annotate 'line', 1727
    find_lex $P111, "$node"
    $P112 = $P111."viviself"()
    store_lex "$viviself", $P112
.annotate 'line', 1728
    find_lex $P111, "$viviself"
    if $P111, if_1833
.annotate 'line', 1739
    find_dynamic_lex $P114, "$*SUB"
    unless_null $P114, vivify_398
    get_hll_global $P114, "$SUB"
    unless_null $P114, vivify_399
    die "Contextual $*SUB not found"
  vivify_399:
  vivify_398:
    find_lex $P115, "$pname"
    find_lex $P117, "$named"
.annotate 'line', 1740
    find_lex $P118, "$node"
    $P119 = $P118."slurpy"()
    find_lex $P120, "$node"
    $P121 = $P120."call_sig"()
.annotate 'line', 1739
    $P114."add_param"($P115, $P117 :named("named"), $P119 :named("slurpy"), $P121 :named("call_sig"))
.annotate 'line', 1738
    goto if_1833_end
  if_1833:
.annotate 'line', 1728
    .const 'Sub' $P1835 = "98_1313881544.08239" 
    capture_lex $P1835
    $P1835()
  if_1833_end:
.annotate 'line', 1743
    find_lex $P111, "$name"
    defined $I101, $P111
    unless $I101, if_1838_end
.annotate 'line', 1744
    find_lex $P112, "$ops"
    find_lex $P113, "self"
    find_lex $P114, "$name"
    $P115 = $P113."escape"($P114)
    find_lex $P116, "$ops"
    $P112."push_pirop"(".lex", $P115, $P116)
  if_1838_end:
.annotate 'line', 1718
    find_lex $P111, "$ops"
    .return ($P111)
  control_1824:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1834"  :anon :subid("98_1313881544.08239") :outer("97_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 1730
    new $P112, "Undef"
    set $P1836, $P112
    .lex "$vivipost", $P1836
.annotate 'line', 1731
    new $P113, "Undef"
    set $P1837, $P113
    .lex "$vivilabel", $P1837
.annotate 'line', 1730
    find_lex $P114, "self"
    find_lex $P115, "$viviself"
    $P116 = $P114."as_vivipost"($P115, "P" :named("rtype"))
    store_lex "$vivipost", $P116
.annotate 'line', 1731
    get_hll_global $P114, ["POST"], "Label"
    $P115 = $P114."new"("optparam_" :named("name"))
    store_lex "$vivilabel", $P115
.annotate 'line', 1732
    find_dynamic_lex $P114, "$*SUB"
    unless_null $P114, vivify_400
    get_hll_global $P114, "$SUB"
    unless_null $P114, vivify_401
    die "Contextual $*SUB not found"
  vivify_401:
  vivify_400:
    find_lex $P115, "$pname"
    find_lex $P116, "$named"
    $P114."add_param"($P115, $P116 :named("named"), 1 :named("optional"))
.annotate 'line', 1733
    find_lex $P114, "$ops"
    new $P115, 'String'
    set $P115, "has_"
    find_lex $P116, "$pname"
    concat $P117, $P115, $P116
    find_lex $P118, "$vivilabel"
    $P114."push_pirop"("if", $P117, $P118)
.annotate 'line', 1734
    find_lex $P114, "$ops"
    find_lex $P115, "$vivipost"
    $P114."push"($P115)
.annotate 'line', 1735
    find_lex $P114, "$ops"
    find_lex $P115, "$ops"
    find_lex $P116, "$vivipost"
    $P114."push_pirop"("set", $P115, $P116)
.annotate 'line', 1736
    find_lex $P114, "$ops"
    find_lex $P115, "$vivilabel"
    $P116 = $P114."push"($P115)
.annotate 'line', 1728
    .return ($P116)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "package"  :subid("99_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["PAST";"Var"],_)
    .param pmc param_1842
    .param pmc param_1843
.annotate 'file', ''
.annotate 'line', 1751
    new $P1841, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1841, control_1840
    push_eh $P1841
    .lex "self", self
    .lex "$node", param_1842
    .lex "$bindpost", param_1843
.annotate 'line', 1752
    new $P106, "Undef"
    set $P1844, $P106
    .lex "$ops", $P1844
.annotate 'line', 1753
    new $P107, "Undef"
    set $P1845, $P107
    .lex "$name", $P1845
.annotate 'line', 1754
    new $P108, "Undef"
    set $P1846, $P108
    .lex "$ns", $P1846
.annotate 'line', 1756
    new $P109, "Undef"
    set $P1847, $P109
    .lex "$fetchop", $P1847
.annotate 'line', 1757
    new $P110, "Undef"
    set $P1848, $P110
    .lex "$storeop", $P1848
.annotate 'line', 1758
    $P1850 = root_new ['parrot';'ResizablePMCArray']
    set $P1849, $P1850
    .lex "@name", $P1849
.annotate 'line', 1752
    get_hll_global $P111, ["POST"], "Ops"
    find_lex $P112, "$node"
    $P113 = $P111."new"($P112 :named("node"))
    store_lex "$ops", $P113
.annotate 'line', 1753
    find_lex $P111, "self"
    find_lex $P112, "$node"
    $P113 = $P112."name"()
    $P114 = $P111."escape"($P113)
    store_lex "$name", $P114
.annotate 'line', 1754
    find_lex $P111, "$node"
    $P112 = $P111."namespace"()
    store_lex "$ns", $P112
.annotate 'line', 1756
    new $P111, "String"
    assign $P111, "get_global"
    store_lex "$fetchop", $P111
.annotate 'line', 1757
    new $P111, "String"
    assign $P111, "set_global"
    store_lex "$storeop", $P111
.annotate 'line', 1758
    find_lex $P111, "$name"
    new $P112, "ResizablePMCArray"
    push $P112, $P111
    store_lex "@name", $P112
.annotate 'line', 1760
    find_lex $P111, "$ns"
    defined $I101, $P111
    unless $I101, if_1851_end
.annotate 'line', 1761
    new $P112, "String"
    assign $P112, "get_hll_global"
    store_lex "$fetchop", $P112
.annotate 'line', 1762
    new $P112, "String"
    assign $P112, "set_hll_global"
    store_lex "$storeop", $P112
.annotate 'line', 1764
    find_lex $P112, "$ns"
    unless $P112, if_1852_end
.annotate 'line', 1765
    get_hll_global $P113, ["POST"], "Compiler"
    find_lex $P114, "$ns"
    $P115 = $P113."key_pir"($P114)
    store_lex "$ns", $P115
.annotate 'line', 1766
    find_lex $P113, "@name"
    find_lex $P114, "$ns"
    $P113."unshift"($P114)
  if_1852_end:
  if_1851_end:
.annotate 'line', 1770
    find_lex $P111, "$bindpost"
    unless $P111, if_1853_end
.annotate 'line', 1771
    new $P112, "Exception"
    set $P112['type'], .CONTROL_RETURN
    get_hll_global $P113, ["POST"], "Op"
    find_lex $P114, "@name"
    find_lex $P115, "$bindpost"
    find_lex $P116, "$storeop"
    find_lex $P117, "$bindpost"
    $P118 = $P113."new"($P114 :flat, $P115, $P116 :named("pirop"), $P117 :named("result"))
    setattribute $P112, 'payload', $P118
    throw $P112
  if_1853_end:
.annotate 'line', 1775
    get_hll_global $P111, ["POST"], "Op"
    find_lex $P112, "$ops"
    find_lex $P113, "@name"
    find_lex $P114, "$fetchop"
    $P115 = $P111."new"($P112, $P113 :flat, $P114 :named("pirop"))
    store_lex "$fetchop", $P115
.annotate 'line', 1776
    get_hll_global $P111, ["POST"], "Op"
    find_lex $P112, "@name"
    find_lex $P113, "$ops"
    find_lex $P114, "$storeop"
    $P115 = $P111."new"($P112 :flat, $P113, $P114 :named("pirop"))
    store_lex "$storeop", $P115
.annotate 'line', 1777
    new $P111, "Exception"
    set $P111['type'], .CONTROL_RETURN
    find_lex $P112, "self"
    find_lex $P113, "$node"
    find_lex $P114, "$ops"
    find_lex $P115, "$fetchop"
    find_lex $P116, "$storeop"
    $P117 = $P112."vivify"($P113, $P114, $P115, $P116)
    setattribute $P111, 'payload', $P117
    throw $P111
.annotate 'line', 1751
    .return ()
  control_1840:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "lexical"  :subid("100_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["PAST";"Var"],_)
    .param pmc param_1857
    .param pmc param_1858
.annotate 'file', ''
.annotate 'line', 1781
    .const 'Sub' $P1871 = "102_1313881544.08239" 
    capture_lex $P1871
    .const 'Sub' $P1863 = "101_1313881544.08239" 
    capture_lex $P1863
    new $P1856, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1856, control_1855
    push_eh $P1856
    .lex "self", self
    .lex "$node", param_1857
    .lex "$bindpost", param_1858
.annotate 'line', 1782
    new $P106, "Undef"
    set $P1859, $P106
    .lex "$name", $P1859
.annotate 'line', 1783
    new $P107, "Undef"
    set $P1860, $P107
    .lex "$isdecl", $P1860
.annotate 'line', 1782
    find_lex $P108, "self"
    find_lex $P109, "$node"
    $P110 = $P109."name"()
    $P111 = $P108."escape"($P110)
    store_lex "$name", $P111
.annotate 'line', 1783
    find_lex $P108, "$node"
    $P109 = $P108."isdecl"()
    store_lex "$isdecl", $P109
.annotate 'line', 1785
    find_lex $P109, "$isdecl"
    if $P109, if_1861
.annotate 'line', 1802
    .const 'Sub' $P1871 = "102_1313881544.08239" 
    capture_lex $P1871
    $P117 = $P1871()
    set $P108, $P117
.annotate 'line', 1785
    goto if_1861_end
  if_1861:
    .const 'Sub' $P1863 = "101_1313881544.08239" 
    capture_lex $P1863
    $P113 = $P1863()
    set $P108, $P113
  if_1861_end:
.annotate 'line', 1781
    .return ($P108)
  control_1855:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1870"  :anon :subid("102_1313881544.08239") :outer("100_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 1808
    new $P114, "Undef"
    set $P1872, $P114
    .lex "$ops", $P1872
.annotate 'line', 1809
    new $P115, "Undef"
    set $P1873, $P115
    .lex "$fetchop", $P1873
.annotate 'line', 1810
    new $P116, "Undef"
    set $P1874, $P116
    .lex "$storeop", $P1874
.annotate 'line', 1803
    find_lex $P117, "$bindpost"
    unless $P117, if_1875_end
.annotate 'line', 1804
    new $P118, "Exception"
    set $P118['type'], .CONTROL_RETURN
    get_hll_global $P119, ["POST"], "Op"
    find_lex $P120, "$name"
    find_lex $P121, "$bindpost"
    find_lex $P122, "$bindpost"
    $P123 = $P119."new"($P120, $P121, "store_lex" :named("pirop"), $P122 :named("result"))
    setattribute $P118, 'payload', $P123
    throw $P118
  if_1875_end:
.annotate 'line', 1808
    get_hll_global $P117, ["POST"], "Ops"
    find_lex $P118, "$node"
    $P119 = $P117."new"($P118 :named("node"))
    store_lex "$ops", $P119
.annotate 'line', 1809
    get_hll_global $P117, ["POST"], "Op"
    find_lex $P118, "$ops"
    find_lex $P119, "$name"
    $P120 = $P117."new"($P118, $P119, "find_lex" :named("pirop"))
    store_lex "$fetchop", $P120
.annotate 'line', 1810
    get_hll_global $P117, ["POST"], "Op"
    find_lex $P118, "$name"
    find_lex $P119, "$ops"
    $P120 = $P117."new"($P118, $P119, "store_lex" :named("pirop"))
    store_lex "$storeop", $P120
.annotate 'line', 1811
    new $P117, "Exception"
    set $P117['type'], .CONTROL_RETURN
    find_lex $P118, "self"
    find_lex $P119, "$node"
    find_lex $P120, "$ops"
    find_lex $P121, "$fetchop"
    find_lex $P122, "$storeop"
    $P123 = $P118."vivify"($P119, $P120, $P121, $P122)
    setattribute $P117, 'payload', $P123
    throw $P117
.annotate 'line', 1802
    .return ()
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1862"  :anon :subid("101_1313881544.08239") :outer("100_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 1787
    new $P110, "Undef"
    set $P1864, $P110
    .lex "$lexreg", $P1864
.annotate 'line', 1788
    new $P111, "Undef"
    set $P1865, $P111
    .lex "$ops", $P1865
.annotate 'line', 1789
    new $P112, "Undef"
    set $P1866, $P112
    .lex "$viviself", $P1866
.annotate 'line', 1787
    find_lex $P113, "self"
    $P114 = $P113."uniquereg"("P")
    store_lex "$lexreg", $P114
.annotate 'line', 1788
    get_hll_global $P113, ["POST"], "Ops"
    find_lex $P114, "$node"
    $P115 = $P113."new"($P114 :named("node"))
    store_lex "$ops", $P115
.annotate 'line', 1789
    find_lex $P113, "$node"
    $P114 = $P113."viviself"()
    store_lex "$viviself", $P114
.annotate 'line', 1791
    find_lex $P114, "$bindpost"
    isfalse $I101, $P114
    if $I101, if_1868
    new $P113, 'Integer'
    set $P113, $I101
    goto if_1868_end
  if_1868:
    find_lex $P115, "$viviself"
    set $P113, $P115
  if_1868_end:
    unless $P113, if_1867_end
.annotate 'line', 1792
    find_lex $P116, "self"
    find_lex $P117, "$viviself"
    $P118 = $P116."as_vivipost"($P117, "P" :named("rtype"))
    store_lex "$bindpost", $P118
.annotate 'line', 1793
    find_lex $P116, "$ops"
    find_lex $P117, "$bindpost"
    $P116."push"($P117)
  if_1867_end:
.annotate 'line', 1796
    find_lex $P113, "$bindpost"
    unless $P113, if_1869_end
    find_lex $P114, "$ops"
    find_lex $P115, "$lexreg"
    find_lex $P116, "$bindpost"
    $P114."push_pirop"("set", $P115, $P116)
  if_1869_end:
.annotate 'line', 1798
    find_lex $P113, "$ops"
    find_lex $P114, "$name"
    find_lex $P115, "$lexreg"
    $P113."push_pirop"(".lex", $P114, $P115)
.annotate 'line', 1799
    find_lex $P113, "$ops"
    find_lex $P114, "$lexreg"
    $P113."result"($P114)
.annotate 'line', 1800
    new $P113, "Exception"
    set $P113['type'], .CONTROL_RETURN
    find_lex $P114, "$ops"
    setattribute $P113, 'payload', $P114
    throw $P113
.annotate 'line', 1785
    .return ()
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "contextual"  :subid("103_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["PAST";"Var"],_)
    .param pmc param_1879
    .param pmc param_1880
.annotate 'file', ''
.annotate 'line', 1816
    .const 'Sub' $P1891 = "104_1313881544.08239" 
    capture_lex $P1891
    new $P1878, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1878, control_1877
    push_eh $P1878
    .lex "self", self
    .lex "$node", param_1879
    .lex "$bindpost", param_1880
.annotate 'line', 1821
    new $P106, "Undef"
    set $P1881, $P106
    .lex "$name", $P1881
.annotate 'line', 1823
    $P1883 = root_new ['parrot';'Hash']
    set $P1882, $P1883
    .lex "%symtable", $P1882
.annotate 'line', 1845
    new $P107, "Undef"
    set $P1884, $P107
    .lex "$ops", $P1884
.annotate 'line', 1846
    new $P108, "Undef"
    set $P1885, $P108
    .lex "$fetchop", $P1885
.annotate 'line', 1847
    new $P109, "Undef"
    set $P1886, $P109
    .lex "$storeop", $P1886
.annotate 'line', 1821
    find_lex $P110, "$node"
    $P111 = $P110."name"()
    store_lex "$name", $P111
.annotate 'line', 1823
    find_dynamic_lex $P110, "@*BLOCKPAST"
    unless_null $P110, vivify_402
    get_hll_global $P110, "@BLOCKPAST"
    unless_null $P110, vivify_403
    die "Contextual @*BLOCKPAST not found"
  vivify_403:
  vivify_402:
    set $P111, $P110[0]
    unless_null $P111, vivify_404
    new $P111, "Undef"
  vivify_404:
    $P112 = $P111."symtable"()
    store_lex "%symtable", $P112
.annotate 'line', 1824
    find_lex $P110, "%symtable"
    defined $I101, $P110
    unless $I101, if_1887_end
.annotate 'line', 1825
    find_lex $P111, "$name"
    find_lex $P1888, "%symtable"
    unless_null $P1888, vivify_405
    $P1888 = root_new ['parrot';'Hash']
  vivify_405:
    set $P112, $P1888[$P111]
    unless_null $P112, vivify_406
    new $P112, "Undef"
  vivify_406:
    store_lex "%symtable", $P112
.annotate 'line', 1826
    find_lex $P111, "%symtable"
    defined $I102, $P111
    unless $I102, if_1889_end
    .const 'Sub' $P1891 = "104_1313881544.08239" 
    capture_lex $P1891
    $P1891()
  if_1889_end:
  if_1887_end:
.annotate 'line', 1835
    find_lex $P110, "$node"
    $P111 = $P110."isdecl"()
    unless $P111, if_1896_end
    new $P112, "Exception"
    set $P112['type'], .CONTROL_RETURN
    find_lex $P113, "self"
    find_lex $P114, "$node"
    find_lex $P115, "$bindpost"
    $P116 = $P113."lexical"($P114, $P115)
    setattribute $P112, 'payload', $P116
    throw $P112
  if_1896_end:
.annotate 'line', 1837
    find_lex $P110, "self"
    find_lex $P111, "$name"
    $P112 = $P110."escape"($P111)
    store_lex "$name", $P112
.annotate 'line', 1839
    find_lex $P110, "$bindpost"
    unless $P110, if_1897_end
.annotate 'line', 1840
    new $P111, "Exception"
    set $P111['type'], .CONTROL_RETURN
    get_hll_global $P112, ["POST"], "Op"
    find_lex $P113, "$name"
    find_lex $P114, "$bindpost"
    find_lex $P115, "$bindpost"
    $P116 = $P112."new"($P113, $P114, "store_dynamic_lex" :named("pirop"), $P115 :named("result"))
    setattribute $P111, 'payload', $P116
    throw $P111
  if_1897_end:
.annotate 'line', 1845
    get_hll_global $P110, ["POST"], "Ops"
    find_lex $P111, "$node"
    $P112 = $P110."new"($P111 :named("node"))
    store_lex "$ops", $P112
.annotate 'line', 1846
    get_hll_global $P110, ["POST"], "Op"
    find_lex $P111, "$ops"
    find_lex $P112, "$name"
    $P113 = $P110."new"($P111, $P112, "find_dynamic_lex" :named("pirop"))
    store_lex "$fetchop", $P113
.annotate 'line', 1847
    get_hll_global $P110, ["POST"], "Op"
    find_lex $P111, "$name"
    find_lex $P112, "$ops"
    $P113 = $P110."new"($P111, $P112, "store_dynamic_lex" :named("pirop"))
    store_lex "$storeop", $P113
.annotate 'line', 1848
    find_lex $P110, "self"
    find_lex $P111, "$node"
    find_lex $P112, "$ops"
    find_lex $P113, "$fetchop"
    find_lex $P114, "$storeop"
    $P115 = $P110."vivify"($P111, $P112, $P113, $P114)
.annotate 'line', 1816
    .return ($P115)
  control_1877:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1890"  :anon :subid("104_1313881544.08239") :outer("103_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 1827
    new $P112, "Undef"
    set $P1892, $P112
    .lex "$scope", $P1892
    find_lex $P1893, "%symtable"
    unless_null $P1893, vivify_407
    $P1893 = root_new ['parrot';'Hash']
  vivify_407:
    set $P113, $P1893["scope"]
    unless_null $P113, vivify_408
    new $P113, "Undef"
  vivify_408:
    store_lex "$scope", $P113
.annotate 'line', 1828
    find_lex $P115, "$scope"
    if $P115, if_1895
    set $P114, $P115
    goto if_1895_end
  if_1895:
    find_lex $P116, "$scope"
    set $S101, $P116
    isne $I103, $S101, "contextual"
    new $P114, 'Integer'
    set $P114, $I103
  if_1895_end:
    if $P114, if_1894
    set $P113, $P114
    goto if_1894_end
  if_1894:
.annotate 'line', 1829
    new $P117, "Exception"
    set $P117['type'], .CONTROL_RETURN
    find_lex $P118, "self"
    find_lex $P119, "$node"
    find_lex $P120, "$bindpost"
    find_lex $P121, "$scope"
    set $S102, $P121
    $P122 = $P118.$S102($P119, $P120)
    setattribute $P117, 'payload', $P122
    throw $P117
  if_1894_end:
.annotate 'line', 1826
    .return ($P113)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "keyed"  :subid("105_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["PAST";"Var"],_)
    .param pmc param_1901
    .param pmc param_1902
    .param pmc param_1903 :optional
    .param int has_param_1903 :opt_flag
.annotate 'file', ''
.annotate 'line', 1852
    new $P1900, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1900, control_1899
    push_eh $P1900
    .lex "self", self
    .lex "$node", param_1901
    .lex "$bindpost", param_1902
    if has_param_1903, optparam_409
    new $P106, "Undef"
    set param_1903, $P106
  optparam_409:
    .lex "$keyrtype", param_1903
.annotate 'line', 1853

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
    
.annotate 'line', 1852
    .return ()
  control_1899:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "keyed_int"  :subid("106_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["PAST";"Var"],_)
    .param pmc param_1907
    .param pmc param_1908
.annotate 'file', ''
.annotate 'line', 1921
    new $P1906, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1906, control_1905
    push_eh $P1906
    .lex "self", self
    .lex "$node", param_1907
    .lex "$bindpost", param_1908
.annotate 'line', 1922
    find_lex $P106, "self"
    find_lex $P107, "$node"
    find_lex $P108, "$bindpost"
    $P109 = $P106."keyed"($P107, $P108, "i")
.annotate 'line', 1921
    .return ($P109)
  control_1905:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "attribute"  :subid("107_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["PAST";"Var"],_)
    .param pmc param_1912
    .param pmc param_1913
.annotate 'file', ''
.annotate 'line', 1926
    .const 'Sub' $P1926 = "108_1313881544.08239" 
    capture_lex $P1926
    new $P1911, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1911, control_1910
    push_eh $P1911
    .lex "self", self
    .lex "$node", param_1912
    .lex "$bindpost", param_1913
.annotate 'line', 1927
    new $P106, "Undef"
    set $P1914, $P106
    .lex "$ops", $P1914
.annotate 'line', 1928
    new $P107, "Undef"
    set $P1915, $P107
    .lex "$name", $P1915
.annotate 'line', 1936
    new $P108, "Undef"
    set $P1916, $P108
    .lex "$call_on", $P1916
.annotate 'line', 1937
    $P1918 = root_new ['parrot';'ResizablePMCArray']
    set $P1917, $P1918
    .lex "@attribute", $P1917
.annotate 'line', 1938
    new $P109, "Undef"
    set $P1919, $P109
    .lex "$elements", $P1919
.annotate 'line', 1959
    new $P110, "Undef"
    set $P1920, $P110
    .lex "$fetchop", $P1920
.annotate 'line', 1960
    new $P111, "Undef"
    set $P1921, $P111
    .lex "$storeop", $P1921
.annotate 'line', 1927
    get_hll_global $P112, ["POST"], "Ops"
    find_lex $P113, "$node"
    $P114 = $P112."new"($P113 :named("node"))
    store_lex "$ops", $P114
.annotate 'line', 1928
    find_lex $P112, "self"
    find_lex $P113, "$node"
    $P114 = $P113."name"()
    $P115 = $P112."escape"($P114)
    store_lex "$name", $P115
.annotate 'line', 1926
    find_lex $P112, "$call_on"
.annotate 'line', 1937
    find_lex $P112, "$name"
    new $P113, "ResizablePMCArray"
    push $P113, $P112
    store_lex "@attribute", $P113
.annotate 'line', 1938
    find_lex $P112, "$node"
    elements $I101, $P112
    new $P113, 'Integer'
    set $P113, $I101
    store_lex "$elements", $P113
.annotate 'line', 1939
    find_lex $P112, "$elements"
    set $N101, $P112
    iseq $I101, $N101, 0.0
    if $I101, if_1922
.annotate 'line', 1943
    find_lex $P113, "self"
    find_lex $P1923, "$node"
    unless_null $P1923, vivify_410
    $P1923 = root_new ['parrot';'ResizablePMCArray']
  vivify_410:
    set $P114, $P1923[0]
    unless_null $P114, vivify_411
    new $P114, "Undef"
  vivify_411:
    $P115 = $P113."as_post"($P114, "P" :named("rtype"))
    store_lex "$call_on", $P115
.annotate 'line', 1944
    find_lex $P113, "$ops"
    find_lex $P114, "$call_on"
    $P113."push"($P114)
.annotate 'line', 1945
    find_lex $P113, "$elements"
    set $N102, $P113
    iseq $I102, $N102, 2.0
    unless $I102, if_1924_end
    .const 'Sub' $P1926 = "108_1313881544.08239" 
    capture_lex $P1926
    $P1926()
  if_1924_end:
.annotate 'line', 1942
    goto if_1922_end
  if_1922:
.annotate 'line', 1940
    new $P113, "String"
    assign $P113, "self"
    store_lex "$call_on", $P113
  if_1922_end:
.annotate 'line', 1951
    find_lex $P112, "@attribute"
    find_lex $P113, "$call_on"
    $P112."unshift"($P113)
.annotate 'line', 1953
    find_lex $P112, "$bindpost"
    unless $P112, if_1929_end
.annotate 'line', 1954
    find_lex $P113, "$ops"
    find_lex $P114, "@attribute"
    find_lex $P115, "$bindpost"
    $P113."push_pirop"("setattribute", $P114 :flat, $P115)
.annotate 'line', 1955
    find_lex $P113, "$ops"
    find_lex $P114, "$bindpost"
    $P113."result"($P114)
.annotate 'line', 1956
    new $P113, "Exception"
    set $P113['type'], .CONTROL_RETURN
    find_lex $P114, "$ops"
    setattribute $P113, 'payload', $P114
    throw $P113
  if_1929_end:
.annotate 'line', 1959
    get_hll_global $P112, ["POST"], "Op"
    find_lex $P113, "$ops"
    find_lex $P114, "@attribute"
    $P115 = $P112."new"($P113, $P114 :flat, "getattribute" :named("pirop"))
    store_lex "$fetchop", $P115
.annotate 'line', 1960
    get_hll_global $P112, ["POST"], "Op"
    find_lex $P113, "@attribute"
    find_lex $P114, "$ops"
    $P115 = $P112."new"($P113 :flat, $P114, "setattribute" :named("pirop"))
    store_lex "$storeop", $P115
.annotate 'line', 1961
    find_lex $P112, "self"
    find_lex $P113, "$node"
    find_lex $P114, "$ops"
    find_lex $P115, "$fetchop"
    find_lex $P116, "$storeop"
    $P117 = $P112."vivify"($P113, $P114, $P115, $P116)
.annotate 'line', 1926
    .return ($P117)
  control_1910:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1925"  :anon :subid("108_1313881544.08239") :outer("107_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 1946
    new $P114, "Undef"
    set $P1927, $P114
    .lex "$handle", $P1927
    find_lex $P115, "self"
    find_lex $P1928, "$node"
    unless_null $P1928, vivify_412
    $P1928 = root_new ['parrot';'ResizablePMCArray']
  vivify_412:
    set $P116, $P1928[1]
    unless_null $P116, vivify_413
    new $P116, "Undef"
  vivify_413:
    $P117 = $P115."as_post"($P116, "P" :named("rtype"))
    store_lex "$handle", $P117
.annotate 'line', 1947
    find_lex $P115, "$ops"
    find_lex $P116, "$handle"
    $P115."push"($P116)
.annotate 'line', 1948
    find_lex $P115, "@attribute"
    find_lex $P116, "$handle"
    $P117 = $P115."unshift"($P116)
.annotate 'line', 1945
    .return ($P117)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "register"  :subid("109_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["PAST";"Var"],_)
    .param pmc param_1933
    .param pmc param_1934
.annotate 'file', ''
.annotate 'line', 1965
    .const 'Sub' $P1941 = "110_1313881544.08239" 
    capture_lex $P1941
    new $P1932, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1932, control_1931
    push_eh $P1932
    .lex "self", self
    .lex "$node", param_1933
    .lex "$bindpost", param_1934
.annotate 'line', 1966
    new $P106, "Undef"
    set $P1935, $P106
    .lex "$name", $P1935
.annotate 'line', 1973
    new $P107, "Undef"
    set $P1936, $P107
    .lex "$ops", $P1936
.annotate 'line', 1966
    find_lex $P108, "$node"
    $P109 = $P108."name"()
    store_lex "$name", $P109
.annotate 'line', 1968
    find_lex $P108, "$name"
    if $P108, unless_1937_end
.annotate 'line', 1969
    find_lex $P109, "self"
    $P110 = $P109."uniquereg"("P")
    store_lex "$name", $P110
.annotate 'line', 1970
    find_lex $P109, "$node"
    find_lex $P110, "$name"
    $P109."name"($P110)
  unless_1937_end:
.annotate 'line', 1973
    get_hll_global $P108, ["POST"], "Ops"
    find_lex $P109, "$name"
    find_lex $P110, "$node"
    $P111 = $P108."new"($P109 :named("result"), $P110 :named("node"))
    store_lex "$ops", $P111
.annotate 'line', 1975
    find_lex $P108, "$node"
    $P109 = $P108."isdecl"()
    unless $P109, if_1938_end
    find_lex $P110, "$ops"
    find_lex $P111, "$ops"
    $P110."push_pirop"(".local pmc", $P111)
  if_1938_end:
.annotate 'line', 1977
    find_lex $P108, "$bindpost"
    if $P108, if_1939
.annotate 'line', 1980
    .const 'Sub' $P1941 = "110_1313881544.08239" 
    capture_lex $P1941
    $P1941()
    goto if_1939_end
  if_1939:
.annotate 'line', 1978
    find_lex $P109, "$ops"
    find_lex $P110, "$ops"
    find_lex $P111, "$bindpost"
    $P109."push_pirop"("set", $P110, $P111)
  if_1939_end:
.annotate 'line', 1965
    find_lex $P108, "$ops"
    .return ($P108)
  control_1931:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1940"  :anon :subid("110_1313881544.08239") :outer("109_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 1980
    .const 'Sub' $P1945 = "111_1313881544.08239" 
    capture_lex $P1945
.annotate 'line', 1981
    new $P109, "Undef"
    set $P1942, $P109
    .lex "$viviself", $P1942
    find_lex $P110, "$node"
    $P111 = $P110."viviself"()
    store_lex "$viviself", $P111
.annotate 'line', 1982
    find_lex $P111, "$viviself"
    if $P111, if_1943
    set $P110, $P111
    goto if_1943_end
  if_1943:
    .const 'Sub' $P1945 = "111_1313881544.08239" 
    capture_lex $P1945
    $P113 = $P1945()
    set $P110, $P113
  if_1943_end:
.annotate 'line', 1980
    .return ($P110)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1944"  :anon :subid("111_1313881544.08239") :outer("110_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 1983
    new $P112, "Undef"
    set $P1946, $P112
    .lex "$vivipost", $P1946
    find_lex $P113, "self"
    find_lex $P114, "$viviself"
    $P115 = $P113."as_vivipost"($P114, "P" :named("rtype"))
    store_lex "$vivipost", $P115
.annotate 'line', 1984
    find_lex $P113, "$ops"
    find_lex $P114, "$vivipost"
    $P113."push"($P114)
.annotate 'line', 1985
    find_lex $P113, "$ops"
    find_lex $P114, "$ops"
    find_lex $P115, "$vivipost"
    $P116 = $P113."push_pirop"("set", $P114, $P115)
.annotate 'line', 1982
    .return ($P116)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("112_1313881544.08239") :method :outer("11_1313881544.08239") :multi(_,["PAST";"Val"])
    .param pmc param_1950
    .param pmc param_1951 :slurpy :named
.annotate 'file', ''
.annotate 'line', 2001
    .const 'Sub' $P1962 = "113_1313881544.08239" 
    capture_lex $P1962
    new $P1949, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1949, control_1948
    push_eh $P1949
    .lex "self", self
    .lex "$node", param_1950
    .lex "%options", param_1951
.annotate 'line', 2002
    new $P106, "Undef"
    set $P1952, $P106
    .lex "$ops", $P1952
.annotate 'line', 2004
    new $P107, "Undef"
    set $P1953, $P107
    .lex "$value", $P1953
.annotate 'line', 2017
    new $P108, "Undef"
    set $P1954, $P108
    .lex "$returns", $P1954
.annotate 'line', 2020
    new $P109, "Undef"
    set $P1955, $P109
    .lex "$valflags", $P1955
.annotate 'line', 2035
    new $P110, "Undef"
    set $P1956, $P110
    .lex "$rtype", $P1956
.annotate 'line', 2048
    new $P111, "Undef"
    set $P1957, $P111
    .lex "$result", $P1957
.annotate 'line', 2002
    get_hll_global $P112, ["POST"], "Ops"
    find_lex $P113, "$node"
    $P114 = $P112."new"($P113 :named("node"))
    store_lex "$ops", $P114
.annotate 'line', 2004
    find_lex $P1958, "$node"
    unless_null $P1958, vivify_414
    $P1958 = root_new ['parrot';'Hash']
  vivify_414:
    set $P112, $P1958["value"]
    unless_null $P112, vivify_415
    new $P112, "Undef"
  vivify_415:
    store_lex "$value", $P112
.annotate 'line', 2005
    find_lex $P112, "$value"
    defined $I101, $P112
    if $I101, unless_1959_end
.annotate 'line', 2006
    find_lex $P113, "self"
    $P113."panic"("PAST::Val node missing :value attribute")
  unless_1959_end:
.annotate 'line', 2008
    get_hll_global $P112, ["PAST"], "Block"
    find_lex $P113, "$value"
    $P114 = $P112."ACCEPTS"($P113)
    unless $P114, if_1960_end
    .const 'Sub' $P1962 = "113_1313881544.08239" 
    capture_lex $P1962
    $P1962()
  if_1960_end:
.annotate 'line', 2017
    find_lex $P1965, "$node"
    unless_null $P1965, vivify_416
    $P1965 = root_new ['parrot';'Hash']
  vivify_416:
    set $P112, $P1965["returns"]
    unless_null $P112, vivify_417
    new $P112, "Undef"
  vivify_417:
    store_lex "$returns", $P112
.annotate 'line', 2018
    find_lex $P112, "$returns"
    if $P112, unless_1966_end
    find_lex $P113, "$value"
    typeof $S101, $P113
    new $P114, 'String'
    set $P114, $S101
    store_lex "$returns", $P114
  unless_1966_end:
.annotate 'line', 2020
    find_lex $P112, "$returns"
    get_global $P1967, "%valflags"
    unless_null $P1967, vivify_418
    $P1967 = root_new ['parrot';'Hash']
  vivify_418:
    set $P113, $P1967[$P112]
    unless_null $P113, vivify_419
    new $P113, "Undef"
  vivify_419:
    store_lex "$valflags", $P113
.annotate 'line', 2021
    find_lex $P112, "$valflags"
    set $S101, $P112
    index $I101, $S101, "e"
    set $N101, $I101
    isge $I102, $N101, 0.0
    unless $I102, if_1968_end
    find_lex $P113, "self"
    find_lex $P114, "$value"
    $P115 = $P113."escape"($P114)
    store_lex "$value", $P115
  if_1968_end:
.annotate 'line', 2024
    find_lex $P112, "$valflags"
    set $S101, $P112
    index $I101, $S101, "c"
    set $N101, $I101
    isge $I102, $N101, 0.0
    unless $I102, if_1969_end
.annotate 'line', 2026
    find_lex $P113, "$returns"
    set $S102, $P113
    isne $I103, $S102, "!macro_const"
    unless $I103, if_1970_end
.annotate 'line', 2027
    find_dynamic_lex $P114, "$*SUB"
    unless_null $P114, vivify_420
    get_hll_global $P114, "$SUB"
    unless_null $P114, vivify_421
    die "Contextual $*SUB not found"
  vivify_421:
  vivify_420:
.annotate 'line', 2028
    find_lex $P115, "$returns"
    set $S103, $P115
    replace $S104, $S103, 0, 1, ".include \""
    new $P116, 'String'
    set $P116, $S104
    concat $P117, $P116, ".pasm\""
    $P114."add_directive"($P117)
  if_1970_end:
.annotate 'line', 2032
    find_lex $P113, "$value"
    set $S102, $P113
    substr $S103, $S102, 0, 1
    iseq $I103, $S103, "."
    if $I103, unless_1971_end
    new $P114, "String"
    assign $P114, "."
    find_lex $P115, "$value"
    concat $P116, $P114, $P115
    store_lex "$value", $P116
  unless_1971_end:
  if_1969_end:
.annotate 'line', 2035
    find_lex $P1972, "%options"
    unless_null $P1972, vivify_422
    $P1972 = root_new ['parrot';'Hash']
  vivify_422:
    set $P112, $P1972["rtype"]
    unless_null $P112, vivify_423
    new $P112, "Undef"
  vivify_423:
    store_lex "$rtype", $P112
.annotate 'line', 2036
    find_lex $P112, "$valflags"
    set $S101, $P112
    find_lex $P113, "$rtype"
    set $S102, $P113
    index $I101, $S101, $S102
    set $N101, $I101
    isge $I102, $N101, 0.0
    unless $I102, if_1973_end
.annotate 'line', 2037
    find_lex $P114, "$ops"
    find_lex $P115, "$value"
    $P114."result"($P115)
.annotate 'line', 2038
    new $P114, "Exception"
    set $P114['type'], .CONTROL_RETURN
    find_lex $P115, "$ops"
    setattribute $P114, 'payload', $P115
    throw $P114
  if_1973_end:
.annotate 'line', 2042
    find_lex $P113, "$rtype"
    set $S101, $P113
    iseq $I101, $S101, "n"
    if $I101, if_1975
    new $P112, 'Integer'
    set $P112, $I101
    goto if_1975_end
  if_1975:
    find_lex $P114, "$valflags"
    set $S102, $P114
    index $I102, $S102, "i"
    set $N101, $I102
    isge $I103, $N101, 0.0
    new $P112, 'Integer'
    set $P112, $I103
  if_1975_end:
    unless $P112, if_1974_end
.annotate 'line', 2043
    find_lex $P115, "$value"
    concat $P116, $P115, ".0"
    store_lex "$value", $P116
.annotate 'line', 2044
    find_lex $P115, "$ops"
    find_lex $P116, "$value"
    $P115."result"($P116)
.annotate 'line', 2045
    new $P115, "Exception"
    set $P115['type'], .CONTROL_RETURN
    find_lex $P116, "$ops"
    setattribute $P115, 'payload', $P116
    throw $P115
  if_1974_end:
.annotate 'line', 2048
    find_lex $P112, "self"
    $P113 = $P112."tempreg"("P")
    store_lex "$result", $P113
.annotate 'line', 2049
    find_lex $P112, "self"
    find_lex $P113, "$returns"
    $P114 = $P112."escape"($P113)
    store_lex "$returns", $P114
.annotate 'line', 2050
    find_lex $P112, "$ops"
    find_lex $P113, "$result"
    find_lex $P114, "$returns"
    $P112."push_pirop"("new", $P113, $P114)
.annotate 'line', 2051
    find_lex $P112, "$ops"
    find_lex $P113, "$result"
    find_lex $P114, "$value"
    $P112."push_pirop"("assign", $P113, $P114)
.annotate 'line', 2052
    find_lex $P112, "$ops"
    find_lex $P113, "$result"
    $P112."result"($P113)
.annotate 'line', 2001
    find_lex $P112, "$ops"
    .return ($P112)
  control_1948:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P113, exception, "payload"
    .return ($P113)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1961"  :anon :subid("113_1313881544.08239") :outer("112_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 2009
    new $P115, "Undef"
    set $P1963, $P115
    .lex "$blockreg", $P1963
.annotate 'line', 2010
    new $P116, "Undef"
    set $P1964, $P116
    .lex "$blockref", $P1964
.annotate 'line', 2009
    find_lex $P117, "self"
    $P118 = $P117."uniquereg"("P")
    store_lex "$blockreg", $P118
.annotate 'line', 2010
    new $P117, 'String'
    set $P117, ".const 'Sub' "
    find_lex $P118, "$blockreg"
    concat $P119, $P117, $P118
    concat $P120, $P119, " = "
    store_lex "$blockref", $P120
.annotate 'line', 2011
    find_lex $P117, "$blockref"
    find_lex $P118, "self"
    find_lex $P119, "$value"
    $P120 = $P119."subid"()
    set $S101, $P120
    $S102 = $P118."escape"($S101)
    concat $P121, $P117, $S102
    store_lex "$blockref", $P121
.annotate 'line', 2012
    find_lex $P117, "$ops"
    find_lex $P118, "$blockref"
    $P117."push_pirop"($P118)
.annotate 'line', 2013
    find_lex $P117, "$ops"
    find_lex $P118, "$blockreg"
    $P117."result"($P118)
.annotate 'line', 2014
    new $P117, "Exception"
    set $P117['type'], .CONTROL_RETURN
    find_lex $P118, "$ops"
    setattribute $P117, 'payload', $P118
    throw $P117
.annotate 'line', 2008
    .return ()
.end


.namespace ["PAST";"Compiler"]
.sub "_block1977" :load :anon :subid("114_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 41
    .const 'Sub' $P1979 = "11_1313881544.08239" 
    $P106 = $P1979()
    .return ($P106)
.end


.namespace []
.sub "_block2071" :load :anon :subid("115_1313881544.08239")
.annotate 'file', ''
.annotate 'line', 1
    .const 'Sub' $P2073 = "10_1313881544.08239" 
    $P101 = $P2073()
    .return ($P101)
.end

